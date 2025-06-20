Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3254C2ECEB8;
	Fri, 20 Jun 2025 19:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750447752; cv=none; b=ICKjbdxCf1yl3OSexTAvbCo4vgJKrU8EUFPEUxERTCRZdOVMzi+si0qdmsEaYdlvecnihNb3D7R/mvVSiQESgyvCuoGliZuUtSrafABxMfQK8kHP1SIiMedlLF/ZFxSIm57QanXu+K1ITbpfaIAIzpgN+EmtaeRT69N7w2xHOlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750447752; c=relaxed/simple;
	bh=t+QuqQ+qtw3HRlrQJM9FCveIvct5aAupfcpOJz1MILA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mpnXkMh5e8UsuOgrTnLP/3JExYfvHu81Czz+KkBqa28nZDP/aVrWhHQwS792UWdyxhg5MFv10Zr6br4ZrNJOkKw2RD3nsNkwvTsAR0IR+TjRj2kVSG8fxXY/zvz6broy2c/tfk8nJ/16jwVb6xzuN6rqiCx1HL1zfmgYGSX9lBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28A8816A3;
	Fri, 20 Jun 2025 12:28:51 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6390F3F673;
	Fri, 20 Jun 2025 12:29:08 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [RFC PATCH 7/7] firmware: arm_scmi: Use new Telemetry traces
Date: Fri, 20 Jun 2025 20:28:13 +0100
Message-ID: <20250620192813.2463367-8-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250620192813.2463367-1-cristian.marussi@arm.com>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Track failed SHMTI accesses and notification updates.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/telemetry.c | 35 +++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 3cbad06251a9..7843ff802bd0 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -16,6 +16,8 @@
 #include "protocols.h"
 #include "notify.h"
 
+#include <trace/events/scmi.h>
+
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
 
@@ -813,8 +815,10 @@ static int scmi_telemetry_tdcf_parse_one(struct telemetry_info *ti,
 	int used_qwords;
 
 	de = xa_load(&ti->xa_des, le32_to_cpu(payld->id));
-	if (!de || DATA_INVALID(payld))
+	if (!de || DATA_INVALID(payld)) {
+		trace_scmi_tlm_access(de->id, "DE_INVALID", 0, 0);
 		return -EINVAL;
+	}
 
 	used_qwords = 4;
 
@@ -840,6 +844,8 @@ static int scmi_telemetry_tdcf_parse_one(struct telemetry_info *ti,
 	else
 		tde->last_ts = 0;
 
+	trace_scmi_tlm_collect(0, de->id, tde->last_val, "SHMTI_UPDATE");
+
 	return used_qwords;
 }
 
@@ -864,8 +870,10 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * 1000);
 
 		startm = TDCF_START_SEQ_GET(tdcf);
-		if (IS_BAD_START_SEQ(startm))
+		if (IS_BAD_START_SEQ(startm)) {
+			trace_scmi_tlm_access(0, "MSEQ_BADSTART", startm, 0);
 			continue;
+		}
 
 		qwords = tdcf->prlg.num_qwords;
 		next = tdcf->payld;
@@ -874,14 +882,18 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 
 			used_qwords = scmi_telemetry_tdcf_parse_one(ti, next,
 								    update ? shmti : NULL);
-			if (qwords < used_qwords)
+			if (qwords < used_qwords) {
+				trace_scmi_tlm_access(0, "BAD_QWORDS", 0, 0);
 				return -EINVAL;
+			}
 
 			next += used_qwords * 4;
 			qwords -= used_qwords;
 		}
 
 		endm = TDCF_END_SEQ_GET(eplg);
+		if (startm != endm)
+			trace_scmi_tlm_access(0, "MSEQ_MISMATCH", startm, endm);
 	} while (startm != endm && --retries);
 
 	if (startm != endm)
@@ -1252,12 +1264,17 @@ static int scmi_telemetry_de_tdcf_parse(struct telemetry_de *tde,
 		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * 1000);
 
 		startm = TDCF_START_SEQ_GET(tdcf);
-		if (IS_BAD_START_SEQ(startm))
+		if (IS_BAD_START_SEQ(startm)) {
+			trace_scmi_tlm_access(tde->de.id, "MSEQ_BADSTART",
+					      startm, 0);
 			continue;
+		}
 
 		payld = tde->base + tde->offset;
-		if (le32_to_cpu(payld->id) != tde->de.id || DATA_INVALID(payld))
+		if (le32_to_cpu(payld->id) != tde->de.id || DATA_INVALID(payld)) {
+			trace_scmi_tlm_access(tde->de.id, "DE_INVALID", 0, 0);
 			return -EINVAL;
+		}
 
 		//TODO BLK_TS
 		if (tstamp && USE_LINE_TS(payld) && TS_VALID(payld))
@@ -1266,6 +1283,9 @@ static int scmi_telemetry_de_tdcf_parse(struct telemetry_de *tde,
 		*val = LINE_DATA_GET(&payld->tsl);
 
 		endm = TDCF_END_SEQ_GET(tde->eplg);
+		if (startm != endm)
+			trace_scmi_tlm_access(tde->de.id, "MSEQ_MISMATCH",
+					      startm, endm);
 	} while (startm != endm && --retries);
 
 	if (startm != endm)
@@ -1412,6 +1432,9 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
 			tde->last_ts = LINE_TSTAMP_GET(&payld->tsl);
 		else
 			tde->last_ts = 0;
+
+		trace_scmi_tlm_collect(timestamp, tde->de.id, tde->last_val,
+				       "MESSAGE");
 	}
 }
 
@@ -1622,6 +1645,8 @@ static void scmi_telemetry_scan_update(struct telemetry_info *ti, u64 ts)
 			tde->last_ts = tstamp;
 		else
 			tde->last_ts = 0;
+
+		trace_scmi_tlm_collect(ts, de->id, tde->last_val, "FC_UPDATE");
 	}
 }
 
-- 
2.47.0


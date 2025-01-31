Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11EC482EB
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738354896; cv=none; b=aYGtT9oBGw8wjJzKgXxuzJeSamN3kc1Pc+4ld/6t/U59YlMDmjvq5pa/YRNhVzRH63SE9KcYB3c8j57/TgWl8NIWNW8IqB+2OPOJo4t/W+y+uqg3D/rsI0SV6WKbZaNHdB1gJxPx6ap1SMB98gBGfcsB7h/7S2yY6MlPRbXg8KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738354896; c=relaxed/simple;
	bh=e2TVzUbRqBCxTVqTlfUdnaIbDJGEbaayIa/i2ReZiNw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kDaYNDAcKGKyvX+JW2Ci0ilCOO3fP65DVC+CmFCGezvWPqh9mzxYuEy7sUTnyfPdaxtcGJQAHg2ZJyU0IQAv+IHGCwULnNCc2/1bqqo3u22pAJtDkEuW9+8/GXSVyB9xW7W0sQCoOIvpnRP1UkoA1Impv5HZMx7osBCeBDxTXoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SM0WA340; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SM0WA340"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VCpwdJ007475
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:01:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=iwVGm2zIZxv30QAxGxxXgudWn5/8W/GZ/AyWJMQKILI=; b=
	SM0WA340q0EOqOABfoY8AD0ecRCH6Fe2syLBEUrKWBhtD11DMWuPkwqV6STd5tW2
	AQPJsHpww8yGvU8BZh0zyMmiz9tcmkt6xFPxt8+gQXRLfBIKrFX1X7q6/fY/EAaG
	GjB1H2AFKhBNaVAMz4Ym/pWCM5gZQFTBarejSoKSZkUP4gwuqZrqD1NHzbvlkSXH
	zqdfE8fCERww/u6lKkcUmuhqktnmoAKKTIYMx6f3vavTS9np+F9Pj9Naaouu7Xr3
	6q+0HLVAhMLs1I/TUYlt/s37eHrOn5dKJF5si+1g3Y3JHk0hodCZzbMWPtX4KLf2
	7H1ZzkyIgPuuit6C8btVzQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 44gf8n15rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:01:07 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 31 Jan
 2025 20:01:05 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Fri, 31 Jan 2025 20:01:05 +0000
Received: from ftrev.crystal.cirrus.com (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 649A282026C;
	Fri, 31 Jan 2025 20:01:04 +0000 (UTC)
From: Fred Treven <ftreven@opensource.cirrus.com>
To: Simon Trimmer <simont@opensource.cirrus.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
CC: Fred Treven <ftreven@opensource.cirrus.com>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/7] firmware: cs_dsp: Fix error checking in wseq_write()
Date: Fri, 31 Jan 2025 13:56:32 -0600
Message-ID: <20250131195639.1784933-2-ftreven@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131195639.1784933-1-ftreven@opensource.cirrus.com>
References: <20250131195639.1784933-1-ftreven@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: SO9d_BmGw6uZQd4JAygFBUUPP-jW7Hvz
X-Authority-Analysis: v=2.4 cv=YOxlyQGx c=1 sm=1 tr=0 ts=679d2c03 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=VdSt8ZQiCzkA:10 a=w1d2syhTAAAA:8 a=b0R_zkI-s6yCh7IOb7YA:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: SO9d_BmGw6uZQd4JAygFBUUPP-jW7Hvz
X-Proofpoint-Spam-Reason: safe

cs_dsp_coeff_write_ctrl() may return a non-zero value (1)
upon success. Change error checking in the write sequencer
code such that it checks for negative errnos rather than
any non-zero value when using this function.

Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 5365e9a43000..56315b0b5583 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -3702,7 +3702,7 @@ int cs_dsp_wseq_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
 
 		ret = cs_dsp_coeff_write_ctrl(wseq->ctl, op_end->offset / sizeof(u32),
 					      &op_end->data, sizeof(u32));
-		if (ret)
+		if (ret < 0)
 			goto op_new_free;
 
 		list_add_tail(&op_new->list, &op_end->list);
@@ -3710,7 +3710,7 @@ int cs_dsp_wseq_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
 
 	ret = cs_dsp_coeff_write_ctrl(wseq->ctl, op_new->offset / sizeof(u32),
 				      words, new_op_size);
-	if (ret)
+	if (ret < 0)
 		goto op_new_free;
 
 	return 0;
-- 
2.34.1


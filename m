Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03789BA27;
	Sun,  8 Jun 2025 01:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749345940; cv=none; b=u6qhPBzJD+shJ/UaAH4PbE4dNSaVknCXecV+ipi3fEkyys+nC1uSDuTeip1xZODv+SlwzMeWNEq5Kw+UN+Q3w3iJOhoZ6lcelpUW9nLQq9tTLDydMuegDTqYGCztdGFpx7IV6vV6T/wPsmwV7Ko+uxwEhULajBeTz+wdDKaz0Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749345940; c=relaxed/simple;
	bh=0YUKrUynV6vU5tGY0vHhfX7mN3CW+H3YNEBxP3RjGk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YE6Mi+mXz52mWMwH2S39dddbAJ6/2FqrLR1QHAfYrIMYt/bXdpxb8COGfdavxMzxuguCML72UCiIRxqy+4w8xfxlOjjJA01MfLNvThw3FUyQu2pIIVt8xnUmGuDIrGV/ZiycjBj/l/JWkNKonhPFGJfn9Egrl3sQCWtNMY+cbj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=YyXBIX0N; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="YyXBIX0N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=lsYaog1HzQES+8YAX8AuY2m8sh1Bobp+Ncwbdrkz51g=; b=YyXBIX0N03HIb8uZ
	FgzNyAcxcqjmsGSNjnQkbvHpxezVpktnysxauri9PRTthKHgvAhVXSmdITDrg4wnzG1GONRSssAy1
	csGdTWNky8hiI9DFTHcHW5vXamwmnva/jk4sXGgb+J94i4VVnPq8izQHc7facn6P4WXQbRaP8+PKA
	Y7zDE3pHucKibJtvQXReocU++Kb5h0c83vYwF1Klrz756TfSzHxsZe9GMGHUpZBfnBAXtHxFFkTKE
	JvS83ew9EeuiFYDmwbLk0oxE1CUE2FaXba1TYzbyvhZXndCn8cMQnd9/ddhHz6DMXMAlKFSmnHjYe
	sIN61RD7V0BeBh0OTg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uO4mg-008Dyl-2E;
	Sun, 08 Jun 2025 01:25:14 +0000
From: linux@treblig.org
To: irenic.rajneesh@gmail.com,
	david.e.box@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	platform-driver-x86@vger.kernel.org,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/3] platform/x86: intel_telemetry: Remove unused telemetry_raw_read_events
Date: Sun,  8 Jun 2025 02:25:12 +0100
Message-ID: <20250608012512.377134-4-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608012512.377134-1-linux@treblig.org>
References: <20250608012512.377134-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

telemetry_raw_read_events() was added in 2016's
commit 378f956e3f93 ("platform/x86: Add Intel Telemetry Core Driver")
but have remained unused.

Unlike the others in this set, it's wrapper calls into a pointer
also used by another entry, so it's only the entry wrapper that's
unused.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 arch/x86/include/asm/intel_telemetry.h      |  3 ---
 drivers/platform/x86/intel/telemetry/core.c | 19 -------------------
 2 files changed, 22 deletions(-)

diff --git a/arch/x86/include/asm/intel_telemetry.h b/arch/x86/include/asm/intel_telemetry.h
index e7fb005ac8d8..944637a4e6de 100644
--- a/arch/x86/include/asm/intel_telemetry.h
+++ b/arch/x86/include/asm/intel_telemetry.h
@@ -87,9 +87,6 @@ int telemetry_get_evtname(enum telemetry_unit telem_unit,
 int telemetry_read_events(enum telemetry_unit telem_unit,
 			  struct telemetry_evtlog *evtlog, int len);
 
-int telemetry_raw_read_events(enum telemetry_unit telem_unit,
-			      struct telemetry_evtlog *evtlog, int len);
-
 int telemetry_read_eventlog(enum telemetry_unit telem_unit,
 			    struct telemetry_evtlog *evtlog, int len);
 
diff --git a/drivers/platform/x86/intel/telemetry/core.c b/drivers/platform/x86/intel/telemetry/core.c
index fe9e8580a8f5..f312864b8d07 100644
--- a/drivers/platform/x86/intel/telemetry/core.c
+++ b/drivers/platform/x86/intel/telemetry/core.c
@@ -72,25 +72,6 @@ int telemetry_read_events(enum telemetry_unit telem_unit,
 }
 EXPORT_SYMBOL_GPL(telemetry_read_events);
 
-/**
- * telemetry_raw_read_events() - Fetch samples specified by evtlog.telem_evt_id
- * @telem_unit: Specify whether IOSS or PSS Read
- * @evtlog:	Array of telemetry_evtlog structs to fill data
- *		evtlog.telem_evt_id specifies the ids to read
- * @len:	Length of array of evtlog
- *
- * The caller must take care of locking in this case.
- *
- * Return: number of eventlogs read for success, < 0 for failure
- */
-int telemetry_raw_read_events(enum telemetry_unit telem_unit,
-			      struct telemetry_evtlog *evtlog, int len)
-{
-	return telm_core_conf.telem_ops->raw_read_eventlog(telem_unit, evtlog,
-							   len, 0);
-}
-EXPORT_SYMBOL_GPL(telemetry_raw_read_events);
-
 /**
  * telemetry_read_eventlog() - Fetch the Telemetry log from PSS or IOSS
  * @telem_unit: Specify whether IOSS or PSS Read
-- 
2.49.0


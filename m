Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E30748D;
	Wed,  7 May 2025 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.248.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612288; cv=none; b=W37YJjHvPkWzAGcgGHxhdungEkDALxx2evCsfh8pqwSxCZvUScDVk4j6UtANTM/6rDCX/Q+SSRRpRHS4RDkuOICx1uSDeXMNbfNz8t/LeVoba7JxXDnXjv5wFeT4PAGU7CdBF2JCp37jR+iCXexeqw3n2gHEFpW1ri3YCTS+O5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612288; c=relaxed/simple;
	bh=mmFmsqM7Nq7w8TVg8U3Rogh4VyZckeHRwu9Hsc96wPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qp57OErttkW1i+WmjSr517pt1+cAwyTXMFmZjExayUcz6sS3yApo5YOHmWxyNRFqHpr90uAJjXiR4FrU54GsjkSimfC4eTW2w+KT6wWTk9ZPIOrh0RUVkoSnqldHFbKyo5BxHff7keSm+InqMyMUX98PK1owN/wimIUAm7EPn+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=mxAeDq6Q; arc=none smtp.client-ip=159.100.248.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="mxAeDq6Q"
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [149.56.97.132])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id C9E6A2634A;
	Wed,  7 May 2025 10:04:43 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id 363933EBDC;
	Wed,  7 May 2025 10:04:36 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 40101400CD;
	Wed,  7 May 2025 10:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1746612275; bh=mmFmsqM7Nq7w8TVg8U3Rogh4VyZckeHRwu9Hsc96wPQ=;
	h=From:To:Cc:Subject:Date:From;
	b=mxAeDq6QxdoymKp2Jk5R5qeSYKbrNDAoqW/k9L6ABkSfPd/EQb/RjNne0hUHqDstk
	 n1OzJmRdXny2UfrV0wjEn4XGiIyd2z6GBUWtJPpO7/LpoFQ/F5lTKfzX4raxNWBDyn
	 ke/CtQdMOtS6bA2AEPIscYxPrEfO2o5gh7g3Ek80=
Received: from hrh-ofice.wok.cipunited.com (unknown [60.247.127.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 35131409D2;
	Wed,  7 May 2025 10:04:30 +0000 (UTC)
From: Runhua He <hua@aosc.io>
To: platform-driver-x86@vger.kernel.org
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Rong Zhang <i@rong.moe>,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Runhua He <hua@aosc.io>,
	Xinhui Yang <cyan@cyano.uk>,
	Yemu Lu <prcups@krgm.moe>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86/amd/pmc: Declare quirk_spurious_8042 for MECHREVO Wujie 14XA (GX4HRXL)
Date: Wed,  7 May 2025 18:01:03 +0800
Message-ID: <20250507100103.995395-1-hua@aosc.io>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Queue-Id: 40101400CD
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.50 / 10.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	SUBJECT_RANDOM_CHARS_1(0.10)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[prcups.krgm.moe:server fail,cyan.cyano.uk:server fail,i.rong.moe:server fail,jeffbai.aosc.io:server fail,hua.aosc.io:server fail,mario.limonciello.amd.com:server fail];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]

MECHREVO Wujie 14XA (GX4HRXL) wakes up immediately after s2idle entry.
This happens regardless of whether the laptop is plugged into AC power,
or whether any peripheral is plugged into the laptop.

Similar to commit a55bdad5dfd1 ("platform/x86/amd/pmc: Disable keyboard
wakeup on AMD Framework 13"), the MECHREVO Wujie 14XA wakes up almost
instantly after s2idle suspend entry (IRQ1 is the keyboard):

2025-04-18 17:23:57,588 DEBUG:  PM: Triggering wakeup from IRQ 9
2025-04-18 17:23:57,588 DEBUG:  PM: Triggering wakeup from IRQ 1

Add this model to the spurious_8042 quirk to workaround this.

This patch does not affect the wake-up function of the built-in keyboard.
Because the firmware of this machine adds an insurance for keyboard
wake-up events, as it always triggers an additional IRQ 9 to wake up the
system.

Suggested-by: Mingcong Bai <jeffbai@aosc.io>
Suggested-by: Xinhui Yang <cyan@cyano.uk>
Suggested-by: Rong Zhang <i@rong.moe>
Fixes: a55bdad5dfd1 ("platform/x86/amd/pmc: Disable keyboard wakeup on AMD Framework 13")
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4166
Cc: Mario Limonciello <mario.limonciello@amd.com>
Link: https://zhuanldan.zhihu.com/p/730538041
Tested-by: Yemu Lu <prcups@krgm.moe>
Signed-off-by: Runhua He <hua@aosc.io>

---
Changes in v2:
- Match quirk to precise motherboard models to avoid false positives.
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index b4f49720c87f..2e3f6fc67c56 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -217,6 +217,13 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_BIOS_VERSION, "03.05"),
 		}
 	},
+	{
+		.ident = "MECHREVO Wujie 14X (GX4HRXL)",
+		.driver_data = &quirk_spurious_8042,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "WUJIE14-GX4HRXL"),
+		}
+	},
 	{}
 };
 
-- 
2.49.0


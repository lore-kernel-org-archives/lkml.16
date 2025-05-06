Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com [51.81.35.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AEE4A02;
	Tue,  6 May 2025 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.81.35.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531261; cv=none; b=Z2jjyUxs4YGzevL3/1DO1C3a8zzyMIS5239bC8RkZ/dRggGlQYHWgek6HPDZ+R+XYmf9VNu5LFmm3tyCjWFfVOKkr50lRPHR810c+mn+pgv5mwOWCMIhqLuK9MPyFvXARzCJCYEc+p5f4+RGkbQyBQUEZKmcEVnegi+66bjWcoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531261; c=relaxed/simple;
	bh=q3o6m0pOjkQImRnsSz5764kRnkFOOPyIkrImNo7qqfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WO46dJeEZNnM08hTeP6JKiSExj+onFRKcHylqQDeNMGBCpdFhLv70gpD6O94gcyeZw9NtE/CYwy2SRf83NEumoeIT7mqUoQx4NTsolNucwxXRu9/i/2sF2zHNH2/QLmwfiy4mFwxP0FhchPJ8n0oLUTU4KmPir7CnNW5vOE/ilI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=ZoAppQe+; arc=none smtp.client-ip=51.81.35.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="ZoAppQe+"
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 32BA5214F3;
	Tue,  6 May 2025 11:25:43 +0000 (UTC)
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.155])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id C114F20063;
	Tue,  6 May 2025 11:25:34 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id 12B8A202D8;
	Tue,  6 May 2025 11:25:27 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 49D00400CE;
	Tue,  6 May 2025 11:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1746530726; bh=q3o6m0pOjkQImRnsSz5764kRnkFOOPyIkrImNo7qqfg=;
	h=From:To:Cc:Subject:Date:From;
	b=ZoAppQe+DJEV1JsU+p4RplxUu1u9r8LDPQeuUmj2mX76vYYDVttKAjeR0nEnUrj0L
	 aYeJRern2GdIt/kAqFgSCm463XFmsh+CcNeBB7/Jd7CuUMTAZVPbNq2j9i7ByjAxul
	 zkOoKZ9p867mI7OV/kwtV/doc+2dzpMgu0/6XCig=
Received: from hrh-ofice.wok.cipunited.com (unknown [60.247.127.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 1F23C408FA;
	Tue,  6 May 2025 11:25:21 +0000 (UTC)
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
Subject: [PATCH] platform/x86/amd/pmc: Declare quirk_spurious_8042 for MECHREVO Wujie 14XA (GX4HRXL)
Date: Tue,  6 May 2025 19:25:14 +0800
Message-ID: <20250506112514.446784-1-hua@aosc.io>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Queue-Id: 49D00400CE
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
	SPFBL_URIBL_EMAIL_FAIL(0.00)[hua.aosc.io:server fail,cyan.cyano.uk:server fail,jeffbai.aosc.io:server fail,i.rong.moe:server fail,prcups.krgm.moe:server fail,mario.limonciello.amd.com:server fail];
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

I have only matched the motherboard model, as the same chassis and
motherboard (GX4HRXL) combination may be used under different product
names.

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
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index b4f49720c87f..e01012d5ecd0 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -217,6 +217,13 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_BIOS_VERSION, "03.05"),
 		}
 	},
+	{
+		.ident = "MECHREVO Wujie 14 Series (GX4HRXL)",
+		.driver_data = &quirk_spurious_8042,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GX4HRXL"),
+		}
+	},
 	{}
 };
 
-- 
2.49.0


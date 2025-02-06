Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4068D1A9B3B;
	Thu,  6 Feb 2025 19:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738870818; cv=none; b=u9XnGq+M5KGVAqMPOnr7H+fWDMrxegVk6kNITE6h5W7Gpgv1IP9KTS6N8EDrBuL9KFi6VucmcD16ZD7Cj0OYX7ECsG0AtreUOQRY3cMOvQZDIZk+i4kqRChqqBpXmgK/wuncZj2OuqhK40tJ5SgzTMi5O2Uu3sgvYLdslmNpFJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738870818; c=relaxed/simple;
	bh=qrsn9zVKWwRovi9RIRnvia4cwbugC8QEz5mbs6fjMHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wi3aEUnkJ7zqmbyrittSYdnhaOPDuMmJA1x4EUnQZ8D9S3DBBHtHF6OSFP9DQznx7PCO68f1crCv5BeB78BcuoS9LI1VC+cYswBomNZmaIXd9xdlXogrzcs9KVSHivxuCwtMgs2JxLCQPdouiMU8CXsLZj3HvnuU+N0+1wmAoNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=nARwccAx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=otK2CXBw; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="nARwccAx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="otK2CXBw"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1A9E1114022E;
	Thu,  6 Feb 2025 14:40:13 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Thu, 06 Feb 2025 14:40:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1738870813; x=
	1738957213; bh=nKKMpkPQ7TxDzNtIBSN1wCZCkjwPSOwtVho/zkZsHWE=; b=n
	ARwccAxOFNzQCv8UucPOYpHPEVEb77zbDvwpB2N9pNBMeKYNLMvGxK/uQtopOMcB
	jSRQLr/aDki3XkP6tGvSo4RvAX5CVazWzfkQB8qccAHENpaoZz6A/ak6UMDHPL4S
	/DzIe6L9WYMUU+ojjVta/0W0rhBOdzg3h7X8UYLuFPqvkf/Lvt4C13hojpi6hqBN
	FOwKxtUSB60ZmeaaT1hgEpFqJU7KntKRJ3n8F0Gko3DVqejVaWUEOPV5T2nBFLW3
	3QT+xikdtVYeQn4W+fZrMSHYoddsNbKQiXsMIxIyMqo2jpyOSrEYjUBdcuXdIvKP
	S2yGM59qwlDW+4lIXmyXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1738870813; x=1738957213; bh=n
	KKMpkPQ7TxDzNtIBSN1wCZCkjwPSOwtVho/zkZsHWE=; b=otK2CXBw/hFjz0Zp5
	KjAkOPSvT5ZEQkIURSxuO2/3waqKnm8nTzIM0uLZlkZnvhZNzuWW1Sv0PbvaPfO9
	XmgnU6KYkGTMJaMyNDmIc3l9iC50jQzn70CsvyE5uT1h2ra5PTKkzaYCQ7UhdLO9
	OgPov3rBKYUjtIyCveHTvUw3fwHRldsLiAeEtaXFPVSBzFoiM5X77nUTx1AuwLHn
	CYo4od88uJ8l2opFwVnpGM3WMShmfQKoZgDZMTapHCXudGLfxd9VeZCbPteH6kmw
	NHZpgUZs4dMi+eVR5vy+6ocegoV0/loRMxVwyBKNzytnxVvBbmd4Tb2UgHtTn4Ka
	ZOlmg==
X-ME-Sender: <xms:HBClZ23pudtWYf5hFLsE3idL5CnPCYo_SjLQhjGgsutkTl9qcy3MKg>
    <xme:HBClZ5FtUpQWAhzFsUNBUqbarmR_nUKUvze7Chj4XKDXprdIu-qEw-W_dhfMtUuxb
    FY5sYHZkypgRvEY65s>
X-ME-Received: <xmr:HBClZ-5Elewp8TifKCnG5spTIKP6Zoouiif4PzgdRrVqlHdaxR8FEsZR2isHJUEOsakqqR9Gwc93Yzaetjtzb72WXSnPG5rNf0RhQ8a-U5qvoVeFdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecuogetfedtuddqtdduuc
    dludehmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhm
    peforghrkhcurfgvrghrshhonhcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvg
    gssgdrtggrqeenucggtffrrghtthgvrhhnpeeftddvjeefleffvefhgfejjeehudetteei
    geeugfekhffhgeejudeuteehgfdvffenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdr
    tggrpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhrtghpthhtohephhgu
    vghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvih
    hnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepphhlrghtfhhorhhm
    qdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:HBClZ32ZxwvTLe6xf6vBxTgDAo5F2paQEGG7lOkIggtbrL9qEujWEA>
    <xmx:HBClZ5FsYnnEIOSAn7m_JRAbImm77pk0r0oeyxUhFEOpQu2I62p5yA>
    <xmx:HBClZw8cBXGWM4ywq29uYYvOBrDzsf2FWmQkyvVL1_tByflrRrYOag>
    <xmx:HBClZ-n90wj_hFLH4wfYM5lJXEkl7hWMK3esc3q_aCtN58E5_JjLig>
    <xmx:HRClZyNi2VKOumnAsNiTD7B1IvPpWPIuXSnml_pTDGW_UKiaUzNEDelj>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Feb 2025 14:40:11 -0500 (EST)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: thinkpad_acpi: Support for V9 DYTC platform profiles
Date: Thu,  6 Feb 2025 14:39:41 -0500
Message-ID: <20250206193953.58365-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer Thinkpad AMD platforms are using V9 DYTC and this changes the
profiles used for PSC mode. Add support for this update.
Tested on P14s G5 AMD

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in v2:
 - cosmetic change adding extra newline as requested

 drivers/platform/x86/thinkpad_acpi.c | 34 ++++++++++++++++++----------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 1fcb0f99695a..a6e6a18b0712 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10319,6 +10319,10 @@ static struct ibm_struct proxsensor_driver_data = {
 #define DYTC_MODE_PSC_BALANCE  5  /* Default mode aka balanced */
 #define DYTC_MODE_PSC_PERFORM  7  /* High power mode aka performance */
 
+#define DYTC_MODE_PSCV9_LOWPOWER 1  /* Low power mode */
+#define DYTC_MODE_PSCV9_BALANCE  3  /* Default mode aka balanced */
+#define DYTC_MODE_PSCV9_PERFORM  4  /* High power mode aka performance */
+
 #define DYTC_ERR_MASK       0xF  /* Bits 0-3 in cmd result are the error result */
 #define DYTC_ERR_SUCCESS      1  /* CMD completed successful */
 
@@ -10339,6 +10343,10 @@ static int dytc_capabilities;
 static bool dytc_mmc_get_available;
 static int profile_force;
 
+static int platform_psc_profile_lowpower = DYTC_MODE_PSC_LOWPOWER;
+static int platform_psc_profile_balanced = DYTC_MODE_PSC_BALANCE;
+static int platform_psc_profile_performance = DYTC_MODE_PSC_PERFORM;
+
 static int convert_dytc_to_profile(int funcmode, int dytcmode,
 		enum platform_profile_option *profile)
 {
@@ -10360,19 +10368,15 @@ static int convert_dytc_to_profile(int funcmode, int dytcmode,
 		}
 		return 0;
 	case DYTC_FUNCTION_PSC:
-		switch (dytcmode) {
-		case DYTC_MODE_PSC_LOWPOWER:
+		if (dytcmode == platform_psc_profile_lowpower)
 			*profile = PLATFORM_PROFILE_LOW_POWER;
-			break;
-		case DYTC_MODE_PSC_BALANCE:
+		else if (dytcmode == platform_psc_profile_balanced)
 			*profile =  PLATFORM_PROFILE_BALANCED;
-			break;
-		case DYTC_MODE_PSC_PERFORM:
+		else if (dytcmode == platform_psc_profile_performance)
 			*profile =  PLATFORM_PROFILE_PERFORMANCE;
-			break;
-		default: /* Unknown mode */
+		else
 			return -EINVAL;
-		}
+
 		return 0;
 	case DYTC_FUNCTION_AMT:
 		/* For now return balanced. It's the closest we have to 'auto' */
@@ -10393,19 +10397,19 @@ static int convert_profile_to_dytc(enum platform_profile_option profile, int *pe
 		if (dytc_capabilities & BIT(DYTC_FC_MMC))
 			*perfmode = DYTC_MODE_MMC_LOWPOWER;
 		else if (dytc_capabilities & BIT(DYTC_FC_PSC))
-			*perfmode = DYTC_MODE_PSC_LOWPOWER;
+			*perfmode = platform_psc_profile_lowpower;
 		break;
 	case PLATFORM_PROFILE_BALANCED:
 		if (dytc_capabilities & BIT(DYTC_FC_MMC))
 			*perfmode = DYTC_MODE_MMC_BALANCE;
 		else if (dytc_capabilities & BIT(DYTC_FC_PSC))
-			*perfmode = DYTC_MODE_PSC_BALANCE;
+			*perfmode = platform_psc_profile_balanced;
 		break;
 	case PLATFORM_PROFILE_PERFORMANCE:
 		if (dytc_capabilities & BIT(DYTC_FC_MMC))
 			*perfmode = DYTC_MODE_MMC_PERFORM;
 		else if (dytc_capabilities & BIT(DYTC_FC_PSC))
-			*perfmode = DYTC_MODE_PSC_PERFORM;
+			*perfmode = platform_psc_profile_performance;
 		break;
 	default: /* Unknown profile */
 		return -EOPNOTSUPP;
@@ -10599,6 +10603,7 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 	if (output & BIT(DYTC_QUERY_ENABLE_BIT))
 		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
 
+	dbg_printk(TPACPI_DBG_INIT, "DYTC version %d\n", dytc_version);
 	/* Check DYTC is enabled and supports mode setting */
 	if (dytc_version < 5)
 		return -ENODEV;
@@ -10637,6 +10642,11 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 		}
 	} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) { /* PSC MODE */
 		pr_debug("PSC is supported\n");
+		if (dytc_version >= 9) { /* update profiles for DYTC 9 and up */
+			platform_psc_profile_lowpower = DYTC_MODE_PSCV9_LOWPOWER;
+			platform_psc_profile_balanced = DYTC_MODE_PSCV9_BALANCE;
+			platform_psc_profile_performance = DYTC_MODE_PSCV9_PERFORM;
+		}
 	} else {
 		dbg_printk(TPACPI_DBG_INIT, "No DYTC support available\n");
 		return -ENODEV;
-- 
2.48.1


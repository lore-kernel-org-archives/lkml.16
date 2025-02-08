Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401281865EB;
	Sat,  8 Feb 2025 04:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738988101; cv=none; b=MiZBDpUBxjp12trGhW6mRYb1dNbSyF0kU7uL5CI0sy/LA26N5syZ/F7c6/7SyMu8U2SxOvd8Z3yvHDSOJ5WIMjM/5AjhfBh1/7UpUSIiWFW3tTQJT/VCYCDeDiWwC6zqZjlRYVck4uaf1nkH2ERUcAled86IH8uEkm3/nLADG5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738988101; c=relaxed/simple;
	bh=fzmp6WVSt1hQtLgHLGDRJ34QhxuBlCOOQ/83wZJkBBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+Bbu+wCWBgedfIi9TW0HZdOcEdXpdZOmrritJ1vrsX2k4YKi7YFSaaPwLVLJkVWf4UIqVtk3Kw98S6jnlyBBC8de/Czhg5yMki+YG7PcugY79AMWYcxPBy24kTaRh7WigG/h2z1dnCKFAmRuLmAhkgWA8OcpMLGo6UTE3bzbI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=j6IYOxx7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JJ5dTTSG; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="j6IYOxx7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JJ5dTTSG"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D54542540198;
	Fri,  7 Feb 2025 23:14:56 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 07 Feb 2025 23:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1738988096; x=
	1739074496; bh=JtF8sxBvfgNNsJVOgPTReVDv4+8cuPEbOaKRQ9cp9es=; b=j
	6IYOxx7mcd+hbsEbmnjdoyiJ4elzEZGrmCPidsq1QFuas8LKFAk/lDC40lVouFo3
	uSViChp+M2uJE9+t3yXSUAJbAIxRQru7bMdc+i0jCM8KA/Iw83KBjozdBIhLKG3k
	TE1wVarj+bkeXbjqK3+YIIteabTqfXZkCf4+YqtI2ohzI006LjISCnENEcSX7tIP
	fKeTOCfZCbEEtCyrSN1fb5IATzFFkvOZzAGgU3EE2//xx8dI3hE85EL3kSlrnuAC
	Fu3SB4hmsnmUFkxZKGvlng/HA4c2rgYv2bkS1cfJKW6qUmlKmI4583HICu5feym5
	lEVzmMAxJUuTDzB1Xny1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1738988096; x=1739074496; bh=J
	tF8sxBvfgNNsJVOgPTReVDv4+8cuPEbOaKRQ9cp9es=; b=JJ5dTTSG/p1pUJ6fO
	R/Fo1YY56uWOFl+ukCDWvTZEYMS7K0ygKERXvksmkUrKMPKBmkPUAwbAQ4xsMn5c
	jYfcbVOVS8HiFRToq2RJo3RuGuuLCgCfzS8V6CUnrDqEHKnGyOqZPpHkd7hO2Zkf
	7udt/lKOTjwXNjmBMjR5oyBL713z1v7ifISeORsFmcRucNzG7hr1JogberA7P6/K
	oA+hkpY09SOazWcxuFOUZn8nxsHuroiuJydk/TXhclyWSULrHQ7wzjAzEiOHNXFH
	DKxz+yDGGNEvniUKkeZoSKNHCqq0fHAZL3lfQ+a9qA4rzYKEJx3CeEy/pqFzlRJj
	PPhIQ==
X-ME-Sender: <xms:QNqmZ5MgUN1qQ5c6hiEnE6kjB9XqyROzMW4uvXW0UfASUrQtnPeAXw>
    <xme:QNqmZ78M3AF6D2HAPJV1p8IXWSJxr4mCmvu0Llwnzb7UF0rpU83SJwoVft2DxxalY
    1yf0IU-UVo7xHWU3k8>
X-ME-Received: <xmr:QNqmZ4RfmddLG_wmJvwQ-bYSpCiioJVAKJJgH82Y7EBoGetI-YoHS2iGbpR0lEpHknT4y_-lRRh6pRirKnDMyKN_59Qj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecuogetfedtuddqtdduuc
    dludehmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhm
    peforghrkhcurfgvrghrshhonhcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvg
    gssgdrtggrqeenucggtffrrghtthgvrhhnpeeftddvjeefleffvefhgfejjeehudetteei
    geeugfekhffhgeejudeuteehgfdvffenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdr
    tggrpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhrtghpthhtohephhgu
    vghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvih
    hnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgrrhhiohdrlhhi
    mhhonhgtihgvlhhlohesrghmugdrtghomhdprhgtphhtthhopehkuhhurhhtsgesghhmrg
    hilhdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:QNqmZ1uvsWLNAqLhyJSy-5isNfnb4Fa7cMKf8OkSRh-D80gGIRfFBA>
    <xmx:QNqmZxcwW3ezBGe-8T72IidKxT98neCAblFRbonhE2cOwAV7KyirHg>
    <xmx:QNqmZx3AIocGzUJR9jytvSoI0VRYbRF4tD4IxIh5HtNgVDxw6HEdug>
    <xmx:QNqmZ99rv3VWYPwfAlaVMunYESOH5j9uEBAZoVYjkaToWXwtBqWraQ>
    <xmx:QNqmZwwxL_ClhcZDKfBQtdSabNeYmRmV9yZCxylWT0829--fXPEqdid2>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Feb 2025 23:14:55 -0500 (EST)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	kuurtb@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Fix registration of tpacpi platform driver
Date: Sat,  8 Feb 2025 04:14:31 -0500
Message-ID: <20250208091438.5972-1-mpearson-lenovo@squebb.ca>
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

When reviewing and testing the recent platform profile changes I had
missed that they prevent the tpacpi platform driver from registering.
This error is seen in the kernel logs, and the various tpacpi entries
are not created:
[ 7550.642171] platform thinkpad_acpi: Resources present before probing

I believe this is because the platform_profile driver registers the
device as part of it's initialisation in devm_platform_profile_register,
and the thinkpad_acpi driver later fails as the resource is already used.

Modified thinkpad_acpi so that it has a separate platform driver for the
profile handling, leaving the existing tpacpi_pdev to register
successfully.

Tested on X1 Carbon G12.

Fixes: 31658c916fa6 ("platform/x86: thinkpad_acpi: Use devm_platform_profile_register()")

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/x86/thinkpad_acpi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 1fcb0f99695a..1dd8f3cc5eda 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -270,6 +270,7 @@ enum tpacpi_hkey_event_t {
 #define TPACPI_DRVR_NAME TPACPI_FILE
 #define TPACPI_DRVR_SHORTNAME "tpacpi"
 #define TPACPI_HWMON_DRVR_NAME TPACPI_NAME "_hwmon"
+#define TPACPI_PROFILE_DRVR_NAME TPACPI_NAME "_profile"
 
 #define TPACPI_NVRAM_KTHREAD_NAME "ktpacpi_nvramd"
 #define TPACPI_WORKQUEUE_NAME "ktpacpid"
@@ -962,6 +963,7 @@ static const struct proc_ops dispatch_proc_ops = {
 
 static struct platform_device *tpacpi_pdev;
 static struct platform_device *tpacpi_sensors_pdev;
+static struct platform_device *tpacpi_profile_pdev;
 static struct device *tpacpi_hwmon;
 static struct device *tpacpi_pprof;
 static struct input_dev *tpacpi_inputdev;
@@ -10646,7 +10648,8 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 			"DYTC version %d: thermal mode available\n", dytc_version);
 
 	/* Create platform_profile structure and register */
-	tpacpi_pprof = devm_platform_profile_register(&tpacpi_pdev->dev, "thinkpad-acpi",
+	tpacpi_pprof = devm_platform_profile_register(&tpacpi_profile_pdev->dev,
+						      "thinkpad-acpi-profile",
 						      NULL, &dytc_profile_ops);
 	/*
 	 * If for some reason platform_profiles aren't enabled
@@ -11815,6 +11818,8 @@ static void thinkpad_acpi_module_exit(void)
 
 	if (tpacpi_sensors_pdev)
 		platform_device_unregister(tpacpi_sensors_pdev);
+	if (tpacpi_profile_pdev)
+		platform_device_unregister(tpacpi_profile_pdev);
 	if (tpacpi_pdev)
 		platform_device_unregister(tpacpi_pdev);
 	if (proc_dir)
@@ -11901,6 +11906,17 @@ static int __init thinkpad_acpi_module_init(void)
 		thinkpad_acpi_module_exit();
 		return ret;
 	}
+
+	tpacpi_profile_pdev = platform_device_register_simple(TPACPI_PROFILE_DRVR_NAME,
+							      PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(tpacpi_profile_pdev)) {
+		ret = PTR_ERR(tpacpi_profile_pdev);
+		tpacpi_profile_pdev = NULL;
+		pr_err("unable to register platform profile device\n");
+		thinkpad_acpi_module_exit();
+		return ret;
+	}
+
 	tpacpi_sensors_pdev = platform_device_register_simple(
 						TPACPI_HWMON_DRVR_NAME,
 						PLATFORM_DEVID_NONE, NULL, 0);
-- 
2.48.1


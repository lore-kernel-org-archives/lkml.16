Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5598919D898;
	Sat, 24 May 2025 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081100; cv=none; b=kwJo1eekxvjvoXe62CNCtk17POrnfYilJrsLnEd+uvA/uo1mh4QDk98vSLMG8de+3xEIJBctn6N1ER0AtTPgIGXyh4feLeflPS6sb10/bjNG4uJMltAvogw81NdMxZNllJJO38DiV7IXXD4jOxTehGsYvzT84qYKYtaWIVTiifQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081100; c=relaxed/simple;
	bh=0VIRaW4aXHfL+7TpYVCF8wVnGPe4IKYHZAkQ9dCSnfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cc4y/CiVs3BWOGx7eMoMPJ1zvof5wu2t8qkIsx2ZN7JCE32YquBdeAFLIbCIer2rIXhBYTohhpQAOnK2c5KeB4zF6k0N9Sp7WbTkO4kbIu25j2ShUi9R7+4a1aZMg8GPL7D2gv4R8YhdYKZXKzk4rWspxDv0AkFcEKCx7lteaI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=xsCSx8s6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tc3AmAo1; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="xsCSx8s6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tc3AmAo1"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2C91A25400BB;
	Sat, 24 May 2025 06:04:57 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sat, 24 May 2025 06:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1748081097; x=
	1748167497; bh=B4D9Ku5Wd2m+zjF0yZmx5RNXRlw0J8FKlwUDXcrkhHo=; b=x
	sCSx8s6Foux6ivWtc5MaouDgo/VG4YMVzZMEoKTGbk2swHlQeJFTNHRrXcAVD/S/
	1an3gvNxRuTOrWRSzYYyI0UD6/RVesaLjxUXaYXY6cu0+ApM1hWVWVIWDMh3xYsM
	2kSvK9cWbCAnzNz5dndoCwcrKCEBPjB+9CdUCPvsop4RFNQrph6aGXL8BzAhuJZA
	bTfdmey7a9v7q4/2FH+glC1do3IJsexWYIe57TMIK1d+j8HOGAsKyC8H1LQhGa/i
	1uez6BkDOFLYeOdYvkPZudDej1nmAyDShNpztxvS4I6Kb8k9Fn+ymaNm4PHjoKbA
	i1bYTx1Dja2ChR+ZytLKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1748081097; x=1748167497; bh=B
	4D9Ku5Wd2m+zjF0yZmx5RNXRlw0J8FKlwUDXcrkhHo=; b=tc3AmAo1O6+zU+SMn
	sipJxP5xM7QkRVqAxeBrj8jl45dhExw9yj2ia5H3zrwJ05C9wTicyJzxvsH6dsUo
	t8VHmxiHWWVpSAPFBABRjV+oX+IH4sAOB80FgWF0WjausjJ1glPCFgyqGkajx0/O
	tO4WQLe8aOpC4M0XnPWrxfVqGOP/dqPqmE0sQawL59ZXcr3NLrWJaP7p5e5TW3e9
	Q3bljqRCz4TUZwYDefSnPJrVhdc4zzp3eQU9Vo9XEI+qFPH827rxsdB+rPWQWWrZ
	dninV4b/Sr/8HOzisT4B9jE0i5wcnsKx9T9whbTrcwYRpCU5egKi1OFJlKK90D37
	hDifg==
X-ME-Sender: <xms:yJkxaD4SDfVbZcgL-wTME9beLtfv4FnfCqzcjARXsotLIJne9fKCoQ>
    <xme:yJkxaI6UEvJhdz2isEZRwoNwuI6nu6HIGdVAfvTHqRf7689252KRaeQjSARpSkuH7
    HFxwCPsg2V2OL3RQ9Y>
X-ME-Received: <xmr:yJkxaKcsqdHr5Pm_fKKmm3IjsEjGfnVm-EUyB5P4Vody4aXEwDYZBuYWnYMAqaWd69SbZLufhEM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduudeggeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecunecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhep
    nfhukhgvucflohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrth
    htvghrnhepveelgfeugffhhfegtedvfeelieegueekiefhgeelueefueeujeelueduhfdv
    kedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhn
    sggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhuggv
    ghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinh
    gvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdq
    ughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmh
    grrhhiohdrlhhimhhonhgtihgvlhhlohesrghmugdrtghomhdprhgtphhtthhopegrnhgu
    rhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpth
    htoheplhhukhgvsehljhhonhgvshdruggvvhdprhgtphhtthhopehlkhhpsehinhhtvghl
    rdgtohhm
X-ME-Proxy: <xmx:yJkxaEJ5_YMr9TskLgDRBlab2dmORams8BNm-53FFu7lqpVDHX23LA>
    <xmx:yJkxaHKx-S7gXo2b_21CBuoFz4V-ufXuCotW30IZVFPEbkecMAVNeQ>
    <xmx:yJkxaNyVu0dsjDzkIqQMOcFSe_2cuVviC_qI0UcMtmlslLIkEOG5VA>
    <xmx:yJkxaDII8HQEME5lYxbJQibILj8qZ7Bo4WnjGfrBtllz9Xa43mkuPA>
    <xmx:yZkxaF_BBnXxWrUPcZuB5fwY0te_dX-Xb5Y3tWuh_TAN1N_idGiG8Xiz>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 May 2025 06:04:54 -0400 (EDT)
From: Luke Jones <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	mario.limonciello@amd.com,
	andriy.shevchenko@linux.intel.com,
	Luke Jones <luke@ljones.dev>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 1/1] platform/x86: asus-wmi: fix build without CONFIG_SUSPEND
Date: Sat, 24 May 2025 12:04:44 +0200
Message-ID: <20250524100444.34370-2-luke@ljones.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250524100444.34370-1-luke@ljones.dev>
References: <20250524100444.34370-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch "Refactor Ally suspend/resume" introduced an
acpi_s2idle_dev_ops for use with ROG Ally which caused a build error
if CONFIG_SUSPEND was not defined.

Signed-off-by: Luke Jones <luke@ljones.dev>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505090418.DaeaXe4i-lkp@intel.com/
Fixes: feea7bd6b02d ("platform/x86: asus-wmi: Refactor Ally suspend/resume")
---
 drivers/platform/x86/asus-wmi.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 27f11643a00d..c77198761dc7 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -5005,23 +5005,24 @@ static int asus_hotk_restore(struct device *device)
 	return 0;
 }
 
-static void asus_ally_s2idle_restore(void)
+static int asus_hotk_prepare(struct device *device)
 {
 	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
 		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
-					   ASUS_USB0_PWR_EC0_CSEE_ON);
+					   ASUS_USB0_PWR_EC0_CSEE_OFF);
 		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
 	}
+	return 0;
 }
 
-static int asus_hotk_prepare(struct device *device)
+#if defined(CONFIG_SUSPEND)
+static void asus_ally_s2idle_restore(void)
 {
 	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
 		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
-					   ASUS_USB0_PWR_EC0_CSEE_OFF);
+					   ASUS_USB0_PWR_EC0_CSEE_ON);
 		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
 	}
-	return 0;
 }
 
 /* Use only for Ally devices due to the wake_on_ac */
@@ -5029,6 +5030,20 @@ static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
 	.restore = asus_ally_s2idle_restore,
 };
 
+static void asus_s2idle_check_register(void)
+{
+	acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
+}
+
+static void asus_s2idle_check_unregister(void)
+{
+	acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
+}
+#else
+static void asus_s2idle_check_register(void) {}
+static void asus_s2idle_check_unregister(void) {}
+#endif /* CONFIG_SUSPEND */
+
 static const struct dev_pm_ops asus_pm_ops = {
 	.thaw = asus_hotk_thaw,
 	.restore = asus_hotk_restore,
@@ -5060,7 +5075,7 @@ static int asus_wmi_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
+	ret = asus_s2idle_check_register(&asus_ally_s2idle_dev_ops);
 	if (ret)
 		pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
 
@@ -5096,7 +5111,8 @@ EXPORT_SYMBOL_GPL(asus_wmi_register_driver);
 
 void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
 {
-	acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
+	asus_s2idle_check_unregister(&asus_ally_s2idle_dev_ops);
+
 	platform_device_unregister(driver->platform_device);
 	platform_driver_unregister(&driver->platform_driver);
 	used = false;
-- 
2.49.0


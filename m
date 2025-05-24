Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4816119E99E;
	Sat, 24 May 2025 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081641; cv=none; b=o7Dm1wIcjQ+jyk31W1sXaWAnpvTvelj9gEtiuqr1GViu+yQStS0lxYU/mb1owwPYuEp6qlPcj4vNvZDidZu2gKtdwonjRKuG3FEHegHkWClR90jE6p8izm0/oyOVhVu8IKIi6O+4YLLZWfR0V67FeO1C04D42qMSFb1fqrZO/js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081641; c=relaxed/simple;
	bh=/C8QiTTUb0vTL80OddyY43F9fUZVhdwpVHklu+nJRqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nXofa8HMeaKP6MrmzfOGQ7f0bF6YWJrLWqZxO1nEJDgwJcD40e7D35MEv9K0s2neLZSxtIl9UGlu73qlslT1hpFy8tw1XYUvch/u3vrRxbWEqkmzNkt4TZVWFNaNF6gcl9Np4aVKMSnJHnrIRiyLMUpCAiDNk0uhnvZdlNWlO40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=hml4SO3v; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PVdk3gON; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="hml4SO3v";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PVdk3gON"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 24A8311400CF;
	Sat, 24 May 2025 06:13:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sat, 24 May 2025 06:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1748081637; x=
	1748168037; bh=akA5CFfanHToafD1mbjbfGsMj4lpdg0uahm+NJOHo+A=; b=h
	ml4SO3ve8hhPor1MlwHKNiQOlrpvEg5f9jrXAiRze6By6VTiTtvn6UZO3nZE68KN
	AVsgqsDXbolr/qcLLyfsbdiYnIL4rVA4Xcyu4zaXK9CfCIDY5OyPGYoeUX0Cwvem
	YtRsSl7xJeru4C8HMdrD/fkIa4EhTFl3NJ3drHJAn8MiZAv4FHd4ZjF8VtaOaP0Y
	WfsrPog3Ltoc28d6xm0hCqi6hSU47dFoglWkpw8tbWWitbZYyZnV1fogJI9w+iPe
	LPsqDANm/SEU4C0RjaMdsxD1m9qV+bXX0FU+FCLfZSZq34/f3OQdTbm9BZQVh/wB
	8spiKU9yLisZ0ed6f4U8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1748081637; x=1748168037; bh=a
	kA5CFfanHToafD1mbjbfGsMj4lpdg0uahm+NJOHo+A=; b=PVdk3gONQCr88ub7W
	LPXoovQcqnOPtpELSbVVdloM3VTaOZFeN3iwEip9t9RlLGpDP0ls0SsX64n+T1fZ
	AjpptA9bmX6WVPzM8gjx1zApXJl8CnNF5kgHLMhdutVLn15hqiVOan+DSKr21mce
	0OF2M7oGabiduGizJYlxCjtaNbw/jZV+3YGZBgzS/mfSXAv+10yyBiqvRMPJBCgr
	SEPSZq1Negl3gYFZXBvVoDd0ffcScoCDATMNZWBd2OB0FDlSZQfgYOsgWH+uQKrB
	qMjhsPHgOrsoFvvI3yn/uNAXwqdLPRzxkuY4yF+dFWc1z2G9c4hfI90Mkrll9DE7
	Up4sA==
X-ME-Sender: <xms:5ZsxaAlj3ZNzNUg2aUjaCuqx8yQwrC4G8UdSGx2XCJmzPvKzy0FCyQ>
    <xme:5ZsxaP1cfz56j_4GvCaJCDge15gkcOq-wCO2CbDI-zHrvf26R4UiPZQeyw6vqUpiU
    gvuZCK4X4slB8_ApB8>
X-ME-Received: <xmr:5ZsxaOo9YiCm1uXqYcsZvHsmwzfe_sAMM5VKh9hJRKMNqojEhX5tSYrm91CnNKzu9I6R8ofEq_0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduudegieculddtuddrgeefvddrtd
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
X-ME-Proxy: <xmx:5ZsxaMkEEFKW_GVqV3egGpR_LG2Y99A6pejyIUyjN3zrAlLCYXdy5g>
    <xmx:5ZsxaO1jrkg-Nhcd-uTHmHoo0AlYEKMGBc5Ga01MUYE6CV2sXslN0Q>
    <xmx:5ZsxaDsWasWQXppd26Hezp1Clq2kcZTxZaT81oh22ZwYxBXLZcQHkw>
    <xmx:5ZsxaKUKJnloHibMdHtFGjfXUI7IftGoyz6_BrQdqjUheiiXdN3xOw>
    <xmx:5ZsxaK7vNTzmwuKhSOJdTEg4Vkp3MQ9Q9b1KIuu_LYYmNxQ4VSfFsn72>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 May 2025 06:13:56 -0400 (EDT)
From: Luke Jones <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	mario.limonciello@amd.com,
	andriy.shevchenko@linux.intel.com,
	Luke Jones <luke@ljones.dev>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 1/1] platform/x86: asus-wmi: fix build without CONFIG_SUSPEND
Date: Sat, 24 May 2025 12:13:42 +0200
Message-ID: <20250524101343.57883-2-luke@ljones.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250524101343.57883-1-luke@ljones.dev>
References: <20250524101343.57883-1-luke@ljones.dev>
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
 drivers/platform/x86/asus-wmi.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 27f11643a00d..cbbd0ef0906f 100644
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
@@ -5029,6 +5030,21 @@ static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
 	.restore = asus_ally_s2idle_restore,
 };
 
+static void asus_s2idle_check_register(void)
+{
+	if (acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops))
+		pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
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
@@ -5060,9 +5076,7 @@ static int asus_wmi_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
-	if (ret)
-		pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
+	asus_s2idle_check_register();
 
 	return asus_wmi_add(pdev);
 }
@@ -5096,7 +5110,8 @@ EXPORT_SYMBOL_GPL(asus_wmi_register_driver);
 
 void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
 {
-	acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
+	asus_s2idle_check_unregister();
+
 	platform_device_unregister(driver->platform_device);
 	platform_driver_unregister(&driver->platform_driver);
 	used = false;
-- 
2.49.0


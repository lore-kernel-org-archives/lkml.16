Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23BF2459F7;
	Fri, 23 May 2025 13:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748006102; cv=none; b=bFZ2Z21MP8ezzoWI88rUiZtZbngD8JrleRVMZtmh89ez8nCPaI5jabGDwoczKB///o0ZOjfqkkrRI5Cs+vxPlt/W/mmm6hctl1kF3pG+M0sswncPiQgRQezKNaEWamjwpwXDkFv+7uwet2Cfa2RwhBnF2n0qUn/f4G0gw0XvpkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748006102; c=relaxed/simple;
	bh=/jKuq5df/CQWL24koYAFhFLHa0CXPBlz8k2PpJIMsW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=chDRjthzeZjOrw5ul0ODQtQHz9ZtBwBBa/d+LMjOFFP3T5DJ1qUlZ62NLhlZrCyVrDF5f8l/Muzm+h+EQO03sKFY7x4PxGArXy/oRMQ+XNFfaObG7zIuMbUWHR4/Ld/ZOO8pQmpY5Uyv3SSwyg5919io9W4KDKckEgpZAtcA1HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=2mfVQbgz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fVMzQHBB; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="2mfVQbgz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fVMzQHBB"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C85E51140104;
	Fri, 23 May 2025 09:14:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 23 May 2025 09:14:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1748006099; x=
	1748092499; bh=yDUEplCt2ONGGQNeEFc77MeQ1cFTK68xK0ji4kPfjig=; b=2
	mfVQbgzXiBuiOdXhvKm2HCY1BZWNTFwfMlrHOziljv37enwslqdG45AhaY2exscd
	AsRcFPf497zJfsHiBfY1h4gfdhqB8TWm9kXXj8CD6rrywzs5CzDDA2+tNcpWF7tj
	qjy4+PEyavjxLO073Joix/7rnVhy+VYZzI4pB5SwSIJQOuOSD5MLkRNfFzWfIM9N
	Qt9WszQFvHG/MudpBkPgSfyornnecBvm3/15RUHuexZFhOCaR2YzhzTP7415YfT/
	lhAErUqLPbG8KrdJKnsy3Co3AIfn3Sd2Hnvvm1xOIIS8MHrJTnT7FTHBZjdohxGm
	3i6N+9dxq4rxVnNTRWXQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1748006099; x=1748092499; bh=y
	DUEplCt2ONGGQNeEFc77MeQ1cFTK68xK0ji4kPfjig=; b=fVMzQHBBgGv3jLucI
	cfx/6WkSooLd/pSIcU7FQIssgle0Jp0hV0GcMiMaEmWgjZX/8DHXUptPM2YQwifp
	Zmtsy8YoEKqsK9p33eeZn3OCiMhe0op2x3qhl2+rQ8X3KVvD+nYZP1RftAj0mezc
	5aJFUhpM2wY5t+LM6QhIpFL2PBR5VF49w3/6smhSdS7AAyAZUrBXwhI4oWGHai/k
	RdpSvqEqV7oudHbfF4a+XCKnsSdenx4x/hTMai14MMbqHRUoZTOPKTiae0fw7QXw
	cQcB18Pv7vE1xuz14DboQx4aCtBIYsqAd8UiJs1OSn0Ty4BHxGvhBRDEjR+TTdfQ
	uAjRw==
X-ME-Sender: <xms:03QwaJGhvehT3-Opk7DapRDsjGMRs4Tn3xuoK8ugT2EytTLzGnOjVg>
    <xme:03QwaOUsiG_Na7IZOrmLYe1nDDbXuMcGgecKjiCPMppOx3D3t_scoNjhjZFzqsPFN
    PG1OOYsxtsCPc8W_GA>
X-ME-Received: <xmr:03QwaLIzzcVYY0JxDrA_ZJPjOOSslrrkDC9RYM8UAPgbLwVPp0KJihSAcEZFFZn_tJVzDsmvtON2iSZ_rINmYMuEx-wgJvl00-DDMdSwDRn1rzH6TFoMYfeDbiE->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekleehucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefn
    uhhkvgculfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtth
    gvrhhnpeevlefguefghffhgeetvdefleeigeeukeeihfegleeufeeuueejleeuudfhvdek
    vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgs
    pghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugi
    dqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhguvghg
    ohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvg
    hnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepphhlrghtfhhorhhmqdgu
    rhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrg
    hrihhordhlihhmohhntghivghllhhosegrmhgurdgtohhmpdhrtghpthhtoheprghnughr
    ihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtth
    hopehluhhkvgeslhhjohhnvghsrdguvghvpdhrtghpthhtoheplhhkphesihhnthgvlhdr
    tghomh
X-ME-Proxy: <xmx:03QwaPFazN13k-TGmU1M8AMSFtoUjEZXik0DcRbdoXJlzetILCEEVg>
    <xmx:03QwaPUCJxoI8-l0x7bypx6m2vEaqoiffB4Klmsqnql_OBOV3ebBBA>
    <xmx:03QwaKP8BuAi6N62DqN-Z_Xp2wIQkvRaAy6VI6w3QE1UUciV0_M8IA>
    <xmx:03QwaO2U1VxF4eVdOaXFf6Bo80xgEKYbqbw3bChxSPf_oZOwIz1FAA>
    <xmx:03QwaJb8FFdByzHrUQITiiDC8Kj4JQRXynP89KjTJQ2VqF638zMOLUNQ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 May 2025 09:14:58 -0400 (EDT)
From: Luke Jones <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	mario.limonciello@amd.com,
	andriy.shevchenko@linux.intel.com,
	Luke Jones <luke@ljones.dev>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/1] platform/x86: asus-wmi: fix build without CONFIG_SUSPEND
Date: Fri, 23 May 2025 15:14:51 +0200
Message-ID: <20250523131451.1942578-2-luke@ljones.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523131451.1942578-1-luke@ljones.dev>
References: <20250523131451.1942578-1-luke@ljones.dev>
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
 drivers/platform/x86/asus-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 27f11643a00d..087318e0d595 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -5005,6 +5005,7 @@ static int asus_hotk_restore(struct device *device)
 	return 0;
 }
 
+#if defined(CONFIG_SUSPEND)
 static void asus_ally_s2idle_restore(void)
 {
 	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
@@ -5013,6 +5014,7 @@ static void asus_ally_s2idle_restore(void)
 		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
 	}
 }
+#endif /* CONFIG_SUSPEND */
 
 static int asus_hotk_prepare(struct device *device)
 {
@@ -5025,9 +5027,11 @@ static int asus_hotk_prepare(struct device *device)
 }
 
 /* Use only for Ally devices due to the wake_on_ac */
+#if defined(CONFIG_SUSPEND)
 static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
 	.restore = asus_ally_s2idle_restore,
 };
+#endif /* CONFIG_SUSPEND */
 
 static const struct dev_pm_ops asus_pm_ops = {
 	.thaw = asus_hotk_thaw,
@@ -5060,9 +5064,11 @@ static int asus_wmi_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	#if defined(CONFIG_SUSPEND)
 	ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
 	if (ret)
 		pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
+	#endif /* CONFIG_SUSPEND */
 
 	return asus_wmi_add(pdev);
 }
@@ -5096,7 +5102,10 @@ EXPORT_SYMBOL_GPL(asus_wmi_register_driver);
 
 void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
 {
+	#if defined(CONFIG_SUSPEND)
 	acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
+	#endif /* CONFIG_SUSPEND */
+
 	platform_device_unregister(driver->platform_device);
 	platform_driver_unregister(&driver->platform_driver);
 	used = false;
-- 
2.49.0


Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9C225C71C;
	Mon, 10 Feb 2025 20:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739218644; cv=none; b=uGUZpc4agYPEgWOKoaA92wbpicNTJth43Sl5eo1+BgEttVayWryt/pN+FSjbf89lNN9nEOUzhizgmEyPw4+eUvtDBbL1xCY+70bn9EXkvwIuBeQR/hfPDsCN6zuwUpoBe1HmGqV9ALVX1FC2F77gZKNwtq030F/i7xdGpAE8OWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739218644; c=relaxed/simple;
	bh=w5pzB8zEjG8jiMu2pyO9RKhRPFFWXN1JPkiDpXKGxNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HO0thdlO3kGEXOIYF4fbLVv4XxSsjt7IUQYGWEHCpri6Ry4fAyLk9rCBO1N2en4oeapz2vawLVN37tUQxGDyIJnLEs/onCJ6cJQPkY2zFOGlSTky6gLRVG326ySYanQvLaT3uekZ3pfZI8njgl/M7K8SYKyrhXAM3Kd0nx3c+5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=WVqCyj9/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RWcqDsmr; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="WVqCyj9/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RWcqDsmr"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 6363B13805F7;
	Mon, 10 Feb 2025 15:17:20 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 10 Feb 2025 15:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1739218640; x=
	1739305040; bh=/p5ZBaPouDGsrjzvDB+UiQ994wDnGiIwhq5nf3WHiRU=; b=W
	VqCyj9/QslSF3iKRpig2FMnpcCqMt8dXR0vynORxLFoszRjofJ+hTOqWRJpLk/vr
	6qeF8y3s9Ztju+nxAyQ8IttouFpgYTOHUR157nQ2h2CCyBxYnqDBnpFrjFeGWUC1
	ujDOmENurBOQdCA0vgXUdVYt1OT8ztCZVXpB6wZIkBziJk9y8amUEJJrjpxTZUvR
	AQQiJaOGOUtV6sr/B3c4MbUu2tXNi3SfYfSlxhDaad79XldoOv8F0MVNkmZUsB7f
	+QtQU1eS3IpuNy09wH+0XBKkorfrZONzQqpEw0Hlu5IKhLgYaPPYqoVDPhXofK7U
	aVfdkHJJYqFsHK/Bm6V4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739218640; x=1739305040; bh=/
	p5ZBaPouDGsrjzvDB+UiQ994wDnGiIwhq5nf3WHiRU=; b=RWcqDsmrQZFkshppD
	Ea9oR8KCvH/37qVCe5bqbBM+u4LzeT4sfh8LYqN3r5KdULKLJyDPGcnnrpHq/tyD
	J96M5+2OuQjPpKie0Tp+lxmVxY3W+K34CFRf1y9Dy0wVURjBHT20f5qVNMfbjJ8j
	2w+u/hYb9d9zlEO36WNJSs+APxqhvw71LDF7nfgQUTXqPv1EMPqAjWTANTGZ+/ay
	dVYO/zJRwPVcu3+7WXIT4ezw/EipgGwCLpL/vyM1T1BCA27vs+pJ9kvq7SDiKTgv
	4PVEKlF1I/dvGY62ew3JwD3VtpMYI+vJQUVtYgHemxpmODpKGdF/Eacvc8Oq+ZVg
	ySzMg==
X-ME-Sender: <xms:0F6qZ0xPnteGFK6BCokl05vA4v-VBCnGyGafm0OiYEJGGAScFZs2fQ>
    <xme:0F6qZ4QnrFOkGP8sdexoOgvxLRPmGuKcGQYlzh_x7qq1vGfa_dAxswr2MyN6ac-MO
    jPy6x-WamMDsvfzx9g>
X-ME-Received: <xmr:0F6qZ2XD3SgO25zt6u7BcRsL_f7RGl_hfDQ2WNEYfUb4Q7jaXr0a13ybj7GfPWDXn6lrbB2O7Tc3XFBzX5TK2K5MlgtilgfG-y9ThCV4OMPO9-hM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefledtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecuogetfedtuddqtdduuc
    dludehmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhm
    peforghrkhcurfgvrghrshhonhcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvg
    gssgdrtggrqeenucggtffrrghtthgvrhhnpeeftddvjeefleffvefhgfejjeehudetteei
    geeugfekhffhgeejudeuteehgfdvffenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdr
    tggrpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhrtghpthhtohephhgu
    vghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvih
    hnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepkhhuuhhrthgssehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekie
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:0F6qZyhc-J82AnA0XdEtIknEO2zhyCKMrFrncjKWJl-gLvZGgOilNg>
    <xmx:0F6qZ2DxriCw6QQpnZXxQYzXnk9Jo9E1M0T-ZKK44hLedK2VoE5l8w>
    <xmx:0F6qZzKiv1xyOeEks1IBhTIlBiMOq-thVieL4yu4FgAfbmJKb_XmtA>
    <xmx:0F6qZ9CMBv7_yiyQVLvPGL8nbI_ij8W7twTXEgHwP0ukSmFk2n2EBw>
    <xmx:0F6qZ40frhUYddeUJq0bKZ4g9PN4YcgWYuwhmE4_iWyFn9uj2rHmOk4K>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Feb 2025 15:17:19 -0500 (EST)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	kuurtb@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: thinkpad_acpi: Fix registration of tpacpi platform driver
Date: Mon, 10 Feb 2025 15:16:46 -0500
Message-ID: <20250210201656.4165-1-mpearson-lenovo@squebb.ca>
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

This happens because devm_platform_profile_register() is called before
tpacpi_pdev probes (thanks to Kurt Borja for identifying root cause)

For now revert back to the old platform_profile_register to fix the
issue. Will work on re-implementing this later as more testing is needed
for full solution.

Tested on X1 Carbon G12.

Fixes: 31658c916fa6 ("platform/x86: thinkpad_acpi: Use devm_platform_profile_register()")

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in v2:
  Modified approach to instead revert to old platform_profile_register
method. Will revisit using devm_ version in the future as more testing
needed.

 drivers/platform/x86/thinkpad_acpi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 1fcb0f99695a..85d01bd5dc31 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10646,8 +10646,8 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 			"DYTC version %d: thermal mode available\n", dytc_version);
 
 	/* Create platform_profile structure and register */
-	tpacpi_pprof = devm_platform_profile_register(&tpacpi_pdev->dev, "thinkpad-acpi",
-						      NULL, &dytc_profile_ops);
+	tpacpi_pprof = platform_profile_register(&tpacpi_pdev->dev, "thinkpad-acpi-profile",
+						 NULL, &dytc_profile_ops);
 	/*
 	 * If for some reason platform_profiles aren't enabled
 	 * don't quit terminally.
@@ -10665,8 +10665,14 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 	return 0;
 }
 
+static void dytc_profile_exit(void)
+{
+	platform_profile_remove(tpacpi_pprof);
+}
+
 static struct ibm_struct  dytc_profile_driver_data = {
 	.name = "dytc-profile",
+	.exit = dytc_profile_exit,
 };
 
 /*************************************************************************
-- 
2.48.1


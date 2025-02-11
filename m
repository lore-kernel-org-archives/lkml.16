Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E06E261566;
	Tue, 11 Feb 2025 17:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739295409; cv=none; b=uwI/gVlwb39EPKEwcqK9Xz9z2umMlJxJNiig7PHHUQjVRGlBfFlD38DmzRLoP2uoDZ2KHp55CA5qI2HvZB8/fFfYavXOaJTbltA6l087mTkF/+qZxrHMlpHRO02RiGYo7brNB+t9IKMABlxhR9qS4xQ0cuc86bO3LyiYX/yzees=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739295409; c=relaxed/simple;
	bh=Q+o9UEHeaB8+cC0+nfgSzElbIUarzOd3c0yXomcrR2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CSeJjJGW2CrqM5x8+gnCLrqikR1f9HedvhYjHwBvBLIOKGeLRaImPshpngij51Nop1C1yaTD/1rSrNGIEjZnWANeTtop54ZDsQyGxRmNqUC+aKMRGDJqUhlWwl8/0IxlkJ2jWXZY5T3wVBgVZ8Hb8XnayuKaRxdCXrSLQbez6Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=G0Q52Vmw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xdKjl0Xc; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="G0Q52Vmw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xdKjl0Xc"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8763F2540112;
	Tue, 11 Feb 2025 12:36:46 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 11 Feb 2025 12:36:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1739295406; x=
	1739381806; bh=bvTPhYpj3B0ty9Qiucjj7tduhj6D3KOcTl7Np8tHN3k=; b=G
	0Q52Vmw0vTkK7ptj7H/kRDgN+OiqR616Ko9RS/XUEf/us8DL9H9ewNT3EvwJcTuv
	7mMI7dJ1p8qAG0nGar6l85lODSW12S7rMVaZna8IGiRVQSddWQ/SRqDh3piYtcDV
	PH2AwLeXMN32S9Tml1XekhgkoRgZTLsWDdokmNXCXgBh/VUDIUrU18qETj9LgJB4
	GvsQLK6fz5T50uerc5tFQ7iGQ3E4utfztYe602uomvBCbYccxYBvpEBwFr202djr
	meIyIzRxabCjs9KhAIDdA9Z9du7nRYu6ImsFFxSx4bkUJbTF9aCO03jfHvfUd4hV
	ZlofK6xZhuMXNLukZu0kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739295406; x=1739381806; bh=b
	vTPhYpj3B0ty9Qiucjj7tduhj6D3KOcTl7Np8tHN3k=; b=xdKjl0XcAN+wLtnsb
	+JNGbNqqei5ewBTXL7hPhEyxZDhwpdmaLWrXgfZj1szNeoCd3bBcgy5GlmuJQCXn
	WMrwa7nw3+Ub5ajejGzbzKgxjfJyF70pdcgZXxL99B/+fIiHxgmi+h31lwCJDfm9
	/siJgOlWyZXu9jjkdOc5kFDjddNHjwXn+0lRw4zpCOW8lSQuj/Z6yx7Jzy6x26fC
	YC4VaElOitiBGUGhb3xUbohATvE2pDYS0HhdPs5+NaC3UmLztP9rzQDTCV2rR+2y
	UOrOvDOFzK0/20xg8cjpaqyeNzcx4Wou62tTlBvz4sFIe0LrCUcMt9XUWhBYqdwV
	c4F7w==
X-ME-Sender: <xms:roqrZ1UJQjWPNAXQmHEkyG6I475L27VfQBRnBNQQLQoaArr433c7Cw>
    <xme:roqrZ1lz0plc_TV_lBVbaxLfyZRdRhLyws0CtCjZWiUHUNgaSauua44BxUtI3BJBn
    Z1-zfyvujhGtMqxCzw>
X-ME-Received: <xmr:roqrZxZrqQ2WJ2sXGxdp0lzZVieVOMg-ScWHpMT4ia8QAMJv2ElLK0j4UQYjQpgzN2ir6zHHLS4x0cYHJ9Hgk-GgnIq2rJjEt9VKeK91lPsdwrF9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegudeivdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:roqrZ4XIgxhHwlIOwV0uisfoLZXhAErAA7VuK9LYPScVZ0_Ag8S2HA>
    <xmx:roqrZ_miI0Oj5DnG5EOf1VQwqlIHTJBzvMIUQB9uqTii8ysrPqFetg>
    <xmx:roqrZ1e2Cke9FsOU1SuuUHJVJ-Dl3zKSD6M-cRuq0rVfWlmDc0zO5w>
    <xmx:roqrZ5FeM9zRVGUjF1lYNdV8oi4-Z7vOpds1BJWMHRajLNEd737T4g>
    <xmx:roqrZ9ZtyM_TSy8MNHEpSKPMNzff8srInnNidy6swt4QYHwnn3nkMazz>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Feb 2025 12:36:45 -0500 (EST)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	kuurtb@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] platform/x86: thinkpad_acpi: Fix registration of tpacpi platform driver
Date: Tue, 11 Feb 2025 12:36:11 -0500
Message-ID: <20250211173620.16522-1-mpearson-lenovo@squebb.ca>
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
Changes in v3:
Add check if tpacpi_pprof is valid before releasing.

 drivers/platform/x86/thinkpad_acpi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 1fcb0f99695a..9f6d7e26e700 100644
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
@@ -10665,8 +10665,15 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 	return 0;
 }
 
+static void dytc_profile_exit(void)
+{
+	if (!IS_ERR_OR_NULL(tpacpi_pprof))
+		platform_profile_remove(tpacpi_pprof);
+}
+
 static struct ibm_struct  dytc_profile_driver_data = {
 	.name = "dytc-profile",
+	.exit = dytc_profile_exit,
 };
 
 /*************************************************************************
-- 
2.48.1


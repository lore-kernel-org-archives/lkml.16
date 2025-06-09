Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103B71E1A31;
	Mon,  9 Jun 2025 12:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749472064; cv=none; b=iP1pb59ayY8Ivp7s3Y9dX8OzPufPt1slCBKudwJWoY0vLiVVxcWOyOnr+NMU306c5h5k+3DNpNeK2ZXVDEKOqaXpqS/YMMdzwdmexKr3LjYJt1f0Y4I01QST1OAZsnDeuh03upThGBxqkDLXCzG9s5STcF4VWBZ4pyjjgSFn5g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749472064; c=relaxed/simple;
	bh=fMxz0jV4QePrXh05PZ8xukpwaPrvRnONxi5a7SuaC2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lPDP5FNuZ7k9W9dX7Km8C10GFX7j6T332lQwQSR9tcbcHD94IexTrgKW1wNN+i0C7T38ZWTWZgPHPGRGoZA3dZp1kz/BZ/UIsy18TQXQnhsLKZpUFDJ4WB9EiAEL75jHYfbaTLPJzZpEKkPdBYrBrpYs8aN4jFLVJBnd7He1j40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=O0s9GeJS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=b+NZrgsN; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="O0s9GeJS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="b+NZrgsN"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1A9FC1140269;
	Mon,  9 Jun 2025 08:27:41 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 09 Jun 2025 08:27:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1749472061; x=
	1749558461; bh=hMq8DTIOhpbuRKjy+CNcjAYhxjMFzlhGiYklMnqStJY=; b=O
	0s9GeJSyre4tdwKfq0EMA5veJGN7cKbkEQ2DAXR0y4ZHAezW0dj/WRXItvADtyl3
	XLD0CDUlbmVSFzvjqK1Dle0YWv95ZJ6sZ2aZHKcaT/ADrGSFLTaUP6q9UltTn0VJ
	UEqZ5LKrxB76TTmyvObA+f2Ci/D53B3U1VkdN2vAJX2In+xJtXSM6y3bZIXFEAHO
	mSRgCd/8BECzkXqSu0AVq7sLv6gefwjkHsrOxAYKuux406blNPIHZuFQ8tNBG1OF
	nfiUiSs7jGpotCo1b2OP+CC9wFoxeBSRQ2Z1P/2jrf79eabf1k9HRKZ1nP57pdHM
	diuFM24IWbTerMFNkyTXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1749472061; x=1749558461; bh=h
	Mq8DTIOhpbuRKjy+CNcjAYhxjMFzlhGiYklMnqStJY=; b=b+NZrgsN2f4wM4/6M
	SwMS8Soty3Q5h2Q1s4EIy9FaKt2umG9KFmdv7d6cajV7nVnab3fBCpFZR7rycPiu
	hguGyyhDOb6eGCKX4Dnh15BNkufskcZC+Mj3UmwEHiGIo0dcqpTsaSfWBi9evPPI
	dxZzV6kmUJOfluVtnsMmjPVCZmhydDcx+HQBu5GAHXNQJjJIJaBv+F5LUqhLrPQr
	5aIVO/E9FAK0d3W9aN8srsBqZ5JPjPUZBr1GQQrdUo6wc95MMk0TPQXzjL2Nfa5V
	pA/FrgDUCPQG56qY/Ha44gV6P4TXPhYy221plty4UdvQsJC7fW9o7QyMqr8Y8K/Z
	2f5tQ==
X-ME-Sender: <xms:PNNGaJ2XwuOUhFomE0DFyEyS6DsC_Gp4kAkksnf4-K-KmGsvUw5TKA>
    <xme:PNNGaAG4wwDNFVT-2WJiFlk_vQrro3s0Ru9YTl3poM6zMT6PU16CIQm7Zof5xJR35
    vryn_gaUNaKFc8IqEI>
X-ME-Received: <xmr:PNNGaJ6W8qBRPW92d4_2iMBJLPzErKDLDUxf4iH90CrDhILJd1VfimAExo4cgKUqAJ1ybxS3TK6FaRiYtio>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucgoteeftdduqddtudculd
    duhedmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhep
    ofgrrhhkucfrvggrrhhsohhnuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsg
    gsrdgtrgeqnecuggftrfgrthhtvghrnhepvedtlefggefgjeettddvgfekhfeugfeutdek
    feefudeuuddvieeutdeljedvhfdvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghr
    shhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopedufedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhpvggrrhhsohhnqdhlvghnohhvohes
    shhquhgvsggsrdgtrgdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuh
    igrdhinhhtvghlrdgtohhmpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdr
    tghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehikh
    gvphgrnhhhtgesghhmrghilhdrtghomhdprhgtphhtthhopehhmhhhsehhmhhhrdgvnhhg
    rdgsrhdprhgtphhtthhopeifpggrrhhmihhnsehgmhigrdguvgdprhgtphhtthhopegrnh
    gurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghp
    thhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:PNNGaG2BJ533ri87KMkBYUAknAVQvxww-nT8PyxNtNTC4xjdGANuMw>
    <xmx:PNNGaMHN2XrDuWPJKYXoU6X7QpmeXjth0qS1rvG0FFbqSvAESwlD9w>
    <xmx:PNNGaH-daoqYQ7VSqb_4Ul3OHpfyfa_nHIpsRMKs4Hqgqt_N0DCXDQ>
    <xmx:PNNGaJm6ln6o3kPGFGX0l-nDK7z_35GlGKT7YY2bItEVgpSoqs2Edg>
    <xmx:PdNGaLdP4-YULsIakq-5GEiWNTUMEiptZAh8TKRFWNNEWHhahs1qFA_4>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Jun 2025 08:27:40 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	corbet@lwn.net,
	ikepanhc@gmail.com,
	hmh@hmh.eng.br,
	W_Armin@gmx.de,
	andriy.shevchenko@linux.intel.com,
	linux-doc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 2/2] platform/x86: thinklmi: improved DMI handling
Date: Mon,  9 Jun 2025 08:27:25 -0400
Message-ID: <20250609122736.3373471-2-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609122736.3373471-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20250609122736.3373471-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix issues reported by kernel test robot.
 - Require DMI for think-lmi.
 - Check return from getting serial string

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506062319.F0IpDxF6-lkp@intel.com/

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 - New patch added to series.

 drivers/platform/x86/lenovo/Kconfig     | 1 +
 drivers/platform/x86/lenovo/think-lmi.c | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index a4b565283768..207dd7f88ed0 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -197,6 +197,7 @@ config THINKPAD_ACPI_HOTKEY_POLL
 config THINKPAD_LMI
 	tristate "Lenovo WMI-based systems management driver"
 	depends on ACPI_WMI
+	depends on DMI
 	select FW_ATTR_CLASS
 	help
 	  This driver allows changing BIOS settings on Lenovo machines whose
diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index 143d9fdedb65..8f70c60f791f 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -772,6 +772,7 @@ static ssize_t certificate_store(struct kobject *kobj,
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
 	enum cert_install_mode install_mode = TLMI_CERT_INSTALL;
 	char *auth_str, *new_cert;
+	const char *serial;
 	char *signature;
 	char *guid;
 	int ret;
@@ -789,9 +790,10 @@ static ssize_t certificate_store(struct kobject *kobj,
 			return -EACCES;
 
 		/* Format: 'serial#, signature' */
-		auth_str = cert_command(setting,
-					dmi_get_system_info(DMI_PRODUCT_SERIAL),
-					setting->signature);
+		serial = dmi_get_system_info(DMI_PRODUCT_SERIAL);
+		if (!serial)
+			return -EINVAL;
+		auth_str = cert_command(setting, serial, setting->signature);
 		if (!auth_str)
 			return -ENOMEM;
 
-- 
2.43.0


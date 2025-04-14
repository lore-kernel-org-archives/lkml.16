Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F96D2367A0;
	Mon, 14 Apr 2025 08:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744619595; cv=none; b=IxTFkGRjJGS1uRJbxEoGEhVashu7u5bKpb8xIeSOfoZCM3pSGwDylbxtmvKJnVmw3BSZhZaU7meJnpyYUJgchHTWqAb7DmBhNXPZ/bVlThm9kf38sixxQDCQGouLxYloLkZbCLXrDxFA8AD2msvlIRI/9mMa67IhnzrNfqNS6Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744619595; c=relaxed/simple;
	bh=5TwohWfQF4JaAOWUMnRdwgZRXnieC2tLf2TPxNPYzLs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FUc2KnkzJ/SyGKTnQepBsqRDnb3Uvp903cMWta/Jydf9EDiJ+NqH+iCCHlnWi0tQdYnSOJNrZTcpI84+C6kt+3c9WZ+3TN8K8Vp9aJaiL3vv//0RfpryAhshaw2gPcyD/l3b32qpTmCIuv61i7aArffVIe4wNJsEx+eirH1jeeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b=KL8P6W3D; arc=none smtp.client-ip=99.78.197.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="KL8P6W3D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1744619593; x=1776155593;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SLWNDAF0JZiAUCm/AxF5RSwmZmjZzyfu4AiJa0g8FhI=;
  b=KL8P6W3DHo+bkNSkuuWuuq/BPBXptq3QxpNEzvgpm/0Dh38snMx+y1s2
   0GtLMkGg0I6D4BW5rW8t22O0eT1xFH5HtjTymUZWLEyurVZhfB4EfpIcA
   0jwB3UhMiwl2pj6gWVgHbZZPwpbXBDKv4zMnybvTAtiXeYSbvtp09h5Hn
   U=;
X-IronPort-AV: E=Sophos;i="6.15,211,1739836800"; 
   d="scan'208";a="395591120"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 08:33:11 +0000
Received: from EX19MTAEUB001.ant.amazon.com [10.0.43.254:33266]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.10.242:2525] with esmtp (Farcaster)
 id a1d5a350-33ad-40ee-b565-0d87d5ec1661; Mon, 14 Apr 2025 08:33:10 +0000 (UTC)
X-Farcaster-Flow-ID: a1d5a350-33ad-40ee-b565-0d87d5ec1661
Received: from EX19D029EUC001.ant.amazon.com (10.252.61.252) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 14 Apr 2025 08:33:10 +0000
Received: from dev-dsk-bsz-1b-e2c65f5d.eu-west-1.amazon.com (10.13.227.240) by
 EX19D029EUC001.ant.amazon.com (10.252.61.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 14 Apr 2025 08:33:07 +0000
From: Bartosz Szczepanek <bsz@amazon.de>
To: <bsz@amazon.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan
	<saravanak@google.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Alexander Graf <graf@amazon.de>,
	=?UTF-8?q?Jan=20H=20=2E=20Sch=C3=B6nherr?= <jschoenh@amazon.de>
Subject: [PATCH] fdt: arch/arm64: Delete the rng-seed property after use
Date: Mon, 14 Apr 2025 08:32:43 +0000
Message-ID: <20250414083243.59664-1-bsz@amazon.de>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D042UWB004.ant.amazon.com (10.13.139.150) To
 EX19D029EUC001.ant.amazon.com (10.252.61.252)

As a part of platform boot, device tree is being read to extract
randonmess bits. The 'rng-seed' property is used for that purpose.
After reading the value, the field was overridden with NOP instead of
being deleted or zeroed. The problem is that NOPed fields are later not
reused, and kexec code appended this property every time DTB is prepared:

  /* add rng-seed */
  if (rng_is_initialized()) {
          void *rng_seed;
          ret = fdt_setprop_placeholder(dtb, off, FDT_PROP_RNG_SEED,
                          RNG_SEED_SIZE, &rng_seed);
          if (ret)
                  goto out;
          get_random_bytes(rng_seed, RNG_SEED_SIZE);
  }
(source: arch/arm64/kernel/machine_kexec_file.c)

Taken together, DTB grew at each kexec by 140 bytes ie. size of the
newly added (and not overwritten) rng-seed property. ARM64 sets a hard
limit on FDT size at 2MB, which means that after at most 14,979 kexecs
DTB exceeded the limit causing catastrophic (but silent) failure in
setup_machine_fdt().

This commits addresses the issue as follows:
 1. Call to fdt_nop_property is replaced with overwriting the rng-seed
    value with zeros.
 2. Zeroed rng-seed gets special treatment and is not accepted as valid
    seed. Warning is emitted on zeroed value.
 3. Kexec_file code is modified to delete the zeroed property if it
    can't fill it with valid seed.
 4. Proper error handling is added for the case when DTB exceeds 2MB.

The change was tested in QEMU arm64 environment. To do so, kernel
containing the change was built and included in buildroot initramfs.
Subsequently, kernel was started in QEMU. Using kexec_file, new kernel
was loaded and kexec reboot was issued. DTB size was noted in this step.
After new kernel has booted, another kexec_file was issued. DTB size
was confirmed not to change.

Signed-off-by: Bartosz Szczepanek <bsz@amazon.de>
---
 arch/arm64/kernel/machine_kexec_file.c |  5 +++++
 drivers/of/fdt.c                       | 18 +++++++++++++++---
 drivers/of/kexec.c                     | 12 +++++++++++-
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index af1ca875c52c..af0e39f6c96d 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -170,6 +170,11 @@ int load_other_segments(struct kimage *image,
 	/* trim it */
 	fdt_pack(dtb);
 	dtb_len = fdt_totalsize(dtb);
+	if (dtb_len > MAX_FDT_SIZE) {
+		pr_err("DTB exceeds the maximum size: 0x%lx > 0x%x", dtb_len, MAX_FDT_SIZE);
+		goto out_err;
+	}
+	pr_info("DTB successfully created at 0x%lx (length 0x%lx)", (unsigned long)dtb, dtb_len);
 	kbuf.buffer = dtb;
 	kbuf.bufsz = dtb_len;
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index aedd0e2dcd89..8c2895cee682 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1019,6 +1019,18 @@ int __init early_init_dt_scan_memory(void)
 	return found_memory;
 }
 
+static int check_randomness_nonzero(const uint8_t *rng_seed, int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		if (rng_seed[i] != 0)
+			return true;
+
+	pr_warn("Provided rng-seed value is all zeros!");
+	return false;
+}
+
 int __init early_init_dt_scan_chosen(char *cmdline)
 {
 	int l, node;
@@ -1039,11 +1051,11 @@ int __init early_init_dt_scan_chosen(char *cmdline)
 	early_init_dt_check_for_elfcorehdr(node);
 
 	rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
-	if (rng_seed && l > 0) {
+	if (rng_seed && l > 0 && check_randomness_nonzero(rng_seed, l)) {
 		add_bootloader_randomness(rng_seed, l);
 
-		/* try to clear seed so it won't be found. */
-		fdt_nop_property(initial_boot_params, node, "rng-seed");
+		/* Zero out the rng-seed property */
+		memset((void *)rng_seed, 0, l);
 
 		/* update CRC check value */
 		of_fdt_crc32 = crc32_be(~0, initial_boot_params,
diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index 5b924597a4de..f5bfbac77a66 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -453,8 +453,18 @@ void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
 			goto out;
 		get_random_bytes(rng_seed, RNG_SEED_SIZE);
 	} else {
-		pr_notice("RNG is not initialised: omitting \"%s\" property\n",
+		pr_notice("RNG is not initialised: deleting \"%s\" property\n",
 			  "rng-seed");
+		/*
+		 * The rng-seed property may exist as zeroed stub. If so,
+		 * remove it to not confuse the incoming kernel.
+		 */
+		ret = fdt_delprop(fdt, chosen_node, "rng-seed");
+		if (ret == -FDT_ERR_NOTFOUND)
+			/* It's fine */
+			ret = 0;
+		else if (ret)
+			goto out;
 	}
 
 	ret = fdt_setprop(fdt, chosen_node, "linux,booted-from-kexec", NULL, 0);
-- 
2.47.1


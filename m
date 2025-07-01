Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CA41386B4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 18:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751394946; cv=none; b=W5M12KW2KKk0YRZ1Rm0cXIkYc0t1sMj/D5O9PbszL9IP01CGC+8WB1dxuxjBG+2YaAX3mzaaDJwxbeFerxn5WkReWe7GUwgdbzrnXpYmPinUYZA1waHqcY9KG6HsvhWbTMf1c9Mi5QrNpLoJIPtU7aGIcTtKWWHVxvvbZqEC5bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751394946; c=relaxed/simple;
	bh=c2RhFuOovKH8cruUl7l5/QuJDFYyICSNcAchlL5X3C8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jRhZxT7RNuNRBBKm/JC9pzWyBkHIRZ+Q6aOZR+/279S1pe2gF07UJQw+tZKoOBr0EesEexyJXbBZuZpeSYqC9x+cVZzalGqS9izyUtDMOxLCapO+jrWE/sg+uLsc5zhjSBRAfCz/3WRO3s4QAi88KLnOsqdFx/Vnsb6l0AOWMQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LS4YGSf5; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LS4YGSf5"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-748fe69a7baso5815504b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 11:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751394945; x=1751999745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c0U+s0Vyp4n94b4KR+Hv16kd0qrpXrvauaZ60DPcAJM=;
        b=LS4YGSf5lUUhIFfLt6pOjWai/CavTgk2tYzeXgI8OnTHtcqGjtfgWvKfq2hqdKavpl
         gOQk67hS0ZDdE7tUhzSYusT8Hgi+5ZPaL3K9Dzo20ADlpu/lV6EzoBjxTZpIa3XgU9Ky
         nsW7vYlP+C+ijkbHC6CiidLnDfOlNsnWqsRUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751394945; x=1751999745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0U+s0Vyp4n94b4KR+Hv16kd0qrpXrvauaZ60DPcAJM=;
        b=gdC/+V9cWhOiyNb+X9IPcW9QdKRjqLSkK5H3gG2mqglgnwGA+5zf+sdra0z+wgSq9/
         QqABpB/RvdElFvzVwLTWVLHufrc+8zJoi7XleVT1T6AA7cfIRjEeys2390LAh4Jry0dK
         H1TzM03oXqDCi7ynPHuf3qz0uD9VvsfRMmDAOGnep/yDhjx+uL3nteeUwHYh7t3ZgTas
         yJdqcBd/5p+KrWU0MjLaTI7e+u4y8oMNLer5tq0cI2VbjftDPfxkeDMF+asKZrNrTMvh
         uZhqV0F6omR3KiZIRDWG+KTI4U+EfcVJuXXc2cBrvdkUpX+Ni591ZgYwpiBWjEGr5Oge
         3+IQ==
X-Gm-Message-State: AOJu0Ywmrl6Mr1wsLW3Xm9J4wmqZpgeo2TyxO4KIZuyI9gxTT7g93nQQ
	aHLo5wLgB4d4lIQtTLfThfERzmqv27g8MDp0unYMCTgiPzgTS56PNWKWHrq3xm8Epw==
X-Gm-Gg: ASbGnctNxyBl1G/O9FFU7J6c8+/kZ0+9MJVmpWTjwk+sm7zqLvfbWFOyLo4j/XtKnx6
	3aRhOw1Zv9ydd+B/BzN4Vn4kWBYiztE7NBJ1N2tJIIe/RAoJBRvR63EmQqXLjpkwQIm7py83mqr
	sVyoPgm/jxcT9j3WyG1XhlQqzXotRxvEmhjeDqDt5pP0d9Z6/64qN8le/oA3Jm2g3nZocQcSdbd
	c3r3+3D1CKqpp1Vv7qATdLLFNRpFPwXDfPUAl4TwnpbHcAgr9GUJKw4SGWUcm2QKLF2GnNZ+/yJ
	mnJvJ3luZSXJk90p6yFB8vpgP/0MfWaApveuHR5YeJ/lJ5NQYuuSVVdoneWl2sK6OFMVla08FY6
	8/GzsAtHnmZoJ1wDvNBmwz3A6
X-Google-Smtp-Source: AGHT+IF+6ZLLBRZomIJJdPMOAh4wc+2Ijkc9vDXh1llkvdnbb8AaWnGCg/lc8coDH2IswaSx1grzmw==
X-Received: by 2002:a05:6a00:18a7:b0:736:4644:86ee with SMTP id d2e1a72fcca58-74af6f4078bmr24502776b3a.14.1751394944650;
        Tue, 01 Jul 2025 11:35:44 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:ff18:310e:c453:9166])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af541cc81sm12246277b3a.58.2025.07.01.11.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 11:35:44 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v3] checkpatch: Check for missing sentinels in ID arrays
Date: Tue,  1 Jul 2025 11:34:00 -0700
Message-ID: <20250701183537.501225-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All of the ID tables based on <linux/mod_devicetable.h> (of_device_id,
pci_device_id, ...) require their arrays to end in an empty sentinel
value. That's usually spelled with an empty initializer entry (e.g.,
"{}"), but also sometimes with explicit 0 entries, field initializers
(e.g., '.id = ""'), or even a macro entry (like PCMCIA_DEVICE_NULL).

Without a sentinel, device-matching code may read out of bounds.

I've found a number of such bugs in driver reviews, and we even
occasionally commit one to the tree. See commit 5751eee5c620 ("i2c:
nomadik: Add missing sentinel to match table") for example.

Teach checkpatch to find these ID tables, and complain if it looks like
there wasn't a sentinel value.

Test output:

  $ git format-patch -1 a0d15cc47f29be6d --stdout | scripts/checkpatch.pl -
  ERROR: missing sentinel in ID array
  #57: FILE: drivers/i2c/busses/i2c-nomadik.c:1073:
  +static const struct of_device_id nmk_i2c_eyeq_match_table[] = {
   	{
   		.compatible = "XXXXXXXXXXXXXXXXXX",
   		.data = (void *)(NMK_I2C_EYEQ_FLAG_32B_BUS | NMK_I2C_EYEQ_FLAG_IS_EYEQ5),
   	},
   };

  total: 1 errors, 0 warnings, 66 lines checked

  NOTE: For some of the reported defects, checkpatch may be able to
        mechanically convert to the typical style using --fix or --fix-inplace.

  "[PATCH] i2c: nomadik: switch from of_device_is_compatible() to" has style problems, please review.

  NOTE: If any of the errors are false positives, please report
        them to the maintainer, see CHECKPATCH in MAINTAINERS.

When run across the entire tree (scripts/checkpatch.pl -q --types
MISSING_SENTINEL -f ...), false positives exist:

* where macros are used that hide the table from analysis
  (e.g., drivers/gpu/drm/radeon/radeon_drv.c / radeon_PCI_IDS).
  There are fewer than 5 of these.

* where such tables are processed correctly via ARRAY_SIZE() (fewer than
  5 instances). This is by far not the typical usage of *_device_id
  arrays.

* some odd parsing artifacts, where ctx_statement_block() seems to quit
  in the middle of a block due to #if/#else/#endif.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 v1: https://lore.kernel.org/all/20241218232716.3624531-1-briannorris@chromium.org/

Changes in v3:
 * actually CC LKML this time (sorry, I accidentally sent v2 directly to
   maintainers)
 * no other change

Changes in v2:
 * add a few ID types I missed (i2c, i3c, ieee1394); this time I parsed:
     grep 'struct .*_device_id {' include/linux/mod_devicetable.h
 * account for some alternative sentinels (e.g.,
   ISAPNP_DEVICE_SINGLE_END)

 scripts/checkpatch.pl | 82 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 664f7b7a622c..cfa7db17fe0b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -685,6 +685,64 @@ our $tracing_logging_tags = qr{(?xi:
 	[\.\!:\s]*
 )};
 
+# Device ID types from include/linux/mod_devicetable.h.
+our $dev_id_types = qr{(?x:
+	acpi |
+	ap |
+	apr |
+	auxiliary |
+	bcma |
+	ccw |
+	cdx |
+	coreboot |
+	css |
+	dfl |
+	eisa |
+	fsl_mc |
+	hda |
+	hid |
+	hv_vmbus |
+	i2c |
+	i3c |
+	ieee1394 |
+	input |
+	ipack |
+	isapnp |
+	ishtp |
+	mcb |
+	mdio |
+	mei_cl |
+	mhi |
+	mips_cdmm |
+	of |
+	parisc |
+	pci |
+	pci_epf |
+	pcmcia |
+	platform |
+	pnp |
+	pnp_card |
+	rio |
+	rpmsg |
+	sdio |
+	sdw |
+	serio |
+	slim |
+	spi |
+	spmi |
+	ssam |
+	ssb |
+	tee_client |
+	typec |
+	ulpi |
+	usb |
+	vchiq |
+	vio |
+	virtio |
+	wmi |
+	zorro
+)_device_id};
+
 sub edit_distance_min {
 	my (@arr) = @_;
 	my $len = scalar @arr;
@@ -7678,6 +7736,30 @@ sub process {
 			WARN("DUPLICATED_SYSCTL_CONST",
 				"duplicated sysctl range checking value '$1', consider using the shared one in include/linux/sysctl.h\n" . $herecurr);
 		}
+
+# Check that *_device_id tables have sentinel entries.
+		if (defined $stat && $line =~ /struct $dev_id_types .*\[\] = \{/) {
+			my $stripped = $stat;
+
+			# Strip diff line prefixes.
+			$stripped =~ s/(^|\n)./$1/g;
+			# Line continuations.
+			$stripped =~ s/\\\n/\n/g;
+			# Strip whitespace, empty strings, zeroes, and commas.
+			$stripped =~ s/""//g;
+			$stripped =~ s/0x0//g;
+			$stripped =~ s/[\s$;,0]//g;
+			# Strip field assignments.
+			$stripped =~ s/\.$Ident=//g;
+
+			if (!(substr($stripped, -4) eq "{}};" ||
+			      substr($stripped, -6) eq "{{}}};" ||
+			      $stripped =~ /PCMCIA_DEVICE_NULL};$/ ||
+			      $stripped =~ /ISAPNP_DEVICE_SINGLE_END}};$/ ||
+			      $stripped =~ /ISAPNP_CARD_END}};$/)) {
+				ERROR("MISSING_SENTINEL", "missing sentinel in ID array\n" . "$here\n$stat\n");
+			}
+		}
 	}
 
 	# If we have no input at all, then there is nothing to report on
-- 
2.50.0.727.gbf7dc18ff4-goog


Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9401B24DCEE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751500392; cv=none; b=bvGYqh8mHzYj7g7JHwmTcU/eJFTzJ+6s6PazZJkYebHcasCDXGn9Wi7bXXLacY1IO8ZtK720q/FZJ/Ik4yb45YR9pMrTTq2EaeKpy4EWDZ14U0ryeGbiTnizl79A0DftwiZyQxfC1J5eqYP9vQHUVvQn7gDlaO5olFEMVuJEgWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751500392; c=relaxed/simple;
	bh=60cmWVsMpkK1pFI4r5IcfkDV/HsjZzHA9W3NDdH9LEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=piPXW1v3EbBY4jc+MAz7leWDA/WVrxgxJHmLgA3jgvPNN9gpY1XfKc2t/ROkGb8aaraE+j2aOt5JTmHmUhl3unE/cRA1h+qySv1wSQbNb0NvwtD8b+Fr9M+BValHEYAAxs5H+ekDJkojC0R+mFXpJUoSaEjJHxxSTeUZe01LzRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NDcuL8Lp; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NDcuL8Lp"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af6a315b491so4758755a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 16:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751500389; x=1752105189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yKirHgzQFemtszvhKGgUR6al3rts7Tv2D9K2BkzIZfs=;
        b=NDcuL8Lp56JNiowkWFLcHU/HZFdNOIXKYKgih+ChWdnCdwMaIMgueoltJ1we0JL5Zl
         ZQE1HTZjrq3c2OKglcUuxLovmZSJ3l/UuxEloU7rjKZ/95SD0/m8Oj3havmn5D1G9QEn
         3W3LEAsNmW+qZ0e6IWfVUqFnw298xLDglaQRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751500389; x=1752105189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKirHgzQFemtszvhKGgUR6al3rts7Tv2D9K2BkzIZfs=;
        b=lPmZU99n4nqfy4+mDDuHQeqvh214xOMzeMpw9Mpw1FU2aeV/n08Ak06qIZDgVhT0TR
         ITA/21Rx94ZshKHTVGXr1OpMn2sdPwwy75O4jtXdtY1GOY+mX8y4gxGQf8gfqFpJiPKy
         C6p4Aq6Hr+zod5G/fSsyZ8qCyYBLajtbYxAw4fbuRJ6SQ117xZ4plqFybH/NMx7EUFam
         4QsU/POfsjhvyaqr9P6O9arPNFLTTWIxSUacm1GcmXWMd2gunmsEfyWibqPAL1qfeV1k
         5qgkRlz3GkihPKMiKF4AVkJAe3mGbfHjdbX2RiYcwq/NjNMKo15ApyGqO4VCeVWaTjRW
         PljA==
X-Gm-Message-State: AOJu0YzJkijXDUbpK0v2UpFxkrQr8hl5b0EQt0v8eU4dWSBOCpg5MxwV
	fPLu20zDYpKw5Z/1z6Ek4b8UK+9gYKShtfms/FHGT/BEzkpO7yqRaBSPCr17hxrvqw==
X-Gm-Gg: ASbGncuNdUUEi34mukU8tIe9kHDupBb83iZ+w0MawGNdWE7kVadJd1d4FktS1fRMlnf
	bT6v75JhVz7bGrbpooMNOwkTD8WkF5IXIDuqm2kH0hJoROJQw1GSe2GrRwRY+awt/v+QZuy37sT
	0543sTV7ae0PSY7kM0vOAqtBOZU2giXWeQTTIK2ce1SrSyVwsuwYBBMX7x/PW5kky+JDQscDI55
	bt5mlPYlIElyGIPcz2oN6ITuWaZfKkJb2B6aQyGdQfPOgPvSl31vd8JrU7VsBpeISScdetL3U9J
	SwiQgoVjE8gncr/beFX3fuXlmZ8to6kaQHdHulP/X1YHXFq39HNcS3kajSfw+zlifj4EokVXiF3
	hNitla77aSD5feytfNUNrue0=
X-Google-Smtp-Source: AGHT+IHFNtyPRbCQ4OtOU+YA8r0NGo6nBgzr3CbCg7F143JjsUcvE6Xh2qHno7JPfS3ca6mIqqOdqg==
X-Received: by 2002:a17:90b:2790:b0:312:1508:fb4e with SMTP id 98e67ed59e1d1-31a9d68d5a5mr1755749a91.17.1751500388736;
        Wed, 02 Jul 2025 16:53:08 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:a88f:fae1:55b0:d25])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31a9cb7df5bsm801698a91.0.2025.07.02.16.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 16:53:07 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v4] checkpatch: Check for missing sentinels in ID arrays
Date: Wed,  2 Jul 2025 16:52:00 -0700
Message-ID: <20250702235245.1007351-1-briannorris@chromium.org>
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

Also, not every "struct *_device_id" is in fact a sentinel-requiring
structure, but even with such types, false positives are very rare.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 v1: https://lore.kernel.org/all/20241218232716.3624531-1-briannorris@chromium.org/

Changes in v4:
 * switch to a fuzzy regex instead of a fixed list of <foo>_device_id
   types
 * allow for variations on whitespace
 * add NULL sentinel

Changes in v3:
 * actually CC LKML this time (sorry, I accidentally sent v2 directly to
   maintainers)
 * no other change

Changes in v2:
 * add a few ID types I missed (i2c, i3c, ieee1394); this time I parsed:
     grep 'struct .*_device_id {' include/linux/mod_devicetable.h
 * account for some alternative sentinels (e.g.,
   ISAPNP_DEVICE_SINGLE_END)

 scripts/checkpatch.pl | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 664f7b7a622c..a241cea2855e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -685,6 +685,9 @@ our $tracing_logging_tags = qr{(?xi:
 	[\.\!:\s]*
 )};
 
+# Device ID types like found in include/linux/mod_devicetable.h.
+our $dev_id_types = qr{\b[a-z]\w*_device_id\b};
+
 sub edit_distance_min {
 	my (@arr) = @_;
 	my $len = scalar @arr;
@@ -7678,6 +7681,31 @@ sub process {
 			WARN("DUPLICATED_SYSCTL_CONST",
 				"duplicated sysctl range checking value '$1', consider using the shared one in include/linux/sysctl.h\n" . $herecurr);
 		}
+
+# Check that *_device_id tables have sentinel entries.
+		if (defined $stat && $line =~ /struct\s+$dev_id_types\s+\w+\s*\[\s*\]\s*=\s*\{/) {
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
+			      $stripped =~ /ISAPNP_DEVICE_SINGLE_END}};$/ ||
+			      $stripped =~ /ISAPNP_CARD_END}};$/ ||
+			      $stripped =~ /NULL};$/ ||
+			      $stripped =~ /PCMCIA_DEVICE_NULL};$/)) {
+				ERROR("MISSING_SENTINEL", "missing sentinel in ID array\n" . "$here\n$stat\n");
+			}
+		}
 	}
 
 	# If we have no input at all, then there is nothing to report on
-- 
2.50.0.727.gbf7dc18ff4-goog


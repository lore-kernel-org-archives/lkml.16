Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63DD1401C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749592510; cv=none; b=smXOyMJJw+okkma5GLP6B/IM83W9GcTCyZSNA0ef3bXtZmHjOHEaE4++JGgG6yUwWTrtFSbSX6ZxLPvhlff5BDG7R6Xm6Djwf5jOBs2+4nG1nDgez/PzE8CoETuGB8F7rdLrSBAQdLVjqCGNr9wmlO0MX1tK2X56w1u8ktgTpdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749592510; c=relaxed/simple;
	bh=jHqE/M83tEgWWEESsQZJOZxo4PhfowOIr8iQtAHpI7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=b8Q5MJy1Pmnpj2kLggM2Vv6r2JZdNEzlKBikxCkxc7GAH3I4x70UgpDna8k3ABBK6J13rlFt66wqY0dX0U0VFeHQEPnJ5X4QJzjS12Gki8kKqBJOB4ZLs07/lwV3UCHLiS9ls2MS9fEX1pQx7eSjjWSE8HZMD435tWYJzZgCrhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EnYiEQgl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnYiEQgl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749592508; x=1781128508;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=jHqE/M83tEgWWEESsQZJOZxo4PhfowOIr8iQtAHpI7M=;
  b=EnYiEQglygHxwB3lSs5nCRIH0Ga3CvZi07lMTzTexAav6mRqooTJXInd
   kAmNt5bvMQBSOe/REkEQsM3maaI7Ow731exXAxDhXIT7Z9F38rfjiJ4nZ
   kwG3/IiaNG84+eoiSquFFpY/3r8p+SAU8bSdsJQjQ7ejEcLi20DxKJFqo
   7Qd5Xe5oi4+9oAAXvhGU+B1j/JwHczHXUz5YbaJpIXZRQBwAxJzEA3ln0
   qxFcHZOWJVu/cqfPnFWJ2hHLp6yDwMVVQD1ESUvmLf6Whw+8a2WdatAGa
   fKZMquYbHwE/NHlwOX0kCrnbS0+zsCLVq7tWFUA5IbwbgRMQqIk7Y5yrW
   A==;
X-CSE-ConnectionGUID: 3hENIpXYToGE6lpFFfa9Yg==
X-CSE-MsgGUID: H5OVS6EnRKy2mXhG3lQOCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51577974"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="51577974"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 14:55:08 -0700
X-CSE-ConnectionGUID: wMsJenf1TFSH/QEHBAKL4g==
X-CSE-MsgGUID: X7qn84rdS2mqpLfeMJKBLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="147336540"
Received: from jekeller-desk.jf.intel.com ([10.166.241.15])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 14:55:07 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Tue, 10 Jun 2025 14:54:51 -0700
Subject: [PATCH v2] drm/nouveau/bl: increase buffer size to avoid truncate
 warning
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250610-jk-nouveua-drm-bl-snprintf-fix-v2-1-7fdd4b84b48e@intel.com>
X-B4-Tracking: v=1; b=H4sIAKqpSGgC/42NQQ6CMBBFr0Jm7RhaKAZX3sOwKG2RUWhJC42G9
 O5WTuDyvZ+8v0MwnkyAa7GDN5ECOZuBnwpQo7QPg6QzAy+5KJuyxucLrdui2SRqP2M/YbCLJ7s
 OONAbFVdScCErzQfIkcWbrI+De5d5pLA6/zn+IvvZv9ORIcNL2zPRVlI3TX3Lk5nOys3QpZS+B
 EwQ1MwAAAA=
X-Change-ID: 20250604-jk-nouveua-drm-bl-snprintf-fix-c2ca525a3d2f
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Ben Skeggs <bskeggs@redhat.com>, Pierre Moreau <pierre.morrow@free.fr>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Philip Li <philip.li@intel.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Timur Tabi <ttabi@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.14.2

The nouveau_get_backlight_name() function generates a unique name for the
backlight interface, appending an id from 1 to 99 for all backlight devices
after the first.

GCC 15 (and likely other compilers) produce the following
-Wformat-truncation warning:

nouveau_backlight.c: In function ‘nouveau_backlight_init’:
nouveau_backlight.c:56:69: error: ‘%d’ directive output may be truncated writing between 1 and 10 bytes into a region of size 3 [-Werror=format-truncation=]
   56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
      |                                                                     ^~
In function ‘nouveau_get_backlight_name’,
    inlined from ‘nouveau_backlight_init’ at nouveau_backlight.c:351:7:
nouveau_backlight.c:56:56: note: directive argument in the range [1, 2147483647]
   56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
      |                                                        ^~~~~~~~~~~~~~~~
nouveau_backlight.c:56:17: note: ‘snprintf’ output between 14 and 23 bytes into a destination of size 15
   56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The warning started appearing after commit ab244be47a8f ("drm/nouveau:
Fix a potential theorical leak in nouveau_get_backlight_name()") This fix
for the ida usage removed the explicit value check for ids larger than 99.
The compiler is unable to intuit that the ida_alloc_max() limits the
returned value range between 0 and 99.

Because the compiler can no longer infer that the number ranges from 0 to
99, it thinks that it could use as many as 11 digits (10 + the potential -
sign for negative numbers).

The warning has gone unfixed for some time, with at least one kernel test
robot report. The code breaks W=1 builds, which is especially frustrating
with the introduction of CONFIG_WERROR.

The string is stored temporarily on the stack and then copied into the
device name. Its not a big deal to use 11 more bytes of stack rounding out
to an even 24 bytes. Increase BL_NAME_SIZE to 24 to avoid the truncation
warning. This fixes the W=1 builds that include this driver.

Compile tested only.

Fixes: ab244be47a8f ("drm/nouveau: Fix a potential theorical leak in nouveau_get_backlight_name()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312050324.0kv4PnfZ-lkp@intel.com/
Suggested-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
Changes in v2:
- Just increase the buffer size
- Link to v1: https://lore.kernel.org/r/20250604-jk-nouveua-drm-bl-snprintf-fix-v1-1-79b1593ad664@intel.com
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index d47442125fa183146135f3725eae161c68e2a900..9aae26eb7d8fba54c8a989bfe7ecc2b10ccf7f61 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -42,7 +42,7 @@
 #include "nouveau_acpi.h"
 
 static struct ida bl_ida;
-#define BL_NAME_SIZE 15 // 12 for name + 2 for digits + 1 for '\0'
+#define BL_NAME_SIZE 24 // 12 for name + 11 for digits + 1 for '\0'
 
 static bool
 nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],

---
base-commit: 90b83efa6701656e02c86e7df2cb1765ea602d07
change-id: 20250604-jk-nouveua-drm-bl-snprintf-fix-c2ca525a3d2f

Best regards,
-- 
Jacob Keller <jacob.e.keller@intel.com>


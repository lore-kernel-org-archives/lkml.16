Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ECF1401B;
	Fri, 20 Jun 2025 11:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750418311; cv=none; b=MVMSOsAkHmvxUcJglBZ5L+yz/XRLRJUgoXVe0Ataxl9Aol7tT+S19sYGlggLRN6Q333YbhBBYkgWFaD+kJtSrg2538l53yUcDQbh/SJE741SX/sDVBGp1b1LKOLTonS8vSImBaZ+G8blIwAZBDDllC0yB0PRXCLKz0sbf7EyHw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750418311; c=relaxed/simple;
	bh=GzeWP4djQPFAJn699mpS/mLYTmBt8cmn0T9XsL6bfQw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jqHGYvO5VxRGz88IvU6pi0xNKnCjUMp9er8QoeZbunDVga20mo5cmy4Aj+cHcesiBX859XWXYrTteIvn2Cia6lIYZpPG8xOeyPtvsw0MEltZ9Xm33kBVky/4bSaEatO6+/I3XtRjlJRisuWk/3jJMmerXk8V7LteAL8jRbp4vyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0zxzlzK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0zxzlzK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6339C4CEE3;
	Fri, 20 Jun 2025 11:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750418310;
	bh=GzeWP4djQPFAJn699mpS/mLYTmBt8cmn0T9XsL6bfQw=;
	h=From:To:Cc:Subject:Date:From;
	b=a0zxzlzKAh+IvrQIpt4x3A3DeiYbTWKo+AkpLk1sljVMr/AQI4ohgXpAKTY2eM0DP
	 QTTilxgSkDIrLQKahcMWc23bvfLKlGJe7cflmVHvAr5krdnINxbmcJ0kjqODZdVVdm
	 gARq6R51AvFWDxKq9HanJakEIZTX/IONIS0YzROSralXTIQ9w/a7VJL96KHH4KfvWs
	 ieP54O81vZA2Hg2DVxBBK8MQyfX/rbSwjkkctGDRpJdyvdNoJJ/QTL3/0leEqr8Zto
	 zMIoMqca0X4k6i+hLIWuoN644TSIbnSvpAj8MY0WVLUTGfDiGCO0TsI6CppMNvtz+0
	 a5qDzlHk85Elw==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Ashutosh Dixit <ashutosh.dixit@intel.com>,
	Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Nam Cao <namcao@linutronix.de>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] i915: fix build error some more
Date: Fri, 20 Jun 2025 13:18:18 +0200
Message-Id: <20250620111824.3395007-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

An earlier patch fixed a build failure with clang, but I still see the
same problem with some configurations using gcc:

drivers/gpu/drm/i915/i915_pmu.c: In function 'config_mask':
include/linux/compiler_types.h:568:38: error: call to '__compiletime_assert_462' declared with attribute error: BUILD_BUG_ON failed: bit > BITS_PER_TYPE(typeof_member(struct i915_pmu, enable)) - 1
drivers/gpu/drm/i915/i915_pmu.c:116:3: note: in expansion of macro 'BUILD_BUG_ON'
  116 |   BUILD_BUG_ON(bit >

As I understand it, the problem is that the function is not always fully
inlined, but the __builtin_constant_p() can still evaluate the argument
as being constant.

Marking it as __always_inline so far works for me in all configurations.

Fixes: a7137b1825b5 ("drm/i915/pmu: Fix build error with GCOV and AutoFDO enabled")
Fixes: a644fde77ff7 ("drm/i915/pmu: Change bitmask of enabled events to u32")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/i915_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 990bfaba3ce4..5bc696bfbb0f 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -108,7 +108,7 @@ static unsigned int config_bit(const u64 config)
 		return other_bit(config);
 }
 
-static u32 config_mask(const u64 config)
+static __always_inline u32 config_mask(const u64 config)
 {
 	unsigned int bit = config_bit(config);
 
-- 
2.39.5


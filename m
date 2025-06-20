Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F17F2253FF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750419410; cv=none; b=ArEqgyXRXW9ohPlCs+1S+J9xNmBSfMAzQjS8yoa+8BCs3t0Oy/uaQiCvpJ81RKj9Gk0+Wp780Rjlp+pTq5sth/5Pd8Y/EiVPjm1nJVmhS24fxuA4tO8tWHpyFOApM2yJt9pFdTS+qyhdleMBv9xecsf3cXFFl8LWj3a6j4w0YKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750419410; c=relaxed/simple;
	bh=KMV6pV/kGxSzG8IdFs7/nXJZ+xMhJveIsIX/RawZA4o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mVzbEeJpQD/Qug7MhVVO4E5ODDIPpUniKunsBYjjR1GJIUh00dOJOfLDWhdp7QFREYfxHGVyCev5PcitKaYf5Xn68u09ZppRuuGQt4ZMeX4RyNtUdu2lPoCRitJIoS9SZt5ICnHoGUoqhypI7gPV/ZDL5mRL6fts2tFPLVvJd74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNh4RC7l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNh4RC7l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A012C4CEE3;
	Fri, 20 Jun 2025 11:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750419410;
	bh=KMV6pV/kGxSzG8IdFs7/nXJZ+xMhJveIsIX/RawZA4o=;
	h=From:To:Cc:Subject:Date:From;
	b=jNh4RC7lwRhwHCxEGVdG3PS/1a/mttemmrnH4Zv4FxMJjNVyRFYEXIg1C4c7cOh95
	 HarbS94f0MzwTeEH1bkbOA80EpE3PidriD8+V+r79fS30nCfZhmBnmHzYKlMH7vamw
	 0A2mho1nNx8oyTqbK5vH0XWQN9oHZYoK6O1uLoxlnPYJVPizbh4eSz/R0V+ffxKtB3
	 RoQ69taf3255fQT4cGhCAH1FZdp65OiAKAJH4z1HYV83aRNEBqpgVaV8qSKW7XuslB
	 b1PDCiX6chfwd+YnmDZHBn6BoOOr6qEzv/lf/QEUEj9w6yzxWztC3F0xHpCct23T4X
	 mDmk9r4Rw9JBQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nitin Gote <nitin.r.gote@intel.com>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	renjun wang <renjunw0@foxmail.com>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915: reduce stack usage in igt_vma_pin1()
Date: Fri, 20 Jun 2025 13:36:38 +0200
Message-Id: <20250620113644.3844552-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The igt_vma_pin1() function has a rather high stack usage, which gets
in the way of reducing the default warning limit:

In file included from drivers/gpu/drm/i915/i915_vma.c:2285:
drivers/gpu/drm/i915/selftests/i915_vma.c:257:12: error: stack frame size (1288) exceeds limit (1280) in 'igt_vma_pin1' [-Werror,-Wframe-larger-than]

There are two things going on here:

 - The on-stack modes[] array is really large itself and gets constructed
   for every call, using around 1000 bytes itself depending on the configuration.

 - The call to i915_vma_pin() gets inlined and adds another 200 bytes for
   the i915_gem_ww_ctx structure since commit 7d1c2618eac5 ("drm/i915: Take
   reservation lock around i915_vma_pin.")

The second one is easy enough to change, by moving the function into the
appropriate .c file. Since it is already large enough to not always be
inlined, this seems like a good idea regardless, reducing both the code size
and the internal stack usage of each of its 67 callers.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/i915_vma.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/i915/i915_vma.h | 22 ++--------------------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 632e316f8b05..25e97031d76e 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1607,6 +1607,26 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	return err;
 }
 
+int i915_vma_pin(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
+{
+	struct i915_gem_ww_ctx ww;
+	int err;
+
+	i915_gem_ww_ctx_init(&ww, true);
+retry:
+	err = i915_gem_object_lock(vma->obj, &ww);
+	if (!err)
+		err = i915_vma_pin_ww(vma, &ww, size, alignment, flags);
+	if (err == -EDEADLK) {
+		err = i915_gem_ww_ctx_backoff(&ww);
+		if (!err)
+			goto retry;
+	}
+	i915_gem_ww_ctx_fini(&ww);
+
+	return err;
+}
+
 static void flush_idle_contexts(struct intel_gt *gt)
 {
 	struct intel_engine_cs *engine;
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 6a6be8048aa8..14ccbd0636bb 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -289,26 +289,8 @@ int __must_check
 i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 		u64 size, u64 alignment, u64 flags);
 
-static inline int __must_check
-i915_vma_pin(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
-{
-	struct i915_gem_ww_ctx ww;
-	int err;
-
-	i915_gem_ww_ctx_init(&ww, true);
-retry:
-	err = i915_gem_object_lock(vma->obj, &ww);
-	if (!err)
-		err = i915_vma_pin_ww(vma, &ww, size, alignment, flags);
-	if (err == -EDEADLK) {
-		err = i915_gem_ww_ctx_backoff(&ww);
-		if (!err)
-			goto retry;
-	}
-	i915_gem_ww_ctx_fini(&ww);
-
-	return err;
-}
+int __must_check
+i915_vma_pin(struct i915_vma *vma, u64 size, u64 alignment, u64 flags);
 
 int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 		  u32 align, unsigned int flags);
-- 
2.39.5


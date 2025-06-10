Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4984C28AB03
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548036; cv=none; b=dcWMeMBxy940QKd8B/qicpyzZD7miji/Ep578bgrS4dAnHClEQLrzpnOYEqzPEAfuVViWQULlSDDpVnPJhxxBcbkipO+evt2zbUdOFMIJ/hsdAogOS0eqF5cWpf3vmsNaa38mikzS2e35dW/9dmXoxf7wTDCfkS267W7vbJS03Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548036; c=relaxed/simple;
	bh=f82rGVWrjBouF2BTswBLqRANHumddvbr8a+wkNyzR4k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cVngTV3LizqCLt2gmdZDexoOV7NWwIx4I3ebteNCpUcgr6N1r9P1s6gx5t8dN14AfJmyY3ODzCEMYY4H+RE5H4ZExbH734vK3l3nNUxxpQhqIABgrRJaC5YfsY2XH9PNVX9v3AWptm13rOCv0HccfXRS8PmDS2bjDGpH8dy0HoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eU2iLa13; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eU2iLa13"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5097C4CEED;
	Tue, 10 Jun 2025 09:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749548034;
	bh=f82rGVWrjBouF2BTswBLqRANHumddvbr8a+wkNyzR4k=;
	h=From:To:Cc:Subject:Date:From;
	b=eU2iLa13FDxPa1xFykinwvwxfaaK0xrlfoF5ZFZZtDWwD5aAJ80Sf+DgZKIuF4X6O
	 QoEcXA55nhnY9jk4zQqe/eHGWCpbwp/CMjB0r1RyzBgbuJOITJIwaP5CPrZbnpNqEw
	 Thm55C8JLKvQJP/iDKEZ7G7uxyKKCXG15Zf4Hv4BDSGp3ZZ2ifi8VopUXSiSqma1Cm
	 9UwsYghqz5vZGkAbI72NNK8xU2mT9rj+NOWoInx02fxL5MWJILGBw7+ykKGrf7eMa6
	 vRA2+VWBESdd3Pjf5iozQPdDa+rfcMaFuOsTALp8+9HDQ2uhFkM09ib/zzPqDAMCvy
	 I8pKgAPP/o+Dw==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/test: reduce stack size in drm_exec_test
Date: Tue, 10 Jun 2025 11:33:46 +0200
Message-Id: <20250610093350.2645965-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

test_prepare_array() is one of the functions that uses more than
a kilobyte of stack on 64-bit machines, though it stays under
the usual warning limit of 2KB:

drivers/gpu/drm/tests/drm_exec_test.c: In function 'test_prepare_array':
drivers/gpu/drm/tests/drm_exec_test.c:171:1: error: the frame size of 1304 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]

In order to eventually lower that limit, change the two large
drm_gem_object objects to be statically allocated. This works here
because the tests are always called sequentially, and it is simpler than
using kzalloc().

Fixes: 9710631cc8f3 ("drm: add drm_exec selftests v4")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/tests/drm_exec_test.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
index d6c4dd1194a0..f2ac06a07707 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -18,6 +18,8 @@
 
 #include "../lib/drm_random.h"
 
+static struct drm_gem_object gobj, gobj2;
+
 struct drm_exec_priv {
 	struct device *dev;
 	struct drm_device *drm;
@@ -54,7 +56,6 @@ static void sanitycheck(struct kunit *test)
 static void test_lock(struct kunit *test)
 {
 	struct drm_exec_priv *priv = test->priv;
-	struct drm_gem_object gobj = { };
 	struct drm_exec exec;
 	int ret;
 
@@ -74,7 +75,6 @@ static void test_lock(struct kunit *test)
 static void test_lock_unlock(struct kunit *test)
 {
 	struct drm_exec_priv *priv = test->priv;
-	struct drm_gem_object gobj = { };
 	struct drm_exec exec;
 	int ret;
 
@@ -101,7 +101,6 @@ static void test_lock_unlock(struct kunit *test)
 static void test_duplicates(struct kunit *test)
 {
 	struct drm_exec_priv *priv = test->priv;
-	struct drm_gem_object gobj = { };
 	struct drm_exec exec;
 	int ret;
 
@@ -128,7 +127,6 @@ static void test_duplicates(struct kunit *test)
 static void test_prepare(struct kunit *test)
 {
 	struct drm_exec_priv *priv = test->priv;
-	struct drm_gem_object gobj = { };
 	struct drm_exec exec;
 	int ret;
 
@@ -150,13 +148,11 @@ static void test_prepare(struct kunit *test)
 static void test_prepare_array(struct kunit *test)
 {
 	struct drm_exec_priv *priv = test->priv;
-	struct drm_gem_object gobj1 = { };
-	struct drm_gem_object gobj2 = { };
-	struct drm_gem_object *array[] = { &gobj1, &gobj2 };
+	struct drm_gem_object *array[] = { &gobj, &gobj2 };
 	struct drm_exec exec;
 	int ret;
 
-	drm_gem_private_object_init(priv->drm, &gobj1, PAGE_SIZE);
+	drm_gem_private_object_init(priv->drm, &gobj, PAGE_SIZE);
 	drm_gem_private_object_init(priv->drm, &gobj2, PAGE_SIZE);
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
@@ -166,7 +162,7 @@ static void test_prepare_array(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	drm_exec_fini(&exec);
 
-	drm_gem_private_object_fini(&gobj1);
+	drm_gem_private_object_fini(&gobj);
 	drm_gem_private_object_fini(&gobj2);
 }
 
-- 
2.39.5


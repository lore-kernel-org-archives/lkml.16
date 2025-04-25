Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A62FC2FA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=hHFdtK1cjw/lCZwU1fQIQZ2htlSNwv5lSoGWDFjJ5kyR0w55Sf6EJyLQ05Svcyri2EhZFBYCTROntLgCz5z0GOqK6Xbc8Fa7S8WVa1u9z2BAU9kxXgVq/ikaronMKQujN7LKJl7tX2fXBMvJKlt3qbgubDc3lTCdhpDrD5HbqIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=VlNjobFFO2OnPAUIEbW4a0d2nydURUzYRuMV5k/BDuI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aYHTDCDQk7sV8YF8uRduXTIOZNIwjbXFVckqJGbDNW1QoRJR2S5S8QBg6NkhjRYbDkx7DTxwqMHU53tgUS9UnGyA1ifJ2lznP0+uoiBml9i86Y3mXjp/vA/9GHm2V12DrKnMqyYCopUlIub4I+aBAiwHX8oynbXZ+jnxToRKv7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e0j1TMee; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0j1TMee"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D40C4CEED;
	Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540907;
	bh=VlNjobFFO2OnPAUIEbW4a0d2nydURUzYRuMV5k/BDuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e0j1TMeeWVtP3aoH+eKwJ5nQddqE5wpvJgY6YqezDj47pbOfCgjUV81PMH6bePQa0
	 Ic5wR2DN5bQxbRagNHbOetQTg27mLcK0V1lcI1WU4mRCb4IHGYHC/3O2hr0Z3V5iaq
	 t2hN0qnyZ/9nrAO5Px8U2DM+pfUlReBZB3wk7Jb5TMvlooNm8rt1Ie7SvEHCEt50qk
	 9pd9eQHaYoBdt8Em0YGo6+zcvLyfDaTamWVo5NbCsRR3VUNOMR5RWdWuYzg/xSPCZ9
	 Vn7PyYW2u4pXgASUomZ9N1FupuuTjBob4Zsa2SUet2mZ9PtTnrJCuGnw3ir3KlDyy3
	 B3ayykyN8ZICg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2F355CE19CD; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 05/20] drm/amd/pm: Avoid open-coded use of ratelimit_state structure's internals
Date: Thu, 24 Apr 2025 17:28:11 -0700
Message-Id: <20250425002826.3431914-5-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The amdgpu_set_thermal_throttling_logging() function directly accesses
the ratelimit_state structure's ->missed field, which work, but which
also makes it more difficult to change this field.  Therefore, make
use of the ratelimit_state_reset_miss() function instead of directly
accessing the ->missed field.

Nevertheless, open-coded use of ->burst and ->interval is still permitted,
for example, for runtime sysfs adjustment of these fields.

Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503180826.EiekA1MB-lkp@intel.com/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Cc: Kenneth Feng <kenneth.feng@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Xinhui Pan <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: <amd-gfx@lists.freedesktop.org>
Cc: <dri-devel@lists.freedesktop.org>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 922def51685b0..d533c79f7e215 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -1606,7 +1606,6 @@ static ssize_t amdgpu_set_thermal_throttling_logging(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 	long throttling_logging_interval;
-	unsigned long flags;
 	int ret = 0;
 
 	ret = kstrtol(buf, 0, &throttling_logging_interval);
@@ -1617,18 +1616,12 @@ static ssize_t amdgpu_set_thermal_throttling_logging(struct device *dev,
 		return -EINVAL;
 
 	if (throttling_logging_interval > 0) {
-		raw_spin_lock_irqsave(&adev->throttling_logging_rs.lock, flags);
 		/*
 		 * Reset the ratelimit timer internals.
 		 * This can effectively restart the timer.
 		 */
-		adev->throttling_logging_rs.interval =
-			(throttling_logging_interval - 1) * HZ;
-		adev->throttling_logging_rs.begin = 0;
-		adev->throttling_logging_rs.printed = 0;
-		adev->throttling_logging_rs.missed = 0;
-		raw_spin_unlock_irqrestore(&adev->throttling_logging_rs.lock, flags);
-
+		ratelimit_state_reset_interval(&adev->throttling_logging_rs,
+					       (throttling_logging_interval - 1) * HZ);
 		atomic_set(&adev->throttling_logging_enabled, 1);
 	} else {
 		atomic_set(&adev->throttling_logging_enabled, 0);
-- 
2.40.1


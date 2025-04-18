Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEB021A459
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996443; cv=none; b=KlS1hZtx8HrprKCi3jQ9nJPp/9GDdF2R35k6Pbh/BRPauqJDvSQcU9uONHTPTdeK1JEqFBweyUtLeCr6rLpbCIWw1/fiPNyct3KcFkJYj3blKUBTd3VFQEOWJ/UB4JLa0PTDnAF+XiB0kQ9hP2wKJW0GdS4FFZqKEyI1SJIekEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996443; c=relaxed/simple;
	bh=OZmjqaYou2hOWVgwSLN1prGm2SZUlosb+4HXW4GaF/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ll73e+7r5wxyyE+BxsxMNieEAYkbOyVoVpdymDhgotYDjPg10xj4VT5TDl4YNAi1BZOBqjUgsR3nGCy5Vj3Jrou9zHSFfCeHO5TggSo3MBX/XMX54JxR4g/8bvwj651t+Vg9hbMRcOuni6fCnFj89IZOpsoF8ByKtf/yjEiAcQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnvfy0p2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnvfy0p2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6707DC4CEF3;
	Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744996442;
	bh=OZmjqaYou2hOWVgwSLN1prGm2SZUlosb+4HXW4GaF/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lnvfy0p2QOMF7gsoDLe3MV10TIIRdiZCaTWZzcqt8sOh+iFB7VU3UQNMfzYkk3LKj
	 WCXFCPMaCWZUGhIK6W0OoUuVfApXNaER0yt6pOIQ0E0P3niqeAO2w5qfc3kQ4OIZOt
	 jnqRxMOtiDmSPYVZ8aXK+bDGo86NzcIaQmmj/2YDW6B4DFPaVJ7VhjPuLDrqrZbDW9
	 PgwntmM117DGIqmHuZ3ZkddPfpa7n4oT73b9+vNy/aCNNlWz3oFhiP6p0jc5+Qwhk4
	 wINXj47NC05MDQJIRJpvKnL+WtzajVq6rHpxi81qxO7N9B448ya/3NCwXwJl0N+amy
	 T0FiOeZsq5d8w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E25EDCE11D5; Fri, 18 Apr 2025 10:14:01 -0700 (PDT)
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
Subject: [PATCH v2 ratelimit 05/14] drm/amd/pm: Avoid open-coded use of ratelimit_state structure's internals
Date: Fri, 18 Apr 2025 10:13:50 -0700
Message-Id: <20250418171359.1187719-5-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
References: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
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

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503180826.EiekA1MB-lkp@intel.com/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
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


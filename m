Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5080B2E62BF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743714917; cv=none; b=sgS4nBfJ9BYnIdQyt8tYp2XLtmdIdugag4gNIscGPqF4tJgs9KzRYhd8Pz3xnMNIOMO1RgWJG1Fkuz9/DmVlVxHCEw/N4ZQOrC7cZpiUvMd+XUVihzdx1jLgz+i7Cd/ZHb9hrIPSqrNa3nq4lXmwkyoF6O5BdJtF7arSMiTPJcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743714917; c=relaxed/simple;
	bh=4UdVmmVPfwx49eOtA9WGqhb1DLUQPHT/0m0UFvwzS+4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WSeybR+o7yyHOwlqBbdCzq/OavYaMKU8N1gPYTE7PUhg4s5iSvqH9ythZBSJhGMTYs3Wns+jzQunb0qcW6NhdESKbagVSC9733BJ7iRCw8frhvzLbgEgNoaG2HJ0zoCFKCfMCxlHQG+6Hc1n1uReG39YMpBXt/sAD6fWsbo/aoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VZgR4R2f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZgR4R2f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A23C4CEE8;
	Thu,  3 Apr 2025 21:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743714916;
	bh=4UdVmmVPfwx49eOtA9WGqhb1DLUQPHT/0m0UFvwzS+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VZgR4R2foubZ/v5VPKKWMVB4Q+5WzqQS6CrS+G4tBeUemtxRb90IZZZgttSE+72Wa
	 FEyU1YTag4I5gHW3aFDDDYgGku40+hIZczzNGkOfp2q+tTcCS9g6uExqwEA5jYnM3/
	 m2SI8/QvKCP/Ua5cgvSrL6FfWYOD1dJYpHkSfN0lv18TOQ3hE0si2aiHqAo+ceggSB
	 5jbxOo+rXZc0v382B/miu7brEwheyBj7JG4XqFg+Rp4DPYRq0nQiBT5i5V9Rk4lI+W
	 kwF92d5pM6mWjBE6ngHd8CLyZezNGKY+47qZy4W9wt4Qu1s4pgqOvjBm8LloNZX6ne
	 8+2QF02VgLomQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9DD69CE0C98; Thu,  3 Apr 2025 14:15:15 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	"Paul E. McKenney" <paulmck@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 4/9] drm/amd/pm: Avoid open-coded use of ratelimit_state structure's internals
Date: Thu,  3 Apr 2025 14:15:09 -0700
Message-Id: <20250403211514.985900-4-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
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
Cc: Kenneth Feng <kenneth.feng@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
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
index e8ae7681bf0a3..6adf4e8822108 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -1663,7 +1663,6 @@ static ssize_t amdgpu_set_thermal_throttling_logging(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 	long throttling_logging_interval;
-	unsigned long flags;
 	int ret = 0;
 
 	ret = kstrtol(buf, 0, &throttling_logging_interval);
@@ -1674,18 +1673,12 @@ static ssize_t amdgpu_set_thermal_throttling_logging(struct device *dev,
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


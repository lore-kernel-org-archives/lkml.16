Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8AA2836B4
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750417778; cv=none; b=b0tlcIK6TMTyF0fCacoRlGV/6+EWUnon2FgYWJZ/MzJ+CcFYXgHIjnQOe8wV0RrsW0ka1qpnuwp47d2HLpp6K5e5FK/I/fTod8okegVLdU90dlyuYaz8J6sUwDoWmUhqjWVMu6dG6F9el4dN0QCPGw34LSgP7F5z60mdWoI45Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750417778; c=relaxed/simple;
	bh=U6TPdmTbp0rz+wPI0kkF0Wk6xpzhmG/dlFYR+tX1PT4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ej+URfCDE0q/GuEoDo8K27eSVqItR6Q4DwQ1/el+6ebY7oUcHQ8IZdWVpvVgJRLbM71THEYSsMSwDI3XQ9Md4CDZvh4kk6Ovli36WOEUCuoSa7Lk5g5K3Ccx76e/CzvV97K/bCESK2GfDZEWFlqmfIeolJ0F5GYEMjp90946xf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxDlxXns; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxDlxXns"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D71C4CEED;
	Fri, 20 Jun 2025 11:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750417777;
	bh=U6TPdmTbp0rz+wPI0kkF0Wk6xpzhmG/dlFYR+tX1PT4=;
	h=From:To:Cc:Subject:Date:From;
	b=nxDlxXns9RtDQGQbywsJDRxhD5cs0Fah2o7lLR55gC+4ABZQZPcwE7EBJwREpCoqS
	 HRBDbycgWY3NU1syTFXycG/m6HLEYsksxAWu9cAoL2PYWW3uGNO6kPXcLoTXNesE/O
	 aiIkpX5EWJgtaGJn041X8wScxQrwqIGBY8c3CCv3leX0DZAYm4iRuhb9baoTMHRYvo
	 b3TfgKXRvAHuFPnUj6fdNy/BtoMh98dIxxnDkTnl+fbrcxFSuISMPXgDOwyu6fzwdw
	 YCoOII2pleIs3c8JrLP/LF5sXLU5e7IQMUJ443FdvSUpvC9PGozxtifHfMtxSwAHVQ
	 V4z57PVi61LVw==
From: Arnd Bergmann <arnd@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Leo Yan <leo.yan@linux.dev>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Junhao He <hejunhao3@huawei.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] coresight: fix building with CONFIG_CPUMASK_OFFSTACK
Date: Fri, 20 Jun 2025 13:09:28 +0200
Message-Id: <20250620110933.3364359-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Building with a ridiculous CONFIG_NR_CPUS shows that this function
fails to build because of incorrectly moving the mask offstack:

drivers/hwtracing/coresight/coresight-cpu-debug.c: In function ‘debug_enable_func’:
drivers/hwtracing/coresight/coresight-cpu-debug.c:452:1: error: the frame size of 8528 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]

Use the recommended interface instead.

Fixes: 2227b7c74634 ("coresight: add support for CPU debug module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hwtracing/coresight/coresight-cpu-debug.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index a871d997330b..6ecd8e755ef3 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -416,13 +416,16 @@ static int debug_enable_func(void)
 {
 	struct debug_drvdata *drvdata;
 	int cpu, ret = 0;
-	cpumask_t mask;
+	cpumask_var_t mask;
+
+	if (!alloc_cpumask_var(&mask, GFP_KERNEL))
+		return -ENOMEM;
 
 	/*
 	 * Use cpumask to track which debug power domains have
 	 * been powered on and use it to handle failure case.
 	 */
-	cpumask_clear(&mask);
+	cpumask_clear(mask);
 
 	for_each_possible_cpu(cpu) {
 		drvdata = per_cpu(debug_drvdata, cpu);
@@ -433,9 +436,10 @@ static int debug_enable_func(void)
 		if (ret < 0)
 			goto err;
 		else
-			cpumask_set_cpu(cpu, &mask);
+			cpumask_set_cpu(cpu, mask);
 	}
 
+	free_cpumask_var(mask);
 	return 0;
 
 err:
@@ -443,11 +447,12 @@ static int debug_enable_func(void)
 	 * If pm_runtime_get_sync() has failed, need rollback on
 	 * all the other CPUs that have been enabled before that.
 	 */
-	for_each_cpu(cpu, &mask) {
+	for_each_cpu(cpu, mask) {
 		drvdata = per_cpu(debug_drvdata, cpu);
 		pm_runtime_put_noidle(drvdata->dev);
 	}
 
+	free_cpumask_var(mask);
 	return ret;
 }
 
-- 
2.39.5


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1062E62A9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433019; cv=none; b=hyeQEH2V7UiunwddqZYUMoDtRyoF4Vt2CbxxHFOXEi0T9ASiN92v9Kf3aY/jFh7kI/YFS4L9/E7qQf0iAr+4XCcU/DJ2H9JNfiWh3R9p7rmRBHM9Yc2AupQSzfQfUvM0EM+ruQ5A7n1ABC2KVMPm+Z4zvg9mhJYtwpqY5clTShA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433019; c=relaxed/simple;
	bh=HF1OH2zDz94/TKNfz4B/0f8tym9eHNw4m6GNJbNVVxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KM5L66Pes2KwDzfF4CWjZA4DsZew0gho0Roe+HqGaI7eSqt+MimWSa7pjEXtkNNWY00b9FWmjefgc3K+NBJNzuYuaWXcHVZVLm/X+aicxE+sb9MPDd8+3iPVycSe7bjiALPK9s9+hbz6b5q3/d+4xW8fl5e2Ht72998aR85se4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGvgDhGS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGvgDhGS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4BA8C4CEE3;
	Fri, 20 Jun 2025 15:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750433018;
	bh=HF1OH2zDz94/TKNfz4B/0f8tym9eHNw4m6GNJbNVVxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IGvgDhGSh0TvCXsOeO1GpLMdPeOFczr4GMtI5p3sbHeuLi6+EaqxODmmCm0As+62b
	 kZP4WXcPXCLAchjL+5hOgHU+/DoUh0oJ3pICd+QsJ6cPlcFl0usAN3F8AqN5PksGwB
	 GUJLfTOBWRoUVcU5NBdLK5yr0yxB7T9DCm990Bn4qJgFwhP7Z2gBQlnHgrczt1uXS7
	 EHWhCbFzynCsgYB5mhZ0VcAncH09lxE+kGd2NPX/NMJ1a3o+FUN3ZEN0HS5GpaYcr8
	 dBtR+Vs+48otzhHnBmqO7Q+08i/QY47BkoF5ZDbRXr0XJgB/+ZpZbyEUGu5Ar+rZsO
	 +pC6remEEaXpA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 09/27] driver core: cpu: Convert /sys/devices/system/cpu/isolated to use HK_TYPE_DOMAIN_BOOT
Date: Fri, 20 Jun 2025 17:22:50 +0200
Message-ID: <20250620152308.27492-10-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250620152308.27492-1-frederic@kernel.org>
References: <20250620152308.27492-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure /sys/devices/system/cpu/isolated only prints what was passed
through the isolcpus= parameter before HK_TYPE_DOMAIN will also
integrate cpuset isolated partitions.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 drivers/base/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 7779ab0ca7ce..e1663021fe24 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -291,7 +291,7 @@ static ssize_t print_cpus_isolated(struct device *dev,
 		return -ENOMEM;
 
 	cpumask_andnot(isolated, cpu_possible_mask,
-		       housekeeping_cpumask(HK_TYPE_DOMAIN));
+		       housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT));
 	len = sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(isolated));
 
 	free_cpumask_var(isolated);
-- 
2.48.1


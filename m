Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2ED2556E
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739001283; cv=none; b=nk3OlPcHin0fcky197jSHJ0T+oOMdaedpddu9l7dKiJoyk5mIm0/+53nbaNQHyJVB9KUf9H79l+rqg45yzBq1iqzZujnXYHAovb/dPSM5EiMmXvhLLaMu5zhbxRJ+YBzJKtBvc1CrkIULbtmelFtQhpOBHgbnOPZNGOZEdw+k3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739001283; c=relaxed/simple;
	bh=22ey2bGNzgvUP55lAdjbn4x2+/D0SjGrbrNLdIc8QX0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p/Cf8gLxm1WoV84tdfIbpBHOomAteQ8U8A3VU+9Y3QaOnE6upIHJ6sHVMPNqqkHlo+ZRJnzlijhVNUQ7VGw2W90xdci+Gxunrr+nYH0+FKAwywwVUbZlo6kX8Mw+9TgFUL07YJEjHojiWRHXU37cWs3IdHDLb7sCxdmVFuNOdeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdcKuUpq; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdcKuUpq"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-21f48ebaadfso41056205ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 23:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739001280; x=1739606080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boufvzkgTV244jN1bbSF1JjpgYAevUzFBFGQhL5b0K4=;
        b=BdcKuUpqPqDxQyyYiivuaP2IFrxW3xz1MvgNzXpZq44ElR699duFTULFLRK4OA0bdf
         q9lBI05Zhhov3GdiU9G4NKgUxRhZa9ukKqF8lEL9ff76/RnxX/6du2rkXOq0Itw+DmqV
         YYcirQE4M6N98DCFnHFVUAxrrs+7AaxLA6aQC3g9+h2ywN9eOUPhzcKM8XfmZxT7B14p
         MKES6UoZM37CvVtaDaBUIGklE1NP2E5F53rYrtnWTZ1CufxfYaXZJvfD34fNoGlID5uF
         AFtEkpY1e6/rxCvmYYQjWPY6R1p5KJaZ6sKrvGHip+fYRd/r3toFUkfNeaHCtUL5W7cX
         HOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739001280; x=1739606080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boufvzkgTV244jN1bbSF1JjpgYAevUzFBFGQhL5b0K4=;
        b=arxt54Tjt+v0Z1anTYT9khTfWU+yQH4ckL/3rJcWPW5cAxtx3QeG5+UWK2mvkfoM2U
         XLfGvkRAui5LUg0QT7uUXiLiV+7FUAPvRYuLBVQKwc2bPnN1WDBQUZplLghToASay6SY
         sDPTa8zXvaF5wJHD5l5r7ioNi31seYmBXtuOcfmBDQlDq//E0rP0Nqdz6c9YTNZycdls
         5Rk07kWY8ai7qttSP4uLfuSfUD4jahvERiQHoHJXxspt23rpCzz9r8Dx2DxKTK1Gm5U4
         6DSK4pX+5BOdqfYjilDinU+YorG1LfRxeGw/5BCwACDldVEp1TNCwWH6ZD9TD3SZTFn5
         PN2A==
X-Forwarded-Encrypted: i=1; AJvYcCXl+vnxTuTPYtYaxRahINVvIymttW75d3ezhmA5jWP2CBvmNmgDo2XJD5TUuvFhpgbeGHgyPiWdvFWBYWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZaPNs3OxAmv0Mavtb3tpMF4zfj1XrqNcdBc9HG4J64eilTicl
	a5gSMV5Wa5nkj4Jnx9NIu5hiZN8Rp1fztMKIkUXER/WtPiEzAu1e
X-Gm-Gg: ASbGncvLq7Fz/dYjqXyTCjI+IWZ/zMzqQ6M5FsRWYZc/U9/s0KG0CFu4GrAi7RrADXY
	Ia+Q7dPs5ABOuJHU2gEAsZmy8JrmlcW46q2DGfArSGjuSTBonc6hUeSQyj1hzYQjinhJktuphmq
	DSqgahF6EbW1yNWcldjy60FQPR4zsgDD1nw833ZPeurWsUSr0oY5VfXP+ZNp4bmyv3jw5dnGv0X
	5sDVy0WDe2O0igHxPlVo2wJblf7dgRDu7j10/clIuDkUlymaZc2A2XNvoLj5mXleL5S5rIt6un6
	RP+FWEm0Lec8FLKusqb7StSZ7QF4HiWcK3I=
X-Google-Smtp-Source: AGHT+IFmJlwGsO7fXbd9NAglEz33u1NDMLCeoa4VRJn2oWYchoQqIA/ldj5aE4ttX040xFRn5P2UNQ==
X-Received: by 2002:a17:903:2447:b0:21a:8dec:e57a with SMTP id d9443c01a7336-21f4e76007dmr117498275ad.48.1739001280592;
        Fri, 07 Feb 2025 23:54:40 -0800 (PST)
Received: from localhost.localdomain ([114.67.205.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368d923fsm41861585ad.256.2025.02.07.23.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 23:54:39 -0800 (PST)
From: zihan zhou <15645113830zzh@gmail.com>
To: 15645113830zzh@gmail.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: [PATCH V3 1/2] sched: Reduce the default slice to avoid tasks getting an extra tick
Date: Sat,  8 Feb 2025 15:53:23 +0800
Message-Id: <20250208075322.13139-1-15645113830zzh@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250208074821.11832-1-15645113830zzh@gmail.com>
References: <20250208074821.11832-1-15645113830zzh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The old default value for slice is 0.75 msec * (1 + ilog(ncpus)) which
means that we have a default slice of
0.75 for 1 cpu
1.50 up to 3 cpus
2.25 up to 7 cpus
3.00 for 8 cpus and above.

For HZ=250 and HZ=100, because of the tick accuracy, the runtime of
tasks is far higher than their slice.

For HZ=1000 with 8 cpus or more, the accuracy of tick is already
satisfactory, but there is still an issue that tasks will get an extra
tick because the tick often arrives a little faster than expected. In
this case, the task can only wait until the next tick to consider that it
has reached its deadline, and will run 1ms longer.

vruntime + sysctl_sched_base_slice =     deadline
        |-----------|-----------|-----------|-----------|
             1ms          1ms         1ms         1ms
                   ^           ^           ^           ^
                 tick1       tick2       tick3       tick4(nearly 4ms)

There are two reasons for tick error: clockevent precision and the
CONFIG_IRQ_TIME_ACCOUNTING/CONFIG_PARAVIRT_TIME_ACCOUNTING. with
CONFIG_IRQ_TIME_ACCOUNTING every tick will be less than 1ms, but even
without it, because of clockevent precision, tick still often less than
1ms.

In order to make scheduling more precise, we changed 0.75 to 0.70,
Using 0.70 instead of 0.75 should not change much for other configs
and would fix this issue:
0.70 for 1 cpu
1.40 up to 3 cpus
2.10 up to 7 cpus
2.8 for 8 cpus and above.

This does not guarantee that tasks can run the slice time accurately
every time, but occasionally running an extra tick has little impact.

Signed-off-by: zihan zhou <15645113830zzh@gmail.com>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1e78caa21436..34e7d09320f7 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -74,10 +74,10 @@ unsigned int sysctl_sched_tunable_scaling = SCHED_TUNABLESCALING_LOG;
 /*
  * Minimal preemption granularity for CPU-bound tasks:
  *
- * (default: 0.75 msec * (1 + ilog(ncpus)), units: nanoseconds)
+ * (default: 0.70 msec * (1 + ilog(ncpus)), units: nanoseconds)
  */
-unsigned int sysctl_sched_base_slice			= 750000ULL;
-static unsigned int normalized_sysctl_sched_base_slice	= 750000ULL;
+unsigned int sysctl_sched_base_slice			= 700000ULL;
+static unsigned int normalized_sysctl_sched_base_slice	= 700000ULL;
 
 const_debug unsigned int sysctl_sched_migration_cost	= 500000UL;
 
-- 
2.33.0


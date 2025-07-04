Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92D642A83
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751639779; cv=none; b=KGqd01Tlk1uBFrelNEBa1nQ7TfIkyygIgRI8B8rbM86jO7MqATpjuSyAivKa7URE2+L91r4PHFSYW/ruFcgwr2+EuQWk70fZZ5UxjxD1tUMnOJi2+Y1wx1YfqD0h3IbJhFUeWzMx7+VdExs5EJLwYrCc/vB3bAu2o/c6Ezp6ATo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751639779; c=relaxed/simple;
	bh=zCyvfTbSbFhrQUEZKhyLVu1lB25cKKaFVMy0fDGIMVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l/hlhNp5MvNBjw3yEKlGpOHt9zx6eswGT1mKfKwRWpXBIIaZ8+SyF71FlZs5Wur8u2gl35LxnLNsq4CmYZlmKtY0U3e9RZg3i1kcHn+zlBc9yPjVAlTCZPtRl3jScb6dNeDyXjYbUOpoPM5m+zhGJxUYzd1uwA8W9mGvUxgQiT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GVuN5afD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GVuN5afD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a53359dea5so487327f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751639776; x=1752244576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=spuVa2NqWCBqOGSLbLVQ+4OIyo66THedAVR+Cj3LFVw=;
        b=GVuN5afDOXEAFfTt8ceYxP0Yhi46Rc+rZJN3suEHwh6oiPRI3RzpP1MQ2MlJOtTjRq
         PcjDItb3BH7oiujCQoIppoeSOCN5Bok27VVhGMIf3VcHOxA3YHhMTjYFdvfFXYky0ogX
         Xpsnhh3EHeOAbZOOcN/HExqoR9SYu8xIbV+k34aLZQMFl9hg8P6deofmchvdjtrZTJQT
         mY6Q9+ep1524gypI1W2ZoZQvHuo+1Nb8DqyghF3KdIc77xxxkj+nP0Am2HGrqZzT8Y7c
         EpTGxOpjtUbD9I5x54uNG/gDP05Lr0B3M0viabuVpVws44XD9Z0knPsp32VWPPSXPjJ+
         xdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751639776; x=1752244576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spuVa2NqWCBqOGSLbLVQ+4OIyo66THedAVR+Cj3LFVw=;
        b=QPmowjW/KJyTTYmK+pOOR0FAGn51F1tU9t46CThzA02ipLlttlbQeDIsAWWF3IZNK6
         AIHuOBmQIEMopYUM0wXGgG8V/6Ig8qS9Umeb4TJjEKfYLNuzSrg9kgLac3DXjkUttPsr
         O8xcyWccmt/fZWPCDYrfAqazerwGuN9Kn/n7h9I2vmUimHJ2xXd61jWVMGFwHizEM439
         oj+cTjx2p0YplDTMKOWqA4d+ysWvB2XEXljdMnQ0eZpxtZoRWy7xhe/1vG33Ce5HtWQH
         ZS4Vx4CCTnCuFwJEFdKJ13YvhepnrjVRoE42l8cEOBuwPcE8QJDX3SchhHDctvy14ExS
         NFqw==
X-Forwarded-Encrypted: i=1; AJvYcCX2sieG8H0ZV+GRZWbGJgR3Jc1vXRIZtwc+gtPVJ437achl7oo064q+gdoVoV9oCyqkeSeKa8abR4knn2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwczR1wnA9pa08CBWHnFszD18bNLMgMdZcvZF7nFy0qDUfWA7iw
	sfsxsuHcp72cn1On4WPKbIi/deSjue7QvppqdICpIRtk2y276GQCWkCFLBRRUJge8rc=
X-Gm-Gg: ASbGncvkpGO5MBGyHGpgasO5o1ff4srnmlC8+WCN4FumvY4YHx2o6xbdw42tikBpkb9
	3VheJYxHnOyljz0sY3ITux2SxE/dxr7zAd2mqPmuWBjykur42yvsg+8UFqCQ7cdoJ2QragrtR12
	jmewGHa3GRwDzHKD9X3kLzCFm/yLhE33T2AIYcP/bpMfLDJkNwhoyOPTk9AqdJXm02dPpOOo1RL
	Ny9SHS/hnJXwqUfDIcARMzAHvft9WjkB1odqH3S1dNsJkyMIdLTHujX720HI+CdUMBSWahtpRqH
	wZhXZm+OIr0ADItL5HRxm1VjdMaTmMHA8kaZ0IvoBu7cX9/sA77ZJ5WL80FrB+WvoqVomsc=
X-Google-Smtp-Source: AGHT+IHThE4VJYkTjiJk1srk+M9QpDLbVpOzzxhRZTx43amiS51HWojIfZa+6uIiEdhEJc4qb/+ytQ==
X-Received: by 2002:a05:6000:420f:b0:3a5:25e0:ab53 with SMTP id ffacd0b85a97d-3b497038f53mr2019540f8f.32.1751639776043;
        Fri, 04 Jul 2025 07:36:16 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:7ff5:bbf8:9357:784a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0beesm2690186f8f.36.2025.07.04.07.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:36:15 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	dhaval@gianis.ca,
	linux-kernel@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2 0/6] sched/fair: Manage lag and run to parity with different slices
Date: Fri,  4 Jul 2025 16:36:06 +0200
Message-ID: <20250704143612.998419-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This follows the attempt to better track maximum lag of tasks in presence
of different slices duration:
[1]  https://lore.kernel.org/all/20250418151225.3006867-1-vincent.guittot@linaro.org/

Since v1, tracking of the max slice has been removed from the patchset
because we now ensure that the lag of an entity remains in the range of:
   
  [-(slice + tick) : (slice + tick)] with run_to_parity
and
  [max(-slice, -(0.7+tick) : max(slice , (0.7+tick)] without run to parity
  
As a result, there is no need the max slice of enqueued entities anymore.

Patch 1 is a simple cleanup to ease following changes.

Patch 2 fixes the lag for NO_RUN_TO_PARITY. It has been put 1st because of
its simplicity. The running task has a minimum protection of 0.7ms before
eevdf looks for another task.

Patch 3 ensures that the protection is canceled only if the waking task
will be selected by pick_task_fair. This case has been mentionned by Peter
will reviewing v1.

Patch 4 modifes the duration of the protection to take into account the
shortest slice of enqueued tasks instead of the slice of the running task.

Patch 5 fixes the case of tasks not being eligible at wakeup or after
migrating  but with a shorter slice. We need to update the duration of the
protection to not exceed the lag.

Patch 6 fixes the case of tasks still being eligible after the protected
period but others must run to no exceed lag limit. This has been
highlighted in a test with delayed entities being dequeued with a positive
lag larger than their slice but it can happen for delayed dequeue entity
too.

The patchset has been tested with rt-app on 37 different use cases, some a
simple and should never trigger any problem but have been kept to increase
the test coverage. The tests have been run on dragon rb5 with affinity on
biggest cores. The lag has been checked when we update the entity's lag at
dequeue and every time we check if an entity is eligible.

             RUN_TO_PARITY    NO_RUN_TO_PARITY
	     lag error        lag_error 
mainline       14/37            14/37
+ patch 1-2    14/37             0/37
+ patch 3-5     1/37             0/37
+ patch 6       0/37             0/37

Vincent Guittot (6):
  sched/fair: Use protect_slice() instead of direct comparison
  sched/fair: Fix NO_RUN_TO_PARITY case
  sched/fair: Remove spurious shorter slice preemption
  sched/fair: Limit run to parity to the min slice of enqueued entities
  sched/fair: Fix entity's lag with run to parity
  sched/fair: Always trigger resched at the end of a protected period

 kernel/sched/fair.c | 94 ++++++++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 44 deletions(-)

-- 
2.43.0


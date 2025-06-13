Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2EA2E62C0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823529; cv=none; b=jeMIOw13fil9AK665AeFRzum3GDDLT+08oVFwVhhh92AgGMNH/gy+1j8i1Z3PqpSkh834jDmUS0uD+2+KOehoQ4lQGWazafQYf0j68AIzuJzx0xj7qanY1J729xuKnvg/tsjtDK7Iw260jDa4b8E2SOXRqenyPFckkEO9Ao1LEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823529; c=relaxed/simple;
	bh=nQQY8r4AqBWCZLAYoiGl5tuEybGgauAH/FoUqrA0yKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eKUn0n6yID22oDFM9PzeKxq9FhVhznZ4fe6VkeOqcEgxTmBeXLzJbOyA0EkoM2ptdo0NvXy93syzlTPYQ+LW69taf32QGljlW+mNRRU0AkmYbs95Jrh2dsx0kqzOKAWfZE9vnc5Xs6YF0hkmJLCmYTjwUJ+bzFMj7jTPIpwJnpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AQlnWcOf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AQlnWcOf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d54214adso17962685e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749823526; x=1750428326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F27/yU98gV+ui+PcKWJ6G0AAiy45xq+x+LuecMEAq64=;
        b=AQlnWcOfFIKfkd6P77cnK5JV36IAmujxWELKs+wd10/EbZz7/2xu8wA11a6gjBwsMZ
         6rk/e8P0v3g8wWUjHSzDedOG73Chd1nCnZtA5BzxjHb+hvf6rCRYiLz+Jlborml5srnZ
         RzJVoDRzj9te1v9DFRWR6iw7P6FOmWLMN/03L9VT0vsgoxMbqjX7YlSraNRaOJpocZZ9
         5FagExZQ/n5irPq+I3ibtvgzonL5InJDxw5fgr2RWcRQ8RyP72UuX1RjsBJ2kqEr/5DV
         CMzG8mAayfPmzSBYKkfvCNaEBE5zTSbTSke1RClw66oVG4jot00THGG9/w4827RIh77S
         8Jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823526; x=1750428326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F27/yU98gV+ui+PcKWJ6G0AAiy45xq+x+LuecMEAq64=;
        b=Xh9p5DNAi2X76RfXSyevVVj6cEVf9WqOkX6q/LzLWItxccKnoru5q8/qPLPqK4lggF
         spr83wZ30dov5szXmSWvYDOH2n9G2CCyhC7xBHYCXTBAPts+54RkSJqwKT8LfezV47Tm
         pPgawn3OXpbRsyj+bfcLsFpUnph7ulp3g1a+zrkWM6g76Rgxm0nZPC3f3cR6kOey4P6m
         7TMLH5hwtFy+mL0InMLS13rt1QtF0DCQwhCyhsbShlILcFIvuRqRkQqrxeRUc4EUfIjL
         KZuQxCO1w9t5loDKW3M+pzMSDAZIcHVIpjmo5i+jyMEGkxPuOxbmaGPuMdINHo2myEUh
         IFkA==
X-Forwarded-Encrypted: i=1; AJvYcCV7mszUhgWSRBEhv+bLcTPbFPCo+2jGIt2xCWDp467yiJdmg6FKzVnVXtido7OOzGoRbWgxctcyMlAxuEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYUIOnfs5dyZqpkdhZdEo6Q1TXpgCkwJ680rGYOJ7zysFszqoC
	9X2L9JQIkkSXsiCQuVRxK4CUxc+ihY55kWaZS/kLXZl5YSn4QlyLAMatdxboLmd61n0=
X-Gm-Gg: ASbGnctDIr/qEIjFt80rafwrS2LeQ/kCZvRLfGUY8pZ72HGWJ6RtdX1p/IAPkiMLrsy
	CkPPAJ2hz0QW3Vez3RPnZHu8xZOAPKVpBM5GFZop+KTxMW7H8dH6V6F8aESk42uyf9+N4+elqDH
	H3FFLutW6HoXxKiii45TbFATGBX/56MwQVDz8+ljYPhGHxwMylgOwuttTMGSp3Ok0teEkTcixTA
	uyE62QUxCbAdN5WZ9WzeTElwoRUqNWDwAkxDtIycVNaVDaSQxZf9WrJF/DsSj7+13XL6kaOGzw9
	cKqEjrDci4ok1+BQZFNNq8NWfybU07XWtM/9cELKt4nZBY+jAGUNwzTi7X8pfKHFJB2GRw==
X-Google-Smtp-Source: AGHT+IEm/Zt0roffoNu2GWdSjf9k9SHfjVb02ezcqjOwtckvOlHxDTIDePUNdzHNap8GHVaQph+RNA==
X-Received: by 2002:a05:600c:154c:b0:451:edc8:7806 with SMTP id 5b1f17b1804b1-45334b7f861mr31277795e9.32.1749823525856;
        Fri, 13 Jun 2025 07:05:25 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:f98:f3a4:ec28:1d4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b27795sm2472276f8f.71.2025.06.13.07.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:05:25 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 0/4] sched/fair: Manage lag and run to parity with different slices
Date: Fri, 13 Jun 2025 16:05:10 +0200
Message-ID: <20250613140514.2781138-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This follows the attempt to better track maximum lag of task in presence
of different slices duration:
[1]  https://lore.kernel.org/all/20250418151225.3006867-1-vincent.guittot@linaro.org/

Patch 1 is a simple cleanup to ease following changes.

Patch 2 uses Peter's proposal made in [1] to track the max slice of
enqueued tasks and use it to clamp the lag of dequeued task.

Patch 3 modify the protection of the slice of the current task to take
into account case when tasks with shorter slice wait to run on the cpu

Patch 4 extend to slice protection mecanism to the NO_RUN_TO_PARITY case
to ensure that a resched will be set regularly. Currently, the resched 
will be set only when curr will elapse its slice which is partly similar
to RUN_TO_PARITY. Now the running task has a minimum time quantum (0.7ms)
before eevdf looks for another task to run with the exception of
PREEMPT_SHORT case which remains valid.

Peter Zijlstra (1):
  sched/fair: Increase max lag clamping

Vincent Guittot (3):
  sched/fair: Use protect_slice() instead of direct comparison
  sched/fair: Limit run to parity to the min slice of enqueued entities
  sched/fair: Improve NO_RUN_TO_PARITY

 include/linux/sched.h |  1 +
 kernel/sched/fair.c   | 76 ++++++++++++++++++++++++++++++++++---------
 2 files changed, 61 insertions(+), 16 deletions(-)

-- 
2.43.0


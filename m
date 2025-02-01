Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A671BEF81
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 16:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738427483; cv=none; b=YVr8pSVL5Fo/oZP81cmgwgc7EmZ+mVucDRXFVL6NuH5ckYdm0zzcwNnxxCdIpIHAuHJ+U1awte6JkFflt/0TY0LFNheg6zH4dHrHTL0b161+BzToqu1ToOcpJBPBwHFuGUACyFdnLZu61gubCpb3x1MlOUhvNuwk5pzyTLpvN+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738427483; c=relaxed/simple;
	bh=TbzI5X235MPiMiBmkQLOq34IBmYWJaVSPrGtXKizJGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P+Xu8+XAyhgAp9ZweF8ZUHUJWufcKrZ6G/mHnYWetxz/1FYwGNia8RAQrpWlhD4KSm4FwzbuxgwA7HrSe5xTPpywlmf36Q4dDxV0S1iHmQN1Ez3xZtdUZJjLtHXbuUMrMWiL3r0ZLA2aNDJ61LOcXbY/eF2I0SzXjZVsMDE+nac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHBSVntM; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHBSVntM"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so4089994a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 08:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738427480; x=1739032280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3jrnKgDyAKbnWY+eGuVyIsm/8uEB+2OWbdoknaGGjkA=;
        b=fHBSVntM+HwPUZSFsAY89yHrekpcHJCGoQuUGi4wVM7V91oscCmzr8UQjBk9osLMl+
         0RA6aye04YErplto9CDF4snqwdJGboK/+QBEWeWHxwk6+FK8wBwm0jELGqFPcZvKRzi6
         mMS91GVQecpMD9VQqA38u6IbMOlI0vCb6oPT0PBvm12KhQ3Jjw1jkkmpAULYquNplLIv
         39WSB7/DtF4WVWzOxeAOy32bM23Nt226YTXCpbrTnr3+3Kl+6+LMXjQicWP6PmtQdxH6
         Yy3pPDxCqyoUVxp3B+sdO679RazEvSdc1bP6LxQqgT7VzSi7agVUJkA/JqTISL/v1HeW
         3zQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738427480; x=1739032280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jrnKgDyAKbnWY+eGuVyIsm/8uEB+2OWbdoknaGGjkA=;
        b=wR00xLGfPjngakRQCWbmTaMr9idyDTKFkcmxuDnyFZC7c+qWiA+kJNkaB3Uuvp1Bns
         l1kpHwxXMXi7Do5eN8R1d1TMzhRWAmU9ElM7oTw7lmHDZQywYwFR893nUGsdRKvljDIK
         z5bfUzSHXzIjkn2PCgFOmoKr0fHDD8+gfYeLuNtgCvozbqf69hs4pR2ulAfGx/11lsyx
         40kw1ox1EOqf4iNvMRDxSiEVcHuSAr6k03XvFCY5qF2rVDxiH5Qkx+JTcQMSgSmCzDPy
         0pGahbJrS37alhfBinuyN01DIv5/j5jh3cfK7PHMioCsT6tuboBQwUQse2GhbY4Pb83V
         oNPw==
X-Forwarded-Encrypted: i=1; AJvYcCXq2occje9rr64HAMAcRJcpI/JCm40nnEhKd8jCjJMSviitWeAZc0iLG5TzaHrK2xVi4CcL3cfpCjt78X4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUtdds1WI1NLKxqE4cZAnVqOnziyY+7uceQVoEqqjzH0JDlnD8
	gbtnabamqSxp8CuOf/7s5Daz5Gs+RBBtFshSIdhFYPK7+tJg5x/2
X-Gm-Gg: ASbGncv0dOBUA+gC6f0w7bIbdkG3x/nrtC2KGoBSfDpVkuXA59efChe2npD8a4OaeWv
	s70T7GgnoG4RV16DXF0pXc9NQHiINPB/TrcyZrQ4vbrs30ehEbLsWnwMMqpoMP8p2QvoeAx8NlU
	/jB54RxBmEO4KGkSE9kPhw2m5vPxXlj0OPR4XqelC7uo+cH2EirJ/chUhMLQYTnI87jRvW1TH59
	jvsvoOwbnyRtlF0XLwibVAZ0yqUbaFkfG+rgfuWbIo890lVwnkHQy8UVHYxjZYDsLc/jTpHH5R+
	/fcGMLnVJhAr38D3cS6mGm1kMxFrff8NXg==
X-Google-Smtp-Source: AGHT+IGjUXyqp/vJ3+g7LQWf+U0oyQzi7TNZUhg4i+bNx7Fgw7YdSJtVvGJ6QCfmYSZFLhiSYwgxkw==
X-Received: by 2002:a05:6402:380e:b0:5dc:893d:6df3 with SMTP id 4fb4d7f45d1cf-5dc893d702dmr14273771a12.0.1738427479382;
        Sat, 01 Feb 2025 08:31:19 -0800 (PST)
Received: from f.. (cst-prg-25-223.cust.vodafone.cz. [46.135.25.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff72sm4636959a12.15.2025.02.01.08.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:31:18 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v3 0/6] reduce tasklist_lock hold time on exit and do some
Date: Sat,  1 Feb 2025 17:31:00 +0100
Message-ID: <20250201163106.28912-1-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clone side contends against exit side in a way which avoidably
exacerbates the problem by the latter waiting on locks held by the
former while holding the tasklist_lock.

Whacking this for both add_device_randomness and pids allocation gives
me a 15% speed up for thread creation/destruction in a 24-core vm.

The random patch is worth about 4%.

nothing blew up with lockdep, lightly tested so far

Bench (plop into will-it-scale):
$ cat tests/threadspawn1.c

char *testcase_description = "Thread creation and teardown";

static void *worker(void *arg)
{
	return (NULL);
}

void testcase(unsigned long long *iterations, unsigned long nr)
{
	pthread_t thread;
	int error;

	while (1) {
		error = pthread_create(&thread, NULL, worker, NULL);
		assert(error == 0);
		error = pthread_join(thread, NULL);
		assert(error == 0);
		(*iterations)++;
	}
}


v3:
- keep procfs flush where it was, instead hoist get_pid outside of the
  lock
- make detach_pid et al accept an array argument of pids to populate
- sprinkle asserts
- drop irq trips around pidmap_lock
- move tty unref outside of tasklist_lock

Mateusz Guzik (6):
  exit: perform add_device_randomness() without tasklist_lock
  exit: hoist get_pid() in release_task() outside of tasklist_lock
  exit: postpone tty_kref_put() until after tasklist_lock is dropped
  pid: sprinkle tasklist_lock asserts
  pid: perform free_pid() calls outside of tasklist_lock
  pid: drop irq disablement around pidmap_lock

 include/linux/pid.h |  7 ++--
 kernel/exit.c       | 45 +++++++++++++++----------
 kernel/pid.c        | 82 +++++++++++++++++++++++++--------------------
 kernel/sys.c        | 14 +++++---
 4 files changed, 86 insertions(+), 62 deletions(-)

-- 
2.43.0


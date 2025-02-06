Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCBE235363
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738860270; cv=none; b=WIqjf/paAHUoHeTIQl3xWe7OeC2QfQfoUMzdRxAO8QCFia8ATWYZeVwqenWUPPfhUjTR3LP7pj8lR1a5yuURipaQqLavFGeepTFmei8rMpXQepp7b+hJUqfWAIr+lX3jEOlMY6XyApfgbmu1jHT1gJHVUjZT5q7kzUKZS7Imdq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738860270; c=relaxed/simple;
	bh=77f56+opEiWCKPMDGkyHCjVgKSyCnjr6PrIDypF3/8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i4+UFnpP61AbSJ0zfLjSwj68IbwOg2+gIzAJCx53wTpi1obhYFdQtBxDxahSR+CldREEeOphtYsvbvSi5g67vwV7NVdWsQSxAXuABezWXqL1u87d3GZkcVfpAA4+GmQWZKWLskHusvMlPbEuRGqdMhZt4DpB9qzVuecgAs0Cimk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekeTUzO9; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekeTUzO9"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dcdb56c9d3so1883812a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 08:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738860267; x=1739465067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0EllTp5Ggd6l+rFMCueF6sxgOPRMQ4MSYiTvpxQSXeg=;
        b=ekeTUzO9MLW628yMa0pwm3AE4kfaaFSt4Up2F9QLxnO+Wov5rTIt/DyiwpjAiQxORZ
         gFDzuYXJByDH6lcRY0Wb+q620tZdnYJS2K+MVCc5M8KkCKwOHKglV2WPfMFXkLGedPt6
         5vIif7qpui/EEs9oUZP2xKkFNMzqe0DiLdwf/L4mxINj5lBAXaRXPCCnAHhokw1FbETR
         vHYTbP6tRIQhTQK3C1LEkByOuRVyT/nqjGUZCjGc3OCx3051SWfSVHIRQd4h4JpPa4/p
         oEQfVHwWX3zkmp1qchEHwIJrRFvZMedqxtDfYQp4jr1mEaCWozdj/Smu9f8knd6cWBW4
         aL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738860267; x=1739465067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EllTp5Ggd6l+rFMCueF6sxgOPRMQ4MSYiTvpxQSXeg=;
        b=ksB1eYMO9kjUlAYJY25trcUPvLrs4Zkr3zDadO+qgY3ZLiSxqhEkZnbs7by8BI2kNl
         e27PHusVJhI7AV1wV4CAXyWlK3PQ3fYgg7amQb3Y9X2K/K9+Fsf/vmR1As5Q69gKRkVs
         RKNnF8JNAdf5QYmah9vCN9S5py/CBZhL10nWd6Lsrr7c58cUg3W5M4Pinko0bR4XyJyN
         +z5JIPGwc694Zo3fdCyZqr3GPUuYJ1jDeDM0d/KQSkLyfRsdaM04qq3Jxbnm59jBKVYU
         iVNTIIuXzmR8EGaIKuQj/5JTtCyzCv9XgCujyvAL11nVpcz1tdiBpvpDsffxfPSeTXVN
         bntQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7oZU5XHwXCoCr5ljWZJ7iishbXCUKnGdk6DQ1oTlSzZ9NsC+vmvmh3gxTLFgSeK3FExtlvhk4+QIRwMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIatedp6wJP1LlADAWe3JzEcyC7pENy8b95TiKOxzPsVS4k+8p
	AChIQ3EHiwUWWwus0zeuC9PzonGtt7g/pbbDsT2gKH2yGvTRRHa7
X-Gm-Gg: ASbGncvIO0U1WI7SJ/YPv4vd15ske0/KtxSQoEsjft5o2awrrRrFF+P4qWCzVbKor4s
	uZObJ2L6vQoThc9Jv6KgG6FR6z+kbo4NmIpeg5Co6L9SXcc9oBFWwrRw0Z3FuN9O6UDudhEwBOU
	YYO/UaABOrkrph+WHBAhmvjbyZVKqnGhLwC43msLj78ZtQe5QsDnbJ1mSdvu2VheeHeVI9Fh5AM
	4qQMCjaU0uF2KmLSRDc2dm7wpPAj4nG9QOGSAiLeyX4ujAkfsB9wnpSwZymu9wtxB6Jx7z6cB8e
	3/cKuA0duqWm3wFxUneWOwVjo/Gsfcw=
X-Google-Smtp-Source: AGHT+IH+BC/Z6o2ah+DA33f+3PYYjeMCHrsgwMN7KLraZaUZojg8F2PpcU6CidjgE/MAP3+bmEZ3RA==
X-Received: by 2002:a05:6402:4606:b0:5d9:ae5:8318 with SMTP id 4fb4d7f45d1cf-5de450706dbmr178442a12.20.1738860266858;
        Thu, 06 Feb 2025 08:44:26 -0800 (PST)
Received: from f.. (cst-prg-95-94.cust.vodafone.cz. [46.135.95.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf9f6fa69sm1121849a12.73.2025.02.06.08.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 08:44:25 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v6 0/5] reduce tasklist_lock hold time on exit and do some pid cleanup
Date: Thu,  6 Feb 2025 17:44:09 +0100
Message-ID: <20250206164415.450051-1-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I fixed fat-fingering and touchedup some commit messages. git diff
between the old and new branch does not show any code changes.

hopefully we will be done here after this iteration 8->

old cover letter:

The clone side contends against exit side in a way which avoidably
exacerbates the problem by the latter waiting on locks held by the
former while holding the tasklist_lock.

Whacking this for both add_device_randomness and pids allocation gives
me a 15% speed up for thread creation/destruction in a 24-core vm.

The random patch is worth about 4%.

The new bottleneck is pidmap_lock itself, with the biggest problem being
the allocation itself taking the lock *twice*.

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

v6:
- expand on the commit message in 3/5 pid: sprinkle tasklist_lock asserts
- move fat-fingered free_pids call to the right patch

v5:
- whack scripts/selinux/genheaders/genheaders which accidentally got in
- rebased on next-20250205

v4:
- justify moving get_pid in the commit message with a one-liner
- drop the tty unref patch -- it is completely optional and Oleg has his
  own variant
- add the ACK by Oleg

v3:
- keep procfs flush where it was, instead hoist get_pid outside of the
  lock
- make detach_pid et al accept an array argument of pids to populate
- sprinkle asserts
- drop irq trips around pidmap_lock
- move tty unref outside of tasklist_lock



Mateusz Guzik (5):
  exit: perform add_device_randomness() without tasklist_lock
  exit: hoist get_pid() in release_task() outside of tasklist_lock
  pid: sprinkle tasklist_lock asserts
  pid: perform free_pid() calls outside of tasklist_lock
  pid: drop irq disablement around pidmap_lock

 include/linux/pid.h |  7 ++--
 kernel/exit.c       | 36 +++++++++++++-------
 kernel/pid.c        | 82 +++++++++++++++++++++++++--------------------
 kernel/sys.c        | 14 +++++---
 4 files changed, 82 insertions(+), 57 deletions(-)

-- 
2.43.0


Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E883521170D
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786180; cv=none; b=XAchalTJge6P+mCBiqmDKuhvkr1I8VKET2LP2I6jwzhDVQ8uJtAHNIJypWmVAWfoGDF6SnYAjEJn93XwMY7dgEZKS2pBfPT8O9ChFI9FmPhSbZGirv8iUsIekgh0rxg4RRJqWOKu412s+5U43q1lh8Gk//BTVnBzoGJ0YgkzLHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786180; c=relaxed/simple;
	bh=T2C5fl2qTi1aip/9GB0XomQeeZ/DprhCWCNmJVrJu+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=byfF3uV+1CG+La3oJNUq+ubeZffBhJoa7E9G5hQgO1nunoqXRlnS2QP46lKdqHCqh8Czpp4hsceHgBXw6x/5j7DW/kgjfoEVkP9VX8OSFL+IAC9JUV3UkAeHXaKl5ISGSrOgsV0bmNV/JmRP5ahgdoX8VMgCSZQ0jnzSfs6jQko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmGf9n3K; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmGf9n3K"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab698eae2d9so40128666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738786177; x=1739390977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eipoFyIFTAIeszlRPF8fuqzH8w+pWazjKHx9ngvb21Q=;
        b=MmGf9n3Kw1zWVSYpRHH7w7up3vzwa2QPGqyRHmmLsqaIoWsXn3VaChmne1k+zGM80r
         AXBdeHhLn5Dx5JF0JtaWLBChJ67Wro+zerQy7A65BFR5pGDGAwPAmbreBga0O64by8bF
         qxoP9yFqC9/7ia1AiBxtbL+gunVDfPu2qoaDSB61/iiOxyu4TfQnUOSKIRBViIAWmFtf
         wQQq442MgMETn6LkUibYL/WZwiqGV35YUxskvsM/Us5JydbJBSzITM/YwPtifSLT3q2p
         7iSJdzsip9VPLExyd9Pu26XwAaCerc24JxSPJNWlt3hOlzdyim5GUaRLQqwrVIFervY3
         qDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738786177; x=1739390977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eipoFyIFTAIeszlRPF8fuqzH8w+pWazjKHx9ngvb21Q=;
        b=ujxkFpclmVwLaCGv5H1a6rqnHcE+pfDKWAi01mrf0irBFiNASzSstDt2d+ClMuAd0d
         efgeRUTDAmX7pwJhmIWybfKsv4TRYMtwY25iH/CD4LrATpMyXKqsZhf74V5wSbDBZX7l
         Hn21d/nshqf7S+ifWxjp1rI9kCauP6b5Z6WtI6T8j7mkEyKjohd3A/E63rlYcOgZgDVs
         yzYbqRlq2Q4Xgy5oKs0479Lhv00F19jxUFq10CChSi3YXCQZnZDAJlOPL87rmRGt5wMu
         sNFHvCYpJ/fqpLFDCWKdhBCCdURn7c+LaKOHkGOppl/jQJiaTS4o7dPJAnmC7MLA6/3N
         8Zzw==
X-Forwarded-Encrypted: i=1; AJvYcCU8ywST9HxnvNwi8hFd00iAd3Jij1HEIal/32osgg4yNNFpgliaFtvR8u5+oFnd8ixsnIPetXvIBV3i9UI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAACDaykvTydOJY1Q93H3CtLW0Ck9Viz2JQZyxnOoVBAJUREAm
	+c3/JXHLGOdTtBoNH1VNfMUcsjNZK3v6DU7qSwgXjzGgtvpFaKfc
X-Gm-Gg: ASbGncuCTCsc2echGQlEgFcRIVKNI4xTD/O53374bISNn29VVAJOqkYqiHVNPDghjdO
	NGBpvXvuKELa+b+SpXa1nJBBQbpINJgDpOtilwHJsmnsLP6Axv+a+StF4dwuP6qUh4zWzwCwiC4
	wLDjwb+vA55dzsJrf3TXvCqx2YHeNXNjik+WZ1x2gqUq9qFjRdzDFMVQmAJ6R5I26uAARo3fQ2p
	8/p3AEouN+HexLWIYnWz/Bw5Dj+wJ710Lg5f5UjMur4CskozKZsLUvcv4dqP+OHVrdqj5gE9RPZ
	NG59ubCrYmS36Gdp59sjLxov5hJR+88=
X-Google-Smtp-Source: AGHT+IHE9E3tfxqSAQXXGhKPz1TdY1MhtI6PrtP7EHceKSopcNy+lovRbZ3qN0e1DQX0QBCN4u9gPw==
X-Received: by 2002:a17:907:72cd:b0:aae:bd36:b198 with SMTP id a640c23a62f3a-ab75e321e23mr401654466b.47.1738786176987;
        Wed, 05 Feb 2025 12:09:36 -0800 (PST)
Received: from f.. (cst-prg-95-94.cust.vodafone.cz. [46.135.95.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab703fbcc0csm932221866b.53.2025.02.05.12.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:09:36 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v5 0/5] reduce tasklist_lock hold time on exit and do some pid cleanup
Date: Wed,  5 Feb 2025 21:09:24 +0100
Message-ID: <20250205200929.406568-1-mjguzik@gmail.com>
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


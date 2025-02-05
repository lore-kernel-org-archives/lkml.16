Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E686155335
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738783975; cv=none; b=OETsxUi0crSN2lkYTW2rrc1K2vO8pVXPFL7SnPlyARaWhvz/5lAetDs4AlRuFYvVRLyrPr1B5m/WrUW/dyn8xnIdFIFPYnNLbYcyj4rvpQA+9ZTOBPUZ5xUNb14r3Le0T01mt+GQXuOJOArgguP95Ym9yOR1TPXA2KPDE93OZD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738783975; c=relaxed/simple;
	bh=t9o9ArnPhAP7J/KylToG3P4j2eRfO/R1M87sgWslgzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tuaDB0B5V8HNnJ4+G6aSlzIU5dgV3Ed3sge2JoVqeaACZ1uVOSB0MSv29zn5OsePn9pnkb4CsEynzpAW/X9CX6jN0yayF3eHOR+aWboBBgcMVPgzvpFpsE+Dw9YJNNG61+Z3FYDGueb6WksC8LGAOt9Vs2dONaq1DI5mVt9g1hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7mSoah2; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7mSoah2"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dce3adbc31so262363a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738783972; x=1739388772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ECvbsukTPy6mXnZVkUCz007RKdHndCjxf5UTyDg+hdo=;
        b=N7mSoah2f6Z8CsXKldl1vJq7MEAint3m4eEINenUMZkDB8ltWdTyUl2yFRLeiMbsAM
         Ect8lQs7YH5AzzoEWSHN6DLftYtC/SpxeFLQiHDFqY5RzqHXR5OysBjd4Lq3R1qVpteN
         MYlN1OLOxvx6/EoLvvpB6dnaeJ9n+/1mdFH6ucP5RCEBfky2p5tsKOZtOtaWpaUbafw5
         DsXhm7WVYcyZrUMwtt1BZYBMgNLmjjvi4LBxlAO1wDKYhj2MMyc53v8mHbARG8+55/bo
         pNzhMN3AfaZ7K4qfjtF1qA1Gi67k000H6on7qX3teUUOBnwuINcSmHcDAS5skPEtRsna
         xn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738783972; x=1739388772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECvbsukTPy6mXnZVkUCz007RKdHndCjxf5UTyDg+hdo=;
        b=Vi7AF0PKU9VgOfNGSakucjpoHaeknZZqZzAgkr+P7zCQue+fpNyYO/7aIeKLG+JhCW
         MmDRyqlbNJvFY6Rjw/W6m9yDTWRq/BK8b/MY6ZYM9T6ofSyZ+GNt9X9ShJngrsUfIckD
         DgEE+YEYG37qJ4mnhSxZ288g4tI2amKYi93pemJ+jbdZxcjvDuA1eV7M4wHvbS1FOjVJ
         0TugNvLEcKPI0BH8Byu3emHSV+0mhvCvKHABQpPnawQlTBFbMS4WrrxzAX6Hqxw7tZNy
         H7vCpJSbqtwork9XI8AHhWAQ4ZlWIBrVm37heRLGr1WP9CBFMNzmobOePmcyb1C5Olbs
         r3MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuaQwPP+834+zemuqS2rnJxB0U+NCoKshowzN3OqIgZdDYuBumN6AVZlj5vOUYYmoegY7JwBLERZPGL1o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9KOIrD2ODPrSSFRE38UyRRTyAGfghEzB0xkrt3A2w5lZvYLmx
	DKoAwgFeue0kH955JPv1kcMGq+8boQZQMtRGhKOCBtvwIVSlbQ1E
X-Gm-Gg: ASbGnctPxaYFNXQP3SDTH99ilpyneCCGpkwfVNZMnjU4u3kTd5liLRSecPvdYYRGvn0
	hFHBtiRTR54m+cNS2J6g97CsW0mXU2jvkaSQ4V+lmPWvxvVkA2+2zy9Qpo7V80gf0NWYa/pwrq3
	e1hKAyCtPqCjeVNpnoQF7dV/kzldLiu+7fP2sYN4nlKph8q1VMxt2Nd/biCbI6Y6j0f4q9CexiZ
	FS568hmO7Srvd6ow+oPLPG0xPl7cPca3h/dajyDXufVfTuozN56kUDrBt2tw2E8G42yqfWbut6C
	wERyZ/RgtPMtgRusGURbqoV+b6KRvfE=
X-Google-Smtp-Source: AGHT+IGdmLQcXfcx8LNBJHIVw9nqF/takdAflNJokWQ3cPCRTXViKsJ9BCHFfHbFYfdWk/qLfutTSg==
X-Received: by 2002:a05:6402:51ce:b0:5dc:d11d:702a with SMTP id 4fb4d7f45d1cf-5dcdb70e046mr9693102a12.8.1738783972010;
        Wed, 05 Feb 2025 11:32:52 -0800 (PST)
Received: from f.. (cst-prg-95-94.cust.vodafone.cz. [46.135.95.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d06e5sm1167625566b.63.2025.02.05.11.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:32:51 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v4 0/5] reduce tasklist_lock hold time on exit and do some pid cleanup
Date: Wed,  5 Feb 2025 20:32:16 +0100
Message-ID: <20250205193221.402150-1-mjguzik@gmail.com>
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

 include/linux/pid.h                   |   7 ++-
 kernel/exit.c                         |  36 +++++++----
 kernel/pid.c                          |  82 ++++++++++++++------------
 kernel/sys.c                          |  14 +++--
 scripts/selinux/genheaders/genheaders | Bin 90112 -> 0 bytes
 5 files changed, 82 insertions(+), 57 deletions(-)
 delete mode 100755 scripts/selinux/genheaders/genheaders

-- 
2.43.0


Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7645214830F
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908620; cv=none; b=m5xmzmOFmbKBfcitbrFwzWsVYUCbgeMY9GzRT3jupTsuS3kKbuvcsaP3h3O3PoFZT6HdkdXnW529lKZW4HBInnVN6XVfnezbc3xxfypbKInpKLM2XB2WWYrHUJAbQRVQ630dSumX1oqzXqsrsGT/gdN+JR9N90a6NTaAUlzSqag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908620; c=relaxed/simple;
	bh=YkdTGKHe6pkvOTKCKfAPSURdEcr8d5uVicEixh+J6kw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NAVQgKWzVQ10pGPPDhiSKHP8tueJN413QMuiSuY8LACtAeTLdcoY1F3vG5mEcMt6bYVNtbH3rK9uO2HAn2f8iWu8Z7cn7bN5MEL2R4HfJJVTL0LmIt9zFwnHdb8YKcAyJAwzBEV6EYug76PWgbuSs4+hOmoFcYDqj0y2/LECazc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iyp4lc4O; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iyp4lc4O"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-2f44353649aso2484690a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 22:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738908619; x=1739513419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bc5E08HKKVYe7JpcqpDVRjanyjvgs7Rf8+MIejoggE8=;
        b=Iyp4lc4O24UnNv0fyP0Ay/Ud9l8yDTfIkEWc5onBuLBXVf6GJJkCaSYYHORReFM7D9
         1NNlwTJo31BnjFXJXV6sEbwWJkbbIwWyXhI2A3KaCc4Mcdr4EjzjGP/fh301FDAIXGKO
         eHN+XHt7TVdFmKp1a5J8gxnvFI+IMy9ZOCvvLupfairhweX6wRX0RcHFVK/yjup3blrd
         NoCmB+CFmdntw9UUJ9s39TZy98pt5ubYCeSTXqm+5aW5VUz2oemUZJjIpXNWt7Bm/vtV
         O4p4hsUxD1TgQehFE4V3jSH5r1UQkLKZWAnQX4LNsepe79GsFNNSX/nnL1Fj0HSNpU7v
         1TKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738908619; x=1739513419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bc5E08HKKVYe7JpcqpDVRjanyjvgs7Rf8+MIejoggE8=;
        b=fOXExoyM34r6wdJwFml82z+D4NJnVN4gfwQfxnpVZEebkAqH9uR47gFmtgOMwV3CQd
         QNEMS5c8eazdpc2bCggoI2zyDEm/VfB80ApNyweOQpuNEE8rQuF5Rw8pZRDYItAjc4sa
         dU+I3KZjZaGW9JLK+SsdBDT20J5aODipGySQ2+kLGy+XZJBJwxSlFJblalRYz702nul/
         njdQy3WzRcX/U8Iv0ejwjnUJ+129hAPCHDGJGZ2BJKJkk+5yqszjC15jVhIOpsDcJE80
         +825zypZ02NcHnQIQRwDT2q8+ZnIWECW76BU+WqaelE+i9tJwa3K/3fgPlejq/oUg3cm
         re3g==
X-Gm-Message-State: AOJu0YyDs4Rd36UUOJH0mSTZlmx0uE3I7mpa9Fxy9c8j/yqzJwu4ggkW
	MVgq4kvfh/3L44qmzxe7L5QJhf59x8GsqAQzfzlPrGYRBDJLL8Bv
X-Gm-Gg: ASbGncvIMnP6WthedBw24XTK2MknKEiPTwr/nK8uyE+AliRHPeU/yYN1JUz91vrf/aX
	AJcVx3RuKbfJ6havREtFdHnzhJ2EcQGdVOLuHCl5ITr00AJLVUD8uc8Z8vIDwBuX0Gs2lFt9EY2
	nBwWXmYuMC5dIZ6oPzRT3SsRRhPvNcm9KbV1/L+1Zxi0MNC+bAfLq0LakwuRIPP+dWnA8UQk5Z6
	56BuXZHwYMSvw10xfhTlL4P6iM8u1BUTLQyUU83fdlokXS+Z1z2sPTBErzexj1tnLnRITBdWkg6
	svEAY4wwwnhOZIl1BhSLglVGsqZQvfMDFNA=
X-Google-Smtp-Source: AGHT+IHwEiOOgdHB99DAuFcU4bMt2UJRtyiPr589LcOZitsGcSiJq/VCcTrB61A1cnGjWfyeyH55wQ==
X-Received: by 2002:a05:6a00:9aa:b0:72f:f4d9:bd4c with SMTP id d2e1a72fcca58-7305d4685b4mr3071348b3a.10.1738908618658;
        Thu, 06 Feb 2025 22:10:18 -0800 (PST)
Received: from localhost.localdomain ([114.67.205.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ad29f3sm2303822b3a.53.2025.02.06.22.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 22:10:17 -0800 (PST)
From: zihan zhou <15645113830zzh@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com
Cc: linux-kernel@vger.kernel.org,
	zihan zhou <15645113830zzh@gmail.com>
Subject: [PATCH V2 0/2] sched: Reduce the default slice to avoid tasks getting an extra tick
Date: Fri,  7 Feb 2025 14:09:18 +0800
Message-Id: <20250207060917.30201-1-15645113830zzh@gmail.com>
X-Mailer: git-send-email 2.33.0
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
tick because the tick often arrives a little faster than expected. In this
case, the task can only wait until the next tick to consider that it has
reached its deadline, and will run 1ms longer.

vruntime + sysctl_sched_base_slice =     deadline
        |-----------|-----------|-----------|-----------|
             1ms          1ms         1ms         1ms
                   ^           ^           ^           ^
                 tick1       tick2       tick3       tick4(nearly 4ms)

There are two reasons for tick error: clockevent precision and the
CONFIG_IRQ_TIME_ACCOUNTING/CONFIG_PARAVIRT_TIME_ACCOUNTING.
with CONFIG_IRQ_TIME_ACCOUNTING every tick will be less than 1ms, but
even
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
every
time, but occasionally running an extra tick has little impact.

Changes from v1:
  - update sysctl_sched_base_slice with debugfs, limit its value and
    update normalized_sysctl_sched_base_slice.

zihan zhou (2):
  sched/fair: reduce the default slice.
  sched/debug: update sysctl_sched_base_slice with debugfs.

 kernel/sched/debug.c | 51 +++++++++++++++++++++++++++++++++++++++++++-
 kernel/sched/fair.c  | 47 ++++++++++++++++++++++++++++++++++++----
 2 files changed, 93 insertions(+), 5 deletions(-)

-- 
2.33.0


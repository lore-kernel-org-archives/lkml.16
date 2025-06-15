Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20262E11CC
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 14:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749998562; cv=none; b=BESyIe0pT8yhoyPHPj3KYRuxqveOM2jwMxg/Iywn+Nzy2L3lozev0eWl3W5sSOIhvitTQdxL3l39j4aN2L9NWDv5zKbeK2A0wgctq9dQsc/lE1hxP6uqa+jc6ovSnMmdH9VuYats4EvrLCK7irkbPLhZT6QQuinAB637iDdz0Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749998562; c=relaxed/simple;
	bh=qjKuVYqugTWzGqu+wzyyjK/XGwYAR60cP0pdYHRdxyA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=WP1wH25d/dMw9FFz8wUzYjNv9FQzL0iWlHx0ibrE/RNY5TBqprvWLS59+eYUf5+EFoZUAgIjD6elvAkSmErjTT6OFzwyFQESgAb26ljfPhC1u+LUar9VA/2BdqeurDefLZYyQkJp8dUZYP8MldWEBXkDq6STWcugL7o/l1DUPeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--chullee.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RAxMd3gw; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chullee.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RAxMd3gw"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2c37558eccso2658323a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 07:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749998560; x=1750603360; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UR3YO6IJNXwAiCaTSTqLMXcQDKFP4AYLg6y+cj2JEpE=;
        b=RAxMd3gwwdG6M5iWO2zAPx5I0A8k1MtxGw4qm1trhTiO8/YXcvRi0gNCiaU2FTdsGC
         ici96HQufPIapiJvDk1U2LYXIH87Z2BlWDviktu0H4YPXTizV2u34iUwtCc7aY5hqOSE
         pL/yf8TT742VcJnCeWWRF6KHngowfwVyWelGNGK8UT/DEEQuOD4ah3e8X78Y92uAbmM8
         17hzXmsjMLIPGKwOkGwSWy1Z2AuIdDJgGIE/3Dwx6BZistqUFP9zupCCQ/E9upxzOtwd
         wigHcluEiOf31+CbRl6T0wXPU+f6DqbkhDf1FtMb2L1q2dfZpURTpvV1dbJZ7oIM/TeX
         2+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749998560; x=1750603360;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UR3YO6IJNXwAiCaTSTqLMXcQDKFP4AYLg6y+cj2JEpE=;
        b=EmsLNLK7BuFVTaKZrtmoJLilC9L0+VRVS14xzZNq1tN6LOOBnBi3P9qjgGvH7H/au9
         7jtwgGr22CKJhShI4Y/OqCvnAGJJlbEEcTeMkEQJGaNfmus32s0LE7Yl7PIJmQsVSheW
         tjecYxq0wRVg6YwjsoAd7d4x3WdPTM0Zkb4evLePjbxI5KZO/IV8JIDZpSo/V2QVLahc
         Zx2FG2MgSLQpyvoapOrtERkY3JY5ffriAISyHo7iw5zkq0MHre6VJ0cMi2KuKGZ94wCq
         bYiFTn7ZQ8n1nyYSS9HVUrple20T+8vSppihwS8TECM++SU2sKfulLL/h6/tEPf4lfGq
         omXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaoMzjx3tU3HcpbOWKpvdvTGG3a3Gm33NTzKkI5c55scMtdt8bFt1t+kqBggCin7cnFgH244GiRCe9krQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG4cDCFmSgRAG9jAmAJTrM++vGryHQ+Op3uyq/nDSIsFy2aLSp
	llMAwp003YPLD6vhoN1WtDdQRGqYHXmgFwy+XoyD1W3hR5wOznv3mHjSlUWy2ZB1c9agkmsgLf8
	dlQNCE+cMrw==
X-Google-Smtp-Source: AGHT+IHFKlPrsyuLU2otzkeifuA41K4s407eoZlZV+tF0WGi4ybcmJCreXaVMG+pV3VRtGXYuLNCx8xK94nQ
X-Received: from pgbfq9.prod.google.com ([2002:a05:6a02:2989:b0:b2f:1e09:528b])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c781:b0:21c:e870:d77
 with SMTP id adf61e73a8af0-21fbd52a516mr9032870637.15.1749998560182; Sun, 15
 Jun 2025 07:42:40 -0700 (PDT)
Date: Sun, 15 Jun 2025 07:42:33 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250615144235.1836469-1-chullee@google.com>
Subject: [PATCH v2 0/2] f2fs: Fix DIO flags and add ioprio hint
From: Daniel Lee <chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	Daniel Lee <chullee@google.com>
Content-Type: text/plain; charset="UTF-8"

The first patch corrects an issue where Direct I/O (DIO) writes ignore
bio flag hints (e.g., F2FS_IOPRIO_WRITE for REQ_PRIO),
making them inconsistent with buffered I/O.

The second patch is to set an I/O priority hint for hot files on creation
and pinned files by default.

---
Changes in v2:
 - f2fs: Apply bio flags to direct I/O
   - Changed f2fs_io_flags() to accept a direct inode pointer
 - f2fs: use ioprio hint for hot and pinned files
   - Removed an unnecessary f2fs_mark_inode_dirty_sync() call

Daniel Lee (2):
  f2fs: Apply bio flags to direct I/O
  f2fs: use ioprio hint for hot and pinned files

 fs/f2fs/data.c  | 10 +++++-----
 fs/f2fs/f2fs.h  | 20 ++++++++++++++++++++
 fs/f2fs/file.c  | 14 ++++++++++++++
 fs/f2fs/namei.c | 11 +++++++----
 4 files changed, 46 insertions(+), 9 deletions(-)

-- 
2.50.0.rc1.591.g9c95f17f64-goog


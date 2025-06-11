Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495C21EDA02
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749685112; cv=none; b=k4SE+CcrdyyuUaiDH+ZowOy9hxZfjnKfyNXU4sCxmZm22xw2aAOXoja2QUL8aYYRYthixO6LvrHfBkD8ypop2UbTMaKCCr82WtgoA9VrAb2orsGzGBTDl5WRvQmQPYm0+8aNa2MjXYELlCNuZstHfiw/omv4XzszabZChodGNmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749685112; c=relaxed/simple;
	bh=jdgI0KZRVnoRNshOhB4TGbgG8eutBkxBwTz5EiOQio0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=m8doYn7RylMol33KKxqV9L6a2HfLCN880d2/Y2nRCXCo5NolNk2SwBgb/wMMubI1SmsuX0t8siJy3OGxnvxp0g38nvZMZT/BAQElxYGhRoRFutlUKi6AdA16QvlDouDbC5030yMbGGJj/9YvqcAOZ2RF3gbizXfhLOaQ3vdr5+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--chullee.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z6rNna+8; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chullee.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z6rNna+8"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-311e7337f26so267532a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749685110; x=1750289910; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8F2eTmM0CFaL0WejT35gjVg6cCl6giv4q15D+/NODLY=;
        b=z6rNna+8FcqkBtD9OjqomQ+MxErf1N6LvqZP1zEftqDQwTAMJW7AWqFXxK2alYQEqN
         W94PBn/NDZyIy4qcn671+WGuEzPr62Dsy65nFOw0lFMIDqokiZ1hvjSdn6QscEvB4UWT
         sHeyUgz+ykjfzGYfzjtInuTJFpLCe6e9wjvokpbPYsxDQOphRSN6XRcEgjSzWvb/1rTb
         /dOwmsAUCXDhveFSqpgQpueOPeshz6NoXuEVNKDmwJekXUqPUt9Ceypx20zy+C3btt5V
         PVFtt+cv1EIAS9tosDo9Bn0sFe+j7ozSqEuqtWDqRQ2wGP/7Pv2eAVOGfb2yamftxJj5
         x+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749685110; x=1750289910;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8F2eTmM0CFaL0WejT35gjVg6cCl6giv4q15D+/NODLY=;
        b=eSQAUNDbDDY6OYgnF1wK2iJsFPI3sVAMeoRapqnBf8cVu940StXSBVrI3GZQ87A71F
         gHgbNHQGDL7W2qRseTZFNvp+PlMgAreAeAQ7L2Gn6DVLJmM9OnZv76mj7YIMZ9haOgfQ
         +fAMXx2Zkp3akjhVzSgX9f4bm7eaF5kwhFzBzgRd8R1OLdcAlfLsn6VYzEck0aKGP7FT
         ME8Xby7iObsNoF5yAXhCxumc4NY8QQVaM7tc6LWc5J7LMl1ZYXS0pUf5264RS4dHvKXe
         hqMdcnC39A9qwCI3w+7NkPc1BMq8T4JDAJXqd3e4ut1U56ifozJhEPb5OhctRb3w5Fqx
         53Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVVTrSszumVlYY8E/hUW5DPON0uruojRJ4gpjVR8hiz/maytC1hy6ICOufbBFYDM2HmzTmlbJuISBKS9l8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR765Q+GTHBQP3jnVrX7uWgBq/MxOHt6b4VfcrAyqf2uaSTyqW
	ItlYdYOa9cL+F6We8VL7abDqdZazn8tyBIRsaWeIMyiBUWwJsPL0ylbNxJvy535fhKL6mBoRptJ
	LwWFjWzWR9A==
X-Google-Smtp-Source: AGHT+IE2P96bQ8qW6lzT7npZCX2BJTTa35jKcQemEzhPtoqN4Wx+tsO3GF/ofgV3JItkCYvq7q3XVdnRpv7n
X-Received: from pjbpq18.prod.google.com ([2002:a17:90b:3d92:b0:2e0:915d:d594])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d64f:b0:311:f99e:7f51
 with SMTP id 98e67ed59e1d1-313af1ac76bmr7951669a91.18.1749685110646; Wed, 11
 Jun 2025 16:38:30 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:37:04 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611233706.572784-1-chullee@google.com>
Subject: [PATCH 0/2] f2fs: Fix DIO flags and add ioprio hint
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

Daniel Lee (2):
  f2fs: Apply bio flags to direct I/O
  f2fs: use ioprio hint for hot and pinned files

 fs/f2fs/data.c  |  8 ++++----
 fs/f2fs/f2fs.h  | 23 +++++++++++++++++++++++
 fs/f2fs/file.c  | 15 +++++++++++++++
 fs/f2fs/namei.c | 11 +++++++----
 4 files changed, 49 insertions(+), 8 deletions(-)

-- 
2.50.0.rc1.591.g9c95f17f64-goog


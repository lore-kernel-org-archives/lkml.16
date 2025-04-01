Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9061F130F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743505371; cv=none; b=kOkM6nBvqejYC5vNoYsO9ULixqKW69XwdUacjRIlF+B72CoCi8r3twJi8Tmi/o71qAl9iqf3uYSAw5t6KeA0yVTeAiaL7nEF66ka1YQAB/oyz7QJQW5G/9sC0SB4raXaZo6ZbZGqjcWak1xOM1n44QZBOVQvSTFqIiyRLqTyzpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743505371; c=relaxed/simple;
	bh=91I7VCwI2OaO+lKf2oma9fDOGHKZ0uGAqM9i5HzTw+s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=SCTACZVQgXAL0+f2c0Hi/RWT49183qssZ50oWIuOBSgwnTS1qGiIhwCI3b9NxG9WnT2lXG5EaoNeAXYWrqmfZspFZ4A5Vy9B6Br4npEAV9hXl+oMvKa6FgQQkzPyCX7TM9Td4ErJMuZuA4DA0TM+s1De+q5RvonucqWgT7O5/ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Nvyh6TOI; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Nvyh6TOI"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47662449055so27741781cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 04:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1743505366; x=1744110166; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eZLpPVcVgTYBqMo2PsNN2kP6ptf4HAnoNVh2L3glhRc=;
        b=Nvyh6TOIC4wPGZJo6k/wfjCaz8vADPIrxxaN9s+mo1M+1/u9dbH8uH9OGd1pC0RsCR
         lZLYzPmhm+RiYVDmh80Y03YDWsz3gbpVfuD32HTu9+qH4hqTkZ4toxusu2f0SDL73K01
         29mpXti+DgXWvuHngJkXIViV6ixrxof4jOMQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743505366; x=1744110166;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eZLpPVcVgTYBqMo2PsNN2kP6ptf4HAnoNVh2L3glhRc=;
        b=dJiWN9ZTbCETajgcVBItWW67Fr+uHM7akD3deB8EtrMgghzyorS0tGGVhF1kXyoEsj
         hkG7fUUOf1vDBgFIRbHJrs7lIiHTYA+U4X/gQvSd+Zq2bxvkespxCjBgunYzaX0o460v
         My9p6qoiVKMHUDnZ9/3PYRZLsYA6yoY5fn7lnFT93Ke9/Hs1w2nCUt+00F372IlPpRw+
         tVGM4/r8qZpMLADsQXrPB9yIbrPRGqrJHoyamGKk5JECQ+ELTTZP7K1EgaEXGUxQhZi6
         fF9WsQCJpBkX8a4JCO6YTVY1MKDVfNJlKOkOnz5C4EO/LR6d7migQch3dU3kubC78YAe
         b0cw==
X-Forwarded-Encrypted: i=1; AJvYcCVsrPhWSlolWvzjqJmVzRd30Ivv1/RQchOKr2nrBcicVr3B/Qw+STMpKBeqlue0bxD4UJ3q74Dpdw4UU7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZSzUneKnDnDXabP8xoN1H1UxS9YhUlJayfagJCRvy7gHSUnO
	gQCoQWl8hh8LlwW8W+JevRL61tHkgamMMGioe1DTLrd1kAnX5GJf3Inhts95EhTqooSqCUaKCI7
	3NEfxglzhWOU5+tAkhDzrpcf5IZ3332+bvvDLNw==
X-Gm-Gg: ASbGncuTBi4Qe8LAlahgse5zfwS30FGHptPMrLw67rsvlXVObtLJhVFdKF4ePIO31Fx
	H7rHA3awqBrf9GyXJub/dqZNqilmb10IW8uDvrEhyN0MvVj7yJALlc0G3eocM1qbdZKa+DQLKR5
	ZVOOxeDUZ7+EtFk3/L8JcHOEh4GQ==
X-Google-Smtp-Source: AGHT+IFPzf50qEAiKAO3bJ55C+KdbNpjVoY2R+/BGwqhN6U1ohO1vzS/251ziWBwEk//3hNtrSTEJhH7mHBWNV/lxF4=
X-Received: by 2002:a05:622a:11c4:b0:476:8a83:960f with SMTP id
 d75a77b69052e-477ed7cbda0mr170062431cf.17.1743505366268; Tue, 01 Apr 2025
 04:02:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 1 Apr 2025 13:02:35 +0200
X-Gm-Features: AQ5f1JphLYzOgtO2AjzpTqDO3lmO0DAlyHRcxy5cT4T4ZmLJYDIHHwELhtEkICw
Message-ID: <CAJfpegsQDTYsEWHMK9skpNzUO=GA_DR7zGHftyO2sZH5wjaZLA@mail.gmail.com>
Subject: [GIT PULL] fuse update for 6.15
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Please pull from:

  git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
tags/fuse-update-6.15

- Allow connection to server to time out (Joanne Koong)

- If server doesn't support creating a hard link, return EPERM rather
than ENOSYS (Matt Johnston)

- Allow file names longer than 1024 chars (Bernd Schubert)

- Fix a possible race if request on io_uring queue is interrupted
(Bernd Schubert)

- Misc fixes and cleanups

Commit 1dfe2a220e9c ("fuse: fix uring race condition for null
dereference of fc") in this queue has already been merged into
v6.14-final through Christian's tree (commit d9ecc77193ca).   For some
reason this causes a merge conflict, the resolution of which is to
just take the version from this pull (i.e. remove the atomic_set()).

Thanks,
Miklos
---

Bernd Schubert (3):
      fuse: {io-uring} Fix a possible req cancellation race
      fuse: Allocate only namelen buf memory in fuse_notify_
      fuse: Increase FUSE_NAME_MAX to PATH_MAX

Joanne Koong (4):
      fuse: add kernel-enforced timeout option for requests
      fuse: add default_request_timeout and max_request_timeout sysctls
      fuse: fix uring race condition for null dereference of fc
      fuse: remove unneeded atomic set in uring creation

Luis Henriques (1):
      fuse: removed unused function fuse_uring_create() from header

Matt Johnston (1):
      fuse: Return EPERM rather than ENOSYS from link()

Miklos Szeredi (1):
      fuse: optmize missing FUSE_LINK support

---
 Documentation/admin-guide/sysctl/fs.rst |  25 +++++
 fs/fuse/dev.c                           | 162 +++++++++++++++++++++++++++-----
 fs/fuse/dev_uring.c                     |  47 +++++++--
 fs/fuse/dev_uring_i.h                   |  18 ++--
 fs/fuse/dir.c                           |  11 ++-
 fs/fuse/fuse_dev_i.h                    |   4 +
 fs/fuse/fuse_i.h                        |  47 ++++++++-
 fs/fuse/inode.c                         |  51 +++++++++-
 fs/fuse/sysctl.c                        |  24 +++++
 include/uapi/linux/fuse.h               |  12 ++-
 10 files changed, 358 insertions(+), 43 deletions(-)

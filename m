Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEEE2609EE;
	Tue, 13 May 2025 13:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747144142; cv=none; b=UgDfDXp8SPBCYFSMD+FRPlLKpNZtjrhF7j8ZldFcqvJoXBRQZfVT3DyNK4WSRXnmaMMy0/ChnxzjnZcphVpWaizULOJS53Xyiwrb5NjZorhd8KOAWhNsU87vdnRe7ZBDq5BSHsMos6FVg9xw+Ivpu1g1T+gWeesx2OqTGwowk7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747144142; c=relaxed/simple;
	bh=66K1JbMqUs/uAtCFl8H7jffaJzfrXLErWLllPJGfxBg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rSX+i3J7dmTGwDW62QBal+c0HQZ0YvKPUVRv7lVjYaIPonX4mMFMHyUfcOMryvYxj1zmN+Wa/fCWUjxOQBvc0wbJ0Ga+BRqE5ZYymcD5FmhF6dt2ATUiMDBInzjGV6ie3rA2s5h3I67KvVpzlnlYn5lSkIvXLo3MtQ0AYUZzoRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlY2s8bp; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlY2s8bp"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-708a853c362so51799377b3.2;
        Tue, 13 May 2025 06:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747144139; x=1747748939; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vRGKXZwQGJQro116AeMOhbDlererh9+81RGekmuvRPY=;
        b=MlY2s8bpC1tGdspacpRKXnQ5/E/rtwkh+3JNpX/2HyXxpPwW90jLTXr4Wnuw9r72Ot
         ApWFuuMDH4vqSJK26jIVIXafJIEgtFHM2CoAMDgNNBBu1KuF/96MzjztEnv368tcU3p9
         faF9e7I9F946Sm948y82Gbw0DcEDcTQhodb35t2YxHAGC3CG19+Fu/OcMsF6ZXEp70Df
         RnH/PMFinuEGYrLd79kGR5DKfUXzWlrfHugr0M7YemqgGM6mLEHpGiu+auZ2K9icGr8X
         LIVjpJ5zaghtgTkmMU76b36RbW9HA2c+a6s8JLIpjQlwb2RGuUvt3zVgY1c+q+sWtfVW
         C8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747144139; x=1747748939;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vRGKXZwQGJQro116AeMOhbDlererh9+81RGekmuvRPY=;
        b=A/Qbav6wPCemSlcEtbM7YJKJE1p7SsS6DNkC5hhaMQMbGZxFcx+iXXd4pqAkjIV//R
         OliJ05smns3EIiO04K2GJNDlBafkyW9iluXa+PU1PH0FPCJPpgEoopiN1nX7xzxXucT+
         3L86YvhAl6zXlvxY91eVn6dvNNylZrxgMeknJm/WYPMAjIbF9kZ37SiyZQkO9sP7b4Zj
         QV9gw2GAxRZsdzNGUFdYJ1gFDLEyKKUpIC/JoHcD9d8UhQdli5g3jrhYEtxNdQ9eq3kq
         wjBviWJ6RmJEJuWz14Vk9q5QErIxCPq0CILO9iSDmBg0wcWGi5bdDWvYqqrBZ1WyFVL7
         iEZw==
X-Forwarded-Encrypted: i=1; AJvYcCXn2AkgU65QunTL18xT5kXhY685BTf28ZI4ViI/RyXaEBnVdfEUxBQ0HRs5P+B0VShwijQfonzxqc8=@vger.kernel.org, AJvYcCXv6RqJT7ur8A32BeX03wJODoEzEwWXkjmMNzN0Nogz/P8vBuIllpDzpbJe5tlMfDbe161zDzslv/lJr6gP@vger.kernel.org
X-Gm-Message-State: AOJu0YyR1vfvTRdRyxUNZ7kOXlBwblIm9bNBGu/GvPbO3+CD/A/2xhHT
	AuY82R+l7duyZvO/c2xrOYeOfRmh/LKspCsUrvTh3nmt14xS1jmWvM9tM43QwEM1RF+BYnogPei
	B4BnFLZkWOVX+LPFVz15pAhVNR4rLCADT
X-Gm-Gg: ASbGncsAZkQGtGjTHnYTizeN2B5bwfWxG9auGNriaqjkAUdqHALXgn4Zb3PJjv3Sw2e
	Y2DzubKL5Lh/ENudyY9Y/9e87oln6JtdV4DVVc4zQ8luVEApL2dSTiTy1AClibP2SVtYsqAK69L
	OEn+RfT0uCWxbI1/WcIVlgJhdiB5XdisfSsg==
X-Google-Smtp-Source: AGHT+IGlA8y0H8ilo+B/SfZsh3YCGU40HjNzOUtartX1Q6gfUIBMaqqYkCgV/PCefapPM90mcFSZ2kkWPWEgIj4O2/8=
X-Received: by 2002:a05:690c:6181:b0:6fb:b1dd:a00d with SMTP id
 00721157ae682-70a3fb0f629mr234222177b3.30.1747144139536; Tue, 13 May 2025
 06:48:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: rujra <braker.noob.kernel@gmail.com>
Date: Tue, 13 May 2025 19:18:47 +0530
X-Gm-Features: AX0GCFvL1HU8odFxkZ26QKJDadh6mPRnHNzzEcLAIK37gZUd1JuUQfiZmpB1Rng
Message-ID: <CAG+54Db5eJVogCLKr3y5W02-Ksn7ChTpzz+UJaeoXJxA_V-QtQ@mail.gmail.com>
Subject: [PATCH] TASK :Linux Kernel Bug Fixing: Fixing Warning/Spelling checks
 on the rst file
To: skhan@linuxfoundation.org, corbet@lwn.net
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

TASK : Documentation Task
removed warnings and added "SPDX-License-Identifier: GPL-2.0"
in starting of the file , also instead of using re-use , have used
reuse.

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
<rujrabhatt3@gmail.com>
---
 Documentation/process/adding-syscalls.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/adding-syscalls.rst
b/Documentation/process/adding-syscalls.rst
index 906c47f1a9e5..17652610450d 100644
--- a/Documentation/process/adding-syscalls.rst
+++ b/Documentation/process/adding-syscalls.rst
@@ -1,4 +1,4 @@
-
+.. SPDX-License-Identifier: GPL-2.0
 .. _addsyscalls:

 Adding a New System Call
@@ -117,7 +117,7 @@ then the flags argument should include a value
that is equivalent to setting
 the timing window between ``xyzzy()`` and calling
 ``fcntl(fd, F_SETFD, FD_CLOEXEC)``, where an unexpected ``fork()`` and
 ``execve()`` in another thread could leak a descriptor to
-the exec'ed program. (However, resist the temptation to re-use the actual value
+the exec'ed program. (However, resist the temptation to reuse the actual value
 of the ``O_CLOEXEC`` constant, as it is architecture-specific and is part of a
 numbering space of ``O_*`` flags that is fairly full.)

@@ -378,7 +378,7 @@ the compatibility wrapper::
     ...
     555   x32      xyzzy     __x32_compat_sys_xyzzy

-If no pointers are involved, then it is preferable to re-use the 64-bit system
+If no pointers are involved, then it is preferable to reuse the 64-bit system
 call for the x32 ABI (and consequently the entry in
 arch/x86/entry/syscalls/syscall_64.tbl is unchanged).

--
2.43.0

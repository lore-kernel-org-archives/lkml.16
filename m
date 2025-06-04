Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B372E3BB48
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 03:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749006171; cv=none; b=ARcLYRj4NZe3ZASLrn70d0X2sPGqsbHSu6mFYLZnv968nVfkceT/x1r6Vrj++Ojpne/8oX7aeDAvFTMt4Bbo8UxR7mN3hLEVY3O8Pypbmbej4yMrz55H57aTGhiiw6DoNehxEW75Oeuj9NURvpwYFYnjcJjrPKC6vMYZz9CT1Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749006171; c=relaxed/simple;
	bh=yhhVpInicP6iy5WBpCMtSBz9guuVRd9h9jETSNF9Q5c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=LU1+HfZP0nvXVvieI5tdCdGzLXtm1jtySkKP6rhi1gXLFp+tIiJ2MFTAZrHBzAy7IhgLf94BvCPlW3+ft+3Si8RKJSbKfUOr8MSjtHkKDbqBWD5bOXmo+gnIhG+nNSAyPn598TBcxnQYeOkaNJkIYqhuJR/E02cIGlMH9TEMzyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mobbtSQg; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mobbtSQg"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553241d30b3so6771106e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 20:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749006168; x=1749610968; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GeRUt5U8UJSWikUfG0CDvL6CE+32CJ682+R3DA0hI4s=;
        b=mobbtSQgtfo9Dlzwg8PvOimdFo/Ar4M3ePl6blJurt9Vm7M18egb/M/Vj5XPwk0Fi1
         6jV1SxBtGXksCh6XPlzkUIOOesxMOMZfj6gDlc//CRRkwaxS5jyxYrVNiRRZhZV4Qe/s
         LByG6rkMl0jLSDW7BH9sxRwqcCaWH4sWrQXxzyZEBJN+R1w11JgPtBK3kK+w6vkG4dUJ
         p86PZUKsNgLTFYXZj0h2VNW2EFZQLJcMfTw/sFzdmDfrifBxbBrAm2srao4eWHIccukB
         xUoNtJ8BNWkJpTI/TVUc6OnfD9YrFW+ZXzKhqGUeZzXJMQ0n0JUQo2cJ6q08ISA0jNFQ
         lJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749006168; x=1749610968;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GeRUt5U8UJSWikUfG0CDvL6CE+32CJ682+R3DA0hI4s=;
        b=fdGLzmwaLx06LaU4UTjSslpdkqAAT1Ieb5qDxABWg4oBGPWnW/I582f7lTPjrUSoXR
         g4D5Jt9WBaQO79+zAtOWGzWvxKUlCX0yvRARk3woMgh/YLU6lYac8AGj8toFA/VSh0hI
         xpH3ylFUZ9NghJYJSVXLOaV+b4mrCdnHyTzOAB3aAxQ3vSkh9Nh97NgKdIhXH3q1cjdX
         cXxq/wQG+az6bAds2jbzJIOXsXsLg1hRqcIaTZffppXxTqIraXUE1jVnPZVJHo0kytPt
         q4poIuHh8nxT3siOqPpbM1XYE40lGgNMAg++tWGNMIcTWOcs6OA2+1+sLz9HcF8no3d3
         KQqw==
X-Gm-Message-State: AOJu0YwitRKcZ6cfgb4cUnQDS/YBnZFDOAL8AlbUUeMJn9+SBqOoHAxB
	yA4jem7MFsWtxol8uGE0kcqgtxfsuHrgmV/E5RggxGvIiNXto+VdkYlTR7TVdvvmZl44ZcDGaag
	y5WL0qD0JEpCu4nHQfN2CGIe4UMjyMwE/wb0Y
X-Gm-Gg: ASbGncutRWFeUUKIUq9MnDndcP92NW4/X6xYK76PxgY+JnTVbe3mw/8vEqFSIrUGu6V
	TpGxqdp10GwjP5huP4pIMup37CrFTvt03tLFq2D0kDVdSYQF6Qu6Zm0AGWMy5FCd48AI6hpFzA6
	LjZ6JdYIBei/O0PwW9rKONdbinHxqQGAEZmOw=
X-Google-Smtp-Source: AGHT+IEMD8WPwa83n8LdyDqZqkTcA55a3+XdCGKG082P6Id4WuWu4d0/hvSS+Q2852t0kj5MQtisHjOAto4z167xoZA=
X-Received: by 2002:a05:6512:3b9a:b0:553:330e:59da with SMTP id
 2adb3069b0e04-55356df2b6bmr308207e87.53.1749006167521; Tue, 03 Jun 2025
 20:02:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Luka <luka.2016.cs@gmail.com>
Date: Wed, 4 Jun 2025 11:02:33 +0800
X-Gm-Features: AX0GCFsEFEi2BEEfa4cgeNk34tauVgp3qZq8BLXjhmMLEmIPkhh4CKS0gmV7W-M
Message-ID: <CALm_T+1OF_Vvigyt6Jdb1f0LjXysCfcjMFN1842KKRFbyzi+ug@mail.gmail.com>
Subject: [Bug] spinlock recursion in pl011_console_write in Linux v6.12
To: Russell King <linux@armlinux.org.uk>, Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Kernel Maintainers,

I am writing to report a potential vulnerability identified in the
upstream Linux Kernel version v6.12, corresponding to the following
commit in the mainline repository:

Git Commit:  adc218676eef25575469234709c2d87185ca223a (tag: v6.12)

This issue was discovered during the testing of the Android 16 AOSP
kernel, which is based on Linux kernel version 6.12, specifically from
the AOSP kernel branch:

AOSP kernel branch: android16-6.12
Manifest path: kernel/common.git
Source URL:  https://android.googlesource.com/kernel/common/+/refs/heads/android16-6.12

Although this kernel branch is used in Android 16 development, its
base is aligned with the upstream Linux v6.12 release. I observed this
issue while conducting stability and fuzzing tests on the Android 16
platform and identified that the root cause lies in the upstream
codebase.


Bug Location:  pl011_console_write+0xf4/0x770
drivers/tty/serial/amba-pl011.c:2323

Bug Report: https://hastebin.com/share/duhenefemo.bash

Entire Log: https://hastebin.com/share/unogayisol.less


Thank you very much for your time and attention. I sincerely apologize
that I am currently unable to provide a reproducer for this issue.
However, I am actively working on reproducing the problem, and I will
make sure to share any findings or reproducing steps with you as soon
as they are available.

I greatly appreciate your efforts in maintaining the Linux kernel and
your attention to this matter.

Best regards,
Luka

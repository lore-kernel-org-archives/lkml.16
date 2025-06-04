Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1334B2F22
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 04:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749012481; cv=none; b=irML2Mx1HqyPv9Pg+wei2wMPEa8biZ374jZk+hA/UUTdwv9BOoetIF6U5wqS45yRFe5fY6R3Usva5xlYnOYU/UomNKORhb7PqGDFZlz47UCdb1G5aTUKEqBUyozn86s4c/cd0lt5FXNk6yBrh3/cWODlfEJyxLzZkX1Pt4HRka8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749012481; c=relaxed/simple;
	bh=RM9M9OiMu1+R0Luu7ZV6qhyHKgBTQOyCmd3N9kIyj6M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=QPH4Qx8BKgL/+mjKiEhIJ9AANsR2M7TYhyfYkx/BmPSz5onOsnRy1CDhp6tjUn/fjeR2vdpymq5MyJPFTfsGpbzgmuNMZhBcMnHVgsH4ZS909FFCYeQSRoZCrYeVJgt77NPR+n36oOcwxcQzVN6cD8owZt3TmxJeeCnSMU/I/6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYtm7YvH; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYtm7YvH"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5533302b49bso7856336e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 21:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749012478; x=1749617278; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qSDlUEaG17hMiv7Cz/5urw6a3UJxGu09sJ1WC8jpy8c=;
        b=CYtm7YvH2bG0zpmVzR3rA4OImqvlcSOKSYIe2ztVS64o7UcuIASPIrdDEfyFBveiIW
         4Jg11W+NiC5OyZJnfzrvZFGHDgBZqlszTTiPkEhIGs/+SUUggnBrQi7XQWp6WilyNvll
         umKQB7V9PoITfyUMMF3C/MMS9bI8v5S5OvjW5ZUn/Qz6zBuh+zZIDsIK11yIAApjN7wh
         SoN2LQieZodqCivEJGkld4yRzISAsY+tHsX3QAVGRiIp46N5NvUz5gvLkEmC3tNj03TT
         0b2yK9ucKt3M8iS5qlnG0rSS/bAPMhWjKrtTLKgoB/nqso6TbHuqYzS80gOjilfwz840
         DkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749012478; x=1749617278;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qSDlUEaG17hMiv7Cz/5urw6a3UJxGu09sJ1WC8jpy8c=;
        b=QPnGltenpYzLqApawzqhHg/UVgenQmb6LV2Bk4POx8zd/S9Zo+59gTVdHm3S2YrGR3
         U+t6FLlWUc4rrIuAFiC2S1eBIXAUABxEklQ+fNgoZBRlQFdXgjFIQ2q2uldd6Sgclv0r
         5gdzsGa4B60JAgUREra8urZIGwZFm+JJkTLhmuiobDSujKT6e7Fmrz2+CKgoQtJmM11H
         wtmkWMvFcm0NzkHWvbFVHwFVexorPSgBl53ag6T2jZjuBukpOBFi15LiT+OevnssC9Aa
         D35/m001dwwbQgWdjTSQDsiftLVrAUklTKoxVVosz8T23lOF+kN5DAlZ3UXoi95MvDc8
         2Omg==
X-Forwarded-Encrypted: i=1; AJvYcCVOgNQXfM8J1xDpMxuPl7PY0qE+SSAp07clUuuTrco1iYDl8XnBMoR9F5QoA6q2HAr+D1xGJLjjLnWPH4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJIuNHUFaaN8lNjRtkuT39WdqOYH8l9WLr2o6p39P/8yGfERMp
	jWNOrBFzT4Xx53GVkOi+OHtTvJzLTlfNoeKEdGWnSXP5moZ3FEG41glMLlDmIMIi371c7U6cPsS
	/9+6/8z/uLVHMdzZqmAeXmFv8U3/hC0Y=
X-Gm-Gg: ASbGncuEjSfVNBKQWvmzYEKARH3gtG636DgC6KyLV0zlGtfy4Aohu7GXg27THCre7v7
	Wu47EGtGWNno5XF9VaPoZDVX38tIewR2vqDbaZwD1K6stbdHOGX1kJWc6sO43Z8fQzlWEUe/ORi
	Wn87kouSjlTAexQnphCy39cEH6rws+2TwJus/XsEGX4P9x6w==
X-Google-Smtp-Source: AGHT+IH5F1ImC61WsOSS67Cvo3o4rRw8K8NYDWP+mjewRogDktPs0iq5wQjtia8UJUBM/N3xjKfm2WUscf+/bNJ9218=
X-Received: by 2002:a05:6512:33ca:b0:54a:cc76:1676 with SMTP id
 2adb3069b0e04-55357bd043dmr244207e87.44.1749012477941; Tue, 03 Jun 2025
 21:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Luka <luka.2016.cs@gmail.com>
Date: Wed, 4 Jun 2025 12:47:45 +0800
X-Gm-Features: AX0GCFsWGVBKHqqQT3C3oTPflCcAW357GAjJhN8iq8LxArwF6lTVf5oxUJmtO0s
Message-ID: <CALm_T+2nmQCQXsBSsD2QPTXb_wOKALAgOPwzTFc=evWUmUsq5g@mail.gmail.com>
Subject: [BUG] WARNING: locking bug in ___rmqueue_pcplist in Linux kernel v6.12
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
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


Bug Location: ___rmqueue_pcplist+0x3b0/0x236c mm/page_alloc.c:3276

Bug Report: https://hastebin.com/share/tobupusuya.bash

Entire Log: https://hastebin.com/share/imecipavet.yaml


Thank you very much for your time and attention. I sincerely apologize
that I am currently unable to provide a reproducer for this issue.
However, I am actively working on reproducing the problem, and I will
make sure to share any findings or reproducing steps with you as soon
as they are available.

I greatly appreciate your efforts in maintaining the Linux kernel and
your attention to this matter.

Best regards,
Luka

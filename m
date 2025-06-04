Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED907262FC4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 04:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749012199; cv=none; b=BBwky1vU8L6GhPJ/ohAy9pJmNkSR0ETTkJ6QQItUx2DsWAw7AEFAeqvWzGHOOyDYzLHWs5ImWuAM6lTNpCbhE2Q0S5Ys+0XLYZbVYN133SOd+H1afFGPT7iHe7diW1YKbWXElTJgMSb6xiNixU7nqok3jLUjiA7A9eTTvFB48AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749012199; c=relaxed/simple;
	bh=hn4eEF+d/XIVg8o+5qj7OoaazP7r75dF9bVqjI9h+Pc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=B+RddL0TqNAYgSXixXsfcIKr+7I3S+maS+3Rta/kjfvmfzrVwrBJW2I6PTzuYPImbu1/g7mKFA4Ap1mbRKZbOaFv+ZzLRHQ19cEysIrB68daGSDNNhLKShyzm7kfw4lrX790RTZ2L7YlDVqgTcHu12W/qPGRYW7jlWvlYikgpRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GH9rGLKS; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GH9rGLKS"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-552206ac67aso7049071e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 21:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749012195; x=1749616995; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uUIOuB6wUhZui1sTenSUu+M0ekyMGAAImqvUhbxtV5A=;
        b=GH9rGLKSi09Uzi9KgaC5B5IVDcqut2P2dygKWcju4+4uyU+LgAXYlFZXlu+K8Y7Cde
         LYSK3N01fztbD3jV0ZjtirH9xYBErpoMnxV/UNQWdubyhcntq0HCeqgg3t8KRrgtnPTF
         AwywneTPHzxjwlnPV8+ucAiZNjJOa1UGcJoVCZdrLE1PZfhJkV0tiEVSkOjdk5zsBtDB
         fjLAZFkEhemkRRbROtkpWgGkQPyoxN0/l48jVnQNU31azrOnZJP4eG5QUmNWfihKvuKM
         E5+Gtx98y20XN8JiugmHTzx6apAZafdxkY1E3ZlnG4YGUp7UXl93uoJJQpB78G5bQ1XR
         eFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749012195; x=1749616995;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uUIOuB6wUhZui1sTenSUu+M0ekyMGAAImqvUhbxtV5A=;
        b=VZMSXFDEH44SatLhrYZnTt8tQZ5/O8Yfs/SdZH0sSGPc9Bup8xupXL5grIiuFhW5e0
         K8/0gY7yPeLEcZWADi+qZNEiZ39Gpuc/KRQFK8xReLRVGIQSuTQycwvcyl3TXLn/UWhn
         fTm6DWErk+/FngKFXPKDcYUT3fpzoR3j0tmtnHw4mkhiBPVVb5I8TKbi6g6a1ezwmqbr
         RisiZr4svMeL308OUFfMydApAN/f4LvNH2qZi5kgDvneImWZ/WsVxmF89/d09VlTHhWK
         Rp0+adc35Ez00YlbbpbuW18HJ5v+5zluCTPNjPv9Ifdi2/jZZlYyu/tJ87+Fx+R53P1N
         8gPg==
X-Forwarded-Encrypted: i=1; AJvYcCXxRonnO8vt6pndmpeaVgfjRrgRUfL8CQE2TUh70izypFFn8JL+cNTszmH/FUSlHYyTK72ePZ117Dq+Tyk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz73f8hfMqQl9iEXB+I6Zkrv22sh9S1GeWVxRwxHy9h7nSt1KV6
	Q63bN90mKcq+q48bkxQKootIi36I33uAdS2uThGb3H0muCUcPqr8N1zjrd8yGroY5EqXJdaBwUV
	WD9NKlZp2RUMZ4RyaTc3GxzyCvXggKwY=
X-Gm-Gg: ASbGncsFCBEiaXBgdNbp9ow9g+/al5Ex/s538z0fFVSbaaacFGnsLju3gvG8pe76RQK
	todUHXcsgwpANShXCyLfKE/PrJJVURrNcpfKxxtFd71uggrah6d/qNSzXmIfbxHroK6f+ReSKEj
	1fxkUtkpDCEWMhw2THmmvhtY+Dve1FA9O/GFI=
X-Google-Smtp-Source: AGHT+IEjLrF2USHgml505VaSvuYQMBeqtRdYXwcEEsPgFZJv1hUO1A/vK6M0JhjlwW91WjP3BPr0YXh/7hchK15svdQ=
X-Received: by 2002:a05:6512:15a2:b0:553:2812:cefa with SMTP id
 2adb3069b0e04-55356af6f87mr394496e87.3.1749012194964; Tue, 03 Jun 2025
 21:43:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Luka <luka.2016.cs@gmail.com>
Date: Wed, 4 Jun 2025 12:43:01 +0800
X-Gm-Features: AX0GCFtGPwUH-5RHmsDNhCa3bSrRvzuXpss7GX4IPhkuraXTR9vUC3sB0YpBgHc
Message-ID: <CALm_T+1tHV6QmeykRwch602TzgJet+1dOWe25VSV6dw_Xo0SyQ@mail.gmail.com>
Subject: [BUG] WARNING in shmem_rmdir in Linux kernel v6.12
To: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>
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


Bug Location: shmem_rmdir+0x48/0x84 mm/shmem.c:3733

Bug Report: https://hastebin.com/share/jazumewiya.css

Entire Log: https://hastebin.com/share/uyuyaheken.perl


Thank you very much for your time and attention. I sincerely apologize
that I am currently unable to provide a reproducer for this issue.
However, I am actively working on reproducing the problem, and I will
make sure to share any findings or reproducing steps with you as soon
as they are available.

I greatly appreciate your efforts in maintaining the Linux kernel and
your attention to this matter.

Best regards,
Luka

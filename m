Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69386289E2F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747913208; cv=none; b=lm8HpQ1UcPZPQ7tSr9TlJvuNf1UHA001qTSzzQPQNDHmyFE5lpZyoQNNOIpQP8u0ELoMut+syWku/mLWgBK9oaDBKqBpyOwME0dLlbnC6ARO0PObt5gnkFG6TjDwRJCf8Zn29mJ0d6KPpl+aK+Mmcs0kCRGSG0ILi0K03f39dQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747913208; c=relaxed/simple;
	bh=tO+EPnAPVJiuWHkuvnHJBaP5+AY092bC5r7Cuo5Qndo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=J9/luYH3xxbLQu5rhL3M2d59uARrKTx8wBnO7djOt+COJvuxfTgi8jnhrqC6PP7cHC/0WGx0jWRzvppFGQ613olUEMaSKC/+EpqQwcV8l77Is9/V5f4nktAdCCiTOLrPKWrk6TGwtsxm2BAXogekQiWltmJabIy4S6/GObDUDqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOQmiKgn; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOQmiKgn"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d812103686so23943405ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 04:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747913206; x=1748518006; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tO+EPnAPVJiuWHkuvnHJBaP5+AY092bC5r7Cuo5Qndo=;
        b=dOQmiKgnKrANEOVpXrE2sdphOR5Pr4z2gzznFgo/bOjm1a+jkqc9XtTBn2SeC1zEpH
         FsIDb2qdb+6XaCIuL2txUMR6zm5ohUbHg7xOOtlKWQ8s80McCYhtZFmqn0cNamLUQ33V
         p2IsczO308SNFTkyPlpXlIAW6adMggk+XGup59ifsxm6PwwqGsUShQz1pHWS44y87Av5
         Kk+LRoaX3+8Gtqb7LljfXCIxN0fGpkw0SJuL6ylWL6qcxWjLtUQWFkCsF+iG/B5kaZXB
         NZyNMqOJSTIkPTFCfgBPw+20wwBbq7MJFt6Hexne23s5wG+kmrpF1T+N4SgRca52nPAX
         ykhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747913206; x=1748518006;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tO+EPnAPVJiuWHkuvnHJBaP5+AY092bC5r7Cuo5Qndo=;
        b=W5P/DXnQhujkvAZmIo1Bgv3wz/MIzGtUqYvfrcOx1X0ko5o94hlXOQFz1SzP77/uP6
         eYqEHzgNX8S6fei3jXbKCz6onk3iH6qiXFDHlp1h3AvHStwPsV2M6I4Jaz3BSea8uoXH
         tc46Mz1/FlyuWmZrFRWgigavG63ZoBHkjb/mvnuj7io2qRZ15TkcVGhy9O40NCnYzybH
         r/YGEBXl89GG3mLBIuCWLuFO3pGCp5ggRuNTBXt9+IQ/Wj8EMvCPbTW1VZe2XVaaMIwP
         xM4lrPlJFNpmzNgmMbQHKOBX93GiQtG2zDoAUx981ywPy0uSOVvuitWFuA9RCuGJX9YU
         papw==
X-Gm-Message-State: AOJu0YzcY113HWitNS+2hpQoESkyUcdpvHM6JsjB8wNv5Y+ALJ0niqwS
	VRkl1wUIOY2qvC2wZaSgDfU+r675uHNM3aPwHSBW7D3NXgAKclPSoaxqhFmgYUnT2t5E42nYWX0
	tVOI5mLLhYA4w9boaL8I2iy5HzdxzxOikF0Q1YxuOyK5w
X-Gm-Gg: ASbGncuSlv+F2IhcuwvxPeopdjad0Kw4GCqP0sNHn+ad5Soxu07Y/l6hMUL2npF7LA8
	22JUoBFsHTL3waoBQo8LfYKC9HDWGpPI/GNKtloM2aIsI8/kC4kJqS0FLXAhPUKmoL146t9Xnie
	gjQaSTAS5TBMly52O/LkqJuDhngCBitZg=
X-Google-Smtp-Source: AGHT+IHUjWOGnGkUyyRinb3VeBY+Ht9go8JPY37khypaaY+CtAgLdqwadqYGKT4BQMYTeeiFBih496n0TmMn6LnqKRs=
X-Received: by 2002:a05:6e02:440f:10b0:3dc:90fc:2837 with SMTP id
 e9e14a558f8ab-3dc90fc291bmr2426275ab.8.1747913206153; Thu, 22 May 2025
 04:26:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Durmu=C5=9F?= <dozaltay@gmail.com>
Date: Thu, 22 May 2025 14:26:36 +0300
X-Gm-Features: AX0GCFvHVDPamKgduTXrvEy0qI8s6LpgKqStgeQw713C_-u6aSMzUGnsFYFdyX8
Message-ID: <CABH-8xdaDFjWyQ40Nyo59Gm5kD3Qi5hh76o-uam1yC3wNtJNqQ@mail.gmail.com>
Subject: Regression: RX 470 fails to boot with amdgpu.dpm=1 on kernel 6.7+
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm experiencing a critical issue on my system with an AMD RX 470 GPU.
When booting with recent kernel versions (6.7.x or newer), the system
fails to boot properly unless I explicitly disable Dynamic Power
Management (DPM) via the `amdgpu.dpm=3D0` kernel parameter.

When DPM is enabled (`amdgpu.dpm=3D1` or omitted, since it's the
default), the system either freezes during early boot or fails to
initialize the display. However, using the LTS kernel (6.6.x),
everything works as expected with DPM enabled.

This seems to be a regression introduced in kernel 6.7 or later, and
it specifically affects older GCN4 (Polaris) GPUs like the RX 470.
Disabling DPM allows the system to boot, but significantly reduces GPU
performance.

Things I=E2=80=99ve tried:
- Confirmed that the latest `linux-firmware` is installed.
- Verified correct firmware files exist under `/lib/firmware/amdgpu/`.
- Tested multiple kernels (mainline and LTS).
- Using Mesa with ACO (Radeon open driver stack).
- System boots fine with LTS kernel (6.6.x) + DPM enabled.

System info:
- GPU: AMD RX 470 (GCN 4 / Polaris)
- Distro: Arch Linux
- Kernel (working): linux-lts 6.6.x
- Kernel (broken): 6.7.x and newer (currently tested on 6.14.6)

Thanks in advance,
Durmus Ozaltay

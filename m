Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4E4263C73
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 23:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746142126; cv=none; b=qhXpkN7F0yiI0rAUvWzjZ754D4s0SUmQxjujdnysvYrOdIeioJ/JhCWpvDXF+PbfQP9XmOUa4ifYuUidnqzcaFW3J++fjWk/fbRMGplMNhjw3o5pQpUQKDaJz04/cXbxHCbpU9TOh6Q4zbUyWmW6ZLGHs5Ncp/U5jmQdULEhAtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746142126; c=relaxed/simple;
	bh=TVZv1wE6IMiopn+lPutQ2XmVSkz9PSPheYWfp32DhNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PaMfvTg4904FWRwvQkn6Db1xkPa6XZpjYMRblJpjiHdZtDuJhGe2+A4VKHv4xQfpuOCFTPFId4395s1K+7wQiQxWa/VHfuXESV2SaofSfywMZEx3v/1kChcAiytHNc7HlxXc850nX9B1jAzuXbXeB+hf9fZ+1b3EO/TxjeNOJFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QSnE0H0O; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QSnE0H0O"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so2443668a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 16:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746142122; x=1746746922; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xLQxE0ZAajilS9LJlCgVNxjKesNL8CM31Y1I/hwFDe0=;
        b=QSnE0H0OwC2DbChwFEn4cyMQfVCp/NiKXnjRN1st7ayUdIevTmtF5xG3zXZp5183NE
         U4UT1A8U0vCrGIu8kHVL/mPofZIPXp8Xdhc9wcJXIZHTJDR/Iba0m1wWpVBhFDtDWuOO
         bxreso+Mu9lxdxZ0EgF7f3v8paD++Ovi8w51s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746142122; x=1746746922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLQxE0ZAajilS9LJlCgVNxjKesNL8CM31Y1I/hwFDe0=;
        b=BSUKO4mCI5hsCXB9O3DnFePUnplmopGTSQzFbP6bNo2sPO8BHqsbwKOTXCzuk93tpc
         n1XFhdaBPuhqkWe+4cjoBOvcmeStgmvJiBjwIGWjQd08xPeMwVsplbJsE52KEeQLyN55
         eZ1JqCo/akQuMd8fKJitj0NuU6F/niBHZQwwvxNq4MdXYxRQJx0l/jn4GoyrMGV3+tDI
         Td4N+ElfCtjMD1ACEvv04E8P1ofSvCrLrzGRH0ahRZmxG0h+g2rRFSOuBPeAQFCXuRk3
         r1vW+I+BUyvKi5NPDvfv7Ckul1jAk1+Cpm/HLWQ5DlaULXs87XnqXIEJvDD+WNztYWv3
         GoiA==
X-Forwarded-Encrypted: i=1; AJvYcCXav7DLdDbLC9OO51P+K17ZsdJ6B1SUSv1NXEBFWXyBtIml+C1Y4GIKyxjSxoGcvTOeSNHkt6eWrm30jr8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAGH5QF8IAaKn/iduKojm9nQvhn/+H4gSdmEP2ZFCBdO8nXA7f
	v1L2PzkwknH/YI9HLmhpNoT+eZiHs4FCzu2eflvODGlpJd9xCBhv+tfv5LkbcdroUt2K6HrMNS2
	Lqyo=
X-Gm-Gg: ASbGncvzMK6pSGBoQdbWoXVAKlDxLeY6roktfJWDWJOJwqAuWZrJxFHo18h06RjZFUr
	NptT+rf0LNgVl8MNlmDPQNoXFpusq8jTsfRZ38xrk/A5/596YN0bFxfbKf2kaqiNt+IVizkNfxJ
	1XoPVVbejAUBR6G3arPKN/kQj9TpNv4vQbO0w45WtjPm+c/OuFAYqPLklsL6ucm+1XWbdCVpVpH
	cbs3XRgSo8rwtuX285iVRL1112SZT4wYG2AhPaqYlq8NM0k7V3UzvAz7Zx4IdieqDIMbOrDdWqI
	vufkepZqmrjyyUCmbPoQEJIEvGPHGl2oEDnhiuxVRT3Q5o50O6PWvMY+NbTxqzWYKf96GesJq41
	8k4dbXfAbR1xak1qV2DL6Lkev4A==
X-Google-Smtp-Source: AGHT+IGFMrQJfbg7Sn7gkBCt9dxz8Qc57hO5NQq3ZVTS4cfqZvZqa2NtbcHt+y13Z5LpEG19Q9Pk3A==
X-Received: by 2002:a17:907:1999:b0:acb:b966:3a8f with SMTP id a640c23a62f3a-ad17af47f9fmr79102466b.39.1746142122500;
        Thu, 01 May 2025 16:28:42 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55af28sm109417966b.125.2025.05.01.16.28.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 16:28:41 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ace94273f0dso309079066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 16:28:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXjI2w5Ba7bwnsgZcx3iKR1ySBxh4veS0/8NdDBWJAujARjvbM+mR1f99+FA3uLJ/xiIQa8n+w0UvLM/1U=@vger.kernel.org
X-Received: by 2002:a17:907:86ab:b0:ac1:df32:ac27 with SMTP id
 a640c23a62f3a-ad17afb8ab0mr88710966b.53.1746142121345; Thu, 01 May 2025
 16:28:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org> <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>
In-Reply-To: <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 1 May 2025 16:28:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>
X-Gm-Features: ATxdqUGTUyHgnV_iTiKt6DDkeUKklvk9V4X7Te2h_qX7brrmy-_kNjuWcrlAGLY
Message-ID: <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>
Subject: Re: [PATCH 2/2] include/linux/typecheck.h: Zero initialize dummy variables
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	stable@vger.kernel.org, Linux Kernel Functional Testing <lkft@linaro.org>, 
	Marcus Seyfarth <m.seyfarth@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 16:00, Nathan Chancellor <nathan@kernel.org> wrote:
>
> +({     type __dummy = {}; \
> +       typeof(x) __dummy2 = {}; \

I'm actually surprised that this doesn't cause warnings in itself.

The types in question are not necessarily compound types, and can be
simple types like 'int'.

The fact that you can write

       int x = {};

without the compiler screaming bloody murder about that insanity blows
my mind, but it does seem to be valid C (*).

How long has that been valid? Because this is certainly new to the
kernel, and sparse does complain about this initializer.

So honestly, this will just cause endless sparse warnings instead. I
think disabling this warning for now is likely the right thing to do.

                Linus

(*) Yes, the empty initializer is new in C23, but we've used that in
the kernel for non-scalar objects for a long time.

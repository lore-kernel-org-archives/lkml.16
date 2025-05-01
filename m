Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAEF126BF1
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 23:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746142696; cv=none; b=rfCA6Y9ZHNmzGE56d6yJ6WxJ9XQgMn4I/esoHE0kmKT5jxUk/ZJMCBLBeGZfO8blQ4JhCA8OU22Ou7hlRT3KdWgsINPSRS8byCi6D+6oClGsWvUhGb4lRniDnb9Uf3d3A/h4mBDEf1/zWn7LHBmjnY33jEVXyB3GZ+TXCY9cT48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746142696; c=relaxed/simple;
	bh=0bE9+sg8qqZlZPymEWPsuaZnLc6tICoEgjFXMIsxwYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPKAFBviZZv4WXSQdIHlaUKgwy+kzBH/qcsvxwDOTpp2jNTihWgh5oscRFmsbz4r/SUyLGQOp1npZVb9J0bBN02I6Rm1Lq3oQXsIeslzeC0SU+M/YDprt1Xl2gZDTLAZJq1iAu4mE1+Pn5Xz9CG0SFrvzSJUd8g36DTepP08yrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WmygRGhI; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WmygRGhI"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac34257295dso233844366b.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 16:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746142692; x=1746747492; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gOH+RLxLUbard4BV8J+6a/3tBBv1bO45LVfQDoB6LRw=;
        b=WmygRGhIIgTYpDdNViXss4G5+8k8T8MUEx1VoVVEci6RElhco2gn8MEK7c1FniCaxB
         g8CEeXAaNGnFO6CaZnqqcCXcDDgCfALUyfs2pafj8/IkBDbIKKJTwkf1R28ggy6FtZTO
         un4BVHHA04tct9M/sDIQANkmwd2ZdUnleUqsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746142692; x=1746747492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOH+RLxLUbard4BV8J+6a/3tBBv1bO45LVfQDoB6LRw=;
        b=FqsoWSdP/Ho0qL7M+mwKTL/AwywT19Qfx5b8xUWmNpg3HIoFmeR6BXZikk816CWtTr
         JGHo0tZIo5h9MaxOnttTQyxi1wMTcj3/99ZSZZJuM99l9yDnI/I8Ial4GO+YLbwCbfoK
         lunxmvNQOUDz2E6bQnrBohu94oluCcqmgq6wtvIWa43M4Ypq98tK2VKFr4RfsZlXOiCC
         6NWVoZ7YH/g9G500Ep4FwfdjeHAob0xsGFYh0exTJDtW2q2QaFI5gLHwD2LJYeYGlZ1E
         XPcURHHK+0hWuAdSEikOXYTSsWtR7tUCUo+GoX1LWZusOq8Si8RLhcNNxRbzHYdSfFZ+
         tdtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDwC1AOc79O+hPpU4JsKqXu0LbGA98zrkBNiN1qE3ChCsuU8HGWXT/hoVnaq/ZnM+q/Ugzi0NppVidZJs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7aGK6Uz9uX3nFZOAH3SOQo33RnOA4GEptAOGVigFy0fwpONsJ
	rIJB3IHfXalSX7e08/x+KDfyuplSf1+WnsYQ/NV3t5ZH5jSuFrBir8zWNjrL66MX1tdtAsHcCLx
	M1W0=
X-Gm-Gg: ASbGncsXVlZ+VSPUFaz8Lvh2yLvqbS66Qch0gFmfPlatuRr9TbAh8C8WrysyR2Wkd4j
	lGmfR8u1Xb7ZTwJG9IulkSZS3nZTbQ79o15ejA/zebRW+Je+EqopkZorsOoXHSBTR0TJsOnMhwC
	kLaM3uGO1U8hn4ShEn3fzJFqxu2HgrtLlhBBKZLcRsW7hHwFXDkdtdfgXae4qSBsUs6vweDz4QO
	Qf2snJ1YP8CrACmKty5WEriE+cMDUaINbYB7f/97ZJZfrfKuEW1+tKMG/lyfz2tTxtXLEtgLHP1
	4pXle4XyAudkNGuZgvLtYWt+mf9Pd4mfTT5VK6RsFxD4L7FeN82+dpIbQobr+XqmpcmHI8oJj/N
	rdntjhD98QxFNRJw=
X-Google-Smtp-Source: AGHT+IEXyn9C1PeLiIoKy4cWDFX9htvTlkMvjQ7rGXFypuSL2DIs3mPvJO4zNJhHlmxrVN2/COvEAw==
X-Received: by 2002:a17:907:724b:b0:ace:d957:d6d8 with SMTP id a640c23a62f3a-ad17adf8ebcmr77391566b.34.1746142691928;
        Thu, 01 May 2025 16:38:11 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0c70ef841sm113618066b.54.2025.05.01.16.38.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 16:38:11 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ace94273f0dso310332366b.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 16:38:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX5o0bkYIGKy/oWkejS9+SiL8iwZL3u7fPY73AyNggh4XNbeOsvwAIf5/vvnhgIKS/lKTTcAC5o03M+o38=@vger.kernel.org
X-Received: by 2002:a17:907:3c92:b0:ace:c225:c723 with SMTP id
 a640c23a62f3a-ad17ad1a245mr90568166b.12.1746142690891; Thu, 01 May 2025
 16:38:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org>
 <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org> <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>
In-Reply-To: <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 1 May 2025 16:37:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wikfj_JLqDQCc+AsymUije3Sm8h30zQeT4yieqRicFOzg@mail.gmail.com>
X-Gm-Features: ATxdqUFyafpfCSgNRMdjOdlgLHXvb-kQiDBd8FWFkiq24cJvTKf1aNAAYT-juyY
Message-ID: <CAHk-=wikfj_JLqDQCc+AsymUije3Sm8h30zQeT4yieqRicFOzg@mail.gmail.com>
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

On Thu, 1 May 2025 at 16:28, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> How long has that been valid? Because this is certainly new to the
> kernel, and sparse does complain about this initializer.

Sparse is clearly wrong.

I went back to my old K&R book, and the "perhaps in braces" languager
is there in that original (ok, so I only have the "newer" ANSI version
of K&R, so I'm not checking the _original_ original).

I guess we might as well ignore the sparse problem, since sparse ends
up having issues with so many other newer things we're doing, and we
don't have anybody maintaining it.

             Linus

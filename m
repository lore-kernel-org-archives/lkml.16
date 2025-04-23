Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6461714B4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745424377; cv=none; b=K7z9g/9MK1GfxXhE+/7o7ZhEtwXEBiPKFbbIX+Q4Xz4PY7ptigz4Ni5J5Vuzd5p4Qrgk/IzyzkolGJBum2IG0XNT3jexH4UStyk/y1UmC84zceIievp9S2QA05Ya1AtY9pll1bcAJ3rbY3cgo902f5akHkbaPQQto0+6Jpy4/bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745424377; c=relaxed/simple;
	bh=Ku1VnFSWVmaQKJEQ8lQ7qo6OlGlleZfoLg7TqDTFvgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XhgUVQSsN4mo6KcRCytWPxmaxDvX8xhGV9b6OmP9WtMMXOaXa/miXzoU/s++aRRzh4E0LCzo6QDsq5frcLO+4VElrSVJGyV/PhY+q+PBT3gS2KS8QnTZ21p4rvAq6t44DyiO6atY0uUrG742WgPttYf/5epVE/6EAFiARRaHaAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JlanqpAs; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JlanqpAs"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so1090465a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745424373; x=1746029173; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KkMwk2QzsY2UW0FVql4KzfJFboN3qS6zToCyVdVRetk=;
        b=JlanqpAsslTDseuS19hXVlYKwEilqXlNj5WNAafexG4koIIP64S7JcCxkdvbbWGddR
         LR11G7en3ggtQxFJJ18kDSrLoBJXa6LBYBC/6b4QUBKUTTGHXFm5SF3B2d0VNYDJ47X0
         te8buV6lsXxp9qvXGeLcK1KkqZimvnfHApaF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745424373; x=1746029173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkMwk2QzsY2UW0FVql4KzfJFboN3qS6zToCyVdVRetk=;
        b=aBms+oRPrCVkmR9NimwlzVM1doDpcjnDNlP+I6llvGwBcf+usheseQ8+OK/d6d7I/V
         2gXxKSZA7bdwg711p5+jOWMOP3yT5VSK3LZkoMTyL1/VR2BgSJ/S7DTw9npNgyxgHELg
         E+OnlcK+dGrK274Ha976bTDN73ojgI7ql/90PHEBpv3jky6tDu9bZYUUtou4hUGAzo3+
         bmwuJnCIIvd+Hw44yiVO8okFWOGf0l0FnXquSA0Tc7jZO4xcltzbMEk9wq9jcxTcxRde
         JhtFhp6ZOSaDJmA0aJAe6x8WuHQceZ91LhZ3oXAUv3Czpl4qrm6p7ZsOpM7QsGEJNpiD
         AUOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV67B+eMy+Wq3hkYuDrJOimbAZ1XEQKxWX8RPLn7qrm1xNxAT51mmE46ja5XEFnOZ+kd2dpxMbIswkILwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbfqQqKtHExISXzI49k4uwgVpVJh9OuN3fkupcCFqW8lgigoy4
	RDJSwQbh0aa0b5uWmDbCAvZfu1xg4Z4H/t+eAwhc3+m+igt4asfRiuiB5gKvE5Jt+x3wrQOovhN
	Kn09D9w==
X-Gm-Gg: ASbGncsk90IdVGvBXmZ1aHZowo7G+PWmRKKRYI84ut4LeDSvxOw5X4EFSIireWDu8Xt
	uF6ZuA3GD6brVlhVTFT15RGiISF469V+BR+bn7EXB8n9OBuKUWqMfpxIffjNqhcDnji0m5kZ5qv
	VUaV1ZH9oQSlzQW/yBpZ5GPMIYqyBQYQBFbxJ4XNWGv/LoRTQmEn3Bv7dTpNJZ+IUfFsVI68kSX
	U4/tr01oAXBO2/mrio6eUHFBPqgk2gnmebM4XB5wuUTg9iRazYpoqtgSrbQT9yHLL3+lN/8sEKF
	4izn+3E3/8EXdP/Etm3VxE/TDTFthQ7jNtBP/9+T8vO6tk1rV4CoUmvP0m5N7fNX1EaXzfVGKDE
	EJUQYfwk1NyXpOgk0eTnXXkG/5A==
X-Google-Smtp-Source: AGHT+IHHaI6GePrAwSrBsbEQ7HobI+Y2LS4Zt5AuEm/Jnn7GhyOubKFD5VXXOllYVGjfmbYG8hioyQ==
X-Received: by 2002:a05:6402:2747:b0:5f6:212f:ed3 with SMTP id 4fb4d7f45d1cf-5f62854e72amr18287465a12.15.1745424372765;
        Wed, 23 Apr 2025 09:06:12 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625593409sm7539423a12.37.2025.04.23.09.06.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 09:06:11 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so1122030a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:06:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVILXJahyX2dSvAGOXP1BGABT7eTgXxkiw3gHB3/OcvUCYHmLdg+qt5XMnr89m2k6LHwdxTZAsA1kmJXqY=@vger.kernel.org
X-Received: by 2002:a17:907:2d0b:b0:ac7:d23d:b3ac with SMTP id
 a640c23a62f3a-acb74e19055mr1697973166b.53.1745424371331; Wed, 23 Apr 2025
 09:06:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com>
 <CAPM=9tzj_OBFJNsN9j7nMs4OR3=V9yrPmaH7VvN-KNYUYhf-vQ@mail.gmail.com>
 <CAADnVQ+KnfDLd-=Mg1BDJxCf80K_=RN0dJy_yp681gf1dQMhtg@mail.gmail.com>
 <mhewqdlvb5ahqordw2nuebq7yvsxo7xvdas4vl6gehmbmypcil@v3fn7nzllglj>
 <896a67ec-9f48-4137-9d34-4bb16861e284@phoronix.com> <27d55aab-c2d8-4edf-bab5-91a04b8383c5@suse.cz>
 <CAADnVQ+iFBxauKq99=-Xk+BdG+Lv=Xgvwi1dC4fpG0utmXJiiA@mail.gmail.com>
In-Reply-To: <CAADnVQ+iFBxauKq99=-Xk+BdG+Lv=Xgvwi1dC4fpG0utmXJiiA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Apr 2025 09:05:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi+dTx4VYmo3OEib6tD5jx2WDwU1Dj94iyTB0fjZtUV_g@mail.gmail.com>
X-Gm-Features: ATxdqUHV_Es5Hxm1hg8AUDViUm3SMfcO8gU-VpzuEFz423NYFk81alyYf7tgg7Q
Message-ID: <CAHk-=wi+dTx4VYmo3OEib6tD5jx2WDwU1Dj94iyTB0fjZtUV_g@mail.gmail.com>
Subject: Re: Linux 6.15-rc3
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Michael Larabel <Michael@phoronix.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Dave Airlie <airlied@gmail.com>, 
	Sebastian Sewior <bigeasy@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexei Starovoitov <ast@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Apr 2025 at 08:41, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> Linus,
>
> maybe take the fix directly, since perf regression is severe
> for network heavy workloads.

Done. Thanks everybody,

             Linus

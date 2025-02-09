Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BCD1D47C7
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 18:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739126457; cv=none; b=drA6FRFmmVWIkr5vynKxbmyezrV6k6CdxAOVXuLZn9rdCwcJ1Q2bFEIDHF73mgtRvWy8F+Go5OIBCP9pOemqkafRzgmyJzAni942Cn2+z75pvqE0Ylf0QfFspL+r9aga709SMNAd9oC+3pTaeCuzOokXFoJeCt6wVkqB8lXiX04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739126457; c=relaxed/simple;
	bh=YI94TlVoN4L7wbMAtw/gPyxSKy6RHG6wuVteNjpRsTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5iPXu8s0xyl9f3E83jMjB1U3OjAWt+ZUcF44j4Bkj2P0J8i1kanW0ZlCTefJR/uBXsMmmgQ/l/TzA1gGqB4IvQ1qEhl86MZTQNaEWX6lUdRk2nopUa44cL6jade/ud3SEh6p2IdCUYgFVbUSKMqVcBDMaiMQWN/0Mj5aghoAy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AwJ+fhYg; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AwJ+fhYg"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaeec07b705so592186166b.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 10:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739126453; x=1739731253; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HqEVrPNyJZT2ieX+sAlKjBiYk9DF70TEQ29V5zg8sVc=;
        b=AwJ+fhYg9bhef9lOA7dEuJlNKQGImAGgg3ssViN63+QEoCvrVfdMKDOGZfPL4YjI6h
         lBTfE6VyBdzKRGGzZKVuUaMdyMgwj3z33nbkhYnX14pRhVjK07l8SXzHy+a0aPHvwVNv
         9Nx1EVbbm6wyJ9Uo445wZlMJfe/t0d/s5QFyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739126453; x=1739731253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqEVrPNyJZT2ieX+sAlKjBiYk9DF70TEQ29V5zg8sVc=;
        b=oYlWXCQhgW5sXta5qSvpq75ic+rt1nwK0e2VqOF9L3op5RoTZhsp2GWsha4TwPvx+9
         6d19CqXlx8UP17mZY7iBQiEOYzF83/e5G3i1hOTymSYqQzI63jw0IG/lJFUnFqiVpoLm
         x4hDORr0hlMMwRJwLdo6Fz/rNoVL7/Bt804Rn9JtY+oUzsDwpCidZlc0UeequlwmJ27U
         YCYACtj5ieIODpU/T51QAyQDsmBoRwGksJ4QQ/u6mcEGiuleJHes8G/Rtf1gtbhnzLH9
         0Tma2aU2+IruFaMkU82XPplIR0ud+Uc8acdlolu2dYw5uq1qoXmjbnBOdFPvg9CWbpPn
         0LBg==
X-Forwarded-Encrypted: i=1; AJvYcCVM0Sdn55ij0F8wVCKtfEdnOelgQ6uXzIP94Qf591+KpeluXIDMkX49T4o5v6p5DCJxnd1m/PYQSAWfm4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAVSwk2R7C8EYXCOANFMErfFD76zmjXMgSFDE1NNjDPmSYuQS2
	Rh9rckohDcsPhntuzXv06TwcE+nDTQGwR/yHzF4PLraw+nD2zk0x406zHVRPqoavYtD6JiZYrGN
	mKNE=
X-Gm-Gg: ASbGncuo2K32JP9bhdXNoKV01WUGZdq5OKR3MISnAOahXjLo057aIiqBgJdqkfANtwB
	GDAVZsMi9pnf2GulIsHMI422HvZWViho5iK96ieHVVYA7hdoWmXuhxlmSQdriPwjLBzAnr8jeUn
	N4oKyvdG+yHMsI/chp63BhsZLTTDbv57EyP6C3hPdVnXDGOhdoCjFcuWa/XhHrvvP3GpOuiEqgt
	oij5N3GQ7o7zjzS2R11J9MVlI9VpaNjL4nFXJAibXWGDyfcg+K4IMYX9MBHA2759nei64PlVz8F
	E17sLipeXsMSxBOT6gPItlSUFgPth1kWuoNwrG5RMdt4bEO6bw4RVmu2bgqPH1pllw==
X-Google-Smtp-Source: AGHT+IFBc1OA0m3FngHRAFeOMbm8EQH+Ip+7of1YMvwiW1IdVEYZnTFGuUsGVmTRkivvQz4YQRvTZw==
X-Received: by 2002:a17:907:3da7:b0:ab3:a18f:fe7f with SMTP id a640c23a62f3a-ab789aeacd7mr1135784666b.28.1739126452931;
        Sun, 09 Feb 2025 10:40:52 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f48882sm721482166b.19.2025.02.09.10.40.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 10:40:52 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5de4a8b4f86so3494435a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 10:40:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXi36ru4Y1TUJi88PsoTwqO/pTSj8BKU5xT+KDIHZZPX7UzD8RzOLMzcZbGate+/Jq4MNBgZxKjJRUShQs=@vger.kernel.org
X-Received: by 2002:a05:6402:4608:b0:5dc:7538:3b6 with SMTP id
 4fb4d7f45d1cf-5de44feb687mr10488960a12.1.1739126451772; Sun, 09 Feb 2025
 10:40:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209105600.3388-1-david.laight.linux@gmail.com>
 <20250209105600.3388-2-david.laight.linux@gmail.com> <CAHk-=wgu0B+9ZSmXaL6EyYQyDsWRGZv48jRGKJMphpO4bNiu_A@mail.gmail.com>
 <20250209183437.340dcee6@pumpkin>
In-Reply-To: <20250209183437.340dcee6@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 9 Feb 2025 10:40:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgkEDmf7V+F5jP6On3=pEewRYGbZyvs1E3K-3n3HYr4=Q@mail.gmail.com>
X-Gm-Features: AWEUYZn28FvwTKBQ3BrTy9qd-ZBM8Lp8EcjEquYp7tN5JTG7g2lPx7zYWLh20TA
Message-ID: <CAHk-=wgkEDmf7V+F5jP6On3=pEewRYGbZyvs1E3K-3n3HYr4=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] uaccess: Simplify code pattern for masked user copies
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Feb 2025 at 10:34, David Laight <david.laight.linux@gmail.com> wrote:
>
> For real functions they do generate horrid code.

It';s not about the code generation,.

Well, yes, it is that too in other circumstances, but that's not the
deeper issue.

The deeper issue is this:

> > Yes, you can make spaghetti code with goto and labels. But 'return
> > value in arguments' is worse, because it makes the *data flow* harder
> > to see.

This is the issue that is entirely independent of what the code
generation is. This is the issue that affects humans reading the
source.

It's *really* easy to miss the "oh, that changes X" when the only
little tiny sign of it is that "&" character inside the argument list,
and then the *normal* mental model is that arguments are arguments
*to* the function, not returns *from* the function.

(And yes, I admit that is inconsistent: we have lots of cases where we
have structures etc that get filled in or modified by functions, and
are passed by reference all the time. But I think there's a big
difference between a regular "value" like a user pointer, and a
complex data structure).

              Linus

Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067961F2B87
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 22:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739054118; cv=none; b=Ax65CXVnhnbB92Qb+ysUM3MRqZ02WPmWMI65TEVdlx5LiaCdqwSnxgVfncBNRSSiJqQuKCTVbER7W1bC1LDlTEddbgzYkdFSvoykmHanfIutpUXi2i6oqFMMsrJpOYErrFhjEHkLimdnrDRWFVPQjCyZLDhND94wy9ng1iQzZGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739054118; c=relaxed/simple;
	bh=/wmy6yC82GOnuYOyCwKkx324d1uQc1M7iBLRt0YPcSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPDjVfaeVob5MuayiKoP0BJqf1o3aVx74hMqmPctUw3nm0sXyFsH5sAWKUqBBh7xdpwsb6qztqcTLAijCT+ZK3d7HDsOSJpLppaMhLqUfXUt5/7dTUUdxUrRj64jo6GtzEnv5kWz5SZMZzi8WIWYGuGkQG40n0Aosj8WSb4BAoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IFmrHhwg; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IFmrHhwg"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab795eba976so225841566b.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 14:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739054114; x=1739658914; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Aw5rB8a9ogv1Af1lax+6BTqRpmDPZAFLk8yjZ727oUc=;
        b=IFmrHhwgs7cCGRVikbEAb67WxNmKWOzSX0WStZLfOCVNSNHLv722hnmADzISHbUhQq
         UU37oWUZeSsNf74jvhz6OKVx80OtgT07UL1vWGFn6CXhB0AcBKtNkqx2qSR8u08OhWY+
         II9cgAmletJ6ME0xF6ifoWH+4UyotgJ2M7OEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739054114; x=1739658914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aw5rB8a9ogv1Af1lax+6BTqRpmDPZAFLk8yjZ727oUc=;
        b=s+BwoiJrk8XGaekwh2QsBBkmPBVOCMhsH8qtbxBPKjpwdO1UyuU36/ybS1gzO5wFzV
         F7Q/hslvjKmhtauFimS6tVWS3A313ovVQdAh87tIUSvQpdYGAdWpAAHehSrfN2z7tQE7
         +Jo/93FI3VbSSq2zYSbv7Iz5rTxpnsKWkGa7cXBkIpHo8eH6UL2/mFn0Ozrsu3Pf4OeO
         YK0Ak0V6cS0nwbhGPZCDW27PfnT1xOF5MTgIN5/piq/tqGu17hltpJnj6NQAdsRlgO56
         j42qlGtczrxhKAtimwWqCGHCm1kLTEVJdR5Aj7C8TIW1gJ877OVSBGaniAfoVAecOupg
         CR9A==
X-Forwarded-Encrypted: i=1; AJvYcCWwbqDGN1Orj3Vb9dNuno7ZW9nK7EfcQR71QVkw8burslbPHqCo91mNeU/b+A7ym0WsE92EcdIs2T0sZyc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9rkLsyLyn3xOn4nL7t7X6vbWudUGHOTyC7F2/GoZriq8ncj1Z
	VZJBvKDwCjmxZv6uObXc6Q8WUVMgD44ZXpSkzwXHdrL1CdQvENwUqLmK51GMwOy/2mKD0e31vl3
	jalh3iA==
X-Gm-Gg: ASbGnct5b4yBIJeeSo/W98WCEj0kFPUi0UbuwTVcmllO//TbsKwVIgd8x5sX4r+nalJ
	yLcsBfGd4ZhVjhMCuM2p0DBcMx4xzvUuyRXnWCQKZ/oMNmRR0ie2emlimMAH703AIWu0Fv4Snd0
	+ntezlss3Vo8JuTR266kZIcZ1CX2ebN89WSJJimBI80dTd5rVVhTqrkvlct8M7wWQEKgyWuGVdn
	NPsm6ExezKTfJzhbzguyU00vFfnLHc8i9lDf3z3Wc9S7uS2prHXRGdC+mrBTeFryQZlAl0+smxU
	2qM9T4+9H2TgxD5oGN4+5K/NFwn3+d0Nz0Bbm7Mys4LJt8ZShTX9r038qSjb8xWNUw==
X-Google-Smtp-Source: AGHT+IEly3zh0NVCgIgX9Mjo9VNMpHx+Wo32ZF4MJWrREq7iiBc+m7QxmYQIz2XiOsoNLSvA44vFVQ==
X-Received: by 2002:a17:907:3e27:b0:ab6:f88f:bf1f with SMTP id a640c23a62f3a-ab76e9dc0e7mr1383782466b.27.1739054114060;
        Sat, 08 Feb 2025 14:35:14 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab78d5771easm387763766b.83.2025.02.08.14.35.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 14:35:13 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5de6c70832bso444383a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 14:35:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWQDyosDoIkJ4P5M4lECCDJL28m8OhHpfM7tz2NA3G3W6cfKtL1ysdrFkMgUZ0fgc8+3iOiLjNOM1Z/tDs=@vger.kernel.org
X-Received: by 2002:a05:6402:40d2:b0:5de:59fe:f585 with SMTP id
 4fb4d7f45d1cf-5de59fef79cmr3972861a12.6.1739054113055; Sat, 08 Feb 2025
 14:35:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206054504.2950516-1-neilb@suse.de> <20250206054504.2950516-15-neilb@suse.de>
 <20250207210658.GK1977892@ZenIV> <20250208220653.GQ1977892@ZenIV> <CAHk-=whEbj9p33Cn_P4PawBqkav8zQq5+WjtzqYCK0o621p1kw@mail.gmail.com>
In-Reply-To: <CAHk-=whEbj9p33Cn_P4PawBqkav8zQq5+WjtzqYCK0o621p1kw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 Feb 2025 14:34:56 -0800
X-Gmail-Original-Message-ID: <CAHk-=whyBwei9inP2j1CYxH=RVoFya47rd2Z5oYfKNDKAz2Hxg@mail.gmail.com>
X-Gm-Features: AWEUYZlCBj39i2MdyBuSfTYd8OzjnY0fhKAQ--9Qm9JnvM0_fMK2hsmooPtcTg4
Message-ID: <CAHk-=whyBwei9inP2j1CYxH=RVoFya47rd2Z5oYfKNDKAz2Hxg@mail.gmail.com>
Subject: Re: [PATCH 14/19] VFS: Ensure no async updates happening in directory
 being removed.
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: NeilBrown <neilb@suse.de>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jeff Layton <jlayton@kernel.org>, Dave Chinner <david@fromorbit.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Feb 2025 at 14:30, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I've never used clang-format, but I do know it supports those kinds of
> extensions, since I see them in the kernel config file.

Bah. Over-eager editing removed the context of that sentence.

The context was supposed to be that in the kernel, we tend to have
lots of patterns that make traditional indentation checking totally
useless: things like the "list_for_each()" macro that obviously
includes a loop in it and thus has indentation expectations.

           Linus

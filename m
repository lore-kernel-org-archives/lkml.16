Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AFD198842
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865240; cv=none; b=IQERqizTITJNxjCl3KHdZprBz0IAXA3XzmlvCHc7rCKbYWZSiUWrUmKLqnTX/KdNfC8NuAg1Ps8L29sgINQZyyJsgW20p147QKT8RITzVno6Kyjq6i3+RAk3rAhq3Qu1/yKyNlyKPAoOtT4HD+o6wDzFnbSvgDqv+YqF6BUFCxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865240; c=relaxed/simple;
	bh=LA6Op/VaTOhJKe72M7oQe6NRQa7SxDnVNr8EdMbdizM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P5EK5b+EFGWXpgd2FG6RwEWMMyKqU3Bx0wwFjwyTgJItRycYup91sx+PEY2IeKv/20RWV+W/sGyM6ki/NfTyLWEvC9F2QbcVNZrTcmMXG6ipkjjIKRzCTDREMYef6yLIcHxZMjVF35Ct1w3+dqo0eGCaRfKrGWOjD69HgGcBD6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UMjqKrHC; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UMjqKrHC"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54411e3c610so750780e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738865234; x=1739470034; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5VkJ1I/mpTOj70lVolwV2vn4N+hDhU0UEmqKxlKybuw=;
        b=UMjqKrHCUaZlS4KRlqSdFLKumcN8+7a3o+zarDsc65cg/qfr5HeLj03AVqlElc/JAZ
         8Yuj5vSK96HpZ+fOaqBOWwvP8k9aKdoxYb3HiLxvGMvp1Bzl7e0yXX3SSjxxPGGaHzpK
         VSc5grQLpV4cL4fXFdd/Dr0fkwbVMA24skbvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865234; x=1739470034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VkJ1I/mpTOj70lVolwV2vn4N+hDhU0UEmqKxlKybuw=;
        b=lm52R/PWmF9nC01lIv21xuAm28CeFpm2/7rYZPLneDf6IJe8twBCmmJVQmhg8qErMg
         w7HyOFFtmC9sMuwwVhqEYZwmK2dOktJgPD+f4aMtxAJwKAvkc5EzY0yeRTKWKVripx4i
         Ns3iuW5PwQwY/ZRss738TyXh9RIE1u8OJz56XZblyJhJHRaRCEYTiK6ZjKS2Sw+EnewF
         lLS+afRN4zfeP6JmNBoHAmhDokvbeJ1JhNOyyeAYr0SFujx+S+sFa0E6Z2dCQ00xxlvK
         wHsim87Y0sWumYKJY/eXMkgEdgJISCa2JLJfl6s/RJyjCFY/OFdoASMSks1aHBR7fDvE
         43Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUOEYDnCv7bcvujTJC8Zk8CINOEpu522e1RUTwac6Mh6c6NuTKHrs9e0QUnTdllf8V/gEA/TNJfva3oEsY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtc4D94mnnVfqWctd7lHbk36kw+XL5h9seJAB5G/WQPSmwDd4b
	/9fryhGJzTSTGgxbUNuNgIcLRZm+pRv3Ey5vfPF3W08zkirZiekhH2Wvt2EaNV/fJH4iCgWifMZ
	3g1lu7g==
X-Gm-Gg: ASbGncs11bnZhE0lfIIaDIbz1jgjjH1qGKFgOOtfgPBg0d72+aAgsnUz+ONAkVt/rTl
	fNnFMbJkarx7IvblVE/Vxi99vUxskOIfNDszUJUtGQBPVrjPWyJsNFEXFIdV+NGGuptTaDxsqzv
	+PMcdCN+vpaICk97tqD7YlLZCyaa1SYjfL+t046uzgv4vndg+oK2AnsgG73zIKlW3MF0QnL4b9/
	Op4xL0Ym/+vf/llvggJC5IjKpJMP8fQo6pwpXaE8MQZnhzq7A045jfEXRrMyL4WAt7HrLkQCEhp
	szjRfJHC8mTyG0mvtcwn+6EMUVslGPIBA0yg4QU5jsb26vS04k3hHtOpZn1WxdOvHMfP+w==
X-Google-Smtp-Source: AGHT+IG8bt/iHJc31TwZABiryQZNh8vwVityChKEjK0bvn+1eANlZ27WVkauhPOtfI4pnhGnOpbXCQ==
X-Received: by 2002:a05:6512:3d92:b0:540:1a40:ab0d with SMTP id 2adb3069b0e04-54405a2514dmr2701031e87.28.1738865233921;
        Thu, 06 Feb 2025 10:07:13 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6c40sm1893511fa.49.2025.02.06.10.07.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 10:07:13 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-307b8e4fc25so12738321fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:07:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWElPB6lZwrnlsBCqpkvpzOZwF77Zp9nE4csdfdXxQMwOcM+KD/jtjETCKm2jPNLSz1vgRvbm+0Kd9EBxs=@vger.kernel.org
X-Received: by 2002:a17:907:7f0f:b0:ab6:d6c3:f1e4 with SMTP id
 a640c23a62f3a-ab75e2f2393mr881845566b.38.1738864732223; Thu, 06 Feb 2025
 09:58:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z4D5a5NYrAbNxUL6@pollux> <Z4kG5AcVeQKegLnb@pollux>
 <20250128092334.GA28548@lst.de> <293df3d54bad446e8fd527f204c6dc301354e340.camel@mailbox.org>
 <20250130154646.GA2298732@nvidia.com> <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com> <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com> <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local> <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
In-Reply-To: <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 6 Feb 2025 09:58:36 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
X-Gm-Features: AWEUYZkS6oHFUn-g-IGnkz4FJ-irLv59VoaubaKbNOcXpu9gE5INymKIQSe6irw
Message-ID: <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
To: Hector Martin <marcan@marcan.st>
Cc: Dave Airlie <airlied@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Greg KH <gregkh@linuxfoundation.org>, phasta@kernel.org, 
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, daniel.almeida@collabora.com, 
	aliceryhl@google.com, robin.murphy@arm.com, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	airlied@redhat.com, "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>, 
	DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 01:19, Hector Martin <marcan@marcan.st> wrote:
>
> If shaming on social media does not work, then tell me what does,
> because I'm out of ideas.

How about you accept the fact that maybe the problem is you.

You think you know better. But the current process works.

It has problems, but problems are a fact of life.  There is no perfect.

However, I will say that the social media brigading just makes me not
want to have anything at all to do with your approach.

Because if we have issues in the kernel development model, then social
media sure as hell isn't the solution. The same way it sure as hell
wasn't the solution to politics.

Technical patches and discussions matter. Social media brigading - no
than\k you.

                 Linus

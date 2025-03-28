Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29FB13D89D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743128394; cv=none; b=edmwsCJcXsUtiLHIJ8Ktp0H40z/Ep0V6y202UqgYB7Lh/j3TUjDOEwk2kJgtUI+HS0YGz9L+Fp/9I2B7XR6sqS7zPDRbccR1nF26Li7AZ8L+z2kZNulK5hvYsoMbjJrU6cyUpJva8QNjwzujs0AXfEXKbGBtPYN3DshAC9oZeNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743128394; c=relaxed/simple;
	bh=CC5yY3Y0dl2oEtcOaWKcp+6kyjQ+L9YS3Yf1OeYZKQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IeosVrEo2eu1tmbmUVTM0CQ+kwiWrwQ85IW3a1bR6eRONM1+gqquQs42eSerZRP/EyHkfjMRBJdy3sUKWdIRNsQC/6hAQwc/xW8YNHG6CxAtI5S6CH+slAZt5o1bWh5VKdgJrOHatVUZDImvL+oslppDDUk9LExNe7hbKAuheEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=H3O7WmcZ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="H3O7WmcZ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so3202715a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743128391; x=1743733191; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YvvXVtbcDyhtrYpmT5uG5VCGRECSZgvrz4n2msclEFE=;
        b=H3O7WmcZPLpnCQuihDM5u0QUAtHYEeBFvLNv4zr5kqraa0KPRRUWfBtxiJa9qaT8+5
         xdMKOnwZAgxt0NcMfNRDeGjFsUzZf/KaUt/HlizpZV1haaIpC1zA1bOn4PW3fdiuBzV3
         bH7d2iQ7qO+om0sKcY7chPI0btJUv+gl2MG0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743128391; x=1743733191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvvXVtbcDyhtrYpmT5uG5VCGRECSZgvrz4n2msclEFE=;
        b=OERz4/G2YVz3wxAvSfgMMJ/lNxRCuXZDJUflTJhwe1ErC6xwDCpNFnRNaZTiPDQEXx
         KyFm1Z6/BrPkCdaNKB3O8LinvFyRXM2u6bNvW2DctqVenYO2gF4kyrUBEuRmT5UuvMaN
         kSvEOoZJCDabjq3r/siS1btUEKGGusnnH3fUMll9oK3MqMb64eYfRd6Vgm/WXwVWljSv
         iwAQbTYrSqwpsyyEB1Ef7zu3mWooNtC601XDycEuYUV/WeEN3XobsWMgRuq9iAftOm5W
         fACkvblk4tetGsKl69/57H9PI1AV/dJSMgI6fPGMJxtkxSdfAjIf+wXVWXj1Vq2xJ8cp
         h8Jw==
X-Gm-Message-State: AOJu0YxI6NBT/G1UgeyzjNvBknzTnFhErpUeM5Y9c76R/ElhF1ra3wUC
	hx2A+3Mg+W2h7jEX2l7KLbyD3fZf51lCdpSEvoonPQuSv5NFZYmMAf2k/RfrJJvO1Z0bIrBz6gQ
	05lw=
X-Gm-Gg: ASbGncv6i+F04v7ZZ6BHxduodIVgziufPJMmgbPx0QafS3ACYoStLIuUB7XfIS/4V5V
	DYsR4QBRYj+vL8QysUxe01RC7QQwAzWFJiMzbcHtL1J0Ed1INgvmC+oyMkCDSPVfzOzTM0qXCCZ
	3VPBmqulLkJ4dZID92/1Jn4XosLUjGDlXnv+HpvU5rw79xdCXJTLKmdAKJUDW7d7aX30Ly9VIUh
	kiT+fYHHVGFiSxesCP3gbMwlqhBqPvkvnQgNFSJDyv7gOgvKCd//7TXrNeoZjgFZSUkN6sW0wWg
	WoZhNVdn9g22y0F+sSbxBOj0dU+Uejt5LtgSEcxzgtJ6JNmM4BNssLXyrI5HGXL79b/wZ5Z53mb
	NDN0wQdqD2MH7eAB/XBo=
X-Google-Smtp-Source: AGHT+IGbEnhIRas1hrh6hIkJH2GSTHDdsop2afVfHu0o7K9NwxzrzVNg/CBFe69oM/GHWngdNkMDSQ==
X-Received: by 2002:a17:907:3e8d:b0:ac3:cc9b:5b6d with SMTP id a640c23a62f3a-ac6faef9f4cmr483340466b.16.1743128390952;
        Thu, 27 Mar 2025 19:19:50 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196e954csm81719766b.171.2025.03.27.19.19.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 19:19:50 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so3114587a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:19:50 -0700 (PDT)
X-Received: by 2002:a05:6402:5106:b0:5e6:17e6:9510 with SMTP id
 4fb4d7f45d1cf-5ed8e0651bemr6458143a12.6.1743128389795; Thu, 27 Mar 2025
 19:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327171037.032bf7e7@gandalf.local.home> <CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
 <20250327212447.24e05e7e@batman.local.home> <CAHk-=wgW4QfXuR0StSz15jqCs-suuPhfDajKr1bH2qS73cT4dA@mail.gmail.com>
 <20250327220106.37c921ea@batman.local.home> <CAHk-=wiNLcTj2iiE9waSkmpYpu6VQ_q=Zaqi_WmAMiv_MvH4vQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiNLcTj2iiE9waSkmpYpu6VQ_q=Zaqi_WmAMiv_MvH4vQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Mar 2025 19:19:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhT_xPdATLmfmdWCM7gKApvTyino_ffko5z1YumJDAHA@mail.gmail.com>
X-Gm-Features: AQ5f1Jqio8bwcg7C9HLER2JPmvSkfgOSeGjmM2sYsQkAL7mKNzqwG8CJcMn3Bcw
Message-ID: <CAHk-=wjhT_xPdATLmfmdWCM7gKApvTyino_ffko5z1YumJDAHA@mail.gmail.com>
Subject: Re: [GIT PULL] ring-buffer: Updates for v6.15
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Feng Yang <yangfeng@kylinos.cn>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 19:17, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But NO, that is *not* what is used by the code.
>
> You literally use "struct page *" whenever you want to mmap it.
>
> If the *only* thing that was used was the virtual address, this
> wouldn't be a discussion.

Just to clarify: if you don't mmap this into user space, then that's
fine. Then you can keep just the kernel virtual address.

And I already told you that that is one option: just don't mmap.

But as long as you insist on mmaping the buffer into user space, you
follow the rules. And the rules are that you don't play games. You do
this RIGHT, or you don't do it at all.

And you don't lie about things and claim that the only thing that is
used is the kernel virtual address.

Comprende?

                 Linus

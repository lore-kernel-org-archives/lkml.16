Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BDE1D934D
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 18:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739127167; cv=none; b=WU8YX1zUNijt56RWMLMfWh0WLAbI6+WBO8UvxLKO5xddx1uehbE5TGmwy1YNFJav39y6rLL4pgFR4KVbzxcdrG71uHfeeV5QDrdKGIKw/6hBJ/vukfkYuE7fDLX0mNB48KljMjww5CQxXXK16/RfxqTUz1MWiKUq9yblm4iq3vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739127167; c=relaxed/simple;
	bh=IVNyMtoCy/IQWUCzExioy8R2z48SeBgRzIjIWimhBM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JadA+OJTdGtHdjRvIj8ghubR1dNwxDsQFJuwGdG6y1j0LDr0VDW2AHqeHK0O9sHbPLwwwRmt8UGYrTtQEgtxzRJCAKSh/AJ47p0Zv5/rtUMWXEeBnJd4Ymsl5BTuOq0QapNs/GnHD1oNrYb615Vsl6UZvmUDW6bgzMvWqi4kbpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JEE/RZlj; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JEE/RZlj"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5de38c3d2acso5050909a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 10:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739127163; x=1739731963; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LXXwY5h/VlGF5trnXWAZvvy5OPxaCpIv2SR4OnIR3x0=;
        b=JEE/RZljNO7T8jZStHcPGpoY0PZF4yqnK72vcjqqK/dWNhL57RYtZGM75lp9kuZj6e
         o0C/4dcekskiERMT1WeSaAKl6/F5M+cwhd9hkwvBsJoCUYY7PNHGzuS2uY994BbVRI8G
         eHf2ghw6SCmZK8WGVJEzrYPgBbinAW3Q/BeS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739127163; x=1739731963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXXwY5h/VlGF5trnXWAZvvy5OPxaCpIv2SR4OnIR3x0=;
        b=JI0qt01vG0Io+HuRHAU6FF5eZP/zbTHqTfGAyMOO0wyY8+J4pWf4CM39a+V6FCOFhh
         5byDY05dQDyC6+K7r8+FeAssaVSfH7ySRipKImy8VMbOHkQYwLkAWQDMDwQv1PfWix4Z
         AfIvkeCqmL0VikY05A9a2DLxe0YsNmID4nfnWSN3Jd52+RiuIdvzgnsJ+v7kF1ZHZiiG
         YU0QLGMOX98qEZBzvbw9aDpx/v0WQ5g5W1nIcj7uWq35qMkveF/6y5CiBaZCHf6y6oit
         jDRlDWqQy2RP9j0SO6Wg/s3jTnR+iFdV18KmH1koOUfV6ooJBfU2OJNwRUVX/sr7Y/ox
         vGMg==
X-Forwarded-Encrypted: i=1; AJvYcCV/Fx76M4138jKIkDKAkWhws/mW5Szd+la9fvpXSGS5AWnh7bWel0XhTvIx5h1idKFapbaNfqgN0Tv8Z5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzuhNgfO1AM3vL4mulCE9ksKIBfD0AFPZov1Eci3rMX/D8lk8V
	Tx3xRUAQ59poiJRYyYSLlEU4kAGfpy16VlvSGlUVDHCSKsJ+cN5FctxTRZif7B1Y35Dj6tDPU0A
	wSSw=
X-Gm-Gg: ASbGncvPkiyWfClenN9p+6hSbbNT5lLK/el5Q9LoxjcDIyGX9nPG7Mg/fG5cEJfyHas
	a533i8n4Cq20qPV3T7DFBSrk0rngcSDq6jDgz+5CFCvv1/XVDbzA4iCndYuUILgeCzbh88Nk/fO
	mLIqExWGEE0OWwVh34tsD2VnWnr8ExZVAsei2WZOQkePa0EskoDtZVufKJuBSP+7dCgvg4KwmRV
	fOqizm0bYGLzSJ2iSs3+fWMp7KZ/ga+tHFfyvSFOxhvxykBz6T5aHzUXbvm7OhelBVlaEdQXfSE
	e1A0aKILXA7a9gD1ZOiEM6hEBdClCptSFB2+ihjYigP3lwBMKbxKKX0YS4GgK3rBtw==
X-Google-Smtp-Source: AGHT+IGdnG4omqpRHFDk1OvG93PfnddiZUSMg9zsjFQ5XBb8qzhzORlwhEIwQIRiM4Z2MVk1IpEUow==
X-Received: by 2002:a17:906:ef0b:b0:ab7:6c4b:796a with SMTP id a640c23a62f3a-ab789c629f3mr1325248666b.39.1739127163191;
        Sun, 09 Feb 2025 10:52:43 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f83e30sm720778766b.38.2025.02.09.10.52.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 10:52:41 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaec111762bso898107966b.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 10:52:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULinQmxR6ThE7QO9wjcX4Yc1DrjjFQDD0JSDlUekku/NYIBMRPXyvI51ngNi+OPKBkxwcTmOsLs1ZjwsE=@vger.kernel.org
X-Received: by 2002:a17:906:ef0b:b0:ab7:6c4b:796a with SMTP id
 a640c23a62f3a-ab789c629f3mr1325242666b.39.1739127161451; Sun, 09 Feb 2025
 10:52:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209150718.GA17013@redhat.com> <20250209150749.GA16999@redhat.com>
 <CAHk-=wgYC-iAp4dw_wN3DBWUB=NzkjT42Dpr46efpKBuF4Nxkg@mail.gmail.com>
 <20250209180214.GA23386@redhat.com> <CAHk-=whirZek1fZQ_gYGHZU71+UKDMa_MYWB5RzhP_owcjAopw@mail.gmail.com>
 <20250209184427.GA27435@redhat.com>
In-Reply-To: <20250209184427.GA27435@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 9 Feb 2025 10:52:25 -0800
X-Gmail-Original-Message-ID: <CAHk-=wihBAcJLiC9dxj1M8AKHpdvrRneNk3=s-Rt-Hv5ikqo4g@mail.gmail.com>
X-Gm-Features: AWEUYZmWFnx6e3qeVjXXofi55drVemlr8M8BEprchRHM8w3Wt6AqBL3UZAxLIpI
Message-ID: <CAHk-=wihBAcJLiC9dxj1M8AKHpdvrRneNk3=s-Rt-Hv5ikqo4g@mail.gmail.com>
Subject: Re: [PATCH 1/2] pipe: change pipe_write() to never add a zero-sized buffer
To: Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	David Howells <dhowells@redhat.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Mateusz Guzik <mjguzik@gmail.com>, 
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, Oliver Sang <oliver.sang@intel.com>, 
	Swapnil Sapkal <swapnil.sapkal@amd.com>, WangYuli <wangyuli@uniontech.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Feb 2025 at 10:45, Oleg Nesterov <oleg@redhat.com> wrote:
>
> Again, lets look eat_empty_buffer().
>
> The comment says "maybe it's empty" but how/why can this happen ?

WHY DO YOU CARE?

Even if it's just defensive programming, it's just plain good code,
when the rule is "the caller is waiting for data".

And if it means that you don't need to add random WARN_ON_ONCE() statements.

So here's the deal: either you

 (a) convince yourself that the length really can never be true, and
you write a comment about why that is the case.

or

 (b) you DON'T convince yourself that that is true, and you leave
eat_empty_buffer() alone.

and both of those situations are fine.

But adding a random sprinkling of WARN_ON_ONCE() statements is worse
than *either* of those two cases.

See what my argument is? Adding a WARN_ON is just making the code
worse. Don't do it. It's the worst of both worlds: it adds code to
generate, and it adds confusion to readers ("why are we warning?" or
"when can this happen").

In contrast, the "eat_empty_buffer()" case just saying "if it's an
empty buffer, it doesn't satisfy my needs, so I'll just release the
empty buffer and go on".

That's simple and straightforward. Easy to maintain, and more
efficient than your WARN_ONs.

And if you can convince yourself it's not needed, you remove it.
EXACTLY LIKE THE WARN_ON.

So there's simply never any upside to the WARN_ON.

               Linus

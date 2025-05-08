Received: from e240-7.smtp-out.eu-north-1.amazonses.com (e240-7.smtp-out.eu-north-1.amazonses.com [23.251.240.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA051205E3E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 07:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746690965; cv=none; b=UuuhiZ2E1V9jOpLBa76ZcNujyqB8fJCNe5QPVWUiKtstZRTzyl/k+/tEokrNYWnbQ59JK5fdVISGKX8etOzfTk0WumnSjuxkkAB+2Y86THetCZyi/z0cXiX++1OGeUMSTKKqAX442NG2bD+6nB1uvZ2B1uoB8lm+HH9twQcLMbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746690965; c=relaxed/simple;
	bh=qLDSuqLDnn9gUERCxMtLaLOPaPwHsG3xsxRw8hu6dFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5gd9jtvihlP2JmHidZ0gRUKBbaup34QivFPEOp8MIlVLXv2bOlYvpZ1N5x04+YosH5chkxSjwR7bOniQE2zQKKhMEdVHlBj2VaqsfB5xobAIXdDwM1Rkt/0wbwFrED5UMEgBk+uFNUeSRYsuFYkw3v23YSNYGMF8laRx8ofeS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b=AIWXG5oT; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=d4SpLLzi; arc=none smtp.client-ip=23.251.240.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b="AIWXG5oT";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="d4SpLLzi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iuunfi4kzpbzwuqjzrd5q2mr652n55fx; d=goosey.org; t=1746690961;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qLDSuqLDnn9gUERCxMtLaLOPaPwHsG3xsxRw8hu6dFA=;
	b=AIWXG5oTKiKzDzK99kDPlSQh+++1OXty7+xeBzsrISSFpJ2jdXaopcpiwZ4gGym7
	o7fayg5/w5cnpMaGPH/P3INsJlvpYjuH7sK5EoaVtYwvHccTsQkPl98sHIvkBaK7UUy
	iouI4O2IM/RbbnC8L/TSfaycjtlChkt/wtjU2/AJPOKoFHCJo+NYHpWiWvdlRwLs2SX
	478za0hkzdffsnIF0z44nhYIOvoDebKDXltqBo+qdcEZBY+i3WQHZ4LqH4wQKaxbVjo
	15gZSnajplOnkMX7nBrxpV+aYUceliITbJjzDl2Q8uaV8xP3LPDUNtUINXsptJ+aglA
	rNQDehFChA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1746690961;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=qLDSuqLDnn9gUERCxMtLaLOPaPwHsG3xsxRw8hu6dFA=;
	b=d4SpLLziG8v0oEmedqiC8fuLrVvNWTo0Sh5VoAnJYTSAvuYTcv8mmSHSOqEN1ntN
	h+6mKposUz4GvmXcBxjaNUJYyiLxRmZkl/w+9N28UugRcrR/mdJujp8fYWvXzrUknyN
	HChE7rA9jnZaCvTpBbiCxyg+uQ+pwUol0Y9clhx4=
X-Forwarded-Encrypted: i=1; AJvYcCWqGfkuXYBWaqB9sA5Hs6rY/0EFHX2Ge5whSl9kpuU1DKGb0/FUhImlhsW8y0gFz/4+p4LSuMfM3kIrWTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzAt4SR82FqhQB8tpXpaksFpzlcfIwZUpGhmm94v04y1/bGAGg
	tZnCT+USN1KHGNDk21QHYY9elGRhSA0nVH2HNVEj4TXb/IvPPJB/uzHI1B9POn8/lJOEgSO08uV
	DA90zyLyFKWNoX9tfba4d6lHIFsM=
X-Google-Smtp-Source: AGHT+IE0WQ0NmOhk617CPniN3Q5Ev3kxPSUYvNkyL6aiheUQ6qDeRZnMU/o6VRn2ThWI6M/aNObwFC9YOCfv7w993BA=
X-Received: by 2002:a17:903:22ca:b0:21c:fb6:7c3c with SMTP id
 d9443c01a7336-22e5ea78834mr91634215ad.17.1746690958567; Thu, 08 May 2025
 00:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507142552.9446-1-aha310510@gmail.com> <20250507153325.48726051dbbff4f3936a83ff@linux-foundation.org>
 <CAO9qdTEL1xhBOXbSR4KHgmh0vpEeiia5ii9Ae959ahFHLVycRQ@mail.gmail.com>
In-Reply-To: <CAO9qdTEL1xhBOXbSR4KHgmh0vpEeiia5ii9Ae959ahFHLVycRQ@mail.gmail.com>
From: Ozgur Kara <ozgur@goosey.org>
Date: Thu, 8 May 2025 07:56:00 +0000
X-Gmail-Original-Message-ID: <CADvZ6Er478rF=4dy027Ykja_ZBTarFno+yqJvj60vchPCujCig@mail.gmail.com>
X-Gm-Features: ATxdqUGDygGB01JmmID4n9NBdwwuJ-xu2d0184zhFq2fVSzhlR3fGQyrw7etQsU
Message-ID: <01100196aee4ede3-0997795d-f545-4c3d-9d05-5f8a955561ca-000000@eu-north-1.amazonses.com>
Subject: Re: [PATCH v3] mm/vmalloc: fix data race in show_numa_info()
To: Jeongjun Park <aha310510@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, urezki@gmail.com, 
	edumazet@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.05.08-23.251.240.7

Jeongjun Park <aha310510@gmail.com>, 8 May 2025 Per, 07:47 tarihinde =C5=9F=
unu yazd=C4=B1:
>
> Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Wed,  7 May 2025 23:25:52 +0900 Jeongjun Park <aha310510@gmail.com> =
wrote:
> >
> > > The following data-race was found in show_numa_info():
> > >
> > > ...
> > >
> > >
> > > According to this report, there is a read/write data-race because m->=
private
> > > is accessible to multiple CPUs. To fix this, instead of allocating th=
e heap
> > > in proc_vmalloc_init() and passing the heap address to m->private,
> > > show_numa_info() should allocate the heap.
> > >
> > > One thing to note is that show_numa_info() is called in a critical se=
ction
> > > of a spinlock, so it must be allocated on the heap with GFP_ATOMIC fl=
ag.
> >
> > GFP_ATOMIC is unfortunate.  Can vmalloc_info_show() allocate the
> > storage outside the lock and pass that pointer into show_numa_info()?
> > That way will be more efficient also, less allocating and freeing.
> >
> >
>
> That's good idea! Definitely, if you modify vmalloc_info_show() to
> allocate the heap before taking the spinlock and initialize the heap
> to 0 at the beginning of the loop, we don't need to use GFP_ATOMIC,
> and we only need to allocate the heap once, which is much more efficient.
>
> I'll send you v4 patch that reflects this right away.
>

Hello,

I think so but i'm not sure if it will work because i just thought of
it as an idea because we need to check if v is null or not.

Regards,

Ozgur

> Regards,
>
> Jeongjun Park
>
>
>

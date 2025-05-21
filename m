Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8647081C
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 02:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747795615; cv=none; b=AgfnXWJ4X7T5BFdQuvxrmt95wAflNGR1JJow6tNru8vVwdwTcBn8CxY4mqVPZuW20Oq03XWaBGh2Z1DEqByoycrSEYcXh8c7cryoRMRcKA0bhdINWgxri2IPkhdxiBcDYdNe4FLtTyTsWJBmlVB+42zpPXVl6R+iI17m7MDRvqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747795615; c=relaxed/simple;
	bh=s0Yv5qpAybqDPz+g5ZEmMpZGSzKgHGyyNvk9T13DIOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPPIKaNkQ4GH8QLqGQjJVW41ZaAyG7sMfojL0QyQ2jbvCGPElEe57rNMWVdRbB5WR2yMx9DYxZdw4KB4dNf6bmgY86tePuChVczK93c32JXYYYEGJu3J2lISbqCUlDNtVWLWxv/YFMBm+KIeIWXorD0H3I2HH4YIy9EZ/z3QAwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DypL6xK1; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DypL6xK1"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32934448e8bso4934071fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747795611; x=1748400411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nxt6arEcdTzqN2aNV7xZMthDenOsecbhCIniDpCb5w8=;
        b=DypL6xK1BLywsaU4fe8cPvIMG+7dD3qHaq8yz1alNmpjfQMo/zNWIvu/Ni1xhGSy8M
         T6L3HMmI9gcFBpeN8HI8/O8+AX5FG7gl3mEJvACKExL1TFEq+EQ589D/JIjlBdH8KMZn
         rwJH4VhzO7k8H2+NiGqcVw64qEzWfqUfwOaisWypKacxwCHlcVs8G4tcjVizcHgYBw2G
         ucQojIMv9ozfTzKWeQemfPd60/KESoa39kfvOAoUYD7GGTAKsJmS1pa/d42Hm829jHhh
         5QQ7RhYIRFne9dOnEeZoUOeByyb4OjdKPHRdTLwr3JhAWqNLBNQhLwDsFFQ6Dzy0C7GH
         OLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747795611; x=1748400411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nxt6arEcdTzqN2aNV7xZMthDenOsecbhCIniDpCb5w8=;
        b=KHfnEieGQZajADIQa/Q4LFdE6FZ3wfewhK8Oicb7TlQfUKC2p1VmDGev700JSqgkZh
         6f3E70yAp71rhiLZhLHd5AfbT4FuSeXySW1zbQ2HWduDVpzG8S37cR2qHEJm20iSdX1r
         h7DYHH7vjkhO2mgdgRQsRm7KX7rt75HTVNlD6/Ra3paq4xpeh2ykqQ8pYzrLbb1zlsuf
         MxUBiw8GlX21AJcgg8wi1phI6VMsnA2mqkw7i246mE5H0LOZ3H1d08K8TjwLfMfMxNmK
         Z7e1pab3iSwgPGFv92fAn12GPC+5GWyLxnNUMWDs3GhNSycCYEuro2wHKg81vGWM2sEt
         BeqA==
X-Forwarded-Encrypted: i=1; AJvYcCUJo61KviN4pM/v9RlSGZC3bAofBl5UIxyioTB4RbbUpDSB0NxiUBURHdaV6EA5u/kSOVd/w78DpepS6LY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFb7PiraxRT9vcDb0l+g1n1MWlELlBxHQ1J/V3AOnpWUaZcwAR
	78A4DYN2CDNMUkSJA2Ffa+uDggstyIYB7KLI9Re+ElPcabCbJ6ytoLoqF4i0zvOEIUZbsuzL8c3
	wwmEvXA7YnezwP6UeGmaf/08GrF2OMGYUIejDWWM=
X-Gm-Gg: ASbGnctZjFBFLByOK3+2510o/HKM7hrL8sHJn5Baf/tY0v6IykjGUZyfCRidG5ffLDm
	sz+5j0AQf9+mNKCw/M+t8mmFxXuBPzYcYLdTgKMl6p3JtHoOKSVKO/8UWcpIkfTIS4aDEYpwSpt
	NnuZKd5CBVliu1iN0RHqc9IZpjO2t2CI4Ocjk9ZXBgHqzCum5vVlvy+2umN4gfxKr+2FN+7g0=
X-Google-Smtp-Source: AGHT+IHPiBTH/IUONoliZXjExrOKudiG9XvffXjRUKLNtiXlLaXy9m8H+bx6CRbSWTdibiF38hi9o5vXfOGfvKq6xdY=
X-Received: by 2002:a05:651c:54c:b0:30c:201a:149a with SMTP id
 38308e7fff4ca-328077a9f1bmr71629351fa.25.1747795611095; Tue, 20 May 2025
 19:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org>
In-Reply-To: <20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org>
From: John Stultz <jstultz@google.com>
Date: Tue, 20 May 2025 19:46:39 -0700
X-Gm-Features: AX0GCFvaIAnE0yZNsTcLxjSWVR6RvkV3hbcw5IoUnGn4QI2anEO8q4-VMGo9Bvw
Message-ID: <CANDhNCoQ=V5Uk0ThmeHdn20xmUucPb-mjCjX5pbM94EvzGRZMw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: dma-buf: heaps: Add naming guidelines
To: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:00=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> We've discussed a number of times of how some heap names are bad, but
> not really what makes a good heap name.
>
> Let's document what we expect the heap names to look like.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> index 535f49047ce6450796bf4380c989e109355efc05..b24618e360a9a9ba0bd85135d=
8c1760776f1a37f 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -21,5 +21,24 @@ following heaps:
>     usually created either through the kernel commandline through the
>     `cma` parameter, a memory region Device-Tree node with the
>     `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
>     `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
>     might be called ``reserved``, ``linux,cma``, or ``default-pool``.
> +
> +Naming Convention
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A good heap name is a name that:
> +
> +- Is stable, and won't change from one version to the other;
> +
> +- Describes the memory region the heap will allocate from, and will
> +  uniquely identify it in a given platform;
> +
> +- Doesn't use implementation details, such as the allocator;
> +
> +- Can describe intended usage.
> +

Thanks again for sending this out. Sorry I've been spotty in some of
the discussions (I'm really trying to step back from this area).

I might only suggest you provide a bit more "why" to the list of
qualities you highlight here, just to communicate more of the
spirit/philosophy of how these might be judged or reviewed in the
future.

> +For example, assuming a platform with a reserved memory region located
> +at the RAM address 0x42000000, intended to allocate video framebuffers,
> +and backed by the CMA kernel allocator. Good names would be
> +`memory@42000000` or `video@42000000`, but `cma-video` wouldn't.

The point about avoiding the allocator details, just so I better
understand the criteria: Would distinguishing from a contiguous pool
vs non-contiguous in the name be considered ok? As it's a property of
the buffer returned, and one that is critically important for some
devices. Or do you intend that to be opaque, and the usage->heap
mapping logic to provide that itself? (Effectively avoiding folks from
being able to make potentially problematic assumptions from the name?)

Similarly, how would you suggest naming a heap that provides 32bit
allocations?   Similarly for "protected' allocations, which are being
proposed?

thanks
-john

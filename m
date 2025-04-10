Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAB8283CAF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291718; cv=none; b=FyopZVczP21DlChXXf0pSCKjNw1EdnBW4JO0vFXrepkU5iGnuHGQPn2ypRj7FsRdJDr8RgKOcV9MQh4GJf0vYbrp+QbDvzudjYOSNcYcFTTjDDqlxu50/t1LLdT1wBXLkfmPZxANIvVvtyO9OxhwxMKyT/qVOjVmsIYBcQny1ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291718; c=relaxed/simple;
	bh=3KApgwCiz/mn4nM/a6V2TmijRQ0DsEmKj9cP8YeMNtI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YD5TaeOhE89j089GkE5E7EvDTxVPyo6BtAPffyg5MN+yS/KIr/qcpIzqtM3KNP0o6WTxdEl6xCHXeYlJ2V8Zw9wogZsc7uSYkzDV25m5QEGb6UQYi6R18ErUWkb46hc3HlFV1vlBAAS4m4WLgzI830JRXJSTMtRBgL7FxnxwcMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=evnzpUEn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="evnzpUEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744291707;
	bh=3KApgwCiz/mn4nM/a6V2TmijRQ0DsEmKj9cP8YeMNtI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=evnzpUEnDgg6zdvJPLeWcsJfrqP9GYwDt4PAQ5C5iHUYN2XA/PcKnc4bedxQd133K
	 7AqyjlUV+xMKXqlwtoERQVIIg0J8D7xKbzI1PJV4vnLUYMcpH47ufPKFxSnDsG7o3+
	 26AJwzWJWcBzT2RqxHk0dVdRPDVv2bfzpEkkubyduX2FLALAtS5otTiiOHirvwqnzl
	 Qz9GXdeRDuKEvnY5Pzge/KLbDvCiJ1hWyc4Vl0grRToflX/pqcXW4RL3tlA1GyOO3q
	 kKdGPm0gUdpSVXTG2J3F3KUvSJWxfnL6Pl2b9NtKxkmrOhb5sd62G7hWL0CPRSHEyq
	 Y6xxAVoVWPQlw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5681C17E0B2D;
	Thu, 10 Apr 2025 15:28:27 +0200 (CEST)
Date: Thu, 10 Apr 2025 15:28:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] drm/panthor: Add 64-bit and poll register
 accessors
Message-ID: <20250410152822.632b09b8@collabora.com>
In-Reply-To: <d9a4aa99-2f00-4da9-9f7e-26729f7f8fda@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
	<20250320111741.1937892-2-karunika.choo@arm.com>
	<20250321084809.5f217049@collabora.com>
	<d9a4aa99-2f00-4da9-9f7e-26729f7f8fda@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Apr 2025 14:00:54 +0100
Karunika Choo <karunika.choo@arm.com> wrote:

> On 21/03/2025 07:48, Boris Brezillon wrote:
> > On Thu, 20 Mar 2025 11:17:33 +0000
> > Karunika Choo <karunika.choo@arm.com> wrote:
> >  
> >> This patch adds 64-bit register accessors to simplify register access in
> >> Panthor. It also adds 32-bit and 64-bit variants for read_poll_timeout.
> >>
> >> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> >> ---
> >>  drivers/gpu/drm/panthor/panthor_regs.h | 55 ++++++++++++++++++++++++++
> >>  1 file changed, 55 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h  
> b/drivers/gpu/drm/panthor/panthor_regs.h
> >> index 42dc3fedb0d4..7ec4a1d04e20 100644
> >> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> >> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> >> @@ -238,4 +238,59 @@
> >>  #define gpu_read(dev, reg) \
> >>  	readl((dev)->iomem + (reg))
> >>
> >> +#define gpu_read_relaxed(dev, reg) readl_relaxed((dev)->iomem + (reg))
> >> +
> >> +#define gpu_write64(dev, reg, data)                            \
> >> +	do {                                                   \
> >> +		u64 __val = (u64)(data);                       \
> >> +		gpu_write(dev, reg, lower_32_bits(__val));     \
> >> +		gpu_write(dev, reg + 4, upper_32_bits(__val)); \
> >> +	} while (0)  
> >
> > We're not doing funky name concatenation in these macros, so I'd rather
> > have them defined as static inline funcs in panthor_device.h. We
> > probably want to move the gpu_read/write definitions there as well if
> > we do that.  
> 
> I see where you're coming from, and it makes sense. I was thinking it
> might be better to keep it in panthor_regs.h since that's the file we
> include when accessing GPU registers.

Well, yes, but also gpu_write/read() take a panthor_device, which is
defined in panthor_device.h. I guess we can keep those in
panthor_regs.h and include panthor_device.h from panthor_regs.h if
there's no circular inclusion. I'm fine either way.

> That said, we could certainly
> convert them to static inline functions if you prefer.

Yeah, I'd prefer that.

> 
> >> +
> >> +#define gpu_read64(dev, reg) \
> >> +	(gpu_read(dev, reg) | ((u64)gpu_read(dev, reg + 4) << 32))
> >> +
> >> +#define gpu_read64_relaxed(dev, reg)  \
> >> +	(gpu_read_relaxed(dev, reg) | \
> >> +	 ((u64)gpu_read_relaxed(dev, reg + 4) << 32))
> >> +
> >> +#define gpu_read64_sync(dev, reg)                     \
> >> +	({                                            \
> >> +		u32 lo, hi1, hi2;                     \
> >> +		do {                                  \
> >> +			hi1 = gpu_read(dev, reg + 4); \
> >> +			lo = gpu_read(dev, reg);      \
> >> +			hi2 = gpu_read(dev, reg + 4); \
> >> +		} while (hi1 != hi2);                 \
> >> +		lo | ((u64)hi2 << 32);                \
> >> +	})  
> >
> > I would name that one gpu_read64_counter and make it a static inline
> > function. Note that we already have panthor_gpu_read_64bit_counter()
> > which does the same thing, so maybe move it there and rename it along
> > the way.  
> 
> Happy to rename this to gpu_read64_counter in v3, if you're okay with
> us keeping the macros/functions in this file.

Renaming the function is orthogonal to moving its definition to a
different header, no? I'm not sure I see why one depends on the other.

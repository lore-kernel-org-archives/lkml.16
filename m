Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3113192D96
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409877; cv=none; b=ohxfygffVzqXymD6kGXNfXCRvFTqFHwX8NqvpmWc+tbCpCP4j16TtMvg+L0J/sY4joinCNcdIR3hKW+ku5MunUqu267l7x9/7p8UDsxFV6jI85B4wXA2RxO69MtOp7oD5uai7Try1S3InQVKdsAJaG2Aq/RgILBTjvXJl0eGEpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409877; c=relaxed/simple;
	bh=VWjQ2H7Mg0vyopqPuveP+v7f2GD7fiSkOBSLr2u7ZHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PAufOb2RDaxkQKCg9yQFPRFHe9Lrub55o4TI0dtwczFWMmGLdiphzNC2ybQIyNiK6Se5mHuGrBazdPuDaduCmle2yy72VrWWc0qQo/VQO7o40qy/EZIPKQ4HPb2GgO1fR3jSLsjcDEqg2yAqhxkX6JSXyhw8ty57dGpYbW8XViY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pE2RVCZE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pE2RVCZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743409867;
	bh=VWjQ2H7Mg0vyopqPuveP+v7f2GD7fiSkOBSLr2u7ZHQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pE2RVCZE4RnwX43eixACBSUYVBy1GTtFkrPYe10s4OfMjKpnmVylTISQpTkVq603M
	 DXamK5P4Z4XKDInpwM9haVyaEN7z974JImXzh5YmQOsHRzdBkK3on0neC34U2OcmSv
	 XWhKveckwK6gzrqb2x0wjQXaXaFEM7o3HIHtjtjqCN5NwonVNHkLs89BO9FyJClcNX
	 uDvkYAok+H/Iv6W4CL3rOQtGY3KMIc3Iv4jKPSX/jnk8/zt4wGqSOUHhhmrmuIDprp
	 jbnQOAi/kghrkmY1Vp+WV4xfVgHK3iS3Yz2zTQx3FcJAxQZWnVIyykUkrkOe7ELVOD
	 VAX7pzSGt9Acw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B2F617E07F3;
	Mon, 31 Mar 2025 10:31:07 +0200 (CEST)
Date: Mon, 31 Mar 2025 10:31:02 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Andrew
 Morton <akpm@linux-foundation.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob
 Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH v2 0/6] Introduce sparse DRM shmem object
 allocations
Message-ID: <20250331103102.22be5363@collabora.com>
In-Reply-To: <c1809502-e9b7-43f7-9d88-0e615bf1ff94@suse.de>
References: <20250326021433.772196-1-adrian.larumbe@collabora.com>
	<c1809502-e9b7-43f7-9d88-0e615bf1ff94@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, 31 Mar 2025 09:13:59 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
>=20
> Am 26.03.25 um 03:14 schrieb Adri=C3=A1n Larumbe:
> > This patch series is a proposal for implementing sparse page allocations
> > for shmem objects. It was initially motivated by a kind of BO managed by
> > the Panfrost driver, the tiler heap, which grows on demand every time t=
he
> > GPU faults on a virtual address within its drm_mm-managed ranged. =20
>=20
> I've looked at panfrost_gem.h and found that the driver's gem structure=20
> has grown quite a bit. It seems to have outgrown gem-shmem already.=C2=A0=
 I=20
> think you should consider pulling a copy of gem-shmem into the driver=20
> and building a dedicated memory manager on top.

Actually, it's not just something we need for panfrost. I plan to use
the same non-blocking allocation mechanism for panthor's heap
chunks/buffers, and lima could use it for its heap buffers too. The
non-blocking page allocation is also something i915 has been
open-coding here [1], and I believe that some of this logic could
(and should IMHO) live in common code rather than each driver coming
with its own solution, thus increasing the risk of bugs/inconsistencies.
That's even more important if we provide a common gem-shmem shrinker
like Dmitry's has been proposing.

Best Regards,

Boris

[1]https://elixir.bootlin.com/linux/v6.13.7/source/drivers/gpu/drm/i915/gem=
/i915_gem_shmem.c#L89

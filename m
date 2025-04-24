Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23DA253F31
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745497468; cv=none; b=LOhvGIRiZy6sqQ87qpZ+fFhpNcABkMCGjWpoz1HQuxl/HQxomOBn3DrU/xvpz4TuCJSJDQ4Mk9zjKJAHX7CJPH/wgXScxjgCEtBBLasn5AMpBhGn05Js8JLUodU1JjtwAynOnj2XOn6UGXQeBRwyutWobLEC4T8zWwGuVrFNKJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745497468; c=relaxed/simple;
	bh=EPY4acWajNcExtL2mcawm0yfatLm/mqsxg6yAKcSxr4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uaIxk9XWahaBzkSU8DUXXC2yEPCgHvOa7X57jiJ/J1v3gvrZjrAtUqTtsHMMnvm2I3kl/ViwahpZhfz0yRK0oWHJN97ITqpJye+48ea6/ZY5C/pWRO7J7ffnMCNyqJTsYY/Wi0tp9R95TzYw2h4K1el0rsdXa36KmlBvJFj0zwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AwMt9hiz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AwMt9hiz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745497463;
	bh=EPY4acWajNcExtL2mcawm0yfatLm/mqsxg6yAKcSxr4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AwMt9hizlsUfdTJa22FZiJuTZaWs5y7Pq9Ov9K8ft1YhS2qaotOIhTNyTQwysKZlm
	 QRzX9q1Li8BeZeBQbzr9o5QIqlwcBjfMrdVUNQsbBzt5Sh+r1EDFIDl2Au7zbWcADS
	 dXxfGflQ7Dr+Tgk5ccJlW0vJIMa46rWTaQ+GbrIqu3v3nCzCr+W9M7LaWHf9PTj47J
	 D/t1OAKQ1w12LqLGJatGVgQrRCzrcRLbKyrBCgeUbutUY8kLZ4x9CTB9uePE4CrM2t
	 EKhozYI+i823fwXoJdPoir4Ls1fffTm26pgnhV0jihtzIjkji/D920CpJFy60om/nN
	 +T6soN5qS+WTA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4F18317E3610;
	Thu, 24 Apr 2025 14:24:23 +0200 (CEST)
Date: Thu, 24 Apr 2025 14:24:19 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Steven Price"
 <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, "Dmitry
 Osipenko" <dmitry.osipenko@collabora.com>, "Florent Tomasin"
 <florent.tomasin@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: fix building without CONFIG_DEBUG_FS
Message-ID: <20250424142419.47b9d457@collabora.com>
In-Reply-To: <41cd0579-698c-4e1e-82c4-3d46a1cd5e3e@app.fastmail.com>
References: <20250424112637.3432563-1-arnd@kernel.org>
	<20250424134105.087ec2f8@collabora.com>
	<41cd0579-698c-4e1e-82c4-3d46a1cd5e3e@app.fastmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Apr 2025 14:10:16 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Thu, Apr 24, 2025, at 13:41, Boris Brezillon wrote:
> > On Thu, 24 Apr 2025 13:25:47 +0200  
> >> +#ifdef CONFIG_DEBUG_FS
> >>  	bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
> >> -}
> >> -
> >> -#else
> >> -void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {};
> >>  #endif
> >> +}
> >>    
> >
> > Oops. I actually don't see a good reason to expose this function, so
> > could we go for something like that instead?  
> 
> I think moving it into pantor_gem.c makes sense, and it certainly
> avoids the build warning.
> 
> >  #else
> >  static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
> >                                        struct panthor_gem_object *bo)
> >  {}
> >  static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
> > +static void panthor_gem_debugfs_set_usage_flags(struct 
> > panthor_gem_object *bo,
> > +                                               u32 usage_flags)
> > +{  
> 
> Side note: I think the panthor_gem_debugfs_bo_{add,rm} stubs could
> actually be replaced with an IS_ENABLED() check in the normal
> functions, but that wouldn't work for
> panthor_gem_debugfs_set_usage_flags or
> panthor_gem_debugfs_print_bos().

Yeah, I think I prefer consistency over saving a few LoC ;-).
Do you plan to send a v2 with the suggested changes, or should we take
care of that?

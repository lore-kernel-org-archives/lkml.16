Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5655522615
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743072334; cv=none; b=QLf/QrN8rkS4mVvQSYCrXgv9xbIY6ALXB+A7Xa05ix6mxRew2DtFyJZr44OML6CTOvjn+ckdO0H2Zt+XWiSp88WLvPQEP7X0wieVbFH3U331pHPHoJsbERzoPME1COXFUX+6A9NRBVMzu1Y72CyBh4yp0Tg3G7+9v2bmK5Ro5uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743072334; c=relaxed/simple;
	bh=ZG3rMmTx+yMtVLwYOUM1iwCNQ7qk3qeCktu62BjST2I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nyhlt4A1dtc0N6Lclq5Prbz2hMCcuYd6uJLCSqKKkRHAOaWIrJpYPXqrVlzY6nJSIn1X1Ipp1zbeDL/MHa80EJpvF3RjmYrw3oqx07+kBb2NM3pLAwjfyBvse13wEQ/bggh2j60YsPZJ92z6reXG4DHl0ni3CTpbSa70iK4dBhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hdR5Ft+a; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hdR5Ft+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743072324;
	bh=ZG3rMmTx+yMtVLwYOUM1iwCNQ7qk3qeCktu62BjST2I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hdR5Ft+aumm8X7GhdiLTS5sSyuHmjTrfiqLTbzin1jSKZcGY/cxy6bzobPznrGOF0
	 VmEJcUJplukZ8CrIac7j1yZcdjwOWUafV2veshWB4GWyxpJgZZ7eiUQA+95YRV6QsK
	 MoqYlsS8mghRaAJFvCbilPoUTQoeZyDBRk+ec+FCX9ftD+qCulfVPalW3Msi5tZXRo
	 vmeveYanblqGjNZZQGGsdMPKrsWBz6QHHIS/bafKDzlkEW1A6WjC2HyDKD2TGYRk2k
	 Wd9JyalO3uHQbEBIWf800GlyoEw2WLaNchw6ks/SvnPPryRxKLMJ3Fblklv3WXasZ7
	 dtuJy2yE0lOaw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 32DAB17E0A5F;
	Thu, 27 Mar 2025 11:45:24 +0100 (CET)
Date: Thu, 27 Mar 2025 11:45:20 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>, Steven Price
 <steven.price@arm.com>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v20 00/10] Add generic DRM-shmem memory shrinker (part
 1)
Message-ID: <20250327114520.5b470d8e@collabora.com>
In-Reply-To: <1c9daef3-cd64-4f2f-8021-6ab2f17ae572@collabora.com>
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
	<0e0686da-ae96-4a7a-81b2-b9ece1fa4837@suse.de>
	<1c9daef3-cd64-4f2f-8021-6ab2f17ae572@collabora.com>
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

On Wed, 26 Mar 2025 23:08:55 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 3/25/25 17:17, Thomas Zimmermann wrote:
> > I've looked through this before, so
> > 
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.d>
> > 
> > for the series.  
> 
> Applied to misc-next, thanks!

Looks like the accel drivers were left behind. I just sent a patch
series to address that [1].

[1]https://lore.kernel.org/r/dri-devel/20250327104300.1982058-1-boris.brezillon@collabora.com/


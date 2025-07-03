Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89342299ABF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532874; cv=none; b=MHWgJaITG/GIyYPq99Z2WrQUkDqHjxMuUYdMzUe0wEncZAPNHA5uNlQngCOiGVKqc17ymMvHnwgUyAYDsxyyIQYASB25PYr9NKWoBY6u1/yzXPnfMNPfvxveGa64v6ZJlUkhWDDg0K9A+dWDRByscGdsHcC/6t44NNe5dfS+R+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532874; c=relaxed/simple;
	bh=KKCoa8ZEKyAgTGtUdYcs/H499nZ8jzQ5MZpVycHoq9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZqGKkIPmZuYsHAKdAc9ga28iOQyYMMv/k2LeIBizTLNeGuUwgP07mbwUQr/uOG0dyyKMi18y+tKGAJsG60xNjlHT/swBDUzojxgUe8CIU/zHEb6EaAg6STfIhBeCZXzUZGnx9+JYSWZp7ahx/fxyJLsQ2ZbatDU6bMKjIAvFKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRCon1P0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRCon1P0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22672C4CEE3;
	Thu,  3 Jul 2025 08:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751532874;
	bh=KKCoa8ZEKyAgTGtUdYcs/H499nZ8jzQ5MZpVycHoq9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oRCon1P09cbpMGzSi5vN/6yKXcDJES1dbP2AyN9ML4KEblruP/GOKEQJmSkKJ6YOK
	 8FtIN2niRou7npVNXu/yx4U+QX4or212BR4I35776XFmECGisC0buj2T6l0c6Ush5e
	 sBPpOfBskTMEhkRvasza6mRZtO/vWjtcM6Gh+4G4jGHm02FudT0NV0DKJ+dV9XZp8P
	 MvegoHfRJHJ1ccz6DnWNce70OARatl2E4N7w4ZZmr6PUaCwdLbs1w1JT4jUZh3faoY
	 z8LneOSGnJDpkDmX3V60pQ4ldpFK0rOHE3rtnS1vlchmmeCFYldh8P25axPl1XTiZD
	 J6zoHCKrWu9Jw==
Date: Thu, 3 Jul 2025 10:54:27 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Caterina Shablia <caterina.shablia@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>, Lyude Paul <lyude@redhat.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, kernel@collabora.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 3/7] drm/gpuvm: Pass map arguments through a struct
Message-ID: <aGZFQxVqKak1V9xk@pollux>
References: <20250702233621.12990-1-caterina.shablia@collabora.com>
 <20250702233621.12990-4-caterina.shablia@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702233621.12990-4-caterina.shablia@collabora.com>

On Wed, Jul 02, 2025 at 11:36:05PM +0000, Caterina Shablia wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> We are about to pass more arguments to drm_gpuvm_sm_map[_ops_create](),
> so, before we do that, let's pass arguments through a struct instead
> of changing each call site every time a new optional argument is added.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>

Can you please copy me in on all GPUVM patches, not only this one?

I looked at this patch series on lore [1], but for some reason it only shows the
first 4 patches.

Can you please resend?

[1] https://lore.kernel.org/all/20250702233621.12990-5-caterina.shablia@collabora.com/#t

Received: from hs01.dakr.org (hs01.dakr.org [173.249.23.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F512E11B6;
	Fri, 13 Jun 2025 15:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.23.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830101; cv=none; b=LtXo6maYZFcSq5vNe0u41AQG9VlniRjWf7MOuFQGwo8d4pk4RtyGgeswMwrQCmkMQwn0wyxWY891AvxekdRn905KyFilkYxf/2ijTlh8/LBbGJlWawZrwp0i2Z8qmp9usHSuKC58vTkRK1OPt+1rcZVaC25D9722rnHVEVz2SYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830101; c=relaxed/simple;
	bh=dUwgw4FwP1/9bjNmCs34U6/iexRr91COm2QSU7o6sRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lrGSxlMmDd+p4UwkRIxjCguy72QYoVD9h5Kr2B9FebjLcS6i/mf5AikDkhBcGFL5C4kcSTSkXvOKtYnbu4GobVKaVNx1JxlIrA0VZxo08JEfPv1/R+rhuK4dVkr6Uc3wF0n73JIPlyzoItN4p22e5NBHZ+wDF3q8xnKx2z19uKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dakr.org; spf=pass smtp.mailfrom=dakr.org; arc=none smtp.client-ip=173.249.23.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dakr.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dakr.org
Message-ID: <cfc45862-92a1-4dee-9b94-b743e6ff72e5@dakr.org>
Date: Fri, 13 Jun 2025 17:46:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] Documentation: nouveau: Update GSP message queue
 kernel-doc reference
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Nouveau <nouveau@lists.freedesktop.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20250611020805.22418-2-bagasdotme@gmail.com>
From: Danilo Krummrich <kernel@dakr.org>
Content-Language: en-US
In-Reply-To: <20250611020805.22418-2-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/25 4:08 AM, Bagas Sanjaya wrote:
> GSP message queue docs has been moved following RPC handling split in
> 8a8b1ec5261f20 ("drm/nouveau/gsp: split rpc handling out on its own"),
> before GSP-RM implementation is versioned in c472d828348caf
> ("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/").
> However, the kernel-doc reference in nouveau docs is left behind, which
> triggers htmldocs warnings:
> 
> ERROR: Cannot find file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> WARNING: No kernel-doc for file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> 
> Update the reference.
> 
> Fixes: c472d828348c ("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/")
> Fixes: 8a8b1ec5261f ("drm/nouveau/gsp: split rpc handling out on its own")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Applied to drm-misc-fixes, thanks!

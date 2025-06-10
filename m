Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54D227AC44;
	Tue, 10 Jun 2025 07:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540858; cv=none; b=fWJX9TwYoWmBxcRP4UDsUHkzAjJ+gp3oS58K7cu8srnekHCs1sg8D5cG9dbRI2yxlKRjzn4WQOUM4It/2cLCto/caIf3AHG5aRyjMWrhZx9/JzoSRWfRMlPn08GMTziN5I7O3HUUe7T/7wCdn3bX+QgWfRU5wILb7aV+rf2nPFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540858; c=relaxed/simple;
	bh=pcZ6mWf3X8LtEzYCwp8wh+McVlEIHvFtccfqPVGVS1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QiMWMY58abSnUI8wn/SeKj52C0341nLUjst0t0PQXQU9wmGxb+eCKxt25H2sk0OnrELFfQk+uHCufZcoLVlPPNK9/UfytWW5qel1aCkqQXW4LK/VDj1GinNLxLe9WyCwBkMgj0Gyg9dCUYi6xjE3Rp61nN063DVXU2AkIrBrHKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=j0njGC3U; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="j0njGC3U"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VkI4nXK+TS/9EeUuqPQ0SR/T+jH8FR1py6Gdua1yCt4=; b=j0njGC3UPXcWm0z3vckW4pMCjt
	nkvunDF+OMq3AA7GF73Y/5O/P+cNVS6vGBHOuACD6FpVFT9UQK+Td4auN86ig2fIs8fsmw/axWEvu
	0zaZdRaM0cWhvESthyGy3wcmgG9GvNMN+WzlKZSLkBg/GkbMacJICTm/3GUfyqgZwDOuQjpV/Ib7e
	Yp5ENxv04Ut/+uTseM4aPhaNu8MtaT2kxqYNHGeHV9hnVuFMRJHIbGkUHmKbQx2pCuOzNWSffSSff
	OQxSJW4qyB2U5fX9ZZR0asetT4W551WCyTvSNitSt1waxnpuP5hWLbv2H7osuQx5qm3DaVrye/ZSl
	fcJrueYA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtUp-00000001kLw-3mFR;
	Tue, 10 Jun 2025 07:34:12 +0000
Message-ID: <b17709fd-7ca6-40dc-8d9c-7d3a98d9d305@infradead.org>
Date: Tue, 10 Jun 2025 00:34:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: nouveau: Update GSP message queue
 kernel-doc reference
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Nouveau <nouveau@lists.freedesktop.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Dave Airlie <airlied@redhat.com>,
 Timur Tabi <ttabi@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
References: <20250610065258.41467-1-bagasdotme@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250610065258.41467-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/9/25 11:52 PM, Bagas Sanjaya wrote:
> Commit c472d828348caf ("drm/nouveau/gsp: move subdev/engine impls to
> subdev/gsp/rm/r535/") moves GSP-RM message queue implementation in
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c to versioned path in
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c, but forgets to
> update kernel-doc reference in nouveau docs, hence triggers htmldocs
> warnings:
> 
> ERROR: Cannot find file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> WARNING: No kernel-doc for file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> 
> Update the reference.
> 
> Fixes: c472d828348c ("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/gpu/nouveau.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rst
> index b8c801e0068cb0..878fb1ade31e4c 100644
> --- a/Documentation/gpu/nouveau.rst
> +++ b/Documentation/gpu/nouveau.rst
> @@ -25,7 +25,7 @@ providing a consistent API to upper layers of the driver stack.
>  GSP Support
>  ------------------------
>  
> -.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c

Are you sure?  Did that work for you?

I see
/**
 * DOC: GSP message queue element

in drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c but not in the
file that you referenced.  Maybe it just keeps moving around...


This works for me. Please send a v2 if you see the need to.


>     :doc: GSP message queue element
>  
>  .. kernel-doc:: drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

-- 
~Randy


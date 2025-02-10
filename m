Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B47D2586D0
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739206257; cv=none; b=fsF5IjSmR3Fqh6qS4c8uElt5qQ0MLfcSxSdYTzocOeNNerb/o/qag2b5N9RZupCUNMkvUt57R1XyX6xFQpd9Xvov0ZL2MU1tsNyAoz4rl9nH+NHehLs4ijFbePLgllU1PnpCN6Nq3yY/dasAt7Gx0Bgx1ElqAciVRPzkbeeoRFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739206257; c=relaxed/simple;
	bh=D0YAwfECM7hsAaYa3THgFCmryazkCnO7IAFjqVzzPEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJtBk6FurxOPnjDqu2xDzsfPYEBluPFAYeHOMoyEXcr3419YO2wWaefS2Iur9uz5L8Ztp6DZzg9Jn7X8EPnRMxGs45SR9ArO8xQKk7gVjtkX0oUZOlQJs4NI5iEY9gnvqooRHT8zrpxQEz32h9nJp+dmxoPJ7wK/19Dn0MT1dP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=MOjZd7/I; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="MOjZd7/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1739206249;
	bh=D0YAwfECM7hsAaYa3THgFCmryazkCnO7IAFjqVzzPEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOjZd7/IHzjAFnKDqpP9JTGVsz74qR2RQALktwwQcDZPNDvSY3JIYzo3mGOpDS4At
	 5mw7shGLL/rdhieR3Z1fDAJmkq+4tvAptUlP1wqabCmREaUexIKd5+e0/eC4EiNkDz
	 mh7T1ob5CfXlLuD4fSK0Ctaq5dV/jCCq8SgE5vhw=
Date: Mon, 10 Feb 2025 17:50:48 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Qiang Yu <yuq825@gmail.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	lima@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/5] drm: Constify 'struct bin_attribute'
Message-ID: <58d8838c-1b22-4d24-bdce-89cfa1ede1ed@t-8ch.de>
References: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>

Hi,

On 2024-12-16 12:34:46+0100, Thomas Weißschuh wrote:
> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.

Can anybody pick up these patches?
Except for lima they all have Acks.
In my opinion they should go through drm-misc.

Thanks,
Thomas

> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> Thomas Weißschuh (5):
>       drm/sysfs: Constify 'struct bin_attribute'
>       drm/lima: Constify 'struct bin_attribute'
>       drm/i915: Constify 'struct bin_attribute'
>       drm/amdgpu: Constify 'struct bin_attribute'
>       drm/amd/display: Constify 'struct bin_attribute'
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c             |  6 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c                | 14 +++++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c                | 13 ++++++-------
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  8 ++++----
>  drivers/gpu/drm/drm_sysfs.c                            | 10 +++++-----
>  drivers/gpu/drm/i915/i915_gpu_error.c                  |  8 ++++----
>  drivers/gpu/drm/i915/i915_sysfs.c                      | 12 ++++++------
>  drivers/gpu/drm/lima/lima_drv.c                        |  8 ++++----
>  8 files changed, 39 insertions(+), 40 deletions(-)
> ---
> base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
> change-id: 20241215-sysfs-const-bin_attr-drm-9bf7700da886
> 
> Best regards,
> -- 
> Thomas Weißschuh <linux@weissschuh.net>
> 

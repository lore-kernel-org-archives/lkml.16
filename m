Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7982121E082
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 20:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747860699; cv=none; b=OLUwvQ2DskPxJTJpRvO38Oz/QlHOxkUHYVDVebryldzdbsoeslAFPYiUiIY+jwgRKPmh76YgurUptcEPfPyDQqzKwgiN9BkvTPAwakm1qWjADsnP1W7xG+vflqaWleToxHPLBWy3/wEBtbxSrMRkzlzFmh6EbsjfX67L3xoUsU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747860699; c=relaxed/simple;
	bh=8uDOe37qq2LydZAJXt4UL4X0VtnTft0SmIuc+RVfywA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F8FUvtg3tZ8z26+q+D4Q6QRMEzYAeluGdYxG4WfqJL6Ms0gtlp9I7NSeJxBYdEGQkBjy319xk+E4Ro5BW53+1fwefOLKMW4hEQrW5kaNrcgUxqyu9TrEDPeGz4MKPvp0goXLkuEMI3Rkoir2eBK+aXmjJNN6TR/GZxXYRQdhu8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=g+0YMcZc; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="g+0YMcZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1747860689; x=1748119889;
	bh=shLth5GYiA0/oF5VkTKOAhq5KcX03Q9lknDocYKhcV8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=g+0YMcZcj4W2qbq5FaD6gIC7oq5ln5Av3cJHL4/iIqMAdMuKtm8TGxe1L+cfYic4u
	 bJp55SRZG9ghzbUfzt5SWcuMV6i8uV15wyfwJWSL7n2lq1MCLEvKhYUKNHxUNoNE8Q
	 SFhUP7w0wKmrbSAy016XUSLxQaO0fA0a6IXRO5a25s2GUAAZfY+5UyC0DBS4TOJUHd
	 KzIJ4Yjvq3W9WxY5bMhAHsn+R2q888L4XhadcppCXKjKU+SokXWGgBdj6kqNQDmSiv
	 suXhM6O7/nvb/+/rlhQXThqLW5EkHB8nh3sw/GBOPgMgLl12NV/Xqw3YQc0sg9+APl
	 cYSI83jb7ZYtg==
Date: Wed, 21 May 2025 20:51:24 +0000
To: Lucas De Marchi <lucas.demarchi@intel.com>
From: Harry Austen <hpausten@protonmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4] drm/xe: Allow building as kernel built-in
Message-ID: <DA24WEEONQS4.2KGRJLM9YNTG3@protonmail.com>
In-Reply-To: <s43s6p2p6frhqg64r42s5owhyiczkfrsgmt5fecosmout73x5m@aq22nie755nt>
References: <20250516104210.17969-1-hpausten@protonmail.com> <32da3736-9ac1-4524-94e6-28a81f23bf31@linux.intel.com> <DA1P8NCLUFU8.N64BOSMN6G9J@protonmail.com> <s43s6p2p6frhqg64r42s5owhyiczkfrsgmt5fecosmout73x5m@aq22nie755nt>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: c36c5d77ccb5adfb61a9d1cfe8fb0d9f2efaadf9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed May 21, 2025 at 4:11 PM BST, Lucas De Marchi wrote:
> On Wed, May 21, 2025 at 08:35:05AM +0000, Harry Austen wrote:
> >On Mon May 19, 2025 at 4:14 PM BST, Maarten Lankhorst wrote:
> >> Hey,
> >>
> >> On 2025-05-16 12:42, Harry Austen wrote:
> >>> Fix Kconfig symbol dependency on KUNIT, which isn't actually required
> >>> for XE to be built-in. However, if KUNIT is enabled, it must be built=
-in
> >>> too.
> >>>
> >>> Also, allow DRM_XE_DISPLAY to be built-in. But only as long as DRM_I9=
15
> >>> isn't, since that results in duplicate symbol errors.
> >>>
> >>> Fixes: 08987a8b6820 ("drm/xe: Fix build with KUNIT=3Dm")
> >>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> >>> Signed-off-by: Harry Austen <hpausten@protonmail.com>
> >>> Acked-by: Jani Nikula <jani.nikula@intel.com>
> >>> ---
> >>> v4: Add Jani Nikula's Acked-by tag
> >>> v3: Simplify KUNIT dependency, as suggested by Jani Nikula
> >>> v2: Ensure DRM_XE_DISPLAY and DRM_I915 can't both be built-in
> >>>
> >>>  drivers/gpu/drm/xe/Kconfig | 5 +++--
> >>>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> >>> index 9bce047901b22..214f40264fa12 100644
> >>> --- a/drivers/gpu/drm/xe/Kconfig
> >>> +++ b/drivers/gpu/drm/xe/Kconfig
> >>> @@ -1,7 +1,8 @@
> >>>  # SPDX-License-Identifier: GPL-2.0-only
> >>>  config DRM_XE
> >>>  =09tristate "Intel Xe Graphics"
> >>> -=09depends on DRM && PCI && MMU && (m || (y && KUNIT=3Dy))
> >>> +=09depends on DRM && PCI && MMU
> >>> +=09depends on KUNIT || KUNIT=3Dn
> >>>  =09select INTERVAL_TREE
> >>>  =09# we need shmfs for the swappable backing store, and in particula=
r
> >>>  =09# the shmem_readpage() which depends upon tmpfs
> >>> @@ -51,7 +52,7 @@ config DRM_XE
> >>>
> >>>  config DRM_XE_DISPLAY
> >>>  =09bool "Enable display support"
> >>> -=09depends on DRM_XE && DRM_XE=3Dm && HAS_IOPORT
> >>> +=09depends on DRM_XE && (DRM_XE=3Dm || DRM_I915!=3Dy) && HAS_IOPORT
> >>>  =09select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
> >>>  =09select I2C
> >>>  =09select I2C_ALGOBIT
> >> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >
> >Thanks!
> >
> >>
> >> Can we also get rid of the IOSF_MBI select? Not even xe_display depend=
s on it, leftover from initial porting. :)
> >
> >As this seems unrelated, I'd be happy to submit a separate patch for thi=
s
> >afterwards. Thanks for the suggestion.
>
> same comment as in the previous version of this patch. What I don't like
> is that it doesn't prevent you to do a bad selection. Instead if you set
> DRM_XE=3Dy and DRM_I915=3Dy, you lose DRM_XE_DISPLAY. Silently. This is
> equivalent of chosing the options via make menuconfig:
>
> =09# initial state
> =09./scripts/config --state CONFIG_DRM_XE --state CONFIG_DRM_XE_DISPLAY -=
-state CONFIG_DRM_I915
> =09m
> =09y
> =09m
>
> =09# set CONFIG_DRM_XE to built-in
> =09./scripts/config -e CONFIG_DRM_XE && make -s olddefconfig
> =09./scripts/config --state CONFIG_DRM_XE --state CONFIG_DRM_XE_DISPLAY -=
-state CONFIG_DRM_I915
> =09y
> =09y
> =09m
>
> =09# set CONFIG_DRM_I915 to built-in, we lose display with xe
> =09$ ~/p/linux-dim/drm-xe-next/scripts/config --state CONFIG_DRM_XE --sta=
te CONFIG_DRM_XE_DISPLAY --state CONFIG_DRM_I915
> =09y
> =09undef
> =09y
>
> I'm not sure how to prevent setting CONFIG_DRM_I915=3Dy if
> CONFIG_DRM_XE_DISPLAY is selected.

Ah interesting, thanks for the example. I'll try a few different things and=
 see
if I can get more sensible behaviour.

>
> Lucas De Marchi
>
> >
> >Harry
> >



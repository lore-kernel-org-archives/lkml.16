Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ECC1F4CBE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569904; cv=none; b=bxhVgV/mmaDk3mU+M687jdOksy7OnK93JUgCTBiDoX+2gXI8IZ8eA1iTfEw+DbdBAHsppBOZ0jN2QF5AEv7426zbxqU6FNb+BmgwAYQHVLP/+Lqmz2SkFYDWv5dfp2xyPC4Nn5MMMVB5nGizoljbpoaom5O1ohSWbe9bzSwiQho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569904; c=relaxed/simple;
	bh=fx4RI3h+vARp5ICfKFaQqy1bjVrnAPvIAv5I7N33/hM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rc0YJGRXXDiaPPHRf9XEbwgUoTMb25M+If5ZB4XZ28REqzlGOXlJFIyz3+PSK0YFTDNpFKhR6VSB4I7rzGxoXouGimj0eVWrWN2xxXcuPUBzSNmTX6L1TtoAZDnZ/H9OF5oeEAijl3YltH/P7l03Wl1+2XRFGGIh2k9f262sYWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=BZ6IBnwQ; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="BZ6IBnwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1745569894; x=1745829094;
	bh=6a75d/sPBXMfpiYTV2jvtt8ItESsFJTSxpA5+JF4rWw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=BZ6IBnwQ4AJWDjDTQN7gwoi++dWBs9TGO4130pvCu7PAyJIzbrEV3D24Zt9TQz05U
	 yYuSipnmohHTtYecJ8aGDCOwtnSUZ85N6ug5YFPBsxkrd1cXjwyaJXX33TnWVWbMRw
	 yQkHDXSkCD7LC/CR2AkCslxvFTJYpxYG29XjpsnBkKaB9AUy7cZJakZtmX5UJ/HsdV
	 bnDrM3utKpeNYWWLpjUIO7U51oKBeiDwAHhoEqfUV9qyXrcs1VwUwhsocroqWIDSPs
	 3yTnKeBxWbKLvXi70tklZcy5s8mBmzBqBM9nNdd5XMcmBFBQifpSOFT6hVrVHT5LNX
	 PzosMyxziCZ1A==
Date: Fri, 25 Apr 2025 08:31:28 +0000
To: Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org
From: Harry Austen <hpausten@protonmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>, =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Allow building as kernel built-in
Message-ID: <D9FKVQL9LOK4.BSCX5E1QNGN1@protonmail.com>
In-Reply-To: <87y0voy8mn.fsf@intel.com>
References: <20250425073534.101976-1-hpausten@protonmail.com> <87y0voy8mn.fsf@intel.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: ed5b41a7773e5d22ff3d0b33e09b86ec6758089e
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri Apr 25, 2025 at 8:59 AM BST, Jani Nikula wrote:
> On Fri, 25 Apr 2025, Harry Austen <hpausten@protonmail.com> wrote:
>> Fix Kconfig symbol dependency on KUNIT, which isn't actually required
>> for XE to be built-in. However, if KUNIT is enabled, it must be built-in
>> too.
>>
>> Also, allow DRM_XE_DISPLAY to be built-in. But only as long as DRM_I915
>> isn't, since that results in duplicate symbol errors.
>>
>> Fixes: 08987a8b6820 ("drm/xe: Fix build with KUNIT=3Dm")
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Signed-off-by: Harry Austen <hpausten@protonmail.com>
>> ---
>> v2: Ensure DRM_XE_DISPLAY and DRM_I915 can't both be built-in
>>
>>  drivers/gpu/drm/xe/Kconfig | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index 9bce047901b22..bc63c396d7fef 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -1,7 +1,7 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  config DRM_XE
>>  =09tristate "Intel Xe Graphics"
>> -=09depends on DRM && PCI && MMU && (m || (y && KUNIT=3Dy))
>> +=09depends on DRM && PCI && MMU && (m || (y && KUNIT!=3Dm))
>
> I can't make heads or tails about that. I think expressing the kunit
> dependency on a separate line like this is both much more common and
> clear:
>
> =09depends on KUNIT || KUNIT=3Dn

Ah, yes that looks like it should do the trick and does seem clearer. Will =
do in
v3.

>
>>  =09select INTERVAL_TREE
>>  =09# we need shmfs for the swappable backing store, and in particular
>>  =09# the shmem_readpage() which depends upon tmpfs
>> @@ -51,7 +51,7 @@ config DRM_XE
>>
>>  config DRM_XE_DISPLAY
>>  =09bool "Enable display support"
>> -=09depends on DRM_XE && DRM_XE=3Dm && HAS_IOPORT
>> +=09depends on DRM_XE && (DRM_XE=3Dm || DRM_I915!=3Dy) && HAS_IOPORT
>>  =09select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
>>  =09select I2C
>>  =09select I2C_ALGOBIT
>
> --
> Jani Nikula, Intel

Thanks,
Harry


Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0F43C38
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747816529; cv=none; b=SR2xJHZUUo+MtqViJQCPrUejmjgQ4AGM6lzEm+gToOtRNNEcFvdpNAWQOx4tALdqXmIAKyz8NBysQDInWqqHhxG5ZVzABOO+95hVVLjzZh2jLW5fxBwb/gszWtHNkn/1O/OeehJsU1u3Ep1WIThztMkE1pyi+/CN8rAxcJWDYAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747816529; c=relaxed/simple;
	bh=hDTl4DW5WPQgbTvVbnYYk8X5a8444R8eFno46zgDu1k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZuoB90J8/jYJ76FWY6v94dJyZdu/xCaMMB5iTKQ6kQY/YeoUhBUA2wrYAWgFXp78VoscyI/+kEd5ZZXjQT8x4ZmnuA1j6Zv2rTJWx06y1sSQyex/oE1RwFbITUw/YzM1EwpqEtORBgnH9A/bprPFepqHvru1xDtB4bI16X5xV+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=LRZmiVpB; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="LRZmiVpB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1747816511; x=1748075711;
	bh=C6F7qOxhKi0G0Edw4hDexbc+uS7sm+NLDARyGdbgw8I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=LRZmiVpB9pZ4EnhXk+XOqevlu4fPlQl/qgZyAO1Xm+av9piIII1xy8JfSStH/EOXx
	 7PW4ZrnuZtCyoPFzHU+nOwNMQY+thRtcQ0sZCIxjYObUFrS6419neDZRCFo8RxmCeV
	 7ul9aUUFIX30qjxqwysJ1c5G+vsMTqYd0m2yFY+1+XqRaac945+07Wic0vPlnAk0JM
	 u8247XkYv03TFRyYb9ksewutxEulY33LzjK8X/3gw8ii4WLKPK1On7sUuEdKLAq9LF
	 p/bh/sAedfMKGxe/h75PMOnDRtETHoUuarHdqVyiyiR88s9vT8KIIkzA3hOBZspN/s
	 GswKlfrfw/5hw==
Date: Wed, 21 May 2025 08:35:05 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, intel-xe@lists.freedesktop.org
From: Harry Austen <hpausten@protonmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>, =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4] drm/xe: Allow building as kernel built-in
Message-ID: <DA1P8NCLUFU8.N64BOSMN6G9J@protonmail.com>
In-Reply-To: <32da3736-9ac1-4524-94e6-28a81f23bf31@linux.intel.com>
References: <20250516104210.17969-1-hpausten@protonmail.com> <32da3736-9ac1-4524-94e6-28a81f23bf31@linux.intel.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: d802d84413cc02feaff5453a3f3c04ec84f677a9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon May 19, 2025 at 4:14 PM BST, Maarten Lankhorst wrote:
> Hey,
>
> On 2025-05-16 12:42, Harry Austen wrote:
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
>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>> v4: Add Jani Nikula's Acked-by tag
>> v3: Simplify KUNIT dependency, as suggested by Jani Nikula
>> v2: Ensure DRM_XE_DISPLAY and DRM_I915 can't both be built-in
>>
>>  drivers/gpu/drm/xe/Kconfig | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index 9bce047901b22..214f40264fa12 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -1,7 +1,8 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  config DRM_XE
>>  =09tristate "Intel Xe Graphics"
>> -=09depends on DRM && PCI && MMU && (m || (y && KUNIT=3Dy))
>> +=09depends on DRM && PCI && MMU
>> +=09depends on KUNIT || KUNIT=3Dn
>>  =09select INTERVAL_TREE
>>  =09# we need shmfs for the swappable backing store, and in particular
>>  =09# the shmem_readpage() which depends upon tmpfs
>> @@ -51,7 +52,7 @@ config DRM_XE
>>
>>  config DRM_XE_DISPLAY
>>  =09bool "Enable display support"
>> -=09depends on DRM_XE && DRM_XE=3Dm && HAS_IOPORT
>> +=09depends on DRM_XE && (DRM_XE=3Dm || DRM_I915!=3Dy) && HAS_IOPORT
>>  =09select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
>>  =09select I2C
>>  =09select I2C_ALGOBIT
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Thanks!

>
> Can we also get rid of the IOSF_MBI select? Not even xe_display depends o=
n it, leftover from initial porting. :)

As this seems unrelated, I'd be happy to submit a separate patch for this
afterwards. Thanks for the suggestion.

Harry


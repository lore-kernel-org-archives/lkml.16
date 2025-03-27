Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34446211296
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 11:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743074978; cv=none; b=WjR6lblpMXD8wY4PoEXydHeT/+CuY+pbOACQBOQcFoA5rSrEQtKCjSIdarKZHjQeWSm0AaYutzrWBSNl8U0GJc6yYyWGqkyT8KOn4uW6JzHxAqt3cacOe8cJeiN1NnoNyeLTenV4/S0aet4WOLPCF/oHY+Ck8fMVmEoS3vneIIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743074978; c=relaxed/simple;
	bh=9HuarsgoMG/guK6o8AfIcXFqtxc+mN2FeomW5hGlTss=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=T99y0LGndqa6wv7je4vCOq0Lt0v+CkikqEzsUiVtZ3er/2+Wjm2ju63Bto3G5d4VnKjpvd4VW94NqM2xERJlL0ZuCEU32sI2eSc8GFCdJoGxVvcucxyAMg+N8ct1kfB7Kb6P8M2UL68GBkU6fNfk0QmPqpX0PtX34Na+4KvTD6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LvO2iN65; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LvO2iN65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743074977; x=1774610977;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=9HuarsgoMG/guK6o8AfIcXFqtxc+mN2FeomW5hGlTss=;
  b=LvO2iN65OzT0OrCWQnvZaa38p3s8s4TJfC0BGGu13wr3oDV8ULgSi57p
   wZqJ/vuev8R/Ayy6dAYoL/HDhqCMAihAerO7aMUVyySIFvwhaoMhyx3Pm
   kU/TZ8fKtMDxj0J4+fjFyfeA/Zrvnp2RVI1h/gdvGFqsi2BZD8jzsKOKD
   OSgtAjBAsStILG5Gu+XoxvkiGclmLOGEpjF0HvE1+fgbTAwr2yBVsELqt
   OQcEoGKFWCRdV1BRYyCAG9KD7Lam2MXAddc7ooDBoatCKE61OGelOrksD
   eIRk919zAPX+nPkR2IrPz2Lj6O9mx0H952GpA7F2rN6BIF3yWvbm3tWR2
   w==;
X-CSE-ConnectionGUID: m13rLQ18T0KM7ShgRMh7/g==
X-CSE-MsgGUID: Oztrn3d9R02IUcHEjeoOjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44319422"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="44319422"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 04:29:36 -0700
X-CSE-ConnectionGUID: 21ef6H9kTniF2BLnMDS/pw==
X-CSE-MsgGUID: EIzD34+lQHqR1Uu7gyHNOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="130176379"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.17])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 04:29:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu
 <yuq825@gmail.com>, Steven Price <steven.price@arm.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v20 05/10] drm/shmem-helper: Refactor locked/unlocked
 functions
In-Reply-To: <87friy67e1.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
 <20250322212608.40511-6-dmitry.osipenko@collabora.com>
 <87iknu67hd.fsf@intel.com> <87friy67e1.fsf@intel.com>
Date: Thu, 27 Mar 2025 13:29:27 +0200
Message-ID: <87bjtm67ag.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 27 Mar 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 27 Mar 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> On Sun, 23 Mar 2025, Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>>> Add locked and remove unlocked postfixes from drm-shmem function names,
>>> making names consistent with the drm/gem core code.
>>
>> This breaks the build for drivers/accel/ivpu/ivpu_gem.c.
>>
>> Please enable CONFIG_DRM_ACCEL_IVPU=m and fix the fallout.
>
> Ditto for CONFIG_DRM_ACCEL_AMDXDNA=m.

Ah, saw the fixes from Boris [1], sorry for the noise.

[1] https://lore.kernel.org/r/20250327104300.1982058-1-boris.brezillon@collabora.com


-- 
Jani Nikula, Intel

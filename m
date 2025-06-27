Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824E0296145
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751018744; cv=none; b=uQqBnDkgfOESV2opZgBDnVdspVI6Bav027Uo4zYifXOF7GEYGBSUPq7pEr1meJoBes1iiEW9B+v2FRwBlY4FUA6TlXGSneTmyP0pH1D8EjPGFrxCgJQyCmhSqUNQVYHm86TzNBWnXVSStXLSDOVp3ZXAzKkwZ6V637rDnok21gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751018744; c=relaxed/simple;
	bh=U/iUPHZms8/d1NTXseNwYjOJRWmmDMGgAZNq0coOhs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eVaktfH7Irsrb3h3Y1l7Wi9i6kA5AK2NCxDWqxUOFv2CKmQTlLfvV6dWLOTytra6NWLkQHyHIYNZ0PY2oQueW3Q7Ww3IdvdScE2XkPyGGCHOezak9iWmP9oHzVNehqVgFgMtKs45FQ9LdrWAQLSy3FN7MsZJ6Mmuh8hJ5sEPN9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2V/xwBt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2V/xwBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751018743; x=1782554743;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=U/iUPHZms8/d1NTXseNwYjOJRWmmDMGgAZNq0coOhs0=;
  b=b2V/xwBtORQMBzRrxgK4C2r+jrK7oJ3xWSfmUD8SSmS3ibRB88OgU/Bc
   2pQQBc8M5BfxrkJbcaFb1/dOSPd3LymyozE1MlPRw10KPtZs2e9XA/uBU
   aMiA2prCenzCedHZTtIdLZazaX62YZi6mD23HVMGCqmkdt9KQtRmY83Qo
   C/uovmugVeIcostroRy02QC2TWyDVbMZutWuWTrdpyPsSOyq7UQ4aB4Hl
   v+gYemQMbFKBsKfFH4q5VZk2hzCgihRFTtnBsw4mxbyiZYjoEJFALbnHM
   ROhzFVSIGBFLZz1hntV9l2q9bBHWC0oyVOMXR0gTWTdEJWoKrr46D7g+F
   A==;
X-CSE-ConnectionGUID: 8Ckvrrz/QrKRgbsk4z7CKg==
X-CSE-MsgGUID: 2DDvmpjdRAaUTWZDVthkgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64019343"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="64019343"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 03:05:41 -0700
X-CSE-ConnectionGUID: Sg5LPVnvQsax1LVExsuxxg==
X-CSE-MsgGUID: 55Ja624hRB+Qm9dlYTWKyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="157315117"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.17]) ([10.245.245.17])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 03:05:36 -0700
Message-ID: <3c948554-cc0a-4ccd-a010-41260dc7a3b2@linux.intel.com>
Date: Fri, 27 Jun 2025 12:05:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/10] drm/ttm: Add ttm_bo_kmap_try_from_panic()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250618094011.238154-1-jfalempe@redhat.com>
 <20250618094011.238154-6-jfalempe@redhat.com>
 <c44f4194-69e5-41bf-bbc6-2e399be2b627@amd.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <c44f4194-69e5-41bf-bbc6-2e399be2b627@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hey,

On 2025-06-18 15:55, Christian König wrote:
> 
> 
> On 6/18/25 11:31, Jocelyn Falempe wrote:
>> If the ttm bo is backed by pages, then it's possible to safely kmap
>> one page at a time, using kmap_try_from_panic().
>> Unfortunately there is no way to do the same with ioremap, so it
>> only supports the kmap case.
>> This is needed for proper drm_panic support with xe driver.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Preferred through drm-misc-next, but feel free to merge it through every branch you want if it makes thinks easier for you.
> 
Thanks for the ack there. I had to merge this patch through drm-intel-next-queued because of a rework affecting the series.

Kind regards,
~Maarten
> Regards,
> Christian.
> 
>> ---
>>
>> v8:
>>  * Added in v8
>>
>> v9:
>>  * Fix comment in ttm_bo_kmap_try_from_panic(), this can *only* be called
>>    from the panic handler (Christian König)
>>
>>  drivers/gpu/drm/ttm/ttm_bo_util.c | 27 +++++++++++++++++++++++++++
>>  include/drm/ttm/ttm_bo.h          |  1 +
>>  2 files changed, 28 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index 15cab9bda17f..6912e6dfda25 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -377,6 +377,33 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
>>  	return (!map->virtual) ? -ENOMEM : 0;
>>  }
>>  
>> +/**
>> + *
>> + * ttm_bo_kmap_try_from_panic
>> + *
>> + * @bo: The buffer object
>> + * @page: The page to map
>> + *
>> + * Sets up a kernel virtual mapping using kmap_local_page_try_from_panic().
>> + * This should only be called from the panic handler, if you make sure the bo
>> + * is the one being displayed, so is properly allocated, and protected.
>> + *
>> + * Returns the vaddr, that you can use to write to the bo, and that you should
>> + * pass to kunmap_local() when you're done with this page, or NULL if the bo
>> + * is in iomem.
>> + */
>> +void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page)
>> +{
>> +	if (page + 1 > PFN_UP(bo->resource->size))
>> +		return NULL;
>> +
>> +	if (!bo->resource->bus.is_iomem && bo->ttm->pages && bo->ttm->pages[page])
>> +		return kmap_local_page_try_from_panic(bo->ttm->pages[page]);
>> +
>> +	return NULL;
>> +}
>> +EXPORT_SYMBOL(ttm_bo_kmap_try_from_panic);
>> +
>>  /**
>>   * ttm_bo_kmap
>>   *
>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>> index cf027558b6db..8c0ce3fa077f 100644
>> --- a/include/drm/ttm/ttm_bo.h
>> +++ b/include/drm/ttm/ttm_bo.h
>> @@ -429,6 +429,7 @@ int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
>>  int ttm_bo_kmap(struct ttm_buffer_object *bo, unsigned long start_page,
>>  		unsigned long num_pages, struct ttm_bo_kmap_obj *map);
>>  void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
>> +void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page);
>>  int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>>  void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>>  int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
> 


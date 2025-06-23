Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7339238C16
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673431; cv=none; b=XGwU0Dfgvwy02uKTfxBp8+dHG0938wtx+6MBODpUg2p5rKyLr6YdHAE9TXwaTixGRF/rnTeZLlhPxJI5PpAe0kbNxAXT11R7nJ9xHsv5f3afeS677tmm9omoIDIlncXLOFNpzKf0np00xoGHr3nEXzFk6vRj6jI335qw5uRWuaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673431; c=relaxed/simple;
	bh=eDafVBAEoaQvcPikWAU5UQsI3U/4ErbnstbH7OnLoVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=h57/arVkp1ulFOChzTOSwmNU8pBTbmOIRfRD4Q81rUEALaiKNc3lh1K08uqgKixU5y82kkR3aYX/o9yTqomfcTBLoy52rXc38CCo9A7foX3EF2pApmG1hbQd5JAz9xW0XQ+E2pf+tkU7OxrEUqvwF9T+9XJ0nt4VcO9tI9Jx7xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i5PPsRZX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i5PPsRZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750673428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0QTXQBLxcMhOeb0i/VFxTw420XqKRgS33hIZfnQXmI=;
	b=i5PPsRZXprZB1m9Qne9+d/35L2R7+JC/wpcBQa8IoMCCb71V7XHgGGIUuigpYbxvLy20aR
	gR5jZ44POC3yorqRRy3eiQBcPCtONGoJx3sOJA4kW2/53haamnJQ4VJqsQoXk+NKyQ+Diw
	CwN4k7G7RvBia3lRYX7o0AAsQ04i2FU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-V7diFA5_OfieBcuL88OY0A-1; Mon, 23 Jun 2025 06:10:27 -0400
X-MC-Unique: V7diFA5_OfieBcuL88OY0A-1
X-Mimecast-MFC-AGG-ID: V7diFA5_OfieBcuL88OY0A_1750673426
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4530ec2c87cso20910695e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750673426; x=1751278226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0QTXQBLxcMhOeb0i/VFxTw420XqKRgS33hIZfnQXmI=;
        b=bKJv/K3sAbPFpbfD2Jz+HjPvlKF7bU3nyEPHQ8+pbE9g2k9zdW2R9YLeiafC52gdCN
         PU2ew4mPp7a5ehfKr5XchQHDTGBLrUvXHwAMbZsgPbN6nCqruZAZu6uyTAdxJ+ADuN+v
         oEdul47KOeAMt5Y8T/4bCJewIi3czwaBFinsvyiiLsj3MV+afzq3oVVx9620r64qJnbz
         dHMABPAx2L0w1B92Ouxbn1qztLbJxB236y7RixoREMzixQzvO30+ryM58QXi8RbaUiiS
         kuAR7EoE6LDQhlsID6OM57DXCsu9RZAt4khiiTiNT1zmSyg9Rrwks2oOFcJTRphLGaTM
         Yu6g==
X-Forwarded-Encrypted: i=1; AJvYcCUuYiieiTcG8wlImn6vcX6raF2A26bBiJVd+MEBDsbsEQ//4ZCmUVkeaFkCc6S2tNz5HFd7wW+AFsKr/mU=@vger.kernel.org
X-Gm-Message-State: AOJu0YylnfRomzraB4vnwtLNJK/HiUFjW+M3blxatoJL6o98UcIQXDx9
	HAyjlzb86La7Shr/YcPZgqRm6YNos2RPUIfjYix94ec47/gaPOx+io+5LOEV2TXRMFe1VPPEhZo
	qm/qSy4FjMzO8pyB39YU1OQW1qGB3lKZKJfXIQb6ClaNcwBN4PnPczW8H8vME1o1pjg==
X-Gm-Gg: ASbGncsSA7H34yacc/0b4HGFdHlWW32wcSjJy1BIpFUhwvwx4Cb9eLOlh7mlrp8K9rW
	M4fYchTOQJ9ocINHV+HdfEUVTSFJJoUt06e5JyfkuvjBuHnjUHznZVIQEp/ej0wCTQxV4DsQGmC
	peWbDcuKlkkAUxJnxtcu/CuddkUAFLg0a+qST/bVFxp7+jDw7c1qhfmnZsTihocRwo1BDX1hRET
	vNK3iYQVRHr6RkABxVh7HpXVOT+XEndhV8DCw6Qxx3ZgjdMWYgvzUmd8GQG9MF9FQkPoZIFH3Zq
	QXcgIqe7CGPk9smERiAAjg/BawZ06CuuDwmc9TWFWbAiQG2Wx6ri07D7ou1YFQ==
X-Received: by 2002:a05:600c:8594:b0:453:9b3:5b67 with SMTP id 5b1f17b1804b1-453659f8324mr45132995e9.24.1750673425999;
        Mon, 23 Jun 2025 03:10:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHD/EDMvqV0TmgUGzrlFNaHgM4CsvQsUMw4O18DWIgIsMuiop7OwY4JI2S/azLj8QrlBp/XkA==
X-Received: by 2002:a05:600c:8594:b0:453:9b3:5b67 with SMTP id 5b1f17b1804b1-453659f8324mr45132755e9.24.1750673425513;
        Mon, 23 Jun 2025 03:10:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eada7adsm140785055e9.35.2025.06.23.03.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:10:24 -0700 (PDT)
Message-ID: <4d81cf64-7bf1-4a7d-8682-fc817d74c373@redhat.com>
Date: Mon, 23 Jun 2025 12:10:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/10] drm/i915: Add drm_panic support
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250618094011.238154-1-jfalempe@redhat.com>
 <c28aad52-7977-4763-9690-9aed1910c834@linux.intel.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <c28aad52-7977-4763-9690-9aed1910c834@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/06/2025 09:40, Maarten Lankhorst wrote:
> Hey,
> 
> Thanks for the series. I didn't see you on irc so I wanted to ask if you are planning to send a v11 with
> the changes from void * to struct intel_panic_data and adding the VRAM support?

Yes, I'm preparing a v11, and I'm considering to do something like this, 
to allocate the panic data with the struct intel_framebuffer:

struct xe_framebuffer {
	struct intel_framebuffer base;
	struct xe_panic_data panic;
};

struct intel_framebuffer *intel_bo_alloc_framebuffer(void)
{
	struct xe_framebuffer *xe_fb;

	xe_fb = kmalloc(sizeof(struct xe_framebuffer), GFP_KERNEL);
	return &xe_fb->base;
}

(And the same for i915).
That should allow you to add battlemage support.

> 
> 
> Other than that, I think the series looks good and I'll be able to test it on my battlemage.
> 

Thanks

Best regards,

-- 

Jocelyn

> Best regards,
> ~Maarten
> 
> On 2025-06-18 11:31, Jocelyn Falempe wrote:
>> This adds drm_panic support for i915 and xe driver.
>>
>> I've tested it on the 4 intel laptops I have at my disposal.
>>   * Haswell with 128MB of eDRAM.
>>   * Comet Lake  i7-10850H
>>   * Raptor Lake i7-1370P (with DPT, and Y-tiling).
>>   * Lunar Lake Ultra 5 228V (with DPT, and 4-tiling, and using the Xe driver.
>>
>> I tested panic in both fbdev console and gnome desktop.
>> I think it won't work yet on discrete GPU, but that can be added later.
>>
>> Best regards,
>>
>> v2:
>>   * Add the proper abstractions to build also for Xe.
>>   * Fix dim checkpatch issues.
>>
>> v3:
>>   * Add support for Y-tiled framebuffer when DPT is enabled.
>>
>> v4:
>>   * Add support for Xe driver, which shares most of the code.
>>   * Add support for 4-tiled framebuffer found in newest GPU.
>>
>> v5:
>>   * Rebase on top of git@gitlab.freedesktop.org:drm/i915/kernel.git drm-intel-next
>>   * Use struct intel_display instead of drm_i915_private.
>>   * Use iosys_map for intel_bo_panic_map().
>>
>> v6:
>>   * Rebase on top of git@gitlab.freedesktop.org:drm/i915/kernel.git drm-intel-next
>>   * Use struct intel_display instead of drm_i915_private for intel_atomic_plane.c
>>
>> v7:
>>   * Fix mismatch {} in intel_panic_flush() (Jani Nikula)
>>   * Return int for i915_gem_object_panic_map() (Ville Syrjälä)
>>   * Reword commit message about alignment/size when disabling tiling (Ville Syrjälä)
>>
>> v8:
>>   * Use kmap_try_from_panic() instead of vmap, to access the framebuffer.
>>   * Add ttm_bo_kmap_try_from_panic() for the xe driver, that uses ttm.
>>   * Replace intel_bo_panic_map() with a setup() and finish() function,
>>     to allow mapping only one page of teh framebuffer at a time.
>>   * Configure psr to send the full framebuffer update.
>>
>> v9:
>>   * Fix comment in ttm_bo_kmap_try_from_panic(), this can *only* be called
>>     from the panic handler (Christian König)
>>   * Fix missing kfree() for i915_panic_pages in i915_gem_object_panic_finish()
>>     Also change i915_panic_pages allocation to kmalloc, as kvmalloc is not
>>     safe to call from the panic handler.
>>   * Fix dim checkpatch warnings.
>>
>> v10:
>>   * Add a private field to struct drm_scanout_buffer
>>   * Replace static variables with new fields in struct intel_framebuffer
>>     (Maarten Lankhorst)
>>   * Add error handling if i915_gem_object_panic_pages() returns NULL
>>   * Declare struct drm_scanout_buffer instead of including <drm/drm_panic.h>
>>     in intel_bo.h
>>
>> Jocelyn Falempe (10):
>>    drm/panic: Add a private field to struct drm_scanout_buffer
>>    drm/i915/fbdev: Add intel_fbdev_get_map()
>>    drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
>>    drm/i915/display: Add a disable_tiling() for skl planes
>>    drm/ttm: Add ttm_bo_kmap_try_from_panic()
>>    drm/i915: Add intel_bo_panic_setup and intel_bo_panic_finish
>>    drm/i915/display: Add drm_panic support
>>    drm/i915/display: Add drm_panic support for Y-tiling with DPT
>>    drm/i915/display: Add drm_panic support for 4-tiling with DPT
>>    drm/i915/psr: Add intel_psr2_panic_force_full_update
>>
>>   drivers/gpu/drm/i915/display/i9xx_plane.c     |  23 +++
>>   .../gpu/drm/i915/display/intel_atomic_plane.c | 170 +++++++++++++++++-
>>   drivers/gpu/drm/i915/display/intel_bo.c       |  12 ++
>>   drivers/gpu/drm/i915/display/intel_bo.h       |   4 +
>>   .../drm/i915/display/intel_display_types.h    |  11 ++
>>   drivers/gpu/drm/i915/display/intel_fb_pin.c   |   5 +
>>   drivers/gpu/drm/i915/display/intel_fb_pin.h   |   2 +
>>   drivers/gpu/drm/i915/display/intel_fbdev.c    |   5 +
>>   drivers/gpu/drm/i915/display/intel_fbdev.h    |   6 +-
>>   drivers/gpu/drm/i915/display/intel_psr.c      |  20 +++
>>   drivers/gpu/drm/i915/display/intel_psr.h      |   2 +
>>   .../drm/i915/display/skl_universal_plane.c    |  27 +++
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |   5 +
>>   drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 112 ++++++++++++
>>   drivers/gpu/drm/i915/i915_vma.h               |   5 +
>>   drivers/gpu/drm/ttm/ttm_bo_util.c             |  27 +++
>>   drivers/gpu/drm/xe/display/intel_bo.c         |  61 +++++++
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c        |   5 +
>>   include/drm/drm_panic.h                       |   6 +
>>   include/drm/ttm/ttm_bo.h                      |   1 +
>>   20 files changed, 507 insertions(+), 2 deletions(-)
>>
>>
>> base-commit: b2f7e30d2e4a34fcee8111d713bef4f29dc23c77
> 


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9CB1C863F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 22:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743545720; cv=none; b=CStEpuSuCV+XzYkl0eNkjjuTLW75pynMYU1Fx/YhMCEkd8MZ3d7s9+T+SbIWdx/GeZAHKqmMtTfCCqNgJZ/nWOm3wAvYi74Bd5IRg0yfAxrdAFa3LAC8i5Ir1k+dHv3lTrKM/8ihBKQYYmWZiJ7zSy+LpQMXcLNEcwgwu3ZiSz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743545720; c=relaxed/simple;
	bh=qxX1DO7bzqGA9kPD227CDjIib9fKvEZqo983NtoAeBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GziwPVEDlOQfDP9LTpDZbFoHkA4jydhOIMXCjsyJZuw96hlsexxlaw3m0wsREQfUxPTSpXbj9dI/vOnESeWLKoal5vAHb9Z+jlDg6ccP+KU6SuDp5CpTtNOY3nq/nn15qeJgKyfbM4QFC3EUuYEGAgJFygjvunfd5reeN8tyyWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eWfc2dFG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eWfc2dFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743545717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gCnG0w61xeNP3N9rmjlU9KIs4JUt9rduykjEWBDPfjI=;
	b=eWfc2dFGDrkF3LHCkATfZRlbVv+a/kzHUUDPsOGlNO+u35mp5w9dwb2cnGETAHcC7XAlP8
	Au0vWwHVDLpHJT94IymqkwpzgJvkmrGxUYJxV8HtL43ALd+IDVR4u0fa1JRXA51x4La6gJ
	1AvLeNoOq5LXkJA0nrypt2+RM3Je60g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-2ebm5uBxNoKgKgTjudp0DQ-1; Tue, 01 Apr 2025 18:15:16 -0400
X-MC-Unique: 2ebm5uBxNoKgKgTjudp0DQ-1
X-Mimecast-MFC-AGG-ID: 2ebm5uBxNoKgKgTjudp0DQ_1743545715
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39126c3469fso1939084f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 15:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743545715; x=1744150515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gCnG0w61xeNP3N9rmjlU9KIs4JUt9rduykjEWBDPfjI=;
        b=xS3MJoF+tDEytjcJzA0PbHSwQcaZ5o2RkAuofc5lLB2/JzAdqi36SW7rM0/fvnvv1B
         PExhNr5UAUevEjr5PE0kRpxIHcj8Be95Xovws1rb+loUsGfztLj7YCAqsePJ4JvkMUSV
         InNGzvq904bPOl3WqQ8omQQEHuKTkwfGh2XWw5/YMRfNEz26Goc21fcOlIQU1ztHmE9W
         aETUFoay0gqZj1hTNCmDqtHDm3vI0mk1a3fhZfup2z+S6IwQCC43eAwEYjx7kpWCKBRD
         tW0OF1/q+cTwHTZjWmZS9tGcu5FyhYiUzEvs1kOzR4Z/b1+nMhnCrGF6mjJRbpGQb7xA
         SLDA==
X-Forwarded-Encrypted: i=1; AJvYcCUBK2bdA/spHqzGaiqHS7RsI21g/3L0IYI2q99rbU2e6uxdKKi6KZ4lBqdVxzOZ7fYS0dO10gNhVf1lOsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvA2UeX6rL3Qx695/GX5Ugi+4Otvk3GFyba+GiUsjzRPr55Rhu
	ztOHuNhX7P40MOrvkedpuiyAIh93M7RC954mqQD5CugI+OStnONoo8gMrplOmfTxDuIERieXFMj
	U3H6FyIN55AalJzpuZW0SGkAKIgHWieVAGPxIvq1auTCccIHbgpiZeRnyhHD1PQ==
X-Gm-Gg: ASbGncstP/ATLwcoIFGy7WCS50LvAki+OCfYSTqcUkaNxm1wXDO2+znc1ZYNO90Tfn5
	sO3wC+GRN2uR4uSQukAlPN/Nm5YPTPiOoTQE+xhsCEtpLqwTHjJ8AO3Zp8fCFjmr+o1xy08IHrm
	cZHichA3c4BV+SNgM1hOTMb9Cup+BuVMf6WnPPGRSixnYTOhKI6s8ui8zEqWlzzmTeM76aCtFLo
	qcZ/4Li4U7O5IxzA+4E0Ez5oAALSS8sGHIJs2ccJfYPIOUNhvDSaajMh6HJq86bzBIeDJ/9Jb0B
	ujmDsJckhZPEsLZ/sDuM7a73gDRWZBM44j6vSEll+neE71vw5RoRis8=
X-Received: by 2002:a5d:47cb:0:b0:391:300f:749e with SMTP id ffacd0b85a97d-39c23646f8dmr4379870f8f.11.1743545714959;
        Tue, 01 Apr 2025 15:15:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyd9uviVhrGUf1RSdE3DFAW69QVYjkJkLc0cnGUT2yI2qvwX6spAl3h5cUQ5Eklq6k0cX4nA==
X-Received: by 2002:a5d:47cb:0:b0:391:300f:749e with SMTP id ffacd0b85a97d-39c23646f8dmr4379847f8f.11.1743545714502;
        Tue, 01 Apr 2025 15:15:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4346sm15465228f8f.95.2025.04.01.15.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 15:15:13 -0700 (PDT)
Message-ID: <72fa1da6-caaa-41c9-aef1-4e780bde6acf@redhat.com>
Date: Wed, 2 Apr 2025 00:15:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/i915/display/i9xx: Add a disable_tiling() for
 i9xx planes
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250401125818.333033-1-jfalempe@redhat.com>
 <20250401125818.333033-3-jfalempe@redhat.com> <Z-wkmdNgCM2-Ye7m@intel.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <Z-wkmdNgCM2-Ye7m@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/04/2025 19:38, Ville Syrjälä wrote:
> On Tue, Apr 01, 2025 at 02:51:08PM +0200, Jocelyn Falempe wrote:
>> drm_panic draws in linear framebuffer, so it's easier to re-use the
>> current framebuffer, and disable tiling in the panic handler, to show
>> the panic screen.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/i915/display/i9xx_plane.c     | 23 +++++++++++++++++++
>>   .../drm/i915/display/intel_display_types.h    |  2 ++
>>   2 files changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
>> index 5e8344fdfc28..9c93d5ac7129 100644
>> --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
>> +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
>> @@ -908,6 +908,27 @@ static const struct drm_plane_funcs i8xx_plane_funcs = {
>>   	.format_mod_supported = i8xx_plane_format_mod_supported,
>>   };
>>   
>> +static void i9xx_disable_tiling(struct intel_plane *plane)
>> +{
>> +	struct intel_display *display = to_intel_display(plane);
>> +	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
>> +	u32 dspcntr;
>> +	u32 reg;
>> +
>> +	dspcntr = intel_de_read_fw(display, DSPCNTR(display, i9xx_plane));
>> +	dspcntr &= ~DISP_TILED;
>> +	intel_de_write_fw(display, DSPCNTR(display, i9xx_plane), dspcntr);
> 
> This fails to account all the different alignment/etc. restrictions
> between linear vs. tiled. I don't think we want hacks like this.

Thanks for taking a look.
I assumed that linear have always less alignment restrictions than 
tiled. I also assumed that the framebuffer size in linear is smaller 
than tiled (as we keep the same pixel format). So going from tiled to 
linear should be safe, the other way is not.

It's done this way in amdgpu [1], but I agree it might be different on 
Intel hardware

The alternative is to draw with tiling, which is what I have done for 
Y-tile and 4-tile format, so it's also a possibility, but more complex 
to maintain.

[1] 
https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/gpu/drm/amd/display/dc/core/dc_surface.c#L298

Best regards,

-- 

Jocelyn

> 
>> +
>> +	if (DISPLAY_VER(display) >= 4) {
>> +		reg = intel_de_read_fw(display, DSPSURF(display, i9xx_plane));
>> +		intel_de_write_fw(display, DSPSURF(display, i9xx_plane), reg);
>> +
>> +	} else {
>> +		reg = intel_de_read_fw(display, DSPADDR(display, i9xx_plane));
>> +		intel_de_write_fw(display, DSPADDR(display, i9xx_plane), reg);
>> +	}
>> +}
>> +
>>   struct intel_plane *
>>   intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
>>   {
>> @@ -1050,6 +1071,8 @@ intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
>>   		}
>>   	}
>>   
>> +	plane->disable_tiling = i9xx_disable_tiling;
>> +
>>   	modifiers = intel_fb_plane_get_modifiers(display, INTEL_PLANE_CAP_TILING_X);
>>   
>>   	if (DISPLAY_VER(display) >= 5 || display->platform.g4x)
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index 367b53a9eae2..62d0785c9edf 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -1512,6 +1512,8 @@ struct intel_plane {
>>   			   bool async_flip);
>>   	void (*enable_flip_done)(struct intel_plane *plane);
>>   	void (*disable_flip_done)(struct intel_plane *plane);
>> +	/* For drm_panic */
>> +	void (*disable_tiling)(struct intel_plane *plane);
>>   };
>>   
>>   #define to_intel_atomic_state(x) container_of(x, struct intel_atomic_state, base)
>> -- 
>> 2.49.0
> 


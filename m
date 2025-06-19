Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C14624729C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315352; cv=none; b=ruldy3qrqRLQl6zzJBcmyOam5ZLrtot0jSlZOX86lv5ogpkGfTVB7b1UyDYS9PIs0MYYFDqfjjK1AS16IcXGzKQW2++6e/1Xff6AsG5zaLMxuZOWH0el81rBGjasT7QPPNB3G8omwJqiIpczccr/M1ZJjpuoABKjSJE8KlUdTVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315352; c=relaxed/simple;
	bh=e7Ocn6zrexmd6c1PsvepJzsoju7cEdVlt06t113BlmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TzpxXHbUN124guD2H3BMVuzqDo+pgiF093kX1nfJf1G7lh0SjGJu9V/iH2fkgzACzo7cTCWrUjXCodVQE901OF32uxqsBuX7n6bC1SJi1J8HuLOTAiiVwgVDTbBtEQCsPVWdp+7Vmy9nieYwu2WIsEEmbdA4jyer0gYdPQdX7VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Now6d41D; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Now6d41D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750315350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HrAK3Pb88d2mMW8Ubsq+AvQbXCBrspP+wLLZy4buj1s=;
	b=Now6d41Dw0fOUMi3FlXKIRQOriiA7ODuErG5I0d1UWKTUzFGhur6o1aIl1wHpsqMnfyPUK
	goEfWwOviFG7QQ/JWLN7QmTd81nsJuXneGD/uLYfOcgXtTP1d1j5+KrwYvD6DPECaDjoQf
	hByoMqXfLGh2crYUPE3YNpEaU1yYjog=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-FvdUdjYcOkitgMLskd0Gzw-1; Thu, 19 Jun 2025 02:42:28 -0400
X-MC-Unique: FvdUdjYcOkitgMLskd0Gzw-1
X-Mimecast-MFC-AGG-ID: FvdUdjYcOkitgMLskd0Gzw_1750315347
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso173326f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 23:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750315347; x=1750920147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HrAK3Pb88d2mMW8Ubsq+AvQbXCBrspP+wLLZy4buj1s=;
        b=T65Ai4vHOg67R1lnNK90iq1g3NLzo/1JWjhbRPIQTC7qEHEfGcG0luf+5cafm8GP95
         PFKRmgd3ib/rHJUnZ71aPz74ExB4pYFjMRvrZQZDEFp0IX+4hZeGQ8XaggZOtwuxTKGX
         0UjVjpDazsVxndQzjQSQCq1Gupy4eUFYFVPkwndGpzvQk4eQsB4iuN2Pou+0wUA+lYb/
         ZL4aeeTMMTeIaKgruTeSxhrnsj89zP0+1h8M3LXo9nNZgu5C51qbQtegTDyKdsa9w6Li
         Oe8Ek+eDbrsneBgGIROnG65GQMf5/Nbah+0VNSfiVRvMyRAvBzlzoblYbDMQ5A3Do7pl
         sL5w==
X-Forwarded-Encrypted: i=1; AJvYcCVvt/maXxI4+HVJvSAynx4pDr+y7F4eyVI/2uevQ7w6zzWOQal2+ja9S8q0LuJ+jBnFOoxpI7cH4D1davg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf/x2zekpYuGeAlaoaR+EjN97nzRLRjNFbLxCipTHb0XgzXE/5
	CNbKV8sUP2bVKF2nphMDydrgFJfOvOOphcK2cirV07V6GD2zMKydS0AnzHazFSJFRx+Ql2xu48p
	jjVOAJTXCURwmVXG40C1vkcdNSYvSP+N3SbgXXpHEPC28dR/o3+2CfMUiITto2/2L7w==
X-Gm-Gg: ASbGncsKi/o1Ow81UVPFvDdnWexBAEzBjdMbwjt6CodOhYR6opU77t+FqttXJFl68m6
	UmRelIFD4MuX7TMhZW1C9FQsXpw0uEBMgsueKfuVSsZEnrZGPcHQYB2QdIyh/UvmbDVtjKSpv02
	vYzTpEANhZAV7tuc/teReUhnzPgVQoqfY5SmrYr8fvMA+AZOM6K0y7qvh9nGLJ0+8QhDQeqjwqI
	GwF4ORHyaqbwHyyU+dga85WIzMLJ9PIwhuowKju+AW21uuMyoXimXi7Od+2355MPGA0+c3DqWEF
	w5S10RMPBamOjazIu3Jeis/KkXUe
X-Received: by 2002:a5d:584d:0:b0:3a3:64fb:304d with SMTP id ffacd0b85a97d-3a5723990f6mr15208323f8f.12.1750315346742;
        Wed, 18 Jun 2025 23:42:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpLtHsZYwk8UooadQvsmdpZxfBCgj7PE/RcSNtM8uxppV7BUokDO7d5f9znti0cXjt6rGs2Q==
X-Received: by 2002:a5d:584d:0:b0:3a3:64fb:304d with SMTP id ffacd0b85a97d-3a5723990f6mr15208307f8f.12.1750315346354;
        Wed, 18 Jun 2025 23:42:26 -0700 (PDT)
Received: from [192.168.190.158] ([37.167.112.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7e980sm18260812f8f.41.2025.06.18.23.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 23:42:25 -0700 (PDT)
Message-ID: <d8055c38-a802-4f9d-bc36-56f6c55099d7@redhat.com>
Date: Thu, 19 Jun 2025 08:42:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-next] drm/bochs: Add support for drm_panic
To: Ryosuke Yasuoka <ryasuoka@redhat.com>
Cc: kraxel@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250613132023.106946-1-ryasuoka@redhat.com>
 <30f0ea0c-d8fb-461e-86ab-6e7677beac3c@redhat.com>
 <CAHpthZqfzOXfxzv7OTaLK0x_qro1sHKOHqPeFxwNA4_5FYQrRw@mail.gmail.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAHpthZqfzOXfxzv7OTaLK0x_qro1sHKOHqPeFxwNA4_5FYQrRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/06/2025 08:37, Ryosuke Yasuoka wrote:
> On Thu, Jun 19, 2025 at 3:12 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> On 13/06/2025 15:20, Ryosuke Yasuoka wrote:
>>> Add drm_panic moudle for bochs drm so that panic screen can be displayed
>>> on panic.
>>
>> Thanks for the patch, it's simple and looks good to me.
>>
>> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>>
>> If no objections, I will push it next Monday.
>>
>> Best regards,
>>
>> --
>>
>> Jocelyn
> 
> Thank you Jocelyn for reviewing my patch.
> Now I found a typo in the commit message; moudle -> module.

No need to send a v2 for that, I will fix it before pushing the patch.

Thanks,

-- 

Jocelyn

> 
> Let me fix it in v2.
> 
> Ryosuke
> 
>>>
>>> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
>>> ---
>>>    drivers/gpu/drm/tiny/bochs.c | 19 +++++++++++++++++++
>>>    1 file changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
>>> index 8706763af8fb..ed42ad5c4927 100644
>>> --- a/drivers/gpu/drm/tiny/bochs.c
>>> +++ b/drivers/gpu/drm/tiny/bochs.c
>>> @@ -19,6 +19,7 @@
>>>    #include <drm/drm_gem_shmem_helper.h>
>>>    #include <drm/drm_managed.h>
>>>    #include <drm/drm_module.h>
>>> +#include <drm/drm_panic.h>
>>>    #include <drm/drm_plane_helper.h>
>>>    #include <drm/drm_probe_helper.h>
>>>
>>> @@ -469,10 +470,28 @@ static void bochs_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>>        bochs_hw_setformat(bochs, fb->format);
>>>    }
>>>
>>> +static int bochs_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
>>> +                                                       struct drm_scanout_buffer *sb)
>>> +{
>>> +     struct bochs_device *bochs = to_bochs_device(plane->dev);
>>> +     struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(bochs->fb_map);
>>> +
>>> +     if (plane->state && plane->state->fb) {
>>> +             sb->format = plane->state->fb->format;
>>> +             sb->width = plane->state->fb->width;
>>> +             sb->height = plane->state->fb->height;
>>> +             sb->pitch[0] = plane->state->fb->pitches[0];
>>> +             sb->map[0] = map;
>>> +             return 0;
>>> +     }
>>> +     return -ENODEV;
>>> +}
>>> +
>>>    static const struct drm_plane_helper_funcs bochs_primary_plane_helper_funcs = {
>>>        DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>>>        .atomic_check = bochs_primary_plane_helper_atomic_check,
>>>        .atomic_update = bochs_primary_plane_helper_atomic_update,
>>> +     .get_scanout_buffer = bochs_primary_plane_helper_get_scanout_buffer,
>>>    };
>>>
>>>    static const struct drm_plane_funcs bochs_primary_plane_funcs = {
>>>
>>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>>
> 


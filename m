Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17705267B76
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842193; cv=none; b=s97H7bG2AvtRrlJVe1iVA97cKDR8E9VqAVksr23HWe5zktZRNXpFnMPghGcUdmMlt1gXVtirwC7FDcs9D0MNTwvQtxIKR3tEnTsjPmiy3K+l7c2gFJ+z6+opZArGZZmdhWXkwuE1s2iIlqTgncMzYYki2d2QMiTEOklCGXo1tZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842193; c=relaxed/simple;
	bh=TMmQi99kL2+atqpYCG6LfV/8nmQkDwBk0pQNwYV4mE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O8oibXnejdkGyWKGljc+OzlAQjXB/erjHSaIqJlxqd8D3lB1zp4GXBZufg7X7HKLDFBFkarap6EykyCXKJyvbnle99/m4IZenTuzeMe9mL/yRRbIOM5Zg5DebzXWVtxRn2YBjxEAV6HcUtWfAeEum0la2FlMsH+8OCYgqNQchGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=x+8+Idho; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="x+8+Idho"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so30135485e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 05:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1745842188; x=1746446988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/JmJKZuEpq5UN0wmEtOpCzeCBmpLeQy7dV9yrtIP3UA=;
        b=x+8+IdhoIFUboPYxukP9QIORk4wT3AOzni+YA6ts9E2F6LSEb6ViaAmWxn6Eii2Brj
         ovjAt7hVkChwx35f5PVG3lpPa85SdgdmCiRrgrQJ7ROgcAGeZyobMhVhUi2dDJyPI8iZ
         HOmWPSl/hjZdpC6Gcj/kqgpKW6AzZ4U7Vl/b7GqDcUVBJtOBj0OhL6DTj6fUs1ySzBJa
         J+dBwIGJ7Rtud7Cv7T+AhY1cofPgeXdIyUgIIz3A+Ltrs38YK/gQobS7KAzA1Sl8GVsY
         thSWTulg5N4Z0TKFoZrtubIjdG8Wpz+/KNv56WR18CYxNNCl5yZkqNCnt3tKMV9uNS8l
         neDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745842188; x=1746446988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/JmJKZuEpq5UN0wmEtOpCzeCBmpLeQy7dV9yrtIP3UA=;
        b=ae2B37+X186PuswZPKLQlE5nTkx8BHNKK3VDp0X16FN6Af0nX79v16BT5kResFFo5M
         rLBdCGJtwGxzNHsceymwdNkjF0b+o/H/H1lqH2mbD5P5xFH+wssHvZ/EaCm7zUMCHFlu
         e3sugnWw/sIRckXjvzDOzh5TL7HXPiMWqJ1DactjjNNIF1jdRwMCpFSMJ+4JkD1FsbBu
         HDxqPCxw0quv62nm1mGlTJ04JhAQJd/C4bZxYiaceRAfUKzRjHf5Vov3f0OeGbBIrjHS
         mQzYVuas5llBN1PLUI02QdZFGt/rOLoStAMEKqkycdJatKaI5L+XkWl8hUOc0CtrSwnP
         WnWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkH/gdN87Vr8sfh0dH9W732B4m/uV1pxGyptoOeAoTr7F0wDSSfKee11wUxNV1Siahf+++/1jP/xTKR2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXiqH6DXSft+a1L0U6nSv5QSg/Lgd5/t7IRuZLMaq7Ag3vdqrM
	8xGYEDJ576RCsJcZGr1oZhuSVKSvIxRgXgIDzjyNuX6Vnppt9Fp948QqP4ufMX0=
X-Gm-Gg: ASbGncvuJBNcnc3ht0M1hNram5FU4H4O2eqEtM+C8kzth2DWf5RZr5QYRHciBMg+d7M
	xSlq6i7R0UeTLup3/PczFUwQUDmcjA6Wi1nRG4/xM6T1PTgNRsXSTY7ywULGX5QCbjqw2LfQUQi
	DcJ0nUXUXPFu0K/EnRcYNcf9fazNxIFCQgbxBxCZd4RLy7fu1xXQDxg5uJwt7HK4/jgiXK7pC09
	O5BjQ9HbTYbvdRQETQnVuQjz7/HT88m7o2ajlRKlZMQf4YNrYbHRzXzEdh63kWcTOKEAFtR2Dx/
	NpxyM0po4Kr9jXbkVsnnh6rQVy4zktgO7Dwy8t66mcq6jipHwuyrrdY=
X-Google-Smtp-Source: AGHT+IHqEv8cFeHZNO066YOoWB8BFD6tcgESusNCDp7OcqCCqOLYefsxt5CXNgjV3wL2bS4dyhsh5Q==
X-Received: by 2002:a05:6000:1a8e:b0:391:3b11:d604 with SMTP id ffacd0b85a97d-3a07adb1d30mr7133747f8f.54.1745842187842;
        Mon, 28 Apr 2025 05:09:47 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d88cdsm153399285e9.25.2025.04.28.05.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 05:09:47 -0700 (PDT)
Message-ID: <7f1ad610-5a37-4f74-8eee-5f37556d9576@ursulin.net>
Date: Mon, 28 Apr 2025 13:09:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Remove const from struct i915_wa list
 allocation
To: Kees Cook <kees@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Gnattu OC <gnattuoc@me.com>,
 Nitin Gote <nitin.r.gote@intel.com>, Ranu Maurya <ranu.maurya@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Angus Chen <angus.chen@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Yu Jiaoliang <yujiaoliang@vivo.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250426061357.work.749-kees@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250426061357.work.749-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 26/04/2025 07:13, Kees Cook wrote:
> In preparation for making the kmalloc family of allocators type aware,
> we need to make sure that the returned type from the allocation matches
> the type of the variable being assigned. (Before, the allocator would
> always return "void *", which can be implicitly cast to any pointer type.)
> 
> The assigned type is "struct i915_wa *". The returned type, while
> technically matching, will be const qualified. As there is no general
> way to remove const qualifiers, adjust the allocation type to match
> the assignment.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: <intel-gfx@lists.freedesktop.org>
> Cc: <dri-devel@lists.freedesktop.org>
> ---
>   drivers/gpu/drm/i915/gt/intel_workarounds.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 116683ebe074..b37e400f74e5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -156,7 +156,7 @@ static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
>   	if (IS_ALIGNED(wal->count, grow)) { /* Either uninitialized or full. */
>   		struct i915_wa *list;
>   
> -		list = kmalloc_array(ALIGN(wal->count + 1, grow), sizeof(*wa),
> +		list = kmalloc_array(ALIGN(wal->count + 1, grow), sizeof(*list),

Will the sizeof stay, and if so, how will kmalloc be able to distinguish 
the type? Or we expect one more churn on the same line?

Regards,

Tvrtko

>   				     GFP_KERNEL);
>   		if (!list) {
>   			drm_err(&i915->drm, "No space for workaround init!\n");


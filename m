Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C883C1E412A
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751209011; cv=none; b=HwR+ANVDboaAnOW6q0Y258kcpYhK9YiWCgarQPBoHv2+H5X04xXRHUWXCSrI63I0byuMQqe2aIDnbYSpXMsNvQ8LDX0w9kMD71RyVGkT4rdYayqAixQBnx5QvI9vmXziEYVspPXSJKUtuUHwCW0+ZywPF1/rIqEIf/3mgU/TlQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751209011; c=relaxed/simple;
	bh=J316jFgbpq5YXKrNYAt7lgGdY1nIB8PU/oR+sY4DAfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MdC+l+Jc72ZHQI/AmW1OeDcenxH6X/1KYWtEJrmRLrZRzqPwKsdmgnMwu32/Fiw8qGL0wRr2oGD3lRuMHf+z8K3LmQMz9CJsGEEZJuMe3+lM82b5FKA6Pri3XhVCC1hmZBMACG9MekbE/ca+t4K08sPKiTXTewCoJFzjmhEi1DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KQZvLpk3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KQZvLpk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751209008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23nBsXGE98DROnysLRUCmBBmFEY55o2S0OpjTv0kX+I=;
	b=KQZvLpk3SY4c7Xy3YHo1Qngtcm+c7NinmPvr9RogHwuDS3Oec+TuyfyGcIXA6O7ZU9p1BD
	cM89Nh3J9aIyxaD5ynI9LGQx92CLn90RZwavSmdKheacMmo2NK47RE6nMJq32ZXt5VVPNl
	wgRVPzHc0mXunGBtFaKHHYgdxRc0DsE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-sm7jt_R6OgWOc_kXjJ-g6Q-1; Sun, 29 Jun 2025 10:56:47 -0400
X-MC-Unique: sm7jt_R6OgWOc_kXjJ-g6Q-1
X-Mimecast-MFC-AGG-ID: sm7jt_R6OgWOc_kXjJ-g6Q_1751209006
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450db029f2aso14976745e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751209006; x=1751813806;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23nBsXGE98DROnysLRUCmBBmFEY55o2S0OpjTv0kX+I=;
        b=nUNfO+qUQRvKDH/q5XouGrr2KLmMHGCflYTplV5z3fziTtPdF1+VW6wAEOkhdY1rXi
         V2rpvCrLeDXCxVvcoWEIZL/Kg9TLhXvkANKZ7EUlFIEgDeqcZ7paqX0lJJ3KGRxpCOyT
         o+e4x4J5BfTOXPvOlOdRJv2vrEavnp7ecit9azQROnrE9FiLWYPT2bQQk/2dU0Rvtp+v
         UeIiVj10E4fWWKltEUPOc8QEocGd7/ouCTLsyVDGlXyuZnh1d+P3QjkEIEsLaDRGUljk
         NfeCJYA+NJ/oDkPN+ucOi9b9KLcoDQG/rMMpgTynsSggS0MLsnpJMHgbzcEVRJ73UzJt
         3f4A==
X-Forwarded-Encrypted: i=1; AJvYcCXMs3HNvJaitBx6wBDfO62VyrQ46Xjrgae2+6mx7OuLf+kM/vfGxgbULfU4eEYWZl3t5W6v9Es0k9By2vA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0w3tNbFrw6GqikLgUP5A1J/js1IIsYsq074Bbbtub6iolF9hw
	WSjXF3A2sMPDP4kDyWXod9UcdLNM5znuVpg18oBhgfRab1hHyorWStPpTUwBJACS71LTeNmboaK
	GLHvNX99HTAVuTVSFPC0l/yAhP2i0TDnBdaMHpNpx+fxnP07XANbZcQZ5XJvDV1HbMg==
X-Gm-Gg: ASbGncsfjfTc3nLtz09hEXZErEl7F35Ttqbpqe/p6kPHTS7TElptWUDYHv4CcXkVdK2
	uxrbFxGwAiFvXXTz+c3gQCW/TQVty+mPsUFBHnhy2GG2z9UVVXIFnxN659/aoXT/b+4c+sMYH3t
	mKBSHTyeZQFq+BEEEP5bKGBj17u4cYwd6tYRW3E4y/9OB+yyZV5aIlnB1+qZIAjiFljgWNzqBj4
	wfmyjmj0V6TRxcKrOMM1Z2+cDvE7x78V9RKCMmc6DYKCr4x9XI1rwHbW1R5MvOPcplHSxZUAEXg
	7L8fmWb8jsWjP0mgdrfYyHzFsVUrIoPEhcroKAMQ74abEVtxnyJLdXp7jK9oIw==
X-Received: by 2002:a05:600c:1ca0:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-45390bfd05fmr100453935e9.15.1751209005844;
        Sun, 29 Jun 2025 07:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzwxSKog3DMgujlctJnFDZzoxRMzCEAFRJd/Z3o45oYA0FJvn/qBy7zWWf7etH266Pm4C3Zw==
X-Received: by 2002:a05:600c:1ca0:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-45390bfd05fmr100453805e9.15.1751209005387;
        Sun, 29 Jun 2025 07:56:45 -0700 (PDT)
Received: from ?IPV6:2a00:79c0:638:3500:abf:b8ff:feee:998b? ([2a00:79c0:638:3500:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a6716sm107501365e9.11.2025.06.29.07.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 07:56:44 -0700 (PDT)
Message-ID: <da066412-9514-4475-9602-0317efa458e3@redhat.com>
Date: Sun, 29 Jun 2025 16:56:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/gpuvm: Add locking helpers
To: rob.clark@oss.qualcomm.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250620154537.89514-1-robin.clark@oss.qualcomm.com>
 <20250620154537.89514-3-robin.clark@oss.qualcomm.com>
 <CACSVV03d-3J2SxSnm3oS2OG9LHEJzLKpmgWF=Cx8_Qgw3PZPVQ@mail.gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Content-Language: en-US
Organization: RedHat
In-Reply-To: <CACSVV03d-3J2SxSnm3oS2OG9LHEJzLKpmgWF=Cx8_Qgw3PZPVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/27/25 3:04 PM, Rob Clark wrote:
> On Fri, Jun 20, 2025 at 8:45 AM Rob Clark <robin.clark@oss.qualcomm.com> wrote:
>>
>> For UNMAP/REMAP steps we could be needing to lock objects that are not
>> explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
>> VAs.  These helpers handle locking/preparing the needed objects.
>>
>> Note that these functions do not strictly require the VM changes to be
>> applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
>> the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
>> call result in a differing sequence of steps when the VM changes are
>> actually applied, it will be the same set of GEM objects involved, so
>> the locking is still correct.
>>
>> v2: Rename to drm_gpuvm_sm_*_exec_locked() [Danilo]
>> v3: Expand comments to show expected usage, and explain how the usage
>>      is safe in the case of overlapping driver VM_BIND ops.
> 
> Danilo, did you have any remaining comments on this?

I replied to this in your MSM VM_BIND series.


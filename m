Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3747325A345
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744623330; cv=none; b=AiA2vE5JHpJ5W35khvztGRwAtV81o5ifnOAjGBRP6syDt3hOz5W45bh/L6UEH2DqEkdLqZcBxVPIfy5pT11A6VDqWUWXq4VtJoZbAK4gdH+fT4mx4JsF+VnPOgaBV31SY/eTdupWixgdubKj+Q3FstAFhEvhBj5bOu7A5zOkxO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744623330; c=relaxed/simple;
	bh=GIsecyQhgeicJgz5tjBUq7jG6C7cz9wNgRPSrJ826LA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jdvrO/dYda65yuDcJxWvHWiEHOp0Nzpm3/9PFtujTGkzAJFF13sFP8WYiy+Cc9jGubrMD5Ufy7bwGZZ95OUHukCqc9iec+t6cY5pJlVbpznUbMplz4Js9mDTkmfNkuy+Zpif32n9DHf3aYTBV7LGZjTG78f7RqxP0XogtABpqVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sz/wU66Q; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sz/wU66Q"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so45457765e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744623327; x=1745228127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ReQI8fCjbqB0sMWedrxivkrJnzKXv16ZXvVj7cgD7w=;
        b=Sz/wU66QqRILQr6ELqMK9ewsFo+0/awdCr2IFkdbV1oijI9Pti+iH59ENhAV+bNkYE
         28Ur79TQhUJlq+RBjJmWmPVd6goPZFwFFX6L3EopCgvcsVtVS/PHPOTndECIbHPk4Yia
         oBwAluS6og9DbPANWj0lpsHJs+nwr4WHQlgRA7gLK6xLovPvQzp8WGPXHv3QVP9a/HVU
         sG3OjSkpfAdgWOx/nRkigyPPU0yQIKqG+yZRDloTz+Jaxn46S+61rOdGOByhr/A5G/MF
         kacNCe1ccjZXCiRQ01fQyQWnqkmYmSu8JW5XNTRPR3RT/+kn+EXZ798yQMfXhiR3Bfed
         vnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744623327; x=1745228127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ReQI8fCjbqB0sMWedrxivkrJnzKXv16ZXvVj7cgD7w=;
        b=QJtm3hL7cZ0bIoTIbjdlHuK6A+v9t8uhg9nqq6IfC56KRn5nP1YG8yI3yAY8SRkiVS
         vOY4DQHfIpywUybPe+rA7VMi3awzFV5F5Qin8Gg+VlhS82UMGsWdZrQVpqZi2IuKF8TO
         clb98K70epF3fcfBN+B3YQT9yhXY49iS7w8RY2stwlXbEBzEVhjxUXdWXoj0QDu5egwe
         GM/C8sBTXZ+8p/lkCMNR//kMYwq2uq8H/8yaG6T7G1pMiVtLnjfJLw26Rwb1A9IlnpRL
         oZGwBmDtN/ObgLd5Jhzl7gYM3sg0U0LJyhbG0rVpqr4EqijMGbGfZ25eaf2yUTMoTOlW
         cbrw==
X-Forwarded-Encrypted: i=1; AJvYcCUxlZJd5lAZajb/jnpIJY8lns/Z9rk1UWRFdAPlm8bzFs9W0D4H36ysJ6SmKidwLxUz5kzHtPK+r0GDY1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdSaPPa661OgBdtBgVomQUoRna1azGV9XT+QtwM0EXvyPXsD2t
	rEawC9PPZhXTAKoTGj1GgxwGab/irciSNe42rH42I0yDFmwIyl/M
X-Gm-Gg: ASbGncv6tVUEhuLvKcDUiE3uEwPTTp+rlS8pH1OZ7YsdPJ8C/eGU0D92gV/XIRezv8W
	ffOvCIp6EASIzlHFMqzJwyFiIP1LyZx9pq1VeR4p4trCvA/9sb1PbfTO4faQFb6HoVUD+MXG8/R
	k8W3U8i3yYYQgzjCUpZRjxQh+BdiSt12fpmk9is/n6tR9ZIt+lxeAedN5A2sMxGyS6fHYvDI1pJ
	sDk4ljUzrD/yfiYPBDtZ6E0slqW9pP28Mu+EU6FmnVIk6Dn+dkTwAkwfxASnUJq+7YjCE8v9Zwu
	oHYM/fXE7EjgVNykfi3Rlr5vMHyWbzvnWsWZ7Tb4nhcv4OiTdWOwOoqUuOXSIlH70CXlrQ==
X-Google-Smtp-Source: AGHT+IFiIGr5NntN9eiv+X0gsiCw+Hdtz7/Xb6Uz5r7mI+EQClj1RzPK0mSFcrdIvisSut9yt1ZlrA==
X-Received: by 2002:a7b:c047:0:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-43f41fffc3amr55868505e9.11.1744623327064;
        Mon, 14 Apr 2025 02:35:27 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338db0dsm175261215e9.7.2025.04.14.02.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 02:35:26 -0700 (PDT)
Message-ID: <44f0bf71-c689-46de-bfdc-e4a24b9fb921@gmail.com>
Date: Mon, 14 Apr 2025 11:35:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [lvc-project] [PATCH] drm/amdgpu: check a user-provided number of
 BOs in list
To: Fedor Pchelkin <pchelkin@ispras.ru>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Denis Arefev <arefev@swemel.ru>, Alex Deucher <alexander.deucher@amd.com>,
 Simona Vetter <simona@ffwll.ch>, lvc-project@linuxtesting.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@gmail.com>
References: <e6ccef21-3ca5-4b5a-b18a-3ba45859569c@amd.com>
 <bmdour3gw4tuwqgvvw764p4ot3nnltqm4e7n3edlbtpfazvp5c@cqe5dwgc66uy>
 <f8810b13-01d1-4615-b6e2-2e791c48b466@amd.com>
 <qc72y52kt7vuwox4lhk42zligy5bslttselfoexse42mywtpps@ebqijs2tap2t>
 <edc08eb4-63dd-402c-82df-af6898d499a9@amd.com>
 <pmby7iowvxuomsbuxebttosz245j7ngw5enbl72dq675nrgvve@ugkvzeihbtut>
 <CAHk-=whLixL8-iYt1qH0-YvEnVsYtryZaN5Da0qoBBhKsBnumw@mail.gmail.com>
 <437e12e2-ac0d-4a97-bd55-39ee03979526@amd.com>
 <CAHk-=wjLQzkTTDwJ+ZdVdgNKMg958petkdsu-+m7s9UL6PVCRg@mail.gmail.com>
 <b7286f30-15ac-4803-b204-0fe6f2423f73@amd.com>
 <fgd6hrllcwj2guhr4mwzfblhausluczprlbjqhsqiqeshoq2g2@jgi4rgufn6wx>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <fgd6hrllcwj2guhr4mwzfblhausluczprlbjqhsqiqeshoq2g2@jgi4rgufn6wx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 13.04.25 um 13:31 schrieb Fedor Pchelkin:
> On Thu, 10. Apr 11:07, Christian König wrote:
>> Am 09.04.25 um 19:27 schrieb Linus Torvalds:
>>> The VM layer allows larger allocations. But the "this is a simple
>>> allocation, choose kmalloc or vmalloc automatically based on size"
>>> helper says "you are being simple, I'm going to check your arguments
>>> are actually sane".
>>>
>>> So the drm code can easily have a function that validates the input
>>> for your specific cases, and then you (a) don't need the helper
>>> function that does the overflow protection and (b) don't want it.
>>>
>>> But it should actually validate arguments for real sanity at that
>>> point. Not just open-code kvmalloc() without the sanity check.
>> Yeah, exactly that has been proposed by driver maintainers before and we just rejected it on the subsystem maintainers level.
>>
>> For this particular use case here I will propose some hopefully high enough hard coded limit, but I can't guarantee that this will work for all use cases.
> FWIW, the current code anyway has this limit being some sort of 4Gb, not
> more.
>
> The resulting calculation of `bytes` wraps at 32 bits albeit itself being
> of type *unsigned long*.

Yeah that is a *much* more serious bug. Thanks for pointing that out.

This should probably be using size_t here and applying the limit to the bo_number before the calculation.

And a bo_info_size which doesn't match the expected size should be rejected and not worked around like it currently is.

Thanks,
Christian.

>
> 	/* copy the handle array from userspace to a kernel buffer */
> 	r = -EFAULT;
> 	if (likely(info_size == in->bo_info_size)) {
> 		unsigned long bytes = in->bo_number *
> 			in->bo_info_size;
>
> 		if (copy_from_user(info, uptr, bytes))
> 			goto error_free;
>


Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BDD18801A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 22:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743029960; cv=none; b=jOI7rAiM+q4uzZ//Akvo0i8XuerbE6BPY4UDf87jJGh9vuqr828ANs3H03nkUkrMjzX+P+8lXxGQUCUR5J771hTZl99TWkIlYod63uzmqaCEXNv3KCuceTUjBQJlXiDx6ANQrxPmlmlv0K1M2NyFKmPyMExkgiVogv7EpbEhR+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743029960; c=relaxed/simple;
	bh=HQ5sPd496yfuSWI2MUmUZEedvMZIC/DtMbe0v7fxQkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZboTD0t49S7EsD+H2j0yxo6680jUGHG4QcwMWNhEn2Gi9MhVhcOLX1dMtfR/RTvH5p9H/bZxs8qolFd6ooZO5GRXOQEutGzNJG2o8LK4KsCzPJTZHROEIJSFM9YC6zpqIfjBFm/KSn2OY8VX9bZJbNZ/MYNejyLOAD10b03rNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aKrH0LYS; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aKrH0LYS"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso569579a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 15:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743029954; x=1743634754; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DdJT7/C6Mv3MtdVMV3c3vRmA5DIaye62FsYRt3g3T90=;
        b=aKrH0LYSfJwBdSA37sh+obvSaTHtengqtiiwJVIwBbUZduV519L4bmaEtnU/yKeVR8
         6y/0H7DA8CpAUsn939xKpCk5R5vEso7Rzi5/TtnRY10UOgb4pSClF9iFPGQZGrvX834f
         cqAvZXzIqkJnnzJtttEhg4LsJD7WMaH5OodYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743029954; x=1743634754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DdJT7/C6Mv3MtdVMV3c3vRmA5DIaye62FsYRt3g3T90=;
        b=JzcR9yTCdtfh2P7CE0e5O72fatneJ+NRPQVnI/SfGBolGJE6svA/e+NnWwFaffcQgu
         hXQyCb/+ENOMo4PlLCRHRyRC7LMfR4qzNfuAsjPWVa+gZVp+BLt/S9tus9ljXjBgbMGd
         wDPn7IEoDRh8YYumOog6iWVxBITWeTFRDdYFbjbvhyvNe6Q7PFYQCGGSIakoLCrdP+xL
         XyoVbixQJqfFTNNJokh8CWbJ4gnAncyWR3AjfZ22E6srEinmhyED8r+Cv6sipQODB/HI
         ep2SQYdl0Tohp6Kx3TMkLGOG2QH9ODU4cvzjlGuH8be7kp+nj7bHYN4h/RlpaLrYOhcY
         1UNw==
X-Forwarded-Encrypted: i=1; AJvYcCWmuPQsSETo/ujmtD5bcFVHMhcP/L1SHIe8rUxzd4I750XSex1RJ2HuMvN2K0mTyjGnZGR0ENDxvkocQ5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZRvRirEKPJfYwLfeWLxNcgn6MSZgneDUjG6o88yZQdKWITFgh
	9Zse0FpdMoKjkpElhHZvNew8Cr+6flnRinq9iKmfTg1ew+7AUCJQJCNuWo2xn7sK3NaQAEvAKI7
	VjV4=
X-Gm-Gg: ASbGncvWbqRRYlQlAff1TURFmMxGT6pbOsP3D8f7nSuIJvB2SmfTmE0aTbNahk8Kz8x
	2au+gjzKI1F4eR9IBd2z1IByH7MloVrFolavsO6OnJNZ5yM2ApQAJMGzNGlihx6kM6rVaM3PrvV
	yzbHQtsx14IjxRv+fWasfKTmE5NUo52N0lPoVY00uXXIrrwSEbiJ5szFlvcPadUQUThXf+qLNV2
	eP8htnV4Mv1+hwIyLLh90chuFA6xaI8Nf91+Zb4cSbHDdxqTVG+RKonQQHe9gkho7e++ueJdxZ6
	3f8GTUWT/U1UkBHw/s6814Ma6VfcRweyB6UGNzOWmY2QZRKgVWz59I1H/NtcUIKn3K/1hGm8ELB
	REQLaSUuOh9OFlx3cdh4=
X-Google-Smtp-Source: AGHT+IE/qB8uQpravDzkySPeqDkkDmRc4+GQExlqUFOETbiRctYYEY6p9k7XKtyLp/qpj6grXNP7zw==
X-Received: by 2002:a05:6402:5c8:b0:5e7:9359:58cb with SMTP id 4fb4d7f45d1cf-5ed8e286d2fmr1083276a12.11.1743029954485;
        Wed, 26 Mar 2025 15:59:14 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0c7759sm10031389a12.51.2025.03.26.15.59.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 15:59:13 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac41514a734so55563766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 15:59:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWO945YE6oskkp8cJdnEY/G+PhSUm4QgYEsoE7WRQOxjQc9XKMQWPWY0GeRrZSaXFm0pXqM5hyENaoKvo=@vger.kernel.org
X-Received: by 2002:a17:906:f587:b0:ac4:5f1:a129 with SMTP id
 a640c23a62f3a-ac6faed1862mr124221366b.15.1743029951610; Wed, 26 Mar 2025
 15:59:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325101424.4478-1-spasswolf@web.de> <64945196-f05f-478e-a2b5-f0bd58345136@amd.com>
 <c66e2c03648370d5e5c0745f32ebd58367bbe48b.camel@web.de>
In-Reply-To: <c66e2c03648370d5e5c0745f32ebd58367bbe48b.camel@web.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Mar 2025 15:58:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh5Suzp0z7AnK0NgSKfEAWQJw7Dgv5eku=rzBuM1ugQDg@mail.gmail.com>
X-Gm-Features: AQ5f1Joqj6knJlPGY12Qm5E3Ax3-nFRy20R2IbdTOZEIlJ4CJbxhEjPRL7oKvsE
Message-ID: <CAHk-=wh5Suzp0z7AnK0NgSKfEAWQJw7Dgv5eku=rzBuM1ugQDg@mail.gmail.com>
Subject: Re: commit 7ffb791423c7 breaks steam game
To: Bert Karwatzki <spasswolf@web.de>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Balbir Singh <balbirs@nvidia.com>, Ingo Molnar <mingo@kernel.org>, Kees Cook <kees@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Mar 2025 at 15:00, Bert Karwatzki <spasswolf@web.de> wrote:
>
> As Balbir Singh found out this memory comes from amdkfd
> (kgd2kfd_init_zone_device()) with CONFIG_HSA_AMD_SVM=y. The memory gets placed
> by devm_request_free_mem_region() which places the memory at the end of the
> physical address space (DIRECT_MAP_PHYSMEM_END). DIRECT_MAP_PHYSMEM_END changes
> when using nokaslr and so the memory shifts.

So I just want to say that having followed the thread as a spectator,
big kudos to everybody involved in this thing. Particularly to you,
Bart, for all your debugging and testing, and to Balbir for following
up and figuring it out.

Because this was a strange one.

>  One can work around this by removing the GFR_DESCENDING flag from
> devm_request_free_mem_region() so the memory gets placed right after the other
> resources:

I worry that there might be other machines where that completely breaks things.

There are various historical reasons why we look for addresses in high
regions, ie on machines where there are various hidden IO regions that
aren't enumerated by e280 and aren't found by our usual PCI BAR
discovery because they are special hidden ones.

So then users of [devm_]request_free_mem_region() might end up getting
allocated a region that has some magic system resource in it.

And no, this shouldn't happen on any normal machine, but it has
definitely been a thing in the past.

So I'm very happy that you guys figured out what ended up happening,
but I'm not convinced that the devm_request_free_mem_region()
workaround is tenable.

So I think it needs to be more targeted to the HSA_AMD_SVM case than
touch the devm_request_free_mem_region() logic for everybody.

           Linus

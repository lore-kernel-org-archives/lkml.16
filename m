Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE1426B2B6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213678; cv=none; b=DhdN+uG6tXMrzlB7qqI72trlkDD9xEOyoHusc72LobHZQwoyuJYHFXbKCXohIOO8tOWnnDMuNOxxG9tNULndWKIYTWlWGcwA0fuNmGhK4hASQQ0X7Ag3VulxK4mc0cZkAP+BUoc3aJjbuPGb63b1yKsvTI2SgxiDOR1Gu3e+FII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213678; c=relaxed/simple;
	bh=jCABnoSlxxQFUAs31j2dDgPFt6TkJT+wt4+DPGFWvNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XlWo3RrWwbzoNeRNcttVdr+P2zdp7R9HlhkQYbCO2vS8OkKN5kkE1MXpstjaZOQZ4RJVGWCyrOlkBZkHuZsUrAr6d2bYGJMdPZPXeSLqiOy9JjiCvN3V/g1cJFEShLclTSCH+sgmAnDPkrm5hMw2xxnNs1kE81srTt24BZahJdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NcjWJWu0; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NcjWJWu0"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so1121004566b.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 08:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744213674; x=1744818474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nJ9MrfmGdx/admoRpqYzf488HmvpMXteQ9lPzY9ZRZc=;
        b=NcjWJWu0hBJ4jLMMtJRQd3oRap+p2iwKT3zT5My4fmBktQ2b0Sc/RaVLhiDYAD5g2h
         dPYhQFKbebUs8LWyykZPTdG16uiiIx0/PCJuUeZrnC0oblph+7jbXfoX5FD751Zx7UQ4
         qyF2nWCMdH0Pf9KTa4JHLCr+Tv6LhW0YvOdSV8EEXbOZQvwE3I3Q5usya3M3Z8joErJ1
         +oW9mjIVJAXpkimmRSr0V2GJ9aFG0WHhj0PUQLQFA20iVsKLN0qFh2YljjnyRzEPYliJ
         RZFMeLZE63H/2ZLdkEmoDDXGenjl8K1+tpfGachRL14Tthc/ezvuzQtJvZU4n5EpM1Lv
         dKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213674; x=1744818474;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nJ9MrfmGdx/admoRpqYzf488HmvpMXteQ9lPzY9ZRZc=;
        b=CaNgzFrCIMYTO5OunVn4KzWxtBB2jAKojdaScGhVsGorn26UAa02RlwN976VT96goI
         3Behwgs3yaAKPoBB2c8RXPWil/TXwJuIwrp7etyO6GH/BGq8oU5OOFMzBNhea9oOrJc2
         qwMe5xambJR06HK0qDBfjaGZRuTcZpbsRc0+uLttofAip2BAgdKBky/lSp47YtOHpMiL
         tRrkNeYznH7drWjTSDS8snzUBxfnNuHTQCTWToHgR+KjZjO4Qpi8Ut4DzBBP4n67igz8
         Z4rDQIG3rGCZiLXEbKXB8o1ouZ9kIgh5+1m9j1Dn2M6ZcVS3hPOeo/1L7F/gBH2UcfaY
         mndQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtEI9vQcvcCdhgalPykr38np6i/eC8VeXAuSHfBNbXS3LWWBuyRi3Q+Qr5zVNNJOPu6uyAgakJi2FdXAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGDkSFMNLKEYAsG7XXCz0Sv5jEicJnHZD3Z+KWl6AXfOkdGeN0
	L3OEhwjgMvjTe2fIOERfZ9Lt4156yqxsl6hHNid+WgzmpNxsAmZjIx6qXEMUOJ5+0F+ad31sISQ
	G
X-Gm-Gg: ASbGnctLtsR7Fn+bQIIMo8j2JkY2piwzFcZxsRxrQVN19z5MH6KLczpWZswwqk5SyMl
	fLGadDGYE3xiFYzZgjCUaJ8jrFV4EZr8PZuqvrGh01xJPtY0i0mvoY6fSetGHStalbkxpS5MkZu
	yJQoHtia1WiFSxy1dHOLu+C97izioU9kC/DNJa1fKhEhs+YzaGtQlAj2sJtopHB0cUmq0pskyK3
	Dq9Te4zqX9QQ95EWLDLwF5mMTPxBgbAXA5/4AxBN3oYjZMzanJ+HoEfQhCNYgM3QLTaPYLwc3z0
	e2G+xipQ3jQSr8u4PxWApv+/CelRBYCbqyMX3EiQv+/2cg==
X-Google-Smtp-Source: AGHT+IHo0do0fKxRZomTsqBtbKndZIYZugYhxWasrmrbi70luUu4m++JfZsaxZzQDLqrDx2E46ZGJA==
X-Received: by 2002:a17:907:2cc4:b0:ac7:391a:e158 with SMTP id a640c23a62f3a-aca9d73ab50mr270802066b.59.1744213674410;
        Wed, 09 Apr 2025 08:47:54 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.133.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7317sm114172666b.177.2025.04.09.08.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 08:47:54 -0700 (PDT)
Message-ID: <00b29ba9-e886-4464-be39-731789cef72b@suse.com>
Date: Wed, 9 Apr 2025 18:47:52 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Allow individual features to be locked down
To: Dan Williams <dan.j.williams@intel.com>, Paul Moore <paul@paul-moore.com>
Cc: linux-security-module@vger.kernel.org, serge@hallyn.com, kees@kernel.org,
 linux-kernel@vger.kernel.org, kirill.shutemov@linux.intel.com,
 linux-coco@lists.linux.dev
References: <20250321102422.640271-1-nik.borisov@suse.com>
 <CAHC9VhSpgzde_xRiu9FApg59w6sR1FUWW-Pf7Ya6XG9eFHwTqQ@mail.gmail.com>
 <67f69600ed221_71fe2946f@dwillia2-xfh.jf.intel.com.notmuch>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <67f69600ed221_71fe2946f@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9.04.25 г. 18:45 ч., Dan Williams wrote:
> Paul Moore wrote:
>> On Fri, Mar 21, 2025 at 6:24 AM Nikolay Borisov <nik.borisov@suse.com> wrote:
>>>
>>> This simple change allows usecases where someone might want to  lock only specific
>>> feature at a finer granularity than integrity/confidentiality levels allows.
>>> The first likely user of this is the CoCo subsystem where certain features will be
>>> disabled.
>>>
>>> Nikolay Borisov (2):
>>>    lockdown: Switch implementation to using bitmap
>>>    lockdown/kunit: Introduce kunit tests
>>
>> Hi Nikolay,
>>
>> Thanks for the patches!  With the merge window opening in a few days,
>> it is too late to consider this for the upcoming merge window so
>> realistically this patchset is two weeks out and I'm hopeful we'll
>> have a dedicated Lockdown maintainer by then so I'm going to defer the
>> ultimate decision on acceptance to them.
> 
> The patches in this thread proposed to selectively disable /dev/mem
> independent of all the other lockdown mitigations. That goal can be
> achieved with more precision with this proposed patch:
> 
> http://lore.kernel.org/67f5b75c37143_71fe2949b@dwillia2-xfh.jf.intel.com.notmuch


True, however I think increasing the granularity of the lockdown 
subsystem merits its own discussion, notwithstanding COCO use case.

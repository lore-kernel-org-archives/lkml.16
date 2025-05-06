Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B7D280A29
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746547636; cv=none; b=aOay13igqBXMEwvaZ8p5m29HgpMeHcSlVdQkN15MC3no7jsW/6jPtcP2JN4mnYlVLpAmEnCTvnOkOE4z+iw7kdek4bgupMCS9O9tZJf2Fumz3ndBb1+2cDBBHGCHodTN+wp7uJq4+uITSvWJSmCYa2g6VErnXwUMaODKuVgcY8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746547636; c=relaxed/simple;
	bh=PmtruktTMNBXbr2aasJC5meNw+18Vu3EtIDq4xONd5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I72buWKKh7Kesw2UUt56W5XuKDANWSetF/dWL/lVp5+E8yktxrk4XazzrMbvbbTFOFVaktqu5W1tovwXIrjoCAYCc2a61V9H29fidfy0UDlFF/IwfDW9bOfFtvfvDFEUaMG18QpLYHv1J111D7TXfkKbh65inutctWhpSdcTOnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6dKHrZi; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6dKHrZi"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22e09f57ed4so290245ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 09:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746547634; x=1747152434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+VZZVGzbcYYx5hdX5nvsFRseHivi3VPKSjmAFBb2pNs=;
        b=G6dKHrZiSZirmtEcupeuC5kuHPWv7mV4TljhDykjW7V3Wrrq055jow5DRCe3OBNMRU
         bLhlUD+uheoNNycbkD94klt0b/0ifyqonJ+1RTq7qxFpG7zDfS14xSgcIVCejsU9ykVY
         zT6PBWL6jxN3lbdgxQMGXJnRDPix+1NbM05tBAKxyv8R+humk9QkWiaF/EaxxZOgAl+w
         tDgdFXhPF+5pbL4LTp9/b2+xNud8Ri5QtzIpBywdZacjN060PR91Xd0iR0y82Y65gXaq
         VAtiP1oKXGMbtgucSh3Xvfq7SteM+T5KJnfftV2r64Ie8Gv/XG3DgBz7X0BnBLxf29+6
         MURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746547634; x=1747152434;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VZZVGzbcYYx5hdX5nvsFRseHivi3VPKSjmAFBb2pNs=;
        b=R9XvgnvjeRrQjOp/n1K8Wjt/mg0GMBNa/ZU84RJ7sG9964IqMwcxeZ2wRytzlK/Vsm
         PV0cE5PxdLlXLaerU/JfmJb2hLQCWTe96/718RILFjAgVQhqLdxjK0TbGgdtQcPeK2XL
         246Km8bsw7DXah8GYmvi4HEaZsKyCTBd79nqNR8nSJ9DIiTN+GhkWULg3dpIr2C5jJGY
         d2STaBFZgKi9nfh4TRYTvxHCPc8p3X99VM1gu5cqTi+vqIJ8TnDjIivdC4KllnU32N6B
         ZYl0jJOpxUGLULYyZj+FuXEy6alljDWJ0wQGqyf3PKy2O8ShDvd9mkc8dmI20SdvrpnS
         Lr5g==
X-Forwarded-Encrypted: i=1; AJvYcCVcfTHc7JPnuEX8j19u3fBOvTbsUcXuZmtIXlkrZTgfdm91MiUskpiT/IlZMWOSH3iaJwx+br+5nDFs28U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuO4xctOLzZDtTp/gO2nQR0BRcSn9vpzrTaj6xkqTGbs2evTRn
	1KK56n9fBSZj7w9+Oi5ZmStZY0e8/3yTqSowonF9qTXigGpMQ33J4zv5jg==
X-Gm-Gg: ASbGnctBhgcWMYodVY4enXRhr2kMTZ1xWQD69BMaaK9TL3QDcpvXbMfkXe8qN31qkC6
	B0lbhL7av6SmEYAFOymaL5fOBfoyZW09sajQqg22pooadpanJWyhnPCFuX6ckVyxhFxIQxbN5cD
	1FBzaThR+jV1pXk9VkFy3OsIz6P6yShX2wj0RovTabqeN2/KT/V+xneg7vGosNbar7PDNX3X+bh
	LILM/Pl9MozTa5Vjr6nuzESfaWjG4PFrh753YxotWmQqvEzySj+dnIwPiOSgzLs1dJmDs6Fx28o
	yWSWY3veG7UcV53mkr2I9eUwokeH2Rp1fZ+8f7O8qxX0+s+0HoqtzRpU7050IAeZOfw+Ve7KdoL
	Rhrh0xg4itefOAQ==
X-Google-Smtp-Source: AGHT+IEDY9vBp/pIzu68i4CFkgzkeq79wAIqKzRU7oNMRLAhiQ/uElBDfTlVuqGc6Qc1+lNzWzKU2Q==
X-Received: by 2002:a17:903:41c1:b0:22e:5a9c:2853 with SMTP id d9443c01a7336-22e5d667e5bmr4368905ad.12.1746547633893;
        Tue, 06 May 2025 09:07:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058db91dasm9091614b3a.44.2025.05.06.09.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 09:07:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d7af43e4-6892-4f8b-a2a6-0c121429af32@roeck-us.net>
Date: Tue, 6 May 2025 09:07:01 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Fix up memory allocation tracing
To: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>
Cc: David Rientjes <rientjes@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250506144531.3434190-1-linux@roeck-us.net>
 <62cf4450-c765-4641-b042-66cca71d5912@suse.cz>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <62cf4450-c765-4641-b042-66cca71d5912@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/25 08:13, Vlastimil Babka wrote:
> On 5/6/25 16:45, Guenter Roeck wrote:
>> intcp_init_early() calls syscon_regmap_lookup_by_compatible() which in
>> turn calls of_syscon_register(). This function allocates memory.
> 
> CCing people for intcp_init_early()
> 
>> intcp_init_early() is called well before kmalloc caches are initialized.
>> As consequence, kmalloc_caches[] entries are NULL, and NULL is passed as
>> kmem_cache argument to __kmalloc_cache_noprof(). While slab_alloc_node()
>> handles this just fine, the trace code unconditionally dereferences it.
>> This results in crashes such as
> 
> OK, so we have crashes that are not deterministic. But also
> intcp_init_early() deterministically fails, right? This means it's called
> before mm_core_init(), and given the "_early" part of the name that's
> probably expected (i.e. I don't think it's due to some random initcall

Yes, it is called before mm_core_init(), from setup_arch(). And, yes,
you are correct, the call to syscon_regmap_lookup_by_compatible() from
intcp_init_early() does indeed fail with -ENOMEM. That is interesting;
I did not realize that. Thanks a lot for noticing.

Please forget this patch; I'll submit an alternative specifically th address
the integratorcp problem. Sorry for the noise.

Guenter


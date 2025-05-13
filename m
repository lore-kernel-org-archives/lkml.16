Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5611F0E20
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747126004; cv=none; b=nhLluJOys2nJNDcVN2PpkSTzexUK2oW+QwF10CjEss4VoxhqPVh26EeR71wNU/bTDkLKrf+UhHf0unl8C/qURCNXF4y5uGi7gvKZ5qdFPtB1E36MLXvaBjio8majzslsLEuAutiKJuUWjAuRf9r7F8rfMoe2M+sZF2+i0KvGx3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747126004; c=relaxed/simple;
	bh=Wg0culwec3VKZUOxB58pMb0gWDC63okVOArHAjwqsFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eakKIH3ZqTUND1qs4/5LaCcq5vzNHcQV2xrCQVUvKFGUeylof2JjasSLYz/lKvy9+HCDFG25SzSmgM2EMgmZRZf593+4Is5z/Vy0vDpu7n3FaKWAJf2cLwM2YN8z04GV5Y3j9Wg6hnhhshQ6p7cUrsOxLQ5RCNS6rqiPwp/maK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PxVD3RNx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PxVD3RNx"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so30769375e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 01:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747126001; x=1747730801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HfjhkwJGAh4yR1c8YSpW2wV60ay0qJdftBiYqsIF894=;
        b=PxVD3RNx21KML1+hjsvaPLERh1LUmzdNpYjumIWu7XpmfP6fKM6HCPzQ6V/4kkNpXx
         ZGBf09d0h0sIxj0NzsBSdVD2iycYszV8NOP7CCuYZzk8ZV4F7hWQmU0anfjhSSu6xj34
         0PrZrhu80FfjWz34CKwjLPTvcYcj/qxC1X3P9zZer0vTNx4SEjNbj3gdlWGO4bHlryer
         AwwaZJSGTWQWv+HCVTkLTGEuwFt6ag1V28s1JePH2A9TU8qWCOda2rNk88JLZQtgEkKY
         JtxzXVUjQWEWMUEMBGO/2A8qRALWvvd7gJNeskfelyE/8xSjDySVABJr0UiEwnQkmGq0
         /bQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747126001; x=1747730801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HfjhkwJGAh4yR1c8YSpW2wV60ay0qJdftBiYqsIF894=;
        b=hvlZBaGC/CrEYWYZtBvM/UKEIlaC725bPAqr01GLWXA3JiXNsNUQYhVuj3FYvyppQh
         EynZZcXtriXdILiaqfwy9KuJe6IvQXQFGegbw6qUlnf/wDfsgbF3/mLn4Ijzqfgx9LcE
         V/RV7F9gAXGP+WeAFopeJhIqzNOyGPsMGfvRRSAFvSB2ragdfOLv4X1XOIu0oeGgSqzq
         EJO3pMnYURiG4h9J2NgICJnSyJbeP4Jbbean6gbnzrsRXuzTqysYq2/VuwN+O818+0BN
         rhOh28aseK5W2vI3GNxmg8Nazn6k33y5bU8JjPUJtcdFY/3Ayr/J48RA7UUKKODWoxH/
         d68g==
X-Forwarded-Encrypted: i=1; AJvYcCU8/Bsd5WcHZo+4Lw5Ixacgz8UaVM/ILSjbOlMZbD7SjFEOtfWRIM81/y1cW58DI8B3aVWxbc6G/hYgiC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwooioepVoB9LIrnX+Jr8AOfbs9l9zu6p6lEBgWFheAvRdiOaiH
	DO2dhCg9hOGI50zi4bIw+5ucQW6qQg7qaSmivVGh3Ba7tMCMMVXr4w9QqbcWzDs=
X-Gm-Gg: ASbGnctLHlvfJjQ5mMcR/ikPEhaqlStkHdkH2f+BIACmHkU8eoYmd68K9tg+m+PI00G
	WsouPiC5Yd9l3KCKytJAR1ZHthgD32D+bG9IgmRSTidUao2t809DtTgWR+7P+SvgAEEuT1VVDHB
	Vf2M+4NrIvhpGbeZLLn0jlIXeGYGiK3DbAyIodeNCm7b5eNp6UQq0fAK3WCmhxHii1dKsmbacyc
	Vhiluu5kr+6dlvyYpjm7LUzogS2RiE8EUZX56FdVrclMXTCEy58rE7KuPlIAD6/TvxRN9C2/oe/
	cPARYAQ73vbD/4f58ZH98wCwXCMXxlY5yzVy59z/dW7n/fc9o4VxDK3iIdTeft4uRsiskpYPTKQ
	xS+78m2dXborcCWH31sc=
X-Google-Smtp-Source: AGHT+IFlkh62/Jmur4N3SSe+iYPClCbwAdv/4Xg3Nm9drpcLIpC9JBevCz9JNdvV9lRKrXwHfLczZw==
X-Received: by 2002:a05:600c:444c:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-442d6d3dcc8mr163400095e9.10.1747126000696;
        Tue, 13 May 2025 01:46:40 -0700 (PDT)
Received: from ?IPV6:2001:a61:1335:3601:f121:69fe:935a:67bd? ([2001:a61:1335:3601:f121:69fe:935a:67bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67e138asm156256525e9.10.2025.05.13.01.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:46:40 -0700 (PDT)
Message-ID: <b07c7d9f-a20a-49bc-adbc-d43326b2d2df@suse.com>
Date: Tue, 13 May 2025 10:46:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] USB: core: add a memory pool to urb for
 host-controller private data
To: David Wang <00107082@163.com>, Oliver Neukum <oneukum@suse.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 stern@rowland.harvard.edu, surenb@google.com, kent.overstreet@linux.dev,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250512150724.4560-1-00107082@163.com>
 <20250513055447.5696-1-00107082@163.com>
 <48d5cae9-ff7c-4076-8b71-8c16bcf00443@suse.com>
 <4006cec4.794d.196c8be2fd1.Coremail.00107082@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <4006cec4.794d.196c8be2fd1.Coremail.00107082@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.05.25 10:23, David Wang wrote:

Hi,
  > Thanks for reviewing this.  The memory flag thing do raise concern.
> I think I can make adjustment:  realloc the memory if flag changed.

I am sorry. I have been unclear. Here comes a detailed explanation:

What we call "gfp_t" is a combination of flags. They describe

A - the type of memory (always valid)
B - the way the memory can be allocated (valid only at a specific time)

The URB is a generic data structure to be processed by the CPU, _not_
the HC. It is always generic kernel memory. Flags of type A make no sense
to pass.
In fact you may not know for which device an URB will be used when you
allocate it. The only valid mem_flags you can pass to usb_alloc_urb()
are GFP_KERNEL, GFP_NOIO or GFP_ATOMIC.

If you need to reallocate memory for private data you _must_ use
the flags passed with usb_submit_urb(). A HCD can modify them by adding
flags of type A, but you cannot change flags of type B.
For example, if usb_alloc_urb() used GFP_KERNEL to allocate the URB,
but uses GFP_ATOMIC in usb_submit_urb(), you will deadlock if you save
and reuse the GFP_KERNEL.

	HTH
		Oliver
  

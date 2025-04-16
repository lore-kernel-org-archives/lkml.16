Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFC62DFA42
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744842073; cv=none; b=iXc6Hg9KJqtG8p4P7SJyszVLa/e6JW5i3hdpBdBw6BGNr8mZTlfRlagD9eELc0VBhymX75DDCuyFnBETd2MmKWKK3+K20lYb9oveli9yrSu9/ohTdj16ypJftVA/Ig3CO//OFgEaFZOxiEpcgJi5hA6YZlghmkW1tYWZ8MuTD74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744842073; c=relaxed/simple;
	bh=e7i/V3+ouimCmauYXKzDuRbFNKnNTeruFM8v9AMc14Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iaBuWtM7GUHwP192ECvtMjP9YA//nHswstWBJvH2csBKd9sGDMiLIDhOvM50sdLdh01dPnm9Q5joex9CSrl3qWqdc/o9in6SN8tMY/0jkgTYxX0YbKX+orEKpZk3DiBP3RN4/ZhU5g4D6orCdIjRVRfxD0g5w3wLvnvX9t9cF5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so9741455e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744842070; x=1745446870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sBU9fsVCp2RxfNWj3+AQZ+ZAC87wHzTpqjy8b9Sqqmc=;
        b=qjr0I5OI91vNVOx8/0cYOqJBg0nyXETr4hUNP3WIDnH3JeYErugTne3nxLdPqL+SVd
         XPa1pm6PS8IJxt3aCymeF9hDj8JCYgRgd1yhO1xubhAkjeusk5ZD6wQXCRCpORXDzgP3
         ayXWjFA8i0qQvEaQNKGdHyrBNbVH32E9GT+TnQUkYEQGRrC6S9VCac15NjoeKYFU12bH
         y/vaEgrvKCqWlkesTU7/2SPwDtQfFwqEVsPdTwCr8L7HXWPmeqBJiu4AnrqMxPv5Sjuw
         Wat/WlarUAMQOBA7GxW1gzaWADaTZ8Q10CHLGbCAldtcMWiGMRLrmQNbca/LpLYdr1wJ
         AuCA==
X-Forwarded-Encrypted: i=1; AJvYcCVPtVre3bwYw6QKLmMwrytnExcEqNowta8B/46UecGx/Ljm5rD9Iw+NGQs2RxZxb3bWslq5wex+VhnYjeM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPDY5brZqFw92oAhvOfn4gcY5C59KKpdKajU+QFfIfP0VaqQnZ
	jDPC4xIiNKV10rd98txhsdN8+L+O6vrKUT25UGa8SxRji5iBNc8Y
X-Gm-Gg: ASbGncsHnTfJraYY35FwKjz8Z77nLrHKPaSPvxyDk+kaI6QRLXmiPKDmju8xNv9A/I9
	DzNX7iCj18cfsfMNsEKBvrmVleG80R+2V/77ULQgCTPntrEUq8uMUzXtDGN+uGZoGgT4pxlTy3n
	Zflbvo3fspbISf4pWg+sHn/8HkuBOTQEt6rKKTeayLlle/eDR/SwqnxxZLk942y4NlODrT1eh+8
	jdtPauJvFD7LKxRoHaw44UkiIOpurH8C2z5qOpcizSKcK8hyDqKoRazYSmn58vmnE8n+nT9nF+G
	1L3RNT1IU1wmnw68z+WKUfgT1u3/a4JL4j5c6skG6xWZxfVRGgq02U+Z5Ei0omAjyPrh+aYd
X-Google-Smtp-Source: AGHT+IEYkoHv7dSpAH5J11NYvxRBnI1mFdebJS/ofs3BZrfaNbkQ6ndNhKLzj9LpJo7A4mLdoaB1Aw==
X-Received: by 2002:a5d:64a5:0:b0:39e:e3c5:ee7b with SMTP id ffacd0b85a97d-39eea09ea40mr342538f8f.5.1744842069841;
        Wed, 16 Apr 2025 15:21:09 -0700 (PDT)
Received: from [10.10.9.121] (u-1j-178-175-199.4bone.mynet.it. [178.175.199.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f2b9dsm32305355e9.21.2025.04.16.15.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 15:21:09 -0700 (PDT)
Message-ID: <df6cd26e-551a-4bc1-bdc6-9c715e502aa8@grimberg.me>
Date: Thu, 17 Apr 2025 01:21:08 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
To: Mohamed Khalfella <mkhalfella@purestorage.com>,
 Daniel Wagner <dwagner@suse.de>
Cc: Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>,
 John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <20250410085137.GE1868505-mkhalfella@purestorage.com>
 <6f0d50b2-7a16-4298-8129-c3a0b1426d26@flourine.local>
 <20250416004016.GC78596-mkhalfella@purestorage.com>
 <3dad09ce-151d-41fc-8137-56a931c4c224@flourine.local>
 <20250416135318.GI1868505-mkhalfella@purestorage.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250416135318.GI1868505-mkhalfella@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/04/2025 16:53, Mohamed Khalfella wrote:
> On 2025-04-16 10:30:11 +0200, Daniel Wagner wrote:
>> On Tue, Apr 15, 2025 at 05:40:16PM -0700, Mohamed Khalfella wrote:
>>> On 2025-04-15 14:17:48 +0200, Daniel Wagner wrote:
>>>> Pasthrough commands should fail immediately. Userland is in charge here,
>>>> not the kernel. At least this what should happen here.
>>> I see your point. Unless I am missing something these requests should be
>>> held equally to bio requests from multipath layer. Let us say app
>>> submitted write a request that got canceled immediately, how does the app
>>> know when it is safe to retry the write request?
>> Good question, but nothing new as far I can tell. If the kernel doesn't
>> start to retry passthru IO commands, we have to figure out how to pass
>> additional information to the userland.
>>
> nvme multipath does not retry passthru commands. That is said, there is
> nothing prevents userspace from retrying canceled command immediately
> resulting in the unwanted behavior these very patches try to address.

userspace can read the controller cqt and implement the retry logic on 
its own.
If it doesn't/can't, it should use normal fs io. the driver does not 
handle passthru retries.

>
>>> Holding requests like write until it is safe to be retried is the whole
>>> point of this work, right?
>> My first goal was to address the IO commands submitted via the block
>> layer. I didn't had the IO passthru interface on my radar. I agree,
>> getting the IO passthru path correct is also good idea.
> Okay. This will be addressed in the next revision, right?

I don't think it should. passthru IO requires the issuer to understand 
the nvme
device, and CQT falls under this definition.

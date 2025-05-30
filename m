Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F22FBF0;
	Fri, 30 May 2025 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748618887; cv=none; b=hPN3zBRi95wbn+95OzOu6evB5ubl8XyagAlbZG3ZagxRAYvf6cJeyec4GojdT+ZuHd4JXXOwSaWew6Q7fh0gkaJVfkwrg85pF4qrPyQYN27z8NDSg4X8/zjDZ0pkTCL0G5H1cayh3IKMK/Nz6qmwW5Rsma52EfdEDteLVp0GNFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748618887; c=relaxed/simple;
	bh=bqbIQZx7tbU8Dq+hbFk5qs1YF5oVdFEw6SaA3RZwkqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GT/QzXInxQR8rOXQ2jwtscUG9UINs4ARwlgeCx+5iFGDQyKqv4zyMu43PC+MKKUJ2HiAyQQjk6BzTrwBvkJQDbTIRpyKIpw9EsGPhRrDUa425aVg9gHK3lfN8356VZ/hGTHJis8FoFA4nkzNGZoWPbdOAF1fTlshKErD/U+MZcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhpL26uJ; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhpL26uJ"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-40356cb3352so1393166b6e.1;
        Fri, 30 May 2025 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748618885; x=1749223685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fq2KhMBOr60BNuiq4EFnjEPZcEVfqIe+cd1pNBKZpOY=;
        b=OhpL26uJ9mLpggHwdF/uANaIz5VVOf/DMlsXckLOAHgfmPRSSK+ayMVIJkCBuV2Oul
         T18mkg58pSRdNT4oukSE/9ZXkwPZjslRAy5lweq6/prplfpu3rxohLGHfSQLNwwpMxbX
         xh50EXdRC6MgBqToEtE7qMk9/sDlyJj3iDFMpCTACqARGwhoXkzSAomNLbiNJDZytrP0
         Rj4scuW7ha9gyuuNsi7bMORsXpunrN9exYpuJYGdu1YSFI7Bs1OBpQ6Oyl19hPJSqm1R
         m0kU6hZq9zub31kQq4BwHosPe6aX2SOSz8B5Xu7uBT4ZYR4AX56BZj+4xf1QqXTEmmbV
         meGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748618885; x=1749223685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fq2KhMBOr60BNuiq4EFnjEPZcEVfqIe+cd1pNBKZpOY=;
        b=tytq1Y9LlFr0G8k1nkt1nVOCrdQRYvwcR95bWdAIOf5w2muM0HVWyO9X+ByC+JpI9N
         9q0M7ItALZ8/v5nma0QiyGStI5UhIuZPEiZVdc1e6CZApkvkN1f6RChlU8S0YFlP/RPQ
         4tcFH9ljJYSofi9v/4d38nKmBbdLxXBjAJTCGFeb9oJ3OoaWcRTpZHTXNNfh78oJJImL
         Q2+3I0laAaMwkaqcqjZfNkZS2CPp30SRHdXjYDWGX1LdteH8tkwFlN4shTLnSVb9SuWv
         aHSRLAaqHiusZxQMuNP+diorgmt6KjKr6HsUurB37uoZ/rkmr9j46tj+74lmf0gCZU3O
         aQKg==
X-Forwarded-Encrypted: i=1; AJvYcCVofnQ/xdgSvQnN30oyYkIimdxT8HdGUmMMI0RAWzSJzkX7Lbw4pzwpGnI3SxlLwiPcDB7PvqL8nBw6GPJmuZXhdfT5@vger.kernel.org
X-Gm-Message-State: AOJu0YzxzTR4SFOerWZHtyl7NiK7Az188oScIYJ1k1xjH89m3ubsHdxJ
	+zhzgkn6/i5nJBEPjGLcuFVzAdUye0p/NWvJaTr1c9RF/XIsytfAlvxFBoU5zQ==
X-Gm-Gg: ASbGncuEsPPEvNAPT5mmnTU8H+MqzNKT8t1TtGSU2zwi+2t9Ze83BXUjc2IRNiWLhst
	xOlbkAFkhmRPQogCFfnxTDuif5MWI5+61uqNJlciQB8eVJo6IYwxAsrXl2dOvq1WeuaB4ecjHy+
	Y/LFytag/pEd7cHq8R7F7tM+/6HvcEk6o6+cP6Vx8/6+L21pZgJ9ROXbPTjwV2UrZkr7dqX2f91
	PPhFnmISJT5FqEa4glQ3ezlmQ83e8RfpH2JhPFXJjTpXIZU5DXfXUT8Wgf8QcFguLCgQyzp0/3O
	SKlnjtcCmPyV49Okywd9BzUn+tJLf+ovSNH4bYyEqNKcbXNCxn/u0YNpZKVnVgFU8/GWFz+6eQy
	pi5328QFJPmQyb9VxFupfRwKTtBcTmuoSsojn
X-Google-Smtp-Source: AGHT+IHKkhsy6Uz1bY8BQdc1ov61XM/m9cZ1jC2Xl3IOfyNQ2Ger8hqyJv6NvLF39lVR3lajl+s58w==
X-Received: by 2002:a05:6870:538b:b0:2d5:f8f:56eb with SMTP id 586e51a60fabf-2e9210f13e5mr1829335fac.2.1748618874235;
        Fri, 30 May 2025 08:27:54 -0700 (PDT)
Received: from [192.168.1.7] (syn-067-048-091-116.res.spectrum.com. [67.48.91.116])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e90681bcc0sm691268fac.23.2025.05.30.08.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 08:27:53 -0700 (PDT)
Message-ID: <8a8ff0b4-49a9-4b07-abbd-243b754bfc0e@gmail.com>
Date: Fri, 30 May 2025 10:27:52 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] platform/x86: dell_rbu: Stop overwriting data
 buffer
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 platform-driver-x86@vger.kernel.org
References: <20250529202758.8440-1-stuart.w.hayes@gmail.com>
 <20250529202758.8440-4-stuart.w.hayes@gmail.com>
 <ad0301a0-f45f-900a-028d-dff5e08b9525@linux.intel.com>
Content-Language: en-US
From: stuart hayes <stuart.w.hayes@gmail.com>
In-Reply-To: <ad0301a0-f45f-900a-028d-dff5e08b9525@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/30/2025 3:03 AM, Ilpo Järvinen wrote:
> On Thu, 29 May 2025, Stuart Hayes wrote:
> 
>> The dell_rbu driver will use memset() to clear the data held by each
>> packet when it is no longer needed (when the driver is unloaded, the
>> packet size is changed, etc).
>>
>> The amount of memory that is cleared (before this patch) is the normal
>> packet size. However, the last packet in the list may be smaller.
>>
>> Fix this to only clear the memory actually used by each packet, to prevent
>> it from writing past the end of data buffer.
>>
>> Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
> 
> This still doesn't have Fixes tag? If it writes part the buffer, there
> certainly should be one in this one. Did you perhaps add it to a wrong
> patch?
> 

This fixes a bug that's existed for the life of the driver. Should I use 
the patch that introduced the driver for "Fixes:"?

I don't think this has ever caused a problem, because, as far as I know, 
the Dell BIOS update program is the only user of this module, and it 
uses 4096 as the packet size. Because the packet data buffers are 
allocated with...

	ordernum = get_order(size);
	image_update_buffer =
		(unsigned char *)__get_free_pages(GRP_DMA32, ordernum);

...this will always allocate one full page for every packet data buffer.

I just happened to notice that the driver could overwrite the end of the 
buffer for the last packet if a packet size of more than 4096 was used, 
so I thought I'd fix that.

>> ---
>>   drivers/platform/x86/dell/dell_rbu.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
>> index c03d4d55fcc1..7d5b26735a20 100644
>> --- a/drivers/platform/x86/dell/dell_rbu.c
>> +++ b/drivers/platform/x86/dell/dell_rbu.c
>> @@ -322,7 +322,7 @@ static void packet_empty_list(void)
>>   		 * zero out the RBU packet memory before freeing
>>   		 * to make sure there are no stale RBU packets left in memory
>>   		 */
>> -		memset(newpacket->data, 0, rbu_data.packetsize);
>> +		memset(newpacket->data, 0, newpacket->length);
>>   		set_memory_wb((unsigned long)newpacket->data,
>>   			1 << newpacket->ordernum);
>>   		free_pages((unsigned long) newpacket->data,
>>
> 


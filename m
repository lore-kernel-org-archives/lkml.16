Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CBC28981F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847351; cv=none; b=MWTGyDy8/HxeonebFORjqyd5E4dpAG4oz2i21xgqzHGMdleVh1PQEUk4Qpg2FhnmMOxG9qsX3ayt4MzwbjtcAHDJ3bobyQFE+2efVGxApxm1jdwTm8nbdj807kcjGmYUqfJlP/mMuVm8NKgsF4V6ji5+9B24Kkhu98SlghC/mYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847351; c=relaxed/simple;
	bh=oHrDHbEvPsolEmPrxogf51WMDw/rryB52d1YMmpuzkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JqFKMhtYmNjURsmvsgIRITeDZ+qn7flgJD7eDyK8PP2IBQaOu7l4ey72qo98bvqU6ukWSzxBb3AhkQYbtssP79rnqIloFbr4Vm/AbNeCs4FLH/+DH7PNLe+DXGDohkQ8RgecnpmC89ZLgONXLrcKU77vrU4FrUWqxaQ3rsiWBsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dPseuRIN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dPseuRIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750847349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bOtjedNb3agliExh91aNdyGIpCUXRPaSeetVuHew1xQ=;
	b=dPseuRINfl/jmO0n9frF76hK+uMR7cCb8AP8nJSyVAzOwlrcy6J7I5DDJqOZ4iau9QQbZA
	fhHtl70yZDBxTlei4yRPOorHBU8i7HdPmyFihiLrX12ZoVuktA/OVgmoGj2OGrkqB0Bqvj
	/sOCL+ItzMKnjqlelVD83gf71CJXY9I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-G5sFCa4GO3q7WsOQn8b3Ug-1; Wed, 25 Jun 2025 06:29:07 -0400
X-MC-Unique: G5sFCa4GO3q7WsOQn8b3Ug-1
X-Mimecast-MFC-AGG-ID: G5sFCa4GO3q7WsOQn8b3Ug_1750847346
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a56b3dee17so384503f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847346; x=1751452146;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bOtjedNb3agliExh91aNdyGIpCUXRPaSeetVuHew1xQ=;
        b=LdWA+qtO3PzKalaqEJS6bbag+0Yexw+IG+S4mmrbDL9gw6Km0CaECcDC7mAsgJp5Qk
         DiZbv3UDvNE5yGG8zU/oApx7kjKH+viWXB1NeM+pM9tragCpJqPp1vJOywWG0UXwynxA
         pnbuf4ucFnMg71W02CiW7EwICqSsrYSwoVcXLgoloStVYw5rQmzzCvg+ljxf4O9bxdzD
         o8aFO2bRrYcbtVpckbZm4RPfI0bTdqJfEOQfucZoMrFtKd5k7lM1mqRx8D9TpFF0Ar8x
         3Vnzh/SjTV0P+4/hVRxbxGkuuuW7VAat1oVQhrdnhK99OKhVxAbpwEmoX07A7R4uxmxR
         bgAg==
X-Forwarded-Encrypted: i=1; AJvYcCW83ueKYAJuXgzoGb5rDohTxN7AAFL+CG+NObglQ/g5cPtQqmXoIMvk+T4z2S8o9GZ6OP2bT8pkYOHfp8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPPodCSi3Yh4hUJ3ovpJXosIbY+ydONf4mkC2TjHD0OfMZKZPo
	FL66rNV7Y7Xj2yn7/ec123R9MqNkF9CiDmmt0qPJTKxOkZ9j5cjnFjjdFgQpCrRZA7d8CRR03w0
	NSyUh4Kys0L7OSp8hJw5K4FsP74XKltBb56aVnK80E81YLVobLDvXX3BY+uksEFu9QQ==
X-Gm-Gg: ASbGncsb0AQPQeYS4HiXMZ/qIXkwVwQHwiN5xHI87poSiqvGx5CeJUWGSmNYNjNSOBR
	W0mCOL47swITrAZSSVXzfywgPUKLjkr8jEdfISdnrmXDqUhLjXY3VOSNQk8vI4nBaRD4eLsiEB6
	6HcD2Yj4ukwwfB0+GZfgCuBioG/RUcqyF7CRf9Up7e3N2L6nMec/X3mjRNCANf6dywMo/zpbOem
	h8CDqdBihm6RwIRp4VXVbnB7+r4sM4AyTT0VKDHzeKWy1q4fTu5eD+/VE7Z2Gyrr8V5bv4NdU6Q
	c6B0Mg7EOamuWknT7sMa8E/IyvXIA0kdE+nMAYt83XT8lqXL4RHDPg==
X-Received: by 2002:a05:6000:4024:b0:3a6:d7e6:f281 with SMTP id ffacd0b85a97d-3a6e7206d4fmr6018945f8f.22.1750847346445;
        Wed, 25 Jun 2025 03:29:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZgXBZLpTCm0txZS3WEHRru9TINqUL4GsR7SzFKebNlcNGIa5fR4Zr/Ulyod36CLaPBpQ1zw==
X-Received: by 2002:a05:6000:4024:b0:3a6:d7e6:f281 with SMTP id ffacd0b85a97d-3a6e7206d4fmr6018912f8f.22.1750847345991;
        Wed, 25 Jun 2025 03:29:05 -0700 (PDT)
Received: from [192.168.3.141] (p57a1abde.dip0.t-ipconnect.de. [87.161.171.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538237ac2csm15292705e9.38.2025.06.25.03.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 03:29:05 -0700 (PDT)
Message-ID: <7d1c8c0a-1eb3-4919-9834-9b705c2ae7c8@redhat.com>
Date: Wed, 25 Jun 2025 12:29:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Hugh Dickins <hughd@google.com>, akpm@linux-foundation.org, ziy@nvidia.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, zokeefe@google.com,
 shy828301@gmail.com, usamaarif642@gmail.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <f1782ae5-c1d6-4f46-a676-666505990f4d@lucifer.local>
 <008ec97f-3b33-4b47-a112-9cef8c1d7f58@redhat.com>
 <01d679f2-fd64-472c-b9dc-ebe87268ce82@lucifer.local>
 <a16071e5-ae97-4e1a-9df8-f353f6b319c7@lucifer.local>
 <23b8ad10-cd1f-45df-a25c-78d01c8af44f@redhat.com>
 <decbae07-0c84-4379-9f9d-6e2bd6dbad6e@lucifer.local>
 <a877b2b7-382b-498b-9b4a-188a0845d630@linux.alibaba.com>
 <ff3cc6bc-dd40-4b6b-a293-eedcc7c8eaf6@lucifer.local>
 <37fc3553-0d5a-4bdc-b473-cd740d47598e@linux.alibaba.com>
 <5de8ca8e-f293-4bfc-b49d-6e2a2e049f2b@redhat.com>
 <eb0c8d93-cd9f-4b57-a0f0-d30cdb5b31bc@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <eb0c8d93-cd9f-4b57-a0f0-d30cdb5b31bc@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 12:15, Lorenzo Stoakes wrote:
> On Wed, Jun 25, 2025 at 12:07:12PM +0200, David Hildenbrand wrote:
>>> Yes, I don't mean it will prevent madvise_collapse(), just as you said
>>> that it could be problematic (it's horrible to try to collapse 512MB).
>>
>> Well, assume you have a VM at that is 2 GiB and could use 4 THPs. It's
>> stupid, but there might be some selected use cases where it's not completely
>> stupid.
> 
> I guess we limit the stupidity by MADV_COLLAPSE working on a PMD-aligned range
> so it'll be a no-op for an attempt to collapse 2 MiB (unless I'm misreading the
> code).

At least the doc says: "MADV_COLLAPSE will automatically clamp the 
provided range to be hugepage-aligned.", and skimming over the code that 
seems to be the case.

Which makes sense to me: never collapse outside the provided range.

So if someone would ever specify something smaller (e.g., 2MiB aligned 
range with 512MiB PMD size) we could decide to collapse a 2MiB THP there 
instead. Right now, it would be ignored.

Guess the rule is simply to not collapse outside of the requested range. 
Maybe that rule can be used to support collapsing of smaller THPs in the 
future as well. Maybe  (can of worms) :)

-- 
Cheers,

David / dhildenb


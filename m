Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4535FB95
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319111; cv=none; b=UsOsxaRp9oDHUkg56wOYZNuEXBebwFzOPzuIiXwEVJVo1Fd3/ZGFdHnK+QKqt1mo+iEVQeeqVFZeCtp+qxDFXpPk950t41W8IQu3xaiTTrRWvFV2nQ4cP+B5bRDvj13DbIb71IimAtSJDLhrgExkVsRUWTAsZCsjG9YaaC4YPlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319111; c=relaxed/simple;
	bh=f8CujOn9a3NwEqmlC8+jbRgg4u2YXmBT1V0UiDyiXmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tv1VRUVY4vZ/Y34ykzttMlwGZphIwsD1o0VJFNhj8RGZMgWXpi6kAp5a1VI62+xxQNgLiXVk5flwyRPBCf0RZePh89oD8MdIS35pjBt5leZ5kHkHpsX4zKSlFWjXpBwn/g184EBfFW6hCX23GrlqMUG1Ek76PwjKzBkRf5JINhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EgXfELeg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EgXfELeg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745319109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KRA5bV5rifNRnWCQIz7BZDCTcF380tJzXilVRO8+cZ0=;
	b=EgXfELegepESVviGy7WdddcMHQe5yhErFRFpsvR2Or6sx/S6S8jNE5QPVVeEKBOPF2/bsE
	K9cRlT3hy4Dw0p9oBqO3Ztu4jYCUhJ41tGc0m75RGT+QAx/nMYDKoIEiqSBvt1Wt3ktxST
	aU8taSEdhmZhKoXIdsjOTMrwMEV3xUE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-z5qoBByVPQuxwPzApr4zPQ-1; Tue, 22 Apr 2025 06:51:47 -0400
X-MC-Unique: z5qoBByVPQuxwPzApr4zPQ-1
X-Mimecast-MFC-AGG-ID: z5qoBByVPQuxwPzApr4zPQ_1745319107
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39131851046so1412171f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745319107; x=1745923907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KRA5bV5rifNRnWCQIz7BZDCTcF380tJzXilVRO8+cZ0=;
        b=soVb9XAf/NSTwSd8W77XE2Mi0WAy8v9Uilm9oeIFurSNzZJS2LtQ0gok62QqMLrvQp
         tnLAWlZpWvHWAvcGrJ4z0hk9x+CI6/hZUsw9CG/wkBYFskjlvwXjQv3LRPub8QlOpRF9
         uwKEW3VoCpr4HEIiURxnzG0O52pRL4Wm5H08ZHZNcjTj5gsK/zmktJULaYiEHVPR6btd
         SmxlZp2UKEodApiTacsdX3f2OgaFyEM32wm6q9+sQv2vZaVgXyeQGej4DBjwbJl7SHRV
         h2hM0Mtz9oDNQIrB3KU5l/4VgDIFvAqvj4uO6PqwBwZAu3axHez8RIrTBYSM0nVLwGN2
         V9WA==
X-Forwarded-Encrypted: i=1; AJvYcCV0x+gIG/QWqJiEL07r9cbOs2etN4uPd9BMlQNGkrEVf6k9hsj3/+Iw4tc0n+CM/tVdQNvU9222g8zTJsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU8gTeF+8XrgSJ1QJw72wvYjxN0RzHakUznRk2pClD4t3owMuL
	ayxJwKEt2yMBgjn4zuAS8FBL7K8c0BOFySnGUiyx1vJAri9IMa40wxIPKdqPoeCzXaA39qszY/b
	rPx8tnyJlr6PWAD2ADVo5KXjKPr2mKQ4i5Q9YapHEeiWUTR14bHL49bUsSed63A==
X-Gm-Gg: ASbGncsp0qqjeoCo125B/t5LsXHypwsvRGRcxv6rp/AQuaTJ7k48yBZwEEdGc+XTDoZ
	v01Aimw27TleyJ+ApjqqjTVCbcsANaUxOSazcR5AEP9s1D7OmPpDydvOxXHNuLbh8qW+PPMvGpo
	N8MKIpvtGUTNw6GEp6Lwyv9UQup5Pl0CHoMOvgrIe+BrlqoJtiZmYcYvX0OllfA8ZfoPxMrWgWe
	qEsbWsU6ESWL10yCXZ92lCXTHiJeX2FTvekYfLDDHfY3RLiYKlUuhvYbtQp8wAl1izgutKB716R
	YD0pbzkKBed0DGel+mSBK8cR7CsV6o5bMVXS
X-Received: by 2002:a05:6000:2287:b0:39c:30d8:ef9c with SMTP id ffacd0b85a97d-39efba43f4bmr11633030f8f.24.1745319106716;
        Tue, 22 Apr 2025 03:51:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpUJmmq8/J5hmfMlspvOYibRDDGn7vOdK0BzUJU6LgdyFNIn+TvucaRUNfpOU0/IiW6OiDgw==
X-Received: by 2002:a05:6000:2287:b0:39c:30d8:ef9c with SMTP id ffacd0b85a97d-39efba43f4bmr11633004f8f.24.1745319106319;
        Tue, 22 Apr 2025 03:51:46 -0700 (PDT)
Received: from [192.168.88.253] (146-241-86-8.dyn.eolo.it. [146.241.86.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4f06sm15077552f8f.92.2025.04.22.03.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 03:51:45 -0700 (PDT)
Message-ID: <e4c52eb0-9d3b-4c9a-879e-bf796dbd479f@redhat.com>
Date: Tue, 22 Apr 2025 12:51:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: phy: microchip: force IRQ polling mode for
 lan88xx
To: Fiona Klute <fiona.klute@gmx.de>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
 UNGLinuxDriver@microchip.com, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-list@raspberrypi.com
References: <20250416102413.30654-1-fiona.klute@gmx.de>
 <fcd60fa6-4bb5-47ec-89ab-cbc94f8a62ce@gmx.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <fcd60fa6-4bb5-47ec-89ab-cbc94f8a62ce@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/17/25 11:05 AM, Fiona Klute wrote:
> Am 16.04.25 um 12:24 schrieb Fiona Klute:
>> With lan88xx based devices the lan78xx driver can get stuck in an
>> interrupt loop while bringing the device up, flooding the kernel log
>> with messages like the following:
>>
>> lan78xx 2-3:1.0 enp1s0u3: kevent 4 may have been dropped
>>
>> Removing interrupt support from the lan88xx PHY driver forces the
>> driver to use polling instead, which avoids the problem.
>>
>> The issue has been observed with Raspberry Pi devices at least since
>> 4.14 (see [1], bug report for their downstream kernel), as well as
>> with Nvidia devices [2] in 2020, where disabling polling was the
> 
> I noticed I got words mixed up here, needs to be either "disabling 
> interrupts" or "forcing polling", not "disabling polling".
> 
> Should I re-send, or is that something that can be fixed while applying?

No need to repost, I'll update the sentence while applying.

Thanks,

Paolo


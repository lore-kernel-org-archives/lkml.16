Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A922638B
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748594387; cv=none; b=eUnJWRI+GNgvxZ6If5gDagurUeggpKWewYRMGu/ZRbaC7MuuyaK5v7gsK8Bk5uBjJa0EtWhVmQRpuT8Tc+2+LDhYzjOassnKaHTvCfY5RAcuH9I6EF7tstGVau5GSn/9/SG8p2+SIqn/5LexzjFsJ2SPPvOoQshOQqvJicUMkSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748594387; c=relaxed/simple;
	bh=kOYiuJU7KnqqvHk9yJXocj5CuJTq0t89rYQYbk4he44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=slmMjBbY29EcOfXkeNmxXldIIKDCGxvz+yDaVpJENGWCBFBrZRJGdQYLa/FLsQQRgFI0T5YoaMDd9QnP0tbXD2TF4XQlJMzD2HEK8gNvmq3qLJgoVY3BrQAcnuKwbhtWM31yCazuV3Sez39N+e0PE5Ogx9aawe8y2iYlfpUZq7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fEmDc43C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fEmDc43C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748594384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LYjEslniOeni4abE+UsHa0UZTcNVVAzwzXeh5mikH2Y=;
	b=fEmDc43CWJeyJgwux7rQuZTTZ0s9Aap7M9hf1hK2fOiYHtfhvAFNbSvzTn7Od2/ahFc90m
	REy8CI49pFFrPRcpxHuMepICki4VZGFTorjaDUAc8eWdADhc9mh+Bf2HNmDeXmRMrN63Qz
	VXlhk0n7kzIdckJx5f2a/6Yyvb8P/y4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-io0KTozpM3Cc9BXJdZ6eSg-1; Fri, 30 May 2025 04:39:42 -0400
X-MC-Unique: io0KTozpM3Cc9BXJdZ6eSg-1
X-Mimecast-MFC-AGG-ID: io0KTozpM3Cc9BXJdZ6eSg_1748594381
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-441c122fa56so9459595e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748594381; x=1749199181;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LYjEslniOeni4abE+UsHa0UZTcNVVAzwzXeh5mikH2Y=;
        b=CZWUHBtvShaRF2XrhD8jyED3RV9IBK7JiSQY4INMiVG71X/kIW13AmGxUJHXB6nDnu
         4fW+uxtW/LkiY2DKw3C3+Poa6FKcNPDaMXcmSUG6+0JynUwugKeGADbCC98sOdkjXXS8
         pwku4fakITZTcelvn1CWdGlUoTNn3SOTGfKUwtPzNNZNur2v+imqq3KyfwHHX6j9jvMc
         2ZrPFT7YIBOBXiHdxAq+wkvyi94vLd3JcqpumkbrQh+/xjbjj2S4aXVcb5Ivwwv7SRv5
         kb7+voSuC0zaYYOaILmdU2SSjY6GoUanAxbx7JBixTrtP4jeTIi8i0KzoP3OCdIYKpZM
         Lphw==
X-Forwarded-Encrypted: i=1; AJvYcCWg86XHPD1sUa7bQM13kYc7IUICEyLswHcak3SEIxC1AQp7g0ZYc0DgXxX+5qYaSvjbdk/fUdD4gj/lfBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHaSc8qxbeUr5aiRBZw1HvpH6J+FeCNC+NwNwLvhZTyu/gPlmM
	YRoQ7qdt//YdFNweAK1tqI8zeYiXif5dIvGXbItu5HKYTqAqJXx+r4upKmpj4VCSmhH90A+5Prn
	ZhJDceuSr8ryu155J+jbF3TyURfDS0ol31INRJfjAzcYkqVcWlbUhUOcS0XtRCpud6A==
X-Gm-Gg: ASbGncu0w6tERuYRqNBaWd7i63IYZVP+vAVi3MJ+iVBvNYxZ4xCtEO3PA7xUbJuPOgu
	QEKTA5TrP8jPforXYwDYNwCfX8D0DSEbg9SC7qbursF1aFs9a3CR3R10mF4fg1QJB3Biv5gqfSm
	pV3tjw/fI12lBRGjDU1HCuxXy/dpht/zP6C8lEd0FCJdkrnlRKDlYsQWHx8TLTXbIaisO403qSI
	wvdke25/9Siv6fvtHnX6gVoD3CE4glNDLPtS0emZFhvCtQemPaMtMSpeMXk5Sjin9e35thneKSl
	MSHwnW22bcGoaQn9EGy/tN61yabCgXb6Mirzk4kAeTGOlAUqZvYSG1WBs4ohqj+k3HVC7wK1Fvt
	GigPDB32ozwU8EpHcnaMkr0pI4u8+m0UaZvoP+zTr0G4I/IBETQ==
X-Received: by 2002:a05:600c:5248:b0:43d:ac5:11ed with SMTP id 5b1f17b1804b1-450d654fd80mr23207635e9.24.1748594381473;
        Fri, 30 May 2025 01:39:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLznW91MGwFXiEUDCSFpEg0/1xmiD0avrK6gzN2jVg47uZp4IbwOpwG2qxrhw1ng6HInkPNw==
X-Received: by 2002:a05:600c:5248:b0:43d:ac5:11ed with SMTP id 5b1f17b1804b1-450d654fd80mr23207475e9.24.1748594381061;
        Fri, 30 May 2025 01:39:41 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f22sm4155072f8f.43.2025.05.30.01.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 01:39:40 -0700 (PDT)
Message-ID: <e0f7fc1e-2227-4c6b-985a-34a697a52679@redhat.com>
Date: Fri, 30 May 2025 10:39:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] kdump: crashkernel reservation from CMA
To: Michal Hocko <mhocko@suse.com>
Cc: Baoquan He <bhe@redhat.com>, Donald Dutile <ddutile@redhat.com>,
 Jiri Bohac <jbohac@suse.cz>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
 Philipp Rudo <prudo@redhat.com>, Pingfan Liu <piliu@redhat.com>,
 Tao Liu <ltao@redhat.com>, linux-kernel@vger.kernel.org,
 David Hildenbrand <dhildenb@redhat.com>
References: <Z7dc9Cd8KX3b_brB@dwarf.suse.cz>
 <04904e86-5b5f-4aa1-a120-428dac119189@redhat.com>
 <427fec88-2a74-471e-aeb6-a108ca8c4336@redhat.com>
 <Z8Z/gnbtiXT9QAZr@MiWiFi-R3L-srv>
 <e9c5c247-85fb-43f1-9aa8-47d62321f37b@redhat.com>
 <aDgQ0lbt1h5v0lgE@tiehlicka>
 <a1a5af90-bc8a-448a-81fa-485624d592f3@redhat.com>
 <aDlsF5tAcUxo4VgT@tiehlicka>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aDlsF5tAcUxo4VgT@tiehlicka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.25 10:28, Michal Hocko wrote:
> On Fri 30-05-25 10:06:52, David Hildenbrand wrote:
>> On 29.05.25 09:46, Michal Hocko wrote:
>>> On Wed 28-05-25 23:01:04, David Hildenbrand wrote:
>>> [...]
>>>> I think we just have to be careful to document it properly -- especially the
>>>> shortcomings and that this feature might become a problem in the future.
>>>> Movable user-space page tables getting placed on CMA memory would probably
>>>> not be a problem if we don't care about ... user-space data either way.
>>>
>>> I think makedumpfile could refuse to capture a dump if userspace memory
>>> is requested to enforce this.
>>
>> Yeah, it will be tricky once we support placing other memory on CMA regions.
>> E.g., there was the discussion of making some slab allocations movable.
>>
>> But probably, in such a configuration, we would later simply refuse to
>> active CMA kdump.
> 
> Or we can make the kdump CMA region more special and only allow
> GFP_HIGHUSER_MOVABLE allocations from that. Anyaway I think we should
> deal with this once we get there.

Might be doable. When migrating (e.g., compacting) pages we'd have to 
make sure to also not migrate these pages into the CMA regions. Might be 
a bit more tricky, but likely solvable.

>   
>>>> The whole "Direct I/O takes max 1s" part is a bit shaky. Maybe it could be
>>>> configurable how long to wait? 10s is certainly "safer".
>>>
>>> Quite honestly we will never know and rather than making this
>>> configurable I would go with reasonably large. Couple of seconds
>>> certainly do not matter for the kdump situations but I would go as far
>>> as minutes.
>>
>> I recall that somebody raised that kdump downtime might be problematic
>> (might affect service downtime?).
>>
>> So I would just add a kconfig option with a default of 10s.
> 
> kconfig option usually doesn't really work for distro kernels. I am
> personally not really keen on having a tuning knob because there is a
> risk of cargo cult based tuning we have seen in other areas. That might
> make it hard to remove the knob later on. Fundamentally we should have 2
> situations though. Either we know that the HW is sane and then we
> shouldn't really need any sleep or the HW might misbehave and then we
> need to wait _some_ time. If our initial guess is incorrect then we can
> always increase it and we would learn about that through bug reports.

kconfigs are usually much easier to alter/remove than other tunables in 
my experience.

But yeah, it would have to go for the setting that works for all 
supported hw (iow, conservative timeout).

> 
> All that being said I would go with an additional parameter to the
> kdump cma setup - e.g. cma_sane_dma that would skip waiting and use 10s
> otherwise. That would make the optimized behavior opt in, we do not need
> to support all sorts of timeouts and also learn if this is not
> sufficient.
> 
> Makes sense?

Just so I understand correctly, you mean extending the "crashkernel=" 
option with a boolean parameter? If set, e.g., wait 1s, otherwise magic 
number 10?

-- 
Cheers,

David / dhildenb


Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76023C47B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 03:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751338865; cv=none; b=ADolT1vsg++yG133RPEHzNayie1HjcrH3fK8XUNBuLQXhDv9gPO1GkY3vzUKiUEsf9hGrzS9WCY47wb9I9BcDRqcNeAaObfazkn9rWqg1OokqpAWIWP4Tga7ckQePiNXQElvzJqTY22iLe/Gg9o3Cdsf/nXXKCeDpPCo8mQIDsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751338865; c=relaxed/simple;
	bh=lrh6GydZHS2KelZDBisrC75MBOjmu9SiEIrty6g5yW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d59CXm9/cm4M9AiCEZe5PdnQIdDaT3JZsFDNDwjTUhI1jyaSEzKavoVUZAddJhKiUnWB82s2ITtYl61RZhT7NEzof9/GNTo8xE1gZEtTdZyL8yD/IMNAx0kl2KD+9i4J7GM7ZUvJO6+mATNghnE09SGIpCX3NSXbXe0/mQ1u5Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=lvmVJ6yv; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="lvmVJ6yv"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3df30d542caso13644865ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 20:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751338860; x=1751943660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n5BV5J90GBuq79fEtEaJ4Lc8GonetLryBRSTpf1en0o=;
        b=lvmVJ6yvslYyCL54XZ6BMRgr+SKjcMoUuWi0kib/s3jaVZqXVf1y2xBdf5yFUxROiq
         AYSLodibNTyWtJAsMCeENaoDFIaMtHhJzBOXDbwXwe14aJP+mZ2c5qBpLdNgnnlKbMLb
         7Ni6rlqtjAfzRTw7yh7w3RXZb3mDRQv/azZce46NSkYPRGIkTAbjsviQrPYILPkTyFPp
         mp39NWtIdACwjcXJ3XtPrW+VWK28KLOT1FZRGXULZwZZnTynIeKXTdheBqjSr0VnZxp4
         /5GxZCePDO6B5tCUcY1s1XPtq22RG9UClvv1yGmj6a6w16r1OdIfKqXaja8aL9mvd3a0
         nm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751338860; x=1751943660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n5BV5J90GBuq79fEtEaJ4Lc8GonetLryBRSTpf1en0o=;
        b=RaHMjuCVndBhTJ/Mk+lW9F9B1Hz3KYrXSGCgo2Pm7wjkmgCqMhAoupgx7th/o9J34O
         aI+UekHBCqwzfwrnizMQdNFsCPdaid9xr5sJMS1jSnAdqd0zoWTgwBXRZm1I+7dgALEq
         nOw28dWZ9kp4MO9zm1njzr1uzkdGMnefMMZ+8eYzYtLetxNV3DPe0stl22CjSCzc9ssy
         pQqNWOpbC98oCv125WyQmA23uvDTY6Bcfe9ns9DvQv4MidmIMrd+SBaPWWlLz3ScbT8s
         uxKKq2BP+La453Ug92i2aQ3HIWnN2ZQ8STCBMQ8Ac2sd/y4IsHANx0E5QFRnz2xTJ672
         Iv7g==
X-Forwarded-Encrypted: i=1; AJvYcCV6bhjY3LNjeat9q6jOjFwr9J/a5at1D7I/ioSrSSdHcvd/qhQFZTDladpjgK+2Yi/mopLL8qN5JYaQr2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzFuWdv6PSSK05VUq1Tg33kw7vGpai/jr8fFwkXs0nbxRimr5m
	52jOLb83jj8qPARMTN0a/Cga5skhQyEUb4w/Vr/4zU8VqSHTCzGHbt65gq0Wgmr8fh4=
X-Gm-Gg: ASbGncvP4Xe2UEEbdaZfPzBzOoz0OehgJbPbGDVRVEMFruHhNOBo97Qvnmd8vppAKO2
	o2j+ctEnOZRrTI8LTMRbeEDejVBG+PNYSX0qrmPBmB8bfMtoznepwpM/XIzbRjdhVbpzSbrDYm6
	HQpqVf9PYhkuDbUwz1Omh094IX/jqZmgwfonrLv+PDc+yD0K/R5nZPcVKSEp7sr8/mkihCqce5p
	rsV2/8cvs6MjOGXMmmIOxrnXbXcYVYnB0+LVrOEVR9k7G+t7cRMqTxUQsBAGxh4J0srnwce95qh
	N7w6O8meeOfGKD43Vn2cUWiL7v/09w6Kuc59jHdz1j3uZ07lpUogdEVX0Us=
X-Google-Smtp-Source: AGHT+IECMoVni9yu+MrxxjMKqo4MuNDTM8fwrQriJ/C0gHDwrb4/VZzzTlf4RbL98n8J27on+QBTzQ==
X-Received: by 2002:a05:6e02:1a46:b0:3df:3154:2e90 with SMTP id e9e14a558f8ab-3df4abb9898mr192181025ab.19.1751338859860;
        Mon, 30 Jun 2025 20:00:59 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204ab5dcfsm2269225173.123.2025.06.30.20.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 20:00:59 -0700 (PDT)
Message-ID: <c28dd90a-3777-49fa-a662-32c61da22860@kernel.dk>
Date: Mon, 30 Jun 2025 21:00:58 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] brd: fix sleeping function called from invalid context
 in brd_insert_page()
To: Yu Kuai <yukuai1@huaweicloud.com>, hch@lst.de
Cc: penguin-kernel@I-love.SAKURA.ne.jp, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 johnny.chenyi@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20250630112828.421219-1-yukuai1@huaweicloud.com>
 <eb41cab3-5946-4fe3-a1be-843dd6fca159@kernel.dk>
 <a2dc2566-44e1-4460-bbff-bb813f4655d9@kernel.dk>
 <773a49cf-3908-85d2-5693-5cbd6530a933@huaweicloud.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <773a49cf-3908-85d2-5693-5cbd6530a933@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/25 7:28 PM, Yu Kuai wrote:
> Hi,
> 
> ? 2025/06/30 23:28, Jens Axboe ??:
>> On 6/30/25 9:24 AM, Jens Axboe wrote:
>>> On 6/30/25 5:28 AM, Yu Kuai wrote:
>>>> From: Yu Kuai <yukuai3@huawei.com>
>>>>
>>>> __xa_cmpxchg() is called with rcu_read_lock(), and it will allocate
>>>> memory if necessary.
>>>>
>>>> Fix the problem by moving rcu_read_lock() after __xa_cmpxchg(), meanwhile,
>>>> it still should be held before xa_unlock(), prevent returned page to be
>>>> freed by concurrent discard.
>>>
>>> The rcu locking in there is a bit of a mess, imho. What _exactly_ is the
>>> rcu read side locking protecting? Is it only needed around the lookup
>>> and insert? We even hold it over the kmap and copy, which seems very
>>> heavy handed.
>>
>> Gah it's holding the page alive too. Can't we just grab a ref to the
>> page when inserting it, and drop that at free time? It would be a lot
>> better to have only the lookup be RCU protected, having the full
>> copies under it seems kind of crazy.
> 
> In this case, we must grab a ref to the page for each read/write as
> well, I choose RCU because I think it has less performance overhead than
> page ref, which is atomic. BTW, I thought copy at most one page is
> lightweight, if this is not true, I agree page ref is better.

Right, you'd need to grab a ref. I do think that is (by far) the better
solution. Yes if you microbenchmark I'm sure the current approach will
look fine, but it's a heavy section inside an rcu read lock and will
hold off the grace period.

So yeah, I do think it'd be a lot better to do proper page references on
lookup+free, and have just the lookup be behind rcu.

-- 
Jens Axboe

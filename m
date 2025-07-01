Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4851E277CB9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376180; cv=none; b=lVqsUSNqqWApGxDPDnZzAEC4iybxq/9KnXThwhaAYfmtdmjDkdE9WhI3xPgWrT2Ei8tKOQCfNTw1dWi3N+HDINN4crqPI41zbaEYPg+ygZIMw0mR5DN2mp4IY8YU6j1d9uUz+OihaMAbGQozUvgpa5DsfmbXTxKOzf4SnQGsKIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376180; c=relaxed/simple;
	bh=M2TOy5psDFxo7ZBmqD/2Phn31Srm6PKEbj9e6rTEogM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RI8Qjwnb2JQQyJY9+Sc2Wc9oPbKFl0/qSmW1yFO8TrXLBo81Y/DjWggz779QpUF24KCwXS71vcrDmE4yIUaF0CVwm4V3iLc6yJ1K4AdRGTSz3W5wUEY+Ry3tS1sfT5gm2IvhznrchJ67UK6iLBrNTqek6w9//OONBdUcN/mHgHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=crrWlB+H; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="crrWlB+H"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso10595353a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 06:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751376176; x=1751980976; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=azprNnXK+qMmn0stkjujoWcCe9uzMbdfT07On0LmLBM=;
        b=crrWlB+H+qGqCf0QV6fU9RZHVidUcKUOuF2TfbdusmcR141hO3rr9JNDqnBkgW28c1
         OFNndq68ZknfNJbayO0Cgf5/1lkB12vLr8jLmEsnWK28z9aWYP0q5fsNRKS2kcTdPV4t
         WsbEpQ1rxfr/C2xH99kWHH5g//8f3hk9cBPdirtbGgf2FcJ6gGo0qwVSs4sK+gUaxoWH
         3xHJ4kKkR8XQHToSdFo6YCTxSuLbtz4k0ctcfgoLH7CqD/n+LcEMfClN59RKntFez+6S
         GVjcwapBFAO68SpU1Z/pFXCMoQmQvdxq2+wVCXczqhvC0wMdY7KCKKfuKSHG4efkkbaR
         IKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751376176; x=1751980976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azprNnXK+qMmn0stkjujoWcCe9uzMbdfT07On0LmLBM=;
        b=NqtfkuQJvcggJH96oIn9iBP8I8tlY4VAi1Rq/ivpQkstHUq/wYixyeVJc+djVrN8tz
         tbc+sdfw0CgJqSM9Ka3ayuEFJiag/TPaL0R7Vs8gCK0D36fvZqxDeQRDfj8sCEKEnt9B
         UjbocDp/ET9KVojq8rUe017troIbIiDNaTlY8OpDY0exFSiT+Pk72jK2VF4RBt09SACA
         4PnXpQrsVy6YrGaHdaDECDe0/15k0lBR/GBEW0QEBRKgw9DyFP/H9FEQpRNSpZkDTRmv
         Lkbg3IkiIHR+Z3mPI98lEUNcMDxVA/ogYHJ266erkMicqBIdqQ3iULpuQiaeKVNHuwS0
         v4mg==
X-Forwarded-Encrypted: i=1; AJvYcCW0+r/3sCqeI8OMUhSh/R+PzrBmcBWGIncVp82Lmkd10tNmWIL4MCorQYJ+SAMd1ONwNN4Q6/E9sQzHJnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB1zTGVJOT5faVw3eYGn5IjiN8PQEOxyJ0zwooi9EStGqyoqFG
	i2GbKJPFNKEc53A+FZOgamDfkdfwlMZaKbV8bO2o9uuldtBo3cUTcO62Jb4qtytHrX4=
X-Gm-Gg: ASbGnctcSMY+NcpT4KoWjIu5Viar2b2RGo5wWBX4Yn9Vkiswl7AruLUayH4phXvdM7U
	qdEjiloKyu4CualJAbAIzAjMPwq5uTEPlcjw5zi56kvnb+kyFVl678ZC5ri0Jkj0aM3WRheTJRi
	Hns6PmGCGruMrPKX6eSn5L1eNYUgWg1nLXHKa+EU2PkIHb5N8ppqdEkxupuk9P1OzBV9ohhHe2f
	NraTWjEIcXd2JLc+VA+Dkm4/kR+oiKQUDHxTDyq07jrxVr8npTIdXcbiZo4ASg1PV3voC+FP6Vq
	GcxQ1QTYUjGkH60Ar2zxl1XxBtTzgJmz/vNA1V4/c2R0Uh82f4b0CWYBXBRy0bq28a2bENeuH6q
	qJqd2aa3utmvx3hxCaRVJY3tDLVoZ
X-Google-Smtp-Source: AGHT+IFdlcq4Z1/1ZJmJ8k0tRF9kAcq1ga6wtmW543q51nxSjyxVLxkksVhic/2JaL3ZDFS+rayJKA==
X-Received: by 2002:a17:907:97cc:b0:ad5:74cd:1824 with SMTP id a640c23a62f3a-ae3500f27abmr1787598666b.38.1751376176429;
        Tue, 01 Jul 2025 06:22:56 -0700 (PDT)
Received: from ?IPV6:2a02:3033:264:3f6c:c824:546f:eed:ab8a? ([2a02:3033:264:3f6c:c824:546f:eed:ab8a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca201asm871356066b.150.2025.07.01.06.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 06:22:56 -0700 (PDT)
Message-ID: <ebd0bb9b-8e66-4119-b011-c1a737749fb2@suse.com>
Date: Tue, 1 Jul 2025 15:22:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: usbnet: fix use-after-free in race on workqueue
To: Paolo Abeni <pabeni@redhat.com>, "Peter GJ. Park"
 <gyujoon.park@samsung.com>, Oliver Neukum <oneukum@suse.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CGME20250625093354epcas1p1c9817df6e1d1599e8b4eb16c5715a6fd@epcas1p1.samsung.com>
 <20250625-usbnet-uaf-fix-v1-1-421eb05ae6ea@samsung.com>
 <87a7f8a6-71b1-4b90-abc7-0a680f2a99cf@redhat.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <87a7f8a6-71b1-4b90-abc7-0a680f2a99cf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26.06.25 11:21, Paolo Abeni wrote:
>>   drivers/net/usb/usbnet.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
>> index c04e715a4c2ade3bc5587b0df71643a25cf88c55..3c5d9ba7fa6660273137c80106746103f84f5a37 100644
>> --- a/drivers/net/usb/usbnet.c
>> +++ b/drivers/net/usb/usbnet.c
>> @@ -1660,6 +1660,9 @@ void usbnet_disconnect (struct usb_interface *intf)
>>   	usb_free_urb(dev->interrupt);
>>   	kfree(dev->padding_pkt);
>>   
>> +	timer_delete_sync(&dev->delay);
>> +	tasklet_kill(&dev->bh);
>> +	cancel_work_sync(&dev->kevent);
>>   	free_netdev(net);
> This happens after unregister_netdev(), which calls usbnet_stop() that
> already performs the above cleanup. How the race is supposed to take place?

That is indeed a core question, which we really need an answer to.
Do I interpret dev_close_many() correctly, if I state that the
ndo_stop() method will _not_ be called if the device has never been
opened?

I am sorry to be a stickler here, but if that turns out to be true,
usbnet is not the only driver that has this bug.

	TIA
		Oliver


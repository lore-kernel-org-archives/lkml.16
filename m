Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF3E1DE88C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743115985; cv=none; b=IHiH6Mbw3pJs/cuVyM2o8JA1EXAwrNr+bzwbxkq94AiJ6L0B5tOvAUtkeYvZP3j3fg8LNf2o7TFGUmPIuhcxN/pviRsJQtZ13RXrkvuwbPa13tgvGq09keQ/e8joOR82egyzCVUD2Aebii/LwvFYcaWuRq+pe+jAY7n+WvUycL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743115985; c=relaxed/simple;
	bh=pKpgtM4kB/4K64gSh6vdxNp84Cah8MzlKXkdIhPEZ84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQBvOBGA2yx/7U9k57fQXT69z9Py07jqTz31B4LYjAVNexgdRE7Nwm+IdlGeF89cJq/+sXMdfKixbIRYFLGZLiit+mCjyIRrbmZuC5+1uaJ2pL9QoKqpRucydWQznCVA6krc6g4ioFEL3tvjUMSytTFm665P18NLcTfB+y4/gFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=AQQFg9Nu; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="AQQFg9Nu"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso235592566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1743115982; x=1743720782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k12Y8dWe84nCJDuQsvD5DEjenxTgzdu2WJ45ZyGKWY8=;
        b=AQQFg9Nu4aN8lHCdb/84wZfBMNSyJu14daXnGHBjd4gsAbCAUobS40yhZ9gf4bMv8Q
         gXYCn/ESPMF41TNcb8vruTcV617corHL9H5WkmOp75DXUGUFgaWGjGSkh36PDewGAhlx
         OjCqDEMLyPoMEJV1XX8WKNv4Qgtd+iZ7X3SraHETASDbyFLY1uHQ6ZZI0f18GULgEKRb
         LlGyb5fiDbekP2fEvumsVCRwu6uZQvycZ+8eVTIoyl4PEJw5EE5xw5vcu0a6ifTaWXZj
         YuOJe2dCz4WHLFxz35mFp98Q5Z1dCwr3WfQRPz+/I1aMcPDItJUj96i0AWYyrMXkGQRO
         Mq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743115982; x=1743720782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k12Y8dWe84nCJDuQsvD5DEjenxTgzdu2WJ45ZyGKWY8=;
        b=XZNLWphX4SLWagu90h7HUcMZzXq+1UnbP3uvzwZZCDH1os6P+qAFUvI1uILNTNs0FA
         8qm/fuXORYWNjVSDdJcnE4ikTV9rxcrzJxJEWC9Dvs2fFNGEgXd3t2XVJHmQkJ9ErQWV
         RotUv8xVUtsochspGE50TonBJ5EcNn5sU+l4qwMQ6vX6Hzz/Hmzij3ldMp0i+c78wDyP
         A2wottjyf/crTIqVl8CHN/YtAaZPvxnvqt5ilM+hymH5RXck3DhEvlJwC8LxE6F2Ntxj
         ULW9el8u8v1ETEMMvmQOF5F0xFZFhsNBm+g7JEScXMCpNIoHPbS9sVBUiXq+iYIGsxs0
         Q5ng==
X-Forwarded-Encrypted: i=1; AJvYcCVeQqcuzTkXKazJ/O3/mRsYCbDSmZq4BDYQTSkgnFoc4sLiUFrha6vChTUY7JhXAVVeL2h6DGZE8KX7ZB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxakkJD9DP3lerXa369INsgAPxWyKriyZr2BOOnitwD1nnLRKnk
	BZwg3Ew0KAYOyyOqkFSyIWXY3RpitAmI943kilbvC17qxwT6R4GIiy8cBhAuSdg=
X-Gm-Gg: ASbGnctaGxRpGdjomD/P7I9kjMetyHib3f7DUAD/QnZLJV/oQwchi3GW0KTt1ZRlikp
	hJ/4VTDdTi7EP5FR4v2ANN+tYCvo/h6kckvzOS4zTifd3/zu0a7FKQ0rhcEe0Oe2rPBTydoj73l
	KFa4Yr/GK1Vrj6ajaxq426d7pRkWWh5jnirPClP9tDNLTOPI14RH+depXYCwIcbgaieOELuKnBl
	a3Fckg4uHHcjh1/xoxtfO98yyerxX+ftNyDF76R7pU6o0HfhR2ZvsaP3pD5RlMmrw21ZRnVYsMt
	ySfI8K7jh8UipdcsYQHGfxYc923SAINDJysmqPdkPwMUsKYC4b8=
X-Google-Smtp-Source: AGHT+IEQKYdXU4YRdq7AjkHureyIrp+bm+P0LupbshznRTrIcsjVjBe9WN63ZaIpC1RkUq+pZC7I3g==
X-Received: by 2002:a17:906:c153:b0:ac3:bd68:24eb with SMTP id a640c23a62f3a-ac6fae46de8mr605017166b.1.1743115982075;
        Thu, 27 Mar 2025 15:53:02 -0700 (PDT)
Received: from [100.115.92.205] ([109.160.74.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71922b965sm63206566b.20.2025.03.27.15.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 15:53:01 -0700 (PDT)
Message-ID: <ffe6f6cc-7157-48ad-9cde-dc38d8427849@blackwall.org>
Date: Fri, 28 Mar 2025 00:52:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch net-next 1/3] net: bridge: mcast: Add offload failed mdb
 flag
To: Joseph Huang <joseph.huang.2024@gmail.com>,
 Joseph Huang <Joseph.Huang@garmin.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Roopa Prabhu <roopa@nvidia.com>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, bridge@lists.linux.dev
References: <20250318224255.143683-1-Joseph.Huang@garmin.com>
 <20250318224255.143683-2-Joseph.Huang@garmin.com>
 <c90151bc-a529-4f4e-a0b9-5831a6b803f7@blackwall.org>
 <85a52bd9-8107-4cb8-b967-2646d0e74ab4@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <85a52bd9-8107-4cb8-b967-2646d0e74ab4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/27/25 00:38, Joseph Huang wrote:
> On 3/21/2025 4:19 AM, Nikolay Aleksandrov wrote:
>>> @@ -516,11 +513,14 @@ static void br_switchdev_mdb_complete(struct 
>>> net_device *dev, int err, void *pri
>>>            pp = &p->next) {
>>>           if (p->key.port != port)
>>>               continue;
>>> -        p->flags |= MDB_PG_FLAGS_OFFLOAD;
>>> +
>>> +        if (err)
>>> +            p->flags |= MDB_PG_FLAGS_OFFLOAD_FAILED;
>>> +        else
>>> +            p->flags |= MDB_PG_FLAGS_OFFLOAD;
>>
>> These two should be mutually exclusive, either it's offloaded or it 
>> failed an offload,
>> shouldn't be possible to have both set. I'd recommend adding some 
>> helper that takes
>> care of that.
> 
> It is true that these two are mutually exclusive, but strictly speaking 
> there are four types of entries:
> 
> 1. Entries which are not offload-able (i.e., the ports are not backed by 
> switchdev)
> 2. Entries which are being offloaded, but results yet unknown
> 3. Entries which are successfully offloaded, and
> 4. Entries which failed to be offloaded
> 
> Even if we ignore the ones which are being offloaded (type 2 is 
> transient), we still need two flags, otherwise we won't be able to tell 
> type 1 from type 4 entries.
> 
> If we need two flags anyway, having separate flags for type 3 and type 4 
> simplifies the logic.
> 
> Or did I misunderstood your comments?
> 
> Thanks,
> Joseph

I think you misunderstood me, I don't mind having the two flags. :)
My point is that they must be managed correctly and shouldn't be allowed
to be set simultaneously.

Cheers,
  Nik


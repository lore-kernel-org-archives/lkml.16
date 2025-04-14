Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21192673A3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744633323; cv=none; b=SzIfKyrc5tzQaP6jqRiYHAXZBSDeVgpsWiyYhb43Ug8Hbz8Ghrc2ir8FrNPEfRhqEOlpkw49Tp6ePbqwMh2e953MpeMtxKOj1+w9KDYGnJ7YeaQaJB7u6AV5k9juT8oGius6ltvya9+iBiZKtGOac9d5pK/z6aedFSJYi42BJXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744633323; c=relaxed/simple;
	bh=gUjXPyOhiE1hcHL539abnublrnFsXj4bRylZIEQJWNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lppnGCxwftsJ8fEcbLgTqZXIdst1t+0nXCS5hA/4mglXIFH8vzX6j3UoEyzxiXakYugoHRuWNs8o6zF8EKx8M0WzpD9JiecToPcrnkBykT0ZPU0qeNk2lTAykjGqGQs8+yfZbVYl56NXZ7oqzBdhhOkuCHPCYxINh4jMfwTFi3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eH7J/sTD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eH7J/sTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744633320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/OPwc6nf6xy86OFaDr/stORrLNl5tp+i6n5qxZKCBFk=;
	b=eH7J/sTDfdp3N/oCcLn+stAZHNdOT1GdNXa/v8MpPgpFdXU7qd+5csVA1w1QVgvk6EPA9H
	BOohNjZ/FWf3JiHPJlBAHGIYHmLjbI1fmufHrygIJh//Ujf7/6yzq4YktHiJf/szU03uLb
	+GQXccAoIpaHZGBDXfV73nAGivuRyzA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-udo9f_vmORuZOqyUPiPw2A-1; Mon, 14 Apr 2025 08:21:59 -0400
X-MC-Unique: udo9f_vmORuZOqyUPiPw2A-1
X-Mimecast-MFC-AGG-ID: udo9f_vmORuZOqyUPiPw2A_1744633318
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ab39f65dc10so596657466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 05:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744633318; x=1745238118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/OPwc6nf6xy86OFaDr/stORrLNl5tp+i6n5qxZKCBFk=;
        b=i2jnW9wQtwrIuUt305l7BntwW8wCaDgVbB48eOyELaVRKHmv9VvMiN07KA+TMCxl6j
         Bs7l4Rqvct7UsRNuEh0i1C0+JB9tKPu5C4Ye/oAjzLyArJaAAsIvlqUi1UASTXXKnSEL
         vvB768J2idei20fX4mqtc8k2GON7A/dBhyUkOZzf52XoKzu6cMgehHAA4gqPCN9XoSND
         qqCFrqqw16wjvEiYm8e8h6D4DhFapE1v2ipJEfYhbEdz3S7aAq0oQ97/KDEvOMW7oX3m
         ZHyszAh+QmERjh402NB65I7BSXyInt1I2JSIK0ru6hixCuqoiz8gIR5kpg36XSnC0lp5
         UrQw==
X-Forwarded-Encrypted: i=1; AJvYcCX7nsLrOBTNcNglD0qJtLK6G8Wtv8ZiFRze0kjwgKyTH0lxTOWJmADb6lpCHzeqKIOJh7fpnWX9La0yTEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlWgYh3APnSzuKjKYM/D7cDvuYZEqkxiweK7hah3L82lnp7T4r
	YJbxSd8QDg5TGh7joJDO5PSSj86Vasw1OKtMV7osUqUp1vvxM2TXVfvOugSNVOFnP5CWRYBYOcY
	ev9YlqsBC5qKJ9QPmky1hXVq2c6FVmiHnmgc7+eWzMWdYbPW7GAtUE73Zir/OyQ==
X-Gm-Gg: ASbGncvs+i9fLPZDsIb0ODosAqmttzh+mgV4B+8BosTLGl0LFDsaMtTzK67zPwJgpF2
	1MNpWxU/aOf2Tt66OYycyJXoLT5KzplnrdJuTGt4KGK2HHt09IKifxlHVymyv9lEAdyggFHduY8
	0XzFaLf8DsDuWyhjZrRGG7f+4kpqzPtbTy1V3LRcaljKDgbJevnn3aYKUeA2V0Oq+Qf367Q7i31
	O5zC0ZNa7I+ZfRNpOyJv6gZjHoFlBQVEqgCedJoNl0uPC16B3kW9TdPr5em/nYf3DExGDAG2sA/
	b8zcw4Qo+/QlD4Q=
X-Received: by 2002:a17:907:7208:b0:ac4:76d:6d2c with SMTP id a640c23a62f3a-acad36a5b4amr1009105466b.40.1744633318278;
        Mon, 14 Apr 2025 05:21:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi8everbZQeCujwnzXpIpN7qRyn2zen6RrJ5ohbsBXj/Z8pRpIsOF33EJTTSeF3AFM80yfZw==
X-Received: by 2002:a17:907:7208:b0:ac4:76d:6d2c with SMTP id a640c23a62f3a-acad36a5b4amr1009102166b.40.1744633317823;
        Mon, 14 Apr 2025 05:21:57 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb3d8fsm907903866b.106.2025.04.14.05.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 05:21:57 -0700 (PDT)
Message-ID: <518b1420-a356-4e4b-8422-c2689bc54794@redhat.com>
Date: Mon, 14 Apr 2025 14:21:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 hverkuil@xs4all.nl, u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com, hao.yao@intel.com
References: <20250411082357.392713-1-dongcheng.yan@intel.com>
 <cfc709a8-85fc-4e44-9dcf-ae3ef7ee0738@redhat.com>
 <c8ae2d43-157c-408a-af89-7248b30d52d1@linux.intel.com>
 <Z_zDGYD1QXZYWwI9@smile.fi.intel.com>
 <d9cab351-4850-42c7-8fee-a9340d157ed9@linux.intel.com>
 <Z_zMMtUdJYpHuny7@smile.fi.intel.com>
 <f10f919e-7bdc-4a01-b131-41bdc9eb6573@intel.com>
 <01570d5d-0bdf-4192-a703-88854e9bcf78@redhat.com>
 <9dc86b0c-b63c-447d-aa2f-953fbccb1d27@redhat.com>
 <Z_z04jMiTg_xW-c2@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z_z04jMiTg_xW-c2@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 14-Apr-25 13:43, Sakari Ailus wrote:
> Hans, Dongcheng,
> 
> On Mon, Apr 14, 2025 at 01:09:47PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 14-Apr-25 13:04, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 14-Apr-25 11:59, Yan, Dongcheng wrote:
>>>> Hi Andy and Hans,
>>>>
>>>> I found the description of lt6911uxe's GPIO in the spec:
>>>> GPIO5 is used as the interrupt signal (50ms low level) to inform SOC
>>>> start reading registers from 6911UXE;
>>>>
>>>> So setting the polarity as GPIO_ACTIVE_LOW is acceptable?
>>>
>>> Yes that is acceptable, thank you for looking this up.
>>
>> p.s.
>>
>> Note that setting GPIO_ACTIVE_LOW will invert the values returned
>> by gpiod_get_value(), so if the driver uses that you will need
>> to fix this in the driver.
>>
>> Hmm, thinking more about this, I just realized that this is an
>> input pin to the CPU, not an output pin like all other pins
>> described by the INT3472 device. I missed that as first.
>>
>> In that case using GPIO_LOOKUP_FLAGS_DEFAULT as before probably
>> makes the most sense. Please add a comment that this is an input
>> pin to the INT3472 patch and keep GPIO_LOOKUP_FLAGS_DEFAULT for
>> the next version.
> 
> The GPIO_LOOKUP_FLAGS_DEFAULT is the "Linux default", not the hardware or
> firmware default so I don't think it's relevant in this context. There's a
> single non-GPIO bank driver using it, probably mistakenly.
> 
> I'd also use GPIO_ACTIVE_LOW, for the reason Dongcheng pointed to above.

The GPIO being interpreted as active-low is a thing specific to
the chip used though. Where as in the future the HPD pin type
in the INT3472 device might be used with other chips...

Anyways either way is fine with me bu, as mentioned, using GPIO_ACTIVE_LOW
will invert the values returned by gpiod_get_value(), for which the driver
likely needs to be adjusted.

Regards,

Hans



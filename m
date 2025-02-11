Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C688E1F3FC1
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269108; cv=none; b=PxJYD5n37sDNAZd9EPco0gM8d6b7Yj3WcKYF/Y4tpWcUZYiFonjB2S7O++FPqvyiYtsEePmakv8AvUBv8QODOZgixPnxlBZsKQYA7bRfFPN0PSqsaA2BvapaxDdUt/72/DG0xNiojimNl6/CRLPUR/mM5wQXFTztKtP/htewn0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269108; c=relaxed/simple;
	bh=JAG8xLYcf6Mkmrkf1uBI9ulyETgFc0Gljwk5hR/ZLFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J6/vfWofgXdmZm/ESePYT+slbJt5bZZXM2RWmZfzCNU5imk8hCLHEMM7xX6nJch44aZl7ifBW+putWBZ6esFfFSIm0+do+5sLXPJ5qf3QHGt0BhBOBnQb+H4nwBkMBuQEsUZYx+XDCCFD2cPGzdxsFeYyr/I1IPN6It2cNaK09E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bPUdK06M; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bPUdK06M"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-438a39e659cso36834315e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739269105; x=1739873905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6wetbcIgbwPG6/Nth4UHPYE+ij7ipQx9r0HJcOKtumA=;
        b=bPUdK06MXchMw3HFvW6z1wtp4eYd+dB6yUL0ETyObeHjJn/fr0/idilZ4FQa0QGzK/
         FjmhsVshYchxSd83lUEqfGHZy4+aMjFIMOpAXdUhqOwm64Q+1kVHIPtu3a/5VXERNi3U
         WpKxb62l8GLuydJXBpXQfhanena139ll0gH+OmJNtPtSvMYhWRUMHikndPYdXhpguIe5
         J7MewISi3V/yE+T18OBT/m82R8TKVqfqBl1Cub6J2vIkj4gUHgX+VvRKyMgDvwnmn1oG
         xEV9rNLgQChBtIits4pWPFZDpIFyZ+RqdY13mOO1rNdzu+Wb771vLFkub8PK23EpRcbA
         Av+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269105; x=1739873905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6wetbcIgbwPG6/Nth4UHPYE+ij7ipQx9r0HJcOKtumA=;
        b=RXcPfW5m4HI4PXO7CRqSa6wJHP9PNwAGHwaoFmHacuFBPs+e53/qSpbwFhPMpXzl0D
         z9QlXmNGSbt/dlOQMSTPi6vC4zFA/+tcsDFzUl0nw+pTUyT7vO0Wv1ge/1MV1gnQq3jE
         xqODu2RucOH5/plSrgysOl+GSBoajz1IO3L9WIoXvKU7ZdX4bIDqwygIOfzHnMM2Hm97
         lAEYO6zWNJlDzlbJPWA8bih0DdaRovTIOrkZiOK66y+uqiGr2Qq+q4SqOO9G5ivv2UnV
         S8dyaza9dIMy28MbRvGQhfyjwTC+hzFNUMhL5lGplkWObaINWApI9TVAYlIY1hF0VylA
         orlg==
X-Gm-Message-State: AOJu0YwZkvYf7Ikw9rwOkfmU4MJ4SIJ/gI8ln9cha/MPqiKIcGdvJAal
	VXBJHup4jA0EV0pHZsFBRJLYthV6xeHA9reUu72GEKCmSgpMbPwNLtoujY5SCpo=
X-Gm-Gg: ASbGncswYpblZYOGX+SriByZZnO+mAUgTklAzEUrle/h9Z1YgWtd9san3qJIXutR/S4
	Gnw6V49IKBehGwAIRqg/FPf5R4hY2Uxm9kzAma3+vSgOBl8qfR7yyZeQG7fXHwUmTncC9jq0rp3
	uX18/hZbaNl6SeqgbW5WBOWFR1m5ZCTrvQwAWR5uhIJLfhxQHvAJM4vlHraE6xJQo04ATGVhy0x
	PHHURXer5EoLJnMy1R5xUfUDTcDfZqh5eouQdwisrsCQ5s8Gp/lN5FKdH2yADyPIywj6NXhEPlb
	pIJXONEgfepeFbJ53Ud6iedaehfe2+GTcX7PrAFSz9E=
X-Google-Smtp-Source: AGHT+IGTs1BGzVlw1sdsC2fgJYj9i9D6VhMvXGmg91hnlwvVYbUVMj6Ri+So6IC2qiYFDhjG5Gj+1Q==
X-Received: by 2002:a05:600c:a0d:b0:439:4355:2f69 with SMTP id 5b1f17b1804b1-4394355322dmr73914595e9.6.1739269104966;
        Tue, 11 Feb 2025 02:18:24 -0800 (PST)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [109.121.142.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4392fc7ceacsm106334345e9.20.2025.02.11.02.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 02:18:24 -0800 (PST)
Message-ID: <9c44d283-60d1-4bc9-bfa3-425a8155cca9@suse.com>
Date: Tue, 11 Feb 2025 12:18:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/mce: Make mce_notify_irq() depend on
 CONFIG_X86_MCELOG_LEGACY
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "Luck, Tony" <tony.luck@intel.com>
References: <20250210154707.114219-1-nik.borisov@suse.com>
 <20250210154707.114219-4-nik.borisov@suse.com>
 <CY8PR11MB7134CA4E20537911F5E8B11489FD2@CY8PR11MB7134.namprd11.prod.outlook.com>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <CY8PR11MB7134CA4E20537911F5E8B11489FD2@CY8PR11MB7134.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11.02.25 г. 9:20 ч., Zhuo, Qiuxu wrote:
>> From: Nikolay Borisov <nik.borisov@suse.com>
>> [...]
>> Subject: [PATCH v2 3/3] x86/mce: Make mce_notify_irq() depend on
>> CONFIG_X86_MCELOG_LEGACY
>>
>> mce_notify_irq() really depends on the legacy mcelog being enabled as
>> otherwise mce_work_trigger() will never schedule the trigger work as
>> mce_helper can't be set unless CONFIG_X86_MCELOG_LEGACY is defined.
>>
>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
>> ---
>>   arch/x86/kernel/cpu/mce/core.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
>> index d55b1903fde6..8b8553e144ce 100644
>> --- a/arch/x86/kernel/cpu/mce/core.c
>> +++ b/arch/x86/kernel/cpu/mce/core.c
>> @@ -591,11 +591,13 @@ EXPORT_SYMBOL_GPL(mce_is_correctable);
>>    */
>>   static int mce_notify_irq(void)
>>   {
>> +#ifdef CONFIG_X86_MCELOG_LEGACY
>> +
>>   	if (test_and_clear_bit(0, &mce_need_notify)) {
>>   		mce_work_trigger();
>>   		return 1;
>>   	}
>> -
>> +#endif
>>   	return 0;
>>   }
> 
> The empty stub function below can also be removed from the file: arch/x86/kernel/cpu/mce/internal.h
> 
>           static inline void mce_work_trigger(void)       { }


Actually I think this patch is better off being dropped. With it 
mce_notify_irq will always return false, causing mce_timer_fn() to 
always increase the polling interval until it stabilizes at around 
check_interval.

I will wait a bit for some more feedback and will repost v3 which will 
consist of only patches 1 and 2.

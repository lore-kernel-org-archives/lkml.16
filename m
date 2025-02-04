Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B1119E83E;
	Tue,  4 Feb 2025 20:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738701919; cv=none; b=WeHctoPqMRvA7Exty5z/cnLqFq+1V7jT5uva6AY/0TOIdO/NuCsFeJXLGEdVlaQMhU1nr3+5zL7Zntif9uiHNbQkvP3a9fbAJfGaAgnkVylvfMjyNjBAThhmq9n7Z2KZNspjeY6Ots5DKIoQGmPZxAXZPydOqtgwV+UULbof3gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738701919; c=relaxed/simple;
	bh=J+IZe6+xeBQUZ7Y3EwVTqtzMpKmo+5I7PdLDAECRS50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=glaIWoh9tm5cMOO6+/ctf4DcUeALNWQjgOtldXSK7EKYL1KI9TNitkwmKi6sC3/pCq4nvUDlNAVQzCaO7PyfY3qeUisHBK90A/AOLDmAMx0bD6oEUamAjCbxRmXr+hQz2W+CvwbU62aihh8rCcgMpQHRaWVFOfjdC6FN4kQ794Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmKBOFfd; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmKBOFfd"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2166f1e589cso48141885ad.3;
        Tue, 04 Feb 2025 12:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738701915; x=1739306715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=60loxnKSdnlh+ayLGEmVMhhxVtwUXEfIOB8C3bfFELA=;
        b=MmKBOFfdArKu8a5wyFu4juC6wJYqaTPupj2gclL3nXWU8rbXwbOFgYmUPowsizPlD7
         CWoc0suP34qzDESZYKfFTGxWblZB6ycwnjf8Qq8OTMkFMOiZOUbbG19UpBmoVaPUeKoC
         qPOVCzxmph3RZvKoxKVaEwqb3VXu+3Fb++LPSnvTUxVmHqIe+JFbRkELM6xFVxbhPDbQ
         YnbvVxDvp5x6dOrryvFEaggkmWal0e5EMo01zzOga646QFhk5QA4limg0Uz6yvlSE7h6
         LdFszwLOFlU6nf4yxBrHfDySbSOrnJ9zAed0KeTUO5NEvhnb//Dj0PrCOnaXYy1BLGk/
         ivsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738701915; x=1739306715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=60loxnKSdnlh+ayLGEmVMhhxVtwUXEfIOB8C3bfFELA=;
        b=Shx+227URxVE4cavW4X/c3RdDyzYAI4GtictQ6Q5+/fhn43b5eLp1izi+5V8qFEuZu
         xoDHlzZ880Wdi6DOLpIgT6Lh8546y8ySRKLot80Tz0bsQmM9KRXEmg24R0Y5E5Vw36Cl
         IfMWbjx4InJaag2IIPNNOsKv/T9tmIHN3jbX5HscJKNOwLSuhpQlvBvtYwWEiCvi6bRr
         t/n7obGkaRL5fxRYV3CW61HO5ctpAf5F3V/n08yxo1bhRKhMDS3NZm1a/r0giM4VbOhJ
         bQGp76WcmFXL8TbjvPtmr7Ie/mmq3SVvnsBtwoZGb2rskj9qcq2nsVFMPjeDGriGR1G9
         NG2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9S5BeOLd48D6bMOmMI2epY5C18n44XLKhVuKm884Su3ks9GaDD+i8chwDJoLvN5h54judlUStsU/r@vger.kernel.org, AJvYcCV9jVZtGJQk3IWqyj/OqNzFbWTgsK5Tq8E55k3B/xuAPy4C2/Pdd2/tTa66wYoWZTzpRy6TDk+XOP8i9SE=@vger.kernel.org
X-Gm-Message-State: AOJu0YytwN3SBiKDH6pqFwEXsIaYJ9pUTDWQoJ5O+BMKdOYklbj2e5V9
	6gwQq02tGbkXCrvOe/2kyTaShSbiVoTHYU3iPhEn3KpZdBvQSSbz
X-Gm-Gg: ASbGnctWmH7SRDmbGGgV1St55q/H6hAk7cK6zdNQWNt/gDeNe56/HTuc73e1UBtYtN/
	1V72zYjrr3rDDonM+uQ3p6wRhJvUaQrfYnkhz/gWbCYjukKfNOVdQuaTb4n59aewCyYVzRH5n6+
	+hMWrT3IedqkwX38V/tA1sMRHhDslxzRFJWj5FvXsxJDrqyJd7MnRfv9Nb1xeUEqSm5VqYEFPUY
	M4rwywIYSwZAiPLwfuFIDOj+xYM/+Y/5rqdxeGvgyE+E9CVsgQSfD5F49FzHxGgcM/u8na/l1tT
	Bt5s4GhUHEjVvxI3Bas5IXKYs/5yFKKxVzNRn5STAvHtNGNZpOemDXUg42BkMXLpt8g=
X-Google-Smtp-Source: AGHT+IF1NBNJmGzye+dH2ZG5Mlvtc0EXl0q3mv4JDhn3fFDzmcCy3DlE7ru4aIzmaF9XJCxH0vvIdw==
X-Received: by 2002:a05:6a00:414d:b0:72a:8cc8:34aa with SMTP id d2e1a72fcca58-73034fc3d1dmr680319b3a.0.1738701914657;
        Tue, 04 Feb 2025 12:45:14 -0800 (PST)
Received: from ?IPV6:2409:40c0:1019:6a4a:444:3a1c:6970:6cad? ([2409:40c0:1019:6a4a:444:3a1c:6970:6cad])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bf82sm11379534b3a.17.2025.02.04.12.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 12:45:14 -0800 (PST)
Message-ID: <cc1694bc-88fd-4557-b957-aabf1f444eaf@gmail.com>
Date: Wed, 5 Feb 2025 02:15:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: Fix kernel-doc warning for sg member in
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com, skhan@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250204134423.28051-1-purvayeshi550@gmail.com>
 <2025020439-bulgur-ludicrous-5071@gregkh>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <2025020439-bulgur-ludicrous-5071@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/02/25 19:15, Greg KH wrote:
> On Tue, Feb 04, 2025 at 07:14:23PM +0530, Purva Yeshi wrote:
>> Added description for the 'sg' member in struct dwc3_request to
>> resolve the kerneldoc warning when running 'make htmldocs'.
>>
>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>> ---
>>   drivers/usb/dwc3/core.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>> index f11570c8ffd0..5e4daec322b7 100644
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -942,6 +942,7 @@ struct dwc3_hwparams {
>>    * @request: struct usb_request to be transferred
>>    * @list: a list_head used for request queueing
>>    * @dep: struct dwc3_ep owning this request
>> + * @sg: pointer to the scatter-gather list
>>    * @start_sg: pointer to the sg which should be queued next
>>    * @num_pending_sgs: counter to pending sgs
>>    * @remaining: amount of data remaining
>> -- 
>> 2.34.1
>>
> 
> What kernel version/tree did you make this change against?
> 
> thanks,
> 
> greg k-h

The change was made against kernel version 6.13.0-rc7+.

Thanks,
Purva Yeshi

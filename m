Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F152433D1
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263777; cv=none; b=SM5KrAnqPVMBBjVO4mekxq8XwOGhvWdA42yVxplRPJzGc6zQ6c5cTQ7BzdTyLA9IbPATGWeDCJY/EFaNg1M63U8T3PbO6I70zHHZNcxVlPczFPrJmksle9Ho84gdPFTXE5Ap2RUkgrI+RbsEsWSSihv05XWPvSSbdotf2hVCjsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263777; c=relaxed/simple;
	bh=9mKyJMqRC5jyuweKXjyNCG6BcFdmTfgVIZoSwMXjCmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VyLAGz2un3z2/TVfSS4/0tAp9AJPT9F6CjpYZr06oLpRdu3XiP32N8lPjMFqFensuksV+c4Zwf0k43k5oIE0LERLgblIDW17j/fV8LNe714u8SoOd9p6aVxHWfv+mjC+JauNKho01sf/SkYZGd0JLbisb6wvbLtZcD21m7r7i/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NRGg5crm; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NRGg5crm"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5de6c708315so4001384a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739263772; x=1739868572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OB5t4gfhkfMF/UDGzHAHHgwNX5rrFSgr5XYXaS4lgQA=;
        b=NRGg5crml94IzwhBVa11d0pu1mGb5iG72IOuxvfdqjhUFmS08gbYYfxzFTLYDEqY4Z
         47FcZeL2PCOzA9+IVwiddkEQR72LqxlHJp/95ZhoKGYdshASNaT5fYusneDJ1e+P2is9
         8oJKFwGFTumBgAvEm4hW+tK23FfdnVeS6dDrplvrGQ9xawU9MU0NsYr4qZ3mpOrnUw7Q
         A6wK+1DZ9pCTDC1GO6+GcaVfyARdd9WCyKeZyvlYX+eTRP0/chI4lOrdjfFe/t14zgnL
         gxHpdw1NN2YrrwDZifpluqug5ugNnlVVkodSfZHI7TFdct/+srrRgk1DjsIdLh5aPNx2
         DniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263772; x=1739868572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OB5t4gfhkfMF/UDGzHAHHgwNX5rrFSgr5XYXaS4lgQA=;
        b=pwkguPV+TFA5/QvAk/qd1FZ6XdmncZI8NLWs2f65hjUHTJCqGuG7O8LHaJy2ta4Z1r
         O8wVDORULCLa1fK9zxRcm4G/Rs6xn2wzohfEPVE+Q9zVHqvOummtjpGpHZ/tIMhqzkBw
         G4ZxzoI4h98O1d2gxOZhr6O7vreg7MtYwqMztkZ3a6JOAIArx0a2LFCgPTs24jZjKCUi
         OTmoSfUS3y0S6v5YYLxxv1rTCUy0NW993F7sk2Sw/rRDPtDExgEyJ0rvHwxe1uXPxlnz
         A1RGK/2k+h6Kv3qNoUXvRKWCPDpDErniZgdSqz9pYbLE7qs0pwJ0/OqW9yGI4BnD6bEc
         Bzhg==
X-Gm-Message-State: AOJu0YzrhcvA+wqsJb9sQqGZUWgVDg2sY8E8wVSVQIuZqGKtfMUKafmk
	FuEn5ErShw5jWne16gsOagov/WrAOIoZYK9AeohY4hBfzY/dsJVZoUPHdYzvB7w=
X-Gm-Gg: ASbGncvBBiC6LTWctMT77ez3ykMmy7I3wHNlmEAsVFXrM17/IHUVTBQmvkUr/hT1PHO
	w9LODZYfdx1ppfu7xqZzTxAr3cgEELW0Kh69J86nUjBpFF3UKSa8IFhhor1R4vpUVkcATZhXo53
	+utfEEz75QCAAuS8/YIRgrR0Cj1XQPuhg89t2pPtBzrJcPHrk2xFOo/6BVv5avjMtWVmnr5LjTs
	lUv7mo+W+49E7bRf5M0wUcoGFlDfm9HpCV72msaEXvS/0yzWyPDA+mid5d9ACGhdWbngVLg7STW
	6X611f/bMOY/rBjyxUZ4Da6T3dtHIkoGeoE2oKxlLjQ=
X-Google-Smtp-Source: AGHT+IFXrQtW3i12aCdYpAoofw5wR7Ns57GQoGt9IWwgAVMx27O4JHyPf4yKdquh38GeHqubCO+n0w==
X-Received: by 2002:a17:907:1b27:b0:aa6:8cbc:8d15 with SMTP id a640c23a62f3a-ab789ac0169mr1832842966b.14.1739263772357;
        Tue, 11 Feb 2025 00:49:32 -0800 (PST)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [109.121.142.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7d101ed7dsm217170166b.106.2025.02.11.00.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:49:32 -0800 (PST)
Message-ID: <1ab8afe8-761f-416c-8584-dcf15972e363@suse.com>
Date: Tue, 11 Feb 2025 10:49:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/mce/inject: Remove call to mce_notify_irq()
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "Luck, Tony" <tony.luck@intel.com>
References: <20250210154707.114219-1-nik.borisov@suse.com>
 <20250210154707.114219-2-nik.borisov@suse.com>
 <CY8PR11MB713403A5AC3B0699B56A552F89FD2@CY8PR11MB7134.namprd11.prod.outlook.com>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <CY8PR11MB713403A5AC3B0699B56A552F89FD2@CY8PR11MB7134.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11.02.25 г. 9:03 ч., Zhuo, Qiuxu wrote:
>> From: Nikolay Borisov <nik.borisov@suse.com>
>> [...]
>> --- a/arch/x86/kernel/cpu/mce/core.c
>> +++ b/arch/x86/kernel/cpu/mce/core.c
>> @@ -584,6 +584,28 @@ bool mce_is_correctable(struct mce *m)  }
>> EXPORT_SYMBOL_GPL(mce_is_correctable);
>>
>> +/*
>> + * Notify the user(s) about new machine check events.
>> + * Can be called from interrupt context, but not from machine check/NMI
>> + * context.
>> + */
>> +static int mce_notify_irq(void)
> 
> Why make mce_notify_irq() return an int?


Pff... because I based my patches off master and not tip, which has it 
as bool...
> 
>> [...]
>> -/*
>> - * Notify the user(s) about new machine check events.
>> - * Can be called from interrupt context, but not from machine check/NMI
>> - * context.
>> - */
>> -bool mce_notify_irq(void)
>> [...]


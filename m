Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6134327456
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749538012; cv=none; b=Es5CL9H8Pj7Tn9tI1dmclQrF0T+M5h/Wk0uiRpwmpyDWLEdEiX/JhPDgBbRR4AXoszrwpx2M5P6zyHl98SjJBnQzr6WKOwiudzJbpuFrW/Th7UOw0S1bkQP9YdgpeSZldoglqCcaHcdZt6ij0Ptc3ejTSm2Hm28O7DVsyviU6/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749538012; c=relaxed/simple;
	bh=C+cHa82hxLwn8A3ARtPwsgZS9NncyQeepiZBYAt2S5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=No9W3ACAMSXFsc8liz1zFU+iyOqNdW+wFCX0wGVEyccpVmz2obUmmEGP+oacc/b31GPWOa93aWCfLI+4nju4Lcxt14XTSulkWsRLzCbm2wajJgJSROPbfOmQZFy/JwPALooLPZhaJSOXDy4szkC0t89PcZ8WLSprH33UbFn8t00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fwEmk5tk; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fwEmk5tk"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so4156908f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 23:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749538009; x=1750142809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vqSpB1VYji66UrxWEnr+KyQ/qcgfaOfilY2jfXTNHuw=;
        b=fwEmk5tkNMlP+Z09pmGxGse5UzEzS5bxufFr6KItdAR5LSOGtLNtX9/Epe6jntZ8LB
         aG6clN1A1PTKZov5IfDApG/AgYZgW10gB7lLH6rse7xQNRbyFHJUDKR5IsyOKMhJaknx
         b3Y0TWJT/3GEauOZEc57Llkqxl+o0GLp80HxOFKZiB7GhtHr48pzeU6WbR1e7YTiS/pC
         vgFRuwhktDYcQEdqzjFZW/qFJCcbMhQ6B96lUCLLrPgeI9HahTHAyjL1xZSr0khfcjpX
         cNzpx3peG4N50qJvM7JHts5Cv2aVdJTBdIQ7elT9WJEREtOR75i8nPTy/trsqlSQEWaK
         vCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749538009; x=1750142809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vqSpB1VYji66UrxWEnr+KyQ/qcgfaOfilY2jfXTNHuw=;
        b=jEmgCVaQyGwFwwEdwMFAoMzu/heytf97+rbaZ73R1UQzxSgvdAt/8ihFTClLFKhNCJ
         y+pewORopGjF7QflYsylvRcLmBM7CjW92cr1jMuz+MuFOyXHxIUfPaDKaKLXI0WiNZVl
         TWVensnNpFrGUca5LF9tSUXZ0Kv2TCQerVAlKnudbOHu/iwc+NEUluj6MgZw8KGwJcOz
         NU2+5UUl1sxLVkJkW3hv49VyRfGqf88z6d0BexWn3LrguBjjSsflq/OwXQMuMHkcGsrr
         5MgpvDYpWho6R9w9JPjIcOStoPfnq9nzEQVfkH/pITgo0en6AGpWWEnGo87g1H31Y78x
         pXUg==
X-Forwarded-Encrypted: i=1; AJvYcCXQvZdfFRq2VA9pP6oZmzcnbd1i8zcyEo8s3M9zUlj3jXOMpRqAOJxZgwMsp6sLZADH/mHqbeMqp29m2H8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY+IQNUf5kDBCU6UJWoiup5/DVsi7Ljy6hXFO/3LzZ8Y6F6a2N
	mDP3fw42PBGRlvsd7zpmCuEgvfCTvYpQEyjYvqSvSFJxLksVTCfZAteA9PVJOzcgemk=
X-Gm-Gg: ASbGnctb+xYpQqSGwOZ45/DfUhkXizYXB9CHcxfd+d/khBTDAEaC62mFEmc0Ykks6U8
	CM9kWvG8aZyJzcrFnV7ceJQGUo0kZK5ttbprhfqYVjJv2TboZF+JsP54CneBiNdAVF1QRZTXtuL
	m85DKJe3VzE5GU9wJOujbUckJz3N/Mkww1ZmQs7yuXAoMc4u44THyqMuQDT2CLIWJtXqCaWnaHF
	2SLf9oLTMBpLyb2gKoIEuNrTUzOPk0chKLI/5QmnnBRnL/UG4OHn8br9I2P1A0Q69L8D2Rdt/ct
	mMk1xgAnyJ4XyxyahTzg38AaqPez9bDAXlRfNE8Q41bRDRv36U1IcQ/ao71yqLeVvK/yUTie
X-Google-Smtp-Source: AGHT+IFrvXuAlyVXUyEaQFR+5fxkcaKYPjt9eYihFz8/x8SuyqMfsQMw3MyVs6uvpOSWLordZmvkUw==
X-Received: by 2002:a5d:64e5:0:b0:3a4:d367:c591 with SMTP id ffacd0b85a97d-3a5319b69demr12142196f8f.10.1749538008608;
        Mon, 09 Jun 2025 23:46:48 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b27sm127265205e9.23.2025.06.09.23.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 23:46:48 -0700 (PDT)
Message-ID: <aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
Date: Tue, 10 Jun 2025 07:46:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
To: Guenter Roeck <linux@roeck-us.net>, Pratyush Yadav <pratyush@kernel.org>,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
Cc: Cheng Ming Lin <linchengming884@gmail.com>, mwalle@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com>
 <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
 <mafs05xh6pf7s.fsf@kernel.org>
 <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
 <a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/10/25 1:14 AM, Guenter Roeck wrote:
> On 6/8/25 18:13, Guenter Roeck wrote:
>> On 6/8/25 05:53, Pratyush Yadav wrote:
>>> On Sat, Jun 07 2025, Guenter Roeck wrote:
>>>
>>>> Hi,
>>>>
>>>> On Mon, Apr 07, 2025 at 03:53:58PM +0800, Cheng Ming Lin wrote:
>>>>> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>>>>
>>>>> Many flash devices share the same ID but have different part numbers.
>>>>> To avoid confusion, the part number field is removed.
>>>>>
>>>>> Additionally, since SFDP already provides size information and
>>>>> functionality covered by no_sfdp_flags, these fields are also removed.
>>>>>
>>>>> Furthermore, when 4-byte address instruction table is available,
>>>>> the SPI_NOR_4B_OPCODES flag is no longer needed and is removed.
>>>>>
>>>>> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>>>> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>>
>>>> With this patch in place, some of my qemu tests no longer recognize the
>>>> flash chips (MX25L25635E/F). Do you have a suggestion on how to handle
>>>> this other than avoiding Macronix flash chips when working with qemu ?
>>>
>>> Could you share some logs? Does the flash fail to detect, or does the
>>> SFDP-based probing fail? Since this is qemu, it would be even better if
>>> you can share a setup/reproduction guide. I have been meaning to set up
>>> qemu for SPI NOR testing for some time now, but never got around to
>>> figuring it out.
>>>
>>
>> I suspect that the SFDP data for the affected flashes is incorrect in
>> qemu.
>> Since this is very likely a qemu problem, I'll just configure
>> different flash
>> chips when running affected tests.
>>
> 
> I was able to confirm the above. This is from the kernel log:
> 
> [    4.500000] spi-nor spi0.0: BFPT parsing failed. Please consider
> using SPI_NOR_SKIP_SFDP when declaring the flash
> [    4.500000] spi-nor spi0.0: probe with driver spi-nor failed with
> error -22
> 

It's likely the problem where the same flash ID is used for different
flavors of flashes. Typically we differentiate the flavors by comparing
their SFDP data and use post SFDP hooks to amend where needed. If no one
cares about fixing it, we can undo the change for the affected flash or
revert the patch entirely. Cheng?


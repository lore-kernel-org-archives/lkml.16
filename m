Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D155283C97
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328464; cv=none; b=c50PyReAui3nbbgNUybsgzR5VTln7jX4jJ6xPuKWoQaw2cR0vBvaH2zdIONgYx6NWbtKh5gGEHvYd6kXO9/d2lOMAGocvIQYheYDekeeJDHiYSHP2z5kxYrcxDb/8YZTI8XjeuvigKMu0kvV88aHCzw2fSMFYB7fggKZPm9DlPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328464; c=relaxed/simple;
	bh=EQCtPB6vig1BWXkhsUPFWKuYqQaajrFDU8o+69PjzzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHk3hIr+Y8wdUNm2MF6N85CkXMKNggC7edvcB2ms6k4KSCgMD8JXVSVbMJsXB+sPCfJ+goFIffL5H5OI+ZmNNuy2PLe/Xrrl/njAR30fUeHuY6h6iPfUAPoTv5/q66YCEske6YQeY8DKKb4ct8Z/1eAlN4RrG5yWE1fl2dpD9bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uu5Zj+eu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uu5Zj+eu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745328461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7UwdpGD0fRMaU1gXvakXekOim8TBkzbwWuAWNIFkxTA=;
	b=Uu5Zj+eulTZlBU6Goh5gmFMxcnRylfhthbImI63FAgL1hjxjvimSmFxzEJKu/DMndGWrY4
	dRMZPwdrZjdxrlG/9DoMKtcw9NlyW9hrvWOOp2pdR9EfOda3Dydsx0p1QauvkNQ/WD75zb
	fS8bD+c3Fh6Xx2GDD5hf9EUtR2/Ib4s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-5oLxEcLrPRSfMYCRnMmXvw-1; Tue, 22 Apr 2025 09:27:39 -0400
X-MC-Unique: 5oLxEcLrPRSfMYCRnMmXvw-1
X-Mimecast-MFC-AGG-ID: 5oLxEcLrPRSfMYCRnMmXvw_1745328458
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39d8e5ca9c2so3261699f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328458; x=1745933258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7UwdpGD0fRMaU1gXvakXekOim8TBkzbwWuAWNIFkxTA=;
        b=otGvgybugNYsfJxEtGqj+4JqCzWg9+vhUl3/cUOy6z0H/tqIzOacO+C0ohn9LrixwE
         mow75SB0URoPGD4SkFXvGPFEgycYqla+8i2EELUau6kewVN5qDp4dKJQXBPMSonTICBy
         4iM5vRC3YDDn2b+XtfRzQPwUshqnOI4ffyV9l/ZTy6T1t/+4XsUkB1IdJ+U2qb/tBrvi
         fYoCwVu8QZyf4GwkJGAeyPw3KXY2XGNnIplp3Yx5ao6qJYPcZCq2kSa6gWdu526LUhZ9
         9z0W8U+cAsyy6G+Hd3rZNBFY2eQKI8FGNvQsqlWl1qqls2osTHRiNIwOg2SoPXjGtRil
         2ujw==
X-Forwarded-Encrypted: i=1; AJvYcCWY37dpHaDpKlQExSoCIsDg/ef7AStJISOGZviXtt+fWMn85tbbZ7r025n3fzgMQSOBLTwonuiGPUw8H04=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsL3cYIx6TfRYMu+tST6/AbLiv1CEcKMrj/DrfxCbP1bXK/xwr
	KWKopM8NzfN3pzQumVuaDHmB0aRob5mfp6wOaGEa9I2MERig6q7qs6xFG1cCcegC79UnCTJN1cs
	2FT99Unz56BXQEaZtY20LKA902fmgpedupU7bKT6KLNkgp+VnF1076RnZV49kPA==
X-Gm-Gg: ASbGncueDjhHEsGvEDxxfp6H6h44BjkXLACtYD3B0Q36aY+DSjl4LRfxD5iObqARmRr
	mZ+NojXWQb5qpnHXM018HNxadfoDN9CPcS67QT/BMqUqKRuAxFqnBJUJm0LBzJyPcavFMlgpLt5
	FDAAjCdsTCCdKGMXGUyeisI0/jYNqjJTewT85jUs7mMlwbR0w29a9wRd0vjjeEqHV4bAV8KAY9a
	VjQ+Chg492fnxK5UMvcGVlUF2iebMJb1pRwPhqVloe+ZmA1I+Ew2cTm2lP7rj7/3YMY7yi6QJZh
	hyUugWpLoHzlh0ABr3njGe6Iz+qj+jOO1Zs9
X-Received: by 2002:a05:6000:401f:b0:39a:c9fe:f069 with SMTP id ffacd0b85a97d-39efba5c445mr11588023f8f.30.1745328458286;
        Tue, 22 Apr 2025 06:27:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMFkPqpRqcNuzcFnHj6Skl43ARpjqnMI6BNLMea1wY6RizjcHM5ktMU4nEoG/0S/ogkDjhNA==
X-Received: by 2002:a05:6000:401f:b0:39a:c9fe:f069 with SMTP id ffacd0b85a97d-39efba5c445mr11587993f8f.30.1745328457846;
        Tue, 22 Apr 2025 06:27:37 -0700 (PDT)
Received: from [192.168.88.253] (146-241-86-8.dyn.eolo.it. [146.241.86.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbc13sm172207495e9.17.2025.04.22.06.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 06:27:37 -0700 (PDT)
Message-ID: <845bd2b4-a714-4ddd-8ace-a45dcdbd486c@redhat.com>
Date: Tue, 22 Apr 2025 15:27:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next V2 2/3] net: stmmac: dwmac-loongson: Add new
 multi-chan IP core support
To: Yanteng Si <si.yanteng@linux.dev>, Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Feiyang Chen <chris.chenfeiyang@gmail.com>, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, Henry Chen <chenx97@aosc.io>,
 Biao Dong <dongbiao@loongson.cn>, Baoqi Zhang <zhangbaoqi@loongson.cn>
References: <20250416144132.3857990-1-chenhuacai@loongson.cn>
 <20250416144132.3857990-3-chenhuacai@loongson.cn>
 <fe0a5e7a-6bb2-45ef-8172-c06684885b36@linux.dev>
 <CAAhV-H5ELoqM8n5A-DD7LOzjb2mkRDR+pM-CAOcfGwZYcVQQ-A@mail.gmail.com>
 <99ae096a-e14f-44bc-a520-a3198e7c0671@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <99ae096a-e14f-44bc-a520-a3198e7c0671@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/22/25 4:29 AM, Yanteng Si wrote:
> 在 4/21/25 12:20 PM, Huacai Chen 写道:
>> On Mon, Apr 21, 2025 at 10:04 AM Yanteng Si <si.yanteng@linux.dev> wrote:
>>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
>>>> index 2fb7a137b312..57917f26ab4d 100644
>>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
>>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
>>>> @@ -68,10 +68,11 @@
>>>>
>>>>    #define PCI_DEVICE_ID_LOONGSON_GMAC 0x7a03
>>>>    #define PCI_DEVICE_ID_LOONGSON_GNET 0x7a13
>>>> -#define DWMAC_CORE_LS_MULTICHAN      0x10    /* Loongson custom ID */
>>>> -#define CHANNEL_NUM                  8
>>>> +#define DWMAC_CORE_MULTICHAN_V1      0x10    /* Loongson custom ID 0x10 */
>>>> +#define DWMAC_CORE_MULTICHAN_V2      0x12    /* Loongson custom ID 0x12 */
>>>>
>>>>    struct loongson_data {
>>>> +     u32 multichan;
>>> In order to make the logic clearer, I suggest splitting this patch.：
>>>
>>>
>>> 2/4  Add multichan for loongson_data
>>>
>>> 3/4 Add new multi-chan IP core support
>> I don't think the patch is unclear now, the multichan flag is really a
>> combination of DWMAC_CORE_MULTICHAN_V1 and DWMAC_CORE_MULTICHAN_V2.
> OK, please describe this code modification in the commit message.

@Huacai, please extend the commit message, as per Yanteng's request.

Thanks,

Paolo


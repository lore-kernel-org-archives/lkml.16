Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6410928A1E3
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924793; cv=none; b=c9rMpwxcXC8tWGzA9poM1Vb1pjVlxcJG+P9MAjYT1FgO+cFieTuTxp89kRewmG7kSFdK9R0t1c3w38ai1qjmiuYHDJ2fDJgR77H/q1ZC6hMi8IX9oTPbjUb477IN15ooGkd9jnLJhvclOVuFlMjG0ST1hLi+46erkWMlMJk653Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924793; c=relaxed/simple;
	bh=YKlbXnURs97TmbTpjUezNbI938aiKGi/vqj82PNrfgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TMFY+NFBQ5P19zUsbzdh6bMsIoHyXh6rBaEdPjO+k2PiBNCKMvEh1Xh1k4iFpZjdW/Peafx7f091A6C37xSG7VqVe/u1elVP6VQ5Jg9yC7tHrnKO9KpUjjNKyswCjwdkaSeEt5+mZkMxZQWXVzWDF0weqLUMkbiOTTJqRidmKXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QCvAumpQ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QCvAumpQ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5fff52493e0so9564004a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747924791; x=1748529591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5dUW3XcT56QSO6IzrjYqsZTqvCBor25DIllhfgnMqf8=;
        b=QCvAumpQmugaw0sbSIj8flMl4Rjm4dyNn71jU06GSadnbIFiluK9vVU1TkWoVf+MM7
         CYLILaNBEi8emIR3xNY6MN/CKcpuGpa549RPt83W0qQLaYSFiVlfZ12vt3i7Selu1Cqy
         fixKIP2nVTwQkLC1hg/vwgQMjat2mBbN3O1EWHvzpMQPWpqg0C6NPVRcARO6g4XuldHs
         a6cjWspkl2+reFmJKmkCkVh945GqIv3HZAMdztT1taodPCzSqOtkrNVBq/JV2YjhcYVu
         uz8BbByVeP+GsJEBQ/HVjBcCnQS2bwkIWr62sXDq3miABZtUMGRiXso7KK54e+2ejKpU
         hUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747924791; x=1748529591;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dUW3XcT56QSO6IzrjYqsZTqvCBor25DIllhfgnMqf8=;
        b=S5nT6QImfpgx2IMIjd2rbchU9tEvPBbyQq9TVsQEYiZ962ASz60TIEijKATl38vUek
         a95YnxUTHkSemkENXntSuu70xD1axQwSXTbll8yzkJ8OS8bvI/NvpP+ntp8s8pa0sLrM
         YZ/LFvPGyVTK4JuPvmeWaFBB6pRySWKIuvcONsDDAgtjBWwwsLgwjSqLOheMbzX38i9D
         yQ1Q264S5frDIAZwKobG6zcuOW96ksDjtAWo2tMKarKVs1B9s+Zl0D5wlb4ZRH/5yNCG
         qh2ppLbKcciA0PHHPaHewcRSStTVpWy7+dprb4nHOjr4RIdpTuiCHHB1n0UTbWsMX/hT
         wNOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZq0vbGMGUkRs/IEAz5rmU6JPEpuOHLWvODIl/qLat1yiOGbdNCODkHgNaerPG9MXi2WlRaPnK0pQeSrw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpstyfOuIPPsLSaTo6svkvE8wPWW9rHCcZlnHGc8J+v0Pw1bud
	oe37ZLVftcr1EQoBjDZGPGp+nRyZr2O/2Z/f+h6Yz7KR8r+nIQJ/AhB+OsUje9goMYQ=
X-Gm-Gg: ASbGnctzaiWGYqXHVcO/HdIASCB+BGuAzNHw3wkZnzsW4bPp8OQjHFy0RgZtuHd0d3z
	R83TuGGJQ+CPPeXwgm0xQnx3wsNnusqUExjrr/d9jQjJvaaqxdjwfFlzoLNQhoiQNgh4t2i+PAY
	YxoabANTdML/Xe3JyYpWrGk1Iy0M/Mq88CMfz+oH+t4grZqVKEa1KxY5Us58o4EF0xZZ+jPBbd9
	h+4L+6yq1b9aizLHYPsFXmnVErI4bX9kkSNgdMYM1t8e4rn9jz9TEoeIFrQSb+9x+Mf9KtygSr5
	6RBMU9bPmkR7R5h/VWth6kCxNy4D+mJwbWg+RX1PekM0kGsaFcDWkZsSA2A=
X-Google-Smtp-Source: AGHT+IE/RdKTMZdYx9F6yx1Kzprvz+cSKkMQRkLYiOsz7mEXFrIWg/Hdk4IKesUgJcilzgg+XPJrLQ==
X-Received: by 2002:a05:6402:34c8:b0:602:4405:777b with SMTP id 4fb4d7f45d1cf-602440578f8mr5149377a12.24.1747924790721;
        Thu, 22 May 2025 07:39:50 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d4f1c7esm10543212a12.14.2025.05.22.07.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 07:39:50 -0700 (PDT)
Message-ID: <797611e1-3786-45c4-9103-3ee8f96cec6d@tuxon.dev>
Date: Thu, 22 May 2025 17:39:47 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] dt-bindings: phy: renesas,usb2-phy: Add
 renesas,sysc-signals
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be,
 magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com, kees@kernel.org,
 gustavoars@kernel.org, biju.das.jz@bp.renesas.com,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-hardening@vger.kernel.org, john.madieu.xa@bp.renesas.com,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
 <20250521140943.3830195-6-claudiu.beznea.uj@bp.renesas.com>
 <20250522-evasive-unyielding-quoll-dbc9b2@kuoka>
 <b22e7a46-7e35-4840-aae3-a855c97fbde4@tuxon.dev>
 <4a07048a-c55a-4fd3-b4e5-7f9d218de76f@kernel.org>
 <68d83aaf-280a-4c19-becf-c6e1d9c2432b@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <68d83aaf-280a-4c19-becf-c6e1d9c2432b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 22.05.2025 15:48, Krzysztof Kozlowski wrote:
> On 22/05/2025 14:46, Krzysztof Kozlowski wrote:
>>>>>  
>>>>> +  - if:
>>>>> +      properties:
>>>>> +        compatible:
>>>>> +          contains:
>>>>> +            const: renesas,usb2-phy-r9a08g045
>>>>> +    then:
>>>>> +      required:
>>>>> +        - renesas,sysc-signals
>>>>
>>>> That's ABI break.
>>>
>>> There is no in kernel device tree users of "renesas,usb2-phy-r9a08g045"
>>> compatible. It is introduced in patch 11/12 from this series. With this do
>>> you still consider it ABI break?
>>
>> Then this patch cannot be split from binding introducing the user. Don't
>> add unused/undocumented compatibles.
>>
> Or you meant DTS?

Yes, I meant in tree DTS.

> I asked about ABI which is not about in-kernel users.
> You can always change in-kernel users, so what would be any point of a
> binding and its ABI?
> 
> Best regards,
> Krzysztof


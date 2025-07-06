Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3561ACEDC
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 07:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751788459; cv=none; b=ddE7k5rFuzh8svf+kWmPJY/fmCbO9Q5vBU7HdVk0mm8lmxDfl+ZdQe9EpvI/triTKgJ3xAP3D2xGuIZgtwwQw+z+hqff6sYkGcZ11L1e72YfeVHPc85yG7QG1KZ/nbhhRhf2Q3TlVTZDalKH43Eskz7fpNlsqMG85GAptkQPzz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751788459; c=relaxed/simple;
	bh=i05MAW1HoIvDZNsvly8FS8JlN32892CPcR3zw7xVcb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFmz7FXbg9fQWmeWclSsBFf6K0N9pNydTjQ0xar6251FvdwriflwNIgj62f++Pts8y63M8QwoLZeYwAv8pGn9TTjXLjKsifNzVSo4I90BgNqStU3jxAWRTntZaI91Y7uYhsbF2XBcmhyrxkGVY1BdZxXMA0aQiWwiDHChiJU/ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OoLxtOQS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OoLxtOQS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a528e301b0so116758f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751788455; x=1752393255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gY+1w/IpSjoLelrC9L08nmljWaMiTWqrIdpFXYu9vp8=;
        b=OoLxtOQSVLt8I5j30AxoYSluJ8xKl8cJg3dZTTcyUkyTwOf9pM1ruWhMkE6fWaJn1B
         Pa2s5CKai3TSsmuL+7vnbbofOHG90IL+FwuZe0Zr/DBzo6qCjiRcRubz3LEbbHOLIH00
         5t7On5i2N8AIlM+7R+ZMhal04M6M41dX48BldpEElGGOymTtvQDk5u3g6gLFbEXAfZCc
         EF+s4aSN24rSFHs2KmfOpcIkyX29iuFW+BAXFYWwxwKpcnDk2bzUUipfRv7e4XL3DSBO
         nw00lldxyniU68AZqUFgXb6y7rJSw0L7dEwVeP8GujpQUVoK9m2MoJPTDa3M65kyCfF/
         gAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751788455; x=1752393255;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gY+1w/IpSjoLelrC9L08nmljWaMiTWqrIdpFXYu9vp8=;
        b=cztdcmB9w+qcC9jQ6Zqb6IVo2Hfqk0c47q74HdnCARaQJpCX5H7ZjirwOwPH3HDZL5
         RMsGn508Dg6NffmUY5M5xk7BAZWZrgsBMCOugaOvnAdpD8oFsvu3VTR8m59BcJsmVMlD
         ny2cDBjkGFBnbeF5Bo1c6hOzbVuHpu64lY4meVO9nMIi3zDzVuJsykdZtZNRpsxJ4A/U
         x3H7MDKu9KqqypuffCWhE6uwhPjio2h1oXsSGQu6ewbYPk79TfdxzxvmAQ3m9szzfjrE
         Z8hZlkOyTv7XRK9PohvDhli2MlGx/RUiTxvBNagPIatZzWzK8bcdOCpn+q7HfrQdgVBb
         k9LA==
X-Forwarded-Encrypted: i=1; AJvYcCXEwh/TuZSunqlZDWpM5g6GxYQfrZ2ppmHvV+eC52XbRS1wjAjt45WclNAdKTRhtgDtFfNTO1AGu+2wH0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVk0TYKXDhNXKQ+4LUgAQD02gqVeAYE9nVqV73e8/XjERqBw0A
	QYgiJ6fQWILwgzQrPguqUdrgvq5h0E9HwHvxLFPFv9IqFTF1y17mOdpq9j/d1swg8fM=
X-Gm-Gg: ASbGncuM7jOL75jmvn1Jt0atBJ4ezUkjk/kfC343T0DtB1joV8udPoNvLAB03huHtg6
	wK20v96XzKT/GGNMZcxHGVi7ysunWanphggj4FY6ahLzgd2VNjCtVygh4gzdGZCRRvrVCFY53m4
	LiEet2GhPL+J3yYJw0+6S8eypx+no1sxyc5bwksD6KBvmCNi6/7D0sFbI/sR0NjJrYdPZcNuNsu
	okOlmsAsrYlJjdZ0V6a935eRwu0tgs9Pgm/qLYWVqP8cDS9RnJlW3rcYtauziOVOqbc5pOGb+kG
	EVkUH6IQlNuinAMqarxKJFUMwOhdKzr1a5Lctdk/9Mq9b9OMw5dtYvPlxPkJlbafOMCWRGSFclW
	aPu/PVg==
X-Google-Smtp-Source: AGHT+IG4TA19oJA/4NLEDCAtZNYyk5/Fvf1KUNRsATQ8NH8vXDbyFQpNYkvW01WeN1E9t9+6gYU+yg==
X-Received: by 2002:a05:600c:1552:b0:453:6332:a98c with SMTP id 5b1f17b1804b1-454b35ef640mr26770155e9.1.1751788455272;
        Sun, 06 Jul 2025 00:54:15 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bde35dsm103473235e9.30.2025.07.06.00.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 00:54:14 -0700 (PDT)
Message-ID: <9320092b-548d-4870-8d5f-d007a3713a81@linaro.org>
Date: Sun, 6 Jul 2025 09:54:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
To: Ze Huang <huang.ze@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250705-dwc3_generic-v5-0-9dbc53ea53d2@linux.dev>
 <20250705-dwc3_generic-v5-1-9dbc53ea53d2@linux.dev>
 <aGkkKEMyY1JG7Z80@monica.localdomain>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aGkkKEMyY1JG7Z80@monica.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/07/2025 15:10, Ze Huang wrote:
> On Sat, Jul 05, 2025 at 09:01:25PM +0800, Ze Huang wrote:
>> Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
>> in the SpacemiT K1 SoC. The controller is based on the Synopsys
>> DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
>> DRD mode.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Ze Huang <huang.ze@linux.dev>
>> ---
> 
> Hi Krzysztof,
> 
> I kept your Reviewed-by tag, as this version only includes minor updates:
> - Dropped the `interconnects` property
> - Updated the `resets` property to match the latest convention from Alex's patch
> 
> Let me know if you have any concerns.

It's fine, thanks.

Best regards,
Krzysztof

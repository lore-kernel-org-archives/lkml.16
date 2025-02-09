Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005A114885D
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 12:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739103694; cv=none; b=LgM3mybsujoFnx7fXhjf7sHL3RfMzTgpIjSApshrCZYkRqAIjwInhroCuTtm2nfe+5E8KNsmUtVfL/a7XTuU3UtaCqDniiMoSLbn4g7/B8xB0yUM+Dj73I9tnK8wDThLurJ9hWxS6N0lOd7hb4jApf9JeecIE+O1XeO9sZvN2XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739103694; c=relaxed/simple;
	bh=ph522qAR9+PUsOaPfzHWCTEdwHBrtqLkGYkPw9T6Uks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c7iX0+ewIss9f0Uxz+K7cB33FIs+EyE2WRGBD1bAV/FhXJjHXE0ywwN2woBD7PKgclywpPQAm47u5WmjV0Hs6mVxBf7GNs0GCCcNV96j4Ho/v+pWpjPAFtMOhhFG0ahrvrJG/kBqvwL74m8oBWHxWor0UpY7S3nIrORo182CJ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NBtLQtY+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NBtLQtY+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4393f97ebeaso441995e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 04:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739103690; x=1739708490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VDaiKVIvoDREmF5dBkk40+XBWsu5AZxMK34kj8iTAes=;
        b=NBtLQtY+28M+pc1U48erm0+RC0qKSBp+gKgD+IswzekxfNERq1wPBv60QtKBDwuD0T
         52Wyd2nNZqy++pMWUdaPw8/l3phyK3ZbWAno0BCBSOCJNP/2JVasELWJ2/ssg15RwDrA
         xEw279fIE7do9aRCzjhSYDvL2QO7rzazIPzpsFKLv3c98xlBlW6wBTSmGNHMBuVI25VN
         rEJa87YC03DskyrB3H/CUCTdFKWpWQ0GuxpxuIE5I7KF/9GscJr53mDJjkhrR5nM6nJL
         qMzrWlWMrFucYO+QXVGtwFRwGxEwBNZX6/Vkq9CV/BmsYRjb/80e5FdHj/6frweL5sAb
         Ynlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739103690; x=1739708490;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDaiKVIvoDREmF5dBkk40+XBWsu5AZxMK34kj8iTAes=;
        b=SheDsdSKhvokrgdKX498kvSzEpAfkNVVT64x8Ff1xZtNqDhFoUHrfnBGiG2GTQMo6Y
         nkaUZD3MlM3+qVel0waGTg8T1TGIV+6xY78BSEQa3fEs9nsJlkMk5y2M4rtWdoAzBmD/
         5nQWsGwYPv0txffO88CUKOUdzts5zuQ4GT2B+weoEJSOvt7Vs/39j1DOikZBHKhMtwbL
         WP/ooGs29OqNqIZemTGgFMu7syoXOFhz546ioOQldwIs5g2GIXqHmYMU/0YQV5UrrXTR
         df9G4JUPPnHxvNZge9k31g52flcTRrB0o1i+J0U+ofqU3VpHvw8HB7JfRH/dEiQkBV7e
         h/Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWVE42O4Ev5Thxbd30YWPD/QWlV/dxilBW9wd+OInQor+kae5tdCSuxB/15n+Sw0IT/e3yye9zexxiiS7I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/udeb2eyP7ap3uLPPPqsbY4RPEXxVdLbx75jpSG6VW/Fzqfyb
	jytx+909C8vVtHFciGhZ0WjkMR3wFbvVgrTPVx5XcQAF8cWWKJChoS0NZ/r5tL8=
X-Gm-Gg: ASbGncs/RE4jNwa9Pkksu8nwxYS1Jn1IEwo4WRIStZleFZJ2vi6oRYxEMUPdLf5AtjA
	YcxEDfLkC8oNjnoSy+PdkGLsIHS8xxoaNgl7pl42HN2wvU8gp5Cfzdf8lAKAkMd/xtUZxP7Xt26
	zaJ/6b7zSoRwEZluA/fw1MGrOqaTMY74TIloC2mND1CwTp+gKLHL0eoTzjWkrEPOCGLZKi5NH/M
	ECUltpL5vyU28UeSY24supbEQ5L7Z1CCSR6wJqcvmOd3vOZ3as6LNtX4Ml+OFX2sKmVHCYhG6pK
	XQ+ZawR7+S9E5Wl1XjP+GapXAUqGrnnkwPg=
X-Google-Smtp-Source: AGHT+IFuXsp9sstavdPA9gOZO+V3HNaUNGICg6DdYxO+seNxQN7zlceF78JaHywilg98L3EI8R1dTA==
X-Received: by 2002:a05:6000:1f84:b0:38b:f3a4:4e15 with SMTP id ffacd0b85a97d-38dc8dc7e9emr2649978f8f.4.1739103690201;
        Sun, 09 Feb 2025 04:21:30 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc5e6f027sm7763436f8f.4.2025.02.09.04.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 04:21:29 -0800 (PST)
Message-ID: <f9a2247e-e0eb-4e22-8626-80e87afa9386@linaro.org>
Date: Sun, 9 Feb 2025 13:21:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Andrew Davis <afd@ti.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
 <20250124-heavy-jaybird-of-vitality-4cbe24@krzk-bin>
 <20250124-able-beagle-of-prowess-f5eb7a@krzk-bin>
 <mocfnpebc67xegcis6tx3ekhsjcsqnvhwtipufycrtq2be4nbh@pmxhir5gmkos>
 <639b4e3a-3f68-4fba-aa33-c46dcb6fc88f@linaro.org>
 <d6252b73-0bcc-4724-8144-d6a98c8980f8@ti.com>
 <74ee6d9b-fd78-4d8a-a94f-b2c4dc794b60@linaro.org>
 <ebsbaaxyatrcikoem75t2blkhhceuidq3wnj3r2hbezfcmtc3u@ptffexrigbff>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ebsbaaxyatrcikoem75t2blkhhceuidq3wnj3r2hbezfcmtc3u@ptffexrigbff>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/02/2025 15:40, Markus Schneider-Pargmann wrote:
> Hi Krzysztof,
> 
> On Mon, Jan 27, 2025 at 01:09:49PM +0100, Krzysztof Kozlowski wrote:
>> On 24/01/2025 23:35, Andrew Davis wrote:
>>> On 1/24/25 10:48 AM, Krzysztof Kozlowski wrote:
>>>> On 24/01/2025 17:05, Markus Schneider-Pargmann wrote:
>>>>> Hi Krzysztof,
>>>>>
>>>>> On Fri, Jan 24, 2025 at 09:22:54AM +0100, Krzysztof Kozlowski wrote:
>>>>>> On Fri, Jan 24, 2025 at 09:19:49AM +0100, Krzysztof Kozlowski wrote:
>>>>>>> On Wed, Jan 22, 2025 at 11:24:33AM +0100, Markus Schneider-Pargmann wrote:
>>>>>>>> Add compatible for ti,am62-ddr-pmctrl to the list. There is a DDR pmctrl
>>>>>>>> register in the wkup-conf register space of am62a and am62p. This
>>>>>>>> register controls DDR power management.
>>>>>>>>
>>>>>>>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>>>>>>>> ---
>>>>>>>>   Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>>>>>>>>   1 file changed, 2 insertions(+)
>>>>>>>
>>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>
>>>>>> Un-acked, I missed the point that you really speak in commit msg about
>>>>>> register and you really treat one register is a device. I assumed you
>>>>>> only need that register from this device, but no. That obviously is not
>>>>>> what this device is. Device is not a single register among 10000 others.
>>>>>> IOW, You do not have 10000 devices there.
>>>>>
>>>>> Do I understand you correctly that the whole register range of the
>>>>> wkup_conf node as seen in arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
>>>>> should be considered a single syscon device?
>>>>
>>>> I don't have the datasheets (and not my task to actually check this),
>>>> but you should probably follow datasheet. I assume it describes what is
>>>> the device, more or less.
>>>>
>>>> I assume entire wkup_conf is considered a device.
>>>>
>>>>>
>>>>> Unfortunately wkup_conf is modeled as a simple-bus with currently 5
>>>>> subnodes defined of which 4 of them consist of a single register. Most
>>>>> of them are syscon as well. So I think I can't change the simple-bus
>>>>> back to syscon.
>>>>
>>>> Huh... Maybe TI folks will help us understand why such design was chosen.
>>>>
>>>
>>> Many of the devices inside the wkup_conf are already modeled as such.
>>> Clocks and muxes for instance already have drivers and bindings, this
>>> is nothing new to TI.
>>>
>>> If we just use a blank "syscon" over the entire region we would end up
>>> with drivers that use phandles to the top level wkup_conf node and
>>> poke directly the registers they need from that space.
>>>
>>> Would you rather have
>>>
>>> some-device {
>>> 	ti,epwm_tbclk = <&wkup_conf>;
>>> }
>>>
>>> or
>>>
>>> some-device {
>>> 	clocks = <&epwm_tbclk 0>;
>>> }
>>
>> How is this comparable? These are clocks. You would have clocks property
>> in both cases.
>>
>>
>>>
>>> with that epwm_tbclk being a proper clock node inside wkup_conf?
>>> I would much prefer the second, even though the clock node
>>> only uses a single register. And in the first case, we would need
>>> to have the offset into the wkup_conf space hard-coded in the
>>> driver for each new SoC. Eventually all that data would need to be
>>> put in tables and we end up back to machine board files..
>>>
>>> I'm not saying every magic number in all drivers should
>>> be offloaded into DT, but there is a line somewhere between
>>> that and having the DT simply contain the SoC's name compatible
>>
>> That's not the question here.
>>
>>> and all other data going into the kernel. That line might be a
>>> personal preference, so my question back is: what is wrong
>>> if we do want "1000 new syscons per each register" for our
>>> SoCs DT?
>>
>> Because it is false representation of hardware. You do not have 1000
>> devices. You have only one device.
>>
>>
>>>
>>> (and the number is not 1000, scanning the kernel I can see
>>> the largest wkup_conf region node we have today has a grand
>>> total number sub-nodes of 6)
>>
>> But what is being added here is device per each register, not per feature.
> 
> The register layout is like this:

The register layout of what? How is the device called? Is datasheet
available anywhere?

> 
> 0x8010 - 0x803c contains 4 clockselect registers
> 0x80d0 is the DDR16SS_PMCTRL regsiter
> 0x8190 - 0x8600 contains another 7 clockselect registers
> 
> I see the feature here in the block being clockselect registers. But the
> ddr-pmctrl register doesn't fit into this so I opted to describe this
> single register as one node as it looked to me like one feature. Of
> course I would have preferred this to be different but it is not. Would
> you prefer the clockselect registers and the pmctrl register to be
> described as one syscon?
No, because all the time you speak register=device and all the time I
was explaining that this is not correct. Device is the collection of
registers. I already said it - entire block is the syscon, not one
register in the middle, not 2 registers in the middle, not even 4+7
registers in the middle.


Best regards,
Krzysztof

Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D103FE4;
	Mon, 31 Mar 2025 11:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743421524; cv=none; b=O2jfAurnKh9fDhTeCsPRkhjQwVtgrDuK5oqztF3Lu+sArposOFZgQku9hou4o71yOf4eufTltKfJDtudxVxgASa01EOMV9CWkiImMJI65drumvJZu4U3WH3AeHhFsptRI/Z3930qHA4J+aBciPyDMg0M6Q3ZFGoJ4OQVtNmXfGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743421524; c=relaxed/simple;
	bh=ECVyOQ4QJgwuY3BsSBfbArAjbpHavCxYsK47PAeOlRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1+IHyTADtkuLb824j5redFhSozZcNiwTDUUDFb1M73ZBHO7Tg7EO6vOIozwJPH8SSlUQE4T+kxCZ0p5Nq8IEp4fGyHE2StF30sDsajH9A1GzsQnSgxmf6DucTNf2D2kMa+PWsXzjR5JsRUEj67zB8HntchZA9UeQhb1x6FC9ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivdhCo7E; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivdhCo7E"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso8066786a12.3;
        Mon, 31 Mar 2025 04:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743421521; x=1744026321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+WZetRp5ukCN3RFrLbUEaBdA30WIpXABNZMPxGA5CMM=;
        b=ivdhCo7ENoa0caKzzBQvcDd9cRyqyPfibNVnGDwdl4bdOyP+haw2vXi8F8lpSpCBDB
         YMt9DjPt5Fq/x2GhVZQgsVdXbRJNdsuGqXdkkOtcDG8lUi8dMmQUowsDE0WTfzw6lmkj
         T837hxGLcW6zSIgzim7evfS4KM0MSwCopuoQHmcfWleJO0qoGhGCMe/CosmJoe4rCF7/
         /BhF8VdRRMWXRaGSIxnT8cC+N+NWFp7GOaq7o/Oumy3s+9LvfM4btQoM4vH62SXAVcQw
         ZUUn574xbz3bTQGbvHyji/jgZtIAyswc03t2fT1icg9bea3DMs+B0RnwwMVCuiWrNu2N
         gysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743421521; x=1744026321;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WZetRp5ukCN3RFrLbUEaBdA30WIpXABNZMPxGA5CMM=;
        b=VZ8S/EfqfltEdwkcicFDUyMZt2+PF4v43MvXiLPkMJ0yhbX5X2/Lty1jiTNvbeBLTY
         6tZZHmXcVG7chC0DqJjuxWawaVa1JBYz1sJypF+xA+Uudad9LTrZYLJ2b/4FE2u9CCvN
         toBCnoMZH5XAr0nXMtBafhTQqgKeMLXU3uVuFMmLhSJWfuPV9Z0/lNW3etIo5TKXBRlF
         bKSpmuk5VbZPS6TMQdgRMaS7XcDtFGSD9i8XFEbc/cU3m6hp+7xmttG3Z++PtI0D2bAP
         tgB8VhOCx6LmoSod2EDQGS8leLS4c/J6JF6qHb+TR9bN9LZpKj6tmmUIldBqicj9UTy2
         RRaA==
X-Forwarded-Encrypted: i=1; AJvYcCW8jyzQ8l3fbf4yibOxpcaQQqbykiMJi6E22j0cTyY8q9p2z3ylZbHsWE3URQXe4VGSbyDnatkxq3N2@vger.kernel.org, AJvYcCXGOyPYNxe/cb0ges+VEpN2zUWn8j5Tzs2NLZ73t+sA175+fxDo484dHLX8mMDRQT7WfQKQA8iAzB7ClrTf@vger.kernel.org
X-Gm-Message-State: AOJu0YyIrX2DTY2vE/yEi8xmM8kRbXqFTwBQJkkbO8XwfL26nN5/t2SJ
	GMKZ9Y1JAxR9dc5sNlsUYyp9TmmNvYXjj8Aoavf+K79YfLqnN8vf
X-Gm-Gg: ASbGnctdL8vqgFs/wJT/WfAwlKcJf0MMxNDUR3jTf9FyPtvt9lgTZ1zEXR5AJUDZl4w
	HTIgwXOC0E4/xm3sR+LjUXWImylzgPRyQS5SG3oTXiaQAiwxTy5XmDwh5uyD43WDXDp/mwMpf/F
	fFJif/ST/7726RduPnnbWVhsEGayFgD1hr7A4hkCrSrTVpqZIJ1K4Gzk3b54Iz/lAj9XbuECgo9
	+6IGNe1f2rU9IlGgbdJxRc4AfBttB5o/lpMD+naPT+s4UmHUZsXq0T1jONUbV8X6eHcceGvfX0L
	aYfHYKg20xrb6/yAcuirQ5ltnWur48AxWkX5yrxU9ysPovMnr7u7VjzSoNVJtObfD4sOleI=
X-Google-Smtp-Source: AGHT+IHcwdKHyjGn7qgKGCjwufvZuSvuzHtrMAol97MyCW4LRBy9QxYiA7v5eA7QLgnV+kdOOMmuBg==
X-Received: by 2002:a05:6402:2709:b0:5e5:ca1b:c425 with SMTP id 4fb4d7f45d1cf-5edfd101725mr7051020a12.17.1743421520816;
        Mon, 31 Mar 2025 04:45:20 -0700 (PDT)
Received: from [192.168.5.165] ([92.120.5.14])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc1493d9dsm5532289a12.0.2025.03.31.04.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 04:45:20 -0700 (PDT)
Message-ID: <e0d328e0-bc54-4763-9c55-694c0fd93746@gmail.com>
Date: Mon, 31 Mar 2025 14:57:46 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: bus: add documentation for the IMX
 AIPSTZ bridge
Content-Language: en-GB
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
 <20250324162556.30972-2-laurentiumihalcea111@gmail.com>
 <20250325032303.GA1624882-robh@kernel.org>
 <2301b0f7-1a76-4823-8d3f-d346f8f8e865@gmail.com>
 <20250331064152.g4hlw6pbpzbnlsmp@pengutronix.de>
From: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250331064152.g4hlw6pbpzbnlsmp@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 31.03.2025 09:41, Marco Felsch wrote:
> On 25-03-28, Mihalcea Laurentiu wrote:
>> On 25.03.2025 05:23, Rob Herring wrote:
>>> On Mon, Mar 24, 2025 at 12:25:52PM -0400, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> Add documentation for IMX AIPSTZ bridge.
>>>>
>>>> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
>>>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>>>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>> ---
>>>>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 107 ++++++++++++++++++
>>>>  1 file changed, 107 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>>>> new file mode 100644
>>>> index 000000000000..c0427dfcdaca
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>>>> @@ -0,0 +1,107 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Secure AHB to IP Slave bus (AIPSTZ) bridge
>>>> +
>>>> +description:
>>>> +  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters
>>>> +  issuing transactions to IP Slave peripherals. Additionally, this module
>>>> +  offers access control configurations meant to restrict which peripherals
>>>> +  a master can access.
>>> Wrap at 80 chars.
>>
>> fix in v4, thx
>>
>>>> +maintainers:
>>>> +  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: fsl,imx8mp-aipstz
>>>> +
>>>> +  reg:
>>>> +    maxItems: 2
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: bus
>>>> +      - const: ac
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#address-cells":
>>>> +    const: 1
>>>> +
>>>> +  "#size-cells":
>>>> +    const: 1
>>>> +
>>>> +  "#access-controller-cells":
>>>> +    const: 0
>>> With 0 cells, how do you identify which device it is?
>> we don't atm. We're relying on the default configuration.
> I think Rob is speaking from DT API pov. What the driver is doing with
> additional information is up to the driver.
>
>> we don't have any APIs for AC configuration so I left the
>> cell number to 0 thinking that the cell number might depend
>> on the API.
>>
>> if need be, I can set it to the value I was initially thinking of in
>> v4.
> Which is?
>
> According the TRM it's a bit tricky to define the API since you need to
> describe two different types:
>  - master configuration
>  - peripheral configuration
>
> One which came up in my mind is:
>
>   <&phandle TYPE ID VALUE>;
>
> e.g.
>
>   <&aipstz AIPSTZ_MASTER 0 0xf>;
>   <&aipstz AIPSTZ_PERI 0 0xf>;
>
> One could use a defien for the magic value of 0xf of course.


so, my original idea was to use 2 cells: <&phandle ID VALUE>, where bit 0 of ID is used

to identify the IP type (master or slave/peripheral) and the rest of the bits are used to encode

the ID itself.


I think I like your idea a bit more though (i.e: have the TYPE as a separate cell)

because I think it's easier to deal with/understand from the DTS user's perspective.


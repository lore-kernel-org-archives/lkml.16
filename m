Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE814236A9F;
	Thu, 12 Jun 2025 10:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722994; cv=none; b=uDJ9x2tvnLDhBiFz/L67EZl7jmjojgLUmfO0OuUqKIiSsDtXM/xnr19SndyAO4mgeJADtZpfN4+CHLnAMSluYVN4CfJiuGorl2TP2yCwyFW6zA3D8sIVe6TmO15GEmcVAn8z28bpUru1aUX0yIE/Efr1uGldWKbhz3Z0z81PaAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722994; c=relaxed/simple;
	bh=uTITBYeE8ohG254DcwCwxQPFcFQdhokWOVGOKipCgbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvLaZi8P8TqWVPOnAEBc/rY55v/DgXvSkPd2zKNeL987xf9Itf3ujFBOYULqBNYdVfgxKI/0avCdeMV9s9QSHIeB7tvGf1pZozxmcvxFgC07bBqLgqLmFeVk78JW2RQse2aAg/t10ZzYKOWmHszbAA9BpDZ/YSqc5+/pZXDqMLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XrzzE30a; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XrzzE30a"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad88eb71eb5so97736766b.0;
        Thu, 12 Jun 2025 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749722991; x=1750327791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Z4Ts4SemOanuTr61QzuphBUN8qi1MMXkgGzPKsefMM=;
        b=XrzzE30ag/KuX5YcFLBozF0if4PwQdYehJR7OQHaPYYtuF63CDgKjOh88/JyTkft3V
         Q/5NZTEZAL08YOqhTvoHSE8WX6LiyHUh4vJwuHQ+GUVvi/EI4wqznFdWTd94FpMCUEmX
         Wb7u6z/a5lTqVD3fvz90jYLSwe/mm8v/eadZy8u1cL5SCMEZZuTf1ZSue4U+I0QrLri9
         ENcD7DMImsvSp/8EHN+wfyqyYK0GuuEV/7wSN3WYyT/ickIvQuMzJpzUZqfbaJghnS0J
         CD0KDgcHu91OxTnqbo8GdSrhSfu9Qdji3Qg2xNdinMFYhBr/wHby4jyeXe5/zYL+xYRv
         9JQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749722991; x=1750327791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Z4Ts4SemOanuTr61QzuphBUN8qi1MMXkgGzPKsefMM=;
        b=qvHz6kNmyIEhLq/5FJrdRMpXZ1BntCEwaziQKupoDSPszBOPbnuC5EWswyHgdEHuN8
         MAfw+cS+2BEfIMdGpzNIMMD7HpU3DruygbId01kTNiziEYoGFlW7yJLUquuKP1JVTEq6
         zbdAaevl7q5mdwzxAkVbx6sLgLZBei9cv2YEQFzph6MT+HLYYaU1tSGMOx8MVTqm3YY7
         r0QrbUlJsCcrNaJiAUWplR1VGpVFIdRzO4IFDiHecKCetj0geOpqisNoo7lsFAF6gmAE
         LFDF4vksFVJF7I+cI6nCaaSR+VJoQT5xnWoikAxVUuHndWz6YHSnYmKzHwzPC4QWd7Gi
         FQjg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ378URRJjJdE974+5Nfvb/ptAG411SEjiFl/8ppqw9a0/Us5bw1Ub2OBRutBCSgM3v41GU3PrromL@vger.kernel.org, AJvYcCWjhx+V5sAb5lOfM/jFzOWx25X9aIP1gTx5IdEIdDaX+qKb5sTiXdkdhd6WsqkHdl86I0qzp+UUgIIgVTSL@vger.kernel.org
X-Gm-Message-State: AOJu0YwBYibQN+L33wggc84DPip+APgCa5aBhjF1ZBm5LvNJEQzG8Orx
	QQqxqQ/KWDDCjfI1WBZyXh5OjFa8UzGjXknLzTEu+splyqKEZDflDl1J
X-Gm-Gg: ASbGnctQqddbkHDMVC2Pe6sfl7NRH9cttemY9hA26iasPFH4KGNYPDGGV3uQFNXvAH4
	x2xhFc4ipugi2wGniVUWFenReDM90rxJZWBukbTPBKdjyFGrAmPJm5NgeSCQ9BdKjO7trBbBZg/
	Uek146Bx5ng8Rdij6KtZHrW35G73MUB5yyM0QEFk8d1vB4laVPX/u2B8XNLoIxdRikcCIXT5s5X
	lXYtMRZ0nYoQPcjgjrOxHTfyj6sgMsVeP4Pt98Wgd5lLP0cSrB4YGEqBA0acSpSlIriLVuJl3Yy
	pFOr6ZXZ9VnVQA8pZzLXiiBL6CbLfVt2z0FJko6TSvar6tEY6WEqEtWrIs0JMeqoEvx3lPoyf6O
	FJl4i1pH6dqGgSCJ3/o6iU+a/PztL
X-Google-Smtp-Source: AGHT+IFoiiR/QdIeymZUwbr9Pu/lwDdYhLKFtoE+8RP4l25w4lg3IZ+tvJ5g3xOZT4oSwM0Nefo7iw==
X-Received: by 2002:a17:907:3cc2:b0:ade:2e4b:50db with SMTP id a640c23a62f3a-ade893e50fbmr630566166b.10.1749722991030;
        Thu, 12 Jun 2025 03:09:51 -0700 (PDT)
Received: from [192.168.1.130] (11-127.static.abakusbp.net. [46.17.127.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adeadb8f5c1sm107336866b.134.2025.06.12.03.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 03:09:50 -0700 (PDT)
Message-ID: <26194c8d-c16f-4293-8c0f-5c674e09a1ba@gmail.com>
Date: Thu, 12 Jun 2025 12:09:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: imx8mp: Add Ultratronik
 Ultra-MACH SBC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: boerge.struempfel@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250611113039.304742-1-goran.radni@gmail.com>
 <20250611113039.304742-3-goran.radni@gmail.com>
 <20250612-snobbish-outrageous-nyala-dca804@kuoka>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <20250612-snobbish-outrageous-nyala-dca804@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

Thanks for the feedback, and you're absolutely right — I made a mistake 
here.

That said, I’m still a bit confused by your earlier comment:

     "That's just part of the standard/first enum."

I’m introducing a new board from a new manufacturer, so I expected to 
add a new enum block — similar to how it's done for other vendor entries 
in the same file. I ran dt_binding_check, and it passed without errors 
for this structure.

Could you clarify which “standard/first enum” you were referring to? 
Should all i.MX8MP-based boards share a single enum block, regardless of 
vendor?

Thanks again for your guidance.

Best regards,
Goran

Krzysztof Kozlowski wrote:
> On Wed, Jun 11, 2025 at 01:30:37PM GMT, Goran Rađenović wrote:
>> Document the Ultratronik Ultra-MACH SBC, based on the NXP i.MX8MP SoC.
>>
>> This board is manufactured by Ultratronik GmbH and uses the compatible
>> string "ux,imx8mp-ultra-mach-sbc".
>>
>> Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
>> ---
>>   Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
>> index d3b5e6923e41..132a6f39b59a 100644
>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
>> @@ -1232,6 +1232,12 @@ properties:
>>             - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
>>             - const: fsl,imx8mp
>>   
>> +      - description: Ultratronik SBC i.MX8MP based boards
>> +        items:
>> +          - enum:
> 
> Nothing improved... got actually worse, because you never tested it.
> 
>    ^
>    |
> Look here. This is '+' means you added it. My previous comment was that
> it should be part of previous enum. If you add enum, then it is not part
> of previous, right?
> 
> Best regards,
> Krzysztof
> 


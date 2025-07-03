Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1914729A30E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528677; cv=none; b=hmOI9wh7oQrjIqXb/bPCswST/4yYd5Mv4AZmI/grquQbXy1u9TT6KBv1RJKeQncM2zkODpDyTLfin0hybb/K/9yLf1kUB9LdQCSbzePePS+OoR6w6ZpbZJSwZF+n1Zanm5/4Jq0Q58/DNnmb2h7FLIeaju+ZYkDC4TwU67ZR16s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528677; c=relaxed/simple;
	bh=uvVRyhXXQdTqyi6qD5hNeOYfV22QucTwchUcnBUrknA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=ub63dJEuyUuLedf+63B0WCaCSvIKNL+BgX32z+YAancOGLyCZmFj2snSzxWW7jRIxKvWRlTRH74iWEGfnZNComominVoTNwtTdvi75dly/XuhH+1xEH5Nhvz9nNnr027JR+CqjFQCpmSNnHLhOeOiPk4oYIjlzIi4Isb+Wbtz8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=XM0FUQvu; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="XM0FUQvu"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae3b37207easo493489066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 00:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751528673; x=1752133473; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehl5KtGOpHzky0HjBHJk4xPR2pkTI+t/MI0XeErvFsM=;
        b=XM0FUQvui1fZXO1V75GtBInPHIvw1/vf2VzdMjiepb6PPuJQH3r68sjH0V+gnoK+gk
         7tQIN21Z67DsutrxybfciKqJ1rFuZ1rlck654G1yqApIUn9sb635YhiN6Vyg4XJ5Livh
         X3K9KsXAJNYLPgbVqnsWRzBldzuxqm9+eamRmk2o5q1Cr0J5pjkqJPPHqdnOp7EuVVoG
         NJZVrOz8X4nt/kfkFi/KKxmyuML0GN/ogvQ57WLJ+MjgUh2PMbFD2ehx/htFdt86oCWq
         nf3HeTMhKCGgJ1zNPO5PurogHhRQqYKX8Rv44UPuLeiX3yqBZHOeTBIzJnk6RM5I4YjX
         qRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751528673; x=1752133473;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ehl5KtGOpHzky0HjBHJk4xPR2pkTI+t/MI0XeErvFsM=;
        b=ofAfozX6Q2qLVRNb6ntc44sOdtB+AuKyqAN3tKdAHTESG8XJMKJDkHvtx5xqquOpB+
         4kH/iQUOjF/DEH0e6U4263S4tkEypHDwFrYryU9OEKarVaocT8KYg7VUzb6TYnGpxaNr
         ok94eaeXP0YS+hL77zweM2MN5FnkbKWJJMf/IGdHyedjVVSFUvrBKys6QQ0yVzt+yJLQ
         Z/ESTsgPc81X0LxFN9NlVXZV88kjnjsUVv+uy6yfxAu0fQbfVhqoDI1Jvp2fDeLQ8vhz
         YYL5NVVbGEPI3LwGITAllr6tT8Zx5NpJbMUWspzuI4PpGjzRTiUUiStgPwMskhXnQa+5
         9a8w==
X-Forwarded-Encrypted: i=1; AJvYcCUGpE4Pk2F8Ye+v99FV0M9PIDPJtz4fbHGVRfBbcrGqGLbgYGNqU8fSFdLVGoQhsdvFHZQXTdeqLZPnE1c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywysj8yDzu/hHZHqDOnyYmO9aWJhMml9dNNnCRJQWdYkhfLsCrP
	vxP9IkHSzHSzebsv+tNgO6B2QlzLwH7+w7VG3Fa87yBj/n2LkUnI6rN9epd6lQ0WTcQ=
X-Gm-Gg: ASbGncuvzrPO5HZFiVc4qETLqF/QH+JUxuHUl9qhLFqpis3uMRLDSJqYYLkrDZhTk0G
	j9bejXlReZmKViubXanC2RHk6tCZnqNDawolbHJIow0TtX4XAbzIqR+NknV7GB9aslLTdS+Hbn3
	t/QwkY6aipyf+orV5K4x6Ho/kngvgzOR5x3Y25TUQRrVqDcyURzo0Mo/wVELxKar2bFjJWDJ3N6
	YW3eWxlRCbf3dkzU93LqgP3YQILD8HHRuqr5Io7eptTZEwRjW2tbaolpHjS3dyzErEhOs844t7S
	aVfgylDTaMaqcrp7h/5pRvJ9loKmKm+Z7FNOBv6lfGC1PHU6vpByNjegy4N3yq8H0WHNwPxaoUl
	73tawMkQev4ZgdGUj9G8REStjYIYcdxY=
X-Google-Smtp-Source: AGHT+IGLNZcinQlfIyw3lAwbWdmloxbfyjW3HhG1I1bCNhAbESegDou4m/JgC6K6XblVy3HyEzMmUA==
X-Received: by 2002:a17:907:60d3:b0:ae0:da2d:1a53 with SMTP id a640c23a62f3a-ae3c2c3f3b7mr616343366b.42.1751528673290;
        Thu, 03 Jul 2025 00:44:33 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363a172sm1202442566b.8.2025.07.03.00.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 00:44:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Jul 2025 09:44:32 +0200
Message-Id: <DB293G0PC5P8.13IW22M6DDESM@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Milos Top
 Level Mode Multiplexer
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
 <20250702-sm7635-pinctrl-v2-1-c138624b9924@fairphone.com>
 <20250703-daring-burgundy-limpet-a1c97e@krzk-bin>
In-Reply-To: <20250703-daring-burgundy-limpet-a1c97e@krzk-bin>

On Thu Jul 3, 2025 at 9:41 AM CEST, Krzysztof Kozlowski wrote:
> On Wed, Jul 02, 2025 at 05:56:16PM +0200, Luca Weiss wrote:
>> Document the Top Level Mode Multiplexer on the Milos Platform.
>
> What is Milos platform? Does it have some sort of model number how we
> usually expect? Wasn't this SM7325 or similar?
>
> The problem with such new naming that it awfully sounds like family
> names, so just expand the name and explain it.

Please go argue with Bjorn/Konrad about this, wasn't my idea.

https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualc=
omm.com/
https://lore.kernel.org/linux-arm-msm/b98d305b-247f-415b-8675-50d073452feb@=
oss.qualcomm.com/

Regards
Luca

>
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  .../bindings/pinctrl/qcom,milos-tlmm.yaml          | 133 ++++++++++++++=
+++++++
>>  1 file changed, 133 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.y=
aml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..0091204df20a0eca7d0d0e76=
6afcb8d08042b015
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml
>> @@ -0,0 +1,133 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/qcom,milos-tlmm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies, Inc. Milos TLMM block
>> +
>> +maintainers:
>> +  - Luca Weiss <luca.weiss@fairphone.com>
>> +
>> +description:
>> +  Top Level Mode Multiplexer pin controller in Qualcomm Milos SoC.
>> +
>> +allOf:
>> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,milos-tlmm
>
> Before you start adding such 'milos' all over the code, you need to
> update the rule for compatible naming. I don't know how thus I would not
> recomment the switch from obvious model number to non-obvious cryptic
> alias.
>
> Best regards,
> Krzysztof


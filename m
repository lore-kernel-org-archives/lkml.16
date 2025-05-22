Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B5C221576
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747894514; cv=none; b=svuXi3vAb1LprKjAvOB2+kFhyP5lB7bdzndqkWWCHO9NnbCEacosmzkkMvfkqvrUqRg/EKIobSpj4kCFFMl1PVf3TdDbC/iRoFQ0GEAc9VkaAdP4guzEEFPH6TPUbNtcnAthfXlsnPBskIK2xXWhxRSfRVclo7W2+dGt0lJrNQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747894514; c=relaxed/simple;
	bh=QTnu1Vg9plPSBCYleamIjI0RVzHfQYggAZKE5FDJTdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kubW5RYoBjyJpmFqx9bmipVqMSuZ2Tq3N/PDJopfK6aiv1zEUThqhjPvKgN+vtWuw0YZZr1FtXVtEa4B3ULj1nJQyBYcj4xHnutPve5SFNtFM/Zokl8vGwcVcdZ3Gz9HLcl3eH91Ja7ZOe/Vrdl2zdg4qkTfdrtEpY3xbj04TVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZYzV3fR; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZYzV3fR"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a35c339e95so924503f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 23:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747894511; x=1748499311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uG8OshWifuyuMcwd12q2qjIreQ5QpE1JSphDjs4WrDE=;
        b=KZYzV3fRnj/BksGDgC2DdNlGGa4BoKe44y3I2l/+2ZJO2zZ5AI/grhWDiOjckyH89P
         ZlhcDAf2wQyWjB7A1r5kE1QAuErayiOjsU6G0cMFoiPDppRvoW+g9oDBP05f2X7BsvV+
         1mtE3BcH4TULRJ5U+sIidtGnX1UQQKxhNgEozAg0QmMTDHhVHVrjMe5KNQhrhuIMRg/8
         9QfwLUCfPYitNAtlitq64jS3YATZpbVmwB3SgawcD1ZKnL1H6MBlNrt++eB31M+OsaI3
         WowX+OfnDNwjWd9Sm7SQu6W9k6ICGECzqS/YWHhSppu95eLRxVKLIqv2C1XCdrxQuNFc
         zARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747894511; x=1748499311;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uG8OshWifuyuMcwd12q2qjIreQ5QpE1JSphDjs4WrDE=;
        b=v5mU+jQ8I23oq+8UL5RSEMVgJg89WwhZFBxpG/J7VSuEp1njJKx0mPxE02dYqag4+9
         eKvhUTMOIMSIpvUpQf3NXm6nIuVUeLvwRPLi3jx61pz4QBgopqpvBv3cTK/yT+/0+m4V
         S+wH3O0wcKNd9xI4TxxZoAyD0yz9EwZdMICGIR+/YE4zLJjbT1f4SEM7PyofErO0Z1Mb
         eAmEvYcaOqjhbsKl28SWb2SmbyaQLzQxowVQe2jhTWt9PBvFH5NBQuqczU4U5+AmRvMv
         od18suT/f154I+BHGsc7BEPKj28OTlBIeewS3pQ2WDs2DZVkOH7C6SRbss9JMnzZO3xa
         2IIg==
X-Forwarded-Encrypted: i=1; AJvYcCVQppqtVUNuW8dpzhodwx63IlOPTxWSm9jR3bCL49AnBhD+dNJ/9PtDcOZl4o5EoNfhyqc/3WKRiqnjZSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSwjllHpgEUQ/q2PPOqTDU0oAAxhXXqcWpJ1R6wDDz7sHxCS9m
	e6cs0P1vW80VYCjmMJhSY3cW7C7fUrHK4ePf83fT5V+Nkru93Mttl+9hp6GWJHObeLzCR78Gd70
	hG8dp
X-Gm-Gg: ASbGncvwUGqPpy3dFD/KYHdR6h6WC1uiXnm3fim+/jtBC+cRoHCnETNHfNFf2kzVYp2
	ZsOQeQnCmMo9BZ+EpFMX4Y3QFNi0qpgPz3/MK8bujXr/4RA7nVpdIk0l8NDVwYsQ+vEQOFGKCfg
	GbiTriK/+GGdVSvrcAcAyTMMdxXuMzIHm1XQqdBEOXhxyDeejcmSxwJ+IHuPjUmNaFdoXfoWRm/
	tLUChfpZGy596bSsaO7X9vSwN31iKkY/Spvueo7L3KYbKdhPmA5znFoJ1/uIiO9JbICfNFvKy4S
	z6g9kXdICFrczz5ByLUTvgNQdLeb0rGPqBi/LBa0DIL2ojhM6p+GOrnvqcG/He9r72/88y9qq+X
	vZTJuAw==
X-Google-Smtp-Source: AGHT+IEM9uv1fX2pmqD0YCviR3QYTH7GcWYcWn+mgg1vALiqzepMG4TqCT5yxiQPxW3h/H0yGin7Xg==
X-Received: by 2002:a05:600c:3545:b0:439:9ec5:dfa with SMTP id 5b1f17b1804b1-442fd67590amr76834135e9.7.1747894510664;
        Wed, 21 May 2025 23:15:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29548sm98459055e9.4.2025.05.21.23.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 23:15:09 -0700 (PDT)
Message-ID: <455ef8b8-dec5-47e0-94db-611ac399903b@linaro.org>
Date: Thu, 22 May 2025 08:15:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the i2c-host tree with the arm-soc
 tree
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexey Charkov <alchark@gmail.com>, Andi Shyti <andi@smida.it>,
 ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250522121726.0a4350fc@canb.auug.org.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250522121726.0a4350fc@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2025 04:17, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the i2c-host tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   47cbd5d8693d ("ARM: vt8500: MAINTAINERS: Include vt8500 soc driver in maintainers entry")
> 
> from the arm-soc tree and commit:
> 
>   3887d3f64260 ("dt-bindings: i2c: i2c-wmt: Convert to YAML")
> 
> from the i2c-host tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.


Arnd,

I forgot to mention that in pull request. There will be a conflict in
MAINTAINERS file in ARM/VT8500 ARM ARCHITECTURE entry:

 3425 ARM/VT8500 ARM ARCHITECTURE
 3426 M:      Alexey Charkov <alchark@gmail.com> 
 3427 M:      Krzysztof Kozlowski <krzk@kernel.org>

between multiple trees - arm-soc, i2c, devicetree and pwm, because
patches went through different trees. This conflict will go to Linus as
well.

Final resolution is like:

 -F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 +F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
 +F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 +F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
+ F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml



Best regards,
Krzysztof

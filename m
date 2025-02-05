Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D961519AD;
	Wed,  5 Feb 2025 17:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738778311; cv=none; b=cr/Cb4fT6ft6+ngndp6VXxaDkcH43fgMYUTqHn4XGueQTH0MnUFPSHD3o7rVJkuATaaIHp+vHJ9IRL0RjFIpZaacdoj80i6m+4qoGOJqWvvgHqBAO1hiWSWC2EyZc96gP4r/3y3vIwq9IykZ/U5kJVbvKUINTOV1T5Pp3HE4ROU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738778311; c=relaxed/simple;
	bh=IQ+YnCnK3ZJZCbQU7E1GWEkM/fXgKckB17qO1F85Mzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ac8V9llyGo+YMtmBrNT6lMZHmZ4Te+LkdXPIhbeaFQvlpBkVdA8GKlfYe6B2omvKqZHWmeiOHOM2kLJqNLpNmWSKImWQsF5plrE2BKm8F1OWAdCNwu/aU3OtVflo+D91S4V/756w/oglX+OwotURShic5d1mxZhLC0squYHxZyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDbHNPD/; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDbHNPD/"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaec61d0f65so20903866b.1;
        Wed, 05 Feb 2025 09:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738778308; x=1739383108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fMAEufYTCwR87g7HGV6xU9skq8IOQ0ObyPdkgemU744=;
        b=RDbHNPD/Rjd3VqSAAJFaPexNhgo+SedGRIXBbGjD0FlbR2vA9rcRHqu+2ZpsE1MR1f
         Bv8BgISyxScONToIK+hqBksyjve2my6rrMpcibu7A+w56I5dG5Gs4fmRjNpDauyq0gQ3
         aoLMRBs+xrQTAhdUt0tP6MWpfA28CCNZRE+w/sF6VbkDqm4AvD03VifTaw7Kv327R5fO
         a/2FR/kingPztfC7gEFFdJECCAIAYaEYCoPzId7nfUhCvdd36yNXjbtt7zeytB8COT1I
         00j3Oq/rNUpGc+xk4JONSCzW2I87ooP1yzFM662VZ7ISGL0pGcXyBaZ91PkVvrU++ugi
         aRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738778308; x=1739383108;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMAEufYTCwR87g7HGV6xU9skq8IOQ0ObyPdkgemU744=;
        b=T/JcHTFjEwP+1bfAsQDLsz2fcdKFW5XyXJpAreVs2OeOkBX/CipsaDuwlbNCgey4/J
         ilc7xgWKNd6pTxQm17fYRKcWefXWld1oPaiHmotUXfT9GhJjEv+x8b9OBiLQmtDMLj1Z
         LSquK6RwuEFEcy430FecBhO3OiLAoRvXP6aH3osTfXOD8GiVdVrwqzPZ9WNYJFteS3Aw
         4zDTfgNhe9Jz5i52j3wcGuj4TFqX7U4uWYjWq+zkmoKj7C1HnPNT1NoBB5qVodO3Q8kw
         OmuqnqEoMbF6J5qr4UICsGMJxSfROBpyu/7ZI2YWZ8n2lpfCc7GidLCjLNAEZuFy1tPv
         Hw1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEAc77ZCYh7N163BqnJcnvYgnqodYYrCQvzsm/3keWBKZp4+6sdQlOOQ8H3qyPSAGkUqwyO6wu8Ty3JTal@vger.kernel.org, AJvYcCWdEeft8LU7V+DmUzYTXNMORXvop8WAv/p7wGT6rSV9XC1DVTsOXI/WS/jMpponSpu7J/5X+NXflq1C@vger.kernel.org
X-Gm-Message-State: AOJu0YyFIG5UorUgfGkW+Gj5Uxq6piXW3wiVvR9yoCeLpRUMeQAcgw4D
	fjtV0HMSsJATzM9ioAZnarF1IDuce2CfmxDuC8VAAWk6mC/yTukQ
X-Gm-Gg: ASbGnctCTQMjelqEGgfubTuQifmReeT6NNN776LiNgi/AC1YKiI5M7Gj1OY23DACtwb
	iesfmx6lUmaYYfnRup/1RyH4IctchL2j4LqYaBpwutMZbkuypvFEERNQcHUB/dGRqizguIOO7NF
	vsANvjk4qx9Hw9BCrfy+Xf3I8EyW7Y22aDBsHBjdj4zTNSCtATs7uPv/KPItWn1Uo2sGbTSKhTx
	6BlowShnplOgzJr1kF+qmMRpZrOmT4Q9B+/i0B2nO+mxfRd9iCUc3CTFDkJengmNagsLxDF3qpn
	6eAbCeLk5xtXxEMCpIM2AMJpbAKvnuntRJqQ1UFSo8BrFIr3tD01XT1+vyQ6CDQ2+Q==
X-Google-Smtp-Source: AGHT+IGilRrBoelGh6e28f+nxniHAFHixKNw+Hqvl/uNj+kVv7H6qbFpMqopbuHdNVB1hSsL6gks3Q==
X-Received: by 2002:a17:906:c144:b0:ab2:b4bc:41ef with SMTP id a640c23a62f3a-ab75e2a7677mr388312766b.29.1738778306863;
        Wed, 05 Feb 2025 09:58:26 -0800 (PST)
Received: from [192.168.50.244] (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ffe44sm1133806466b.113.2025.02.05.09.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 09:58:26 -0800 (PST)
Message-ID: <ab853605-859d-44c6-8cbd-44391cd677e6@gmail.com>
Date: Wed, 5 Feb 2025 18:58:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] dt-bindings: mfd: brcm,bcm59056: Add compatible
 for BCM59054
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-2-bbac52a84787@gmail.com>
 <20250202-noisy-impala-of-triumph-c9aa8b@krzk-bin>
From: Artur Weber <aweber.kernel@gmail.com>
Content-Language: en-US
In-Reply-To: <20250202-noisy-impala-of-triumph-c9aa8b@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2.02.2025 14:24, Krzysztof Kozlowski wrote:
> On Fri, Jan 31, 2025 at 07:13:50PM +0100, Artur Weber wrote:
>> ...
>> @@ -22,7 +24,6 @@ properties:
>>     regulators:
>>       type: object
>>       description: Container node for regulators.
>> -    $ref: ../regulator/brcm,bcm59056.yaml
> 
> Refs should rather stay here, so I don't think keeping these devices in
> one binding makes it simpler.
> 
> Simpler - drop ref and add properties compatible with enum for your
> regulator compatibles.
> 

The only problem with that is that the regulator nodes have no
compatibles. I see two ways out of it: either we add a compatible then
use the compatible enum (might break existing users who don't have the
compatible, unless we make the driver ignore it), or if we just want to
simplify but not add compatibles, list all the refs under an oneOf
condition (like it's done in
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml[1]).

Personally I'm in favor of keeping this as-is, though, for the benefit
of the DT linter preventing accidental mixing of bindings for different
device types (e.g. BCM59056 MFD node with BCM59054 regulators). There's
at least some precedent for this method[2]. But if making it simple is
what's considered better, I'll go with one of the aforementioned
options.

Best regards
Artur

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml#n147
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml#n69

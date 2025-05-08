Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8A01CD2C;
	Thu,  8 May 2025 12:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746705754; cv=none; b=Mazusc71EuzrzJaXgj4iT9SlRPT84qhJ6mWsi5HnR8SnB+36kh5aTe3sz92ff3wQqcj7SIt50pnYoCH05qHYkUN5NJxCs74EO2652Sov4OhzRwpAbFYy4yerfDs3qYIO3MUYRpIpOrnuxBBrWBZJaB54M4H1F0jbxzmk8icwgT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746705754; c=relaxed/simple;
	bh=ewbFWdouqvs+Tzgfa8I+GwEn8kVNBT6ROCn75mb2yvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1JlVOFK0dgj0d62IyFQAcumNBh0YBgQJnktRTpLKkgaywkVnbQQMN49BP/GGxHfV6eKrATsBipPXquybBuTd/S9TWCGmZ8j3JLrSXLU6ardvaDMuQlB1Zxct1DwFF7LizLjn55Npmi/+7A4IH7oKXmku7NPjZ3O7z8nviXgMlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTDlEbCw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTDlEbCw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676EDC4CEE7;
	Thu,  8 May 2025 12:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746705753;
	bh=ewbFWdouqvs+Tzgfa8I+GwEn8kVNBT6ROCn75mb2yvE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aTDlEbCw0jx1h0SWkkzSuFdvE62xVY70CKX8jHRW/5YjXPOiWyRLh2IDYpSUWJ2Ix
	 +YWNQP9oIwG0x2qOKVGsnjJ2FnkSOpm0klpp5JMn3Vf7cUlaChnSc4rpcyil5CUNZR
	 8IKBIjrIc55/0mBfUrDH72hkxxcqZHKz8lydh9W05s+FF8eG1zCnanfupXA5PKNLmB
	 7uc3ZhEoenVWzR4v2KoNYURcHK7lQx4zBrNI/9A6OBfe9gFkWmgg+WbF/1W3F+lVmq
	 vhEpeztZ4rA/P3s0Uoi7c4SEBfKlSSHmRbsSVhUI6ZQhS9wlfEiYSsex/9dV59x2tB
	 5JExU25vQL6CA==
Message-ID: <22b7b5fc-6f5a-4ce8-ae12-a7423925c113@kernel.org>
Date: Thu, 8 May 2025 14:02:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] dt-bindings: soc: spacemit: define spacemit,k1-ccu
 resets
To: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
 guodong@riscstar.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-2-elder@riscstar.com>
 <20250507223554-GYA505240@gentoo>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250507223554-GYA505240@gentoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/05/2025 00:35, Yixun Lan wrote:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - spacemit,k1-syscon-apbc
>> +              - spacemit,k1-syscon-apmu
>> +              - spacemit,k1-syscon-mpmu
>> +    then:
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +        - "#clock-cells"
>>  
>>  additionalProperties: false
>>  
>> diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
>> index 35968ae982466..f5965dda3b905 100644
>> --- a/include/dt-bindings/clock/spacemit,k1-syscon.h
>> +++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
> would it be better to move all reset definition to its dedicated dir?
> which like: include/dt-bindings/reset/spacemit,k1-syscon.h?

Please kindly trim the replies from unnecessary context. It makes it
much easier to find new content.


I don't get why such comments are appearing so late - at v6. There was
nothing from you about this in v1, v2 and v3, which finally got reviewed.

I just feel people wait for maintainers to review and only after they
will add their 2 cents of nitpicks or even some more important things
potentially invalidating the review. Lesson for me: do not review
people's work before it reaches v10, right?

Best regards,
Krzysztof

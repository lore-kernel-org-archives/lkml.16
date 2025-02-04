Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C76E2040B5;
	Tue,  4 Feb 2025 23:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738713290; cv=none; b=CDKgJsZR4JOV0WygSMbIh31sXSL2qmKO8o7+eC6Vh9lJ6rnt8epWfP33Fq+1jBt6IQ36d7kPQNt0n6S4nkrpamU2sJKtd3cpiQj35DE9FwGhyfbvdpD0CxxwRV8XyMKbfSvJyZns3ZI1NyrFjUVxq4cIAvBPi3esWyRkHJCMR+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738713290; c=relaxed/simple;
	bh=9q5QUHP2SjP1V2NN0hgA/+eSdcvoeacn3Qllvvzb2ms=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MAlGisr6RYjdApoYlZlfYbvQqen6KfcQgpMVbgrdOg1jn5wmFlRJs/p7oINTQXYFilMXPFWVNBxRd4tM6d1gk7GJY6mkts4ryVtJsAxoe40gd1T8+aP0ShZTjcQ7QZnIQRw6uCTNpBebF1w3myCq+lw93r+7tT/WR/II1WS0tAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=SpMfykSl; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="SpMfykSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738713285;
	bh=6fywcASxWYAyXe88HcHEfSTs2+ci+gNxhmlmjs1+cpQ=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=SpMfykSluKgdk8YeirzJeNWJPS6WWBTrvit5wimmjLcvuMQdWaUsPh4ytqTNWoMOj
	 3TIKvTfWx4ToxQe+CStSaV5W3cA2HKgwoWnTErraOKCRglgNaz9YF/bP6B85VU1UX3
	 1Eh2/Yt5lGqp8aW5C/Q/a8JSS+hE5JMkMQtrA4g7AMp645tnHm5KgExy9sUd/V6svF
	 R4u9YssW0MsdCMYQSA5GrX95gSQQfct4UFdEmc7ef+KscsF6uv31LXH0AbNfSF1UCd
	 G9pEjBB4R2LOdPPtAQH2BfzWmUUZS2pijenEHUmrwCh7c2H/5g7hA5Cs2NV1Gzakqw
	 KZDjolH9iCcMQ==
Received: from [127.0.1.1] (ppp118-210-185-209.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.209])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 27CE77104E;
	Wed,  5 Feb 2025 07:54:43 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250116090009.87338-1-krzysztof.kozlowski@linaro.org>
References: <20250116090009.87338-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: aspeed: Align GPIO hog name with bindings
Message-Id: <173871328303.403310.37142305555247656.b4-ty@codeconstruct.com.au>
Date: Wed, 05 Feb 2025 10:24:43 +1030
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 16 Jan 2025 10:00:09 +0100, Krzysztof Kozlowski wrote:
> Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
> to fix dtbs_check warnings like:
> 
>   aspeed-bmc-lenovo-hr630.dtb: pin_gpio_b5: $nodename:0: 'pin_gpio_b5' does not match '^.+-hog(-[0-9]+)?$'
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>


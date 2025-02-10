Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6A31E1A20;
	Mon, 10 Feb 2025 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739189208; cv=none; b=DCnOmoyFrThc23nKvgPCzo70hIJig3tFp4Md6dPDaL8z+uNU/0NodHIKbY6KhEG+xge7KZnwYDFBmfRS2OT+l6XrfzL0uAKr6uD6t6MbdFw6PUY+cZmi7nnprP0y3I6RpaKXnAprMwCDXs2tKaqbF9km9qdPEGfEgcZsa4J/f/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739189208; c=relaxed/simple;
	bh=HuBxKJ4Rxe9SCxOs5nQLEVz0BLQk8VkiesS5pXJ1q9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B6KJSbzq+M4p7Y1WnVeDWKnm+2kWsuGvloAir2aGDQS8nPjL2Dlca9jPiy+Kws9O+LJE0PD/obE8obU1HAlJYV0Gvq4qpWwVAkqtUaq6+F2Xq51LCAC10Gxbjo6/Opo829JOUhHc5qel2bNxh/F/39zcj94YjZJNfuR7epOu+bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=s+Nok+jk; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="s+Nok+jk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8Kcu6XE1Pl2R37OZwgbkQSGdnaUlnMNddlRe2ugSH6Q=; b=s+Nok+jkiSksrF0Bg8qUzmTpKu
	xHzZe3Tay4sGEcE78uh5thldvZIPOOLd56Rf0IB8HIN8lwYbeMXvkDJqkkcibBnP6731vJffpPPU4
	Glmm4XjmZhBcaxLZBtm6CU0al0HDQ1DSlfWivGsUf0wqRX8zBkdUn+lfJQupDdGPisqD3/KKitJ+Z
	prM9X2NVoNJscwzMUO1srUEPptaktuLkdnSyDciNZuxrgi5PxBIIQca9S9A1yA5YoruhNCAjkpuY3
	6bQcMMIyEENL/8Rm3ZqytQoigwr0tPbFygC7YW96js1te25raJPaNpwA2m/QH8IJnx0UsnMHUUYbJ
	nvKBJ/OA==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thSYJ-00025C-EW; Mon, 10 Feb 2025 13:06:15 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dragan Simic <dsimic@manjaro.org>,
 Maximilian Weigand <mweigand@mweigand.net>, Marek Kraus <gamiee@pine64.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v1] arm64: dts: rockchip: add 'chassis-type' property on PineNote
Date: Mon, 10 Feb 2025 13:06:14 +0100
Message-ID: <2663295.taCxCBeP46@diego>
In-Reply-To: <87a29b78-5fab-48eb-9a86-f12c41369dfa@kernel.org>
References:
 <20250207111157.297276-1-didi.debian@cknow.org>
 <87a29b78-5fab-48eb-9a86-f12c41369dfa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Am Montag, 10. Februar 2025, 12:06:15 MEZ schrieb Krzysztof Kozlowski:
> On 07/02/2025 12:11, Diederik de Haas wrote:
> > Add the recommended chassis-type root node property so userspace can
> > request the form factor and adjust their behavior accordingly.
> > 
> > Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
> > Link: https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter3-devicenodes.rst#root-node
> 
> Drop link, no need to point to source of every property. You don't do it
> for aliases, compatible, model etc, right?
> 
> With link dropped:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I've amended the patch [0] by dropping the Link and adding Krzysztof's
Reviewed-by.


Heiko

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=for-next&id=aba881f30e0294a58c0cb076918d366e39801185



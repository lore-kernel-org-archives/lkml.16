Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5611E5B72
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 17:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745257219; cv=none; b=qN5irxodREXYwUZMaiXTzFc52nuw9pE7ajTj3xecvgX5aMq8gsw7WshKz4aymx5C+Duo0VvOTPUeVAWruy/7OrU28T/1ZztTeOzdqy+//q/ltn8NZsePB0HAy1EFuqLiXfBZsUfXp2tPpvr3hpDajMT4Qstdg6auqpUln3oD7C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745257219; c=relaxed/simple;
	bh=66L2iY9H9WYl2CXA3EnQx1lmEezQGIEG61bPGBz+f9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUawx/KhAlEaAyuIzE4cIFhyb0qA4mcI/TJqBvDann6BuwrQ7vEdRRVd2Xrv/moYP+km7SFoeMEWHI0t5koTWqhrRsatD6DOK7OGosOQDnK3htEzwWTzWyAK3YRpERGC2q0HdnXIWEboLQWPHFobgyTrjRJwquLLDSf/zOAYIcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=grzTbOcV; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="grzTbOcV"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47690a4ec97so45290821cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745257216; x=1745862016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aKl9K7y0OZr7wC01nlMRwEWzh4W8ODSSw6dPpbMz4Bw=;
        b=grzTbOcVPSt+k4KPzGJzpU1f2Plae2v39zSx8n+wfNtrzMewOMbehuVhHkoPFJSPCq
         D5JM2RPHFzb4wYUQpbpfTj9QyV6b8Jp/Ypm8W52DEs9CtVsTCOUHX7Bdd/scFkkposgL
         L6TG18Q8SPPqOaiId2lttpnJbLdXGqoCPRcTL3Sd1OHwn3OwLoxXQXMbvzkqKsRxtAfQ
         WdOgZgqtcoeRCvUDulCPC7MFVqQ03Hk1LypCPzehPr3V4lERTtWP6Pklr9SD5z98tp9n
         l8W5ooC6NHMYJiRuuL9YFByE412xyb2Zhkk83TizjFxOlWT3mMvNmaGlxfOkFV2uMs6H
         zacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745257216; x=1745862016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKl9K7y0OZr7wC01nlMRwEWzh4W8ODSSw6dPpbMz4Bw=;
        b=iku3AgbvACBvSK3xHyF+mbjrPE2e9jwN9Xzw3RxdzmogOW9QRN8dA+C265BPqZGZTa
         d71s6uYBEg2YoEYnEg0TMOsYh7XAnz4KZ7Ti9ra4EtJLKv85UL89atfUUaLVsyBMMDij
         RejHAW8Po3iYlkpwap2DdJD0I6XR7VW4aSwGbzHCt2OPTakU/qx5CmOHaNGusHK4Ld1n
         hRBbwgFJNPO9JLWJvK489p89t0bP6y9crF+nca0O6iI7wtfAtu6pMBrZVcmmUOIQtRTt
         Co0cfGYgM8LnZ8EIu7/RaMwdPMtXMe2hXUJOUroQn5scfLfxoe9zoab67YFV7QgOzpLP
         kAkg==
X-Forwarded-Encrypted: i=1; AJvYcCUpyW2/gwu2Rdps6jY+0gTwkj2GSQwyhnt3GCQFuuFMcBKxixdgXJOcMANk8WgEL4t5fvoTXrJkfPMNMEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqYerPgz8eGT4MW6lK54k/sJEpOYvZhHOBqd6dNC+VVaYpWfA1
	HilNz2RhoxLvSi+UfAdjZ2RPOM/qZRqFYuIWZeqQghcttDhVbp85qyMUZBy5mhE=
X-Gm-Gg: ASbGncvW1Ipscc+oLBs90UePaVYsih5kG/rBoycIgWm7WDdTY78+xSHTRGBv4L7mPss
	yju0UsMoaSs4bZ+tC3/u+z/3BGVf/FCiCtDWwmRn0fm78qTPOC90Wlf1p3uvSSU+zCZvELmMxxq
	ACC/uxr7/ADHr0PdHxYllKdXhx0vvGFYCXHQEuUKYe+P6eHtHYb9eSUwPM42NdGIGSt6rArPSQW
	+4R258+A603Y6T4jNw2QMN2x4+UTn7M0oxMQnUmoknBheyDoU4qLf96305XAjbHbATev+gRmAWv
	z8pBdh7nR7QbatgP3HsKoU7yBRZ+tO/cwHIASbY8iXhqtC9ajFNbNhHl19ogDki3EQja+Z0LgnG
	DKv6d
X-Google-Smtp-Source: AGHT+IFKSFfC6wpoUNvWav/Eqan/OSxBfbY3a7qMaAdUxlTtjGB0fwBAnW5re7pY3Pjp5k2BOvypNA==
X-Received: by 2002:a05:6214:500c:b0:6e8:9b52:7a1d with SMTP id 6a1803df08f44-6f2c450edd4mr263991346d6.8.1745257216244;
        Mon, 21 Apr 2025 10:40:16 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af120esm46284596d6.1.2025.04.21.10.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 10:40:15 -0700 (PDT)
Message-ID: <81788fbe-1344-49c4-9619-ea95956ddf15@riscstar.com>
Date: Mon, 21 Apr 2025 12:40:14 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Acquire clocks for pinctrl
To: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Haylen Chu <heylenay@4d2.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
 <20250419-05-dts-clock-v1-1-1cce5d59aba2@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250419-05-dts-clock-v1-1-1cce5d59aba2@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/18/25 10:32 PM, Yixun Lan wrote:
> Pinctrl of K1 SoC need two clocks, so explicitly acquire them.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   arch/riscv/boot/dts/spacemit/k1.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 584f0dbc60f5b0d078c7127cc4021ad6022cb182..153fd1160182b42fe1a2f7f042c9c1da90f63b0c 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -450,6 +450,9 @@ uart9: serial@d4017800 {
>   		pinctrl: pinctrl@d401e000 {
>   			compatible = "spacemit,k1-pinctrl";
>   			reg = <0x0 0xd401e000 0x0 0x400>;
> +			clocks = <&syscon_apbc CLK_AIB>,
> +				 <&syscon_apbc CLK_AIB_BUS>;
> +			clock-names = "func", "bus";
>   		};
>   
>   		syscon_mpmu: system-controller@d4050000 {
> 

This looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

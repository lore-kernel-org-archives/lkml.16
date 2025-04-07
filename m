Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780FA230251;
	Mon,  7 Apr 2025 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017234; cv=none; b=jA27UOwJ+3cOs0/kdvCef0/K1NT/lnnSaTcWGhdnqPEV6xC5jaW9fGLpNGXc3Lvv6nc0FRTEz+45wlfn6xwmIoJTmIjSdWs2ayVc7ptsO25qQ+ZTDyH1cv2joOpRbz2g0GTXnmfaQXvpxtJs+BWvKb4LLKN51XUaLGDGoAjGV9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017234; c=relaxed/simple;
	bh=5o6M6HM77Ypm9iWSbgwhIBjs8LrS18zfEPaa2ATuhLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=baWRDwkGk3QwvlmWHk/Y1ZFwj+6hJAs5BOmVdeu7YsChI54c8mR8gtEpAJax97QApmoCNnpqktAH2cNXvn+W2edtIRfiNIIbm/83C3j3pyMY3rZjmth0C6ixVIiho1GQBJ+9hlJ6UaWL2Rb9oPIgO2CPn0V8LmdHFRs+v1quEwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glDWs8VL; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glDWs8VL"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so7108444a12.2;
        Mon, 07 Apr 2025 02:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744017231; x=1744622031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1Uk4aOu80S83390MO9VGJ4kqxev3EQy2D7fW7X8p3w=;
        b=glDWs8VLEJOIbMbpZ+r2e596BwhCsMgOsNvaNdmnE6mVDFO+D91Grjgt6wJmPDOor2
         AEXei+Qq6R9WhktKPSQEPOwekG4GfSlk9j6pmfx+YMipEI1aEia54rKamSVl3mgq5Rr2
         3IKbgWjgefxKwXFyYhDro8+T2vBUJjNkceHozy9McqVqj3jU2hw1N7Bk9GoHdr4KwNiv
         jZz/rlc79iEF4mWRKK2LWg0a+ebvLYbcLknsQAu8aUBDfjbB/Z4Wp9etLO0rWtk6Aowx
         kU2WzNVmEsM9TIxlimZCqFrqhry/ym3jO5ToqG0JkZmrOFnKa2BJH40pkfppInoPpOG+
         kJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744017231; x=1744622031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1Uk4aOu80S83390MO9VGJ4kqxev3EQy2D7fW7X8p3w=;
        b=otqFFU1P1h6uVjU7xS4PCY+KpEjiXC56VrdXk/jQ9e9m6ibZJ28sdQio/59mx8ulhC
         ZW7HcUa/7zS9FmCWwsuNT/Q6yDYoJ7OqIcfABl4wzJgcf+6Vwoza/tGXIhqmMG007FrH
         HO95963OBIOu4+ibTtdiL/25Lm3Sn1EbJ8LovZSbmKq5Ik4mYSYHsydhB/NcthHBRKJG
         Z7bVneJ7QCs3PwDKogrO86m4QY/faiDcAt993SYQvQyS1wo6kB3ygmRhxy3S+OLnjKfp
         vGhdgiGyFF9CG5tzDspoNqWzqlg1u//ExGzlg5yNNG1uxG2hRE8bseT+8syjRVZWcz7Q
         olgw==
X-Forwarded-Encrypted: i=1; AJvYcCXpNT35yWEItalG92wQ1t6mSVEhfjxdZDdiMXixfuHgzfbeNCOYOXrGMtwJX/B3RY/w1pCtuqZVnHYoZEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAD9Psxr/67bUbS0sLHY13CzfRhdblwz+ijhsCI/IJpA5ZZh5N
	CwTJw8bCPWPaWzkd4+/wJvdDaACU2SoTyPxLB58Yq9Y5+LEUtJZE
X-Gm-Gg: ASbGncttEsO5wz0ZykXTpQjOslcA1lOWib0P6jQuVaX8kNSDXlDEF4Hhg2+rxgDFrMo
	c6xvr1lkGamnY5hsWbtVGFsIrma0Ze0miQqYqMOVP/mF+fGkAp1Yy1CAl/P7SsltOKjERduoIMb
	JIj6gVIIzpob5x4sYAcvqsQdMMHCyZEGYsf/wcLt5Brg4tOsuNHc+7SUzw3ZW6NK8vV1utuLTOx
	2gMyHGbUNJlSpFHxIyLxFCFuiRLfc2kx2d3OHUXhycVAU73pMjBo6QblnVDrcSVxEXI6ip/1GvM
	9Z0Mp4VCY4bFghQvaLyxRHNMTc5LwgDElYhcymk8dxmOsHBE05ZfEA==
X-Google-Smtp-Source: AGHT+IFT3ocNy0hfSa6LZN537JBXUdT2MD+recEeiEmTsR3iPDKF8z5UKZctlOPeKBh/G3Xz3E5JQA==
X-Received: by 2002:a05:6402:501f:b0:5eb:9673:183f with SMTP id 4fb4d7f45d1cf-5f0db8352a7mr7676899a12.20.1744017230310;
        Mon, 07 Apr 2025 02:13:50 -0700 (PDT)
Received: from [192.168.1.130] ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f08771a1c6sm6490830a12.11.2025.04.07.02.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 02:13:50 -0700 (PDT)
Message-ID: <020081ff-9393-42b2-b0e1-67eed9220aa1@gmail.com>
Date: Mon, 7 Apr 2025 11:13:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: stm32: Document Ultratronik's
 Fly board DT binding
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250326094429.2397365-1-goran.radni@gmail.com>
 <20250326094429.2397365-3-goran.radni@gmail.com>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <20250326094429.2397365-3-goran.radni@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

thank You very much for the feedback so far. Do You have any update for me?

Best regards
Goran

On 26.03.25 10:44, Goran Rađenović wrote:
> This commit documents ultra-fly-sbc devicetree binding based on
> STM32MP157 SoC.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
> ---
>   Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index b6c56d4ce6b9..c1cb54ffb210 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -175,6 +175,11 @@ properties:
>             - const: phytec,phycore-stm32mp157c-som
>             - const: st,stm32mp157
>   
> +      - description: Ultratronik STM32MP1 SBC based Boards
> +        items:
> +          - const: ultratronik,stm32mp157c-ultra-fly-sbc
> +          - const: st,stm32mp157
> +
>         - description: ST STM32MP257 based Boards
>           items:
>             - enum:

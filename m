Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2946317A5BD
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746434019; cv=none; b=pcT2rgY3qRKU30RmK3fogJYBVhias2/H7uN0dQZj0s3rnjbErSrb2WYDGuZFPhyq1G50/kS8eROHy3Qfhk03hQ0tyKssI4XeOfNMq8I6+FZyne0JClRlSt0/Iw4AdDzscw0jVB0MCqIsLq+MGFRWdXC0drfQ3iEAU7SMCEdSa/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746434019; c=relaxed/simple;
	bh=GTp4qNT4p7PYcumgdHGWQ2MrUyt7axUtbBGJeWlQEWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kuTtBMx4UYNdjjy0fC2E/cSiwzUBGLMopX7VxwwnMhoFs48mJmbPUEsHnSC0UPNRXIRWCCzXubhdInfX4WL51Xtd8jTS3+Ehr3DKy4wmy4zveep/x9Up1p2mqq4BLykh/yRw7/02h7S/sW519X4FJYLH4B1Gzv20QTPV36KE4VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LyXPLqxG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LyXPLqxG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so4443075e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 01:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746434016; x=1747038816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z82crn1n4U//C3FmIvYAUlHbuVIi9Mmyz72zvrX3sxs=;
        b=LyXPLqxGClETN/ChUr7Qo1qQWl4G5dcI/sxoKPxzaj2Cg2OPKO641jfDTP67bnVi2j
         9fCUGbyKup8SG8nZGeRDq7vp8VGoYH5HvoAyPbTSJDtkgRukmqRFr9EwbK58r4EzNXKx
         /x8KVKVpbxQnRHBiGzsOyWts/iqU3X2auUQG9Nxh+ae+fIFx96q+UC5SONTN65EovMmb
         UeBaaHO0T09+e6Y05IecRL1oRFx/ImadVOXsp8SF43dh4z2l7CWn5TZloUa6U+TDM3bx
         24wE+DkjDGDZKVlEiz7il6KqkAlPyF1sLrdYSikfF3NG8cQqXJ8Edl7biiVFPrXl3D8J
         W11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746434016; x=1747038816;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z82crn1n4U//C3FmIvYAUlHbuVIi9Mmyz72zvrX3sxs=;
        b=jbDoR0BAFCOxuP6pOx/3269Eq2t6F4poHLqh3595ZzLbiYywmeKUF5mdxbSkdBB54s
         I6KvbFPVjV6e0NQTrtX+dbfsRmKBnW8h/HhNNCAXGCGY2pczKw+Ii18OWR6LWfK80+EB
         bg5vDgjXQr0copcKYehGzvD1D6bjGD0FrZmAckBeMHPSup2Ivmz4l7bTS5oz6tAIXV2s
         qYN0FQPO5Oyb1StqHaJ+HMR3JZ4rXD7a2xRjf8tiU43lwJQHdrYWvS4pY8HhAW9yLZmt
         adB8NQcQGqNpiR//pTN1/h6dkXl/w6C9/dakcixAQYgzrcstkdDj40/AIARI1rsiUYIg
         +vDQ==
X-Gm-Message-State: AOJu0YzrKyS380471LZPImGZy7U36aOx3ZmO8lSEYToDY7GqZVZYG3id
	PFEC1U5BhVx21Ew3X3H8nxZGVY0navoc8LmMMqdq2b2Xv6S3PmAIOV8KlvgQrtY=
X-Gm-Gg: ASbGnctvf4xA52nvpkZN+x48hxPqPhOeAmpFld6jC0Bg3gJB/ayv3w11occmXc7nrNa
	zgTJOUt0j6w2PMQAi3Fk/pfSFazOF9ufBx4yIqZFuu/c9V1MPMatWX7WAI6mEon1IdjY4ft/YO7
	HVzrAw27VfBLRyx8EucxY1Qyz21f23lXhQDueUUc+pjPmodNWA/wetBdCPV7Jhbev6qwqYL1J0F
	/kbumLchFvDSEMSOJEoGowtPhj4DwLiCaIIGf9hHrbYc/SCs+pQPybJ5po7stBvlG3ZU5A8v5Gf
	Sebm6SU6YWdsBcAPV6ZQTGMz1VRoFoGFw4PheQgUOt4X0peHyT3xBUyJtlo=
X-Google-Smtp-Source: AGHT+IEhVDlgnkhCQe7xH6R6QkjJrhUV9ZpsH1Vh6lTQF8rYoOR/pBbGMl9fMDNjidLas075uHLCoA==
X-Received: by 2002:a05:600c:450d:b0:439:9ec5:dfa with SMTP id 5b1f17b1804b1-441bbf38acfmr35906465e9.7.1746434016288;
        Mon, 05 May 2025 01:33:36 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0fe92sm9813966f8f.68.2025.05.05.01.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 01:33:35 -0700 (PDT)
Message-ID: <ab0ab264-4fd2-4826-8a89-eaa55c462183@linaro.org>
Date: Mon, 5 May 2025 10:33:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] [PATCH] arm64: defconfig: Enable BANG BANG Thermal
 Governor
To: Daniel Schultz <d.schultz@phytec.de>,
 Garrett Giordano <ggiordano@phytec.com>, catalin.marinas@arm.com,
 will@kernel.org, quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, shawnguo@kernel.org, neil.armstrong@linaro.org,
 alexander.stein@ew.tq-group.com, biju.das.jz@bp.renesas.com,
 javier.carrasco@wolfvision.net, elinor.montmasson@savoirfairelinux.com,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250113185607.2210352-1-ggiordano@phytec.com>
 <f40e97a2-41f4-430b-b3f4-815587201191@phytec.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <f40e97a2-41f4-430b-b3f4-815587201191@phytec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/05/2025 10:18, Daniel Schultz wrote:
> Hey,
> 
> can someone please take a look at this patch? I can also re-send in case 
> it doesn't apply anymore. Thanks!


Sounds like a product thingy, so I do not see much need to enable it in
the defconfig.

BTW, the more people you CC, the bigger chance no one will fell
responsible. You Cc-eed ~7 persons not related to your subsystem.


Best regards,
Krzysztof

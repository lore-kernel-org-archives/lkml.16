Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0F51D799D
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443883; cv=none; b=b5ozyujzPleuGCZ08WSqY2S54QtvUaP69r+fkudv+41mEE2t5I635pyCJD9v9Zdkwsm8UY82gAfpRQfXiphbakUdljgkg/hAG8eS3AmBcx8rHIOg24p0MqQfkJsH2zhPWmskJEk+r9xHbo2ATQNJ9HfoRXGRtHKZRTP8fYOCTFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443883; c=relaxed/simple;
	bh=y1har2ncqSYeMcbNF3xPx7v4qVPXDkt+yqHZ2rV1WIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AsEbbri+t8wuW0WLRItaN+u/qPkheZhT9Js9fqzJev+Zo+wgx0VP5bXUqpeM9VT3WNaIs6MA6sSzv/YwFOoYF4BEohA7ih6LRtGr0F9iHqpN+4PzjpOf5En9GBI9AsacvkHlF8/fMkCTcdT86cIah71Ot5kj/De2GaWkTbpcMxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N1RSxx8v; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N1RSxx8v"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf257158fso22917965e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746443880; x=1747048680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MSIHoJjmQEmR3SwhanBXvMF/GyBvUaOcIuvCYJy1q/g=;
        b=N1RSxx8vLQBckQER05uOQZhi4vpPHEjHfdPu7EwavZSILPhuPkRoB87Dc9Fyu7bIMq
         YtB0cese4w6FW14MbGiqe8hZk7OwQpneyxXFElsiwDgJ8zsDtv1PDHZCqfYUIO0CwCJO
         75FvfVHYILmMdAt2DS5I0jfA6PDzOhIy4c+TxKptKFDlSc4+6TarpYadmRy2Ib3engx9
         yaSHFAb7Zrm+iujx1Da98Bta29e9T54KnO/RwxekVVcuqpdXaA98FL0G866POoTz4Ols
         pPPFEnJQu9lS/iTKzajLpK9JXQ6ftNlcI2sGW9jqhn51cDra1TRVGeXL0s6QF8Co/Sjp
         oooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746443880; x=1747048680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSIHoJjmQEmR3SwhanBXvMF/GyBvUaOcIuvCYJy1q/g=;
        b=hf60GwtpZy8NSBzkRAUrFHEMl3d1iPkcCrdJCxH6jPIeoao4n3IlBpgafdvqAAmnUq
         EDagSRdTy5JuN0URz5MSl2Ivst2YNzHIoPBCI+SY3jLR6YGrayNZmLg1dto1U5KbBoLn
         Y9i6gAn02MpNomsY4ciHL4uvcQX1KZEJqp7v4talkTM40db68OueuJTGquNaAYtCWoQb
         F54aWbBdIt1tan0WTyNc0TUtnJqcnSKTAkRAiBXdEtA3ni11JL8iNZCZyUnqu8VIvEFI
         BQoucJH8A0cYTd8vXuatkvz1QOZWatrnxqdmMUqqjd+CVKS8OLlZDP35XQa0bMNRBCmd
         INXg==
X-Forwarded-Encrypted: i=1; AJvYcCXjXxooH8qPRh5UivB1jCKKCzUK9ImSLNYLlZhzjn0s8VznTO+S7Y4rDX0pDF+9KNRD7EE6+L8q+2QE4ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeNiuknRwtk+6HpqTGTWdAXo8iCsmAdez+Pxtnzel5FwFSw1MA
	t8358SsqDtGGrX9rR9leSRj1K0wug7lJLjAANwG25MnBQBrkRWwxubg7alfxNLux5hZaxioKDxy
	J/nY=
X-Gm-Gg: ASbGnctxIXS7ZZCXvpogO7LK+EhU8u+K3YAeHbMLP62oiyUXRdEIrhUmzkD0P+ScF7E
	6ldMm2sqZzBuNMxSrSvgj6Ym5RgalpTNCQijrPJlgANHrHzhsKWWp/APocXOy6BD2oAgit9QfCq
	MIGhpFychGiWRo0e9kl0UOZGxQYejmcoUvJyYAUW+oSOxZblm9w7fkBvOKpbNeDhdPbMy+ehOtG
	iQcKJmCms3SXx6lLZL8clGBsReUOyfrFFfSz2dUVHULvXoYiiGsk+BanIwNZSHCN7xn6mpjlzXi
	LpPum+l5Xp+oittsvSQg2Pz5aNTj/0vfgNQLNkUwSEydWnYfhTW+N3GsTFz9yhcRt8jLP0ngREA
	=
X-Google-Smtp-Source: AGHT+IHtLeAYgDITpx3deW3jXAAdVKG9LHkQfNIbFqRoTGdWyF2rh3YZeh6jK1CDMoX4LIkyoL6r8w==
X-Received: by 2002:a05:600c:b96:b0:43d:7588:667b with SMTP id 5b1f17b1804b1-441c48be172mr62376775e9.10.1746443879877;
        Mon, 05 May 2025 04:17:59 -0700 (PDT)
Received: from [10.194.152.213] (71.86.95.79.rev.sfr.net. [79.95.86.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a285c2sm129777475e9.32.2025.05.05.04.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 04:17:59 -0700 (PDT)
Message-ID: <33708722-6986-40d2-92c8-38832467b857@linaro.org>
Date: Mon, 5 May 2025 13:17:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] MAINTAINERS: Add entry for newly added EcoNet
 platform.
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, tsbogend@alpha.franken.de, daniel.lezcano@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
References: <20250430133433.22222-1-cjd@cjdns.fr>
 <20250430133433.22222-8-cjd@cjdns.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250430133433.22222-8-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/4/25 15:34, Caleb James DeLisle wrote:
> Add a MAINTAINERS entry as part of integration of the EcoNet MIPS platform.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>   MAINTAINERS | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


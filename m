Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E08201270
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 10:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746528738; cv=none; b=f7eDTvZcpdKIZHkaiPuaO227Fg7a/kS7/pwcUsLN3/AAXKhSuVu9s057LWvKIXP2aWEndbhQJoZj8DtqESX+DkmHW2j+jwDgsy3ZLYdbDOie5UzVTV+BzXABfgoGzxoise62hbcP+AQcUMBuR5BjtrA3bvlnMS2p6hxV+OWdrKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746528738; c=relaxed/simple;
	bh=LdcTZ1d3zrApl9FJ/dU20RsasAiXDH6rOUrl3yUMVZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMAEB8DM4gi/h9ldUV7n6/CVdMJc9FfjHyC/ncO6mN0PtEKQ/exjm1PZfHgWvINI0Vzo+N6+gisU2ldMDO2pS1wlKD7oPDWr49+1EmVB6/Orx0+Pb1muwFTl52nHIA+p4w0ifFI3eQUqEu2D5u6+vqFT4Pjb/FCryPntk1ZB2V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t307A4Tw; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t307A4Tw"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a0b0dd3b5bso27217f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 03:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746528735; x=1747133535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DCQGBPsfO5vWFkl0A0zD/MgOqOEpO+/052K/NE4TDl0=;
        b=t307A4Tw6uXqCylZRmdpJgsgmAescxrpL9rymZoYr+LajDTroYzuxykMhX4+Hl9NLk
         6ENwyP3GYqWZY5R4vcrw8zo7wZGSr/CvKxNrCIsx9Zz1+ZWYKt0aAsGx5CXmre6mlrYF
         UPN/o88diO15Ytv9YHWxeHdEXM6U3MM4gnL9ns5xlRO57+FcigZttqqyQ+hegr57iqIY
         w8sFCDto/DJwORWlzXlVoxo9cCiyXKl5guZU10kpGoxDuGQEnZHzo0zh52EHWbEqXeBq
         Ig8saV6j4HI68VLRANZcLi8C1W+LAxH8WGstAQPZ5cfhavTWQcnvLBvciOYosPKFMead
         xDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746528735; x=1747133535;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCQGBPsfO5vWFkl0A0zD/MgOqOEpO+/052K/NE4TDl0=;
        b=ilYfjVvP8Vj1cnJPLtj8HEmHcxAYsfcTWVZ8EBjFzodXrhapYyXCi5MD20IfACHoTV
         3f5HabXDxB5o27vzzlkueC9YHD+cSV4rregZBuH+ErQwbBXpK9wEk/irAfT7OLv3l/iz
         ARDvvm1pYIYT4dVluq78Y/Jco4+T9un7KKOjT1FsSrXHliRFJ7kDJm4FaSeY61RMAUVk
         j9XPOT2CKVvx4PhUFwz+zfaQc8ZAjaXyTZ+h+C1zFUX45pwPiiWVa6db2EUtDsadzHIs
         vbiP6jBH/sP55a5WzyAFlzJ1J6BWPK/WEk0RhE0yJ8dAaL7XU8zD/AH4m1O408mspdv4
         /z5A==
X-Forwarded-Encrypted: i=1; AJvYcCXuvlyYWkOZNZfcTYcFCB/gXjkhTJioEGUzgxkECNm3M3yOARu/jf57y1RpUmmLBNL1Kin5W6ov9cDN4g0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxELOhe8I7fXCFaMrEqVsfBLBvOg3coUMd6vHSlOeVQ4ygfW2/9
	xu6RbBea8hBDF2gsHNBBS0UO8AL4K3HBnjsFv+eHI07wJeUrfpwS7xaF4dM5DiI=
X-Gm-Gg: ASbGncsx/9cLPemFtXZo2JllCXOeK60gdV9DaisW5wUTpVTRx8elMe5jseGQ3AU0UbX
	qtBD0Kd+GX0rKUPNP45NrLwIhh+Rax0PpG7rAJWpfs1gGfn69ZPQAjinJjy+utApeV6OY9Z7oFx
	M3JLM3RITSwHmIkySlnf5auNwUp3tdhNoL6q7nEC2Q8KysHJt4cRcDMdPHX3mmyyhLYpBI2HUOP
	E6EkhygoKIex/ZSw0TE7oFqw1z7a/LZ/fj26/EOvT7DZ3adWzgP/x7wkFYbFAm/q2Z1dgRIuHY+
	hWD0uVvGsp/tLnq4VrH3V53yqWyuLRJKFjkS+rNKrktByPvyDgEFs6UkJ1E=
X-Google-Smtp-Source: AGHT+IG+AWKFdW1c3BWzDe6zKGQh1cg2/RqGRVWCUYPzqFEaMQKAz07sa0MgSDalD2L/4cnUy4wIWA==
X-Received: by 2002:a5d:5f87:0:b0:39c:2663:6c23 with SMTP id ffacd0b85a97d-3a099adf5e6mr4448569f8f.9.1746528734779;
        Tue, 06 May 2025 03:52:14 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b170b8sm12995727f8f.82.2025.05.06.03.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 03:52:14 -0700 (PDT)
Message-ID: <3a11ba8a-a9f4-4829-8bcd-56f1702bee8f@linaro.org>
Date: Tue, 6 May 2025 12:52:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2025 12:47, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) to
> ensure the Ethernet driver is available early in the boot process. This
> is necessary for platforms mounting the root filesystem via NFS, as the
> driver must be available before the root filesystem is accessed.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Same comments as for previous patches like this (even the same?): you
are supposed to use initramfs for your arm74 boards. Even armv7 boards
use initramfs, so network driver does not have to be built in.

For example all of our setups use it thus we do not have to populate all
other vendors with our own drivers.

Sorry, but I am strongly against such change. Kernel is already way too
big and with KASAN it does not fit to boot partitions in some of the
devices (and I cannot change the boot partition size, at least not
without big effort).


Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

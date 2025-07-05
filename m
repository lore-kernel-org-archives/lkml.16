Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F21258CC0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 07:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751700785; cv=none; b=W61tin34G4vesgQZl73Pn2fUKzho00pgcfwbr5qmX0Q5DPsRjMnrW6NXEQJbyOTrl4BmqKtJmZuwKMNKgypa6b068/XED9f99SkxD+IQhfyurYUbBOjvjb894WH2xuTgETzP3Ooj8Hx5gg58s56c1jwHjQY0wMIG9kvunY48l8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751700785; c=relaxed/simple;
	bh=0Hj2hsA0yg8eHselRNXLbIxPUVxDpD46JH6KRUdJfCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KWfaumF5PHf5L/da4VAQIjyNpICYfg3nqIj4J2TWIK75/65Ekhdf8p+3z0hyTuVIkxuUyJaa74ZVq/f7f05aBq/kqx7eLzvrybCOfi5Ps0y8IhO0q80WQWO+fMeE0T+wE3xlPCuhRw9DCfrJ7WJZBn+aSPuJPkksh1Jh+poHAUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OUTEU4z9; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OUTEU4z9"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso551857066b.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 00:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751700782; x=1752305582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PBBQIivu9R4hlVII8eARKlvSF8Id6Zmw+UPZl64Yvzo=;
        b=OUTEU4z9nk8S+Rj9rhNYiwzCxch4G91tKmbW1msYac9kCDUSaz15hnEiRXHP6NYBSE
         GzO7+Ucu9HtwZY4oQrpGFq0pAB6btClLlqjfxcJBEx3AIudv2xq/HEbJfg3QmpOaZVag
         X0ONDX5kMRM+gQTnAXxenWpkcIX2VwAcpBDQJ/VeW+r9rremx2BmB2QJLeVUvlxxvPyo
         G6BPRSOFTIgcY1g1E/LkxVeOkbFqsQGOBQ6Hu7I0aYUzYTGdMvHtpQzUOFQZE9SXwf+j
         PCToDwHEnlDOyOb8PW6CT6WjbM02EWlCu26AW1z+zlsge5WfasIyvdxJVEiIIJ/l8gjY
         qDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751700782; x=1752305582;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PBBQIivu9R4hlVII8eARKlvSF8Id6Zmw+UPZl64Yvzo=;
        b=VZtoX1gb0mR+EpLWYbEm7qjg9NaMvBnPv/bN1FBLj/CQUbFQWmJcKS9TgqxUC7WLxV
         8vhSYKjgaI06bZ+Slni9eq+AaSuJ633kEzWfHzBNnqS3XdSQXaAwdLyZHFN9K1ShtzEl
         Tr/A81Dk/KSzS0xJ8ODJBqHWcPvp15O9eME3r5mUjEu+kUnKkx7YvmmbF7epgxGzIS1M
         t8LglV4F8nybuRceWLDVEveuUpX/QVbe/aBcC1ldgZcPrXPSoeDRniarqoKfGECxErmJ
         rZ8cg+LWlGGR0KUM0Q+Tc15t56svZWDHB26K2vo5JKjiKL3hLabWHpSgAejYscVJpNhc
         7kCw==
X-Forwarded-Encrypted: i=1; AJvYcCU+b1yy/iNBf969qYR9faS71wWxdzjQpS6UTaKuZLJBqsdNhvuJD++VzJoWGzpEvO0S2J3odSvjNhVu91o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeHs1ddc0l3zlsklmZCbj6HCvOXAYz4nDsPYvDnmX76Zq4ZtoP
	s3DGTDduViws7hBhpoN8OmrQI1G2xOzjtZ6gmJGIHS5+B2XJrCZdlk496oedormPOS0=
X-Gm-Gg: ASbGncs1/hfZgZlfszOljjSys7/r1hwtsNSeLcSWAyHYsQNIksZb2io8/9qrfW3+q1g
	vFqKuc2f85vMkWI+A5aTz4Vwu/JMA8xwEnN9oBV7LjrB6XTjYOqlBB/8UYA7bguw3f5BloQg11n
	ugRLOsSy5qRknv4WUs1/Yq2eN7hcqwGMDmrIQyRY+3ERWhbRF2X+dK5hwESO0sqESutVouRrvuI
	wGUHuhZU2i27FO8sT/8iTiDp48iW+6yzE6SOF2vuPA1nX3NPFW4OPck+EUmDDXG10wCpX9+nuMM
	HjBPYLbzTZfAknIy/FBIGxfaGKjBUbVKNePFMlaKETnu5+Flz6ydUj9RBQTu8HwIx4u8Tw==
X-Google-Smtp-Source: AGHT+IFKOW5I/XuGd4Dp5owBqCPbOMq1w2RB/ia5hoIkMKyEPcf9Oo2NcunX07fujYumjahMwc5UaA==
X-Received: by 2002:a17:907:97c2:b0:ae3:6e5c:1c05 with SMTP id a640c23a62f3a-ae3f83b2ef6mr584605866b.30.1751700782292;
        Sat, 05 Jul 2025 00:33:02 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae410916ee7sm72527666b.15.2025.07.05.00.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jul 2025 00:33:01 -0700 (PDT)
Message-ID: <c714c568-a661-49ee-9645-4787cf15d24c@tuxon.dev>
Date: Sat, 5 Jul 2025 10:33:00 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] ARM: dts: microchip: sama5d27_wlsom1: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
 <20250521054309.361894-3-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250521054309.361894-3-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21.05.2025 08:43, Manikandan Muralidharan wrote:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.
> 
> Fixes: 417e58ea41ab ("ARM: dts: at91-sama5d27_wlsom1: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>


Applied to at91-dt, thanks!

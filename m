Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB8B1FCD02
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787175; cv=none; b=SuPEvZnjVYVmi54OChBQ1dDesZL3J7Zf4uBr94q/DIICtLsmObN7H9dFf3GZ+OdXLZgFhs7MFVmmfqQwUWsqTNpFABKkgjku6jHeinMRRBrlJ43Psf45/AOkDir5kLramByfHPbTClfTmDZCveD8d+Oddv7n7YVAur/mgTCXoPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787175; c=relaxed/simple;
	bh=hWcjkVvv6KY7K+i5MOmOpjaDm9yKh5mFFQCnW/jf3uI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+bjb14+PIzKs9/JZ2A7wFNB4s46r00BVeeTKzqs+FVp9EDmyvdRFcp/gkEc6EB1lUaP5f1xcR+uIQ5B4xFw0P2zubDnFKkI+e6SeEQg/p524w3R5P0jY3TlnH4RxCVAri7eD2vQ1aZe3UZNq2PFhsubkvA+svZ4xIT5C3Kij0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=TFJY8Pnh; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="TFJY8Pnh"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7430e27b2so38431466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1738787172; x=1739391972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWcjkVvv6KY7K+i5MOmOpjaDm9yKh5mFFQCnW/jf3uI=;
        b=TFJY8PnhtYQY/EbyFjVANJJjS9ShjElv9GBzaKut/LDmIOePLfb2L+elGjot2Nxwyt
         grfA2+4KJcbHLossN3dUgdIdE6ODsVo99t3TWUStjAKGl+kXLjPlnZtEvMUSnWmF4hAJ
         xFm+lfRb3ZAw9OwMtVEOHE7vJa1BcmlnmqWsS9fPM2Vn1kPdfy8F6XbvnYtO8Qt+4/3L
         My9SV359eVsMwcNPd8ESPEolaPpyTf9+HzsNZ/zXOGUMLGw4nGHGquwtSMUmf4+NlrbW
         7NQlwDePw9ldumYLLAvzj3c3H5fyuV0u2YQX5zMV1jBlDHLA0rErOD+BLpvCfo7wF15n
         7EHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738787172; x=1739391972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWcjkVvv6KY7K+i5MOmOpjaDm9yKh5mFFQCnW/jf3uI=;
        b=huPVojQrTJ1K9jQezkXJtvMXgx10A8Rcie9hjgYPteMSu3IX4FCd/OHwvdfU4BSFpA
         WA2B/onvEPBFeB8XJSRb1Bqpc+JpoAQk/pa0ZBCdTY58FjsegJu8fTb4R4Rt3Gl0M8RQ
         ptmzBOdAX9MRybFT4xC1M735U4SSw1WGOwisArEHSGWNwKRcrF5CxXjdd5T7QM55GtNJ
         xic7SAej3t5CvI1mrCwGB800fBwNPg99i45HHf5qsE4ACk9JXX7sTa6SP6uUUsVTPXMj
         cNcIj+kOSnvDBn8BCXUhCTghu/DC5zUCTpvpEP3OtJBw3apgjMYj0pOzPfCmA4Rusj+j
         kVrA==
X-Forwarded-Encrypted: i=1; AJvYcCXzugGfINr5czQvQPf3/Glf7+x824U0y3g34oPIG11ZZ31PWCeuHSpkEjvFoxG73QJjh8CzLvUcqbiQjdA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ui/B3kgVuXOEg9M0YPaCQ/rCVsKA5yveQJn6zHpZDFxdUnwF
	cjlC5gTrqAEwiQqw0m9uWtw0zKA3D7mIrQHu9AY79QZ4WGwF4faxEVy0vj4XxXk=
X-Gm-Gg: ASbGncuLgHJ6ilcCHNYOWzritUoXt63texgwzFi44SMgdSx0eeaVoa1uVfmQKEJCEaX
	bG/vOuw1CKWUFi68iyePHie1QchbMmFCWrjiC02QE8CL/S3yqdrk1DtUxcWnoRC7rK+40Zo6UUZ
	WN4tW+pmSRtwWx0gj3HpEka6eAJn8ea0+JzzbQgErFaLX8zmVWlsExgLCtGX0Gtnc4FCJaSTh32
	vaTgHB9f8Sz4h00pgk3c4Jl4DyEK/6LcCLWKwL7S/VFw8TF4yEzOk4n+/YueoogkEtIFqBZ/vKf
	uV658wVuRxxNK+kVhp96aD+X0zD9fGsPPVRQUBZS6w==
X-Google-Smtp-Source: AGHT+IFaywZdRalBVpVVP5TmbF1T5HAAaPMMuKHq8rwyEDyE+qrnaJZq8qLnDjIR22e45iPw8kWcCg==
X-Received: by 2002:a17:907:d8b:b0:aa6:b63a:4521 with SMTP id a640c23a62f3a-ab75e23a4ebmr414280166b.15.1738787171974;
        Wed, 05 Feb 2025 12:26:11 -0800 (PST)
Received: from ?IPV6:2a02:810a:b83:a100::2e88? ([2a02:810a:b83:a100::2e88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab70e4e3b5esm818932366b.138.2025.02.05.12.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 12:26:11 -0800 (PST)
Message-ID: <93856925-b451-408c-8dee-bfd8dc2d56b3@cogentembedded.com>
Date: Wed, 5 Feb 2025 21:26:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: renesas: rswitch: cleanup max_speed setting
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Dege <michael.dege@renesas.com>,
 Christian Mardmoeller <christian.mardmoeller@renesas.com>,
 Dennis Ostermann <dennis.ostermann@renesas.com>
References: <20250203170941.2491964-1-nikita.yoush@cogentembedded.com>
 <18a72981-9896-4725-8f5b-5783224de300@lunn.ch>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <18a72981-9896-4725-8f5b-5783224de300@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> If the interface mode is 5GBASER why set the speed to SPEED_2500?
> Also, USXGMII allows up to 10G. So this all looks a bit odd.

2500 is hardware limit (or at least the datasheet states so).

Nikita

Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9240211299
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743606785; cv=none; b=uqe2tGws83jfbXzrFMsWuVv2d9fVwu7KTEShNkPxqg7OkafayGViEBb9VhWahb++Vt2Ts4Wgr+T5kWFXcmFR5xHynLg53/EU99jPatrbOWQJpaML4QUxNk/bZcbDs8lyJydbhOioVweQzomPCc9alDS/+EgokW8BfBquDe4xVFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743606785; c=relaxed/simple;
	bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=McPMPc82K3pQwHjBA7aVJN9oybe9WNUFOx5Jgx+UQOw5grIu41YFrPd4SYTqzhvJy3a2uukWcfsXYziVHDYe9WJ93xac3nGe5PLSkvq3lU5ALzuQR2BZ6we5m6XinTgdfl3Djn3UnwzLhEiTfW+Fpf0YY6+DI39tXBnkhhrSD40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z6uezWQ7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z6uezWQ7"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso629646f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606782; x=1744211582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=z6uezWQ7dDeIth+2vg6XVPyvBzmOw1MLWnRwO+kQM5ZKLnS0Hx6O5TlSoMPZprhT+I
         Wf0yfeT0AwhQEfgZL7oWHyekKh6ElOSdQ7muz2lsN2Q24R5sgTzjFwGDBeV/FFWm0SGC
         jolf6caMaNyp8L7FmRFXi0tMnTu0I/4HBZLJYao9Q6evaYG6yIwySfDGp/SFgEToeSbs
         MCteWGjZA6EmHmhhZE3ucAc1OdqNEvlMNIewzEmaXdUBexGUL77R+0jav2DjvkiOzzjx
         ToL3xZG1pUkch+9VrsX9vBZQy1rk4etVvki4BG7kyurb4njrX/QsZITuelJyhqa0lAzo
         +44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606782; x=1744211582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=R495PctORwZpApnK/9E1F78RpCUSQ4WaM4vOLM6zmrGJ5YjXYFupVU5MWb3VK7jXHL
         CbpqMpo7u5fSmGtrigA1jldlMabHk8DvjZz23A3QT0HyVtMhi13OHwN1lUx94fHyTMZV
         7Z9nKyj39NLe8/J6ufHMchFzmh/ZZ5BK3LcDmTDQsjtccVn/3EcR9+Ycl01oITClRpW8
         gAoTkgMAn7ADlRQPru7F6a7MdZdz1S6qad0d6BzXqqW5yCkpWPGbvxQHxxcsXDFrCBUz
         3H9lkJ81UyTMtD+raDB94MYQb1xHT5zggumdbBFqlaYBZ8aH2nuTGSabQ7TnUE+N4dCT
         Y5IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRPR1/ewm61ie4L7fZqwi1XwW4EipvX6RtcXAzNtjbzF6ptc139skbK0O2/RUgZb6ahLAw43pNLf262I4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg+bCBmnytwSPOdYxf4xlwkCr+xht3pwqfLx0uY+GusECTVg6J
	Imhs797kAqmywG4htwbs0jp9fCuxxoMfIfLklyGajb51ydY30I2xHGyLxVWMuEw=
X-Gm-Gg: ASbGncuZikP1g+vS5uBvEBViq1e+k909VTpuwwr/k3Zc4u19J6/wOoT7DR3OEUN54hD
	ZdPDui0ihM9EiVEatDqf33UL8WcUVWIrWxEz5f8A5Et5fFxYun3vjir2UentZsY9LxgCbTamrzV
	gNaSHAp3TDPVAeoshrEKOVY4qjmTBVGnPvPsTVZmdPKvvxQwtMyBYhT881WUotW2nixvsZehg8e
	pzfN4AygSTfLcPIlbw1UnHxs88InapeB44nNPldFdLb5p3b5EaTWEmVds6Plp/5+vmSiy9cUEsD
	JAE8LVwPI+RX02J/x28o+YeHKp8v+BBDwVOmvgIriOh0tL9Vk6HXWEQCgSnHrNAE
X-Google-Smtp-Source: AGHT+IFV9QpbI0qs8JcCYzb2VYhkvSErn0rn2p4Rwg2Fm5QGA9G1fELHCwW5wiHnCk/8OuEs+wna5w==
X-Received: by 2002:a05:6000:2406:b0:39c:266b:feec with SMTP id ffacd0b85a97d-39c2a668a72mr2107256f8f.7.1743606782017;
        Wed, 02 Apr 2025 08:13:02 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a41e8sm17495162f8f.92.2025.04.02.08.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:13:01 -0700 (PDT)
Message-ID: <660f020c-1a33-4514-8946-2527053795a7@linaro.org>
Date: Wed, 2 Apr 2025 16:13:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/21] mtd: spinand: Use more specific naming for the
 (single) program load op
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-13-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-13-45c1e074ad74@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8825C1C07F6
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750749445; cv=none; b=S07eE/pjPULDHYacOYcbSQBqhrJ0rKJvxN8cPJK5P1aglNakard+R8XXk0RrbpwVN3sTS1QchcXFLU7T+3x6AYcyoedK6yHDRQBinlOojPfsspx1zczjTGzOAhwYruxdNXFuMupZPcV6Q0z+M+2PORlb9zK+ysTKUz+0ft5akLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750749445; c=relaxed/simple;
	bh=TRc1zTyDT+fSz1+8EWkcifTl3VXwxxu/hq/2O257E7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJs6Ytvbiq/kQj+21N+Q2I3vHR6IFNIRaAO10hjcV0nfkoN16N5V2qe4O4RJWYpHxUKPWb9W5XI4lIvro+gOM7lRZ0SkAFXUDSxkVFGdHRXxNtgr/rdynvuEqfV0cMevtWeAhnm2K7fJuBWBb3YQM35HkQl/+Qm1gzwmNwkibtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IZcRYgRA; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IZcRYgRA"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60727e46168so211770a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750749442; x=1751354242; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BFcrVzxUEB1S/HzKHEfngpEGCMqUhWHufb0plvtAAGA=;
        b=IZcRYgRAilaTPb4aweWLLj//GTFM+lonnQ1QdaBTPdEdkrUnUisVprXWWVqc1LOXJB
         Gv9zlijJQrpoxDfUlLAnuRIHGsUqWTt9IpvMLIbrkpxR+8/Vn9uLiqq3kEWEAwmhdhjv
         xs214xm3VjI0hSlJv2sVdGWUIlOzwxCtLWBOw4uV1RERaI5+znwXJianqrEJEJhmgi+t
         4KQdrWcgXTVgUnU95/vESOoqEXR8I16phnXkDD3DsThzTMdK016rx1Z1JxpkKsp+cdq+
         tAZo3ubJz2i6AwuMFcnkm3j0dQlcVWE3zLeRq0sbmEHOxIm9CCiq0vE8FRyF4XMGezli
         uYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750749442; x=1751354242;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BFcrVzxUEB1S/HzKHEfngpEGCMqUhWHufb0plvtAAGA=;
        b=rc/KNFEJfd/TFIK4+Ap0yJNdq6JEn4JJFqxVUrrMVyP+v19et25ZxLQf2imq5ym9aH
         265QylcdbLjdGMOa2+nh+UnZI8BqBEPNXFgNUwgYI+Dwcf76OLH40IG+mXbjiix3H973
         Xp/OdSIo+6Fp2dodceUy7Rd+K5S3QyMBxuC1KbX4bJbf4JhwzdvcEWSb7ASrBZCOWxHQ
         FjC4zNhJI5OUME/qjire+JTSViVYfIvRzfDRa4gVvwHAElqzb+26dD3Vvcwqdq8IkeFu
         H5k9w+jYC3JkhaFGAE3KtjFnrX9HM3k8LM8t8848sXOeb9sL6g/nFbEshEDUp25gd9F5
         ScRw==
X-Forwarded-Encrypted: i=1; AJvYcCXIpV+8UkXtuaX80RgmHCeInQfeySXsHN5FPWb1cVpVN8XhcG2+/dI7eM+BjzTafzyC/X9EkGRWwimpkyw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbh8aD87h8Fswn5BtvAkg2ofHYaO7cprC8BI6nRC3oFltzEoVE
	K4/U9BTmMl/jtSrhXhIq/9yl7+i0vWceg1h/KNiMS7Z90uqte1yuUjhFlZMJFpe1lr4=
X-Gm-Gg: ASbGnctweFeqiP/D58h75v25PqzWWBEHlg0nqKARG8ZGh4OZihfeat0DfBkN6/YJj5X
	E3m6ceU1KhHBvuqF6eALLRdwp7/4x/trWeoLFsb9EtvwkmpN0pJ35XHzQrhsubq2jMGPVK6m5Fd
	OjcuLk5vkfAIVnDRa5NO01+PnkJhO9gIMXryNhKx7RAXkr3k1vQ/dnHyAXT8kZO146HJubnLeuP
	RID7VEja/w6XQzLcJUzEg48r6tNrIzprxa9Nly0tyoTQdTYo1iOJvojNXk3LYGvXheEQgn14+Ij
	woa4yc2CjiyBTY6fwy32rZeoh2PJ6+MUYF2LuwO3DoBLFxmvQTljXC4L5jLP1lMUJcuDUTSW0C9
	hvI+wmA==
X-Google-Smtp-Source: AGHT+IHDBqsRD74oW/38B1NadGOMpbn1e6oDld5G+sNW0edHiEBc7YbTzm1EOFJjzNfF+PtIsVilgA==
X-Received: by 2002:a05:6402:5215:b0:609:7e19:f12a with SMTP id 4fb4d7f45d1cf-60a1cd1ce00mr13959431a12.18.1750749441913;
        Tue, 24 Jun 2025 00:17:21 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f4a6307sm570954a12.74.2025.06.24.00.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:17:21 -0700 (PDT)
Message-ID: <70547271-95d4-4da6-815e-1a140bf00859@tuxon.dev>
Date: Tue, 24 Jun 2025 10:17:20 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] AT91 SAMA7 SoC Clock Adjustments
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1750175453.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cover.1750175453.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17.06.2025 19:08, Ryan.Wanner@microchip.com wrote:
> Ryan Wanner (3):
>   ARM: dts: microchip: sama7g5: Adjust clock xtal phandle
>   ARM: dts: microchip: sama7d65: Add clock name property
>   ARM: dts: microchip: sam9x7: Add clock name property

Applied to at91-dt, thanks!

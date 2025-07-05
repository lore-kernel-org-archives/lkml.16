Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F3F347D5
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 07:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751700610; cv=none; b=N6oHrMhoBpI5NzYLZ7OxYwjy6NCRCLhl5r3HZ4jzu5/BB3dydCGnLRVvfpp1BEIlSJTWoIehHkWzbGxMcCDqHjqOVhiQtxCdh+bpDm/3R1vTpkORaQahSXRu/aO+l7sgBK6/gl5KO+gGXNoNNwZnyinvRvt8aw1PIh4suJxkmb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751700610; c=relaxed/simple;
	bh=UIZ5YZVciwBI4xp8OBbgIQdORnOfX3xnFzLTHbiLRdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OXfS4rQh4HOkb6FwzMzuMUgH01nTj1wfFNHV7F56uEp10RFAIX7KG5U+KCNmx1nU5vP3w0AWGoBHWyh+vc9AU7FOfXsQXn/nUxIoRsrPZaRN+duWdbkBdobrdJqw+hN5cBYInZBdHfGiKHjh8hpNLVtqeKcISpoosGN2XFjMwjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qySSDxXq; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qySSDxXq"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so260374566b.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 00:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751700606; x=1752305406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xk44P/tMwWb5jvG2T/9WPa4Knpsi/zzzC0HCj7+/6MI=;
        b=qySSDxXqbvhKkeoMpluFd/RpiOGTKZqTHFL9UbcbHIT/RbEFm8DxohYUrudwogQWrq
         nbitZrTy+0W4OY4GdMpKG4xW/BbHjBI7TmKAtn20/Tfmxm2Ih1Od0dwvxiyO9sFm1tQL
         XQE/fu8YJqM/u5YOYXkyxk6uPENx2Bf1NzdrWPX794FKWrpGX1ahBMZpu3s97bra936K
         C3s5qgDvswmQ1bzek9GGOHQgdbQFhxT7qox3BXLAvXuOqv7FQ+0DcQFm5AKil0/qYaEZ
         Xp76j2wZEM78JO/Mwbkkq8JZsNE1X86lCig/i84EImeQcItL97Qs3rZr2L+QGLSNwyMc
         w/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751700606; x=1752305406;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xk44P/tMwWb5jvG2T/9WPa4Knpsi/zzzC0HCj7+/6MI=;
        b=XaHalPaxDLgTN4ynLmrqOAS0KUYMlCQf8ivPtmhP/034mXJ51pygIVNvGoYH9S5qA9
         Tq1+MzAN51lASIDZ2W3seGv1qfhpgV6xu0ldAczE7mq1TZyw56j+dKn2maedV4eY/TW4
         t56yBCXVKrwKtKroqxdg3m/Hr/CEf28iSvVuBgwBCzxIsFtHVJw193maQSvi3CrM/+aH
         COPOvR39aC+8dlWXxt07lu6oZA4d2y0qTt/qZT9YNE6udghynzkKuHGgHNhgPBuAzz7h
         pDc6dntXNzm/psudyWcHN3yd2Ls6zdutuqxxrGWdK9WCjTbwzgaFzh6DuRKHiHaaYn2R
         MIcg==
X-Forwarded-Encrypted: i=1; AJvYcCVCJ/BEUP6qqLIRT4kGWhQAbH/RaPsbZyJGujDR47Zd/EPRJ5lAlzP0QWlP0RkyE6u1j1mIdniPql8yB0w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3OD9FpAG8+d1R8BgYnBZo8WgVRvTBhN+kfP9txRwrjBySh5Lt
	jHQNkZTlnWtBc1ASQv/Vc/VF9GFBZEbhkICg3qgnc/oBspxdhUFrUbJin4h3tdNb/bs=
X-Gm-Gg: ASbGncvGE0c2p6lIoLdEPePZUtd2enWdUjWIvXPneXtvXwhI9gOjOoNB0/aqlbcNNh4
	mnYrhKPjzIn94filgzo1y4d17wy2Aq9OJJFx1Nd5PFP7GqjTiYJQP9Um06Q06XgiVYRgNHEG+g4
	UHCm0e0CoTNOTnSPf4X/kUdrOjuigjPtwYPEgAUePhp2BDoxAQHNZQklT18/5Pqd00VRU0jOSK8
	XcK3k/KZZ+058QulywaC7W1LKEw05zu8YmbgAtSXeiGcUoVeOsg73/Zc9mELYVEcDv+ME3H5294
	67wEBjPaWlqnjX1NDTNA6HiwgdNlmiVMkJycUmow4kQNzoEuoD90McMAWeYkZkiDc1EtYw==
X-Google-Smtp-Source: AGHT+IFuCK5oabUlFZOlpvhu8s1YtyWEfrIHxmGvq90ix7OjS8+i1mXBbg8hRAIoydzV3g5HcH+3yg==
X-Received: by 2002:a17:907:7fa2:b0:ae3:74be:49ab with SMTP id a640c23a62f3a-ae3fbc32cafmr564687566b.10.1751700605632;
        Sat, 05 Jul 2025 00:30:05 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66e6f30sm304287766b.33.2025.07.05.00.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jul 2025 00:30:04 -0700 (PDT)
Message-ID: <a297088c-1242-4ce3-a449-0be0413864a5@tuxon.dev>
Date: Sat, 5 Jul 2025 10:30:03 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: sam9x7: Add LVDS controller
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250625-b4-sam9x7-dts-v1-1-92aaee14ed16@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250625-b4-sam9x7-dts-v1-1-92aaee14ed16@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 25.06.2025 12:08, Dharma Balasubiramani wrote:
> Add support for LVDS controller.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

Applied to at91-dt, thanks!

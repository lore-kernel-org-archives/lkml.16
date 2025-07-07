Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD3B28A708
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875537; cv=none; b=krD8JOcarn+XDrNGmxZv5c00+gn7zpKfgSOkwJjYSybsXkMdagWs1yNkMQDNtYVEy1xbF9+g5FCQHqKVjkMkQzlutLtDAj3Z1JM7hjew+xezYumt3+AybDkcT63fgGJO19aR+DGiONyRzE6ZyQcf+J4FEJvFogzcCHI1B5xLw0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875537; c=relaxed/simple;
	bh=1TjqDgVep254QfrcOu3FK5y0aX/fhgV/uA6wQt9g1B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r9g0/FsayIfyyRtO8Gotav1XCuQ5Ysu/MmeWIVBfaJky7MBjLLKnF/l0E03uunxKT/6QwMJTssZQQrbAiaARrcSBSaFE2YqFTAkfH+6DHMufVWEQWgqQaRzWukeCthKSsANUhxx6mhHlOuIiyp/rGNROCk1HdeWEXDn6gYkqPhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Tg6+KlkY; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Tg6+KlkY"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so5209123a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 01:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751875532; x=1752480332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cfSK4wZ0IXAaLuWeqeSbn2/BZJH/6gHhbVTHrVcpn3U=;
        b=Tg6+KlkYIkFXgXxkf76IBjDYPoDHlDpa5+R9sQ9E0yxapxiDg1ZE3k2CpQNYBwvcJo
         i+6CMi17RguMUp7i2E4Mjkyt/uOxokXr6F1rGWafqb1mSf9Ss/MMvhyGaR1OE2k6d+M1
         V1lOeSCHbtVSOVWlUgia7cx96PPZwlvfwW7ZERFC5QkExixZ5Di+EkRKDx1KmvY0IQ31
         jM6bkw3i1maYUBjsTjAZXvB7aPbVBLsRjo3oZJ9cXRjrlCyzv5/PBI7LI2VKVTHEvd4D
         dVidOtE42tu+55CuhFyvk0Szo4uv9WxS0/XP9QV+pFwk6MBCd8bhQ8B74bpfUfwxFG5e
         bUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875532; x=1752480332;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cfSK4wZ0IXAaLuWeqeSbn2/BZJH/6gHhbVTHrVcpn3U=;
        b=X4z/P0QP9OuMv4u5Vr44nUnXWLvufW07bXq2uTk3fZSndhLiGhqJ8wA4yGqYc2zr6D
         YsiVHqjpsP4ZBFVdm+7t8ew+VeOtOkmxIRSeWjAgKOa9IhyucV5YPYljsJVmMgnS5BYG
         OYiZZLKr6on8Gvs7tG1AN201nX7X+JsJm0V202l9/Xnzu9Do6K1nyqZP/q34SEyQ4X2+
         1yNs0QvgLb8nu3aP9wbUXCvhOpnZqurvTrsFQVdgAW3EMUIerg74OkpvV+KqFH4EZQTZ
         mXU2pKS9iK9XlKCDYy8vXVp5vsyPP17Yl22zjPrXdDPle+29lc+RqzRrQR5HRucuyfrB
         o7qw==
X-Forwarded-Encrypted: i=1; AJvYcCVNv/uHP9JUt43Sse8JSXWTi/Cde3U3QAmsLSfGStCuQ7CO+BnKmM1ouKvFeXcyjh5UgtkpWg7w0tMbkns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw77x+zzZ+E5DVAcnl0eOt1UlF4xpYGF+g9IINMbTFjj6UQjwBX
	iP+6N1AfOlIecbHPxg5i3D45KVbIjxphLdcc6OYTVsiyYqrE+5n+v1nMbe/4EOo2UXM=
X-Gm-Gg: ASbGncuJx3QYyCCgJctWi3AOLZtf7JzmjOCjg2Lj6fV1vYXwDzLNm6J4+D4TdBRFOk+
	KBPlxadrLDir2eqb8bfpTWUIiCBHyqgKn124yZsP/hc1Ue1YmzCEEpoL8OOlQn/ymaFDZ4h+qg/
	k2aPVB2PnGb8i+ecjZJ7391fqFS948uJMe28bX3tThHlXMx/ZMqRz6B6Ygkm2wZynNQwCpIszBA
	Uf4Z++11yX4CdsxL3tLS1VqbVhW8Dv/pz6x4jTC8d1BG4e62BXW739DouU/HyrLhmJ4oQJI6JB9
	t7EZCrWSyvdJ4/ZnFw0hngwbEoZlUhFW3urmB4Pu43CZin3pLMp9Wox3MPFy174BMdlmPw==
X-Google-Smtp-Source: AGHT+IE0L5DPGdmdGEN0u5OQ9V+2BW3fc6+QE6pzmfgPPJld1q+jXk9TxJBBsXR1qKPnO0Xzg35V4Q==
X-Received: by 2002:a17:906:c14e:b0:ad8:914b:7d15 with SMTP id a640c23a62f3a-ae3fbc899b6mr1217341966b.7.1751875532226;
        Mon, 07 Jul 2025 01:05:32 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66e8c26sm650083566b.25.2025.07.07.01.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 01:05:31 -0700 (PDT)
Message-ID: <96af5f63-dbaf-4177-95e2-a6cc24019dc0@tuxon.dev>
Date: Mon, 7 Jul 2025 11:05:30 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] PCI: rzg3s-host: Add PCIe driver for Renesas
 RZ/G3S SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <aGtsM22QYqekuiQA@shikoro>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <aGtsM22QYqekuiQA@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Wolfram,

On 07.07.2025 09:41, Wolfram Sang wrote:
> 
>> Please provide your feedback.
> 
> What is this based on? I tried v6.16-rc4 and renesas-driver/master. Or
> is there a branch I could pull?
> 

This is based on next-20250703. I pushed it here, as well:
https://github.com/claudiubeznea/linux/commits/claudiu/rzg3s/pcie-v3/


Thank you for looking into this,
Claudiu

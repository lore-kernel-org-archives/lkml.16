Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503C42777E2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917633; cv=none; b=l9cZklLN0xoKP5ruNWUKiAB2p4I6+JZLSg5fJ00wsxE4C0J7kh+5wXWl9gn74hNsUg6eZrlRo0d52tP3yFPIWBYR6DoVuHyIs1bbB2EhWpNKKD0i0f1Pdw6Gzkm8S4SwWXMl6CDj3RIxxTtc8l7IcI0qexTCGdv3H2hPTSBuzcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917633; c=relaxed/simple;
	bh=oh7CCnYDblP4XNung4PYLs6HI3+l/+Uc4f9IBVFDP2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7+6qnNWu1WqZ1Sz4oBYszu6hZws7icnxNGNZ1aYbbcFJKiIdB7IMgeHhIb378t/p69GpEt/u0Tq5zS0W9m0EySC839oRCTokC+/C4Z+Wi9n7xegj979/vvV1MP4+kZIQzStfrI8nrUXYDTI9z4eJiwumAYTZ6RTyCGYhPrho5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EtdBdlhb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EtdBdlhb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745917631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mzyYtGASTCZH53kkh5r8Etd3SYnPqWVoda3Vr+Vvexk=;
	b=EtdBdlhb+8XBRCKwFF3oorjfJi9XvQhPwCr9cz2zU0uxup7ryUSB4t4L1YieNBMSrNxGwh
	s4eeQIkinWBX6Rqg+/ECypcvKflivS3Cc0b1zscIDbX0fZ1GaBM/eAI4DNWjk6zaSOkpW5
	4Lxaqk+Rk5PVHEPzMdRrxgk2XxLA5uM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-OS7C5G4HMcSB8jvuPzRrxg-1; Tue, 29 Apr 2025 05:07:09 -0400
X-MC-Unique: OS7C5G4HMcSB8jvuPzRrxg-1
X-Mimecast-MFC-AGG-ID: OS7C5G4HMcSB8jvuPzRrxg_1745917628
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac6b047c0dcso499524266b.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917628; x=1746522428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzyYtGASTCZH53kkh5r8Etd3SYnPqWVoda3Vr+Vvexk=;
        b=amGm/H2SPL0u4XmXYS9YfyxzyXNehES1iSudjHXdHld7doVa3G8lIWmwmFMV/4xr0G
         0p7xZ8nKMHXpVJ7DsIPDAwUGP3swM1yYyDQO972EsAwDsmZHKCb+2gcWERud1AqyBqCT
         BM3lP74Sv0+o9zy2qXzutdcv0306bpj6p8p64TLBFS6C6dKRgBmyo3U6pvxNC6uhulYt
         KaPgQIbzOh7rhHWkyXyQfpTHG1RRIzdMVD86UZUJz6DOcWhpwLoYH6l/eqTncvOK4tZ+
         IUrWedLmo9yr6cfgnqEcwJlJ4diVHQZU0mQfPyznpiHtZTJW15nHkvfwLq7JKC6Qz3Wt
         dzSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV88vxshL/pAeOxpwJk88YnnbepoukLibjaKHw29RsGoXOQyOj2RhIl0cPU/SFn7qStx5Dd5K+aTgxeBYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz36IR6tWcvhUI8k05dR/tCNawMzfplTehyZB92bJCAYC+BT2fl
	hHims9ODTspVh4sKzo7wd2cSZV5i9b3g42n5TzDSBkLu8Gb/u1fJeiukQxyJYLKIudAqtceWSZz
	BPyDXhCgOmBHLOqLj6J7q/ZbXBeP/SSQRxrc8rmJwMSOzVcDvnGdhhY7Mf8xvrQ==
X-Gm-Gg: ASbGncu0QsVSZV3NnCbFm7slP59tHw+/tlfWxasImc/CCOLeqowIsDYA7/UJtegmPBg
	xX5tXOkE43KW7cq8ZBwuhLEuFP3D7b+fj0PkMWEFImDiQC5h7B6JOupJqsOF6dsgqmAd6fewI82
	7A8Q65Ri53CjYU23ZI+X4brTncJtigr0MaFE/mYCYMHbPXqC6f3I1SvUNrPA3ItKpIFJa4JLBOF
	iG/Y14HHtVVL62godRWsQAZBRDsCIaCKSyX5A+POjEhNJ+AnYP6NmowjnghCkJ6qco7tSYsD3aI
	gUsg4tOH8vsCqu8gdJ1G8GaAhCXE/r2/PZnxoqpyZaTGyg9VgSEvQUlOvmI=
X-Received: by 2002:a17:906:6b83:b0:ace:cb59:6c4d with SMTP id a640c23a62f3a-acecb596f66mr114676966b.43.1745917627852;
        Tue, 29 Apr 2025 02:07:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0UT9RESKMoOz8328LlBMB1TkH6XGlQcYjJuX9WOxFYoUYjXafd0Mghnrx4VAIMHLBk84pgQ==
X-Received: by 2002:a17:906:6b83:b0:ace:cb59:6c4d with SMTP id a640c23a62f3a-acecb596f66mr114674466b.43.1745917627414;
        Tue, 29 Apr 2025 02:07:07 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2726:1910:4ca0:1e29:d7a3:b897? ([2a0d:3344:2726:1910:4ca0:1e29:d7a3:b897])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec171fd52sm141333066b.166.2025.04.29.02.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:07:06 -0700 (PDT)
Message-ID: <366c8743-224b-4715-a2ff-399b16996621@redhat.com>
Date: Tue, 29 Apr 2025 11:07:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 03/13] net: pse-pd: tps23881: Add support for
 PSE events and interrupts
To: Kory Maincent <kory.maincent@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Donald Hunter <donald.hunter@gmail.com>, Rob Herring <robh@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>,
 Dent Project <dentproject@linuxfoundation.org>, kernel@pengutronix.de,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250422-feature_poe_port_prio-v9-0-417fc007572d@bootlin.com>
 <20250422-feature_poe_port_prio-v9-3-417fc007572d@bootlin.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250422-feature_poe_port_prio-v9-3-417fc007572d@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/22/25 4:56 PM, Kory Maincent wrote:
> +/* Convert interrupt events to 0xff to be aligned with the chan
> + * number.
> + */
> +static u8 tps23881_irq_export_chans_helper(u16 reg_val, u8 field_offset)
> +{
> +	u8 val;
> +
> +	val = (reg_val >> (4 + field_offset) & 0xf0) |
> +	      (reg_val >> field_offset & 0x0f);

I'm probably low on coffee but I don't see why the above could not be
replaced with:

	return reg_val >> field_offset;

(given that the return type is u8)

/P


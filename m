Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166BD1A314B
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 13:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748527161; cv=none; b=pZtwMviK08XMnZlbdOawYmIzn7XojJJxXe1ON2BB5zNM6ZcME/y54gT1ktzMVW8dJSReknpV6O/94plS+V+Gt99aA/2ZTycSjYlZ5KfIbDR2nbyAMtWl9uvAcVideOHVYyLP6wkT9tGRTw9JYSWZCMYZf4P+tj7hMXlOt6Wnjw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748527161; c=relaxed/simple;
	bh=7LbxeiQ9CUarb7MM6uFQy9Q+5QfMHyPo1PcpNWESj6g=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwmPOOtQydqPNT5Ed2H6AbP2rgKt41iHn2O3M51DGHQroqKHuLwwCn7sZbaczrRbHIFSGh37TEMK2uG57QBd+sY1lwx+Uq0zyYZPwdAIQqGJK2vdo4tjG8FT+KVNTGYHbkjm5/WNj0sA4ZjBH5TxC4Qb9y+aqJv09FY+LigW7n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cg2PB2Ns; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cg2PB2Ns"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-604f5691bceso1589786a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748527157; x=1749131957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bd/re0W0O3SfKxkSQq5B/C3J4e51HN+gv/k4x6dlG2s=;
        b=cg2PB2NspTTW82Qn12xK+O8KVnbJs5xRi261SUqSFQDkvz2oP13dKXJAprPXik5gKT
         xsqODPzQ+hRtKPLed0FyKS5UXSBVKXoph1hfNVJgwI259/TW6yJVZy++FprAh+lkr0FH
         zrAoJqW2XDsDaxazpMJVEEuQ45y2WZxeXBe5hYO3IG1oL5+9CoIdDVFvOnc3CW3+Jicg
         ovYKx5wt95SXDO2zD98anfDAnCHMRGevdMe38Xyg7sfFIpGD1AkdkLNmICtX7KLTynjz
         Q+4j4biALOBjSABx5Gf0UCivsGJexFRJQzF60I7i2bY5XeCAoriPrrqT6B6WQNQ+W84+
         nEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748527157; x=1749131957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd/re0W0O3SfKxkSQq5B/C3J4e51HN+gv/k4x6dlG2s=;
        b=PTNT4lfTg+IBqf1a5jJNlewlr90/43JzeEJM+foWlYBXkLdxsJTly0IvrIalHnCoq/
         C2j4WfQMqKUQvjjERxD6VXu+BLY6ixdSbAzSUJFfRkOLARAale/qEr/qpsWbUNdtXlAQ
         jYpRq2Ebix+o/uhu+xm/+VKNuSWfdAKnMSknVSFU7ZN9FPD/in2F1W4M/D5+m72G8hLR
         xHBjk1JUeFGwZ0HPK+apKuaEmjN06PZaBEPwP8fkCAug59KomvEaP4lynrAoFQ5+byNH
         spimQb6dKHuqPkcfF31I8yn4NfSywFZgpHo5dtBPVbivAQzpBxuCZFMO5zApPv0gLxQ6
         nJUg==
X-Forwarded-Encrypted: i=1; AJvYcCVp0o4+6bXhbOaz+FH+kD49jukRybj9NZB/fpVRJKWQhsg5ZkUhy2oymSylkwuv+38zQFFNm3K4WU214BE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+gEzz5FwPUKjpu/fvEfbTd9VwRPZq7Co4CU5UsfoSvXf80tI4
	Xv8+DhNy+1hxiid+vElm4JZgkaLu3HrRdkByN1jgMQPmbY8/AQAag3hi7yIzsuUo9Mw=
X-Gm-Gg: ASbGncurP0XtVWzNCeRd0Hzkij85fT10ToTqkMQr8W9eKAxrQqmn252BF5tDVbfDCaA
	moHHMqlAazBARpXPAaQtIpPuPz+xBopzhV5kw1UOIzDjDg0PWcO1NaZol5Fsv+yM0f6msXAc9M/
	yep1mWzk2HGtjYaK4YHhUuSlyJAWj/WHkAwGvRWBUQWXbG8YhMGsDZTjhlmyEvFFk1ylD2SeXdL
	HmJG0fiMa9ToMuoFLZbqWTu+Le4jnwgrKqYXr3cs62UNjkjmSoV7N0khYY9gA7qAty/Phdn/6sx
	qB4W7MufH5MBFYH/JLMqYy5dcX5ArLHG7s2/aX9p8vqygmmNf2lCNCsIf5ACFhoAK8ma99i9A+n
	7mqSwFgdyXnWMiLfUwBrVug==
X-Google-Smtp-Source: AGHT+IFe10hNzzDGzxOKftk1BYzLU57XNvgcDOZ24VhiK0GAx5icGmaI6U2aVUUNIweLENXOhsxpSA==
X-Received: by 2002:a17:906:4fca:b0:ad8:9878:b898 with SMTP id a640c23a62f3a-adacda56014mr193178466b.9.1748527157319;
        Thu, 29 May 2025 06:59:17 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd045e2sm148109966b.90.2025.05.29.06.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:59:17 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 29 May 2025 16:00:52 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v12 0/13] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <aDholLnKwql-jHm1@apocalypse>
References: <cover.1748526284.git.andrea.porta@suse.com>
 <0580b026-5139-4079-b1a7-464224a7d239@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0580b026-5139-4079-b1a7-464224a7d239@kernel.org>

Hi Krzysztof,

On 15:50 Thu 29 May     , Krzysztof Kozlowski wrote:
> On 29/05/2025 15:50, Andrea della Porta wrote:
> > *** RESENDING PATCHSET AS V12 SINCE LAST ONE HAS CLOBBERED EMAIL Message-Id ***
> > 
> Can you slow down please? It's merge window and you keep sending the
> same big patchset third time today.

Sorry for that, I was sending it so Florian can pick it up for this
merge window, and I had some trouble with formatting. Hopefully
this was the last one.

Regards,
Andrea

> 
> Best regards,
> Krzysztof

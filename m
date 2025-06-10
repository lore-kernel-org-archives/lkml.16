Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59B128C864
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548892; cv=none; b=jALEyE2wANfsmMPBLDPrY1WPTo1jPREZRsrPXqZQtGnSdkH/M1GRCtBB7IM8XqAwL9HDN5avTRT+gssuLUcO7VxwsIa0ZD3BWUzZjrKBKkxcjbZWmrvgGjZ0A2iO3vfDI+Ir56tLxNaDldh417KB5RR99FExy2qS+FkQHpics8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548892; c=relaxed/simple;
	bh=TTxxRa+f3UnqcCMRrf4H6liRDo8hs3NNhga3PVqNQvg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R/EXjd7VM7WIf1ijtqwb55exvop8/+1Mf0OUCRvKYedcEjW4TKnJMcpmeRVfeqgICZcIupm8GWk2NdeCj7R6V7jZcyBp+kh4X9gm0UFSgSoSx9GjJonp50JBFN6rTZ/Jog5Ap/mYNaY0jQg/Q4HnMpYvdI9BQjP5rjpyUl/C+zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=GLQqoUBz; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="GLQqoUBz"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234d3261631so36625495ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749548888; x=1750153688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zQmyYaU/03+AJvFIA5fRBrVmM4eOz2li116ucuEnt8=;
        b=GLQqoUBz0Jk86m0AqZ6Lyp3F5ESe6dKpMmUyA5ecP+6iVOVbUGtMwgD5BHeq9NgzdC
         ifr7E43rA5ZmFITTUZ0cQjm6TWYbvKAjeBILQWULdrJTETQ4gjQtoZJykBdORCszdqvB
         35vXbJtjgSHsBzOCLxOl+JtQHQrGNjyBv9U++uCG2kSEOtuva8Y5eAnJixWFftsPMOpQ
         3+tbF3x6oq43Nq4zjDx+86BIyDBDRKgH84Rd5jmAdsaEU8hqp6yfD8h2uTD4geEJC5j6
         Vpcuf+4IWcdhbS2f2ASgTx1exFCSvkOdbxY0NG47Gay5J+GOziQMN3YDQSBAX3m1bPFq
         gG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548888; x=1750153688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zQmyYaU/03+AJvFIA5fRBrVmM4eOz2li116ucuEnt8=;
        b=NxvajdPGfn5WmvJqkb/0BmKGmPIz4WagMkbjWIfFOvqOG4BgzhQcGhro4NOUPGrJ68
         UXfn+rJxBCwtCZWkGiS4aKEryRvrjJZxCtUkA89enbBtJmawEj0cmCyklaWRWtKSFDk7
         v/XGDp5x+zh32Zwe3c+kjKwiKIct49s1yJu/4P00+3bJYqRSnIJRA1XOtnYGy78058lN
         wyTbUfDsZ6vzWsmOFuEXKPf8XDIOkuPTsgD0duGyeNbLwnqmOgg8FAxrH1/JSkm19Rm3
         NV/NEhIi+7xpeTbJgObjyybWXJt0bbP1C3f4yhvw3LKds60Lo2h+FfvfJtsnOboNo8+D
         OjzA==
X-Forwarded-Encrypted: i=1; AJvYcCWzuuyyY8oCUDJ8FiXYxS2Ulu2K8xVce77Tv4Hk9Wc+L/JoqueAp86vl3xWLIGlRR26gKUBrHluEviC3EU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf3aYsNe1HqKQAqMaVPRwPpOYSaGyTwVjqA3xM7CHfTiRna2oO
	ZNTL5/Ct5QuipamOr7lYpov2HmvFEEX2M0mFfgiLM7n0K6jSgCEQ6ElSXB0/ka9jNSA=
X-Gm-Gg: ASbGncuRDf0Yq+AFQlLUcLzKbrHe0XyKXZAJwRtJTUm7oz2qTe5ZsEHhXPZAUPG3SSX
	AaU1cM4Dy2kJSx4gbOkaK9jstphzdvP3V7AtLWCRs7s9JTol6M3mKPMau38POWfC0WLvW3IYeLT
	O3FiCRs3j1U1dwIFfFlOJNoWlA10+b9lB69bclFiDoeHxbJ/dczFFQy7b3yqIRZu6biKiFzcb8H
	wlG0unL1Ez4n1k/eaELi68Xk5rbY5a1yU3jv5XB9j4KrxzZK+VGhsdYMhF2NxVrAiryfY6PnbRH
	RwKAEWetmkZ5ocrV0xEkNEIumgwhPc7wtVcH4B6UVvZp0dvabZuoxmbJmFidCoXSOw6Sbh7u0hl
	WBXfCThlfPFWjI67fkiVZkPqr008TSzM4QXxRDDyK
X-Google-Smtp-Source: AGHT+IFTJerKI7nLBzkfbFwxLiCZ8/O3FBsLBWB2rHz59j5SLYJb1rjqSHl7mrROaYWtZGs6ZS1rZw==
X-Received: by 2002:a17:903:41cf:b0:224:1eab:97b2 with SMTP id d9443c01a7336-23601df6a23mr244281155ad.53.1749548888066;
        Tue, 10 Jun 2025 02:48:08 -0700 (PDT)
Received: from localhost.localdomain (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603096949sm67293155ad.67.2025.06.10.02.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:48:07 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: linux@roeck-us.net
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	chiang.brian@inventec.com,
	corbet@lwn.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH v8 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Tue, 10 Jun 2025 17:38:12 +0800
Message-Id: <20250610093812.164960-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <156dc4d6-071b-4cc5-bea9-4579c140b2f9@roeck-us.net>
References: <156dc4d6-071b-4cc5-bea9-4579c140b2f9@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Jun 09, 2025 at 5:44PM +0800, Guenter Roeck wrote:
>
> On Mon, Jun 02, 2025 at 12:24:54PM +0800, Chiang Brian wrote:
> > The TPS53685 is a fully AMD SVI3 compliant step down
> > controller with trans-inductor voltage regulator
> > (TLVR) topology support, dual channels, built-in
> > non-volatile memory (NVM), PMBus interface, and
> > full compatible with TI NexFET smart power
> > stages.
> > Add support for it to the tps53679 driver.
> > 
> > Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> 
> I was not copied on the first patch os the series, so I guess the idea
> is that it is applied through a devicetree branch.
> Ok, with me, but I get
> 
> CHECK: Alignment should match open parenthesis
> #260: FILE: drivers/hwmon/pmbus/tps53679.c:151:
> +static int tps53685_identify(struct i2c_client *client,
> +				 struct pmbus_driver_info *info)
> 
> WARNING: DT compatible string "ti,tps53685" appears un-documented -- check ./Documentation/devicetree/bindings/
> #295: FILE: drivers/hwmon/pmbus/tps53679.c:316:
> +	{.compatible = "ti,tps53685", .data = (void *)tps53685},
> 
> That means I'll have to wait until the deveicetree patch is available.
>
> Other than that, please fix the alignment and, while at it, reduce the
> number of lines in the description. Line breaks should be at ~75 columns,
> not ~50 columns.

Sure, thank you for the information, I'll fix these in v9.

Thanks,
Guenter

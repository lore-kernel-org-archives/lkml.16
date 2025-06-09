Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2F321B9F7;
	Mon,  9 Jun 2025 21:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749505491; cv=none; b=LgBk+u+R8NnFsE8nq8IwyLTV0F7Li/bn2nfQdh06tWRcz8rrFPafiy99yFUbzieDEnmK13vWI66hiToEX7LztoudweF9QSC/sFu1KyJKwPclcY5xUutE3/FThGIQyqDm0Y9Di4J7OihOOAodJ5YRKeKJf9WCBLwgCMzVScrVpV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749505491; c=relaxed/simple;
	bh=iTno/pSsmKH3IZYHLy09owuQiiAJrCl5yto7maO1/Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVagM+t6IIl+NQevv8FaS3jKWJyoGaeBeqkuWHlZo3GCv0F1o9vIeL6P7v/HLb5UO45ZJof/w4Vs0p6HR/0LogE+GbA/vf2gDZ7rQY/nwhTzvog+a5jw9mfkoNLIEiilPgY4IkRLU0fzB0IzNZ0EOemyPDy88H3edaQ5t8oj374=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jw1puFoh; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jw1puFoh"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af51596da56so3298443a12.0;
        Mon, 09 Jun 2025 14:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749505489; x=1750110289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hTRjO+/iO4nm56OljGgthZtGT2JgGw2007wQVtYCLE=;
        b=jw1puFohiaZdiMDRWgNMYxzK3fIx3Kiw1yr6mMeM67ZkQypucLpTDIMrMU8rhsOFoz
         dBcaH+Pnf6r272HSYF82R+BugxyXaz1uYpLk/V/CCyWzEjXZpK6xZsuz8n8+q4JBuJe1
         cxteItTf2otle3A+lJKi6yLNsP117ebraiLSNVHEdogqxLzq4RFbSpr+4dtMxpTveFc4
         EaUaEiQnVGYmTNPm4i14PZq1TaiqKWvbbsGWjuErGSar/k1nqIsPLhc3iLDEj208ceUr
         lrFE73o9XxxvnhdFKez8hoysCWbadkcx/e9N+kS9H3eBEYIprfWV6gCN5pTFZY+lHF1g
         OWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749505489; x=1750110289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hTRjO+/iO4nm56OljGgthZtGT2JgGw2007wQVtYCLE=;
        b=jpfoX1d+8dzGOHq95S7O1Ru1zazeu6mELkg/hHpfMOKBHWhz2qGWXFPpLUyKpzC3IA
         M/klCOARu658enkmh3BsYTGdPjp8f9ChQdTrLTpz1aVSTosVthhG9e3IT7b5o8caXMZo
         9YlaGNyaEAEqPb9raCGjdK6jf3vKLWEsyZsGS2sVHQxug5yhq5GRUPAysSusqr4psVoz
         hQ0eqifLIOgQoD6g9B9hUKJDx6sG1wvPbYvT0WDGOIUFsPMvk1gxi9d4noyL/MaluK98
         NccMvMrX0ilsFgWb8Dn4cxBs9jzW9jBZOjlhu2/vFzxi2SH349v6YE/5eFcDpQHUX4Yg
         zCGA==
X-Forwarded-Encrypted: i=1; AJvYcCUa2QNte49gee6v5v/E+y7Wh0NgkV+I7nK43UtMHEY+1TtNtY62OcsIsh5hoIF/TZEvgBpKiP26lBaxFSE=@vger.kernel.org, AJvYcCV0sAVTqHdjuoNyiVkurb5WoneCOGC31lsgEsGVP/cL9+4OaN2YZoL5c5nQvkZnul7/9VJZNR6P+iE=@vger.kernel.org, AJvYcCXiw3gnUY+0o1HEMz1WP9DwNir21wXEI4oJaB+48//raQWeLihbIpDBajTS1liCgVx2gVo8YtpRSINRwbTQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6es8ESSmg6qqGnX041MeokUqY9dwR5dozLJdS/oU9mAKsluvt
	JC2SDZdYlUQQV3nhw7ERCCUf6/cGEFYh6ZRzCqcj5DZLNap38XC2CHPR
X-Gm-Gg: ASbGncu0TPeAMedlOY2QRpcTTtEQ9ebJ2TUqiy8BzkPLAvaQsthT3guCv9amNjUMNWm
	3BNynP7rsJDdhqVsv8KH1K8A5hzBhgBr1ygAId+oClpmt4pgnjZwpXpy82uDFcAtG2Dz2kdoz4V
	PMaOzJTjksGvHeR9gboIGiO6F3gTvHfYH9HhLhkOLU9+p9MScmFAwjb8/N8B5TtHwsIkQHO/xQq
	dct77onQATwOVmEPF70kSdoL74OzdeSRGj+c9Vd0HhFXvygdRokgkJAV4Ra0FDnVSggqQjo4Cx1
	uyiwq1mBfgUxl4Ao2EgDo5EP+pQEo/0cDDNF7D/oNUWJKiGqKOTAcaP25S06TINlZcrkWMtt7s/
	AydeLCXv/Mg==
X-Google-Smtp-Source: AGHT+IFIhIRlu7H7GRIM5kBMPGnoyOA+Q6qRh2XJheD4Aw8wYGONksyoiadJyqU5st/9HYNDVMedvA==
X-Received: by 2002:a17:90b:50:b0:312:f0d0:bb0 with SMTP id 98e67ed59e1d1-31347302a8emr25430172a91.12.1749505489349;
        Mon, 09 Jun 2025 14:44:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b044ef2sm6155649a91.3.2025.06.09.14.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 14:44:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 9 Jun 2025 14:44:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chiang Brian <chiang.brian@inventec.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Message-ID: <156dc4d6-071b-4cc5-bea9-4579c140b2f9@roeck-us.net>
References: <20250602042454.184643-1-chiang.brian@inventec.com>
 <20250602042454.184643-3-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602042454.184643-3-chiang.brian@inventec.com>

On Mon, Jun 02, 2025 at 12:24:54PM +0800, Chiang Brian wrote:
> The TPS53685 is a fully AMD SVI3 compliant step down
> controller with trans-inductor voltage regulator
> (TLVR) topology support, dual channels, built-in
> non-volatile memory (NVM), PMBus interface, and
> full compatible with TI NexFET smart power
> stages.
> Add support for it to the tps53679 driver.
> 
> Signed-off-by: Chiang Brian <chiang.brian@inventec.com>

I was not copied on the first patch os the series, so I guess the idea
is that it is applied through a devicetree branch.
Ok, with me, but I get

CHECK: Alignment should match open parenthesis
#260: FILE: drivers/hwmon/pmbus/tps53679.c:151:
+static int tps53685_identify(struct i2c_client *client,
+				 struct pmbus_driver_info *info)

WARNING: DT compatible string "ti,tps53685" appears un-documented -- check ./Documentation/devicetree/bindings/
#295: FILE: drivers/hwmon/pmbus/tps53679.c:316:
+	{.compatible = "ti,tps53685", .data = (void *)tps53685},

That means I'll have to wait until the deveicetree patch is available.

Other than that, please fix the alignment and, while at it, reduce the
number of lines in the description. Line breaks should be at ~75 columns,
not ~50 columns.

Thanks,
Guenter

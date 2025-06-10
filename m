Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0684918024;
	Tue, 10 Jun 2025 11:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554491; cv=none; b=J/zZeIeeFuKz3SnElec/n3Q/QEMTPEETveBXnoMQ0fXpOYLihLVzLLFXvsTP3XDUeZMEEDxdT8OecBs4v7hyGBDMINOXVNIC1nU4mX0WJ4UcE76si09/RG/uANykPrwvmxENO2I5m4gFiqFFl62P5EKBqsCBTFQZWftTtmJ97YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554491; c=relaxed/simple;
	bh=Lk6yHtpywKA2mu+OirYg/vHASkhb/xK68Pv5VAmQpp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrXfwThQyq9idSSfQzWu1F5V+sb610vSTm+SsHPpV0+daB9z2oh5fkbBjbr6gCJLvAKxsBh7okFCq5yaRxi9LjRSEQzrUbyw1XBbY46POwBASCprmkm7bAUzQcAvkQ5krd4d565CL247irr2YTwZP6AtCtkc5A8/IOS1ieNjsKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJv0NM6X; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJv0NM6X"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f0ad74483fso52894716d6.1;
        Tue, 10 Jun 2025 04:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749554489; x=1750159289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=szmKV8/hLRD/BfhCLVO1JNR0megTPDNxGFTPqcHtGK4=;
        b=hJv0NM6XeyUIrwTUfo80+gmpPsKO7C/gNkOsr7xSzsjHmBVrUvTgLtCwYY2R0u4cEZ
         fXgr3xoInlsnhbYW1lRFt1j2vT9ZYN8o7FktqKsyj4/RPTHLOVOHWbfi113yulbP87oS
         mJ+rHQLhDGCj1w+LgwYZthZzf6Y7fkRZ/noPWgcxT2aaK2ARjXnZLfEWrGN8JK9KjO6Y
         FJ120wE40dmDe/cCYv7R1Sh/JRFeyTxODDEvgT2zRBJ13uGk10ORrVuMHJyyx5Y/S1bY
         njnaCRfpaatx/BeK+rZlp56r9mXO0qvAk7kjPo+XoK+4TmGUf2bEveFbKrXIJofAAvpD
         siTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749554489; x=1750159289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szmKV8/hLRD/BfhCLVO1JNR0megTPDNxGFTPqcHtGK4=;
        b=ZSuc6RBe2y+oW52N7DQhs9kOcgZYs+gXHFBPGidRXoKN1hLmluGP5+66w314DKBL7u
         tXaB/SbhaCEae/SPoNXThI7EcxgXoscy4Bl5Ua5EVeDxXFy/0zzT+OQqsYHMHufVZS48
         sifRxC5FsNxST17t584HycGxAkhME+HgK8Wpbjk8JEgucgMa/SL5hBJfvwuZ+GjxotG+
         wcH8GfI8DbmFdfRVNTuNxDOGPq0lO2rIwAlB6Sw9w4clv20PpI9IEK7PdZiuTau/piiV
         EvHd91qXqT0D5DE9LI0MzFLvTipVelw1+/B1XVk/3h6YXTk7EuBSz9G9/KxVAq0qMB+h
         WsvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGw5uw5h6CCyqbyblskQ9BzMj0ofuFcl9txluX401mLuT492EpWENBOe9xJ4Emb1H/EW/4T2SAwxDs@vger.kernel.org
X-Gm-Message-State: AOJu0YxrpotlHTe11oIB+J9UVg/V4Nxw1YvLUcT3SAvu5ETl1tSdtCCR
	e1cAethXuj0jZwIXSE/sF9RUuYh39AswxMDXG8rJMgiipIpc8Z7pyvtplJxRk/pG
X-Gm-Gg: ASbGncusOZu1T18y+a+ef/8FTaxGXrUybcov7o/VHa9PEF4XueoI6gCBNnXeWaCzQcx
	vZ128Y8WcNiLdW/Yl5htwQ2AJ8yGuvnjSmjDPWOsKGssVfAb3USh0hM3PVK1KuFMi5T/yFU/k2B
	ViUEXh+OWrnob9ERTJ0nRIOUwvhTVBlP/aezLxAxdmMWAkicJIUejpEUiptR/zu4bPtkNN3MYPj
	awmfvGNLXgkPqfucfSoaYO8cnXV4u80gQUpEiHaoKEH5nNErhq+qHJG09wuQxFUd+qh7nhLmMoA
	wHB6K6tDpHI60EudK/U/6uvOncwBtLyKXiTLpw==
X-Google-Smtp-Source: AGHT+IFY5rvDpdmdyeaeDG/4L19R5LPs+YWIFLKwWB5tjYm4meLynLzPKZHGYa0vfPuvDWlt/nZlZg==
X-Received: by 2002:ad4:5f4e:0:b0:6f9:201a:c05d with SMTP id 6a1803df08f44-6fb24cabc19mr37122406d6.33.1749554488907;
        Tue, 10 Jun 2025 04:21:28 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b1cb6fsm64260546d6.79.2025.06.10.04.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:21:28 -0700 (PDT)
Date: Tue, 10 Jun 2025 19:20:21 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
Subject: Re: [PATCH v2 4/7] irqchip: MIPS P800 variant of aclint-sswi
Message-ID: <qsxwdfgrn2wsho3cgqbkfrmzngwbnt3mymem5rf23xpu7s44mm@mc7bzri26sfn>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>
 <iewyo4h3yiqnyn6qrgmckwcaalovpv2udf46jwpor4s5ni5bvu@eg2ikgmswcbg>
 <AS2PR09MB6296822D5ADAEAECCC06F976946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>
 <r5sdm4vs5wayictlhx2zfui76ksrei7bq7wpd55eo5o6ommkhm@lsx2mqsldlu5>
 <AS2PR09MB62968E478451D6D4480A8FCE946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS2PR09MB62968E478451D6D4480A8FCE946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>

On Tue, Jun 10, 2025 at 11:09:26AM +0000, Vladimir Kondratiev wrote:
> >I think all should be removed and it is OK to use old >THEAD_C900_ACLINT_SSWI
> >as driver config. At least for now, I see no similar case about using defined.
> >Maybe the subsystem maintainer can give some more meaningful advice.
> 
> OK, I see. Then, in the Kconfig for THEAD_C900_ACLINT_SSWI say it
> selects both THEAD and MIPS variants? I am a bit not comfortable
> keeping THEAD specific option for non-THEAD stuff. Here it is indeed
> good to see what subsystem maintainer will say. If I remove logic added to
> the Kconfig, maybe I need to rename a single config option to just
> ACLINT_SSWI and list supported variants in help text? If going this way, your
> input is important.
> 

IIRC, I was asked to use vendor specific prefix for a vendor driver. I
am not sure how it can be changed when another vendor comes, so let's
wait and see whether there is some advice to improve this.

Regards,
Inochi

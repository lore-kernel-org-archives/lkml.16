Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AC122F384;
	Thu, 12 Jun 2025 22:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749765859; cv=none; b=eQ5iV9Ee48lWkBVZPs9G/yHSuqMcsZYlc+hZHEGrcrs+sGWwNxdP1fDpMpIXszfiJDMn7sf/t42Cawvx19Z9G+ySstMCCsyqqHC3QBGTilPAoKPyLDu42K5IRQoEU5+25WBnP9mdKFmZQBbKk1BVFAP8wF4grhGn5FOFXKegHOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749765859; c=relaxed/simple;
	bh=RfJASzZb1qIDSgBLejNVBaFi6NPTYNHOZJlPRicbjt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LofIjno9hIt3KDavCRaF4v9qptEYbnbKvDMRX8A7Ch0Ig4m2txEWI4Os39dIa/3xGc9rqjrGDPRaC7/Y806Rxe2zHji1lPeD28jzp4WU2n6SrSM/XH0omXRap8u5oApv9ToBJj149GYkzGC0S1EtgSFV0OH+oqJp0sO12vMMsOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7x+XiF9; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7x+XiF9"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso1367172b3a.3;
        Thu, 12 Jun 2025 15:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749765857; x=1750370657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr4KrCMJQ5nXA8cX+HqskZUQjva7UZ3MKq/H78lqt7M=;
        b=R7x+XiF9QVE1gkOvRrOYpQtsknWIu+ERzT06CdDGAfYG3yoL6pb3TQbdIQEqEQNQpc
         cLRwYlm3TVBEyLZBxtvI5L6Z324WX5FwlZNydpsVE7G/qHYxTnNW7Q77+laGWSIZTSgz
         Zbap7AaD6BkHFd63o+YfFbKYfMbieooSuuphCicmWGi7GNfdDSAuYTHea0WLnNPRKday
         +QQK78AB3wnosYzojHQwVwMORaJxnjwTujEOr6PTlr9uPebbW3WHI3YSdWXZRNmuGfno
         U1rwKXTHSkTwvDwU+Idm3WwxJ3IQgjPMk0uzRsDSSY1WG0U/bX3KPtOU1Bm7mHsFuMsT
         2wtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749765857; x=1750370657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fr4KrCMJQ5nXA8cX+HqskZUQjva7UZ3MKq/H78lqt7M=;
        b=iVyGX8HcERwBQHdI7LUnGzIXxQI8aEQMGe6Y5lwOnhCHqi8IGwnM5F7c7aZzkFVQ3S
         NS62SRB1vuxhNQdE60okvt5HjO2Hc93QRZX1Xsu8HUEeBweixAwPf705DWxX99R73b+q
         WFf2wA4cq5TW2EGwzNPoW66WD1rJtxmEpvaLRVf2r3sdJUeGt8Vy491G640DhUFwps2t
         IvGpFgfR4dBjnhXOCDNQtMDXYEWk2prxuHBdKqBphRCLkYj5SaZ5jkHk6O+dxgemTCqC
         4RhuYKuiFTWmWg2+Cl8PK8o44NdMdBvmNvHJwrDhwj0DVho3dS/Nr5s+dEHFURBxv8xy
         txEA==
X-Forwarded-Encrypted: i=1; AJvYcCV0ZW5UCYtVkbNqHFhEeTSzFSq+zaTNn1KJNUrWHHKLSWW/e5WW6/x+lV9ze/OGTk3jkv814i0N9PAp@vger.kernel.org, AJvYcCVSEkmQXDSrVzvB52wgsAyiN3CE+yd5ZtD7HIcvXE+/TzlFn2mRLZSKMvUR8aoU83gVFUlNAHDeUGhRpVdW@vger.kernel.org
X-Gm-Message-State: AOJu0YxXpR2Ug8RL35RuPI+/vWoTydBRd8b+hMMWepxSJsGoI9ChUFqZ
	ajXGEHcvPhDoLn3Bziq0Gr4KtRYAKXBroSM8g7iPjKyUnXDww1sClDFt
X-Gm-Gg: ASbGncss+d4QRWB2p7Au57rjb2GDicu2u4cp7wEbp2Sp8kbh9Fu1GPzlDMjj3+9ffOj
	QFQNcy69yhDE5d5FntzpK30pgLpCw0TmG/76RLUXfTNB7HCqRFWI/S5dtMoXdOXSV0IKgpSjejH
	ZajlyR7DzWs420UaNKp6REudR7Lq/c+BBXr1KhzFky64QKWZaHHUnNKbqGMkXvyXpxOhxyAjFv6
	UTgqWRBBLLnjQSocGgTcUmviQ6upUg6Few3rT+lu2rsendq8I7vGhyJuGY7Nwz+yOh3s4EnW8ON
	Wxbi8P4Z3mF4IHIqNOOUBpKhCkUIut1CzPojeq1RjhkjI63IcgTeXS1SLnqTtUeRNCgg0jk=
X-Google-Smtp-Source: AGHT+IEBFgndZ4ma3VrBmFJWbwgQqLDt8H4cuSSrnRjAzD9LoUAsVC3TnK5FcePSUnq9KPVeQ5WVFg==
X-Received: by 2002:a05:6a00:3a04:b0:736:5438:ccc with SMTP id d2e1a72fcca58-7488f70d83amr1057601b3a.9.1749765856965;
        Thu, 12 Jun 2025 15:04:16 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-748900d1ceesm230724b3a.161.2025.06.12.15.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 15:04:16 -0700 (PDT)
Date: Fri, 13 Jun 2025 06:03:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: sophgo: add top syscon device for cv18xx
Message-ID: <wyidzvmwepooa2pnmceea57x7ggvar6vyowgom47qgcjbhf3dr@2hxq466muptb>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611-doodle-storage-f1f23230adee@spud>
 <t26cj5xhmkqro5wgf3vqycvgwqhtwv3x6mo25hde3zretbl5uu@xy5igj6vqejx>
 <20250612-specks-banter-adac9a126ec4@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-specks-banter-adac9a126ec4@spud>

On Thu, Jun 12, 2025 at 04:58:39PM +0100, Conor Dooley wrote:
> On Thu, Jun 12, 2025 at 08:30:17AM +0800, Inochi Amaoto wrote:
> > On Wed, Jun 11, 2025 at 05:14:59PM +0100, Conor Dooley wrote:
> > > On Wed, Jun 11, 2025 at 04:24:48PM +0800, Inochi Amaoto wrote:
> > > > Add top syscon device bindings related DTS change for CV1800.
> > > > 
> > > > The patch required the following 3 patch series.
> > > > 1. https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmail.com
> > > > 2. https://lore.kernel.org/all/20250611081804.1196397-1-inochiama@gmail.com
> > > > 3. https://lore.kernel.org/all/20250611081000.1187374-1-inochiama@gmail.com
> > > 
> > > What is RFC about this?
> > 
> > I use RFC to ignore the patch check, as the dependency are not merged.
> > This series itself require the binding from link 2 3, which provdes
> > binding of the USB2 phy and DMA multiplexer.
> 
> In the future, please provide a reason for things being RFC in the cover
> letter or patches themselves. 

Sure, I will.

Regards,
Inochi

Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E024315C0;
	Fri,  4 Jul 2025 04:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751604394; cv=none; b=Prs3RnoLeMq1EGQ8He1fxkf9YF60w+9RB75aD/vP0mkjtPIKIWNHDriABlVp70jef4L7Gu5OEmt8ivoDqUnRJcl8LK99hIiOT4OW9FNZ2ZFn1GVE4Kd6ldYp12D3B2Ymg18nW/6yv1iIhrHKl6crZnrGLhH+QU3g4Xv7dcIUK2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751604394; c=relaxed/simple;
	bh=PKX/xPeaiHcewBqNKuZdPKW0x1IpsTo9+RwOo7Vto4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcTxA9N+8YJweET3vAddKZAcpBejErWjlABTUXcz9EEEOBJfUDNYuIwVmDKxqmlwJWcSdLI7UVedbTx1Y0YAZkP2WQZtgUvpQX92NTzvkn+QkRvOXrBBnVn9fCGHwjHq3aA/TBKOTffin6gzsx+aIzm+Zr1AUBWkB+owOe2E7ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+jusnQr; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+jusnQr"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23602481460so6567915ad.0;
        Thu, 03 Jul 2025 21:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751604392; x=1752209192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xILUeuNzrr/Yo7TFwfYEmVtweggfhUGpHihnp3c3FuI=;
        b=e+jusnQrcTS5Gy9eyfZ8ghqykk3mhp87GandjvbG949fDxNvGj8TJVArkOAAcFt6NW
         eBQczHmCI0SCrkEXlxBE5CxLorcCWSEFiufunjehd3/EnZ4mwUyB4esvSXywhuNpIq59
         HPyGPKlMKmUSQX6PZ9TLpJuvbPVBKHENDKFnbsUxWgypDKTFwj6+4bCkPLVZOgki7wMv
         0XObIyZs7KmQzM7UwMdufdq7ko+ZYeCuh4aPE5Jdf29VHcPmYg9Kig0Lb40sMBswq7zJ
         FIPZywbumej8OHJuhFZ+tdP20aFrXVzFbmmY9PeS9poDmfjNFeDsWMAdXouxB90vol3I
         2ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751604392; x=1752209192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xILUeuNzrr/Yo7TFwfYEmVtweggfhUGpHihnp3c3FuI=;
        b=Z3YGw781EzRr8vCzyO8Hz6zbJYMrxd+196oJXhBe8zDmF2E2hklrpI/lwh/TI2qhzP
         xFPgVx6haQrWLDa8VIx6ZNoRsCLbHEcOrwn2mAwNkSlBLwcxrEwmKJnEkWGC38cHx3R+
         +AtXiOv+nRS7QnuB0OJT+ftGf14bpm6GIVrHHC1uipwQP2NpEbuw9M21NwR0xj/LCJ7g
         HysqK9XxiBEnbLW/LkeRbvu4fPn1YsryXfcsxFvhUdayAxNlViR+uB7PHN4gHSgR6dCr
         UlfacOR4NV6X+Ml8fu5H0fFtMDWtoVj6L+3M07DiC9nPHUSDHhW6H+5Nkr/x34rtaqdc
         cXuw==
X-Forwarded-Encrypted: i=1; AJvYcCURdEBouGfjTsH3Z5VajRY3wXTkyN4VJdvBkBfiNWymI3F0UxEbVE89Mg8mThkDsd4bHIZ5mzVxBPryrEvK@vger.kernel.org, AJvYcCWVG8D63iO1HnbCR8nrbWwQ3v2SlYLe56zWyAUCjzcv6eXq7uPt1WrQqZ1kzsmGu8MR2p35UySK+WVx@vger.kernel.org
X-Gm-Message-State: AOJu0YyeyCAoXJ4Rf1NH155DOd9KZfLZkyNSdcqBaS3lYOvl4znDkxU5
	NDG+v3Zi1S+RAQaiVUUHQBkCHPUoF3oq6ol70CIZINfpJ1yLVZlA67tn
X-Gm-Gg: ASbGncu+cU3LdF2V1orEPmFFJhKV38i341zRF3INvDWTJ9cez2mAhnRkF4408MNGYc3
	AuSfHxlO+gwuciQNb4psaZSZsaoQvMzuKiYArgTePHN3mOiEdsaB+NDSLrHX6Rx7X96AIe0/uPq
	w+ubAXZlMAYKdyZ5Fiiz2KEuzlWrVA9Yt6Qo1aG2T2CzrohbOSpVI/gYMQ3ZHYmA0r4vRlRDl3U
	pPfoAFORF1Qc7vS+hM4+mpAt9mocLlJW/xWWpyjXe3kTcVlb6wvH101VMVM1ATjCrB+gjNgteH/
	pajsLrhXaV5niXQ/zJnDG1hErEEU4a6J1Bc3tmzXc1AA4QMdnQwG55PmC7CdCxlLS8msNnFmboC
	5DaM1Of8D0GlV2Kn/ilrCjRvzVkgP9biJWiSpyoY=
X-Google-Smtp-Source: AGHT+IEgR/rCAd1Y5FPgmuwSiO8qntbXNx6FG654nLbacD0JKhCOt3sZTQYV6V2u/abFqRuVhjf1Tw==
X-Received: by 2002:a17:902:c412:b0:234:1163:ff99 with SMTP id d9443c01a7336-23c862a8090mr23121635ad.43.1751604392392;
        Thu, 03 Jul 2025 21:46:32 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455cc1asm9413045ad.123.2025.07.03.21.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 21:46:31 -0700 (PDT)
Date: Thu, 3 Jul 2025 21:46:29 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH 2/5] ARM: dts: aspeed: Remove eMMC from
 ast2600-facebook-netbmc-common.dtsi
Message-ID: <aGdcpfYM94Itr6ME@localhost.localdomain>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
 <20250702050421.13729-3-rentao.bupt@gmail.com>
 <94e0c5bfe1239e7590cef427cbba405077d56d01.camel@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94e0c5bfe1239e7590cef427cbba405077d56d01.camel@codeconstruct.com.au>

On Fri, Jul 04, 2025 at 09:38:39AM +0930, Andrew Jeffery wrote:
> On Tue, 2025-07-01 at 22:04 -0700, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Remove eMMC device entries from ast2600-facebook-netbmc-common.dtsi
> > because eMMC will be removed from future Meta/Facebook AST2600 network
> > OpenBMC platforms.
> 
> Please squash this patch with the subsequent two patches so you don't
> break Fuji and Elbert across a bisect.
> 
> Andrew

Got it. I will take care of it in v2.


Thanks,

Tao

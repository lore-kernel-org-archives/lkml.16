Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEDDA31;
	Fri,  4 Jul 2025 00:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751587726; cv=none; b=ckrbKawx/sGzjWW2vyKnPsntgsclHCV+g3epCPFHwbp8Bun6KaG8BxTZqtiWJJf3bPud6DdMWYhQnZI47bXhWhJ9YSb9qtvn+pS1Q841/qbm7b2Z9SYNpaHNSON6iH2X/BwvQfRG9N073hP2uzlwWQx/rLxxncQf/jBSKFPPXLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751587726; c=relaxed/simple;
	bh=Uy8XZzJ02bR6/cLFIl85KAvGOLEgWg6DWUi/tNsEDR0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pA9BNdldPCFN57Dy5VGfS0DmGWXGqZnLyFLydUg7N9Dkr2U/oq1ZXBlNUlK114CkxcHKpeR8Nz+T0pmA4BcquHZv117rK8T/iNIwniz0Hdrb2RYxKe0foqcMPBUtoxvo56B22RopszXzR4J80pwtNMAShCerzAntb1UzPWzsdFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=VbNWFjfn; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="VbNWFjfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751587720;
	bh=Uy8XZzJ02bR6/cLFIl85KAvGOLEgWg6DWUi/tNsEDR0=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=VbNWFjfnAw6JAM00tL8QlNCUSMyQC4wsOMYG87a0BS/RcqCNry9MKPqrdlXpqZ+w5
	 ryflkTuHIbD8GKeViQ9QLUcwRDEv4o+t3/79+1g6DY0bwzskpW2lgQ4kcPAjeaWOKl
	 CKrFj9Wemd4fasKclY4tOG6JsAy1L1l9PeplYcbTgLN5rc4JcK5VcEs+ol6GEoCZtE
	 G6x16Lk5bo9qmGgklOo4J268zklnj9D9g0z3lgnT30lk2cRW/IPsJXSV0uUmVaNK3S
	 eiqE/yJKPWKOU345NOar29/amv8Z2CKCpu8hPtUwrPVDV9CHehDbsgiyWFF6/iCW6F
	 PrUOLpB+kVgoA==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1B7496A680;
	Fri,  4 Jul 2025 08:08:40 +0800 (AWST)
Message-ID: <94e0c5bfe1239e7590cef427cbba405077d56d01.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/5] ARM: dts: aspeed: Remove eMMC from
 ast2600-facebook-netbmc-common.dtsi
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: rentao.bupt@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Tao Ren <taoren@meta.com>
Date: Fri, 04 Jul 2025 09:38:39 +0930
In-Reply-To: <20250702050421.13729-3-rentao.bupt@gmail.com>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
	 <20250702050421.13729-3-rentao.bupt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-07-01 at 22:04 -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
>=20
> Remove eMMC device entries from ast2600-facebook-netbmc-common.dtsi
> because eMMC will be removed from future Meta/Facebook AST2600 network
> OpenBMC platforms.

Please squash this patch with the subsequent two patches so you don't
break Fuji and Elbert across a bisect.

Andrew

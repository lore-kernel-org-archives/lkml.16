Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F005979E1;
	Wed,  7 May 2025 02:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746586730; cv=none; b=X4IiLhK/MdsF4lgMmMoqTZjnSg/f64v4s3a1zGHlyQbPfqBqSx7ZigFnLdbznzNbJIWHbb25QMD5I64wj98dDtkdNLDpQq2wE4TUPGTZt4Guc/kK1OvzhSxIM+Xengc9CGUmF5DXDu211xZY7Km0Kv3RUikmy5Mj1TM8138wQrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746586730; c=relaxed/simple;
	bh=nXlSMWZFp/UNpyJGN+JfAGIB2yLICPFXWZ3dy64EAHY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OomZXpEbS1b22y0jjOf4Uy3p6CGCaK0+opfby8iWGKVEE1GJTh4VWdba+atjeDjAWfuu7sA03EA0hjeSMH0hWpQxJn6bVdKX2wPsOfIISslkmjLBtTown76XQtoBqTarT2CLfvAYQLmK5VhWRIMwB2Us1DOmf2LEGol9R/V7Kjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Tvdw5ZaD; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Tvdw5ZaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1746586726;
	bh=nXlSMWZFp/UNpyJGN+JfAGIB2yLICPFXWZ3dy64EAHY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Tvdw5ZaDRfSlNK/cGmHOf7usOW3+sTa/3HirQ9VXE1cQefBjeB3YYi9ersBmWyG/H
	 vwFdvoHzh1Lwlitl4rsZbpgE9QHj9F1wG2DeGzkNTECwZSkNCZQ70IT9SIL+dxNAS5
	 7hZJNiZQySufSsP1Z6UDBwvL1BTjePJCwSuKBIFgfnk4+DIFdLkZpTGd9Nk/opLDNv
	 SGEN4MwMagyXK/PmelwtAJ1hZrxgDqEJSzwfnr5Wh07y1s8XlLMEH2vqGJulBsDtwl
	 3mhOSLlr3DIJaMHm6ka1SJZW7wN9t025Yhvwur9R1bww+9pR0zxSiLa2k+m7R0QB5d
	 Ho3XXZMybvWEw==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5CD5764473;
	Wed,  7 May 2025 10:58:46 +0800 (AWST)
Message-ID: <59c5351d701e9dd5d8ea7d274c6362aadd22ddae.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm64: dts: nuvoton: Add USB Hosts
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "William A. Kennington III" <william@wkennington.com>, Avi Fishman
 <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry
 <tali.perry1@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 07 May 2025 12:28:45 +0930
In-Reply-To: <20250416001818.2067486-1-william@wkennington.com>
References: <20250416001818.2067486-1-william@wkennington.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-04-15 at 17:18 -0700, William A. Kennington III wrote:
> The npcm 8xx chip has 2 EHCI and 2 OHCI hosts with driver support
> already existing in the kernel.
>=20
> Signed-off-by: William A. Kennington III <william@wkennington.com>

Please rebase to address fuzz as noted here:

https://lore.kernel.org/all/2ed50b1463f62a829f863b889ab818f492b73946.camel@=
codeconstruct.com.au/

Andrew

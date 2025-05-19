Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34188F9C0;
	Mon, 19 May 2025 02:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747620938; cv=none; b=EobS5c4tV8FUo+jwPVle+2EgHu1c/4ea8taoahVL+DupKNZ9kHQbNRi9KLsZ/zzn+KnI82bnAxnehO+WjbmpGIiMBX4lJCmfcTwSk1Xffe53sXYc6I40FaxkS0JAnhlCda4BnSlc2Z79/cIlwk0MoVpRz04i0dSmRQublH7wu/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747620938; c=relaxed/simple;
	bh=QbzqCiZt3Yer2/JpapDCEvzPUQewz2zyXItEveGU7ZA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b96vVmnNVarHG9+iXbQpLKV+9kPs1R8Rpg49EbYcdt/EPgri5RYNj55DNGfe8q8qN9DmdUka9XulOxYmoPnY+tAtP5vRMV70V5u7WSu0HuEqeWoxW6nsfr9Jg9yd78gau0rXzUs+cDkQ/rhxgbNpcpSogrWWeGIO4dKK0AbCN3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=JV2XVY1k; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="JV2XVY1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1747620442;
	bh=QbzqCiZt3Yer2/JpapDCEvzPUQewz2zyXItEveGU7ZA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JV2XVY1kKzq/n8Pp1dogVB2cLiExutn9gW+bHLc5lswCsqYkXIlnxvVTh98T2ng5o
	 ptMDwLGXWaSJ9w+eDlVdfiE6GY3oXTgYxzVzePpJVpVDe4BuSdCl1rTW3uvff53n3P
	 WqqdMZ5Xoe6dwA8T9CNFzf+pbzeeyyGIjdSDgr4lnVSe+cfC6YNfHRuOvwa9qMBkJ7
	 yBwDFt3JyMETjxFWRGi7fl0UBKCkT5lJMwevkrDPX9WfJxPIGsiXPuPpiKm397AYBO
	 sIm3014VSdNJJaqE7u7T5vXploRmdOEQynqvXkwJ80BtjSNDYJhLCcmSNZm6Oqedo4
	 M7MdBgwEBv9dA==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 10052640A1;
	Mon, 19 May 2025 10:07:19 +0800 (AWST)
Message-ID: <59519ffdc57a9c34dcbf0348d1f09058dc12fd97.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] arm: dts: aspeed: yosemite4: add gpio name for uart
 mux sel
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <delphine_cc_chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: Marshall Zhan <marshall.zhan.wiwynn@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 19 May 2025 11:37:19 +0930
In-Reply-To: <20250508055612.2613605-1-delphine_cc_chiu@wiwynn.com>
References: <20250508055612.2613605-1-delphine_cc_chiu@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Marshall,

On Thu, 2025-05-08 at 13:56 +0800, Delphine CC Chiu wrote:
> From: Marshall Zhan <marshall.zhan.wiwynn@gmail.com>
>=20
> Add gpio line name to support multiplexed console
>=20
> Signed-off-by: Marshall Zhan <marshall.zhan.wiwynn@gmail.com>
> Signed-off-by: Delphine CC Chiu <delphine_cc_chiu@wiwynn.com>
> ---
> =C2=A0.../aspeed/aspeed-bmc-facebook-yosemite4.dts=C2=A0 | 41 +++++++++++=
++++++++
> =C2=A01 file changed, 41 insertions(+)

Please run your change through checkpatch, fix all the issues reported,
and send the result as v2.

Andrew

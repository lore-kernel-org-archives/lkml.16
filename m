Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCEB1C8605;
	Tue, 20 May 2025 00:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747700632; cv=none; b=IVqAosGTzjHD1qHwSJVCPSRI81z2ZSRQpjc544aM79M0BCeQlct9ek7reuirFCJivEVK7SxvPwLBpyCAyXox/G9XaQuqIOpNHiO3AfXVCNq5B+br6+RnH6hkgBw/k8EoOlW8HduBTmJccddm/g4UQaMbajZbz27kzRhnkYCRrRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747700632; c=relaxed/simple;
	bh=jVbDrHX4p3eETAYYbC8E/B38AzMWjZPxZbviRuREGuw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i/KjeS99OPSi4Y7yYrg9J7UFGb+BIvddBL7eYjnpNS22pfULDBqQ6DuX7W6MwyhQdnUQ8ieQx24yg+aH2M6cXUTZXPj3UEUewtx5FW5ct7rqu+wPPA3PH7hg+86eiCmaoinXNZQNyy+SlywpZfIaoK+ryta+nEB+GiGApi+gIj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=HA7AscUC; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="HA7AscUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1747700627;
	bh=jVbDrHX4p3eETAYYbC8E/B38AzMWjZPxZbviRuREGuw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HA7AscUCU63hu4pNCk7Z8VKwggRSY1X/g/VPH5PfBXPSY/ysZ6+TnYOGje7OE88wH
	 jIy20LQ6Gb6hzjna2EODuadUcLPwDYdpKPOM9EDz+dXCvoN2sy98vGNnxSlnbXHQjp
	 w+FSvaUEbpeVomXLiupz0jt4lRtSL9sgFtL2pdiJQzJ7j5VwBjW1BaR9b/5dy4lp8K
	 BjH+DM8fBKGKw5qPdTjHNuYZavHiiGBfmvjRL9GOJ5PO4aKQFNrdr/SHVoXHg+F8yR
	 rQNZuvPlpre4LzYKQWnIR320KkLwsmwodYltopC+jqqHA0jGMVpuY1OfXTLD/9xGQ/
	 PEFyd/Wuo0gEA==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1291A640A1;
	Tue, 20 May 2025 08:23:45 +0800 (AWST)
Message-ID: <ac008c13719e2c91d7d377cd7a6151393934d854.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] arm: dts: aspeed: yosemite4: add gpio name for uart
 mux sel
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marshall Zhan <marshall.zhan.wiwynn@gmail.com>, Delphine CC Chiu
	 <delphine_cc_chiu@wiwynn.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Tue, 20 May 2025 09:53:44 +0930
In-Reply-To: <7a5f60e9-376c-440e-a369-5c8d5e10c72a@kernel.org>
References: <20250519024850.2894895-1-delphine_cc_chiu@wiwynn.com>
	 <7a5f60e9-376c-440e-a369-5c8d5e10c72a@kernel.org>
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

On Mon, 2025-05-19 at 08:10 +0200, Krzysztof Kozlowski wrote:
> On 19/05/2025 04:48, Delphine CC Chiu wrote:
> > WIWYNN PROPRIETARY
> > This email (and any attachments) contains proprietary or confidential i=
nformation and is for the sole use of its intended recipient. Any unauthori=
zed review, use, copying or distribution of this email or the content of th=
is email is strictly prohibited. If you are not the intended recipient, ple=
ase notify the sender and delete this email immediately.
>=20
>=20
> We cannot test proprietary patches. Start working with the community in
> the open.

The kernel.org mailing list docs elaborate a little on Krzysztof's
point:

https://subspace.kernel.org/etiquette.html#do-not-include-confidentiality-d=
isclaimers

(It's worth reading the rest of the page too).

Cheers,

Andrew

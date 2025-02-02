Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293931DB52D
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 14:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738505326; cv=none; b=oVSrqk4ZR2MTIz8jSybk1/a0ppq5vd2YIg7+22zdSww3QdQbBT+g2ya/8oZRm1J0fgaxlwrSln5om+zG0dWthosdMU0PqDcNBhHZJC9kE7uoj8Rh5THDujqMtC/nVP7tIiH783A9RLqx0fPKoUClzBr8aDMZQpzGsL0BS77T17w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738505326; c=relaxed/simple;
	bh=D3su1JDDerQOMWuB5dX8o3YUbZ17HKFsnv8lV7e1I/4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:Cc:To:
	 References:In-Reply-To; b=QgEMezdfPYp3Mzol3R/ZPC0rzSbUErOjXJppb/mvbmfVHaQcKROvJpWU/pmdOY1IEzwMJPqW3VKyXtJj5gEt7d5ExpFt++EAB8xW4bhQ4MXmaKZ/uUCZ3X/FJ37ySqlabEcc2pTuW5f9sWXEJ7V1uG/mNZgpuCna7sXji/tShik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=DOTEFVU3; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="DOTEFVU3"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738505309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6YVArxw6byNXDXJF0zYPmUVcQzU6VgzWGkQuMNKnrKw=;
	b=DOTEFVU3/BrkD1UysTSI6w8EbS6l3RPoseP0F/elW7mSuNnu88KHj0wMn1cJ0b+aSVoIhR
	FQ1Dl5vJkfMVhQxXJ0aWsOyAro9qsAtKl/CR0rcLcd5ui38CTB2+vin5jFd0AF4UWn+pcx
	TUw3Zo97AfMpvsuy1o2OyOkT0YRy66A+7/Hv/myR+AimYsZGYzblRt3OfskBRkmLX6W7No
	cyPgFaRX/FKG3wF6JzlQuZs55V2218f8WG/tKOcoWIIeFP9zIoVLa1yCuCvxzwWmY6J/RC
	nu7uoJ+wnMuUQyWEtIv+K8DMUm0CE+zmbiyjKK+n5Ss0cv8N0m9KdxA5TCtFLA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 02 Feb 2025 14:07:39 +0000
Message-Id: <D7I0OILRTJG9.3O0P7Q6SEHYV3@postmarketos.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV
 Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Kevin Hilman"
 <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Karl Chan"
 <exxxxkc@getgoogleoff.me>, "Christian Hewitt" <christianshewitt@gmail.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
References: <20250201193044.28856-1-funderscore@postmarketos.org>
 <20250201193044.28856-2-funderscore@postmarketos.org>
 <20250202-wisteria-rook-of-intensity-6fecfa@krzk-bin>
 <D7I0F3OMXALB.1ZT1G03JTKSEZ@postmarketos.org>
 <56ec442d-54b3-404a-a10b-763a00e7099e@kernel.org>
In-Reply-To: <56ec442d-54b3-404a-a10b-763a00e7099e@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Sun Feb 2, 2025 at 2:07 PM UTC, Krzysztof Kozlowski wrote:
> On 02/02/2025 14:55, Ferass El Hafidi wrote:
> > Hi,
> >=20
> > On Sun Feb 2, 2025 at 1:54 PM UTC, Krzysztof Kozlowski wrote:
> >> On Sat, Feb 01, 2025 at 07:30:43PM +0000, Ferass El Hafidi wrote:
> >>> From: Ferass El=C2=A0Hafidi <funderscore@postmarketos.org>
> >>>
> >>> Add support for the Amlogic S805Y SoC and the Xiaomi Mi TV Stick (aka=
.
> >>> xiaomi-aquaman).  The S805Y is very similar to the S805X, with just a
> >>> few minor differences.
> >>>
> >>> Signed-off-by: Ferass El=C2=A0Hafidi <funderscore@postmarketos.org>
> >>
> >> Please run checkpatch. You have from/SoB mismatch.
> >=20
> > I don't see any mismatch.  Maybe it complains because of a spurious
> > non-breaking space?
> >=20
> Could be, no clue. I copied them to editor and it also sees mismatch -
> both entries just do not match.

OK, I'll see what I can do.

>
> Best regards,
> Krzysztof

Cheers.

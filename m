Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A2419ADBF
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864623; cv=none; b=N3E2JTc41TCsS/MqRfWY+XKXxfPvkwoZ66fHJvoVC0nABcWfRDOhr1JMVtJ1fLs5RyxzLxFtgJ6jUab9MpHvC8Yaielc1ZnIDdiYmD+xE43f5+4wMC2cWoMSHEVnQA/XwDb7bS9dTKxOfk7YHr3jVq1JPXKKPaeUOxb4jnSbmXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864623; c=relaxed/simple;
	bh=XWzRQEytXLE9LjfXaehGs6bnx7AWHDZIfcHQmsDAkv4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:Cc:To:
	 References:In-Reply-To; b=IpavIJtkGRDX5VMm6W37Y0yl3e+w2IMVkX9n6Qwrk6AaU6uve9OSACSpyvUuZxkmxkR0xBwGsHhpQ4YKjptcWxnbfQZ6hkff0omEqxoefp5yUd5ssZqirAuGjEtGOcGvq5L1/iOB+mw16r+Tgd3ngqyw0y8/LlTC2+cJ8SMo4E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Zcruyz62; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Zcruyz62"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738864601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w1Ia8rkI+1aqp/BE7ykJwCWC2yFoWhBOndDQb5udbXE=;
	b=Zcruyz62rIFMRV7nP0cqLglClrweMo/C1yT3rMF6lT888HLeDTO8Ll6t5GGgjgYHB+xdaj
	i9qilqbOok7wWndAewqrqlcDnfYzmFaiO7UGn6ficjBM+CnUiskqgvRMB1Edi4ZYk7O+Yb
	sup2AYZODDtaPUHwfseE3VyQy4o5plRhZF6duBEqrKKl0NN1sQ+K1MLGCyc6MwMk0SbVj+
	b3qT0cDf2urdQMZpVpJHjkqcFvulLIR1wpOvAZx+Q0/IrnVUtm9Mkz/yHOeBlxKpEd6t54
	6JPQEFBazVkvE9vfrzXZBdWwcuwt5Srtq3zlnaH5dlQKcrzVDiGrNe00fyX9vA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Feb 2025 17:55:48 +0000
Message-Id: <D7LK1DPOAAG5.3EUG8X7DVSDO5@postmarketos.org>
Subject: Re: [PATCH v4 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Christian Hewitt"
 <christianshewitt@gmail.com>
To: "exxxxkc" <exxxxkc@getgoogleoff.me>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>
References: <20250203174346.13737-1-funderscore@postmarketos.org>
 <20250203174346.13737-3-funderscore@postmarketos.org>
 <19c8e021-d2c8-44b4-968b-153d798c140d@getgoogleoff.me>
In-Reply-To: <19c8e021-d2c8-44b4-968b-153d798c140d@getgoogleoff.me>
X-Migadu-Flow: FLOW_OUT

On Thu Feb 6, 2025 at 4:14 PM UTC, exxxxkc wrote:
>  =C2=A0um it seem the sdio wifi module/chip connected to sd_emmc_a it is=
=20
> actually connected to sd_emmc_b
>
> i tried to enable sd_emmc_a but nothing showed up in the kernel thus i=20
> tried to enabled sdd_emmc_b and there are a sdio device showed in the=20
> kernel (sdio:c07v8888d8888)
>
> <https://matrix.to/#/!bDDAcbaDDYYwsVgelj:pixie.town/$YUSQIZ-pF22j9-ElrCst=
8XCUg1pac7CzWbUinNZL9HI?via=3Dpixie.town&via=3Dmatrix.org&via=3Ddissonant.d=
ev>
>
> acc to https://paste.coreelec.org/CoolersHurry=20
> <https://paste.coreelec.org/CoolersHurry> it seem it is amlogic w1 chip ?
>
> (well on my board it is amlogic w1. there are some variant that use=20
> other wifi chip )

Good catch!  I'll see if I can mess around with that stuff a bit more at
some point.

Cheers!

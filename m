Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188CC288B1
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574269; cv=none; b=pOmcW+/vmeoklaAs22lU+xoKUtPTHnLwmLK1DwltLJufZBzgFGP8NQQGYtPgMUptogQk4MOqnVdwwU4z27cUEYi8daCMKED/7lh5ZAe5ijgSvRuCyZOifn9lC+p2+Vl0zl2Ymrv+/IKuhr3dVCp5mZCZcqddjaV44zfJW884s5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574269; c=relaxed/simple;
	bh=Ns8NUVMpkVKDvWnM9BTZ07rVrluqhBkiCJ+nlI+819k=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:From:Cc:
	 References:In-Reply-To; b=sqcBjvEUhCQSjjFXZMwbqndAoJm4qUMOKKDg1w+AtCmadoujsxil5B6X5F0vNzgrFxrFicyfv6kInxH6VOajNwbil86B1J1uNvMIVqOGk5ZSlFwLcxooRgdB/awK1kNEVdmE/jCippHkAg0rsPPmOjjYyZ59rm6fE1GPyc3pxzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=XekN5ZnQ; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="XekN5ZnQ"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738574263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZ3MU5Alwy2jOdKOqGh+Wgi75fgSkITzfd+ri8LOY3o=;
	b=XekN5ZnQzXVYdJE3CcYaapzKa2Kf+/Hikgg9TZHzdWkN0hdjEAbOTXyDB8ZJSOOLXXPyqU
	o9d0PSXbNEHynQkYfxqKwsgDkKa3cadPWHcfQNGfIzDMBycbwSQ+gg246IdtGtMxmENoNC
	DHaJhOL2JOkRsbjnCsENVNaosUXHeQhFOv5NC8nHc+HtANvdwjfj/LDbwpP05o7ftycr2/
	s4FyCnOAhIzxcwV8AVUbvzb/FjI7SVmaImOnBm8m9edCAiYQcOVdoihx0A+9VRb2mgjTsz
	SHy4DA5qMAvfRRE+aHQ/LL/GDzSHKVs/i8AsNacCXx4I3h61NO+50PyypzWIxQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Feb 2025 09:16:50 +0000
Message-Id: <D7IP4ECJ9XM5.3JSGHFAI75K9M@postmarketos.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
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
References: <20250201193044.28856-1-funderscore@postmarketos.org>
 <20250201193044.28856-2-funderscore@postmarketos.org>
 <20250202-wisteria-rook-of-intensity-6fecfa@krzk-bin>
 <D7I0F3OMXALB.1ZT1G03JTKSEZ@postmarketos.org>
 <56ec442d-54b3-404a-a10b-763a00e7099e@kernel.org>
In-Reply-To: <56ec442d-54b3-404a-a10b-763a00e7099e@kernel.org>
X-Migadu-Flow: FLOW_OUT

Hi Krzysztof,

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

The From/SoB mismatch should be fixed in the v3:
https://lore.kernel.org/linux-amlogic/20250203091453.15751-1-funderscore@po=
stmarketos.org/T/#u

Thanks.

>
> Best regards,
> Krzysztof

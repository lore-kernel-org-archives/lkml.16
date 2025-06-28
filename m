Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3261372
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 08:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751101076; cv=none; b=NpmsWMmExtIzO4E0kxMANIEdhi6AevwrPoB9nl0aai2d3uWQOW669koMNKGp03dOCbNi6qy7pHn+r3mq7716Q8mwWWZpNuEfMr1GLiRSqXbp8ofYB0TX0i70Vj9aVmBREbuKskLvu1IHdiZtdb6jhzRuhiLr+LteQtI7UDJhJjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751101076; c=relaxed/simple;
	bh=pLzUu12WEaIgtCdO2e0vn7AW2eyYnzZNKQi/VqabhiM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=K9jqPQKyzzGeWf/7zmaWB4SNajff6DkCO7OAiX1WVBlzrnYsJaicY3Ov/CagupwVTuy1kN3iCRYlk6IDyUBE7sGYSEuH889H8ot6PnnG+l3H+UjD6ZmysPD0iSNuJRNQM+97zQeEBaHsYNh2Nz0puQ+KdNjtVmOwL9Vn1ZHI7Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=ROENJZTI; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="ROENJZTI"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751101070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ybqsyqEQtaTyGQvk+BFdCF7y271RgdQMonWszxYB88c=;
	b=ROENJZTIjZyoCI9g2NPJUEtCzQMHCjP4pthou6YG3P6yiZ2a1ek19Xv1QSzBHZzkaWgQAm
	3xmFVpxPyobZosVJygZtNI5iEPcIz/nFt5Mi1Gc0t8WkooJHZ4VZCjxfnlm2XBe0aAKk6J
	4umnJnAB61UfIauxFGLuU7SsDfGL6YYM6ROHv/9Ge7Gvz1h2GptoLGsLO7TiXmULdPMdsC
	d9ksbrHAIcJaOT53g1FN6EWXLzMCU+ziHi9IXhoOw7M1fBsJ33315yDrQI5J8nUc+uOQI0
	2HVtYevIo0/JXHjMDXN9et/v3aON1lm6QZ90GzwsA4oYmvanj77wP183v7Bpkw==
Content-Type: multipart/signed;
 boundary=45ff3aaff99b43270ac8aa38352e1e585a3b95bead335ff4d3af9d1accaf;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 28 Jun 2025 10:57:29 +0200
Message-Id: <DAY1IKPD6TB6.1JICGYYQTWEDR@cknow.org>
Cc: "Dragan Simic" <dsimic@manjaro.org>, "Johan Jonker" <jbx6244@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/8] arm64: dts: rockchip: Refactor DSI nodes on rk3399
 boards
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Quentin Schulz"
 <quentin.schulz@cherry.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
References: <20250627152645.740981-1-didi.debian@cknow.org>
 <b1c789bf-1369-42ec-8bb3-d7a45c92abf0@cherry.de>
 <DAXGZG0DEKS2.7RLXKSDO0C9T@cknow.org> <5121698.88bMQJbFj6@diego>
In-Reply-To: <5121698.88bMQJbFj6@diego>
X-Migadu-Flow: FLOW_OUT

--45ff3aaff99b43270ac8aa38352e1e585a3b95bead335ff4d3af9d1accaf
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Heiko & Quentin,

On Fri Jun 27, 2025 at 8:25 PM CEST, Heiko St=C3=BCbner wrote:
> Am Freitag, 27. Juni 2025, 18:52:08 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Diederik de Haas:
>> On Fri Jun 27, 2025 at 6:10 PM CEST, Quentin Schulz wrote:
>> > On 6/27/25 5:16 PM, Diederik de Haas wrote:
>> >> The #address-cells and #size-cells properties are not useful on the D=
SI
>> >> controller nodes; they are only useful/required on ports and panel(s)=
.
>> >> So remove them from the controller node and add them where actually
>> >> needed on the various rk3399 based boards.
>> >>=20
>> >> Next to that, there were several (exact) redefinitions of nodes which
>> >> are already present in rk3399-base.dtsi to add a mipi_out endpoint.
>> >> Simplify that by referencing the mipi_out phandle and add the endpoin=
t
>> >> to that, which allows the removeal of the ports redefinition.
>> >>=20
>> >> And fix 1 instance where the mipi_out referenced node was not sorted
>> >> correctly.
>> >>=20
>> >> This fixes the following DTB validation warnings:
>> >>=20
>> >>    unnecessary #address-cells/#size-cells without "ranges",
>> >>    "dma-ranges" or child "reg" property
>> >>=20
>> >
>> > Too many unrelated changes in this commit, please split into multiple=
=20
>> > commits.
>> >
>> > I could identify:
>> >
>> > - moving address-cells/size-cells from SoC.dtsi to board dts(i)s,
>> > - reordering properties to better match DT coding style=20
>> > https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-=
style.html#order-of-properties-in-device-node
>> > - use phandle to directly access ports,
>> > - reorder DT node to better match DT coding style=20
>> > https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-=
style.html#order-of-nodes
>>=20
>> I initially had it as several commits, but that resulted in (f.e.) 1
>> issue being fixed, but 1 (or more) others would pop up.
>> Those were then fixed in follow-up commits, but I assumed I'd get Rob's
>> bot screaming at me for introducing new warnings (first).
>>=20
>> And as they all relate(d) to fixing the dsi node, I then choose to
>> combine them (but still separated by SoC).
>> IMO there are several ways to organize the commits and each would have
>> their pros and cons, so I 'settled' for this arrangement.
>>=20
>> So I prefer to wait for other people's opinion first before reorganizing
>> the commits again (if there's a different consensus).
>
> personally, I can live with the current setup here, because as you said
> it's all DSI related, and also not a functional change ;-) .
>
> I guess you _could_ move the clock-master + status moves into a separate
> patch, as that should not trigger any warnings.

After having thought a bit more about it, I actually agree that the
moving of address/size-cells from SoC to board dts[i] should be separate
from extracting the ports/endpoints into a node with a phandle
reference. This patch set is actually from 2 branches:
- dtb-fixes-dsi
- dtb-fixes-ports-endpoints (although I now use 'dtb-fixes-fruit')

ports-endpoints is on top of dsi and came forth as it made sense to do
the ports/endpoints extraction in more places.
I'll then also put the DT node movement in a separate patch.

I'm not a fan of putting clock-master + status property move into a
separate patch as then the address/size patch would look weird (to me)
as you'd see how those properties were inconsistently sorted ... just so
that can be fixed in a separate patch.

Cheers,
  Diederik

--45ff3aaff99b43270ac8aa38352e1e585a3b95bead335ff4d3af9d1accaf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaF+ufwAKCRDXblvOeH7b
biZgAQCME6QUUiJaphH6VGnwcT9ww6WdV692xu7Owyds/SRnrQD/dSITCnYbGopt
SHRh40ahmolnhZl8p4Azfb0upjxs9gs=
=rbBp
-----END PGP SIGNATURE-----

--45ff3aaff99b43270ac8aa38352e1e585a3b95bead335ff4d3af9d1accaf--

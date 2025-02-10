Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30743C2FD
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739191646; cv=none; b=XTaKUnPxGjzAQAwwY9J+w+ug7KBuHj9jikehW2EGyFpzTnnzXRoMa9YfPXoxJ23mH77wcxYXAw+xMBl7R07//ud1bDvcbLIsw8sjE9i6MVer1bb8Nmw29jFPu3crYNwTkFL/TZbftyYCP2Z47+Xq4UwJ6rn/9xmFyHdkzVvZ9oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739191646; c=relaxed/simple;
	bh=Gvy3LdBaVQs9nT0eHoaJMZQlQOwafTHU73apoUuKIsI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TjYmJfGFgij871MgVpp7qhgsUVYr7Yo9ESZMilRiT8gpZui/kjC1kbfrsq2MCvGKfEPVZhsA/Cls04ZYgV3Xqc+CzJrVidmzdpFdrSRqWoE2izAFOwXcTvX1j1sX8bPMAK6JvPNheaPY89VaegLYXJYnVIOauTFQn3JvuaOX9Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=ESbKkdxq; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="ESbKkdxq"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1739191639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GM2uG63mtzY/UCzuoJUN2JH4a7GbgULHzqMzKpHmkFA=;
	b=ESbKkdxqz4qk8K/csAw9UPdZJegeZNw5n9IhkjYGhZRnGZZk5YOwmafSD0Rsz3LVQ+JSIn
	UYaGH4TnNr6niTvC5xvFSsXylxE5/LRkLAMz6yLn0TmYI+iGQSoGXbDTddwWcgkLCpVhJS
	z6ELn8kRIkefXSFlxLXQ2po+LeFrxMIqr/5oU9Fy8OVp1EC5EhGwqs/5yvhfc9HEZxQNfu
	inEk11D+cJplnPvgdyhFzmNJqNy2P7BaAV2VpcrNxm6dus8VhmFN4FSGtVXy6ycElgWHDj
	3zh1n6PzgxPVVnUX+DHiEOMfpEGWdplyDvIqn15xW6HinaNxpAEgy7vV1IwIzw==
Content-Type: multipart/signed;
 boundary=b54669e19e5db2e77cc4be97ec813a213b32a02ad4831e170911a19bfd32;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 10 Feb 2025 13:47:08 +0100
Message-Id: <D7ORZ8AGCPNE.1JTATRGD0MWLQ@cknow.org>
Cc: "Dragan Simic" <dsimic@manjaro.org>, "Maximilian Weigand"
 <mweigand@mweigand.net>, "Marek Kraus" <gamiee@pine64.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: dts: rockchip: add 'chassis-type' property on
 PineNote
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20250207111157.297276-1-didi.debian@cknow.org>
 <87a29b78-5fab-48eb-9a86-f12c41369dfa@kernel.org>
In-Reply-To: <87a29b78-5fab-48eb-9a86-f12c41369dfa@kernel.org>
X-Migadu-Flow: FLOW_OUT

--b54669e19e5db2e77cc4be97ec813a213b32a02ad4831e170911a19bfd32
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Feb 10, 2025 at 12:06 PM CET, Krzysztof Kozlowski wrote:
> On 07/02/2025 12:11, Diederik de Haas wrote:
>> Add the recommended chassis-type root node property so userspace can
>> request the form factor and adjust their behavior accordingly.
>>=20
>> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
>> Link: https://github.com/devicetree-org/devicetree-specification/blob/ma=
in/source/chapter3-devicenodes.rst#root-node
>
> Drop link, no need to point to source of every property. You don't do it
> for aliases, compatible, model etc, right?

Thanks for that hint, I'll keep that in mind for next time :-)

Cheers,
  Diederik

--b54669e19e5db2e77cc4be97ec813a213b32a02ad4831e170911a19bfd32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ6n1TwAKCRDXblvOeH7b
bs2AAQDX/PMiD8ZS28oCmS3Xv1dgFP3IfMHvGFu7LHmEpzKiKwEA+8BWW5g6zQbw
lQVv4CZU5jr1q6/TEA7nZm2n0EmYjAg=
=w7P3
-----END PGP SIGNATURE-----

--b54669e19e5db2e77cc4be97ec813a213b32a02ad4831e170911a19bfd32--

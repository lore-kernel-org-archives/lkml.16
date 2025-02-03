Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DB91DFED;
	Mon,  3 Feb 2025 03:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738554497; cv=none; b=Sdwn3Vylg71gTLxM0iE93pheV4I1yRH2bLGOFnAOm+GWK2yUcI6Fwjz/aZoPeSHGLQTCKevjuXm9HyOVkc9gMQm8zFdjiGHQBNMj10/cV9b5tlQvnfFg3niyvhHlReiDN+RDfZIlrCusjXCR3+aS4+6BtZmEoD/xyeWVxXGC6H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738554497; c=relaxed/simple;
	bh=n8IcwophMB3hoBBGXT86DKcgpvdtGcA9h2Vz1Sh5RwU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B6NdgqEywO9S7arvLpHEVbXouE7+h7ruyTqGupBzBSWbiIAwGpW29D73MCrT0fGMREsZ3qSXKbFEnhM2FA66DHnUvOX/wgfTVQejC1vDDmRZ6i87kU61zKgD4caFqxzhrf4u/Bq5qpWQBKAhHS+qZWLefwPPOp9lzTw2T4wVsJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=eMdjBFk3; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="eMdjBFk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738554494;
	bh=n8IcwophMB3hoBBGXT86DKcgpvdtGcA9h2Vz1Sh5RwU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eMdjBFk3KbuTs5LrRrBeRuUqTEk7k4QsMpb/VX5ewByVywkhR5nQEJwluEJ/4pdRE
	 tvN9zct23uahM+UuXIXsQza+rKNiTbRDbn3ORYvLYyr4dlxm7zW/yC11kTCcj/vYiK
	 XyKs6sCqI4rOqRN5/Jdj4rDRnSP/ujlvUaFNOvN83pN13aYHPxQBWhEOzqDk43JlOr
	 PETvdpqQRMN3BdD+L8Z3g2JZRNsWU3yqKAUzhS+C8CSHhxWdGK4U/WlL7JkPXh6Vhw
	 eQwjKpQw+B6mwwH7Ra6Mf0QGmf6u4fVFS2gzIqxCOvZTTYq3+xi5DBMO9haGMa1e5K
	 DkLmHOoJlKxRw==
Received: from [192.168.68.112] (58-7-156-140.dyn.iinet.net.au [58.7.156.140])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5B04173C54;
	Mon,  3 Feb 2025 11:48:12 +0800 (AWST)
Message-ID: <0cbefd2b2488b7855fb374ce94facd9f7440b7a6.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3] ARM: dts: aspeed: catalina: Update DTS to support
 multiple PDB board sources
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Cosmo Chou
	 <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
Date: Mon, 03 Feb 2025 14:18:11 +1030
In-Reply-To: <20250114-potin-catalina-dts-update-20250102-v3-1-14981744b2fe@gmail.com>
References: 
	<20250114-potin-catalina-dts-update-20250102-v3-1-14981744b2fe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Potin,

On Tue, 2025-01-14 at 14:12 +0800, Potin Lai wrote:
> This patch updates the Catalina device tree to support different
> sources
> of PDB boards.

Can you expand "PDB"?

>=20
> Changes for Main source PDB board
> - Thermal Sensor Monitoring:
> =C2=A0 - Added IOB NIC nodes (TMP421) for thermal sensor monitoring.

Can you expand "IOB"?

> =C2=A0 - Added FIO remote thermal node (TMP75) for thermal sensor
> monitoring.

Can you expand "FIO"?

> - Fan Monitoring and Control:
> =C2=A0 - Add fan p12V power sensor node (MP5990) for sensor monitoring.
> =C2=A0 - Add fan controllers (MAX31790) for fan control and tach
> monitoring.
>=20
> Changes for 2nd source PDB board
> - Fan Monitoring and Control:
> =C2=A0 - Added 2nd source fan controllers (NCT7363) for fan duty control
> and
> =C2=A0=C2=A0=C2=A0 tach monitoring.
> - Power Monitoring:
> =C2=A0 - Added 2nd source HSC nodes (XDP710) for power sensor monitoring.
> - Address Conflicts:
> =C2=A0 - Removed all ina238 nodes due to address conflicts. Moved the
> driver
> =C2=A0=C2=A0=C2=A0 probe for ina238 to userspace.

Can you unpack the issue with the conflicts a little further? What was
going on here?

Andrew

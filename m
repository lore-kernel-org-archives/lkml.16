Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B9625D534;
	Mon, 12 May 2025 09:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747043360; cv=none; b=cFYj4a9y3UzcLL+l2wJBToF0cJ+Rm2gdAoMx6K5eoNVYyFYiNDH9RSNJE6fNOcTdkF8xst24W10HzpqRcklvg3HhN0sBaXh3h3pN6NALPS0yIKEMXYrXHcZBj4Xk06FUUOBBHd8ipdfWEEhvLTOhUqMDDrVPfRfAaVPJd6tjlYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747043360; c=relaxed/simple;
	bh=jpYUvz75qO13LAZDlSbg8XgjPSCxJnXcxftlVmMNOSg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s15njTwhKm+NSEhbQ8N9G69krKcFgAVdpO3HK5fc64JxItEeTMEvnUpIBXkGxdUG8xwCd+BdAR9bmzYeA6D4+kUWmKdMOgWGS0sKxheqn67Ef+o7T/xu+kPtJG9Mk78jjQs0bNtIzUAilPfnMCfr+172Lj01/Xczyd8GnKYOX5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fZ4tdJ9K; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fZ4tdJ9K"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D05C442D83;
	Mon, 12 May 2025 09:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747043349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jpYUvz75qO13LAZDlSbg8XgjPSCxJnXcxftlVmMNOSg=;
	b=fZ4tdJ9KQbsp22OuFMUVDIoibqSTugGHnTuexS8Q7TnU8lnSNJhKITvRX/k1pSa27/MvFa
	swg2lYq+4nuKY6/Hu3dWOR9ps05l2mZzupOrWpmV6VK9bp/3QBjC09Z81xn+apFEi6QWkp
	bno8YiEoN9rT3rqCxFgm5XL5VLnofQgJtDQinFsuS9WnhRsyRREa5wgRMqIWULdF66pd4R
	N2vKc3zHMaTPJPnliSTXRBKlEkB5DgXoaCNXdsZpdyOeV103zWFD/+5M5/wFw6VjV9g6Hg
	Ef1tND6ASnxYLjGse5MZx51Y4NEsfuWj+UQKnV9RUQrSatugDhsBh+tCyryD4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  linux-kernel@vger.kernel.org,
  devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 marvell,cp110-icu to DT schema
In-Reply-To: <20250505144524.1285795-1-robh@kernel.org> (Rob Herring's message
	of "Mon, 5 May 2025 09:45:23 -0500")
References: <20250505144524.1285795-1-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 12 May 2025 11:49:08 +0200
Message-ID: <878qn2kvl7.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhug
 idqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Rob,

On 05/05/2025 at 09:45:23 -05, "Rob Herring (Arm)" <robh@kernel.org> wrote:

> Convert the Marvell ICU interrupt controller to DT schema format.
>
> Add the missing addressing properties to read and translate child node
> addresses.
>
> Drop the legacy binding description and example.

I thought these should be kept, but in general I am fine dropping
them. Thanks for the conversion.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Miqu=C3=A8l

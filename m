Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29EC25E474;
	Mon, 12 May 2025 09:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747043468; cv=none; b=qAn5Juh4Pk3Zd9tqfOxiHKldYh+XcWBxhFvQ0wnPYuUBooEw2OghtIazfKR+VKvtAdNwyHbmJiwRPFsDCgDYBVH+ET6kmY0MPpKbJK9rFV4GGNd5iZcIvuSb2IBff8ppdq4J2AneSUfY2DUih+T3J62Eu2fpcnF5ne2+8eTyjf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747043468; c=relaxed/simple;
	bh=Qwlu2yntddOz2xUBXEOYnssCZII0Hcy7TnXS2EoQYe8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ITI1zUprGGgj+N7Cm9a//cbxsmHqIqeslyYZeiebnEaxoIhdxMmEMwxrdxC291gMGFgAQg3kjRJlsBYHpuKD2PzcGDvyQN4fr5zXshrICYN2XYNqzmrqGRfWKy+kjGdAFwx+lh1FDA4T/IaapkZA/Z8WIacQht1fuUaZ60CT2W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DSQdNf3y; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DSQdNf3y"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2D3843970;
	Mon, 12 May 2025 09:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747043464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qwlu2yntddOz2xUBXEOYnssCZII0Hcy7TnXS2EoQYe8=;
	b=DSQdNf3yW/iryNmk7IOo4G5I/t6K7F2b8jEIo58/Ep46NmadG3TCBTP2SRVGLCqXvVjpcg
	hTYXLsDpvo6hcVZKcb7YdspxB3Cde6hP8PkbA3f8mhTi1HMJkFPq/PJh1pRok6WFg9v70h
	1TiFqxLUD6K6DIx7h9RXId8LEob+kyRxqPG15ITWymiADY2MQNa72v86z5c2GHAqS+2Bp0
	Bt+PO4DaEA2utWQ1VqWbLGC+s3AaYMZa3g/4ZEPn2UIn2RY+0enSlICl6ckpPW3o+vWWGc
	RtxH+NJzRPnEAYu6oFXhH/0I7f67i3Ix/npcX4Jq0ZX6kv+CwSOc3daXP1VXRA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 marvell,ap806-sei to DT schema
In-Reply-To: <20250505144749.1290862-1-robh@kernel.org> (Rob Herring's message
	of "Mon, 5 May 2025 09:47:48 -0500")
References: <20250505144749.1290862-1-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 12 May 2025 11:51:03 +0200
Message-ID: <87wmamjgxk.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhit
 ggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

On 05/05/2025 at 09:47:48 -05, "Rob Herring (Arm)" <robh@kernel.org> wrote:

> Convert the Marvell SEI interrupt controller binding to schema format.
> It's a straight-forward conversion of the typical interrupt controller.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

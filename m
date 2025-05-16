Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA21418A93C
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747407320; cv=none; b=L+v7CO7RNaU8GyBlvTHRR5JlA1G/ZvYiZ+NBPmkO0T1ME98pykSUARO+mYu64ECYajcShoNKBW5Le/6zkuwum2/WqEkfICaZp7CeHRReMOE7grDcFjACxH7sBl4CXDqzsmM4OvgQHCUokghcahSCexgcz/6VlVhmghQzFI4+WP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747407320; c=relaxed/simple;
	bh=sjkMUj2szYtuHo7hBwP12TSyL2gPqgsNbAIokVqgM0I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Qcwtczp/KS1B7MQk4dX5WlHUP15pgByJo7+4RCceCxoyS2gVsXsb3wPv33TBJfEaKRimQ8/If3TKbz3zL/DcSSXH7ZBhDqdQgmIgVGhacN39renhn6xsze5VYQEGmvluuX7/4/rTbjjs7MhdyK8h18AZ0ge+1oPZszOJvcqi8zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FFTPCxAm; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FFTPCxAm"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 362F543962;
	Fri, 16 May 2025 14:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747407308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EKJ192BkT+/Te47Jo008xSiKTVWBSpodH/ly6QojItY=;
	b=FFTPCxAmm6zzC/2OpQEQdR5dqcS/gt0ZnzKLwwqYgkeR8enay0pqm6vOOqrrJD5mauMmD1
	sHarL/wXEofkSQCKiN7N43dgBawJsRIbg1GuZV5IzI6bpKBjJ7jEq8KWqMvucuu5at9jig
	dkKA+TrzivbeZJGMYxj1OzNHhEZm3/eb88/JxAuRxal60rbpV3HINA6hol7PXTvggXLNmM
	erAJeT/zqgd5GdmOkt/bo+fEeT1vcRTUafpKK1v8BI7Ud0Vn/seoQhcaWAjqWPVe3CN96+
	DmWQCndKQAC4zToUPlcoqEDU8HmC6t7k1vPNDztRYYuRpjBiwAl0lpuOuHAZqg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Martin Kurbanov <mmkurbanov@salutedevices.com>, 
 Ezra Buehler <ezra.buehler@husqvarnagroup.com>, 
 George Moussalem <george.moussalem@outlook.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 robimarko@gmail.com
In-Reply-To: <20250515-spinand-esmt-v1-1-37507b7335b8@outlook.com>
References: <20250515-spinand-esmt-v1-1-37507b7335b8@outlook.com>
Subject: Re: [PATCH] mtd: spinand: esmt: fix id code for F50D1G41LB
Message-Id: <174740730816.360599.8674629463051075941.b4-ty@bootlin.com>
Date: Fri, 16 May 2025 16:55:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeftdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhmkhhurhgsrghnohhvsehsrghluhhtvgguvghvihgtvghsrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepghgvohhrghgvrdhmohhushhsrghlvghmsehouhhtlhhoohhkrdgtohhmpdhrtghpthhtohepvhhighhnvghsh
 hhrsehtihdrtghomhdprhgtphhtthhopegviihrrgdrsghuvghhlhgvrheshhhushhqvhgrrhhnrghgrhhouhhprdgtohhmpdhrtghpthhtoheprhhosghimhgrrhhkohesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

On Thu, 15 May 2025 21:46:05 +0400, George Moussalem wrote:
> Upon detecting the ID for the ESMT F50D1G41LB chip, the fifth byte
> returned is always 0x00 instead of the expected JEDEC continuation code
> of 0x7f. This causes detection to fail:
> 
> [    0.304399] spi-nand spi0.0: unknown raw ID c8117f7f00
> [    0.508943] spi-nand: probe of spi0.0 failed with error -524
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: spinand: esmt: fix id code for F50D1G41LB
      commit: dd26402642a0899fde59ea6b0852fad3d799b4cc

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA26319ABC6
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747407319; cv=none; b=ukdnUq0IBFjqxYtu66HY39dnL8386VGN4goP82Bgh83Qr+5B+PeyuadcrDQ3mSC1z6KiT5gTULB5FPXZfj1ov+jMlYbnpn7CEWgK2382bDt9yZI1xBO0oj23+ghYZWNCjujUQifmdlk8iK8zeyZ+Kn98dhJFg0N9p87KPSZJL8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747407319; c=relaxed/simple;
	bh=MWyIba2HweWR/wrb4NtC/87dk8opmkt1CKNGTlfjHMI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o//87ro+hg7R6g1i7uLekSgfct7qJvSy3sZT/53R9UhJi3csZgin1Sf9jpWgb4y9ttX0BPIMa7ri7obNCKk2ZLtQnd8IT8MRyCCKlG7bb+guI17kaFD7NxVU3yFCp+HC1pSnjVttydPBIUJ2Cgd9aLT9OHMH3ptR1g6T839aduA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bvh/eri/; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bvh/eri/"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AEDE438F5;
	Fri, 16 May 2025 14:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747407308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MllZcQ2bO9GQsGYfaiwajTodevCMTQdfFYfoNKWe1k0=;
	b=bvh/eri/KUzx+FHmSdKJtnSvMPyicZigNW/D23TEITymuN49Of+OBy9/ZWiOdRok11+tjR
	11Tv4Kv75RPdmDTRSxlhFfE0U+w9ZCt03AHqYpatjXA38stELJDaTJImikK55la0VVxFMl
	SQ4cLgt6Ccmv6uVaRh6jJQsnGwOjGOJfuqXV2Jc5vv0qnfxqWg5C/9Jyakf4Jnd1v2CLUb
	3k1+rvPsAKYmD5Ywslm5Oub0QeZB4pn0TcimdFyJ9leu7/wbTPT4cKMdgYf370X+USX08Y
	yIV4TRIacGMmcQdHQc4605PuFJI9x/N7k2CAQay9HyawEyo09ECJgKiOS+XUfA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan@broadcom.com, florian.fainelli@broadcom.com, 
 computersforpeace@gmail.com, kamal.dasu@broadcom.com, 
 bcm-kernel-feedback-list@broadcom.com, richard@nod.at, vigneshr@ti.com, 
 jonas.gorski@gmail.com, dgcbueu@gmail.com, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20250514061454.772340-1-noltari@gmail.com>
References: <20250514061454.772340-1-noltari@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: brcmnand: remove unused parameters
Message-Id: <174740730696.360599.1374295611729816560.b4-ty@bootlin.com>
Date: Fri, 16 May 2025 16:55:06 +0200
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
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeftdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffhfdufefgueeuheeuveduieeijefhjeduveduveeitedvteeftdffhfejieelfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegughgtsghuvghusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrr
 ghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehjohhnrghsrdhgohhrshhkihesghhmrghilhdrtghomhdprhgtphhtthhopegtohhmphhuthgvrhhsfhhorhhpvggrtggvsehgmhgrihhlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com

On Wed, 14 May 2025 08:14:54 +0200, Álvaro Fernández Rojas wrote:
> last_cmd and last_byte are now unused brcmnand_host members.
> last_addr is only written and never read so we can remove it too.
> 
> 

Applied to nand/next, thanks!

[1/1] mtd: rawnand: brcmnand: remove unused parameters
      commit: 56fce75470041b5b0d92ae10637416e1a4cceb1b

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


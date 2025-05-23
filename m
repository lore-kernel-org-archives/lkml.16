Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC0C202F9A
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748011872; cv=none; b=Qq8F0hNL521fXv0pmZwEtHmMCICRdNqgRTlI1k0oKReMUzW+KXJADd+yoiQWbh+IQld3Lk0orqTX6mUvtnbQFoI0wgN9/BkIPDjcwR3auHsqPceWr1P+md2eEJ4h62CFGsCSj+YdjEbV111YLaUn5hTz/iI/QbuJO4ErNZkoXk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748011872; c=relaxed/simple;
	bh=BnH5pMSZnKDK8bkUF14DW7/8wopewvVFPMukGn9fNEs=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U6fEAluH9yH1mDlbOSitj2bJqNxT9Rj2P1KkpENAkuRrPKnmsIbY7d6xHdcQNG//b0Uj8VI3yHOG73PlOW1b7k3nUSGiIg0yrt+XO3BU73F/5Y2w1xwACQPRAlBHKeC8SJj48VnQLQh0aFe414+iYLj5fteahwOxZYKB2tWYoYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JhBXPYsH; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JhBXPYsH"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B65AA43B0C;
	Fri, 23 May 2025 14:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748011862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WSgX7S40xopOK0v+O35hOo/TqGd2mvAhf1SqDu4HKcc=;
	b=JhBXPYsH5PxPq19gYzDB9J3tWUmqaqsXkNK7BD9cxPYC23Z4rRE44HR26G3sxnUjlyy/9g
	vQGZcgr0oJDZFArugTZdMyLag6dd/fbgAeNxqMqcz8oVr8IhX1uX1EOCihklFq1fOqK83i
	bfC9FqpvSXq7AB1NRZ+p5J1qOyQNGbuZO83Q61+6o/52QvxTpRwnHmOnEBAJ0m5fHbJ87p
	djKKFU5cLB0IsZN77g5S8rNYVDr3gmZ7cJtGhZkY6snKTVHxiZi6NYerSmVnV14dizgM6r
	91Uobx/Sqen0PbPL3dBzWIwJT+Yy2NoTVoomdxEZPc49bFV3VQZaPJT4vzPlyQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 bcm-kernel-feedback-list@broadcom.com, william.zhang@broadcom.com, 
 anand.gore@broadcom.com, florian.fainelli@broadcom.com, 
 kamal.dasu@broadcom.com, dan.beygelman@broadcom.com, 
 =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>, 
 rafal@milecki.pl, computersforpeace@gmail.com, frieder.schrempf@kontron.de, 
 vigneshr@ti.com, richard@nod.at, bbrezillon@kernel.org, 
 kdasu.kdev@gmail.com, jaimeliao.tw@gmail.com, kilobyte@angband.pl, 
 jonas.gorski@gmail.com, dgcbueu@gmail.com, dregan@mail.com, 
 dregan@broadcom.com
In-Reply-To: <20250522172526.3926633-1-dregan@broadcom.com>
References: <20250522172526.3926633-1-dregan@broadcom.com>
Subject: Re: [PATCH] mtd: nand: brcmnand: fix NAND timeout when accessing
 eMMC
Message-Id: <174801185752.990005.9184545428707751994.b4-ty@bootlin.com>
Date: Fri, 23 May 2025 16:50:57 +0200
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeludegucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffhfdufefgueeuheeuveduieeijefhjeduveduveeitedvteeftdffhfejieelfeenucfkphepledvrddukeegrdelkedrtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrddtpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopegrnhgrnhgurdhgohhrvgessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopegurhgvghgrnhesmhgrihhlrdgtohhmpdhrtghpthhtohepnhholhhtrghrihesghhmrghilhdrtghomhdprhgtphhtthhopehkrghmrghlrdgurghsuhessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepsggtm
 hdqkhgvrhhnvghlqdhfvggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthhopehjrghimhgvlhhirghordhtfiesghhmrghilhdrtghomhdprhgtphhtthhopehfrhhivgguvghrrdhstghhrhgvmhhpfheskhhonhhtrhhonhdruggv
X-GND-Sasl: miquel.raynal@bootlin.com

On Thu, 22 May 2025 10:25:17 -0700, dregan@broadcom.com wrote:
> When booting a board to NAND and accessing NAND while eMMC
> transactions are occurring the NAND will sometimes timeout. This
> is due to both NAND and eMMC controller sharing the same data bus
> on BCMBCA chips. Fix is to extend NAND timeout to allow eMMC
> transactions time to complete.
> 
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: nand: brcmnand: fix NAND timeout when accessing eMMC
      commit: 528b541b71cf03e263272b051b70696f92258e9d

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


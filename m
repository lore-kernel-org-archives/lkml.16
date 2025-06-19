Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4B719ABB6
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750353324; cv=none; b=b7cGrzr/juOMvj9ngFdLekvwtKFp2IRXpn1kjU/5tOXF7IhnuU69rtHMBdQptdIrgVKUOM8L1TRd5DHVXhWL9i/s0GDVY9l30A57teamt4XcgYs6NWLKTPicD7rJZO7VZDnq8H9JWNhpi3A2rQ0pL08zz5NtE8hRje6JcbePCBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750353324; c=relaxed/simple;
	bh=7ruCDLYiWzS+bF9ORayYkQg1bEmgjlqtIo4JlbIfn5A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rJSLN8DFwm7HJyER5W8jXpMcC/2Sx7qoc5XifH/4+VXjQu4hK5Br6PyHGsk084Ac2E9/yRr58SrrIhq+YIw5KypjyOY1/OwaXq37q6lv2seDmpiwnevI7DGeMhXswmXSj6NdCzeraeb7uhOUHPozc2O2iy8dAc6L92Sza5lWMPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pQGRxxsp; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pQGRxxsp"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07C254441E;
	Thu, 19 Jun 2025 17:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750353320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHKo8qXm+tt/TWv/ujXaaZqRW8HDmht1JJF3FPlOj1Y=;
	b=pQGRxxspT3wKhuDZgD3MAN466JZi8AZFANK4tfI9ZpH2OZrkiqUkq7hXCX/oaqExSRmXsY
	QHBhqaWIrHOcbIKhw6U6+Xozp3HVkbC5fqc/Z/uTphdlq346NwEpUSgScb6zqce0crUkb0
	sy5Z6Un9HjJdbRnZyXtbu1LWSLP+oqgt/Y4SfJ2BGxaVUIMxYxwoPKy9Kg3LyGpm2IfP0b
	mHjBtHFu3qIBMr5azrhEDShLlxCFG/mhcNgn7ZjUXz9j+U3BUGUnf/zx4M1IG9azwBM885
	W7DubsMzltvejSziWvg/CaVxfare6bXO1OnLQKAKeDG4TSgl+Pb4n97DMR3Lfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yuesong Li <liyuesong@vivo.com>
Cc: opensource.kernel@vivo.com
In-Reply-To: <20250618124948.2822345-1-liyuesong@vivo.com>
References: <20250618124948.2822345-1-liyuesong@vivo.com>
Subject: Re: [PATCH v1] mtd: nand: brcmnand: replace manual string choices
 with standard helpers
Message-Id: <175035331888.438483.5742721112237943921.b4-ty@bootlin.com>
Date: Thu, 19 Jun 2025 19:15:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeitdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledvrddukeegrdduuddtrdduudejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduudejpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepsggtmhdqkhgvrhhnvghlqdhfvggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihihuhgvshhonhhgsehvihhvohdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgp
 dhrtghpthhtoheptghomhhpuhhtvghrshhfohhrphgvrggtvgesghhmrghilhdrtghomhdprhgtphhtthhopehkrghmrghlrdgurghsuhessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrth
X-GND-Sasl: miquel.raynal@bootlin.com

On Wed, 18 Jun 2025 20:49:47 +0800, Yuesong Li wrote:
> Use kernel provided standard helper function to replace hard-coded
> strings
> 
> 

Applied to nand/next, thanks!

[1/1] mtd: nand: brcmnand: replace manual string choices with standard helpers
      commit: 4b5532d4581d0e0639023268eeb08f1a31a402d3

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


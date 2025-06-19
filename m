Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902D323534D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750353303; cv=none; b=lE4fIpQRzbs8nN1HF82GKdFTWeUCw1ksS7rnMp42xprn4583bUEtkOcJU4UPi5O4PXkLZxRvqlE0SWMfKaEPMTfA4Ckf0m4XbINdB2+XSZrOSwrIdFexhDLBqCjTRxeBqlSYRDIpPmlwkvmef8rV657RnUlAOA8QTkzEqLsjemM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750353303; c=relaxed/simple;
	bh=Lx1OZA13bxdhse2uaAcgjkf62XpWijyBrsRGvEfVBYs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G29UuwqwG1Z64M9YrWr2v4s/OroQAuowrS3LQPGyVgdPORUwFRvPWpJmt5hKOsZgEdC7X/5/TvisF03lSGbWhUe3wogIHQEJ6fRkgaz6p30/u9XzF+iT10/nxME9DJSHNBvT5u9gpNwFwi3Dqj0cMaGO2DzQm81CmGKocdFTAgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BL56VD7M; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BL56VD7M"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 797EB444F8;
	Thu, 19 Jun 2025 17:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750353293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z26vtRZXZ0iUY80hTCSWSFa/6H7qzHjCbBvSXzt6qFk=;
	b=BL56VD7MsFg3AVIJnYbDfvhqfDtUOk/FWYOf7V94nZ4wNrjLrTCDK2X7y9nBNp9bX89CpK
	1oNBUQqI2WjZKkTS/Cjf4B/mJFXTK/3Can7llnLWJ15cRDhx3nhMqphWSpNd/FEUyHBFsA
	XPafdvq7hMg0cV7DmJTNj3eUGItFjfJem+lG8541D9uel3SxgWYLa9RxbB9CA6F417s+02
	wCPXduEFvt+hqnhO1J/2736+7wsKHjwwYNg6RCkZbvMwBI19M9YZLYxyNrvELK8B13B2y9
	vVSCMw3iVFdgiobK+qopJ6Fuj6vbft3mMQ0PRIqVVx/iI6HF3UwiWZ2Kp9471w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ivan Stepchenko <sid@itb.spb.ru>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
In-Reply-To: <20250619145313.5823-1-sid@itb.spb.ru>
References: <20250619145313.5823-1-sid@itb.spb.ru>
Subject: Re: [PATCH] mtd: fix possible integer overflow in erase_xfer()
Message-Id: <175035329221.438255.2990702769206013816.b4-ty@bootlin.com>
Date: Thu, 19 Jun 2025 19:14:52 +0200
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeitdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledvrddukeegrdduuddtrdduudejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduudejpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhiugesihhtsgdrshhpsgdrrhhupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpt
 hhtoheplhhvtgdqphhrohhjvggttheslhhinhhugihtvghsthhinhhgrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

On Thu, 19 Jun 2025 17:53:13 +0300, Ivan Stepchenko wrote:
> The expression '1 << EraseUnitSize' is evaluated in int, which causes
> a negative result when shifting by 31 - the upper bound of the valid
> range [10, 31], enforced by scan_header(). This leads to incorrect
> extension when storing the result in 'erase->len' (uint64_t), producing
> a large unexpected value.
> 
> Found by Linux Verification Center (linuxtesting.org) with Svace.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: fix possible integer overflow in erase_xfer()
      commit: 9358bdb9f9f54d94ceafc650deffefd737d19fdd

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBC186324
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688004; cv=none; b=BI88USO5tNSZVzEh6zJHHmJjU7+lip+goRK86oUF/3at72qnEz9vTJ+BiiDqK9xvGb+31s9gc5xZmR88NugfkhEa+qKA2paoFiAoxSaABuFv/HdXk2OwHeeuHEic7+tj0BKd0KrIEf2usQP5CEjhS+BRfRnjddby8NV2/o1iZcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688004; c=relaxed/simple;
	bh=f+OvLiwkQU/mpsy3LgRWkbcH6X4OVk3ux+0IaLCu6C0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j+4hJGHJ5rbgUY9aLhbL9tNyVl1ccsmWYNYhBEf6IPW6nR2qKNeM8nr6akv9a0JUW9PTg7v/i9XeVY+GyzLIspoJmzlS9HL+kbgrJ8C1iNfn4CN6t3pYiUxyaO8v4cOoOA1vl9rWHEnt+ZtkwAJ5ErBkY8XI3LnnI5p78zvnUHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hdZdDn9j; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hdZdDn9j"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3C484441A;
	Tue,  4 Feb 2025 16:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738687994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f+OvLiwkQU/mpsy3LgRWkbcH6X4OVk3ux+0IaLCu6C0=;
	b=hdZdDn9janfgCi4eILWQUVF4Ieiexly8RrAd5y9jSV7cugQmm7bqD+tXmbOtH40KcCHeQa
	g2lbGyEA9CHABtLZFaY9GHTo5AXUClfkdaKSa7rYDqzAumsskOtCLBmB9A4XZEuorCbqM4
	jW/QHn//kfksbXdmjbCO+FOKma5ZVZRG2tP9QpdoyRWw2iIKsRPO223TOy/uxmeVMrrH9A
	QZ7Peplj7kzIi7EmHZ2Bqyzmztr70w/yTIPyE3/wkj0X32DXXY5CEnLfUR3JIOxi9ezMAB
	4Z9IaWrrFpVOWxiD3ZYb6x4dgYjl0xeWlzLJM2WlYn/CcXwaq+UXV92k0Fm25g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com,  conor.culhane@silvaco.com,
  imx@lists.linux.dev,  linux-i3c@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] MAINTAINERS: I3C: Remove Conor Culhane from Silvaco
 driver maintainer
In-Reply-To: <20250204161151.2179596-1-Frank.Li@nxp.com> (Frank Li's message
	of "Tue, 4 Feb 2025 11:11:51 -0500")
References: <20250204161151.2179596-1-Frank.Li@nxp.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 04 Feb 2025 17:53:12 +0100
Message-ID: <877c658xdz.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgesthdtredttdertdenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeghffgleeuffdujeevgeehkeefudetgfefueelkeehgeehhedtffdtfedtffeiteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghonhhorhdrtghulhhhrghnvgesshhilhhvrggtohdrtghomhdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhug
 idqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

On 04/02/2025 at 11:11:51 -05, Frank Li <Frank.Li@nxp.com> wrote:

> Conor Culhane's email address (conor.culhane@silvaco.com) is no longer
> accessible, and there has been no activity from him on
> https://lore.kernel.org/linux-i3c/ in the past two years.
>
> To avoid email delivery failure messages when sending patches to the I3C
> mailing list, remove him from the Maintainers section and move him to the
> credits.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

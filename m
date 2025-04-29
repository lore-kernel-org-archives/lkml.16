Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFA3274FFA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918422; cv=none; b=bfoFZLvVsl8p3FIPOs1zTXhkn8C6NUqlQP6aSl3K/svdZF+p2H394w44OnuaYIN+NKrX8QHAaSvcZ0AmqotZFNc3rB55/iwC55S/CGJk4chkVeyCW/xzfpmGZ6/HSgcG60STRylc1kEBTJrmsLZDgjT5pDXocNtqiCASO7UKVZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918422; c=relaxed/simple;
	bh=dj+H+iOhdi29XKdZQG0oJDdhSShr8NT/AcgPxZGfZQs=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aqWDi5IOpUbBHdqiGnXEavdrbOy8SqQC7V4GRGZd4enNGodK1ozPegsbscFCh7AWDIGZUEWd72Cq4n1AAQLcz30vdsZMUxDqKLs3yIAAZdJ55mxZPzxEn6L+c8rbwsHqFDegaTUPhvirAM5rs5ZSAkFNaK4nvefbttGPENDmCUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=H63MdByW; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="H63MdByW"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9333843214;
	Tue, 29 Apr 2025 09:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745918419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Za7lweaPx3/h71Ujv+ZsakGXEjzK+xddax/L9YP3OSU=;
	b=H63MdByW8Lv5bFIZsgpDAyJIUVJrtcY86NumkBFNLSWJapl8H890wC1jPdcKlWtuYM+sL+
	uC3neJftOFjWFTTFNOkp9hrTfolaHcAbT+tVIsg8oH5foHsliU0UEgcatNu4f6cJlzFROt
	S0ds0Rjgxb6fvJVLi6Ibegk6oq1rWbJTLkUyFV2TZGJlmIT5+rk1fSOxkh+YYU1/0tvM7a
	xKt5j46T8sorm1xMX0iuMSVqJyK0aDRe065TXxsgcELl50tIYBZQrwqBFL05k2vylg0cRL
	fUJGCU+nqQqEuEQezKif5nyKO0aLcn3wF3K756XTkeE/pi6TJdjOBvIn+82WPw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250417074653.81593-1-krzysztof.kozlowski@linaro.org>
References: <20250417074653.81593-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] mtd: Do not enable by default during compile testing
Message-Id: <174591841848.992719.6666489302913958102.b4-ty@bootlin.com>
Date: Tue, 29 Apr 2025 11:20:18 +0200
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfgjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfffhudefgfeuueehueevudeiieejhfejudevudevieetvdetfedtfffhjeeileefnecukfhppeelvddrudekgedruddtkedrvdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrvdehhedphhgvlhhopegludelvddrudeikedruddruddtiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihsk
 hhisehlihhnrghrohdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

On Thu, 17 Apr 2025 09:46:52 +0200, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of all
> drivers, but only allow to choose to compile them.
> 
> 

Applied to mtd/next, thanks!

[1/1] mtd: Do not enable by default during compile testing
      commit: 91b7163b1ff37d24ba3a9d98f3b53f3fecfc69a5

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4031A2BCF4E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918798; cv=none; b=fOOD1qS0iTKk4wkXtZuvAnEGGZZmSMY6XrbgEwlQV2Y5pUqVMml3wj2iVEwLOx3aFtQz6+Tnf01liXZr8nuK70scbErPtTbPKTLia8w8eyPv1WB4PSHC4CZvsu6u4aMQba2jsxf/cq71h3JYxpDavJtXYi4c7jzI57LOhHnheUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918798; c=relaxed/simple;
	bh=YwEVewX6hWvg6BVdXTJU+63T6QstK8BLC4Q1ASjBTGg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BzxlyOgGxwyud46Op9cJtVCEXLPrhnuavrTk2m+vBOtcypfjGhXKgvQnIawnDbDNkeG7H71VKzizDEkh0kXm3t6aoOvF1L6Lt2rGEAHOUu4lj1yXE9xohwRZjW7bjkB73duj4Z72sGEOOR7VV3Zw3Tnvexyw6kLUNEF5wD6GEfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yb4lkZBz; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yb4lkZBz"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 227EF43ACC;
	Tue, 29 Apr 2025 09:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745918794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9PV1lEC3z14dCKQJep2/Y47TCOjibjgPvzjWr13y7FY=;
	b=Yb4lkZBzty6dQHEJvFBapNYfiCzNjr7fJMo9ZaQwhnbWTYFrPPiIKW9QU1KY7QQo4uXNVO
	GshDaWFfWML5BRlLEO48/CJ4BMhlIOLudF4tStLc34Wc4FMfDp+0uqQaSp/WjFr2H5i8St
	DwRyElpMD5AeYTjOkWrLJL4ey1oB3zMqFDWumrG9MqmqAPQtKr/lmEoUqiE3wXyoBDx+Xi
	Iwfjog5iIi6OQd2vy45O8hXuduQAj3VnLgQX73UtvHlM9zu/wKNLj6XV/KGy1YdeqAbv0P
	SLV5b4C7vP3PSIsNxWIaxylQ/Pu11r14C4ymrkGRNs8h0Zh9WePZ3uHmMB7jlQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250407094347.2108-1-vulab@iscas.ac.cn>
References: <20250407094347.2108-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH v3] mtd: bcm47xxnflash: Add error handling for
 bcm47xxnflash_ops_bcm4706_ctl_cmd()
Message-Id: <174591879227.993707.10510220720735935886.b4-ty@bootlin.com>
Date: Tue, 29 Apr 2025 11:26:32 +0200
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeelvddrudekgedruddtkedrvdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrvdehhedphhgvlhhopegludelvddrudeikedruddruddtiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehvuhhlrggssehishgtrghsrdgrtgdrtghnpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

On Mon, 07 Apr 2025 17:43:47 +0800, Wentao Liang wrote:
> The function bcm47xxnflash_ops_bcm4706_cmd_ctrl() calls the function
> bcm47xxnflash_ops_bcm4706_ctl_cmd(), but does not check its return value.
> A proper implementation can be found in bcm47xxnflash_ops_bcm4706_write().
> 
> Add error log to the bcm47xxnflash_ops_bcm4706_ctl_cmd() via pr_err()
> to prevent silent failure. The error Log funciton 'dev_err' is unsuitable
> in this situation for it is hard to get device pointer.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: bcm47xxnflash: Add error handling for bcm47xxnflash_ops_bcm4706_ctl_cmd()
      commit: 00b102d9e3827fabad366e464512a34f97406389

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


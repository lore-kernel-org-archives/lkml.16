Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCC31FCFFC
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747303001; cv=none; b=Hc56O81hBtANufyBtwi1sb70c6muocSz0cvCw/+rejy3yJ3IyOoOtO9qGYpB5lUxrvT/Qm/T8nc0X6WS+8FtmZPXaXYOklrgF9ky7cybQUTK1aNniqxsqMpB1hBCi5+AMzO/hWjXBBS1PVrmlhMWqpkXzOuyLaUBt/JGMHi1Eg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747303001; c=relaxed/simple;
	bh=9daz873AML8PH9dGYcCVjPZMBzm/Rsy9GJ2D4PB7RgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIMq98rpNg966bDMhj72q6xt5fRwD9Ox2N3DnfaCyVc39lWCG2Q1J2NPyVDVJ6gQf+olhUoXZiSciMloiR9R/pI79+1B/C62ZPY83U20kFKeCXYq2gOLyEAqyE1Kme5rNbukC/6bYW3adaPKKGSbqhMo478lYRzV0fVO0ZeyyZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pS3O+aXu; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pS3O+aXu"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69E2A443C1;
	Thu, 15 May 2025 09:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747302996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7b7QfGSwTLf0/PzmgHM9kT4FYPZClKyby6GF/Dr6W6Y=;
	b=pS3O+aXuaUpOl3ut6N2HqUFsPuhA3T2JNmDd+qC4sCm7kJ3vQBPa9z/pyJdBRKiZfx+3XW
	OKmuO623zxf2XjHRc8W7D9BcKZJsQYrv9PKIJTIAWpBwYTj76mzxVVu7HPNlxf4cjDqkZt
	YvZ8Wav1oT9jAGGUghkdUMJgYg6sEteqCqcQHr5bu536dQB4u7qmRul+rqwu+oOPvnC6Z9
	ld82GxTYnnz31IXYLxB0xojg3UP3NrTiujiH097jM5+P4gK4xnuNNuMbbHCD5zl3H/2Qpc
	1u5vPBTmHJZjFium/XAMSx+yMnv6kWCyKdlUL5Eqa69Eqpmx+eo5QMzdHusx4Q==
Date: Thu, 15 May 2025 11:56:33 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] i3c: master: svc: skip address resend on repeat
 START
Message-ID: <174730297355.1309338.10386281682864531931.b4-ty@bootlin.com>
References: <20250429054234.4013929-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429054234.4013929-1-Frank.Li@nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdelheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtdgumegvgeekjeemgedugehfmeeftdgvfeemiegtvddumeehrggurgemfhehsgemleefgegvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtdgumegvgeekjeemgedugehfmeeftdgvfeemiegtvddumeehrggurgemfhehsgemleefgegvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhin
 hhfrhgruggvrggurdhorhhgpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 29 Apr 2025 01:42:34 -0400, Frank Li wrote:
> According to the I3C specification, address arbitration only happens during
> the START. Repeated START do not initiate arbitration, and In-Band
> Interrupts (IBIs) cannot occur at this stage.
> 
> Resending the address upon a NACK in a repeat START is therefore redundant
> and unnecessary. Avoid redundant retries, improving efficiency and ensuring
> protocol compliance.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: skip address resend on repeat START
      https://git.kernel.org/abelloni/c/12cbd1573448

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

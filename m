Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E585D2417C8;
	Tue, 15 Apr 2025 11:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715209; cv=none; b=XGvSEhdyEEaHo5DZ3dOJbreI69Uoa9W3P5nTeGQYfJ456L2ojfLd6FrvqASmHgw0uJTuK0YKDSd30yPipp1odRKn0qe31jQqP52Gbr6jtyYGWcZYkIt+bm1J6M7zrN2UCRT8eHb+OLi3UL2flrGyVsglxidr2fYUbQAdyQwsrPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715209; c=relaxed/simple;
	bh=Ha0elEjMP6yRTsucjzFgdJXqzOY/qP0SIL9jP1gI9zY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DsvWeaoF5wEKYPH5qsRg7X1GbfJDeShgkO9gOxbGCXyp8LBrimYJkByzY1K3PozsGmC3VqlYRJGmRZFTjdaNjzRAqNGzmotFVAybKIK+WJTLlYrFUbTjQXCWVavcypjFfKn0KbpQUOTo1a5l1KAhpiTbswdQVF4obiosGuzYr6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MAy+kUu6; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MAy+kUu6"
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD3D54333F;
	Tue, 15 Apr 2025 11:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744715205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=udU7VdwDyMJ3EQPBOEs8+xexnGGNWkNKUrKue8Vn0cU=;
	b=MAy+kUu6XYprpvyB25g/DO0TGELhc5Rxkkc0RFGGgSdkXUkcI5UK41CK+H08djf1xkeheO
	sh5NG8p8T4LWiwyRhYNueufUaZziKHiqRrfF3YADbuisMVhNMDpE0a5pRd9XsOouRH9CbW
	KcH7a+h6rgo/EfumJK+nt1o1MXNBpQ+na70auxJ484YUZgC1KgpXUzxmUPg2GgkBHPTzDR
	vt048Qh0DbOBar99p6W6IWhdXWbJDMJwG35KLBLtz5G0BSK4ZVEwzdTjCpoX9jQLjDZXo3
	JipGw4zRJvJeG7IgYW+oUYInFT89xTPDbHvGXwgwiTtBujxC40ZNP4YYCFcm2A==
Date: Tue, 15 Apr 2025 13:06:42 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe
 Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, Tero Kristo
 <kristo@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Subject: Re: [PATCH net-next 3/4] net: ethernet: ti: am65-cpsw: fixup PHY
 mode for fixed RGMII TX delay
Message-ID: <20250415130642.00410100@fedora.home>
In-Reply-To: <32e0dffa7ea139e7912607a08e391809d7383677.1744710099.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
	<32e0dffa7ea139e7912607a08e391809d7383677.1744710099.git.matthias.schiffer@ew.tq-group.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeffedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeeftdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheetveefiedvkeejfeekkefffefgtdduteejheekgeeileehkefgfefgveevfffhnecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtohepmhgrthhthhhirghsrdhstghhihhffhgvrhesvgifrdhtqhdqghhrohhuphdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvm
 hesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

On Tue, 15 Apr 2025 12:18:03 +0200
Matthias Schiffer <matthias.schiffer@ew.tq-group.com> wrote:

> All am65-cpsw controllers have a fixed TX delay, so the PHY interface
> mode must be fixed up to account for this.
> 
> Modes that claim to a delay on the PCB can't actually work. Warn people
> to update their Device Trees if one of the unsupported modes is specified.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

This looks good to me,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

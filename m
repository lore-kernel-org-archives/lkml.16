Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA57BA49;
	Mon, 14 Apr 2025 21:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744666830; cv=none; b=FzegKCD7TCg9/UnZGRVUAEwyPJKkD5cUokUvnKmOE+L+urAQgrERCOU+eyRg+TEDRMNf0ufd3Z9hTMVXBqENMuL/VonkHO2wbAdP8zXq/saNA9MQm0mx44+ciV8GpwttGywexMToX+MmrunSI3RWDz4zo4zVnRrQy9/UMhhV3cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744666830; c=relaxed/simple;
	bh=vA6yrS7wCQTLIZxQzwv6fqjtqRp/S/SmRxdhfTHYywg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PMLbSXr/noAu3t/Jkc73i7tUZ3EDIbwW4WarzEeiUFkGQfzya9JUKEfSpCDBv+WJSPKby2kRal5V09lFp8n3eVxUUaJuccyrhijyIfcbjzzz+/rVIX0n33Ba0x0b/Zg9tpqGcbXxbTKtHJ3v1o3sUEqqVhD2IDaS6ZMZUPYI5aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEuoc7pB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEuoc7pB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67218C4CEE2;
	Mon, 14 Apr 2025 21:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744666829;
	bh=vA6yrS7wCQTLIZxQzwv6fqjtqRp/S/SmRxdhfTHYywg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mEuoc7pBBfVTfDTbvh5XDj4/BQDarG4KBPE7pxRhCbn2KXH4gJCDFjGScTFFRZOS9
	 dwsCIPwYRcvw9bg68/+hpV/rF11qFOHIIzVhwnkFfywPTsMTwubqM79VNVO6TbCUbu
	 KU7gEwbm/iksY1xOBfJmyLtoQD0t4mvkokyKZZHWVX9zO5fHDnnSXmCC/zvYzS0NOn
	 J7WWXaxIxfsaXq49bsoBAS7ryMcHAoh3ttp3lZ8Tf0jto4jV1QpiZf5cgplFplky6b
	 Qa/m6jswC797OynYC+9+tyF3cjxsbbfJEeIzuHMt+ygS1Dmm0CM80igsUY+uZI4vjS
	 s6FFpG320jAvg==
Date: Mon, 14 Apr 2025 14:40:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, andrew@lunn.ch
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, sander@svanheule.net,
 markus.stockhausen@gmx.de, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: mdio: Add RTL9300 MDIO driver
Message-ID: <20250414144028.39b0d6a9@kernel.org>
In-Reply-To: <20250409231554.3943115-1-chris.packham@alliedtelesis.co.nz>
References: <20250409231554.3943115-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Apr 2025 11:15:54 +1200 Chris Packham wrote:
> Add a driver for the MDIO controller on the RTL9300 family of Ethernet
> switches with integrated SoC. There are 4 physical SMI interfaces on the
> RTL9300 however access is done using the switch ports. The driver takes
> the MDIO bus hierarchy from the DTS and uses this to configure the
> switch ports so they are associated with the correct PHY. This mapping
> is also used when dealing with software requests from phylib.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Hi Andrew, does this look okay to you now?

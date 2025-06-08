Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832F88F77;
	Sun,  8 Jun 2025 21:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749417154; cv=none; b=DaJ4fKKPkYgKePERHQ6XV/io2dl5ZG9dweCe8Rsi0avtIGy4PGUNmU/O3xeMVniN8ew8CV3lNn6hny1fcVx6aeq1yrsIX5djoxPgWHRJy3ZbQikXC+Wu9/esJxgg33TsVZg3N3eeIhk+cd+kvWiaQG7nUf13N36ckH5Z5EL7wOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749417154; c=relaxed/simple;
	bh=zpwkD1xzJ1CfWajwTwtODxhHyF7w0UPiUbjFE44caUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2/PZHzjYyt+ehavsnC8wVtYv8J+GrCm9BSL43kawnXs01K5xroAW5hlzEU5KJcg9LKbyzv0VGuk7asL7H/64xaKnPuTKkdFt2eMIH6ixK/lyghpee9DWuROWxXrd2qzYkRZ92PLlhGKBQZJe1bc1r61YFWGif4uoh7T/QyPdQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=5XbMpBSl; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="5XbMpBSl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kWsKDDy9kZ/KJyIOPjKBSE/YT6JRQAUiK4YeE/ZD9hk=; b=5XbMpBSlK41qNpn7kBaeSyFt2S
	rge05IxY4AqKvRtXDrRi32pYxXShym3BoesP15kMDEuWBsI8nQhk8Rbbm5IMBU7R/UedTAlaZhXez
	iH7HaHZMpbWq8iMSlMDcV5KBp/i5BhbvSZqP8GIz3hAlMLG+1BEwLaZdKoVBq4Gqr49w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uONJS-00F6XO-64; Sun, 08 Jun 2025 23:12:18 +0200
Date: Sun, 8 Jun 2025 23:12:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: Convert marvell,armada-380-comphy to
 DT schema
Message-ID: <cf506115-27b0-40a8-a081-345c286c733e@lunn.ch>
References: <20250607212541.742427-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607212541.742427-1-robh@kernel.org>

On Sat, Jun 07, 2025 at 04:25:40PM -0500, Rob Herring (Arm) wrote:
> Convert the Marvell Armada 38x combo PHY binding to DT schema format.
> It's a straight forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

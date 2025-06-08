Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16EF1B6CE9;
	Sun,  8 Jun 2025 21:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749417251; cv=none; b=s1yZbCLmEsw4AoMhDIYPsGqyKgAIJpJ/QWhLd041rKjMjRATwTtswcvI9+xUwbGDtnxsgbUOoJLHxJO77fBWVhWO5ztluj4BH64qHWfpjY9UdgzLpoyAizKHLwAL5QW56CGoduAnHVaUm2VJRv0G47C69vQ3RrpPBnnr8b8M/lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749417251; c=relaxed/simple;
	bh=jMCvo47bLrLa1nlnPTAEP16tzAEHabgbxpdJqycWUcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxnoJqjXotKGHLNbm/kTQhpGUG1KWru//A7nN6y4Ib9NK8NYtc0HHTCu0XmNchnLk0TpWn1q93QU1hOrec6rF4gvMEigKGa4J3KDZZK4uFmUX9HiAWLuHVJA4TuQgmiPc3dLJHa0lqaRe3iwtLoqM2iwx43E/LM/AxobnK7a1WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=0hfZ6/Ut; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="0hfZ6/Ut"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5sk27JfuWcF0bH268NwzUVGeJr+yZGPV/LI7KbrbOYc=; b=0hfZ6/UtGOC+uFXgCJTereXSjs
	jzQKWR0fLiKgyagBXy+tJB7Hpmf+IfSDR8i1YJOai7pSXzaFbG18uwxlE2NiH2gAPIHuTObpFmOfk
	Cg2g3drf+A/ktxCiVtq385vOEU6fY0XSSAyCjcXKuljchcpqsC5kRmyGf3F2zt8BC4U4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uONL9-00F6Y0-LO; Sun, 08 Jun 2025 23:14:03 +0200
Date: Sun, 8 Jun 2025 23:14:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: Convert Marvell MVEBU PHYs to DT schema
Message-ID: <34b67ca9-60f8-49f5-a457-c107bf846767@lunn.ch>
References: <20250607212609.743346-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607212609.743346-1-robh@kernel.org>

On Sat, Jun 07, 2025 at 04:26:07PM -0500, Rob Herring (Arm) wrote:
> Convert the Marvell Armada-375 USB and MVEBU SATA PHY binding to DT
> schema format. It's a straight forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

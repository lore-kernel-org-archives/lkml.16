Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A77221D596;
	Mon, 21 Apr 2025 22:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745274216; cv=none; b=Uzap6J3Eg0ARduWs5WtP/rSlWeKk7r0mQ6wPiJomKe+wVoCzJRnUl4bmiKtvxZzzvQILzYyx50An7L1QtdIWQGWUbmaqWdzTnHhkDsalUydoAtjtNv5/CahEFLkGOe90zRfqXL4czHjX//lt41MebLtewvtrP1CgqE6BwmIdses=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745274216; c=relaxed/simple;
	bh=gJ2dCcE3gYGwRnKZEz2qvzraAtdeODS27tt9wyVK3Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzJhfa2QhcqjSbKqROKdd/jaYxBq0K6LsoFeRhqoRT1Awr3jbVUmaM+pOXHP5tgyMktCzIEDpJq3YK14/1P879NjFlxf1m8suji6JIrpUk5g3lBsA0SoPLyX+icJIYOzpsP4QMeRmB4N3c/7APFpSd6daJvAFlf84dlb2+P2gaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awIyxrwq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awIyxrwq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EFAC4CEE4;
	Mon, 21 Apr 2025 22:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745274215;
	bh=gJ2dCcE3gYGwRnKZEz2qvzraAtdeODS27tt9wyVK3Fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=awIyxrwqcbcgWRB1IRhjSCBA2q329xGXyOl7eQNCMdIcv0KZnqVBnJE7Droi1mysA
	 DgKwNAjmaJlIVIjSvPEOLqa/9agI99lCefTJaM6kqwdRUV+ijH04EIdNr4NiCgEnbc
	 JfSk4Do9R3rtRnpCoMDl2hdp8XCMaFpM8J/Ag6NsDARdRjn+wOtcADnxnUM0uaHy1f
	 G7/sYDOiFbLlBDvOlsIqasC/zHsHjGU1qSDPWw8iSTDl9LCGPhDja//8GU1KdUoP6E
	 hOcRSFUbpNloxCpKFW3BHSNU4TMtG4281/l+LPbnJBr95GVije8YPbRtPKdJNPTyrb
	 o62EP7zFen2fQ==
Date: Mon, 21 Apr 2025 17:23:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	Andrew Davis <afd@ti.com>, Florian Fainelli <f.fainelli@gmail.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH net-next v3 2/4] dt-bindings: net: dp83822: add
 constraints for mac-termination-ohms
Message-ID: <174527421249.3182555.7274225771521228648.robh@kernel.org>
References: <20250416-dp83822-mac-impedance-v3-0-028ac426cddb@liebherr.com>
 <20250416-dp83822-mac-impedance-v3-2-028ac426cddb@liebherr.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-dp83822-mac-impedance-v3-2-028ac426cddb@liebherr.com>


On Wed, 16 Apr 2025 19:14:48 +0200, Dimitri Fedrau wrote:
> Property mac-termination-ohms is defined in ethernet-phy.yaml. Add allowed
> values for the property.
> 
> Signed-off-by: Dimitri Fedrau <dimitri.fedrau@liebherr.com>
> ---
>  Documentation/devicetree/bindings/net/ti,dp83822.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


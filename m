Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F3522D4DA;
	Fri, 25 Apr 2025 11:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579832; cv=none; b=sajdhHgeKzrKsTq+j0HIUlll0MJUvN9lZbbCl3dJZAAdmxuqt3ajNcdomnFoAqs9Y6yuzCjO6qPnITmMAWTG9NQgZxM88J/3A4PwDDibiKYbPoNsWxPPtA2Mj63InFSdzdZvs5cwPp6lfFf0aYcw2vRk+YvRhYDr3JzujcfUaqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579832; c=relaxed/simple;
	bh=WhwOteXj64XGivhOiwvnlcDEYElHNPlWxr/veIpt9QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Swf6OODR8LVP8YmQVg2KMDm7wdkfoIatQu/5QUw55XbaPQhL76cnZhqrpGqlLjSnY0XKSUCuAYDf1tfHpCol+xve1rwa6i+Ri9fM4tDE0fXQHfz4xZ61T+5HJvmD3H+fsafAEW4lto+tizZpoFMIzy6Ahq50ucSxTsaOLRpE9kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dwrSyhc0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dwrSyhc0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D956C4CEE4;
	Fri, 25 Apr 2025 11:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745579832;
	bh=WhwOteXj64XGivhOiwvnlcDEYElHNPlWxr/veIpt9QA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwrSyhc0nfxJs4zr5Kxh7IyD+y3bTA/T0NqycOb19T2Nz/ENOIm0cY8YCKP50LdWP
	 ubRqbt78/ak+GhrafY1iSKp1NeKXyY2IuGIwPG+apCSBMsw4Ll4N1CuHM15IPdvEz7
	 JL+qWAZcK34SOQjgZTisUb4f6iKokg65BA7Jg3mY=
Date: Fri, 25 Apr 2025 13:17:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: rockchip: Convert RK3399 Type-C PHY
 to schema
Message-ID: <2025042559-badland-uncombed-c484@gregkh>
References: <20250416202419.3836688-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416202419.3836688-1-robh@kernel.org>

On Wed, Apr 16, 2025 at 03:24:17PM -0500, Rob Herring (Arm) wrote:
> Convert the Rockchip RK3399 Type-C PHY to DT schema format. Add the
> missing "power-domains" property and "port" and "orientation-switch"
> properties in the child nodes.
> 
> Omit the previously deprecated properties as they aren't used anywhere.
> 
> Drop the 2nd example which was pretty much identical to the 1st example.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

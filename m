Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5AD1519A1;
	Fri, 11 Apr 2025 19:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744400596; cv=none; b=XSTzy7xKDmANgLAyY6d26QtKCv46gEm4eWeMtIvu5Hj46yBhTjyK6XUqtr4eeHYqbopxV+pQv/Jq6nivugTCBURaI130tw2m8fJ4JWlLmdPs+Fzs4DVsOWSMQmSY6amekprDi49mqH49umYCOhI3y9jIAKrd9UJuSQdVf8/kDbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744400596; c=relaxed/simple;
	bh=hOEB6YQrTokdNyRISWiANEmdVnnbFKTd0VOc0CYFtps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwzYl9uVlwy1ueRj3GMeYKY3kHu3l4RBI64KDGjWOzZGjwE518Q18Mn5saleT1kmKlZZx7T90wWRcpKZio+YdGwKmPCLr8eFcXmwP1zjRTF0bqGhDOXH8LVnoqVr64yzS1XG10octy7h2CKP22A0TW0mtr0ytmywzElWkjLx5aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2skaNCi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2skaNCi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785B6C4CEE2;
	Fri, 11 Apr 2025 19:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744400595;
	bh=hOEB6YQrTokdNyRISWiANEmdVnnbFKTd0VOc0CYFtps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2skaNCibdXg8ja374gy0Vpl9FvYpzoxTQsfprj9lGwTFuZ36Rj6tWNOhAl21Zcwo
	 53TNIJSqU6cAAR0ejWAg03wYlBE44yyEEEEIQYbT2Z5SWgyPV3Xd44Xro7ZStvi0wr
	 ny0tgi3EWJ3e0LJxQ5CTJDL7BVc8akwxdW3gjLOTgHL3Q0Es8EfYYN/maep6axfN7x
	 ImlFNCr8dkqGlbKvki52Smf1enXqfYGmZloC9riqaJbZPEisA+Jq8sTi32xFYgeDRP
	 cH8pxe2TL8Ptb9Rf0mxl5V4v+aawfCxUh/dff2gb1VhAYQzc/9eE8ddpVXhJsPe/Px
	 c4iIDBeNbgUtQ==
Date: Fri, 11 Apr 2025 14:43:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: edumazet@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	rogerq@kernel.org, srk@ti.com, linux-kernel@vger.kernel.org,
	pabeni@redhat.com, davem@davemloft.net, netdev@vger.kernel.org,
	kuba@kernel.org, andrew+netdev@lunn.ch, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 2/2] dt-bindings: net: ti: k3-am654-cpsw-nuss:
 evaluate fixed-link property
Message-ID: <174440059064.3779768.16005295494092694036.robh@kernel.org>
References: <20250411060917.633769-1-s-vadapalli@ti.com>
 <20250411060917.633769-3-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411060917.633769-3-s-vadapalli@ti.com>


On Fri, 11 Apr 2025 11:39:17 +0530, Siddharth Vadapalli wrote:
> Since the fixed-link (phyless) mode of operation is supported by the
> CPSW MAC, include "fixed-link" in the set of properties to be evaluated.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  .../devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


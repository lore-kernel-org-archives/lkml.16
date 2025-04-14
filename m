Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECA228F501;
	Mon, 14 Apr 2025 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638576; cv=none; b=sJqCZCD7QpO1fHNqE8YhYReJMY5o3eylyLP2eHEI4QAguAhhtcYGkc7qTcjmI4YxKD49rxyM41HCljKwKNPB8aeArq+XmlRfNIKo67yIrJGkSZ/sloAhYnelzTY3Fj4AOOg+s/YGbakPT4bBM95iUb19aEsPuTB2ZFiJ70FYpnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638576; c=relaxed/simple;
	bh=o8ivKalBhI+guvKrIwk44UYG38JFMxuYu71uRcbYqY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCFZaZv+b1MFnxh+fUpD/1fc83kHI4dao2BUmaUUIFieK4iD6DRzpS6xl3M+OSeIkZxGWWjeI4UtO2PwrBShnfzknuj+AOLnS626b4AlFtRWba0yEJpd4U3vKD2SS/dDKJoF2Yg0JIrGunUprfLEEmaqBcB9csSNO+L+DjDTzQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5YZ1X5I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5YZ1X5I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFABC4CEE2;
	Mon, 14 Apr 2025 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744638575;
	bh=o8ivKalBhI+guvKrIwk44UYG38JFMxuYu71uRcbYqY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o5YZ1X5IJtQo2hx7VfRuefWpzaxcV/rlVeJSJMXSj/FkBff6I5nELmLNPZC7VRyG8
	 eLrKUHoPhZbIwuZEyfNxQsnG+1x+nelnr9YBsuT48kHWQimchVYzfNki+ckAQSUsKN
	 DjYttJkGOqP1f2doAK+6zWYQgDS/vf5trdiT6ez5oh19kq8+HmZfcVw6rEyHWGm8Go
	 l/hQjT/hu15tYjY+KR9GSpsBXTs+JFjQ/AfX5Tn+k8kKM25krbAS/8mPfWMylvBjGj
	 hes5KS0cImv3fgTWwky+8MSJaPRe1d+IT9u1ELanf/3N2eywiD5zosT7r1dmHv3cbe
	 jzDLYZDnbCGnw==
Date: Mon, 14 Apr 2025 08:49:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: Remove obsolete cpu-topology.txt
Message-ID: <174463857063.241931.7472620485655725624.robh@kernel.org>
References: <20250410201325.962203-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410201325.962203-1-robh@kernel.org>


On Thu, 10 Apr 2025 15:13:22 -0500, Rob Herring (Arm) wrote:
> The cpu topology binding is now covered by the dtschema cpu-map.yaml
> schema with all the relevant descriptions moved to it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/cpu/cpu-topology.txt  | 553 ------------------
>  1 file changed, 553 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/cpu/cpu-topology.txt
> 

Applied, thanks!


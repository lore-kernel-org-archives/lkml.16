Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8219318786A;
	Sun,  6 Jul 2025 07:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751787334; cv=none; b=X8cnYwXqqwWCUtK3Spc23kElqqZsoD3P3g7oUZtiSpPPfAsylvGQrJM1XkJCKuLgdPvCufDEC6nQFbP/eywXztEO89oHETdTju3lWs73TsNJnOxoMmaVcnfC+iftNuPGUg0Fv2Rsq9FQIRQWQ9t9VhO6PNLKfVnn6YaC9rYvyHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751787334; c=relaxed/simple;
	bh=Qhv7JaaLJZmOz/Q2/DAC00osTHxGsOJi0aBJsxFxAv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P163qo8cxJ2uK8edH0jAkFLnVMaDV1mWVYebAGvGiEdb2IU8sKb2NIe5RpYsM0+1B9keRun4+CHh9g8vEfAH+4Xb3CKBgbunXLgTRwjhbLCRSLCt0rew009mJmwfjHPsfYv16yG1t23LyyqtrTnUZ+9cmdR21v3ndNzOjqL0EVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=V2voYMJU; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="V2voYMJU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gv1HUJnOqcclkZ4FplUtalCiTMkMRTJ+aR4w+vz1yg0=; b=V2voYMJUWgVyz6eS4ODSlICWyG
	Pez+lVqti34ZammDtip+NLzyhbMzOY5ls7FHEAGVlLdkv3qtyCxTAOUx49Rwcvy5S1TU7+lyLqhJb
	R6R777wfhYLIfgxJrEl4W/r6Bhk54kqp5/evaY5l1zo0yW0DrzAVnQ09HCuqspM+tcnk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uYJty-000WvW-OW; Sun, 06 Jul 2025 09:35:06 +0200
Date: Sun, 6 Jul 2025 09:35:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 5/7] ARM: dts: sunxi: add support for NetCube Systems
 Nagami SoM
Message-ID: <4ffe4afd-6162-4756-b473-8ad0c10bb59a@lunn.ch>
References: <20250705213900.3614963-1-lukas.schmid@netcube.li>
 <20250705213900.3614963-6-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705213900.3614963-6-lukas.schmid@netcube.li>

> +&mdio {
> +	lan8720a: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <1>;
> +	};

Indentation looks a bit odd. Too many tabs?

	    Andrew

Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2DE256C60;
	Tue, 24 Jun 2025 08:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750753291; cv=none; b=YlXcZS/zIRiTHrb0ZW/IDMYwaLaF7CDpPPEjJljZL8HaoMQHtXGg4JTxg+8O/iOCzl28Zb6QBWFkPqgFH0OGk8jbmkORcFdl8l0xU6rQWGeTeEPqxv8KRdA2BoMDtN/jtY0zA8fv0nWlF1rLzbxG2jzM3mb7X606YNGRj3wC4Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750753291; c=relaxed/simple;
	bh=ZUxYSim8vhgrKSj21zzy+5Spt88HmTvEPFVnqFBYxs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIdI01nzZ9QbiVU+f9Ax2rScN88LhuQnB12tWD9S/FGtGBOq7OnRK4x9h2UAMGQptVdJGAyA3sIzR1mr9d6/sBjfMCpt2Yfi0+wXVnMvk7GXDjpQb5L0fuWSyA4HR1kIH7xgEgKp2WUD/DDIGQ04QKKGdC7shInBSK1KmW6jJEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=iYp9hcqx; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="iYp9hcqx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kX+aDmUm6igolpiXgNXgCg/cD6t2NGaw3+p//ISLo3Q=; b=iYp9hcqx4xAC+0WkrlnifTG4Mz
	cUn+pSx1/5zpt8JU19zea/s0fSQ6x8RSCV4pwydiFdcH64QPDCCNHGBLNIUgpF72fZ4rBEWRQi/VQ
	Wy0emyklkRwzN9GNtT5ou0HV98fshE9WLPBil6b4Qpd5Dddc4Yx7h7Zw8TzA5KQVQ7kA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uTyuC-00Glop-49; Tue, 24 Jun 2025 10:21:24 +0200
Date: Tue, 24 Jun 2025 10:21:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Paresh Bhagat <p-bhagat@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, praneeth@ti.com, kristo@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, khasim@ti.com, v-singh1@ti.com,
	afd@ti.com, bb@ti.com, devarsht@ti.com
Subject: Re: [PATCHv4 4/6] arm64: dts: ti: Add support for AM62D2-EVM
Message-ID: <bf784ce6-aee7-4366-87ab-f0f79f8ef28c@lunn.ch>
References: <20250623141253.3519546-1-p-bhagat@ti.com>
 <20250623141253.3519546-5-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623141253.3519546-5-p-bhagat@ti.com>

> +&cpsw_port1 {
> +	status = "okay";
> +	phy-mode = "rgmii-rxid";
> +	phy-handle = <&cpsw3g_phy0>;

Does the PCB have extra long RX clock lines?

More likely, this should be 'rgmii-id', and you should delete the
ti,rx-internal-delay in the PHY node, allowing it to insert the 2ns
delay in the normal way.

	Andrew

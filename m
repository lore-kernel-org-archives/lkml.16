Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E54428F1;
	Tue,  1 Jul 2025 07:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355232; cv=none; b=B4D3+bLe+LPkYBr/b+VG4AHqVoFY2hKYKlAb8TjWCWJqyAqPuUgncRgpFhgV+1fURMgB2tRppeSeI5j66ylXnZu7f+EHHKQ/fnJTjzl1+/dZ2cnB2IQzuNwiUUN33TubfVVEA+glyPksKkbXtIKrcKkNEJI2BhyqnmMGaewOA10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355232; c=relaxed/simple;
	bh=2VqbAPJtUfnkDlAF8rcNfBYvaCT+VVnZ4zdP9Nu994k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDCys0VNrbBY+zVXHykusoV3L6YrXJzxLvsy1+P4yr26mCaMXW+rPvJX1VZXVfbsu8w/jlyw+j6EEyladrAQoUtJ9WhKVAwDLlutL4VbClMGBTCmaSNVPiYugdZcheRngI293Ygg84QwbBd0NiK4eRAhKih8xIRUv/auW4Z6axw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=P//OOnOm; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="P//OOnOm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6Lcv9nTvAgKsJXFRPrOjjHvHtdAeBlh7A4eHDwh00wk=; b=P//OOnOm5stv/kbXHC5u15pFPT
	IYA2JY03mW/qZZm/KKowsf07U1qsvHsCf6ZTgovpvKth50CI8ZbWdoSKlxbdt4dVR+0NoV26w3YHV
	Eb3hDqmH4FBWNMztMtM0D/4HHuHt72VL1SK7Dj8FIn1bg84nO9t8DkzgSIAOSFae8pbk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uWVUZ-00HRFJ-L8; Tue, 01 Jul 2025 09:33:23 +0200
Date: Tue, 1 Jul 2025 09:33:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Lucien.Jheng" <lucienzx159@gmail.com>
Cc: linux-clk@vger.kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
	kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, daniel@makrotopia.org, ericwouds@gmail.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	joseph.lin@airoha.com, wenshin.chung@airoha.com,
	lucien.jheng@airoha.com, albert-al.lee@airoha.com
Subject: Re: [PATCH v2 net-next PATCH 1/1] net: phy: air_en8811h: Introduce
 resume/suspend and clk_restore_context to ensure correct CKO settings after
 network interface reinitialization.
Message-ID: <90321dbf-cca3-4f00-9f2e-3d09756761f6@lunn.ch>
References: <20250630154147.80388-1-lucienzx159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630154147.80388-1-lucienzx159@gmail.com>

On Mon, Jun 30, 2025 at 11:41:47PM +0800, Lucien.Jheng wrote:
> If the user reinitializes the network interface, the PHY will reinitialize,
> and the CKO settings will revert to their initial configuration(be enabled).
> To prevent CKO from being re-enabled,
> en8811h_clk_restore_context and en8811h_resume were added
> to ensure the CKO settings remain correct.
> 
> Signed-off-by: Lucien.Jheng <lucienzx159@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

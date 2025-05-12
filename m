Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3B819E82A;
	Mon, 12 May 2025 14:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059167; cv=none; b=Mn55QkDROBsbIuaXtlsGNgeWsuIvQfQojPX39dhxfVCMuxv/I1mJoyZALRO0Xhppvg5E0W1GsfFGnO7fkLvYqzbFSWWYQHFefQtF//hvKgFTpR/Yf2xaJhI/C/9zu6fiwNB1J5q7qF4Q4amfpn3Pd2N3MZzvi1uPQCyoM7NkzTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059167; c=relaxed/simple;
	bh=LsSpEXdQ3H8nONczsTgd5Lq76/nDe6VX3tjTlfF2WF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQqBi5cxqtGckJfnMCcAmPATGFGMkSspshJhYt4V1IPP+vgKhx6zboLJnMx0Ut3OL0fTqHAohL6+ih+09x25HIlWZNYpoZeLXhQDXeDp1KWilhRUXS1gEfGHOI567Q9y+7Is1n3pPh73uHTYhFB3DlPZhRCq2EmQDiNgLCa2B0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=SnRitf4I; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="SnRitf4I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yj8p53ovX1+3UyyM71GInbt9+CKkAiGCTIRkjobnHN8=; b=SnRitf4IOUUHRZ2ZeFyk/ZbCd5
	kFITwLA/KfISWk0c5OFEgVAQDvnl+1L1qGR49bOx8qEGYKVh1fLCegGbnIJgu2Dx1fLZ9pygGjrTJ
	BodaOQlCXeviGP9incCtyZ+QjZtH0tmpKQj6V84b808MbsVtI0utb75mvQVUeNIYlQnM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uETtW-00CLRS-So; Mon, 12 May 2025 16:12:38 +0200
Date: Mon, 12 May 2025 16:12:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: chainsx@foxmail.com
Cc: robh@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	krzk+dt@kernel.org, sfr@canb.auug.org.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 2/2] arm64: dts: rockchip: add DTs for Firefly
 ROC-RK3588S-PC
Message-ID: <7570efcb-254d-4a12-be7c-33033ce4986a@lunn.ch>
References: <tencent_9922367945B45D45C938B0B947EEFFCE1808@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_9922367945B45D45C938B0B947EEFFCE1808@qq.com>

> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy1>;
> +	phy-mode = "rgmii-rxid";

Same problem.

	Andrew

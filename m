Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55EB23957D;
	Tue, 13 May 2025 12:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747139914; cv=none; b=MXh8iXWIBt9pEoHikRvJrDLCAPsCbbPIMJnJstrzjFceo+Bb0bkUoCF2PawAUpf67ShgTRi9ZC8EucvCqgTLmcNfirByXu4sVnrq4brwWrjhu6gR0mdrkfb3IZJs4eJlFUX6lDhoVEmnQp0MTPUOBM/qamHe5L+TZHLr0EIbh7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747139914; c=relaxed/simple;
	bh=lltMBHwdq1/L13SaJBhPOXp4jeaBDkH/p3zUYLQ1D38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgA40nrzMhnQJbKbBRqeSdCYX8C/3tcqriFj8vlldkRT+iF2fOyYvgcWunP4xV82uCzxg0ibTr4TRp4gYXfUafCJ8GyxeSNpf0gLijvIutomWuhydJp0Yp3MPSkHNEvFJD+l/Z3q8gS+6DaVcIIZKZxtCBZVtGgQ/BupUCly0EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=NOQRx7XT; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="NOQRx7XT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IhcSVT0ilThLTEqD751qEwwwjKQxPdQ/g5IW8iOJnYo=; b=NOQRx7XTuoWUjZfRP5o5Wstmex
	gr38zDZCcGap0v5IKV9arZyd1u8H0b/FM7OA43lGWEWAYIpM/SHW/D33/CJJ5Py6TbFMw3w5b/al2
	a9yDwQIp8lgGHYABQ1Cv599sS1w0/trmB0ctEXHkrh+Qp4h9v9OqeAQlotRpN/POvPQI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEotg-00CS3N-90; Tue, 13 May 2025 14:38:12 +0200
Date: Tue, 13 May 2025 14:38:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: leo.jt.wang@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com, leo.jt.wang@fii-foxconn.com
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: clemente: add Meta Clemente BMC
Message-ID: <bebe4a75-0d7d-424e-a217-dfea710b3262@lunn.ch>
References: <20250513031010.267994-1-LeoWang>
 <6822b851.050a0220.27a24d.d071@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6822b851.050a0220.27a24d.d071@mx.google.com>

> +&mac0 {
> +	status = "disabled";
> +	/* phy-mode = "rgmii-rxid"; */

Did i already say this is probably wrong?

	Andrew

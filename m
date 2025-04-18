Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838FC23F40C;
	Fri, 18 Apr 2025 20:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745009454; cv=none; b=ZlGGjdwmqGMY/npHC72PguSKjobUSSTAjmpufAV7WQ9u2pzMV2I7KUiwe5R4jIInN/BpsK+v7YzCCHJ97bFttGOQcYP4oyiyrZQyKkv9xgJ4sWtQDTquirC2cTt7KPr/qAagZzrpX493WPllkMydSUWCJPnpQZvAGwb40gNoQ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745009454; c=relaxed/simple;
	bh=s604y+jSpRja418fLKbVJ1sTm8zE6+galCsWG2VMoy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0Z3RSgBwY9DtY/8tT+uOkpuPqVXdfHyur4lDSs/3jZKTt6icsysM6F9wZpXr6WoCoWx29o82ehxRSeFEIwxEv7U3CaJ5aL1YL/78hNfikE2gQQB4t4SeYp9GLeXtDxWbG2boXL6Yey9GzURkx34UzdM+pF8aoXgkbRkZGeND1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=uLEl1W9M; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="uLEl1W9M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/v3QL+G5zaPyaE53yVFfZOdUwwCtReQpm5k2VMtZqCU=; b=uLEl1W9MfUHkLSR6I7jk6x78Wm
	LgzFMhI65aGl6JkW5UojK1pcRGsijitUGJfWXg902VdbAYv6QxjYDg3tCfKB1fxUBH0QH4j4dQz9X
	DG92+bgCDA/LY10KyLYrCNuj+7Syl13h0oK8Jf9ER6D+cdDuyYjJOepDnxxgPo1d+o1s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u5sfY-009wLs-LW; Fri, 18 Apr 2025 22:50:40 +0200
Date: Fri, 18 Apr 2025 22:50:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH net-next 3/4] net: ethernet: ti: am65-cpsw: fixup PHY
 mode for fixed RGMII TX delay
Message-ID: <9c00ff66-a2c6-4d7e-979b-f5e8abc42dee@lunn.ch>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <32e0dffa7ea139e7912607a08e391809d7383677.1744710099.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32e0dffa7ea139e7912607a08e391809d7383677.1744710099.git.matthias.schiffer@ew.tq-group.com>

On Tue, Apr 15, 2025 at 12:18:03PM +0200, Matthias Schiffer wrote:
> All am65-cpsw controllers have a fixed TX delay, so the PHY interface
> mode must be fixed up to account for this.
> 
> Modes that claim to a delay on the PCB can't actually work. Warn people
> to update their Device Trees if one of the unsupported modes is specified.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

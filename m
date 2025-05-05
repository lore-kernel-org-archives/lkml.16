Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A662B4C85;
	Mon,  5 May 2025 00:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746405943; cv=none; b=h92c23f8fdVKoQsxJoYTGIM2Dyj3IpcSMXPnDRVwVQAO7OUww3CqKTwNS12cRPtXfApk22Mtw48PsgJQHK7xaKYzJmrGgV2/6KSnlAIaKJ6z2tcBh/QGxR5EfAME3o9qSXwQTZojlg84ReILAVzS3zLG5lF3UCRigH0chn60RI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746405943; c=relaxed/simple;
	bh=H2ht8BrUhUzJulUNR7lvPEReS2+YIXHtV7+2xUF1TOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nu/NQZRMVzE/SCdoGODsl2IrY0YxUbkgZw93NFAae/TuxQCCO1l5YTkIHGEJ5CpUmJBQV/Z+9ynE4LKFpO1P5LfBsDcD66lMtgEZLjkYNMvOU5cyTqCuALMJrLh89cXek6IpCVDhTN/gTxbM21ZAda6k+IEwRzhrBP6T10LOat4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=MBM2GKrr; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="MBM2GKrr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cXkMREPrerlbxBVxNZbArKbfCj+6iod7wpO5/+wdJKk=; b=MBM2GKrr+QOB1sAWkh/fBxvQpC
	LBWzS4CjJyLDB6w7AWvmEeZSxQZnvePXqHFmdGeF9h4tSBHkzyG4Dn0GZjhYufpe6b2iN/XCcthY6
	vr2UNCHn3dFGYbQ5vUYHyHQIXuSs84LAg13mTYUh59mdloK4unoY/hd2MZrAeWf2hATw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uBjxb-00BYu4-UK; Mon, 05 May 2025 02:45:31 +0200
Date: Mon, 5 May 2025 02:45:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: John Clark <inindev@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>, heiko@sntech.de, robh@kernel.org,
	conor+dt@kernel.org, detlev.casanova@collabora.com,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Luckfox Omni3576 Board
 support
Message-ID: <13407dae-4c73-48a9-846e-92f08449bc4d@lunn.ch>
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-4-inindev@gmail.com>
 <bb171ae2-c495-49a3-a7eb-a4b865e54199@kwiboo.se>
 <87892840-bdbf-43d4-bd93-cb98f5e1c672@lunn.ch>
 <b603e92f-8c1a-4aea-8bab-82a1f035c7fa@gmail.com>
 <b50c68bd-9b15-412a-ac00-1df25601edd9@lunn.ch>
 <46cbdabd-b0ed-4c9b-9f01-4d2d8eceac24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46cbdabd-b0ed-4c9b-9f01-4d2d8eceac24@gmail.com>

> > What PHY is it? Are you using the correct PHY driver for it, or
> > genphy?
> > 
> MAE0621A-Q3C
> http://www.maxio-tech.com/product/12928/12929/12930/12931.html

Mainline does not have a PHY driver for this. So nothing is
controlling the delays in the PHY. So what you have above works by
luck, and is likely to break once there is a PHY driver. So i suggest
you drop the Ethernet nodes for the moment.

There does appear to be a PHY driver here:

https://github.com/CoreELEC/linux-amlogic/blob/5.15.153_202501/drivers/net/phy/maxio.c

but it has a number of things wrong with it. You might want to search
around and see if there are any cleaner versions around, or if anybody
is working on upstreaming a driver for this PHY.

	Andrew

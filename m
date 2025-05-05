Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40B418DF80;
	Mon,  5 May 2025 14:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746453723; cv=none; b=iqCDq4Gtuqzk9Gf+QvR+8gX/lXx6p6bgvKqDSZb0MMe6M5AQvF7latqp8x+cs11dLqfcWiecpUgyNZCfQrBkFMXn1WwD/LfApxGG7udbhTRqQswtxPbVVeU0wj0BKMOO9C6Bsi0bBhlT6YZEkTt2qpSSCGwOaYYUDI1OC1lec8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746453723; c=relaxed/simple;
	bh=usHezfMo6bhPj1PFUOYdbEc11KXNCyZNPOy2NNysgJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPX1ETf+3RYPpf2TZoiF0Nu3gyiGBjSZh+8qDNL24vPUpQxGYQ59R7koHId8t/Qn14ndF6ZJOxv3syR1kmjtm0gOInWXlry1DjAvZ0HicDypu9XYWvaWJYN0ywuvGOie4hEtvPfua6JSa/w6hEoVPBpwFb0ex73e3y855svUykk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=grdYu32z; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="grdYu32z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zqZZf0ESF3/NtNqr6Zi2o+5PrzNELj5whdZBZp1/fVA=; b=grdYu32zN2Y6PI0stGQDgMrsZV
	ATOKUXvyjKaNcyXeCTQQCZg5IJay6vMsQTMUkiR1cW7dBuAQEmhe9FRkbDJYnbck85piHmxKYorcO
	hfa8aPPbXzNiy1Ss1gkRGfy9mEzPRtU+ZFJKaQvHBctF7ka4uIsE3JDexYhHBafXwEIE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uBwOE-00BbKS-6i; Mon, 05 May 2025 16:01:50 +0200
Date: Mon, 5 May 2025 16:01:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: John Clark <inindev@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
	heiko@sntech.de, robh@kernel.org, conor+dt@kernel.org,
	detlev.casanova@collabora.com, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Luckfox Omni3576 Board
 support
Message-ID: <57654be9-aa8c-4819-bac0-bb23c8884a6b@lunn.ch>
References: <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-4-inindev@gmail.com>
 <bb171ae2-c495-49a3-a7eb-a4b865e54199@kwiboo.se>
 <87892840-bdbf-43d4-bd93-cb98f5e1c672@lunn.ch>
 <b603e92f-8c1a-4aea-8bab-82a1f035c7fa@gmail.com>
 <b50c68bd-9b15-412a-ac00-1df25601edd9@lunn.ch>
 <46cbdabd-b0ed-4c9b-9f01-4d2d8eceac24@gmail.com>
 <13407dae-4c73-48a9-846e-92f08449bc4d@lunn.ch>
 <44a4aef7-9d23-4a6e-a228-39bfd3e2a308@gmail.com>
 <D9O9CD8Y6QEE.1CVYGL8TZEWI0@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9O9CD8Y6QEE.1CVYGL8TZEWI0@cknow.org>

> I have a NanoPi R5S and I want(ed) to look at its gmac node as well,
> because it (also) has some deprecated properties ... and
> ``phy-mode = "rgmii"`` which was done deliberately in commit
> 31425b1fadb2 ("arm64: dts: rockchip: fix gmac support for NanoPi R5S")
> and the change was away from "rgmii-id" ... and it has a RTL8211F-CG.
> Unfortunately the commit message doesn't say *why* it changed.

Often the developer does not actually understand RGMII delays. They
simply try things at random until it works, and then call it done.

Over the last year or more i've been much more strict at this, looking
at more patches for .dts files and pointing out errors. Hopefully with
time the errors will become less frequent as developers start to
learn, and there are more good examples top copy/paste. But it also
require some vendors to fix their broken MAC drivers.

	Andrew

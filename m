Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F7015A864
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 01:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748483522; cv=none; b=NE1k4iaHJDXQadcBn09LSYVUU70eOWvc3oO7I8JG62t5x+RjbkOq8BRed44cb1pBqMg6FoFjQwWV4cMQiTs6p0uykYXlN7ayHO2Yw/k+mpHQ4hTfyDAl0ZMfAc+mk3+6hCwfW4OKOUA5K535/0CHpI8DQpBioPbTFq0KQql0tsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748483522; c=relaxed/simple;
	bh=NpGkXL3Nr6+ks4o4P8EZCIeIM8tZfmIn7LlJLd9LAKw=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=WnVscPXOao6tBMXjVqq7NE8rYbpLEzcFfIlXXzN/02tzmVxD8y2bZnzj91hhPTTV2aqrLYn7oHkQ5JYOEIuTvEBm84m/Hg6xdtmJR3WxspDSfSu9Rr2q6RK+4bXSmqNicF28Klt2vcJ+coIF8T3rDFvaRCGfFxNzKwReJbJuNds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YRn0t6qL; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YRn0t6qL"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748483518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bj3nEQac8SumyTQbWqu5/Mtr9p89fKny4Ga+HbmaXtg=;
	b=YRn0t6qLAK7GzmX+dNGMBATUCVmLs6cB8WOZMyXOfR8oGnbXXhG2ydP0hnla+O32JR4ooD
	3Ep+8Z0kPgg6j87c/bZQR77M2pkGG1sWg7mT449qiE8z9l2xlpsybo6UEZEPRJXRjbTUaj
	WOenTWrFEFkXIlW2ve9+KW8NUR5WCYg=
Date: Thu, 29 May 2025 01:51:54 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Yajun Deng" <yajun.deng@linux.dev>
Message-ID: <5e2c874d31392800255b86fbbd4d1174306f1c28@linux.dev>
TLS-Required: No
Subject: Re: [PATCH net-next] net: phy: Add c45_phy_ids sysfs entry
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: "Andrew Lunn" <andrew@lunn.ch>, hkallweit1@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <aDcKvwDaa6_1gZY7@shell.armlinux.org.uk>
References: <20250523132606.2814-1-yajun.deng@linux.dev>
 <2eec1d17-a6d1-4859-9cc9-43eeac23edbd@lunn.ch>
 <fad26dc95cbe08a87b30d98a55b7e3d987683589@linux.dev>
 <aDQkLcfeu8zw8CJ_@shell.armlinux.org.uk>
 <552f550315dc503250cc61fdcd13db38c1ea00f5@linux.dev>
 <aDcKvwDaa6_1gZY7@shell.armlinux.org.uk>
X-Migadu-Flow: FLOW_OUT

May 28, 2025 at 9:08 PM, "Russell King (Oracle)" <linux@armlinux.org.uk> =
wrote:



>=20
>=20On Mon, May 26, 2025 at 08:52:12AM +0000, Yajun Deng wrote:
>=20
>=20>=20
>=20> May 26, 2025 at 4:19 PM, "Russell King (Oracle)" <linux@armlinux.or=
g.uk> wrote:
> >=20
>=20>  On Mon, May 26, 2025 at 08:11:21AM +0000, Yajun Deng wrote:
> >=20
>=20>  > $ ls /sys/class/net/eth0/phydev/c45_phy_ids
> >=20
>=20>  >=20
>=20>=20
>=20>  > mmd10_device_id mmd17_device_id mmd23_device_id mmd2_device_id m=
md7_device_id
> >=20
>=20>  >=20
>=20>=20
>=20>  > mmd11_device_id mmd18_device_id mmd24_device_id mmd30_device_id =
mmd8_device_id
> >=20
>=20>  >=20
>=20>=20
>=20>  > mmd12_device_id mmd19_device_id mmd25_device_id mmd31_device_id =
mmd9_device_id
> >=20
>=20>  >=20
>=20>=20
>=20>  > mmd13_device_id mmd1_device_id mmd26_device_id mmd3_device_id
> >=20
>=20>  >=20
>=20>=20
>=20>  > mmd14_device_id mmd20_device_id mmd27_device_id mmd4_device_id
> >=20
>=20>  >=20
>=20>=20
>=20>  > mmd15_device_id mmd21_device_id mmd28_device_id mmd5_device_id
> >=20
>=20>  >=20
>=20>=20
>=20>  > mmd16_device_id mmd22_device_id mmd29_device_id mmd6_device_id
> >=20
>=20>  >=20
>=20>=20
>=20>=20=20
>=20>=20
>=20>  I suspect you don't have a PHY that defines all these IDs. Are you=
 sure
> >=20
>=20>=20=20
>=20>=20
>=20>  your .is_visible() is working properly?
> >=20
>=20>=20=20
>=20>=20
>=20>=20=20
>=20>=20
>=20>  I'm just determining if it's a c45 device and not filtering PHY ID=
 content now.
> >=20
>=20>  I can add this condition.
> >=20
>=20
> I'm talking about listing all 31 entries, whether they're implemented i=
n
>=20
>=20the PHY or not. Look at mmds_present in struct phy_c45_device_ids to
>=20
>=20determine which IDs should be exported as well as checking whether th=
e
>=20
>=20ID value you're exporting is not 0 or ~0.
>=20

I've=20already sent v2. Please review it.

> --=20
>=20
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
>=20
>=20FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
>

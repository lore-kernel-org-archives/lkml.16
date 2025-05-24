Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AF517BBF
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 01:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748050588; cv=none; b=Ih8muN9bQqxMmKguSiuMCX58pUU4Q6Hc/ibRzYKSIBNa3BCtRjgjUWcP8qULtoS+PKcpNMo7wJv8i53yZ92VnNX6TK9AVIM0J1bCchumfeaHibjBhYZdOwEd0qfjS+BizUbNy/zE4TZ2UUk1JOmb0ddvCzGMM8YCP5M5B10u0FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748050588; c=relaxed/simple;
	bh=e9K8Kbprv3zb127DhoFwfaVJWsK1ZaRakSP2VOIvi00=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=M3z96NKjKjCObLbXi7ODUFq/PzdyYjzufbCuAGQN2SPm5urQz2Q89KmrMl0wwiQ+HNB9btwOUXgSsSj8sRXaSecYl+9P0XP1rfZOBRI8X/nGoRzAgARBw7kzo8HC05yv51KxDDJjXi/dg2s4b7vUF32lR3R8tbWzQzLrjmzHT6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CM+uelRr; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CM+uelRr"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748050583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YNrWWSRbpAwKCZ1No4gGaumbUFVHSNWjlLvqLJZX20U=;
	b=CM+uelRrpruU2azEYw4fFYZoplAeT/RaYqhP8IzloBoyXE6dYHdJY9Bssh23pa6W6e9VFa
	IEbbjE8SN8S6KBwtUPr/50XvQjBKW7xhaMmlRrmbnFmqHu7WDjQ2/ss+kUt/0a8T5TliMs
	mcJiqJkFq2nMRDhETg86g21VLOCKl2M=
Date: Sat, 24 May 2025 01:36:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Yajun Deng" <yajun.deng@linux.dev>
Message-ID: <4c14bb4887acf67ec5a4893c8e3f736c2a77a4a3@linux.dev>
TLS-Required: No
Subject: Re: [PATCH net-next] net: phy: Synchronize c45_ids to phy_id
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: "Andrew Lunn" <andrew@lunn.ch>, hkallweit1@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <aDCyQOdcREDJTa-V@shell.armlinux.org.uk>
References: <20250522131918.31454-1-yajun.deng@linux.dev>
 <831a5923-5946-457e-8ff6-e92c8a0818fd@lunn.ch>
 <5d16e7c3201df22074019574d947dab1b5934b87@linux.dev>
 <aDCyQOdcREDJTa-V@shell.armlinux.org.uk>
X-Migadu-Flow: FLOW_OUT

May 24, 2025 at 1:37 AM, "Russell King (Oracle)" <linux@armlinux.org.uk> =
wrote:



>=20
>=20On Fri, May 23, 2025 at 02:10:00AM +0000, Yajun Deng wrote:
>=20
>=20>=20
>=20> I noticed that. I tested the BCM89890, 88X3310 and 88Q2110 PHY devi=
ces,
> >=20
>=20>  and the ID is always the same in different MMDs.
> >=20
>=20
> The 88x3310 PHY uses:
>=20
>=20 Device ID Package ID OUI
>=20
>=20MMD 1: 0x002b09aa 0x002b09aa 00:0a:c2
>=20
>=20MMD 3: 0x002b09aa 0x002b09aa 00:0a:c2
>=20
>=20MMD 4: 0x01410daa 0x01410daa 00:50:43
>=20
>=20MMD 7: 0x002b09aa 0x002b09aa 00:0a:c2
>=20
>=20other MMDs do not contain an ID.
>=20
>=20According to https://hwaddress.com/oui-iab/00-0A-C2/, 00:0a:c2 is/was
>=20
>=20Wuhan FiberHome Digital Technology Co.
>=20
>=2000:50:43 is Marvell Semiconductor.
>=20
>=20Not all PHYs have a single ID. IEEE 802.3 allows for this.
>=20

Okay,=20thank you. I'll add the c45_ids entry for the c45 device.

> --=20
>=20
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
>=20
>=20FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
>

Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB718494;
	Wed,  4 Jun 2025 12:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749040276; cv=none; b=WbaHVi728mGQyTYeeKMr3tEXeTdjgfySca2tF2pVrvtHGKufUngtwV5fooHNIMVO010LjkBZbAAwO5TWdbp4GggvvwuqtFGOPIW57eTEoKgC71+Ai/QuAaF4GJa+Jy6dmlvDMtlzNW4/q0nNxBtH3yAVaIIOCXRYooZkf80epio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749040276; c=relaxed/simple;
	bh=3a8a3VNtDPC5P7znjUS9D0EHfuwYumd32SWxjdL1tZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bW9SbtdWQtKGFUKI60H1khOX7fDCbN+SinSHi2ypqHbikLLSOIF4/Hcl/RLZ1ytxedYtds91ygjFlF4N0a8AvpTsHjvNUKPiohO1M0cxu/YXTfJRNvAwMLVGdYwuewaK9pFkVLoAfBAXgGKvPkAFb2XRGXSv4veIAs8gPScwloU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=DvliSg9D; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="DvliSg9D"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=826RNNo4pLf5DowBri4/2RCK+Kg2Gne6GYyzYhuVGIU=; b=DvliSg9DsB0+0yzG6i6MTfbD9F
	qLnL4Z+3badsfgFU8A9QOfj1hK4a1swl277066wiJAm/v2DxDgPJ5wW5oznCwVWizGWaL6tE++JLL
	DUDlTGHrqpPWw5Qjn8H0ytmSwsfCc1nB1qgdK/ZFnvS1SdCnw0xVtz+3soskS/24ICLY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uMnGp-00EgEC-KG; Wed, 04 Jun 2025 14:31:03 +0200
Date: Wed, 4 Jun 2025 14:31:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Joseph, Abin" <Abin.Joseph@amd.com>
Cc: "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
	"claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"git (AMD-Xilinx)" <git@amd.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next] net: macb: Add shutdown operation support
Message-ID: <7a8bf428-1332-44f9-bb59-321989ec2578@lunn.ch>
References: <20250603152724.3004759-1-abin.joseph@amd.com>
 <3f3a9687-1dea-41fb-8567-1186d4fa2df2@lunn.ch>
 <CH3PR12MB9171B307A46A01455DBBA241FC6CA@CH3PR12MB9171.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH3PR12MB9171B307A46A01455DBBA241FC6CA@CH3PR12MB9171.namprd12.prod.outlook.com>

> Yes, I tested this on a device which was admin down using "ifconfig eth0 down".

ifconfig has been deprecated for over a decade. I suggest you stop
using it.

> I observed that macb_close() is invoked only once, specifically when
> the interface is bought down. During the kexec call the shutdown
> hook is triggered, but the close() won't be called In this scenario.

Implementations vary quite a bit, so i have no idea what is actually
correct. But my aesthetic sense is calling dev_close() without a
matching dev_open() up is wrong. Please could you expand the commit
message, because i had a look at some other .shutdown functions and
they are careful to not call dev_close() unless the interface is admin
up.  Some take, RTNL, some don't. So a good commit message which
explaining why you change is correct would be good.

	   Andrew

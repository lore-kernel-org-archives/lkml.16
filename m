Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E511367
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 18:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678671; cv=none; b=KPLnOJLGm33/SqOqIQ+xa5rLNoYEm86+7ItKbGRW5/SI94Hw7btMsgMuw/Mu4VLkOCwGbLGk5Gail306Mt6W2huzjyvUwDYSsVS55jXOiC2wHL4yzSdrCTXu2KEvojebREDp9InvTs7IuGEgeU1yyKyYGbl36fGZpkO+jQL+ftc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678671; c=relaxed/simple;
	bh=rWqFFnZAjA9qV1M6OAtUswK4A2UOPUTl0B8sMg8vEe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ckfv/tR1uwtWQve2zDBT4uW0Qg4IwBWSrGdDrLNmng2BdPOn1RKdq4QpkaP7kVsrj2J+1Oq70iomzOoYVOz3Zm4xs53McdKM3Np3q3bAeGTcQ7ruEAXGvTrOS6MKKV9BwHi97xMG2Ikdj2dxD8XNf7Ht/Pwdb5ggVFp44AMc8/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gYNl5sJb; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gYNl5sJb"
Message-ID: <539831fb-398c-4a0a-9540-be6920d301a6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747678667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fn3cGv9I5sWCQyw4pWpqAh8sShrzm0fJagaVoXuUd18=;
	b=gYNl5sJbIKUAC/eCUQEphbRhwZMsizk2cSAJ0JNVVoJPWJ2q6oE9zafceQ/PEcW5X4jG9Z
	b71bf5ntodaZ9eL0uXhHIfYbJjc/kuF2Jrh9muprOC5pFgH2zbulGYY2Roqzw31dHdcnCj
	27sUPhHaQH45ej5wpxiYl9a7L9Lto4A=
Date: Mon, 19 May 2025 14:17:43 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [net-next PATCH v4 06/11] net: phy: Export some functions
To: Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, upstream@airoha.com,
 Kory Maincent <kory.maincent@bootlin.com>, Simon Horman <horms@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-kernel@vger.kernel.org
References: <20250512161013.731955-1-sean.anderson@linux.dev>
 <20250512161013.731955-7-sean.anderson@linux.dev>
 <20250514195716.5ec9d927@kernel.org>
 <9c4715cb-4b7f-4c0f-8170-da7a9daba7ec@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <9c4715cb-4b7f-4c0f-8170-da7a9daba7ec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/15/25 01:38, Heiner Kallweit wrote:
> On 15.05.2025 04:57, Jakub Kicinski wrote:
>> On Mon, 12 May 2025 12:10:08 -0400 Sean Anderson wrote:
>>> Export a few functions so they can be used outside the phy subsystem:
>>>
>>> get_phy_c22_id is useful when probing MDIO devices which present a
>>> phy-like interface despite not using the Linux ethernet phy subsystem.
>>>
>>> mdio_device_bus_match is useful when creating MDIO devices manually
>>> (e.g. on non-devicetree platforms).
>>>
>>> At the moment the only (future) user of these functions selects PHYLIB,
>>> so we do not need fallbacks for when CONFIG_PHYLIB=n.
>> 
> The functions should only be exported once there is a user.
> Therefore I'd suggest to remove this patch from the series.

These functions are used in patches 5 (oops) and 7. I will split it up
and add it to those patches.

--Sean

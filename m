Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1784F288CAC
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 18:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678509; cv=none; b=DbSVydnDjpvUqSdqi+Yuk2xo9W0hWT8pPk1Az8RxxlvmG4ASNQXzQEXj13KkmRGQho3jsmemBWZ597fmMmdjS1LdHVvQ1KNPP0+yZlNDxH59YQgEaerXKAW3MuL3549l+G5XfGDvNrLOhF2+iR5TCWYoxRT/jdmX3flE1vtVJk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678509; c=relaxed/simple;
	bh=ih6tFbOxT02hIqGJK0JnXm24gYaJwIXg+ytcOK+mpCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9+m2PkmUnVt/NXjiWiZul0lk9Pm1CgJ4ADbmlZx/k9tTwEccnZTQZbfIiSNscGE2pvsJTUVxEIyMaN1r+ZvdMD6UD1d2wzjmnUEQGEcix/nMe8ORIh7dhzwfRBnjg/4P0L+jHt9HB2Tsidz2FiT9hTakzTRjPPhD9nxYQD/Ths=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Udtb9zjH; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Udtb9zjH"
Message-ID: <de428c7e-2048-4498-8c2e-ed8c3b80f3b1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747678502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xpi4y7Q4tMHg57GuNPCu4CfHKgVeZSe89M6mbIQlzF4=;
	b=Udtb9zjHMckm6Pb3RKTAKOBCjKiHTu5AYImQhYMvi1+VXFdORKJf+7UL/y0PdgkrKuSel3
	8H71JElJdmTyBMRTIxpP3Zm+7x5qCa+9tTY9yrhcuc8iAzEiY5FUaqBoY7haDdhr8Twm76
	g36+2e7fMgCsRDgOQngdqNg1XmhrUrI=
Date: Mon, 19 May 2025 14:14:58 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [net-next PATCH v4 06/11] net: phy: Export some functions
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, upstream@airoha.com,
 Kory Maincent <kory.maincent@bootlin.com>, Simon Horman <horms@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-kernel@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
References: <20250512161013.731955-1-sean.anderson@linux.dev>
 <20250512161013.731955-7-sean.anderson@linux.dev>
 <20250514195716.5ec9d927@kernel.org> <aCWh48ckDDCttbe-@shell.armlinux.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <aCWh48ckDDCttbe-@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/15/25 04:12, Russell King (Oracle) wrote:
> On Wed, May 14, 2025 at 07:57:16PM -0700, Jakub Kicinski wrote:
>> On Mon, 12 May 2025 12:10:08 -0400 Sean Anderson wrote:
>> > Export a few functions so they can be used outside the phy subsystem:
>> > 
>> > get_phy_c22_id is useful when probing MDIO devices which present a
>> > phy-like interface despite not using the Linux ethernet phy subsystem.
>> > 
>> > mdio_device_bus_match is useful when creating MDIO devices manually
>> > (e.g. on non-devicetree platforms).
>> > 
>> > At the moment the only (future) user of these functions selects PHYLIB,
>> > so we do not need fallbacks for when CONFIG_PHYLIB=n.
>> 
>> This one does not apply cleanly.
> 
> In any case, we *still* have two competing implementations for PCS
> support, and the authors have been asked to work together, but there's
> been no sign of that with both authors posting their patch sets within
> the last week.

I have commented on the other series with my feedback. You are welcome to
read it and decide if you agree or not.

> Plus, I had asked for the patches to be posted as RFC because I'm not
> going to have time to review them for a while (you may have noticed a
> lack of patches from myself - because I don't have time to post them
> as I'm working on stuff directed by my employer.)

I consider my series ready for mainline. I will not mark it RFC because
it's not an RFC.

> Sadly, being employed means there will be times that I don't have the
> bandwidth to look at mainline stuff.

Then perhaps some of the other netdev maintainers/reviewers could have
a look.

--Sean

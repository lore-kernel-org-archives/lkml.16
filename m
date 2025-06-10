Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B0717C21E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569673; cv=none; b=Mw9hW/gBYy4KDwQB/cYYCG8tHL+3eyPyKBwSE9QkaMQrbZZrDTt4QCWpKDOVPExMylqTj2aacjz/H87jhS+Y7HXLP7F3srrGWrrgPwBUZrYP17Eyhz9TarDb3geek33IlApV69uJLdZTeCAGqoSp2M2yssE1btHDauVPEuQw1vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569673; c=relaxed/simple;
	bh=G+itHhShYmagmas0NbfK9nwx+40GG+jMM1BJtqr4puk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LbbYnsqdU1C/D/lA/kyKnzIw6GiSabRT8NBs8xWYpgqC0dHJCrepne2NuaXC3QY0yROKodzGQuaEB3OxmzlcTv93OT/0M0VfkWmdgB+PTZx2GJjltdWMKYlBnzB7u7uwPifHa4NFQYZYOQ4xE8Ty6YzKtY3ik4HDAri7bCzWoGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=V3rk7zfs; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="V3rk7zfs"
Message-ID: <1c4ce7df-dd5e-43a7-a496-bf5b89086e25@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749569668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ESTLDFwMbV/IeCjjdvemvD7MAUug9KqMA4+dsMhYRCk=;
	b=V3rk7zfs3jm/OZLdukxu4+ROJrX4Hfz7TxvlNR31kGC7LdhtQ+E4N/BfARrH9N/6FyHioz
	7gpJZWR8XITXvKe0mfMquqRoidRITEIkw1JXpRpQz0xa1OiMioJtraT+K7KdGOnIKWAfUp
	Z7dR1ePN779vw7rGnxoM7clbSloOHcM=
Date: Tue, 10 Jun 2025 11:32:35 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] net: fman_memac: Don't use of_property_read_bool on
 non-boolean property managed
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Madalin Bucur <madalin.bucur@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250610114057.414791-1-alexander.stein@ew.tq-group.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250610114057.414791-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 6/10/25 07:40, Alexander Stein wrote:
> 'managed' is a non-boolean property specified in ethernet-controller.yaml.
> Since commit c141ecc3cecd7 ("of: Warn when of_property_read_bool() is
> used on non-boolean properties") this raises a warning. Use the
> replacement of_property_present() instead.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/net/ethernet/freescale/fman/fman_memac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/freescale/fman/fman_memac.c b/drivers/net/ethernet/freescale/fman/fman_memac.c
> index 3925441143fac..0291093f2e4e4 100644
> --- a/drivers/net/ethernet/freescale/fman/fman_memac.c
> +++ b/drivers/net/ethernet/freescale/fman/fman_memac.c
> @@ -1225,7 +1225,7 @@ int memac_initialization(struct mac_device *mac_dev,
>  	 * be careful and not enable this if we are using MII or RGMII, since
>  	 * those configurations modes don't use in-band autonegotiation.
>  	 */
> -	if (!of_property_read_bool(mac_node, "managed") &&
> +	if (!of_property_present(mac_node, "managed") &&
>  	    mac_dev->phy_if != PHY_INTERFACE_MODE_MII &&
>  	    !phy_interface_mode_is_rgmii(mac_dev->phy_if))
>  		mac_dev->phylink_config.default_an_inband = true;

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

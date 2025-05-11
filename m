Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189FB1F92E;
	Sun, 11 May 2025 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746982328; cv=none; b=fpI1TtRCXD9LdcnsCG6zBSHsLSKyv6fCq717gZMstqNwxxAGz9ZIwAJx6dKtCd2/dEs3ULQYAsz2GEEGS4xzfYcWGvD4ms0MCgVsKawsay8F6jWpbsIME8Sj3OUQb5MMyjRpoF1daFOCiJzZm/S/OhzychoMENmR4LoAa1VazVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746982328; c=relaxed/simple;
	bh=AeYsNlju2dS9mSHO31dGS12MxZsCibGlXTpgO/huci4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hhj09yRL3tkU/szJChb7yI1bsIM5vFg3QJZCPCqphpCpmaed+ILOv0MbA9P52cCeKvPfaBvrtl/eT+pSgU6b/5/MOuz/HiBgD9Zkm7TjsO9gNtIUBZqiGH2FTpu2cRv88UKrhkJQn7FP62KFJPXys75taM2gPS35Uvu5x4ZgOPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=aav6fF3m; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="aav6fF3m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uIdd63kZxrN3cgT5V3zzHhQ1JkLvvvaowT101E9UEK4=; b=aav6fF3mdlFyfolrWtcbTUMqTC
	Ti7FmImHV2gMwB9FHSaLW1L1Aif/yap+K8HIudVPwp+LZK8BbzI5Lw9mV1dbkj9jDvSQGilT1IQTm
	IELtmxpDEz/QTBOi4NIZejZB0FipaM5vVzpDXAL+LGYBX5KwAXU8q1ugX8vxJIIr+0w4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uE9u9-00CGNh-46; Sun, 11 May 2025 18:51:57 +0200
Date: Sun, 11 May 2025 18:51:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [net PATCH] net: phy: aquantia: fix wrong GENMASK define for
 LED_PROV_ACT_STRETCH
Message-ID: <0600fdcb-de31-4b46-bb5b-731b216d7f71@lunn.ch>
References: <20250511090619.3453606-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511090619.3453606-1-ansuelsmth@gmail.com>

On Sun, May 11, 2025 at 11:06:17AM +0200, Christian Marangi wrote:
> In defining VEND1_GLOBAL_LED_PROV_ACT_STRETCH there was a typo where the
> GENMASK definition was swapped.
> 
> Fix it to prevent any kind of misconfiguration if ever this define will
> be used in the future.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 61578f679378 ("net: phy: aquantia: add support for PHY LEDs")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

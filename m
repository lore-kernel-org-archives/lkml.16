Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DAC19F40B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490129; cv=none; b=W86ckDDyAhPblFr18sTEEukcXKVfsB344vmzyetvFya6wbUopbOhXBx28LLhoGkVW07Vu99cAb3SpY/z3EuyRQd8cQjQEAgo4dUZErFmBwIyWpxqKg/PDmU525yfQqFx7ofisg35NdbnNF+X5bWEV6GJzkqKGba1zd3NiUsuGNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490129; c=relaxed/simple;
	bh=DjWV+iyUfNjwjx7gVg2kl3E5NyWIUSHxz7PKe9j1ogA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onXVshB/Mvd2P2SKP1rq880g0px3HcM06jw4Tetb0x6L1pO9g742L7J3l5rKeDymtHx3ODHUjX17eMh+L77VXeaHAo1s7yOYXhpGuaf0olItuEGlvGyQTtFwPofXOEVgN/y+KLWbrHYbwlXvquoxmCi6j5x3Ytpm02p1ng2wyFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=WSWeZy8t; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="WSWeZy8t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=G/Gm0iaohoSUpFALDcDYkX48JKnw9ZtngTxphpD+oZ4=; b=WSWeZy8tdQ5+hNrDfHXaJP/mBc
	MMNrqvUk7fzxVuQtqKUWvqHicHn9KQ4vbgZS3df6ZfBVfzzm5XVJibPsvsiXLlDcB68ctT4ylEzY5
	FsUYrZOiXKTb0KnKWFySK7uw52huudu6QuNaWdV/VX2cIZQaLuI3wPuJWwq3j+XqFuAc1qfoMycmf
	YCJE3ZXIV6dZGga8UZJVCWgTQ8nsUFOO+bbW5B2EA3IBvwXhCrcWi/dtASngsFAe1Q5jG51+K55L8
	YdKbpkOc5EKVVafkUewbejioRaB+S4lmZ2vEkBYzzsZH8KDM3OVujyjlPH6l/kIVexAS/wzyYi7sM
	+092G0Wg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42566)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u7tiP-0007Bh-0p;
	Thu, 24 Apr 2025 11:21:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u7tiM-0000zm-2N;
	Thu, 24 Apr 2025 11:21:54 +0100
Date: Thu, 24 Apr 2025 11:21:54 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: xieyuanbin1 <xieyuanbin1@huawei.com>
Cc: sfr@canb.auug.org.au, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, will@kernel.org,
	nixiaoming@huawei.com, liaohua4@huawei.com, wangbing6@huawei.com,
	lincheng8@huawei.com, wangfangpeng1@huawei.com
Subject: Re: [PATCH] ARM: spectre-v2: fix unstable cpu get
Message-ID: <aAoQwsldwmxAKA0A@shell.armlinux.org.uk>
References: <20250424100437.27477-1-xieyuanbin1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424100437.27477-1-xieyuanbin1@huawei.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Apr 24, 2025 at 06:04:37PM +0800, xieyuanbin1 wrote:
> From: Xie Yuanbin <xieyuanbin1@huawei.com>
> 
> When a user program accesses the kernel address,

Please see
https://lore.kernel.org/all/795c9463-452e-bf64-1cc0-c318ccecb1da@I-love.SAKURA.ne.jp/T/

As I see it, this can't be fixed - certainly not in this way due to the
reasons I set out in the above thread.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

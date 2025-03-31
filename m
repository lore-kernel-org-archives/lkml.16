Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DF322154D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743434303; cv=none; b=Tl4FLsTPqt1R3O/NFm0zPaKc7zdcken1FBuyPoFyX6WtQRfviTMWTalWxrjJkf4AdfXGUJX5AwXQRjMbmP9SmuT1jg6vG1NZkjNw8t196swCAQPfMY3+x1/pYR+oLnpMKV5NTqKKqdnLYZ/cmkulusTNKEM//A83JKGgs/ErROc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743434303; c=relaxed/simple;
	bh=lostnhECuFpgx/V9Dx4e+cnyz6zzHXEbycPo2Khhj0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJX6Rb1UXsVA8AUoeikootgr8ud/crBSw7VYuIyHfXzzBN8RPWeQVc81I7p2q9W0saSldPMyOzho9pbCgpVqtR6K+D2lHp/dBS+AR5p3mG5kOr0AO166qIs3VVOYCu1mfVg8WnqkhTYf4o+90pbQmAM1IL0d9GsvK7wPAmsLoG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=jq+J1FJh; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="jq+J1FJh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1n52K2Ecs0rvNvb7Wx6zfsNYz+Pw0RbIiWPNEiPmYtM=; b=jq+J1FJhdA0ywdc2jT+QIw3sTD
	1xJw1BtSQHm8s912c+lbyA7F7E0z487dN8fquAfywdvSNtsNUDCe1XHRRPtQfbpFZwgAqTiLeNLI4
	4+F0kUqJC3U+jg0yTnfZQTt3SGrZSenwWgy8/TNpHgza0IzccfDjt2ud55FjVDIPAN2PpuHeEIagg
	WfxyrjjHpuek8ZAb9zMrwez3yjwu7JyCnAyw8vVdSvgwe1xQgeMA0/fXQSViZegTg6oY5ptz6phAI
	EKGjKJ+Pxr5z/GLqXk+ZSom4o3R6eD4KS9GYtEB3hcmZhb3/H44uZZ2Qbn9vsijnkSu9VqoXOvmDG
	/sFSjbUA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35078)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tzGtu-0004Hw-2s;
	Mon, 31 Mar 2025 16:18:10 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tzGtp-0001mP-0c;
	Mon, 31 Mar 2025 16:18:05 +0100
Date: Mon, 31 Mar 2025 16:18:05 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxim Uvarov <muvarov@gmail.com>
Cc: =?utf-8?B?6LCi6Ie06YKmIChYSUUgWmhpYmFuZyk=?= <Yeking@red54.com>,
	ardb@kernel.org, bjorn.andersson@sonyericsson.com,
	dave@vasilevsky.ca, ebiggers@google.com, linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	liuyuntao12@huawei.com, lumag@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, nico@fluxnic.net, oskar.andero@sonyericsson.com,
	ruanjinjie@huawei.com, victor.boivie@sonyericsson.com,
	Rob Herring <robh@kernel.org>
Subject: Re: Re: [PATCH] ARM: Fix support for CMDLINE_EXTEND
Message-ID: <Z-qyLY-Moj5Uo8XH@shell.armlinux.org.uk>
References: <Z-aWPqAUOIDEzzpZ@shell.armlinux.org.uk>
 <tencent_F967B6C3FF5405F2D17EF660590BFD213C0A@qq.com>
 <Z-qQuyG7rDeSF_oX@shell.armlinux.org.uk>
 <Z-qZ_4YmTJdFWAHF@shell.armlinux.org.uk>
 <CAJGZr0+zcy+28bJydUo88zpNBN-M2-qcaahr8Pxg=yfdT6RAPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJGZr0+zcy+28bJydUo88zpNBN-M2-qcaahr8Pxg=yfdT6RAPg@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Mar 31, 2025 at 06:14:27PM +0300, Maxim Uvarov wrote:
> It will be good  to have some constance here with other arches:
> ./arch/arm/kernel/atags_parse.c:#if defined(CONFIG_CMDLINE_EXTEND)
> ./arch/sh/kernel/setup.c:#ifdef CONFIG_CMDLINE_EXTEND
> ./arch/powerpc/kernel/prom_init.c:    if
> (IS_ENABLED(CONFIG_CMDLINE_EXTEND) || l <= 0 || p[0] == '\0')
> ./arch/loongarch/kernel/setup.c:     * CONFIG_CMDLINE_EXTEND is enabled.
> ./arch/loongarch/kernel/setup.c:    if
> (IS_ENABLED(CONFIG_CMDLINE_EXTEND) && CONFIG_CMDLINE[0]) {
> ./arch/riscv/kernel/pi/cmdline_early.c:    if
> (IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||
> 
> Or drop CONFIG_CMDLINE_EXTEND completely or make arm64 work as others.

I'm not changing something that has had 14 years of being the way it's
been - people will have come to rely upon it. Changing it now is way
too late.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000834C6D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743165030; cv=none; b=phqZ3mMg5pdNWIkQ5S/weImJT/P9p2n84YyCrBY4GQM/a/CCAPr5P6wDcmqyVMusvVc8pGwt1jkO9XbyboyQ05oqd6oh2Bz+otWzBsOsLN0KsgA2euZKmaC/JfeAU3J/yr/uV2vBIwpfCTi7DIe8vdrKC+5l/cHYNMblUwhVALo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743165030; c=relaxed/simple;
	bh=nw034KAl4K5R0p3fjOL7F1tDs2mvWBYsT2yzg0RvKTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlXiy/bByTNc4Npx0ZSykAs3zGnmsroZLbun/kiJDPRZQXGal+bqpbSUoBRPmYb9jNqkHENe3gRGVsVZlpZD8KVS7XcIFf5stTNK6QWHTo0zGOGSBNFh30U0ikDD993ICYsAKyPpZ8oOZzGe3yJWcI6dXR11s8MYzWf9u121+tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=IKbiqcma; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="IKbiqcma"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8GY9oAspc/UtzxBw+Itn8O6EjWFnF2C8yVESOjSlnrI=; b=IKbiqcmatIo0Xkt4D1J2y/GG+t
	ZbuNUAw5UdJFOliKlRY/+WuQbfhczTWO4mSRBVwMYz60TS7L2hS+imkBaQ2NDPLyt3Szyt0MnkBzc
	uW0hOCRc3c0B/DdgEAXxuoiJUbgFeMNtMspS1EYeOY73CiY5ubhx07G/L3DirVQvy70hDUgIZdNfy
	Ir54uMqedYZwpd1qlYPAZcjcDamI07VZAcc/RfZ4RfEuzGv7/QHsNgVy3KKLINbx6SVxXmWU3+wU9
	kmalwafojs6If181kkuxPEe8DczboPeh+leY/fepp7AdB62+Yt8BNhMkOWqk/U65yate1OaInct0A
	5E0yfIEg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49770)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ty8qR-0008OX-0q;
	Fri, 28 Mar 2025 12:29:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ty8qM-0007BV-0X;
	Fri, 28 Mar 2025 12:29:50 +0000
Date: Fri, 28 Mar 2025 12:29:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yeking@red54.com
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Yuntao Liu <liuyuntao12@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Dave Vasilevsky <dave@vasilevsky.ca>,
	Nathan Chancellor <nathan@kernel.org>,
	Victor Boivie <victor.boivie@sonyericsson.com>,
	Nicolas Pitre <nico@fluxnic.net>,
	Oskar Andero <oskar.andero@sonyericsson.com>,
	Bjorn Andersson <bjorn.andersson@sonyericsson.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: Fix support for CMDLINE_EXTEND
Message-ID: <Z-aWPqAUOIDEzzpZ@shell.armlinux.org.uk>
References: <tencent_3E8155B4A33D48D6637F16CFE5ED293F0E08@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_3E8155B4A33D48D6637F16CFE5ED293F0E08@qq.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Mar 28, 2025 at 10:20:17AM +0000, Yeking@Red54.com wrote:
> From: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
> 
> It should be the default command line appended to the bootloader command
> line, not the bootloader command line appended to the default command
> line.

Later arguments override earlier arguments. Any compiled-in command line
needs to be overridable by user supplied input from the boot loader. The
current behaviour is correct.

Sorry, but no.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

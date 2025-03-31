Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D8118A93C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743425742; cv=none; b=jnKe7EsFxljkpkoglfoqjFrEBQG28VYndobgPy52qmxEQzvEHeMPrtU3fZjDX5zxIYzO8ilzfY5wkQYPd6MIAvPjVk7fIe65HTAOwlpI0wUqtXghYlcX3LKORthiFMkzwSA9OKMZuSEsbAgPHewSuV+twynpOeMLj0twXnRB4dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743425742; c=relaxed/simple;
	bh=Id97AnoxrUwH4BcAbsdLWu1m33yWfZwea34RKwUDQaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuur/amZiA2Wz4AgD/GK94EGZI2y3gmL+IefqJk0elTs5cmiEbbS2w5VnMdq4Ky0vJt3Lir6ScHE5sweByoQN02Zx7luJAFcAsrwwinzk+tAOPKQe5apd/6LGagBzVTi4k61mgMR1fochcoWXOPV+z1/IH5frZNE9J2N97fMj9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=jGw3wIGT; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="jGw3wIGT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dp6/ZhxCBVGkVXKOH8cc/tdyF4DuQ/89efi02sHN7io=; b=jGw3wIGTchIihlce0544VoMdve
	2QcylGK9Zh7Q/cMQeeS+r+XdkJZWbF2aRN3LqePd/gnDa/LSuuEub6Vs5mOtam8cSYAq+gI/qdPJH
	ijc1moomOwdi2D8Cu+uZONlzlDGsSVLXfK5bOMTd/dpiNdMz/wtmYbn6kbDMtcwJyIuLZiM1Eq0as
	Dxlmn47QbeYH9Fqu+TsMS2IycK3P5dptJbx2zOEI2Wk86vdvgxPpndB1NdOB+hoaeXuntbi6DcXLA
	DptihaCqogaRsQAAWvSQgTLhBLrdT/r7UnwrJU7RGZFfQXDSzpUK/PavpWrAS6/uGGgv4V4y0fTe3
	wEpT3O3w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40534)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tzEfp-00040G-29;
	Mon, 31 Mar 2025 13:55:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tzEfj-0001gX-2Y;
	Mon, 31 Mar 2025 13:55:23 +0100
Date: Mon, 31 Mar 2025 13:55:23 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?6LCi6Ie06YKmIChYSUUgWmhpYmFuZyk=?= <Yeking@red54.com>
Cc: ardb@kernel.org, bjorn.andersson@sonyericsson.com, dave@vasilevsky.ca,
	ebiggers@google.com, linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	liuyuntao12@huawei.com, lumag@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, nico@fluxnic.net, oskar.andero@sonyericsson.com,
	ruanjinjie@huawei.com, victor.boivie@sonyericsson.com
Subject: Re: Re: [PATCH] ARM: Fix support for CMDLINE_EXTEND
Message-ID: <Z-qQuyG7rDeSF_oX@shell.armlinux.org.uk>
References: <Z-aWPqAUOIDEzzpZ@shell.armlinux.org.uk>
 <tencent_F967B6C3FF5405F2D17EF660590BFD213C0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_F967B6C3FF5405F2D17EF660590BFD213C0A@qq.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Mar 31, 2025 at 08:29:21AM +0000, 谢致邦 (XIE Zhibang) wrote:
> > Later arguments override earlier arguments. Any compiled-in command line
> > needs to be overridable by user supplied input from the boot loader. The
> > current behaviour is correct.
> 
> CMDLINE_EXTEND is for the built-in command line to "Extend bootloader kernel
> arguments", not for the bootloader command line to extend/override built-in
> command line.
> 
> Don't forget that the default empty CMDLINE already gives the bootloader the
> ability to override everything. Not to mention that even if CMDLINE is not
> empty, the default CMDLINE_FROM_BOOTLOADER continues to give the bootloader the
> ability to override all.

The help text:

+         The command-line arguments provided by the boot loader will be
+         appended to the default kernel command string.

so, you end up with default kernel command string _followed by_ the
boot loader arguments. This allows the boot loader arguments to
override anything that is in the default kernel command string.
That's why it is a _default_ - it can be overrided.

If the boot loader command string is extended by the default kernel
command string, then that doesn't happen.

CMDLINE_EXTEND is default _followed by_ boot loader.

You're wanting it to be the other way around. That's broken.

No.

Sorry.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

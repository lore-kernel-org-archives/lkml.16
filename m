Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1670257D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743165062; cv=none; b=QLZgJBft3EICpAE9XkkYGfvcZaCaukgvJdNnqoNGTTYDApHYuxjtJA3Fq9NSlwQuBSDLnKbx/yzowGICF0GgW7cVLKTPn9tV4335leuizK1Vnskz2RvP4iYy6c/doLcqVb2ObFIsoa4vX+LN8hJ9d7aaP7bM/WHTAxtP22kAnow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743165062; c=relaxed/simple;
	bh=RYyN6/vG+NDqV8rTj94vAgWwlKgmNcsV6x6pz7RFoXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0kKVMOV4dqZ67+jQ2OnGoxwWZVxZUFm3pki63HOblgzlNwUHOL5FJI8PsLniwH4MjDFIERLuak9uKCTy1ijE/bQdC2Qog9y2ZCA7QBuIaTaTTuW6Rgi3vUboh24YuORnlu2lAiNPdtkWbBUVD1aDtwakLw0KxFKL/3EcPdPzcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=uHnOCwTn; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="uHnOCwTn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mYH+ov8oElEFOmVTlEpbYDnUOqq2mfP+IK48OcxwXYM=; b=uHnOCwTnS+OKQVB2CBsia4KuFh
	nl1xy9lyi3uIXfUguYTmVo7aswc1erVQo0sgdRVvXAWq1X99uLyR3z5un82NdIsWEmtWJaIxvFIjf
	Im0VAMkPP/JZQQGtH42yLxaa7IIGr+RCEv9uHGUoUOUGp89XDuhPkZgMoCR1iF/4fBw7RlcvUSlPk
	f99AL2IhHDXjlc8osp1inmHgfZuo8iBNTd7/I4SZ2iJ28vqyR5wx6QXLaxUl/ZYwoS7+FCSlVeBqY
	3P55oWJ5tn1/HQdZuHw/E+14k5Vn+k9pU+pw5ot/QP+c3zPwhUrI2b1Wk5q2yDV9ZF0J/HaCkHDZM
	XrY+8BwQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56104)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ty8rI-0008Oo-1e;
	Fri, 28 Mar 2025 12:30:48 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ty8rG-0007Bk-1F;
	Fri, 28 Mar 2025 12:30:46 +0000
Date: Fri, 28 Mar 2025 12:30:46 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yeking@red54.com
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM64: Add back and fix support for CMDLINE_EXTEND
Message-ID: <Z-aWdil-GWFC3c-y@shell.armlinux.org.uk>
References: <tencent_1873443BEECF45E0336D4C4F8C35C19FEB06@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_1873443BEECF45E0336D4C4F8C35C19FEB06@qq.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Mar 28, 2025 at 10:22:34AM +0000, Yeking@Red54.com wrote:
> From: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
> 
> After commit e6384c398459 ("efi/libstub: Parse builtin command line
> after bootloader provided one"), the behavior of EFI has been consistent
> with FDT.
> 
> So add back and fix support for CMDLINE_EXTEND.
> 
> Fixes: cae118b6acc3 ("arm64: Drop support for CMDLINE_EXTEND")
> Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>

This breaks the ability for the user (via the boot loader) to override
built-in arguments.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

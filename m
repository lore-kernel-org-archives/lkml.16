Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18DA189916
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502651; cv=none; b=mkOxTTdgwgGG+hgNzXbQcp3Z/rT5sKNz+bQVm/oo4U0ZdnlkqZ84TbCZdbSDQqdIa/zi79rNJfOiPRgI08VmBBIZV0/nd4joErS+wdoR7eQO1360vkW3MO3iw00hND0kcWAL7xhNvOHL/URvYnweRaB5LOtcL7cJytExXcl9Xx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502651; c=relaxed/simple;
	bh=oT/q9FR/lbSUo068CiHqxxsbhR2Ul/sVrprjcmenHwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGErqju/oNbw2kEAXpFoPW5Wz0L8+9GaFACJ70RV+RkBpHNKSbUWD8iCWnSgb5HSEmf7u2KtAGl9MAjs6iKc3mdgXDqdLdcCkwHSxONoNdcEI9g8wkclsa35HnBB81dbAwAt56FAZ8oXeitugo0z0NR2nGUnwo7H2ENK+2zGthQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=fdF5Wwc1; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="fdF5Wwc1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yYE59RG6h1dz+xHWzTPndkPIHqW40lrFFC645fhilsM=; b=fdF5Wwc19OSz6aXfb2+T14UAta
	C4QJmYcmuk++XrD7rFghRjMniqwZPyktTiqcEdz3qQJIspqTm6txOFqO1X+DxcGqMPWBU9dVJkmkY
	S7EGwgKk49PxlgvBd0kbrSuMVGY4b0expvKT7m7RBOOc7tG4K7QTYSVGN6iuKHDt2c8W0pIzOc2J7
	DYBYqbTD3HkB7gnsEweCkntOaS2q0jzjj1dBs/VpXcFgKwU0jKp3FlDJfdn3lHmohWbLc9CZ03sSL
	OhwP1WJMnrSNp4O82vUeEJqYy+HsIA0NPlSz77V5sTtvv6nzqO1CxzX0NhDTBEQdCyUXlVqzPv+8I
	zlzD2hUw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33758)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u7wyH-0007SR-16;
	Thu, 24 Apr 2025 14:50:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u7wyF-00019J-0R;
	Thu, 24 Apr 2025 14:50:31 +0100
Date: Thu, 24 Apr 2025 14:50:30 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: xieyuanbin1 <xieyuanbin1@huawei.com>
Cc: liaohua4@huawei.com, lincheng8@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	nixiaoming@huawei.com, sfr@canb.auug.org.au, wangbing6@huawei.com,
	wangfangpeng1@huawei.com, will@kernel.org
Subject: Re: [PATCH] ARM: spectre-v2: fix unstable cpu get
Message-ID: <aApBpnDcq2KNkfAs@shell.armlinux.org.uk>
References: <aAoQwsldwmxAKA0A@shell.armlinux.org.uk>
 <20250424133133.40122-1-xieyuanbin1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424133133.40122-1-xieyuanbin1@huawei.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Apr 24, 2025 at 09:31:33PM +0800, xieyuanbin1 wrote:
> I've actually thought about a similar problem. In areas other than put_cpu/get_cpu, tasks may be scheduled to other CPUs, this cpu actually does not execute the spectre code. 

My point is that if harden_branch_predictor() has been called from a
context where we are preemptible, then we _could_ end up running on a
different CPU to the one that we need to take action.

Consider your test program running on CPU 1 which requires fixup. It
takes a fault, and before we enter harden_branch_predictor(), we end
up being migrated to CPU 0, but doesn't require a switch of the MM.
Let's say we then disable preemption and then call
harden_branch_predictor(), and then restore the preemption state.
The thread then gets migrated back to CPU 1. Again, no switch of
the MM.

At this point, the mitigation has been completely bypassed.

IMHO, better to be noisy about this event (and it is only a kernel
warning) than to be silent about it and let userspace get away with
bypassing the mitigation.

I don't care if this disrupts test tooling. The trade off between
test tooling having a problem and a silent data leak through this
channel... the answer is pretty obvious that the test tooling
failing is less important than having a silent data leak.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

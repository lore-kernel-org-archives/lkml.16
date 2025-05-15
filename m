Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABF528030E;
	Thu, 15 May 2025 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747295659; cv=none; b=gT2pZ2erYi38MUY/oX3qlXBQO39ij8Q/oK4snGA86myU1a+AwoyAhLDdRD/D3OK5CNFCBSbvXoLP+X3ywkg0h+6UbrxtEMiOD/3M81HLvPcMiBM5ZxEzKl9eueywT2F+Y+sZ4me5mpfBqByR/h/KygLdHOKZhtlwdM0vKrYbNKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747295659; c=relaxed/simple;
	bh=sxdO7aNfLSfO5lmZl2v3RLakD6ynfpy2GeysNMPD2ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQ+mgKGDXxXG5zG869Drwyn9B/L+zOu3KSlOry1+KOTiyu/Cf1oMYvxquzT/4q4Ea/9goLfpNXClqWxBr4xo1KvcoTV/s1bjlX1fBo/12vq56jP/jMlFUGnl2+nLwUBoaknIlb/idzSj9WNFEeK+B0Hcid3i0G2FO0SoR7ov71Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CmEh/BHM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CmEh/BHM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870C6C4CEE9;
	Thu, 15 May 2025 07:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747295658;
	bh=sxdO7aNfLSfO5lmZl2v3RLakD6ynfpy2GeysNMPD2ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmEh/BHMAicg6wnOnpRVmP+34GYGs6UYV01rIJggKEaIsQ63IWGRh03e6I5MZA+7d
	 b6Hhcq4t87IyL4vnn1Iunszh98uV+gv7hzPZdO3rJYsYSD0nmhTK+rGh6/BAUewd4a
	 hPUu6y97GohjyRZKhtXidic04erQglwvHK+yjfgw=
Date: Thu, 15 May 2025 09:52:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
	shimoda <yoshihiro.shimoda.uh@renesas.com>,
	goda <yusuke.goda.sx@renesas.com>,
	Kurokawa <harunobu.kurokawa.dn@renesas.com>,
	Kihara <takeshi.kihara.df@renesas.com>,
	kazuya.mizuguchi.ks@renesas.com, takamitsu.honda.pv@renesas.com
Subject: Re: Question about UIO vs DT
Message-ID: <2025051549-flannels-lively-a46d@gregkh>
References: <87o6vutrbw.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6vutrbw.wl-kuninori.morimoto.gx@renesas.com>

On Thu, May 15, 2025 at 04:45:23AM +0000, Kuninori Morimoto wrote:
> 
> Hi Greg / UIO / DT
> 
> I would like to ask about UIO vs DT.
> 
> If my understanding was correct, current UIO can use 1 IRQ / 1 reg per 1 UIO,
> but some device needs multi-IRQ/reg. In such case, we need to use
> multi-UIO. But it is not good much to DT rule. For example in case of
> the device which needs "2 regs 3 irqs". it will be
> 
> (A)	[1 reg, 1 IRQ] UIO
> (B)	[1 reg, 1 IRQ] UIO
> (C)	[0 reg, 1 IRQ] UIO
> 
> and (C) will be DT error. Is this known issue ? Do we have better solution ?

Yes, write a real driver for the device as obviously it is a complex one
and UIO shouldn't be used for it :)

What type of device is this that requires this type of hardware control
and why do you feel that UIO is the proper solution?

thanks,

greg k-h

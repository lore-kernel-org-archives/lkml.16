Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC2B26462E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829658; cv=none; b=JRSiKkbn0iilh7PSWrleF9wNV+fA42prbXGgTpO4Xa/arMPqzvY0CjlguT6hYn6RW0wFNUSD+SNFeFZm5sbLxXwyeSTGdRqLn8EdthrL1+xlmrHADdvxJCjdAAWCCW9y3l2PUoNjHR3A/HM9mEfUq3TGn21U9psYhkHwOgKlJY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829658; c=relaxed/simple;
	bh=UkleGATtnom3KthRuq93MKLN5/2Ny+81kkpA6inAFfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiKBdgGVH2iDq35WuG5U6QqKJgHhix74dLNne+8RIj6zXmcRAuBlj8cHF9qc4s/TPoPaHCFVo4YwdpfmyfMew7Zphuy9q0HsNPkwA1Swp5Fahpim7s4Dk6iY9tJxLjc29xmQYRihKqSu0qNy4odOUsc7bW1Ux7VmntbVG8j6YKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QzkiHcQ8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QzkiHcQ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48DDDC4CEE4;
	Wed, 21 May 2025 12:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747829657;
	bh=UkleGATtnom3KthRuq93MKLN5/2Ny+81kkpA6inAFfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QzkiHcQ8VD9Xim6V0jqypYBc+hhOBK2rEgXegBpiUZEwel0E2cjRaAInLdXm5l9rR
	 UgS871tDv3k0gw3AJjwuYS1LNGCPvNXATY1049qhdeMwD7VnfoSL5s6msr6loZPylb
	 Bl3jf23Cx/AjCCVululeGktVnlLz1vKLa6VZW/nI=
Date: Wed, 21 May 2025 14:14:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>
Subject: Re: [GIT PULL] mux drivers improvements for v6.16
Message-ID: <2025052102-estimate-algebra-c15c@gregkh>
References: <20250513105058.27028-2-krzysztof.kozlowski@linaro.org>
 <f6f2fa8f-3502-4739-a977-14dd0a63a25a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6f2fa8f-3502-4739-a977-14dd0a63a25a@kernel.org>

On Thu, May 15, 2025 at 03:34:51PM +0200, Krzysztof Kozlowski wrote:
> On 13/05/2025 12:50, Krzysztof Kozlowski wrote:
> > Hi Greg,
> > 
> 
> 
> ...
> 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/mux-drv-6.16
> > 
> > for you to fetch changes up to 9761037d28327e0d4ee9586a8210ef6462c2c757:
> > 
> >   mux: adgs1408: fix Wvoid-pointer-to-enum-cast warning (2025-05-08 17:12:08 +0200)
> > 
> > ----------------------------------------------------------------
> > Mux drivers for v6.16
> > 
> > Few cleanups and fixes for the mux drivers:
> > 1. Simplify with spi_get_device_match_data().
> > 2. Fix -Wunused-const-variable and -Wvoid-pointer-to-enum-cast warnings.
> > 3. GPIO mux: add optional regulator for Lenovo T14s laptop headset.
> > 4. MMIO mux: avoid using syscon's device_node_to_regmap(), due to
> >    changes in the syscon code.
> > 
> > ----------------------------------------------------------------
> > Andrew Davis (1):
> >       mux: mmio: Do not use syscon helper to build regmap
> I received LKP build error report for some specific configuration:
> https://lore.kernel.org/oe-kbuild-all/202505150312.dYbBqUhG-lkp@intel.com/
> 
> I will send a follow up fix for that and then later updated pull
> request, if you do not pull it till that time.

I've taken this now, do you have a fix somewhere?

thanks,

greg k-h

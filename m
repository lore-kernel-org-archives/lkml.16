Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3AE1F869E;
	Wed, 21 May 2025 11:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747826167; cv=none; b=LXTV6yzX2h9XGNPChnwCewbc9DYIknugTliZwUPGmOaqnXmsToUUGXhZB10Sw5DIZ6Nubv1LNMnfeIeuwW/yUitWBmHktiVRP89XnNUySOLD1UdLNRiZM8AirTygh53wOpLCfN6b30+Teh8svoMUcjYkaWi2coeZuQwOCQcpDu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747826167; c=relaxed/simple;
	bh=xigxm7bMH8XuqVtrqqSvZoP582kjwo+0xa4s5shncFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4rHSdGZ5dxi8ohLMpJOoICSz/ETEvOGeyhtkCBAvheSRMYY/qe4oqheboCC+CaZVgbKUCCC0z4OBCybRrz5Q/GGBBE9PW49IR9ZbSYeASWRSZOTqoJWoIS6GUfz6BAUbjCCA2Dl2Bgz3v8uy2yxIPUcVf4CTu+OGyqS070s+FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eipX4bo2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eipX4bo2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E29BC4CEE4;
	Wed, 21 May 2025 11:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747826165;
	bh=xigxm7bMH8XuqVtrqqSvZoP582kjwo+0xa4s5shncFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eipX4bo2MHuyV1Wf0H+QSKRrAwr8Nq8eRyGjkKGWIHPm8OoWhfStSF/y7smTLBajG
	 Q0vFbFaJgnt+nPitD+oZUViFDoV+iJRJHrzPGN9fD4j379Lztwyqp19Rq+TWXXUUM9
	 2+QY9pvVacvxu85ggZwIsp92bMG5qkFl5keAv/cA=
Date: Wed, 21 May 2025 13:16:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jay Chen <shawn2000100@gmail.com>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, jay.chen@siemens.com
Subject: Re: [PATCH v4] usb: xhci: Set avg_trb_len = 8 for EP0 during Address
 Device Command
Message-ID: <2025052143-uptake-grudge-6e5f@gregkh>
References: <20250521104838.15215-1-shawn2000100@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521104838.15215-1-shawn2000100@gmail.com>

On Wed, May 21, 2025 at 06:48:34PM +0800, Jay Chen wrote:
> There is a subtle contradiction between sections of the xHCI 1.2 spec
> regarding the initialization of Input Endpoint Context fields. Section
> 4.8.2 ("Endpoint Context Initialization") states that all fields should
> be initialized to 0. However, Section 6.2.3 ("Endpoint Context", p.453)
> specifies that the Average TRB Length (avg_trb_len) field shall be
> greater than 0, and explicitly notes (p.454): "Software shall set
> Average TRB Length to '8' for control endpoints."
> 
> Strictly setting all fields to 0 during initialization conflicts with
> the specific recommendation for control endpoints. In practice, setting
> avg_trb_len = 0 is not meaningful for the hardware/firmware, as the
> value is used for bandwidth calculation.
> 
> Motivation: Our company is developing a custom Virtual xHC hardware
> platform that strictly follows the xHCI spec and its recommendations.
> During validation, we observed that enumeration fails and a parameter
> error (TRB Completion Code = 5) is reported if avg_trb_len for EP0 is
> not set to 8 as recommended by Section 6.2.3. This demonstrates the
> importance of assigning a meaningful, non-zero value to avg_trb_len,
> even in virtualized or emulated environments.
> 
> This patch explicitly sets avg_trb_len to 8 for EP0 in
> xhci_setup_addressable_virt_dev(), as recommended in Section 6.2.3, to
> prevent potential issues with xHCI host controllers that enforce the
> spec strictly.
> 
> v4:
> - Clarify relevant spec sections and document their conflict.
> - Remove language about "ensuring compliance with the spec" per reviewer
>   suggestion.
> - Update assignment to use '=' instead of '|='.
> 
> v3:
> - Corrected author name in commit metadata and added changelog.
> 
> v2:
> - Fixed malformed patch formatting issue.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220033
> Signed-off-by: Jay Chen <shawn2000100@gmail.com>
> ---
>  drivers/usb/host/xhci-mem.c | 2 ++
>  1 file changed, 2 insertions(+)

The "changes" go below the --- line, as is documented in our
documentation.

thanks,

greg k-h

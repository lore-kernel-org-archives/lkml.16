Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC4129408;
	Thu,  3 Apr 2025 13:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688581; cv=none; b=Ak+cg2xJow+uQTs7JIXFAEX5y5wIlW9Zpm1WosVnrcLH4kU4PaCGRoKKM1W+JAOeBt4x9aRGCiFnL/tswY/bP2yka83p0UwbFYu7GLb3RFn1B/Q01+aPgaTPA6nE+ZcV3ugl/ynZ65ugsKDcwtU545E3lFEiT7ZVzsuQjy5VXUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688581; c=relaxed/simple;
	bh=62E5HgCKjcIT+fx8INJNpFFzLIytqfqtqbYBcHFud4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R//d17Us+un+Hu6XDM0NnH8IeOZd3t+cLyrinE0KUyujbXZScXFRUP+ENsOUkenQiX0hfPFsLCa5reBpzyYfSp54+ZsiNX6TjeIb/AmfpdyZEjvq11ptzaWqq2Cab1HEOHQ7/iwnr2uPzXUHliEe5qMMcO9FGKnO6+7rhu/L5uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=joU801Or; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="joU801Or"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29477C4CEE3;
	Thu,  3 Apr 2025 13:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743688579;
	bh=62E5HgCKjcIT+fx8INJNpFFzLIytqfqtqbYBcHFud4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=joU801Oro2TYq10uNpSr6iVSiRaKGaI6juNlM9C3K0nB1H2lLgeAbuUNb+p5o6IQz
	 SdE1sh0NzUx1GM02Ojn/rv9JxOjvG0Jmg7PTTuoNRbS14FKh3FEqrJAVMKmt5xB4Ly
	 UNmc6fxXpNRjMJ38McM1otUP+Pby7Qu1oeu3MqrE=
Date: Thu, 3 Apr 2025 14:54:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2 1/3] staging: media: Remove duplicate NULL tests on a
 value in pci
Message-ID: <2025040320-fraction-bagel-ea64@gregkh>
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
 <26990d4a9d4419f9d4155a40595bc213acb671a0.1743685415.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26990d4a9d4419f9d4155a40595bc213acb671a0.1743685415.git.abrahamadekunle50@gmail.com>

On Thu, Apr 03, 2025 at 02:26:41PM +0100, Abraham Samuel Adekunle wrote:
> When a value has been tested for NULL in an expression, a
> second NULL test on the same value in another expression
> is unnecessary when the value has not been assigned NULL.
> 
> Remove unnecessary duplicate NULL tests on the same value that
> has previously been NULL tested.
> 
> Found by Coccinelle
> 
> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-

I can't take any drivers/staging/media/ changes for outreachy
applications, sorry.  That should have been in the instructions
somewhere.

thanks,

greg k-h

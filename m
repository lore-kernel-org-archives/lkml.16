Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA28221DA4;
	Mon,  7 Apr 2025 05:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744002617; cv=none; b=aXNwoH0jgD0sOCD+MrLjkYJTpPdZ/2COleYZto1WVKN6aSQUdTrVurbHUtaTOg6DYOW8Mr00u9zlCUdtOimXjjjtpZ5tRNBUzMBOikcJn93J2eKCF0FfddteAd7kshSlJr7p+vNTyospbYps0lO9A1lHv9VJ3Fb+iSosj/plLP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744002617; c=relaxed/simple;
	bh=lMUo/PixLZZ5A6JjfWBid3zlT1hqeC5MaqOFL38/V0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tty8z4QI2aELdfffRrmO6YCnTPV0wLAcf4gWIrbLWeIIDczYC1OvFwnlXMdqIuFxmu+LNnwe0y0APW9iiZGv6Nl5+/VjPrOrzXvi/3aAR3ukPJGLj/Y4bQ5V6t0+dZzgf2YQ6haBqEY7woHUXbMJ9d6XPPNR4soQZeJ/Lgg7iWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eNuvLLRC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eNuvLLRC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97316C4CEDD;
	Mon,  7 Apr 2025 05:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744002616;
	bh=lMUo/PixLZZ5A6JjfWBid3zlT1hqeC5MaqOFL38/V0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eNuvLLRC7qPtqe8Pm2setckB5oa0kCBgFhfPeP77Mhc0NUxPuz8ntXDiv3yeoKvqr
	 rA5usAnV+Ym2smFpNJJqhFx6t5fDuOafilf4XQS1ruSF9IIMYdQ7NVbCWy1WYdIqJ8
	 br/9o6Eqhk/IVjiCBHNdoLYRJgCTknBLOsuhdBRw=
Date: Mon, 7 Apr 2025 06:08:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	andy@kernel.org, dan.carpenter@linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Message-ID: <2025040719-utter-hydrant-b241@gregkh>
References: <Z/McCdceSpyL2A2p@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/McCdceSpyL2A2p@ubuntu>

On Mon, Apr 07, 2025 at 12:27:53AM +0000, Abraham Samuel Adekunle wrote:
> The sequence number is constrained to a range of [0, 4095], which
> is a total of 4096 values. The bitmask operation using `0xfff` is
> used to perform this wrap-around. While this is functionally correct,
> it obscures the intended semantic of a 4096-based wrap.
> 
> Using a modulo operation with `4096u` makes the wrap-around logic
> explicit and easier to understand. It clearly signals that the sequence
> number cycles though a range of 4096 values.
> 
> The use of `4096u` also guarantees that the modulo operation is performed
> with unsigned arithmetic, preventing potential issues with signed types.
> 
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> David Laight <david.laight.linux@gmail.com>
> 
> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> ---
> Changes in v2:
> 	- Changed the commit message to a more descriptive message which
> 	makes it clear why the patch does the change.
> 	- Changed the subject title to include `4096u` to show that an unsigned
> 	module is used.
> Changes in v1:
> 	- Added more patch recipients.
> 
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---

Any specific reason you did not include the staging mailing list like
scripts/get_maintainers.pl asks you to?

thanks,

greg k-h

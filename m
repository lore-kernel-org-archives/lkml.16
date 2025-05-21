Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D046F191F66;
	Wed, 21 May 2025 11:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747826539; cv=none; b=PbCefzmNzd1c57oEmW1vhJ6Msr7tOaA26yeQXAiu0awPfs2vQEJqXhp+cVcwNMtrtafb1CN5g0HjvhzxgO1/qBq+KcoEdtVl2wvzTz0mlV8wMIjKK+bw57rUyOTCQLYlCAm9HeSaN8Kud94XiW/+5HdKta7Oy9xWNuBRgA1K1YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747826539; c=relaxed/simple;
	bh=wt5bJSx3Ver+TcIWgNB6hhR7VLPHQlm4CpqvXAyZ2yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGg8EKHGSQA+PHKuZU4hC/73+dR7e2BdjGmmAO9Cco/Ns/LUsduvWlzjXOqLyQz148T3w3H5Z2i9JP9On5SN8QqEk3vmIdn6ern7H7GzqTicWR+6rdewj4iDQyuDHcB5oisy00tcSSTZMdYcBZR2uyH8XtsDXGDGN3zNZWb+YcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EDI2Wyzd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EDI2Wyzd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF17FC4CEE4;
	Wed, 21 May 2025 11:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747826538;
	bh=wt5bJSx3Ver+TcIWgNB6hhR7VLPHQlm4CpqvXAyZ2yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EDI2Wyzdib6Zhs0IgjZ87Bn3kjkApK6EMzwkTcsVbGRecSKREmf2jEUDj515AXL7w
	 tbAnT5vDNu4wS/z3J5zEfqCajPA45lGV+lvZB2v8DnCG7tc+Kg9Rfm17IFxRWSPrPS
	 pfm6goJWavKqzEjSXZZ5Zk44vptxMPx5bvvkT994=
Date: Wed, 21 May 2025 13:22:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sunghun Son <thswpvm1111@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: octeon: remove typedef declaration
Message-ID: <2025052101-exposable-deceiver-16da@gregkh>
References: <aCwUd0JNdav9BH6h@debian>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCwUd0JNdav9BH6h@debian>

On Mon, May 19, 2025 at 10:34:47PM -0700, Sunghun Son wrote:
> Remove typedef declaration from several structs.
> Also replace related function signatures to reflect these changes.
> Issue found by checkpatch.pl
> 
> Signed-off-by: Sunghun Son <thswpvm1111@gmail.com>
> ---
> This is my first time contributing to the kernel.
> I now understand how to enable modules through menuconfig.
> The reason why 'my previous build' is not working is because I didn't enable the module in menuconfig.
> Please let me know if there are any issues.
> Thank you.

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

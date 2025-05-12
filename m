Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E887255243;
	Mon, 12 May 2025 16:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747069020; cv=none; b=e62xhzZo/9ym01u5kMvzZvqhwUSrZj0o+1U4DxR9ZtDumbjnsakBWl86gPWYnFiiyNW0CBMUqUfmQ1bBRPXvxLkV2+H3D0+r9DTGPTGmF+cnAJP/FI2GwFtTCMiE03Jagb/mK3xAGCgQDJ7v7cQSIX61ZEPeJNo3TiPaBzFuF7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747069020; c=relaxed/simple;
	bh=S7U6/hDLnhJgd/0Vc2kMWgsHgUeA6Vuv/toplXwfsGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgVR+0vcjKY7T2E89PsJbzabwEKYsPTrnBBAJq26NolzR4pRjwEqYwAHB8DWGf3q5Jq+PGdoSUfxcAiW25g3tyr+BwLK+u9tx3GEuiZ6RbFGt21TPpSIObR1A58UiJJ0Hry6k/r/AgbpF6OFkqrYFb4m0OaEmx8Cn7aOORZmfrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M0Jz22HZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M0Jz22HZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC74C4CEE7;
	Mon, 12 May 2025 16:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747069019;
	bh=S7U6/hDLnhJgd/0Vc2kMWgsHgUeA6Vuv/toplXwfsGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M0Jz22HZhy3drNg5Kw460TvfktYWNIvbf3YaNNIOskQn5QOFkuxdzVTtnty/LDrtQ
	 NOLFMlpa+KJMfWxCCclj43rjACrs+tOBgg/hjRMY1OYDlBi3ELjE3IC/jeF2tXcjbg
	 h5oyrQvLSuY2XoDcUykDaNfH2PCP/PQ4xM+BIgtQ=
Date: Mon, 12 May 2025 18:56:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, corbet@lwn.net,
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 9/9] CodingStyle: flip the rule about curlies
Message-ID: <2025051204-runt-mobility-6fbc@gregkh>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <20250509203430.3448-9-adobriyan@gmail.com>
 <2025051001-undertow-unsolved-3aee@gregkh>
 <433d5f82-3ca9-40b8-82e8-acd647f55d67@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <433d5f82-3ca9-40b8-82e8-acd647f55d67@oss.qualcomm.com>

On Mon, May 12, 2025 at 09:43:10AM -0700, Jeff Johnson wrote:
> On 5/9/2025 11:18 PM, Greg KH wrote:
> > On Fri, May 09, 2025 at 11:34:30PM +0300, Alexey Dobriyan wrote:
> >> Require set of curlies {} in all if/else branches and all loops
> >> not matter how simple.
> > 
> > Sorry, but no, we are not going to change this long-term coding style
> > rule for no real reason at this point in time.
> 
> Is the infamous Apple SSL bug (CVE-2014-1266) a good reason?

One bug in 2014 will require us to touch 30+ million lines of code?

Please be reasonable.

And everyone, remember _why_ we have a coding style.  It's not so much
the specifics of _what_ the coding style is, it's the fact that we have
one at all.  Don't argue the specifics of the coding style without a
really really good reason why, with real details and proof.

It took us a long time to increase the default line length, and that too
is still argued about for very good and valid reasons.  That was
discussed in detail, not just thrown at us like this patch series was.

thanks,

greg k-h

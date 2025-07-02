Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FB62F42
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751435140; cv=none; b=aCeHRx0b72mVBiwJ8Wc4kH5BgMVNOcsJgDMZW/4Kv/Q4Kr0dUgdfrkW6IjfZsO1tZwXo5W2wFY+0rjY0eMerraBiOPrxN2sMU1/2NCvpCtE/Nu1s2s9pB6x7K91xY/OXDQ3EklncF7GqWnrvHKVX5m8xFmGn5rALGChd5C5WhtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751435140; c=relaxed/simple;
	bh=bCwI+NA5q8Lyx631AF8k9SGJRTfV7TAi5gkN0pHVLbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOWUGDTVD1sFIOqeNkzneWpz9Jl0frD03unynLyJQIffVHw/8kOMjuBXp3yswAS3/N/EWGKnFwVB8cSlPspyhylET2Q6XLc80Cggn21DII4NF3oKBEYJlTa0CkkARXcneOT1+newuG5lACHykYRdRctCq3gNZjlmMVy2VejmEj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h6bbq+yL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h6bbq+yL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6CFC4CEEE;
	Wed,  2 Jul 2025 05:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751435139;
	bh=bCwI+NA5q8Lyx631AF8k9SGJRTfV7TAi5gkN0pHVLbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h6bbq+yLvI/HUSUinQUhWW2omGCVh2FKO2Cpw9VCQqdnFTfTZN/jAOGvYoDc32ksw
	 2r+MoHuV+Zx5HZ3PiDlfingvWwMBacTx/A+znzQQHzJtL1F7gM42nIsxltmrSJ8+7L
	 ztRtMnfROWoJPXuA+mq7xVRN2t93VVK7cP4u8kQs=
Date: Wed, 2 Jul 2025 07:45:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brahmajit Das <listout@listout.xyz>
Cc: linux-kernel@vger.kernel.org, alexander.usyskin@intel.com,
	tomas.winkler@intel.com
Subject: Re: [PATCH] samples: mei: Fix building on musl libc
Message-ID: <2025070224-unheard-viscous-58a5@gregkh>
References: <20250701160726.22406-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701160726.22406-1-listout@listout.xyz>

On Tue, Jul 01, 2025 at 09:37:26PM +0530, Brahmajit Das wrote:
> The header bits/wordsize.h is glibc specific and on building on musl
> with allyesconfig results in
> 
> samples/mei/mei-amt-version.c:77:10: fatal error: bits/wordsize.h: No such file or directory
>    77 | #include <bits/wordsize.h>
>       |          ^~~~~~~~~~~~~~~~~
> 
> mei-amt-version.c build file without bits/wordsize.h on musl and glibc.
> 
> However on musl we get the follwing error without sys/time.h
> 
> samples/mei/mei-amt-version.c: In function 'mei_recv_msg':
> samples/mei/mei-amt-version.c:159:24: error: storage size of 'tv' isn't known
>   159 |         struct timeval tv;
>       |                        ^~
> samples/mei/mei-amt-version.c:160:9: error: unknown type name 'fd_set'
>   160 |         fd_set set;
>       |         ^~~~~~
> samples/mei/mei-amt-version.c:168:9: error: implicit declaration of function 'FD_ZERO' [-Wimplicit-function-declaration]
>   168 |         FD_ZERO(&set);
>       |         ^~~~~~~
> samples/mei/mei-amt-version.c:169:9: error: implicit declaration of function 'FD_SET'; did you mean 'L_SET'? [-Wimplicit-function-declaration]
>   169 |         FD_SET(me->fd, &set);
>       |         ^~~~~~
>       |         L_SET
> samples/mei/mei-amt-version.c:170:14: error: implicit declaration of function 'select' [-Wimplicit-function-declaration]
>   170 |         rc = select(me->fd + 1, &set, NULL, NULL, &tv);
>       |              ^~~~~~
> samples/mei/mei-amt-version.c:171:23: error: implicit declaration of function 'FD_ISSET' [-Wimplicit-function-declaration]
>   171 |         if (rc > 0 && FD_ISSET(me->fd, &set)) {
>       |                       ^~~~~~~~
> samples/mei/mei-amt-version.c:159:24: warning: unused variable 'tv' [-Wunused-variable]
>   159 |         struct timeval tv;
>       |                        ^~
> 
> Hence the the file has been included.
> 
> Signed-off-by: Brahmajit Das <listout@listout.xyz>
> ---
>  samples/mei/mei-amt-version.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

What commit id does this fix?

thanks,

greg k-h

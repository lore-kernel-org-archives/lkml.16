Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35374B1E4B;
	Wed, 21 May 2025 10:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822559; cv=none; b=gYErn16eaF5O6yd1zWGCsU6ie5wCxN8qFg4mafw8oRzAKiZJzg+o2+eGuqngAB+Qx0FZ4rmOptD9dy277BckhnJaK00DboNk6VQakeF3A9vUUpIw19150SEi4D5J2nA+nHl5LjgdsM4Lj8jDqfivvbOMcWwoE6JGdREDfb07ADc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822559; c=relaxed/simple;
	bh=WhNcDNdcCMFkjyOz5BitAckHGsx6PxeBfTOFhl9JO2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzIHWChvujn6oF7Df0VhaZDOeXl05LQlp/ijKSRBmjotLzUYSN49iBjH+mf9BcGPMIlHDQoV1E/uJqA/6DxVisdl+ubevgU7Y4iLwL5sweTLvD2oep8sssHL4IxFAKf37wi15cXGF6yTAhFfsIMI5D2lIc9JbMTyJD8ogbKzREc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KfjlYKLM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KfjlYKLM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F076C4CEEA;
	Wed, 21 May 2025 10:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747822558;
	bh=WhNcDNdcCMFkjyOz5BitAckHGsx6PxeBfTOFhl9JO2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KfjlYKLMxSUbkITeMe8nQ7FBxzw/VlsLZcQJ9FKcvN0BOTnfT3Qk17dOQu/YaorxE
	 oNbYDyesaSdDpWNrIhIWF+HfOIE+YaVB1Gc9UxezSgABde3dH9h0oqY3wCirK1Cq9m
	 1HVsHlNTxXh4AJJONpXvAgMEtDENLOFevoFMUsxk=
Date: Wed, 21 May 2025 12:15:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rujra Bhatt <braker.noob.kernel@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1] staging : greybus : Documentation : firmware :
 Replace deprecated strncpy() with strscpy()
Message-ID: <2025052128-patronage-drowsily-8e2c@gregkh>
References: <aC2dO1QKTVMOJQ8K@brak3r-Ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC2dO1QKTVMOJQ8K@brak3r-Ubuntu>

On Wed, May 21, 2025 at 03:00:35PM +0530, Rujra Bhatt wrote:
> ----------------------------------------------------------
> This is the new Patch for the earlier Patch hence made V1. 
> 
> [Note: there will be no significant changes.]
> ----------------------------------------------------------
> 
> Changes: 
> 
> To ensuring that the firmware tag is properly null-terminated. When copying firmware tag strings to prevent buffer overflows and ensure data integrity.
> 
> 
> Changes has been made in 3 positions:
> 1: update firmware tag
> 2: backend update firmware tag
> 3: backend update firmware tag with unipro
> 
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
> ---
>  drivers/staging/greybus/Documentation/firmware/firmware.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

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

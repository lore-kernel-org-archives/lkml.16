Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD82610D;
	Sun, 27 Apr 2025 06:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745734017; cv=none; b=JAQ3twaaO/NFOmJc6sep5tVDZHdWnJgoVO/WsMtWEjnd9qZeLAWJbyvoHg6dlmMRxIWQMM/Dmfog4p3GSUVP8XE4JO8UILT0/ixmNLlQg2TEJXCXqjneGb99X0d5Gp5PcdUDyO4JgbDzwBfsd+uKWeCzj0+INTpHYN4UkZljUm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745734017; c=relaxed/simple;
	bh=/BefJrHXQrl1hSUikz9IN8Tj0wJJFiqZM1aPZqAb06w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HM6VZdYAtspu6mhuQUryMMm084nJ24utjSEVyRpyJoElweHQHnyUTRbE559kxSwcc25dfrnTGYG3wZXJvk/KDuSBNBsL5+oe0caWEGr12NR/NecRWQWGf9QuFlg3GNlkANatHJGRqTvIcKzM1zT3N3Uj/rx+HwbjJRqIQWuVbZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ngHWs4m7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ngHWs4m7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD166C4CEEC;
	Sun, 27 Apr 2025 06:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745734014;
	bh=/BefJrHXQrl1hSUikz9IN8Tj0wJJFiqZM1aPZqAb06w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ngHWs4m75yPFowM6bPYL9XnX4rKAxw50jh9LKN10DEpOcJpw8KDzhDB4ozleJgweo
	 vu4xywU5o2DFafJ7b5cWXQmn3vNXlParkZ4ItpAOok6DMmSLmnyKXQHCVWPWdAi8xw
	 hk9JRmc3zX1WEQ6zlwi2FAgy+4mZx0UY0YxQEg0g=
Date: Sun, 27 Apr 2025 08:05:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ariel Simulevski <ariel@simulevski.at>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Fix CamelCase and coding style
 issues across driver
Message-ID: <2025042759-smudgy-acetone-4994@gregkh>
References: <20250426232032.193306-1-ariel@simulevski.at>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426232032.193306-1-ariel@simulevski.at>

On Sun, Apr 27, 2025 at 01:20:01AM +0200, Ariel Simulevski wrote:
> This is a resend of the patch with the correct CC to linux-staging@lists.linux.dev.
> No changes to the patch itself.
> 
> This patch renames several functions and variables from CamelCase
> to snake_case across the rtl8723bs driver, in accordance with the
> Linux kernel coding style guidelines.
> 
> It also addresses various minor coding style warnings reported
> by checkpatch.pl, including line length violations, missing spaces,
> and other formatting cleanups.
> 
> No functional changes were made.
> 
> Signed-off-by: Ariel Simulevski <ariel@simulevski.at>

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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

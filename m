Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4313C17580;
	Tue, 11 Feb 2025 06:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739256539; cv=none; b=cE3yReLQoMI5lgTJ+SBOua0lCl8N5Iq/HBNjSCvQoPvbLndUAqAN8PmRrfhl4KCR6BbhXuAujZVPYptIz6MLFmKnC7lmFq4wKGAM8elUEzU21O42nYt3gN5qYJtailfurdYjoJgku48MP9FYNjLEBJ/Yw3Z0G3Ojut5knDzJVmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739256539; c=relaxed/simple;
	bh=ZHfx+4Nv96WH3hNik5d0XW8kD3MVsgqww7n4KBECW7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4wcvd8wbWuosA5b4IGu/LvhhblXDc2LKakDY2Utjh0ZSpCTxdaXlYljoO2ur8gW1S+wTNKlTR3SXhqQBY43UrdhZbCsQAtrNSi36MQWP4/UgE/EqYU7MU0LOskvRAZw2NSLm8C1aq/nR8WmlSSAGiKjYkEuxpb5LA3p0vrqB0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ubx07Ina; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ubx07Ina"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55321C4CEDD;
	Tue, 11 Feb 2025 06:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739256538;
	bh=ZHfx+4Nv96WH3hNik5d0XW8kD3MVsgqww7n4KBECW7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubx07InaSxuiNjrbv0nXqqcL+taMxCjmOs+JENNvSFnOJYYXF6EcHOVS+nyRyvug6
	 jzwU6N9eAdOVDYezckWtKBO1sCEKi4WcOh9GgJM6gZXRPkAtz/mrWbSlGfVVwQsn6f
	 poFZXXp3CbTWEjppHBkTxxGTUjxj2Rsde4AEO9/0=
Date: Tue, 11 Feb 2025 07:47:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Dahl <ada@thorsis.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 09/16] nvmem: microchip-otpc: Avoid reading a
 write-only register
Message-ID: <2025021146-rope-angles-df16@gregkh>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250210165050.496486-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210165050.496486-1-ada@thorsis.com>

On Mon, Feb 10, 2025 at 05:50:47PM +0100, Alexander Dahl wrote:
> The OTPC Control Register (OTPC_CR) has just write-only members.
> Reading from that register leads to a warning in OTPC Write Protection
> Status Register (OTPC_WPSR) in field Software Error Type (SWETYP) of
> type READ_WO (A write-only register has been read (warning).)
> 
> Just create the register write content from scratch is sufficient here.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")
> ---
> 
> Notes:
>     v2:
>     - Add Fixes tag
>     - Remove temporary variable usage
>     - Reword misleading subject (s/writing/reading/)
> 

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

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218027482;
	Thu, 22 May 2025 04:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747889075; cv=none; b=t9MXwUKxMmaAemFiNW6TOc+yw9NWm8z3BtCTsI+JqQKis9hz986DhrxXkAJp5nWQGqVn881kP/YY2oE5nPRCHvxXxG2hpeQvNzkObJRGZIc9W8+Yvcn56KdbQuYdyroFHo9zMuxWEirwgWK8LDviHXm7oxfgCQnjT/QZaaKBwtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747889075; c=relaxed/simple;
	bh=UUENX1dmGSt6og5wEf/p1atMK0xHFps9JGDK+0mbjSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUpL07VjARQ9r15nGsjdn8tcWQQRQYn7ytcTBdSO5Ydd9OW+JnrZpuP5nIM9Dx6r01HLbXuTj422/E18C1XsFPmpq06EKocBbwrncqIx+MRLgrv8HQFY3BTUxtJeHeyWFEqXmybbLAq7ySH4gdDDEy8VPNXA4jadgWpo99YIlME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QBLb9Mey; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QBLb9Mey"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7F0C4CEE4;
	Thu, 22 May 2025 04:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747889073;
	bh=UUENX1dmGSt6og5wEf/p1atMK0xHFps9JGDK+0mbjSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QBLb9MeySV7krJx+17D8i7rgB25CA5rcDNxEo5Tja0YsXy8uhmmScxXdquMVeWFLD
	 sYW7l+9jym/eFlNLAZcCzvniMKk57JZM3btSAumSfZmU9ZhZaCC+N/Ic8ZdxRUCE56
	 r5Ru8bTDhkEcpjaDOkxAgk8hC2gW1qSBW6KvrGpU=
Date: Thu, 22 May 2025 06:44:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Donny Turizo <donnyturizo13@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rename _Read_EEPROM to _read_eeprom
Message-ID: <2025052216-leverage-reprogram-9aa2@gregkh>
References: <20250522035003.32314-1-donnyturizo13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522035003.32314-1-donnyturizo13@gmail.com>

On Thu, May 22, 2025 at 03:50:03AM +0000, Donny Turizo wrote:
> Fixes a checkpath warning by renaming the function
> _Read_EEPROM to follow the kernel coding style (snake_case).
> 
> Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
>  drivers/staging/rtl8723bs/include/rtw_cmd.h      | 2 +-
>  drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

You seem to be sending many patches over and over, please do not do
that.  Resend them only once please, and also, properly version your
patches as is documented, if you do resend them.  As it is, I don't know
what to review here, so I'll just delete them all from my review queue
and wait for new versions, properly updated, to be resent later.

thanks,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691E11D9346
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 12:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747569611; cv=none; b=mcsAKXQNwkWuIid8p5dhjCe++qsWdYNrgUHJrZxSsr19NA4yqfpIa5DSDE+c2ER7/N6RlSLAdI00lFlqAQxCziJrh2Yut4BmKbIabS4YpckLH6zEFXhL6f8aCHstgbAKFO3l7tyaFvsi8/ljozWcxjJM9eLgTSfr9/6CozQBowY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747569611; c=relaxed/simple;
	bh=R3M38b7Up/xvPYwowadxMSa4vj8sVnFelawVkoAx1i4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKaUGrKLMdPWW7HGJ/4NzUoEqIDZv+bIiUd4P2n3Qmgn/Iz4+eOi0HZrUVzVXo2ysCX/AuUOIoNXgDvI1dwPhHrMbTJUApJVPq+iT1TEf3vZ/g02Duxx/9l2CHKOZ3ESEGtRs8DG1kTS/1jNFqGsAQX3TdRldiGKTkHUrv1ZIcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UnhD+w7Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UnhD+w7Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E55C4CEE7;
	Sun, 18 May 2025 12:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747569610;
	bh=R3M38b7Up/xvPYwowadxMSa4vj8sVnFelawVkoAx1i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UnhD+w7ZBtP0yl5biR1/fj2qo7TSsJ/WDX8ic8zPyZBDVOinjq3p1kcGpTfzQ/4g2
	 P2dbRbiSH7ZV0ASLobDw5YbLWADAi1851Dav2h+2ZzIl0d2k97JB32FhM7St40WtLI
	 yTz9T8TxnNf8Mj/e+1jtiaKoDdNcQ92HESj5CaLg=
Date: Sun, 18 May 2025 13:58:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Velez <jonvelez12345@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: usb: dwc3: add documentation of 'sg' field in
 dwc3_request struct
Message-ID: <2025051820-unspoiled-rift-31f8@gregkh>
References: <20250518113330.8976-1-jonvelez12345@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518113330.8976-1-jonvelez12345@gmail.com>

On Sun, May 18, 2025 at 11:33:30AM +0000, Jonathan Velez wrote:
> core: Add documentation of "sg" field in the dwc3_request struct.
> 
> Signed-off-by: Jonathan Velez <jonvelez12345@gmail.com>
> ---
>  drivers/usb/dwc3/core.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index f11570c8ffd0..bb140dde07d6 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -942,6 +942,7 @@ struct dwc3_hwparams {
>   * @request: struct usb_request to be transferred
>   * @list: a list_head used for request queueing
>   * @dep: struct dwc3_ep owning this request
> + * @sg: pointer to the scatter-gather list for transfers
>   * @start_sg: pointer to the sg which should be queued next
>   * @num_pending_sgs: counter to pending sgs
>   * @remaining: amount of data remaining

What commit id does this fix?

And are you sure you made this against the right tree?  I do not see
"sg" as a member of this stucture at all anymore.

thanks,

greg k-h

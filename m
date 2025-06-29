Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ABA1A7AE3;
	Sun, 29 Jun 2025 09:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751190460; cv=none; b=OtP4L5ShD6zcyMZiIvQl4Qmr63wEAoH1BhoptihDuSkIj9Rf/oPt0jYOPjD4u6JPjFi8mYfGkhd3fsBlTYoyk02Al8cnc+KgPhpQKiQ49Qeqrf58MPCegMr/Jp35X7Pbk0Yn6b92milqPOQuUmpKNgwXTQL5WyRjI5I5/+Y3Nig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751190460; c=relaxed/simple;
	bh=3PsiXreKOO08zP3QkoiRqU3jk58Y08869vFWrOIe+v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZMKOcSEtmELrWDDRJz+pvsUyLet4+aHT2XUAgRdgj7tT7WR7Jq6T7hClMF6NE4tYg0kwBtgKrlvuIM9Xn0EpzdQRew4emu2J/gadphF4WqYksWv4WTfT9HGYnZwqkSVM4Mo/1n71kzvhOdb9VdnoSi3ViwKlG1NwCQmmOaJV1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=v7IR09Z+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="v7IR09Z+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78A2C4CEEB;
	Sun, 29 Jun 2025 09:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751190455;
	bh=3PsiXreKOO08zP3QkoiRqU3jk58Y08869vFWrOIe+v4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v7IR09Z+zK/FXdLr8CtBrByTZs73/BlZF6YxCy3rxHuvw8wXvUYcA3H45zgMbb8x9
	 h/hpFeIWMUD7WDZd+1B03mSVID1mqZBa+0BMLgrgoqi6+FauY98T4Y/dfKM70aDB8R
	 Q+xh9qeHV8x1DQd0BkqxHuDObaSI7a2hDQO0YxW8=
Date: Sun, 29 Jun 2025 11:47:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, pure.logic@nexus-software.ie,
	johan@kernel.org, elder@kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] greybus: loopback: remove gb_loopback_async_wait_all()
Message-ID: <2025062945-prologue-plutonium-870f@gregkh>
References: <20250628063121.362685-1-pranav.tyagi03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628063121.362685-1-pranav.tyagi03@gmail.com>

On Sat, Jun 28, 2025 at 12:01:21PM +0530, Pranav Tyagi wrote:
> Remove redundant gb_loopback_async_wait_all() as connection is disabled
> at the beginning and no further incoming/outgoing requests are possible.
> 
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 1f19323b0e1a..9d0d4308ad25 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -1110,13 +1110,6 @@ static void gb_loopback_disconnect(struct gb_bundle *bundle)
>  	gb_connection_latency_tag_disable(gb->connection);
>  	debugfs_remove(gb->file);
>  
> -	/*
> -	 * FIXME: gb_loopback_async_wait_all() is redundant now, as connection
> -	 * is disabled at the beginning and so we can't have any more
> -	 * incoming/outgoing requests.
> -	 */
> -	gb_loopback_async_wait_all(gb);

How was this tested?  It might be redundant but I don't think you can
delete this just yet, otherwise we would have done so a long time ago.

And your changelog just says the same thing as this comment, shouldn't
you write something different?

thanks,

greg k-h

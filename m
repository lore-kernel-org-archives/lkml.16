Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D5636124;
	Mon, 26 May 2025 12:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262074; cv=none; b=p0Wn05cwliu1TxPyKLPwx+sF9IOJAXacUZVHPf4B+wF9oViuo5dDvwGwDuEyF/Z2s09HECtTPRcsXrzRsfG4CQTOdV+f8dis5kSSEJ4brvZggB6BOzTeHbYdaIVjwpq+eb0y0BP65UAFjabzvrvHMdYgA+feD3cO3hEzBvKt+DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262074; c=relaxed/simple;
	bh=mytcLpZz6AofQLf9F+CrXUdF0yok+LQaFAFoxJ83VAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSquj5zcwLXvsNYVLSWh3BmmC4z6BNONtqGfnqF9pBaDDPxvYz4SNBQfA/7nSi5UWnN2bEY3UbjUwylT2WGbcoHKrIaFD8HrULkjHGmHVYrTPIgk0W2fcaJvFxBNkf3hPaX5qFRS9dOirYqmwAWyfceytxQd65I4aHyAaHf0Q58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bBGKqiE4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bBGKqiE4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744D5C4CEE7;
	Mon, 26 May 2025 12:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748262073;
	bh=mytcLpZz6AofQLf9F+CrXUdF0yok+LQaFAFoxJ83VAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBGKqiE4Z6x/dw/rINwGVrjGP60jB88fED9lJw+pVz4NUflviZLkpbJ5gqc9JMJXR
	 +D9XZmz6LJHNqT2xKF8xwl2tSpHtkFpwgtHqZjdR2UGOMl4pHOZWJIXVTFlGZprx2/
	 KHGHkCr9qKxOXXB+5z8PRlcckIOORMntq6uviHCc=
Date: Mon, 26 May 2025 14:21:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: clingfei <clf700383@gmail.com>
Cc: elder@kernel.org, johan@kernel.org, vireshk@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] greybus: Avoid fake flexible array for response data
Message-ID: <2025052633-drizzly-disprove-42d0@gregkh>
References: <20250526110654.3916536-1-clf700383@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526110654.3916536-1-clf700383@gmail.com>

On Mon, May 26, 2025 at 07:06:54PM +0800, clingfei wrote:
> diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
> index 820134b0105c..14395f9300d6 100644
> --- a/include/linux/greybus/greybus_protocols.h
> +++ b/include/linux/greybus/greybus_protocols.h
> @@ -110,11 +110,6 @@ struct gb_control_get_manifest_size_response {
>  	__le16			size;
>  } __packed;
>  
> -/* Control protocol manifest get request has no payload */
> -struct gb_control_get_manifest_response {
> -	__u8			data[0];
> -} __packed;
> -
>  /* Control protocol [dis]connected request */
>  struct gb_control_connected_request {
>  	__le16			cport_id;
> @@ -678,10 +673,6 @@ struct gb_i2c_transfer_request {
>  	__le16				op_count;
>  	struct gb_i2c_transfer_op	ops[];		/* op_count of these */
>  } __packed;
> -struct gb_i2c_transfer_response {
> -	__u8				data[0];	/* inbound data */
> -} __packed;
> -
>  
>  /* GPIO */
>  

Why are you deleting these structures that userspace uses?  Are you sure
you can do this?  How was this tested?

thanks,

greg k-h

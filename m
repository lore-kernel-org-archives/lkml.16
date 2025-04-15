Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056E019EED2;
	Tue, 15 Apr 2025 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728517; cv=none; b=KdJevZgrBWDeNdXwNR7cFqB9K2SXRjSeY52Seuysgi5ysImGZZ/vmBF29XisoahQkvOVFoYyTOpflb7RrrZdQTUgY4CVp+9jQlQ2HEa1QdCHBfyzeUS8mGnNbOK362E1L6rvWXoekiYAwQVZpayATXxn7ySETfI9qCHgICHHKHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728517; c=relaxed/simple;
	bh=N9/h2rVCoNkIlR0EJw2CKybKs5wiPtYvhZoaCGUTILs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swjfX4DCMfFs45rpOho9ri6NdVREZGoEJxKjvYbj84xEtPAVZ/iY1rO7hbN0H8jrnzzSdl8V4rezpSDgQQe3xtfPrhpzGpVV7ji2rA81vHS7JoaTEJyUlJv7eG//3MR2WJj6xCg8VV0+TABR5lW+2Pg4F8T/752FaktjnhSvcQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DpeKNhYP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DpeKNhYP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D2CC4CEED;
	Tue, 15 Apr 2025 14:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744728516;
	bh=N9/h2rVCoNkIlR0EJw2CKybKs5wiPtYvhZoaCGUTILs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DpeKNhYPaIt0k6g0WKgc5Q3EDU6UYTHU/CG90RkcjZQVNctXGjmLn2tmK4ZpMj71v
	 5v1CBa3PVG4NvgUUylieQH3Z7Jy+EeuVvga/YXiVRWlZPm0yCFaPeGRK9+hinkDjq9
	 hqXKBVaRwyIKMKOUzoLf7odxmhMRHBJIgxJBrXC0=
Date: Tue, 15 Apr 2025 16:47:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Rubin <matchstick@neverthere.org>
Cc: dpenkler@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] staging: gpib: Removing unused function CFGn
Message-ID: <2025041522-startling-parlor-aa65@gregkh>
References: <20250409181809.401724-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409181809.401724-1-matchstick@neverthere.org>

On Wed, Apr 09, 2025 at 06:18:09PM +0000, Michael Rubin wrote:
> Removing CFGn since it is not called by kernel code nor any of the gpib
> drivers.
> 
> Signed-off-by: Michael Rubin <matchstick@neverthere.org>
> ---
>  drivers/staging/gpib/uapi/gpib_user.h | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
> index eaf7399a164a..1cb6b6219e67 100644
> --- a/drivers/staging/gpib/uapi/gpib_user.h
> +++ b/drivers/staging/gpib/uapi/gpib_user.h
> @@ -192,11 +192,6 @@ static inline __u8 PPE_byte(unsigned int dio_line, int sense)
>  	return cmd;
>  }
>  
> -static inline __u8 CFGn(unsigned int meters)
> -{
> -	return 0x6 | (meters & 0xf);
> -}
> -
>  /* mask of bits that actually matter in a command byte */
>  enum {
>  	gpib_command_mask = 0x7f,
> -- 
> 2.43.0
> 
> 

Already in my tree?  I'm confused, this didn't apply at all.

thanks,

greg k-h

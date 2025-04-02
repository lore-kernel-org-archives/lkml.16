Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024D5175D48;
	Wed,  2 Apr 2025 19:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743621790; cv=none; b=FG/KUUInwjyaVjHU4SH7+6F3bi4UakGAeVfhUHvoDqiMPDGdYMHtSKClC/yRIZAtcPK4B/KDRX466SZT67zsLs9FBhLTD4+FBdZofi1N62/ambdMbRsl09PKVTTpzd5Y5SGReJx4EcJi0s71/zDqBQ8ZFvZCo92pqFjSLzvPFO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743621790; c=relaxed/simple;
	bh=wr2HT3UODu1UCtP8eVxFHdE3J1WTxGPPJq6w4reJpSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u16y72cFDEzxJoNC6tH7iB0k/lsrOm7YKk/VY7pK9RwLwoavGyFH6lxD8wZfhWMju7B0Yb9QLikJg9XErJExawm+SABhiKgauXSW5IbiKaUzA8y/cjrhg7lou2KBdCVdhEReF27CG3HGn858nDNvDcdflb5lhmn57dOq3tIKx0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LoKQbzam; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LoKQbzam"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F66BC4CEDD;
	Wed,  2 Apr 2025 19:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743621789;
	bh=wr2HT3UODu1UCtP8eVxFHdE3J1WTxGPPJq6w4reJpSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LoKQbzamhuAfBqujF6GrA+tZiYNzT6/X4YmV1kcBBTdqD9yRS9U1OzrP2uF6DR7tm
	 f+61xzDLOnalEVrq5wtsVNmBpf5t24EVPbyefn/nbqc8W5Tz+VUSgBGqA6V2KwSpa+
	 SPTUs5e4/+NF1CR4Fkvi01sEr4J1kIlFJBmm/4Ng=
Date: Wed, 2 Apr 2025 20:21:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: outreachy@lists.linux.dev, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: Modify struct rx_pkt_attrib
 attribute bdecrypted
Message-ID: <2025040215-confusing-sibling-f99f@gregkh>
References: <cover.1743613025.git.karanja99erick@gmail.com>
 <00287fa9f40c643b8451a0d2df8e2fb97235ee46.1743613025.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00287fa9f40c643b8451a0d2df8e2fb97235ee46.1743613025.git.karanja99erick@gmail.com>

On Wed, Apr 02, 2025 at 08:16:42PM +0300, Erick Karanja wrote:
> Standardize boolean representation by ensuring consistency,
> replace instances of 1/0 with true/false where boolean logic is implied,
> as some definitions already use true/false.
> This improves code clarity and aligns with the kernel’s bool type usage.
> 
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index a389ba5ecc6f..fd04dbacb50f 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1358,7 +1358,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
>  			u8 *mgmt_DATA;
>  			u32 data_len = 0;
>  
> -			pattrib->bdecrypted = 0;
> +			pattrib->bdecrypted = false;

but bdecrypted is a u8, not a boolean type.  So setting it to "false"
does not seem correct here, right?

Also, the name of the variable should really be changed.

But, step back, are you _SURE_ you can change this structure at all?
At a quick glance it kind of looks like it comes directly from the
hardware, or am I mis-reading the driver code?

Have you tested this series on an actual device?

thanks,

greg k-h

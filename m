Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD1224EA95;
	Thu,  3 Apr 2025 14:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690132; cv=none; b=gmAtXmrEl0TxF3+5c38OwbL+rHeDbqeA0SzVYGCf1bCELBlpoBZV7pCa3kz/6bWEmYwJklWtBGCYZ3hoBT5XGhPcFENMyP5NfSjd0mlphM7YNIu80GX0h2M7XB+QNoegC6D8kEd4ZUXErDVwoaHuRKUledfHFAJb5oNHihWvPXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690132; c=relaxed/simple;
	bh=Vy/SSXwb4bErctvMfnTxdICGIGKMDq/4CFTEZZRGIKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuT8PtH6Puyu+io/+nl90OFTD+He05PvtVDTl3CB3OqThzmd2MLSrWHW+oNWdpTPcrYOew7xVofj3D6KvwhGqGDoI4oxUzx1kup4OtQW2CUa4CRDHQMD+FxHVj89OImY7YleLbG5MUV4A5MRL4p8cVUf1GuqpMz1duSAb4TNLCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mMr5tE3I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mMr5tE3I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCD4C4CEE3;
	Thu,  3 Apr 2025 14:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743690131;
	bh=Vy/SSXwb4bErctvMfnTxdICGIGKMDq/4CFTEZZRGIKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mMr5tE3Isbt5oyMUr01QAxh/h13Kq/omvPbKj/UNpGUuM+uZa/Km3lxoiTFObWsWx
	 NnQ/IoCDcn8azxaSyeN/0gMuuxF83m4l/i5DgN+vpevk0HEC36MOzVR0ABF3leSfGE
	 huZoN/a/U1PQCbRSphwpnhSB5ltRKMtS8QsewaKc=
Date: Thu, 3 Apr 2025 15:20:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: linux-staging@lists.linux.dev, philipp.g.hortmann@gmail.com,
	eamanu@riseup.net, linux-kernel@vger.kernel.org,
	kernelmentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
Subject: Re: [PATCH v2] staging: rtl8723bs: Remove trailing whitespace
Message-ID: <2025040350-footnote-fanciness-50ac@gregkh>
References: <20250402124207.5024-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402124207.5024-1-gshahrouzi@gmail.com>

On Wed, Apr 02, 2025 at 08:42:07AM -0400, Gabriel Shahrouzi wrote:
> Remove trailing whitespace to comply with kernel coding style.
> 
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
> Changes in v2:
> 	- Resend using git send-email to fix formatting issues in email body.
> ---
>  drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git drivers/staging/rtl8723bs/include/hal_pwr_seq.h drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> index b93d74a5b9a5..48bf7f66a06e 100644
> --- drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> +++ drivers/staging/rtl8723bs/include/hal_pwr_seq.h

This wasn't made with git, was it?  You are "one" indent level off, the
diff should say:

--- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
+++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h

here, right?

Anyway, because of that, this does not apply to the tree at all :(

Please fix and send a v3.

thanks,

greg k-h

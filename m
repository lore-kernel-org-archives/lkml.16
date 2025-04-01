Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C6D1EDA15
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 22:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743546622; cv=none; b=GGHH8CsL5rxGClpfI3eSHeP2rgqMMnwT/QKSHENhlKuSt9yX1vU7fhpglpVAYdJBJLa5D6zZ6zRhgWBDwdGooN5k43vxuo/s7EeVBdIjquSsCHW3Rdqxw+s7fiiHMZuyccWUEPdNqjBcwqwR3YzHinkUBd5XUcIFF8dee0q2M0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743546622; c=relaxed/simple;
	bh=u3NBxFS+1o+I9Dai51KZW3D1ia2VG/5zXl7YpoUcNi4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WYyMD0V9YUR5V2naMHznC86SJTSsFlJLQjEiVJ2PwPX4ZwSnhdU6KHKJOK+/LtCyHwXe3buIwVZq2e8iN4m9LOhxNU993CcpGZwBTYiYdfzaOLPSxIJSa2bDUWmq3/2r0ievMAsSBHFwx7UL7EocF0pyPluNAXcwn8+xNavbpwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=YeYE6UfE; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="YeYE6UfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OAzV6Y7emIu63lPzNM9R56LallW3OUrwSacNWDVGWIE=;
  b=YeYE6UfEBVc1Q5SFhOMPiSA9yZ/hfoDGgmNLy+8GMHQ7MOcdBr4eFerI
   CvicvFQRl6Sa5AAdSjOM/SV5qiTEqT8GytN8RWt+sO28p8DpJS5FptstN
   fbFoNl7GS5AjL4nBAf5YdxsRH1T7whVD7l+OZMITa9OAA/5oT/rt+H94H
   M=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.14,294,1736809200"; 
   d="scan'208";a="215889082"
Received: from a81-173-67-6.dsl.pocosnet.nl (HELO hadrien) ([81.173.67.6])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 00:30:19 +0200
Date: Wed, 2 Apr 2025 00:30:19 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Erick Karanja <karanja99erick@gmail.com>
cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
    philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] staging: rtl8723bs: add spaces between ternary
 and binary operators
In-Reply-To: <a147e8cb87627fdc218bdc6df70c980df90fde29.1743524096.git.karanja99erick@gmail.com>
Message-ID: <ff964c79-6cc2-c0ed-14c8-cec02a3e95fa@inria.fr>
References: <cover.1743524096.git.karanja99erick@gmail.com> <a147e8cb87627fdc218bdc6df70c980df90fde29.1743524096.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 1 Apr 2025, Erick Karanja wrote:

> Fix spacing around binary arithmetic (`+`) and shift (`>>`) operators
> to improve readability and adhere to the Linux kernel coding style.
>
> Reported by checkpatch:
>
> 	CHECK: spaces needed around 'operator'
>
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
> index 928c58be6c9b..3b43f8cfd6f4 100644
> --- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
> +++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
> @@ -155,9 +155,9 @@ void ODM_CfoTracking(void *pDM_VOID)
>  		/* 4 1.6 Big jump */
>  		if (pCfoTrack->bAdjust) {
>  			if (CFO_ave > CFO_TH_XTAL_LOW)
> -				Adjust_Xtal = Adjust_Xtal+((CFO_ave-CFO_TH_XTAL_LOW)>>2);
> +				Adjust_Xtal = Adjust_Xtal + ((CFO_ave-CFO_TH_XTAL_LOW) >> 2);

I think you have missed a - here: CFO_ave-CFO_TH_XTAL_LOW.  Likewise
below.

julia

>  			else if (CFO_ave < (-CFO_TH_XTAL_LOW))
> -				Adjust_Xtal = Adjust_Xtal+((CFO_TH_XTAL_LOW-CFO_ave)>>2);
> +				Adjust_Xtal = Adjust_Xtal + ((CFO_TH_XTAL_LOW-CFO_ave) >> 2);
>  		}
>
>  		/* 4 1.7 Adjust Crystal Cap. */
> --
> 2.43.0
>
>
>

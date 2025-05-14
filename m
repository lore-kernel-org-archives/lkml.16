Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9D6223329
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747259840; cv=none; b=NUhdOwi9i1iTcwYkeAJmrn4Rr4P0U07KlMj2OpOUkZ/bAbtz5gkYpDPEWhvhR2b2L/e7rYIYnK/YMAVTV8n0gUlQ9VeOFMQCNeX4nqYK7hL558jIVSxhuG3FX53P1iLZMjctWHW1u1IU9pT67q3ReUkcrFo4tnVmd94PFomm8RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747259840; c=relaxed/simple;
	bh=NU9WJ5UgFirdzqL9PIm9aSSUlz7oq59VdivpEwoauV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEXwSTEfGJgZ7y8LnBTKxW3fJ8xeIc6nCIaiprJsAseADiW21wrCX3RkuY9a036Xx7HMBNDK7jLE8IiCjBsClataVzXUjJqahv6FJnAK19R4YVla+0tkuBJeXLhfGzYoIqNPAA3xIogBdG+qfmS+tv4j51+05S8nM9cxhFQCe0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philpotter.co.uk; spf=pass smtp.mailfrom=philpotter.co.uk; dkim=pass (2048-bit key) header.d=philpotter-co-uk.20230601.gappssmtp.com header.i=@philpotter-co-uk.20230601.gappssmtp.com header.b=iFCI56yx; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=philpotter-co-uk.20230601.gappssmtp.com header.i=@philpotter-co-uk.20230601.gappssmtp.com header.b="iFCI56yx"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a1c85e77d7so157306f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20230601.gappssmtp.com; s=20230601; t=1747259836; x=1747864636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X3OxrZnWZ379TZCAJhbxTjT+ZZFhIWa9+i6PSbSSHZg=;
        b=iFCI56yxpunIMlmMaTjuNRP663NGqwElWsHU+zSqTHPjtayPTaX771DcKGuKAKXgRQ
         OLWnnKJpblTxU55sXR1OVPA9G9wTXxPgj2mNdVU4aM4IgCXP01l7DxZagzqAEiVYjWDT
         qZ2Zz9ZBTJP2dNBGFLD+OBk8a/TD+lC9+7rm/rQ7QdXpMqol14QMS0kMr0QUdYOUghL3
         doVEfs6ast1vvJXZfel0qDtjUc6PFqf7c/3l2ehMjkaEfn7rphDTt4FDznEdxXpOdbr5
         Ej1Iym+fn2b8PSZ9CtT5lUKNXF/J3kB3MuiuaWqTKQFAMq/u5012gv8R9F15tH0AVVLU
         CC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747259836; x=1747864636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3OxrZnWZ379TZCAJhbxTjT+ZZFhIWa9+i6PSbSSHZg=;
        b=CSU7uC31ap4CIkIFn2hhIdF08FlN3j6fiR0s53qpi+p/5nKSG3y+3m84eVQD9pEzdY
         sVD+SGBpUF9QzAp3x6w8jqXN3LEtREdX56LQ6pZ4tNSMN0QTGz7Hg88Zcx9i+l4+0+UK
         K7tbE01Zr67mg4+38h7+MazF8czkNDgxBpbG+HS6bEZOGaBbkBupFzgxwAD9WmKZmPt9
         Ll2z40JE7iU+Rb2YyhivQNG5LqPwFwvDFjJl6nIj9deOFmhVyO8TgsZy5dItO3IPuxdd
         XHe3Ectv/oRMNlkt07kub8gYNldFTQ5lTc5Q5A1G9eh22LFFSHff5DVGrsZNoOTupH4x
         ddgw==
X-Gm-Message-State: AOJu0YxFzKMTxMTFtHvIm40iCW81VwkCRYzMFzKt14XL21B1uCJ1VT71
	WQgjJdKgCDEZjVE+sxGv3/J7cY66+Y4FgxV6b9Vobk6wcjf/Wqt7O6C30XxVz6nHT5BatYSDFFM
	H
X-Gm-Gg: ASbGnctbSmbGIYNYYM+AsEbuRvNhVo4+n2+kXqM7RFWmC8YVq+votDcMJAtod8mKlka
	DvTnx7HZZoyELqi7vC6S7SoUnkd95PT8+6NQaPwVNFgTJmYVRXbYJEbKVMTxUFZf2Xpr/mEqgpg
	7+Wtm8KVcwIXtFfqY5OfvDFz9jkTCGaXPX87bOxZAbY1mk+lDAgfuOwtOlTuTXHFkyNDCDa1XEi
	fbrSTH+TGfSuligpvOisEQ60CMV/AxLl84YAZoE+nw+C2CT9hZFDebY/opfA42I3IjqDeBnN30x
	0hX5NeglqdKtqiYHj4pKdVCIE2dbuAN0GPs+/mYHMnEui8TzgPUoZcpl1GIrJPFEzRv/cE+n4nf
	WW/RNRQ1Et5ExvgNeW60iHwYFfVETa5zvHQ==
X-Google-Smtp-Source: AGHT+IEfI0vRZwJBArtqO8yr9jKTaZTUgH54RTQGyeTheWeURSYv7l1HmML90HEgkyOzjXhT1QuboA==
X-Received: by 2002:a05:6000:2901:b0:3a0:b63f:c88c with SMTP id ffacd0b85a97d-3a3537b38b6mr101066f8f.58.1747259836105;
        Wed, 14 May 2025 14:57:16 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57de0ddsm20512783f8f.7.2025.05.14.14.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:57:15 -0700 (PDT)
Date: Wed, 14 May 2025 22:57:14 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, phil@philpotter.co.uk
Subject: Re: [PATCH] cdrom: Remove unnecessary NULL check before
 unregister_sysctl_table()
Message-ID: <aCURuvkmz-fw3Nnp@equinox>
References: <20250514032139.2317578-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514032139.2317578-1-nichen@iscas.ac.cn>

On Wed, May 14, 2025 at 11:21:39AM +0800, Chen Ni wrote:
> unregister_sysctl_table() checks for NULL pointers internally.
> Remove unneeded NULL check here.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/cdrom/cdrom.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> index b163e043c687..21a10552da61 100644
> --- a/drivers/cdrom/cdrom.c
> +++ b/drivers/cdrom/cdrom.c
> @@ -3677,8 +3677,7 @@ static void cdrom_sysctl_register(void)
>  
>  static void cdrom_sysctl_unregister(void)
>  {
> -	if (cdrom_sysctl_header)
> -		unregister_sysctl_table(cdrom_sysctl_header);
> +	unregister_sysctl_table(cdrom_sysctl_header);
>  }
>  
>  #else /* CONFIG_SYSCTL */
> -- 
> 2.25.1
> 

Thank you for the patch, looks good.

Reviewed-by: Phillip Potter <phil@philpotter.co.uk>

I will send on for inclusion upstream.

Regards,
Phil

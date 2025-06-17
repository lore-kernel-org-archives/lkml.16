Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEC32E92C9
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169582; cv=none; b=HhXm9uV731b9s4Xxz8HFZh27lTFKven9wFaWCRNjZi6TyrouND1/XN+gAQ++LE1gB3TFkMSEZpcHlAlhiF03qlx4b0kMNz+0DafGxXUnGgII+qEX2K6KcDSvxu8E4jMkBgguP7gYhG1r+/forDCwm95+Cj5Pry8eScumFrwTjsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169582; c=relaxed/simple;
	bh=iXFWqOrb+/Jnfho8Pu3WTaW8yur5lMtfl0eVlqQfmrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J40VveHZX8Lle4FPkOALClbhOzDeX7YD8/64kT0fF+hECH0xn87NMAstX8qDRI7/qB3hE5Rrqf1PxUiEvfOjggUY4aKNjR/SBwPPNiv9F8KNxybgJeIXtuGvxo3lbUjB/2O6ht4RnKL8KDL247uTfziZirfF8s6yknIS04oKjnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=oJ3WvqhK; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="oJ3WvqhK"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a58e0b26c4so103127261cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750169576; x=1750774376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0s0DAhwLG2vmOgwqQDSJ2RWGZLNBfRIYPMMOb2htwqc=;
        b=oJ3WvqhKK0jE8ek3aFENWu3zZqU2Dbjs9cC1AncuQ5UIUfgIoW1pVISayxbjS109kM
         g/krkRI/uQmNyyJ4ceFFdO9/n+TLU9LOPoqXI/ugl364xGwpIR38zA1Rap0/zR6r4Zuz
         8Rq6I4k+XyScjdgN8n/mMe0bzYxD2biBJwYp1FwuNoHgsmU1aDwmV0649Rk5H8xto7HT
         9VD9NL+4Td5SW/zCHqzFdg4AO+Hi+E1y6i6/CO4Qf+FoXUTCWFUms8m0s84WU8hu3SfS
         hSoxHZ9/3zkxRst24oPO+G6PaxclZeoA6Y2NPh/EnPYejz8WrT7jbiffZ2nS4Vcu9NXN
         VpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750169576; x=1750774376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0s0DAhwLG2vmOgwqQDSJ2RWGZLNBfRIYPMMOb2htwqc=;
        b=ikErSFnHa3C7lAY3JZByLvziSrr8zzXk5vo9Zf60io3kUzaSVsAcF7v9269kCFG5Kq
         9UrGsvL+ciZl3ddEDjIvUTcqJShnOkbGs0tEpGT7ldjt8KLzaL3XeLjlD+3YK61SukzB
         R5zFCVZtNlZ/Nd4ru8K1Iq6JOnjt+1Z+i/GDT2pbSUd3EHDj7pqVuS2eMk5GIch/YTQJ
         1f3krSvVSaWHxBFQolGh3WIIPxEI6n0JqLpxRYbmHN1XsXHaOKTfjMKH00sarWIZ3geO
         aQu11IClQ6eqMRgXk9nTwJefoykkotC4RzX9iS0/GRF2dhYxYzKtLCkmEJ3Bomz3B4KW
         7fsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpzmnSoJf5Mt2lD37GK0M/dNVGPBNEcPG2Gps+pUh7ES13UPeU75eoqP2PA5CJeridAVIjrEdQPGvqU1s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6e5HIV5V63USxlls7rF0Xumch8K+b7deT4zPzeK1OmGjj0wV6
	yUU/OPjFZKDrBARQng5F9QKbG0wzboJLy+a81PgUZGEaHpZhIPkcAtLBRHGGe74yeQ==
X-Gm-Gg: ASbGncs4G0X4Im8yQutlNEVjEwpKFFjMRZwXAe863K9BfW868f4TRm0DmeG5DUOlZ4e
	LidRSMi7UrYFlBReYgRKAuR3Ec8ZlIPIF6T87Dw1iKCSe3xmH7jww5AiUF3dumaL/WiHjps2MkI
	lW90Z0haay26Odfxr68gmrwyWalyvlaQfQmK1CpozpaOWIC8Iu61xg9/bluvnmEtzMlUbhPGjdj
	uFPdrjWupJnAmOOBO922iFbHh6dOB5YV+JaVSthdvQvbLCIghHsvleIhJ9BPw3o5I/oNIC3U2vi
	RxtJAT8LSbCBxp1d5eCrOyc10njskX+6cylp+2sS4qEJ1yg0NmXYtci5z2vlUXSiZ+1qapPc0QA
	q1MAm
X-Google-Smtp-Source: AGHT+IGGcniDBP3SWlANTec+HJ71BhVMTML0YMUxfK7tDS3/o0KB69JVRk+rjJDhnEFWiDvo2nce4Q==
X-Received: by 2002:a05:622a:1309:b0:4a4:330f:a796 with SMTP id d75a77b69052e-4a73c62dd7amr230360571cf.28.1750169576347;
        Tue, 17 Jun 2025 07:12:56 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a2bf125sm61138851cf.13.2025.06.17.07.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:12:55 -0700 (PDT)
Date: Tue, 17 Jun 2025 10:12:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ohci-spear: Remove unnecessary NULL check before
 clk_disable_unprepare()
Message-ID: <0a36b344-33dd-47ed-8140-76b9535e34ea@rowland.harvard.edu>
References: <20250617042050.1930940-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617042050.1930940-1-nichen@iscas.ac.cn>

On Tue, Jun 17, 2025 at 12:20:50PM +0800, Chen Ni wrote:
> clk_disable_unprepare() already checks NULL by using IS_ERR_OR_NULL.
> Remove unneeded NULL check for clk here.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-spear.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-spear.c b/drivers/usb/host/ohci-spear.c
> index d7131e5a4477..6843d7cb3f9f 100644
> --- a/drivers/usb/host/ohci-spear.c
> +++ b/drivers/usb/host/ohci-spear.c
> @@ -103,8 +103,7 @@ static void spear_ohci_hcd_drv_remove(struct platform_device *pdev)
>  	struct spear_ohci *sohci_p = to_spear_ohci(hcd);
>  
>  	usb_remove_hcd(hcd);
> -	if (sohci_p->clk)
> -		clk_disable_unprepare(sohci_p->clk);
> +	clk_disable_unprepare(sohci_p->clk);
>  
>  	usb_put_hcd(hcd);
>  }
> -- 
> 2.25.1
> 

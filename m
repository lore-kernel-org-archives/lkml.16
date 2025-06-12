Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A51E20B806
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749760402; cv=none; b=YvRw5qKo7sgcIbWf6Y01ZNr4JnvuIjg/2Ai15C+WwGcywY545BArDNgi32aqrexGg7ERHZyEADDyjfQVE5Bm2ntjqOfNOMQ8YWuscdVF90HXBX/BDjRCNen2Yc2Q7bKv39NjgQgQWWSxNB+4IF3TD3r8GOgn3kijoJkSY2fTWMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749760402; c=relaxed/simple;
	bh=EwOrQTkZkutxu162q/l63LznHvOwnjtJHI7xWRukVcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEaheL7OEi7N1gADNPukxmRS8hijo7Wbnlu45T9yQvvUc9U1Oe3GDhoa3vzuTWgyQF6nYyjIxAQgfAwmQgeo2ZY4C50Lrjzx1B2aEGigEe0H2bXd0nvuooGOrRfbHqYzHwZ+J9Te+4uk3TSPH3uIQj1GFs0hXjfP5EkDinCKsAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=GXmIa6Sj; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="GXmIa6Sj"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a5123c1533so981291f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1749760398; x=1750365198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8opH5cOcXkpOAfmUTo78hPrgHI3ldSmhpGD4e6tYOg=;
        b=GXmIa6SjwyDkDTOeHf/Eyl6x+Xl3e8HpfpsqIvwwSf4dxlz9NRNbzsav3MWSLypcH8
         YBc5YIEbUY7OXzwCMIn6qtSATh+bCXyNFa8uIXWb7BD4UgOqmj5bxsz78Ga4TJ+AYMPE
         DynolVR3bpgpMTewOd1tBqTVlY8KndK9oit7I3c1F2y7e2QudL8KveW+LLnO1zgPaQHR
         m4d9pRH3a0lU9nFGkueVy16wpEAgLpveY7MK2hJPvB9jTu9Q/haQrXCqrUU4WG6VXLla
         fLbE/ECeI08d7eFaqm++liv0pmdbodwRV1EUMQzhgLG2ovfsNoaYGmgFlMZ9r/y3XKzh
         o+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749760398; x=1750365198;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V8opH5cOcXkpOAfmUTo78hPrgHI3ldSmhpGD4e6tYOg=;
        b=c/r4Him1wJ59H5gam1a2vFjdSHRW+474WklML7PgRQHKzyzM6F+26cE4j85gJFUWez
         frMlCLfKSAK5rxDCVG2UFJnSLTPTmFBF7hXNN5a5a389uJC7mLGi4R2PqlCMsAJCbbOQ
         gGtnC9FotUlCx1vyZv2utmEbpNhBQr6rymiMZ3120I5pSdwagJ2r656Ev97sejk6g3gK
         XckIlLYY83ObEB9uB5jlaxwfCECFN9wASrKMNT6U66yvwMZhIYE/S1JPtRTS/uy80RMh
         6CzBJI8jYA0ov3KmhxajWue6dIoP+vcN4AZ1l1sAHUaTMyA3vyo4qJksXegZhXhifpjF
         Xqvw==
X-Forwarded-Encrypted: i=1; AJvYcCX+KFolQiG1VGF3y1mg4zphL3Whel+Bk0wBCAzphugSehEbL01M6tzYIVIkhZR8O2RzVZ7Q9ru5fxGPR8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCINULDcQ9MSJKX99KW5yt2qqxsMXTSAT7N7wzq3g03Znsh1WN
	BSOYsZHU+abXrx6OwxKPk6ifri5l2c+VWzdByVYaCVmlJziSRPlM+AWU5csxhrbe4h0=
X-Gm-Gg: ASbGncvaJQnTJ+EnSPtEIdEtJE/oa8MrIixPgR9JkiAbiQK9gXyV8So1NbDorGkc4kO
	UXKB4tacqErb/gI+TOEnSrPwwjAt0VuSgvFO9Abp9Y7uQhKtTX8Jz9Ch4QYLA/Ax4guFMIL0rtW
	qXP+flCmtGgkzcvXObyzxytKvMEGNPWk12ZCTxEZOZkcoJriMLn56nhF+gXquOlPpHdblwmjSG4
	8sdCwV3iphgQH6F9R8DQSzK70cdBcvdfa2DZ85je+UuvOmHy36CVmxk5SMoR0D4Aes9Dal3nj4y
	A8dAL1qs2ym+mQDMvnXeQE+rgzRI51FDSOVJDmFKzdIWHRFjcJOamHJqc4E0fHVJ13U=
X-Google-Smtp-Source: AGHT+IGsBa+y+ILrsog9vLowcZ17BT4rMJvtC6HfDifefC4iKPz18rUtm3egumGH94wSHRTUbX+W5w==
X-Received: by 2002:a05:6000:144e:b0:3a4:f6b7:8b07 with SMTP id ffacd0b85a97d-3a568717984mr544578f8f.48.1749760398129;
        Thu, 12 Jun 2025 13:33:18 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7cb65sm329695f8f.38.2025.06.12.13.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 13:33:17 -0700 (PDT)
Date: Thu, 12 Jun 2025 23:33:14 +0300
From: Joe Damato <joe@dama.to>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Justin Chen <justin.chen@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"open list:BROADCOM ASP 2.0 ETHERNET DRIVER" <bcm-kernel-feedback-list@broadcom.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v2 2/2] net: bcmasp: enable GRO software
 interrupt coalescing by default
Message-ID: <aEs5isPs68JAyjZq@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	netdev@vger.kernel.org, Justin Chen <justin.chen@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"open list:BROADCOM ASP 2.0 ETHERNET DRIVER" <bcm-kernel-feedback-list@broadcom.com>,
	open list <linux-kernel@vger.kernel.org>
References: <20250611212730.252342-1-florian.fainelli@broadcom.com>
 <20250611212730.252342-3-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611212730.252342-3-florian.fainelli@broadcom.com>

On Wed, Jun 11, 2025 at 02:27:30PM -0700, Florian Fainelli wrote:
> Utilize netdev_sw_irq_coalesce_default_on() to provide conservative
> default settings for GRO software interrupt coalescing.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Reviewed-by: Justin Chen <justin.chen@broadcom.com>
> ---
>  drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c b/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
> index 7dc28166d337..a6ea477bce3c 100644
> --- a/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
> +++ b/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
> @@ -1279,6 +1279,8 @@ struct bcmasp_intf *bcmasp_interface_create(struct bcmasp_priv *priv,
>  	ndev->hw_features |= ndev->features;
>  	ndev->needed_headroom += sizeof(struct bcmasp_pkt_offload);
>  
> +	netdev_sw_irq_coalesce_default_on(ndev);
> +
>  	return intf;

Just to make it explicit to other readers: netdev_sw_irq_coalesce_default_on
appears to be called before register_netdev, as the documentation for
netdev_sw_irq_coalesce_default_on describes.

Reviewed-by: Joe Damato <joe@dama.to>

Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84CD2036EC
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749759775; cv=none; b=n7QH4a9FmGCA2lg6kSXuE2vU3JRRIAHWFhHcAPpYXsUtc2iA5GOSTagvvVRxPTJEFVNHbUcOLH+HmjZiqljfL6BS9yYlVCIXBvWJf8n7l/1pt8KbZ2xftvu+IMHu8w6yWIPOrr/PhuA32bRRK83sPmwIW0J3Cxsof2DuVvfCWD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749759775; c=relaxed/simple;
	bh=k+8qcqat19/l68bSpa8MpZylm2SaxNPNAiemLPlp424=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7QKYedYbtGbzSdgVHSoqFL2lgJYUGli5+VuwNXu5Yu1TKCsfuFVSzRPUWWEcuMoucLNHof8eUCLBhyyyucweSQxPtI/ZOFQmhcd94nlRyW/nleSTdAzc7ZTcPof+FJyB5GtdWrFeZ+CV2jKo3UNmmpaiR8Vk3zYLzC2948rOJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=oETaLA86; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="oETaLA86"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a54700a46eso1185964f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1749759772; x=1750364572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hlTcxbxt8X33Mas2XcA4ZwTuUsj8P5XCjQiAPUa/TdY=;
        b=oETaLA86YBtbSXxqW61JdxQyu9WHbqTArGNERt8WffopwxFakQO2j1YzMtCxYk7FN2
         LF90K9wPrVx3T3V/BqBvmEcgp21dF/TjrpQoIOd34UfL/pAbZS1lj1KdZ4XJopMI6+E+
         ex6xjYL1US2C9tYAinBo/Y9iiht8Y6axmCDGsRKtKiDWJRsegOxb3xYkPbs45OqCE+o1
         g5Y828qX4sWt//GBAL2CcB9GbTL+rfecCfGMZLS44srgXUUwwd8aAG7MCuhpNkbYRWj5
         bfDoSzVoGZ822/AyaFEkQjcEjAeEOWAdL2rjYUyvYZa2pHyjzPp/yFp0lIxBdxnS1YXn
         eMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749759772; x=1750364572;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hlTcxbxt8X33Mas2XcA4ZwTuUsj8P5XCjQiAPUa/TdY=;
        b=XHdsQWTQh0FtPpMGZ3PG8g6SkBzpPswQHaynqLAMUsj5ClSl9ZPKuPRofgO/6BK4Z0
         XpOhI864kDZmab1bEmhzZItebuJaWD28w3lqdRTSvhwsi9XM1V4MT9PsAqB/Bk3bdMyw
         J/IH/h8Lj/D1wYtCQPHahq6G44AjSmMwYW0QNiS/qS4nvLvzADMOWVu/lS7jRA7C3SaX
         JspXlCLenLfAlXNUbmgXt1MxAAI1+zBVlHZRQQAEggIGY9Ne21yGRWqmYNHhq2NhmvVB
         HwF2Cdik6HEyZZwuC8+zMUqofqJbaKtK1YkKR41h2auXQVboPjLUmPgeQ/dSydwUWWnp
         1EZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7MEEW4cZb9yv2Seup+Z0LwDSlHY54oun9s2p/dOoqLf067EpiL0CoEPn8oZnj4ynx3YYxpQO+7cExv4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqFpR0RiQweEBsDD6P6aZi1uz8Df+CFonnb+ctu4hvlOZx/EP4
	/KZBRvZi/kdCtvUDBy1HiQR5JEyAplLEh8f8hd9KPfbdRlMHSxhLJyt+gqrYvLyYK28=
X-Gm-Gg: ASbGncv3zMRNXjzWWHsP4IcD0BaC0S8IWIuh0mz6VuZEKI6avfFT0Q4pVr7ccEUnboT
	RJKHzdQsP2CmtwKFzxglSsyi3vuehJIztvGmwY6Cpagy3Ak1KVABgw4k89xbDTGS4PaRIOEegKS
	KQVlGUM9eOom2s3Z7iqTpI9tWaVx5lehLvjFKB01fhalzuJmog12qfDq7vkUold7Dl+0aqV6E5t
	rKEijHYTaeEda8ghY4XqbHRMCbuZJVzbd8r7Q0FKKovgtr4ix+Wv32qoWcv7bq4WeHxx6A6J14i
	jwoMEIN9SxANMGt4ndgk9hdr7tSaxbF1+E58Jv0RYfYdeYsL5c8fQwIx0qyHkqzgpG8=
X-Google-Smtp-Source: AGHT+IF+gq1H20mJU4eexJoIkhCAQCtqebZZXUexoV64aJkjI/XmvNM4sYHXfE4os5j9Dm6p65O13A==
X-Received: by 2002:a05:6000:2507:b0:3a5:39bb:3d61 with SMTP id ffacd0b85a97d-3a5686f44b7mr504689f8f.27.1749759771298;
        Thu, 12 Jun 2025 13:22:51 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a612d8sm307284f8f.24.2025.06.12.13.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 13:22:50 -0700 (PDT)
Date: Thu, 12 Jun 2025 23:22:47 +0300
From: Joe Damato <joe@dama.to>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Justin Chen <justin.chen@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"open list:BROADCOM ASP 2.0 ETHERNET DRIVER" <bcm-kernel-feedback-list@broadcom.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v2 1/2] net: bcmasp: Utilize
 napi_complete_done() return value
Message-ID: <aEs3F49J-WMQbary@MacBook-Air.local>
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
 <20250611212730.252342-2-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611212730.252342-2-florian.fainelli@broadcom.com>

On Wed, Jun 11, 2025 at 02:27:29PM -0700, Florian Fainelli wrote:
> Make use of the return value from napi_complete_done(). This allows
> users to use the gro_flush_timeout and napi_defer_hard_irqs sysfs
> attributes for configuring software interrupt coalescing.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Reviewed-by: Justin Chen <justin.chen@broadcom.com>
> ---
>  drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Joe Damato <joe@dama.to>

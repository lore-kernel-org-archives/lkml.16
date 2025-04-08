Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B75F78F5E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 02:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744080777; cv=none; b=ePPYivDvs3m6BRubhWVNmYUfhsXuwLnAAV9rWfCY1t52ZxdeyPPlnVIpsnolbzHwiobHb/xJU0EzB15snP8JsB7pppsbmtnPMk262QIG2yj/xQYtMbUE4nfLMjr8+/4G9ffI3mFKnESkIvBT7kUrlTi2O+qIzuRvs6HzFU7wFSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744080777; c=relaxed/simple;
	bh=60S1+/YSlpfYMOGoTgRMKtt/u1MPKqI1kRHBZI6N8yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmMBygq9qDPASul5h3yvOZQxDevmAH4EQtQYjKRGGpqDuzjnpfvFra5m/WMQSNMXU6DgkfxTzq+e4QSDH/sSqBl/mqR/crl3np1x2mRUtKHS9OHP2Ja0VIvpcZ6cqARUACVPXqmk9vK+kPI87/7GwdkoylDOM/WMoOjEltF77e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=ZwmIVoiO; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="ZwmIVoiO"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-225477548e1so46962875ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 19:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744080775; x=1744685575; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u0h6T1LiujnBjC/vomQ7cAvUQmljojvP8vSChQckRxM=;
        b=ZwmIVoiOvO6zoFyqQCBNmxCLOz9jCyqWNapOwVNntwLKJJQ1M2vOfco8Dh30zurZEn
         Hs7CXWER47N1w5JlPfA7lZ+5epQg2xw+67NT3HsafxKl/VbnF9qqij7Y14ZfqRBuxdvZ
         srS593zlfpbtLyQHRBDQ7ED17rC88K5tGKul0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744080775; x=1744685575;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u0h6T1LiujnBjC/vomQ7cAvUQmljojvP8vSChQckRxM=;
        b=l5PgJ+Sx2FjD5w0FqjkX7eRb9eP8L/Y8W/Fzvq4gPsCCwXfA4EPiiJmoqMvVPkRmw3
         GAYAH3hF9wiFtMfQ3EVD866CL9bVXhusE41wat4+HRHdzOzeoAMmoxyve7dqjJk+QyhH
         9jXYr5SlcaaKMAXzEsy0kqaoJN2ZDIWvbU7eMI7bHlOUOZ2m1lvf9q2LlyokS7ubhxWW
         I6u1IIZ8iQs+iaihaF3/AJxrIpt3SYrPW9V/l6n4q3rYPKJmFSLSa3tonIO6qo/yHBmu
         wZZ+VzmUs8Fr9ICiPEZH8BE7ukGhK78Q9qLQ332Z9lSEEc/S/5Qp1x4kKFBKSP6pUmWz
         0pxA==
X-Forwarded-Encrypted: i=1; AJvYcCVfo8z8moOKAtpFNQM+gH8zheJhGi4s9WWDiSmmvXbDXRNhtGUzN9K5GAAtUI22YfceLcaXWGZ7fk07gOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXLeCLRq4WZmpUb4EMzOHuXTO7NeAgcN10Yl1wMymQCLTWWznE
	eWa7dWnsmzgjf34CFCNUG3Ti1FkwkaoIC7F9BRXZVSLzkQgS2CEwdj5BsnNWiYk=
X-Gm-Gg: ASbGncvTAEYgw+mBTF1xEPaqLnN9Us5T1jCqRsRILJMxJcB0/DpBske2plDw69jAveP
	LoEey6JA/iKl4Px6W4tKmNJ+MLXPfJuHCUmE3pWZ0Qz9s32e0SZWavta2KG7eGmwNxnOsuEpACt
	XZ0hizDLoSKp/Js513mJtyM2w5WzljxxNw7H9Zao93rrZa5AVYp57yPL/rVOa+39NP3qGoGrYmW
	7eqaBA1iy1b56v6AELa3JH1ZJUhiTs5aPSzhI9RB08nZjQ3Vw6sSQBcqHv/5eis4n/2UOPM6kQa
	x6qxG/GiFGzzNq0AWckzmMKtTth3UGYj0aJGq1NEQWQskE6JFzeUxxhEF+mdXQur4UKDs+sv8EB
	R21xZpS5YDYA=
X-Google-Smtp-Source: AGHT+IH8b8p2I+52yY87o/1TaXOtj0iK0dhLgiybbhT5iLtjWiLlKMEXX0KM/6fTJUD/p6A/CmDIXQ==
X-Received: by 2002:a17:902:f684:b0:224:2a6d:55ae with SMTP id d9443c01a7336-22a8a8e44camr205629735ad.48.1744080774274;
        Mon, 07 Apr 2025 19:52:54 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978771cf7sm88708495ad.249.2025.04.07.19.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 19:52:53 -0700 (PDT)
Date: Mon, 7 Apr 2025 19:52:50 -0700
From: Joe Damato <jdamato@fastly.com>
To: Michael Klein <michael@fossekall.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND net-next v5 1/4] net: phy: realtek: Group RTL82* macro
 definitions
Message-ID: <Z_SPgqil9HFyU7Y6@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Michael Klein <michael@fossekall.de>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250407182155.14925-1-michael@fossekall.de>
 <20250407182155.14925-2-michael@fossekall.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407182155.14925-2-michael@fossekall.de>

On Mon, Apr 07, 2025 at 08:21:40PM +0200, Michael Klein wrote:
> Group macro definitions by chip number in lexicographic order.
> 
> Signed-off-by: Michael Klein <michael@fossekall.de>
> ---
>  drivers/net/phy/realtek/realtek_main.c | 30 +++++++++++++-------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/phy/realtek/realtek_main.c b/drivers/net/phy/realtek/realtek_main.c
> index 893c82479671..b27c0f995e56 100644
> --- a/drivers/net/phy/realtek/realtek_main.c
> +++ b/drivers/net/phy/realtek/realtek_main.c
> @@ -17,6 +17,15 @@
>  
>  #include "realtek.h"
>  
> +#define RTL8201F_ISR				0x1e
> +#define RTL8201F_ISR_ANERR			BIT(15)
> +#define RTL8201F_ISR_DUPLEX			BIT(13)
> +#define RTL8201F_ISR_LINK			BIT(11)
> +#define RTL8201F_ISR_MASK			(RTL8201F_ISR_ANERR | \
> +						 RTL8201F_ISR_DUPLEX | \
> +						 RTL8201F_ISR_LINK)
> +#define RTL8201F_IER				0x13

If sorting lexicographically, wouldn't RTL8201F_IER come before
RTL8201F_ISR ?

>  #define RTL821x_PHYSR				0x11
>  #define RTL821x_PHYSR_DUPLEX			BIT(13)
>  #define RTL821x_PHYSR_SPEED			GENMASK(15, 14)
> @@ -31,6 +40,10 @@
>  #define RTL821x_EXT_PAGE_SELECT			0x1e
>  #define RTL821x_PAGE_SELECT			0x1f
>  
> +#define RTL8211E_CTRL_DELAY			BIT(13)
> +#define RTL8211E_TX_DELAY			BIT(12)
> +#define RTL8211E_RX_DELAY			BIT(11)

Maybe I'm reading this wrong but these don't seem sorted
lexicographically ?

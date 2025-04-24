Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C76A28BA85
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514009; cv=none; b=qHjoX8Setr5isUkRrlHIe69cQXCfZ9Ul3cfYeOEbIYt3x8f16Ki9KoE20VVSoZ0OQoRLOiZIhP2aZEGtkqDXHfvLDhrsTFtDddjGmq/8pOc2Z0c/Yh+h3hSFxEJ0Hl624DwLgAJViIYUcgzzDskN1uBHFm5dBlMkXbwQMG6M6HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514009; c=relaxed/simple;
	bh=Re2dLQxUt4a1JE5RnNgPNCuWjCcZgs95HiMEjBL7vA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZCRx9oIq8TUetL/NYdiCSMcst2kcg7a9ETpn9LAG/KMHGGkZQacgJl1+oozQmO8nscGlZ4x5xBUSgEEuOItlKQaN/5pjFn/2HmWtRkVY4VynmHmrkRiDU4D26YVkS4OGjLi224QHYdh2XkupNYFd9NtFbvMvmgA+LlWn4Kii7ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=DM8GmkWm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="DM8GmkWm"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2254e0b4b79so20741305ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745514007; x=1746118807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ctx76qQS095rezkew6EL81niHz5SA/vv4yeyN5Ui+J4=;
        b=DM8GmkWmxHQNa8aKg3yGQB/fc+vWJV9LL3UCEV6fY9mVYoqihPmaqsaAXXi3KvJNPT
         82oCOHI4KPD0ktuataihMFX82kh5dCqVWhnDzh3lJrayvfecWmKkSvNRMjo5uSK/a27z
         uipuK+e+aHHvKeskn3AJaUztlKe6mynaT9yGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745514007; x=1746118807;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ctx76qQS095rezkew6EL81niHz5SA/vv4yeyN5Ui+J4=;
        b=qAoshYrvP97uj3IjF1DB9qD5/wDNlnTIE3569ONuzZISVdCEAwP/cOksx6uqx4EqKv
         LeeUKAdzgufsJB35uVKsLeokiOe/v8uvpr1GmXIYacU0/I+MvIGmP44cvF2iOxwYTPZA
         R4Ni6u/unehoB7uVfqOEJSOEtvCqjeplMZl4tVvVJNV4kGEXHpZqFeY5dNF6/5/qsfmC
         msDWm6ChILuUx92n261+4hWdkC2sXna1slRim2fJdLMBCPbwclm+JvQe11wkD3rSReE7
         MtyFFdBMvccyB6XF40zY1MfbA90/kan3BNENxK7o2e+iCrFe1Fxlp+PTgVO4apl2IZv8
         q3qg==
X-Forwarded-Encrypted: i=1; AJvYcCUKIwXmjKtvLy4HTVH/T7kOiN8gbQdSEwrKgtB6hvz4xHCBMS8Q/kTvufFcfuF6y/Xy2IvwoEymZgaW+Lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcDM2RLoUnA4VnTRrI/wbsYb6oazgFXzknqGFGkrDVv1PI9a3G
	PgLNmJOD/AoqKxhX12+2jM4rA+7dNmyTtYuNh0Lt1b34UuPNhOYSzvADwUlcg9A=
X-Gm-Gg: ASbGncu8Ieshf+nhAarUKBrwN3Agp7lMrIazdD1Cd1EBbVkNao8D4aShH1NmCDMNquW
	PtGTT+L5uk0RV1Kf3AOGtBxdI4J7buufqM+Bu72RGrc4BTZR5XRnE52sG9bZUdrwT58t8/Dmjvj
	Nhdq8woSRK1nfWyfaMpxBY1y/gzoOC69htsVXPKusZDxp8F5+iIbqFdNdmgGuUbfhpjSEWbknuV
	37PIzv3XjRXzy13P2hm9Se55hCFDF4/EQ9Z3IiJl6x1Kr/SmnuaT00+gU3JH5vp8oX+Jg4x1h3Q
	9S1TGx/fXEhfjOj6slK63zuxWFn/Ve72mslmUp4Kyyw6XYFfdgW7QUWUYfpsoTLYC7ZgriM9HcF
	SegOufL521fQV
X-Google-Smtp-Source: AGHT+IH0aoqvG/SgAriNMgVXTaXkiSNjDTr7/adoRh1UdV50gvlVaim43ev4uIVJyg31dGRDqG+cbA==
X-Received: by 2002:a17:903:244c:b0:224:2717:7993 with SMTP id d9443c01a7336-22dbd471651mr2754775ad.45.1745514007176;
        Thu, 24 Apr 2025 10:00:07 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f83ad368sm1469288a12.33.2025.04.24.10.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:00:06 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:00:03 -0700
From: Joe Damato <jdamato@fastly.com>
To: Justin Lai <justinlai0215@realtek.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	horms@kernel.org, pkshih@realtek.com, larry.chiu@realtek.com
Subject: Re: [PATCH net-next] rtase: Modify the format specifier in snprintf
 to %u.
Message-ID: <aApuE3xTASb0vm9H@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Justin Lai <justinlai0215@realtek.com>, kuba@kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, horms@kernel.org, pkshih@realtek.com,
	larry.chiu@realtek.com
References: <20250424062746.9693-1-justinlai0215@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424062746.9693-1-justinlai0215@realtek.com>

On Thu, Apr 24, 2025 at 02:27:46PM +0800, Justin Lai wrote:
> Modify the format specifier in snprintf to %u.
> 
> Fixes: ea244d7d8dce ("rtase: Implement the .ndo_open function")
> Signed-off-by: Justin Lai <justinlai0215@realtek.com>
> ---
>  drivers/net/ethernet/realtek/rtase/rtase_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/realtek/rtase/rtase_main.c b/drivers/net/ethernet/realtek/rtase/rtase_main.c
> index 8c902eaeb5ec..5996b13572c9 100644
> --- a/drivers/net/ethernet/realtek/rtase/rtase_main.c
> +++ b/drivers/net/ethernet/realtek/rtase/rtase_main.c
> @@ -1114,7 +1114,7 @@ static int rtase_open(struct net_device *dev)
>  		/* request other interrupts to handle multiqueue */
>  		for (i = 1; i < tp->int_nums; i++) {
>  			ivec = &tp->int_vector[i];
> -			snprintf(ivec->name, sizeof(ivec->name), "%s_int%i",
> +			snprintf(ivec->name, sizeof(ivec->name), "%s_int%u",
>  				 tp->dev->name, i);
>  			ret = request_irq(ivec->irq, rtase_q_interrupt, 0,
>  					  ivec->name, ivec);

Same comment as the other patch: not sure if there is a bug out in
the wild for this (seems unlikely since i is u16), so I think this
is cleanup for net-next despite having a Fixes.

Reviewed-by: Joe Damato <jdamato@fastly.com>

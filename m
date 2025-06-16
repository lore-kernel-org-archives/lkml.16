Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBE82BF01A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750088771; cv=none; b=ckVp0Sg/AhoKb+Mvn1T4Ji34s6P//1WqQQc321SfkMloVXYrJcN2hqQF2boi+XOiUO9T859I3ln9MskzE74dZ6bP4fs1zE/1tROZDDPOf4bjU3emkJsecQ/pIC37ff3bom2ESN+aLQG8uAbFsCbWEdKcngNtG7jL1935uyjiQkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750088771; c=relaxed/simple;
	bh=jYvKBBGoQsaB69Pl1Nz9L1WYoE9u5ZPj5WCOapiu2K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sx0OuE6HKSkNxrfq2KCo1GE2aESQY39FaZdqttJHisJk7QxEKjxfyl1nEjyZE2noO1irDALrZDEN+PZFOd8Q5vI55mULzDFRM0dHV8UYUsY+rE2Oi+3N/CHYG47lAIWpIEHzoKFKWgqhT7cJ5uhiMOUuZLXYgWyHGvd4uMn/QkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=1hVYtNBo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="1hVYtNBo"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso39110265e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1750088767; x=1750693567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFZY7ivm1a6iFjbcG8oxzsLPAoqgNHYn501cBEjAinc=;
        b=1hVYtNBo9/vyPjFVnwfK3qe6nfWjWp2eJWglirTyGyHlh9cPRwigq5oS4dTGVIT2pE
         +h57KhSqXVLMEF0lW/KAeS4CB2BY3LhmK6Y+t2bCWqIohy9XPcLP+EP4bUrkC6PBMyyA
         bJ35KAsLgOW5Tw4n2396BHcx0zZ81Mz/I2mOr1H5H+G6RUfzp9oFSIR5igwB5ui0jXLI
         zujHgjIXDcgKlqfm3lO3+jR2IKFjUbnAbJzsz1gPwXa9Ki3Y/QO170CzxGdeWzWrLAcC
         v5aoCmBaEKJaZbO/fYYBZc6LgQOHpjakSm268YunjOPZqtVTWACdCr9JKTJCYpKhVLqw
         GCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750088767; x=1750693567;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FFZY7ivm1a6iFjbcG8oxzsLPAoqgNHYn501cBEjAinc=;
        b=E5COpU6grw228oig61Q2FrxKxsyBdC7iUkJP27K3gGMGuPkqQHJIsa+DzeKVKWLGm7
         GaKx+aPD5+wFMVBWypVMdz+OmNq+IQxn81zR4TzBy+2xUQeBxCqU3WGR5I+SIYouQjLr
         2UQ802E+/nC97rvkJYSyvjXZ//DVh4AhtGXs0Z2+IdJ8B8l7qXcq5Qk9s6LXv6laIljf
         kOsDgqremWaz9KmGqhSBo0pdSkF+0u4LcbK/E3T6Ted/Cbd+Mu8cCN0ucSOvavN+Zb6x
         K/jIbx+ORln1ZvlVCZF0quBhfyc1j2CEUd31hiM/JfSvAXy7eQYIHMtQRmAMlaNh+xle
         k0eg==
X-Forwarded-Encrypted: i=1; AJvYcCWMy2npA/DGy0fhiq+z7w2z9X8HfFLDlYO4kNyz+CuZ8zeRcfR/MZm60ds1SHD6NcIzSMjHifbPgGNJl3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+9MuRf7CAVfSJr/jeJgM7lknHTb+fRDJY9VWKE1IqNZ0f0KxK
	tUuRVO6X3t1WBInbhl6lTUjcXNGogaZD+GiGZpgEJ6tjBuiU9xQEEUIJYXiHGAbBhkU=
X-Gm-Gg: ASbGncu7/o9cFg8R3m1RNy8JwhcjBf9I03Ut1j5JIu5aTQUx5GdNX+9++YcfyE6mmNJ
	2Vur7cQJ0LYcVRC/2cH+6CsypNLxOVC0YfF4Lul+h6sxdg3mQr0ZUbX4jDsSYg4Czaxf5a2TDcX
	mP983ynlxe2WtUi4VWbt7/o9MKoycAlqVG6KwImoWLqR+C6RKifwOlCyZ0k4iZmn6MT3WOT+L4S
	qUiTHff30P5tCZ3DBKUMCjOf4UXWOebAJbd3KuVfqtQvDnJlfzl1JDijPMThcurgAmOj0Cpvxw7
	smdzsOt1sXyfMkd+StLyEZuIj1HGJRrwNCjZpc4DzekegNg8TGstJozDcbmiGsdrZwk=
X-Google-Smtp-Source: AGHT+IEt/30I++Du4WLml4SC2pgcz2vdPzvcuBNh0U+CmdXoLVZMp5wzQZkp7cbhCbobFlfshCULrg==
X-Received: by 2002:a5d:5889:0:b0:3a4:cfbf:5199 with SMTP id ffacd0b85a97d-3a572367ab7mr8439463f8f.9.1750088767639;
        Mon, 16 Jun 2025 08:46:07 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c4b1sm151608895e9.2.2025.06.16.08.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:46:07 -0700 (PDT)
Date: Mon, 16 Jun 2025 18:46:04 +0300
From: Joe Damato <joe@dama.to>
To: Justin Lai <justinlai0215@realtek.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	horms@kernel.org, jdamato@fastly.com, pkshih@realtek.com,
	larry.chiu@realtek.com
Subject: Re: [PATCH net-next v2 2/2] rtase: Link queues to NAPI instances
Message-ID: <aFA8PEZCAInzMZnM@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Justin Lai <justinlai0215@realtek.com>, kuba@kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, horms@kernel.org, jdamato@fastly.com,
	pkshih@realtek.com, larry.chiu@realtek.com
References: <20250616032226.7318-1-justinlai0215@realtek.com>
 <20250616032226.7318-3-justinlai0215@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616032226.7318-3-justinlai0215@realtek.com>

On Mon, Jun 16, 2025 at 11:22:26AM +0800, Justin Lai wrote:
> Link queues to NAPI instances with netif_queue_set_napi. This
> information can be queried with the netdev-genl API.
> 
> Signed-off-by: Justin Lai <justinlai0215@realtek.com>
> ---
>  drivers/net/ethernet/realtek/rtase/rtase.h    |  1 +
>  .../net/ethernet/realtek/rtase/rtase_main.c   | 19 +++++++++++++++++--
>  2 files changed, 18 insertions(+), 2 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>

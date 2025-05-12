Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E31293724
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747052974; cv=none; b=PZHnRWZgwhZa+1ua0kwG0U3Z3rfc5TfHC7a+TQF7SzU5MXqWVBZpHIvbGXFwB+o/BIhQcsh7jIzhjpVkOXWCKlYJMOvkOGPntaHrArQOVH4AA8xmBpmsPHbWGk3UhtI8w3KQRz65JoLg+mgSdW3T/YZQ5HefgZHaLbB6Wj0IexA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747052974; c=relaxed/simple;
	bh=tJUy7lLmXYcF7E6mCCr7BGqQ9L4GgJNGI82AWY3FskM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rfGPsTu9V5D3Zb1s7aWWHGyqjCF+0WjMeypuUiNaQR9rECVPUef1bP/cYGa7AIm8Eoj2Bg9NnWlnwUvD+isFfm8FUGWJhTxqy5uHarLYQ1hXpe/X9VELKcMS6We56HIWA+PkshkU/idNia6PQ7xxmLdxAyJ58+IjQmQ6l7SvQpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k2eGK1gJ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k2eGK1gJ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54e816aeca6so6141775e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747052970; x=1747657770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJUy7lLmXYcF7E6mCCr7BGqQ9L4GgJNGI82AWY3FskM=;
        b=k2eGK1gJclzsLed40s4wc8jUcw4LUmxI/SisMFqTkOi68//tT8iGfK6MsQNPkuoz88
         ER7HA1jd4OHKKJLHFERbmgl6SNK4a8KF4MBtzFxZIc8vMdnNimyLb7VrCBE/bHZcV5XZ
         yEqGl0DtLuyqWdbtw/xepgQYoypXK4NfvLgCY2Z27UPAKbBYeziCT0GvAGeARu9MMGkq
         iDiAgUaREt/HmfBqsdtcgkfgRQBR6veUv9XePv0tk93nr+9EbYz69ymDcDDW/Yx42xQM
         LPugv3v/s/78BF2uMveJ3pdoerPqJszdJ0Tq6pPpUv44GhXf+fChXQAhl6kyh71+Rsxu
         2GBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747052970; x=1747657770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJUy7lLmXYcF7E6mCCr7BGqQ9L4GgJNGI82AWY3FskM=;
        b=FqdaaMJKarDd7iP74Ujbnc0l1aeqelMgBJe34UftB2GAnoZhjMA14qbvt0vnR1+Tx2
         r121565aH31N7jZ0eHgkUOBzd4bVssAjuGYlxr4RBTpXhs1AHKuYmM4RvJOADBeKvxAk
         3cCR6qkFSwB1BuJdK7JidRjFnDe42OgDYEva2fyUXrpvTxL13NnJAstKKHLSh2XFU3q0
         AyWEcWVZyNsoPJnnvvLOhL3/8XdEqd6C0Y3UPnKTgEN1SzrhGWEDfJN59E8azsyjjmEW
         faQ2AudQiE3kiMX4pR8F3+zcGlvNy6mbzTQ3EgOMztIx3gGhywftuXL78YagqdvBfbvV
         hKgg==
X-Forwarded-Encrypted: i=1; AJvYcCUIsYRclIV+MDNDYZPey2SjS1kLDQP0UVDZmxVBmFbMa16mgdWtJLa348ERN9xd9KkL62PWycQLfGQOAgs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6s0iSEvcACF8DlcwnD6vSj7LSfJr8v4iE8coE/LUN0J7uR8W0
	7hYT7Yu7QHoRCkn/GkoSJEflXTXg9wbiwEM3iU1PmUxgkaCigg/n9Wq9saDclE9Of6kWxcobDpy
	SJddmbMOWPlWXIueUM515WfZYuA8wmxms5bRhIQ==
X-Gm-Gg: ASbGncv0Lr9URNSgWSfkBYVpCczC8x7xOZcxDjuq7uEtLDWqllir69CGjq4f1JMdorT
	qYydCsbqgVRe3fmHt6od3eJGNFBD6tuqgywl6Znu1NrWwzETR+rf0uW+6tPs2SNlZFBsVYqT4kR
	+EDHjr6G5zrmlGd2zfr5SssP7vBLxOXvkIO6XJAajAXpA=
X-Google-Smtp-Source: AGHT+IH5teHFpZT2DOrcAB+txD7/G79w+37iktbttp2yohMQWhCCqnOPjEwdESmtjygl2sxgr8fUwJazQYzfyOJpzag=
X-Received: by 2002:a05:6512:6816:b0:549:5c5f:c0c0 with SMTP id
 2adb3069b0e04-54fc67e28e2mr4791732e87.41.1747052969843; Mon, 12 May 2025
 05:29:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508211043.3388702-1-vladimir.oltean@nxp.com>
In-Reply-To: <20250508211043.3388702-1-vladimir.oltean@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 12 May 2025 14:29:18 +0200
X-Gm-Features: AX0GCFuVB3OcEUGN1FzLQPrl4GJJ-z0JMr3VodsFOFwKqSoHqyxxq7JqSWnGH4k
Message-ID: <CACRpkdY58DH9O5g35Ai5PjE2gDSSbF1GodDNj94-xhPKfHURkw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ixp4xx_eth: convert to ndo_hwtstamp_get()
 and ndo_hwtstamp_set()
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
	linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 11:12=E2=80=AFPM Vladimir Oltean <vladimir.oltean@nx=
p.com> wrote:

> New timestamping API was introduced in commit 66f7223039c0 ("net: add
> NDOs for configuring hardware timestamping") from kernel v6.6. It is
> time to convert the intel ixp4xx ethernet driver to the new API, so that
> the ndo_eth_ioctl() path can be removed completely.
>
> hwtstamp_get() and hwtstamp_set() are only called if netif_running()
> when the code path is engaged through the legacy ioctl. As I don't
> want to make an unnecessary functional change which I can't test,
> preserve that restriction when going through the new operations.
>
> When cpu_is_ixp46x() is false, the execution of SIOCGHWTSTAMP and
> SIOCSHWTSTAMP falls through to phy_mii_ioctl(), which may process it in
> case of a timestamping PHY, or may return -EOPNOTSUPP. In the new API,
> the core handles timestamping PHYs directly and does not call the netdev
> driver, so just return -EOPNOTSUPP directly for equivalent logic.
>
> A gratuitous change I chose to do anyway is prefixing hwtstamp_get() and
> hwtstamp_set() with the driver name, ipx4xx. This reflects modern coding
> sensibilities, and we are touching the involved lines anyway.
>
> The remainder of eth_ioctl() is exactly equivalent to
> phy_do_ioctl_running(), so use that.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Overall looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

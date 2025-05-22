Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D5812DD95
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747934659; cv=none; b=awtECZqo/9pBSOQEJbYGhLGCeZydMHFybu9WnrhI/M848L1UCQaqljmfSi+Y6Q3V0XmWeehjAzWkzyAcOzCZeNRJwm4JyPqZwsuRhoExpw3KQxWf3T/7To8SHFON3XgLCQW+Bm76OnIrxjdQnWpt8eZP+Xyh4SB6yI2noXpLhgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747934659; c=relaxed/simple;
	bh=KvaN/yfKGtsdh01A/Vg2kwDIuhYHaquHlXyuOmWW2AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fibp5mBAbQMRyo7boKC12Tz9LYTw5EiAsqbAKZ9HDeSwPNKQ+7zP8jj6Ct/vjtR8voyGGMBG/mneQuguYvuWF2MyvbBVp7pg5eFeM0YBXFlVxVwxSctqFmXnR009y0nuihsM0qxtNoviTUnxQQ2xujZ4z/wu5adF7lu2wDsdvBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kqw/jrLu; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kqw/jrLu"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2322bace4ceso46693315ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747934657; x=1748539457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MEF6GYIX6oyyajg52e52+WAYQucDYWoIxRKIMxJyhFk=;
        b=kqw/jrLub+zCKPoBet4PGFa78Su6c28iN9OUXjF5lmi1ETg4dBGQXs+SlrCto4/Fhn
         BxnmCVISVwgV7OI6Gq9kLLDi82bOYFNJj1YOeUU57fyIbccmaKHmnQdbc7XuCxVodBWy
         8hgfYZZZNwnXOvV5HoS2E60MgFegTogiujbDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934657; x=1748539457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEF6GYIX6oyyajg52e52+WAYQucDYWoIxRKIMxJyhFk=;
        b=fCUk6c8TJctgdntYqs83Of4STtsnj7KkU7LyJEBsQCIfMd930E9wXsZ8Z5x1pzJATk
         jPADMbUFPSwFwZ391Vlti9bXqqnDc8KEj27PvuaIIOU6j2KrcGP6idEsRRNenP5l+435
         gkMtpFKk9AbMF0y07F5lN4MIJTU/m1YuHc2G7xWdrYvPihNHihWeGHAymivmES/hhA2L
         iQHFkSvjOnkFE9Y3rQykyanIfv4YolwfzEJgHVmtIXrWuFgV2rgjvvRmlvXqUrXv7rmu
         KqF6fclu3H5L87l706D2n62YLCyV0LWQeA01xf+MVgtoUU7g1RZUR+AWDd18vI3DAfzZ
         SPjA==
X-Forwarded-Encrypted: i=1; AJvYcCV1xExbSivCyhYXrOOZia7Vqwk5fzg+oC7PJtjADEfIw5W74JZT2ohE1p4VSPD+uIiPlCsSIUph5UpVMYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYHz+SQenfn96krQidt/ZyjJiX489SjbWxUPv3DxOeioVGFf+X
	ojiE8YcQ27B/cjVKqgkr9Jj7p3uMUvaDtfI46VITcUw1rYk24d/YYMNZBLytkDS65g==
X-Gm-Gg: ASbGncuQTqdtGVUan8I1siutNKmrDIaogyKdxU4p1PBAnAq90ZIZ6/yAM4oG+jox/xm
	AhrwQ9K66oKETLFWqQqTS1CPTxqLsMDqJrfQnh9Ps9GmFBuojMGugU8RpiikFwQ/PQyEXK+IoEF
	DIa3WEIZiLeBgUh/il+pximZcJymjkhpN7pn4wWkhx58xF4rQB92Uqd3iG5tPWz1svo5XwVCRo2
	8B3lGCeYhzcngj+aanhk436cjRBCapAQbKJmdgi+EEhJIMg/OTd8PwpiklHZIPc0a4Je4SbztQ+
	dWviYfMxNHPN7hqWzGAF/nlesgNE7sZNc9YTRzVbcmKDCQATHAUMnO81Emg9H+cSPFlYOfkoem7
	KGc2XihGyhk4Jog==
X-Google-Smtp-Source: AGHT+IFRSz/tRaVeLZrqA1fX8rhsQ1UTYI64MklqaLYZeJlKbPrLh3UFKLqJnOjYtsSZL7+ciGxB4A==
X-Received: by 2002:a17:902:d4c8:b0:220:eade:d77e with SMTP id d9443c01a7336-231d452da59mr375514505ad.40.1747934657477;
        Thu, 22 May 2025 10:24:17 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:88a1:1660:1cc7:bb28])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-231d4ed239bsm111440565ad.219.2025.05.22.10.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 10:24:16 -0700 (PDT)
Date: Thu, 22 May 2025 10:24:14 -0700
From: Brian Norris <briannorris@chromium.org>
To: rafael@beims.me
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Rafael Beims <rafael.beims@toradex.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: mwifiex: enable host mlme on sdio W8997 chipsets
Message-ID: <aC9dvv6Ki1T5RsHF@google.com>
References: <20250521101950.1220793-1-rafael@beims.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521101950.1220793-1-rafael@beims.me>

On Wed, May 21, 2025 at 07:19:34AM -0300, rafael@beims.me wrote:
> From: Rafael Beims <rafael.beims@toradex.com>
> 
> Enable the host mlme flag for W8997 chipsets so WPA3 can be used.
> This feature depends on firmware support (V2 API key), which may not be
> available in all available firmwares.

Is it available in *any* W8997 firmware? Or particularly, is it
available in the firmware in linux-firmware.git? Judging by its git
history, the answer is "no", in which case this is definitely NAK'd.

At a minimum, can you post what FW version you're testing with? This is
the bare minimum required for this kind of patch on many other drivers,
although I'm not sure we've been so strict on mwifiex.

And even if it works for *some* firmware, I'd generally highly encourage
not making breaking changes like this, where there's a long history of
users on the old FW version. So, we'd need to teach the driver to know
the difference between v1 and v2 API here, and choose accordingly.

Brian

> Signed-off-by: Rafael Beims <rafael.beims@toradex.com>
> ---
> Tested on a Verdin iMX8MP (SDIO-UART) and Verdin iMX8MM (SDIO-SDIO):
>     - created AP's requiring WPA2 and WPA3 authentication and successfully
>       connected clients to them.
>     - connected as a client to AP's requiring WPA2 and WPA3 authentication
> ---
>  drivers/net/wireless/marvell/mwifiex/sdio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/marvell/mwifiex/sdio.c b/drivers/net/wireless/marvell/mwifiex/sdio.c
> index c1fe48448839..f039d6f19183 100644
> --- a/drivers/net/wireless/marvell/mwifiex/sdio.c
> +++ b/drivers/net/wireless/marvell/mwifiex/sdio.c
> @@ -438,7 +438,7 @@ static const struct mwifiex_sdio_device mwifiex_sdio_sd8997 = {
>  	.can_auto_tdls = false,
>  	.can_ext_scan = true,
>  	.fw_ready_extra_delay = false,
> -	.host_mlme = false,
> +	.host_mlme = true,
>  };
>  
>  static const struct mwifiex_sdio_device mwifiex_sdio_sd8887 = {
> -- 
> 2.47.2
> 

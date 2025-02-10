Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F44C24BCF5
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201328; cv=none; b=BsBKETpvsMYB5kNIsvcpMr0JgMfqmNK6DcPhCz3albK66j3p2f/HI/0HxWTqbOSA0ATZy2AWWlW4M946C8F8YT/tB5qt9HLl9d3WlJm4FZUTwYLDB6XMpXrdRtbpAOsBeUam/+3TPNFD0M8ipaYAzdO8miLhpGlcLwxxoB4MlRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201328; c=relaxed/simple;
	bh=oziFbmRNCc9k4KPkkeFVKVEM1sxwAMGIXomhOkSAEBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T2ohXDkEI/DnTRZATN3e/zWN4AWZvuDqHkUrVDoSXMLvoobRsbVGq7lNWnldQIZcRQZ0RxDW5s3n6dvX2/YXTRQaeMRVRfhVH8RedqZz1cqdedW0hPSD8f9I/sZ7MviBFlrb/rf7b/2JxIUthRlVVepPw3Oj4sPyUK08wSOfsq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TAK5PIUB; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TAK5PIUB"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-545097ff67cso1440021e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739201322; x=1739806122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zBbPgo0gstLNKC4D9HeuENhxvfaeb27YQF5JgeDpmA=;
        b=TAK5PIUBDV6OGzIBLV4mSGTid0UEpLHPnDHEI6QkiMuv4oETxGmVq/TqSuRvOt1Q1n
         oEDDjUwYo85yoU1JTyR6asgc3Ns40uUP5/DvGEu/8xHfo/0UwB2Y93SQcM0WQGMzOo6k
         3Twm0kZC/LXZ0ebdATdd2G/kSNBgJ3JkHI7wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739201322; x=1739806122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zBbPgo0gstLNKC4D9HeuENhxvfaeb27YQF5JgeDpmA=;
        b=MYGi/bp6fXof9XYZ6Otblzgg52m+AH1rw+E+jprcCD40QcpIm6IJllSYKPVVGGqpLc
         2ciehojBD5LYsNSIBxE0ZKHvweXlSglLVawJNylMxBuIZ6qjDKpVHgbkoux2MS00s/xt
         su1ROyXtpVQROPWxdVOQvRkoBaG8OtDywoV89FUXfiDrd6U/nbWr9M1jkrRmJIv7sMm+
         4b86W9Z4eLsJ/tPiOJzdp5kyhUxf2aoBcYk1moEYjwHy6GQjF8dbDHL3dvzjLUeJ2r1E
         1fsf+apSq7NCA4nmX71Uxt2TrKi6KjMvruWa/kNXHlbOd95Fn+MD9KGTxcNzDalNoWdx
         reOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVITw/ymxQ0PEHI65MQyRU66IKfaD5PIOXWwP6AZhd/bAV/lzMF+cmY95Qy1eCVjqJJAd0aX7Qol9Kfwkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ30Oy169ilxxvwkzn1dOCwU3wpuDtMHGZRpAoTSbHlyTA9aJD
	v3RKDmxIxz3L/JiCg0SyDg2NU78d8Sb8QZ0cDVCyHi+RMJ8LnNaj3lMIs5pwyoXkDdSkiYlNB1l
	Erg==
X-Gm-Gg: ASbGncsNO/YDuD/kw7heNYNdQHzFOP138a0ni2JJv3smtzxuFer9HqIpAvFTPVzXB1h
	sv9Z/Wgw0fKRNZtfH+9ZwPgP47TvQuuFhZrzokdwc3FAPT8ZKVoJOigbtxbx2g0lKrsQpLnZvMt
	dEkCzl8PEbtHptDwX70DteYUB91JC7r+O8doYyvU/CAHp0k+Gy/8D5RlCbcI/n+gPhsp4PCgISJ
	3F/A049+fgc2WHyAVAsvDcC4s1H1nmY14PdWO+j6n/8lp9giay+7cFZTbmEmUgVTXL3wI/iIKvU
	fwFR3QbBjPrcPNoWb2VkcQ5f9tCRhxSNcVwm65NwPpT83liCF56QNX2nDnM=
X-Google-Smtp-Source: AGHT+IEONXrZZTLB40dqHgCdeON/4YR0KZ6rLP+XCzC1tgbHhL4l4QQwPakgiEjBaF57pu37wN12qQ==
X-Received: by 2002:a05:6512:3987:b0:545:62c:4b13 with SMTP id 2adb3069b0e04-5451186f323mr33207e87.40.1739201322471;
        Mon, 10 Feb 2025 07:28:42 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545038d5b88sm798409e87.178.2025.02.10.07.28.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 07:28:42 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30227c56b11so48355321fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:28:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqnasWos+QbkW085J2AJD0Wc53bRNKX/q+J2qiQlJkWVAzsiFPwjAi1DLC3f9fEoefUSkA5abnHaclVoE=@vger.kernel.org
X-Received: by 2002:a2e:bc07:0:b0:2ff:d0c4:5ffe with SMTP id
 38308e7fff4ca-308f8372de9mr941611fa.16.1739201319830; Mon, 10 Feb 2025
 07:28:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210092342.287324-1-tejasvipin76@gmail.com>
In-Reply-To: <20250210092342.287324-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 Feb 2025 07:28:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WwbNAhiMWN_4PRODByWScdnqAKk7yvGP2KJSoEzvo=vg@mail.gmail.com>
X-Gm-Features: AWEUYZmsY_bn2OOmH7vLcQO32Ai9fXk4Kpekh7FXVF9vNXeLEqjQTJQ1OOX1tWI
Message-ID: <CAD=FV=WwbNAhiMWN_4PRODByWScdnqAKk7yvGP2KJSoEzvo=vg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: visionox-r66451: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 10, 2025 at 1:24=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Change the visionox-r66451 panel to use multi style functions for
> improved error handling. Additionally, always drop LPM flag after
> sending init sequence.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v2:
>     - Fixed visionox_r66451_enable to return dsi_ctx.accum_err
>     - Mentioned changed handling of LPM flag in commit message
>
> Link to v1: https://lore.kernel.org/all/20250208051541.176667-1-tejasvipi=
n76@gmail.com/
> ---
>  drivers/gpu/drm/panel/panel-visionox-r66451.c | 181 ++++++++----------
>  1 file changed, 77 insertions(+), 104 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

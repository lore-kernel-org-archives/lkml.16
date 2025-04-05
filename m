Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5541415533F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 23:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743895114; cv=none; b=sXAE1qTeXC4arpmbjAPx10kMAFK/WJTkkSv0UxFF/hJPNheScXjKSHEuSl4+V3jJuSljEdycwjXkiPLV5iLDIavnh5AWQQFaLOBasKJp/zEy/q6imVHeZYbFt3wI1pQ0/l1YJuB8rWm1fb04IzHq0pa4sdfjnran463jGheGsrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743895114; c=relaxed/simple;
	bh=HcbDSBDe1C0JUq+OPrFV7j+/wiQCp956AGnlcoZs2PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rzgqIEAg/UmG97Wj+Z4ia98HWuts6EPKuQQ367PLuGjg5/i8mIQqljngX2zF1k88QJE0YyiAO0nhz93AwRU/3Yl58ppVJDJnrzCZIG+KaGRavaDdgEhQyMwdtTLJ63gtcc6tL5eXXa9RB8oEYmg2P8n6XihCo8cwYS7raQjY4zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AhQk53qI; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AhQk53qI"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so429166266b.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 16:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743895110; x=1744499910; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qhf/rx7t8bMwyY/f1Kp0rJLQEBrQ/aBJkKwcV4l30K4=;
        b=AhQk53qI391OYN04PRiFxKNwXd4qj1wJ7TP1H+pj1mP9Htry51RCnNBmYmCybAP1dA
         xJzyJwZLA8o2wPmE+0FbDJLaCqpQNejh3HXx6yrxwWjiwpJXZU4eetQiRngJY+2rmWR6
         4ZO1GQJwweyZ/uZH0ZMyrVgHxMoCIqS0X9ciU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743895110; x=1744499910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qhf/rx7t8bMwyY/f1Kp0rJLQEBrQ/aBJkKwcV4l30K4=;
        b=Y1xnwwuhXHPWbZYWKW/0T1nIFl/uC/7rzPHnoHk2ht4U3yYZcBBP3ocblvV0BcyWZ+
         wHy0q7owhFWbY+8+Les3Djx8C28Locr1yl7jM/HUHy2Zs7sKocGbkEDiKSpYbbBEb2El
         miSEiITevpf8RUJpINfM19w1PXrjBtTRsSVkza+mu2NYXmo8j3GfRJgkPajoPnO/eblX
         xUk18MoRO1Sl94nIeynqlkV1NftKzu6OH5U7iUe3VzlqQ7poXjHCb7R2gvWZhWtZaRQc
         DAlQR8Fgkk7KOq8lxadDrHAJBL2srX1DWFJrYhTgucM5bRPYv5c3cA0AaQZf0cMy1DqH
         3O9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGE4ftIiO2klp5k+fvWZFTNM9u07rGeKcI4yDDzt1qUX1B9imuYRF/+bK5RgOzSPwS5hbLZHW62CaE0CQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YytBW6lc0x/WMir1CgOYe+TLN64/9cliRu1UYejPsDxd8pOvAuH
	/EIMnC7dZFU45IBNbY9h5AP2xueR78E4t7JoUZvZKYO9hKfQonXRDVVgK/DNILwI6ueaIZzNiwz
	86ss=
X-Gm-Gg: ASbGncsgjfXaOIIwUk7QS0c8R3tL3EPbJn9XurzlvJhcmAUzvhuvDH6gxnHE544/IhT
	H0X37vQq+8n/wYkR3u4EyaoILWdGH+tbZVv9YVY+ZoIcajMy45wTuZFjaUOSkC/F/Mmmna9cJ78
	Lzde1wE6QBWw6vXSm6ePWpnnduvNcyCuSQjepQ8djfa/1lrLSbQE8LtAWmoG9oIMwA2vin7sBsw
	auswGI87ehpDAvVoodfQ1Ksyic1xBHc/7tBX84XNnds7x0R6/sPsV6PNhMkfsUgXbjg8xLsbyp8
	niWxt85fiudC8g4ycuUmMSzLvQesV8ypZW6K+tw/heMnw8yUPCdAiOiu/4jtnOyUcFGPQlblOaj
	Kbedsh4pmg8OTAOIg/WU=
X-Google-Smtp-Source: AGHT+IH9Yy+6aV//D3/sh5Xh0hWmY+MzF3lWYYh/TW9n+vKt/5hR2Qwfbklh99giNpIxDjMRrHn2rw==
X-Received: by 2002:a17:907:9605:b0:ac3:8993:3c6d with SMTP id a640c23a62f3a-ac7e72b6218mr320105166b.26.1743895110396;
        Sat, 05 Apr 2025 16:18:30 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe99b46sm484233266b.42.2025.04.05.16.18.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Apr 2025 16:18:29 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac41514a734so554810966b.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 16:18:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCQnMLM0p5fNcpRSfxNw94c9ttBqxmgYyOX3DE9MRiDKe4uY1809wax74w9VcxJXcpHGoFPTtlWPCPlLI=@vger.kernel.org
X-Received: by 2002:a17:906:81d0:b0:ac7:ec6f:a7c with SMTP id
 a640c23a62f3a-ac7ec6f0b0fmr227244666b.13.1743895108623; Sat, 05 Apr 2025
 16:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9twD=Epq278=nVGxMU4veeEpznYLnr_PVQ9WqvdnxZac_w@mail.gmail.com>
 <CAPM=9tw5SBS_P1oX+ySAhNx-M_NeO4RzK249i6vtwSU0V4mbDA@mail.gmail.com> <CAHk-=wi+93hTajFWaRL+vih3NjrwsNe8gzgMxmQc5BE+gPQnoA@mail.gmail.com>
In-Reply-To: <CAHk-=wi+93hTajFWaRL+vih3NjrwsNe8gzgMxmQc5BE+gPQnoA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Apr 2025 16:18:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjcoeRQ2ywrcY=1eYRtYgye65eG+eiwgKc-hEWs9rvLCg@mail.gmail.com>
X-Gm-Features: ATxdqUHFMm87zCO8Rc7Je2B4WCFw6-4VH0NK94B5F2-ank9OPYFEmgzZhqqov1I
Message-ID: <CAHk-=wjcoeRQ2ywrcY=1eYRtYgye65eG+eiwgKc-hEWs9rvLCg@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.15-rc1
To: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Apr 2025 at 15:34, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Does any of this happen to fix this (repeated a couple of hundred
> times each time):
>
>   [drm] scheduler comp_1.1.1 is not ready, skipping
>   [drm] scheduler comp_1.3.0 is not ready, skipping
>   [drm] scheduler comp_1.0.1 is not ready, skipping
>
> which seems to happen on my machine when the display goes to sleep and
> then comes back from low-power state.

Seems to be fixed. Knock wood. I'm not entirely sure it was 100%
reproducible (and it wasn't just the display that went to sleep, it
was the whole machine that suspended).

            Linus

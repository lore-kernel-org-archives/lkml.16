Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4ED2512DF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030350; cv=none; b=MWTvHLl9MexiIigDEU4kPJiGSArRsM1c+yxvH9Q9g1fv8lS4+CIjtJqvh7kA2U3cTW0sYDLY9CuCTDm3Etv1wRFqFRQbvpHV/retmY/XZmrsyPW7GKex6cq3Gw2sO1fVF+jAJIPOergSsA2wVXBuj/CV9atwVNy4Cjd8WOw1tt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030350; c=relaxed/simple;
	bh=vvPy6WdiUPY2AXlM9TykqHpWcwjr0sYurFFOn0N16yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pK29BhDcWzWCzaw0dJ4WspcyLOUZh0mxI/E9TIKGa0TFmeFupIfFo5TZhQeo8uSjpppIl5Jie1dCgdzhHc5B1CAsZjPEnf1hTK0qhRHpWB6NqkVvbJoUdEnCuFArmEJI3GvJsDToCsVqi8fXrIETAl2A4GXgumP8+UODEguVShM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QVJUwTwF; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QVJUwTwF"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47688ae873fso42368191cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 05:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744030346; x=1744635146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vvPy6WdiUPY2AXlM9TykqHpWcwjr0sYurFFOn0N16yo=;
        b=QVJUwTwFf9YmJfPOG1l5HTRkD6PKKlinIM5Ls43GDLH2x+3k/5fX7sMbfKDZxlNneg
         o2O2GyIbO6J3sOx5I5kODMRz/zgqe6sWr/LgCZlMQF/ZqeTNDbMKRjlX68xs4/oX8IhQ
         fnv2HU1AQtHEOqB+I5s7HtmSY/T0ZpxNEDDDGYedSsnUmru/VhJ2RPb9R5bW0rtslZM6
         6b9o8i5NLQsdU0/ibnds4Je8CQworMDyBL8O/gp9uTTC3QP3XNOAOl2u9NBVeBnEK6MX
         E/fKLr7ymMdpf2YikgY0aSasAt4uawRLtvQeJb5AopmQiwxoYiyjYn0KjSVDx/Snyd6b
         44/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744030346; x=1744635146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vvPy6WdiUPY2AXlM9TykqHpWcwjr0sYurFFOn0N16yo=;
        b=elSO0tOW8nF0LrrUiT9FaW9TecZkK9FnhIETG5OPWfMjc5yy/IjGZRwr+tV8AKM/wL
         EjPkZMopqi18NMZZSOZDEMK1rF8KlWEs4nHlDU8gDoB74nat3bugcA86UWLdGCNziCFs
         idAuHFzr+y0A39ampWMKQeLMWZx+A8Ina3MrKNEkjK38vfXbyMpCONyJ2fgiZpf2I3oy
         TN+/dGPm4XnKsmDh0LrLS5VFyuc+GrR1Kw6IVYZoCj4IH09sn/B/EzvbSrnt+v4WraGm
         RoUKq2XEUZXkIJ3gvnBjyyHyzXAf4QDEmGZak/TeDEUt7B9Dn+gtdDlZ/XuJ5OMsSKFD
         Ajig==
X-Gm-Message-State: AOJu0Yy5VvqYGul8AVoLdjWDTeUUSbZVDNe4xOGsz5NyEMrqSeLrE+Aj
	LPTasdi96SJb7RhDAR4dYU7Z4tvGWD2YVi0MGnZYQfIeDbEDCkk0hRwIl9dq4qQ=
X-Gm-Gg: ASbGncud0T76djwGAlOyqE+rPJUS2QEHZo5WWm40mhY8XvfOQQHCJTXIyIlPx+9pEPJ
	pIzPae4XF8lL6jMnKitK5+F/oaQMSbgbKWmk4MsjJ2l7NhF9OxGCKoHB8LAtyFLb63nODvfLMT4
	njntvA1pzbklgEzZlZ/HqQzGXMespwz/rHIQSCaoCVg6uzeCtxv56SIb2I4igkS3rs57VHPnw4C
	4JOEz0FBD3vrGI/eURT36wRlcp4MkBgtxpo1VovhN1traP1Vy+AFm170hBwlibDzFlcJl2C31Ht
	jHvFxxYc0+vQIBBaGvPIo7VrjlZS1r9EqryJH4DCFJagC19QvEjKbm6/hjsDhQb8XLcYr/Nv/fS
	Jz6apT1JmIQ30
X-Google-Smtp-Source: AGHT+IGXcePNxNTFGmlt8DxzrF/e7a/wPwFKCWoSc0AMn7K1eWotGvcxmZOjhszizP156b4/w+1gZQ==
X-Received: by 2002:a05:622a:1993:b0:476:aa7a:2f78 with SMTP id d75a77b69052e-47931113d77mr159226381cf.49.1744030345879;
        Mon, 07 Apr 2025 05:52:25 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b089e4asm61040901cf.47.2025.04.07.05.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 05:52:25 -0700 (PDT)
Message-ID: <910d7fc8-e4d1-4421-a118-b8a254a3fe37@baylibre.com>
Date: Mon, 7 Apr 2025 08:52:24 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] pwm: Let pwm_set_waveform() succeed even if lowlevel
 driver rounded up
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
 <353dc6ae31be815e41fd3df89c257127ca0d1a09.1743844730.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <353dc6ae31be815e41fd3df89c257127ca0d1a09.1743844730.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2025-04-05 05:27, Uwe Kleine-König wrote:
> Waveform parameters are supposed to be rounded down to the next value
> possible for the hardware. However when a requested value is too small,
> .round_waveform_tohw() is supposed to pick the next bigger value and
> return 1. Let pwm_set_waveform() behave in the same way.
>
> This creates consistency between pwm_set_waveform_might_sleep() with
> exact=false and pwm_round_waveform_might_sleep() +
> pwm_set_waveform_might_sleep() with exact=true.
>
> The PWM_DEBUG rounding check has to be adapted to only trigger if no
> uprounding happend.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>

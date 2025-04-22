Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C261EDA2F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745307155; cv=none; b=J5Y7+GfV6qMVQJYdSW56zwgEAwad6oe3dRgWojwVPW+czJv5i0p++FNmyQOHkuNTGCQhL6WJ/p7VBATERD1Y9KVjZr7yGlPWDpdB/haEqbVWsPTgF5FXg2sWaOkt+FZXLSuiFUFWtI9OOCRdeT9LoN3cGB9DgDDxHxycNTVw1RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745307155; c=relaxed/simple;
	bh=7Bk81mVUspbCCClBXouTuIH87HJRUhR0JL6gTSLiWO4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sIVIIh6xqm/53t8lTxbktCyWwK2vIUdayj+tHPla0xZjWkSKLRbv1CVgNZhv4P8FaMrvwBBdD0V0wPubgrDggUXVGWbhxyap6+crHxDzQGobwwS06U+BUILqJ5Q5b8121T17VI92JIUCAzAqhvYbIWLJmL2CVDcE/i2ubZd/5W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wZouJB1d; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wZouJB1d"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso2782568f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745307152; x=1745911952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gFPbHcslBrShPBfeniLTCdmwDJynv5JMNyf9loIAkY=;
        b=wZouJB1dgu5gvYM4iiQ7c4tieBaP1OH1SUZpRKBBmbD/zR0RhUV1KnfPdc44PLgHAw
         ihI9LeMT3HBF+t1pcUCByalalagoiMkpTnh0JiCT2WWKHHrvzEj1qPXAaZ/dgQkhCb2+
         ylqylGeKE4shZMT7/Dl9GpCvC2zgn4V7xW7GaR0XsEdLw9DiqFq7EjR0AHa4LcbGMxX7
         sZW1CDgcDvpYmcgxJTEwPzKLK1p5EGsf1k9wg1y1t/PtRGzhQgvubSrZCRm31od5xeqz
         mL1iu2IW/PwEBB5c901FgY7T42xw5VefttK09oM+OnWK+dzfDKBHzxTIfKJuzjun1zNn
         ZOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745307152; x=1745911952;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gFPbHcslBrShPBfeniLTCdmwDJynv5JMNyf9loIAkY=;
        b=KgEb9p4q2XyOBX4E38YC96c9pSou/04td8aFDxtAtS/i3gy+IYHleHPDH87oa3mZAv
         58A+jnhdVx6vPWvs90SwE8OHuq4Hdo8EuShSNfdF19pLgg7hrkn5q/Xz29aN0/dou7ME
         U9SRCLqw6iwGagq8SgCYXDzgvUajguWH3oXXAcX5Ha6NKsuiEFrrCQPDaHYVHpUSYdJr
         mt8V1VcmKqCFUdex0btuIRpcsBuJ5Rp+YhLhvPbTQS+2nc5PMNeEUF3l98mgyCre4iE8
         cxYIQtpkQAE8/rzqyzJQddA4qv2Q6BbcHh7BtfViB/rIm5YtxAx8JNNRHFQu/oTqGVXw
         NK/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX51toX2eg8BFjZwum5bZv9mBpTEVyssevuU3SHq/t/VPmJ/E2gAGq3awux0ZIvMStNKdwlE0lorFu4m+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRPzctC9LWLaHi7iCAyyBC2PJ9/MeOUaVwrbEQuwgCNN3lOxsK
	Z/DWIWkiSzKc1l8qQJ9/EZsFWtwhc6CW/B2zIKAyO9KP5WF3Dy9FptuhOrxqAjU=
X-Gm-Gg: ASbGncvKmOfcQbNl+c3m+a/fQMtOj91qeacpzErWpYSa8SnEiG5iyPoVhKjgdANNboA
	AM0mYZFgxefw0TR30FYA0hq4hgSqICp9WqTeh2viXBzcJslnwp5wUvSHahW4Tv8pnaLBLzBMxB8
	JRs8sqZD1TTlafIjQPbAc1wXAwlR2jxIi07fFxrv7efiNByzGZQG2FL4W290kmihQAjlgPUTamu
	8pQbgdmLqRDvkNaS/b7+gSmtteAqMzGQx4Wma1lTNLQ6u6Uy5W/73pw9mo9YgEVG1QYItjqpXLV
	3s1SNP6Ctu7ewu7pw0Y3StIz7kqQFQDSkmMak13GppewsJEShoUqTar/h0yrxg==
X-Google-Smtp-Source: AGHT+IFclT1+OQXEDIxxx/AMqrjY/N1Yvy1xLXDrMHQkl58h0kU69MTBU2hwvhAytgvH99PcAzfK0g==
X-Received: by 2002:a5d:648c:0:b0:39c:1f02:449f with SMTP id ffacd0b85a97d-39efba26220mr11676730f8f.2.1745307152441;
        Tue, 22 Apr 2025 00:32:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43c079sm14450855f8f.50.2025.04.22.00.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 00:32:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: christianshewitt@gmail.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
References: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v2 0/2] drm/meson: vclk: revert and re-fix vclk
 calculations
Message-Id: <174530715197.2805907.16376775353354108716.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 09:32:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Mon, 21 Apr 2025 22:12:58 +0200, Martin Blumenstingl wrote:
> This is a successor of a previous patchset by Christian [0]
> 
> Patch 1 reverts a previous fix for loss of HDMI sync when playing YUV420
> @ 59.94 media. The patch does resolve a calculation issue. It also makes
> all fractional rates invalid which is a bigger problem.
> 
> Patch 2 changes the whole drm/meson driver to use Hz as unit for clocks/
> frequencies. And importantly it uses the relevant 64-bit maths helpers so
> the code can still be compiled using for 32-bit ARM.
> Maxime previously suggested using drm_hdmi_compute_mode_clock(). That's
> still something to implement with future patches.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/2] Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f37bb5486ea536c1d61df89feeaeff3f84f0b560
[2/2] drm/meson: use unsigned long long / Hz for frequency types
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1017560164b6bbcbc93579266926e6e96675262a

-- 
Neil


Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6801E3DD6
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738340671; cv=none; b=C/DYE4WM5X4aYXDHNCpXn0UALCjpJIBqgsPVEK6gGaErB3FX4cq21bkZXVxzNeqXCAcpUo22yrVkFZ7uVorUdg04cSKj8Vc4iDgzsGGNL7WmQLXDTYaXu76ovNICJ5P0c5zBC0PauVbF4S+LSbjmaxGT+mcvYgMZVmDTqBqbDPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738340671; c=relaxed/simple;
	bh=EZ4ZH45qNXzKCS3lBhUz6baQ7yOTm+vianG7o2TOPnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7BXd143K6lCMC4sYoj/1PKZ2vTWbFG+oWjvwcQvSSi4O70LGTwjQWOY1GCcSr3Fkpld15YQWeGEQ1XciDOYyyjt9V6t8xrrKw/i4L2slrx7Cf7rAG27jgpaXUFf+VtdwvrZsFRXRpz+jKA2Wa+HJxQzIQF0/2Sk0JQ2g+AnjK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MiMBmQ36; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MiMBmQ36"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3061f1e534bso21900551fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738340668; x=1738945468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1OPRB6njxlUcUlHqiK6tXyv78044AchgI/F8gIyGgQ=;
        b=MiMBmQ361YU7CblNVu3W7F2ehHnkfp93RCB3dSjqgvZu9i+rQwsJPZ/XyY4F+B6OT2
         veDLrkRn7gjlum7lkI1oMDX9YuCyU+D/lANyu6ioWPiGvSBXAMZ+ruruAJ80Y2k3F58I
         nmqY7WshsESg6Hk1k74t8a22E2e4afaKRjAbs/Ms9VsAQ01ps6ZUZd/0J5R63uLXdpPP
         kOIw7Lvuec7L9d3om42D021XZh+tMOe04wF0UDttVvNjnTLO4bRtT0AYhYfUMBXpBWPK
         2055lp0OgMGSohWdXJKkJ5vn4rEWuvYuc9iz6O2xH/X2YloL+Pjf5wqCZ18XWeajvmK+
         CwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738340668; x=1738945468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1OPRB6njxlUcUlHqiK6tXyv78044AchgI/F8gIyGgQ=;
        b=v4nUUFXLlcvm+JrwXDGgSHLGuvv/VSrrbBeIgsebwFvTqA3RkxJS6b8OfCkHekvoJI
         tEFais+Zb1AvlRFj98QFSo1pmRPPeVKPfLMz01AiYCEkV2rkbHmtFNghaIy5D82d/PxR
         nqUjubYCaunhxQ6dwR3GCoYfy/K7FMFvt9wvzGYujrRlWqXVfMcR0g7L5e6nYdWldeCZ
         1Z1WLtWexlvPbljbeBqp0reuMYIJXR8Flxr0EYrxZ6jkeaLHFMr1NXm7+reOskAviYKe
         IrBKne8GLuWHaANbQwE15gPviVtisCdSgh6Q3IrB/6U02m2O1SLjgrEL1594cJVWPz+r
         VwNA==
X-Forwarded-Encrypted: i=1; AJvYcCWqyAZmOaI85YmbPmspp8CUfVM6TqBLC+6BJuLhSUSG1z43fpBBq1vvrC7H1Y4M18RzJh7OyLm7MGEz+DY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFOSouhAnqSvDxsvtUHV3jAJvfkmeqHTVwfGwT43V1jfWlOOxv
	KdFgweFVTNyS93Ineoc3sE/dRn3xhYeuQFJbrbzMTxomhhQLaMj0x99Ksu8uqgY=
X-Gm-Gg: ASbGnctM367hwW8B6tBDfQFO20zlixiXEBRF/0pY55qfjGWvPSdLTqOE/SkYo3Ti1wp
	sAl8xkPbpUzm8T8K5Kml7AwbfL+pdbP17Wf+9QvwCa3QkzJgedXN4XioJqG4stoRcLCW8oDvxSG
	fu7Xv5f13W6BvQ8iUp47cASqZGvNzIqWdxYXAnNpV+HwPz0sFYf6aONMxedUkxJAqbSayp/hKKH
	/q5zzEkWkI6FsALdKcS008aHwG1QYnbrJbcyfduO+kGh5AYk4aK+p7lCZISxfur3s8Vj5aF/32c
	mX5VV/VkAXHl0tkEFzNDevjLkwVGeWXmWfVofKt+AgcVj/kM+NOCbJ9siHp0nBQKMaxyyHg=
X-Google-Smtp-Source: AGHT+IET6Ip7seInrKN40IUQ5plgR5Wbm/yFknTx/GqkNshb2c2sHr/YKBS3/IVjV6dDw1EBZWuIdA==
X-Received: by 2002:a05:651c:2214:b0:302:25ef:813e with SMTP id 38308e7fff4ca-307968fa2acmr43084751fa.32.1738340667875;
        Fri, 31 Jan 2025 08:24:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a34282a5sm6090751fa.102.2025.01.31.08.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:24:26 -0800 (PST)
Date: Fri, 31 Jan 2025 18:24:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] drm/msm/dsi/phy: Improvements around concurrent
 PHY_CMN_CLK_CFG[01]
Message-ID: <gyslnttjsuav5dsbmglroujpwrqazokfnj65uhbegja3w27yxc@iamitbbg2e7e>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>

On Fri, Jan 31, 2025 at 04:02:49PM +0100, Krzysztof Kozlowski wrote:
> Calling these improvements, not fixes, because I don't think we ever hit
> actual concurrency issue.  Although if we ever hit it, it would be very
> tricky to debug and find the cause.

All of the patches miss Fixes: tags.  Could you please provide those.

> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (3):
>       drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from driver side
>       drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against clock driver
>       drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing bitclk source
> 
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 50 ++++++++++++++++++++-----------
>  1 file changed, 33 insertions(+), 17 deletions(-)
> ---
> base-commit: 375ef7b3d85d8b0fa72092642582ca5b95a64e67
> change-id: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

-- 
With best wishes
Dmitry

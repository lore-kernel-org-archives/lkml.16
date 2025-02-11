Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809C740BF5
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739245261; cv=none; b=Ag7JvMPJxDrGKRAt4C0G1Ht/xr+Tyx8HpbmAP9Be5uV8hseKCTWlxZrY1fwZw8rVEWzzboybJsWa0OjA3p7HrtchtB8PWlkWkSTIv4oIeJ149BrPQ8Wm8A+ENpWUCwTsk4uXsVHermcLKEulODubNUGzyNULzTn9Bz9H8A+f12M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739245261; c=relaxed/simple;
	bh=m9JqgufdqQaa8IPvLWZeQy4BIn0ONuHz99VCtUR8O18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocmrGW8c+qAYp4C3DmX9Z5LyLa8XQnzCyC6cYPdX0SvBX0vC1ryNQzRoa1nx3Ikl+pkTXBynJJNzM0z4vCPo0KPt1LOLZ1LHQE2PM0vs8qaecImDlC8SRNJxx08IT353xQo7MXErKb0NMq2U+TxUfLLOQa75sjC5aSxvuYY9myI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GZB3zQ6Z; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GZB3zQ6Z"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-543e47e93a3so5706566e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739245255; x=1739850055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5vAtkbKujewPgE+URJArLsNmDebMF+/Ud9vX6A3NATY=;
        b=GZB3zQ6Z5rSZpKtXwfGC16gPoVjk/gtAEqoz6Ril9occ9IKeU/whfMtpg2f8lsGYay
         gknU7VrfM/ajcfIcup8izrSe3GB7fhzmElcbZ21/OTn7DJxG0tdM97DUdgCEIs23s5g/
         f6Y2q/qBXZ51X+eowAmYgQLVW/rMO7PH7ua8oLLLTHtNlWnHLuliI+vBKHroIJ0TxIRI
         tC7/KMhRAW8AuI6gD/QUMcYw26Jr7jAVabXxafKCIOgnCjwsOsmiKR2VeNR8ImKf5wC8
         thb2+YiURQq4Cqrt6eOWzCC617/KACsF8U/gWCZD6S4JcaCgvDKBT+KVjZ7YSEu2wGhS
         5zQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739245255; x=1739850055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vAtkbKujewPgE+URJArLsNmDebMF+/Ud9vX6A3NATY=;
        b=DgbZBH1NYln/dL/wEBhpQ36dVEiCYudWHSjGLkVqLxJuFm9nOTFLrLyUKqYfQfQtRV
         b3yvBZfuz6sqABF9qdpfzMlN11GH6BzbG9jJtb4asMB9nii4xj+PS3BwYMpUNl+DgFpb
         pM42WSxrNpBRjxOi+NiK3c745NEvejQfBsBHGYui29nVNv8iJs0RszAx8+2tddHSdsCC
         qSgiCDtRoY5BTsRtU75kWpd9unUvIoVHuf6thWJfc6vBADKDTC5Z688zdKAgldboE47f
         C/wpXk/bRerRQ7kMpJ7wKrivdvmMKJDrRKkLK/BSOA5V31qcA4g/6JK53jFNu3WrV/Gm
         2mtA==
X-Forwarded-Encrypted: i=1; AJvYcCVB4lITxtGovTvluVF4divYYtYfCyk8PoA/gX0MbODlK+3T7rigxidaFevgAJ1ju+mA/eq//FXPnwfinW8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Rv89FXV0IcjV5h2iFSLsZwW/Vh1mCHB3PS+Yqak0+vscNoWJ
	toPd2xX/3+GvTaotLW0S9mXDeL+uGMR2LdV29P8BRJdxrvNSpbb78Y8kPPIdczRLfVTLfwxvLKB
	L7Ec=
X-Gm-Gg: ASbGncuArUnevA1YL/o8srgW/nVScalhILoLH8R0JS392Swodj8zAoR+5i7HvUhUZW2
	HZmiIlf+Mymvv+RKPMUMRMwGSU4KFIOHBfMN/A1mCgq7UnWKYaVoMAFUjxIpvSUAjI+iamL7V26
	1zdXwEL14V6oJ00es6FpuYVJUTVTBTwr/x5q67srFOL1Fhl6VYt5W1WZXBm4lMikw2h98Kf9dxK
	6xsxxeLGXMlRX8tpgIwtZPgGHEyqkBT2r9Kb3SVdoL9yFs8VbU/erS9LdzgOWeYcykM5LzwzOnD
	LEPq9Rzu9oD++1m0NwMIhiI7/OjCKU7gdYpzdXqKDkdX3GIQ0giJd99xQA7uMsnOqVPIrJc=
X-Google-Smtp-Source: AGHT+IESIZIApI82KNped+F8rDYKVVEqRChUa6PLhZuvZfiXsjK12HtxB4DBhx1h10YT3mchL9bAYA==
X-Received: by 2002:a05:6512:a96:b0:545:10cf:3468 with SMTP id 2adb3069b0e04-54510cf366emr965052e87.37.1739245255377;
        Mon, 10 Feb 2025 19:40:55 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54501e3fa93sm957117e87.17.2025.02.10.19.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 19:40:54 -0800 (PST)
Date: Tue, 11 Feb 2025 05:40:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Don't leak bits_per_component into random
 DSC_ENC fields
Message-ID: <x6e3j2fbf7hjos7uel6b4kk5h5q7lwtqkacqxj43sntheguysg@k5weigzww6ac>
References: <20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org>

On Tue, Feb 11, 2025 at 12:19:32AM +0100, Marijn Suijten wrote:
> What used to be the input_10_bits boolean - feeding into the lowest
> bit of DSC_ENC - on MSM downstream turned into an accidental OR with
> the full bits_per_component number when it was ported to the upstream
> kernel.
> 
> On typical bpc=8 setups we don't notice this because line_buf_depth is
> always an odd value (it contains bpc+1) and will also set the 4th bit
> after left-shifting by 3 (hence this |= bits_per_component is a no-op).
> 
> Now that guards are being removed to allow more bits_per_component
> values besides 8 (possible since commit 49fd30a7153b ("drm/msm/dsi: use
> DRM DSC helpers for DSC setup")), a bpc of 10 will instead clash with
> the 5th bit which is convert_rgb.  This is "fortunately" also always set
> to true by MSM's dsi_populate_dsc_params() already, but once a bpc of 12
> starts being used it'll write into simple_422 which is normally false.
> 
> To solve all these overlaps, simply replicate downstream code and only
> set this lowest bit if bits_per_component is equal to 10.  It is unclear
> why DSC requires this only for bpc=10 but not bpc=12, and also notice
> that this lowest bit wasn't set previously despite having a panel and
> patch on the list using it without any mentioned issues.
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

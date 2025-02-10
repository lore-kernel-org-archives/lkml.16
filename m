Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CAE7FBD6
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 04:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739160959; cv=none; b=DKzc5Zt58iiEoiaj7UP2H5MhAFgYJPOQ2CCErao68e8poZIUWGCFtzxDj0fuulYXDou8HoK+zgM0umKcA/f3alTNucZScAjIXHhrHjY5pUvbSjoHvujFTnPxrvxMWT6VtPMJQBJY8Wk+Jrhtn76ZB6mxgHQ3ctj9AmXuhq8IUmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739160959; c=relaxed/simple;
	bh=3M3JyY4rOW2vOrZgnCjRD0TpnM5NeMnBRPZBQbfP9n4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGyPhcb0+ruanQZzjzZpWnUv8dsQ7oi6leFAuBm9ECYyfs+zieG4/Marlq3rRl7j2UviL+8gHK6rUT6oHiim6sCyuwgMlgq+YdohpMrlwIanDbZcKLjjdvMjsnctRBF/vpm9Ljgv8lPqLHPqHYmwWHxyUE9BmOuz4raqBnDXvQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CiolQDvO; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CiolQDvO"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30795988ebeso38721701fa.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 20:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739160954; x=1739765754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QwzLE0GCgihiIk+dFJwQ0ALU3Kl1sVby5kLip594Ikg=;
        b=CiolQDvONIg+PolEVXKtBwAlZ4I5Cd9irO1OWkOynd3YVO0lJyxI8G7deLCODdab1O
         iwKbMtl2oA5VmMrFojHXK2pt06YJA5YMOGeQTLwQ5XH2wBhlzH8QXMgBZeOE+ypa0qtc
         KlirMFbEaHtcZNar2af/4VaIjrZN/SWUATVMNBoGFEBCaRab482xdawa0B+GkkQo5yKH
         tmuDrqIqN0ki1LFh+yA1ykSbC/IcB57Unb54rcnTqPOEWeLUa1MIQsZ6+UyQNaqp9Rop
         CksYJpEWmhj2Sk/SdAD89z/+Fiu5ZtzI997dPk6KddlzOyNqFaaTDcck5GA3ptr6Uf0x
         K/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739160954; x=1739765754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwzLE0GCgihiIk+dFJwQ0ALU3Kl1sVby5kLip594Ikg=;
        b=YVWOl2Z5pPs+MM912nHYTtDkXAU3aSXTFsowR67LhzbdaaJ0OLPMxJ0yL9Ra7IhBwr
         lJcd39LG/agP6xaXgGDu6WIVVaCOjUeTmyS+cuvsvvXvg5oCGuUADoAvf5irOep4YTsz
         Eq/FblizP2FYN61JwtkRoplivsdKUuaQxF7baLMZPhLUb1AjaAQV3qgQdBkFTaTqK1s+
         YyZ4ehMKqTuPRtsHMkENMO9irv0B28PbYJKRlBPg6OyKiVreHFAxc5q7k20jfK2Bk8Al
         BN0jreD77PHf9nFhvdQvZl/LTJDiy1TXdq+DstoX/mjh6Q3p00B+UfmQtDFrXPP+RKO/
         t3IQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6/b8ljXxLAlefEMmanzvDDbpchm6Xxmlnz7DOCQfJJLTy1JswA/sBw1J49GPe7qGgTf1ljg//lYosXWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTFTM3kxt425zRRUvSx5XwiumgQMm63/k4Cvuvlndk1a8v8GvZ
	j1YtKtGEJclUif7FYQ6FlxGsaFuv02DHZjNHFAGF1wYxJF/0h5oBgxLTI+UOu54=
X-Gm-Gg: ASbGncuhKjZ86bkhsS91l2KBVt+DPaPJGRGRgD2x+z3A81kbgBB4LCU3Cfyv84qmVNf
	Jqixz5s2Ar2a4bCJuXD//GFIeomFmGRlRsu/hlEEeD3/TESiRMAOyMBHhtH4n8TWMcE5XgGfcDG
	3+dL/ipIEXpVSiNHUkp94wwtCPROiv0Hq9cYMROUU7f23TsrVEY6roIPYzIEJS5tFbe68q3a0qB
	TmsEKM4WymyB8IY9pH//xkrB0l9ycX+71O5lLS0CH9zlhqzorPlh6hkxmDRG6AxE5Jjmsm8Rnw+
	yeSBW+WGrV3bLaCeHCol/DAMTVd2aQVS2nzUB2w/y3JFDJySqjyRLhdG4Wc5aeGv4F55dg8=
X-Google-Smtp-Source: AGHT+IF5U6ArPZ8cE6ddrQjBGFIlwz3f3qJFMYvqashpqs6GvurvVMofzsRTGb31NHrx7zoqyP9jzQ==
X-Received: by 2002:a2e:3502:0:b0:308:e54d:6195 with SMTP id 38308e7fff4ca-308e54d63b4mr13706111fa.24.1739160954311;
        Sun, 09 Feb 2025 20:15:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de190915sm11354891fa.40.2025.02.09.20.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 20:15:53 -0800 (PST)
Date: Mon, 10 Feb 2025 06:15:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix uninitialized variable
Message-ID: <koye2ppygjsns56xxpdirz5s64kblqjhw264rmfqzlxsx5mzwo@u5t7m2vktfag>
References: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>

On Sun, Feb 09, 2025 at 10:51:54PM -0500, Ethan Carter Edwards wrote:
> There is a possibility for an uninitialized *ret* variable to be
> returned in some code paths.
> 
> Fix this by initializing *ret* to 0.
> 
> Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
> Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
> Changes in v2:
> - Return explicit 0 when no error occurs
> - Add hardening mailing lists
> - Link to v1: https://lore.kernel.org/r/20250209-dpu-v1-1-0db666884f70@ethancedwards.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

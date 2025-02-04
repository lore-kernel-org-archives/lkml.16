Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0181E1F949
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 00:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738630463; cv=none; b=hjJqzw6B6b9iXj6cJUPP24Qhi7cjGjCD7WV84sU8cFODxaoozFlsFi/4FigXiX94ALCxahgcUGfHMMYRZF7AqWtBgJyOT56TlCW9JtB8M901KqKmc8T2E1mITUf6ks5cnVVUbjtN8HhIiy7TWiF1vz7iEpLdeA2KR7mwnGj2tqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738630463; c=relaxed/simple;
	bh=nPbR6iXugTkhP3muYc+3Ub+Xk0LkHCzD/XNpZsn6oT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9pkZ5KUAJa+yZD17/uQGJ4hi6wkGhP1XkIN6QPfWJzuceOdSavwvcNJrcZOlZishV+vD8LtOcjU+RUFoct3zRKucJcLQQMilIPLG3J9MFRIyxpO7JC0u432/IHjL/w/rcc7hSmMVAT9l6qKzmerSmjuoEPlBGCawLgNFreKjrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=orOXQtII; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="orOXQtII"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53f22fd6887so5026249e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 16:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738630460; x=1739235260; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R6ZjpLJztPd/z6CugDEiLqKFmhAhr9ILcbNmlBzFygY=;
        b=orOXQtIIUlAaQ/nrdmSATf5ThuBMNmH4YAd/5cGR/gjHjCaodX9velYohGtHMz98YC
         rGVGN8jjzP2ZfEOXgkXPflSc3cetGmzCLkZPlSB6AZKw+ab3K7GjzfsIF6Y7R2IQEILH
         pj6e5A8YLgLtcEvxjjjR89N6UNLc46Kn+vWk8ssIz0s94sNw3/AXyvrnNtEtEYht/S/i
         1wLgd9ZrNNBnm/RRF3UPFUwug2teaGpSvzt6fuIzWdtwLS19Kpf6+JEVakHUU49r6RnK
         FJtBjn5PWFohto5oGyPBvd3/dPX+ySijX/cGHMn8YmiZQFRPOo8r8UdXtf95RySQupQv
         necA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738630460; x=1739235260;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R6ZjpLJztPd/z6CugDEiLqKFmhAhr9ILcbNmlBzFygY=;
        b=niGBoEGfyNhgV5nYG3x55VkNmZXxI/wTwHLwnQsBwkz+0Y/RQFovvpPFYoe2l6Qga5
         7fOnmmRdQgrkhh8mdKlsT76+nso8w/CvOhTmCwreuU/101vVeub2vXveMIUHRMJJVbkZ
         3Z4fKZ6J48NspMW8i6BR7QhDqclKD+M2v+9xtcjcXppaDetNACQLhLqlue+K7u9vo249
         3uXQyGRpTKThSvKKzHeZkvanC1zw3VpqqPjqRDutrCPFQV+ngbuQDKohpgF0F8GOSs4h
         PGjdVQXuqA442HOAF4BK8tQ5ggQh8Ht2sGeJ1cy5RbJzzNsi+i+Cfd+ISSBk46PBm23i
         iYWw==
X-Forwarded-Encrypted: i=1; AJvYcCVTE0+xWLJ7k3UigKrFgJGC/zEa2jmHGrMG6WY0fR7tYvd5tU0+B2pYEgVFY0/hlS6FHlqhsYEindpA82E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyezDovH5PVOOLnIN4KzVpa5UYabLe5BmpQhKfaTBk4XsdSGj8
	+V7smRRPVB5PviPDvOS4OVhaGxoYO9ajtpuwF33jgvO2dOMHTpzIbEtiuMngMX4=
X-Gm-Gg: ASbGnctekq8Ot586RrlGz6zIxhGcKwxub8YfvBnmt5mioAinbLMu17mvO8MBqBwf/GW
	U5oyszt5TPTE2ZKFLn8q3Lnq8S3IA3y+EuSJr1L9Me5TcZxrqGsma/MgOM/V1oX0guTFwUXNP55
	IH13KVv8ije8QBHtezy/QMMpAiQm1KxOOJty9T+Ar0YPcufa3W85iDZgRvs6tzYVAlqBEaydDVU
	FCchtz7SZR1cicPE1IALA5E+Btjy8RCcL4vQBc7mKzyDJGm2LaUzrkD9/ApQ5+E/tL1R74mcqpQ
	qTMhCMovsSGH3tl3+4SEchuMej+tA9igdLd7QE9yZnfH3N5wOuR1X8ymYHhClDSa8aw82+M=
X-Google-Smtp-Source: AGHT+IEpldiWweSia7SrDMC4AL51hi5zwa3/J31Z8ScFto8ds9fwqjC4+DaQa3FfHKj/Zkntym0SuA==
X-Received: by 2002:a05:6512:3e0e:b0:542:1137:611a with SMTP id 2adb3069b0e04-543e4beab45mr7511819e87.17.1738630459976;
        Mon, 03 Feb 2025 16:54:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebdf0ff7sm1435755e87.8.2025.02.03.16.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 16:54:18 -0800 (PST)
Date: Tue, 4 Feb 2025 02:54:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, robdclark@gmail.com, 
	quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org, 
	jonathan@marek.ca, jun.nie@linaro.org, fekz115@gmail.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux@mainlining.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/4] drm/msm/dsi: Allow all bpc values
Message-ID: <adm72vocbbl5n75eaf7kjosv37xxv42esnosnhshabznmqnsz7@mumtmgopeoxk>
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-4-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203181436.87785-4-danila@jiaxyga.com>

On Mon, Feb 03, 2025 at 09:14:26PM +0300, Danila Tikhonov wrote:
> From: Eugene Lepshy <fekz115@gmail.com>
> 
> DRM DSC helper has parameters for various bpc values ​​other than 8:
> (8/10/12/14/16).
> 
> Remove this guard.
> 
> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

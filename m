Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE8522A7F7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564024; cv=none; b=eupk+P7nte3wcAf6K9BkfE6kkVtKqRWyL10auOpRG1qlxAv6FPZW7/kJwt/q6SRgaN9na2nuLF4trmNzT1JHKYlpIOf/SmSy9JI8H39T6LGOkEc7fiJKkxu7BYpWvdOV2UkTfoIBehcxDAL1tVHeWUD5IlpyjJYJxDjzjLCEN7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564024; c=relaxed/simple;
	bh=sAHDnlVsh9DACsf+VM+FsoaDdca8H6W3GwhY3ytqgd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmepLAUZHKE9D//fZoFvcu7uhle8nK6R329X4tyDmkkW04K2s+/nZQ56ClfQNH2c/IItsWeXA2HQ8Wf9Uql8SqINTgSeX1p3zYF9BuWVHoi+Ys3SMYe0ca19bWKexh1CV+VLq9ZtsAw+pGoActUCq0AMlR/oR4TxRKDF0SZtT+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wieX0rP+; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wieX0rP+"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so278429166b.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745564021; x=1746168821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TNsUXqANAHwqGKnEjqoHbtxkzle5D9NAnbyrathgw4Y=;
        b=wieX0rP+bYsetg4USRgkvKyZymGxzX5F8UXIZaNu8ldo9rm+ZbcRsOs2msWfrzwehP
         Ztsf7k9dE8EcTYCpSJIOqhgRQiYi+VsOy4IjwSM1h9xfALFt5x/Z+Ao7m0bXFnrehi0J
         tDG+rAW7WkVqMtHi0h94YdDqeazv+Aih5Ienb4L2z/p10valMuWI1J2/y2q6c5C31AtK
         zxSzQLJAX8YcbVqNaJYkbXPYlimW0AJgCLjVP89av5RE6OK8EtM3+bB3DpUDnHuoCdnc
         yAJ+Q/TlhJIfJPMEo415at1D+KoVtuaSTynzzaphTdJkCFHUcKooUaiOIhA8WQ8Iq1FG
         RuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564021; x=1746168821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNsUXqANAHwqGKnEjqoHbtxkzle5D9NAnbyrathgw4Y=;
        b=uCA+TZWizWBm/xXb5/SwA4JeKcd13nbhO46ijWuV1Fc0pz2LCEVt0TnOH94fo+kruO
         xEnarpoQSa9Vo0omb6kxz73BQeazuhWhgfFJ080/rNv44wHCjd6c3EItq0uYNJGlzLKV
         dhk/ozXWdgC0UDpv/uKa+/GSGRtjl4C79EooH953Cb552jYvo9qrXw0uTCWniXcdxXl8
         COhmoItZEOjxZnLQiK4/LEMkEvxOUZT9LwzXJCXWNBdfj6D3I2sSvIzJjccHmmlLP+MA
         OyBo22SRmZ7HOleQ8ZcFgmADXz0MfkHBtZelfeUIKv3AcEn9I29gX1//kTfyZYmNZrPr
         /yNA==
X-Forwarded-Encrypted: i=1; AJvYcCXHS9AApChTQDzjpmBbI1G+V/e1t6l62nR9WqjlhGzIJ61Y92Pofe6YxNGxYOuDp+G92a+Or3ba0dLPHY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YywjwA+DbQPb6vGqB5RscyQOk0DpMKTrJhk41MRp9kPqnZDyYdk
	ycevvJrEqYOFIn51XornmB5+vW5n7Ikk6WrkVUjI9HrFx7Vw1Gw9kiXHDLu4Z2c=
X-Gm-Gg: ASbGncvCRbGlPoT957MO6vYfHG3GrtOEfrFRxShNF1J7R4fsZkQ5p2XgOQq0L7J+rNn
	cx0Afd2+G/cFPTa6dRbd6t5g1F9qB/8WZ9I+P6gUrVxisReGLnZCaBb1bl4V0T1aSMEbcT/8RkQ
	4i8PgM9SWDoe6Wj7QYSvdgkl/AbRmchjhvR+MqaqaOccPzeypSY2cBElSaOvdA3Bjs89zL7mQ3Z
	qILT0OsA5tADvHYG91ZTkQYjgwAvcnhkOfY9u3nptlHcIHVz0ocpvHRgYH+BWK++RMUcQyKdHAS
	i+Gvp2ar5HT5cTZ6vkmbvJ/nhvLwHqZd60F3Gg==
X-Google-Smtp-Source: AGHT+IGH00KXAycAkV9YoM6vqabPYd7he5htUrIMPdynMtalpRs9NoW+Upt9XSoJNqYWkG7Pm5b77w==
X-Received: by 2002:a17:906:c110:b0:aca:a688:fb13 with SMTP id a640c23a62f3a-ace71178f01mr114937366b.36.1745564020787;
        Thu, 24 Apr 2025 23:53:40 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8c9bsm84603966b.101.2025.04.24.23.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 23:53:40 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:53:38 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com, johan@kernel.org
Subject: Re: [PATCH v3 2/4] drm/msm/dp: Account for LTTPRs capabilities
Message-ID: <aAsxcrWyLeMB/Tdv@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-3-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-3-alex.vinarskis@gmail.com>

On 25-04-17 04:10:33, Aleksandrs Vinarskis wrote:
> Take into account LTTPR capabilities when selecting maximum allowed
> link rate, number of data lines.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

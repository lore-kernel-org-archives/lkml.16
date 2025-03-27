Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD40E1A5BA2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743062702; cv=none; b=TMLD7ue/mcOLoW5AxjZ1a0fWz+Vdy3NQlBCRn3zCJ/y4dOvJ7Jgdrbsc7Oezlpl82L5fiJQCeQ9BNHyrnRMMvmDHwwvBSNrBBR/FMaYkZX4nzprrCihYmuPZxxW7idYAg3g6NVao7mGMAWptRo5S6Ew3emJFai9cKyBtwbboCpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743062702; c=relaxed/simple;
	bh=dTqlr2hjR451m79Zo3X+DOyCdBNrJpzm94od0/6b/aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQySjeAKP8HRkUvetrlCThKwgnORSpoTgWb2Ub9R9FQA4QrB8aw8Mmmwis3OlZZbLcYTdB6BbjMXWbCd8SivXd9soWFawVhR5yWz58eKvLqwR5/ahTLU52RFMKUrRayFvAEr9SawdU7tcdCvbj53mFgwg/d+6Q5d84Z66zWRwFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QpwLfDs/; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QpwLfDs/"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac29fd22163so112972766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743062699; x=1743667499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j4HEgztO8bDb8osaU3P7mi3hTF/hZput8WpT0jCkOJM=;
        b=QpwLfDs/PMtUgcjUxc3AWrvbdVc94Y3qap3sajT363/vtEc9wh7m0iTR0KwsDy/79S
         XU5ehF9hlOp2yLUO/Zz1U7ZQ2jcP4obtIaLKmxQZft2l3ijN0+IAeMDlHck0A+7ZQp/c
         gxmEsxFM8tcMOdqWQaxM/PaXcQyP2Efh0Iiq0gIa9oq3akZVa1SJLLlmD3ivUoQvVOOq
         ckx5uaIN+JeywcL+6fhz2pmbdUTBWh7lzt9lm0LAdhlPBkf91fxJUFX/XJTQrnJAShwv
         uu0K0Ek1jv2jkKei4OGZcM0sSyaJhWcF8o/TglMOAuFgzKsNKTGTHSjguz6ob+TZUMhy
         7VIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743062699; x=1743667499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4HEgztO8bDb8osaU3P7mi3hTF/hZput8WpT0jCkOJM=;
        b=KBBdSto0dGXhzS6SnQh0cK7GlMhXSSF/UHFW136pEDZ4KfMvwvf3pGVqPbPS6hkIkI
         AGHZp/yOL6qcRSAFQ5vcVFgYg6Pt7Yfm55RdTm8WyEZbDNqgYmsImEKYZKkJL5qrZoKE
         BLX0nKZNOeJPSYfWea1bDnJdxx1q0a/7xv4VsRBYh6a7JX1ycVgl/gtoJvhmLo881MC9
         i9cMZhEWjoKsbbQa6vOFbv0HwdjD2lZUPN4i/UiU3QbBdaZEIN1azYq2yFsHmHSGNJwW
         o4hJ5G09SIIDw4aWNuslFFcnwba1ceWSeuuHXs387x1zWDrGjKMUe4LU4//Tu1s+z+2O
         DAmA==
X-Forwarded-Encrypted: i=1; AJvYcCUnRQEbXGGVbWHwHec5dfwMVSXOsIez04QOU4M134s5Ybyn1nPPeybm6qzOozN5QlpPbDv6E4dgqkTnunY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz639aTp2OZI0abmhbtso7B1J3/qx7mr+4yJtvOK27sp1XQNW0L
	2nR/ERkQYW1fQD+3PAIgkc0Bukvsvr+JclBiW8nZ9DGoewySOkgYmd52Hl3r9Rw=
X-Gm-Gg: ASbGnctsyurZ7XKlVZawjOnz5eblPfu4szqFoi2WBTpk7PTkdJFMfbavS76cmI26Zht
	mfZ/5eQ1Kwzo7iNFlGdOka2/+eEN5pxScEWuANPAYi6Sb8xpyl0UKoaANWbvKxMCA8KRc7D7oob
	qu1gXY+EQXjEUl2//fLrF7aJtNsO+ryOhWEnwzex1oDamywSTyaCT8ayh02DTvI6/vP+GP0VL6v
	RalJIHzEohILtubSvZSqz4NzhJAiJuSzzVRljIjXp/OdRdGuUDYh3NrdY39FbAsaBxQ2P3YsSc0
	m5M0du/PlzCIDQ8xNYAggjqmzob50pp9Ys8AvmxZIQ==
X-Google-Smtp-Source: AGHT+IHnwu/C7hwA35ZgXejtLeIFJKtAHLhv7l8qMYpyk9Q+W2Ud9zHdHAz/RjHL1R8rTdvL+rtmag==
X-Received: by 2002:a17:907:6eab:b0:ac3:8790:ce75 with SMTP id a640c23a62f3a-ac6fae47cfbmr238239666b.10.1743062699159;
        Thu, 27 Mar 2025 01:04:59 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ecf76fcbedsm5182752a12.67.2025.03.27.01.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 01:04:58 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:04:56 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Rui Miguel Silva <rui.silva@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/dp: fallback to maximum when PWM bit count is
 zero
Message-ID: <Z+UGqItLubQ9kwF+@linaro.org>
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org>

On 25-03-25 19:21:29, Christopher Obbard wrote:
> Some eDP devices report DP_EDP_PWMGEN_BIT_COUNT as 0, but still provide
> valid non-zero MIN and MAX values. This patch reworks the logic to
> fallback to the max value in such cases, ensuring correct backlight PWM
> configuration even when the bit count value is not explicitly set.
> 
> This improves compatibility with eDP panels (e.g. Samsung ATNA40YK20
> used on the Lenovo T14s Gen6 Snapdragon with OLED panel) which reports
> DP_EDP_PWMGEN_BIT_COUNT as 0 but still provides valid non-zero MIN/MAX
> values.
> 

Nit-pick: AFAICT, there is no relationship between this patch and the
rest. So it should've probably not be part of this patchset.

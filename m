Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CD1194A59
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738947511; cv=none; b=RWhW8XPXVMpLtl+GA9lOLeePE1E+gs4zN+PFXn1dCi3bIAG5I77W2vVJ/uybxhRKnmAdy1nTRe1skzcVr7yUVTw0EZa49KsyZJYk8Hf1eXTfj5LFdufPU4mFJnL1iXw18elQcWbUYTvAggYKhZ2flenbwfASqAuGRKJyB7Ad/1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738947511; c=relaxed/simple;
	bh=UAyzLXl206Hka+nZ4mitYd2YFgx9SzlgPOsj3Cg2FRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R90XDPFxjcNWEfyE+03pU2YSjI7gu/gRqmwqponEF+QjsZbNjGbLO+8r9OgDwW3JJNw1P4PcKYg4DfwBI3YTicKDSokBWgqK1cM2kxky8lr/YRRxZJEOJuUA6sBiAg5DyTsHi/nHFzANIj1yN0Bks+hfJQPG0wkYRQJzn+Ukiic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pldazPaA; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pldazPaA"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6f6ca1a8aa6so12556407b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738947509; x=1739552309; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=27oFQYf91Dloj6jyxwrUr7dxmGXERcb1UW6tbtKiP8g=;
        b=pldazPaAMyB8lgcjEoooGdIFoK6DMROt6eFhQiCjuQKulCys/HT/OFnIvkIee2qdT7
         djAlhX+1eIpGDl9BX7onjSw09ZxJESTShdtM+jiosGPh1331VknIITKRMzLpSOX0fPgV
         XFQbO3V10XxEX111yDAYlHo7n4LXBJW81K4yYVQX0iNMxcnMV8ef0xUNWYs9JY5xTeIw
         q8im/W5ufTwqBBCk8tcUHLgaSV9Wl0OYYxnh8vg6dlaylwhG8kkai3JnEFwIh6+HicuH
         4tn7U2KwAIXDkpQ21ibaVp8+6idFPMW/ism7sAbIwj6XTAf2+GGLvHKilxuutTv6XEbw
         VBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738947509; x=1739552309;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27oFQYf91Dloj6jyxwrUr7dxmGXERcb1UW6tbtKiP8g=;
        b=gVcc7/GN7PN1WhBs6mloSWfhVNZ9QaoXxHYUHZhtqdLrnx22E/2kqdkmgKQgM09J/r
         A2pcqGl8KWVaZ6gCxpRUb3Qf4owQ6TUJ4r3z+6UkjREgPQKFvXR7aotkX0VUalIO9Nqi
         vdrpqaRDaL4vITfq0qIsZDzzuwAQ2wEohV0ylEdBWWGTLbuWewB3pBtxQSSmW6U9TEhP
         MALc0tnJ78irEpHW5459K80LZIsVuLQqC13JAK/aj+eVsE6VFIitpH2L+1XQTwVfKk6r
         5GCJk2i1WPFUvuafqGtKtCO3x0dry/CdUTp/OjEvl601cP8YmWUQ96cZrElFdfhJgOFh
         ///Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBA33z+Hq9TyTTyWE0No9xeg+yoNNFS7xWu+cmMjhsTb0RErNIc3kU1DAKEdL2IO9WAvi1Zo/F10ak9m0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxsYgFQl1ClRDGf25zC1VNOpmwurJNz2Kq4Ij3N4dyVjEYTZuI
	QboPvSTrpsQ9xGpoLPjMyxXBGsNxkCZ4Q+xbs606gLfN4JQo/0BC73aKN+5RdrX+x1AIqw9jIXu
	7/Jvj7GPz4Z4KruLzcfhj1QBJbRbb8J4rhRsvCA==
X-Gm-Gg: ASbGncu7MLaFjrGNLsiy1LkHFOcttkGR2DmLXp4Lfr8KQ3Mnx9ODm9LnFZyC8Y1kSa6
	UITnAxCny22/kPBJ3jDks8gxeSb/9kSKYO9CzM7F6R19TMnpjUpa0zXxAuEQ783JhmSXLikMixw
	==
X-Google-Smtp-Source: AGHT+IEu4Hyrf15nRFOfu+/0wIU/F0sEzYBhEg4wPUS8216Hy1mszoPNBAKnenIT6vKlzaVZSszBdgs4MWDyXS4Mfe8=
X-Received: by 2002:a05:690c:350f:b0:6ef:8296:359d with SMTP id
 00721157ae682-6f9b28ceac3mr39041717b3.22.1738947508975; Fri, 07 Feb 2025
 08:58:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
 <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-2-852b1d6aee46@linaro.org>
In-Reply-To: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-2-852b1d6aee46@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 7 Feb 2025 18:58:21 +0200
X-Gm-Features: AWEUYZmBPR-J1PCz9MhgEjUk9CeBfh40TL1EHs1HVsEe3GRaQwWTHGmL1C1gm5Q
Message-ID: <CAA8EJpoLnHfOEH81U=fKuL1vOvZss8+zYRFstXp0JZLQy2OX+Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: display: qcom,sm8650-mdss: only document
 the mdp0-mem interconnect path
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 12:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The mdp1-mem is not supported on the SM8650 SoCs, so only support a single
> mdp0-mem interconnect entry.

No, please add cpu-cfg interconnect instead.

>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> index 24cece1e888bd35f169dc3764966685de4b6da1d..cee581513c519924712c7e0fc055099f886d0a99 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> @@ -29,10 +29,10 @@ properties:
>      maxItems: 1
>
>    interconnects:
> -    maxItems: 2
> +    maxItems: 1
>
>    interconnect-names:
> -    maxItems: 2
> +    maxItems: 1
>
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

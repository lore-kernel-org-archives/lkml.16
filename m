Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C80F1922E1
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738947555; cv=none; b=pt8tQu3T3xzzB9YuJM1P4TPok+9niG/eMsoc6h9wgyHm/XuCCXZBmRQ14JsM1eITe3boEBfLMJSWSTP8/gPmYHsMXsdtmQHkBFLXNGwyx/qZ5B1jkXVFENtuABfY/naSFy2+cXhyJI9bgH3FqVHORs/vd2HHf8kXIRHljfl9NjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738947555; c=relaxed/simple;
	bh=XLDucNr2s31cTCQXDfFXJSf3YJUZjOhdeh3BRQjtjfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HhRS3s7g4Z3FF1tPdW0eFC3CPwmjA4OixT2zQ/xsbPdRHp0qAZf+B0FkVUsE5xFTZJEYZEx0fotHNND+pXnOIvwVaA9FPwDGiVOo60vvMhrI1dnfdP4dwXcFz6UjY1RNiytc3udheGoyBT98o9mDObOx0ks4v2GDu8cahFFD798=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WCiuPhJ/; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WCiuPhJ/"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e589c258663so2464048276.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738947551; x=1739552351; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JKMHSngceKWhs09nWrQfjUrr/IL4+HaHfvztvz8mcLo=;
        b=WCiuPhJ/puuFHqitnraI85KcUIyMgOI7pFp+FYAx7zK8vbVB/Hi83s8PFHyebjPGGi
         ty2RMEx+McQZU2sdnCCJKLir6Dw43ViL9tHy+nGcgPrdN7ScbebiguVuh95lVl6GDNU2
         ZT/eiEStBH+xIlR5IKOoisbWKBr8LjUib9nek8EJUswgrgdaMLiwMeYu1Ued8FJxntb9
         BVozhBMXo3iRgdTSmy6dCbE3+sk4YqqWSPzRH2wGvMSEv5aLa4l5b4caZddQDkPuxphs
         v8m6rc9V2crD/l1aQwEsOIUoW6Gk6hO8R2OFtKOaa7hoaSqrLW4KpDK8akFZgqkYAhUt
         L8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738947551; x=1739552351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKMHSngceKWhs09nWrQfjUrr/IL4+HaHfvztvz8mcLo=;
        b=phdtB+5AysExHtkCk8H3chK+/EJdiPYN66piSLy9ou/xoHlgiWjB8FLn3V7CNwqWWc
         qKkQveQLXoAC9sbUA245Ry0VdrtqVPtIvaUJJ9Yt/gfThWpZXL2onaiOiq2saHVMx2EM
         dF9Im/oF7wCjYbcvnW6GoN6UXNHZaaY6L8mPpE+0iI/m5KVkd9J7UYxG4exJH1WJPbU1
         udlRrJasRwFUvne94YOjQ0U5n5h7cmmGLB4m4NrxWrPQt0tzN5KEf7W/tszjeCDLoQdM
         T3IB21g1WGlmC3EUyedLoMgl1zquOE2zXirykSt7KwuQaI1DO2dDhZMrY8zH7aGkTTJB
         CKdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXayqxOrBeKhSkV9MLaED6f9bXaJ9cbsqjsQV1nohZTnsLpdEdOne/EiseC+y8npT3jB3mEhHn8UrZCrX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ9zLq7sC6bTXgE6s19ePegfXJsBFNAqJA7uZFjXYj4rsGiRuA
	o2JugPmVtcYqfp8m+N/YbytMAbX7zpdeu+Guk61FPkpd79rwlvtNd8y64cFD8NPpO7RPNr81Pnr
	UgX+7z5PqUVAPsY6qvSMYmAtKnPJD7kW9A9GEGg==
X-Gm-Gg: ASbGncsg3KDyQ5EFSN84fNL35kjtGZlrqtkbkqQKn1Yy47nJGiWDpbZ/9zCcZnjQ0HX
	g7YgFu4ctirvQTRKnkRAePSxONnddNzdi5JhKxif7U2RDRfr39msKEIBsmTR/AEIdpV2STE9uTQ
	==
X-Google-Smtp-Source: AGHT+IFbaQfX0T9itZHt97XrDniKr0h1sCRIXUebFUDmityl/mM6edqe+O7q6s7rU645tsgRdF1l7Tz+EiLmeIjEZ1c=
X-Received: by 2002:a05:690c:7307:b0:6f0:237e:fc67 with SMTP id
 00721157ae682-6f9b29e583dmr35319597b3.23.1738947551532; Fri, 07 Feb 2025
 08:59:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-0-f712b8df6020@linaro.org>
 <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-1-f712b8df6020@linaro.org>
In-Reply-To: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-1-f712b8df6020@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 7 Feb 2025 18:59:03 +0200
X-Gm-Features: AWEUYZmNMwbk9eX4OjrXiHrM-Aq3WX39qLfKyYBqXNZ9vycYPBQwR8HodH7ba-8
Message-ID: <CAA8EJpq5bLTfsEBPNzJ9z+KV-oXerr1y7g72A5eWbotSk_Nrzg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: qcom,sm8550-mdss: only
 document the mdp0-mem interconnect path
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

On Fri, 7 Feb 2025 at 16:02, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The mdp1-mem is not supported on the SM8550 SoCs, so only support a single
> mdp0-mem interconnect entry.

v2 went too fast. Please add cpu-cfg instead.

>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml        | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
> index 1ea50a2c7c8e9f420125ad30a80b4ebd05c9367a..9631fe11c152449f3dfa0b8f8f53feeba721c950 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
> @@ -30,10 +30,10 @@ properties:
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
> @@ -91,9 +91,8 @@ examples:
>          reg = <0x0ae00000 0x1000>;
>          reg-names = "mdss";
>
> -        interconnects = <&mmss_noc MASTER_MDP 0 &gem_noc SLAVE_LLCC 0>,
> -                        <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
> -        interconnect-names = "mdp0-mem", "mdp1-mem";
> +        interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
> +        interconnect-names = "mdp0-mem";
>
>          resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
>
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

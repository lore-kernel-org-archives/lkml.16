Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDED367
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 10:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748170139; cv=none; b=P+29gfCoRL9VOlxG/Z9vexuAWwRKsvPRJlKSjeFocdr5F4ODxVWiTohRDZIYqPMg7YqYvBnx1VgxKcGx8uCzGh9bkgLuniNVfFJx6g5YuBX+8CbxC23uVKxzivsYHt/cMkAO4orQhZaEF+kc4IC+3PYqOwD10xu+poXy9XtTnCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748170139; c=relaxed/simple;
	bh=PfOgIElE5pq0uCyaPuIg1zUcV9z6TscBLmCbJ/3yXOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=an3LgZ5z4l+2tHRt6lGBymEwg/hzAX0tCBF1DVji051CXTa1Y6QC/RalmkzlSdyRtg/OJLPc8oPNmCitV54x3/QMgh4zQHL7RDUl3juuX9gaAFgZ4YjUE04pRXm7bPnOhpjQFhvvknXY4LZpTxVC2eF8nUL6iEKuopjvcS49LPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=glfrNzCg; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="glfrNzCg"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4769f3e19a9so7316851cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 03:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1748170136; x=1748774936; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FvMZwrrK4O9JD71L3DzuziqxKKZYlUuX09bTEYlT1Yw=;
        b=glfrNzCgcEDYE6kd+Ur+dTnZTJRqAdj8K6hw5HLXm6mieJYAB37sXm/BQIG7/yOfg9
         LmIFjd/21QwL5jlhfn+mrCtXfI6OSMD5JhRwTdYZycsCPMmfEHAXBgTN/8XjICollbVU
         JVqNS0+1SykNvBiZ6uAvLne0CHMQ+gjo4M2+YpeiHs7euuHj1acYlZUhuXc/xH9n7Uy/
         3neyMmStvpvw4FF4mBAddLnhK8ksYLmjl8PKOXWJaX/r2OlYiXEV8qS0YeB0CaWfprq/
         O6C+7N4oWWF8R15hi/rgHhfE8DtTKg2PdHi8/Dt+0rVNirWOXzZnA/f+f5tomIrNzBSq
         BNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748170136; x=1748774936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvMZwrrK4O9JD71L3DzuziqxKKZYlUuX09bTEYlT1Yw=;
        b=I30YLjgSMfGOzXcoM3fUzJ5alarWyYKLE3YwJcs6ze0roaPYWnYCGLTFYR0Lw0/k+f
         LgAgO74ULhM9iMBmym/eVxbNLJdMcuuNHLSNt29DPfc1Xl5Y8/9ItJRuInVzCgLfe+9S
         p+gH/ZDpf/kAWCqJtNz7FdOUW8q39RVb9R2vK+UDVo0mc4hB/eh0u2sJhoUidPJSs+xd
         ems4WTZjKofVisOOeKEyEWUG9iCHijVWCQ6X6y1hz/GhHGMh8fr4OsHGqAkPCUAqeQlR
         CHrKC2LrpE+UciZbxxkHvQLEuScDrC+9qZpvZwHqXyl8s6UlioUOa9nr/lDW8fWg22jp
         XMFg==
X-Forwarded-Encrypted: i=1; AJvYcCWjEb51ZPkxL/DgvDaaTzj3qHiOEDNHW3EF3hQBdAb0zh//brnFggtDi86COnVRjTN2E6sE0rBfw0T4vdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPvt01ic5PHEH1m4IRukccj7uTK3IPxsNhdcRMwERi44IYC7wq
	bB9Uw/Lw8hnrlxSQ02nLQod6/crRtzS4svl2e9vA9NpmnW6C3fyKsOMRqMxDSt57448ED64KbIS
	Wv86lC3mwl1yEYtWrkC9sBN8VtquWyAJ4A+LHexhNRA==
X-Gm-Gg: ASbGncuoU3XNstZ8T9dqoxuG7VPFzoSIWvmze8shlZpyRr+sOztSl5Z4cmjeZseT+Vp
	25LvFQsamPZKlFciHVposmvcv3MrV+NVVOEH8iH81oazUiSbK3hggDeA5JQj/UivicLDL1s0hOo
	bMH0GwoCNt+8ckMk+96q66knDEy2AmTqreIMwoC45T
X-Google-Smtp-Source: AGHT+IHfLSQWm00np5MOUI9iSgjHG0uz8ZjLmKg3AyhQjzrIGk08erFcga0ZJK90E1+3HR6kZwenz2fYr+3ziRhndi0=
X-Received: by 2002:a05:622a:488e:b0:476:7d74:dd10 with SMTP id
 d75a77b69052e-49f46750736mr95207921cf.19.1748170136440; Sun, 25 May 2025
 03:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sun, 25 May 2025 11:48:44 +0100
X-Gm-Features: AX0GCFtHF5h48b9Isl1N9tQLNjTjzN8BGszS3KNow9_vXa4svv2OiPk4eOV2_U8
Message-ID: <CAPj87rMjAv-UphvFuQjop60o=wHrkfs4-XOM=JqH7f8Kk5dyVg@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: mediatek: Constrain iommus
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 May 2025 at 06:16, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> @@ -45,9 +45,8 @@ properties:
>        - description: OVL-2L Clock
>
>    iommus:
> -    description:
> -      This property should point to the respective IOMMU block with master port as argument,
> -      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> +    minItems: 1
> +    maxItems: 2

The comment removals are not documented in the commit message, and
it's not clear why removing information and references would be a good
thing.

Please see https://www.kernel.org/doc/html/latest/process/submitting-patches.html
for information on how to submit good-quality patches that can be
better reviwed by maintainers.

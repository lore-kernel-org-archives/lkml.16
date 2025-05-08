Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640EE28682
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707934; cv=none; b=spfjVRWOrnJVTtYAT9VrEoFyjw5yleppG72D84ebx4ar/8Xx9L+e0xN/dVs1mDtELtioSeopc7N1YaEYFPoJSLyxsqSFael6tdor8nSyJwCMvxylY4p1G1TG+vcDUjACHfFTGRKvwdfdMDzSwqYJWJqPF6eCVkpRV7+iIasvAv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707934; c=relaxed/simple;
	bh=ym/GGePTtcR6pPbHuXLLIC6Kw58vqtqImYgRJwNLr5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeOJiNkfs1KrKelPyJUn5tedEueLjDa7iSCFDOAB+pOWQQD9djTgMMf2vXLLy9B3wnYB0WrT9I/M7Hl/kO+DljghPyh0UVWFPrZ/hdQh/89whxSKeP39HUBkzNOz5a2n6s3SIYp6a8sKfvaEE+NipEiBUpEqkyGN+9F/RCVf9CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wDMkLU/i; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wDMkLU/i"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bef9b04adso8250671fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746707930; x=1747312730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ym/GGePTtcR6pPbHuXLLIC6Kw58vqtqImYgRJwNLr5w=;
        b=wDMkLU/iBTSt7ygMLhPJEzEH/GXw1jl/+0nNoklo5RhDLdpBZSGSCrr8ZMFgklmJa+
         JhY67Wnia9PDKosZAf5iu4OQMMOhdW4SjOwZuwI2EDpogZEMCHQBtqkPl4oWenmw/yhW
         Dwmt7Iw13Bz8HzRgb/SbHG+mnrNxDDX5z6Nq0O3v6maemtAnnG2hCgsdWn1JKAWmVed8
         KeQ4/thfr0PFE7SFP+ovnUN8TsWWyOYHHWaUiq4uzICkRHwephI/hwOK9yoJB2/epGyt
         8DJmSZZ3r1WuGwhmBMqWVp+cplxie10DV1UbR0GohfmIy+jjFZ8toG/h3enhAvP5eqBg
         EU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746707930; x=1747312730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ym/GGePTtcR6pPbHuXLLIC6Kw58vqtqImYgRJwNLr5w=;
        b=IKa/X5ezQ6923xOwJtIuYczfBTIAewL6pDkxh0bjogQ+7p/xslkDjh9jVevFgM3mJO
         duJRT27hmeSn0a+0yd7O4hkFTtdY5zqae0oxYcXVFJvFyJU2G62oOQiJY18ZMhJ1B49+
         m7APpTAEJRuiUptSXz/M1FQpgVOurdZvcul+e1E8dSqWwpDc/leUr1YL5BI1nGFxGPqa
         8axY6lfec/E4eesfiwZsrMOOSuwT7xL7XEZbE7vfbOWVRO4N+HCn/M6h3IRGLtJbP/jW
         V/hWfHMMGuD1mnOdADEo68JYjwU/YGcrP04gLxlifQiyel9gOxX4d4G/UKkxsNjxMIvQ
         5GtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB1u3f6D26xAc9E8cUkAMkyb3cs4tUpkgm90iP+bGEb4zRkX/d7P7NvIQ8tBn4TC4P6SiiHzMQey1j5Bc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjgPVDRtfaLMG9sKqGkjx/1LQ5oJNc4/FpwlUkOfAA7IiBG9hU
	09jL8pa373TQm0hInlPTSxEyGTSChi9LzVPlVheq+FbSYvt6r3SNDhTG7ELGXrU2bJbBCeYQqc7
	UCxnXQylvbyMl/rpsTB728NhKG4pb/EJk5scFTQ==
X-Gm-Gg: ASbGncunRewAADwpOaycaR4PZlpgeh6YdMrzHVZO24fg6ASu+G4Ju2bv0x2nNaHyjJ6
	L36ofY9/BE3WZgJqGWM+0PSqZrjW+TIzRG0H7W4A0+dhrlPa0PGFYi4m5KeiRLDiewN75Fz4Mfw
	8dYWtcIFDgaaXj13CNOLTSYA==
X-Google-Smtp-Source: AGHT+IGJqMyrmkCUIQDg8PE9y89S4un8Sptn+ne9CkBnqLfvsuKGyDCGNoAKWRWwcnckQHjTgl6OjpG8jsiCqQsITZg=
X-Received: by 2002:a2e:b893:0:b0:30b:d543:5a71 with SMTP id
 38308e7fff4ca-326ad17460dmr28868011fa.1.1746707930459; Thu, 08 May 2025
 05:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506092718.106088-1-clamor95@gmail.com> <20250506092718.106088-2-clamor95@gmail.com>
In-Reply-To: <20250506092718.106088-2-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 May 2025 14:38:39 +0200
X-Gm-Features: ATxdqUHd6nS8kMJuc0f8MXMDIRZHhCR46AYmqFnKzqCQqTYWz7YZni31Y68Ocio
Message-ID: <CACRpkdZCv2RV1ioXsuJnLHsiErbrfv5jjzvPWMire94+OznY2g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: panel: Document Renesas
 R61307 based DSI panel
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 11:27=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.co=
m> wrote:

> R61307 is liquid crystal driver for high-definition amorphous silicon
> (a-Si) panels and is ideal for tablets and smartphones.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

I see you have gone the extra mile and deduced the underlying
display controller, excellent work.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA9D28682
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707989; cv=none; b=rBA6KYHNN43EGjDlLNmvFaUBA6/3tlQRuiL/SDIZ+VfWi6zSvjLO4497Cu2NzZUytbkdaG77geY+4CtABrOD/d6Rt71TcJvNH45/HK9J/ylVaA8DjC2lFGCL0r0prBUtAff4Rsr9M14w3r7Tz1Ava/t0Gvmte/UP8O2kcAe9wfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707989; c=relaxed/simple;
	bh=nYbRnTvngXL8TZ/RUSCi51dLsk/tokgb7Y1lJ3Uts/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qIKyg7T0uOS1CrC9MFKW79VEMNrfOH22hGHhYVgM+FNJKAjDpY9i+NJhu1zSpqGBqmcWxUphtJXGvInvBgdiXfC/3DieHgMVw3ub3TXSCESenc0oEUSxtcU3XAQMcK7qNx7kD5OrkS5AM7mBO/uyHujOphaoo7+gmBESYxEMWCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UTLmdOzG; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UTLmdOzG"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-326bd400027so5063531fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746707986; x=1747312786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYbRnTvngXL8TZ/RUSCi51dLsk/tokgb7Y1lJ3Uts/I=;
        b=UTLmdOzGPrj6UjhbYEdkhavjUzTVOgPjd7Uogb98gu8A6ff2sfSKQw5w0EiWQ+zwev
         wSZrVj7jsCRfN7VqxF7dTAA85td/glGN6tM4S3iIvNqAvX4Y62u4sBVpZYhlgs2fQW6G
         s0aen+4zFw5leBj7jL3yOhVMINnAGwVHW+hLsdf0wyN242d73PKIXVBnxbxy3hjIt1XJ
         4P2v1PiheM97uWYoI2q1oy46mAHvuY0bmWlZZyhgwfDfxa42NJKAJxI1NXDAOYwknxQv
         6+GBsHgwdSh4gmJxXDsWMvTngz/H5eTDI1ERd32DOh/y3iIyBFHTWscMijyBW7tONbh2
         09RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746707986; x=1747312786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYbRnTvngXL8TZ/RUSCi51dLsk/tokgb7Y1lJ3Uts/I=;
        b=cPE1QlwMYG/fq8dtQuoN4xjxbMJH9EAmSOFI5s3oAe0Yk/aU6j0B2qfFfB6j2u6BWL
         bcr6mvW1oJRESR5ykCIpN7fqWUQUMYAs1yyp39W6mMz0p3GqhXs9izz22ADrapSix3aM
         pD8NytzksZJiXcHD8e/H+2IRExP+OKNLMKYuxIgpA9uDfjwvDvEbVYZZc2F4B0iFelt+
         W4tWEEuK0zWhph4CWK1QjXYP5oAyEA+YNDhyCHuTykD7wDo50xeoBuSyagoeZJdsmhT5
         mAbt99fmdXH+fMrv0HIPjcRpQlbXT8k1N5DuENEcj/+UjrYrIxXf1JXujFW1rUSx1pVV
         T3rw==
X-Forwarded-Encrypted: i=1; AJvYcCXT3ZGOSG4SC8Skq+KJSB49n4SW8Azfupx45WzQMS46o77Az9agyxB2npDBfhZAUM2L+mcgnhU7UR8Zgk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwenPVOQMWB6K+6ArJBX3pgw3KnSiYprFIgLVrZVr3k8ox6tZG2
	PSODFqdlfvg3HPsbXY5eYMcSP0GtuBBsrUuYGeV4ieuIEYechePN8nsxksKAMnw3LVjaoAUaCek
	Hb9LlYq797XzAxRE6YB0uFCj1NM7k1ThtHI1dEQ==
X-Gm-Gg: ASbGncvP7VSzPmFQ+vGw5Sr9n1zZEu98NC9yDroBnvRRtwZACHxvKjNFjxmboLsz7TQ
	nLaB77phKMqCc5eF2jBxsRFkPddFvEq8jda06KVSKlU2G9vFfcQQehN2qFoq8HeHfv7E10mbT1A
	wzgJ3TXd9XK+ULlFTDVSyqyg==
X-Google-Smtp-Source: AGHT+IGq3VdGMjg8OazCCc4CII0+nPRQNZ01hABaFqWf0AEHwQm7ayKUJesfbQ6Em4uNq6qZQ9GpKePgPTEqMruD+oY=
X-Received: by 2002:a05:651c:1516:b0:30b:ee7d:1a88 with SMTP id
 38308e7fff4ca-326b75c3463mr11198921fa.10.1746707986261; Thu, 08 May 2025
 05:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506092718.106088-1-clamor95@gmail.com> <20250506092718.106088-4-clamor95@gmail.com>
In-Reply-To: <20250506092718.106088-4-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 May 2025 14:39:35 +0200
X-Gm-Features: ATxdqUGblqi1KlMDIXY7oub3qeO9KDXkWp2T7tIpa9zxqTaWBLntJfiKyh9725E
Message-ID: <CACRpkdYo9ve4ERJ3Qv92eZW-ODqjhD-gxZ92T2hZaD8NJ2GErQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: display: panel: Document Renesas
 R69328 based DSI panel
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

> R69328 is liquid crystal driver for high-definition amorphous silicon
> (a-Si) panels and is ideal for tablets and smartphones.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BEA1A3172
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744018491; cv=none; b=NSGCSCs3TOlO+zN7AFHE7IW0+Zlii4/lvjY8lS9UxHAt5QwnXBKCD3V/tZhZXRTVNXB9GyMHqFCNPkRwD1DJ9tm7DAhKdVH63jGMOwV4C39dWBMLlkQwuUPA9KRINsDd5xH8coH81I0GDsjGlEs58rBoZyUGD+89oT4AD/yUOa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744018491; c=relaxed/simple;
	bh=MwrRsdM3aIoWT2MJF4GXjYqn1+Hiyvia31/nPwS1dl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mkchMuPwJbOiJWPiq3hs40cPKGkwYBov4cZNSWYxNXbtuJ4vzMTky5oDDULxfnnd3kKCLIGPfWt3Z+5KP0xgbjvDF0YFgYtV7DGCAaneG82Rj9UHbpNw3mj3rUZPFMKvR+c+aPlDA1ztHRrb7uK7rothv2ltXpHdgGnux7UZTA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZ0q9Ee8; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZ0q9Ee8"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso435701366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018488; x=1744623288; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MwrRsdM3aIoWT2MJF4GXjYqn1+Hiyvia31/nPwS1dl8=;
        b=IZ0q9Ee8qUl3bTMujp2ZOrHGxK/FjE5cDTBvm5wDGMLBX4WjaOsE8SKoJpuMcDkkb0
         JM4ywuFfxTQBhlUknJjt0eyf5+0gHswYAouoK5l0Z7/g3ewvVsE/Pa7I7pGUM3gl5381
         Dy6wA4IFcv1s7PFwh9809GK1shz9vEQxesHDdYzUYaCr+F8Ek9jqg2ZuQww3tEmy0yNP
         kZdX27nBnUQ6cI1JNHedSpxLiatpUx+VZPs1ss1kcXMpLKQz+RW7lUsw7qduOQ5t8eSl
         aImySOK21re4J5Pbj3cMLW84ay+5UhKugCrXaf59IkKKNfNTkabXmutNNLWCdEX8z91L
         ekZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018488; x=1744623288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwrRsdM3aIoWT2MJF4GXjYqn1+Hiyvia31/nPwS1dl8=;
        b=tF1zpvPieq5Pqxlv6Uo22FopoBFq1OGMlPPSsVYCGHDKyJK5kGFV9oYrNdoJQU+Qpg
         O8UUCqOtpeAlCOKVmRLWL6sXBzrh3boG+MMfmo3Y9D9H9mhrhcLRSbqWTndCideYsx9u
         w7hccHEINg2eXUStTcRhdREDE17JzjwbJciqyPRegfw4h0g+cEWwNNECxsMcqGEkF0Lv
         IqilN1SKMtWVhlPtk1+8wPYxvTObr9DCwR3iBFpb3cVN4wU/d7CWf254HAqJ/KsDzKCL
         LPmy+BshmuWWeqhgUmn+keVvgKm3jeEw39Jt6lI8LpfX9hw1rylt7FPavI2Zy6nNLu3x
         As6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnkFyfrkvPRIgrbJWQFo4Hr2eb2S5e1Nrbik81m0K7gldVaJ5NROEinw8NN8IaG6UTuHShROxPZrmkYw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxI7SYu0F6yMK8sOtvuPVjjwXfbQ4iYqagIUtBIRSNMX8sodMo
	AUf9e/MO3IVFIJUOayPEWfRghplthRbLoBZecXsnk/c2CsTeB1YfSgF3L5vXJWjlW7e7aT3And3
	ybeqwXwVEJ7v/KXuELSmj9Jr0gi0=
X-Gm-Gg: ASbGncvzRCa8tpa33S4YAMCG4LWOgCccqS1rf4U/gEnwUYyYMaQTL0G2yggDOhUCdlr
	qqbD45Dzx6PLC5JmQbkj6HQg/1gdqMzQSu+QMiIGyxW0l+C8b4K8i119GpAfGr+TzFqSPDJAVhg
	D1pp7jxJOeARylrggNjiZChzLNI23l6n3CFm2N
X-Google-Smtp-Source: AGHT+IHn/mX6ZYCompw3Is2f0TauL4C1VFhf8kSEN7pGoldfJnQSRw1eyX++36PYytRGjJUyVlLNUtNmngJ1zFbUZH8=
X-Received: by 2002:a17:907:7d8f:b0:ac3:f0a3:582e with SMTP id
 a640c23a62f3a-ac7d1c37ef1mr999770466b.41.1744018487455; Mon, 07 Apr 2025
 02:34:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250329190712.858349-1-martin.blumenstingl@googlemail.com> <20250329190712.858349-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20250329190712.858349-2-martin.blumenstingl@googlemail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 7 Apr 2025 15:04:28 +0530
X-Gm-Features: ATxdqUG9MXYiG2H6XFiLtd2u9HtZkKwkET88kA5iXy2mhg8cVJJJUyOTBzVFkt4
Message-ID: <CANAwSgQHVmd1uaZpVmOJ1+ECwu1HQsKQwnCT2ysPBbi=16bbNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] phy: amlogic: meson8b-usb2: Use FIELD_PREP instead
 of _SHIFT macros
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kishon@kernel.org, vkoul@kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

On Sun, 30 Mar 2025 at 00:47, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> This simplifies the code by re-using the FIELD_PREP helper. No
> functional changes inteded.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

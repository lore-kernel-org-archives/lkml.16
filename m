Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A7E21E091
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322504; cv=none; b=nYJTa+y4nbMKVaKw+y0PmNom8HHQ2Xs2EB6lGAlrRXHAvnN41jYKepsZiZjKO2+Ojem90mMX79sYGfIZ8SM+MLQFj541fAZ0KV6FsWnUJuYwNMH9MIGuBoe4CIylhkdgLtGJ5on6cti9JOZ7qVExHFE79hJG81kRXFckxl8wJzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322504; c=relaxed/simple;
	bh=n/3JI9hpwUNX1wRMtpySGbKxpzNwm/24BRDXUmlzv08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X90hLCsLRIPp/gS7trKzYbQzZZgn0h/okeK/bmPTQRTce1UamVnySJFO2dhy82xOEfMperFnoKEJx2UxEBDsXwijqSjuaUJM6bYLclBKLcIEr2oVtdoFthGEhYeEIZ93eGSxesSb/+Hom9GdXWwZjUMEak+tsjljUfMj1FHCDRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zNCrB10v; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zNCrB10v"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54998f865b8so378613e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750322501; x=1750927301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/3JI9hpwUNX1wRMtpySGbKxpzNwm/24BRDXUmlzv08=;
        b=zNCrB10vTbnnjpLM9SrZ7zvfJ1MMlIjC0So6wbKQbA1hpQ4zv+oSCCri3SPd/PUCPy
         hJnynzeKKl/5PfuD1pSipTuRZpdA8F+o26aXN+vYn6YUAi9F4RAnw4UYV6sfQ1IO7a+4
         JE+OcK6RbXh9NvKjszgRams/pD9C5mmr5ri+95kMpVYR+hWOf9zDPmV0YXmZaPMmn2DV
         BhbiuKdOJEE9t492VXtTkJ58v9qt55I2+kMB6ZOU7plBZXssjLvigrC4JaGT5Q9X+mGB
         SJW1RSv5zWAorcsQ7MgClmVHjqJJEnFyZPSYRzaTM5mZF4UWURGLCaFNw98MJS68+Qw6
         yjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322501; x=1750927301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/3JI9hpwUNX1wRMtpySGbKxpzNwm/24BRDXUmlzv08=;
        b=vQQ/v4oFUSSiGXlrqi/6AKjnIqS47JcX01UQGjDrXckHHmjHE/0iT6J1ofVFio2NKg
         umCCooKjiyn/mzQRH+7VDZVHT8UaByuqrT36MhJ9xb0UQ/Dq9sjyJYGCj2iJDMYLn2xc
         9fsr49fogoFoEYGtRdnwQLqOLYgQdLOlAT6rZb9kbTxypo8DugFvYlCcDaF2bpmhF+Jo
         HMuNRdob30DyQtzgU0fJ2JBvtX8PhFog9tska3RjEJwFM6JACmVcIwCzUGsAlEFgZckY
         Lg0fvw8dO3XkOEnRS9DnTmK2gRgNAlJ02afH4/kGGQLtvtPaKym6hoC7pFe5iaL/esTS
         NtYA==
X-Forwarded-Encrypted: i=1; AJvYcCWVH9QFUA922dPiZu6hjNfPsA6iv77IFj6ekMtOukYqBVhJK0NeVdGgCE6Emk7rCdKvgO3d4xB+R/fzp3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW1Y1CoJHLs6D6FPteza2zbJaTBLGMD6M3WV4804TU9A9j08a8
	0OHZFdzJYKEDYbg91oQ9i2I+UvrF7kK5CahrN/ZbuM+tMlxXoepi7fj/xFaAOuTQceyYEvPEDL7
	CVfbkSkldfprHJ+bbRjZXfpX4++DINA+n3UXEmpqnOw==
X-Gm-Gg: ASbGncvv8gGIt8a3+9hXhqorPcxAxp5KVpBo5vWUi/GOa5Ww46t2mFe+2sBJ8lhWsNU
	6H6J7GxnfMSEGEiT6WVRZ2s6mMJ/eWaMiuwXKeFaee0d7QXQXqWq8Xeg20uDBJbOTD2lyYjpksa
	PgD2NWFBTnagaoWTV9EdjPaCW2ac6EQIr+0ianJjQnRmg=
X-Google-Smtp-Source: AGHT+IHVGgFPaQG0OhPXqsCqY9LUDkKPUDQE3Jy/DgzWX341H6DxvHpFRsv8n2zH9CF8v26QIPfqbwftMAeHyo7UZV4=
X-Received: by 2002:a05:6512:b9e:b0:553:a64a:18b0 with SMTP id
 2adb3069b0e04-553b6f3ed33mr5548057e87.42.1750322500571; Thu, 19 Jun 2025
 01:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
 <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
 <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com>
 <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com>
 <CACRpkdYUr+82AKndieXm24Eg1-HY4LyfKZ9J_kTFKT1Nyyju1A@mail.gmail.com> <CAMRc=Meq9+hnmvjXnq-YUJRPOOBvAV+pjHQ25k1wgFqV30Vo=A@mail.gmail.com>
In-Reply-To: <CAMRc=Meq9+hnmvjXnq-YUJRPOOBvAV+pjHQ25k1wgFqV30Vo=A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 Jun 2025 10:41:29 +0200
X-Gm-Features: AX0GCFu8Dbo5pcDv8ujsp9IKLDaddp4Y2N5p47cQpThWdtIAL2mf912Bw-JLnyM
Message-ID: <CACRpkdYNRC14d-jBbJy9-0OfdXR2anUJ6osw+DWsLNPf4VymnQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 9:21=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Sorry I didn't notice this one. But I see you already responded that
> you pulled my PR from today. Should I ignore it?

Yeah ignore it, let's use your PR instead.

Yours,
Linus Walleij

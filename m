Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85288280A33;
	Tue, 22 Apr 2025 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329464; cv=none; b=Ektx2xZAhAi7JWEDJpaqWjhc6N86Pxkp7shYml4UfnrcJZWyHxkrOTBECPZzB6eedMn0Q1EXg1ZK/OfflMjd6G516PrCPoyojmetb8d7kp2undcG8sbnQnF8GWiu+Zxg8ke4NZkAlrVYA+zp3DFMNGrosVkA42LLLRB5LlBBjrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329464; c=relaxed/simple;
	bh=5ENscGsvk3ZZR1O8F9yAZWCSbYmjejJQgKz6FhofyIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2SDV5jYV1K5rBb1INpsd+zx4MjiWqTBzzX94PnmF5113vGesFeIjh5McAMxbRTiSzvD6TGwflyTEGRdTHZd1uXce9qof/p4KZu9yw+UwOa6wwTL/ppAqqStjxmh/XYq1yU638w3Wms94W30px7f71abkakL2HIITMou+5NFMxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kh+R0cn5; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kh+R0cn5"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-700b17551cdso39543067b3.0;
        Tue, 22 Apr 2025 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745329461; x=1745934261; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=01iWsWRnKaXYUJ6i/NON00y6jMFX6UcPEC4jPm/g2hU=;
        b=kh+R0cn599F3uY6LYDroJxCUaHPGB3Q3Mr51DcXyUlW9UypQi1V2rBZIf0egNOogQx
         n1Pp9fBi3O+aWPeKITKWSXqvappSb9KaflaHzt7Nw87g8AybOgAgYwQBYpbk+f1wfecV
         rchMJJEQG2JE0yG4JNi1VJZ+xVeCyHzq4p2aPSzbTbGZ2KxR9v0VAp1qKyOi5kdtWOoH
         FBDGln3y1wZ165HyCrFR4uun+78gURbNpKrYUaevCMjALdA5mQ5OU99hvzI4oYct+xyg
         9pOnX83oZjaQwcS+dGKFOW0ROWlbxa/ByeWJrLlGpNmbivyt6M+UGZ3iG0yHP3tusngQ
         hAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329461; x=1745934261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01iWsWRnKaXYUJ6i/NON00y6jMFX6UcPEC4jPm/g2hU=;
        b=sPYHEQh613gZzm2c0eawzzgVzPqnkc48cMaJZwwSGJXN2nuwNkgFaJLra3AZJSwPRz
         1F/98Pam3dvZ8tus43WXJARMk912dO8YoVEzCYR2lVedc0eRQN12XDuhOIXnvjX1ktma
         u7gyzYHSFWcHw+AYHkYagCSP6427sSaokISFcXcY+uQUGSnh2ruEXHtfvTNotFc7mQRH
         l/gwHnDSwvMSsslARELDNV7cixapJj49gfkGqbUfsU2XI7VkNypq4GPMp4MBpTZ2+KnL
         s4chLiZBm4s+McF0YdWLR64FeMx4ve3sXu31LkzMWgNWRfd3a4F3MZemFHbygIJS61Hg
         S0zw==
X-Forwarded-Encrypted: i=1; AJvYcCU/fUMGgCYwiOsFU/q0UjDDC6Ul/ckYm71y68Z5HfjDdPBRkbS3Ipk2QTwqgmw2WtI1ys6R511IBV1+@vger.kernel.org, AJvYcCXwJG540ZYMEsFjT2mlr9ub5d+V4iN6aWh/Y/eLAvaGuKmmjPiL+oCRbZ/fq9aX80HmWX7NesHdzxjh6eC6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8omVRjiXAqRYjxvbJtoJKFdYr+v82brzdYXr/0hcvmnCRb0rq
	3E3jApxe9Jid1BJ2t6cTWZzIOMdgFm9cGfABfUkW3+olNr73ZhErJgRBkePyW8mV+sONZWsyYLS
	VIi4lKomg8ivEyNa7gWM6q01r4b0=
X-Gm-Gg: ASbGncsZMSC+8bn8r4vT9KT7qay9OsK6tsQid0TfhFUAO2bGEqCRwy+2+tKXZXyCciq
	1slx/UB2IljZ0G4wagVbrkqwEEfOHm3cCDcKUHm5Nodczf8F2CB3XhzGseeyldjvWRz2RusnNY9
	tJieUahhcvEtY/hs//Q3ZI938=
X-Google-Smtp-Source: AGHT+IFB0dsAITdx8kdX4E2ydKgnUeAe4cFVnylPhUhldLMfCcBI8Xtwn4NktwjCacq5FAj+GCAiAMlZsGz4uy29IlY=
X-Received: by 2002:a05:690c:6f87:b0:700:b007:a33e with SMTP id
 00721157ae682-706ccd0a2dcmr235402417b3.16.1745329461380; Tue, 22 Apr 2025
 06:44:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com> <20250422133619.GA1095169-robh@kernel.org>
In-Reply-To: <20250422133619.GA1095169-robh@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Tue, 22 Apr 2025 15:44:10 +0200
X-Gm-Features: ATxdqUFsls2M4OH434tZGU5ecAW3B2mwbfmPhFEi7JO7p4M-mTLMLWRteEtCKs4
Message-ID: <CAMT+MTTwY=z1-_94ws+Oi+wvE2PA_s57dPmpMABC26q=MPw1Mg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
To: Rob Herring <robh@kernel.org>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Apr 2025 at 15:36, Rob Herring <robh@kernel.org> wrote:
> > +title: Generic SPMI NVMEM
>
> What makes this generic?
>
> A generic driver is great, but "generic" or "simple" bindings are
> generally a mistake.

There is nothing apple-specific in that driver, just re-exporting
several registers as cells. If you think that it is a mistake, I can
rename it to apple-pmic, or something similar.

> > +      - const: spmi-nvmem
>
> What happens when there's some other feature of the PMIC exposed that's
> not nvmem?

If you have a PMIC that needs more features exposed, then you'd have to
use a different driver. Or am i not understanding the question correctly?

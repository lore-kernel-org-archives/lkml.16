Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B531E102D
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 19:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738177893; cv=none; b=fZoDR/uViKXY6G4KCmaAy6Vqzem8CIurQYVg7Ho8TmLDzYRh+kyErXtQCVLUk7DBxrij08iI9fMLdEeMz/hzHM1dvGjJjXmbtTTvHu91fzoTKU39BQEeN9k/N/vRePNH3wSNnfg7UYBkRzavi2ODlwV3gsQbbEoDez4MVnS31/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738177893; c=relaxed/simple;
	bh=GhlIZMqOwR1HkQLXtngsck0tPKlOdv4q2Zj0KZS+n1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FnBZEMhGlAGuKeUSNcrlutRvyNjSiazbHxd0/6N3T8HAXQupQyzeOC8fMl9li+/HJ+hJO5uFjTw67F6gDnLwnte7FDK2ADXamGahXHBk+MXRTrdoarAtcs80AgSakeuw48OO5uJXfliZ7RoABP9mTimEOy04gckZkwu6mg8g6zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=aO79BLrK; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="aO79BLrK"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaedd529ba1so5848666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 11:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1738177889; x=1738782689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhlIZMqOwR1HkQLXtngsck0tPKlOdv4q2Zj0KZS+n1w=;
        b=aO79BLrK6bDQp/LUQK8713J+ND8yGLewCXZUowQNDQxa9MSvwRw0IUyHNiNe1EIPch
         pdhlUMsI1lLMJLTPKoqK4nA6HYijYOND+7FqTREnRSajvWiBCC4tVdvZMpokzsAKAJyi
         7KZgUNEekrf4xhbMQzZ8rHEj4fTxLuQMl4lVKZYXKf3tFcSIV/k+pY2wj9d7JxII4sG3
         xc9kEqOkkXehTnihAGXzKrG14pA9/BaxKZiMu8wA+wgRog5X0ntC7RbNKI7BNJGByUb7
         zAB+RY3EtgbznJPJTEYzBL0fH8hNV9udnc+r8uIblBNI+QZjmyfQRTzOoe8q0EzaO0cy
         XxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738177889; x=1738782689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhlIZMqOwR1HkQLXtngsck0tPKlOdv4q2Zj0KZS+n1w=;
        b=f0QtbDQPLtqZtTXOQcoopmrlUk8u6lQbRL3pgTMAYuy/vG5guQtLr1RhPpM9FpyM7p
         hnCfbRHMYtFP/BNVhHW90Dt1O9VFMZtCcSoH4YymbSrsDFHkPynP9VvWY3szoiK/1Y3P
         mg6MhzFL7955nXwArWMIoJ1nlIr6l5YJEVEXEQKa7V1nuYhBMIoEKXsNPOnL+Esz/8Zw
         KXb1TZFfD2kDINl6V7D+M6q5gCgYTrzoOQ7IyscDdEpirPmG1aECAd3Jmes0bjg9xCr5
         yQMFuJKE+2rkUrbHIqGuZdrn9Wouu1hOEzkl126QU+oHC22WrNiDx71f9yvfPrkzkTr8
         sDsg==
X-Forwarded-Encrypted: i=1; AJvYcCUHMQ1pZxBxiOZURvmOunFZJzAmkl3Vuh9Ga7oapB7hP+R3rP5KmbhaBpLEYRkVjE9aSEIL25cskvIzq6I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsr0J1zbqvk4xyx047ahwH5UuYLdUC9xdrvzn/UjryEMUxkhCh
	btNFLEMQz84RPWYRQtb7+Z3wXibf3+vGNLvGhXYDolgM+bOi+pdAh6NSh2nODbv0sDebaIIlNi8
	1ErzVgWsxeWZDGhN4v/sdR4bDIb85fzGzMZB34Q==
X-Gm-Gg: ASbGncuxNri/UVal61Wh8eGMW/xfiDAvUXq77e3G/nV1N2ng3o08UrcIbrftg92e4yZ
	gVsOCedTuFLPd/BQjoCxUPABKtul7BnouqvHAJWGGtvf/sCYdrOOe1Tja++i/9tKok8Y6wkp7eb
	vvpPvpKwz/BEIf9Da98qSR+fb3RQ==
X-Google-Smtp-Source: AGHT+IE219ZwdyYxwg9UGBTR/PKOr2GHzNh2WNdhnHDSJJCT1n3/BOB/tMcF5dlhHm1Q++2IGQ4hA9rQdGrBzYdnw0w=
X-Received: by 2002:a05:6402:3511:b0:5d0:81f5:a398 with SMTP id
 4fb4d7f45d1cf-5dc5efa8b65mr8934946a12.1.1738177889464; Wed, 29 Jan 2025
 11:11:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128133927.3989681-1-max.kellermann@ionos.com>
 <20250128133927.3989681-5-max.kellermann@ionos.com> <856ed55d-b07b-499c-b340-2efa70c73f7a@gmail.com>
In-Reply-To: <856ed55d-b07b-499c-b340-2efa70c73f7a@gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Wed, 29 Jan 2025 20:11:17 +0100
X-Gm-Features: AWEUYZlW_MDfPCAWAmFfh5_6BXOC71Ep2fITVNb9uw3ezdU1iUJLGAdCwxk2vGA
Message-ID: <CAKPOu+-Mfx9q79nin7tGi1Rr4qGGY=y-2OhuP80U=7EtRpfBdg@mail.gmail.com>
Subject: Re: [PATCH 4/8] io_uring/io-wq: cache work->flags in variable
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: axboe@kernel.dk, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 7:56=E2=80=AFPM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
> What architecture are you running? I don't get why the reads
> are expensive while it's relaxed and there shouldn't even be
> any contention. It doesn't even need to be atomics, we still
> should be able to convert int back to plain ints.

I measured on an AMD Epyc 9654P.
As you see in my numbers, around 40% of the CPU time was wasted on
spinlock contention. Dozens of io-wq threads are trampling on each
other's feet all the time.
I don't think this is about memory accesses being exceptionally
expensive; it's just about wringing every cycle from the code section
that's under the heavy-contention spinlock.

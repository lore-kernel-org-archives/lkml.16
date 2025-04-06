Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A402B4A21
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971497; cv=none; b=oP52zK+vTcX9okl1KWmXAZSxSXj6HvfM7JDGH+DQQYl3alScl/sUe+1YFtcJVjV42Dog88+B7lsxdjcWaqn47HgBGZ9/134b7DyatJbkAor1Onzz+Moa+Khfnv+nDHU5mQJtpfcDVMpFOBl1YyOX2U9zMOvsyokwvitr1eqA1d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971497; c=relaxed/simple;
	bh=+JgDkSkEEcDLTsZdbQJiXeVweECmbECSQZoVfGZG0Ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+AcU5u2Su/GHzY536mT7lSm9R+bm2aPzCdDQ6TiljgRxwNH0sTIXuReF61anVfatO9DLdHJptyn1Iz4sK+GBAzeSRAdZ2fgzAr2sh2UV4O4TAXn1KmK3OB05hdRWkoOg4/qI7/X9w8RJ9Sfaz82ddZ5EE2b6lz9aqz+DC9OzIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=RXeeAxBg; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RXeeAxBg"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso3493649a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743971495; x=1744576295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JgDkSkEEcDLTsZdbQJiXeVweECmbECSQZoVfGZG0Ts=;
        b=RXeeAxBg6OxWGmQnZD+X/RPnxdS8nyihPhA/JR/3R7tj9RXD+bTXb/hP7nzNYqFZyO
         C1DOhgOjfVTdzeckB4RUxHDoFZLCeWPN6dmQQO04O7tjQ0K1CzL/LOByv14yGm/k9eML
         ZyMcW3+aCt2l6ImFo3IAzTPexFtp8JTu9FXgYVJtycK/0N5A2QAM1A0FEIQSLGNzpykl
         K2N5ArrRWAV8epbpMU7l8Mn3Z7QNM7UaA73SyZW5WtPDwopFCemqLYd+drs8QjEnYRmF
         o+QgI1wPhpvR09IvkUYR1nuT9sJ3+VP09Tspp3CGQWxxKSSVx5MtdhMmb+a+MRLHiX4L
         qhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971495; x=1744576295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JgDkSkEEcDLTsZdbQJiXeVweECmbECSQZoVfGZG0Ts=;
        b=B/8E0mccyPD9txu7VEuGNLbCvs/2uw/hp2WL/RsRzoAAaRlBovnACpQdNPqTuCQ4bh
         EvfPol/K95BV/0YTEcecEl9XY2+uphHGeRJC0NdsvqMgf2T87Xjd75TluSsTO/6gldyd
         p9csdpkWTiJDpKSHuuoLWi2+BCaURJqum/YhLpSxjVlnXxP1dgVqfc1RdHpIx5E9HFB0
         +mb4OObFwjTOtG9v+SyZJJ3fo24fUZ151hBiz8zH49QbWiy0PhuxZGKBZvWsZ1mTy0ys
         pl1icVcAwRVs96wNKmZ02K79Nn/1+GqOXnbfA+ZWKKWGMfVDicDKDbdSeajUGM8KityI
         TxjA==
X-Forwarded-Encrypted: i=1; AJvYcCXlaeNJ2k5wDtkF9ADmHeofvG3R8jATgMmeJYhG7H1JXjySVmg1cZScSDcyxUd4DCa3US5CcnhNnbl/RSk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yylq8lRIsjtWOR2fqW0VN8pzAiBcTkC8r7UqH+SxGsiv2900ISG
	V9Lz0Ii8NFHyImn/x4VupHWmwPKzA/W67mTztq5Rq8QWBnBlumBprPeYDhb8djoFZTRK08iIhpR
	eOd46e4ZEnA3xnT3BS1WDFaZIWUM=
X-Gm-Gg: ASbGnctBXb29HB8NyMuK/f+OPENpXRjc99EHIQEjht5G94dbYLdibjP3jS4+0csMjdj
	EH9gpx30LxBejd/K+Bk4c+oySx5jOqSQPkGTsQWLueWgYAz586z71uhq7HwyII/aT5wsvcwZI1q
	mHTEBZbEMOjpJ2iH8+siMeB5VO0r4fMXL26CFB7MLq
X-Google-Smtp-Source: AGHT+IExK3rgstJKKKtoG9Q+crnhTsYrlTj7SKtkXlz2UX4GnZK54G+TsdpXNABvaY1e4/m9JtjPFbBfqcIQ/eTpRDo=
X-Received: by 2002:a17:90b:5448:b0:2f6:be57:49d2 with SMTP id
 98e67ed59e1d1-306a6179aa1mr15876246a91.17.1743971494658; Sun, 06 Apr 2025
 13:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404123949.362652-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250404123949.362652-1-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 6 Apr 2025 22:31:23 +0200
X-Gm-Features: ATxdqUE1UrOGrlQFeIQJTFzofnatItzhBtfjuCm7JYGAi3H-c4k4SlKtOVMPYWc
Message-ID: <CAFBinCDkH8dMUpzbHy2kM6ZtUOfjRmHQzHxSMFeZeSNzjivG-Q@mail.gmail.com>
Subject: Re: [PATCH] firmware: meson: Do not enable MESON_SM by default during
 compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 2:39=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Enabling the compile test should not cause automatic enabling of all
> drivers.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

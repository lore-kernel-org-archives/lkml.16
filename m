Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF8D2BEC2E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579122; cv=none; b=MlgRUR6B21mPLNWZ7OGmEG7q2AuCdqEPRpBvUSz/1E+op/j3KXFq75iUefiXBsAPfCXY5KFLoOqKltCAp+Z6M7MJdyaQ/4Fxg9APGjSyWTYjbqaQKj9546i796K4B4UTeNvHGQ0FwORR9y67h12t2XistzZGVW1ZGoQ51HoWEc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579122; c=relaxed/simple;
	bh=wnFRRSRn4QeEk5iYoV45tJ39jqpMr6MRa9EtAX8nG9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RyJ7AhKLO/g/MViNx/KT/gspQ1OgUib1j+MEISMdlFphvv2owhZ02tSPVU5DABjPvWiLxKuOB0EQrGDm3h98CHHLY00FJ0mDexCddhzQhkAfj3ZSSp2CwHqchlYeatzq89DpDhL12gxj+zyAne3M77Ns4Bu4tGrWyguqUChJs1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WtafdVm+; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WtafdVm+"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b60de463so368075e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 14:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751579116; x=1752183916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XRxLaEkudOmQp09BGpQ8QQ/Qoe1pmMzDleZt9KM+6o=;
        b=WtafdVm+M/6VEmlgA1USgaJOheQUpmJIaa/CirH1BLDHhQn/R3Iu1ttRj2fsbBLUJ3
         V8XNtLSl4iMXhjoxyMKSPSeZ+G68iLqRk89NvTuIFF4MoB+RxiU3SNHEo4weaOQztABi
         1vN2jz4MoGnCnnrwrhiRUpIXBoBhSx9sg+ho5Db7FvRruvji0IGUQtvVwSMwLs5PwGUs
         fDtAFbkYYi3qat/tn24VSx82QFZeaAIaeS65PSgQuU4siOM4uodleg5GkkjUBDPxXJVi
         vEMnso27E/yeVc/RlIp27yB5lKLKFLWUKrk1ij6nJOq9gEqw0StfTgWFElwF0Zcw/w89
         R7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579116; x=1752183916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XRxLaEkudOmQp09BGpQ8QQ/Qoe1pmMzDleZt9KM+6o=;
        b=XUyMC6ElGb1iRgK5IcQQFS6hRleYC73bd+9k0FYCnlQJb7rFZtJg4grK7DIcZ0H9pu
         3TpVvYY4pDUDlUe8SFM1CF2CkSeslfpmCZoKSheDDF+CTdkxJXoN6zD7PiKkagbCiE1v
         Gt43AJENCTMVWozC3YhNbpZQ7dUVoP91/SNBGHaeJtCOaMNy52TIHbGcgvGfdLbIH7GL
         ISYi0otxP0b2gga6aWqVJg08P5C9eF6QXUFNGYMRqGR/AH9RwSsu/qyv/Dqf0QLgU7ov
         4X2rt8tYCVam4WPKypMIXUpv3rS7aVe4D0m/+JQegFTXY/S18dqS9Yt9scY3STyJac/C
         8urA==
X-Forwarded-Encrypted: i=1; AJvYcCVqSNSAd9s01o/4ZjGNwatuj3aJlsxtvolVFnf6mdf2pYdOItrs3VMB07l5KQS1XEbauPsG08Z6D0Yxtf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKaSoCeaAsnwCATvahxwhKrq+pZI0XRgY3qVyO6wiVTbI70+sQ
	hikCO/FiURpjIWZYhMYMMbENY5nhO3gp5sGluRanP5Z4dfoJYwZuzlTCvK1BlIhW8lmCrmqqigF
	xCeALDivDFbLwwMtaYi47fEflxx2HPk+ncQug7zJFxQ==
X-Gm-Gg: ASbGncvkImlrtG5dmFKTLKqC7z6QuA9mKWAivP7HMbyF1k7RjeR6Sz0zQUA7WuW4ubf
	xSz4B6aTZoUGOjfYHeuab4cCyQ5i7gRhVwdW1tgD1wSgf0CHh8EmTIL/MTtAbcsKJwPzM1gOyVq
	3U+8FtterIAYPUK+F/BVQ03Da/OotMNEsOkIxTJHrOVbI=
X-Google-Smtp-Source: AGHT+IHMcHTI8t0jV1E/1yNFipjDMdG27d1r2tcyNEePv6L85lb9bKTV6sQs49+xKVP1ac6AIJvVTLJqEQGM2vza/qk=
X-Received: by 2002:a05:6512:15a3:b0:553:34c8:f6ca with SMTP id
 2adb3069b0e04-556e89500d0mr4749e87.35.1751579115885; Thu, 03 Jul 2025
 14:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624090600.91063-1-quic_yuanjiey@quicinc.com>
In-Reply-To: <20250624090600.91063-1-quic_yuanjiey@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Jul 2025 23:45:05 +0200
X-Gm-Features: Ac12FXyncS3NOy4puCpNTctASEAwVXKHDqvY9DdXOqM9ohOAbmxssvJ77Il8LtM
Message-ID: <CACRpkdbh1oikr=2A_ymAupE+j5nc2pfgU3m2DteEUdqY6=Ertw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: add multi TLMM region option parameter
To: Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@oss.qualcomm.com, quic_tingweiz@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 11:06=E2=80=AFAM Yuanjie Yang <quic_yuanjiey@quicin=
c.com> wrote:

> Add support for selecting multiple TLMM regions using the
> tlmm-test tool.
> The current implementation only selects the TLMM Node region
> 0, which can lead to incorrect region selection.
>
> QCS 615 TLMM Node dts reg:
>         tlmm: pinctrl@3100000 {
>                 compatible =3D "qcom,qcs615-tlmm";
>                 reg =3D <0x0 0x03100000 0x0 0x300000>,
>                       <0x0 0x03500000 0x0 0x300000>,
>                       <0x0 0x03d00000 0x0 0x300000>;
>                 reg-names =3D "east",
>                             "west",
>                             "south";
>
> QCS615 gpio57 is in the south region with an offset of 0x39000,
> and its address is 0x3d39000. However, the default region selection
> is region 0 (east region), resulting in a wrong calculated address
> of 0x3139000.
>
> Add a tlmm option parameter named tlmm_reg_name to select the region.
> If the user does not input the parameter, the default region is 0.
>
> Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>

I don't understand the test tool but it looks reasonable to me
so patch applied!

Yours,
Linus Walleij

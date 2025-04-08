Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5780E207A03;
	Tue,  8 Apr 2025 05:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744090901; cv=none; b=FAkBQ2q5iMO4O692iZ3WARk6Mikg9LShLQys5GWujp4zZNZGfZ/Y5XtnJP7xqtsW3Ywh1RxaHq4KlRw0vtL0teW+oMBnsuUHmFlXX7NHk5Qljbg17Jv7HorGdO+QonQzi0nz0dYixqMRIlx9Rkq7rnAhW1u3RpITCMoH9yMLZnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744090901; c=relaxed/simple;
	bh=G1JuetwdsIcWMawyHukOBenwh01h3lNnPIUeKihQC5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZoFNtDMQFxg4SjiAqSnGlBkNn+y6eTg8QAMAEj6DOy7lvCMtVgbsPEYUi7FUmFhl2HvY9F19RgGkgHdZ5wWjYOGv/zG5yDfqGe67K9f8yaqLu/lrxB8BxoeGATEXalWgEqu+q+Hs7ronQ4KnF59AXgyv7CGcSqWURPZJEwE4Pmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=joQSQjxD; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="joQSQjxD"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-391342fc0b5so3985872f8f.3;
        Mon, 07 Apr 2025 22:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744090897; x=1744695697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkEG3n73IB5H7P8Kzz2563aBkmYhG0bK12uFL4QfAdU=;
        b=joQSQjxDbINjHn2ldnQ+SzbrmmNhsStW+2MKXTaKlSHLX8+MiG1JpnlkzIeB/TTN1/
         FA+RNwBPw1Mc8Elfw7vL1VOu2AV2rcUR5XCd9S2m174Q0gdfZ7RQ8giPdaYmaXjxMdBh
         6mPTZnX1azPNDBj3ZVrxMCianDeSmIJRUasqg/vpOQ2vaIyhfLRVb+W4QCEd4YQm3EAT
         5hyiZcHCjhtIJeLBYxLwIgVFGjTsWLCizcaaR4ldIJGq1cR8Q/xikkt1JjiRXOXiVeAl
         Ol//5YhSD1g0VHCycmezgKT8MxucxIUyOY19y20SjCnxV7iupLeG3Tzd1D4NcRrrqQdk
         JW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744090897; x=1744695697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkEG3n73IB5H7P8Kzz2563aBkmYhG0bK12uFL4QfAdU=;
        b=qd+58iA9z1yUKa5q1hBb5Ko3w7pB8xJqrvLYkW1Oe+1zmqEgoQ/nek26wdy1hmoLqf
         pFTCD63kFpU1F6XkAj0PoPcWVcTU5Iqbm9+9YU5PQbP16w2M6o/MrvMlbp/w6J5iEsXk
         jEGbj26hQz2unpNKU4RAIhQE8J7EBO3E+A8yadxNbKfqPIPkAucSLNUWADkmlq3gqS9q
         enVBmFT9OTVUkHPL3yC2tR73b3Zy5IAFcYhdV8gS7uu5294CaovmDV8kmcIRo78oq2ZV
         x1mI6Gv2MtGg9TFQLAfmvTiLwAiMrQbGvaO93udhBHp5HW3vbzAn6IQX/OY30tWb2yvg
         681w==
X-Forwarded-Encrypted: i=1; AJvYcCX3zs47lSDuRxYus8dG77b8lBP0vPDxHopPEY4p1Oy3qC8GBRSnANkVMpLcrjg2l/19KWsNu+ww7KZS@vger.kernel.org
X-Gm-Message-State: AOJu0YwrW2MDI6I8RyTu1bM/DdrR30uW39YMK2rvRzaJ+iCdy46XA/PU
	KcSl9xOZyIvoSZPWGLBMc+pGxW50ZMUQ51cUK41VGQ1X3e+6t1Ri1WU/USuERan2kXP2y8H2nIC
	eeGEPwUbGIDN3cRodUod+DLwyNCo=
X-Gm-Gg: ASbGnctvg9HLXTCr93KpYrrGHYQgeW69dmyeTzasOfQpt06YBuN/Vf7WlHn/OKlg+yI
	ELL8gxK9W9sGZoNzv0/PNJ48TVca1DYoFVNQPvcrxApzKAdrzpdz3jEm82MxXRxvKx7UbxDm554
	VHEt+n+kuFptIG3JvZpWXSm/x88SxklMI0NTi4Rg==
X-Google-Smtp-Source: AGHT+IEJr2RlRRds5DV0exNulLERHdSbrpUGr5tWT9FMrnYpJY5Rtqgr1wOwCX9SOcbwvfWFrL/jRBm4zBcByw9xuZM=
X-Received: by 2002:a05:6000:2482:b0:390:e7c1:59c4 with SMTP id
 ffacd0b85a97d-39cba932868mr13644064f8f.13.1744090897524; Mon, 07 Apr 2025
 22:41:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225090014.59067-1-clamor95@gmail.com> <20250225090014.59067-3-clamor95@gmail.com>
In-Reply-To: <20250225090014.59067-3-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 8 Apr 2025 08:41:26 +0300
X-Gm-Features: ATxdqUGMeG1CwHC3rDx2BTng2GdUddmPlkEu4XWRs8Y5daVCNusbjXPJd2k3sVo
Message-ID: <CAPVz0n2SAuC_yH79Q1Qor3yp7tAhhzqnTmma24TFXFcMhF0GSg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] extcon: Add basic support for Maxim MAX14526 MUIC
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 25 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 11:00 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> The MAX14526 is designed to simplify interface requirements on
> portable devices by multiplexing common inputs (USB, UART,
> Microphone, Stereo Audio and Composite Video) on a single
> micro/mini USB connector. The USB input supports Hi-Speed USB
> and the audio/video inputs feature negative rail signal
> operation allowing simple DC coupled accessories. These device
> allow a single micro/mini USB port to support all the common
> interfaces on Cellular phones and portable media players over
> the same external lines.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/extcon/Kconfig           |  12 ++
>  drivers/extcon/Makefile          |   1 +
>  drivers/extcon/extcon-max14526.c | 301 +++++++++++++++++++++++++++++++
>  3 files changed, 314 insertions(+)
>  create mode 100644 drivers/extcon/extcon-max14526.c
>

These patches had no activity/feedback from maintainers for a while,
so, in case they got lost in the depths of email box, this is a
friendly reminder that they are still relevant and I would like them
to move on.

Best regards,
Svyatoslav R.

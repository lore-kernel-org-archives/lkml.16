Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CDC20371A
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 09:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738660359; cv=none; b=Pkh42ItnWjmdGhF6xAdTZLqgcco9amFaShaaToxW/FaHMZH+iirLfjki71W2f8aQZBe/1tzh3m4uisiYwiUtWyWRcKcWJyKqhF+nsGgbUBiJkTOGs8K9n0qTHY9O3p2g6+71f7uAzkMj8Tzt4ZH4bY7x5TnCAtqfvHYO2QA//xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738660359; c=relaxed/simple;
	bh=lOmPfU/eGVZYXYoZjIKS38Xdl1n45B66FHiHc6aVvxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CXqUZgNvoFIK+IjpCJIt3rJSuWfEPttno+0U7VvH/IHYgRUM0nEwH7wCfJAc7N6/tMpsdnaFoh8vw/Csrl+OUHjP+Ry5YXoF2FWzCtaLxhZnYR/P8WHtCp1JCQ/75Mj5UFoR+NhiY/BdROXEfCbHfuHZeV3DabAc+IsPk0LvwtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FzzwQ68n; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FzzwQ68n"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-71e1158fe3eso2944903a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 01:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738660356; x=1739265156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOmPfU/eGVZYXYoZjIKS38Xdl1n45B66FHiHc6aVvxk=;
        b=FzzwQ68nLank24TxLUu1tzh/2YiXTBDD/qQ39SifFW5TioVHPG1Su/8AZ4DQ25mZVF
         pqYEALoZJcV0Ci7wwi+wpRTvTuxFPfe0+TL7IgdvUYCVFrNxNgJvOgZBKuvui7uOB3Hh
         mRnRX2q89L+cwiAzZRoxIYzmHIeJYnJf3eMczLMTr1LS+B9vjbf3Et7MtBy8/b5Br9+4
         rQr6VRAKQN6gEoPbvz+Ad+fZ8b7adma3TDFswESnXfkxadQK/eUcoRhkRHzr3RBGeUPk
         32qHAV7LVYumbE2P/6Tj7BcK7mHiAmr8wq6YOsG9WIn4wbqp+OH4TpGChcfuQiZMPu22
         BaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738660356; x=1739265156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOmPfU/eGVZYXYoZjIKS38Xdl1n45B66FHiHc6aVvxk=;
        b=bOwsY7cEerIxI4sv6lBNrqoaWBHP9L5NrjgXhyxvS2D+nSWcbj7OXes6DkAxrak0WE
         QY5kUrMsgh8Eq9eyhTY9S0rJ8jkqnJuahPUo5dsICaxxKA+8TPH9zEzmif9ky2NSfNr2
         RS64YqLVaqTd0xC5iliNa5lanQWYGJDIsxSPCv9R6yQAq4ublXX/Ov2rEuvcnvrmsLI7
         zMO/axn0DzPWn9aQftpb6RQAK47VZzZW0Khi7RaGzaSmnb7kNiTZp0Tr9NRuSv+eLkIx
         cwTtyJ2ZuEXarz89XtansJZDHz358j0pyhummDMkAvlZmhF1vQonwhMA+WFOiV3Nmj1L
         1ieA==
X-Forwarded-Encrypted: i=1; AJvYcCUPHqnCGWDImJcEg3/r2a13GgB2JfxLSiP3ONz9FjR3p4RZltbZ9zp+vjMGQ2hYIF+wqH5zzTazyi0hXaM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygg54/FrsmPhga+HI69FBsS4EmPYhivqotVw3cCFZPRsB3x8eX
	nAoGeyZpEY0eiseeCuxmVqFulEYWqjGSNI6RzdahuiFcb8NU+mpZaQZJ+WGt+olC9hAzySlD4OH
	Ab/OIiiBI0kjsRKMxUsCY/JJt4Su9J3cKxRnEFA==
X-Gm-Gg: ASbGncsdBo3kQR1R+1M2hHeYtipNaSELHsFxHG0uizFPiFIaWpPLa3UAzVMPSkThsto
	GiyLZ1DlvKpeetJ8LWBzagfQyZ+46ITfDBGLQIMxc/Xs2yjBb3KeaSXxPhTVrn/lDFejsglKulw
	==
X-Google-Smtp-Source: AGHT+IGaBtWiKIGnTwJFrQeBl34glJPVbOx58PH1j6rhPNeD9c1tAu04EaLX9zcvsa1rWGTAMV8NY2NzowwhK+UlT4A=
X-Received: by 2002:a05:6830:925:b0:71d:f6d3:9fd2 with SMTP id
 46e09a7af769-726568f1915mr14303629a34.24.1738660351634; Tue, 04 Feb 2025
 01:12:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204073418.491016-1-sumit.garg@linaro.org> <60cd3fcc-5d21-4b98-9a81-f5fbec2099fc@app.fastmail.com>
In-Reply-To: <60cd3fcc-5d21-4b98-9a81-f5fbec2099fc@app.fastmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 4 Feb 2025 10:12:20 +0100
X-Gm-Features: AWEUYZmX7hyL7KTGLrWQk_2I6kQWMPU905QHsNtMHpKEdVFr8ey35q3rQRoHbC4
Message-ID: <CAHUa44EnCdjEfevuFa4rdTykiD1fjU9+GbVq=TSOPaFz1sZpDA@mail.gmail.com>
Subject: Re: [PATCH v3] tee: optee: Fix supplicant wait loop
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sumit Garg <sumit.garg@linaro.org>, op-tee@lists.trustedfirmware.org, 
	Jerome Forissier <jerome.forissier@linaro.org>, dannenberg@ti.com, javier@javigon.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 8:45=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Feb 4, 2025, at 08:34, Sumit Garg wrote:
> > OP-TEE supplicant is a user-space daemon and it's possible for it
> > be hung or crashed or killed in the middle of processing an OP-TEE
> > RPC call. It becomes more complicated when there is incorrect shutdown
> > ordering of the supplicant process vs the OP-TEE client application whi=
ch
> > can eventually lead to system hang-up waiting for the closure of the
> > client application.
> >
> > Allow the client process waiting in kernel for supplicant response to
> > be killed rather than indefinitely waiting in an unkillable state. Also=
,
> > a normal uninterruptible wait should not have resulted in the hung-task
> > watchdog getting triggered, but the endless loop would.
> >
> > This fixes issues observed during system reboot/shutdown when supplican=
t
> > got hung for some reason or gets crashed/killed which lead to client
> > getting hung in an unkillable state. It in turn lead to system being in
> > hung up state requiring hard power off/on to recover.
> >
> > Fixes: 4fb0a5eb364d ("tee: add OP-TEE driver")
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

>
> Jens, I assume you'll pick it up and send me a pull request, but
> I can also pick it up directly if you have nothing else.

I have nothing else, please pick up this directly.

Thanks,
Jens

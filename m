Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD73E1DB124
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738581312; cv=none; b=Ka6m4hHGhprz+8wUBghNxuKd1ucFc4ROgHoIgXQ/bp2vbLJL7TpOe425lee3/W9HMAwoW7Q1+dKX4VjsYPdjviyq67to8mvm3ZiSIplNU8U4DF4Wr+KWMBIj9hvPaiyx8jCf//tPCTiTp/IfG47d5rdnYRVSd7gKL3dqYrKngmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738581312; c=relaxed/simple;
	bh=XVC1ndxrZaLe+d05VFLtvNnU3D6DLPiWOoCaBqgVZk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VxnV1Ty0H+uK+4Pfj7qZ9WXR2Oqoq99fYeu/Y5p8LExLlSuAeo+QG0eT7mkwj8369w9hYIO7BSGFeS2wzKnrhmJu/ON54UZECKdodcqmSDkmf1pABB3b1cBidaHyeDGazLdyg7AuUyAEOk9fTq2cualE3W+7E7vqsEV06FXCfAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z2Bl6RE1; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z2Bl6RE1"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4aff5b3845eso1723387137.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738581309; x=1739186109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVC1ndxrZaLe+d05VFLtvNnU3D6DLPiWOoCaBqgVZk8=;
        b=Z2Bl6RE1KtvROhkeEGCm65oW8bOJLk4WHhBeTCCsywaLwua2cxOpq6Ec3HLkMNWutL
         QvM4LXp7pp4CBft2pT7NhreMTME8u5bc6IVdgQw/GYHhDd8e1nJlTYq2QmMx0yxo+a58
         xxpDirjX+XH6XwDNSE5HBMcCCg6nfAAMkTHkLwUuhHSBakAlAFl75Mwji3BeN/TW1/wi
         pTqcunXiF6TKs0vf83QWlU/F1LZ2HXKyTLQ/orqLuhyAsKm0KUAm4zRamPwO6IWjZ4PR
         fdAZ6Gnqo9j4wFyatqBXROFgcZri8FznPVwBDfEz947WbE+KbP62fiPnuABavm0d/ZB7
         MgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738581309; x=1739186109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVC1ndxrZaLe+d05VFLtvNnU3D6DLPiWOoCaBqgVZk8=;
        b=adbbBmXq6jMKR/ORzCee08qwBgnAz1O+OubXSEuuhKe0KMZINEwc9nlkt3SE5wcwiL
         Udrh5SmYZpB/xMIu7rlwUaS5WStNymhPMzEJ2A7tjGaP77lw2CBt2Y73CFwk7AR+0CMJ
         3ngbSvdF/uL06THbeeM06DGj4q6JP46LpekpaXyo2aMBdBuinf0SCdSM8nSTMjgT3dfT
         F6lY4qTKimXngYPs770HAa1pEBcZ7jGTqQldZGdUzeJ6kt7iaggIpAEJcJJjBNCIXHRX
         TQYH5asV6WI5JuxaYoiizKGQFqfv7TPp7KiTLHT14RtIYadiLzw6g9Z4OPZwYXFErG28
         pUVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzrTwlMfKCLgYbrGz9UkVfAk4lfVYUJoRKnCQRmUbf9J1KjtlI0V4VQ3sXBpu5VMRyOHHmk7cq3HtUJRM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1fzI+xzwNsvlEM/kN9ruutX2B1vyzjtYPJnZ4/T7OLW7xVyi2
	nqnD8J6PY6ozO8Yp4gm6grM1LFLQRq6QgoOjf7ZyOqofSzRdNWh7PI6lfz5nzsaZxhx6AcRw5eL
	TFl7eH8qBMywkhTrKttRPYkgPbz7oRygad1Tx0Q==
X-Gm-Gg: ASbGncsJpswkIofWttRX2lErpljpsFwsAFrH0oa+D/fMnU2WPgI0Eq7l95X0tinNXf/
	KnhKIPDiQGk68asarYMhg1Bxo/+Wm9wHpLoaUyZ83Ovt0/kp1IikmETF57+3Yfiy4vT5lTjExYP
	M=
X-Google-Smtp-Source: AGHT+IEZJ4ht/4JUca00rjKHmLI0x0Tdnx3LsSJdqx/Ig8hvd7BRVwnatUEMpzWzbQ0C4BBpkq6dQgnAG6j4jIidAXE=
X-Received: by 2002:a05:6102:3706:b0:4b1:14f3:5d6d with SMTP id
 ada2fe7eead31-4b9a4f10c27mr14207280137.6.1738581309555; Mon, 03 Feb 2025
 03:15:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203080030.384929-1-sumit.garg@linaro.org>
 <CAHUa44FXzL-MZ5y7x6qrsn3GJR=1oR8bbRVCv6ZTvDRoQmENEg@mail.gmail.com> <65aedfdf-0a13-445d-956c-6945f1b49681@app.fastmail.com>
In-Reply-To: <65aedfdf-0a13-445d-956c-6945f1b49681@app.fastmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 3 Feb 2025 16:44:58 +0530
X-Gm-Features: AWEUYZlSri3MYlCywfp3d6_FlDHi6H482QnGSZIllNXjxdK5HOntcqkUnai1PoM
Message-ID: <CAFA6WYPt+DkOXd_0Sj5axH+kMx+NtEc+7rsrn93Mk9aDW2Sqbg@mail.gmail.com>
Subject: Re: [PATCH v2] tee: optee: Fix supplicant wait loop
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, op-tee@lists.trustedfirmware.org, 
	Jerome Forissier <jerome.forissier@linaro.org>, dannenberg@ti.com, javier@javigon.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Feb 2025 at 16:23, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Feb 3, 2025, at 10:31, Jens Wiklander wrote:
> > On Mon, Feb 3, 2025 at 9:00=E2=80=AFAM Sumit Garg <sumit.garg@linaro.or=
g> wrote:
>
> > Why not mutex_lock()? If we fail to acquire the mutex here, we will
> > quite likely free the req list item below at the end of this function
> > while it remains in the list.
>
> Right, I had mentioned mutex_lock_killable in an earlier reply,
> as I didn't know exactly where it hang. If we know that the
> wait_event_interruptible() was causing the hang, then the
> normal mutex_lock should be fine.
>

Yeah for my current test scenario mutex_lock() works fine too but I
added mutex_lock_killable() just in another theoretical corner case
being stuck acquiring mutex while someone is trying to kill the
process. But let's avoid over complexity for the time being with a
simpler mutex_lock() approach.

-Sumit

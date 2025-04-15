Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD979DF59
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744754902; cv=none; b=iVFU/aPCGID9gHFd8Pfqjsc59Ww7CXnDD4ACe1UiH2/jPBxmwJKf03NKVmJJAvjs1/dec8GJc0FObOfKy9lXXRDKW3PyNE3xPwxJqm8Vt9BwELe6VfJXTeA8GnHm5AlzEdnTp0JvYNmwdHYXaNZYGAayXZWwc6R19QmIml86Ixg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744754902; c=relaxed/simple;
	bh=BfzcMj9rMfWGxK4br5oNdBb324jSxRfmapgoM2d2W88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t25ck4LuVaDggtgTx0lPlOC+odrYXEWyxZWu5umdwHKl3V0zSV4fKv2872CLnhU7XZUbMcBY18dpPPLQe1fpCV8YBgVDkYpNnirCGdWYQPBCt1tH4TtjTGIEKbUocPwbLZPXGSMaM0BtQLm+kjHMdKFDmASGnTlMNXxBqLEO4gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xSYrZxu0; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xSYrZxu0"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so53670501fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744754898; x=1745359698; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfzcMj9rMfWGxK4br5oNdBb324jSxRfmapgoM2d2W88=;
        b=xSYrZxu0DoyRTV0mZiTPDGQ9TRl2xvLyKNHhTlqtvj6QdpTobdhvzHJj3/wmq8+D6N
         hSHsEfWLt3jEsgKx36ct4D7FePEn47DWjdA2Hfjyfg50ynz5rVro47BAJFH9JTENaIRk
         D1oPjAZ56+XsVhEXDvIS2Xs0VoQztfX+orIBKBn0wUpjbA+XT7vtAst4vbfR799cPHa8
         UXebE2Rr1TY2VALPC29IaKqUnp8tuSxmhLihpwGUJN7J+5MqGLS8o4q5LqfQedZ1ar1U
         thl8u1t0SXgy1zbx4GCmofhos5O7IWw5ZxM5pLSyYN/6HBJOQA0m6aqRdFGvlk0lEcWC
         PoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744754898; x=1745359698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfzcMj9rMfWGxK4br5oNdBb324jSxRfmapgoM2d2W88=;
        b=UMVYedTYFsNiLgyT8jRBx6ddjmcirAVVgv7iiqjJDmmDJu+aZ16YGQNK7dh8jCv1Rj
         58xpmUw0CPT1od2tpFDU2RVu1uAztc4A+/Fnh7+ZJxL4XVAYlYf3DqCiyQ69/8/yrU/W
         DPt9OGD4rUNbGmq7i1T8Tc7zdtK9h61/3RDuP4TiyF1sJUMxJ8D1ymeKsFHI2eLJt6bh
         DpmXU5fp28Z2S7wobi4SmLxCeBETz01ont5E+7ZisTv7P+6nCuISxXnj71iOKOhfDn6s
         0Tnz1OIkT37Kd6EU/4jwmb4fkMkScyLZyM7ZO6N4VEH0DJCgVJnhuayVa008tXRCH8n3
         RtGg==
X-Forwarded-Encrypted: i=1; AJvYcCXNerSF5WihWhHM52PHyYKGURQ/JNvdj7MHe8Uk0aNBeFqoVYo4l1iBcxkPLUX5KFpJLapY1u6xLSx3Ed0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVhqBQNi6lx8j8gabLJQ/fFARtHLU4Nj4T8KuGJnG+mGIeiND8
	kMkaLiq9nCDxTgCkEkyv1r8B5rC9DlHfgVOE1Hk5z3kyR8xynjTAol0nkO+5rNN0/T9GnSizEel
	JuUiwDJ5IbFgOrYco+KZBjtqlCswOEyJnWzPF/Q==
X-Gm-Gg: ASbGncuiWfSMssiAZOkccYE9QTYrX58KVzkOxxKXfGYI/0FNGrx2VaAD2F7ZeY8c9cP
	gDvzSEt/6uOdKd5b3C2eeQlUiokjS0Xo/G78KF2YVD2fh8foLwWiEld7224gKaoIIcexjQptPaX
	CR5SiEUWeF1P6DCtfPx6fj9AYnA3RPD7O1
X-Google-Smtp-Source: AGHT+IHME6WhXalxlSPMh3DrzpLBS3m4KTrSQRda1Fkzzwg9vWhHTJqmuOgiRLVa0dHhEZ5Zf/JplgqHpAebpbRY5D4=
X-Received: by 2002:a05:651c:1470:b0:30d:e104:b593 with SMTP id
 38308e7fff4ca-3107c36e105mr1677811fa.39.1744754897789; Tue, 15 Apr 2025
 15:08:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410023652.8266-1-hanchunchao@inspur.com>
In-Reply-To: <20250410023652.8266-1-hanchunchao@inspur.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 00:08:06 +0200
X-Gm-Features: ATxdqUFR6vsrzijVD_Qjdt1doHFGMo0fgRLa54xDdj1l3AD5b73FKPjghdKzqJ0
Message-ID: <CACRpkdYhsoermgqTiLqUZHUL8c06meg89F_gei1CatH6hJ_nkg@mail.gmail.com>
Subject: Re: [PATCH] ARM: Remove the repeated word "the" in Kconfig.
To: Charles Han <hanchunchao@inspur.com>
Cc: linux@armlinux.org.uk, rmk+kernel@armlinux.org.uk, ardb@kernel.org, 
	arnd@arndb.de, iuyuntao12@huawei.com, ruanjinjie@huawei.com, 
	ebiggers@google.com, david@redhat.com, masahiroy@kernel.org, 
	dave@vasilevsky.ca, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Charles,

On Thu, Apr 10, 2025 at 4:37=E2=80=AFAM Charles Han <hanchunchao@inspur.com=
> wrote:

> Fix "The the" typo in the description.
>
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Please put this patch into Russell's patch tracker so it's easy for
him to apply it.
https://www.armlinux.org.uk/developer/patches/

Yours,
Linus Walleij

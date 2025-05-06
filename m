Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E9E4A24
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746518039; cv=none; b=KrfT5zSHClA87ELmmuMPk+ODB96EzmBRcQmDEVgBuFlbi8mnH0paijPgrd/MzspMP6U1RFRADTZGtvpLyiEb2obeRh6BUlUYYDBCQ0NpjQreTptGt5nypy+y2+T5bFbPLeMdd4hpU1rh2oDv1h8lnYavbD/WszYFJbwatJ157Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746518039; c=relaxed/simple;
	bh=JscL+bjhizxl/VXl2XNE12A5YSF/kEsWbbqNxdspqsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MsoipO6JaXpl0jP0+zhwkj6GRwi2D0IvzVVsfJ57FWrj2QI7gqWxKc9HOgUlCNyS3PUuvUpRlI8z8R5VtdFAeQn/0PkcGwINeOAS2+Adx8O/UhVsiNVkKBi43HZfnRrOm7mObysoZG7Y6i4gdi2upTJRw8myhitLgvaI7u2sN44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DfKzxirR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DfKzxirR"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-549963b5551so5919106e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 00:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746518036; x=1747122836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JscL+bjhizxl/VXl2XNE12A5YSF/kEsWbbqNxdspqsc=;
        b=DfKzxirRb8TABFC7uPN2lYJn/qCS6FrxVwcDr4SRP7WhXrAyB5N9EyExNWELll0Ad6
         FMW1UHYJHv3Uoijjip0bWhBCf7TwhYZFpAcCO6qqLGjrQF8EI9RJs+74R5a6hf6ZcN/U
         O8CPiEHqUdluzZAaXWu1IJ/zQzZdRimYhv5acT6iLToM918UOraskJE0zmMI7wgXr6jL
         qWDBYjwuIgrGyqCjDRDBT08hmEt3qou70bzNgaB7PqHO11lnXYLBnaDqLvpnsfGTtY7l
         dfkah8iKrDOTQoQx79sQPXtIsIiEHT0ke3NaV+jwiHtZO4aTrr+YadnRnBiBJ09DQ1Ne
         agRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746518036; x=1747122836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JscL+bjhizxl/VXl2XNE12A5YSF/kEsWbbqNxdspqsc=;
        b=icO2iBRrvrffBynfbCRfwdiz74vDU68VPkhRcGbvqOyup4B6dmpwyxzISFlgUEGr2i
         FwvkGuBurX/mCqd2FWCe/bOZS/AY1lIpzRfFGfdsXBKeAIxP2O8q2taQvJUTsWw8mzkY
         74sUw8SLlL8V+VWfxmcrvo29YZFlFAPG9BXkX8FUXorsy81u7XHTDRpArCpNS0JqTXuE
         wrGrN75EwVdRUDf9pkzwDVBWxBcqMVWIQvkqu3XoqPhmEfEw9GH1n9I9o/GfqexQ+bRw
         U8M+kVaVIjFp1xoqhFx9XRywfddP6vhuLCseKhThVjluUQSocsKAMrVu59Jcf7ncFV8s
         e97g==
X-Forwarded-Encrypted: i=1; AJvYcCWauXLf84fors1LOrxdl7qahJqG+JTmHwQ7yzjetVNxT9z9kvpMoyiKR3KbWORGpwJSh8rWOSNtoEpojYo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7cBNVpo5vL1uro3Wuw58sFJw826/pASeqlctuQV1p17HTP+ZN
	rGb8c+vOEqZKCscEzoLZoj6gFh+cQvDmj53a0+Q2Sc2b/LEdV0xBZhOVl2cFCqnthd8T6gn2RXB
	k+COxWtMfFTrAWCKxvP7ngtX6AcLYPW1RD5fimVW+UWpuGhf+P+A=
X-Gm-Gg: ASbGnctI97/AKhoFVZV85dxm21jHUwXZ4hispwSqjFbYJ6OtHaYWsncEOlTgmS/i4we
	4w3HrMSSYYsbPkn8EN2VTX4iICWDtpM6Wx+dUDLendEn51HDiC7/sHV/1bmi0GWOwFTeSWkgGHk
	UCZ8+I57ezs7wSSxQ1TIV5xw==
X-Google-Smtp-Source: AGHT+IF91l9MSJHufEzIXbuFx2951Qfg90hY8mnCf7auO/TilTLWdM48ESfSxXtPpkT6j485LMfJPJx1ASyKbnclt/8=
X-Received: by 2002:a2e:a986:0:b0:30d:b89d:aafd with SMTP id
 38308e7fff4ca-3266cb0a41amr5820561fa.31.1746518035967; Tue, 06 May 2025
 00:53:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506022241.2587534-1-robh@kernel.org>
In-Reply-To: <20250506022241.2587534-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 May 2025 09:53:45 +0200
X-Gm-Features: ATxdqUF2xR_n1OAmI33TitnuvBI7EySPMcpq6MNTJ065NAvfrLt-E_rn3C-_-xc
Message-ID: <CACRpkdYvxV+5d84qJtE+mpDbKq0qagrDn3zjRxQQgfJVuGKGEw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: Convert faraday,fttmr010 to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 4:22=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org> =
wrote:

> Convert the Faraday fttmr010 Timer binding to DT schema format. Adjust
> the compatible string values to match what's in use. The number of
> interrupts can also be anywhere from 1 to 8. The clock-names order was
> reversed compared to what's used.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

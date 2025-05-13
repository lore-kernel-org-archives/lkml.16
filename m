Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286CE28E564
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140847; cv=none; b=KbiEd2GuLQZ+IV6B5ALpI/YuWhdlvuwlQjY1+fpDV3wb9SO1S2tlB6iOoSr11rIsx/432vKLaeNAhxelqnPdk8lBg6WcgJ52Kp4dw+ck3IAkCVAsD6J57e/WPbqODwkKnwPMZ9jMviswCHE8DdKNBrI0UvLZLRtpon5kAz9gJYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140847; c=relaxed/simple;
	bh=n5DNtYUI843g0yIiLjFDVuZwRILHtDU6heRbq8kkdJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NR8YGhu4TVoB2fbpbIVdQBEJh8iQhAHdiDoID6nxB4oE1cez0gIhub76AcuETx09GT7q86pjq8xYevsRC6oaSrI+NO7k7HNUcMl6dUKlrxpOTje72BLZ8GQmh1B9GZ7ZJK8WEky/goltpxHk6VmA/WZCKFAjqr9D2NBTwh20Rg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UXb9KiRK; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UXb9KiRK"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3104ddb8051so59346671fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747140843; x=1747745643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5DNtYUI843g0yIiLjFDVuZwRILHtDU6heRbq8kkdJQ=;
        b=UXb9KiRK1Mtk9YdgOh+42d6H9idbQx84M1YAAZ5IzgtH2EZR8jVbedfnrWmmCwqHHk
         9CDf/1dlixns3zmA7zJpRwgFp+x9kBwnPZC6TmVAVjnBKzGgeMkr+B8JjOoOTxheNJN2
         A0/W7WRk4faW4QTxLTQSaWNoxanijP+LGRJfIej0VwubSkXh30WDHv0a7mNBCD23Vwmt
         FDjJYL7JC/pr/sR1AOSk1ov3bhotZgrA16vU1aSmYvF8rZ31mx3/Y55voj0MzisrgJ8z
         w8F4AMKHIviet5eKkB7jF/DPx3tnxrldK8roph7EXTUX9Yq5sjXcW3+arxw7oFo+zb3O
         hhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140843; x=1747745643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5DNtYUI843g0yIiLjFDVuZwRILHtDU6heRbq8kkdJQ=;
        b=sjMBXpiGPkgfcCOGI2LwCesTJeCHsl3ujmutru/Vgg23JbDb3/7TgTh9+YM68aLxRy
         ls4yEB3Rz0PqJhC0H7AwaxZhzoYaUxaPJ+U0VRKB1fIs2hu6qP7tz75F357oBQZdUM/s
         0pGyFkW7y9/bQY+dxsjD4Lnkg0t4nlxi/044XCEK6s/afAfOquK2jYt9PXqQRkiXmviI
         dbCEtvnWQyioEtGlDdnnzo/qdor3dovuvZdp7dMRj6OA3pCXgClWVOcQA1xIohgrg82J
         NFeix+/W01g46zTrV1tgdwO/9wPlTqz8qKWK0FnUbJSxcFDUJ3InMHdgCDrv9ZO0OOSh
         Jirw==
X-Forwarded-Encrypted: i=1; AJvYcCXoq65HL7Gtpbj3RFZobO7La8feuGZrYbe6phXCoyERSKOx0nNRWe7bpk/WKqpMLLTd3Rbv2tPQt2bpHxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdKv0pMj3+aMflC7JJ8ng4v18vunadQ2dZlWOA/d0avUyybhIo
	pcgZmR+Z/t1VRFWSPOmyU6aTeExnTSUJYCDy1LvQH0LKrp7AnQTJIawqk6lVa3DfkjNtlG4nuqR
	JODTYKJAniqpB/+NpDQlIaYrysIRBrEMWC69zZw==
X-Gm-Gg: ASbGncvQNKytFVCEhPHnSOoo86epiV1DLyRafv53Gn9mB+VDhzcPs9lxqI9OhbUSyO+
	H9Vr+iKyWxF+YNPj9v3J2k66Clw2cWhcLPQvdZaoZIqaT63obdtNvHBNe/IH6QQ7Lg8DfRXSn0R
	VBjUghubdJdGXh6RT/ZFHBDoEf76IrmPXi
X-Google-Smtp-Source: AGHT+IFZsPaNB7cQG5TO5oVxZDZD/YN8ybgCpE8L4Y5f1+vnu87em/ryPwHwzngIjpOkdu6PynjrJ2CQaef5h80Qtm0=
X-Received: by 2002:a2e:be89:0:b0:30b:fd28:a771 with SMTP id
 38308e7fff4ca-326c43ed095mr69137661fa.0.1747140843144; Tue, 13 May 2025
 05:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-correct_gpio_ranges-v3-0-49a7d292befa@quicinc.com>
In-Reply-To: <20250506-correct_gpio_ranges-v3-0-49a7d292befa@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 14:53:51 +0200
X-Gm-Features: AX0GCFvfxiAiOF97d_g8FaMONqLX8vuoL3GFla71xwbaspfDFQXlOOP7NTUarN0
Message-ID: <CACRpkda57USe-6zkYKsOfKZcfZx-0DBa-dP2OxkoGsy+tLfHxA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Correct the number of GPIOs in gpio-ranges for
 QCS615 and QCS8300
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jingyi Wang <quic_jingyw@quicinc.com>, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 8:23=E2=80=AFAM Lijuan Gao <quic_lijuang@quicinc.com=
> wrote:

> The UFS_RESET pin on Qualcomm SoCs are controlled by TLMM and exposed
> through the GPIO framework. It is expected to be wired to the reset pin
> of the primary UFS memory so that the UFS driver can toggle it.
>
> The UFS_RESET pin is exported as GPIOs in addtion to the real GPIOs. The
> QCS615 TLMM pin controller has GPIOs 0-122, so correct the gpio-rangs to
> 124. The QCS8300 TLMM pin controller has GPIOs 0-132, so correct the
> gpio-rangs to 134.
>
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>

Patches applied for v6.16!

Yours,
Linus Walleij

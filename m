Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD18281353
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238786; cv=none; b=YQVGJbSIt/u+jBNXSLYLPw7El/ezO04ZFshlkNrBWowAt/5lDHRlbz6AU2LhvP4jZdwFuIl/DS8NpjqLJkL+mUGLX6pMk/6IEoe0NJ3cOHswgD/bCV/Nb+iZno5P/ebFxPidSpVPOaXmHhEw/JRJIV9VOSVPYuNO0NiX1YSlBvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238786; c=relaxed/simple;
	bh=nAixNKedNDaYjMoDbFJJWtykzraK5wtml5m9AKWJpzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ByfT/q12w8nbfKbYF/bd3kHdzwoeLOhPZkJp1vvYlfaAAS1RWXdAli8i76UMB/kesj6wqfYgaZlFTdhpedain393iRZ+CvoBPUeNcipVtYQDzdrSWE8P7WSJuWSLboBqyAHfnFxY5didNBHP8Y0wYvhrqZr7Q+Qt5HPNxICS9YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yAeeIEfz; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yAeeIEfz"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so584844e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750238783; x=1750843583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWFR3lJZvy4GZXmA1xUeMKYw+5FpI0OcmJNgyVyXgIw=;
        b=yAeeIEfzr7L+oZZxhNiqA2bDIsKcUw9vfMsxJy3A8Li+vwxW7MT0ewaxRF7X3wUwe2
         /100WBwO6ZoaskvMXg2kNHVFa/OUULZs1XfArhRJI3aNJYjesKZNlYeSW89ts8Noenmg
         DoOVyZGCOOwYvVpYebqS6YoQDwPGwNzyC6KD6ggOGNkIy1gUdSu8wiVcEh6t44ZSa2Ir
         YbWh3Wwnq23AKhVLjP79qaCAl3IAQAKBQ8g5d1W+XMUXt9O6MuJTUHr3IG6gDACJIV1R
         83yqgpsSeJ9xCrJjNdcStL0HgynCSL2zFA9QMWYjON+jELo+VUZUJTmerK/neFL3xCn3
         VfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238783; x=1750843583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWFR3lJZvy4GZXmA1xUeMKYw+5FpI0OcmJNgyVyXgIw=;
        b=tAb3El2ufWqVVSiQ1f8c0x90Q1rD1FeSHPFlwlQMf+rrUl1/te8cG2rHeIjQjaa29n
         sJbcaVHwMzuGCfYfLIWQXZkkrVNZQSJ1mOqn0gbym1gNBl8FFL2hc+hL7bhD3L37k8Ts
         WfnrA8pP30Y9hEcjY+GCxvO87WjToUe7h0fzMtp6evJfU8uivaRSKDjXqVS28sK2lKvh
         r/tojxN8VvXuLX1MRFgDxS27r7/3XrvE3GozO0jzjZ7//xcvprn4K5leisjtOBt4uSN4
         i6Z2ORPD4bI1Ug3SgtL4nFfhOw6U8OvkFXFO6NhfjPdbqqes8AnrZovYaOb4QgIDb4EV
         eu/A==
X-Forwarded-Encrypted: i=1; AJvYcCXNvIVRWXzYUF4rHsYlUGavQAKVHPHt6SKfhQ3JgpwP31rNGdbx5Gpl/GSJEmm/pWR8cNUPs9PpxPUiaKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA+6LwQ5bDxqo64QAa5FF/l3GVNhjp/bscECS5y19Tv8ZED72Q
	6E5Zelh+FyoZYaVXX+SudXS2l6jj+xrubdmW+pjmTYw+hSkfJdrtIPDywCHZuQ+Pvf3SacARjD9
	5o5aed4x2AzVHjw1YxBLhdAGTMBXmEkNttdfNg2gblg==
X-Gm-Gg: ASbGncsErOpyHnrglM1T7zxxgw5bREdhvd4d6WEG9T+OwGgr7iSPwfTQ0hka7RlAc1G
	WPu9L9T1w6mXWtU/yRsiH5nQ2PRcT7vbxgVFwszJRbJhd+zcnZDIhHQFa+ur3sXsgJEFNQbu76G
	WZ8lXZTvnyMYUL62K46mNBhFpBO4A9OH+LuKrXINNRclo0RZHjCH4Amw==
X-Google-Smtp-Source: AGHT+IGZulR1H9+iCIC55gEsLEoE0oqDCjkL5Fd28aQJZaej+7J7V66hn4S2QtWJZn/tk65wm8JptBmvBC8HG7edLQ4=
X-Received: by 2002:a05:6512:4023:b0:553:2375:c6e8 with SMTP id
 2adb3069b0e04-553d38bc9edmr644722e87.1.1750238782845; Wed, 18 Jun 2025
 02:26:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610152309.299438-1-antonio.borneo@foss.st.com>
In-Reply-To: <20250610152309.299438-1-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 11:26:11 +0200
X-Gm-Features: AX0GCFudSA6Ai2Ztyy99YXMMTippK2eV4K98kdxAH7hr-WIHL4mRq5_nr4kVdg8
Message-ID: <CACRpkdYy+sVQAdntEWMfJGqEzw+eexLGG6pXt8QVYD47rVzjdw@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 0/5] STM32 pinctrl: Add mux function RSVD
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 5:24=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Antonio Borneo (3):
>   ARM: dts: stm32: Add pinmux for CM4 leds pins
>   ARM: dts: stm32: Add leds for CM4 on stm32mp15xx-ed1 and
>     stm32mp15xx-dkx

Please apply these two through the SoC tree.

>   dt-bindings: pinctrl: stm32: Add missing blank lines

Waiting for a DT binding maintainer review on this one.

> Fabien Dessenne (2):
>   pinctrl: stm32: Handle RSVD pin configuration
>   dt-bindings: pinctrl: stm32: Add RSVD mux function

I applied these tow because I have a DT binding ACK on 2/5.

Yours,
Linus Walleij

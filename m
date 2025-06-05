Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898FF219A8B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128649; cv=none; b=j/FmKE6/L8L9SjWIuXCZT76/EPfWNmyKxGV9XMzBZWSa1+cnHjxEpHmEPu9H2UkGh4e3ZZEWoCf3Osn3gzFVzdCGLDHGiLIvzMwatfrmcbW9y+4y/zAEhHvi4mQtd9/rMbVlpABr2I5qXu8lJRtLkGemPS36ZVJBbiDMzObjP7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128649; c=relaxed/simple;
	bh=O7dQ3m/uYmPoqyfsSUFVWBEx6l6prCA2sVcYnZrj78w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWMbNMt2rP6D9eBcJcoABoamQ+wpNT7crmOPCTxTvRLtz0nP8Bhd0cNPeRz1zFZvWdjTgxEdSySCcqDEKs93qV6skq9SBdCUU1+QZ7+TlsP5K00xo9cH4LwTX/VTHIDVUECGdFiCyV/AqvwhVYCNuK2hwFhEIbuBiUsxmS/vNOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C1VJeZ/+; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C1VJeZ/+"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32918fe5334so9742921fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128646; x=1749733446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTZ52CsCJSz/QeNJLPayBq/ppqiw3jdmte3lq8NK6Nk=;
        b=C1VJeZ/+J4xrKXn8eqF6PBaMHl6JwKjJcrj/vqAXV9t/U9siQdFkvxxMt0Gqi7ef2Z
         TkVa2/dBHQlm0u9FREi99lA3HiIpPIN/i78rOjp4W54BZAsNt/Ympk3ttQw2U+Xcvdmv
         mrVw6u7Rdknvy/W5+pnZu8s0B10fFUOxqjFEsj6Awg6aSU9ORelRHpHf5yadY2Nas0Nz
         IS1zmZu3gA0S1lbYyXvSO3kOyIdjMT7SvAGo+pXUyKmQ8l6Ki/uVLxjIxklrSYm3BE34
         9WhUoCNr1C6c3EWvrJTixJVeO2+Z84lTKUraoxUznX3mok5zgXoeDE5hZe96jkHqC6ns
         bKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128646; x=1749733446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTZ52CsCJSz/QeNJLPayBq/ppqiw3jdmte3lq8NK6Nk=;
        b=f2WhK3yrWqTay4CWohdFYE/H0fIMs9ebfhZylS02uK1Blk++PtbXFbMafjNMTDlvGz
         wg4azWNwRXA2CPXpE/WhK4X8C62kacwz77o5vMlt8QwwYvMWNKSwEf7TpL8i66vSBsY5
         oIXtgQ3QgtUzl2XGuR94YPTHIzKwBjRjxKJPpbU2zgotMO9kQqu4phXnRkZK2Woz3dqA
         1Jlbx/LFv4piIAwzIguzZ8Yhp+PqLkMVpaEdCr76n41oMNeW/ZvzfXX/FmYnnZDATS25
         kC2rF6cO1sSoCHZGcB+iqfr3nW4YtctiGtelpJSSZopJ6UMt2daL6Gk/sB+Qyng0m202
         iaAg==
X-Forwarded-Encrypted: i=1; AJvYcCXxYzqpglzoJ5sDFoZzgHZnW6rVQdgZFqQQjZgS2uGwJN9aqvko1uISMraXcsH0LJHLBBKCGCAO1sPTSXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrTodE/B5gc0y9nXgJHvvDtZUPoh/oKq74Ucofo2kLV/fPdNvW
	vyUUsyANI0NrXg0+CnnoavJmihS8KOfFrNUcFQGSNnwH7J+TFmU1Cez/nwQvuOeomPLapAT9BkT
	GtgKP84Uyia+YwWZY1x1AR6wCnrw6+YT/+l1/54egbA==
X-Gm-Gg: ASbGnctL5eaq+n6I4CuCLJFtxRNNXIyPi+uN6MAtQd1At/L0qv1wi7dDWfIa8SIEow1
	oYUD0vqnre8APQbZCoxHoWG642GZ+ypUj5Mhmu3Oh9REW89qkH1AYQHoKEnZHrkA4kChbuikcNL
	XrxB1rujXTebofPz7r9muJa+yvrpJFmF2F
X-Google-Smtp-Source: AGHT+IFcPULkbbdrU9YX2kszYmWTERZ0//0Le6dHomayrozyq+3I7C/+UGmesPBjV+IcBlIt/T3KkSYORg6xv8C76qs=
X-Received: by 2002:a2e:a90c:0:b0:32a:869e:4c13 with SMTP id
 38308e7fff4ca-32ac71a1ff6mr18438481fa.14.1749128645400; Thu, 05 Jun 2025
 06:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:03:54 +0200
X-Gm-Features: AX0GCFs9rU2_ZImIle5775iF8CDEkgQxBaV1si5YeNX6UMb2_fcREUrHEpczaEg
Message-ID: <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Introduce HDP support for STM32MP platforms
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 3:33=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> Cl=C3=A9ment Le Goffic (9):
>       gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
>       dt-bindings: pinctrl: stm32: Introduce HDP
>       pinctrl: stm32: Introduce HDP driver
>       MAINTAINERS: add Cl=C3=A9ment Le Goffic as STM32 HDP maintainer

Can I apply the driver and bindings patches 1-4 separately
from the rest of the series?

>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
>       ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinct=
rl node
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 b=
oard

Or does it need to be merged along with these?

Yours,
Linus Walleij

Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB301EB9E1
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248938; cv=none; b=HSHcSVHh53wk9TFo/n10wJoty2aVqlt7W9pAAlp9fWIhFOAviehPdjcg023qU7g348+P4JOQBvfKDK8NMntvx5UaMW0eco87HJ2ygC8gZmpVMhidZIS5jm4t35Y90bhROnYwwMBmskcYWB7UBhM4IflWwB3AbajF0PB+DuSf5sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248938; c=relaxed/simple;
	bh=lbSUV7iMOG8RNQJT3FC35YbqTkiHR5cFo6h4VEVJFKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHQc9w4FMQjWHr8GO7nSRH3I++y6l9mpgf4viRLp/HUW2NKpV4WerxAdSP41eitAQnpYKW2iT7QWVTUzAhzg9J7JyzbJfzolB81LZtLwbpuXnfbo3gux0DZITF1DBAYS+L2kg77B1fLO7vBzc3Iro0F1x2ybdXJ7DTF2pI9Rc/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bi5SETsX; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bi5SETsX"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b584ac96so5307298e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248935; x=1750853735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7jZQ+YS+lWYeVwEC8VFaNnmqDYcJYXkLsLKJpyV1y0=;
        b=Bi5SETsXaZyYbDmid0EWLlL3xktYeHJlZSMiHdCtPPNPtebLdK1+42xog67UGixoC0
         +I/LtbApMJ36ENhn69yR7jNiKKPIt3AtorDwu7wvj/8ral4ZZcXx88LDQ5Nk5TDy5ZfT
         J0Tv4J20P92OhVyD7B6TZB3DkBkbZa4P0MVyRyFs9D0SLPDV5rlteylJhvxTHOGQOWnD
         I/8EFHi+sVhlFkZ2WwEYDwEhKXV2tvzHZEyZmTqla4ALbrvgGEnl4pF9jUFFI7OpoihX
         2N/l2mnFpIdIhp4+kiWcPU9oWSW2IPPQOkRggoVITHWVswIHF4xKgO7wiKIaxFH7ytHB
         kkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248935; x=1750853735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7jZQ+YS+lWYeVwEC8VFaNnmqDYcJYXkLsLKJpyV1y0=;
        b=xTxXZ226GAPT/DUeFXpiiE+I/CwUN2CkWJTe0n8+QzfejKBvlArVhr+0VoNXbp23Im
         JSJCDzqVbg1g2GxA6kaaeP7i8JWFNFVpOHPdl1/4Mth3Rsb418/HVf2gtWgY8ENNl/gX
         xLq9RbNef+BMSKIb+dyZe89tjGg3g3gDUhYxv7ECR6umWZMpV+8o3vtA+sDSNai7lNVk
         IurPeGJfFe+hJg5yd8aHxTjP0NOuIr2oRYv3sta/K7SX56RGsGaVp4eTYhN/AHdRHDi4
         xYATUG9+cY/xn9L5Fn3hG5E9IyPjIsuxjlt0nHW8yVOvVCpVskt1oacMk/OTh2LaYgQ8
         WTUA==
X-Forwarded-Encrypted: i=1; AJvYcCWDhOvfIZPSGzqaAHn3rdu7PVhZGqYwoqQ0YMq+YzyiQ7QxNkCSpQfuOrol8+ybcxGvF0bFgT1E+d0DGTs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdl74bbw6qRHwKlMjVC9ICOY1TEQsrIuME+sq+3zlD+JlHy1gi
	wsohs3Ph5of/B/FSmwWottgBRYLQUmExCwLuliXkVZpiF7vnw/mrH+EAK6OjcHvu2h47GRqTeF+
	K8fSDbcJQp8VGSNNlj2V7K7B80S7OFhftsIMaKWLsaA==
X-Gm-Gg: ASbGncuUktehgIExdxjGarj+0b3moYgspuWeFFT23wMyqGKhcvQsZeShrmRevxZ5MCl
	y37TZtwYn11tg2Dqt6szZl0zNBkwJ/SI1BUR5AH1lH/q7BPj4u37v/6WWpz+4PQ8UpL55yx+YV0
	6kw7CbPCGy3/vuk7wcCeEKz4rZFnbrmfncHs3pk7cWqUc=
X-Google-Smtp-Source: AGHT+IGBMbnQS8CZK59QUADw6V+D/mLT8w6YMYDnxWivA5Amu6Cgv0XDSbL6jWX7zdVZfzp8QG5Ih8L/ToZVwFJNik0=
X-Received: by 2002:a05:6512:1285:b0:545:6fa:bf5f with SMTP id
 2adb3069b0e04-553b6e732b1mr4223465e87.2.1750248934811; Wed, 18 Jun 2025
 05:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com> <20250613033001.3153637-7-jacky_chou@aspeedtech.com>
In-Reply-To: <20250613033001.3153637-7-jacky_chou@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:15:23 +0200
X-Gm-Features: AX0GCFscY4ky5ebft20JokFvuO1y3hVcQ04FGalsWAeschf7cTa_SUmnKoC4ETU
Message-ID: <CACRpkdaX24z5YsfcrB2oqbZpdexZJNREGkWiYgq1ar0c8O0QBA@mail.gmail.com>
Subject: Re: [PATCH 6/7] pinctrl: aspeed-g6: Add PCIe RC PERST pin group
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org, 
	kishon@kernel.org, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, elbadrym@google.com, romlem@google.com, 
	anhphan@google.com, wak@google.com, yuxiaozhang@google.com, 
	BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 5:30=E2=80=AFAM Jacky Chou <jacky_chou@aspeedtech.c=
om> wrote:

> The PCIe RC PERST uses SSPRST# as PERST#  and enable this pin
> to output.
>
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Can I just apply this patch 6/7 in isolation from the others, to
the pin control tree?

Yours,
Linus Walleij

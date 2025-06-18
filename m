Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E64B283FFA
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238450; cv=none; b=giT8xuLEaqB77gs3PlLL7ZUyqdVp8QYr/jn7L96WPk2QKTgeCWYEB9mRwtkbCXoHTn3k7WOEYmkbVm6Wqiy6L1tiPrPa79vevn5DB286huQ0ZSQrQ8uNCcTOvP2T/rQSwSB0ZIYIQPtlILRxD0zcbWPq2zTI+rEbVblU1WbnNBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238450; c=relaxed/simple;
	bh=IRP+3CAFUW4BsJ0AF1rbBPjb6qCHBeVG0qqt3MSiEw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tv8HJIJ4JH7vO+liLUOMHmKiEi28z/JvWkLfZgogUO24+TQ6n/Hks0X1iXaIFFs6vWXo/tSjhW+xWx7/y1fj/qCW93vT90UVnXkPKQNtopaOPFov8zbisE69OX/EYPzsbD/iyRsjiBN9aEoHo+tV/7S+KTForOLzaJfLAH9NgE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HsBRnGYx; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsBRnGYx"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32aabfd3813so58767381fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750238446; x=1750843246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRP+3CAFUW4BsJ0AF1rbBPjb6qCHBeVG0qqt3MSiEw4=;
        b=HsBRnGYxAnqjwazuk9LZaX0tF2m0h2w7nLRb8KeO5Sxrq5vZO++4xNQbF6vu0IM2/m
         vKbFC8jjhkIrdWNILWBcOeaQwVReO9+TVWV2Lbtty+EWLVLD8zT88b5DxcvKQsfW8V8K
         BjYGsy2KKIDUxTpJsMSr2B2nQzCRYOa5bUCbVBrYGkuwLmYSswqD4xGdcR0nBP4dAVyr
         2snT/5kQyuwUwqlB0RdVk60qdcCIbAyPL4P9yc4qra218KcTgsrrhzOvOsY6KxJsfOVr
         AoDpGgdpZySEwuiT435NfWqotwrzOG4rfy4/oLApZwKrb9FQsRaJEcG9kp0doDQSwAWj
         NrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238446; x=1750843246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRP+3CAFUW4BsJ0AF1rbBPjb6qCHBeVG0qqt3MSiEw4=;
        b=XewPe4l3Dqx9QrR09/NRBiJA1sO26gvYW9+xziY93YxfBBERa7a90fl9qQJtLzjHUA
         FgG7xKZT5JXX6UJsecs1/cyXSe1ahDchfreN9hcFQEtGYbvy2EooH6epsEYaQqrCwN6I
         E5RvOTx6/+MM5GJqJu9ialA+hIkrMASSpzKvn5wzosD1twqG+nJx5bkKyEg5aKw0FTSk
         2R0ZNN2lWbaflIZuWkLerKnH7SvSw7dPSaoH3we7FNmQDaZEI1NRCrYOsneNA9eiz4Lo
         hBzKbgAD9sT9D+5PgeLQRJa8/6XFKez0iJZw1sUbgsNBeEpkFGrhIiyG9NzvUDLtPAIW
         vu2w==
X-Forwarded-Encrypted: i=1; AJvYcCXWtyji/WinTHI+Tb0RwgLh0qnVnT4yp0DimWBb00Sj/U0VDRCGxQ8hyKunbdzxLab83KTxbVhbNf6rxQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkXwdgB7YF5O8TazHowJjqslvkbl4ZnouP25bq8YOTwpjbqWRw
	DYHdYoYL186iffj4FcSTZ7yBXvnYa/USdMSx9V8tyYQ2Lti2LJ9WdLOL3bsFjXXCHkCRNVBRNpf
	Txr2wvOSHmfAbpiYqG16/G2svgsQjVnIOX2UbIQNF+g==
X-Gm-Gg: ASbGncvUQnoD+4UxOKx29yWPc9XaNXiStEgPeksbZAvhhXdxkO/4twb1luF+atwUwjc
	0cos9e931rEhqu2jdLhhDprCtRjKui+nNZJu5KPnpHAEu9CfzhIO99w1F5eQqAZJ5CA2fHlUW8z
	pSuwm5+jZ5fkgE3Qo0YwEAPX6aMWopzYnKhGyhVErn+bA=
X-Google-Smtp-Source: AGHT+IGYHmwuRCbsyGw1J8Pu6GUbhDQ6w+nVs1//AI3lpbzQb9Bb3dDWstkl4KwszZdq0G2erWbc3Ga3QrnKGmbGGhc=
X-Received: by 2002:a05:651c:1a0a:b0:32b:522b:e446 with SMTP id
 38308e7fff4ca-32b522be65fmr41755231fa.10.1750238445710; Wed, 18 Jun 2025
 02:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610143042.295376-1-antonio.borneo@foss.st.com>
In-Reply-To: <20250610143042.295376-1-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 11:20:34 +0200
X-Gm-Features: AX0GCFuWBc_XYewjnfwAEfEgMlAZ5vMOVJJK7KgI8KvNcDIipEswDPcxuF3xpvc
Message-ID: <CACRpkdYVaTvArLVNUYf41nm_StVkWT0CMmTxheT9ovbBE+PopQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] pinctrl: stm32: add irq affinity, RIF, module support
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:32=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> This v2 is a subset of the v1, split-out to simplify the review.

Patches applied!

Yours,
Linus Walleij

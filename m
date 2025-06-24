Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D0417A2E2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792573; cv=none; b=dEu57kHjTAk8OEosJuBtO6MVd1qlrHuRWFFNA4iwz33v1uTx8Y7iTkKEFo1+EkKidFMGtbFooBErVO+Ls0dAFf1Yy6DNL/3kf5ICteNr2lfKWte9wCHgV36fPmJxPAyNsEakRzk+f4CYsLivzSBgfqZ0DTH9R5HybLVvybcHImk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792573; c=relaxed/simple;
	bh=ihWWakMukXt8Os5zOHseSTg4tzKTY1m9zw8OxkJuiHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9K7aq1IeOnh6TXo0Bu0Sc0UWQMS3SorgD1XDI3j0tOYV9iOgGTxwgjTjDQPUj/xyIq7sLN2pLDRuRqItEX5YoYXKJsPLT5iiCyuHIcf0xGQe8rcrxNXtDTGKR9xmZ+A2aOs92CEONRxwvAPa+i/PJx2WUJIBZei1Nv/KqU/LzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YpSnrxcg; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YpSnrxcg"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55350d0eedeso932914e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792570; x=1751397370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihWWakMukXt8Os5zOHseSTg4tzKTY1m9zw8OxkJuiHM=;
        b=YpSnrxcgP6His/jiye0hx5Tm1sOZSmfyn0sJdK7DtV9f4uim+LANBvNc8LUDl59lLm
         tmmhp313Uz4S7donnbcaJ0JF8NUMpc6Ru7CAILtRtikbmGbIJ/zYLAFaxY0r88YudGZ/
         IBVp+hHIyGZSLR2Gx2jimgSI/BP5toWa06oBMJiqFYDidQZR/4Rr3hxf7XQUVJV60xVW
         Tlokco5egdeRs4+5XGuxNlEE+fpWvz9wyffeD/e/LgwAw1bP6yVrL/Jur3ZmDKS2AP2S
         h3ik/aD+ZmHB6NYpNm9mNZnARiM137HofJmqV3k1b7n3bhIN4uOKhHI+uj11rxunhcoq
         g1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792570; x=1751397370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihWWakMukXt8Os5zOHseSTg4tzKTY1m9zw8OxkJuiHM=;
        b=OiFGlN9GxFmuBi2Av/67XDdXmmC2brr6/CbvmD1L02z/fFnHlSsn0LZio+5JlfMKkA
         qKjvjz8x54qBFXES1YpLZLzolJCj+ynLkgs+8v7KhLKkXJYgnxofZFXYdx7MYS8RIXpC
         dtoqxm/UQuE1H23NROu666ciXWloevj636z7NGQMj7FqRL1tx5e4YoN5HPdUuTtNTKSf
         58A35W9yQbc8ZpPdPyqndV7t/ggaDGv/nY9FKW8OusUyvNn5lEJTMHADTqoYn/1ZMU3U
         S9s8D4/WF1XA6cu8HQJPwhtd+8Yg3lohqWYnq66fmkmvHhddZdozo/WrNCvBrfADI2iO
         BxPA==
X-Forwarded-Encrypted: i=1; AJvYcCUUHeSZ+zLykUP5sacsrtDF1t8n5XU5q3KvIzQrtg4lbgC5yYCV1inQVq7cUe5hhItLTXxT4d3/z1hXQ8o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Bumy9mu2s2C5AEsTz6oO+bgY66Z25tDIxbniK9CP+OtViLxf
	u5oe8808gWJ/a8kULTU8csUx6Wt33BDNe5+/iAVXTU/YGxi5i+D0QIQ5vvNp2tZHpkqGtMBpUp9
	lSK+mrE7HxAnV7AFL5FzpPvwiOZQZTYwJqTrQtia5bg==
X-Gm-Gg: ASbGncsRRQxIC1BIE57+USW2JMRCeZql3hDXT3ISCwkSF9ATvhB0cpEXGXfNE3eqT92
	xsP4w+nQ4UtFqfC6s0w7tewHtCtkoIAootPq2FIl5O/iErCh7IVVZStFcz9VbwyUWuUIKC6pX//
	Iv00TWqM5iFjp0MOdI4/tFojyx/eGb8EYlp6GrEXQ4cT4=
X-Google-Smtp-Source: AGHT+IHmRRS+snn9ezdisZXjq9pNKvNF1NOIie7MqflwaPNY3SKz61GchJJ41LtKpgJIpimyXyrJyvJ1Pacxv1Ru12U=
X-Received: by 2002:ac2:4c45:0:b0:552:1c1b:561 with SMTP id
 2adb3069b0e04-554fdd23ba8mr18893e87.23.1750792570121; Tue, 24 Jun 2025
 12:16:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620010345.11247-1-chenyuan_fl@163.com> <20250620012708.16709-1-chenyuan_fl@163.com>
In-Reply-To: <20250620012708.16709-1-chenyuan_fl@163.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:15:58 +0200
X-Gm-Features: AX0GCFs0q4vtQFV_NNK7FgYpbrOMY93VLrNBvqqOTi5xPuc96sQtOMY9VoZarF0
Message-ID: <CACRpkdaA8UQYX8bFeHn4JCxLgK_-UxR_n=ZCZmgbk8tqSgnFAw@mail.gmail.com>
Subject: Re: [PATH v2] pinctrl: sunxi: Fix memory leak on krealloc failure in sunxi_pctrl_dt_node_to_map
To: Yuan Chen <chenyuan_fl@163.com>
Cc: wens@csie.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yuan Chen <chenyuan@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:27=E2=80=AFAM Yuan Chen <chenyuan_fl@163.com> wro=
te:

> From: Yuan Chen <chenyuan@kylinos.cn>
>
> In sunxi_pctrl_dt_node_to_map(), when krealloc() fails to resize the pinc=
trl_map
> array, the function returns -ENOMEM directly without freeing the previous=
ly
> allocated *map buffer. This results in a memory leak of the original kmal=
loc_array
> allocation.
>
> Fixes: e11dee2e98f8 ("pinctrl: sunxi: Deal with configless pins")
> Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>

Patch applied for fixes!

Yours,
Linus Walleij

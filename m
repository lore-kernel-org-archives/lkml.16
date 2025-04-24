Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6109E221DB2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484827; cv=none; b=EnhX0Wi34I6f9OzTT9iakkJ61hUW6YiIziKwuJEJkhmpOkeMIqrDHVsFUXep7ietxdaHTaOAdf+QM8A9ZALppQoL/GepP8NwgOKkhC+14TfEX79m+oNoiHfIw7eNEDT3BiGoXayoNndaREazqzVQ0TuT/pP37cElmx9HAcfMzyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484827; c=relaxed/simple;
	bh=h6xUHLkDXbn9hFTDw4xZ4U4OpXA7f7rhuSxwjLV2dJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SvOpSMmD1jQV9EPcjA18SdGfpFV6ThREGjMXiIY6NjGeochqi8E/8ZQSmkGK6BFPaKfxssiONKXKLxANAlBevScI+hE2X+Q5ZTwyNgkacBIXrMI8EX5bjLkZywc1oR/p9Wsk7u/RQ3qqVBQQBqFB46c12TZYLKsfSfcSwT+lbbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NW/qdQ9K; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NW/qdQ9K"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-31062172698so9648391fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484823; x=1746089623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6xUHLkDXbn9hFTDw4xZ4U4OpXA7f7rhuSxwjLV2dJw=;
        b=NW/qdQ9K7/Mb9vsIQ7M2FNOVzbP7jzgmLZ8w+4RdSAmCNY+G3PKjsQKppIY4g0cO+S
         JgIBY+iG7IL2QGBfp4qQ634bUhiToxEteftwLuazksyed0GoBcpz31zWn951YUaW9kfz
         yW5Do6xfyhz1r/ku6tDCdj3nKYFYiuXl10TYt0Zi85anL44hNqqt0gb85XDDPPBVjCwB
         t7t1BuJONpj+JzV/sZNT9gPlcY0Sku+9m59NNOSPP2Vu3rxy2j2+Qef8jPWQF/6MOHOa
         kZbBJWEK0dg0WbAvZhOWgPIQcclmMN0v5rqxq+WevLfmWyCDS5Bsa7I81wxkZeicxSkQ
         zAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484823; x=1746089623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6xUHLkDXbn9hFTDw4xZ4U4OpXA7f7rhuSxwjLV2dJw=;
        b=dcc2wZFeDXGij5WQEsn++CTE+XkzH4ucXpUINluWOlin5XeoHzWjy79BuUxppPJXNB
         fhw+XKf6ZSVCZf4bR649SStsr+M9Gunq9EcIne5abNx9sTMOf3HdHyPdRtNrT+YRq09A
         3JcAQEZfmiCuCdusQH6073chyNpKSZXtIWNUbL8/bWW16y/9pYVUFeWB3/mi2qoy69t+
         Lr1kSVVGwIWi529vbL8kgYTJIQTYx1woNSywcjQBKqe7oaNmOHEwzUlucVCf79+VwpLb
         3aSkEGASCbYOodqrgaZonD8BLi8uxcP1tZ27YRfktTyx7hNP4nanFE23IdVOvIdUlfB+
         38uw==
X-Forwarded-Encrypted: i=1; AJvYcCX1aLeEoLnuB1Mm5wkyF+tL7b4q763OPM09iUWE/s/esNUNGDXuEWHPTLOpUpK4JvHxi/G829NcuPVodAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjAeky++TcaisrEqmxsIWh73kspaZMQMrWD37IRoKRZVlVbGpN
	Lq6zDATus3KXr9K40NNRmfITrBUTJVqzh/q6TZM9N22Hfl0PDNoUvXNBy3HWhf4SmWUElFQZ6XB
	Yv+Wi06MIJ2G942IVlXjkZBYQcwUdPNNfD/MreA==
X-Gm-Gg: ASbGncvBmKSC74S04TyOlKzsqjjx+nxM/MsygUlE8wGNQq9Eqr68YcW5kcgYHoYmuTJ
	6cWlXnxRs3cpzvN65h5JynaAn0y1yYxlbO0ubrvYaYUWuEjDoXUgVWrWUSOPcXhBl22FXEhZp+A
	7ns1WphBI8L5TMrUJZsMcB0A==
X-Google-Smtp-Source: AGHT+IFd6o2V1cDvfxchwTZEaDmypkAJ0u4hlPv2if9D2Y7a8wVhtGISsPpquAIRqMziQ60KxwoTpx35yBhShkFLhuw=
X-Received: by 2002:a05:651c:993:b0:30b:a20d:1c06 with SMTP id
 38308e7fff4ca-3179bf49914mr6039361fa.0.1745484823463; Thu, 24 Apr 2025
 01:53:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Apr 2025 10:53:32 +0200
X-Gm-Features: ATxdqUH1x92NvEG1VXzt3NjeT_OyAU-iOFZq_KwpZ_kjnPdsk-aLLUsyLsYPhSY
Message-ID: <CACRpkdbMzKOkrxmWUuC-ORHg5gBdkmwrsbp4daA0aGnNs07bxA@mail.gmail.com>
Subject: Re: [PATCH 0/5] powerpc: convert board-file GPIO chips to using new
 value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 9:21=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all powerpc board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

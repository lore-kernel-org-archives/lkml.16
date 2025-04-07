Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0D6145355
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 06:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009197; cv=none; b=OxBJe3TaLiwCe5nCIcAJFi8PNwCNDsAdUYhqLm9Cpgu4EhKej2rC/pGjBnyspQfVjR732dagoFzUuq/0bTaua7/otgYshJL19IQt0CZSLVqWzTmxTVy1/QLLfe0mkw1lFo5pYZuVN+mGNnhqMG0LKRlmPzNq99B74lp0NBkV3z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009197; c=relaxed/simple;
	bh=zclVBcAH8FQLUCLJiKJqGovQwhajw/4BLJO78dfjJIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=it0jsTBe/lcSlxyZQj9kvKksz3RdUfNpvNFKHievt48bZ7wdR0vl2mswFmXQ9+/eE6vEo6MiKQ3g7xS/xRVfNgneLv16ynIPYhDlu5acx9HqaP2UQGa4ghxnr8nUeB8MlcnHUozmng692U2sJnYz4ZMA6pQXZv/bhLZj3kBo1F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EBYumcHB; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EBYumcHB"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30f30200b51so563831fa.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 23:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009193; x=1744613993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zclVBcAH8FQLUCLJiKJqGovQwhajw/4BLJO78dfjJIU=;
        b=EBYumcHBZISJ6GwoSlWwc7yNxjOhT8JscNt0IjjkDiEBKgpib4lAoW0TUNBkQp1aVd
         xM2SBXI5qs+CL7o2zvxEOu5+qNI4esIbeQPPjG5kuhr+pCb0F/SEaYcy/qx6Sqgk1+Yh
         l1dh27sytKwYAVaiyUOaTYw0/73UMXAOq2xsjOXqTjp7vSj/wF8IqPlPSbIbv5uOjwb4
         i7inJ3++M3isx0zkK9UPJhfic7SO2vsEVHm/KlpuGVj9g5SP0O/OXLk2HL9LdOSrZTiH
         xY7LqjOSTMtS9p8HDJtC/nFLBeZr/Ds+QDX0mdAuAD84jfTOIDbDGGh3J8FhFHKqP4T3
         mRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009193; x=1744613993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zclVBcAH8FQLUCLJiKJqGovQwhajw/4BLJO78dfjJIU=;
        b=c/LZ+PuHfv6/sc45j3QN+3DZRWco6Mha530P+HQmoBgOT8mkziM30/3zn3mRuCR0Wh
         yll5vPK1n2zlZ1FkdgqLM2UYXqPLo7A/sejWLXVAPc4C6w6K9mzYf0hRGh0O92nUZlYJ
         iisMALiTJfuUAQpeDQYesvGBc8oGyJ08EEJOB1kcqwAvZoHUujZXezQz6hCRWPA9c9mO
         5izSP3SiQO1+bT3vgXUFERgUR0A42w4xvk1U1hUa8WcKELa3uLjFfkIiaUIpeOHbttka
         NS0JV0YyFqsIWmZI89/2VN8OJLyN2MJXyT81LG879aGa9H1Z5mZkRwk5wQ+9UEDM2meF
         21PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkm8oTjNjH6T10Vvd+vBxTz9jRFIb6Dx+PGj9xT+9/vCphlRVfeQYikcoN8skG5gIf2l2Xx4RGO48jTv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMAl+L6rQnrBpfzs8KU+LT/jSn+AxponU6VFgnbdk9UISBhU2x
	Y/xJdoOyR+yhNeCg2Q74Ay6wv+XLRm4QDNpg+d29yUXBSm6VS0f8J8aSSMPpzJlQclOYhxQ3S7N
	KmF2I/OwhgtEzy6OPnnXlhrrEZltoipUeA8ctxA==
X-Gm-Gg: ASbGncuMZ4aLrB/non4v/WXag6s4GOt0RBy4KcAa9VorOPHB11cFzVBRe/g65bKX0ft
	uk/mVTOnvTsOazBotbr2+zbUrV9MYU7DQBEzQRjy5EDxos+slw5MtmBXUby3iuBojcz5e8lrMCD
	eg9BZI91EKDjhQfsdwyG8kOj5D38FxgRnx6PYh4P/6XfmHcHk9gGOpjQ4vSQ==
X-Google-Smtp-Source: AGHT+IGv1uriNC7HzAl+L8w0q6fWjV1SIj4jMIhKs+aiDpdh7nDo2D+RjAXdjN+uWj4LcQxS1M6SDdv0uiDwrLRQ5uE=
X-Received: by 2002:a05:6512:3501:b0:549:5802:b32d with SMTP id
 2adb3069b0e04-54c232bf59bmr2983829e87.3.1744009193191; Sun, 06 Apr 2025
 23:59:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306084552.15894-1-brgl@bgdev.pl>
In-Reply-To: <20250306084552.15894-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 08:59:41 +0200
X-Gm-Features: ATxdqUHWFAXkM7nuErogQ0GJfGARsg3Weoa-64QKGoAPzT9SjUAGTJTgsj9Xz7g
Message-ID: <CAMRc=MfFnK_nLPa9vnAiqF64=7Z10bme4xFyOwL-D20FQxDkyg@mail.gmail.com>
Subject: Re: [PATCH] irqchip: davinci: remove leftover header
To: Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 9:45=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Commit fa8dede4d0a0 ("irqchip: remove davinci aintc driver") removed the
> davinci aintc driver but left behind the associated header. Remove it
> now.
>
> Fixes: fa8dede4d0a0 ("irqchip: remove davinci aintc driver")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Gentle ping.

Bartosz

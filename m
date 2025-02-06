Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F011E225A3E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738832562; cv=none; b=a49Ru4G/r9bM6q1InM2sTr/OdA7c0pIVE52G9E/94iOz6LBnTtbDJb5Dz4qkMSGGtyXiAf7qZHzuBhHaLqdfNzG7ZhSnNvkwKuSUAhBAakGYiRlD3ZimjU9MVrUO4wpUeLA9rTF8f5OgBr1pFc4p1tPzK3tXmUuQFtHyofXRQog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738832562; c=relaxed/simple;
	bh=Hp8D2UpUB8LSe0tS79Q/Ztz5i/h+c+LhDuD05ZQIBgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdEsAYJ1Urjs9jGFDR6EGc31b9zsin7Qt5DbbfiFjxXtK6pVv/aqTHjippCOU5gaSCwB+vHiSK3fQYWvmT+G5j+Dx1wAbOqVsrma8E5W+/FyjaaO/IeqA4XwX6NNUqpU2/kmHj1Eqi/f5uEGWoWk+khD2g0vwnYC/dCE8RLXEag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RkIIV9X2; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RkIIV9X2"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dce3adbc31so1185539a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738832559; x=1739437359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWDgCRG2JISUlyz37zwRV9Om7+HpOA4ggCmMt2lDU/E=;
        b=RkIIV9X2gqDWG0Go/jFr3zuv/csRYXiv/AlmQryWQ6gg+MnDDjmwRtg/u/ttyCkJLA
         W4018SSnL55Jljqv9tybsgBjWpCxQNqye61RXIfYTfwVKh2CtnP3luSn3A2itzLd9KYS
         QbPvyH9DAyNbsRb59uAkMGs/1Wt4fe+p1z5H6kyiY6QeR6sSbrGbQoVz5el8FHQV2HWi
         UAOW+fsuBXQj1K/ZbJ41wETNMgtWbPwkcQvzdQU/MMVWMF6qZlzdDjKtD34LAb/v+gdY
         b1NAaLwGfQrcQuaqMoWnB21ResTPvfqGV439CT7b2Kri8RnZFY1WOP977k+WDdLk4Vti
         24nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738832559; x=1739437359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWDgCRG2JISUlyz37zwRV9Om7+HpOA4ggCmMt2lDU/E=;
        b=rgAhblr+oeHI090WwRuNeK/BHbNQgzKPI6OIv1mTRAMnSDNOshLgmD2b9sS1eRQppa
         r3bPUOHJm8WuTv4fpDDzVW8SYTGSn5217mSeGvW5JFQlqn4pDr4LUleCnt6X/xon+C3C
         4vOG6aEsKJ9WD28RwimHSyaKcvWRKZAt/Ogfq1ld87JWIkIgUHoWmdfZCFMYaaTtVrq8
         1UzqtmuXLoXppOnIdW29p3RiWRofD4N7mGTtqMHxyxzj1A/aW04P9zaCAGTW22g+ZpGM
         /t7EBSfn8jXE0mpwmY659qNaRoCdFu4A+a8m3254uH/uzHanwaTlWffAdnV+uorhei++
         TPxg==
X-Forwarded-Encrypted: i=1; AJvYcCWNsBc5TdhIfCNn4Ixwhw6loUcFeBNhxJ300Lq22DgAgS/Slk8hovLPk+ZX+Bp9ISrIQjjbNxaX9mhVt5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCx498EtO37HP0JGk99hY6QiroXQ7KqQiJcXBj54qskciHY94W
	s7D0oW0sZvycLsh7G2mKxRw9vnmjvoHDtyoWmfrabyWUzQz837fjzryJO+I/K1urXqFDY4qAfhY
	gDL+7vQz66wnH0Sglu/We08ZbOCPsgptTDPJU
X-Gm-Gg: ASbGncvVgSylP+H0GllHohAeAXJm0vqZww6fd0i+oagw3rg7cyZqx9Y+CpAvkv1zYaO
	f2/45zmk+sdCgHebr1JUMVeIkipjM7N2hpd04RSHCXHKx/mOgMSmOLTG2iLg7Y2FPnhHGV8Jl1A
	==
X-Google-Smtp-Source: AGHT+IGL+Wm1jNd7m+ybFuNU2jUmMjfKTuc0LP5Om5chV7UKr+Zgv5802SmwxpVwxz449nrAcik/ICqttWRD07CJYKs=
X-Received: by 2002:a05:6402:3205:b0:5dc:5ada:e0c7 with SMTP id
 4fb4d7f45d1cf-5dcdb762c7bmr16753959a12.26.1738832558911; Thu, 06 Feb 2025
 01:02:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205193751.297211-1-jdamato@fastly.com>
In-Reply-To: <20250205193751.297211-1-jdamato@fastly.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 6 Feb 2025 10:02:27 +0100
X-Gm-Features: AWEUYZlwJSqtqB-4OOyEFkAsstBoQxZIbRm3_DU4qBR6mr5PmsTTexdXeHatwjg
Message-ID: <CANn89iKgEd+T717kP=Bq7cSssr8ibh5t-+g6Ztybd+mkJFt8mg@mail.gmail.com>
Subject: Re: [PATCH net-next v4] netdev-genl: Elide napi_id when not present
To: Joe Damato <jdamato@fastly.com>
Cc: netdev@vger.kernel.org, pabeni@redhat.com, sridhar.samudrala@intel.com, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	Amritha Nambiar <amritha.nambiar@intel.com>, Mina Almasry <almasrymina@google.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 8:38=E2=80=AFPM Joe Damato <jdamato@fastly.com> wrot=
e:
>
> There are at least two cases where napi_id may not present and the
> napi_id should be elided:
>
> 1. Queues could be created, but napi_enable may not have been called
>    yet. In this case, there may be a NAPI but it may not have an ID and
>    output of a napi_id should be elided.
>
> 2. TX-only NAPIs currently do not have NAPI IDs. If a TX queue happens
>    to be linked with a TX-only NAPI, elide the NAPI ID from the netlink
>    output as a NAPI ID of 0 is not useful for users.
>
> Signed-off-by: Joe Damato <jdamato@fastly.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>

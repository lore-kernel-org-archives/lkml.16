Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21C821348;
	Sun,  6 Apr 2025 13:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743945354; cv=none; b=Yv85ZmN5C7yp++UMPDSar5wom3CHWBU8z1hLmYroUYuDGqmGuXpNDLb1y5SFjS3p5enmFx6V+jJkt5q3Myk/NrQfg5ys1/zjza7IfY3wq+0HA48UMthJ8Jot8e9zvZ+3xAHURSCKtjr+2LDYAa5Td2sWOEtZHH0/OiMTtywX+mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743945354; c=relaxed/simple;
	bh=4vqXGkNXNdZ8RWlPXAoKD8zxOXuq628gIHsbciSrKr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hbh/v1M4syvGnNpkkHL8nLbUyye0MNnBjkcrFiNkJ0vFcvzzOo2H4u7NzP00qJqfq6yxBEr/Curj7hrAynEux6dcTs4Xb8h/ln3zTNNwjrdbpdJmT8cp4b7oiAL0FQsyCxiVMq1KZLVOlp7r477Yt2r5b3BLrYFYE1AOtgVNIs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kj3cy5hm; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kj3cy5hm"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2240b4de10eso7124205ad.1;
        Sun, 06 Apr 2025 06:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743945352; x=1744550152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vqXGkNXNdZ8RWlPXAoKD8zxOXuq628gIHsbciSrKr4=;
        b=Kj3cy5hmoYOdgI7Ki6jObaD4ByVXnQ6p1WsfufOd774BdTUckPMWQ3SkPM3546dYKr
         aBqfoYAWx5eX5dPuQIydSEIwF7thft48l+W2xhnAhElRgSuYQ4MVhvSJnrhPAaVkU6G5
         j5O1kDwT45buFglv2yQYEnaQ4yFnwyiTSfjPm0gdKcw1uDJxvYgCqK61IzuvYUhc1nL7
         UtMD2fFEuaFRI8ZRb/dL01uwIPh3Di/Hg7/4Jphe/9KqpznCPZOxyqf0neFAmDvaBeUg
         7Y5J4+yO+TfmOL11k1X6gB8frU1JJ1ch1ww8mpdh8UG16hiOM2afMPnzF3wSFM/W6LX1
         ZDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743945352; x=1744550152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vqXGkNXNdZ8RWlPXAoKD8zxOXuq628gIHsbciSrKr4=;
        b=PHpQFEAQvvouWsCs6mWdm2I5xBHLdPzQHV3u0zKwF1MivxinK0+opBTzO93LmDXUPD
         y8y+4dNRAINC7ZUir7i34g+5mihk1QNASWFgvQ/xyU/woXeT9a2ENERNHQ610NC7ogb+
         wyFI7hOdIMm//zy3L8IPfza4PKF58+nUxz7p0K0w/5T9aYFcuhkHE3rXvxMs6/2yUxFV
         GZe+LTEyoHbQ1qPFCMGknC2/41Ouj9WNDuENyJoT7CgLCwncqJaGbrKGOLP82PoNEXTh
         n6Y9EKid9VAeyCkhSzeKuex9dPGLq7gbaggByDRzWQFcoCz/eXfU4B9He8h0BF8pjeb0
         wwuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZTfus12X6KEU2g2Ma9w+TRKRsE7kLGdsirIbr/8eaiuArLFHHM4T3qjUtcqU16LwMKXPDsBvKYnum2HQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaXLY5Fbqp4UtJLja05eaQYvXPeg0eM+okaZj6FCORkNpZTwMR
	qvl+CBk/e4cSo5NA2ETnbI3XPPf/gDKwBEzvOGIo8k0q4ztZrwGqKXafQCBvaBeQYq5gLiKyoXv
	KQMpN9D/zUQs3m8atRbmE4muJtl8=
X-Gm-Gg: ASbGncubtOjgls1lAD9VVGEeK/eOrADPzBf32S4KgGDQL5IVGoyjgDmTtEPE/M8sojX
	2V4iHkYC5tiqsWYxIBA/N43/6p1dBoZwOyfB+GGBffSSwkpYKfzSsy7BtWv6GrdMknr34OJ1yIN
	ppFuoGSRZzsc+6E/5tH4BSJ8kp5Q==
X-Google-Smtp-Source: AGHT+IE66LbNMGTzh7l4BnJkPePaFBEgdyDbrqvGEbpMM8l0ljxHmQ3JKNpqbmoR516pPyo1zi/jEcUl7UZLm71jU1c=
X-Received: by 2002:a17:90b:1b11:b0:305:5f20:b28c with SMTP id
 98e67ed59e1d1-306a48a5bebmr5175613a91.5.1743945351829; Sun, 06 Apr 2025
 06:15:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <95E3B7B9ECBFB14C+20250406034811.32347-1-xizheyin@smail.nju.edu.cn>
 <CANiq72m55Fi-XyFz=h7_3QNj+mA0N+E9Vo2_anLFyN1sr-FXMA@mail.gmail.com>
 <tencent_3DAE6B923FC67B543D90D970@qq.com> <CANiq72=c7yzLM4C-zctYFpUnFbQ2o4i5Uhp73xc4Td3-H_yDeQ@mail.gmail.com>
 <tencent_4FDA7C47625666C054E0F8D7@qq.com> <tencent_2441D11C4D8973701A185871@qq.com>
In-Reply-To: <tencent_2441D11C4D8973701A185871@qq.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Apr 2025 15:15:39 +0200
X-Gm-Features: ATxdqUGd468m3qog8EE8Em0XzKuoaq96kK4ejJDgOX5tIIKOrOwwQLKMpdf3i_o
Message-ID: <CANiq72=1ukM1T-2n3Z-4piNLLmRGxuhi91V38yDnfz1J5or8QQ@mail.gmail.com>
Subject: Re: [PATCH] rust: convert raw URLs to Markdown autolinks in comments
To: =?UTF-8?B?5bC554aZ5ZaG?= <xizheyin@smail.nju.edu.cn>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 6, 2025 at 2:27=E2=80=AFPM =E5=B0=B9=E7=86=99=E5=96=86 <xizheyi=
n@smail.nju.edu.cn> wrote:
>
> I submitted the v3 version of the patch, sorry for the trouble. After thi=
s submission, I am familiar with some of the process, but I believe I need =
to spend more time reading through the documentation.

Thanks, and no need to apologize!

> By the way, where can I see the latest emails? I'm interested in this pro=
ject and would like to keep up to date with the latest progress.

Please see https://lore.kernel.org/rust-for-linux/

Cheers,
Miguel

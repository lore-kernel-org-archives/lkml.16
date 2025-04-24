Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767A3146A72;
	Thu, 24 Apr 2025 13:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502792; cv=none; b=dbXgFozkuPrwa/95nI4o/jScf684LWiudsscUNVY9HpgAuQMnMj8cJPoRe+OZoyJuFSOAlryvF0yYwDpo5KxWYdpUsiPNHEQ/9eKcVJqmtp6CC/C+siUJAcdD6Pb64tPZq4yIRfFJxLIWqrQ4uW6qBFVcFrTWFQ1ZwRrvKn+yc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502792; c=relaxed/simple;
	bh=gX3o4fqyzJc2xoJ/Uezx0Z/ZcUfhP4pJRiCdZwiPSIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rX10ubaOs2TCe5nY6NuUf98uHaXwvxBK/X6qt/sSMomT0fcfmrUCnLhXC1QyBi0YHVPXZQowk1ww5I/n40uw3h8K7QQ99LU4mAfUBGFmFrT16OTmW2cbmEYWnEy2w1/kUKA9P1cozDWo8viQrWHoeuNXpLFC7qtQrDSmUl5upTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGUY7/kD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGUY7/kD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2240ff0bd6eso2048385ad.0;
        Thu, 24 Apr 2025 06:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745502789; x=1746107589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gX3o4fqyzJc2xoJ/Uezx0Z/ZcUfhP4pJRiCdZwiPSIY=;
        b=bGUY7/kDrvHPeoS4CXmOwwZmEdHTLcGvHvrYgew6LndlJ49sdNqE1Lum96sJGrrb1n
         GfCT1xoqm+TAvaZIhePXjGOKQOLUF73/cNc9vUF3Phwf5NYEmAuFkiDkIy4640EuUyTl
         fCeFRyOLRUO8lbhhHr8SDajmGnp2Of8VwRoqceWohpI7ohYWs+6GZ2jHGOLF/dzi52Yq
         oaNLPzoU6JSyF66sez7449vQRvH2FFM/QaIAwv873/qJO0ACx4vMilQyEl4iLfV7eDPO
         UG7y30IyxmeH0w+htU0IIZmKGm+qCwozKmeudfear7adUX1gCdqjfLZrrPGOkAubHGvW
         Vb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745502790; x=1746107590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gX3o4fqyzJc2xoJ/Uezx0Z/ZcUfhP4pJRiCdZwiPSIY=;
        b=HqEn/EN8h0I+m/CZFaN8Rhfa+4WYJnaA6tHcfT1VFZrVt6YoPXsfeZWXpXkC491ZDK
         HeEVt9CU8FI4wxdGxbtDkCmXTV3ag2/GG6QWo1YEx/3U3llhN702f66s6SgGEKJP5CK5
         NA0G4hI8gVc/W+bgzG/A1//9MIqZwuYt6cWMAOV6dZrlqE4nXoXQSV/ADfhKOI7o08tZ
         vFuoY0YI01yLxswqJ1X9ZDdMdMQFom89S/pXMEJiVELSHQZR/02d+KxLFVPRqpS1yBax
         znF/pFuYOl/DNzKkFp4MKu0MPSj+I4VVlDmmqfMyX1h9WYASvjx2kx67Z10bQBQ+jbap
         z9/w==
X-Forwarded-Encrypted: i=1; AJvYcCX6IbKjaNEtUcJF+B5zAGLqW4uzWxoKOglvzLHkpQGFdMvFZacMPGuVnuPD5lMvkoxMoirFWyobR71QZg6V@vger.kernel.org, AJvYcCXuuQn1+u8xWB+GvJTc+jsn6+nBbwOoEQ5v4OQIE2djxri+6aUsQ29Ml1eItMhgzKawvkoGiD8tnB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaKFjV/q59eQWcTHA4AoPG3PDVuvt9h9ETvzvVdFaNLfOd8SwL
	SsNc/kBSTE7RU0NoMJJQV53f+T0Wh3abmRbSYiTvsnQs/n96SOCZr8Hd0/CzQQ3YsYgNmLjSB0J
	Ra+3T/g+J11K8hKQB8cidhSOtL6c=
X-Gm-Gg: ASbGncsD08SYg5moDE16jxpGlvgXGySJDfc21/cDSb7Wiu6f9MwJGFoZkDZILi6wx5x
	9010JMCiLyhL2A8PJH7U6NobQKV4gcSjNmfgoPPs0/ZSDphjXD7IMzwTazZchWTti87YKKvF/Ce
	YIhwpZQ7I1XzQZMS8pRjztZg==
X-Google-Smtp-Source: AGHT+IFxk20VNo54XGCzsfIek1K1n9S08YBK/30d3tfR36ldUpJBLcJkO2QijZyYCgdC5GzKzmyaOkbef7SiZ66MG+M=
X-Received: by 2002:a17:902:e5cd:b0:22c:36d1:7a4d with SMTP id
 d9443c01a7336-22db3dacd65mr11784105ad.14.1745502789616; Thu, 24 Apr 2025
 06:53:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1745453655.git.mchehab+huawei@kernel.org> <ae1c54ddacf6ded1f7154897b10798d4b3fdaf96.1745453655.git.mchehab+huawei@kernel.org>
In-Reply-To: <ae1c54ddacf6ded1f7154897b10798d4b3fdaf96.1745453655.git.mchehab+huawei@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 24 Apr 2025 15:52:56 +0200
X-Gm-Features: ATxdqUG8bw5uUkZS5IdK_6YULUcw5uZ1DGQ7_xFekyh5NYc4YczU_MqiAcsEtwE
Message-ID: <CANiq72kZ1x94uFfqxC+GahrYvtkEhut69L5C28qfXYaWgP2P4g@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] .gitignore: ignore Python compiled bytecode
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Ard Biesheuvel <ardb@kernel.org>, Kris Van Hees <kris.van.hees@oracle.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 2:17=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> While the building system doesn't create any Python JIT bytecode,
> if one manually runs kernel-doc.py or get_abi.py, Python will,
> by default, create a bytecode and store it under scripts/lib/*.
>
> This is normal, and not controlled by the Kernel itself. So,
> add *.pyc as an extension to be ignored.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Looks sorted now, thanks!

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

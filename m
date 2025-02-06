Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF617215079
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738833967; cv=none; b=LUCaV08685nvjh8C1QuK/7q9mTP3VRFUzlGQ4UhmYbhVbuUEwP7fBNMUTu/pUQm2bu+6DYm6KZ1OAnzR0K+XFtTz8som43w/ED1p86nXQoPf8fzTuNrbVJNPR0evPFWxjCVLzB0mXisa5GQm5ewZSiGMNKMn/2jypdyS7fASIKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738833967; c=relaxed/simple;
	bh=S2c4S2UJ16ciPVegmv2dJMMs9Kw5rt9rR0KKu7Wg9JY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVbOb3GX9OvZqmFKEbi7nn20BPOofM0icAqnYt0IMcpmPs+oDsmpJPHEIErVPMCLffP+QaceSrUooadxNG4cGuez3Xb8Lim3TjeynjSLHYKTIfQepUSjOK939nozK08Wc0cVEdPTlHA6rjz2OPg9QPNyAs6vZiR0XcXVkB4E2/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=phkvtgat; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="phkvtgat"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30229d5b229so5976651fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738833964; x=1739438764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2c4S2UJ16ciPVegmv2dJMMs9Kw5rt9rR0KKu7Wg9JY=;
        b=phkvtgatJTUvb4ill9L25IPH+X5RQsEzsCnGSP9R+SZVsGFD+L2MpuLcwxsriM8Itk
         o3CsZbMn8MSzdgBoFCyaeayPvxjeSz+SoevKvrneOdSHSbfhoq5+2tuE4y+88w0QpbjT
         CF9v0viuURyxHX/ZyNx27D5WO1Lmr+pfJexlSMJJEVa2MxxRfTUGcXx5FF28Er1uYzSa
         KYN3jqjkeS1CtmezbgY4KgFqBdAP7ksLgW4bP38IPXOLese7vbAPke2TNN6AFA2/onLy
         XKawC9hhH32vgJ5DfXDSfuLcM00qQpsKi/RPlSbXVYBX29+JhGd7L4kmphz4NzodApku
         n/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738833964; x=1739438764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2c4S2UJ16ciPVegmv2dJMMs9Kw5rt9rR0KKu7Wg9JY=;
        b=ZRF+WhT5Eqwvp9bKX5IBoUGXFLsyp7KR7qEUpSEsTyxUV6uYTlBqAuRn5KWmSrpA76
         QsB1zmeksE9cBCmLHRAK3ncvhMKYGxUVmjzi+oqUAiaHnWl44jgR4a8JDEGAEKC1cRKe
         FcOJqxhl1LGGiHrCXO6ayFt5Es8W5UMRoVV/6sQexYEyTfPaDls24ywLASm1LW7Yx7/3
         zaSJl3g+iMjkdlGr3SerOp/YLXS45suwDjMoX/7ih5jbJnps9C8/8+/FYoCo4PnDpE9H
         ++DQfVqE/fqQEMV9Tk68/si3WaZTiXB1BnwNJ/gxOxrRcPHApSFph4/5dX9OiYIA+MVi
         rZFA==
X-Forwarded-Encrypted: i=1; AJvYcCWx5M90LdomHmOWGVKizJGSONfzfa7hP66QQ6sP49RqeN3DEG5Y23ENzsePTNAk5C3TOjb+a94fbGa5XhY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsOi9j2TpSd6ejIz7IuyDU4D77afyTGk+57TsyCT28835UUtsT
	W8r48mqVBml6YSYo37Fyd5+XSCV//OSycO4yFxYTiXDxbI7q96jjdlUID4f1CX++LM4K6h3duTq
	ERdZB6sfNi/Vt10C0mXl0u3rsPbB1jbfjOek0xQ==
X-Gm-Gg: ASbGncv8eSSDt9CQNASyVX52/rPrsO3ydFiSqFw1S9o5KD+AHkbh6V1YUYXQi39ijCV
	MoswB72HuYfsetjow7xG/AeQ7rpef4mkI5LpsGf7sCNmulyGw9n8VnVNDChSHNsVXajJUtgM=
X-Google-Smtp-Source: AGHT+IHpfix2wTTPWT27xiKP8j/wnuW9XOUq2C8NV4uy6HXZ6IKZzzqyMZu71gZsBwgffLcTqpvpYTIwQQ1JPyFlhLk=
X-Received: by 2002:a2e:a909:0:b0:300:15f1:cd5c with SMTP id
 38308e7fff4ca-307cf314370mr26367471fa.17.1738833963746; Thu, 06 Feb 2025
 01:26:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122120504.1279790-1-mastichi@gmail.com>
In-Reply-To: <20250122120504.1279790-1-mastichi@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:25:51 +0100
X-Gm-Features: AWEUYZlZnx5W6VZZ8uZDQ1Yo7OGFd85CymAOgCope98zierlYqLTv8Taz-fU4QI
Message-ID: <CACRpkdbtjS54+g-K1azE2hHeTsiyzA_gFa2NBX6QZZ3D_H5Ryg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Get rid of spurious level interrupts
To: Dmitry Mastykin <mastichi@gmail.com>, Sebastian Reichel <sre@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	e.shatokhin@yadro.com, arturas.moskvinas@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 1:05=E2=80=AFPM Dmitry Mastykin <mastichi@gmail.com=
> wrote:

> irq_mask()/irq_unmask() are not called for nested interrupts. So level
> interrupts are never masked, chip's interrupt output is not cleared on
> INTCAP or GPIO read, the irq handler is uselessly called again. Nested
> irq handler is not called again, because interrupt reason is cleared by
> its first call.
> /proc/interrupts shows that number of chip's irqs is greater than
> number of nested irqs.
>
> This patch adds masking and unmasking level interrupts inside irq handler=
.
>
> Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>

Patch tentatively applied as non-urgent fix.

If this is urgent, I need a Fixes: tags and we should also tag it
for stable, is this a big problem for users? I don't have the big picture
here.

Adding Sebastian, if he's still using this expander.

Yours,
Linus Walleij

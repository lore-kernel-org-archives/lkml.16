Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ACA22A1E5
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747342382; cv=none; b=MZnhZqIdjFdQrEbwJLgthy/JkW9FMD9VBKp+PCaL+iRRjO32e26/Ah88IRl3Ms7TsVdknn/xDNQP0Ajqsyab4HJkvE9oiUWeeiJz7ue3wVsGuU42GN8lJ8XxE3uYFgVhQn1ihCB0D/L29XCXneS88EYVD+Up/4TDymo6onPD3hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747342382; c=relaxed/simple;
	bh=czi5+u2kEjArBpOgbOhFbSFaZ/a1SpCa/lwq2gvfT8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UIuq9w6DTypLixASGpGWcGCnKepnP5Rhe7YU2glXM33SgzywArU+mifWeKax/5o/Pw6k+/gz7PUPnc0RoEoss58D4KgRUaeluqLu1Q7zDWb3lamB7xuJ1/Jt9MMi6XD8O1wZzUpxQ3rc0QFRwmyIUnWCHaKvLmasIOs8sUDQE8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e8zerxL+; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e8zerxL+"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso1421a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747342379; x=1747947179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czi5+u2kEjArBpOgbOhFbSFaZ/a1SpCa/lwq2gvfT8c=;
        b=e8zerxL+wnR+j4tazWO2tN19dxkVVHq0ygT4AY4rUUiU7kSO3wLtgzkg3q3cmv2YTa
         vZfFierl81popnMsW80aNLb7U2Afe2GxeX7M+fSQdXk47M0NSRNru8MuznHwxifNxZQX
         0XEbNYFlWryCsSd+Lv6PC8V6RmJnt51yU35olEby9SMXawcuutLVxdSL3DAC9Dert6/2
         uiXZ83Ifso2wolN93HuEMnIOSzfr9Trv+66flzNib18fyYn8POs6Ffv+67f3wprwvxMs
         gvOSiIQyNZ2li7jqt/fH8nG+n+gmupBubWTyGD6m+IcHWxvk2pnspjdvNQ2eu3Btf4qA
         U4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747342379; x=1747947179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czi5+u2kEjArBpOgbOhFbSFaZ/a1SpCa/lwq2gvfT8c=;
        b=OoiCaav2GyNGjgsp23w/r+q+2hIgfAgFI0eJgrow1twdBBDe40vHvUzpxeiKnZVJKq
         bsNRhySDJ3jmoowHLD/r2hn92s0+4yBfsoNPQPBzkqR54i0g3iz9kQTR7JqLO1IgpR8C
         OSxiuBcy3mxv67xBmz/gM7ULeW2agWlSb/8nuvzjVBVuZmkXKDyi1EMbOC9taiBPYTwY
         q5s621yuM28lenEL+Nkkjyb/98827JVPYXlZAjk3hEdtkgx426e+Xp8aK1olTttNkxib
         W7CjrdN//z4nreqqshFUPM7d/RzmSfo34tXCUVM134QBuGjBq7AGWdVDhm9IWyxklKWY
         d42A==
X-Forwarded-Encrypted: i=1; AJvYcCU/NQPTgyVnwFrNtXsmbKJHLBykGsOC8Vx9dYXcmBcuH/qYaSvVjQ1/+X1oC0tQVZLzUFF97bYBLQSOz/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwROiBOAKwxtlk7M8N1XK1ul++StuxLkecA1Bddq6kPhu9fP3Ak
	wiW+U1kQFt3t+Wf925LzWGRfe5mmH0c980mjgnckc34I8JtMA9DF1AULsPZGR6aLs1/kAAAgoVe
	cxAiMF1RY3dpa1v4Ww+kyem8hzMXbcv63dk/Rt0SH
X-Gm-Gg: ASbGncvcDtCVAGZnf8CpYPbAriFqOCzSvM/Ag+U3SSZB5CQmKx3ebpYvv6e8xU0I1re
	LfwSUCag9aegCqyge+iB8vPL1VwPbMZeR4T+zPdAYKwrRsDNIbE2NTMyDmujsaMGaskG75wDJhg
	XCE5fQHPyIkOifbIJDvax/QoX45AhTZspywKoixLbWe93fJEqz6x8ssOG1GWEN
X-Google-Smtp-Source: AGHT+IF2M8wfat+ypXS8t4pkU9r+Ie60fdxet+x1ExwrsKQgeSVE6SwmGNdqBwNHbwOcKqnaWIIoX1c/2Jgm5HmN7XI=
X-Received: by 2002:a05:6402:22b0:b0:5ff:f051:60f0 with SMTP id
 4fb4d7f45d1cf-5fff0516857mr119534a12.3.1747342378383; Thu, 15 May 2025
 13:52:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515-work-coredump-socket-v7-4-0a1329496c31@kernel.org> <20250515170057.50816-1-kuniyu@amazon.com>
In-Reply-To: <20250515170057.50816-1-kuniyu@amazon.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 15 May 2025 22:52:22 +0200
X-Gm-Features: AX0GCFukZXeV2YnpYpWYUXI1kiBBOFCdeQQogQc1TbzHuyl2utiuGujZlMvm38g
Message-ID: <CAG48ez3fC902JU244d=0zzr39f+iXxQH0GZgJp0rs8pbu8ka4w@mail.gmail.com>
Subject: Re: [PATCH v7 4/9] coredump: add coredump socket
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: brauner@kernel.org, alexander@mihalicyn.com, bluca@debian.org, 
	daan.j.demeyer@gmail.com, daniel@iogearbox.net, davem@davemloft.net, 
	david@readahead.eu, edumazet@google.com, horms@kernel.org, jack@suse.cz, 
	kuba@kernel.org, lennart@poettering.net, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	me@yhndnzj.com, netdev@vger.kernel.org, oleg@redhat.com, pabeni@redhat.com, 
	viro@zeniv.linux.org.uk, zbyszek@in.waw.pl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 7:01=E2=80=AFPM Kuniyuki Iwashima <kuniyu@amazon.co=
m> wrote:
> nit: please keep these in the reverse xmas tree order.
> https://docs.kernel.org/process/maintainer-netdev.html#local-variable-ord=
ering-reverse-xmas-tree-rcs

Isn't that rule specific to things that go through the net tree?

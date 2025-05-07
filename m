Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA072147F8
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746639437; cv=none; b=KI9eoJ1J/T3scV7zf+KTSUDouunWOtJIvlCzZt0Z3caMwL+ss/oKr5qnw8ju/x9bLnvfkZFieSTbqTn/ymENhs2AOFgTxOB722663+76dWnPRLgUx5KtGYR0sej5cSUG1YMGXXQQivhQGOyi2+q3zNO6MgrvKsGNEqCKJVJwAk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746639437; c=relaxed/simple;
	bh=bQHhiJb/IfsuDYo0XF1+Y57pCH6WG6CKDTT1nxeWSmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEFQRrTXaAA60Mh8yO3s4UVhMG+sKLaj6eqoVVNazgOlxVp9DCjq+z5XpS9bnhSjt4uQap26jnNVaDyPrQKbIRGA0IdvFmSAyuLVlA/Bpo3X8hwGYo/ob3fMjAjkm8d0Yc8+35Rc4r1lSfdmPYrBzcMeqox9rgUaWrGCIATv/dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qyJQwsFB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qyJQwsFB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso4785e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 10:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746639434; x=1747244234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQHhiJb/IfsuDYo0XF1+Y57pCH6WG6CKDTT1nxeWSmE=;
        b=qyJQwsFBjgtBNhkB9GBEU/vDwiCPenXS6NhmT3V9TSs/k+WfB8H+j+8eMGcGBNUqoJ
         YaGP261J7cYfyLhzBEx+uyCmydH+psw9Jk07U55xu5hhyumtYlQi26hNl6cIpDFl/oXS
         g/bBUJGsh/6vPsudxtX4g6FgvKs/V4fho/lfXquPAOO3NSnp/frlUanUXQnsj1hw2VLk
         mLC/zjEGeRgaBuTWVIcd5vpNKxOjvk8JAVzJYpEi0HGj3BIg+Jn2bQS5s1Pe64sfoBNd
         /BfJna7/eVlg53MwqmZZAIULCInqmcts/ezxre5VQm6AWlY7M5L7pwk+iU7TWqKt8SCw
         oVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746639434; x=1747244234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQHhiJb/IfsuDYo0XF1+Y57pCH6WG6CKDTT1nxeWSmE=;
        b=ijLiKkA33bYar0SmiOpYRn+LwkisUOawm7xt0kRaFNbXxjAWFPkz+oEgjgoakpLPn/
         i3hsbb8UclhJTWsVnKaxyAT/F6po2eM388rK4Bj5MF/RBS5DmtjjcbrmTlqVN1Jcw0nj
         QY+L0AQYQq1vAZbtAX64TNQKYbQfxr7dDW9XYozhzkbWio3Y5z8mNQxFs4Q6BFDtc3x+
         Z/HiV6eIv8N89BU1bXAkroOpCAIhI1RhGgJVAP2agxahPQnvFOyflGbsImJUaGKhB2BZ
         zwjcN7AVBtaWvmzf3MEZJW5Z9vXGTVM1k0W6x89UeRvXlF58P7DuOV4PjM16bE/xX4U2
         kV9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0wuRnTNF82haau9yTxwZpicBpZGE9As5vxPu262NXOwqmYoujNYVAVRUcW2OlOhW6TcjotK8+XFN1WrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBWQxAMaAa1+igQVW1Dm+NDA1lDtgTFkLmH62GJMbQQJID85ZE
	WURz/K47vPv8Gz7/kUGpX2Ins6kw0qZUoZEWypeChSH/7YOIRfJ+9UFbiiZAnk7fdJ2poFVz8kG
	F+27o0WFi5yMwq1WeR5V/xgLq+cYGKn/aXVPw
X-Gm-Gg: ASbGnctOGmojOFJmftI5lVMmye9YpD1ufBUr0IY+uPPf/Tj28a8ok8EN6YnqOlwsX/H
	ndLA3ey/pmzib4t5WgsFoZligjpskHUHjX+r2mfTO1XdfcFVrLuaUQKUJ309Hbv2x6wXXN3CCpM
	/gs2QNmz/z4gDDRP5S8Z8lbVWhxd13hSSuwwlhBJzDyAtuweI0i5g=
X-Google-Smtp-Source: AGHT+IGhDsyDC4rx4Jh4KPoVriF6uM/2LMAigWo/dJgJXOk4tdHRjlokfIMBEcSr4ZZiHUTQp//vG2FjpjSJlL89x3c=
X-Received: by 2002:a05:600c:4448:b0:43b:c2cc:5075 with SMTP id
 5b1f17b1804b1-441d4d4b8d4mr1462165e9.5.1746639433809; Wed, 07 May 2025
 10:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507001036.2278781-1-tjmercier@google.com>
 <20250507001036.2278781-3-tjmercier@google.com> <CAADnVQL2i87Q4NEX-4rXDBa_xpTWnh=VY-sMCJzK+nY0qogeqw@mail.gmail.com>
In-Reply-To: <CAADnVQL2i87Q4NEX-4rXDBa_xpTWnh=VY-sMCJzK+nY0qogeqw@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 7 May 2025 10:37:01 -0700
X-Gm-Features: ATxdqUGvlgXnJv15CWumpdguGu0hVB25voP1FwyUGSqp8OgHDoPOAE5CsZeJmPA
Message-ID: <CABdmKX15i760AKT3e6BL-mOUgOjNfX7ugYJQmy_J6YD1TeNEfw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/5] bpf: Add dmabuf iterator
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Song Liu <song@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, android-mm@google.com, simona@ffwll.ch, 
	Eduard <eddyz87@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 7:14=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Tue, May 6, 2025 at 5:10=E2=80=AFPM T.J. Mercier <tjmercier@google.com=
> wrote:
> >
> > +/**
> > + * get_first_dmabuf - begin iteration through global list of DMA-bufs
> > + *
> > + * Returns the first buffer in the global list of DMA-bufs that's not =
in the
> > + * process of being destroyed. Increments that buffer's reference coun=
t to
> > + * prevent buffer destruction. Callers must release the reference, eit=
her by
> > + * continuing iteration with get_next_dmabuf(), or with dma_buf_put().
> > + *
> > + * Returns NULL If no active buffers are present.
> > + */
>
> kdoc wants to see 'Return:'.
>
> See errors in BPF CI.
>
> And patch 5 shouldn't be using /** for plain comments.

Thanks, I found the CI errors, fixed, and verified with
scripts/kernel-doc. I didn't receive emails about them though, not
sure if I should have.

> pw-bot: cr

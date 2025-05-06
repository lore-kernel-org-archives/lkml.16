Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D983F4B1E47
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 08:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746521209; cv=none; b=mpRzERuPCfa7ard4jYrDkZL3UuyFDQW6c9tpag4c+L1d+xouqQShANjjvs6hVOKQwhIO4K0E70juT5kbtNuPvoWluP50XAs2KBfxaCG1vEiUeNjWLrMONKEUaLq7Pg3AcRXQg3kvb9WIaKS3W5Xn2cji+6N+i1MrN8JEi5R7n1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746521209; c=relaxed/simple;
	bh=JaF4HJ/DNDxWc7mYVleeWmEFWB04gncRwOOvOd0VtyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GC2uBq+CBG768YUeODj4UBZJ/v1NmfvNTF4kv5FunYksr6ALyxtPzW0iGR+8YxhDJ+MpAmzAdniFERRNwIlzI0mF62+gYcKMZuoMmDUuRHOIG3PKRGWdsd22BbjlPkpM4XkdcF3jljuJwj6iXoKSTW2xgwTfT48Fdhp/wf5vhD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNlGCw84; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNlGCw84"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-476977848c4so71010291cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746521207; x=1747126007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JaF4HJ/DNDxWc7mYVleeWmEFWB04gncRwOOvOd0VtyU=;
        b=NNlGCw84wV7tum/4MYGBdGPaZAk9TdE9cc5/ae+gRPkhh6+JzncZJpWKkd77M4Ae6r
         LPvmQ3OKgDEB6iMsXku7Qx3ET1zv2fF6Yjrl3WsmIUI2wuZURC88QXCkY2yMGkV1sRVP
         oEIYubuV0PVqr/osHRDLQ4g/zakPtj8skW4vgcP/pLo0KZ+sH1Fhgtgzo/Rinwg/o6at
         3eGjIN52H1QdMz4ajvBTbjcODP6c10/o4qH2Vdv2NQzlp0gFfeDAQthEvwVFJJYQkUsK
         MmJBq1VTvWkB058geRTw9Hz0PyLK7qLDtAbx1r3UALks13baCLnb7FFjeFnfZrd9BBtU
         Kvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746521207; x=1747126007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JaF4HJ/DNDxWc7mYVleeWmEFWB04gncRwOOvOd0VtyU=;
        b=A2BmLK2lPfx+DULzmvqtgxcoiQwgxJ64CHtws053zF4GClfsLuy6t9P4BZH0kwzsOK
         0wxGNPJqbaEKNYGJwRdcG8uZosn1jFnthPkndtR3i3wp7AWnthADlRqVhxlNTnG8JBDO
         s/s4S2yRS1kNevXe44pAG42975q90H+5OCIrb3D/sVKEPhjglEavGVHNg81jKF1+I/B4
         mxXYQJu2RNk+ajKBuwtmgc/al7wnjKYF7x3lTjEvXosGCGqzkCMeCa9ZjRigVBLHSjVV
         p8zUO3GSUDnnk1YOXwPhbSl5rWoI5L8ctSJZ1iHvXpLTHAh0gTET5DSjzopWhce52G9M
         Bhpg==
X-Forwarded-Encrypted: i=1; AJvYcCUMl5XMK8Joe4Q+Goft0dMyGh0/AWMFGTpmqelxrRpOMas6MHt973+mYXCZtprJFilr698UK0f3MwaaOJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkAGP8KYw7i5UZxUyXuxb0xDhtpNl3CxBqReW1gy2e59+r6erJ
	ZSsfyeLXJKveQskSUnMCDKEoFo3zAWAlYBVPK6rzKl2LyGWrV+vADA8gxcG6lkvZ8qmIXUIyuax
	qQqfJL3bhsknhEzuiFfsCd1Qjz0NGdG9uyCg=
X-Gm-Gg: ASbGncvtHJcHgZJyv/zq8VdIYpjraLicV/H2s8WnGuxbT8qW32CZB7ryEiDLF+ZKcDD
	ivEV1GMVexePM0ecrOoc5A2L76nb9NOE2IAlL6RCjNa3k0L50uO5W8O9ihRcGcowC3WQZnHk+CM
	EtrZlUTkldcv7l2hS9E4ov
X-Google-Smtp-Source: AGHT+IGlEuItqzObUKcbXYxxDqx46QQtqpueW7Pn73XKkWFGhrY8Qavv/aSA1QhLFO/Kf1hJqBGFC2xioJ+yt8j06DE=
X-Received: by 2002:a05:622a:14f:b0:48d:4887:982f with SMTP id
 d75a77b69052e-48dff3e0ac5mr130626621cf.8.1746521206742; Tue, 06 May 2025
 01:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
 <20250424-vt8500-intc-updates-v1-1-4ab7397155b3@gmail.com> <87ldranq87.ffs@tglx>
In-Reply-To: <87ldranq87.ffs@tglx>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 6 May 2025 12:46:35 +0400
X-Gm-Features: ATxdqUGKBoSj_e6rwt1rEvtM0FWrRpwvATKmpnJREd3tdfy5PfkFv7VRK23vf54
Message-ID: <CABjd4Yx5O-ivpyZ3ewx5dfLPR2q7N9HU5t9-uOoEDZa3y2woFQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] irqchip: vt8500: Split up ack/mask functions
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 11:38=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Thu, Apr 24 2025 at 22:35, Alexey Charkov wrote:
>
> Please do not make up subject prefixes. See
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-=
submission-notes

Thanks for the pointer Thomas. Will change the prefix to
"irqchip/irq-vt8500:" in v2.

Looks like the older commits I was relying on for the preferred prefix
didn't follow the prescribed format themselves - oh well :)

Ref:
0953fb263714 ("irq: remove handle_domain_{irq,nmi}()")
1a59d1b8e05e ("treewide: Replace GPLv2 boilerplate/reference with SPDX
- rule 156")
d17cab4451df ("irqchip: Kill off set_irq_flags usage")
d2aa914d27f1 ("irqchip/vt8500: Use irq_set_handler_locked()")
41a83e06e2bb ("irqchip: Prepare for local stub header removal")
9600973656c6 ("irqchip: Constify irq_domain_ops")
0beb65041e86 ("irqchip: vt8500: Convert to handle_domain_irq")
8783dd3a37a5 ("irqchip: Remove asmlinkage from static functions")
e658718e478f ("irqchip: vt8500: Staticize local symbols")
06ff14c05426 ("irqchip: vt8500: Convert arch-vt8500 to new irqchip
infrastructure")

Best regards,
Alexey

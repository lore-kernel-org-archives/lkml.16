Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FAF17A586
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153390; cv=none; b=Cjlif5LarhtMZh+VkDeyUIjV64oRAKRiKl+hWVI3PyURUh3clNr/x0dMA7hv9Rh4AJS7qX5gRd6bEcxj2rc0IQ2e0o/DfOkAoznVama/2P0FC3G4h2vkojYGVw+An922cAtMUFw1NtxLxYahTUs4hwp/LNwbIuMki9AlTw3UiUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153390; c=relaxed/simple;
	bh=0wxpnxxjsJ5M1lClgfAqSI9H3ajmJ+XQrovGZjKTfT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iEtdhfqQ8bkIOqQqEiD5RsUqx8HKRsC3+nxVyXM88vaQkqUWPT1t4btsFRHgVQTQZ3u7+QQTGfYWsniOfw0OBvnd/5FJWf7twuhhSzQB0snZmTE9ijVaOkO95BOOkaFxV3csclZpG1HhcpXyJ8XZ4YJAZpXCprr1EiWGl4Gl8cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b=zH+lJMUa; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b="zH+lJMUa"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so4476442a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20230601.gappssmtp.com; s=20230601; t=1750153389; x=1750758189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wxpnxxjsJ5M1lClgfAqSI9H3ajmJ+XQrovGZjKTfT8=;
        b=zH+lJMUaIVgv828u65AMFat/POahJOyDW7BeQusLrAUoBobQGsVlkbq2/3w1QPCvUg
         +0rxllD3y7W9JgRasB9RhTO4FrBbB/2dy9AhwiMftP4BCSi5VYgij3hOMUD7IoA7PtRy
         2o9lBiY3j0gq8o0STFWM9ULtU9Z7FZ9/Rmjm89H/XLn2PXECVj8XChLymG/7FsKcwcZj
         AY/U8FTNxlsDVP6KKehzf1vY1Vgf/Vh74GP+2iCb+sIaaqjLG/UoI5DF7sTJRoB5Wf96
         9X+SbhoKyvh251h2iNdyp3mCtKlNb9x+uN1leK1GxCF/qPIX4plrSnjjswZMt7q3QWZc
         8oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153389; x=1750758189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wxpnxxjsJ5M1lClgfAqSI9H3ajmJ+XQrovGZjKTfT8=;
        b=wrte+xKlwXFFJlHHEAzSACIX/2rbYnfCtVR3W+Y9R6/2kg381h1Ee5mVBpmPbuwPsr
         1zNOMcvSB/Z57yalC0rnJfKdUtPkmsZD8X0VGD6mrVVVM04dC62IBR2SX+LqhNaufkDl
         SR2CxvaPgrGrtDhfa8nge3cBuR6p+/LMOFCxsvE+W1VtnZyukOA6zt6Rw5JizbObyqPV
         NzTGjHIZecxCOa4UafbKdbH0frSmxWVVgcoXSx5VDneAq9CaVbjujAoh1w/hS32tEp3b
         q5qqr2kaTZS4ybjvvuRUlH9TXQL+tUcs9FpwDgtZuPxkbwsHwO4R/VM3GnD6A6ZWh7t7
         Pkgw==
X-Forwarded-Encrypted: i=1; AJvYcCWydJ3rg7EmYTasb4OAzdzG46do46SOVQktaAsa8qV+drlwhbxPzIjoLN+kFsnen6AOLtu817szXHxA69w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxejjD0SDGCD8XLx8pzRrrcODSVxk+rw69rPS0IQ7gJIrM7ow59
	YCtNDq9QO72+yfsa0tGoB89wkxHQ3tjbawsOO+hlMLjTa95N+NCQJWy3tFIdFUmNXTCYGp58K0A
	DlEXaRztbzY1H04nUrSqg6AwAMQCARLjFKKgOtlhd8R156DzQoYDY9Zw=
X-Gm-Gg: ASbGncthId35mhIPQf6j/MRuXeKBkUQQ9cZgnN5WpKCrNOORHTNzH+c7m7cwWEZsY4H
	ge+pxfHPIclBvCWcER/cCpPZE8MrJr288sSBRJsNvSTrTNh0wXSgDZA1rBMr6U/FiYzkkM+WCrf
	+VZ+B/1CUOTXVJHOgPacgjN3fDHuYd/NgVKLHoklOzJSUFFKEXdPyp8m7OykOXYZGhPt5uh5s=
X-Google-Smtp-Source: AGHT+IEIZvsZUfqmRVeCIjkrVoCuKUL8ahsqAAeD9x3l4XudbvcbKCMdofS/Auh12FqlEzOp64XiTb5YFEu870NtyJU=
X-Received: by 2002:a17:90b:4ed0:b0:313:17ec:80ec with SMTP id
 98e67ed59e1d1-313f1dee7d8mr15413081a91.26.1750153388815; Tue, 17 Jun 2025
 02:43:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616095532.47020-1-matt@readmodwrite.com> <CAPhsuW4ie=vvDSc97pk5qH+faoKjz+b51MDYGA3shaJwNd677Q@mail.gmail.com>
In-Reply-To: <CAPhsuW4ie=vvDSc97pk5qH+faoKjz+b51MDYGA3shaJwNd677Q@mail.gmail.com>
From: Matt Fleming <matt@readmodwrite.com>
Date: Tue, 17 Jun 2025 10:42:57 +0100
X-Gm-Features: AX0GCFtPDyBqn7BE07OuWxDr-_mR00jG_TcPmACHAVHTct3u7WfUCCgw3Ksrrgs
Message-ID: <CAENh_SQPLHC8pswTRoqh0bQR84HHQmnO3bM07UQa1Xu9uY_3WA@mail.gmail.com>
Subject: Re: [PATCH] bpf: Call cond_resched() to avoid soft lockup in trie_free()
To: Song Liu <song@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@cloudflare.com, 
	Matt Fleming <mfleming@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 4:51=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Mon, Jun 16, 2025 at 2:55=E2=80=AFAM Matt Fleming <matt@readmodwrite.c=
om> wrote:
> >
> > From: Matt Fleming <mfleming@cloudflare.com>
> >
> > Calls to kfree() in trie_free() can be expensive for KASAN-enabled
> > kernels. This can cause soft lockup warnings when traversing large maps=
,
>
> I think this could also happen to KASAN-disabled kernels, so the commit l=
og
> is a bit misleading.

This issue can definitely affect KASAN-disabled kernels.

I mentioned KASAN to give context and explain why I saw this and
nobody else seems to have reported it. I'm happy to reword this part
of the commit message if needed but I still think it should mention
KASAN somewhere because that's the reason I discovered it.

Thanks,
Matt

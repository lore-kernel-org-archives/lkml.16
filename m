Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC221C36
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745662215; cv=none; b=cEnvRULmiKS9ApHs4IoIBcwUY4J4Jfjhj6bquQJwIiznZXEQZJU7Gf6Zxd7BEupXAwsRUpKVESG5muqccZpNATurH8qFh0jgkdhGeGcBLEMktLgkVDxOoTAZ3/hU9MyNZAcrD5rH0iKj0OmWwiK6VJ6DEYu8CSFACmyxVRhpI/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745662215; c=relaxed/simple;
	bh=w2OTMbZH1TRrDA8DMHeOyx8pTNe4i1Sbt87eGm89KV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bmulw08bqA1brHeq+NP6okQSpWr4vbW+kWp+GYD0TIm+xXgKsQmh0rG6FOMj/sjrpSbRn3iPizZg2IpLKNzkoWn0GwDkZNFt+qKp/HqasLfHYeYxW57Sbhf0pOh/qxPGqo3ixuGY7Z2dv79ip9q2IFHWGE29IATWUcufSY16VmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMll3e91; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMll3e91"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758A6C4CEE2
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745662214;
	bh=w2OTMbZH1TRrDA8DMHeOyx8pTNe4i1Sbt87eGm89KV0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WMll3e91GN1rIkF1UItGVmsveNAbUR2ZzdPBReKv5XZesQkSDXmNPj6sO9YesM7py
	 cyJecgb92HjcFxLkWojGL450xy2KvxWeyW5NEs2KthEGJ+SYd5raS35HMEPJ9h1zXB
	 dQ6TeZthJ/hOoPry6O478AOrqENL0YiWhzD8zjIu96nndIwPp/iMNF3a0UWJpCi1Lo
	 v4BbvcWdRZnlOzJkVqROUQJnQUM7MXpihFGoOjHp4UC7uiTzZ3T3IU66sDX0jNv/Qz
	 xT0MyFFCOLmwhJHgZzZh9oElcwuXFsctvhFH5i/DStRJJYELISgKiLXI0FS47cYUoK
	 tYxaUz1e/feuw==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ace333d5f7bso503556266b.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 03:10:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU44GxxvjjH4w4VP/32YadQD4UQ5rpmOQS5QTasYOuF6AsiO/B7c4RkZV0bxnpHUEkhWSb8x8HVyPWBhGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwblJzrL+5WVo8eYAeZJn/5UeiJVIU5n4VdWq92Rya9R+dfQ/N4
	hY/HlPF9k5U+WRIROAXZz1o6XXMsR/vCUpZOsCa50suHLQbliN8dTaFUUaT+lBWcF/pAmZQGZfo
	3lMNMXxH7FG5Xa8oVGI6x/RnpXZg=
X-Google-Smtp-Source: AGHT+IGF85u+9LUHo+3f8sW1FTOQjSRyVq6ObG3byug0H/kuQX0oI85RYmmRr2TC28shLSQxCgzMdggPu5TEB0jd/Ow=
X-Received: by 2002:a17:907:2ce3:b0:ace:8389:7c03 with SMTP id
 a640c23a62f3a-ace848f8bdamr169357766b.23.1745662213066; Sat, 26 Apr 2025
 03:10:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422110719.15673-1-yangtiezhu@loongson.cn>
In-Reply-To: <20250422110719.15673-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 26 Apr 2025 18:10:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6-mj9=38rkHMLLAQ5kcp5dL5cG6tZqxVCx+zDOkzJV9Q@mail.gmail.com>
X-Gm-Features: ATxdqUFjXxH8j46ZuOfuDTGQkIHODPVMIYHzg_3cdP_SalbS65yoam31QWtPwbs
Message-ID: <CAAhV-H6-mj9=38rkHMLLAQ5kcp5dL5cG6tZqxVCx+zDOkzJV9Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Refine regs_irqs_disabled() and do_xyz()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Series applied, thanks.

Huacai

On Tue, Apr 22, 2025 at 7:07=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> Tiezhu Yang (2):
>   LoongArch: Make regs_irqs_disabled() more clear
>   LoongArch: Make do_xyz() handlers more robust
>
>  arch/loongarch/include/asm/ptrace.h |  4 ++--
>  arch/loongarch/kernel/traps.c       | 20 ++++++++++++--------
>  2 files changed, 14 insertions(+), 10 deletions(-)
>
> --
> 2.42.0
>
>

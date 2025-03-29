Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89A018C011
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 08:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743236906; cv=none; b=AgAxGyV9E2ifbnVhcqZh6KV2kC28GfJbkAAOMAJAwbqi+cmqQ14Q5lx9FN1LRQsKbJ+t1J5SdDFuwzj6u+T4y9hH55FbQPmoNO39Yth+tikf56hLf+4svztqABATRUQky5aE7WLVTbTdk94xkyI2YHg1bnt4cRlYqD57G6w22l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743236906; c=relaxed/simple;
	bh=e1cY4wDvK4VftRYcudk3ssemGuj0YiaH7+kvgqzoA/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fs8h8n1t5TTAKDiR1o+pU0p9IrUkUGO18fX8BJH/iF+HBZ7kYA3FcJs2RN5TLKnGgWw0dgyHamNgAVrsY0dxB1yD/4gKusHcPM4fwAkcSDPUxqETfAENXV9c7WJV/NWQk0WqPycXd9oNqhIjdTbexC+0sz03UedruObHfZNNkfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdLkSuIb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdLkSuIb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F3AC4CEED
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 08:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743236906;
	bh=e1cY4wDvK4VftRYcudk3ssemGuj0YiaH7+kvgqzoA/k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RdLkSuIbujNkjfjTNEv1hw9zcaN0+WRn9Y99Ww+YtvXPjM3h3Yq0z5WJ5Na0A7+8c
	 Vt3zzHogZNKw+lB67Tad1/5DfZSrhETxCh/MlMQlRTf8S7ugKbL1kGH6b8ghFUf+q9
	 lwdKqAVXZ8/SqKlhgiOKMOeVSZBdOdsz/3uyn2f86SQ4kmPc5Qg5y0ImUCpCPf4QDy
	 yB8ng2bV2pvUAMPq7E14ppCGAYKypN5f1w26QDw+/+MIoTSt48hRyWLynp9aSmllgJ
	 vYeeTcqy0SDPmMnRpYH4d2qz992KnShVehY6McI99Xs2A/sJSQjiMy7PYQkYswzPPc
	 8qbKQZCCMOLsg==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac25520a289so482299266b.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 01:28:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVO1HcV3MxRaodt70cMghfK/re32EOCCqsMXL1/Mh78C6KjQFw4+gCtgTycba7Cfd1LoUcWKuHXsJS3yU4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4HncaC7GN5ZPL+B63k4fsh8/v7eGRUvxRTLgaM+Xlu1WizxCe
	t+YWS8fvIEWY0ZtSE5g91OkULO9gOCnBEk2kXD+C04G7al9Rj3rUDirfO8m9dp07vhYMFUv5hJB
	9VM4BN0d7HVt6U52FjYgrBKG8KxY=
X-Google-Smtp-Source: AGHT+IHp988rQ7jetK2u0ZAsAshqVegnEyIg3/+rnAPqbn8/6TQzTuuuypiRz5YKXCzBppKPpkxBSR9m0LV1qi5zq9M=
X-Received: by 2002:a17:906:17cd:b0:ac7:391a:e2d6 with SMTP id
 a640c23a62f3a-ac7391ae497mr137180566b.61.1743236904805; Sat, 29 Mar 2025
 01:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_7FAF68BF7A2EAD9BFE869ECFDB837F980309@qq.com>
In-Reply-To: <tencent_7FAF68BF7A2EAD9BFE869ECFDB837F980309@qq.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 29 Mar 2025 16:28:15 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5T3DLFfzPg4Zgzn7JbzqoNZdYn5_F06QNHS230xq-1MA@mail.gmail.com>
X-Gm-Features: AQ5f1JoQnJAkAnrmlGENGEM6qTF7TYpCwz2mVRLO1-fU8G61sU0d4Lupr9QplA0
Message-ID: <CAAhV-H5T3DLFfzPg4Zgzn7JbzqoNZdYn5_F06QNHS230xq-1MA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Kconfig: Fix help text of CMDLINE_EXTEND
To: Yeking@red54.com
Cc: loongarch@lists.linux.dev, WANG Xuerui <kernel@xen0n.name>, 
	Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Zhibang,

On Fri, Mar 28, 2025 at 6:13=E2=80=AFPM <Yeking@red54.com> wrote:
>
> From: =E8=B0=A2=E8=87=B4=E9=82=A6 (XIE Zhibang) <Yeking@Red54.com>
>
> It is the built-in command line appended to the bootloader command line,
> not the bootloader command line appended to the built-in command line.
>
> Fixes: fa96b57c1490 ("LoongArch: Add build infrastructure")
> Signed-off-by: =E8=B0=A2=E8=87=B4=E9=82=A6 (XIE Zhibang) <Yeking@Red54.co=
m>
> ---
>  arch/loongarch/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 7477d5f8d876..067c0b994648 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -388,8 +388,8 @@ config CMDLINE_BOOTLOADER
>  config CMDLINE_EXTEND
>         bool "Use built-in to extend bootloader kernel arguments"
>         help
> -         The command-line arguments provided during boot will be
> -         appended to the built-in command line. This is useful in
> +         The built-in command line will be appended to the command-
> +         line arguments provided during boot. This is useful in
>           cases where the provided arguments are insufficient and
How about replace "to the built-in command line" with "with the
built-in command line" and keep others unchanged?

Huacai

>           you don't want to or cannot modify them.
>
> --
> 2.43.0
>

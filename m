Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0195014C5B0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 18:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745344875; cv=none; b=Z6FgT34AxSHpqPKNTKga/qG013J9Ja2xyw3fa1iU5b6KB1MxByV+sJspfhxIEeChkVJtHgXtlepQbExdS3S/Qh8r90MguxsLwu/g86p16hb0zmUOR26k7GqPLTcOCG+JQ2HIIyKWjjDMTtS9Be+r7kkn+aiBR/kqHcDTbd+VIlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745344875; c=relaxed/simple;
	bh=tEzlwDLHawhk+m3M6na2HLVeCP9xpG0csglHofsTBHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTjeR3oHewrT/ptb+kofBOOQhIx741ObSrkznf3ss6od+nY2sgSZ8tV0ut0WB6Rd88pvSZ38YS1B9xLBys0FXqT8Iox3VmsecRd/Vaqub9qqVzpmxxnqRsnsbDAHs95chVshWWycHydg28AFI2mSxUVD+kvPATz4IKASMrx7IuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOvXowl/; arc=none smtp.client-ip=209.85.221.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOvXowl/"
Received: by mail-vk1-f196.google.com with SMTP id 71dfb90a1353d-5259327a93bso2211201e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745344873; x=1745949673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhMRPxRHmIvpGOSvfB91vw3N4+/QYE7lPBXCJ/aGQA4=;
        b=AOvXowl/QH9u+r1tOOTbXSkexk2P9bh20JxKY+HB4rDSOOdsoSTqDAtHxfz1XLlVwk
         eiCl7h4Ez1RalKMCULISperuf2WN/mQKirsd307lgNvbOj0/Z28s+anGSv1zlAl/U9jO
         DSWArOYecAs90ZZ865cUVUFednonLuKEiqorJOmTbbKy+SZJ0+O37gMH/tg1B3tJG2dd
         PJ/+PWaJiU0umaqUTLoQu4jtPH2JMDKaawU8A+TgxAMsZLpb4mqNkh/I+TQnaNK7VEo+
         lR+w/dmfSWTe6MWRpi/0kMqlsanxaJBjWLjoAFRVzD6dK1whxe5kVPn6nhHO0L8OWHSs
         zHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745344873; x=1745949673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhMRPxRHmIvpGOSvfB91vw3N4+/QYE7lPBXCJ/aGQA4=;
        b=wML79UQkwL4HlSqqC3pcf4JgJ+yiw2EBTOAF2Dg3j7gtO8hwDd+3rqSB+DqixWONsW
         7XXs9jfE1olNwH4g3axAI7jRRug1ACp1NYTdxwuboW/NiTesyGM9UF3OvnhWMoEnE+NJ
         fGQaI6Zg7ySJRIljitSSig4fu2UFr+ctHgQDp8XEQnVSwfDVklxCoRO5M++4rFR0bPMZ
         mlDM07+dlnng37IixsAJTNXgLAeULtjiVD3dO7sdmcYvC6nSDa2UAsX39Uw5fZRr+uo3
         NfcmBcSaWBcqVXbc1jCFyZUKbjgWetKuIEk/xmU7K8IjXaX5DBEnPllrtE04om7CuWIx
         1UPA==
X-Forwarded-Encrypted: i=1; AJvYcCU0qOpsIuehOoUGPvIaZJ98eec6Wm8tF2Iy0KOOdoguYAt42wHzhH7p8nA6/oOwNdGYQY6q+B3KYJ1XBiw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4A3cqqs4cjuG0vVD+/XaaBAC92io/mlskl1eZj5H9nP9DdSYp
	2WI7Chv6k4lm3QUNuLPPJsTF2PAD4YxYHNli8KSASTh/kVNViTFAE4ugPizkz7iZWCR1wq0fqZk
	a/7VXVMr0bwH1Ym5bbRVKz4CRge8=
X-Gm-Gg: ASbGncswzpsMe9E99X92HZ1w+Yof+64oCQlleQdYByXvnirQyHyJwqN0YpfqugzhxqV
	3ueTZLU+BkaBtq8TtXZGxdUshJlYjCJnmQIxEZv8NXsEtAhg08KVBvRkSUuw2YrawoT8alz0Ksm
	gjq102gj0chofUV4Ysk3NWpQ==
X-Google-Smtp-Source: AGHT+IFkdxMi5e5qmvvYcCfqmngYMAHWYS33NrUVukba7tzTgod5XNe4uisvvB/k2rlC2pt9A9cKLlfSxGjgOmyXHc4=
X-Received: by 2002:a05:6122:8d2:b0:526:1dde:c5 with SMTP id
 71dfb90a1353d-52925242315mr11366662e0c.0.1745344868174; Tue, 22 Apr 2025
 11:01:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403181200.34418-1-m.mahdianbaraki@gmail.com>
In-Reply-To: <20250403181200.34418-1-m.mahdianbaraki@gmail.com>
From: mohammad mahdi anbaraki <m.mahdianbaraki@gmail.com>
Date: Tue, 22 Apr 2025 21:30:56 +0330
X-Gm-Features: ATxdqUFDZgbVSaKYq_TE4emkWXPXRc-UVFCIrTdnwAEXB3_QhwZ8Sg3sgqUGSpg
Message-ID: <CAEpZnwVW2x7oor+=9uRiJXyC_fHgZPet5eA0w4O-shc6Aimt2A@mail.gmail.com>
Subject: Re: [PATCH v2] m68k/kernel: replace strncpy() with strscpy()
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi
.Just a gentle follow-up on this patch
/s/m64k/m68k

=E2=80=AB=E2=80=AAMohammad Mahdi Anbaraki=E2=80=AC=E2=80=8F <=E2=80=AAm.mah=
dianbaraki@gmail.com=E2=80=AC=E2=80=8F> =D8=AF=D8=B1 =D8=AA=D8=A7=D8=B1=DB=
=8C=D8=AE
=D9=BE=D9=86=D8=AC=D8=B4=D9=86=D8=A8=D9=87 =DB=B3 =D8=A2=D9=88=D8=B1=DB=8C=
=D9=84 =DB=B2=DB=B0=DB=B2=DB=B5 =D8=B3=D8=A7=D8=B9=D8=AA =DB=B2=DB=B1:=DB=
=B4=DB=B2 =D9=86=D9=88=D8=B4=D8=AA:=E2=80=AC
>
> Swapped out strncpy() for strscpy() in parse_uboot_commandline() while
> copying to commandp. strscpy() makes sure the string is properly null-
> terminated and gives a more useful return value so it's just a safer
> choice overall.
>
> Link: https://github.com/KSPP/linux/issues/90
> Signed-off-by: Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
> ---
> Changes in v2:
> - s/m64/m68
>
>  arch/m68k/kernel/uboot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
> index 5e52ea150..fa7c279ea 100644
> --- a/arch/m68k/kernel/uboot.c
> +++ b/arch/m68k/kernel/uboot.c
> @@ -73,7 +73,7 @@ static void __init parse_uboot_commandline(char *comman=
dp, int size)
>         uboot_cmd_end =3D sp[5];
>
>         if (uboot_cmd_start && uboot_cmd_end)
> -               strncpy(commandp, (const char *)uboot_cmd_start, size);
> +               strscpy(commandp, (const char *)uboot_cmd_start, size);
>
>  #if defined(CONFIG_BLK_DEV_INITRD)
>         uboot_initrd_start =3D sp[2];
> --
> 2.43.0
>

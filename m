Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A021A261362
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746030072; cv=none; b=rZRZ1dtvWRE8M/TA1V8n5n5z7jF2zhYr4O8/C6Wma3j/KSu/XZqoUWrvbDoBw6ynT1fELHuHnCMLUZXax6pYvju79576OqR+HPtBNsIw9hbxaFI/tSCz+HCAgIO+GjxMLm+k5P+xK5JHS8RVuJPmuowZVmPhNuyIQcBlPnFXhT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746030072; c=relaxed/simple;
	bh=cWuwpID4ow0Nv5NvrwSre9qMIxbN0XB35u0L/1yPIiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QhYwXWM0xUS+/Mew/sj8FjfSgscNuTfXzXv1A/wvAabI7R650QvT0tQgh6PJFn1eqzYDYhLnX5X2t4oUcSHgpovVvX9RIg/9uMlaRyTQJhZZfnD5GpkeDJdIbkoctXd2MBL6XgD1JPxFYgPmo+T/sdPz1nA5uGTkThkpc3E6jkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SrE/kTXv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SrE/kTXv"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe808908so2945e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746030069; x=1746634869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4t9Jwzp3tALmT5Y0kuqzt6lZQSaIPQ+RLi/Bjs6axI=;
        b=SrE/kTXvp0uEFkkddRSYy72Q4RMPsmKVNQzUB7xLnspkLBILVXlv09bF3LlYMsbMog
         YBsYiaNfLakmVSwn5yjXnxmdhQ7lxAVzwZg5EkjoXNkA5JLqq/Y7Q7cPdw8JIcTsJ8lg
         bCIOOxHgpOpFIl3mIUicfEQ7nRDZp2v+tL9EpSuPmsLZdcR9KffFIHEKyMeL7xfTDbs7
         CGfkBlwJfJSYO86vrjgVJfY6U1vrp76PtztL8XDsQ0ryYZD4VvcTgRiOAsqhlRIGrOB1
         EjT6mMVzy95xMDYQwQvXejmuybtCTXL2qXIaoOP4VbIPPwGmv6yOOmRwneDsDvPWx/82
         ePDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030069; x=1746634869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4t9Jwzp3tALmT5Y0kuqzt6lZQSaIPQ+RLi/Bjs6axI=;
        b=dH5R9DiZq2daUMzEOjpj2AP9QYZWXaAU+lfCotQmikCeNeCUugyRiiBplG9dQMHUMC
         o6hk2xXN5ekLFCP9/h89dET3Zac50bBt4SdHnlBzYY3fBy8LAtbS8v9C18q5mXNijQ7x
         aJ6FwgB9YR7ztanSfUNtHxm1ylvavskfCk7WfbyT4ZQtaAZTh0QhXyOixJhRHV6QYSPl
         K1AdTPMKgpk25wpNsQTPB02GMFk+dEymK4if1/U4gwK0BH/VVaX7dFpovUt9q77zDhPs
         3PnWTLyyzqZjrIOisJSyD0o5yKz5cfoPUMx7piyXl/x14Pdlxcm6OQ45+64qTyY3OiX4
         nZTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeqCUByZwjNM2H5jyI23ki+G8dWj9m4BoCQb22nmVODaE1x53OuglGM5wJumxBO3YWGuc9yIknqVgIOKU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi/iPiNIagGK17c/H+EHs/wWecqvqjmSMr3AN9UfQCfgzv1vcT
	WYFZqS2H5KwOAKX/iLNHpmb6kBBcEk96rHGUEh9qvS/J1oQni1oK/M591hwvLf1dlA/Eo1g9yCT
	RWMp8qOoY7u+FYAsOPHLJkR+cTP6DWPZWPsfd
X-Gm-Gg: ASbGncvk47jCZUvoT5F6AIXJpryGYW2xDcbtPVhPLelNBTNHSXojwliQKto+tLJuE52
	JvwNR9LPd1ZOGqU+Dqy1a5z9uC5zTSOPKEGnrGxqe7svKQ3jeAxxDBmsGNA7FrrFETHGbmC/E+W
	9Y/MFaWhrgf7Zt0moGr1LbDNph0olI8HcHsTmT8hg7jmTlVR3/Ng==
X-Google-Smtp-Source: AGHT+IENM6Eh0EWW7XE/gaUWIsK+w8asvkWeu4drq5OeFhBehmM+fZ9cjvw4O9E8XZBXjlmRKTvMciERxI2/CJnKT/0=
X-Received: by 2002:a05:600c:63cb:b0:439:8f59:2c56 with SMTP id
 5b1f17b1804b1-441b20096cbmr1334855e9.2.1746030068758; Wed, 30 Apr 2025
 09:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115105211.390370-1-ps.report@gmx.net> <20250115105211.390370-2-ps.report@gmx.net>
In-Reply-To: <20250115105211.390370-2-ps.report@gmx.net>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 30 Apr 2025 09:20:56 -0700
X-Gm-Features: ATxdqUFcCdxSPFBmNim9qAAPca0KuXa7suNkaPFI4nBeNOT7XQmGzJgW0YUXsts
Message-ID: <CABdmKX3zM8NodtvCDgRJXAYrXydxbKsu7UXL=iWNbO5RW6-Cng@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] selftests: pidfd: add missing sys/ioctl.h include
 in pidfd_setns_test.c
To: Peter Seiderer <ps.report@gmx.net>
Cc: linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 2:53=E2=80=AFAM Peter Seiderer <ps.report@gmx.net> =
wrote:
>
> Fix compile on openSUSE Tumbleweed (gcc-14.2.1, glibc-2.40):
>   - add missing sys/ioctl.h include
>
> Fixes:
>
>   pidfd_setns_test.c: In function =E2=80=98current_nsset_setup=E2=80=99:
>   pidfd_setns_test.c:172:54: error: implicit declaration of function =E2=
=80=98ioctl=E2=80=99 [-Wimplicit-function-declaration]
>     172 |                 self->child_pidfd_derived_nsfds[i] =3D ioctl(se=
lf->pidfd, info->pidfd_ioctl, 0);
>         |                                                      ^~~~~
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Reviewed-by: T.J. Mercier <tjmercier@google.com>


> ---
>  tools/testing/selftests/pidfd/pidfd_setns_test.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/pidfd/pidfd_setns_test.c b/tools/tes=
ting/selftests/pidfd/pidfd_setns_test.c
> index 222f8131283b..4c8a0253a64f 100644
> --- a/tools/testing/selftests/pidfd/pidfd_setns_test.c
> +++ b/tools/testing/selftests/pidfd/pidfd_setns_test.c
> @@ -17,6 +17,7 @@
>  #include <sys/socket.h>
>  #include <sys/stat.h>
>  #include <linux/ioctl.h>
> +#include <sys/ioctl.h>
>
>  #include "pidfd.h"
>  #include "../kselftest_harness.h"
> --
> 2.47.1
>

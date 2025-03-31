Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088BA214A71
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743438696; cv=none; b=NLSatl44Rd7928s3NFG0zIW+5Lud/H52xXJAfqrseXTMv/EjjLVXkpW0oxb11SGUhlePQNHyCiLSDx52lVVI2Z+9K8nDtQpVa0+Euox9yFAhnVaHxc8WS+emaogM+cfS0yp0RH+PPSwukAsxx5vTNLRidTzV8oR6qi+14iy3W0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743438696; c=relaxed/simple;
	bh=+t3bAIeqzZXzoFUWAcJIndn2INiDi7746DRbaGLLSiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MsfpAFi7EPwiq8XrC+un3FQEGml7pc/vhpAnUeGca32fsRsKOcfj8GaXeu1hb6qd37XwBhDUnC/8IXskNlV/aojtfY9QecoJieWSav7hLFMXnEgf3Ok0CmXxey6EWInpn8ypJ9yX6f8ulh/ZCKqXwNbGKp535gDZwZJeEY+gSzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hXfmfFKw; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hXfmfFKw"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so51a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743438692; x=1744043492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCUNVEwXQjN/ZYMFDi8yyefx1Qb62gH/JvVinJDVFL0=;
        b=hXfmfFKwXrrnOUzBDe2fRQ86yMZ2S4Atx76yknNni32dNF1kRG025/YGv8ufsHf15G
         HtB6CkhGvMq/d73sxVibN9gAoQJidwkvvwwU36lc1qSCj7dvnJPRr9nXbCH/JmvDlc83
         vkAeXyRL58r2ESuFIHojaFNwSWmgaOI8DTc+mMOzu+2vpUH+rC1Uk0E6t/x2tCRFULNU
         yJYdjlsVFL52M3LWk3CD0V5d2FEL5e7AWpgt8f0x6v1MucB5pkNROeH3um0RDAeHpOcK
         /6uoXKez5ZGyfPQ2OMHYFWLgqhgyAiO6UBltqSbJRNmD8+IFCnsdUsXGuie3ZVkuii9G
         92fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743438692; x=1744043492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCUNVEwXQjN/ZYMFDi8yyefx1Qb62gH/JvVinJDVFL0=;
        b=s5/lUG9sA7QJvNdTDUa7nN+PlK3iSJstRCP5IzSTuHiNS7p1t1Gvl5Lz2p1Ks+Y7gi
         MFAOqsReDXjvZ0JnazgcEuhr1Mked8IU6CS8sWZiYM5Q176aaaBOkUMC2MQ9SAxaqfiz
         sapYMtXkALDQjZl1rvNBvKJ19X86jH4lEhaGFxVefpAv9cZIOwD849Q74w6glVsOoa8R
         QDsJLuYEAxxGi3kooiVi7XLA863jCmS9SimlydqgGBoyUAB1KtFyAVOQ60bbP8BQ9Nai
         iVaL9yMnVzG+um7CJQiFUX/ru8Kyv7hsyZOBtHETCThuaZ2j1W7pPO4ZFgWnHDnBB/KO
         1Exw==
X-Forwarded-Encrypted: i=1; AJvYcCVQImN37GE2eE85TN3qDmSmfPhqRdS7D+SrTkyksh+aAXGaccqJ3HcQL2Wn/Nz6vYQOywGQ5jHXlw7jcAY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7dXr3FBaO1f7OhAHXuGZlHblW0+7pdDh5xcKIc83f5zAcchAs
	kfwwScgLJXMGAH74Uk62FikMx8HtQgx7du5rGD0xRm38Jdv8oCezUBsqk0BBs7JRJGwwWXcY0Gg
	tCVOzy85Bgg7nfQjJ0XJjV4Q+Ea4OquZr0+Y2
X-Gm-Gg: ASbGncv/jnihOfAat1TfEh7HFfDVfm6+gx8w+lQ3V9AeNkjmsR/VXAapY7ATwRuS8Hr
	TY94ydQgbCpjosuFe37wSL5R1hXZeEllBQzev80iy9pHuBgCzSP0dFL7cWYYwkROhKgOoCOjEWz
	BuX63DHpRfVMB3ncAm2EYaqty+h3ZZAVg1m3sCU+qa9OnrKlHAKyCno700
X-Google-Smtp-Source: AGHT+IFS75Z0XM5wuiNpOfgrNbtyh5kI8h29Nwu2aeDt7jd1u7vYMcdG/HRw0PtOOdN+1JfXFoeOy3TjhzP1Z5z0xXA=
X-Received: by 2002:a05:6402:1496:b0:5eb:5d50:4fec with SMTP id
 4fb4d7f45d1cf-5edfd9f7c30mr193132a12.0.1743438691972; Mon, 31 Mar 2025
 09:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331025416.478380-1-chao@kernel.org>
In-Reply-To: <20250331025416.478380-1-chao@kernel.org>
From: Daniel Lee <chullee@google.com>
Date: Mon, 31 Mar 2025 09:31:20 -0700
X-Gm-Features: AQ5f1Jo40vcwgWkYkmTPvqs1vtSU5KqyB2uPVh5Oo9YyNkgBQNmuj1T35rlyJpU
Message-ID: <CALBjLoDnzALdShsEzii6pK+fxgbeNVh8weKVtb=PyFJ3XgS1NA@mail.gmail.com>
Subject: Re: [PATCH] f2fs: support to disable linear lookup fallback
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 30, 2025 at 7:54=E2=80=AFPM Chao Yu <chao@kernel.org> wrote:
>
> After commit 91b587ba79e1 ("f2fs: Introduce linear search for
> dentries"), f2fs forced to use linear lookup whenever a hash-based
> lookup fails on casefolded directory, it may affect performance
> for scenarios: a) create a new file w/ filename it doesn't exist
> in directory, b) lookup a file which may be removed.
>
> This patch supports to disable linear lookup fallback, so, once there
> is a solution for commit 5c26d2f1d3f5 ("unicode: Don't special case
> ignorable code points") to fix red heart unicode issue, then we can
> set an encodeing flag to disable the fallback for performance recovery.
>
> The way is kept in line w/ ext4, refer to commit 9e28059d5664 ("ext4:
> introduce linear search for dentries").
>
> Cc: Daniel Lee <chullee@google.com>
> Cc: Gabriel Krisman Bertazi <krisman@suse.de>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/dir.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 5a63ff0df03b..e12445afb95a 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -366,7 +366,8 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode=
 *dir,
>
>  out:
>  #if IS_ENABLED(CONFIG_UNICODE)
> -       if (IS_CASEFOLDED(dir) && !de && use_hash) {
> +       if (IS_CASEFOLDED(dir) && !de && use_hash &&
> +               !sb_no_casefold_compat_fallback(dir->i_sb)) {


Would it be beneficial to evaluate
!sb_no_casefold_compat_fallback(dir->i_sb) first for short-circuiting?


>
>                 use_hash =3D false;
>                 goto start_find_entry;
>         }
> --
> 2.49.0
>

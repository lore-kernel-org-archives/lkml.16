Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D82D28B3ED
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287728; cv=none; b=P9JRNAgB5yAQNMuRvM8FCPagNBs2CcZU81jGroqqCJmCacZ23JWhhrimI0yb50AmV7ffDzRgv9gAG1o78iiXmWRfLYtsJ6QH06Mq1GQQ5c66XXKnMlV7n8d+IsFpkrtZs1Pt4UVCTfi6A00/E8PD8M7jQwEQk5dJcP0QQ4TEsvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287728; c=relaxed/simple;
	bh=zgNg+JD+uR2B0BGvyULkEjQJW4ZX/qGP9O/+JKFlOzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ui405hxg6XLsjvQ4rgwgtLcUyzZrsH9Ebg2csqv4fqnH9ZqrEGUcEtude1yLLDe7Qde6LUKa8P55ZcYyLMMaRrXeq05yCaZ3NadaiWNUaw6d9T9lk8n63xxmtPUAdtXDjEClV3cTcnpoCtt3TWNMG6ugCsuNU9ojj1x/KtwyvwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pRud5G/X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pRud5G/X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92252C4CEF3
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751287727;
	bh=zgNg+JD+uR2B0BGvyULkEjQJW4ZX/qGP9O/+JKFlOzQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pRud5G/XwFQJxB0zN9ubBxat7bCpU6P/pi8VhMMAUdRR2xE0t1Xd5lrrkEY4faCr9
	 /Flcw2bCqB3suZT8WdDmbv2Jk7pnTvE8s4/bw7tlovO3taXcDKrleBjbOaN7QDL9iN
	 /iV5YQq1tw7HGBGeX+iQA0UJThvAToQyu8Z6godkBfgc4vPT2Eq1WbwZRWxFqGW1uo
	 N/BfBY55Q1GWy3OeQZEZ73fue7oqv1yk2J0+wyYjwkI7KxhEPxGMJ2bVklxRBO8DqE
	 /ffVO2yUPh+6R/Arz2Ink8xpf+54nLU3QoJhsLw6F7q+39y3/OAVvPJvRvjWiTmyKW
	 p1BEBTppi0E1A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-555024588b1so2358326e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:48:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeAKsr2b7DFsEw3BrjG+5Z8KOSnBRzVSsokMC5x638avJL0kHfsLG/sdrtN7JV7yG3iZvjZcmBJrjEkXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza4F+xfoIiprAEQzPco1t1ajbPpdfwYHaBObyzANoRGUnsYRTa
	qC8LiAKENP/mOUQBFb/bicYMLztyz+jb8I79WsVU/+uzBQfWIhL+rAQDyFZBDsupVn8yK7vEowT
	FdBNpJyto3O34veLCGhg6owphqTkWlR4=
X-Google-Smtp-Source: AGHT+IHRnCoT1T5jSVdfkPPdBiqDoNQRhfUPyh17fzFH7kGHnw5pkIZFv3jKsO5X5e7UOVtey7gjJP262Pv3opqYKds=
X-Received: by 2002:a05:6512:128a:b0:553:2ce7:a201 with SMTP id
 2adb3069b0e04-5550b8475edmr4399558e87.19.1751287726114; Mon, 30 Jun 2025
 05:48:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629155208.16174-1-wen.yang@linux.dev>
In-Reply-To: <20250629155208.16174-1-wen.yang@linux.dev>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Jun 2025 21:48:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQJ=yf17ww9=O7CQin0uANmWEgqGw_1tpVJC8634BAHGg@mail.gmail.com>
X-Gm-Features: Ac12FXzKC2FtpOGRIizJfNl7H_7OYwbkxQf6yQ68KD2YdSZWKJOcNQKz6CmTQuI
Message-ID: <CAK7LNAQJ=yf17ww9=O7CQin0uANmWEgqGw_1tpVJC8634BAHGg@mail.gmail.com>
Subject: Re: [PATCH RESEND] scripts: headers_install: fix a false positive
To: Wen Yang <wen.yang@linux.dev>
Cc: ndrew Morton <akpm@linux-foundation.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 12:52=E2=80=AFAM Wen Yang <wen.yang@linux.dev> wrot=
e:
>
> The current implementation only handles C89 style comments (/*... */) in
> the code, and there are false positives for C99 style comments (//...).
>
> This patch fixes this issue.
>
> Signed-off-by: Wen Yang <wen.yang@linux.dev>
> ---
>  scripts/headers_install.sh | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> index 6bbccb43f7e7..41722bcc8668 100755
> --- a/scripts/headers_install.sh
> +++ b/scripts/headers_install.sh
> @@ -44,6 +44,7 @@ scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TM=
PFILE > $OUTFILE
>  # Remove /* ... */ style comments, and find CONFIG_ references in code
>  configs=3D$(sed -e '
>  :comment
> +       s://.*::


This is wrong.


For example, apply the following patch.
CONFIG_FOO is outside the comment line,
but it does not detect it.




diff --git a/include/uapi/linux/kernel.h b/include/uapi/linux/kernel.h
index fadf2db71fe8..b6d50805718e 100644
--- a/include/uapi/linux/kernel.h
+++ b/include/uapi/linux/kernel.h
@@ -5,4 +5,7 @@
 #include <linux/sysinfo.h>
 #include <linux/const.h>

+/*    //  */
+#define FOO CONFIG_FOO
+
 #endif /* _UAPI_LINUX_KERNEL_H */






>         s:/\*[^*][^*]*:/*:
>         s:/\*\*\**\([^/]\):/*\1:
>         t comment
> --
> 2.25.1
>


--=20
Best Regards
Masahiro Yamada

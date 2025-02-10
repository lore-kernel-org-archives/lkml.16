Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927A581741
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739192752; cv=none; b=LBhkeKogaqfuAtWnP1sMsI3LfLIx85zdN46h8QLNYSlXkvIDsUzoYQATUjnEIFcYCzJtlrhtaJMNRt+6BZOpJpcCizHjKBhKU2FRMpugE5ePIPcrrIwOYxAr8BLjDD/lJDDM6F3+jSqqkGzdehooW4AVs6Nq65JAU9DLENIOnBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739192752; c=relaxed/simple;
	bh=OqHOc6hReD4BXYukNP+VyXBAgp3C9i7h5pmEe/8uH7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qEDCberQFuSrHYIxMSh5XCkEqaHKrx72amx0+PHlDIwE6Isba+n3wjq3cvaNLUd8ngSiy/Ozn28xVGVQ+xvIRsxAI3LjZtX30JNQC8lSuJUQdif1sP7jFVl16URk/+izne8v6tYOwvVvkxOrJonLrCLEYQznW5ZMW4wj7Iau16E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkCVITRb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkCVITRb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B750C4CEE6
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739192752;
	bh=OqHOc6hReD4BXYukNP+VyXBAgp3C9i7h5pmEe/8uH7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AkCVITRbgBmBbSydao+afvlJ729kXUBYMnVoaqazgVHjmhMr7k89+REF4VpvpADnU
	 ycBHdOd8KUigNyIUCRzXlg2/H2SRdlb5koVwcIwZzbfWBXAoYdtP7bnE94gTwHzmKM
	 Bd+jgOt3QrscrAwJOFch/jvK7jpHSBbdib8LBAnpNkuoBmGVOjaelKZBTPtMg8k2sG
	 +HToeDpnJ/t2vBh/uYvq3uMTTet4Ro89XxtTrKXL3jQfzp/3uW7Qh4Ea3Lwu41BR52
	 fwtEbYKgvCsU+QK12vOWeSg9FEiiSAKamWR2g8SAoCrLOataV2Qw/NhDWHi60NHQBH
	 Q4xZ7QIlc1PUQ==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5de727f7f05so1884134a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 05:05:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqxG3/tXLPYSPncHyN/vBCJKGjgi+3eMiTI6gM2QByqJ8+uYANF42LdjVPVoL6BsmnjOZFTHWMYUH1N30=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxmmd7bJdHQ9/um9PnUlefoxQq1VRMBKuVekDxjZtMYcwvHeT7
	4tv3mifEUjYtva9BNF7Zqd+LUQjXii31q+pA0BoGJ17Z6XscMEtZxAaGVIP9DGgVocjNMyn1Pai
	GupbBLxSVlvc7fZI6qzrHLqWThuc=
X-Google-Smtp-Source: AGHT+IGd+Uu51J3U4qMofCK8gYEvrqlCr8AMK07q12xDBLQxHkNmnpU/YxNFwM6nMorQhD0DTkxEEBV3YdCii2N7W8A=
X-Received: by 2002:a05:6402:550c:b0:5dc:a44d:36a9 with SMTP id
 4fb4d7f45d1cf-5de45005001mr13843463a12.14.1739192750757; Mon, 10 Feb 2025
 05:05:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D4E490BD8F1E672B+20250210114543.1090146-1-wangyuli@uniontech.com>
In-Reply-To: <D4E490BD8F1E672B+20250210114543.1090146-1-wangyuli@uniontech.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 10 Feb 2025 21:05:37 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7TxBz83un_93rZ-4PmYG=3w6dMsekc35d=FMkRyT+Z9A@mail.gmail.com>
X-Gm-Features: AWEUYZk12FS1ChUi75eusrOTAVVQsfhQICHhr1nTsnJNNBncuidJ8XbhOuBZpwY
Message-ID: <CAAhV-H7TxBz83un_93rZ-4PmYG=3w6dMsekc35d=FMkRyT+Z9A@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: csum: Fix OoB access in IP checksum code for
 negative lengths
To: WangYuli <wangyuli@uniontech.com>
Cc: kernel@xen0n.name, guanwentao@uniontech.com, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, maobibo@loongson.cn, zhanjun@uniontech.com, 
	chenlinxuan@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Mon, Feb 10, 2025 at 7:46=E2=80=AFPM WangYuli <wangyuli@uniontech.com> w=
rote:
>
> Commit 69e3a6aa6be2 ("LoongArch: Add checksum optimization for
> 64-bit system") would cause an undefined shift and an out-of-bounds
> read.
>
> Commit 8bd795fedb84 ("arm64: csum: Fix OoB access in IP checksum
> code for negative lengths") fixes the same issue on ARM64.
>
> Fixes: 69e3a6aa6be2 ("LoongArch: Add checksum optimization for 64-bit sys=
tem")
> Co-developed-by: Wentao Guan <guanwentao@uniontech.com>
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
> ---
>  arch/loongarch/lib/csum.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/lib/csum.c b/arch/loongarch/lib/csum.c
> index a5e84b403c3b..df309ae4045d 100644
> --- a/arch/loongarch/lib/csum.c
> +++ b/arch/loongarch/lib/csum.c
> @@ -25,7 +25,7 @@ unsigned int __no_sanitize_address do_csum(const unsign=
ed char *buff, int len)
>         const u64 *ptr;
>         u64 data, sum64 =3D 0;
>
> -       if (unlikely(len =3D=3D 0))
> +       if (unlikely(len <=3D 0))
>                 return 0;
>
>         offset =3D (unsigned long)buff & 7;
> --
> 2.47.2
>

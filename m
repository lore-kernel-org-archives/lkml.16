Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1926425B66C;
	Mon, 10 Feb 2025 18:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210615; cv=none; b=E125Z5Wp7WQUNSs2v5liAfemxPUwMrIxXPZJNSXnlQDqfu8p1/c0UgqX4BoWoHcKW1HbJ+uLqasv9ERJdbzzTe5hwQB73SHnmRa9mz0buWuKheIxGVRS4IPdQz34JpOp1ByeGar0ilpuXCza3Y0fXzEH0zyO0/6ea7n+k8D28f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210615; c=relaxed/simple;
	bh=Y9CvhGBkqE5kchtDnWlKjun5X2Fr3ixqtyPBWawWBlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VcCw80zloOWqEm2yW35rfZCvWHl89cuf26ANk7teZIhZ1pQtyac+9LUJpO7OQSsMV1MTbViTzeVyrrQj5NDRfCu9KVexeQhl3Y80742rXZXns3cxx2BEeMT8Oxpkcd5+8lemP51PmTtCYvqv7n67nR33oNusgFwqd0vE6ewKRwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fToalVlZ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fToalVlZ"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-308f141518cso11063961fa.2;
        Mon, 10 Feb 2025 10:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739210612; x=1739815412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBLHo62695TAfDbTkgx3lEPh4Gg3lJHpNTfxC+NS4sA=;
        b=fToalVlZhqHh7JILh3Juds7G61koBR7/rqTsHgxKe1GkN9+C6mASHeUkUsGidaUuPR
         zClb9yDsuG86bs2xtqDOkvoUM+qupXu2CF8nUDT3ChMEbrrcQJz1VaC8r+nhd1srlXaW
         Abhp5JM4mAZ0mAAnZ+D0Ssm8tvrTu/TfMuRTvU3jG6mBcknh7cFo09Xst6pyST72u9A+
         guTodGhwKqxH/5l4KCP6sCbGmtJdPJ5RwanrhXlnw1Bw9f6TysV/f8MtnM1LxnR5kpsp
         wMbGv1rKkAGv+JAIqYWomCsWFCKN5Cq5wJ7GIOdilwPYt1d9oq91xMIBk8IHOEMbU+DC
         RaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210612; x=1739815412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBLHo62695TAfDbTkgx3lEPh4Gg3lJHpNTfxC+NS4sA=;
        b=aqZphQ4Ga8KCTbOCXyQj4ie5To1rkBGS3Hhf68x+MuV2PvdgayByedhdY+nHqh4atk
         m2F8A5jLBQ+qJIPF1FLj/T5mGNLaU72LBzbFWxGlnuY6vHFZbPlQKWQT/3hkBc5h4V9G
         YZfs10ShxfqplZHOdrnXROoEuEbcH6L4vn3UY3F6HK3Mrk+C5w/v7f22Vw8jVniy6I6P
         htCHVesMXb93lw8PBfs8clMRxeCbTC2fxMt9Y+zRg3FZEYH5QGmP+3BkxIuuou9VtwL4
         wZfxsyCIAM8izwYOox2ufNNdDSuV5FN0K5QcFUWcfKN0wJ/xsQChEMLsD9xvDSM85j4B
         Ef3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLwJxfsJ+qDJT7efIwHhulyQAA7DFeEbF99heKGEtA6ygQfl7Glr9OpyO0p7P0Jw7Za2WpUX1T6Oic7G+4ToA=@vger.kernel.org, AJvYcCVXWGsDRxnsAP6YenMJDEDX2YB3GLpee++XoqrjKKmDut1MSl3OLtaM4Gu+IWGS/zAkdT7UU0lateDU60g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhTn97+zve2F+vDe008PetRgbUduSjcltXuOF9K4BuyWY09tXi
	l88A9Umac6b7yWEFY+L5nXgz4H2N28mn7Mf1vNtz6ztcEwmdrhtnQZPyuo6VKbrmqOsZl76256o
	OOu23crwYFza76kwH7M2pTlXqZZ0=
X-Gm-Gg: ASbGnctWT77uCB/oPO53sM0XQjfrkKmdAqnxLTDI52IAQoQ3mtmXvpk/k2S7lxCiFHA
	SwLb7ZrzdfcQGD5nzwr8lR8JGRN1fiuNlf2WPWARlhl3xoAKGN3IL1NmPPlY8NKgyXxCItv+8st
	3sBmRedJn3d7I6
X-Google-Smtp-Source: AGHT+IEfNTwaYcTw825LAOFkxCktmowxOemqg4m/4glVdznuZpneN6tK8ExE+puS4IaGG6P/Y7W0Pq2b6NH8HKFwsJI=
X-Received: by 2002:a2e:bea0:0:b0:308:f479:56b3 with SMTP id
 38308e7fff4ca-308f8352fc7mr3599781fa.9.1739210610331; Mon, 10 Feb 2025
 10:03:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-rust-analyzer-bindings-include-v1-0-6cbf420e95b6@gmail.com>
 <20250210-rust-analyzer-bindings-include-v1-2-6cbf420e95b6@gmail.com>
In-Reply-To: <20250210-rust-analyzer-bindings-include-v1-2-6cbf420e95b6@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 10 Feb 2025 13:02:54 -0500
X-Gm-Features: AWEUYZlG2jxh-TA0rxRlTkVHHOTeiSDwax3JSp3gO9KYpuQ4Xzp_Z0ead36hmJQ
Message-ID: <CAJ-ks9mK1uma-xN-=z6Y8OkrJB6=rppcx5njyCGGsz2MkNLr2g@mail.gmail.com>
Subject: Re: [PATCH 2/2] scripts: generate_rust_analyzer.py: add uapi crate
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
	Fiona Behrens <me@kloenk.dev>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Asahi Lina <lina@asahilina.net>
Cc: Boris-Chengbiao Zhou <bobo1239@web.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 12:56=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> Commit 4e1746656839 ("rust: uapi: Add UAPI crate") did not update
> rust-analyzer to include the new crate.
>
> Add the missing definition to improve the developer experience.
>
> Fixes: 4e1746656839 ("rust: uapi: Add UAPI crate")
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 1f573d19cd99..ee4f01ada277 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -105,6 +105,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs):
>          }
>
>      append_crate_with_generated("bindings", ["core"])
> +    append_crate_with_generated("uapi", ["core"])
>      append_crate_with_generated("kernel", ["core", "macros", "build_erro=
r", "bindings"])
>
>      def is_root_crate(build_file, target):
>
> --
> 2.48.1
>

Oops, missing core dependency on uapi.

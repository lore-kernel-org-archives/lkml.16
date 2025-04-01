Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22491519B8;
	Tue,  1 Apr 2025 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512389; cv=pass; b=uHW+NrvF9SSBYk5uyDyogsJj1rbiB8tvUFXCaFQkOQ3HLmMy+FoGEI6dX0xVxU2ldjCHYhCuzh1g9AJJX0vuGikM1wxqiTNNTgwtFEjMZrfrj8TTdnZVIwl+f0LRLb9FjWDq2qdKJru65L2AwXzGfLurdVk+bRy4X3LQ1MwkfPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512389; c=relaxed/simple;
	bh=f6mLAQf6ewULXu0GR7bfELaoivoxdxwjFEP5/+g8KrU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hoUukwRY6SKLDS76HtLA2atAGS+y0VPGhMt7ZpNi5KNMqAKklsr2MGia1a4c2tjfAg3gIPQNisG+icMJFrGXJQGg+29SQFRIZot593pb5WjiUW3JTK9iHJqPjmppEXtJktLPBMfqXiysdxX1L37cR4UITOjpKCG+WV3hAt1A0+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Vc0m+rgi; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Vc0m+rgi"
ARC-Seal: i=1; a=rsa-sha256; t=1743512357; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GBtYm76tIuinjoE7owRCKgat8CjJ44vGLLpu70elbdQfmwNC/MEGhAh8Pl/zcw5RW7ZeEIlVEdrSsW91OzwLhhn0n9AY24WKps0LPG0eWGUuGIlCgSZ7980ObhPddqjotF7m4PkRosMiaESTtyYP9j25V5K2wAF5MeNbMWN7hvs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743512357; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eVppIKvmTMpG1wI2U0Pa+9csa+B4U5fgzTpOMWMirjY=; 
	b=MyF/VXeb1iPpnlJF0rRVMhk/yjVw1tnVj/ItwKgZMmbWJyZrhkGCU2U9B2JL+ODRjOYewT9A7+4UZiRP0t85+T4erwxbWZhcOpyIdaqF1g/SUKe0V2qfXfUoF26JGihZLbrZs4sS1Ow7eYamPD1YL60a7eHZ4QP2GqABleRyLEE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743512357;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=eVppIKvmTMpG1wI2U0Pa+9csa+B4U5fgzTpOMWMirjY=;
	b=Vc0m+rgi44hW3Wp47u+sygY5LrN6TY2w+C+S/4k6kLSBtjkYNDaTI5KvmN1Ku3QY
	rsBNYOvyPh4L59a3oyFBWhE4coD00NfLZJLfzmysZTtpArTWva3Pr/hS+9F7M4IGUZE
	U/bzLuw93/whRo1xeXT8RT3zyy/GxYX8l33vm2mk=
Received: by mx.zohomail.com with SMTPS id 1743512339761844.7601541518382;
	Tue, 1 Apr 2025 05:58:59 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v5 07/13] scripts: generate_rust_analyzer.py: avoid
 optional arguments
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-7-385e7f1e1e23@gmail.com>
Date: Tue, 1 Apr 2025 09:58:40 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris-Chengbiao Zhou <bobo1239@web.de>,
 Kees Cook <kees@kernel.org>,
 Fiona Behrens <me@kloenk.dev>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Lukas Wirth <lukas.wirth@ferrous-systems.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CCB6D89D-D513-4514-8992-AC37313F5588@collabora.com>
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com>
 <20250325-rust-analyzer-host-v5-7-385e7f1e1e23@gmail.com>
To: Tamir Duberstein <tamird@gmail.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-ZohoMailClient: External

Hi Tamir,

This patch looks good to me but,

> On 25 Mar 2025, at 17:06, Tamir Duberstein <tamird@gmail.com> wrote:
>=20
> Make all arguments required to reduce the probability of incorrect
> implicit behavior. Use keyword arguments for clarity.
>=20
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> scripts/generate_rust_analyzer.py | 90 =
+++++++++++++++++++++++++++------------
> 1 file changed, 62 insertions(+), 28 deletions(-)
>=20
> diff --git a/scripts/generate_rust_analyzer.py =
b/scripts/generate_rust_analyzer.py
> index b37d8345486a..badcef4126cf 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -69,9 +69,10 @@ def generate_crates(
>     def build_crate(
>         display_name: str,
>         root_module: pathlib.Path,
> +        *,
>         deps: List[str],
> -        cfg: List[str] =3D [],
> -        is_workspace_member: bool =3D True,
> +        cfg: List[str],
> +        is_workspace_member: bool,
>     ) -> Crate:
>         return {
>             "display_name": display_name,
> @@ -92,21 +93,34 @@ def generate_crates(
>     def append_crate(
>         display_name: str,
>         root_module: pathlib.Path,
> +        *,
>         deps: List[str],
> -        cfg: List[str] =3D [],
> -        is_workspace_member: bool =3D True,
> +        cfg: List[str],
>     ) -> None:
>         register_crate(
> -            build_crate(display_name, root_module, deps, cfg, =
is_workspace_member)
> +            build_crate(
> +                display_name,
> +                root_module,
> +                deps=3Ddeps,
> +                cfg=3Dcfg,
> +                is_workspace_member=3DTrue,
> +            )
>         )
>=20
>     def append_proc_macro_crate(
>         display_name: str,
>         root_module: pathlib.Path,
> +        *,
>         deps: List[str],
> -        cfg: List[str] =3D [],
> +        cfg: List[str],
>     ) -> None:
> -        crate =3D build_crate(display_name, root_module, deps, cfg)
> +        crate =3D build_crate(
> +            display_name,
> +            root_module,
> +            deps=3Ddeps,
> +            cfg=3Dcfg,
> +            is_workspace_member=3DTrue,
> +        )
>         proc_macro_dylib_name =3D (
>             subprocess.check_output(
>                 [
> @@ -133,66 +147,75 @@ def generate_crates(
>=20
>     def append_sysroot_crate(
>         display_name: str,
> +        *,
>         deps: List[str],
> -        cfg: List[str] =3D [],
> +        cfg: List[str],
>     ) -> None:
> -        append_crate(
> -            display_name,
> -            sysroot_src / display_name / "src" / "lib.rs",
> -            deps,
> -            cfg,
> -            is_workspace_member=3DFalse,
> +        register_crate(
> +            build_crate(
> +                display_name,
> +                sysroot_src / display_name / "src" / "lib.rs",
> +                deps=3Ddeps,
> +                cfg=3Dcfg,
> +                is_workspace_member=3DFalse,
> +            )
>         )

Why the change from append to register+build here? Maybe this change
should be in another patch?

=E2=80=94 Daniel=

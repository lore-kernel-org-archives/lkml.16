Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6DC3234;
	Mon, 31 Mar 2025 16:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439644; cv=pass; b=hFyhwFAtlxJp9eLBfzZwZ3V1yB/v2hPLEIrSzSj+KOB86LShQgQQfckT/h/868wBVQ5u/JUdNxTrKhWfRQPhIaODnk/SEdkfilUhxEQNJ6xI3yCymXpFrpWal3L2ZFuf9HIeQK+dNO+LbOE8ZV2Wb3PlPrjAh67l48ztoyulJA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439644; c=relaxed/simple;
	bh=0vlUCrk0+5RCAX0Hlm6MMaWOEWWn3iJwSKKyxtsb69M=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=RJ2hmWiav3O0q1+sxjgeLWgLkLrKHDDAHSWeuEXQf8pfVcEbnEitOH2OAAWT7I7wvFDTyMDAW+J1+19pTnv65ZbviAZKEn4NajA7y/DYFUwJBhv1H2gFnINg5pWEyqQa4wIO3V3B8mgrbrviPszOInJRqAG/hpFRC/O9Svln+SY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=jWgKUsa0; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="jWgKUsa0"
ARC-Seal: i=1; a=rsa-sha256; t=1743439606; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QD7mAiUTvUL4jNnp9uEif+fQ5An18gxisD4YqnDAFEY2gmkLOG6ftvht+AN3zNTMEpTyQkFzT2yLQ6gzr7qV+ye4z+uGOd+hcqYr97UHxVJebvKr+3PWAWzTwAkRVlQ2l2Ds4mMjnVnNdwDrcYJ7xyr17wxb1s6fEXK4W+Rtf4g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743439606; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=F+Ki+s1FhlzIig2fQE6VQlydduQOlAiMcuRkAel+8Jw=; 
	b=H2D3pboqyyEvyDLMw+hfm3bFZc6qSDqZ05FLiUcbwW6qjElHIjs/2VwhYYXBDtFoTZCs4DXev1FyLYmVbrIz9QNLSfNPr7aZIavX3d5U75RNhEAA0i0qbfCpYQHf3kBom5g6TXJtHraOATo0SayjCLob7vq7/FGYWz+m4onlKf0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743439606;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=F+Ki+s1FhlzIig2fQE6VQlydduQOlAiMcuRkAel+8Jw=;
	b=jWgKUsa0p6R+JVR7Yzgf+pO/gH1I2G6011ECzfQMAmcOF/OwXrv4DQ7KOFInTsIX
	pGpNU1iaywSwNtBGiSZVq09oVqhTh6QEakBuwZM5CexVhG0Ju89okGzkl2t5PcK4Z7o
	mXqKU2tLjDAsh6t8/3kmrQETSkC1SEOjIUMbWDjU=
Received: by mx.zohomail.com with SMTPS id 1743439604019510.32565357923045;
	Mon, 31 Mar 2025 09:46:44 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v5 05/13] scripts: generate_rust_analyzer.py: drop
 `"is_proc_macro": false`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-5-385e7f1e1e23@gmail.com>
Date: Mon, 31 Mar 2025 13:46:27 -0300
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
Message-Id: <C35C7A09-A25B-445B-8C35-D75FB2F6FBDE@collabora.com>
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com>
 <20250325-rust-analyzer-host-v5-5-385e7f1e1e23@gmail.com>
To: Tamir Duberstein <tamird@gmail.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-ZohoMailClient: External

Hi Tamir

> On 25 Mar 2025, at 17:06, Tamir Duberstein <tamird@gmail.com> wrote:
>=20
> Add a dedicated `append_proc_macro_crate` function to reduce =
overloading
> in `append_crate`. This has the effect of removing `"is_proc_macro":
> false` from the output; this field is interpreted as false if =
absent[1]
> so this doesn't change the behavior of rust-analyzer.
>=20
> Link: =
https://github.com/rust-lang/rust-analyzer/blob/8d01570b5e812a49daa1f08404=
269f6ea5dd73a1/crates/project-model/src/project_json.rs#L372-L373 [1]
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> scripts/generate_rust_analyzer.py | 55 =
+++++++++++++++++++++++++++------------
> 1 file changed, 39 insertions(+), 16 deletions(-)
>=20
> diff --git a/scripts/generate_rust_analyzer.py =
b/scripts/generate_rust_analyzer.py
> index 71e6038964f6..80eb21c0d082 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -41,13 +41,11 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs):
>         deps,
>         cfg=3D[],
>         is_workspace_member=3DTrue,
> -        is_proc_macro=3DFalse,
>     ):
> -        crate =3D {
> +        return {
>             "display_name": display_name,
>             "root_module": str(root_module),
>             "is_workspace_member": is_workspace_member,
> -            "is_proc_macro": is_proc_macro,
>             "deps": [{"crate": crates_indexes[dep], "name": dep} for =
dep in deps],
>             "cfg": cfg,
>             "edition": "2021",
> @@ -55,13 +53,6 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs):
>                 "RUST_MODFILE": "This is only for rust-analyzer"
>             }
>         }
> -        if is_proc_macro:
> -            proc_macro_dylib_name =3D subprocess.check_output(
> -                [os.environ["RUSTC"], "--print", "file-names", =
"--crate-name", display_name, "--crate-type", "proc-macro", "-"],
> -                stdin=3Dsubprocess.DEVNULL,
> -            ).decode('utf-8').strip()
> -            crate["proc_macro_dylib_path"] =3D =
f"{objtree}/rust/{proc_macro_dylib_name}"
> -        return crate
>=20
>     def register_crate(crate):
>         crates_indexes[crate["display_name"]] =3D len(crates)
> @@ -73,14 +64,48 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs):
>         deps,
>         cfg=3D[],
>         is_workspace_member=3DTrue,
> -        is_proc_macro=3DFalse,
>     ):
>         register_crate(
>             build_crate(
> -                display_name, root_module, deps, cfg, =
is_workspace_member, is_proc_macro
> +                display_name,
> +                root_module,
> +                deps,
> +                cfg,
> +                is_workspace_member,
>             )
>         )
>=20
> +    def append_proc_macro_crate(
> +        display_name,
> +        root_module,
> +        deps,
> +        cfg=3D[],
> +    ):
> +        crate =3D build_crate(display_name, root_module, deps, cfg)
> +        proc_macro_dylib_name =3D (
> +            subprocess.check_output(
> +                [
> +                    os.environ["RUSTC"],
> +                    "--print",
> +                    "file-names",
> +                    "--crate-name",
> +                    display_name,
> +                    "--crate-type",
> +                    "proc-macro",
> +                    "-",
> +                ],
> +                stdin=3Dsubprocess.DEVNULL,
> +            )
> +            .decode("utf-8")
> +            .strip()
> +        )
> +        proc_macro_crate =3D {
> +            **crate,
> +            "is_proc_macro": True,
> +            "proc_macro_dylib_path": =
f"{objtree}/rust/{proc_macro_dylib_name}",
> +        }
> +        register_crate(proc_macro_crate)
> +
>     def append_sysroot_crate(
>         display_name,
>         deps,
> @@ -108,11 +133,10 @@ def generate_crates(srctree, objtree, =
sysroot_src, external_src, cfgs):
>         [],
>     )
>=20
> -    append_crate(
> +    append_proc_macro_crate(
>         "macros",
>         srctree / "rust" / "macros" / "lib.rs",
>         ["std", "proc_macro"],
> -        is_proc_macro=3DTrue,
>     )
>=20
>     append_crate(
> @@ -121,12 +145,11 @@ def generate_crates(srctree, objtree, =
sysroot_src, external_src, cfgs):
>         ["core", "compiler_builtins"],
>     )
>=20
> -    append_crate(
> +    append_proc_macro_crate(
>         "pin_init_internal",
>         srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
>         [],
>         cfg=3D["kernel"],
> -        is_proc_macro=3DTrue,
>     )
>=20
>     append_crate(
>=20
> --=20
> 2.49.0
>=20
>=20

In terms of testing, a diff shows that the only change to the output is =
the removal of `is_proc_macro: false`
as indicated by the commit message.

This looks good to me.

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

=E2=80=94 Daniel


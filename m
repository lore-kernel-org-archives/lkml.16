Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169B2130A54;
	Mon, 31 Mar 2025 17:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743440990; cv=pass; b=oZ4QZaQ0nCnSIPmgMTo4HmFGnP6YQwxIRF9joXJdETUBKoYLHEl5ik3M8Q8n4kRIM795UrqcdTo5sbfccj/b1aDIwy/HDGatfs2kLuLlc5TcD/4mq/rMB0c/7lMJ2XFL1aGSlUhk15O9QWUwcNJFFSPcVLNWvIw1zN4IxeSE5nI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743440990; c=relaxed/simple;
	bh=XY4Lz8nmOhMCJfx5G9//aIEqVmxe+7WPFPY77en7ljQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ebp3QI+KGcGXPu/UrmmsQ/Yn0TJFhloD6HAJd78nin9wJLKKZZ4EfkGZjOb7zfX9tmat7SW/89zok5MbM/y2XNIF2ts+Y+/IAs0ofvejHdQhy7256cTQ08vwodD3Vg9QGDYDVDiwqk7h53QOQYlwciY8Hu8Id55ydMpDWqC39EY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=WRvu1IZs; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="WRvu1IZs"
ARC-Seal: i=1; a=rsa-sha256; t=1743440961; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IZNFBj8lLYb431hC4EdDVb+eCljK5x9WopO21wV+b2w9WICI/o8Tit+PoipHWqIAxlwUBv8+eUOFdBu+C7PsHUt9ytcFLcmW7jPF8AW/S6r6/pYADeQE/OZX0Qlw/rpuHC+h7CB/EBJMuqQ3ntAIvxa6nQv4iNxpgVCUoFHKFUQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743440961; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eRBZ3dXnGZXHdDQufzHIdL1aCFdXcn3+mx27ydvwC+w=; 
	b=QkZEsL+5X5dn2Aq1x49IvYcyeHvLd2tP4prnmmgw0kt3tN0G43vvFZkiM9UTWQi/jDmFo1Pg/Ykb6UgrWbOBLeLsLDz853aG7SpHMQ5+yM70vKKhx5DL7HeivzFBEJVI5EeuBCJnmGMRP+4xaFZkRtq7/v3+5Lols79MlzAIqe0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743440961;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=eRBZ3dXnGZXHdDQufzHIdL1aCFdXcn3+mx27ydvwC+w=;
	b=WRvu1IZsZEnlRHbV+H1uw8jZgVGDqvH/Usx/K60ryHAYDq7jzoJsFjz2bZ835ZHk
	jTlnkNfvrqO9OI/+IVmX/Wc0XoFw/91Gwolg0Hm8oraEM8Z0dBgTom747d17FLndUHX
	kRvnEibtXFfnjse5qFKYfqvbXduM/EbXVCGT7F7g=
Received: by mx.zohomail.com with SMTPS id 1743440958770263.33762723850737;
	Mon, 31 Mar 2025 10:09:18 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v5 06/13] scripts: generate_rust_analyzer.py: add type
 hints
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-6-385e7f1e1e23@gmail.com>
Date: Mon, 31 Mar 2025 14:09:02 -0300
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
Message-Id: <1B186177-16B9-4D2D-9603-F713F0FE9BEC@collabora.com>
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com>
 <20250325-rust-analyzer-host-v5-6-385e7f1e1e23@gmail.com>
To: Tamir Duberstein <tamird@gmail.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-ZohoMailClient: External

Hi Tamir,

[snip]

>     rust_project =3D {
> -        "crates": generate_crates(args.srctree, args.objtree, =
args.sysroot_src, args.exttree, args.cfgs),
> +        "crates": generate_crates(
> +            args.srctree,
> +            args.objtree,
> +            args.sysroot_src,
> +            args.exttree,
> +            defaultdict(
> +                list,
> +                {
> +                    crate: vals.lstrip("--cfg").split()
> +                    for crate, vals in map(lambda cfg: cfg.split("=3D",=
 1), args.cfgs)
> +                },
> +            ),
> +        ),
>         "sysroot": str(args.sysroot),
>     }
>=20
>=20
> --=20
> 2.49.0
>=20

I found `args_crates_cfgs()` a lot easier to understand, but I guess =
this is a
matter of taste. I also find that this `defaultdict()` call slightly =
pollutes
the surrounding code, but again, that might be just me.

Regardless, running `mypy` still passes, and there is no change to the =
output.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

=E2=80=94 Daniel=

Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B381E0E00
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747683329; cv=none; b=WiRiKszRx5m4PmXa01SOV0yF5YQBktkrcQgwU0UIuF7djjEUXyX8qyUgeQqYWLv1icM8OAA7SgwpQhCITZ8txp2kukaCbUPERi849pLJsB99cB21n/vW0yqzcaA2Cv9Hjimg338X0zBWB6flUtZdFro7cIRc1kvbUIp6ggmjiuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747683329; c=relaxed/simple;
	bh=dNKjosJLueeqCShW3qsGQWVuvaNE5ktvOIjXBgJjtaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzsAh/KEm0eM3QW/ebROvXk9Lm8eF73kfqO1aTZoUpovuA5EonjlFEnabDa4tcRq6HnLELoVoiayu3JavCq/ill6OT4PRhdu05k7dvqpJsKcFTqbWfTp9kw8r/0chbnsal9if22IVVkN1Ydb7aXcJudQqL6UggSjfbQIkrrq28E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pxkBk1IV; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pxkBk1IV"
Date: Mon, 19 May 2025 21:35:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747683322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n+wW+OjTf7KzE0AEC1/HTE1v3dpfIn3575ctYuyIKZg=;
	b=pxkBk1IVqhFPQ8DCK4cE32LRKaCYMrdxTzbtiXA9K4Zt9LzNRCLKTEY1P2DrFS6NxkuQMW
	5hR8Szekm9tutnhrOqoKcf/d91wa9OKJyDmM2J/PSPaQcGsrDs8S5VJybNtUUOTQMjSWxl
	rjqNP6Gn+T5olB5JE3jdiX6gQG4CZ4s=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Subject: Re: [PATCH] kbuild: move kbuild syntax processing to
 scripts/Makefile.build
Message-ID: <20250519-impartial-puzzling-limpet-73dff9@bergen>
References: <20250514054635.93577-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UpJDNWE8uQy8XWDr"
Content-Disposition: inline
In-Reply-To: <20250514054635.93577-1-masahiroy@kernel.org>
X-Migadu-Flow: FLOW_OUT


--UpJDNWE8uQy8XWDr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 02:46:33PM +0900, Masahiro Yamada wrote:
> scripts/Makefile.lib is included by the following Makefiles:
>=20
>   scripts/Makefile.build
>   scripts/Makefile.modfinal
>   scripts/Makefile.package
>   scripts/Makefile.vmlinux
>   scripts/Makefile.vmlinux_o
>=20
> However, the last four do not need to process Kbuild syntax such as
> obj-*, lib-*, subdir-*, etc.
>=20
> Move the relevant code to scripts/Makefile.build.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
>  scripts/Makefile.build | 84 ++++++++++++++++++++++++++++++++++++++++++
>  scripts/Makefile.lib   | 84 ------------------------------------------
>  2 files changed, 84 insertions(+), 84 deletions(-)
>=20

Reviewed-by: Nicolas Schier <nicolas.schier@linux.dev>

--UpJDNWE8uQy8XWDr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmgrh/cACgkQB1IKcBYm
Emm2Og/9FUHs3iPOJkjwrIajPAj063lJ1K4mc/+wqOS0NAaUYolZusOiLv5zf2Y5
Q0C9JQlGbq1k5GK9wiXQSLaTjrWWA52ZATbviFMomozkvCwNF3nCyirFl3PVaEHB
IW/WAI7w6gg54px9whJlnZMf4P6cgfuqJXByO1QuGgyeHgagzkAzwtkIwjPa6otI
3Xw9qyC7h2xxIWuGCCIbqIuVpB49cETOHAwpvctoDNDKfVM3O7tijTyFD8MZ5yRU
QhX/1Uxi9xH+gzHXBLWjWt7OZherF22rFJcABbfiLTg6+FVMKNTfyhBqvk2gnUSI
KANpixAJnVw2HsGJLC3i+QatSNvnEFOZd/w53uJi11qWDwZPU3RzLEBAMYq+5vhi
pQjVfM5C2xwK6MC+zgM8k5xxbpHsqn+E5rLONpmZEdlC2B4gNT7maCaYsv19pDTq
Wpk+3LLhYPnQ8MG3qFNaupiQGTYzahpCmrUna4IUTQXh/8fvepUYBPxMte1WyNTT
jo7oei6NU2/qI4VUVh2zUwnfs3iDApHonpf3ORO91XDVfhj4kCFFgqKcFDArXMrD
eYT6FKkCqrgsNHamWAQtlKjWRp6KSQULW5Esh/mWS5j4RVFKEC8pQdxDf5vGik5O
noPeP6nWZOTEp9rcSWWNuurNyEmsWtmA2nA7g5Obpk1gf3u4W+s=
=/0lX
-----END PGP SIGNATURE-----

--UpJDNWE8uQy8XWDr--

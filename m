Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D0418E1F;
	Wed,  4 Jun 2025 14:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749049147; cv=none; b=GUzlIIrc/wWrtlYeThLx0jYouPcFhCtjFiDTfhQ5wA6NKcBZe/S3RMWcVdzoGDhq4BsTQ15JTR9lNFe+YjUJHCQZvtGnxmqzYY2bxV01xXmlbNBDOZ8AmoBunuD6rgDXGEBUx63mSaPh2/a3rZzp+97LD0BUsW/b6E6UC2eQTxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749049147; c=relaxed/simple;
	bh=dPl10L8kn0KdFlwUWNR6maayAHjXxs+RSkZaDg75lMU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CopuRCrV7AXJdhpY2bSOwOdoltyjYHWFFwF5wq3VGhp4gXQh/cIShBh234Zfc3z+JZ+cbFMKgiXUOMFmIGNBwqgMUlspPsci7fzJHhJS8Mwv+iolbClGjZwcl3livCMZTP21BazQ/uCIWek1uxnU//yylasf2Lxu7IwwitUKPKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQnN6HOb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQnN6HOb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA8EC4CEED;
	Wed,  4 Jun 2025 14:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749049147;
	bh=dPl10L8kn0KdFlwUWNR6maayAHjXxs+RSkZaDg75lMU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gQnN6HOblS//78nNeQQBP3lFI6vXMvrS4+pE5WczwofY6UFZe39yIvsspdCza/7cN
	 IW9kDcryp4wZjGrUxPyxAF8hdeqRAL9P+z9KIZSAMs908UurrI/zKIfKFqqwsK+lLt
	 /Fz6IYDRLEgNbYMT9go+vyghqFvkfIUSGerD9Uz7q+pCeouq68GD5J2BiptqSOGzI1
	 zjWeuoaKGGcEbmsT/Q7WxQOpheEsAVTmQinpGfjFnUHN4Pd0XHas3fDDFNMhSmxI33
	 FUaqcPjdzW8acuhjCsOzQxUwys1hRvlxiG+SJFGXI/2IVzmsBIYs38RDqHtTh7ljK7
	 ZA0OLYs79s2Ew==
Date: Wed, 4 Jun 2025 16:59:02 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "
 =?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@collabora.com>
Subject: Re: [PATCH v2 3/3] docs: CSS: make cross-reference links more
 evident
Message-ID: <20250604165902.08265fe7@sal.lan>
In-Reply-To: <20250604143645.78367-4-corbet@lwn.net>
References: <20250604143645.78367-1-corbet@lwn.net>
	<20250604143645.78367-4-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Wed,  4 Jun 2025 08:36:45 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> The Sphinx Alabaster theme uses border-bottom to mark reference links; the
> result does not render correctly (the underline is missing) in some brows=
er
> configurations.  Switch to using the standard text-underline property, and
> use text-underline-offset to place that underline below any underscores in
> the underlined text.
>=20
> Suggested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

While I didn't test, it looks good enough for me.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/sphinx-static/custom.css | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphin=
x-static/custom.css
> index f4285417c71a..c9991566f914 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -136,3 +136,10 @@ div.language-selection:hover ul {
>  div.language-selection ul li:hover {
>      background: #dddddd;
>  }
> +
> +/* Make xrefs more universally visible */
> +a.reference, a.reference:hover {
> +    border-bottom: none;
> +    text-decoration: underline;
> +    text-underline-offset: 0.3em;
> +}

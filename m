Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C10C258A;
	Fri, 30 May 2025 16:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748622519; cv=none; b=VuPmGK7sAMLsXinSMiQntzvrHFZKBsnynbjK4Ed3kjYVN0nr/cqJWFtmllbolpei0VUUNU7ZfsVDhje+15Ehdf6Crrq5jkVs4NtgpbNfRBm5cLfQiDC01F0sxsfY22tcx5L5EyDrdUrhphsTFJgfPw0sfc+2zrsa6HcVk8rKRXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748622519; c=relaxed/simple;
	bh=3w11Gx6y9v0+7Z7wkaCwsdezYsyPjPgQjYYgblMoswE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZp3rgLr1JfDJQ0NE9Rv/Lpg7DzSTS48sQ3le0shTxNOAdtzqO0PkLI/R6QoCQ7zy+qM3LlK9qe3YqE0b75fNUSs2f3A0DlknTZIAzgCxfqnbGlRlX5BVUbytyyezzgWWHqRg/Ed2PIpLJgz7H0B6IVPAOxf/h7s/Kx6mE9KzhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmA2yna1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmA2yna1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEA3C4CEE9;
	Fri, 30 May 2025 16:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748622518;
	bh=3w11Gx6y9v0+7Z7wkaCwsdezYsyPjPgQjYYgblMoswE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FmA2yna1gR8Ew0K1+LahkMj78ZXO3zYVUdv4Y/Vm1mMEd/+BRkqVRN/xryXr5nqRe
	 rDnWQsNAlhCgvjhlMMvMLw0ZDX57QmctMORg0m07U2dsros+TLfg51ouUaHQ2v9Fbh
	 Zk+Oeip7grTwJrJ8zTBJOSykBcVzXM+t0vkmr0+DKfKlgZ1pH0EFIC1yJfn4/18TaS
	 7vh4+r9XyTcZmL4jfdb7ufjIJG04wV29wVc3seG0Kb3N4Ea/0KgKO8edTBCkTtHUG7
	 cDJMlrifDQRPajUQyW042VM7mD2BPlOm4mQmO3a/zct9suwp1KtfdLEklQ1TRDRzzk
	 Iw01thRvz8raQ==
Date: Fri, 30 May 2025 17:28:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/23] dt-bindings: clock: Add RPMI clock service
 message proxy bindings
Message-ID: <20250530-stark-maximum-2306978237db@spud>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-9-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OK/BrqYcriOFqq3E"
Content-Disposition: inline
In-Reply-To: <20250525084710.1665648-9-apatel@ventanamicro.com>


--OK/BrqYcriOFqq3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 25, 2025 at 02:16:55PM +0530, Anup Patel wrote:
> +  riscv,sbi-mpxy-channel-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The SBI MPXY channel id to be used for providing RPMI access to
> +      the supervisor software.

Sorry for the delay in reviewing this series, wanted to talk to some
folks at work before doing so. Overall these bindings all look pretty
good to me. I don't think the description on this property here is
particularly great, I didn't follow what it was meant to be used for
immediately. But I don't have anything meaningfully better to
suggest nor do I think that anyone actually writing the dts for a
platform using this binding will struggle to understand it.

--OK/BrqYcriOFqq3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDncrwAKCRB4tDGHoIJi
0tEBAP4gJSJ/F4Ip4dRY+DKhJbIbOyFcYw/OQ8JRh5hAWfoGHwEAkbFUp8dZ9yHN
D6aqOU4gwU5hRMBlh1tZavRk5xBgpAw=
=RBEX
-----END PGP SIGNATURE-----

--OK/BrqYcriOFqq3E--

Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885B81F4607
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270176; cv=none; b=Kj5zAKVigG/gKKNqy1UQRdBluEhbMT35v5NyQwZ3Xh3+eaYmUdo3Pv7jQQGEzh8+wfvGfJ8PPtiT53eZy4DKguxjBv39v1DdlvWUnFW16/mURYczKwUl+O5crTwOp9GLNiCUC5qCOoBBMD8s66FiR3NzI1UiW7D1SrEisD1fgz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270176; c=relaxed/simple;
	bh=C89/EB8mmtsdyrj/MjwziHxzIoUNyfaZgxVWRxruzCU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Ocjq3BJ/AU507fRl4xhOXCOAPBpOvEr9AL2k5IgYPV9XfhSGr4jUBjIthWiyyO9JT1eV0EnjixrrfTUgY+/cAd5eTJJAxAXClna6qEobo+poNE10nYWFiJouu95Fm+RDPvVuX1xe10Oge8GSemcxwvIIuhvW8EGPSRcD3huXldY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=C59jdT1R; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="C59jdT1R"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1739270170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CcTbLEBt8Y8NL7Kz0HYgBsKXaJfzSyxWtZz03umu0us=;
	b=C59jdT1Rz5cXS3dKHVt50NdxmADlu7Jr7oR5TXqWBvD9eotDotwsX6qx5acCpRaKspa4Kl
	Wu/B42fkg6rZ2ksFucijVxaK3HJiAx8WPt1czeqIvpkMHEVxT4tT4TTvxI0TclXsg9i1ux
	E7Qhli9KsHW9z3ImUGE5HaoW7CpnLsWDZ26wvTdIBYZpLWJ6JaLGk7CpSATbMTn4/klTKC
	5QF92Es4Sr05iaT36VoIJyKMnd3RjZTJkhnEP5yxTP7PvWqeExfP966m5A6CtNi876j6Jj
	IHw1mwLE2EdhFGvNsj48OynBuHxVEcvTwBcYlGWZYxPdLOKEXfleySraBMVNAA==
Content-Type: multipart/signed;
 boundary=5ee4ceb31c3782666c51f1eeeb5c1812fd7b0e7a1f16d9d041a97c2c76ff;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Tue, 11 Feb 2025 11:36:00 +0100
Message-Id: <D7PJTD3PSP78.27N2S94J2CNZG@cknow.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <andre.draszik@linaro.org>, <kernel-team@android.com>,
 <willmcvicker@google.com>, <peter.griffin@linaro.org>,
 <daniel.lezcano@linaro.org>, <vincent.guittot@linaro.org>,
 <ulf.hansson@linaro.org>, <arnd@arndb.de>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v8 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Jassi Brar"
 <jassisinghbrar@gmail.com>
References: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
 <20250211-gs101-acpm-v8-1-01d01f522da6@linaro.org>
In-Reply-To: <20250211-gs101-acpm-v8-1-01d01f522da6@linaro.org>
X-Migadu-Flow: FLOW_OUT

--5ee4ceb31c3782666c51f1eeeb5c1812fd7b0e7a1f16d9d041a97c2c76ff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Feb 11, 2025 at 9:52 AM CET, Tudor Ambarus wrote:
> Add bindings for the Samsung Exynos ACPM mailbox protocol.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 50 ++++++++++++++++=
++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm=
-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ip=
c.yaml
> new file mode 100644
> index 000000000000..982cb8d62011
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)

Shouldn't this be ``(GPL-2.0-only OR BSD-2-Clause)`` ?

AFAIK it's the recommended form since SPDX 3.0:
https://spdx.dev/license-list-3-0-released/

Cheers,
  Diederik

--5ee4ceb31c3782666c51f1eeeb5c1812fd7b0e7a1f16d9d041a97c2c76ff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ6soEwAKCRDXblvOeH7b
bv7bAP96aaDz5VKPTEX57iUB5lisLvy1Dhsnq/V3RPglNv0N+gEAhyLe6ZIqyYQk
/7mKqroOKZdEWb4BTUOWoix6bNhI5w0=
=Mg55
-----END PGP SIGNATURE-----

--5ee4ceb31c3782666c51f1eeeb5c1812fd7b0e7a1f16d9d041a97c2c76ff--

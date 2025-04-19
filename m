Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C47518C06
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 09:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745056141; cv=none; b=hqaxzvQsrkN5tLSwr2mQGOvr89EymJq+mvdpTh7Gxs7DAAVe+riL3F6RzP904YN4yBjlG2hpXhy7FMo9c+pbbdMpNl98ZmNb/2i1g5GcmR/QFjKNtnJdb5fCDSv0TI9pQfWPglWkTrWjPsvLxj/4IRqG6P+BIcZjYWQxKLrc/as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745056141; c=relaxed/simple;
	bh=zklzViCR78rtGWWpSQ+SH1wiYY08pHKOOyED16FNUtY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=AabYb/ttzAyKdrALK/HgWEgar+4PGMtX69WRZcuSHCZ57Kkp3MU4Ls/rL/oxPwIQZbZrDvdwwfl0tHC2VGCQZurQBM/UWPeqmwV0L5JCSUdM2zYUhVw+iUJ5OoE0EK6EEWmvEvJ5cC7a1K40bWpl0jklCgMTqPRqLVtNBEG43yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=XKnDJwgw; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="XKnDJwgw"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1745056135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WYcIiX7im0SwEgUBjW9RpMKMf9b+aamLPfpMOC5NliI=;
	b=XKnDJwgwVh+2AJkayQ0NeH2Kvg8qAbd1tnYvcMl+DKXHqiczpSpLHXSIzPBsxU/16t7iF4
	hlYG9UTJWjXQNnUnkl64Qgc/oFfw/T8qtw6j0f9K6IvZmc7UEmQIKrmtpBHirzgLvOQPh0
	J3ZWdIczd+6ufV4zdSA/E+qA1OtlNVgCdyNgn29IB8XuTI5EEc9vqkSezr7poIUqsoBwmV
	MxMirsfelUlnq6h9recCZVOrPLxjseiwhEtSocWqQ96RR6A5TKgXHBsJoiTs3TwP6IiEf0
	CejUseD8cefGgezfsiE2cTsZxrvlhitP1egzdsgPVf3AdOdTHVAn/I5JnviHXA==
Content-Type: multipart/signed;
 boundary=787e13d5ada3b08197d931c1726e36235e1092534fb802965a37df9b17c0;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 19 Apr 2025 11:48:46 +0200
Message-Id: <D9AIRPBIHXAO.3SDHEJW99DP4X@cknow.org>
Subject: Re: [PATCH v3 00/10] Tegra Security Engine driver improvements
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Herbert Xu" <herbert@gondor.apana.org.au>
Cc: "Akhil R" <akhilrajeev@nvidia.com>, <davem@davemloft.net>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <linux-crypto@vger.kernel.org>, <linux-tegra@vger.kernel.org>, "Dragan
 Simic" <dsimic@manjaro.org>, "Corentin Labbe" <clabbe@baylibre.com>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250224091610.49683-1-akhilrajeev@nvidia.com>
 <D99QMGBHHYJO.1D7D0ZXJLBG9Y@cknow.org>
 <aAMhYaq0Ze-z6E8q@gondor.apana.org.au>
In-Reply-To: <aAMhYaq0Ze-z6E8q@gondor.apana.org.au>
X-Migadu-Flow: FLOW_OUT

--787e13d5ada3b08197d931c1726e36235e1092534fb802965a37df9b17c0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Apr 19, 2025 at 6:06 AM CEST, Herbert Xu wrote:
> On Fri, Apr 18, 2025 at 01:45:23PM +0200, Diederik de Haas wrote:
>>=20
>> Earlier today I tried to boot my 6.15-rc1 kernel on my RockPro64
>> (rk3399) and that didn't go too well:
>
> This should be fixed in the latest mainline kernel where hash
> request chaining has been disabled.

Excellent, thanks for letting me know.
b2e689baf220 ("crypto: ahash - Disable request chaining")

Cheers,
  Diederik

--787e13d5ada3b08197d931c1726e36235e1092534fb802965a37df9b17c0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaANxgAAKCRDXblvOeH7b
blJ4AP4v0v8uHn92ZBD/ipPt+rGobZitRKp0xpoUesLYwz/VOQD+ObBSY+Fau99D
uvbyarhPlqm3RUyDXRzJnNuy1XXOEwY=
=82VX
-----END PGP SIGNATURE-----

--787e13d5ada3b08197d931c1726e36235e1092534fb802965a37df9b17c0--

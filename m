Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BB21FF1A3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743782302; cv=none; b=m0meR48ryPk30bSYQM08DNZNjBvfIj2e6L3rwCSbCNSxnrSaLWYvktNu6sK1JXroF6cUarvPU0lbcbJKOfE1ZNT/sYEAJIhR/FGfOtCPBaUKtsYgm8/z8uidNbl/zbRs1TFw8dFu1wCGRkoCIrJjPcLEDyly4bxhhqpeq5nnJ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743782302; c=relaxed/simple;
	bh=tRKOkfd6qLJFQE7R23p8Xc/vjAtr8M2K9QIPcFzV9Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p61VXnpVYe4rw6+sD6KYI65KZfPonFzRc0SQRIgZHxgt5mcheQFnfCjYFfWjjWGhSYZF5oRCDu2KPn+DMeOSJbh120RTwiZksaingeEyN5CwHgxCFMiSqRET+wDSd1l7w/OxExsXb+Gvp0ALhiNImElzipZFQDsmzEoAYc4i/Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhqJS6CB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhqJS6CB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D617EC4CEDD;
	Fri,  4 Apr 2025 15:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743782302;
	bh=tRKOkfd6qLJFQE7R23p8Xc/vjAtr8M2K9QIPcFzV9Ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PhqJS6CB9ljx49n4bTwoc+W4UoiVPaXAHlrw0XMHrE+ZQfoNuNTgGE6REnb11MSsh
	 jjJd7dGrHDC1gBnJhb+Gst5w7SXVInNzlrzJoroXgszPdR9qJSDGa1aNXd0FM+Lrc3
	 B1ZFOhfLwpxMEybw3P/j7znRIJ/Irt+5bLn2a+l6jkjxG5IfZnJw+yhdlk9qPzbsIz
	 GqM5oOpTK+N0MWzXR51dZ9UGQlaaW0LOKFX17mBiLrbYn8iRKkQl369Tgkx1BgrR/5
	 iGXTzAxzjOH/hzM17W8FsHfhQeBDYZrBnDDarQvle1HlFySurbhnJ0suvqyhFXYo7P
	 9SFJ+qsMESBoA==
Date: Fri, 4 Apr 2025 16:58:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v2 4/4] tools/kselftest: add MTE_STORE_ONLY feature hwcap
 test
Message-ID: <8cd07b7b-0795-485a-86f1-bc3a68be7820@sirena.org.uk>
References: <20250403174701.74312-1-yeoreum.yun@arm.com>
 <20250403174701.74312-5-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PMkyeU5nDe5fyzdI"
Content-Disposition: inline
In-Reply-To: <20250403174701.74312-5-yeoreum.yun@arm.com>
X-Cookie: You will soon forget this.


--PMkyeU5nDe5fyzdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 03, 2025 at 06:47:01PM +0100, Yeoreum Yun wrote:
> add MTE_STORE_ONLY feature hwcap test.

Reviewed-by: Mark Brown <broonie@kernel.org>

Usually the subject would be kselftest/arm64 BTW.

--PMkyeU5nDe5fyzdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfwAZUACgkQJNaLcl1U
h9BWowf/R3vl/2tkx4iIVwMuzIG9MRQHR602mNzSvNgq8KueHzVfm1Oy4T7LMc5a
sMSfEZ9vr+fBe8oRVtOSZjY53YzxvTjonEIB6bxOn11g5ylY57TFb2GmLBusWrg8
/BVsagQj8qQR2t+blKH8h9lKz69LRpENjYhOFNeDoUHmBb3R4DtyCXJeN3bvIYWy
1tOmOLooMSvfyWOzOZFt6jRAvzA1Zk1GcE9sM0m/WZiTVOoPudGmnfsU/gGSqa9E
1I9yteqyNTciwAFdvvq6D3ADwhIUkKSF2/4a5IBVcd32OXzF2OZmpuPM0xYy6tEK
QBo1DMuuW4YYtpKVMLHE94JWq7rZvg==
=WmZg
-----END PGP SIGNATURE-----

--PMkyeU5nDe5fyzdI--

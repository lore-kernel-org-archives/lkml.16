Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABD024DCF1
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739884; cv=none; b=HaH116bxdGP7T4rEYyGI+z3Wf/Zq+j57+OBxZS68xL4MM5dTstMJdAsGzVHWLFlSGFDQrvpizGL+n44bXlTwjAVgRmI04KjyhQwxkGL3m8fja5MFaxjq8lRccc7M19rGuTpjxNPp/HPD7X5chzs3wkni6n4afwIWTCf0feB7v4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739884; c=relaxed/simple;
	bh=Xf7pA1iH8R0kEK1Bi68lYJUZWLTkVcu0i//GjSh5l3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYxp28J57qrfzgt4fWiUZYisKe4yXFmL2kqex/I3h2Rz7lMoNFZE59nNMpSE1gwxip5ChRziQPmNY4GnhrVoxKEXA9liU2kaDPsjLe9b8AOnTdyPXmLSgwT1Xr51lfJnx1o5YWGtqZFmU7aFlUhyGvouPCO9fQbcARv1pinLyxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5izHmlo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5izHmlo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB208C4CEEB;
	Thu, 12 Jun 2025 14:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749739884;
	bh=Xf7pA1iH8R0kEK1Bi68lYJUZWLTkVcu0i//GjSh5l3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G5izHmloGxfvmAKtxCBCGoWnKOObEAsaaMsON8o2BrhMNIpeBRzNJEeGl0QzTFC8o
	 gI6IqastNqKeSsjpXyrXuodJWf/N7uO1+qPu97R4doYc0SmtDbGTNr/1yq3eDMYaSp
	 0GF5dPC/nShzhzTStxALDZtWfcbly6QUpqwy54DZTgKVHwFgAHFfjS3kPzl1FJZiyD
	 MV5jAOGevgyzGynH/dH+sjyyd6L2Xn3OEnRKaMQCk0WPTN461x80nkraPr1OkL9lfA
	 heZh4hysHTNyR+UYAws2Crt7UTvYSgtmiR9Q3xvzak001Z0F+1OTMvT/aD/x7LiPiP
	 S8CuvVrWccX4A==
Date: Thu, 12 Jun 2025 15:51:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Don't call gcs_free() during flush_gcs()
Message-ID: <93a0f043-d5f6-432f-ac37-266dd5bbe899@sirena.org.uk>
References: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
 <aEm-F04k0sC1tOCp@arm.com>
 <4b354842-2108-4904-9294-fb9b00978986@sirena.org.uk>
 <aErokN0vKT3urlmA@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rl3Atc6kzOHHJTuB"
Content-Disposition: inline
In-Reply-To: <aErokN0vKT3urlmA@arm.com>
X-Cookie: Biz is better.


--Rl3Atc6kzOHHJTuB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 12, 2025 at 03:47:44PM +0100, Catalin Marinas wrote:
> On Thu, Jun 12, 2025 at 12:40:42PM +0100, Mark Brown wrote:
> > On Wed, Jun 11, 2025 at 06:34:15PM +0100, Catalin Marinas wrote:

> > > Another caller of gcs_free() is deactivate_mm(). It's not clear to me
> > > when we need to free the shadow stack on this path. On the exit_mm()
> > > path for example we have mmput() -> exit_mmap() that takes care of
> > > unmapping everything. Similarly on the exec_mmap() path.

> > We need that one to clean up the GCS for threads that had it allocated
> > for compatibility, you can see the leak that results without it easily
> > with the glibc testsuite (or anything else that does threads, the glibc
> > tests just spot it).  Most of the checking for arch_release_task_struct()
> > is verifying that deactivate_mm() is guaranteed to be called eveywhere
> > it's relevant, I need to page that back in.

> Makes sense. I think we should only keep gcs_free() in one place,
> ideally deactivate_mm() as that's more related to mm rather than the
> task_struct.

Yes, me too - I just need to double check.

--Rl3Atc6kzOHHJTuB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhK6WYACgkQJNaLcl1U
h9CXoQf9FPQfd8EjZCLMPaTNqdJWnK+Imm3M4iiBTWQPw5Cs4En1X3aPzX06av/d
hRgfuipMS/WRm1uJFcj/yvkijXiSwywItHs6CbK2TU+cMrxSvWK8Ilk1gCg2n8Ac
Kek5jAtdA5ROBw9UZGw5/4mw8utZOP2DlrXpImQtFEU9G7fxMup2ipqfAVcsIoHo
LgE680V/Gg/ytylXWjP1aA8YpMPivqTUu+bMmPhGfblUzCTj7BYsrqB+9PUtt2ly
3mDthSe6MCXKm3g01RP5ursX5bnui2kvTIgPoYINxwcEDLz/ELjVbSCUBB9yf/VL
h4FnRm1zAapoQ/K+wV+s7uLYmO5InQ==
=FkRy
-----END PGP SIGNATURE-----

--Rl3Atc6kzOHHJTuB--

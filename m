Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E54A27BF8E;
	Wed, 11 Jun 2025 12:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749643950; cv=none; b=e1FL6Zqju/TBRIWb8BUmk2X8vd/UeWIDnI/F8z6KfzHQ8HcHXgEbdm9g+YU89qO8WuVoyPO1NhxKVZzKTpZgI6AqVvCeDKD3hMGwkuYrTwEQirHSECkuc/jKWpKclzdK9dSM7zdHFn0NpIqsId2wIfLisN1K3V7emKDyyZe06ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749643950; c=relaxed/simple;
	bh=SLJD4xSGhnQdu4G0Y8SleRMssURTGoQ/hhnSRqumesk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXZPjsQxGviE8gMlXBShQoNu6Np9925ZfMLgflbHyoniTU6PedHOl36HoZ1yNNO5rJKQZbB79ImoVg5sDIqJmEgBcCF5LuRBe+1PbKDM8S5cboQ0mOmv+Ugk3ToMk4yk8bLHKZqtYWZ0X52gdZK8WOYSSrq42rkTAJEmWvIsAao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sezHiOaZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sezHiOaZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3E6C4CEEE;
	Wed, 11 Jun 2025 12:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749643950;
	bh=SLJD4xSGhnQdu4G0Y8SleRMssURTGoQ/hhnSRqumesk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sezHiOaZuBVh2WM2w9v3+RnYxj8O2uvwWdqlcK8KwaMwuHN4PKpyQ1cbuaNgDOZOH
	 x3I1WuOlyNgGclKVEZGC0eQZB7+P8LHY6x8zmkVhA8rM3r12uX5IjbSFcC8FHyKmn1
	 4v/AgQMv0cIxBaEMzoHqvlXonG9Z9HdtBgFo50ACU4opYZTAKyUuy4QVvaUZ0BoGuq
	 LfyIPCa0psvy1UtVfcH6MMwfY0K8T5Qvkid1O4HFLt5S7kWHzhNuEQMKzRFP2qKtTi
	 7XXfyIVrvJECB5r/+v9aYXPqkQXXPPKhgsN74DnXfb99/PimSRNjSIF5f2RdBCbrNU
	 JhTpRZoTHbcQQ==
Date: Wed, 11 Jun 2025 13:12:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 7/9] kselftest/arm64/mte: add verification for address
 tag in signal handler
Message-ID: <5d2a3abd-f19d-4fe0-adfa-9a9860d7404d@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-8-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dMpReiqx5R2V4KiQ"
Content-Disposition: inline
In-Reply-To: <20250611094107.928457-8-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--dMpReiqx5R2V4KiQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 10:41:05AM +0100, Yeoreum Yun wrote:
> Add the address tag [63:60] verification when synchronous mte fault is happen.
> when signal handler is registered with SA_EXPOSE_TAGBITS,
> address includes not only memory tag [59:56] but also address tag.
> Therefore, when verify fault address location, remove both tags

Reviewed-by: Mark Brown <broonie@kernel.org>

though if you're doing a new version there's minor stylistic stuff:

>  		/* Compare the context for precise error */
>  		else if (si->si_code == SEGV_MTESERR) {
> +		 	if ((!mtefar_support && si_atag) || (si_atag != MT_FETCH_ATAG(cur_mte_cxt.trig_addr))) {
> +			  ksft_print_msg("Invalid MTE synchronous exception caught for address tag! si_tag=%x, si_atag: %x\n", si_tag, si_atag);
> +			  exit(KSFT_FAIL);
> +			}

Indentation seems off, also there's ksft_exit_fail_msg() but either way
works.

--dMpReiqx5R2V4KiQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJcqcACgkQJNaLcl1U
h9D6BQf/aTNOEBHCdJx2AzPMclI0fnVTOqn3wjbjAva4lqTXOKFLHZfMukbLQgMt
ZFa2UJLpKBrYoh3CG2KucTHVJcFeDfXv2PQuxC98vDWOla6CX9m1+KmtYs0hWI96
wu/1FPcXTxhiymFlHU0Bp8LkfTfhimSXigPbKSCvyhSZWmg3UPp1f7S04agQk8N5
oiCzwjCfckUZh1yEmlJIF/ALdO7GVzQaV3J/vpE90pajKUK8GEw1KP7qm6GYMWj9
6bEM2rgEw41ohCucoKhFn41SEy0XPOEnlmEJEuWAnn5U8qWtrq4lP6gBE8L/y5wJ
cC5YE4Os4Oq3fc0aLmhlCtnVYLeBSg==
=etRc
-----END PGP SIGNATURE-----

--dMpReiqx5R2V4KiQ--

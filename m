Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECDA2356BF;
	Tue, 10 Jun 2025 15:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569910; cv=none; b=QKqkClfNYFERLrkThPj/NEEggN6RTfD3uU1Tq+RBppnj6SPH6rqPIizbNz2T0paG9FS8Ze0BrSVavmGmcreJ8CCJurO1WQD8xdi7O71f+Vd3V8dyH6hIjM62bx8NYdyN/yJggioxaNT9g1I+F4A0uSuEdKd7soMA6XSHrfAOgQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569910; c=relaxed/simple;
	bh=YN2abfYTzSNS/+hpyJFcfBAwNk3QerwbhJuKXfXBLZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuFzYAsXZBD34ZC0rAMCIzsbFomxuA4Bom9os9fK2iFWm1WQMe3pj0k1ZcxWaFE4y4Qha7BhjFobvmOtwMoNE0MBinTqL1HEAr+lHtJH8cI3GRKIjByiuknEZCGpryse7SuwtH37MskRjpP5et04jYek9jwCU0qaiV+ZSNplMfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttO/2+H5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttO/2+H5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2697C4CEED;
	Tue, 10 Jun 2025 15:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749569910;
	bh=YN2abfYTzSNS/+hpyJFcfBAwNk3QerwbhJuKXfXBLZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ttO/2+H5eQRLnu1nZSrsbB8yax6s0pOvJr05qK8/af+y3dKzaa4XYMCuCFsGrdlhP
	 sbsuvkkpksTCEEbRuvfDK54h/wJRXhQfvn7s9wCC+c9BWzjMn9vf/f+SZPPsGunpCT
	 16jI+eYsZNvVfNQueTYmvOjWFrgrUDRb0tal9dEAC/F9wZcwg+kG2XF89gxeE7ZleN
	 vRxFpczLdfS+QGdnX8S0VubCl0DEEvjxpCaZ4rmDA0Pt6x8i2WiDi2QYQG48QA4oXE
	 5Pva/rXpVnrB1g0VeHQLwEtSgqnV5TnikGVGZ+RJIxuSHYveDhV/laQ0+z95u+YZeV
	 WHYG/SyHCsewQ==
Date: Tue, 10 Jun 2025 16:38:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, shmeerali.kolothum.thodi@huawei.com,
	akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 5/6] kselftest/arm64/mte: refactor check_mmap_option
 test
Message-ID: <69778d2c-3ace-4fbe-a55f-297e280f8761@sirena.org.uk>
References: <20250610150144.2523945-1-yeoreum.yun@arm.com>
 <20250610150144.2523945-6-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wiurY4jNrpHPUgNi"
Content-Disposition: inline
In-Reply-To: <20250610150144.2523945-6-yeoreum.yun@arm.com>
X-Cookie: When in doubt, follow your heart.


--wiurY4jNrpHPUgNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 10, 2025 at 04:01:43PM +0100, Yeoreum Yun wrote:

> Before add mtefar testcase on check_mmap_option.c,
> refactor check_mmap_option.

Please describe the intended refactoring here.

> +#define CHECK_ANON_MEM		0
> +#define CHECK_FILE_MEM		1
> +#define CHECK_CLEAR_PROT_MTE	2
> +

Perhaps use enums for this sort of thing?

> +{
> +	static char test_name[TEST_NAME_MAX];
> +	const char* check_type_str;

Coding style would usually be

	const char *check_type_str;

> +	snprintf(test_name, TEST_NAME_MAX,
> +	         "Check %s with %s mapping, %s mode, %s memory and %s\n",
> +	         check_type_str, mapping_str, sync_str, mem_type_str, tag_check_str);

sizeof(test_name).

>  	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
> -	"Check anonymous memory with private mapping, sync error mode, mmap memory and tag check off\n");
> +		      format_test_name(CHECK_ANON_MEM, USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF));

Looking at this I can't help but think that the more common pattern for
test programs where we have an array of test parameters that we loop
through might make sense:

	for (i = 0; i < ARRAY_SIZE(test_cases); i++) {
		format_test_name(test_cases[i]);

		switch (test_cases[i].test_type) {
		case CHECK_ANON_MEM:
			check_anonymous_memory_mapping(USE_MMAP, ...);

That seems a bit more legible and maintainable.

>  	mte_disable_pstate_tco();

The management of this could be added as a parameter in the test struct.

--wiurY4jNrpHPUgNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhIUXAACgkQJNaLcl1U
h9Boxwf/dZbDq7YqYcbr08R6zhlOta4jGhZDU+Ik+NUZ6h0zOrm/eN4p2q1GyOQQ
UBaVFS6XoIDDwj9dq0EepDjWFCzfvSMUTQlmTpsiZRz7WUtT1Arf5Hyj70NlSM6G
Jwp45Bd0RGSnp2Oqto5PulRstpLEAcFPOfy0yxi5RUQ0fb/PKZ3HVa640wxxs+s1
9LLLkdqf/DAkWNveuKTbLlpjuQa2GqHRPOGxvft392o36Vj2B2xOyyX1BTtU1m64
0e35ZUud9tpixP0m05mkemT53/HXnziTuZHY/B4FIfOf93oDOd0OMEfAtSsE/qgs
2i5Pz9GXvPgJCKag2F9ZrKirf315Og==
=2tuw
-----END PGP SIGNATURE-----

--wiurY4jNrpHPUgNi--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E67E2F4328
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 16:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749746662; cv=none; b=JeWV66V4wVicrhQu7OdrSjLQzWZ8H1Uo1LXN/lPVau6vZZ0yzgNWh/vfvF57KvSuQ/TE+j4G9ZwdkPUa5In4m++eMk5CnF/NJJa4p0EK0gvLPjJ6q482pvS6bpICwHbA4z2ZTF6sZSfpEFkt2DMUJqRT8FCXQuZuKfpmZFOqJsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749746662; c=relaxed/simple;
	bh=f6nmeiDBbSv6hLGTHeA+98clwxPNiLe7VKe+Gy5mksc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FuMI1ZVPa1sxTy0Zq4kAh5UDVZfcXhz51y3cGBaB7YR6y1YZBdFBqcTSYLYldQ8L5IU7hwgeno7gZrLS13x6Nc+Gv0amzNON3Jkh8mjSw9ZXy2dP1Z6pAWnvET4T1M9fGYT6Xpdyy7z5BfWgIgOb74hzIzVc+5+Mo61+LMPhV3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Em3I8Zna; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Em3I8Zna"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9AD2C4CEEA;
	Thu, 12 Jun 2025 16:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749746661;
	bh=f6nmeiDBbSv6hLGTHeA+98clwxPNiLe7VKe+Gy5mksc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Em3I8Zna+1C3CD8q08/uSigRLg8MyInTdQluiuvCHBfs14yu/3dzII2rWyqzgiy+X
	 SZ5P7TskeJO3Wv/WpXlghNf0vmu8T9cgKnN6HpC18QjLkB5Mf1g3d+f2xu0XOLJYhp
	 OCrd6vxq/gp66mWtmkCHko+FInDcMNUQgVHOkruCJfZeW/GPLCMRezsc4eoB6zHcAd
	 GDSSCI8nZlC//+8QtsRYbYc11kcjacnBNyA3fjHavJf2DRiRWpBRlwlo+blcgSM+jH
	 SjuDuOt4UDEEuYEMLgwfTV3+xNZiDemsU9FDOy/orC/7CRaP/EqUxUWIeqR38NcaJC
	 5EugFEF5yzfqg==
Date: Thu, 12 Jun 2025 17:44:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Don't call gcs_free() during flush_gcs()
Message-ID: <6901c30b-0b31-4c9c-9943-e5205485691e@sirena.org.uk>
References: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
 <aEm-F04k0sC1tOCp@arm.com>
 <4b354842-2108-4904-9294-fb9b00978986@sirena.org.uk>
 <aErokN0vKT3urlmA@arm.com>
 <93a0f043-d5f6-432f-ac37-266dd5bbe899@sirena.org.uk>
 <20250612162027.GA13202@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g9doPJH8Qa6O3G2u"
Content-Disposition: inline
In-Reply-To: <20250612162027.GA13202@willie-the-truck>
X-Cookie: Biz is better.


--g9doPJH8Qa6O3G2u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 12, 2025 at 05:20:28PM +0100, Will Deacon wrote:

> Having looking a little at the code, I think that
> arch_release_task_struct() might be better than deactivate_mm(). The
> latter takes an 'mm' parameter which we ignore but I think happens to
> be 'current->mm'and so things work. Given that, and that we don't do any
> GCS management on the activate_mm() path, freeing the GCS in the
> task-centric functions makes more sense to me.

The issue with that is that we only call arch_release_task_struct()
quite late, after the mm has been disassociated from the task.
do_exit() cleans up the mm with exit_mm() relatively early on, and
free_task() which is what calls arch_release_task_struct() is one of the
last things we do as we clean up.

--g9doPJH8Qa6O3G2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhLA+EACgkQJNaLcl1U
h9CcEQf+OppxOZFdiQ6126vFkOw2K2aoXa4etd6ht4IXrEO5qIWP9bzeSq8cxS8w
CoIGCLsTcS6Ms5vREcV2pS4N0TffQ9wlvUgmaYq+DcxMFXP/OqbmXmxRGSX83ZHu
OtiRyuTJE89OoTVBmY1rfIgGbS5vlubhjw8kimI7FsVo3wvi6uaRbUnXcVgN9CTH
OKtSl5fARe/5y3MH8KIX8gI0uwdm+gPbQitGq6vy94o+WK64KDtvBPRC9jklfMst
+oPJMRALzedUkqD/LDpwFyd8AosaC6K6cTx0ZmWxHyHMa9+q5YNzcx4/5/7BVSiY
fW23Fjd1dbwiVBNRTf5FQvRNgXm06A==
=m3z+
-----END PGP SIGNATURE-----

--g9doPJH8Qa6O3G2u--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BCC2F430B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749728446; cv=none; b=s1y+SQSM8cM3svLEq+HZgLkbMbJ9gZXDD0MHXiTmmnMpyHd8abFbWTX59TtDLTpVPGtKukgbgytHk/ce3ZUJVGL2DvHnZk3dvryF7Z9AWInuU/wx1bXn4ysFBq9JcX4P//rqN3IQsZuPMtKWfRzgx6p3S7lpVW/f+su/jp7PqwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749728446; c=relaxed/simple;
	bh=1KBhM8bk9JxMtfrE+3h3SIFV/b3n9l3SS3mDRZtnhCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rz1nmKlqbJFPKQnDoHSukZ5L5G1f2AMhvsHm20LVrnlJ9zJft20rsRNDqTWfz70WqJMg/98Bvu51N15VSqsw6HC5PzA3H+/AIaIWVJmTLXh6a45Jee4HSQN3utHbwpUcQg5+xVfh3O2Y34Ry0bAiSM82oML+fxWjXT0xH1+Z970=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VgaAuc7h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VgaAuc7h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD6FC4CEEA;
	Thu, 12 Jun 2025 11:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749728446;
	bh=1KBhM8bk9JxMtfrE+3h3SIFV/b3n9l3SS3mDRZtnhCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VgaAuc7hMRW+sYqU/VAveo1iulgWDwYA8M+njnJvlnuYB/pNbkWeTFkolAsH52FVh
	 UaEDl9aaEoX8Mq2dM6/yhu/4jhiiujrXyfbzavqG1pYPbAZ6KI0uH4v6CogdrB3OYy
	 8yT6/BtKmXUvCosBh+G3cKun8AaflYyBbeqwhSeds50IsI1P8u4Jrsr8yle1PVV+eL
	 rWV3HPDeTaytXTbIJEOye5YiSzks8GJ7QNY/mnsBjn3OEZ0f0j2WVdMSCgu9KRrlDi
	 9rXTedWbz9VYq0hk6RVo4GRumWLYOfvjxuYAFhMvAuXn+gQR5NTvtHGImYNhhffNsG
	 A6v59JExJroZA==
Date: Thu, 12 Jun 2025 12:40:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Don't call gcs_free() during flush_gcs()
Message-ID: <4b354842-2108-4904-9294-fb9b00978986@sirena.org.uk>
References: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
 <aEm-F04k0sC1tOCp@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KnlgrhDwbe58yvRw"
Content-Disposition: inline
In-Reply-To: <aEm-F04k0sC1tOCp@arm.com>
X-Cookie: Biz is better.


--KnlgrhDwbe58yvRw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 06:34:15PM +0100, Catalin Marinas wrote:

> However, I thought there was another slightly misplaced call to
> gcs_free() via arch_release_task_struct(). I wouldn't touch the user
> memory with vm_munmap() when releasing a task structure. Is this needed
> because the shadow stack is allocated automatically on thread creation,
> so we need something to free it when the thread died?

Yeah, I've got another patch written but not sent for that (since it
doesn't actually overlap) but like you say I need to check that things
are joined up for threads that had a GCS created automatically for
compatibility before I send it out.

> Another caller of gcs_free() is deactivate_mm(). It's not clear to me
> when we need to free the shadow stack on this path. On the exit_mm()
> path for example we have mmput() -> exit_mmap() that takes care of
> unmapping everything. Similarly on the exec_mmap() path.

We need that one to clean up the GCS for threads that had it allocated
for compatibility, you can see the leak that results without it easily
with the glibc testsuite (or anything else that does threads, the glibc
tests just spot it).  Most of the checking for arch_release_task_struct()
is verifying that deactivate_mm() is guaranteed to be called eveywhere
it's relevant, I need to page that back in.

--KnlgrhDwbe58yvRw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhKvLkACgkQJNaLcl1U
h9Azfwf+OUKFVllQ+wZdyz7mY0zgJQ8dbVbvdT/iLVCH9YbTrUHWIsOGjTDaqug0
+6DNXS6Ok5zgxVzGlXdf9SI90HDwpgaHleYFz4FIGLI6wYH5LQCqyHCgHi4N963H
cNHmSP31GS0rwH51mZlufeIEzn9pFBRKqzDgt7E1j3ldDmXYtCtKgHmcnI6mkTR8
RvyD5t5TcurgB7qiR9Pz888CBcpdDqUtZ7xG0UlgcyBCz7TeagarpBFPa7P6S5Pw
vuMwGfSeaouwGZx5+SbN8Fjx/lPaa8uYXqk1Sk6jgW9QNp0W2tzfzw+/YRMLZx4z
OJMotwBAiUEy822grP33JFPe2FgX2w==
=HNrf
-----END PGP SIGNATURE-----

--KnlgrhDwbe58yvRw--

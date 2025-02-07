Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83E91B4F15
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738953083; cv=none; b=U4L8jvPp8uRzDP6pT6LhzsaMCRaGfZKwkuKf7xWevUFV8v3FaG1nzaJG37a9TXH26dr6APq2Ny8IWLCyjW7VXO3vx00vOk9vD+mxBEwlHQbu2RIPIsJQa1sre9z0D3RgdPhtr/b9IR/FLRsypx5zES38rsuPET6KJuVW9r9XnTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738953083; c=relaxed/simple;
	bh=YZi5gQTKYD9GWu8H5k4S5MxWI59dVjk84aCwTZZ4pbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBzv9K1WtsIRtnLsJe9pJ4JgtbZ9ZBJEgyP5wpZYC3dl+YUMmaGd7X2528bquvDPQGaulZK7BL24TKCowOjZc8PplIHrPZ/mLLFcXHY/Yx1czfQnSc8vmXXbHRKyCYzgNnNX+spMncTZPRqgZ8VJXahtHMEbDayMmmeFZ8blOLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8w0KP/S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8w0KP/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701ACC4CED1;
	Fri,  7 Feb 2025 18:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738953083;
	bh=YZi5gQTKYD9GWu8H5k4S5MxWI59dVjk84aCwTZZ4pbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i8w0KP/Sfnk0l5lYm+7ZXKbrpG9GShgTURS0lRyDq59LB52ny1u9ME0Phws8bj4YS
	 /SHJHrncNX33D+rfTfrT27+ecIYpzbJjwUWxqucEugQ07ZRkEUuwgaG4iheeRhgV0H
	 +/ZoeqeUk4XO0rqwy/aRloCR9Fv1puwootJc8gavZxEuMQVqeDPRpjP/J4ID23F7k7
	 lwxvSXM4PFOpSWxiyd83Gl2R8vdIjatbnfukNcnGbn/jtQGkLdkQOLwOs0FX1msgZb
	 gWkB4FBVYZYy/dWCRYNP2kNXkRcUkeAI5dVrJhqyjvTi+7cybBXedf8/ZDELv8IDi+
	 qJsvpXnSnAOyg==
Date: Fri, 7 Feb 2025 18:31:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org,
	akpm@linux-foundation.org, Liam.Howlett@oracle.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Aishwarya.TCV@arm.com
Subject: Re: [PATCH v5 4/5] pid: perform free_pid() calls outside of
 tasklist_lock
Message-ID: <dfdae203-d057-41b1-a437-ba7c31961059@sirena.org.uk>
References: <20250205200929.406568-1-mjguzik@gmail.com>
 <20250205200929.406568-5-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DR0vQQ/8trDze30N"
Content-Disposition: inline
In-Reply-To: <20250205200929.406568-5-mjguzik@gmail.com>
X-Cookie: Tax and title extra.


--DR0vQQ/8trDze30N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 09:09:28PM +0100, Mateusz Guzik wrote:
> As the clone side already executes pid allocation with only pidmap_lock
> held, issuing free_pid() while still holding tasklist_lock exacerbates
> total hold time of the latter.
>=20
> The pid array is smuggled through newly added release_task_post struct
> so that any extra things want to get moved out have means to do it.

We are seeing failures in -next with the clone3 clone3_set_tid selftest
on at least arm and arm64 systems which have been bisected to this
commit, in -next as 88dec855ce117f52bcf88748ddcbb25b10f4f2fc (same
bisect for both):

For arm64 we're seeing a bunch of new failures including:

# # [389] Trying clone3() with CLONE_SET_TID to 391 and 0x0
# # File exists - Failed to create new process
# # [389] clone3() with CLONE_SET_TID 391 says: -17 - expected 0
# not ok 19 reallocate child TID with 1 TIDs and flags 0x0

# # [389] Trying clone3() with CLONE_SET_TID to 1 and 0x20000000
# # File exists - Failed to create new process
# # [389] clone3() with CLONE_SET_TID 1 says: -17 - expected 0
# not ok 21 create PID 1 in new NS with 2 TIDs and flags 0x20000000

# # [1] Trying clone3() with CLONE_SET_TID to 43 and 0x0
# # File exists - Failed to create new process
# # [1] clone3() with CLONE_SET_TID 43 says: -17 - expected 0
# not ok 24 check leak on invalid specific TID with 2 TIDs and flags 0x0

but there's more, 32 bit only seems to see one new failure (at least on
Beaglebone Black which is where I have that test running).

Full log for a run on arm64:

   https://lava.sirena.org.uk/scheduler/job/1102114

and arm:

   https://lava.sirena.org.uk/scheduler/job/1102088

Bisect log, the start is my tooling feeding in test results it already
has to hand in the commit range to seed the bisect:

# bad: [ed58d103e6da15a442ff87567898768dc3a66987] Add linux-next specific f=
iles for 20250207
# good: [653cd79f296fc6fa592cb9fa2f7b8494d5573a43] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [4c7518062d638837cea915e0ffe30f846780639a] ASoC: SOF: ipc4: Add sup=
port for split firmware releases
# good: [0a7c85b516830c0bb088b0bdb2f2c50c76fc531a] regulator: ad5398: Fix i=
ncorrect power down bit mask
# good: [215705db51eb23052c73126d2efb6acbc2db0424] spi: Replace custom fsle=
ep() implementation
# good: [6603c5133daadbb3277fbd93be0d0d5b8ec928e8] ASoC: dt-bindings: atmel=
,at91-ssc: Convert to YAML format
# good: [25fac20edd09b60651eabcc57c187b1277f43d08] spi: gpio: Support a sin=
gle always-selected device
# good: [652ffad172d089acb1a20e5fde1b66e687832b06] spi: fsi: Batch TX opera=
tions
# good: [6eab7034579917f207ca6d8e3f4e11e85e0ab7d5] ASoC: soc-core: Stop usi=
ng of_property_read_bool() for non-boolean properties
# good: [f5aab0438ef17f01c5ecd25e61ae6a03f82a4586] regulator: pca9450: Fix =
enable register for LDO5
# good: [c1ac98492d1584d31f335d233a5cd7a4d4116e5a] spi: realtek-rtl-snand: =
Drop unneeded assignment for cache_type
# good: [5a6a461079decea452fdcae955bccecf92e07e97] regulator: ad5398: Add d=
evice tree support
# good: [995cf0e014b0144edf1125668a97c252c5ab775e] regmap: Reorder 'struct =
regmap'
# good: [89785306453ce6d949e783f6936821a0b7649ee2] spi: zynqmp-gqspi: Alway=
s acknowledge interrupts
# good: [0e11f2076e7fa3efa3e0a694bc4d30ef185f0f7d] Merge branch 'for-5.19/c=
leanup' into for-next
git bisect start 'ed58d103e6da15a442ff87567898768dc3a66987' '653cd79f296fc6=
fa592cb9fa2f7b8494d5573a43' '4c7518062d638837cea915e0ffe30f846780639a' '0a7=
c85b516830c0bb088b0bdb2f2c50c76fc531a' '215705db51eb23052c73126d2efb6acbc2d=
b0424' '6603c5133daadbb3277fbd93be0d0d5b8ec928e8' '25fac20edd09b60651eabcc5=
7c187b1277f43d08' '652ffad172d089acb1a20e5fde1b66e687832b06' '6eab703457991=
7f207ca6d8e3f4e11e85e0ab7d5' 'f5aab0438ef17f01c5ecd25e61ae6a03f82a4586' 'c1=
ac98492d1584d31f335d233a5cd7a4d4116e5a' '5a6a461079decea452fdcae955bccecf92=
e07e97' '995cf0e014b0144edf1125668a97c252c5ab775e' '89785306453ce6d949e783f=
6936821a0b7649ee2' '0e11f2076e7fa3efa3e0a694bc4d30ef185f0f7d'
# bad: [ed58d103e6da15a442ff87567898768dc3a66987] Add linux-next specific f=
iles for 20250207
git bisect bad ed58d103e6da15a442ff87567898768dc3a66987
# bad: [5a44f71c6ba5b0a7623c25047ac61ed852afbd84] Merge branch 'for-linux-n=
ext' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
git bisect bad 5a44f71c6ba5b0a7623c25047ac61ed852afbd84
# bad: [953e43d94b2048d260774e9ddbfd3f378aa2c256] Merge branch 'fs-next' of=
 linux-next
git bisect bad 953e43d94b2048d260774e9ddbfd3f378aa2c256
# good: [2ab7baf7ebddff9faff6846648fd0753e5ee58c1] Merge branch 'for-next' =
of git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git
git bisect good 2ab7baf7ebddff9faff6846648fd0753e5ee58c1
# good: [09c7fd0d4465df7fd6cda5668bd32267884b6cbf] Merge branch '9p-next' o=
f git://github.com/martinetd/linux
git bisect good 09c7fd0d4465df7fd6cda5668bd32267884b6cbf
# bad: [7a1f00b09c09aadbf33660a31f3f3d8ee6302c45] Merge branch 'vfs-6.15.io=
map' into vfs.all
git bisect bad 7a1f00b09c09aadbf33660a31f3f3d8ee6302c45
# good: [9bc19073026d0dce6b7d17d22e74643c80283f8f] Merge branch 'vfs-6.15.m=
ount' into vfs.all
git bisect good 9bc19073026d0dce6b7d17d22e74643c80283f8f
# bad: [ba734a751d30f59e3b10d6792a1e1b50e7b1fc0c] Merge branch 'kernel-6.15=
=2Etasklist_lock' into vfs.all
git bisect bad ba734a751d30f59e3b10d6792a1e1b50e7b1fc0c
# good: [d7c340391cb0f0882bc8d5d9798ef32b577a89bc] Merge branch 'vfs-6.15.p=
ipe' into vfs.all
git bisect good d7c340391cb0f0882bc8d5d9798ef32b577a89bc
# good: [e88fed94388f62a28acfef4954348abe79557d19] pid: sprinkle tasklist_l=
ock asserts
git bisect good e88fed94388f62a28acfef4954348abe79557d19
# bad: [5ca27e0557d722dd648f949dde6e4997f6255f18] pid: drop irq disablement=
 around pidmap_lock
git bisect bad 5ca27e0557d722dd648f949dde6e4997f6255f18
# bad: [88dec855ce117f52bcf88748ddcbb25b10f4f2fc] pid: perform free_pid() c=
alls outside of tasklist_lock
git bisect bad 88dec855ce117f52bcf88748ddcbb25b10f4f2fc
# first bad commit: [88dec855ce117f52bcf88748ddcbb25b10f4f2fc] pid: perform=
 free_pid() calls outside of tasklist_lock

--DR0vQQ/8trDze30N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmemUXUACgkQJNaLcl1U
h9AVUQf/TwMMM9I/2o3EcZGaENuSC7WUjHJnfE5t126RUZ3Eik94tM6X41wotz2m
fF8RxuiUEP81/Gpg10msBuvKsp5Ocl24FBD9ADAgcSHjfDYPfVJl0SlHENldAAsp
WXVJ5yoZbKBsGtmlWtgxSHbSJ0tdQHHjYLMw/jZse0GaOmKmPcbMcZyQjgLpuUcL
0VKZqLvwtkqgVsRn+WgiBcK5U0QOgZr1dL2Myw0qp/wuhxjFUF6oT8WEBZxJBsNN
elP1Q+zLwr+UvEMg+3ZIIu2SLNMDnYcvrs6Nxwbmld2OQ9FSbgzo5XimqvfQoc9z
NKbuthD5+vRgXrk+E/0Dkvxnz43AHQ==
=GDjU
-----END PGP SIGNATURE-----

--DR0vQQ/8trDze30N--

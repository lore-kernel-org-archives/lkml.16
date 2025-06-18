Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CC21D5CF2;
	Wed, 18 Jun 2025 05:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750223021; cv=none; b=PLRXIjwVSyEwWG4t6nbLzQtN7AbVX+7OClBiq4NNuVe9JCR0xB8oyLy6BEtN22UqWAWen3la9DgOnp4UhSBScSDx251jvUEN5g/Z3AqWzn22FmocO9+XVSSWIA27K6RzSnFDic92mPfJUNEEB8murv5BB/oAsCkBZF3epputuNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750223021; c=relaxed/simple;
	bh=6WWqv5KZodAzssHpAA2qUQTaq3L93hjGmBCz1ojQp8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n/F+x7dqQOUez0JeFdUcnUww70JZunw1Z2QGccakW4R8FK0idkhP3mIcj4Ym78EaHElFp1RUMwPgsu5QFR1ql6eioZBTIpu0PZQ6j+qHPoHsoiMri4xyhwYmtneLYBZ2MnswFhPUw9n3cxkv5l1gIKKZDDEAKrhBatH35Jjks0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=laKLAJ69; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="laKLAJ69"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750223015;
	bh=kqKSRJ/guIUFt5BzI3NN6IQBXj+pHJejH9za0Jf/xPE=;
	h=Date:From:To:Cc:Subject:From;
	b=laKLAJ69vBRPhMQY02vaJAO+FL9FAYvlRZ9Vjpoix9Nhi02Wes9sQi/ANAKqA7qcN
	 AkszBzFYEj7OdophJ8ckxbC73yxBALgwr/HGxh+2kuZli8CvidF1Kaow3UnfnMLtoH
	 vtINK4n8pl/RNks8O2QlB1FIwkBGSTTkM0TmyKiJTRqfXZHck+N0dByxkGJfKIErxe
	 4NRdNckiAeeFbo6kVLDfAx8IOKkFCJA9fVJpZGM5+b4nMjlyn8jvcxgtaFvwaMRB0b
	 JNi1UcbruGHr0NfpLc4DAiQ3oZ8BVg4qAZ5xegjeqymPcNqvLNUzhusgu6Cge7wJrt
	 qrjk4iZ2tI0NQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bMWpt3Srrz4wb0;
	Wed, 18 Jun 2025 15:03:33 +1000 (AEST)
Date: Wed, 18 Jun 2025 15:03:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, Raag Jadav <raag.jadav@intel.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20250618150333.5ded99a0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/trREsfRjxJARIWUtxbQwCwy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/trREsfRjxJARIWUtxbQwCwy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.

Task information
--------------- [docutils]

Introduced by commit

  cd37124b4093 ("drm/doc: Add a section about "Task information" for the we=
dge API")

--=20
Cheers,
Stephen Rothwell

--Sig_/trREsfRjxJARIWUtxbQwCwy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhSSKUACgkQAVBC80lX
0Gz1gQf/fuPRHjtEJ9udvL2k+NPjFWGeST3ipVD1JZujraPfXxA79hMBUog64gM/
8V9knscyoYfQQ129RZ69XHnOKOBK64wIDxEU010j5toVfx+C5ofQLQswE+SXorIY
TYkM+Ztm1prkIq4mepvOP4oA/UX/hJp0WzX6JdsMN/HEbIOWDmqVGKp1Hp148qI8
21eG9LufC0FhhjSKLBqIgzPYaegNxvnCTFKT8MMkFGAT/NQSP9L7FxRWfMZTBFzh
KYFG6njPydzCSzcxMyJy2fC4RbnOstZx2bKJoaA+j73vm+U0v5aP9BbbYB+Hn1wX
RL2oqxWORxL6Xfg0ZKi1WaRP0Pc2vQ==
=m8hK
-----END PGP SIGNATURE-----

--Sig_/trREsfRjxJARIWUtxbQwCwy--

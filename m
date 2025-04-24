Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25E35BAF0;
	Thu, 24 Apr 2025 16:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511564; cv=none; b=arBc70UEnzCp8Ah7gc8Li0it3LAWMVLlL9zTEmCMQoB7fmHjXOsAY0Rp82RWnlBKhRfSsMX7A8xrSWvZnhP8sqU5C/PpRBBkCDpXjJWcNv2MsmUr4GiaqNW8YGfdnGo55a5l3KnujMSduS3W9w8O77nyaNZbl1Q50vqyfSX7hME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511564; c=relaxed/simple;
	bh=+Y1jvfEONZooX3pKUDxCf9/Wv4C6eUcEzi7EbFL7LTY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S2yiXWA1+IFoT2FyztAVfANyZgGIq+tEv6uouhQaYcTbSFp+plwiWAE6Ghshmn/2ltxPtUURRlK+1HJ4qGUnLfCU312oGeQwT0H3+DsyV7PWiKyNQZbpR/XjwG9D/zrPl9AV8vZeKuTTFYs98XigI4ier24Yl5t6Vlkzm9zx2xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LBn4GPYh; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LBn4GPYh"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7C94141062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1745511555; bh=X1RVPsXPN4ul2u8BOsbJ4LQIS55aq/P6e52DgvXJLwA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LBn4GPYhE9zxMOlt/nhNIQpnavWp6nkhJyBG3cBRGWCHmuqSiRWARvjF2hgMuAzHu
	 /wK2biBJNp0tHH7Es0qNleFin5GAKuG/kO5bkq/EieucPv06tGud9ThbSjmbHi1uSD
	 HtJW1Lm199zBh7oa+QZz4m4WsvakLw4ttrpyYY2TytsrBlLw+P5y4zdZJ9wLsVsYkq
	 mil5aVf7Azg23+85qD6RzyyBwISda6PRIwSQ+1INau8EEpsWvXVMRjAPN4DoLsQfqw
	 BNPfP1pD7TDnP4n5M+H07F7iXDihtojJaTzanyrAtLa24vX2oqgENqOtp3U/RIpC5b
	 zma+akQALvQeA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7C94141062;
	Thu, 24 Apr 2025 16:19:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Don't create Python bytecode when building the
 kernel
In-Reply-To: <cover.1745453655.git.mchehab+huawei@kernel.org>
References: <cover.1745453655.git.mchehab+huawei@kernel.org>
Date: Thu, 24 Apr 2025 10:19:14 -0600
Message-ID: <87v7qtzg59.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> As reported by Andy, the Kernel build system runs kernel-doc script for DRM,
> when W=1. Due to Python's normal behavior, its JIT compiler will create
> a bytecode and store it under scripts/lib/*/__pycache__.  As one may be using
> O= and even having the sources on a read-only mount point, disable its
> creation during build time.
>
> This is done by adding PYTHONDONTWRITEBYTECODE=1 on every place
> where the script is called within Kbuild and when called via another script.
>  
> This only solves half of the issue though, as one may be manually running
> the script by hand, without asking Python to not store any bytecode.
> This should be OK, but afterwards, git status will list the __pycache__ as
> not committed. To prevent that, add *.pyc to .gitignore.
>
> This series contain 4 patches:
>
> - patch 1 adjusts a variable that pass extra data to scripts/kerneldoc.py;
> - patch 2moves scripts/kernel-doc location to the main makefile
>   and exports it, as scripts/Makefile.build will need it;
> - patch 3 disables __pycache__ generation and ensure that the entire Kbuild
>   will use KERNELDOC var for the location of kernel-doc;
> - patch 4 adds *.pyc at the list of object files to be ignored.

I've applied the set, thanks.

jon

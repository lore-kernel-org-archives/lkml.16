Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB69221549;
	Tue, 15 Apr 2025 17:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744739272; cv=none; b=nZGhsTuzaGJx+V3B+BYchkmlrzt+NEfopMpRt74iH75M9fIF3jyKZRjfU1y2inHkH6PxSSZiE0OFM9hH60vMKxjDdbRBeLqtR2LyhMIW+d4I2mmc65J9qV8GE8Vfhi3xqpAk7L9MEyGaOo3ymbfDLZgtnQ05V4mr3d5GJNWihOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744739272; c=relaxed/simple;
	bh=szfplRKrA6DUtqjusVqgDeQWpmwO0Y6f6ppHXqOzQb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I4d/CrQWilszFWyx3ZiF6Ekay+sO1HuNOSI5iTDS7Z3IO7sUfrKOH4ZobQogi4QS5dlEEjv7hGh9FXy+VFUKK39BA7I5tBzfAWHh04MH2Gy7z+kOgVkaahEdWtAuvYa53dlA0HomHgbp5fQpzVDZnp2GAuBN6bkCDOn1ioHiTJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0Gt2/1U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0Gt2/1U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3309FC4CEE9;
	Tue, 15 Apr 2025 17:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744739271;
	bh=szfplRKrA6DUtqjusVqgDeQWpmwO0Y6f6ppHXqOzQb8=;
	h=Date:From:To:Cc:Subject:From;
	b=D0Gt2/1UNBh9hFptSO4/97L3+rkxiSlpOVUNxbxa0gdpKCLV/bbmJvq0+YzP6RrfH
	 VKXLKkvyOwuS9KnaVlASnb846lWmoYaWmHgYEuDpXyG358IplQ9+bS5sevDUrzCiWR
	 uWu3Uk2e60dPZIr2dGjscMVEUHEBXQeq3v0WEbnrebIy5iNqTvLodNIIlYEcW9kBBV
	 pL09/KBtxjsVq2kzk+BZc3iBcwsRopHbzOncDcgQ+s93MdKOOj0QrSt3XPC15+dOPQ
	 hkmw+NeJNK9Sbnd7coGty0yFqVs0LolqCxssUHbYk20HAyTkA3IR2d6K2o6XBvTCk4
	 vunDdb4HzyCyw==
Date: Tue, 15 Apr 2025 10:47:49 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Song Liu <song@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	kdevops@lists.linux.dev, Jim Zemlin <jzemlin@linux-foundation.org>,
	Konstantin Ryabitsev <mricon@kernel.org>,
	Javier =?iso-8859-1?Q?Gonz=E1lez?= <javier.gonz@samsung.com>,
	Greg Marsden <greg.marsden@oracle.com>, Tso Ted <tytso@mit.edu>,
	Gustavo Padovan <gus@collabora.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: The future of kernel-patches-daemon - folding under LF?
Message-ID: <Z_6bxZUiodrE45HJ@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Song,

We're starting to rely on kernel-patches-deamon (kpd in short) [0] for quite a
bit of  linux-kernel subsystems and have integrated it on kdevops for them [1]
[2]. We already use it for the modules subsystem but even then that runs into
hiccups every now and then and we just have to restart it. For smaller
subsystems we've started to experiment with lei based patchwork solutions, we
started with the firmware loader, and the hope was that if that works we could
move on to memory management to leverage the automation of tests we have for
xarray, maple tree, and vmas. The lei patchwork instance which kernel.org admins
have helped us with works well, however kpd doesn't yet work with it [3], so we
can't even get that off the ground yet. In the meantime, we've been instead
relying on linux-next tags to test other subsystems like memory management so we
avoid regressions that way, instead of testing patches while on the mailing
list. But we do want to get to the point we can test things proactively for
different subsystems.

While we could look for alternatives I think we need to face the fact that we
need more kpd love. I'm convinced that the only way to scale Linux kernel-ci
work is by dividing and conquering and those can contribute to different
components do so, and kpd fits well right in, but I think we need to start
thinking about scaling it beyond just Meta. While we could just try to
contribute to it to fix lingering bugs I've noted my first issue with it,
requring CLA [4], and I don't think it makes sense to fork it from Meta. kpd the
sort of specialized daemon that also can take time to learn and believe at this
point it might make sense if kpd can be part of the LF covered toolbox we can
get support for. Ie, make it an LF project and see if we can get more help with
the sort of pipelines that fit both Meta and the kernel community.

Let me know your thoughts.

[0] https://github.com/facebookincubator/kernel-patches-daemon
[1] https://github.com/linux-kdevops/kdevops/blob/main/docs/kernel-ci/README.md
[2] https://github.com/linux-kdevops/kdevops/blob/main/docs/kernel-ci/kernel-ci-kpd.md
[3] https://lkml.kernel.org/r/CAB=NE6X5mJJmcXjEkHyE=2f1CCA5fDDEjMFH_aMArrhom2qO8Q@mail.gmail.com
[4] https://github.com/facebookincubator/kernel-patches-daemon/issues/62

  Luis

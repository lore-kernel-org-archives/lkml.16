Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F285661
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 11:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748171500; cv=none; b=tv0mQHi/c2Q/wYS94XfREkUONbd5zOhlS5DdxTVHTa1wwt/cLsoAPFjogX4AN4v+VjZZXfN1xaP7hWJjUMN2tEfI/2pn4LXzD/YHV6b5Zs9dk6/OfhstkKRFuh0u8kFV7v8tgZtuIwt1M2b72RP7MqtktBntVyXX+ZUQmD52beU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748171500; c=relaxed/simple;
	bh=wWgTpupwm7wkU16y2qiFh9k/d49aIinzY7kcsWrBxKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o6HHLn1PzGIO9G91hdU7UA4HP5/jTpT5ZSidoHkIxijSkCBJiPiNqWAwHpCLXpIdy2KLbPD5y6Rs3FReHJVKBBnSzeFD28t7H7/xwrdq191WfzcLQ3ISgjPpiMHgHPvdBPUenrg8gB4xwNHNtFSItBWhl05V+UhCUyoMXiOgz8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFanBpsP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFanBpsP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C31C4CEEA;
	Sun, 25 May 2025 11:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748171499;
	bh=wWgTpupwm7wkU16y2qiFh9k/d49aIinzY7kcsWrBxKk=;
	h=Date:From:To:Cc:Subject:From;
	b=qFanBpsPWixXNwlFdfv+0FN6HMcfDPqBUTB2gG+Xxw+p8U4iI4b6iFlPKp4p6g9Uf
	 GsoG3qiqJ/sXqa5H4o+rGJfeXnmZ2of0MKsiE9EiydMT+r3grhMmjvnYWIJxWYauU9
	 UiWs/s3ymaxpQ+HpsnJGKZrPXZmbA8HznUF1sbeqAUH7GtqQcP6jr55NzbHpDVd1MX
	 ti2DcY/3SHfJMGW54BJ0nc9qofmTIdhyASu/YkwScb0oXb2ywlRmM//IPUN8ue6JmJ
	 Nz/Fw6FBdwm7h0UvMaNh8jUKCxqtp5Zbi5SnwBm52fNapFy59CabnVjT/9a5ObbsID
	 4sB7Kpqj9fCmw==
Date: Sun, 25 May 2025 13:11:36 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>
Subject: [GIT PULL] x86/build changes for v6.16
Message-ID: <aDL66Kw0auSQQrs-@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest x86/build Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-build-2025-05-25

   # HEAD: ad9b861824ac55d81431815fffaaff5e981badc1 x86/kbuild/64: Restrict clang versions that can use '-march=native'

Add the CONFIG_X86_NATIVE_CPU=y build option to locally optimize the kernel
build with '-march=native'.

 Thanks,

	Ingo

------------------>
Ingo Molnar (1):
      x86/kbuild/64: Test for the availability of the -mtune=native compiler flag

Nathan Chancellor (1):
      x86/kbuild/64: Restrict clang versions that can use '-march=native'

Tor Vic (1):
      x86/kbuild/64: Add the CONFIG_X86_NATIVE_CPU option to locally optimize the kernel with '-march=native'


 arch/x86/Kconfig.cpu | 24 ++++++++++++++++++++++++
 arch/x86/Makefile    |  5 +++++
 2 files changed, 29 insertions(+)

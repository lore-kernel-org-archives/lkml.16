Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8583515535B
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 16:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738426305; cv=none; b=VWOF1kGoPFnpni6fhq/oPCe+F0319r2/VUlzCdF4uBTPvlNmkX3pD3BmMrtIXolaWs88qDkU+AM1iM5woHWIBfH4Fo8eMMTAZ7N5a/AVcmhU//qDOBQzUk43t8FVoEwj834raNW7j/EinJ6rs/rqHu7do2ndCn/Rf3zhLh3TlBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738426305; c=relaxed/simple;
	bh=DqojXxsF191UUgzL9FxzswbGkxdt0frk8icZuUtpfuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rRMIB+aNa5eE9V3qB0bJ5q4AeLrAzeQR2b0MkWqFDAmJNxR/EypofB2XN/+b3YD9c1GLB5HzWthrI25n9luRcFTABG1W/XvsQKCnpJdbwGDVTm5NXTEC9ESJAe2KYpS5Sx5CINAUXKASN8tDuSoBu2aBTOVb7ru8IHqAz8PT0NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JDzOBiUA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JDzOBiUA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C55C4CED3;
	Sat,  1 Feb 2025 16:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738426304;
	bh=DqojXxsF191UUgzL9FxzswbGkxdt0frk8icZuUtpfuI=;
	h=Date:From:To:Cc:Subject:From;
	b=JDzOBiUAv+NiLzM1GM7m8QjD2GqbrVknqxf5cTiiRxLiFi0Y+e94AIeowSOMlIwJU
	 1dPQOjhjdcC2lkwLdKCupzVRaDEo+JG2632PtKU3p2fWaq2HIcMcfy1hYyDt9qPHn4
	 g8i2T72nPL+BZpBpPJUhqa56wuHOLTaIVqeFMXOg=
Date: Sat, 1 Feb 2025 17:11:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: [GIT PULL] debugfs fix for 6.14-rc1
Message-ID: <Z55HvQ7tLIU4V2_6@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 72deda0abee6e705ae71a93f69f55e33be5bca5c:

  Merge tag 'soundwire-6.14-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire (2025-01-29 14:38:19 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/driver-core-6.14-rc1-2

for you to fetch changes up to 57b314752ec0ad42685bc78b376326f1f4c04669:

  debugfs: Fix the missing initializations in __debugfs_file_get() (2025-01-30 08:22:31 +0100)

----------------------------------------------------------------
Debugfs fix for 6.14-rc1

Here is a single debugfs fix from Al to resolve the reported regression
in linux-next and in the driver-core tree.  It has been reported to fix
the issue.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Al Viro (1):
      debugfs: Fix the missing initializations in __debugfs_file_get()

 fs/debugfs/file.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

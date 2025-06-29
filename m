Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1051DA3D;
	Sun, 29 Jun 2025 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751200292; cv=none; b=MGkM/OiGPRKJ2ErcsHf/FAAU7gZ3GpTUlJkkaiKzLG/pUOuk9wKBVYNTFtYLjyVfR8OekvGAn4K/tvjX+DGz+X72+y9mlORbC4GkZXkhGRUmiMh65bvf2iTSWO9DbGKVEyxEKX7Ibmi0973yBuQjyNP5mflOgaQYBC8uViN1bL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751200292; c=relaxed/simple;
	bh=XlhrgfORIvI68VYsBh2LOmcMIyYYt53rKKxWtwHssh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s6Fkw4igf6vAIE+L3Sdgc34nEu8PLS1MPOIvWfROkHciq4eqGk+u7GXedkN/7OAH3/TbPxogRs1VMGSk1GtM5KnnjQpENUsMKeVWubXhmrRxRmHcH92BJWeuhAVbHQ9fDjIhDcCh4rkIF/je7c+r0gCtVXlDAPzRy/21Yc9jhLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vl5Wi67p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vl5Wi67p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359E0C4CEEB;
	Sun, 29 Jun 2025 12:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751200291;
	bh=XlhrgfORIvI68VYsBh2LOmcMIyYYt53rKKxWtwHssh4=;
	h=Date:From:To:Cc:Subject:From;
	b=vl5Wi67pHame1t1PoL/P8ZW7Hx3n+UYqqYcYGLtEDyWsf+gDagraVzAScOdl9h4Ek
	 oyyTQLO3FSKDWKr9buao7mtlRef+0lwN4RQVChrXt2q9WJ2pPnX5F2GlxOAy9NVAi8
	 W7usILlW2ZdlHVXEGG5ecs6leOHPmpdDTcLJfRSA=
Date: Sun, 29 Jun 2025 14:30:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fix for 6.16-rc4
Message-ID: <aGExya6dgB0JMLYb@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.16-rc4

for you to fetch changes up to a55bc4ffc06d8c965a7d6f0a01ed0ed41380df28:

  staging: rtl8723bs: Avoid memset() in aes_cipher() and aes_decipher() (2025-06-19 17:33:43 +0200)

----------------------------------------------------------------
Staging driver fix for 6.16-rc4

Here is a single staging driver fix for 6.16-rc4.  It resolves a build
error in the rtl8723bs driver for some versions of clang on arm64 when
checking the frame size with -Wframe-larger-than.

It has been in linux-next for a while now with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Nathan Chancellor (1):
      staging: rtl8723bs: Avoid memset() in aes_cipher() and aes_decipher()

 drivers/staging/rtl8723bs/core/rtw_security.c | 44 +++++++++------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

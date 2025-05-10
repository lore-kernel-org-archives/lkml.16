Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69BC221FBE
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 16:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746895292; cv=none; b=PoVlPuQTSfNqar2+4iR8c8ubyDEk5cKut57KLWs4+48a6UWJjkHhMpNQCD8rPUIvyuGIQRWTwsJERmgatBcPjksrfST74rWXN6C55uCY1kjuXfgy1FGKPI3LPbf7aD9lIKRYQg39/2wpyWJEpTJqr2BDQeDUU9pN38FwdKmbINE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746895292; c=relaxed/simple;
	bh=rbJZxrSbS04OMy+KMamFhwO3lee5Vo4dN7i0CY932xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QAaUd8UvdfGyQUR3QDD4RqlqurFBxS28e5dDSp1tjeO7A2afcnQcjEfOut4F/qsidcPwoi2f88OrV5KJ3VCCuOn+a7hSCQuNOl4RgiE6bILYbWCbpcTt9OTyqySVn+hbVvK86pOFBGjNFpRzi0MOZl/3RWcAhY4SyU1O8+YWxuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oNWz2AgE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oNWz2AgE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8549C4CEE2;
	Sat, 10 May 2025 16:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746895291;
	bh=rbJZxrSbS04OMy+KMamFhwO3lee5Vo4dN7i0CY932xo=;
	h=Date:From:To:Cc:Subject:From;
	b=oNWz2AgEPQ+PuhUHi93BcY3ij6e1KbiNBLIBOCbHqqSgP0YHwZMdWV0DHrgLDxcRq
	 NuTETXMVYQuit5kQhICtnbk3xbLHYHZzo9P6WONcaiFfMXkG6UjIOaQb0yEufmKCpC
	 1bVzft52376nyNO6CFwpbzduqYbWnnk+2+wOviGs=
Date: Sat, 10 May 2025 18:41:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [GIT PULL] Driver core fix for 6.15-rc6 - try 2
Message-ID: <aB-BuCkpqmN3ybIP@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:

  Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git driver-core-6.15-rc6

for you to fetch changes up to 95deee37a12364f410d22c6a8383f59738a2fef3:

  platform: Fix race condition during DMA configure at IOMMU probe time (2025-05-01 18:00:58 +0200)

----------------------------------------------------------------
Driver core fix for 6.15-rc6

Here is a single driver core fix for a regression for platform devices
that is a regression from a change that went into 6.15-rc1 that affected
Pixel devices.  It has been in linux-next for over a week with no
reported problems.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Will McVicker (1):
      platform: Fix race condition during DMA configure at IOMMU probe time

 drivers/base/platform.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

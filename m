Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239A31B21BF
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 13:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746885200; cv=none; b=YU1gbcm1LC9JvfIeveXN5olWlDvCG0sRqnHP/wtlCSOTLdNvOTpQtO0wP+sShKN+aWat16UBywiVYHHEmk4te3edLsRlXpcXHCyzUSBnwM3+PoETuTK74t+aWvKDG3nuijh+Q8ptTBJbA0Jo8aSFzLGYiyRPRzz80YA5/lU5R2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746885200; c=relaxed/simple;
	bh=D4NK2x8UOD8X6y92H2z8HktJ7clT1LNn6CPTV/oeChk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ExiKz5aytR+QymcfxLe//+LYNWWl/AgwW6RbE+yGzsdIheTwstX/8jO2BYQW1zp4A8r/ahhf1Y+fmZsG9wqTCsrnXr7AyH+CNfmgQOiSIDHcu2/oUBpVmUvcTj+TWu/s7GWoUOVBfwUoTbZRmGNovxJCcLfRrLTLLlkdrTGFIQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LaNVlBsb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LaNVlBsb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16FF7C4CEE2;
	Sat, 10 May 2025 13:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746885199;
	bh=D4NK2x8UOD8X6y92H2z8HktJ7clT1LNn6CPTV/oeChk=;
	h=Date:From:To:Cc:Subject:From;
	b=LaNVlBsblX+f8lUeI8cyY26R3Qb4CInV958qLHy6k1F5kfSEBJlDiFA5mfbF7tbo8
	 WAXI1UqsSG2+6OG6ye77GOE/lt/UKSnbDPCrSrzlyFFpXJ/zFIF6cXOQ+EgFYRprmt
	 Obg0So9eyydE6b/82CGLioQZ3XQXnRWmEmjWd6Gw=
Date: Sat, 10 May 2025 15:53:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [GIT PULL] Driver core fix for 6.15-rc6
Message-ID: <aB9aTNHuSV-5U15D@kroah.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-6.15-rc6

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

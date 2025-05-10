Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDAF2236FA;
	Sat, 10 May 2025 13:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746885225; cv=none; b=gItkI0FnwWu80tj3bz3zt9dKELc9WwjEyRPFiuJQg0HUfzWhYDO54z3L5GVexzpRCRgZ+dxPThftAfAO3pOo4eBr777WLel3r+4JED62DSOfllG5XwDDLQcELV93h413+i3Z9B+jxvxRqdJhIWBMLd18wTRlWe1eZ1WVipIg9DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746885225; c=relaxed/simple;
	bh=pzVikUMp8f5UxsRd0jxOlYKfvwuB/jTScPk+5Vs971Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nq/4lTxSoltYeTIbch4FTyZ+Oc5VTOCO6d97xjbRrQOSdFJOtuSF0DIeBltPvAxEMuxnfauiXp9ir8vjPRXVnhnrDJ9m2XgcCQ/yOPN1In35yjdxicSlTHGsXoPVE0oNFOmLiQZ5Kh8XVPb2DEKR6fCNKpyoLoibUxz1Conn4nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ulh3BxiC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ulh3BxiC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC40C4CEE2;
	Sat, 10 May 2025 13:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746885224;
	bh=pzVikUMp8f5UxsRd0jxOlYKfvwuB/jTScPk+5Vs971Y=;
	h=Date:From:To:Cc:Subject:From;
	b=ulh3BxiCf7DvbB2UqbSnhaUPnk683Ifo1Fp605+LrUoDfGs4Wf6zIvzqcC6s2MIfC
	 N4TZlUGq2x71gymD6eMUUJclwNY+GjqE5sliG9hZN6/JvTAtIP9M6Plf9xXTt2QIAx
	 VwY4qOW2R2UMzoCk638D7xP1HJuDU+5Vn6oaGITA=
Date: Sat, 10 May 2025 15:53:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fixes for 6.15-rc6
Message-ID: <aB9aZjUU3BShkFyd@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.15-rc6

for you to fetch changes up to c6e8d85fafa7193613db37da29c0e8d6e2515b13:

  staging: axis-fifo: Remove hardware resets for user errors (2025-04-25 16:14:25 +0200)

----------------------------------------------------------------
Staging driver fixes for 6.15-rc6

Here are three small staging driver fixes for 6.15-rc6.  These are:
  - bcm2835-camera driver fix
  - two axis-fifo driver fixes

All of these have been in linux-next for a few weeks with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Dave Stevenson (1):
      staging: bcm2835-camera: Initialise dev in v4l2_dev

Gabriel Shahrouzi (2):
      staging: axis-fifo: Correct handling of tx_fifo_depth for size validation
      staging: axis-fifo: Remove hardware resets for user errors

 drivers/staging/axis-fifo/axis-fifo.c                      | 14 +++-----------
 .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c  |  1 +
 2 files changed, 4 insertions(+), 11 deletions(-)

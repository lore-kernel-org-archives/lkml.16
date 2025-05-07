Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B512410F9
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746637926; cv=none; b=cv+gT+LjpSSSkG//wq0ScgobMqih42Ua/jewblY2J5pA1EDa+/XJnj5WtZagzcLqIGiuNuq54Q6tYNXQZ5hZNZq1577dbzFWOQEOGGy2g/ZXN4b/RgV73jBUfab2UObiq03CgnWKPQT6610TfbJHP9ArrlY5pcX1yDlrD47gK+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746637926; c=relaxed/simple;
	bh=zHOBVAhoN4DHw68EYZzaE/9ebznx1HIdqWv3gESepsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PoVl7R0Hv4pcsYSyJTgDu6MqIrGYrOHTgq8j3fBZREBx3BOTZO4AKhDzWa5N40eumMWHzzNNAziiSnrjpcMDKE3dtL9BqScWNfD3vTJ2M4HPu1ubnhdOq+R9oaMk/sur3dR2NDBEHTdmBYLiL6vI99WjykFwaapB3rc31VVmEXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LqZ2bAC7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LqZ2bAC7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D55C4CEE2;
	Wed,  7 May 2025 17:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746637925;
	bh=zHOBVAhoN4DHw68EYZzaE/9ebznx1HIdqWv3gESepsI=;
	h=Date:From:To:Cc:Subject:From;
	b=LqZ2bAC7Tix2feSkGmn+UwTxdQpq8FtDslWmqrSGd5kkAumQZChwHAhnLI7lGtook
	 Q1wfUw7qdc5noCm6wGUCmQIORsaWQsS9zn/nAqDAxyjf0Xrggf4rvr0vT1fiTzqlA+
	 HCyIPNiM2fVluO86vIT14SgagXE904ozsHkzACq34Xq/ynie6B5ufpqKvOxrLfLcky
	 5ni8JxB+ak8pN0KxxpsnvZDbkQllNrJ5zQAn+KkB9yKcvXeOWWV8iqrULCeA0UhIN4
	 teBriS759vZLIaPNGMkSgxoEkZo0x28Mup9kSEnYckwYK/qClqZ4oNWJEYoazpTR0s
	 JPrCbrCL9CgVg==
Date: Thu, 8 May 2025 01:11:57 +0800
From: Gao Xiang <xiang@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
	Hongbo Li <lihongbo22@huawei.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	Chao Yu <chao@kernel.org>
Subject: [GIT PULL] erofs fixes for 6.15-rc6
Message-ID: <aBuUXWt2bnmMBR1B@debian>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
	Hongbo Li <lihongbo22@huawei.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	Chao Yu <chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

Could you consider those fixes for 6.15-rc6?

There are mainly two fixes that would be better to address immediately,
as shown below.  All commits have been in -next (except for Hongbo's
new received rvb), and no potential merge conflicts are observed.

Thanks,
Gao Xiang

The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:

  Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.15-rc6-fixes

for you to fetch changes up to 35076d2223c731f7be75af61e67f90807384d030:

  erofs: ensure the extra temporary copy is valid for shortened bvecs (2025-05-07 09:50:51 +0800)

----------------------------------------------------------------
Changes since last update:

 - Add a new reviewer, Hongbo Li, for better community development;

 - Fix an I/O hang out of file-backed mounts;

 - Address a rare data corruption caused by concurrent I/Os on the
   same deduplicated compressed data;

 - Minor cleanup.

----------------------------------------------------------------
Gao Xiang (1):
      erofs: ensure the extra temporary copy is valid for shortened bvecs

Hongbo Li (2):
      MAINTAINERS: erofs: add myself as reviewer
      erofs: remove unused enum type

Max Kellermann (1):
      fs/erofs/fileio: call erofs_onlinefolio_split() after bio_add_folio()

 MAINTAINERS       |  1 +
 fs/erofs/fileio.c |  4 ++--
 fs/erofs/super.c  |  1 -
 fs/erofs/zdata.c  | 31 ++++++++++++++-----------------
 4 files changed, 17 insertions(+), 20 deletions(-)

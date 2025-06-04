Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF7410E9;
	Wed,  4 Jun 2025 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749026207; cv=none; b=BEFO/lnVlFrIGvcrInJ0f0Ean1cTKgJc4lSUd4X93kJ/O2tpMGGAZ3pE+bbv9rAa7/OOnyc9aet3rrfiz8Zk2dWL46dWqEcc8Pd8fOl9sVQHyj4w89ymSewwhsHzY7FzMKhWF/Vl+n9I0yVo55t+FZLiIHeu53t/6Vcy3RbgGCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749026207; c=relaxed/simple;
	bh=ZsEnkxSND0iQyLVpiJb2vzSLzVyMRpaJVYLGoP5pIX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m514Z2eIu3Lk7O9KEwRCI7DCf4lxYxXWORHWeH57GVfOFS15w4rWJr8OkoqSPFbxL9MajZkx2lg8Je4rM8sqEEK+HlyiAfeVTZPCUzYTn+1LlNwHOve2Xr9c61Vx9/6y0nvf7DfGuctvsqnmSpnhRlpfIt7OJK6XUkMaZvhaf1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oiGtOyPO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oiGtOyPO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3077C4CEE7;
	Wed,  4 Jun 2025 08:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749026207;
	bh=ZsEnkxSND0iQyLVpiJb2vzSLzVyMRpaJVYLGoP5pIX4=;
	h=Date:From:To:Cc:Subject:From;
	b=oiGtOyPOjBV0IGS+9CIt6SNgqi7nNOKswSum7qQ1sJSKvrMP0tA9tFcNjHaze9NW6
	 U/vlkhbKiRkq9MJzWyF3zo596flWxordfDxlzHi7zOCN2WuLIVjeL6p0oJy2OaoHOg
	 egyiFAb0jbN2NZrFcMl6004zC4QaxkrbEbDG85Uc=
Date: Wed, 4 Jun 2025 10:36:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-spdx@vger.kernel.org
Subject: [GIT PULL] SPDX/LICENSES update for 6.16-rc1
Message-ID: <aEAFnFOS-8tH00ko@kroah.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/spdx.git tags/spdx-6.16-rc1

for you to fetch changes up to 59c11a7a9a138a28c7dff81032a7b7b6f1794540:

  LICENSES: add CC0-1.0 license text (2025-05-21 14:54:17 +0200)

----------------------------------------------------------------
LICENSES update for 6.16-rc1

Here is a single patch to the LICENSES/ directory to add the CC0 license
that is currently used in the kcpuid x86 tool for one of their files.
This fixes the error that spdxcheck.py currently has with the kcpuid
file due to a missing LICENSE file for this specific license.

This change has been in linux-next for weeks with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Lukas Bulwahn (1):
      LICENSES: add CC0-1.0 license text

 LICENSES/deprecated/CC0-1.0 | 129 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 LICENSES/deprecated/CC0-1.0

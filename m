Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9441120CCD0
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750277948; cv=none; b=Vf+a6hkxGPlaIkHj18NUXMJARZ9IRW5Dx9z+XJsjypStSLyXo+DU29vEPj+qm2p2gI2jpvJZJC3fBdue2/W+5AiAatRaWICFqk+H7DnBPSP6KJwYKHgmEirz2OhvlrXfKSUl5Am+mtDsSck4KnshpcAcupxi3wngxKZigLxRPjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750277948; c=relaxed/simple;
	bh=RLlZe7wBgnp9AZGSaCYB/MIgQNH+Ic21BC/HOLYFQWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YPhEqrfyMXZ1uiU4wY+XWH9DzTyo+8UfEvr1hOYPqkiRAbwfjwDBOfZhcvVo9fsnhLuHqaNdPNtB/42XHtHBd0gdsufXPsyKD0rarmAH0d3ACpa3j7ZPSahfmHdNAfBZnGBEnZz19cLC29REryu90xMggQULpQGzCIHlJHif1Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HO44klwp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HO44klwp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1367CC4CEE7;
	Wed, 18 Jun 2025 20:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750277948;
	bh=RLlZe7wBgnp9AZGSaCYB/MIgQNH+Ic21BC/HOLYFQWk=;
	h=Date:From:To:Cc:Subject:From;
	b=HO44klwpmTgQXUh3Iwrxmj400wkrAUC3qOmSPfPQzQs+Y3iOsinCG8bvAUBCLAnsP
	 FfldbGLP3X8rYkvcFXk7yzNa9SgwY9prM592sm1IZoczcRM2fbT6JMarK1YxulnSl/
	 qrfOjt/u1BsCLPwrkhsJgdn7BhGCeVZWc/t7Io20BaTojmdGF3QQhme6AxeDKiUa3Q
	 MTvhaOiGO0/Z3RjXC6JpbyROhQC5Yo9O3uw00X+Y7RFF1V5QDWLlX9jSUfC6Jq7Mt9
	 5Uv5yp14uztD4nOBmVzzUoAs+Dkgd8fhRnsPZ1+JN5W7kemqdtldO1Y+dSm5vzFiv9
	 JDMBSLESbTkUA==
Date: Wed, 18 Jun 2025 10:19:06 -1000
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] workqueue: A fix for v6.16-rc2
Message-ID: <aFMfOlQ27hGNas7Z@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 4663747812d1a272312d1b95cbd128f0cdb329f2:

  Merge tag 'platform-drivers-x86-v6.16-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86 (2025-06-17 11:31:53 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git/ tags/wq-for-6.16-rc2-fixes

for you to fetch changes up to 261dce3d64021e7ec828a17b4975ce9182e54ceb:

  workqueue: Initialize wq_isolated_cpumask in workqueue_init_early() (2025-06-17 08:58:29 -1000)

----------------------------------------------------------------
workqueue: A fix for v6.16-rc2

Fix missed early init of wq_isolated_cpumask.

----------------------------------------------------------------
Chuyi Zhou (1):
      workqueue: Initialize wq_isolated_cpumask in workqueue_init_early()

 kernel/workqueue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
tejun

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9536A2E62A7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 21:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744321138; cv=none; b=JSOrW3apuJkIQaL3HqOY7Sgv4OE2PAsv+R9SqJz8GH/AJHwE3T4Sm3EVaXwgCLLX7rSJk+MSfKIwzcN5FLDoPqL3GKPslZI8472XhkFd5iyiU9sY2D+N5CwoxDYZtA3cztTVjHyt1aP/vY644CYE9L8nWDO0ScWpdVEkzf40MmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744321138; c=relaxed/simple;
	bh=hrFcOVHTz7MnZUr3P6FUraxOAKvS571WZnT24JSMHfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T4f/66UoQ3G2ecJaJpv7/P9cAOJGYka6ERK0q8aNBuvt03HczbR6TYK9RYFVvcY8goJ7Vz5vNsolO5L9gnjLKZ7cB4oCoN/AoyPrs2JJ9PHKSI0nkzsnvYtLQ3BWB4E9AoyceRDiEJSj5yD6efPEswrDrlLx1Ip9E1LIPbJVEDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKpMTKL8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKpMTKL8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76921C4CEDD;
	Thu, 10 Apr 2025 21:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744321138;
	bh=hrFcOVHTz7MnZUr3P6FUraxOAKvS571WZnT24JSMHfE=;
	h=Date:From:To:Cc:Subject:From;
	b=cKpMTKL8qJPF2UlJm9A+/2YPcUS3XT0pcegTOZ7eLqGV6tbY6KA82cidgfCkWftTp
	 lgXM5yEV+HFaljX4V/dzR1paTMo76jPaGVZo2v8wzw/AWOrBHGxU5NsOudT7hpGm1b
	 52DoWkQ67VTPtyZYKwEQLlExqqUsgpkzgKffQKpolgBaOIOsNImFq4Z899svvsDXeD
	 bnIkr4uiVlCsRpcQNOVc8gB+1iktvumYvZLaoqhR77eeiYdq+VA7fRBLKNFf1Csho7
	 plKoE/+9M+ByBZnGG6ZhmMDOX+q7UoL71WlLDQl9ubzmhoVIVL7bpJekL10vdkUtmU
	 kwkpstGz9saPQ==
Date: Thu, 10 Apr 2025 23:38:53 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Andrew Morton <akpm@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>
Subject: [GIT PULL] IRQ fixes
Message-ID: <Z_g6bUBRCqegcA86@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest irq/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-04-10

   # HEAD: f35508b93a2fc127a8d185da2e5beade2f789977 irqchip/irq-bcm2712-mip: Set EOI/ACK flags in msi_parent_ops

Miscellaneous irqchip fixes:

 - Fix NULL pointer dereference crashes due to missing .chip_flags
   setup in the sg2042-msi and irq-bcm2712-mip irqchip drivers

 - Remove the davinci aintc irqchip driver's leftover header too

 Thanks,

	Ingo

------------------>
Bartosz Golaszewski (1):
      irqchip/davinci: Remove leftover header

Inochi Amaoto (1):
      irqchip/sg2042-msi: Add missing chip flags

Stanimir Varbanov (1):
      irqchip/irq-bcm2712-mip: Set EOI/ACK flags in msi_parent_ops


 drivers/irqchip/irq-bcm2712-mip.c         |  1 +
 drivers/irqchip/irq-sg2042-msi.c          |  1 +
 include/linux/irqchip/irq-davinci-aintc.h | 27 ---------------------------
 3 files changed, 2 insertions(+), 27 deletions(-)
 delete mode 100644 include/linux/irqchip/irq-davinci-aintc.h

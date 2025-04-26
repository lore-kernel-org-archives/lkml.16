Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9FA1C36
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 08:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745656128; cv=none; b=s/0KnXIks/rVk3yWm8n73qsaJGOpKxG3WZ8dJOHbk5xDt/StkyqeUbp3D6jmrE307pylNV7yc2fsmKbk/iwsfNjqspUscuizGJ7sG45k3zXEFe9gwix/Sjt2ZyjI6zjDp57sJUS3JPiRHzMa2skM2A7SUf5DnQmMIvgPWsnlwqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745656128; c=relaxed/simple;
	bh=uqCKsIpjoxGO83Gm5+wKpqG/TJGNeImL8Ztz7V3Jlwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NuBqOD030ZGmjoIEr42sMSBN8pVSomnyI87WHlAEXxP9crqULCTjBmDMvs4GquLwbtpwhrnTwqU0jwkEM5zRNrkj+JpKFGv+mHAUUkfj4YgsHeJs/E/Hygs/IpYAty3RzBYKLnczc9SIDHZ/797kckQ+Nm8qGBJCpngWIgcnd+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPH0UiJH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPH0UiJH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E386C4CEE2;
	Sat, 26 Apr 2025 08:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745656127;
	bh=uqCKsIpjoxGO83Gm5+wKpqG/TJGNeImL8Ztz7V3Jlwg=;
	h=Date:From:To:Cc:Subject:From;
	b=bPH0UiJHukfA6TOYxNUtVa0CqQGg4LmLsmh9Y97BBLWpeLYJ3RZ6y2gVHC/k3H70W
	 wnOJ5AXEMI4m5HCc35EDtYZiqHkb1rAFvzVagX97Arc7bfHDaycb4WpGcFl7COKsxb
	 Hk380FywcYrW1AOOV7uotBXcuTgXSEuZ2bGyu/TUzMs+yRpt5NXoz+/mSWeEqw3iZm
	 joLlrkrXYGnzuG5Xp3tZIcsPFE/ozlMVyK2gsB0wLD9O4CWJO7vggSSowI9ScYdtdB
	 KQT+WD2PlsJmqmYH3FlV13ixVVy2MiqXnO8xfqUXbPS4miOVIl7MOeNI7q7eMWHj9X
	 2t1Z9vhpMWMPw==
Date: Sat, 26 Apr 2025 10:28:43 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [GIT PULL] IRQ fix
Message-ID: <aAyZO1Yq3llkm89a@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-04-26

   # HEAD: 3318dc299b072a0511d6dfd8367f3304fb6d9827 irqchip/gic-v2m: Prevent use after free of gicv2m_get_fwnode()

Fix crashes in the gic-v2m irqchip driver, caused by an
incorrect __init annotation.

 Thanks,

	Ingo

------------------>
Suzuki K Poulose (1):
      irqchip/gic-v2m: Prevent use after free of gicv2m_get_fwnode()


 drivers/irqchip/irq-gic-v2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
index c69894861866..dc98c39d2b20 100644
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -421,7 +421,7 @@ static int __init gicv2m_of_init(struct fwnode_handle *parent_handle,
 #ifdef CONFIG_ACPI
 static int acpi_num_msi;
 
-static __init struct fwnode_handle *gicv2m_get_fwnode(struct device *dev)
+static struct fwnode_handle *gicv2m_get_fwnode(struct device *dev)
 {
 	struct v2m_data *data;
 

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FAE25F98D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750417850; cv=none; b=Z1AbDU9v03xbW2F3Xsp/IUwtxWMQyqQ91BChvOsNYcNICnl0uNw/NXrlzEYk2/Hvmbfsqbu9nI0AsAPR5oPeB0gj4p176qiSBGriwXlRAqU2FIi0Prr+POLpni2EWjB3Fuh56oHVa0oh+DCl9MBuH+Bk08LmJFlHX2cEsFwULKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750417850; c=relaxed/simple;
	bh=svtDzZdrbdSl/3pbNWLxGgua09eH0cIx0j2lbmFQQ6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uifZjX/2iyoNYn6/vCxj6/hXW3VbAbfvAMjJCglsh+JtMwdOXY8XHDknqt0viwbyYgx1raM6FpJEGP3o4QcujCPcEtSuYQ5Z6dWv+Xg7ASnnRNwxKpIREqEUnw9qlKb1gNsYpK7pf5rJQpHUO8I/x9rKfMJoyWFPdtuq0ejWgX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OE/g/KUq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OE/g/KUq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B5EC4CEE3;
	Fri, 20 Jun 2025 11:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750417849;
	bh=svtDzZdrbdSl/3pbNWLxGgua09eH0cIx0j2lbmFQQ6Y=;
	h=From:To:Cc:Subject:Date:From;
	b=OE/g/KUqf6uDvHAIqq2sQf/EQI/0gI93Jut3ZlNqhccuKnf6/PxUMDSGxLZeUlqpB
	 bd+ax3IAwKsyKNGZwjpE/Ezpr5EnButk0yzGY+Y2LHoUgNdYO7EjC+LxAu9N5oW6h7
	 pnCMRHXmWcPR4v7x0fuUvkj/xC06+6BIw7kYXusfa68/irxvjtbEafa4p8FyrpCsUj
	 rfB+nxOsQC8tI9m4r+QtgtU5KpdtDM2fjjBCiAU8mSCllI+/1/skNEoQTxocPUqlWZ
	 UHRpT9BypJLuUuIUa2nvwbAjRSvpeLd7DQxe+h9939UaZvS4YvlMnvd+kUdSfhHTxC
	 37qirA946Vpyw==
From: Arnd Bergmann <arnd@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	James Morse <james.morse@arm.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: move smp_send_stop() cpu mask off stack
Date: Fri, 20 Jun 2025 13:10:41 +0200
Message-Id: <20250620111045.3364827-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

For really large values of CONFIG_NR_CPUS, a CPU mask value should
not be put on the stack:

arch/arm64/kernel/smp.c:1188:1: error: the frame size of 8544 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]

This could be achieved using alloc_cpumask_var(), which makes it
depend on CONFIG_CPUMASK_OFFSTACK, but as this function is already
serialized and can only run on one CPU, making the variable 'static'
is easier.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 15987100c0cf..5c605dc7f5be 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -1107,7 +1107,7 @@ static inline unsigned int num_other_online_cpus(void)
 void smp_send_stop(void)
 {
 	static unsigned long stop_in_progress;
-	cpumask_t mask;
+	static cpumask_t mask;
 	unsigned long timeout;
 
 	/*
-- 
2.39.5


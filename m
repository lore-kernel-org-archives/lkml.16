Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0DD279327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638647; cv=none; b=ESDsTGaAezkXf0Kh4Q98CHFpYRMT54OJdQtnht9AOthZ8q0BKgeiFzyV4IB2z8983cR6NRO4vUTTHK4crHSVdO2mQDzLMi+bB2Ebbw76xFpD7j1tjxxWarCw7Htd3p9qv5YoImtwupoo4P7PxobqD9ldSqT7JH7X/sWSaylLIiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638647; c=relaxed/simple;
	bh=bHrCHOgwGjRWRvrwMBlrDMz/V9EnLCSbaj497+WUi0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9luZJm5uDiA31XjuIzTXMlHXPK1N4nLGyprGPBFrGwYrmGUa9Z2IrJbiO0ZzTqcXpH35JM18v075bJMw8F23ZVSCSPRCHJPgZJIXigvPqQLzltwoe9mKKhaEmtXTPy32WEK/pXYfHw5DZEQwOFMxcfUUea3nan00tfnFClZGBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcEwfu98; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcEwfu98"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FF4C4CEFC;
	Wed, 11 Jun 2025 10:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638647;
	bh=bHrCHOgwGjRWRvrwMBlrDMz/V9EnLCSbaj497+WUi0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dcEwfu98nkqqSB4o90Y1qUZh4uFBn2FsNk7WKVDGMNQjYKUtIx46sJdEH75+a+wjt
	 1IZdXMLJmtD8V9Y6ErkWJbKuuFqcdFF5/ZpokfbIrY4WQVRyE8HcUAoMqRAFrKJAuj
	 N0L9EPAXBGjCVnp0oe2ijFYQuAnZP0LYObKfzD8T+o7rfO01cuGbT2ED6XjX5qUBwp
	 jEJPI48YsSRsHZf/om8yqplMfUWG5aH1BFGy/QFE2da5ZJ2cNqClCPjBe/UjLhjgG7
	 DbpP6VgrVsfW2eqY3cBqIOzP9KD4naEdzkgP+lBEtbSydY6w5adZFoUvD4dudBs2WR
	 iTRpojUVDiIuA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] gpu: ipu-v3: Use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:35 +0200
Message-ID: <20250611104348.192092-7-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/ipu-v3/ipu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index 333f36e0a715..521d7ec10d85 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -1169,7 +1169,7 @@ static int ipu_irq_init(struct ipu_soc *ipu)
 	};
 	int ret, i;
 
-	ipu->domain = irq_domain_create_linear(of_fwnode_handle(ipu->dev->of_node), IPU_NUM_IRQS,
+	ipu->domain = irq_domain_create_linear(dev_fwnode(ipu->dev), IPU_NUM_IRQS,
 					       &irq_generic_chip_ops, ipu);
 	if (!ipu->domain) {
 		dev_err(ipu->dev, "failed to add irq domain\n");
-- 
2.49.0


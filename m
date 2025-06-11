Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5703B276030
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638636; cv=none; b=sTV7WHErv1LynQG+WrWOKjZBvl25XwkBNxPOdE6ihaHV3D1yh4caGkHbk0TepkR69Fc3qcPCyN/fIl9TLpgVnRiTx+5Zs49kAzq8gB6MWeMVw2+3+JoD8pq2Lnt56yfP5S2rM0vhG7VJpABWbLKNp2JGhnKcE/uCrjGqGwaOSL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638636; c=relaxed/simple;
	bh=2hGCIUOPXV5z7xSt/NM3z3vxK0EsqOeCbQ8en22OH4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IEtRo4xD/wr2f3TRlyZGMmahZ3xmBvWIwkb8JZoXrT6QJMkWNRpZhMC6a6w4kLU+G5yY1TbXHuxYj9idIegzZdR4bcNhiVXnnMLHiJq/iGq289w3vMsxeNpsqFEnscvOAjQobVaFB5sbooLc7I1m/mqVaBsRmupHb4/qIKSmFdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xa2Mf78h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xa2Mf78h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D401BC4CEF1;
	Wed, 11 Jun 2025 10:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638634;
	bh=2hGCIUOPXV5z7xSt/NM3z3vxK0EsqOeCbQ8en22OH4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xa2Mf78hZf1vXKxF0flcAphU2WXRyPHrJRMea+Rq27qwmuN9YApGywFrqYW0DyTPV
	 9n8/9gcCs/xWWq+r9wH16pyEsI/B9BBUrMk/sivjIS94yDWQwcz3DGzyi30lc5fVXz
	 8xfpSyyHa3hBtRYDjQfIUerohLYKpXFkdiCG0M2/JDMSYMjCdETqALWJjns/EoKbcw
	 IICg6awneLMoqpcNSJFwVToUcMVVfzmUTtiD5XwiHYTV6Hc4WtKty+KABsptzUo9L0
	 1J9w6FQftu3jYvNNKgqC5fUauICpW5OdYxj4lbB5elb6WfwBtA6rZT5+siPOXBSBNo
	 YC15kynP97coA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH] bus: moxtet: Use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:31 +0200
Message-ID: <20250611104348.192092-3-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: "Marek Behún" <kabel@kernel.org>
---
 drivers/bus/moxtet.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/bus/moxtet.c b/drivers/bus/moxtet.c
index 6c3e5c5dae10..7ce61d629a87 100644
--- a/drivers/bus/moxtet.c
+++ b/drivers/bus/moxtet.c
@@ -737,8 +737,7 @@ static int moxtet_irq_setup(struct moxtet *moxtet)
 {
 	int i, ret;
 
-	moxtet->irq.domain = irq_domain_create_simple(of_fwnode_handle(moxtet->dev->of_node),
-						      MOXTET_NIRQS, 0,
+	moxtet->irq.domain = irq_domain_create_simple(dev_fwnode(moxtet->dev), MOXTET_NIRQS, 0,
 						      &moxtet_irq_domain, moxtet);
 	if (moxtet->irq.domain == NULL) {
 		dev_err(moxtet->dev, "Could not add IRQ domain\n");
-- 
2.49.0


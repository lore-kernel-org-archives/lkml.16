Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0CD2741BD;
	Wed, 14 May 2025 11:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747223770; cv=none; b=M92Wx+lsunfLlKMw8qfntc24cEMDAtUFwRUCOHUA7nKdKTksBvfLzxGgZBQqFA4xtHuKm73rlxKrK+d3j4IdarLcygzEGYl3YcAXMR/hc7a2jOR0pmQ3uWGfe3x2cEVx1voZ1te+gOBRKtjU+gR5r2n2iskvbMjnj7xYvUO7IyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747223770; c=relaxed/simple;
	bh=GSVCoM5zRcLUg41O7L+uXh/4+IIxs1QtlAeMm8dJr0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aUkkW0Asgc/fp/Xb8VHWG9poZGLlqd/j3QyOLlrdwtyu1/n+NZvVUJLRCT3F4OMghKAKwUCZBUIBO4w9/j85z8tHJ+oSUnMU59nrg3aL9sDPTmKvv3fC22bG0UiHjJH/baQOcHJTQRxUDkQ01L+3ouGlDRKSZ0aBL2Z+J+IDjd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhtGUTxZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhtGUTxZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0969C4CEF1;
	Wed, 14 May 2025 11:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747223769;
	bh=GSVCoM5zRcLUg41O7L+uXh/4+IIxs1QtlAeMm8dJr0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JhtGUTxZsy6UialNotwg48l6a0jdFy7/lzAB/F2XIypy0U/Gc8u337nT4zHNxLxVS
	 qk9Y8QyU60gI3LlYEicFCdXDTYKcW3zCd2x5ctxX/SMHbJGayNlqTAlywa6QxWa993
	 4OKS1DmcpBk44vdT5zbvlWBLYcRsAgE68E3VmkwSmt7Tj6vFnrJRW8Wu0odc/PbWHK
	 DKtWZ90YL0F1goSD3jzh5dkt1IdiyjCbihtou7WonjY3VNIXICT0d0sxCo5ySZyJCW
	 KfgEZiOVNuua6BInPuU/0Uaq8YzXm6ZK6OQrz+QE25iGppPVUvBZvv7gQJYrgAxLz/
	 De6MZZfM3voDQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32ADC3ABDE;
	Wed, 14 May 2025 11:56:09 +0000 (UTC)
From: Alejandro Enrique via B4 Relay <devnull+alejandroe1.geotab.com@kernel.org>
Date: Wed, 14 May 2025 13:55:55 +0200
Subject: [PATCH 2/2] gnss: ubx: add u-blox,neo-m9 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-ubx-m9-v1-2-193973a4f3ca@geotab.com>
References: <20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com>
In-Reply-To: <20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com>
To: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alejandro Enrique <alejandroe1@geotab.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747223768; l=669;
 i=alejandroe1@geotab.com; s=20250514; h=from:subject:message-id;
 bh=KiIso4vtHVKYcUMsG8FY0qTIhtRbhyM34Q0yiSQ9xCA=;
 b=PVY1f03vSetltMmpL6CZOcSbhbOJeLAjcXwD3qOa/O+SeFRxWYYQPjs9ks9rI3FF22RvzVEoP
 r6s80h3JsfXACZ3chq1WuLW3T0+JMU4Ift0hcTZ40hMlq8wT9QIkaJF
X-Developer-Key: i=alejandroe1@geotab.com; a=ed25519;
 pk=xzHMPbqczL/tMsjXr26iLoHwIzLveHVnT+GIU4p1k38=
X-Endpoint-Received: by B4 Relay for alejandroe1@geotab.com/20250514 with
 auth_id=404
X-Original-From: Alejandro Enrique <alejandroe1@geotab.com>
Reply-To: alejandroe1@geotab.com

From: Alejandro Enrique <alejandroe1@geotab.com>

Add compatible for u-blox NEO-M9 GPS module.

Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
---
 drivers/gnss/ubx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gnss/ubx.c b/drivers/gnss/ubx.c
index 92402f6082c415c7b9051338eef5406b09e09455..2d69f1b4a5979f96d3d4ce72b122f3bd05892b55 100644
--- a/drivers/gnss/ubx.c
+++ b/drivers/gnss/ubx.c
@@ -124,6 +124,7 @@ static const struct of_device_id ubx_of_match[] = {
 	{ .compatible = "u-blox,neo-6m" },
 	{ .compatible = "u-blox,neo-8" },
 	{ .compatible = "u-blox,neo-m8" },
+	{ .compatible = "u-blox,neo-m9" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ubx_of_match);

-- 
2.34.1



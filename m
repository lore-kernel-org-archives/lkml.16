Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1927F25E467;
	Wed,  7 May 2025 21:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746655150; cv=none; b=NWN46i2OzNuSujZ8w8sNllHmMXVKp4aXfWwX6TUJG7eBoBgluvxfC7/hRb0WHzXLgSgvsT57h4lQAMcfDPf7pG6BtQnkfiibCXTJ0hJem4CKypnjhhzDAOkW0bg6BHuL/rh30wvvWDJ+lqJ3kipKvrv0/a9BRzD2Hv/vJpE3QT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746655150; c=relaxed/simple;
	bh=9858hxWVasl9qYR0rBtvA66gC6j5dx4PpfDs0u1OvTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o9087Rh0KmzRz9qi7XmTcJjRVkWPlvbizZDb2BMEps81kBUeYogw8OcIgblF2IilExLlJyFNo0bpwxK3L550JrikdnbBF+eBZkTzpn4M4irsTq9FneTXX/R/fzWPl4wBpw+/ZFehZvhL1iWZXML0bDb6AOYsfcl7xuFcgjO10QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ReoGpdNa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ReoGpdNa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63634C4CEE2;
	Wed,  7 May 2025 21:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746655149;
	bh=9858hxWVasl9qYR0rBtvA66gC6j5dx4PpfDs0u1OvTo=;
	h=From:To:Cc:Subject:Date:From;
	b=ReoGpdNaV5J7M/aCOifp9gSt3dnm3MrMaoL4K91pjhOLRSU/MSTjKzXEJEOZPUrMB
	 bEO7tYLv6aGRy1OLdB4B8dNIpZ3uizXyjpt/73Tk18bZZqH6WnWlRKdsKI38H477uL
	 Xx3ufl0khAamWDDgwChmGJRugic2nWxDh3F8Wkmm9FqPufQN3cRAlenH+pW+KU1Ni8
	 8MSyuqbtgLY3wp8u9SFXFfQsdljbkJz7oh1DjJZGNn4TiimV8Qc1Ta9UxKJfQYsfL7
	 2vEb9nE4rNOUWQ9t1MBp8GklCqynV4pp0p5rtXaOSgEYF0+5twoNP/dgHTgJKDpUTg
	 OjPdicqxlYkvw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: fsl,ls1028a-reset: Drop extra "/" in $id
Date: Wed,  7 May 2025 16:59:02 -0500
Message-ID: <20250507215903.2748698-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The $id value has a double "//". Drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
index 31295be91013..558a8c7aab9c 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas//soc/fsl/fsl,ls1028a-reset.yaml#
+$id: http://devicetree.org/schemas/soc/fsl/fsl,ls1028a-reset.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Freescale Layerscape Reset Registers Module
-- 
2.47.2


Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1762747B
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 15:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746287098; cv=none; b=LaA0zpzR/+fRVDGy4f8q6VPqRKVAM0aQKasebEcepUlJvdsHJ0S+WqD2bjv0OPQi33PyUM61BSjWspbQajFgApIm4C7wplMG59e8v/BR2MEBCA9T9rXOZuztnDlDJ2WvQq4dlfZXHicIf3+CsG0NcuuQ6RxtZA3VNhcePty3MTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746287098; c=relaxed/simple;
	bh=dtcaoh2xqaGYmtiiJ+J/CbddLJC0LkmAI4G/+8YEl8w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zu8eRPPPfY2symYMg/oi2TeukH2eMpgXllSe2NN61g/PTvQDnhBnfvmxz7uI9UcHeMzgWWsvUKc1fWi5D6jXUIUw6tRtYM08BjVOGtJuYSGgjOZkZ6mEFjOPPBjtfclf9rRCxnMnreFmtY68HP4DYMnBArbFzZu+o0bMinSjG8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 543FJ5RU087848
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 23:19:05 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 543FIj2C087569
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 3 May 2025 23:18:45 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Sat, 3 May 2025
 23:18:45 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To:
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <paul.walmsley@sifive.com>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <daniel.lezcano@linaro.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <tim609@andestech.com>,
        "Ben
 Zong-You Xie" <ben717@andestech.com>
Subject: [PATCH v2 3/9] dt-bindings: interrupt-controller: add Andes QiLai PLIC
Date: Sat, 3 May 2025 23:18:23 +0800
Message-ID: <20250503151829.605006-4-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250503151829.605006-1-ben717@andestech.com>
References: <20250503151829.605006-1-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 543FJ5RU087848

Add a new compatible string for Andes QiLai PLIC.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 3dfe425909d1..7ae61518e9b7 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -53,6 +53,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - andestech,qilai-plic
               - renesas,r9a07g043-plic
           - const: andestech,nceplic100
       - items:
--
2.34.1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEA72BCF5C;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751827630; cv=none; b=KVYhY6Be/orpU6ywUoFBvVjf9XSwgs3Z0xNMWP947tzeQ2HsXj9kTc3D+C6s2qiHcZLV+y6ZAKv6StZp8dQ/air0OaCq5ZEtEfJnzs3VqXWwA7VTn0zjs2G6UY+/cv4304sXDiv3DQ7SOZ7qi12Qu3j9O8RjBFCZR4QVJRu03Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751827630; c=relaxed/simple;
	bh=vw83PoT+fWGtrCfbewhOmufxkYsCLQpM0AWkoRPHWfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUg+pYeff7vbfvBx2u6smT+bOrtYYSqN8ERaixxbIof0cqsBomq9QIqZSP47XFKJ2cNd2wFGzCPPxO8j2raSkfz/QoNc3BEXCxmHm2irkgrqV72gYM6Kvord5HlFYjjeJpaUCOJRQi9oLUIxc8G7YnB6SOzXffldV9Aw8oNI0oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGDDlPSP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGDDlPSP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47D17C19422;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827630;
	bh=vw83PoT+fWGtrCfbewhOmufxkYsCLQpM0AWkoRPHWfk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jGDDlPSP260CPLUVqu1OLB2Noj1oGigMpRcEMAeCiCwySStycpdO6Ic7PTOEQ+MNy
	 scXdguxKubBx830idf1E9XSArmbWtqHJV21Pv4g2FdwPGbaW9+1RzjrxgIQOmx3rnR
	 nxFMeLOfeIr3HroWFX0O/XyN9KhNf9ppmrGDJSmgxx3QcI7ptSxMM73D536lfR1TYf
	 XbcXfWi2WbQhjuPOXsBwMdoCsn50nQSbP2eFa+3cx0XmtMsegjGHQZZ5IUh/sIRBd1
	 RMtj5+eQXPLgzXbplCfWqmaCAyytGomCex8P1qJMyF7XA1feOI5bAaoLOsg3t70k3h
	 1VYED1Q7rtgtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415DBC83F09;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Sun, 06 Jul 2025 14:47:07 -0400
Subject: [PATCH 11/11] ARM: dts: lpc18xx: add missed
 arm,num-irq-priority-bits
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-lpc18xxx_dts-v1-11-7ae8cdfe8d7d@nxp.com>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
In-Reply-To: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=846;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=4fOjzjyuG5LcIby6pMbBo34EQluojfYnUqvpnhe6tYs=;
 b=U4ZGB18/725NcA20uH867GM0vXODJAffGPp5Nsh4hFcW7DdZ7HVPXiKDHemOdimHvz+joXaF6
 vg2989NPBcZBhuc5QIRBhHsEqCP/P1g+3r3TTeBkFmh4X/Zc7+NfgXX
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

From: Frank Li <Frank.Li@nxp.com>

Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:
arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml#

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
index d212ca252b06dc97a0cdbe5ecff42780b51a02dd..152e98cf0c4e2a3eb4f2c989600698a93b3084a3 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
@@ -537,3 +537,7 @@ gpio: gpio@400f4000 {
 		};
 	};
 };
+
+&nvic {
+	arm,num-irq-priority-bits = <3>;
+};

-- 
2.34.1



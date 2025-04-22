Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90E91A316E;
	Tue, 22 Apr 2025 04:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745294838; cv=none; b=GA/u1P2V/RpKlwPgLHU6NkPRBEHcJjlFWDbZiUNN9osbTr26iYF4LwVZ/d0vzY0HYQJb8mR9zv6CjVicQVpvw5IBx3tnYTJpMHjMWb/A8yM8CYfmMaxRxEBmmSCiy/Cz6DtMK5vt3e45OVfny3ZJW2F7kQnYGQ6iRCM8Q8K6MXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745294838; c=relaxed/simple;
	bh=zT77NuhIoGQABDi8akJqR9yK5e3XaT0TZe2nPOp+CyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQ60qrcRqb64CizyxhEFndAvxkd5oGL1w1pRDCDgqev0xKftz+tli3X0RUTK7kWQWeiNKGA2uU/3DJNFVr5S7M06YiQ3Vjf1ZsiONc6C9JRJWe1W8ayoAuK0vf/c45THIPGDXqgntdFOlCZzS73ZfwcMncowTkNliOd+g5M+ZQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sgg8KrvZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sgg8KrvZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7953CC4CEF2;
	Tue, 22 Apr 2025 04:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745294837;
	bh=zT77NuhIoGQABDi8akJqR9yK5e3XaT0TZe2nPOp+CyU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Sgg8KrvZmna0sLuf0km6A78MEXDzmQ8JlYas5KTK2WFkTzy6x30Qvr/VInNVDa+Py
	 m7vMhL0p13cqWZI5Sy3nciQ42WcOABwTcV0u3fKqNmjD6oXSVkFYE7tHxAQlfvlpl1
	 aSaFw1wD0xVIACG4GzqXAC5RWj43C9HuwQ42oCvUMGFjU6RrN57l00122Tr7U9kiBg
	 2WMS2RZLp/LcTy7Goexty6PEnfDs3lQYHZ2tC5EZ4ji7YX4nbka7FSFNUTWPwInbXa
	 o/dZlWpNMXiW0skWaGGvqUtZc6SHB+EKGf2q9QO17j90iJEOexhZ9oUvxeLpewuOBF
	 xzIwZ2E/0EaQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70539C369D8;
	Tue, 22 Apr 2025 04:07:17 +0000 (UTC)
From: Mahesh Rao via B4 Relay <devnull+mahesh.rao.altera.com@kernel.org>
Date: Tue, 22 Apr 2025 12:07:12 +0800
Subject: [PATCH 5/7] dts: agilex: Add support for SDM mailbox interrupt for
 Intel Agilex SoC FPGA.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-sip_svc_upstream-v1-5-088059190f31@altera.com>
References: <20250422-sip_svc_upstream-v1-0-088059190f31@altera.com>
In-Reply-To: <20250422-sip_svc_upstream-v1-0-088059190f31@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745294834; l=956;
 i=mahesh.rao@altera.com; s=20250107; h=from:subject:message-id;
 bh=Qju5FftDEBjY7mgDWEHoQiNo3ptWBPQcrDs6T4v7xUo=;
 b=/TKi6mT3CU83b72t7wQU4nEbOmAGkmGYsZE9F12SLmIq7ogBH86cX3hZxrdn5Ap1IEUwLMpCb
 4CCI6ZZYI+dCEmqAbdGgEHcFz0ECM1nL8k2X9uO6boeTFkX9401KqYX
X-Developer-Key: i=mahesh.rao@altera.com; a=ed25519;
 pk=tQiFUzoKxHrQLDtWeEeaeTeJTl/UfclUHWZy1fjSiyg=
X-Endpoint-Received: by B4 Relay for mahesh.rao@altera.com/20250107 with
 auth_id=337
X-Original-From: Mahesh Rao <mahesh.rao@altera.com>
Reply-To: mahesh.rao@altera.com

From: Mahesh Rao <mahesh.rao@altera.com>

Add support for Secure Device Manager (SDM) mailbox
doorbell interrupt on Agilex SoC FPGA for supporting
asynchronous transactions.

Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 1235ba5a9865a175001fd3ef2bad710842f93be4..bd8c386a2ee31b85d6ee9be2dff6176565a85077 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -65,6 +65,8 @@ svc {
 			compatible = "intel,agilex-svc";
 			method = "smc";
 			memory-region = <&service_reserved>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&intc>;
 
 			fpga_mgr: fpga-mgr {
 				compatible = "intel,agilex-soc-fpga-mgr";

-- 
2.35.3



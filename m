Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44CE2920A1;
	Mon, 12 May 2025 11:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050019; cv=none; b=eAvxyKjrUKa4X2wY9dY8JYAPU4M3WghTeJqsdTvCAJqQSSed1Lsk1AT/Alxt8wFs33N5J9K9NkjC/J8KptQXD2oq8xB0PY1oix8r75RRUZQHLucCkS0TVZGGZfYwWbioGHKJYMh91pW4FWumdTZTRCvdaOaQzIG8PQDxS0fRMBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050019; c=relaxed/simple;
	bh=zT77NuhIoGQABDi8akJqR9yK5e3XaT0TZe2nPOp+CyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b48zlHDg7xmc+wI+6Fz1SAwmb+jUqagnQrgNPrZTeJlFMgBSF+7t1tnFS7d8Kk/JIETqlvNG5g7fBfPTzevtR7OevRsVwkktFDU1eGNDmZZontf78rx4imze6ZYQU0JAt7z1s73wA9XeNV6mWKjcSQz2y1qyDBfDhim4+zwDXgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yk9Nr00R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yk9Nr00R"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33658C4CEF9;
	Mon, 12 May 2025 11:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747050019;
	bh=zT77NuhIoGQABDi8akJqR9yK5e3XaT0TZe2nPOp+CyU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Yk9Nr00RrBA37y9Mvhy1YGZmJIuA0kgHYvG9SrEJijCM3/MqpGXkPoN/YeX4gp9FV
	 0K3gM5QAHwkHcpLnECUTh9raldv23Kq5yFEyDbLGDageDdkYKv7ufjpcI81xHzTWq9
	 DromQt9DzjOdLTWrwlSUdD0Lv14qpXmBqNrFCF4iF4Vao5H+7izW6FiHlFPMPigoQ5
	 +KQSX+HMbMgDn8htlqLikK1lbfBk4UiFyax3XGNVoKR1xl55WZXLiKRjlyXEMikoci
	 cOQuf/mazriUYCwDYRsr2pTSwzSqdZ3VmzRcYHc74SFX4h0ZFrhNAEdDcBvhqJIXe9
	 OT+43EDgz6m5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292F8C3ABCD;
	Mon, 12 May 2025 11:40:19 +0000 (UTC)
From: Mahesh Rao via B4 Relay <devnull+mahesh.rao.altera.com@kernel.org>
Date: Mon, 12 May 2025 19:39:55 +0800
Subject: [PATCH v2 5/7] dts: agilex: Add support for SDM mailbox interrupt
 for Intel Agilex SoC FPGA.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-sip_svc_upstream-v2-5-fae5c45c059d@altera.com>
References: <20250512-sip_svc_upstream-v2-0-fae5c45c059d@altera.com>
In-Reply-To: <20250512-sip_svc_upstream-v2-0-fae5c45c059d@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747050016; l=956;
 i=mahesh.rao@altera.com; s=20250107; h=from:subject:message-id;
 bh=Qju5FftDEBjY7mgDWEHoQiNo3ptWBPQcrDs6T4v7xUo=;
 b=tIZE59Rukq2QBCrIeK7LfK3lKt7SYYhFKwjXcF+tOwJCIBXcw3OngRIjBfC6PU8lTMMRunoIL
 XzzSGvaxmCrCPoTIqsiDJmS9uP3n6+1vtiozYOiBF4EG3kVq1XWYF9K
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



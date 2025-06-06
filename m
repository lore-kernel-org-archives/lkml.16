Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B799A5234;
	Fri,  6 Jun 2025 00:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749168370; cv=none; b=ghX5v/81nCFqiIkZzIAc3PNCkLF9i6/6EalaHZgjmSxwyqwxUu8Y+wSV5wjSYl7/MShpAX6KNGmFyDiKr3s2LDIffpgK+9PtjmdHkTDGir0kEmkkD4hzIZHx7RaFJHcI833/0pQG/cvtDVVMx70U+OJArG2/GYTI1oh7ugp/f0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749168370; c=relaxed/simple;
	bh=kOeEXWQNRy2OTULbzXmLA/yVFQzsao71agZKirZ35u8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Wpi+FNz9m8CD8PirSce89DdTDSRV/ZueVuV7A6c616+gYFQgCDGXQEyzgWyW5FObTmpV5bMt+imzRzwhXl5L+8g1PDxF7BiAUz1M7VtO6ck1NvWhbCSP/n7A7m/YyrGNp/guSh4sjGvcZSQbzuX/AftmXVvLgYt3gXYkWlaEtPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJFctsbU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJFctsbU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CBE6C4CEE7;
	Fri,  6 Jun 2025 00:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749168370;
	bh=kOeEXWQNRy2OTULbzXmLA/yVFQzsao71agZKirZ35u8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=nJFctsbUoQa5qk+VChv8Sz/jIrNNMapriCXS+1rgwt/pRbUA6jdgJaltLQ9Q0GGXu
	 SpUE7buCTNRKRolFrV0iL5lJ97nzR6fBamyzlpOYnFSoJKomEUOQex/CNrkV3jhs63
	 yir9JRDb1KMO6X8MYOChZwH27mM6Ks/+n7ARyuF6YFTiYVgF2yx4eiQmFQ392jsMRr
	 f8GyzKlZBCwirffmaIBdNdbSTBxKw7/kgypTnU7+cxcAW4Qg5n15NcRggWawJdDAK4
	 b2BYsCPoRC0uuCAjFui6r7HeZWEYHUYV4894/ihDY/aTu+901w4SkYZwGjERPDLO0H
	 nsuNMrMP2lsrQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B829C5B555;
	Fri,  6 Jun 2025 00:06:10 +0000 (UTC)
From: Bjorn Andersson via B4 Relay <devnull+bjorn.andersson.oss.qualcomm.com@kernel.org>
Date: Thu, 05 Jun 2025 19:06:06 -0500
Subject: [PATCH] arm64: defconfig: Enable Qualcomm CPUCP mailbox driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-enable-cpucp-v1-1-111ecef7e4c9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO0wQmgC/x3MQQqAIBBA0avIrBNGw6CuEi3UxhoIE6UIpLsnL
 d/i/wqFMlOBSVTIdHPhMzaoToDfbdxI8toMGrXBAY2kaN1B0qfLJzkqa9D0AV1Q0JKUKfDz7+b
 lfT8Vhg+VXgAAAA==
X-Change-ID: 20250605-enable-cpucp-91a5053f0bf1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749168367; l=931;
 i=bjorn.andersson@oss.qualcomm.com; s=20250318; h=from:subject:message-id;
 bh=mwZCvU5SjPvj2kO7B5ZfonxzycfZ+NOz+VGaDsi0ueE=;
 b=L05l4pr3UPZUZ5Tco/EHocmMvBvnHuoV/CG26hOOlmpoGvi0y/J50xiVyWHqBhKDtLGRRVJKx
 4BWrg4OWuZ6ByYUBCzvI5YNd+uPCN6J6cirhNYCrvDjo7wT9Z4C8hnI
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=rD3O9C9Erg+mUPBRBNw91AGaIaDVqquHZbnn6N6xh6s=
X-Endpoint-Received: by B4 Relay for
 bjorn.andersson@oss.qualcomm.com/20250318 with auth_id=362
X-Original-From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Reply-To: bjorn.andersson@oss.qualcomm.com

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

The Qualcomm CPUCP mailbox driver needs to be enabled for CPU frequency
scaling to work on the X Elite platform, so enable this driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1817bac291780dff3823dacd72510..d3ef95df7b2770ac1c7a6022a9ec22d1fb4c25da 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1447,6 +1447,7 @@ CONFIG_PLATFORM_MHU=y
 CONFIG_BCM2835_MBOX=y
 CONFIG_QCOM_APCS_IPC=y
 CONFIG_MTK_ADSP_MBOX=m
+CONFIG_QCOM_CPUCP_MBOX=m
 CONFIG_QCOM_IPCC=y
 CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_SMMU=y

---
base-commit: 4f27f06ec12190c7c62c722e99ab6243dea81a94
change-id: 20250605-enable-cpucp-91a5053f0bf1

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>



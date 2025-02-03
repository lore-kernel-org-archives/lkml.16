Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25666150980
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 20:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738613474; cv=none; b=L55oZ27rYACKKiSHiMoMCGSqgWPcPU/iz63VWGC1AT+K0K42pwGUsAP5cfY3QIoyrMLVSAzsaLIU3w+zBiaSmxV5y/eX/GGpTqBKB5eFHCGhdU7j7Z3nL4MYma922ZbCA6k4ZGvwU4rXSkdhMyD3Mt2Arvsh6GoZ6a8V8xihHtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738613474; c=relaxed/simple;
	bh=FB57IEbWzju1Rk6ayDCdRihbkwNQBLLPE0g18vk9tXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V1c51vOB7J2Cis8QzXUnFHsVUuiEBSF6i58jzEhdIfg6b0iWG5DEYMYKbqgMUY8a7L4ZBw5zHnB17AgKbu+Jhkuws2czct3cPxJbY24sV3dxnh2s67Z58E5buVtmOy0hEWvxLYg68OhDStHxdA7m33Oq/M2q7IJ52dUUORzOdz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxHlDqRC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxHlDqRC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78068C4CED2;
	Mon,  3 Feb 2025 20:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738613473;
	bh=FB57IEbWzju1Rk6ayDCdRihbkwNQBLLPE0g18vk9tXU=;
	h=From:Date:Subject:To:Cc:From;
	b=bxHlDqRCFDg5NHXyoWxcz8mfkDYOiZB93ET0ZS13s1JRIgfJjwYBnsb2xJWRXH3hJ
	 qKxY46hQmwtXf/N2WU8vUnF9P7A8JrSdswvsQMqHfKwM5L2v3Nvy4h50dqKZzYTYcH
	 REyvebFvoyfBSsoaaDPWe2HIOzNGZ7JUxuZ9gGAbd8iRZRni+7gv7N06p9hWbpn89o
	 nKD7J/gqlY4INqq+3FJye2ai/vcOYPiozNYdTE7oDQuQikp+T8qx8p9MfALh+3a8ej
	 EdqpfLsqMurSWBFID9q6D4WTyXR102G/714OF23a55Kh8r5tredovpPsXvTIUrbx/3
	 /1HUFhudfBXsw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 03 Feb 2025 20:11:04 +0000
Subject: [PATCH] arm64/hwcap: Remove stray references to SF8MMx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-arm64-remove-sf8mmx-v1-1-6f1da3dbff82@kernel.org>
X-B4-Tracking: v=1; b=H4sIANcioWcC/x3MPQqAMAxA4atIZgM1/qBeRRyippqhKimIIN7d4
 vgN7z0QxVQi9NkDJpdGPfaEIs9g3nhfBXVJBnJUO3IlsoWmQpNwXILRtyHcONVMLKWfuSNI5Wn
 i9f6vw/i+H+Xkv79lAAAA
X-Change-ID: 20250203-arm64-remove-sf8mmx-b5a2ae3fca92
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FB57IEbWzju1Rk6ayDCdRihbkwNQBLLPE0g18vk9tXU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnoSLfKn5D8d9Avb+6HBGREZl0x6rINfpJjx1I5fzc
 1/0NnzSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ6Ei3wAKCRAk1otyXVSH0BSwB/
 9ONZ6vLdH7IyzwkEIfOdXpK2b+F4MrbsycZwtIahcAOrjm5NpqG5M03JjV5diKy09WCRmFjizsTLB9
 NpH2xT6rOhzvL7ZKdZdX5paafWpycAO2JeJtjK0UQ9jqhEt8GOzRmo4Vys2ytbKbH7Gbw+mAjT9iz5
 thnDMxAz8GneeJQdGygsgOL3v9W3CYRu+wMXgKEa5PcVCBlX31yHn55/1f1Lr5HH8NwNw+C+JCJNaJ
 dLkab67zO911n5dBsv8RT7ddPXgpWeW9YXm2lDuW5Sxw9922YjRy5yWpLawAVfDrCn8olmU+X5mq7v
 mOuAQumXbZt1cKiKJOjWEHJvSAAKuo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Due to SME currently being disabled when removing the SF8MMx support it
wasn't noticed that there were some stray references in the hwcap table,
delete them.

Fixes: 819935464cb2 ("arm64/hwcap: Describe 2024 dpISA extensions to userspace")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 4eb7c6698ae43da2384970a655f12f266e3c337e..f0910f20fbf8c18fbeb63bcee18abf13371b1d5e 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3180,8 +3180,6 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64SMFR0_EL1, SF8FMA, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8FMA),
 	HWCAP_CAP(ID_AA64SMFR0_EL1, SF8DP4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8DP4),
 	HWCAP_CAP(ID_AA64SMFR0_EL1, SF8DP2, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8DP2),
-	HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM8),
-	HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM4),
 	HWCAP_CAP(ID_AA64SMFR0_EL1, SBitPerm, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SBITPERM),
 	HWCAP_CAP(ID_AA64SMFR0_EL1, AES, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_AES),
 	HWCAP_CAP(ID_AA64SMFR0_EL1, SFEXPA, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SFEXPA),

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-arm64-remove-sf8mmx-b5a2ae3fca92

Best regards,
-- 
Mark Brown <broonie@kernel.org>


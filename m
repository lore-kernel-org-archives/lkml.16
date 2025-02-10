Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6238A25B665
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739209838; cv=none; b=C0dNF+6ZC80gkS4zKHWozsXVoTLtYrRGt4tS0XlikCysAHLDV0XfptkAYmFFpszkUmYP3ZfdLDzY6zL2lJG0Yem+9BqheH1wz0amE05vSI1kxXCmsqMr2LEe9yjm9nqJzjVZT2B2HCsg/DVZHKa/7fiEZzdocHGlKLoMhXI0QAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739209838; c=relaxed/simple;
	bh=W5Xfglk5c7yZ3/lTqN6BaQyihdI2aZ1RG4De4M2GtaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W8JutkbnxLn4E2mQQBd1TVxTuKafOP9pT2t1ZmfCYHEnqF6VKLV/rnmbmZm96F04Ss7SBJ0s7z6rfPHtyEZOlKwGWrWdK5+Aj10JDCve7/N4KzeRfeou6Dj0CfDShspJoFBLTFHnu0ozgEaawNUjkTKO5KgevB4hXouFQSxjq8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pGRWPoWy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pGRWPoWy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9981C4CED1;
	Mon, 10 Feb 2025 17:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739209837;
	bh=W5Xfglk5c7yZ3/lTqN6BaQyihdI2aZ1RG4De4M2GtaA=;
	h=From:Date:Subject:To:Cc:From;
	b=pGRWPoWyAjBhhaa7+63szsFWen6WueXliLYM+/TcuovrQ6/TOmUe9IsDJLwVSCHsP
	 FHaCyFsIjIvfjm+/0nRbvBtD1IKO91+UxjXamni4KKQVrqnBzo7kttW27KQRgwTYNM
	 e1rKz5ex2RfziMKew8QBYguOXDIArob3iX04qeHH2lYhcbTnwmHWTBEtkdCzkf4/Ji
	 hY3qVrJPNJbkng0KOqcD9B0Naj4LG50iRKnjGQikJ7rWLsxDXNQLMAKKl3B8WS0JIi
	 +kkQ4nrVfqFfDw8Zx2jbvc4orNlmfQlr9/KVg17iY5rKQo2l0+smG5kgJzxKmTy2Es
	 0tujbSSXwg3Gw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 10 Feb 2025 17:49:33 +0000
Subject: [PATCH] arm64: Add missing registrations of SF8MMx hwcaps
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-arm64-fix-2024-dpisa-v1-1-d77f43c7b253@kernel.org>
X-B4-Tracking: v=1; b=H4sIACw8qmcC/x2MywqAIBBFfyVm3YCaGvYr0UJyqln0QCEC6d8bW
 p7LuadCocxUYGgqZLq58HkI6LaBeYvHSshJGIwyThnVY8y7t7jwgzJZTBeXiL5z0QWvvQozyPX
 KJMafHaf3/QBW3TXmZgAAAA==
X-Change-ID: 20250207-arm64-fix-2024-dpisa-635a5961609c
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1539; i=broonie@kernel.org;
 h=from:subject:message-id; bh=W5Xfglk5c7yZ3/lTqN6BaQyihdI2aZ1RG4De4M2GtaA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnqjxr1YVPIfyfzPmejX6wYEOpJwjzzzmpfL/8zXHX
 NgvdSvCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ6o8awAKCRAk1otyXVSH0OGtB/
 4/PDjh3t+kWCG4dZxEqJW8vUoDm5RRs0T12DF0lmSr/EBSeo9EO9SHNJjpQRwOK+Ug4dM50NGmZf8o
 kkKsog9JBOBfAMqgQ/zjzvt4lhgtH6PFc6JHrfbbTKAUxgk1wyl/ZhGs20l0oMTeTYnkP/UKsNL8Id
 ubtg0e4jts8QNB0hcg0dM+RFzqdmIml9WZiRvx4Rk6qWrTsDWzlxTwNyNKW18e34oS6bzi5a4hGShB
 hOXl9NxMpxQAg9tRK5DhKk6sXo5tQrS7N/wpBymqpw8Cy1IlFt7r1jUJSVyyXppv5hZ7nHlDGAkpEb
 aZJhGUvY3vVzqxRx4JCIi+DNyLVW3i
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Commit 819935464cb2 ("arm64/hwcap: Describe 2024 dpISA extensions to
userspace") added definitions for HWCAP_F8MM8 and HWCAP_F8MM4 but did
not include the crucial registration in arm64_elf_hwcaps.  Add it.

Fixes: 819935464cb2 ("arm64/hwcap: Describe 2024 dpISA extensions to userspace")
Reported-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index f0910f20fbf8c18fbeb63bcee18abf13371b1d5e..2cde1e6e309a1b840e0e8dc3a5a55f07f0aadd82 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3190,6 +3190,8 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8FMA, IMP, CAP_HWCAP, KERNEL_HWCAP_F8FMA),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8DP4, IMP, CAP_HWCAP, KERNEL_HWCAP_F8DP4),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8DP2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8DP2),
+	HWCAP_CAP(ID_AA64FPFR0_EL1, F8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_F8MM8),
+	HWCAP_CAP(ID_AA64FPFR0_EL1, F8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_F8MM4),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8E4M3, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E4M3),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8E5M2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E5M2),
 #ifdef CONFIG_ARM64_POE

---
base-commit: 21fed7c223e20e694b91dbf25936d922a50c8b19
change-id: 20250207-arm64-fix-2024-dpisa-635a5961609c

Best regards,
-- 
Mark Brown <broonie@kernel.org>


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9333C2036F3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749660824; cv=none; b=HHAOAaAxkigHuqsBqYfaO7V3ipuxGSdZ9/zs0tCNA/mSSoiG/WIWXMgBQITJWHdeb9+UxENB/YbAro0Q+Hx5/AGCA3dRDdX3zSi11KZJ45FqUBiplNK2XNYBfkb7KaJFq0/FUi/FMxtTE6Y5Rb+SpSTp2mB67DKZOIxOIfVZeg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749660824; c=relaxed/simple;
	bh=RnyH9auVBNB2aIaoFpYtwzDjMiTSZDk0KXkdiyuzoDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DTnVBrSxLe/Da0XLZfGLcWJM3wt95OmU9eBNlwO5USsy8N8iRorsZgNHbDJ+l9ZUa2hL3xCfWoQC4aZIcEjhHB04Mf1v2kqvGQwDGBLi8HFYlYc/RxoNxRwcUHh4tkMYhs8lEdem39EwMk6UJCP1tDO+uMZeU3+M+axgDjdVJ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u91w3VkL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u91w3VkL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC1EC4CEE3;
	Wed, 11 Jun 2025 16:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749660823;
	bh=RnyH9auVBNB2aIaoFpYtwzDjMiTSZDk0KXkdiyuzoDo=;
	h=From:Date:Subject:To:Cc:From;
	b=u91w3VkLCt1rlBnTOloWF8usZKzkddwlPH3q4I0GQ8NxOEU1YZUpN5F04p6sl56LY
	 TVegEtv5YIjBT/gkAbIvhr089ymt3nj2ia8wz/4AGt+1iXxn2KxijgZCeS2G6ALYSf
	 Z+q0GPPZcVBiEeuiDmHAYHTlZTK+iDMac0N3Gua+56J9bdnCkoroCgw7wExOTMSRMm
	 CO6rBMukynKIr8IkoLoQRmrhAoQwYyollgO9wZUqeUy/hGBDPZHbiPjj9gsL7UVbuZ
	 JM0KrT5rb1MLISLi4jZJksz8TrYjnHBL6JjrSvfCKWZhZ6F6aLgxQxZPCfZlIAe5U8
	 Pj7B9NZIe44Ig==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 11 Jun 2025 17:28:13 +0100
Subject: [PATCH] arm64/gcs: Don't call gcs_free() during flush_gcs()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJyuSWgC/x3MSQrDMAxA0asErStwTMZepXQhbDkWZChSUgIhd
 6/p8i3+v8BYhQ2e1QXKXzHZ1oL6UUHItE6MEovBO9+6zo1IunQNTsEwzYdl3LMyRRyIU/LU17G
 NUOKPcpLzP3697/sH2SqF8GgAAAA=
X-Change-ID: 20250609-arm64-gcs-flush-thread-8aeff2a71d5d
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RnyH9auVBNB2aIaoFpYtwzDjMiTSZDk0KXkdiyuzoDo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoSbSV6KcW+wzdUNdaAVIdHETuBky51uFryppRol00
 PuB3vJqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaEm0lQAKCRAk1otyXVSH0CCGB/
 9mEMaB4ctpK7VcA2rMXXi1cHbOgcOAf5Fy8UyDkAx+ziIJ0ALWLvuqNpcNPULbloW8eWcSU7D9qUiF
 sCoozylGtf6zJ/+nv7inDzmfKr9TKpD0yfZQnPMyWiwUtoYtpQuqqhHubFwXPOGrnoqWoYW7yj6Lh3
 gF8boGBdvG7wzcKE51zs/s2vO0W1GgTsb6RH0K9KKqOT/Y+qb/QIie/QoSercPJAd/92m7X8/PSyNw
 1JVe5y4ceEEeRlUQxY6iovKfkKnWyPTmU9pZGbS+TP8ROazpfUQe96q0JOSTvDEFt2z55Q4Q2J+pQe
 5/xbY/nc0orrDX2liWfcgXIe02LyLb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Currently we call gcs_free() during flush_gcs() to reset the thread state
for GCS. This includes unmapping any kernel allocated GCS, but this is
redundant when doing a flush_thread() since we are reinitialisng the thread
memory too. Inline the reinitialisaton of the thread struct.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/process.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index a5ca15daeb8a..5954cec19660 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -288,7 +288,9 @@ static void flush_gcs(void)
 	if (!system_supports_gcs())
 		return;
 
-	gcs_free(current);
+	current->thread.gcspr_el0 = 0;
+	current->thread.gcs_base = 0;
+	current->thread.gcs_size = 0;
 	current->thread.gcs_el0_mode = 0;
 	write_sysreg_s(GCSCRE0_EL1_nTR, SYS_GCSCRE0_EL1);
 	write_sysreg_s(0, SYS_GCSPR_EL0);

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250609-arm64-gcs-flush-thread-8aeff2a71d5d

Best regards,
-- 
Mark Brown <broonie@kernel.org>


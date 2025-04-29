Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A542A2DDD0B;
	Tue, 29 Apr 2025 23:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970763; cv=none; b=UAb60r+YFH0zlklbWiz72P8CGa8V3i/bMejRHM+mRRwYUxyPAHj1MTRCmxrDtf41HkscvihaKPyyVWXOZUSYKu08CzgG00Dl2qoIi+6xUgZ5SUplokLJyjG+y4FLcsh/N4+/aK6WGGGyu1zcQWDkeT5Bkju7YUJLJRk18CijJm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970763; c=relaxed/simple;
	bh=s/0sqpaUrKMzovn27cB+ny25J0r1MZR05Rkr7XK2SYM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZcEiTmoR8im78Vey253f7veMi0Z2BLTDQ1toBDn8ipHnwbzlicbDD7ci+WDBaTHui01WBkp7V+XPiX8Ku6k0NGHxbE/b8BGMNO70DoC4jl40DWynPMtlYpvv5Dpbmq8isx0Paqn/+AsGveo096SJSst9QHBgGqwZsSlw5TR2xms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzThpAyq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzThpAyq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933C7C4CEED;
	Tue, 29 Apr 2025 23:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745970763;
	bh=s/0sqpaUrKMzovn27cB+ny25J0r1MZR05Rkr7XK2SYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DzThpAyq0bRyS77W/aXIPMgJvthGfJfB9SZPVzlvW3xmCToPsYOnvMJUpO5616I8b
	 G8RkoSXRpkJedW1P0LZhrX7BKtynIf7wJuM+PfTpH1dmXotJaWjoZMuZSVWuzy/jIk
	 nz5vneLHsJO61R2EbQRuFVxvM2iUnkerTyiO5rkuoVPbimZrLGbFylUSyVEu1yc8oq
	 dfcTjJNem6ZgkPtKTHGbSnN1wj952RqksUEailOWqiKKG7reXfpE8Ic5HoMpTOqfFw
	 kAiRNfCDmujkYnDqRipGYtZXMCNm+j0diJ6pJBN9784mJYnvJGp3OofBfb8imBxvni
	 6G5cwQiiv2RWg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	srini@kernel.org
Subject: [PATCH AUTOSEL 6.6 04/21] nvmem: core: verify cell's raw_len
Date: Tue, 29 Apr 2025 19:52:16 -0400
Message-Id: <20250429235233.537828-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429235233.537828-1-sashal@kernel.org>
References: <20250429235233.537828-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.88
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[ Upstream commit 13bcd440f2ff38cd7e42a179c223d4b833158b33 ]

Check that the NVMEM cell's raw_len is a aligned to word_size. Otherwise
Otherwise drivers might face incomplete read while accessing the last
part of the NVMEM cell.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20250411112251.68002-10-srinivas.kandagatla@linaro.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/nvmem/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 3ea94bc26e800..3d69c76f19236 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -467,6 +467,18 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 		return -EINVAL;
 	}
 
+	if (!IS_ALIGNED(cell->raw_len, nvmem->word_size)) {
+		dev_err(&nvmem->dev,
+			"cell %s raw len %zd unaligned to nvmem word size %d\n",
+			cell->name ?: "<unknown>", cell->raw_len,
+			nvmem->word_size);
+
+		if (info->raw_len)
+			return -EINVAL;
+
+		cell->raw_len = ALIGN(cell->raw_len, nvmem->word_size);
+	}
+
 	return 0;
 }
 
-- 
2.39.5


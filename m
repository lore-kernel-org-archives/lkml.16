Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DAF2C09C3;
	Tue, 29 Apr 2025 23:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970765; cv=none; b=JKl9QnpkFe5CPqF4JTfygm6/0LZan3lSVN1SKpgsZS7u5eic/EtPBTSOvbP4WGglIBWB5f0cqLoUmgoNL8+mvxDpGFQvGvxSGKXV3U7Bh3oCpdpz3MGTCtf+AsZj4Q8oWQuK3DNkdxyARKtGjd/PzW+kFSCBPnfnYwGDJqeFMic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970765; c=relaxed/simple;
	bh=m6XuTU2X5Tie7VJE9iroXCKWCNpNe8RQUI9ctEeHPOo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hWN2AWSjDA20cc4SdiyLs3JPoRT6V74o+5uUcfYwNKK6Qdcqy8yyys3JJGMzhJQgzB8BWNPND2hS0rEGRinYkxqMIOGwegrJS6VDqBANqMIwGJ/G82H6v9Ess6hvr1iKVi8I3zUANGc722Vpq1cUT0mtejLi2F+KlrA6g5P5IIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuCy8xii; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JuCy8xii"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC21EC4CEE3;
	Tue, 29 Apr 2025 23:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745970764;
	bh=m6XuTU2X5Tie7VJE9iroXCKWCNpNe8RQUI9ctEeHPOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JuCy8xiizqrEGoSH5OLWgCaqxLCTUhhFWC8giZyJ+cYl0TNwivQJgSxwey7G7zjid
	 Kx5ux1P5W5uLblDEQcjfmeaps8FKWRA7D0k6Jq6jYkSc43oADz/J7MoB3X5Zar8UrB
	 BGjVCqNWMSckzMnHRqD79rOxdHZUQvy5+ks7Os0170cu8a+LpRQfnrLmoKqsEk9fLM
	 M7C7v2kOD801IrsVcVWSvAHAHrguhsOWMdQ0LqzG2vqN1qmTa1pYD1n58IDmg5E7yg
	 W3kpRIwxCwo8Vf8mxk/hGbCHROy9XoMwuCWXGiHuW4AqYcrOwtRBezsi06YmR1rKtq
	 SHqSv+gKxnK+Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	srini@kernel.org
Subject: [PATCH AUTOSEL 6.6 05/21] nvmem: core: update raw_len if the bit reading is required
Date: Tue, 29 Apr 2025 19:52:17 -0400
Message-Id: <20250429235233.537828-5-sashal@kernel.org>
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

[ Upstream commit 6786484223d5705bf7f919c1e5055d478ebeec32 ]

If NVMEM cell uses bit offset or specifies bit truncation, update
raw_len manually (following the cell->bytes update), ensuring that the
NVMEM access is still word-aligned.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20250411112251.68002-11-srinivas.kandagatla@linaro.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/nvmem/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 3d69c76f19236..dd00cc09ae5ec 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -456,9 +456,11 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 	cell->nbits = info->nbits;
 	cell->np = info->np;
 
-	if (cell->nbits)
+	if (cell->nbits) {
 		cell->bytes = DIV_ROUND_UP(cell->nbits + cell->bit_offset,
 					   BITS_PER_BYTE);
+		cell->raw_len = ALIGN(cell->bytes, nvmem->word_size);
+	}
 
 	if (!IS_ALIGNED(cell->offset, nvmem->stride)) {
 		dev_err(&nvmem->dev,
-- 
2.39.5


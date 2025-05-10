Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AA71E7660;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863109; cv=none; b=Ao7uvsnrRIFVbTSVC6a/EEJm46fpaTdf7S2AtWpoChFr5pw8In81CuaSRI98QTsg8eq0O/o20axVr7VMdWjgiy3P3oWSRz6mKcJSnuw2rBDlNDknBh7GBHV+z8p3QCQy30KHH4aTb789kHigucM88vYPrPtc/RdFiG7rW7LDay4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863109; c=relaxed/simple;
	bh=GQdySjnU/U2AKITWufHtvENXM8nduTjgzWyCaiFQeTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AEMt9fRsdJv0V9vkCL9PEXHU7MKVd94prC7bFIivEDZM4Ux4OV6WRYTL6MaCXsNJgkzyBnGItSB/uZDRdzk+y2cjxLcDTPobeIuYwGv3REEYSlXj42dDN1JgFhZyrhbOIhll/qloMr/SctkrQm50aw+OW5zMys4/0dBQCWcACvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWVyvLOb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWVyvLOb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F06DC4CEEF;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746863109;
	bh=GQdySjnU/U2AKITWufHtvENXM8nduTjgzWyCaiFQeTs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lWVyvLObDxpwcHwEzTI0jBgYFiEGQK0JqbemVp5GK9gwcnKcAQjDTyS6IKLB4WwkP
	 gYLkGh4ePlFwykb3i7KxYTjzakN3vjZXA0vJpCNDct3KLqQiKOsTGbYjFRCd2Cyc3n
	 xXWnyPgM+9hH/p9oO19Zhi+1hQN+qknB34QQta2cuo61jXEbRwimQz4HUAINFoZLOt
	 iEwjhJi3f/cTQG+9cKavHU+oL0l+WTv5HKsJ7Yu0FOGFHsFnMWC035UiXYI8QHRn/o
	 sc3lPzGGzxDm+9DwOvlpWSoyD9l7RTglE45vaMxyPnHtvH9bStsv0ObnA6C1k4N4A9
	 tWW4kCisDxAYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004CCC3ABBE;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 10 May 2025 07:44:42 +0000
Subject: [PATCH 2/7] nvmem: core: round up to word_size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-nvmem-dt-v1-2-eccfa6e33f6a@svenpeter.dev>
References: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
In-Reply-To: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=H4fL+CAaJi5RsVSWx0aHxTvxkzr7MJNevpfVzdnrUaE=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4Y8879pU0vbs4VO/5ijucvz2QEJ3lUxMZOLLk9YufX/+
 XpJM/+nHaUsDGIcDLJiiizb99ubPnn4RnDppkvvYeawMoEMYeDiFICJ/NRj+F/vJXd5iYrr0s4d
 M34U/TTJDHolWdu+20GUVeDk/stvgr4x/A+5W/zSJJ9N6c8Etdg/UqW8ebnKszftrHz0/Up8hcZ
 HGwYA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev

From: Sven Peter <sven@svenpeter.dev>

Some nvmem controllers like Apple's eFuses or Nintendo's OTP have a cell
word size that's larger than one byte and cannot read anything smaller.
Round up cell->bytes correctly when accessing a subset of bits.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/nvmem/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 1bd39b12c21a86b9b135be95251a52a10543c2ea..02081c93fa467e5448bd78a4920072d437365fb9 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -595,8 +595,8 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 	cell->np = info->np;
 
 	if (cell->nbits)
-		cell->bytes = DIV_ROUND_UP(cell->nbits + cell->bit_offset,
-					   BITS_PER_BYTE);
+		cell->bytes = round_up(DIV_ROUND_UP(cell->nbits + cell->bit_offset,
+					   BITS_PER_BYTE), nvmem->word_size);
 
 	if (!IS_ALIGNED(cell->offset, nvmem->stride)) {
 		dev_err(&nvmem->dev,

-- 
2.34.1



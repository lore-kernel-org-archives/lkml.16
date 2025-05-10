Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4A41E5B65;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863109; cv=none; b=dJQBfsdTnSg9stvenLoDE4dTbCosuNYWNtjbyxH+3K869I29gWrB87a3/UvuMcTq9PuXeoI/5m8I/TpE7cF6YDxRt2H81qciggBnmMabwEu4QtaAgFPoE+WTsFvUpLtiWWZW92eZDDd6kcGHyV8uvgE/z1S9sFGjue5QcaPhwPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863109; c=relaxed/simple;
	bh=8+87LojQGyhr9E2+FPjQbHUWYlFaQtWgj0ictMi28nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLVS/V48SGU+P5eAFKUgATPP1Q0YiNgCInwIoZr01BCudYWNRr9/Ef95hW27cb4g1G384oqfWaxCljOkYr2tVTSyjl1vci2e5eVwBQwT0C4FYN9JZvWiYpeqPC8XfRX6nrNHVUbOZ9CmKHuy6J0TQNH/84InOb3gCXZfDxf2lFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HAhp8Lqb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HAhp8Lqb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03391C4CEEB;
	Sat, 10 May 2025 07:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746863109;
	bh=8+87LojQGyhr9E2+FPjQbHUWYlFaQtWgj0ictMi28nk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HAhp8LqbTFplQycwz1yVu0Ceeghb0EqTJs1v/5XtBYBLpZon1iElFP1oBgHHJnGHr
	 2tfV4rHZEEHRe7g+Dw1sqxkmFaUJKAnwyFxeFCuG8twWk1eAVWxCyZmwZ3m+Cn46Js
	 YCfWL50FWLogP/fmqI59oo9Gy4hWLRylobKvLPBLH23O5xQmmRskTXT1YmWvzSx3xq
	 ivUapzgFt0eBQ4qeBVzPc6xM/A5qwK4GwXkdnWpJuDqIr8TA9Q2tELHVByACGkLYQc
	 FHkNF4s5q9DXubLJLXgz3El73qtVkO8UXcszvMXpMWTy1pCeDNROlABPw6yJgxWJuV
	 kTN28is82/ZSQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F93C3ABCB;
	Sat, 10 May 2025 07:45:08 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 10 May 2025 07:44:41 +0000
Subject: [PATCH 1/7] nvmem: core: allow bit offset > 8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-nvmem-dt-v1-1-eccfa6e33f6a@svenpeter.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1784; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=Y1TJPt662hBSSQOfCJzcnzeri1OU9vTgDvhNcwok9XQ=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4Y8898N9vGOPA/Zt0rMKM49cd4yx3GNKve5jXN8TMvmB
 hRYX8nsKGVhEONgkBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAEykz5eRoe33tMU7pt845v/O
 Y+n/LL8Vu7m0ljOdm/M7Lf5KVdnmVYsYGVp3fj/uZRiudHU/96KAYwFLe5U2KuxavZ9j74HS599
 31bIAAA==
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev

From: Sven Peter <sven@svenpeter.dev>

Some nvmem controllers like Apple's eFuses or Nintendo's OTP have a cell
size that's larger than one byte. Consumers may however still need
access to a subset of bits that start after the first byte.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/nvmem/core.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index fff85bbf0ecd0f638e21f127370105d9f79c00d2..1bd39b12c21a86b9b135be95251a52a10543c2ea 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1630,15 +1630,24 @@ EXPORT_SYMBOL_GPL(nvmem_cell_put);
 static void nvmem_shift_read_buffer_in_place(struct nvmem_cell_entry *cell, void *buf)
 {
 	u8 *p, *b;
-	int i, extra, bit_offset = cell->bit_offset;
+	int i, padding, extra, bit_offset = cell->bit_offset;
+	int bytes = cell->bytes;
 
 	p = b = buf;
 	if (bit_offset) {
+		/* Remove any full bytes at the beginning that contain no bits of interest */
+		padding = bit_offset / BITS_PER_BYTE;
+		if (padding) {
+			memmove(buf, buf + padding, bytes - padding);
+			bit_offset -= BITS_PER_BYTE * padding;
+			bytes -= padding;
+		}
+
 		/* First shift */
 		*b++ >>= bit_offset;
 
 		/* setup rest of the bytes if any */
-		for (i = 1; i < cell->bytes; i++) {
+		for (i = 1; i < bytes; i++) {
 			/* Get bits from next byte and shift them towards msb */
 			*p |= *b << (BITS_PER_BYTE - bit_offset);
 
@@ -1651,7 +1660,7 @@ static void nvmem_shift_read_buffer_in_place(struct nvmem_cell_entry *cell, void
 	}
 
 	/* result fits in less bytes */
-	extra = cell->bytes - DIV_ROUND_UP(cell->nbits, BITS_PER_BYTE);
+	extra = bytes - DIV_ROUND_UP(cell->nbits, BITS_PER_BYTE);
 	while (--extra >= 0)
 		*p-- = 0;
 

-- 
2.34.1



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330A8265CBE;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861260; cv=none; b=VbyhLt7CMBGQbGuto50fLey/AWYVp47iZZmnZH9VxDG6O1Mzbt1wpYpJzH+LVUb22H6WZxupIshnuTS6MYZrOl9tgISWce0JWZ51mxvvN8y70CEqhbDrEUNKiMlB00NZLgOhXBw/Hiuv95AwqF29TrV3gniAqxWzVJTQsukBYwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861260; c=relaxed/simple;
	bh=IdkAyRPazTQAAsOxhm5SnUrAbQOii+a0gCXU9wFfUG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iH7THjfdLMfE8ikeoA1OmS7CGYU9TRev1RK1pWsDr9FYNIMX3u/3w7YHHZLf3VJyXIr7OKSz5BWwhJzMsc98c83YzagoHjvaqivngYF1u76pMGsMdUS5kHSZgCs0whCqrDpeZ8Mq/KfIQsB5dm1/2kBCcdGqiIoJfM19Az0i3pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rvOjBZOB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rvOjBZOB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8E3FC4CEF6;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750861259;
	bh=IdkAyRPazTQAAsOxhm5SnUrAbQOii+a0gCXU9wFfUG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rvOjBZOBmfMmqRPKiOAKQTC0hFb3FygpSI3wKZzzWuUPNcuPyxBvyLmaLFmJ0wq1e
	 hwY5kZeBIFiNWQFr+mtws+j2Mk1Y54XtLsT8aTzPZ9f0GtK43oKE/mwRta7C2QPfWv
	 4KjJZouymgDF0lGn3wmbEjPUn14IVz8POE1S2+E1THqdoHnY49hn2RObIi8FzJUF0w
	 8g4woFZT/ybEtLgnazg5DPWtvfX9VpJs6vzak420MYf3G4lBoXZzlRBbvq2wzie+l/
	 d3l+GVrte1OvnWUlHUIvTqiB2nHXn6Ts5uVCd4ZC+RDYs+urCAPpb/cXcBgbdB5Krb
	 +qRErtRMfcaow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977B3C7EE30;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 25 Jun 2025 16:20:58 +0200
Subject: [PATCH v4 3/7] riscv: Add xmipsexectl PAUSE instruction
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250625-p8700-pause-v4-3-6c7dd7f85756@htecgroup.com>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
In-Reply-To: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750861257; l=1045;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=H0DxxoGpB6+hFMlnoBCgKy/YEJN661bNeg8dzqTTc9Y=;
 b=j7mQ6M5PdjVnNF0Zd2eESw6UiAPu59p74ZSfKVOFi6F9oGfE+2+5A6EVzEf/XaS+NC9vhT0Du
 XMLyI4dbDM9AoC8vs7d+rXKvwQOcX3466I12/JDG/c8n/dmgsVwKKJ/
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Add MIPS.PAUSE instruction opcode. This instruction is a part of the
xmipsexectl vendor extension.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 arch/riscv/include/asm/vendor_extensions/mips.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/mips.h b/arch/riscv/include/asm/vendor_extensions/mips.h
index 757c941cfd86e9fced6169b1a82200e6bb5c6132..f8eca0bcf53e2de1bbdc66821fe95987105ed85a 100644
--- a/arch/riscv/include/asm/vendor_extensions/mips.h
+++ b/arch/riscv/include/asm/vendor_extensions/mips.h
@@ -13,4 +13,11 @@
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_mips;
 
+/* MIPS.PAUSE is an alternative opcode which is implemented to have the */
+/* same behavior as PAUSE on some MIPS RISCV cores. */
+/* It is a ‘hint’ encoding of the SLLI instruction, */
+/* with rd = 0, rs1 = 0 and imm = 5. */
+
+#define MIPS_PAUSE	".4byte 0x00501013\n\t"
+
 #endif // _ASM_RISCV_VENDOR_EXTENSIONS_MIPS_H

-- 
2.34.1



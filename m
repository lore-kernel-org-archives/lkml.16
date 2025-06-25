Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ADC264A74;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861260; cv=none; b=Di2UldZrYpgFereibpCjUi+8M6/v/U49iHsMBSbDoKhc+WmnziCLZgLvmpDb7Q9a0Bz2iHlmwGWt37qDw0TcexcZZYKz+yV/Opb4I+7xrM7qYGSuZP8S+SvwwEnNmjA66A2DsA7YpMo1PwcTckzJUjRwCoc9LFQLeygqykeCH3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861260; c=relaxed/simple;
	bh=GKbzOIdtzFvop5ar2d9+3emwLLF5QXNzgs6b3CUkOPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AIvTX2dyd0fLJmp6yQETGIgM2H8gUsteCE/9JtBbsHCGRAIrD+/z6bFycPxwxkzt7mICO/HU7xT2OYu0yujq+ndHb5QgG4VH6V41ZWGAFNSF2sVudreXoOd/VHvWgxpheUJtoqf/i/vAMJJHyxDrxVH2j3AsLx0DeOiHxRjJ7Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flDlzeJn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flDlzeJn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91366C4CEEA;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750861259;
	bh=GKbzOIdtzFvop5ar2d9+3emwLLF5QXNzgs6b3CUkOPk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=flDlzeJnraRftrK84Q+l68/q/JKOEfSgZhA69SlgO8yO+F9A1fEf7ng+zjIViJzs7
	 ZA9xWqh9g40IUaVwyRpV3XOzl00L9NIvk/0hhnsrxLvRpxqQrR2TvtQ6Bt8fUxCWCB
	 hL/0es/zvq16yRcaRGV6X5Te0cpG7lJ81cR0VJQ6olIXCtNIK91TB7YcgFTvT2LkDy
	 C1vzQW1Ev4O7Ki8iv7RM0d2QARCni3nXLyRe1I5wdjhl1oVvH7hvjabf5wQ06fXTxZ
	 qKHPOgp75vG4+ZhvpHi0FbWejHOBxx1nFrYKzY+sKh93l1mu3oBoUGgbjlTRo7vetE
	 0qGeMVrsWsHNA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C42C7115C;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 25 Jun 2025 16:20:56 +0200
Subject: [PATCH v4 1/7] dt-bindings: riscv: Add xmipsexectl ISA extension
 description
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250625-p8700-pause-v4-1-6c7dd7f85756@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750861257; l=1302;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=h13o/f46vhfOxj3D4iHSUN8apIuhKjiCZWPiTgA7Dm8=;
 b=bybQmtA8JYGfk8SiLTuOilDEXK5tT9xmFca05oXB0CyhBAtjNDrFXIGgHUHKdAijZXjcbV3p1
 JgyhwV4egd+C8PDaz7ap5wnXKVTad51WO59WymZenWRomONPsWUPyfr
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

The xmipsexectl extension is described in the MIPS RV64 P8700/P8700-F
Multiprocessing System Programmer’s Guide linked at [1].

Link: https://mips.com/wp-content/uploads/2025/06/P8700_Programmers_Reference_Manual_Rev1.84_5-31-2025.pdf

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ede6a58ccf5347d92785dc085a011052c1aade14..de41a6f074d3af2ceaf5293dfe75d16f43d416d6 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -662,6 +662,12 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # MIPS
+        - const: xmipsexectl
+          description:
+            The MIPS extension for execution control as documented in
+            https://mips.com/wp-content/uploads/2025/06/P8700_Programmers_Reference_Manual_Rev1.84_5-31-2025.pdf
+
         # SiFive
         - const: xsfvqmaccdod
           description:

-- 
2.34.1



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C197265CDD;
	Wed, 25 Jun 2025 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861260; cv=none; b=BN9lSM531+SANoB1BZYHz8Wj75762WF3tbsVL9+TScPqsx+hG2cSVW4l1YnaLGJWGgnWu/ocS6PCCW1cJ0MWWyHgyErZzad7BOJRi6Fs0Fp+oQfn7oGOW/XGpb7zbN02bIW8iWeUp4Pm3kzlA6Ch6qsRvucUaQnfcgW66f/CPvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861260; c=relaxed/simple;
	bh=MUzSQxk+uv5LHDef99dQW3jjbO9uT/OkYjA1LD8vXs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lDobcqfihb+mAWpBXDuqMY6R3fPCS5r+wy/8CyRPzpMrZAOcCDh9bKhbRpzli9lCTSC4S4K6tfhpLNqiedevCRwPUOOYcy8OJfzTKyHwmONfTyKSPmhO8bQyx0mse8t9W+7P6fO+C2fynn+8QiGmB9LT25C7uUE4hQIgfZ2qf2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFfCTGzv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFfCTGzv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BECA8C113CF;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750861259;
	bh=MUzSQxk+uv5LHDef99dQW3jjbO9uT/OkYjA1LD8vXs4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oFfCTGzvb4Bl6w9ywnJZTx1aXzKR3gwgfv6u7wB07Es6QWTqfqW9cRH/1PgBL4SFk
	 bZQ+htWAiQr5A1sViXdUafNvAb0O+Sx76eUBxjKI8+HZ0UJ69fcm3tM+dsTpEV2D9H
	 e7vxu7gyunNTk5Oqn1Z12BoqJMKt0S/GlgO2wACq4mbjvm8S5M1NJPQ1q3nidVHXU8
	 M/bBj+6Bay1xKMFEI7vLhTNr4ViVwhkqYvTRoQilDRqmfjGtQ2T2zn5Y6aj6zu45r2
	 PX5BuYLc0XusREkesoIiBC9YvcE+drO5kpefQmSbYJHzUHWjtd6Ob8v6JKSyux2Enl
	 uYfg43FZ99/4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4976C7EE3A;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 25 Jun 2025 16:21:00 +0200
Subject: [PATCH v4 5/7] riscv: hwprobe: Document MIPS xmipsexectl vendor
 extension
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-p8700-pause-v4-5-6c7dd7f85756@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750861258; l=1433;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=ONKDrupJVIvTuOPl4HYtUjJG9+vS9PioyKkmG/eBvIA=;
 b=lB3maqHxBHGl1G03VPK/N0rQBhStz3QP5CAL+JiHBDDtytrfEuPLDlOiUTcZ54+Wunt80Dc/n
 VTN80isflIeA6/Zvx9uUZq8VhatdJ0LTU1vbFSaPLzkjJx/eqQBSufN
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document support for MIPS vendor extensions using the key
"RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0" and xmipsexectl vendor extension
using the key "RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL".

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/arch/riscv/hwprobe.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 2aa9be272d5de1c15559a978a956bc36c34de81c..2f449c9b15bdd6b9813c9a968deca1a4c4ff9b14 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -327,6 +327,15 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED`: Misaligned vector accesses are
     not supported at all and will generate a misaligned address fault.
 
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0`: A bitmask containing the
+  mips vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * MIPS
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL`: The xmipsexectl vendor
+        extension is supported in the MIPS ISA extensions spec.
+
 * :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
   thead vendor extensions that are compatible with the
   :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.

-- 
2.34.1



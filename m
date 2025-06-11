Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3492719A;
	Wed, 11 Jun 2025 21:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749676073; cv=none; b=M/XrbFHxXlSCmSv4cLfHBRx3+H/Uar8X6YFqzfXNDKnYDHhe5nIwcsFlEL6IuoQjJ27l9i9SigYXQvmZZI0CAEppEJZOIjYQQYAvUxsQP3U0LuSszX+K0AqJ1lKmpuAfK+OTHUGvl8IK+ieqUDNqnKM87ZAkGrODyINpQ6ZlDng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749676073; c=relaxed/simple;
	bh=YkZnxUHC6Pl47YE27YCJbGhgb6aZZ5MzUw6WcQieAqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JcNkWxvA7hRTyx8xsqsJXXcP97jmb4qbWo87qlV+uze0qzYMfysR4wsaYjgG7p4P3AdM4t5glbKHt/uxTF2i8Wgv50y9b6llfw3ptrVSeRJOyNLSCPv36Tlngyxb5KgNZVHEZWTmlFBXA71utGfvNQZ/j4vs1BVbsXcUc733+Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojIztc+P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojIztc+P"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AB6CC4CEE3;
	Wed, 11 Jun 2025 21:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749676072;
	bh=YkZnxUHC6Pl47YE27YCJbGhgb6aZZ5MzUw6WcQieAqo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ojIztc+PjX/SypBj9FTuV/zD3FsFQ/FHLqOlWXPCuV7fAPnuRpqNX43PHeH6moxxI
	 AEmXNmMNzeQBofttm4s+DrWQCA40KNZkwcDBsmEFn1gGGlFB4Xo+p3DeNvbcezR6cH
	 10HCr+P+wRJSTtArrdHkC9doXEFSH0bIwFju/kQBOE2rQ8FvIpJ+w6qx6JbVl74rhY
	 f8h+oDBHHPVSrtt9pSN1VkpklyNqQ+JaWJp9of4WpC4KhM1C3zEb1RSR1/pi2gFAiU
	 sYYo+r3ZQycAamcvFzgaCyokXdrDihBdvYyEq1geTfWUmgx54vOxVbYbWkffJxooK9
	 rQPXCoOvGVMag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BFCC71136;
	Wed, 11 Jun 2025 21:07:52 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Wed, 11 Jun 2025 23:07:49 +0200
Subject: [PATCH RESEND v2] powerpc/microwatt: Fix model property in device
 tree
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-microwatt-v2-1-80847bbc5f9c@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749676071; l=989;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=0awhdLFMY97nl4C5F/YShrc0qAsdI3niSehOCyjeP30=;
 b=ZMOkaTWiJOp36wFAV/SY2jnAnp+AZyYy2CRFTJPmh6K0/aofSEgV3b9vN20mTvwv9m1LN1z9J
 q8O2aN8AgxTAYFK/ucjfyFYNO1QFYmpzpBIryCvniX3UPgmg6ej1YFh
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

The standard property for the model name is called "model".

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v2:
- Rebase on v6.15-rc1 (no changes except line numbers)
- Link to v1: https://lore.kernel.org/r/20241225-microwatt-v1-1-8e071fcfc2bd@posteo.net
---
 arch/powerpc/boot/dts/microwatt.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
index c4e4d2a9b4606a689e3f9eefd1ca5bcf1aa3395f..b7eac4e56019eaa84d8afe70c639f2112defdd7d 100644
--- a/arch/powerpc/boot/dts/microwatt.dts
+++ b/arch/powerpc/boot/dts/microwatt.dts
@@ -4,7 +4,7 @@
 / {
 	#size-cells = <0x02>;
 	#address-cells = <0x02>;
-	model-name = "microwatt";
+	model = "microwatt";
 	compatible = "microwatt-soc";
 
 	aliases {

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20241225-microwatt-d9258189aff5

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



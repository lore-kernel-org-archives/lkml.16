Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C802C282F0;
	Sat, 12 Apr 2025 13:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744462876; cv=none; b=rKj2Di21xHNuNzWBsepDVIBGjUZ0nhMWg/6cEvPs3g82QWpiyvKrKlae9PA1uxZpZcyo3zV0T0DxvnqWJL4nFEDDYTomVYUjYJ0ZIWzBg1G2pUS07K3uLst073fR1g53amvb4so3/6qv5iTZbWxBm4eS8SxreJeR38ZrlJIfhZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744462876; c=relaxed/simple;
	bh=YkZnxUHC6Pl47YE27YCJbGhgb6aZZ5MzUw6WcQieAqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DDSgbYMITnCtjrLvJzHt1E0hBFJ40Zr9S4aCrGvd7CpXkgmPCJsBArOd1QlUgFsVzl3gSVieh/wfA3mTAe8q/Xe4/1r1lvCTbwJO/e0e014911UnIpueLEQpRIuWPNU9bvh+Doys/aCjtF4I60YCvGdlqRNurACKjXH+CCQk9Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZX8TTkrn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZX8TTkrn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F3A2C4CEE3;
	Sat, 12 Apr 2025 13:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744462876;
	bh=YkZnxUHC6Pl47YE27YCJbGhgb6aZZ5MzUw6WcQieAqo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ZX8TTkrn/bN/nL7jKF9tAvHS2UYiWesIjPHeh6EvzIHGu4xjSCa7C0KHNYNN6F42l
	 BLMtS4IbDch60vrHjHtlc8hlhRrX28kNuFAB39TXDMAw4Qra3crvqtHpBLFsfQcKra
	 uMnW4IePAcn6GfecaI5gl/2LY6Y0nodr1N/niv3FoeTgmCxgdBOZpsQdwFm6DlQz8l
	 MUlNWecdY92y/RomGyJT/LQo69XKvzuYHiWM2aA1ummaZUiD+FSXCFdPcS97M9RYiP
	 vi1VOzQ5hog7p5J1BNb6ce7BwtmoXba2ibWLQwEiA8u+r+GGA7GNhoqfV30uyaJzAe
	 JBniG1FJO6fMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D59C369AE;
	Sat, 12 Apr 2025 13:01:16 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 12 Apr 2025 15:01:13 +0200
Subject: [PATCH v2] powerpc/microwatt: Fix model property in device tree
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250412-microwatt-v2-1-b7b9e376c8c1@posteo.net>
X-B4-Tracking: v=1; b=H4sIABhk+mcC/23MQQ7CIBCF4as0sxZTJhKpK+9hukAY7CyEBghqG
 u4udu3yf3n5NsiUmDJchg0SVc4cQw88DGAXEx4k2PUGHPEkEZV4sk3xZUoRbkKlpZ6M9wr6f03
 k+b1bt7n3wrnE9NnpKn/rP6VKIYWm8Sy99Rbv7rrGXCgeAxWYW2tf39K/ZaMAAAA=
X-Change-ID: 20241225-microwatt-d9258189aff5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744462874; l=989;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=0awhdLFMY97nl4C5F/YShrc0qAsdI3niSehOCyjeP30=;
 b=AJkLGPu4bDJCFRhuQWdrlPSic38AcE1x0aY+UH23rpWQcoqHRfkEj6FCMSdS6585Bjj7pH5cT
 2qV5bNEKZvjCb6/y0cJzatYQP4hTneRSNHX6f7+oTuY3kw6DlTxvqR2
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



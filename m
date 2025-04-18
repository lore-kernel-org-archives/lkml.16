Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF1822D4C5;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745004549; cv=none; b=Ye/Z8oaD7RrWGYiiaw2BHkzmbryR6oyM1bIk3DtBV9qdFkRv10O/XvvmM63VzTnsaIJ0DDT3namnHoQt8p8FAQw01fU6o7tnTsGJT/QGEJQkk7mehecDtMHD5UFBDAEkcMPg+T2Q+yRNQnSwn6J+pzHUasqF1P1al6EN0tA1sKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745004549; c=relaxed/simple;
	bh=NxkEtHQBRfnIH+DR0hayVIGJz1fpFnQO9qKD9GadGHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pt/1h+epcqc++hoDFnq+j+4KyBJpj0fMQyYvjw0Fz16rKCuHeNmX3spgeaBdPPiRhOZj/NknQ3p6wUGkleJ3Nog2cYKgj8E5aq2WDql2ctHVW747yMRHqBt2pfaH1fzQGxMeMmoWJ6SyKr8+F8SEP7NWcGqCs/X5fcSlLewpKwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRYiExZB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRYiExZB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8DE5C4CEF2;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745004548;
	bh=NxkEtHQBRfnIH+DR0hayVIGJz1fpFnQO9qKD9GadGHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bRYiExZBcRgk1iPuc+CbxLFS6NLTB3yQbafBzomlutwujMfFAutBTmjT22jaTqhXK
	 YQG6ziU7bX5qFpt6el/CnHTKqT33bcAuHbw5yZK2YF+bYOQ+OzTnJxsbzbkVcGScDP
	 ROEVz5WI4/jv86BbUgBhj3GP5IF/uoFLHYxeOx5brPyFk3DmKCtI8c39N30n8rLMLo
	 Hkfvy/uqKLD7A+LPLRoGujMh2AZ3k3CdmUyCLiGy49fZwuLm+7LMEtKhpTN8HriXls
	 MEDuoiwflVR/r7QX3C2ZbSu61Oxxz6NJ3Q+ngNu2e+feV0Hmc1hUmMn9HLYjHls6se
	 EiK62bS790HcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA12C369D2;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 18 Apr 2025 21:28:54 +0200
Subject: [PATCH 4/4] powerpc: p2020: Rename wdt@ nodes to watchdog@
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250418-watchdog-v1-4-987ff2046272@posteo.net>
References: <20250418-watchdog-v1-0-987ff2046272@posteo.net>
In-Reply-To: <20250418-watchdog-v1-0-987ff2046272@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745004545; l=1065;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=Jfd85PbJEHShQtp0Z7D0ENH84wB5WrTefZVsj2LtPg4=;
 b=9Ddx++hJwjUu5ZT5RcAMKL458F4jL4oZdbNqUIm8fWLxvPqyPovL1NfQreYYdr5rYTNz/J468
 Kbeijo/OUapDOomDiJYvXXiMNPWkdWwcCjdtQrbm/WLjITPmZiWBFgf
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

The watchdog.yaml schema prescribes a node name of "timer" or "watchdog"
rather than the abbreviation "wdt".

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/fsl/ge_imp3a.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/ge_imp3a.dts b/arch/powerpc/boot/dts/fsl/ge_imp3a.dts
index da3de8e2b7d2c55cf735f3cfdef8729655979a06..9e5c01cfac2f8ad93dfa3b33d05b3ad3331b2c76 100644
--- a/arch/powerpc/boot/dts/fsl/ge_imp3a.dts
+++ b/arch/powerpc/boot/dts/fsl/ge_imp3a.dts
@@ -94,7 +94,7 @@ gef_gpio: gpio@4,400 {
 			gpio-controller;
 		};
 
-		wdt@4,800 {
+		watchdog@4,800 {
 			compatible = "ge,imp3a-fpga-wdt", "gef,fpga-wdt-1.00",
 				"gef,fpga-wdt";
 			reg = <0x4 0x800 0x8>;
@@ -103,7 +103,7 @@ wdt@4,800 {
 		};
 
 		/* Second watchdog available, driver currently supports one.
-		wdt@4,808 {
+		watchdog@4,808 {
 			compatible = "gef,imp3a-fpga-wdt", "gef,fpga-wdt-1.00",
 				"gef,fpga-wdt";
 			reg = <0x4 0x808 0x8>;

-- 
2.48.0.rc1.219.gb6b6757d772



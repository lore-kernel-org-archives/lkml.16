Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEAF214A7F;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745004548; cv=none; b=jDMpHkOwVJMMY/H4EVIq/sXeZyHDdX2gGnbgAJR6IBye39MnMN1znDRZ5flxke4Uiidj7d8/xtbsG4Oc6IOQ9s3gIqEnV57av+5f+jfgE5s0xWG5c9xH9Wh5WpeH8gugQXmeuGgGT7i7X7kHWZCcqK2PEOZ8FxvMk1qFOGDp0qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745004548; c=relaxed/simple;
	bh=6ClBny2hXCsMRYQ7f0lE5ORtGy+uyLBVWO/aVFXxQMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jGN7A6Kw97+wjJx5Fl+BVQs6VQzKnGARsZ+u8sVvXwNgWD4tRah5HM5Q/wS5aGMW/Rkm9ZhAU1OFLe/LY4uzmWSWkvuKHawAjV7SbwkWO69sECDMarqCyqHDyvKX1t3jbmptpItQ8ykWYoG8LFgDscIHIPJEjwXHya8i9tBehcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWm9ajRa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWm9ajRa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 805FAC4CEE7;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745004548;
	bh=6ClBny2hXCsMRYQ7f0lE5ORtGy+uyLBVWO/aVFXxQMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gWm9ajRaJykk1VNCrNho4UpuXChjkTGkcuQy6Ryv9CvV2S/wJQra+KUeRtFbSGjOR
	 TyoLXZ0zcYGQ3YMPUhRh6MoyAQxEG0UFfdZ4Umgt+Oe29YJS1poQjvfjQnAOqyLlHt
	 TBvRIYHxgEqFSPMGKro1NbKN18Qa7RrRhU7R3FEMt0iBBYD4UngRauRAa3YPeIakKQ
	 h2RwcEizCWCs861PQNdX99rXCGtTcPwf+J4D3f/IsvkCxOTAuGq63iRnTi2aZ2uiqW
	 77tjGaTvIsO/0+2O3FewNQSGSC+gUbAfNrxquUYgIKYoYUKJhJ1Szm133HahVY6IEk
	 tq32UjlVRWZVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731E2C369CB;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 18 Apr 2025 21:28:51 +0200
Subject: [PATCH 1/4] powerpc: 512x: Rename wdt@ node to watchdog@
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250418-watchdog-v1-1-987ff2046272@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745004545; l=756;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=i9RRcgFgqG7vVmSK4gfLWPx1rqQqfqMd2ZucazKYG/I=;
 b=F1LooNULEUf7uRf+8ft+DzMgEvMttxjoQo/CjBcTZ897BrcwUTqMni/4/CpJl3ZpI1bNTsy+q
 eJkxXaXipmyBNkxJvVIDt8R1Mk0lODMfG2doascTzJ2emZYvqHgQyMz
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
 arch/powerpc/boot/dts/mpc5121.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/mpc5121.dtsi b/arch/powerpc/boot/dts/mpc5121.dtsi
index d3fc8062fbcd7b959a7edf17c8e9a28086034d69..a278fb7b9e71182582f658b30c2ea4e962edd7b7 100644
--- a/arch/powerpc/boot/dts/mpc5121.dtsi
+++ b/arch/powerpc/boot/dts/mpc5121.dtsi
@@ -112,7 +112,7 @@ ipic: interrupt-controller@c00 {
 		};
 
 		/* Watchdog timer */
-		wdt@900 {
+		watchdog@900 {
 			compatible = "fsl,mpc5121-wdt";
 			reg = <0x900 0x100>;
 		};

-- 
2.48.0.rc1.219.gb6b6757d772



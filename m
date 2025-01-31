Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1EB1F4E50;
	Fri, 31 Jan 2025 21:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738357737; cv=none; b=BIQhEFK86u2NED7rr7UQX2qyG7hBco1X8Qdm9wzGR8YhAgCJDIPWa6NQdvJbOj6JMXXaIUqU5dq812hvdTq9Xg0q/tXHPQAz0oJz4Vj2H2NSTeDNMHmYpoSnd1OexVntanNDxQ+eMO9a8rx/7jIRp6NHiBdDIJTmXL0eyJNxlEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738357737; c=relaxed/simple;
	bh=JiQ9WBmvrNQ9x4NMLYax8YWwyVUnldYxerF00xmFMyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QuImxTS3+GYGY0tDGzPKJU8ZBaA0J+Ri4AKychsQ9250bhzAsAyVgZ7Xttnw/uZDBiialpfl4lL5UJLqfzYKcIBYLNHxycjAhoOW9SGFlntoMKBPbBiZIo7gTr9Au4yue+VVXEyehrAjPN3Yw2Qs/oJzv6bsz1EHF/J+bEUzfIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXz6RVMI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXz6RVMI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FABC4CEE5;
	Fri, 31 Jan 2025 21:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738357737;
	bh=JiQ9WBmvrNQ9x4NMLYax8YWwyVUnldYxerF00xmFMyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JXz6RVMIJK+JHZX+7RYvJ62oGvLA1lWYg0h4VNHnSlBA3x5Q0Wv9n37/HuaSsk4VA
	 AtsScPkCEFELwmyiA0oWQgho4JzrOHSWC1HJ3h0Tn67ZzMbrhH2Rc9cPubGmA3RiYd
	 CKVvWIGC+WoIwfxc3+yo4NEAJnuYJaP9HRSDCAiAMFHcZCLPt9OlC0cft8z8Axy3Ou
	 My4Ey+8qpJwzqtqD5BQ4ceW+ndrPmyH5EiOHQ1FS4WAyUVHpb/VhR6AudR1IrYODMh
	 R/fxT814MpYGlVfdc7xhTy7re467rWUnmiVs8GJig7vRtv+e0vu6/rhdPBLU/RWCGX
	 YF17LZgxKVe9g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 31 Jan 2025 15:08:30 -0600
Subject: [PATCH 6/6] arm64: dts: marvell: Add missing board compatible for
 IEI-Puzzle-M801
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-dt-marvell-fixes-v1-6-55f9f6acd4b1@kernel.org>
References: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
In-Reply-To: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robert.marko@sartura.hr>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev

The IEI-Puzzle-M801 board is missing a board compatible, so add one.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
index 9c25a88581e4..def25d51c4bf 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
@@ -13,7 +13,7 @@
 
 / {
 	model = "IEI-Puzzle-M801";
-	compatible = "marvell,armada8040", "marvell,armada-ap806-quad", "marvell,armada-ap806";
+	compatible = "iei,puzzle-m801", "marvell,armada8040", "marvell,armada-ap806-quad", "marvell,armada-ap806";
 
 	aliases {
 		ethernet0 = &cp0_eth0;

-- 
2.47.2


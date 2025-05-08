Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E50279908;
	Thu,  8 May 2025 17:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726558; cv=none; b=tCn9OICGwLkgoMnKo1D3m3ddP+B4wt9Kk3y1TV4Cy+s7SVHscumdsZ3VKVejxNuNCtjhkcWazVRYpP/IwdTTf1MrqEOY7lWA9kCvp380cSXN1Eun6aTelvDR8/YGAmgp3UflxjTjxSS7lqMQtOM/igO5lWfTIAjNkSKhXbEau5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726558; c=relaxed/simple;
	bh=p1iaRjJi++EttsIqZp8D1e9XjdEQxDbNLYDz++43A88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZK1qytbZIYKECAm6wNCvmtb4/OkEW9j+91S0Bu3kbgc8JHCj+V51Lj00wVQ5CcqKUw0ppuEN5aWzw6DiXLvaEb4bVEG9OvrJGdJp97dQH4Ml3FP2IbxtyfGSCKUTCs5N3rG7q//GdPnPAkFFrPA5cFqBgYTTu/sDV+ozOttdsng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HCY8Nopt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HCY8Nopt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746726548;
	bh=p1iaRjJi++EttsIqZp8D1e9XjdEQxDbNLYDz++43A88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HCY8NoptGHlgyc/4ekwLnq77520THngO0TiY+xwQFZbCh13pszg+BODakuNpu27NQ
	 4zGUGXpvlYfEaI+ITt4SthKFhKDwWOcXgWSnnTjyRnr2mpOO87LaPQN/qDFRm1SP96
	 I/AnlCN8QjWd6+SuNz9xl/pMj/iaYNQyecvFep+7g/cx3GMMYIISMjgUQrTDYYu8Ud
	 Lyd+7Cc4E2KagIyJulsHrD+WzpuHP78LF9AhV4NxdeySJAfSaT22F1gHQbFpYqkhAh
	 8Jgw04Zy0303u8+kCGqYqdKe7shR5is48szx3rK6eW7bDxp2y9xV0Md8DuVtHuaz4Y
	 HdxRc+GSCHZxQ==
Received: from jupiter.universe (dyndsl-091-248-213-080.ewe-ip-backbone.de [91.248.213.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D6DFD17E080D;
	Thu,  8 May 2025 19:49:07 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 71B67480041; Thu, 08 May 2025 19:49:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 08 May 2025 19:48:52 +0200
Subject: [PATCH v2 3/5] dt-bindings: arm: rockchip: Add Radxa ROCK 5B+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-rock5bp-for-upstream-v2-3-677033cc1ac2@kernel.org>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
In-Reply-To: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 FUKAUMI Naoki <naoki@radxa.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029; i=sre@kernel.org;
 h=from:subject:message-id; bh=V6ouydAMjeLLipqGubBKzuYUl73fH35Zk0yjK7db6K0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGgc7pP/lcxUraZupIinulSaseR4T++TCK7mG
 vRYSzu2XWhRRYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoHO6TAAoJENju1/PI
 O/qavGYP/RkPQLOkNBmorCW9tusVBfKJORrobUzTjxPoNl97lWZfTiuAOuivXqGyO41aqftmMZy
 BweHRYWm9iIGJa+woikrjQvQLyNZmhSqtAHL0ZqVB8Wd8bW5S/qZEqNOQ5/kkIOgG9oguuxa22B
 VzNFv2Uz/f5My8y4AGwQCtLbjNWwoWq/npHfjtC/nYpXjiPZRnZFOaQiPED7Zldh0UgyeEilhfA
 TvxIDy+KjEeam1IgxFkY/gk8ND8RRBRH1rEfKpP/QrQK2afsr9XGQwS8DYmnWQi0zXSzYZek0Bj
 8Em0f5BS1Rbv7o+KXutI+nfKpvDKWqNhQbyhBkW+mEBVsausPpdu+Fu6B2wImx5jlrV4cfdkTfO
 XAinmqP44GVqe0zJHukc/LJUfEdRQze2wj+LyTgluPe+gg9b/YHRpM2j13Sig3eTZ+KxDCgUipi
 xEemssYBY5HOYo/CUPcaxazd3nR7Ux9xGzv7VgiqCM6DeeHjJL2w9131ibXAwcZX5NdBVGkc0k0
 0sb41bu3oaLXr48YLQ4VsL5rzrDKp3zrP85bK+Vf+INRTXadSyqB4ef9CmFMM+x0WNtLCnhEVTJ
 QvxYThhSFJg7PBcz5xzvO81KoGDQnieVoVjhkKDp1jG39ecU5QfEi/7X6gLQViaiIxyjH43H0LU
 vqws8+kyuegFDBowHlYQs5Q==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: FUKAUMI Naoki <naoki@radxa.com>

The Radxa ROCK 5B+ is an improved version of the ROCK 5B.

Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 455fbb290b777bca5ae69ca8644bc41380b94272..8f324417a3bdb3f5e11b03c86d18df4b6f60a43c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -946,6 +946,11 @@ properties:
           - const: radxa,rock-5b
           - const: rockchip,rk3588
 
+      - description: Radxa ROCK 5B+
+        items:
+          - const: radxa,rock-5b-plus
+          - const: rockchip,rk3588
+
       - description: Radxa ROCK 5C
         items:
           - const: radxa,rock-5c

-- 
2.47.2


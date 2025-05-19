Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C86E1E1C3A;
	Mon, 19 May 2025 07:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747641362; cv=none; b=BqcnYVXBHpZRnsM5VCRstzM6OO9OpZo/3R5wLrcWX5uRJ0UkStncqoa8B7JmBIxHSaV9X9+z8FqJ9Ck7nK+vf7hzlcxF0lCZL60CmONnace/UDHc4+rgZGVknuATkC9RVapoJp1h5PztC9xIGfgch0+iV95L2xfeP+S756ZYUds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747641362; c=relaxed/simple;
	bh=w2zdlmvSlZ3GigXquGzHuzC+WZlwaeRcdQGUvUyy/9A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r7xIOgGHSMBAvWdzpx2vPZd9nuAgwoYPNAXqq25syjNnrZKVpy3/mldUCA4CQTTpwrfqX9cJnC12JzaBwFg1ivknrm2wLp40yZcanRxNOlyqzm25Y+7QI/8Qu9edHA+w83TErnkPqAaIPpNEVJud9mXo9vXbNy7JedniaoccqP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=pass smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chainsx.cn
X-QQ-mid: esmtpsz16t1747641306te62f64f6
X-QQ-Originating-IP: KUSRsfj2034q0KpgVunyHgpIxpYlaY5rKNO7LaI+oTw=
Received: from localhost.localdomain ( [182.245.65.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 May 2025 15:55:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7114426328788078209
EX-QQ-RecipientCnt: 16
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: i@chainsx.cn,
	heiko@sntech.de,
	andrew@lunn.ch,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	jonas@kwiboo.se,
	sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v4 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
Date: Mon, 19 May 2025 15:54:31 +0800
Message-Id: <20250519075432.2239713-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519075432.2239713-1-i@chainsx.cn>
References: <20250519075432.2239713-1-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NkHKfw09D6j8EPyvTXWfHCJ17T4RuvGSQB6XV42nnTaXO2/1MLd+6+1O
	emkHoILwa4rMHByVq5cB1N5kE/AFcpCgkimO0u68obBr0q/nW5D71bOX9Gs5J7rHckcXiQH
	nY22W0GHgDcBPXHlnOforDghwmRGf54uwEODcrCk7mWvZldseBbOr8hQNOwafkrLCSmw7Ml
	vKU/KzdMEaHI+OiqVQFbBhqNLMULTOXMnKL3HLgYZ+y3dW2N0jRfNNLVbo/8nL/Ub/tduxj
	JLeHYxkojXIGKtZA7OzP0WqXKyE3RrhxAzAUcstkq6XPuqoTW7bE2PFUIpNm8tdXZJ9mbby
	GLROwtF3XE8krHHKgZUun4V2Oc5etxGxCaXy1+LPIn5nYxN8JOw9ymx4tKHOAPsyX2TogHu
	ZO6u2/wisW5Efs3tas9dY8i2mnRJZTF9XnKuR8+Zb+dT8M/SjDMepa4KTHZyh2oJaTwsvPN
	4yFQRwCPoccE9ONSgJ0ExWRTwcypJ2nL9xYN6z/dnjE1veSTsYqZz3ns6Z9zzgZwix0XFkS
	PlCCg5X8o4QdCAvX4WJTt1Cc/NRQmlM7x76E4P8mUhB8zzuIt9QJaw7ZWsUivoxI38S7QC+
	OKP+mO3k6nFDt6tT9T7teo6NoJHax3mdeMwgNfRML44z2qbejg7EGEPIEcJLBa5Sv4xamRy
	vByrxPf/44+FyC12kR42Phxv/MAZ7tHDE91ffUZvQDb3KMxosF4tvxnaCQ7lh/MuJVHsy9Y
	43uG9HlX3Toa4uBOKiNLaCb0TyonC6iozoZAbKAXd62LvD1j9X5FZ9nlEJFtt5j7MJHX9tH
	WpMjmgDTpzC6G5FnWOCNN3WZOAe97p+9a+QBy+dZh+LGVYg3a75/FMe+j/kIKkrQCOpOQ65
	Ah5D+Uj+mlnW3oluZ2ATSvCNwq40+/AJqXFxTtEQgV9X04RSzCFhBBE9EgZOJAkC5QNd/7M
	6tvsIUoxSsEnV90aUaXfq+7phdVgO2FfhXZb9OQFoJZCam6thRvm9cAb9l2Iq3Ey4wzsULJ
	vC/lBSBCjmjhk7BnwK
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

This documents Firefly ROC-RK3588S-PC which is a SBC based on RK3588S SoC.

Link: https://wiki.t-firefly.com/en/Station-M3/index.html

Signed-off-by: Hsun Lai <i@chainsx.cn>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 115c3ca43..701d68aca 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -258,6 +258,11 @@ properties:
           - const: firefly,rk3566-roc-pc
           - const: rockchip,rk3566
 
+      - description: Firefly Station M3
+        items:
+          - const: firefly,rk3588s-roc-pc
+          - const: rockchip,rk3588s
+
       - description: Firefly Station P2
         items:
           - const: firefly,rk3568-roc-pc
-- 
2.34.1


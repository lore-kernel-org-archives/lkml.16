Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D551FDE14;
	Mon, 19 May 2025 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747645020; cv=none; b=OWQxH2oXp9Uww7STXkN6+PMQeLYeDIbX++hSxoLFDK4IxchLBa5nToyQd/H5I53BLNcI/A2pu0V07qLTXhySX772WRM6l/mDo/0pdmri5MRsyVA2XZS9gWZ0VkFP3BOG9ge1CQ8ukoMzhfObDOJ/VkoQkKtMxybNGzrcUpudLWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747645020; c=relaxed/simple;
	bh=zRNx8dVziKItCDTk2rbDv/9/cXYM87fzEwg++XnNouk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kqcZbJ43NZdJiKx8zjhiZMzTfFtPOJTbyzTdmJ96Dz+Pd5LU2UDbnNTpJBPxVKMbNHR9TyR0dEFaNqF54RfRft2+Fh7tga2s/lCH5okZcdiopbkMAT6cvrp72B395jxggXMdh7u2LM2vyw1aU1HFceRFFFlhQBZpeiJmUSFOjqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=pass smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chainsx.cn
X-QQ-mid: esmtpsz19t1747644981t575a3957
X-QQ-Originating-IP: pCj0VqU38uxtKMOih4dtpbkZZpPgbevf1huby6Q/fnE=
Received: from localhost.localdomain ( [182.245.65.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 May 2025 16:56:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3928078300355608272
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
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add SakuraPi prefix
Date: Mon, 19 May 2025 16:56:12 +0800
Message-Id: <20250519085614.2245892-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519085614.2245892-1-i@chainsx.cn>
References: <20250519085614.2245892-1-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N4xNDYS0Y2xMphm81jZAdhqXE9xoNPhXJCZKjkbSMJaNvjtudRsqF4nM
	3YU2b3BtfC5VPdwPqPyXobySAXu1viX+4KU4UXQYSF3O5C5T0MuzOlTb8o3pEulp2QsyyOT
	0qOMSOjfM1o3MF+lp0dyZojqWihyvt4HH5cHPhlFuKMuaeA3UE0dXqlI84aG7Gn9iPJxqme
	gcH4LmA0elqj8alBEevAlOb9nI22NT22v7OeBofqm3oFc/K3VAaicBxZi2tYYRckYABRUIy
	Q/Mhwehpd1u94RoLKM8QqRrCaNBIRsv8PNHj0NllakaRLVR7DlzTzOQv4oeBAqabJqx2a63
	jk4mn6ZfFeWOQDQtIH+dPtpQYlyG31JWDjiRKx9MowP1fCz3AvleemjnB4Q3iKgqLgZmpHU
	Nh2T6SA6ArBrBeyiSoPgK5TgFZZ3pQPc3Y0QxlpfdozmhQjFlgd9E5LdDGdErvbsMel4ZtD
	8cz+KwPElRXKi88Tzg2XZU95wCIMjbw7tKr6J9Zn43w3TK42OXEaloHOWw5T5ds/OKdUJxJ
	xgfgcSjFdaoOpJVZrgQnobMIMtaToVC48ZPFEySpfI5qteeJfIyt/LNUdMvrigvpc5Wl2yq
	mfhoMo5MSFdw/EmJKf29iqIdSe/Gd8coJI8oirwibhbKT33Uf6ACyPw+vmQ+jmKwFV1nRS8
	u89gaid5l0OjDSQkkvnbKcEhr/2Ek4I4XF34vevtOn6YqfUofUl61HAZQC2IngppDo4AtIa
	vdGPfGhelC4i5QuAiYvX/8PyP5qFfvxtVeY4sUctlmkiaKyJOVlaVH6EIDGBMiGvR+E5vUO
	8VCdMwuRpUTgnHvM2W3FkGzlY8V2q4LRz+GRCD5kKy4A/rA4D+zse+VQ75onizBBVxrm9L3
	n0FI/PpDNJLkAl9Uk9TOtIvcWejXcn35SvO/+jONdyOgTPNOTrl0h2c74hg7bMhMFuRSaAl
	O8ZT1yrHMbWkVZ1hjhkdi0n3EVgxVRewBUFz0O5bQs5SooUM2y6XDh1SRjuv+sXSTSMY5/I
	UZaWLUI1Jhpeu0awT38BEPwI4HCU7woBdoqz7+NQ==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

Add vendor prefix for SakuraPi.org, which produces
development boards like the SakuraPi-RK3308B.

Signed-off-by: Hsun Lai <i@chainsx.cn>
---

(no changes since v1)

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 3e7450c3f..744d01a76 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1299,6 +1299,8 @@ patternProperties:
   "^rve,.*":
     description: Recharge Véhicule Électrique (RVE) inc.
   "^saef,.*":
+    description: SakuraPi.org
+  "^sakurapi,.*":
     description: Saef Technology Limited
   "^samsung,.*":
     description: Samsung Semiconductor
-- 
2.34.1


Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176142949FE;
	Mon, 12 May 2025 13:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747056375; cv=none; b=ewlE55nsIyWkuDr8qvwv4l/tRI6Vw9eNEqhvAmDAqxfxpRF8e9ULe9UrMBw7krB3Eh9XEmocQEQCeFkNrk9mymPiHJcADof/45VwbsoT1r3nUdxEW1pjvUHy1saFzk7/SvoSlfx/RVi0QZgXIUc5O/pc5Dd7UCeIky1dPBxAKUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747056375; c=relaxed/simple;
	bh=zUXcpTiNwVX79Zx15n1oeoDkLSOX/YrrhzcvuYhRDZs=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=JU7Is4uig640L2NucbpcTetv9tuRR+ZwdlFAWDH5eCWfU1f3UA4NuIwJJQ/6kH0JBzgeu2KLuqtgvR4bCX8U+iLwYKm3ruGI/Hal38mFFji97R5x9g/tjT3PAeMtO2Q3mu87cxymrYP7h5rAiydGHD/vBTtO5cdndW4AI0JZPOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=X6xjmA+M; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="X6xjmA+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1747056064;
	bh=7CKmsvauDc0q8NWP+HLO/2UN2L/FIYQsPE5ctif+Wxg=;
	h=From:To:Cc:Subject:Date;
	b=X6xjmA+MjLCU8zjxJiVoyHZTtlnKfFdnszZxmEGrhykIdaGGGST49Qswy85M9vUkd
	 Zc2Y0gYEDbrWywqm/3yB7TgyjQ5jHpkEgTyfwWgW14tWRAtgfoJ9vNBOUAdVpODX9/
	 DxY6volnS9AmZ0Ozl5WAV0QWAuOXSkwslAjDfT18=
Received: from localhost.localdomain ([182.245.65.132])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 5421CC49; Mon, 12 May 2025 21:21:02 +0800
X-QQ-mid: xmsmtpt1747056062t1bvo054i
Message-ID: <tencent_60646CD888A3BD7F0B0C701B95A2B22EB807@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLDX0xD0WxzRUCFyjoAKFGVx1fKo3JfF5pFAw0yXSVYl40akhhIq
	 TT8QDQkIVvAWtNR3/KRtGxsUEf8GuOCOiGOapoU4bXT460wJP9phd2qqgKvgqbcSAVo60sGccid9
	 cE+GUVlKRr0g5Jmh5fAS3x+wq5Kxjh6eU6HtWVsoadYl5I3njMxYHJsquwgRuhDcr85Mxo2sI6mV
	 gWdvZ+luWlkSYIjcjMC0GGL24MRD0kl8yWvlqvLlYaY4Gg3dgbSXoOGzEJCQ1CrV6/bMklVcMq/J
	 edL+cgt6P0Fz6b5FNFz26JTLyDeeM28jul6okXGueinD5rlY5qc/T+itnBS7+mKuAssgbAYWPEN8
	 d/TpC9PT9l/mG7TXmObXTh7tu/XkprwDx/2TLF59Kw8AeRXHjrskE3k2bVVGZtMbgiTlimlhr2P8
	 ExdbnXFOw7f6fvn2NOaafWfcX615tUIizhghtRYNQ85DlI36VYvKCpoI0NhVkzzR9csA+9D6upPr
	 ZPRHYXQvtdhF2QqAjEQ5V5XQaX21E0/sawXNCLDeb4PgwUBOBAcyaXyyOaBs88URdlmEJjS2hYnX
	 vEHKVsi0X4jtd9AZ4RDbDwPIjqFtaSnJ7E6lL3rd83tJT0NN9Um2gTA5F8vdg37HX6TfpEE3nbZ4
	 DPJxhNaY48rQ6/pZfyYRN1fc98AM9o9zvhM3pfz+gzkZ4MJgcku//oqTU7+LzkxfNcTwCKLAi5IU
	 MKMeo/0BIo9OqIJ6nv2MaaKWTDXiTKN1GxLf7Owq34PDxsNE3M9z+PyF96tWvLwa/AX6Z5PT+s5H
	 i7Blt+fYsqZ3FtRYEDQ6fi4VVUWPZVqg4okhqeE2wqGgHpqiJQwAQ6QhMa4BWvPfJSvkS5oiiw1e
	 G9XiWiAUFdJ7LXGzhR0GgP23sno2DoD9qVh7oWCaVDI1h6vbAmK6tcx8T7d5WETEYKBK5Yphl2Te
	 juzj9rjxKtMNYmMyHZIbztdruMCMxOcyktG/rW/4ukPWFB3A1CSymY8r5C0Nf8no9SMm1+Lvh7+n
	 Os//bwqS/aC7GwXtm7YF16RNgf4rJEtn6ygLsZbTd8bSdqP7hC69oKqUcTdS6rz8GVLHA1XQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: chainsx@foxmail.com
To: robh@kernel.org
Cc: chainsx@foxmail.com,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	sfr@canb.auug.org.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
Date: Mon, 12 May 2025 21:20:59 +0800
X-OQ-MSGID: <20250512132059.312789-1-chainsx@foxmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hsun Lai <chainsx@foxmail.com>

This documents Firefly ROC-RK3588S-PC which is a SBC based on RK3588S SoC.

Link: https://wiki.t-firefly.com/en/Station-M3/index.html

Signed-off-by: Hsun Lai <chainsx@foxmail.com>
---

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 455fbb290..13d5dcbc7 100644
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


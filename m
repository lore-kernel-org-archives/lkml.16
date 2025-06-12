Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001E823C4E1;
	Thu, 12 Jun 2025 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736605; cv=pass; b=h8Kt8//UGXb2dHs8YwjJFGLpMJL0Y8K2U5wBaSObAAKewqtyGYRd9AqgY7yjhJk3oOsP6vXmJBTKl0iAsFTkkrxQxb/dsIvXEuCr73c6oVY8HQxCMt8RiyTV37saTLHdHtEOZrl11pUFgzxSha4GwLPu+PIkjiU/qJwtmJrhX7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736605; c=relaxed/simple;
	bh=jjyzOPli1ra635E/Ffy/tg1VaUvXRkSQuP8371mstPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A8i5vS2+ZjIfxPfPZ0sipK5ECDs3+7wvqMafdjOCrZcc7gDtxSSu8seg5JNAh0KikCvbNfR1ZivRz9CeUUinkRcHkW6odrjwm5dOa7FaiP3896caEYPNwgiR6C7Qg1+VhO0IhESqEHE8D5xBbMfDhH3AMdRFpImTaTaEJDxcNa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=cB79ZboY; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="cB79ZboY"
ARC-Seal: i=1; a=rsa-sha256; t=1749736578; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z9Q6LpwOskFzXu7qFIqDahCinDV85umIMp0V5V90dF7bGYa5NYV89EM6WS0OwHQqd4/Uv2GrLuC17jCqKWGsiS3DgT6YHgWlkx0nVLYDPAGFWkjHJgF1egrIEVsnPr+yAxCQm6AkbkBgWNKa4ARXHPstwsiFDVRpeo62daoIcjA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749736578; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KUIfLwvoP44U5nDfSmqojpW++w9cxu2WaXPKkzeIK40=; 
	b=i68huo5HXEszm0XtLDeI3hap5XBQ0TEjonhcTuFAHwLyctmv+zfAdxJP4AYyOPd8EytdSiiU+3o/mbGHoDKTg5IKe0tEmkpcVlco54i1d6deoZqw1NQjgQnM6VIICB5TrmIq5V89n7yuMrsDQX3jW3TUWT/GhE2Med+bYTb+2/w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749736578;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KUIfLwvoP44U5nDfSmqojpW++w9cxu2WaXPKkzeIK40=;
	b=cB79ZboY1lFL9af6mnwgT0N6Y0FcjVW7L4hsO0ita2ELplHFr9csDJsspMYpZ+wM
	iXN1J/COAX88HG2r91O8+liDKQ6izRy+6ZX5HT6MKqoixIRZP/0CbfNrk5lnI7DeQbd
	TBdTShZFNU85CZzECc15JWt2HEJ50Peaeil1iaVjkeBp1k8SD5taNTsYM0mU8Wz0QF+
	7hzKXd4o8bVxpr13ffHrBOSFy6Jw4cREKjzEXFUfwM5e9h8BwKqt6gUhnuKsPW1XfbR
	b0bg3k2M5B1ZX0UVvHPM698VsCqcF5tzp4MCl/VVL5Z+bAJsfgNJZ0UHYrKPqwM39nb
	VWTuVDzl5A==
Received: by mx.zohomail.com with SMTPS id 174973657610749.98040995348208;
	Thu, 12 Jun 2025 06:56:16 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 1/2] dt-bindings: arm: mediatek: add mt8173-hana rev2
Date: Thu, 12 Jun 2025 21:55:58 +0800
Message-ID: <20250612135559.2601139-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-ZohoMail-Owner: <20250612135559.2601139-1-uwu@icenowy.me>+zmo_0_

My Lenovo Flex 11 Chromebook contains a board with revision ID 2.

Add rev2 to the compatible list of base hana DTB to allow depthcharge to
match the DTB.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d9..7d13547ff57ba 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -132,6 +132,7 @@ properties:
           - const: google,hana-rev5
           - const: google,hana-rev4
           - const: google,hana-rev3
+          - const: google,hana-rev2
           - const: google,hana
           - const: mediatek,mt8173
       - description: Google Hana rev7 (Poin2 Chromebook 11C)
-- 
2.49.0


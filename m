Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902BD267B74;
	Wed, 21 May 2025 13:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833131; cv=none; b=m9tHgE5w6gCGhXkZV9sxMWfeMoOC3AwHw6ACySqQ8ST3vrynbx/Q4iOUtoTLFtcYNiZ/LnoO3rwKlRrG1FqnO5Vy9IRealrqXSIXl6Bn1Nt7DXcj/cYzk5/fr+NC6kGdI+8IeeSAsIJg5GEYkwtf7fplQtGjx/2RbuQH1qpmr5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833131; c=relaxed/simple;
	bh=UAZyR586T12X8Sqt2X1g6rQPJ0OaKTsV07SFdykI9IQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jDhXduy+0iLVDDv15FLrBSPzNK9vv5SMSNERY01fcOZkLGvrHfGadJJ+e1XUCHnHq0/KOncdMWbVvj0CsY2W+FLiHKfRoqB42D647lQv7G5ZU723Og8UFzsWIEEMUZULblX/kXIauZS+D2/BHR159dwvdpTWQCVvfPikyDsxEdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=none smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chainsx.cn
X-QQ-mid: esmtpgz16t1747833076tae521dda
X-QQ-Originating-IP: NRDtIp6wxGHIj53BWIcJvNUAWwQhM3ael0y7Wl3X1ko=
Received: from chainsx-ubuntu-server.lan ( [116.249.112.84])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 May 2025 21:11:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3315312418809293864
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
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add SakuraPi prefix
Date: Wed, 21 May 2025 21:11:06 +0800
Message-Id: <20250521131108.5710-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521131108.5710-1-i@chainsx.cn>
References: <20250521131108.5710-1-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NULd4DJcKZL/Si+IhAVqJvBoKkZMZOODzr3Yqt9hswfAvOMyqH635xvn
	3DSmAu+XKPkF1bbqVsizC00n8CQTlZtv4XJsjarkrqmDrsKDyQtw/wGphlXemvkHX+xdSd0
	KEbrsMp37MhcZl+XTi5mYgJGGLxPiVzjEdaZclZC12voF+h0t4/gHmqGP/iA5XCWkd+PnEB
	mzxieqa7ctof6y+WopYFP0xHOMAVF/lZ7MgP2Gwqtn4/mdv3Sp67jEwIQMKVTtHX/Oe0kw1
	xn8Kqqwx1yg1dv57zjUFDOviS6ArTS5JvfwJAlmyjh723pb35ptQ7JYaFrNK/lWwFqtYOEO
	2SySF4X7oa+xMHLLsOpFvq/7sMHdtET9j4TLc06lIf4OvPh5CCUeIe5LiK9qFG/4qGt+MX4
	0xEzcoGyAbREPByGiTwA8EfsNyPPJd8DAIMnKf9ulrYEKeSyu9ZCIeQCfr1xfDlqlgPxM+3
	SsdvorxsjR2780ZvWdIaxKYjPt0earjyWy7dZzQR8FXNA5feVN/BMWJTL6il65T1hh7HlRt
	lz2OXgwp/kiZMV08ifZEGS/STgRzc34MWAPvn6DWrPLoGvY1XNPxwr182LGYY661nhjChZX
	UkMioIyIOkL/y35SM5PKpIhxndUDKhwBCSTCUKIhO6P9UOfkvScYzioSHsj7EutpCgOZASC
	N6O2bQ8BB/HrN0dL4kZd0ikzly2FP3SOVog1UZclLN+e9VyK1Cib0iIgliy0Q+oWCvSEV+j
	MIcK40U7BU2jNvO6NDpI+dMKCnKV2rhtx9rqwiyO2GQ+4XtAW/TebN+0RTX23zjhr/CA4+h
	CTOQGD13WE8R/mlE/tTKOngy//CdUX5+BmAni9QDDNwVxm94CxbWJX0V7XOLTIt/Ihyfad1
	5g2F66hFAha301niwxV+ROjixDHu5iUuJL+IJOP+HqKLT+YRas/adYYTNOLY2TYWgmfshXA
	elwHkfzoPudC5MqVkbXRhEasUcbQ9AAICvYmPDsQUWY6Idj8daU5erD9ug4AfelU+i2n2/4
	v37VvYQw==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

Add vendor prefix for SakuraPi.org, which produces
development boards like the SakuraPi-RK3308B.

Link: https://docs.sakurapi.org

Signed-off-by: Hsun Lai <i@chainsx.cn>

---

Changes in v4:
- Fix vendor prefixes error (Krzysztof Kozlowski v2)

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 3e7450c3f..7eb2e13ea 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1300,6 +1300,8 @@ patternProperties:
     description: Recharge Véhicule Électrique (RVE) inc.
   "^saef,.*":
     description: Saef Technology Limited
+  "^sakurapi,.*":
+    description: SakuraPi.org
   "^samsung,.*":
     description: Samsung Semiconductor
   "^samtec,.*":
-- 
2.34.1


Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC9228DF0E;
	Tue, 13 May 2025 15:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747150389; cv=none; b=pAvNAlJgNGmeetxqZpMPZH6nOuTtskY3WgU9dYL2V8bYL438Is3kInCwtYlQziZM8BUN+9d5Y+TcSM2+9Ii5tQQn8Y57nwLrlL6VyDchl7xtCCaeY06MTVs8XqHY88BJZqkSYGtyXEYRMXmsxisU3/pIql6dRfgl4ODpP2XMM+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747150389; c=relaxed/simple;
	bh=w2zdlmvSlZ3GigXquGzHuzC+WZlwaeRcdQGUvUyy/9A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mMjdFLNOPXjHE3aSqZBPbl8FAZKAZ6f3/sOzakrNMc7IRocRQIe7SGsBLEqYq65g0gvPBnTppLxLVKDZemFNmYTB+c8yw7M9woBLSr3Nbvu4paTnj+u7WYakdx0HV62ND5UOrNPPJaKJZH3AqkrZKF8HHmq5jxhhAeVtmu+Z74k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=none smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chainsx.cn
X-QQ-mid: zesmtpgz3t1747150252ta77018ca
X-QQ-Originating-IP: k2CxpzjWGN6/WWuIXki92argMY1epzXrRZnzF/YHX2k=
Received: from chainsx-ubuntu-server.lan ( [116.249.112.25])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 13 May 2025 23:30:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8291567758837896463
EX-QQ-RecipientCnt: 11
From: Hsun Lai <i@chainsx.cn>
To: Fred Bloggs <f.blogs@napier.co.nz>
Cc: Hsun Lai <i@chainsx.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
Date: Tue, 13 May 2025 23:30:43 +0800
Message-Id: <20250513153044.167187-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513153044.167187-1-i@chainsx.cn>
References: <20250513153044.167187-1-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M4I3MZG5ZyeocokkyWY+7zWmtJOW2xErk1h+VXPGFqphUBArULTXtzLI
	eQHXrqYbHKKJs63Evzq1PiGaMQeesGPnjbN5Dd5ooepDJXEfmdvikeItUb2kSUt/Q2TwJ22
	FHlnXAvQl749HoRwr3LWT8YHVLx0T6qdVgj4SiWTfAfvzXzrfIWCH0vi7dKVQfjYJ11uiLB
	85krX2ObEZZ6fgzmM76a21QUkc9V1Oxyu7qjpZ8REDdsTJUHoC5+Uh7JQ1rYO0mcBW6bk/l
	H/XOGmkJEnFRQeN/FlwphW6yQ3YpvTcDmrHh+5k/0Dwpovolfmw/60fKLLEaYGlm7s/NFJQ
	QUKgfzDxOziVdkHo/5rDw+/Zl2ZcGx25OCTfeceGlsGIrv1PHHaatjrAzt+YNrvT3vkgISl
	+eHsHRvnkPQCXDZl4JSw77VlnsOFgeWh5pdHZ5Kzyv0HG0N594iMunOrR4rramP9DO9r+Y5
	8eKaWVGo7IWHbwMyyeofNoaABfFJ5lLl4gNK8BXWN/V88V8zhFErfyhsncCGPTRVWQgFdsA
	NExGgNDj4Y2bvyJ4znn6lYfhnJqrvV15MtJWgURptPsTLy3805vV0AN5Px6v1GyEVmOOeSK
	CCqlfR8ovWNoWoCmxXb+Pl4jrDMqD9tRGxoYXVJjhT4KUqT6zFGBfGVICql9V/wofb/cqOf
	gfS2leg6g77rOsX8TghWdn0zmJcZYXjAIrFflZDY8IXovFo10kpTXNdjXN1aSalMsSkPkYV
	CaU/H6wYYm8lDQMdci30/341TQbEvjxSYonDmDGr5j6pYZDYiy+UVJv1Y42pqzB/Y6UbcYY
	ahfnV0TddZlgWd72927BQ1X2tju1weymHQFAhD4BFmDa8tq/tvzRGFF1cXPbZ1L707ZsPoF
	fmghHX7m/y157YnhBRYEmZ2nKHu2u215GurUWeoBLoMAA62IUTb4uUriZHLt4GOUGQj1Oct
	5JuuH7IMQUla1qPvk6gztPUh2tZUNQsBUruvEhhXVPG//hQ==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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


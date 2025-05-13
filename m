Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985862C0852;
	Tue, 13 May 2025 16:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154244; cv=none; b=RKU7l/j6S5G+ThdHnHcOuyqnK3QOFml7XUoQANDzHvhv4YymSxN2HgwPzFSTK5wzRGPfAvItEKGr6ExlB9iNbzT4MzgNK6DYAre6y/pzDmyO1SHJDvyTwHVAIcDKGeqY02fiIby8pRiCltaACRp1ooEBzmZmhDaWhiFQHbEdUW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154244; c=relaxed/simple;
	bh=18rsiSGLeK6tyScJi8fK8s0F4csC1bE1rkINUfBvPdU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dLLIvc2EMCx4EOUEchGg8FZahf9fCe4xDSJxHXX4PuTHmu6kAILugDmbmYJreZKu1WWCojhAdKA/COLD6UAe8zCD6npSWTsmBrTeBhzhT4Z+sHsYArXKZRZyhTEdQOSaLLQEqGOLja/EBjDvqXwY5YEi4z2DamdFOiwpi0+MrY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=none smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chainsx.cn
X-QQ-mid: esmtpgz12t1747154122tafa2d1f6
X-QQ-Originating-IP: wd8dwVkh+m4oVfC2zalMsRq8Eh1YcurfYo+CQ3HvDw8=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 May 2025 00:35:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6247747743901342415
EX-QQ-RecipientCnt: 8
From: Hsun Lai <i@chainsx.cn>
To: Fred Bloggs <f.blogs@napier.co.nz>
Cc: Hsun Lai <i@chainsx.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: vendor-prefixes: Add SakuraPi prefix
Date: Wed, 14 May 2025 00:35:12 +0800
Message-Id: <20250513163515.177472-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513163515.177472-1-i@chainsx.cn>
References: <20250513163515.177472-1-i@chainsx.cn>
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
X-QQ-XMAILINFO: N3IC8um5pMyYELpolAEHOCVtNYCBsVBD7kIVe+NN8ZwFFYnEHX325pTD
	7l+GhM7hFOMvLbrng1NYx4Jlk/p4IvMk2Fatzbn6MfeMSqxW9+f984I5aSnMVDoo7bv0srM
	OwW/Xk2dAadkwEjxteUjCDdEHOoBKm1pNfOQFLAME3q/JARjAijzVaXfgC0Kp8MBk0x+xKH
	WyjUAdNQGvvWV6KeuS0OHjXtth8FUqbh9ccZ9H4JVQqRO84t2q5z0QFravhUzH/u5ByH/ZN
	Pf6SgWmekZot0poWApZSwX90sppV6WdbqfdIvEmzHujUpE26sKGAIleKOCq5X0Wu4FG2Dhp
	68FIMcbGu7CYjft9ESb8M158GpTMv+zdJxJqrju+/vR9o8ejTgy8w155KqYs9ulRKIfYA/9
	5h+zc027SEwDEdgJgtGA5qoeWzgCWoIIyskrarsYquTMjUR/3EECte2gBI0lECWVyYfbFxE
	Od1lXC6spr9cLc7xjjeqxB9rBytabAUAW22ykQfWdgYY6tHVyviZQJbQ+ChgRrhs9Gc9372
	HxnvjFVERR4OH68Vux4UnYvvirjxqbBSNWHtFxvGnflHOGvwGyox9PYW7vDwidmzxeWv3H8
	1bAr7TKslo9/ihF+MmuSPoKOhmByLThpUbC/R4b8dw/TyUwOIcT9K70Y4cvQ1zwc7kFZpX6
	Tvoj40vtt16TXSTITgCyJHxf41VTwWhMq+UxxoNLQregSamjzdkJcEipCQG9nbfd2SiL7KK
	V6VN07Mr/wp8qJJg1mtVxy8zvGxkr7O/2CLU36Be3SaRMEi14d2KYYBXDZlVBhZpdJVnCp3
	V4RZhkupaoVg7wbfwt+l4S8mkOv8yDzm8xZfr6yfTr4AX+aSP2NxrzV0A/gbfv6ZOMVDyvm
	3SERSN17oh5klI2aNwyn7/qMNby5W3vGA1WMN9WLAyiBDKP7oZrCoAeUhEeoiKB6wo+NdFq
	zRGQ9J+3Fgx8+wesjDAFdj0yF7rHhvLOHZb1ScLuvJIBj+Q==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Add vendor prefix for SakuraPi.org, which produces
development boards like the SakuraPi-RK3308B.

Signed-off-by: Hsun Lai <i@chainsx.cn>
---

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


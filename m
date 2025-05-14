Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70842153C1;
	Wed, 14 May 2025 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747209634; cv=none; b=esk9AHJVlqYzq+XrTUoq4FDAdu4AYTRDSEpsFSp/a9FWu5ugANgouuran3scZZHXaTeD4kIOHm7CXDCXtncKHB/Me8H1BwOtbZt2umiE5zAC0UOztcWvzs2L7Ah14sV5uyEiNtRpc+S3RBrGSoUf7islCk1YWmf+9+cb8RKz2s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747209634; c=relaxed/simple;
	bh=zRNx8dVziKItCDTk2rbDv/9/cXYM87fzEwg++XnNouk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b4rrZtCqpwo2UVRUNh7/QuUdCeYlBTkxcNPuqiX79tI2qsXB0p9O2WzFcXi4NSRyYCuMZrbBxj9Mm9nwo3aEh/gaLQ4wkCcQagsTsbGDg5eDzjdNxFUZ7QcuJca4NBDxk2ezGz0uljZRd6v8Oz7Yi8bBBac+48ycvcqejhS9lf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=pass smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chainsx.cn
X-QQ-mid: esmtpgz12t1747209563t3de3214b
X-QQ-Originating-IP: qDZHVQiDsVrnVL88kG5FeaFrEm3p5WZn7MIIute6HfE=
Received: from chainsx-ubuntu-server.lan ( [182.242.225.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 May 2025 15:59:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10427985286960112042
EX-QQ-RecipientCnt: 10
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org
Cc: i@chainsx.cn,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	sfr@canb.auug.org.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add SakuraPi prefix
Date: Wed, 14 May 2025 15:59:12 +0800
Message-Id: <20250514075914.194651-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514075914.194651-1-i@chainsx.cn>
References: <20250514075914.194651-1-i@chainsx.cn>
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
X-QQ-XMAILINFO: MMNR99wQqbHFNe7d4uPLaztF3S0tz/a+KFbwmdEdnQflYRADemmzPW+G
	YDuEBcYDok9kaDW23bTIEvaweLbaEfzK+vx5CQOizSwzv3Qj6AcmH3/k19cGs9yi+LSvkrs
	8SBL82K3BhHpIgu0WC8oDf2mChjK3IuBEv94NViUSkcFPLAQnu5UBaR4byp0Aj8DPKpGAKE
	vU0IvzIi6x6NU7FW494T5rhTxWHw3KIPm+iv57G2cXNb6a1LXFzV/IJSfI1anw5nXZpOume
	FLvFgJRKoxdgsIZNlTn70DJUnhqBdlZ0hkPwPd1uJ54LQz/bwPp1NzsKnAzsfla8+H1t4vo
	4T8JdWi+WVYetkIiS0RPdjXICS6wyv6IGOVZRrPOs4YwuCrtEPyjyq4WxDtsgSYhJaIHEtp
	dERsvj7u3xkNuUPot/NVlnUOEkOcQU+YeIzgtOyWA5RkUIx1VuQ9hwjWeYHtXpOGVYBB/UC
	qByP5KdCZZTb2VytgIHw2PrFRBRfwMhC2D4BwqB9xtk0HRSzpJIJEUE1doEewU17auNDr/M
	dUF82iJf6yI9+D9qDidcSRt3Db7XDZQe5PJUTFjoPm40s7WicNzO+LZFGHuh1seG3yfRMQz
	JyzfkJKYh0cChRteq4vCtwOUMp7YthYCImYimF8vwV80pjziArg0elagqQGOOt0Hhkl8k8g
	uQ7OJZoAJva0lJCTVtFl4N5eugXPCxjy9HMlg+a+iuwwS4uaFsk47unEkeRydfd3q516jg4
	r6bc1Xta5Vxd8hMzDz2VYZg+2TqAkafsSv1dLoPIJxZt0NakHBQRfVvs4WlrXkn9vpOmfdA
	eviwIi5vlOuXzapN3lZijqP2KopCsh3dlm53ix3kK8ujurKbIrxKX7mvAqeWMVXm48zV98d
	l++dhJuuQ8uveVft+NjEh7JngG3tLqMQnqGmRXzJb5b4AfEQUZjzg1XfBGdy/8pf6XvyCGb
	xCoE/4Z8kefJXfwlkToAgxBz+P99zUR2qFw5rqV5x0fjABki3pCAoHalU6oKHylNgFQM=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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


Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A6E23C8A4;
	Thu,  3 Jul 2025 03:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751515046; cv=none; b=Q+LO2Q8N+d1jD1ey8fhwEDs21eXJNmISC2Ij+18ijEHCYJP4UQZfm6ACY2nQ+OPJICsmXWWjeDQYaylUnJvBlyX7Zcs778PcsZQCisP2YPdSwynFA5g7F7o0vkbr2gmdEiyi/e0IbTx4IfN/qHCaN1OsUu5kmRutgIRFvMFmetQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751515046; c=relaxed/simple;
	bh=rs0Jrxz0vRepAeCwsVCMO/UiEo/apDCQ/z41u/EWCXc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eSxWJFWZmfhGfdL1IPWJRIp0Mw8ESw++X1ct5XST4JrMDk5l4sGWiCmacivlc8mOfRTM0njYWWhrEKgJp83cumbpQNYW1qrfU58sRl8LiBH6CbuURjWG/bFhshefX8WBTMwMsd9FCD/AsZEX5sfE0pk4qRB+WmrqXyMaYvTqg7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com; spf=none smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foursemi.com
X-QQ-mid: zesmtpsz3t1751515011t63cdaf04
X-QQ-Originating-IP: McRyShDlbg/mNUeXIK/4cz7fRy/HcXqXTgY3hs7UI00=
Received: from localhost.localdomain ( [183.17.231.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Jul 2025 11:56:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4261929876903516706
EX-QQ-RecipientCnt: 14
From: Nick <nick.li@foursemi.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	nick.li@foursemi.com
Cc: like.sin@gmail.com,
	xiaoming.yang@foursemi.com,
	danyang.zheng@foursemi.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] dt-bindings: vendor-prefixes: Add Shanghai FourSemi Semiconductor Co.,Ltd
Date: Thu,  3 Jul 2025 11:56:39 +0800
Message-Id: <20250703035639.7252-5-nick.li@foursemi.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250703035639.7252-1-nick.li@foursemi.com>
References: <20250703035639.7252-1-nick.li@foursemi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OWK9OR96U1jrvk3TfQwfYYyP/fQKuN1n+STryifzRh1Y2a/rShnIjjB+
	RBEdB+H7xHTI7C/jLU2aFBYiKmPRBh03ae70lovS2RouWc3+2wM6SUT0vN3W1lFR1LWd1KB
	JOsfZkAxR31VJV81OIEjGTPDqx0ANg+yrnX8mKP1H7TY70liBB8PmN9R7kLOG+TkABH7Sc0
	HhTD+0kzV0k9S0kbtUiZiXDURKyhVfYOZGE3DdH4Eqaci7w9sXZGz2hzcVv/EqliZRLsuzE
	u0CNy2dY5wip5Aa9W+jzzS3tIv58704CzybXA+VeqRNoanEpIB754yhcxV1qL5fPpSru4WL
	ONqeZnE8O9EkrWQtet6FwhUeIYHvNeAXGdoYIV3Mr/vwC7PQvnIf3+ZZevafoDsl6GtsG3Q
	cBAYNuNHIhrDv4LRKbqruTgpFfYd5ybIKcJFktejy/MBJI+v2exgop1jadLsgBXpkqAtoJG
	4ehAco8cXLmwFjeA2F9ID2BUsZRBiOUWWzGUBK3cghi/rj0kRWAhnFf4LcrCuMCfXHdTaRT
	WUrkqPX1i5cbM22hRvSx3moTMHmIiKusDr0RHVPW69XFnDuKPQfjUkkdKlDDk7Q2jeD/jR5
	DvfZNsrV2DGt7Q93P/CQ3A3Jr5RHS22MUrGoEEDonylPsE6pb/BBkqjjNd4aTXPuQ2d01S2
	bN2aBx3IQtGYovhS1+TC53PY1sxRDqOpcSI9O/8WT/ekdN9LVJo6WhM65d/cRB4CRoofuSb
	o5t34Aiy+Uv6v6aYGrIAZHygr/EClvax4X2gd74ArdD8F3r9pqLjJOXcmLtfHmMPxJFpKLV
	9G6ahmV5Dwc3Dhyz9wuKNZLijvkUod42lsaLspuhebdtRtc3MwIRMHEkDN3ONQdqVIomI/4
	UwhwGgJwl9upqXfxo8x7CvYhRcGZ1g9CzrdmxhSwLQArwfJnoZCUB85fHae+Dm8giw26FcD
	agvAmUMCYFXMZkhmF0bDHFlA5kYgJbiYv5xsOSZpn++y5wDl1pOF+6rER6vt48QnFAznvAI
	flhntxTWdSutRRJro3Xe2POA1YRvU+UeKop8dvfEczJQMsfqNRonhJ/mh4AfOC2wqzFzrCR
	4JEbVnA7vjxjI1Qd4S2EspHQ7TQzc8vbQ==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

From: Nick Li <nick.li@foursemi.com>

Add vendor prefix for Shanghai FourSemi Semiconductor Co.,Ltd
Link: https://en.foursemi.com/

Signed-off-by: Nick Li <nick.li@foursemi.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 99e86271c..f692e3b29 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -547,6 +547,8 @@ patternProperties:
     description: FocalTech Systems Co.,Ltd
   "^forlinx,.*":
     description: Baoding Forlinx Embedded Technology Co., Ltd.
+  "^foursemi,.*":
+    description: Shanghai FourSemi Semiconductor Co.,Ltd.
   "^freebox,.*":
     description: Freebox SAS
   "^freecom,.*":
-- 
2.39.5


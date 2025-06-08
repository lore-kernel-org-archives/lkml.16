Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B291A08A4
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 16:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749398863; cv=none; b=Xxg4EtkGwttmWZHkb1t/C99pHt8/9regFWXe6Qc5pjIoUl+ju4wJq7pXCXQxP3GDfivcmM7mkgDOe7HYO7RSzTBcLaNEQ4HGSPhej7oqL7oV9CVP98xzFl7fQsDK9c2xnWrl7iEfuqQ6YL6xGmV7H5/6CJqNTlYdVuFDSYFTb/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749398863; c=relaxed/simple;
	bh=Ja7y+pGdQgwUzowAi5cmrMH/tc4IyP9MAX2i9fmwei4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZUDptNg2Qn1HZ3M6K6d3opvhLgRoaYouNFaYk1b5EBnn+WN3J+Lo2pKlRY0r+vH9x+vh0R0qnSRd82ZaCzSKlwh8dZIS6ykG0Z8YoTYcLI4acKGhP/GvI+/yxcD5JgSDHdGXIkwSOGb4vfJOpbiO+Gc3ymclqEMhrGx7WbzA2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4yx41m2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4yx41m2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558BwKFa003345
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 16:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WjjsGKsB1xdYsLZ6YNVi3mtNLuj0pPjbrGZ/TI7MJeU=; b=K4yx41m2ilpKCZ2t
	5hMqhZJWt4cXL1Z9xyHe/2jMuP1h9vIu5im3C3dmJWmLZPJI8f4IahNsAbA6kLrC
	5p+rTQwHbvGxoB0bWfrpi6KYxIVymWVvbHEJ0MKIWdrAbSGJoRkLTRLFCXvYTVf9
	3zz+N3YC+tzuTsW6L+kPJs9gS7C2u+VgwUr0P98+GBKjpALw7V0fQ82lW0bsERYu
	s3U7bBPwP3rP2SZhZRorOL+62Jx58B9BPcb+JW3iqGxP5wmreQTJ9tliurx6TBjw
	6MgNrgralcZwvRm03ei7vCJC3zvjUXHNv/0uHmD3yyI0ohI4opV1gRMmZ8CnxD6o
	DRCfMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpk39d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 16:07:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c760637fe5so711175985a.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 09:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749398860; x=1750003660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjjsGKsB1xdYsLZ6YNVi3mtNLuj0pPjbrGZ/TI7MJeU=;
        b=i3VSM2oJFdWlNWmOJxzC1b1r8oTTsyf38oOrDPFvQY3elPItpieXctXBGrgTNEphO6
         JqUPoiAfK1LmwHT+3CUSbGdqs254+gdM5gZoUN1l4ea8eJeOil3nev0XedeVJblnDgsP
         2UiwvVP/KdwhcDRi5uisWYPBv21ln/Eqz0QPlzobx8jtR0WSC6CCjzK2lJNmNgfDvuGM
         AWYcd+LdPR6Lf2Vpr/dY5eo5uQOJQqTExxF/z4i+I6l0qLS1Am5UL5zmSZ5Jjlnlpzun
         n72ydVvcerT62LJZLhDGIev4R/Ct9CkUw0O4bfICIK5yQChHAyvMdjzbtEhiw+fLkVsU
         zS3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWifgT/cbrXLvQv+inAPzNB2NWAwabShw73rY0uvhLBYVxachijV79DLpy0n7Q/2wso9+W/N7Bf1pPnZsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcWY8riLbfJ8U2EV87dPbIo+zOIoYHBCF2Z8uEBWVPCdp8yRsg
	lFUIeabsdV0PkvKgLOn3xEBhdfYd9E2SrLO2NwDjUvzAMGmN+22ZtnhpjfnxGyytnCY492TBCaZ
	lSCgRf5SF2+dnuW1tt4NlMOrHTvAu6iKPl1grGAS8pRRmDpxfE0lJBWZE5X1rYwjTw4s=
X-Gm-Gg: ASbGncu1uyH1PMXA+gU/vMMgc+roDgwF9CgvS051TKmLlKSAqBMZF922Hr1bC2Bfzdx
	txrAgy09J98Vjty3JU8m95zU2aYEbaewkh8i4TuHFSXjLIJ9BBWEcAqzazlR55p//58wYlzcplS
	OhRtECghvyqfqzmpwCSHr/U8Rnp451JYCO1Pk8pT87eXo8V5OVb9LQb6BApW519KitFyqxfMvQa
	OmwUqIGtzZUKOgFQLaotfkoPDNgMf1EycrYU8MDF2mcGsT0NzJ1VQa0cvsGrWt4UL4XAr2mJGTY
	yQ+iUNixywFs+s5jf4A2R2Xt9169qnic0lfCVrUUgcBZLcs/Erpnn2orCqJqhNQSu1EYoVgjFLg
	h0Zd+qk3GsmNR+oD19Pr8xAkV
X-Received: by 2002:a05:620a:471f:b0:7cd:3b13:c5b4 with SMTP id af79cd13be357-7d22986f383mr1316408485a.24.1749398860201;
        Sun, 08 Jun 2025 09:07:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkAkK134bF8HAhnjIeMvEJ6gzJOUf5lkkbjTlj+NO8H3oRmYxxEvdr+8qCIH19fwewJMeiTA==
X-Received: by 2002:a05:620a:471f:b0:7cd:3b13:c5b4 with SMTP id af79cd13be357-7d22986f383mr1316405485a.24.1749398859844;
        Sun, 08 Jun 2025 09:07:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a9d2sm818970e87.186.2025.06.08.09.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 09:07:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 08 Jun 2025 19:07:31 +0300
Subject: [PATCH 2/2] dt-bindings: usb: genesys,gl850g: add downstream
 facing ports
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250608-genesys-ports-v1-2-09ca19f6838e@oss.qualcomm.com>
References: <20250608-genesys-ports-v1-0-09ca19f6838e@oss.qualcomm.com>
In-Reply-To: <20250608-genesys-ports-v1-0-09ca19f6838e@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ja7y+pGdQgwUzowAi5cmrMH/tc4IyP9MAX2i9fmwei4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoRbVHZHbuZNbk37VsDq7RZ3NX8JKLnVMNJCYDU
 B1rJrBhkhyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaEW1RwAKCRCLPIo+Aiko
 1RS3B/oC8pc4ycmRKSl/KifoG28GEHRpiKouJURhSXjX48DWgKNWVVqojEcx3P5pcg1z2ErbCXH
 w7STIo+XWcU6Vu6ayifDnOM4aCHPB6KSgaD3eEkjUuIfQmdSmTCuPrbR66LRYcFm1OQx+FUhoXW
 JyiWFvD9R5JG4qL9gREe/xwcFPnAhIkUU8wlyGRKxB07Ls02t2MY7tgtn44vwowmtklZg+c50HQ
 5betlQVjY4+up+GpR4ynXFegvyswGQsqjtzyfm5XITNT7QhWYXpiOfcYtUQxyu9C3VL7h+KO8y+
 GfVt9BDI56lBA1CrC90upWf4VspGf2vwSBR19N6okh+1Yi5+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6845b54d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=YHzl7gtIdm5AkKPMTYkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyOCBTYWx0ZWRfX+kcrVa3LGUdv
 +yTk9cR9u4ZVSFvd9IJNV9e11ifnOX7dYOg0fF+0kNT+bZSCBuUQNm2uuIG43vQ/vTS4V43rk2Q
 fGuf4wouhcP5xWydx+uWv9SuhK1anpZFIzM/dE2BUHDbRl1WRCci8Pd7jVr2amWm+zh1PE75omq
 ij/lLuXYDEHqqyf3RrAdUMbLRA4A6sFmv86aEGzvou+q1BiX07jCGJojL7b4+QaQb6MaysZ6Avp
 /h9HWcO9A7/NOBYWYD9bv0XXFmQCJAVqlIXxWdZr/BYC4iR4DZ6EhmCDZLjSH7IP67Mg87n1MZD
 qyL3QScMcbfsdvcXojwhD8Bbh5Rxd/qfpvjUNjFlukU3j/mUFuGKFefMXz85/1Q0x+KQyv6VDmA
 qnCzs9Q0fgiSKEtGJTgNSx/ICAaF5EcQtn8hO7nUEqLrmHznmxl2SUIGE4vh0AJadz4C+zNG
X-Proofpoint-GUID: J2t0CFGzAlxJ8_LCdVjWrF2mbim_BAGY
X-Proofpoint-ORIG-GUID: J2t0CFGzAlxJ8_LCdVjWrF2mbim_BAGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=885 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080128

In order to describe connections between Genesys GL850G hub and
corresponding Type-C connectors, follow example of RTS5411 and describe
downstream facing ports. Unline normal case of ports being connected to
a USB device, hotplug ports use OF graph representation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index 7f74f181b75c5924f18d3a1b09f713ca03cf9d8c..9a94b2a74a1eb26025a183583702e9ea02372a74 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -28,6 +28,18 @@ properties:
 
   peer-hub: true
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port@':
+        $ref: /schemas/graph.yaml#/properties/port
+
+        properties:
+          reg:
+            minimum: 1
+            maximum: 4
+
 required:
   - compatible
   - reg

-- 
2.39.5


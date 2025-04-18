Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55451DED51;
	Fri, 18 Apr 2025 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744989890; cv=none; b=kpJTfRB6+SqNFc22M2F/exBJiTIRCbz3RzdRNr36HLz48NAmX/5Y5Qw9giySXwm4obgHHGijaAc/MyWH180t7R/MQIW4GCPcXmVMB0clUcFRoFEq1olgaN5j/1xv7WR8F3AEAVAznaDaBWRYHt3wzgWkDHwtELMqBHGTU/3JadM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744989890; c=relaxed/simple;
	bh=NCPmbWPsyXFhrhHM3w7lFkcdVUo1+1+u5MskX0L6jHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dbn8iIuflktJ3rdPo/JJdgktk5w+Lon2OurN/9hoxULBSfsWYKz7L+P2Mf2haJW1BoH8O8c6L+QfjWDiz/XUV7A/NKl40kjg0R3xFguTGiTjBQl2JF0H/s1EPy2VAJuqakEKOiyLqsu0rOh2h117rdEaHsHR5qIAr47sA3qfjE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4zwCleL; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4zwCleL"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73bb647eb23so1742526b3a.0;
        Fri, 18 Apr 2025 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744989888; x=1745594688; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Vo9xdmr+PF/ymIYvHV4TwvzzSabEogT1Nucn+Bx5dA=;
        b=j4zwCleLhfhtdhZu40Bsq0bknlIvzEUQNvt9/n80Hl4US7or2ugLj2AQz0y24cZYMP
         NEHx7bCMM5PL6X5aMGkkczWxAism4J+tdRWAfjbwX1zVwg5dtgxs20/5up0eUckmbAka
         IN2m9mUqN5ct3mKCHTP+zeEIFgG4bJApD5hFzSiC/V4tghiK1FUiNHmNN+LULEduEcXu
         4b0qtoRIBSAFd71rok57FtSvzrOrNPoQNNEbTK2UBbptGYLZ435hJBpTq3lzbn9W++Ya
         ALunpMOOELwP8MnC+C0D+wrLDDzQSDM7uV5wO2vCD3NxKz1MCGgpXBqSnOAMmeUPMkS7
         E2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744989888; x=1745594688;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Vo9xdmr+PF/ymIYvHV4TwvzzSabEogT1Nucn+Bx5dA=;
        b=IHKUvLzGqAflgOzrT78QZRHIFeScO03j8JGAGRATeR2+ZSL1nJGGskFYW8+B1s/OqE
         QasTsaaBvgdJIg7/Tn9JWXSKrHbAIlNNnXQvqclIsgiKQne1zqqHoa2x9+YV9kraznou
         yeTkIZH5CKxbLoqT/vcZVb6E6un+1Fla9Ml09748jmJdQchAEZQF1jH7OOu+qEwI9uBP
         Tc2U4aOlSz19VNPUfrDd15UMlikhAVVPfzRdfDsiRU7qtzNRcJMWj/UiBEKeC3ZEojab
         bES8nT0mL4suKiKUcQnIHjsebhjARE0SAW7cR4ukh8Wx6YUkOoEV3RjHajAC9xeEj258
         JTgA==
X-Forwarded-Encrypted: i=1; AJvYcCW7+kasL1n70oCC9zI/6SjZTLcgiDA27Lc1pd1Q4VO3XWNvKPSZoVWqeCSfkKVrEYClbYydRLAKcRJF3J4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWAupl1BCyemq6jdM1KsdRWmyaU0S1cGCCni6fX1VduflepVzO
	hfpaaY3yOSGRGbScQ7SGfnBbDYBg0b7r6zlv5YPM4i1NkBBmKd1J/FPBNl1sqy4=
X-Gm-Gg: ASbGncuv/eJ0Kqtdaiq+3AGNYHI5vIA6IA0E8vCikJfpUrEfsVXVSnTEmX2Yo2uNiGn
	7Jh/O6p0TeE5MepQBcjNV8VDRiosF6Gw90X9GHv+R1wZEvV3EFCi7TL3oblVJUqTE5OfmZPdfhZ
	7aaITMVqJXLapsfHezZNMLkyuB2tZ1slvMAXWbVeeBIgLeVLwAyikIFTgPa1QRGOhxv+NL2u54T
	q+dfQGaZ2z/MKeZJKzhC0+eCu00U+NoFA7AoFGjZUbztUz29+vrxgcN/LdHbjzH1nrBl4Yi4ZvL
	Tv4bXF1zJ/JCzO7ds2h6RjCYk7b0+hJpPK8COUj3psKTgUcBP5ao2V6vrk2TJN4=
X-Google-Smtp-Source: AGHT+IEa7WEKqo6mSLsZTq2NZC7mtfWg3BInlDfw2hmF6dcM3tle0qDUPI5EpOwn8FYCYA35rjPMhw==
X-Received: by 2002:a05:6a00:928e:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-73dc1582877mr4271967b3a.16.1744989887885;
        Fri, 18 Apr 2025 08:24:47 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e398asm1789064b3a.52.2025.04.18.08.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 08:24:47 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 18 Apr 2025 19:24:25 +0400
Subject: [PATCH v2] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-apc_paper_binding-v2-1-17c9023b7c9b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKhuAmgC/x3MSwqAIBRG4a3EHSeo9JC2EiFmf3UnJgoRhHtPG
 n6Dc17KSIxMU/NSws2Zr1Ch24b86cIBwVs1aal72SkjXPQ2uohkVw4bh0OYHQ7aDKOSoNrFhJ2
 f/zkvpXy+s1LKYwAAAA==
X-Change-ID: 20250418-apc_paper_binding-8feae286710e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744989890; l=2145;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=NCPmbWPsyXFhrhHM3w7lFkcdVUo1+1+u5MskX0L6jHg=;
 b=gI563Qk8lUniUKy675vjF5wxodyoei4G6dSzxope9/Zb0ifYSgUiflJHGPxZZSdxbCPcPTAVu
 sydgBZpD8WnCHQZr+o1tnWs6OJg6H7/4BTYw04kONPq/hDbmfhog87q
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

APC Rock is a development board based on WonderMedia WM8950 SoC
released around 2013. Paper is the same as Rock but lacking a
VGA port and shipped with a recycled cardboard case.

While at that, put myself as the maintainer, given that Tony is
unavailable as of lately.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Split the series from v1 into separate bindings patches so as not to
spam all the subsystems with unrelated changes, per Rob's suggestion

Changes in v2:
- kept single-valued compatibles in a single enum (thanks Rob)
- dropped the empty overall description node

Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-7-f9af689cdfc2@gmail.com/
---
 Documentation/devicetree/bindings/arm/vt8500.yaml | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/vt8500.yaml b/Documentation/devicetree/bindings/arm/vt8500.yaml
index 5d5ad5a60451f569e6ef30c924a1964d02e1aa82..f2164144a7af29ca77761bc58fe7f4558e7d101c 100644
--- a/Documentation/devicetree/bindings/arm/vt8500.yaml
+++ b/Documentation/devicetree/bindings/arm/vt8500.yaml
@@ -7,19 +7,24 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: VIA/Wondermedia VT8500 Platforms
 
 maintainers:
-  - Tony Prisk <linux@prisktech.co.nz>
-description: test
+  - Alexey Charkov <alchark@gmail.com>
 
 properties:
   $nodename:
     const: '/'
   compatible:
-    items:
-      - enum:
-          - via,vt8500
-          - wm,wm8505
-          - wm,wm8650
-          - wm,wm8750
-          - wm,wm8850
+    oneOf:
+      - items:
+          - enum:
+              - via,vt8500
+              - wm,wm8505
+              - wm,wm8650
+              - wm,wm8750
+              - wm,wm8850
+
+      - description: VIA APC Rock and Paper boards
+        items:
+          - const: via,apc-rock
+          - const: wm,wm8950
 
 additionalProperties: true

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250418-apc_paper_binding-8feae286710e

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


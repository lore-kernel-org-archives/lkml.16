Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DFA7405A;
	Tue, 29 Apr 2025 06:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745908874; cv=none; b=mnEN+T+gtsaKydJ74SLEAfWBtICCpNxSZYMulvMEQ0onVj2CgSKEBLV0AcWdlLLu4ZUNdsUS6ZcHhiyYfn7/FU96rIlN6OVi+lkRH3QEIJj0jYTx5kgF9uqg39lVHrwgR5phrGvo4mdsiDsoXC7YQtD7EvdzaiiN0DtrKyHSSGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745908874; c=relaxed/simple;
	bh=RJ6gtXbVZtCvh+lUZMhlDPTpdcGz/4dnWVHPjn6kSV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ccHdQgKt2m0mVKX9clpeBc2rgsz5e2PB81koj7kUGHWFat2M2Z6eytpatPp1y6iA44DhuupoSKg0Q846Vk5RCqHqCilp6eKidvjWIQOlSp6/Qu1OmBbemoBiAtNyjOId4ksuUz+bHayNXgrw8F5OHdf2TanMaF2SMYQG1Zg9fR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=IHIK+FDe; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=exjAB8A+ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="IHIK+FDe";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="exjAB8A+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745908871; x=1777444871;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PkMP3ZiI3GgKEDvBP4hg9KW9651hSPK9KJdmOWQbQXM=;
  b=IHIK+FDecy9POjbPDmWv5yeX/eP/9UbWeiId7nKRNUdltb4KPqfDsRYs
   Ecl1sS7QtVZFJyhB4Ap5tzURiyTHM4ZbB3my76Q5WkFRM+MJ19v5FoAAc
   XrUnPk/maZomGzftoszKVsKpw69ZB0DEt/2E/Ldb1Og3Vr3kPd/G1FF2J
   FJ1VnQ7lIMfWc8BVWd/7CHVhCtTvL1fynSE4GFNetRn3TdnSdLCxU+Lk3
   bDkZPw9rDyrPvVHoISmeKNYJwaqV1kzmPv4umW5TgjQETehTcVLOiQh5P
   dUgm3dwjIGz4IU6bXVUwuDBm6jq6HyLOg7VDa36zVkIec+aWq0LH+oVSh
   Q==;
X-CSE-ConnectionGUID: Zz1nZyZvREm7cwggjdJuqA==
X-CSE-MsgGUID: Vz4QiECOTkef6qTLkshgBQ==
X-IronPort-AV: E=Sophos;i="6.15,248,1739833200"; 
   d="scan'208";a="43770687"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Apr 2025 08:41:08 +0200
X-CheckPoint: {68107484-4-2417938-F0170C2B}
X-MAIL-CPID: 8B02CB2F6CFE0439DB61025BD08A5C8A_2
X-Control-Analysis: str=0001.0A006375.68107483.000D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1026D161081;
	Tue, 29 Apr 2025 08:41:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745908863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PkMP3ZiI3GgKEDvBP4hg9KW9651hSPK9KJdmOWQbQXM=;
	b=exjAB8A+WTXI83fXvKExdcf+5Kmmobo5UXnwJD6z0N3NGpRhq85EnNK7vgACa+MSECVpUQ
	jE5UaJEtrzEVpNZYITVnv9j3LVfFCd/yhybsZAEMlagUMnblMSbTQuRjVOqvV8mhBrQnC3
	rL7FGMj2OtwLhVMmfC5Y/CV2m4TnXF919d15X5g9E04TuB3dS5njlJUyT8q8q1pgWA5VyT
	VlpHyWjBx00AYFQQkvBE2CpIpmK8lxiQvB6QXWhj+kWseEf/LKzJ5Ud8BCAN/XE3kaD8Jo
	eozoi4Mt41YBQOArYkhn94/ec/TxpCuZeVfL4Y7e3yGSK5LCYQj0xydyZ+o7NA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] dt: bindings: arm: add bindings for TQMLS1012AL
Date: Tue, 29 Apr 2025 08:40:53 +0200
Message-ID: <20250429064056.869222-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

TQMLS1012AL is a SOM using NXP LS1012A CPU. MBLS1012AL is a carrier
reference design.

[1] https://www.tq-group.com/en/products/tq-embedded/qoriq-layerscape/tqmls1012al

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5ff0bc6c92483..8b9d96c5edc65 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1538,6 +1538,12 @@ properties:
               - fsl,ls1012a-qds
           - const: fsl,ls1012a
 
+      - description: TQ Systems TQMLS12AL SoM on MBLS1012AL board
+        items:
+          - const: tq,ls1012a-tqmls1012al-mbls1012al
+          - const: tq,ls1012a-tqmls1012al
+          - const: fsl,ls1012a
+
       - description: LS1021A based Boards
         items:
           - enum:
-- 
2.43.0


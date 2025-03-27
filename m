Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A777A21A42C;
	Thu, 27 Mar 2025 14:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086542; cv=none; b=j7rjadvR/LIokpFP2FqjFbEBA4zx2BzXzXJaM/WTwmL5rzk4SCZQ785k85ZCmvTVWZA+u6iSf91rHImDBLzN0YRTdRw4rgyijhJzvp4WX3GLY+sfU6GRptMNncFziBzZNTxUoksIDHeqmj5fkemFZGAxDaAcAyGvR+QW24jsSuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086542; c=relaxed/simple;
	bh=K4hbuDBtgMNqSlKw4GfKX7Ni5NNKcWd6SVVRt1I/7AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nPSJy1Gl7NtGx55di2aGc/3DHSy/gyhgz5RugGk81MoFAC2trqtwW+s99Y3gYt4P3He4ajPcGEjy81uwTXS3G/1EBqSjl5Zfkv0mf3bYHWFLYcO2/X9s3WZ+vxrVzt0/3ZlTO4A2RWQ+9e5Jbi7ARJJSHBhGwifDtARG/Lb+ORk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=aui0HEVK; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=iaBD9b9v reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="aui0HEVK";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="iaBD9b9v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743086541; x=1774622541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=srwM4VsZ3yBl7ZsVSs0wHvvduH05/skwoi+WfoH3Tmo=;
  b=aui0HEVKp5NeKdJxzHC3T9sGq4vah9aq1GHnmTpKB/soX01vgN+o/5qM
   ikdmxUHn7Rk7Zbvxcm4HZEicZxg7RmrQsJeBfUOD96wZMtsL7fOSULdlU
   krBczcRRMRLQ9wAuSuLI55VJbKNqed0VqbwZ9IS5l3J3bVWY3mN8P7rGc
   hrlTDur0q7Oq23sH0py7q7klIo6DtICSRsaULkMTiXavP7XnRabpyqd4t
   kXEFpDWF/WdvwjspleAI/ErykHktdd9ilUUBAMxhrc7ok1cPJd1cnCuGe
   bvMpiR7Wg1XfH13jZTN2MIMhnFhwirwD2PldiXhDcR6uQBXSX1KN91B93
   g==;
X-CSE-ConnectionGUID: pS1I6QmnQoO+BIuMOgiltg==
X-CSE-MsgGUID: iFM4zChRT5e9kvjR21TWOA==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43199531"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 15:42:20 +0100
X-CheckPoint: {67E563CB-1D-903EAEAC-E04C76C8}
X-MAIL-CPID: 94219BFC4AF9ED8D941571B08335DEB8_5
X-Control-Analysis: str=0001.0A006396.67E563C4.0009,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69A4E16C181;
	Thu, 27 Mar 2025 15:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743086535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=srwM4VsZ3yBl7ZsVSs0wHvvduH05/skwoi+WfoH3Tmo=;
	b=iaBD9b9vTEq2NAOOIK5ytG3gc3B/jeqSt17kFp2XUUAvYSbfRn+rdT8CfiweucE6GH+cCY
	SXEbXx0GJih0T20HHB/TRe4CanZwQfcaFHDW+YXFAA1tVBCqbda+090dI+KbWLb3hqRc5M
	iWJQk/lb8uoYx77p696vrjzIgTrxqhhwjEls/mVR/B95LWi8sRmblnA/J5MCP9Xr/PFbpz
	5RTh5xaVZz3wtqvUzTlRYPtLZDf0IxZ+1S0Iq4H1nHS6BrPAt3MjJ5biYltytMiNPf/x2B
	n4JSyFNYRpcVojUcLNpQWdwMDrOd/qsoDHeWCtD57xTnWEgGQeCdP7YNNRI8Hg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] ARM: dts: ls1021a-tqmals1021a: change sound card model name
Date: Thu, 27 Mar 2025 15:41:13 +0100
Message-ID: <20250327144118.504260-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The card name for ALSA is generated from the model name string and
is limited to 16 characters. Use a shorter name to prevent cutting the
name.
MBLS1021A uses the same audio codec as most i.MX based starter kits
by TQ-Systems. Adjust the sound card model to i.MX based platforms,
as done by commit e6303798b6ac4 ("arm64: dts: imx8mp-tqma8mpql-mba8mpxl:
change sound card model name"). This allows sharing a default asound.conf
in BSP over all the kits.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
index 80dae0c09542d..5606585dd5607 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
@@ -157,7 +157,7 @@ port {
 
 	sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
-		model = "ls1021a-mbls1021a-tlv320aic32";
+		model = "tqm-tlv320aic32";
 		ssi-controller = <&sai1>;
 		audio-codec = <&tlv320aic32x4>;
 	};
-- 
2.43.0


Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957F61BBBC6;
	Mon, 10 Feb 2025 07:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173789; cv=none; b=P/FNYgyDZO+QfmOr+9C7t21EOOormTuEWF2Sn3un2QXwahsHDwcoAshwZNJZzeaiW0xtF+hXlvrjFEfTCuZ4i0XgW52KT4+h5TPVdu3dYHdAq0iq0k+5qtbb/HmwxZ8UJNzIHq0LUPz1Nne4URWqGX0yDZJycMVI7nTWwRO+jPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173789; c=relaxed/simple;
	bh=t7BojFO2BFNEjIQJlfGNh36+RiRu0kqp2jGB0dkuQNk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eF9tBhiLyXIhEdCJUHpngZa6wPNyv7WYaHoao9RDfj6ytrsBa478b2vTIuXVGxTj3wt6a+evYn9HgQ53aviDrglfgUJt+vSrAtqlI8sLKyNavDkuXCWXmY3vTFj6mGo8//L52hRKaeUigm9fmNgqQRETE6C85IwuBAmC/te8yeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dH13TtD4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dH13TtD4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739173788; x=1770709788;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=t7BojFO2BFNEjIQJlfGNh36+RiRu0kqp2jGB0dkuQNk=;
  b=dH13TtD4r57Va4uP+9HThwncKmKsAlSsylDKyXhw/rVqCsoNJV6w0Njo
   NtTvGopn1ZqVNieDoL4wJ48n9LVSxFdFBf3Ch/ni6jiGP9J6wSgsDuU1A
   q4iAFAnIGc9qoxV0Yy91h7+GaYZ9u1ZwlaBaBMEkjktJ8ec7V3hO1kwzl
   hRlgVXlcqYf2BKOmh9dxHf8mYLqyMDusw7jbzzUTtVTlj7xnF6wTwt5/T
   +SmqELnvTqVmHcz7ULojO/+B/s+cE7GE2QMrQypehsL6S8rf9BCe5wt4m
   moGg38tP2Brs8ACOPeBoSuBoRdlS/mRMDk7goAmsvQDhUk12nwBRexrdm
   g==;
X-CSE-ConnectionGUID: 9uZwC9LXRu2IoE+MeFl30A==
X-CSE-MsgGUID: k1QDl1huTyKbu2mPvOmOWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39426972"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39426972"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 23:49:47 -0800
X-CSE-ConnectionGUID: 80wACqjcTiix0SMlw3hLog==
X-CSE-MsgGUID: wmcxI/vbQkCaWR7vTVe9DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142994889"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by fmviesa001.fm.intel.com with ESMTP; 09 Feb 2025 23:49:45 -0800
From: niravkumar.l.rabara@intel.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	niravkumar.l.rabara@intel.com,
	nirav.rabara@altera.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: intel: document Agilex5 NAND daughter board
Date: Mon, 10 Feb 2025 15:46:03 +0800
Message-Id: <20250210074604.2410783-2-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210074604.2410783-1-niravkumar.l.rabara@intel.com>
References: <20250210074604.2410783-1-niravkumar.l.rabara@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>

Agilex5 devkit supports a separate NAND daughter board.
Document Agilex5 NAND daughter board compatible.

Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
---
 Documentation/devicetree/bindings/arm/intel,socfpga.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/intel,socfpga.yaml b/Documentation/devicetree/bindings/arm/intel,socfpga.yaml
index 2ee0c740eb56..c75cd7d29f1a 100644
--- a/Documentation/devicetree/bindings/arm/intel,socfpga.yaml
+++ b/Documentation/devicetree/bindings/arm/intel,socfpga.yaml
@@ -25,6 +25,7 @@ properties:
         items:
           - enum:
               - intel,socfpga-agilex5-socdk
+              - intel,socfpga-agilex5-socdk-nand
           - const: intel,socfpga-agilex5
 
 additionalProperties: true
-- 
2.25.1


Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E2020E03A;
	Mon,  3 Feb 2025 19:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610134; cv=none; b=kKcVnEHCtN2JJDMMvlWfG7D7CxakT3dNp02jBdAWc6SuASnPWDetT7bP6WFzSIM0SrSvoL1YyPYUJrTQG45aaTXNenWwlLdqWqkBl0nRngiEBY53W3f+Ilch5J8mgl3u5fNGbBERx6wCWvHxQyal15LrelWJLxTbBw81MB55RGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610134; c=relaxed/simple;
	bh=d+uS1eRC4uv8qsZyfw2IqkLl0y5gISjVkWAiQ1IdAaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=byS7Z3SfbwmjIVMjZ7/vQyLPH2n8kq39OoUo90fI5k/+bNpaTk1NGwimGOZKCft9EoTtJyQjGy19hEJw7EFf7mkv5AfZzuavDvFnCt3H1IEwyTr4dlYQAP2HBoeiUQLEGzDNJYHTDPgrD142oRGBFawUrNhQYYB23cJKVyNxpyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYAHESxf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYAHESxf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738610133; x=1770146133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d+uS1eRC4uv8qsZyfw2IqkLl0y5gISjVkWAiQ1IdAaU=;
  b=LYAHESxfaQ2EBQzFFhQXnvSrZSNd/n5N/p7p9nMHhicObyC1P5IXWioo
   GdlXBW2FkXSQe5rQuz52yGCNG8jJjfRzGRg79avoWG2ThXEVsQw3TFxvT
   nlIwXfUP0u0ZAmFJq1kiujXm8eqcpaiscy7ilHfMQOdMjrBYChZow/DMV
   ZYoPu7KLERFeBGo+00jye4AqJw4cjtyOFQGJyvrQeyXxUFErqA9I3qoI6
   faY4mFCs7yBPWn70X85tfPLFg9jb4JYJDM21xto+JaPx/ovN/TpfifnyF
   9KuwChj4h8NuEmeBsSIjSw5MxAws34dr0fag8KGWjVfEo/scE3x5x2GYR
   Q==;
X-CSE-ConnectionGUID: JBwQ4cliRHaiEbt0CiFJsg==
X-CSE-MsgGUID: n3Z292rJTwmlmCWftAoGnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="43043119"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="43043119"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 11:15:30 -0800
X-CSE-ConnectionGUID: O1XQPjtoSwmwyfT1n0vA2A==
X-CSE-MsgGUID: 8QqbGjarSZe1lLH1JTmVMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="110266548"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2025 11:15:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C5D47164; Mon, 03 Feb 2025 21:15:25 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ferry Toth <fntoth@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/3] dt-bindings: usb: dwc3: Add a property to reserve endpoints
Date: Mon,  3 Feb 2025 21:10:53 +0200
Message-ID: <20250203191524.3730346-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250203191524.3730346-1-andriy.shevchenko@linux.intel.com>
References: <20250203191524.3730346-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the endpoints may be reserved by hardware for different purposes,
e.g., tracing control and output. This is the case, for instance, on
Intel Merrifield and Moorefield platforms that reserve a few and USB driver
may not use them for the regular transfers. Add the respective bindings.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../devicetree/bindings/usb/snps,dwc3-common.yaml     | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index c956053fd036..71249b6ba616 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -65,6 +65,17 @@ properties:
       mode.
     type: boolean
 
+  snps,reserved-endpoints:
+    description:
+      Reserve endpoints for other needs, e.g, for tracing control and output.
+      When set, the driver will avoid using them for the regular USB transfers.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 1
+    maxItems: 30
+    items:
+      minimum: 2
+      maximum: 31
+
   snps,dis-start-transfer-quirk:
     description:
       When set, disable isoc START TRANSFER command failure SW work-around
-- 
2.43.0.rc1.1336.g36b5255a03ac


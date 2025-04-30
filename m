Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853232C2583;
	Wed, 30 Apr 2025 21:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048082; cv=none; b=Ckfix3Ls4KwYPDw3SwyJ+K9vH6fPtVFZSaXLJn4vPks4JJPZ4fddDLajAw7bg7K6hkyc5ZBk/eemjZp+OjoM/0tGJhjxHDjy+YsRuKCGywYjm/sz85Y8SLpj5rqbM/nQHXJ16hPnIGXD4xbG//Who38pcDnVKnnPcNbj53bDfjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048082; c=relaxed/simple;
	bh=CgqvTLqMp5Pc9P/negzRDW0LhWMLF/K0jS1thugiIIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJLJmloNSqaebitVNbyPN8/LVi9pxrgspcXEGeQF3aHJ6yRQZk1KCm/WOm/EVVjE/Mjh5mbmzONpCE5gy5ZJ1ee1WsrA048RPOiVZqHsDloSdCFR4Xuz+tp8fdBiIpmXYtIcjy9GUNuVW1a+DM6y/EnMjh8aMnhNSOpTyiUEG4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGpHE5xJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGpHE5xJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746048081; x=1777584081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CgqvTLqMp5Pc9P/negzRDW0LhWMLF/K0jS1thugiIIA=;
  b=NGpHE5xJIrEHOKmx8KfJXG1ud4qfHKc0jXuc9+dr/4cbL2QQOmnV24kz
   c0OlWkNtujldg6tZjslqr7lHuInE+Yx0eQbutRwkSpVTQjTaQWHjASore
   bl5JjHgLo0dEp+JG6RuGeDJwjOg85yE6QZmAKYRakRWPaj0EtGa2cW+I5
   V5ZgHT7biWZGM53xo2P7Iqtw5bfoiLQJt2U5o28ByGnzTWrCuMSBpyjKx
   L+OLnRQpAlXWj/ufh9J9qivf76BAgEaBXlpzxa/jFJ/aXb4pBDbQ2IXlW
   ePobA+iFaXkckCbpf3/8HguuYPnbT9FlNGHpKGW1TcjQyOsQN0O9w4Cji
   w==;
X-CSE-ConnectionGUID: F+zSbz66R8axLbu0dfzGSA==
X-CSE-MsgGUID: JGzv2XPATcW1IPG03L9cPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65257539"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="65257539"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:16 -0700
X-CSE-ConnectionGUID: vG1AsXeZQRue+JkjS21soQ==
X-CSE-MsgGUID: V+rrnTEjSEGRKja3LSTYbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="133972282"
Received: from agladkov-desk.ger.corp.intel.com (HELO debox1-desk4.lan) ([10.125.110.57])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:16 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	tony.luck@intel.com,
	xi.pardee@linux.intel.com
Cc: hdegoede@redhat.com
Subject: [PATCH 05/15] platform/x86/intel/vsec: Skip absent features during initialization
Date: Wed, 30 Apr 2025 14:20:54 -0700
Message-ID: <20250430212106.369208-6-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430212106.369208-1-david.e.box@linux.intel.com>
References: <20250430212106.369208-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Some VSEC features depend on the presence of supplier features that may not
always be present. To prevent unnecessary retries and device linking during
initialization, introduce logic to skip attempts to link consumers to
missing suppliers.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 8700ed7656df..dc3f36afcd09 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -564,12 +564,31 @@ static void intel_vsec_feature_walk(struct pci_dev *p=
dev, bool *have_devices,
 		*have_devices =3D true;
 }
=20
+static void intel_vsec_skip_missing_dependencies(struct pci_dev *pdev)
+{
+	struct vsec_priv *priv =3D pci_get_drvdata(pdev);
+	const struct vsec_feature_dependency *deps =3D priv->info->deps;
+	int consumer_id =3D priv->info->num_deps;
+
+	while (consumer_id--) {
+		int supplier_id;
+
+		deps =3D &priv->info->deps[consumer_id];
+
+		for_each_set_bit(supplier_id, &deps->supplier_bitmap, VSEC_FEATURE_COUNT=
) {
+			if (!(BIT(supplier_id) & priv->found_caps))
+				priv->state[supplier_id] =3D STATE_SKIP;
+		}
+	}
+}
+
 static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_dev=
ice_id *id)
 {
 	struct intel_vsec_platform_info *info;
 	struct vsec_priv *priv;
 	bool have_devices =3D false;
 	int num_caps, ret;
+	int run_once =3D 0;
=20
 	ret =3D pcim_enable_device(pdev);
 	if (ret)
@@ -593,6 +612,11 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, =
const struct pci_device_id
=20
 		if (priv->found_caps =3D=3D priv->info->caps)
 			break;
+
+		if (!run_once) {
+			intel_vsec_skip_missing_dependencies(pdev);
+			run_once =3D 1;
+		}
 	}
=20
 	if (!have_devices)
--=20
2.43.0


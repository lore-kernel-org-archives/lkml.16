Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1491A840A;
	Tue, 17 Jun 2025 01:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124454; cv=none; b=cnB+CO10Vvsmku5zm4XsVmUhX/cDO/YuehTsdN7mdGjdUk9535txYBYmigTqm0o3QE/+ESq0OEvFnqazxSclfII3EZyXYyMzGcXDXYMmISJXVw00dtoJP+7Pia8uEfVRmhtra1irV51Zs5ZFeS5D//hbPue4RZPd38lG5Re8OWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124454; c=relaxed/simple;
	bh=fnNy2300F4fNazQu+CwpRxz57yQpIn0TkQNblICptZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C9KWXS4clQCN7fmgrFO5PkkzOZSxgZzvA/w1ACFkZc/NS5kHGfKL6XEVHnXHuOa5TLxroOC+cHXFn3UBEGEbwepQ6FRwmR/mRmGq47K+lnmo4QY44kLqgtNJ1ZuWoEI6TPJyzmsouV8Si4F0rMxKF5KqmwOXhcmraTlwqT3buc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fO15wIQJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fO15wIQJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750124453; x=1781660453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fnNy2300F4fNazQu+CwpRxz57yQpIn0TkQNblICptZ8=;
  b=fO15wIQJgZl5vRqBEy7KaOUS0vKHS/GzGa9P0dtqCok26zE41YrSew3q
   c2xP8jq3w2vYX6lHO7qIXoZ8/ecpFpe5zjRKpVFAatLUtetmwUgDM8pOS
   ZsEgNoh1sxfGk48zWJ41EYbOtKzKIj201cZoY8KTVfVzic6Vvnb9JAZFy
   HZfCaf5UHVuSDziv5F6pMhoEGjsGCHIxSKFda9f1qV0dCcxM11EAvj37l
   rbttiPb/JkK7EDiPj00IkuAUwBmDUUv7MUUfn1pq6a6X5mUAqc0J4TIqQ
   /CqRX/fA1qxStUkfzTkRtQ2wPbNCgwRrqxIWfAVbTXfl92Pv2qZ9ctR57
   w==;
X-CSE-ConnectionGUID: i/rjlz19R7yUTIzT5BR5zw==
X-CSE-MsgGUID: G/FQb+nFTNCT9hRgUg7+Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62556537"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="62556537"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:51 -0700
X-CSE-ConnectionGUID: oyn90jnDT1qdu9GSCiVv3Q==
X-CSE-MsgGUID: TsLMDAD/ShqcpacpcEHkqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148989447"
Received: from spandruv-desk2.amr.corp.intel.com (HELO debox1-desk4.intel.com) ([10.124.223.117])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:50 -0700
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
Subject: [PATCH V2 03/15] platform/x86/intel/vsec: Create wrapper to walk PCI config space
Date: Mon, 16 Jun 2025 18:40:27 -0700
Message-ID: <20250617014041.2861032-4-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617014041.2861032-1-david.e.box@linux.intel.com>
References: <20250617014041.2861032-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Combine three PCI config space walkers =E2=80=94 intel_vsec_walk_dvsec(),
intel_vsec_walk_vsec(), and intel_vsec_walk_header() =E2=80=94 into a new w=
rapper
function, intel_vsec_feature_walk().  This refactoring simplifies the probe
logic and lays the groundwork for future patches that will loop over these
calls. No functional changes.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

Changes in v2:
  - No changes

 drivers/platform/x86/intel/vsec.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 59fb6568a855..f01651f498ca 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -349,6 +349,27 @@ int intel_vsec_register(struct pci_dev *pdev,
 }
 EXPORT_SYMBOL_NS_GPL(intel_vsec_register, "INTEL_VSEC");
=20
+static void intel_vsec_feature_walk(struct pci_dev *pdev, bool *have_devic=
es,
+				    struct intel_vsec_platform_info *info)
+{
+	/*
+	 * Both DVSEC and VSEC capabilities can exist on the same device,
+	 * so both intel_vsec_walk_dvsec() and intel_vsec_walk_vsec() must be
+	 * called independently. Additionally, intel_vsec_walk_header() is
+	 * needed for devices that do not have VSEC/DVSEC but provide the
+	 * information via device_data.
+	 */
+	if (intel_vsec_walk_dvsec(pdev, info))
+		*have_devices =3D true;
+
+	if (intel_vsec_walk_vsec(pdev, info))
+		*have_devices =3D true;
+
+	if (info && (info->quirks & VSEC_QUIRK_NO_DVSEC) &&
+	    intel_vsec_walk_header(pdev, info))
+		*have_devices =3D true;
+}
+
 static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_dev=
ice_id *id)
 {
 	struct intel_vsec_platform_info *info;
@@ -372,15 +393,7 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, =
const struct pci_device_id
 	priv->info =3D info;
 	pci_set_drvdata(pdev, priv);
=20
-	if (intel_vsec_walk_dvsec(pdev, info))
-		have_devices =3D true;
-
-	if (intel_vsec_walk_vsec(pdev, info))
-		have_devices =3D true;
-
-	if (info && (info->quirks & VSEC_QUIRK_NO_DVSEC) &&
-	    intel_vsec_walk_header(pdev, info))
-		have_devices =3D true;
+	intel_vsec_feature_walk(pdev, &have_devices, info);
=20
 	if (!have_devices)
 		return -ENODEV;
--=20
2.43.0


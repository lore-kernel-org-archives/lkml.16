Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48B120371F;
	Mon,  7 Apr 2025 17:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744045733; cv=none; b=BOVLz9UQ9gfIUwsZbKiivdkVFZaN8qNKnLI4pw6uZAZKJLJZrD4s0A3v9Kb2tHt/JL+iROM6ERnVMBcu48lH33GRf0xm4CERvlcQ97wnJ2aHpUGSRh7nLeimi2fPabzMJy6lmC6TuqrYFQtmt7ba7PGYwba+Iz3UfUxkachUFOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744045733; c=relaxed/simple;
	bh=VqC0gfQpUdwBMUNFwXYIIN11f43l0CgIeOiIwf8U8C8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=E34lQf/QhCCJ4ndRC2MTTczGFxoO6K5ndmU/T05Ty2n3HnD5bDhq6Z153eSAJtm7DFn5ZN7b7lzh0d1uBNaSXiVhJ0b4X9uxiXrurOKfkg6tkiNMYumKLf0UC8CjDKZDUeL2qTpccqvlr+2jdQBgkkiFxSXXCbKPmT2kC9JU5XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mgyQJi9r; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgyQJi9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744045732; x=1775581732;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VqC0gfQpUdwBMUNFwXYIIN11f43l0CgIeOiIwf8U8C8=;
  b=mgyQJi9rMvb1TSrNge00Gm/wZzQQT6Rh/bJts7PK2Ofks5r6naoggKtt
   yQglQQyZpMb/eLIpVgNKd1b2jPQsqeMbqWJNwxNJFUVF+5D3cTiXwvrT4
   iGJgbl87CSsZAzcaezpOBUNtp2qs+klAOgZ2q4eMEZ2ScAJKn8yxm2V02
   D4G9f9ayiDSlrRBG2ut4yp9g2EOAFcjqmjMzul7Dcnov8x29X+UbqA5Uy
   DgoeJREw/99lLEEBXw8CAiLruOJuaNNbXc2XuHvo8sQ0MX2+fDxaT3/Sw
   XLL4rhx7qpYww98JebOo8tHGIvuFXgJIlOtZK5wSb++xQ/m02MeFNkuAc
   g==;
X-CSE-ConnectionGUID: InXoTXBeTYuxhH3dCueydg==
X-CSE-MsgGUID: XTfeWK/GS/SEGtgEUZH8wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45347690"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45347690"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 10:08:51 -0700
X-CSE-ConnectionGUID: Pl/JhWbxRWmQqVICCDelQQ==
X-CSE-MsgGUID: vcK/BNsTRgiMtntE37fklQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132742013"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 10:08:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kenneth Chan <kenneth.t.chan@gmail.com>,
	Mattia Dongili <malattia@linux.it>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Herton Ronaldo Krzesinski <herton@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net
Subject: [PATCH 1/1] platform/x86: Use strscpy()/scnprintf() with acpi_device_name/class()
Date: Mon,  7 Apr 2025 20:08:38 +0300
Message-Id: <20250407170839.2153-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace strcpy() and sprintf() for acpi_device_name/class() targets
with safer variant. In one case, scnprintf() is necessary but the
rest can use strscpy().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/eeepc-laptop.c     |  4 ++--
 drivers/platform/x86/panasonic-laptop.c |  4 ++--
 drivers/platform/x86/sony-laptop.c      |  4 ++--
 drivers/platform/x86/thinkpad_acpi.c    |  6 +++---
 drivers/platform/x86/topstar-laptop.c   |  4 ++--
 drivers/platform/x86/xo15-ebook.c       | 10 +++-------
 6 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index f52fbc4924d4..d1908815f5a2 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -1370,8 +1370,8 @@ static int eeepc_acpi_add(struct acpi_device *device)
 	if (!eeepc)
 		return -ENOMEM;
 	eeepc->handle = device->handle;
-	strcpy(acpi_device_name(device), EEEPC_ACPI_DEVICE_NAME);
-	strcpy(acpi_device_class(device), EEEPC_ACPI_CLASS);
+	strscpy(acpi_device_name(device), EEEPC_ACPI_DEVICE_NAME);
+	strscpy(acpi_device_class(device), EEEPC_ACPI_CLASS);
 	device->driver_data = eeepc;
 	eeepc->device = device;
 
diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 2987b4db6009..255317e6fec8 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -1033,8 +1033,8 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
 	pcc->handle = device->handle;
 	pcc->num_sifr = num_sifr;
 	device->driver_data = pcc;
-	strcpy(acpi_device_name(device), ACPI_PCC_DEVICE_NAME);
-	strcpy(acpi_device_class(device), ACPI_PCC_CLASS);
+	strscpy(acpi_device_name(device), ACPI_PCC_DEVICE_NAME);
+	strscpy(acpi_device_class(device), ACPI_PCC_CLASS);
 
 	result = acpi_pcc_init_input(pcc);
 	if (result) {
diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 3197aaa69da7..59f184f7c72f 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -3157,7 +3157,7 @@ static int sony_nc_add(struct acpi_device *device)
 	struct sony_nc_value *item;
 
 	sony_nc_acpi_device = device;
-	strcpy(acpi_device_class(device), "sony/hotkey");
+	strscpy(acpi_device_class(device), "sony/hotkey");
 
 	sony_nc_acpi_handle = device->handle;
 
@@ -4677,7 +4677,7 @@ static int sony_pic_add(struct acpi_device *device)
 	struct sony_pic_irq *irq, *tmp_irq;
 
 	spic_dev.acpi_dev = device;
-	strcpy(acpi_device_class(device), "sony/hotkey");
+	strscpy(acpi_device_class(device), "sony/hotkey");
 	sony_pic_detect_device_type(&spic_dev);
 	mutex_init(&spic_dev.lock);
 
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 0384cf311878..519ce3cf9ed0 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -835,9 +835,9 @@ static int __init setup_acpi_notify(struct ibm_struct *ibm)
 	}
 
 	ibm->acpi->device->driver_data = ibm;
-	sprintf(acpi_device_class(ibm->acpi->device), "%s/%s",
-		TPACPI_ACPI_EVENT_PREFIX,
-		ibm->name);
+	scnprintf(acpi_device_class(ibm->acpi->device),
+		  sizeof(acpi_device_class(ibm->acpi->device)),
+		  "%s/%s", TPACPI_ACPI_EVENT_PREFIX, ibm->name);
 
 	status = acpi_install_notify_handler(*ibm->acpi->handle,
 			ibm->acpi->type, dispatch_acpi_notify, ibm);
diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
index 20df1ebefc30..53fc2b364552 100644
--- a/drivers/platform/x86/topstar-laptop.c
+++ b/drivers/platform/x86/topstar-laptop.c
@@ -296,8 +296,8 @@ static int topstar_acpi_add(struct acpi_device *device)
 	if (!topstar)
 		return -ENOMEM;
 
-	strcpy(acpi_device_name(device), "Topstar TPSACPI");
-	strcpy(acpi_device_class(device), TOPSTAR_LAPTOP_CLASS);
+	strscpy(acpi_device_name(device), "Topstar TPSACPI");
+	strscpy(acpi_device_class(device), TOPSTAR_LAPTOP_CLASS);
 	device->driver_data = topstar;
 	topstar->device = device;
 
diff --git a/drivers/platform/x86/xo15-ebook.c b/drivers/platform/x86/xo15-ebook.c
index df2bf1c58523..cb02222c978c 100644
--- a/drivers/platform/x86/xo15-ebook.c
+++ b/drivers/platform/x86/xo15-ebook.c
@@ -84,7 +84,6 @@ static int ebook_switch_add(struct acpi_device *device)
 	const struct acpi_device_id *id;
 	struct ebook_switch *button;
 	struct input_dev *input;
-	char *name, *class;
 	int error;
 
 	button = kzalloc(sizeof(struct ebook_switch), GFP_KERNEL);
@@ -99,9 +98,6 @@ static int ebook_switch_add(struct acpi_device *device)
 		goto err_free_button;
 	}
 
-	name = acpi_device_name(device);
-	class = acpi_device_class(device);
-
 	id = acpi_match_acpi_device(ebook_device_ids, device);
 	if (!id) {
 		dev_err(&device->dev, "Unsupported hid\n");
@@ -109,12 +105,12 @@ static int ebook_switch_add(struct acpi_device *device)
 		goto err_free_input;
 	}
 
-	strcpy(name, XO15_EBOOK_DEVICE_NAME);
-	sprintf(class, "%s/%s", XO15_EBOOK_CLASS, XO15_EBOOK_SUBCLASS);
+	strscpy(acpi_device_name(device), XO15_EBOOK_DEVICE_NAME);
+	strscpy(acpi_device_class(device), XO15_EBOOK_CLASS "/" XO15_EBOOK_SUBCLASS);
 
 	snprintf(button->phys, sizeof(button->phys), "%s/button/input0", id->id);
 
-	input->name = name;
+	input->name = acpi_device_name(device);
 	input->phys = button->phys;
 	input->id.bustype = BUS_HOST;
 	input->dev.parent = &device->dev;

base-commit: 1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95
-- 
2.39.5


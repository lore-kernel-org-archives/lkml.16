Received: from pf-012.whm.fr-par.scw.cloud (pf-012.whm.fr-par.scw.cloud [51.159.173.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA88A295DB8;
	Fri, 20 Jun 2025 14:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.173.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430792; cv=none; b=ciHPFV8fONuB0Yx6lbHRcp+vJL3UAHFf6Oh9sZVgicAMYx6V646NFKCJjYUd0wuyL7kZGDRy/xYAGYiJjPtPm72FpxVC7Q+jc0Y+gEbLMrF3xvg5aFVzjuEK4P0Q2X50DH2Vd1qFBpOVMHw9FMgP6RRH38c1/0jWavM0GwEbH+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430792; c=relaxed/simple;
	bh=nKJpLyVb3Mf+ZB2BJ5zQqKhJeaFKSpYxxkFva1A7Y0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EslalPNLirgvYc3h0B9XyTu5J/9Md9gpdOKLbh0qwnnXQxBurd4MV+CDYzMqSEhEgueyCqNY0/gxOmeHGIXZncJe77M8u1tyN327aY2wQKJP771x7uh2vF7gUsSOAFCMF2OaGF4SP60SQquTGHa+OjlpSbTih67h6Y/aQNtfcnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=q7QM1RgV; arc=none smtp.client-ip=51.159.173.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b="q7QM1RgV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y4GtbjwsgXd9i+tuWT0wCJrZu63vjEneWpfP0tEUUag=; b=q7QM1RgVzshpD+9pwDkduM7xk0
	JQ63YK8yctjaazdpQsnz2BoHCC+sKC6m65lXI7hha3ab3YsncUFMfwdVV/uZcleBfcBaVgeaeVOWZ
	I9VAmGZq7thgN6PjqwWTh2S405ZASD9S3BGhb9gqdPH91b9ldj/w2wjuZVsKB95gafeh5f0kNKNwQ
	0KaHm+puCji1UWUgLjJIEek/qhKmTbhlgJgnzIeJ931rcD9eaRaXAmmY6bC9ri0/MG+krzbPFyQor
	dmBSyLtWfuh1DQkyS52bCLyhO4Qs0olw+ATjv713SaaRAD/ALLxjEUdiQ0nEIILU9pdHGjnmOcyMp
	B+gIsCbA==;
Received: from laubervilliers-658-1-215-187.w90-63.abo.wanadoo.fr ([90.63.246.187]:43571 helo=[10.224.8.110])
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <nicolas.bouchinet@oss.cyber.gouv.fr>)
	id 1uScib-00000007rNQ-3xdT;
	Fri, 20 Jun 2025 16:27:46 +0200
From: nicolas.bouchinet@oss.cyber.gouv.fr
Date: Fri, 20 Jun 2025 16:27:18 +0200
Subject: [RFC PATCH 3/4] usb: core: Plug the usb authentication capability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250620-usb_authentication-v1-3-0d92261a5779@ssi.gouv.fr>
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
In-Reply-To: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
 Kannappan R <r.kannappan@intel.com>, 
 Sabyrzhan Tasbolatov <snovitoll@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Pawel Laszczak <pawell@cadence.com>, 
 Ma Ke <make_ruc2021@163.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>, 
 Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>, 
 Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-Mailer: b4 0.14.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: nicolas.bouchinet@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: nicolas.bouchinet@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>

Plugs the usb authentication implementation in the usb stack and more
particularly in the usb_parse_configuration function after the BOS has
been parsed and the usb authentication capacity has been controlled.

The authentication bulk is implemented by the usb_authenticate_device
function.

The authorization decision enforcement is done via the authorized field of
the usb_device and the associated authorization and deauthorization functions.
The usb_device also contains an authenticated field that could be used to track
the result of the authentication process and allow for more complex security
policy: the user could manually authorize a device that failed the
authentication or manually deauthorize a device that was previously
authenticated.

The usb_authenticate_device returns 0 or an error code. If 0 is
returned, the authorized and authenticated fields of the usb_device are
updated with the result of the authentication.

Co-developed-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
Signed-off-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
Signed-off-by: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
---
 drivers/usb/core/config.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/usb/core/hub.c    |  6 ++++++
 drivers/usb/core/usb.c    |  5 +++++
 include/linux/usb.h       |  2 ++
 4 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 13bd4ec4ea5f7a6fef615b6f50b1acb3bbe44ba4..45ee8e93e263c41f1bf4271be4e69ccfcac3f650 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -14,6 +14,7 @@
 #include <asm/byteorder.h>
 #include "usb.h"
 
+#include "authent.h"
 
 #define USB_MAXALTSETTING		128	/* Hard limit */
 
@@ -824,7 +825,50 @@ static int usb_parse_configuration(struct usb_device *dev, int cfgidx,
 		kref_init(&intfc->ref);
 	}
 
-	/* FIXME: parse the BOS descriptor */
+	/* If device USB version is above 2.0, get BOS descriptor */
+	/*
+	 * Requirement for bcdUSB >= 2.10 is defined in USB 3.2 §9.2.6.6
+	 * "Devices with a value of at least 0210H in the bcdUSB field of their
+	 * device descriptor shall support GetDescriptor (BOS Descriptor) requests."
+	 *
+	 * To discuss, BOS request could be also sent for bcdUSB >= 0x0201
+	 */
+	// Set a default value for authenticated at true in order not to block devices
+	// that do not support the authentication
+	dev->authenticated = 1;
+
+	if (le16_to_cpu(dev->descriptor.bcdUSB) >= 0x0201) {
+		pr_notice("bcdUSB >= 0x0201\n");
+		retval = usb_get_bos_descriptor(dev);
+		if (!retval) {
+			pr_notice("found BOS\n");
+#ifdef CONFIG_USB_AUTHENTICATION
+			if (dev->bos->authent_cap) {
+				/* If authentication cap is present, start device authent */
+				pr_notice("found Authent BOS\n");
+				retval = usb_authenticate_device(dev);
+				if (retval != 0) {
+					pr_err("failed to authenticate the device: %d\n",
+					       retval);
+				} else if (!dev->authenticated) {
+					pr_notice("device has been rejected\n");
+					// return early from the configuration process
+					return 0;
+				} else {
+					pr_notice("device has been authorized\n");
+				}
+			} else {
+				// USB authentication unsupported
+				// Apply security policy on failed devices
+				pr_notice("no authentication capability\n");
+			}
+#endif
+		} else {
+			// Older USB version, authentication not supported
+			// Apply security policy on failed devices
+			pr_notice("device does not have a BOS descriptor\n");
+		}
+	}
 
 	/* Skip over any Class Specific or Vendor Specific descriptors;
 	 * find the first interface descriptor */
@@ -1051,6 +1095,7 @@ int usb_get_bos_descriptor(struct usb_device *dev)
 	length = bos->bLength;
 	total_len = le16_to_cpu(bos->wTotalLength);
 	num = bos->bNumDeviceCaps;
+
 	kfree(bos);
 	if (total_len < length)
 		return -EINVAL;
@@ -1122,6 +1167,10 @@ int usb_get_bos_descriptor(struct usb_device *dev)
 			dev->bos->ptm_cap =
 				(struct usb_ptm_cap_descriptor *)buffer;
 			break;
+		case USB_AUTHENT_CAP_TYPE:
+			dev->bos->authent_cap =
+				(struct usb_authent_cap_descriptor *)buffer;
+			break;
 		default:
 			break;
 		}
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 0e1dd6ef60a719f59a22d86caeb20f86991b5b29..753e55155ea34a7739b5f530dad429534e60842d 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2640,6 +2640,12 @@ int usb_new_device(struct usb_device *udev)
 	udev->dev.devt = MKDEV(USB_DEVICE_MAJOR,
 			(((udev->bus->busnum-1) * 128) + (udev->devnum-1)));
 
+	// TODO: Check the device state, we want to avoid semi-initialized device to userspace.
+	if (!udev->authenticated) {
+		// If the device is not authenticated, abort the procedure
+		goto fail;
+	}
+
 	/* Tell the world! */
 	announce_device(udev);
 
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 0b4685aad2d50337f3cacb2198c95a68ae8eff86..76847c01d3493e2527992a3bb927422519d9a974 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -46,6 +46,7 @@
 #include <linux/dma-mapping.h>
 
 #include "hub.h"
+#include "authent_netlink.h"
 
 const char *usbcore_name = "usbcore";
 
@@ -1080,6 +1081,10 @@ static int __init usb_init(void)
 	usb_debugfs_init();
 
 	usb_acpi_register();
+
+	// TODO : check error case
+	usb_auth_init_netlink();
+
 	retval = bus_register(&usb_bus_type);
 	if (retval)
 		goto bus_register_failed;
diff --git a/include/linux/usb.h b/include/linux/usb.h
index b46738701f8dc46085f251379873b6a8a008d99d..e9037c8120b43556f8610f9acb3ad4129e847b98 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -431,6 +431,8 @@ struct usb_host_bos {
 	struct usb_ssp_cap_descriptor	*ssp_cap;
 	struct usb_ss_container_id_descriptor	*ss_id;
 	struct usb_ptm_cap_descriptor	*ptm_cap;
+	/* Authentication capability */
+	struct usb_authent_cap_descriptor *authent_cap;
 };
 
 int __usb_get_extra_descriptor(char *buffer, unsigned size,

-- 
2.50.0


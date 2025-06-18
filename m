Received: from finn.localdomain (finn.gateworks.com [108.161.129.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDC828682
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=108.161.129.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750283406; cv=none; b=Os4Hc88U0Euudi+5cbzj9uIXfE3Q+MAPDmbAZXjxzJzudXy9qy7Dyn2tHH0U134I8BacpdQ6Gp0ujc3qlLP3nMm8s4xUP8CKcVcTt3SCofK5xPv6jv6yg2Cft0IeMvyDrdfreNxm9vY0Q1aD9vpKr9D+nAeoCqE5qsUajpcgIIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750283406; c=relaxed/simple;
	bh=lmytkayaHXHHnnkVZO//4fm3YitzDT4IQzdaHgfv6qM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FOafzYsHHsndgPztYqVw3HGd0wfcTsp50xdzMLoGDowtWjnDmSUCgt6VLZK9e/JXV+uPNqrJH+rajf6LTKlv5kPG71/WfduQcGi+8ILNkCLfWy4HEngMeORyBkpX85WKCXs14cUj0jHiKdwSUI96HzH4rtFO/635Qyv6Cgs38IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; arc=none smtp.client-ip=108.161.129.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1uS0Do-007yeJ-8r;
	Wed, 18 Jun 2025 21:21:28 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Stefano Babic <sbabic@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	"NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Tom Rini <trini@konsulko.com>,
	Marek Vasut <marex@denx.de>,
	u-boot@lists.denx.de
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] usb: common: allow dr_mode to come from gpio-id based usb-connector
Date: Wed, 18 Jun 2025 14:21:19 -0700
Message-Id: <20250618212120.1548575-2-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250618212120.1548575-1-tharvey@gateworks.com>
References: <20250618212120.1548575-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a usb host with dr_mode of "otg" has a usb-connector using a GPIO ID
pin use this to determine host vs peripheral.

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 drivers/usb/common/common.c | 96 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index 13e9a61072a9..1e5f9620e6b1 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -8,6 +8,7 @@
 
 #include <dm.h>
 #include <asm/global_data.h>
+#include <asm/gpio.h>
 #include <linux/printk.h>
 #include <linux/usb/otg.h>
 #include <linux/usb/ch9.h>
@@ -22,6 +23,99 @@ static const char *const usb_dr_modes[] = {
 	[USB_DR_MODE_OTG]		= "otg",
 };
 
+/**
+ * get_remote_node_from_graph - Resolve the remote node from a graph binding
+ * @node: Starting ofnode (e.g., connector)
+ * @port_id: Port unit address (e.g., 0 for port@0, or -1 for first port)
+ * @endpoint_id: Endpoint unit address (e.g., 0 for endpoint@0, or -1 for first endpoint)
+ * Return: ofnode of the remote node, or ofnode_null() on failure
+ */
+static ofnode get_remote_node_from_graph(ofnode node, int port_id, int endpoint_id)
+{
+	ofnode port_node, endpoint_node, remote_node;
+	u32 phandle_value;
+	char port_name[16];
+	char endpoint_name[16];
+
+	/* Validate the starting node */
+	if (!ofnode_valid(node)) {
+		printf("Invalid starting node\n");
+		return ofnode_null();
+	}
+
+	/* Construct port name (e.g., "port" or "port@0") */
+	if (port_id == -1)
+		strcpy(port_name, "port");
+	else
+		snprintf(port_name, sizeof(port_name), "port@%d", port_id);
+
+	/* Find the port node */
+	port_node = ofnode_find_subnode(node, port_name);
+	if (!ofnode_valid(port_node)) {
+		printf("No '%s' node found\n", port_name);
+		return ofnode_null();
+	}
+
+	/* Construct endpoint name (e.g., "endpoint" or "endpoint@0") */
+	if (endpoint_id == -1)
+		strcpy(endpoint_name, "endpoint");
+	else
+		snprintf(endpoint_name, sizeof(endpoint_name), "endpoint@%d", endpoint_id);
+
+	/* Find the endpoint node */
+	endpoint_node = ofnode_find_subnode(port_node, endpoint_name);
+	if (!ofnode_valid(endpoint_node)) {
+		printf("No '%s' node found under '%s'\n", endpoint_name, port_name);
+		return ofnode_null();
+	}
+
+	/* Read the remote-endpoint phandle */
+	phandle_value = ofnode_read_u32_default(endpoint_node, "remote-endpoint", 0);
+	if (phandle_value == 0) {
+		printf("No valid 'remote-endpoint' phandle in '%s'\n", endpoint_name);
+		return ofnode_null();
+	}
+
+	/* Resolve the phandle to the remote node */
+	remote_node = ofnode_get_by_phandle(phandle_value);
+	if (!ofnode_valid(remote_node)) {
+		printf("Failed to resolve phandle %u\n", phandle_value);
+		return ofnode_null();
+	}
+
+	return remote_node;
+}
+
+static enum usb_dr_mode get_connector_drmode(ofnode node)
+{
+	struct gpio_desc id;
+	enum usb_dr_mode dr_mode = USB_DR_MODE_OTG;
+	ofnode conn;
+
+	/* get remote endpoint */
+	conn = get_remote_node_from_graph(node, -1, -1);
+	/* get port endpoint */
+	if (ofnode_valid(conn))
+		conn = ofnode_get_parent(conn);
+	/* get connector */
+	if (ofnode_valid(conn))
+		conn = ofnode_get_parent(conn);
+	if (ofnode_valid(conn) &&
+	    ofnode_device_is_compatible(conn, "gpio-usb-b-connector") &&
+	    !gpio_request_by_name_nodev(conn, "id-gpios", 0, &id, GPIOD_IS_IN)) {
+		if (dm_gpio_get_value(&id))
+			dr_mode = USB_DR_MODE_PERIPHERAL;
+		else
+			dr_mode = USB_DR_MODE_HOST;
+		gpio_free_list_nodev(&id, 1);
+		pr_debug("%s got dr_mode from connector %s dr_mode=%s\n", __func__,
+			 ofnode_get_name(node),
+			 dr_mode == USB_DR_MODE_HOST ? "host" : "peripheral");
+	}
+
+	return dr_mode;
+}
+
 enum usb_dr_mode usb_get_dr_mode(ofnode node)
 {
 	const char *dr_mode;
@@ -35,7 +129,7 @@ enum usb_dr_mode usb_get_dr_mode(ofnode node)
 
 	for (i = 0; i < ARRAY_SIZE(usb_dr_modes); i++)
 		if (!strcmp(dr_mode, usb_dr_modes[i]))
-			return i;
+			return (i == USB_DR_MODE_OTG) ?  get_connector_drmode(node) : i;
 
 	return USB_DR_MODE_UNKNOWN;
 }
-- 
2.25.1


Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19EAEEB2;
	Wed,  2 Apr 2025 02:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743561186; cv=none; b=U5CA/1ss6b+FCKHeuZ+7g791Z+FpgkgQTqooqppFfQCXBuNC4pps12yHgDCjV/rO+l9SAYI/0YWJhhDtx/30lfIMLX44vNdih8eQHDZU6CjouN0r9qJ44GiVXI4B9JFiTFbR5DkdMfCOUTt4lIhkBb1Q1+rxE1cLow+AVjwTtTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743561186; c=relaxed/simple;
	bh=EAiy6oQESp4bH9RUWapq0zzIPxcPEcBVLvInJtCoZL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TKzcxgaZ+OAQJjuUHbJm2WVQxUD/nRfqPMObScaROetMGKu1KVZ2py2aMt+79nrR9gI+0fkFzTcOPcKXVCCiAuGXHpDP0A8Kujxbs7JuV4Csb5aYRyMWW4C6w8X5cIp9aottHZWbIKJ4AUb5PTNUrfZfvTbXcXLW+VbZKPweoy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=GfUeAtHn; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="GfUeAtHn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1743561161;
	bh=eGU5KbXO6e1/HojDQxT8SCCrYwesKSvunfoPBk+eObk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=GfUeAtHnLGK9MJQ7Cw+iGUwjPive3iXdhoQ+eAglrx5VIsNLTDjH0PUwqCurH8asU
	 Q8VYbr+7NSOG9YYg/USABt2uwrbOfayQsTcSomvJMYFtoX3jh0WQPy4IIg0MEiUcFB
	 Z81V3pq8RtAypkbu0Q6hD7tfKZowEukTMk77OJCY=
X-QQ-mid: bizesmtpip4t1743561052tc8e308
X-QQ-Originating-IP: jKwJ6CYMPd9lPExsLpd+vLwoRtPbgYC/T8e0Byx4OGw=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 02 Apr 2025 10:30:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15527068167197107366
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangyuli@uniontech.com,
	zhanjun@uniontech.com,
	Xu Rao <raoxu@uniontech.com>
Subject: [RESEND PATCH V6] usb:xhci: Add debugfs support for xHCI port bandwidth
Date: Wed,  2 Apr 2025 10:30:47 +0800
Message-Id: <20250402023047.26719-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz7a-0
X-QQ-XMAILINFO: NIvXgkk7mfUglAlRqZUtKE4p1EzyqTOIDUk1Y3wKzf4xzV8mcIY43un/
	7QRkmkCHdf9hg+PXTV7ls7Gj5RLKD4ZzM+wlSTOxVFJb5HDyXjXnYbLQMRcHNaKgOHxqve5
	6mVHtD/+9GN2pwnxAMc1FkNdwgVljGcH4ZjtSdleQBQtJRwc2T9PvQENC6R+LNLi9LigxP0
	Q2Y0KH5ES+b/PXRU2IoFyyGxHpZAkmZPyZNaFeB9NRyp1GH2ZOHQC3KaAvbAxp3MPZ7MdxW
	s7nOGmyIIX9yT2Y/TpPN+jfzLo+sRUFF/EKe8hdJClkGmjUNIgXbVJZyKCRogUmU8mHcKOH
	dWz9ZrTU+uSuM5OZLcrD7pLzVfoI8A+TSf9G8D+4bMCxqAcfi0w2DSV7gwYbCxDxAQX64g5
	GaBQX0P7syYJ9+RrGTbBJ+hGK2KiwY76p8JDMYVq9inA06xGMkRFMTnZibSk4OsfudfY1gB
	vbHnwAGNUp3+9ltrbEKFwLj2NGKvbr7w83+5er+sptDTCZ408Jbxw0T38X4aKJ0blIG8gn6
	qkPouk1UxJx+a5rO5eAyXxeCufqWS2po53XGAACbGoj2oIEZcDnFtdoWEjoO2a0lXm+HZZz
	T5lXMhfgWeFQ3F/Wj26PS0efHvZh0THVV7Pd4rkjXcNST/MLXCV2lfkhZTurNuI3vHYUg9+
	kYRuVII9GeSMsrMk31fIxGy95uut1du+Fjg8TzGiLTyMlJtP286yDAiWWXNdALREHqGj7cH
	3Qetsjcgf2E7FvCNT9166AzeS561NTlDP58CpAyPs1xpaDfr7JJNzTN1C0Y6zE+CTdkzbek
	RHkOIU46S2i1YT3dQygsAuiJHYJG5kjjIhKuXvb1VK3bCMjJp49ElwfgNjthQERi5fN2bRz
	UANbX38ERA5sigys32LN7AOTz/yk1vnIF+OvngcryRjyyeedU/+tW00kqnEFBXxhW1kDIod
	yjeRk2ktlQFLj0FK1CeEQHuP0nvtgdcHLYMq9q6b+OMOYfQOnRmNU23uIQD9o0wj0ud2b/t
	aLP+Mbox2W1V1sRko8m8Q9p0Tuxso=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

In many projects, you need to obtain the available bandwidth of the
xhci roothub port. Refer to xhci rev1_2 and use the TRB_GET_BW
command to obtain it.

hardware tested:
03:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Raven USB 3.1
(prog-if 30 [XHCI])
Subsystem: Huawei Technologies Co., Ltd. Raven USB 3.1
Flags: bus master, fast devsel, latency 0, IRQ 30
Memory at c0300000 (64-bit, non-prefetchable) [size=1M]
Capabilities: [48] Vendor Specific Information: Len=08 <?>
Capabilities: [50] Power Management version 3
Capabilities: [64] Express Endpoint, MSI 00
Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
Kernel driver in use: xhci_hcd

test progress:
1. cd /sys/kernel/debug/usb/xhci/0000:03:00.3/port_bandwidth# ls
FS_BW  HS_BW  SS_BW
2. test fs speed  device
cat FS_BW
port[1] available bw: 90%.
port[2] available bw: 90%.
port[3] available bw: 90%.
port[4] available bw: 90%.
port[5] available bw: 0%.
port[6] available bw: 0%.
port[7] available bw: 0%.
port[8] available bw: 0%.
plug in fs usb audio ID 0d8c:013c
cat FS_BW
port[1] available bw: 76%.
port[2] available bw: 76%.
port[3] available bw: 76%.
port[4] available bw: 76%.
port[5] available bw: 0%.
port[6] available bw: 0%.
port[7] available bw: 0%.
port[8] available bw: 0%.
3. test hs speed device
cat HS_BW
port[1] available bw: 79%.
port[2] available bw: 79%.
port[3] available bw: 79%.
port[4] available bw: 79%.
port[5] available bw: 0%.
port[6] available bw: 0%.
port[7] available bw: 0%.
port[8] available bw: 0%.
plug in hs usb video ID 0408:1040
cat HS_BW
port[1] available bw: 39%.
port[2] available bw: 39%.
port[3] available bw: 39%.
port[4] available bw: 39%.
port[5] available bw: 0%.
port[6] available bw: 0%.
port[7] available bw: 0%.
port[8] available bw: 0%.
4.cat SS_BW
port[1] available bw: 0%.
port[2] available bw: 0%.
port[3] available bw: 0%.
port[4] available bw: 0%.
port[5] available bw: 90%.
port[6] available bw: 90%.
port[7] available bw: 90%.
port[8] available bw: 90%.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
Changelog:
 *v1->v2: modify the patch subject no code changes.
  v2->v3: separate files in debugfs for each speed (SS HS FS).
	  queue one command for each speed not queuing three commands on one file.
	  print value from context not array on stack.
  v3->v4: Fix compilation warnings for W=1 build. Delete unused variable
  v4->v5: Add pm_runtime_get_sync operation before get port bandwidth.
	  When obtaining port bandwidth, alloc a new command structure with
	  context for each time.
	  Create dma pool instead of allocating one shared.
  v5->v6: The memory of port bandwidth context structure shall be aligned 16-
	  byte not 8-byte
---
 drivers/usb/host/xhci-debugfs.c | 108 ++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-mem.c     |  45 ++++++++++++-
 drivers/usb/host/xhci-ring.c    |  13 ++++
 drivers/usb/host/xhci.c         |  36 +++++++++++
 drivers/usb/host/xhci.h         |  14 +++++
 5 files changed, 215 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 1f5ef174abea..c6d44977193f 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -631,6 +631,112 @@ static void xhci_debugfs_create_ports(struct xhci_hcd *xhci,
 	}
 }

+static int xhci_port_bw_show(struct xhci_hcd *xhci, u8 dev_speed,
+				struct seq_file *s)
+{
+	unsigned int			num_ports;
+	unsigned int			i;
+	int				ret;
+	struct xhci_container_ctx	*ctx;
+	struct usb_hcd			*hcd = xhci_to_hcd(xhci);
+	struct device			*dev = hcd->self.controller;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0)
+		return ret;
+
+	num_ports = HCS_MAX_PORTS(xhci->hcs_params1);
+
+	ctx = xhci_alloc_port_bw_ctx(xhci, 0);
+	if (!ctx) {
+		pm_runtime_put_sync(dev);
+		return -ENOMEM;
+	}
+
+	/* get roothub port bandwidth */
+	ret = xhci_get_port_bandwidth(xhci, ctx, dev_speed);
+	if (ret)
+		goto err_out;
+
+	/* print all roothub ports available bandwidth
+	 * refer to xhci rev1_2 protocol 6.2.6 , byte 0 is reserved
+	 */
+	for (i = 1; i < num_ports+1; i++)
+		seq_printf(s, "port[%d] available bw: %d%%.\n", i,
+				ctx->bytes[i]);
+err_out:
+	pm_runtime_put_sync(dev);
+	xhci_free_port_bw_ctx(xhci, ctx);
+	return ret;
+}
+
+static int xhci_ss_bw_show(struct seq_file *s, void *unused)
+{
+	int ret;
+	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
+
+	ret = xhci_port_bw_show(xhci, USB_SPEED_SUPER, s);
+	return ret;
+}
+
+static int xhci_hs_bw_show(struct seq_file *s, void *unused)
+{
+	int ret;
+	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
+
+	ret = xhci_port_bw_show(xhci, USB_SPEED_HIGH, s);
+	return ret;
+}
+
+static int xhci_fs_bw_show(struct seq_file *s, void *unused)
+{
+	int ret;
+	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
+
+	ret = xhci_port_bw_show(xhci, USB_SPEED_FULL, s);
+	return ret;
+}
+
+static struct xhci_file_map bw_context_files[] = {
+	{"SS_BW",	xhci_ss_bw_show, },
+	{"HS_BW",	xhci_hs_bw_show, },
+	{"FS_BW",	xhci_fs_bw_show, },
+};
+
+static int bw_context_open(struct inode *inode, struct file *file)
+{
+	int			i;
+	struct xhci_file_map	*f_map;
+	const char		*file_name = file_dentry(file)->d_iname;
+
+	for (i = 0; i < ARRAY_SIZE(bw_context_files); i++) {
+		f_map = &bw_context_files[i];
+
+		if (strcmp(f_map->name, file_name) == 0)
+			break;
+	}
+
+	return single_open(file, f_map->show, inode->i_private);
+}
+
+static const struct file_operations bw_fops = {
+	.open			= bw_context_open,
+	.read			= seq_read,
+	.llseek			= seq_lseek,
+	.release		= single_release,
+};
+
+static void xhci_debugfs_create_bandwidth(struct xhci_hcd *xhci,
+					struct dentry *parent)
+{
+	parent = debugfs_create_dir("port_bandwidth", parent);
+
+	xhci_debugfs_create_files(xhci, bw_context_files,
+			  ARRAY_SIZE(bw_context_files),
+			  xhci,
+			  parent, &bw_fops);
+}
+
 void xhci_debugfs_init(struct xhci_hcd *xhci)
 {
 	struct device		*dev = xhci_to_hcd(xhci)->self.controller;
@@ -681,6 +787,8 @@ void xhci_debugfs_init(struct xhci_hcd *xhci)
 	xhci->debugfs_slots = debugfs_create_dir("devices", xhci->debugfs_root);

 	xhci_debugfs_create_ports(xhci, xhci->debugfs_root);
+
+	xhci_debugfs_create_bandwidth(xhci, xhci->debugfs_root);
 }

 void xhci_debugfs_exit(struct xhci_hcd *xhci)
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 92703efda1f7..31549b37f61e 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -484,6 +484,35 @@ void xhci_free_container_ctx(struct xhci_hcd *xhci,
 	kfree(ctx);
 }

+struct xhci_container_ctx *xhci_alloc_port_bw_ctx(struct xhci_hcd *xhci,
+						    gfp_t flags)
+{
+	struct xhci_container_ctx *ctx;
+	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
+
+	ctx = kzalloc_node(sizeof(*ctx), flags, dev_to_node(dev));
+	if (!ctx)
+		return NULL;
+
+	ctx->size = GET_PORT_BW_ARRAY_SIZE;
+
+	ctx->bytes = dma_pool_zalloc(xhci->port_bw_pool, flags, &ctx->dma);
+	if (!ctx->bytes) {
+		kfree(ctx);
+		return NULL;
+	}
+	return ctx;
+}
+
+void xhci_free_port_bw_ctx(struct xhci_hcd *xhci,
+			     struct xhci_container_ctx *ctx)
+{
+	if (!ctx)
+		return;
+	dma_pool_free(xhci->port_bw_pool, ctx->bytes, ctx->dma);
+	kfree(ctx);
+}
+
 struct xhci_input_control_ctx *xhci_get_input_control_ctx(
 					      struct xhci_container_ctx *ctx)
 {
@@ -1907,6 +1936,11 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Freed small stream array pool");

+	dma_pool_destroy(xhci->port_bw_pool);
+	xhci->port_bw_pool = NULL;
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
+			"Freed xhci port bw array pool");
+
 	dma_pool_destroy(xhci->medium_streams_pool);
 	xhci->medium_streams_pool = NULL;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
@@ -2463,7 +2497,16 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	 * will be allocated with dma_alloc_coherent()
 	 */

-	if (!xhci->small_streams_pool || !xhci->medium_streams_pool)
+	/* refer to xhci rev1_2 protocol 5.3.3 max ports is 255.
+	 * refer to xhci rev1_2 protocol 6.4.3.14 port bandwidth buffer need
+	 * to be 16-byte aligned.
+	 */
+	xhci->port_bw_pool =
+		dma_pool_create("xHCI 256 port bw ctx arrays",
+			dev, GET_PORT_BW_ARRAY_SIZE, 16, 0);
+
+	if (!xhci->small_streams_pool || !xhci->medium_streams_pool ||
+		!xhci->port_bw_pool)
 		goto fail;

 	/* Set up the command ring to have one segments for now. */
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 965bffce301e..0a01753075b4 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1867,6 +1867,8 @@ static void handle_cmd_completion(struct xhci_hcd *xhci,
 	case TRB_NEC_GET_FW:
 		xhci_handle_cmd_nec_get_fw(xhci, event);
 		break;
+	case TRB_GET_BW:
+		break;
 	default:
 		/* Skip over unknown commands on the event ring */
 		xhci_info(xhci, "INFO unknown command type %d\n", cmd_type);
@@ -4414,6 +4416,17 @@ int xhci_queue_configure_endpoint(struct xhci_hcd *xhci,
 			command_must_succeed);
 }

+/* Queue a get root hub port bandwidth command TRB */
+int xhci_queue_get_port_bw(struct xhci_hcd *xhci,
+		struct xhci_command *cmd, dma_addr_t in_ctx_ptr,
+		u8 dev_speed, bool command_must_succeed)
+{
+	return queue_command(xhci, cmd, lower_32_bits(in_ctx_ptr),
+		upper_32_bits(in_ctx_ptr), 0,
+		TRB_TYPE(TRB_GET_BW) | DEV_SPEED_FOR_TRB(dev_speed),
+		command_must_succeed);
+}
+
 /* Queue an evaluate context command TRB */
 int xhci_queue_evaluate_context(struct xhci_hcd *xhci, struct xhci_command *cmd,
 		dma_addr_t in_ctx_ptr, u32 slot_id, bool command_must_succeed)
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 45653114ccd7..fde774408a13 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3088,6 +3088,42 @@ void xhci_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 }
 EXPORT_SYMBOL_GPL(xhci_reset_bandwidth);

+/* Get the available bandwidth of the ports under the xhci roothub */
+int xhci_get_port_bandwidth(struct xhci_hcd *xhci, struct xhci_container_ctx *ctx,
+		u8 dev_speed)
+{
+	struct xhci_command *cmd;
+	unsigned long flags;
+	int ret;
+
+	if (!ctx || !xhci)
+		return -EINVAL;
+
+	cmd = xhci_alloc_command(xhci, true, GFP_KERNEL);
+	if (!cmd)
+		return -ENOMEM;
+
+	cmd->in_ctx = ctx;
+
+	/* get xhci port bandwidth, refer to xhci rev1_2 protocol 4.6.15 */
+	spin_lock_irqsave(&xhci->lock, flags);
+
+	ret = xhci_queue_get_port_bw(xhci, cmd, ctx->dma, dev_speed, 0);
+	if (ret) {
+		spin_unlock_irqrestore(&xhci->lock, flags);
+		goto err_out;
+	}
+	xhci_ring_cmd_db(xhci);
+	spin_unlock_irqrestore(&xhci->lock, flags);
+
+	wait_for_completion(cmd->completion);
+err_out:
+	kfree(cmd->completion);
+	kfree(cmd);
+
+	return ret;
+}
+
 static void xhci_setup_input_ctx_for_config_ep(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *in_ctx,
 		struct xhci_container_ctx *out_ctx,
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 8c164340a2c3..51bf99787ec9 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -586,6 +586,7 @@ struct xhci_stream_info {

 #define	SMALL_STREAM_ARRAY_SIZE		256
 #define	MEDIUM_STREAM_ARRAY_SIZE	1024
+#define	GET_PORT_BW_ARRAY_SIZE		256

 /* Some Intel xHCI host controllers need software to keep track of the bus
  * bandwidth.  Keep track of endpoint info here.  Each root port is allocated
@@ -999,6 +1000,9 @@ enum xhci_setup_dev {
 /* bits 16:23 are the virtual function ID */
 /* bits 24:31 are the slot ID */

+/* bits 19:16 are the dev speed */
+#define DEV_SPEED_FOR_TRB(p)    ((p) << 16)
+
 /* Stop Endpoint TRB - ep_index to endpoint ID for this TRB */
 #define SUSPEND_PORT_FOR_TRB(p)		(((p) & 1) << 23)
 #define TRB_TO_SUSPEND_PORT(p)		(((p) & (1 << 23)) >> 23)
@@ -1554,6 +1558,7 @@ struct xhci_hcd {
 	struct dma_pool	*device_pool;
 	struct dma_pool	*segment_pool;
 	struct dma_pool	*small_streams_pool;
+	struct dma_pool	*port_bw_pool;
 	struct dma_pool	*medium_streams_pool;

 	/* Host controller watchdog timer structures */
@@ -1837,6 +1842,10 @@ struct xhci_container_ctx *xhci_alloc_container_ctx(struct xhci_hcd *xhci,
 		int type, gfp_t flags);
 void xhci_free_container_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
+struct xhci_container_ctx *xhci_alloc_port_bw_ctx(struct xhci_hcd *xhci,
+		gfp_t flags);
+void xhci_free_port_bw_ctx(struct xhci_hcd *xhci,
+		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 				  u32 imod_interval);
@@ -1907,6 +1916,11 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 int xhci_queue_configure_endpoint(struct xhci_hcd *xhci,
 		struct xhci_command *cmd, dma_addr_t in_ctx_ptr, u32 slot_id,
 		bool command_must_succeed);
+int xhci_queue_get_port_bw(struct xhci_hcd *xhci,
+		struct xhci_command *cmd, dma_addr_t in_ctx_ptr,
+		u8 dev_speed, bool command_must_succeed);
+int xhci_get_port_bandwidth(struct xhci_hcd *xhci, struct xhci_container_ctx *ctx,
+		u8 dev_speed);
 int xhci_queue_evaluate_context(struct xhci_hcd *xhci, struct xhci_command *cmd,
 		dma_addr_t in_ctx_ptr, u32 slot_id, bool command_must_succeed);
 int xhci_queue_reset_ep(struct xhci_hcd *xhci, struct xhci_command *cmd,
--
2.43.4


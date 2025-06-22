Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8341A13B58C;
	Sun, 22 Jun 2025 07:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750577401; cv=none; b=et1PDQhgkHiGxwf2tIuP3kkqs+fTtI1TzYpbduSl2svgJcaK3IBDrwLTc2+4kfAy92vvtUKZ2DKWnuI0y9dZlr3JHP05BU/7oxHI3UqRCclxgPypLIKT9FONopcnq32NMcB6zRCZqJm3UIUBUSz8Y9jsWNUFwhCUJSM2nsJJiI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750577401; c=relaxed/simple;
	bh=WHG3l2194eAYfNypkbJz/TxSuFIa2gD7sthVM1KzmN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jApN37pU6Qcz4o5INHEHa92A20TCMoCsId/HjvK0tLg6blvfFHsYSQaeZ03mHcSddeU2BVfNyaJ5eGjnr65N2KnG+/2OUryJY07SfzwoozQy0ilW7gJZdrGITrYidgfUQ5fiYgCctwXZTRpaph7HljKxGiEMsLZjUkp2dSp2h8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aBICUCzT; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aBICUCzT"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55M4K2gY030003;
	Sun, 22 Jun 2025 07:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=mcitZQcakbXoqMQg7LWame7U/gV0A
	djN+l9YkVHU9tY=; b=aBICUCzTfhkd4uHrcDLPVEjHxPcssJFLjimeZjVUIlp13
	rt0pHQ+o7X3Pv2UGa7uU8GNYw6uTEplHbXWLgWaQrwffao7hfCAhkrOwy/YiICOi
	NLRfCsWF1ayZa8iOlWnTHjVuYgOsMgLaneHvgS+uI8USjulLThkHdNvM6mMc3TNc
	D0/LL/Miu1Sz7U3M/f3vlHisGok/NLEQAH+JWm50U6+HEqxYWx30/ZVrPNWiWjlv
	E1GprJvJFSpsQTxwVpGI9CyCyvGVQ2RmNE2Z6QnSYeZhpmM1Y9ib52sNEu6mr7TZ
	iTNsszcKbgf7TozMvh7GzWT+ZhF/bvrDQh3sepITg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8mruab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 07:29:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55M2HZAs008544;
	Sun, 22 Jun 2025 07:29:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47dk6e6pk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 07:29:51 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55M7THri031282;
	Sun, 22 Jun 2025 07:29:51 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47dk6e6pjk-1;
	Sun, 22 Jun 2025 07:29:51 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, davthompson@nvidia.com,
        michaelsh@nvidia.com, vadimp@nvidia.com,
        platform-driver-x86@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] platform/mellanox: Fix spelling and comment clarity in Mellanox drivers
Date: Sun, 22 Jun 2025 00:29:11 -0700
Message-ID: <20250622072921.4111552-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506220043
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=6857b0f1 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=Dpny8YC7gtef0Hx4SHEA:9 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: _NgjJGt7GntB2N7GuV2_CW4Nt0DbpiWf
X-Proofpoint-GUID: _NgjJGt7GntB2N7GuV2_CW4Nt0DbpiWf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA0MyBTYWx0ZWRfXyf9Hy07fOMYd d3n8rPOatxcc7Wm1SMN37lfwqwl6DJXm/0UsIIvf1bzZrWiEI01eh3wCMc2WbejiKBWN1o0LBiX 86XyDdzuZCRedGuUbw30wEVJzlzCizLpg9Tj/36xHcVPgqKM98GD9tE7lYyzTnRRgy5n4I0MaKu
 RXfgJxCupBESGTw01m+oOYV84fko3HQ7wvetWptnN3Siuvt6cld06TRsoydSUIbNjrBiPCGC12G 2fyNg+Nc/zmz1xX4yjtzc2LV6fmPVRJ6wosqSFVUoDoIP8QjOUUnNBSoBaQBic22DTM5lRqnIB3 0wzJ75w/yhf3ezXB3POtVO5T5+Kmb5ri1p4Uk9kMesbDGSnrZbU9vzqqEKFr4S3afY/ygIvqFKU
 vXL/vmUTlHtsnLTNztqJVK7kJotN8TJS3VTsjNwyEpQbqN6NyT+dpzD6vvhhd877NAfyc1lD

This commit corrects several minor typographical errors in comments
and error messages across multiple Mellanox platform driver.
Fixed spelling of "thresholds", "region", "platform", "default",
and removed redundant spaces in comment strings and error logs.

These changes are cosmetic and do not affect runtime behavior.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/platform/mellanox/mlxbf-tmfifo.c |  2 +-
 drivers/platform/mellanox/mlxreg-dpu.c   |  2 +-
 drivers/platform/mellanox/mlxreg-lc.c    | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
index aae99adb29eb0..6264379d96907 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -1287,7 +1287,7 @@ static void mlxbf_tmfifo_get_cfg_mac(u8 *mac)
 		ether_addr_copy(mac, mlxbf_tmfifo_net_default_mac);
 }
 
-/* Set TmFifo thresolds which is used to trigger interrupts. */
+/* Set TmFifo thresholds which is used to trigger interrupts. */
 static void mlxbf_tmfifo_set_threshold(struct mlxbf_tmfifo *fifo)
 {
 	u64 ctl;
diff --git a/drivers/platform/mellanox/mlxreg-dpu.c b/drivers/platform/mellanox/mlxreg-dpu.c
index 52260106a9f16..39f89c47144a2 100644
--- a/drivers/platform/mellanox/mlxreg-dpu.c
+++ b/drivers/platform/mellanox/mlxreg-dpu.c
@@ -483,7 +483,7 @@ static int mlxreg_dpu_config_init(struct mlxreg_dpu *mlxreg_dpu, void *regmap,
 							  mlxreg_dpu->io_data,
 							  sizeof(*mlxreg_dpu->io_data));
 		if (IS_ERR(mlxreg_dpu->io_regs)) {
-			dev_err(dev, "Failed to create regio for client %s at bus %d at addr 0x%02x\n",
+			dev_err(dev, "Failed to create region for client %s at bus %d at addr 0x%02x\n",
 				data->hpdev.brdinfo->type, data->hpdev.nr,
 				data->hpdev.brdinfo->addr);
 			return PTR_ERR(mlxreg_dpu->io_regs);
diff --git a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/mellanox/mlxreg-lc.c
index aee395bb48ae4..8eef3d990d1ae 100644
--- a/drivers/platform/mellanox/mlxreg-lc.c
+++ b/drivers/platform/mellanox/mlxreg-lc.c
@@ -57,9 +57,9 @@ enum mlxreg_lc_state {
  * @dev: platform device;
  * @lock: line card lock;
  * @par_regmap: parent device regmap handle;
- * @data: pltaform core data;
+ * @data: platform core data;
  * @io_data: register access platform data;
- * @led_data: LED platform data ;
+ * @led_data: LED platform data;
  * @mux_data: MUX platform data;
  * @led: LED device;
  * @io_regs: register access device;
@@ -171,7 +171,7 @@ static int mlxreg_lc_chan[] = {
 	0x4e, 0x4f
 };
 
-/* Defaul mux configuration. */
+/* Default mux configuration. */
 static struct mlxcpld_mux_plat_data mlxreg_lc_mux_data[] = {
 	{
 		.chan_ids = mlxreg_lc_chan,
@@ -181,7 +181,7 @@ static struct mlxcpld_mux_plat_data mlxreg_lc_mux_data[] = {
 	},
 };
 
-/* Defaul mux board info. */
+/* Default mux board info. */
 static struct i2c_board_info mlxreg_lc_mux_brdinfo = {
 	I2C_BOARD_INFO("i2c-mux-mlxcpld", 0x32),
 };
@@ -758,7 +758,7 @@ mlxreg_lc_config_init(struct mlxreg_lc *mlxreg_lc, void *regmap,
 		platform_device_register_resndata(dev, "mlxreg-io", data->hpdev.nr, NULL, 0,
 						  mlxreg_lc->io_data, sizeof(*mlxreg_lc->io_data));
 		if (IS_ERR(mlxreg_lc->io_regs)) {
-			dev_err(dev, "Failed to create regio for client %s at bus %d at addr 0x%02x\n",
+			dev_err(dev, "Failed to create region for client %s at bus %d at addr 0x%02x\n",
 				data->hpdev.brdinfo->type, data->hpdev.nr,
 				data->hpdev.brdinfo->addr);
 			err = PTR_ERR(mlxreg_lc->io_regs);
-- 
2.46.0


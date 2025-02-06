Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013017.outbound.protection.outlook.com [40.107.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287FA19BBA;
	Thu,  6 Feb 2025 06:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738823784; cv=fail; b=dLQzIvONlO3/8vaGSXyo+mjaa2lLl/p4pwfRaSM0yjBBsAygf3guMQFPsjf6ztRtNQYhpp9HGYw/Zeo0e+h8UTBAuJPJrSACx9XixGa/QXkqrUv6NTwqsbhYvxwMAcadR76E5IQzdiKBVa8ac9SvoH9A61Nj9wZUYxfD9dq+Wz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738823784; c=relaxed/simple;
	bh=Udmatppor72YKe9KX+7jL2JDcrbcNApHcBUEvX/qjTc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=GV5a75c4cB/1Q4NXQ1gfdl75jZzc7Gauq2qal+klxfK3y6oHtiPx/7eW9J275SxmfSVOudyW5IjsPoDOoMbpjMIyuRhnESemJ7IPaQzPKsN71oD8XHlTe9n55VeT1X4pMZ0R6MQNbNEXHWQ9UwifYFPUxiO//kJHyEpA8fohBEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=rTGg7o0Q; arc=fail smtp.client-ip=40.107.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="rTGg7o0Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wS2l0v6wN2mZs8tJljgNnnzpQf9JkXS2eV75t4Bw3L7dSxOVRP/BOwp6Rk2qQrl0w4wdTUlJN2IP6XRBiAiqQD6dfSOwSO6OAFtuJdryJ/+FGbmA8DZarAW4cQaDhiBNEh/mWIKATDs7dexHfizbP+2uFvPbD9Olof+Hh8HaYus4GDkA8RzJHtQ6XDKFseM5UtSiCH1+IHuZSCakmFm/t8SBlikKm6U8rimAwqeNpjfoh7kgpY+ffapdflP6Mc0zIRumaFp8PNlLVwdZte72ctj4fZQTHS37Qe1+d3KU/dNzP41o2NZ0joW75ShfgHDQP1b+kITLerYPVCyH+vUZmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f408iy7Kn3Y/xD1pntTYtzAj3fkibJkA9zVCpLP4PoM=;
 b=sJmwhkfBbpcaDS8I2hudaLeNkx55oltmA8rS4IK9eUrxQW8W0HmXVPXGrXsgFzuMJ1auaCEiVUdGxq4fSTPukDrTZESDcJboLATF6eFATYQzVtFiLQfNDlaCvuwU+9d4CAZVBL2XufyyvvySCO0KxAWPpdQCry9y1ph2CZ9tlXTtA3pYwjHFKHvGN0Zu3XCkveOCmeQ++TWwkeLP94/tY2DB8YOQTaQTd90VzvxpgVo5O3LP2VnRubgA9dWIFuEQDS8wJbXN5Sv80XvujbHG0C+zqeQ2U0pvRfL0a5AhMlPauR3HvW+vpz1dNJy4DzVowx8pfFEFuj409arWq32L3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f408iy7Kn3Y/xD1pntTYtzAj3fkibJkA9zVCpLP4PoM=;
 b=rTGg7o0QkoitSjaPOGbEBAvwgHIUGLAn5oF6N+7t7jT/ErqAdrhRQfpnNtsOoLUHcsB/A2KBkPyzuIK1AEFfLa7paacy65ofoSJs2DYOvBgjdLXdIY8r8Se/CeLgOrPqvKyBjTSwtAE1vYliZKY+frzFclXdH2PypRO8KSucFf/O8tBDq5EPx/yjwScDs4e083P5/VA1DFdrnvTyRDZbC6Afyez/NTkeo+hyjmwnUlxbCGquFeoadDPkwBSclHEwNfTbyK09g6BTPcklofXYdF6eDAN4tuRGRaljdo8xsIPcUSz/DWdrIVJtJDigP8ZAPihvZceHINQ6xrUQ1MZU0Q==
Received: from SL2P216CA0181.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1a::7) by
 TYZPR04MB8231.apcprd04.prod.outlook.com (2603:1096:405:bc::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.24; Thu, 6 Feb 2025 06:36:19 +0000
Received: from HK3PEPF0000021A.apcprd03.prod.outlook.com
 (2603:1096:101:1a:cafe::59) by SL2P216CA0181.outlook.office365.com
 (2603:1096:101:1a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Thu,
 6 Feb 2025 06:36:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021A.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server id 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 06:36:18
 +0000
From: Jerry C Chen <Jerry_C_Chen@wiwynn.com>
To: patrick@stwcx.xyz,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Jerry C Chen <Jerry_C_Chen@wiwynn.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] hwmon: (adc128d818): filter out 0x1ff reading
Date: Thu,  6 Feb 2025 14:35:59 +0800
Message-Id: <20250206063600.321650-1-Jerry_C_Chen@wiwynn.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021A:EE_|TYZPR04MB8231:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f650cf43-a8ff-404c-3eb3-08dd46789062
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hhmSCCH78AIEFbAPs599LEntWOwPWN81F8MqPH2YOr3yHRTBB7DbtoymPPvs?=
 =?us-ascii?Q?4IffasKLuFyTkQkP6mhkg1eTOYQ85KHO0jJWBcAJcsvBChAOzyfktHfHe0h9?=
 =?us-ascii?Q?cjsOQVhZaO9oXViXnhwDbfTJTH9BAcfM/p3WtUZTjexNl2TCQEbnsj0oZeWL?=
 =?us-ascii?Q?Zu+31KPDg0Qns/ohEF96Kl30ngITuupPFT2ciiMlxvFe39p+AbrqJh1eZh42?=
 =?us-ascii?Q?RcQgXgS/M0y14TtODZ7dxKuLnn3VRUFsjWNz0zb0c1W1Wy/zK30bj6grjHXY?=
 =?us-ascii?Q?yhf6dYS4ydJFzY2jeqxOocRUxlVU5R+l982TAdHGSgMjIGmGpxUeOQCboELp?=
 =?us-ascii?Q?z9NPoz955OqrEBBWylifbiokoOcIlLakIkPNuFOg4u7MiOnrJ/p+o/MRpCO1?=
 =?us-ascii?Q?Bw729dxB8B+yoYYZAEIKSSWO0DEW6r2MyMpZk1DMw/WXFQunvWjTPTL0HeJ6?=
 =?us-ascii?Q?o7Urln3xonXWDnfmMaHCwuEFYLwNnmTfBFgG9MFsrUctJ/F803Tzm7cVXIsO?=
 =?us-ascii?Q?1vFXbfYyWFZKhRaPIbIOYlEV+yJOgeaCzSjaUyYPjirXQel32W8bi+Gs+RvR?=
 =?us-ascii?Q?GvjEUXW/+TFPEvOXBtkTvbFamyhQJeSXUC3aFtcLjwWvZMoqrSSY5TqwfnCA?=
 =?us-ascii?Q?DY4sBGuxhJkXtK1Ch1jHPyqB4BBUZqkyP0MXiITkxEkFBqLp/w/p1SfQAM6c?=
 =?us-ascii?Q?7RG2xYwpLog/zmIoh4zPmFTcL5pa5tiFxN9P0XUr7WLgD8ARQerB8GKr9uA1?=
 =?us-ascii?Q?aNVNgqfuZZjwfkszKUyWY0N+FFUeIukPMhSBmwsjcHjVUN1xgX2RVqod35Ls?=
 =?us-ascii?Q?fNiQOLuYmOXWsuutfwq49Atzt44g2CPpbx7oROuaSkM9iO2SG2dA/9RIm+iM?=
 =?us-ascii?Q?inXEYyte9Ni4cFjOBXnlEvwI7flqtImvopLotPHbyBhcS3suvwFvlH3jEOvB?=
 =?us-ascii?Q?xIVeSFEBqWS3hwh50d9LxREQeEvnA4NgSG1/w6goLwBZZweEb6k9BoQnhfPg?=
 =?us-ascii?Q?vOW46mYkFb0np728KEia3VDP2hOJRJsiPabaEYHyco1VuAgqzgtqtScKhP9s?=
 =?us-ascii?Q?j18OdfO2pbOZevEcZQsPu3iAOKk5gBbeKnLlEy+13BIEI9d7NsYexCisrY9V?=
 =?us-ascii?Q?Z6FU48yQ/S/Edd8SavThOQ6PWZrzCBQI4f17P7mpRHjnCNXh6FvAmMonBT8o?=
 =?us-ascii?Q?B54PjTEoY6WPvTtmChNUDd2iIuJozLFDiAhGC0RfrWj1+VH9WMWPWism76gT?=
 =?us-ascii?Q?r+wMOLFi7cRnTyHopOTo7d9puZD+pLqamFl9UwCCqeWFdq+l303W5DosEWn5?=
 =?us-ascii?Q?4Hxy/b0h2Ab8jiHWWv0IHW56UJeQCaOQYNSfoQCgj367qyoym7IlpEpslXh7?=
 =?us-ascii?Q?bLmYb+tQAZtXJkscmkACvdW7uerVZ17xIRsYZ5tBjV5oZk1x1uGtNuObdPfp?=
 =?us-ascii?Q?UtW1NyUEKlR6ciThAKNqf2RHOBnBSP3RinUx2BzR3wqpICkeAfBg/uYUSVaN?=
 =?us-ascii?Q?vxpLVNF1T2jdP48=3D?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 06:36:18.6668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f650cf43-a8ff-404c-3eb3-08dd46789062
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK3PEPF0000021A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB8231

ASPEED i2c driver doesn't support SMBUS timeout thus we will get dirty
data while SCL hold time over 35ms, filter out default register value
0x1ff to avoid abnormal data reading.

Signed-off-by: Jerry C Chen <Jerry_C_Chen@wiwynn.com>
---
 drivers/hwmon/adc128d818.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
index 5e805d4ee76a..8197d3f14ea7 100644
--- a/drivers/hwmon/adc128d818.c
+++ b/drivers/hwmon/adc128d818.c
@@ -88,7 +88,7 @@ static struct adc128_data *adc128_update_device(struct de=
vice *dev)
                for (i =3D 0; i < num_inputs[data->mode]; i++) {
                        rv =3D i2c_smbus_read_word_swapped(client,
                                                         ADC128_REG_IN(i));
-                       if (rv < 0)
+                       if (rv < 0 || rv =3D=3D 511)
                                goto abort;
                        data->in[0][i] =3D rv >> 4;

--
2.25.1

WIWYNN PROPRIETARY
This email (and any attachments) contains proprietary or confidential infor=
mation and is for the sole use of its intended recipient. Any unauthorized =
review, use, copying or distribution of this email or the content of this e=
mail is strictly prohibited. If you are not the intended recipient, please =
notify the sender and delete this email immediately.

Received: from mail1.bemta40.messagelabs.com (mail1.bemta40.messagelabs.com [67.219.247.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCBB78F58
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.247.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744324208; cv=fail; b=l24O0bAg6SE7lA5bx6WKekIvMo2nZg4yqrYwOkD31PbQwO/AKyedpadS8BrSnt+CFAwGCXGD7suAlOskoQz0a1Davh0zzTyaKleZ9t2+8GWKVmSFY/z1epyHMMRLQ0uio5G3PduLstswlm20j+bEMF8xJVHxAcIC/qI4FxcyezA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744324208; c=relaxed/simple;
	bh=zCJXxFgjt+Ovtoe0CFFjPZSFGKw4jRHCW05dNtZQVL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m9MVn47HpQELLHIfbyNhIvMBU49gQl83+XadUQxHs/mMbBNa/YEBIYe0Iq3V3VWf7pLeaNIPhdv7SEoQ9S/NW/lclh+v8adigHKzg9Yj9O1StaezXXtlxJZaNWaLt7bFs8bHuvfioiZxlNcixI+ZXFlgOcm4Os3rbNFuZsjtuVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=RY7np5Fj; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=RbYLQfPx reason="signature verification failed"; arc=fail smtp.client-ip=67.219.247.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="RY7np5Fj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="RbYLQfPx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1744324205; i=@semtech.com;
	bh=JP15Dsj0DRBpg//l4/31rVfJZYbVHHVGnH5TLog4Yyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=RY7np5Fj6qXQwh9ejkqwGINtv929aNQVGRKtSjMkkOn8rkGkJrVcC0lXd55jLinPu
	 mtG/4cAZZl99mVJJWbtZliCNeOVYtnzd4mN6wSi4k9o3GSlRHntgbwlVuMHOdsiR59
	 mFdhYkf0zvyL06CldYXdkMs0C/UWhTjlEu6Cv4Q8xijpps4i/N9qJZLYwmrUJvGE9P
	 A+Ewo0f+KtzUCs5snpm5zFRGAGECKUpHVYw0kEdYxkE8nOBVrQF+h+iwHJLUyZNCft
	 dxePmhz2Q/53qYbAQ8PkHl1UQV1S0LkcZKvCqGGi8PEVHRVyjmZ5PVHmTjoRFnxupS
	 LP89a9v3Ey/tw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphk+JIrShJLcpLzFFi42LJ0Hcy0M1x+5F
  u0HLZ0OLyrjlsDowenzfJBTBGsWbmJeVXJLBmbLu+kr3gM3fF9C032RoYD3N1MXJxMAosY5bY
  ePwOG4SzmFWie/ENFghnGpPE46azTCAOi8B2ZomJk26ygjhCAguYJOb9PMjYxcgJ5Kxikuhsj
  AdJSAgcZZS49HkiC0TVWUaJW83/2SGcW4wS35euZINwJjNKzFlzlA2kn01AUaL1y2mwLSIC9x
  kldh3dwwySYBbQkvj5+CbQEg4OYQEHiWf98iBhFgFViVcHLoLt5hUwk5jz9yILiC0hIC+xeMd
  yZoi4oMTJmU9YIMbISzRvnc0McausxIoJvWwQ9cES2/70s0LYkhLXbl5gh7BlJY6encMCslZC
  wFHi5kZjiDESEgdfvGCGKPGVaPu9EKpcTuJU7zkmmBN2brwNdU6IxK+uHSyQYDnFL3Ghu40dw
  nnGKPFjx1tGiCoZifbLC1gnMGrMQnL3LCR3z0KyfAEj8ypG0+LUorLUIl0jc72kosz0jJLcxM
  wcvcQq3SS90mLd1MTiEkO99OQCvdTiYr3iytzknBS9vNSSTYzARML1IWLfDsYXE5r1DzFKcjA
  pifIeE/2RLsSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCt9EJKCdYlJqeWpGWmQNMajBpCQ4eJRHe
  T8pAad7igsTc4sx0iNQpRkUpcd4/IH0CIImM0jy4NlgivcQoKyXMy8jAwCDEU5BalJtZgir/i
  lGcg1FJmPePM9AUnsy8Erjpr4AWMwEtVpX+BrK4JBEhJdXA1CD5+54eh+bSh4J3us7tnHuAPf
  dGrsv59+FfngmsXuYf+EhE9oLytVv3NJ2jP4Sof1pXWl2+dGnqT+5NN4WDH35dsWWdiU/3Fq6
  E3ML+quU9NyYx5lcpRP8u2FbzfLVD1fpsOf2dHTNWWX2PixONCcw48O/7r8tpijXzY6eWnV35
  sXDdQmYZS+GOl8Iyj0/8CWOK+HgkvCjnQPbBI+tUQ6clpOqY3PwWabGo6uiSsqicWzOOZR54H
  JX6YOMfsYVpTvfYP/YfbI+fzDljy2/9yy//f3fdYdtZ8M1ZVqJ/wq0tE5Z+nOv8ar5KwOoVxU
  72StoCfUeW9ucsiXlourr0tIbOzRcvrsYFTDy69s/GfBclluKMREMt5qLiRABqaF/JHwQAAA=
  =
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-4.tower-929.messagelabs.com!1744324204!1940691!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.117.2; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 28021 invoked from network); 10 Apr 2025 22:30:04 -0000
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) (104.47.66.48)
  by server-4.tower-929.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2025 22:30:04 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4AHyAx3sly3+kQtenRPZjdy4uTdzXVDLawxl2SFHe51yzr9jF850WskNSjY38KC8+9+yO4et1y7mH8rrvyv069uu1mVaSawLZAEaH3fIp4x2DBEG2mlvdSV/N2HPme1VN1uZ0Fv7BFkWSZs0OcpnG/cybLGU04x3oMDBU04aiQiiBxdT3TuCe8MscIMoIPm+a/L6YXB+O7EMpY1CUhAtMJAhf4aWixNEPz1x2WL20iIiSDk3HMaXrQxcpvhBlZgdcy+dLgvu0gvCzUgoLETTX1wfdJFR/SRkTQiRkfda565u2TXcbDT635i0nsRkJkUWDvibzwTweCog42IGCGCnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZbjA/qhKF+8NcwNpluPai3pmUTkniSEi8Na6LqL1TY=;
 b=K5m4kTz2zY/teELEeklmxjrnaMSbBlrMJknve4uf6t0JwQxDXBXJlf7J1UKVvWNWQ2J1cz10VMBEIkiNFFyvUlNp+Vn7oyk158ElR82A5uR3+OCb0Xwm7SkNt6j23qTrJIKDrrMmkC5biVMJSgxk1mYkT4bJKGccc38gNXDnyCmzd3jJFPOmNjZWsKMlKCyrnmJ+UlSUwJswUK8vQPXoxrFV/el/mga8bLfPj2EbSeNi9rBFHddS08BTmGZsc/Wc/ZQVIT3VPDrOBVhSCFiL1QJZ4EetVanKMNA8D5Pl0Cplep3CrS2LIVjDk6Q3aiXWnfAenOtPkFV8DKURVkKS/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 38.104.251.66) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=semtech.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=semtech.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZbjA/qhKF+8NcwNpluPai3pmUTkniSEi8Na6LqL1TY=;
 b=RbYLQfPx2aPmE6+Wpvf2AhSzTcRRkbzMDFy2wgP1oSypJpNebZ1/jeqo3Ih+zhuOA1/OGq/wKIwUUL8rIp+7FuL9a4xU0s6XfOkJzCPlZw4gCdYByfF2wbKvryeTDIQq6Okksuhk+c/HjetzFLRIhUnvyXmyXrFvHy5SmcZ4TWc=
Received: from CH2PR04CA0028.namprd04.prod.outlook.com (2603:10b6:610:52::38)
 by SJ2PR20MB6633.namprd20.prod.outlook.com (2603:10b6:a03:53c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 22:30:00 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::4a) by CH2PR04CA0028.outlook.office365.com
 (2603:10b6:610:52::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Thu,
 10 Apr 2025 22:29:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 38.104.251.66)
 smtp.mailfrom=semtech.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=semtech.com;
Received-SPF: Pass (protection.outlook.com: domain of semtech.com designates
 38.104.251.66 as permitted sender) receiver=protection.outlook.com;
 client-ip=38.104.251.66; helo=CA07RELAY1.semtech.com; pr=C
Received: from CA07RELAY1.semtech.com (38.104.251.66) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server id 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025
 22:29:59 +0000
Received: from ca08gitmail.local ([10.23.50.249]) by CA07RELAY1.semtech.com with Microsoft SMTPSVC(10.0.20348.1);
	 Thu, 10 Apr 2025 18:29:59 -0400
From: Adam Xue <zxue@semtech.com>
To: johan@kernel.org,
	dnlplm@gmail.com,
	fabio.porcedda@gmail.com,
	chester.a.unal@arinc9.com,
	larsm17@gmail.com,
	vanillanwang@163.com,
	mank.wang@netprisma.com,
	michal.hrusecky@turris.com,
	linux-kernel@vger.kernel.org
Cc: zxue@semtech.com,
	imocanu@semtech.com
Subject: [PATCH] USB: serial: option: Add Sierra Wireless EM9291
Date: Thu, 10 Apr 2025 15:28:49 -0700
Message-ID: <20250410222849.476570-1-zxue@semtech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Apr 2025 22:29:59.0288 (UTC) FILETIME=[17F5FF80:01DBAA68]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|SJ2PR20MB6633:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6cd8f730-0d07-4831-15ee-08dd787f3a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pNiB1NjUCWgkNuYwxsM3k8MFt49z/jRSYWC1g1K9PzU6xmMXUXPLxQYxblBm?=
 =?us-ascii?Q?DQrlhSv521Lp4Wmt3JLphafLn3q6whR/4oPwUNTfnFIhYOcyejnrV1hw6bUK?=
 =?us-ascii?Q?tECZMYu300MRsR8E6uprweztHQ2qYgu7emgkE50uuMomz5zl25Xi1Hs9Kqvb?=
 =?us-ascii?Q?aBB8m15rGblEQ7fwDmz91qO5XTBDf6aX6eQupRhi4vFFz4uCO91prDusvp3C?=
 =?us-ascii?Q?nUNSJLJHPO990M18OUcGF8a492U2If9sh/IH8NV6aDbWdYpOMZ6FCUXoNCIO?=
 =?us-ascii?Q?Fbe5A0Z20RH7Rmfayj+XVzLXE8hYWmjyGsztRN1tsmNPw2NBwFk6oPSMnKF6?=
 =?us-ascii?Q?unfDuOYK++zCMXX8QrSdvWGcIrJKBqy5HGc9Eo3n0sBIpK05uQmq+q8rU0YW?=
 =?us-ascii?Q?nB0H5MtN8oFuAK24Vie1bhJ05rGfI7vjaZyfYXX/kGmKuWIbWv/4bMkKj/nR?=
 =?us-ascii?Q?2Jqa6IcXud6Wyh3qIL/bBeV29DqBRThfruODvJ5y6PqYQzwic2iWBM6Uhaid?=
 =?us-ascii?Q?lC4uMq5MjpIbDj9e71GwlPrT0KVhjvDA6Lrc5AyJ8m+3ikc+/ixEzYFbeykV?=
 =?us-ascii?Q?4KS+7eXQ7UUDic8saitolGczj4nPcFXZ90iqqKCMcHlkXfsyDaMafsg3GM25?=
 =?us-ascii?Q?jDfzzx+ABQjae98IodN9xK6KrfzPiZ0OdGYbCi6KnFjpGT8Ux43vS7h9MZk7?=
 =?us-ascii?Q?yMDKVUqxJrUWN8Y3Pa/QbFNXtrqMDQs0IfCi1dDmgXV/LjL4dZ0wZkve7pfa?=
 =?us-ascii?Q?u8MxlrPFySm4Idf6y2vJM1+LX29imymYT+5r1KOSeapGadUhh3zWZBUYQUcZ?=
 =?us-ascii?Q?yQxWBzcnsBDWJUVHlcW65bcaLyShXH9FdXfxBGj9FKQg0Wrng+Q7VMNVNWhg?=
 =?us-ascii?Q?U7RC60nYwV+WzeW1le/Rfwbk9+BCRvlgirKxcnNdbDNp/2SiF4XIa7ErpkKE?=
 =?us-ascii?Q?EVWOoBD8JNsPD+qreQhQpWW5qa3CieEJLgXGR3R743k06nYDb3Q5irR4/Xbq?=
 =?us-ascii?Q?+q2t6Qj5w/5geeGA+AahUcszEyVCnG95KRAbEYGxJKyC4wJyLgP8idd0+63k?=
 =?us-ascii?Q?W4ZoLAtqwh1yJC1sct0kh4L21nGmLDrJjO3V0fkLqzdv74u/4UAUbXb9NTbe?=
 =?us-ascii?Q?7kSImZAJzsFZloALZOsrginkOysIP8nRi4tOUNrYGpN6y2lRRoDQ05k/x56e?=
 =?us-ascii?Q?aGRonYK+KLxnKE6gukmQou4Knd35UQO4lgZ7IxR8U0IsUQXBh/R/H7iUCbEv?=
 =?us-ascii?Q?CoioZGpTvyN0NnvfAUZhccOJHrnoqe3e7VIo1sArLOKYSrIxGRb5vF2GVkET?=
 =?us-ascii?Q?S1Nw7b6RpsWeLRQsM80p8CxjUUJxU6q4UzbjWepUcjnv0l4+e255mbSGA6ZD?=
 =?us-ascii?Q?rBYeBFr9qLCEUlXvWTA2lFKrlcEPHrBphpqYLhVsbysYUc8mcQDFbdBr/8mB?=
 =?us-ascii?Q?+aFBGg/6QU82w0Rf7vkwIbmtZzjxr+mh6nM6mGd5EEXqXWhYp2YiihlxsxY7?=
 =?us-ascii?Q?3NJ0hNiigSoMnYE=3D?=
X-Forefront-Antispam-Report:
	CIP:38.104.251.66;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CA07RELAY1.semtech.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: semtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 22:29:59.4988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd8f730-0d07-4831-15ee-08dd787f3a99
X-MS-Exchange-CrossTenant-Id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b105310d-dc1a-4d6e-bf0d-b11c10c47b0f;Ip=[38.104.251.66];Helo=[CA07RELAY1.semtech.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR20MB6633

Add Sierra Wireless EM9291.

Signed-off-by: Adam Xue <zxue@semtech.com>
---
 drivers/usb/serial/option.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 5cd26dac2069..56484a301d73 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -611,6 +611,7 @@ static void option_instat_callback(struct urb *urb);
 /* Sierra Wireless products */
 #define SIERRA_VENDOR_ID			0x1199
 #define SIERRA_PRODUCT_EM9191			0x90d3
+#define SIERRA_PRODUCT_EM9291			0x90e3
 
 /* UNISOC (Spreadtrum) products */
 #define UNISOC_VENDOR_ID			0x1782
@@ -2432,6 +2433,9 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0xff, 0x30) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0xff, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0, 0) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9291, 0xff, 0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9291, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9291, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, TOZED_PRODUCT_LT70C, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, LUAT_PRODUCT_AIR720U, 0xff, 0, 0) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0530, 0xff),			/* TCL IK512 MBIM */
-- 
2.43.0


To view our privacy policy, including the types of personal information we collect, process and share, and the rights and options you have in this respect, see www.semtech.com/legal.

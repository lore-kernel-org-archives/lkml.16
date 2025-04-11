Received: from mail1.bemta44.messagelabs.com (mail1.bemta44.messagelabs.com [67.219.246.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16092253BD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.246.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391175; cv=fail; b=WCiMOUDYc+ynOmffTzWnY8MNJxcIz07BV0UkRtJG1IjDuTPZ8El2G/Fi4fhG+P+7d0Q7nLdVrfjiKI14It8y6rO5sjTSaZgd4oi4XAofEgyZVsEdyo5yrHKv9PvH95tlHjR1pSBTMakHwgvW/DhF8hhuQSTl+zuAmSOPYsVC0y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391175; c=relaxed/simple;
	bh=RAjIFXXmcsySlav5BBH+fQ20/rO4DBHz7u65zl1A9dw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Tgcmvy3tLm1RIYkj7jHvd+F091pa3qUmFJUg/OuAJNlhL5DbRrrIS46IpQwD7SpOaIa/9qS0agoVvkqACk/O8FF+765GO38N3XNZtJqv4SoWwCwanYP9fyKnSTV+UsVFCL64OCeHGIsv6xIN7QBDseUIdMiYlE7zG9gPEuQ+95A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=VM1F6iTT; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=pAVURUa4 reason="signature verification failed"; arc=fail smtp.client-ip=67.219.246.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="VM1F6iTT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="pAVURUa4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1744391172; i=@semtech.com;
	bh=fMnAjvFCf+mQsgNj0fLMu/OdtJ3i94tyuA0smxSd2qk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=VM1F6iTTuv1hCViKQ2T21l1+407vGGLIXs5b8Dqf0CDPFCpMhvnexbI/l628Y+Ifu
	 QCwlr+K3OaBPZO4wQGVj4VGZ1BktFey8kWW//qbBNjeY65s9m/GSBPdS6aETdCYEEo
	 sw5sdb5W5uAaMgTK4Z9fsEdOqlhqewq2dcxVKbbMDmoaXEyByTgOPo25ZKyc8zPc8z
	 EtEoPzrIUhCstxuiFAoAsVAGeHnVIWjE4plgKJh4PKzcl8QUUiMI3XpZbSt3ELQSO2
	 EQLs1+usowXbj5xuiyc4cQ7sF8sWO7NJulH6d24vujsdm6OKQHJtA94JMaXorI5zTU
	 4hIkRbLiLnB1A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAJsWRWlGSWpSXmKPExsWSoe+mocvi8zP
  d4NpdWYvLu+awOTB6fN4kF8AYxZqZl5RfkcCa0f/rInNBq0jF3r/nmRsYpwt2MXJxMAosY5Zo
  vDKfGcJZzCrxYvoOVghnGpPE46azTCAOi8B2Zokvm6+xgThCAguYJKavWsoE4axikuia8wZsg
  ITAUUaJS58nskBkzjJK3Gr+zw7h3GGUeHphJTOEM5lR4mpTH1AZJwebgKJE65fTYMNEBO4zSu
  w6uocZJMEsoCXx8/FNxi5GDg5hAQeJZ/3yIGEWAVWJm796wEp4BcwkGmbvZQWxJQTkJRbvWA4
  VF5Q4OfMJC8QYeYnmrbPB4kICshIrJvSyQdQHS+zf+Y4ZwpaUuHbzAjuELStx9OwcFgjbUeL8
  wVNQ50hIHHzxAqreV+Lw7uNQtpzEqd5zTDA37Nx4mwXkZAmBEIkvn10hwXKHX2LqikssEM4zR
  omfl/dBLZCRaL+8gHUCo8YsJHfPQnL3LCS7FzAyr2K0KE4tKkst0jU20UsqykzPKMlNzMzRS6
  zSTdQrLdZNTs0rKUrMMdRLTy7QSy0u1iuuzE3OSdHLSy3ZxAhMKFwfKibsYDw1pVn/EKMkB5O
  SKO/jTz/ShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwcnv8TBcSLEpNT61Iy8wBJjeYtAQHj5II
  7x2QNG9xQWJucWY6ROoUo6KUOO83L6CEAEgiozQPrg2WUC8xykoJ8zIyMDAI8RSkFuVmlqDKv
  2IU52BUEuZt8waawpOZVwI3/RXQYiagxarS30AWlyQipKQamFae8TzRed9B/NIG04L5sTyzqt
  ZKb+pJ/tetrrOX/9qzQ+v88k1vnn+0UbKEL/P7tM2u05on/lF39dnDW3Em8sa11hX6KseMNk4
  +ezV3xoPM5xJRcprTdzzNsnK6bnx5bdN82eUC19XX/it+qrgsWr5EujEl3zlz3k3Ofyy5rbMa
  Gj8u/v9HY+H2SXNeWc7eN2PC5sm7TdxPv5r88s5ts92vpyb8P/sxp53xs9nhuDrnrxwcxVcWm
  xkse/KfxfLz1OWd1k4VXFofI35tUY2bw5PdWyqWFRQwdaf8N9Z54qck3v6OfX8kwvnZhlSruF
  rm2mNBCsKTBFRXrXCc6GHje+XB4XmGKcxPrG99an7NKq+vxFKckWioxVxUnAgAxlLB7yMEAAA
  =
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-13.tower-904.messagelabs.com!1744391171!325351!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.117.2; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 19870 invoked from network); 11 Apr 2025 17:06:12 -0000
Received: from mail-bn7nam10lp2040.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) (104.47.70.40)
  by server-13.tower-904.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Apr 2025 17:06:12 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWMVJf7Z8Q5EEi0mVSJI0ciLgMAGhnx7+xYKEfAu3LZyl01V0j0HoVRB+V4KGtkpBx9RMNJRipONjItyvauMkrPadFsdkAOZnkj5/QxDeYBiVmIr6jP8FY/uxL7xweiJv6m4Fam7R25ZeIakwtK8B/ycFcrI4JfMj978s9HP1K1sF0nFLuPcHGB/2SKrOQgCVgubSsldOezvw2RBLKgXcCfD/tlkeAqxOYBFyslY3HRAis2QVJYdPa56ddXJ6lyfN9LbQbJQD0gpyX0NSYV0e4Pdyxk/F2FBabRySmSfZ1kKG2V8ePbq6EHMbaobDu1e/XymDvFBqoGHnao59CYrBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mhl/cDClN3KehWu40eibmGDNTZz8dbbYxWBCyX3g0WQ=;
 b=wgO2H0UQAf/w+sPHa9U9Of2QJPyq/8//bJvsTk1B9JCffW4feet06rO1FsP+XswLOB9aeg3uo151gvXnLloTJi/yqbNlol0ULzeUDEsoTrrpWvaKbNSK2ieNFQuRlGNTFLMsyFPyLWbUtOIwCcgNqtDheiYBzDKn65g/tWNhUVGPvwkG7QJa7et/H0xuWam18gOPhttzY3q/QjR7QRjuFBt3JB2IDeX70/slfJ7tauy/dIa66Ma+Ms+VMEbFkidurhEYtVs2JyIX+zvXBfl/qaSjCBPXK3D0TTBKoW1+uomHCIU4zP6nst2jx9S0nrr6AQ2Vhep0Ux7aoWbDf2jeHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 38.104.251.66) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=semtech.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=semtech.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mhl/cDClN3KehWu40eibmGDNTZz8dbbYxWBCyX3g0WQ=;
 b=pAVURUa4LrD9iNKvX+toxYVsUhiLxu+m7AoORNxlYGCLROeoxrBsFa7k3oqvBttbz6JNNQQIcGOhiZgsdk8Up25YO0zEzElJxPh+jhvqajYjBuGqOU2lH4syJtOf8Ub15ukOfgLjfaZH3hvpbffBANSiw2f5l47d+FyF0dZF5NA=
Received: from MW4PR04CA0166.namprd04.prod.outlook.com (2603:10b6:303:85::21)
 by SJ2PR20MB6330.namprd20.prod.outlook.com (2603:10b6:a03:502::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 17:06:09 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::b7) by MW4PR04CA0166.outlook.office365.com
 (2603:10b6:303:85::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.36 via Frontend Transport; Fri,
 11 Apr 2025 17:06:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 38.104.251.66)
 smtp.mailfrom=semtech.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=semtech.com;
Received-SPF: Pass (protection.outlook.com: domain of semtech.com designates
 38.104.251.66 as permitted sender) receiver=protection.outlook.com;
 client-ip=38.104.251.66; helo=CA07RELAY1.semtech.com; pr=C
Received: from CA07RELAY1.semtech.com (38.104.251.66) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server id 15.20.8632.13 via Frontend Transport; Fri, 11 Apr 2025
 17:06:08 +0000
Received: from ca08gitmail.local ([10.23.50.249]) by CA07RELAY1.semtech.com with Microsoft SMTPSVC(10.0.20348.1);
	 Fri, 11 Apr 2025 13:06:06 -0400
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
Date: Fri, 11 Apr 2025 10:05:38 -0700
Message-ID: <20250411170538.711844-1-zxue@semtech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 11 Apr 2025 17:06:06.0552 (UTC) FILETIME=[038F8D80:01DBAB04]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|SJ2PR20MB6330:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 78afb5f6-e84d-4ef1-93fd-08dd791b272f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rXp2t2LHVyyfkAaC1PVr2X4lSr3EOiaqHdnz8dg6e48T6Mrupr+sOXzxTxpN?=
 =?us-ascii?Q?i8YSIX2j/I7fZlt60ie4dlcmouWLqrxxJWQIig0Um2ZMDJM4Ao69Vvb8pyaX?=
 =?us-ascii?Q?1vZQIo1Gp2kobrTID369xsj/2eW5Fy8k6zrbusyX0cQgRWca8hjPnJPJ0jS4?=
 =?us-ascii?Q?hAtVATXU6NlYhl0ANr+PoIrsLDoMINXlvz+GDbrGJQzxMgq7QICfmSVMn2a3?=
 =?us-ascii?Q?IYy4gSdZ+PKlrvxZTZJDKam4LVTSBnnvoKkg81bkY90YtGTYzvCK1oic/KRi?=
 =?us-ascii?Q?pSAd0HPmFa+7M7zfWYGhR9Gk7wnYUuOGzb7wS5OifC22JajLoM5wyb1U7mTV?=
 =?us-ascii?Q?uIEhqNNEwK7R3IXI1TCQZL2ve3OgpfnzcL/5dJ1lRMDukhLDAbyzYNs/RnBv?=
 =?us-ascii?Q?i4+ScjEvS/8KcKcya0AM/ViKz0zFeDBSzlHHq9CO9f7kCFpYNfjvsyI3cwg2?=
 =?us-ascii?Q?va1A0l6jZ4+ySvbZMt8pP9SizVVhKhNBW+b04bbaq8QcGqIPIP8NGbwP69JV?=
 =?us-ascii?Q?tu75luzYiwUmcrPUU07RG+MiOnM8VKjkLGrMAyNovtth+MByp1jK0dP2GoPg?=
 =?us-ascii?Q?gdDD64fIcyInEFBLh1QNUXMaFJwOD0iLHxVWtn0dH0kiVg6JMcD42Z1Tiuor?=
 =?us-ascii?Q?6kSPl5xtTaEVAMtDEFy1OW2sjPkfXaDbYFlda5+t9CisT1zINYQbIx0ArBil?=
 =?us-ascii?Q?29zEN8ewydRoDrnEXVn0cuyWtaRcYSAtfEC9axpZ2mtazpLqUGeHlKpPI2DJ?=
 =?us-ascii?Q?4sHqRAuImQ0PUavsLSNO2h7Ergg0w/Ys5tcE8J7QpStFQkVipLCFtR6ANDmQ?=
 =?us-ascii?Q?y/LtUbeScqSELpMH9lriZyTzAPT8dM0bMJMzJQAkoQncySa8NJnS5/NLDj5E?=
 =?us-ascii?Q?/777o25Vu/eBUMtmlC4DB0J+ldHlXRMkv3Fo0SH08FLPeP4nbfwy585YGtTI?=
 =?us-ascii?Q?ZkknNFPTUXvsTaAwEmEkzOzrdnXclVLLU0hrtpFc46tRs9rLSoBdOwf2uTwB?=
 =?us-ascii?Q?MwUQi9qNSRgxl6RGv50NfDk76Gg73Ua6F7lcSByFEKixEqeHN0IEeALX+Fco?=
 =?us-ascii?Q?zoN/u48TWKEPETkuNrsv03NgnbKCDys0Aos+RqZ0mj3kqEfEh8vgExTguPkP?=
 =?us-ascii?Q?iqUlwyqX2Zpq3hGNrHTp2h0LmqLgOE70i8+6S1Xld+0M/447tPwDbZpBgtP/?=
 =?us-ascii?Q?jl0Cauy07TssDdr8IfGv5P3ggwSQnMTfM1KaD4ezDGQQOWL75fZLESo82dl7?=
 =?us-ascii?Q?Ulemx0J7b2ENXHeVuJB9AKR6TdJ0D17faEZY8bb6LShVKXv+facmgU1aFcjY?=
 =?us-ascii?Q?K8QmXnDHwswy9/1Zp9qA0GwMJNn2mnWPoAFaxOo3fAM1P3H67LqdtFTNuwGg?=
 =?us-ascii?Q?B7z/N1kTgvJB6bRuFows/nWLmpWApDa1c7gWa7MUvyWkxcr7DGuH6UF2pZrO?=
 =?us-ascii?Q?/yu7764DeA9ciesT9+cPztXVu564wxJjqH6O8HSMkC1cnocuDnlPqz6wnPYf?=
 =?us-ascii?Q?+cWWtQPa4MGcBh+AuTI0LRC76pLl7kHRmf1/?=
X-Forefront-Antispam-Report:
	CIP:38.104.251.66;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CA07RELAY1.semtech.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: semtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:06:08.3735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78afb5f6-e84d-4ef1-93fd-08dd791b272f
X-MS-Exchange-CrossTenant-Id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b105310d-dc1a-4d6e-bf0d-b11c10c47b0f;Ip=[38.104.251.66];Helo=[CA07RELAY1.semtech.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR20MB6330

Add Sierra Wireless EM9291.

Interface 0: MBIM control
	  1: MBIM data
	  3: AT port
          4: Diagnostic port

T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1199 ProdID=90e3 Rev=00.06
S:  Manufacturer=Sierra Wireless, Incorporated
S:  Product=Sierra Wireless EM9291
S:  SerialNumber=xxxxxxxxxxxxxxxx
C:  #Ifs= 4 Cfg#= 1 Atr=a0 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
E:  Ad=81(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=(none)
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=(none)
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

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

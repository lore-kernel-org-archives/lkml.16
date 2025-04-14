Received: from mail1.bemta44.messagelabs.com (mail1.bemta44.messagelabs.com [67.219.246.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F781EDA1E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.246.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744665293; cv=fail; b=hDOuZEGO9w4bfYP3smelBXkxui921BsfijwV6u/SpR/NzEb+CZDWv1Jl+mXFcZTGEd61znEUIsqm/UZET4eyqpSWl+rWndEgqfnfpnrsqA/f5wOEtmNlImzIwfwv/A0CcV6qtBDP5jNDmFCaNZav/JK+nZB+GGcuuwFyRu8CTfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744665293; c=relaxed/simple;
	bh=2UL9ZMPDseiWAO1pUixCq0ZUunB17fAvLxH+Y9GOBzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AEO4Ci2aQvfTcdE5sbWREGqxJpUCp8ZpgIGgqlKs2bQ75JnfY6eaGf8OYK3rIwx79ETKv2MkXuwzr3u9fN546xhdD9FDaS7uxP8hZFuAJKC7E3L1OFkQes5V6mfYjjqcfilsJFWr3N6KZojgtUoEHnS929qrcFyUxyD22r3021U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=O3Sf822v; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=uqqfDXl1 reason="signature verification failed"; arc=fail smtp.client-ip=67.219.246.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="O3Sf822v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="uqqfDXl1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1744665290; i=@semtech.com;
	bh=86jL04AOldxD/Zn1zzJPpJsPW5VOv8IRKYcXrg7oSTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=O3Sf822v9nLmAmiayOQtg3Sy9oHfdQyt3iXv4CyUYz+VQaBxugDFtd1grs4mixUs7
	 yYoKpAipRs5UKC3MI0dtLCVpgSwacaWQI5/hI9jxvthOiyVPB6GOwoQl9cA+WT62UI
	 keY1qehoR7z0Q7GBhqPuqPR4BQmzT1xV+3gADLzPyAE4/nLY214cble36P4CnOrX0+
	 wqS2pjbI9u0b4sa/tZyo4FYJtYJycQ7qjVNYO02YOimzgKTfE9IeF0bkdOH8iqU05E
	 rS3FMWa+QBC3/5+lp5Iw8vqD6cldfo/7RQPmW6T7TvZPfKRDs+i57o0ZaniTYCtCbP
	 auHjDhax/FTvA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIJsWRWlGSWpSXmKPExsWSoW+xUvdk1d9
  0g01bpS0u75rD5sDo8XmTXABjFGtmXlJ+RQJrxoZr7WwFj4Qr9t/ZytrA+Fygi5GLg1FgGbPE
  1KkH2SGcxawSW29NZYJwpjFJPG46C+awCGxnlljVfgusTEhgHpPE1dvHWSCcFUwSqzq3gDkSA
  kcZJS59ngiVOcsocav5P1TPLUaJnU1NrF2MnEDOZEaJWXM0QGw2AUWJ1i+nwbaICNxnlNh1dA
  8zSIJZQEvi5+ObjCC2sICzxJJfW9hAbBYBVYlt0z6xgNi8AuYS0z7dB6uREJCXWLxjOTNEXFD
  i5MwnLBBz5CWat85mhlgsK7FiQi8bRH2wxNY595kgbEmJazcvsEPYshJHz85hgbAdJbZtPs0I
  MUdC4uCLF8wQcV+Jt3e2QdXISZzqPccEc8POjbeh4iESv7p2QMPlDr/Esckr2SCcZ4wSP3a8h
  bpaRqL98gLWCYwas5AcPgvJ4bOQLF/AyLyK0aI4tagstUjX0FwvqSgzPaMkNzEzRy+xSjdRr7
  RYNzk1r6QoMcdQLz25QC+1uFivuDI3OSdFLy+1ZBMjMKVwfai/vYNx8ZRm/UOMkhxMSqK8G8P
  /pgvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4OWqAMoJFqWmp1akZeYA0xtMWoKDR0mEt0cKKM1b
  XJCYW5yZDpE6xagoJc6bUAmUEABJZJTmwbXBUuolRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMS
  sK8qSBTeDLzSuCmvwJazAS0WJ3xF8jikkSElFQD04L3n7PjZ75X/h0o4jXTxeTvFnub6BeP55
  pWsqXuuH04bl8N1wRn396mj54ft3Y/knDkVSwumbr10ILqsy7cYfXvzb3KZbepLNw3/8y+Uzd
  W7+FsLNmzf84pK+PDt6fd6etJYZjizvUwfsHq5UpxDRnpvzvUgyvFbBV+vYk3X7Ij9+HFdfGO
  y1PVLVN/6p2e89Vriitb/JvGCU3Mbydt31A39Zq2hEBZ6MrFDEs+8Ydum/Qt0/r3nCl3FKx+a
  N05JLl58UzNifaaDlGijxdHxFWc3XHK4I5BwZ4v3jVrf+1Id5rgeGdfT5e7F0twg5C2Fa+pze
  GEld90ih0mb/RauqlPRWLju3VMrU+UT9bWnFZiKc5INNRiLipOBABRv6umJAQAAA==
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-7.tower-904.messagelabs.com!1744665288!2268521!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.117.2; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 24382 invoked from network); 14 Apr 2025 21:14:49 -0000
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) (104.47.56.169)
  by server-7.tower-904.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Apr 2025 21:14:49 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibN9MfJo/BRYrnfblVJ67/FUF6yvYt19+uSAmPhr3mo2LF/qo1dxhkml99wrHH9hpEWsrvFI+IYfSmhH4wacYHQYUutStBmCFznEWk127h3NDuKjitA+uhSVwQESodvBGya0plt2VH1nCwGZa5KHHT+bAX7fxmazsLzHJTlOqQQgDsQcfditN6FPtQ09Lna9xbtXlCHhBES1UeoN3E9CmltLnENa46M+sih0uz4JCiYDqgZdsDRyuh1ducFwm6ZcKURCqhNqhoWiJISMied7qlMCn2rYEpqo8p/7d5DJK1CjAsJowvhyl92FaEayQj/M//AptfK88eGwIJ5pbTC8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVrCQjX8VXedmdHPcT6AWykbfe2X8BBXapAzD2vXfjk=;
 b=vVLmOhd0MCJL1XXcpKbQ2Rnl5CtJ/MptbplHimSZho+exzAw9WodK/SHJWfHOpA9kEFMV/8teVCewS87llOZ5RiQuKl9Z9f2ArIUBEOnPKF6rYMNXd4Iwm4kqL/jZp+LLDwSQwWTEisGS/4YwnwVnEzz8qRtRpHsDnOMA3MzP3RuZfZBHJywI4MjwRpSpGJYzTrnjztUDGj4ZZdUlXbo64Ar6O2wEBu14uCKtMnnsIkCRLVYHtpPW3npxE2UmTUhA1OPQJX0jv2vfFItWtBrffZ1ncEw0ZsgH5iDVL7m6ZsqbyJspuTClxvaDxwyaoi1KjjWG3BaX/TDXfBf3IeLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 38.104.251.66) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=semtech.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=semtech.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVrCQjX8VXedmdHPcT6AWykbfe2X8BBXapAzD2vXfjk=;
 b=uqqfDXl1/a+9NndEjK16jVKnLDqd2iB3k9p0OPcwP8oO1k9U+BFBl4aSlXjP5/cTmJCBiTxibw8R0htIzMgsC+b3QCgvQ1t2o0H0PQtt/v3LJZlyea/mWa51/HPfzSMs9n6p0Xo/o0S60SQBY11gRoYwdPt3rlYVGXWN4uT2Q08=
Received: from DM6PR18CA0028.namprd18.prod.outlook.com (2603:10b6:5:15b::41)
 by IA2PR20MB7187.namprd20.prod.outlook.com (2603:10b6:208:4b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 21:14:46 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:5:15b:cafe::c4) by DM6PR18CA0028.outlook.office365.com
 (2603:10b6:5:15b::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 21:14:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 38.104.251.66)
 smtp.mailfrom=semtech.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=semtech.com;
Received-SPF: Pass (protection.outlook.com: domain of semtech.com designates
 38.104.251.66 as permitted sender) receiver=protection.outlook.com;
 client-ip=38.104.251.66; helo=CA07RELAY1.semtech.com; pr=C
Received: from CA07RELAY1.semtech.com (38.104.251.66) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server id 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025
 21:14:45 +0000
Received: from ca08gitmail.local ([10.23.50.249]) by CA07RELAY1.semtech.com with Microsoft SMTPSVC(10.0.20348.1);
	 Mon, 14 Apr 2025 17:14:45 -0400
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
Subject: [PATCH v2] USB: serial: option: Add Sierra Wireless EM9291
Date: Mon, 14 Apr 2025 14:14:37 -0700
Message-ID: <20250414211437.1905816-1-zxue@semtech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 14 Apr 2025 21:14:45.0573 (UTC) FILETIME=[3F3ABF50:01DBAD82]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|IA2PR20MB7187:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8e81afc9-73e2-4ec0-91c6-08dd7b9961df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OncEpnT4poNRNqq1bBV3LTj1vWPrmogJAlOSjN1aD9YHn6hQHt2pOaJwe50H?=
 =?us-ascii?Q?P0i/ExAWQGKHbe8Abmp4qM7YcIMH0iNgsGrJ0W3i3lo38YCqHysalvU8ls3H?=
 =?us-ascii?Q?2+orKZOqWlDXuJbpE15ogtw0OCOIIm61E/BXiFLflRTIciSnbFCieihe8kyh?=
 =?us-ascii?Q?TfIL6j3DLmprbOiKUp4Q65oSrBuHcWiwcvZSXlhUWARHpZq5XyHK1stVqVEa?=
 =?us-ascii?Q?r97pWzIJ/DK9TW9MOkeCFT1AKvJigKOvhMWi4C03b06S6r6JQvyTIn6Cnk30?=
 =?us-ascii?Q?ElLSVuayIov0fqYOKh3Z7isWGUoLNLycBZ4D5abBUQ7Cy+sgNsTLoG6FDBHg?=
 =?us-ascii?Q?jgn1gswY3Du9Q7jPpdHcrY6AmVznoAirkSqwu8bvhlSEL+vHAUrrbl7200/T?=
 =?us-ascii?Q?CqmfxW04JZP3YqcmTZBaxHASuZSCJOOwK/uMjTAUFoS5kGMDYB5YuGHVZzth?=
 =?us-ascii?Q?xVKM4byiZgGI6wO9pSqMPZQYuwkIunWtjmq6oPUIQC5/K9s8s5wrqb9bwz2W?=
 =?us-ascii?Q?IAoawH8DDkjmkkSvlhtzuIEqPnwWCVifexA3HZnM8OJ6Gm3ydb5bJyGJPwnk?=
 =?us-ascii?Q?70It3UBVVSqg+ClrB2LUFf+lKs6BqmF6iWOcrXA+NbLBIozZNK11mLCDBGDf?=
 =?us-ascii?Q?Y0cfFH6X+LC+buwZ6dtVW7uGv8L7eXZJAnVABD7mTuPUEDDFmKLEdABVxXOI?=
 =?us-ascii?Q?437hwbANiVZnBUAwIUanjnuwu9OYdPCX87Yf6sz47gv2YQJKAP2idOqeMEWU?=
 =?us-ascii?Q?DSgY9NRq5xyMJKqQEAa4f9qk2ZV0upbtebh698pF/yyyd+gjdSj8Wr76n5Jy?=
 =?us-ascii?Q?jK9kjNZ7f+hj6LPowOcPx/JPN70R8LkAmtijs6E2QbEQd5HLLosukGaPFcIr?=
 =?us-ascii?Q?fSV4NCEvYbHU2lmuZkCUOcBphIPYZxBIzBRdx/dSQOBspuGQkS2Q4kRzo1zi?=
 =?us-ascii?Q?OPjw0bm+ce8cf3iLhJRtmSVpyYLcS55Ear/MfvtcB/+SGAPqsORsqW3Xa56F?=
 =?us-ascii?Q?cYkynr57bfw3g/LzenmCqcArZxLxs20AE3Brq5FzR7TD/OnWU1bgt1+uCiY/?=
 =?us-ascii?Q?5SBJmPQPWBgtTDrNeYpUmMvj1IO4AmFID2p07bybZP1fIRyqW7fG24FYq8JQ?=
 =?us-ascii?Q?RGoFw4gNU79yHeLAUHVuqRiQh8Mu47UJZvZiEkQ1jJdnL5vVLW8ekLYSInPY?=
 =?us-ascii?Q?PXBuegbH0Opt25zqHn4f8Bh/vJmNuM1317AQb7al3NpC/TQTchAb1uiFZQvJ?=
 =?us-ascii?Q?ftYfM78A+pfqS1eg0CvaZtKq5K+U1zqrngK5nMB0wQYeV6hhnY7Gt3qErFaP?=
 =?us-ascii?Q?wHqhpekAvTFq43PP3/vU51zrk+RADrslVY8LzS/7DGyko92rBL28dukEO1kF?=
 =?us-ascii?Q?3ReZoUWhztJYMg3snOI2XUFdVie1fGX/zzwrXjwOt6LcIUvNfogQPnC3cXG0?=
 =?us-ascii?Q?J9d/o5mXZ/U+RdrWdwujOdd58L5Kcqw4+yUlqMfPpDFroBuA3O10IEYUs12n?=
 =?us-ascii?Q?wbjZthRM1dBuQENAqzfJri0WqwyTulLPpFKz?=
X-Forefront-Antispam-Report:
	CIP:38.104.251.66;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CA07RELAY1.semtech.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: semtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 21:14:45.7951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e81afc9-73e2-4ec0-91c6-08dd7b9961df
X-MS-Exchange-CrossTenant-Id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b105310d-dc1a-4d6e-bf0d-b11c10c47b0f;Ip=[38.104.251.66];Helo=[CA07RELAY1.semtech.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR20MB7187

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
v2: remove unused device interface entry

 drivers/usb/serial/option.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 5cd26dac2069..27879cc57536 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -611,6 +611,7 @@ static void option_instat_callback(struct urb *urb);
 /* Sierra Wireless products */
 #define SIERRA_VENDOR_ID			0x1199
 #define SIERRA_PRODUCT_EM9191			0x90d3
+#define SIERRA_PRODUCT_EM9291			0x90e3
 
 /* UNISOC (Spreadtrum) products */
 #define UNISOC_VENDOR_ID			0x1782
@@ -2432,6 +2433,8 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0xff, 0x30) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0xff, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0, 0) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9291, 0xff, 0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9291, 0xff, 0xff, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, TOZED_PRODUCT_LT70C, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, LUAT_PRODUCT_AIR720U, 0xff, 0, 0) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0530, 0xff),			/* TCL IK512 MBIM */
-- 
2.43.0


To view our privacy policy, including the types of personal information we collect, process and share, and the rights and options you have in this respect, see www.semtech.com/legal.

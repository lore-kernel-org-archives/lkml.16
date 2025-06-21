Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D2426FD9F;
	Sat, 21 Jun 2025 19:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750532853; cv=fail; b=hFZ25Kb3+S8A1d8wKH09l8r6J4a3KGyDDCg471ipr+U9XtQIhAIG5EMukt8klD4Z2tu7xj/pnbC9/FrD4RUaqGO2OijbRXH+STPjtPK+Olr7he9aHTHDYgvHy9lghBEOVWXCK2YfauX4Dedm7+w1Oto3gBNbEGFbfTEVRsewrtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750532853; c=relaxed/simple;
	bh=56H+hHxANaXHZfjOOzKHPVaSf5TUPs8UgOT85E0FiTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AcnAg64lZrrS5Jhouf+YI7UVQI/ymKRVJSL1yT2fwZ3I1HXINN7u76pfIC4B6HiZITCJR71wiSAi7Iv96gEmdkU4RHzKgoV23Kq9ZkWXiCViihoFh95iYUUSogWco9lMOItZtnwgsNUAAJlfEReNeN9RescYYilhOZfJYqZkB+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=I4aa/uS0; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="I4aa/uS0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIjARS6M5EtcdbOFMvoiH0oR8doQ3ZH2/WVeA8+MizNqd4QBvGkoGEjLwxq5/N9UCoOO0AKF5sFnCKd8vlepay6xi6Hf0FB0ErywgTmUMIABJq9AEGDJ/7xNZH3axBYpQfU85pGIJULjMxsC6b4wCj4LL/bU3fYHGz3t106OO9MQT2hh4cSbFSjzYW6JN3LQOxkU6QLaxmgYCeSsvl60rT8qToG2xvXnusQHI+hypEMCnW+cH0POhl/zeTQLwwbGHHb04eeUlUEjPt4HpgIw1yoTzFZvKed02mdw4i5Rbpquy6olg2t0PC4addDC/gm5C1+zpnmmJ5jkDEwW5R5eGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spb+5rmyMMc+ynZjuhR5wyXG/YzwDA6iLeZDNEk/lkk=;
 b=LXTfLOhWtTOMWAFfkM0S6Hc5YRkCDxNHCfbwxske590uHpX+7RNBpZB510pQxU5b2q80mkGQjclNTHuDWHk+cQuZAtMcJ6A3lBGfXisSyXZwBC53pdfxGalV9tlwSZ/ZanSqpCUZ0arY9wOoCOkEgxv6rVIp4oTQRAcLaCw1C5nu0TD+SQ6RjzpEfA11yAH+fRXoJt5aibFwUr21zyerjmoiJOQzYmJLzlSNobMW+F9pbm8lQJftJQE0bOdTa0gW4eeyagb691OgfiKgKQTDhDp2K+YuNAFoybzYl2+8+TRJ+WrYeCHVWXJJTiBKYxVhWwE9pr+kunGqRdw5PlPjbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spb+5rmyMMc+ynZjuhR5wyXG/YzwDA6iLeZDNEk/lkk=;
 b=I4aa/uS0Il7qEcvp5LxiKomDHpMb5rqK5N/Ahp3AndJ4l71za2HP0Tq/9JkZTxoXnF5LZo64ub5O3lxJjXh1YyKYHzoeN0l4wEGO+eakbe1S6WBf2fNAHPAb7uT/ZEg6imIlriFza8kwNxVKLBPMG2p0bclr0FECWl4MULMwTBw=
Received: from AS9PR04CA0126.eurprd04.prod.outlook.com (2603:10a6:20b:531::8)
 by DUZPR06MB8776.eurprd06.prod.outlook.com (2603:10a6:10:4dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Sat, 21 Jun
 2025 19:07:25 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:531:cafe::ec) by AS9PR04CA0126.outlook.office365.com
 (2603:10a6:20b:531::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.27 via Frontend Transport; Sat,
 21 Jun 2025 19:07:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Sat, 21 Jun 2025 19:07:23 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 21 Jun 2025 21:07:21 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Sat, 21 Jun 2025 21:07:14 +0200
Subject: [PATCH 1/3] usb: dwc3: gadget: Fix TRB reclaim logic for short
 transfers and ZLPs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-dwc3-fix-gadget-mtp-v1-1-a45e6def71bb@leica-geosystems.com>
References: <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
In-Reply-To: <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bsp-development.geo@leica-geosystems.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.14.2
X-OriginalArrivalTime: 21 Jun 2025 19:07:21.0562 (UTC) FILETIME=[B7223BA0:01DBE2DF]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B2:EE_|DUZPR06MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa00a83-2d0f-447e-b75e-08ddb0f6dac4
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmd6MzdXRWcrRTJ5MlYzUyttazRuSXlia25PREZvQklMZDF2K2VPMUI3cktG?=
 =?utf-8?B?S1FsUDVZUnhBaFBZZDhydGkzNStuNTdKdGx6ZVlOd0J2em9zU21pZXR1RGlE?=
 =?utf-8?B?Wjlicy9Ca28yc3ZiczVXTTBhVTJmaDBhb0lUaFZGSitGdjFNb0czYnMwbFpl?=
 =?utf-8?B?YlhDL29YY1pCVG82aUFUUkliQ0dCdGFhS3hidFFsQ2xXUWdrNU9nczB5enIw?=
 =?utf-8?B?M1NkQmtCVkJDOGtVRnJSOXpQc25GZkdsS3NqZDBaeUlkVm9sbFNmV3EyUE5G?=
 =?utf-8?B?Z3VEamozWW03ME1tOXRhTEc1NldUbTlqaFNuTGxzS1hLenhJZTBKVTZOYTJS?=
 =?utf-8?B?WE8wc016b3R1anpqcjQrQndFSkJBNEEvL1I3UVJ3d09veFE1alU1dGVqRXNw?=
 =?utf-8?B?ZC9STEd3dHFkZGZFemNZVStCL21KM1dHcmRwZE1EcUN1OTVHRVJtUlN5WEY4?=
 =?utf-8?B?bWFtRnpJU243dzFoZkh0ck1tRlcwVWdVTENzajIxdGZidVZKdEt3ZXJYc3BR?=
 =?utf-8?B?VzJUSFp5enZqQWdWckNiOUlnWC9iQkxudG5jcXJuM0RqaGMxcmQxMEpiNERX?=
 =?utf-8?B?L1lhSXN1Z1ViUFM0SHUwVDN0TUtaWmtwdlJyQUtSU2E4eVdtcGUxUVhhZ0xW?=
 =?utf-8?B?cDVVUjIrQ0tscnR1RkxMbVhNTFRIQ1JQUWJvbkY2ODhSZzkrUFByWTNhcW8v?=
 =?utf-8?B?TWNTQmJwTUNjRWhsakJXdWhCb21VRFhva3p5cHppRVhOd0I2aTBFWHJkTVlB?=
 =?utf-8?B?NUthQ1g2UnFLNDZ5ZXovS2poTTNMYlhmakkyNzFudXBwMVJvdUlIMDdOMUZM?=
 =?utf-8?B?WW9wNHliVzRNQ1paQUxHeXhVTmo5cUdvS1pGUVl1REJ6cDVDTnF1RFJTZVBn?=
 =?utf-8?B?N3ZGRnBVTC8zd29sZFRyWVIyUDRKVkczbmd1RWo3MitFZ2lkME9nbkQwRklI?=
 =?utf-8?B?NzNyekRybWVmWDRNcjFZcVRPcXZaMGNRSkhKb1NFYzhOZjlKTXMxSm5HTHc4?=
 =?utf-8?B?K2diM0c3VVJVcmxZaXF0S0VaeGZsSVQxRklMNm9MRGxlbjVobG1HcGVtYUh5?=
 =?utf-8?B?dGI5c05OMUFMd2p0MkJRa1ltWHBTWHdqYThCU2owNGZqUE9ZL2dBeGFQZVhj?=
 =?utf-8?B?SVlqUm03R3NUS2dTeXRhd2ZKeHpLaVdScjlZYUI1SDZvbTUxSTc1RlRvaDRn?=
 =?utf-8?B?Q0YxS0xwUDV0b0NnVGNYU3VOT0lJbnQxM1duTm91dEM3Y2d2bmhadHMraGps?=
 =?utf-8?B?N0N3ZlRaWGlIVVN1aXF6WXpwa0hNQnhNZ293ajRKNTBDVGxjUmZCTktKQXBx?=
 =?utf-8?B?S3JRUGNZTXVTa0Q4cHNiMjBiUzhtdXF3SitNSjdZUUltUnAwTXZPS3A2Z3Fo?=
 =?utf-8?B?UWowUHBEdDdmSUpLRkR5cjRqTzNpc2M5RURFNFFwWVBreEx6Y0JBdUpDTXZh?=
 =?utf-8?B?N1N6V0ZaT2ZYSktFd3BoVXB6OWxjcUN2Tk5PNG54MUdQbGJQZTBJZ1FCdFc0?=
 =?utf-8?B?UFBiR2RRUmVXRXczWm9VZkk3Y21sN1lvek11SGp2MWUxVkxWMGNxWDUrd2NI?=
 =?utf-8?B?MCtSbGV5VHFaaGxuZHpTU1QxSklsYis0a2c1Q0NESWp6WUxnZWVzQjhaTmhJ?=
 =?utf-8?B?VmUvM3FXM1JwNE1Kek9SdDdFbUJHeVNZZ2VrWVRzSFhLV2d5Y1hLLzhNNUdj?=
 =?utf-8?B?UTBpYzlOMXpRbnRJd2xRM3Y1S1VVa0dDSDlWUjBHQUs5MGxmdFRYblNRWGpl?=
 =?utf-8?B?M1J0c2RWRW1FWmxLWncrRGZaTG5qc0MwdSt4SzNBdVFUNFdXU2tRNE1Xekxm?=
 =?utf-8?B?b1dXdU5POUV6Z2lkclZvZFlGSkdOdHQ1M1paOHFydVprUXh5OXd4NkJYVS9w?=
 =?utf-8?B?VVZuSXJWdmkwN3hvTXdtWnREbDUyMFBJTlhaR0VLVTZuZWF6L3B0aHFaTmxz?=
 =?utf-8?B?a0ZlbWE2WHpzdjcyTVJ5ZTZlc2NnT29MNHA3Q2k4NWVwYmUxNHZzSUpkWStp?=
 =?utf-8?B?WGJBY3hWWHZGMXJmeC9mMWFnM25pUGhQMlAvbEdkR1JsZ3k1MWI5SkJjdHBS?=
 =?utf-8?Q?P+wMx8?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 19:07:23.4288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa00a83-2d0f-447e-b75e-08ddb0f6dac4
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR06MB8776

Commit 61440628a4ff ("usb: dwc3: gadget: Cleanup SG handling") updated
the TRB reclaim path to use the TRB CHN (Chain) bit to determine whether
a TRB was part of a chain. However, this inadvertently changed the
behavior of reclaiming the final TRB in some scatter-gather or short
transfer cases.

In particular, if the final TRB did not have the CHN bit set, the
cleanup path could incorrectly skip clearing the HWO (Hardware Own)
bit, leaving stale TRBs in the ring. This resulted in broken data
transfer completions in userspace, notably for MTP over FunctionFS.

Fix this by unconditionally clearing the HWO bit during TRB reclaim,
regardless of the CHN bit state. This restores correct behavior
especially for transfers that require ZLPs or end on non-CHN TRBs.

Fixes: 61440628a4ff ("usb: dwc3: gadget: Cleanup SG handling")
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 321361288935db4b773cd06235a16670a6adda1a..99fbd29d8f46d30df558ceb23d2afe7187b4244c 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3516,7 +3516,7 @@ static int dwc3_gadget_ep_reclaim_completed_trb(struct dwc3_ep *dep,
 	 * We're going to do that here to avoid problems of HW trying
 	 * to use bogus TRBs for transfers.
 	 */
-	if (chain && (trb->ctrl & DWC3_TRB_CTRL_HWO))
+	if (trb->ctrl & DWC3_TRB_CTRL_HWO)
 		trb->ctrl &= ~DWC3_TRB_CTRL_HWO;
 
 	/*

-- 
2.34.1


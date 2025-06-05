Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022132.outbound.protection.outlook.com [40.107.75.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A241A1F4C8E;
	Thu,  5 Jun 2025 07:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107393; cv=fail; b=V6jgmgpSfVE2pT63NyamiyVKHEZ7zcgTc/DDd/2H77R+1zwwiXx1a92GARS65jRvhrqabJ+fWRH05LbEKUlIBdmo0ujAbjCtL3HDmCVtJxrHZbUHr5AJ3u+XpQoX1Rj36VtvYspnrrHgXmzlXlHdZZJt8tSmdYeaggwKxsiIEbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107393; c=relaxed/simple;
	bh=j18rU/EAWnc0cwkL5AVyaRm6iw1s6u/ZcBnqyeWIX80=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=cjHn5gMWVqT8SUHHx5IqOFqPK/30ZlJoyc2pV4XIvdvn1b0KKcMwYWkLmq297gPa7P5wdIbzyeF1P113Noo1sMUGUhWGabgyyUnUGHw1ClPxqatNLckFKsWxFvPxs7T2F778hObGQpzK9BSh99m3evjbdD2RAr5mZcf0BnxsMbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=technexion.com; spf=pass smtp.mailfrom=technexion.com; dkim=pass (1024-bit key) header.d=technexion.onmicrosoft.com header.i=@technexion.onmicrosoft.com header.b=Lo1F4lLS; arc=fail smtp.client-ip=40.107.75.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=technexion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=technexion.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=technexion.onmicrosoft.com header.i=@technexion.onmicrosoft.com header.b="Lo1F4lLS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKKu72OCtFmmnwJQJvgHeF2Eb9Z3+859o2lFO7BQsOYJNCZJXGz/rBl9HW8pjdrRogIrrvYZ6QJt/GTX/xHwM4yfjr91M3nEOO68+ijclJZ88Cwj6aceO+cONstg5zaLG8LazdRkqHdjvFHBd0TxUDyz3vGPvhEYPK6dM2qXDYjDbFHRwIuWToiwTLF7bEelM5XtXyX2s2KvouZlxfa3/s6ij8ZcOOfiJ2Yo7f5I9BYIVjR8B2zl19O+C0tDYgZlLe0PLrKXstL4c6hb9cxaIeKP9cekpbbVcw8CaWv5E89gyc3RxQMJ8re2gN2YIA9Bo5t0lb9obt3irU8oLdZysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7R80tlAr1hBeVr2Fv3yzaBoKOFRbIfVkyEM2SOzciiw=;
 b=sXGZg4goU2Fx2czPOnNgSkw9/BB5OKIKO16xJMujGIDlSPAV/gqiitq4k5ATFfON9IIKPKWVwnHks242qghVhTnVcFIPBAJE15VbL8P8f37LN0QKbTC7Rg2H8lUmvjuBJCju4yQO3Zvi/Afs2YQssoNd5ZrtsAcfbgTCC/1Ml6p2LKxSRNYMcgjFmYaAvIXENSmbPNyyCgXhOW2rQg16jyAfNgPKaXrArX2WAXeENA8yr+Xpft6Yw6Vvkgig8OMgC0zi5nBMGOzoMokff+4iioTzcvdhWP1wWiyCl9n13F4jEtCg3+iaT7x8jU3XN1M42GZgR5LtebatEvN0+5duUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=technexion.com; dmarc=pass action=none
 header.from=technexion.com; dkim=pass header.d=technexion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=technexion.onmicrosoft.com; s=selector2-technexion-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7R80tlAr1hBeVr2Fv3yzaBoKOFRbIfVkyEM2SOzciiw=;
 b=Lo1F4lLSfCfwyD6GJJ2vImant4LxaYepOrUle2PbVH7MrM/aataKzoDFvNPMyQKgYrCtbrXV0JMoXlG4meOOuHvlFSFL0IXaSJq5w1M8VeQ5qTfDSbXKU3E+28lsCnS/7arRX5RP9mvrRPUhpcyLZ9Z3jdreNkcJkO1CgVMQQFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=technexion.com;
Received: from KL1PR03MB7454.apcprd03.prod.outlook.com (2603:1096:820:ed::7)
 by TYZPR03MB8034.apcprd03.prod.outlook.com (2603:1096:400:463::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 07:09:45 +0000
Received: from KL1PR03MB7454.apcprd03.prod.outlook.com
 ([fe80::980e:3c71:3a5b:6404]) by KL1PR03MB7454.apcprd03.prod.outlook.com
 ([fe80::980e:3c71:3a5b:6404%4]) with mapi id 15.20.8769.031; Thu, 5 Jun 2025
 07:09:45 +0000
From: Richard Hu <richard.hu@technexion.com>
Subject: [PATCH v2 0/2] Add TechNexion EDM-G-IMX8M-PLUS SOM and WB-EDM-G
 carrier board support
Date: Thu, 05 Jun 2025 15:09:40 +0800
Message-Id: <20250605-add-technexion-edm-g-imx8m-plus-som-v2-0-db5a7bbe3c84@technexion.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALRCQWgC/x2NzQqDMBAGX0X23A9C+mPtq5QeorvqQhMla0tAf
 PeGHgeGmZ1MsorRo9kpy1dNl1TBnxoa5pAmgXJl8s5f3c1dEJixyTAnKVWFcMQEjeUesb4/Bls
 i2i7w6Ppz10pPtbRmGbX8L8/XcfwAUd/JyXUAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Richard Hu <richard.hu@technexion.com>, 
 Ray Chang <ray.chang@technexion.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749107384; l=1618;
 i=richard.hu@technexion.com; s=20250604; h=from:subject:message-id;
 bh=j18rU/EAWnc0cwkL5AVyaRm6iw1s6u/ZcBnqyeWIX80=;
 b=s29Xkw1FmPS54x7TdvtNueBr0+jI9K1IxWGxcgiBMUrpR+s+UQsSVjq52Jf437L/xSzPJo3W2
 ApUS6F8jXIvCpxyb5sfMgjWSdFJkGKMB2VDmNmYLrCp1+zXVDW4oSlN
X-Developer-Key: i=richard.hu@technexion.com; a=ed25519;
 pk=MKoW0/U0r4MjJdRNaq37Tb25KE1fzJUdMN0pa8XBJSA=
X-ClientProxiedBy: TPYP295CA0017.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::9)
 To KL1PR03MB7454.apcprd03.prod.outlook.com (2603:1096:820:ed::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7454:EE_|TYZPR03MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa891a8-ea84-4c39-b60a-08dda3fff36f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UG1JUXV6UmFuS2JNTjNnRkhISXpXUWxQWUZxZzRHQ2xNZjV2TGxHa2pkZGpF?=
 =?utf-8?B?U3BPN1VINmhKWUtQV0tnUXhJTG9CS2FNR2x1aldHd0lHdGFDeGpEVnFOUWdZ?=
 =?utf-8?B?Y05zK21VOVVnSVRsSmNkanVKekxaU21heXB3UFZJQnlJWG95RG1lbzZIK2lQ?=
 =?utf-8?B?b0ZrZ2JyWW9melRrTUZWZXNtazFlblliYmI4aGJhanNBSHMwZ3NRbXlhYlZJ?=
 =?utf-8?B?aHVMQVFTdkZaQ3BNcE5JTGN2U3NKM1VUR2tYTFJUM2NHTlNCODZxY1NlMUNJ?=
 =?utf-8?B?aVlpc1VNUGhHZkduc0tsV04rU2JlaTNkTzk3NStqTEFvbmViWGZQcm1TMUMy?=
 =?utf-8?B?SUdkcVU3c1FQTzllTWNNRjIvL0V3YkZZcWlPTjdIN3Y5cnA0V2FLV0tVdlE4?=
 =?utf-8?B?Vkt1L2NhZ1c0SUorSXNSbjRqTS9JdTZNUmkrNmpsTTY4bEg5YmhRcVNxcWZB?=
 =?utf-8?B?b25zNk1kUU5zcnIzbWZqNE51bGJ5U01zYXVGYW9rcFJJUGhWVTFSTms5U0pV?=
 =?utf-8?B?Ti9ac3Y0Znp3V1BRSWx5c3V0RzR4SGgzMHdoN2N4OXhGSVhOaUZmMkJVdG1E?=
 =?utf-8?B?THpTa0ZnMDZBekZhNGhqakZURk1GN1cwYjU5UndmNGV3ZkVxUjc3My8rMW50?=
 =?utf-8?B?bWZ0WFpKRXJlNkhRRnFUK0pYbVBvc2hnN2pHQkdoZlB0NjVNYWtPTHVJRzhR?=
 =?utf-8?B?VGFJUExPUm5OMWJyVXlyOUVmakQ2SHYrQk4rT3RZbmtqY2UzKy91ZzAzL2ZB?=
 =?utf-8?B?cWF5NTQzVWpQUndqMVlPYjQrdGFUbS9IbEFMcG80c0lKbVBRYXNtdWt2a3ky?=
 =?utf-8?B?Z2xEdFN6SmJSMmF5ZmhUVEZWRFRLaFZ2cWQ3M1RDSTlITE41YTh5d2pGdk1N?=
 =?utf-8?B?Mnh2eWxvVGRZd0Z0OVVWYU5LY05odVRHcUpnVTMrRkMvRkQ2d1VmdFpFWUg5?=
 =?utf-8?B?aWpwdFlMK2R6aGovbHNYYWdWVkExdVdra2ZzM3I5R2JrZlppdG5BQ3BRSVJy?=
 =?utf-8?B?Zmw3eUJVSk93MkNiZTNQaGg5QS9YWTkwZDJGVTFJMDFiUTJrUkRsM0R4QTZj?=
 =?utf-8?B?RmJGS2FKMFdNT3BzZTFjemdrYkM0Q0E4R0RCVW45SDQ4M21tV0ZuSitsRXBB?=
 =?utf-8?B?Wk1UYUhjaGRYZlNIdldLQTJpTHh4QUFvdU1zQWpsdG96RmJKTUJobGdrSmc0?=
 =?utf-8?B?bGpMd2taRGsyWG9wSnR0d1FFZ0FxOFJzcEpob01meVB1bU9rTmI5ZWtqSUVS?=
 =?utf-8?B?V3I2YWE2c0hZeWpDcHpzbHVVeHByc2VLUEdvRzRUZTBkdElaM0YxRE9NZGpL?=
 =?utf-8?B?MDBiY1JReUthTURKRTVCOVpEY012MXlPWHJXYVA0UWdEY1FKMm5tVmpLUXdN?=
 =?utf-8?B?LzNHRUZBTXJpRVJ0NFpaVmV5c2VhWWRsNnhqcWpwZDFBdUkzN2ozVUZ0VnQ2?=
 =?utf-8?B?V3B1Z2NDbzJtb0cxcnlIdUthdVNYTHRuQkFDSnVRdWtVM2lZQStqRXRQSERP?=
 =?utf-8?B?UnNSUnZLb2xtdFNHWkNJTmpOSzlST3ZyenNobDFLUTFQdE9RM0Y1QnVPZEMx?=
 =?utf-8?B?Y1RVZHFkZGpienVSRjZyeWErTTZDRmpHT3NTZE1EeVJ5WldtbXRCcjFYSTZh?=
 =?utf-8?B?QTJUTzlXamJGcll3RGVtSWN5Vldzbk53c21BdloydzhVYzBPc3BBVG9UeEUz?=
 =?utf-8?B?NXNBS0RPeklRU1plaU0va2NDdDJXQUlZVzd4d1k2RmRZdFhNNXZMazBVNnVL?=
 =?utf-8?B?VW80WEh2cmw2dU9kZDlvN3VaZzRPN3BRSFUxT3dBaFVkWVltYW5GZ3hOQmRx?=
 =?utf-8?B?N2IwUnJHRFhTSjlQdEIrdkZrdENxUkdHV3VuQU9xdTRhUjFUUDRDbGY2Ui9r?=
 =?utf-8?B?bHdTWGVJMjdvWkFBMkVscVdxMEVCaFE4ci9jdEZkMnRwSlR2RHpPNVE0RW9G?=
 =?utf-8?B?WWJKcU8zRDRxc2gvYUtWOG5XK2hUOWgzKzJFYXFPS1RVaUFnQVFqVkFwaUhv?=
 =?utf-8?B?eFU4V0swNC9RPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7454.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aytUNEszbUFpd1F5TUpzUlh2Wmo0VFJlOVZEaFBBUitZOU1JVXlUNmlXR2Ex?=
 =?utf-8?B?K2RwRnlVaVlGZVlEeWkxMU1sY25ybkF1L0poc2ZZalptNUpIMXlHWFIySEk4?=
 =?utf-8?B?S1FUSnludmNhcFcrYUNZYzlSU1F4TmFtVWMrcWo4UmpJcFFHZGwxeFRFTks3?=
 =?utf-8?B?UVYvcWFNelJHQiszTlE0SnR6TjFsdEVPaGFpSzI2alNsMUl5VDN0R0s5bEdx?=
 =?utf-8?B?SmJJeGhES1hjYkw3cW9laTNpNzF0OGFrMW8yMzBWanN5V3JySkltT1drUGU0?=
 =?utf-8?B?aXhuMEpTaTVlUW9FQmJteDZJYUVINHQyb1FUOHhTM0k5dVNwUHR3aE5iNWlv?=
 =?utf-8?B?UFN3S1NubTJQQ09OUitORmNxcitvbVhQZGpBMjZjTFJQdWwrWkMycTVNeU1T?=
 =?utf-8?B?L1RHTVJwRVNXc2NTY2svUFRvZGdmRXhGbHh3M2lKMWNFckdvWkVBa2lsZWRT?=
 =?utf-8?B?T0dKOFRvWXp6dktNUUxWNHZNU2FWWGluOE54M0VhNmJuNzRSViswRnMxOGtq?=
 =?utf-8?B?bU51WFdjcVJHYzRtdkg0aitMVXZwaHlGTExWSlc5b05PUHpEZlBjN1JsbGhU?=
 =?utf-8?B?UXVMdUxOQjdSMnhUSVc2eERsMHN3QUlTNXVpSnlYY0ovR2tqczN5ZXhhT1lC?=
 =?utf-8?B?N1EwdWxtc3haYTRtVFFhMkY0WG1xNzRCKzFYMktoZ1dhZW5yQ1o3RTBIeDBR?=
 =?utf-8?B?STJTNEYxd0hJMmExckJ5Q1h0RjhkVE9KSFJ6RkFRYkswWGI3dmtTVVVKdUhs?=
 =?utf-8?B?V2hSNjFaRTNiZ00zajVQNThySTNwMWRLK1MrNUNnaUFnVzNSTjY0WW9tWjVW?=
 =?utf-8?B?b3lEc1VPczk2ZFM0MGFkZlUwWUdKUy9tcnd5L0h0Zm00OUNLV1RRNVJDd1ZI?=
 =?utf-8?B?bTJvdGIrWUlKemtMMVJDVHB4ODloZk52N1ZtMEZ6SGlKVms0WTh0ODRtNkpa?=
 =?utf-8?B?cEFCeG04SklOZ0NyNDhTQ20wek8yaldqZ0g2d1pDa0NUS1F6T0dKeVFqZ1Nv?=
 =?utf-8?B?YXJZWnRxYldJclZzcS83ak9xQUlMTzg0R2tVeW9YSTFESEh6bTBqWllnUDhw?=
 =?utf-8?B?L2ZCOERoWDBlUVZscUFrSnN1K2UxZnBMcUowWGdsUW1iYzhpQkpQbXh1RTBM?=
 =?utf-8?B?bE03QkFkNVFiV1FST3FRWGs0U0VVRkFONjhMY3lPYWo2Wkl0K3JTRU51ajJM?=
 =?utf-8?B?TjBvVzhwS04wSVprbXhpdWZQWllFUW1Bd20zRTZmdEFBUUdSa2hObVp3R3dy?=
 =?utf-8?B?N3Y0SzdIZEEzWlNxV05nNmFlWml5T3lybVhFZ3A1eEZ6ZXlXcHFaY0g0K0JE?=
 =?utf-8?B?MlNYVHdJRjFKUUxVU3hPTmpvSXdvek81cWFiRmFzZGFaUG1xZ00rTnJRUEJ2?=
 =?utf-8?B?aHZPbjF2ZE43MTFGeEgxek9OQmdlWlJVWmlGV0NGT3RPR1ZmSTd4TmM5Q0c1?=
 =?utf-8?B?SHpiUFNYVnNQRnZQMEoyYkpsd3c4MFVLbC9xejg1NWhEbTFCKzlyQjRYREVD?=
 =?utf-8?B?K1d5NHU2K1N5OUpEWWxtUVhMem5BWFdydjdCRWdoWG9nb2R6Sk9URUwyRllu?=
 =?utf-8?B?ZVJCanFLdmFaRjFLbGVtU0RCNURiaVIwNjh0RzJuUUN3bFF0aUsrSFZpWVo4?=
 =?utf-8?B?Y3BFU05UZWhLa0xBQnZ1ais0Q3owWm5JVWE1L21tZWR4Ylh6SnJQNklEN2xT?=
 =?utf-8?B?ZjArMnRNTDJScER3NEJTZVoyeGc0Z3lESDVERzQ3SUpqazc0TUlkbFBKZWVB?=
 =?utf-8?B?cTRTOXhoQ0JuV3c0YzVkTDlwc0xheTdPbC9UbXhHNW1SYjllRTF4UG9jajU3?=
 =?utf-8?B?VWk2VVdaUllNYzhNdlVELzlHSlFNNFRKcUQvVmZXc0lzMnVuNnpXc1p6MlN0?=
 =?utf-8?B?WnJJK1VsNThNU3NtcnMzeFlPc25qZG9LVGFZbjNmTVc3NmtCZlVGRitlRGZh?=
 =?utf-8?B?elhtbFZWNnM5WUNzOFNCaVZQWkNVVEdJSklUY04vbUI2RlVwcTh6TTVTMlVY?=
 =?utf-8?B?aEJXbTByKzhmQTg5NFJqR2lsZWc4SmhrTU9ZRGZlTTFvaHQwL1JNUHhnd0tE?=
 =?utf-8?B?SVVSMTBSZ0hDSXdpZHhEUmZGV1ZtSFN6TnY0WW5SanUrZ0EzQjk1SEVxMHhS?=
 =?utf-8?B?VldjcStyejdOQkZBQjhPZlcwWkVQZnRCRnZWaVNBMzh2SHpxSUxxbldwMC9Y?=
 =?utf-8?B?WXc9PQ==?=
X-OriginatorOrg: technexion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa891a8-ea84-4c39-b60a-08dda3fff36f
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7454.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 07:09:45.4352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5ee19679-b9a6-4497-8ed2-1eda849e753b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrYXj2q7ZLUzWMUsEJmACepcAiEz5zjcAQLr6tSTOdFVSyO0aKfeQ+CFsTebqbdildeeIl1EJkLQs5IscutZtmXz6GG5nI7VmUk/91bKYFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8034

Add initial support for TechNexion EDM-G-IMX8M-PLUS SOM and WB-EDM-G 
carrier board.

Change in V2:
- Ensured accurate `To:` and `Cc:` addresses by utilizing 
  `b4 prep --auto-to-cc`. (Thanks to Krzysztof Kozlowski for the 
  tip on this command and helpful suggestion from Rob Herring)

in patch 1/2:
        - Add Acked-by tag

in patch 2/2: 
        - Generic Node Naming: Refactored device tree node names for I2C 
          GPIO expanders, the USB Type-C controller, and the PMIC to adhere
          to generic naming conventions (e.g., `gpio@21`, `usb-typec@67`, 
          `pmic@25`).
        
        - Removed Unused SPI Node: Eliminated the `spidev1` node due to an 
          incorrect and non-existent compatible string (`rohm,dh2228fv`).

        - Minor formatting improvements (e.g., whitespace, indentation).

Signed-off-by: Richard Hu <richard.hu@technexion.com>
---
Ray Chang (1):
      dt-bindings: arm: fsl: Add EDM-G-IMX8M-PLUS SOM and WB-EDM-G carrier board

Richard Hu (1):
      arm64: dts: imx8mp: Add TechNexion EDM-G-IMX8M-PLUS SOM on WB-EDM-G carrier board

 Documentation/devicetree/bindings/arm/fsl.yaml    |   7 +
 arch/arm64/boot/dts/freescale/Makefile            |   1 +
 arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts | 403 +++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi   | 839 ++++++++++++++++++++++
 4 files changed, 1250 insertions(+)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250604-add-technexion-edm-g-imx8m-plus-som-79adf0b397eb

Best regards,
-- 
Richard Hu <richard.hu@technexion.com>


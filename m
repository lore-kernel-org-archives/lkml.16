Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B9323CEF8
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 16:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748277188; cv=fail; b=aD1L4TafuP51qejxb29+Cbmf0y65ArBc5O2cO/8sOSd9BE7MYBj7bYaxYHHEunMe24ItgDd8vskkmU4dpGw/2/SHSZF2pZrdH2nrc/OrGU8dhqnrm+XBmggVQacZDah0/Fd708CytBaHf7GiSOxBImsVKlHJ1S6CmB7FwfNPo9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748277188; c=relaxed/simple;
	bh=hogq5E5qek2n+FNvHYGAE0qnwQerHqESkqi2JguJp8w=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ePv+gns/inEe8ETz1qSkHqB4LbjXTw2zyFNm5pbUlVq6UMuculceZoYGnu2yLk7TKBq5m67txIOkGV/uVphYS9KFdpG5ffWixyaklzQ+laebOLP6kB8PhLL/Tge+CWdVEnmiODbh2nu0GJHH7BcBPRxd2/rW0BSu6g/zT8zglYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jvb7oBJw; arc=fail smtp.client-ip=40.107.21.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jvb7oBJw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HgVro+0QdS1a5XKU332cFYJdwgfIleTEyB2JXJ5b1DQl8mT8TOt4hbL2S+2gNrDEYcz1CY5YSlqCdgs9tMmIxjz9i5yx/bAX/TUOu3SijuAO6DtcgbZEBrmu5eB3RTI/zr29gmtFG7xtgeXGByxv3EW5OeEDLPXUjjKMa08O6Ts1DaPBS+z0lNnsCR1lk38B5gNIJ7utpX8HjeWgCOYyfLRfyNo8vVW7RD6Qr2KVBGdE4NBWFD7rHyIQmICsEWqRLTU58FfH7AjQf5VOUxokKC7G5I7dehZWo+Roc2MES3k3Z7a0eajju/g2iXULtNIFbph2ff/bCyM0wyGSbu6vcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTGM0GNVeqUiQOx6Fe48ANf2kL/Lp6OmpwkYaq3SeoA=;
 b=CXDi+VdpJ6He4VxvGHETBZFBt6iUKqfFJqWTWAF0HTTSqGqgebFJrb7Aara8vV7EoMSvx6xsyfsKE9n6SQTPE7GLCz2DGVkk7cujh4M3vpVKjd4jmK3BtZDmX0gPUCuWO/9ZP6oGmkp9nF1MCjTnabEJGdkw5OOvfv34CjkYJeSWi+EZC+HvjOhiyOOUzyz2w2SwRHFGz8vEkcnB32sWXlZMcHuvgLx6mIuycG7pj9SfIjDilyZ/At6jF11YI7f4xiGRQNWmuyAvlN6UZ8R5vQ9Xrj32U0Ock0ekJ86GcfCTFK+FmsXrAOcE5Q9kKlldyRvDefdnk1HwqSslT5RdnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTGM0GNVeqUiQOx6Fe48ANf2kL/Lp6OmpwkYaq3SeoA=;
 b=jvb7oBJwQOPBb9HmMRFPqFmxQ8MdqsHsl99R69hkAWidfxJYWi51aYRMHT++v2FiK4LfEfNDaiSKnChg7g/Y8dYyJFa9I4w2E236NvFpV/WCIz9wZYITQdIuiNboI+dnRXk73b0cp6ME+XkQxsr+Cw/GfURtrm6F7YFskPBm/IUrvlCZ43m/MQgkWi6QNAeH3xCdhge+ndo6rdI031YTt3CCJ5LxE5+ouTD4xPcCGrGnbRgtgzpSEHjLWxiEMQO4degEO2IH3p3kkTYNdrJvq0WJoEa8DS+2spHxCq37rPNrZ7KYtOSqcUdZmuPV90zzypscfU1TImiEWGdyKkJkZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB8473.eurprd04.prod.outlook.com (2603:10a6:102:1dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 26 May
 2025 16:33:02 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 16:33:02 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH] MAINTAINERS: add NXP S32G RTC driver
Date: Mon, 26 May 2025 19:32:59 +0300
Message-ID: <20250526163259.2470550-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0065.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::10) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: 9161720f-ed55-4d1f-6f8d-08dd9c72fbaf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0tvSHViUklJcWlXRkpsN1krdi9YdEVHZCthaHNxUmNNL2h1V3QzcFVqT2tu?=
 =?utf-8?B?WXFYZ25nWWFtb0s4c2QycTYxMVNBTXl4SXlxUVUyeXYyRVl2ai84dTNKb0N0?=
 =?utf-8?B?UUgyR041dFNQTHlhckFLaFUvOC9QTVJTQm0yanRNak9yRHNvY1JLRWx6WFd3?=
 =?utf-8?B?c0NPQzRnTjc5RzFnbG5FQ1FaOWMyRVV3cFlGelEySndPVkhUZzc4djViNmFi?=
 =?utf-8?B?ZjRoU0Q1UVJNUGNkdlFwMDJCcFdQdzJmSDJFUnRSaVRYa0N2T1h2TU1JcDhZ?=
 =?utf-8?B?S3FvL296a3l1QjRaT2NlNytVTkRYOFVUZFdwTlJpbCtXc3dkbUdpelFaeU0z?=
 =?utf-8?B?eWJWNFJRNFhGaHdhcEZyMzlwbElWUlpRWllSWWk0UjVIams3VWw2UkFKUnpQ?=
 =?utf-8?B?cXlsSlVaR3ZWUWJoS2FnelRPblVtTkJyNzIrcGVwRjZvSEJmRXhiYzE3Z1dU?=
 =?utf-8?B?b3ZKdVNOemtKQ0ErWlMyMHM3TDdKNlkyOUlVVEJYUldiZm5Uc3RYZGlidFlO?=
 =?utf-8?B?RXpzRWI3S3BxY1J1ZjAvdjkzWG1yRzRCUGpKTjk2Um5yUStwY3UwY0lyNE16?=
 =?utf-8?B?VXhndVUxeGc2bWRSQzl0MmhVVWdwOXF4bEhEd25iZC9VaFpMT2tXUjRubWRj?=
 =?utf-8?B?TmVSbytsblc4dkF2a281aDhmK0ZDNitGamdCUjJ2S0NOUWNUOGRZTm1nVDFK?=
 =?utf-8?B?Y2JsZTlPdE1LOS9rR25laVE4NzROb1FlVjlnQjlZbTVXemZNR1luZ1UrcUZi?=
 =?utf-8?B?dHdyZlRPWGd3WlZHbk1SS0FZeUJXM3RQbkF1WWxiMzczV2orS0wrY3NnZHZj?=
 =?utf-8?B?WDdLd1BqcmZvenBid1pXUmVrcDRiL2hEMENIL0k4ZmJ4L3BoYkozUlJUdGNG?=
 =?utf-8?B?ejN4OEFyVUNTb3M1TGYwN0RyN2ViTERhSU00ckd6U013U0tTTFZKZXNWSW5h?=
 =?utf-8?B?d01ncDMxazRWT3lIcWlSTDNhalFzMHhQc3ducHZPcjJPeDhxU1drZXF0YU0w?=
 =?utf-8?B?NFhKaVpZZitlSmF3SVlJdkRLYThSNnhLL0pYaHZCWUp2YkhVVU5QdWUwOWx4?=
 =?utf-8?B?eUNwbXJFT0xvSUFpbG1XS1A4VC9LQnJ4Z2hrbFVjbkJwamNVMnRENTZNYzFQ?=
 =?utf-8?B?ZVA0eWlSWFhyaGdzVnFDbnR5RVJ3Y3JUT2FrYi9QNU9DVFdWZTRQVVV0RGFw?=
 =?utf-8?B?YUFyN1RQOWFPVHVxMU1RaGN6dGE5WVdsWElwR29zbFBOMXQ3RnZXKzhQRGpk?=
 =?utf-8?B?dnRsbVZmRUZqd2ZNN3k3SEd0RVEyV0NJd1dORDdIa0x6eXJ5NkYzaGpUSEZa?=
 =?utf-8?B?QmxnZHVCSGppaENMUWpnT0UrbU9xeUk2YnQrTzNJVVJKMjdxZEh6V1pEZG5n?=
 =?utf-8?B?S1RQZUtGcitrd290cjFDbUE5M2czRFJUak5Rd1FKNTk0eHk0Nlg4TkNUUkhx?=
 =?utf-8?B?ckpaSSs2MmlQRkZCM2FSV1JrNzVxMzZ2cTBkSnl0OXZaT1F4dk9MMG5jNHVN?=
 =?utf-8?B?RmNBd3FrazVtVTBKQ3ZvWFhSb2R2RGhhQkFWM2taSjVGOEZWRGkvVzJXS0l3?=
 =?utf-8?B?RDBDYytSeGkvbndINkRraHVQK08wdUdVT3hKd2Rvcm9iMWdsdGowSXdLNEly?=
 =?utf-8?B?RTg4b0RNTUZqOFRvaDlNZXlFdGc5NVpGd3RDSkYrYW9IaWt2cjNpcWVOc05I?=
 =?utf-8?B?L1NpZGx2NE9sMGhidStUSDE2dGMwRW14cW5kdHZvV29QYnJhUEdwVDVHRkNG?=
 =?utf-8?B?V2UvanNHcTlQTy9FSlVKZlJ6NC9oVFIzUWM4ZUFuLytmdFE3bVFTUUVqSFVi?=
 =?utf-8?B?Y0pQOVc1TEZtWVJDbFRYQmp5YU9aOE40TFNTMllKRHR2dTg5MDNBa0kvc0k4?=
 =?utf-8?B?ckhyMnI0ajBBYWhQVGR2OGsvYzRsVDJPS05yUVJBeTJ5Si94VHo5NVlwK1Zy?=
 =?utf-8?Q?UvLlgXLqrlA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW5IWGsvbG1iOHhicysrV2RCNktUWEdaS1MxSVh6UTl3dDRHV1RaWGt0Rkh1?=
 =?utf-8?B?cjRFSWEvT3dMcW1aTXpHcGRqZ1g0VEZORmx3QVc5bzdGeU5SWGI2TzM0aUNk?=
 =?utf-8?B?QXdMUllZajlwVHVhT3h6eTdTN3NCYllTM0x1N2RnU3dhaE8wb2RoamhrVnhv?=
 =?utf-8?B?NGtESUYzeVNiakpoU3Uzd3lXbEFjdCtsQkFiTU1lQ05JZHFCNEpRK0RmYldj?=
 =?utf-8?B?dkhQVmptcmlaZnNkWXpnenNjWnNMTTBKNnB1bVdYNjR2YTN1VUhwUVhtaHcw?=
 =?utf-8?B?Ky9XVkN1YWpsQjQwSjJqVytTdUJ2NE12L1VoR2g5VUhveDQwR0VMVmdLNDdS?=
 =?utf-8?B?UGc3YlBWUCt2WnpoSUV5T3VPZms0eE9QUnpTY2Z3OVoza2srQlJNL2VzWFRm?=
 =?utf-8?B?aGJiU3RTZjROMXlSQ05OWWlpdXB0NFk5VnpLRzY5VkIxblJ6a2ZLVHEyem4v?=
 =?utf-8?B?SEt5Vkc1N0JBVm04Ky9kYU91SEtENW1PVEpIOXd2RGtDOU1OZnB1a002MG5l?=
 =?utf-8?B?R3I2NW5KNStKaThhWCtPVytpajI3c0ZLVDZpRlBKQzZQVlo1d2hsL0Zka0h3?=
 =?utf-8?B?a1FnK1pRYkFQZyt5ZkxqV2YyUzFBZHk3bE5Da0xWZHFOLzFURWVsODRlZW1T?=
 =?utf-8?B?OElsNHUvZlBOVytrbkFiV3pLK0xUdzRaV0h3RmNnSGNYN2pZUGJlLzRtVHNP?=
 =?utf-8?B?UnRueHdKNldjZTYrR295NllkN3lPUUY1Y2liRURyRkNxS2w1anBiVGtrT3RF?=
 =?utf-8?B?V040ZFE1VGhVUjNnditIV2w3eEtrL3hMQTkxdkZ6MTdvVUJIN2k3eGU5b2Uy?=
 =?utf-8?B?RTVKdTB4WTh4MWwzRVIyNXgzNnpKSXRJNVhZL3B3cHNIRnJJb1FtMTdvdXZQ?=
 =?utf-8?B?S0ViRElieXpvaTNVTXpsVVltNGlxUG5OSUpPZjhnVVRGRTJmRnhTdWxWbUNv?=
 =?utf-8?B?ZmhNYzhlcXdwNmJZRVpqMWhmOXZHb1hEcFJNaXZBQmRsaENDMGFmTWpCM3JQ?=
 =?utf-8?B?ZHpJSVQrYVZaOFJvTnZuU3d4YVBSbEIzdlhabDVFbEZ3RWp5clAvZEZmQnl4?=
 =?utf-8?B?cnZBV0tRUXVsenRXMGhoQjlkS3RKcm4yMVE5eXNKN0ZGa3NDWG5GOGFOVTgz?=
 =?utf-8?B?ZnhYQnhSL0NISTFtYjQvUDFWc2JiMEo5M1BqZ2JPb0FUU1Bzbyt2alBCcXg4?=
 =?utf-8?B?RmpFTGwyZXZpU0ZqMDVIamhjaGVkQm4rOGZMbEhhNzV5c0FUV2NmeFlaMUlj?=
 =?utf-8?B?bEhNN1BVdnU2UGQxL3dtTVhzVTIxR0kwMnozVHl3WmdjQkdxZVN5NjNwdXl0?=
 =?utf-8?B?MW91aXV1TTdlWTg3WXRtS1hlRmhBd2pYN1d0VTlQc2g5WmV2c0RjdUlWSktV?=
 =?utf-8?B?Ym9jZXE1RjdPeUUxTGZCZnBTMzRuNmdMLzVaV3J6M1g0NXdtTjZ5am41MG5L?=
 =?utf-8?B?cE1lRnp1S2src2wya0piODNTMERKaURFTUZCdmFvTXAxdnJEb3cyWEdERTZ5?=
 =?utf-8?B?bkJIK1ZaUWwyL0N2NWxuY2tZTi8zM0NaK3Y3VHZOZ3dHWCtBQm5reU0yTm8r?=
 =?utf-8?B?VW5XOWhkZzZ1Znp3TmZwSXpaaU9hVi9tVk5KNEowZEJ5bUhxWVZnRzZWNEEw?=
 =?utf-8?B?SlZNOGQyZFEyNkR3aHYvT3dZVk80RFU5ME5NVlM5Y1VldFpmdWxpWVd0OHI4?=
 =?utf-8?B?TTlzMzFDZ1FRREJ6bStYbFdKbDQzTmRRM2k0VXNaTU1GeU1WaS9SZjhZK3Jn?=
 =?utf-8?B?clpwSjZuN05OZ0NXYWNMcnZabTBCR0ZQRjVNNndKVXltdXJpcVJGTFJyMU5H?=
 =?utf-8?B?ckxQOEdkNWwwOE5SYlRrZFZ2SVJzNHFhazcvT2ZQaTFmSkdZQXV3elY4N2Vy?=
 =?utf-8?B?djVSVGM2MUlhVitBOFJMRGhXemc0ZUhES01jY2xQMm9WR0FLSWJaOCtxcVgr?=
 =?utf-8?B?VVhUOGpxS1Nwc2dFc1BVMzZ4cG1jOGlXc0pmQXd5REMwUWJsUDJnZHRJMjg1?=
 =?utf-8?B?bHVBdUdiQkE0QXVlQUM5WmlyRXZNeTdUY0ZkenlGK0VjVjQ0WXJHc3lUTEtz?=
 =?utf-8?B?dnIxMGs1bkF1b1ZqWjBiaEd5Y21kWkRoKzhDT1BOSlo4cWw0dGE0TkozOGJ0?=
 =?utf-8?B?R0p3djB0dGN1MmhkaklvY1dBbjVJaXhMSGlzQjhvV0x0eEpkK0g1bk5MOEJS?=
 =?utf-8?B?OXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9161720f-ed55-4d1f-6f8d-08dd9c72fbaf
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 16:33:02.0760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5Mjv1R8AhYCzrcV6ZG57f8upt1znAMpIKS2Stn+g4PC+hhkR1LthNXcnTQ4pO5m1ZEeAgT05Uv61fFxnBunzdBIg4v/Pz3itHpYpat1Z0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8473

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add the NXP S32G RTC driver as maintained so further patches on this
driver can be reviewed under this architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e20de38ffa54..dd0c02846de7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3001,8 +3001,10 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 R:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
+F:	drivers/rtc/rtc-s32g.c
 
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
 M:	Jan Petrous <jan.petrous@oss.nxp.com>
-- 
2.45.2


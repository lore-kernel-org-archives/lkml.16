Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2083.outbound.protection.outlook.com [40.107.22.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07345189F43
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 16:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748277118; cv=fail; b=olcsIeVmKlHnYEesXDSLo4ZrJ96LSgP6IMYI3Zoc5c30EmwgJdG295gEG1BsLciIBD0NlvhQy/vGrgCWsc51EzzVh1xQ/bYfgnJnDLd2Tux/3tvipfRVvsYrXtWivhgipJcceW+vcOhHHpplrfx8mDFH8YSkrTuCNRwukGqP/Ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748277118; c=relaxed/simple;
	bh=TRm4tZoOnkh3qcWuvrNs8RJaFlYU8aRolH5kn0u+e9g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gZGjslbO20EfLNpOLRt7W6Qt0MRxoCYXA142jPCW+/FvcJsD2vphX7g5sqS9GLLBjFIW1ZRHx/ZZsJoGOYpDfn5/pWXUak+DTrcL7dd2MJa63i+gxNMRvFv4FeCUO11+YLWNI5tIyWtIwWsExGtL2R9z8asgTH8CsVv8InUyN6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lNmI0mx8; arc=fail smtp.client-ip=40.107.22.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lNmI0mx8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBDztS4UtRz+ToGoZn8jNfyPney7M6Rv2DD0WVlOR5c19trz4G8OsmgI/3NMnbF2BzdLsk5CB0YuMq0lCpkr/95wYxQwBrEIotv0KXkIjeoP7IRphIHb/RpffTmoAAKOtMRX1NnDLk3me25v4Di1BSiCwWQI9t7Qt0K+kRcxTYHY4T5TBVQqG2450e2Kn+Vu8stnRYcFmeDB2JdyfVLDNbEq2X3eF7va9FlHrTsB4H2tmM3BsDgA7zZIcy32UcklR+Xh8eRWDM2nkjXYzXKxgtN4yxgI9WjOgChZ/JFyGvtvHjYCb0ZAa93Ufdxb4zdZ6xqg3nd3aRsCaRq7uH+hVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FATCpZRJzqNgRUoytq7gYouuIwyRVtSkfBwYnPf14sA=;
 b=u1w+aWqeGqU+PuA3hvRyQ0W8gzrmcumGLcUk1CKwGfm+xbXSzZ2JHl+RZWiFncYG883KSAt/NtQZNbH6MfiGjHORALbCGIeRf6M1FqrM0xCLhekcSVQHdRB5EtrV0VAImCuq9ejX/JMlVZKpTGfLDm1p8wSdeJPOhcBAmYi0GKn34EElJ0N1yhd/1su8xCQxFPkgvmcZG/3JkQ7YN45g2upZIklJIyFWm0C+0pnqxihqy8vTwjAvr+KzkJM6L/esNx0OO2lV9EeCET3VqDZ6tDcTuABliVq/qgSeMUY2xPkQoYdqWhwbMPGjCZnkNY1AoSyTNRGaw6EyBPGqVQVxnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FATCpZRJzqNgRUoytq7gYouuIwyRVtSkfBwYnPf14sA=;
 b=lNmI0mx8fcrkDEU+z0MO/gsqBeVvRTWkNw4VeIN4EZmYzsvr+mivlp1fY+xl5GyhsmAr/M2f1HV32NfCNrlYH6kOoclqPprWG1ScUFaJ8NcoAD1JaFaxkNy/bxqaon6+xqwhbORMvSeCoNOKFTa6bkAXJlXTBq/rQ3uZm11th580tU4fULzP+8PN+1PKZM5U8i7m9vZ4O/b1gvi2UmlIpOqP5kXZDuUUd2UufUThDoQpd+DZKDBMldCDOoalI2CF3Omx6cU1kn4xuIsf0G5qY8qMaX7jTcYWBQImR8nLMuRDh0u+HkqeavwGoeN3Innu6jhW4yo+YBKdGRC+HBn5cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB8473.eurprd04.prod.outlook.com (2603:10a6:102:1dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 26 May
 2025 16:31:54 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 16:31:54 +0000
Message-ID: <60222775-0e54-4f5f-9412-b38d8b95500d@oss.nxp.com>
Date: Mon, 26 May 2025 19:31:34 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add NXP S32G RTC driver
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev
References: <20250526162954.2467894-1-ciprianmarian.costea@oss.nxp.com>
 <20250526162954.2467894-2-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20250526162954.2467894-2-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR06CA0140.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::45) To DU0PR04MB9251.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 1b04b7d7-201f-4acd-f55c-08dd9c72d320
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qk9ZUXFDMmJ3WWFoKzJxTldFa0dnSjJSSU1MS2lQYW1PMDV1Qzc5WEs2ZXg1?=
 =?utf-8?B?QWVBYjJQdmcrNkptTjdaYVhkM0tJeFBOUysvelA2Q0YyT0k1WCtvaXNEZk5u?=
 =?utf-8?B?N0F0TjJWcmV6VnBBNzM1ZGVXbzVTOWFTWHNUR2plT1ZiMUQ4OWtJZFp4Wk01?=
 =?utf-8?B?THBlcEFhb3NIaGZhUGR3TEx1UGx5czhIejN3OC81UjU3V3hUWFR4WWczcTRL?=
 =?utf-8?B?dXV2cERtSDVhSDZ2aWhRUTFDbmlyTyt1SVgzZ3diRE9iTGZHdlQvdDcrNmI2?=
 =?utf-8?B?NVBVVWNxK3ZMd2ZBNnIwbTVRQTJUZU0wempPYkRsTTB3eW1xMlREQXVMT0lt?=
 =?utf-8?B?Ti9Wa1VkZFFFYlJodFV1NkQrMGlwWXExSEFLVUY5RzJrbnpHbmJUb1hzV2Yw?=
 =?utf-8?B?SFd2SEJMd3ZmR04rSDdrMDlOMTZXT1F6WFBpNjEvQ1cwb1FRakQvdlBmZm9s?=
 =?utf-8?B?R2c0U3Q3RnRSa3BMV1ZqVTlsYUZudm92YkhPMHVTQU1tanByL09IZFFuUkdK?=
 =?utf-8?B?WnptQWo5VWtNajNYVWZwckVNUURSYWp3eCtiMnAzUWFYRWlZbTFubmpJMk05?=
 =?utf-8?B?VVhoSmxmMVl4M3pxNG00Zm5yczRuMDVKOHZGeVpkeG1oWmxJYW1kNWhhalNF?=
 =?utf-8?B?SWZhNS9qTVhDSURuOEVMTkhzRDJVb0E5UlJmaHMvbXk5YTJVZmYwNjJOeG5s?=
 =?utf-8?B?VmUzUnRFdWRGaTJYSTRKQ1lzRVM0ckVVS2Y2U2gwZG5DRTV1RCtuVEp4enYw?=
 =?utf-8?B?elI0eVY1eHpWVWcxMzUyNDFhd1dObnJjSHZuUkxFb0NmRXYzbitqMVdMai81?=
 =?utf-8?B?Y29ERDZrMzBOVndLNWM2aDdSZ0ZmYWlMeXlGUDZDcnVyVmRZMHgyc3V6eDNU?=
 =?utf-8?B?SUEyRWdqdUM4WGF0ai9FT3hzV2RxeFVHa3k2V1RRdkNOS2E0YTRmd2RpZnN2?=
 =?utf-8?B?SGhuL09RSXNlc3MrajNuV3NuY3JqTGV2Smc1OW40QlF2ZWVQd2xWMWRDMTBj?=
 =?utf-8?B?Mk1tb0twR3JVTFptT040MzMyUzZ6amlGaTNzR0JXWjdXdFhFeEU2eGI4a2tw?=
 =?utf-8?B?L3hHTnlQWFFLRDBSUm50dUNaU0FYc0F0bkdUcUVRQ1hTaldwaE5QOTQzd2JH?=
 =?utf-8?B?eFd3VExjWEVLQUZpd0Y2SEFLM1RXVnZkd2FuNis2ZlEvdUNWcnkzWWx2WW1k?=
 =?utf-8?B?WW9vcUJ4aXJmcFJwVjlDSHlqaVR0TDFXZ1p6SmtjdEdPa1kyZTJsNDlHQWhr?=
 =?utf-8?B?VHFXN2dPbGtob0gvSGtMY3J6THlYNGZ4QW5vUHV1ZEphMUJPOHliUytMVyt1?=
 =?utf-8?B?d3ZZV0VYSXY0b0d6WXF3Y1FERnFRT2JNT0pzS1JwSC8xSDhyNmxZS0NRek9x?=
 =?utf-8?B?M2poRHdlUmdNZXJvRkNQOEFRa3JkemhwY3VDVlpjRmxmUWVvdWVOSGljRDBC?=
 =?utf-8?B?bXNRQ2pNZklxTnhabXducjBKMVhhZnVBQTdlQmJBL05JUU5EZEI1UExibUJR?=
 =?utf-8?B?NnFwS0NiSGdOc2xObm9VOHB5Qm9VQURERUIzV29GNmE5bVFiOHE0WGhDM2tP?=
 =?utf-8?B?VTFGNGNld1dCTi9vRDdHR1A1dno2TGQ0bVFabEZNUmtiYUxEUDFSZFRMODFn?=
 =?utf-8?B?amE4OUM3eXg1TFVqVEpaNzdUcUhSczVyVGRnNFAzOVJiUVlIbUM2R2V1ajRT?=
 =?utf-8?B?bmZHbXYxamx5dlFCYzZkUHZXQTZSUUR6OVAvaTJwQ2xsTk51Yjd0eit0bnU2?=
 =?utf-8?B?bUlqNThYb3F3L28zcmdEUVU0N1NrNnVuVmQ2OUJTTjhrOVllS1d4OXd5NnlL?=
 =?utf-8?B?ZjVrRkN4MEs3RTVsZGVZSzRzamNxaGJIRElwbFhPa2gvaGh4aXNzSUUvWU5H?=
 =?utf-8?B?TTdrRkZ0cjlnc2VVeHZ4cDJRZzdYaWZVTWdXa1MvcjU3ZExxTUhhMTlJMTM3?=
 =?utf-8?Q?MLf2OjGKPeY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkRvclZTczJWdnRmQUpnMERhMUZXRkNtQWJZRXBLTTZkQmJpSytOU0F0eVNE?=
 =?utf-8?B?cTQ2QWoxcEdQelJUbUoyMTllYTlsdGZwZk92U2tEMzVlOXNEOUxWL0ZUWGo0?=
 =?utf-8?B?U1dOVTVHYys1RDh5ZXF0OWluRk9GbnkwaUtwTkFPUHQzRFI3VHptUm14K0lp?=
 =?utf-8?B?YTBCL1hNZ1paRkFsMUNJSWZKb01hbkpMV3Z1cE1lbjZTVjhZYnRwREJLUHJi?=
 =?utf-8?B?QmNLUW1kaUlVK3FPdmpFME53U1gxZnQwakhJUW5WUVVzYXNGdW5BdTVvc01s?=
 =?utf-8?B?SEhIMW5QR1p3eDhpL20zQmZkc3krbzZsY21IYTJwRHBVMlZ6S2JHUk9GSCs3?=
 =?utf-8?B?MWs1RHZvekNJVGp3NWxtbFJobUFpc0RqTndqYjBuWjQ3dlIyVCtLSU9uRk5o?=
 =?utf-8?B?M2Mzc2g5WEYvQytpVUU0aGhHYzBYRlh4L204MkFYYVRmUVJmQWZoQXZBNDl4?=
 =?utf-8?B?SXlNSmFNNFdtNXNySXhzZ3Vab3JSYVRyR3dMbWNvNnFtbmxHWHJTMzV5TGps?=
 =?utf-8?B?QVVhVW9Xblc3ZUtkcDl0V1AxRVNzc1BKSDRMYWZGU2dOSUE0bU5BMEpsVkRX?=
 =?utf-8?B?NGJFS3JhNjZVeCtYeTZwNTRBejhuWTdsYzVlcnhWdTNtZ2t5OE5ZYmJYY3V2?=
 =?utf-8?B?T21QTFhZU2NIZFY1Tms1NnR4T2J3UkNiWEdrMVAxNW1acU9sVEhabzUxL3lH?=
 =?utf-8?B?UEhodkZTZzJINmtYQWU1WktjTHhXTWNjdEhxVmJBeHdSNnZ2aytmd2tCNDhl?=
 =?utf-8?B?eGxRZUVTOTkwWGRnT1BjUjYveU9xcHQrQU9UNmhzRitjT0VUMzlhNEJPRGRI?=
 =?utf-8?B?MTl4aG5sUzBNZHdGQTgxdmY4U1FGUVNCeDdGRHdJSFdISXplUFIrNk9La2E2?=
 =?utf-8?B?K1Iyazh6RjVGY3pGYVNEdzB1cHRXOFJMV1M2TURrcW90WklxY3VEYWhIMDVK?=
 =?utf-8?B?aXZGaUVVUWh4VWt1eDFlbUVDTXV4YUZneWhwSkt6N2NlN3JDTE5QMFptR3Z4?=
 =?utf-8?B?N1liZjd4UmpNNllXSWw4OTBpbXJTdU1IenoraVVXMmNMWC9jZzVyb21xUkpE?=
 =?utf-8?B?SkhXOUdIeGZGLzY3R29pNlBIYU14UjY0dTR0QmVicm94eEt0dWhIS0JCWXpY?=
 =?utf-8?B?NDBwWjhScHNFeXd2TjlVZFdHWmU2WlV4c0tYOURSUFNmcWtMNy9lem9GUmVD?=
 =?utf-8?B?cmM3Yy8xQ3RWZWY5UFY3MEEyS290NzU3WnVqdHFaWXhIbVVmNHdqT0VHWTZP?=
 =?utf-8?B?S2dOMW9ldU9GaFlyUXpCc2NlOW9QMmN5T01oSkpjZmhRdEl3T094QW9pM2NL?=
 =?utf-8?B?RWp5Tkc2RmlFNlZQNzRyYVZSOWNpclFyb3dRM3JiU0dsY28rZnQzZTJEQ2Ur?=
 =?utf-8?B?YStpcHd2TmpGdXU5MW81MU1PczJzKytkT3dDTWVzak0rR1dnUUlrZGRRWUFY?=
 =?utf-8?B?TU82Z3JkT0kwdndjUGlYTStJNURYQ3VHSGNjZGpkREt6a0NaWkh5TlNzYWlp?=
 =?utf-8?B?OEJZbHFRLzR6SmtCbUIzS2htLyt5Qmtvb2tSTjluRE8wT3R0QmNTdW5zaWY0?=
 =?utf-8?B?WUYzcUNCY1J2MVh2MW9vQU5mSHJ1eldGSURFdmMxbFkrTXNTWmhPclNsV2xT?=
 =?utf-8?B?aFRTZlV0dXhpV3BWRFZIMXhqaUUzRXBwWmlvQ2RGQ1kwM2dJS093UTQ4cVAz?=
 =?utf-8?B?NlowdjBtYnh1blFmYW9PSHhlVG1yTTMxL3dZMG9EUnFXS2FHNTVIR0hjaWlN?=
 =?utf-8?B?L0VxM290ZmxxcldkamM3cE84YXRvaUtCeEVYcVk2WGFxcWZNd2RnQm1YelRW?=
 =?utf-8?B?QTNjUVJpUEtkKzJQdlVMb2xvMnltT1NUcGg4Z213bWtGenhxczFyeXB3RDFv?=
 =?utf-8?B?ZlE5S0NGcjhwV1BPVDN0aGJQY2pGWnU5ajRkL24rOVJzVVJhQU5EV0pXQTBv?=
 =?utf-8?B?ajBUUXpEeTgvNXVOOFZERzNqcEN3VVRxU2JHRUcvUGFSMVV0eVNaRnUrUXZz?=
 =?utf-8?B?ZWpUTEVLeERSVnMrcHFuR1VvQnJkdU9TM2tJYzVPeWdnRzQyVVBLRWJNMWRq?=
 =?utf-8?B?Y25TZlJIRVA4clpjS09wK1FLZVoyRnFnaDRuTEhHR3ZKWnFNc0FXNDYxeE5u?=
 =?utf-8?B?d0RITWxQWTRWQVZmNUJjV3NpOVVnbkovaElCZHE3Uk96L29ZTU4xNWN3VGVu?=
 =?utf-8?B?Z0E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b04b7d7-201f-4acd-f55c-08dd9c72d320
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 16:31:54.0039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2PELOmkKxV6eLt5uWlUfroMc2fAg8SmQPj5cvizizODCy8Z+toiF1PuQTHQrAYS9IUX26+bfD/DRdfw0P9VdMo2MdRZ9ybRnIX5n17mj6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8473

On 5/26/2025 7:29 PM, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add the NXP S32G RTC driver as maintained so further patches on this
> driver can be reviewed under this architecture.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e20de38ffa54..dd0c02846de7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3001,8 +3001,10 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>   R:	NXP S32 Linux Team <s32@nxp.com>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained
> +F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>   F:	arch/arm64/boot/dts/freescale/s32g*.dts*
>   F:	drivers/pinctrl/nxp/
> +F:	drivers/rtc/rtc-s32g.c
>   
>   ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
>   M:	Jan Petrous <jan.petrous@oss.nxp.com>

Wrong audience. Please ignore.

Regards,
Ciprian

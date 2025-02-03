Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FADA20B80A;
	Mon,  3 Feb 2025 16:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738601919; cv=fail; b=kySXynkSF5Ypm9UoNivaFX/RjUhb2N/jKofLgfvWDQuaZDDue9j4YJli5wKgyYjUPwt2iSSvXDCslgBYr9YafLygywtpER+MypS/g9X27JPFd2A9mJ3PevBsCxekTzWUN9WsKBgT9QQYvxiof68V6TYcwFLWikTIoffc9gtz7cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738601919; c=relaxed/simple;
	bh=mzEt7CnNA718YWvCchVN7Wq5dpu9WTFPZB5WZ+VHprU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JyEUUBR2YBG+kynCS7nLfjOIKzMX1j5NH3wMURfcWdpHN92MPGLUsA6gIX5fX7/gxbfIJJ9Z2nu/6hBsPWPqYdz1VDWxP39V6h5DeygCnZqKAFBb1LpSFQ3QyhGmvKY8zhRf3KdThh6p4twtqgAmgl5GCEiLYFxKDaVe4H/bG/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=N0bYm7ah; arc=fail smtp.client-ip=40.107.22.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="N0bYm7ah"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAwiCCWRe6z9VRfWV/Edr7y5mNvAXh880j02hXNWWT4LDQVu4qMWh7sHDb62f/adPVBiKTB8N2gaoZgiDWs/hRuxIJthUg9olirLw2mWjP5ZkQGGWcZMnruFTVxi6i6vCMW1il7Y3Lryn9DaW3AhZ/ySKlSxJZ+SRaZIccJkLmbmvc/lJWEHVpTitGYNjr2G4i35XMaT7iLWHdpkKscJvIiMfuMTbCOLds0GT0dQGYeZZpYgFJcRtrmR4R78aK2qDpOWMgEBqIXDdkhYS20niCUDCmwMBYuGe5kBZwrXiQS4vbjQDl6EVElCMRIUaQ96Mjy02uv1iX0bw8pj9CEVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2c+t0d34EWJhfottWnVOU8Wk9+gLKHW/nKMogTgNwg=;
 b=AIZ5Ut7HzZGKREUf8nUC2/CIQPqpjI/xW6T5Y9uzITgYSFPVmYzr0j1sluuyIExZBlN+5gEM1JRrt6UoYJOR9MeutmtcFwLTwH2/dd5XvuJ0sZiuNtXgfVTggzCCVDAADPwPsAn2Aw1DQSNFcHKnuoOBuYW5Rs1eAmXFChEm4+bIn0sA5P0V6yttHCmcGyHW435U1ewCZO/YrsyV8MEZdkI8IVs3lYwMqOO6MPmKU/RMkTiEbJtEXo3TNNqJXW9DPLQbhlOFdXW5eYmUPr6+sCi1jjD7lkl7Q5M/pa6I9m3JUHHJBgnuNM3gWA1y9YxTxFBSTmSjUs/H+wRkF/aRuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2c+t0d34EWJhfottWnVOU8Wk9+gLKHW/nKMogTgNwg=;
 b=N0bYm7ahEt0HGbLU3bjYfhnJcODxVB2NtwXYyWZgniJ07xAnYroDXVOq4yd3C4sH6EeVmS/9np1ZIgSmBVz+1svVbg7WAJntYFYxq4l6U8cnY+VGvVjtU6+7ZPQ6RNP3uebF2spgPo+Deg9nKCOZ6KGAYshFsHywYNXs8WQ/skQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8932.eurprd04.prod.outlook.com (2603:10a6:20b:42f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 16:58:33 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 16:58:33 +0000
Message-ID: <d464b1ab-e017-4893-bd46-c3cbd515a1e5@cherry.de>
Date: Mon, 3 Feb 2025 17:58:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: add overlay for tiger-haikou
 video-demo adapter
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dse@thaumatec.com, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20241127143719.660658-1-heiko@sntech.de>
 <20241127143719.660658-4-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241127143719.660658-4-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8932:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b9ca69-ccbe-42c3-2aa7-08dd4473fdad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUViQnlkYzN4M2NqVWRBTWVjMnFWZzlhN0t3SkkxcEdXTGRVV2NuQ1IxMnpv?=
 =?utf-8?B?aVZTQmE5WDVTKzdtQng2VWZtUlVFYVpocjBlR08rYTVPcjk1OVFlOEhMdnda?=
 =?utf-8?B?YVRQT2pMWFFZbXF4RGFDZVFlU2tEL0grckRnNmROaFdTbmo0azFNSUJuNVU2?=
 =?utf-8?B?UlVpNE9iU0V2bHMwMVJPVXJHTUl4WHd6SHpOT1JaNmR0NEthbkV3OGNPVEty?=
 =?utf-8?B?d2RXZkoyQ2pqSndqUHpEaHBlaUJJMnNkQWhKa2xleDNWVGlpTkdsWXN4UzE4?=
 =?utf-8?B?cnoyYUF0VnBGUTVOVE94MlpCdFA0TDVXUkFnNDRQRyt2c01lZmplVEthNldS?=
 =?utf-8?B?Z1dDeXI2RFBlbDZGb2t5dENRUXc1NThlQ2ZCa3k2QW5KZDJFRUlxTjQyVUFE?=
 =?utf-8?B?ekp1QVFUZnpvRlhJbGpSRStRMWJPRndEak9xa0oyd2x3M1djZy9laFVRdE96?=
 =?utf-8?B?OHFBSFlldEMvdmd4aGxSMUU3ZGdrQ2wrREZUZUlMZm0yY0Z4YnhpZVZzalFl?=
 =?utf-8?B?RHltWmpBeGtvUzBib2FPQ3N3aEROYkk4MHNyQ3ZYcjhESEhkWnp4RzBMZWNr?=
 =?utf-8?B?MWljZjBFOWJSR0ZJRnZIVVVoMkprcXA5bW9mWk0yZHg4WDBBN2FGamRyTFFQ?=
 =?utf-8?B?dS92YVluWGlxR0dWWFo5eFJjU3FnNm5IRWxINjVPMVBNaHVUN09lT1RKS1dh?=
 =?utf-8?B?UitXZE56Y2FPWEhCK3hmcWZ6cjc0OXU5SHFFYi9YMFZBd29pQjNHcWZTelRC?=
 =?utf-8?B?ZHY2MHViaStiNmFOaFNmQXMycFlHOURnWHZoZllOdEpsQlBCNjR2YWR6K055?=
 =?utf-8?B?bGlMRjZmVEZRYTJ0UGZ4djVvZnJFbldGSFJ4ckVZYTArN1BudVFjQXgvNjY1?=
 =?utf-8?B?R2U3anRpSXgwU1NXc21RVmRaTmRibzZSbHJHeTdBUUxrSk9PeE1ENzE2OXRs?=
 =?utf-8?B?MnJjcTFVdXpoajM3UFNrTDJaaCtkcW9ZK2x3eDFYb0lJVDFzUEpSUlBiRUxp?=
 =?utf-8?B?bWNxdWJrcFRUY2xRQ0NJM3pBUG8yV3BVanlTbVZaaElwaHFvbmhWYytsdDRw?=
 =?utf-8?B?WUszRUkrVUxBaW5TWGhQNFpITG1xOHlWM1VWSHlsK1dSQVJEL1hRL2piSC9N?=
 =?utf-8?B?UVZ4T0IzZmtHdUk2RU5CSERTN2NVeWJWM2w0Y2dXbGlYejhtQ1ZpRVhuNWc1?=
 =?utf-8?B?bVdFQmJ2K3AzQW00dVF0Qy83UVpCdFNQbmx6RzhrT1hncXhoNDZUeUlkODFr?=
 =?utf-8?B?L08vTnFSUnVTak53cVJNTnljQllTWmZTb0VqSzQxb1F3emlQd3JwcXM4dHk4?=
 =?utf-8?B?QzRqY1FFSlNRVXA5Z3N3OG5tSC9lbWczeXNwMFkyWldubE40cmFSSjczcll2?=
 =?utf-8?B?cXBRQ2hxNTB4L3U5WndDTllFcmt2WVZqdVJHVEg3L1VqbTB0UnBHZDhjNGc1?=
 =?utf-8?B?eGJGbk9TOUt2V2hzTnk2QWJzc2FYblZsN05KVXBZQmZuMmUyQk5vNEc3TENX?=
 =?utf-8?B?TnVwSmtzem54S3htQVoyVXd6NHlTSHUxTjBveVZUVEhaSVpHa2o3SnNPczFx?=
 =?utf-8?B?RnN2b3I3bnl4KzZRWUpxQ255MGJKRFQvTC91elVESEd3ZXhyL2hHd0ZLTTdk?=
 =?utf-8?B?TWlNNnlTMCtMemRISHlJQ29mVmJWV2cwNDBsSTFSYnp6NkZ3Ykk5b1VPUUVi?=
 =?utf-8?B?ZEc3NCtyU2dZNm1OTXFvQm1NME1zT2hkaGZxc3BxT1RTL2l2aU9wT2N6ME0y?=
 =?utf-8?B?WXVnS0tJRk9yb0FBSlBEWnhWUEwvRXhBRGs1TlV3cW5NOUxiNng5Lzlvdy9u?=
 =?utf-8?B?ekdDcmhhYkFIR3YzT29tUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUVrYVhQQjdWMXk2OFBxTi9OTlhGZGR0S0FlZWRiNWFzN0ZaSDNRdGlRRkZP?=
 =?utf-8?B?U3k4bi9waVRlK1NoOEdHNENaZ0Jwa0V2T1ZiTWpENVNwbDR2UkRaSW9XMnlJ?=
 =?utf-8?B?ZENzeDZGTDVyTVVOZXZhWHpPTy91RmQ3bjlGMU5Tazd4dG5OK1JxYzNTR1U1?=
 =?utf-8?B?aituNUYrVFJEYXdFdUZQZkh3MDdDY1UzMGlTR3RlNEkrVG9lcUNIZHVmQXBl?=
 =?utf-8?B?V0NRUEhwRU9EY3crNElvaFhPZW05TjZaR1VCbHl3ZTFwblBxUXBUVEkyd2tO?=
 =?utf-8?B?NlhHYlBCT2RGRTVaSW1xWUk5c2VMcDFGWTVtN0NkSG92WUY5VzdQenVXd3dD?=
 =?utf-8?B?c1NxUVRMdUR6MTkyTnRGbEd0dk4wYW5wdkhrbjM4S0dNaTRXSStKVWRmVi9Z?=
 =?utf-8?B?UWpMb2crdktWVmVBZHpGUWRlK2l2TkNncnAxRDhSSk1PcmVMWTBpc2pvRE0r?=
 =?utf-8?B?bWVSVVdva29waEIyTEw1NzZhRXBNK2xhZVlSTXQ1bWEvYTdVUXk0TXk5VjJ2?=
 =?utf-8?B?M2YxODFjL2I5WkliTGZtZW9pTk90UzhHa3lDQXlEQUhUdjZwNGxGYmVhT1No?=
 =?utf-8?B?RUFHYzZhVVVOcHNTQy9ENFFmTkhBNjFUcCtaNC9jNUdFRHhndUVSazBYWXkv?=
 =?utf-8?B?Y3h6d1MxTWFrSCtCc3g2c1hpK3NHTGpIR0d3TXhsaVlqdTU3c1c4bXR2ZWh0?=
 =?utf-8?B?T0N1aEp4ejJvRW5QL0Z3WG5JRW9uMUQwdSt0KzlhemlIeS9FU1dwaEdLcjFs?=
 =?utf-8?B?M2hUN3BCdWlYZWliTTE1TlpkVjgwZFJRZ3dNZTJ4eFVTVlBIWVpDTExuRFZn?=
 =?utf-8?B?VnJLWkF4QTA5UmVsZjUzM2tFb0NEZFdjMUFuWEFwNkNRU0ZIdm1WQVZhUHhH?=
 =?utf-8?B?SENuODFHRkFVMlg2VHNTMFd1L21oNlFxbnE0OHVERS9qN3FnSkZpTDFPa1ZV?=
 =?utf-8?B?clBMSEZjV0dTSVBSUVc1blBzU1dlOGdjbmZHdDdSaG1HWmFUcWZPcFFnMlU3?=
 =?utf-8?B?bzY1K1dsN1VLVjhmMW9pRXNROC9PRjE5WWZBZVM5akpOUHczVDVTeGoxMUJ4?=
 =?utf-8?B?dThMZFFncFNIaW9Oc1VuWW9YS0hoS3VjOXFQanZPOTJIT1l4ZWp1TDdacEw0?=
 =?utf-8?B?ZXVSdEswQ0ZIT1c5YWQybDhuZjYramJjRW1aSldhOFNHbzJyQVZFaklNZ3pk?=
 =?utf-8?B?M3g1TGpYWDdDV2VNQnRIa3NjRVJvQjZQc0w3REhYNE5Nd1R4akRiZk00RXRt?=
 =?utf-8?B?OENYU0pzcGJ5YW5FM1cvRUl5cVRvdkZKcE1LQkNQdnliUWZteTRSMERscUgz?=
 =?utf-8?B?ek5EcmJkYStZSytjSVEycHpRNksvZjREVmhqN3Q2NE9EaWs3dlVwcjY5NXgy?=
 =?utf-8?B?U0grdGZxZlJtbFZ4RXlKa0NBZUJqMi9ZanBraEpjZWtJQUtDOGl2aVlGMUpk?=
 =?utf-8?B?TjNHc2RQYThic0N0bFdxU2JEcUp2RlgyTit6ZjNqZjhRRVFNTXBwcEk5R3ky?=
 =?utf-8?B?RkNtWHh1RWNnd1F5dzhhMVVGcnp5bVVoeWhUOW5aQTQ5OGtDNU5wdmMvMVZr?=
 =?utf-8?B?Y21Zazg0bHIzMG83dzlieS9HeGwvTmcvMVNVZ0ZoOEtRZmFwalFrVG9zU09k?=
 =?utf-8?B?bFFxUmdqY0Q1ai9tS3N4Vi9BVUhjRGI4OTRRbHBLMjE1QnB3UGQ1VUFsd29t?=
 =?utf-8?B?UFlac0d3UVAvVEQrS1RKeVlJMjBYSUdDVUZEZGcycE1tY1N6N1dsb3AwSDhZ?=
 =?utf-8?B?Yzl2WlAvSkt0bUJuY0l0RGwyT1A2cDR5ZFkxcUUvME9TbWxXNXh5NGxmTHBs?=
 =?utf-8?B?dmI0a2s1ZTM0ZFE0RWREVGc0VVVvblJZVGRzM1VQcHpocjFoRk5IQ2hCNnZU?=
 =?utf-8?B?NGtnOG1LMFozWjdRM09jL2loZ3dBSzhMVE4rWWsyM0tZMXR3UUJXODAxK1gz?=
 =?utf-8?B?TkQxZ3BIVE9lbkE5ZUMzeVBLLytoSXd0WFR1d09yNHNES2FkUENmRHZtcjl4?=
 =?utf-8?B?cGJScVpOZlRVTlNueGgwVDBsN1hnS1BLejU0ZXpZeTFwRFdDTXZFMVIwanEr?=
 =?utf-8?B?VEt2VEhrWUZlalNrbGUvWHJaTlA1RjZhS1ZWV0pzWVZmV1UxTUlXSDVlUWVm?=
 =?utf-8?B?aXBtbVAzZ2F0WW43Nk9DTXZxVFNjZVRSZ0YybHgyRE5vdWdCZTNVMGl4akx3?=
 =?utf-8?B?eFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b9ca69-ccbe-42c3-2aa7-08dd4473fdad
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 16:58:33.0222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPDftfCCLZwv2OjXgurpK1PmBTrMM9dEekIge8b9wQW6lqbJL4gwkYD1qDhb1vCDsVi5L/y8DbRMcxw1Q5cbqI1x4ijDcf5mGRNPqeXLK4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8932

Hi Heiko,

On 11/27/24 3:37 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> This adds support for the video-demo-adapter DEVKIT ADDON CAM-TS-A01
> (https://embedded.cherry.de/product/development-kit/) for the Haikou
> devkit with Tiger RK3588 SoM.
> 
> The Video Demo adapter is an adapter connected to the fake PCIe slot
> labeled "Video Connector" on the Haikou devkit.
> 
> It's main feature is a Leadtek DSI-display with touchscreen and a camera
> (that is not supported yet). To drive these components a number of
> additional regulators are grouped on the adapter as well as a PCA9670
> gpio-expander to provide the needed additional gpio-lines.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Tested-by: Quentin Schulz <quentin.schulz@cherry.de>

See comments below.

> ---
>   arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>   .../rk3588-tiger-haikou-video-demo.dtso       | 144 ++++++++++++++++++
>   2 files changed, 145 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtso
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 3f888451a13e..a2404fcdc6fd 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -144,6 +144,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtbo
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou-video-demo.dtbo
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-toybrick-x0.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-turing-rk1.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-coolpi-4b.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtso
> new file mode 100644
> index 000000000000..a7fe18b81170
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtso
> @@ -0,0 +1,144 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2024 Cherry Embedded Solutions GmbH
> + *
> + * DEVKIT ADDON CAM-TS-A01
> + * https://embedded.cherry.de/product/development-kit/
> + *
> + * DT-overlay for the camera / DSI demo appliance for Haikou boards.
> + * In the flavour for use with a Tiger system-on-module.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +
> +&{/} {
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		power-supply = <&dc_12v>;
> +		pwms = <&pwm0 0 25000 0>;
> +	};
> +
> +	vcc1v8_video: regulator-vcc1v8-video {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc1v8-video";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc3v3_baseboard>;
> +	};
> +
> +	vcc2v8_video: regulator-vcc2v8-video {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc2v8-video";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&vcc3v3_baseboard>;
> +	};
> +

We have three additional regulators for the cameras, I think it'd make 
sense to define those as well even if there's no camera stack on RK3588 
for now?

> +	video-adapter-leds {
> +		compatible = "gpio-leds";
> +
> +		video-adapter-led {
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&pca9670 7 GPIO_ACTIVE_HIGH>;
> +			label = "video-adapter-led";
> +			linux,default-trigger = "none";
> +		};
> +	};
> +};
> +
> +&dsi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "leadtek,ltk050h3148w";
> +		reg = <0>;
> +		backlight = <&backlight>;
> +		iovcc-supply = <&vcc1v8_video>;
> +		reset-gpios = <&pca9670 0 GPIO_ACTIVE_LOW>;
> +		vci-supply = <&vcc2v8_video>;
> +
> +		port {
> +			mipi_panel_in: endpoint {
> +				remote-endpoint = <&dsi0_out_panel>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi0_in {
> +	dsi0_in_vp3: endpoint {
> +		remote-endpoint = <&vp3_out_dsi0>;
> +	};
> +};
> +
> +&dsi0_out {
> +	dsi0_out_panel: endpoint {
> +		remote-endpoint = <&mipi_panel_in>;
> +	};
> +};
> +
> +&i2c6 {
> +	/* OV5675, GT911, DW9714 are limited to 400KHz */
> +	clock-frequency = <400000>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	touchscreen@14 {
> +		compatible = "goodix,gt911";
> +		reg = <0x14>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <RK_PC3 IRQ_TYPE_LEVEL_LOW>;
> +		irq-gpios = <&gpio3 RK_PC3 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&touch_int>;
> +		pinctrl-names = "default";
> +		reset-gpios = <&pca9670 1 GPIO_ACTIVE_HIGH>;
> +		AVDD28-supply = <&vcc2v8_video>;
> +		VDDIO-supply = <&vcc3v3_baseboard>;
> +	};
> +
> +	pca9670: gpio@27 {
> +		compatible = "nxp,pca9670";
> +		reg = <0x27>;
> +		gpio-controller;
> +		#gpio-cells = <2>;

Our downstream has a pinctrl for that too.

C.f. 
https://git.theobroma-systems.com/tiger-linux.git/tree/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dts#n185 
and 
https://git.theobroma-systems.com/tiger-linux.git/tree/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dts#n259. 
I think this would be enough to guarantee the PCA9670 is not held in 
reset due to leftover debug sessions in the bootloader.

Can you please also rebase on top of 
https://lore.kernel.org/linux-rockchip/20250131-pre-ict-jaguar-v4-0-c971e2852e8d@cherry.de/T/#m7481695caf708c13edc662293d01fa372123532f 
where we add overlay application tests at build time?

Cheers,
Quentin

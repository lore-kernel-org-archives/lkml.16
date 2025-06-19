Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013068.outbound.protection.outlook.com [40.107.159.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE168219A8A;
	Thu, 19 Jun 2025 02:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750300087; cv=fail; b=i79ii3N5KOX5ZeSzM5CeYDmapfNEcOF+QeqCc8MREsCrbFS0jWUlFG+/qTLtvaizcIj20Vjn7q1FT3iTjsWsyV53Ywi4zETyd6fenNCZdRBKPDL/vZkTB8wxoCHrW7Ul6HcLVPSbgwDSHCL9Mr04c+xRx/CDlbT7MN3zgp2WyM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750300087; c=relaxed/simple;
	bh=Gq09MEH50cc5upgFlrIwzg8a6txhmQmktMg4z0tdcYc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hbcp4l6R0OMaR06koqh8C02IBxSoeZnlPCfi9z1U4dVdusdXpRNHQicX7+4lYnobf13KRPnsTNEJoL5NhvVM3GATu7jreZC/TwouCa+u+aD0etOzRblqzpRN0OMPj/rTLjhMQZuy6jGEYIknlbUYhwsBw8xLZExJ2rXr+FJITVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=I8GCwig4; arc=fail smtp.client-ip=40.107.159.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="I8GCwig4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJlYV2JzPtvoTi9SxefzuWzVuiGfdIpTj9Q4Y/NB2yzgmR0l6kvVFgWto+zVHtpVbOeATBrgE5jSYsW/XeHTYiU5o7N6wR3SpFjJqBcrM2MwoRAB0ebVPUuxbDBCuz+G0GgY5liNsSYc6qsiYhKGNKHTqpcADrJe+6LSuZzSVchdw7Mvi9eRpI6ZArTIgMgwXVrxPkX+SyOI4IDosv43aFsQuJVKUinTVVs3pKCMTac1AebDMs8nE0644wkiqOP7AqiCWjdlVqWC9PaqJ85rxv+lEs5od1HBtK7e07OjUh9ttglzX+Uw6Xtsm959aAS3Qu9tqVdpcZZZOm+subiEkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DX7r4SzqPb6t6yyFDRgsA43Auev66+SrIY9tsEJmuc=;
 b=cBBIJuee4uEWHyeALv3nAWyEH6mHCVzzD7Q/GSSbbl/36pUN4wgKuvtxH7MkjBEwHDDwYdC0+nGForxYdm7ZW+vvu2pR7svPBpKxO1PmZo2m1VizmSHLbkSNzX96vTWqb1SYczx+DITRF5ZrhLU+gsxjH+P0nBN4dpq8yQRrZmd5Ic5WAAIEoI/BiiZLbGvFW9qzaU8NoyOScEget7kmuzCNm2JpzA9l5Hdn15iG5c6rHa5Sj/fsRJdImnbOdnQH11l8euGa5iMCjd5Lm3NIHxQ0NVoPm5153Ti0a21LYE/zW9JJR2eVR40/LeqZBvcLNga6Gw79GQYa3htPeqgxYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DX7r4SzqPb6t6yyFDRgsA43Auev66+SrIY9tsEJmuc=;
 b=I8GCwig4liqASGsD6CZiLGuiAXmm8fC5QgoLNFfS7f1yQ+PNodtLU89XP18BR9t0Gf/bb8LJizHHF/D86DvREdT8ZFSRE4mWr/TPL0vx8mi5tiYcUdAld44O0YQ+bRPwypTv+Mtwsgr6Llq/4FH3EXph6m8kMfbPnY4fU5U7F15S6CT5+zvVhHcevkVFiNYLeE2wwHBYN9SYg7+FEI9cU1DsvhrmPGBVtlbary26RQ7SbkEE1SZDD6438/TMKrsSmey/eyaY7qc8k8hr4qmGh5jdSCXKC1nvCd6yPE2M19LgR5Xy9VGnRUwI0RGTfNCTdquMGd4TJ8299Qfa2i+kdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10830.eurprd04.prod.outlook.com (2603:10a6:800:260::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 19 Jun
 2025 02:28:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8857.016; Thu, 19 Jun 2025
 02:28:01 +0000
Message-ID: <77d62994-6f55-4421-a067-5dcb29ab7fa3@nxp.com>
Date: Thu, 19 Jun 2025 10:29:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: fsl,imx8qxp-csr: Remove binding
 documentation
To: Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, lee@kernel.org, gregkh@linuxfoundation.org
References: <20250618091314.2754169-1-victor.liu@nxp.com>
 <aFLukN0TW3AxkNn9@lizhi-Precision-Tower-5810>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <aFLukN0TW3AxkNn9@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:3:18::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10830:EE_
X-MS-Office365-Filtering-Correlation-Id: 731a8a3e-2a6a-402c-0f34-08ddaed8e92d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0V4emZyNnQxWDA0b2pISEFYNkNoczJVQkgxa0tMVC9xQVNQNFNZUzduenRZ?=
 =?utf-8?B?RnFhRTJ4cE85QktWK0d2WDJ3YlM5ejJWaGt1VkdBQUFoK0VsTTFxd0R5bERM?=
 =?utf-8?B?M3dUc2ZzaFpIRUdqK0NObjNCK0pHb2VRemFQTlJTYTZyTGlOU05BeG1DM2da?=
 =?utf-8?B?OFhHbUYwV1VtQVFETmhaeTRkWUpKOW9GdzdYVmE0NXRnWTFmQUcvNHlVZWt0?=
 =?utf-8?B?VVVzdGNqZDVjOWpsaUY0WnY2bmpkTEVxcXpoRmVYczZHVWZyY3Eydy9kTzl3?=
 =?utf-8?B?ZnVsVlFKWi9wZnE2RWxSSW5RbmFOenE0SVRJMkdXaWQ5TEM2SVZ6a3pDZy9P?=
 =?utf-8?B?QXJsS1ZkbEZiU3pncVNLK1FHdEd5U2EzMzBmVGZmSXVyVHBkYVZMb0ErMEdQ?=
 =?utf-8?B?aVdrMC9BVTEydjVxNURkblVBYkttb0FUZm9rZktNQkpmaU41bC9tUnprOC9J?=
 =?utf-8?B?R1l1OVRMR21iSkM0QTRrNXVRTFdiVlZzT1FLL1dJUytmYzJxUXlYb05OU0o4?=
 =?utf-8?B?dDF2b3FuOThKZTFVQ3lZclVPVzc0elhJVUJQcnNHUCt5ZTk2M05iNTZCQW5H?=
 =?utf-8?B?bVJlK0tLVWdiRm9DTXZSNVBtQ2lDRTBKVDJpd2xzRkp4TnpnUjl0bXdEYWlo?=
 =?utf-8?B?Y2xzSm1Lblhram9vbXNpOEFIb3NVd1hQV2dOdGlLZ1hjc25qWW00dmtQSDRr?=
 =?utf-8?B?bHBnZkxxdkgrREFDSjVUaE5SMmF0a0VyTFNBZ3J2S0xGRWhYTm1yV1U2Rlc4?=
 =?utf-8?B?eUlNSnY3aTlvRG4yenVteTZpN2UvZVkvRUtlcS9ITklKMUZJbHNNQ0plZTRo?=
 =?utf-8?B?QVNYNHllMExqSnlwZnptL0grb0NUT1ZHVm5LaTBmRVVoUFZZTy9vd2wraG1x?=
 =?utf-8?B?Y0hhdEN2M3NPcFoxUWsyenNlcmMzYVhqdnZlN0dGS1lkR2h1bmFtSjZMdHBu?=
 =?utf-8?B?SDhsMzhsaUJJcnFLWndNN3hHQ2dCRm43N1JOOUVhS3laajV0ekkvYTdZTHRy?=
 =?utf-8?B?akI0ZlZUTkpRK2FkelFWK1I5SUZ4Qkw3d3RhRUhoak1wNEJRWERhOTNWTVo5?=
 =?utf-8?B?M0ppOWxwTWNlaUNxbTJWUURUemJiNFRRdFJuL3RCL3JLeThRazZsOUVSa1ho?=
 =?utf-8?B?MlpXZUhTWkVkdVZGVGhrZTJjdjE2SmNEV085TVJ4WUMzNmV4NWFYQ1g4cXd6?=
 =?utf-8?B?T1RGRUhSMEVyTmFaYVFYaU5HYzltZGZRWnk3M0JnK205cURiNGI3MDlZbjJY?=
 =?utf-8?B?aUcrUlgrcHRXNG9pdlk1elM3U1NkY0pNamtuQkh4M0FqU1pNdlhXeWZSbDZ3?=
 =?utf-8?B?WGRQSkxGUWpVQTZNY3R0VGdtRGtFb2I1bHBXRXl6Q1hUT09yT1ZlREEyOUVP?=
 =?utf-8?B?WlVwOXdkZnk4bmtQQjZSOThmcUFGSndGZTBaVkJSeWMrRlZETnptbUJhTUxV?=
 =?utf-8?B?YWRQb2o2Wml1MHNkMGE1WXJObGV4d1E1aTZpOWRlKzEzdGZMeGFuOGtZakRF?=
 =?utf-8?B?NWVaems2cjlwWDBJTnNGZE8wTVpDSDllVlBRbFFmNWpHRjh3cVZwUHdHN3Zw?=
 =?utf-8?B?bTAyc3VLVkEvSkp3NStqMWNmZG5neUFZM0xsaXFUYmZRYzkzNXpWblpuWlJr?=
 =?utf-8?B?TFRLNTROWm1CUm9JcEtMSXB6RXNwUVUxVnhBN2xVcG1od0RaU2hjOUxGbHls?=
 =?utf-8?B?ZXV0dGovVEtXZ0VDSVlaVFA0SHdFTFVLNWlzb2YzMmtyMnBNcWNpblJVbVlY?=
 =?utf-8?B?M0cwM2xFSG9DSmFOcjNjd0duV0Jha3lJUDNvSnN6bU9ua0JoYVJqTGlzZmZZ?=
 =?utf-8?B?UmozVThZMWpUeVFOUzlIU2w5Nkx4cVBXUjB3Q3c3QWlVcEkzU0cvSlZZYnJv?=
 =?utf-8?Q?zgOR7U92wYJeg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c01iQ1c2TTU0ajkyMEhuSXR3T3FWbklsSFRBT20xeE5mQVNCVnRDaEtVbHda?=
 =?utf-8?B?TnpXVFRlRm95TzdnLzkrWkhUMzA3Ni9XN0pkR0luOGdiWk5UbnhjcDliNlkw?=
 =?utf-8?B?bGY2dFM3UFYwYitXWEVycFBJS1A1Q0lYTlFXRlZCeWhGZndZZGttL1JCSUI4?=
 =?utf-8?B?OHRaSkd4NVZBT1ZJcTE4UDRyRnh5WWk1Mk91NUFmM1kyaDBnclMwaStMU3Qy?=
 =?utf-8?B?OWdjQmcyTU1NSG5QK2JXZjVrckVnZUdPZDBaNDhFcXQyYXNudnJNeS84dzZy?=
 =?utf-8?B?YnlNQlV3NnF1dm9LY0JCbi9UVHYxbHlsVUZTQ3hXYlFRMlpNZG9SRWZoOFBY?=
 =?utf-8?B?dGIyQVA1S3dTbjdQMkFPKzVxYlFxZ3pxNmp3ZEhOSjdFbVJITTI3ZkcwYm5p?=
 =?utf-8?B?SFBQZlgxZW16WjVDZXcwdENVM3c3OXdyakxocmVEL2F6VUVZTmJtKzd4ZzBU?=
 =?utf-8?B?QURCdDYyNkFwVzRqUS9YczAvc3NkZ0Q3NjFGUUl5eWpFOWU2ZlREVHlhVmo3?=
 =?utf-8?B?SzhmaVFFbitpRDR4Rno4TTY5QTR4Kzc0SDQybW5IdGZzQXRXOU9ZbkZuQi8r?=
 =?utf-8?B?NTdKSERxaWlaa0t2dTdNSDV5U2lLR1FNWGxEVGxsTm5GODJFRmJjQm95b0F6?=
 =?utf-8?B?cXhteUhxTUxqR0gwMjEyWDY2T3RkZ0lEamZWdE4yS2pPZ1BNNjB6Q3cwNXNZ?=
 =?utf-8?B?YkdJZ1NFcTBvMFM3OFJUdUhnU3pxbWNLeGVXRGpLcFlNYVNaSS9CeUpibzJM?=
 =?utf-8?B?aEQ3QUJQK2tNQkg5eHhjSm5TWXhPSHFMcSthZWVJcktCa25DQllaU1BjSjFU?=
 =?utf-8?B?TmtYdFJvenRMSHNJaXlCeWNDdm5Ub090UW43dWJWME9HajhqTy95SFBrTXVo?=
 =?utf-8?B?NUtDcDI4Umk0bjVOY2xiWTY4czdHMWNRSjZtdEVQYzI1dDVmSTVwcndOS0t6?=
 =?utf-8?B?Nld1dkVldVV0emhpM05obURtWDZpU1pQdTVFUTlOdXZ2Mnk4OFp6Ny92ak5F?=
 =?utf-8?B?dmQzdGVnU0tPaHowQWsybm15R0N0Y202WitES2d4cSsvUmFkWityQ0JhODRm?=
 =?utf-8?B?OExDa2czSUJNTFR3MkdhNndEd2RmUEN4NHNiK0s0SzZWYWY2UFphMXl3T3pK?=
 =?utf-8?B?bTVkSS9GVFo5ZHU1ZSthdWtBT1lRcTd5a2E4U3RoWXUxZzMrYUJNcG5JS3dr?=
 =?utf-8?B?S2IvTWd0K2ltbTMwQ3VDT0JJeFl3b2hndjU3QzlJclVkL1I0c0MwLzNWcVNE?=
 =?utf-8?B?V3NRaURKR25DR3ZIWG5LRHhyc1JsZFV3NnV1eFQvMTF0Z3hBYmd2QXhBdlZI?=
 =?utf-8?B?V1ZwWk8rd24vVktmdGxjL2RtY2Qrcld5MGZDN2U3bC9qMW9SU2R3MzlLYzg5?=
 =?utf-8?B?OE5nMHJBWUJBV1crL0V5NUFwcU8zb01OanBjVmFMbHhDalc1QXJZa3RDRWN3?=
 =?utf-8?B?V0hHdTRFckRHRUpTUWlkdC9Edmh6cTdsdk1EN1c3dEswajMrNkFlUXUzL3RL?=
 =?utf-8?B?ZWQ2blpETW4rZG1ZUmxpbjJqSUluR2Iza1VLSnJ1dndBVlExTTUzYTlQcnFC?=
 =?utf-8?B?ejNxdU8xY2VBa1pudldTMUZBZk1GT3NCWnBxT2hHQ281eE05SnI2amU1SVJC?=
 =?utf-8?B?OWFnV29rQWJZRVRXdm1ZY3BaMysxTHZIY2o5NEVWMFFEd0hSQlZFakRzUnpM?=
 =?utf-8?B?YXpwME9Xcmk5aDR5WXIxbUVMbnVFU1FPa0s3c2ZpVEc5YXdWd2x5VkVteGNM?=
 =?utf-8?B?MkVjY2lqUXdzMGdXMmRzdnN5YjNEWE9waGFRdzErRHUrckk0S2VIc1U5MXh1?=
 =?utf-8?B?elRlaTFJSnljOWFYbTdRQ0tVblpyOFhJbDNmVlQ2SE9Xci8xeG1WRGNpS3Z2?=
 =?utf-8?B?MDNqdjRTN0hmaThWc2lrY0JoMjI5YlBPTEpLdHRTbDRlZmFOaUlvZnBMd3lP?=
 =?utf-8?B?QWVLN09rbE4vSkpoK3l1MjFhb0VPU0RGNUlmcHF5QzV6ZDRGU1VJeThETTlX?=
 =?utf-8?B?c1FRdy9HZ285bk4xODY4YjdYZzNxUGgwWXpmclJwWWdHRGRtSjVXdjM2R3VK?=
 =?utf-8?B?VE1jTUliSUlsaUdVQ3k4YzVzOGIzQ1p0REhya3dxM3JrQTlDK054TzNaM09U?=
 =?utf-8?Q?70dYNRzYTlcoeT3H5PWAUKahu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 731a8a3e-2a6a-402c-0f34-08ddaed8e92d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 02:28:00.9119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9G2alcZ9Xk2hbVsIwdsaXokXOU48y26pL2SKYdRy5qjSB8RWrAC74Dk2jX+h4mwlyc/O2qngDC7Xyh60B6tzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10830

On 06/19/2025, Frank Li wrote:
> On Wed, Jun 18, 2025 at 05:13:14PM +0800, Liu Ying wrote:
>> commit b0a5cde57cf1 ("dt-bindings: mfd: Explain lack of child dependency
>> in simple-mfd") pointed out that it's a mistake for a child device of
>> a simple MFD device to depend on the simple MFD device's clock resources.
>> fsl,imx8qxp-csr.yaml happens to make that mistake.  To fix that, remove
>> fsl,imx8qxp-csr.yaml and use "simple-pm-bus" and "syscon" as compatible
>> strings in the examples of fsl,imx8qxp-pixel-link-msi-bus.yaml.
> 
> Does anyone use fsl,imx8qxp-mipi-lvds-csr/fsl,imx8qm-lvds-csr? I suppose
> yes. It'd better said no one use these in dts and safe to remove.

After this patch removes "fsl,imx8qxp-mipi-lvds-csr" from
fsl,imx8qxp-pixel-link-msi-bus.yaml, there is no user.  I may mention this
in commit message of next version.

> 
> Frank
>>
>> Fixes: 9b2c55b5403f ("dt-bindings: mfd: Add i.MX8qm/qxp Control and Status Registers module binding")
>> Fixes: c08645ea215c ("dt-bindings: bus: Add Freescale i.MX8qxp pixel link MSI bus binding")
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  .../bus/fsl,imx8qxp-pixel-link-msi-bus.yaml   |   7 +-
>>  .../bindings/mfd/fsl,imx8qxp-csr.yaml         | 192 ------------------
>>  2 files changed, 5 insertions(+), 194 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
>> index 7e1ffc551046..4adbb7afa889 100644
>> --- a/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
>> +++ b/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
>> @@ -103,11 +103,14 @@ examples:
>>          clock-names = "msi", "ahb";
>>          power-domains = <&pd IMX_SC_R_DC_0>;
>>
>> -        syscon@56221000 {
>> -            compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
>> +        bus@56221000 {
>> +            compatible = "simple-pm-bus", "syscon";
>>              reg = <0x56221000 0x1000>;
>>              clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
>>              clock-names = "ipg";
>> +            #address-cells = <1>;
>> +            #size-cells = <1>;
>> +            ranges;
>>
>>              pxl2dpi {
>>                  compatible = "fsl,imx8qxp-pxl2dpi";
>> diff --git a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
>> deleted file mode 100644
>> index 20067002cc4a..000000000000
>> --- a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
>> +++ /dev/null
>> @@ -1,192 +0,0 @@
>> -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> -%YAML 1.2
>> ----
>> -$id: http://devicetree.org/schemas/mfd/fsl,imx8qxp-csr.yaml#
>> -$schema: http://devicetree.org/meta-schemas/core.yaml#
>> -
>> -title: Freescale i.MX8qm/qxp Control and Status Registers Module
>> -
>> -maintainers:
>> -  - Liu Ying <victor.liu@nxp.com>
>> -
>> -description: |
>> -  As a system controller, the Freescale i.MX8qm/qxp Control and Status
>> -  Registers(CSR) module represents a set of miscellaneous registers of a
>> -  specific subsystem.  It may provide control and/or status report interfaces
>> -  to a mix of standalone hardware devices within that subsystem.  One typical
>> -  use-case is for some other nodes to acquire a reference to the syscon node
>> -  by phandle, and the other typical use-case is that the operating system
>> -  should consider all subnodes of the CSR module as separate child devices.
>> -
>> -properties:
>> -  $nodename:
>> -    pattern: "^syscon@[0-9a-f]+$"
>> -
>> -  compatible:
>> -    items:
>> -      - enum:
>> -          - fsl,imx8qxp-mipi-lvds-csr
>> -          - fsl,imx8qm-lvds-csr
>> -      - const: syscon
>> -      - const: simple-mfd
>> -
>> -  reg:
>> -    maxItems: 1
>> -
>> -  clocks:
>> -    maxItems: 1
>> -
>> -  clock-names:
>> -    const: ipg
>> -
>> -patternProperties:
>> -  "^(ldb|phy|pxl2dpi)$":
>> -    type: object
>> -    description: The possible child devices of the CSR module.
>> -
>> -required:
>> -  - compatible
>> -  - reg
>> -  - clocks
>> -  - clock-names
>> -
>> -allOf:
>> -  - if:
>> -      properties:
>> -        compatible:
>> -          contains:
>> -            const: fsl,imx8qxp-mipi-lvds-csr
>> -    then:
>> -      required:
>> -        - pxl2dpi
>> -        - ldb
>> -
>> -  - if:
>> -      properties:
>> -        compatible:
>> -          contains:
>> -            const: fsl,imx8qm-lvds-csr
>> -    then:
>> -      required:
>> -        - phy
>> -        - ldb
>> -
>> -additionalProperties: false
>> -
>> -examples:
>> -  - |
>> -    #include <dt-bindings/clock/imx8-lpcg.h>
>> -    #include <dt-bindings/firmware/imx/rsrc.h>
>> -    mipi_lvds_0_csr: syscon@56221000 {
>> -        compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
>> -        reg = <0x56221000 0x1000>;
>> -        clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
>> -        clock-names = "ipg";
>> -
>> -        mipi_lvds_0_pxl2dpi: pxl2dpi {
>> -            compatible = "fsl,imx8qxp-pxl2dpi";
>> -            fsl,sc-resource = <IMX_SC_R_MIPI_0>;
>> -            power-domains = <&pd IMX_SC_R_MIPI_0>;
>> -
>> -            ports {
>> -                #address-cells = <1>;
>> -                #size-cells = <0>;
>> -
>> -                port@0 {
>> -                    #address-cells = <1>;
>> -                    #size-cells = <0>;
>> -                    reg = <0>;
>> -
>> -                    mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
>> -                        reg = <0>;
>> -                        remote-endpoint = <&dc0_pixel_link0_mipi_lvds_0_pxl2dpi>;
>> -                    };
>> -
>> -                    mipi_lvds_0_pxl2dpi_dc0_pixel_link1: endpoint@1 {
>> -                        reg = <1>;
>> -                        remote-endpoint = <&dc0_pixel_link1_mipi_lvds_0_pxl2dpi>;
>> -                    };
>> -                };
>> -
>> -                port@1 {
>> -                    #address-cells = <1>;
>> -                    #size-cells = <0>;
>> -                    reg = <1>;
>> -
>> -                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
>> -                        reg = <0>;
>> -                        remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
>> -                    };
>> -
>> -                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
>> -                        reg = <1>;
>> -                        remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
>> -                    };
>> -                };
>> -            };
>> -        };
>> -
>> -        mipi_lvds_0_ldb: ldb {
>> -            #address-cells = <1>;
>> -            #size-cells = <0>;
>> -            compatible = "fsl,imx8qxp-ldb";
>> -            clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
>> -                     <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
>> -            clock-names = "pixel", "bypass";
>> -            power-domains = <&pd IMX_SC_R_LVDS_0>;
>> -
>> -            channel@0 {
>> -                #address-cells = <1>;
>> -                #size-cells = <0>;
>> -                reg = <0>;
>> -                phys = <&mipi_lvds_0_phy>;
>> -                phy-names = "lvds_phy";
>> -
>> -                port@0 {
>> -                    reg = <0>;
>> -
>> -                    mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
>> -                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
>> -                    };
>> -                };
>> -
>> -                port@1 {
>> -                    reg = <1>;
>> -
>> -                    /* ... */
>> -                };
>> -            };
>> -
>> -            channel@1 {
>> -                #address-cells = <1>;
>> -                #size-cells = <0>;
>> -                reg = <1>;
>> -                phys = <&mipi_lvds_0_phy>;
>> -                phy-names = "lvds_phy";
>> -
>> -                port@0 {
>> -                    reg = <0>;
>> -
>> -                    mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
>> -                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
>> -                    };
>> -                };
>> -
>> -                port@1 {
>> -                    reg = <1>;
>> -
>> -                    /* ... */
>> -                };
>> -            };
>> -        };
>> -    };
>> -
>> -    mipi_lvds_0_phy: phy@56228300 {
>> -        compatible = "fsl,imx8qxp-mipi-dphy";
>> -        reg = <0x56228300 0x100>;
>> -        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
>> -        clock-names = "phy_ref";
>> -        #phy-cells = <0>;
>> -        fsl,syscon = <&mipi_lvds_0_csr>;
>> -        power-domains = <&pd IMX_SC_R_MIPI_0>;
>> -    };
>> --
>> 2.34.1
>>

-- 
Regards,
Liu Ying

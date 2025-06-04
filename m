Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C481D5175
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749052119; cv=fail; b=nyXWe9c5+kVOUJ60zkHQscysNr5P3+qCDRa2vRj6vo4knO5uV6352hie5NAvogRJ5EB5OzD29H4f28dOM5j9RwO896WILoDi/iC9qmGmSOFCQltUo0X60/Rqj3xEkrmyhOvyCcuHbxfmv4GLJQjWWI5En25MBwzOv03Ll/oZ3n4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749052119; c=relaxed/simple;
	bh=8Eg6SEcZI6UCmvDPSLcIvWeJESs41demaWsFLXRfMuQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aL7zv0dlK2x6wQwVgQ9D029O34qECUFTV0w+5jF91Jlr7JlCwRvn5ckJfYLu2xbgV825xUGNjSMfmKxgsZC86cTwdoygme72E4UHhWKOhEsur1/ZJuFoJD8YGGz2vQGncqA0eeY6wI8N+Nn0Uv8xibhg68HxHjuSscvgXQcKmpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=fHIY6/CY; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="fHIY6/CY"
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.2/8.18.1.2) with ESMTP id 554DTckq026715;
	Wed, 4 Jun 2025 08:48:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2021-q4;
	 bh=KEKTCbfkNqxOXs5OwqF1sdWoUEQNJx/W1jqoegp+2W0=; b=fHIY6/CY9a1m
	pwxgJ4lkPtwP+b9xz9HWVVmm3H6diUTtWfaV+rGbonAwzkFgxhBipTE2we4Deww9
	9k+8r8jSDH/OApibgUag6dYNMr4ccAhRJEVS8T7zlWmLR6hUi4JtaGTCctgGEZdp
	rKD+oj3X0hFTZ3lBtsy2M5R4JOIcwUOdxqew6dGDYgw5uTjkcx5/xZ93ydkhyfTQ
	RR203WFeLgxR6bueZMyu6sIPS5DayhVwI1zr4LPuugZ5AujEAxysNnONazw0M9Pw
	a4c1ZvEwKgv1hDvUSPumKOjYxSjK5eaqR1CIHWZhpIESrM1lE/xjKWfMFjnu0aM3
	jRIzcsh3AA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
	by m0089730.ppops.net (PPS) with ESMTPS id 472nqphm1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZWBzBjbsP/kY4Cj62IQQZYigjFdk+4Fz+Vutq+CkT3bzuQbNsPxVWXW/euHsIlCVhthqTEmIYIFmF1DHBcv6SuJ7U2H2nB5Fw9ncsTPw5grML5qe/sQzqhVddB9iEpqUuMxHSfpYcNShz0z2iS+higLB7n2iHvGmL+xXH01UaCraevg1e3LvTSePY2a+5KUAQrxClI8QD0UGv7slf3lgrnsZTwlntOQTNkgZ8FoFMGpKzQPpkCmXtXhY+Li+/FAspxu4xxvkHAu/rSplHogQ686UYQmDJqURMlh+CPciZwxAjOoyX5jaf1HO78xeBSME5wiOx06NBxWfF9PbHQJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEKTCbfkNqxOXs5OwqF1sdWoUEQNJx/W1jqoegp+2W0=;
 b=XOB/l5Op8pF3I7zTt5F0oyL+R3Tz/KLm+xoYNCKmYzIPKdlkTsWrMSnK8fY3vnCubz8k9b5DA8z91dw0kmBdjjlTnCJsFDwdDtixjyNXLaToClELkBMlh6yF/qTytqcd8BjasCGqG9vwagY7jEJMFSrslUQS8v4RN5e1izt1gLCTp/sdLDsZL6dADVqp2ODpctqX8JsCeoTxRWr0yhhqmUQVtYo41klC0TFpW1pYElH42J0+juZ3bI2vwtcj9v6kRH3RoRwJ3qZ7k2lzjvmB1WUvw343lKxpQwX6sd4fJuoFd3sxb1rG2uzHBP/DQ2OHiWtOdHH3XykcVgHd+qvD2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by CH0PR15MB6212.namprd15.prod.outlook.com (2603:10b6:610:191::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Wed, 4 Jun
 2025 15:48:15 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0%7]) with mapi id 15.20.8769.037; Wed, 4 Jun 2025
 15:48:15 +0000
Message-ID: <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
Date: Wed, 4 Jun 2025 11:48:05 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
References: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
 <20250604092815.UtG-oi0v@linutronix.de>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <20250604092815.UtG-oi0v@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:52c::29) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|CH0PR15MB6212:EE_
X-MS-Office365-Filtering-Correlation-Id: 458ff6c9-b134-409d-5a18-08dda37f3817
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVpKU1ppejJGOTloTHBBaVBoU0JYU0VCU1BGelBJRjB4Z2VFZVozNkpSSDRq?=
 =?utf-8?B?YitGQ3BrTC8vQXE5L0NmZ0pWSk9YZlNIMEgrWktEV3lReGZ1bGRjeVpLbjRW?=
 =?utf-8?B?bC8yZVZmSmR5ejNWOTVLSDdKVi9UcFhWRDN5dWJVUFlpelk3S0tkcHhUYVRr?=
 =?utf-8?B?RGhSOXFHMUZONVFUNmtwNSs3NnFmNVJPM1R6Ly83akJxbjhyWEFnOE95WTN3?=
 =?utf-8?B?SVRSMGdXeXRMaHd0K3NCaFprUWljRGpmSXk0VXA4bTh3blRoU3AwK1RETkw5?=
 =?utf-8?B?b3EwTEl0SUhOQi91TU4wRTBIN1Y0U25ValluN0NMZHlXL2VYWFgxV0I3SjNQ?=
 =?utf-8?B?YmpIeFZJdlgvUkZxUGhMbTVxV0pRUW9RY0xtUGw4VmJuZ0NDVUd4M3oxWVZa?=
 =?utf-8?B?WFdRQnlzVkVZMlZVbkMrdHpSckhtWEpPM21McXV0N2dPWjBqSU0yZjAvL01S?=
 =?utf-8?B?R291Yy95elR3TEJCL0VRUUlnNDl0OURlTGwwUFZBLzBjWEJjblpjbktlRWV1?=
 =?utf-8?B?b1ZzbU5PUStvK05YZTNSczFyZStleGZ0TmdNWmZCVWFOT0NXaUl1ckROeHVa?=
 =?utf-8?B?OG5WZEp5ajFRd2w4WkdGYm1xSi9HeFhWQnd6R3ZLdFdST1lDS2hBUHlTRXN5?=
 =?utf-8?B?Vmo2eE5MSUw2azNjS2xMMmwzZ202TDlsTHAwT1NEWmFWL3NpSkFLeHpnamhK?=
 =?utf-8?B?QlZ2QTB4VUNaaTlVR0lVOVVFYWxYTXR1VWs0dWRYWEZYWEdxdS9rZHpnUXF1?=
 =?utf-8?B?bGJyNXhZVHpMTXZXRktxY1F0c0U1TlNNSm1TbDgxbjA4S0ZtTi8za0IyRHVw?=
 =?utf-8?B?T3NPQzQyeXBveDFrK0xSZURmam5VK3BZaERtYkZOK2cyS29IMHVHMUNNdjkz?=
 =?utf-8?B?NkwvWlpDdHdjcjFhSm9US2l1YnhCK3JCdm9peXAraXFobTJYbTRFTVRmWWtq?=
 =?utf-8?B?SlFUVk9CYjY0cW1EOTdYWDdvQXhGR1FMUnpQTUd0S1NORlF2dXhVTWlPYmwy?=
 =?utf-8?B?dU1zUEtXb3ZIKzNlWkF6VlZ2NFF3N2Zhbmw3R3YrUDE3OWtWSXpKZ3Zib0JO?=
 =?utf-8?B?dVBqbVRFNlI4b3FrNkt6VElTdEQ2N2VYK0JtbXpaRWVoTUF5a1QwY1NoNXRi?=
 =?utf-8?B?dm5wUEFEUE5HYlZyS3J0WnFxdFV3eThPUzQ1VXlURzlVU2xiWWZWOXpjamtI?=
 =?utf-8?B?WG1OVjYxZG5uMVFpYVA4cW0zTFhUUU1HeXdTbXdKaXVVRnNCaU4zNDMwOGhD?=
 =?utf-8?B?Z0hYQmdtY2tyWEMzZjgwNDZER3IraXI4L3R0Vnl5QWVKeHhkSmY4TkZXUmZB?=
 =?utf-8?B?RnN6aWRCR2Q3Y2YvVGJhd1dNTWJLaVl0VmVKQjZ2L0JQZzBIVUl3eW9UWWxU?=
 =?utf-8?B?aDZwNnk1WUl3NFlSSm54VGJTRzAza1NDd0F2VFdUeVlSRWhHYjdIZjRXaFUz?=
 =?utf-8?B?b0xVNTMxWDlWNUlxc1FOMkRmNTMwWHVEcGg0Zm1zNndXR2Z6SVB2b05wYnM1?=
 =?utf-8?B?dVZZZ2F1Q0kvNjhOU2hEQ1BsRm0ybktNdnNVQmZ2S2lqdDlsRGFJMnhPUTBR?=
 =?utf-8?B?ZStadHk0QWJhZktsNytMR2YzTU44NEFEQkgva0paU0ZrcGdZckEyYXp0VFk0?=
 =?utf-8?B?cjBLOHdFbW5pYXhBRzEzQi9VNTEyalhNdndzelZTWVQzZ0QwK2ZJL2J3UDFw?=
 =?utf-8?B?eVhqbm5teDJHMk5WZVZlK3FhbndOUmFxaHl6M0d2YkljOERkNXVOdXoyMkUy?=
 =?utf-8?B?bjUwMXlzZXRpK3daMUhOMGVLQW1PWThYMnpUQUdUMTl5L05aWDl3eGJkeFor?=
 =?utf-8?B?VlNBdFpMNmVRaENlRmF6M09PU0UvMTd5RVpTK1o3V3hvT25iN29qdGdKTU1t?=
 =?utf-8?B?L2ZNWTFIcVVoRTBOS3lLQXJ1bmVnb0pPNVZiYUFiRExPczcwVFNBYmpNS0Ev?=
 =?utf-8?Q?cqgItCRZt8I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXozYW9uOVovYklpK2RpSEdUUjVwY01vajdLYzI0ZFBvbGFvRFFKdnBsNEdr?=
 =?utf-8?B?a1ZoVzdIUk5TZHJyVndqOVRCd2pzVDV3SzFrMFJLZXR4YStzY1ZEWGJIOGRn?=
 =?utf-8?B?VlA3RkZDcTVDTDI3N25pMHFDZjRYbU1zQldGNjFFT0lDeTdHUTlVRTdYNm04?=
 =?utf-8?B?di9qUG9ETnRzWHNWSzNmOFo2YUxidGVuWldzTS85VEFWQTQzb1NQbENiMG9W?=
 =?utf-8?B?dzY2M0NaeEVZWk9taXhKVEp4S1I3aUFLTmRzZG1nSlk2bFR0MWtONVAvNVk5?=
 =?utf-8?B?aURKY2VEa2VFcE5wUzJqbWZrUVVrbTlKbEQzOGpnRjA1dVkydzY4Y0d6U1M2?=
 =?utf-8?B?Z0VLa2F0NUZ3cTBTajZraUhHL0NuSVQ2Mk5jM3NxdHZrUkZTMHFBOFpVWVhr?=
 =?utf-8?B?WllDQmovdWxWTEhiZmg3VnBGaFYxR3BWbHl1ZFBvYzFqQ29DR0ZkRVZBNENt?=
 =?utf-8?B?SU5aaExCQ2Qrb2lqVENrVlFscG5HN0c2SStSc3dNaEsxTzBzRzNRS3I2eTd5?=
 =?utf-8?B?VVp1alBGL0RiVUE3S3Vkd0FRYjhmVjdDK0J1VURmeEF3NXkxM2R6cWRla2Nt?=
 =?utf-8?B?Uk84K0xLR1JGdzZGbFRnQzY4cTRQSjUzKzZxUVRuYjltczZTSHh4S0N5ekQ1?=
 =?utf-8?B?WGdHaXFjN3FweG5ESUJ3TVpQRDljKzVTMlZJbXFyUFpRZzQrQjEzenEyRGVO?=
 =?utf-8?B?em5yZnEvdE4vSm44YmZPUWtjTUoxZUc4TzlhK1hRM2twdWcvNlpKRkVnWWVW?=
 =?utf-8?B?RHlZdGgwaW50NkZCdEpEZ2o4V2JwdlFwV0IrNW5WTkh2cFhBZWxWbjBDUVJw?=
 =?utf-8?B?VjYvNjhVdDhKbkdITExOTHdML3MvaHMrZ1RHNHZJc1RVdnpqai9HVmJzNEJZ?=
 =?utf-8?B?SlNjTllRRm1ua0NDcDNEOTN1Vk12bTYyMU9kMmRRcElJRFMxTGR6NGN6QUNj?=
 =?utf-8?B?bDAyc2hDRHl6MDVsVjVnV01PcmVMa2w2VFRETUI3VUxLbEZMRmZFNDczQkk2?=
 =?utf-8?B?bEpqZlZjekI0NkQwWE4vamVWQjkyRlY5R1lJMWRYTjBVdTFNOTQ0TzU3eXBY?=
 =?utf-8?B?aTJYaXNBekxYRGhtN3FBcCtucW5yMG1rbEd5RTZrK1NvKzRzbWdZdGhGd3g2?=
 =?utf-8?B?NHpKOUJLZHFqbHdsTVB0OC8vNThZNkNLV2Q5dktxNmFwTWhPSWJJcWoxSy9K?=
 =?utf-8?B?MDhlajFuK0NyVUhqZzhCSThoNi81TGxianAzVTd3OXYxclREc0xpTEFxYmVh?=
 =?utf-8?B?QzZpZE1aMVA2Q3d3OWNWK1pTNUJiUnlRYUMwYno1Snd5LzNOblNnUXBCeGJy?=
 =?utf-8?B?aHl0RlJIRFh3N2xFVEFhRjZGYXY2NFNYMmNQSkdMamN2ZkduYi8wV0g1Y3Z6?=
 =?utf-8?B?TlFqNzA4Y2l2RWt6ZjJRTjc1UlQrTG9XOGl0MTlIOGRkc09yVzJ2aVN0UmlQ?=
 =?utf-8?B?UUtjNC9kcS9YazIrSlJyR29NcXhsd1Y3MFBlM0dGWmhFVzN6MTAwL0tWSlBa?=
 =?utf-8?B?MlZKbEhtQjJHaDIxM3BSMnVKNVZ6UENkSDc3Y1NNWHNOWHlIcnhSRFc1V2J5?=
 =?utf-8?B?bTNLdi9UYjRGVE8vVlNuY3YraUR0eDR4N1J1T0wyTEg2Z1VjbUsxaVpQZENr?=
 =?utf-8?B?a1BEMWw4WEF5dTVVc0d2NVBpTDJWRzdHSENET0Q0TVMxZXM4MmxTVEZIRXdi?=
 =?utf-8?B?RWZjWklodzdQVTF2N3lLdEYyc1dMZ05CMmo2Ry8ybWw3T0lscDBsNzVnNkp4?=
 =?utf-8?B?M2c3SjZDY20wbXhOU2FRNmpOWGJkMGRyYVp4M0NiNndtTUtQdE1VSTlzREx2?=
 =?utf-8?B?dEhTcDZoN01UVXZzQWpEaGxhWlp2bDR4VzBGbWNhc0taWXZjNVk1dnk5a0xS?=
 =?utf-8?B?NWhqOHhnOVp0eXFJSU5KYXhYMWY2eGNtdDBNR0F5aGxudkdXY3lPY29vNThJ?=
 =?utf-8?B?blZMY2hWR052eXJZT2F5T2U5MzBTZnVRY0dtT1FlRktrN2hOeksrZHNxbTBr?=
 =?utf-8?B?ZE1QS292NVNsc0cvRk5naTJ5Mmxua0FCemJYMXBhS2QvUTAycks2c1c1U2Yz?=
 =?utf-8?B?S3hPSkdEU3VKYlAzRFAvQlpOMmxCSm80SU9VR1JGTGNhZXpVN3MyOUNjZE1p?=
 =?utf-8?Q?uBnk=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 458ff6c9-b134-409d-5a18-08dda37f3817
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 15:48:15.4930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEwX8CIg1BW1QouyCNE9kTO0/0AM/7VlV7p1AC5UId5uPBsCf00TUeolcGNVbK2b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR15MB6212
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEyMCBTYWx0ZWRfX/AWJky8R+1Em xUu5aNI3SVmg5n0tDsXhd5oOnOJxT6zBU12JydywymMsjg+GL6H8esMixs+OM/Ii7Ynhv0Tq6pK E1PXSXqzLz8pisRdPhIUnWB/rFPin/Z4b7BW0wMsH26+FDvecYa4TfA2/hWSdtvyFE3yMsVq9aw
 LaxsHNY8NvHHSZUmD+iY1R4zhndFef0H4fkbDJnTGtUjiBnfRROLmVYNy9UHO0OVFOB+Xe2vOu6 aV7NzhZZ8XbF58T6rybFwq6VNZvuBkc4nhlaIotIJLOwir8Y2siWKs4+2XoE4jlpXx9lRIGDBmi SqR51a0a+/ecTp5Ch/NTjXsvezQCrefa/l+a1FAcyKQBu/vHBWOik0zxc+MOkVLB2GwXBcjuWy3
 YayQ0KpPHjYPaHy1PbFFRpHu8VZfXakmAblJralP0gYsmlsmuyMIPEqamDt7v0i8OPeXKZkG
X-Proofpoint-ORIG-GUID: WrONG9v9W5k0KZDJteXywKUWNmUrVgg5
X-Authority-Analysis: v=2.4 cv=M7NNKzws c=1 sm=1 tr=0 ts=68406acb cx=c_pps a=W6EPrjjQM45bXwhc9OBL1g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=2FqylPF2CGEeS-aIZ4UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: WrONG9v9W5k0KZDJteXywKUWNmUrVgg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01

On 6/4/25 5:28 AM, Sebastian Andrzej Siewior wrote:
> On 2025-06-03 15:00:43 [-0400], Chris Mason wrote:
>> Hi everyone,
> Hi,
> 
>> While testing Peter's latest scheduler patches against current Linus
>> git, I found a pretty big performance regression with schbench:
>>
>> https://github.com/masoncl/schbench 
>>
>> The command line I was using:
>>
>> schbench -L -m 4 -M auto -t 256 -n 0 -r 60 -s 0
>>
> …
>> schbench uses one futex per thread, and the command line ends up
>> allocating 1024 threads, so the default bucket size used by this commit
>> is just too small.  Using 2048 buckets makes the problem go away.
> 
> There is also this pthread_mutex_t but yeah

Yeah, but -L disables the pthread nonsense.

> 
>> On my big turin system, this commit slows down RPS by 36%.  But even a
>> VM on a skylake machine sees a 29% difference.
>>
>> schbench is a microbenchmark, so grain of salt on all of this, but I
>> think our defaults are probably too low.
> 
> we could 
> 
> diff --git a/kernel/futex/core.c b/kernel/futex/core.c
> index abbd97c2fcba8..9046f3d9693e7 100644
> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -1687,7 +1687,7 @@ int futex_hash_allocate_default(void)
>  	scoped_guard(rcu) {
>  		threads = min_t(unsigned int,
>  				get_nr_threads(current),
> -				num_online_cpus());
> +				num_online_cpus() * 2);
>  
>  		fph = rcu_dereference(current->mm->futex_phash);
>  		if (fph) {
> 
> which would increase it to 2048 as Chris asks for.

I haven't followed these changes, so asking some extra questions.  This
would bump to num_online_cpus() * 2, which probably isn't 2048 right?

We've got large systems that are basically dedicated to single
workloads, and those will probably miss the larger global hash table,
regressing like schbench did.  Then we have large systems spread over
multiple big workloads that will love the private tables.

In either case, I think growing the hash table as a multiple of thread
count instead of cpu count will probably better reflect the crazy things
multi-threaded applications do?  At any rate, I don't think we want
applications to need prctl to get back to the performance they had on
older kernels.

For people that want to avoid that memory overhead, I'm assuming they
want the CONFIG_FUTEX_PRIVATE_HASH off, so the Kconfig help text should
make that more clear.

> Then there the possibility of 
>
> diff --git a/kernel/futex/core.c b/kernel/futex/core.c> index
abbd97c2fcba8..a19a96cc09c9e 100644
> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -1680,6 +1680,8 @@ int futex_hash_allocate_default(void)
>  {
>  	unsigned int threads, buckets, current_buckets = 0;
>  	struct futex_private_hash *fph;
> +	bool current_immutable = false;
> +	unsigned int flags = 0;
>  
>  	if (!current->mm)
>  		return 0;
> @@ -1695,6 +1697,7 @@ int futex_hash_allocate_default(void)
>  				return 0;
>  
>  			current_buckets = fph->hash_mask + 1;
> +			current_immutable = fph->immutable;
>  		}
>  	}
>  
> @@ -1705,10 +1708,13 @@ int futex_hash_allocate_default(void)
>  	buckets = roundup_pow_of_two(4 * threads);
>  	buckets = clamp(buckets, 16, futex_hashmask + 1);
>  
> -	if (current_buckets >= buckets)
> -		return 0;
> +	if (current_buckets >= buckets) {
> +		if (current_immutable)
> +			return 0;
> +		flags = FH_IMMUTABLE;
> +	}
>  
> -	return futex_hash_allocate(buckets, 0);
> +	return futex_hash_allocate(buckets, flags);
>  }
>  >  static int futex_hash_get_slots(void)
> 
> to make hash immutable once the upper limit has been reached. There will
> be no more auto-resize. One could argue that if the user did not touch
> it, he might not do it at all.
> 
> This would avoid the reference accounting. Some testing:
> 
> 256 cores, 2xNUMA:
> | average rps: 1 701 947.02 Futex HBs: 0 immutable: 1
> | average rps:   785 446.07 Futex HBs: 1024 immutable: 0
> | average rps: 1 586 755.62 Futex HBs: 1024 immutable: 1> | average
rps:   736 769.77 Futex HBs: 2048 immutable: 0
> | average rps: 1 555 182.52 Futex HBs: 2048 immutable: 1


How long are these runs?  That's a huge benefit from being immutable
(1.5M vs 736K?) but the hash table churn should be confined to early in
the schbench run right?

> 
> 144 cores, 4xNUMA:
> | average rps: 2 691 912.55 Futex HBs: 0 immutable: 1
> | average rps: 1 306 443.68 Futex HBs: 1024 immutable: 0
> | average rps: 2 471 382.28 Futex HBs: 1024 immutable: 1
> | average rps: 1 269 503.90 Futex HBs: 2048 immutable: 0
> | average rps: 2 656 228.67 Futex HBs: 2048 immutable: 1
> 
> tested with this on top:

This schbench hunk is just testing the performance impact of different
bucket sizes, but hopefully we don't need it long term unless we want to
play with even bigger hash tables?

-chris

> 
> diff --git a/schbench.c b/schbench.c
> index 1be3e280f5c38..40a5f0091111e 100644
> --- a/schbench.c
> +++ b/schbench.c
> @@ -19,6 +19,8 @@
>  #include <unistd.h>
>  #include <errno.h>
>  #include <getopt.h>
> +#include <linux/prctl.h>
> +#include <sys/prctl.h>
>  #include <sys/time.h>
>  #include <time.h>
>  #include <string.h>
> @@ -42,6 +44,9 @@
>  
>  #define USEC_PER_SEC (1000000)
>  
> +static int futex_size = -1;
> +static int futex_flags;
> +
>  /* -m number of message threads */
>  static int message_threads = 1;
>  /* -t  number of workers per message thread */
> @@ -127,7 +132,7 @@ enum {
>  	HELP_LONG_OPT = 1,
>  };
>  
> -char *option_string = "p:m:M:W:t:Cr:R:w:i:z:A:n:F:Lj:s:J:";
> +char *option_string = "p:m:M:W:t:Cr:R:w:i:z:A:n:F:Lj:s:J:H:I";
>  static struct option long_options[] = {
>  	{"pipe", required_argument, 0, 'p'},
>  	{"message-threads", required_argument, 0, 'm'},
> @@ -176,6 +181,29 @@ static void print_usage(void)
>  	exit(1);
>  }
>  
> +#ifndef PR_FUTEX_HASH
> +#define PR_FUTEX_HASH                   78
> +# define PR_FUTEX_HASH_SET_SLOTS        1
> +# define FH_FLAG_IMMUTABLE              (1ULL << 0)
> +# define PR_FUTEX_HASH_GET_SLOTS        2
> +# define PR_FUTEX_HASH_GET_IMMUTABLE    3
> +#endif
> +
> +static int futex_hash_slots_set(unsigned int slots, int flags)
> +{
> +	return prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, slots, flags);
> +}
> +
> +static int futex_hash_slots_get(void)
> +{
> +	return prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_GET_SLOTS);
> +}
> +
> +static int futex_hash_immutable_get(void)
> +{
> +	return prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_GET_IMMUTABLE);
> +}
> +
>  /*
>   * returns 0 if we fail to parse and 1 if we succeed
>   */
> @@ -347,6 +375,13 @@ static void parse_options(int ac, char **av)
>  				exit(1);
>  			}
>  			break;
> +		case 'H':
> +			futex_size = atoi(optarg);
> +			break;
> +		case 'I':
> +			futex_flags = FH_FLAG_IMMUTABLE;
> +			break;
> +
>  		case '?':
>  		case HELP_LONG_OPT:
>  			print_usage();
> @@ -1811,6 +1846,9 @@ int main(int ac, char **av)
>  		}
>  	}
>  
> +	if (futex_size >= 0)
> +		futex_hash_slots_set(futex_size, futex_flags);
> +
>  	requests_per_sec /= message_threads;
>  	loops_per_sec = 0;
>  	stopping = 0;
> @@ -1920,6 +1958,8 @@ int main(int ac, char **av)
>  	}
>  	free(message_threads_mem);
>  
> +	fprintf(stderr, "Futex HBs: %d immutable: %d\n", futex_hash_slots_get(),
> +		futex_hash_immutable_get());
>  
>  	return 0;
>  }
> 
> 
> Comments?
> 
>> -chris
> 
> Sebastian


Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B9EF9DA;
	Thu, 22 May 2025 16:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747930942; cv=fail; b=LjgRL+ZUiUyM2bRQoQVwlAE9Aw2rJ+2B3SogyS7wEQhF36dsqopCNlCKb8BrGLTKDX9Wk6pci6buUX36d5L4qyVAAkXnhidW/xXbBdTpq6x1Yh7jerO9MezSHCiRZQFU03PRDjgGGNuLn8e6sYGTtt8YjBbwcM2YSbZPGZrGCvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747930942; c=relaxed/simple;
	bh=kJvSWOgBjtttOG48JH/mch1OUsLLqStqFWyPmihw7Mw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Vq8n0MxzGOJw5LV2EV8w7SjXZakN5oHnV+mpggJMlOzAbI2fLq20fzdaiKS5SzSyFv+bsAjQinWPjPGkMo/f4bYIiRrVbq4AFXl81YbH3yegXFptVJfjrDJvp/8htmRC9mdAxJRxDTKtNsU0LqdZvAtPeTmW2yVfz/Qk1C0LqpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CNKp3NOI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FBBtjC4u; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CNKp3NOI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FBBtjC4u"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFtltR020537;
	Thu, 22 May 2025 16:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=LyTE0hEwbpujIxUHyoy8Twx+36dCsD9HlDvhoJI0PV0=; b=
	CNKp3NOIWANzCCuH8zn74wWEp3l9gVP0kTcLczrxcf3LxqeLf8S+YcTMQ5jMbjA7
	XDZeXizzlEWE3YuXWs2g63w50r2d8cvV6eTYEw/EEnj7RRfHOiOSUO29ob4e+WE1
	9S4a88sQvGx49exED/2gnWXKncvCh9qUzT6Y0FJnlOcLXXkDkpvRREGldnNEvm5/
	c+jqhid4THEcMLWY2v5HvA8vZLJidOclJV07AcEq1hH7if2/4lXcwx3QB+dyM46X
	uFrlhelJQfIJtBL8RnjxUOVjyO0dtB+mlEWiSBfD1xHnc+WaHgXZXWsRqrCty4FV
	/4s/pWybW/pf1YVEviJ6Rg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t5ws8ch3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 May 2025 16:22:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFd7Qa001799;
	Thu, 22 May 2025 16:22:01 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11010002.outbound.protection.outlook.com [52.101.51.2])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46rwetvwfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 May 2025 16:22:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnnRHMiBYiN4LMyGC5dPyhJ/QUmgqLKNkT3DiYnh2DgLsaYObLTpeqb8/3LwJUWe3bnXil2fu4CHCd7uqNpZUGeRDkbj0weJbp1gW9ng/QrZek/+IWYZLyaHYFboAgAShh5HV0rEE1kka9FgPfp8O3veyI6h26mTzD6cG2UN8v/sNahPdNHfYJhhYrwCKGwwh8Razx1+U7M2YFMBCiK95IAetCOzGDrS3d16EA6/M3c9dXOWzgypmLwSQxX7irWVnev2f8B67KxeHAv8Tz4E+P2lcmZLeE8yyX+uK+8RUmIQxyvG8SuUaaALsKpPZ8jdpS0Ido4sFzIgGhOj42YJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyTE0hEwbpujIxUHyoy8Twx+36dCsD9HlDvhoJI0PV0=;
 b=BuPYUEQGp9skgvFNQ15hcXBrMHkaHIhsykbWurPwE41mX6vKHYxewz1VE2lO9h/1JAebSl3pqjqqKIc4IVE6fKz7qYHzIOGAkhkeTvVBsL2TvpWdifQT64ar4aL1rkfyqR8uLIFGhwcSNkoVY3/Zt9QWi1hps1ke74eCx83ZxqkPRY0i96CMAjDsGPUvyQ9v5w/B+1rnZu4KoF7LLXvGlX+rgSkx18Q8N0UsNXyptu+NZEv+/V22CU9yVw1vM3FcvvbVh3i+xxPjXHgJfK4g/FWreznk2Sqr+Ys6sCQLoanNmFJI2hwCXsRKbSeVX9F1tEyhtytPbZhulABXZA1fGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyTE0hEwbpujIxUHyoy8Twx+36dCsD9HlDvhoJI0PV0=;
 b=FBBtjC4uni3GndcrECK6l3+MAAk3TjTJd6Qzw24qhuZBZALE0iVr1D+JWhW/oLyCxa3nCF/3qtDODK7LHN7R141isd2HcJgwvh3Qe2FXgW5HqY9P9zy6R4Lc1rofooJrzKXeSOkjCXmFti5/QCQuwiBkBSQJ4HqoFmf+h+ZhYaU=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by BLAPR10MB5202.namprd10.prod.outlook.com (2603:10b6:208:306::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 16:21:54 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 16:21:54 +0000
Message-ID: <3edbda17-cff1-4e8c-bac7-5cfed472fc66@oracle.com>
Date: Thu, 22 May 2025 21:51:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: stm32: introduce clocks for STM32MP21
 platform
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
References: <20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com>
 <20250521-upstream_rcc_mp21-v3-2-cac9d8f63d20@foss.st.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250521-upstream_rcc_mp21-v3-2-cac9d8f63d20@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|BLAPR10MB5202:EE_
X-MS-Office365-Filtering-Correlation-Id: f006b654-daf8-44fa-03f2-08dd994cc3fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlIzSFo1ZzBXTzNORmNxZTNNVTNBZzdjT2M1dlJCZ2R2K3hiLy9JTE8yOWJ4?=
 =?utf-8?B?NzFUZHY3dGJPWWExTnNYdzZlNUEzMW9ac3I5c1Nod0lTY3p2THZUZnZjZXJz?=
 =?utf-8?B?YnBSQmhHUGJnREU2Z3pzdkExRUtRLzlOZHRTMW5jR2VMV2IwMmc4SXduR3lV?=
 =?utf-8?B?UnJtRmlsUVlvTXdRZXVUVGZBOFNkVFJZT29wODl1ZEtQcVRXaklyWXBwRUtW?=
 =?utf-8?B?WTRYUFlQTWlKaGxUL2N4UGw5RUhTempyUFNiT2xub2NtMy9ESFVGR0JSbUFU?=
 =?utf-8?B?OEY4cmZSRzdhL1NGRlg2TWptZHhrWElJVlFGY2dDZnJjZUZkVThJZDFHWjJn?=
 =?utf-8?B?bG9SWi9uZUpaaHducU0waERiODFtUzRDek02ZGFhVy96M3ZtUWg2RE02NjY4?=
 =?utf-8?B?cFpJQVNYQUN3dE5qVk1MVjR0RXJrVkpBZTE2YW5jUnhIY2dKN2N5QVpkcUta?=
 =?utf-8?B?empUYjhDSUN2YWVzZm9hRDJHV0pWYjJ2bEV2UktBaWlvYjN2OGlhWGg3ZVZl?=
 =?utf-8?B?TmNrNk0vbVY2WGxBZU54MmVTYnJiV0hpK0FiZWQwS0w5RVREMnFTdjF4Ynkx?=
 =?utf-8?B?U3hNR21lQzN2RG83VmFmaVRTeE15ZWRKaU1hcldDa1VmcmZvOGlBSGRwallZ?=
 =?utf-8?B?RDdUcEdtQWU0bXhzK1NtRnJ3MkIxYStpd2lLQmJIV1F2bFlhUXloL3IvMjFa?=
 =?utf-8?B?UW55K3N5OFg2V2Q3NHBXOHdlaUd5ZzJidE9VakVoNXdkT1lOTVFCOUVUd3BY?=
 =?utf-8?B?SlBIY0U2Q3NqMGNjUERLdTk4SEVVbm9wZ0wxUGxlSUJJMmViVnVqZTAzdTFk?=
 =?utf-8?B?ak9TdmFwS04wam1KZ1FEUDBtWXBLc01zVDhQU201aVVoMWxQL2FQZ1pVaW9v?=
 =?utf-8?B?bm9vYUZZU0FuRWo0eTh2NWRGMVpIWWhRZEpSR0Nudm1PUjdxSTVHYlI3cGVM?=
 =?utf-8?B?cUhsOHJTK21TV0Jub216WGE4QklJdENTSlhzVCtURk1ZMEc5MW0yeVMvKzdy?=
 =?utf-8?B?dzU0SXpOd3VjQnJUOWxubFhWL1FQaVZVWTNkMHhDWHU4aUM0bHNZYk84cE9H?=
 =?utf-8?B?S3lZL1ZHZjBlUTB1Wk05OVBiTEpSaE01Sy95Vk1UUXpqcHBkMFMrcFBpL2Rm?=
 =?utf-8?B?RkFpckFxRkdGcUxkeXg3eWdKMGkvRG1EOWtNOG9SOWxsS0w3bzBHOGRJWTNU?=
 =?utf-8?B?dzlIOTltZW1saFp6TlNPWnZ2NnJWMXVoSmY5ZjBEalVPV3lNVzZzY1dWSUtr?=
 =?utf-8?B?WFZudFM1b0J3NDVTaUNUWTF0cy9paFZubEk3dVpEbDd4NDlSODU4THRTYXUr?=
 =?utf-8?B?Mk1RQTAwbkdLSm9QcnlsV3RpNUpkSHpuNDRNUzlIR1BsbFZZNmhuTGE4THMw?=
 =?utf-8?B?T291Q2VQQzdEdlNYSEExaE4zc0NCWUdnRXM3Z0VBQkVrT3JWMTRNbDE1REhX?=
 =?utf-8?B?NHhTUENvbW9nRjZQUUFKekFHM0hoZmI4ZURRKzVvNUlBcVkzN3pQYWMzRWFI?=
 =?utf-8?B?dnBRTmF6dDFxbW1MU0VBZGUyZ0prKzZEUG5TeTRldUowRHdRVTZJM2pPUE91?=
 =?utf-8?B?ZVQ1UCs4UHRlWEFjNnVvRGtBN2U3cGVjaWNQRzNLNmNJSGdrV05WREFLSEZY?=
 =?utf-8?B?eWJBSjlWL0x1VWptZWNGMGhFR3JmRlgyVUhLMDJJakpTZy9mNjl2Rkh6TlNm?=
 =?utf-8?B?VVRTZy9rb2hicTVoYVFDQ3ZJY1A1cjA5b0c5ZExxMXBGWDFMeHFweFBGS1pj?=
 =?utf-8?B?S09wMm9xeUNWdm5DWWt5cWNOT0pRQ1VlZVdxSFdPdXBFOUh3R2I0Z2VRRGM3?=
 =?utf-8?B?QXBRUklydlBHWStpcHpBemVENWsvZU9xNDhPK0tUdFRMSnpUK3M2Ny9McVdy?=
 =?utf-8?B?MHVCRW1NRkliR3E1cGZrMGNnWDdQSklCK0ZiMlo1bzZqajhFeStmTFNlcDht?=
 =?utf-8?Q?9hXeHaa2/gA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm9DT2FoWjNiYVJkM3ZTdzNmVmJ2ZXVWSGtEaDFDK1d4a2VWL1VGcktpSVN5?=
 =?utf-8?B?dE1ibnRmcFllMXZXeHgzeUFwamZGb05KMkIvM0dLS3BucVBsWTArWFdRdDRX?=
 =?utf-8?B?Nk9MQkw1T2ZSRytSNk1kaEdWTElKYnQ1MlZwQlhFVytlSGtkRHZEblJNaWFv?=
 =?utf-8?B?UnJuUTJhZlpNdGhYcVU2bm9UQVBpUHB3OXJEQThxK0djQjluM3Q0dkduY21N?=
 =?utf-8?B?NzUwVWVmbllmSGRJekxLdEJDelFDTzZYZzNsZWVITXFYK01QV0NYMzhUTEJB?=
 =?utf-8?B?cWRDSXBwNVd2TytlMVNxWFNLU3UrSzlWNE9QZjYrenNQT0xwc21jbUtLdDB3?=
 =?utf-8?B?VEpjeFVmdHY4bGZ2NTFTTk4xeDlRNFgzQnMzU3pvd2k4R2pqYlFuQWlDRmdt?=
 =?utf-8?B?OENUZkkxNUxXcGVkY2pKRmZRbHQvYmIrYVBzNjI2SnlaR3dBME0zaUZ3TGdP?=
 =?utf-8?B?WUEwL3NIc3dYNWY4a3NrTnlhdTFnYjRyN1hpaFFtUnVUT01zSFZqSEdGUUFz?=
 =?utf-8?B?b0dYZHBTbWR0VUkzcUFMRXVKN0E4bFFwTEQzMk9Bc0V6b2tFMkhMdUcyYzJD?=
 =?utf-8?B?SFpqVmEyenZoK1FiMFFPeXpxVjNBSmFSVmZRbVpKQjRzTE9yN0tkWG1KZWxU?=
 =?utf-8?B?bDlFS0lhWlNuT2NzdXNuNGtla3BKdG1FZFJtOS9nR3JEWnViNnpBaHZxc0pW?=
 =?utf-8?B?TklQTWQyR1pnYTBjbENzKzlQVFF3UjlaeithbWF4d01KbXluNE1TTnE1RWtW?=
 =?utf-8?B?ckNkaFFXN1RuRis4czVyYzVDVmIvekF4L1BZaCtjYlRTYnovK3lMZDl3cS9G?=
 =?utf-8?B?dUl4bEpXSS93cldpajgveHNYalI5NElxWDlpeU9iOE4xeHZkREdRRHRYcHFE?=
 =?utf-8?B?UnpTNVhJc3VYa045WWhmMHdsaFdkL2J4NVRocDc5M2xSZUd5SWdhcUV1ZUhC?=
 =?utf-8?B?cmxiK3dMaGJxSEFzSmsvSWp1VytjUVQwOFVoak8yYUVKeTVPMmxjeE1zbktU?=
 =?utf-8?B?dkdIbVJjWnRFNFQveStGY25VcHd3ODM2WDRNWW9kUTI2WmtBNWN0cWlVb2d6?=
 =?utf-8?B?endsWGNzbUFwbDNETkhJNnBObDRPWHhEVGFXWkQvaVc3U3lSbDlybm9qS0d0?=
 =?utf-8?B?eFZpZkNMc1ZwNmNQUDA5bk5ZckJrUGUwMlZsczdjRXhQSU90bEhCR20rL1hY?=
 =?utf-8?B?cEhsUHZ2RnErNHhpTFNsQnpwN1FUdU94MTdnZU5ZZjVzQU1kZHVLRGcwNGZ4?=
 =?utf-8?B?V2hWRFFjMi8yWGpRRHFkdTA3dldNbGkxZXo3TE1uOUlpTUhHNDFhZFZhVGhv?=
 =?utf-8?B?dXE5RDVrL3A5KzY1K0k5UlpVSXhmdmVkRTBOYk5NSDFZcThqemU0TzhHMUo5?=
 =?utf-8?B?b3k0V01rK1dhV1Q0VjlPUG1Zb1E1QUJMN2NnanhGZVJoVnMwMDV3eWo3aXdj?=
 =?utf-8?B?VjgvMjNUVVlhbU1nMnV6cWdOaGZNKzlINkthdS93V3I0RWZpRldWUHFBNFhF?=
 =?utf-8?B?UU9mcThLb0RLR2J2bXdTS2QwNlEwWUJIRkZtMHN4L3hDbmw4K3UwMjkwazhY?=
 =?utf-8?B?a1VtYjRUSWxFRWpjN0Q4azdMQXJmOGw4RDh4OTE2eGhaWUZENGc2V2gxMnFt?=
 =?utf-8?B?dW9wT0RXRVo1bnZiem9FNGVHbW9JaUd6TzlUbTd4NmZ0WWx0Z3dXTmJxQWtJ?=
 =?utf-8?B?NFZUUHFnOWlaQ2EyN2JMMWNiaHFaNzVYck43WDNpV2EzV2ZpUU1DKysrY2Zm?=
 =?utf-8?B?dlE3S1J2WjJnT0FRS2lqWjZxbklJdDJ1TytlaFhVT1NXRnhjK3ZGY0dYdVpr?=
 =?utf-8?B?d1BVdjVGNHZ1Wlh3RjlkQU5nMWp3YjdaNjJPV1UzZFJQQ0xXSGJjVEQwaUIv?=
 =?utf-8?B?Z3dYNjcreVlGcElsU1ZYVVMxdE9XZmxPdHZCUmZnSUMxS0ZDRWlkUGloTW1P?=
 =?utf-8?B?UENkakd4QVJBdno2MzhHWmdqcUU3YkVGdXB3UnA4cjBzRDBOZ1VsbWdWL043?=
 =?utf-8?B?ODNaUFJHMGZadm4vQkpvZkVxS29WMjBqVEE1OWNRTUtYenFSZnMvcUM1cWZi?=
 =?utf-8?B?UXpCcklEbkdQOFZSU2NROVQ0Ymk4TThsVENSZXlHL0Qyem5PVmM5dmYrZ2pV?=
 =?utf-8?B?ZVg1YzNRRnpmOGVTUmZOY05xbkVNZm05bmQ4TFh2TTF3NzFTRTZqMGtSNmhN?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1ePzypyzGOIXLjHxNCbUo9/2TksoWKDsCHJH4Q4N98yoHuOPlAFSmCv8FPDPaEJ2SU7TGR+z56T/KUlwPqNyecBMySaSMNBxIF4DcZk5TVS+rBHxdiAIAtXguHJlt0L/MSmfpHb1jYxat55qcFX1n628lCm6jKAvMAj9GirfPdEqtDTpjDkxM9Ng5y9X/aQtshLi9nuWKnQXGBreD4+U1DdbUIUapReLBHbC0fWf05cLfQ7GT6f2eylQSkikAoxgV0b+4P2P7DOrMsSk6OP7oYJypjdr4IK+TUMHROqClfFcnTSxOIdy0b7uzkNJy2kmVXOfOGUvFHe/38Vuj3+LKZlhNg9hv/JbwbYk3gI5iWml+eBs2kmq9DNXsmcKYB4+ob7JFHA9DSYg1CeuTmGxbuXhAvpMBr8nCYuHzJ5VTqC2t/3kv/eNyuYJUAKqUoghj4uoV07rNPhY9dP+7VR83sH9LPHf2MRDj/on4cj9jVxa4iBUNhfzj1QGQhDESCJlgyQv98sd1BmDumHwFUjOaf3vTSxbVx1LjwdpBQHb1li9vFR31ZJNbKsU5ou+hSN8A9rDhRIA8PqWTQhOiONc1b9nbVS6qmHvrjPoycpbGOQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f006b654-daf8-44fa-03f2-08dd994cc3fa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 16:21:54.4438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOISriJrLuai23q/DO04Vr+cvzNpbMrHboazjVdawVOnSgl89KOJMzF5cnusOF+9Jlkt5n7ksoFrPpy6OFZVbDEF3tpUgpzRGJzaqq9AP2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5202
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220166
X-Authority-Analysis: v=2.4 cv=M99NKzws c=1 sm=1 tr=0 ts=682f4f2b cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=8b9GpE9nAAAA:8 a=yPCof4ZbAAAA:8 a=VaK7QfrqWub99CTn_GQA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: B1ZXuAgC167W0gWwqzqLZPaD-DJmn_uL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE2NyBTYWx0ZWRfXz0Cql8d5TUd9 37+XYHqzqeO8TM7DzdBLGE/EdLvGYsdAhA0PbL5xo7TycSgGFO4Qp2/Ge13F9GIQK6auPmfNOi2 EICuQg89l5TGN59avdtpkOH1kOtVQW3gkr5nVgARt4AjkCz5mJTVzUkWVIak6zr4myulCB8cGJz
 UbOwF4W/AdFyov0x2vGaP/u2jZM3nh0tO3YsZXLcNk1WeE1RYvAHc78J2ynP+2EuD9HgLnwnIFd c+pNB4JQwVMKGFliNj+hv7/OVBChUsDfI4y6ZS8Zo3GZvpCVpd+EyyS6A/LuTxFj+FnodkYoots c4jeD4pDrsLbVcAn9rGTm7yQ1WZ+sldNJmLYLr2GklufFhdiLiaNZC8E8y300O85EkVPEJKxpA9
 XlvyWi5e7bpqDgsi4Nb1Il3remqLGYVZ5aLPx1zoXRGwyRM0Bp9OIjV1q1gpj1bCFDlq8HLK
X-Proofpoint-GUID: B1ZXuAgC167W0gWwqzqLZPaD-DJmn_uL



On 21-05-2025 18:08, Gabriel Fernandez wrote:
> This driver is intended for the STM32MP21 clock family.
> 
> Signed-off-by: Nicolas Le Bayon<nicolas.le.bayon@foss.st.com>
> Signed-off-by: Gabriel Fernandez<gabriel.fernandez@foss.st.com>
> ---
>   drivers/clk/stm32/Kconfig         |    7 +
>   drivers/clk/stm32/Makefile        |    1 +
>   drivers/clk/stm32/clk-stm32mp21.c | 1586 +++++++++++++++++++++++++++++++++++++
>   drivers/clk/stm32/stm32mp21_rcc.h |  651 +++++++++++++++
>   4 files changed, 2245 insertions(+)


Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Thanks,
Alok

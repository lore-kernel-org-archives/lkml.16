Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F94963A9;
	Sun, 22 Jun 2025 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750582745; cv=fail; b=iC0iFESogHElyPfsa2jCDFCMBmF9IVjHHHokUgg8CwVEszZsdcrUbRa0sb4JbrPaDyqCKHzYk1M4Z3fSIUMo+2we1oBVSVLIT3LXOtofFREZzbzmlRhDMgOp0OxWmyGGBc2dRpgZ3M8kjBs6/UlXwV7/8enztCH4n/KNoJPSiUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750582745; c=relaxed/simple;
	bh=nE7YVWuq4Y7K0LQY7pip+g9gFwD8Oqz6lfSNKUAFh8c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XIykrEi/lOz2m+oD65FuDwje4u1S4WdN0qifRzobEJ7IhsouJHSZD20H0D/WmPmlbmCX3EjT/s8CY6P3EglP0uw/KvIbgKx1AxBChwi9GlbpUSHLtrPd7a73wW2Ue3M5FoxcIICaviOu873dnnF6iJScRGya9PyF4ndABlmR9ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZlMq1JxZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JLQ2IJHc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZlMq1JxZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JLQ2IJHc"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55M4t251021397;
	Sun, 22 Jun 2025 08:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=lI6JkJdH1UIz/F7eVfJl8sSEzbaai517O5Rhm3m5hos=; b=
	ZlMq1JxZfW6RXML0rFsYch30BqwJ5NdeEXv9KKZ6zk16MrZBdBTxr2YxsF4v2VRD
	kiiZmbEgB1+SBanwVwRGi/2xkmAq7YA63S05Ge2psr7YYtuF2SIiN1LMX78cRsQy
	OveXYDPhI8Y8R3STWQ/c1Cw4BFMD1/QRVnFa79kPl8dqoMINCdx1dQHGxzfrF/I+
	A28fRHjM+yOAQ9mJjAswIkjyEsGe3aszFXSD5EiPOrPDw5p0KZ9VDeqJIcPvmAvc
	XpBF6p9ZYo5/Q2FSWOuWq9TPX+7tGkzlGmE/zfeYBg2NtqoQb2E0U+O0V8tnxKsO
	aVzV3bbN7uGrfk4VlDBrow==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y0yp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 08:58:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55M7C0hk025284;
	Sun, 22 Jun 2025 08:58:19 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2048.outbound.protection.outlook.com [40.107.100.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47dk6886t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 08:58:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfKvLNPkcPUpLrXLAG0MH3UA5ntomdkcPZbtb+oR54Yb7edHlx9r0HqPv9vVyTJzXt+YF5KcWGH8BRFmUOv3yelvCTekbaG+uFgQVfQL3XYqxG3NWR2BqQ48RxfbxKOH/rJ7Cjih9nithN7pQ5p6GAVc5aeUYzW0xABN4tZsMgt13VyGGHj2V9PY4OHXd9cET8wK2fuKSudcAeAYJr7rcU8w3gAsS9WfRg7s/y5xY3keBhiiSEQnW6oxKIUWoWS5Rcs43nWJ0OFjvr9oI1X58wcZZcRjgE6KtnqVlK5x7I3Zh+vL7yzw+C6J2v7Zx8y3wnBrLK/Q3k1zcqPT+yJYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lI6JkJdH1UIz/F7eVfJl8sSEzbaai517O5Rhm3m5hos=;
 b=LvAD9MsUUbr3FALVvTqvCUpLtydiTdYmfgCM/QnGgBOVFWXnuEBYg4x+l9W7cgRVffa3CWHQQFGdSP4S2S3tnRobZ+OCl2f/HM8DO4Fn13KssL9wDOYU2/SDEtmRX1OsJsCAk8MD21/Vo/Tc9ICzDi4DuatzjSibVimp49uTNQshHLf3hETljSu+K18uijDwQITiv30xV/u/Lj96V38Dvl/1oserqM4OOo48gx53KyoGkW0zyEH/2amntnUIc84/k6gVQx+5iv+aPzvi8EL3qGxjVz/QjARMMBIcN9lYdJCT0le5DSfHF01zsEe0Iub8Ykq5X89o56AQ0w8/IQFTyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lI6JkJdH1UIz/F7eVfJl8sSEzbaai517O5Rhm3m5hos=;
 b=JLQ2IJHcOVyWK5K1ly6FK0dQN4p7Lcdo24gaaNFqqDUBOkptZMSPyn8+bXabqNHbzmLnfJdQNGgWfYJOfUh+X8uy3g71q32ORYshJCWXosGZqbs9oQcCo32Emdf7yjWclNvxPP3VIuRmnrSNMN91tCg4sTtTUi1QoNS68V4p8pw=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by DS0PR10MB6055.namprd10.prod.outlook.com (2603:10b6:8:cc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Sun, 22 Jun
 2025 08:58:16 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80%7]) with mapi id 15.20.8857.022; Sun, 22 Jun 2025
 08:58:16 +0000
Message-ID: <75f99fce-affa-4acc-afeb-2a9f70a6d907@oracle.com>
Date: Sun, 22 Jun 2025 10:58:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] Documentation: typography refresh
To: Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Akira Yokosawa <akiyks@gmail.com>,
        Carlos Bilbao <carlos.bilbao@kernel.org>,
        Avadhut Naik
 <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanislav Fomichev <sdf@google.com>, David Vernet <void@manifault.com>,
        Miguel Ojeda <ojeda@kernel.org>, James Seo <james@equiv.tech>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20250619042318.17325-2-bagasdotme@gmail.com>
Content-Language: en-US
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <20250619042318.17325-2-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0275.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:373::11) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|DS0PR10MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 44eca7e1-62ea-4033-31c5-08ddb16aed00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVZnVVJIYmlZRzRzdGg4bjNudk1yTllFUDlTTWM4aHZHRENHOWxtQkIrTVBo?=
 =?utf-8?B?N3R0by94VUpvbGZLMXlzdUlNNXJrVm95czA0bVZ6Z2VsL09rTkRnRkJ6bFBi?=
 =?utf-8?B?R25jdnJtV1BmRE1NR1NObXVlMUxnZ3VyN3l4Ti8wQk9wRzBMc0FQUjdScGtn?=
 =?utf-8?B?b0xlNkw3N3JXWklTV2Y0NXppOFZJU056NkRIdEdXK2RZTTJ1Q2xlMmVsai9I?=
 =?utf-8?B?aGpWbzJlYWw4UGZIUUxtQWI3N1d3anZDMFMxNXJmL3JSV1pBTldoZnpqU2Qw?=
 =?utf-8?B?aENaMTNHK1pBNmpJOUlaVkxwTmtoSjFtV0hrcjl2NDlDWDF0U0JkN2JZZzJS?=
 =?utf-8?B?YmtjblV1Sm9Dd3czQUlVWDRUTHQ3STNBQ1dPYnoxTDNVU2c4NnpZT3ZWMGVV?=
 =?utf-8?B?emQvaHV4MWg3VTJYV1MyWDlKVWtxaTh4Sk9Cc29YaDdJcDFTS1owY3ZpOG1G?=
 =?utf-8?B?UWdrcWR5YkppSmVGaTU0aXpoVGRpK1crSW5Od2ZHWjVMLzZmeWVienFVZnF3?=
 =?utf-8?B?dk5vL0tOczd4UUpNdFllYjRROTRvK09rNXU5bzV1RlF1SXJ6WXlBSC94Wm41?=
 =?utf-8?B?TmVTRnRqK0swQVVKWU9zK3Bhc3IvQlBsSXhmS3dqVG5TaGd0dUJKSTdwU21W?=
 =?utf-8?B?SG51a0s5OE4ramV4eFVPM3pQY3J0UjZHMUc0ZGZEWUM2U1FIQTR0blhKZFYr?=
 =?utf-8?B?TzVZUnhwZ29SamszMmVETUM4Qmk4RmYzODB6WHF6S210K1F2bUU0OWpzeXFJ?=
 =?utf-8?B?ZnpTTjFyRjVrelhhZHZ2SWV6RGc2WWMzaG1WV3Nrc2NoSkRkZkJmRXVveEU1?=
 =?utf-8?B?K2JiOWduUTFkbUV4V1kzZE8vSVBZYSt3RVNaL0Q5OHlSNm52VHhLdUZPdHlu?=
 =?utf-8?B?VTN4THhTQ0Z3ajFkLzBvSkhEek9mejhaOWY5RXRwb3FBU2VFM0RKYTJkQWhP?=
 =?utf-8?B?T25Cd1p5US9lRXVSc29Wbjc4STNKN09HYzFsck15Z0dCOWJMMTViRk1OZDYr?=
 =?utf-8?B?WmpHQnNlOWdHblIvRUZkakVsbVQxRUVhYzdMY1VDSEJwWThob0IzRXEzbTVP?=
 =?utf-8?B?MmJOM2xtSFIweHBWL2N4dnpUSlJmU2RmMTRtN25EM0Z4cEc2cEE0bG1YU2JW?=
 =?utf-8?B?clh1VWVuR2VteXlwK0FJMG00SXE1MkN0dHB6dGpOZGM4bU5iNHVseTF1U0FZ?=
 =?utf-8?B?b0dvVEhxemg0Rnplc0F6YmxkNGhYL3NMK2NqakE5WENXVWZyVjBHeFdoS1dp?=
 =?utf-8?B?aHU3U1pYSlNFTUxUc3htUnJVZTlydk4wTkZ2Tm1ab0YzK0xpWXVmcU1YaFRx?=
 =?utf-8?B?d0ZtZ1ZnT0VJL0ZyMXpZaHZ2WmdxalJCRHBlTTAwOXdwTStxYk00bGQrODNS?=
 =?utf-8?B?NTNtcDJFUjdEUHZmSGt6N24zczZwK3FXVCtzNHVCUlEwT2I2aWd3SXMrVEJS?=
 =?utf-8?B?VDRvR3FwNitJK2FmMVZNSlRmYkl0c2IxSit4c1FjUmtEVEFEUmFnNlE4L01a?=
 =?utf-8?B?U1dEYVAzaUhnQm1JTS9pcVVDUWpEK1gxK09GZEVCMFhmTlB0T0c0YkdUVnJl?=
 =?utf-8?B?Y0ZaQ0kxaWYzV3o5c0lXUEJLK1d4aVpuOXFHVGZHTHlVQVNoMFpYMDFkak9Q?=
 =?utf-8?B?ai92bmJYRDVEVk4xR3J6M2FyMDJyNE9OTmtDako5MlUvUEJNRmRzZmpNS1Fu?=
 =?utf-8?B?a1l6ZElGOWZVZmFpM1l3REVrSEZaTGlyZUlqOEhSYXZsd0NvTzRhc3lNOU1y?=
 =?utf-8?B?dExJREhvMDdNWW1QOVowbXBEdEVic0s1MVdOSjdiTTA5TnJ0Q2Zub2VOYUJJ?=
 =?utf-8?B?K2xPMVVYenNHVnJvcXZNUkpYa1RSWW8wM1R6Y1pJdmVYRGYzY3lpWW1SdFAy?=
 =?utf-8?B?YytwcDhPcHhlelR6RFF6aVFMS3p0OXh3VFBHeUlXYm1YckFPSUFKTVBxeDFz?=
 =?utf-8?Q?LNl4pXunL6U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHFvUFY1SFBVUzBmdHM1d3JmMmJCbWxjY1dyNC9Jak9DQk92cjdGVHlLaUZG?=
 =?utf-8?B?VWQ4aFR0S3BSdHRSVWc5VnhWWDNsS2oyenFJVnpmUXZVUVpxOW9tTkJpdE1L?=
 =?utf-8?B?SVROaldESlhnMnBIeC9VOWdNZzdrSm9pQjQrRVhnNDJDN2hHYmpVcGg0ckR2?=
 =?utf-8?B?NGJKOXd6VkQzMVZOU1dMSmpIRDBBRitTQTUyMHBlMHFjZEZ6dmw0TmY3QmtU?=
 =?utf-8?B?RFJWbFJjNWo2SjhhUUlXcllQTTdDNGNlM01udDdRVUxkUnVHbDVsWHc2ZjFL?=
 =?utf-8?B?TzYyM3V5VThDVjFTR1I3N1RVOWlUczhHTTFJdUxyYytnZnZUK0x2VXdudTJk?=
 =?utf-8?B?VXN2MlRhOWhCbTE5MHhrN0J6bG52c2o0ZHFOcUJ3eXpPYWxidGNGTUVzSkht?=
 =?utf-8?B?LzVsQ29MVk93aXRINE5MSzRLNXEzODRvNURxOWt2S2dSek9KRnZPNFJRQ2JJ?=
 =?utf-8?B?ZmlRRWtlQkFqRTJtOUdGLzZramtzU09BRXJIbWllamxzZlZoaE5mNXEzcFM5?=
 =?utf-8?B?Nnl5Y1hhSy9WcDRZU1ZCdlYxYnFicFF4VlhzYTBPK0Jrc05QamVtWUhkTzJI?=
 =?utf-8?B?Q0FaZERRQWxVR1orRXRPL0g0dTBlV1VoVm9oaG5CT0JGeWFOVUdLVVBreHJW?=
 =?utf-8?B?bmxGRVcrQ1NqNU9mOTYxNDQya0tXaEZJaHFXVi9vYTlaeDk1MCt6Z2dSOFdP?=
 =?utf-8?B?bHkyMnU2dm1WUkVDekt2bGtkZmdTMVFZcTE4Mjk4S2VUM3NWMm1BcGhBVDNQ?=
 =?utf-8?B?cTJKNkhoMVp3Y0VzbWFqMFJtYUdyaTJjSUNPMUN2alB1M3VHTTJzN0c3V251?=
 =?utf-8?B?dmY3VGViWURTS1RpeURpV09YUHBBZmFNMXc2b0g5NGxZeDN3RXl6TzYyd3l5?=
 =?utf-8?B?S2RXUnZZTDZqV2dSQUtxZndQNjdTZzRNcDBxUlkxRitaUWd2ejV4aFlDMS9r?=
 =?utf-8?B?bjM5ekhrcURUYSs0ejZzWVU5cU5RSmVtRXdrWk1xamFJT1JiSi9IWnBEVHNM?=
 =?utf-8?B?bUlSd2JTT05Udmd1UGFkZXVpc3VhWm8wWWN2ODNlcHorRnBkNzZvbFp2VHdC?=
 =?utf-8?B?ODlDRUFPQVJ2QlYrL1h1N2FBRUhieUQyeVNtUGFyZVF4Z0dBM3lIVTZDQjdN?=
 =?utf-8?B?THNyeG9Zc1dEMkxERlFiMTFJVG5UR2czMGZnMDVic0syNDJIL2RNSHk3QVFV?=
 =?utf-8?B?d0k4SVVzMGx2UmZyMWJqQ2JLQ3ltaTR2Sm1lNzlEVng3ZDNERTl0L1RBTXk3?=
 =?utf-8?B?UnRkZmw3U3pva3oyVVMzcmJ0VjUyRmVvcnRqT3hlZzB0WjFvNHJqc1Y5ZEpL?=
 =?utf-8?B?RTc5QnBRbkY3T1hHOW1Jcmlsd21BTFltM2w1MDlxY3pMNDUrWlpZQUthVEFh?=
 =?utf-8?B?TFkwUlQ0OVF5YW9VOGx3YW5wTk93b1BMZ3cwc0V6Q2FGSWh6aGp1VHo4L2pu?=
 =?utf-8?B?TUN0K3k1RFRGSy9IT1N4Zy8weHJhM1JiUHNDUlZqZVNhRzZnQWcvNEpPelYw?=
 =?utf-8?B?Y09tOVlJNjlmQUYzZDJWaFRJb0tTVndERWJBSmNJaWphem95ZUtOK1AxZ1Vu?=
 =?utf-8?B?bDBrUEZKOEJ0ZXh0Yy9jUDFoMEU1c1M1Z2FjN2RKRWo4dTRNRDlVM3NzM1VW?=
 =?utf-8?B?bDR3UmkwSjl5NnA4dC9jRUo2S3RjZXhwU3dVdHg4RGRSaThWNmpDK2ZaSlkv?=
 =?utf-8?B?RjhxaFNQK0ZiY0NpVXRwOXVaeEU1OXo1eWVOUkUvNHdVdHZjbE1EZjZUODBY?=
 =?utf-8?B?blZHK1NQYXhwcjNpNDZVT25zbzJvZDFYa2NXY1F0cW5YNFNYQ05DaG1jdGtM?=
 =?utf-8?B?YVZJR1FLblJXbjFpa1hLTlM1Um5nUzBaOGhMdkNGd0labUxEK0tUbWNaWjRS?=
 =?utf-8?B?WE9SYTh3ZnM2VmNhYTlWcGd4a3RBelowTTl5NEdnSkxEdGlDUzFSeURsdFIw?=
 =?utf-8?B?NDY5Y2RrVW9ialVsMmxTWFM4Tjk0ZkFIMUNDbEpWZHAxMk5kazIrNmIxSjhC?=
 =?utf-8?B?cHNmMDUrdzE1dkxSZ0lVT1lZTmlCa3djZFZjdEpvUm9FWHhPUjdwUndaRXJL?=
 =?utf-8?B?SXA1YWNxS2JlZVh4UCtwdXZHVGZHcWFwSGhmenRiT0xxTEhOdERqYi9WOVhn?=
 =?utf-8?B?Zy8zZVprUXVqSGgwRVhnV2xDS0lQSzVVRFhXdFp3UENGWXZ3U2FjdEkvL1hO?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rGfzh1gIe/ZxbAlPzYuOt++YvG1xCTuCa/0P/168VR/oAiqJkgM55jgWfch1yD+csH0lRN8D5o7pL2dvc2O2G8Hm57UvFRNgps8KbJI1nlxucqGV89twqZYXSwH4SRNdGZz+aZwYzIFHQY1VQ3wf81YsLbwlYtBW50pYUkWToe6NpDBvVjqlyPKzyq47HB9mCqd22MhGWcam2plMZmp1OTsryIQxpJlOJwlRzKyqu2brSy38BbX6vrZpADZ9BxSO8oWwK8F3LSU53s7hDphOcNPvjITjijoTtDMUv8fvMM0DCZ2EHMuQY4KOJn/QCJf/Priby2WqeMPLoM/dAqSzlx864cKaIZe0idZfjKoUJFQSZkPjDtmQBpyL4qStmOMKxaaJSJM8Jm7h1KU8VDcTQuXlfO+j6b1HY0aW4ipWYw2U5LCvraLAhdE3V10lI5td3D96jd17sKFm8mrf8YZRi6gzhsCTRQph4R6eYVYCP9uQZo7k00Zl3GztOtFtz0w7VG9GW/2D84Hbni60FSEA38l3FtN674gggrpUPdUQgiGPLCdad8sWhGDRXp47/h/i/FMNg2dupDXhGi/eivVe/itdRt5OnM33Ym28T2SSMmc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44eca7e1-62ea-4033-31c5-08ddb16aed00
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2025 08:58:16.4063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+DeftPWQh+esjr2HckXiBpKZhIeLRTQptDRUChhBL2DUJpbn919t2YFddTQ4nYrRTVN+HbStwvq2jBWYkuPoGRJYNzG32kOTlEtQHJLoFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6055
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506220053
X-Proofpoint-ORIG-GUID: hht_hyl3_qIDPCcYBi13-w4TNGbNn-7s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA1MyBTYWx0ZWRfXzedQWiiYxKrn pbuXAq9uee848c6S8Ll6wwuP2cMFW4bp7UaiGkd7rNKD9nbf0mGTRC1GAMDDeBNqrr8LZC3fh+u WAmF7t4XxMGd6vunFzWv3N6GDwBNMz0bGlIP8oq5qelXMU3pQjriCZMAWtmANzjMgEOiM49fiSd
 NJ5Z38hxzQZXw7UjG5aDKxn8q79OIraRooQyfuO9447sXn6bFvpbGKG/fjykvT4tKmIB7Zr+OiK ozsJBthALdEk35SlWDK15zJnyoLfmJPzUKoYDHtejyInZDLi35a2P30K5kUKqeBx8u5fiyDTi7X gYTGJ+nGcqizEgO7Sl1jp+EsvNsc0rkkEs1vYsZKJz2DApg+OVfCG2Zw7+V6YVK4Kr9fWW5v1ZH
 UhO1rqZ5TLDLT+Zo4ndxFerG7lzgjEWM5L40H6N7x1VAU7KPUkqIwAzmgQwmbE0rxxugLhia
X-Proofpoint-GUID: hht_hyl3_qIDPCcYBi13-w4TNGbNn-7s
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=6857c5ac cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=w8nDmgz-34BnD_96SnsA:9 a=QEXdDO2ut3YA:10


On 19/06/2025 06:23, Bagas Sanjaya wrote:
> At present, kernel documentation uses system serif font for body text.
> Some people, however, objected to it and instead prefer that the
> typography choice must be legible, consistent, and accessible (after
> all, the audience ranges developers peeking into kernel internals to
> ordinary users that skimmed through Documentation/admin-guide/).
> 
> To tackle the problem, follow Wikimedia's typography refresh [1].
> For the font choices, instead of using web fonts as in previous
> attempt [2], use:
> 
>    * Linux Libertine, Georgia, Times for serif (used in h1 and h2
>      headings)
>    * system font for sans-serif and monospace
> 
> This allows for more readability and consistency without sacrificing
> page load times and bandwidth, as the font choices is most likely
> already available on many platforms.

Hi,

Could you share (links to) screenshots of the new look?

I know external links are ephemeral by nature and we prefer to have
stuff archived, but I think it would really help everybody to be able to
see what you see after applying the patches without having to build it
ourselves.

Thanks.


Vegard

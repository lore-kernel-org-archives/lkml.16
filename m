Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5FB1FBEA6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 20:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750450141; cv=fail; b=aO+q0sy7ECTD504RtauJtUizmPtNfRhgrX0soj+/BGsYyP0SCKBYA5xOzV9YsFaymC7GOK05KOnGYdnc+VCVZpcyI+Z+oQzjYGAMd3nhBmv5wOUIC4vy3WibwUooFTnoVG8eiM3i3Hk5d/zn3ijwSRlKTShDUOe6aouH+JAqJtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750450141; c=relaxed/simple;
	bh=O6vghyCTg1gx1frB9DYB02iJeRCrLXpye1sdGSsMn08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Oiv0UBqi3MmulTF2RdGn5Q60Y/cE2rFdI5haEMO/HFZfVS8j4EwoTH3uNhDUByOoM3FQdT7zTHRGvpJ1J7R+WMH2kPcTsvUp/5XIuP8Ptxvx3afgdj8MdAc27zqvwCQizcELwglC3Hxl9DeeNE4W95SzRdoxhgsBChT68p4jugo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ALRPI5oD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IIadwbEn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ALRPI5oD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IIadwbEn"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEBpYt027965;
	Fri, 20 Jun 2025 20:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=hhuRZ8gV/78Mr1ArP38mH8gRHKCtH0I88VrXPSb681Q=; b=
	ALRPI5oDgA0NzBI7cabwwyaVPjHs36fah+nHOHdVAIhOSjQu5u43UdSHw6kzdw/8
	BqiNiImne3VXcDnw3VRiNEeENDvmvc7ZxP9n6JaYO2ydVVlQ4nbJwniRW0j5QB2c
	R1GgqKaLby0O6uQQNZ8cxYjm99ZeUY1wApxboyQUrGtRVvVs9bLpwjkOjUzhYB7O
	YeQRMXu6BjfPAGKeTzLqPa3kgbTEN6lBwR/t97Jpir9kB5kXc3q7aSCkDiGBjYjq
	gbXW5/jB8DWKrtKa2xjLeLPCBsyHzt6/faoXyzfCowjBII56rFAuorWZ6ZY6guzR
	4Rshjr1ffr5Y2BtNlSreBg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xyx51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 20:08:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KJHwgR018393;
	Fri, 20 Jun 2025 20:08:46 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhda4pn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 20:08:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YcJ26rNNGElx2woS1qIJ5DrN7FExEFZeWLM9Bg6b1a6Kyx06W3x587IKxqfiYHJt/cX2QYTZjAdI9j9go6HH2vqQcTHFrQwfzjDkSXiYf9Y2nDqQQnNsV0wfRC+mu9YsRrhwb8y41/7+UWpZUcOEE3BW6EcBlb9sMlewDN3vc9K4Y2mD3quz8DW0cxddryLdZwTfHmM9MmNtUlYgXyFpivyUhY+tL3cdGerzqX1nl/UziDowitXmYncL/guFMxh12pu+7pHWQH+Lb54vR9LjgXuvTkdQj9rdA2FWE79t3Bl5dzSlHKAd56NIcHXCuqSJlSvHpJNyhjtnFU2D+VdgtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhuRZ8gV/78Mr1ArP38mH8gRHKCtH0I88VrXPSb681Q=;
 b=iwx/SmvjFhCYDaCX8AGzblgEd+GPkkSGr8IfoCWrJ5HVvWBL/a1i66NRoyzQTyfTj60MqseJqHuU0YAqHX6aHbN5JRBulZupXax6b9C5Uj7yPa7KWEfod5jKINj7WEjHxv4Xgc6R3YGb9rj7FfVR727D4E1xphgv+MEsE8t08mcnC+U1z3J+kdMMkWLwkvMUvnkh6n5/u15h9VOUk/MXLxwIUnxNfsoxWcjBsMz6hVYPIXnjKWrfd2kSrW6AEb2k7OsEN3f5rSz826/VF6iW0ktnwQ4YWiHTpDirel+zGmoXsVjCCzpq+m0EQ5nA6gpjY1C4UkWterP272jHKTf4og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhuRZ8gV/78Mr1ArP38mH8gRHKCtH0I88VrXPSb681Q=;
 b=IIadwbEnz0Qc2eb8ctZnDP6Yl+w63ubiu6VefSbaZ5BqHBq2P2kVUAxtRfr2uAiE+STWXyOwc0YeUyKNgF1CZYCrfdP/0QoebLYQIP2SHsaVpRkHsx6H4nEZeaGlUrmbsS9oePU8Bm8DheQEm9yswFlYt4rI8ykCZgv7kqHxKCA=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by PH3PPF8223ED5C3.namprd10.prod.outlook.com (2603:10b6:518:1::7b2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Fri, 20 Jun
 2025 20:08:43 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 20:08:43 +0000
Date: Sat, 21 Jun 2025 05:08:37 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, oe-lkp@lists.linux.dev, lkp@intel.com,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
        Adrian Huang <ahuang12@lenovo.com>,
        Christop Hellwig <hch@infradead.org>,
        Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info
Message-ID: <aFW_xQdFhjeFTeq5@hyeyoo>
References: <202505071555.e757f1e0-lkp@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202505071555.e757f1e0-lkp@intel.com>
X-ClientProxiedBy: SE2P216CA0072.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:118::20) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|PH3PPF8223ED5C3:EE_
X-MS-Office365-Filtering-Correlation-Id: 40305c5e-b825-4819-a7e6-08ddb0364178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnFBenZ3YzRHKzViNnlZL3plcitQTll5K01DWFNaYkl6blhib2FFdi95QmJT?=
 =?utf-8?B?d1JDTHVjdldFK2VoRHVNRlg4ekRxcHZqdFRyYkxnNmIxR3pTQWdpYlhpSmYw?=
 =?utf-8?B?OUhuMUNVeVg3RktrNFhjcGlWVURNMnlWNDZMRkhUdVhpNEFsTEtYY0JmSWxl?=
 =?utf-8?B?c0JDSmluZThxK05vRkJUcXBRb0I4RnlZb2tMa2JhN3dVVitoRmVNUHR4dFlr?=
 =?utf-8?B?eHlJT2hOVHhXMCtjZkpTdnNQbFNrU0RJc3VGbU1LNVh0enQ3aERPOTJTbFll?=
 =?utf-8?B?QkJwUXlxcUs0eDZJYnIxdW1UU01wSTdmazlYTjAvK1FjRTBMN24zR0RwZDhQ?=
 =?utf-8?B?Vm9FS2dFRmNFYXh3U3NJOGdGT0VtYktvdnNOQVh3ZnUrQzJwOC9TcTlWUzIy?=
 =?utf-8?B?TWJzZkRaSnZnZ3lYUEluckpib3p6NG5nSG1yWUhCSVZvVDhlNWFkdWpLTXNK?=
 =?utf-8?B?clovU0VqalhiM3R2M2tSTXdWcVF6M2UxK3JTdy9KS3pFOGtnWE42MXlwQ2VE?=
 =?utf-8?B?QTNnRCtHK212cWtKYWFFUmU2UmpGM21EUUJ1cjYzU0hmTURlb01sTzNwRXVn?=
 =?utf-8?B?aktuMXh3QUlGUi9vdjF4dS9FT2FBNkZRcFgrV2VvSUptaXZneFd5TjhVQlNv?=
 =?utf-8?B?cTNWZDMwaHdaVXl2V3R2djd1NFI4TjZ4VEFEZ00yZXRidVZad2ZYTkRkZlE3?=
 =?utf-8?B?SzNUc0p0R2tJM1NGeHZLTUtNOXBTUGV3bkZVcjBmcTMvQ09TNUhjRHgwYlBr?=
 =?utf-8?B?a0lHRkh5bTNNcXBySWcxekJwZHpLUVljcDdxdFBIbDhtZEZ2ZUI3VU1mOVNG?=
 =?utf-8?B?YWF0ZGdkd0FGWG9JRnIzcDdlRGc4bHMySkpSVTg2VW8wZGtnajE4S1ExZHR5?=
 =?utf-8?B?aGJNbE83TGhiUVJ5b0RvN0ZwaG85bXE4YS94V2t1eC94QkZIVkVybVJydm15?=
 =?utf-8?B?WmJSQVRrdGdNQUR1OWYvVGpZVnBEWEVVcUNaNWJySWdnYzFiYnhmNUVLb2Ry?=
 =?utf-8?B?QzFvT2hqVTRpcWdtZVRQOEtKV3lpV3dBL0J4YlVxeUh3QjkrOFB2alFKbFhp?=
 =?utf-8?B?bUppZzVSY3B5QWJCeTZzakU3U2VNVHRIQXJoNERZeVNKY3QrRnZqQXhBc1Fh?=
 =?utf-8?B?dzcrdjV0Y0IxZmhvZW5kbm90VVliVlM2Mk9henliaU55akhKOEpLeTFrbXlB?=
 =?utf-8?B?bFJ1MUFTQmxxN3VWUXE4TmpDenRtTGxNNGtmbFllV2dKWGQzeTdOOWs0QmRM?=
 =?utf-8?B?QVNWcG5FNUZCT0VLRmcrbE9MZjNiNlozbzRyd2hWRlRadGZjbGFTTU1KOXlX?=
 =?utf-8?B?MW9ZanhGR0VteDV1QnJlb1RzeW5SMmVZSGFnNGdUNnNiWkFhVTJ0MXpiRnEx?=
 =?utf-8?B?dVRrSU1WMHVuY1VGZXRydm9HR2hzWi9JZXJ5azNURTJaYWxubWd3NVRwTVNK?=
 =?utf-8?B?cmdCTlJzSmxoQXlCREttdVpwenFPSG5HVnZJNEw1M2pxbFRzK1YxS09Nak96?=
 =?utf-8?B?bzdhd29qYm94S0VVdkcza0p5QlpmY0VkbUwzcEFBM3pvVFVuMk9FQ05BcG5Z?=
 =?utf-8?B?YWpyN3pFM3p1WVUzUGQ0MmJ0WlBIcnhhVFBRNXVyWXJUMFpHTnFvMlhQRWtW?=
 =?utf-8?B?aURNOHdseFEzWVd4MG1pWnJvSm5CZEF6UFRkZlpYNGxaNkwvNHp3VHduVmNT?=
 =?utf-8?B?RFZ4QU5DeFRxeFBYY2M4Wi9QZnBhSE9pajRuMzA0TG9YMkkzWlVldzdGWUZm?=
 =?utf-8?B?WGtKRnV4NXVXZkgxdnpyVXgzUjErSkhFL2FBNkxUalZoOG1FNmtZTnZjdFZk?=
 =?utf-8?B?WVVoZWN3UER6UTk5Ny9Db3hna2hqNjg5TlV3ZlZ0NTV0RzNYK2VXWkJEYTMw?=
 =?utf-8?Q?2piEGNoDQKAqm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWFyNlZtZHJ0WmRrRW5udWlBejhUV2JueEVPNGJTOU5MYTlqUTZhWUlFZkVv?=
 =?utf-8?B?TUJ0Y2FscytBcFJoSGRlNW1GRHFzeFNHclFBZkR6RzlSalRraUIyRUtUbXlS?=
 =?utf-8?B?RW95eUQ5bHZWN2pqMVVBZmRRYm11QlUzSllFa1piUUtZWjNUY2dFQ3A0SG5I?=
 =?utf-8?B?M0UrSkRWUjAxR3BHU21uOW11MDFkcXBxdENOTnI5dG0wOXBxZTNQd2lhN2pB?=
 =?utf-8?B?MDBOZ2F0R3I3T0JMSUFZcWZWNVBkUnpFN09NYW80c2pXNFB0MXZmOUU3TVJC?=
 =?utf-8?B?Yy9wNmpxdllNSG9XYWR1c2dIc0pEYjZHaEdYZFIyTERUaXhaWEJLN2Q0dVlE?=
 =?utf-8?B?emx4UGp4Y1BJcnFlcGFlUXlqWTh4NUJMVTliMzhHazFpckdtUmxqMzltWHMz?=
 =?utf-8?B?LzcyMUJFbVZZU0hXaUlqSTJRRXFXcjVsaVM0d2YwKzAyQUNWRnl5R1N2alcx?=
 =?utf-8?B?RE1YL3ptRVhUbldKaU9iUm5CbE5VNVRXeTB4YVorVHA3UHV6dkdHcDEvL3Ba?=
 =?utf-8?B?eUtoNUxvTTJMamJRc2JOcCt3bjU5NHlqbFJjc2ZsWk1mVjFZbGRkOHpkTms2?=
 =?utf-8?B?eEtINDFackVSekFzaVZDMkw2VCtUNmcwRFN0M2JveXhuSjExNENBQnUrekZS?=
 =?utf-8?B?T3dJaEp2dWtsTTloS08zQVVrS0ZUVExSaEVDZnU3Z21zM3NCTFUyaGdZVnB2?=
 =?utf-8?B?YmRLTmt2Wm1BRW1FV2d3ME1RYUZ2TFZhY2NoNmFYbTdjM0E5bGlmbnJldzZh?=
 =?utf-8?B?ODNheTk5VXdGN283VmEyaFpBOTZKUU9TTVZVRldBWVVEMHM1QWdsQlZBYkZ1?=
 =?utf-8?B?ZHF6U0huTWk1d0pHZlBSS0Q0bytBWTAyY0JmdXVTaUtxd243V0hNM3BZWVBa?=
 =?utf-8?B?enhjKzNXc1ZjM1hXWVFlMXU1QmhuaVJWc3dTL0pPb1VGYWU3MnNSL1ZmeE1z?=
 =?utf-8?B?R1NFN3FHZmdmenk0cjVvOUx3cE5oZS8zSzJzSGNPaDNoZG1WNWVPTTFVZkVt?=
 =?utf-8?B?NkNpd1pPTGNvOVBFeHh5ekdTZzJQck10bkxQcHlNWXI1WDFnZkQxR3FJcFB3?=
 =?utf-8?B?OTBHRXFVL2xibitRaXlDRVptRGdJMXhEQ1FYZm96Ri85OWdqeVNXeWx2a1VI?=
 =?utf-8?B?MSt3d1QwNXFFUThCYnNXRklKZGRYRDdtcVptT1VQMjFpcExHZERPa1VhQU53?=
 =?utf-8?B?VklUYURJSlJUMnQ3UmtrVmZmZGNZcTRMMUlLVjQ2QWZGWGxtMlNmZTNhQzZu?=
 =?utf-8?B?ZWFKRWthcjRNaHdQbG5WVE8vU3ZBNzhJeGJqdmdtMzdibUovQ2UrdkFDTDVk?=
 =?utf-8?B?dGFSZzdPZzJQRDlhOVZrbDhIVjBZZmRsZ3A4czVrT2grZk5oaG51NUlxdUJz?=
 =?utf-8?B?WndDcWVoeFo2VitXaUdVR2FiQjNhRTlndGlhQ0g1RVY3Q25wZGF4cTh1dWJI?=
 =?utf-8?B?SGplbENycFVRbjRMejRYK05iMTh6ZEVmSVhoR1RxVklkTTY3Qk1MUkZHTDE5?=
 =?utf-8?B?YUtQZjF3dWFuc2Q4TU8vSVZvZmtOdEdUSDErUThpN0ZtLzdqendOcW15bXRW?=
 =?utf-8?B?aWNKakNHNDcxdjczeWFucndVNzlIbWszTXFwSFd2NmViNUxmWitWbWhUYVdO?=
 =?utf-8?B?M2FKNnJkQmgxZG9sWEtxZ3gzV2VNR1BzMW5pcjNNY2RsTmxQUUZCQ09MdXUz?=
 =?utf-8?B?ejVBUC90Zm9ieDVHdTVoR2tyNm1Ec1hsVnErNXRqek9xQ3RuamlrSll5eDhP?=
 =?utf-8?B?ait4RCthZmdvUkt2RlhqaUF5dmdqbWlZL2Q3bTRYMi9zSkFyYTl3U3JKNFlN?=
 =?utf-8?B?cWtLRjYzSCtFQVRrUU1GNW9kSEhXTmxPVTg3YkE3a2ozTjN5dlFyaFI4Ykgx?=
 =?utf-8?B?cC9acU9TeTVoNjFDQitJVDJlZnFDRnBOSHhnNS9PdEY0S1k3S3hXa0hvbjA5?=
 =?utf-8?B?RTJxVWdGZTRNOUFmenhvUFpGZzBnRkkrcG1Qc3dOWFhzVzJmRTYyT3QzYmx2?=
 =?utf-8?B?eVlFbGNuSXZXUWxJb3JYU2UwelJ5eW1IWEIwMjB6c0xNbENmeFlQVkpoMHE4?=
 =?utf-8?B?OXFSYkUwMlV6bXVHVllzTi9tWXBlOE80TWs2cHdtNUdyM2V6MFA3VWZJR1hC?=
 =?utf-8?Q?LyI+e577vdKen2SQSQZ1vVq4Q?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CkLPba414BFDdclvlJp07ga3lJo5vznDza21ZDTribcWPSiSS5d48Mwyl4054dY7bHYXsjwetmkOsBApFqqlc2jfN40tlyQ5VPElUKDR/h/oSSQ+mUPJG2BhpsppFz04TBC7F8OibXnUhg7x2wIG6XYXh12L4Y2KVAPvtthN2F9dVL+nhVOhIYlKX24K1U1ROyPusgoRIairmLOJCE5FGzwsvU0GNktMQTK85c4jBznnzDiWE2qBWQQqiFqIkZ4pX61jqsFdhVdUoSNwvqkiQuEPsYeWWWe6q1YXhvgh5HSajh8FemjJ60W9NeJDV6rPtHm6HuesJtONV40BgY+8aJ9nUmYfDveQeIDBhWkvPI9EQzjpw8oOxXVYakaZGYIm0viUsfb/bkwYvXgQapLToMhoHo0qYCxP7wfRycL8BlOVApkkf6nZgDeTWz8YQm2JGj1rKyFkEFcAhegxMNSEw1Aa6ntM0qTrmUtBrAg1KVH9qX2dHnBZeA8hif2PAzt0cuoS1HbdaVXyOWXHyhMGtwZb9RvmwQBzSi2KB9Ctrzq3O+/v+3iqZXzQSLIEbpn4po8V1PZn27sSciaFuwaU4TRO8vs9i8cn0COUg08Q4KY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40305c5e-b825-4819-a7e6-08ddb0364178
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 20:08:43.3252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4Gwcei8SYdqBf1wij0jG51CH27f6dTELQQikFuSSr2+VVlW6Aw4pypgHLgsMsMSX8q8VQg3r0B1sOEoqerv6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8223ED5C3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_08,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506200138
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEzOSBTYWx0ZWRfX7LTpFYCMe0Nm KGBfnTxKNoXQk4bH60k4XcXoCP6tHsPBF4oMFVgdshR41TOBr+Fs3SgPnMjo2P5PKJK3TFmx4BH Ain+NF8o7Q7kx25AY5GPfagQtmQHucTTQE30eS0GTkVVs9tsS82aDHeZVfjDWdoI8b9lCf0EueY
 bT3vdJxpxr9H9lrrM7F1h3EuiVmiH27HPHELL6/BJl4Niip9TzcVQtoKgz+w4iubgma0hKyvzfG Q3yy7VSIZadq53FQgvjIpVSVvT4w+hT/Z5TLGjc4NKB8xfbVID/UMtnYAq/ekm1swd6RaXIodxs Yr2uwadpj3w9sYXgCKrd0SWdHRHYGSSiAKb3Hs8noW0C2d6KQfHGdBsvlfXlUDAaM5sCYC99Qbh
 x6csaAYUZARvtBE5lya6ORW3CdyGSBY7qYDIT609WrwmQ6x2HYe7QGDYNMS7SbvjRuRluwcc
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=6855bfcf b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=i3X5FwGiAAAA:8 a=NEAV23lmAAAA:8 a=Qr7G4bvdRYz3J2VH2S4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: ettM9jEjQNfjEtHRMumysLsvfdODocXr
X-Proofpoint-ORIG-GUID: ettM9jEjQNfjEtHRMumysLsvfdODocXr

On Wed, May 07, 2025 at 04:24:24PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> 
> by this commit, we notice the config diff:
> 
> --- /pkg/linux/i386-randconfig-053-20250503/gcc-12/ceec7f2554e7af6f6a11acee3dcba414b9ecdccd/.config     2025-05-07 06:57:33.691929038 +0800
> +++ /pkg/linux/i386-randconfig-053-20250503/gcc-12/7fc85b92db96fd88f86f8e977e7e142c233680b4/.config     2025-05-07 01:22:43.415543806 +0800
> @@ -6760,7 +6760,7 @@ CONFIG_TEST_IDA=m
>  CONFIG_TEST_MISC_MINOR=m
>  # CONFIG_TEST_LKM is not set
>  CONFIG_TEST_BITOPS=m
> -CONFIG_TEST_VMALLOC=m
> +CONFIG_TEST_VMALLOC=y
>  # CONFIG_TEST_BPF is not set
>  CONFIG_FIND_BIT_BENCHMARK=m
>  CONFIG_TEST_FIRMWARE=m
> 
> 
> then we find a i386 config boot test always fail as "kernel_hang_in_boot_stage"
> in one of tests, we captured some information about Mem-Info.

Hi Oliver,

This is simply the vmalloc test module simply taking too long time to
finish. I've observed it taking up to ~5000 seconds.

This is not a bug, it's just too slow and the timed out.

When I used my qemu command that I use everyday, it took up to 1400 seconds.
When using the job-script provided to run it, it took much longer.
I don't know the exact reason ;)

In any case, I’m not sure the vmalloc test module should be part of
your i386 boot test as it takes too long to complete.

On x86_64 this was not an issue because the vmalloc test module
completes testing much faster.

> =========================================================================================
> tbox_group/testcase/rootfs/kconfig/compiler/sleep:
>   vm-snb-i386/boot/debian-11.1-i386-20220923.cgz/i386-randconfig-053-20250503/gcc-12/1
> 
> ceec7f2554e7af6f 7fc85b92db96fd88f86f8e977e7
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :6          100%           6:6     last_state.booting
>            :6          100%           6:6     last_state.is_incomplete_run
>            :6          100%           6:6     dmesg.BUG:kernel_hang_in_boot_stage
>            :6           17%           1:6     dmesg.Mem-Info
> 
> BTW, seems x86_64 config tests are ok.
> 
> below details just FYI.
> 
> 
> kernel test robot noticed "Mem-Info" on:
> 
> commit: 7fc85b92db96fd88f86f8e977e7e142c233680b4 ("lib/test_vmalloc.c: allow built-in execution")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master 0a00723f4c2d0b273edd0737f236f103164a08eb]
> 
> in testcase: boot
> 
> config: i386-randconfig-053-20250503
> compiler: gcc-12
> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202505071555.e757f1e0-lkp@intel.com
> 
> 
> 
> [ 568.859422][ T77] ? kthread_is_per_cpu (kbuild/obj/consumer/i386-randconfig-053-20250503/kernel/kthread.c:413) 
> [ 568.859422][ T77] ret_from_fork (kbuild/obj/consumer/i386-randconfig-053-20250503/arch/x86/kernel/process.c:159) 
> [ 568.859422][ T77] ? kthread_is_per_cpu (kbuild/obj/consumer/i386-randconfig-053-20250503/kernel/kthread.c:413) 
> [ 568.859422][ T77] ret_from_fork_asm (kbuild/obj/consumer/i386-randconfig-053-20250503/arch/x86/entry/entry_32.S:737) 
> [ 568.859422][ T77] entry_INT80_32 (kbuild/obj/consumer/i386-randconfig-053-20250503/arch/x86/entry/entry_32.S:942) 
> [  568.892507][   T77] Mem-Info:
> [  568.893062][   T77] active_anon:0 inactive_anon:0 isolated_anon:0
> [  568.893062][   T77]  active_file:0 inactive_file:0 isolated_file:0
> [  568.893062][   T77]  unevictable:81237 dirty:0 writeback:0
> [  568.893062][   T77]  slab_reclaimable:4892 slab_unreclaimable:990
> [  568.893062][   T77]  mapped:0 shmem:0 pagetables:37
> [  568.893062][   T77]  sec_pagetables:0 bounce:0
> [  568.893062][   T77]  kernel_misc_reclaimable:0
> [  568.893062][   T77]  free:642768 free_pcp:7866 free_cma:0
> [  568.907502][   T77] Node 0 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:324948kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:0kB writeback:0kB shmem:0kB writeback_tmp:0kB kernel_stack:344kB pagetables:148kB sec_pagetables:0kB all_unreclaimable? no Balloon:0kB
> [  568.913478][   T77] DMA free:15360kB boost:0kB min:76kB low:92kB high:108kB reserved_highatomic:0KB free_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
> [  568.919639][   T77] lowmem_reserve[]: 0 664 2988 2988
> [  568.922660][   T77] Normal free:562624kB boost:0kB min:3016kB low:3768kB high:4520kB reserved_highatomic:0KB free_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:7336kB writepending:0kB present:749560kB managed:680084kB mlocked:0kB bounce:0kB free_pcp:31472kB local_pcp:31472kB free_cma:0kB
> [  568.928669][   T77] lowmem_reserve[]: 0 0 18591 18591
> [  568.930481][   T77] DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024kB (U) 1*2048kB (U) 3*4096kB (M) = 15360kB
> [  568.935634][   T77] Normal: 2*4kB (ME) 1*8kB (M) 3*16kB (UME) 4*32kB (UME) 2*64kB (ME) 1*128kB (M) 28*256kB (UME) 52*512kB (UM) 2*1024kB (M) 1*2048kB (U) 128*4096kB (M) = 562624kB
> [  568.942674][   T77] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=4096kB
> [  568.944646][   T77] 81256 total pagecache pages
> [  568.945136][   T77] 0 pages in swap cache
> [  568.947632][   T77] Free swap  = 0kB
> [  568.948086][   T77] Total swap = 0kB
> [  568.949615][   T77] 786302 pages RAM
> [  568.950027][   T77] 594914 pages HighMem/MovableOnly
> [  568.952655][   T77] 17527 pages reserved
> [  568.953101][   T77] 0 pages cma reserved
> BUG: kernel hang in boot stage
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250507/202505071555.e757f1e0-lkp@intel.com
> 
> 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

-- 
Cheers,
Harry / Hyeonggon

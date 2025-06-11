Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526042857CF
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648971; cv=fail; b=sEgbGXc18bcK/rMKg3Wi6WwgM/AfjYTb5qbAVf9BPIfCAZMgXUrfowHsnJ6WBCxAoS3qedwAU8gQ2LMtmSWKLa5IKffVBE8KjA7AaG9nfnT1mSvUl2eHq2a1DMFv9Bxnd6+RfwZhbJ2qe5sJ9DiuqCgFxwwPle27I2aNnjt7Yko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648971; c=relaxed/simple;
	bh=tMRcwDCkLdVaO+siawJKsFaV+vif/foEF51p0xVdG5A=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f46nO3dkfRfd7DhfLzysTOEsY/+vX3r+pAKFBi4AecK1Hj2OYIgkaG0cwOSs6y/lWBttgs6B59EyAnETKOiSv1wN8jBCynS41fbkWV2GVua9T4lfb5FhFxzKxP7sOE/SrGfkj/88UOtYOKs9Nsv+4tn+nu9Zo1zZe5aaWlxTjwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iNmGQkTk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gcMtsXo2; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iNmGQkTk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gcMtsXo2"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BCtb5s025341;
	Wed, 11 Jun 2025 13:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=dthJgp9524QGemOYR1MyLi3xA8mQGoN11Xy54TX8jss=; b=
	iNmGQkTkl0ZdvnNqw8G4/USZ6nVykrahswO1jRiQWlJEKjsTbsk69e0l1Pn4USN7
	+6Lmdun7MlqgeBKUfQ3tYgX8rPS9nFPYskHbET3/lw/0FXosodVjbp070SlMmwzX
	sM0BJqhbBHW6geUwqYDbRn0ZjnBmEMxeU6Fc16ZZDNJ7YyIVl4tc+5tKyHBlKLQQ
	y6BP0b+MFzBmERz4TZn6yqkLaDDmbYby6bqC0Q0ifi3uRn/LTtekeXtP0bkLXPZU
	v+YYKKVLl7s4gFb45Rk2SVlHU5l/Seu8zTwRwUHo4kq2wXQzws1aNbSGkiIs+1QG
	Zc2Xypq9z8BxXu8YJE3/FQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14esue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 13:35:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55BCelDH004011;
	Wed, 11 Jun 2025 13:35:53 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2089.outbound.protection.outlook.com [40.107.101.89])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bva6j06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 13:35:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugkm9Xy4Y+3TbDt0xRxyfalqFGTgQtGwSLYum0uq9jyJKeuyncO130hmNcY3P5ggu3GfIkTuYe4d8+rPXBYr3XiyFpYgpp6eFopylD8kV9cYx9BFtQ1xIrDDU+1IagT/9KvlgDGzEOqPvHvjJobVCKI3TZtFAoW+THvWo6ZH0aQ28qcpQ+nbFme4Df5rELPVy05a6XMhInHsgfdh18kDv94082x4tiTnPrIYmCa/qYh3D244COlrKs80rMBPaXyXjjO8upaOi46LTplMGubphaY8Rf4uzct+yMy6DkdqXUVka9iv2lwvjM12X4GF4WLS3hFnH7WJ4H9nnDnMTj0xTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dthJgp9524QGemOYR1MyLi3xA8mQGoN11Xy54TX8jss=;
 b=H2i4wI9QF8W0c2QfpLb59zEpKk5F6bg40RpFD353GM6KCBLGGYUSsaOkcCgcT3JaNomuNGRByE9e60Qt0giDaRASwQ03t/gOvs4p7QfZyk411rhrwG6+HJz6K1l2qoJHrGcKs1HOvA2auHo0ucn9Oxp41RgzNhXcFxllFrsl+IeOJeKdJdmkTvZGNdlr948Lb8JLNIVLHRNg/C1EPowy80FQ8j07n0SBiMc5pXkmFkg5gHAmOWWDzEVEDV1E7dh1vDdfhf7sRX8QQwyw4ThJ0vSf7zE2p87DzHfPwWJJ3YoyGfNH8wqSAXd3j1j6SmS24JGZMcJ7um/cbl/DTai5qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dthJgp9524QGemOYR1MyLi3xA8mQGoN11Xy54TX8jss=;
 b=gcMtsXo2GRAajbvZB8+4yiQ0jLnwWuOGLNblHQZRbQvWdwlMZ1wrEtgWRXiRlEko/Y9YHRFxWsyqM+Xub0dG+VuwUXs8m19NoKNJ3zmEKRa4P2KvfYmPH4CV9pyTDDfezn3LjAneOzOjRRqn/rMJDKEPUWSApGFxhj4dlzcyD2k=
Received: from SN4PR10MB5622.namprd10.prod.outlook.com (2603:10b6:806:209::18)
 by MW4PR10MB5864.namprd10.prod.outlook.com (2603:10b6:303:18f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 13:35:45 +0000
Received: from SN4PR10MB5622.namprd10.prod.outlook.com
 ([fe80::6bce:37ef:d1de:d084]) by SN4PR10MB5622.namprd10.prod.outlook.com
 ([fe80::6bce:37ef:d1de:d084%7]) with mapi id 15.20.8813.018; Wed, 11 Jun 2025
 13:35:45 +0000
Message-ID: <25ae649b-8f0b-447e-8e50-87444c0ea9da@oracle.com>
Date: Wed, 11 Jun 2025 15:35:38 +0200
User-Agent: Mozilla Thunderbird
Cc: alexandre.chartre@oracle.com, linux-kernel@vger.kernel.org,
        mingo@kernel.org, jpoimboe@kernel.org
Subject: Re: [RFC 03/13] objtool: Disassemble code with libopcodes instead of
 running objdump
To: Peter Zijlstra <peterz@infradead.org>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
 <20250606153440.865808-4-alexandre.chartre@oracle.com>
 <20250611122317.GA2278213@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Alexandre Chartre <alexandre.chartre@oracle.com>
Autocrypt: addr=alexandre.chartre@oracle.com; keydata=
 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
 swLliy6PdpST
In-Reply-To: <20250611122317.GA2278213@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0130.apcprd03.prod.outlook.com
 (2603:1096:4:91::34) To SN4PR10MB5622.namprd10.prod.outlook.com
 (2603:10b6:806:209::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR10MB5622:EE_|MW4PR10MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a24031e-80cb-4f6e-5f5c-08dda8ecde5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFY5T0duM1ptRVdIQ0pYVXVVanJ6YTR4WkxjeWdhTWQ3Yy9laXRxT3J0R0pj?=
 =?utf-8?B?UmZBVUFLNUMwNTFySXdESmxUUXd5SXQwejdxd2VZQlVpcWNyell3dE0xcHZQ?=
 =?utf-8?B?ZDRtZnVWc0d3K3ROb2huZjgyTFhQZlRKUGd6NmJqR2pIMzV0STFuaGpmZEFn?=
 =?utf-8?B?SmNZZ3paWUwvUTJJNGpiZjJMMnkvY0Y5M043ODZLY1R3UGlDZDZWcWJMRVlo?=
 =?utf-8?B?MHVOUG9IVmQ1WnBlZTNtU3JvQ0VzckwyUCtadVVTT1p5a29rcmloRDByT3BN?=
 =?utf-8?B?b0wzNnh5VWZhbzBad2tNamRzL0JFeW5FWllQaHNSclV1L09qS3NQZXNDNkk4?=
 =?utf-8?B?R21MMzYvVGpkNWl3QlBhb3Y2Vzc0SXBscEU5R0NONWJXUkFnT2loOFJBK3B2?=
 =?utf-8?B?L01IT0E1NS9iMk0vV3VmdHdtdHJ4Q3E5RGdyMlpZSzlKZ2ZLdGY1VlorTjFR?=
 =?utf-8?B?RVgyZENxU1dkT09HUU5SVEhDUVgyMW5CR1JhNEJqc2E2ZitjeFZtcHBtQTR1?=
 =?utf-8?B?MjlFVitUZUt6S2UyVjlycUV5VHMxcm9FS2t4RHl0bHdaRy9CTi8vcGtIbVNr?=
 =?utf-8?B?RURtOUt4YW5hUytxSWdBaUw0ZzFvOVc2d3BlNitNeUVSclJLSDRES3habytt?=
 =?utf-8?B?L3VYbTNjdzYwOG43cWp3NkxZTlBPOWk0UEhUQXdaYnIrM0RDQVo4bkFzdXlD?=
 =?utf-8?B?VE9uRTNkTFhMQU5xMXMrWGJuODhLYTdnanNoUGtOZTRDZGtTR3lYaEZxRysv?=
 =?utf-8?B?c08xSmp0VXloY2dITlhQQ1ZtY1ZKMnArd0JlbUdEMkdLNkp2a1Frd2c2SCtr?=
 =?utf-8?B?cGdjYTNTVU9PQjArdEhZSlMzK0ZrZyt0WldKSU9Oa0hsTmR5bmt4eUkwSUhY?=
 =?utf-8?B?WHpJRWNVOE4zaTY2UFdFMEd4OVVLUFh5WXFNbU5iemJJVFI4VldlOHdGZ0g1?=
 =?utf-8?B?QmJ2cW5zRkVFMnp3d0xOQUpaWW9XeHhaL3BIRVE3MktXbE9EUUxMSlY0SGpN?=
 =?utf-8?B?eW1uTW55Z3hmODQ4TVdRNnpQQ2hqR0FzMjFFdnoycjhObFlIUXJYVytWb0N1?=
 =?utf-8?B?V3Jub01acFNpdFAzN1djUXBKbUVBV1lhNDFpM1dFWVVYekFKYjFGUEQzVFU3?=
 =?utf-8?B?RThzbWZENkxWMEV6UDkrUXNrb3N6Qk9qS2RXL1A2clA4VytHRks0ZWFKcEww?=
 =?utf-8?B?NjlacDNxWEdRWUJnODdyQ29zRmNWQUx3Zlc4V0JBcGpSNjdBUU9nc3l5MVF2?=
 =?utf-8?B?aWNNMHpMcXEwWGJJaUM0dE5BaGpEUlN1OFNwYXJvOGVQbEdtWHM1SWJBWUVB?=
 =?utf-8?B?V0tKaTZLd0JJaGVFQ1pJd1ByVVBHSkIvckNETmNhMzJzZ3BXSG9qWW5Md2gr?=
 =?utf-8?B?QnJRT21BYkR6SnBHT2JtQ1h2RlBMamF3S3ZabFZ5Y2I2NGZ0Mkp4ckk3b3Fa?=
 =?utf-8?B?M0NNM25Yc2d4b2lnV1ROSEFNOVhJQnpWR0lTZmpCUW1RTUpRa3RmbFZSN0RE?=
 =?utf-8?B?SWcxVU1pRitzSlpDVGErbWhqREhZbVhJd0FnMDlYVHNIbDZFMS9OdnU4eWVH?=
 =?utf-8?B?bng1cy84UEZ3L04wbTkwdkxwRk9YMnhTa0p6N0s3T2ZDL3lmaWVTN08rQzFD?=
 =?utf-8?B?dGZubTVKbVBVVUQ2OEFQY3NVVTBXMEhBbmVWN2psM0ZvbWFLTmxWRFErWVky?=
 =?utf-8?B?di9xYWw0eC9SUjJ1UmxmWW1GM0JqL1VFWENOSlQxUlZDQ3lGVStjV2FtZitl?=
 =?utf-8?B?ZGdEckZQdXZ6UjVQc25jd1I1WkdoY2hBa3dWTzVvd1ErOXNmRHJkSDhHS01C?=
 =?utf-8?B?MDgraVAzS0RMVGhrcHI2ZnB2QUlxQ3FpVnlFT2dqSm02aksyTGhJVlF1K0NE?=
 =?utf-8?B?YUhsbllEc2JMR1F5NXN4ODloLzhoMGE2eTBVdTVuNXV3Vnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR10MB5622.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGMvZGNpWWo2OGtBV0NGendHcHV5VWIrKzNNaE1NZlltRTMvMGU1ZW9Zbm5q?=
 =?utf-8?B?MitXMW5ybEwxUnhrQjdQTk1zRGtHZ2hYZmlydkdUbk9hVDFOTHQ2T2hRbGdF?=
 =?utf-8?B?bkdVUEUvQkhYRE1saDZsUnAza3pnRDNnTktheDNlVlczSmdWaVJ5Q09DcHpV?=
 =?utf-8?B?WEh2c2NtM1V1L1F5WjBmVG41MTZPelJVZ2RlVFN3aXcvSTZPb1hPUjFwelVC?=
 =?utf-8?B?aWE2L21TOEE5ZDdiUjdxWjJxMmk4dmlaYUlYQjdNckY2bzJZVzl6YzFIWWk2?=
 =?utf-8?B?UVNwVkRlUk1VcFp5a1hBNFkxYXFEQmpRWks1bndmdXBuNmdEWTVkL09XMkVk?=
 =?utf-8?B?RHRoT2dJQ28xS0lDR3dUYmdpNDlGaXZTeTA4VHpkalpTems3Y0NhRzlwbUNG?=
 =?utf-8?B?ZXNtb0xFeUkrYlU4M2hkbGpFQUxxTUtzRndHdFR5dmFWVWFUWC9CWmlTVjRK?=
 =?utf-8?B?MFF2OFBOblJUeTVxUFFtOSsxREQ1THM4U1k0U2ZPWUVLazB4WGg2NWFUYVQ0?=
 =?utf-8?B?T0k3dE0vdXZvdXBlTEU2Z2sreWVVc05YSk1VRUlLTGQ1andMUTNPSFE5TFU2?=
 =?utf-8?B?Y28rYkkxRDk1enAzWjZDRWJWMXNZeGVNcjdvdUtQT2E2dGZoVmhxcEs0WmVW?=
 =?utf-8?B?d3pFS0Q3QmhjQm03c1ZiZWtSVzl0QkczT2VBR1lDcHhXZGJEVWQ2WUxaVUJp?=
 =?utf-8?B?Y1pyYjNVTml5TGJDaWNpWHV6aTNsYlFndmRqQUNSVjVmNlh4OExZbWZlQXBC?=
 =?utf-8?B?NkdxeXpVenp3cCtnYVJQVGQ3VUNpQ1VKVldCaExqOXlKdGFOSnZGMks1Qm80?=
 =?utf-8?B?UGJtYktxYmU2SGl2Rjc0eDFJWm40VlVQMlhYazBRVUxlTjB5ZTF0d0VPaDJP?=
 =?utf-8?B?bGp4Z2dmMWFRYnZSZCt1Wk1SZStuZW5ZemJjY1N1ZjdQK3N1NHlGSkRSSDlr?=
 =?utf-8?B?QlVCRmZ2L1JXa0JHOGQ5VTYrZEtGMnhTRkRkempHL0lyWG5wVG9CQWd2cksx?=
 =?utf-8?B?OE84d1o5VUZKVWlTRG5md1FWMm9ibXBWeU54WjFKa1BOUkhuZndrU0dMUVVm?=
 =?utf-8?B?RkFnVDZDYXMwdWgrR3VYeU1zb2dxZDJPRzZqUTBKMWR6UmtUNW5xb0RMSVRx?=
 =?utf-8?B?ejZnSnhoQWJJcGlVakRodHE1OVhDSytVNkx3Q0cwcnRXVDVKbUQyWkZmQXRu?=
 =?utf-8?B?QmhwMm0rbTRIY2NwQTk5d0E0dFBDdEh5S1NqZ0VuT3p1WU14Ny9pVHMvK3h1?=
 =?utf-8?B?WGhhVE90ZEp0b1Z3eVFESTdaa0xrMW5VR0RzQVRwYThFRk9VdUxoUGt6WnJj?=
 =?utf-8?B?K0dheWhMNVNjSEdhQmZJTHRQQmRURzFTODdXM0xHTXorcmRwdk5GRmR5Uk9L?=
 =?utf-8?B?RnlvSmVUaW83MVpGK3FTWC9KYWNjNDJVeERjZjV4OTFDdG1DUEJIeVYrMXpq?=
 =?utf-8?B?aTFCK1BpNTJuK01OM1p3T2t3QWFFMEpqcytvY0xYQ3dXd1Y5Tk91Wmh1aEFn?=
 =?utf-8?B?TXl2enNtNlUwcHNqVGJ0UFNIK3IyL3ZMNG9QeHl5QTVkUWw5Q1V1Q3I4RFVP?=
 =?utf-8?B?dysvSzg1V0cxdVlXNHVIbjlLclk2VEEvSG5OdnowYTMyUzMvRTh5RENBMXRm?=
 =?utf-8?B?VDgramJVNVMxelRSa296UFMwdDBMcllCOEFKbzYwdFR6Wm83bDZYSkNoYW5i?=
 =?utf-8?B?U0NYMUFZSE5lcE5xb296NlZSaHhvaVA2WDNCM3l4bURQMnRFY0UxU0NDWFJT?=
 =?utf-8?B?Z0hQQktpNTlnVTQ1eVVaOUU5K2VrOTVMcFJRY2VHcTFTMy9Ld2hXcHVqSEFt?=
 =?utf-8?B?c1pyS1FtZTF6bmNPYmZKT1NRZS9HVDk2bisrV1Nsc2VyWENaeEE3YjJldFpS?=
 =?utf-8?B?R2dRc2F5ZUJQc0VzYy9TbDMzTWFNcU96WVhlc0RUWGpZcGFKZFRFdzBneTVS?=
 =?utf-8?B?MTF2ek0zTTdDUGdFdWN4WUdXUWgxSER3SU5ISWZzSmpZVzRCSVNRdHY3bUo0?=
 =?utf-8?B?eWhXbEJSWUN1VWp2S0FVQ2RsVnNoRTBkVUNRUU5WSEowVXJFSmlFZXlyN0tr?=
 =?utf-8?B?eVV5bFRBS3dod01CamZtYlNJZVZOYWp5cG1DWUJuNjVCQTZVTnRsL1FSZ1pX?=
 =?utf-8?B?L1VFNDExbFZseVhDT0gyc1gvQlVXb2hKdlFtYWd1K1FPWlIyRXBtMlhyM0Rp?=
 =?utf-8?B?SGlWUTJXVy9NdlhMejNoY2dGYktaem5oME1wcjFPRERFamNxbnFsU09HLzE4?=
 =?utf-8?B?WXlSaSsyQVlTb1dzU1c1enRnbWlBPT0=?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LRO3GbDM4wfT1Cq+qivONt7Bdm0SCCdkHJQvfy25ht0lbxo0hTWCJ1EHba0DRJQx6uAa5Ni7s+iKQJ05H4S8mxAXhv16gmvFcgTOq0rHZa9uWlwbSjYq7UxJmUhrHRnmIM0bjwgMksRLv5uuvXg8l/T6Zm/2N9LOgH0uCKs3e1AivzCsUTjOJa5A6dHg4jpUl70gZni0z7VhfUV/fwsgBDu1Omz8Zo6NCbdu3S2mhg1ZbHGRiiHIQZfqDqoq9mKIcDZegibYQcE0JHY9PdPvato6yzSKnbRjP+FsFAYe0OdngkWskwjn/be+R3hYE/pfW0tpSayq7hBZB+ZRCXYdxRFNR3ZxRIwwgDQ7Omf+PUg4YJZ9WK39q3s+iT0wIxYtXkm8fi1b414EM+AO/QV1FJPKGuIbDCUO57LufywQyKA3CuqWLcXqbAoGLEHn7qbVhusQqbwraV/IlFCIZjDZuua7wHr0BoNY17q2C8GNnNW9GhHvGkgPV3Rk+8NC2FkhGD1HgycoQw20rycEnTxCzPB7P9fCdVMLQ2nmSt/TvQYVwHZIfcqJhQjB3uQ9nhux2glJo0fbIKApriiE2ZoUXDlVbTEP5cgcJa/iIVLQEks=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a24031e-80cb-4f6e-5f5c-08dda8ecde5c
X-MS-Exchange-CrossTenant-AuthSource: SN4PR10MB5622.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 13:35:45.7537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEKwwu37sFeYfNmrDBgac25IdAYK6owKCIb9clZ920RzqGeefPQXUXSkw/4UY/xFga8XsMbO4+fFvGf7AJeuY2Wwhq3vKM1jczrWOXSbahI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5864
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506110114
X-Proofpoint-GUID: 7rYVvblsaXDCaBOA_bttkWrXJb6Afrdf
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=6849863a b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=W8KaHNX2_0H_mrj0DWgA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDExNCBTYWx0ZWRfX/aiAdN7WxHPT P4fRBAA5xU61gCKXIaoNVQVdxiExjS/N57hEebznFklRayj6prUbKcovJSjIzLQ8+GUf8qrJ+bv AqhPJUxqY2gAvVzzeGH+qGi4oNIo0qrhu87VvDaZiUYhMnnrJQTRlB0g/8W5TUtlWo/WoA8MqMd
 Dsfh2X5o28qtZgYPEplkgRA8W8AOT6VqgP6I4qZTuPIuAhDnbu7c0z5zjIXRHDrMGT/RB4pYn4w gDtQTpDXK39V6I2N6zM7R/oEKnOapGf8TIqYuIzSb+9n4ox5bTwyYut1jnKTg/njkw20a6rBbGf j8JGWNHE+LgeakGtiaDeSeuKjQK0WigdaUpx28QnzsKm43aykUwRiZLBKFfENhfEenRCBGIMnXA
 9OwAuTgsAo0xrW8MD4qvX8+1lI4ZmnidBKuEYQoeVrej42wtg/KeLObZsjsvqFQPR4WjFOfy
X-Proofpoint-ORIG-GUID: 7rYVvblsaXDCaBOA_bttkWrXJb6Afrdf


On 6/11/25 14:23, Peter Zijlstra wrote:
> On Fri, Jun 06, 2025 at 05:34:30PM +0200, Alexandre Chartre wrote:
>> objtool executes the objdump command to disassemble code. Use libopcodes
>> instead to have more control about the disassembly scope and output.
>>
>> Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
>> ---
>>   tools/objtool/Makefile                  |   2 +-
>>   tools/objtool/arch/loongarch/decode.c   |   6 +
>>   tools/objtool/arch/powerpc/decode.c     |   6 +
>>   tools/objtool/arch/x86/decode.c         |   7 +
>>   tools/objtool/check.c                   |   4 +-
>>   tools/objtool/disas.c                   | 186 +++++++++++++++---------
>>   tools/objtool/include/objtool/arch.h    |   5 +
>>   tools/objtool/include/objtool/check.h   |   5 +
>>   tools/objtool/include/objtool/objtool.h |   4 +
>>   9 files changed, 154 insertions(+), 71 deletions(-)
>>
>> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
>> index 8c20361dd100..00350fc7c662 100644
>> --- a/tools/objtool/Makefile
>> +++ b/tools/objtool/Makefile
>> @@ -34,7 +34,7 @@ INCLUDES := -I$(srctree)/tools/include \
>>   # is passed here to match a legacy behavior.
>>   WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
>>   OBJTOOL_CFLAGS := -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES) $(LIBELF_FLAGS)
>> -OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS)
>> +OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS) -lopcodes
> 
> Would it be possible to make this optional? Such that when people do not
> have libopcodes installed they can still build the kernel.
> 
> Or is libopcodes a mandatory part of any binutils installation?

I guess that libopcodes is mandatory because it is used by as (and also objdump).
But I can check if it is effectively present anyway.

alex.


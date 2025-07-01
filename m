Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965AA278153
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376602; cv=fail; b=YEBXux2wH6hyBQ2e5W40nrLNqsqAuGKicQjb2Upkp68Lqa7yqzlzh39OXbsjtShN+dw2dG6EENGSu+4BCjUys59HucDDCdxwCcPMHvjhZNGIz0lRgc5rz45+Q+TULZchA3FsSjAw77vaIJf2+6ky6peV5L78vIwbn0b3E2Q1Lpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376602; c=relaxed/simple;
	bh=Li8XOuVzIZo9dnWgATBVGz1bRHCQkX/uZjZrWkEXA0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=seF+eVp2yPDujN9Pve+2QLJ6WJSuS9qDlvj9Rov84Vf+DmDT1sw6oqMslgT3kDust3Psw447CI6dknoSF0ggn8x+n69XpkSIn1rbXBJJSKY3IBivr4cJLe4AYl7VdHSbeg9YoQc91NGJUbeQSfNN9D/sVuaeML4HUFlOLmH4VbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SlGgLibl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=L22cPfjV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SlGgLibl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="L22cPfjV"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561D9SQM027019;
	Tue, 1 Jul 2025 13:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Li8XOuVzIZo9dnWgATBVGz1bRHCQkX/uZjZrWkEXA0s=; b=
	SlGgLiblVNj8hX9FPz92bGzpVPHeOi2FYK3CdIlHb54Vv2oHXVzsul8aBJDdmkzn
	cIQAUND6mGHjac5Wg6+mrf1l5uvv63HLWBVyJyfDwL/fRHTVwYCpkSMfY/4lq+I5
	tMJUHaqibnUAxlLPd3U/odxYXex6sVadGBkd7g/4+f3Prh1pg8YhvqbZ1hmc/iDN
	M+eG7tIAPYSgemAeSAxqGEYpkt4zupc0g5zh/k29d1robjfarY25CFjbEWnzIJ4A
	HLEVDQmWmFlfQyCEKDNR3aMB3HwzXYRrjztxbr+8LfY6GvChKf0Tbf3ivByj/nTz
	5yX6bmUoxN7MbgY1QLdoxQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47jum7v2kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 13:29:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561DTfSt011393;
	Tue, 1 Jul 2025 13:29:46 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2062.outbound.protection.outlook.com [40.107.96.62])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6uh0yv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 13:29:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEBLZ/oGuVjcmrBE16a0r35WKKa/xppOpae9oP/3b9STghCf/Qa4uM0E2FWJ2UEgzqa5YKeH/jXqxvHUGZiIRn9oA73XLCDqc/ZSauYPt6Ubq3R79M0HfBXdXSomkeKhurxdwKbzOQK8ylyCn0uJb24pjkufZuOa9P9NkivmHEv7KVeobhELZT8G4Psmp5qOfinPooixvfpO950kR1giyfGTsBYyfACn4lP3VGTa4qu7+XCJIj6U0LWFIx7mNcYnpWw2ImLXeoOKYoE8+/BPlX1o/Mq1A3ivpqiv7/FTjo6Wmb3ySy2bK5yKebEWF/A7pMHVhoQBp/H0ohkr38/p2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Li8XOuVzIZo9dnWgATBVGz1bRHCQkX/uZjZrWkEXA0s=;
 b=xkrxFyHMhF2pknqYxvul9P1NdzQ9xrspI8v9BieHGklylLcVKEX8xFH47USRWRjn1bX6y/Czmn4FOdSyAlKbQJ6agPZOZtTnVszMIxvOcGQNLMJHqYiOT5qkdNkK6zj+jDFsocKcpAhedP4RvDz+VOD/8Vbvf66XduuscrwFKowMJgzLVj/NfcUxcPvr7VTVLlWxiT8FS1GjZJiE9UybLdNxyQM7m5alyORfmFHFird66UUZ57+Ly+Jj0PFPhMfgEpvOU7lA5rVytZ/bOx74+JxIhy4gKXL2o5BEDS84vaStUAzu4yrOhkggwAnQf6yh/+dcyuIt0yzfxfjGcfaQLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Li8XOuVzIZo9dnWgATBVGz1bRHCQkX/uZjZrWkEXA0s=;
 b=L22cPfjVAa6hGnL4njkOoSx31GlQGMtSe8PwUjA0lEC7VCL787gh1kR7Owxqk19AdM3vXDAbP8ZUQXhwdD7ZOW69UMK6gI+UY87jV+OZ0NBVSIdidOeZV0TWETXSyWCZA7UCp5TEDyNmJXts4UvhgoGSdE2rg0yEZe0riEbg3Dc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS4PPF18D5A7206.namprd10.prod.outlook.com (2603:10b6:f:fc00::d0d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Tue, 1 Jul
 2025 13:28:42 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 13:28:42 +0000
Date: Tue, 1 Jul 2025 14:28:40 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: siddhartha@kenip.in
Cc: Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, mgorman@suse.de
Subject: Re: [PATCH] mm: limit THP alignment =?utf-8?Q?=E2=80=93_performan?=
 =?utf-8?Q?ce?= gain observed in AI inference workloads
Message-ID: <04a109b1-8f60-45e3-b8d3-70bd849ee877@lucifer.local>
References: <5816677a-705e-4a8f-b598-d74ff6198a02@arm.com>
 <ee92d6a9-529a-4ac5-b3d0-0ff4e9085786@lucifer.local>
 <e7152150-2f3e-4ad7-a6c5-f4b77e5c0e05@arm.com>
 <f746d3aa-17e7-4b42-9e08-97cdb2cad89b@lucifer.local>
 <80b849d4-faf3-47a9-8b8c-e8053299cfb2@arm.com>
 <2e99712b-8dac-4762-9fc5-fe3ef569b65e@lucifer.local>
 <afe95bb0-185b-4c4a-ae41-e02457422cc3@arm.com>
 <787639a1e6a27c0f3b0e3ae658e1b8e7@kenip.in>
 <5c3d307f-d303-48c3-b730-99a83d4815ec@lucifer.local>
 <dd370f92e9100e785aeafdc4d31f8cb5@kenip.in>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd370f92e9100e785aeafdc4d31f8cb5@kenip.in>
X-ClientProxiedBy: LO6P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS4PPF18D5A7206:EE_
X-MS-Office365-Filtering-Correlation-Id: da4df471-1e19-42ff-a38d-08ddb8a332a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFViUTZLY2xlcG9xT2xpelM3ejZiQXI5djNXWGVNRUxJbTB1ZGJOVEhLQTNY?=
 =?utf-8?B?Q3JqZnp3cEdRZGQ5ZnExSGljbnoxZ3NUcUtweW43Y1FTNld5UXV0YlpMVHUz?=
 =?utf-8?B?cDdJUFc0c21IdXhNSklEOXlTbnBpc25pU0tKRmZwUEJ0Kzh6WUNOQ0wrc0p0?=
 =?utf-8?B?UnZ4Zm5oSjRBNllodC9aVm11b1Q5bno2ZVNpM1NOZ3JtNXk0RlNDSUJHdVZi?=
 =?utf-8?B?RXlCY1BvMVJOb0FMYmpaUVYydmNUWS81WDZCS09UK3IvRWoxL3k2QjdPbWpW?=
 =?utf-8?B?RXVqbTF4b3ZkTkU0bjdqd2JOWXdta2hERkhjV2NRL21oRnlTK1IxdnZ2MWhZ?=
 =?utf-8?B?S3ZmdkYvd0dDYjU4dFFtcHVhakVmZGZvTkxIbDIyeVczekJEdm1hN1JEdndw?=
 =?utf-8?B?MVg3YXdQcGF6eWVlRXNXQ1NBaGNja2FEUUVYWjRwMkhuZkg5SVRZT29oVFZi?=
 =?utf-8?B?b2xCUGFMbkJSTzFTN3NtRWJLbUhqQ2lpdE1LbHc2S1VBUEoxUU51ZDlTR1Y4?=
 =?utf-8?B?ZmpJWjcyQ2FuZmZKSFIxTXFnSC9iL1NGR2g1aTlBZDNjYWFDbGd2bVlmdVNK?=
 =?utf-8?B?TmsxVVFDL29GaWw2QkMxTUcrd0RoTDBnZEZMdjlBSTltSVhNL3ZZZFp3Y3VJ?=
 =?utf-8?B?RWZ0a3lUbVFQM3Btaml2QmtjMjNHWjFJTUxaR2R4R3ljZlplRnJjNDMzMDZD?=
 =?utf-8?B?Z0VlK0x2NjBRVEdlak9tSTB1SXRucUlSdDVVZkdoMlQ0VnJBQm56cmtyTis5?=
 =?utf-8?B?dUlrL1N6UDV6MlQ4N2RXSEJtenExT0VMQVJwbStqNnJLZWhTSit6aWdjWGto?=
 =?utf-8?B?cFJDWk55NTV6ckxkNUFqenFzbEsxV29uSWE4S1gzdlN6UWVJdy9ncUpzR29T?=
 =?utf-8?B?VllOZmF2Q3B4ajRBWG15Rm8rVktVR2ZFandaeHh1T3paa0x2TjBTVFFTWHRm?=
 =?utf-8?B?aTEvS2UxQ3g3ZEVQdnFxRm41eU9vSmVGOXo2ZVNocHI3eFdUUmw5NVZad1Mv?=
 =?utf-8?B?aTMxVGtoQjBWZEhnY2pmTXQ0S3RTSEFZZXdwZmZBRmRnK2lMYW9xVUJFZTNX?=
 =?utf-8?B?Q3BrbWRJNS9CL3BuQ01mV1hvV3RVbXdkMDBaQUc3cmFJdEZoZEZXd3JNOXNh?=
 =?utf-8?B?cWVKNStZcG5mTzNBelJ0K2VNaGtJdFlzcU1KWGx4clhsMEFEWnBUYkorVisy?=
 =?utf-8?B?eEZtRUR5ZXJ1Ykx4QkJ3UWRFUmlxL2hSVVlSWnZ6WTVzbWIvRUkrYVBqVWpi?=
 =?utf-8?B?SXVZNzVYWmlFcVpXN2gzaWx6RzlFUGZlQ0pmYzQzMVFJcUdTdURxZ3ZLbHp2?=
 =?utf-8?B?ZmljbE1PR2FhK3U4TlpRem9tcUs4bVJvUjgvWkp1MVl5YVNQbXRPRVFhMVdj?=
 =?utf-8?B?bHdpeUhacGh1cnJUdmozLzh2YWlSVklRQ3AwSDhoUjhQcDhkYjB1RWpydUcw?=
 =?utf-8?B?dzZXUHcxK2NUZEFUK3pWVFBFVk9ndHZ3NFFIY3JFTVFkUjVPaWM4N0k4anpl?=
 =?utf-8?B?Q0xNVEc0VjhaSE4ydndCYW5McVdEWVh5TnMxcFVqaE1FOVIyNzNCc1NHaXcy?=
 =?utf-8?B?aGlqL0FNQ2wvcUJJSVRRZEVzRm16MEVka3hETzFFa05LcTArSlNQRlFHam9O?=
 =?utf-8?B?dFhVd0xJVzZRTjlIenNuYWdUK3pKRTZqT3p2UVVRYkdBZkxkVHducXpmOXFE?=
 =?utf-8?B?TjFqWGxkY2VJaUwrcGFnSkU0akdhaUUxTHdCa2hMbVhZUVczRVMrM0hHNnFh?=
 =?utf-8?B?Um8vZ0dFd2E1OTQzODVsR2NDejZTbnVTOGMyblkrR24xcUZvd09BMWRKOHJU?=
 =?utf-8?B?RHhYK20yZmlCTFdVci9CZE90TUdqelFoT0tiQXhQd0V6bTJwWWdtMHY4ODlv?=
 =?utf-8?B?MVFsZDVCdTdXUHZ3WEFNajhDRzQrcFUxYWZzWUtWVllqVXNXS213TEhOZUdR?=
 =?utf-8?Q?fdmwKT4E6Mk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWhRdnQyU3lFcytFL1l6NGo1NWJlSS9YQXZGWDlZeGpHY0ZzUDRxb0U4aEZQ?=
 =?utf-8?B?bUY2eHJpWHBsZGtxblE1VUtWbktZU05ZbHFsajR1bjFYUFVwM3hXUjgxMXFO?=
 =?utf-8?B?aUg4OHRWaGg5a21mR0MwZXNqNDlHUTV1c1ZLdVhFRXhvdnNPMXVXa1JZaUEz?=
 =?utf-8?B?eG5ZKzhGeXMvcEV3VzdFZE1HQ3h1U0xXQys3VitZaTRxZU8zVzBrejdrUG9H?=
 =?utf-8?B?Q1JJM1E5cHNVNnBibFgvTlpSVlZLNktROFZYOXFMS25yNW5YSGkway95QnFr?=
 =?utf-8?B?VWdZQnNFZ2Mya1hPMVlYS2VBcytpekJMa2o5R2l6and0amFjK1VUTG5yZzg1?=
 =?utf-8?B?NDBoSVNoN0dwelNYVTAxT0h1QTFpaXZ2aER4dTR4bVl3dUVBOGdESnI1aXc2?=
 =?utf-8?B?Z29Zb21mTklEVkVWbzl2aGpFT3NIN29iRXg0WWRpR2k5b1c0QnBhRUdINmxi?=
 =?utf-8?B?YWllcE5YU3BiOXJ1OHc4RFF3VDNDWkErY0tCdUhubSsxNzNhSm5HWnJGbUh2?=
 =?utf-8?B?TS9KL2d6MkhrS3A3U2RvbWVBTlIwZ2NWemIvZ1JOVVhmazBUT1BMVWdaeGEz?=
 =?utf-8?B?a3lXS01oNEFiUFhpVEdHZEx1Y05oRTN5bFFyanAvYks1bmU5REFmMGpEaEpI?=
 =?utf-8?B?clRHUUUyUFVBMjFwZit3dExjNkJSNDhSWWpGTjV3V1RZNjhzYWM3UlRKVnlt?=
 =?utf-8?B?Z2NZWlBFUngwZTBIMjM2UmMzNENwdzJMS1VTQk9iU3RyZW9UWS8wRXNPS2Jy?=
 =?utf-8?B?eUtxdllDdXVkTng1RlJQc0hEdm43ZVM3NkhHVEtuUXBDTUE0RXI0SFR6NmpC?=
 =?utf-8?B?OHQ2WDR1Uzd5eG1TakJqd0loMXBtYm1VOHAvWUNxOGdOSGVtOVF2NmxNMmVo?=
 =?utf-8?B?RXNEa0lTalNZQ3JMdHhWTWJIZTg2bHlXRHBZQXJhRU5TZTdYVEpTNjRKZWZi?=
 =?utf-8?B?L2NkTFZ4ZjdLdFI0T09GTmprQnhJOXBQQ3pHNjUyMUk0RG1ZMDh5M1QxVTdx?=
 =?utf-8?B?Z1FBOUxrbzJYNkw4eUFJelBxUERnODhRNnRaTFlRVmZ2VnNFZGkvVlp4Ryth?=
 =?utf-8?B?WjFzVXVRRWx3eitkYXM3MHkycnBkUnFQSTFtdnRmdjdPTmR2YmlQZ2hWelNl?=
 =?utf-8?B?eEI4TG9FdFhTUE9sbmljRS9uUGNORWV5a0ZablZHMTJBWWplNElrRFFwbG5r?=
 =?utf-8?B?ZEdRdWJPNXk2Sy9LaUtPL0hkTStNMVE0eHZjUVZRWEErWWI3bGNLamx3bXpn?=
 =?utf-8?B?SUNLdnZMN0V0MGtRRGp2Ny9sWGxkYTMxRFQ4KzJ5bHVJb3kxM3NjbVVNZmRS?=
 =?utf-8?B?MklNQjRqNFR0SEtSNmpsanRIYmNmdkttTWFzYXNwNkRCZUVOWFBhc2dHcGcz?=
 =?utf-8?B?ejlETVd4cWs5eEcwZWNCWjNScWNjcHJjWWNkWVdwcWJmY214OWliUVFhQmxG?=
 =?utf-8?B?Zlh0dlgyU3NYd2s4UGpMYjcwMnVhelFMWnJPRFphTUVoRlI3SDdNc29RbjBp?=
 =?utf-8?B?bVYxOC9pZ1c5R3VseGJCQXhkNCtYQnMzb3RqRFc1OHJrb1NVWTlxMGhVdEVI?=
 =?utf-8?B?ZHJYcGtTdVVGZmtnTWJkMzU5VFZWdTk3WmNMWFU1L3NGc3pLa3FEMHhaamVD?=
 =?utf-8?B?c2dLSlZYdkMzZGVNS3FDaEt1aDIrUGZ5cFdVbnl6bXNzVGp3LzBlVE1kQUFy?=
 =?utf-8?B?TGtDdmV4dHVvUUlLY01BSWJDblFMYzFjbjk4RjE3cGZ3SzJpc3phSyszam9y?=
 =?utf-8?B?WGgyMDRWUDF2aXF0WUkyQ3R6Q0E3blBIYkVGSkFSQzA5Z0J1TDBDSGp5Y3JG?=
 =?utf-8?B?aXZLbWREMWlVTVRYTjVoZm9yM2RtUUc5TnBaVGlTNy8yTFZDdzlHZnV0WkFn?=
 =?utf-8?B?NzFXVTBsdWZqWmtkYno4YjVkd2xLa1JLcnJzQ2hseW1Cck1ZY0hPVDc0VWFn?=
 =?utf-8?B?MTV3UVcrNmVWbFVjN2FDR0hiQUQ4RVRibThZUDVYOVRuVGhLMzMvc1JqOXZI?=
 =?utf-8?B?dVNCY3JDeWZadXh3K1ZZTGxrNzh1KzJVY2NxNmdNdDA3UVdFU3cvQjRkMmp0?=
 =?utf-8?B?LzgzZHR1SCszemk1RXB1RmZJRnVaTTh0M0o2aHlXTjlNSjZKbE9zVVlSNXZp?=
 =?utf-8?B?UGV1S3dqZG0rZGlvSEt2RzBwM1JPakNObHFzNmZEYzlEWFErSHpSbWtvayti?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PXm/8PE07dYIdhoJUSvWZ99bQDN6wf7CimVouMX6eCqa3Aps5Y84HWFIkQTODkH2reWggJ7QNyH53EUz9c6rBPydSmhgRsiOTrdiiZ9D/0TVge1UbyXMIfoxxJW7tX6d489E8595u97mWCNH/HENIlMJU/xQPqD5CDhTm0iktKxFcLjN9VQNYdmGpu7q30CtaaUhaUUyaN9DqezavARMHLsUVZUWhEAC7bma9PSiR/olSTCWJaq5IBmeh6JIcB41VWg/nJCB0w2IghUoChCmMayeFR+GF9Zekl4mdbH4xeM0GediknSdKuSfWpqB3QGvjSzQUeYxUAkK4cETJbRGda3666QJUpj0ryDSl0cqoM03uvoZeOgw/0ykFVhmQaVzEbfU/MpTeD20BBe/hVIoyjnNMqarQpY/zIYJDDpriyIG2/Jk9GYzpkBVpJ/8DCK+S+af8K5ZdED8G916WRIln2eVZ9b5k2vFr4HgDczQrAaYVZs/viyqTxXt/BZi2mAzb1bAckNUnClo3h3mXF/Td0Mn0A8nGgsigzmt7vOb1TCtBBns+s1ADggm7vLb/sgNNcJr1R3MTtTloEh+IOMU6c6ipD8YJHxV8IRv7Euv7Nc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4df471-1e19-42ff-a38d-08ddb8a332a7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 13:28:42.6055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVGCMik3kGo1/q+KXmHQQHEHSriBwiBmtRHYEv0ZiR8QvodZ5cC//kVTGBlxux1iicC1Nmsoa1u8QUJSyd7Ov2jFS8rCU1cf0sbbLb8z4xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF18D5A7206
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=852 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507010086
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA4NiBTYWx0ZWRfX9SO+paPR7ejJ YQ1EVKngyK4liVwVyMtOh4uG8cH4qi0HVsvoPu62hLlHEaodIlppoH+IgL32mSqjIYKneiXgdtB +5TpcmdqI+emvoYhRRwv+2CEf2bmThHI34n/VO7vA1edAdoTx9mP4YxSN2uahf5BtrIgZLzibcW
 b/zzn0YVDtNLBlLbYjuD3zdjxiVCWgQyZPB8iMejkf7yWpkffLfuo5sO0HJEvmOV6UUHD3ZfxqF 8mYPWyuqkL1JirTYddYp/SpDQZGefTOrrXqc6LjqcOSJI5Wstvlizeq8fqzHl+nqrdWIsOIb7lh Z9Ja6tmfivZ7W/BMi/933DJQf0zuQ5FWSdU603HYpMqgHyFLmgoXMaktPdpl0HzmktL1KwFUQWz
 vOJ1dVsMThqNoXTPiFVX9SQa6+98lN9oB3G1zf5+V8gt74RJA8AiaaMiP3ERTDdMNugr4Wo/
X-Authority-Analysis: v=2.4 cv=MvBS63ae c=1 sm=1 tr=0 ts=6863e2cb b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=5KLPUuaC_9wA:10 a=GoEa3M9JfhUA:10 a=EHIH61UZFpyhr7XdNCoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13215
X-Proofpoint-ORIG-GUID: VJ645ek6NoVJ-ZpVEyr54JKDXpUdG4Fd
X-Proofpoint-GUID: VJ645ek6NoVJ-ZpVEyr54JKDXpUdG4Fd

On Tue, Jul 01, 2025 at 06:53:47PM +0530, siddhartha@kenip.in wrote:
> Hi Lorenzo,
>
> Thanks for your clarification, and I appreciate your patience — especially
> given your role in maintaining and designing the VMA merge logic.
>
> I understand now that my earlier phrasing may have repeated your explanation
> for VMA adjacency, and I regret unintentionally restating it.
>
> I’ll make sure to be more careful and direct going forward.

Thanks, no problem. Mostly avoids confusion.

>
> As for the THP alignment condition now being `IS_ALIGNED(len, PMD_SIZE)`, I
> agree this resolves the regressions by removing alignment for non-aligned
> sizes, which was exactly what broke workloads like cactusBSSN or some AI
> inference loads.

Ack - we're really happy to hear about workloads that this has helped as this
kind of input is very important as to getting insight into how THP-related stuff
impacts real users so we can best optimise especially for workloads that are
very important in the industry right now.

>
> Thanks again for the guidance — I’m learning a lot from this thread.

Glad to have helped, thanks again for reporting!

>
> Best Regards,
> Siddhartha Sharma
>

Cheers, Lorenzo

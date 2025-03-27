Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7DC161302
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 04:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743049974; cv=fail; b=DrsSRobr/XR+BH8w/bcPUNIafV3Uu5rvon22yidzWGhBqALLMkjBz9BNNrfVI28SM6fxkM3LhTy+WuAgTtDD/vhD4MWdwSUsdrchVp2weevw2Ee25PgrWH03ZMCArfhOMXrbyWdxaBNb24JjaybGvXUyu8EhD+96YZOyiRmEn8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743049974; c=relaxed/simple;
	bh=zBV8txevLI2e9bo8H+7JDFBiKiNkKPcGJlPqviDWeIU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dHfQa+n2Jmz/ZMP0KBrN1eM2Skd7rW7DbMaa4ynGehhckJUVPpVsjcDB9z91zQuejUV4WEXLnSpKk9hcFDCXr5pJQJSjEVaxkyC1T5YB4f4WcTntbik8tiTEd4VxJRNLkrG6IaOpScOZLyIL6m5j5C/D2PO8XrOeo9pWEGoobSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=h+2qNJnw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wVP74fsj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="h+2qNJnw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wVP74fsj"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R2Ajh0025045;
	Thu, 27 Mar 2025 04:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=it5iBd5CciIaS12ntfT4Ra5UrT8jG3YTZLDvtj8OoXk=; b=
	h+2qNJnwWHmNbPH1IYcCV6WtdXBmOGLGLoJLD28ARxHSfy17FSX1YtDEAu0T+ywQ
	Ac41LeI4Yy8qCBqPojzW/SHpFPu9ONpTjhGtl9ndQAk1ZMfga2gLI8An9UBWuafR
	YWWmd2kYtgOjEeEPxCetA0yGEIYawd3mJvW3SRwpaiM6O9Cm3Vtpvziyd8aJWeZu
	CjgohZzVkF+2E966pK2V2IKb8oKzOKYgWGFZR579t0a+i2Ri2yMGMlkhavx2dJO2
	V/bp6F9DoCFI2o+bpVfhXg+XFjN2lCwyobfNAsIzS63lsU10V/v2d2z4lLZExeuX
	c5HSKL+SdjuHUB9OK83D9Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45mqft979f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 04:32:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52R48da1036890;
	Thu, 27 Mar 2025 04:32:41 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45jj5esm5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 04:32:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9pssXhB34kOa8hl1jKnnAsbgZAl2YqDJg2UckfY+LCbYt7nD8uKXHfqCG4/cM4GnX6A3tkhI/P9hJqIphr8Nl/Nhy2qDrLpLML3nIZlRLIc5BJoj5rgGqyIuW9hIA3y0bocz5yWJF9BfjH9faXelWfWWEYVHHm/GGUn0DsUrLnDnWdSITwdhEBrb8CQvUzlBqGnyL9CeC1jzvHInqLf4oalDc/e8v3bEtanXYhust7hDND4MlLNyDDG4G5kS9OIbe+GgXekh0p7VeYPSIkks2O6dLrNr3seVQxHsOvnH95MQ05zLzZnymFxaqjD1MZlYVPVIsvBpsYzafc8BEaOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=it5iBd5CciIaS12ntfT4Ra5UrT8jG3YTZLDvtj8OoXk=;
 b=pF1QsUmNMAqur3OsuWngXUwLBDvgYrHTdseA626Zad7cPw9geX9RxH9S3hY91TzsG7xTO17u+vRNwcoViNYB+62ckC0v0bgk7ZIgEwzPqZgQTTGn2OJrTSaVvhodOZKTXAWIPbodoJ73TgxmoiKzo6G6ZWQQLK+bOgV+P2juoQgaPLtnIdcHqKjHPqHFchISNG9ur5hGcqKzGqUnyXRGRp/yi0D4eBH30uNIigLxIDMWLTVClKUtkfpQ7VsSqw9x8ZdNSuUqcdc0C7fsQmw74YMjtwHNZddwR+YSU+BGmjZmnUQqEYYAazqM0P4gDp9JWqbLSvHv5CxS5LVGiZkx3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=it5iBd5CciIaS12ntfT4Ra5UrT8jG3YTZLDvtj8OoXk=;
 b=wVP74fsjPbcWxIijEUgLm2yKt8dnT/ZYXxpn3L74rQoJoDH4QGiBSeuZq8qRqjh2dxPzO+j03LxMWTpwT/vBUQU6ETimn1c91jDb0yceSuvl4vbEu+ItIU5QUNzFFqWIKHYKyxeZf6lWIQEhBC2oBv3yQ+pffV9cdrZyLEv8jAw=
Received: from MW4PR10MB5749.namprd10.prod.outlook.com (2603:10b6:303:184::12)
 by DS0PR10MB7512.namprd10.prod.outlook.com (2603:10b6:8:165::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 04:32:33 +0000
Received: from MW4PR10MB5749.namprd10.prod.outlook.com
 ([fe80::9a04:a919:657a:7454]) by MW4PR10MB5749.namprd10.prod.outlook.com
 ([fe80::9a04:a919:657a:7454%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 04:32:33 +0000
Message-ID: <73227d82-d641-4b95-9ad2-e156f655429e@oracle.com>
Date: Wed, 26 Mar 2025 21:32:32 -0700
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH v2 2/2] sched/numa: Add tracepoint that tracks the
 skipping of numa balancing due to cpuset memory pinning
To: Steven Rostedt <rostedt@goodmis.org>
Cc: peterz@infradead.org, mgorman@techsingularity.net, longman@redhat.com,
        linux-kernel@vger.kernel.org, mingo@redhat.com, tj@kernel.org
References: <20250327002352.203332-1-libo.chen@oracle.com>
 <20250327002352.203332-3-libo.chen@oracle.com>
 <bcba4d76-2c3f-4d11-baf0-02905db953dd@oracle.com>
 <20250326220620.60cec3b6@gandalf.local.home>
Content-Language: en-US
From: Libo Chen <libo.chen@oracle.com>
In-Reply-To: <20250326220620.60cec3b6@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0057.namprd17.prod.outlook.com
 (2603:10b6:a03:167::34) To MW4PR10MB5749.namprd10.prod.outlook.com
 (2603:10b6:303:184::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB5749:EE_|DS0PR10MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: d0343aa5-b937-4f0b-cbd8-08dd6ce864be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0tpemtWZ0gxcGEyVmNkLzZEbEVHalhpdm91OHcyM0VGejYyUnQ0cGtXaS84?=
 =?utf-8?B?VUpuTzg3QWZ0dkZxL0V3VGtFZHNIK0U1RmFlL1owSmo5cEtZL1RnN29SZjFT?=
 =?utf-8?B?SDFTY3gzT21XM2dyTjRxYWR3blUrVjR3WkVxZTdVYnYxSGFOQzBqSUF2VGh6?=
 =?utf-8?B?S1NpUHB1R21XQ2FCUFQwNWpjK0MyaUhGY1hIVllQOUFNeVZXQ1VaeE1PZUNM?=
 =?utf-8?B?dXhFN0gyR1hCYWZCYmdRaW1ISy83SnJjbUFvNUZkMDhEYmNzZnd4WUZ4bTZW?=
 =?utf-8?B?TGF2WUh5dW4zUFhtL3dnVkxhaTdUZE1ZMnkvVDF6bjZXMERBVTFtY0UzNDQw?=
 =?utf-8?B?ZzBBSFhSMmFGdGw2THY4RE1aakxqMk1CQzZ3aFNheVB5Y00xT3psSDM3SGU3?=
 =?utf-8?B?NytpYnNNTGc2VG5hV1I5UVltZFZhMkhxUFBOT0lMUlR5UkNuS3BFMEFldHo4?=
 =?utf-8?B?M0VCL1ZpNEJrVGF6cFV4VHlNTkNyQUNzd2Y4OXR4d3RhTEJRbmtDYnZpWUN5?=
 =?utf-8?B?aUtFeXdreWI1MXE1ajEzWVVOWVFFaWxSSjYwV0Z1ZmdhSmxDa1YzRTFXMkhH?=
 =?utf-8?B?eDJNdm1wL1NOS3lNU2wzZzhhMUpMYnJYMitHcEo4bWRwWXhITjRNbkZjSFd5?=
 =?utf-8?B?TmpDd01sZFdncGI4bTA3YlEzWDE2OVcwTHQwSDBZNVZRWHZBWE13YnNhWnRT?=
 =?utf-8?B?b0dBeXIzRWJYRFoxekZBd3NrTi9DMTRNd1lDcEhUcG51SnhQSkdKTGxtUEcy?=
 =?utf-8?B?QTEwKy9pN2RNdzJ3dHBvc2k2VXMveGFZd24xblhsTjJsL1FhSFV1WWI5R0w5?=
 =?utf-8?B?bUdsTndGeCs2RnM2ZEk1ek56alJZbDFMdkhRazBRbHhkbkJELzY3TllSZk1s?=
 =?utf-8?B?NzlXenRHOEJtWHk4ZEI3dTgrRk9VY2ZWRDNsSXdNVmdTR3ZWWHNJNTdpd0k0?=
 =?utf-8?B?L2taeWllcG94RFNiaFM1NVAvMGtHdkVsYSt3by9STUduaHVNUUp3VnJRSFU0?=
 =?utf-8?B?UVd6UDAzVzFrZ0Q4Mnc1a3dQcXFJaU9Qa3RrN0lqWDNrWXFkY0xvSk4xaXM2?=
 =?utf-8?B?VjdZTUhhS3BjdEtpSm5Od0k4bkp0Wmc5YkVxTmlSZEpEZWhYL0FoV1VFVkw0?=
 =?utf-8?B?MytqY1h3dkZkc3BmR3hsSS85ZkhRRHpzNm1pTTNtUVYxUHZLeTdaSzdDU0c2?=
 =?utf-8?B?M04zLzVXc2kzVUNVN29DK3gzZG5UN3J6UUdYVHVVOGVmT1J0Nzh2M2pCTFd2?=
 =?utf-8?B?cEx4d0x5eDg1VFlnWFQ1NTh0SXFXdHl1VW52TGFUMk41OWFmWk1kQlpCLzNt?=
 =?utf-8?B?bnNlQWxmMnZaZW1iZFNEQlRLMVJ1RFVJSkFOVW9sS0NLb3BzMXJ3Vldka0pj?=
 =?utf-8?B?NDF2eGVnWUtlcFlTbDBKSndzclg0c2RFVXljNTFwOEh5bU14TUgrTWs5VXdF?=
 =?utf-8?B?bUs1N2o3cWFEK3FKOWxia0h4NEVWYUhiYnh2OHlxVmZMT2lOeFRuTHVweWly?=
 =?utf-8?B?NlQyNGtTTnJsWFpnb0l6RFdaWWJReEsvMW84a3YwdlZaKzlmVjRGcXVTSEpK?=
 =?utf-8?B?Q0FubnI1MDR1SVN1Tjg4U2J6Z1FyZkZXQjRCQWFMZ3VwN2FMWUk0MytxdFZN?=
 =?utf-8?B?a2d5YkFNNExQSFRpV1hUMmM5S2p0SkJCM1luYlRrZXhGMUI4OXFXQ3dOV2Q3?=
 =?utf-8?B?Zk4ycURodEhNY3J5RWZCQU1XUjdmb0pQUFR0Rmp0aEhFalNMSUNlL05Ma3Fs?=
 =?utf-8?B?TmZqUnhBSVBRV2tQZDYxWnRVckh1NHZNUEozNlo0WWJidGFwUFdXWVExQmtr?=
 =?utf-8?B?NVppTTZ1c2gxZFNkdTFlaEZINEc3SVF5aHBDLytrbXE1VnZPL1B2a1owNnA2?=
 =?utf-8?Q?10O8ouub+L/VN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB5749.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzkwNWN4RUtXWTE5WlBjUTNwejhWV1N0ZTlURmNRc2p4dSttT21PeXpzQmht?=
 =?utf-8?B?ZXduZFp4VTFkU3VTR0dFUlRIcnlLZ0prQlZtODhwem03OW8zdUNuMnRhczFk?=
 =?utf-8?B?TUJ6U0hrZ1FTQitGZVlqK2NGUkcrb0NFQ2pwbllGYVdEbFhTTmNlSm5jeEZV?=
 =?utf-8?B?WEtBaDV0SDQzVk1XSG9oREt1ZzY5MjB3d3B1NVpVMFh6ME53b0piLzliZ2RX?=
 =?utf-8?B?K3pTSE8yY1MySFFwQkc0dmhrLzJqZEJyMFBBSmRRREpCdTZvbDdRaERvVEx4?=
 =?utf-8?B?T0hXOVorSk83cmk2V3pybFhmZFl3SGJtMHhVTS9DbGNma2JicDJVTEFNWFVp?=
 =?utf-8?B?RkIyc3kxSWxNM1B5SHovamFUOVFienJZQllha2RCR2pwSWNjZ21kR1FobDVt?=
 =?utf-8?B?NHRpSStGRjZ6a3ZCMmJTU1QvVVd1ZHN6TVAvVEtvQ2ZENlJnLytkQTc2RGVD?=
 =?utf-8?B?eEhWcnczd2ZnQ0VsOUcxa3BqblRyS0pPNnBtaStWQ2NUOEgyeWlNazBjUnhF?=
 =?utf-8?B?UWl3RnlkeUpyVEIxUjBTQm50WERFMmRmOFFQekZ1S2VTdHNlZXRQVlMvVlo2?=
 =?utf-8?B?MFI0QkdYNW5mWWJSMmFQSzMyVStscDFzL1VlTmVJRFVOUUd4YzNqb1B0c0VT?=
 =?utf-8?B?R1ZWTWdBWkg5VVNiK1J5cnhjY3Jnc2RiNjMraTluTExEa1NpRm5OcUczUUdk?=
 =?utf-8?B?N0ZNMXdmYTJZOElvQXc4VVRqeXFXUEEzeXBxbHUvUkR6a3VGek5qbUI2UVJo?=
 =?utf-8?B?V0pPSVFyb0F5SnBYU1dsZVFaUFBFWHFZOFNLZjNhcjlkeGFmSXJPUUJPc3JE?=
 =?utf-8?B?MVBTM1BBb0Nkc0ZFOEc3dU5JZGFEOVArSnRDNXduaGJhTVg1Z3JUSGNxSUNi?=
 =?utf-8?B?U2x0WVJrVTFTWkpYN1YvUlZXblNmMk01MTZ2VHpyc1lBU21DZFoyS2VBaWtT?=
 =?utf-8?B?UkUrb0pJbTUvQVBjUWVoVEpHSTFLV3NIMDFjZkc0cVBZRWF1YnhvcUlGQ2lV?=
 =?utf-8?B?RU81dEJ2WFIvakF5dkZiRkNHM002Y3lpd1VxSm93MFVjUWhLRklKdDBvV2Zk?=
 =?utf-8?B?aHRlYlNnL1Irb05rTGJrZWZDcDBDc3J4N283SjYrQmkxb0EwcFNXcmFLYkIw?=
 =?utf-8?B?OFNhL2U0MVZUVER0cmljdXFNbnF3eXRHamtoRzVCb09oVDllVXByS3lCbFNS?=
 =?utf-8?B?bjA0c0hBV0owRWsxdFVEQ08yYmEyRzRiVFppOGE2UmVnT1Y0NEtaeEdtTkdH?=
 =?utf-8?B?cjh2bWRvK1UwcGw3TjU5dkJjQVRuWTRiMzVhbGFCekF2dUZEU2VSSklxVG1m?=
 =?utf-8?B?N1FFR0NKTWpHbHRhV1p3dFI3cUVhRS9ZNTBLVHY0UFlwaTFCRXFhZWVLMHl4?=
 =?utf-8?B?azY2RDhONEN3V2VqQWM3VkJzZTB3b1AxdGZ3dGNoZE9yWWZNYy8wNi9ocmRq?=
 =?utf-8?B?NnN3WEMvdisvcEJ3Y0xUS1JETnpxU3EzZjMxdWU1V3g2NTIrVFhEY0ErL1Q0?=
 =?utf-8?B?c0psdHU2VjR5bFRCaloxMS9BMXVnZE9wSzFJN0dOaUMvNGFhMzVQakFNak1Q?=
 =?utf-8?B?ZE5IczAxbmxMKzFWa0VMcUJmaDNBTjhjZy9RT3VCMDZlRzUyMEdIRkFpTmVC?=
 =?utf-8?B?YmtRZytoM3R1cURYWktrMWI4UWZObHQ1dXRZdDNDcjNabHJDbWZKbkxTRk5s?=
 =?utf-8?B?Q2xiNHBnNUNUVUlLNzVEZWtnQzh0VkxTMnBETGd1b1RDeEswV1J6WEg5TXp3?=
 =?utf-8?B?WXZ3M0piT0xYNjBZK1RwRzRSQ2ZnUlMzU2pEaVN4MnBCVjdYNnVGQTZvbGtF?=
 =?utf-8?B?SVNIVkhPT2Q3KzNEWENuUkV0cnF4T3YxS2Q0Rlcrb25za2E3Y0N5c1dHTkxR?=
 =?utf-8?B?UyswTUVxdVVaSW5ocDFlclVMdU5Fbk83SkJJNG0vdXBGNEY0eUVZeXdSRUVp?=
 =?utf-8?B?czdjenN3cDRhQ3FxcTluT3BscTc2SWZSZnE4bWFWR0ZDNmY5QVhvUXg4Y051?=
 =?utf-8?B?L3hDNms5dG91Q0N4TXBYTHBnUXBLSU9SSml0Skl6NDlGL0Z4dGRRSnZielVM?=
 =?utf-8?B?S2xZa1NaekRtU2Y4Vm1NQ3IvS21xNFVIM2lEcGJFTE4rWUpSa3FSZUMyRHJv?=
 =?utf-8?Q?qH1Bj/+fHHNd0pITyKm5X3xvD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yk1id5lFA8pXQsN+RevC7ldqM14TrTv+47zkEUAoH2v75qGIq/KFfOJO7q7/7jXrJZMak6h54m5AWwFtCyEWFi3f8zFjJ1Fj7Rv+Fi9PW+/HgICZELI9AeNt7wP2er3lMRrWOdVWUqRUYmntZMy45sFbOR2RY+Rzblf/uk0UUCpffZ4p+YoC05Zoj0ZL6kysevZE7D/niayC3t6duHHmox18NXiR0x5hneTv6OTAn8MTIOYEyemEhcj6gezw75Y5LjgcRBL1tX6oa23VNMJQ4vxDf6vQqAIqbBYiwQoRTHd38tk1OrSdctTbQUbookCbqBZjvnZ3TI0QJvcbC/ga2cNsCcrbyP+JKGji66UzHB3Yl7a7/X2NiEF5cLHU9+iCDD0rMCxHGVuu/9sCzX9U+LLw2+t0hyixsiutWOYzp2Zsxv5crWubFG9Iaa2smcRDWOPw/idSHhpABUv0qL63Gx3dPGwjUulO2RKjgB/a7VfIh/6m6mbL7C/2dHIR/DpmSiRxJeg7H3WsH908NJzcN8Q3MJHzzKoTDlv2m4xwTWyOs7chLjbMiPrhlm2FDPY9g0rPPKb2KUGyPoO1JUDlxH7blk2it3U4ptbzQnDUG1M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0343aa5-b937-4f0b-cbd8-08dd6ce864be
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB5749.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 04:32:33.6431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsTquqXvvkbrHHO8FaH2AIAYF/FQ2Q8H5BKqsz4t74ueBbyXtDZ7Umd+aOU9GFMjlpkRafjT/Z84NIex/EVw/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7512
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=830 suspectscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503270027
X-Proofpoint-GUID: jQU7FhZQgXtQZcTfxG-QN1FGY9NKYxKB
X-Proofpoint-ORIG-GUID: jQU7FhZQgXtQZcTfxG-QN1FGY9NKYxKB



On 3/26/25 19:06, Steven Rostedt wrote:
> On Wed, 26 Mar 2025 17:40:02 -0700
> Libo Chen <libo.chen@oracle.com> wrote:
> 
>>> +	TP_printk("comm=%s pid=%d tgid=%d ngid=%d mem_node_allowed_mask=%lx",  
>>
>>
>> I cannot find a way to print out nodemask_t nicely here with %*pbl.
>> So I fall back to just raw hex value. Will be grateful if someone
>> knows a better way to print nodemask nicely in a tracepoint  
> 
> Ug.
> 
> I guess I need to add support for that. Both in the boot verifier as well
> as in libtraceevent.
> 

That will be fantastic, I think this is quite useful.

Thanks,
Libo

> -- Steve


Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0520D2DCF62
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585769; cv=fail; b=qKuJ0J/X47JSKOceVsmOhC9U5iRSjCnQHFBjNW9i93h3ykLghEbfCM5Zl0gA78q8cDGTrOMAos1ieqm+E0HoSeNWLsOfeBtB5rlEIDyfsg25N5cFx2Q8rTWspk3ADC+FTZ9snuy7BAiDrBAd6qsVLQvPwogluhGBXXq4gHBewnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585769; c=relaxed/simple;
	bh=p+/R9f2nYMNhRRG8CKyJYsZoV2iS7Zy3+63baPgyfkk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mvrMavn5zwDJa2QtKQysbZ+HTLbxK5e72DEuwi3hcuEY+Plvbu6Dy52zxd2DGzb3SGl0E0+GE4FIxxtcLVwWV+BaZxjoVC+ReCi/gL+mcWb9mIY0QYPCy4haj9AVj3kBphDAsm8wDSgpXD+5iTZk35Z+xX9AYuMd3Qof5WLKowY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZLOT5BA2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tDaw8qp1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZLOT5BA2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tDaw8qp1"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563LZmvF003455;
	Thu, 3 Jul 2025 23:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Tee19afMl+XJ87gdA7HIq7snXMQ898gSRnSS4212mmM=; b=
	ZLOT5BA2/PIreevlsr+w9BOTbbysJ90FG30AsnsA41zHf6StHxeSn5fVPV6DLwmX
	xKrt5blZ2fYlW+ElyTh85qdvVp17B+3pNX1RHI76q58V3D4cvdeARtR+nUwfgKqW
	708mWUGr1y3IgBrP53iIEhUdYXaJ7QcBj3Tbo1QY8jDkg4Db7taHhSWx6PdH08vj
	KaOvbOfz+18P6qqLRMHSrPb8dDMgmmtpF0mk32ceRs8t1RqoeeUsFZyuWD8gvHYy
	KUM0Q38N8zAvvzko15toc34cGFWfOa/Vd12aGNvOKHT4oMYjQ46SOz6lpLjj7qnF
	uGWVfdFI0lFEyWfpIqn/kg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j80w9v94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 23:35:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563LKRie024033;
	Thu, 3 Jul 2025 23:35:50 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11012004.outbound.protection.outlook.com [40.93.200.4])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1j1bdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 23:35:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRKQ3Cc+HhJQiGx+07MkxbFuwHA34jIUsQJ75PL0z3CnSyfsdlrEtTP35D/H3AUSkTjJ7q67hoKTsKH+vBKijG2lOCcpX6JDBL/12EVKy5QLX1e55VvVIYXPrwEBTI/V6TFcg+zbmck2YQ7Hc2EbhmcQd0NO7e8xKTCL/j7aHyTE6AVr6/lyLqYBys78pUvvQDaUTZNLYFGXkE3YvTacV4u16jQqpVovMilWtP154de1tynUhrpeAk3tytB11c7hqy3Hbh56YLyTLWS9IUdVI/gIiyKcQ7aqr2U4Pr7lxba7dq7l15JSvD+sd5fj5WtSA8Z2qK8Cuu3VcxAo4v3D/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tee19afMl+XJ87gdA7HIq7snXMQ898gSRnSS4212mmM=;
 b=dYCkZamkYi/EabbLnA/liAs2NT6vbKc+zJyweWOyFK38EBZJ9I5hEbXYAi0haIpjm00ZVl/5H8Aj+BwrQHEnuH9N/5272KFBmO3S2S7RB/srLTlcEFiQeZgP0ZKi2oYI30MDje8zb1vnOx01Lh5uGcdvy4c+irTzCUYFUkm43JyaqpMr34pIr7cAJOq/g2MDruWdMLB2j/vb8S1b8sdmf4J7mYM+FX1IXjf8ywL65PyZrfLiTxOeA7pwd7jmPQZb7PyCnXnOxQqXHFzBDdL/vwzw+r7YZpXYbhluBzwpXA82tnR1rifrafjMJikPWnCQ8jEm3p7flLR994fYd/A0Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tee19afMl+XJ87gdA7HIq7snXMQ898gSRnSS4212mmM=;
 b=tDaw8qp1DiZMua9jeuIzmD1Z8zoWGpnncxQQHo7kt53NMfCsVaJNrCyRUR3WLtIUfedph/PifjkqIZdB+jg9G70wtbaWZLghRsJT7yEAqLwXeQiZ8+QGkp4bwXaWp9cNqurnWZY22IUS7aL857RyHKxgigb9WQIvjhhu6a4+LOE=
Received: from DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d1f) by MN0PR10MB5959.namprd10.prod.outlook.com
 (2603:10b6:208:3cd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 23:35:45 +0000
Received: from DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 ([fe80::2072:7ae5:a89:c52a]) by DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 ([fe80::2072:7ae5:a89:c52a%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 23:35:45 +0000
Message-ID: <12b84e27-f9b1-477e-8e56-4b7c6727e86b@oracle.com>
Date: Thu, 3 Jul 2025 16:35:42 -0700
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, Michal Hocko <mhocko@suse.com>,
        Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Tim Chen <tim.c.chen@intel.com>, linux-kernel@vger.kernel.org,
        Jirka Hladky <jhladky@redhat.com>,
        Srikanth Aithal <Srikanth.Aithal@amd.com>,
        Suneeth D <Suneeth.D@amd.com>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
 <20250703072608.GS1613200@noisy.programming.kicks-ass.net>
 <aGZNTtJuCyHJE_25@tiehlicka>
 <20250703115006.GT1613200@noisy.programming.kicks-ass.net>
 <aGZxFRVxHouLaMPg@tiehlicka> <b4891cca-4da3-4411-bc9c-669118bf825a@intel.com>
 <e944b504-a852-4f07-a514-7dd99e63b888@oracle.com>
 <20250703123626.GW1613200@noisy.programming.kicks-ass.net>
 <0182cc94-c557-4ce5-b245-fb1fd54bc59b@oracle.com>
 <20250703141800.GX1613200@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Libo Chen <libo.chen@oracle.com>
In-Reply-To: <20250703141800.GX1613200@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0001.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::14) To DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d1f)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF5ADB4ADFC:EE_|MN0PR10MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: cec7de93-10a2-45b1-5bc2-08ddba8a550f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEdJWUdxcHpDN0U5Z0JsUExYVnBTcG01SndGcytVRXFiVEhESUlhZEJZbWIy?=
 =?utf-8?B?Sml1ZzEyN2dTa2dNRXBBc1RjRFhsd05mTjAvQ3RURTludmhFRFo0S3BYU0V1?=
 =?utf-8?B?U1NSMEh1RE9JRkxLb2t4N1E5ZXBYbFJXWmtiZGZaUjhvVGNOemdQR1puU2Vn?=
 =?utf-8?B?L2hlcU1XMllxV2lNdVhFV1Bzc0hFUU5WQWlIVDRhcUVUQ3VEaXdHSERrQ1d1?=
 =?utf-8?B?SVgwMGQ5czJEUzE2M0lrZEpMcGdEd2I2K3R2UmpMUnJzeWx0TGdXUUsyVjUw?=
 =?utf-8?B?M3paeUtTUHo3dG9KUDBRSGR5YTFVMitmN1pVblVaYVBlMWNrOXVOMy8wWUdy?=
 =?utf-8?B?NmJoOTI0UE1iVVJhOFF1bzNIZC9TYTgzcXZPOWUxTXJHZHVRbU5NNHFzNmJx?=
 =?utf-8?B?T1JyaDYrUU9sbUFRd3dhWEdzZC96cFVkRGRkMG5jZVM1amgyTVlHanVOb1kz?=
 =?utf-8?B?MU1VaGlzQW9pMTNEdTFpZ1FOUTAzVVBuclN3ZWRZVkFPZ1BCazE3NW9tZ2NJ?=
 =?utf-8?B?TE95eERZZGtwbE5MZENCVWNGYVdsVWJ6bHlDWEdGOW5KYTE1TXlodjE3MGVs?=
 =?utf-8?B?UlNxU1FudDgyVHdoeUFWMlcvWVJ2K0ZGTktBcUNXZlF2RzNUZWR1NXFZeWtL?=
 =?utf-8?B?aER1MGNPZUZSaUMwNHdnQWhzL3Y5aTMvNGYza3RFY2VsS3k2Zkc2R3BETTcw?=
 =?utf-8?B?ZXE4Q2Z3b05BbzJZS2NtNG5CaFd5TnpESVVlZklaZG15VTY5aTdiSGdVWnNK?=
 =?utf-8?B?RjEvZ3hreFAzeUtmV2hGS3FBSTdJUEdwRDJFUCsrcTlIUGtuNFYrMUVidkZK?=
 =?utf-8?B?a0ZCd0ozdWhOdERsY1JaVDU1dFlwRG5VcFdTTmZ0cVdZSVhjK0NSRjRkdDdQ?=
 =?utf-8?B?WXJmQnlsQUgxZlpJSCtxUXFsZ3pIRXhJTWFGcmJybUptd0dKblF6d3lBemVE?=
 =?utf-8?B?V2hoNVJySUxSaFgzUFdYQ2RuL21IMndEWDZ5RjczVUFXK2poMGxYTjl1cGJB?=
 =?utf-8?B?QkEvRU5qSld1TnU4UmdPNkVkOE1BZTE1aDNNRXZKRFdsY1pLV3dGM3dIN1pX?=
 =?utf-8?B?ekJNQ2ttUEdBVU1oL3oxOEJibzJFemhWWjdkeUYyRjlYZE82NTkvQThtdGNJ?=
 =?utf-8?B?N1M5ZnpkQ3FOUWhWNnR1UW5kb1pKQWJFVjZydEFBeXRCL3pQRjl3VU9WclRw?=
 =?utf-8?B?WlhFaW1OVEEvandNYi9iUDVqb2k2T3pHeHk3cHB3QzNBUnh2aFVsYXorVkcx?=
 =?utf-8?B?YTdWKytHWEVHbFVpaFdPQmc3M1B3ekVxMzhYNkNoKzlkaEVNUGxBWkpIanVF?=
 =?utf-8?B?Zm53aDhtT2pDckpGajV3aWw5R3g1QzZwS1ZBSjVOaWdkSUFIcVZGV1kweTBq?=
 =?utf-8?B?WXh4Vk41dnI4a3kzRlF5eXBlS09GTWpMRlozbEZEMG1Td1lDdG9XaDBvSmJP?=
 =?utf-8?B?dTBWWi84cGZ2QjlYRHRwSTdyeHlhWi9BSnpmL09qVXlJNGdremZLQmtNOVB5?=
 =?utf-8?B?UXJSQmQzUW44Q0RHcSt1L3FhWENZYWxxWHN2UlRVK1Jsajg0QkdUc1ZVaE4y?=
 =?utf-8?B?aUF1NjFCejNwQXl5aEpYdUVmTTJXWVJpd202YlN5RDBHd0h5aDNWL2RNWHpD?=
 =?utf-8?B?c1ZoQjBGU2tBTUpjZWlRK2pxWFFHV1k3U2hBSHpqUmlnU3lGbytXOE9yc3Fp?=
 =?utf-8?B?SklKNTA0Y1EybFFxRGpncVg2UVNaQTRTRk9NdFNqSlltRVIrL0ZQUkZ0WHA3?=
 =?utf-8?B?QkZGdXBSRGQ4MHpQaU9OM1grMTg5WkZUMFNIOGtnbWZscHdTSktFSHV3TFJI?=
 =?utf-8?B?WUszWWRCTE9aNTI3Q3RLNW1qOStDSmdJZ3ZhcU5ZY240OGhnWFpiNytRaVlF?=
 =?utf-8?B?S1BkVTZ0ZEhJcWFyM09ibUFKODdWNzlZQTNlQjJXQ2JuK0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF5ADB4ADFC.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVJYY2pQVVNDMS84N3dXREVFMUVjMkdrcGx1UWNKK0kxaU5qbERpVWhaVnB0?=
 =?utf-8?B?UzVDbldnc0NqZEh1T2dsVUhzZVR0UGIya1RkMWZnazlVd2dzczF2ZXlTeDAx?=
 =?utf-8?B?cmhxU2VXOU9oRW5lYi9WaENJK1lKaGZkOEs0cjRjMGlIMHFHME9hVFZvbWdh?=
 =?utf-8?B?Z1pYZnFaUkJ2ZWp2MVg4MHhwYXErYVNMUjVVcnp4SC9nMkVUTDlMcEhmdzFt?=
 =?utf-8?B?bkhSa1F5UTdJSERzRXZRK3doVXRBR3JTVkhmd1JudjQ5VHcwZGQ4eGpuUWpq?=
 =?utf-8?B?RjQ0Z1ZHeXhPL2pmY3cyZ1BvU1Y4THZkQmE3Vjlac0xhVWdWU1JCamNwbVhC?=
 =?utf-8?B?VmJsaXBTQW84VXZnZ2RLWjFsRXhkZDB0NS9Mc1JzcVQ1di9KbmRKT25KQW9O?=
 =?utf-8?B?NnAvakRka20wVXg1eXVscHRNQzZGZ3dxVW1ZZWtBRVVwTzQyRVU3T3lIQWhm?=
 =?utf-8?B?bjErQUZWMHVjTmUzbFdOQUg4bUhjMnB2NVV6Um1YNlhKK0k0N0srOFh3c1VR?=
 =?utf-8?B?WGlqbFhBdTNEREJKM1J3UE9odGpDbHlTZFM2N0tid09EejVDMmlnamttZjlw?=
 =?utf-8?B?VCt2UDkyZTBHZDdlVmdlaSt3RzJOMVJyZ1F2ZEN0VDJ4aXNVZlhQa2xua0Yv?=
 =?utf-8?B?M1V3ZVkvWHdkY1JXQW1ISzcxVW9aaGlNaG54aklQcU8raVd4Sm9TcVFKQ0hk?=
 =?utf-8?B?RzFyaHczam11dzZyYW93cXQzOWlhaTNwZjlWRTFpMlVRRjBrdi9XeHBORmk5?=
 =?utf-8?B?QnZhOEtmdHNSRFdoMXBncnNvM0FBMk5QRlMwKzhhZkV1NkE2QUZDRGd2OEpa?=
 =?utf-8?B?VGhVVWFMNGhSMVR3OWk5bmFmTXpuYzk5TGdpZVQvWUpheUF4dzlwWkR0VkhC?=
 =?utf-8?B?RjFEYlRZVmFBYWRET2J1Y3I0TG1uTENNUnJDVC9STVJnbTJlNlAyT01adUtl?=
 =?utf-8?B?Rk1VbVl5bTVHdkd1U0lmT2dvTEdKaHk4bVBzdi9vcjlKTklOYk16Si9hdTBz?=
 =?utf-8?B?VVJoZkNEVEFvNmtuUk1mYU1lVXllMzFLaVdQOFg0RDhKUzNiY3d1c1Q4OVJv?=
 =?utf-8?B?QWdTMDlmSDRNNWxjaUR5ODVUWVN2RHljbG5QR3NOZitpblFQcE1yemJ1eXBi?=
 =?utf-8?B?QnNnL1VmbHVFWkd5aHBBZm5CQ3ZvU0RCL00yd1dMZHRLT1hYS05raVozUHZL?=
 =?utf-8?B?UDRVMDlqaHJxMVl1dExCK09uQ2tHTVlpZTFwTy9NMXdxOGFnbUlJNU9OUGpm?=
 =?utf-8?B?MmZ3SnlvU3ZLTXA1QU1kNnVyMndDcW01YnI4ZE42NXRvOHU1aFpGQmFmL2do?=
 =?utf-8?B?Q0dNMzU0Tkd6MXJybGNhR1YvSWJRZlcyemlNMjJnQWZuald6UHB1K2hwMHEx?=
 =?utf-8?B?UlJ4emh6aVhUQjBqMzgwQUN2bm54c25vVHZWbGpRMElaSmRLS2c4SDN5RzRJ?=
 =?utf-8?B?VUZwMGsvMlU0NW13bzR4Q0RiWlVCWFFzQUxMUUY2eEg4dStvUFNDcmZzTnJT?=
 =?utf-8?B?SjVrZk12UTN4NlBleEhnU0xYOGtrMUQzOGZoMDM5YXZHZHNNeGNqZkx5aGh1?=
 =?utf-8?B?d0JOSnJtc3RHdnhVdUxuZjhaamtnTm84ZXBVWHdZNGtyVm5Zd0JhejZLRE1W?=
 =?utf-8?B?bTNaOGhjRjB1c2IyTzQ2UURYdEFUOXZzbUNVZ3dMbDhpaVZ3OS9WcG11Mmo5?=
 =?utf-8?B?ZUlmWG51blZpeUZlaW91YXdmd2lCM3lIS1BTWkVibllvd2lOSVl5YVk3aHRF?=
 =?utf-8?B?SUd0NEVmNVNuYlp5bjlUZE5XSmw3MnZKU205SlZuVFBXczdEQy9WbmNXM0VY?=
 =?utf-8?B?dzY5dGJSUzBiNVI2U1ZqbDJpTTVjMDd5blNtZ21FUDRXV1pKTXl2Z1I0cVQy?=
 =?utf-8?B?SmdDcU9UMVNlWHBpb2VPUXVCU2ZVZjhFWHlCTkVqRzIvd0czQzdJMlhhNlZZ?=
 =?utf-8?B?T2NONDg1aXBmYmROQ09uUXFpallaSk16aEMrTTIyMlhsdklpL1gxNUlwTHRM?=
 =?utf-8?B?RmllVjBBTW5sNTRWNkRhMFJIWlBreTM2WnZaZEFmRlZTL2NCNkM1ZTA4TzIv?=
 =?utf-8?B?TjJnMTNQTVZncUxrUktjMll6TmpScDVBVVNkSnVmTVlFMjdVa3FkT2VQNVls?=
 =?utf-8?Q?DVL6tWpbXCLMfqCh6rhDho836?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OR0YhT0CPWGb6rOrkaOrt+XlidcpQK7dC8Wt/cLfuwhOJD/+FCtH71uPURpurM2k80Xz6H4JOLpqpZXvb+JfcikqH6KeiEy7qi3WsLrb0VvNpeZoOZ3kKqXtvo0HjKp9eqJoBIa1w06dkyLqKwQn3CDi//4qoA3j8d4osyEtW+PaBLsJpeY4Vtvp5uS6aFGHLCY0N/4c2X+vBNzj8pudcFXucDJ77yAOCGpGrPR4VdW+v4RJ8SA2F8yDGia371d08C9fxOQOW4+juEVfwmAHU0QM2PyrLmNAebv6emLoSuOhWknT+vMVEnegBm/hZeaoEaZXV92tVulHvaOjATu5LzOuhRSxWttcp74zNkhiNLqY1H4RyhlHIdlV0AvLdXGs3v28DLPR4Dt3cyxKnuY38fy+9vPJh8nTwl4YfHZYq6s0FsqQl+N5ejG8G1oT8VtGPm/Aohc4cUDaxknuCN4w0CCHzSaavN6x+jIe+mTQBLgTlwyQ+ay4CGenAna6L+R3YbddpMGO9k+nnqYQZNulOdcrDd/U/eQZJEm5CHXmNClY/M1ULsFfkxh8l+TvyNJ7GkH3SOZPEQxNWfiUWau4aklC3Kylb8oNJYaHRYSP8Ts=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec7de93-10a2-45b1-5bc2-08ddba8a550f
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:35:45.6155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGgq5Ob/864ID7Vm9N5smk0wMJN/nOrnTF4y9Ok52YsWnUD8QfMwmrsU8PepJnVoDCRj2gMt/LjQXMG8tPHH3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5959
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_06,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030193
X-Proofpoint-GUID: gxsnL5NEjZY9KXrn2fNvAwtXNX1EmIrK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE5MyBTYWx0ZWRfX7u1YqGARDSAz xwg08oJ/Hg2eKoGRsFF7yFUkkVBXXfhsbYQoK5g6FbNz7WiqdVKEPaPebeIrHyfXezyRIHc0W1X rNnksDcRIrGhyrN96FRwvamZg9GdTl2I21eDq9j0dvvXseitXfylTko4LaHIFboZyL6GupHYJ8s
 2kl24Z9MbHgTrs49QRTL4UDUqjqu7T12UG6QvOvVNnsXZjppOs92OKbJ7ZD10Z13iPIbDInkUjX rawZd0GJxx+SHudBDxG8WCR9hacFKQ3nz/ecWdeq8antZFuf3ISd4bZAfQ7qtmxs8feap2o8qBa NFEzY6DQASN6OwCmj0+ySr22+lW7s2BUk8rE8eEmuyaQ9YaTkUNsiCwvfjYcnwNeZDimjFmJxUG
 AyEINe8jNMloTlSVrJ6Km2D/4v2NrAcQVJAASSoCMoGiDEZ+3KJ8VvqCkNz+zJuC+6MPJFSW
X-Authority-Analysis: v=2.4 cv=D6hHKuRj c=1 sm=1 tr=0 ts=686713d6 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=70F8M1xG38uyGJWC65kA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12058
X-Proofpoint-ORIG-GUID: gxsnL5NEjZY9KXrn2fNvAwtXNX1EmIrK



On 7/3/25 07:18, Peter Zijlstra wrote:
> On Thu, Jul 03, 2025 at 06:57:04AM -0700, Libo Chen wrote:
>>
>>
>> On 7/3/25 05:36, Peter Zijlstra wrote:
>>> On Thu, Jul 03, 2025 at 05:20:47AM -0700, Libo Chen wrote:
>>>
>>>> I agree. The other parts, schedstat and vmstat, are still quite helpful.
>>>> Also tracepoints are more expensive than counters once enabled, I think
>>>> that's too much for just counting numbers.
>>>
>>> I'm not generally a fan of eBPF, but supposedly it is really good for
>>> stuff like this. 
>>>
>>
>> Yeah but not nearly as good as, for example, __schedstat_inc(var) which
>> probably only takes a few CPU cycles if var is in the right place. eBPF
>> is gonna take a whole bunch of sequences to even get to updating an eBPF
>> map which itself is much more expensive than __schedstat_inc(var).
>>
>> For one, __migrate_swap_task() happens when dst node is fully busy (most
>> likely src node is full as well), so the overhead of ebpf could be quite
>> noticeable.
> 
> But that overhead is only paid if you actually care about the numbers;
> most people don't.
> 
> We already stick static branches in many of the accounting paths --
> because we know they hurt.
> 
> But look at this:
> 
>         __schedstat_inc(p->stats.numa_task_swapped);
>         count_vm_numa_event(NUMA_TASK_SWAP);
>         count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> 
> that is _3_ different counters, 3 cachelines touched. For what?
> 
> Would not a single:
> 
> 	trace_numa_task_swap_tp(p);
> 
> be much saner? It translates into a single no-op; no lines touched. Only
> when someone wants the numbers do we attach to the tracepoint and start
> collecting things.
> 
> Is the collecting more expensive; maybe. But the rest of us will be
> better of, no?

Probably not as bad as you may think. Systems with one NUMA node or NUMA
balancing disabled (which will be most of the machines) won't be affected
by this at all , task_numa_migrate() is also ratelimited so it doesn't get
touched nearly as often as most of other scheduler events.

If this is on a really hot and critical path that most of us have to take,
such as wakeup, I won't argue with you at all. I don't want to be too
persistent here, it's fine to use eBPF with the existing tracepoints. I
just think this is convenient and doesn't really hurt those who don't care
about these numbers. 


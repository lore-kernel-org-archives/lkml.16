Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86670BE65
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743036048; cv=fail; b=q7H2vkTmyMKiLkFEetq9QVhzfawUOzUQRth9y8ZV/gmLZ3CKR5DwJ3Dmwx8KS3j1wz3+nf5Bk8LDxsreLvQZzw0+MWaAuPP1YJZga3z5Mnt8kEHvIybqqxmDX+ljTOxUrweypacLz07NeGoDM0W8rW5gjWivGg/SmA9ZJ+Mvt9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743036048; c=relaxed/simple;
	bh=n60L9FaYwQzxGAnHnQB4165e0SRu40iE6YPteqmuXZg=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Avs1fQVtQjueqvLukkFKFP6ahU2ubn97h7+6R35Znqz5YyeEQ++KanidmGUGQe+8UCrNzLzvdIF9yTs2jYceJbFlmPjFLV0mu+NsReSYeF4c+pFvVjnzXmgziXEr36m/VR8soz+ZEcIRa1kOGxEj1CGZMwChIMh25y41KNezfrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CLFhCTSE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KkoQQ3wR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CLFhCTSE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KkoQQ3wR"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QK0Xsc024421;
	Thu, 27 Mar 2025 00:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=8MNc4XHjx3bVv2IS5aj7wf0DgA7DdaH3noDAdKVZURc=; b=
	CLFhCTSEj+xyyw2DtYzOmhmBiavFvt0zTKwiRhBsZwOzbD2Yerfh13zzBX8AXubz
	sXCNUyg5+24DAtqAusGMgl60h4ZreWYigPzEcY50r+sHWiFsHxVLPLgx9jbeOdfp
	ZxYqB0BPkRa9P7qw8bl2ioUS37ZSP/eNkTNslz9poSakYEV2dUlw8H7VLcuiSeX9
	gWYVIjTBGlBzoQ3EazDby2T0/IU0r/6WuqpFZx2QknkGtvzQyAWuIBPhbi001XHd
	s5wbdsf6UDRvswC+6IVAvrjRd/puoqOGF2wDoR+1QftktHae2iVcdxgz3BgPScGe
	BbB3CP9OdNuquJfdnd/s4w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hn7du1hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 00:40:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52QNxliN008236;
	Thu, 27 Mar 2025 00:40:09 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45jj6wc85v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 00:40:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdtXPNL/NDgJ0oFDBWJCjQAoKibS7gb5ueydlIuLl0UH/mH+DjMZW/v46xFOdENGtNYUPyVdrMUq9D744uuHHBSQtG61Ly2Qeux6t7EqJRmcI2rFdetUrpzbD3EQFUXXU9X0oPjkRggLyGxf4yEdxmgu5WyKNbLS3ldDut+7U/3+vg6/L7H8f+lQYHn7LtQY7RrTsasEQoJUe1BqcUOvS4FERPYyZTMFE8tWIOaMljLVrKhZbotlD9hvJX2XtT6uvlezAd13yQvvEVSWuXingKJRCOzk/DyCFeRCEQgHL6c8L8rm0iCT/O6pYnDyFcu6X+2RMCLx6rq9QYWSZUZfqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MNc4XHjx3bVv2IS5aj7wf0DgA7DdaH3noDAdKVZURc=;
 b=n2OqFh5KILMe3SyhTioDU3U72UyWmGmEDrg/dyt/3uudWbtCSSffK6rvHYXdDBbaNeVeXaOttQFBqLkFTcpDzZc/S15vJlTJGJAMmkNjW+8Pw3SULxMHGs8dX50AP78l39dK2Tbl/21VeD6y9oYQLdHjTPqTK6BeeCIQ4Pexd5kCgQFJqOfGX//d3m6jnZqTuf03gS6p9bqHZQDraZt9irqEyPY0ASqUrxgn/NwFHIowmAYFVFAi2QHPE8H82ZSc4aM9okY5x+frPToTR1cPmNqAklMMERzuo+aZnmTeeqrOHyOF4K39CpTopuUGgh6hwpCs9sIc9+4IWliA2xSdkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MNc4XHjx3bVv2IS5aj7wf0DgA7DdaH3noDAdKVZURc=;
 b=KkoQQ3wRZPUPpvkWnpUa5apTvuen+/MKDJzUTGO62f0PgfJ3DQfxFD08pqT17PAzvA9WmVKLZ8Hz0fgvrMz/KdquECyDekyKFDpOC3Yn36uMv/uuZ//CLExHXq+Ud5ixEK0gMT+5cvbmSZ2E6UeBmAwurVJjv/325Ac59A+HpTA=
Received: from MW4PR10MB5749.namprd10.prod.outlook.com (2603:10b6:303:184::12)
 by CH0PR10MB4969.namprd10.prod.outlook.com (2603:10b6:610:c8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.27; Thu, 27 Mar
 2025 00:40:06 +0000
Received: from MW4PR10MB5749.namprd10.prod.outlook.com
 ([fe80::9a04:a919:657a:7454]) by MW4PR10MB5749.namprd10.prod.outlook.com
 ([fe80::9a04:a919:657a:7454%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 00:40:06 +0000
Message-ID: <bcba4d76-2c3f-4d11-baf0-02905db953dd@oracle.com>
Date: Wed, 26 Mar 2025 17:40:02 -0700
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH v2 2/2] sched/numa: Add tracepoint that tracks the
 skipping of numa balancing due to cpuset memory pinning
From: Libo Chen <libo.chen@oracle.com>
To: peterz@infradead.org, mgorman@techsingularity.net, longman@redhat.com,
        Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com, tj@kernel.org
References: <20250327002352.203332-1-libo.chen@oracle.com>
 <20250327002352.203332-3-libo.chen@oracle.com>
Content-Language: en-US
In-Reply-To: <20250327002352.203332-3-libo.chen@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR19CA0063.namprd19.prod.outlook.com
 (2603:10b6:208:19b::40) To MW4PR10MB5749.namprd10.prod.outlook.com
 (2603:10b6:303:184::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB5749:EE_|CH0PR10MB4969:EE_
X-MS-Office365-Filtering-Correlation-Id: d85cccef-0dbb-4f81-1496-08dd6cc7eb64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWNDV0V6MTRpdmVCcERMaWthNFhuWElLVkRSMFFicWl4QlFkWmZrWFkzVlVZ?=
 =?utf-8?B?emp0OVI4cGJuWHg5L21pUDJBdGdaUHJ4WTYvc1kxbDhUdHY0cVplVkw1VGlJ?=
 =?utf-8?B?Y2FrZ2R0Z0NMZnp1MFJ2d0NrbE9vR082MDBuSFBtWVRPS2RUWHJ4TTd1Rk4x?=
 =?utf-8?B?RWF1dGRpOGVSNHZHaENaUmVBdXJ2S3g5eUl6Y2xJMkpDT2dLT2tBYThjekd0?=
 =?utf-8?B?SCtiR0N4RCtVNUUrYmVPMHFxZFBpMWlhSUJIaVJ6SUJzTFBLWFBkTDVqWUx3?=
 =?utf-8?B?dkdaUWxhRDcxTXRXMjZIOE9TYmNzT3RnSjlJSzRWbE91b1FqenM3Um9zS1RH?=
 =?utf-8?B?Mm5yVjdqTHMvbGIwT05aUkc2YnpRbW8zd0JyVmdLRnhBRHRNaWlrRjZUWDZw?=
 =?utf-8?B?T1UyOUJmZGpFSjhmVnRBNTF3TzFDRkQxN09STlBDMndJcmxrRWJNdThOK0ZE?=
 =?utf-8?B?eWhLVCs0TnRqQVp2UElRTFlOSXVVM3BERzZGMG8wNlpielVWQkV3dFhFaWNE?=
 =?utf-8?B?cmNtNmRJTitpbm1GckdKT1dFU2pKNy80S1o4d1VyTHBSdW9NOTVwbE9IT0F1?=
 =?utf-8?B?NTY0eWdzaGthTWp4MVFtaWIrN09CTGRKWlZkSjB3M2l2OXFBVjdpRFF5blVk?=
 =?utf-8?B?NXMzclE4YjNKekRIVGR3NDVrWUZuL3VSa2VwdWMyd2FZVXBpcG9MT3UycFRo?=
 =?utf-8?B?Q3dRQVgraFdISmFCUmIrd2h3bG14U085bWs5bEdaYXFaektyaU9wYlNmL2h6?=
 =?utf-8?B?c3ZRYUlIU3R4Wm9QMkpCa2VqamRZelRpbjVTWGJwMVJQUEN1TmlIcjlQWGZK?=
 =?utf-8?B?RXhnUVJIMzh2TVVRdUFYWVg0ZldpWEczaDJ0bWhsM1EwTEZ2NEYveHl5QkI3?=
 =?utf-8?B?RTR6V0N6bG5vRmxrQzFOWjR0UUVmRURPemxXaVI0SEpIY1RvT01Wd0xnbko1?=
 =?utf-8?B?SkRNeHRwZzU2aDN5b1cvVHlOTkZzc0ZtdXVNZ1NIWDNQWTNVSVJjTHpsV09F?=
 =?utf-8?B?OEt5aEdvU0haVmhtQm80Ky8zNHFxTk4rSSs5bC9LTFl3MUxvejlMYWtwQ09s?=
 =?utf-8?B?MWFrV1ZKejQxWnV1alJ1S2dhcWdGcEh5dFNPQzA4QnprTDc1cU5nRFNhemFN?=
 =?utf-8?B?Smovb1JtMWQzaHpOL2dhQUltV085dFVIekhWT2dSUVVKVkFrWWlmb2doZlNW?=
 =?utf-8?B?NDI4aTNSYUdGVTYrK1RqL01jNXE1VGlKWlJ0T3RNQzZ6eXRqM2h2ZmwvUUt5?=
 =?utf-8?B?UzdVUEtrU1ZhQzFPcEhaUFhlcTdnbFZkQk1PMlJ2QS9zRTBubjcvc21OT1Bw?=
 =?utf-8?B?L3UrRVFTZ2FtVWpla2V4QVMvRllrT0g2ZFNVWXhHQlczT05TcUUyZWNDdHov?=
 =?utf-8?B?ZmF2dTEzV1J6dkpsQms4NXZ0QzIvVWxjOEpuM0FLUW8wLzRVR1E2R3YxWG9m?=
 =?utf-8?B?aVhRdkhLTkFHRWtwV3VkbEZrSWRjUjh1eVM0dmxEOFNYRE5jREFuNnRMNTVS?=
 =?utf-8?B?dkdsRDlKL1o5L09UendNUXhGeFZzQmRYVXIxem9nOXdkS29qNTMvOEV4UmhK?=
 =?utf-8?B?SmQ2OHBaSG94VEtzRmx3aUU2M2Z5VWd2QUQ4TGUwbEhGTCtxTGZQeWs1azh5?=
 =?utf-8?B?WXZVbDVqZUVYL3A1THRVTWFCMVpMa1lHR3FNb3gxWXowSG8vM25zNVhEZW9z?=
 =?utf-8?B?U0lpckVnM1YrOTR0dExmRnZZZCtpTkZub3VaZXFZUnZGbzZKdWJzS2lXSmRn?=
 =?utf-8?B?WldMeUxvRnZESmJuUFJ3Yi9FZkdyM0tlb1ZlZG5oNVlqN3p5MGtGSTFwQ0h5?=
 =?utf-8?B?bHkrNlhlM3AvNTI0Rk1kYU9vb3JlODVicDh6OEMrOGpSTmM2RDFnMU1VTFJi?=
 =?utf-8?Q?/bLr/geUDgmNJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB5749.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3N3YlRxQ0ZiOGxZb3RIRDh0Y3E0cjFwVSs1MUU4L3ErZVo1SE96dmlGaGFY?=
 =?utf-8?B?ZnFRTndubGxQQVRtdUsxRlJFZ3B2V3czc3JJd3EyVlhlWG1OSGxvdlV3QUgw?=
 =?utf-8?B?TmNWR2dDN0x4NmFUK1ZCU01tOThQZmk1YlBPMzJLWVY5K0xUOGxvRm9yMGo3?=
 =?utf-8?B?QlBINlVER2xVZlRhVU9aTDcyYWtZYzhCQmR4bUp2UEpFSFlHNXkxQTVhTkg4?=
 =?utf-8?B?L01xU0FlVDl3bmlaN2FYYTRDTzZuVlZkbmZweVlaaHJJd3VRSHJIcVhyRlkr?=
 =?utf-8?B?SUZPMXhiazdJYXpFT01DWGc5M01XZ1hoN2JiaGRrSE5OZFFxc1dhTzk3M3lj?=
 =?utf-8?B?MWc5eXVOMmdsMi9vd0l5U3M3K0RYSUVkNER0L0IxQkdBbHd4akdKV0N6ZzFS?=
 =?utf-8?B?Znd2dTYwV0VaZ2xNek16M1ZQd1pISTJKV242OThZR3A4cGd1R0ttNWU5bE85?=
 =?utf-8?B?aGZ0dUh1dGoyOVFVQVd2NnJCWWJ4VWdSTC8vYmRpa0NTM3pBQTNlUVVEN0k5?=
 =?utf-8?B?eUE0TDZBUXV0dXBGOXFMTUlvRmd3ek5lSUdZbG5mb3F5M2k1OE9vd2ZIb1pO?=
 =?utf-8?B?Vi9FTWJ3Nm5NV3d0Zk40NTd2dmNUVGExK0hFb2lOQlJiU09QQjNOUHZNcG00?=
 =?utf-8?B?OXZDMVZVSm1nQlI3UXN5VTVsUkVHS3Z0Znc0a3drd1M1Y2pHZFg1UnZ4UmM3?=
 =?utf-8?B?Yk44WkFHYmdBVVlXbnhuUUdQN24ydTRUbGJiQkp6T21ONjdhQkVuV1FGNmNN?=
 =?utf-8?B?NWNDamVEdndBaHdoYy9FbXJDODF4L0tKWlRqYjd0amVSdHdDRmU0Zm0xVWFB?=
 =?utf-8?B?dDJDOEZzVTVIUHBMR3drOG9UdVpNTDVZZWU0KyttQm5DeWF0RXA1S2prVEV3?=
 =?utf-8?B?UHI4NzQvRGQ4MVowRld1NWRHcEYrRGxTRHFVYlI2dkQzOVBGSzBJWEFkQnBU?=
 =?utf-8?B?QmZtQjhCY1pyQklhalc2SnFVbVRMYkluVFlCeDZRcEtJN1U1KytvVVdvdFkv?=
 =?utf-8?B?MEVReXVSZGh3NzVXekdwMjZDeWZZT2dsejZ0Z0lCTWZWTW9DMWx3QVkwVkpU?=
 =?utf-8?B?ZnUyUCt5eVkzUDRnN2lYTjZ6WitQQm5RVy9CN2E1UGdIelNod3FQOVB1bjRV?=
 =?utf-8?B?RkY1MkhpamFEVm9DVmZaem9LamE0MVVHWFlPb1hERWZNTHhHZkc1Nmsrdm1n?=
 =?utf-8?B?cW1INEtJb0VScVgxemd3ZUVEV21HUTc4QXN6RFJGM3k4RnZUMVIvMUZSZXow?=
 =?utf-8?B?WFlRb2FhdEdrYlVZMk5aZkZZV0puU25wak1GNUhRWFBMY1paZ3BONkJpMjFT?=
 =?utf-8?B?bU5QZ3RPQzRUakJxYnBWTWZPLy9xZ0UvWmVlQlJHMmE4WTFySGs4cXNGVDRz?=
 =?utf-8?B?UzZTOFFOQWdodExkV2NpMlJyNUhJZFRkSmU0Rlh6dkIzaFBUdWVERHRNaC9G?=
 =?utf-8?B?NnFRbnY4RGJDang2VmRjWk9ZOGozWEFVUTBRMzErRmpLbXNiU3MrWVpaTDBv?=
 =?utf-8?B?UlNmZktPcHdWVVJHUlNmVHArb3J3UnMyeDJxMlp3eEFEUlE4Z01HQnVPcU5t?=
 =?utf-8?B?VEpldUhGdjQxTFdaYTRCdmg0YUtkdVFRL0FSY0xKY0l6dy9iV2NzeWZjc2lH?=
 =?utf-8?B?T2IwTDRKN0pyblJ6a2dRK3ZLMlRPdkhoMzRqZWlKbkUwKzlSVGd5S1laNFgw?=
 =?utf-8?B?N3czb1pNUGFIYU50SW1DU3NGTG1FMVNOeU9PY090TUZqMlIyUGlucnZxUndJ?=
 =?utf-8?B?a2JnaERaQ0hUWHNJRk1SMmxoMlM4Szk2S2hUcTYxdnFRYjBiWWk0dzBOUEl4?=
 =?utf-8?B?bnRpa1c5RU1jclY3U1lGaHNVRE8rNS9UeFJGZFY2RUhRRm9yOXc0aElYbnB2?=
 =?utf-8?B?NkNBU3BSc05xUC9HL2lJTkhXcWdmWWFTZTZ3WklRSUpsTTUzV0RPWjg1amZx?=
 =?utf-8?B?QlZrOXNaQ2R5QUFBVFFGQmJPc1VyeC9jckdld2FudmJET3NEY2dpcnF6Tndu?=
 =?utf-8?B?L0NzZXhlWnNTaWpYTUNXYkt4dk0wK0l6eS9sR3JRczVWaXplcHNpaWJXUlpn?=
 =?utf-8?B?U25YR0JYNklmZ21xbWdoSVpZMERsYWgvaHZwRGhlTmJyYzUwdkEzdmtvT3pJ?=
 =?utf-8?Q?esXOegr6YmeZMvV0nFpWABDFc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XHD256wMPeIA5XRJ5cDwSgZVhBEK/Y8LapxkqSKUYdaJ40Jla6J8XHLg+NOk233w8RvxJmTJ9UmTPzcc3ecJ+Xnlls6nW3Z48nU/OHvOiSt/UXhKXEQ+ks+QPYSM8JtS7q4bPDMVkwwUAXPMjud9FB4wtii4X3bBBJ/8dsIMOaen4T5axu0L3dDxxDWBlFIThCooA7EhCR2SIrhcDz11Bfa2e1aqtR9GtJCmF8OgyR67gGJEznDC+SoxU9cMVSdulxIpMW7HmK4ZGlRo/LtejIFmrc2RUNKnXfD9ThDVewWLa5FG2hmmQW8be83Yj3PXIr6WWeMP9g80TPcD+WRBy4fKxYxl+6D6Rh+F4jJIA3/3ifxlPuzmpEzJ8iAOAs+Jv9RWFb4wMbFTEXXlfyolaAMxAmUGdXZYbzeRf9IGvdxa4vRzsKxhEh2e5zdsuVAXB0JTYvCsXIWZ7EEzcE9/YeG49S1tHVrn4jRTWGWR6LduQBBg6274U0ttPjvOrIJO9jRnD2RKGVHYEPhKU/Fx23iZLBqblVYvdxfbjgM+68aMS+MK+/685LZv2bLdEu0AxJ/wm6asoMphyRquLv+GX27v1LfEZgMynrGfxKCR8M4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d85cccef-0dbb-4f81-1496-08dd6cc7eb64
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB5749.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 00:40:06.1719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeyJY+dOxGAv6np2Dd+61c0gxCp9bwOa5VZmi7FAXBEoMdTr4imuQkyeZYISCLEzwvnPeFgGavzP7F3T7fc7XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4969
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503270002
X-Proofpoint-GUID: 4DI7Bzntq4-2Su6PVeNSk67jnEHygJrS
X-Proofpoint-ORIG-GUID: 4DI7Bzntq4-2Su6PVeNSk67jnEHygJrS

forgot to add Steven Rostedt.

On 3/26/25 17:23, Libo Chen wrote:
> Unlike sched_skip_vma_numa tracepoint which tracks skipped VMAs, this
> tracks the task subjected to cpuset.mems pinning and prints out its
> allowed memory node mask.
> ---
>  include/trace/events/sched.h | 31 +++++++++++++++++++++++++++++++
>  kernel/sched/fair.c          |  4 +++-
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/include/trace/events/sched.h b/include/trace/events/sched.h
> index bfd97cce40a1a..133d9a671734a 100644
> --- a/include/trace/events/sched.h
> +++ b/include/trace/events/sched.h
> @@ -745,6 +745,37 @@ TRACE_EVENT(sched_skip_vma_numa,
>  		  __entry->vm_end,
>  		  __print_symbolic(__entry->reason, NUMAB_SKIP_REASON))
>  );
> +
> +TRACE_EVENT(sched_skip_cpuset_numa,
> +
> +	TP_PROTO(struct task_struct *tsk, nodemask_t *mem_allowed_ptr),
> +
> +	TP_ARGS(tsk, mem_allowed_ptr),
> +
> +	TP_STRUCT__entry(
> +		__array( char,		comm,		TASK_COMM_LEN		)
> +		__field( pid_t,		pid					)
> +		__field( pid_t,		tgid					)
> +		__field( pid_t,		ngid					)
> +		__array( unsigned long, mem_allowed, BITS_TO_LONGS(MAX_NUMNODES))
> +	),
> +
> +	TP_fast_assign(
> +		memcpy(__entry->comm, tsk->comm, TASK_COMM_LEN);
> +		__entry->pid		 = task_pid_nr(tsk);
> +		__entry->tgid		 = task_tgid_nr(tsk);
> +		__entry->ngid		 = task_numa_group_id(tsk);
> +		memcpy(__entry->mem_allowed, mem_allowed_ptr->bits,
> +		       sizeof(__entry->mem_allowed));
> +	),
> +
> +	TP_printk("comm=%s pid=%d tgid=%d ngid=%d mem_node_allowed_mask=%lx",


I cannot find a way to print out nodemask_t nicely here with %*pbl.
So I fall back to just raw hex value. Will be grateful if someone
knows a better way to print nodemask nicely in a tracepoint  


> +		  __entry->comm,
> +		  __entry->pid,
> +		  __entry->tgid,
> +		  __entry->ngid,
> +		  __entry->mem_allowed[0])
> +);
>  #endif /* CONFIG_NUMA_BALANCING */
>  
>  /*
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 6f405e00c9c7e..a98842a96eda0 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3333,8 +3333,10 @@ static void task_numa_work(struct callback_head *work)
>  	 * Memory is pinned to only one NUMA node via cpuset.mems, naturally
>  	 * no page can be migrated.
>  	 */
> -	if (nodes_weight(cpuset_current_mems_allowed) == 1)
> +	if (nodes_weight(cpuset_current_mems_allowed) == 1) {
> +		trace_sched_skip_cpuset_numa(current, &cpuset_current_mems_allowed);
>  		return;
> +	}
>  
>  	if (!mm->numa_next_scan) {
>  		mm->numa_next_scan = now +


Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6022192F8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675571; cv=fail; b=cUYXK2i+8hxiLo7EbUP/tGsXJf66/CDrPgsGKHBMBVTjJWAMOjWmyt5DKaj6HCFx2hQrp+zlFNjJS4bk0fK9MmmJifp3AapsuiNUs6eFclHX0LEVJQfDD2du48R/aJqqqQpuuUECtWeo18p7n+fZsGmH1qkOgKjXkmhkslVW9CE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675571; c=relaxed/simple;
	bh=8xy4V9vOHMWv4HA6028aRK7z9ZOwZrLhKF42be80pWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P/tfw/HoIhZTAHu1acCavl3JsO3Jvu96ccwW3erKd6PLaIbpPVlPxrijgHobMj97+8AkJcOayEV8s+X/FnpjKTDyx3F7v3CY63DSTuSxmlnfoZWVSQV2tblV7mTYc0vT7Rq27rswleJgobHpWrrfMB9hyPTxMnnoarMfuVvo/3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H72DMvsR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xG84l2IY; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H72DMvsR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xG84l2IY"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8pcKF030747;
	Mon, 23 Jun 2025 10:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Yp0ppxZbwBNEq6KMlKNPuRSA3sWrFgpaPg+8IPPo53U=; b=
	H72DMvsRseLysHfuR5f0rN0W2Z4pUtaF8GXlwlahLfJ8QJAKapJZ140BolVHlg82
	GLAhVjcoeeh8aGFFcEocvWPYJqaqnRdR8bEEl7Ahkeob4FuUcZ7/2+/MiDakHNE5
	CkyLEVL1qyuqK66xxICeVHC+llJJpqUb25bXVhB5xsUGHs9Yays97nAKNxwYYzeu
	KM5O9DxtY1aJ2oQ6CJpxJj1y3elSTRf75w+fTCyU37a6U3TA9uL/p+ilSZxYNcnu
	z6TT0B0TFLiIwrdnABOC9c9vH7otpgBGEW8/xsUNnVNpAEq03Mlp5i/kaCFZ0hwh
	FZJMgzeX2djJau6NFzOBlw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y2e7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 10:45:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9oSGl002571;
	Mon, 23 Jun 2025 10:45:46 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpbp0gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 10:45:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uw9OQYSJ8VolvValEwC42NtaMTM2hbvH4Ybax1PHR4+M7GvkDhwc5UU69DvPXqJkPpD13y+98qjzv5fvv3k9Sd7n3gXhtDpvdIgWif/DbzNXFzQF4R0GCa8tOiqcxqqPr1hRYqe4Kdkt5RyJ6k+fTOEMj0DrsWQH01xLMTrRmsY2RArgN1jh+JKbX0rX2M9eLAUakqNfrTunKtdHx/CdXSy7ZVJfo342vEyDDNOZKMbi2dNjSaf4kldiQxse28kvw9oW6e4EXzp7+l4RDkpiXl1wgjEGjuzBYdfOrB7ZexaxidA06BFEOPG1DyN6nFZZG2oDJXByezAUfst2xI/qUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yp0ppxZbwBNEq6KMlKNPuRSA3sWrFgpaPg+8IPPo53U=;
 b=AsyZXDpf6WXV6mi8zdQcL/iwwuuHJpwsjok0oRrB4qdc+G8i4xgvv0WjuBHz2u+CYdHnyZmmThyOcVjojo3GpSBDgjpDFXIWaqP5sagJV5wWcrJUkalMCxtPjbxc8u35s5kpxJCq6x3J70spYs/hVUVO5uD8wAMkt+DH/K19qDiRo7D8m7tiQ5ZHs/gn3k49I5JriOUImsSce+IP4pR80/5tBeHoayKPKTyLuG93lw3lRKfKYGDEBbqYjg02J0L11qE3+3f6K9oaOf1e4knt5cO2WwBZvkyZXPtfD6JZZU4KrWJqpaj19WLzXdktszDMQqjH9p21MBjzRV78+64RXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yp0ppxZbwBNEq6KMlKNPuRSA3sWrFgpaPg+8IPPo53U=;
 b=xG84l2IY3NMQtFOdl+DtVgzkvhIBWlLo3wNoUfKGol7Gc2joHR21CTriyFY8ZNOOPphRGDcHjX4q8slkAz8uQSv2tO3ADT+UkUqfY0H59IMbkxLSrovwPblxQwiRR/vVTaR2ov2DlNCg6NJQ8nOJgR27nF7arv12vZUBv/ikZEs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4693.namprd10.prod.outlook.com (2603:10b6:510:3c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 10:45:43 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 10:45:43 +0000
Date: Mon, 23 Jun 2025 11:45:39 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
        ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] mm: shmem: disallow hugepages if the system-wide
 shmem THP sysfs settings are disabled
Message-ID: <ee332eec-5a1e-422d-b3ea-bd142915b4f6@lucifer.local>
References: <cover.1750666536.git.baolin.wang@linux.alibaba.com>
 <52bc87c7dbd362d4d2b7780e66c1536fe99454a0.1750666536.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52bc87c7dbd362d4d2b7780e66c1536fe99454a0.1750666536.git.baolin.wang@linux.alibaba.com>
X-ClientProxiedBy: LO4P123CA0135.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4693:EE_
X-MS-Office365-Filtering-Correlation-Id: ea2faef0-8ea7-497b-e1d1-08ddb2431a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDY1M1dheisrSzhBV2hCNXRRVEZybUZaVU1aanNhN2RpNmI2aTR4UWhvUjJk?=
 =?utf-8?B?elJaNmZYbmxOSm9NUUh6TU43RllDMDhpbFB3djhsNWduYmlxaXlMNjlITUw5?=
 =?utf-8?B?S0crdkQwSjJRZXdkQWt1MThFWEUzK1dvMTg2VGZTaW9GTDZmQ0pNbDIzM0tD?=
 =?utf-8?B?K2VHUWZCeXpVTUtNL25jOWVrbWJHWWNKN3owZVZnNVZvR2EwNVV0enlQMXBm?=
 =?utf-8?B?Wm9ua1Q1YVhyanJwOGRobkRJWGdoNThkbjVUTmE2bkE4YUhTVTUvVlRDUlVo?=
 =?utf-8?B?bHJMVVZkY3ZoVmtGZXJTR1RVZVVaL3BEOXRzZnBEbkVYOGgzZTR1ZW1EblF6?=
 =?utf-8?B?ZkhISTg2SGdBcnY0a2dON1VYQ3NEVFNuamRNSWxKaDM4MDl4SXJNbXdRWmJP?=
 =?utf-8?B?U2lMYmFFY1o0SDJVZlhIQmxML0tNUHltYVJVTkIzakRhZjJjbStqMUNERWVx?=
 =?utf-8?B?cEtKT3J0c2FFN2VEcUdSNFd1R3RrZEZXUEdtSzNuNUNQdHgvRnVEYUtubWZW?=
 =?utf-8?B?TTZyTU1mdUcxaVNzQkRhb3I2TkRuaWdva05IMTVuUnRra3BnUm9kczMvWmxn?=
 =?utf-8?B?ejZVbmtySHZoSk5FcERWNHBlVis5NjVFaCs1ZXVsdHhZVWlMVjZES2FnOW9F?=
 =?utf-8?B?RVBwamYwLzdOZG5jWm5uanZ3enNjemxqcDI2dit6dE9YZEFGZkZYa3JkTFg3?=
 =?utf-8?B?SEhzN3k4MFc5dUs0RE9MaVVWZG55bTcybk5hR2JjMy9BUTRYNzdZbnZ5bEts?=
 =?utf-8?B?bitUR0ZnVGZJQUswaUh6cU1WamJlZlZ0TUhFbDhxV0xLNTAvM1A0RWdFdGor?=
 =?utf-8?B?SWMzZkdyb0U1RWpBYThNeTF6YlAxMjRqalhkb0ZJa213M3lnQlpoV1pjNkNK?=
 =?utf-8?B?VTdncmdndGhYdlJqZUtmTDR3SFRxUEIxZWw3dUFiWXlPM09jWktxSGxhczBT?=
 =?utf-8?B?anlpU2tYOTZPeEMyemhBWkthWEhKdHcvUk1IZU8vMVdzOEk4NXFOTnVZSjM5?=
 =?utf-8?B?ZUg1OVBMais4SHBjVkhFMnlmL0pZZFhPQUpzOWlSeGcxNDFEZWQvcnhucWZC?=
 =?utf-8?B?eFlBbHBVM1BiZmtRdjRoaFBpYzlqaWwwMUlMWGIzcHlkMmpGcWxhcUN4ZGpk?=
 =?utf-8?B?aUlRKzd1VHErRFNDZGRrR0FmeXZ0Vm42L1BJZG92SlBqNDlGUHE3aUV3Zk9m?=
 =?utf-8?B?V043YnZ2cU9kUW1RM0luRTdCRnRmOUFIeXd4YWc3T2FIT09VOVh1TXpzaTBr?=
 =?utf-8?B?cnF3bnNZVmVxdGszektCSkxaN1VLM0svcEV4cEgzMFVWSDlyR3gyS1J4LzIw?=
 =?utf-8?B?elIzT0xaTzFJRW1YZ1A5SDdtbWw4RUhucEJQUkdaQjFsU0JkSTEvRUpjVFRj?=
 =?utf-8?B?VVhTZzI2ZGFqb1R4b1NRL3gxdU9RbVBUQTVSN0tKcHhDL3RURXJveW12dHJN?=
 =?utf-8?B?Nm9zbTlIYkpsSGhTOUVsblF0MXVLUERJNi9iY21jNHdhV3U0NkwrM3RhRlV3?=
 =?utf-8?B?UTZoRElyN1c3U3QyK0JnbExZM0ZVOVlDQ09zTGJaUi9DVlZ2bCtEeE1CSjQx?=
 =?utf-8?B?S05kZktHQTJMK0R3Qks1YVV2d3dUTFF3K2dqcHcvSGxBRUpycGdzelI2aGRF?=
 =?utf-8?B?aGdBQy8wNEdXYjB5ZEp5c2JUbm5tUzNvQjU5MG5YbnRiVEp6MmIrbGtuazFz?=
 =?utf-8?B?ckt5S2pkMlhVRG95a2FPTjUwSlV3cWN5N3BTUzhtTGNqTGZVeTE0dVBJZHdT?=
 =?utf-8?B?UDZVM1ZlZDl1UjhOTkduR0trMHp4YlMvODZSNElaR2NHLzU4UXFkemx0ZW9E?=
 =?utf-8?B?VlZGOFJLV2E0eW9QNGY4NVdKS0ZBWHQrRHJLRG1hTDU0SGpCZzhRM1Z2NWd3?=
 =?utf-8?B?dTB5SndtODRWbmZvTERwZXkrTUc3VitjYS9hWW1Hd1lCKzA0MjE1WFJCMnQ5?=
 =?utf-8?Q?HoyCARLxlu8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjBpenFZNGYyU29JMXArVjJOQTdFSGxqWER3aWQrSVlYL2RaU0FwdzZHLzBw?=
 =?utf-8?B?bEYyUnIwTjl0TElxK2lLMkdQZ1ZKZnNweTdlQnNCcHE0UnE2eFlyZjczdm0y?=
 =?utf-8?B?Z3h0c3p4RVFScVpkcENPVkIrS1hRbXJKVFNyOWZwSTNYSEJobmdTWTdWdDRi?=
 =?utf-8?B?NWRWSUJOalVQQ0RTdm82R1RUdFNlazhiZ1o4UXhyL2cydGtZRVQrRHZObjQx?=
 =?utf-8?B?SWh6dHZqamMzamw5a2FYOVpZWUxGdnp5WEIvRFdyRlU1ajVINFljaVd1a2VD?=
 =?utf-8?B?aWM2WDJSQ3JhOEVXOERKTTI0TEcxQ253bnVxNVAzN0sxUksyUTcvTEVEY1pT?=
 =?utf-8?B?WnltMmQxNE1LMXcraWRvZ3RGWmFTNEthMEhrTVpDUlF6RkVlZDY2MHpQL1gr?=
 =?utf-8?B?cHd1T3kraHhrMkFqVUtadEEvVHZBUEZEci9HWklZWHZDb3BJNCt0OWpWN1pZ?=
 =?utf-8?B?amtnYmxMdTRsTE1PR2RnSkJOTDk5bndNaGpLbGhZV2Z6YnhYL1MvTDlDZE9S?=
 =?utf-8?B?M2tEcEFrQ3NzcU9UekNoU3N1RERkVGFLSk9iVk96MFlZU0xFWE1CL1NYc0VM?=
 =?utf-8?B?ZllmMEZOcEs1V2ozbzhTUVNHcmNQSko4ampkMFV4WnVlUFlJZENyN2NBRDVD?=
 =?utf-8?B?WFBUVXB4Rnc3WXB6dm5IL2o0SGVZOGhCc1RobVJ5QmpvZEtBallXTDl2SFUr?=
 =?utf-8?B?UGV6TDlac0x3aFo1ZzRsNVZFQ29GUnpBTy92b3RuUkNKYkxxVWtQTXhrMjEr?=
 =?utf-8?B?VFhONmY3NG9QOEk1MW0wZTUxL2tiUVZWeEMvbDR0QXZJeVlYelNIQUpUUGZk?=
 =?utf-8?B?M0d2NWcyZjAwQWROQTVrTzdWVmFmeFRoWjRFWnNtdzBGRXFuM1dzeWRZVkpy?=
 =?utf-8?B?TWpqZU5qdWlrbGt0UFI1Z1BMc2p4clY3TW80NlRCdXNZN3FDUGIzVU9vcU9P?=
 =?utf-8?B?VUhZYnY1dktkZ1NLVzVNVkNPU2RDa1FEZE5GdDN4bENEWDA1b2JuRUUvdjB0?=
 =?utf-8?B?WWhlNzV1eGFJSi9nNEZra09MVmNVNFoxaEFnTUR3WVlRd1Q0SmhlM3FQZGtG?=
 =?utf-8?B?WXJxSTVtWTdqeXZscnJiTDduR0RmbzRhc01CakJ0aEhDZ0RBckpwK0ZTbzJW?=
 =?utf-8?B?V3l2NU03ZWVWeSs0RXU3Qy9BZ3AxOExINE05TU9PWFBxS2hGYjJsd3pERDRn?=
 =?utf-8?B?d2RUUXpFcGR1SXVPSXNPU2JQd3NCSThYYlF5bjRYa1VRTS9lVjNpNFpMZ20y?=
 =?utf-8?B?ZUxIM3l6dmdSRVNkYUVJWVJZZTJReTNHc3JNTDlJTUlMNFYzWjBCdEdiYkEx?=
 =?utf-8?B?VHlKYVpvQ1BFVzU5eEJNbjZ2dzg3anh2TDhKNzJFMFNHcGtBSmduanRXNm5r?=
 =?utf-8?B?REJhM1NkK3FGZEdyWXhselJtbm9JbUNuZTNIRXEwcm9tQVBlcTdpTXlNMHlm?=
 =?utf-8?B?bytmcTByVVV2Q1U0bzRTUUd6QWQrcDgvNnFkQndjNVFXaUZKRWYvTHROYnha?=
 =?utf-8?B?bTQ3andMOVllNHh6ZVF3USsxNVQ3TjZaNDVzY0hDdXJ6a3c5eWNiSFc5enR1?=
 =?utf-8?B?MDQ3b0ZyWmIwZ2JlSFptRzJrUklVaENBM3hrSHRnN2Ezckp3bXkxeTVKdG9W?=
 =?utf-8?B?S2FXL005N29kQmFnVGNTaFVBbS9KZ0dZR3ZPaFRMN2EzbE5mb1o2Nld2ODNY?=
 =?utf-8?B?VmJkbWxacVN2K1dZZ2JtM3loYkZXZ2MrNU1lNVhFVGJ2U29VUW9ldkRZMWJP?=
 =?utf-8?B?eFdtbTQ2VHVNd3VLWlhRV2c4VGt4SDF0QVRYRVBKS1A3T3FkYkZuNFFtUCtH?=
 =?utf-8?B?ZmtKT2p6YktBaWxEcyt4SW1yZUFVUXlHWm9Sb2VmcTlsN0xrR1BIYkpEQm55?=
 =?utf-8?B?ZHc4N1VxenRVNXlVOFVPWG9WNjliN1BINStFMnZuNUxGZ3JkY2tQV0pNUUtQ?=
 =?utf-8?B?UVdTTG9DYklWYzM5cXVOaVZaWHBValZDWlRvZ3lUbmJTbFpHN2lGcVc2UkpS?=
 =?utf-8?B?aDJ5UmtNNWRXMUhaVWprSnplRUlaQWFQSndyM2ozWkhiblRDZEFzQnhXZmpH?=
 =?utf-8?B?NnVUQ2lZTDlETG5YZFZGSGZvV3VBYktQN1NNQU4zUmZhcGRlMWxUTHhzODBS?=
 =?utf-8?B?WXl6dEdPM3A4Rk9JUnVHQmJUeFdYcDlsKzhOc1JLa1V5c01qWUJtV0wwSlk4?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kmuhTn2uKsAu2JNwrrvoEpTnh5rCmbq6lL3vGPvRESt5TNnYNUFwSB1M2lTGjTSO+JMeV+uRj6Vmo0QaGZXv6QrFVWJh5yNWMeNEW3GmE0ulIK3wLRJjc/QdIUBKl4titm+/vGHmo5TGFQHHUfARj8a3i2OnluT9SSvq9hbaV+Lgv9XSNYC/7w3b5ErwXsJ40HuxV/AlMrw4UmSdrv4j8oalZ+GSs62x2nPmtoaF0/QUlQXcFiWpU4EnOEBoMb5F9yqxDlQQHFjVX6Q4NsO3yVMU816KKyGcQ6svMF58aA55Hu2U5kx3gv3erMXq7eVzGvKfBGvM+Lb+CY7zzBIa9ICmLsiHKkm9+JQjyTgjBrFXHldWMhWX2sy6xtGn86A01wt0dCjdZ/NY7R2gfh7cK9gCyJa6JHRijovN213LwFJJLymko4pBnZqfbbE3VMYcjDc2mU5rTgfduRu/Zr3GmhRee1Fu8wd7YQ3RXlWGo1EdJRwnhT+XfJF4Nw51+Vo4ParGtnzWKeA52E2krq8j1CrsQUAsbD/FI3EsPrV8CvW4ms2CGtMNjh1prjHtSV0smCkWBXglP5gDnSlHoZ+BmjHP1g4OOAC8eq2nDOpY/48=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2faef0-8ea7-497b-e1d1-08ddb2431a4a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 10:45:43.1804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IoLfF90tOVb22Va5ANevIjB2U/6u7Mj+XNg3fK78FhMcG0S7QFrbgEn7is2g3zsvq5fWlw7Fkms6DbJPD40BwoStKvFh4M/g45GU5uJtiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4693
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506230064
X-Proofpoint-ORIG-GUID: 5bT4SSuesbIoz62Ly8yoDa_DMIZY6uN4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NCBTYWx0ZWRfX78nJ2Kv2uHb5 EZvR+sbNbemLGRN10JovS0Yui3Iyd1dn0gGI+7lKOw4XZxRLzP0VihmHKXqZ4rPT3ABLU38hcSK aN378OPK4WQ2mk4x8Iz1X7lbeW6iZuzLsQq7Fr18lpjqou6jje8z0ZVbzO7wnl3o+gQFpvVcs+O
 McQdMJfJndShmqgQL/oBPxYyWk6Pxld9FKaZKHkCMXi9IaVSX4981lNJWPNACRz7XVFUHoPoPgz Ercp8j+VRX36Pmkl8DFg4++/HOrSIWJEBHMVws6yhlH3XnvSa564QJCEiHWI23cFmsFF7/RASq9 DZJUWVAHvjadQirAfo5dEOoqKIQyjtLZi8hIJTpJvpbLXFWZg0u2lf/oWmozx3V1+DEv9B9xnra
 4FvFV0Ws7wB6yZIZEJkTr41gwrJE/pm38UExios8AeeOFDzZnFCpjCXkf1vDEOJuAqlh7iaw
X-Proofpoint-GUID: 5bT4SSuesbIoz62Ly8yoDa_DMIZY6uN4
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=6859305b b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=Ikd4Dj_1AAAA:8 a=SRrdq9N9AAAA:8 a=yPCof4ZbAAAA:8 a=WJxuc7IjJ3eoLCQNQEsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On Mon, Jun 23, 2025 at 04:28:09PM +0800, Baolin Wang wrote:
> When invoking thp_vma_allowable_orders(), if the TVA_ENFORCE_SYSFS flag is not
> specified, we will ignore the THP sysfs settings. And the MADV_COLLAPSE is an
> example of such a case.
>
> The MADV_COLLAPSE will ignore the system-wide shmem THP sysfs settings, which
> means that even though we have disabled the shmem THP configuration, MADV_COLLAPSE
> will still attempt to collapse into a shmem THP. This violates the rule we have
> agreed upon: never means never.
>
> Another rule for madvise, referring to David's suggestion: “allowing for collapsing
> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>
> To fix the MADV_COLLAPSE issue for shmem, then the current strategy should be:
>
> For shmem, if none of always, madvise, within_size, and inherit have enabled
> PMD-sized THP, then MADV_COLLAPSE will be prohibited from collapsing PMD-sized THP.
>
> For tmpfs, if the mount option is set with the 'huge=never' parameter, then
> MADV_COLLAPSE will be prohibited from collapsing PMD-sized THP.
>
> Meanwhile, we should fix the khugepaged selftest for shmem MADV_COLLAPSE by enabling
> shmem THP.
>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

LGTM, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/shmem.c                              | 6 +++---
>  tools/testing/selftests/mm/khugepaged.c | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 2b19965d27df..e3f51fab2b7d 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -637,7 +637,7 @@ static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index
>  		return 0;
>  	if (shmem_huge == SHMEM_HUGE_DENY)
>  		return 0;
> -	if (shmem_huge_force || shmem_huge == SHMEM_HUGE_FORCE)
> +	if (shmem_huge == SHMEM_HUGE_FORCE)
>  		return maybe_pmd_order;
>
>  	/*
> @@ -672,7 +672,7 @@ static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index
>
>  		fallthrough;
>  	case SHMEM_HUGE_ADVISE:
> -		if (vm_flags & VM_HUGEPAGE)
> +		if (shmem_huge_force || (vm_flags & VM_HUGEPAGE))
>  			return maybe_pmd_order;
>  		fallthrough;
>  	default:
> @@ -1806,7 +1806,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>  	/* Allow mTHP that will be fully within i_size. */
>  	mask |= shmem_get_orders_within_size(inode, within_size_orders, index, 0);
>
> -	if (vm_flags & VM_HUGEPAGE)
> +	if (shmem_huge_force || (vm_flags & VM_HUGEPAGE))
>  		mask |= READ_ONCE(huge_shmem_orders_madvise);
>
>  	if (global_orders > 0)
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 85bfff53dba6..9517ed99c382 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -502,7 +502,7 @@ static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
>  	printf("%s...", msg);
>
>  	settings.thp_enabled = THP_ALWAYS;
> -	settings.shmem_enabled = SHMEM_NEVER;
> +	settings.shmem_enabled = SHMEM_ALWAYS;
>  	thp_push_settings(&settings);
>
>  	/* Clear VM_NOHUGEPAGE */
> --
> 2.43.5
>

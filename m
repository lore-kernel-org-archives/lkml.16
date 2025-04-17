Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36515251785
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906342; cv=fail; b=MBATQi/lKOQKuRfHy2aMneWK+SILu9prK9rDg+ONZsIvq5KKCd3XC8gRtR+hDUWY2aMBpYjbXzy2Nlv7As7MHqqp1z2Njc5IBIL9JgOEnY4N0nU7uNVeafRlR1Myh13WNtiQX2AvhJf0U9QixfNH76nF7eK1i4abadChVkkv1pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906342; c=relaxed/simple;
	bh=rrSZBXTO88HWk3HU6XG0L0YYFEkq7PdSdoRTSM5CXm0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ou2tPmMiQEU2ovHVhaMyAJSmeziUGKAvYCJu+Sj5FUBQi7j5ZpXz1E+SlCAYfrkJcyebqvrrD5oztoHmkNKRWn5esKSwb6P0XD7xGGONq7eMy7qeLbQKRBB8pv/QlAP/SLVeyn2reG9p6ng+CgufHXqn6IqHGNLULZEm9P1Tdwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IZL23Tlz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Jkpjm7uH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IZL23Tlz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Jkpjm7uH"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HBpdRZ002452;
	Thu, 17 Apr 2025 16:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=KCRvGaXxcr0MGvMrkySpQslbsHg1fobeY94wb7ovCwQ=; b=
	IZL23TlzKD3QpENIFZcRUDK217OKh+vzJ8W8ub/sNxdvPFMqbYPs3ydCYE0NdmeN
	1u4KVLejLnBup4gY6+EKupjDXPJcpw7Bz0mulEX6kMpcSs1KFwJcLa8A9aL4zXQX
	UBqSeE4RKLTg00cvU4sxgXwni/YGbd4ABVNXQZ8IffkVaWA1DYdMUpsmPc16nCtB
	5ldLexuoHySS1zH4h3oXM3S9zfxWK6GZhFocfvgSkMXxqOGrf6bgDr77ewHpoqAo
	N4C1IMfu6NpgX5Zfhkt0cMdxJTmzV+IwvHaMdqql/nutKiXU58QPJDdPTpuJbz6Y
	3lD8KfAqe1/naak4Rtd0yA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46185mxpkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 16:11:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53HEklXK005706;
	Thu, 17 Apr 2025 16:11:50 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010003.outbound.protection.outlook.com [40.93.1.3])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d5ypt7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 16:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKD2uhGla5dpF+ZGiazXiBabbUMTatqcDfNH2OzHS/qhvoPDbbS98UlMRJMuzYDMQBg5KsFLzKUj7Z5pzjo/XyemvHoBCD28nDp2Sm+DvjKfK2CuZaa27j+ETE1eaINs1VlaxaDt8Evw5GtGP7Y+DUr0t7n+6OyZzOlADzaB46k6jfzk5stcZtHNdjGeyaTiaofh8+XBZLTHVZFQMcfd5oB4PTB4B7ewapUKz0F9zDBXCLRrHicd3/gtIiR3pzatjqzLTF3nezU3uVzE4QB3+ulQtfW6XQ85T4EjwKJFVeO1N9/QsWZL5oxFl+WE8Q3w5527yXV028GBV7RBxUyqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCRvGaXxcr0MGvMrkySpQslbsHg1fobeY94wb7ovCwQ=;
 b=yzxSXz5k+A9dlsug+Y3HKxbC1pmp3sMjpcR9wtBGjhuRrxcawNhFPsMHGfr++KDcW7H1ytUH4PJik8yFMyAw+UDxNGIaMqHhM4KfEQtMgd9ogyDVRoTQsZpYYTtVlsJh1RaR5om7AV7/k7M14ilTazUD7F/mZwqxLrAUp9NSjzO0PHKAunEyqefCpAFmfjr9H9Fz5eoTDhUq7O2f0TNfWaH061CSi6sGBdO9oLU3mb3oF3G6/f4M+7JhEVEam3l7AbULf93ndiio6ij1nK1MqV8XU/n0sAaOICg0aPDQ7yTFMX6d6c1FRPBEm1dWGqOXqijwby2qxHWaW7myYwPd8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCRvGaXxcr0MGvMrkySpQslbsHg1fobeY94wb7ovCwQ=;
 b=Jkpjm7uHBkLW4FrrQNXcJZ8V+o7uuborhQjV7OnbKVRXE02J3/Nzp9N1n0PBurdXxBmkGEyhajGxK5taAtuJWMX/bUB7FVGC33ucvpv31Je76lfRmnvyg2YkSLhcH/0TJG0VhnJvZQR/a9L6BaJO/YqL5l9vMHmgrxvW+3eF16M=
Received: from CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8)
 by MN6PR10MB7518.namprd10.prod.outlook.com (2603:10b6:208:47c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Thu, 17 Apr
 2025 16:11:44 +0000
Received: from CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2]) by CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2%5]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 16:11:44 +0000
Message-ID: <bae69690-8213-4b64-bf0e-af0770e18063@oracle.com>
Date: Thu, 17 Apr 2025 12:11:39 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm/hugetlb: Refactor unmap_ref_private() to take
 folio instead of page
To: nifan.cxl@gmail.com, muchun.song@linux.dev, willy@infradead.org
Cc: mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
        akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Fan Ni <fan.ni@samsung.com>
References: <20250417155530.124073-1-nifan.cxl@gmail.com>
Content-Language: en-US
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
In-Reply-To: <20250417155530.124073-1-nifan.cxl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0101.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::16) To CH0PR10MB5113.namprd10.prod.outlook.com
 (2603:10b6:610:c9::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5113:EE_|MN6PR10MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 4226f83d-f2bb-47b6-fcea-08dd7dca8bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzFCZG9STk1QSUlEN1M3NXlCYXhYQ0srSnUybDBFSlk1L1Z4UHBtaHA2Wkpk?=
 =?utf-8?B?STNBdlVwSFNwSmRaeXR5QVZkbUViVTlPOFlzL0F4c05jLzRvU1FhVERhTE8x?=
 =?utf-8?B?cDFSUEVySTl2N2FnNnllUEd3Qm9CQUFtVDhlanVzLzgxQkxvTWxVbzBBSStv?=
 =?utf-8?B?dVZsdUdHc1d2eklTWW5NbGFOSzFzUkJnZ0R2dXh4U0ZLVitZcnRZS1BmZVlk?=
 =?utf-8?B?NjBWVkRvS3NKUTJId01mTEtrVnBFbVQxR0JTSlhGS21UOVoxbVFUYWp1eWUy?=
 =?utf-8?B?Rm1NejVkVDVscmZtTzl0NDlFM1dWTlkyOGdrY2RodVIwckpmQzNaeFZSd0R2?=
 =?utf-8?B?U2VVRi9ocGJpMmJEUmQ1Q1ZNU2d2NmFacGJRR2ZKNFFUajVKdVFQaVRuNVdy?=
 =?utf-8?B?MnNibTUydkFHZDljS0hFSnVBL29oWlZQMDhCdEtuWlFYY2FVWE1TbnlsRUJY?=
 =?utf-8?B?bTFvTkRvamtEWit5T05xL2JtZDUzNCtxbWdsVUZTM3FHeGdlMEQ0YXFsbWgw?=
 =?utf-8?B?ZVd6RjFhUWF6cTZKZUcwODZ6NXNRa1N2eHhpTVgwWWNmdnhhVjltdnlxYStJ?=
 =?utf-8?B?ZmwxZ2o3YzJuNEJpRGZkY3dueWg1bW4rbzZnaE5ONkIrUFhxalVHSmx1bkNv?=
 =?utf-8?B?VGluT3k4L2ZZQ3BZY0NrWlg4bVgvQ3NBcFQzY0t1QWU3d05ucXZiVi9GRDZk?=
 =?utf-8?B?STlDazJIeGNvRllsMWoyaGwrUUkrSjd6OHlOZkRnL0lKa1R3RjRjR25JbURP?=
 =?utf-8?B?LzRMWXF1Vjdxb253bVI3NUtRQWdsTWhtb1ZwRkg2YXc5c3E0Z1hZNkJBQUpK?=
 =?utf-8?B?NVFldlRKTmo5ZUJFZEdrNXFxT20zWjBJa2I0SVVhSWpxampLUDgrOFdpMGRz?=
 =?utf-8?B?cUZNTTdBUHR0ZEMwd0kxZFB0VHJRWW9Wb3g3UERaY3VRSFdDQkxFUm16cnVm?=
 =?utf-8?B?bExtNStZOHhkbSs1WXdVU05KZ1BTcTJCU2dITkJ4dlF3bmd5dE82N3lzZmRv?=
 =?utf-8?B?Yit3SmttN3hRVjN2anE0SUFsVzlpR0ZmRzZhaDZHTDBxL21EL2hXQU8zVS9Z?=
 =?utf-8?B?UXhUQW8xOXhqbGtnTWpvbTc5MW5zU2lBUmw1dUg0eTlvWC9qSVhiNzh3TDhu?=
 =?utf-8?B?ZEdEUWNMT1VwU0hrS2l5OGxRUHpUMVRGL2tGaUQ1VGg3NXdnYS83RSt5M1kx?=
 =?utf-8?B?K1lhWmtUNCttdklrYXRSRzROZ2lJMkZZcTF2Rk9nSGVZY2dmWWUxQmdYTFNP?=
 =?utf-8?B?c3U3eDJ2SXJsVzVoTi9adk80Y3hHaUM2VjRYcW1qbDFaaW5IbStBODFxUzNw?=
 =?utf-8?B?dUZLcWNoK2kxRzVTdkNNTzlFSlFydjJUcFBJU0hndUVQTlJGc1JqbGxzV2R5?=
 =?utf-8?B?eGRtWHhsUVBKaVJPWnlzUzZac3dVendKZmhneTNtS2xWcStiSTBCQ1JRT2lp?=
 =?utf-8?B?V3lGRU90RWE0VmFDb2c2QlJpZXlFNFRwOGN5ZGxMOFkwelQwcGpoR2JFNTA4?=
 =?utf-8?B?Y2FycDYvMHNMY25VTitFNlRBNlhwclhuT0dhcDF1TC8rZG80bjdTSHl3TFFO?=
 =?utf-8?B?WXNTdVQzYjFJendpcHZrYjZ6QnBlcWMyM2hWWVMzSkJta3V1RWp0SWNhKzNu?=
 =?utf-8?B?bzlMdERiRlNlVFhZTEFqV2N4Um92aGhndUVFVzQvSy9RWnlOR24vQXRmNisz?=
 =?utf-8?B?dVZLYkhFZHk1UGZQbFhSTjQ5bklTWEEwSGVGbjlHNks4M3luWGVxYlU4VGJM?=
 =?utf-8?B?Wm9yNk1Jcm1JOWdEbmRTRnFlRk9nYTJ6NmE0WTg4bkx5NmZvRUFTUzljajBz?=
 =?utf-8?B?RVR2L1pTNHhXU0dPd0RGZnFyMEUrcXpmeEJkT2JEOXpwVEtEdnpoNHgxUVl1?=
 =?utf-8?B?dzJCcm1EYlN1dllDa2FzRE1xL00xa2pxR1pBbXFrTEE1QUNid2ZIYmRwSCtM?=
 =?utf-8?Q?PVrTYyypGtY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5113.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVUyaVlEaGllU1JQK0pySmdDaUtCWU8rWHJPTEt6R2hLOTRGVWNSU3IzYlVI?=
 =?utf-8?B?N2pzNFBFYXdGMWE5dzlvK25TZCtBeWhZcGpKNnRJdHFNQnR2WCtTRktQODl0?=
 =?utf-8?B?UlJ4dWxpb1JjZzhsN2t1S0IyOWhHUWE1T25jTzh3dGpudHdvYlBoQ1ZmdVd3?=
 =?utf-8?B?cENPcVZuLzVEVEpSL3o0UkFxWFZNbTZtdEpwVkk5K0lNUG1UQWdldWVqNGVx?=
 =?utf-8?B?SjdUNGtlbDQxRHUzR3VZanArYk1tVE5rS25kYjhvcGF4NUtWMDZYdVpJL2Rk?=
 =?utf-8?B?WXJQemhobGpXUG1yS0x0cWNKcGwwOG9aeFVsNk5EWGNpblZhZ3VWZ2t2QnhE?=
 =?utf-8?B?QWNlWW0wUEFkNWZNVjZLdmNGQmxHMWJWVDFibzhFZ0pHeUcwS21XTENyVnZ0?=
 =?utf-8?B?bzY2cTNmMUliM0FtNXVYNGRCeWJLRUVZWTlkZk1lTHJqQ3RFaW5hUlpJeW42?=
 =?utf-8?B?QTZYRW5IZmpnZ0o0SGNWRllDU3Z2Ritra3Z0Mi9TdnhrdHVMYjhLZGE2dU04?=
 =?utf-8?B?UW9NWUo5VDdybndjZ2RjSmR3NmYrelVSeWtXZGUrcjVMYWJvRnFQbUdjQkgv?=
 =?utf-8?B?R1hyb1cra0dzRXAvemRJRXpNSEZyUy8xUXk1NzA4b3VPTGwvbzN0MWdSZ2N0?=
 =?utf-8?B?V2s2UHV5ZzFSUTBuQWtvSlVRQTVRL2VpekNkRC9xZU9lK3d2T2N3SkRMcHF3?=
 =?utf-8?B?cUxNSW44c0dPb0lKQ0xFRjUrZVUzV25tSU1xd25YanhnVE5qK1FjbTMvZ21U?=
 =?utf-8?B?eHFQOGY2WXpxSXgrazhmSGZoTFhZZ2JnYkp5SlIyQ1cxSUFXend2T0UzWXhQ?=
 =?utf-8?B?NUFHOFFOeUxMQVBzMGNMa0tDR2MxNWhyM2ZsSEt3bkV2Z3FxWCsxSDZ5dXdJ?=
 =?utf-8?B?UmNhWTBGM051NWtSa2J3bG0xaEZWSllhbmtXbWtKWDJWTUYvR21aWVlSNUwy?=
 =?utf-8?B?dDVxaFMvVnp2alV4b3lPeUMzN2VreG5ybytnUUY1NVFucjJTSW9ralVJc2Ns?=
 =?utf-8?B?QjFzeDZnOE1QWmlvY3VXeTJxV2g0YVBydlYySDZPYXJ5cEt1b1FGUlcxSkNM?=
 =?utf-8?B?TTczYnd2MERYQkJVdmtLRlJYNUtPQnl3amp6OFNyUUdNb3pBLzgrTmJFRVox?=
 =?utf-8?B?bEpsQVdrU0FKYlZYbElDN1FnMFVNUXZUTHdoOGhNczh1eTZIMFJaMWtMR202?=
 =?utf-8?B?b25MSlZXWUVxelU5WTZzY1NxbFFWRnZ1Nm9UWG9VTWl6ZGlBRWxBaFZoK0xY?=
 =?utf-8?B?VjVnZ0VUNVh3L3pFTXdZTkJIbFJXVmJ0QVAzTFZ5cERZUndGclpRakdyekZ6?=
 =?utf-8?B?UGdvRWlKZW5NU3hmOEF1WDZLeG9EdlNOeVNSdXZMWUVHVDhmSEVOMFBIbEEy?=
 =?utf-8?B?UFBnUm5PeXIwelVmaHpsMVY3bGRROTZmeHFEUE5ldnVvNlBRWCt4SU4rQlgy?=
 =?utf-8?B?Q3pzVXU1Ung4SWprMTA1RFZpMGhjWFJPZVVBcmdSR21YWFVrN0FHelNBaEVp?=
 =?utf-8?B?SzZZNmxMNUh1TGh1SVZBbGNBdWx2aExRdG1oMkJBK1pzU1pyTm5uVHZtemx6?=
 =?utf-8?B?U09sTnlhOG5UTXk1UU5QNk8rMFRQMzZ0Q2dGYTNZYjlQcjFBZGhiUlpvaVpF?=
 =?utf-8?B?bE5rQ0Ixd1BNbnlPbEkvSHRhanRWei90K2xHeXdRdWYwb3J2QmdEZURhMFdN?=
 =?utf-8?B?Q29xYVhmbHhMcXJWaWFkNlZqVWxHL1BSOEJoazJPWjVibFhQanZFM2szTmhM?=
 =?utf-8?B?Vi8xbGsvdjhXYlFKdmdqbWovZHEzd05UL1o5aVJ3dTljbHdlNzZRR2pZNnY1?=
 =?utf-8?B?eHdnOEQ3aUZEZ2d5a25uZlVoYnQ1UG4vUlhFNFNoeVFtTHl4MzJPYWlvdUtv?=
 =?utf-8?B?Mnc2REgwcU0xWGI3ZkxJKzVjYmNPNTd3Z3VTa2wyQkJJeGs4SzRhYW9SNGxz?=
 =?utf-8?B?dmprQ3g5MUJBaUxBVnlzZXdFMU5lUW1xTTZ2SjZEdHgwOHJsSWxRQlR6Q1Yr?=
 =?utf-8?B?VUFQOFRYcUI2MUZCYkh4ZVhaSWYvMkVSQ2oydkRXMk5WU2M4MUVPeE16eEpr?=
 =?utf-8?B?Tms2eFJ6T0JNNERnUFBnOVF4SmhqdUdoMkd0R2lJeEQ4czRTWWxIeDBEaCtX?=
 =?utf-8?B?emdqYS9UL1V0b3phQUVUUXdRVklqWEF4LzJwMmkwbTVCR2lWcjdSRHZLTGNw?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4Ia6Qn1sq+5QDt8PuvzBQssjW3EKcuomixL43bLgdCIh9khAUv0gWjgj+sBnBPhKZNuvTTOTJQARfNKZPkAmpoA2QSohInFL1YVdwkneW4sDDrWLefsMh5dZAuyvYB+B4oRoR+0aXmIe/whhiGW6Xmz3CKP+yMsw1jbxXLS4suWkY4kKjuJFMZOfpqikeczDkZOzLjAYsH1JRHf++XTu3cE2EFWMZlI2DaXvwF9pXJFSHWDH9nEt/wm+oto16WksDOiMeJgeT++O3OHw6cZI9/l+ImnL93jXPsYcPGBC0DfP2DOanPjXCFA8ToFmoeqc6rxIq79s3HttLPXMvKXe9+9TTThGillDZ0/qOEadQcl3kj5r7oqXVQqbsGVy0jyp1RLneDWYowhMdHTTEf8t2Cd+lz9ZG02FIv8INsE03paRG8UxUXuoqbfUkC5ohKPybkvXjFlrQvdFUrr4VD0fg0IZ4UUWNy8LV/0yIMAcpNr62fLgZCCvGKQecXMdHLEcQJfgHFiuF2eJ0MQ5S7niBxLr7uB0EmrSbaM/t5SxCJbxv0YNo3evVJVBvaJ6fCFdS15PzlbwU/Pe0ZhvpCH3BGOdvRjfYP7esxd1gfzmKmw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4226f83d-f2bb-47b6-fcea-08dd7dca8bed
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5113.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 16:11:44.4120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsJQULz1b1GiU6QQQpnlvLLPT0KqSVf6ZTxEwaBZt6OXGBBrLVL2aQzYjIxCJ/PY0x0iM7kY6SAUz6DwDOXaspzQtfVixWFcHgiocQvDwJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7518
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_05,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504170119
X-Proofpoint-ORIG-GUID: kptaM9I-5Vg11HcAIyQb6h6HCLL-2GP1
X-Proofpoint-GUID: kptaM9I-5Vg11HcAIyQb6h6HCLL-2GP1

On 4/17/25 11:43 AM, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function unmap_ref_private() has only user, which passes in
> &folio->page. Let it take folio directly.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> ---
>   mm/hugetlb.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index ccc4f08f8481..b5d1ac8290a7 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6064,7 +6064,7 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
>    * same region.
>    */
>   static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
> -			      struct page *page, unsigned long address)
> +			      struct folio *folio, unsigned long address)
>   {
>   	struct hstate *h = hstate_vma(vma);
>   	struct vm_area_struct *iter_vma;
> @@ -6108,7 +6108,8 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
>   		 */
>   		if (!is_vma_resv_set(iter_vma, HPAGE_RESV_OWNER))
>   			unmap_hugepage_range(iter_vma, address,
> -					     address + huge_page_size(h), page, 0);
> +					     address + huge_page_size(h),
> +					     folio_page(folio, 0), 0);
>   	}
>   	i_mmap_unlock_write(mapping);
>   }
> @@ -6231,8 +6232,7 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
>   			hugetlb_vma_unlock_read(vma);
>   			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
>   
> -			unmap_ref_private(mm, vma, &old_folio->page,
> -					vmf->address);
> +			unmap_ref_private(mm, vma, old_folio, vmf->address);
>   
>   			mutex_lock(&hugetlb_fault_mutex_table[hash]);
>   			hugetlb_vma_lock_read(vma);
Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>

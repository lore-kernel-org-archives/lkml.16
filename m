Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB717296D3B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747314262; cv=fail; b=th9CzrbjK9CxmozI874AIL8EMQ3YvWPGoWimPNSkwDuRZoxUGmN7wYIp1BNJetxU4teXEhCeZlObg5Uwz1Pho5AmBWSn7q8IjmBfDTg+XNFPFiAePQDOvLttGHmGC7dxdd3Eky60T8HPDx7QEdIz22xcR9Ca91Rrxggd52qNECA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747314262; c=relaxed/simple;
	bh=P9RaWSqAMWgMC6s7lEA3Pkhuo/O4/yTcFbEA6LgPdyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jQwBX8X+VNAbrnkNTbPDL6Z/TnlQKcc6t0jvEpWEfVD38E5LBVZgL4u3n7OMIhszpHCV6HrDYHGOFbFtiH6tbYWm3GlSKkvhgwk09iQG3Csb/QMnPKq6mrVHUqmUtNdgPgkM7NlHShdR0Kjn+KkH1HTv8vfgfX7hGHn2HFT2KyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XaCAErxB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=waXXp5VX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XaCAErxB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="waXXp5VX"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F7CiKr015793;
	Thu, 15 May 2025 13:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=1T/zNo8KVtRv39UxYi6Df+gk8gS8eTo8wh+8rBAlQ6E=; b=
	XaCAErxBZSaw7AMJU0E2EnOZP1o970JWFqLLHSqIKmvJeaswUqGGWw6B0JH6reWP
	mRsuFCLStzZ01TDkVbJFp2X9sIWIrQ2POgEzoSV7kRTeYXIkXZEHgfLkEPvxxdJc
	j3hC+lAaeIrW/W1ee5MD4QqASIhfNX9GhVfBreEDfafvdHyRWHE9j/SHXUWmCoF9
	KxDIxTI5py5pSRY6yd+mbuV5Y7Bx4pIvE58EowiOmKxBm/OEpSGhSpogd5ffnkx1
	eX6+iBQ9JdcsN4AaejLNn+Cqo+g1xO669dEjmYIHLYNx7J+nDGNVOQxFOwE06Igq
	rEgtOmXqERLpg7U2eIVkeQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcrkxw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 13:03:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FBcJwM004467;
	Thu, 15 May 2025 13:03:31 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013075.outbound.protection.outlook.com [40.93.6.75])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mshkg6p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 13:03:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyd8GE9EKIo5bW5EZvZQ9ze6Yybl+JtjhUSEMRTo8Dhq4NSaQJcnXc1/ZfrCw+rcmODYTEJA6+hkGwUTnghaTY+MmawQtLEz+Q8pN9VF7aP7/sA3ImdtNsq2wtvLbqStWxzVL0vPPX6em3Qy4DgBxDU8K4Joo3tK/uVzT8lqMEmiq9V35FmXeCHL5pbCDIr1/BZkCR414+owIH9G/UNs9QKYuuykQExs8i4JML47Sx0DjaRh2Wvv1hpQxNi4p70bJUz00B+fNPv8H2XLJMC1t/r+b9CeIHwxQ8S2qY5qy02pFGLUexl2htdkzuLRBwZJU7SFLcZpNRRXriTALVjrDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1T/zNo8KVtRv39UxYi6Df+gk8gS8eTo8wh+8rBAlQ6E=;
 b=MMT4lx+3P36WzNBRIHIkihWq9zO2yHSLdpDb3vOxFasjOcIGF8DxLfQPQAJOgqeISJafd93cbnFQw5Ju4rWkS0ZDygg45Ol95aW7CRcwtAFcECaKcf+1bkDtvO9WPCa62QFIaJ/N+qmDcHtTLgsB4u08cT1q6JWsOjsUVX4fZD+Yc5EuTRni91tGhmtQpT1ukK0jcFjnRJ1ymrk+izqwgS+bRJU6EAuujsItdK2/dB8riLpcwsQAjNg7N8kYNmJasqfvajrZsV+VdpM6Ui/02EP5uwddsIQUMKm1LieOyQDU+LBJ5OWL/bFCAfipX6xeyBdSpu3dX0wUgvAAN0BlMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1T/zNo8KVtRv39UxYi6Df+gk8gS8eTo8wh+8rBAlQ6E=;
 b=waXXp5VX4yst/PUPAawWONfIgn2paFyX1WE557s5/OiaQMSUfhgFAV/+y8TJbG5qUa7j1o/5KVe+YASRpjeDiZuJPOvhNyhlV8/DKG5tqqxB4Rb7WUgdS4mWO0O9iYLBVkPZaMBjtNWdSP30NqT9YlklupZQIk+zCe0ZzvrLbyw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA4PR10MB8447.namprd10.prod.outlook.com (2603:10b6:208:562::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 13:03:26 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 13:03:26 +0000
Date: Thu, 15 May 2025 14:03:24 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
Cc: James Houghton <jthoughton@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        yang@os.amperecomputing.com, willy@infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
Message-ID: <59165861-b6b5-4b10-8b04-f33c51a2debe@lucifer.local>
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
 <CADrL8HVja-8J1vcW0RLbsJVaLQENwo_LJ2mTj10uHeV06STxMQ@mail.gmail.com>
 <2044a883-d80d-4673-971d-d46f47532680@kuka.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2044a883-d80d-4673-971d-d46f47532680@kuka.com>
X-ClientProxiedBy: LO2P265CA0304.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::28) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA4PR10MB8447:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c4088b-d956-430e-8c42-08dd93b0e1bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHJDaU9RVUp2K0JoOXJ4WlZKamtGNWRDNGx2RVNKWmlMWllIWUVPeWZITDFR?=
 =?utf-8?B?bmFBME53TUgzdnRIQmltVndKbWZuSlFXeWpZQkZyTkt0SFVJaDF6ejNkUHpV?=
 =?utf-8?B?TVFQNWRjRUxON21SVGZ2Wi9yOTNJV0NoNVUrSnVZNklSVnJQR1VpUENBYlhx?=
 =?utf-8?B?MVh2a1RzYkR6VmwzMTNzNVFaMnpsWDRsMFRiV1FOUzVjMFBXa2lnRi9rZXNW?=
 =?utf-8?B?VEYrdmJtZFN0WmUveFZhaVJucElTV3dIdXNjQTRTd0hRTVB4c0k0OXdGSDdm?=
 =?utf-8?B?bDJUM25hNlFPU0VsYkdlRnJVc2FVdklUTkIzSzFCbnJWckVEUkpqTDZQV2Z6?=
 =?utf-8?B?eUJyTkxZR1RNSU1JWVNpVjByN1BPZ3grSWZkMHhiT24xUlowK2tKSDZoR3VC?=
 =?utf-8?B?Q3RxazBvOUVkUS9JOHpxQWg0NW5mbHhPdEdaQ3VjMm5OdE50ZDdjMmNOR3V4?=
 =?utf-8?B?VHVxMXB6Sk5PZWpwc1dxU3d1aGxaNWthRU83cHJKaDRmaDVtd2N0Y201NWE0?=
 =?utf-8?B?MW5waWpqYnZCZWtmSml2Wjh5SXhkbDhiSEc3ZTNLb2FGTFdEbjBxTkhick9J?=
 =?utf-8?B?S1U5OWJSYlY4eUE3d1dFZzlRSDZ5aVlqMUYrS2VXMDR6MGJpRXh1N2VnSjJC?=
 =?utf-8?B?bkN4WklDQ1BBYVVseG1xMFl5MFlQSzNtclNwMVlWQXkycGJxNzF2cSt1cE5X?=
 =?utf-8?B?Q0lubzBZTmxjUmZVUlVqbDVpZFpxWkdXR280eFRwNmNTT0xmendSRDRXeDFW?=
 =?utf-8?B?R2xZeWhlNWNkdHFxS3pSSWpkeUhZVjdWL3JyZzZQYnpSbjJwZzRIcGtvQUk3?=
 =?utf-8?B?QzFnMUNMNkFqbWxTeW8xV2k3U2ZWRXNURzMrNDU0RHRqU08xWVdmSEg4Rm9y?=
 =?utf-8?B?UDdIeVE0b1JCUEo5aDkwcHA1a0hYV0dEMEN4ejk5NkoyRlYrR3pCdFVOaDhO?=
 =?utf-8?B?bEREMHNWVFdxMFJ3OFd1bHNGVmpCNnZRMkRSZXg3VUV0ak9mRVpyd1REUzlO?=
 =?utf-8?B?cmFqbWdzS21zOVdROS8wZGVhdTlhUlVZVjFKNGtNdFlWeUJLLzdtYkJOOGNL?=
 =?utf-8?B?dWJWR29NN3RCMTdkWHNhSXhvaUptSDFGbEcwRmlXcUdiV3NrZWo0T2Nuejlu?=
 =?utf-8?B?NEhvaGRzRmtIdys3R1lhemE2eG5HRTZoLys3YnpXdHZuWDhsVkYvSElJYVFh?=
 =?utf-8?B?QVFxdnZEQjRpcFducFNFZ2xHc0U5UmJOVGIrQVRIajg1UVo4b1dNdEVvZitB?=
 =?utf-8?B?amdPVWdQcjgxWWVVZDB3dHI2SkNrRGV4aDVHVzdyVk8rQWpQVVdYNnpTMDln?=
 =?utf-8?B?ampBNmpEQS93MDIrdDVTb2t5U09CcEpnUUV5VlR2cE1HcENkU2hzS2h2VjVF?=
 =?utf-8?B?Z1VYc3RWRW1Kc0FQdU91UGxTb0hhRCtEQnpEb1NyUTRzQk53TzhKWVREYWNG?=
 =?utf-8?B?Rzk0dmNlcVc1WE5BYStveHFpQnZTTDBYbVovR3NWZEIwM2RJZmQwRnNsQ3Zm?=
 =?utf-8?B?YzVBZG5ZSng2aHVLYTYvc21oWkxXSmJmYTloNXE1R3RwS3ZMSzZZYUFEaFIy?=
 =?utf-8?B?WUM5MGJzMFhXK2FEVzEwdkxQbG93bDFqN3lmU1E3V0JlNGVXbFhrVTJOT1dJ?=
 =?utf-8?B?czc4cTdiaFBaS1djTHN0Yzg2TnpWSHF0NmdFek9MQnVOVWVOMWhPMFB4WnVG?=
 =?utf-8?B?aXFlZiswRWZGOGkwYVJ0RzhPMXRzNlNqZTJwRDFhQWszOE5id2hIZG9sbCs0?=
 =?utf-8?B?RW52b21XMmFGYUUzUlQwSnF6bHV3cTlPVVB2MmJ6dTBqcWg0OEg5NDNsUk9m?=
 =?utf-8?B?U3hKNSt2aHB2a2tFNU1vVUlQTTRPeU5aQ3JybC9JU3pSM3o0RTZUaUVBcWs2?=
 =?utf-8?B?TGN2dndlbEkrQUhwVjNyZk40Qmh3RDZzd2svQUgzUXBTME9uTmVrVEhQbjlZ?=
 =?utf-8?Q?l3ze5s/xCsw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUsrdjZpNE1iempVMEx1K3lqWDFIUW9IMmJMMzJvb090T0ZUeURlb0g1bDJD?=
 =?utf-8?B?a0FjeTY4UnBxZmpUWmZiV2x5SlpWc3FGbjZydFdqT2lYQXYwZzFyN3dCS2lI?=
 =?utf-8?B?MUJyaG1ZMXM1Um13N2Z0M29aeTJabmF2ZDlzQVRVZzBkVDVORHRTYnhHcnB5?=
 =?utf-8?B?T3ZEcVpRYml1b1RqNEoreGEwQkw4SEQ5TDgwUWp5bnUrWm14UWhKeHJLdGdL?=
 =?utf-8?B?ZzlkU1hDTEhPc29GTlQzVG56dmpQQ2gwcFViN3hwcjd1bkhvNnFmV2hqREI0?=
 =?utf-8?B?WXBBZXV5cVkxZTdmVnN0RzkxUCs2aHBSZVc3eTJFQVBJZ2NyNmVselB4TVI3?=
 =?utf-8?B?QitTNHVEcktleFRxbWJvUThkYithOFdrK0JpN0xCZzRCUFVHVEx4SEVlMGZ0?=
 =?utf-8?B?QUs4REg3Y0Y2b3RDeHRSeW5oV2d1TGJzZDlhdzlLcVhvOHFLTkZQYS9QQ0sy?=
 =?utf-8?B?ZDFVNDVsUU1BZnRORER1VExNdmFnNlpmY0xtYVpFK01aK2Y1eXBTSmlkblFm?=
 =?utf-8?B?K2pXUXZKMlZ3SURMWWNDdlZDb2VKc0VsLzBXK3FPTDkyMnlIc25uUkkzTTJo?=
 =?utf-8?B?VDcvRVlFSm5UNTd3WlhwOWFsUkl6ZGp3ZWlORFhaRzJ2cEROZDRLWXZOKzJ1?=
 =?utf-8?B?VGlieUlCbmVScmRyN0prOXF1L2xMNTJHYk1SZjBNTTV3dFZHRHFBVVRRMDNX?=
 =?utf-8?B?Q2hraWovd0RwVVdISDA1NnpaWTZ4YXlxUXNJQ1BLdkVIYmNTMlAyWGhCNW05?=
 =?utf-8?B?bVZqS3NEUzVBcW5UaVRITUlENWo5NTBGU0VYVUQ5TW94QUFXTHJNMW5jWHZ0?=
 =?utf-8?B?RGZzTUtVL1l2OG1talRnWHZoTG5WazFTdzdvTXJIdVorQlZHL1BiNEZ3Z0JV?=
 =?utf-8?B?QmVuRWpoQ1VINjFjSHZvMGY5bERiSjYxa3VqZ1BzRFptMUV4OVpiM0M5STZF?=
 =?utf-8?B?ZjRON3hWTVdmdWlxVm14d3lJdGZ0OFpFMUx6Rm9lTnl1dEFVVERhM3FaQUZZ?=
 =?utf-8?B?aDdpSzhWaENPN1FVUHhTdDJGdjdDaS9WREUzejVjUktxZVpxK0Q4c3cxY1Nj?=
 =?utf-8?B?bE9KUUZUbUd0L2ZsWFpraGxSaENXSmxCcEtSKzg1TE1UTXFsQi9RbHg5N0M1?=
 =?utf-8?B?NEFWQURqYWpGNDBuQjFUSktqdm5iOHJQRGd6dTZJY3ZWSEpsQnlVSWgxbjFU?=
 =?utf-8?B?cU4wejlYNHdzWmU5M3BEWnQ2ZCtOTko3eHJkUUZlV1RqU3VkWmI2SUtOYzFj?=
 =?utf-8?B?ZGQ0TTA1MHFwSXdnSmRnYXdCUEpPMDJSbi9iTUE0YlZKSXJrbzhPYkZEUUFO?=
 =?utf-8?B?UjBXcnlyczNrYzg3OFErekFrMmIyWjIwZ2kyWWhMKzdQYU5QL3dxRWdVTklW?=
 =?utf-8?B?Mk02SVJXQnBibVhoN3kxeUhIVURDR1ZvRTh5K1lrMlZTRGRiYVJoZkRjcmRT?=
 =?utf-8?B?UlA5RjRmVGRtMExiWEtoRGVGTUtmc05mT1hQOU5YbjFSWjFHVHJqdUxBeXIv?=
 =?utf-8?B?VSsrZHgxVFdhcUJHWko0alJ0T29mb2ZmODlWdG1UQi9qUUgzVGdKcUdzNnUz?=
 =?utf-8?B?TW1iQm9rcWd5bG1hOUFmU2dzUTllNUtWcUcyWXpmNVdIbWQ1ODNyTWR2SS9N?=
 =?utf-8?B?MEpnTUxZRGNCVmRpbHZLQWdQZ3lXVElnOGJpQ0tQRGRsVW00OXNpeEpsTzN2?=
 =?utf-8?B?dnY0RGJLb2dTeU42M2FYMGhiVXdrRWNDZG4zK0Fic3g4dTJYSitNM3Y1VjhF?=
 =?utf-8?B?Z0hzRzhKdEQ1QUZSUVlTYnhjRnUxbjhJK2xpMXdjaFhDQmx2c1h1NzZXUUJY?=
 =?utf-8?B?dlFtbkRpMFhWeTZacU5CVlI3YTF2VHV4c2xYSkZuVjBBNWRtUlZya1dNVFFw?=
 =?utf-8?B?RW93UHFObFlsRm45OFZLTEtKNzhTYVpWaFFocTNwR0JORnVweFR1RU9Yb0Iz?=
 =?utf-8?B?U2U4SFhQaVlBMnY1a2NuMkl5MHF6MldIT1IyWlVueEZhMG1hMUU4b2xzZ3BR?=
 =?utf-8?B?ckV2K1ZydDJKeEZUSHdrKzRNZUVNbzdsNm8wcGxjelBVR2VmNy9aN1lob21W?=
 =?utf-8?B?d2xqRWlzWHBaK1RTNEw0WXZKYktDZ2dNaEIveFJITERkOCs5djgvNGowMzdW?=
 =?utf-8?B?TGVOZGJlOWpJd2c1dUdTYjFHbFAzYTVuWlBYWm9iVWJBQ3VtRnZ1Z0taVjVX?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9M4jnXpNZbWYBj26eG8nyvu73QRa5o2Oq/jk4901kndWDOar4Za6swVv/aaJ64kd4iQi0PMHUhMXH5T4OLdu3yuGOLNA8oygCkbRB8jKOwvPJovodw5OmUhZFONS6rAX60gPoAC32dQe20Wva1SxogzTCRtUVH05TaTs1E4QaQ52qjNvn1prltohM/uZIzLrrpE151PpVCnCqwDIAbOR5uQUe0fqDujG3IkyuHbg2jImyZWSY8P+gYAbSGE73c6KFE4ivuu07nmwMvvRzvPy1DP4CFcjE6cwPlP2PcO2mnRbQgvkYpYOHU/JaDErun0ObMH6/cyDXVTCh1CetqMbfqFZ/FS8scZFeCUYeULl45bIFNKtu5IUivjEQ+yjHgYDZImSjGoUHqCjSOZaQf5IL5Mdtokcd8sMzvA60fyimgLYGDm9QZaBibHHIlUIsj2/xsU5q20lPoRMCT2m4shr0C3q/plRerqazazK3MUUglJBellzRd3RYLviTIFZT7jMVeF6TS0TA99t2k7rnDYjqYwNyzQTm0BkkIzbMp4XsCjOptkH7B4hxoMtWBjc31iZq3hK/Y11zppQo0ju/3pxbiC93fiGaN0gVxsKmwWSQtE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c4088b-d956-430e-8c42-08dd93b0e1bd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 13:03:26.8455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sm8BRgzrPgPLPXE192EB+qCFB84v48lKjn0JgTLk7Il9xyn/S+zD6QIkF4hrYJWpnswzknajChnN3FlGL7WKDb3MJWlu+B6yKESFe3YA0Yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8447
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_05,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505150128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDEyOCBTYWx0ZWRfX0oGshRxAKaJx mMhT+HOIBtU3I2Hs6B6n2KceSUEmHLeftpdymfQyoJIpDYBUKEft3irj0r0IFU3sGfskNlsXBiZ JT955GFulo0IBiTHocJteQSKypP43vsFCs+bLqRETzH9oIn4iXbxW1gKF0hYx8zXsi2EEt4yvJv
 ZxPdsCyMLae0gzTbMi12zTS88pCqXLVsBN+HeLNr6SbMJCG1HwMdxdG2TF+SCTLjZfpGPQBgD+4 vW0p3TIO6lI0bTwFtMipzPFk2DO9onoUp6y+Z8LQz8Yd7K6AWCwDAK0Ubh3YjgafqL3taK+LWWz h4RPYR8M6jNdvd7HgByHFekTUX4OY1+FFEHjzo8N49yxEhC1gyL9euMO2usTBwZCdxIOm2qaVMH
 16Gnc89A25dVXjVDuiX8vOTEyha0UC8Tfmm1efGHpETdHfsr39MAAfVqVk+iBxXZsASgj351
X-Proofpoint-GUID: zGW0GndzVj5L9JLQS0WY97nk80QqKXBC
X-Proofpoint-ORIG-GUID: zGW0GndzVj5L9JLQS0WY97nk80QqKXBC
X-Authority-Analysis: v=2.4 cv=cuWbk04i c=1 sm=1 tr=0 ts=6825e623 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=TAZUD9gdAAAA:8 a=JfrnYn6hAAAA:8 a=sPSvSZ_GQvM-IMrgloUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=f1lSKsbWiCfrRWj5-Iac:22 a=1CNFftbPRP8L7MoqJWF3:22

Hi Igancio,

I can package this up in a series with the fix below and with the
appropriate tags (signed-off by you) to enforce the correct ordering
between the s390 patch and this one if that works for you?

Let me know if my sending this revised patch in series with these changes
and your signed-off works for you?

Cheers, Lorenzo

On Thu, May 15, 2025 at 09:03:19AM +0200, Ignacio Moreno Gonzalez wrote:
> On 5/14/2025 10:15 PM, James Houghton wrote:
> > On Thu, May 8, 2025 at 3:20 AM Ignacio Moreno Gonzalez via B4 Relay
> > <devnull+Ignacio.MorenoGonzalez.kuka.com@kernel.org> wrote:
> >>
> >> From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> >>
> >> VM_NOHUGEPAGE is a no-op if CONFIG_TRANSPARENT_HUGEPAGE is disabled. So
> >> it makes no sense to return an error when calling madvise() with
> >> MADV_NOHUGEPAGE in that case.
> >>
> >> Suggested-by: Matthew Wilcox <willy@infradead.org>
> >> Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> >> ---
> >> https://lore.kernel.org/linux-mm/20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com
> >>
> >> Here it is presented as a separate thread to avoid mixing stable and
> >> non-stable patches.
> >>
> >> This change makes calling madvise(addr, size, MADV_NOHUGEPAGE) on !THP
> >> kernels to return 0 instead of -EINVAL.
> >> ---
> >>  include/linux/huge_mm.h | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> >> index e893d546a49f464f7586db639fe216231f03651a..5fca742dc5ba784ffccea055b07247707d16cc67 100644
> >> --- a/include/linux/huge_mm.h
> >> +++ b/include/linux/huge_mm.h
> >> @@ -509,6 +509,8 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
> >>
> >>  #else /* CONFIG_TRANSPARENT_HUGEPAGE */
> >>
> >> +#include <uapi/asm/mman.h>
> >> +
> >>  static inline bool folio_test_pmd_mappable(struct folio *folio)
> >>  {
> >>         return false;
> >> @@ -598,6 +600,9 @@ static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
> >>  static inline int hugepage_madvise(struct vm_area_struct *vma,
> >>                                    unsigned long *vm_flags, int advice)
> >>  {
> >> +       /* On a !THP kernel, MADV_NOHUGEPAGE is a no-op, but MADV_NOHUGEPAGE is not supported */
> >
> > Do you mean "but MADV_HUGEPAGE is not supported"? Just want to make
> > sure; it seems like no one else has asked about this yet.
> >
>
> Yes, this is a typo. It should be MADV_HUGEPAGE. Thanks!
>
> >> +       if (advice == MADV_NOHUGEPAGE)
> >> +               return 0;
> >>         return -EINVAL;
> >>  }
> >
>

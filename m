Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2344317D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 11:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748865057; cv=fail; b=C6wUxP+bKce0bXATtlVAejA4kB1QLofQjhXsSVGbCQIK70a3fI57h/o+O98jK1GRHQh6iKgduVOc279BgfCqIHOya1LshhkD7vs1nnpzcoEXLHtwn6nkEcSnmcOwajGdRwJN2IpWjhMWnSsliUy0x2ikoFCy2rnTXuFNnDwdGhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748865057; c=relaxed/simple;
	bh=mPjcVyvKoU46H/yxf/KEuQVs/TNpusq+5qZ58F980kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XLthMTVDg9Zl+qVkY03Ywq5cjkG3WOc8xvavpkLmX2qA6rGeS33bOyBea8AQGZIiSr1jGXgz7auO8cOPm+wyBHadrbsJfWDy9h1sf1mjR9xXzQAUvx20XKOmQ+Vs14jx6QrLOBe1vyYZyiypa7NLxck8snAz1KTmvhQnGCl7hvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cIK3TETm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oSvk35GJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cIK3TETm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oSvk35GJ"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5525tugj020109;
	Mon, 2 Jun 2025 11:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=iC1RI/A8IhdUpn5Qq3FXSsU1FJltdzepWriMwpF03SU=; b=
	cIK3TETm/DnI3QRb0maLrvAHuTMjZJe3UYVJg1O1suFJgeppu7nA4MBsZUOho52j
	OcoSNaVWj396RHXuwGoOz44W2xy6e6jGligFtNmg0/4HrPI1DJWQ0msZFdoCr9QP
	w3IAawHpYBkzLLjU1ITs2IFkufVkacAC5h8y3AUjnXLWJPTgE4mG16S4az1qT3XW
	o3QIS+9T4Vw/NAjIV9C6+pD+Yz+gn0kXXyyvUIZePsTx1CNnkeilBoDi50ub8qbD
	NHqJT+zv2TXzZ/TniQwMd1WhqvtecDXJ5E83rX6Dp+xs+bBKRzr1S8DI6rZRYze+
	r8J26seDMq/jVUHRHHF/kA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46yr6faf2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 11:50:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5529lHxt034843;
	Mon, 2 Jun 2025 11:50:40 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010017.outbound.protection.outlook.com [52.101.56.17])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr78466y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 11:50:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRH37RbHtnlFGSzYfSE631mZ5Ng1lDRkwiGWj8FMymPumQWgSawUZ9PbzPlkTF1GMMXc6F5BFWJcBz5yI+WxVECmBUS02QEcA54Tw22Y/r7ng7evgUa9ji+nLEziPoXoIY3Agjw/BWTO2xYt2y/bYAiPICLvmPx2WKGPE8HUBe5JTLvMG8D+NWrYbPktN2wDHI2vGqKFZp7H1S7GLuW0GUJ6H+ClzN2moeorhWFqxN5/kltME0ySXp92DpiGoTUtV/uDGjwgb6xB2sf7WE94A7sySmz5tR5VVGj9o/vFW+90nlWXcLTCArWnrfyzMfmrfwPvDjgX2KRnvK3v577phQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iC1RI/A8IhdUpn5Qq3FXSsU1FJltdzepWriMwpF03SU=;
 b=PGGeTF1mxAKJO3IYskEeuidfRUwx6jxhYtRJiy9ccWHGQgvq2Gn1QVnMUN8cu1rD5PD+lVv6ZdoSSsGAKBfDToY/WU8dmo0G4wk4da6duaV7v/BSRs0gxwujfPAV7NrGxTh/o2F1A1/iU/7G+LcsfHmXuPjsKn3orUGAdH/oXu/3FGb+5kdQRsxYjSRqxfwt/mFKOoXzf4A8RIoG+XF+ifqrRWQ9ShAGm450fQaQ694AMFUSb2DOb2oJGqs3JAveSOldfI7vVP1o5sx3O7+F6SmeAR7o0zOt6cnrxqpgrwv27NLZzjQkIKSHqQ/HxkCheYeMID6WAIHhvH3dr5kUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iC1RI/A8IhdUpn5Qq3FXSsU1FJltdzepWriMwpF03SU=;
 b=oSvk35GJLE55aGFtNx/01WsoFtcgBhCQDoLIVP7DxEA90/wPYph24L6LESmrquAomW20CDI/vlB1JLdikglr0/0Fbbr4kiqdqpheubkB+OVZa008kfzEE93NtdS4wh5oHOg3DaRfWUCnLlMgaossxwaYzJ0yIo5vXb81UMeVdXU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB7390.namprd10.prod.outlook.com (2603:10b6:8:10e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Mon, 2 Jun
 2025 11:50:35 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 11:50:35 +0000
Date: Mon, 2 Jun 2025 12:50:28 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jann Horn <jannh@google.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <23edf435-7cfe-49d1-9432-aee64c0096ab@lucifer.local>
References: <20250530104439.64841-1-21cnbao@gmail.com>
 <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <002aa917-d952-491d-800c-88a0476ac02f@lucifer.local>
 <CAG48ez0kb+on=erofZL2ZwB9CqtrSCJVND7K7=ww1prMUGXDRg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez0kb+on=erofZL2ZwB9CqtrSCJVND7K7=ww1prMUGXDRg@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0133.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM4PR10MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: 971f49a0-a422-46d6-625e-08dda1cbaf8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFVDc1ovR3QvMEdkZFFBUFdvcjJNTFVQa1NPMHlZWmEydzIrbmZrcmJTN3Bq?=
 =?utf-8?B?cENLT3BOVGdSWk4zS3FKdGpiTzdHQ3lxd1ZIV1Q3NjhiNUh3RUdOdGtnZnlp?=
 =?utf-8?B?OGNzblU5WENMVWpxYmZHSEZVenVaeDJXV3Zob3dEeGxsWjVoS2k0TzBpZUxC?=
 =?utf-8?B?cnBIdGVJekF6YlVxcE5IeXRtSTRCaFNQS0wrTFNNR3JlNU5rRWJobkwzcFVr?=
 =?utf-8?B?cWQzUFVtRVJuckRiQldjbFBmbnVyN2ptSyt5ZU9jNnJFNHJ5SHprK3FtNzMx?=
 =?utf-8?B?V1J6b3pGVk1zVi9FdndBM3JNRUI0VVEyZHMvbXhhb2VKS2k1Zlkwd2hwNTJo?=
 =?utf-8?B?VXBhTERJNlBycWRTWTIza1pBQVNqanp1OElRWWdHRXcrMjd2NUhnWFVWUlFC?=
 =?utf-8?B?eWhGaE53NXVSaHJ3M0VPN3p6ZGFGRDl3S2RJa3FNQmJINHZMRnZ6Lzl3T1Mw?=
 =?utf-8?B?ejVuUmlGZzIzRTdpYW5BOXRSSks3T1U1dmM0dDBmeTdqT3g1VUpCMVJQZGZy?=
 =?utf-8?B?Y3ZPZ1dVZ3FxY0U5K2laMEU4VEFsSC8ySWY0bW5OdU5QY1dHczFseUxOYXJL?=
 =?utf-8?B?aTh4V1dTVHBqY1dOWlpVWGxuYUQxYVlXK2wyakNHQ0RFNWJrTllsMy84S21r?=
 =?utf-8?B?N0hmRGVVTVByYUN3aHdsc1V2STgwbGR6UERHZGIwVjM4WTZ0U3NDbmc0Rys1?=
 =?utf-8?B?SjM1bHJXUmVJZTNKVjNaT3ovc0xlR2NDVFNHenVWYkxjUk9RMDBvMnVQWEtB?=
 =?utf-8?B?NnBpaEN6ZG9DK082QnpnS2JHYXNoTVV3dmIyR0FxRG1kRjZyZFNuWVpMdUor?=
 =?utf-8?B?R1VqZlRjeFBHQ01ZQjFkQmkrK2dXTlhXaEE1ZUpvOU8xdmh5Qzd2U0ZtQnda?=
 =?utf-8?B?R3ZpZDNOVUFuSERpS3J0QXd3Y0RpQlYzWFNhT1hwNU1oWUNiVUhmSXRXS1BF?=
 =?utf-8?B?bmp2N1FrU1hVTis2a0xHVENUY0Ryc3BWOG9JSzh1VnJhNzcyTlpaNkFnRXdz?=
 =?utf-8?B?c1Z6YmRwcmpmSDZ3bkNJTlh0cEVMb0VyazJZZkp3bUVKc2laS1pjcXVZbzQ3?=
 =?utf-8?B?Z01zTEViUWFUNFMzcjcxNkZZNVFZZURpNnJUeC9ibGF5ZmgyVnpRQXNyVGNr?=
 =?utf-8?B?bXZVTCthdUR0ejQ2a1lhUCtsOEQxZlBqbmlTOVNOVHkyQk9TeFVoR0FCZmla?=
 =?utf-8?B?ejRiUkhQeHRQVUJPKy9XMnBzdkxuSk8zdytGR0Q5Z2ExQy94YXRsbis5WDlH?=
 =?utf-8?B?L2dFVS9aSm9XV0lySm5ZVkpnQXZmRUpXeWphbHZVK25rVTlZbHdnK2M4bFI2?=
 =?utf-8?B?NGNQWEJuNGJhTnRMTjVyTDBCNkIzYU9GTjZMdHBYd09UTUtuTjNnVUVqRzMz?=
 =?utf-8?B?MTNaaE1LOXBUZGxZQjZML0NVczBLeU5NQ00wL0lOS25uNFVrZExzRW05S0Ri?=
 =?utf-8?B?Z1FyWWZ2QkNFbko3R0p1UmloUlhNelQ4SGZjUlFkWHhPZ2xOczVtYmN6UlE4?=
 =?utf-8?B?VTVXTlozWGNTdkR1NjdpZWNFZnJtRFlLM3NpbEF6VWUxSHZiSkxZT3hsRjNK?=
 =?utf-8?B?OWxQeFRQcHFocWRQTFpRekRpNlAreDdwVlhJbHkyNEFvbHhaR0tFdEZTSUtG?=
 =?utf-8?B?Q3RzSWVEZGhSaEFYSS9Oc01zQXkycHA3WDlGZVdibmtCek5HQUYzWXZGUmVw?=
 =?utf-8?B?aDVGVDNXV0FJWE8yVVFXdmQ3QUg3d1VTMUxDQjdOdEd0aFVCRnlvUDRSTElX?=
 =?utf-8?B?Z0FpZ2IycHRNWDJIT1plNmRCNndrZjU2VFJlLzQrUzhIUGhCQmlzZTVEV0x2?=
 =?utf-8?B?SHlFZ2UvZk55SEUyUmtGdEhIOWIwclFyNDl0SmFoaXphWERiZXpmSzFwTVRr?=
 =?utf-8?Q?NXu9r294teBis?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0pmMkNWQXBkZmhSZU1YZm9ESUo2dkFVQXMwM2tUZFJVa0lRd25wdnAvRTZL?=
 =?utf-8?B?THcrMkhuMS9zTU5qVFJPVWpUMXlYN0tsOUs0a0p0WjA1MzRBSjJLVU1YSTJR?=
 =?utf-8?B?d2M4SUFuQ0FRdHdOZjNJcTFiTXc0Y2pXMzdwNTN1T0pGNTFKYVBMVXNjc0Jx?=
 =?utf-8?B?LzA3VUNKblRQUnJqM2pnWGxJZi9HNENMY3pvVU9xM2RidVc3WUhDN05uMDAx?=
 =?utf-8?B?S3JxQmluQWU2QUo4N3FjbjJXKzQ1Zi9LcjFtWEUrSDZiU0Q2RDV0TC85cUhz?=
 =?utf-8?B?MW9lZHVvcE5ZRml5akZjNGZXcjMwdWc2eVZEcS9nNWlNLy8wYjFqVHF3WkdL?=
 =?utf-8?B?ZFd0K2FCdHVoR3JBTXR3b3JZeTRTUWczNnBPMlA5dU0vUXBMQmU1cUFrMHli?=
 =?utf-8?B?UThDOVdiSlMzRkxsVUUzMTRNV1lwZ3ZHN2NBUDM4WDF6Mm1qbnlvN3FBSGRM?=
 =?utf-8?B?V3R2d2JaUzZCbVJmUG51UDlBaHVUeW5yL3pjZ2JTbFNjVlV2WmxLdytHRXkv?=
 =?utf-8?B?c0sxeVZDMTNCV1VLSkpTSGNSelQ1dW1HREF3Rkw5cEF2YnkyTWpLd2k3M2k5?=
 =?utf-8?B?SnNQODY5aE9YY1JJZkY0bHU5L2F5d1l5RUJsbFdIQUxwU09BbkhNbEdKNmZQ?=
 =?utf-8?B?ME9Ec1V2RjkyTTlkVlV2NGJEcjJqYVFDREliaXBWcWlMZjZzdkx4TTZmSHFt?=
 =?utf-8?B?bDlhbWpUSGFISXlZVDRwb1BUbTNSYWVqRG1mQWhocjVJd0l0SWVyczB2L3JN?=
 =?utf-8?B?eVNRN3JlODlIRFBGZGhBbUdaSUhGdWRWWkIvOE9nQUplRDlEQ2RkT1Fhek9i?=
 =?utf-8?B?UnpvTElSMXZZYWtzamNreUxPNjVjTnNEblR1SXZOOHlxQ0tCRUJnVnFoTHkr?=
 =?utf-8?B?dzJsd255bnV3UUF6Qi9xdVF3Sml5a3JyYmFVdW9ORS8vbnZvbTFvSUxkbEpL?=
 =?utf-8?B?dEFrek9aNzJyd1hORklRTHpwS3A5NXU4UENVTmpzMHBMZjhNUnEwcDNMQnh4?=
 =?utf-8?B?bVJWMUo5NVdIQXIwZ1pobUN3TmVkZmpib1dwUGl0ZFhPTm0xblAvK01CUDVj?=
 =?utf-8?B?Y1k0VUNodXhzWmVmVE1vZG9DVi9wVGNPRnR0UjlUb29OemZFMDg5cnBNKzM1?=
 =?utf-8?B?T0taSk96eVNPL29TWW1QdGVOdlpvU2tRR1c4UldaYm16ZlhlQVJuM3loL1Jo?=
 =?utf-8?B?SmFZV0JKRndhVU1oMGdWUU1mQktobzNjeUF3NFk1ZDZwcU1QOGtZRHhIUUts?=
 =?utf-8?B?dEcvejI4dVhmcEhtaVdsRHRCbVkrdFh2dE1hWTdEY2dLTWxWRDFNRGtDR0s2?=
 =?utf-8?B?ZFF6RVhBcFMrdUZpOXJkb0hJL3FpMmpsYWgxd3pPUlQ3aTBRK281QjZmVi8x?=
 =?utf-8?B?RHUrN2lzN1hpZTFJT2NKcDRzYTFxbDE5eUNQWFNLV0JHckhXOWNGa1c1ZEZJ?=
 =?utf-8?B?aWVocWVKRlp4a0VJNmVrc3BqcFc4WlZ3cGc3b0Q1OGVrMFlVR3VxVUV1aHdi?=
 =?utf-8?B?TWFSaVVhR3p1SEU4VjRkeWJoODhtbEpid3hWNlVVcTRXQmd3YllYN3JMZXF5?=
 =?utf-8?B?bmI0aHZQbXVJV2lrN29nSUxJdElNNkJudWxMTTFUcmdLMXowRWEyVHNXRjhY?=
 =?utf-8?B?L1dpbGJWb3FGeXE3c3BoMHhyOUdjMHhiMUhmZDh5TzRFK0hzWVYwd2pjSDNK?=
 =?utf-8?B?azVJbHZ0VHBjbUpDaG9EbCtsTXZpQzBOVlVUQlNNQjAyb2VYak1NNmdLcSta?=
 =?utf-8?B?dHd4eTBWTDQ5VVFtb3JkYUFTMEZEL29qbG11QnlaZ0NWR3VwZ293TnQxTnhp?=
 =?utf-8?B?bzdUeXJBbDQwNXFpWnBLZFJkVE1POUhPc1N1eWlhRjlETUZUZGQxeXJyaWxk?=
 =?utf-8?B?M0JuZ2lnRjU0S0VCMzRRbFdraVhNaXRWTTVsZGxTZzFoaWRFVkg4T2pkK0Mr?=
 =?utf-8?B?YTVGSitlTkxGM3hvTW8xcVBRejB6OTFvbHVPZnlENzByTks3d0VtM044ZUp5?=
 =?utf-8?B?dUJ2VHN0aEF4azdnWmd0MFczeHlVYTREWGRvSFFIcmtqNWlCaEttWmlyUks0?=
 =?utf-8?B?TXppKzNzSk02Yzk3eWJMeVpma3FnWTZyZktYV1JYSzNnM1BkUlNoL21rT2NS?=
 =?utf-8?B?Vll5NTg1TnA4dHlwanpaRjVUN2sycnRMVU55WXB6QWZqTWpFcjFBL0VKMGJi?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	69Ft6PXGWu60SYYk8ZmvE8TDPGURRwg8a8NhruS5jfypBCMtM/Kl2OBHR9Kl6fPafWo7WxveeXC4pjDxQy0oZwzEla8t81EASU5RkYPngEm1+GCr6sLhgYUE1zSPHoToOxdxa7bLjwYmj5C53D859xdVR0DjreXkbQSE++rNO861lqh7R5nGigAT+fQ4ANP0BLaMQFbDrPZAAKiex61azxXkfSUl74WbWkibG2VXkVixSDcOB3ltt66pGbJqfw5gJsAU5SQebK444VAxxRsx30phXxooRw6bg1uPIil/XY9Ot3/1338TGjWoavDlRmFJhpIjE8eDUTjCRxDB17djllbFC0mKnv2zxJj0CnqQg3HE92mCEMalB2hq1rLQO7YFs9uhGGVOiNoA/6w9m5PAiOp9DUBxXUKSyvckuuEqqQzkjq4LsQw5GzHy2gWW4DBj6/BWl7Nu14rhn7DW0b3M/QeXQOBm7I9LEZ0aZZv6OiRET9zg+jQsn/VlNf1xXZxITscKCs3csItd9M/SaEuyNShjNAiOruQlnXt+PUoRF8uESXQscnY0rImy1+afm+nlOyWOGoXqSBLpQHxPF9gkF3oGrR1FGRJ77wsp64Qi9xs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 971f49a0-a422-46d6-625e-08dda1cbaf8b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 11:50:35.3025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FPU55dUl1Z18fp1CRH7YopZEaSzzTqoQQd4tRVRow2ELYZ2vCsm/FIH787JBJ9diPsVpxw5CKV7AOzOnhKfuHwErLTWd2GX45ffu5iDVgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7390
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506020102
X-Authority-Analysis: v=2.4 cv=G/4cE8k5 c=1 sm=1 tr=0 ts=683d9011 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=968KyxNXAAAA:8 a=GcyzOjIWAAAA:8 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8 a=NcAUemW9pmS1s8ODS-0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2Rk7X0lYjKUA:10 a=hQL3dl6oAZ8NdCsdz28n:22
X-Proofpoint-ORIG-GUID: A7rPZZxjADik747atESBh6xgm2uTTetb
X-Proofpoint-GUID: A7rPZZxjADik747atESBh6xgm2uTTetb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDEwMiBTYWx0ZWRfX/ktVz/l4AaQz 1Wj0ZfYyirn3KbDJMN7pwRC0TB26cQtHPX+e7knYUOjoQSDU6vLXcYbE0cblGjBBWZ90GFwtFH3 tc/1LSwewNMZjfY8NLF+toNPMxNmOGMcw1SY2QeTgPF8LwnMz42EJnTLEtV7q6iqh2RoVy7ZLT6
 M9qykEAWCEllmkuT0gevceVpaeIC+XlDJgziEolqGrNmmwaECd7MStZCXOPUenoDCIxVnSr1OUW sfK7Ei2Pa1q61OYzs7S+en6D1injmdpO9UMO2cEhA9JPEPoDV5O4lVfAa65hnm5bTaHaptKJV4e MJNou4nwhiiWmAwtGMQv5eQrOz/+sNyZDJQD7yZsa1KkwMYbIAW9EK65EaZOY0DXpASX7ig7PYT
 4VCGxFFdWly/SA9mMnzr5aDxnKm7DgFbHpMVEit8LuioMHNb1STky66MfvPwnAxAk3DsJE2c

Barry - would you mind if I went off and wrote a quick patch to separate
walk_page_range_novma() into walk_page_range_kernel() and
walk_page_range_user_novma()?

I realise this is a pain, but I feel strongly that having them together is
a source of confusion and having us special case a -only used in ptdump-
case like this is not great.

It wouldn't include any VMA locking stuff from this patch, which you could
then rebase on that.

I think it'd make sense as a separate series and I can throw that out
fairly quickly...

But I don't want to step on any toes so just let me know!

On Fri, May 30, 2025 at 10:40:47PM +0200, Jann Horn wrote:
> On Fri, May 30, 2025 at 4:34 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> > Barry - I was going to come back to this later, but Jann's sort of bumped
> > this in my inbox.
> >
> > This implementation isn't quite what I was after, would you give me a
> > little bit before a respin so I can have a think about this and make
> > sensible suggestions?
> >
> > Thanks!
> >
> > On Fri, May 30, 2025 at 04:06:30PM +0200, Jann Horn wrote:
> > > On Fri, May 30, 2025 at 12:44 PM Barry Song <21cnbao@gmail.com> wrote:
> > > One important quirk of this is that it can, from what I can see, cause
> > > freeing of page tables (through pt_reclaim) without holding the mmap
> > > lock at all:
> > >
> > > do_madvise [behavior=MADV_DONTNEED]
> > >   madvise_lock
> > >     lock_vma_under_rcu
> > >   madvise_do_behavior
> > >     madvise_single_locked_vma
> > >       madvise_vma_behavior
> > >         madvise_dontneed_free
> > >           madvise_dontneed_single_vma
> > >             zap_page_range_single_batched [.reclaim_pt = true]
> > >               unmap_single_vma
> > >                 unmap_page_range
> > >                   zap_p4d_range
> > >                     zap_pud_range
> > >                       zap_pmd_range
> > >                         zap_pte_range
> > >                           try_get_and_clear_pmd
> > >                           free_pte
> > >
> > > This clashes with the assumption in walk_page_range_novma() that
> > > holding the mmap lock in write mode is sufficient to prevent
> > > concurrent page table freeing, so it can probably lead to page table
> > > UAF through the ptdump interface (see ptdump_walk_pgd()).
> >
> > Hmmmmmm is this because of the series that allows page table freeing on
> > zap... I think Zi's?
>
> Yeah, that was Qi Zheng's
> https://lore.kernel.org/all/92aba2b319a734913f18ba41e7d86a265f0b84e2.1733305182.git.zhengqi.arch@bytedance.com/

Yeah need to reference in docs...

I will do this.

> .
>
> > We need to update the documentation on this then... which currently states
> > the VMA need only be stable.
> >
> > I guess this is still the case except for the novma walker you mention.
> >
> > Relatedly, It's worth looking at Dev's series which introduces a concerning
> > new 'no lock at all' mode to the page table walker explicitly for novma. I
> > cc'd you :) See [0].
> >
> > [0]: https://lore.kernel.org/linux-mm/6a60c052-9935-489e-a38e-1b03a1a79155@lucifer.local/
>
> Yeah, I saw that you CC'ed me; at a first glance that seems relatively
> innocuous to me as long as it's only done for kernel mappings where
> all the rules are different.

Right, but it needs locking down, no pun intended... ;) my review on that
front is over there.

It's only ok if you know it's ok to do. I don't like this function being
general for the really really weird case of user mappings (used in
literally 1 place) and the more common case of walking kernel mappings.

>
> >
> > >
> > > I think before this patch can land, you'll have to introduce some new
> > > helper like:
> > >
> > > void mmap_write_lock_with_all_vmas(struct mm_struct *mm)

At any rate I think this should make explicit it essentially disables VMA
locking.

So mm_take_all_vma_write_locks() maybe with a big comment saying 'this
essentially disables VMA locking' or something?

> > > {
> > >   mmap_write_lock(mm);
> > >   for_each_vma(vmi, vma)
> > >     vma_start_write(vma);
> > > }
> > >
> > > and use that in walk_page_range_novma() for user virtual address space
> > > walks, and update the comment in there.
> >
> > What dude? No, what? Marking literally all VMAs write locked? :/
> >
> > I think this could have unexpected impact no? We're basically disabling VMA
> > locking when we're in novma, that seems... really silly?
>
> I mean, walk_page_range_novma() being used on user virtual address
> space is pretty much a debug-only thing, I don't think it matters if
> it has to spend time poking flags in a few thousand VMAs. I guess the
> alternative would be to say "ptdump just doesn't show entries between
> VMAs, which shouldn't exist in the first place", and change ptdump to
> do a normal walk that skips over userspace areas not covered by a VMA.
> Maybe that's cleaner.

Yeah but I'm guessing the point of ptdump is to pick up on brokenness where
this might not be the case OR maybe there's some weird arches or features
that do, in fact, permit this... at any rate I think we should probably
continue to allow it.

But yeah see the above about separating out. Less egregious that way when
it's _very clearly_ a specific debug mode.

>
> But FWIW, we already do worse than what I proposed here when
> installing MMU notifiers, with mm_take_all_locks().

Yeah...

>
> > > > +       else
> > > > +               __madvise_unlock(mm, madv_behavior->behavior);
> > > > +}
> > > > +
> > > >  static bool madvise_batch_tlb_flush(int behavior)
> > > >  {
> > > >         switch (behavior) {
> > > > @@ -1714,19 +1770,24 @@ static int madvise_do_behavior(struct mm_struct *mm,
> > > >                 unsigned long start, size_t len_in,
> > > >                 struct madvise_behavior *madv_behavior)
> > > >  {
> > > > +       struct vm_area_struct *vma = madv_behavior->vma;
> > > >         int behavior = madv_behavior->behavior;
> > > > +
> > > >         struct blk_plug plug;
> > > >         unsigned long end;
> > > >         int error;
> > > >
> > > >         if (is_memory_failure(behavior))
> > > >                 return madvise_inject_error(behavior, start, start + len_in);
> > > > -       start = untagged_addr_remote(mm, start);
> > > > +       start = untagged_addr(start);
> > >
> > > Why is this okay? I see that X86's untagged_addr_remote() asserts that
> > > the mmap lock is held, which is no longer the case here with your
> > > patch, but untagged_addr() seems wrong here, since we can be operating
> > > on another process. I think especially on X86 with 5-level paging and
> > > LAM, there can probably be cases where address bits are used for part
> > > of the virtual address in one task while they need to be masked off in
> > > another task?
> > >
> > > I wonder if you'll have to refactor X86 and Risc-V first to make this
> > > work... ideally by making sure that their address tagging state
> > > updates are atomic and untagged_area_remote() works locklessly.
> >
> > Yeah I don't know why we're doing this at all? This seems new unless I
> > missed it?
>
> Because untagged_addr_remote() has a mmap_assert_locked(mm) on x86 and
> reads data that is updated under the mmap lock, I think? So without
> this change you should get a lockdep splat on x86.

Gawd.

Yeah sorry I missed that bit.

Obviously Barry ought to address your concerns here.

>
> > > (Or you could try to use something like the
> > > mmap_write_lock_with_all_vmas() I proposed above for synchronizing
> > > against untagged_addr(), first write-lock the MM and then write-lock
> > > all VMAs in it...)
> >
> > This would completely eliminate the point of this patch no? The whole point
> > is not taking these locks... And I'm very much not in favour of
> > write-locking literally every single VMA. under any circumstances.
>
> I'm talking about doing this heavyweight locking in places like
> arch_prctl(ARCH_ENABLE_TAGGED_ADDR, ...) that can, if I understand

An aside: this doesn't seem to be documented at
https://man7.org/linux/man-pages/man2/arch_prctl.2.html ... grumble
grumble.

> correctly, essentially reconfigure the size of the virtual address
> space of a running process from 56-bit to 47-bit at the hardware level
> and cause address bits that were previously part of the virtual
> address to be ignored. READ_ONCE()/WRITE_ONCE() might do the job too,
> but then we'll have to keep in mind that two subsequent invocations of
> untagged_addr() can translate a userspace-specified virtual address
> into two different virtual addresses at the page table level.

I am not familiar enough with tagged pointers to intelligently comment on
this myself... but we need to find a means to address obviously.

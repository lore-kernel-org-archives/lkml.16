Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63D326AAB7
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749636527; cv=fail; b=MiM57x5BSYMg8w9SxUnIt9t83+o1WDluMHvNEWmPiaV4AB9NDhiVrRGWvA3cpTmDUTQeBmHhm5VM32igf/nbI6sL/3ErlFCjm0lDyIWk4/pbadaCsE3jfeyiM2XTFqF7uwzSp7SlZzrzB4wdXKrsSyycVP7v0f4ymOrQagrVHqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749636527; c=relaxed/simple;
	bh=OsWZNUpSdDLu8W8qGC5BLKicPq09gBT44r16z4AbByM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VB7FwBACuBOkEWPpJwrOldw68STkAo9MC/YAo6dt2SG22xx8HWRhsWWGtJOwE5dd+X0vsWtzGrScHz2riDhrq62CEg7cWuTWbJLWD0PskoRNMtztSgYJ7OBhIwGv1UzMSYqTCENcbCgTy2BMZVT+Y4vnmhxXqWMOexB61UmcjYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=frtNL7Dd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jYT0AOVU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="frtNL7Dd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jYT0AOVU"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B1CBtP031065;
	Wed, 11 Jun 2025 10:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=zUcNJUUSzMJFJfsFmlraDCjWi2Vr0sAMx6MIi2BSd0E=; b=
	frtNL7DdtKyqRtd5KuQ16zWMnx4iGkoImDZmE3ufPCjkHrG/OV8PakGtvHbeLAHy
	AHt/rIqHrixcF8J4IRXDbi+UrCJnn+oQb76654fFN6SP3BTXL9DXzbJ1n5IjYn73
	uZws/kLnxMhHdKGVX9LaB56b/4cgW9nZIB7+WSbl7+HqipxoKEccjyZhxp+bcOaa
	Cov09h3R+p4hRstdk8noFSrfyCl9kvaDpLfwVbrxDgOoAWE0X4VDGdLNHAGvu5s+
	jjvL0qgnlEU/q07edCzVd3fuWBolcYGxOKLeqY0ATxMlncnA8rjdo8wN2x6cW73V
	f5zr61vX9tzHh61/hknv1A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4752xjwa9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 10:08:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55BA44kS007569;
	Wed, 11 Jun 2025 10:08:01 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv9pvx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 10:08:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXUKi+Foax7/J6VI1rPeknnbSXEbh3DMZxiBh/o9dU2Gh2nrqd8GATVDSWninypFfSwXcfZ+wHLY8ygRnpGnGnaDcMDyOK0GaClBG9Rd/uUAfbZuosMCvedsM/nRit10xujCLJt7DlzjXO8rPIEVuN10HPuGZnXhLBcGWHm/KLkL3tLfyHppfDNmq+KeulGhT9ui4bPsa/4fx5ScppVSTy2K4TpObeXYgZdtO9ch1qtT/TAGrMh2NRU2NWTV2Z05ZQlO9R8bG7A5sJZu8OYEacA5l3CljVSoNQ9j9gXFrwf+1gpoSiltHad3xIUmX7RBGg/SiARg0pGo6Sy+4PD3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUcNJUUSzMJFJfsFmlraDCjWi2Vr0sAMx6MIi2BSd0E=;
 b=kehg4/htns4acbA1sD9hyhjtSSHX7pACaU6iVJOLCXZgiIwKD9Umy/aUn/RyxWECoPnXrS2Lk5MRLDx+R3FG7G2EVA3orsPgPZr57iJg9fMSL7ZPlVRCMz+bmeh+bgYhbgFFSXLsR0LGZhl6Nr8pQfYlBGem++WYwlgR+af3AcuQ73VLl633HwPcdGJuaLuhdg66p1zix4ISg9MnS63H+QOTwUevjKyR7ceAC123+sHipDmSUGodiXSdYpjzjo9iWTYj1X9vJlpdD3N51iZ/mVc11/AZ13sCWEds1zNze5tv1LZ2Dq7raQ0dkcii6Pdga9VgIsLw7HESSsJ/rVXx5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUcNJUUSzMJFJfsFmlraDCjWi2Vr0sAMx6MIi2BSd0E=;
 b=jYT0AOVURAVZv1J8Hhia02/itOFq0ifOc2/l8GunGuDv9HKkslTO3j9qJbFJ/vEe/eHWi0Iol2kqqlfnLxTl7AQvZIDY0cJnDi2KjmlBby3y+j1/IA3eWtd9OjWXGbGfHtczBmyJy4AjnJH7cptTxoUF/+vvvZ/qMzlnDl1iB+s=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB7453.namprd10.prod.outlook.com (2603:10b6:8:159::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 10:07:58 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 10:07:58 +0000
Date: Wed, 11 Jun 2025 11:07:56 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>, Mike Rapoport <rppt@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH RFC] mm: madvise: use per_vma lock for MADV_FREE
Message-ID: <a495779a-5351-48bb-93e4-6ccf52631796@lucifer.local>
References: <20250610055920.21323-1-21cnbao@gmail.com>
 <8e3b3a63-9060-4bf9-ad85-3ef5f5d541db@lucifer.local>
 <CAGsJ_4wB9=00Ct5W7vvfQprPHB54rX0G-4=ch2PAXCUU0tVJnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4wB9=00Ct5W7vvfQprPHB54rX0G-4=ch2PAXCUU0tVJnQ@mail.gmail.com>
X-ClientProxiedBy: LO6P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a7a8546-3705-443d-8adb-08dda8cfd761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHZFdVVCSWR3bk00azZobHBrUVV6VWNLUVZ3SFhHaXpSVExzWXBSblBLZHFT?=
 =?utf-8?B?SVZrNytwOVRnSmZ2NzhFeTVuKzJtbjNyck4wUUlKWTVaVWdMZzE0enliS3hF?=
 =?utf-8?B?T0kyQzZXOGptcG1mc2NHTFpLMmpWWWM3TnNSNWFnYjRWaEdsWTc3dFJ4K1lI?=
 =?utf-8?B?MFlnVkM3d2owSGxMWWZ6ZjJCeENySWt0VnNFQ0tjU3V0RzNrN1ZtSkdHZWxN?=
 =?utf-8?B?Vm5VM0ZXbjVGejcvWTc2Z3ZQV0d3aWFZTVZpRUpWbHdzQlUxeVB6T1JEOU0v?=
 =?utf-8?B?QWs1cjJNKzJpcmdvRURBQXNYcFFtcVMyT0RqT3hDVitDcHlhUHBKc1dXcjJw?=
 =?utf-8?B?dStqd2pPallUWkZ5ckd1L3g0SnZ3VHF2M3JPM2x6S0lldFVROHJoRTVWK2Ni?=
 =?utf-8?B?QWRSVGloVFUxK2g5NVVqeDdUWThTMS9uelhmcFNhb2llc21oQncvekI1MHFF?=
 =?utf-8?B?Ull6MmV3TVhEcHkrOFFUNGtUcjFyVFl1TTRqREdmbGlDanBrQ216V2hnNmZn?=
 =?utf-8?B?YlNMYkZ2RmpUUFFKeFJhZzYyVzRFZStNT21pTTdJLzJOb0ZobGhtYlR2Yk9Y?=
 =?utf-8?B?U0ludDVzcHc3ck9BYmM1UG5TcDdjQkpFaVVObWVrNW9UckdHdlNaSzdCdXRF?=
 =?utf-8?B?TU9oNjdvTTN3RFpwN1IxdHk4MStKTC9IVWE1czZqdG9DL2pZVmEvdVpLQ3Qr?=
 =?utf-8?B?aXZOUWp6ZHd3WmF0cHYvdHJ3S3l5SXFPd1c4SFJRMnNKK1pqeWRjc2dsQy9o?=
 =?utf-8?B?emxtVGxJWUpaZ24zNnZ5TFpFdlJ5dTF4ekIrdEIwaFpacnduTW9iNnJQK25N?=
 =?utf-8?B?SUNkVVRnc1JucFo2ZXJnMGlFWDVkWTBSckkvZ3Z2aEJ4c0pVTHZmN3dkdkxt?=
 =?utf-8?B?Q20xTGpyS3psQjgzOTA0N25WR0d2QitsREJnSGVyNVhRcjJlakMrUFFsalVC?=
 =?utf-8?B?N2N4ZGdXM3lSYkFteGJhbmltZFpYaWpGdXlBMFpTbjhwSk1FRkUrakp5bXRL?=
 =?utf-8?B?L1BjQiswNWUvcEZ5dmwyL00yYUJMOFdvdDFVWE9MU2s1UHJ4ODBmUE53akIz?=
 =?utf-8?B?MExvUHNGOE9yblV4aVhQVlBqOVN3djZadmZudDcxWHBBRHVKV0VOSExaWkRh?=
 =?utf-8?B?K0hBalJ5ZW1lOEJQUlVpcnhGcmo5K3pqSXFwNzVkZGFIcUVNeWMzME03U1ZU?=
 =?utf-8?B?RzJoUEtsaitLSFNvTHJwNFZvTEQvVGgra09FT3dyc24xUXRUYzdWSFVhYkNM?=
 =?utf-8?B?OUk3N0JZZzB3WTVSN1pSM0ZDMnV4aTNiTDlzdDJHd25VUEZIK3FzWG1wZmp1?=
 =?utf-8?B?MDIxR3g2Y20vTVlBNFhwb1YvN3Bma0Z6b0NWb3A1SlljWXpLMC9DSnFzbnpW?=
 =?utf-8?B?bWJSeVFYclJMRmt0cjBYMDJBZGpnVmlYcmgxZzBQQTQyb1VqclFMb1Zqdko5?=
 =?utf-8?B?Z3ZGOThUWVFxOWxyRmsvWWhDZzdxUzlPa1dnbys0dEZzVGVXSVBucHZPeWhD?=
 =?utf-8?B?cERnSEJ0MCtydmVBSjFRQXcrQ2tacjc4clZoVFIvSytCL1JtR3lKaWM2V05J?=
 =?utf-8?B?a2YxTndTblNIVFBqMTF6UXNoekpqQ2VFQjFBVER2ZmFLeExGbGlHUE5GQ0kz?=
 =?utf-8?B?M1ZDMm9mQTFyS0dLTW03TEppdEUrNk9jL1ltZG9BcHBTWkpEOHViVGVSczZC?=
 =?utf-8?B?QzkrWW1pbFRDdGhYVkZ3SGxmNWdOVjV3WXF0WDJoVTZsbjczaWZwUzRNbW9p?=
 =?utf-8?B?a3M3TzZqL0RrV0RYb1dzR1hKanh5cldPVUltVkpibFI1NXVDTE10RTlQeWVy?=
 =?utf-8?B?OHFuM1c5QzhkajlWdkdHR0NDR29oRjlsbWY0OVFnUWJlRmJ0UXpIRGliZ3lw?=
 =?utf-8?B?Q3JRaUxqUTNXTUZaUDEzMWtFUjdRZHB0bUtPVzQxWldhWWU4OS8rZUh2YmZZ?=
 =?utf-8?Q?oPPA3AONuiI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dThYYnhaZ255aU4yVS9ML1BiQXg0NDZLNXFTMVoyVEJUQzRlWWE2TFJNYUpH?=
 =?utf-8?B?ZkIvYWFkL0hlMS9sUDlmbHBRQkJQdWJGMG9helZCMGV1UGNrMUJYcFNXL1pm?=
 =?utf-8?B?MlVSajJNbC9CQ2pCejZJNkViZDdXTGxiNy9lM3ZMaGs4Slh6S2lPek9ULzJ6?=
 =?utf-8?B?L3hOWUJKOWN0S0FIcndNQVRZbVpVRlVqcVJlVFdQV3l3QVA1T05sUUJNVy9h?=
 =?utf-8?B?RXpVYms1ZUhtZlpxbXpnMEdTd1dWY0VYTnlIV0Y4SjFxZ2JqbVdnbjNhb09C?=
 =?utf-8?B?QVJYK0xERE5yRVVsZEhzNGJJQmp3YmRlTjMxQ2pLYUl2MW8rZENqbVNjMWh4?=
 =?utf-8?B?RzY4Rkc0WnNBK0F0V2t4YUwzS3c0NWY5RWU4TnRPL01DMXdpV3dPa3hFTDAr?=
 =?utf-8?B?WFVNM3ZETkU1NktIMC8wOGNkbzJ1YWpBOGJnQXJXRVhRZmNudEI2OTh4QlVM?=
 =?utf-8?B?TUFxekxwbFVSellzSXNCNm83MkhFb0lkZG5sM2ZKUktvamg2eGVVTmYvSjkr?=
 =?utf-8?B?Y3pEbVlVQVRoK2VzNnFaWWE0bkFsMlRqaWdaWWsyZDd3OERXQ1JSeU9QYzN4?=
 =?utf-8?B?UkxGZUMwNnRRL2ZMSkRVaXRpZWtQVE04bS9jbU9tTDJjanZJUi81WnVJNXRN?=
 =?utf-8?B?WkRyMHNFNTNTVEJmeitlRldCY3FwR0NwbEtRWjdsVHk1SVJzaGpGU0hnSlpF?=
 =?utf-8?B?WkNmaVY0cjZjMTRJMXlxbGluU1FxNS94WWpoZGtEWDZpRmhQaldZcDArdFc2?=
 =?utf-8?B?QUNDbUxPdjR0MVI1cklySndKL2dScGNzYlljSS8reVNNaGJmYmV1ZFJ1OG5k?=
 =?utf-8?B?L1VqTW9HZVFTRWlQREFXengyZ1U4SHdTZ2lwckIrSlIwVXlmNFUzaG10dFBQ?=
 =?utf-8?B?WTlsTmxzb0dSWm51b3VueWk5N0tGb1FYaXRNUXEwSnh6STZjNnA3S3lXTktw?=
 =?utf-8?B?OHpLRGxhMXZ1TWU0Q0RGRWRSTUw1U2pWaWh5QWx4bkliZzE4MHR4bUdwNnZ4?=
 =?utf-8?B?NWFZbzJWSTU5d3ljQ2QwVmFnL2oveDgrM1hDSEJseHRTbXEyNjZBaWsyVllV?=
 =?utf-8?B?SERzZ2FzK3UzaDFnLzBZMVY0VHczSEhEQkFMOXFNTjYvM0JMMjl2cm1Uay9U?=
 =?utf-8?B?ZSs0cW1hcDFPL1hZU2RRbDVuTkpxcFVRWHpZTnJRQ0I3Y0tOU1hpakFYVGxx?=
 =?utf-8?B?SVJnMVpFK3MxcXZqcVBXbWVDdGhkbnRuZFRQb2xKb1NMTkVBbXBSZmh4RGVD?=
 =?utf-8?B?WXVIUGdoVHdXSGVaa2l3MHcvSUEzL0ZHenRwZlFVeDUvZ3VabDZ1NGJpZjh4?=
 =?utf-8?B?dzJWYWhnbGxYOGJQNFJYRHFZSWZmVjZmR0hSVXEwTTVlcEZReWw5ZlNFUXdj?=
 =?utf-8?B?SHN3bDhRKzZVZkk2S3lnVHVoSkFSSkZ4aVd3VVJSNjROMDROb0lCVXF3WVU2?=
 =?utf-8?B?MHZlVjc3d3dSQndRM21GWmNpQ1l6bUZrOTZQaVRXcUlTNFlISWN2M1d4clRv?=
 =?utf-8?B?bnhsaDRWb2N6aXpQbVAxdE1vVTNQdHZheUZlRGZDbjZlUWR4WDlIdkdld3Bk?=
 =?utf-8?B?QjhIQ0xXdStFMU1UMld3RVBabWhVUlBYc3Z5Q3dwNUROVUtoaVpkdDBYaUxF?=
 =?utf-8?B?dHg0azh1K002YVpyVWV3ZVF4UVlHZGloR1psbXVWTFZvSHFnd00wN1BuSE05?=
 =?utf-8?B?WnAyUE1KV3Y2eWNOc25TT1R2cEZSWGVHODNmNmI3YkxGbDhTcytTN2twdkpO?=
 =?utf-8?B?aHdjVFU5cEJBdVQxcHdBMjNtZE1sQlhWaHdoQmdmYU9oSW9LODViU0tZZWEx?=
 =?utf-8?B?eGZOSjNFTnQyNk9VdDhZendDRmJMVGVaNGJZcEx4VWZrM2I0eThPYW9iMmx6?=
 =?utf-8?B?R240THdGbU96a3g1WkJtVEo4TVQyaEl2MngzWTBLMjNoQ3E5UjRVR0ZQTDNv?=
 =?utf-8?B?R0JVUGRNcnRpM1FlWEJxOEhxbklmRDFlZFhaV2dRWGpnY2JEQUthQWJwdUxH?=
 =?utf-8?B?MUhVRmlmYzFDOVZvMVQxS3dNc1ptVmRzNk15MXdkTzRVUXpMUTNFYllLdGhV?=
 =?utf-8?B?OUVWVm1mS0RSY3owMXlmRnErZm9sdC95dlUxd1hqd2puQmYvUWZHeWV2NHEr?=
 =?utf-8?B?NnZuOVovZE9kTVRMWDd5Y0FlczRBR0tlWVpiMXJORzFmZXN2RFQ4aXhyUk1K?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A5pQHDQ7fn1DXUgFMfytH6CuFzyA2Y+UeNIhEHXx//ixvfL/a5zhu/JfHoa8ZcJe+wfC9TLC4NnIbwUjX3NUwA4ucQl04Mf4AFqbdhlUuzWLTKmV2J6npTBv2EX6cJV78HSwJCSngE+TGcSLPAh04RjWUjiPoqfG48aZFsvvOpmmdb8w8wiDk2pc9YBUvM/ZgaMSmqq6Lm4o6amB1B2qPP1GndRklMWX0nOROesAdBdCXR8mH4pYES/OHEFNYRS3yqVHgeIVfMh6L3oPlFNP+z8C6qiOZBBDDx2+HT/ntwuBkZ4T1RHjMJ3d14MYVWetJlW994L94tH3JtyiUTRYeSGCO3jOuA5prnIgz/9drTmiR+Y1+SvEI0PDpDiCTUOmTJEvirlpY2+Vs6tBMeC1vibS1dTQsK0iQnmd08nv80udMiioY5zMlmmYge/m34GFw0nJsd9YJwyd5h8sxDEOBe9oIxOUPT85QH7y16R+UayNIJKwctd1TRsqDgoR87We7B92fKedYsbUUwyjtkjZU1I9GGifdEosvYWrQTSwtBGTPszg+xOFkes+Pz+jd2Qi7lm4DFFwQBIvN/70dtXnWOfEeXETenRLN075TM4Q4xU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7a8546-3705-443d-8adb-08dda8cfd761
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 10:07:58.2690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SN+Gq3fFSMFm9LcKKRc0EG1AMLMmV0SjT3NAu2qixuagRz4J4GJltD5nzEV5yLEfNVu2xaQzu7Z3KPLz2dxSJD0pUX2LGMrGbWWT+3Imu3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7453
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506110086
X-Authority-Analysis: v=2.4 cv=K4AiHzWI c=1 sm=1 tr=0 ts=68495582 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=A2pY-5KRAAAA:8 a=20KFwNOVAAAA:8 a=1XWaLZrsAAAA:8 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=968KyxNXAAAA:8 a=-4l5Bop-k3bTflrO4pMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA4NiBTYWx0ZWRfX+AIaEl2ODsij FGTVdJ4poCS9GibVR30TAi3ZcAW6dFukgjcMWBQv/lvPCrNL/0EQsTunP0p4wMmuh6nJra0qS0Q siPQeCxXA4IsEsjnNbkxlvC5eLoT0plFbGf5r1oS8wTB7BxUN4orVugWb7dp3bhhwqn9yDq64Pg
 impGWq11YEuriYVoN8rGlHROAwdoDjbMrPTyo1V5AHK+eHSzBoP8A+YWS6r097Inq6cCnWSQ7Ey 0MIcNWkBmV7N/t3FjykO2kvQfJlzYyrq7ujXZ5Cas8oxwZ0aK/UXoWBa/UuWtmWImAEe5l5bi9w 8/2aBMEZEN/yqTCfsdoG2EkpGBdlrWt1qcnXDkUy89liNJD9s1Jpj5Lh0gZFlCupaYXRE3yqBb3
 zkHhmI9csJhquT+C4zVkEw5JgqsHNHLO1o2yHWUzDLyvncjMb7ERxL7HIPVlhtrnQoH9yZBz
X-Proofpoint-ORIG-GUID: cgli5XKf-V3e-9vfWCUENIK0XASx2HFL
X-Proofpoint-GUID: cgli5XKf-V3e-9vfWCUENIK0XASx2HFL

On Wed, Jun 11, 2025 at 10:03:05PM +1200, Barry Song wrote:
> On Wed, Jun 11, 2025 at 6:52 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > On Tue, Jun 10, 2025 at 05:59:20PM +1200, Barry Song wrote:
> > > From: Barry Song <v-songbaohua@oppo.com>
> > >
> > > MADV_FREE is another option, besides MADV_DONTNEED, for dynamic memory
> > > freeing in user-space native or Java heap memory management. For example,
> > > jemalloc can be configured to use MADV_FREE, and recent versions of the
> > > Android Java heap have also increasingly adopted MADV_FREE. Supporting
> > > per-VMA locking for MADV_FREE thus appears increasingly necessary.
> > >
> > > We have replaced walk_page_range() with walk_page_range_vma(). Along with
> > > the proposed madvise_lock_mode by Lorenzo, the necessary infrastructure is
> > > now in place to begin exploring per-VMA locking support for MADV_FREE and
> > > potentially other madvise using walk_page_range_vma().
> >
> > Thanks :)
> >
> > >
> > > This patch adds support for the PGWALK_VMA_RDLOCK walk_lock mode in
> > > walk_page_range_vma(), and leverages madvise_lock_mode from
> > > madv_behavior to select the appropriate walk_lock—either mmap_lock or
> > > per-VMA lock—based on the context.
> > >
> > > To ensure thread safety, madvise_free_walk_ops is now defined as a stack
> > > variable instead of a global constant.
> >
> > A nit but I'd add 'because we now dynamically update the walk_ops->walk_lock
> > field we must make sure this is thread safe' or something like this to clarify
> > the need for this
>
> Sure.

Thanks!

>
> >
> > Did we not have to worry about this before I guess because the mmap lock would
> > exclude other threads?
>
> Probably not. It was a constant, and no one needed to modify it
> before, no matter how many threads called MADV_FREE.

Yeah of course, I wrote this before I went and looked more carefully and comment
preceding this and... anyway yeah :)

>
> >
> > An aside, but I wonder if we have this implicit assumption elsewhere that VMA
> > locks defeat... hm :)

This is more the concern, but not to do with your series but more a general
thing 'in how many places do we make implicit assumptions about things like
thread concurrency due to locking we presume we have?'

Hopefully this isn't common :>)

> >
> > >
> > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > > Cc: David Hildenbrand <david@redhat.com>
> > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > Cc: Jann Horn <jannh@google.com>
> > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > > Cc: Mike Rapoport <rppt@kernel.org>
> > > Cc: Michal Hocko <mhocko@suse.com>
> > > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > > Cc: Qi Zheng <zhengqi.arch@bytedance.com>
> > > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> >
> > Looks good to me, kinda neat how the previous work for the MADV_DONTNEED under
> > VMA lock stuff made this pretty straightforward :)
> >
> > So:
> >
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Thanks!

No problem! Thanks for the patch, this is a nice step forward.

>
> >
> > > ---
> > >  include/linux/pagewalk.h |  2 ++
> > >  mm/madvise.c             | 20 ++++++++++++++------
> > >  mm/pagewalk.c            |  6 ++++++
> > >  3 files changed, 22 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
> > > index 9700a29f8afb..a4afa64ef0ab 100644
> > > --- a/include/linux/pagewalk.h
> > > +++ b/include/linux/pagewalk.h
> > > @@ -14,6 +14,8 @@ enum page_walk_lock {
> > >       PGWALK_WRLOCK = 1,
> > >       /* vma is expected to be already write-locked during the walk */
> > >       PGWALK_WRLOCK_VERIFY = 2,
> > > +     /* vma is expected to be already read-locked during the walk */
> > > +     PGWALK_VMA_RDLOCK_VERIFY = 3,
> > >  };
> > >
> > >  /**
> > > diff --git a/mm/madvise.c b/mm/madvise.c
> > > index 381eedde8f6d..23d58eb31c8f 100644
> > > --- a/mm/madvise.c
> > > +++ b/mm/madvise.c
> > > @@ -775,10 +775,14 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
> > >       return 0;
> > >  }
> > >
> > > -static const struct mm_walk_ops madvise_free_walk_ops = {
> > > -     .pmd_entry              = madvise_free_pte_range,
> > > -     .walk_lock              = PGWALK_RDLOCK,
> > > -};
> > > +static inline enum page_walk_lock get_walk_lock(enum madvise_lock_mode mode)
> > > +{
> > > +     /* Other modes don't require fixing up the walk_lock. */
> > > +     VM_WARN_ON_ONCE(mode != MADVISE_VMA_READ_LOCK &&
> > > +                     mode != MADVISE_MMAP_READ_LOCK);
> >
> > I find this a bit hard to parse...
> >
> > > +     return mode == MADVISE_VMA_READ_LOCK ?
> > > +                     PGWALK_VMA_RDLOCK_VERIFY : PGWALK_RDLOCK;
> >
> > ...might be better as something like:
> >
> >         switch (mode) {
> >                 case MADVISE_VMA_READ_LOCK:
> >                         return PGWALK_VMA_RDLOCK_VERIFY;
> >                 case MADVISE_MMAP_READ_LOCK:
> >                         return PGWALK_RDLOCK;
> >                 default:
> >                         /* Invalid. */
> >                         WARN_ON_ONCE(1);
> >                         return PGWALK_RDLOCK;
> >         }
>
> I actually tried both before sending and, for some reason, preferred
> the one I sent. But I'm totally happy to go with whichever approach
> you prefer:-)

It's not a big deal, obviously I'd prefer this version but not a blocker!

>
> >
> > > +}
> > >
> > >  static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
> > >                       struct vm_area_struct *vma,
> > > @@ -787,6 +791,9 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
> > >       struct mm_struct *mm = vma->vm_mm;
> > >       struct mmu_notifier_range range;
> > >       struct mmu_gather *tlb = madv_behavior->tlb;
> > > +     struct mm_walk_ops walk_ops = {
> > > +             .pmd_entry              = madvise_free_pte_range,
> > > +     };
> > >
> > >       /* MADV_FREE works for only anon vma at the moment */
> > >       if (!vma_is_anonymous(vma))
> > > @@ -806,8 +813,9 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
> > >
> > >       mmu_notifier_invalidate_range_start(&range);
> > >       tlb_start_vma(tlb, vma);
> > > +     walk_ops.walk_lock = get_walk_lock(madv_behavior->lock_mode);
> > >       walk_page_range_vma(vma, range.start, range.end,
> > > -                     &madvise_free_walk_ops, tlb);
> > > +                     &walk_ops, tlb);
> > >       tlb_end_vma(tlb, vma);
> > >       mmu_notifier_invalidate_range_end(&range);
> > >       return 0;
> > > @@ -1653,7 +1661,6 @@ static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavi
> > >       case MADV_WILLNEED:
> > >       case MADV_COLD:
> > >       case MADV_PAGEOUT:
> > > -     case MADV_FREE:
> > >       case MADV_POPULATE_READ:
> > >       case MADV_POPULATE_WRITE:
> > >       case MADV_COLLAPSE:
> > > @@ -1662,6 +1669,7 @@ static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavi
> > >               return MADVISE_MMAP_READ_LOCK;
> > >       case MADV_DONTNEED:
> > >       case MADV_DONTNEED_LOCKED:
> > > +     case MADV_FREE:
> > >               return MADVISE_VMA_READ_LOCK;
> > >       default:
> > >               return MADVISE_MMAP_WRITE_LOCK;
> > > diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> > > index e478777c86e1..c984aacc5552 100644
> > > --- a/mm/pagewalk.c
> > > +++ b/mm/pagewalk.c
> > > @@ -420,6 +420,9 @@ static int __walk_page_range(unsigned long start, unsigned long end,
> > >  static inline void process_mm_walk_lock(struct mm_struct *mm,
> > >                                       enum page_walk_lock walk_lock)
> > >  {
> > > +     if (walk_lock == PGWALK_VMA_RDLOCK_VERIFY)
> > > +             return;
> > > +
> > >       if (walk_lock == PGWALK_RDLOCK)
> > >               mmap_assert_locked(mm);
> > >       else
> > > @@ -437,6 +440,9 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
> > >       case PGWALK_WRLOCK_VERIFY:
> > >               vma_assert_write_locked(vma);
> > >               break;
> > > +     case PGWALK_VMA_RDLOCK_VERIFY:
> > > +             vma_assert_locked(vma);
> > > +             break;
> > >       case PGWALK_RDLOCK:
> > >               /* PGWALK_RDLOCK is handled by process_mm_walk_lock */
> > >               break;
> > > --
> > > 2.39.3 (Apple Git-146)
> > >
>
> Thanks
> Barry

Cheers, Lorenzo

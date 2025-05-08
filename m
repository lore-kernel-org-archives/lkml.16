Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86BD27AC43
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746720262; cv=fail; b=RbBdYCWgR9ADy7uEgYCPTR743Kva90hNZwIVhJ2pBh6VGFXPCpIuaCKxeHZQgRDCEeIBnO2uGqc0FReHPNoxUJd6j3tNRO3p4SezQc1WG8P7NO9QD9SdR2s+NFefiL4K3DPwB6q8QwtQw58qADeXawBgnhcYu8+5KYU3tTklTiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746720262; c=relaxed/simple;
	bh=6n2HMMlTqoVM0YECuWVCFBuwiLyZa0oArv5+D0fodKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fjKcdMLQhQoKErDS7lHYt2wiVwO7l9ufH+7/rGzaUhctR/MqsXuXaRWvIcd2YFj9nV/4I50BwtXJNM29sVEvFpj2HBF4k564pbT717q6ien6qdZv/fU5Qksh2H6QYxs5RMTYlpl3w9c+OKjUuczanPv2GiwTrF+UERo7u1043pM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i+DOSTBi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=S9Kj+OgI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i+DOSTBi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="S9Kj+OgI"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548G0jfm000522;
	Thu, 8 May 2025 16:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=9PEZCirS2YDm4Wm2tF
	fGIfpf93h/ijJA56SGAldduH4=; b=i+DOSTBi9f4ztypML9wnV89hGhdKFSzaRE
	rX54uvVkSwhLnp5TVZi38gYnIM+qXNzK+I4WZMiz6YdSbHI6R5Q5HmUXOzjTSfaW
	t0WpYcdFhgQ2CXbu9GcYiLYrFU9v9gmRw9v4E1mqFOOy7oiE6nmHLpiF2/0reWKR
	PlvpiiCdhr+RhCrFMSVr+2DU18rMButXReospAizOWBx8Kgjuo2vEPI3YcwUUw/l
	3Aph9Ve8xsRkrU4BSQY5puDMUwTWImAkvf3SIDl4SGh0xASU3zZBYJC8bqAlyZLY
	Oi1ZyTaQLOnI6BNBQoUVbIE8onyZqim3WGEhDgYS4ceCGIEINVqA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46gxp6g745-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 16:04:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 548EbwEs038324;
	Thu, 8 May 2025 16:04:07 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazlp17013059.outbound.protection.outlook.com [40.93.20.59])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kbmm3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 16:04:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXn62Gki8BEWyTCEDmjbNqMAp/aCAX+84jHyOdvWcFavNvlD6Aw9U9MXg4L/ldAAmTU/zDX+jOzGiyy5GLJ/U1c4VaGafNjHaPtGJtM5OTC15m4WP3A+nv49cvO+ViNlglNQIynr8e3d/JlNRt56AIPF8OM+UlDsr1DiBjkgKVjypF0BnzGPX4bhv+pchB0VZellb80E9Fv+TkH6Eam00UW4yvDE/vumLjwwm3f+VIMowvaKU33TIHJChhE0rI3LRzCJgn/CYdrg/k7CcGlKgdt06B4GW5/1CFQGWDKGKtd2M+8OhxFwy0hBh8cclxuJYugo/0Hwx7qBYhKwPZDEjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PEZCirS2YDm4Wm2tFfGIfpf93h/ijJA56SGAldduH4=;
 b=tIR2xLWdrDgg2OcdhLRBgl5LY2ULeuJ4zOj38kVJuISjLI2YaqrI/+6ZPKCVmTIzMAv9PPP8z0XmDJTSW2yNinoeZXArQDFnr8FVh1srYpB8Lv14kegAKpcKkQbcMESEsQE1nfyXFvbFqNiM2ODqKm0GyBc5sjm1eqJ0l/vfxZhxuC0wHw7++dc832zszuguKWmr+OQCaF1uKBRweJKNW0VO6pMoxEkUqY8iIIl9Erhh0YAThBW7wGwU1+7xMkm2D2FuJfR13E5QLz1ZzEqYsMMlHz01iWoBfZv/843vv1DWVkduDNsP4Xjp3v7DK5JZqd7QC+HrkErNwEMVYjRg5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PEZCirS2YDm4Wm2tFfGIfpf93h/ijJA56SGAldduH4=;
 b=S9Kj+OgI8cNHZDwp+kGr4Q996IP/XvnxoKPqrJIakaDy/+K9E08H5qafEuc1ygQtVq8RceMkijtlTkbxD/dLYt5UPw0NW3qgdPfyCRKuNXci+BhP8enBnLA8/yOmbPG7AebttGnM2uNxhxc9vOu5UsVGy8MHYMd+XV8j8kbwd1U=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB6246.namprd10.prod.outlook.com (2603:10b6:8:d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 16:04:01 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 16:04:00 +0000
Date: Thu, 8 May 2025 17:03:58 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] MAINTAINERS: add mm GUP section
Message-ID: <6050270f-1556-4df3-beab-63e907b28d82@lucifer.local>
References: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
 <20250506162113.f8fa0c00e76722a1789ec56a@linux-foundation.org>
 <c4258dfd-14ee-411a-9fa7-c4a1fa4fad1c@redhat.com>
 <aBshiBX_N6hhExmS@pc636>
 <13a32f52-dc5c-45ef-b45a-585586868509@lucifer.local>
 <e3e2663b-2749-44c7-8452-ffcbf2167572@redhat.com>
 <28428030-1178-469a-a4ab-f1e7179d9106@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28428030-1178-469a-a4ab-f1e7179d9106@lucifer.local>
X-ClientProxiedBy: LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f83d7a7-e680-4d77-89a3-08dd8e49f270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7cBIQrRrE3C8FIMp6XEqE+3yViGGcXeFAgGA/Lju6zi0yOawfYqVuEdSxUmm?=
 =?us-ascii?Q?OX7nR8gTHjgBAee7uDiPj7IB9wV1lkJmslIBwHwcg0wAAMkKkm1ZWhWHtNpB?=
 =?us-ascii?Q?FurQP/aTrSE/JjmNYRY8TQfoFiKBHUpSlxY0zR1lhTzOZ1vt1SnEnBH053aI?=
 =?us-ascii?Q?x5lDW+//RLGcwZKsKDS8ZqM2RaaDvvJydi7r9AcPg+c2sCJ2YCamFp4f3Zcb?=
 =?us-ascii?Q?F3z19buXHNaC+hcNmxVhtr4KOWcJE6IR9cPjjCy2B5Mfp3kdqcEHWZMD47di?=
 =?us-ascii?Q?/7JSZ5yJz3l89fbGjC8K/IsOTssNOwrV0Ao9THErrOydyt3Yy1G7TocUtLmg?=
 =?us-ascii?Q?zEBa/IB2lrvrKqlCAY3cnb/6XZcsk97ndjNQrd7lfTJeEU91KSYoOplM8z0o?=
 =?us-ascii?Q?B/u4xGsOButwxVz0gHH7MOzbFJSiE4WSRbk++1BpzDgch3lGJzip7B0YxMmw?=
 =?us-ascii?Q?qb89Ujn3Axhocn06BhKOHPn1EEVjmewA5buj3bTjMayd2CdypH3u9o9QT5Sv?=
 =?us-ascii?Q?h2GfZnsWma5mDVoUhnc5wmKDmjX+pcyOeZFt1vEN6D9r5tsbqkpolkL7Qd/p?=
 =?us-ascii?Q?SAPzzop4bM0dl+eaIksnKyxHkNUE9E1vP5F/b+tX/zYUoDCgp3uA1MEmyb+8?=
 =?us-ascii?Q?Ay/wy4s4WgjoGms5/KAREFmhqu62cZAgWKW2NABc36KVXCj5t931qtsg1EBh?=
 =?us-ascii?Q?k5d09iPCy9sSIRgn/iiLuBbUnOVAbDPVqfjx+JmcIpfrufqebsuHqf930/2h?=
 =?us-ascii?Q?+ehPtD5p5c8zXEoASDGxQqGWT4G2V0yHmW8fGRYAu0GOvPalgRdMPj379GqW?=
 =?us-ascii?Q?K3UcbXhTCCPSR+T7Urn66XPgrS7yKoItdTDPqxCn0r0DoinOrm+F+qkyWMJS?=
 =?us-ascii?Q?HLUC0//zTSZ5uf3ZObMXn+A5U/cCNhgiv+m1FAXOr5Z830B/MDqmA77ZF485?=
 =?us-ascii?Q?RuE7qAnZoiPPsXLedtPIx3nteh+HfN08WTPMQeqOw2YzkXLJpXtbMBHYSq96?=
 =?us-ascii?Q?VJFMwYPqSkdX+TwzwQSbaQXL1atjoSinM1o7rExXJyiFre15QygFraScfNHJ?=
 =?us-ascii?Q?KnnUA32dZW23tzArkUGVab4mYapev2M74Tx2HkyYV3ZVi0qMaTG6vSq1KEty?=
 =?us-ascii?Q?cUMNsH5icESbzL7dIa2vvNDdcYeyAD3XGMZCjXsMp3+SrJy9yjZh434+gK9M?=
 =?us-ascii?Q?qZY2iJvIRzNDwP+lwTi7GCT8ogRMiJxZwxRFOWEdPWijWPwqbnvw7vTc7hbN?=
 =?us-ascii?Q?k/C2bmz83qACDMXGFLxl8q5mjdwXHKVCXifCKLzOQFrp/TP1IG8Xk7GKzqWQ?=
 =?us-ascii?Q?2Am3G0VsY+rs83lgY2uqIUtUEJ48VjQPpcaNgLcIGrvHt5UxqkU8HTfOYDsJ?=
 =?us-ascii?Q?WuWHB5EKZdV9pc9Ufr5vI0K8fGVypJhB71IHGr6lzX8iJQ7e4UGV+v3HMl1t?=
 =?us-ascii?Q?/Ah4T247oOA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1oy780AlJekD4+DWpyvPq/dosN3Frhy2Qx++nppwNmotqIwilK1INhOYvHN1?=
 =?us-ascii?Q?hX5uJP52XwUkjV2mEDtpnMxOmKCk6+OSlhBGcGo9dBUedpykajGXy4FqxR1v?=
 =?us-ascii?Q?bHnO0isOqc5hVOJXZRcTkzMugSrScYeGw80raWgNdETzvb/WuhN8xibhVc1g?=
 =?us-ascii?Q?gHrfK1xmL2BDkf081abSY4zFL3NXt1jGIXvZbvXMgTHmA7v5HaU2pdPtt1e7?=
 =?us-ascii?Q?gmirBWidBVZBcXJo+dGEGm6jX770X2vVB/7P4FBVOitYrWE2CRHi/CPc7GvJ?=
 =?us-ascii?Q?KQkZMCED0cBg3MVn9DNfs6gqUPTf84XhPLxOUgCJjzBi77ZLzuS3CqBTAPGl?=
 =?us-ascii?Q?jV1TwMmYV5WYS/7yVJ8Huc4+9SU45jGQLKmYLnIamNaZaZ4dJGTey/9oyEQ+?=
 =?us-ascii?Q?ArxCXtmEMW+hBKaLgLY3aQITYssU2Zj9yAasM8c4UeC4fEwd3tj72/Qf70kD?=
 =?us-ascii?Q?sWIgxgVo9CrMGpWU8IeN0Zsd3y2v5iUP1QchRG33QXOLHb1DpvfmVaGIJxEt?=
 =?us-ascii?Q?04Kg/Eo8kFxFV2m6mtrMlExde4qZ1JH8CzS7xc3QzVTG9jNrRXgZTJUw03ay?=
 =?us-ascii?Q?/qriKm/nE7u/shuObH3LFWNsv37jjBrktK/CGAbBZRxnlxmA+cDH19WMRafq?=
 =?us-ascii?Q?HkrRohBazGBcDLf3N7aFZxwoZh41ZTMQ5vOD66tSpVSJXCnfw7qn/UiEsMHT?=
 =?us-ascii?Q?nwbLrDymb7FPRIASdyzTxku+Kq+7L1H1EGYruWCU6m31fOntuy43MIJmDijc?=
 =?us-ascii?Q?sZzKlrxP1M7X5oFVk/dYcZGRNvFJv0N2M/sOuTmnIUo+LqGTUCcYL6AEITSn?=
 =?us-ascii?Q?U2NdpZtmE0uipXjWhYZ1j8xZkWPGmWBqDb4oI4Yf/wUfy7TpGRS48xJGtjnC?=
 =?us-ascii?Q?c/3GWrRfWOFtPCUILe8UuaXIAYPTt1Vprz9WHhUpLg6c+PFq+a/ufZbLR1gw?=
 =?us-ascii?Q?It6AE4s8lWrlyWnggnQI2rgigpwEayYdkV6vK3s8LjinxKzvuLY2hJKZ4BuK?=
 =?us-ascii?Q?ydQmnou6toVrMTVjPXBexYLuX0mYFaKELpaqWAw6cxHIGdpGV2ExbSPhCTRw?=
 =?us-ascii?Q?wwHarrnMl0yPPHniRilkPEPRoEsfKN5Is3+Tbi/G0+0pBzi91sGqZQqCSpr/?=
 =?us-ascii?Q?JbW/vYuorOc29VDshSLWgJqIlWs8EBpWQ9doSazzyXI3uCbjj0eefvGUdCfA?=
 =?us-ascii?Q?G0WL+vd5ZOkiOSslmVDl8iF529hErIZ4byCw+1VFc8rBT0xFoiUNw7R564y/?=
 =?us-ascii?Q?pmZR9diguxpZ6unOFpfVn0mMHadqfqBHKoMkyiiYaitbvOJYoCBGB+RfG12a?=
 =?us-ascii?Q?qGxQjZ8rVfU+WGHsfW5I6ZrNfx1G9b9ucyAnywj2Ncmo086Pe4XzgkvqhJLJ?=
 =?us-ascii?Q?EqziAQlgZ7fsJpNywyoSDhDWA9jysrQtcnVkT/HG77DyzGirT4Zjl+Ng1K7Q?=
 =?us-ascii?Q?wIK248hxq8LLX0+e/oNbjA7RpHeniT19rXBb10mS7J8c8Ihi0ZFffbeuHc61?=
 =?us-ascii?Q?DBn1kEP2FAdZz17LI/YGm4gWoeEriw7DxgJgn/xk/ABa/Cotkq4lgYDqH4YS?=
 =?us-ascii?Q?Ny5LFD/AsTDbCDZKX3uAG+XJZk8rHhb4p0qOj1YoOtxJ+zRS2tvsWWQk4jlW?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GcYkq2pzHIz/Kkh3hGVL7FqZ2PU+PpVLef39/Fv2IIXuXryyIt1e5f9gAgz4n+41oa36yipAFQ1bKpmgiP7Dvp7UGMZhIJ6KhjQEOOykgvNTuVVIssSBUbfXdWEN2XjfvyBYhbcen/+RXBr0o0G4GB9rlIW/KSW42UBv6R2UsBQs0ILyuusIlY+ABcnB296jtJClL3Tg9fP46SSAvxqJ/2N2NSnLBMVFKWBFSkKMl83dsNzR2Q1MJZLD8srPK6SZS4GgPAyoKGpSggIuPtujQxYtjjzzrZ633x95aNJRYAeMBd8zbkZ97ZahNXPrMsR+5j0EqaJF9mGhkPPZ2boPrI9sXNFlyKRSmYwq4Wn6+5c9ld3FyLYYLYV4owU5DUObZi4idkQO+YxwTZHQ4+d+ddxkp7SVt1g3/HWa2LSzowiigYvX1WE5mwRbvvqlU8CeNt6Bx/zk1PmqI3OrxyN/SSMnMV79Q1EAzr/t5ITt7k8tvEVRyuEj7SgtaIIVZCasyK8xU78Ud2WSMK93B94vVgYb1jZcsZMkwBkyJbVLQfd/XBqlyBgE/b9OMQ6JV/OsF0AhLUh99ezA/e62P1gzELLTXy06bzzLKzy2UWqMXJ8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f83d7a7-e680-4d77-89a3-08dd8e49f270
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 16:04:00.9193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n016jOnQt+cLhMqsPXH+n8/Cwb0UYmFYpV5i81lg1l+zA87dyCmJ5OgZG+MlaDUWjWsCdpCtJuMHeFAASQXqP/aWmYtLSfRRsfwgPXguve4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6246
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505080140
X-Proofpoint-ORIG-GUID: IcwXLFR67vc4vDR0ylJRAxCm3rCkD676
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE0MCBTYWx0ZWRfX2B01eNrcY/rO W1k08+dvl0P/mVapkiLioX5hBqRsuf5/uBMx7Q5OktyKVAu9oaHv+a1EIndEx8Ys8c0NxNSrTCW Ajk0agfKJlZy6dJmUg+c5ChYyoPLZrGWj7DUsSB0R0zByFtc7V5Lq/xUUsK0UlkPRHHujLjtNCO
 cow0t8rsiiJLjjDrNdaLJVtwQUayiytocSmTBu5H9RwiycKu1TwJosxeBFjgVNvKpMzc0b8QkjZ Y8w5mFSOXoRBsTZpdMh4cDLV0WaZHSyRFCNBImyUjAnz4Yxv3CpG3ngyAHZz/F7u3BpLIkX0qaG 79g1ocxugixuyfdGjOPNmO9z78gcpe6CR4VGAQizswIAy+fyHGRFG0Jq23bBeX1HVhk4Jnrh7Q/
 mbDPrIvCj0bb+h6AFbSyJqN+BQq6k26O98a3f5Nsn7TdB/MWKDyq84cRP6Kb5fA2WWfi/MEV
X-Proofpoint-GUID: IcwXLFR67vc4vDR0ylJRAxCm3rCkD676
X-Authority-Analysis: v=2.4 cv=LtaSymdc c=1 sm=1 tr=0 ts=681cd5f8 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=jWxAPlRM0d8giJs82RAA:9 a=CjuIK1q_8ugA:10

I feel we should probably add mm/oom_kill.c, include/linux/mman.h,
mm/internal.h to mm core as a few more key files. What do you think?

We're probably going to be working through a bunch of stragglers for some
time I feel :)

On Thu, May 08, 2025 at 01:23:25PM +0100, Lorenzo Stoakes wrote:
> On Thu, May 08, 2025 at 10:53:22AM +0200, David Hildenbrand wrote:
> > > > > > (looks at vmscan.c)
> > > > >
> > > > > Current maintainers (mm/unstable) on 20 biggest files in mm, Andrew is
> > > > > implicit:
> > > > >
> > > > >   $ find mm -name "*.c" -type f | xargs wc -l | sort -n -r | head -20
> > > > >   198195 total
> > > > >     7937 mm/hugetlb.c		# Muchun
> > > > >     7881 mm/slub.c		# Christoph/David/Vlastimil
> > > > >     7745 mm/vmscan.c		#
> > >
> > > This is, as Andrew rightly points out, a key one, I will have a look around
> > > the git history and put something together here. I'm not sure if we will
> > > get an M here, but at least can populate some reviewers.
> >
> > Yes. I would assume that at least MGLRU people are reviewing this ... and
> > probably memcg folks :)
>
> Ack indeed, will try to figure out who best to include.
>
> Will either RFC or send off-list message to coordinate.
>
> >
> > [...]
> >
> > >
> > > > >     4703 mm/huge_memory.c	# David
> > > > >     4538 mm/filemap.c		# Willy
> > > > >     3964 mm/swapfile.c		#
> > >
> > > The various discussions at LSF lend themselves to suggesting people here,
> > > can take a look at this also.
> >
> > Yes, we should be able to come up with some R.
> >
> > >
> > > > >     3871 mm/ksm.c		#
> > >
> > > As per discussion below, thanks for suggesting yourself David, I hope this
> > > is a case of 'well de facto I am maintaining this'
> >
> > Yeah, it's exactly that I'm afraid :)
>
> :)) I mean the same in my case also of course. Though far, far fewer
> instances for me...
>
> >
> > > rather than taking
> > > anything new on, as I worry about how much your workload involves :P
> > > > I will sniff around the git history too and put something together.
> > >
> > > > >     3720 mm/gup.c		# David
> > > > >     3675 mm/mempolicy.c		#
> > >
> > > Ack below, and will take a look here also.
> > >
> > > > >     3371 mm/percpu.c		# Dennis/Tejun/Christoph
> > > > >     3370 mm/compaction.c		#
> > >
> > > As you say lots of R's which is good.
> > >
> > > As per below would you want M for this?
> >
> > Probably we'd want a migration section with sth. like
> >
> > * mm/migrate.c
> > * mm/migrate_device.c
> > * include/linux/migrate.h
> >
> > And maybe we also want also the following files in there (a separate section
> > might not make sense)
> >
> > * include/linux/mempolicy.h
> > * mm/mempolicy.c
> >
> >
> > MEMORY POLICY AND MIGRATION ? I think I should have the capacity to be M for
> > that.
>
> Ack makes sense, will sort something out.
>
> >
> >
> > mm/compaction.c is a bit in-between the page allocator and migration right
> > now, but I think long-term stuff should simply me moved to the proper files
> > and compaction.c should be a consumer of migration functionality. And likely
> > compaction.c should stay in the "PAGE ALLOCATOR" section.
>
> Ack!
>
> >
> > M for "PAGE ALLOCATOR", hmmm ..., I was hoping that Vlastimil might have
> > capacity for that? :)
>
> Vlastimil? ;)
>
> I'd certainly support this.
>
> >
> >
> >
> > Not 100% sure what to do with
> >
> > * include/linux/page_isolation.h
> > * mm/page_isolation.c
> >
> > (I hate the word "page isolation")
> >
> > They are mostly about page migration (either for alloc_contig... or memory
> > hotunplug). Likely they should either go to the MIGRATION section or to the
> > PAGE ALLOCATOR? Maybe MIGRATION makes more sense. Thoughts?
>
> I mean it explicitly relates to migrate type and migration so seems to me
> it ought to be in migration.
>
> Though migrate type + the machinary around it is a product of the physical
> page allocator (I even cover it in the 'physical memory' section of the
> book).
>
> I wonder if our soon-to-be page allocator maintainer Vlastimil has
> thoughts? ;)
>
> I'd vote for migration though to be honest.
>
> >
> > --
> > Cheers,
> >
> > David / dhildenb
> >

Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3F626CE1C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750779980; cv=fail; b=fOa/Fwi7IM3nEijC7Lc7K7l3wPPsULXJvzUYx+YNc2E/TStSiSRHS1RGCD3HGSWXKmuDgfag0ZeXyWh9oqnA9D4v2PFEpDuN2Kb2H4XMFh3q05v8DZU/en01U6GbacZwx0JQmWNQ22HGbe+YGRrTtSs7AGIRWaV1enIcuhDy7ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750779980; c=relaxed/simple;
	bh=1SyGcEuZTiuRXg7nxNohA6435yUYZxn5Uq6Rgs1/kd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZDi8xIjDXffh1aYmfJKGzcU85T49OiK6PYxUqtGFnqDS+FsNjSxNooOG0J/xyyJ64iJRqDELWUfWgViKT0U74sqffBwqHKRy+OTXhMu35RpkKeph6KGHbmntwvDqfB+jUboL4yCd52nSTGI3lQlB9/vJVUGWy//RiTh6bNjKwjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=agTe6CaT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Kc99u0sI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="agTe6CaT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Kc99u0sI"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFMkiG007393;
	Tue, 24 Jun 2025 15:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=lTAGLixXmfqsLoH+93
	AtHZchQ5ZviIOOC2uxccaM10s=; b=agTe6CaT6CJlxbwZ9ifky54DXqN6Yv4r3C
	crd6IgTaHBjWeQE2y8WIn4iobaNUvk8jUgvU3dfMTbxSphmFQJfx8N5vggnddc8u
	iZRvUu35pcJS3YMxnRGlywcpe0BBcXtJv+J3vrbFK0a1uM2i2dHe0tWfdFCGPqfC
	gpxRQMweA5Ul7PJVyv1giG/lqoJiwV0+yDQp7kmxsDgtxmhWPv77Ak3NqLbyH+3u
	wNjDQruBlxF7Rfn78DcxhurS4xzd28n5vkSj7uWVfvSuCQFs3gLcifofubQH1gO+
	2tBMvNfnh/w7TrZh3n+RRz4e43jXJrUh7CXaDiEa5QntTLxnGQaQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egummdgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 15:46:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OEVmch002571;
	Tue, 24 Jun 2025 15:46:01 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpda3mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 15:46:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBPh1/rBXHXCLz0CFOheKwS+zWVGd5nBwWsgarBENekFp3Ll5Om89pAOmk64o2R9PZVf3PpcHcHJd2i97+xgsouJq15at4dO3sj25XLnKHlhDt1YNT4zV+TfdEcHM1G7zD0McDdAlrd/mOmTVvkgQPMjbo4YGPWcyx8DP5RCqmnJ3uQ561l7P9r5fjy2nV3FVEjal+sGnXIJWFLv9DQ3/rZW/xdlhg0r5Wzf8xH5wEkz96UFuFNC0zGOzi0BvtCF8vbMF2r8YCKFef+5AHzqrojO4+IAWupAv4uwI9Ltn9VpMctD+KWTliyESsl+PJoYmTxukP/vTS7EuA42aD02Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTAGLixXmfqsLoH+93AtHZchQ5ZviIOOC2uxccaM10s=;
 b=BiHvlucn8IRxh/crdmtShLg4XoznZreNiYd8QkhjH89RSh93BhEgOYes/2rgU21UYkdA0/szEL8iTSVbKoKbH9fCLAj8PxKYTMp5JoctDPpDQJLAtqhX3GfM50/SwV9QLkMikioz14W9U/Ru1RHfDPRjz7KdkPGQGt2dXgqP/y1B+7VQQhxLLGZX8t0QH2Hoks/qsuxH1+a++91Utb9IDuzeUPSLg39FfcKz/sJGFnlgn9zrOngLZTzE5hxd+3LOYiz+hucrJXt/mEFv+99RaWxoqIoPfoT/NFmhr9O7tj6QJlyElw709EkH9DMpQegZBwUPD9W++MaoU1V1bHmIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTAGLixXmfqsLoH+93AtHZchQ5ZviIOOC2uxccaM10s=;
 b=Kc99u0sIgqYwePmKNY0yxlirBAqOlC2VvkuF4Cc1RCbqHA2iJwtK5AA3NENyW7M5n8FRZTOq3hfIV6H/g6YPSzAv8U71SiNYPdAFZinsjqxdqzmHodXQ6zloc48m+Na7D3Wn9s6h2YqW/voNeobMJ3Bpq81jdorIISK1TVb9Zeg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB4860.namprd10.prod.outlook.com (2603:10b6:610:db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 15:45:57 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 15:45:57 +0000
Date: Tue, 24 Jun 2025 16:45:55 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Colin Cross <ccross@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] mm, madvise: use standard madvise locking in
 madvise_set_anon_name()
Message-ID: <667e6631-8e2f-4154-8fcc-55fb5ab49a07@lucifer.local>
References: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
 <20250624-anon_name_cleanup-v2-4-600075462a11@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-anon_name_cleanup-v2-4-600075462a11@suse.cz>
X-ClientProxiedBy: LO4P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB4860:EE_
X-MS-Office365-Filtering-Correlation-Id: f4af56cb-2086-469a-2c2a-08ddb3363649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DAtzreR9kMMEbAtx1hKz4WegI1dGwkj4bCTWpFO9dovM5fjQA+bgg6q7io7p?=
 =?us-ascii?Q?yNkkE2MHUVmS1SqcWlTGTGKUlxIgqHXlrC5GeKOTqwjGJ3XIT798DiwdaVst?=
 =?us-ascii?Q?+FFf5WHKrzLH7actLG0WOWfJwocvR53XlALAdgwOl3fdePYJUEUeC3gvjMj4?=
 =?us-ascii?Q?5cnTLsNwUkfK2sYiclOvkC5Q2zCkRDQF3s7YNJZH1wGZS2JR/a/zrWEfbUYZ?=
 =?us-ascii?Q?tjcLXbS0FxoeiuP124I5e9Hvv2yJtYv/sQKLCr4uyuToLSI8TCkP+V59l140?=
 =?us-ascii?Q?Vf5hfLpHbbn+sDwHfJt/xWqLJV29e0tdczpNXniIrocArRL4yHImJIQ9f9Dn?=
 =?us-ascii?Q?T58Vp7Sk2tupctlp71Z6jAABrjqhkbCL+2hThJOyOqakVxf8rMN3TcCh9qLs?=
 =?us-ascii?Q?sSlw6PcquFK2u6P6uFikeG2K7Wi6+pOIZy8sbQi8p/hnuPbhIMFa8vDQC2FG?=
 =?us-ascii?Q?UMh7SkaHB6YXf4GmLCHDTxqvti/B5FLyJlc+zP9XZmwB7ctlx/jWHlfpju6K?=
 =?us-ascii?Q?2RRlv0EzldPGXmsGDulyxT0fF26UAiTSl35mtth+T+xQ6/pAxFS1/HwMsIzK?=
 =?us-ascii?Q?rOQkQhuQrOozIRWF/ODSq4bn5iE6paUJictTLPv7lcmgblLyIYHSPdpOAw6r?=
 =?us-ascii?Q?HVaQYdbdb2rXFMLWrgJlzqCtRPjm6glk8mSL8pTzMNdz6NPMtCZKxxxi1UVh?=
 =?us-ascii?Q?3sGBZywp5ghkIIzxtkMujoDXyNZVSGCERkE3DjDkPnrOqHR7Wy3qpJP3pbO3?=
 =?us-ascii?Q?8WuWhlssNoHKLjLaCwxj9/7vsuMUrl6zq6XGDwZNYH5GF2msM9HSftRD3Ryx?=
 =?us-ascii?Q?u5VEViUaP6oJiLzBThPJ/t2ut7A47910HZO+2jQR8xcASfN4Eocq0ev/HdZ0?=
 =?us-ascii?Q?CL2mLKWbGdWrN/2HsNrWgD+qm3xtnRftddkKpNQCVgMST+X3k1PNwP2a7kYE?=
 =?us-ascii?Q?wTEBrkStm26XUUhYbe2U3c/wvNVC6CCS4DxaZlikYq17IthJ+VLmQ39AFek7?=
 =?us-ascii?Q?PU8CZo49/ikBU99lsmXRQgz2OCgYMf9luXv44yQEvbuZYiCXoXBbYJ6kdNsn?=
 =?us-ascii?Q?CwkAfqu9gcXFfab5w7DQ/eK/9jYGYUwAK12e+y0Ra7/AzJbq6moQv8bE9YmX?=
 =?us-ascii?Q?jKTSUAsoITa1lxv6TsVGq/HAGes/6fCcxHi47Q0ez7Zz9JkiFdaZncWtZr+2?=
 =?us-ascii?Q?G73NRdgmKW7E1s9+3wUgcicbfuLh+bJq0GxtbxWgt8UcR+X1ndYW+6T2/LbG?=
 =?us-ascii?Q?gabbKUdAbTqSxKhiVWYfQvtY0D8Yoi1qOuyGyicduTwyxB+1/GAJO1E/X/9a?=
 =?us-ascii?Q?TAqkpIxaHOYquZyOb4ZF1sztYt9sXk1szjZsxyP+u/Ot5QDqL9LDo6vgSxQq?=
 =?us-ascii?Q?jYT/HkPEf4cFrrqYXuo6EqBcd8CTfuBdbiZS6f4ENZZmrsRsUdjZviWme2G8?=
 =?us-ascii?Q?bR1ZHVKbEMQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J5w52+lZixIum4mP/zIMgYdYJaX6pb8Z91kmlDNhquW5M0vKXVj7+qY/bEeC?=
 =?us-ascii?Q?QGB3vfXHdJ8Bi2z7gvnmaUpf4jIXXOnv/cCOHpBysnSPEeLT/Gvt4Io8smv3?=
 =?us-ascii?Q?maNUyN5+b8fflmXKCBBHkxl3eXJhEf7fJLtM8rORhoW+mVXFhiOUlVigJhyi?=
 =?us-ascii?Q?EQZFMYbqHPHdfK3THaxZxULvvaMrWQIFfF7352Ac4kbm+MaVY9aQOQbTQIMh?=
 =?us-ascii?Q?HC5asY9lhLoWnWuO6YL6Jg6Irq2Nj/F3xxZW6s5VFKpXfZbPgDJp4ajtlO0h?=
 =?us-ascii?Q?VE8KOXdDxUSly0lGHta3wC7INowiZFVsKdBJOQuWvls2thpximK85IxiAI5F?=
 =?us-ascii?Q?ontxX9ihYCHoVAMBDsKW/33LjxtNBELFLqtFL5OfJO/tOz8iokzQR0iAl0nD?=
 =?us-ascii?Q?z9tTE1hBnDMc7ATyw7jOc1TT0OjSJo270N4uCtt7pIF5JFM37F2t6fow4+Vs?=
 =?us-ascii?Q?JbG/B0mWJvOtiAUjdjnYnylSQ3s4Bf2KU0GhuoJxBXQUJekuEstB2Qkv33FF?=
 =?us-ascii?Q?dm1BDEZqtvC8QLCxSD/W2Jvuc1/jFKI3o7g6bMs35CHEfuVh+vWMZCT1HUIu?=
 =?us-ascii?Q?BsiQCeUyM1VMYYtddSDSXovTunfdnQj2WW/9ysp7ZmTjZwE5ZpYRd3/eOVdK?=
 =?us-ascii?Q?GF5mBwfrj6iPdA7TyOLEDsKYzqjCxHpwozfS3C5vnF8wKaT4jn1hQeL5J8lh?=
 =?us-ascii?Q?iRcTxPPCwCYeDoG/ni+Nez0+bzhm8ji85gS1E5s4CR/7f264ZByUGs+mvEdv?=
 =?us-ascii?Q?xZC+0uDgMH8vSJqqv4vFb+70JSxybgVsObuM4tgudsy/qd3/lFqceVk/gA4q?=
 =?us-ascii?Q?qooAh04V0AaF6aeMHsmZt9bckCYPu7TC6JGzeIGkVtJlNNn3NsnmokL171bp?=
 =?us-ascii?Q?3HsyzsT9LZdAkf7RYwv/fVryLUiMztZDJrMaHgxvWMpO7/hp/Dfd7sksxzMI?=
 =?us-ascii?Q?ReSq39dUQoPXcS303zE/kcszwCjXz2Zo7QeyfUqXT5t4BC97DybJls2qufw/?=
 =?us-ascii?Q?McZVagipcnMApeNd7BPpAx6NAiDGlWGnKc3ogDRyXJSw0VfUSBlrmkdXZCpr?=
 =?us-ascii?Q?cb4nbS7QtjBaW75EA6dJUpQlwZA+jMTzkQfmhKm2EZDzxCiYsEwoZanGmWAX?=
 =?us-ascii?Q?LkxTKHH2dVyC5ELLE0I86kFh90Zvf1z1qEQmJx7uuBgJeexZXcUsuvKYj4LS?=
 =?us-ascii?Q?gGsM5DJ97IZcTj3SPGOP8hNiDpMgCiZN5y0Zm8PDj+d05t07SsheW7lfjLXz?=
 =?us-ascii?Q?hMcNZbt+ch70EC6dWTFg7NsWrzwEGWxJmsEFmtlJSbd4SgxtP0OummXjzzl3?=
 =?us-ascii?Q?KcCa9gJLXhGUT0LN41V+NZkHqRjHnPtc5nM/WgbmQFDpalCgGjT6FNuXR+Cc?=
 =?us-ascii?Q?EpqLYSt2bp6CsqKUAxiRSO6JvpDnHLd+9+8NUvEQvI9tenedVq9berPny+cR?=
 =?us-ascii?Q?dYQanKsNqYwb0IUQgiszgvMQVMzP71f6Zhpp7pUnaCdLKmRQV6XFQ+uGFePb?=
 =?us-ascii?Q?c/Wx/3nIdlVHbzFPU0IQQTdOzCEgs1xwNZ9LobP8FzO7z3Ryj4AdWWTTUH3y?=
 =?us-ascii?Q?eFZm6A8tBoCrMflkmUK1gx9nyYmeqn0C3DA/rWVCX4igstlBrPzUOjAcKNXM?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0GaNVJVpvc0M2ftD81wZ/uShvCEqgyO077qneO9RmU3lWGyo2VHdrjhDAsyEM79IbOmJAsCbtvtdksihDVLBauMyBSLLf2PQFc0VSv+Kg/nrBKiYYCvrJszqNnYo2LTieG9OrsuW49+SX+G0ZB1yL/qXB4iwb1DNcaxPzCkJgMksWUYu19vv2N+VDhE8KEh80dSISOIUsAHMcJQW/Qxyl9K5yN8mXNGZcLsLxZ85Rqu6xJzrJHmRvnrBcpXb8NJswi8DAlxAAL09LSH1XG6Fzp+STnKQ7vlFYQlvE1Di6Dftg3Oi4tnv8khOHp9i7DVJTGSrCfjMmn9ioA7AyOLxNP94GpE/Dr2As950tK/3oCKiDQOuua8sK7cGMfQeS93ljEBkPea1orjD5fVFGlHF5yLG/LCNPdAWR9cqw5OmN4HIsQuSpyfaIrtFhWe76Q/vBifatTsV+CYak6FllJUs2GZJyyvLwnR89bAzcsHXiCGMvrGzw0LV4QWsKox5SaeLJL4SqokK/46mcJnRGPZnRk/FBjch2KdotxO18VjiCvoW+vQKcQ0qA+q+RHE2RTuJOrekwC08EAoQfezkJifqKWiEuXcJwWYGepGKXr60ZPw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4af56cb-2086-469a-2c2a-08ddb3363649
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 15:45:57.7753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYw3s3FkCHhFCe3sPaN2GgUQjQSBLnonD7NrJ0bS8qR5P05XXcepuhdqyeqd91ZKOfiVeqk9d46N9k4Crj86XE0QMsNwqAQ3cZQf911tJjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4860
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506240132
X-Proofpoint-ORIG-GUID: 8VLbBst0y_zATkSGh3Kl36djCNjP62J0
X-Proofpoint-GUID: 8VLbBst0y_zATkSGh3Kl36djCNjP62J0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEzMiBTYWx0ZWRfXyzpLtCFawRK8 4viKx6w3MV+b+Nv97ZGbNO28xFxD2yYHSdJCl+deGPkxXJUy+gjXIbxQ/Xp+BFmOaAeX3QTeNvF Y3gH7sSFQZHRzS/t/0eC2TXZ1DFcyPrYG7yzXDb4OJYrCnd2R3Sj4kTWyYkDpcITzVZTze5PVF6
 ODa3jnWMjFuEC6mGVYpcnQdStu0Dc9/AP8BcQGoXO/K/1icgDnzPWQOxKCnjyToAzrw2BsUhqwv bKkh/rSV7RZMzlcF6sfgtORYgX4RDs8zyQ0LpLbHkmAyhagGL/3bj0MGk6zy7DU7FLaZw8kDDrM j45mCuu2KUDfKh4I4efM/7zyZ1d+NM86I1jaMLcoA6UiN4Si0aeAhwyMnYlt39VHyDHitopdEJ7
 zOnO1kqY3F/DfgSCoPAjdVHaOW1Y7vazI1NDkk2WPHYQVyGrx0xOoLWWwFRkGmIgaodxv5E8
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=685ac83a b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Z5dEeDZ-bys1F5YNRK4A:9 a=CjuIK1q_8ugA:10

On Tue, Jun 24, 2025 at 03:03:48PM +0200, Vlastimil Babka wrote:
> Use madvise_lock()/madvise_unlock() in madvise_set_anon_name() in the
> same way as in do_madvise(). This narrows the lock scope a bit and
> reuses existing functionality. get_lock_mode() already picks the correct
> MADVISE_MMAP_WRITE_LOCK mode for __MADV_SET_ANON_VMA_NAME so we can just
> remove the explicit assignment.
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

This is a nice idea, hadn't thought of it :) aren't we making anon vma name
behave now :P

I mean this is a _minor_ difference in functionality in that we will now
use mmap_write_lock_killable() and could fail to lock on fatal signal
whereas before we unconditionally lock but I think that's fine, and
possibly even... desirable actually?

At any rate this is all nice, thanks again!

> ---
>  mm/madvise.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index cae064479cdf908707c45b941bd03d43d095eab6..ee02ccd0315a146cdb3001cd189e03be9e48a2ea 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -2082,10 +2082,10 @@ static int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
>  {
>  	unsigned long end;
>  	unsigned long len;
> +	int error;
>  	struct madvise_behavior madv_behavior = {
>  		.mm = mm,
>  		.behavior = __MADV_SET_ANON_VMA_NAME,
> -		.lock_mode = MADVISE_MMAP_WRITE_LOCK,
>  		.anon_name = anon_name,
>  	};
>
> @@ -2106,7 +2106,14 @@ static int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
>
>  	madv_behavior.range.start = start;
>  	madv_behavior.range.end = end;
> -	return madvise_walk_vmas(&madv_behavior);
> +
> +	error = madvise_lock(&madv_behavior);
> +	if (error)
> +		return error;
> +	error = madvise_walk_vmas(&madv_behavior);
> +	madvise_unlock(&madv_behavior);
> +
> +	return error;
>  }
>
>  int set_anon_vma_name(unsigned long addr, unsigned long size,
> @@ -2136,9 +2143,7 @@ int set_anon_vma_name(unsigned long addr, unsigned long size,
>  			return -ENOMEM;
>  	}
>
> -	mmap_write_lock(mm);
>  	error = madvise_set_anon_name(mm, addr, size, anon_name);
> -	mmap_write_unlock(mm);
>  	anon_vma_name_put(anon_name);
>
>  	return error;
>
> --
> 2.50.0
>

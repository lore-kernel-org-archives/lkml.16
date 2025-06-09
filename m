Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3547B43ABC
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464592; cv=fail; b=CP3FqyWCweBp2BN7hEVV5aFOVsxpgInmeq9M/nhjAZbUk1MmRF/M7yWVBWp3sH+Btodtu9xIaT/RDHGj4+s63dYwOlyhXMOhKXMcae3iIpJrmzqrl+fKwiLr3zto6lYK8n9Mc9wmbv5yR/F18gWn0vqBLubx5qLTAhMfOVoavGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464592; c=relaxed/simple;
	bh=FAV3RAVeKFGSx76fH9i4P8Ju2zhiynM8kv1a1fQpjkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fvicXkTMKs/Lyrui7MhOCIw+o1MEshZMiayNItnfTuWr4lzNq9ZzdGo7ilyKdQ1/CnQuodpp3vLBLGANAVQrIBL1To8Qwa0iYqbImNrwbxPKQociV+j3ka+yV1RK8a6eOvAucwQ60rMK/DTDFDX0wuIz/zUewTc8g3ZiutZBWog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HsvMGVWK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=b+nRJ2dl; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HsvMGVWK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="b+nRJ2dl"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593ibI4011582;
	Mon, 9 Jun 2025 10:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=1//AjvR8t1mCAn1FQ7
	7HGaqe2ygK6G/9de4eC1u/E/w=; b=HsvMGVWKEruPqzZqFStFiWIti85aWERs0k
	rHKkPnVQ+1eKpNIgzm2ouw9sFrPyWy9rF8BOWF92c680Vut2ZUKNWuxkw/FDffLP
	HUO+xcRrYgETNbKy3g2l2Aq0v5pwwjXFeqiXhKEzV1DppE8lXIVF5gc7sWZ7VPRd
	kuA9mKizJdBG+Xp/fogCcWPW4rpqIJJsFSBDt2nB3ItwFTUqpYqNz0cy3yyvdFBL
	sSsoUpcsaK8yueHEvJV23h+V2Yyzq0pBsrQoXKt8t4Ae0PO6Va64V5iJizRpVZqg
	BmbD7S2rDIW7Rmz6o6hEjXbXcT90iJ+2zshrBB8JJJRQy7NDMbtw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474buf1w00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 10:22:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55992dS1007575;
	Mon, 9 Jun 2025 10:22:53 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv71n3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 10:22:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXwgMIdYe63FVU59Ps288kS3d+SuGRBV/tkMedTks4+nQETVMvH/oojDK4BeP/QPCjdwejRGInW8LWxcCnpb4yd1gSDJxun66DlDZX0cw8TG4QmfTqAvI72wwaHYbgMKACTFbF+wO6HolDlOpC74+tVtLitFClsXBDNbmVfUHFQapnII6tcvUUT0/uDa6BLERbR/pP0qxs6ZkWqtNdrOD9lUUsRbBs52YwgIxvYsNeyjjsY/0UmONcjY0KZbOe1rJu6yUmAXyd8WDgo/UkuyXMfqJWECrT1tGmYj9laL6RsjbdaRRWa3cWO7fqNkmOdPWlv2s4158Vb0ds7j4SG9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1//AjvR8t1mCAn1FQ77HGaqe2ygK6G/9de4eC1u/E/w=;
 b=DgAekpP9PM7JFnsrWtJyXgHW4O/uBLhJSaON3wR1Z+wApDox0zyPXu9xPLRQo1j7+kRqQ5KU+whrmpmlBp/BqmPR1You79xMVxmScuZ4lH4HzosxCFUktErkc4U+TWPrGNB5dMjV4IrbTTj/ns2yHEwlHiv/BwjfVxwgRQrRUgieibcTYZnK2qmTY2mf1DMkOijRBQcA1sfXvLEKcT/WSb2hvCe/t19fHnsHrZ17YoPnTAqzEgfh6Jq3X80DN6i1VOFPGwqKzIYk5wO6EeR3R1BIi3MOmlKBOZDoy/VqzWAU0lbLYzIUqZO4wfW6FV8GxOA+tK1UcoD27pP40Pm0YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1//AjvR8t1mCAn1FQ77HGaqe2ygK6G/9de4eC1u/E/w=;
 b=b+nRJ2dlsygV/nhl+tHqHBywVH5KOQlXr8bec9E3AabdY+3ONeJh9YNr9pJTa9YSvGagIL34Pv7lQNV67I6oeRX2kWGrnSARgGf3+2mY+aB6x3CcTjzMUcuzG1rnBaR5EJiG0fd/0p097f6FLtzZ2r1M6GSGI5ML0jOf1Zf3cFM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PPF00080FB4B.namprd10.prod.outlook.com (2603:10b6:f:fc00::c04) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 10:22:50 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 10:22:50 +0000
Date: Mon, 9 Jun 2025 11:22:48 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Barry Song <21cnbao@gmail.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        Barry Song <v-songbaohua@oppo.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>, Dev Jain <dev.jain@arm.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH v2] mm: madvise: use walk_page_range_vma() instead of
 walk_page_range()
Message-ID: <e61b8931-521f-44b4-a78d-4988ad7c70b5@lucifer.local>
References: <20250605083144.43046-1-21cnbao@gmail.com>
 <671f8164-a90b-48d7-9446-359eb9493500@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <671f8164-a90b-48d7-9446-359eb9493500@arm.com>
X-ClientProxiedBy: LO4P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PPF00080FB4B:EE_
X-MS-Office365-Filtering-Correlation-Id: f9de34ef-7566-405c-a796-08dda73f9681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ITKWyjt8R2IeVox+SCwUkfTSV7brpu/kI3TEylHyFSBzRdgoLK65INbrbvH2?=
 =?us-ascii?Q?2AJyZkOAmBilgO7OkbLi3BwgK6IoveqRh5Bh0yLlOn6Y3iYfxXX6h6QE6iJR?=
 =?us-ascii?Q?5/JfMM2LU9d1Wrr/IrSjQJ2nRbdyceWJWSXcIVwIvX76xkGh5nB8zIVgYfIT?=
 =?us-ascii?Q?8ue7NoeAAjuztYbyKfaNZ+aGVORPsBFfMjmT5k0pCIz0z/HXpH3JBQVweVFc?=
 =?us-ascii?Q?6nAxa2jfzAo5KdRSAbnGd8wPYUCBqYUT80dQL0zWxprLdZut890p8sOF1+w/?=
 =?us-ascii?Q?YJkQfYwIKWmKz2Ro1Vq5WUTyfUjDw0Fyx6WJdSMUnc3qRWM5o4SxFPtVaJdf?=
 =?us-ascii?Q?9thw7ZpnbGyFtiDSjZnsvaCHHuf7AAl9ojEAonHq5uEuPLUZ3UL6oSkvyRXE?=
 =?us-ascii?Q?rg0l6fuHKVd+RM+LCRZv58cnT34Pt+S3d4d0ohG5T7m1ac1lBPbqyL+Mnb6x?=
 =?us-ascii?Q?sJXt23ideDikK6gbW84fTpvgdKhgQRUFe3/xw5ndpqcVFE3/C1nmLT6GLzvZ?=
 =?us-ascii?Q?ZJC0ppw14jZ6ick07JPHgIQ5qSAWrX+8JiLtmGBKClTuUAmyVnQew/aTZsT9?=
 =?us-ascii?Q?ftrumyOkeec3Z6yrJEgNMb+4Mjr2zJ2MSLsKckW1SxhY+o+cMpctLdvDdTZp?=
 =?us-ascii?Q?qHdQ1x9dpvAu2LLXhoehLecv7iw7jhDfKz2y+zPxPSm3mN1XISOzCzkrUvXB?=
 =?us-ascii?Q?AijMl9+Z8ORqFkXP2ionFvod5GrmP+DUz6uwB9uJgLY0tRqzERVXirZcyHLZ?=
 =?us-ascii?Q?InjQMAfhlHArwl6vn+llIi9ycq2tdcOL/N7tP4y7W0vA8bCvn3fCviQgZ43o?=
 =?us-ascii?Q?4Fmz3SFGTFaP9teAlh8vlHE/KBKP755LhhDUJ9NbuKrLrX6N0hNOqh5GmsHa?=
 =?us-ascii?Q?uZnQjY6jfYBFOCXG7zXhiI6vKFezsWLunTsObksaNvyzNFQydbALyYkIBdi2?=
 =?us-ascii?Q?UKliROoe2yYmUHzNbJkznNU/rfaUR7RWDZgt5feywOCMz2YTdr8NqrNOc98A?=
 =?us-ascii?Q?QqgsOmiUua7TpmKGW1Cftf1NHryQoRImEQ9A+gDV74pPW+oEPMJxl8D2lRQu?=
 =?us-ascii?Q?Zd+FKeKGa6nhXv1N7b/nl/vnmkElSXDow2XS9Hlet8CZvWdnum8F1SbgUJqz?=
 =?us-ascii?Q?+dn5HQscebKUni3GAUaeH9XjI55/uhjE0N82xn4N61lJ81kDL8j0m+/dxY1O?=
 =?us-ascii?Q?1TJkK5GpyG6/AgaQB9UXPRR6Elaw+siTFOQlb2URKc/1fy+s39XIP72uBlMk?=
 =?us-ascii?Q?HfrQiKQke/B+5pHja2NjSm2BBrjONABN9L1vF3sgiM9/mbGx7m6djcU3QPkX?=
 =?us-ascii?Q?2+Tml88R8Jm8uzkTTfMhWRqqqZhcSzxckBXTOhk6i+YXel3a6wMXoCYVO7eV?=
 =?us-ascii?Q?15hx5h+jL8UjjDacTQ8K1bGELTFqtx/mNBZayKPqdY0UR3gzZoh1L7+/TIxW?=
 =?us-ascii?Q?IgJEAOaPLSk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JtzgOkb6JZA+YZXZvpUirwOf+huRrYxdsP12f46u8SBXvXXjrbfJPQmnBggQ?=
 =?us-ascii?Q?CdGE0AiZ1w5G69GvjV63Q3pvN7u0nibyl24wgoAwYAzqTGk4rg7Hj438bTdv?=
 =?us-ascii?Q?bgXSv+y6NfH0ZD6W987p2pxT3uepRjhKdQMnOH3kkSutqEzVtF3HQ5uDsTRa?=
 =?us-ascii?Q?UlQRw/B3AL68TuycGl0X9cdCfC6iaCSFJHWLeXDTyYQD/7eBA9ijE8C9qOkl?=
 =?us-ascii?Q?w69vdH+NnMpoZ+h2A4rntB7PESVTNJfvRIoUXp10FWq/zrRH4C5WlSn4CfwO?=
 =?us-ascii?Q?Gtho4Qq+XHhB/VCB2poyGnp5H5hoQhiSFvZL31fMbjGWF3vgRdmDA4bGHFNz?=
 =?us-ascii?Q?TqTKouEPB4gROoGAGzkCO4QVXVXWr/zBPa6y/3M9bmHIwKZ5N+Dq1B/oCqzu?=
 =?us-ascii?Q?3VigeXBRMSFEbMPFF8/+rhQqVmRLItUwT4euZzykJA1KIvBcVNw70ggfON4J?=
 =?us-ascii?Q?OW5T4alQNfBOCeBW0KB+pX0+8AXS/aBXKnz57NBtzHLE9OLPTOGqCSp6wrJZ?=
 =?us-ascii?Q?t8itTyOaj8Xn6bpr5FK2SlBUMg162swOMOOAUEPZ6vfm5LrQexwE1A+ShOUs?=
 =?us-ascii?Q?12YDZwJkEiVfioOQWn6fQMZQpNu/19VbDoFQV/SzeNpMT9m+O1aWZIrlh3+y?=
 =?us-ascii?Q?+Mipvann344H53kR+wKnxmGfFFRKV3fLh2LrGPCEzrUkp06Nsye+Ho0Pc7Jz?=
 =?us-ascii?Q?lqROhn/okc7qCrjAKl4q/OGzcmJnVQpUaq413vVFdCtmj8hqBP74ZN9OXa5J?=
 =?us-ascii?Q?CeNyraWOnAzmJDwDKvMPgfrzan8Qseu01y1wwzL5YStCEqM+iyS+hDWfZlOd?=
 =?us-ascii?Q?y4e27fXHlqfYGL/DklqOZi+wJLvvaugE0meGcsTkwWKkQqy8FWeX24Bmqpud?=
 =?us-ascii?Q?n4KhEU4gt19/iY/geJVMFlnswE9Ge0GgrBfUkS+qjG5BFPRHqYcqV7BhigTp?=
 =?us-ascii?Q?9cKGQnC0FcrAVy/A1pdC3lWtjxCcC4G4qzoZcyPHatNKfAvRxDW6lFJF67o4?=
 =?us-ascii?Q?LBu6JLAlVChksIrMI27IQ2/G48eke6LMi+DFa25YJPuxs+SYSjc5M6kFuLok?=
 =?us-ascii?Q?WjZiDKsMaUpYb+VZfS5ovGvv0ImCY9u170BsW9Jqiz8xQ08oI+aJEudGeZ4V?=
 =?us-ascii?Q?jqqMn2zvqOHDYW6QeBnEzdjxmrgdFy1r+NU1MmcQv43AKeCn/NFKwSnRWKsz?=
 =?us-ascii?Q?UH3i5CkTcqRP2t27So4S4vUde8dkOq7XjY2LXkJGOqsp3h5SnpVVsAZI1b8q?=
 =?us-ascii?Q?WmLNvGvA2+a1DKgBnfnfMU4U+KBWQjwZQqw1cg3eeKefHCJmb1nX3gFPZVml?=
 =?us-ascii?Q?BsDmsNf5wDV56JCgp1A4OwQWBuKAIqjLZonsuIcxXASZn0ss1WJWE2EwUFSc?=
 =?us-ascii?Q?Hrbvs7cYlqixbAUK6oHpA9FQjkVevIziCXwDcQoaM2cT1b2S/INE1ZMDn/T7?=
 =?us-ascii?Q?+Oj7lC9RD2noeus/7XeNY32Pke+BG7ejzSS3DwC/daWrpXbO2bdI7GcqJvqU?=
 =?us-ascii?Q?5Fd/chkQB4ljI3nPC1OXanGR81t9k7RZ6wlZnQqJFqYlZUW+zgxA2hKhTZQ5?=
 =?us-ascii?Q?UnTfnWbNgL4T3RB9leCdfA7lp53q+2/T4spauRpeY0KJ8vSI6DUlNCSSq95F?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TtnKnnTp5SF1+Sgd8cuOK3Oz5GFEBLC9cGvALuqkGlkfufOjnwOoEqtub2AcKYEonvoat6yuV/eiWoveogHZkB/g1clzBEdxwOxqdFxjHvROh+bT07KjChy/53v2LLx3j4uV4EglbqWqlhelYqwW+j4G0+FCXxxLuuPMKr3tjCrwfFwhOdMl9sSdrHW8M3OPti0uCdNyRypKy++1sLmkFhZ1a9+HMGK6QOqQvC3cMu7ScOjY2lMCGIeoXM7x6qNbB3IRmE7XoPl7ZsTNTZWeaDVAX8JXVfjnhLuhwYcPukoG/RigfoAE7Wbwwj+38TDpSRcoWx/ldzY4FS7qlOZIZ2juIE6i1N7tLzhQ1nyO+g3B1t4TALOAnmrveLU4VsrosP+mC7jK3dZkBI07buHjMDParyMpP4Dii+fabZgKxh6B6s1daOaYVrgik+D1tMHt9RreVL2tdelRLkTmQUVJxlmQ2uQLJnZM75Iucle2MZc4r91b6Fiypz+sl6jUCcHzs6RSI3BDbATPX3AgyExSM4hmQ7Vz/tcxXR+BzagQqYBkkrOz8Xx4JIlZ+W6SJ74Pda0Umv+JdQMRamNf+6ulHT8+1sz+YVIPBp8TFjEsae0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9de34ef-7566-405c-a796-08dda73f9681
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 10:22:50.7430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23d0vH46gc2w7zd0BQdhRe9WPyWfubBAstwtWl8AOt7tuQSfxVhU6G2JdcM52fl3Jap2SYnHyHK7lOjEt+xtHyEN25qBTFk/tcFg7a7x+fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF00080FB4B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=861 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506090078
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=6846b5fe cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=A2pY-5KRAAAA:8 a=iQpcHypMQ1S-bh0OOs0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 4tf-CHz4cV4r7DtuLq0thHrF6yCE-bMQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA3OSBTYWx0ZWRfX+5/U3Fx6vxz0 MdDm+gghqZ4qNS6T5zGsG1+VVx4wcQURB52t4wiZsSGwCJdgoblmZvhk7iFzOLdCTpRZon8017c pmYKe3sAw1Mx4ITzmsjWNHDPjYiPDMA5i/kOBIb4fcGWG1iMD1sYQPug3LPQo3Od6ccRS5d8HsS
 AQZMjUVV52k6TE7x/0ntqhGLAylIIC3H64OWX8rLbNwYZAi8k2lrMA5vNKx7rw2LIvfvNTx2996 BEL8tlooab6dxO1XZrxT0sZTEMLAYjr6kMKbJLdh269oEqG7jDQ4b6S1BopX/+vq6m8jCc9No6g WfsynHCXgPpoN6NY03y38Q91nPBXJXFzQsD5bh9Jdcy7v9pKvqkGp/gblouPTkm1GWNxTrI2ULt
 OcnvoCkO2Np3inBQbceDt4fb21Bqmm4VNaA3+7BjCvXuYLtk0tHAMqyxeTLfcnZP6gAUOLyO
X-Proofpoint-ORIG-GUID: 4tf-CHz4cV4r7DtuLq0thHrF6yCE-bMQ

Andrew - could you drop this patch until this is fixed? Whoops!

On Mon, Jun 09, 2025 at 10:52:47AM +0100, Ryan Roberts wrote:
> On 05/06/2025 09:31, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > We've already found the VMA within madvise_walk_vmas() before calling
> > specific madvise behavior functions like madvise_free_single_vma().
> > So calling walk_page_range() and doing find_vma() again seems
> > unnecessary. It also prevents potential optimizations in those madvise
> > callbacks, particularly the use of dedicated per-VMA locking.
>
> FYI it looks like this patch breaks all the guard-region mm selftests with:
>
> # guard-regions.c:719:split_merge:Expected madvise(ptr, 10 * page_size,
> MADV_GUARD_INSTALL) (-1) == 0 (0)
>
> Am I the only one that runs these things? :)

I normally do :) the one time I don't... :P

>
> [...]
>
> >  mm/madvise.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
>
> [...]
>
> > @@ -1160,7 +1160,7 @@ static long madvise_guard_install(struct vm_area_struct *vma,
> >  		unsigned long nr_pages = 0;
> >
> >  		/* Returns < 0 on error, == 0 if success, > 0 if zap needed. */
> > -		err = walk_page_range_mm(vma->vm_mm, start, end,
> > +		err = walk_page_range_vma(vma, start, end,
> >  					 &guard_install_walk_ops, &nr_pages);
>
> IIRC walk_page_range_mm() is an internal API that allows the install_pte()
> callback, and the other (public) APIs explicitly disallow it, so presumably
> walk_page_range_vma() is now returning an error due to install_pte != NULL?
>

Yeah dear god I missed this oops!

Yeah Barry - could you revert this change for the guard region bits please? So
this is intentional as we do not want anything non-mm to have access to
install_pte.

I'll maybe have a think about this in terms of whether we want to do this a
different way but for now this will fix the issue and get the patch in.

Otherwise patch is ok AFAICT...

With that fixed feel free to propagate tag to a v2.

> Thanks,
> Ryan
>
> >  		if (err < 0)
> >  			return err;
> > @@ -1244,7 +1244,7 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
> >  	if (!is_valid_guard_vma(vma, /* allow_locked = */true))
> >  		return -EINVAL;
> >
> > -	return walk_page_range(vma->vm_mm, start, end,
> > +	return walk_page_range_vma(vma, start, end,
> >  			       &guard_remove_walk_ops, NULL);
> >  }
> >
>

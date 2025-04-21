Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E1014AD20
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 15:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745248127; cv=fail; b=Y2g+o9MAKXZ0upycjIl9DZJOjIShkFeUlAJtu1hyWwVAkfPGKrXR4ftmZdpm2j1AVnJ8FvKgHJBh2MqVOSy+KNxAKOulmhkWSuC4DqO0h20DORfF3ciqs/xaFnPX9ciwJWtfsBHVTPY66gcn2Nirx+5/VQi8y2Kz2w+B1D6JizQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745248127; c=relaxed/simple;
	bh=a3fJEorDP/ToBhZzN7lwyzJX3a0J1uDWWKDFfdXf4uQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ey3EB2fVlr9DbkDHSWcelMRhmbOZbsdiU0OQXnSIDXETRYBQsvlgXjauX3eIKYFMuOc53g54QNwsEABFlVTOsZTUPtLcdtU2vmdoywIQCaDXz9gmbfZHx9eOLTY5MWULGq7KeWOAEiFz8OSMVgNa5v8b5h5rJHCcXKLWfYoYVMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kykewOaW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xdsckcHq; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kykewOaW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xdsckcHq"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LCBXQ2011863;
	Mon, 21 Apr 2025 15:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=T5jkPK6pz8ZgBY89P3Mi8319g5pxp1bO6RA7aARr1Eg=; b=
	kykewOaWCtoHBIXUE4UOswoWXAKk7xZSoiqZnpC2R+ZpyOeV4LXmmb8a98Uhm2+7
	hSr7XAuCPY00XmWtfts34SA04eYiqoMGKsYGmBMHxuss5NiFocaQ6Up+9dupu0bU
	zHc5FnP1XjmGsLxllOUOakHo66DOeeK8KDDdy1P4bGSx0SeGeAyMepnyMAOJc3I4
	dR92jQs1HqvXxG5g27nsadyDHzoO8kJerVeODnPTgehmFaKXuG8iE3y9ryogQMsm
	GZXa3r/rsDl3QLkOPhFUQCMV4iCaByQVWmtXkZ3aft/ztv4+rstvf0zEDPktvrmM
	CZM8zX1vcB38BrdS0TXFXg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46428c2p01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 15:08:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53LEeWlf002887;
	Mon, 21 Apr 2025 15:08:17 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazlp17013079.outbound.protection.outlook.com [40.93.1.79])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46429851bk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 15:08:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=muboxSI/1rUsE3Z0nFYHxwMM7wDD65Ahro3988O3oj0ARXjzmyfQrgCTLybRttEFGylqgYA7klTo00bK6OaHOeh0z6SgfXWWW+YpZDlEzEPWl3UqGTdtMGrR5BWyiyuVVK06mZN+P/RfRrQVsn3PpzIr7plnK7M/7Lu6X+7pVPpVUJRLtAvcOywqf21HNnrUUXf9UDTeQKW8m9I9qr0mNortsPBe06LJanA8XNuBUn6wesVwvVAlQQbWrDPuSr9jvWVnTJU6zUI2SDZ49rh8SpdbwcaPhra7ZoDMR/YMYICezGrbr3h6mFM8AltofksKpthrBA8tncsZ2mtcTlMjeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5jkPK6pz8ZgBY89P3Mi8319g5pxp1bO6RA7aARr1Eg=;
 b=BUWuqx0KfJnt9yYzgaA7zm82rOz/LGObzEWHCm6z6WF55fMyUgrb5eWnpJPOG4fOw6vlXAFYIkVMKVOvzt+YJdVqgTEmOIFV3yTe4dTXcWoHvz+bDk7PkkyDhtiCoynpehdXY5nQb0I2uFhA90O6nYZcZ/ir8w7GvDe0GEGmhXeI+9Z6xXPR7Rgbh0Ntk0ucIsVp345A/HtbWCP9trtUVI7ZimHL7p1PE/4je9DU29tgEOLjSSLuG2lWs7GlNaxOanBo6HjWm0EzqpdnB/TmfnMiZSZt4xSUcxsVKzw0cwg2AqzyNTaUR2xySPP9yjx1q06b97L2bvPmFbQ6p+mPAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5jkPK6pz8ZgBY89P3Mi8319g5pxp1bO6RA7aARr1Eg=;
 b=xdsckcHqmYBO/3vk9DGs6EG9RuSgkdZVpbrjlt3WmhQShdfKFej0F/pyH4YAQbd7Q8Ijeb0Zdgcd1qeqbs2Ahfy8gsnV/UgTUkY3XSiBudP1hEaEqUwVFAfAQ/vxjEHAg0x4RNZzq2WpAIJvWICBSnKdPf6VGm8by9leoeoYl/4=
Received: from CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8)
 by MN2PR10MB4190.namprd10.prod.outlook.com (2603:10b6:208:19a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Mon, 21 Apr
 2025 15:08:14 +0000
Received: from CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2]) by CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2%5]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 15:08:14 +0000
Message-ID: <17189a00-25c4-4b96-a468-84998ef17a77@oracle.com>
Date: Mon, 21 Apr 2025 11:08:11 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] mm/hugetlb: Convert use of struct page to folio in
 __unmap_hugepage_range()
To: nifan.cxl@gmail.com, muchun.song@linux.dev, willy@infradead.org
Cc: mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
        akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Fan Ni <fan.ni@samsung.com>
References: <20250418170834.248318-2-nifan.cxl@gmail.com>
 <20250418170834.248318-5-nifan.cxl@gmail.com>
Content-Language: en-US
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
In-Reply-To: <20250418170834.248318-5-nifan.cxl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0567.namprd03.prod.outlook.com
 (2603:10b6:408:138::32) To CH0PR10MB5113.namprd10.prod.outlook.com
 (2603:10b6:610:c9::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5113:EE_|MN2PR10MB4190:EE_
X-MS-Office365-Filtering-Correlation-Id: d24ae236-582b-4862-7a77-08dd80e6568f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dU9rR0t1NE9ZdStmYkl4N3FhNmFnKy9CNGpMN1NZL2w3ei9KZmtQd0c0Ny9k?=
 =?utf-8?B?bVczVndxcTBITXZTZ25LRUxZcWNyWXNtZnpCQ05nc2dQamNnZ2ZYeGwyZG5j?=
 =?utf-8?B?Um5uekI4YkZVcXVWT05FNlpIcmhkRlMzc2o5NWlvbEdsSFYzOWcyU1BXQVhz?=
 =?utf-8?B?K09mVDVpSEhZSUF5WGIwK3M3TGt5aDNTS1Frdkl2d2k5bU8wLzNsVlNmVnZH?=
 =?utf-8?B?UkFjbGZDeFB6eE4za0F5bnMwb2dVN2p4VXFhRldLWEtkb21pelNtZm4xMHp3?=
 =?utf-8?B?cWNrZWhEbmxmS0Z3SXFNamNjZHBHYlBQWnhpNDhTL001eFZZOGtZeXJXLy9r?=
 =?utf-8?B?aEgyVWxiVzZoZ20wRTdYb3RZcVI2OUtocTJpZWZCdjFwQzBya01vOGlQdmJX?=
 =?utf-8?B?NWtqTEpnNWE4aHZqVFdSNFlYU0haZ0liT1hTWUVJc3hBYm1KRFRzaC9YcXE4?=
 =?utf-8?B?VnFpeFQxSjhkczBMZUdQRXQxS2pvbEMvSXJtbU1rOVdrVXJtYzA0U2lTdFBK?=
 =?utf-8?B?Ny94RjF4L01zTktYRTlVN2NndzUvcHYwZ1JHQ1E3SkNsVmNFazVydDQyMW9L?=
 =?utf-8?B?OFdJNGg3cmNHS056VlRtU0NoeG02Y2w5dGFoaHNOdXRzWndxUkJIUFRPUWZM?=
 =?utf-8?B?WUxRLzNzbnRRbEs2Y0t6aEtnSmZBQ0hYM2txdzVhTWlIUTVNNytxY2QwOWJ3?=
 =?utf-8?B?NzFoSXBzcEtkWWlaMlQvVUx2d1oyeTZTNUdIMGFRL2NzTkVvYk15SGk4bVVw?=
 =?utf-8?B?a0x1aHdEb1p0RXFIcnM5ZjBBREtzQnYwd1N5UGRSRHJId2puOWZqeVIyZTVN?=
 =?utf-8?B?bHRjeVJDNHZXZll4dDhiZStZS29pWTZiYk5SWFVicmZFcUF2eGpqMHo3M0Q5?=
 =?utf-8?B?SkczT3Vsbno4aVQ5UG11YmVzUk0zdzZkd1h4UExLd0FTdkVJUjVVdmJHZTRu?=
 =?utf-8?B?NGZiNy9NR2h4OGxYNVlySVBLMXg5eDE5MFpoczZOQ0wzbnlOSHJaU3JDblB0?=
 =?utf-8?B?Q0poeGw4QWNIa0p6WmhHVzNvbzk3T0Q4NEo2MVlucCs2UzhvR1ord1pCc1Z3?=
 =?utf-8?B?UHNHbFIxNGtYYVpUU1pManhFaDdZZXk2dTl1Z21zUkRlSmdXTG0zL2x3V3Rr?=
 =?utf-8?B?OTZGNk9ZMlo5Q1lZTlZnbk9hSkZoZTF4Ry9CWUJ6YmlWWWkyYlJPYmxvaEtQ?=
 =?utf-8?B?R0taajBEdUMzc0J1by9razVtZFpDQW81ZFF3bWd2clpCMitMWTJPUUpTelVE?=
 =?utf-8?B?RDZEeitaVGNtM0Rnd2Jabkx2UkVsUXVoLzErM2NOb1FhaW9VRGdzYkJTc3c2?=
 =?utf-8?B?MUxqYi9sZ2R4VDRFUWVEM3ZKT2d2eHhYNVh4RUFrb0NUZC9mRllIY2ppMVlU?=
 =?utf-8?B?L3o5MHJvUWNieEN3S2xNRmRsb1N4NzZZclpsTEFKclI3YVpybGdKL0FHU1Jh?=
 =?utf-8?B?Y0dDT1AzQiswTlpRQlFCM3FUbTN5dC8zUW1UbVpMZ3VaeUdHN3FHSDV2NTJk?=
 =?utf-8?B?V2hMUzgrYjFYZXZOMGIyNFMwMjkvSXRvYURsNmpZMWRyTVF4UjBLclB6ZDNI?=
 =?utf-8?B?RWV5TVpKY3B3T0dnTUtoYTRBa2xHMlJTdGgzbTBEQndKOS9XT3lSdlJ2Y2VM?=
 =?utf-8?B?cUpGWUlzcE1mV0ZMNk1aTGkzMmpqNDljaXZmbXpJdzFaWWIxUEVSVzJtOGNi?=
 =?utf-8?B?b1F0TGlNV3pFUVZoTHY0MU9GZXhpVWc4d0pXNS9JOWZGclJjdnJBVWN1K3Ry?=
 =?utf-8?B?Ymgwbnd3cjZLNDBOM0UrUFhrUHFvUTFmdWF1NFJrZURzcVpXRElhVGhYQlNI?=
 =?utf-8?B?TjllT2FTaWhVb0xsWHdTN3BIUDR0ZDhOYjdyWXhobGpnb0VNVlhTWmN6MnlZ?=
 =?utf-8?B?VVdtT1JudnRrR1BzNkhBNEp0eUppZ0JxZWlBa2kzNGFRdmJsdFFpVUpoTm5C?=
 =?utf-8?Q?dCowP9mR4X4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5113.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2Z6ZGdHYkNWOVBibGcxVGFOeHZEZDlka0hOeXNVZW54NGlWZ2xNaUlReHFy?=
 =?utf-8?B?azNwMWozQjZZa1N6WlppdUhQa2xEczkzcWc4SGxtMFA5dEpoYXA2c0ovWjEw?=
 =?utf-8?B?bkg4bk15V25kY1AwbWg3ZlRlK25ZSG5iTUFCUVlUK3ZoNWVMa002UERsSTlk?=
 =?utf-8?B?RTltbm1uUDcxckdIN0w4dnFEL29MUWlrRlU4TGZaTmRUbEp1d1RqUllmeTVU?=
 =?utf-8?B?cSsvTFdzTnZ2aTYzNHpoU3EweDJIamkwOUNMOTZMOUt5d1dMMklMUVJJdGV2?=
 =?utf-8?B?K243eExXZ2hOVGpSYXJGenM0YzMrK2E4dlNTcGVEdXNUdWVzYzRQQ3I5SVdj?=
 =?utf-8?B?ZmRTUmFZSWJaTkJ4bDROT210NVE5UEJLNS8zZXZyMllNK01qQ1VNYkRLbTVR?=
 =?utf-8?B?anBkdjVuTXZIZnpCeW1IeXVVMWNiWFBVckUra3FjM1lPNG9tSjBodFI0bmxh?=
 =?utf-8?B?MC9tM09NN2JFM0tPVW44TUM0TjhpRm9VeUY5SCtyK29ROXpva1F6cVZpM0w3?=
 =?utf-8?B?VytYRVVhcW0za2NNL1FYMmdFQkpXTER1SWlxdW1wejNuWUkyZjRTMTZsSi9k?=
 =?utf-8?B?UTQ5OWVyZE5lMmJEOEhjNjRuUkxwbUtZNUp4VjVBSXZNWVd0d3RRR0JtN1FK?=
 =?utf-8?B?N2xndEZOdFcyTmQ5aHZ2aEFHUjc5dWF6OGpZRmsxT29md2o2dHkzVGdxb1Qv?=
 =?utf-8?B?NGRnSnNOSm5tdDZHdGR5a2EyeFRxcU9QVERnaUIvWUZtMEpwKzdvelQ0Nkl0?=
 =?utf-8?B?cmRzd25hcW9zU1NncmNJbTZIRGl5NVdSWFlseUR1ckJBZENBcnNZSTRUZkpo?=
 =?utf-8?B?SEVOaGhhQnE0NzAzNkhlR3lLZUJWcGVPL3pSZUVDRmxYcWY2K2RYclQ5UjVH?=
 =?utf-8?B?T1hCR2orYXJMQ2UrRnJXWFhLZk1TUGM0b2F6WEp4MzJtaEZ2MUhNTm9VSita?=
 =?utf-8?B?b1FTaFVDcWN3U0NNWURHMVdMR0podGEvNG01UDJialpDOENSa0NkR3YxU2wr?=
 =?utf-8?B?MW1EVWlrTWk5akNEbkp5MGhmRlMyZERJNU9OQ2RqVFRqelllK2pTN0Vmc3Fn?=
 =?utf-8?B?OVFucjgrVyt2YU9zcHVESjZYakxXRkU3QlVNdEJtUUJnRjZmRnM1Tjh3NGFT?=
 =?utf-8?B?aFl5bjRQZjZZMEFjNUpmWXNaVi9EdGcxcmlDSmVESmRUU3llQmRCeWhlSW8w?=
 =?utf-8?B?WWc1MEJldE1rdTVMYjRpS2xoSTRyZ0gxc1lwdlNDUU1CK2JsZUVWMWEveFRD?=
 =?utf-8?B?QlBhcENlZkNhaGJpTnVXS1dqbHQ3ZWcvTUlIYU9lNlZweWtyZGhiNFZpandt?=
 =?utf-8?B?dEsxM3l1QXRJREc5cjMydUNhMUhZZXUyRmt3VXUyZkR3MEU4U0YzeHJRQm41?=
 =?utf-8?B?VUVOS3BaM0JHYjdFaFZ5Y2xDSm5pVWk1QkRhWEx0U1RneVJWYndaQVR2NG91?=
 =?utf-8?B?cyt4bnBpWlFzZ0FHWW5ONVQ5SURScEQ5MEI2Mmx0Q1hIQ2ZFMGMzeWRWMnoz?=
 =?utf-8?B?bzVuMnJHd25ZQUlJKzNjM2gyc3Y1MzJialFKSTF2c3VFWFZIUkdUQ1E3MXhY?=
 =?utf-8?B?Vk0yME10am56ZWZPbVBUSEx0eG0yNnRUS3ZBV09qdkJiTlBaYS9kdm9mYlRO?=
 =?utf-8?B?NmdFaXlKSDlWV3d1TU5Wc0VDMnNBN3pBdTB1R1kvNFMzay9jWUNzRkhpVHhZ?=
 =?utf-8?B?N2JPYk5VZUFTWnFnMlpuanBtNHhJYnRnNCsyVEJxTG9kSkVMMjkvQTdFNEcv?=
 =?utf-8?B?ZDNaWFU4R2k0cE02dG1ycXpId210YWs0aUtvZ1ZCME9aKzJEdUI5cGZrazQv?=
 =?utf-8?B?bTU1V1JEWVVLVk1rV20zWDR5d3dzeWRseTNJMCtRQzZjM2t6Q2lYbW54cFlB?=
 =?utf-8?B?TXVkVi9BaVJWNy81bDJPS3pjRWxvdDZHL2VScUdwYzBaWXZCR0REZm81NTVt?=
 =?utf-8?B?MWVMeTIxOW8wYXNYRkQwSkZaZzVkNXMxM3loVnlaKzYxNFNNS0c0bzJQS2pm?=
 =?utf-8?B?dFN5MjBCK0pxSllwNHdnTDBXbk0zZXZNWGNwZm56YWp2VXpoODU0RGZpb1JS?=
 =?utf-8?B?Zi9DT1owdG1Qd1ArOHR3RUt4MVlnTTk5Q3hXOWlDS2lQMWxLZGFiSHRpbkVQ?=
 =?utf-8?B?MzMzaFpjVElKdEp0NmN1SEtUQ3lLMkZtbjY4c2VZTDg5bVV0RTNnOEhrOWlN?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RvzRurRUe2fCUqvs8TrQt93Xr3Ll91wqvf5sWyHdSxoOKuRy2ldpHLd5ligyDVUXOodq0H2uLUKRW1myQvSW4+hoNBa5/nPa5Bm+x8j7KJWKq2QT4D+YqmxfMQzWwYg8sNl1DInDzRJRco0DSfaRV5Owt07IVykHrFVwy/5UPMBSe2xQiGMNedd+vPzhgR8KqdsM28kcG3xquEtYIdOH/kY4FZDhEZtuYwuGc2KcIzN4ul8JEZzok2z91vMUjkTx+aThhz00D7iPHV9jmurw41r5VWHVWTZ2BSJIhHzJ4TvHaUQBwbtkW1TXMZvKhtOZ6I7ley/HJC+O3dWM3uGz3T3bcIh6p/o359YN6dVegWi6qUcFMw6IREhis5VXeDJO7K0Tx7fJo1gJDwB156xQQhhjXfCctR9reG3s9u2DiGJN09gztYHNbuh6qGBhn2KxA2pLupi1Ha2uAy63WR17yw/Gy2p4ssvfymEyArOC5Q6KW5Nvn6FCic7L7za+B+XrlNbGV4gKqiSSSed16YwoPLEnuZOUOiDpDR2JdMACt3U1NTJyR8bhWOlzjEh5zDmdkn2JpGQEE13pY8O7DIN95fOthwK3wnWZIFfgU75UZ0Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24ae236-582b-4862-7a77-08dd80e6568f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5113.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 15:08:14.3045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyFfXFU6EkRbgnFtlJ1irwWMlYZ8eJKf79qo6tofpQ5Fyxoob9VKJxabLKYYgCzQBffdO6pzpQpdlDyHWkOWanoqfAyqk/FaoD7ecDWCNRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4190
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_07,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504210118
X-Proofpoint-ORIG-GUID: M2v6RvVgBcrI5rDx2AICi9loOB2Cdchd
X-Proofpoint-GUID: M2v6RvVgBcrI5rDx2AICi9loOB2Cdchd

On 4/18/25 12:57 PM, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> In __unmap_hugepage_range(), the "page" pointer always points to the
> first page of a huge page, which guarantees there is a folio associating
> with it.  Convert the "page" pointer to use folio.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> ---
> This is a new patch added to the series based on the discussion here:
> https://lore.kernel.org/linux-mm/aAHUluy7T32ZlYg7@debian/T/#m2b9cc1743e1907e52658815b297b9d249474f387
> ---
>   mm/hugetlb.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 7d280ab23784..8177a3fe47d7 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5840,7 +5840,7 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   	pte_t *ptep;
>   	pte_t pte;
>   	spinlock_t *ptl;
> -	struct page *page;
> +	struct folio *folio;
>   	struct hstate *h = hstate_vma(vma);
>   	unsigned long sz = huge_page_size(h);
>   	bool adjust_reservation = false;
> @@ -5904,14 +5904,14 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   			continue;
>   		}
>   
> -		page = pte_page(pte);
> +		folio = page_folio(pte_page(pte));
>   		/*
>   		 * If a reference page is supplied, it is because a specific
>   		 * page is being unmapped, not a range. Ensure the page we
>   		 * are about to unmap is the actual page of interest.
>   		 */
>   		if (ref_folio) {
> -			if (page != folio_page(ref_folio, 0)) {
> +			if (folio != ref_folio) {
>   				spin_unlock(ptl);
>   				continue;
>   			}
> @@ -5926,7 +5926,7 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   		pte = huge_ptep_get_and_clear(mm, address, ptep, sz);
>   		tlb_remove_huge_tlb_entry(h, tlb, ptep, address);
>   		if (huge_pte_dirty(pte))
> -			set_page_dirty(page);
> +			folio_mark_dirty(folio);
>   		/* Leave a uffd-wp pte marker if needed */
>   		if (huge_pte_uffd_wp(pte) &&
>   		    !(zap_flags & ZAP_FLAG_DROP_MARKER))
> @@ -5934,7 +5934,7 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   					make_pte_marker(PTE_MARKER_UFFD_WP),
>   					sz);
>   		hugetlb_count_sub(pages_per_huge_page(h), mm);
> -		hugetlb_remove_rmap(page_folio(page));
> +		hugetlb_remove_rmap(folio);
>   
>   		/*
>   		 * Restore the reservation for anonymous page, otherwise the
> @@ -5943,8 +5943,8 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   		 * reservation bit.
>   		 */
>   		if (!h->surplus_huge_pages && __vma_private_lock(vma) &&
> -		    folio_test_anon(page_folio(page))) {
> -			folio_set_hugetlb_restore_reserve(page_folio(page));
> +		    folio_test_anon(folio)) {
> +			folio_set_hugetlb_restore_reserve(folio);
>   			/* Reservation to be adjusted after the spin lock */
>   			adjust_reservation = true;
>   		}
> @@ -5968,12 +5968,12 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   				 * count will not be incremented by free_huge_folio.
>   				 * Act as if we consumed the reservation.
>   				 */
> -				folio_clear_hugetlb_restore_reserve(page_folio(page));
> +				folio_clear_hugetlb_restore_reserve(folio);
>   			else if (rc)
>   				vma_add_reservation(h, vma, address);
>   		}
>   
> -		tlb_remove_page_size(tlb, page, huge_page_size(h));
> +		tlb_remove_page_size(tlb, folio_page(folio, 0), huge_page_size(h));
>   		/*
>   		 * Bail out after unmapping reference page if supplied
>   		 */
Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>

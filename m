Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0377262D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943632; cv=fail; b=apnNT5ShlKfW+jz+yogEOzW0xtZrLd4jYYnBJuLVyY8ydPT/+PqK/HMR2CVEfT+sUY+enRLN/6stndud4TDtN/0pLcOXxr1W4uPHRPsGl5Sx+6SSD/pg/Z1vsjnbDbWtu49SDBNFgTSP47cdGTK6sQ+utd2nMQ34C4cAPqlciBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943632; c=relaxed/simple;
	bh=bcCnMKDMUwk+x3o1bwqHDU87S523rR5s/isRftZuD4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jVkDcO91G/cFyX8VIJuDcOYB1R3317CGSWDoHQMjtq0OHH4Ij2ckGoGum1MFWv9BEhgqWNTzegfSVmwbYKnO+xu/yoVsLIXiUMyPASk+F77geJ5K+GgSg4VBT7vnG2JygYw6WiVTfZ//zDSah34SAZ+xlnwHrxyWs3lii4b0sm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FyVza3ZQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ER1geJKT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FyVza3ZQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ER1geJKT"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5537ubZS003746;
	Tue, 3 Jun 2025 09:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=uIsl/wJuOW6Y0Ia866
	7pcTtTEqSCBff3bPEH0qbI8F4=; b=FyVza3ZQ17/tEQQKBlRhR+ITU4WW1yck6l
	N58omachgXF30/RMur9oq0dFEMNYoeDV2iU7mPBYTj3KbCNocaGWxxBnmp6a3K7O
	X2NvLCTkdMoTtZR4pusozKBhXSxv/pZYMR8KlA06deUfA/RMbbMAVMTdpwhYKJ3v
	Ix96qb8tceH6GtcQUTHSgqn/Dav35QwL8lKYwCAt5LdQs8ga9X5AWjGXJ/o2h28V
	WB3T9d/uXW0+SOMIaXqsMIVhuZUpEijciKyPAjLar6XcLr1KulROzckd+nieWb1Z
	xyZLH/nNsqKr/Iu5WIBYFYc9Ylv16TLuVchs5CNImuwxO6jEJhvQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8k9gg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 09:40:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5538kXbv016124;
	Tue, 3 Jun 2025 09:40:14 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11012045.outbound.protection.outlook.com [40.93.200.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr792q0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 09:40:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLNYgs32RHcXUZRFtuCgnOUpVFzu1N//RTKDuYSY40XbxbFmuJOMcbt5BrDfOxnu3IfcGffaeT6CSJLurOSefSrAQrwzmotK3F0g2FCgiaZVcWS1i0GaZOGuWyFYuSxgj/ETFlbTeEsPGuwWKZC8FmoRTJj7lSuH5Ok05G3wMadqfygBTGfR5w3EfIufsOkJf5xlgJY+agWpt6vkBuwfo51gaDVREjBDUCrYr+OWr7DY9gmZEQ6tUzTzfyyz6geWSFL6E2JW4uMIo1oaiqqFFRczid8vF7kfgpm1MnWdbX0OTlJRPRXhBulT2/y/TDZbzJdOLL4NfGe5mLbFCXgLyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIsl/wJuOW6Y0Ia8667pcTtTEqSCBff3bPEH0qbI8F4=;
 b=HE3h9NsyFpPq4Q5rfasZGuDCO9LLldtfRfRPhXe4S/RGOqPmDfGo2WLTs/6ki6j9314jngePwHkXQo3zWJAwtcHD8ZvwqHzsR2bnosPkP8JhNtFvKrTo/6ZpzINjH+f9pVATMa4TL/0aUxpEFFAIy61PeUVyYxB3l0md56efU8Vp4WrjaETCGkqYYfnLN2pg1Roy54FuQ8iNIDhA4ZmqMJIv9gyhO2o+A7Po/eE7FELPnvWhXrHC1hh61iLZaYiisM+HFqxvaie3WL5k/4qMddnaZgX3VvooTjzhq+BPcbdjdqcZT4CvQ6xNg4V+krokfQc9NSIFFZyUy4CzsRY2Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIsl/wJuOW6Y0Ia8667pcTtTEqSCBff3bPEH0qbI8F4=;
 b=ER1geJKT9SikJGH2qTyNk8EW/v7M3lwyrXwtJptEhH8o1uZEv21IqUQqnpqKyRv4tzU66slE83Hkh15T/YM9oXKhfdYqTNiPptPYkOYFKrhkcvaktzxgGDzfMc6AAZbsVKmnZe0WM8MJEx8lXaP9Ih/RGafi1Ax0u8xYukkKEXg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV3PR10MB7916.namprd10.prod.outlook.com (2603:10b6:408:218::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Tue, 3 Jun
 2025 09:40:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Tue, 3 Jun 2025
 09:40:05 +0000
Date: Tue, 3 Jun 2025 10:40:02 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC] mm: madvise: use walk_page_range_vma() for
 madvise_free_single_vma()
Message-ID: <e84ea5f4-b34f-4994-8fa3-6198f7fd0ad7@lucifer.local>
References: <20250603013154.5905-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603013154.5905-1-21cnbao@gmail.com>
X-ClientProxiedBy: LO4P123CA0560.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV3PR10MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: 48d8d198-0319-4bad-23f0-08dda2829f2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tKprCQNbWziCvj+IZRD40kfc2eRgBvGoIcKhk7nZ/30IHBds4wdUT9IlHz6Q?=
 =?us-ascii?Q?0JaZqi60k2QVKOP5k7d/T6SX8X7CI0lASlmIk7ok8RqmyaqRFzb59ZA1D4z2?=
 =?us-ascii?Q?0uqHMQM0FcKA0hxZPO8E4o1rW+FeVueQ4cnyHWDDq4o9NoN6RXLcJXT26axH?=
 =?us-ascii?Q?Oe71buMrORhcZzQ767Bmte/RTkl33Bq/vpo6Vzu8MwMIaXwsnVWToTS77RSA?=
 =?us-ascii?Q?TnLFNx5QniWb6nbAGNTM6J8hugiAfDeobbt9SMBmHzbQePSCN3UHsBKlTuOu?=
 =?us-ascii?Q?oZbpbQbS+CQQZC1EEtZdeHW/UzoHFEJfmEuvPiyUyS+0BOrRnW5MRdWEjIbW?=
 =?us-ascii?Q?w4HoD7uyBppQQ2AojoXIC3kEEIhVpNM93R5y87phJWVkq0SzmntX61jyMsAe?=
 =?us-ascii?Q?/nha/vrV0rCbSD4GMG1DqiupgrQBAZSp1Uf3FcRYx3xUmmc1GiFDwAVhqTnT?=
 =?us-ascii?Q?Jj51S0Clok7TaQuKQjrDCDNhLwxLVba5h2y08x6FEJuBnoVhNrVXzPWj17sa?=
 =?us-ascii?Q?Wp1S2GfvtnrJwsvkTGvNqBup5flDB6y9ZVZO6ff81QhzgSVg7wx8jkxHHVMT?=
 =?us-ascii?Q?xyrsS0aqrnBeznJQH2XzdhG1j+/x7mqXOorYf1V9ZWt66jAT6dxhauadHaKj?=
 =?us-ascii?Q?qLYh7v91ZE/HwyzdKmzyB/ic65XxlBwXySp9sCdFRSuo3lF6Ceb5RXwyFpDK?=
 =?us-ascii?Q?Re+hsv8i/UaHxmHBkfzwXCCveUtVRU4/aELmCiaSguCVlvsjhi7fJDk+tliV?=
 =?us-ascii?Q?wqprjAtcaBiaTz4H6mLrucCxj3J2u/WFH+0kNuceCo76rVz9MmCGmIAn7GjM?=
 =?us-ascii?Q?L4Ff9dmFzOHqsE7fQxqV9KS4ZDO7gA03PRpbop8RmZxKcBg9Cdt0FONf3ATs?=
 =?us-ascii?Q?r5RJH62aYDunzN2t/9fhSCqH6cXhkOg2WV+F5HGcQ/CvQmw6KDWKrRlIQnJ8?=
 =?us-ascii?Q?LAkC+996ZamWe4MQjXQuUvXBOmxe1G27hqH09nhR08xG6rp2nnmK1ao/am/a?=
 =?us-ascii?Q?mlLvcQh8tMsqHPqhoH4a3Wbx5WKfffxVxbhqfkp/8PEcSjUa+BbWXCTDJbg/?=
 =?us-ascii?Q?Asm11zwC/uEB/AgOe29iGrfrga/KmwtmM+D6aNHHVv5HXgB/jzQaHAerT2bU?=
 =?us-ascii?Q?FwUPga+KAeT+H2IWA75N3oo9bt4cMwzh4XQqJuB2XSUaZ0WL0hd431AgHx9m?=
 =?us-ascii?Q?CQAUkLbWxIulynAbb1vwCKTrJ27DKHI5NdocqwvE9mcYwWh52kFwt346HGjz?=
 =?us-ascii?Q?YXSsLoxEYdKTZ01e7k35AxKCbJZcjdXDnwVySfx2ESGXdAHj23ewVkfjs3ee?=
 =?us-ascii?Q?NbqCI2DaVhGaDF9PPw/0WQt5aIBsWizs/3/N2IBsXQeatmpPHW0+X9qKhiLl?=
 =?us-ascii?Q?IqN/luphwS1jpPrn8sixMOT4uev7Dhf+sXo4xf+fscyCgoKXa8IBL4bmtrU/?=
 =?us-ascii?Q?FeCJYHPpIgg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5LtcQXkzWxMA0SwPuzxSPKvPxmHN7JOg6EDSjqdSjCnVeURBNApcXYPVmVbp?=
 =?us-ascii?Q?MvsaNNFQCl/gVonIqv4L78uPPiaY2U4HEYQXQIHrA8LgFN8MUQ+7r8WLFV4Q?=
 =?us-ascii?Q?4/AmJYaHqXhl/zwQ4j/D/877gJHiw59Vk9hAPy7CUquDChXwnT1fXtnT1lLS?=
 =?us-ascii?Q?+ShJB7kKUpmIySNJsubrW0QjqqO9rZExWy1UISfRsXnOsC6JFVmu6aom5p2S?=
 =?us-ascii?Q?Ta8vJbo8+PoaTGZt14ppADhqKgRVFT4tq2hN+VR5lSUa9OAXLMem5gnZzBJ1?=
 =?us-ascii?Q?K7aBHZ4OXP/Dthahw2KviMB752PPIIoxPbLWc5NKEm4k8OhN917wvEO7hsk6?=
 =?us-ascii?Q?PNhZTh4FHGHV7MC+rA7/nzNjjDc4k9PjCoQbTNYiL5qx3YPgu+0lR94z7E/A?=
 =?us-ascii?Q?1FArP1D03Bmjej3cs7Ifi4dMRWZXx1xhrwyuhp7i55Ytcfj8unKb+32xzh4k?=
 =?us-ascii?Q?NKuYmS7XZDekMMP3dMNu/MGZc6sIR9lhboUtG6MLD0C6NWmAjG5JKtFPy8Ic?=
 =?us-ascii?Q?RiEe1z4o0vPXZumu87CBGgCKPlCQ+0kSALO7ORfgUJI/3gihBgfB/fcvp1J2?=
 =?us-ascii?Q?grKjXOuKt0ut+IaqXjB5JE7hC7KH7Wse8rQZX6d14vV6JBqPFJPWWntMZlwC?=
 =?us-ascii?Q?3/uaFrne/6hNSpeYT9mspqUiio4WgqakO2We/BpSTVUewVTqQos2q2pbQX1e?=
 =?us-ascii?Q?RWfloPFM+DM4I/G+nVT5nLOx37qO31P0Stt+E3jm+mTToFU0jEmriEVP/703?=
 =?us-ascii?Q?REGlV22Ha3hkivk3YZ+LqVBOi8g2764dqlZbyEdXemTNZePFCuRwpB5VRdBe?=
 =?us-ascii?Q?Ah3W3CfGzVjdI/T3r48wo9EWEGa+cEvNA6HSXnnMPcaWcPpu51Inpkhi1Aua?=
 =?us-ascii?Q?y8mBsY4jscM1qkRkZWZ+uzKsu2VjWllm/uEzfH3B3JuLI+KMeH2soSp2HFLU?=
 =?us-ascii?Q?Iqwg0KHwYj3QQyonP4W4Ol6cnrQ1pX/fsTLUnCX9iQFke/lbWO2gldKD5MUB?=
 =?us-ascii?Q?OJHVR0TxHu4F0IUirK8DFKgYc5aFiRYr28lsa82OZHv2RbjocnyRUz/KLkuJ?=
 =?us-ascii?Q?0IoA3VBv+G9cmMHuYn8J8ScJF1YpMhXWEDwztF6fX6RVf2+ruBTI9APZJoQT?=
 =?us-ascii?Q?7XlckPfGE5Ae3KTARLdq0QkqZGtpasUX8fxr79olA5tcVavnSO22qv3wdJpx?=
 =?us-ascii?Q?7Rg6TgHQwvyq0d1ZJy/mZy6NJnmJkKw0YmNoNHVOQb8wsVPbipeh53qGD57h?=
 =?us-ascii?Q?DhOjaavobej/EZ0Qqe4hXjw46SSjk44BQ9DbJC4V9zGKMyoWXGvz0c00akUt?=
 =?us-ascii?Q?OwRK3ttStGHCeXwCLAGc8/8I2yK3hP46z+Hz9nF/7p8tH1xxdlaoW/gz1kXt?=
 =?us-ascii?Q?5f7uFQHd7b/j5fVTFv6wyt/8wBBKdyZG46LZow2Hhd8F77QqjhQkuMAVSYTC?=
 =?us-ascii?Q?g5pGU88uTvI/eqqZoCRl7G8emyLMI1QCaihw/2FvhBA3h5DvL2BSMwdbm7+V?=
 =?us-ascii?Q?rInTagg1l8F9pIeJZvSlNOJg+MTgO2vR+uR5Zv+JtNwtU29L5mz8f/wLBeE5?=
 =?us-ascii?Q?xxzi6J9cbOnMXXc47D4KCmzCyWrLpV9/FJLcL06b9JqY4PaIg60lisIG2qWG?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UNpzw7m0F4J1TaEIrE4ZrQWo9fvahKJPPSwfT0m8DGfSJ2xDDrmTZlFY9IVt3WDApTXkYodpnrVbf5h87D9b5Bs4l9YX81MSO35eIy2KD7X1poCxhMrpOxWnygXyvykzKx7uFI9nciA4cFsfzCBcr00y2D3yZ9FIUt8K/lh8jW8w8G3Rc+ytyA3i1u9hmaSOlxrUE0xO9bQ4zkA8QRfS7+XiZ9uRsyEzwUIGRHBF+5YO0J0jCUreJMK9DBA5ZhwwvnU5XbFUuotvccFKDfUmffxEXL9p/bXQDR6279raH+1ZLxGTY9C5jicFe68uSd/GhJ6ONRaYK0y5ftJY6VjNPU/EbnGOTZZ6WSl9jayGW0wuj1k6a3bp4d7fk04F1oY9sBErsfe0hBtSP0ec3ZnGKKM5PUKOgJYpcvzaK5d7TY5cAMdhqkkIxUwdsGWZQRXq2lOzUwjAaJu8bsP+0THxtOhL/0cZkJKnmr8npZuZ0BtaEyQrNWTt+iXASNRk24qwK8ZR8YOEChMGBpxOfMGo1XwdQW3pX/DnOKBelAwmGaUinLxylOYV0z8EW+fa+PdKTB6J5CYuvhVj3JhfQN3982F3mkng1dSOB3togJu2+J4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d8d198-0319-4bad-23f0-08dda2829f2c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 09:40:05.6962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WP7cLvLmi+vbGehVcPlZPQXDnSAnxYQK7taflmV/CUeYJKNLx0kNGIdXVZM/74MZSD1z5v06hGJOQrIGZgriW2bMAajrQi3CATD+e7Bf1io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7916
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506030084
X-Proofpoint-GUID: ZuVdSIJ-pvZQMv9Ei43ltupaXZKxcPFq
X-Proofpoint-ORIG-GUID: ZuVdSIJ-pvZQMv9Ei43ltupaXZKxcPFq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA4NCBTYWx0ZWRfXy7qcuTgQFUk8 4XVNTgx450Favp57Clzt1lAYuvUSeIFQCWGbI9IxtT3C4dnmlea3QtfPufs3m7Dd3eS/HF1y0zO 7vlwVDagGpJFn1YqkkUCelX3QYmRhzwrzaWjxVmeMsRQa60uMqv3ZOmOa8OPqJlFz52VBrI9102
 FCPL6TEr1G+Cphdk+NfPQTyJl41Or0CpUYOqD25jUDSyx5YrJmdLYvFRrz6EuN9l9HeQCkkwGfS 1hoJ0AzMhFrhMDPIv1B4gD7VwjhRWOjMBxwHYplLFUSo7+/TWJRxFcDCy44qGLL0gVO3PJQaZ08 Jmyytgq4xYomYtd9OUMJUPfsuTa3xVmq9Q65lr7lpMtzefeLVr44Xy88FqEW9YSPC6p+vpJwxHM
 GkjqknJvYltdswZf89J4bTyMUXHD+Dl9Y5SV2m+StWG7A4EgQ+MrgL5wY3CYCNWhwDole+eA
X-Authority-Analysis: v=2.4 cv=FM4bx/os c=1 sm=1 tr=0 ts=683ec2fe cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=A2pY-5KRAAAA:8 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=1XWaLZrsAAAA:8 a=vZBcMn-KAnQMv9R0pWsA:9 a=CjuIK1q_8ugA:10

On Tue, Jun 03, 2025 at 01:31:54PM +1200, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
>
> We've already found the VMA before calling madvise_free_single_vma(),
> so calling walk_page_range() and doing find_vma() again seems
> unnecessary. It also prevents potential optimizations for MADV_FREE
> to use a per-VMA lock.

Really nice find, great work Barry!

Lord above, why on earth weren't we doing this before...

>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>

I can't see anything wrong with this, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/madvise.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index d408ffa404b3..c6a28a2d3ff8 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -826,7 +826,7 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
>
>  	mmu_notifier_invalidate_range_start(&range);
>  	tlb_start_vma(tlb, vma);
> -	walk_page_range(vma->vm_mm, range.start, range.end,
> +	walk_page_range_vma(vma, range.start, range.end,
>  			&madvise_free_walk_ops, tlb);
>  	tlb_end_vma(tlb, vma);
>  	mmu_notifier_invalidate_range_end(&range);
> --
> 2.39.3 (Apple Git-146)
>

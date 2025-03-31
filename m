Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3173234
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743430781; cv=fail; b=OuCsFRLgCSM5y7wuyXwetxUTDet5d1iXoHGzHDddzX8/2FpfyY+h40OGYjZLyR1jWtAkT0mAiQGgZs0qimdWafImLYfDH/09odpfalOhjGBRGDA9Sb6CXiIZC2LQotyOULgts7l55wPOwCfy5oGmXwM1SubHdNfoSjdx5u50nCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743430781; c=relaxed/simple;
	bh=AzE0afjZtz7kzD0jFtNVuoh8aj+Ffrr9bR+aRS5fztM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lRXtE6VLqGT35/FIzX1m7v3BfycRkxj7qHHE/PulK/zEeqmY6psZjMT+BVeIlUPu0smu9LZIJljImTlUBYjHs21ID6Ml51xF1f9M7/5jFLs84gfg1Id47V8dB9d80DhsLykS2GzEfb/MAj9CZkYY19pA/3Pv31hLu+5NPmduIIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=I7ll8U73; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dpzIRTN/; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="I7ll8U73";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dpzIRTN/"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VEBwu6023111;
	Mon, 31 Mar 2025 14:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=kWUSAsD7PQFGqLBhuQEX5Pc3DtufLHh6lvsBrXcv7K0=; b=
	I7ll8U73+oU0o0z0Hos56UmQbgeoXN0QGI33jORI4zb0K0K+9le4IY37oAqVgD7S
	+cxlEDfla6MktW2MAUTs7l1xmX1u1wGgPTtBqyB+Z7sx739ReRBuH2FkFli0r+hx
	TrcXL0t6bgafi46HNOsyHbcJxfE0wpv8+/POgru0xrrrf6/ijown8zbRpbo1d5lz
	QaVhgtm+/f6C6sRoPifRZLVtpx8aj5FpuRlBnIssHwtpS/pllfYvmkjuXxxS79EJ
	6rIvCQCuUWEhDmL0zjjiFRVLTfb1LDRSUwFM88IU8UDcVDv8QyEcbzN/FbGNGgHH
	TOJ5oQx2Yi8oquXlqioRXw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8wcbb5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 14:19:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52VDAwuH010712;
	Mon, 31 Mar 2025 14:19:24 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7adyjfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 14:19:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAWbWvpoxpSmtwXufj4/qJjAGmegoro5ca0lyO9VvhuynttaexLOG5+LcuvuNMbKHB+Xy56rrtQ5ImaaEEpB6/PuPb5q3ieeRHACzWt/mVYyINyDjigpdq/h8ox6vVTNbo3fg8vnGrzvVGnveZLnULy86Xgh73qpobWuokNvu7n+erc/pdfl1jVy7d+rFTHgaZThe66V9/YUDiGoMGoTBuecTQrCsVbSCWnplUC/roUOgWZj2q6MXKBWpHbl41oOIbPKC9zBNcuf35vpXIoQ8IFaQrrUiJVvlkjn2sRuST40RiwRF/XGVJxTWDTKN0Q3C1JKAJRseKn1nql9KMaZUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWUSAsD7PQFGqLBhuQEX5Pc3DtufLHh6lvsBrXcv7K0=;
 b=tqSi33Dy8vbAVdyfqq7dtQiPtXfwMw4aJnV5mtw8oti1/hg3wKN3dJxNDf5fWLYJwg792T9aAKeAQigfaaDYSSkBKVqE9fsBi/hw5MYOpoFY0qwo9WWNngb14nYcn2K40Lbve5DwJnUyG7byjArKS4e6YyrGww6ptt5b65MjpGzixlRSoymVs8ymArt4VUSkRdRv+UNo2SgkTBEGZxGREPcioX/rwpm3Cp0odt2wEpEyHwlNlHT81Q8YtqKvA/t6cFV7ifwpvc9nA+YMmguRTMfVyUKij8ed1RMMqn/HToPrEj5+oAOOThaVtTXKbl0WpLOpV1xDtxxooLyVQCG1kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWUSAsD7PQFGqLBhuQEX5Pc3DtufLHh6lvsBrXcv7K0=;
 b=dpzIRTN/Y7nZz0I5fXveisWJmMY170ibZ84kQm5pHcrxxuUTey3Nfs9gwvRlxvXGXuyBXnNM3mM3Zyc2n6Zv9ctiO3LbxGB0vA6rR3mPoO69UUcYd8tE9sdxqTDEW69QhipurS9Los9dQmWGc2GRE2Zue10JusLnPfu8Nildy0I=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB5710.namprd10.prod.outlook.com (2603:10b6:806:231::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.37; Mon, 31 Mar
 2025 14:19:22 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 14:19:22 +0000
Date: Mon, 31 Mar 2025 15:19:19 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Jann Horn <jannh@google.com>, Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/7] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <2e02e0ee-cee7-4096-a330-78b1b091bc5e@lucifer.local>
References: <cover.1742478846.git.lorenzo.stoakes@oracle.com>
 <d10037699391c42a4943f578c2a0bca890640f30.1742478846.git.lorenzo.stoakes@oracle.com>
 <CAG48ez3CiRTUv4Qwy_UQzQuEDtUoPVVXnuPyiWoAhWVqkF3VTA@mail.gmail.com>
 <182bf1ce-1b67-4243-854b-4d0c26aae563@redhat.com>
 <21f89b73-aaae-4674-aea2-aefc7a4847d9@redhat.com>
 <9f81bfe4-4cc7-4754-b92f-db3a4e549f86@lucifer.local>
 <01803b0f-47ff-429c-a6af-33fee39b957b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01803b0f-47ff-429c-a6af-33fee39b957b@redhat.com>
X-ClientProxiedBy: LO4P265CA0238.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB5710:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c6436b-b281-4743-5c69-08dd705f083f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDBZOVRYT1NubEg0REpqbExhMldST3hzRlV4bk1EeE9FdWZSQ0xkOWkzK0Yz?=
 =?utf-8?B?WnpNTHpUbVhnR1hMVk5vcGUxY1ZHeFBOUjh2RG1iM2ZscnNQVlJyOFl5bTNz?=
 =?utf-8?B?L2I2NWM2aUdpTWs2eGdXaE9vLzZvdkhpOG02MWNrY2V2c2RDZGg2NmV4T2NR?=
 =?utf-8?B?M3puRmZucWx3VEt1MTR1SDlSMkQrVDNyZ0RVTkRGMEl4SDd5WExQeHFwdy9C?=
 =?utf-8?B?WmN1QXZMdWpXT3BVS29kbXVneG1LTldLd3pTSExrclFmbVJ5SHJ4MXpqNDB5?=
 =?utf-8?B?dkNkVGEwRXA5cHdBUTB0dWxrTTNONCtySWNMTms2NUNxMWRTZjU0WE9QNEg5?=
 =?utf-8?B?dzcwNFV3cU0rZEl4ZHFydHU5eW54bW9oRnhpMFFhZE1MaFRXcWxMZnM4Q0xi?=
 =?utf-8?B?dnRISmRRcERFVlB5RnFRZE5SaVZUSzllT0NaYXJBUEd3RUxIcFRpTStEWm5j?=
 =?utf-8?B?UUtsK1hvZ1pkaGFCNC9KZ0laRVFhVytFMmc1VHIzVmNpS1dHVDh3aHAzaENV?=
 =?utf-8?B?MmxXa1c3LzFNdm13NXp4c1dRVFF0RkVWM2JPak1GRmt2M3ltNGVEbWdqcXhs?=
 =?utf-8?B?SnVHOWYyOE9aQXJ2aXJLSmsvUlRWUzlBRU1zK0tpa2dyZVNGV0hMUkJoNGc1?=
 =?utf-8?B?WXNLVURna0Q0UjR0L1NKNFJVQ2wwU0xvMHAxSlhTL0J0Tndlc1diMGRCSWZK?=
 =?utf-8?B?UzlLOENneDlDV1c4OVBPazVyS0ZrVWFNdHFIaVA2NG5XeHd1Q1ZOOHB4V0tn?=
 =?utf-8?B?ZjNqUGVhY21tdkJkQ1psOXl1MkJ4ekpBUWVteVoxMDhRT1ZDTDdQSjYvNi9z?=
 =?utf-8?B?eDNRMmo4YUNQejVoekJySWgxSkZ0MGdkLzlvYlBleVhxdG41a1oxTkNlc1Q3?=
 =?utf-8?B?cVBCK211NGkwbEhScHFFUTA0WEpkVzlnKzkzYWZ0WkJkRm5rVW1MYmc0RUMw?=
 =?utf-8?B?TEF4QWYrdkJyRWxQVG5NRXVsTnFPSk5iS0ZmRU5RNWVibWRHOGUvTmxNWFdo?=
 =?utf-8?B?cHhTMFlFUG1QbG01NFZyWDFGSUdjV1k2TitwY2ZyN09QeThuREhqNkpnNVo5?=
 =?utf-8?B?TXA2SHBudS9VMFlBQXFwb3krRlU3Q01kMDZnWkZCeDFZU2tuVWlmakd1OEV2?=
 =?utf-8?B?Z2Q5bGoxTnpaOGUwZFZyV1RRMlhNN1VqQ0NPMUFmVU1NWjlpL2tjYVA3Unlw?=
 =?utf-8?B?NUZvelljMlFUNkxNYlNiZW1yMzY3WFhvU2JSbmlrTVo3bU1lVlJsekhCSnBl?=
 =?utf-8?B?QVZqMVBwSkhwbVp5ZTUyelE3c0RkcWJ0YnRrN2VHMUF0Zm5mREJ2RytmUWR2?=
 =?utf-8?B?dWJjcEJRdE5TdEVsR2lYbDNkbTMxQlpnQ25WTG1GR3dLeFZONUwyVHduMGxR?=
 =?utf-8?B?MFVjbExEaDJaQjFISzI5MDhSa29yb2VWaUpLd0N4TXpIc2RzSVV1WlhCUjds?=
 =?utf-8?B?U2dqeHZMRTRpN2wzN2VLa0VLT1RDQ254ZmNnKzcyYmpla01MVTU4UGl3clJQ?=
 =?utf-8?B?dWpFTzYvSXRrMFJSeHdIdGNhOHc0NWtqSmpnaGttTVJ1NU1JekJxSG9KMTVt?=
 =?utf-8?B?Q0RpdjF3Zi9YOUJqU2hCUVV0VVUrMlk2TXB1Uk1TK2pKTWhaRWZ2RkoxNU5H?=
 =?utf-8?B?K3hUSW1iQVp2OVExUHY5V0Fmdjgvb2NvVFYxNW5oTndYeWkyTWlzTlduMy93?=
 =?utf-8?B?a0h2eXVrWktSN2R6STI2SHpSWVNuK3BaWG1TdS9vOGJXZU9aNHgrL1cxb014?=
 =?utf-8?B?KzRqYnBNS3NXb21PRlhjYm1NbCtBb3ZhU0lzeWRxTDcrM0ZlS1hPMjRlY1hC?=
 =?utf-8?B?YThWVjVPWEx2OGNFRWRmR3BtVDgyUlZVMTlHc3FIamZKZnUyaS82T3BOZVRF?=
 =?utf-8?Q?p690w8Pm2B4yM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmZpZTBTNCtzbnVYeEgwbjN0K1pjMWlNWFA4TTczdklkUVpTSnh3SThDclZS?=
 =?utf-8?B?NER6SWlJMUJkcSsrOU5vc0VqU28zaHdHYmR3cVVNblEvZ0Z4SGVwVkhyRDJr?=
 =?utf-8?B?VCtzSmNzcTZOai9vS05qL1FQd3JON2tJZnFHeU92UkpJd3NLYWQ2NGRxUmE2?=
 =?utf-8?B?SnUxdFFMcHhPbVM1ZmRhMTI5MFVkK0RIajhNTmUvS292N3lnWCtJUGJSOHZQ?=
 =?utf-8?B?cFp2aWV3S09GYXp6ZUJ0cVdPM0tnUHVBczd5SGhEMmZmdG0zakIwb0ZCY2lW?=
 =?utf-8?B?c1RXT3dxekFsYkRjM255QmIzbVk3cjQzQWVRZ1pOYkg2WDBDVnR3elB6Mm5a?=
 =?utf-8?B?YkJ5RUlKcVVycS9YZEdmK2JwYUpueEJZVThFK2pHWWVCb211WDRFZ3Q1SzJF?=
 =?utf-8?B?T09ua05MQ0Zqd2JiR3BDdnZWbnQ0blZRTC9LWGRWRTBTSWRyQ3ZiZ1FVZVdi?=
 =?utf-8?B?SWNWWUcwaW82Zm12VmIxd2xkSGJlTTJsMHdzNWltMG1iTVBYOXd5SldaZHM5?=
 =?utf-8?B?eUFIQW9ST1VVWHByZGxaVW5RWmVpNVRLVHJhNnRYWWIrU01qNHc3U1g1RmUr?=
 =?utf-8?B?ZUpMMHpBM1liZm05ejdFV1VhTDMwNnFmUHFFVXJvdVpZNzdHT0JrV043OVc4?=
 =?utf-8?B?MW91bEovc2gzelVSS2tRa0FoT0FUQzRkMGlZM3JYd2tVdi80R1BMZFQ3V2s4?=
 =?utf-8?B?UXM0NXFNcStvaDdidVZ2UzZUem44TTEyaUFwdUs3Y2dpQzMwbzR4NStEQzhB?=
 =?utf-8?B?eXBrU2dPZ2MwM091SDFHQU1ackpvOVNwVFdOeVVYRnBybWNZOExObFBwejRj?=
 =?utf-8?B?OTZJL0hkRkNGSUpvakxjRzVWMjBSVWZVN3J6S3hFbFhUREJTRFpKTUhwSlBV?=
 =?utf-8?B?VVdiRnVnMGtBdVlLTXdKMWZUUEg4VWJybE1pNjZneGNweWNlcEdDZjJsNGtN?=
 =?utf-8?B?Sjc3Q01aMWxzZnQwZDN5TXJkbUIzZFJZb1NKTUpGNXpybzgrNnhJU0xnWW9n?=
 =?utf-8?B?bUN1QjdwZyttRnlEYjV4K0JjZzVCeTJxTGFmTEllUDJkcHcrbGE5WXlwRjV2?=
 =?utf-8?B?aG9tM0JGRXh2S0FlR1l6WW5seUNIZkd4QWpiUWZvTkRWa0JoRGhFbG5kMU9v?=
 =?utf-8?B?Z09PQ2Frems3UU40eWRTZS9OQ2JCSnNZbFRaUlY3ZzhDQ1EwNmpuZksyUm80?=
 =?utf-8?B?KzRPdVowQnk2clREajlsZFpCN2hnTWw2ek5iWCtrVEhndHh0a2JPSGNGczk1?=
 =?utf-8?B?YVptQTNwN0doOS92dlJ1bUJDS01qZ0JtQU4wN1pSSmdaRU1ITThLZm1WOFNJ?=
 =?utf-8?B?VmJReHUzcytvcERZVTJLdm12bTJUZWZlOEc4ckVLOXZwRU1FVkM5Qk0yRHhh?=
 =?utf-8?B?dXVSS1pCVVpKbjQrMWFJanZ2NXJBd0tYSXVuUzJvZVhZS3M0Y05ud3B2VWpW?=
 =?utf-8?B?d1cvWlJKbkFEUENJUGlMOWk1bnJidEJKdVUxWEk4cDVFK1lJSzBZSmRiZVdB?=
 =?utf-8?B?QkY0ck1MOUlVQzlnMng4dmkxN2lHUU1nK2E0RTNBdi95a0RENHR3dmVMYVI5?=
 =?utf-8?B?UzFTTEREN3dSc2tBcGFQT1ZCOERxakwrUXYrRktvV0R6MWNWQ3JDTGhqM3o3?=
 =?utf-8?B?WW1RUjVzRDlQT2srZ1NwcDZhUDgxVGxtMHh0TXNaQ2VxWFZJZ3BsbVQwMUNz?=
 =?utf-8?B?VWVvZi9lUjVWVno0Ung4NWhwaDFEU2ZhQ3hQVFNvdGVKa1hRcVdPNXd3UnNV?=
 =?utf-8?B?VGdXcjdFcnZZVnhTTHhodjJiWkZ3TGtHQVBaaytjeDlIL1pzQjNKZHI2Q2lK?=
 =?utf-8?B?MmttV1hlMkc2MGowSXdmRHVXQTVVMm4zcG5XcnNueGREQnhWL3ZuMi9BRFMr?=
 =?utf-8?B?d2dXRDloRnQxK2VCYmpyOHlRRldIeE1pY0tkQ3pmTjBaTWZxVUZvQVJiREwz?=
 =?utf-8?B?b0J6bVh3NlVQSWlGMU94WmVZVzM0YTVpVEJUcXZOVmoxNWJTUEdUdHdqR3ZM?=
 =?utf-8?B?OTlxbEJGcnh0Qjd2RURFQjNPYkUvM0ZURXNDM2wwbFdJTmUvLzNFelBUTGEx?=
 =?utf-8?B?RXBPQXptUE1mRDRkS1pGWjJEK2JqSExGUVRCUmpGdGlCZDR4TDdMNVB4Y1ht?=
 =?utf-8?B?c2NrTUpPTFg2Z1ZmZkV4V1d2MU9MYXJQbVYzamtkRlgxTDhEamFLTDRRUEU0?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uZBpinW4EGZDS0RdK3XXFQAKNbYWqGP0+NVKf7Vc30FXmYB8xxcuNNarOqYsRw6Eyttts6BxEI866yEyE3lPF3oyMVOkTaYVev6pkeOS+glso+pntbDUhJe/cg8t5v1V81T98V68qp0l9KkIWreerMOljBSQ5IFWLiMnAM32dowuKA3FsCdbuiM2Y2qEKwODdOA69ojlKoXZf7t1t5bc1LSyfsnfLOzknwTxd4tami3JT2U6alvYUhxsVz7ks+fYB/dmpFAv/7Jyfrh71259Tl9WOm8tG7JoWYQ3E5ApYQ5l0SR8GTBImxAR7qxAECv3TwjtfFg7lwJsFdnJmFUZoTRJRpBgqYI0/+bmZurgdHAjW2VBQ8+Wo8z0tJSF26nwh6uuU9XS0dxbDrq/OoGjGdoV45RZHkwHGhmdTcA6blH5qf3sxn0xB7QyejKpZSvzzoTasF1CbZIvJ0UVYIJWH/fbDCsU/FVA14/XnWu8QDcsut1VlaBE97pQd8MbKVnEznQyJEKWEBwgQMia6Pskgi8cmU/AX8R23H4edxuwu4euMDklqEc6g5k9yuly22IS8nUUWDpsqcAvJo/ByYtJUajjkldYz6tnIjjtT8X/1vE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c6436b-b281-4743-5c69-08dd705f083f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 14:19:22.1215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Ichzm4pACOVovd7vQ+u+aJ0lAXCjtb2cQJRUi6iu4bQWud7QHM8dzpeOE7ROgh/RSmiilS+o8Tj1D0lPmfIPtWrNE50HUofjVgMoqBelhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5710
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_06,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503310102
X-Proofpoint-GUID: IwwnspGKntaltvNnmYcLU474yCPxdAT3
X-Proofpoint-ORIG-GUID: IwwnspGKntaltvNnmYcLU474yCPxdAT3

On Sun, Mar 23, 2025 at 01:53:02PM +0100, David Hildenbrand wrote:
> On 22.03.25 08:21, Lorenzo Stoakes wrote:
> > On Sat, Mar 22, 2025 at 07:17:05AM +0100, David Hildenbrand wrote:
> > > On 22.03.25 06:33, David Hildenbrand wrote:
> > > > On 22.03.25 01:14, Jann Horn wrote:
> > > > > On Fri, Mar 21, 2025 at 10:54 PM Lorenzo Stoakes
> > > > > <lorenzo.stoakes@oracle.com> wrote:
> > > > > > diff --git a/mm/mremap.c b/mm/mremap.c
> > > > > > index 0865387531ed..bb67562a0114 100644
> > > > > > --- a/mm/mremap.c
> > > > > > +++ b/mm/mremap.c
> > > > > [...]
> > > > > > +/*
> > > > > > + * If the folio mapped at the specified pte entry can have its index and mapping
> > > > > > + * relocated, then do so.
> > > > > > + *
> > > > > > + * Returns the number of pages we have traversed, or 0 if the operation failed.
> > > > > > + */
> > > > > > +static unsigned long relocate_anon(struct pagetable_move_control *pmc,
> > > > > > +               unsigned long old_addr, unsigned long new_addr, pte_t pte,
> > > > > > +               bool undo)
> > > > > > +{
> > > > > > +       struct page *page;
> > > > > > +       struct folio *folio;
> > > > > > +       struct vm_area_struct *old, *new;
> > > > > > +       pgoff_t new_index;
> > > > > > +       unsigned long ret = 1;
> > > > > > +
> > > > > > +       old = pmc->old;
> > > > > > +       new = pmc->new;
> > > > > > +
> > > > > > +       /* Ensure we have truly got an anon folio. */
> > > > > > +       page = vm_normal_page(old, old_addr, pte);
> > > > > > +       if (!page)
> > > > > > +               return ret;
> > > > > > +       folio = page_folio(page);
> > > > > > +       folio_lock(folio);
> > > > > > +
> > > > > > +       /* no-op. */
> > > > > > +       if (!folio_test_anon(folio) || folio_test_ksm(folio))
> > > > > > +               goto out;
> > > > > > +
> > > > > > +       /*
> > > > > > +        * This should not happen as we explicitly disallow this, but check
> > > > > > +        * anyway.
> > > > > > +        */
> > > > > > +       if (folio_test_large(folio)) {
> > > > > > +               ret = 0;
> > > > > > +               goto out;
> > > > > > +       }
> > > > >
> > > > > Do I understand correctly that you assume here that the page is
> > > > > exclusively mapped? Maybe we could at least
> > > > > WARN_ON(folio_mapcount(folio) != 1) or something like that?
> > > > >
> > > > > (I was also wondering if the PageAnonExclusive bit is somehow
> > > > > relevant, but we should probably not look at or touch that here,
> > > > > unless we want to think about cases where we _used to_ have a child
> > > > > from which the page may have been GUP'd...)
> > > >
> > > > UFFDIO_MOVE implements something similar. Right now we keep it simple:
> > > >
> > > > 	if (folio_test_large(src_folio) ||
> > > > 	    folio_maybe_dma_pinned(src_folio) ||
> > > > 	    !PageAnonExclusive(&src_folio->page)) {
> > > > 		err = -EBUSY;
> > > > 		goto out;
> > > > 	}
> > > >
> > > > Whereby we
> > > >
> > > > a) Make sure we cover all PTEs (-> small folio, single PTE). Large
> > > > PTE-mapped folios are split.
> > > >
> > > > b) Make sure there are no GUP pins (maybe not required here?)
> > > >
> > > > c) The folio is exclusive to this process
> > >
> > > On additional note as my memory comes back: if PAE is set, there cannot be
> > > other (inactive) mappings from the swapcache. So whenever we use folio lock
> > > + mapcount data, the possibility of the swapcache (having inactive mappings
> > > from other processes etc.) must be considered.
> >
> > Ack, do you have a feel for how such a check would work?
>
> Likely under folio lock
>
> if (folio_test_swapcache(folio) && !folio_free_swap(folio)) {
> 	/* unable to move. */
> 	folio_unlock(folio)
> 	return -ENOTGOINGTOHAPPEN;
> }

Thanks! Will adapt.

>
> --
> Cheers,
>
> David / dhildenb
>

Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B2B33F7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 00:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743640410; cv=fail; b=lRVhBQ+8sbhb7/0CQ3R7+CMLurKewqeNm8fh1NN9SwBeopS/t4KRhFCUOgx8aLPsIewWfiCqV+4r6uQUTMPanNUR2ccvTu/t1p/rDywIRrcVlkrH9kNyK9O2B309MKDUFabfT5MQgdl+BOWPnmaw49Ru0cJliF1nD3uVIOPKBcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743640410; c=relaxed/simple;
	bh=mUvOzAMBNm0I6zizmURS8RS9jYY72P0eUkRc+LC83+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WJNAvnr50hSkYqYyZ6P2PvSqkb1v+lwREzjLc6YTeHS6uY1t4ori6SRsNGKdnNgUB4Ug+lhfU8EFbNmfQV4hOsBBLs8I7PoQvKqApd0WqaN5GfH5FhBbB3KR3f8UFeHU1rWoVrzyGQlvUDDuoZu3IrkuxK9KdR4MfsV4FJp59HQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ISSaIgtv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TNk7I7sb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ISSaIgtv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TNk7I7sb"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532NMuHO004452;
	Thu, 3 Apr 2025 00:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=WsAoSsfoKU4Rg6stCVpt7F0O9dpfLCh7ojQdd95yxX0=; b=
	ISSaIgtvoD7fEQ0T8VygF8XNxRim2Dh4zACNMsvtY37hBX07NR4pnAy2srKHnEvT
	PKEqi8X3FpJm0xuVO0kF6aqmN3NiDLRlnsOIzTFRptRJMIYdK0zRZfy7Gw8BdT3z
	hJvSY6aqjqNBNQCnfD5alyp5xr+bjbA05vRosvyTRGKkcU9mr3TMcjd/RdKoE4Ui
	geVKToR/Hgq8VMEu1JR9wEAk/xJIbgPmrAveJpyNzBs/+ssIejf5QEO/yStET/FF
	7CnSPXNfbkdOIIJlQkLYwtkrK81NjsmXnX4FtUa/4xjzTSBAuIpns8mtXoOum3Kg
	Sdu1bym1GgUAyVyJbRviuQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p9dtksc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Apr 2025 00:33:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 532MfxcG003422;
	Thu, 3 Apr 2025 00:33:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7abag5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Apr 2025 00:33:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdZeQkxaJwAMQ8M81MpMXODo4i5+HKfF0QhAswFZHUGSQJMOFjMYDj6Wm38Lc6rHms9ymZfnNZQ31KG7aYjwSHU3WGragncAqBOXRD/qHiuieCkNPpRs+V0/nDurGlrs0OjDUwY3mKPOOcYnKi8tuZxGYQN19HJYFqrpym0L/4jIxiVPyT5X+nLhwbMNqneCLGn3ui8XKEvZ9vXRhg/RQxOjcDUOJgjb71HTXyj0wGy9tB8/j5IyziqIhhPPTUW5+ulELFU45wqPeMCp9WuZTdxnY2Y3zUgrvBC7FBdg0FModyPAjSNyMFLd+HUonRZcwReQF9AZ5mzi2Ig/noRHwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsAoSsfoKU4Rg6stCVpt7F0O9dpfLCh7ojQdd95yxX0=;
 b=y6F3dVbQYwIxhqNDQUNikbFhpsDae6hevVfAErDXRxhvIFMHh0ODlGIwkr6USENoPBh7koN53IDXEf+vHCRc/EaeJJx5EnuquhPqSwOM3sdUXNkl1+YBbAMO6LID3vjbsftB8DOUcLAvqe34MDxlR27TH3Sq07nXmby1Gk8PvM4WkdVsonWqIrDFx/6hFNqeK/ym64sBvW9q2ZI4w+4OL1gFuVR/907jVh432zXW2et2YQBDE/7vANDMWfLL5sbt7jKr6Xdvox48ZEg6ESneAPUdunEi9L7q6/bBUYKQZ1G4gVjH2tjWHBiWhHdA3QsVW2AeMdMHSVJOyYWvUhlZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsAoSsfoKU4Rg6stCVpt7F0O9dpfLCh7ojQdd95yxX0=;
 b=TNk7I7sbqHiQBlZ6wTaGgFMSZdWN7b4f4SxNmFVYARhZFG6Ufh7eDC1H0E/KrBHtKV5/FaWycd9W3Cho/GJvPAukpJcreDJjTfKkk9MlnILV05i/uQNsNJWx04htn5ymQKFTsBLgMOfYvD5Iqqi3Gf8RYmvub1X4C3mqh5aALTw=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DM3PPFB0C5EC304.namprd10.prod.outlook.com (2603:10b6:f:fc00::c43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 00:33:16 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 00:33:15 +0000
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH] test suite: Use %zu to print size_t
Date: Wed,  2 Apr 2025 20:33:11 -0400
Message-ID: <20250403003311.359917-1-Liam.Howlett@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231101171629.3612299-9-Liam.Howlett@oracle.com>
References: <20231101171629.3612299-9-Liam.Howlett@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1PR01CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::25) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DM3PPFB0C5EC304:EE_
X-MS-Office365-Filtering-Correlation-Id: af8aa12b-21db-418e-ae9c-08dd72471fbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g/zvtZS+lWH3rxY58gyxCtCtPDTKbHnAs9lDJY9P5p3QnpNeRa1vJpeiFL+w?=
 =?us-ascii?Q?PfrVftn11x29oOeRtpw8f/9VPe7e0lCT7Cjq3aPdn+ACFkvlNEuPurN3IdCh?=
 =?us-ascii?Q?azaM8CYAp0aDo1swkiGnUl1qMV0dGDrzL4KK139Hf9GxkOIsBsZkCzcNAfLD?=
 =?us-ascii?Q?zn3482cmy/zbZjzgK6z6hPl4fc/DLWV471Tmhg7eMhLJdP4glExbfVVbBMoI?=
 =?us-ascii?Q?1KH2Xu5msuKgSn9xECW3UCOIVxjjpPf9mxYi3OQL93OUTdXVZ/lK55eAd/BL?=
 =?us-ascii?Q?qCg5lSfi3tESmPK+0nX6D4yOKA2rxY1+yBEEsLdcnP72RLlLZGQHCXpqRQ/k?=
 =?us-ascii?Q?FiYJv+XOeNtzVw6oE8xq7ULi0/drY5ggckaYIZvPW+njtu+PWE1JpB9VNM7e?=
 =?us-ascii?Q?qtnciHKt0ESzAFbr7kvo1xqRd8tFi/PrOOCHu0Dlh1wxlNukiQuk8G6jY/B8?=
 =?us-ascii?Q?dYDNyDYITHAX6ERHG+go5uxsC7SitxD5GPVK9GwNpLXgB7qhBDK5Xweb4Q9n?=
 =?us-ascii?Q?KCMkhdbuR/QZJ9YHFagTnDosDmbrLCzsYzCWwC3eJifkDark2OV1b5PA9Rnq?=
 =?us-ascii?Q?Cpb2e0oXfXOCuYPFimG35ANz5r5QLApbK+/u7BleMRWssrm5mXSrHcZR+D0l?=
 =?us-ascii?Q?r2IrpNWJtTlLPxaNQFiEwnlLBe/lsAAXPiCvekb/vlnj1KOknxLf9TuL7nNO?=
 =?us-ascii?Q?CAbeSPXTmS0kIsKo27/9Bp4rJhkiaI5CRnMnCWhe2BgH7/1f+n5eHLWRAczj?=
 =?us-ascii?Q?QTdB9CZlp3jRIu4CpoxZ07Ak0/TjbIn8/gUCpPbppt2MUgnPsJYbcYyvwpxz?=
 =?us-ascii?Q?CVYdzmRNmI6pCjuvNjiQBUJ1s5VI4SaLnTeAqs4tHkyufAHLuQZuClMl1UqR?=
 =?us-ascii?Q?/oiwWySd2GGEMYLUgS6RYSVLRNs82I7fjqDDMca+0P4H9B0mAyqcN0/PKHAT?=
 =?us-ascii?Q?EghH1JlyXnzVMILjwtsg0YYZrc5G980oUi+Jq/572OqjuxgxB77dMGSuVWHV?=
 =?us-ascii?Q?ZjhMmKnDUN5e39jt1Sg3GctfthT0PK6IPgSzpBeglblve9vNOe4MRcazDBYA?=
 =?us-ascii?Q?2OgBK+Io0kBlGkcuYiTf9007HMb1kiKu0DiPo+BEadYn8GfDkiYPe8SoPQ8K?=
 =?us-ascii?Q?PWdYz2jVQL5ZBkGKDSi9ZHqIbQNodOmdXjImoTtrAAHMYoDQBMlLgbhlPy3f?=
 =?us-ascii?Q?5ImwiFkQO58gaSJLUXjJ0zqplj9r9cz9hlfWgrMmV7vSdkmI/yWbaXmXu58m?=
 =?us-ascii?Q?cUlXiqLwOeh2d3MRWfGKPJkWZ79pC9c39ao6PLpYI14GxvG4xwuLlkJRcU9s?=
 =?us-ascii?Q?rdxHpEGv1TzXAX69SEp0bb3jUeZnLKNfPbl/PafgVA0u5w5IxC10xjij5j3P?=
 =?us-ascii?Q?ETfxEkbIFgLK6F2Y8CKZMYRqjVQT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EIC1BOUkyebXLIPVpwCOmecGllqBiU+cbB+tjlmsSuSXxXbfCd///ae4EDT+?=
 =?us-ascii?Q?847o6H/vXAQU3NRgYnq4skzVhf82R6PcRC1VJSy7Y7iD9VjUL9S8fpdSEGa8?=
 =?us-ascii?Q?56GViTWLeVQt8+B+02hKqUjVqSZzCyHZGO3ZYe6id78YtYWerNMfyfH2LpMV?=
 =?us-ascii?Q?1z7RGldGrkDEngq88B8V4ivRHJm9NynM3qaRvikA6gNy9eMiJoIUoeg4KSNd?=
 =?us-ascii?Q?TTOhnh/L3K/YZv+OY/wmL/h1oY9SITHZ32VSMdsdoisHtMxzZzsJ5M0HMVDg?=
 =?us-ascii?Q?iHCiMMSv21U5eEGUd4ygWHZK86jzYu9MBVK+imkuWXJl0jlE9ewwXXB5bnvB?=
 =?us-ascii?Q?r1XQBXOcQpVG1Wx2As2d7Cl9/4f94Axv6WkOGCyFNvYhdJRxQAP6f78JcGsY?=
 =?us-ascii?Q?x7fNsdQVyXQHeShwpdxZdELgLzywVuYmYiLhGHwOSjKC45i1qSMSmCPu8whw?=
 =?us-ascii?Q?r6otil4SOdfKYJkT5N7RYSQvLjTvV0Pvj9Wxgz6iYaWjmnKiKaIP0VTsrbPL?=
 =?us-ascii?Q?+tUIBMJyxSw0G14oXR5NqeaSQvgjnNELBeKcYXQEJmd0GtVCQdiomwDCe9au?=
 =?us-ascii?Q?TcEVioQYZBHkn6pwhRcTG6WBbOqCMwu3fl2w7M5RXoVVg/9Ze0Ail9QxzWqG?=
 =?us-ascii?Q?tUlHkwHKIBVKvY6q/jEQObV3whRcqDr/SOb2SDtTmO7+RWHdqkol7iAkNbWw?=
 =?us-ascii?Q?q5O4xdo3sT0HjTlonKhhmpgL+UmoYHxS4xyymyPTmstkgw1lzH1uXL60mY+7?=
 =?us-ascii?Q?srwbCAGUHHv6YI3tjdbz9xzcXVgZ51os6Gus2TQN8ydZc3rFhY9sKCu4jleH?=
 =?us-ascii?Q?+aWTL4XF/aKvG2NIRkalP8iaAC9QIv6+8CE8XD78zC4gx8anKgtUkkyLTsh7?=
 =?us-ascii?Q?l+kBu/JZirsR1GOV3dYgPm3VR+Rq3IFCfZE9GZZQavpRZjpRVT5U7FQ0bMHj?=
 =?us-ascii?Q?EqahMy2LKRCragG2thVs38eAly1JSGREqjkH36i2PBQDcNHJtK7OcBsJ2ekc?=
 =?us-ascii?Q?jqsW67E3hEGiSodaJrTFGjztJmOTw8PeQUh+M8xwdoEwO7ZKooUgHaST2Mrh?=
 =?us-ascii?Q?GpjJhOhGCWf/jkaZ51C+fZ55GUyMpB8RCkEATnZ6XBby/u2cv52Mm/qxhyou?=
 =?us-ascii?Q?6dHmPVIMaqHUMSsmDYU7EKmi1enCsGYKm2A6S1kFH7304znFwK66xUkZqOR/?=
 =?us-ascii?Q?YepWng19ibmH/7cZzBWm7DXrrgeRjR3YXU+MRVbz5tWIUtSBrHq+nuwCfJ1Y?=
 =?us-ascii?Q?N2aiRZBbD+bei20afDhIyoHk43PckIFcJtQtHuU7DT1M2fTLtiw/GMuBBq/M?=
 =?us-ascii?Q?txNUS6vVkeX5LIeXWbX2DPEyENfCxD0n/a+n+AWq01Ij9bkpE7hzgEEHJNeq?=
 =?us-ascii?Q?s1aO9XqPJt2TeRigzkABvvrmesaezEWVp2B00p3L4ERKAE4grLz8OBJGhcpc?=
 =?us-ascii?Q?jTOizh7gnbaxBAM1iJnn8MabxhS1VUbh6khxeCRyh3n1MBw8x3lKry+rONCr?=
 =?us-ascii?Q?u3+UbME9GQRe9R2cX97rx73sTbZnN4py4kpovTAmvd/VVmrxCkFq91GBre1Q?=
 =?us-ascii?Q?pjjPO9sjnXZxm2XWgmSEggjmClWf+E0HGvrUVbXo?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qLEJYTbKw+wrlfPj6n/QqstoV33mf0aR/9+D/4pAV2XUJpY7IWj9oAUBL/xIqqp74WBH/rAnQoJwsA6e+r8NzPU/pWKK4C6kRaDYcxqR9GFl/VYnrgkZRkV0NarlNdk7OmStq6gi6GGq+81j4nRCkmyjcVFuzLR/Lqg+2/wVvr4jag5ASyK4kplYIHujP01E6UEnPhbO649gUvoBVTmEG5Kj0SLUtbIEgZUjLk5jAocXikCGnc42Xhk/zWNpv6icB1BEaTPJ5E6oyTP2Z1tVf1GOJQS4DyqrAyX+R/v/AsTPcy/3/9/9rM2fzzNHkjO6oh743iTFk4vEWSo1B60xIZy/TFkhs1Hr+vmk7dIjgZ7ONpP2POzqLlBqq3tMe2p8hUEjRsC81jLod40oO5xFXBBs5FYTEsxLVY129T3brr3jFIvuEny2oA2r54HBuBXd1tT2XV2ucVXuavcoSmfQhvRmMO9fZDTSkY/ctBEC3G0SOpjvLUPTY4Bf63YtM8LMSrw0FUYwLqMGTwMJWLhsRBH9Z3QMoRrW18RVfSyUuCdXPSBPh7TOmI3l7Y1omHRbPR9U6r92ZMBtG4jpE9DYJuMJ0eKiO5boBW7PB2sMn1s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af8aa12b-21db-418e-ae9c-08dd72471fbe
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 00:33:15.8753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5f3jotaoMhzqutxuAl3i9BU0v4g03UA7ou07Tz6bkxN/CGJWPTuhQlwVetFTCHCwXuHLozhFZHm5f4WY5aeFew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFB0C5EC304
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_11,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504020155
X-Proofpoint-ORIG-GUID: 2Gri9HTPS77PU7lIELcfOOKrLGvG0134
X-Proofpoint-GUID: 2Gri9HTPS77PU7lIELcfOOKrLGvG0134

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

On 32-bit, we can't use %lu to print a size_t variable and gcc warns us
about it.  Shame it doesn't warn about it on 64-bit.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Fixes: cc86e0c2f306 (radix tree test suite: add support for slab bulk APIs)
Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
---

Note that this requires the patch to fix the headers [1] for the testing
to build.  Unfortunately, that has not landed, but the patches do not
conflict so we should push this upstream anyways.

[1].  https://lore.kernel.org/all/20250321-fix-radix-tree-build-v1-1-838a1e6540e2@samsung.com/

 tools/testing/shared/linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/shared/linux.c b/tools/testing/shared/linux.c
index 66dbb362385f3..0f97fb0d19e19 100644
--- a/tools/testing/shared/linux.c
+++ b/tools/testing/shared/linux.c
@@ -150,7 +150,7 @@ void kmem_cache_free(struct kmem_cache *cachep, void *objp)
 void kmem_cache_free_bulk(struct kmem_cache *cachep, size_t size, void **list)
 {
 	if (kmalloc_verbose)
-		pr_debug("Bulk free %p[0-%lu]\n", list, size - 1);
+		pr_debug("Bulk free %p[0-%zu]\n", list, size - 1);
 
 	pthread_mutex_lock(&cachep->lock);
 	for (int i = 0; i < size; i++)
@@ -168,7 +168,7 @@ int kmem_cache_alloc_bulk(struct kmem_cache *cachep, gfp_t gfp, size_t size,
 	size_t i;
 
 	if (kmalloc_verbose)
-		pr_debug("Bulk alloc %lu\n", size);
+		pr_debug("Bulk alloc %zu\n", size);
 
 	pthread_mutex_lock(&cachep->lock);
 	if (cachep->nr_objs >= size) {
-- 
2.43.0


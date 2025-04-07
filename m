Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031D51A8418
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021505; cv=fail; b=swVuOqDup3aZICesM5p/SVH/utQtdcGTixvmw/FuAuYUOJXDAvNQqzrWyb/k+UFsEdxUPoKDk1IxmeJXZS9hZ7U7gg+eJxowjlYzqVGjPZWpIhXTtKV2KEAv9p8yy7pqhZZ5e3BKPXPP3sIz7Mn3baxkBfevY+mdmYHHicMTJr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021505; c=relaxed/simple;
	bh=THMYcDwAc+j9CQvm2qXi5Fku7URqDwrstB44oGfy6aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BQlSXD+NuGWtrn+OKooX0FvbDPjhz0LzVFNo7HbDYf3JX8ZSA3JU0gbgr5J+Dq8f0A9RaUFnOsyPHiOkEid9ZeOEbCPp1MJeFpIbaA1rWUJ+5UfIlf7Dtue+jS1jeqaChiwtTEv9V6xRreDsAktDv0sliNRkZSwEen2pwiz6yZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LNR+9Tm6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ND1aZ5iy; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LNR+9Tm6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ND1aZ5iy"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5376Y78P029161;
	Mon, 7 Apr 2025 10:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=e3X2P582+E16K26ztg
	DRaFhscUr6B5uL1VrDN35qqkU=; b=LNR+9Tm65RTOQZh4bXDIXUwaMHDtq8sYuv
	2+9NfItZuO8KYpBRhb2eC2SDkfQkqPrMZ7aZlBTir0n049nE3d9KSFKfEUo89B+6
	tQi9COjx7Ohif6HdNtSV/YXQ12OIkX959r647+2xOFtlENuZ2fv4OlEJqZmx95xY
	CZyU8t4eB8Ooy0++90F8hFlvWHEUasiK89B6TMIBlMiLe/dt083y1Bl/9KrF34ZZ
	WVEH0GzFCoohP2kOsapj1B1MUd5Bsq48FyNiJ7snHool8nSNT0rCCn24u+qGmbX2
	wUV3NPFT89pB6eKbVUnHcYHvalErAFvM22dW+C+kzkMum6x3Vp3Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tu41a8yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 10:24:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5378lZwu001830;
	Mon, 7 Apr 2025 10:24:24 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45tty7kkx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 10:24:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+vQncwg5cob8RMn3qzqWHw2D3YyVAe3RgaOe2R5/fnBoA6/mJaO/7qoxM8NujzKxolB1txNgn4Q0mcI3Rn1cKb6PhSRHhDaMajzIVItQf1W6Ogv4g+D1RbThi0L/htc1HfUd8LJYTHNb0GPvnBHk9O17UrKf7xx2ETLdCI1aiv08HmZYGLswjLMWKWbuayOTleADf8Kc/wYJwJQIxdMNQZ2JYU0JWiFpwgYyraxFGwJg/iva0V45u7oyuwaDX5u5TXsslXZ/9je98LdnKX0TtI9GX+s+gj8U0Az4asXDhSPlwBzOwQG4o8RF55zcVgY3qxxPy3QuEBjdfjkdtcHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3X2P582+E16K26ztgDRaFhscUr6B5uL1VrDN35qqkU=;
 b=fGLF+6fj/THCz4nIBwwQP5j/pGcUsczG+PFpnA+LoTHnZuzOrOP2ek2eV+i97F9dP9hDSFYM/O5G1wZ/TUk0DIX3x0+GWRTaYjcoAiDuyEkU4XCjJZxxL58t1uW6UhwDk83ocTabGkOjGqd/Hv/OZ153QJJg5WY0ymoAdweuZzrbLhJWvXTXZgiK7z1Ok0ffkQQIdn/axutAqKjO9eIOTTsRRycDujatq0UAP2gl0CE0ZuRM3p7yqpM6CvEfXHNgIdmsye/VSQOc1OGt8m2w0WJ2VTJOjBejgD29kx6CzXgtrwk3cnW5NT9kwFSiPEE11TuyoJrHNWb51gx5Z29D6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3X2P582+E16K26ztgDRaFhscUr6B5uL1VrDN35qqkU=;
 b=ND1aZ5iy8FdWxKA6G7hY6LNG6puoRy+rqKUG3v4NX7IuUSIN3sm6k7jL0Bj6vrjhyMko/sRZHEZFyA3K50MrDTM27f8du5Mmsd6GK3EOXGRI5OLWA/5LcrsXrOCj49AUXEPjLdtHC5lyss+zqljTAf9wQgrQAYEx7pOncMAZ278=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by PH7PR10MB5698.namprd10.prod.outlook.com (2603:10b6:510:126::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Mon, 7 Apr
 2025 10:24:20 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%3]) with mapi id 15.20.8606.027; Mon, 7 Apr 2025
 10:24:20 +0000
Date: Mon, 7 Apr 2025 11:24:19 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mm/vma: fix incorrectly disallowed anonymous VMA
 merges
Message-ID: <64847aca-bb02-43e0-8951-33f18d6af193@lucifer.local>
References: <cover.1742245056.git.lorenzo.stoakes@oracle.com>
 <ab86a655c18cf9feb031a9b08b74812dcb432221.1742245056.git.lorenzo.stoakes@oracle.com>
 <20250404125315.5bou5ays7u7sv4rb@master>
 <2fcd2760-0116-491e-add2-c3277d5bb19b@lucifer.local>
 <20250404233231.bk62hjwq46vnrpmz@master>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404233231.bk62hjwq46vnrpmz@master>
X-ClientProxiedBy: LO4P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::11) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|PH7PR10MB5698:EE_
X-MS-Office365-Filtering-Correlation-Id: 63e18df9-a514-47f4-1110-08dd75be5c36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FjafOLMiZ18I1y6XpCDxgkNsN4ueHfJlcwFJpL97GGguWtI6/HqJAGIQoD5e?=
 =?us-ascii?Q?2ffQh27/KLedryYUCsuzO8xp+WY49lAgSp0kqx7Anz5HWoycBT5D8ArFVB9s?=
 =?us-ascii?Q?RxTOUqlQXiCIwpfoQczzrc3Ov/WqcgGsXhjK1CMCcO+a3C5UOW3VN3VRTcqV?=
 =?us-ascii?Q?9QD/0xxB5hr/UL0f41w8vzQldS4OiIveDIEVSN9m4whIybkAlrgTlqmaXDZU?=
 =?us-ascii?Q?Nwx+HorX8CqtESlqdIHsS/4mqw5Zvnm/rSreO5HcW7qvi6zQCXqF8f6tMNhh?=
 =?us-ascii?Q?tE2QfrCsGdQojrCgQXXWdvEqIPLM+PqT1Y8NaJcLeFyFFtmyhJK0BW7zmW8B?=
 =?us-ascii?Q?nNO+31jtR1u1vQoHjmK3R3WFr4Qq4PfPxK0Bughr95dBS15y9UKI30VTWFfH?=
 =?us-ascii?Q?1pxyADA0xeYX8rBy9UeSPXvV6GDmMDwjAl8DBHFnxGAJVFCaLx9eiA3XXuOd?=
 =?us-ascii?Q?fB1C9EZriIwGiDCowy1Q6ImFMN5Vl1XyhQSv9/R+WC1XjfexyMbb21vhYTxt?=
 =?us-ascii?Q?CTy8grTYlXsqJPv/TO4tGutq91dONXxXBDDamNxAn3UIKHbz9m7qL6aiSjtP?=
 =?us-ascii?Q?pWTJ60HbJqwg4XxaJNU9Tz60FH+UorzqwSfLYkmMHlC5dkU08Qe2JtAvCAex?=
 =?us-ascii?Q?MqrYFtGIt9tnw82WlqutCfHRKXkjuvmxHvDwsjFuvQ5xVy4Pc38w8DQdHJQm?=
 =?us-ascii?Q?jl414mLFnd0lKhcs0V6gdNke08O2kIjZ4+gt5hWH6AeFYxjmg0ze8d+Ocf3n?=
 =?us-ascii?Q?GuN91R3dglwXYrPG/Wij6oM2DSCqRtdmXidIDXMALuoNgRLz4gcMEk28y2w6?=
 =?us-ascii?Q?nvfVvo5Yd6qF/KsEr8/W3NTPjI0epQOoQ4SUwIHwlXi+9XdD8xObiB4ihQx0?=
 =?us-ascii?Q?XOtn/xKv6t2JkAGx5buF8iCGSaTXdQ4WqWrs9STg6uD/h84dqd1nTcIRSljY?=
 =?us-ascii?Q?HjxVo/+AZ1/7/DHD1dh7GJdn5JP80LO2G8MQkjRVHDAs6CBz/Oj80EbTO1sI?=
 =?us-ascii?Q?svy0ZzZg3ayUgN3++f6uLA1z6Dl6s970zkSemDJC1fCprLVSOVqCe/C0GMw+?=
 =?us-ascii?Q?Qqd0g+aa/qLzpWDA+0KGgdKHhdu525rk1umh7jMf+w7lBq3BY/s1t9DJ9sJZ?=
 =?us-ascii?Q?DFlhkYldkVzKn1m3nEWlrsBvWwK1iXCx8C4HDKvIBPDNewqtPGxp7VHg+9pc?=
 =?us-ascii?Q?XUn6Ri0++WjBHmcRe8OZbQTvhSzKMepcruH1eLUTdSX1AtSRGBK6iW/7e7nA?=
 =?us-ascii?Q?/RIlSP1rtxJ5PfI4L8HeRYsiltaHB/nr6v5Ax8+iqhoQE4AkqsTR0raN5GUk?=
 =?us-ascii?Q?Q3Ku7Qv6rrIs+2Pzt9Q1XmRshwAAuTkyRg6/smYCEZITkcwRDenXFcRnJU9O?=
 =?us-ascii?Q?zni76TZlgl2zq5J9KAnFxbeHUvau?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?siYrnIAlrTBHrad7HWh1UduLghkhod9fpxwzty7UIwCWOB1UOZ0kdO06RxR8?=
 =?us-ascii?Q?OgpJbx/HwfNZXNcxM0uhUnZSbG7lk4wC0ZxOikOcvAvO/U+lb76gsFRH6ZSt?=
 =?us-ascii?Q?v2giBAxHBGbedFiwxXmhtpnwHWF1jkSEckJIKmbDBKO6cmIdFg0rmsHxxsQv?=
 =?us-ascii?Q?QFpYuz3xsqVMY7vLfzPXkWa/O1QfX5yJknTbF0YI7Jp30p9WN/NWjwcHaLa9?=
 =?us-ascii?Q?KrWecuG/mGMTuRTdiQTB9R7HR6+FL4wy4ebyjtTfVHvMvnTOIN877TPyCXAC?=
 =?us-ascii?Q?cR6MciTNNt/cNahDVn6QfGHHDLZDt0EdMpYCxyOsyKwDHprcQnN5obs3LPlh?=
 =?us-ascii?Q?cDa3c8i7HmhzkNpXJm9COMe5+Z3cm3Jnmn7+77yGwsdJ0FtmXtDqkBYUQzlV?=
 =?us-ascii?Q?yLxcr9t8+EWmqjUVtBREUHfAjsmptmQIxxy7xZjlJuPGv604OsV0aYWuCePO?=
 =?us-ascii?Q?XV7n9lv/Qm4Lvr03VELmzmFVz4M1LO1FMdFpSt6OlJnPZWmZ+WmBop4DV7BV?=
 =?us-ascii?Q?ndwm0WXYw74m7beKZcnPDA3MkCFKci+NFzIKLCg5COtoUv9eHczMPm4rhMIf?=
 =?us-ascii?Q?3r4LLCmIZdH8AWVJqiDadFcWJtVKffdrvxD9cvadh/LbN4CS6ynf98o0cmkx?=
 =?us-ascii?Q?/8Wg30aw2dbH20LpdqcW0U7ZcClKGhxJxwWbrA3rZ/8xHXLixFaCtgNBZH0g?=
 =?us-ascii?Q?YNUa+uXyU3hHgocoqX6dyrE4ZyAwwH5UhIprZLUM/EOMdIn+jvZhbFcVDiSe?=
 =?us-ascii?Q?KgHaJHk+lulkAvZA3IBCsPfNxLQYlZV57dFvgol4qbXdZyHsWFSDL8RHY1Ph?=
 =?us-ascii?Q?albGmDu21pHiTH2TC3O+1Bp6J7PAAkNCw1Rhzd/ij1x+j9/eAxE+guonBND7?=
 =?us-ascii?Q?D1ODkfljbyi/FlVwkmSyb8PuQ4Otcb7brjIB+SnJ7C3hjtUq1nrB38e1x57a?=
 =?us-ascii?Q?/lIWrkSM2HkizJCrGSG4Jb6+0iIUdpBFmsgRjNpSE20udk6bQq3/wTp6I8Bg?=
 =?us-ascii?Q?NCdy6SKXp49ZdGrrZqJunI4YmRsaK3LDicCn839dXJdL8iQnDOBv+QIUDUEQ?=
 =?us-ascii?Q?PHRZqNQ4s8qgtvoKuJT2S0S6lryGF7BhQm/yWryA5vrl3+EBE3QX+MapTJfo?=
 =?us-ascii?Q?apwOidthRMx9G57Zwjv2aXjJECqSKN3PkuNE/9ICWGezNvKf7BgEhUr6/IP6?=
 =?us-ascii?Q?OpMs4LVTCBO1UpuuDoJuTfQ9sOf2MU3/14R9F5rTU1mVv6o78J8BSgxuG7Jc?=
 =?us-ascii?Q?v1XzuMoalsMyvpCAFNb3SLNgsr6KPYxMM7hrZDZD4g5FjnLYtdJ7wvhNEElu?=
 =?us-ascii?Q?1RWh5MRm4RCqT6vSlVOHL9gQ+bNeMWjX+M/UsQNr2VURUw4RFlalF7X7jW0m?=
 =?us-ascii?Q?JijumRaCheRrXTjZWmCMreSh6ApPu2AKclDVYP+gd+Gt7zJW4ylAXIbQPSj4?=
 =?us-ascii?Q?T5zUGEXbIRNe4SwT3SLhOvPFhHT4Jv2ywabVxvimwq+9R0v/ferJHmw5k/Eq?=
 =?us-ascii?Q?EZtmn+aWmbvTLoXV/JWLqIp6SuVwOkdN8KtdyHC72Q7FRGodpYvQS6YUBGS9?=
 =?us-ascii?Q?hiE0kSUruhPfRKd9Q6bEUoScGs2dHeB3c011mN+MkeiQoQzqTbsKElSiaY1F?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	97oUMtZLWMsUj53CpyOmd/mz9IeygbuO7MnpVX3Jw4mb8DkU52676r33F2SNVgTLUb09whYkRgl6tJ7mYYt4ikvzUdmBfzQm1E2aLQ1UmsxJh98tAuxFGCOYuHrdnSayGXsgLX1GW1I0gj5Cybz2GlMC53sWnMDhEQYtIH3DVIqgJakOhC+0g/I8oduXxe8Hf1xjwdfoiACZPbWRPUpY6OeOxQk1HPqLdBxKijXMdb7QWkMUKm5Gjc7IxjsSHfId8gvnN1qUV8x0WbbMufg+wNieoxdWSKPgQVCYiZIzRKzs+Kjg/h1m+n3Xk7JM2cV9dYPS8ccvJDGcrJP+DiWPZgsY2Sxm5GPl46I5P+MEK8BkI/dctgQ97jhj5ROTxD9aziJ9K5WJJPrNfNp6cda6HQnk6E45ZNp9JNJAL9+akFdikI7piNoQL2Tu2rGW/E5KXkZLlcRKS1yjdwvjWFxUDCdQ3V91954csOTQKOIbHekNlwF5+Tz3ojXX61sriqBe3BGtb3f0xqaiSl4sM2aNTlukYmQb7xdIfqwEmPysZO1cXb1J0sN/UsZCyD2pcXut+qDvn6rnfEatUxxg3ts42leV5aQnEDAUHJpWeuaMK60=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e18df9-a514-47f4-1110-08dd75be5c36
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 10:24:20.9060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2evp6ATVZLFGR3CpWVGT4PzLq8LDLgE3Nf+ulHsqksx1l644nwEiUEC6DUq8BLyFm+NOo9o9YduMblXtx0linj0pDJ1SwArvKBr4m2gFH5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5698
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=914
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504070075
X-Proofpoint-ORIG-GUID: pjd6sT80Quf7SixuFmPaxbG2r2V70rY6
X-Proofpoint-GUID: pjd6sT80Quf7SixuFmPaxbG2r2V70rY6

On Fri, Apr 04, 2025 at 11:32:31PM +0000, Wei Yang wrote:
> On Fri, Apr 04, 2025 at 02:04:10PM +0100, Lorenzo Stoakes wrote:
> >On Fri, Apr 04, 2025 at 12:53:15PM +0000, Wei Yang wrote:
> >> On Mon, Mar 17, 2025 at 09:15:03PM +0000, Lorenzo Stoakes wrote:
> >> [...]
> >> >However, we have a problem here - typically the vma passed here is the
> >> >destination VMA.
> >> >
> >> >For instance in vma_merge_existing_range() we invoke:
> >> >
> >> >can_vma_merge_left()
> >> >-> [ check that there is an immediately adjacent prior VMA ]
> >> >-> can_vma_merge_after()
> >> >  -> is_mergeable_vma() for general attribute check
> >> >-> is_mergeable_anon_vma([ proposed anon_vma ], prev->anon_vma, prev)
> >> >
> >> >So if we were considering a target unfaulted 'prev':
> >> >
> >> >	  unfaulted    faulted
> >> >	|-----------|-----------|
> >> >	|    prev   |    vma    |
> >> >	|-----------|-----------|
> >> >
> >> >This would call is_mergeable_anon_vma(NULL, vma->anon_vma, prev).
> >> >
> >> >The list_is_singular() check for vma->anon_vma_chain, an empty list on
> >> >fault, would cause this merge to _fail_ even though all else indicates a
> >> >merge.
> >> >
> >>
> >> Great spot. It is hiding there for 15 years.
> >
> >Thanks!
> >
> >>
> >> >Equally a simple merge into a next VMA would hit the same problem:
> >> >
> >> >	   faulted    unfaulted
> >> >	|-----------|-----------|
> >> >	|    vma    |    next   |
> >> >	|-----------|-----------|
> >> >
> >> [...]
> >> >---
> >> > mm/vma.c                |  81 +++++++++++++++++++++++---------
> >> > tools/testing/vma/vma.c | 100 +++++++++++++++++++++-------------------
> >> > 2 files changed, 111 insertions(+), 70 deletions(-)
> >> >
> >> >diff --git a/mm/vma.c b/mm/vma.c
> >> >index 5cdc5612bfc1..5418eef3a852 100644
> >> >--- a/mm/vma.c
> >> >+++ b/mm/vma.c
> >> >@@ -57,6 +57,22 @@ struct mmap_state {
> >> > 		.state = VMA_MERGE_START,				\
> >> > 	}
> >> >
> >> >+/*
> >> >+ * If, at any point, the VMA had unCoW'd mappings from parents, it will maintain
> >> >+ * more than one anon_vma_chain connecting it to more than one anon_vma. A merge
> >> >+ * would mean a wider range of folios sharing the root anon_vma lock, and thus
> >> >+ * potential lock contention, we do not wish to encourage merging such that this
> >> >+ * scales to a problem.
> >> >+ */
> >>
> >> I don't follow here. Take a look into do_wp_page(), where CoW happens. But I
> >> don't find where it will unlink parent anon_vma from vma->anon_vma_chain.
> >
> >Look at anon_vma_clone() in fork case. It's not the point of CoW that's the
> >issue, it's propagation of AVC's upon fork.
> >
> >>
> >> Per my understanding, the unlink behavior happens in unlink_anon_vma() which
> >> unlink all anon_vma on vma->anon_vma_chain. And the normal caller of
> >> unlink_anon_vma() is free_pgtables(). Other callers are on error path to
> >> release prepared data. From this perspective, I don't see the chance to unlink
> >> parent anon_vma from vma->anon_vma_chain either.
> >>
> >> But maybe I missed something. If it is not too bother, would you mind giving
> >> me a hint?
> >
> >What you're saying is 'we never go back and fix this up once unCoW'd' which is
> >true, but I don't want to write several page-length essays in comments, and this
> >is a sensible way of looking at things for the purposes of this check.
> >
> >In future, we may want to actually do something like this, if it makes sense.
> >
>
> Ok, this is the future plan instead of current behavior.

No, it also describes the current situation, there just isn't what you've
decided 'should' happen or is implied by this naming later.

I find this to be rather pedantic, honestly. If you're trying to base your
understanding of an incredibly subtle and difficult part of mm on function
names, then you are making a mistake.

The name describes reality closely enough.

>
> My personal feeling is it would misleading to readers. I would think if all
> pages mapping in VMA is Cow'd, the vma->anon_vma_chain becomes singular in
> current kernel.

Yup, you've said this already... :)

>
> A page-length comment is not we want, how about "maybe_root_anon_vma"? When
> vma->anon_vma_chain is empty or singular, it means the (future) vma->anon_vma
> is the root anon_vma.

No, that's a horrible name and your explanation is extremely
confusing. This is already a very confusing area of the kernel (one I am
really trying to improve upon, FWIW), and I don't think this change would
serve to improve things here.

Since you seem dead-set on this issue, I think the best solution here is
just for me to update the comment a little. I'll send a fix-patch.

Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82B61F7569
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691873; cv=fail; b=p+4WX3SCpG4iS9CXJ/9jgZjeAKM4pkpI+gA558ByxzamDv73cPRe0p1/tYSTXKeiIM+yD9Gzt+inpGsbOXE4F9D6iTX0+40aiyONOKfcoaC3glJ04RdO6pxfSWi/I06Q47LjbDw3hxaxPXphH6ppy6sQxfVSepBk7+FwqnHOZss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691873; c=relaxed/simple;
	bh=WRMG6kkx68vz6/70vXhX78JmRxo+LLmwJ5Cu+T4eakc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T9uTq2pgKUuZWMDgZCh4f01MwYeFokOBq3QsQ+O5JlAPVWI/WaI/kfYZ8KN/qALrMjz/vACtGs1hwmUdbqEnujsqcpvAtuX1FeoVgc/QzWrbe28RUHW/i/GpSqLkG4EF3seMKnErElZoduNveOKrRG8R1nq329RehRmzmCC8+yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hmztSBSz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U2nWyXZ5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hmztSBSz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U2nWyXZ5"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533BHghE032075;
	Thu, 3 Apr 2025 14:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=4WT1+Y69WLGODG9t3c
	vHaFkYRwR18Avmpda+gq4zox4=; b=hmztSBSzuGZdr8xHBu9waT7Yuo9fqEdJqQ
	4OcSRuFoNhVWab9Y+mY+LYlr4qB0qRYxmkmSh8tC/W2S+HyKwBsX4XEkXw65w2R/
	UH962WIubCn+m2Ft6Racbf5xjnvX/W0PBL7CqlFXZ3rF8z0c5A+FBDgvRjDVV1nZ
	EKOSn+CLD0nLgYlO0S1kwT6tMgwvMDgxVskI0k9xhuAGxLhMW0aK4zwrq5l7c4UK
	nTshwQj0IzfmmQKSNltLVR0cfojlOd8w/KZ9PQ0250AcJGEsCSeMBrNJk2u91PIs
	PR0/qO0P/IlhBRpUNSkes4m2v+MSxbQJffOd+i6gFIRkXhM3wIaQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7f0mwcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Apr 2025 14:50:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 533DYAnB003357;
	Thu, 3 Apr 2025 14:50:20 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7ac5dsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Apr 2025 14:50:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osY8H54SV5YkOfVnGrmEVelYuF7Os7i+DX21Wn5qpz7T93dApr3YFGuvsCkiW601JXZCa02Xz+mQRpCoBe1Caw/4LxE5dzDqV8wwWbZKXvJI85QUVQpcCWAeXFwRNPaZQUOx8PAvTKboOE45GXnAwRKc+9mXiIGQKftOrE+uEm02igj72eN8RNLsIdA1Koolltb+TJoJSWGw1Vg7EA90SlOvgw1Iq9zB2neWgulqwuUZGC2yTCBuGBYX5OlVx4jChZPLqc3GmKsIH6+NEcjUHEV5hfpT/48nuMyRM5VlEVvzFhWLHhbVxb0SD0sUU11qg6RZaFCtH+4e7L0OL8HKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WT1+Y69WLGODG9t3cvHaFkYRwR18Avmpda+gq4zox4=;
 b=TMI/Ex2ZFkWzo46DjZIDx+lrJChlE18BbtlBA4cr2ar6TubIfnXL/qx87eaEKouZU+2VQ9+QIUmpi80rVDNGMgQOHsHqT5/fbo0hlHaKqBl6Zo6tf86m5psOcSZyfLo1FN4bEgxYhBSsUeucklgaKT4G7MM7FscLH8kaNN2+TIeUqSkKR3wBPpvcPRk8AqGL7l497EDaj4JPsYHbiD57UyD9V2NVcelPpNQhMPTJ2T6YyUm1vj2+5TALIulY2iWg0iTsuLQukCdDbuuzklqyue3zltCjPXO+ZKi920mXpKsFt9Z7MIhS5G7jtv9pj1d9/TdqeXopnq/ibz9CIycrgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WT1+Y69WLGODG9t3cvHaFkYRwR18Avmpda+gq4zox4=;
 b=U2nWyXZ5LA1lpTMyj5Tku8cwFsTkdPKINKpBXwGzW0jD+NmS/n6dYtos9TUyvzQVZxGPya8ttodIfM/Sp1IY/WS32l3yJCQDZsySS9Im0KX1zlRKUCrBWDr7EiLjFcuqua8ZtM4SmaGMV2omqS3gSPazX5zb84gecSYtS4ybcGE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 14:50:16 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 14:50:16 +0000
Date: Thu, 3 Apr 2025 15:50:13 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        xingwei lee <xrivendell7@gmail.com>,
        yuxin wang <wang1315768607@163.com>,
        Marius Fleischer <fleischermarius@gmail.com>,
        Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Rik van Riel <riel@surriel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
Message-ID: <f190ca6e-c35a-4acd-b959-134452ec3c2f@lucifer.local>
References: <20250325191951.471185-1-david@redhat.com>
 <7b6f57b5-c99f-4be7-b89c-1db06788d2b5@redhat.com>
 <18b18a90-9850-4015-8038-35e2e083ece5@lucifer.local>
 <02a4ae57-ae97-42b7-86ba-78963bafed43@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02a4ae57-ae97-42b7-86ba-78963bafed43@redhat.com>
X-ClientProxiedBy: LO2P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::26) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BL4PR10MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 0432a640-bfff-475e-000f-08dd72bed8bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rm2eEQC6c3IqMnzbeq3E7wecUwBjUqYXeaYt3ckKAAqcqQEOpYXxFNhe98Mu?=
 =?us-ascii?Q?DwGz9X57mmlYbuo+E0rKdufH1fFar4T8RwSAhbd1+T+gE/W1oLVGqX3tj0C0?=
 =?us-ascii?Q?tRQ6fppI5s6QKhCSxoQjRfVrcKTuRkfDN0W777nBeAlo9WkaUvUL8AyodBTQ?=
 =?us-ascii?Q?gm50wIhzmly/HrqwuNvDBTwHMpmNAonlmt/EWSw7Y2xg/NfIHRgoeOwEUvv9?=
 =?us-ascii?Q?xdMDKwK+G4SNcTHBLt4VMYdxhuqAHhiC+A924CVIsX6iC3a8T8C7z8nbkPIJ?=
 =?us-ascii?Q?dOfSSzhSXAAbZAEvnlzhvK7b5pHo6KeOlF/HPomTh4fgZFPLQeqUOa9yOs+q?=
 =?us-ascii?Q?2/FbZv8aaO082XzpqURJSrV5GmdZM5mkMtsBvXxEtHLjiyJTA6jj/X57ICZE?=
 =?us-ascii?Q?eig89BEB0YCAmvKFr//+9JDFn2nqw3dbYLwH63LfpNuOL4Bdk6zu1egGrH4v?=
 =?us-ascii?Q?1RGRb8Tqrwvzodztp6L8GIIRT3iOh1dY8fTR1g+FtbEzA+h5V1gZq9n6AXBV?=
 =?us-ascii?Q?yyFQ80F9nVlBeeT/10psSSkUERhFY1mfpvMgr5MQ7utpH8oLMDksg9XHsKLg?=
 =?us-ascii?Q?ZEkOqHWnHlg7IevVkcA2OVrl4Vc0JL+3fI3kbc5FYArQclejN76N85rFQ6jK?=
 =?us-ascii?Q?25S9fwqIXVozektRGBHGetZvoixl8wQ46yCjt8KLtr3J4ZXMMR2H1XSPeUsJ?=
 =?us-ascii?Q?b9M9UccmI+7ToLCknyI6I5SgFbYMzCe5Z6n1BzBAFUoSXNYAfkfF7GTFIc5r?=
 =?us-ascii?Q?UGyQwi3aaHzXiXDHdfM4xUW4amlccqocuTOiYY79GFPMq7CLqT2gKi5kzZJp?=
 =?us-ascii?Q?R3mJ4hzyhsj/xJjUpFXPQHzBmVgfhHl/m5pA2GNTSVmp9L3n1lbLNSP1HsIV?=
 =?us-ascii?Q?nF1pRr0Xt9SOQ2MgjEMBhiANIN+JJLgen865UYw7LFAGqe057ob7m9HZAQ/A?=
 =?us-ascii?Q?DuB7N/GtY0jHU09dJ5hK+7QjJAotX4nAiw7ckvz95GEHXfaeYkztzCsOuA77?=
 =?us-ascii?Q?Pt30bHRf+fhiq/A2uyIDu5n7K4PKC0alefz2c/DCF5BPO6hqZo7p4jJy1vYS?=
 =?us-ascii?Q?woJ6wFPxqt41rwjCsWRXPTz7joxAM7/q8dTofIsPK2HSP34c3iRAdfeHE3Mv?=
 =?us-ascii?Q?b3WsXrlx+ZzW/fX4SmZfoNGeURPqsx4IWrNglhbToBwSTwspUhqN18wH54+e?=
 =?us-ascii?Q?29CqMU1dloY/ETvUqvv0H+sc9PyGzBkvZdhh/G72SHeErwvozt48mOcO/4Uh?=
 =?us-ascii?Q?PydsH2ieuy6QORi0KRXohGpfIxcJGEqMc0HSRDQde/cwJZOLaUVOueWDo2Ma?=
 =?us-ascii?Q?SbPCAXYJltbJJLsNZL0i7f8gVP6zXEw8+7aAGf63XbRcFMWkpX4I2bOnckzS?=
 =?us-ascii?Q?Gp5+FQgGS0r2zPl+2eVvZ51zrNLp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KW7VbWMUBB5BlzvmVWOg1fVzC1Cs6YzWphLQ4Sp5knO/sQ/RSJKyFw5BzaDS?=
 =?us-ascii?Q?4NSG6s/OqtqoB6jcE8alRWfrdtKCIDmL/78oFLHSTrjIC+NOBpj1qTuVeHEt?=
 =?us-ascii?Q?39/Vu+Rttx3wQ0Cll8IJIyhd+5u6fg4Ah4vbjY74bCC8Axb+x2odXbt/j2VW?=
 =?us-ascii?Q?f3M6hjQz9JJF5hh5OOw8APSSZnn+xzJzvx6L7uKhO8jjRX2cYRKtujPzLop2?=
 =?us-ascii?Q?pZZW03gM3Iyzs5UTpRM875SlNsoHdmNfxt31VxlASJGPtFDd3zn1OuWqA/wM?=
 =?us-ascii?Q?5UKRtz3hZxVGw4jKP8eIlNv3dNF+SSJU9ybusXjDnujXI0FTlEsDFf4RXaO7?=
 =?us-ascii?Q?ikW4XLcKBlT4alIprkiE9vlVE06/MQmVM2uVDv+6T8k+1OINel6CgsqvefTT?=
 =?us-ascii?Q?VhwzKOgTzTJLeegdzAiFSPhmpg8gp2wZ6MW0V7OGazz2+s9VqeorupnO6vci?=
 =?us-ascii?Q?n0Y/JTmOCleKBR+rNOng7T+5JZy/EgocwphKR5nV2NXBF8cSzlhWypon43bi?=
 =?us-ascii?Q?O4Wb9AagNAiHZ2nFOtbWXUhHmDqTt7j8XG48f3ROdP7UMfH4/rAt4lORipAT?=
 =?us-ascii?Q?3HI0KLmiRCYKVrNflIEuiMUjuF2lQOZHHctM+JL4kgJv8ZEu39t2RwW05T8q?=
 =?us-ascii?Q?9dOTVKF552HVmoIxR+oUhJ4T+hgyDkRXH9CHeJenyhfcq6eP+w9DJqlOlg97?=
 =?us-ascii?Q?Rz/bkwMVi/U6yHvWqkL7G8xodqmUykCsMEON66nIUHU7KVQL2V9C63HQlMtz?=
 =?us-ascii?Q?2MOjXcvduTV/6/p5EbActYaEt68z0KcAwrLozXdWN8T2kNJMbtrad0mMuxl6?=
 =?us-ascii?Q?bEWuzBK7Wxo753xwti1TsyEdxA+q32LETkisPju+36ZdRUt3JSYDdLkL0C/s?=
 =?us-ascii?Q?HMxl4CT8MXwF9Vd9lNwxky6wNyLbngaRC4wlO6aTKcy2xmMJF/kUM2ZobhJf?=
 =?us-ascii?Q?82zV+G2GSmBZa1WhZs0LeBtVTgzdBaCOCzDjI25dERfjnZfBNs/Fi/ZXKnX3?=
 =?us-ascii?Q?GsifGet3JibjbRlsPFkYa4ahyXXHX2laeeo+t8/gSgr51nB2dgAM5Dm8kPV3?=
 =?us-ascii?Q?CGOHUkgYeqiLOWNLgQMuYxiG7nMRAIJxb3Bw72268S9fpTQtq9tTFXBSi7Iy?=
 =?us-ascii?Q?guI1+ERrJf/pEowy6HrMTXYcj7dUm9XeeEBfgIBhoPEe9663bolsCLdlCdnh?=
 =?us-ascii?Q?Qe/WeD81lC6SexJdXn+kuOIpaYFI1zMuScGWhXDxlGDjN3DM2jQ/PLcCQFGl?=
 =?us-ascii?Q?3L15Z69s80+MwsLBdeHru+KHeg3TyWPSyDGFNrYvSAg4tMfCCpiHNL3Ve6cu?=
 =?us-ascii?Q?hPF94c34jtZp0IiKNSH7nfF+2hQqzLPpVWtoPD/uahTP6UjN15MoTRpieUrp?=
 =?us-ascii?Q?FpmDDIHFP0P6jkeDX+zWnXlDFsgi2dccw/5++bbh2KbkllIqm60FUiU1zqyj?=
 =?us-ascii?Q?WgGDtXtxw/N47tCdL2vnnq1PDNySVN8FRYYOmAratsY9hf0K5vdq0iGBCt63?=
 =?us-ascii?Q?NIc07YSooQ/jTP6hXAs2ZPJSkbgHIxFkkEqTSJiQ6QWPFfOXUImiHhxIUjwi?=
 =?us-ascii?Q?S6nJfiPEn33MzYf65Cu9Wl0kcnNpIpSgSlAqZibDGMKjjxAAKwx4j0XxW7CQ?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bvpIpMZDog0y9kFP74M9W9bfZcsoKOWZXYJYBC27DQ2pk3kpFWy32EjtdpsnLCDo51tDLKxGegg0Uk9DqJxqLJR52jYj9n4+ieldhOnZBBa+aBUiHFfWF1Pyc71I9qPjXKTUXJVnMRkFtOOHvc2xSZQg+ldaka/B6uRkgG/fyRV/lk0GIJDhcl4qGqZ/DqVIvM5U0i76UxWMViU1arX3j+SsUleHVSVe2HvYR2Aywzm5GlWCHzTg3ebIxC7kapfE5BIOo7sUMvoMbzUnpNTaYLtkwwxiKJHNAc3CinBGmRBHMZ0AR+ohLJ40o4/6iaghRBRgVOHOWLOAseNRNDMiCjGL7K+5zYGkxTAYldYGg72ExC/Xa1H3iw3TSERCBv36qzhGpFm6NQVYM8gtdiv7KktXcr0O+6uCsMGUHdTLy1Yc8o9n14zCuyU4AFJYf3cGqsDUz+jDODqQNfzS2bTOi0z8nxkaE+mQHjfqHMGdK3VyDZho4NVYx1VQuGX3c4jNsu/0E5tMasUV+Fbywnr0+dv3Mj1GL0uIu5a4gb04W87YKaUliQKPxZNRQS045aqLPBO2xnjVu/nt//jOIkFGJ2U7lrJsU2GXd1TyDEV9aPE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0432a640-bfff-475e-000f-08dd72bed8bb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 14:50:16.2886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXDh27gi9N061RPTy9eZbYDWW6y1mhZqdno795FTRvF8LQ9167BDgb0DUjRnBsnqMu6/gll0djncpmAXtLtM6pLo0a2P1K9ywEJFH/t+vdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR10MB8229
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_06,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504030070
X-Proofpoint-ORIG-GUID: 7mXEakiYgPI6wx6qXctw6Cj_xbk63WwY
X-Proofpoint-GUID: 7mXEakiYgPI6wx6qXctw6Cj_xbk63WwY

On Thu, Apr 03, 2025 at 04:47:47PM +0200, David Hildenbrand wrote:
> On 02.04.25 14:32, Lorenzo Stoakes wrote:
> > For the whole thing with this fix-patch:
> >
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >
>
> So, we already have now
>
> commit dc84bc2aba85a1508f04a936f9f9a15f64ebfb31
> Author: David Hildenbrand <david@redhat.com>
> Date:   Fri Mar 21 12:23:23 2025 +0100
>
>     x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()
> So I'll only send a fixup (but will likely keep rc vs. ret unchanged for that).

I'm completely fine with either, as long as the fixup sorts the stupid
build isuses, the rest is fine, only nits :) Feel free to take tag for
things as-is (with fixup!).

>
> --
> Cheers,
>
> David / dhildenb
>

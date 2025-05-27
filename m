Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F532F43
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748338696; cv=fail; b=MSZW4MePkia72p5w+ONmhUuTbsUhy2mkWclgcpTl/4yNRdJl3+Y47j8D76fZ9DaHQoMk9ZS82QQpTBmRpfJ1H7VLCLj3K3RwS7LvzNbK7gYHUn/f6VcJin41iNjbiG5WUrx88ffeMg3oCf8E9XNAtSwANoVQ0KOXdkD/+aAt2g8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748338696; c=relaxed/simple;
	bh=KEF8y0SgQX5pc82H8gyScwiXkCm1XwRV++xiUzEXOII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MJTL3K/XJoi403rgQdZO+OWjD9iWyz/uprn6y4fR5kTfif3dUiuSIHX23pMleRMv1lS6CZLeLgFqJ/SAoRhB8ZGkG3JAv/Ri6JA/5eTEhCZcA+YEuOw6weg9ruIeyHFk0361hEd/HqxYuQ3O4Uq14F7bVfkGcr/WHSyRyv0GDy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b6fes8xf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XGsIjGIW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b6fes8xf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XGsIjGIW"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R69Z9F001727;
	Tue, 27 May 2025 09:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=KEF8y0SgQX5pc82H8g
	yScwiXkCm1XwRV++xiUzEXOII=; b=b6fes8xfPd/lsLsXZcGd1lEDnzfd9SG/aC
	SIsJqtbiAb50PVdHEKotxvScsD5z9SjCloav5hlmiPEDRjkXVcpbn/oFrCrVUSCb
	0+M+baQUt+kv5fiToESXVd9UVGSNLX6ADG37rEhx1hAwTNQUqzNehyh7id8Qrlfm
	V+f85SGS4NuITURVKd1PAp9ima3ApBocY0yTEAMTTRN4s3IrgA3bZn2//lEmid/P
	bRf8blwt+z09c/69XU3w5LfYPmzl5D+ilcF30JkuRXLOzDOAuJPCUtndH0QqREFT
	NYSsNfEdSSzQ2KKEmVf8MtPNTKn22BZ4EO7CD8YMjUeg7wGpL3dg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v0g2av10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 09:37:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9J6u5007424;
	Tue, 27 May 2025 09:37:52 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4j8vh8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 09:37:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkmxqkQE5T29imxvyqIQZAjaA7JS+XjD59dFz3X8stbRP02dW0+TkheKBUy7Az/CgRh+NVe4l2emzZj8q2ozIaxTeyx2qx9BaDSqmyW+z2OO1pZ0Am4a7M2SRELorAC7kiGmobLqV0DsGgA4Q2Yc4YNrTwSbSWIwv68/2aC0XXWBZ2U8b3k2kZrPOgU6RGrA0OXxeKsZ0U6nKwxfrHvTfmT7LiUru/r+pnUT5r6CIdyjgTg28QVmgSaP/PUYX8v3uapEOPfCqCxRbx5n1S8cT3vYlN57VUyGwjf3OhcGM9Ki1B1pB3wuEDKte8AMU/Eme2iKolMOkvMUZVHScQkQ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEF8y0SgQX5pc82H8gyScwiXkCm1XwRV++xiUzEXOII=;
 b=x9dvzhESb0jGxNBAD/2GdvD8eSDM1Kq/T7ElfXdYBinfb7uOp4mG6Aisc8S9YVqOK15lqr7+sZUEPqiT8UxMMMNP5O/3dZ2hgvcXUKQErFRQwaV8EXn+uxdZ0eWDbRUQgPEpLDftl0Z2IV3x+ACz25Jrm8AdT2V91IlymDXJ9PFps8LG6H/lliYHQgyJ0IZP4wvCOrl/wjPeEKrDetZKBDXyQ9kf58wkdpz11zEeiROL51J90c30Mv3uh6UARt5FNQR9kL1rsBxc9Yx+2b0iEJON0ONbyLWoT2tId7JSFocDAlfd6GFuJGkg/CJjJazFpJc4Gw79K8WU7jgqGc3igg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEF8y0SgQX5pc82H8gyScwiXkCm1XwRV++xiUzEXOII=;
 b=XGsIjGIW9YervwfFU8IKSWygJvgmjwD+ngHiIKOHMF1KUIGphyc2T9phErpKb00WzVgXsCB0JpQT69VgAfwoPZ3/ud5ENN+1tcdjMGUx9uB0vhPhBp/I7nHxQ2uXPW7WBLbEa+PNkAklfs5c/o9ZxEvrX1qTpSuV1WtGIYXj40U=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB6662.namprd10.prod.outlook.com (2603:10b6:806:2b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 27 May
 2025 09:37:49 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 27 May 2025
 09:37:49 +0000
Date: Tue, 27 May 2025 10:37:47 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthew Wilcox <willy@infradead.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v5 0/9] Merge arm64/riscv hugetlbfs contpte support
Message-ID: <a42e05b9-7568-4ebd-8797-c635c07d1884@lucifer.local>
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
 <4dd5d187-f977-4f27-9937-8608991797b5@ghiti.fr>
 <64409a13-1c07-42cd-b1ec-572042738f1b@arm.com>
 <84cb893a-46e3-408a-ba0e-2eff0b44d2a1@ghiti.fr>
 <20250508123046.GA3706@willie-the-truck>
 <CAHVXubjZB-riBLv+RGis6ErS8NvU4ijVTgvUO06fTxPhbEjXfA@mail.gmail.com>
 <2ad910f4-6930-4da2-aa2b-f3875f71e001@arm.com>
 <e1ff054e-bfaf-48d1-9d6f-46ea73d09ac9@lucifer.local>
 <c5df4570-84a6-430a-ba49-81cf75930c16@ghiti.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5df4570-84a6-430a-ba49-81cf75930c16@ghiti.fr>
X-ClientProxiedBy: LO4P265CA0227.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8ba43f-edba-445b-b6eb-08dd9d02252e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EoLIjcfWg4JiRpo8vBTGzSim7VyBO4NOJU1mzX/PztpfGYfGZseQ8TSmW0No?=
 =?us-ascii?Q?Cn3gi/Qp5Zz7autfmFXo7pq4/fzFfoNtVThsl5hNdNjrjdMEIxGudXUl3ubb?=
 =?us-ascii?Q?apdXiv6RJkVIV7Uzmpgndzd/KTGER4DUhK1AKeFb/5PTinNRNUSbmBB3LY4m?=
 =?us-ascii?Q?WwBSbQuKWWh8NDNPORzKIOZLzPILHaohOGiB5p9+UzFOUn/c7xC4IfK3J7pM?=
 =?us-ascii?Q?9BYG0btBWatJnU1G7EffMYQqW55n3lsia7ExJhi9nhfYAoNkJU/Y/accOoqr?=
 =?us-ascii?Q?bTCVoo0mJtutAhBB6qhu/DvrNOZsUKOW49h24Ni/txphpWgDbKh77NQYXDZm?=
 =?us-ascii?Q?kU4tfn3bwKHla18MBaDg/Q4vF5+JFYI8/oc+AM4gRIdqtucPcQORV22+TaOG?=
 =?us-ascii?Q?dylfu4sfD/tK3XNSp/ByuvvG5QgGOiYpRR6ZDUyTvUWxJBFs1qvN5AVvoMap?=
 =?us-ascii?Q?k5CFJwg3ztTO28BqX68DldVSVt1Tb0F4GXlBrSX7DojSqhX9+YjkDwd6BoJ4?=
 =?us-ascii?Q?oF1jFZ5KSQwgs5Y+F2LjiddMluRNuraUM9dzJmZaIYXlzVNc+657rBHGFUGg?=
 =?us-ascii?Q?cqzf/XEFsDCC/pwGxBgM6Aj0BsjOmuJkVLc8NH5k5zZISZ+TMk/yoE82Hj/0?=
 =?us-ascii?Q?y1mft96Y+FxfSTXUtJse6jF/0LkmIpUMC58klyGQG7FgQ4UToumujr9nrx1O?=
 =?us-ascii?Q?XqqfC2qFz/a3XbbI2erAV9z8xlVebdZBOxuEQAxAb10EorTRZALCqMP6mDJQ?=
 =?us-ascii?Q?Jv/qdEHMDupNtjTFP4QMJ7ApdFjM+OOL1rFjyfaJzl5SykE1UDqa8SQunTWo?=
 =?us-ascii?Q?TdxuFbvOZyPqCi+F96jH1tUSWg8PaKDI4Y31RpurABJ+Mu+NMnittJhygmkd?=
 =?us-ascii?Q?x+cL6ff/D5U2DrotLnu9RyGx87DxmRBg0kTdlze2W2GBqXCtEP3bjmr+c7Q1?=
 =?us-ascii?Q?v/inm9yZchBptxljoaZ/sbVS/lv4zHFDi0y7cyqTBxUM/I94Qch3nD3jnx+1?=
 =?us-ascii?Q?QvT5jY6zoBhziDV24pCjcC0IKRNSWlJy4xndc0tHkoh0H0M9IScdjDh3fLkw?=
 =?us-ascii?Q?Py38KzBMs6IwOaEto1TNmbzX+2en7+LnErrtgszBN1R1z4b63KwSQuw3rFSp?=
 =?us-ascii?Q?PddRXjd6/PzRMM4rXPSeqQUOSb9xGWqjVJjCcUavS0z/vIPjGUIU5Nm6Poav?=
 =?us-ascii?Q?X7MKL21IgSz3jLxBB3LY2Y4jiZMqNayHw+vJKPbnKS7QZs3wdBCMu6gAqqrO?=
 =?us-ascii?Q?4oCn0OA7nYe+syyOdoyKjXJoTDklpjg1EoFsynqn2QusCuXfVIcFGkLYFjOG?=
 =?us-ascii?Q?gcdLiuJcr5S5IyVJYu7UexdUY7RrNFwfE1/ARBFgt6EbHrQr+MUe6G7zp1rM?=
 =?us-ascii?Q?wW9+fV6tsPcfX2oUafQIrtbHDWzBn0NA6Xtkk1XN1aOrz4QDkP4HP1hagLjt?=
 =?us-ascii?Q?pG9BabHumsY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4G0ZV4SmSHBYyp4/LzxdSzcP2iU8n+Wkq2iz7pEAIMOpYyIztO6pMAUezHGe?=
 =?us-ascii?Q?WZPbaYp1X0I/lTvi7XjUxTZXdEJFkKQ249e3Bxq0wnnrqull3XBPPcsL/gnH?=
 =?us-ascii?Q?up9r+CcVnYptyEvNaPDtQjPSxie3iXtfwCPErXCQvMAPZzPy2GNUwVl1e3RQ?=
 =?us-ascii?Q?BSDCXka/i0m1jQXvyso90aB21/HpPyBvmJdUqp9DZJwQPaLHkdxXMn3gDwd/?=
 =?us-ascii?Q?3VV3ipUYeTqkkRSpEatv6Jtp3nn/Hj7BsPqNlORwkgmB+0dy+13qqrdfzF7D?=
 =?us-ascii?Q?5vhHp56rmQUVRR9W34sKzXcvVmwJRcsvlKOF4MWmLo8hgpKqkJyYtoF0QPDz?=
 =?us-ascii?Q?pDVKbBpYjGCCphwOI+LENPYmiH4ycnis1LQzL7pnUHpWFTsEthFHHggIsMoe?=
 =?us-ascii?Q?aeWletY4qvwDUBmW0En9lm3xbmUfCxPa/1TD/jAaCq1Tr6IeDwgLm0HPoe8F?=
 =?us-ascii?Q?GKRMFxp6jWrK5vo9rPwbSh9c46WEQxE82VqbdZki94oU8be6kRcAY79W8P89?=
 =?us-ascii?Q?7kCYM++yVut01XNShIRQPZIFiIUM8mDc1SsXZZSMEQmlENNIY48oaw/eSuit?=
 =?us-ascii?Q?U+MMazcrRXmfW+KpvP5o6jUXXVt7iu/m7lfcfJNlmjUEHON5WNSlfb6stTMm?=
 =?us-ascii?Q?AyNcvJWsA3sfbUEVyfu4hFVt6xbTd5Pk4zV1HqzpR+GWF9+dWeVNYhk56HJq?=
 =?us-ascii?Q?TvwHZq894Sx5tXlU1/fV8epsMAMqWwH6Y2NG9fnjCW1RVmu+fFtUmhLqi3WH?=
 =?us-ascii?Q?dHnhGZu6C04O50qy/UkW/mt5FzGLcNLqspJxAW1euOvY7trD6aAfjEE0e4G2?=
 =?us-ascii?Q?FpXZh0lZ372l1z494VmmyDJEkrR7vijlUCI4QMvtAvoqxRcwdYS1BSzJ9nN0?=
 =?us-ascii?Q?X/LlQKVnxDIeLiWdrzLdn9HxxU8vBWQ2K0CsHuDVKspeXOLUiEOC3+TO/9Ts?=
 =?us-ascii?Q?pv4xmT8IGRKmTzpuDNuWrrvFkSx7cWY88Fa2kWnYnYlWlpArCa+xC5I2h81a?=
 =?us-ascii?Q?efBrhb+/fPSIhsUkwhoJ00w2i7Xdy49+kwkz7Ho3lc4kQ5pzfHbi52XxpD/g?=
 =?us-ascii?Q?AnjIv0vv2fg93zlX13yF1HNWL2RwhxhrKCEGc97CnZpnFUG86SUsaEhg5+Vy?=
 =?us-ascii?Q?QTD/xMBUWtjQwEE+Yhrw+cr51UW5zSNMnhXTtzUykK6ts37Q3NwMHb1kvrCE?=
 =?us-ascii?Q?NPZr4T9L1pCxMGHP1UKYQrII9PnK5EW0xJQBD4k+TTjAsnsR2hw+XR2zzsRt?=
 =?us-ascii?Q?ZQJro18IGKwogwtWSpOSX1afA62S7kqdyvFJnCLCbp05BlBJRR/7UNlCdvLS?=
 =?us-ascii?Q?Gmf+usGsxaP80R+5SQsdh15dM3rTpFEd9MZ+WLKTJqLfKScRrIdyEeYWFBPS?=
 =?us-ascii?Q?VSTltp6ewRnQriyP4wz8V5hflkUZbB/Y+WtSf6aMM0OvEpPcOdOwwaUNxFI5?=
 =?us-ascii?Q?Ayk2+pn7sE/1MvDQggJpeHRVg4LIl1jnYTpX0HBf94KZY/N2EofUMvv09IBa?=
 =?us-ascii?Q?UepFpOeFqOXwgeXjfyevwwv1CvoPlA136XOevgtbQLpkI5Dicpk3mAQK/QHP?=
 =?us-ascii?Q?6XCAF2y1HoGE9fvnFuUF0mOTMWltH/5w37hAKb/nmMxhwDEZm4tKXgCLRpM1?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EySDLWHCv0T3mJFFFwNygFsEVcXn1Ls1Jbx+CwT7dzYTLZMJt0JTqhCZO33EvnZmjBAjZTA4H+iyhMhoI7Lu0HZiT2OZ/Ofws/t3InPjKK5MiQ8GQkXDGgjdxqHtky8oOWznplK5fjNFk/Gcbu0GwCjz/QHynPFkfDFa7kmdDozp77NNcFlo1vWJvDckT9PJ3Xr9ctI7wICdjEirKrSExZO/fGVqcSHanHKnv1TXLUE6Rf+LA9anoGJm41jtxTOPUJRnvmfDSq9Xm498s26j6aHvTfrjDaHdIQrIOPBTecHxTiE80dgnMyJHCLeAvhwGX5+g7HcAO4UhVAUSFHPuPIRO6+w294AJuvAn3s9lw6dvRku0BaVH09drUNT6aRt6l0P9qGdQlcYcdoLoMAtmFuuOxdu3bf5WsFeUSMJYbPE1BvNOfXlNzZmN5VTQnz9hye2/K8Gq+Vt81J0q3kUJ45q22yfrRIrMYDySmUp1WFvtn3wxbaeTYsOuRGRHRQ4Wb77bR39Olgy2h13xEvN3v8EOFLLx/hYTnB6y52yRCUA+JQqQ2fj7zoEDO5sEtzVMRWxhtvF5ON0gyGHV74Pl0lFBYSnY72JZ51LTViOdpl8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8ba43f-edba-445b-b6eb-08dd9d02252e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 09:37:49.6464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2VaCI+krUHJRvflgMB5PPFHRKkIAjHZDutQS4eJZyRizqtklvBlkqZCUV3HksLfkv6mgCTFkCYlwceDQU6mLL9lzjYC0z3GXdzQOoXXKG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6662
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505270077
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA3NyBTYWx0ZWRfXzsE4RxDWCFtj 9kgi8FY59Mq0FAFMK6qI+ndwkA8dIOjWZC8XL/2p2lFKXhJDdCJoPwyAyvOuDlk1UCGS6q80IHL 7o5hPdgjUOdePwSANDH40GO/ySTPbT2QQ+f5VPCgtu1xcxHyeYiYq3hvPlhNgdWkLzltKOzdS80
 ax1wKykUJEGBi14Z2GOEnKey7sFCb9KEVNLHpHORjfWx16KPgcvgEsDozk3EG4De48vl0o3I+TZ 7wDB11Aml0R7kN+d7kJmnr8VThhT3Ucknpp3bybi8sygD2Y7CQWlqlcdEAY2iBR/Hu2IpIFC5QB 69y/R5oj47HTlGUIRDxAB45HbT63VG0lJ3KJ1qdu4Hp31OWftaYnUw7j4o1iCpuPgsMEh70XWiS
 wKTg68Nxj6GX9JsiWeGogKXOI9wJfqTYe0DJMDIPhoDZbURYsxPnaqBo/W8/iTfI8OQAMK3w
X-Authority-Analysis: v=2.4 cv=NJLV+16g c=1 sm=1 tr=0 ts=683587f1 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=h0uksLzaAAAA:8 a=RUcTRLyfVu5KbG_1xbgA:9 a=CjuIK1q_8ugA:10 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-ORIG-GUID: 2C_f4M9mV3J2rXGAw7G6j-clLlyrxv8A
X-Proofpoint-GUID: 2C_f4M9mV3J2rXGAw7G6j-clLlyrxv8A

Andrew - does taking this proposed MAINTAINERS change through the riscv tree
work for you?

This series introduces the files being added there, so it seems sensible to add
the MAINTAINERS change to this series.

And I believe this series is intended to be taken through the riscv tree so
seems sensible to do it there?

Proposed entry is 'MEMORY MANAGEMENT - CONTPTE (CONTIGUOUS PTE SUPPORT)', which
is explicitly relevant for arm64, riscv.

Thanks!

On Tue, May 27, 2025 at 11:25:57AM +0200, Alexandre Ghiti wrote:
> Hi Lorenzo,
>
> On 5/21/25 16:57, Lorenzo Stoakes wrote:
[snip]
> > So right now it seems the files would consist of:
> >
> > include/linux/hugetlb_contpte.h
> > mm/hugetlb_contpte.c
> >
> > Is this correct?
>
>
> For now, it is, yes. When this first series gets merged, I would come up
> with another series that will introduce other files for riscv to support thp
> contpte based on the arm64 implementation.

Cool!

>
>
> >
> > Is this series intended to be taken by Andrew or through an arch tree?
>
>
> I can pick it up in the riscv tree once I have Acked-by from arm64
> maintainers.

Have pinged Andrew above on this, you'd need an acked-by from mm people also of
course.

But I guess what makes sense is to take this as a patch in the next respin of
this series that actually introduces this stuff.

So if Andrew took it, he'd have to take the whole series I would say.

>
>
> >
> > And who would you sensibly propose for M's and R's?
>
>
> Ryan is definitely a M, I would be happy to help as M too but if needed, a R
> is enough for me.

Ryan understands this area better than I do, so I would say it's up to him as to
whether he thinks this makes sense.

>
>
> >
> > If we are definitely adding things that sit outside hugetlb or anything
> > arch-specific, and is in fact generic mm code, then yes this should be a
> > section.
> >
> > Does contpte stand for 'Contiguous PTE'?
>
>
> Yes, that's the name arm64 gave to this feature (more understandable than
> svnapot for the riscv feature).

Cheers!

svnapot, guys... what? :P

>
>
> >
> > Then entry could perhaps be:
> >
> > MEMORY MANAGEMENT - CONTPTE (CONTIGUOUS PTE SUPPORT)
> >
> > I'd say this entry should probably be added as a patch in this series.
> >
> > If you give me a list of R's and M's and confirm those files I can very quickly
> > copy/pasta from an existing entry and then you could respin (and cc my work mail
> > for the series :P) and include that as an additional patch?
>
>
> You can do that or I can do it on my own based on your previous patches, as
> you prefer.

I absolutely prefer you to do the work haha! ;)

Please cc- me on the next respin with this change in and I can take a look.

>
>
> >
> > Happy to ACK that in that case.
>
>
> Thanks for jumping in!

No problem!

>
> Alex
>
>
> >
> >
> > > > [1] https://lore.kernel.org/linux-riscv/20240508191931.46060-1-alexghiti@rivosinc.com/
> > > >
> > > > Thanks,
> > > >
> > > > Alex
> > > >
> > > > > Will
> > Cheers, Lorenzo
> >

Cheers, Lorenzo

Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607981E25EB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744967724; cv=fail; b=tOvORht9RSTyrEBPw8DsUFWaEZXebV2ZPwoTBfKyyb3qFA2z1NxL5XzkecXuMNOjR/lbEwxOXJhnWQNgx5NlYW6Zio42Z/eT4i8pHj1Br7SgaJK08pYQCpIyUbHfuW0da1KfT5gId90d1+/leaES0lAhr3Ou/fXcir7ZEmNNPn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744967724; c=relaxed/simple;
	bh=K1niCUdaNtJRVIC5fRyOimhUr1udJEVTokIpuB8hbvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VnJubWiDpWdBI5roJHVgYdH02h4MUzAPCtZsAsqwwBiE6ARiwJOjn2lwTpaQW7S+zW47YITBo76iTmwesTrUXx3KmyWK89HBdASz/rckDr6Ck/XVzEFiS19ET3ucaU2ofgSy8vWN2aqf22sEkkoJlkmeVk0Z5yc4byN2UYNUMM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Lff0otMZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0MOQjcD1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Lff0otMZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0MOQjcD1"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I7uDPS008156;
	Fri, 18 Apr 2025 09:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=N5WBVBXjhHyGOOMzAD
	8wDoLlwwgq0DPVkz1k74Fn8t0=; b=Lff0otMZaWiNnMz+UUtNMZoVLRzjg3IYql
	KNUUsq2zE2aaMP+0nPOpMPbDLaG/wIesgkjf4phFhOpV18TchMbnNRKBz7eBASOq
	hcSlkFze3dm4KcAZauPk7nE0zNtnPIUWkxc8Xrk0LOjfIf+l/14+4j3QPmZxN0Os
	LR+9AP2mXEJd2vQt4dGV+kU8geDBodp32EwIi90HuunWZjTxB2+Xp2VKK9cZfo5Z
	UAwZcvP7aOFTQwDobaHEi2FesM8qBgxJ2ZQyXntb2crrxcxRZpeUm8X9S7hmNLqM
	F5u9TTCtLV16s2SgHMRAM/IijV0Q5cOghwOzkE35gzXBP1/L5o2Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 461944fqa0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 09:14:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53I6v9qA030960;
	Fri, 18 Apr 2025 09:14:33 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010002.outbound.protection.outlook.com [40.93.1.2])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460dbexpy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 09:14:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8nxplcsZjiSFqzOiuPw+TqkApkZdXS1y1sKFeBe86iUQex/YQXQslXnMdfQVu45hQIN2HLVwQjBFIqvtHJSp9UqfXdHuHaFnaO+02KBytU5HrjYniMw4DsbnigGrLEQIVHNBw/5G/VASW2OAbrBXiR7+WIQVeTbsujA9ciufXFdKCNdrPK4orvA40iU1SSnwhc1vImq0HOkz4nKautAzr/lMfSQvS0weoT4H8INftXO5BF49HitfGiX07lUEtNH7p32sIpJDutyc8lu667/1eJKUf4NeEhyVJ7XkG9W6jhPriVJKIEw2QiR9Ix0uy5xe+q16Kjjfl9Z3h2D/n1+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5WBVBXjhHyGOOMzAD8wDoLlwwgq0DPVkz1k74Fn8t0=;
 b=fIs3RlTmhEprfFrRKym2EGd815H7qJjuRaskzHLHpMf/0MGgXbJVVo8rywwlFACzX6Xz+Ws9xSAPqXoWghspVH3+9VaBSuMS5teFoABJ/WIP02+CZPsK4BYswVyFuiC1zNNpAlrROYurGHgEfmGjfN2MDzBzE+wpOSVwKM0J9tlbIk78kc/SvSDL1p25/jYW0kWkAnqq6w5mmaIek1DgWuaUxLUmvr1zwdJtFYpeNmNVouj+jgjGllw4imPP+PR+vRJXakbRV817C/tXRtmUI0nYxMDAABHlyuBAL3AzqrYaq+ngl7r2WiExIp1X3EabnkQQihfZaQmEyJlFXf7HoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5WBVBXjhHyGOOMzAD8wDoLlwwgq0DPVkz1k74Fn8t0=;
 b=0MOQjcD13GpqwHjBU7HqHMZf++Aq16htjPe2A1w4EQopqxcqAKFdPbSgjb3+TV70/IAcmyWLwU7lNaLqPxFfHGIywl6MEzZxocHM6IaIanFGMPjcl+oMEDqQFeb8aXtXlXoNX4Yi2TvBtf8V370RfqRXxn12sl3nAYf0GclfLN0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PPF72E3677A1.namprd10.prod.outlook.com (2603:10b6:f:fc00::c2f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Fri, 18 Apr
 2025 09:14:28 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.029; Fri, 18 Apr 2025
 09:14:28 +0000
Date: Fri, 18 Apr 2025 10:14:25 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, linmiaohe@huawei.com, nao.horiguchi@gmail.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Ye Liu <liuye@kylinos.cn>, David Hildenbrand <david@redhat.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
        Rik van Riel <riel@surriel.com>
Subject: Re: [PATCH 1/3] mm/rmap: rename page__anon_vma to page_anon_vma for
 consistency
Message-ID: <ffb0d633-84c4-4c02-a4b2-021ff8c9b6da@lucifer.local>
References: <20250418075226.695014-1-ye.liu@linux.dev>
 <20250418075226.695014-2-ye.liu@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418075226.695014-2-ye.liu@linux.dev>
X-ClientProxiedBy: LO6P123CA0054.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PPF72E3677A1:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e1ab10-b011-4840-860b-08dd7e596bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ePKYZyhXbB4fezn6NGg0JYAcZpYOd4O0vTNQGnEdxUOY5EX5JoQdBksZjTSf?=
 =?us-ascii?Q?s1dabPcor7xFOSy6/cllS2vgboN7IA86EKHh6pKBGYhk1ogAO2C1mF+V9oFj?=
 =?us-ascii?Q?g4oJ4WogK1MhznLl218kjwylo4d9hjwm2JO7Q/4DWNUMRqX07TWA/nKgemrr?=
 =?us-ascii?Q?PepY/TjmVezkF57BscCbSwCDFDIp0FR4ojPX3P4AINVaqzY1WdGXTDdwLwHg?=
 =?us-ascii?Q?E8+Fa0UEZWFKUEh/uLUCgb03ix5n6mh5cJHRVzrdP9qT23CpdymkqQCqSAZA?=
 =?us-ascii?Q?u8ZbumCVcbo8BCw+5zkiC0elbEoZe85MJyidBAZxuXOeKjOUyivy4m9slv3V?=
 =?us-ascii?Q?/9zohKRaBZhsw4+UcDq9Drxg46PhpXzJ8v1Q9X9dpYv5NxlVXEIdlgcDAwks?=
 =?us-ascii?Q?ITcwX7ttPnzgCu9r/BCmCxFfdEcytBb8MaFmgKSV7bPQZh5SQb6SR5rxtVPG?=
 =?us-ascii?Q?Hoh8sOKjNlOUObjfkBVbZBWTw757FfAT2/b6y7aVpmHOPWOsn15ShNs88Jm4?=
 =?us-ascii?Q?OtI6gFQQ54Q3RBifYjCZ6kQ0RxxSiS0wnx/L2xk9FtNPhdjtwDdQWF6iYbej?=
 =?us-ascii?Q?K49m2tFaDfQ6Z31cgf5p2km+EAwlwHa4nFYeOAgH/LnZRkeuEvsMijgsWxxp?=
 =?us-ascii?Q?SZL/VigXxwTGmw5QATS0Kg4LgFlNML8ope4GmPtb0zXjR3Dx8+U2zFVtdlq7?=
 =?us-ascii?Q?MyMRx4DsNHUzUHJPZHfot+ybaT9L585fu8WUYt1eE/IEUFGOkKWiSzfsfnvB?=
 =?us-ascii?Q?RAto6J9FjA/C8hHQtLxpIffR8rIzRmAS+4SmF2dQPSHav8L18awyqzRP0aWv?=
 =?us-ascii?Q?3MOpe453TvQql+67F77Q7ULxo3h7H6mrf7eQ8i+AqLCPtnCYTsCfW1T8Cuav?=
 =?us-ascii?Q?UupplUDoTTPLdRspx3V99X+ayOhI+qds9J4mG6Lo0Y40g1cnx0ayrVnFlncg?=
 =?us-ascii?Q?MIFW41wrnGYpDpQpAw6ixxERn2+4wDyNtSHZcOrs5Gavzeqz8mxFUIYxy83X?=
 =?us-ascii?Q?by0UokstSj8ZwGHtW5K4AlQrpSfW38hdX+gYqPDIM38pHE7qg+5Z/u6Afxq4?=
 =?us-ascii?Q?ZwvdBG7k3KEuZI5u1dYLMudw7g/AEvIOtw2ON6rENt0+mpGykGDnRYXASR2r?=
 =?us-ascii?Q?cuBjb09M42ob1T8G3HgTsqMPcTHytOfL9MvE2DwBDinNMEIgjZpElR/DfvpI?=
 =?us-ascii?Q?g3qP6GZIq/B+7Hant546UXKvjHOqrsTETMnMQ66sRAmggIWkOcgdXEpQJqld?=
 =?us-ascii?Q?Qrur6PKCmspKLUaT5mXe7uKwLv1O0Se4RDD1IXZZd27Pnx5dnomWUg9vjJKF?=
 =?us-ascii?Q?B8nMualGqZDE63i2plHPVMg7VhT0GVOhVbJKkvihmRfN9IM15N6imIzT1tpU?=
 =?us-ascii?Q?7uI6UWJMg7GVaKSJw8eOkHE7JAKmGFGa+lrK7vJ5d2RsEMxMeQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MZ78CyflWTy5R2C7jX+8+YqWQpILTH4yknyBAVGout0W2uFO8/xhzmjjk+sa?=
 =?us-ascii?Q?FAMyccUxUqeNr88ZVuHqYHHHBoJ3oTf2DcnguCH1xdDg8ASewoUkDwH779Ww?=
 =?us-ascii?Q?jKFBiCuyW6bxs+npuG2VZVBUBbwx3OBVCiaHS3RbzDcOneSqeiWuHNtbWdfq?=
 =?us-ascii?Q?cTw5wtT0lEI2fQOvRitOfZcE4mAvYcV4vlm6FBjJN+7gaDdUJicJEAsxTqej?=
 =?us-ascii?Q?hiRET9vWxr7MiE9BhBhhoVDxfopMBHwgiiF5lkPfBwbzQvuyYosITSPmra/6?=
 =?us-ascii?Q?kUP+Bahhl60WAbIxE8bbIygJ/thSjqlQdKOd+nERbErPpS1Y/ufGu9c6gR4x?=
 =?us-ascii?Q?3SlH+VRwnuzi6Vpif1zCzxdSnVpWBrDfeoj+P5xykPo7JroHD18jHo47nSh9?=
 =?us-ascii?Q?W7kWnUhg422LbvHYaFil1aShaVDa+AAAPqzBUxwX9/6kdxGDcWQP3SzL+/rv?=
 =?us-ascii?Q?0bZsjUzs6aWv6g5MtoO9mjrJw727MsvoZX7sfU9VcGtZXoDFApg/w0/aA8nD?=
 =?us-ascii?Q?qR4OE2Hnm05vW6/6+j4aUHOrXJ4DUxrcV6TDZh4XJj4fgrl2mMjsdQnP+2Mf?=
 =?us-ascii?Q?aD22A4bOB166yHu33JMjXWzUijY9eKmiyJHfhwSqsN+6h8DZmNVl9VX+NZqd?=
 =?us-ascii?Q?QaAsqePGlclkpA8cFXq4eszGFjFSq3oeu62j9qMQ/4VSp7l7myEWvs8mcSFy?=
 =?us-ascii?Q?52eGOyrA+O1g45pHQw+vp0v9CKA0oeFpBcIuzG18P0V1M1igHCb4IfFwibjD?=
 =?us-ascii?Q?JoaIfgHzBm2WHlq8e5WAKAKZ/qAAb4l6ZifvR/E89GfpwC9DHS1aqemVrKdd?=
 =?us-ascii?Q?eNuOKho4iLhJyCV1k8n0QD/DzMW83tmKhJb+n+Hq31V41Mx9UC/uiO9mXbA6?=
 =?us-ascii?Q?TKfieYkzsWZTH3j9xLLXr8ICRGAuJn6cWZbUIGQXs16U06bgm1ZcoLBpYSBE?=
 =?us-ascii?Q?5xVNTp6BMQ417MTy61fdayvEiOxxCdF7Q6ZvTNqNV5Hitk7QOl8WVRlCC2/A?=
 =?us-ascii?Q?q5JwlT0MzVRE7BpL2NeQpbo4sr5JFfo9uV/m/WQexsg94Y4IvXgldsX4xC5u?=
 =?us-ascii?Q?fyQqlUwI44LMO+9vV56sTZo3DvbaCzRL7oBBDlVQb6txUp5LjloUg0u8plA/?=
 =?us-ascii?Q?6hZWLUrFvykfF15aBlO9nOUlDBMzHRm0s4vQLi9p4r5T6oQDTH0LmO5GiAzS?=
 =?us-ascii?Q?vf8sFUx2ncJmpy7ywMgiKzVxVOrACFPmnUQe2rEmxVV7MaRA1xGFLg7tauaz?=
 =?us-ascii?Q?2KEKKv6+aocFo5ypiXXQUYDRmEfTvZCCKxp0VyMzf2Pqk58hvJW5mQhTIeH8?=
 =?us-ascii?Q?UPO0vgqrJtiQJxPth50YdiJ9Pq76TMU02MnceS6iub3F1j/IRD2tHQowVkaD?=
 =?us-ascii?Q?MabnIag5c26jfN2d63yl9FSRi6/K8lJumNoODpklg4PmWgz+kDunhKOgLlCo?=
 =?us-ascii?Q?csIZQqj4+htnCoI0IMoaDDDvkS27yHV0wFCGJqnFahQqEsSgwp1xypWsGvXQ?=
 =?us-ascii?Q?04QIHVdVHruukpBCzUIlavNZjKDKvq0c5MVBEa5ZkPMKd5boE/KVwMnhRiQI?=
 =?us-ascii?Q?8QB2nKbNS059FGU7FywfAfurbk2gzHOBvmGk4fs9tcPwJY9JJPbj22DTSOV8?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sS3Wol0Nimb4fiWFdwcMfWTnykYI1R+8wY2qctALPiYIvgaA0NadClp5CpGrEh5ZIRMbkLBEdhZ0NUkbqXbJgKYVK1lkXj8zk7OUSDVea10LKbngmCdKu8ekfMXeb3+NEav8AWLYrORG2aI8b8SvSfa55Jwb67/Kjm1ml5D0ClNu7ye+lqF4dqafzbFpeKZ3HZqjJbaCl7aiY61klXsmxAVH0lxswExavd/KThomLcqZMi2UeJmE5CvOs4NlTjzho2MVJUh9Sndw2PzPEUtR+xo4TuzfK6dAKrT3KbMwv23k7++cuCVdqP1n28E5BkJRp196d40Mmu/xQ4yZfpSgYwFDDHkrdvXttorkUOouj9bbD7GXS+p/ORtc8V8sWxU8NbqAR03hARs+Eqd+l6whpLEROEJn4zo+euZok/BOguzkIebSdEWRek3viA9yKZxMga+lp1y4VdGhosi/RShCeTDtcEKq9vhu9OSAcL5ETTofeMpAEvfxO/fULbbh3sMiSVcSWlrXzI1wgQF4LClxE8qNoKe5StPIM2OGxeoVzQ9+LlgA7kZhSbNLQIQuw9/u4UwsuGREXW3l8NlB4GOIXojaGTGA1Xi4XuhJS1trUSc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e1ab10-b011-4840-860b-08dd7e596bb8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 09:14:28.2536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbdZE/Wq/9eO56iC9zw0mLqHVae9egscH71S01heXY+qob2nEPz66/qSR87QWOWMi1tlrQhxivbBKxz58rZuVRlj/75dtwqM6Y0qn2oRR8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF72E3677A1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504180067
X-Proofpoint-GUID: 5jZleOO8UzVRtZc84k8XgXcQ4SmWP-_H
X-Proofpoint-ORIG-GUID: 5jZleOO8UzVRtZc84k8XgXcQ4SmWP-_H

On Fri, Apr 18, 2025 at 03:52:24PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
>
> Renamed local variable page__anon_vma in page_address_in_vma() to
> page_anon_vma. The previous naming convention of using double underscores
> (__) is unnecessary and inconsistent with typical kernel style, which uses
> single underscores to denote local variables. Also updated comments to
> reflect the new variable name.
>
> Functionality unchanged.
>
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

Thanks, this looks good. I don't know why we named it this way :)

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/rmap.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 67bb273dfb80..b509c226e50d 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -789,13 +789,13 @@ unsigned long page_address_in_vma(const struct folio *folio,
>  		const struct page *page, const struct vm_area_struct *vma)
>  {
>  	if (folio_test_anon(folio)) {
> -		struct anon_vma *page__anon_vma = folio_anon_vma(folio);
> +		struct anon_vma *page_anon_vma = folio_anon_vma(folio);
>  		/*
>  		 * Note: swapoff's unuse_vma() is more efficient with this
>  		 * check, and needs it to match anon_vma when KSM is active.
>  		 */
> -		if (!vma->anon_vma || !page__anon_vma ||
> -		    vma->anon_vma->root != page__anon_vma->root)
> +		if (!vma->anon_vma || !page_anon_vma ||
> +		    vma->anon_vma->root != page_anon_vma->root)
>  			return -EFAULT;
>  	} else if (!vma->vm_file) {
>  		return -EFAULT;
> @@ -803,7 +803,7 @@ unsigned long page_address_in_vma(const struct folio *folio,
>  		return -EFAULT;
>  	}
>
> -	/* KSM folios don't reach here because of the !page__anon_vma check */
> +	/* KSM folios don't reach here because of the !page_anon_vma check */
>  	return vma_address(vma, page_pgoff(folio, page), 1);
>  }
>
> --
> 2.25.1
>

Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4702BEFF3
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750142807; cv=fail; b=KjlyZtDSJfByieJny4t5+6WOYYDPVqJC5eBM9AQP3evxgWXNcBd2ovRAEOa9Nx0GkPWOz5ZaLmj+mWNIc1xVG5fK4mxtoopFl4REH0c0M53pm9D2kOdJ46ca1DUL9Lnz/3qtdJr6YlYWMc/RcCcpZxOmPPUA0EgFsdVDbInVpp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750142807; c=relaxed/simple;
	bh=vnrvzzUfR1yglhChuUHxDEoYNRR3nhhY85KZTbVZox0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FjTWgOd/BA1gzZgZI05nVdCdK/K9WPj563ayq6pB3+c86ajnRDHpLujcSkPfCJL/F27OCnm0eovQD8gXQrGUWL6YKIUbVHOYvQwP9tdPfAwu5WuzgHPHVlwglrgvl3ssoFb1H24rlB8F/+ggRZ7t2shgZuLwOuzMPRDhswA6E0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kR2rx60U; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JlkLXy/P; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kR2rx60U";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JlkLXy/P"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H1lSqU017345;
	Tue, 17 Jun 2025 06:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=AKu6MB7LHVX5pXXDO+
	m3ktArBIOA6sRbxE/3hF9bWYI=; b=kR2rx60UKEiuRO6+toNlmGVq3c9F9uf166
	jPzYwklw8AL+gF6blF6I5R2V1rbRYelCsKKnxDyClhqZhjcDTrLxSJH8JWauwtzL
	QWyH/5nE/7nCKg24NPwq/UcXJmALLSuja7o0h+PGgDjin7WJmHDkezbmkDuMLWvN
	s6GrC93CQ0jICE0OwHNv2qKga3nOpikhpOSLIWYEIV45AKPrEHlyoGwiaU3MC6TZ
	492nLTubtZ791zUGDYUBayexcyf42Y7ECQ9rT/kVyo4s2KNf1mB4ZFWtin4tAVLv
	EcL/oruZd348P8deBO4gfJOsWfjOsvk0MK3WCaad/hTov8MJPGlw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914emkrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 06:45:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H4F9IF031654;
	Tue, 17 Jun 2025 06:45:52 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh8kgq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 06:45:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxaQoCSilH5YhxSoOrQVuSesn1D06HoUDSF+KAAgkaDP1XZ0C5njDKaq0yghEchm1plQeEme32qjtz4T6N0ZWjfldmpxfoWoT6tNBV4ZwCBopJ9lx1dwJY+La0CoCWbId5Ad/lsWDQjuDjrBQdq02kaBLlIdnv2DoJtseBALecWP04anekaa0WO/MgPTGqAzzXdJ/WTfUgbbwFlBGYce9s8E+hNwxByNkOKbxC7tZ0gpyjxJYzPpCXY1PVaDtYltXGlq4jn5n+IXSLGGsHrXzpDiI+qBZv6JgYXhE8Kds/A+RpOtsHK2nHts3b6OFmFdimplvnqBT0qGlWZ2I4lF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKu6MB7LHVX5pXXDO+m3ktArBIOA6sRbxE/3hF9bWYI=;
 b=OXEzqooeVOw1H3eURqv0bVFtFtOSQSaMzEAdvCwJgBpXktdQV9rkYZ/DCBOouWI4BYgeLbggXB9PINQiXNJv1z3XUgZtWus+6MsihnB3of1fBQgDfj2Cb8I2gBJlb+Up54kT7hedCZyiKoaJzpoT4eVirYxnZ0pSnuz+5lmr5eBtwHFX/JG5J3sW2L1IerMaCS/CPSJZHIGPGDFMv4UDKutOulKp2kwSO9rXFCjDetiqLq6RzKaB2Ti6SfuQysRsWu//8cjDb8RzdrUbciQD3XYoW5bJoD50JuCAFYr/IRZdZ9uZt+1n5aAV9+h1DwVJbV7OTRPFLQqESGdQWiYbzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKu6MB7LHVX5pXXDO+m3ktArBIOA6sRbxE/3hF9bWYI=;
 b=JlkLXy/Px+XL8H0D9nukOPD9E1PSYKWXyR8RnSn3dD8XWlU3vFYi2nCHA51yQsmrlRlWKuN33Sppg//Imnwt4Q+B12tQKXtD33vCVwbJFgW/vJFc7llRQKUTCnD/k//yUMb+8Rjfmql407YtzVcYukuj06ApFQyKbb1zDa0K2vg=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by DS7PR10MB7191.namprd10.prod.outlook.com (2603:10b6:8:e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Tue, 17 Jun
 2025 06:45:48 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 06:45:48 +0000
Date: Tue, 17 Jun 2025 15:45:41 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: "Lai, Yi" <yi1.lai@linux.intel.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org, yi1.lai@intel.com
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <aFEPFTWFqguLHyAs@hyeyoo>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <aFEAPOozHsR1/PLI@ly-workstation>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFEAPOozHsR1/PLI@ly-workstation>
X-ClientProxiedBy: SEWP216CA0056.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::18) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|DS7PR10MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: cca01a6d-3d82-472e-0356-08ddad6a9812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ohwhC2gQUGU0gKijGut9I6FZ3Fk3vu7IXsmdRWgCZ4islhkziGsGPYc2md2+?=
 =?us-ascii?Q?l6FLq8M3bBL+QU152GBTFif5PIc/CIURTQ/vQeBABYttQE+mrZzc4UxTYkj6?=
 =?us-ascii?Q?FbiLk2Cns7bXdMT+2n5k8xLYNCEW2R7LcC35sWVjeBgQe1cHnBhsb2p2jUao?=
 =?us-ascii?Q?9FjPJcYXgbkEslS1VsJ7xoPuU881+x6Jtx20unMsWBWCWd7DBhxcKB4X2V8p?=
 =?us-ascii?Q?FDZjYqwCERSbRIvEmlsP+zNpZzQUWmDZ6Ay0BWMGDIPjRFNvkYRdGUy9oRNa?=
 =?us-ascii?Q?JRNiyToN4yuR83kUg+8V0vVRQ1DCoREdcI4xoSN7rmjHoSOSHvt5w+5dfLCS?=
 =?us-ascii?Q?250Lr/dQHJGAYniXIVoGVW/yWXP7T2x6jBiFZOH56dKYchMzmTLgexgPTZwy?=
 =?us-ascii?Q?WsJioZkYcqqxwfAyyiaMQXX63QI9jVuE9U21X45uvlstgEO+yl3MFKLe4ZZ4?=
 =?us-ascii?Q?f8Tc49armfuyCjcyLV89Lb4fNxj3DEQnsgv4qXoLcgfneNobRF0CeuW1l/Qy?=
 =?us-ascii?Q?l2i0uPhOwwN1SYQS1hYYuCzpyAM0wAYWVNXk6AgNm0AtZbBWGRPwJllVuAI0?=
 =?us-ascii?Q?nUH/zolJ5MMiVORSrQU1rLRW/fSCB3zzrI/YP8dlh0lU6w8m2BS2eNMrms+N?=
 =?us-ascii?Q?82z8I8AHDw3/K4zxAUxmmqVV1iT9nm5r2rKEfKbTqkOt1YHxCOpMfb6ueZnZ?=
 =?us-ascii?Q?9yr96AmkM6evFStwJKRG/L4GUUZuga+Z0+QgFvx3sV1JyTMToRZmbukICehW?=
 =?us-ascii?Q?+sXYY+6Z99+dEHVUNIrX1LDvInVdULfgenAI5szFndui7jiIhY+qRxDIg3Fd?=
 =?us-ascii?Q?q1Pn3YZfelZzPQBfTWSdDh3hlWo3H5qVtEhyDbUZnzafrPrtiwDtQnnFLRT9?=
 =?us-ascii?Q?TIa5tElsAN+DFFguL9ZmMQewlslMRxAazvJkqriy+Yd31RLY8ze26Dz7GBd+?=
 =?us-ascii?Q?uzmf7jxzsbLAHl9Mvp4oNIkuBKF/0MID+oIvmPrz1POkJS7TQ0EJY8UwbH1Z?=
 =?us-ascii?Q?4rEm0yirFVDIzJJ+YbR2WbKZFeg3j0Ca4IbGaOD3+Z8/cu81vjgg3CvAVNyA?=
 =?us-ascii?Q?QBGq0FIIJlxxI+hiLbj31wywxEFpTSgP80GYXUdljlU0Cggx52aoLQGO0/EJ?=
 =?us-ascii?Q?g+Av+lB/v/prby7v1S5d5wBUSDzM42iFZhFohAmHN5RrX8Z0eGuOMBUV+cnU?=
 =?us-ascii?Q?jyK2e+yGXTfgd6T1v3dEp9e61Oa/ygbgROemBpdAUf+0I7YCQzkvy5pz8VOw?=
 =?us-ascii?Q?4epK8uGnqWHIqf4Gc6B5bNfnmIXtIibmtnAaZJk7YpkOIMVrNpIc32bfF027?=
 =?us-ascii?Q?NN5aGVEPuzmt+c1nXRT/TTYx9T4R4oKsDlX55bDIvmTAyKmt+QV94xUjXlh/?=
 =?us-ascii?Q?vClUp0N5XSsb0KI6Ij3zSxmjrGCC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mCi+kt7lhVzVY0OcbxfBgRSG9AkQbduWWBFz5fqDDhfdq5+SS+dBtLvN0n1N?=
 =?us-ascii?Q?PboHmSy0a80tr/Bcicm7uecyLa4ChnEljybL0RO/5U7Qeuq/wHWNEjoFtTfX?=
 =?us-ascii?Q?26OffoJXCvVmJvUYal8XIpwCcfB5vrpyTBd0KyibqXFutqi2T10BAaE7FLI5?=
 =?us-ascii?Q?pZeT0ehCFac2X/b0QhZ3oxrW+uNRr6cV4H1nxbeEJDSp2Hn3NiMt6kpTpU1C?=
 =?us-ascii?Q?eh1GxzGTnCmzZMGiG/AJsTMz6yWVkIQQ2sw68xtZ/99kUZE5G6EGTsu1ikod?=
 =?us-ascii?Q?81HKARvQj8vWzWBJquACcimePS24qqIHESGLAVW5a0RP/lHGg/Nvmx1p5gBQ?=
 =?us-ascii?Q?O1kNxas48VE0exYaiFurWUub9vwGK4suIn0l+OCDoK0FTMHLZ+yfVdkhvje9?=
 =?us-ascii?Q?iwlKFKtRI/Ah2EM11mwwet+nF0LQycZjlsmXxdJS3nOo64ZotXgjuMlRi8/U?=
 =?us-ascii?Q?Qe+5q4D4c0C1/EuLDzjk0xJCJTCpeMev+AHNOFJIi3nhmm56q3EyTpqPEtjZ?=
 =?us-ascii?Q?qrFFLfzIdiPNyQ1VJtGQIIqrtYLKhSV0zCpbqln3dhPrRo7YgsTnauVjOBaw?=
 =?us-ascii?Q?5DFIHXhEQ+WLTkdFhDguHUFkspGWxYnVu73Uvas2giZE3aTomTywsip0E0gx?=
 =?us-ascii?Q?OBLo949eCKdUKDAENhGiPXjl+MPoEVSaxSVhMm7Am/8qK+rZLKRHbOxyTAFA?=
 =?us-ascii?Q?7vjYXaWGgF7Pt9MGSTfL4bSHVJqlymlDGHgZbIe3uAoffx9c24GunT1S43yu?=
 =?us-ascii?Q?5oLAkqahRxDsVb357iGNAs582IgVCZRoV8cU+gXJ15wK9AG9Tbm5wHloLSMu?=
 =?us-ascii?Q?cXU3etg0D+WxyRb8O9gb88ptW+DtT1zsM2XaSZduIyNUadB29XvJtNoqkfBt?=
 =?us-ascii?Q?DQw/R+/kC4fZriqwhyZhk+/r6UU5Zb1L05PYattHDh/sKeIegeVUztTOR0qB?=
 =?us-ascii?Q?MnpXitwWtklCIXOa/Vz/do5oRtgUNIVarSwgmv2sRErHAdNmC4eIKio7FkQS?=
 =?us-ascii?Q?rGeuEGAtAzJ/R2H5lmlKqQz/fwKWPxmEq8t3oQNr+5qVFQl8NtGDQ5AopZ8k?=
 =?us-ascii?Q?1VKf08ECeUq1Nzru8Jw/UOdgMiL5Z3Vae3Fdff2BDxSaELpbpDRrMaUUsmCz?=
 =?us-ascii?Q?DOgdOICBovX8ENPegpxTzCwd6BM9scrLykKgIre+3J0XMUYIdX1y/z89NgsZ?=
 =?us-ascii?Q?oq2dBM2mJU0tMS0q92Nt88eb9y5TJlN/UAqEy50ZUBLMx/JC86Y90fdI1iNs?=
 =?us-ascii?Q?0iH44hogmgp7myf9ap4PFFJogoaBvMTz5vGMdFEVEQtqe1xRshwRKRSfWJqy?=
 =?us-ascii?Q?FfKmHcAKxZRsHo64qv/EAS/quwlsImzvW4X+W0nlIag48wXC/vFlix2NcHhp?=
 =?us-ascii?Q?QPNjFR4RXXe0FfHc5h3Juce2Smb1WdSSdcmZfEgArMnqutHMj2zlts0wu+I5?=
 =?us-ascii?Q?kKkNcME5FqQtROa4rmE/wHwU6Zoa8hKZj1rqq+LALHFl8ccpv3I7H4E9Mx/h?=
 =?us-ascii?Q?DK8n6/ZrBvZh/VvoVlvaAbFYioFdvLCes/UyptIF8m7UqYcX6dKxMfjH3SyZ?=
 =?us-ascii?Q?GXrFONrLrpmurl9L13GPn9DRNu7bfC3Xsx/WJIh+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ruG4ZEVmYpkis1w+rLGAjiCXE6vfqJAIyA9KgtyOq9dpoC/THsANqT+Y1BwnbGFnaf1p7fE3q/jjB9I0vfW74X6iTraytttGd+Kcyaz/PrHNVaafNK294NJz5oSp5uAyOMi7QKkiBeTdBeYh72cm0FiA0up93z1dQ9Tv6aD+y1puQ7QC2apqUFYvD9MSsf+nW2Wsvenjff2B8KzkIxAdjTBwriTDzCugePBMH5Ilhh446cQBUiHRc5zI+Xfd+VRFwDsJewlAdsHjY+tydSUQ0tVAeQRuSQL5tTMrFdEmBdqsr01HvBIUIJPPXr2/UFzV5iTh30Wtgiq1sJWOBMYNyKfH4EwH4Do3I4EA315oerFpenJuBxyOkcwxfuT0/pEkaOz4DSGXwGj1zLTINVPUQUg/wObnNIjs1+Ebvnz4LJ8GQiJPp8yIBY0yGVV1a3NTOlh8kkPGmJLKSCXttm0bSBZ2zRFKTa8eZqSOtu3pYE5Fv+TEubcqbptHnEIei3qkA+nHVoRXVeTl13JNweLNemCDXpUkGn9TDakP1b+Kp74YcNoFKTcbOMibrX6AtwsedhC1qhw0UFS8KbpyoqPKYmgU/ItNakrU9ayoCydMZFE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca01a6d-3d82-472e-0356-08ddad6a9812
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 06:45:48.8927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8m85MkiHy+/LqBZu8Qf+GWkqeLQtlwq2dTh8DKE6nQ2AVc9U+lHiagK2JtTBMJB07ECrjBbKCZb3/ATvW2p2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7191
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170054
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA1NCBTYWx0ZWRfXyCqcrvSl4QnZ gQVoToxZxORFXtf5TGxyjXilIj3Vkck8iv1K5WsI0W5XgQBdYbWEy0o+KrSW7/FqBXSzjMfQ/5H B/RXGVa00LcWe5zWa5wXzi6ndygJbukYeIwYIZ9dBZlyPWvPSA2+gQv9OYmGSdNImqhRVRl6Spv
 PDikAL9NW7p34iagNkNXTyCNSiRU8jQG5515IiSRQOkN3Z0yw1zUxiCy6Z9cmVat/9oGTGMHRuV FY7m7kk3uSdLC0ILOh0BPD8uFLpzN6NEHGn5ChgNQFJ27uwywWwLOzkXB3c+vesyJHyKKNyKFmO nbhxvkTuawYkzHF6jkAYAe9dyWAyjTqYRIgXeDvkYhVCAXWoajh8xTNKD2as2RvEwm9Smo8keNJ
 zOqBhhm8o87cw0uBnGdZT32UrM7YvvSZ91PNqBs0yEUjnUMH9L3Sh5upvAkQLpR7GmD5vb5N
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=68510f21 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=ID6ng7r3AAAA:8 a=aUALT4CXbtUI3ttKcsMA:9 a=CjuIK1q_8ugA:10
 a=AkheI1RvQwOzcTXhi5f4:22
X-Proofpoint-GUID: HC0XvB0Zi9v8kw70XG8WXs_0jgTDwCaW
X-Proofpoint-ORIG-GUID: HC0XvB0Zi9v8kw70XG8WXs_0jgTDwCaW

On Tue, Jun 17, 2025 at 01:42:20PM +0800, Lai, Yi wrote:
> On Mon, Jun 09, 2025 at 02:26:34PM +0100, Lorenzo Stoakes wrote:
> 
> Hi Lorenzo Stoakes,
> 
> Greetings!
> 
> I used Syzkaller and found that there is BUG: sleeping function called from invalid context in __relocate_anon_folios in linux-next next-20250616.
> 
> After bisection and the first bad commit is:
> "
> aaf5c23bf6a4 mm/mremap: introduce more mergeable mremap via MREMAP_RELOCATE_ANON
> "
> 
> All detailed into can be found at:
> https://github.com/laifryiee/syzkaller_logs/tree/main/250617_015846___relocate_anon_folios
> Syzkaller repro code:
> https://github.com/laifryiee/syzkaller_logs/tree/main/250617_015846___relocate_anon_folios/repro.c
> Syzkaller repro syscall steps:
> https://github.com/laifryiee/syzkaller_logs/tree/main/250617_015846___relocate_anon_folios/repro.prog
> Syzkaller report:
> https://github.com/laifryiee/syzkaller_logs/tree/main/250617_015846___relocate_anon_folios/repro.report
> Kconfig(make olddefconfig):
> https://github.com/laifryiee/syzkaller_logs/tree/main/250617_015846___relocate_anon_folios/kconfig_origin
> Bisect info:
> https://github.com/laifryiee/syzkaller_logs/tree/main/250617_015846___relocate_anon_folios/bisect_info.log
> bzImage:
> https://github.com/laifryiee/syzkaller_logs/raw/refs/heads/main/250617_015846___relocate_anon_folios/bzImage_050f8ad7b58d9079455af171ac279c4b9b828c11
> Issue dmesg:
> https://github.com/laifryiee/syzkaller_logs/blob/main/250617_015846___relocate_anon_folios/050f8ad7b58d9079455af171ac279c4b9b828c11_dmesg.log
> 
> "
> [   51.309319] BUG: sleeping function called from invalid context at ./include/linux/pagemap.h:1112
> [   51.309788] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 670, name: repro
> [   51.310130] preempt_count: 1, expected: 0
> [   51.310316] RCU nest depth: 1, expected: 0
> [   51.310502] 4 locks held by repro/670:a
> [   51.310675]  #0: ffff88801360abe0 (&mm->mmap_lock){++++}-{4:4}, at: __do_sys_mremap+0x42e/0x1620
> [   51.311098]  #1: ffff888011a2f078 (&anon_vma->rwsem/1){+.+.}-{4:4}, at: copy_vma_and_data+0x541/0x1790
> [   51.311526]  #2: ffffffff8725c7c0 (rcu_read_lock){....}-{1:3}, at: ___pte_offset_map+0x3f/0x6c0
> [   51.311929]  #3: ffff888013e8adf8 (ptlock_ptr(ptdesc)#2){+.+.}-{3:3}, at: __pte_offset_map_lock+0x1a2/0x3c0
> [   51.312375] Preemption disabled at:
> [   51.312377] [<ffffffff81e14222>] __pte_offset_map_lock+0x1a2/0x3c0
> [   51.312828] CPU: 0 UID: 0 PID: 670 Comm: repro Not tainted 6.16.0-rc2-next-20250616-050f8ad7b58d #1 PREEMPT(voluntary)
> [   51.312837] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 044
> [   51.312846] Call Trace:
> [   51.312850]  <TASK>
> [   51.312853]  dump_stack_lvl+0x121/0x150
> [   51.312878]  dump_stack+0x19/0x20
> [   51.312884]  __might_resched+0x37b/0x5a0
> [   51.312900]  ? __sanitizer_cov_trace_const_cmp8+0x1c/0x30
> [   51.312917]  __might_sleep+0xa3/0x170
> [   51.312926]  ? vm_normal_folio+0x8c/0x170
> [   51.312938]  __relocate_anon_folios+0xf97/0x2960

Looks like it should call folio_trylock() instead of folio_lock()?

-- 
Cheers,
Harry / Hyeonggon

> [   51.312953]  ? reacquire_held_locks+0xdd/0x1f0
> [   51.312970]  ? __pfx___relocate_anon_folios+0x10/0x10
> [   51.312982]  ? lock_set_class+0x17a/0x260
> [   51.312994]  copy_vma_and_data+0x606/0x1790
> [   51.313006]  ? percpu_counter_add_batch+0xd9/0x210
> [   51.313028]  ? __pfx_copy_vma_and_data+0x10/0x10
> [   51.313035]  ? vms_complete_munmap_vmas+0x525/0x810
> [   51.313051]  ? __pfx_do_vmi_align_munmap+0x10/0x10
> [   51.313064]  ? __sanitizer_cov_trace_const_cmp4+0x1a/0x20
> [   51.313074]  ? mtree_range_walk+0x728/0xb70
> [   51.313089]  ? __lock_acquire+0x412/0x22a0
> [   51.313098]  ? __sanitizer_cov_trace_const_cmp1+0x1e/0x30
> [   51.313107]  ? percpu_counter_add_batch+0xd9/0x210
> [   51.313114]  ? debug_smp_processor_id+0x20/0x30
> [   51.313131]  ? __this_cpu_preempt_check+0x21/0x30
> [   51.313139]  ? lock_is_held_type+0xef/0x150
> [   51.313149]  move_vma+0x689/0x1a60
> [   51.313161]  ? __pfx_move_vma+0x10/0x10
> [   51.313169]  ? cap_mmap_addr+0x58/0x140
> [   51.313182]  ? __sanitizer_cov_trace_const_cmp4+0x1a/0x20
> [   51.313191]  ? security_mmap_addr+0x63/0x1b0
> [   51.313203]  ? __sanitizer_cov_trace_const_cmp8+0x1c/0x30
> [   51.313212]  ? __get_unmapped_area+0x1a4/0x440
> [   51.313223]  ? __sanitizer_cov_trace_const_cmp8+0x1c/0x30
> [   51.313232]  ? vrm_set_new_addr+0x21d/0x2b0
> [   51.313241]  __do_sys_mremap+0xeb4/0x1620
> [   51.313251]  ? __pfx___do_sys_mremap+0x10/0x10
> [   51.313261]  ? __this_cpu_preempt_check+0x21/0x30
> [   51.313276]  ? __this_cpu_preempt_check+0x21/0x30
> [   51.313300]  __x64_sys_mremap+0xc7/0x150
> [   51.313307]  ? syscall_trace_enter+0x14d/0x280
> [   51.313320]  x64_sys_call+0x1933/0x2150
> [   51.313332]  do_syscall_64+0x6d/0x2e0
> [   51.313342]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   51.313349] RIP: 0033:0x7ff58583ee5d
> [   51.313361] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 898
> [   51.313367] RSP: 002b:00007ffd1f3a23e8 EFLAGS: 00000217 ORIG_RAX: 0000000000000019
> [   51.313376] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007ff58583ee5d
> [   51.313380] RDX: 0000000000002000 RSI: 0000000000002000 RDI: 000000002022e000
> [   51.313384] RBP: 00007ffd1f3a23f0 R08: 000000002038d000 R09: 0000000000000001
> [   51.313387] R10: 000000000000000f R11: 0000000000000217 R12: 00007ffd1f3a2508
> [   51.313391] R13: 0000000000401126 R14: 0000000000403e08 R15: 00007ff585bab000
> [   51.313403]  </TASK>
> "
> 
> Hope this cound be insightful to you.
> 
> Regards,
> Yi Lai
> 
> ---
> 
> If you don't need the following environment to reproduce the problem or if you
> already have one reproduced environment, please ignore the following information.
> 
> How to reproduce:
> git clone https://gitlab.com/xupengfe/repro_vm_env.git
> cd repro_vm_env
> tar -xvf repro_vm_env.tar.gz
> cd repro_vm_env; ./start3.sh  // it needs qemu-system-x86_64 and I used v7.1.0
>   // start3.sh will load bzImage_2241ab53cbb5cdb08a6b2d4688feb13971058f65 v6.2-rc5 kernel
>   // You could change the bzImage_xxx as you want
>   // Maybe you need to remove line "-drive if=pflash,format=raw,readonly=on,file=./OVMF_CODE.fd \" for different qemu version
> You could use below command to log in, there is no password for root.
> ssh -p 10023 root@localhost
> 
> After login vm(virtual machine) successfully, you could transfer reproduced
> binary to the vm by below way, and reproduce the problem in vm:
> gcc -pthread -o repro repro.c
> scp -P 10023 repro root@localhost:/root/
> 
> Get the bzImage for target kernel:
> Please use target kconfig and copy it to kernel_src/.config
> make olddefconfig
> make -jx bzImage           //x should equal or less than cpu num your pc has
> 
> Fill the bzImage file into above start3.sh to load the target kernel in vm.
> 
> 
> Tips:
> If you already have qemu-system-x86_64, please ignore below info.
> If you want to install qemu v7.1.0 version:
> git clone https://github.com/qemu/qemu.git
> cd qemu
> git checkout -f v7.1.0
> mkdir build
> cd build
> yum install -y ninja-build.x86_64
> yum -y install libslirp-devel.x86_64
> ../configure --target-list=x86_64-softmmu --enable-kvm --enable-vnc --enable-gtk --enable-sdl --enable-usb-redir --enable-slirp
> make
> make install 
> 
> > A long standing issue with VMA merging of anonymous VMAs is the requirement
> > to maintain both vma->vm_pgoff and anon_vma compatibility between merge
> > candidates.
> > 
> > For anonymous mappings, vma->vm_pgoff (and consequently, folio->index)
> > refer to virtual page offsets, that is, va >> PAGE_SHIFT.
> > 
> > However upon mremap() of an anonymous mapping that has been faulted (that
> > is, where vma->anon_vma != NULL), we would then need to walk page tables to
> > be able to access let alone manipulate folio->index, mapping fields to
> > permit an update of this virtual page offset.
> > 
> > Therefore in these instances, we do not do so, instead retaining the
> > virtual page offset the VMA was first faulted in at as it's vma->vm_pgoff
> > field, and of course consequently folio->index.
> > 
> > On each occasion we use linear_page_index() to determine the appropriate
> > offset, cleverly offset the vma->vm_pgoff field by the difference between
> > the virtual address and actual VMA start.
> > 
> > Doing so in effect fragments the virtual address space, meaning that we are
> > no longer able to merge these VMAs with adjacent ones that could, at least
> > theoretically, be merged.
> > 
> > This also creates a difference in behaviour, often surprising to users,
> > between mappings which are faulted and those which are not - as for the
> > latter we adjust vma->vm_pgoff upon mremap() to aid mergeability.
> > 
> > This is problematic firstly because this proliferates kernel allocations
> > that are pure memory pressure - unreclaimable and unmovable -
> > i.e. vm_area_struct, anon_vma, anon_vma_chain objects that need not exist.
> > 
> > Secondly, mremap() exhibits an implicit uAPI in that it does not permit
> > remaps which span multiple VMAs (though it does permit remaps that
> > constitute a part of a single VMA).
> > 
> > This means that a user must concern themselves with whether merges succeed
> > or not should they wish to use mremap() in such a way which causes multiple
> > mremap() calls to be performed upon mappings.
> > 
> > This series provides users with an option to accept the overhead of
> > actually updating the VMA and underlying folios via the
> > MREMAP_RELOCATE_ANON flag.
> > 
> > If MREMAP_RELOCATE_ANON is specified, but an ordinary merge would result in
> > the mremap() succeeding, then no attempt is made at relocation of folios as
> > this is not required.
> > 
> > Even if no merge is possible upon moving of the region, vma->vm_pgoff and
> > folio->index fields are appropriately updated in order that subsequent
> > mremap() or mprotect() calls will succeed in merging.
> > 
> > This flag falls back to the ordinary means of mremap() should the operation
> > not be feasible. It also transparently undoes the operation, carefully
> > holding rmap locks such that no racing rmap operation encounters incorrect
> > or missing VMAs.
> > 
> > In addition, the MREMAP_MUST_RELOCATE_ANON flag is supplied in case the
> > user needs to know whether or not the operation succeeded - this flag is
> > identical to MREMAP_RELOCATE_ANON, only if the operation cannot succeed,
> > the mremap() fails with -EFAULT.
> > 
> > Note that no-op mremap() operations (such as an unpopulated range, or a
> > merge that would trivially succeed already) will succeed under
> > MREMAP_MUST_RELOCATE_ANON.
> > 
> > mremap() already walks page tables, so it isn't an order of magntitude
> > increase in workload, but constitutes the need to walk to page table leaf
> > level and manipulate folios.
> > 
> > The operations all succeed under THP and in general are compatible with
> > underlying large folios of any size. In fact, the larger the folio, the
> > more efficient the operation is.
> > 
> > Performance testing indicate that time taken using MREMAP_RELOCATE_ANON is
> > on the same order of magnitude of ordinary mremap() operations, with both
> > exhibiting time to the proportion of the mapping which is populated.
> > 
> > Of course, mremap() operations that are entirely aligned are significantly
> > faster as they need only move a VMA and a smaller number of higher order
> > page tables, but this is unavoidable.
> > 
> > Previous efforts in this area
> > =============================
> > 
> > An approach addressing this issue was previously suggested by Jakub Matena
> > in a series posted a few years ago in [0] (and discussed in a masters
> > thesis).
> > 
> > However this was a more general effort which attempted to always make
> > anonymous mappings more mergeable, and therefore was not quite ready for
> > the upstream limelight. In addition, large folio work which has occurred
> > since requires us to carefully consider and account for this.
> > 
> > This series is more conservative and targeted (one must specific a flag to
> > get this behaviour) and additionally goes to great efforts to handle large
> > folios and account all of the nitty gritty locking concerns that might
> > arise in current kernel code.
> > 
> > Thanks goes out to Jakub for his efforts however, and hopefully this effort
> > to take a slightly different approach to the same problem is pleasing to
> > him regardless :)
> > 
> > [0]:https://lore.kernel.org/all/20220311174602.288010-1-matenajakub@gmail.com/
> > 
> > Use-cases
> > =========
> > 
> > * ZGC is a concurrent GC shipped with OpenJDK. A prototype is being worked
> >   upon which makes use of extensive mremap() operations to perform
> >   defragmentation of objects, taking advantage of the plentiful available
> >   virtual address space in a 64-bit system.
> > 
> >   In instances where one VMA is faulted in and another not, merging is not
> >   possible, which leads to significant, unreclaimable, kernel metadata
> >   overhead and contention on the vm.max_map_count limit.
> > 
> >   This series eliminates the issue entirely.
> > * It was indicated that Android similarly moves memory around and
> >   encounters the very same issues as ZGC.
> > * SUSE indicate they have encountered similar issues as pertains to an
> >   internal client.
> > 
> > Past approaches
> > ===============
> > 
> > In discussions at LSF/MM/BPF It was suggested that we could make this an
> > madvise() operation, however at this point it will be too late to correctly
> > perform the merge, requiring an unmap/remap which would be egregious.
> > 
> > It was further suggested that we simply defer the operation to the point at
> > which an mremap() is attempted on multiple immediately adjacent VMAs (that
> > is - to allow VMA fragmentation up until the point where it might cause
> > perceptible issues with uAPI).
> > 
> > This is problematic in that in the first instance - you accrue
> > fragmentation, and only if you were to try to move the fragmented objects
> > again would you resolve it.
> > 
> > Additionally you would not be able to handle the mprotect() case, and you'd
> > have the same issue as the madvise() approach in that you'd need to
> > essentially re-map each VMA.
> > 
> > Additionally it would become non-trivial to correctly merge the VMAs - if
> > there were more than 3, we would need to invent a new merging mechanism
> > specifically for this, hold locks carefully over each to avoid them
> > disappearing from beneath us and introduce a great deal of non-optional
> > complexity.
> > 
> > While imperfect, the mremap flag approach seems the least invasive most
> > workable solution (until further rework of the anon_vma mechanism can be
> > achieved!)
> > 
> > Testing
> > =======
> > 
> > * Significantly expanded self-tests, all of which are passing.
> > * Explicit testing of forked cases including anon_vma reuse, all passing
> >   correctly.
> > * Ran all self tests with MREMAP_RELOCATE_ANON forced on for all anonymous
> >   mremap()'s.
> > * Ran heavy workloads with MREMAP_RELOCATE_ANON forced on on real hardware
> >   (kernel compilation, etc.)
> > * Ran stress-ng --mremap 32 for an hour with MREMAP_RELOCATE_ANON forced on
> >   on real hardware.
> > 
> > Series History
> > ==============
> > 
> > Non-RFC:
> > * Rebased on mm-new and fixed merge conflicts, re-confirmed building and
> >   all tests passing.
> > * Seems to have settled down with all feedback previously raised addressed,
> >   so un-RFC'd to propose the series for mainline, timed for the start of
> >   the 6.16 rc cycle (thus targeting 6.17).
> > 
> > RFC v3:
> > * Rebased on and fixed conflicts against mm-new.
> > * Removed invalid use of folio_test_large_maybe_mapped_shared() in
> >   __relocate_large_folio() - this has since been removed and inlined (see
> >   [0]) anyway but we should be using folio_maybe_mapped_shared() here at
> >   any rate.
> > * Moved unnecessary folio large, ksm checks in __relocate_large_folio() to
> >   relocate_large_folio() - we already check this in relocate_anon_pte() so
> >   this is duplicated in that case.
> > * Added new tests explicitly checking that MREMAP_MUST_RELOCATE_ANON fails
> >   for forked processes, both forked children with parents as indicated by
> >   avc, and forked parents with children.
> > * Added anon_vma_assert_locked() helper.
> > * Removed vma_had_uncowed_children() as it was incorrectly implemented (it
> >   didn't account for grandchildren and descendents being not being
> >   self-parented), and replaced with a general
> >   vma_maybe_has_shared_anon_folios() function which checks both parent and
> >   child VMAs. Wei raised a concern in this area, this helps clarify and
> >   correct.
> > * Converted anon_vma vs. mmap lock check in
> >   vma_maybe_has_shared_anon_folios() to be more sensible and to assume the
> >   caller hold sufficient locks (checked with assert).
> > * Added additional recipients based on recent MAINTAINERS changes.
> > * Added missing reference to Jakub's efforts in this area a few years ago
> >   to cover letter. Thanks Jakub!
> > https://lore.kernel.org/all/cover.1746305604.git.lorenzo.stoakes@oracle.com/
> > 
> > RFC v2:
> > * Added folio_mapcount() check on relocate anon to assert exclusively
> >   mapped as per Jann.
> > * Added check for anon_vma->num_children > nr_pages in
> >   should_relocate_anon() as per Jann.
> > * Separated out vma_had_uncowed_parents() into shared helper function and
> >   added vma_had_uncowed_children() to implement the above.
> > * Add comment clarifying why we do not require an rmap lock on the old VMA
> >   due to fork requiring an mmap write lock which we hold.
> > * Corrected error path on __anon_vma_prepare() in copy_vma() as per Jann.
> > * Checked for folio pinning and abort if in place. We do so, because this
> >   implies the folio is being used by the kernel for a time longer than the
> >   time over which an mmap lock is held (which will not be held at the time
> >   of us manipulating the folio, as we hold the mmap write lock). We are
> >   manipulating mapping, index fields and being conservative (additionally
> >   mirroring what UFFDIO_MOVE does), we cannot assume that whoever holds the
> >   pin isn't somehow relying on these not being manipulated. As per David.
> > * Propagated mapcount, maybe DMA pinned checks to large folio logic.
> > * Added folio splitting - on second thoughts, it would be a bit silly to
> >   simply disallow the request because of large folio misalignment, work
> >   around this by splitting the folio in this instance.
> > * Added very careful handling around rmap lock, making use of
> >   folio_anon_vma(), to ensure we do not deadlock on anon_vma.
> > * Prefer vm_normal_folio() to vm_normal_page() & page_folio().
> > * Introduced has_shared_anon_vma() to de-duplicate shared anon_vma check.
> > * Provided sys_mremap() helper in vm_util.[ch] to be shared among test
> >   callers and de-duplicate. This must be a raw system call, as glibc will
> >   otherwise filter the flags.
> > * Expanded the mm CoW self-tests to explicitly test with
> >   MREMAP_RELOCATE_ANON for partial THP pages. This is useful as it
> >   exercises split_folio() code paths explicitly. Additionally some cases
> >   cannot succeed, so we also exercise undo paths.
> > * Added explicit lockdep handling to teach it that we are handling two
> >   distinct anon_vma locks so it doesn't spuriously report a deadlock.
> > * Updated anon_vma deadlock checks to check anon_vma->root. Shouldn't
> >   strictly be necessary as we explicitly limit ourselves to unforked
> >   anon_vma's, but it is more correct to do so, as this is where the lock is
> >   located.
> > * Expanded the split_huge_page_test.c test to also test using the
> >   MREMAP_RELOCATE_ANON flag, this is useful as it exercises the undo path.
> > https://lore.kernel.org/all/cover.1745307301.git.lorenzo.stoakes@oracle.com/
> > 
> > RFC v1:
> > https://lore.kernel.org/all/cover.1742478846.git.lorenzo.stoakes@oracle.com/
> > 
> > Lorenzo Stoakes (11):
> >   mm/mremap: introduce more mergeable mremap via MREMAP_RELOCATE_ANON
> >   mm/mremap: add MREMAP_MUST_RELOCATE_ANON
> >   mm/mremap: add MREMAP[_MUST]_RELOCATE_ANON support for large folios
> >   tools UAPI: Update copy of linux/mman.h from the kernel sources
> >   tools/testing/selftests: add sys_mremap() helper to vm_util.h
> >   tools/testing/selftests: add mremap() cases that merge normally
> >   tools/testing/selftests: add MREMAP_RELOCATE_ANON merge test cases
> >   tools/testing/selftests: expand mremap() tests for
> >     MREMAP_RELOCATE_ANON
> >   tools/testing/selftests: have CoW self test use MREMAP_RELOCATE_ANON
> >   tools/testing/selftests: test relocate anon in split huge page test
> >   tools/testing/selftests: add MREMAP_RELOCATE_ANON fork tests
> > 
> >  include/linux/rmap.h                          |    4 +
> >  include/uapi/linux/mman.h                     |    8 +-
> >  mm/internal.h                                 |    1 +
> >  mm/mremap.c                                   |  719 ++++++-
> >  mm/vma.c                                      |   77 +-
> >  mm/vma.h                                      |   36 +-
> >  tools/include/uapi/linux/mman.h               |    8 +-
> >  tools/testing/selftests/mm/cow.c              |   23 +-
> >  tools/testing/selftests/mm/merge.c            | 1690 ++++++++++++++++-
> >  tools/testing/selftests/mm/mremap_test.c      |  262 ++-
> >  .../selftests/mm/split_huge_page_test.c       |   25 +-
> >  tools/testing/selftests/mm/vm_util.c          |    8 +
> >  tools/testing/selftests/mm/vm_util.h          |    3 +
> >  tools/testing/vma/vma.c                       |    5 +-
> >  tools/testing/vma/vma_internal.h              |   38 +
> >  15 files changed, 2732 insertions(+), 175 deletions(-)
> > 
> > --
> > 2.49.0

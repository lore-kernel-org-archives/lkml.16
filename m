Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB4723507A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018949; cv=fail; b=CucwjBl3g0V3iorDv2r56o1PVXFQ0fWf9S0AhXbONE8SlEpXJSmv4Xj1di5oab136rH4d5VS6M5z0/Vxke4TzSg+skQIJoOrgS4va3oxWj69c4hKhYQYMlsc3gm6kpOqhgwB4hNCBx9dOUotE8CP6pV9ub3xI84nzLtlhD2XXQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018949; c=relaxed/simple;
	bh=YlvD+DPebfrUhlKlmuYHPFOpZbxWRjPHx1Zsh6ida9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z4CAnVFzkNJKf30c8+wYQdWRNmfwUmnGID81zYrYxU62i4H79ph1AgzcVGw7Uv3RBvttzGqGt927UJYzx/SoQPNfkW0cx+srOK8Vj/RBWcU8vbRzu6eW1m/9Pyq9NV4AmLz+P/DksJa3EZiz8OekgcPOnknn9VM0XmOLyrTbVd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NooBIF67; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YxD9CrhM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NooBIF67";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YxD9CrhM"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UD00u0006220;
	Wed, 30 Apr 2025 13:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=RIf/P/XFpp6QE8fSHa
	Uea36C2bhA1g/T1qoRE550X/g=; b=NooBIF67T62ZYnJw9vDt+jqThbc/spWwL2
	RjTJbJfefzrcyDskyJvSLF+CTbBTvgv3vClXyKf9e/b5WkEI6pqvykpOjTxeNfMr
	lBWqZ5s84iN+KiHwaWxCSGtVkKf7eyzJUVa+O1MkFE+yZ89CTDJUPS0vK5HBqPhJ
	JwVVS4a5BPO5pZ00+fK4pE2z5PTOHVj7VZjoLtTgA6z6qhH+N2MDuR2vDz3YnvdJ
	5jc0ytmgT+ANOh0UfhjVCTsIng42Apwwxf1L+1pf4d3xsOeb3ks+kpGEG+rGMg1E
	y3jRhCbc84NZxWu8oAs7e2rIUve6z2U6iaCNXTQ5QlHCI19YCyhQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6uks5f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 13:15:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53UCXgSo023840;
	Wed, 30 Apr 2025 13:15:30 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazlp17011028.outbound.protection.outlook.com [40.93.14.28])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxhhxsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 13:15:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTMLLVoQm59OGKw3thZhOiTvN5+aW6R7+/haPN2fcp6CdslbIahwradDLG1tFZyP99NqvHKYqs5/3eBtC4BLJ6gKezXhl7HTtXMDn12kDm1vFEXPY/iCFJ4dLhrHPvPYcicqGsXNUCr78Cum5jJODhV9XKKWTgTdLyeUwEdIq73w6GEuZqIwiL4p1wUOVFc54UzUwuqtnKA20BFblUli3HPlghCxmne2gS7i1/Ru0ROkl5Vm+stq7TX1lMGSaY0nPpyId9JPDlLsnRzLQ6teBb0OXw5o8+GmVJOiAXoRDD1EsS1BhSGU/0sEajThljVC6cNAOJ1I8SSbRCmXC2jbSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIf/P/XFpp6QE8fSHaUea36C2bhA1g/T1qoRE550X/g=;
 b=RdGyxqkKxxIcNJXLRHk8WkcYpyS92D9zHOWoOQqk+UaCDcArV4fhcl+oWTfN9y/pX5fd6yQ02p1CIU6F1MTuU9B2Qjskr0PFMAwk2q/7UBoWfrTDPzGn4YJMrBZjJ1VWdLQJen6gKgAloL7wXA3w1+bPmBQ37OpDKmHNicrtgXOT4XzcZhTu9Cavz1YbZ+WXuR9cBoHAwLGtaydqHrPj35fwSVTeqV+wTU2gtBlgE7Eh1ZXer/1LILSKsMRrhqVE9koyefVEfpduF1AsPnsu4xarRnGEqeRcJRyaX5J68L8KwKtB4eCCQTw8Bg3JBPg3r4c+5BtC08IBsfPb/gFiwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIf/P/XFpp6QE8fSHaUea36C2bhA1g/T1qoRE550X/g=;
 b=YxD9CrhMNmFs18TweOy7RaLxvHRPL3MQBCqIAbYs8HHMRlB0CizemxQPOrPS5jFOXC46WeUTVrydwup7+90jjw1joe7BTzIvb+PlpRYUBBsE4vK7W4NAVWN0wPOkOA7sv1uMebwVFShlMliZjC0p4vuXDaFjpZuxMuhAHY6SqkU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN2PR10MB4144.namprd10.prod.outlook.com (2603:10b6:208:1d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Wed, 30 Apr
 2025 13:15:27 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 13:15:27 +0000
Date: Wed, 30 Apr 2025 14:15:24 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 01/10] mm/mremap: introduce more mergeable mremap
 via MREMAP_RELOCATE_ANON
Message-ID: <8c052822-5365-4178-8e06-ecd4f917cf8a@lucifer.local>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
 <87e668d54927bb4ccdb7d374275e0662de667697.1745307301.git.lorenzo.stoakes@oracle.com>
 <20250430004703.63rumj4znewlbc2h@master>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430004703.63rumj4znewlbc2h@master>
X-ClientProxiedBy: LO4P123CA0242.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN2PR10MB4144:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a753c1d-4c15-4601-1939-08dd87e91335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wAXdS385cdBB6tAfi4BEkUz4t/Z4An5flmlQZq4i9/5uhbkOGs+a8N0rZu0O?=
 =?us-ascii?Q?XH3Y9PVJ1wngOIXTZGy1MuI0oidPLyHBZ+Td67B2wdkqr0s0aNxsobTYUpHm?=
 =?us-ascii?Q?QajwwvDVREwZdutw+yVKz8xV2GjaR8tHn2BNqU51egu51qi86m1dHU8tyI6t?=
 =?us-ascii?Q?+K1HTvjmY6Y/OMtWzpZebyneo/DvMLM09mNLI+ADCreWDeToHoTKXnwWBhi7?=
 =?us-ascii?Q?OBwfBBq4HPXNDfK0dzvY+T0MsgOy7V8qTmM+JSRLmuWNzWOkSrOjvqaNUsz3?=
 =?us-ascii?Q?CdQyfcdiZjHee5qPvQq73TnPFLfSxDOgOimRK/bIhKh3CMKQb3VGxEtpyKZN?=
 =?us-ascii?Q?BfXykLhCPvxPo6rWeYdi9oFJAyhKyZi3s8SvZSuyXFX1yDrhTukjK22Hbq1H?=
 =?us-ascii?Q?cjQwY9Gn54c1t3K2TyvsfcpgyHsSdO1WFg59Z+i560YKEtkk7vif0toWYJhn?=
 =?us-ascii?Q?ul22pgXcY5zFcYhvfX5Xyyr0XfDCRlZLvB2GkR8157/h45O37GE6CysF+SxX?=
 =?us-ascii?Q?gAPCxr4dQBHjUNTrQPsaC/8dKnOquEhk9nSt3AWOUXpckiJFB5Ahu5yhPFFJ?=
 =?us-ascii?Q?d67OFOyRgPngSV1JrGEZxzec+NhWALdKKhP5TqhewkzDA3JwDowz5/JfPo0h?=
 =?us-ascii?Q?Wf58G1pxXfqVNye3ou0584YWEIRDhCyE9lAH6iSMqcxln/6XrLRJLebTZjE5?=
 =?us-ascii?Q?n9qeQJyTw/QYu9X+aJr+iV1+bTgZCr16QmP+GCCfWpshSIa/PCnirebJ5328?=
 =?us-ascii?Q?1L0rATYr/Ebrb7pWPy1n35S0qnAGG/AaoKedowVQ3MfZ5fEuMnh+UoAVZVo/?=
 =?us-ascii?Q?5GFmEwPEh9ZHlm40qCk7iCHQXPvlzWak/upY95qycMx+ljCeT9rbDsRfr54I?=
 =?us-ascii?Q?ZhXxwcoUyeWkw9WR00/1+oy/WuDAvJCL0GdyZxE8NEYh7oR2uAdVCPT2vd48?=
 =?us-ascii?Q?rBBkKvx3UZcL/GvXXSFDAsYN0ql1Xdi/YDXa4FvbguYz2W6FEloq++5gMGX6?=
 =?us-ascii?Q?btHCTkRQheap40/1DdiWtopNTeNA3YhoYPwida3YCrcme21ZuumTZ9z/jGMy?=
 =?us-ascii?Q?Jh+OYCnuu0KwyitEtO9uss9qLrSDAjpyrsgxTYR0OFxhWXyWplziK2UgiVlM?=
 =?us-ascii?Q?XaOjASD/hQAfRKT0GuiP8It1rIATgxMb4WFdu2Cf2WviAAI5KxNKcmwg/6YL?=
 =?us-ascii?Q?EstSf0UKUtL7hnGYH6+eAuTqA8q0COwoFpsmkYfutO5PJbSHK9cgtZvDYWpj?=
 =?us-ascii?Q?WNXlmKMT0ckmE8X/Tlg5Fr/k6hS0a/MOEZS88locCMjehvu+eGHc5xitloOM?=
 =?us-ascii?Q?cUY1B8sHT9pUREqSLJN/RMaUr8jthW22emDMV3YgzUolyPS9UCwwQ2YEwmaM?=
 =?us-ascii?Q?5zkdJIRnPC5rfKi9PGPvrVeiJIkYMugr4lPDJX5QVbMLSYMyVKHTlYKL+BOa?=
 =?us-ascii?Q?+dpVGGLaMsQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K2nhhOmqGVT3DWvcuDaZkSKWH5yQ1IuO7jamN7ZHDbs9eFZCH/sk1xAX8lYn?=
 =?us-ascii?Q?BZk+1P3x3L1djREmLdk9yBpRxTJi2SAn6Dkn6wXP0OS37vfUlJJrNJMOIC2D?=
 =?us-ascii?Q?TbQzA4rlt6+PLmXEcy/7iMGVEvvIN0s7ivWfWtBM1C4wK0fLDnZoOE85vgfX?=
 =?us-ascii?Q?juxOCHXcgvmndpxqbH4QoLzd+8pyxdks72iaerUitEHxP3yjtEQHicvBrTGq?=
 =?us-ascii?Q?Qi9TpkwUE9OzFcaUMhcZ3rZvrL6lYQ7h+/dKebSClQae8BYll4dLC6y4O+nz?=
 =?us-ascii?Q?iLj/fS+ZhqDasmjSlNCh31ltKib7TAV6U9gQhkPtgXL30CrQfXjBaj22W5nf?=
 =?us-ascii?Q?tBQRvUpVsvD1yfzXpcnW7eCw4KLMgAVIFkByuDXGh8v/jlfwOAvvxcg+T1Ml?=
 =?us-ascii?Q?tu9FAVhU3F7jUubd78s+0cq2aql5fv7AUUgU1otQKIDC7auQnU9Cz0yxrktJ?=
 =?us-ascii?Q?Sutg1KjVdRhUTdFqKuaupzPVBFY4l43sVpY1U8dRqo3fMhX6JZAEG0NOGUim?=
 =?us-ascii?Q?41VfDPY9LROyJFYiat959JrBBFVrc63b79VLVMXYOtc6W8ppdEziSr4N67ix?=
 =?us-ascii?Q?XGJ117eqHeQekhTOsyivv6237LseLZOc7mCtC2WDwGvOQWsij1sLjfBz53h2?=
 =?us-ascii?Q?8UIfB2WmAQppIa0VKBOXkeFNVgPwsE6TGMPEKrEdnVj+8tOt8O6mYW+LsxpH?=
 =?us-ascii?Q?6pO0pFqxUM2ctybZSIQ1WYlxTCIuRbbMih4WXEYFUQZWuMufbeDriY63WMvu?=
 =?us-ascii?Q?ViqA2KLouMFAYNACOAUwvAE7yslx5rIQH2gACBtoPqwrhbUsURIsRvtFOipc?=
 =?us-ascii?Q?VVJ1XYPXZbyhgksOrrB0kx2uZCSmcwaksf9HpI1Z3hHKSy+xAgzom0ECXkHi?=
 =?us-ascii?Q?af7h8gSLKD0/IucwVq4OXjiLH+OU125k3ZTyBM7SbcEX8dyk9TXXdPvd7FMb?=
 =?us-ascii?Q?WPvNRiRBmmsn3EYVxIlyU1WYgsJj6ThiI2DjJTzlx5tH3Y0gqMKwPTyE1tIR?=
 =?us-ascii?Q?KLMUpbEs8ZZ5NbUhoBpbHnH7cHF+SyeOQYaP8LKQHh33Xc5z5UkRjk7krEnp?=
 =?us-ascii?Q?ChumqJncnM9jWpc4MPIZ9CT5IflShqXY2ixbkgIQXgSgvQB1izB5DwO4SOyo?=
 =?us-ascii?Q?HBCs9lpWMAG0ysapVwfkaPSOm8I5xL3qOM5dxQzUk9OqthTwuhMQpqrLYsz5?=
 =?us-ascii?Q?YuU0iLuSuLuf+gjvQZuTQyCFWesK62zUPX15mNtc12axsHmyLoRB1ScHnZ7p?=
 =?us-ascii?Q?1X5OoUVf/EMxtSBykXu0xd7OnqNYfNKSRpkcoE1K1JRiPK7rKDLl8Eclj7c6?=
 =?us-ascii?Q?G9g9svnxOCN4DZrVzFsGAW8/Zq6y4mlEcgt+ykNA7Jj5I0aLY5nTePNFRnht?=
 =?us-ascii?Q?r941vkneGU72vdMIh98bUb28bwTFID8uW/OEecOIqsDUTgyqTKXsW380KrZ8?=
 =?us-ascii?Q?9IGQa5pt5P/CoaEnyj3mt+8CoKNd7OYdbXhliKVKdRbYjZ09kBljvp7cTKNF?=
 =?us-ascii?Q?Ol0VzBcHnn/kmDlzLMMGAInkUfsaTurR0CyzNdJP7Hy/Z2gFA04wJ3L1uxug?=
 =?us-ascii?Q?tRmN9tzv7JvcQPgLRMOhlIJ/fBtijLiWvFBTCm/MjJV6r+yi5rvys9wz2fPN?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y/ChM19QAIZkr/ZzvdyGmEiNa40RsHwq3Er6q2W4/y3rw2sRovYp+YLuMqxmbHNJIwk25Pjd2c1C46UVLVil7/T6S0LYd54s57DI7rfIiWBGEAzwu2NPIpuIxEIIAh1VlrJI585hTaIENMDS6sjMISJpLUqTNE60BkeqcQ5POMwE8992xdyxi8eGnM+Wi43oegzgcjpYCap1RyyzP18sqZ2WzbFI1qJ5UTvuXfIm2+plORuBnQPica7SlYwfmqIW9Y0tueLGyR7iFpVCooenKmWdCFN7bdrLpr4G0sYfup8/oVGBw8DhV+zFeyBB2kNCSLVVnTQE2NlVnpPVW6CIhoe2E/nkd593/gNCrtTZdrmTrGJOIMv3Lkz6cmbsTKMuUM1r/EkY2ha1WsvLFJekxkI51R11c0RGQ9FcfyKE1SttXRPeQ3v2wexWliH3123IKKKSCkNAqB06Ma83098iVpMMh7fFge3b7yYKcOEhvonKA5yL6KNblztl4kFki3Jrd560ZHgvtui3UbBDhO16u3tNEklNkRvmTCQ1MP/Xj7WU5RSxJKE++xSl5pFTjDAzi2jZzONSLOI03dvGr9+mr9ELuctxFeLoexedhz4Zi1k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a753c1d-4c15-4601-1939-08dd87e91335
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 13:15:27.6809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mdK/X0QHu1blx2hAEV+rJo2SaxFyRtmplwRCMUL6UlceiewDp9V/i0PwQ6ZxTzpO8NK+LUcmEBHrA2oMZv27IwgMm71X0XRdKusw3/VduL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4144
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=833 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504300094
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA5NCBTYWx0ZWRfX1lLWPDBjjroJ PGaAP5e/2ir9yAqEkIpVlsOY5kMfOiUTxaIPLquOEPp52jg6l8MTOArL7sNKIruPq5CGamVCRV3 2yUnwvEIlswM4AVCLwDsMph9YMiiyVGB+qncjtWpNzy8cKc+twgZFIYLqu4+XI/eMdLVK6BpMHk
 jTB4CuwqXo281NgVtjEwI3SjQfrfujx1nw0Ya8V9i0A9WiGXetjIcud+TUjTWlioj0+U+IPMkY2 cbE/dtzleoDMagqA9wwXbdKEIfSkEw6UPTD3cMZokrKPxwHkR4Ee5yY0IJQdCPttoAwuhzHRQXZ 48UnTYARhx3A8rUeink/7enxkKJctTCjGPq57Y7sHm2i/fFiLQDuRDDDPRAK/jYCwh9goBM8v19
 eIAaKDswRyX+QjvRqaSh1F1cGrR/qhtWX+g6cqmtj+wFl227mGJce5CG+y7cNyHGi3RuoCfT
X-Proofpoint-GUID: 1_Nhppv_xUKiIz8arS-qxIdMvjCnr800
X-Authority-Analysis: v=2.4 cv=A5VsP7WG c=1 sm=1 tr=0 ts=68122273 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=RYozuPF0e3wzHvhfyCQA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13130
X-Proofpoint-ORIG-GUID: 1_Nhppv_xUKiIz8arS-qxIdMvjCnr800

On Wed, Apr 30, 2025 at 12:47:03AM +0000, Wei Yang wrote:
> On Tue, Apr 22, 2025 at 09:09:20AM +0100, Lorenzo Stoakes wrote:
> [...]
> >+bool vma_had_uncowed_children(struct vm_area_struct *vma)
> >+{
> >+	struct anon_vma *anon_vma = vma ? vma->anon_vma : NULL;
> >+	bool ret;
> >+
> >+	if (!anon_vma)
> >+		return false;
> >+
> >+	/*
> >+	 * If we're mmap locked then there's no way for this count to change, as
> >+	 * any such change would require this lock not be held.
> >+	 */
> >+	if (rwsem_is_locked(&vma->vm_mm->mmap_lock))
> >+		return anon_vma->num_children > 1;
>
> Hi, Lorenzo
>
> May I have a question here?

Just ask the question.

However, with respect, the last drive-by review you gave was not helpful,
so I strongly suggest that this is not a great use of your time.

Again, I _strongly_ suggest you focus on bug fixes or the like.

Thanks.

>
> >+
> >+	/*
> >+	 * Any change that would increase the number of children would be
> >+	 * prevented by a read lock.
> >+	 */
> >+	anon_vma_lock_read(anon_vma);
> >+	ret = anon_vma->num_children > 1;
> >+	anon_vma_unlock_read(anon_vma);
> >+
> >+	return ret;
> >+}
>
> --
> Wei Yang
> Help you, Help me

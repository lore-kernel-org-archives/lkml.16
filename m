Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC9D86353
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935081; cv=fail; b=uwlF28BQub+wQH1+1MA4JeiwTjdCPiPX3RD2GLzqtQzqF2c/lDGFu95ge3bDuGp6gf4sm/syfiqztkVodyc56Aey1t5P9Luep1CWN2VtXQZu3c357Q6AM/r+JWGTIggny/e2LRsXdISqeFfnE3sblNyw8XStfmToMHJayX3ddtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935081; c=relaxed/simple;
	bh=nGCClgVI8sg1MP/EgE+vwjqXeKUWsts4UqIbvDd3E8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dhed7+o+AYiUlMdS1VO2LyUx/z5ogUm8SQF2s4IG1uDiEJeZUQl/u1kPTTF3y5i/aXBC9C+KyFK74eXgGC6Ex08rGc3CY9bK4C2NIkLGV3SYxyRfaQX46A7kS4rX+KcrObSoef957LuGiTxvM9Ib9L8OyGw03t8iuX+7CIWlqAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XH43goMN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uiRdef9g; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XH43goMN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uiRdef9g"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TDtxMp014854;
	Tue, 29 Apr 2025 13:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=e77KnWzQvQCiTFb2NZ
	IBx4B8xG52ISRUydD/MTvOQSA=; b=XH43goMNrFA79eMeh2FtLNuzd+FRhNDXzI
	PEqKN5q4OiFMVhZGkFCwa5wGCghUBy0ETcvhUm9pZF+k2cqXm0vx7PECYXkMsamq
	DWnKffT8R0JdPUtixEJ/8u9C2m14YWQoA4lqdWBiJT+mrbpu4MHKHePfbysJTwvL
	7Xwfd0f0fBY4llmzxM6r0X5x6SSoQ0LSKCdYmAr5rp4BC5f9a2TPz9caxRIA5vOE
	oE/3OwaDGBFgSFQKKmy2lk42k3tULW/VF9Dll7DTUUpB/cSN+V1DtpCxeNxtx7kR
	ECbNCnqHlOU9nCuTzGlfFvn+eXU5hvJDyfGzWbstNKGtwdDdCt3A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ayh2r30j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 13:57:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53TDXa9g011417;
	Tue, 29 Apr 2025 13:57:26 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nxadf9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 13:57:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MF7Tq1kTYL593Z+4k1H4W/bCTOV7N0DB0T0w+Uy7FS+mIs+EFu11L4KOczbGaLMw2UTuz+IlvvUxYuT6lFJZYeS0ghbgey375JiZIu7hYdDPXnRykiomdXTmtB3KFOs5Mhf2ReOEbeGC/IYJmfxF1wFsosqu/mvvcUQOsAJxZbEZKdy2S8fmh/aYQivO7WPNgx4DymI7UxY/MFTp89FIGpcgz0dWdpU0gfNKaBKoUKPpJ1K0sTIHxIuVY5ZpqjSPI2FJL23sbURBKOG5dhUPSAVYYx0BNvvA36MeG4g6FTZVoEiBv4BlkV2gLNWREcpd3BxSF6kT6LYoIvvVxJW+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e77KnWzQvQCiTFb2NZIBx4B8xG52ISRUydD/MTvOQSA=;
 b=rNpjreoUWjKMd4uw7aRHjMR1pql94QyJu1DDJAL4IAn3Xcuvap8pYcwjOTdBAsSdSefljc8rYUQYX2C1mXWHZSVAJLG2lcoBvq2Lndye+nYjdUm0Ita8XJSwj7G9G+WD8y0+tVnqYfsHdV2Qw9/EEkfn7zY/1vSz2V6szsSJLKMyc2KPpVI3wCC15TruSRvyqpoHG2GXe6sUgKKEuQAAR5Q9OAYy4T7ETYj/VM1MrhV1jCvmOECLMO7uFxsazNItst5PhaW8ftifU9TWMIFsbStDpmjppAqyNNR01zRdtXjfrcNrHrOGTKUoKdq840QOd9YttVHInOkGvHPFKk/7Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e77KnWzQvQCiTFb2NZIBx4B8xG52ISRUydD/MTvOQSA=;
 b=uiRdef9gmOR2VMfzcb5Wisvsx64VxS/H3DU1NjZs7vkC2EL0clVRnKfSsF5Dl89S+lu2s5SJ2MECJAjeCWFHHQ+o8hzN/unr+N55nZO4HS8asSATm8o38RG6K8eIOSdNXxn0vxMAiBScKh6nWW7yOaKkb5kjlVEnSUvIbpVOapc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB5718.namprd10.prod.outlook.com (2603:10b6:a03:3ed::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 13:57:23 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 13:57:23 +0000
Date: Tue, 29 Apr 2025 14:57:19 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
        ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
        Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
        anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
        ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
        quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
        yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
        hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
Message-ID: <7cf8235e-21f7-4643-82c4-82ad57d99b98@lucifer.local>
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-7-dev.jain@arm.com>
 <25dcf969-e479-4d4a-a95c-0e83706af99e@redhat.com>
 <9a770aec-a020-4199-a53e-eddda657999d@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a770aec-a020-4199-a53e-eddda657999d@redhat.com>
X-ClientProxiedBy: LO4P123CA0678.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: b18569dd-320a-4dc0-a245-08dd8725c42c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RvH26CJt0XRATBnHm03qC65cFb5zaFuUF4ss0R3VQNlyV928IJO+b9aWuX9I?=
 =?us-ascii?Q?GBT958atd+bG6gHx89kYeb1JLa70F1rwDi0Dekjm8la6eLmcK4GFuYnxQUqm?=
 =?us-ascii?Q?c0qd8fueGY/GZeIhZ/rd9S16lYC/zmXLntrn/1Z6Hxt01Z/F7vFnZu0zxON/?=
 =?us-ascii?Q?MJjWW4tG240YbbfaKlV36jSIqGc3psNbhC9hCeWcQ3sgCOy8lg8OqUCzVA3E?=
 =?us-ascii?Q?pvfT9P+3/JUL8wO14A2NUrmiLrb468y7bzXoiNG0MQDUVHITTQ4sUJzbgs/q?=
 =?us-ascii?Q?nRoB2ihQIHDTy6bsD9wje+hf5fDFC1aFhj08Bl3aFcRhbRxFSXSb1TQmf5dV?=
 =?us-ascii?Q?TkyJ+O8RJgbPKeAQW54EH4abZrNCk08UA+qYqqrZ2daaxKPwUbaluoF61DpV?=
 =?us-ascii?Q?PJ1wggkW+Z/8Lqp6bgqRduFKlU8Asy6q+2MrvPj/prb39LYl4yB2w4QDlifu?=
 =?us-ascii?Q?iO+GxUsfnB+OgLGzN47VOxfeO07HwRFdJDUs/zBVnW1zob/YCkv5rDdBT1GV?=
 =?us-ascii?Q?Q8o/QlzEHpfwh/DAFYl/0pDhtfoREuWrEYraDqX1R3DERD6GSYId33WAyzwM?=
 =?us-ascii?Q?2wXyUHD4FubzcrDv1iWeIyxP+A/0HkoMVaIqg4Q9lTWA23e4mx/RlWXFzpDd?=
 =?us-ascii?Q?LOybcqXXdZKJ3cvSulIO4g+sJku95EESCQNAApT5ycY+4P2JwF8N+JC3pIM7?=
 =?us-ascii?Q?IlnI/2jK+pN22Rf49a+SER1UTis2fnkpztUteB6SgnA5k7gZ2VYVTSpJYHf5?=
 =?us-ascii?Q?zQlXrRGGzko8Tc+aYUtS5hkqjI77ovF7LBhuYYjClyx+9oOjoxGJLm7R/CWY?=
 =?us-ascii?Q?CXO1wgjDtbpDXMOJxGgD46pFSuOUiHLtTwo3Wg0ey+sFvisUwFb11R0zm5WD?=
 =?us-ascii?Q?55FFMGXH4TTehwr/SEx+HUhtuAmkgNZAE9hi9rjG1qTqtwe+JSrtietM14yG?=
 =?us-ascii?Q?hvpwfMHbvSakEHRR7yv+At2LKj2AJpcKpwHTBI33c3tCq4EGzqycCjbUu7t0?=
 =?us-ascii?Q?yzdCUYr0oxkU5XrRo66EUj6rcMX0Qp4fdmuR+xEM+B3XNZsDAA19bR6TRJKy?=
 =?us-ascii?Q?XH/nXKx5cDzEGoE3UrG2Ay/3gVaXNCzuYeIPTXuUtnatuXJh1uKZit5JZLHt?=
 =?us-ascii?Q?m+Ivy3bMdst24DY6PQ0YqeKMKKhvoVGzT+HvoEa5m3NPwtvuJjVSzKW+v05S?=
 =?us-ascii?Q?nbvc4gEcVAAYIGizeDgF8tLV4Vol3A971tus8xLHHRMNDqxXwtp+AdDxOCAX?=
 =?us-ascii?Q?d4iQkqJCoe4KYxC63ZevpILwe/HhQ9a9TmZZ4iW0Ocxl/XbblFflgWtS0/HH?=
 =?us-ascii?Q?WQZnQ4D1FyY2iKjHHcn/D2VQVnmsqUl6kU+5DAvWWdoTEbozjjMUmuFDugtm?=
 =?us-ascii?Q?zTRXRDa6Eqx1l9lQKuJ1ivel/t8iusHJNN7OP36cgq/Q2EZkk9kcVSQG5pJ4?=
 =?us-ascii?Q?shpdIRhyGsA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JS4jz3MoBTxf9/yg737Wg6Cne0FUAgiR4fOxnNr6mhf8Ucgbxf/acfOYKNTd?=
 =?us-ascii?Q?RzIZniHd+DizxMp+7aEMBJxrLUietCHoHwWwZictALXX9ejH6B/WsWX3t/rM?=
 =?us-ascii?Q?k5/AmzfhVvuUG8QhI0IS/wz2iOj7EEiLqUSK0q71SWIU220QiZ+Y+rBKibNY?=
 =?us-ascii?Q?EOCq6f1RXjDns7XcwGx1YJaW5TbcVvXpsrvLqJ0yAmIdT214w48nYEyFirTj?=
 =?us-ascii?Q?mwGQqD7djai0OlDL6UunmcHxN4Qxg7yVAuKOwMLuAMWmIjCWEK2QxXlMyk3t?=
 =?us-ascii?Q?XW1jtgMR8OWT7SmwyQ+PcoQhj3+pa53gKs4Yhe4pKMdIU44ZNBzKEFTPQeZI?=
 =?us-ascii?Q?x+2LqMktlIR1XfRoABYeuu+A5AqDAdsD9FjwFx8oKP68WHk0m+LWhnYCE+iL?=
 =?us-ascii?Q?EUh4fT1Qg+L81kwCSIXbqiQXNfynesxwW+9gnweBrTcRnX/wGAftd+0/xGc6?=
 =?us-ascii?Q?md1lKZHZyBs5/yIk7LM0zEohdTseK49m8GB6l/lBo8FrgLU0CpA9xKeCZs29?=
 =?us-ascii?Q?vyNylZhvgmz5x9/0gVuTotkUliATtN+PnvxnhVCJyS7joiC0x2xHkUpUepBI?=
 =?us-ascii?Q?oE+gxc7O92zjTSqJV6f3Uy8wI6c95gkvXpn8hdcbd5/lnvBhUwO15ku/VoGo?=
 =?us-ascii?Q?gyejN/9TH4y0KEO54MQvz49gSMagC3wkBt77NklB/VKuFOqL8dkjKTcyFoM9?=
 =?us-ascii?Q?YV1erXhTmd5/7JTq+6elZCD6+ZmQoarGQ3ASKgjwuRZnbseGcbvzxg01gwWV?=
 =?us-ascii?Q?Xxd/3p9ex3KjvmOBGY/fkkUOlBiXEpGBmVZ5J06LW2rhP6mgO9qSX+Psuj2Y?=
 =?us-ascii?Q?0NTRa0jqOv7uSANPz0VOltB4gcf4y1syBOhMx6Fn9p4tdzP6msYB0746pUBZ?=
 =?us-ascii?Q?Pr+JxsS6WWjR505NkOpp4We5R1HppAXv5WZHxmeOTjQKYUjbK4y6f6IQ525t?=
 =?us-ascii?Q?K+LlKx3Q4tYja60kKY72bthuLJQBe1Vn0SxEc9rcmC38jDHXtIyQzhTuEWHY?=
 =?us-ascii?Q?/dAbW24wXw7sUQ/wpbdVmZqmm0eW9Qpsqlf3u2X6njM7WUyLw9xCk55MxFH8?=
 =?us-ascii?Q?v+P9xqgK+NHR7gn8ztKTHvS3Kh6UUaUcDHqEZ17UjTa86Rrog2bq5M4d5GtC?=
 =?us-ascii?Q?uhcJeZZlKIkOjCOxN4W9Hf5S1KGBPpQL4YFybs5KeE6xY+JZjlTlgnkCA5pv?=
 =?us-ascii?Q?f+P/HNeFsBcfk2Ug7JNl30h6vgf5SsnNQNUHZjj9aokOrsDu3/bYcRjoRHaX?=
 =?us-ascii?Q?rbuwSkmNmjpWSdPRR8tmX0/am2NPCTDKAFfYhuNQ1bNBEDgpAyVuMGuhXk9s?=
 =?us-ascii?Q?d17fWYwu7bXNkIG3QWbCQRetUAXrZrm1wID6jTnri2RKB7DgFBvoRkdQphP0?=
 =?us-ascii?Q?SxzuBK8848X34kweB0xHU8tWnytxKlPOtZp+lFS90FT/WJrfMEJSHnNLTPGr?=
 =?us-ascii?Q?g4lB38jIQ3W441rviIXOYhpFUL83MJE1qb0mRm7rAWg5gUfZCZAEw9i8GiEc?=
 =?us-ascii?Q?40700Lu5qdRZKmn3IOsd2M+hRhHtzVkw+L5nodb0JBUzWGK54cIXrTCBfCaa?=
 =?us-ascii?Q?D98UXPc4bQfefc8A6wl0daLcqdk7nt/2yvDu27RP7wTXBw/3WnEfkj196mBZ?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	njXoqDQLO6q9ISIbyMi8Ev4Cx+lfVQJeXBSXk4DUphgPEbyT1E5Y8scwaEm1FdL3i5EaMPb5Q5iI6mqeoQ3L7vrAtmioTDrST4gXgtDDqPt7enN5mOERIjhHAE4iDEnQY+Vqm6RwARKpQuDLwWgNBrRBH3r4B3zSGXyq0oY2TndhLjHOk7C1zheG7x+CjLEY1IlE7TgU6mX19TkWzym6M6YWADbEZ8E3YK8ICfK1srAlOMb2PftPHpxEUZuPwAsOMoNAWSoGDb0cLwPmZ+rVfu+iECtNz9tF+aRAfQebemtqikV/sgMmVWvh19L0LLEq1+EJNDMLlvez0yonjPGXKk1pd5YQwtmnwYX4ybhfE/Kxzvp+utqkl1ZYPnVTg9Qzh2bDP2sKwJeDexwYS1YOKXan4UbTB978crPS29EQNR1jPuTAGuUQbFuqLS5+cXBem6R4nI03O6hEGTcXBXsNHK2icGyLnf6YsmgVyq77qgccKZrI2fVl0zqy6qRCXK3fmAzq5sMxhiBuvlaHZgfIofLNO8ruCHzWYEsVk2Cyp6N809unrnWxUxH1UscKH2OocUf7CGz7lGe3nR+zBH1AA1Q3YQtthh88smG6GlqU8BA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18569dd-320a-4dc0-a245-08dd8725c42c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 13:57:23.2607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYbgKUZHA4lO4fnBwXj/KPMJLaAHqEbrqTOX82hfcpIwpj442yBTEB2xjwuyFO5LBpLw/VDbaVxZGri8DQCR2BFiVd3Ujcx8ZJkbyeoqm9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5718
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=748 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504290104
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEwNCBTYWx0ZWRfX9UxF3uk5XN+N AR2xFOQPKqpp42c8QxXYA2b/JeJwJuYSsYhU7UnHBkU1MNEedX3STBIM7r+sxhMzrlicpQWMxrB iaqbpWj8nDPoc9fig475t6vrLs1Mf8kPVPrLMeXh/5oeFOqht2gXfHegHDrwabxQoFBgbf5Snx0
 ziSNJMZiCJyGiQOin03qM6Yw3WVqe9CFwn+az/50EjRkq2RT1N0doPGmGXAVGwFfBLBUxD22V38 sPPqFlr/geeN0qpB3471QT6k3eitwHVdsW101wmneE3tUD6SjDXRTHsoVKgw9jURiv6r+pUdN9T khYLiYDqp/diqXRSVlWgjrhmRjquzHgW77gtJq4TM/md55D/wZccZgJFqitOzT/RP6tSEAaQpX6 XTtlX0lg
X-Authority-Analysis: v=2.4 cv=eZ09f6EH c=1 sm=1 tr=0 ts=6810dac7 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=8bU5hJphob4pU2dxjwEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: ERa7tUuieJ2Xzhq00jfUD7McYotEmHjv
X-Proofpoint-ORIG-GUID: ERa7tUuieJ2Xzhq00jfUD7McYotEmHjv

On Tue, Apr 29, 2025 at 11:27:43AM +0200, David Hildenbrand wrote:
> On 29.04.25 11:19, David Hildenbrand wrote:
> >
> > >    #include "internal.h"
> > > -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
> > > -			     pte_t pte)
> > > +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
> > > +			      pte_t pte, struct folio *folio, unsigned int nr)
> > >    {
> > >    	struct page *page;
> > > @@ -67,8 +67,9 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
> > >    		 * write-fault handler similarly would map them writable without
> > >    		 * any additional checks while holding the PT lock.
> > >    		 */
> > > -		page = vm_normal_page(vma, addr, pte);
> > > -		return page && PageAnon(page) && PageAnonExclusive(page);
> > > +		if (!folio)
> > > +			folio = vm_normal_folio(vma, addr, pte);
> > > +		return folio_test_anon(folio) && !folio_maybe_mapped_shared(folio);
> >
> > Oh no, now I spot it. That is horribly wrong.
> >
> > Please understand first what you are doing.
>
> Also, would expect that the cow.c selftest would catch that:
>
> "vmsplice() + unmap in child with mprotect() optimization"
>
> After fork() we have a R/O PTE in the parent. Our child then uses vmsplice()
> and unmaps the R/O PTE, meaning it is only left mapped by the parent.
>
> ret = mprotect(mem, size, PROT_READ);
> ret |= mprotect(mem, size, PROT_READ|PROT_WRITE);
>
> should turn the PTE writable, although it shouldn't.

This makes me concerned about the stability of this series as a whole...

>
> If that test case does not detect the issue you're introducing, we should
> look into adding a test case that detects it.

There are 25 tests that fail for the cow self-test with this series
applied:

# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with base page
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (16 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (16 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (16 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (32 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (32 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (32 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (64 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (64 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (64 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (128 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (128 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (128 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (256 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (256 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (256 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (512 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (512 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (512 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (1024 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (1024 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (1024 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (2048 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (2048 kB)
# [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (2048 kB)


Dev, please take a little more time to test your series :) the current
patch set doesn't compile and needs fixes applied to do so, and we're at
v2, and you've clearly not run self-tests as these also fail.

Please ensure you do a smoke test and check compilation before sending out,
as well as running self tests also.

Thanks, Lorenzo

>
> --
> Cheers,
>
> David / dhildenb
>

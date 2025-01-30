Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E651DA5F
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738253645; cv=fail; b=P3m6V8dhXsc7gPo+IbHyX2ejtZnPsc+S5jNkleNmsh6lUA58J7jeac/bKYtKtu4OWV6GgTelRKJmIOTK2/JgLEZsVmTNbfwsWdOyQGHzbTe/2VSjA6pbIcLVNAU0vP8v1e+8IcpEwqH/Vh0o0vZuk+GtNn+RrphESblnG9RAKs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738253645; c=relaxed/simple;
	bh=hX/p1sgCcG22OH405gX/n4aJOmQZXEnR3RE081Jmqm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ry+k6i5i43diOhsQnYseynd5f4v9TbnIm74F9F14V1sD8oYuGga/OYcjPklZxuuAT93OzxWcwLqIzUvGp1T0YXYpKZAzxbvDUyxiZG3zYz+SjsC23+hqXppjhjxhGjUBjPKLkOo+pE77pzv/MrtvdQ/pXkQ9kXF/DPXzIJ2yLSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oX809TPA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=P8gpkwyV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oX809TPA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="P8gpkwyV"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UG0hgs021598;
	Thu, 30 Jan 2025 16:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=WXA1JmODxJdg+D6N/Y
	rNnnMca3xM6GNd5tpRfpVzWqI=; b=oX809TPAoBms7IBualXcao9nnXPuy1CMCU
	PAHHrzpynoyu9zQXx+ZgjTGz+9mtECP353bCri6gm3TBylZAHUiHq6Gw7+LO8cU2
	n0/edCiKOjQyyuJ4C5lN8Q95BiLZfOWcZsAWbaifxoDuXgfdHgR19YowWAUwbo7O
	zUQ+9Br0Hhw3PyENkMa/gVe1j4A8equSQox1QWG5aghnL8Fix8csxIGWKJs02Fm3
	s2lFcJaYjtXyerPv8jRi6pTQEyVwlc1FimFFH6i+ApvO22s2bzV7Ki4Gw39jtKFB
	M1oU/DkC3f7HeYskMDVKnawEL1S/xYAoeadZFPzweVqnBvE6i9Cw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gbbd084s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 16:13:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50UFwujn039161;
	Thu, 30 Jan 2025 16:13:48 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdhbyme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 16:13:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LV1xeI6syZz53r4Pggxan9Um2jvO27EX3wYmWxzVtUpEVz7pu7KcGnyD6whadjWI1085m7Bs/4HQZfdwjFRhdr+8jlS884hqbY6WiMnbWlT8MwPvP4FyQWIex7yb1nj6h6fnnmudnvPW/NSKPqhdIv51yYRgEHVvUVMaQ6ZXOadlGIp3JzvCSgyMJDJ1g8oapkEaTkl72YAlBxra/0vMiqhTrbrvssB6DeX54j2qcDdxcVblmtLHYBWV/KghMxKNWoNDLQfVQ8AFeA2gkRgmxLkhOGedIX7O9Ge91xDBTLxk0wVQHjThMLI3BOLhJowVbSfZ0FoM9AzeGUM9udBE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXA1JmODxJdg+D6N/YrNnnMca3xM6GNd5tpRfpVzWqI=;
 b=l6dpA4woS0g6zu6TMBvVdXF9BzEGucR8XmspAPtq134ybrkXEDneLcLgf8U0r5DMibA8jvIXDLWUDB7A5LjgCT1Wu8gjtPMcCUiEhi0Ouihb8KQ5fxJK4p+OSEdjW7Milg3B/pM+LJN0Q86zB36NXLH8LFEB0Vv3FK1DG0D81/93iBjk5yyqO4GgWiu+tKRaFOQxqDKIGCGMf7nojDxNHbXc58/Zm1HrzVCUib7JiLYeqTLIr7a2s8mQYPJRDiIobTUDvsYKPAJjzB61WnGYFIzYFQ6G8s4meibDnAKOvPnmP/PsltE/AL6wcSXrZuAwbuKRLocSLgnO4tRRpNVH3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXA1JmODxJdg+D6N/YrNnnMca3xM6GNd5tpRfpVzWqI=;
 b=P8gpkwyVC3Ox8hoMCvtbXCjqWFmRI6YGcuIBTJoFa6CDcuJQYKJjOqGG4t21Pb5nHXCqfdvBpRtP8/DtwIVXy8P3jW8V4/EPsXM8I0yV94yefhxyEViNezdWF09cGsXpFFin5O+FBq6k0U/r2A1b0RiBZb5iJOphlzNFeUqDOh8=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SA0PR10MB6428.namprd10.prod.outlook.com (2603:10b6:806:2c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 16:13:45 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 16:13:45 +0000
Date: Thu, 30 Jan 2025 11:13:42 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Scall <scall@prosemail.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Wei Yang <richard.weiyang@gmail.com>
Subject: Re: lib/maple_tree.c:4056:1: error: the frame size of 1144 bytes is
 larger than 1024 bytes
Message-ID: <hxxufpccovvtnoypt4bukrpt4qrhiydlena5tdxqdxpmlduiii@2wac57fy4mqj>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Scall <scall@prosemail.net>, Andrew Morton <akpm@linux-foundation.org>, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Wei Yang <richard.weiyang@gmail.com>
References: <60cee319-4914-4a98-b74d-32e06fb3cbd8@prosemail.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60cee319-4914-4a98-b74d-32e06fb3cbd8@prosemail.net>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0084.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::9) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SA0PR10MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fe422df-17b6-4dba-82b5-08dd4149123c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fVD6Zkvs70HCque2ulBSKr0MSmCugf3bPao4fZ+cTKfcZbFQABw3LoERGyNE?=
 =?us-ascii?Q?IYRTP6jOG1qTAnkaZyEXQF2hsUH7d18PMkYpjSTXBKfW6MlbtizxinTPoUwA?=
 =?us-ascii?Q?mI39R4QGSge4Eq0J2utnyZtv7hL51egY+qnTLThaso6Xex1bObfOzKVMn7jx?=
 =?us-ascii?Q?au3W6ZojkMl7iyQYGSOUBnqdenW/8Ni5Rw1P6f2xzKj/Wsz2tgdux3c036Xr?=
 =?us-ascii?Q?uLlB0k+HePHPPR5OABZqoLTfNJV37NspLz9xecPzA7tr7g4X4G8QHN1kY9OI?=
 =?us-ascii?Q?q9cgBzJKECurRZsw+EiJcUWzzN/YA+J/tdKqGIU3qWHelv4C7RfoE1TgtCd2?=
 =?us-ascii?Q?UCrFKc0SqHijBp9yONqCCumI2Q1k2ScXZwNb84EhSL+roLUWT0GCL0Fnm1XV?=
 =?us-ascii?Q?3+4h206pDBpoC0PptVel2uMuaKaAPy1pQJucvnwXzAVpJTNM9FPtFDM5uF52?=
 =?us-ascii?Q?6ij/4bUVbNEguu0pIH5PypIkbQVi67frUV+hbxga4vSWEPdjEII78W2T00HH?=
 =?us-ascii?Q?heyJu3hAUcIPo1hCRu9PDZrljAab/an/DC05uh1RYwfw08GRqSXhIBWBCyno?=
 =?us-ascii?Q?i9JkjT0KHPYJxlFiGFJGYG+6cThP2yGS+u+iwUBMV5dOKCGs6mrrp/OmUgcI?=
 =?us-ascii?Q?eiKgPgyhxXd93Q3gmKQyCyLusGaYtgtG+CWn4Bs7nuTVmc3gUDKohvgMedGC?=
 =?us-ascii?Q?3jQRh2wqNsoAteRJRIO8qW4dPGQyrYOEuvSTPw9O5x086Uo0yTqPzGgHNE8A?=
 =?us-ascii?Q?wGxfil1F8AwIOyqrACjSus4kbnW2lfIfFfd8klXJGLZKtLieLOY3EpOlgllC?=
 =?us-ascii?Q?eNTyvu+EVHOI/J2z62cV5jcgwSeFCT2A1nRIX9E9WsYffcjqoEtO0TJxp1uQ?=
 =?us-ascii?Q?nKtA2oBOrCcyrelhlzDAmZhoS/qv5tvM/YgVOt+Pd9p2GFzyzA5NBAXOudR1?=
 =?us-ascii?Q?L/pNmB1LGzUG28EHnIeCp4xNXXcCWDR5b0iYaxPQeBy2YktqpAggRYtwxjw1?=
 =?us-ascii?Q?8+eHUgVAxI5jkszMp88qOb70jJ1o+Ev2I55MLvnFIce3VWDFYK/mLbefN54n?=
 =?us-ascii?Q?H/iU0CGhABXqlCYZNqEmghAmpjvyDa3bt5oNR7Uw8/jV41fL7jf+oFF9UbvO?=
 =?us-ascii?Q?ytfqMPsV6pzAMMpaf3K7cRIRyfWl63aY26GzzfBGEn/a6UzBgjP3cIp9GtzT?=
 =?us-ascii?Q?GhJULTeAcQBxcRczMFgAfqtqvWqpBmGGXoPeVF3iVgnkCPiBokbxhZyJ3hgU?=
 =?us-ascii?Q?x9bcK0l0NNkVFLjrOjP88u18dfwOrvNaMwbQassbrfpYoYtk2Y2kaee7pau9?=
 =?us-ascii?Q?Q1MLlV1R+flZWuCnDPrRu2g0Rt9d7NjJvLq1WUiHvrE8eCoBSjYbSsLWFgfO?=
 =?us-ascii?Q?HhQyVTlNHeEYGftvMHqHydldIfho?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pVQjXXGbWATkeUKRb0gYlrwIo58ODj96ZLTJWnyNNwohPMQjSSfVucsrCxxd?=
 =?us-ascii?Q?IoKVUeQr6YL07V+7+JZl4lwOVNdOVAhXhGaob9PU2OAYerLbG2qKG9WBOW5o?=
 =?us-ascii?Q?bEuhx1BlYxcZj2xKGjoEdZx59vOwa59vZuL4C2L2etgHhRzJNAlIIcDxGGeV?=
 =?us-ascii?Q?9mK7EkV4Fs+T8mxsYXTDx80+4Rm0mx2BrH9+y59nzXI2lIo6reFbqTU9WgG1?=
 =?us-ascii?Q?iQNJiFFw/3w+nf1AUpyAm43hx1Fh2smYCQSEBwYTaM6XbxEKUGO8zMHwMfL8?=
 =?us-ascii?Q?1PDqgU2YkMDuTU96LlPAlo4sTVoczodW78Kt1CrezxQLoW+XxXnKcLhQ7RXh?=
 =?us-ascii?Q?WdmeNk/lTLQEOhdwyXCpY8hAHJtT/HEd3uo3fsyz7mVaXhV6G3/AMCE32Vko?=
 =?us-ascii?Q?jJZGxhjZCAOjXqOqfKc86fyZvQzLRdIvS3AT+DajAaIck7P75Gs40WBtXDZ0?=
 =?us-ascii?Q?jb4zBhUJrXycjmTBPCIQqjoFpqGZR+nDFEBmcVAwN5IzYtbHdeQ4/nOX1y9n?=
 =?us-ascii?Q?Cy7gnbOBa7YEJhwah6Zw+ocvcZC3lxWk286RjIu3NrqER28Jj/RPSIp3x9V0?=
 =?us-ascii?Q?ljq/Co1VE5Mma7M4Mha2Am6EEFWiYz18oFaDUUGne/8NFH31QFqTlfh+mrw0?=
 =?us-ascii?Q?KJWM2zyKhYFn59ZfPkPRJvjcnfbNpKjsqG1QdCX99ennv6u9zhS4GacmFj/k?=
 =?us-ascii?Q?yzaDY4Fgida+ctXQm9HsNJvsSFfOWPL1IsRCXvb7/1OxHUbQVzfEIz2GKgrl?=
 =?us-ascii?Q?ysY8Iy54p9/JrZFt/ulnlHQ2s6Uw9gdXT2ARA1Tjr7/U5KiSx80cgaltlDL8?=
 =?us-ascii?Q?h8KqlG53T1wi4srn2o8PBvSjD4zvQn2FA0yOClPvWxMEyaa9ol3S36VGNUbi?=
 =?us-ascii?Q?sDnFA5nrqP/GlEMSk/anWd+MMb505Yjv61OMUmCY1ESbXOYzy7pO6hmH8HZH?=
 =?us-ascii?Q?bFbJck4NfGkwFdpD/84CjdpZgp4VZnMd1mspUlmXmb1i8gK6dR0t3nzODOJM?=
 =?us-ascii?Q?hz3gQG32df5rhrq2gea0qJ5kxmhWlOG4gZHjzOoYxYWg6jOvUs2EdUNyOMoN?=
 =?us-ascii?Q?VXhkbRgMm7RKNeE3fWqhcp8mOL0QmHhbt9LVzDwK1hFCKqEfB8oz3nXQjKqs?=
 =?us-ascii?Q?iqn4qZZM0BrQKbwCzgrfEXv4O6kNtEafl09as+0BOTy1ygVq41vmYXFaF6Qs?=
 =?us-ascii?Q?eBS79yh0Ew0nnLk4g0Xci35JEm/fTg8k1kceogs5oNLmegPVsjlL4AI3z6aJ?=
 =?us-ascii?Q?M+wMuFUfKCHYpaZFZaZQ1d38gjdJmJ0ga0TrV0Nq9Wc5XzpWPYDXlom3FcY2?=
 =?us-ascii?Q?cwrolPTrFy1Un6Ko4yEPkoUqU1jusbJlM1lQdhFhGequn38hYKp3OvyGTH4f?=
 =?us-ascii?Q?uFSEK+FXlqYFU9wml9aS9+hPK+p9Y7ZGJhZAhQUkHYohQmKVYjjeJAkP3Anv?=
 =?us-ascii?Q?8HIgPppWBcFaf15ttj55786/dsCCQPsfB6DcxfcTCeEd3kmxWZKRCpojt4wl?=
 =?us-ascii?Q?7NKFzYEcB49jps5IT+z+LaSbHPI8CUkzJ/qWldqOytARyDrnOYqR5bODM1Gg?=
 =?us-ascii?Q?ZnEh67K3aeV6kTHZm+nQAqd2HMClLZ3GUcbs0H/w?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BQwK4yJWTMWepoxzNASR7ODpWpfzgw72L9neIXbCg9NEAfANoxbu76FpjDTheJbh/a9E0UI8FlEw215Gt+ywFkO8sHytkn+ovc9A3ncPC1t037oU9NE7Nk1ojhjh8GGqJnQ4DDN7EkwaJKRwUpxB3QG1cEYy25/JTITyvRTJ4/Z/Y6+IE4E1r1aGivjSTLWsZzRFnO8xVX8Tqmu1X0HW32sRwVoq/IWYDbN3zyZVbLv9Jz8WVeIBghzs1jcaT+ZyidKXOWS/zLoU3JUl/+YhW3KcLVWJgdKaMV7/fKHWXbNoEVUTEjaamfCJDBbPinV0akGaDN3k6QyiwRLqXbLBbyAyHGH5RyNcpXWngF8Q+biiUAOBHGlu3DvrYJt5Hw89qkw0FdDwDftFikLQDUElSifr63wpsj5ozQdxfDhhGbemU26Fuwp0M8daA4k4+y2nlCkMXeAvou3GubBV5zRpsnXXe7QqcLxrfRU2ofjVqSLefgqX8yR0l3NtSUYfT17CjlTlsdG/GB/flIQM6MVTVYm+LuO42QSq3FD5a9CPw4CK+JP0gdN0IP5r4M3HS8itQ89hBXAKLQ74icN5KekYn8KPSVEH7gM9p+VHzkIfXFo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe422df-17b6-4dba-82b5-08dd4149123c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 16:13:45.2388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZFOKSYATEh7QJUNpyghthidOvge8G6Q5cDfuIT9gghHEfywqIuYZUIsaLVgIxCBrF4oHY6W+vKrHF6TVS9JBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR10MB6428
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_07,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=911
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501300122
X-Proofpoint-ORIG-GUID: _eL3oHRncsoTBNwELCwZSxuTi2-SLlFF
X-Proofpoint-GUID: _eL3oHRncsoTBNwELCwZSxuTi2-SLlFF

* Scall <scall@prosemail.net> [250130 10:53]:
> Trying to build Linux 6.12.11 with GCC 14.2.1 and KCFLAGS="-O3":

Thanks.  I received a report of a frame size issue directly (not over
email) from someone else.

Do you have KASAN or lock debugging on?


> 
> [...]
> lib/maple_tree.c: In function 'mas_wr_bnode':
> lib/maple_tree.c:4056:1: error: the frame size of 1144 bytes is larger than
> 1024 bytes [-Werror=frame-larger-than=]
>   4056 | }
>        | ^
> [...]

Does the issue go away when reverting 8c7904a8cd0df ("maple_tree: i is
always less than or equal to mas_end") ?

Thanks,
Liam


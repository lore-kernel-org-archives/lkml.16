Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD03C252905
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195130; cv=fail; b=e/EaQwZ8VakVZmfHI0Mgex3sGZ6crfEquCDnQxGiQ2rb8c9j1v7isbPUJOIr0R32oxn12q34db9bbDbE5Xvg+NlWrN3zkYBRVCTbgAscVZ626BSACZCsPaXMRevd9LGUL7Cr0OAhgsQvPuTx9z3TLuHB5tk84rzEAOIVGpZOIxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195130; c=relaxed/simple;
	bh=L3z2C6RpFudzhVQiS53UFgHLXL13eY9z9LXc2ACQsg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eZwFt4xKGZRH3QBaWuRosHLA6sf8P1Z/OCMznqlMC6kDSyI6pY4a2N7lnOXnLdG+/MKLOCJPUhkJupi3SZjlFx9M+PdX+maR8PLeD4IDUzeAjlzI+qzXh5TIlp0bFk3SzyBUENK4/Jp+dGWmmwDF2nkIGJdEmQ9tFfG70tO8KYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=madrW4Fi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JnMccaeq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="madrW4Fi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JnMccaeq"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5397u1ZE010944;
	Wed, 9 Apr 2025 10:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=omqrX+GsB48VBvFDdL
	30E8Dt15Xk2p4q8+76+T+woXs=; b=madrW4FiI0WXJG1nqyUea1TnROlkwT5NvY
	6aeYj0DZcoQ7Ecz1XwM5owfpop3JTXOZzMwtakF7lxETaqtQX+aXOL6K6L3epiIR
	jpu8RAwyLIrbywfqaSPMwkKu6YzbkbTdGWLhAh7rbB/qjaUIeV0dWBS0y1ihhuUF
	RkC3mBLocyyMsamUqjwEAC2/XuXgQP1G2eayGBRp95g5ex596eFcjd/cW0j+APuB
	MBqOBVthAGK7yc3e/Ad2C+I2FU+dpmkFYVPcu9GdGTBJF2KBjaXnhIBhefTZGu1j
	ssarjC9/mGPnSG9I6JbaTZJoAHw5JBRzsntoKJ7gExTmnKU6GcOw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tu41ewn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 10:38:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 539997Mt020944;
	Wed, 9 Apr 2025 10:37:59 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttygy03q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 10:37:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fv+h/zdG+2GW/EE08lf2pGRr2ZJ39xlPIA3w6nLyN/kt9azUJEd+4GcrW+8WQh2AVBU7gOj51lJlAgby0JWm+NCY1ZifOVfvXBD6Z+zwHw2cP2ZIAVEo4nscNJ9NJ66Qu7QTDXUDMstKDNtLXeB3PM6zzFzoqlwQ0sY5Dbs7ehKOLvvp7rVTkJcj0XlwaO/zpsr2EXqcvvJocw/3uVqIpMxboEYMWqPNmCZuoV4sGF0IsbmSnMJjXftbUxVeUFiwWEG98Ylk5hLk89IFKBljKwgAVzb+0A5zTHp5v4e3t9r3nze2SIZk6n6elSZaF7by3lfxaPl45P8doXJxCFBYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omqrX+GsB48VBvFDdL30E8Dt15Xk2p4q8+76+T+woXs=;
 b=mrS+8F2tyJ3Zm2BKjsamgUTamAq1d7KUStTORM3985JgeID3BUnq4HULOVpyolMPmSD6hBvvBgYvgm+BsXqprhL6gpuRl1sd53tmZTLneAlwCVhLztV5ZWhR0MVgaeLaZ4c9DdR/tKN4kS/3gtFuZCCNSc/2ZY+UXH+fE3lMurnP7aFL663QLzpmQsreN7gGk+mKixYEcH0vbZeVo1VclIxM31JwKdbwEQNCzaoYrDzHfcTuZ/vPpnr2N/9ZnuYI9IfqtZX/P5QxGXbNe3e9P8y/AwPEgZodPcdZzhpScNiQ3ktU/g54VTV4dUBWhg6Wd680qTd6C7JhIWsVOEDqyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omqrX+GsB48VBvFDdL30E8Dt15Xk2p4q8+76+T+woXs=;
 b=JnMccaeq2FxVAhy5Zf5GZ46VhMSGb1fgQlBbvBLvPgsfunq1jRTdgu+T7FW+/YOxuPJc/NFZvuz/yE9rF/BELhC2hflIhk21oYH8nY8K2FgCJ+v3XTb5fwOO7hCnkiIqBKbanAwVh+gNeCPUgkDjWDjmaopS7ENoTPSPMnj84HI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB6177.namprd10.prod.outlook.com (2603:10b6:510:1f3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 10:37:56 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%4]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 10:37:56 +0000
Date: Wed, 9 Apr 2025 11:37:53 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R.Howlett" <howlett@gmail.com>,
        David Hildenbrand <david@redhat.com>, Rik van Riel <riel@surriel.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, kernel-team@meta.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 3/4] mm/memory: split non-tlb flushing part from
 zap_page_range_single()
Message-ID: <2dfe2649-9e1a-491e-844f-dba6a8f50e7f@lucifer.local>
References: <8e79ba42-a229-4a55-ae26-cd049bf85144@lucifer.local>
 <20250408201248.63244-1-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408201248.63244-1-sj@kernel.org>
X-ClientProxiedBy: LNXP265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: 7943e91f-d68b-4cfe-da04-08dd7752970e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NU93Z0CcOjr8Odwl9C02anRzjqDKfLV97miLHaa+/retZCbud6WZdfvgMZQx?=
 =?us-ascii?Q?r85XubnQL8EAbqQgqnVHsTS1icgmMZfgpZIKcpHEfkJTv0+fD+pQDjimsaqJ?=
 =?us-ascii?Q?UtYZjDmNW9azusvk2j27BmbzXFtDlECzqoVTPhlmhRbcMMc8sYpRQzJAXbiP?=
 =?us-ascii?Q?uJPVE+5NnTRB6IGOj/nBKlRa7DaJ790xj18E8IoKrQ5wdmsvt4ZImFlcNyve?=
 =?us-ascii?Q?FRy8qIyjsSB3zz+UEJZLZrQ+ix+XfmWuAzDdMSfZ1OEbtkvcx9fsWAphtpo7?=
 =?us-ascii?Q?FglgFp1xVaqW7orWklOWviRB9RP+bdWXXePdpdYrkwTA5ioR3RRBvzAs4ALR?=
 =?us-ascii?Q?/IBJTMjUT89vQfRKs7Rak3n2b/qq6U+RNWBclzc3CtkK+qD49Kn5vn90BgTE?=
 =?us-ascii?Q?fF+X+XMJZIF1VjmPSssYRD6/5BwNeUvFKC2QOXfDbi/QaOemsHBA8JkhnSq8?=
 =?us-ascii?Q?PwPbzRo9PZaB3ZNZKH8LBa+gwAuaBgKfVtnzNmlhcj74D0l5U6WqODfE3hX5?=
 =?us-ascii?Q?vRk0ChWG466eScgoX3I/UzSPcpmUu2weErx+606uj6Q9biactHzau85XWlaJ?=
 =?us-ascii?Q?SCKt4xyB5gPfrQ3/PdjRxwRoal3p5pwfN1W8Y5pAtzUHA8ZqonGbeE7iXBuA?=
 =?us-ascii?Q?pSBz8slYQ7161nFreViH7ZNFZnemYA7hPRL6LD+o4SgkOmKhD1y0Kqa2kivJ?=
 =?us-ascii?Q?NvPPCSVlBqnkOQZyAB7prZNPlmDXYT4hUv3FBCewADKhFrkYm0klbzxkNSol?=
 =?us-ascii?Q?ApeKdccVrWua0WFyqPoRi8ZwxbbcvhyDd3iGWKqlqKupv0bppxOo06EYe8Ss?=
 =?us-ascii?Q?0dW6CRrnPWUATgTg/koboMv1UGSY9GfXS+CBiCdjoR2imrrJ6F7SywuJg06+?=
 =?us-ascii?Q?CU0XRhHKHbkD+OcVPIVVDjNL5v6Pf1TaSMhB6jqeUYhhR2/f4b3WViLnhem9?=
 =?us-ascii?Q?06W4N8+uZKRISUBU7jAMTrRD978uN6pU7KIxpg91dm8fee3WEtJShBaP0Vx6?=
 =?us-ascii?Q?Ql5bayvXfP1+PK+M2BKGn1hQ/ulGCNexLVI2O+8aYOp11rUylqwembuD3B9z?=
 =?us-ascii?Q?vT8RlkG6cy5xkYNMF0qwgpNTQRbr2Za7z/DQdSTKJ/jt+7elSbWqX/G4J6bz?=
 =?us-ascii?Q?3OuldcDuLhkgyfJTR1/fOfArPCgK+hCLxkzU1sKSye4u0Tu5cOc1vFsbsdtY?=
 =?us-ascii?Q?n1HsC2Z9VcRsB6c9r3hf0sZ9PSQ/db/CFSeeTLmR6Q9HfOZ3Objm7owRpfsu?=
 =?us-ascii?Q?+JCAqUuF6LdgD/JS92Fpdr6t62/uw2WqaCfdRLQHG0LeFrJpixomM8i1BpY1?=
 =?us-ascii?Q?sWBOQ7dyTg/53yhpEWlmq3skW01DvEGd3GQbQGSfsHCdf/CTw5YCf6PbdJP5?=
 =?us-ascii?Q?0h3v+PDcaWQIx+iiQ3ixbp1rkYpcJiKttafxuE6vyR6o7dXANT8Z+v8XwsPG?=
 =?us-ascii?Q?53BZwo4Qg3c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ney++RtoMI9hYufgtZ1t8l6YQqhjT/Lt/LFWfkkWZk4TdQxk9CuFWq16qZcG?=
 =?us-ascii?Q?UQLFU9dU63Qw53cT4G+o2CvemiWTZQDAMDqNk+9NcJXEoan+dgGL37bCjX+V?=
 =?us-ascii?Q?wQcGu/IsCKSL/53vL0Ud6GLF7ss2QBQd9KGHDxk+p0EEfOehx79b8kdHcrcz?=
 =?us-ascii?Q?wt1m3Mmc0ua6/d9CV1l2PyFBJ+tMf7Zy5j3v9ggUdoHNQw/7dpLGGElVI5vP?=
 =?us-ascii?Q?P/zc+UGpZg2NDHebmg/bN25coOikgiuwrO5fGU6oyijE3CFd2gEtAj4A01RV?=
 =?us-ascii?Q?6trW6IileK/ccAd7q92Q0z2tQ9JT6A3FkH6HltCt/aUFvKsVp/iUuHUn1quB?=
 =?us-ascii?Q?rNiSJn5dDdAzFRtEaO8BBhWiOmgHPY8QPwe75RPMiy1lREWtr26dGkJLaXeF?=
 =?us-ascii?Q?qdZy4E297plU9uASe/tCd48BflnpNNFmMLiutEvkKK8mTT47SkV3F5vPKeDU?=
 =?us-ascii?Q?jBI9/LhEqXBw/qBA5HFVq6SWuDDYCyC29UYND5pznvqkXrsG8EMXojwvwh82?=
 =?us-ascii?Q?7wn1WhKHa6iYzUIwHlt+Mo3sRdO0BUjTNJiBQTpKAr4mWsLqQCOgmB/TOS0G?=
 =?us-ascii?Q?WccUlLsWVoSfPLzZANxy1Nf5juDwz452AuCTiwEFeN/AUH0WuoPrLBZ46E8Q?=
 =?us-ascii?Q?P544yWFOlhZfpW7qwEgI4/0ftqYz82CeV3o7Q2x021J/JpvlL8QORnltSnZn?=
 =?us-ascii?Q?dnhXCVYZtvP1X8yJjOEwmjFltcTQQgDRdAg+00x5aGSUlr58QANpa30y/1pD?=
 =?us-ascii?Q?4NQX1f0QRioeY1+ru6WgXKxYOoA1c5WJH+dBs6VHdHsBB0xb9n+DVonhCqmt?=
 =?us-ascii?Q?H+AsPVF6ADYF+QyP0hCAPiVRWf2KNKqYkK2LyRSxmTOWTPYb7/LBw6zRQX98?=
 =?us-ascii?Q?Bd19wqhPaT5igrnm+P+GkYwyWZEiEq6Dq/WQtsPPjpnyvoMzKnEEyRinloFi?=
 =?us-ascii?Q?qdVJ19gsb+cnbXxZeCYf1wF4llTgYJjvp6bJb8SDCriD5ZwZuCw63NMwjpvc?=
 =?us-ascii?Q?teQTdgpYtg9B5s4IFV+kZIvYXD4id71Ql9SdKzMuEQm7SPKmgcQLJLYAkecs?=
 =?us-ascii?Q?B2dWdNx09CPim3Do4BPU5cBQzckJY7nNFePBnFOKblVM5PXRIkxn0mexJKrl?=
 =?us-ascii?Q?CDlLke6yDVB+8I6WsSTFwoEnxRPOuh92siLvhVxdjkSUSgpneb3RHYScF/aV?=
 =?us-ascii?Q?fQpX75ssXGvCoZjSUCMc3s+Z8f3oFgXW7zQNvfnwLPJP5AKKYo0YPSvE84z/?=
 =?us-ascii?Q?o0oZLg5OI3tpkWJqgU8LHgJqLEbacmmFuoJI8EKMXqyf1GrLazr756vH81iO?=
 =?us-ascii?Q?Ln/s58oIM/9+huScImeYqIS3ZXGBz9zfs+twvm48E2qKffyvysBgX6wf8m6U?=
 =?us-ascii?Q?D2Y1z28KMECR5NMUiO6qnWyguhOf2HfHnF5FRmJ94tMIZ8JbQbBDqVxeodMW?=
 =?us-ascii?Q?pdbIdhYz0+3/Yln39d76QrJAi7Fc7IZ27UOtfP6+HKqyWVvCTa2uRbwod2jP?=
 =?us-ascii?Q?ecZ4i+6sCCYO0UWX3440eN4eV8G7Ryuc6JWrgqz/zO57TCR4xSdHMpiODTwQ?=
 =?us-ascii?Q?K15E4LwPnKs4evl+EgwW9SRPU1r7JzDoP3/JRR3lx+6TDNEJfuBW942LVUc1?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e/pgp7o8zqYn+08RIucJCUitiYKcKR+WQg3GSgiBDzaxU+eJnnXjmVCXW7Q6gpBnoNmGOUJwZAsmBE5/kjJEB6FGn2WJNRa3gT7zMQO2b/U1opQo+atxLmX5ur/yNVgVNHeJKvsLoQecKyY2K4qtAEfrBqlA18+xfuWWAosU+16IfFzYiXYf6aAcDmjeKlMSC6UXxwslzZFmMwhc1UHeaCKEEz7bJk3gIDcF2goth/vAiCgILgR2IqRXJuhTXi7bSmN+5CGP8GhCJv5JRPnXbcc+ARI7sn7wJ/Fgdc6sio9nUETsWA3x73bTNawwdSOhTODM9YGTLa7L+SQ0VRpKnxFoNxlOVPLV2I9kHvwkywRxetcz2HSHTY+jmYCh3UOlE4DPxMIAXFNTZXdiRBu8ZCWI3fXq8hZPmj0fKy47L2uFubnZIL1NIXOTtVuyk4ZzN6OLApv14IeKQsUsYf8J4hsXQdofkDBZ92nTbYZXqYdLk2HcVNtFA738ckY8D6QhxL7H9sWx4lvtIhg3LyzyPEcUHVL+vERPuI+02yxJSEUQSC4xIVx+i4alTXw0krLZreL0EaYrWQXQabVKoGJaTJ21Nz09xzI1btv1rTQ0NIU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7943e91f-d68b-4cfe-da04-08dd7752970e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 10:37:56.4561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxv1sEnHKu+pnoQkLp7Qmqd0jsMkW+r778Djqyr18xmBxQR6Kz+kbQAwmPYL7yKyzrhECRV4n33M6ubci1Fj20/mjbXKKccSg1uMRFIGSbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6177
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_03,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504090059
X-Proofpoint-ORIG-GUID: drbgXTIjhjvA8VNkNJi-4fxkmhH7TA26
X-Proofpoint-GUID: drbgXTIjhjvA8VNkNJi-4fxkmhH7TA26

On Tue, Apr 08, 2025 at 01:12:48PM -0700, SeongJae Park wrote:
> On Tue, 8 Apr 2025 14:29:41 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>
> > On Fri, Apr 04, 2025 at 02:06:59PM -0700, SeongJae Park wrote:
> > > Some of zap_page_range_single() callers such as [process_]madvise() with
> > > MADV_DONTNEED[_LOCKED] cannot batch tlb flushes because
> > > zap_page_range_single() flushes tlb for each invocation.  Split out the
> > > body of zap_page_range_single() except mmu_gather object initialization
> > > and gathered tlb entries flushing for such batched tlb flushing usage.
> > >
> > > To avoid hugetlb pages allocation failures from concurrent page faults,
> > > the tlb flush should be done before hugetlb faults unlocking, though.
> > > Do the flush and the unlock inside the split out function in the order
> > > for hugetlb vma case.  Refer to commit 2820b0f09be9 ("hugetlbfs: close
> > > race between MADV_DONTNEED and page fault") for more details about the
> > > concurrent faults' page allocation failure problem.
> >
> > Good lord, I really hate how we do hugetlb.
> >
> > >
> > > Signed-off-by: SeongJae Park <sj@kernel.org>
> > > ---
> > >  mm/memory.c | 49 +++++++++++++++++++++++++++++++++++++++----------
> > >  1 file changed, 39 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 8669b2c981a5..8c9bbb1a008c 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -1989,36 +1989,65 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
> > >  	mmu_notifier_invalidate_range_end(&range);
> > >  }
> > >
> > > -/**
> > > - * zap_page_range_single - remove user pages in a given range
> > > +/*
> > > + * notify_unmap_single_vma - remove user pages in a given range
> > > + * @tlb: pointer to the caller's struct mmu_gather
> > >   * @vma: vm_area_struct holding the applicable pages
> > > - * @address: starting address of pages to zap
> > > - * @size: number of bytes to zap
> > > + * @address: starting address of pages to remove
> > > + * @size: number of bytes to remove
> > >   * @details: details of shared cache invalidation
> > >   *
> > > - * The range must fit into one VMA.
> > > + * @tlb shouldn't be NULL.  The range must fit into one VMA.  If @vma is for
> > > + * hugetlb, @tlb is flushed and re-initialized by this function.
> > >   */
> > > -void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> > > +static void notify_unmap_single_vma(struct mmu_gather *tlb,
> > > +		struct vm_area_struct *vma, unsigned long address,
> > >  		unsigned long size, struct zap_details *details)
> >
> > Don't love this name. It seems to imply that the primary thing here is the MMU
> > notification bit.
> >
> > This is like unmap_vmas() but for a single VMA, that is - contains the
> > logic unmap_vmas() does for mmu notifier stuff and hugetlb stuff (vom in
> > mouth), deferring heavy lifting to unmap_single_vma().
> >
> > I think it might be better to just go with the brainless
> > '__zap_page_range_single()' here honestly. Then we at least reduce the mess
> > of confusion in this function naming here.
> >
> > Of course you intend to un-static this shortly... so maybe that's not so
> > great.
> >
> > zap_page_range_single_batched()?
>
> Sounds good to me.  I will rename the function so, unless we get other
> opinions.
>
> >
> > >  {
> > >  	const unsigned long end = address + size;
> > >  	struct mmu_notifier_range range;
> > > -	struct mmu_gather tlb;
> > > +
> > > +	VM_WARN_ON_ONCE(!tlb);
> >
> > Maybe pedantic, but we probably want to ensure not only that tlb is set but
> > also has had tlb_gatehr_mmu() performed upon it. Then again probably a bit
> > much given this is a static function called only from
> > zap_page_range_single().
> >
> > Hm actually you intend to un-static this shortly right? So I guess in that
> > case we do want some kind of check like this, perhaps absracting this bit
> > of tlb_flush_mmu_tlbonly():
> >
> > 	if (!(tlb->freed_tables || tlb->cleared_ptes || tlb->cleared_pmds ||
> > 	      tlb->cleared_puds || tlb->cleared_p4ds))
> > 		return;
>
> This code is to see if there are tlb entries to flush.
>
> In this function, valid 'tlb' can either have such entries or not.  So this
> code could be good reference but couldn't be used as is.  I think most fields
> of mmu_gather can be arbitrarily updated depending on use cases, so making a
> perfect but simple check wouldn't be easy.
>
> I think tlb->mm shouldn't be changed after the initialization, though.  So
> (tlb->mm == vma->vm_mm) could be a good enough additional check.

Yeah this is not _that_ much of a big deal, just maybe a nice-to-have, but
appreciate that it's sort of blurry.

Don't feel obliged on the separated out check, mm == vma->vm_mm suffices
(though again that is also not a big deal! :)

>
> >
> > Into a separate is_tlb_flushable() helper function or something. Then this
> > warning can become:
> >
> > /* tlb should be initialised for a new gather operation. */
> > VM_WARN_ON_ONCE(!tlb || is_tlb_flushable(tlb));
>
> If you agree (tlb->mm == vma->vm_mm) is sufficient check, this could be
>
> VM_WARN_ON_ONCE(!tlb || tlb->mm != vma->vm_mm)

Sure, that's fine.

>
> >
> > >
> > >  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
> > >  				address, end);
> > >  	hugetlb_zap_begin(vma, &range.start, &range.end);
> >
> > Is it a problem that we invoke this function now _after_ tlb_gather_mmu()
> > has begun?
>
> I think it is not a problem since I find no requirements of the ordering.
> Please let me know if I'm missing seomthing.
>
> >
> > > -	tlb_gather_mmu(&tlb, vma->vm_mm);
> > >  	update_hiwater_rss(vma->vm_mm);
> > >  	mmu_notifier_invalidate_range_start(&range);
> > >  	/*
> > >  	 * unmap 'address-end' not 'range.start-range.end' as range
> > >  	 * could have been expanded for hugetlb pmd sharing.
> > >  	 */
> >
> > Oh GOD I HATE THAT WE HANDLE HUGETLB THIS WAY!!!
> >
> > Anything where you have to open-code concerns about how a specific use case
> > uses something like this is just asking to be broken.
> >
> > Obviously this is nothing to do with your series and is just a grumble to
> > the sky, but still! *shakes fist at cloud*
> >
> > > -	unmap_single_vma(&tlb, vma, address, end, details, false);
> > > +	unmap_single_vma(tlb, vma, address, end, details, false);
> > >  	mmu_notifier_invalidate_range_end(&range);
> > > +	if (is_vm_hugetlb_page(vma)) {
> > > +		/*
> > > +		 * flush tlb and free resources before hugetlb_zap_end(), to
> > > +		 * avoid concurrent page faults' allocation failure
> >
> > Nit: add a full stop (or for those residing in North America 'period' :>)
> > at the end of this sentence. This is very bikesheddy I know, and can only
> > apologise.
>
> Thank you for kindly suggesting this, I will update as you recommended in the
> next spin.
>
> >
> > > +		 */
> > > +		tlb_finish_mmu(tlb);
> > > +		hugetlb_zap_end(vma, details);
> > > +		tlb_gather_mmu(tlb, vma->vm_mm);
> > > +	}
> >
> > OK, so as far as I can tell, after this change, we are still ensuring that
> > the tlb is flushed _prior_ to the invocation of hugetlb_zap_end(), only we,
> > in order to later export this function, need do it here instead... I mean
> > this is horrid, but it's sort of unavoidable really.
> >
> > So I guess this just undoes the optimisation in the case of hugetlb, which
> > probably doesn't really matter all that much at huge page size
> > anyway... and plus it's hugetlb so.
>
> Yes, that's the intended behavior.
>
> >
> > Yeah fine, just kind of horrid.
>
> I agree this is not clean, and thank you for understanding the situation.
> Hopefully we will find a chance to revisit for cleanup later.

Sure!

>
> >
> > > +}
> > > +
> > > +/**
> > > + * zap_page_range_single - remove user pages in a given range
> > > + * @vma: vm_area_struct holding the applicable pages
> > > + * @address: starting address of pages to zap
> > > + * @size: number of bytes to zap
> > > + * @details: details of shared cache invalidation
> > > + *
> > > + * The range must fit into one VMA.
> > > + */
> > > +void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> > > +		unsigned long size, struct zap_details *details)
> > > +{
> > > +	struct mmu_gather tlb;
> > > +
> > > +	tlb_gather_mmu(&tlb, vma->vm_mm);
> > > +	notify_unmap_single_vma(&tlb, vma, address, size, details);
> > >  	tlb_finish_mmu(&tlb);
> > > -	hugetlb_zap_end(vma, details);
> > >  }
> > >
> > >  /**
> > > --
> > > 2.39.5
>
> Thank you for taking your time for reviewing this.  If you have no other
> opinions, I will make the next spin as mentioned above.

No problems, yes all fine for respin!

>
>
> Thanks,
> SJ

Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D690F2417C5
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748342802; cv=fail; b=WfWeUItpqZUyvNufWn9MYFsn6CZzDFL0+YeX6iB7fvmQSM2pZgBtOLrS1iowvVtHtdkYUllyN8exHy6LTT4fDIzs6/eww8jCL7getafu7qdC5FoB4dGBMsD4aJ5r2Hh2lcW9ggTd4LVEh0eElRSrGHQxiG/UtKGKm+BcxZN9l2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748342802; c=relaxed/simple;
	bh=BSRGU+8OExmLDMCP3DKEZP1YNds0jkG/5eCy2OjBsmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NcafCdAofjVNmdcEJfg5Tapz9JKItD07CsC/qUJufCbVg/m7H46Gstgr/kNUyzE6CjCsjJoIMMRbhRyF4jXfk7jfNDrj07w8xkuCd2B0grhjBJmqPsIAtOa283pybGAdv+l3Gh9voJOiipMxFFBBWFwozUbQrRBpDun8ECRlLS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O/Cg2+ir; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=G9ZPPP25; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O/Cg2+ir";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="G9ZPPP25"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R69YMM007313;
	Tue, 27 May 2025 10:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=uhIMjhG050CGNLZrno
	RLaM+Nz5/EAM6ciNclTY5uw/M=; b=O/Cg2+irdpDKSaBMpQ9SI/2ExE2pjbH7I9
	HdE8k8GOZZxKKXk4wYyyiBeb+bpjbWjL6EC93hDer/t7mZYh33oO7LytBDTmjofC
	vCzTr9Jb9AEItqqYZbmdMogc7dWE2JiVrLqdsYcPXhlh84LUWg0UM1Sp/T3WTVya
	7xWXQQa7jCVXLzgcVfiXzMCsbWJmDpXXVnLu7C6l8ZBPnPgzjFJ4c8DgCwLG9Iks
	uDCFs7YAebdYCU3iJa1Eao3M0nG9p/XYvECB41e6UwMT2YjKJFOc72zNTrKYNbYd
	2mjCmORlGpik8MX0/gtumG8hvc9D4ic3x5/+v1ARBLXDY1ykXXew==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v3hjttug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 10:45:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54R94Oi8021150;
	Tue, 27 May 2025 10:45:48 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012017.outbound.protection.outlook.com [40.107.200.17])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jf6wyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 10:45:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMAIvdC8/6wj0mJONHRYg/2CeEVkA3mnVc4brYRw1XahqgQwJeDPlVZ8Ehj2qtI5RJQtcoLAxfGdCMtCfan5wUFaeiHK9+z30aNc7BAh8K5ADEU2iTBu8cJnEltNtKgkZo/WtQymE5u0SdWhZjkB9j4fG8A9enLSDWUe8zaxc5xhvOTwcWBPUjna/17F9BE1GjPjhwOj4AWhuSSHVrQ+AS370zOMdANbIH/Hoym0a8pvVoy/4axLabJl9yNp0Ytq/J8ArvkPFEIyOSdMchPPnB/8pUXLeidiuQjWI6YRgaWcFBr+y1Mvr2Y9OSwcBCfpTFgXPCSPlXa/ir117dTacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhIMjhG050CGNLZrnoRLaM+Nz5/EAM6ciNclTY5uw/M=;
 b=mEdYYxjYK2jS+N8PRNu+po7FBvA9oYxXirPDYsH2Pl0pYWQ6KgsUySmRStgQUGWS7qfUsbbXNEKVCJJsWlrKgenWqUxymhsl2u6gGqm2PLRqjUJoVXRXjZ7dHR5Xcgj71P5v6XBWrwulKXl0b3+u1GokaLt1Q/yEq3A1vV0ZPH0e8KGgJtiVyfsdQU4wnnIyMoiXNypdq/GGeAPoMQwWuDKf/ZgGc7OYFeCU/8oXG2sjM9I2lvnzNPtTZmbWIbN+G32x7J2zYRr2g857ORDSfBfOyTxqDsBxtKse/oxqrq1s9jts10ok9WyS/iu6sJMh2BGMZQ97UF9XHIa+CLR8pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhIMjhG050CGNLZrnoRLaM+Nz5/EAM6ciNclTY5uw/M=;
 b=G9ZPPP25kRAGWiJVvNaKqKerjqb+Lf1tUCPD0DLmQbsMjKsLgVof5GAcEYrvi598LA37b/lJJyoRKigtYiqJewyKcw1n/kAwQO46sQfl2ZdRZ226XtTLrlQDkpJuWxBlBu0SO6YRBYRf/RZoR7VXVED03OssZUB38mxygfd0wZo=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PPFC0AC38E58.namprd10.prod.outlook.com (2603:10b6:f:fc00::c47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 27 May
 2025 10:45:46 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 27 May 2025
 10:45:46 +0000
Date: Tue, 27 May 2025 11:45:43 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
        ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
        maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
        anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
        yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com,
        ziy@nvidia.com, hughd@google.com
Subject: Re: [PATCH v3 2/2] mm: Optimize mremap() by PTE batching
Message-ID: <3d5d5813-7764-4667-937f-cec52f8b03c9@lucifer.local>
References: <20250527075049.60215-1-dev.jain@arm.com>
 <20250527075049.60215-3-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527075049.60215-3-dev.jain@arm.com>
X-ClientProxiedBy: LO6P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PPFC0AC38E58:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac12cc8-b89a-47cb-0093-08dd9d0ba2d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CVVzCX5FXCz/Nu+n7OQim8PmB6WgcthQjvHPUiAJQAbtw7e4EDGUEqWimWN0?=
 =?us-ascii?Q?ghHA+UQn7ZRqpcnAhlb24vrpoXPuEdDRZ9KsPQA49hvytxE39zn1vhGH3w9f?=
 =?us-ascii?Q?MmMmq/PJp/mwBxpEhIiuWlkjMZkf/8ULDV55P+YX7S03CVrz2ppV0/TaYRfQ?=
 =?us-ascii?Q?iVBqNB/eha2m0zF9Kuya4L4EKZKPq2hdiVxkS9a9z+4jlOMWj9u3rP5LMfpR?=
 =?us-ascii?Q?OzIHwf3UzHEt7UoQCMmDp2WPLfKF1did09UWGsBsjioz/9remGU21fQOhYyt?=
 =?us-ascii?Q?OyHIBhf22zohbOtJ/Uw5DPsQvROkP3uzvaHKvDyPfvXRu9+6E7mwaCNlUVa0?=
 =?us-ascii?Q?ToVt/8meJVpvKNfa/9fVo12IwkkvMR6tRGr5VNOlqC4PGrvoeyjRgtbKElTs?=
 =?us-ascii?Q?il7Pnc5tKW8zJ295kk65JE/z6I/pMgVm36/95lW0xqsK1UQZbtlTUiwQTi/+?=
 =?us-ascii?Q?CYBAprLl893/rd1zQDJylM9nUea/07NB36rvGHU/F5r6lC6yLcM8yT9lbklH?=
 =?us-ascii?Q?vmaahqTfpbjceN0kCB9HIcmidveNnUiho3ok7DDfVJErl2RXyib98vDj7dPs?=
 =?us-ascii?Q?bJrvq4H1Cg2xqlemCYj1e4lTnvRTw4JY58l4o2Ob65BSSxErP3Kotv3P9Mds?=
 =?us-ascii?Q?ce2GFlNq7hISyWoRh/hYxho8czcOGHgFnNfj0LiTtgCLYHBAagEo8G537/FR?=
 =?us-ascii?Q?+h9lSCHuTUdO7gcSg9L8RgdwYAB8VqGarcldwIyBy0ExzkDcO15pg3zp/ONX?=
 =?us-ascii?Q?M8BvbxJTTGgv0dMy/wTTtAyopF2IQxoejip49q1f07PLYGy/aTwjv1H671IB?=
 =?us-ascii?Q?NFwhYxRHY5ERA9cMg9de+sWu5NkOErl0N5r97WK/8nhZsGp+2xxWPinaX62E?=
 =?us-ascii?Q?nFRxtN61BMlHnsPLxQNQQWbeWhJ1QNFqwDV/RlRzSVGQRQGWV6QWLHsKRgsv?=
 =?us-ascii?Q?PthgG4drenUnyuNEgHue+pBKZGCgF7nzW4zm+eAtiTuj9/WLkpuPRa38Yrbg?=
 =?us-ascii?Q?bR2lkQcBCC3hn0WnJpQzhKEUP84mDAbv384Q0TIHchGuvW6ur+zYMHRdv1KZ?=
 =?us-ascii?Q?2/+hPpg/UEdVLZ+j5AON64p4hRCcO7KsAegglpYl/azTndNWyQoL0i8EPPq0?=
 =?us-ascii?Q?lgVEen4HAC4vox2c2LyvatA3eqA3m1hJWucrWK/FwAeayf74BHQKyeW8haOJ?=
 =?us-ascii?Q?coM8ckb516V89q5dcJ6CdEkGUcuEZHFAJpXIZkrhzCWq31iQzOY8VJ1yZOe1?=
 =?us-ascii?Q?/oL0lCQPu9h7d+OZpM50rXIJalPjK+UyFUm3fBlENx07YcZqHHcB3erBTR46?=
 =?us-ascii?Q?uHTuRckpuC/6TbuauHh+Ft0s3DNipQYnP+0USfIIwE2YPfqoLW5hDzCxVthx?=
 =?us-ascii?Q?kTy8SiGeknVTciG3AbBgapxPhtNADDbcEUB1WaFaiJSukTydgqjoZFB4V5I6?=
 =?us-ascii?Q?YTB1yKme7Xw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PBeMNP2JRkjnM+En9yw5TzAs9QbPFWPsqPB7lZdYKwM5OEfrP+jFVDhySyX4?=
 =?us-ascii?Q?bH5RLzMOWhyN5v3oIFbxN98cDCTuHWMWySukncrWgFwtKwDGl5VBGNSj33Iq?=
 =?us-ascii?Q?JVDY4gxhB9CkmAhnQJ18dkckS4dYHi1muDpCxcRg0Q/4DzACe00TD3SxdyQd?=
 =?us-ascii?Q?4vLawzsiDJiXuRP6u/zLsEdB36tYGqK+pcxGM+FF1gTzzq7QuBkn/yTVCmJf?=
 =?us-ascii?Q?StUwy9zyV4uj2UKE2cs8KXHQ9q0ce9knXLPQbiiAt1UZZSmgFT4ajEmoTDdE?=
 =?us-ascii?Q?CNSjqQsdGOYwfWXSa5PX4vHyv41ey59uqeawVXVTJy3pR7XNIf54v6LTyHai?=
 =?us-ascii?Q?S4EtoP4K0CLLe6YYK8ZoZJTFoqDc2G8Y+cRiH32DiZbX1Msk/mItssTxIXSf?=
 =?us-ascii?Q?yAuppwaHTrWDZok0qnuCto3MqqiR//qRiG6P9CliPhyCl9mXxmP6Gj8pUdZM?=
 =?us-ascii?Q?wslTsyrnTZtI36/uhbFjWpqLGow+5tPwHAqeXtaI6kv0IHPxPXjUbs7aPGjt?=
 =?us-ascii?Q?wniBrA4lXY7IQLUEL/XWWy6v2JH2/gKxKyqXMiV1QFskpDfj5VxICTqYl5qM?=
 =?us-ascii?Q?h8adU6o5rXsa/UnyjdS/i/gjJIA2CQoSJXvdASau5ZgsmX3Ia+SuD7sEVIKm?=
 =?us-ascii?Q?MdIRa6er69HiRGIa8rEqOOPPOp8ZIN1JAt/oV8pML9BIGhGkbRMlf8a6Gtzm?=
 =?us-ascii?Q?RVrv73u79eMbF6PcB09F7q6HW1dnlCSLEqv8DE1aIF29ZFIABGu68bzl6Zyn?=
 =?us-ascii?Q?EAysBsRoSnGsRjA4ZwHDf+WRvoJxtqGj01YX12rO9oXFWybdZot1r3FZQ2np?=
 =?us-ascii?Q?EcF7ZO8V3i4ob9fQDtvdVudzwNMuQ6/6XpAUlUWlFBC8Vka4KP4I/ZeS0L26?=
 =?us-ascii?Q?3DMq2sbpzrHJugcX4H+Rb0OcoKzRFhKag8vSSqsgNwQXVp074/+6jjfUB6wS?=
 =?us-ascii?Q?iSwu1I0Xegcy3z7EuZHaoQRcOO/lXJAdbDQeGelsgyq4aUR9iINTtOl/lVqH?=
 =?us-ascii?Q?qAWmTj4tRkkU/uyzAsrobKGhrLfOcnPj5IjwAzleM8T3BXdv6+jYQvZaPkRm?=
 =?us-ascii?Q?eL+CnDWN9k0lKHHJvYVXW2hn95hLwwJEwivgl4PTWd+9bm2KE1g7cBwV42GN?=
 =?us-ascii?Q?nEUCAg+b2JOvbs6uEhm4Aw9MognZThhQhTxnt4UekeN6G4Sd2s7eq4ttkVlE?=
 =?us-ascii?Q?fjVwErhLBWvoaaNVzlTp86ZaW/doWfDNDjlNjlCoZKK/P/3pk6AVrZkJlHO5?=
 =?us-ascii?Q?M3jXqCzjiIRsg5AjZfYeDbx2Teo3UnaJD/bpAklYBwbRfrqC0rBqqVvj+WHM?=
 =?us-ascii?Q?hXYh9Ti8qvW+v1iCb4frBa4WyrNdcUh+nbwLi7pOuIOdpgtQDk3kTaHKd8h9?=
 =?us-ascii?Q?Yerm1CJmXNCcaUgv0CmqbB2D2xsUNh1nAybD9PJ+lT/cfkH3O+OD4MpE/aSY?=
 =?us-ascii?Q?82Dv9FnlmlkgV+9Hc+Eesxoxxr7d8D5dbZMl3je09N/40cifuhP/2jWBZ/vG?=
 =?us-ascii?Q?0MWc5bspa63pjPBDRKsoUfJwc/BGdtS5fKRlwiftME03V/W/Ae/+6nR2nfuY?=
 =?us-ascii?Q?j9Du9+V1geAozdKOlt8RTPUXEbGNCwKPHsoSs2XG6lsHh5eRn4ctne6G7XqM?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jrQY0Fu5iFkHJW9QV5ZvRc1e8CROTMsCstwMk2H54kNKI1Brnufs8fAjsrjYaJrgMI5xt3W/V1iQvpMy7v7BEGGFEwHCWfdliyqlLjIIrSTlKefOz5gii//BskRmv4CqOtPBBP+as0OaJaYS3cv5CclCyCACQGtyWxj5JRF+gE+8jwAl2XKLSS034yZy8WMADBLnZcA6TNw7M7fb+YrfhJpv1qN8I5JaHsFkXkC5gWMrIOI9F/ee2cXk6lG293tFBVyvJ+4G5o4Z3eF6orlk9AOlVNvU226wa+P2n+sLRmLKhEIEG0z/ZlzGD9TWl2B63MMfpPtNTrjBEDbPi1NFOMoj7B5WGjSAd2HRR9Mh83wrLJ7kuwbao3Mr0g4Ccm97hjZu84IC+wtX0HS70dGxLKwSOJAMJ5ctRvqDbkRg8GtnPw+Jp/9oZVL2Px2Urau3v90hjofnnVHk0jOUkWZMeV2QgwB+afBLrzA3RBEW9i9QVvCO+mTTYMFIZ+M5B9E9Phv/wYlmtxLk0EnVjo7UHTocxrtpeNdyrIvUoz2CHGnpkVjUjTQnxm9ZY6hwsTZgVIqwqGPMnA+NbjEvXkS/8W9FJWqh+FhLsQ5Wid55IZo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac12cc8-b89a-47cb-0093-08dd9d0ba2d5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 10:45:45.9722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HD3+XlC42MxpVwp0hWKd9lQ/sXH8vRlhhl5siULPACYQZ5E/TxzQhA5Un2xJ6JBGW3Pogx+6kY0pGvIwtp+Z7CDUufcnadyZXvtd2GiD/ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFC0AC38E58
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505270088
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA4OCBTYWx0ZWRfXwNkZJ8ZWuFmk BpcSk8b8AblDOo32luSusTWgNCukFyO1I1Q6SqPXPZje/d56dAcQO0m1JkMQfNq1Wq/CMsIHszP Z8G6GK+f2qCOLo832IfSr+/ZW6rz3Ogm0EUyx3fBY6QlSjwwxcRjlxknH/wTsJWbdGc+QMVs24P
 CKtTwViKf7O2QMsmCgV8sbz0FvKgPs2gEncZrd9Z8H3ZoCk+tdH3j4FUR4tia6YICbG3LfFpm5x IWKrE1jQ6zpc893gmCCgepDDH112M0nUuUPzp8gpT/r3ffnPxvgZFoQODXmrJMZ5SpKv49fr/3D chj5arruOrq+GETsAtdgp51Y8P7CuPsMJ/VhrAvhMENJPLidYECwZsdtEi9BZ7yGCaUn/g2WKEz
 OrSgnDWyriER297MFhz04mp2aUAFq6EmmiXNTRqA4l+NLLFaAI1hSI6hHs8cEpSBSYSQ3vSz
X-Proofpoint-ORIG-GUID: ZJeM-x2Mfgm6ud3ljjt3yA3W1nDOnuKB
X-Authority-Analysis: v=2.4 cv=CcAI5Krl c=1 sm=1 tr=0 ts=683597dc b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=Pq_2Wrnj-zEXneWydwAA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13207
X-Proofpoint-GUID: ZJeM-x2Mfgm6ud3ljjt3yA3W1nDOnuKB

On Tue, May 27, 2025 at 01:20:49PM +0530, Dev Jain wrote:
> Use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
> are painted with the contig bit, then ptep_get() will iterate through all 16
> entries to collect a/d bits. Hence this optimization will result in a 16x
> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
> will eventually call contpte_try_unfold() on every contig block, thus
> flushing the TLB for the complete large folio range. Instead, use
> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
> do them on the starting and ending contig block.

But you're also making this applicable to non-contpte cases?

See below, but the commit message shoud clearly point out this is general
for page table split large folios (unless I've missed something of course!
:)

>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/mremap.c | 40 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 7 deletions(-)
>
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 0163e02e5aa8..580b41f8d169 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -170,6 +170,24 @@ static pte_t move_soft_dirty_pte(pte_t pte)
>  	return pte;
>  }
>
> +/* mremap a batch of PTEs mapping the same large folio */

I think this comment is fairly useless, it basically spells out the function
name.

I'd prefer something like 'determine if a PTE contains physically contiguous
entries which map the same large folio'.

> +static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
> +		pte_t *ptep, pte_t pte, int max_nr)
> +{
> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +	struct folio *folio;
> +
> +	if (max_nr == 1)
> +		return 1;
> +
> +	folio = vm_normal_folio(vma, addr, pte);
> +	if (!folio || !folio_test_large(folio))
> +		return 1;
> +
> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr, flags, NULL,
> +			       NULL, NULL);
> +}

The code is much better however! :)

> +
>  static int move_ptes(struct pagetable_move_control *pmc,
>  		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
>  {
> @@ -177,7 +195,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>  	struct mm_struct *mm = vma->vm_mm;
>  	pte_t *old_ptep, *new_ptep;
> -	pte_t pte;
> +	pte_t old_pte, pte;
>  	pmd_t dummy_pmdval;
>  	spinlock_t *old_ptl, *new_ptl;
>  	bool force_flush = false;
> @@ -185,6 +203,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	unsigned long new_addr = pmc->new_addr;
>  	unsigned long old_end = old_addr + extent;
>  	unsigned long len = old_end - old_addr;
> +	int max_nr_ptes;
> +	int nr_ptes;
>  	int err = 0;
>
>  	/*
> @@ -236,12 +256,14 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	flush_tlb_batched_pending(vma->vm_mm);
>  	arch_enter_lazy_mmu_mode();
>
> -	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
> -				   new_ptep++, new_addr += PAGE_SIZE) {
> -		if (pte_none(ptep_get(old_ptep)))
> +	for (; old_addr < old_end; old_ptep += nr_ptes, old_addr += nr_ptes * PAGE_SIZE,
> +		new_ptep += nr_ptes, new_addr += nr_ptes * PAGE_SIZE) {
> +		nr_ptes = 1;
> +		max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
> +		old_pte = ptep_get(old_ptep);
> +		if (pte_none(old_pte))
>  			continue;
>
> -		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
>  		/*
>  		 * If we are remapping a valid PTE, make sure
>  		 * to flush TLB before we drop the PTL for the
> @@ -253,8 +275,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  		 * the TLB entry for the old mapping has been
>  		 * flushed.
>  		 */
> -		if (pte_present(pte))
> +		if (pte_present(old_pte)) {
> +			nr_ptes = mremap_folio_pte_batch(vma, old_addr, old_ptep,
> +							 old_pte, max_nr_ptes);
>  			force_flush = true;
> +		}
> +		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr_ptes, 0);

Just to clarify, in the previous revision you said:

"Split THPs won't be batched; you can use pte_batch() (from David's refactoring)
and figure the split THP batch out, but then get_and_clear_full_ptes() will be
gathering a/d bits and smearing them across the batch, which will be incorrect."

But... this will be triggered for page table split large folio no?

So is there something wrong here or not?

>  		pte = move_pte(pte, old_addr, new_addr);
>  		pte = move_soft_dirty_pte(pte);
>
> @@ -267,7 +293,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  				else if (is_swap_pte(pte))
>  					pte = pte_swp_clear_uffd_wp(pte);
>  			}
> -			set_pte_at(mm, new_addr, new_ptep, pte);
> +			set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);

The code looks much better here after refactoring, however!

>  		}
>  	}
>
> --
> 2.30.2
>

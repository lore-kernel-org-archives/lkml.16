Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C57B24DCE8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750698806; cv=fail; b=qJg3tRsYJ0IYBVeh8VNduVucmFrLzchreRwjn8Qdqdod2U6GOx8J6w6TNQsmJsNRg3NtZMm0Y9CAu3SfAKrEMTYGulBniFyYTi3ja/0ju1qGgvp03RTC/+Me92xeE3ImEu+pFf01dQUCulIx8uLfmPH2rbFOrHNdrhiw4eSSY9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750698806; c=relaxed/simple;
	bh=f2dHzIoNIIcK2fJtA4ZsmZ/d7QR2FyhPLr8rjfiDk2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LZTFoMHMqd+QqAt5+nhAgw8NkfUZ7Hkj3wLutx1a+pUCNBLdebmcsp6aeBOyw7DPoPtG1VIViTbKTpPgJgwrHC0HqGnSx8Wi7VHHgOQuo2Yeayt4RWXLZj0rV6tZpSBC7SQAY27ULmysQVrxr98L8lStuab0hcsqQGKszDEJiLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QHGb/txu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tplxW05k; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QHGb/txu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tplxW05k"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGYA41017678;
	Mon, 23 Jun 2025 17:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=2XIrwbw0h+NJyYGf+P
	qv4VpL+/hR5f0JEjTfT9aoRaU=; b=QHGb/txuZUzRoUWwvzaLWFoBgEPhLUd4ck
	fZHWxMWSRJpZkiu5BtfqcGOqR2NhATBcKXr34qTL6jZJYUrH14l13JU65o6r0uFP
	wSvslVxyTGWqTmAPAxNd8UEK/n6CWQAsGeDJ3FpXgCAsBQXL36uUhApmjt6igo7t
	kp6gREjZx7azpAsdatWhIUZc6DfRlw2Z1+8U66g3VhBtLj/xCw4vkddLsBJ/0KD/
	0KiCQHbuMwSxlbfskdZLYuQShc8aS5erj8S0LXQ9FTCjC/ajzNdvpFHFk5VFOUvc
	LrsKLeXVHggAmqnadnLcm+sQDt3ViriqiCAz3p2Kkhc36smEtFpw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y37g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 17:13:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGenc1038948;
	Mon, 23 Jun 2025 17:13:08 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr3kx3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 17:13:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIErm0Nj+OsgGaGvs98TGvlLFyZ6oc7INYfZWkODRld9yypBZJWUt/QrIvJcVCmBVy7QT1XBjfxEkhkL8GhXYWZh5naRVrHgTiWnD/wgLa6YO8Pjma1f+fHsXEyCd4fzHqKoMBuxezsFUBJPLXKb8LeqNyf0+ThLWC0/R44g37JUtwcE77L22nwsZ7I26LSR42aPcryIPghbrwfgff8WCeCSunaj9TBh4MIhOSyDxBkgqJ2KWkWR8BvBugb9bwd60tp9lIEXIP/0fTWbNrMhbTV+03jHTBhMvhxsvUrfZLbabCJWcn0VRXF+e4aWtfP3s4fGDDE07pynLvAdoVM9Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XIrwbw0h+NJyYGf+Pqv4VpL+/hR5f0JEjTfT9aoRaU=;
 b=iFdoy8qbEw06hKFtgqtentM//VECzxZA81LHFXOwVCjKxyvN57gTUw6RAKFcztnJZX+GUllrk7GcG1iWe8IEIbORG+sve03aC4sXFMk2B0OyDuvlaZ881xOOJO3SQV8oqyh3o/IjOLOjGgN/ncuPSriVu8vZWCoO5wC+Ql/yGKJmoPJuty4/q15KlyGI//y7zCZvzQjReCi1EdPp7LN0da7v1um5+Z+dMwwY1ZYknz371Yv76qS5NDSLZ9nn9UAj7Gb2HuoqhI9Xxh+sqTUwig8Zto+klvHF8zjrG6M8sFhvmPgjWGh+xdk3EvtiY5CT9kV5TN86vC0S8feOidtChw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XIrwbw0h+NJyYGf+Pqv4VpL+/hR5f0JEjTfT9aoRaU=;
 b=tplxW05kJ7XQprev9Y30wmAuorphc3kDSyhq/VuaGFVXJNaWupSrlwG3y/phzQ2BzRcuc8MSygyk78KSPHOj6MDt2oZopLjN/EZblTeZhqlkaokXA5llRa7GzcOniVh6rSlctspK4yWNXOBe4akFpkmIT6DlSlKUEL1LZet/nVI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ2PR10MB7757.namprd10.prod.outlook.com (2603:10b6:a03:57b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 17:13:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 17:13:05 +0000
Date: Mon, 23 Jun 2025 18:13:02 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Colin Cross <ccross@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] mm, madvise: move prctl_set_vma() to mm/madvise.c
Message-ID: <b24f45dc-96c7-4dcc-8dab-8de11e3921af@lucifer.local>
References: <20250623-anon_name_cleanup-v1-0-04c94384046f@suse.cz>
 <20250623-anon_name_cleanup-v1-2-04c94384046f@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-anon_name_cleanup-v1-2-04c94384046f@suse.cz>
X-ClientProxiedBy: LO4P123CA0601.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ2PR10MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: ed30f178-7053-4908-f189-08ddb27937d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XKg8YP4PSgzZrOdJa7o7ZXNxVnSbjco0Ft3nSqTApy+Ue67R5HX+a2O3Q75C?=
 =?us-ascii?Q?woPubhYnIE3xY8qH7QtEdW2Kr6+7O4sbhdZH7Rro7QKXfxKh1zUvm8MjVhbf?=
 =?us-ascii?Q?9G8eHRDQqIBk91CFfMwtvZg9vauHkdZ9J0czXwHTfWNyojOMx9QsiQa5VEGE?=
 =?us-ascii?Q?LepWRlbGufeGDbdVCG0dCtZNQ1xrjg8nhemUwOLwjdgT2oHHOKcQU3uyDsRm?=
 =?us-ascii?Q?x9BhXAgmaxLAtItCK+s556s17YRD9vYpLiRqCmW370PCbzt7ZoPraSLHswcK?=
 =?us-ascii?Q?c/olznqNdhHe2IE4GUdlWHKtw/Go6v0+AjPeKRl6vurfmbYoNgEL8o9nQcj6?=
 =?us-ascii?Q?at7J+aluVHf8vOSThLoNpYNNNSfGSlGJLfcQk6+So4NjqO4k2e0SmAj9JKNH?=
 =?us-ascii?Q?133exNOd8iU9rFsjr5ffWfT4sXI/UHzurRN0JY35mhsedBxiZ2Nvh8C54slq?=
 =?us-ascii?Q?gpEzlrhs+QjZpn35iyArUUtle+tgqsi4CgYohHoUyb9Bhvs+zr4HIonVM6Is?=
 =?us-ascii?Q?BowFmjAgzIVh+lSY8UbZXmqhRfz3MKP43I5XGhaqKx83YN2bklLFke0lI4kJ?=
 =?us-ascii?Q?fEHAJf3fBe4gPXrhx5PPQ46kcYLKfLyBTJSefuqaOLyRGQD+vrEuP7mdbkWA?=
 =?us-ascii?Q?6OmatgGD1zTf4izHIXDqomHAzGFYmeHBibpXp6Yvy8Yt/d/bgtLZchMnKAfh?=
 =?us-ascii?Q?u3AKQtwsbUEy4PVK7js82V83U1+dJD0NSAuf8XhIuphZqVXigr6OK6eMGUIp?=
 =?us-ascii?Q?D200gopzJO00DXFrdw7ZZpmyWWBoZ3fzDx48o1M5oHU+150UDNYMWnHqDzU5?=
 =?us-ascii?Q?Mrm2P8Ghg2ZjZTR98w54zin5VGqosVYpb8C7Ht5EG5i594zYL8LybWXN46Sv?=
 =?us-ascii?Q?MtyJBM1oba8RnThXesdLwQeMWW56Ici019wx1zufRBRopUvzP/9qM8SkhVkQ?=
 =?us-ascii?Q?004yxOqDYv0D1mGtGTaWPxgFMc5RT2TVhsU3HcY2zuZvZkpryunXRYw4gM1V?=
 =?us-ascii?Q?DKt3AYBEpGyJNgflub9zvYsb/1ewiUP4ylYF4hgBTBqLuyFQ9DDl/DfN1plx?=
 =?us-ascii?Q?aCEDnzHUD4BhUKa06WE7ZyWWscQZDS556XFRjkxOS6+03Jg8kxsRbezPTFIu?=
 =?us-ascii?Q?H8yf5VtPEG/ygJ+RP84bUrqgs4Y2yeUC3/R6lmw/JgnMCpMufacqACkumtj1?=
 =?us-ascii?Q?kHx+7m9n6x//K65aLg6D/2IVNrC/SYHnc7f6zofIrCayiyubqHQl2S/qJyjR?=
 =?us-ascii?Q?cqjTovYiu1qVpntGSfHsO6D/qKXRevo1TTPPexFERx6Rfh6ljORjbOgHRast?=
 =?us-ascii?Q?O0hZrGyvIpIIC+lkb2ym9VRgwBVVBX8nv/KfRUgUPwGmDjiYp49hOMlUxRDc?=
 =?us-ascii?Q?YxjNHc8vx8LGjyBdOpkSamEXNZ9SYHivXm7uzuVSYnlQWMI/MpjwQj9wKizz?=
 =?us-ascii?Q?LB6guDocFqE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9yzUShSJzo8+8+0z0OSnfKm6Gd68rHQ/iLThtzZmM5yOeeiOlKVv7chlfki/?=
 =?us-ascii?Q?WYIdlnzmUojwJI8TX3jyWEalqvz8gHM50kZcUFa+xg7nPqXFgPaFfiN7X8Kv?=
 =?us-ascii?Q?T+z8etwPVdjVYwscDWU7eBXpyN6V4Yh6PuhZzxZtPkU7nmebJ7DTUXJt+rXr?=
 =?us-ascii?Q?/OXCtMOqbxaDm1JeMB2MFmf4Qw7hHsnUzeaPO3dllEV4U9SZ9d8aWCTK1eVQ?=
 =?us-ascii?Q?kkvcOMbD8kfOUdwsI4IF5iHNVmmsCIy7OGxp45hn7+Gbl6VBt4dzDT3vXpJ9?=
 =?us-ascii?Q?0hwqRiP3272mgDNobSZLY2DD1PyQXrzvH0SEdMLBcV0Znxko7mjSEN200ldI?=
 =?us-ascii?Q?Ts7LZ+fGYpzFG3+GvaX36+WgiuPyuBelh183aBtNfEkqsbHQRSWm30wsHHJB?=
 =?us-ascii?Q?PH4yARgAzpQfSY7+h3xsJRB4DM8QJPlpYpfzP9GywKYNIsfZ46X57RoO8ucW?=
 =?us-ascii?Q?OrXra8ptrWR/C+XS+HdHw1TRrJR1owvRpo/SdMHfw3OwPn/LA5DFzZh6fTDM?=
 =?us-ascii?Q?yYs0SGBq5Zw8XKQ6F7ZWhgUgZSJ6RGKVihH/Vd8C+u0Pam0zlOPwOIc6SjP5?=
 =?us-ascii?Q?xSjw8TvQ293sujGvzB788s/cgcS8Fs85Fxl9plHhY7gZUtr86eF1S19Q5p2C?=
 =?us-ascii?Q?Fga9Zp8DYhwAR3l84FNhnYiRZWHzaD40EV6chIzw+8I647XjNRN2+05deMvq?=
 =?us-ascii?Q?nxkyUx+DpQT8gwfkBtwnvtsQYeVsTCVYJzN0UeBmGXj0RDlegI/k5MhdDFpv?=
 =?us-ascii?Q?9p3kbSo0/RD9/WyviCLglI0xdpRWx8sP/lCcKdnGxX1ScDmayDM65FDRus5L?=
 =?us-ascii?Q?+XwWCitoB/NuFfJmT9tGK1/WNotxiCWwBYAjpUrekIbUtzh7huDxj3aXVQYQ?=
 =?us-ascii?Q?K9m6Mw9a6YHaitBdl+vKj7BHbSR98kMThEsKTCQlCvh17e3ztP1QniPSgCK/?=
 =?us-ascii?Q?UWpmx9vb/XUCuRcSmGbhSoq8TWmjXubQIfELjD0G6pPpl81NwvRxhu2307Hu?=
 =?us-ascii?Q?qug9+4y49n/7johiTJ3uwISXyzwI3QwFDAuhP5wR1+HB2RN7k1fomuLo05yx?=
 =?us-ascii?Q?1fKyCVUT4gaebC+p6UWWW40KuhOP4LqWQTeSFLxOnYP7Fd29mx9FfAwqkGlV?=
 =?us-ascii?Q?m9vqY6uobiAxNtKtfmmUHycy2e2KE5QCZf2UHIvLSYkbVFOA8wE47rZfyIqz?=
 =?us-ascii?Q?ouhNLgwCGfOHYY0k5QSCzoOYarnd/TfnogylIULKdWXjHybH/eCcumiF3W57?=
 =?us-ascii?Q?UI1znUpxsxNi5CecO15r7s5O/4Zu6GcNyriTTX0zyuI3U3NZxmXNJATZfK2F?=
 =?us-ascii?Q?pM/YyIrCkNrd041eU9Xdd20zOI+mdiDqWVkkAhyjPKiCDUm7nbzpv63kaIA3?=
 =?us-ascii?Q?QpFLdpNH72YdgcHYWZvliuG62iOHj6Dn+yg52yslU76NNTN2pIIrWT3hreey?=
 =?us-ascii?Q?EwqVIciThyyCFSUPR9esjrM3TLhoGisRz3nFTYk8Sqkx5w3E8416YYTpWRmQ?=
 =?us-ascii?Q?+NTikQgCYrf4v4iDar/syAm4X/WMv83UZhZlKSsIWaC9Wue/e1gUG+c44Ewe?=
 =?us-ascii?Q?r4Oxejqb0w4dZlvG+S+6avYar3J/UMpWNS0CjJNQfm4tfjOu6p26I9wzhYlf?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8POISyzll/buetvThWHfPf25CNGa19Q/0IO2ZLM+EmOA4D3/cCbFy3mtQ46xZToxd5f5qiXoFHLilxDpN2qRBpwtXcc+eQYq2r4ibceDSxklje/vG2FEwATHe9qTyJTLouQombrjrb7rQHj8LscRgZmhGYYGlZT1kWPmmJcsvzDUwPPtHbMv7Bp8o18T6et9WiHqSOrv0cOFxQp8ySu8EbJIL7pcelRfVBiz5YZduT6gOTkOgXf66zOpuhNV4K595WgCjvAlh9EK8F6I+KJegtB9pIGJf/kfLEKER1mt9gBq9AtbGx/Xrq2+hXcQ2KA+Tfqp4SAC0nKGKpOt+ZO2e3lqkfhVIL0lLEdY1wov/kQU/vCwHVGsXlhzK+fDz/xRlFfMoyerfAAgmA179d2/LENipbV9s0PmZgYjrr006Dv3PY1LDgmC8orf8nGQQs4NKm9GJ6Ijty65In5OnyxmXbyIsCmOjhRsonbmrB6m1D3GHUmA1R/DgsZbqnPNMe3JBK+w1T4vSLxXdEDw1zlh/EiXDQl447bbqCrTwEsLXpJNaMxhTubXj1YnJ01eiZXvIR2qrnad3AVzoXaXyN6cOIeuowgPrGVLX5QrpEnL42U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed30f178-7053-4908-f189-08ddb27937d3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 17:13:05.4702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1UDO9NtPCzU5WWQOWjvYg2l2pvGoc1WxdT+ZDyr7Cyq3pyM5tS/KgAS8wWTSuP6D0+RIWWgVVU5F8dGngco2HwmJxv5XtK9LEqWx8tGG74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7757
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506230105
X-Proofpoint-ORIG-GUID: -ohAy-RKt2kchnhwDKpl_aPAUQEJV5Lj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDEwNSBTYWx0ZWRfXylsD4SwzYNAK gTwY+GhvZTl5pGFjnLXD5agILW9/VDFb1r1RYQJ1+m2u6rVNxFAX/UnIJkaXG1GRRWOkcYbcND/ fRFvtpBP95x6s7Rmi8OtY/gp4P2i2mDhE0/mnOTAq7aqeA6ORnwwiyqdIL+tmDsvNbKiRzPPv7E
 tcfaYzefQfFnjMuC2BGIm5f7MG+X7nx22BckoPnhGkY3ZhMONHn73uKz/vonlLOHyUeTiUUx518 78QuM68vo0WpWz/AZcwCO9gltlf1ZzDZoS81yOfqG1Fr9c/p8Pt0QROZSYTiGN+G5NCwVw/TbJn 2+cG1iGeak9a2LwpX+U5RaKmanPk0ifyOT0Oq/y3xDMRSuAKm3LRG/bkhv/E4F2/F4GK2YudNDW
 F57z7R+cKiMm9IS3lMilwRUcg/XiiJ0J/LZ8gdGWE8Yi88N0xvgx0zg60Tty99L5jLBEFDRd
X-Proofpoint-GUID: -ohAy-RKt2kchnhwDKpl_aPAUQEJV5Lj
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=68598b25 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=9FEJaWzpZznIaBWQvBoA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206

On Mon, Jun 23, 2025 at 04:59:51PM +0200, Vlastimil Babka wrote:
> Setting anon_name is done via madvise_set_anon_name() and behaves a lot
> of like other madvise operations. However, apparently because madvise()
> has lacked the 4th argument and prctl() not, the userspace entry point
> has been implemented via prctl(PR_SET_VMA, ...) and handled first by
> prctl_set_vma().
>
> Currently prctl_set_vma() lives in kernel/sys.c but it's mm code so move
> it under mm. mm/madvise.c seems to be the most straightforward place as
> that's where madvise_set_anon_name() lives, so we can stop declaring the
> latter in the header and instead declare prctl_set_vma(). It's not ideal
> as prctl is not madvise, but that's the reality we live in, as described
> above.
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

To be clear I also very much love what you're doing here too, but again feel we
can tweak this :P See below...

> ---
>  include/linux/mm.h | 13 +++++------
>  kernel/sys.c       | 64 ------------------------------------------------------
>  mm/madvise.c       | 59 +++++++++++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 63 insertions(+), 73 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 0e0549f3d681f6c7a78e8dfa341a810e5a8f96c1..1f8c2561c8cf77e9bb695094325401c09c15f3e6 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4059,14 +4059,13 @@ unsigned long wp_shared_mapping_range(struct address_space *mapping,
>  #endif
>
>  #ifdef CONFIG_ANON_VMA_NAME
> -int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> -			  unsigned long len_in,
> -			  struct anon_vma_name *anon_name);
> +int prctl_set_vma(unsigned long opt, unsigned long start,
> +		  unsigned long size, unsigned long arg);
>  #else
> -static inline int
> -madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> -		      unsigned long len_in, struct anon_vma_name *anon_name) {
> -	return 0;
> +static inline int prctl_set_vma(unsigned long opt, unsigned long start,
> +				unsigned long size, unsigned long arg)
> +{
> +	return -EINVAL;
>  }
>  #endif
>
> diff --git a/kernel/sys.c b/kernel/sys.c
> index adc0de0aa364aebb23999f621717a5d32599921c..247d8925daa6fc86134504042832c2164b5d8277 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -2343,70 +2343,6 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
>
>  #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
>
> -#ifdef CONFIG_ANON_VMA_NAME
> -
> -#define ANON_VMA_NAME_MAX_LEN		80
> -#define ANON_VMA_NAME_INVALID_CHARS	"\\`$[]"
> -
> -static inline bool is_valid_name_char(char ch)
> -{
> -	/* printable ascii characters, excluding ANON_VMA_NAME_INVALID_CHARS */
> -	return ch > 0x1f && ch < 0x7f &&
> -		!strchr(ANON_VMA_NAME_INVALID_CHARS, ch);
> -}
> -
> -static int prctl_set_vma(unsigned long opt, unsigned long addr,
> -			 unsigned long size, unsigned long arg)
> -{
> -	struct mm_struct *mm = current->mm;
> -	const char __user *uname;
> -	struct anon_vma_name *anon_name = NULL;
> -	int error;
> -
> -	switch (opt) {
> -	case PR_SET_VMA_ANON_NAME:
> -		uname = (const char __user *)arg;
> -		if (uname) {
> -			char *name, *pch;
> -
> -			name = strndup_user(uname, ANON_VMA_NAME_MAX_LEN);
> -			if (IS_ERR(name))
> -				return PTR_ERR(name);
> -
> -			for (pch = name; *pch != '\0'; pch++) {
> -				if (!is_valid_name_char(*pch)) {
> -					kfree(name);
> -					return -EINVAL;
> -				}
> -			}
> -			/* anon_vma has its own copy */
> -			anon_name = anon_vma_name_alloc(name);
> -			kfree(name);
> -			if (!anon_name)
> -				return -ENOMEM;
> -
> -		}
> -
> -		mmap_write_lock(mm);
> -		error = madvise_set_anon_name(mm, addr, size, anon_name);
> -		mmap_write_unlock(mm);
> -		anon_vma_name_put(anon_name);
> -		break;
> -	default:
> -		error = -EINVAL;
> -	}
> -
> -	return error;
> -}
> -
> -#else /* CONFIG_ANON_VMA_NAME */
> -static int prctl_set_vma(unsigned long opt, unsigned long start,
> -			 unsigned long size, unsigned long arg)
> -{
> -	return -EINVAL;
> -}
> -#endif /* CONFIG_ANON_VMA_NAME */
> -
>  static inline unsigned long get_current_mdwe(void)
>  {
>  	unsigned long ret = 0;
> diff --git a/mm/madvise.c b/mm/madvise.c
> index ae29395b4fc7f65a449c5772b1901a90f4195885..4a8e61e2c5025726bc2ce1f323768c5b25cef2c9 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -31,6 +31,7 @@
>  #include <linux/swapops.h>
>  #include <linux/shmem_fs.h>
>  #include <linux/mmu_notifier.h>
> +#include <linux/prctl.h>
>
>  #include <asm/tlb.h>
>
> @@ -134,8 +135,8 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
>  	return 0;
>  }
>
> -int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> -			  unsigned long len_in, struct anon_vma_name *anon_name)
> +static int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> +		unsigned long len_in, struct anon_vma_name *anon_name)
>  {
>  	unsigned long end;
>  	unsigned long len;
> @@ -165,6 +166,60 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
>  	madv_behavior.range.end = end;
>  	return madvise_walk_vmas(&madv_behavior);
>  }
> +
> +#define ANON_VMA_NAME_MAX_LEN		80
> +#define ANON_VMA_NAME_INVALID_CHARS	"\\`$[]"
> +
> +static inline bool is_valid_name_char(char ch)
> +{
> +	/* printable ascii characters, excluding ANON_VMA_NAME_INVALID_CHARS */
> +	return ch > 0x1f && ch < 0x7f &&
> +		!strchr(ANON_VMA_NAME_INVALID_CHARS, ch);
> +}
> +
> +int prctl_set_vma(unsigned long opt, unsigned long addr,
> +		  unsigned long size, unsigned long arg)

So I'd really really like to quarantine the absolutely disgusting prctl() stuff
in kernel/sys.c. I hate to see this opt, addr, size, arg yuckity yuck yuck here.

> +{
> +	struct mm_struct *mm = current->mm;
> +	const char __user *uname;
> +	struct anon_vma_name *anon_name = NULL;
> +	int error;
> +
> +	switch (opt) {
> +	case PR_SET_VMA_ANON_NAME:

So I'd like to copy just the below over to madvise - we can decide to move stuff
around _later_ since it's really weird to have all the anon_vma_name stuff live
in madvise (apart from the stuff in include/linux/mm-inline.h obv) - but I think
that can be a follow-up patch.

I'd like to then split out bits and pieces to make this less yucky too.

Maybe add anon_vma_name_from_user() grabbing the characters, doing the
strndup_user() etc., have it call a new anon_vma_name_validate() static function
which does the is_valid_name_char() check against all chars, etc.

> +		uname = (const char __user *)arg;
> +		if (uname) {
> +			char *name, *pch;
> +
> +			name = strndup_user(uname, ANON_VMA_NAME_MAX_LEN);
> +			if (IS_ERR(name))
> +				return PTR_ERR(name);
> +
> +			for (pch = name; *pch != '\0'; pch++) {
> +				if (!is_valid_name_char(*pch)) {
> +					kfree(name);
> +					return -EINVAL;
> +				}
> +			}
> +			/* anon_vma has its own copy */
> +			anon_name = anon_vma_name_alloc(name);

Right now I find the fact that we do this in prctl() super gross. Same with
mmap_write_lock(), anon_vma_name_put() etc. etc. below. It's just mm logic in a
random place.

Obviously you're fixing this either way :) but just to make the point :P

> +			kfree(name);
> +			if (!anon_name)
> +				return -ENOMEM;
> +
> +		}
> +
> +		mmap_write_lock(mm);
> +		error = madvise_set_anon_name(mm, addr, size, anon_name);
> +		mmap_write_unlock(mm);
> +		anon_vma_name_put(anon_name);
> +		break;
> +	default:
> +		error = -EINVAL;
> +	}
> +
> +	return error;
> +}
>  #else /* CONFIG_ANON_VMA_NAME */
>  static int replace_anon_vma_name(struct vm_area_struct *vma,
>  				 struct anon_vma_name *anon_name)
>
> --
> 2.50.0
>

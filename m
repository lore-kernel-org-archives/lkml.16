Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C72D16DC28
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748893139; cv=fail; b=QMF6CwtEqM9CWVdhxKjyXQZzTKc4xEaCwmRjmZWpFQSN2BT1MoOawyC+AEBUkv6vhS9YkfwHkV/9KHlOIMcixYZ6rH3noOixJv8WO9gL/Z3h81OvVkBKAeb1psJg0yqwGXRdCd8cokvwnT7/1ciLXVIDOR+K3YLRP3P3G7bkoT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748893139; c=relaxed/simple;
	bh=goyxlV3c3/z9v8uzsVp/jfiBUbTs4oE6x5m8lpXKtFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fcyCpg59h5lD9t5bCtmYNSLs3U4XiGdu54DDgKArc2RRqr3VMFqGeB9ZSc89q4DWLLdlEjcUiZtFtj7JrIYcqzLnGKc8zoWhA6Zp9JEypP68ar88coGE4LoOp2agl0TsoNggzb2ylmFNs3crwLZFrxs3YT+MucvcGURAGB+2G1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A4Wums+q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cZDHH0xk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A4Wums+q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cZDHH0xk"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HNPZ8029773;
	Mon, 2 Jun 2025 19:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=V5AlwhPVRALgP6z/VH
	Z9NsV1F//nbxLXfp1UeN/nRc0=; b=A4Wums+qMmweomooQLmMu5piyfXZqkZxyw
	yMMJuH4Tvb9JwV5BqjhoZJ3LwwTQXPn8xWoA3gkT/sMWbJjFEKr2k1WYMT1nAARH
	3FCsTWLV/peO8xj8217CWtxJGyYhbHX7YvMLQ7LuvXIpaZxhWjFe3I4WgFhOROjA
	5wFBoXQaY5gNVfW6nryyFqzCfVv1LhiAuaWL+alxYUALvTtLlhJOWcUXLg1gmad8
	49ylsIC4qRMIul9NbP096K1qyprFSHyGQd+2ox6GL7W0VEuJSJEhm02p0LJVhtC5
	JtPhvNaF1TSUJUJCbrk6ucfcUlBN3cLZ7Xv2D+h4YyJJ+8x5VlSw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gah88p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 19:38:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 552IhpNo033811;
	Mon, 2 Jun 2025 19:38:43 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2069.outbound.protection.outlook.com [40.107.102.69])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr78d90t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 19:38:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUKDOpLac2PMSpBkOWvZpjsbG3+DG+T3a+GF5lEMtvYWOryJrP6wAJwFDjFYUxjmaCyOnqbZncQrYmg4I/l882z4OUUjJLVq7s7aWTzFIiRwaM0QjxzSgi9SdPaCO3qD51pmExJd7h0qmsnSPJcF5f8S9qCg3r6uc42+Z/BGa24or/nhmqXxFkjl7YgPWwQS3ai7cw5t2dhLcBmyJfi1zJj/PFhfSG9hh/z83/SkIsCYDoAJYtXrniZAgJ/DQCK1OroE/SE36ye+/4Q9jAYAg0lCEQdRmlIJI44aAjfTXC65eWDPlkTWk9foZLHNXEDoHUVcF06CLngBRJkhunW5fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5AlwhPVRALgP6z/VHZ9NsV1F//nbxLXfp1UeN/nRc0=;
 b=knWpFrxt5rtPACLMAOoNUkhFeG7shTA4b7fcozjtifLAPFUQaL1hpwNHba++0IK363EWcMPWozfzZx+VbJ97/fiMGPozyF/fP4nsmFH50JGabcaPIFqiWpQNiw+KXs6mK/zyT5LZQhPF3+mJRQ6uibi9Ji+5abLQiuJrZaa2a8sQKDJYhgI+MPXUVWg8p8dhN1Dt4bm8YoiE+EtM9R9njmsnvpJmAjYfa1WYc1/2zBiG2JbB81CTQrdWizDuIIWm00xK/nRr2FzwYA7nIUTHwqSPAmK+aNKzPpdQXk4VobMBGEExoAF1QfwNOA0jPLfw1cRc1l34C79yc+YkX6iUxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5AlwhPVRALgP6z/VHZ9NsV1F//nbxLXfp1UeN/nRc0=;
 b=cZDHH0xkFWkKQYBumlMXOLPFOafNLR7TYsmPEBaJTFRETd3R5iKMJsE+LYDAvfJJEHO0FU+vpAjdzHMF0cXwauLZTzz+1Gf0JU0QWe0piSZotEgokxMXHvgscp1H2uqkHLpFX+ZkUL/X4YI22kwROxVRH3ICWuEb91emzT4PBQM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN0PR10MB5911.namprd10.prod.outlook.com (2603:10b6:208:3cd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Mon, 2 Jun
 2025 19:38:31 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 19:38:31 +0000
Date: Mon, 2 Jun 2025 20:38:29 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, stable@kernel.org, Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH] mm/madvise: handle madvise_lock() failure during race
 unwinding
Message-ID: <4dae34e0-302f-432a-a996-8353d4ba9f58@lucifer.local>
References: <20250602174926.1074-1-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602174926.1074-1-sj@kernel.org>
X-ClientProxiedBy: LO4P265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN0PR10MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: 751a86e6-0397-4baf-5436-08dda20d0ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iAPeHsDS/08qaGX+abzkl5DesSyWvI2qvtq2LN6IQIDcnc26aOG3p1kSan7f?=
 =?us-ascii?Q?yQ2sUwO692suBbPrQPydrYkZRo7hJRWbrj6CevL+nqjnDjJmzqyo2pRI4pLK?=
 =?us-ascii?Q?sILSdMKf+NgYrf99rM0SJjwU8L/gXgyGk5uX2AOf1a6NJ+4lpWE7xBhBzapI?=
 =?us-ascii?Q?3ueN4+VSJxjRrjmFFkCdGUh6FnHMdyt9/Ud6ysfao4FW1IZJAknyp1Am26Hf?=
 =?us-ascii?Q?CfW34BS0AzIABWZeMCbaT/Yk8erEEJvsc7EnhPYSeyZo6uOYHDzaCGBRAZy4?=
 =?us-ascii?Q?Afha2t2ia5mIzir6g5dadWyMk4lm6vMb/et74ZEIEXjt+trOi7Tg3GVttvH7?=
 =?us-ascii?Q?nxgvjfS0jmied+3I2C3TNO69u/6IdrL0WoFiE8xZaQeadWWGbe37BqWiTM+I?=
 =?us-ascii?Q?ry6Vj0CmG1hLTYPG3MX7n5GlAUqTEQuR2FveYhaCHpgIsOcL10M089+rQjey?=
 =?us-ascii?Q?ops5glaEMAAAieUBG79h74ULihvxsO3ubDHOFZR9lxABome/qj5MmHbfQnqp?=
 =?us-ascii?Q?92vqMZyUfyjy/oXMNQlUfqm5X1HGMt96wcD/WNCCrkRx3k1SaPSeP1TsVQ3Z?=
 =?us-ascii?Q?NHPw8jkWo0OelpfzhpZRx1TpVELuwJwltOK8D7lrs9J4kBzq+V2QI1QbBelk?=
 =?us-ascii?Q?DDGSiYHpQ5bmE2qd/TuPx0FonjMi8ysABguTdMh3kbQITyYOJdVnMskHlIsR?=
 =?us-ascii?Q?OOD++n04/tmCL5fzkraxm6dblPSACxSzDAcWNLvPUtwRH+pI4K8LDS4HfciB?=
 =?us-ascii?Q?ZnPteFN3Z/QLlW+y4I1Wp97D6wZXabd6Nk1X68niC5j7/vuImZgqMeOgtBqN?=
 =?us-ascii?Q?oO3EWoQ+O4TdBIjT+5w7kSUDinLfQKBIPZEum5wB6wT0U9iO/HhC6FEhbqpc?=
 =?us-ascii?Q?jdHkMDkfgT1P3S2WyiHly6Q2MXMpJWOeRaxK3OphQPq/W6GO40u9q78+G7Mh?=
 =?us-ascii?Q?cL73M/GlqdLrjcUROKF1tMY0X9Oq1YZzEcADNENi77RcY8z23ryfxXtbWqEI?=
 =?us-ascii?Q?LPFJ0fccKqG98C315xxbucImM+UQRUMjUppGjFtadFN1xdQAevbX3hx/AD52?=
 =?us-ascii?Q?bVDot81ZzDkb3LBKyF8+Ud5TB+31q5wxSN7mgaYpLoePf4QLGuSZWpxitmSp?=
 =?us-ascii?Q?m+mJsQkMk8fII37TMUEfwJHlazHaS9ZHzppS95bQb/x8Zdo/xadI3XU2wf8W?=
 =?us-ascii?Q?WDOYJCgolL8BiaBofQJznUCRh17VHKORHcKl6wLRVi24p1FLluFVTCCb8/Eq?=
 =?us-ascii?Q?qbbfs8/m/xggFYSpXbOdu330PQzlyrB0J5EiTT/AmR31uNszC2DiV9ljsMCZ?=
 =?us-ascii?Q?1iBE6SwRrQhG/XNshv8VjBt6L6JG0MwOSShfQrWQY6scaKF9M7C34yDfg8z/?=
 =?us-ascii?Q?dOla3lnFzF9VHzOd/RczfSCE4N84?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PlnNq7inWOy91Aui6W3+NeTOFAV+6DYsRJKeogBA8H48IsGvB2rqwAWtuox9?=
 =?us-ascii?Q?dcX/n1WwgpqYdIuiY43iNIyiC5Ch4wF1oxtLAvty78flqVrRHM9yzNtcH0ey?=
 =?us-ascii?Q?1Nf9ntEQ1F8aZW8q+ScMzPOmN6UQ8mCQnJdrgnYggr70AvT4IKicwxcmVRZN?=
 =?us-ascii?Q?FQC/s3hKiSEpXeOLV70f1jnOCMuqMYVMRjzfbLzCpd5lTV9RH5EqLy17UFPk?=
 =?us-ascii?Q?2XITl7xujDC2aWBZjaDFjCFrr1S18ZY09A5GBsTcAVKKUYoA5FngRqu6j5Ev?=
 =?us-ascii?Q?zDC7lXHUakl1Hdv89l0lnfde/E5tAdCILpStwx8MRTOpbf3t7gawcLzVr/6t?=
 =?us-ascii?Q?yVi1VE97rYIfMpzrP1FemDT9KgVbto3pVnC3fpuXTHMm2RawtSiNMMPMA2h4?=
 =?us-ascii?Q?UTcG8teXfPFGu8eWeO5B9E50bEpTOLZBRuYYG2OjQgV580gseybPZMui9MrN?=
 =?us-ascii?Q?I6M/gPp6l1s6TJ0YpClMPCus14LUuLQm7OW2P6AJ7JJgv7Hb4zbts8CB05zu?=
 =?us-ascii?Q?VAMVGMk29bZytYAOqyWyQhXEdJKhOsDGCbHyb8e31rol3nlguO6nJUeJ/3B3?=
 =?us-ascii?Q?AWtw+hDmvf8Zi/1GjSMTzd9zUV8go2l8Od1cy9kq/KZd2znnRz0cUTJ43wVw?=
 =?us-ascii?Q?u2j4IVTfIBe5+scYYg9Tn/a8TswD0EVAhhU849/Whi/tGSLfy8yE9HWviqaJ?=
 =?us-ascii?Q?x0IVUkb8I/B/DoZ3phxfip3M/X6hHIT5tGHXlRzCpk0FD+yW9aMpU1qLCpyH?=
 =?us-ascii?Q?/jOyVb1NNIhwVsUEynh4WONx0VwTFne4adQK1CrowgRgTmbYgOGU/nChJdn6?=
 =?us-ascii?Q?/leRUgTWA+SL49gdPHL0mzhQHLlqunVfyhGN0PEoltmRXih//+fiWxrDxmLm?=
 =?us-ascii?Q?EnTCTaNbB6WNGbeJMJbnM5X4Pu4KSPkpKST2mhWUWpoN0lCkOa1lWypOsYwI?=
 =?us-ascii?Q?90ilHMvi1vX7h3106BjOqeVYPykm9xKvSYNlqTtGxdR48cF9Xhxg4VshKEqo?=
 =?us-ascii?Q?ocTLtF9ryDfeGl3WsoxZ8y0OyR8Rl1b+YCPi2TSnk3wDJX4DAkxhyOJ6l2PF?=
 =?us-ascii?Q?Xp8GbqIQMfTqeLnVi6ZjsoEQ10JtzEl5h4UT7HYQ3tS8ro1Axocdy1o6S4Xs?=
 =?us-ascii?Q?GlxReMaLYNa60EpdWRWum86mCVmrECQABvMIBYBkoPVlq7+0FmrVok1Wi3tP?=
 =?us-ascii?Q?HDQVQmtFkm9AouMVabDpkxbcWM0TOnZ47hsGgvWUCtKdfSqm53LNUEllRjfi?=
 =?us-ascii?Q?IChc3JRCN47TiOHKLg3hCjwlW3bKL+fTb9mXfRG8exTjSXSuOkhJkD0AUJGN?=
 =?us-ascii?Q?eFjC11gtnIiSiFS3Za74ft5Zp3mbMmQQTXnCtY2RcCcWGFyoj+0VXswvFVS9?=
 =?us-ascii?Q?bp2P7e1gPEUQF3GvyUJCGJIhaS5noxGWizAOG2fnJ5YVTxcg5uq7ANmR6/I6?=
 =?us-ascii?Q?zXZU0ewoNds9tGi8xUU9Q99jiqeYgPXESejMNSV+5TRtn8EfiL3kS0c8sMLS?=
 =?us-ascii?Q?Vg9OHvpaquW/7JwOhnv/glFudbquJ/uqWOmFGNhafMbnp8dkGAHw0W2Ja8FH?=
 =?us-ascii?Q?uX88XGKIyndvfGTkRs36ilNlw5Qy/usEjNAgdqHwCXoYImK8xD4WoP3fF5vV?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	33oTZ0UqiSkW1+hkfUcCYcxVFwTS4UV19w1nJ6VMI+ijBVNGVXepoT6BeZCvrfAU7FXVw7VRSDUtRjpTLm6gumYTKUm1jSyRQ7EHpDSRSPsKd48S3aXdkf/GUzNBjVfH/557U77gCmZp8toq/WCa4M9UnXsndHIrivkgeT3tFUvWiRYdadlLucDcKELaivqsQ0ezvjLQH4CR9/uGto8opIZ0WeHHchJiIMyGmSmj4cn4AoMjk2qBv44F41GdTjZlU4D6yD5VzIZ9ZZ+Zan8RFjbaxQgtbILXDUmWLPi0eU5emuIEcN3MCIFnQDnw5s8N5r04YQBzXhdfOKZRc7mmxvQeS2kWR/IJc/2b53jydQSScbroqIyhYSQfkaobaG9gDcNvYSM+Zikj1+hjN/k/Zhm5HV6GSgIVzIgkY6jQgr0s8EatU+OtQPAaqJoz80fCmIAeCELyaFfN4zJBgod+Arb0juFfiv86nfAb+P8OH0xdw1z6U49hD4Mb3MyBmVMY45cnXZJ9X0Lv34zsnI0sJO+g1yShaRY3j4qaK3ceRDuA18L4Fu57e7MdRO+SU5APgBDlp7dSi6eO8tWy+rJ3WW9pe5176rMgCt8i8Jwkks8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 751a86e6-0397-4baf-5436-08dda20d0ded
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 19:38:31.0365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqwRtPnI5qNO9d/DUVIveoXP0vNhZbsjTYrmkW9waVEGK9joji2XKD7XkVYnloHa+mup/PRLqkB3EC58XcpGrlod9IPqV9yLFMj7YErVADU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5911
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_07,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506020162
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=683dfdc4 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=umtdIHwpr-1YpGr_MV4A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207
X-Proofpoint-GUID: R1L4PoCM6aP6m5k7nby6_XlGmh0K41gq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDE2MiBTYWx0ZWRfX6IV2LEIZwWX6 Z5m9Rs/SoQOc3USdHoGKJE9xEMHewJ14ozg+aesqGxWloXYAQhOf6eneAEJXMVdO/YF2gZJqEXA 2JgEhhWQGpm7xRRNmOIZDhVk4VVldnA5HIiwDvu0uRUW2E0fujXYGD3N+oJrWXjkIbI/buTuszC
 oRxNQXBFrsFAED9avydHOdkJgoRKtQIDJY5MvBR8W7NXf+3BrvmIfKFgvsvS9Y8n29pWCDxqeLw k3H2IVhQbG3+YK8ifzggHX5ddiwQEdNWCqpagaKrYrY6HFxSIWY4LLqhDYcCvyWYaLqLafkjyfm bum5gHlMaBVG6TM6JGUVSLXKTTrqKqEnEQ1zzCT2MOzwZNWCwLEl4znGQxfKxWLbPzyvfqS9D7+
 HcM+ZZUEPZ179b989jd28ElmqoIN0WELAvY7HyqttjLq4j6otgb73pQPLzsEskvbPdrUvRSO
X-Proofpoint-ORIG-GUID: R1L4PoCM6aP6m5k7nby6_XlGmh0K41gq

On Mon, Jun 02, 2025 at 10:49:26AM -0700, SeongJae Park wrote:
> When unwinding race on -ERESTARTNOINTR handling of process_madvise(),
> madvise_lock() failure is ignored.  Check the failure and abort
> remaining works in the case.
>
> Fixes: 4000e3d0a367 ("mm/madvise: remove redundant mmap_lock operations from process_madvise()")
> Cc: stable@kernel.org
> Reported-by: Barry Song <21cnbao@gmail.com>
> Closes: https://lore.kernel.org/CAGsJ_4xJXXO0G+4BizhohSZ4yDteziPw43_uF8nPXPWxUVChzw@mail.gmail.com
> Signed-off-by: SeongJae Park <sj@kernel.org>

I said it in reply to Jann's ping to Andrew, but to repeat here - I don't think
this actually has any impact in reality for MADV_GUARD_INSTALL / REMOVE, since
those only require read locks, which causes madvise_lock() to always succeed.

However we shouldn't be ignore return values and so it is right we ostensibly
handle this (who knows what might change in future, etc.)

So:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/madvise.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 8433ac9b27e0..5f7a66a1617e 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1881,7 +1881,9 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>  			/* Drop and reacquire lock to unwind race. */
>  			madvise_finish_tlb(&madv_behavior);
>  			madvise_unlock(mm, behavior);
> -			madvise_lock(mm, behavior);
> +			ret = madvise_lock(mm, behavior);
> +			if (ret)
> +				goto out;
>  			madvise_init_tlb(&madv_behavior, mm);
>  			continue;
>  		}
> @@ -1892,6 +1894,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>  	madvise_finish_tlb(&madv_behavior);
>  	madvise_unlock(mm, behavior);
>
> +out:
>  	ret = (total_len - iov_iter_count(iter)) ? : ret;
>
>  	return ret;
>
> base-commit: d85ea9175e4147e15ff6e3c0e02c6c447ef473c8
> --
> 2.39.5

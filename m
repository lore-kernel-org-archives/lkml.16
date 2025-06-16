Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08981D54EE
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051404; cv=fail; b=lsIhCGFYYj0aYxJaiD+YKR5UVh7CKq2ljYgCvquXCPeZghK+Upc5MNEfaEH6x5uhOwYRj4eK8KyfwwqHn3kiKktbZCNcEuFNdmDpsiQ0DuxJHAuOMcClbQ63usmnZIcF6vVeVxsow7aAIWnBVSDY7bz3h4gxEx9eqArPV81RHHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051404; c=relaxed/simple;
	bh=wYH8lUQz1U+IstbKnPLIUG25qhzzf3r2rk6GI3KrQVI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lB2gbQImH1hZBQ7mmI7ob/vdrP4dBn2j04CEMtyl84Ck7OCRuz9Fq0Om6t7k7mT3dVNrvyoEn9VuGJQJCzGp8zDeEGWqDuwFNr5CgmhqmEdykI2xhoJ1ditysJME40/aQ8bBgsnQeVVdCLNHJqPZ3byM4wIeRlI9r99ECkWV6kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TO+Gw/kV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q5eyftMn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TO+Gw/kV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q5eyftMn"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNNDEK029207;
	Mon, 16 Jun 2025 05:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Kj3nDr1iasp/1BbvXitpPyRMblHVmINj0Yu24Jn6PVo=; b=
	TO+Gw/kV6pGM5vwF5oaffiSbbyxXGBA1+UMQWLVE8xzayGs+PDL+OUkz2KiS1AN/
	I9xsB6cF+NYv5JRk/5CBTNU0Mvp+S0+G22W0AlICw+tLW9dh4Sz9ijNFxmawQJVB
	OcYKb8Mr04nL+9SrllZ0OewIVZjLo/mULmIyf8dfisbNmpB8f3uWBq2+wPRcncMc
	agqB+poQfpbpiVBPrXZWHAY6CQFCruFQBRQg32JyDQJatCZU75pm7Og2S0apndqW
	97LBPNZQ/2yatpggDx0Vu3jKWotiBC+770D8aUGvY/kfUPwQ7s8SajJ1ocqNmJf8
	vi0+cORJVjile8wS9FTcmg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8r0v17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55G45IGM034394;
	Mon, 16 Jun 2025 05:22:43 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013038.outbound.protection.outlook.com [40.107.201.38])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh777cn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNDbXRgb7UvT9RvPnAa0FP/Ubtjy2qepxy4F7d2SQr07E9Hzjp3kO3qxCYb9FE312dKhYyCGQrlxv27idPXsLBdgRzVmA34OUCU0vXo3eYvXMb1EOfB/a21rYZGnkZERa6+TFADDwETmYozJRKKI385mQyWzKKhu15mXK0ZTXmJMYndhd9CHdDeepyLqFnpKodH7PIYwLkn7DRJrXZRdTKUWV5VMgHk+GKjGDhBdcd6LPNylChARrcrFwcoWOMI0xh1NOiAxQC/GqYwtnfLBybl+rWjiO1oVF2ZuGN3Pg65tKD8/08rFIbg4VpunYKJfACLKTZoTy24M1VF7D0JmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kj3nDr1iasp/1BbvXitpPyRMblHVmINj0Yu24Jn6PVo=;
 b=AiLR5j8m984mLStX7UrAABgF4IC/TdERv+FgOvADNniSHajs/NHBJVnEpbYgriYqodkdfbV1lB+xNzuVY5744A0AneHkAVxKAfyArQGrXu6VRPe0fgh8nypnGnr85nqJyznVhPjYHIL89uf66ncA1GvZsoBUiu9VQFMyljnMZqwzXKWkzxqadfiVpxqN39vfHBq4yGjhFXrJgKR+K+oerBkuH7/kFaWOKofDRA25UerJBh6SeyS7F61/DeQ4+OR8N+ZeBNx2jhmUXKBshP9mvcKL4g8dpTUDN63PkbFiFRrlNR+xVcNIeHUalJH5jqmRrK05qionZ451tfnQaFP1DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kj3nDr1iasp/1BbvXitpPyRMblHVmINj0Yu24Jn6PVo=;
 b=q5eyftMnnn0ZV6PyQQ4YBE8WwgtpDb9y00cghFcdmrKbJVxxuTzS6OfjYJUnS56F3zlC9wsNlRfMvIH406MVT0pXcnub1V3ow0CksKg3Ub9YVpcqiUORdgKrKx4sKnjPpiQTJVm52h3dHB2xFawSRx5Hxp7lvWd8y+v0ovi50G0=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SA1PR10MB6389.namprd10.prod.outlook.com (2603:10b6:806:255::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 05:22:40 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8678.028; Mon, 16 Jun 2025
 05:22:40 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, ankur.a.arora@oracle.com
Subject: [PATCH v4 07/13] perf bench mem: Allow chunking on a memory region
Date: Sun, 15 Jun 2025 22:22:17 -0700
Message-Id: <20250616052223.723982-8-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250616052223.723982-1-ankur.a.arora@oracle.com>
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR06CA0025.namprd06.prod.outlook.com
 (2603:10b6:303:2a::30) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SA1PR10MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 964d3084-df68-4ec3-7bd5-08ddac95d089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dm8AvX16bearaYeDNaqVpAvLjxBR2KMfc1tgbZSEGv2vC2YzljK7EL7r/gah?=
 =?us-ascii?Q?arvwiaYqzSU07z1Gz2/NATjCvWIXud5/Q6gV/sm7hAUOuc1ZN8IwMqQ7CuOv?=
 =?us-ascii?Q?c3a1V1T/RIer+8qk8DEWFnXYInLlrQbni/R6+dLwZUxvAXUx5E6Yp7ToJrLZ?=
 =?us-ascii?Q?WDfp9P+X74HcVCzqbEkc3lF8PHtSdde61UCoyMD/wJfD1MEuHvW+t7hL9Ltn?=
 =?us-ascii?Q?uJIvkypBuk5gFDZfDrTh3vcTxaaLyPlwCg10zwi83H/77RGidmli/3UREQAR?=
 =?us-ascii?Q?inZfReZ4i8jR3S2iu2QHESsX3xPwI7DWhi9Tcv83iZh/C/8BD2MbIM1Kl1jA?=
 =?us-ascii?Q?FnWdFyrpZeCkpJak5GUnqSP+kpGzmJk0Piwlk7fMUiEyCuyQTdwvzQwcpNep?=
 =?us-ascii?Q?QfCcnu9wcB/X9GyZnIKx8Ij/0OXixSY3Up6+yjZf6pryvs33JmzebyCaH1aO?=
 =?us-ascii?Q?XrosymzxxlcWpPANsGDGNtbDlAER9dSynI9zOuEjjuIlLyUiMVIZJSuLFQ2X?=
 =?us-ascii?Q?NZnQssve2dvV6xg0OyWk5aJ8k4DvoCpdsX3SJOzWhNUbdK3cop4x1ttDk9b0?=
 =?us-ascii?Q?j7BMLf6tqxaYoMj01ixL4xr7gvK9D9wDoVyAHoJQblsxH7xJE2NjKpXUzLSn?=
 =?us-ascii?Q?Eyw9+Ke56ZaffADZS3/dCEswlrVn3jgldD363xCs8n28Wvm/Cf0XDSHtcqd7?=
 =?us-ascii?Q?RpNReSwKXJ74u8CQ/rFfYgZ5bSnZBJ6kX4rq0580yF9Mso+jVYXcMF1w2uCg?=
 =?us-ascii?Q?tXYUqAyWnUUHeS2KjShnLPqz1DretHWspKeqawuuVJicuRxEQuU0DcmEyEjV?=
 =?us-ascii?Q?a9oQBwQRL2jDhXSdCtZILCQfzHfBDBPUNeVWW98nl6Et3lSsRwjaq/8BbgBc?=
 =?us-ascii?Q?s48YlX7MsmvFcxI4Ignt6RBNVJD5jFGk7cSw29jucJNbL77wNndUy4hYcz/k?=
 =?us-ascii?Q?RyJvZRRL6zGbauWNiwXf4njZd9kurWqfgwrMbGfrPacuCWZdyP0iT5gUjV0L?=
 =?us-ascii?Q?Y2H7qaUTPBLjklY+ZhsD78V6rPPZs0zgSHrLPyYl/Ga21lYTe/ZV65D2pKJD?=
 =?us-ascii?Q?I2TrZqjtBz8RB+msinGCfjnRxUQAN+6e8ZHVWMtsTyXMescSLqg7f5D3MjMQ?=
 =?us-ascii?Q?CnRdUGkwJLC2fflm5+Mprwjy4ZPL/2LBFGb6ptX/DgDh4F7jhvLHEmGfJi1u?=
 =?us-ascii?Q?wkPrR2VmyvtNviXn533+R4VNKDEVPzsY3ZBbY1zFEjZysDFzBZZ0hC5V3GRa?=
 =?us-ascii?Q?cxKAsLwrZ0KnBMiqyAD1ekNB5Sf1AsPIbCbx45epeIdYMkKcqodzEKjieet7?=
 =?us-ascii?Q?yEgi/v1E68xKC1acF+IeeTeIn8S9dgn80cN6pr83VKEs69vx0Q2Q+aEFelqI?=
 =?us-ascii?Q?1A/3st0PCXlNUllhLxIt7SdCx8MQNm2qCRzN/ABUIJ6CoxGjJQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f99YXOMmBpZ85bWy2RvdNvXVp/pwl54ES6AJRwQ4lcEXFXGGP8Lj0EvR7vsc?=
 =?us-ascii?Q?+lUkMDz97wFkAmx8oV0sz/NkeG24LVbPd+oKWOWXZFu8jhbdXFiNofqRJf30?=
 =?us-ascii?Q?BqrOOUmd03BTrH21i0C/elxZr5NusKdOsOZn0pRyg/AtAqOhdhjAgAz6Av6P?=
 =?us-ascii?Q?UKLGkNMGZwkaFSqX27BwxJg+SQmO/y6WcsxFu588yXfcN6n5F0qMo2bJa+L7?=
 =?us-ascii?Q?3a+jTDsoMNQWR/2CkyMoCCmP9nAyzqh76SvujvHUjVVPdpmt01chRPuRwidn?=
 =?us-ascii?Q?fo+L1KTv/30j5Ylxf+ODtQTcI3HcTMcSU82VBzXWaQCIuH0smnVtb1HCMfKc?=
 =?us-ascii?Q?7zamTdBF/Soy+bs0D5Qb/UkzCCi4YrZ26aOKxp4PHIf9xjV4n26HUuULTFWF?=
 =?us-ascii?Q?zHdOUafHjKyZ/KCEk3NPWCYNt273Ii/94KgtX6wz5wthFps3HzxTQlOjgiCF?=
 =?us-ascii?Q?BAm1sMIFo4UODyFXCmR0UveirwxqOOLfvfCjiMVVouwS0TzynK+MSQQdlh20?=
 =?us-ascii?Q?AM3+X8PREQZMdcD5CZC4oTebGz/CNUFnyyfXaR8tX/DILSm4uFrdbZ1htEe9?=
 =?us-ascii?Q?M8qczdgsCVtxVJNvPihJghGmgYNMZV27HyTwWiHKOYaZ0DAU7zWyutVaOoyt?=
 =?us-ascii?Q?Q4rTVOxyT49sjdlQnDyPfj3KU0hXI7FyHP3acVYj7HmrdHUs38mKdG/HPncM?=
 =?us-ascii?Q?uMORUmT/7w1GnePgEO/Ql3JHFmwzyZwlfQ2ppimEEIgx5CTcE8OV258n20Go?=
 =?us-ascii?Q?mvEgTxYX9j8U2HvhPhtInn/2uaGcBNfPy/TSjXvvWA+ZDYpqFxRvwQ+nL1Bj?=
 =?us-ascii?Q?HPgzzcsSvXCINjnLiyflJBooTN4AYkP6tdWgywGPwlURPwjlym4byVqmJtHC?=
 =?us-ascii?Q?JRqeEZdZjtmvpz2zwNrtIJhE2A2HR4+QqM+MPchab2AUKSVzWxIhCgBluCo8?=
 =?us-ascii?Q?P69Wxg6NSl+GdLsWIxRdsUcHmPReNE11ZGYWDWZYvaGr6L1nbRg9cDlQSYQ5?=
 =?us-ascii?Q?e7dyNveVWmj76kcbYTzUfxa4hUtEoWG3Xfpc56+C0LUA0jG5y6KpyohhbEJU?=
 =?us-ascii?Q?dmIhPaD3aLRE+pznqQ/drOtE4M0oVDO5s2jiMjYfVtw2oUJDZHob7bf28iQx?=
 =?us-ascii?Q?HCivPsqZXNR+Va3vJZn/ql7XEKHIEczzaVErbsYKRapZ2RmgWYuEuJXHc3/A?=
 =?us-ascii?Q?pDuzIZOGViQFyItql+BDHStKb42VboRBREtMUTlDcqRq6tVINhqcg1j4cZhw?=
 =?us-ascii?Q?xuhp25ehh8gDuJGccmoB3dNtq2kEUt+lZdvtWzaJjx8/0eJapr5T5US9utPA?=
 =?us-ascii?Q?VoETDAAvb6PsUi8LHmn095wi3Bv8hb6H3tfqJ2uOdYgVR1+F/tszeLkQT8SP?=
 =?us-ascii?Q?UNi4iTOXfIVo5n+Xk8jzBDYIE1HWkFA9yRgtCj8YMK4uKm8M9W9tUBFzDgia?=
 =?us-ascii?Q?JRcBTdA/dUTPS8cXb/2i3irCHhSA90k2Dw2J3dCheyvzU5ZyGt7JHiP51hKe?=
 =?us-ascii?Q?niARjQu+rxdkRZHSWQGx7NdNfoAPgDU5ftib//kZDBgTU11JoIrVZ/GUgM4F?=
 =?us-ascii?Q?RVYGzIDShNcQ29IwqZBN9v3y+u03TfiU8YuXz+THU2YmIkJBxziWhHH39r3i?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gbtcbSAcm61+HcC7CglSq5n6oHcB1MucuyHrf7h+sgw2dtzWWSyUFlpzIt3WsTc60jpBUdTsvsdYv8z1gb8y7xsILu9Xxl9JVbTkjOlnViIYxNPnV9MBgVjCFuwUrOT2ZpbYMT0rSJ7+so3Lp5eDDBOk5RIrlnIFNzpqj3jYCZW+7vZyVUTVXrix2r5v8IO1Vyy8IZUHctrM/ldXpU6LJwtD2rGLSXg/xW7EEzhoEPHSnuR3CpbhZ41hkJLvmtDM4eLKlYQ8YFVkzFJJq3hH/0HRhAFCvoQJ0AFzPd7Cw9ZW9ZN+wkEtQINJE2wE52VFF3o/Wj8wBrXPDF+Uv5hRdLPqftw/2pwmsPr7/i+RxrIn65nHYEiuELfNQseg9109m9AGEihDzFZJ01xR23RKE8+88/BvQ0J3It0vh4h+IABT1m2CCbnUFs537Te6P6zzAXsewWaARg33zTwZDP29EtY+Qp4BKvCeR2duRLwViuAEUEbiOieiRSGEFfuO/OC43iqqGChduz0/hLLiudstQ84N3R+JJiZsodgw+fs27uYHxm876a03uU1eJ5gHefYFt8xj3oJMq1nF7DZBdaXsNVGE5WgQONl0JpvjdaKMZ/Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 964d3084-df68-4ec3-7bd5-08ddac95d089
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:22:40.6319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pM0SBJw1xVxz53Bj0OSJQ+GvgbBv/KmR2Wz8YbF/3LCRfGBcaWx+cSt7AyyKWLrB5e6g7b9EtSVuKCw3RFM1wwO1cwHeYLRRwTG3PcB4f4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6389
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160033
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzMyBTYWx0ZWRfX0PXlQfYvrIJI FPcoklUzKbprHDDaBohyXeykhDZ8vYF9/HHsqBOPQ5AHyw/3gDbBmDsjZhn5dhY8+ShjzC8g5Py bZlxz0I1XWm1dDJYTd/aPdyIf8uGAQHkPxrp2KcaWXd7HdvX/h3p51GmUBJpqofycA+K8RJKTeh
 6f+HcBj/kQHZKExiK0qmhUc68JAPKbdfcTMEZacWGqatFJmuyAg6tgsF6xyPkO/N4CzOWW1TWXg zDdv259El9FEVTHuxmnl+tpQ9nIpGCFHeu0RboA8X2h0bs/6j7pJVDtG8kbldqySxfHQmD4rK/m x9BiWIP9ezu3+ThlRjFgZPqDvf1hZX0q4kn4baEp6V0bsyMZ5883SAAPeSpSQnNt6kdIcOAGg2v
 mmQ4MUbbofRCkpSOT6zVpvQMWr6wKrf3CgXL+GdNeTKYiuVwNRlZefw34R5CJ7vbwZzvqQm4
X-Proofpoint-GUID: tx4k9s1uUPgWhPQNefTnl0SMQmkFWnNU
X-Proofpoint-ORIG-GUID: tx4k9s1uUPgWhPQNefTnl0SMQmkFWnNU
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=684faa24 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=j3Oc6Xy6ULSXj8zZAogA:9

There can be a significant gap in memset/memcpy performance depending
on the size of the region being operated on.

With chunk-size=4kb:

  $ echo madvise > /sys/kernel/mm/transparent_hugepage/enabled

  $ perf bench mem memset -p 4kb -k 4kb -s 4gb -l 10 -f x86-64-stosq
  # Running 'mem/memset' benchmark:
  # function 'x86-64-stosq' (movsq-based memset() in arch/x86/lib/memset_64.S)
  # Copying 4gb bytes ...

      13.011655 GB/sec

With chunk-size=1gb:

  $ echo madvise > /sys/kernel/mm/transparent_hugepage/enabled

  $ perf bench mem memset -p 4kb -k 1gb -s 4gb -l 10 -f x86-64-stosq
  # Running 'mem/memset' benchmark:
  # function 'x86-64-stosq' (movsq-based memset() in arch/x86/lib/memset_64.S)
  # Copying 4gb bytes ...

      21.936355 GB/sec

So, allow the user to specify the chunk-size.

The default value is identical to the total size of the region, which
preserves current behaviour.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 tools/perf/bench/mem-functions.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tools/perf/bench/mem-functions.c b/tools/perf/bench/mem-functions.c
index e4d713587d45..412d18f2cb2e 100644
--- a/tools/perf/bench/mem-functions.c
+++ b/tools/perf/bench/mem-functions.c
@@ -36,6 +36,7 @@
 static const char	*size_str	= "1MB";
 static const char	*function_str	= "all";
 static const char	*page_size_str	= "4KB";
+static const char	*chunk_size_str	= "0";
 static unsigned int	nr_loops	= 1;
 static bool		use_cycles;
 static int		cycles_fd;
@@ -49,6 +50,10 @@ static const struct option options[] = {
 		    "Specify page-size for mapping memory buffers. "
 		    "Available sizes: 4KB, 2MB, 1GB (case insensitive)"),
 
+	OPT_STRING('k', "chunk", &chunk_size_str, "0",
+		    "Specify the chunk-size for each invocation. "
+		    "Available units: B, KB, MB, GB and TB (case insensitive)"),
+
 	OPT_STRING('f', "function", &function_str, "all",
 		    "Specify the function to run, \"all\" runs all available functions, \"help\" lists them"),
 
@@ -69,6 +74,7 @@ union bench_clock {
 struct bench_params {
 	size_t		size;
 	size_t		size_total;
+	size_t		chunk_size;
 	unsigned int	nr_loops;
 	unsigned int	page_shift;
 };
@@ -242,6 +248,14 @@ static int bench_mem_common(int argc, const char **argv, struct bench_mem_info *
 	}
 	p.size_total = (size_t)p.size * p.nr_loops;
 
+	p.chunk_size = (size_t)perf_atoll((char *)chunk_size_str);
+	if ((s64)p.chunk_size < 0 || (s64)p.chunk_size > (s64)p.size) {
+		fprintf(stderr, "Invalid chunk_size:%s\n", chunk_size_str);
+		return 1;
+	}
+	if (!p.chunk_size)
+		p.chunk_size = p.size;
+
 	page_size = (unsigned int)perf_atoll((char *)page_size_str);
 	if (page_size != (1 << PAGE_SHIFT_4KB) &&
 	    page_size != (1 << PAGE_SHIFT_2MB) &&
@@ -299,7 +313,8 @@ static int do_memcpy(const struct function *r, struct bench_params *p,
 
 	clock_get(&start);
 	for (unsigned int i = 0; i < p->nr_loops; ++i)
-		fn(dst, src, p->size);
+		for (size_t off = 0; off < p->size; off += p->chunk_size)
+			fn(dst + off, src + off, min(p->chunk_size, p->size - off));
 	clock_get(&end);
 
 	*rt = clock_diff(&start, &end);
@@ -401,7 +416,8 @@ static int do_memset(const struct function *r, struct bench_params *p,
 
 	clock_get(&start);
 	for (unsigned int i = 0; i < p->nr_loops; ++i)
-		fn(dst, i, p->size);
+		for (size_t off = 0; off < p->size; off += p->chunk_size)
+			fn(dst + off, i, min(p->chunk_size, p->size - off));
 	clock_get(&end);
 
 	*rt = clock_diff(&start, &end);
-- 
2.31.1


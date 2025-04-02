Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F2223496B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 10:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743589351; cv=fail; b=dxOUBoOcJH61w3orxpSaMzJs8QGlgGqtMIQWMFRhpIoV5a7cfZ8BKfWj3FD9ZEpzDZRjI6Sbj9Oh5byJyAsFnl5vfws0GG7CYP0kyd/1/V9f75tMWLZxzwFCF6TDlZOk0Fol0RNUTbRHGuOwzWfkz9nFAd9n9mowgnR8bmipgIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743589351; c=relaxed/simple;
	bh=br4Kxuw2A3kHUPuEIQ+ZKbhacNhHrh2yjJxUsNnyWj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nlkuxyJAWsvY1KlVsFjgaDJ2TaB0Jcpn64ibBbUawgKyKF9MNcjTQzsboDBQL4aZctfFHUUqZg4u2ofIGAqRa5hR6xuuF/ZyuI1fSsgZfXFc6AoeFBMJ9olfIg9Z5r3Mmhs7WxI/CHcgSUQciKLmEMKGbQAlH6kDnpZdtdojmc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TfL/G8Hf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=crEYRkMl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TfL/G8Hf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="crEYRkMl"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5326gKwh013085;
	Wed, 2 Apr 2025 10:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=q5waBX7dzScsYFEOrd
	fosFLVlL/skSCx59ixsYP1uro=; b=TfL/G8HfUIHRVzXFBOgsY0tfbDl1xB6pLi
	MW7J3mD/g788MMqQeCHtzjIv3jNl/XCvTxZZm/WDMR/bvFMx8BTvs/sy7HgjA93I
	XQLRNghHobVyvHwj6QuAWgj30WOl91fYl9H6mKgCWOkP3qM4ptq4K9gqgcYT3HqW
	MU+EOI92JxmH0QQnSemmZic4P2NVpWqJoxOLlyKm4xYniR4wsllT5NrO9gIWdiCP
	y/90bp+T+J37CB03HsnWXclxE4sMRViAvKhr18SHJvAjUPQsiAKpelQ4LO/CPV/z
	FLDKags/yY+/pUgrpIhlbEl4tC6m+RgkkgCvsJd/MmUdAdgsIyHw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7sat4fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 10:22:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5328PdJx033565;
	Wed, 2 Apr 2025 10:22:16 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7aanrtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 10:22:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxw94gLm+O+1QjyRDIe7cBY94rVK8QUIsUoCQPS9gdXv5rHLuh+HiVzXDKeAcoxcZqwGLOy+MmIg6ft9tslozczT1qtS0I0+T9T8W3a02ptNa2W7rXp8KzXKRIk3wfUsVSmZ/XZ/QtsXuvIt5PUqCmMwhpyZgyGUbnhL4beGyjuFlH6WKutgZPglYTRevsBI5UFlYlzuVhOGJhi1KwLc/sqOT6aLVsNcM7TyDShj99UsAu8lnYkqiPai+dvZUFmXHwK0i0A+AoRqRB93zGtnSQBHXnlcES2b+k5uyi0fzSNNmzhe23fo2NXGwYaCM5nt2gOvbltS5ZL7e/K7iyUGDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5waBX7dzScsYFEOrdfosFLVlL/skSCx59ixsYP1uro=;
 b=Q8G2tLZCjmNVxnDtvM94SAa0mLNFEaGw8CzWJtQTb1PtYCcBAXXYOy98xAfGxaow7dZ0bFj5z9oHkan5B56IV6sZqyMSQ1KzoGKFPtIiNa8KAa6n/EXWGtaOd3P2KRIGA8CySUMC6QV58Ttz1w65c8SViXQ1OqPtkDhVg6GDJOH8NutsDmRTtdx05m2pu7Y1BjjrgS8/xAk8z4KlrEsl2Hq9hVWGFOiUmle/yY0hiBziW8HjlUfSrThnOIfgcPwZdae0sXlSC++UxbxSPHe9nvTEbVmIHrF+Zmbmc/d+PlMWKP6NfVW1/Tw3ovjHmYaikbboaFivhq1D00eilic0iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5waBX7dzScsYFEOrdfosFLVlL/skSCx59ixsYP1uro=;
 b=crEYRkMlQ1OnkcScucx9YAO2sQTT/zyzSbCBB4Xc4WDaLkekc/TSSKxX+71IUQUeMXa2Xfg4zEWVaPHDb7XfQZqu1ceuneCl7xDq1vrhYAnpHqpbRYvBztZu1hw0MAo3dl+WZh7LLAV6dbEpbOx46G3RQMPJQFFb54KP+qV8R+4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB4605.namprd10.prod.outlook.com (2603:10b6:a03:2d9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Wed, 2 Apr
 2025 10:22:14 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 10:22:14 +0000
Date: Wed, 2 Apr 2025 11:22:11 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+e3385f43b2897a19be24@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, jannh@google.com, liam.howlett@oracle.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] general protection fault in sys_mremap
Message-ID: <b648feeb-d33d-4476-bdac-1d1a28eb72a1@lucifer.local>
References: <5598853a-8f04-4bcc-8e45-984bd8556372@lucifer.local>
 <67ed0f54.050a0220.297a31.0018.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67ed0f54.050a0220.297a31.0018.GAE@google.com>
X-ClientProxiedBy: LO4P123CA0065.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB4605:EE_
X-MS-Office365-Filtering-Correlation-Id: 8562a2ba-66ca-4004-ab21-08dd71d03c92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gpg6IW8l1ynva/73g3y9iSbAb7kqD+LfYyQRVG5VOVYzrpDqXUkWnXcAfQuT?=
 =?us-ascii?Q?H5Za4ftk7D531NwDdZF3YCx3RdFGrNHlrA7hEnqx6gR4TAZuMOZXak3e46fJ?=
 =?us-ascii?Q?0fJJQaWDPYYxOW8Ty+f3lbwkaGp/uxSYD1iq4xrb8Lw0ufYDa0KY+VBLzK5u?=
 =?us-ascii?Q?tvJV3Il8pXFU5tebL2IjOeyZC8VCdcZO6PFn7dtJHsJgvEOsbvVdTvh+szwY?=
 =?us-ascii?Q?ldvKfRw9xbCT/gKYBqePfqednc6FSxZRS3djGvOHNb+DFMFXq5SIZj5XPORF?=
 =?us-ascii?Q?6CyN155s/uChEySco37t9QwkY3MwN4TTsuGuQ4DJsan+YYssxNUAbw/uBjUa?=
 =?us-ascii?Q?3UeL1r2xh9MzOthy/TR3SYrJS9s7/2ibX14Q7mNsoAi+ka5zrs+cqbBZkKSi?=
 =?us-ascii?Q?yp1j0jLQFjBd7qJvNtdij3qORczLbvPomXbv3VpBZJ0ddWRvX8vBLh11KX+U?=
 =?us-ascii?Q?wcYL+LXWlpKgUBNEyZIfkBn0W6GTbVXlWzd55x7+1qf7ORp78ZX67P3CQZsK?=
 =?us-ascii?Q?SzS2tnCRtjUHUbfsY+C7pa8GJdnWPcoxd8xWel2TrjRUIw5t2vR+ay+P1kn3?=
 =?us-ascii?Q?DArjBgVNi4Zcp3+2Smy+6sIZcK39JeAkye89DOoIuvgTEpDwl94rlh5g1o13?=
 =?us-ascii?Q?mhoYwEuODjaAyc7bGile3/nEF+qhumkUOHqAey9iCKkrRd/9nmOC0IdNmMm5?=
 =?us-ascii?Q?Ig6A7Zw7zJgdI/MEkq9cW2Ghvc08UYPBPadbVQwlKrAAwRjS3sCwijIgMzOk?=
 =?us-ascii?Q?Ja+HaRxVp+hd8o+mH9fdsyWK6rN3MwclNblQPAmkRO276gVPCDnLFjqUbRBq?=
 =?us-ascii?Q?gJOd9cDCtiYRnlose4ESqO/aix/nPpBNUojU0NhcIl9q0mtlyT7H79O0ewy4?=
 =?us-ascii?Q?DiG4pPP+mo40FJ6XIIKsT2ycLqou46ylKRPxeMPl7+0acU+Waer2JMrqroOj?=
 =?us-ascii?Q?Qn/thD+y3Iso7VqQcLr5UQ5/How3FafW68WM8lVI2OOtr54OJBs/ZeW4TuhZ?=
 =?us-ascii?Q?Xx6JFUKfwU1zzpjRXilpkisgtf1mPS+ivEdREq3qdwhhj75F4qPb5SsjPJE+?=
 =?us-ascii?Q?nu8xuJPeVtVmLgR/Q7h2vfOsQOAlViClocP6LhIIpLmpJ+Xa2igA/qWd83Fq?=
 =?us-ascii?Q?p3AdQ7xJMpdAhZ2euE9z8sOZMS00srEKKPlG9Aynr7dn/LFt1wpi+KvFYYEx?=
 =?us-ascii?Q?mdekrHYv8ng9gyjtSpjPee7Ab19e/qThbGWZFba+ALZcz9ZLvrlGKn4+HTD/?=
 =?us-ascii?Q?qlurDwcJqrP640zTHf9H45y7SaR8jqnt5W7WIHEW7dG+YYydZ00HIbHOFLvn?=
 =?us-ascii?Q?NPuhnfkFxWJQ8hYL7WGlSNDM0Rr0XxIh8O7qR3zS7LG2hfTP2H1n2HfFwqVT?=
 =?us-ascii?Q?IEqXs1M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pqj5oeSC5OSmbKrUhlTgVQjZUeyWCjSD2EPoCBm3qux3qpaylZ0kxB6I2KM7?=
 =?us-ascii?Q?QlPJd7kR8Je3v6kkHmyl2csSXl+uagC2v5bAzHPEfHnAj8aRvm3Z5ztH6oNC?=
 =?us-ascii?Q?zhF3c/8FV/VI5cBPpKSrfXMZU5039Q8hBvlNSBey79Zp1U+tbm1Popm5AvLP?=
 =?us-ascii?Q?Nb1dYIBEhPDs0uFOMYCcSIOWhRNtrFgp759Fj/tyqYaQ/TENizjy789XCY4K?=
 =?us-ascii?Q?YzIRY2gIN5vwNULh/UqerS21j4Js8amctqoxA7CWm2A9IiATZXy5UYerj6wh?=
 =?us-ascii?Q?2fPo9c8kXl9CAY1a9u/8Wu1azpGRSafDsyDlyu4wwfPisfaPa2Y2zz9kYNmm?=
 =?us-ascii?Q?+HKxV14ccfiDc6GkDcTyj9RIVN4TrbXaxl1SzhbkKenSZxchbAjSL8YMxNz1?=
 =?us-ascii?Q?sHkNZQE4AroTUtjqMlAChSBDNaDJ8ztN382rviwn9jEB7HK4S4DGDYGBSbsy?=
 =?us-ascii?Q?+BgYFOONkSszPnIBgI2qJydlgCsDRhXZlV1xkmBXsrRaav1MrtpGjaO9rASV?=
 =?us-ascii?Q?m8KKlaD8lU3Vs7HNSjRcJRHKk8zp49HIh/UwErRNhlVdfxoahNoXHGF/fOoZ?=
 =?us-ascii?Q?PYucjt+pyG3SunP0EFyKbn2/aXTvtnhyOMF7CTpUfN/yB5WtwYfQ9QZA42mD?=
 =?us-ascii?Q?ZQ8afQiZQxMsUDj/TDiVb6IJ70yUcDGOillNSPAwsNbLE8ittg2K+VNkFST9?=
 =?us-ascii?Q?lhvRQP/RLZzlt3WLjdcsU94fCwCktjkn+QJve5uOunt1K/zNujbteOaY1OkX?=
 =?us-ascii?Q?6VyGFxDLOK1uNZ+elCF2hAodOhRFDRoviVugDpwhCmuP7+ZIxoJ5qx+1b6md?=
 =?us-ascii?Q?lclCj97mDSQKy1/eNiQeq3q/lELisUDWYAyy2iNjQBt4tQb4M/U486SrHOSN?=
 =?us-ascii?Q?8RHY9jVQIn+m83UgXUBlYGttfb6RQy/gCZj337ezjAL+V1qsZd6v7mWk2SU2?=
 =?us-ascii?Q?lS1ylrLqP8JLTdLj95Dk6kh0/IRTqK3M7AQcwwKbx6nG5Fxi2+QTvJH7DZpp?=
 =?us-ascii?Q?nwkeeSr+k57K/z54pbpfFUJUa6Qc3qfY/MoRXlpbYlO8mLZYuXTtim6Z0r4s?=
 =?us-ascii?Q?y80pBqV2dMyK1fkQBak3s4K8cDMGMDZ1x1mQP2nHfBh1q/rPmWL0GX43UhHk?=
 =?us-ascii?Q?75TTZTFw13ZWBOUUoRUPR0+xF4xXe8UlmQiXyZJi4zyNmVtuY7G84YzaPbp1?=
 =?us-ascii?Q?PFC0VL1HTv+xm7Qeo0DC2YK1xp4/yl7cyTC//2KK9H9DpR1cE7FdOU1k7yIL?=
 =?us-ascii?Q?Hb1vQ/n//A495OI6OB60ShBwl4JFBdepZ3Gk/+tqgtUZ/kPDSc7lvNBrYcjJ?=
 =?us-ascii?Q?hIESWZ4tPPtG0qlosBZUY3OvgFIe40AZBiHrNg9qHEe+kLgPHr2pRg/14fLG?=
 =?us-ascii?Q?u48s5TIiNl0E2PbdaFe4lLXp9EwRPA4hL8jwAllyxdEW/jaZ93klc6F0AEYS?=
 =?us-ascii?Q?cwxKcfVWpoJUmLSvqpOOZQDS8miCPqKu7ReuQaZU6ZB2rTKaAalppP6nz5dK?=
 =?us-ascii?Q?CF67aQmGJXrn72UAuQ4aOS1jz0VQyTNRabrh9I1mj4xLqjIbI+WY3t1a7n/9?=
 =?us-ascii?Q?RcqdF/bbMschjm2SKBgf7iaLThiw957epGuVyPqz4/dYKsIjKQDUyjjRbpHp?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	icWaJn8LPRgSSFGIo/XOChUuuM0y1lVCCsFmK9iIUx3eCchwM2Wh428xXb7L388jcp+tKBPYZzQFFZPhJ5xQwT2rekZxVJO79b4nbto9cR81DrjVYfGqRyEJ4P3s82OH7rlje4Nmj3z8awDh3dpO/Xg7/9B/3gn7JFXX1xAh2hfwPnNkJNSaDwHFdoxyL7GInF6+KvY1NquHO7vA0acR+CNpXJ75WKR0JoN9cddDHVa2CYDDp1qS/itBmYWv0FArakPVsjoEaakCxKH0qfhXAZMS2ezqgYIK+ojXXJ1LNZrpKAwANr/p7f9kmosHDOhPXaxKC2eEZGLUrhJuoKpmN3i6OcB3jPme7NRDyQfKB0L/ayEGbzD1HavfxxZP7X8qeuZ2QSjgm5lbTXnZJGqTxCe4mUX81u+4kxbWc0NyzyPT5LN4p4VOr0D/WiRRhJweHbuOPeQr6+tdazGoJoQapUK4YPEgs/Q1pNwiNNNr2ibxCJdNHjcOMoUXtaEXh6Za7A5KAQrPx722uzR8YP14zz9LzN/Hi2vbEFOs2yWwE69n+5AJHRRuY8l5PTEYE/zVskGRRVdyFTjUSBrZ3tGMcTgdT7+dzQitTWp9+8qbG7s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8562a2ba-66ca-4004-ab21-08dd71d03c92
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 10:22:14.1509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbIjyTZXOvZkKkOYaJYZPq63hRhKCel7IS4CtqGnWfPxWpdeELs8yIHuF2UYFMre1kSbjhwlBAV7Iu8hQeIgkjfqOHWd8gKVforBUS+IZgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4605
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_04,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxlogscore=987 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504020065
X-Proofpoint-GUID: W9M__4x7jD6G-d-78hmrfh_g5oZ0eFUi
X-Proofpoint-ORIG-GUID: W9M__4x7jD6G-d-78hmrfh_g5oZ0eFUi

On Wed, Apr 02, 2025 at 03:20:04AM -0700, syzbot wrote:
> > Hi,
> >
> > This is already addressed in
> > https://lore.kernel.org/linux-mm/b2fb6b9c-376d-4e9b-905e-26d847fd3865@lucifer.local/
> > this just doesn't exist in -next/upstream yet.
> >
> > I _think_ we may be doing a 2nd PR for mm? But if not it'll be fixed in an
> > early rc.
> >
> > To make the point, friendly bot - let's have you try out the fix:
> >
> > #syz test: git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-stable
>
> "git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/" does not look like a valid git repo address.

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-stable
>
> >
> > Thanks, Lorenzo
> >
> > On Wed, Apr 02, 2025 at 03:01:20AM -0700, syzbot wrote:
> >> syzbot has found a reproducer for the following issue on:
> >>
> >> HEAD commit:    acc4d5ff0b61 Merge tag 'net-6.15-rc0' of git://git.kernel...
> >> git tree:       upstream
> >> console+strace: https://syzkaller.appspot.com/x/log.txt?x=16719404580000
> >> kernel config:  https://syzkaller.appspot.com/x/.config?x=24f9c4330e7c0609
> >> dashboard link: https://syzkaller.appspot.com/bug?extid=e3385f43b2897a19be24
> >> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> >> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=175a4fb0580000
> >> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1687b7b0580000
> >>
> >> Downloadable assets:
> >> disk image: https://storage.googleapis.com/syzbot-assets/e4bfa652b34a/disk-acc4d5ff.raw.xz
> >> vmlinux: https://storage.googleapis.com/syzbot-assets/3d19beb8bb92/vmlinux-acc4d5ff.xz
> >> kernel image: https://storage.googleapis.com/syzbot-assets/e7298ccc6331/bzImage-acc4d5ff.xz
> >>
> >> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> >> Reported-by: syzbot+e3385f43b2897a19be24@syzkaller.appspotmail.com
> >>
> >> Oops: general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] SMP KASAN PTI
> >> KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
> >> CPU: 0 UID: 0 PID: 5840 Comm: syz-executor163 Not tainted 6.14.0-syzkaller-12456-gacc4d5ff0b61 #0 PREEMPT(full)
> >> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> >> RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
> >> RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
> >> RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
> >> RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
> >> RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
> >> RIP: 0010:__do_sys_mremap mm/mremap.c:1784 [inline]
> >> RIP: 0010:__se_sys_mremap+0x25fa/0x2c00 mm/mremap.c:1752
> >> Code: c0 0f 85 0e 05 00 00 0f b6 9c 24 20 03 00 00 31 ff 89 de e8 d8 0d ab ff 85 db 0f 84 7b 01 00 00 e8 cb 0a ab ff e9 9e 00 00 00 <80> 78 04 00 74 0a bf 20 00 00 00 e8 26 2f 15 00 4c 8b 34 25 20 00
> >> RSP: 0018:ffffc900040cfb40 EFLAGS: 00010246
> >> RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 1ffff92000819fca
> >> RDX: 0000000000000000 RSI: 0000000010000000 RDI: 0000000000000000
> >> RBP: ffffc900040cff00 R08: ffffffff821d1f24 R09: ffffffff8c271397
> >> R10: 0000000000000004 R11: ffff888034658000 R12: 0000200000000000
> >> R13: ffff888077fac000 R14: 00000000180000fa R15: ffffc900040cfcd0
> >> FS:  0000555571cf3380(0000) GS:ffff888124f99000(0000) knlGS:0000000000000000
> >> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> CR2: 00002000000000c0 CR3: 00000000316de000 CR4: 00000000003526f0
> >> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> >> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> >> Call Trace:
> >>  <TASK>
> >>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> >>  do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
> >>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >> RIP: 0033:0x7f4480ba0369
> >> Code: 48 83 c4 28 c3 e8 37 17 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> >> RSP: 002b:00007fff6c642778 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
> >> RAX: ffffffffffffffda RBX: 0000200000000000 RCX: 00007f4480ba0369
> >> RDX: 0000000000004000 RSI: 0000000000001000 RDI: 0000200000000000
> >> RBP: 0000200000001000 R08: 0000200000001000 R09: 0000000000000000
> >> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
> >> R13: 00007fff6c642958 R14: 0000000000000001 R15: 0000000000000001
> >>  </TASK>
> >> Modules linked in:
> >> ---[ end trace 0000000000000000 ]---
> >> RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
> >> RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
> >> RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
> >> RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
> >> RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
> >> RIP: 0010:__do_sys_mremap mm/mremap.c:1784 [inline]
> >> RIP: 0010:__se_sys_mremap+0x25fa/0x2c00 mm/mremap.c:1752
> >> Code: c0 0f 85 0e 05 00 00 0f b6 9c 24 20 03 00 00 31 ff 89 de e8 d8 0d ab ff 85 db 0f 84 7b 01 00 00 e8 cb 0a ab ff e9 9e 00 00 00 <80> 78 04 00 74 0a bf 20 00 00 00 e8 26 2f 15 00 4c 8b 34 25 20 00
> >> RSP: 0018:ffffc900040cfb40 EFLAGS: 00010246
> >> RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 1ffff92000819fca
> >> RDX: 0000000000000000 RSI: 0000000010000000 RDI: 0000000000000000
> >> RBP: ffffc900040cff00 R08: ffffffff821d1f24 R09: ffffffff8c271397
> >> R10: 0000000000000004 R11: ffff888034658000 R12: 0000200000000000
> >> R13: ffff888077fac000 R14: 00000000180000fa R15: ffffc900040cfcd0
> >> FS:  0000555571cf3380(0000) GS:ffff888124f99000(0000) knlGS:0000000000000000
> >> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> CR2: 00002000000000c0 CR3: 00000000316de000 CR4: 00000000003526f0
> >> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> >> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> >> ----------------
> >> Code disassembly (best guess), 1 bytes skipped:
> >>    0:	0f 85 0e 05 00 00    	jne    0x514
> >>    6:	0f b6 9c 24 20 03 00 	movzbl 0x320(%rsp),%ebx
> >>    d:	00
> >>    e:	31 ff                	xor    %edi,%edi
> >>   10:	89 de                	mov    %ebx,%esi
> >>   12:	e8 d8 0d ab ff       	call   0xffab0def
> >>   17:	85 db                	test   %ebx,%ebx
> >>   19:	0f 84 7b 01 00 00    	je     0x19a
> >>   1f:	e8 cb 0a ab ff       	call   0xffab0aef
> >>   24:	e9 9e 00 00 00       	jmp    0xc7
> >> * 29:	80 78 04 00          	cmpb   $0x0,0x4(%rax) <-- trapping instruction
> >>   2d:	74 0a                	je     0x39
> >>   2f:	bf 20 00 00 00       	mov    $0x20,%edi
> >>   34:	e8 26 2f 15 00       	call   0x152f5f
> >>   39:	4c                   	rex.WR
> >>   3a:	8b                   	.byte 0x8b
> >>   3b:	34 25                	xor    $0x25,%al
> >>   3d:	20 00                	and    %al,(%rax)
> >>
> >>
> >> ---
> >> If you want syzbot to run the reproducer, reply with:
> >> #syz test: git://repo/address.git branch-or-commit-hash
> >> If you attach or paste a git patch, syzbot will apply it before testing.

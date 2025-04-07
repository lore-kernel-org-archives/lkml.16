Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF0A22FAD4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744020601; cv=fail; b=NjdZJWGcg+kyjZkgvQhs7rI1ofSjWrZ0F6/SXPKE7rpdx6xWosT/xhLvG4vfIgAuMEweCLfCZMBQLZcKXFOZJEFNoRz8BijsTzmXaX3YLX4CCwR3AP35WHfXAyibqR+gRq7amGrsCzfEZBUdKkPIVWWmgZT4JpexWioBafFKi9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744020601; c=relaxed/simple;
	bh=lP2/8KXFVl2AyEb0C7HHBq7QMweIm0LzPGbUfhC4yz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B1FZOXaEB09mEHaT88ZjPVzeHbVWqmMcK72dw3tB3tiRCX6Psp8zDIr8ywnvhwJsHOztICHBQmYguypRHB95CeCHg3u4IXkYOBvyKfqDiZhUPKf2H4kEcxY08ecQqveN6LWofOCpf/0uVGWKin7Lg6Uc6K7vE4m/DNudvqefDvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ei7KwXxT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sDyNQpQy; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ei7KwXxT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sDyNQpQy"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5376Y4SA027528;
	Mon, 7 Apr 2025 10:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=iPkAJJuCqHEXXfILp5
	au2lNj7MUrvYVzaw5pIFcPOC0=; b=Ei7KwXxT3Dx9LpZpar6vWNLHyuODcKplyV
	ysn9DOVS+mYNdlRDBknfmbzAVuEatMLxurRd5QXvTg98pPScIQbtm6H8C67bqT99
	1Num4ffyc+ZH5IDJ1Pio43R6ZCjDFjAkE5NfSwBIHom6BeelzLR3CH3phsOv5Uv3
	/W/S2i/uIQ1t1ehZ5dzS5YNc3N5PC+PrnCFsjQjSVWR08l0qL40VToGfZ1liRDR8
	ZVLxUxhQE8N3MLA6JMeuXbmDNeQBfMW0uahkYq0a8AAaur1FJJahdJGcPyAvzx5K
	z5gMlNcmOTGqarMD2tPsCearT2yeJdBlLnBRYPKsrO13pebG5rzA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tw2tj6u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 10:09:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53781u1Y016272;
	Mon, 7 Apr 2025 10:09:44 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45tty7jd7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 10:09:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJgUhgsbr/zJLsM1JG0wBT2Ywkn13Prl/kf/jHf88ntGS5xBarkI9VdRSCtzlRqtYOtf64oKhcuDwq2AKW4mBp0Dcqn3ctHiutTcQ/xTY64qEQDyKgOlsLUxc36//dXSLDsqWeZn0EfbSULDxmos985x7pTqVanVopcfgemIVEnpARoEi6ABV/GoLdLBnjXM7WEzHCChEjG1fji3RcYENqvvcQT2iUYChjpIlY/UvZsp/9hqd4T8KIgEtW72dFLRDnAshglVI9obUrcd0jHUOee8y2mkJV9DzTzjPANR/8n6JLfPqkzXNMx/vErrTqjjqbamuJCdgaWmKPnRAentPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPkAJJuCqHEXXfILp5au2lNj7MUrvYVzaw5pIFcPOC0=;
 b=KOwfWL8o07Y/30kL8gZb0Knds+VYe7lrjyUsKJy0HScPcCAwCn52+cH+YGwek6DNaqHW8bHDxYKvKy3RJP5ZeJo/0kU2ZClJb2gI3rJ6swIPw0CyTMZsimvk/YVXiDGYo4WWRvuuPIu8vfMX9GgDgUWBQ9i0uduSbPQwhM48m8ULXsERrNx7dAZUoqUAE+aTLtfT3Xyrk1IxiC7tXptBHGCBiHEZN8w96/eu4xF1e6jM7cLHYjnUyKREvXuYedx/euXRtsDQggChTpguNFoGq0Ix88bdqhS3ic/qa7dqT96r5rY21E+RSbEqiDfCSdhLmCK5NuWgIwZ0Qf+Yu05duA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPkAJJuCqHEXXfILp5au2lNj7MUrvYVzaw5pIFcPOC0=;
 b=sDyNQpQyICC1UcxKwg9VO1tp2XR0doEMBU6G5zgnj3bAQlyjwFJr+SixkRMT92KYNyEc7IiB9Vp7ODu/whmBqlZPjs1z7A/mJMe8b3Feuzr2ojTpiwn4x8SJYBbtNOm9K/OdVi3nUC/vlAdQ5p6mxmKXF2XFBMInN2U4lituRqU=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by SJ0PR10MB5598.namprd10.prod.outlook.com (2603:10b6:a03:3d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 10:09:41 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%3]) with mapi id 15.20.8606.027; Mon, 7 Apr 2025
 10:09:41 +0000
Date: Mon, 7 Apr 2025 11:09:36 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] general protection fault in mremap
Message-ID: <07a22812-4f5b-44e2-a4ce-ad0537934041@lucifer.local>
References: <67f1c7df.050a0220.0a13.0256.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67f1c7df.050a0220.0a13.0256.GAE@google.com>
X-ClientProxiedBy: LO4P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::11) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|SJ0PR10MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d186838-64c0-490c-08e8-08dd75bc4ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qzKjD3OZsHsoKg8nSz/NFDlHNXv556bDk5KUpni3S5mglSolQOxCKBSu5LTV?=
 =?us-ascii?Q?AQQbz84JavS0uIiFl42HieJ3wO+OuuI4YyPYiLpYe+vPybimdglnsgnmW0Q1?=
 =?us-ascii?Q?MZTWUf0TYJZCqjF35ZPL2saHewmegc6Gv3WC9etBp0ZuInaMQ7REKp5US+Ve?=
 =?us-ascii?Q?alME7SUaz1eB1vfPA1OY2uwUSSAnn8W3We6PgJpI+994zYP6Kskg/+aZ5rXx?=
 =?us-ascii?Q?AHj+lmORDmwI1osEYf3ezy3AtiARwOm6jL0gXAxAPmt6nWi7kaSMVH3AU1Iv?=
 =?us-ascii?Q?i4/AoQeFNQTw0Yqlsd807AawYsGjRf9B2dQa+RXNZ7FY0EG+PriyG9JxeSGW?=
 =?us-ascii?Q?XkhyVDxsp3yZ0QXrYOZ2ns3xeQpIKrvHzMj/4563Jf8iHqgR/nxZ/GtCBkCs?=
 =?us-ascii?Q?wWmejT1XStu3mbZRCrgBuu70CUMOidOghsDLXGp6og2w5rneIYFGnY8iW0XH?=
 =?us-ascii?Q?WWHqrK4bB1MwG1/v22cL7urZyX1hIyovqhm9E6Hz0TYXjdHbSmX170F/5dP2?=
 =?us-ascii?Q?Cq1I4MO3kyNf4PRZs6p8kEVMoNDOWCiqkMrrBoGoEo7WICwu1Nn7jOj7gtzF?=
 =?us-ascii?Q?a4Hmt0nkBxlnCTiZ1tqiomGlKUwdw3rZw9g7dcX8QFE+9KF95uYLIBAsxr9k?=
 =?us-ascii?Q?oaM6RwOjMWQM8hEw/iXZRXUgcbOnqO+VWBPchLFF7jCpLGkDI0Kr+rqJVNy7?=
 =?us-ascii?Q?Ou/oRrOCQysJLKKh4FEcWvnEUZHEBHetpnPyHbHICg1t7Pl6l2yCt34sF1y3?=
 =?us-ascii?Q?Fs2llHDymPZ4qM2sXE3mX97c6g6bXLG7zBgj8b817YjkxcrTaxGHyvEXFJ/1?=
 =?us-ascii?Q?l/MGVPVRENODyJdKwGKcCcv2NVEbSm33XPNFNUnqDN6DuT6E6XgRQQDYVn3m?=
 =?us-ascii?Q?KGTSEms5BKl/SZjFSdsXHexG8cNzGxYrgh/o7P/mmjGkjw2Wzf+3vCI7XRYM?=
 =?us-ascii?Q?bz7K3uKTxTZ9kRywqcrmt6NyNcYU1NUk/tkJNOxgFfip7nDnSnAmYQ9l2kO0?=
 =?us-ascii?Q?dM8di0tjkFBt+HzxMdFtz9WQbIcZaAMsqJwLh1eWC6wtXIR4CUNMuj+KSDYG?=
 =?us-ascii?Q?Bwy0qCRjIAnd7KyK57/3TfhbTcLg2XVkB+bjXrx+bWDVdQRkA1ahDOMYFv5L?=
 =?us-ascii?Q?vp2TbpMS2RVxP+7U3U5JkNGy9WQlNKryK1RfM+vQOSicgUbdKjenBlAawAEX?=
 =?us-ascii?Q?Qv/cSilEVxjP6xvccVkCRYjzw3+RisY16H3Tq+p9PDEejb/SzMqjRB1emooB?=
 =?us-ascii?Q?f8sueZpny7rT8BFjyJVhSo2Hdj3c4/vFpN3CSbCpA30WLRxpgKartbR3Wp7Z?=
 =?us-ascii?Q?4XkTUxc/pSGnm/K1y4oQJ5I9uzwMTVQaDoxrtfJJqWW5iw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HWRpk6oqw9IDqJeNWjLbIPuqSBjLaeMj3yh1BNDX0U0kggj8+nvRk35Jwmnu?=
 =?us-ascii?Q?9BddEvmldZp9fZaSWn2sxvPZMNU826L8V0GRlDHKMaiUDEW7jwWPS3OZt7sh?=
 =?us-ascii?Q?xch/CujQV14hNepVCLbm3pojiXCujeIACGzkQ0W11PN5CafhQaExClSZA1Ee?=
 =?us-ascii?Q?daPdXu5Izjj3aN+F/Du6boMf9ACZxpAqgc/lDtHLel/7k7rdAbm0vrJ8apXH?=
 =?us-ascii?Q?q2o7zI9KfXSndjSmQNgnT86nchxsjcDz366fAHo+2nj9dNb7dy/cahZW/Hvr?=
 =?us-ascii?Q?EmnfV3mAUElOYNhyuAT4icXofMfhJjCb1gn4yGDlDfPXsew4lUOs2ODZsQxa?=
 =?us-ascii?Q?JkqqjQC7adBxDpfqiiqneeqfnvrtabZhwPEQxUG5VILuzwMzMMCBO6O/a6UJ?=
 =?us-ascii?Q?3nMxKDChsTu+/iHLRDATOADZb3v1uBBmkkOHT5PWdVyM5/BACPwpldsKrnWj?=
 =?us-ascii?Q?hKwjCDBiFpxEqiCbI8klB+4t45IxMEKWf8PSAS3+YsUX2ezHX8K6vs/iLwMB?=
 =?us-ascii?Q?0/66KYJV4rViL1WDSg9qaGNmBwDY0H0wJmBz8YJdpNfRgBMkg1zBNBRc9IUp?=
 =?us-ascii?Q?G73t42kQ3PsqnOCF10FnCRNmmYt8JdPXJ1vG8xj5qUaf130Pgxyh+LyKdGlS?=
 =?us-ascii?Q?TI0Z7zTdldNxr+38UlqVyum3D1cqiM6+8nS4h1QrYgP4QDrto7vQT6jFZm0q?=
 =?us-ascii?Q?Tfcn38iV39QuL+dKsonFLzaEqXFFYwdGXOf6DkdlbNKunIdMiBJyMgcj8mag?=
 =?us-ascii?Q?UFwSLHGSR1aCxE2zNnVyTe6LkvPSneDCyLt8/ZUM9KU9SDYWKJ9lLvIyQ3cf?=
 =?us-ascii?Q?042WV+O274Edt+ojQ6q6LQxIDd9r3WNfRXAhE7MJYQMmTx7JlDAvxehcmh6I?=
 =?us-ascii?Q?9HSPHsnMH+I8gMO0OGX4TpQvTgkbUJjP/0Y5fEERKATCjZCuehVS/TkVmXkP?=
 =?us-ascii?Q?dImcerBBoxT886nL5aBXBJpPa9smrAEuDqAgS7W8KWC0+n5Aq1/Oqfls+nGV?=
 =?us-ascii?Q?BxgtTihKXAovYMGRI2Mu1STpctpeLEm9Z2/sBgPvr0wEH3hI/X1cgJ15wfVE?=
 =?us-ascii?Q?xpTCElICKaWAtZcVANYLN4OBijQTPOxLMGWL3P4bBW6pmmj89u+QgS3arR2/?=
 =?us-ascii?Q?6bX9SNnH0DuIdQaW478wA1kh8yXQaTkG6GTUUzZD/TzatYnusnM+jKlgx14T?=
 =?us-ascii?Q?8aWSsR4glG43Cw/KvtdquDHHD30PKdlK/c02+deDEG9QhRbLkzh9CNZ8zw2k?=
 =?us-ascii?Q?Y55F8xRWEgFLZq4dfxbjbdR7uo3m9gLRj9iLg9Ns2pZVMjV70aDwnMaANSHt?=
 =?us-ascii?Q?5sfA9domZ8ngrgjpLMoGJdDilVeV8JNQ9PvT6mx48/JW9tWp07I/MaGibdUp?=
 =?us-ascii?Q?GyIrAmE6+VTACc6MUA8o5wv0jhSKA7jmlNxuv0b3FXuC4SAzankap0KgOAOy?=
 =?us-ascii?Q?oVTYL5tURe4QMCIVz73lcSALluX3wVfRAwQuAfoDUpjUV1JW0UOzhkrVHVgR?=
 =?us-ascii?Q?dKxTNGm8zTqIYz6rtAc4umvXf/NVMt6eqAHJqag3ZLyNoyjwGnR7oa2U4soB?=
 =?us-ascii?Q?mOunYGqtYNtEtXfsuR8CRFOmA0WrVoIOobUj4MnqwdIZpp/yIPb0K5/dNFXs?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VB963yYRcrywBSq4knxmXQiL8frFQ3gjotrdRTO5/NH/xcXTevLmAaCLSAKOR64xy/fZQyrCpAbthtXxkhKRHgu1PJ8CQwi2PkiRDS+0WPEDDRsm5v2PBYQL7xgMBHdRhGuSjDT6l9/+wV8Vn7jSDJcA3TGR7wMVL1JF4TKJ9RjtncdDJWZyC6i2LNpJCNZL+g0e+Fb8nYO8LIQYEZWpEgMEXupXYk+c+lIwZGqf6FXI3ri5jBzH/DqZlVtzIKFlUU8dt3fZGNs9F0sIeoN5xok7MsW2sVy62clohMzPgcRR9gyKPhd7A1QnrGRhDU9c6E/Ko8jo1uW7bXujuUPIo2HTXzTyEIsoWsdJNJtxVVG7F4bYcGpPKMhRWmCQoUD49q/edDR8ly8DmFxJizlyyFug2WVOz1fJmjlDz05Cg4hZj/7Upx/CXaUMVNhOOnZ1PONKctM5LFM1DhCV91vBStDKavqQyO+H1qG2QFI24hjw/Lu3n5xoIig/JZEy9gg5wxnZXCtdI4fef5d4HpFaE5XpCewIWxPY7hL4atj5CMk1m7kiWzJfXfDNQIH5taDWa7y7bTEcwpKBBCBbXX7k0HPxRLH8OOKuyiGTZqTM0o8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d186838-64c0-490c-08e8-08dd75bc4ff6
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 10:09:41.3842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdb09M4pjcqCm4+4TnGC0eNPPIP5IKeEA9wLP0I7SxCozcZag5q5xilAsb+eZN8HGjrR7hwIVTKfQAV02jmWw0+48l5Ipk8KYkt9hRnJ9og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5598
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504070073
X-Proofpoint-ORIG-GUID: Y7YUSGA-OsrfVohn_-sl_4keq4JkG9CJ
X-Proofpoint-GUID: Y7YUSGA-OsrfVohn_-sl_4keq4JkG9CJ

I did actually try to mark this fixed, but apparently syz fix doesn't work or
doesn't prevent other syzbots from duplicating reports.

Anyway, this is fixed in commit 36eed5400805 ("mm/mremap: do not set
vrm->vma NULL immediately prior to checking it"), was fixed a long time
ago, as soon as reported, and it's been a matter of waiting for this to
land in Linus's tree.

This is now fixed, upstream, and this report is - as a result - redundant.

Thanks, Lorenzo

On Sat, Apr 05, 2025 at 05:16:31PM -0700, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    a2cc6ff5ec8f Merge tag 'firewire-updates-6.15' of git://gi..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=11ab27cf980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=adffebefc9feb9d6
> dashboard link: https://syzkaller.appspot.com/bug?extid=5250c4727db03e3436cc
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1693d404580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=178ac94c580000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/8ecd2318067e/disk-a2cc6ff5.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/05691b82062c/vmlinux-a2cc6ff5.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/4698994e99d4/bzImage-a2cc6ff5.xz
>
> The issue was bisected to:
>
> commit d5c8aec0542e2d79b64de9089b88fabdebe05c1e
> Author: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Date:   Mon Mar 10 20:50:37 2025 +0000
>
>     mm/mremap: initial refactor of move_vma()
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11ff2a74580000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=13ff2a74580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=15ff2a74580000
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.com
> Fixes: d5c8aec0542e ("mm/mremap: initial refactor of move_vma()")
>
> Code: 48 83 c4 28 c3 e8 17 1a 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fff0b8738c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
> RAX: ffffffffffffffda RBX: 00007fff0b8738d0 RCX: 00007f46ffb182e9
> RDX: 0000000000003000 RSI: 0000000000001000 RDI: 0000200000ffc000
> RBP: 0000000000000001 R08: 0000200000ffa000 R09: 00007f46ffb80031
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f46ffb83618
> R13: 00007fff0b873aa8 R14: 0000000000000001 R15: 0000000000000001
>  </TASK>
> Oops: general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] SMP KASAN NOPTI
> KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
> CPU: 0 UID: 0 PID: 5820 Comm: syz-executor115 Not tainted 6.14.0-syzkaller-12966-ga2cc6ff5ec8f #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
> RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
> RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
> RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
> RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
> RIP: 0010:__do_sys_mremap+0x1392/0x15c0 mm/mremap.c:1784
> Code: 0f 85 45 02 00 00 48 8b 04 24 c6 84 24 70 01 00 00 01 48 01 85 68 02 00 00 eb 9a e8 18 34 af ff 48 b8 04 00 00 00 00 fc ff df <80> 38 00 0f 85 a7 01 00 00 48 8b 2c 25 20 00 00 00 31 ff 81 e5 00
> RSP: 0018:ffffc900039dfd20 EFLAGS: 00010293
> RAX: dffffc0000000004 RBX: ffff88802b765a00 RCX: ffffffff821183c6
> RDX: ffff88805c7b8000 RSI: ffffffff820c0cb8 RDI: 0000000000000005
> RBP: ffff8880341fb780 R08: 0000000000000005 R09: 0000000000000000
> R10: 00000000fffffff4 R11: 0000000000000001 R12: 0000000000002000
> R13: 1ffff9200073bfaa R14: 0000200000ffc000 R15: ffff88802b765b70
> FS:  00005555814db380(0000) GS:ffff8881249b8000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fff0b8728e0 CR3: 000000007802e000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f46ffb182e9
> Code: 48 83 c4 28 c3 e8 17 1a 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fff0b8738c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
> RAX: ffffffffffffffda RBX: 00007fff0b8738d0 RCX: 00007f46ffb182e9
> RDX: 0000000000003000 RSI: 0000000000001000 RDI: 0000200000ffc000
> RBP: 0000000000000001 R08: 0000200000ffa000 R09: 00007f46ffb80031
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f46ffb83618
> R13: 00007fff0b873aa8 R14: 0000000000000001 R15: 0000000000000001
>  </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
> RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
> RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
> RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
> RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
> RIP: 0010:__do_sys_mremap+0x1392/0x15c0 mm/mremap.c:1784
> Code: 0f 85 45 02 00 00 48 8b 04 24 c6 84 24 70 01 00 00 01 48 01 85 68 02 00 00 eb 9a e8 18 34 af ff 48 b8 04 00 00 00 00 fc ff df <80> 38 00 0f 85 a7 01 00 00 48 8b 2c 25 20 00 00 00 31 ff 81 e5 00
> RSP: 0018:ffffc900039dfd20 EFLAGS: 00010293
> RAX: dffffc0000000004 RBX: ffff88802b765a00 RCX: ffffffff821183c6
> RDX: ffff88805c7b8000 RSI: ffffffff820c0cb8 RDI: 0000000000000005
> RBP: ffff8880341fb780 R08: 0000000000000005 R09: 0000000000000000
> R10: 00000000fffffff4 R11: 0000000000000001 R12: 0000000000002000
> R13: 1ffff9200073bfaa R14: 0000200000ffc000 R15: ffff88802b765b70
> FS:  00005555814db380(0000) GS:ffff8881249b8000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fff0b8728e0 CR3: 000000007802e000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> ----------------
> Code disassembly (best guess):
>    0:	48 83 c4 28          	add    $0x28,%rsp
>    4:	c3                   	ret
>    5:	e8 17 1a 00 00       	call   0x1a21
>    a:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
>   11:	48 89 f8             	mov    %rdi,%rax
>   14:	48 89 f7             	mov    %rsi,%rdi
>   17:	48 89 d6             	mov    %rdx,%rsi
>   1a:	48 89 ca             	mov    %rcx,%rdx
>   1d:	4d 89 c2             	mov    %r8,%r10
>   20:	4d 89 c8             	mov    %r9,%r8
>   23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
>   28:	0f 05                	syscall
> * 2a:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax <-- trapping instruction
>   30:	73 01                	jae    0x33
>   32:	c3                   	ret
>   33:	48 c7 c1 b8 ff ff ff 	mov    $0xffffffffffffffb8,%rcx
>   3a:	f7 d8                	neg    %eax
>   3c:	64 89 01             	mov    %eax,%fs:(%rcx)
>   3f:	48                   	rex.W
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup

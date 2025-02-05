Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A4913D897
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 18:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738781822; cv=fail; b=UMoj4H4mojHSSyBjtGwh4ovJz6oBBHwRH68Lwr6Rb1hAJLhsIzi6qtqjB7sCmSYGuB+8RTz6/RGeJnVm3yxTE0vwifnTIcdoxes3k3X4Q70MBRHUEj/QiaiyBrgdGQjJEGprr5IbHuL7tsFu7gjlwq0yrQaMdVNkiKLUOzvasVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738781822; c=relaxed/simple;
	bh=4iyVxJRXhyxzuHpAS0RX8p6p8F1SdfEIKyMC1ol/Ylg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lXL/PAnJ2fFfVC1v/Ly2LD5K/U/oh8bpa/7bTAbbO0lWgORblXR0jjo/CfVH93YzVxf7jc3Amn3+RU+uf1djPJTgTTr2VmEf8XZ1QTjRgWn5gGvNm2BG7NrUb1Dk38KEUgexuKlheQ47EJLmOBiHNlN7YoLYBJbWm7wakByDidY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nNEpf28Y; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vrqGdVZO; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nNEpf28Y";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vrqGdVZO"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515Gflu5032246;
	Wed, 5 Feb 2025 18:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=sX6LgCAFkBcB4Xgpjc
	KG7KpQuVKie6TIIuaSA+BBdJ8=; b=nNEpf28YPdphRtoAL7qJvgv2MRcoYQkgTg
	xg5jEmVuQCdkje3sILkZSSwu8yNzpsCCGJUwUsEPwGUkUG5tHJRozNAqKvKBIhah
	CPioceoeJYnrRkU8OqcPlV8FAO26+3sLCcdvq5UK5ShRJpv90QJEClVqxpU3LogF
	5MlVumvOAyAn3CVXuwE/cAuRzNZ/IKjEl3ovS8yr4XLjI1Gw2+cdeU0Ccvn2nHjp
	uSI7lFCHN1q1tXLUlQou4IogFsgkZ6QS9Fj5mwqGxjiSiNIA4w4k9yoxe02pyZGd
	j+wQM8HhhHruBNSnD9T3l4tiQ4IS3iJ9t3JFmd5Wnbt+9Vo1Gr8g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhjtyt1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 18:56:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 515I4jPo027794;
	Wed, 5 Feb 2025 18:56:45 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8dp2bjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 18:56:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0MteLFe2QpkkiprYTS2LVl+W2UKWpAJSgzSNpY+eu97QhV72n0QSK05cCTaznP4um6Wz+dyAUUYi+FJGzRLiGD8Pvs8+iv5jcLhY+FycAd9LzxGTtCjCmx2SrQLWmd/RMiBbRutIJoc7CYUpADH51hXKOKJfrFV4I+PCbfPPwtmZlpPLVQmc2Vd+yvSney3YNP3ZlUNEIJQIa6PBi5716WoLZYSNMjS/Yg2jXbzxed0ZuCPy8IBLGLiKP6Hi4WryDTkEE/e5QrvszwXyfw1YjumFBM/oCPGmrQ0sbcqoRk8oYeCaDUi304jIs89+wTxrDBQqYV53S5nPnkwLueitg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sX6LgCAFkBcB4XgpjcKG7KpQuVKie6TIIuaSA+BBdJ8=;
 b=MWobrXx/A6ZtJs6FJW5M0NOEx+wyqUydUd9dExVfeyWE/23bv/74bS+b7GS0aLFK5+KEVw5tofj8USmPcRhv1lENfR1rA7Xip4EbC1yP3FXmZzv1KKeWz0r750C3p7Q/dbpZDaU9scoH+Qt3nxFlv1rdqOszoXMlid62Whi6pwUbsjv0KDjTJYrNkjZY7BD006C1F1fB8skSk8EPzRbZd4kMde7O8/cfQ12dV5YmpYfCQi58+SJf/CDmffg9vHV12+RAJOSL5yvuhR991SBTl/ZGxwci9hQhvw3tJ01pRpdybhJayxMz9Jkl9E5hMGGPhDClukfX4nPBb0Nb0HtBSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sX6LgCAFkBcB4XgpjcKG7KpQuVKie6TIIuaSA+BBdJ8=;
 b=vrqGdVZOtmXpcFQ/Q5XrDmyA6ecr6ljFDg4ks262hORLRZDE7cM5uEYr8zoybGUoMWhcd1MZADLLwVU1ZbN41GJkYRiHTOXqfoLTYriRUx8zeKfw7FHwTM6IShJWOxrxRZBiY76OFCgmlqS9ySvzi+mrzuBiz5P3efiYo0ca8sQ=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SN4PR10MB5576.namprd10.prod.outlook.com (2603:10b6:806:207::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 18:56:42 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 18:56:42 +0000
Date: Wed, 5 Feb 2025 13:56:39 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Marco Elver <elver@google.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Jann Horn <jannh@google.com>,
        syzbot <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com>,
        akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, syzkaller-bugs@googlegroups.com, vbabka@suse.cz,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [syzbot] [mm?] KCSAN: data-race in mprotect_fixup /
 try_to_migrate_one
Message-ID: <gp4vckstuvkkd7v7bk3dqaunei4c3mc5ceajeeuz5alrstftuj@uextnyckj7an>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Marco Elver <elver@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Jann Horn <jannh@google.com>, syzbot <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com>, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz, "Paul E. McKenney" <paulmck@kernel.org>
References: <67a34e60.050a0220.50516.0040.GAE@google.com>
 <CAG48ez3KKEYRU+-Mkk+tq1Onv3QWg0jP6fEKYjNjRS+ziP5dAQ@mail.gmail.com>
 <13bb4bbf-92e7-4c45-a3a8-a52312015f92@lucifer.local>
 <CANpmjNNeXjtatBD6Lrz2-1jiqLkpcuk0Ra-6uJKzz3=y86qVuA@mail.gmail.com>
 <097c6249-e86e-42c9-9f43-bb9f8a865ce4@lucifer.local>
 <CANpmjNPzQBvHrGGLwtCrU8iLUz2tppGie=_ZkuYck2fgN9Qr7Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNPzQBvHrGGLwtCrU8iLUz2tppGie=_ZkuYck2fgN9Qr7Q@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT2PR01CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::9) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SN4PR10MB5576:EE_
X-MS-Office365-Filtering-Correlation-Id: d275ce25-cdb2-4433-67ed-08dd4616d42b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aFWMYsj8MVgpGLfV90iAsQffPVrpEXGkD6Q5cwL8QIItI8JD6RuuWsxOi+Rl?=
 =?us-ascii?Q?zAEM2X0/L2FJaT8wFlsZgqXSkoOosTiOsoxAW5e7KxU1d6fgPlzVjaYGVBcr?=
 =?us-ascii?Q?T/80CVfggvT62e27ulROT+cUpnzm5viDBtlWyJ0341dFdU6t3k1I3ByEFsv9?=
 =?us-ascii?Q?kStPaYUz10OSxyr2ButI5/9XLCFGy9vTQ2OI9lxt62K3Fb6b9flHzpebvbCn?=
 =?us-ascii?Q?hPN/yFcSdf24TxxIhGZsGGruZDkzjejAIZPU+gOpfAU+5YVyQjc65a8Ra34N?=
 =?us-ascii?Q?jeIVNTH2kugJk3im7pgrO/u00m6t39B+gaJj2dBCVwp7flndOSo8PHthsVh0?=
 =?us-ascii?Q?+Eogii5NZEaIPb618NSK0nk2MakS1HpFYUe1OKwWZkrm7+rit/i00frm5JG/?=
 =?us-ascii?Q?lGYbi8iVZlDdIFzGzaOB1JAZ4z1Z8zacWy8BULZqSJc86z1bmlJYKEzJqkIZ?=
 =?us-ascii?Q?OiP6aOKK79nZgT1PGFnhrofEKgg0h7eKac4uMGG6ShkyVteLMC+zHBcy6p0S?=
 =?us-ascii?Q?PgmvHxZt91C4SSsRbjYSZPLosE0yFBjth37imb4k+xafDlHqw1Vo/09591J2?=
 =?us-ascii?Q?FAdW1PrwUX+xXFiy6Oa5jsud27abNC/aQvWPoyUcwz1fHL+Tlgtj10pYUTQH?=
 =?us-ascii?Q?krtn1MPj638l63Pi2lKCQ+L/tCbp/S9Ntk1RhotJtTLNU1PzD3bYwszYJz8k?=
 =?us-ascii?Q?xBrBZUid1GrlwneySIUxCWoeSorFHUrzm0vNwNNC5XwSQkq43M9b1KW3auV1?=
 =?us-ascii?Q?eoxgvYvVBoSG8DLGJPswce3dXgbfjnFX7b/yWMU5R1B57XVUY3k2+QlYS98l?=
 =?us-ascii?Q?ptQk0VLFsZRgd9AWIIajQTzTbL/Wj/VcsU/9VUB+LciWN0va6oflJ26y/rCT?=
 =?us-ascii?Q?K2Mf/PhPaOI0e5RNuwXs/Mu62HWHu4Tj4XJugA+zzwYM1ovjCCvT5vLNemF1?=
 =?us-ascii?Q?4YLPbVpK34zb6ZePAM1Ao8sFU+B95Gyh8fi/Src+QKRjd/gGXKj2eeV7Bfg+?=
 =?us-ascii?Q?egwEffXiIZsH8P6gPlq6WdTkQ0GOaXsrk/0kA5dSLKQqmwNXuJ8TUggp9Aru?=
 =?us-ascii?Q?VK12KheZRjdmn55uN3DcnAiBId5ozdfGX/CLxYHdeEkuYzFKHyFSOJHkzXZP?=
 =?us-ascii?Q?t/6FI/1bBieXqGn/8rakmfdt34V7bD5WaLTwHVFNJ7VKaswK9LnNbMI+3kKP?=
 =?us-ascii?Q?jhugPTMtCzKZyfMXm/hEpe8ryBWXqhaxklpr4PHjfnXOwYuJYAMYV1+pZL8l?=
 =?us-ascii?Q?Cmrdnp/bAg03SOVju7+3yhO8dgeQQQ285VHbW6jfEog7lHsqRwn9fv23ah52?=
 =?us-ascii?Q?P8wKsepwUbVeitUOSHblW7edqJ0A0IRji63+r/DIB06DyQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+aYnQQ/Z42qAGu0XWa1xbtDXfrJndjNox7XLFW1HXwATCpNRGX/Y4OtXzf1+?=
 =?us-ascii?Q?gCSL0JBbcZtnxgY4gdYisHsiCO6Vc5ul4rCzgdxr0Jytg0QcbelOktpoUbha?=
 =?us-ascii?Q?9AdL7LnjB7buwBeni765HwQQOxt0MH60tW/xrOq3mHkIRw/4WyGqQ9bstlTV?=
 =?us-ascii?Q?IYDdMZuS+aVCg0eInuBpXs5LI5UN8ZjzjYJCCGbAFRQPnto3rW7ZLVRj481Y?=
 =?us-ascii?Q?9d8412vX1UHoxOomb8s12nz53ZqnN4kINlDkK2xHbpOz2JnrCM7dftddJbnm?=
 =?us-ascii?Q?9LNr+PIB3mt9ensbIYrucg0UpBou/TL/vVHYwFd9eaGuqqovrcyaV43ZWjWM?=
 =?us-ascii?Q?dsCIgo5hNA59x7ZLaohJyNw+PwdRPyYoe3lt+IHhfya4G4QqS4AQ4Cp9Qs5o?=
 =?us-ascii?Q?EInfJIuAQDMIvjlDjR6z1aEJaLrz4VmdwI3yqiwHIxPLOLrXjXPbu61Y+dYz?=
 =?us-ascii?Q?fWHnUPytC9QoJKnPW2V2O50hYsQ7qb6AIaPpDheppRd+UR8rX+AbcKUiehgs?=
 =?us-ascii?Q?3eeRzmxXHLNVQ6iAxIzNVyKzJNNVNyk9mknvqAZWNHfEItJJXuoLfXbM1SXV?=
 =?us-ascii?Q?oU+HHqO/NhHBl0bRpJnN9rtj32QuRLQ5tX2nlrNovnEqfvHU2+9ooPaLjob/?=
 =?us-ascii?Q?P794VMq3dXGVyDYMtLLsU/wolry4vmLRi/PpoUCY4EBa9pCED26QJ8BRJuib?=
 =?us-ascii?Q?xvK6A91Q5mdS7ykfakt57E4bMJ8oijN26k7NmNaLn/ZA/06tJ98NXNfqm/Wv?=
 =?us-ascii?Q?1nacHLGRw6atLEFCesDiIwzufoM113H8LTGG119hCMtNG9rpJZfyIPmZXOSb?=
 =?us-ascii?Q?RY153xIvMd8NSt3IDwsQpitJEJhf2QtHEG+qUSAM2jkQg0jSSoIYnwQGwN0s?=
 =?us-ascii?Q?Fh9dpg4yljU02ZinIMToskLcShOB5YfwdGBIRIQinB/G5ssLXIieFbuLOznZ?=
 =?us-ascii?Q?/C7zgIg3DCmNNna6mSOYG3aEBi3jmYhXgwgWPlhzX0JaUfRh99gkr5HaQYth?=
 =?us-ascii?Q?S9mQghTDJfIuIcfSThOiEjjRd4n2RYdSjkfmF+dq6J8ey8EhNRQGNSCnoY3u?=
 =?us-ascii?Q?ZQk6K59aMff8yQQGHd8xlJmpSym2/dUFx8K0fupupsim/DARhZ62/F0p3DIv?=
 =?us-ascii?Q?S/ZThp+d+LOJa8uMjQ2xuBkOkasw95vRd6LX1wnDiRCaa6/ZzqYARYJxTM0E?=
 =?us-ascii?Q?R1eWtuX1JTvoQW31WuhYYUfNIvq43zmhCbokfJ8MrB+S6ehbhWrSOB2nv+rR?=
 =?us-ascii?Q?91UxrHTClSFb8UNdEmjpRUUjRyXIIhjsNwwcJwKYPwXovgTpwS0zr821GCWg?=
 =?us-ascii?Q?1iPnvk/S+JvCnVLnJgoaA2lG81pMlfloPI855gaIKdPnRfQ4aroIFSQYCPt2?=
 =?us-ascii?Q?d/tykpYDaFlpmb346nfMI26ka5zbBgWD8LaRkxPbWGxuYu/LdwdHJx0W7oLe?=
 =?us-ascii?Q?fRazH89iXRea3uS+NtM3W3j43StFV4mHAgNOOG2ELQ/VvLCXjPst4mlKr5+h?=
 =?us-ascii?Q?sBrRRUNkatr3bcDH2C1a0lLujMXBNE2GTm7Pa02UKnHYUo056uniBPBPX6Ox?=
 =?us-ascii?Q?rdpBa1hEsN3jKKw+l858k13lU5JvnI12k3Rypu8g?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GJAGv28RV+Wl1FvqKxdiS8gfJzem+rsDLFeJH/9+DUSnauc8HL06SkrmupK5crU12CU+qlFPEO7kLmWp5XpPx2EAHVriUX057v2pW4QydaB5wt7o5HRgLf2/7chyFgEJhrD5vaug4V+slfji6LtEG9pqQeLIqpD/WB73973IGYVuaiCn/oS4ZD2uz/hvvaJmMAa3Um5QC/tbXknbF+VMTDeV1mbJRVV5VtMuNrE5AlIhWKGv2jix3aw3HXV6KpnmisU3IIBnxSDwOuKFKy+W5E/QZ8JNhtKK9Se4eOz/njHwwYYfkjXtFWVFrc9Un7IUxSpS+wK+gLHUbJ1zHN6f8BMwPh2Gcn9WGc2aiDLlmxFD9iQsGwIi1htNgiCFw8NHDirBWlNlGqgLcoTUUb0Y1reiMvK6lMVQOdERvPOIsf/jQ60BbGeY6wOkOY8Pag5hQ7Ez+2MEktmtBWfI4WHZU/X2Q6qp8fl3uqUwozOfLZ39PucTQzXp/rVpSeGxcZw1cWw04t3viW0fYqmXNU3rdSaUn1GuBkSaOBSAZYyYQwn+G/dU6FmlPAuqsoIgeI4vbjOSOlKSWar/PYhGrpnZ8D8QXH0h0I6iq3tbaCpe3dk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d275ce25-cdb2-4433-67ed-08dd4616d42b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 18:56:42.0882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fq0vTuyfc1HyImLSsdBCFa+9K2wXuOCLnZpN5GTI6oHtKmHZsgDBCEmJly8aLA7QhW51HH3WEkU5EhqO1BKM8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5576
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502050144
X-Proofpoint-GUID: oquuZJkV5BrqSQyioaA2mpjLXieXKvui
X-Proofpoint-ORIG-GUID: oquuZJkV5BrqSQyioaA2mpjLXieXKvui

* Marco Elver <elver@google.com> [250205 11:29]:
> On Wed, 5 Feb 2025 at 16:51, Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> [...]
> > > [...]
> > > > I hate that we have these landmines waiting for us. Be good to find a way
> > > > to explicitly annotate this, or at least comment somehow.
> > > >
> > > > But agreed, probably adding a READ_ONCE()/WRITE_ONCE() is appropriate at
> > > > least for the proximate thing.
> > > >
> > > > It's a wonder these things don't trigger more, except you need probably
> > > > very precise timing to do it...
> > >
> > > They do trigger, but we don't send all of them to LKML.
> > > When we first introduced KCSAN, the notion of "data race" was still
> > > poorly understood. At the time we decided to pre-review a number of
> > > them (but our time to do so has been going down :-/), or let willing
> > > maintainers deal with them directly. A number of articles followed,
> >
> > We very much appreciate your efforts :)
> >
> > We are definitely willing to see these in mm, and as you can see from the
> > discussion here, the interaction between the rmap locks and other locks is
> > complicated (see also the docs I wrote on them at [0]).
> 
> Tangentially, I've been trying to work out how to bring this [1] Clang
> feature to the kernel: it's more or less a simple "capability system"
> [2] to express "acquire this before doing that / don't hold this thing
> here / etc.". Locking rules are an obvious application. It's been on a
> number of people's radar over the years, but nothing materialized.
> Sparse's locking analysis is much weaker, nor easy (i.e. quick) to
> use.
> 
> [1] https://clang.llvm.org/docs/ThreadSafetyAnalysis.html
> [2] https://www.cs.cornell.edu/talc/papers/capabilities.pdf
> 
> The current work-in-progress is here:
> https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git/log/?h=cap-analysis
> It lacks documentation, and proper commit messages, but is otherwise
> usable (see example enablements for kfence, kcov, and stackdepot and
> lib/test_capability-analysis.c).
> An official RFC will follow, but the hard part of writing
> documentation is in the works. ;-)
> 
> There are also other questions, such as:  can a subset of the analysis
> be applied tree-wide (vs. current selective enablement), as it would
> help find more bugs faster.

You will get so many false positives from my code in the maple tree
alone that it will not be very useful, due to rcu usage.

My main issue in the maple tree is that I have a pointer that guards the
other data as valid, so I read data and then check this guard pointer
(the parent pointer in the node) to ensure what I've seen is indeed
valid.

> However, the reality of it is that using this system would be opting
> into a "dialect of C with capability analysis" with its own set of
> restrictions, and I don't know if everyone is willing to pay this
> cost.
> 
> What I'd be curious about is, if some of the complex rules you mention
> above can be expressed so that Clang's "capability analysis" can point
> out some bugs. I suspect not everything can be expressed, but even if
> we get 50% there, we could catch a huge amount of bugs statically at
> compile-time.

The locking of the vma is difficult because we have the per-vma lock,
the mmap read/write lock, the rmap lock, and the rcu read lock.  The
vmas are also transitioning to be rcu type-safe.

You can also find the vma through the mm's vma tree, and the rmap.
Also, other tasks can look up vmas by finding them through the rmap and
gup, maybe others.

The path taken to find the vma will dictate which locks ensure it to be
safe (for a lower cost than taking ALL of the locks or THE SAME lock).
And like this path, many of the races are benign by design. I'm not sure
how you could verify this with a compiler - without annotation, as Jann
is suggesting here.

> 
> I let this cat out the bag, because this thread seems like a good way
> to get super-early high-level feedback. :-)
> It'll be a while before the first RFC.

My initial thought is that you don't want to start with vmas, but if you
do start with vmas and can make it work, then most other places will be
easier.

Thanks,
Liam


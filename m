Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D8C1F873E;
	Thu, 15 May 2025 20:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747341830; cv=fail; b=X3kXN1EycqEEmwhcZ4yu3Rd+JoaeqmDHJz9Y3zOVdYrxSUPlYVJNkLQKlpaKLTY95aQaXbLhQQqR4Rw2iMgPGFX/xQAMycXVOF7r6dDDwGoLDF4tyeL1aUkXTCFSFqQUBrZP0tJSbtv92XPEmLw1Cxm4eyNDH+0afnstedaFjHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747341830; c=relaxed/simple;
	bh=c0Wp5eopjUWXB1rPdo1p4RhHaB5A4L0c6mlEcmiY48g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Za2WFgV4/7NBZ5x6m7ueDYEWAO255M5eEGHip5XmmWQ8JDbiSi7A06QkzU/R/pYcvdYha9jS7EQk7qnTtiBNiVIaFyH3goUPwLcbblnvJQ2hjUmX0g5fvPYVuPbFltQa52gf77/Xf5p0lbcTmQFE2kHXbjeeXvA1hjLO9+/h6B8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OFNsmYCQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rORaLyyB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OFNsmYCQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rORaLyyB"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FJZHSW028476;
	Thu, 15 May 2025 20:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=GsdazWqSXlyouR6lQ9
	ZooEntc4YJRqBVBku0sBIg9nk=; b=OFNsmYCQnwCBuqb3RXbl3FSrSebOWPwmzb
	tN1ZUg+PLqpxyxt3tWO1QvoyMmpnQOtwhseFGf2Jv3a3ABBLXPAir2QZFYUAf2OU
	RYxdl5AzJea2wU3IFV6RcjZkROdd4+LY1aTf8vXyeHhJwH6Vd4FJsIT+XC9/dfpl
	9dPgNHOLtGmL54qGe878dwJRQ1g+cFmrn1VpRaDo1hrJjYBpZ/UL0QolESWTchLp
	PsK0oMpYRuuRZZr7PSl8DS3NDgiQDFpNC5UqMiuOOVZLX4cX2jMIbDr+/nTpTEw5
	sX07ZSF/Mw7zBamViXdGlxSSCdPLoy/1UP1hXlvdBYHY4zC40XIg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcmn8j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 20:42:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FJl2Vx004865;
	Thu, 15 May 2025 20:42:42 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010004.outbound.protection.outlook.com [40.93.20.4])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mqmdx73c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 20:42:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lke10lwIwyikuMUfLgQNXWrn5CMIrxlbDPwuPCYHZExLRsTKrp79EVKj3kHSV+NI/fi9uSqnAG/rMhpl5/V8gzaALq8GJG86lFlNlbmgPAHAW0COMZeAqQ/sLtl8GEbXB0ANtLM6fmtTTsaFg/h1b1zdmv6YbBuHhDmw0ZMj/BLAEqAW3XyN47owg3POxDjfmoqAfrPp5cj22W3nqgvFUr3x8mXvO6wYKjsTa8IkMqPEpzaj2W9IUosmcb0v+mgXw2iE4VJQqAUo4voQeA4Bi6ghQpc2xMuuKGd8HLEXfm6tuMHgVNbpG2O+fghpnRuZvhwYDReHwEslzFR7gEezOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsdazWqSXlyouR6lQ9ZooEntc4YJRqBVBku0sBIg9nk=;
 b=HLyxqzWLDM/RSDqjOjzugzxsaa1LlEMH1bjL0lLspaIF1NNMHPQ56daAZEnKsFI/7muhnE4WyCm95Yco9H9dcXHHsBTpZoxyz+oY8+cYaKcumLUTqIRMBrM3Q8cQsn9EC5sGr6lKojO57ag/A5EeORm5Nji38kDzJ7wRi/MUD4oDu9U/w4YkKpL4oy/oCmUAr+5pgiTIq3Mjtv6YfAyCHJPh3ScR8qwomrr3WgNKFL/U1iaE7jqzshMFAzBWbAcrYhlhoUo+PI91Pl7hplzTOLvkp91UT3TfRfd26AKQDsb/UqcsMMRhHnhGCybdkU/udl8LQ3pMmQ3AoUOYlHVNlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsdazWqSXlyouR6lQ9ZooEntc4YJRqBVBku0sBIg9nk=;
 b=rORaLyyBCh2bQJtuK+8xxguI+t8P1KhgUKO8fut3H/puGqL3OuIKtVkr5NB4UDQrCWx5CGxzav9sAL8SBn8+YrUFZSdx/OY8AE/2VVcyyl6MDVXFFWScoKedzBzEDRFpidIu5wMQUBsXcg3ZC59D4eQa4OzN3YVfEo7c2QQRPRI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PR10MB7911.namprd10.prod.outlook.com (2603:10b6:0:1e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 15 May
 2025 20:42:39 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 20:42:39 +0000
Date: Thu, 15 May 2025 21:42:37 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Usama Arif <usamaarif642@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@meta.com
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Message-ID: <5e8c66df-a0d0-4f21-b628-7f2d56f7e595@lucifer.local>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <ddc0dd46-8541-4d4a-ac59-287e11e1d3ff@gmail.com>
 <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
 <732ff995-0e18-4e8c-a0a5-14da400d4078@gmail.com>
 <6c66e167-1be5-4298-8131-5434d9ff67df@lucifer.local>
 <869607c4-5deb-451e-bd83-fe5890bd54cf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <869607c4-5deb-451e-bd83-fe5890bd54cf@redhat.com>
X-ClientProxiedBy: LO4P265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PR10MB7911:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f9c177-fb91-4e5d-f5b1-08dd93f1089a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LDD0YnBmM0Gtiry7n4V8n8aGmjYW3A+PO/0F0vRARvXnQjKx8i9a7k5uqcc0?=
 =?us-ascii?Q?uEQ8HWW84ZB/xgqyQJ7mjhvreDA1UtffeAn+mFAFsmYeH+aPpokvfk9qrh2Z?=
 =?us-ascii?Q?VAPf7Ta4jbJL0ndxuhHCdXZJjZxAJxm3wuXoVcJ9uvXaWNTxYF3t97zb5zgt?=
 =?us-ascii?Q?8aRFzcQ0KabmIiuUnH6nM0BoKrkwFu1ElPAFNWci1NNj2tNCwmIqHhJBPvbF?=
 =?us-ascii?Q?TE00PDfjo2tc7qhKYZEnxSVMjeJfo/LNBj4NO9hTyaMbcXXFCJJF+/SYDfHc?=
 =?us-ascii?Q?XiOz/2CQ4OThqntR7Eqt/T98Fxue8sQqc2UpmXfk4Sb2RPWaHfNXolpcvICd?=
 =?us-ascii?Q?xuNXljZcmjgx4+0JpcudMKfb3pwbVTtKNgi6flDPT7dPvPWlAW+/+Ljys+Lv?=
 =?us-ascii?Q?Q9P4LLaoQHrTVdbFz1oVnDhD10VerV38O2oOEKj5PEn32rbY841SYk8J3w7Y?=
 =?us-ascii?Q?VxePoclJJxULqK1p2AWgkAMOEar/y3M0jGQm4gXIuq6l48t7knJSzgYebE27?=
 =?us-ascii?Q?VIXF5Q5BOkPYNGnN/Qncp3qqlziTgQP5MJkfXqplwPdX8eBtY5+IIlpUISoO?=
 =?us-ascii?Q?OVAtkuJHzcZhla8PI9cqZ8VOrzPsrENj83bYl9DLVDMDH64CYXnkltIG4o4N?=
 =?us-ascii?Q?WUHg2IeWsQg4yn9Ma0dJXTrTRVo+Q0VuArfyfK1Zu/px9fqUrQ85HAx/4uoF?=
 =?us-ascii?Q?dwP3iku3kGkJDw8mAcfsSwggMoYIl9jc9iI9c0rLV8trjjNO/WuyB1fO0+Zh?=
 =?us-ascii?Q?9kF83y9WKReYYFJZGvmYQv/eXInZtbu1W8faynRwWBL/BMsWnNwie/yFG6bO?=
 =?us-ascii?Q?754iuHcUdaEk+Z9vytfHayp2IeEyx3QKwzv/K1rxc7Us6OH5fBEb9LsQiN/k?=
 =?us-ascii?Q?r1QCUwDGUrF5gyONtGZk1S+oz+jGvqwpKvmgbjHWW172JF5CkHA6qsajZVWI?=
 =?us-ascii?Q?ZpiaS4KUq7pPeOi9IqVPDcTZC1Ug268RNlvDkA0Qew4rYrPeZRQDOYFi3nbf?=
 =?us-ascii?Q?783ShLCplBhuD7Kh7HNpW/3Z4fBowCJypGHUOJC1dllEbb97nbmruXzyBCS+?=
 =?us-ascii?Q?ZIrlJeU8wMIHYVxRG0ojO/zB9/EYpdmXdWQQlH7rEgqqfLfc151oCJspUdXl?=
 =?us-ascii?Q?o6Ck8D9cPMDHNwuZKZRFyEDwAs0WYVq/LPNyJSVsObjFcjlrlbhapajupJbo?=
 =?us-ascii?Q?aMkHHcqlMVsX/JROSnmBWSa16i4daoG89zvZGam3NflxvMBJj0R8NELvhM9g?=
 =?us-ascii?Q?u6aPxfHB6k4h4bziXVQDjnpiEyzA7+wF3wJUpohpWr2UTqdBcYWr51QCzNwt?=
 =?us-ascii?Q?4jDdrbCKefVPw8ISnbcQEzUsYyYwGUSjgif1DHTCxjfyzsx36iaXWCpW1fsY?=
 =?us-ascii?Q?j192ULrsN2r+Z5MnpBJ/5+Mpu6NRxv1se4U7DAxryz1rlnS6ZBMWLZ6fgNCI?=
 =?us-ascii?Q?1zxw46+/+d4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jXSo0Qg0aIMgxsVS//QPayTFpaxsFIwATA6XOCeGubyLkp3HK3D3SkC0e7Ra?=
 =?us-ascii?Q?0n5gmNEkjTJBYUHBSmQpsN26zOEue4truUS7tgy2E3rGumjikjJ6e0v4LQxg?=
 =?us-ascii?Q?YLh2RpxIuGRLtGmX6RAMjVIFfNTgZNt6PKyIRGZIUD7TAbGgKhi3c6WBkk2G?=
 =?us-ascii?Q?GSlEl7U1DtnkCf9GK89glYv5xTEnif+UGlx9Q4Hlrx5kG8s+2QolQR10ydye?=
 =?us-ascii?Q?MgMcdPGq2GqOB7pqptZEhU0V5IpkXgAa1W3HWBCsuOdpDXdUEZdwh6MCEQqt?=
 =?us-ascii?Q?7emEYCa5khKHC2yW3qE5tHsR9SKzSN6aIVWwZMBJkMo7uJgvA+X9LkpPGTXR?=
 =?us-ascii?Q?MoDd5qw1tghGyqZZ+2eA914E3fQaaI1oXsFGgsxdG2UPm+/bZhHrl6XCFlP5?=
 =?us-ascii?Q?OfwPfbZaPGQ79L8XG8Greh6O4VXxqM3hH/+2lxt3FDEFGXrcdTyPwA3O5pt9?=
 =?us-ascii?Q?zN2Rja5hWUz67Hw8dSzidLHv12HTZxiHi48O9VcjWkLQhAG1ESoMOy5lV2ao?=
 =?us-ascii?Q?uxjljGvsJbobIyJNB3b5IFvo681m1Z+0cbNUBudEA66WeEmn5UOEajzn3eVh?=
 =?us-ascii?Q?6SFTDk4m1gAhxxrMD9E2WqdJhIogfx1n1Zj0kk3wuf+NUrgUVq8d6pogkUXT?=
 =?us-ascii?Q?i1pw3xcCC8LY/4BTYhwmwv75tKQz8clu94kE+5yPRZ+SUPEmoa+BM9E6yoH9?=
 =?us-ascii?Q?FD1O8/BCqycjYJiwTrvzGv/SGH7qnR2PYFaOgd5VM7mTZiMOrylFVZal3o58?=
 =?us-ascii?Q?9bgksuRHcJqY8sEiRWeN/9psTLCZpQOqbEhlYoBpeUKS5hzugYKg+LXOsk6U?=
 =?us-ascii?Q?sI+ZD7G7TQ8twQHYFz37ND3bERXzbthhSIIrtZGnYBDhHzrONydWgfzHBq8S?=
 =?us-ascii?Q?IYTP1tkh2OjKAE0xOWbCaMh86uvz1eLbdMHXVIl/A/YB6FhjdWO96DNtSMyl?=
 =?us-ascii?Q?ip523XGhu9udKYlvcxq68vjQ3pN0iXh73OouHQ5jCfqknZXOUSExoaPwYhzF?=
 =?us-ascii?Q?DAGPRfH/L64vvApFZHsmostvYNlg3Co9GRDi7FcU76lzqizEd7p93bzrL/z7?=
 =?us-ascii?Q?w2nrrJsQsFMgqM1dLBkLBoMom/oyxwEbHtYMhqRtZaYkFKGu22AlAW3Z7Nu4?=
 =?us-ascii?Q?6S8eXp1PNWJQDUbxh4sf/FsEZFA+DbIDCxOjsl6KNkLdHyERI7Jgn2nph3Y1?=
 =?us-ascii?Q?RgP0D0CM2Z7nvCsu0RA4pvwd5MroTRhr8Kt6MK2RA/yDqNxBSggoda5MigSs?=
 =?us-ascii?Q?JXg4aOdeaRqq2WSlRCeDaZlsEUcmUrXox+8Rz0kTrHDih73yVQi41tpaiJrm?=
 =?us-ascii?Q?AxI1Cii33wdppz4zeYSleRWvrUui1JmX3MfmpG+m4h/eQvjODH/FluZhKW31?=
 =?us-ascii?Q?zhMhoQbvKe32S+j+lAjKKGp1eW+grRoNtY+imELYNiiI/sWmi+sjUhY6eHM+?=
 =?us-ascii?Q?3vsJmFf4StEH7r0rPw2A6aw/MC37geMUEe+wwF88feInuFViJ/ao4XYlMUXu?=
 =?us-ascii?Q?lEhR32OBiWsWYEOvDEoEyOfiEREHzUHQS0WDp5W4a/baJYWpdDluyXeuwLFr?=
 =?us-ascii?Q?9OnGQET+VBnf6Bd6XJkzA8xYGxfzDCCC0TIciVem3KEPjC3GMUYimiScFCrz?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1TiVGHUvPL7mJ60cl/gklgR/m3OT2Ks88o1ZKcekiCz5suXx2gXJxOkvUoekIy1npAY8FLdg1YMjLu/oAU/f6IulOvP6Sdxi1NDwcaZrf1Yr3OnF2PnPmdxLkgOmp7MSTHrm86qOOI3lJkPrJfk06nb2PWxeNCvSjMwBgPq5YmpmSWpSxE2B0igQl1I31VhaBxQzHl+M7uWFYNrwjw1k5xOMmBovkemIBcznami4gc3IBXcJ/QKYDZRrCTJG/ZrLRWTT+O0HWRT2FloTVlORtsKUSEPwI6jRVEz087uFWQ3rtZViMpHpqipKhV6G2IdEJO9q5Y5ywwVNk3ZWeYU0aFPB7PXor+TgoD5AAQ78X8LagBS2lK9IfjEldHKk7aLec9lYy7Z2QGLZEnF2LiZtobh1qA2vrq5cvV8rJYaJqCOS/HeMTcE5Jtp9y88becqLMcWomu5kBiI2nlsD7CH+6eLe2EcoWXnOhGf3VKkIL8ZsAorBKbuZrsyD/R/EMmKH2bWq7TAHA3glkDwG5YLfH34rt0F3BD+OmVlHYOIzKw2Vmchwhqun+38+TMMpTGL6DvwS5txm/Bxios9ncROGYzSURkrk70DYM3qWskqD6cM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f9c177-fb91-4e5d-f5b1-08dd93f1089a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 20:42:39.8128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pD006QGHnCPdXJELvQWwq/6o5polNwvjYZhM4A0MU6l3UJXCZtDqEIh1at0xZIFk0f9LtiMPA5ReqO0l/vFZ0pdeLVt+4DFf7o6QW8sOrdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7911
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_09,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505150203
X-Proofpoint-ORIG-GUID: vdm6zsMjWEunF3XROaFIlIEvsHF1KTLq
X-Authority-Analysis: v=2.4 cv=f+RIBPyM c=1 sm=1 tr=0 ts=682651c3 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=iox4zFpeAAAA:8 a=SbSeOSCDcDDGFJuGvJMA:9 a=CjuIK1q_8ugA:10 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDIwMyBTYWx0ZWRfX9v1rsh1z2+gc m4IuZ30l1TYcW4hfqIawZ032S7wGxMD7Ez8VVbwkCLa2mk0BRnMBoQVUB6/eYUF1gblpXuibiLn QlpvK2jo9socCtmNZf9qjhEHapck7RKyGufXH9PnDP7HzQqX+7D7OmdCi/K7Y5BUiDuW6+8QqxC
 NoznmpLETzxDVg85zzN8Hfae5Y19Q1UOWwXHhsHjXGnAibMZyDwudoIBkGiNEJVKnSVJdwiE5/T 015AUaVZ5BTFcdfXlobbVe59m91QEEFlZALIw7xgYNMcMLcnF0jVKe1IeJXzXLybsdCu0oywQqO ZlEz/UwV3yDJR5zmRCBKMV3tTNcvIThqstZqVPdW/Jce/nm+8iJKhrC5l08khlvSleeZzvX05+G
 Bzq6UgPbFh4g/kk2cweamVKIJDz5XPWIEU3lLbKwYOz8ELK1KEYoLq2zCcrxsT1N1Eh2Zs7C
X-Proofpoint-GUID: vdm6zsMjWEunF3XROaFIlIEvsHF1KTLq

On Thu, May 15, 2025 at 09:17:28PM +0200, David Hildenbrand wrote:
> On 15.05.25 20:36, Lorenzo Stoakes wrote:

[snip]

> > But I don't think we should use vma_set_thp_policy() in these places, we
> > should just set the flag, to avoid trying to do a write lock etc. etc.,
> > plus we want to set the flag in a place that's not a VMA yet in both cases.
> >
> > So we'd need something like in do_mmap():
> >
> > +	vm_flags |= mm_implied_vma_flags(mm);
> > 	addr = mmap_region(file, addr, len, vm_flags, pgoff, uf);
> >
> > Where mm_implied_vma_flags() reads the MMF flags and sees if any imply VMA
> > flags.
> >
> > But we have something for that already don't we? mm->def_flags.
> >
> > Can't we use that actually? That should work for mmap too?
>
> Yeah, look at
>
> commit 1860033237d4be09c5d7382585f0c7229367a534
> Author: Michal Hocko <mhocko@suse.com>
> Date:   Mon Jul 10 15:48:02 2017 -0700
>
>     mm: make PR_SET_THP_DISABLE immediately active
>
>
> Where we moved away from that. As raised, I am not sure I like what we did
> with PR_SET_THP_DISABLE.
>
> And I don't want any new magical prctl like that that add new magical
> internal toggles.
>
> OTOH, I am completely fine with a prctl that just changes the default for
> new VMAs (just like applying madvise imemdiately afterwards). I'm also fine
> with a prtctl that changes all existing VMAs, but maybe just issuing a
> madvise() is the better solution, to cleanly separate it.
>
> All not too crazy and not too invasive -- piggybagging on VM_HUGEPAGE /
> VM_NOHUGEPAGE.
>
> I can life with that if it solves a use case.

I guess you're not suggesting using an MMF_ in this way which overrides
VMAs, I think the main reason Michael wanted to not use mm->def_flags here
is because doing so doesn't immediately change existing VMAs.

But we're doing things at the VMA level anyway, so we could just set:

1. mm->def_flags accordingly (no new MMF flag needed!)
2. update existing VMAs using (possibly improved) madvise() interface

And all should work.

The get policy stuff could then just check mm->def_flags & VM_HUGEPAGE or
VM_NOHUGEPAGE and use this as state.

This might be the least egregious way of doing this...

Maybe then I could hold my nose and possibly live with truly the most Evil
Interface in the History of Computing (TM), prctl() ;)

>
> --
> Cheers,
>
> David / dhildenb
>

Cheers, Lorenzo

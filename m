Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4856FB66E
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061206; cv=fail; b=F/esEi7ZTr7bXljt9VwkdRzXqk5B3iWT7WmvMnQx+0Gme0aPFtbx7haXFUPLOrmLbXSQwabgXNcJFIB4Y1QLEinQzGRodRQoV6On61pUWDRChvM/YvQWdg+aM00wY/Am3HcuMH7EWCON1vbFahE2Mv7eDL/hAEz0CzO3y4pKW4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061206; c=relaxed/simple;
	bh=N1EUmX3KwtD2qivhWcUZYK5Rd7KOu5CqmGa04D3gefU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fq1x232r/sKNUypHH12h0DNDf22wnS7rhg7/bygxrrgnaz2b3SAlj9xat3uq0SNvrTTDJ17lWwNBSCP0jFePHeKYXPTOYxTqfx+sir8hlqfMIfGUw9XiLNWI2KMawGZ9AA53OvstuigqKNfZhn37o0AMKjPY4BuOb464X8aGoIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NRm9y9J/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Hmk5Z7Ho; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NRm9y9J/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Hmk5Z7Ho"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CC9dCV027149;
	Mon, 12 May 2025 14:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=3ajl/xr3NQYHWkXm
	fYoWIjvAcmOZnZ7z3iCiCJ6TUyE=; b=NRm9y9J/XUJiopuVCn8l2hWlpu9zzV7x
	zEVq/mbTKbtyArIy0Kwalh9BDfpGZq577WmBtyFtovcOSli0h8dn5+d/PwvGpByN
	R6Hmvlh2darOKYz54nYYIzHSP/AeqiGpq5T2O+pHavLKrCChIidQVhQfDe3MscOH
	5j705dt1dFb7cD+wPAKF11OQ2G0ad9WXaTXp+UKeg/QJpIN2jsdh+5PCUwfx0nsm
	nLMQJyAtB1F+wfvrSwiEKKIUuYs7Bt9d4NJtglSTcOsUw2YTHu/mWccsr800/Gcu
	IfNDnIhasfPmdWMVNDrnkURdXHAdoZ2nJzbAc5oRwYbKEVQKJLMT5Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j1jnjpv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 14:46:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54CE2FIX001951;
	Mon, 12 May 2025 14:46:30 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17010001.outbound.protection.outlook.com [40.93.6.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46hw8dyp5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 14:46:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYL5NwW9sZCZzQVEnTWq4hjebqOQn1j0wv6i42HKQvwVgRnG8utUxnwjh7ifKxcI+s8M0xwGum3pAE21QAl7v8yx9CMh8vsqtvZlr1j74uMN7RG/3OcYiMNTk2Pp+W1OtqpC6olM3+1QS/rDpG8G4ugENUJEzxQlP1ee9z1a9KCl4pNlbSP77afNrxXN4x2V0njnp4kTXSTUJ0tPTZ3cKkzesElTZELuWe5tJwpDHmGXM+DZ5TGsl0v0hlK6Uz+jL1gGwXiOl+aDxpUslZ601PzawC/xm0q5cfDcAh5MJAU6+n4O68S1ksPOeI330FLUSxCC2bxXZivgOJJWbqnWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ajl/xr3NQYHWkXmfYoWIjvAcmOZnZ7z3iCiCJ6TUyE=;
 b=aKfUceLh7DByDuZQwnryRwF88Z7UA2vTDfM/cZG+oS3zY7br41pVEn3INAaNX4vyQQt1QMmaodgLsgL28mjJzDfjczjAHHxnCWIjnA2y6JD6sOv+2G5HsZesHSMDpk6pr1CPXHSi1aGD0IrVNdZ5N0TOc3nn6umZnLyPj73xcBDqgWJR4DR1IVxlWPwWEv++gt1YIQMKdmDbvchBJj0Gz5pFwGG1jK+2hwXc/6FiZqDmdVIUd8TI7oywdG8p86WK/a2wTAQDhXQpyP4d1gVhWHgQ9pcvrkm/aqHa/fQzqkIHClsdkDbn/Vvg9gT+A+8oz2sYfNoy3huhO5L1K10ynA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ajl/xr3NQYHWkXmfYoWIjvAcmOZnZ7z3iCiCJ6TUyE=;
 b=Hmk5Z7HorHnJrETQAaXNNqHqY2DFpDyzzGbhpwWMF96q67TvONRZC7Hk75NNw5Np1SJbQ/Eoy27+kBGkhv1OWB1J5cnd0f+HNTDwuGVHizdAKRA+fbRrDhVvpiE2++kvM0ZXgKHVvTG0Bl4UElEDx493kpNjo6HB3Wcj7OoPebo=
Received: from CH3PR10MB8215.namprd10.prod.outlook.com (2603:10b6:610:1f5::7)
 by IA3PR10MB8042.namprd10.prod.outlook.com (2603:10b6:208:50c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Mon, 12 May
 2025 14:46:27 +0000
Received: from CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90]) by CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 14:46:27 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
        Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] MAINTAINERS: update page allocator section
Date: Mon, 12 May 2025 15:46:03 +0100
Message-ID: <20250512144603.90379-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0164.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::7) To CH3PR10MB8215.namprd10.prod.outlook.com
 (2603:10b6:610:1f5::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB8215:EE_|IA3PR10MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de200a6-a1ee-4b19-ccdb-08dd9163c66c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s/aMPXwGSvLqlifMeo6bMahMpAM4PjgjD3+cKyGxW0WUbNxKtNubVU6EBJSB?=
 =?us-ascii?Q?mopolwWMQHLsnbwZMc9cnTJA8sxa/+aXe7vP6HYqJjxfVS8ZgJeKzIMb1FNl?=
 =?us-ascii?Q?bk24OV1zL9nL+d/OBII3s5Ti2L5Wmuhudru2Esdny3v7CJDVA+ect1fMuCPD?=
 =?us-ascii?Q?qECQ7P58U+unJX/mZ/sfpwlq3D+2U/U6SgIAbntx47F+XfhcRtVjdfJZOxAg?=
 =?us-ascii?Q?3+Mz2D6qZqXISYIhx6COXpgrsrGVdz3K4OyeB9/hjYCe356gMmft1bxNf4E6?=
 =?us-ascii?Q?YxtBWASKRTr2LtBWZzKHXOMb19IDdUiwgLVavepBTMGoTpg054uebCwQnOGf?=
 =?us-ascii?Q?71c3tOqUdC018Iq2yBFonU/XVTUuyQT9Q63+DNo8NxxVCsYtIkSn4TZRR7nx?=
 =?us-ascii?Q?AGOoUq8CIQ7h4tOmDBmidEVt132Zz2cjiIZn/8rKxUjqE/sXBB2cGYeDSsR4?=
 =?us-ascii?Q?JiFj+HmOT3mADS3iXAT5drmuHesbmno0u1meIlB1POroJkTcTBTt+Iql7VEK?=
 =?us-ascii?Q?KkAqZyPPPS+wa5M4m5108GHssgzztMfP3J2fpEeopbiDUuDUg1cOAg721ohl?=
 =?us-ascii?Q?1TYHiA3oyv37oPaK+tVb8BjhcWrxKVvNHFRDBT/WSo/VU0krsT2YX1rbrSda?=
 =?us-ascii?Q?fU3TQS62d25v7dHaWLFQJhtYMSsCvOkj9hfzBx014IeigRVDqOM8Hb6m2Yaw?=
 =?us-ascii?Q?U+8ePR9KA2fLlYlSsu60Ilevd1y3DGvgiNJyENS200QUavZREyILs9rjdgRx?=
 =?us-ascii?Q?pITrlUGYYazHXHufZB5A/3pJu8ZR37he7embFMg3HcCP1YHe/4VmA/v0BKtn?=
 =?us-ascii?Q?PbGBklgqc7i5CUa9yQrB0ZZ4C3NAVVlI5Bxww7unzoQ88xwALzMEi83z8U6u?=
 =?us-ascii?Q?pbbL/pg4XOVI9b9YUmfMgjJoLufcVwztiClplmDKFZcYlyXPEs84SPLJlFO7?=
 =?us-ascii?Q?QK4ATz0qtPl2TboNbMRYrUOPfbelaTCvnfdr+YUOEGOIc1D/x3ENXOR3FD4x?=
 =?us-ascii?Q?RuNVztoB5CWI8CPScSCZ7WyCUpXGxvu4EtxCvda7xdoXoJJWWfFFoB2JEyS8?=
 =?us-ascii?Q?hkeD+8aEUn/pv8PHPmlvSEjzvagVb8BTPfBnY7jujip8bcWZaKTMbxla1CSY?=
 =?us-ascii?Q?5nBIY57COPGgqBxqC5e7WF3mZiIEYYbgQlCsvGzDpH39ORfIVUgG3YUEuKTH?=
 =?us-ascii?Q?K2+nMI3/35W6YmDX7jMxTuL/VL6455ifZoh3JxvgXkbjZg01n84lyj1QujSB?=
 =?us-ascii?Q?BePQ9s/6vPP4UNLFJO+qB/PgNqgPwkfvyEJ4T0uuIYCkKGdFFVLDc45i0RCV?=
 =?us-ascii?Q?JEWC0rapz0ed8OQy8O4gPn+5yeAIr0shsQD8jaai9AUhfrcG+MIutmqjJi9d?=
 =?us-ascii?Q?LwKDzO2/OdIwpD54MXuwcBc5WsZy6cddXaK4EoOitJTeovIAP5p3HRu6Vswj?=
 =?us-ascii?Q?PKML7Iw1Rcc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB8215.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F7smWdX/NEB6MaXGm5YjzL90RLz6koutJC0T+BzbkYlVEpD0LfjrLpm4y8gn?=
 =?us-ascii?Q?mxRsaE6OsppiW1Vv6oVQLFcWF78XFKXsdMOV4Q6Qoz8O6M3S/xAV/jfK0PuC?=
 =?us-ascii?Q?vd+5lKqV03qRbR1ylEfqfif6ya5F5d8G1y80Z9Dyzn8lyMbes45lYlpt32Jl?=
 =?us-ascii?Q?56jv7ZH0itu7xRQ2+Kvq0x8oO/rdf6PB8a1ybXbG3EZL6tU+DZBmK2loNVyc?=
 =?us-ascii?Q?nUnkAq8OAc3Y7VmzsizCNjhZSW7qPeHTC0GmZmg/JtJl1syKLf2H6gp2q3DK?=
 =?us-ascii?Q?yn3BblfOm6HvoRD3XkEJDWB8oqPLDLrXV+ooqY9FBNk4sBCAnWIza1zyPu9R?=
 =?us-ascii?Q?yw4Ei1SZqCX5qs8ulRP47iwFoeCZxcoCaoBdEE5QbcrHxUrGZntRUziMGu8k?=
 =?us-ascii?Q?a2FP053ljrPPdlC5uCX04PYnu2RVXiebOPoI+KepGq+atSKI0VQU5B+vkkAj?=
 =?us-ascii?Q?A+PKjf34W6ucSAxg4YpTl45fiMy7XqsWGqQL7HdjXBojiuXynuOB2nJ+tUAG?=
 =?us-ascii?Q?lADMSnLj9h8MdUAcT+sLwTzs0HYDB8qH/CXG2XC5qfHDR8cz79yQUDhHyIxw?=
 =?us-ascii?Q?sbTrfD49onKbALrIRbO46WituFtxZocr5nJ1kTUUXKFPAK2QWxHZG4O+3GY8?=
 =?us-ascii?Q?iCly5HroQzLgvqCXPyESXRSNDpupTTPI10Qp0vBjnP1HSSwaxQyv8F7fTik7?=
 =?us-ascii?Q?0zof1/HBxKr26PoekEzxHyJUjfcNu68x7qb3gjcEdo/G8oavvP0znUKM8dUE?=
 =?us-ascii?Q?xGyDUjCpA+NMnlEDYhyTAbd3urMWkCCenriHW+dxYpmcSNKqCKp6PL7r8OPv?=
 =?us-ascii?Q?uKsc2QqkM866ycjbz5UVZkXvxMz3DDv6p/rShdOL7Qh6i10R7xObeYAoJhqZ?=
 =?us-ascii?Q?keNa7dOhyFZA7j/7MskY7a/+/YlMsQPx7y6ujmAfeR1b9S8DRnv43yMtcXQi?=
 =?us-ascii?Q?muD47yGMLNDRTfmTy8CUZI1NXBMRXpxzCPyZLEqy88AFLYRsp7pekfL99IC9?=
 =?us-ascii?Q?V5dNUrOlJdFWg9Ug44vbw//k3bnYfryGpR7mrbzx/2+ZqDezs2BM+qyUlA/4?=
 =?us-ascii?Q?XmezB6gL6dOCj5QfF74O+jpn7hxKxMniyicGp7Te1lLsvjQBnAAQ4KKvS0bN?=
 =?us-ascii?Q?O/2UJVGHT6sZfueiWdXlAUKpSch1J8t70IiyEKCSx31gQB8bTq7HxtiMpsNO?=
 =?us-ascii?Q?7hq8XW70cG6GiwrbGsP5d4RpWSO4cXHXek1YyNpwWzUR1GKtI1p6/DfRlxcc?=
 =?us-ascii?Q?ZpmgVRDrypCvmHyIbCepTohyT/B+344UIlfLRLC/BzAFH6Bkt1yVuWWX8Ccx?=
 =?us-ascii?Q?oN6GiaCK0Nd/2MAH1FiBwy85IoK0U9JuKRKmAJzYU1eOeXoQI9MdldM/oiOl?=
 =?us-ascii?Q?8wE9OB5J7A6YnguS/ybm7qIyEPca+LmAbkPpi+NUzO5/1ATObK0VoCXVjd7B?=
 =?us-ascii?Q?59iq/9J1iOPiPDCtCm/daXlUoyqNaCILZcQQ1ByBWuT0ZogJpoVxeQkGHyCT?=
 =?us-ascii?Q?ah1ONYdV87haYx44g5WBSYEo5wWyzFcMdXAcLkTwJc9MJpXGTkHIx+ZcX8or?=
 =?us-ascii?Q?L7ImB7RIM//A37cboYYcA5uGW3QJXQyeGh1vNaiV6Xy0O58YRg0Rtd7UahQI?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mMPkbmuJku9cPyNW/GqgXQ12hawpF4SpXp6EI7KNytdcS8a49r5TI7ZDpVsodXWCFr5wlkz9GeCW5jMzDkXSQEzs2hGo7dFxDAPiArcKeFlurJ5nL+k7ExKFSBsdoOZkhpey42MUZYW2nkcZovah1iko9cAZHuJ8MncCBvBzKHeWhb/i9q0/iHS7zH5lJNcQ0ChZ2jRbRkKis6amHCNPgfWD6nlXkOt7EWOY794lEd3ZRMHLoB9X723zntBx5lT3OEIY9jhypeYPxkWYsfNpC0UvKu3zz9hR076h2lCtiWdbfowtbqSO6wYFwJCMzMBNZBl9d+eZBqcKhHnxvgGZ37Mlzc1N2WTWIri8AkzkSI0ftEYanP1w/ZXkH+20kWfzq1bCXnYU0v6PIGGeZNOfTphKOskf6t4BtC/doTWC4p5m6+wsqPFf2RKAVGLO307/w8WMvYW2sR1SVBw3lxR7XJk/gT9QpuRyNK6CsIFSxp92LVcXGK5QJ/qw9laZOYoh14yKjEGyni1EqsUxCfeYg0UhgLQUuai6sJXTM0MxlBxq/tRuEIopIOXOjKqXGsitWyj0GFp5o/Ap6R+AB0r+RjXW/mfdKqdjI365giTrmGI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de200a6-a1ee-4b19-ccdb-08dd9163c66c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB8215.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 14:46:27.4135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdefyp+uUTSTg2cq1n7wWQpRx1w3g5iG60323UJIiKJ1mY9SqN1pT1HH7EIf2//Bx5yohXCf7nCMv6AJQ3CaC2/4d1kxDIJzWvdWvsD637U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8042
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505120153
X-Proofpoint-GUID: OW3Kl70NlxHTr8m65FvsOcl5z8lbw-AW
X-Authority-Analysis: v=2.4 cv=PeH/hjhd c=1 sm=1 tr=0 ts=682209c7 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Z4Rwk6OoAAAA:8 a=1XWaLZrsAAAA:8 a=iox4zFpeAAAA:8 a=ufHFDILaAAAA:8 a=Ikd4Dj_1AAAA:8 a=37rDS-QxAAAA:8 a=wo8tIlNn7vUmmUIMTZMA:9 a=HkZW87K1Qel5hWWM3VKY:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=ZmIg1sZ3JBWsdXgziEIF:22 a=k1Nq6YrhK2t884LQW06G:22 cc=ntf awl=host:13185
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE1NCBTYWx0ZWRfX9SEa5RAqqe3+ aujip8KLxxu2jeM+IyfdiJdgvZ36NAdzRf+xaaa8PYcYSX6EpgDEFEvc25iIHSZqIURTAhZ/km6 Q3OFsMUmw9rVjgTTXOWwZC0aHowNj6WMzapSHWPNcSdhfT1YlUWpyJV4c0YeYh7CfIqAtb78lqi
 IxRbNTGb32xH1Zh0HHbVeCSe5XKwGXOwf0VB7IxO3FrZOXFDriWLZMU8t726Oc4jn9+S6jSZqJm USsyl+FgjakafEQuzqtB/pFnEeFhPI85L2Nrhf2rvv2GiRKRKA/ewW4j4ADO83hbkPs3zpqpZ/7 Hd+5PfYFRtMaOEBR10DVavQOwTqxOq1OZ1Bdmu9pWwmVABMrmoy45rfSBnbR+qPQTaqdehzcfyx
 jBZIokT3NohOmrh5/t0yJ6qk2ahMzFmhluZ0Gm7Dz+vnJ8O5mRaRpAWx2mupBdg5ute9RN6R
X-Proofpoint-ORIG-GUID: OW3Kl70NlxHTr8m65FvsOcl5z8lbw-AW

Make Vlastimil maintainer of this section (with thanks to Vlastimil for
agreeing to this!) and add page isolation files for which this section seem
most appropriate.

We may wish to, in future, refactor/rename some of these files to more
logically fit what is actually being performed, but for the time being this
seems the most sensible place.

Additionally, fix the alphabetical ordering of files.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
---
(sent original without mailing lists cc'd, resending...)

 MAINTAINERS | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ff5d3c40e749..b18d149f4450 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15578,7 +15578,7 @@ F:	mm/numa_memblks.c

 MEMORY MANAGEMENT - PAGE ALLOCATOR
 M:	Andrew Morton <akpm@linux-foundation.org>
-R:	Vlastimil Babka <vbabka@suse.cz>
+M:	Vlastimil Babka <vbabka@suse.cz>
 R:	Suren Baghdasaryan <surenb@google.com>
 R:	Michal Hocko <mhocko@suse.com>
 R:	Brendan Jackman <jackmanb@google.com>
@@ -15586,10 +15586,12 @@ R:	Johannes Weiner <hannes@cmpxchg.org>
 R:	Zi Yan <ziy@nvidia.com>
 L:	linux-mm@kvack.org
 S:	Maintained
+F:	include/linux/compaction.h
+F:	include/linux/gfp.h
+F:	include/linux/page-isolation.h
 F:	mm/compaction.c
 F:	mm/page_alloc.c
-F:	include/linux/gfp.h
-F:	include/linux/compaction.h
+F:	mm/page_isolation.c

 MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
 M:	Andrew Morton <akpm@linux-foundation.org>
--
2.49.0

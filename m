Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4627822B8C2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788823; cv=fail; b=ecIgVE60bjv5JzgoidiF8wgMtxHpbPtR6dnN9TbuFVDmemkuHxceqzuMcYJY8267M2YwvMf2rt/3UVfeBC4X6tHY/C/BIfoTdOcN+APvUiukLZG+r5N6ze1T5PKcZq+E1Vv4HHMuUZsJ+xsj4L9SpKPhJD+T6rOMDtwm4bqe0G4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788823; c=relaxed/simple;
	bh=bg4GOjF0d402oQcXShZbf6a10Ow2ESL734ub5JS3WGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PvQ73qy/7qSZF8XtqD1yqtQnaiXOEb8rVrucosTM8vlFZi9P4SRnfXHvZzA3OChcQTeBOMli/td1Z80JcKSH9Uj//oLtRXG0VJ/F8XcjL89SFdRT+xUlqZvfPC0xe3v6tts9W2yMysPr/X/PlAVZFxIE8Mk0nWxfvI9NfJf/xXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S0zZBdvI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YOPuv4eX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S0zZBdvI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YOPuv4eX"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FMMuaL009190;
	Wed, 16 Apr 2025 07:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Wb5LIe+MznefjGtDjX
	xMrzE7Uv/E3+difJzTQxL0yjs=; b=S0zZBdvIjLUA4z2sjUAnuC2IWb9qHL2eH3
	InPkTGXSrGYzmMt8X4VTGd/rr8wYplOnjvAsKfSAWlnoQaSmJnt+3mDMu/hQCc10
	V2AQCnQDWS+eu+sRJ2UkFPxD5pMAhaAmorZKT0GQkM44nU355IS2n6fWd0QIfO58
	zrM0iVFsGwcFMke7fB8pqZB2iZP/7pl1PKGZAl7zAGvIXkQj1X5ceOuXJkj4VEjS
	JBVm2nSpp+fF+SbJQ10E65P8ZOviIbxkGyntIjYRqmgR6rZjlDrfT6mYJHsMsPAh
	CRmS12Rl0lwsjjk8FPbl+j5oiTdvmnQX9taLgh7EMVUdQEzMVXRQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4618rd3bd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 07:33:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53G7ESvG024841;
	Wed, 16 Apr 2025 07:33:26 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010006.outbound.protection.outlook.com [40.93.1.6])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d51fhf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 07:33:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQ3AR+rudxi4lD5LCDaOu9ETUS0t1mLsiWe4XUy5kIO0dBocI79qoUvzgD0l2BVDA8avsifivneg4if+XK5IfNOgw8lmS2s+7ySAHFYnva/b7HdJEUHYNXQw5XDDZaIpzZ63YvryhOlMmViRSCLTDe1QABnvoFmdfKVlddyh0Y01XCGJz4/n1uYoscmXS0hLffjuJgRmpUu7nshsswvdgdgStOUxH0iJkwUouIDLIa683E5VJpfKmbKQaB7sADHH7+77ZffscGdi4XV4tmNVQFvgKVYd7evXXU3CYk1QH+NwU5+Wi+uTjTvEKuVSiomjx6J725VbdQ8pK9hfdjMbOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wb5LIe+MznefjGtDjXxMrzE7Uv/E3+difJzTQxL0yjs=;
 b=Y8tzfhmQNxQceKHAwrkyMf7Yt2+iWUwrlbVNUqdax9hSG6J+VU7ePo0kO+l3yfHhiC6GzWNbHQI/VIEpLYbEFXosPcc5DcSgF7dA7ctdOOcotAHc1UwYQ2XsDQGz2dPh7mNtS6fYjY9EsMCwjs/eMDmh73WtOiVwhwawdmU7o7TKeN+nHPXffFtWtb9cKkGmmSJIh1UAMluLgiHlXmFcFViQaeqh9Rwl2Q7JEeXx59pak+IYg9GGggTuwBiFF4PVt4d19oV95OtHl6cZ06JqJq1+mD4pLMW8KmxyjzkysHnrbqHfJVuCo4L8g2bNx2O9fZnRRSiMpZCMDypNr509gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wb5LIe+MznefjGtDjXxMrzE7Uv/E3+difJzTQxL0yjs=;
 b=YOPuv4eXnOJ4OWnjcOuf9PqB3VrtTsFDeGVED7Tub+T48fKLHaCaeUSBN15JPTeuezg07q+PdI+iCBGlFzZq2rO0WqvX8BZi0fsWiT8QArkspE90tyqhtZS5ORfeWGEG/9z7UKVV8i/AjZNTC8LiKLdx+uopfws/T3pwjf8KULc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB6219.namprd10.prod.outlook.com (2603:10b6:208:3a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 07:33:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 07:33:06 +0000
Date: Wed, 16 Apr 2025 08:33:04 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        SeongJae Park <sj@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH 2/2] MAINTAINERS: add section for locking of mm's and VMAs
Message-ID: <039f7b19-259d-44f0-a96e-618240317f73@lucifer.local>
References: <cover.1744720574.git.lorenzo.stoakes@oracle.com>
 <0722c3fe0cb4c1e54ce01c7689ce4615ecc87e16.1744720574.git.lorenzo.stoakes@oracle.com>
 <00ab4959-4fc3-4e2a-90aa-25a009b8fea8@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00ab4959-4fc3-4e2a-90aa-25a009b8fea8@redhat.com>
X-ClientProxiedBy: LNXP265CA0087.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::27) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: f00f6b41-3cae-42bf-b7bd-08dd7cb8ee07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zIKgp5iBQmbKcGhjK4VCCDjBi1rY/Km0c6Af9E8JY+//NNPEWlZjkNRsq+LC?=
 =?us-ascii?Q?dQ2fqi+BMTO+DB813ZBCfqDzqd0zUINy/enM47gj+JTtJWA8uJm8qsHrYesY?=
 =?us-ascii?Q?muZMtXGNhrm/Wkn3IpsynBKApdz8VX6dZwSacwUqu7AXxxLrdYzherLz5f2I?=
 =?us-ascii?Q?Dhd3ACSSF6QxbdQg76UYlYm6J+HqaylX9oRQlTEBDn/TAz/1D3Cbsn3Yq/wE?=
 =?us-ascii?Q?FKqD5BnCwrpjClEUDfN4bPVGqK97ZF4sOr9crp2GX3tiuT7V5SBq5CyaoqlO?=
 =?us-ascii?Q?MrcYo6Wz0Cn7ol5MZpuWLWlY9e+Dk9dBBBEPEJpKzRpwPsyg909VaAp0aqpz?=
 =?us-ascii?Q?oBAxq8Of4mlSDOAV57CrRU9va3BvCm492xYjJRynBXCkVjf1AUc11cF2t0H5?=
 =?us-ascii?Q?WcA+hTeuWwg909LhGv9we2FoJGRN4mzrJkRAXlApZnWJgy2P50wn6mozPgcf?=
 =?us-ascii?Q?tPre2w7H+1v5LD7E8wMgtnspD2rwOfQjN9Yu1Fy3HZX4cd1AT4o6woyWtvNC?=
 =?us-ascii?Q?gscO6jMXsaNmV0yF0ZUaMrtMrw0GxbXufrMHU7YR+6+WVdvVLlIACQ51FVPs?=
 =?us-ascii?Q?cTs9Ge8JXOZCw+dB+ZoDWXc8WjXJMIDfJr68g02L/5n+y180he9ozhR746mK?=
 =?us-ascii?Q?dOg4HO82pNnQbt2I15FzsiHnH/7w0+oQ/MfB0L8GZFlCjlUBxk5IemFaXGSl?=
 =?us-ascii?Q?mTf3PJlnrQvqSCx9JnUNlgsF/hFZiol75o3/XJITM8AK0li0IBisqUDK4+Xa?=
 =?us-ascii?Q?SRcQ7lY/DFyG4VvZ52/P4yJtU27pqEEV06lCCNFheQK3Bh9rouW0bieOOAPT?=
 =?us-ascii?Q?rZFQveQ/kW7KFHvb9kRQ+KAa5TptGtIOeGZqP4VxASZeVa3VCxbkRN6nH/Qu?=
 =?us-ascii?Q?5FmH4Us8KrfynDHfUxKTqGexM4mvqFxQruCi0WXdsFxWeFfHov/XdM8uCAFo?=
 =?us-ascii?Q?7OJlgLUujn8oT/LXNcjVkEMrtcJN6dtkPERc4KE+AtEmVVjfPU4Qqn/bzrIe?=
 =?us-ascii?Q?9Bnxajf2RdBM1dJe2C2GkEmDRrx2h0+TUUiuIfjJMci6dUPSFYBz1snCB5Zi?=
 =?us-ascii?Q?qd3pKuUQYSxp3KLqwvX7KnPzlXYl3LFnKsfiJySHiE2c86d4sXXsX7o5cav7?=
 =?us-ascii?Q?C9pIpB+axfpaV58ULokorxli7peFpt+qUuxahYG8AtNs9si/zQSGdOreQoLF?=
 =?us-ascii?Q?KsbxKkdvB1VNhY1viNiit92/MoOYLSRihKR9+cTcD73lpmOHSON0JbRNvu9h?=
 =?us-ascii?Q?jc/mSJoABhjCAT0u2qUmL6xmMjb7GDij3SRNZy6+f1LO/jj1DHYtWxCZC6Qg?=
 =?us-ascii?Q?V6YkOq8vWig4fzTQ0SKaFSqDLsswL8usmNy+w/SUJB264C9ztuKia0AZ1+5J?=
 =?us-ascii?Q?WKpuC8s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+ibynP5iX4s7y+SwN8xY8IwLNVNt5L+hhH1G7lAyiULOtBqr6UrVyTgjSD89?=
 =?us-ascii?Q?J2DbdD7vgBZ99V4cWs97FeMYVm2kykFGs1z0ZA+CcQAB1JxbN5tSx1izqxI+?=
 =?us-ascii?Q?wb+kKMRPcbl4kaG8IEgQSWfabloJjFf4JwkxuZXc9G7Zf4HrdhtgrIg4htrh?=
 =?us-ascii?Q?nqkSD+j1itqQ1x0bqzhJoO+hQvVjh/MXoTm7qoWn0u5r2g8XFgqp93GTkNJx?=
 =?us-ascii?Q?KmA5rq54B/iUKxQjtzHJaHxMcPktmfEHzEcyQ8gzSleqEltPJkrn5sxY0fH3?=
 =?us-ascii?Q?CMcavOfdOmWYot4PaRz7vOBTciS30X770+fu6/r5ZRf9wIYrNO9qjj3COfBA?=
 =?us-ascii?Q?ehvsL3L+XqWk6dMESNyIpjfxhY/FUsYh1bhNQ1q1Q/uP/tyJ/UctQrEk3/j9?=
 =?us-ascii?Q?xd0aKTVqMo3oCzCOPrvg7viGfqz+AP5RgG+gLh7h/bR8wla5M0+6AqpFO0ML?=
 =?us-ascii?Q?sHvHpg7FDRXzM7b0gBlWHETGKsp0yhnK9DCzk0+EYCwfM70Q3qlhKrdtka4X?=
 =?us-ascii?Q?Ufr2ZPhjN++6gCR77697H2GDOG+0Mt/cuFA2V7wlm2idoOEIpIGKNdh9fgdS?=
 =?us-ascii?Q?aa4FOAMK6VyPaY+0yrftNM3HKDj9KVczehsmfWryRMiH/d0hyGaWTVUmWMYw?=
 =?us-ascii?Q?/8DIPjO+ubazEKiXHfzNEtWrVNRtgsY+wKJBi9bvsf73sEtZCutIXAIV6ZEl?=
 =?us-ascii?Q?c8JXoeWQ2SI0K42BTKJUedhYDgD1uIfjm9EVpK57es10eq61N6lrVeTm1uey?=
 =?us-ascii?Q?pblQTcy8h7CmryeJn//mhfPQQmoBRttqiXBeXJiJJSIa+3B4eomMBXclVlWN?=
 =?us-ascii?Q?/FDH8IKNUadvy4LCE/VnZu/3HMwu8MAUFTM+YlbspT7PYng+klO9P0R7VTmA?=
 =?us-ascii?Q?Ti9OjcjC/Uxr4J/gTRPmobl74gVtCgl8/g8BWUHQfqFTxEhbXuUwPLSk5A32?=
 =?us-ascii?Q?myxj4Ha/GUk6jsuPJ/l59jVq8I7pxwp3pSZL0C7edukyNlfGXAmYG8N68pU2?=
 =?us-ascii?Q?PsgsUw4ughd5iGqyvOOMxOnstyhqUm7y+Pgb+fiKJRfVXOnXUbNx49PmFJ/K?=
 =?us-ascii?Q?b5MdFl1M+IX6ytkRKsams7kjNdpVMUdkPovvRoJFmIch315GNPDG7b3O5lAT?=
 =?us-ascii?Q?7UOnKSlNP53APjuVR3gmgrd8Cuf8eZVZD5EbJOJ0O+9QAXXdbIyks2XAa9I5?=
 =?us-ascii?Q?tQx78UxzaksBoQYmW2Aaw0Ef3boecJV9PqaNA+pfUd0VeKVOVQiR1j9ouUzb?=
 =?us-ascii?Q?nllv3gVqyOBLU9xHzb0cDoyFc8HxUe0tvn/Kn2/5k3jEHSscJYcJQbiFXQuw?=
 =?us-ascii?Q?27vqt4FV7xiTOhjW+hTEqRP/kixBlLjMQdrpqmhf9jLv8CgUHsLEQ0it1kPd?=
 =?us-ascii?Q?6hu2ivDSMuoBObdK65UVW29c/vT7ALMfWU4XXArVewt6NzGhpoT1rZ7qL+0B?=
 =?us-ascii?Q?bwlgYazpWD44P8vbZSRFiKT7ckvwavK2IFXUkTsMPIomEFLRt9tXz/cFYBI7?=
 =?us-ascii?Q?IVXcWp450nvXBUzVK6614es36s71VFWfxq/18ou1+dYs47d2+RBWJZTAoejE?=
 =?us-ascii?Q?lF/z0Aw/huRSoAMfeDLYNIZRSs1m0OYY7mZnQwQeI6fLXOan+k5E9t5v7Atz?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o7zVHhSrh6APMiWZz/0fJhhGc69CogKIRpkWP2/pvq7D8FN6wfRXP6EHr0n1g/k4kwULdMXllwbFNMHbeo8P6dBpJK1Z2Sxq180KbHD0Ufc12Lvh16TCaDgKmfCMxQAaEY0g2/hKu57HS1o5fVR1P1PUGS27MzMxXoFXLB3fOoTloUBsKdkLAKFAEIqH2gNwYllH7ViOO1PHXvNH2sE4WFqZCMX4YOK+/GnBIVtrDYZL3L5Pr449X4EQW2qA7B4A9C/8Cew6BDqHZHkGWy04eBxsI5w7TfIwZwTRMuDQNbhm8u9ORfIbpllMI1lsh6KgpzWe6igXKQd3uzxMAMHsPwJh/pB0/SReA5u/jDPWYcv+x9a8i7snuKdjviU3jf46P7/NcQp/aYo2uZUMBWvC7fiIKTbE4bIQ+KdAxzUtBe129UcIpg18/o4cV6yr/ZR5Jm5CjVhuJ7WyiO35coY6PDengVPwVvJwv0ec+ZsQTQlHB74soLlEGXFawksDvhJKNaauO9xNsxW7Gvwn+WZ7wZaIBjPPA877xPtEi8obpOfXtjhc6KTYxIrDpxzt11JTB8l30hpDBo9jpAEAmqO6n5Qg8bX8g69U1pFeDJVtLJo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f00f6b41-3cae-42bf-b7bd-08dd7cb8ee07
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 07:33:06.6522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D58WAxUcXTPh8lPPyKpCfmHEzLkt30q+GNM/v10KFw991koKrVzvHqrAXnG3CERWZLARMPO3OdN0zPWQCoTyXZ4w8H/7NDWg8juJL80ipgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6219
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504160061
X-Proofpoint-ORIG-GUID: TY4LFsSL2H_SCihH4WMi_NInt5q_bnEi
X-Proofpoint-GUID: TY4LFsSL2H_SCihH4WMi_NInt5q_bnEi

On Tue, Apr 15, 2025 at 03:25:09PM +0200, David Hildenbrand wrote:
> On 15.04.25 15:10, Lorenzo Stoakes wrote:
> > We place this under memory mapping as related to memory mapping
> > abstractions in the form of mm_struct and vm_area_struct (VMA). Now we have
> > separated out mmap/vma locking logic into the mmap_lock.c and mmap_lock.h
> > files, so this should encapsulate the majority of the mm locking logic in
> > the kernel.
> >
> > Suren is best placed to maintain this logic as the core architect of VMA
> > locking as a whole.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >   MAINTAINERS | 15 +++++++++++++++
> >   1 file changed, 15 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8d834514a047..ce55676a16a4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15595,6 +15595,21 @@ F:	mm/vma_internal.h
> >   F:	tools/testing/selftests/mm/merge.c
> >   F:	tools/testing/vma/
> > +MEMORY MAPPING - LOCKING
> > +M:	Andrew Morton <akpm@linux-foundation.org>
> > +M:	Suren Baghdasaryan <surenb@google.com>
> > +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
> > +R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > +R:	Vlastimil Babka <vbabka@suse.cz>
> > +L:	linux-mm@kvack.org
> > +S:	Maintained
> > +W:	http://www.linux-mm.org
> > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > +F:	Documentation/mm/process_addrs.rst
> > +F:	include/linux/mmap_lock.h
> > +F:	include/trace/events/mmap_lock.h
> > +F:	mm/mmap_lock.c
> > +
> >   MEMORY MAPPING - MADVISE (MEMORY ADVICE)
> >   M:	Andrew Morton <akpm@linux-foundation.org>
> >   M:	Liam R. Howlett <Liam.Howlett@oracle.com>
>
> Sounds like a good idea to me
>
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks! Am going to change this to make me and Liam M's so we can provide
back up to Suren when he's on leave, are you fine with propagating this tag
to this also?

Cheers, Lorenzo

>
> --
> Cheers,
>
> David / dhildenb
>

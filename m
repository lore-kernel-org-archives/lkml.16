Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5DCC8FE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744659110; cv=fail; b=RdcFv5Ym9mvSLnqBQWIwGddQkEAzut/KkMvjfsHk4bBQK147usRIOEbAXtnqukj/l22Nt6EXjsFDT63xYKAY/fZ5/rwZ+ZMjA0M5rW9Wy2A/tNHppszprh5QZthncqS1ldsrOoeVcaqFZX4v+CqCs3LyICooZwY+J5Hy9tB37AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744659110; c=relaxed/simple;
	bh=G0JLSsNSTBwpFingxpPp84YO4ZY8dQd/JkgmxpchPSQ=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=RoL3p4PdygZdgWgsjlRw7ys+DU1+mXSsHsNUuBpD3ZbJVC9F0DkQmuQcHGEO5KXSxEb13ogNTRd+iGq1i6bn6By9M6nYJ1unwlMUyzF1mjvt4wopIP/kOJWwGlPVqFLFgr46kI84ELlrbaUexkiL1QKrukcITceFLmzPtpsqqGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BPqEqPbF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BV+MKraa; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BPqEqPbF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BV+MKraa"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EIlavi031647;
	Mon, 14 Apr 2025 19:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Bctv51ZCU1nwJh3DgP
	r+qeZGpbq26et7uHmqxgfVdYY=; b=BPqEqPbF5J/42FqLsC7HOWbxMQKl5DIs3P
	gdrax8A6m9owir+eXqnunV/j6M4ybUCodErkt4oIjuJLqCGp5Dw4yw4wOi0PNKmq
	1bYfzvC+cBlCxNVHYMkcHbJ2ELLWwY0OTbyCeEtQikxVub9T63vJZUZH/5dsT2QG
	f9XyIHPbOSKNUTYnb5VQs/5/1C7BydWeoeZk5DoBMMFxd7+WlwxPeEwzXasoPYr5
	qdfHYQmbVxXVnu97z5nNF68aqBwZyXqPlsvC3cX0LnqxbmFGYAAqllPlNZaIt2ET
	rdEqDVpoBvxOWMHgtXBO+evOjele/bg3/Oqdx+cq+PDQgsBld5XQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4617xm82s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 19:30:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53EJJl76006587;
	Mon, 14 Apr 2025 19:30:12 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazlp17011024.outbound.protection.outlook.com [40.93.14.24])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d5u6s0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 19:30:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVrx3ipwkAReLJand/IPNg9gdayqjx9AbY5Qh1N6lfAX+YZsE78q9FghW7lN/WovEBC98/zM2xaJ8HUurXVx207NWO+9dAnMb4Equm+KXr2K5Un3woXew2t/a2csSRpre5LLpBH6Wx5a7++8pPliDXysdCo1IfbnRWil6ar+f/f1oFJFEmmN/2s3l1dLbkMNbRSTBzPu5jAUA+vqN1ePAIyYHiYxunPO7zxLRwVJf6/fMdn7/iRTBuilQWkipKTZLfybLLMqRhPGULN3/GzQbPuT0mGGbaveHDNFOkNBsAbyQa70F0GxiqlZJa3se6LbrbiGXbZuuHroXaP72vU+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bctv51ZCU1nwJh3DgPr+qeZGpbq26et7uHmqxgfVdYY=;
 b=uEbr1Sz95waL34lWBB8q+Wd1+mQQWLlRwModYP5sbG4wRvoZaA3jCiV5lFWyAfOlsfbu+g8HduKL+ojZ5LD5qlRz5HAAEBVlBkRGEP+FDZL8jygFqQ2NMJDExQaugMMQehQEOpJMJ7ZZ1IpA6hHtho65uKwHhhEY2k9xbbJHV2vL5+tst/enetymEjaZrC5vT4Uy9RzXnaOGxWMuqFBPGA9Dxnu5uPGItWuo8ZGOYgjeKrZfdQ+vUyYojS3x83EZBPteaxfqnADvbAQdlD9D8Np6FjwxbUOd0kB1kQFyKn7rry4VHtw5zHQMZ9L/xsuJyCQwgUcPagT3CXXAzmKC2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bctv51ZCU1nwJh3DgPr+qeZGpbq26et7uHmqxgfVdYY=;
 b=BV+MKraaywCzJ0gckN1hfivEiPtg3qKwkMUz3o1HGqyrAq6RVAkCHJ/6osu5S6W4N/WJKx/gkxpDMwyOad1sUS15MuKVc+fVU8jXnbhgLZHIhNjFIyOzgWSNlKa1fPSksh0ee9hDmzlyKtjPCrHhwO0UnuBWnQf5LU/vXjxlqfs=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by DS7PR10MB5167.namprd10.prod.outlook.com (2603:10b6:5:38e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 19:30:09 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 19:30:09 +0000
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <Z_yeeOAVqOdg82pA@gmail.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, luto@kernel.org, peterz@infradead.org,
        paulmck@kernel.org, rostedt@goodmis.org, tglx@linutronix.de,
        willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
        raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v3 0/4] mm/folio_zero_user: add multi-page clearing
In-reply-to: <Z_yeeOAVqOdg82pA@gmail.com>
Date: Mon, 14 Apr 2025 12:30:07 -0700
Message-ID: <87o6wy35j4.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0093.namprd04.prod.outlook.com
 (2603:10b6:303:83::8) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|DS7PR10MB5167:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d7292ed-3906-4132-95d6-08dd7b8ac490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+/BRFNv3inniljbrfqi+kLm/CA8Sw8aJRG4OoRf202H+yOHSTU4K0V2RIRZv?=
 =?us-ascii?Q?Zi+2bhDC8eIG559OnJZaQVpjkxHaIItyCieCLXVy0Up0lcSve6Kqd+iwtkWv?=
 =?us-ascii?Q?CBz6nSPwY4Gis/TrFFz8yY51c+HOe2GhLe2nOHHOMDi6JCiiacEJAn9dM/h9?=
 =?us-ascii?Q?ix9txa8XYNdoPCgqS0Ski+voJIr/269GOuu/an+Ebk/Euq44keJU54+UznVc?=
 =?us-ascii?Q?7rLBwsdYanbrEw8+PuNqMLS5Y0wJXUWczLaGyJFVX222BCi4nDXqQzmvqa/a?=
 =?us-ascii?Q?/Y6uaV5QxcANN2VifbPWV5/ziFxQ64fJee5rd8oBOwE0pWnrJaVVqo5Ug1be?=
 =?us-ascii?Q?uNaXcWdAkczDEMpArh4N8+ZpdgFzD4EvKhS28waYCYzGzyq5is0sSvG0V4D3?=
 =?us-ascii?Q?dmz//uE9gk3JSZjapISMK0iy89Y/NBAXxGpFSrE3gzPIC8b0OuoQnsblBX31?=
 =?us-ascii?Q?nYH2Pq+rLTDuKkTOVT3SPfzlAfr5cJoMqSGJ+xYloB1gl8KnViEatyPSaReI?=
 =?us-ascii?Q?Nuuai6HY203FqtDUBwFej2XYXCvoQzt6s5rAlfsWdsBx7+yFn+/n2sPQKJlq?=
 =?us-ascii?Q?JrzYvt2xRiewmyR1tTUGIgdzj8tRWSI6ywo87UyvQPUCSQQQSA452aIcF1Kv?=
 =?us-ascii?Q?sX1d3FCBIkHEG8mmwbWGhRWOH0r/K7igZl6xNlIscwTAT1GLUXRzkjqpV1DA?=
 =?us-ascii?Q?jAXsR/g8IigaUdVf/MkzMjMhSd71Hcpwkfio0HDy+Kr0DFb34uXKPbWVLCQX?=
 =?us-ascii?Q?gvIFuIvnukMwRqCLiEHs97NapkSAZoy13nnOZMQlY97XLqMZrQsgTfvCrsGh?=
 =?us-ascii?Q?g3JjrjnaqqWcJGFsKD+HIdJv4i/VRgjwWXUyAfdI+Ekn91H6oD9j2cKpXWPD?=
 =?us-ascii?Q?P4D4RFNzp2h/cO1s7mmfdpSYV1BEddgtW/hG0yZAnqsM95gf9P3MNs3PowZO?=
 =?us-ascii?Q?Oc/DzgzRDGteAHbVSi7PsfhOn2pQiSyFVLXZclrPGajqPPLesLsWEeB/MNH7?=
 =?us-ascii?Q?Jr36nB9ixStCiuqt+oSiUxWjAhQ3Ru6gVH4mkPj1JSnwvXdoO64a0dnLjOlj?=
 =?us-ascii?Q?kk4jbmoZY16ZZ9qnUqF/i9cUuwm0Z55TToEuUUZl8zP4QUNplysJfMQLfizC?=
 =?us-ascii?Q?sR5ilecGKrVzvfsI4bw5NduzW6rTGnGeKaor7QUVSaQAMHH+WTBTTDVScqCV?=
 =?us-ascii?Q?loOjWGlr5BfWKHBWn1C+AflB62W2vORYDIGGnQoIW9x4JfY06+PgkrxdYoNb?=
 =?us-ascii?Q?Mx2c+Ym+52HzsjXf4qDkqiz78YqEUjc5OcYf7ccEylw5rivfqYPRy6SBE61P?=
 =?us-ascii?Q?3mU8k+o6o/OqGIxS/XZVkPlzm3KAF3Y07RQ7brBREgecvFlxC6LB6MCojUFL?=
 =?us-ascii?Q?Fu25HA6GuQVFDWvSoS6cv4m19IRw9y9qCunLShIyEhi7dT4uZSGqLcPTV++K?=
 =?us-ascii?Q?mfuMu9+YB7M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L97AnevUk9+XYYqSj8EFHXlJmQnGZgILGc2+vYn+ngx6UT70uVyY2Y42LZHU?=
 =?us-ascii?Q?hwD0BNWHnrwJ2WchSWE5103MKKqLDNp0bRg0r1q7rZw/WVm7v/Q0Wqe0EYZI?=
 =?us-ascii?Q?QkpzVLLcGFt4qTkaiyhE+JCSXH3J2KAkSzMW+80+SLgEQF0WfRPuJzQL3BoM?=
 =?us-ascii?Q?zM1r844hgxJh3PcBu6omhv4o7j/W4xDIj2Dudtc+T8CUBauuJsC+VRREJPdC?=
 =?us-ascii?Q?4uIZK8ViRmFj2MfNH5P1F6SR8Sbe1UieMAUmy3qFmUXj09mBzjwrudKARaG2?=
 =?us-ascii?Q?B3fajby1ol1K4MPPUBo37hNLW+qy/RDvtAM2ds/1sZR33uS7CA89LBp2ee6D?=
 =?us-ascii?Q?bsCfRYzyiD4TrFdk07uGwMdrlQoqwS4KG7/0t5CBD9vR1kYUGvq0hVpUI+fP?=
 =?us-ascii?Q?pG1ZOwk63PiWNBOEjcqDwYKNq6NSJdumPeG2C2j8FUMN7OUL31khLievpjjJ?=
 =?us-ascii?Q?DEs8yYRO09ZakyZsR0jsLDl1Ow1NWIyKBJ75sGSdNAiPOykPmanOgsN1mAdu?=
 =?us-ascii?Q?L7vyoWj4IwUB1cOpM+Q3ZHeYOY2AADb79cGY+gid5BGFBeDxBpysF3CReh7+?=
 =?us-ascii?Q?1kdkdhNpd4dckzSH/N+ttykUYyP9afNQpJkhflWZ+m1S/o5C5DtUzOVqXS+p?=
 =?us-ascii?Q?vv9uygnRu3UtspcS8IBU4IgXWbXWOKwbpEZb73RqO9zmpBLGfwFM61f3PoaS?=
 =?us-ascii?Q?Xz/FgnZwwlRYu46x7VBIX2GkQxWs7gkL+eUpHXwMNZueKJSG5d3op6VPhJm1?=
 =?us-ascii?Q?LRBTEhvYmvEwEU7TxIhHhSZDghmjTztFPb1HYY0+EcZJBqG65PAs+2v66S9/?=
 =?us-ascii?Q?onKtCpAnr8bSYWwKjG/uxeZ5tlZMGD3UMB4Xgn6Zp9F0+IE+1CHnR0GFTvKk?=
 =?us-ascii?Q?//SyieqNNII1kIr2wkvyxMgceN6085ieXYQbWcabVCEjiVsFBfCZxXxOYEuG?=
 =?us-ascii?Q?4u5ElKDbB+pkVHHo2W+YtzluDJPM8ZFXbcGHWco7SlKULJ+Oy3jUIkeAbCPa?=
 =?us-ascii?Q?CcVOyoCo4iV+F0mAmOGMOsRUq1rngmZ2279TS8ufK1osryZ+7kOkcVQQTvrx?=
 =?us-ascii?Q?Zv1vSqbXtuZXbAZPEt7OIwBYvk93kELx5WN0FuxNNbRw6eslKpWU1U9OpKpJ?=
 =?us-ascii?Q?1oQC5jjJFauF1fWOTDKXAd90CUdN+1elrNoC9t00n/vvb1onFKbcUvUPAnfE?=
 =?us-ascii?Q?4e+6u8xUd2loksN7gCqJ7fwbISaEnuLU477sLeu16oz3Q/ByU29luchTqfvY?=
 =?us-ascii?Q?8hGF/UvSW0X15uVi7U+TdnN5TWAEU6zkzLbk7F8YUIv/CFwKz/1X37GprVec?=
 =?us-ascii?Q?bD20uW9msv4GYYPL2Kqu8cPRf4Y2rsHrBzKBR1m0ENHF0enn443ouoWY762P?=
 =?us-ascii?Q?zQg2MiiPvby8epFBWD/UDHva3t4ql+MexCLMo6JZDPxJ79zt5lCxKgICmrKM?=
 =?us-ascii?Q?J8rD+SsPRdVa6FCANopI/K7uanm1k1s68ecXFOKT8/EvNg1/LUjcC1/ABom2?=
 =?us-ascii?Q?Sg7kq6+oDdRXkRIz9ArcA3JejgFcnQx8sakQCsSaGt8CpGEaq+lCEgAS2ELi?=
 =?us-ascii?Q?pvq//ZaUuM81k81B9e78vy1uSHj+GX/ObZW7QS5WYOH8R1sIfm6070nURnGg?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dZ67s0lwWv4pUD77FNpo3yDRpDDtKPOhLs0sYyTTkVCM47C7k0WuQCAzaHk18y5lXG48Hx78xHnydUwUTIOUC2oq2VJhmFdr0718CxS8mpyQyuJc/Lju3QGJ6xRKPYg8L/DDFTrtEbqhs2g0aY8FZ5bX/lw/WIDrC8eRAta6K2b2Z5lQstbHPyhO0QECFZx2A+oQK78i5LqrSklD0F2rIK8coUo/TAd1mYSm8ZCEUalWYDB11U2INoXP9sipUYF9NRQ7wMnJkduOg96g734+dg+rzfS7viUlxbsYtEHoD76bvXOmlGykI5DtBvstpI4nGb6ndzGvSqDsHvxQ6fX85mjQ5BOiPm0GABGJXoC9LNRBWychZVqLKdZOMcGndpkF/1W9/dW59vkDdbanSrF6UIe10DHD9a81C9LSXUSwQM4uza1l4VW72H+Z73vaAMwF0HPF9IZl9qAor+7HtW6sFZHq5qdjs6W5syp2OfUvQ/V2Hr03pRfazzvFdqY2INdCFcISmCoG/GIkpDwQ8kvOj6lrDA9ONAh6C9VX3bd7Bz+bM0opf7tO5DxyxWz+mGeqNtzr1TCHU/2S392OYKBIfDeJYKG5HYVWBu6ALCN0iTU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7292ed-3906-4132-95d6-08dd7b8ac490
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 19:30:09.1030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyqdDm+z6WEpB6Hfic7j7bSPlNbOIlqHkf8y0epjnacrDimshOb2QoJ0GZeU3edpT0DIYlD8tyQWMwKC66Ob7lVhNHpYqi29KCQt8jGN584=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5167
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504140142
X-Proofpoint-ORIG-GUID: zPfI0g7RF0vffdrZzxjNDU3_3sNPU2FY
X-Proofpoint-GUID: zPfI0g7RF0vffdrZzxjNDU3_3sNPU2FY


Ingo Molnar <mingo@kernel.org> writes:

> * Ankur Arora <ankur.a.arora@oracle.com> wrote:
>
>> Ankur Arora (4):
>>   x86/clear_page: extend clear_page*() for multi-page clearing
>>   x86/clear_page: add clear_pages()
>>   huge_page: allow arch override for folio_zero_user()
>>   x86/folio_zero_user: multi-page clearing
>
> These are not how x86 commit titles should look like. Please take a
> look at the titles of previous commits to the x86 files you are
> modifying and follow that style. (Capitalization, use of verbs, etc.)

Ack. Will fix.

--
ankur

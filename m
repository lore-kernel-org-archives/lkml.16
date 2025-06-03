Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CBE1F5E6;
	Tue,  3 Jun 2025 11:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748949883; cv=fail; b=OPNX0cV0pZROVVKArHYPiw2SHvMGmoLxNCF3hUAu20QL4wzpydPDl4m0diVJAl7Tq+sU9+6ZZYBi4kYn7kF0B2ThYXJMPQ4wlZaLtUWO5OZgPOkpAKbOu/sRkLCPl7fOD2q45puH/uaXpt/e4NGFXS7oo/l3S2UvMPxBNN7dRuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748949883; c=relaxed/simple;
	bh=hB1J3wQ5d6XzVHB5Rmhs/JoQcs3zoc4BTqXmS0RbOKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LZWxvwWDuxUj7TwjsTGN38cJccit2ni27oNFW2aUXlqrD3ZoJtZ5JGakPxrTwnjI1Tzvl6A3+DuBTM60PYNA3jZX1+sU82XS0yIzajw07JIIUur0JFwKzPH8f4aewQ7qiAqlEXgxvC6taEgXrCsJMTgqlIAieycLqU0kB0jX1x8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JM/mVRN5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bMSMbCcP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JM/mVRN5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bMSMbCcP"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553AEpjt009184;
	Tue, 3 Jun 2025 11:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=+F0RnClwQFcjoJmfK4
	ij4lNLLzXz+RJwIwG0ad4FBwQ=; b=JM/mVRN5x3Vv6uzNmfkP1frvyoyouBRT0l
	qP762C9wAqCrIb4s0i4rU8cE8zMzv5e9dmQ24P8kfvfyVvuoBBw6as5yrmZhhG5f
	sjIWjlyO7PNyi+FzBzxJ6m+RuQJpRzooziH39qObPM9OSqH5XM1fxoCiwOjtQOXa
	yotrlxRR+rnMt/kaQZMWbT1TV6so6F++Yq5q2QDzK9jdIa5+K84hbXz0gnXbBagX
	Hn0LF5pPKFGumPibUmK8dSrHRYW5eIy2KEd2rczsKuKlpuuXzaP1R8dLQ8e5+PwS
	dQLRMNe8UOF8pBzexb8Zm5959JXKcGPJEcKnp6mBu841Bdn+CsuA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gah9p94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 11:24:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553Apcm0034818;
	Tue, 3 Jun 2025 11:24:19 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr79d72q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 11:24:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQv/8gKa/ngkJCBGgfl+F5mk25Cdkle2gXc6xjJjR9GrqOZB3j1AT6kLEpBFbk637HETYB1QtoVACu3oyFoEW7a4A8pc48/QLF5Vs2XKJnoUEM6zpXGHIDh7v1QnoB9Kt0I/g5jzzHVlTLirCdQBEidwDZCliqlZiTcghYMMq0pVj8UGth1mFs19fJEtdQDKKgbvTsglLGLPmds7prnJO4RH9UmwdQL/ZQARNjaxECAhiHEj/G1Wz/D0OKqvrWvD2/SVZqG/j/12pfQ+sCbJi9PyRhcz9O9EGFut5WSnJ/+FfwEHEUM42eHtP0C0MXcVr9o/lklJ056CpXD2EkIwVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+F0RnClwQFcjoJmfK4ij4lNLLzXz+RJwIwG0ad4FBwQ=;
 b=Jw3wOzdkfxVRk4nK4Fe+XR3MRM7j8KR4x3cxd0gogab092dST3GEr1ZgB3CEz9GYcwN89r/dg/NQWzJcDuefgO74znhq86UrfJPMqzOfnxW6uK1bNbYgVV+fYh6zfAlFq2zt61KadW2oWcwJ89vyqB/u42PzRqJTU3w8iXQvqFZRSBV6GOy0zpVitJH+71lYaq27iA1M5Lk0BwAVerl/2QDTbG9VTKgns2toAdYTXKBmUsUfRWoT6ZUMkjJxoMEkfk13ENFz20VISvbLLfp4gp0TwjLTQ2WXfMlAvUveA8bEONfIhbDogtDM3bu9D0n+Na5mR5GvEjad5gfUxx5S/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+F0RnClwQFcjoJmfK4ij4lNLLzXz+RJwIwG0ad4FBwQ=;
 b=bMSMbCcP3A2kcvCU7T/ZUtYsjjOYxH/UQYLqKvEnp4p1c0hpM5V4XJ1g0yA/TUQj9aUQbWSFZbFCw4+/WnwvP1l92O0QzDMOn2ssvDgQis57CVbjrinXgZ4NwiEHUJNlUIRK+kiv2gtgVSe9ML3A0xiMLofCrcm6P8Zo+AtD5bU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB5700.namprd10.prod.outlook.com (2603:10b6:510:125::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 3 Jun
 2025 11:24:16 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Tue, 3 Jun 2025
 11:24:16 +0000
Date: Tue, 3 Jun 2025 12:24:12 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: expand vma doc to highlight pte freeing,
 non-vma traversal
Message-ID: <38bcf562-86dc-42b2-9ffc-53cbc5d8ac22@lucifer.local>
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
 <87bjr59634.fsf@trenco.lwn.net>
 <9fc9ac50-abce-48bd-979f-2e00b26917b5@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fc9ac50-abce-48bd-979f-2e00b26917b5@lucifer.local>
X-ClientProxiedBy: LO4P302CA0006.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB5700:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad96d3f-6c97-4e03-780d-08dda2912cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mdggsRl/nusZCqBbIVnvfh5YoZjqeq7+MkPFOBgtvkFLLu8arBknjz8l4jRs?=
 =?us-ascii?Q?EBSsxj+xQ0S5FzAox7wwVZjulyTOVwtevo56Rg+GDsT+oH6pxlsnBqkpLAs2?=
 =?us-ascii?Q?kyr5c7Qc3RAogkd87JbKcM+n1S+zSdx2/AzurBx0/q5MEzyoDtMTwYMFAgWW?=
 =?us-ascii?Q?yQV6QynFxhTXrwSpkOnm/81JmgRcaqUxm5gacpcHrdJGKxXfm0D6Xlw2H0t5?=
 =?us-ascii?Q?6tf7DfrlnS24rh2YJ41JzsOqzGyNOtLDssvBcDjO19mVzrq1Nfm1uIMCtJJA?=
 =?us-ascii?Q?br42547Wm1kLooZF3wkYH0HQXu8o08/sO3iTJInnso4Ju3cKKVOUsThQxUS3?=
 =?us-ascii?Q?XxNLXKELZVmZjLVTslZJnXLJka/AfdYQex9FxsP32U3PuC8JH9HX+jdTca6q?=
 =?us-ascii?Q?ajoQySgRwU7Fdhyw/GgI6OkxzHMgf9CFFe0nvP8+eBfE2f/Evo1nU0HY+4yN?=
 =?us-ascii?Q?9KsBgHo+z7IH3jTPStFVL3788fCP+Hpgp2Kxmx5FpofzPCWDjpE1+4emm7TD?=
 =?us-ascii?Q?GEdkB+AQDWpepigJhwuHcbEjRbBbrUpogsrIzVlCp84FSYgUbQJq3v6YgSA7?=
 =?us-ascii?Q?ZfyfySW2GkTYco6A+pVRNhJONHLwPKVqsYDawHh0bXUJsUc5DwCiyJD8pGzE?=
 =?us-ascii?Q?5/jUpehV+I9KyNyWibEi//lMk47xfH3mP7I1p75UHu46VZJIvP6TkEGkhm4k?=
 =?us-ascii?Q?DUMYWIz5RJVzjre4ydqbuVaF4BQVIo4Kx7G9vegC421VtKtoKZK1/a3Zpx1O?=
 =?us-ascii?Q?hf+oY8Ageu3DvHAENoZV1evuH25N9M4zUq2kmLeD+D3XFcYdf4aJtw+8Urhb?=
 =?us-ascii?Q?pmfB9mqVvxZFNJLFxguGReNOtroPeIei/I973C1YmsWL3q/G/Qm2V8y2PHnY?=
 =?us-ascii?Q?ggdnTJGIRyxelgMMhg+rlzQTo+SgHWbbmvElkILOwFOgJKj/dPw4NvkQGGgC?=
 =?us-ascii?Q?sj36d7vcJE2C068nWscE14mtCY74bYErWS1o6JrbjNzd1xSc42Gl+oQcyQ8j?=
 =?us-ascii?Q?vDEqr47e6rElpdZ+N0EgALHBbiJN5cZVXS+U83Qf43EU+2948PI7VS46cA9L?=
 =?us-ascii?Q?Ai73o38zze+Ap8ZCur+9AXeqaVlYHIkmFaTtlNDtEJeCh3ovwxaaZak7ihOh?=
 =?us-ascii?Q?nueA8s25EOhJi95RmVRyzIntM2yy/cRA0n8wH1aYqBhPGXJb16fyOzwY8mJU?=
 =?us-ascii?Q?31WPAJfECWCLdWVpytS/MwhdtDDrp0XJf9lQiOA7/h1Z3Y9dBvldi8zVrbRk?=
 =?us-ascii?Q?IQ4cQOXxNuJ2CZKnVsKuN57Jz2wnaJ6hrKNjzsdhWJ3k2UlShaqpbzlryxZt?=
 =?us-ascii?Q?ppWAgZXcRuG4O6Onw3mOEr0eVSAAIaeNbsnxcpvlqY08RXgV63vgpTmcU7ZZ?=
 =?us-ascii?Q?mbK8wwTIBqjqgyBOQyuew6FBpxa06O6QMzt/jqsTbSlj1Vn1O+XR8dLEqljD?=
 =?us-ascii?Q?wcgVnqCqedY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jzJF6TqeIOST5PnTM1rbhyvIpWZHhcIqsA1JRZJ85U/ED+sKjDUdGNYlJkLY?=
 =?us-ascii?Q?iMnaeHUBphk2Pem4nuYLHFdAxSWvQBnutKT2odfS0JEZgEPIndgRB7Sryfp9?=
 =?us-ascii?Q?yG+hMIqDPtqb8mBanDwJAWeehJ9a1zxx5k8af9VX8iVnSezRBje/p2aWeSxM?=
 =?us-ascii?Q?UIOoAUrrk0m25zTC9MRgrgoni36rmpc88s4EFz2nMstGY/rfD0fi8nljLOj9?=
 =?us-ascii?Q?esrjqz8UezK+ekSNADHhCRgEfU6mphFi6Ndb9lMlPQR94dYn1oFTKxwfh+tU?=
 =?us-ascii?Q?bzIuvWgOwNicEvh7/+bsaXdYVnurq4kB1nUQycVJqUWWLk2xwzZOhoP4AeXM?=
 =?us-ascii?Q?mOJuuiLsNpb2GJqaeQ6pcwmfByfDCwi0hQihfmjcpRQTwiMj6vSBJqBzDFNV?=
 =?us-ascii?Q?wLWg381I3fVixORUFXDF4l7Lb9ap0qWvRji7Le1MZpLn3qjmFwFF8eueTqas?=
 =?us-ascii?Q?NVh5N6kHFkXESVbLooH0Gi1vaKdHXfVsQm/nQNsNTz7DdVXrgyF4HOflbCl8?=
 =?us-ascii?Q?Fr1pI70di5dbvFD+OVyaA93/hbyUmfmYX2WGYZxRDQmncC2NgfK2vo4dsp7W?=
 =?us-ascii?Q?u5ne8lGxjCqaMzHtnKzRXsgqCUxcx+JHdE2JGaI5P0FTsALXFRm66YllKBek?=
 =?us-ascii?Q?vdWgqTJ7vMaNhEdTLosdIX2/TbyZZtfxrQ63b1i1JGDAyMqiwcYIOvHZXgSK?=
 =?us-ascii?Q?0yZpzWuxCYmc2CQudQ6hgTcDtENeaZv39VpjMErSaBodK4XCzWhuxSay2F/r?=
 =?us-ascii?Q?Ly8e/uGXZHBnciNdwW21ZkPxs3s66mN+bcD9FyOdzoR6zYfme87Syvf7e46z?=
 =?us-ascii?Q?/FCuUzAiHNWjYAFwVoJG9zk/dyZLsXf+AD/IBnFhU8pvB8ZLJLskzTlp4E0h?=
 =?us-ascii?Q?5IhRvjt/6Vq7Aj2pPIdBEWGNW9BaRibhmxQNLjGO10qqnOjpGnrYL1xPB1F5?=
 =?us-ascii?Q?6p9mow68kZnCZhKYaMBWWbbU7kswI6/wvA6kVHC1QUuU6d6ctQ6945ZDTrzB?=
 =?us-ascii?Q?D3nIN+S1PXshgqeGDduzfgxrqYVI/kajgWAgf38pqnSX0CYabrvhzm2YlEVu?=
 =?us-ascii?Q?PiFld/O58ayeFHvgYTGeNcAmnX0uhVJ5eUAjFdipt9BC0+/R48jORfyDUd8C?=
 =?us-ascii?Q?gcSIJFQm88yUocDbVZfgjfnd29wVS7QC9i2VaKNR+7fDWcxERwNai2S9baj9?=
 =?us-ascii?Q?DgYMFCqAmXu8sYoCZDbnPn5AmpuhNRTnYv7XdkM1anvNgTAhxA1FBtJz+xk7?=
 =?us-ascii?Q?fOHIA8cK8V/Lz0UrG+58aaA+Bjo1bDgWN77SHURTwaPh/zxyoCkTuqha0s2J?=
 =?us-ascii?Q?YXf10VoZCmggqt5kPZgd40hF8hWoIJnUNCmELLVzj7GMGQe62DQMxClncamU?=
 =?us-ascii?Q?qg1b1Zt5UPH7vIqCj7TpbmqcSETuCEGs/D8cQKb2qrFfrYXjFWJesJJ96jgo?=
 =?us-ascii?Q?3kon0BylPY1MgAOXLThBEEauEDqot62HHDNvTt8xcTf4hzx/jm8aVBLuO67R?=
 =?us-ascii?Q?nMshg1qBJcOhIuSX4C9wCPVQF4dz1KoRbP/COA1japWRVqSxmsi6MjO8NZHB?=
 =?us-ascii?Q?XBjoniyRcF+yFkDLnLu9mLqf7/66ZjsVbyXBkshnV0nCBxeHfPHRqKrwgIyJ?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7FVKIHkO/rW8q+CLl8zrXIoty37wwGyHot2DFQJJR81Wki4dk9jePTM+7GZGu1MtCymk51bvCTc+iFxiEZVdi2zDDfDoxhl893sD8qzQlEvAUr/h8C7f1ll6hbWjvCjq2OVhSFk/nm7QWdtf7YNDuk5Wf544quobu0LD8N1QpdGqqalH3udZkIMc/53ozyPIWWueH5b3GLVxhud9CPYQ3fkXEEvCrOZGV666DdourS0KRWbazYpBxmbZQxgokU73Yl+V0/n2pmXBhWSrOGu8H28O7fEAiRJXQJlv8ZcwjC9e+8915egaM2bLmkZNgBRPOB4byVob1f5xQVoEOLlVSOzoaUAqqp2pDM8aRGkqNqIgvpZmV9mjLrIJHSn9uMuyYhVeJYQwkxJ4LjgsKmfbAliSs3TvP5t1n1j9EDj5BDjUMIIONw2Do90Xt24qbCOHlqY7uUYhN1TRVRWT4vUBsd/aWYpZU9WojI+EE2Fpvn1s8T9M3cOsSbNTI7R7ZfzyfSGMTS+0MExc3DgpYxww+xjzPK+PKLlDpsmSDpDy/BwLDskID6uHzlcriMysmzPh8Lao5KosuZUtnZgu7JPvOUvQGBysobzRmmF/Z9SeAxw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad96d3f-6c97-4e03-780d-08dda2912cf5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 11:24:16.5854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydc3hMalbzE9Q1zCvZ36DJUWTV4/xp7/WmDEktXKerwyW4cKJM5K+jOOzaByEkABi4mhtd2/S8W3ntAoA+qrn0h8KdlAIePkQzoTpcVwlrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5700
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030100
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=683edb64 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=WEnZAfVjaidlP8e8cesA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: RZxgbk5W2UNoVUsQgSmqmxHBh4cSGk9_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDEwMCBTYWx0ZWRfX2RXb74NZOkWv Rch6jlp0TP1rC+JiNlWb9WsUu98L8HvG66n5SoucNMF+nFeIHNZB+nmG5WVEmUBL12w4ToN0bwt bRzu1qYPFAJy5XZGkTlrlWuOakcFBJ+1gSbW+B5t6r/PHmq2jnH3SRGYj58nciijNrw05QFlWKS
 MGXgfx+bhf32p/VgsxgiNZaVoU0CYES2JxLgecZmAdtbDIaivnhcaKf84RZGWhyG/SnNgQaUaQb 6OjlAzr1NXjD/3xDSeminzq/sV4UmJPDOUYzxmzntJ/BNQOR/qxr0d8kzSoJl15yyIbSi3OPLJ5 3HeOFdUZQO+uQVIS+NjSrtD4TZttjzBTGEM4uTlfIfV5ZEX1//EEEihsSZGhr9pRDUBWACRPeOV
 lKR6o30+4RIe1MO7v6Z4jgLbgXoajQrfFb9IJoQ5izXu0FPRTjF9v2nmyfxtGyEnlYg4vgeR
X-Proofpoint-ORIG-GUID: RZxgbk5W2UNoVUsQgSmqmxHBh4cSGk9_

On Tue, Jun 03, 2025 at 11:56:37AM +0100, Lorenzo Stoakes wrote:
> On Mon, Jun 02, 2025 at 03:38:55PM -0600, Jonathan Corbet wrote:
> > Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
> >
> > > --- a/Documentation/mm/process_addrs.rst
> > > +++ b/Documentation/mm/process_addrs.rst
> > > @@ -303,7 +303,9 @@ There are four key operations typically performed on page tables:
> > >  1. **Traversing** page tables - Simply reading page tables in order to traverse
> > >     them. This only requires that the VMA is kept stable, so a lock which
> > >     establishes this suffices for traversal (there are also lockless variants
> > > -   which eliminate even this requirement, such as :c:func:`!gup_fast`).
> > > +   which eliminate even this requirement, such as :c:func:`!gup_fast`). There is
> > > +   also a special case of page table traversal for non-VMA regions which we
> >
> > The "!gup_fast" caught my attention - I was unaware that Sphinx had such
> > a thing.  Its purpose would be to appear to suppress the generation of the
> > link that turns the cross reference into a cross reference.
> >
> > The MM docs are full of these, do we know why?
>
> Removing it from the struct vm_area_struct struct immediately give:
>
> /home/lorenzo/kerndev/kernels/mm/Documentation/mm/process_addrs.rst:11: WARNING: Unparseable C cross-reference: 'struct vm_area_struct'
> Invalid C declaration: Expected identifier in nested name, got keyword: struct [error at 6]
>   struct vm_area_struct
>
> And given C's weirdness with typing I really prefer to be explicit in
> referencing a struct vs. e.g. a typedef.
>
> At any rate I'm not sure it's all that useful to cross-reference these?
>
> Any such change would need to be a separate patch anyway or otherwise this
> becomes a 'add additional documentation and drop cross-refs'.
>
> >
> > I would recommend removing them unless there's some reason I don't see
> > for doing this.  Also get rid of the :c:func: noise entirely - just
> > saying gup_fast() will do the right thing.
>
> Re: the c:func: stuff -
>
> Well, the right thing is making function + type names clearly discernable, and
> it just putting in the function name like that absolutely does not do the right
> thing in that respect.
>
> I feel strongly on this, as I've tried it both ways and it's a _really_ big
> difference in how readable the document is.
>
> I spent a lot of time trying to make it as readable as possible (given the
> complexity) so would really rather not do anything that would hurt that.
>

Somebody told me that in _other_ .rst's, seemingly, it does figure out xxx() ->
function and highlights it like this.

But for me, it does not... :)

In case that's something you assumed would happen here.

This is against me building locally with:

make SPHINXDIRS=mm htmldocs

> >
> > > +.. note:: Since v6.14 and commit 6375e95f381e ("mm: pgtable: reclaim empty
> > > PTE + page in madvise (MADV_DONTNEED)"), we now also free empty PTE tables
> > > + on zap. This does not change zapping locking requirements.
> >
> > As a general rule, the docs should represent the current state of
> > affairs; people wanting documentation for older kernels are best advised
> > to look at those kernels.  Or so it seems to me, anyway.  So I'm not
> > sure we need the "since..." stuff.
>
> Sure, I will drop this.
>
> >
> > Thanks,
> >
> > jon

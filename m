Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A526F4ED
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751050179; cv=fail; b=irxiXZN3qTW6rL9meL+308F8n/GBVU2smDQX0e2KYaO4nnKDep2WoVCO+6LEdLg9/8QqwVEeOifdNrL0K7ql8GfrAro8H5Iq5+bRmQIakNJtgQ2Z1dK/aYxHHLPhOCU/+jvLgg/VDoTkYBC+gjc8qdxfHf4398oQa3FI09A978A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751050179; c=relaxed/simple;
	bh=q2M14BG+IEVQMVfKcUz1GIk21GMT8Oh8JR/9uqFKcH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VhlQioYgwvCPrRnq4MaxU1ojSatpgRDjwXeKYSwq78nS4GqFJTQAJHF/sS/vECH1r6c4nPODhQ5fLtzJpRA1Q8nACboJ6MsgvKPu3rzvwmloechFrfT44dA8WN2A+ljKVS933nXwIHbc3L5sCISezPgKiNHFqvZjKtfgTykiN4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e1bWbNsS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=K3WAyGgN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e1bWbNsS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="K3WAyGgN"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RHfaBW009851;
	Fri, 27 Jun 2025 18:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Wr/91fpouOp5jT5eav
	bYV/40AKbCxiRzAt1PFRlLXwQ=; b=e1bWbNsSpevBIyzu8zEjxEIHxjFKHfgAz6
	QTDIZOFoqP1W2O44gMtMaHfnodLIl+XawJwTBI9pyMUFvVuT7eBFs6o3YqJFbvWh
	RAd8uNfr68hXhbz1lM6zfT8nKcty3HaI7J2cT1xI0C4Uc7oBA8AsD2VcqhWj3pf0
	IxRRg+H7YeriiVlbQNdlowW28LQ8JN/IxZd1V7wxgQIETIrnsJjArpLwKb0rCHV3
	R1ft/NWeTcJqqjKS87WDbNlW06uBPLphv7k2/zojSVQuFk2Da1Bqr5JKF8yUtJ6o
	HIvIuJc/U4u2OM3/XW/vja/XQeToNaT9W4hS8UKH5n+EuO8sm2iQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8ycgdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 18:48:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55RI115S013314;
	Fri, 27 Jun 2025 18:48:50 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr96f83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 18:48:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6Jm1TJsdhIYqDq2lbIqv5QgWfgBKsroQy26VKgxQO6dLR4bmaCHZylOWR8FbxXPmVyJVSbaTQHpqdBcGyAeo+BW/9yFVV8tCsZnfJRrehvmTljXJOZ4ie9fHwkWVHvPBH95PNEcYSWyVf1jjPUP6ZRBP/2UQBir7i7XjYo+jXqLqyA4ITbM4m5BtimXZf6S43QYaU5Gj/gcBo4+VMjX5Li6TNMOzowkM+x4DGjqzVfphFveOWBIXVQ8lwYT8ekFoWWkNYsqr6Wc3zeb5WJbv3w+UG93zDzYg77lZmUZ8hJkFLRrvxQV+Ke41AHzZrWJEEd/cdO7TWYPxcycLIq1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wr/91fpouOp5jT5eavbYV/40AKbCxiRzAt1PFRlLXwQ=;
 b=dPjTm6ax+fHspP1Qfvr6Nx1gXfneCjQjZKpr6jUo+p9JvOqLTC45cddFKmz9RV9RHOV5BB4uV4GUUOGep7dRru5Vyd3YjL9tAXmVYIrzyNQ0MPxHruD/1NYb9QoH4f4KuNwtlZETDFln74Qwuu7CLDN9wmglE0Iar/oICWXGo0yh9cEPo7oHN0qrqf8Gza6gALez8aLV8hJD2wesXRRUqf+md2i++10Hd6JmrryQkq4J6dKGn7I5nzXpjb03OqlMk8zK+7h4jHCFtQUIwiuo0Ho+xxkgyrP7VaZqkEX5eOF0p0XtjvQCxSdCqkCZhBe8sJLoU6g8zgUPQ12JseADHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wr/91fpouOp5jT5eavbYV/40AKbCxiRzAt1PFRlLXwQ=;
 b=K3WAyGgNLGnLYljxX5qYp4OEWEFpaDfWvHqgO1+0A4fSVJijwX19mFRofcfyBnKKOO+qrUXgUpu5HHMwGJHxFcxRENwIldkBU/AHL4kUg1gW0UcLfhJJMwCdSdjh1X3P2c6xILFwOB7qfhbeJFwCB8gsVH2tPiHcQQYygfl0RG0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO1PR10MB4497.namprd10.prod.outlook.com (2603:10b6:303:9d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Fri, 27 Jun
 2025 18:48:47 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 18:48:47 +0000
Date: Fri, 27 Jun 2025 19:48:45 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v1 3/4] mm: split folio_pte_batch() into
 folio_pte_batch() and folio_pte_batch_ext()
Message-ID: <ec53b2ad-9c1b-4039-b59e-905e1853c1a0@lucifer.local>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-4-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627115510.3273675-4-david@redhat.com>
X-ClientProxiedBy: LO4P265CA0237.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO1PR10MB4497:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f9ce6d-a3e4-4b99-8066-08ddb5ab400c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vtFbLhJPPeRSyZ+i7ugd9NQ4xdtFiVLAnzxW8iqCp4AMOoc45+1zzFKmIh4q?=
 =?us-ascii?Q?Ok/59F2xFKJdP2iw/OsN7KD8SMJyuaoiLr8+FWGtsnr4z4TpDvyoj3LBwolO?=
 =?us-ascii?Q?ql3JpWirHmLt6z0aJh8+ULBqRq8H6bwUCGirUrTON/gwywvJeIjMDmOtzuDN?=
 =?us-ascii?Q?8YQUpTUg2VBDLtEl0UIM4T216n2ZaTnD7UB3KHryq2GQikhBcAcXQbdP2L0X?=
 =?us-ascii?Q?8V01bbtd/xMlP8Ezrc/ADEkXkUndwuz/jRblbW9v2yYXEuMnYWmN4OO6hxWR?=
 =?us-ascii?Q?DIA29UHLKhiGnNJrm0mT7jO1mkfSZ0rsvhP+sAxlzuBMBrO1gcbCsFJ21cYA?=
 =?us-ascii?Q?B+c6liC0jqShuC+5d6o2YZG0+AMdpu/5KYMgRlmpCEFhCdGA96LgbfYQpkGn?=
 =?us-ascii?Q?TFqMVdJ9AwsCyWbzPVHlrCt+2IJBbreh+jHHwxi+boHboq950ArmB0oBKUez?=
 =?us-ascii?Q?i7F0Zwdd2FbROXdMYjgDdHj8wIWovTj5e0H+aWx+DygUgTBMwEVsOWMvia6A?=
 =?us-ascii?Q?Wo7q01+RLc5Ocjg+PSOG3OGNBNOrtVUCuYaRDsNILfPeEQ/eYBokdCKyMU77?=
 =?us-ascii?Q?EIAKHx63zTzGSSzXkBdpjij2M6aYQ1KbWFpIjxqgAVzPwzp1TX6WG+A1IQEz?=
 =?us-ascii?Q?1puQHEvJC1QTCpVbYVauvHqnto9+0Xeh/VwLHGJlSuS/IM5PbjTV4rq/8AeQ?=
 =?us-ascii?Q?cjNYuv7MEC7mPD6mo72pZwMbrntt2kvqqYnuBy5ublBcH1EJttRsOwDtWfZG?=
 =?us-ascii?Q?kJjTb63gGi/n2AgFDIrZTRodyEHvZ07Q8MGsT0qOQ7L1RjwGWBhz5rX8FRd/?=
 =?us-ascii?Q?jQIsaWFbcDzLVsyTamTF0R9AiN+HeNLX1uWsT17Go/qG8DAzoN0KMSXiQmug?=
 =?us-ascii?Q?0vtqHDrCyj1XU88yUp1moQ4Ym+VhTs+xdSJwoVua1K5LxIrXLXV5Kz0spOyZ?=
 =?us-ascii?Q?t9iEiKbCKxWdrSGQXA5FF3s4Q8jxWma+KCps9SJQMZb8A376oN+DmjRXhu5m?=
 =?us-ascii?Q?oLl+ficksDjI2DD9Fo4ZWMf5AgNoo6pvrotU1FtEVItjeBtylKJyX7nA3wkF?=
 =?us-ascii?Q?5hBr+djb8yiMaq2++8nJ7wbm92EN2QWmA0lvhxIJnDw1h7fypojJiI6wdKZu?=
 =?us-ascii?Q?iVqOcDt0IKEy3xJO0B5kGlpoa2zDNn2CUSvCC0zn5sDCtaAw9jBgS39vtGg/?=
 =?us-ascii?Q?tQ4gmugy44g9bXuLyN6PcHFCeXpSZXtEhLa87U3+UujftdiACwPbf6R6XoV/?=
 =?us-ascii?Q?KMIfL2+yEa2qJQyxuOCeD4mJ5jhf68V1Uk0nyOJfcqSq8Y1kdj4K29CnEVot?=
 =?us-ascii?Q?7ApJWMRbncpPTJlLIfM3XaCXdMEQT+PHkCtbQEsU5OwImmyF3tlsux8EU3uJ?=
 =?us-ascii?Q?cD4ME6Kq23VwluhVtVtdK4B9Kq2r9jjO9uKiNPiuyY+GRb7jhuf+o9ey/bNT?=
 =?us-ascii?Q?HvNW92OBYCc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?goFM/cE8XUI3Kqkfkm73AlpnzDgc7arLuxp0sQ4yHwhCCh+0CnVVMp+RpkpW?=
 =?us-ascii?Q?usLKirgKLU2Jy0Hv0ochwOSt3MOj/4nbvtfosZEiBFiTg6m2Js0/F/RAZ1E6?=
 =?us-ascii?Q?sY29ppYvP1RM8JgUToki+jov5JNQlt8xkTlXqQnqAmG73Mt0bRTT8kbGrJo0?=
 =?us-ascii?Q?P9rkQA45Ls0IJZ8nY1kSplI8Ha2gc4ZPmBiZeCGkdbjVpj5yecEnnaoGuVlp?=
 =?us-ascii?Q?P6wRVhn4qfVXCGiJuLSPv0tHNwNgcy5/DSeJo2fUDPHVVxJqp+yMCsb3FIf9?=
 =?us-ascii?Q?7kzd3PNHsPX8Fe6Tha0m2YarGFcedDFXyMSkKB0e8M/z8O7CPxPzC81Xy8CT?=
 =?us-ascii?Q?fxZmBHht6vbTkbH110SqQq5QF05o4pX1ryi1asfw56kL+c0jn+KzvckbzCqs?=
 =?us-ascii?Q?KxINSBbs1on/LVel/Fg5QMSUj0WvHcGQGkNtyvFc846OrarW9BT9Mv1ReKpO?=
 =?us-ascii?Q?H1/W1ADDA9lqEoJL+kDSMO1CEVidBdRTAlv3xlvFLpW1jQZfc0FDTtL6A+SC?=
 =?us-ascii?Q?bLhhbvPQvCr2ajKHqhSgHxZr1NmwyQQ7bPeiYcyw96kM+B3xt1OWjOrihCBL?=
 =?us-ascii?Q?QYmPiQfPhlUYE3z1fWRtk5lZdHfhFuRwWAiRxQwq2ZfnbNPO7ahpejOPu5wT?=
 =?us-ascii?Q?wAhA+lYNFnWpgEqnUuRR+b1UXJdgpGWYRnPZHVETKkoTG2yG8lxf7nKDlgvi?=
 =?us-ascii?Q?T7h0fjvvv4XaYCTGWgranxKBcnfpaE2ZLIKRPCbd6rhe+MZ62GhOgsi1DFOj?=
 =?us-ascii?Q?SiKO/wHKjPLYgfM0Tg4SpvcZIU9gDmlQPRklhPodYjbQQ1o47c7BhFwIVXhQ?=
 =?us-ascii?Q?hcMdmWo0P0XfPhYeZbmLqjYnl728MmS7l9m6ip4iJusQV6fdX8XeIP7fsWgy?=
 =?us-ascii?Q?t8RriyxGkW8NukJvp3upv9u+cKu4rkkg1INQc8Ej3OCcjlcnuUFv4Iwl0TBR?=
 =?us-ascii?Q?jhWixmOfuaN/W+0E9S0OZD9FRYYaEjnP+k/9AW7bZNCwLiP7xxv86OhMSAYz?=
 =?us-ascii?Q?FChK+jjIcff7pjiXGdpN32pupSZI7eRFaOtiSNdKOh1qebzP9vSoWzbfdHME?=
 =?us-ascii?Q?In55+YtUrQ8MDLiet0+N8B4PNLw/oRbsReMaFmNh/8QBqnPAYx1xFSzA/qtZ?=
 =?us-ascii?Q?tVfpi/xW/+qmq157MVn/k+KgHt0rn05gANjCUlBnNq74QYxsnfztH7lepTpy?=
 =?us-ascii?Q?Rj9TFBlTHBqYvlH/ifL0QX8wCywezI1CChkrVWAF9RuHAL5NEV606uw0k6Cu?=
 =?us-ascii?Q?5rbpI19vWA6ovcHMqqkXymGQtjNr8wQ9XmhfmxKRA0aTleg2QfGGew8pDydP?=
 =?us-ascii?Q?OdUNeYC1GICxE8zZK8CfhZiDViWLvfM36a2CAwztIdMCdnGBeiV7e0n85+Mg?=
 =?us-ascii?Q?+UcfCMKSQHlYRnx3VrOg63EKy8Sx6EO1K99IUySL3jDy1rJ0ngw7ssLHwHyb?=
 =?us-ascii?Q?9iF1TK1SZzYD/7BCF4XZZjeDYK62xE5BCBDPFOurkdmdGgKs0qTRqcj+12hx?=
 =?us-ascii?Q?WO2Hir2eouqW+ZODYhC1rMqCKsJ6I0yQYv4b88PSkA3DlYc2U6bG+TITV4AP?=
 =?us-ascii?Q?/bh5eTO+ZDRNgkSiUjkELvVQYq86ZgdrPpvxFW7U7Gx/Det3ItXRFV22HD6h?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yURjOPlzzFbOYroEud+eK/x+RIqvgOk/Gxvv0KEyQdQQpBQuo8cWQduA0G36LUvX+L29EkxSIWqspEpjdX6+RnvTVIFEB5QOpX3s/M9dhYQf0jaGfHU4dzzVbPT25MPeAl8fWxdqu9Cvx+G67W2o+DYP+zam9/3hOg+2OW9JhMfSNLsrzc3lPCYTH5SFBmbwWyxoY/818CUKUvrBlxcTg3Vb66n3sAMiFujDRKh1n1Tum4Mbj/F5w42Rn+oUvD9nEYRIaaPWVC0J56tkdZXpuFiK0s/879GLzkGnAycx1zG9mhzH5p5flpPnYW0D4868z81d1l0l31FnFewh1VaCMEhuO3w/HA2a2gmBEDbTw7DFY9ip0Y8h+7TiFhoQQlYqS1iEhYXdw0V52MrWzxWvWlhU+l6/48tPk9nHQ0UEyfJ5rGqXYfFcdxyM+Mu8Wy3aaajxTSENqE/zYQ3Egt2ymjFecD9Cxweo6/kcbHVFkLprFTTnhFf2bJ9iUS/7VXi+tMZFk5RzI40JO3Bdz++TXWJ7UXQDObGQQVv94X2nrIlblbzmHZEEbo6B8NTsqPBMa1nEKxsfO+MVZl/X5dxaaQLxdw8SE9dRxjYy4tP82vI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f9ce6d-a3e4-4b99-8066-08ddb5ab400c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 18:48:47.5826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1426i5wKd2wbc3JRjMpJsrMDtT4hH49mtXQmp5AE5imeF7AQCo00w/HCON1hBRQObcA0VDEJ/GCXUwhooHGQXmKXrFbJcW+Wgigg0L8VrWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4497
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506270152
X-Proofpoint-ORIG-GUID: bNrwLc0ChN8wdTpWeTOwuJk5xYg4bC0U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE1MiBTYWx0ZWRfX5Oxqu+u/XjsB VrCk1SZPgZYSXXfNE1haHunHJoxD4bpzEyJsTtkVvpUPbbvuNHx2lDaf9vC18yACTHK4BIRSOY6 xnH8d2dNZaTXzp61XqfbzZsMG1QNQCYuRmqjg5SWCXXfekodQ3e2PRh4m4yAjXuPDu7/usyJAqt
 mGWvedY0ZBfr0AAjBeNgXGWJW5dB7/RxMn+cdMfYWc0B00rJXG0Lt57VXVhggYHw7/uzE8yI7dV C+z05sUtOpN3I1bPsbwp1Qxw2f+FnyQjKvk4LUU5f+aT9eSugZpJ/ubTWIUe1MiSHMh2fs7DDrf 3vKZ3pe9RuNBiueuvg2MPKjaETK36sQtsnp8pdUzwnFKNyaOIMjkzG03MXgg0uweNujfbQqFKHw
 Amr4CKTmTt9UsiZnAkTCnGU2xxEvtabFJbFipzRPGPl4lA5PUdVk05NLbJdgo8K3SUsgerb/
X-Proofpoint-GUID: bNrwLc0ChN8wdTpWeTOwuJk5xYg4bC0U
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=685ee793 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=l5FC7pWdILYi0zrp6WUA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13215

On Fri, Jun 27, 2025 at 01:55:09PM +0200, David Hildenbrand wrote:
> Many users (including upcoming ones) don't really need the flags etc,
> and can live with a function call.
>
> So let's provide a basic, non-inlined folio_pte_batch().

Hm, but why non-inlined, when it invokes an inlined function? Seems odd no?

>
> In zap_present_ptes(), where we care about performance, the compiler
> already seem to generate a call to a common inlined folio_pte_batch()
> variant, shared with fork() code. So calling the new non-inlined variant
> should not make a difference.
>
> While at it, drop the "addr" parameter that is unused.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Other than the query above + nit on name below, this is really nice!

> ---
>  mm/internal.h  | 11 ++++++++---
>  mm/madvise.c   |  4 ++--
>  mm/memory.c    |  6 ++----
>  mm/mempolicy.c |  3 +--
>  mm/mlock.c     |  3 +--
>  mm/mremap.c    |  3 +--
>  mm/rmap.c      |  3 +--
>  mm/util.c      | 29 +++++++++++++++++++++++++++++
>  8 files changed, 45 insertions(+), 17 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index ca6590c6d9eab..6000b683f68ee 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -218,9 +218,8 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>  }
>
>  /**
> - * folio_pte_batch - detect a PTE batch for a large folio
> + * folio_pte_batch_ext - detect a PTE batch for a large folio
>   * @folio: The large folio to detect a PTE batch for.
> - * @addr: The user virtual address the first page is mapped at.
>   * @ptep: Page table pointer for the first entry.
>   * @pte: Page table entry for the first page.
>   * @max_nr: The maximum number of table entries to consider.
> @@ -243,9 +242,12 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>   * must be limited by the caller so scanning cannot exceed a single VMA and
>   * a single page table.
>   *
> + * This function will be inlined to optimize based on the input parameters;
> + * consider using folio_pte_batch() instead if applicable.
> + *
>   * Return: the number of table entries in the batch.
>   */
> -static inline unsigned int folio_pte_batch(struct folio *folio, unsigned long addr,
> +static inline unsigned int folio_pte_batch_ext(struct folio *folio,
>  		pte_t *ptep, pte_t pte, unsigned int max_nr, fpb_t flags,
>  		bool *any_writable, bool *any_young, bool *any_dirty)

Sorry this is really really annoying feedback :P but _ext() makes me think of
page_ext and ugh :))

Wonder if __folio_pte_batch() is better?

This is obviously, not a big deal (TM)

>  {
> @@ -293,6 +295,9 @@ static inline unsigned int folio_pte_batch(struct folio *folio, unsigned long ad
>  	return min(nr, max_nr);
>  }
>
> +unsigned int folio_pte_batch(struct folio *folio, pte_t *ptep, pte_t pte,
> +		unsigned int max_nr);
> +
>  /**
>   * pte_move_swp_offset - Move the swap entry offset field of a swap pte
>   *	 forward or backward by delta
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 661bb743d2216..9b9c35a398ed0 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -349,8 +349,8 @@ static inline int madvise_folio_pte_batch(unsigned long addr, unsigned long end,
>  {
>  	int max_nr = (end - addr) / PAGE_SIZE;
>
> -	return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
> -			       any_young, any_dirty);
> +	return folio_pte_batch_ext(folio, ptep, pte, max_nr, 0, NULL,
> +				   any_young, any_dirty);
>  }
>
>  static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
> diff --git a/mm/memory.c b/mm/memory.c
> index ab2d6c1425691..43d35d6675f2e 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -995,7 +995,7 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
>  		if (vma_soft_dirty_enabled(src_vma))
>  			flags |= FPB_HONOR_SOFT_DIRTY;
>
> -		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr, flags,
> +		nr = folio_pte_batch_ext(folio, src_pte, pte, max_nr, flags,
>  				     &any_writable, NULL, NULL);
>  		folio_ref_add(folio, nr);
>  		if (folio_test_anon(folio)) {
> @@ -1564,9 +1564,7 @@ static inline int zap_present_ptes(struct mmu_gather *tlb,
>  	 * by keeping the batching logic separate.
>  	 */
>  	if (unlikely(folio_test_large(folio) && max_nr != 1)) {
> -		nr = folio_pte_batch(folio, addr, pte, ptent, max_nr, 0,
> -				     NULL, NULL, NULL);
> -
> +		nr = folio_pte_batch(folio, pte, ptent, max_nr);
>  		zap_present_folio_ptes(tlb, vma, folio, page, pte, ptent, nr,
>  				       addr, details, rss, force_flush,
>  				       force_break, any_skipped);
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 2a25eedc3b1c0..eb83cff7db8c3 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -711,8 +711,7 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>  		if (!folio || folio_is_zone_device(folio))
>  			continue;
>  		if (folio_test_large(folio) && max_nr != 1)
> -			nr = folio_pte_batch(folio, addr, pte, ptent,
> -					     max_nr, 0, NULL, NULL, NULL);
> +			nr = folio_pte_batch(folio, pte, ptent, max_nr);
>  		/*
>  		 * vm_normal_folio() filters out zero pages, but there might
>  		 * still be reserved folios to skip, perhaps in a VDSO.
> diff --git a/mm/mlock.c b/mm/mlock.c
> index 2238cdc5eb1c1..a1d93ad33c6db 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -313,8 +313,7 @@ static inline unsigned int folio_mlock_step(struct folio *folio,
>  	if (!folio_test_large(folio))
>  		return 1;
>
> -	return folio_pte_batch(folio, addr, pte, ptent, count, 0, NULL,
> -			       NULL, NULL);
> +	return folio_pte_batch(folio, pte, ptent, count);
>  }
>
>  static inline bool allow_mlock_munlock(struct folio *folio,
> diff --git a/mm/mremap.c b/mm/mremap.c
> index d4d3ffc931502..1f5bebbb9c0cb 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -182,8 +182,7 @@ static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr
>  	if (!folio || !folio_test_large(folio))
>  		return 1;
>
> -	return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
> -			       NULL, NULL);
> +	return folio_pte_batch(folio, ptep, pte, max_nr);
>  }
>
>  static int move_ptes(struct pagetable_move_control *pmc,
> diff --git a/mm/rmap.c b/mm/rmap.c
> index a29d7d29c7283..6658968600b72 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1859,8 +1859,7 @@ static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>  	if (pte_pfn(pte) != folio_pfn(folio))
>  		return false;
>
> -	return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
> -			       NULL, NULL) == max_nr;
> +	return folio_pte_batch(folio, ptep, pte, max_nr);
>  }
>
>  /*
> diff --git a/mm/util.c b/mm/util.c
> index 0b270c43d7d12..d29dcc135ad28 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -1171,3 +1171,32 @@ int compat_vma_mmap_prepare(struct file *file, struct vm_area_struct *vma)
>  	return 0;
>  }
>  EXPORT_SYMBOL(compat_vma_mmap_prepare);
> +
> +#ifdef CONFIG_MMU
> +/**
> + * folio_pte_batch - detect a PTE batch for a large folio
> + * @folio: The large folio to detect a PTE batch for.
> + * @ptep: Page table pointer for the first entry.
> + * @pte: Page table entry for the first page.
> + * @max_nr: The maximum number of table entries to consider.
> + *
> + * This is a simplified variant of folio_pte_batch_ext().
> + *
> + * Detect a PTE batch: consecutive (present) PTEs that map consecutive
> + * pages of the same large folio in a single VMA and a single page table.
> + *
> + * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN,
> + * the accessed bit, writable bit, dirt-bit and soft-dirty bit.
> + *
> + * ptep must map any page of the folio. max_nr must be at least one and
> + * must be limited by the caller so scanning cannot exceed a single VMA and
> + * a single page table.
> + *
> + * Return: the number of table entries in the batch.
> + */
> +unsigned int folio_pte_batch(struct folio *folio, pte_t *ptep, pte_t pte,
> +		unsigned int max_nr)
> +{
> +	return folio_pte_batch_ext(folio, ptep, pte, max_nr, 0, NULL, NULL, NULL);
> +}
> +#endif /* CONFIG_MMU */
> --
> 2.49.0
>

Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE92B66E
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 02:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747017609; cv=fail; b=ndUI1zrXidtEZTF283eQ231pGydpOso4lzmkIe9udCR2CgP6+ioGpGTJMorTgVShpb2UltVz/ZzlfnQmYirFmB42rgUDyxgh7hIP20YQzYfm8yZxmxzUCVt0mv5CUXfaMQHRp95POzctVsmf3sHgh+a1Qcwb/nWlOGEAPa9DC5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747017609; c=relaxed/simple;
	bh=JqmLpcbX2HO9/YqCWy0pe6F80m6ux48kqK5vlA03Tb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tzY7aiqq4JttTZdsBHYZBpDQF9ABiFIzwTRvCQe7sUwxg7x2Tv/T0kJkpXlbBuLK16CYxZ6cDzJ/YM3iHJkg8bAvi6GexzF2v7+XfpQC5lfo4Kwt81F+5SUW8Oj/XcpMdgaZiPNrHCs6q3pAnY0mdP262grDrIKIBej3Ecvbzqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oaUtgJw6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MXa/XZJv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oaUtgJw6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MXa/XZJv"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C1Gj85029178;
	Mon, 12 May 2025 02:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=EV7d3AZVj48kky+ALc
	1s8kSYcmnn3QDlCsY2+7E8bdA=; b=oaUtgJw6Ods5cKDvHdRIXdRJilPHBscEe3
	M2Z+fd9LbcssdnaLZzf31mMHGGSnUq8MMDupliJcTKDzjdIixu8ltGQ8V6s3cH6R
	d3guofLiCfYn7dk1v9i6v//aVGU8pWWpE1Bp55zOIXCxEkH/TN8U/K9A267iEKq1
	wvZq3yIlHF/stW9HTpP3ZX80Lkk90M1+U0sv4WPOi1ZK3gG+gwzRrZxY3BQzmdjn
	ogLxAVQjpv+mwC8e8TeDUPHRjePDbfUFbrcZe4Vel9CuWutK2jyinxeVPZcfQRa/
	sdmGz/FdiTKTaCe0CePGyLbWiyh0WJxHu+68MB3o5KkGgE1UeY0g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j059sp4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 02:39:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54C2F5WQ002030;
	Mon, 12 May 2025 02:39:25 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazlp17013079.outbound.protection.outlook.com [40.93.1.79])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46hw8dcbs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 02:39:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwrxQHSMSGC9zKdO+fHh4tKvwRFjrG0khwSEE8jnUyNL8FxmJ/Ec9yQzoevHZTkdXxX2Gs8ejqNoW+KCHnRooD0Xt1+MljjxX8zMhNd931+6fJPwP9uLiO349aEjsCXL3TqMjgixXREkgxOU+OGUe7aYepFT0brNOZLIUaJ6CLYnL2PPik+gNlEoAW1iafNS3a+rGJpRNUGnoQlHprkq+tUUojRhGvrNQSNvxserwVjxzaRGyL0E54CQNj25nU6+qVksOUhDDa19TsXmt0aUBCXGPI29o3TyAokJt1DexLHI/4U+LapZkfF2k3azd/D5dpus7r8C4LmM5PKKrDg3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EV7d3AZVj48kky+ALc1s8kSYcmnn3QDlCsY2+7E8bdA=;
 b=yF7MHslrcNds8rICp+5aUC/zrpJL4R42niYdwlaju3cCcGJcnDL84RjonNEpdV7g2H3kOYdd2pfXM4CdmDgBeDDi9qDdaBcTBv8cIn2/Y686EqbC0LRoRrfEYiBJyN2Ok/9VNDNaMaHCweOoxSlnN9knK6L2y4zKcHLqxk+w8weghhZW6g0aqkVwc9+jKQ+imEeI6VLIVsaHNGxlHg9uHXgr5sM3UCUkMqSi+h/jPSJRi8ILZHr4jg32M7dXwDo8EkBj2hCi35qXL7JX8HS0EneCEq7yB6Iaebcn9GyMB+3Qu+Yofbzw8Rt7kB7Wd2eQLn0iUz2omBrE77f2vJ1kRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EV7d3AZVj48kky+ALc1s8kSYcmnn3QDlCsY2+7E8bdA=;
 b=MXa/XZJvd1V2wvDfGnveT0cIi/H72/+0LJ9sVaqaPJKyjuUCcukweHVt9nW9Y38poZnhbSuwNLwi9WXajex6pwMoTaLEb+Zp1qdI9oqNLTH/ui4ZLUXIQOs9OMqJ4CF9XxjSVMQcDHrzsReYfQhbxlh2QLqEDoAwPzFGVIoonxU=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by CY5PR10MB5938.namprd10.prod.outlook.com (2603:10b6:930:2d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Mon, 12 May
 2025 02:39:22 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8722.021; Mon, 12 May 2025
 02:39:22 +0000
Date: Mon, 12 May 2025 11:39:16 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
        Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mm/vma: fix incorrectly disallowed anonymous VMA
 merges
Message-ID: <aCFfVHFq_4enEgsL@hyeyoo>
References: <cover.1744104124.git.lorenzo.stoakes@oracle.com>
 <18c756fc9eaf7ad082a710c91133b8346f8cd9a8.1744104124.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18c756fc9eaf7ad082a710c91133b8346f8cd9a8.1744104124.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: SE2P216CA0183.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ca::8) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|CY5PR10MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ab54f7-cbcd-461e-20a3-08dd90fe3393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fjz2768UmclpwFao8MyPnxaCotg9MquesaLRuYnzI/LKA5X+ai526YTgSBz4?=
 =?us-ascii?Q?9+ozthvTzL2CYH2u4eBKM1OEKEmeX93niJK09UpX3Fq6h3qcWr1kFGaop6Pb?=
 =?us-ascii?Q?I18C4Ts42RJ8eaQKq7V9fq6UXJ1LFHjb9Y8ergKsax7r9NV+2loKLAaIFPDX?=
 =?us-ascii?Q?M2u19nqPk4k4XerGB2615ICRZDn3mNTKlRpCraxpXZyXY/D8kXwYvbYqwA+O?=
 =?us-ascii?Q?dMpFn/oep505p8eBnyPzMdR2h/T7QOGNyc2lbW2v3/iKX/sKsDibSFsJhZEx?=
 =?us-ascii?Q?sY0hOnC13E5PvBlQ1V0jGjHfNckN4ee+SeFS3wrUtQpFWzQ3SIxLJevZ5/qZ?=
 =?us-ascii?Q?vqMyrGFT3kMhs3a77hj+kJM3kjHvcT+dQtyBk+dBSBD2LwsHg/Yn59AZ4YnQ?=
 =?us-ascii?Q?K/E6O7ZYIoNYJyCWNN0GyWULrubIJ7HDdc+mcn5sOQS6Y6JZVmBVirhXxR/r?=
 =?us-ascii?Q?TTgykI7p0oQmlYwPue1V5PcYTmIERPIUQRqqr3J9Ni8QGy+c8+7SAlulrOQr?=
 =?us-ascii?Q?SGVZDKjoTlAwNThT3dTaHQyerJZ4msVSuqz3x0V1uG8LVALiHGKckm7tPEeo?=
 =?us-ascii?Q?YjxJJuP1wsUgAzxu2UPRZGg8Z+YWbvOapKpmK/gMGnTrPIocBPEuVXBoIrFZ?=
 =?us-ascii?Q?q21G3plYjvIEjVNZxZWUxkuhu+0c0FMPJb1Us96hMD0IAHQHMSZnowNZwkfH?=
 =?us-ascii?Q?dWBEpT4qDT3s2FhrbWEvqNxVyusdgp5fwuLrsHnDGrG12j7jaiII+HUIK3ir?=
 =?us-ascii?Q?aZ3PUBWjxd2db9wLEakRvsVH1OmH9lSGxtvOz9o7CyddDonqJXpG7fThnx6K?=
 =?us-ascii?Q?Qv6/W1AWDQW2J+RFF/Bzck669VZaC9y5p0bQVu3+ReR7ioL2oIrPuXPbBbnC?=
 =?us-ascii?Q?QU3RQ0lPg6JheCxwBoeHmHQEWsTtZ75XpAno5stdymFxAyXeK0w6YRVO8ZWL?=
 =?us-ascii?Q?m715zq4Htp+X09yF7qBfhVuO7f01HmPH6u8zcFQ7BJQA4ZBT6EKeJis3U4By?=
 =?us-ascii?Q?Hz3/Rax3CC0aqVsaJz9jvhYT+gU/VXIebzPXH01sJ/bTC2AZqx8ekhNbvVk1?=
 =?us-ascii?Q?gjPeeNe4LCKCyfmd3dBtwHzS5mA8dpNQ6zffJ0tvnHe6KJ+w5mwJ+4i/yNV/?=
 =?us-ascii?Q?DJ6m2B7Y2dHkezlTRsheddMorIrpUm2zEfQ/0YVWERLl1dOfu4PFQGItheTs?=
 =?us-ascii?Q?1JC1MbnAo4v7neBzaMgDJEuPZaRL/ray9QpJYBarQELC4s74j9R5dndNq9VE?=
 =?us-ascii?Q?MNdWGZn0DMm+aNVwJYcMUmbzLEuJLhAqFhuh28/uSy+zbLyMxHqrvTLS+R24?=
 =?us-ascii?Q?0S5kxzWbnWU9CZov+nMksl3MSFSHKwvYaK7G0bLqVFOrgAKV+IOtNJmkzOXT?=
 =?us-ascii?Q?uyRH6ibpUlOI0O5uSXLAtnF7G+fXWbBBgFCv8Psxq+yNsyk6KIrA/wS0kfxJ?=
 =?us-ascii?Q?wSNMS9NRiRg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FEC8bavmv5c43R6ykf0Uy+ZK+CxXQjPHh/+ZeeMW5vyUh5OTgj6Tlnr64S4v?=
 =?us-ascii?Q?bAGPzNAl168VqcqjMHdtreMMp6pthcnFSJIGiv7DpaqEHRT5XITuXVnSme7L?=
 =?us-ascii?Q?k1FAPfwZ4+y7PoPxoMcX6uAwApS4pu2Gu5MFGDKIM8g7b2jeqbAdq1idOny4?=
 =?us-ascii?Q?94GHwt9m3Q4+0iF/vW70bVXRC3cTnNPZPRFuMsHjL1du8SMdG0MmRuGBf/ov?=
 =?us-ascii?Q?rPd5nynDnHsjso8QTgkk+zJ1C9dCB9ZjiKdRi8MPAljTc79vXbb7j0zVDnYO?=
 =?us-ascii?Q?cicIXHMC/rKgpfLFouppTsvvpeo24qFRxzUwyE5FSIHUc3RGQQdiyyQQdhad?=
 =?us-ascii?Q?yLNnkedB7P19SyJxD/BEvb9EeJNz6Mym74PNzim1DkvboVIujALJQtGb+cfr?=
 =?us-ascii?Q?5N8GyFOuNwlZhG9J7bLIqiS50hEH7lkA7MzCLUZIFdXVOlVvwHKWmBncBZrQ?=
 =?us-ascii?Q?VM0MswTQCwz3wjdCv9jUWKfw1WFIN25wBFbt6ayvmAv6sxnhZ5WzpPTG/Jhx?=
 =?us-ascii?Q?icvcnYAcvcaRvLHvlOPrOAyr79DvVm5uDc7D8Za/6kBiOXS0g9IhAzIMQ2WS?=
 =?us-ascii?Q?afp/bbWwNIlqgYqwPVNGL0hjmzO+38pVORKUsCYPC6BPSUOOFqMRTw+gp4aw?=
 =?us-ascii?Q?HXCKsnFAvD+U0exheep0RZ502Xxry4CCFxuj5TlXVYN0ZveSi1XRWlV3aPAF?=
 =?us-ascii?Q?vV5dFyZXoQZT/CLe5+YEz7lF5E7WiFwXIfNWgS752xxYeb8LHgKeZYXYuQTJ?=
 =?us-ascii?Q?HAT1SWIWCzBeFAwYdq/enFkoE23ZXitZjqBjmp4u/6HQVXfYhOWx8PLkibBj?=
 =?us-ascii?Q?cNF0hMPcemeGRcO9uWyLFuLgvnt0AqIQwq9iZ1sVEDMi/LAP991TV6iIv7Kz?=
 =?us-ascii?Q?wCf32qTzEibUXSdyRiNwdLvOW/1PN7RzAygWeUvtuOX+fwCx4pxfLe2D6Yal?=
 =?us-ascii?Q?aoKnX/idU8X1qB0U3uT3dXX1IW8xMZvtp+uEUPhs5uT50y06Ff1TRsd8fd1E?=
 =?us-ascii?Q?zwTVpUP7Zi/rwzjvbNhYciFI8Jgevd9bbKVZEiNplwtPccDLwjlwtrqWs4p7?=
 =?us-ascii?Q?NLRBQCdyPXHwveu0OzayLhAsIN9/w2zKJWYSWjGiUG7w5yeayEtWpB9FUivF?=
 =?us-ascii?Q?/h4EiU58QUcY7sTznhW0eNjDaANMO5HjggttjbuMh5xnakr+pVUaX7BNUo/m?=
 =?us-ascii?Q?sU6MxHGoMJiypoC/uEkfQJEapUCaHaR201D+/96LYHNFF3eT3jJ1GAcyPJs1?=
 =?us-ascii?Q?3nI+N8oRVtzXT7CQBtigt0UiLSoMoXwlI94DI/9rzDYklT97+vM+reBrSh1H?=
 =?us-ascii?Q?skPvY3AKtkP8spee0w0wmWWVwwzmNzPFiVTZTPB0CxEXkTfOP5Fc8b78AyoP?=
 =?us-ascii?Q?KbVzktIDei8Dgn73gfxK0QIeRH3C1MWuZUjWM2Ia5HU+rmQg6n3zqFbQsF8E?=
 =?us-ascii?Q?Zg9WCZtkOIa8z6LPERWcdEpK6Q3F+NbEm9Pc+LXh94lkUEMpbb9uXKY3lDvR?=
 =?us-ascii?Q?RjEZMmB7gih4MG6qMbiOr8+rdKWch84B4MD1hW6ff1tfRUK+GbdaARFYkwla?=
 =?us-ascii?Q?yEdvJhi8MppbjT53sUlXMVQ5zt2r8P+Qr3k2/fTI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7zYQnsI1lMHQOjdxybuWPzMQ/ddeMDFqpRicCjpgQVYnR5pYkGg5HYe3/qPK+AqTwONDOpkeyEPmpKkrhkykPzICXdEm86Fb1eVQrJDCe6Qjbq/Q9ZTrX8SedHYOSrICKhHr0fb9gwVZkyzz0/GMkCpbsJfeou4KutCuxaeETOv+hPYoqXtFKA5WAhxiAA6/EbQN2jpFLAJ19/U4/sHb5QQhP3VFGH4T6KL0uZ36z0GvZofel7RYp3DgKg1o3pkkcoh/B0lQ3jaH4IBipM1AuaCJ3RPEd/cbqv+NKhZerG+F02AHEzfsXC85w8KGwVfNmGrkExk4voOTBAo4MGLESAE9V+uyv1jxYELhAhXMxcRrObBrZ97tH0PSpHsuKYj1SolYVaUKUkf3SONIFTSvAmuCtDf5CBkoDvVdprzOu5k5JB0tpI+sE/+Pt6fWT2VQAmYsnNVlL5tio/hiakUAG4QxL+i//Iw6E0zfK0okeHjinX+lDAk8eacn7e3DOv60F73e9i22F7vTIuZIGupVVrB5KRCUZKdnX99dgWVjQm0EcqkhVYp3vGyCxyeViviz5LYu4//A6XpQgAIIVWcA1kckpIln7u/4q5V4cBdlKWg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ab54f7-cbcd-461e-20a3-08dd90fe3393
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 02:39:22.0609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ud1cIb0ORqgmGFf3zLPQUKMppg1ible9GCEREIyqaJkThPo2fYlkS0UQAyCoETVEMoQxDcUtJszFE7MRjr4NzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5938
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505120026
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDAyNSBTYWx0ZWRfXwoE4ONwIKK5K qWdlSuruGZBmaZpqyLkKz/ivd0Xx7q6zc5vvziApycP/+Juwc6AI1jN3IiHT/d6bFFfrKR+BFFK zrtebAx44HptLH15cZZnTkJOhD3vBpJuQI5k6+D9s0aHY4i63mfqPZfBGlS8auTDAag7keJyB95
 h39H5moYpuj63TMPD2k9c/EFMy09jM5eoHuNL9g4QBE8f+wWGeC6ewXwoyhz89Zw6rI4cee8zJB F0gPZlDturC9nzKTt7Z9AP9JvpKGYruvExub6rt99xWUN6VJ+uVMulhIuT2kUa03niu/5Hv0Y6p 4Rjf5QZ5YHTVpWzn5A793GgYA2uddtthDGhXQDhL2YL0Wd7Lob597nZeNy1UkDi1rMYkwR8Hl6W
 dxwtEhSqAZpY5IoUPp6yB/wuXsUmkNg+LNJri4Af5Q5BXwVeTq7s+9MshB4Kk4cvlJ1/cvnL
X-Authority-Analysis: v=2.4 cv=RPmzH5i+ c=1 sm=1 tr=0 ts=68215f5e b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=7CQSdrXTAAAA:8 a=ZKWSKcWNFUq99PCHIAUA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13185
X-Proofpoint-ORIG-GUID: AJAGZLkQItTwObw9_0B6JjbmO8HXFPmP
X-Proofpoint-GUID: AJAGZLkQItTwObw9_0B6JjbmO8HXFPmP

On Tue, Apr 08, 2025 at 10:29:31AM +0100, Lorenzo Stoakes wrote:
> anon_vma_chain's were introduced by Rik von Riel in commit 5beb49305251 ("mm:
> change anon_vma linking to fix multi-process server scalability issue").
> 
> This patch was introduced in March 2010. As part of this change, careful
> attention was made to the instance of mprotect() causing a VMA merge, with one
> faulted (i.e. having anon_vma set) and another not:
> 
> 		/*
> 		 * Easily overlooked: when mprotect shifts the boundary,
> 		 * make sure the expanding vma has anon_vma set if the
> 		 * shrinking vma had, to cover any anon pages imported.
> 		 */
> 
> In the modern VMA code, this is handled in dup_anon_vma() (and ultimately
> anon_vma_clone()).
> 
> This case is one of the three configurations of adjacent VMA anon_vma state
> that we might encounter on merge (where dst is the VMA which will be merged
> into and src the one being merged into dst):
> 
> 1.  dst->anon_vma,  src->anon_vma - These must be equal, no-op.
> 2.  dst->anon_vma, !src->anon_vma - We simply use dst->anon_vma, no-op.
> 3. !dst->anon_vma,  src->anon_vma - The case in question here.
> 
> In case 3, the instance addressed here - we duplicate the AVC connections
> from src and place into dst.
> 
> However, in practice, we very often do NOT do this.
> 
> This appears to be due to an inadvertent consequence of the change
> introduced by commit 965f55dea0e3 ("mmap: avoid merging cloned VMAs"),
> introduced in May 2011.
> 
> This implies that this merge case was functional only for a little over a
> year, and has since been broken for ~15 years.
> 
> Here, lock scalability concerns lead to us restricting anonymous merges
> only to those VMAs with 1 entry in their vma->anon_vma_chain, that is, a
> VMA that is not connected to any parent process's anon_vma.
> 
> The mergeability test looks like this:
> 
> static inline bool is_mergeable_anon_vma(struct anon_vma *anon_vma1,
> 		 struct anon_vma *anon_vma2, struct vm_area_struct *vma)
> {
> 	if ((!anon_vma1 || !anon_vma2) && (!vma ||
> 		!vma->anon_vma || list_is_singular(&vma->anon_vma_chain)))
> 		return true;
> 	return anon_vma1 == anon_vma2;
> }
> 
> However, we have a problem here - typically the vma passed here is the
> destination VMA.
> 
> For instance in vma_merge_existing_range() we invoke:
> 
> can_vma_merge_left()
> -> [ check that there is an immediately adjacent prior VMA ]
> -> can_vma_merge_after()
>   -> is_mergeable_vma() for general attribute check
> -> is_mergeable_anon_vma([ proposed anon_vma ], prev->anon_vma, prev)
> 
> So if we were considering a target unfaulted 'prev':
> 
> 	  unfaulted    faulted
> 	|-----------|-----------|
> 	|    prev   |    vma    |
> 	|-----------|-----------|
> 
> This would call is_mergeable_anon_vma(NULL, vma->anon_vma, prev).
> 
> The list_is_singular() check for vma->anon_vma_chain, an empty list on
> fault, would cause this merge to _fail_ even though all else indicates a
> merge.
> 
> Equally a simple merge into a next VMA would hit the same problem:
> 
> 	   faulted    unfaulted
> 	|-----------|-----------|
> 	|    vma    |    next   |
> 	|-----------|-----------|
> 
> can_vma_merge_right()
> -> [ check that there is an immediately adjacent succeeding VMA ]
> -> can_vma_merge_before()
>   -> is_mergeable_vma() for general attribute check
> -> is_mergeable_anon_vma([ proposed anon_vma ], next->anon_vma, next)
> 
> For a 3-way merge, we'd also hit the same problem if it was configured like
> this for instance:
> 
> 	  unfaulted    faulted    unfaulted
> 	|-----------|-----------|-----------|
> 	|    prev   |    vma    |    next   |
> 	|-----------|-----------|-----------|
> 
> As we'd call can_vma_merge_left() for prev, and can_vma_merge_right() for
> next, both of which would fail.
> 
> vma_merge_new_range() (and relatedly, vma_expand()) are not impacted, as
> the new VMA would never already be faulted (it is a proposed new range).
> 
> Because we already handle each of the aforementioned merge cases, and can
> absolutely therefore deal with an existing VMA merge with !dst->anon_vma,
> src->anon_vma, there is absolutely no reason to disallow this kind of
> merge.
> 
> It seems that the intention of this patch is to ensure that, in the
> instance of merging unfaulted VMAs with faulted ones, we never wish to do
> so with those with multiple AVCs due to the fact that anon_vma lock's are
> held across both parent and child anon_vma's (actually, the 'root' parent
> anon_vma's lock is used).
> 
> In fact, the original commit alludes to this - "find_mergeable_anon_vma()
> already considers this case".
> 
> In find_mergeable_anon_vma() however, we check the anon_vma which will be
> merged from, if it is set, then we check
> list_is_singular(vma->anon_vma_chain).
> 
> So to match this logic, update is_mergeable_anon_vma() to perform this
> scalability check on the VMA whose anon_vma we ultimately merge into.
> 
> This matches existing behaviour with forked VMAs, only we no longer wrongly
> disallow ALL empty target merges.
> 
> So we both allow merge cases and ensure the scalability check is correctly
> applied.
> 
> We may wish to revisit these lock scalability concerns at a later date and
> ensure they are still valid.
> 
> Additionally, correct userland VMA tests which were mistakenly not
> asserting these cases correctly previously to now correctly assert this,
> and to ensure vmg->anon_vma state is always consistent to account for newly
> introduced asserts.
> 
> Fixes: 965f55dea0e3 ("mmap: avoid merging cloned VMAs")
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---

A little bit late to review, but better late than never :)

This patch makes sense and looks good to me,
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>

-- 
Cheers,
Harry / Hyeonggon

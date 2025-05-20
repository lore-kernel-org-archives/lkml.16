Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2107.outbound.protection.outlook.com [40.107.103.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C325A22B8B1
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757369; cv=fail; b=VdlfhI8lAC5Gs+OdETV7l86WB86+m79bnMW72Q3M3LXf7iwQnFVXlgg20icZ7t6IJtl+1n7YaQpKySoYjxq/HIMElcBKyd43OFrMZvmgfDSF95FGtmIS3zFEtqZwW+vvYZwsux5NiaZPW/kgRdEs+6XOfo+FQOLMKUBsA07/24I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757369; c=relaxed/simple;
	bh=2DB26Mv4NVeZVjTnSJ9KdLVtl9p7d0WMDsltd2Ph23g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kN39N11SGZNKprOrqTY+M6+WL76zXe1zFrnbktVnmaNnLRX+cJEHXkQt+BQk2Fw+vlstjODraRXdJMG/F98T3KwDrM8joE8FjjscBxAh4tcGDfbbxftjbt0zqLWF0RqUU1hzC+0MinuXzgGI2izw0UAS3u4mTfKbO+mkZTAEhro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it; spf=pass smtp.mailfrom=santannapisa.it; dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b=oY9+tIY0; arc=fail smtp.client-ip=40.107.103.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b="oY9+tIY0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ely4f/VWZljBr3W8gNWArkP4qNqGYhadFGGwoKcpp/A9XzOnZI3L6NZ0Aulbo/rWRlfgaERZ/FfBNHR5/AQv3w6Kq6pPNEr/GlrFD6IGrgL/r18fXHsVJv/k6IANLxmqHpWNKiYPxub3sTejonpC2tVKq8rzlrjizZNvQaSpc/kmKeqZZ9Apa+VCKR0p/I8wM6inKh9XdLZ6VZ1zBrDIcWF15sneXhkFsARw8n62E8uGhsVW9dXMi5EgIxdynQZ+tD0M9VTsDfEoWoL2h7boFJ4y2qjBDbIXQy3JHTzRr97pOADvkOuR1r5jPjeUqx3LG61BjXsVTddGlbb4X0/XDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7y28q46CM5bcvv5U39uPXo9wcCNk4WDHTlvZFC35VM=;
 b=MWbK17PJObL2C71ElCCF+ytexMJPbLKRjlbPCDBYABbAxeDAdt4OML7D51dKKSYFtzvvvERJbmUW01dIke/mTXcybMJzC+Z1XUFRICMhO2yIPC6BrFtZiZS8ZblD/D+zaF0ufuttqW5a93hmBw8gJt+GI4WZfC1Mj/s86AJP0ImsE4Digov/4xH2Ck4CLZkTP703VP8csLsIZi3Kgi5wMhpSnqU3aTGjyvWCiOhhqBW66ibEkJC1Tg/CesZWehBOwraXk6oFz0ZZ96inoGfQYYzzDMdd5whk1vpXQR6fTSzlHYBZTCsh9Y2Ntn/hVl2qVtzVvZum6qEp/n2QMzWyfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7y28q46CM5bcvv5U39uPXo9wcCNk4WDHTlvZFC35VM=;
 b=oY9+tIY0JZ/KAknfYA0sOOQnu0jXSXoBSZ7Hx5tkhyu51oAYqhLxtf1Kb9kf1eDG6ySPiWjGA6q4CyE9BnWgJ9LgjV9jz/sOFVVBMJwJ4WGXDvTQWdsPMtrAGSX29RhyQVyff7RvCT8L1gYvh9ALUA1X59i2GWfpTUgDCcQQZ9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com (2603:10a6:102:32e::7)
 by DU0PR03MB9756.eurprd03.prod.outlook.com (2603:10a6:10:44b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 16:09:19 +0000
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235]) by PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235%6]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 16:09:19 +0000
Date: Tue, 20 May 2025 18:09:15 +0200
From: luca abeni <luca.abeni@santannapisa.it>
To: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Vineeth
 Pillai	 <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <20250520180915.16ba1c5c@nowhere>
In-Reply-To: <92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
	<aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
	<f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
	<20250507222549.183e0b4a@nowhere>
	<92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
Organization: Scuola Superiore Sant'Anna
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR2P264CA0181.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::20)
 To PAVPR03MB8969.eurprd03.prod.outlook.com (2603:10a6:102:32e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8969:EE_|DU0PR03MB9756:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c4e14a-c8d0-402c-5950-08dd97b8acff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0Y62SzJ8LU+fUdMud8YBnWxfoDhrIbMZOIR+62xslutObvp/Q4ARmjZQgJX5?=
 =?us-ascii?Q?LTUiQAjCKUgS6CjwZ2YhU0b8dkdFWIf41N0QacNSC1RIQDOgdXHoNTT1u69d?=
 =?us-ascii?Q?7w/3gqowhjcqaWwFCl6sZh4dCNef+fz1KMxx2seSAAzoYOyfky6q4ughCYWC?=
 =?us-ascii?Q?GgWqqNPvUUlFn0oLFogZWeoSuDH7UJZRYkmgQ+F6Icp6Su5QBtQQtKw7tHMF?=
 =?us-ascii?Q?bZ4e9GfpU1Fz0SBXuFXwbuCq1H86T5GC3e7o+dKBG4BMHgKsdm3hti3GaYP3?=
 =?us-ascii?Q?gSR+FckV+RrsPa6ElUVaVoXk0IO8LN8auJFxn0Gq7pRYl8FM1ktkfvXJYf3X?=
 =?us-ascii?Q?QSNRrzgnZaZ4l19rlUrlpfpy3PCkqRxl2nwkXy+vqkth7RCWzMBW+bvtV3SI?=
 =?us-ascii?Q?fRs/zbZ36FxMCRMLnUZiuzjVRrqet0ki2Zm4/EnXZ1WfPxCRHOl2bE0EBycR?=
 =?us-ascii?Q?kLHeJqCvaxcJqfLNI3Rh1lGq+NJ41oh0vHdewlSf81Lne9G6KezmGCYwV7AR?=
 =?us-ascii?Q?CColyiAi9z+83sjxO/jSVpLeXrhMkcfEb3QTtzk8EldDyETEw9eP2X7LXGBo?=
 =?us-ascii?Q?glS70Xdy6dxTOxR7gTj7lU3vwsoM6DXCEI+1ccaNK/FCN9+odIZMUuZT+CnW?=
 =?us-ascii?Q?TGNovEIP4fTHmNW9FZ/qDkxUr4Bz3CV9L6hobidOjR9ynpioDme6scM66Z1F?=
 =?us-ascii?Q?8jBea7+LHccnu63yTiXD/9JGpkpa9S1tV6MD5IVoJla0FqEDFaIW5SxEg41u?=
 =?us-ascii?Q?/vW4IctacA92sj9M6g9YJFCH89Fjn2Z3Y46k8Yb4oCuMH6UOweyitOBgQeUH?=
 =?us-ascii?Q?EA+3b8lELFHcl9rLLMpleLblNm6m2qvywtgkAABMHojBtHVXYpDrkHK41buA?=
 =?us-ascii?Q?hydh6cB4XNxi1s4SrbLcg8K1H2wjQKr/FJd68eGKyO2TaK6a3Vje4WXdWjDQ?=
 =?us-ascii?Q?M/yL9yXsKi1TB2wuhinx+QLFSlU4t6kIGhHshGI3UEqK+L/Guky3faGtoOfL?=
 =?us-ascii?Q?vWlTSOibl8Fl3QmJjOIRcLuYeRnZhFoY/YndgyLHRjvt3oX08HeGV+Fc6YpK?=
 =?us-ascii?Q?kPZWaa9cejUKoSH9MmnVd9yQwStCqekP6PkAg7deD0Q45gW/ZJqrc38ftd/p?=
 =?us-ascii?Q?4MWZ7pn77s6V7ZhjJCTknG+ErczM7NVJ/TKijpwMRnTHS5kmLVPGNh1FeLSo?=
 =?us-ascii?Q?MmDP0iepmC7npDcBXZXNoICXgGbNkuOFK/93nG0QtDGuJQsN3MIknbdwKOvd?=
 =?us-ascii?Q?d3lLbGcCIiU21hscawfaENd2cpmEyztGvNj6LidY0TZW1Q2Z4QkpxX3+IYQe?=
 =?us-ascii?Q?bBzo3t7v35+MAuT6Om7Re3Sncs/jFJaC36g+C+fA4cVPgGYmbZVP8K5lb8Ly?=
 =?us-ascii?Q?dpAQls+r7Z+MWNfW+soehJ9GTSWNYUWbEKoqq8XUrFXPmNe/lQl82o5Tax/x?=
 =?us-ascii?Q?uMZdzovYAWw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8969.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AzR1GkA0s0JVW+MjChcjYIroNGSxyAkUtdlXlE2TvLsw2R+Zwp+/u40bn8eh?=
 =?us-ascii?Q?VCX9uRMPcOj+N6bG73GH6gRkCu9TqExKy5TU5nbpouKjWLQ6wtrFbVzQHLVp?=
 =?us-ascii?Q?+dJrp/P7zMmj7UpRYNj3w7x3g5RDwe1zFwE0ONbKBZwFpAdysSWX/ObQehGR?=
 =?us-ascii?Q?osx+R99W5KBdJzbfF/b8CHZDOCUFFfC8xT0sKXp2iTSmMR5ideVF5GBnI3Z0?=
 =?us-ascii?Q?Mg5rVwFC2R/7XhMG+rfl7XHOsGJ1V0GN0ljeLkotiCIyl8gsibWQ5wvoo4Rg?=
 =?us-ascii?Q?lKO38cvmjcO7QLe9jq+uHDnm1dHwZLVme3qXRppDaK4yEKgpnC3wyPv8ebSo?=
 =?us-ascii?Q?FWXDq8gmPRcywobjYYQWG9AE5UhahP3+8VDYLChPJbu6aUC3fhIivTsUNt/T?=
 =?us-ascii?Q?Q+AMcMWWjkm4hnuh374lRGVHzF7Vtcq03sNt2CkE5dj4B50Mpy6cPK2a+1oj?=
 =?us-ascii?Q?Im7iKNkfiACM2a0l7cXfED8YPkUS1AzEAOXkkcrDsSeUJhSSu26nnD6m1PIL?=
 =?us-ascii?Q?mDbYR29E1K/nkt8vJJG989lmVfMBEMBskbHOBtlrXWBwLEAo0KGBV95QKkQQ?=
 =?us-ascii?Q?dfIVQh7fpxQhkijhrgS1U+xWuUEUrTjuVcuEoPjcIUs4cdLiGcWdqjpmPaSP?=
 =?us-ascii?Q?odTaqfZD7FOOus78b3mYsDZRbAmqzjm6wdjyKA8fchP8Vzw40SHhOSQsRlYs?=
 =?us-ascii?Q?ii/HF+Zl/asrxWrv8xGCVqnwbMgUX2g7fQo1VPFS6ivAoQ77p32QpPAoObMO?=
 =?us-ascii?Q?ByTuVCPKtgWzu3Bun1vqEM2YgH56WUdSZQhFKUk8oeEvMyvqFwfSbKlfGfm1?=
 =?us-ascii?Q?UNk1l4NCKteVGwGmMVUYUZeDyq31qJ+Nu5ohrHJ8vCrtfvJuVAc56ZXjqpcN?=
 =?us-ascii?Q?aFqsx9/7Dljyscnz/1B/78yqcuJ8AUck1+gPlhYHBkbPAMCmlxLgmrAubFio?=
 =?us-ascii?Q?qZvGq1hrGRdDilbgMy7lMPSureQ6wDS2P1KQDiErvrjogBYXFUVxbPzMcVWU?=
 =?us-ascii?Q?C0ztev5GtYhmsoY+3IwrZPop3EPwfmTd1YYw9FV7/9eOMBXiep0vYXc8tZCb?=
 =?us-ascii?Q?Z71iwHLcLja/u7bph2RrfoTzp/knKvgqZFfauxhSQLZz6RDouMOaUgyGcDPd?=
 =?us-ascii?Q?1txZx9iv72Pz9pZjJPBjCEaYlD6pj04rEDHF6Vs8AcM/tkljJ5dF3TUFv41M?=
 =?us-ascii?Q?uHLSxJKTN/b0J/G+m0jTjN9phvUqrnjhUUpKniwPmWae7UJlJWyKS4dETykI?=
 =?us-ascii?Q?Lf2+rMRksfsi3hcbT0By8a2rBFIxTViwXkXzfslg7P1Dx0bH7f8m7f8vTSLr?=
 =?us-ascii?Q?uS7GkOXyhULgHecQkoV2lZBPmRQNFCdZQzUqH76JjupeYXuf1cM3s80s1/Ym?=
 =?us-ascii?Q?YDNB0kaj2xWyeVj5QLB3n6VJw6rQJU8jcvSKwFaDL5yp6cTiKD4j2zmvGGYc?=
 =?us-ascii?Q?PQOcyCqyYDB4XOnCE4rCctf6dxV2gk5nu+e5A9VD+K1dg8DiAcSlWrzDVpmp?=
 =?us-ascii?Q?3GbuNFslH5PW7xe0cX5Tehza2X7BWLAgFhKTYZAFUsWVooePmw01NOpwxaI/?=
 =?us-ascii?Q?KxkRmSfTSp5aj5JyZs0XdRtntCVr/SkOgu71ULNJVqe560UJryVniDI2RY7X?=
 =?us-ascii?Q?lA=3D=3D?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c4e14a-c8d0-402c-5950-08dd97b8acff
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8969.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 16:09:19.1012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NvdDsujncfW4gxP2iUipmNilD4tg2b9YtWwVfwMPhZMgsQ0GPYR2PyIb3ug+TBhRgDkKPBdH85nfb5eOrI9ZnPXoeZZaTNG01jfWTdZ0Is0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9756

Hi Marcel,

On Mon, 19 May 2025 15:32:27 +0200
Marcel Ziswiler <marcel.ziswiler@codethink.co.uk> wrote:

> Hi Luca
> 
> Thanks and sorry, for my late reply. I was traveling the Cretan
> wilderness without access to any work related infrastructure.
> 
> On Wed, 2025-05-07 at 22:25 +0200, luca abeni wrote:
> > Hi Marcel,
> > 
> > just a quick question to better understand your setup (and check
> > where the issue comes from):
> > in the email below, you say that tasks are statically assigned to
> > cores; how did you do this? Did you use isolated cpusets,  
> 
> Yes, we use the cpuset controller from the cgroup-v2 APIs in the
> linux kernel in order to partition CPUs and memory nodes. In detail,
> we use the AllowedCPUs and AllowedMemoryNodes in systemd's slice
> configurations.

OK, I never tried the v2 API, but if it allows creating a new root
domain (which is an isolated cpuset, I think), then it should work
without issues.

So, since you are seeing unexpected deadline misses, there is a bug
somewhere... I am going to check.
In the meantime, enjoy the Cretan wilderness :)



				Luca

Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AF3288CBC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469770; cv=fail; b=NFRpSbdB+t0NsN9FQyN7VtEkBgB0Fy7kPKVxWyyIGk1cdkgAtXpJsrJGQ8X83YvyjEWXdl7J/yaUJTX0HGhkxFosDqAtOhyJVG45o8yYCT/gAOuFbVgUug6Y1CZ/wxme8ooh8X8OOLmkjGxR4roxujZ5kePniV4yecgIIo/KQU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469770; c=relaxed/simple;
	bh=tgvhdKOAKhPxpylxlIzkwv9KgQL+zSHph5/wHdOdVa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Bm5eNY1itG/x35ED0yaKKLuWRrfKUxbIdFozu9aQX6wUt/nzt7PIbGMXrJD+TqJQuRFAXGIIBNlgsLpk+Nowb++Tiy/x5cuhOG7xSvcDhIwypd83tUljxdwikgsDs/A22MyPjm5hEx31ZzOjnAuEhoTrMwg2Jki7NT88foFCVQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ma10rM9U; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hlV6bdlv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ma10rM9U";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hlV6bdlv"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562Bib0d024920;
	Wed, 2 Jul 2025 15:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=tgvhdKOAKhPxpylxlI
	zkwv9KgQL+zSHph5/wHdOdVa0=; b=ma10rM9ULoTwdqHL3t+vTD49wLaqkW/U/w
	JzYESqXARNveMe5+VRib6+3P/94xBh2zyhghuU/3NBJsLfnKxU4tYWeglJfYh9wk
	J2JS1+Jyo55shsA+uWlm77GIN7g39CGmwchKrv4E7DaVPGKbOx5LLzg9+SrbamBx
	PNBq3nj3FwazaN8mvasipRb/WUqIqXmh32BgrYVenF4QhmSqxBkdtQgI6dYgSGDT
	bKK02jCxlEQmWOTpC2IoB04F5KgO2cgCHu6j5/6uSmFfH7Vo4T8Lkkwu1JMu5ZhP
	caa4ayGibaTajzuVd+RoCbldNeELRw7Fc4oIeryCeTpibjKAE0wQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tff56a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 15:22:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 562E6U2a025044;
	Wed, 2 Jul 2025 15:22:11 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ujm5y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 15:22:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PR9iodT1/t2jAXmjcFdqqCFWw9t8Ew2FAmC7o32SQ2Z2lROnrFjh/YHd2v3LwjW2YEML4GB74UoQR+NAPUFLFR1ieT+KTkbqa9A04Mwi4OJCqtUZzL6VJaehR6A+ka/rTYR2hTB8VLXMhe68Sdq3qtcbU4Jf8aSvXh6v2CwTxt7MCOsn47Q68wHvt5NjH3GoQe1/f42XHL4sRphbt8aDhbw7nE2eXU59u0KuQ3zVknELE7kg0uPRZBg0SXGokch1+cTGd8ee+bOQoSI/Ys33Czq0H3cOG27VbGul2ZL51/Lj5l289MTfqSZslSTwLT3EbMBlthdPezQW+CkoG9fdww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgvhdKOAKhPxpylxlIzkwv9KgQL+zSHph5/wHdOdVa0=;
 b=jLOcIcNRkP4e5LZc1HT8iabmTZ9xmOCjk9V+3gOJh0ZSB0SMHBAEv5pgO6rAt6DTRcrGID3RZJsLgG1OgH9aYV0AnA3wUGZOBFRrb1ajapZYLmdjDCW2QZ4EFj2mVClztzlEa0RsG4osxHc/uV3SPSQ3uZkNspv/Jbplb3iqjD5pgw3+K+b+O9zuprhMJC22wMl2OjN4HxougFsP/ZaZHLS+gT9F6Ytj8diA3yLMuFuwRtc+JH3RcV6BTeO+R4Vl/IL3GcS1fPsNB/Y11TatKHneo+80QlG3RRz1vpAnHtpw1LmImLI2yG/gbKFCAqEqdwsKkpPLlW1VxXXypwHF9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgvhdKOAKhPxpylxlIzkwv9KgQL+zSHph5/wHdOdVa0=;
 b=hlV6bdlvV/JEIRfkt5fhMMkmOaTbZZ+S70SS6KdMSvYms8t/qSbZK5SicxDpAmYpzRxlx+bgXBoqmA37dhAJT2nNL0F+wzu9IYPPiUcNTXlCG3RxOqdbdVFXjkOscnOmIp3/vcm/aAecul+VbZHW3UBLEp5Mybak2DGRLgk0LTY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB6176.namprd10.prod.outlook.com (2603:10b6:8:c0::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Wed, 2 Jul 2025 15:22:09 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 15:22:08 +0000
Date: Wed, 2 Jul 2025 16:22:02 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org,
        david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
        Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
        anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
        ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
        quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
        yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
        hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
Message-ID: <9c7a0541-219a-4ea7-a7d8-83aaee992b1a@lucifer.local>
References: <ec2c3f60-43e9-47d9-9058-49d608845200@arm.com>
 <5900e978-6349-4a3d-a384-758889b678a0@lucifer.local>
 <3776ac82-4cd5-41e7-9b96-137a1ae6f473@arm.com>
 <64c2ec85-87ed-4793-b0e9-a68eac1a8020@lucifer.local>
 <a2165422-0d78-4549-bc34-a8bbcdb6513f@arm.com>
 <61f50191-8bd0-4f25-b3b7-86605af8c0c6@lucifer.local>
 <aed58edc-88c3-47bf-8cc3-bb8d80c4e221@arm.com>
 <d54cf100-3c74-450c-a7d1-8fedbc97bdb8@lucifer.local>
 <3ce333ae-dae2-4341-83c5-39877b6f2bd4@lucifer.local>
 <1d1312e8-325f-404c-9ea4-03b38ed7b1e1@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d1312e8-325f-404c-9ea4-03b38ed7b1e1@arm.com>
X-ClientProxiedBy: LO6P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: f80dc423-9b65-46c9-93f4-08ddb97c35e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zKkEw+wcU0zjssA7lusuSWVIdHq9710SAS37tRGPEgyQhK9qnPdet7Kf2Vij?=
 =?us-ascii?Q?i6bObZCMIbF+pFycdpO6MXBwPD4xVqLYH3JSwjkukS6DXxN8KGHnBUnyd6Ai?=
 =?us-ascii?Q?+dJVTslIieecus5Q0qtVzVPS6ceC1HaF3/M4eLPUY7eAqGLNByYRWvBjQpqu?=
 =?us-ascii?Q?a2G2uIdMsuY2Ci3nXlbmeVDrz1XTMA+Slhe/21TaKXp03/6L+4Qqe59NbFAl?=
 =?us-ascii?Q?bqWBKYCkwNob/orqJV3H+TTfEk6xlFGWeQ0Kh7AiDU+gptZcdAwdDJRuynas?=
 =?us-ascii?Q?ktOZdjs8fn1FhuqpPzIvXise+NtLgT7XiEuKOi/nWjpM1FPNBSdcQfYMsqxw?=
 =?us-ascii?Q?3ECyIx6rFwBe/Ln6zieQ78ytXvmPcGSU1uR4NeUliHVwsRjVZ3BXpgZ9eta4?=
 =?us-ascii?Q?Fl4BY2vRGzxNEvhJPVGD8BgjI2KOtVif05hP9PXFNesb41LZ3AuT5MznFOZM?=
 =?us-ascii?Q?elNCZCY6+mImlFg8T2ZOoBQTjhi0HGq1dycAZFxgSlPepDDrgUmZxZ12KIrB?=
 =?us-ascii?Q?y4H9jG++VSWH90BOJH5vN3Gg0g8O5Rg24BrCTqGW9rXPsbTVVuWLXCF94zKb?=
 =?us-ascii?Q?ULcYffhm1UDKwyUp+8TWWYqCo+3e6F6PcjeZfqIXilm+am79ryt+6BFavgK1?=
 =?us-ascii?Q?sSgTc7ISHtETl0+4tjg5e29wYH14/N+u0AtE5QGUHXP/cQ0CNq1WMAk7vNWG?=
 =?us-ascii?Q?t2NQdJ6vjlwK1EZSYMyjJThqMO6g71YjMgBnvkcZr41YfVCTwZV7ahThlBF/?=
 =?us-ascii?Q?+WyDJ6UcabqHwhUvciE7uKEFtcMchO1lbxBoNE9xS1FpFmTMIDUI+omdVMVM?=
 =?us-ascii?Q?bM3LliFTV5CC6DLtdJrB0knNKumwIvaYaZ+4HrQwHO0eEpbvHQkUn1QcZn9S?=
 =?us-ascii?Q?sJtU7Lr1pUDmNwqVVxKNxcUPF7cRUDY2jpwVaBf9aPAe/ko2UV37xJAjAl7h?=
 =?us-ascii?Q?iUWOlTgPM0LUt8xXIcmaPOfltRO0fQSu5KKqzbRd2YjLlqTGrCMrFVe8D++t?=
 =?us-ascii?Q?Q7sogoixCp1VkTS98Yp8q2goMHBx4ROVQNUpLTadnMxY+z0WX1NjRdZT0r/a?=
 =?us-ascii?Q?5HGxU4nF/j6mlL2MuxDTp6BqPY3awK6WtLLK3O8AqRcXOoIl0wZQgazicwdw?=
 =?us-ascii?Q?o2gzMjaN4hILJ1eHPlwp1L+sJNrpXbZGCTvWchtKZD3+jD+3Ce1Gx0EJgXru?=
 =?us-ascii?Q?/qfxCtCL7Wb9P2kvTmsO2KpEJVwQDYrQICS8iW/cbl2SmyYju73F1n6LXCUe?=
 =?us-ascii?Q?wvKMSD5oW0T18N6ymnWL/fyMCp/gg6mxaYd2RtBlJgdTpiwEAlBswcD7/wZ6?=
 =?us-ascii?Q?+EVlgF8lmBrgFDcdKMTwVrT5effgo0rK/m+OSFN5USV/OC/TYjmalIe9viVe?=
 =?us-ascii?Q?6omhdO6Vv1qL1NXpTVh2NCntkhysSoDEyXjFJTv6HjUb69aDOXO5jy5TFS2k?=
 =?us-ascii?Q?U7UPWWSnt0Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bTNL+f3p7opyzpJOh5eRAjr9g6BfhOuI6SwvjbGIo/0HwS7py/rdFJDReg/Z?=
 =?us-ascii?Q?3UR283+Y1igpT1vcJhcZN/S31P/FvqoYuFHlmZYvArZ56uIYOq0LmMctP8W5?=
 =?us-ascii?Q?ZmKduar+mwoDruDbVSUBRh5yEA6Pia1yNHwCpYXU/X9xIwZ7aOV2CLZ14qgR?=
 =?us-ascii?Q?SGJqL6dK9wQg9gHKiQ0ejyuAmhBms0vLYte1dIKKVpkJweHb8BlsxjjvKYth?=
 =?us-ascii?Q?oFpSkhdtIbJJcpGJmwY7rYkplIJvjlepXCqwueyyGUk26/5J6kEQYpAFfKd8?=
 =?us-ascii?Q?q7Ai0jo+wWnuNWuClY/piE3FkKkUQeEREL/PUV3epWM45BbbyozXd/QTauxC?=
 =?us-ascii?Q?Nt+vD4USt/DIRpPY6+UG7turi6tBWd4BGM+jFyeFCV8B/SRKPcHnDcHR+KfM?=
 =?us-ascii?Q?0Ww2qDt2i8zTt1hCqNUz7amfBH6uiQbe7ha8OBa/HbSgIaXaqSJO4ApDz/76?=
 =?us-ascii?Q?UijAlaRy1Eb/Ie93iJNEjf1e1AymCy32Dz4YFE5Sx94/VRXdSBQtNUfg8RhH?=
 =?us-ascii?Q?AD1MruLRJWhPDTeIdS75BeaVIDiI/fA2Pg9RgNiJpbm6dUyHAAj5Z2F4BMh/?=
 =?us-ascii?Q?1QcuA+Ihl4/AmbOjgnYIy/egKXfXzmFPuPnwA9jUNgi6v+H2lEe2bi5uiYh0?=
 =?us-ascii?Q?cHNk/8zuSweBI7yZdQchXrVPeOs14ScnOzJsKrd8aN1M0aH58iGC28+kYSPR?=
 =?us-ascii?Q?L8vhHOSU4TMjpNqIjAyccIxVHQnVXyQDARRnbvBDSQUF///nrIqy/9R/GgUH?=
 =?us-ascii?Q?7TPOTii+9zKt4a3PRsbeiVeAv2vEwqYAGKGps3xj9qC0MHZFPyiBGw8GtTE6?=
 =?us-ascii?Q?JQonwx0dTtbVJQxlnlVVeFcaD8zuPiYundwlUI20HpQYTjMr8VKFistqpQFp?=
 =?us-ascii?Q?D/jeLPI/MHHrqARLNrWqrUx3GiuFhKs+BpG2qlWblxWf0nXpDVRxiYCEhdNi?=
 =?us-ascii?Q?Tf6g88+C7kZhlUfx03ay8EJeZwfliduIRfWOzJhe89ndN6bVW9fRAuKdljB7?=
 =?us-ascii?Q?Ne6NDXKXWsnrTYsp+wk7Hu1nExp+JY+tAP5loM8cWUeiSgR6YNd75Ie1gelw?=
 =?us-ascii?Q?IbhqtRNxguVtJzXAwd5wFXSrnwJjDCMOu1AS7x6Nrr4bzkxDRoelH1Da4PDz?=
 =?us-ascii?Q?2E5ip1P62T03Ifkb7d+wf9BxZy2KB2CLqDArH1K+qTiuNlYYoUMvDT6yzDjK?=
 =?us-ascii?Q?XgyXDvwLudka1hopkOtNnPBTGI+lbolUVGcxn+u61B3icABaZgq7QvgTKXIn?=
 =?us-ascii?Q?bu6E7CgjjMee6Fv/V5KTzzho4PrYy5oV9YC02+s8qP1KKpxDMIiMY/lsuFUz?=
 =?us-ascii?Q?mtjjvwB+ERbpiJ1GlwXCoD7fLzWar7H1/IZKvS8SzD/jLGekQxOIy/tCFjad?=
 =?us-ascii?Q?6cpLT9e4YqJC4HmXqKc6GICRM0euH/ci2JYE72n8CvX8nWosOnisjyZDY6Lu?=
 =?us-ascii?Q?/JZFp9VydJkConamMRMmM3uzrsUmGMdBPBp4isDB0F2OEJl0yVaE8CzJ4GFH?=
 =?us-ascii?Q?gP1Aba+ZSVwDC2AeWeXj+o9ODyieJB2+x9U0JHoYzFWR1ppaQiFBWcvy/80o?=
 =?us-ascii?Q?+1Z/beuUBffUpv+Cdcs0s+uD0xIT+Wt+6IQff1+QgF3/nw6ToMUccYwgH+kX?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PeZ/ZrcD7NqZnVu6PRij91waSfcwcXbgxynAROPQUTKSYIX9iCINNswatJypc3cYHB79J9L+Rx0Uxx2rHxewt5LYNcm2E3AtpKN9rNH2qXc6hAE9rCNzIFZfnzq9FxzXDfeSnrcKlgPs8lYhT0lxhQ+D+FaQ8eI3+vJNwEKRxKi39rvWi1zdqTJWyhtLIqbHJ0QEdQv5Npa/ywrpJmzndsgJkulR0V36L08/HjIzIsdLToJ9YQmZtIuURBcfBCuNehCzUGGc4YuXysUl+zoGQqqzArqiFyzB/EY1jDWrKglbwtXA8jzqIxoyhNdKl0W0tnr0pwzjQX6ferTH2uab0Yebq7toJ97WP48jJj86/5xHxZLYYL+VY5jhwplkMQ2FNORa9klYD+LFLe6KZPkV9gXTQsPCuT2DcicgjfXLR8ZWlTpvuVcecPtJzhZlWw4Z9K/waIxfZei6k09i5OIvlXBd4CuBBruezxrytQHLuzIy6Yil9xI+jdWRSi4fBRyiuiIpwdjkoWdMBLTWUMixVMz30lQSJjjGQmurglY1uDwmZ8Z43fHm3ng6xoeJk2b/zv02Am1EdpsUkwlsmXB0+uTXDksgGSb0UHybvs8Hmk8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80dc423-9b65-46c9-93f4-08ddb97c35e7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:22:08.8939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GiUyb0YHYcyNiM2ZhbrbN8KOVCo12/H+E61g+E+Jv6ysscc008iEHIVatBeW4o7V4bg4TBHBcB6YcmP2jxn+V9Xe3r0EumyMCuGTR7UrC7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6176
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507020126
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=68654ea4 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=YQctfgak0fqnOVwGDqMA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13215
X-Proofpoint-GUID: WUrSml0iIHS14lGNAzB22LQTc8BZncXm
X-Proofpoint-ORIG-GUID: WUrSml0iIHS14lGNAzB22LQTc8BZncXm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEyNiBTYWx0ZWRfXxH8dgHFaxynr WF0Ke9i21YvmyFUaUWeg0Bt34IKNuRSQ5awohV0jvWOstQum/Jw1gge1lD/+4PSUjrqj4VdeLkG fzUIwN1+ioZOGUtwwSF1/lioHp9Yf9NftR8aZ91X2u9pOjX0yAF+lzoL9epJor1zL70VngUk6up
 G7s7OaT7qBSxx7wcNiuMrs+UzvRAm6a1GLJ6DAQkgJptikyd8yCfZ5sCBbORv1V7fwu423hkpX6 QYCNo37t4SU6dQvvDadfApGcu3ZpuF2IaKq32CUelFKAxVIX5JmzOpUgkFHYriEI5kyfj9kALD/ tDdYGEzP5iuh26RtL87GCG3oYjLXmlt6W6qpN3JYce/wZBasuj/3dcZzdLP+lJA6Hpw7PPNfE4C
 osBYn8K3QJs8EQz8BNNnwRLfk7AEMQn93o6V936tEqJL9iDFDZUDURCOQefZ5jBuEQnhK21i

On Wed, Jul 02, 2025 at 08:33:39PM +0530, Dev Jain wrote:
>
> On 02/07/25 4:02 pm, Lorenzo Stoakes wrote:
> > On Tue, Jul 01, 2025 at 02:40:14PM +0100, Lorenzo Stoakes wrote:
> > > Let me fiddle with this code and see if I can suggest something sensible.
> > OK this is _even more fiddly_ than I thought.
> >
> > Dev - feel free to do a respin (once David's stuff's landed in mm-new, which I
> > think maybe it has now?), and we can maybe discuss a v6 with everything else in
> > place if this is still problematic.
> >
> > Ryan mentioned an iterator solution, which actually now seems sensible here, if
> > fiddly. Please do try to attack that in v5 to see if something's workable there.
> >
> > Why are computers so complicated...
>
> Sure! I'll be out next week so the mm list can take a breather from my patches : )
> My brain exploded trying to understand your and Ryan's implementation conversation,
> will read it all and try to come up with something nice.
>

No worries, it's actually genuinely annoyingly tricky this... :) we may need a
few more iterations to get there.

Really the underlying issue (other than inherent complexity) is the poor
mprotect implementation in the first instance that makes the complexity here
less easy to integrate.

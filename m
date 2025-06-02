Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE8E191F6D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869494; cv=fail; b=truyaUIQJ0UAchNdXsR5C9ixtyJt1gmzf8Cvd+hAWGeEmSpQUls80ZGNkujGkNRaBh7KjRhIsxJT7pjYSvFUiJSANChUBd1gZIv3ewM/FUrvofSpy+tXukajZ6ePe0hqpV3N9fOmSWgWnsvl/EEZKwuz+zyl80lvVH9WoSqaBV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869494; c=relaxed/simple;
	bh=aVTvPOvQLWVnag7nlF0prf19L7D35+LNyRhndeFpREo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W1XuZNdAHxSMio4kwqNrybCRwXdoTLzIsoyuOTUT5JnpQsN03vDuOdxthkRmNibhMzDVZfGyHZnN9spgYCgNVy2QT9OSqKjo34m0qzGooQoVuGThgiGH6sTbNLWUC6MqTf0yUgQWqStdR5gNIiPCA3oJLw+Beqzxv2BqUY+Lh4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OjSHWXCc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nUMKEKmL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OjSHWXCc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nUMKEKmL"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552C4gG9031436;
	Mon, 2 Jun 2025 13:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=tLer5J5lGXg43twp3z
	zlKjkVQbcoVAc4tpF3lfmTT/U=; b=OjSHWXCc16PeL0CJLhPgT/3PL+AN8/6dYT
	KBGVvDjf6BrEiOidlUbAuaQLAhYHXryTp9ebJEWbtjWNJPWC4EgKuiHMdbM8Zf9z
	+tV2wMsw4Ql7J4kkPiTOiOlDcwveqGFA4Ln0atXKEGTi1qtR6t7hhXe9mQ5ppzAJ
	sUDpeV1m/flqttDr1zJN7sYTZAAURZo7gkHgWzmetK7RcwEHQUtiOwbZpi0hbwiO
	pAD3HugrfEMVmRYxxj1jU97YnCeU7eAnKni8ZQIxfpztZRcYB4/dGCUl/zwFLCdy
	A/hrfQiCJsQeS7ChvgAmITNRmjwt4NlIocySQGcBSfE0TrDAjjQw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46yrpe2ju3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 13:04:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 552Bnptc035349;
	Mon, 2 Jun 2025 13:04:36 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2084.outbound.protection.outlook.com [40.107.100.84])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr786hnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 13:04:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhcCtNH1iggp5Q1eK43kQIKApeq30Xcn5pj6T65vhb9xtXKxWabLo5XtgXC6r/W9OvJpVo3IwHqZAFnHSVtGJ0JMEMYE9jCSmM/9XNaiNfA2JNIzD9hSnDGyxkrGqdTXsc4xEKmONZEculhUqYLClQkkSncYHJR8AxyelyQWCBRZv1kz60uDK3QcksW57uNSColWnEXbhMatdEEesIYyG0B48r54o9ZIG6+tBvBkRw2xvxSlFiI4lMlMibKEYJg9n7x8nkUjuh1Kg7fi2EU4bG4qRz8lFKxTM1Qm4zQG5iPQM7xQI9bag8+KbLxmO4oaQ7rBQAq+zuVrCvq9f7fJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLer5J5lGXg43twp3zzlKjkVQbcoVAc4tpF3lfmTT/U=;
 b=KaytJSXzLijynjqJNBgruNsebWR8wfISqtnvlJO43ESdyo+nmPOsfUuA1LHisFyyFO76u4lFI5Hh/QbJE1xRPsgtn8AznxbTYHHZpegpESyPr5t7bP/CEhMeBwC+rn57lBeimjEZxyKNJ6d23a42VoPriP5amzykkqZ3XObDPQAvtofZ2hSRjQJ94N+0qI/poGNENIjYN8a0iomdxeSXOYFJI2JFa4rGiz3ei2l5OuXy/wpZLspACdl5Do9p+enSXugJ/V85OxReQ2jqwDCXHo81lgYo6pnf96AM1lKbGRBkTJrOQ6aABhQEAVH/T2Bk73oXZMMS2UvPzz0n19OVaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLer5J5lGXg43twp3zzlKjkVQbcoVAc4tpF3lfmTT/U=;
 b=nUMKEKmLQadcD8Nljv4RSEez9QtG2hlJ9yXIbSjMo8REOgs+rjfNzlwrJOw0MYgHNs2SaIqcIyArPTgmxYTiMrClE9Kbd3V6DgWZHGh9U6xkhF8ep8837zqy6XEX2P1ZtrdGTUbC1dBeBPU38s0sK7IeZvMl7wbMp4JrmEcq79M=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BLAPR10MB4913.namprd10.prod.outlook.com (2603:10b6:208:307::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 13:04:33 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 13:04:33 +0000
Date: Mon, 2 Jun 2025 14:04:30 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+23de6daeb71241d36a18@syzkaller.appspotmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, pfalcato@suse.de,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz,
        Suren Baghdasaryan <surenb@google.com>
Subject: Re: [syzbot] [mm?] possible deadlock in __vma_start_write
Message-ID: <04c893fe-0498-4847-a525-9efb6d9306da@lucifer.local>
References: <68387feb.a70a0220.29d4a0.0830.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68387feb.a70a0220.29d4a0.0830.GAE@google.com>
X-ClientProxiedBy: LO4P265CA0311.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BLAPR10MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: ce9347f1-085b-4dc7-160a-08dda1d6049d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F1YYVSznl/zLVui2/yIEE39SnZTQN8KtmOMAyWTS/qfjQkTToKenzAEZrVs1?=
 =?us-ascii?Q?SmMbviB9xIUxhNWmOTB4Iy75GkPZUfjFhnkBxJR7nvRUueLPWbhDH0An6dap?=
 =?us-ascii?Q?ptD8TLhbgoAGD3r0lfFW7jZ3IxIxgb7SXVOnPsHASvIfnXfAOtwjQybYPZsH?=
 =?us-ascii?Q?ohuCwG+Ix1SMkWljfNrZ+HQY6YpbzdXCBqTdw9ic080NcGDtGxteXQKbHzB6?=
 =?us-ascii?Q?6tlZx/NXCLGBxs4r4PU63Au8hJTdRXFtMUTBT9BB8YC5HSkN3Q+v7jmrZTzB?=
 =?us-ascii?Q?euqlyG7mOyPIHeG6AO9vSBj3MgUNwV88v9L/gMImEh0UrBAT39B6k1DFCC5h?=
 =?us-ascii?Q?FDU7+DMA/gVQChrA8YYoqMddb5kWLnejy/eoT+fmxhXb4JmjWri2i2sP6zfv?=
 =?us-ascii?Q?aQpfhmQvtpr/G4ihBal4aJLigKYETe3I60+Db16updmn5876n+c3NbgdWTLi?=
 =?us-ascii?Q?nS/hW6DtbQ3yS3QqcnT+P3MNojryiPhs1VrvOejFjurF3r6VpGyLRcKVsevi?=
 =?us-ascii?Q?dg3Dl84O9vgnRJis6tzTbATAftgKIOxW5wXhjefTI7Q0DiNnVqV2OIj20z8S?=
 =?us-ascii?Q?Up9dc6TPDvfBkqzMWCe9CJj7foSQTS6fGO/DvuNk3c4NeQ9CzrvGmOm/7gFt?=
 =?us-ascii?Q?9mn69Ny5wUu/r6fgP/ml1bhEOm2Z3UEymDwoVinh4RIL9bBpgYcIh3yLyHP3?=
 =?us-ascii?Q?sJEVfTE7IY1iYrB9lqWTSgXpHCZNhXfHOkID2eWVk1e/GuMTiG/oB1Mwb7ar?=
 =?us-ascii?Q?HXkrFNygcGK4z9koyt7Gq7HCz+YaKUzGfJ/Npqof32Az2C1m2HnAMBy/Ry2D?=
 =?us-ascii?Q?+JeWt+fkp/rU7psmzsRJqfuxONrItnpckn4KhXMR3ZSLjo5DTB5TmhewRfq2?=
 =?us-ascii?Q?/DZkwqduX1cVDZFXZhkx/YvSaG4VgDRlWYBtGUf4blGkcj5SAb9oZbaKW2kx?=
 =?us-ascii?Q?1nayQANpJq6mZ6UESeJ2URnORFAlMrBKBlZ1vWOxYOXauexnKzWPzx3k4lMf?=
 =?us-ascii?Q?uixZ5qqRrCLemfGqBZlpNNmaikYB8Kmb0q2q/f6OHrIN9BGOp0ygCgHc4h/c?=
 =?us-ascii?Q?ebrhdl5/lcmqz0zz6FM4SQlA2WhBr0ugHgZL9hD/MYhJQsLeCozGMf/lRwuh?=
 =?us-ascii?Q?u5EuueWCh0pNhRe1kPuwCEw3Y2+PuL0GrfK8VHBptfHwtuO0Qqob5Fdh9zFl?=
 =?us-ascii?Q?ws/P6JmOhSzVSVHEeajGC/ixL3Z6Enk049f09vfKl1pQ3mNJFMSGz+HB7LvI?=
 =?us-ascii?Q?XHoyrJa3KKCd44YRffZxQsJv9pHwQFodGlLIOC1c0ixMGBXFb3hVtIjuQ57M?=
 =?us-ascii?Q?Qug9ZuKGXIX1Pu2taHA5y0CFz2Km7rfD1I5vBbUYyjnNB77ETzhOHXfVKmeA?=
 =?us-ascii?Q?N+wyezbinO+2RnzFqjdavN1ZNZEG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XPjyD62n8b0LHBAZ1qE8xxyG3UH29uVX8WPJg7L/4vx+8O2Z61WUSbzKZeoX?=
 =?us-ascii?Q?B2CeOOwIHLZB+zJWlnTIwaiXLkvacJB4ftZ/VISJqYlXGyMdwgBIJfJMevhT?=
 =?us-ascii?Q?hLYiqa9vq2qQNqVJELjNQXWMwOo7tquGS8yIzjBfuT2aPUKhb3V1+HK4UzaZ?=
 =?us-ascii?Q?NTl0lNzzpWpKqXhVGy5QiTJg65vdgihUwkox1IFb2CSHsGavU07IoNnuIieZ?=
 =?us-ascii?Q?lp3DiqOU3PKkKcstgx1+pn/M2frpc3bFW5XdgAfRBN2Q5FU4Hd4f3Gq42Iy9?=
 =?us-ascii?Q?n5X7MDa3KEbmKFtS9aZixw20zqExrh+n4DLrncAo/vQMSRum+CxXvxLRvCog?=
 =?us-ascii?Q?+lwcpNVBD27WnlNr/XK1LJdtRRl1L/uXWOhDen4xMGR2KRyMZMt1BX58aS5v?=
 =?us-ascii?Q?iKWGF7wKWddL6BWHGPCP5TXG15t6inizGpoIuP2eNprith9XZVSR1TjXNBDy?=
 =?us-ascii?Q?h3tVhvrsGBLbudNcEckkkJqnbz+nBl9NzQzb58lQuNKXXR8ZYunZkKk5GLZD?=
 =?us-ascii?Q?ixL/7vVMUUqkadgqZxGDdLeMSHfQYXN4m+fn5gb+zK3g++EJQPbBZbRTtAjA?=
 =?us-ascii?Q?+Mem/0EzW/uZHZzkfNRA+ubUgwZdwHwe8Ti5JcMS4rXyVhD9jpSkrCSf99FS?=
 =?us-ascii?Q?7S2EYSsvc9fjHlVO9zf2hvwiWsKP3YckY3BYJJlfwqhXTBNGq+rpz3t1ZFTT?=
 =?us-ascii?Q?N+lBLwS2Kj1xI9mFeHjPAtTrskkld27kz0Rja871dP6v3CXvdxsvl9+dGYo9?=
 =?us-ascii?Q?JuLLX1r8arpUB+Pnvi9GlFVLZaSZyHOn7qHTBVV1eNRrGFZ3NUvLFzOnPACo?=
 =?us-ascii?Q?vVK5C4AIqjwhj2rchh8ohNpQ1NwCwoaDyr6afd2AkYMUe8MySxNWfRdAWTZG?=
 =?us-ascii?Q?3f+2D80bp2/Al/Y+cfnxw9eE3HrTDRwcCJjACKrC9gCRKZ7tNTS55lx2UKZM?=
 =?us-ascii?Q?yGAgOi45UpOOdmYCEnslM2q+ndiswlH6LiJdxGWARCaSaL58oWFkmi6z4n1y?=
 =?us-ascii?Q?Ba0BozXT8aoV+OnhKVhGoFCDiHMTeKCOjRNhLRBwmZHRg8JTlwxuJaVAJG7E?=
 =?us-ascii?Q?U0yLsLQjEaUKDppAU21c22/iHvY2W/vyOPnKGCl9lfCdmc8aP6kfcTkOERiy?=
 =?us-ascii?Q?edecaiNWM0n1l9hymEgHCMki6st6Z0jTtzQuHcoGKsPpDoeMLaQf1pWChY2R?=
 =?us-ascii?Q?As8N5ZoP7XksVsD0UsUzpYyWh6IrUR4dvsfrs17dmcWLsYoSmt0BpFXY8j1G?=
 =?us-ascii?Q?hvJI2KjCYKtK5cc03AudVacXCzBTtCRZ2Y4KSQLW3Hl0Y+cLP+k8ZxK8SCqE?=
 =?us-ascii?Q?FUfoA6GWLWE5mLO2B/Kl8wfNyiSErcgTiM4kVk5rPuV9o7DK5ZnE19nYgnKe?=
 =?us-ascii?Q?v5VE8feBN5HPqRG36pmSvzx6gOQyV0ESWUvKcv44uH696t6Ft6P6rU7cA2GJ?=
 =?us-ascii?Q?9KSM7xzY0oU0yyAlAjAq631iseDFk9E4tEqOmeUjLYpNWMuGlcpgWY5voOU1?=
 =?us-ascii?Q?FMR35u7PfLgNbodNWFGdf+cPpwiEpkBq0fnv4ijv8BrSeUswiCPUHYNNenfK?=
 =?us-ascii?Q?CeZu1aIIxBrZ5UNm8aMscQK5e2bdlAyp737oE2hzbWIv+nMl/JBwKWlaaARE?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KIPInajejRHwScjSJUT1PMEest8SBMUQbkk/raGshKrtbC+X0hZP5qtd55O9lu7cZoNOjHjs1uFzgpUrOWrHvSDKymUdnYLblG7CioC+iWcq4ShC8JnHIeq+0ausamDMzZ+IQNl6AQwIZ9SX0RHp3Ef9bG0I49tkYkh8T8/Et6A6S7tQB9+ksXidVcUkhU7a5WGOBh5+yCQ5gKQo+w4Dh9Ka1cdbdkv8TUXsepqpCq+dku5kZ/U1+hAV30Eor8R2Fu9OU1luVCei8QmbL3fwoaZfuExv8F2l0dBJVwPNowzdK7BQll/f4XqWhWuC1985dfmSJv0IwtXd6QmlrtY0V1rGyGDOoHBxCzf19Wo9mgHD5oycKZod60i+SFxAj/rBtEQXG2TSqFdac3EvLhozrO8SKN/cR8eihmYk2IAEeKwltk1PKxBtfhJOsdJeG4FN6E5OIqSxAztccPG425Sv8760y3cXgJj6+lrbvPSqy/ZxsbNjWLlNqLQTNMNd2vNYj77CKGrXG8zvz16pdZC2J1FLBaMpcf2Sgz1g9c6w8DSl5d1mHTwu1a2MFYxOk1uYz1EarYRzFCfjlYiE90QB/GxFbFTQBkKoNfXWpEW78gg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9347f1-085b-4dc7-160a-08dda1d6049d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 13:04:33.1313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDtwZCeCrP/5fVSSvBsOhG2GJritsInccVJ7r2FjpaWaOWUWu9+wUYkwCufeOkuPh5F0fI5LDSbl6VmYidjZbY7CgUNg7kuTAQE/D8u4cWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4913
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_05,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506020108
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDEwOCBTYWx0ZWRfX8vxHViihLtx6 rYdMFu6JjnX4mueor1NyGuU9mGKlhQvw4AapNjl398g/KBCj92e53ACFx+8KgDr81cASOGbDWOC vCHNiBsNU8uiZrXanTx58yrLT9XXKysMwrjzza/oG6MrppyNNaLkw789QisvlaW1r0d58+iiHBH
 Num0DCS+hGmf56JYdtfYBhlYTj9bC2QGWg8SInEs3CA5Stsnel+wN/Ph1xpim3zEVzw6iU0cS5j Eg7Dtx8/aUuv/x9xBXULzye4ylS4e8camfD0Nc/prd6c81KfF9nQoRKJ/Wyw6XDVoVf5BHhLAeh T42OgXGhW+SlrrDaehDTEAq3y9xfhhwlpOYXBxYDvSsXz5LjQe/zlFoco5VJTMBjZa2zVcNUBaP
 uzyhfhlAlt5EyKbFwmLocjN4yGzsuSPjXinDvecQko4qOItnKVj7GFaLZgd+oEgqUhe/TEsA
X-Authority-Analysis: v=2.4 cv=NN7V+16g c=1 sm=1 tr=0 ts=683da165 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=edf1wS77AAAA:8 a=3g80flMcAAAA:8 a=oHvirCaBAAAA:8 a=VwQbUJbxAAAA:8 a=hSkVLCK3AAAA:8 a=4RBUngkUAAAA:8 a=9nx2ocBvMzdqPXke1VkA:9
 a=BhMdqm2Wqc4Q2JL7t0yJfBCtM/Y=:19 a=CjuIK1q_8ugA:10 a=vVHabExCe68A:10 a=DcSpbTIhAlouE1Uv7lRv:22 a=3urWGuTZa-U-TZ_dHwj2:22 a=cQPPKAXgyycSBL8etih5:22 a=_sbA2Q-Kp09kWB8D3iXc:22
X-Proofpoint-GUID: hrqxIOi0dfl2j8e4tQq7kQ8B4X_N__zn
X-Proofpoint-ORIG-GUID: hrqxIOi0dfl2j8e4tQq7kQ8B4X_N__zn

+cc Suren

Suren - could you take a look at this please?

I can't for the life of me figure out why this implies a deadlock, there's
a might_fault() on the drm stuff, it's kind of sketchy they managed to get
that to trigger (maybe short window between mmap_read_lock() and
mmap_write_lock() in exit_mmap()?) immediately before free page table
teardown.

I don't think __vma_start_write() can possibly block no? So the alleged
'trying to acquire lock' bit should always succeed, even if
dev->mode_config.idr_mutex is held in another thread waiting to be able to
possibly fault.

I mean it's a screwy situation in _general_ but maybe we need to tweak the
lockdep here? Or maybe I'm missing something... :)

Thanks!

On Thu, May 29, 2025 at 08:40:27AM -0700, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into for-kernelci
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=12bbdad4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
> dashboard link: https://syzkaller.appspot.com/bug?extid=23de6daeb71241d36a18
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> userspace arch: arm64
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/da97ad659b2c/disk-d7fa1af5.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/659e123552a8/vmlinux-d7fa1af5.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/6ec5dbf4643e/Image-d7fa1af5.gz.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+23de6daeb71241d36a18@syzkaller.appspotmail.com
>
> SQUASHFS error: zstd decompression failed, data probably corrupt
> SQUASHFS error: Failed to read block 0x60: -5
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 Not tainted
> ------------------------------------------------------
> syz.1.261/8150 is trying to acquire lock:
> ffff0000d7ffcbc8 (vm_lock){++++}-{0:0}, at: __vma_start_write+0x34/0x158 mm/memory.c:6497

We're execve'ing the process, so we call exit_mmap() which eventually calls
free_pgtables() to tear down the VMA in question in free_pgtables().

In doing so, we write-lock the VMA:

		/*
		 * Hide vma from rmap and truncate_pagecache before freeing
		 * pgtables
		 */
		if (mm_wr_locked)
			vma_start_write(vma);

>
> but task is already holding lock:
> ffff0000d572df50 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock include/linux/mmap_lock.h:128 [inline]

Presumably refers to the __might_fault() case.

> ffff0000d572df50 (&mm->mmap_lock){++++}-{4:4}, at: exit_mmap+0x200/0xbec mm/mmap.c:1292

This is the mmap write lock we hold to be able to hold the VMA write lock
on page table tear down.

>
> which lock already depends on the new lock.
>
>
> the existing dependency chain (in reverse order) is:
>
> -> #6 (&mm->mmap_lock){++++}-{4:4}:
>        __might_fault+0xc4/0x124 mm/memory.c:7151

This invokes:

	if (current->mm)
		might_lock_read(&current->mm->mmap_lock);

That indicates we might try to acquire a read lock on the mmap lock.

I guess since RCU-obtained VMA read locks fall back to mmap read locks this is
valid.

This invokes might_lock_read() which triggers the lockdep report (we will need
to obtain the mmap read or VMA lock to fault, neither or which we can do because
we hold the write lock).

>        drm_mode_get_lease_ioctl+0x2bc/0x53c drivers/gpu/drm/drm_lease.c:673


This holds the dev->mode_config.idr_mutex lock...

Seems like an ioctl to get lease state but we invoke put_user() on each object:

		if (count_objects > count) {
			drm_dbg_lease(dev, "adding object %d\n", object);
			ret = put_user(object, object_ids + count);
			if (ret)
				break;
		}

And put_user() -> __put_user() -> __put_user_error() invokes might_fault().


>        drm_ioctl_kernel+0x238/0x310 drivers/gpu/drm/drm_ioctl.c:796
>        drm_ioctl+0x65c/0xa5c drivers/gpu/drm/drm_ioctl.c:893
>        vfs_ioctl fs/ioctl.c:51 [inline]
>        __do_sys_ioctl fs/ioctl.c:906 [inline]
>        __se_sys_ioctl fs/ioctl.c:892 [inline]
>        __arm64_sys_ioctl+0x14c/0x1c4 fs/ioctl.c:892
>        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>        el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>        el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>
> -> #5 (&dev->mode_config.idr_mutex){+.+.}-{4:4}:
>        __mutex_lock_common+0x1d0/0x2190 kernel/locking/mutex.c:601
>        __mutex_lock kernel/locking/mutex.c:746 [inline]
>        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:798
>        __drm_mode_object_add+0xa8/0x1f0 drivers/gpu/drm/drm_mode_object.c:47
>        drm_framebuffer_init+0x14c/0x2bc drivers/gpu/drm/drm_framebuffer.c:875
>        drm_gem_fb_init drivers/gpu/drm/drm_gem_framebuffer_helper.c:82 [inline]
>        drm_gem_fb_init_with_funcs+0xa60/0xda4 drivers/gpu/drm/drm_gem_framebuffer_helper.c:202
>        drm_gem_fb_create_with_funcs drivers/gpu/drm/drm_gem_framebuffer_helper.c:245 [inline]
>        drm_gem_fb_create+0x84/0xd4 drivers/gpu/drm/drm_gem_framebuffer_helper.c:286
>        drm_internal_framebuffer_create+0xfcc/0x19dc drivers/gpu/drm/drm_framebuffer.c:304
>        drm_mode_addfb2+0xac/0x2a0 drivers/gpu/drm/drm_framebuffer.c:338
>        drm_client_buffer_addfb drivers/gpu/drm/drm_client.c:386 [inline]
>        drm_client_framebuffer_create+0x2d0/0x55c drivers/gpu/drm/drm_client.c:428
>        drm_fbdev_shmem_driver_fbdev_probe+0x180/0x70c drivers/gpu/drm/drm_fbdev_shmem.c:151
>        drm_fb_helper_single_fb_probe drivers/gpu/drm/drm_fb_helper.c:1649 [inline]
>        __drm_fb_helper_initial_config_and_unlock+0xf94/0x159c drivers/gpu/drm/drm_fb_helper.c:1829
>        drm_fb_helper_initial_config+0x3c/0x58 drivers/gpu/drm/drm_fb_helper.c:1916
>        drm_fbdev_client_hotplug+0x154/0x22c drivers/gpu/drm/clients/drm_fbdev_client.c:52
>        drm_client_register+0x13c/0x1d4 drivers/gpu/drm/drm_client.c:140
>        drm_fbdev_client_setup+0x194/0x3d0 drivers/gpu/drm/clients/drm_fbdev_client.c:159
>        drm_client_setup+0x78/0x140 drivers/gpu/drm/clients/drm_client_setup.c:39
>        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:218 [inline]
>        vkms_init+0x4b8/0x5ac drivers/gpu/drm/vkms/vkms_drv.c:242
>        do_one_initcall+0x250/0x990 init/main.c:1257
>        do_initcall_level+0x154/0x214 init/main.c:1319
>        do_initcalls+0x84/0xf4 init/main.c:1335
>        do_basic_setup+0x8c/0xa0 init/main.c:1354
>        kernel_init_freeable+0x2dc/0x444 init/main.c:1567
>        kernel_init+0x24/0x1dc init/main.c:1457
>        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847
>
> -> #4 (&helper->lock){+.+.}-{4:4}:
>        __mutex_lock_common+0x1d0/0x2190 kernel/locking/mutex.c:601
>        __mutex_lock kernel/locking/mutex.c:746 [inline]
>        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:798
>        __drm_fb_helper_restore_fbdev_mode_unlocked+0x74/0x198 drivers/gpu/drm/drm_fb_helper.c:228
>        drm_fb_helper_set_par+0xa4/0x108 drivers/gpu/drm/drm_fb_helper.c:1359
>        fbcon_init+0xe4c/0x1d18 drivers/video/fbdev/core/fbcon.c:1112
>        visual_init+0x27c/0x540 drivers/tty/vt/vt.c:1011
>        do_bind_con_driver+0x7b8/0xdd8 drivers/tty/vt/vt.c:3831
>        do_take_over_console+0x824/0x97c drivers/tty/vt/vt.c:4397
>        do_fbcon_takeover+0x158/0x25c drivers/video/fbdev/core/fbcon.c:548
>        do_fb_registered drivers/video/fbdev/core/fbcon.c:2989 [inline]
>        fbcon_fb_registered+0x354/0x4c8 drivers/video/fbdev/core/fbcon.c:3009
>        do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
>        register_framebuffer+0x44c/0x5ec drivers/video/fbdev/core/fbmem.c:515
>        __drm_fb_helper_initial_config_and_unlock+0x103c/0x159c drivers/gpu/drm/drm_fb_helper.c:1851
>        drm_fb_helper_initial_config+0x3c/0x58 drivers/gpu/drm/drm_fb_helper.c:1916
>        drm_fbdev_client_hotplug+0x154/0x22c drivers/gpu/drm/clients/drm_fbdev_client.c:52
>        drm_client_register+0x13c/0x1d4 drivers/gpu/drm/drm_client.c:140
>        drm_fbdev_client_setup+0x194/0x3d0 drivers/gpu/drm/clients/drm_fbdev_client.c:159
>        drm_client_setup+0x78/0x140 drivers/gpu/drm/clients/drm_client_setup.c:39
>        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:218 [inline]
>        vkms_init+0x4b8/0x5ac drivers/gpu/drm/vkms/vkms_drv.c:242
>        do_one_initcall+0x250/0x990 init/main.c:1257
>        do_initcall_level+0x154/0x214 init/main.c:1319
>        do_initcalls+0x84/0xf4 init/main.c:1335
>        do_basic_setup+0x8c/0xa0 init/main.c:1354
>        kernel_init_freeable+0x2dc/0x444 init/main.c:1567
>        kernel_init+0x24/0x1dc init/main.c:1457
>        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847
>
> -> #3 (console_lock){+.+.}-{0:0}:
>        console_lock+0x194/0x1ec kernel/printk/printk.c:2849
>        __bch2_print_string_as_lines fs/bcachefs/util.c:267 [inline]
>        bch2_print_string_as_lines+0x34/0x150 fs/bcachefs/util.c:286
>        bucket_ref_update_err+0x1c8/0x21c fs/bcachefs/buckets.c:417
>        bch2_bucket_ref_update+0x3d8/0x888 fs/bcachefs/buckets.c:-1
>        __mark_pointer fs/bcachefs/buckets.c:572 [inline]
>        bch2_trigger_pointer fs/bcachefs/buckets.c:618 [inline]
>        __trigger_extent+0xd90/0x35fc fs/bcachefs/buckets.c:763
>        bch2_trigger_extent+0x3e4/0x78c fs/bcachefs/buckets.c:881
>        run_one_trans_trigger fs/bcachefs/btree_trans_commit.c:-1 [inline]
>        bch2_trans_commit_run_triggers fs/bcachefs/btree_trans_commit.c:550 [inline]
>        __bch2_trans_commit+0x7e8/0x62d0 fs/bcachefs/btree_trans_commit.c:990
>        bch2_trans_commit fs/bcachefs/btree_update.h:195 [inline]
>        bch2_extent_update+0x2d8/0x7e8 fs/bcachefs/io_write.c:353
>        bch2_write_index_default fs/bcachefs/io_write.c:401 [inline]
>        __bch2_write_index+0x570/0xfec fs/bcachefs/io_write.c:591
>        bch2_write_data_inline fs/bcachefs/io_write.c:1630 [inline]
>        bch2_write+0xacc/0x112c fs/bcachefs/io_write.c:1698
>        closure_queue include/linux/closure.h:270 [inline]
>        closure_call include/linux/closure.h:432 [inline]
>        bch2_writepage_do_io fs/bcachefs/fs-io-buffered.c:494 [inline]
>        bch2_writepages+0x1fc/0x2cc fs/bcachefs/fs-io-buffered.c:677
>        do_writepages+0x2c0/0x6a8 mm/page-writeback.c:2656
>        filemap_fdatawrite_wbc mm/filemap.c:386 [inline]
>        __filemap_fdatawrite_range mm/filemap.c:419 [inline]
>        filemap_write_and_wait_range+0x1ac/0x29c mm/filemap.c:691
>        bchfs_truncate+0x574/0xa70 fs/bcachefs/fs-io.c:-1
>        bch2_setattr+0x198/0x20c fs/bcachefs/fs.c:1245
>        notify_change+0x9a4/0xc50 fs/attr.c:552
>        do_truncate+0x178/0x1f0 fs/open.c:65
>        vfs_truncate+0x398/0x444 fs/open.c:115
>        do_sys_truncate+0xe4/0x1a8 fs/open.c:138
>        __do_sys_truncate fs/open.c:150 [inline]
>        __se_sys_truncate fs/open.c:148 [inline]
>        __arm64_sys_truncate+0x5c/0x74 fs/open.c:148
>        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>        el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>        el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>
> -> #2 (bcachefs_btree){+.+.}-{0:0}:
>        trans_set_locked+0x94/0x200 fs/bcachefs/btree_locking.h:198
>        bch2_trans_begin+0x6f8/0xa40 fs/bcachefs/btree_iter.c:3288
>        bch2_read_err_msg_trans+0x64/0x298 fs/bcachefs/io_read.c:346
>        __bch2_read_extent+0x21fc/0x3694 fs/bcachefs/io_read.c:975
>        bch2_read_extent fs/bcachefs/io_read.h:140 [inline]
>        bchfs_read+0x1178/0x17dc fs/bcachefs/fs-io-buffered.c:226
>        bch2_readahead+0xa18/0xd88 fs/bcachefs/fs-io-buffered.c:316
>        read_pages+0x13c/0x4c8 mm/readahead.c:160
>        page_cache_ra_order+0x7b8/0xb34 mm/readahead.c:515
>        do_sync_mmap_readahead+0x2f0/0x660 mm/filemap.c:-1
>        filemap_fault+0x600/0x1278 mm/filemap.c:3403
>        bch2_page_fault+0x2cc/0x700 fs/bcachefs/fs-io-pagecache.c:594
>        __do_fault+0xf8/0x498 mm/memory.c:5098
>        do_read_fault mm/memory.c:5518 [inline]
>        do_fault mm/memory.c:5652 [inline]
>        do_pte_missing mm/memory.c:4160 [inline]
>        handle_pte_fault mm/memory.c:5997 [inline]
>        __handle_mm_fault mm/memory.c:6140 [inline]
>        handle_mm_fault+0x2cb0/0x4d18 mm/memory.c:6309
>        faultin_page mm/gup.c:1193 [inline]
>        __get_user_pages+0x1dd4/0x30d8 mm/gup.c:1491
>        populate_vma_page_range+0x218/0x2e8 mm/gup.c:1929
>        __mm_populate+0x208/0x330 mm/gup.c:2032
>        mm_populate include/linux/mm.h:3487 [inline]
>        vm_mmap_pgoff+0x378/0x43c mm/util.c:584
>        ksys_mmap_pgoff+0x394/0x5b8 mm/mmap.c:607
>        __do_sys_mmap arch/arm64/kernel/sys.c:28 [inline]
>        __se_sys_mmap arch/arm64/kernel/sys.c:21 [inline]
>        __arm64_sys_mmap+0xf8/0x110 arch/arm64/kernel/sys.c:21
>        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>        el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>        el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>
> -> #1 (mapping.invalidate_lock#4){.+.+}-{4:4}:
>        down_read+0x58/0x2f8 kernel/locking/rwsem.c:1524
>        filemap_invalidate_lock_shared include/linux/fs.h:922 [inline]
>        filemap_fault+0x564/0x1278 mm/filemap.c:3391
>        bch2_page_fault+0x2cc/0x700 fs/bcachefs/fs-io-pagecache.c:594
>        __do_fault+0xf8/0x498 mm/memory.c:5098
>        do_shared_fault mm/memory.c:5582 [inline]
>        do_fault mm/memory.c:5656 [inline]
>        do_pte_missing mm/memory.c:4160 [inline]
>        handle_pte_fault mm/memory.c:5997 [inline]
>        __handle_mm_fault mm/memory.c:6140 [inline]
>        handle_mm_fault+0x1a08/0x4d18 mm/memory.c:6309
>        do_page_fault+0x428/0x1554 arch/arm64/mm/fault.c:647
>        do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:783
>        do_mem_abort+0x70/0x194 arch/arm64/mm/fault.c:919
>        el0_da+0x64/0x160 arch/arm64/kernel/entry-common.c:627
>        el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:789
>        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>
> -> #0 (vm_lock){++++}-{0:0}:
>        check_prev_add kernel/locking/lockdep.c:3166 [inline]
>        check_prevs_add kernel/locking/lockdep.c:3285 [inline]
>        validate_chain kernel/locking/lockdep.c:3909 [inline]
>        __lock_acquire+0x1728/0x3058 kernel/locking/lockdep.c:5235
>        lock_acquire+0x14c/0x2e0 kernel/locking/lockdep.c:5866
>        __vma_enter_locked+0x184/0x354 mm/memory.c:6473
>        __vma_start_write+0x34/0x158 mm/memory.c:6497
>        vma_start_write include/linux/mm.h:829 [inline]
>        free_pgtables+0x1e0/0x63c mm/memory.c:369
>        exit_mmap+0x394/0xbec mm/mmap.c:1295
>        __mmput+0xec/0x3dc kernel/fork.c:1380
>        mmput+0x70/0xac kernel/fork.c:1402
>        free_bprm+0x11c/0x398 fs/exec.c:1493
>        do_execveat_common+0x6b8/0x834 fs/exec.c:1970
>        do_execveat fs/exec.c:2053 [inline]
>        __do_sys_execveat fs/exec.c:2127 [inline]
>        __se_sys_execveat fs/exec.c:2121 [inline]
>        __arm64_sys_execveat+0xd0/0xec fs/exec.c:2121
>        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>        el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>        el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>
> other info that might help us debug this:
>
> Chain exists of:
>   vm_lock --> &dev->mode_config.idr_mutex --> &mm->mmap_lock
>
>  Possible unsafe locking scenario:
>
>        CPU0                    CPU1
>        ----                    ----
>   lock(&mm->mmap_lock);
>                                lock(&dev->mode_config.idr_mutex);
>                                lock(&mm->mmap_lock);
>   lock(vm_lock);

Yeah I don't see it... CPU1 might try to do a read lock, wait, while CPU0
holds an mmap write lock and acquires a VMA write lock, I don't see how it
could be unsuccessful. Then CPU1 could carry on (possibly disasterously
under the circumstances but still...)

>
>  *** DEADLOCK ***
>
> 2 locks held by syz.1.261/8150:
>  #0: ffff0000d0fee3d0 (&sig->cred_guard_mutex){+.+.}-{4:4}, at: prepare_bprm_creds fs/exec.c:1469 [inline]
>  #0: ffff0000d0fee3d0 (&sig->cred_guard_mutex){+.+.}-{4:4}, at: bprm_execve+0xa8/0x10dc fs/exec.c:1842
>  #1: ffff0000d572df50 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock include/linux/mmap_lock.h:128 [inline]
>  #1: ffff0000d572df50 (&mm->mmap_lock){++++}-{4:4}, at: exit_mmap+0x200/0xbec mm/mmap.c:1292
>
> stack backtrace:
> CPU: 1 UID: 0 PID: 8150 Comm: syz.1.261 Not tainted 6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 PREEMPT
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> Call trace:
>  show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
>  __dump_stack+0x30/0x40 lib/dump_stack.c:94
>  dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
>  dump_stack+0x1c/0x28 lib/dump_stack.c:129
>  print_circular_bug+0x324/0x32c kernel/locking/lockdep.c:2079
>  check_noncircular+0x154/0x174 kernel/locking/lockdep.c:2211
>  check_prev_add kernel/locking/lockdep.c:3166 [inline]
>  check_prevs_add kernel/locking/lockdep.c:3285 [inline]
>  validate_chain kernel/locking/lockdep.c:3909 [inline]
>  __lock_acquire+0x1728/0x3058 kernel/locking/lockdep.c:5235
>  lock_acquire+0x14c/0x2e0 kernel/locking/lockdep.c:5866
>  __vma_enter_locked+0x184/0x354 mm/memory.c:6473
>  __vma_start_write+0x34/0x158 mm/memory.c:6497
>  vma_start_write include/linux/mm.h:829 [inline]
>  free_pgtables+0x1e0/0x63c mm/memory.c:369
>  exit_mmap+0x394/0xbec mm/mmap.c:1295
>  __mmput+0xec/0x3dc kernel/fork.c:1380
>  mmput+0x70/0xac kernel/fork.c:1402
>  free_bprm+0x11c/0x398 fs/exec.c:1493
>  do_execveat_common+0x6b8/0x834 fs/exec.c:1970
>  do_execveat fs/exec.c:2053 [inline]
>  __do_sys_execveat fs/exec.c:2127 [inline]
>  __se_sys_execveat fs/exec.c:2121 [inline]
>  __arm64_sys_execveat+0xd0/0xec fs/exec.c:2121
>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>  el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>  el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup

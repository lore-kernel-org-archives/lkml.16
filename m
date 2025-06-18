Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4212F533E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750244255; cv=fail; b=a/DUXpD2Lc6tMI9qVAmFLHUiLDAw6cyq2xlYED02Ghcn+Xa7kaczbmfHGJD/x4xzhfnzWgxccQqDRuQeBYHAUuX0gsiQuHe/4JdEgqozzrS3LCi/sHKopYa//eMzabCx2brL139xNvPm/rzuwzxtmZlulaME0qsDLfFpyASmT/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750244255; c=relaxed/simple;
	bh=MqidP/VbQyfN/v17EgHS28UpC1lg8v1teyEPxNrkPEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mnSrij+Khx7hoAZWT75OwAWIC3FbXt+kZ89bFR1WdH3K/++RvOsBWAzcPN5sWUEZUsN1FKqLCU6mkWOx5P31+9ojrpxu6QQvIpq7pnowhgShGKOk6aI9ZW4qd9ee7e/q/S0wk6H4QzDER6MYqVw5A6tvZXmYHnTSFg387Dd7TI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LOakDSGT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=A8Rmymep; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LOakDSGT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="A8Rmymep"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I8fvcW018115;
	Wed, 18 Jun 2025 10:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=MqidP/VbQyfN/v17Eg
	HS28UpC1lg8v1teyEPxNrkPEU=; b=LOakDSGTWN7DmV4rHFoqXwx/wcjel3+4B5
	4c0KdnaBbHuCglX+gw3gSaTEK2zjJywjTz4CJv7YMQPbFeSvcYU1wPCHwWxeXA+s
	D8lAWd+5XVA0PxvouL/AFZ4E1w8KvsWzl/kc27QNoykiGUR2hDeybbsE2aN5ni7J
	rXxEPYCiGrlQUU9fZ1phKIaeslqVXe3kFhH4RLQ7zUEO8AndVBZGVyuQpRlCTx9o
	upz/GDuxAwz9bbDG0U451aGx+5+OgDuT8FggnumgZB9RDfmzVZxt7tNbQusqqPfl
	18c259VUoXMuJqxrUQWg90vDoKZ1uKJ6DIFRfEBdsxvWmcCbgcqg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvn6wyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 10:57:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55IAHQt7000779;
	Wed, 18 Jun 2025 10:57:19 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11012012.outbound.protection.outlook.com [40.93.200.12])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhage9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 10:57:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiEZ8u2FksFMf/a6BW4j9YzNiHTgdNnwQigEClGUtlTuQ+0vRP39g/100Ij/Fvrf5rhYVy2CMM1Y5iyjcLWBVo0VFWvXzr7RdYlKPGHufje/CBFWivPQVcPE3viZCe/oG/gZBQzeCU3DEK0Jl9edaou4FT5d4HvrO8TIxC+swf5m91xTESEU5oFePRL2OMH4CPQot5RRDUmOuSCXQ+7EgGiz8hjBbt0tPP6Y3Uu+nCgXk11AC67BlWq00VHODDM0VAfmS5leJ+Ip4eOqArJgt+uQMhoIWInu7KV6q/ushIDLusdY+SW0Go+JLh8f4QkteT+OZE7Hs0XIZMHkqOJJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqidP/VbQyfN/v17EgHS28UpC1lg8v1teyEPxNrkPEU=;
 b=Zw7JdxQytk0VcXfaHAjBpG1T1rR7PwtLfIBl8pfzZg8tYAi4pf+Ff7zKVYM1ld1wrM1fjnYEBQ1DhKIcbCEtCSJaqithpNrEuiMQB6j7XvZc56kEiFccMvRbMBfyLHCcf+QzT6Sb/rD1iwtGLPa669U0JT2B1UahTxCJptKbGGObvm3lP6gzOfKodk6wSJIk6wlg0BaVdEJkrZedHp7TX6WGiIJKV3Q9+O94A3o5VOd9RfksUkDSMwpiIk7xvqbWsK1j1vuwX4cMfs4tLff4nxOAuH6tVhLBxo5t2h1th7RNUDDXkCA0NJ3EsIMTJikpnf2EfwfpRt571EH0YbWeSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqidP/VbQyfN/v17EgHS28UpC1lg8v1teyEPxNrkPEU=;
 b=A8RmymepUrWdjsKbJ26UzAuM0oDi5r4s1chIrfAxAi3caiqJ5epWOyB9V0t3eDKQlZvnZf8CBNyh4VFuCV3cgn7wLQn5pil12z7MS31QPlCmyTWzqURC3yjMzAJCDsD76Z1VfcNdAgi72GxY81GAnsSShA5xWdahsWtgSa2hCfI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB5195.namprd10.prod.outlook.com (2603:10b6:610:c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 10:57:17 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 10:57:17 +0000
Date: Wed, 18 Jun 2025 11:57:14 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Zi Yan <ziy@nvidia.com>, Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add missing files to mm page alloc
 section
Message-ID: <d70772ab-1171-4b08-a174-e70f452b87b3@lucifer.local>
References: <20250616202425.563581-1-lorenzo.stoakes@oracle.com>
 <DAPKIESK746G.1B3FVDW9UWXCZ@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAPKIESK746G.1B3FVDW9UWXCZ@google.com>
X-ClientProxiedBy: LO4P123CA0654.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB5195:EE_
X-MS-Office365-Filtering-Correlation-Id: cf92e84e-85d7-421c-db78-08ddae56e3d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?26/ndRSMHRAsg2yTzoAodxO6WBKBd3Zb56hdjYhB5jFEgEhAEVDciN4kciab?=
 =?us-ascii?Q?f2oalWkmiTtH7qkXkH1TGOymkKPrcLYYRoCNVE2MoeIG+DPf/3XgzHwHWqMF?=
 =?us-ascii?Q?FBtqZJhERUYKmVBO0qCWcrn6CwnMRHyXKiNP56x6UfkEjAdb++Pv/gp7FDg5?=
 =?us-ascii?Q?rG7krsVkrZMMG9agK/gc43Alx+YNKS5MHE6gkd9zzRxjIeSnDxGvqOSPJBtU?=
 =?us-ascii?Q?1DSQ3HCtjWOny1dRIf1nWJOv44afANNfgHL6TtyZaWf/2jU6dt9TAVlmLa7P?=
 =?us-ascii?Q?3iG3Psq8jBpyj3tT0r1YF2tSBxpyIIQbnBBfiYMvkwNFw926yYE6l46RF8bD?=
 =?us-ascii?Q?II8jqwv8gnzQcDfaEWvGQ3MMgQYwaBBsgJdTa0GwdCYOC2TXy0dntu9cqflW?=
 =?us-ascii?Q?L9bGZN+C702zRKA5byMEMeLPfvRBhxh8gb7TbY6cmCzZWGgn/WgHNH0UbfUQ?=
 =?us-ascii?Q?lZ4OS6EepGabR3X/iCBsoJP5Kdgyv2dLKSbuebGE2ojhatjdL5PAihcAKsT9?=
 =?us-ascii?Q?WyYjSD7algNjGJlMpbs1ZhYywmzuWtEXdjbjqDRSs2Y2eFc4fUulzoPHA1kd?=
 =?us-ascii?Q?A6+J2xVbEqpP/PpvW2QCPwbTygpCp1EGOMMWdZT+L7pnp8SjfTc2l9Q5rMpS?=
 =?us-ascii?Q?veibjBtvtikBgssF4gi7BCwX/u2Zs/rcCtcxs4dRaPwfsjjIpnl9H10MGFOm?=
 =?us-ascii?Q?3VDg0lcVWJdiN8jNPWpEgRdxBwWjy+lquilBHcDwnLKvXatolbT1TymChVES?=
 =?us-ascii?Q?ooaEQ/ajFwvFyT1EauXSqMH0k009ahEUQyv8n3R/HgPS5z4+Yeh080/8a99r?=
 =?us-ascii?Q?I/0colWUqrYTqza+uySK2JiakAKtoqsuKevpqD0D3gF4XJBbgSuwtBb+/SEM?=
 =?us-ascii?Q?181wAF1qrueBEl6mBxTMP05emgC2xGQgseQtVL12Sg7ansfv4+gdHbxG1bsl?=
 =?us-ascii?Q?3W3vivLy0nlPnYUfjio1tn3EgE9p3ea4AVVQAmQtrx1PmXhwFZy9t5D+eeWw?=
 =?us-ascii?Q?4XCz31etdms8u+XAwOpVzn6yqbFViUj+/7Pc9Ni5RWtqRcxsOkz2W29aCc3E?=
 =?us-ascii?Q?R+Bk/fWbwBhTjM4CmmciV2KlnZbtQHrZ9SPh9SnPzRBax4ZGl/D2fZAdVCm6?=
 =?us-ascii?Q?tNPG/7f/amRgCT71M8G1EjmRU+VTk97JDOYCEz1JbWF+LHgbV4p46eF3nhcK?=
 =?us-ascii?Q?12GTFhW2BsadKdnAyVemWAkFXzwbV6KtoqcwZoPmNR2WTAN7qZU1931rhFDJ?=
 =?us-ascii?Q?aCckQ0EEYbD3B80o+ohNWJw6eAAjzocX4ttoRkaJJMPaXt57XWo6qTSv1gmi?=
 =?us-ascii?Q?HT1H1hLNm6+/PhdUf40h5iKveb6Dob68Uh/mEOASPCDNmOwNWvqMF/VD1PQR?=
 =?us-ascii?Q?wmiJomxfRKGRrOJYzjA6VgcunR6zVe8EsHmXtrM0E15+Rpd1O2eyP3eavEKs?=
 =?us-ascii?Q?rO5KXIb56lE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A+EfQHXZNsBEenEWZgu/xLamFanPLli1+t6i+IuNQ8uPJry2WQPEnxC5ON8P?=
 =?us-ascii?Q?OrPOpKhioPDaTAYuQxqwilTuUQI24cvIscDExLXCKP4ygxKsHc/Y6uIWKJDK?=
 =?us-ascii?Q?7PUmzqgsM7aBEGPQxx/Tqf1x3COsboQHnJ5ITREhT+7+A0/EQEh1xXxmbrkY?=
 =?us-ascii?Q?vUi6UZUEbjgymYNcVTRfzK7BfeyHzwFmKLb5pdGeFWSxXbHrNqqSW642m8zs?=
 =?us-ascii?Q?gyynUjO3RXKyvJeXd9p+MeVQ+C2f9mV/AlefcFQVUAR6dHzk//f2Jo6YF3B7?=
 =?us-ascii?Q?98azxJY2YGAk1rrPMWc5KJKUhG4tjaSA5JE76OuIjO+/IFpnasUSGrIU5x6n?=
 =?us-ascii?Q?94RzH3AEkV6/YMHSfPG8HYVcqz5xC1aDprMEv6b27ug1nijVTpIotgVJaz6p?=
 =?us-ascii?Q?pJUAD8mQo22zTV0vMfcUcaQZkgJ1WyD/e3ns6csAfNwlJIIZ1au2n4aWg1Kp?=
 =?us-ascii?Q?/gWLK9f29c/771HA83p7kZaK//bU44qVp3KXh4591MPHghx0jSK2DTMqVQEY?=
 =?us-ascii?Q?NFgDNY/61WuRHrYkpdey9Fo/Sij3aPBJS7Zrl/jnPuFp64/PgJeUzRbXQjay?=
 =?us-ascii?Q?C5Ri1Ogq8P2eE0/mAsXrsiB2B3VNtzBQCupgtecV2ppoVATL7fMuQfxJC7wA?=
 =?us-ascii?Q?eeJ1dJkhdHlFyJg0o3TFrjVZhZAOS7rwzVnpBtMvjwfzuCkg9EZ0DxDEwNrk?=
 =?us-ascii?Q?L0Jx89WpDC/h5xh+6diqDYTdhOcWquaa0SnMProT0wHSRPfOttg+2Y+c1Pan?=
 =?us-ascii?Q?SJr5bKtqqA8NHWbz29UQ5ukQakgIyMuuZQfcKXXVm50GhpB0e1QwHeafF20W?=
 =?us-ascii?Q?/ioiU9QSemIwo4FFUGIP0nBx8fna66JB4CtnYPfLD6hGj3NlB5cbxQhiTooz?=
 =?us-ascii?Q?+MnCw8a3s+q1BT7Teu6r5Kkgx5tl06nYzWZM8ZB7sT0VCdYHytjjHH0PXiML?=
 =?us-ascii?Q?kAe/TSnzmawc9hnL4bct+Q7XZN8DZsCfmMjo5WfHqCG7/44YHfmqiaxB1n5M?=
 =?us-ascii?Q?r5TVRRGpYlYddQXRTbMqwEX43i3adgI6LGX4j8HKPl0CwNsd1P0j0gmNY1S0?=
 =?us-ascii?Q?Lp8lNRvphAQsz1cM5JP9WujIBYmUxVtYRJEmsAfvGfx+yoUiqbaIA1HWUCeL?=
 =?us-ascii?Q?ZZ12Pp9WxJ5gbnTVC7pRMXyIrr3QuRVK1W64TxAg/fClNx3ZLun7vvAmxZ0p?=
 =?us-ascii?Q?ppjSWMerUGjvyPArIT+s8Iymfg9MCo6ygPHKFN+uL3F+tZZk9WVnXdsUupqu?=
 =?us-ascii?Q?OkQsru2wMdvW7ettwDlfz1VWIkPbu4j0M1Lf0/B1G55hlpNvTvT7XyApEbg4?=
 =?us-ascii?Q?7IoWF7Og5WMMn4QzsSOl1tK1/XZAsF7STAEVecKvri+nnLIgvEl+wtPGgEll?=
 =?us-ascii?Q?xb6pSVzgecNflcWnywOdn1RMj3DWFbYrIsOKCZ5gPoL4ok0zaDkgPaPgrlXe?=
 =?us-ascii?Q?poUbXBxrEqnLTbHZFxP0jAynx8rIOKR7/lCL5PF8nXFKpEA4TsUAIRbech0m?=
 =?us-ascii?Q?+9h54og28JZL7LCEpzf4ZvGJlLdaVDLICc8xI5UHxB3kekHZZZuiEv0Ysjw8?=
 =?us-ascii?Q?RGWB4trc4dImJnC6kKYKC1trMNU34RUmNIjMUKe2qXOPA+ibbU441dyDW2BQ?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ODeoMuxcBFTPwSudimXuu+V7cBe7/dgNCjZmKFSEvNJQK82qo9xLyjwyCN3S1970+nmwsac0V7q7kAwuwpaczBlyUjQKdMePh2Z4lNIsikQ6eZR5CJKr3UF/GXJuRR0+EUXpI8F509ayrbsJLkKiMxX0vTIWtZPgAzdyK3UukUx1dLtAZ9T2pjOqHzniamRVV/XUsXIyudkF2t9GidwB+BZZROqMkmCVaVnls3aGkYF36voebLjQIHvZJaq0t7UtfxQ3FBDNw1Q0cjqSkrwvFOE2jFMxT/DzQuBcgNie2zq50h0rVF+D/GPUNFUPtNlT5OZGTTIo3R1WNBvxK+plZLekW8QDJPhKQudSDP9MZ4qqPtr9abyK2GcRZO7hoQdwhWmQTtPiFSZst0z50TC4cQ6FBA43SPut6EfhPVt/f9/6g2BVq/c3O9IbfYs5bP/L3YOE6ENjYKCrq9eW98YN4ZNJShIJXjba9o9nhrKEvnpseGnta6sbwckLVKb4+Tje3eb6Op8tqOOY46CgCBcLiHCnhaomoyqa/oeZPoag5ekDeVg2JCBbXH5aSudDAedhy0nHFLZIBAFwG2E3thEaDrxXmDj7tgEE9MrNyIh067E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf92e84e-85d7-421c-db78-08ddae56e3d4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 10:57:17.0324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wuRFc0TzpHvHQ8E+5OfudFb5GESYvAULz5p8oMhyHEP90Tq36c1wbZegA+RUKNskwhnfeFcYAHUE8pMCNV8LzKGAAqLxFDtkdNFuHMFhtRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5195
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_04,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=900 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506180092
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=68529b90 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=1XWaLZrsAAAA:8 a=TBZdlYzzvtEp7cleM5gA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: fDUJAkIX-DQqIQZz_nWyIqHB-5FsnAaZ
X-Proofpoint-GUID: fDUJAkIX-DQqIQZz_nWyIqHB-5FsnAaZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA5MyBTYWx0ZWRfXyg0x633TVRoo TzQYR5Kr+9PUhWzhYEyE1TiCDy4ada/1X2Q3u6C8O1U0FiNZmGsKWdRNdXfyL7wrHdpyDr/T5Kv Lf4gjQY3iipNc2SF338NRuoz0dPGudpNG2y0CGpDZn9+7+4aaOKM4/eIXiikOi4T9LkSJ4e77Di
 Jk6hWWZIU5j8/z/FuDG7Icf8T/maXsddWYGQvKdpJpHUSXX3ET+8qWXEIefBD9AMnx+dxzz5CU5 5/WekOWOKvbWpAexMyObSFD5Y+KCuutzY+SKKNRiPQnfV+HiqHgmSb1xIQNss/4Z3a67beQvh06 cTsH8dFK+lXPwTbsckx3dWBTzcg0JsAUmhh66pbg/Ngyr+3mpn6KgTLcg9SoucJcTWh66ighZu6
 anl1QxftMwSJByh0UPGDAKTuh6tFXjMgohm9cbiMqiQUxjfn59JudJeAoqKePqNUywwqlSkC

On Wed, Jun 18, 2025 at 09:56:38AM +0000, Brendan Jackman wrote:
> On Mon Jun 16, 2025 at 8:24 PM UTC, Lorenzo Stoakes wrote:
> > REVIEWERS - let me know if these seem appropriate, I'm eyeballing
> > this. even if they are not quite best placed a 'best effort' is still
> > worthwhile so we establish a place to put all mm files, we can always
> > incrementally update these later.
>
> I don't value my own opinion very much here but FWIW this is
> fine with me, thanks for taking care of it!
>
> Acked-by: Brendan Jackman <jackmanb@google.com>

Well I value it :) thanks!

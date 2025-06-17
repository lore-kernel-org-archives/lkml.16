Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FBD29347C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150275; cv=fail; b=kTySqjXwZpx5NCzctAV3f5ImOGzOhZxlsHDmqn6QE/A+iLT7/2YDmyRu206LdIfR67AvSvp/POhkByPW0JpOO2QWUdFYsGncVgZR8lKU+tuiZzvfLua9tWb/QznD8L5vNx4AuETGmVOW/yO0yhf4nhCNNYIFnnsPwODkeMDSVN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150275; c=relaxed/simple;
	bh=brTFZrSaIPiMjJ+dDQ+VZQD0/d37SDjfG4bTlifBAY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qP/8bqMWACvJ9Cfok6SrROFnSIzgT/x+2ubsNDOM8IU6c9XzSCi64Wm+oSkPjV1YkL+SuouMf5KvN8BldhCA1uByXvEa4gKroEHHgzLqBjJgcxN1fDak/uEvsPnb2EGPzzo2r5xubrxt02Q0bGCGKuma2bblIfigBWPyLJD61HU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=m2v8/IJj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WsVpfOom; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m2v8/IJj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WsVpfOom"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7tYx6031951;
	Tue, 17 Jun 2025 08:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=/ckR8OPEK77WnuSFuh
	bIX4xGBcdDVr0ouzIYiPgdKRk=; b=m2v8/IJjU/68JxWz00fvZCYZ7I7lcbgqN5
	1LlQjGXhwjoXj88BEiNo71zUsLQ3Cpg4BPGrOSFQpBM0V0/IsF/Cb7Fg+3ve5k3V
	XsP7TuWAyAwk2wf0uaXoNUo2aZbCVjJiQkr+lkd/TqQFhhJCavAoH/DcEnp2BMAU
	3it3pSLU47wuJ2gOwRjqMpLmDPiU9G3fR3g5VLemKV1EW+ntZkqqEZYXmiJ3uKK5
	kG/nNTKIaz1HHfPDxOSkC2C+9xQe7vAEynMovVjn8ErKYiGY3CNlbGEX5YQoBvzh
	PfjCxgArftqbI/mQaEfGRdXLVOCbCIh3GF5LJTCTiUHldqxHyYlg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4mwrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 08:50:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8RkQL036274;
	Tue, 17 Jun 2025 08:50:56 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2046.outbound.protection.outlook.com [40.107.101.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhff4cw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 08:50:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxLi2SxoNy5S9JnH3QcXz4PwIleNjDrrZRlkOQjq9kgbu7bmIudF/tkQk6q2Xr8tcScT9Ou6gnbcFz8aC3MF3pT4RxQzlAbN1DVDix2HSGwPxzbUl2kknBsLa9foIha3SFDrIPUxcj9/ggQXzeQIhrV/ZJrfDfumTqXWLInH0qcIZ10HW200aR12bGzbQ6pe1BSbfk9JcT6ViElmjQ1xaTKeTKLHauUIIBnfmQLOdTAMsADiiI1LbC/08+vWd+ddhWZ2oL3rL6GOIHeEbor6p7MqzSlZ4gjgIVA7VCi1zWc6m2RnD7shl4TBBCbVjYqs/d8B1xTVIydCrBAY60q9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ckR8OPEK77WnuSFuhbIX4xGBcdDVr0ouzIYiPgdKRk=;
 b=ocYp3UKcoP6cAlfzZHAEo/Zy/RyvVj0CgVjZ+Aw28crh1CGcCdAZzSbpm9bzpsS3wiJ0K8tM1ykFz7f7qWyOO9LmvTA5ZiusPikkDacEv8q3Aq+TsKP1wsh1p+/ed2h+YTvhfUtZAmStGNYwqb+8rRdu3rE5mmRJV9WepFl1pqYt4mXjpJEcR3tsXgM5MUY+92G6jID0F7CfaTBNue35E5AcRYHLQfKwpHdUq8yDZvlvTuoOXNvz2h6+FaZNhEYXdLjjof4nYX1mLi3JI5FV3L+mxvm7NHrXtYkNnLTavBvn+merzQb0W1bU8FDeYoTouyV+k3e8bqBb363AkhHX4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ckR8OPEK77WnuSFuhbIX4xGBcdDVr0ouzIYiPgdKRk=;
 b=WsVpfOom6AWFzbeDYR4LVyXQ7RISHSoj11uP00Smm8lRyC3x3Qxzl8Ct4COQ2aVLDqpwX2okCQ4lnWggerng6/qO2qaXlWCEPqt7g61UmQai9juzxBY965vODhUTXUX6xtq6sCCzrrXQYxYTLUA4YFi4APyPggZn8OTBp+gKUBY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB7455.namprd10.prod.outlook.com (2603:10b6:8:161::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 08:50:55 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 08:50:55 +0000
Date: Tue, 17 Jun 2025 09:50:53 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, 21cnbao@gmail.com, david@redhat.com,
        Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH 1/1] mm/madvise: initialize prev pointer in
 madvise_walk_vmas
Message-ID: <6181fd25-6527-4cd0-b67f-2098191d262d@lucifer.local>
References: <20250617020544.57305-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617020544.57305-1-lance.yang@linux.dev>
X-ClientProxiedBy: LO2P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: e1cc163b-cb92-461f-2076-08ddad7c1246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hsgVE+W+vPDdEC9GcUPOds81KqepaPnlUK5di3y7167bhIryRq5E6/sDrdOO?=
 =?us-ascii?Q?TBEAaDyTF+TfRSIsHLnzzOdluHImf26EOjgGvJfnZ4GCn8Cie8v4fqj74Fd+?=
 =?us-ascii?Q?tkBiCKZKhkd/Eh3bdjRmJp7VFb9+LGg7OA28En4ZKiTdiDUUYQJohh5v8f7C?=
 =?us-ascii?Q?btvc/LkS5VMaxINNO4Te1GwWCi5expSHojqmItDH/KPxOC4K2RCKfZFFgT9M?=
 =?us-ascii?Q?aiNjEuxjHQ4EvUwBnLgQ6qibjh1n/eOQGKbw9AkRTisnQXp8y0al5B7t5GKH?=
 =?us-ascii?Q?2YTClry/VZQbPWqBh5+ptWFotvgBfwk55cLSksDXEzqCw6H8o+8e/3TPMmmV?=
 =?us-ascii?Q?uxZm9MsRe0F8cNpbogtBn3SKHB1rIKtp8tgoQLZ/UWzvfAJxX+lpPjamW5+P?=
 =?us-ascii?Q?qPmjB5WxbxLnoowr+EutImD0VaxqPpQo47cVrV5O1v55YKMcn4zAGjp2kUo+?=
 =?us-ascii?Q?nU1FKD4jDJRxccDA0dlgGcb/Z/mwTbSszc2waJrezbf6Kg1KbvmSDfIp+2bV?=
 =?us-ascii?Q?vefa4BvLUcVRIWGGHOrmrl6WvbGI0d+oMOzU/Br3IurWrfAFe0LTt92y9VC2?=
 =?us-ascii?Q?3BkgYPQb2E0CTrMT9EvOa5LQ41wzh03VL/4cEvcYHdeztVMACFFlgXzxuVvZ?=
 =?us-ascii?Q?3fal+hpn/aFkAV55ztmt5co+3ugMk06oIlOK60EhnlKxPSlk+UWTnBHd3eq/?=
 =?us-ascii?Q?QpRd9sf07XJKd5PdvPJa1Pnl4r6m9OziYZatgYNyL1qlwqGvulGX020t4uI1?=
 =?us-ascii?Q?RJOGkDHPmYuET4aoDZnH0j5drElDRSavI9BK86MIswn/L8St5QP/38cgz+p+?=
 =?us-ascii?Q?H/9hJ1q1/guH3APWf4j7h0fvBhUPdKm0PpNE676ZY1BjQ7uV1mHuX+kh91Ke?=
 =?us-ascii?Q?eUjmC7DewA+TmSWj2DFEZhvCVuITWfpEGXSPGQjlYPOO5vBBcwnEWbjbOedR?=
 =?us-ascii?Q?Yf3ShBphZ04tfK2egQ1P6BRIruGnfhMLf3pmzKLjivonw00vrTHyl/jhhUri?=
 =?us-ascii?Q?zveRYkYiTa9euubtzrwU2C6JCuPdcR15SbXsaDcMnC3seKxsgRVgL4i8V2K5?=
 =?us-ascii?Q?AimltP2gnn2SXZr7lZ60lYXMdOjQ/wzGGx5Su3y5o08EUAcTU3qzW3klBXeS?=
 =?us-ascii?Q?Qw6XEpPp9CxkSvaHTNlk7XVysUcFGvascKXbDpsr6llf/cNosFKLi6H5m/Gk?=
 =?us-ascii?Q?nDjvmt98aADBvr+Bm7lKuzqRHH0CEzq6Hpe3p2lLmI5xddvPA2cM46DdA2mU?=
 =?us-ascii?Q?I49SVxxLqHLwM5+QWg866pgs1VvYasYCbjWrvSmsrkeqsPDwoI+zU7fsa2P5?=
 =?us-ascii?Q?7MQD6bpP5ZbcXxtCe6nNc2djK2dJAx7c91XRoj/zX98zeJJJifYXGn/g5vk0?=
 =?us-ascii?Q?6vlpA1GN2v4HG8z0A89CwGc1FmhKNo5u5LgG6jb+pfJEQB+DBmcWU0H0nNwS?=
 =?us-ascii?Q?UJIPmj4YBts=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dibDVI/9MvGf2eP8YuwwY8jCW5Z18nH9siELlr8yfX1qw1q2hvj6yLrbBBJF?=
 =?us-ascii?Q?S6EsOhcTgjzn5leNwSr2VztsSwt8Icr6YbV8gtgGh+6yfh/N17AMrbrQ0cUy?=
 =?us-ascii?Q?jX1yT6Bc6NyTwlRiK+7O/JM72/4u0/pC6cvGzGwZsWBUFaSrCxA/f8k6Rpw6?=
 =?us-ascii?Q?gA9BfWK63uPk6s0IopKAAHYRqHgJVkQCMne01qB2UXcFcaoKmhsGMgWnICts?=
 =?us-ascii?Q?zf4bzPmisHgIew4Ppu98WWeBxkHZJGerNC7rtrhynz+m+YPYMpjFfCKxuK/b?=
 =?us-ascii?Q?pUbGkp/dkuWeki3H6lnooO8DRMLwrV30MFnRETYT7p/WaqNtFiv4vx/YnTNC?=
 =?us-ascii?Q?etuSGfnw6OsUlW0QbE6Rfc69ILhRRhhnT5hLH7IYyUClgl66IFFkPsVmGDJV?=
 =?us-ascii?Q?hSRrCZ8hsjAxCu2FPdwvI2FGRmrOk+zUTgTvmwiKBYuq19ex8h6Laed2EAvH?=
 =?us-ascii?Q?DSNMaatEFWqbv8uUgHNTpSBBAtniLrHJw/nxOg6LC32SPJLQNfx49KtNp2Nv?=
 =?us-ascii?Q?9L2UK1rlrgDJmr/8SCs0vAazVX91wjVwWqb8ip9o4z3KSCQWmfg+oReI9BFm?=
 =?us-ascii?Q?o7VHGLQ7eStjHl9P1EtNEDFN/iI6VLfg69Y6DPWCQSszPOhV9BxVcOEunyg6?=
 =?us-ascii?Q?mge+NBT2B0gQEAqjQ2wxCAkSsf53ImfILm59cBxgbEiQO0DgqebvCqwlLCfT?=
 =?us-ascii?Q?udWgLfuyGiVaW7xpOCQC7B68+2V6/xKb9b85+jOOS7o0p+na3cz17hPJPiEP?=
 =?us-ascii?Q?O+OPzF7rPybHXNtTRA67HYfZ9Gqh6NIXTrnmg0oCoqdYK0Ny1LwOKAmWl3Iv?=
 =?us-ascii?Q?Es2r0ltgrAk7VkHwdxSmxNLX2DtTJsmpXY27Iv2Ksk6p0bzxJF0gMEGgVhTG?=
 =?us-ascii?Q?eON7a0Lsuk4EzHhMAAFchO9N9Q2J7Ai6YrbjC1Z8jjNQ/3xkm4zX+kh0DVEW?=
 =?us-ascii?Q?uU7WjkHyVpTFf4JqRVoXTbgK1wKhsLyp8x587eU2tqMitKKbUNpKQqi5BCl4?=
 =?us-ascii?Q?pehvvJPACqX6MX/hIhP1ahNLSW/WzfyxeWLVut1HT33Io1LYbHKE+g+nhg+1?=
 =?us-ascii?Q?b0yMpa7XxPPGDV4ojYNmkjNKkCWIebHIKE8xJBbCCnkXUdL3XRDZlKPw3dI4?=
 =?us-ascii?Q?uWpeCHX5Cto15ugHmAuLAKvVJ3uq/EOUhIIAuDEDb3RfkxDdAoAlER0IMTia?=
 =?us-ascii?Q?a/RxbvxFqJ38XguB1Q8IxrSk+CPcZdGhvl0awbTqux+N148bJ/ySJdq3s8qx?=
 =?us-ascii?Q?PLqcrQXaNOaHYkSso37narZaV1eLlK+vDVlrRfI6U4S62jBl96SbCRM+pw0H?=
 =?us-ascii?Q?eOmUAnVS6Hlu/CAkwXwg3a8RLgrJ7CnIisxChA0bh02okyPUx1bRkflBDDCd?=
 =?us-ascii?Q?nmVb7zq6zqetgf0ADN0TSb2nLFBAHWV4n7do8RkBQhZgunXthDaBvJ+0rnLC?=
 =?us-ascii?Q?QXO6LWQI3aAtsdg/IsDvs4uQ5idz7ZxxKOA82YsU8ZvU9NCT48ndrP4mCX0g?=
 =?us-ascii?Q?3CSVbp9D4hbfA/CGmtzqWqm4JvVNHX/FO17IAXgPHTlMBPyWrx3d09VlSUXY?=
 =?us-ascii?Q?tCkaj1dLpFdMk6ZpvgzPJl7UVcJbq3JmScDWzVtKJazzoBszatvCAomOlYoF?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LgGXHy+JuHGO40kfNg+otvH3B1OYQHaZqapDoTfBs7nWwGd/c2W7tBQ/Utvmix3+YJS/63Znz8oIc/BJ5glx6ifK7fyMtOKP8Os9hpVWLuYvVyzpeKaBiiHtYqK8YVRUIkjvn/vTUc8ilMz0XwqECcZcDdG73QrWGNWIhfbiJ8U/LtUYumZNVIDs3iD1JMHr8N2isvpHa48Tg3vYHysnJcxdZv1Ir60QtpjFTGhFH2NAF7jwkzlpNSRRCzo/g4vAaLSZ3v3Tt89dOz3WNw+m2R0xBZegQI+XBf8KD9w1z8jwOmn9exzD70sbSGBochtmROmv6rhm47E1vu3/6DJp3LwoCTBll+kO6WSNrvqumsuKXvOJS1aPV+eAOD0Yfgenb7ZQ1fvn5pFtElpCH8OAF5uEfLo6yJYTevoWjETE8Wf1gVwosnCDGqPRuwg0Hoa0yMtF7xTi2aPFRVU5VWiQObskXm6z06zpJa+6UDcAxtybY9wXb7cUp06ROKxBvVTYpUc4SPPYZAhYPCBP7rUgdIfm0dN4YbmxaC7yoLnaIVwe8N8Tr85EyCd4hiwy0C3ZViVJNUbvdx0YqZO/weu3v2rchjOQlXRHTSDzQ5DaeG0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cc163b-cb92-461f-2076-08ddad7c1246
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 08:50:55.1385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yd37vrDBeduE0sPNZBGwOtcA62PykwJH1/Tr5Wcw5ID5D0frykAj0BkmQHcvEwwey5MqWWcBjN+e2sZ1cZb6PG2UkHnRj/11uc9aXmZ21IU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7455
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170071
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3MSBTYWx0ZWRfX4S4I/FZYHBz/ HKuSXOSbTEg+sv2qBDASNuwY+TXMLXCLRSSf2J1/E+DWhoR1c5EDqDo8EP+1yRY555wSdc+lE71 VOUeOUTaDK9hI+wfa9uIm7TZhMn3tQlXqOc1XbdVP25D8n962tN4VdNepIBc0NVglVJIqNYZ97V
 2x6Z9IGRt938EuG3VQVQuZaTmgfdSUvu8FfiyFBR02nZ0pLKJT73RLXKHcvA+96flUIM8NCGNdp ho56uRELFBO8OAdppjvFQN3JHVbhn6c9fGZrdrHMurCpWg8sLnFxrucFdyI87Hs1tOvEGzewQaN XmnjRGPIDC8HO0KFPJlD/JLTJ7YXC6ZGSJcbw4vWJw32OVyWA+lKFJJ06Sb9DZMj7nMCG007pSQ
 QVX47FRGet9s8g1X+RrWZnjNsIFiAqisulZJpCUNv5vUwNUF95imkToGlJuiObhikCpfIXdK
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=68512c72 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=KCzudBWdaKcij40r4uYA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714
X-Proofpoint-GUID: 44YDjIX4x3lWKlynxNMIINaEjR1tBi_v
X-Proofpoint-ORIG-GUID: 44YDjIX4x3lWKlynxNMIINaEjR1tBi_v

Lace - To simplify and not get bogged down in sub-threads am replying at the top
level.

TL;DR this fix is incorrect, but the issue is correct :)

So the patch at [0] introduced by Barry changed things in a way that _appears_
broken but in fact aren't, however we should do something about this, obviously.

That patch added:

	if (madv_behavior && madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
		vma = try_vma_read_lock(mm, madv_behavior, start, end);
		if (vma) {
			error = visit(vma, &prev, start, end, arg);
			vma_end_read(vma);
			return error;
		}
	}

And the problem is, in this case, we don't initialise prev.

In all other cases, we do (under mmap lock):

	vma = find_vma_prev(mm, start, &prev);
	if (vma && start > vma->vm_start)
		prev = vma;

The reason this isn't a problem is that the only madvise operation that
currently supports this, madvise_dontneed_free() will initialise *prev = vma.

BUT we really shouldn't be relying on this, so I attach a fixpatch.

Given Barry's patch isn't mainline yet, I think this should just be squashed
into that as a fix?

It kind of sucks to do this, but it resolves any potential bug.

I think a follow up is needed, as there's an implicit assumption it seems that
prev is updated immediately for most callers, but of course anon_vma_name is a
special snowflake.

todos++;

Lance - I suggest you reply to Barry's series with the below fix, or I can if
you prefer?

[0]: https://lore.kernel.org/linux-mm/20250607220150.2980-1-21cnbao@gmail.com/

Thanks!

On Tue, Jun 17, 2025 at 10:05:43AM +0800, Lance Yang wrote:
> From: Lance Yang <lance.yang@linux.dev>
>
> The prev pointer was uninitialized, which could lead to undefined behavior
> where its address is taken and passed to the visit() callback without being
> assigned a value.
>
> Initializing it to NULL makes the code safer and prevents potential bugs
> if a future callback function attempts to read from it.
>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> ---
>  mm/madvise.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 267d8e4adf31..c87325000303 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1536,10 +1536,10 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
>  				   struct vm_area_struct **prev, unsigned long start,
>  				   unsigned long end, void *arg))
>  {
> +	struct vm_area_struct *prev = NULL;
>  	struct vm_area_struct *vma;
> -	struct vm_area_struct *prev;
> -	unsigned long tmp;
>  	int unmapped_error = 0;
> +	unsigned long tmp;
>  	int error;
>
>  	/*
> --
> 2.49.0
>

----8<----
From c8dc9f5b2929e389cac44b79201fff43e0ab8195 Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Tue, 17 Jun 2025 09:46:27 +0100
Subject: [PATCH] fix

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/madvise.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/madvise.c b/mm/madvise.c
index 267d8e4adf31..45ea4588e34e 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1549,6 +1549,7 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 	if (madv_behavior && madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
 		vma = try_vma_read_lock(mm, madv_behavior, start, end);
 		if (vma) {
+			*prev = vma;
 			error = visit(vma, &prev, start, end, arg);
 			vma_end_read(vma);
 			return error;
--
2.49.0

Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11020115.outbound.protection.outlook.com [52.101.56.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1809189915
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744834034; cv=fail; b=gzS8jErH86j5mqXIZhl9BcSQv0XLPCPFPlReVl7YdAe3KcKNNLe/FcFS0Rk2H0mkBrMPW70XsFizdFor2Pn7NCSwuqyE/TK//UQqyQNrO0KgAI/Mdc2jlqkSkXXr9APmvch0b22kYJM9HJdrpvStO83fYjgs/HJfRapkKOCXIiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744834034; c=relaxed/simple;
	bh=aKVP3OJ4n2EoDAXj5iWuHcDG/IGakX2RTYqC1q00gTU=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=nTk3y0sJRA9Lq5Z8uIO4w98BSM+p6BIT/vCYA/FG5RRVegTDuWmsd4hGNPKtb9cTjtRB3QInHBggqXBeqA1gwR1AqjS/CR9vJ3oovuLv/pAv2kSxqKv7Z9F0MrRk34ClcOUjybreaqwYNdCxiy+xSaExWvd3anJ0pkzZl0X+lkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-advantage.com; spf=pass smtp.mailfrom=in-advantage.com; dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com header.i=@inadvantage.onmicrosoft.com header.b=FufXf5AT; arc=fail smtp.client-ip=52.101.56.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com header.i=@inadvantage.onmicrosoft.com header.b="FufXf5AT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgLw5bMLRkgxFBrSKLp0ems+YC0Cpikva3/v0S/IcAaK/NQy0iI2LftnpQ2Cv1kYaRhyD1oS7Ry4CL6w/UInY9W2Iu7G4jgn9/zkrn+hJdRv8i1k23vRkWVT2icLn37q1VqF2ZdhBEji6dA2o2YF2R3DFoX94VlvRBL4NbsTn25vlDn7J4Iw5t363YSbcgFlSgExJObgnwtAFqNnk1TPitWiyvxAuaJYp5uTnMgdEQa9ZhY1UcyAirFTRoTmCbor72XMj5fCjluqi7JHsRu4iRmuzKf6LDZwQZsKjWOtIK3ApHN5+4Cb9ogSqgNQA9vojakT5t+Ziru1ihujOdXFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQi+kbep9214jlnRhp2wqerDsVXvYd48/NqTO22FtJ8=;
 b=g1Fo6olT6sU8A4GTqFheqfDs9KISkHLtaCSqgKxT6jdC6A3PDPtZ/eMSo2mweocg7qxUlOLE7k6y/RtP5s5jFwQW/Kj4S9QIovS12c0fXkSrik2YXwcg7Ht2pZWTLwB3QoyNf1xZyySy1CCCyQa5G95kHRQdRW5LW+pKHmRVraS9Dd1p5VUTs4rJdqkRZ/LORgVDhcZDMkj+Rpew6M8XlUHLXBioB4av2qJ2RlkEayTdkBQAAvbCbedqcxaEZgl+jkX6vfJ5u4V/pgETnX3QmEGGGDPrz6hoszrhdQZpItYfz/Ks714UMVstFbDuYfguhwFs3t8hA0eoKA3yhL9+8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQi+kbep9214jlnRhp2wqerDsVXvYd48/NqTO22FtJ8=;
 b=FufXf5ATMXV8N9Wq0X+GIHpJGiz99X8QBb9YXDblXI35HIGA5JjjlTwAoRXOmkGsyupMlzHRYH17j0h7tKPD4NyGWb11quGD2OjbAN0dqSmvy94xrA4+JBv0UZH5uMiNE2aR2188lCY8tmZieSZdLP9sSnFrIoJeS270RTvkmAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by MW4PR10MB6324.namprd10.prod.outlook.com (2603:10b6:303:1ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 20:07:07 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 20:07:07 +0000
Date: Wed, 16 Apr 2025 15:06:59 -0500
From: Colin Foster <colin.foster@in-advantage.com>
To: linux-kernel@vger.kernel.org
Cc: "netdev@vger.kernel.org Paolo Abeni" <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Steve Glendinning <steve.glendinning@shawell.net>
Subject: SMSC911X MAC Read Corruption
Message-ID: <aAAN49MP-JeU4g1A@colin-ia-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MW4P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::6) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|MW4PR10MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c4aae0a-7d4d-4a6d-78f9-08dd7d22434a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1vhjPaukvuqYOTpgW9jOHdMS2TajyXrqRjDdHf76dQnAvgcGPLxhPWtFYRdR?=
 =?us-ascii?Q?Tk5a2wTqjeUzlwWIZW7YQ+/jL3TizA5og2UzRepmsxOzlr82xuH8W6+ib5Pc?=
 =?us-ascii?Q?OReUKvfAcGE7anHhWFKJc7doKcFQ+h55XhE0PF3egWsiphTrDD62C6mWOnes?=
 =?us-ascii?Q?9qgaO/YeW5cDO4V1OkoDV/iRGhJdTX0JGxWDnLpUlz1Xu5WmOEeclyFs6FJp?=
 =?us-ascii?Q?Ly73+HSn1WjKGS8HEuKnNcCK6PvSQQldqah7F+1tBWs9EvvDwvQHaVu6WjvN?=
 =?us-ascii?Q?/j0Thp9L3jAtjmWByWcoRVgOYo2wUBXV/29CJIlxUXamoihWeHECSdqW7b8i?=
 =?us-ascii?Q?rwpuUV83xtV4yf/Q3ZLs9Y71ZUthaXqExFuOtQP+ngC1vg+/XbN5uEiUpwnG?=
 =?us-ascii?Q?6aE5/EKf9GItDNfJkRE0fLVtRNZKZ2ZTZ1yTvP2TeSQMr1Fnmudcv9XRHLXd?=
 =?us-ascii?Q?QWmpe0Vjn7i7OW1bxidj5xd5pVVUXi1G1hfhFwpK3cb4WQlnnOxGZpH3VKqx?=
 =?us-ascii?Q?tobjlaAgEz9ogrD6zViFIR2Wl7TctVIMXRMrZcuSRkfFeWcEnOETUuAgX/KN?=
 =?us-ascii?Q?HxnqCCzvSIbfyds0EekcvM0596o7qNN1RuJ6IK5+vxQvdt93xL6Wpm+IN3QH?=
 =?us-ascii?Q?n3n2TFj9Hy0Yrt1gmg+fEFTFuHigu0ETisk9gAXLa29Qmq59HTz99mmRC6hQ?=
 =?us-ascii?Q?DA/A12ciFNYnMI48JRbZrx9U71hRaKTPO9V3eK2gj5sd3YNmLAKXjknxr1GM?=
 =?us-ascii?Q?uy2JWTPxtS1aC5oVaa6gMO+uQp5L4MXPeSwgPC1hYKYS+gGQyYBJBe8eGTBd?=
 =?us-ascii?Q?U8KzqXl+x4Aft46J/8Pa9O2rta25J0Cli82QF+Qrbgq3xVSMbAVC3FeN8txx?=
 =?us-ascii?Q?/gkT3apsyFEwtwonIOg+lNC3RVaIviG8Z0Ny0TViCVfJvETewwdaA8UxqFpa?=
 =?us-ascii?Q?q2702J3WWvgggS+RCByRRxNA4OUVZK2dyGM2D/x4GBekLdTyE36FixBemkU1?=
 =?us-ascii?Q?q9M4h24kBhgxATFS5xCbRsUfXJQbAE2zfwJ3ZhC5Ol+T5n7pelQCX0tAeLKy?=
 =?us-ascii?Q?fCNC3mLcqLY2jelrCe/dakZ/N1iE/Oacpe/ebTCTpBjxHFLiTAbNqcBE9/W7?=
 =?us-ascii?Q?Imhi3AFE0YIUafNm/vUFNoeHmoL20kNa2JE3IkqtBFFzAd32vBLEUmbBzNsb?=
 =?us-ascii?Q?rF5LhD4ppc/D/l8h4SL08vOLUctw3USNv1nFiBvRbyrXG9W9C+Gte7HhTo6V?=
 =?us-ascii?Q?FbBdAz9IC68cD6rmQUxPnthAR0H1qXysdZtzl4mZ2PgEiJeynSLWBCSZ3Zlu?=
 =?us-ascii?Q?rv2zJ4vzbI8OVupfXEvWK/aYoe0oAf7tcWUs5agkxQwlqh1tzd7uoDnuVZjS?=
 =?us-ascii?Q?BWHGRGo/96RT0sbbHFEdlZR8rmYKutYEkcbvDFuWvDjR1nIhNJb30gyhnlC9?=
 =?us-ascii?Q?FOKIQheMPI8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6974.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?So/cefpCYiGZ9khAquJBp50rG7EUTqvATF+8/Ljc54WcYFuT9AJJDsUnRPul?=
 =?us-ascii?Q?qvLTkQrWaUbXC+l2KP8lae4aPFVCxc08X298KOdoOXA6Gf6N+pEhjeVkea/t?=
 =?us-ascii?Q?wruL3krAUHWCiyp230fN36QdnhnK5WY7cf2Bp0bc+xhdylKqD4KMzmwpfJcc?=
 =?us-ascii?Q?fKygX7LRsIcc5DMAgFMR9XXcRTvAZ4l+4+nGsjtO2vRz1+GihbBgBvVEFKy/?=
 =?us-ascii?Q?brI1OYbdi1A2bHH1TjokJXUPavtRfrN4XGjVHt1L8JQrcd45P1wW/3hbiLBY?=
 =?us-ascii?Q?drzvQfupQTF3oZlQCyD52Ilmz3p+r0HIHsWrbdw+ydXxpJA4QCxmgIPm4Rq6?=
 =?us-ascii?Q?xR5/MrYpiZg60yuI4OhQuUqpS7asowMcfoCNXLEnzSacNohg/ZL9d5jW7+rj?=
 =?us-ascii?Q?C4nNACoUKjoSHPzTdDDhxxbNFy/YpnEb8KSCGRpO/6uanFK8/DBvv6mxj3kz?=
 =?us-ascii?Q?qCBAQhN9vcnLSLe+f3k01XFqyBJu4+TXS/b1kRThCKv+KLHtO79rP94hjnMm?=
 =?us-ascii?Q?xHO2n/JypRMTahF4x77IC1HWEf4hLTNJU4NRYdw51jwORyXApLH+30mlzX2Y?=
 =?us-ascii?Q?Gb14tXjSY0Mgge9IboX3Opcp0pMMQ9bmGAhOPcKrl4ZKHD3/M+OXgh/96uoD?=
 =?us-ascii?Q?LjX9WBxTeQloez7oph4vE7i/aQ6M8thZHHNLxBLpELuJLIDTlv8r3+pGpIAP?=
 =?us-ascii?Q?WW2soC1ytDT328RAyl03g4/rdnKztjyoSyxItGhdRNwzyX1GUh9GBKTOMbQF?=
 =?us-ascii?Q?XnGQONcS1FDZ+Zj0PMw4/YgZp2RAHn0GjR6FyGcJnKBREBFdBPSvr4MnTPTH?=
 =?us-ascii?Q?o53isTwEmA1NOUNDxz0kIJHBaU8RnVRKJHRBdRLC0zg2IUOFqJi1cMIcOpZK?=
 =?us-ascii?Q?gmuslrAwwOdvtiEqHDKlNTpWSFbmU+uhBuBb9LBVx8Z24LcOTSSmSBUQg1Mv?=
 =?us-ascii?Q?PpqI+iQ27MH19TGhZN8y2ZUiazZXp69UfNBT80RK0b0fQqQnPPziMMafgK0/?=
 =?us-ascii?Q?4o5P10uTvFxoTh/OS2aF+qMSjlA1xLIL5VPPDJfwbnaN5ZDvyEudO4Yy4AB/?=
 =?us-ascii?Q?RQg65pUvT/Ziwvjo59oM6Hi/s+eeugzAWHL1bT7ItL7wBTcbRikd1iOkqcDi?=
 =?us-ascii?Q?+p96wVl6LmLdHRQ9QMUZnnbN9nCgm/LWcOojRcp7E3paTUK/t5vp6nZw+Bqe?=
 =?us-ascii?Q?M8nHpBxP4Ka+fcntNBQVVdlTu+jKCvHrXinkII3uMqavmLt2Hy7CYwYdzR8s?=
 =?us-ascii?Q?Zzhh56THMX8GB4zhttFZi5ijyNIY2G97NoL5GVGi5+X4qiB1rzifEYbYqQJ/?=
 =?us-ascii?Q?XggscBpWMnIFI8OFsa1XxZy/Be4cglJn5JXcrdtTSu30vPIcUTnyg3uqtid9?=
 =?us-ascii?Q?SiaEfG/n9zuqFJzx2TL7Ds7K+Ih5qsRdW+v+rQdym0CAJHfNy9EhJy7R7QGL?=
 =?us-ascii?Q?lE2R92dpZbjHj8+6LuTNCeIuVCm6Z5idFCGOUn7wy5Fbd7rYkg8ojA5abGeg?=
 =?us-ascii?Q?CbDMMbuT3SxjOV0+49WrlkW02qYyZW5JcWzNNg2p9BeAwDVbqTeg6Kxdlpx3?=
 =?us-ascii?Q?tAvhCTCYOz/ea4aUpAj1GAp1dhvEwISr1fVA5DkmghItI0xvqjv7pl8sqEYn?=
 =?us-ascii?Q?2w=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4aae0a-7d4d-4a6d-78f9-08dd7d22434a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 20:07:06.9571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvm1rmaiYW1ybzBEVVA4vHZlVykGpWvU51BVntEhzHq5uePJB8WdF+7ZyTXrhLiMao/oPFOlzgoL911abQRaeN1ndkaWBEjR6sxoMzTN1Tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6324

Hello,

I have a fairly old system running an SMSC9221 chip. We've seen that the
last two octets of our MACs are all zero. (I'm currently testing on
6.12.23)

I've found that the first smsc911x_mac_read(pData, *) call seems to
return zero, and subsequent reads succeed.

---------8<------------
static void smsc911x_read_mac_address(struct net_device *dev)
{
        struct smsc911x_data *pdata = netdev_priv(dev);
        u32 mac_high16 = smsc911x_mac_read(pdata, ADDRH);
        u32 mac_low32 = smsc911x_mac_read(pdata, ADDRL);
        u8 addr[ETH_ALEN];

        addr[0] = (u8)(mac_low32);
        addr[1] = (u8)(mac_low32 >> 8);
        addr[2] = (u8)(mac_low32 >> 16);
        addr[3] = (u8)(mac_low32 >> 24);
        addr[4] = (u8)(mac_high16);
        addr[5] = (u8)(mac_high16 >> 8);
        eth_hw_addr_set(dev, addr);
}
---------8<------------

Simply reading the ADDRH twice causes the issue to go away.

I was attempting to upstream the DTS a while back, but hit a wall
troubleshooting gremlins I still haven't uncovered:

https://lkml.org/lkml/2023/2/8/1289

I figure this is either:

  1. An issue for everyone, but nobody notices (because the
     hardware combination is rare, or MAC collisions simply
     are missed)
  2. An issue for just me due to a DTS error (which is usually
     the case)

So maybe this is a question around (1). If this is an issue for
everyone, I'm happy to send a patch to read mac_high16 twice if the
first read is 0x0000. Or if there are any other ideas, I'm willing
to try whatever might be suggested.

Thanks,

Colin Foster

Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8501F03C8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594595; cv=fail; b=My0KFGWDNpKT5f5fFo46djLMJ4RHPsqtyV7hW4b7RXoqCsXDKi+mPQ95xAAwimCa/tcpTg9EBSehriQsZRo0vlsO4dYvv9ZozrvCxhpyVv/ZN3ZnkbQVkzCOGLVa5TuFayRw9/Aq5gMJf5YO65t3N0S3xuxz6FGuQBAc6LwcjWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594595; c=relaxed/simple;
	bh=PKL2oCgjGJZ2CgWsWnPZxFgFWKMcUzz9a8YEZF972RI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i5fmFGsm9V0YwNo86w53XPg0Uh+zWBZYh6hSIN0lBLEpVptLzkaIchQvccidmauNjxRuy/CI+KB+nQ+USNWxHBpR0IPNc3lPxfiJSb4cuR0R0OivSMMMUJbEv9PU8pl/rUwztif+OPQgXKQOY+e6YLJ9fetxJ7+XJBWJEsQrvGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BE2I/7dO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Fyi3Uw/g; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BE2I/7dO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Fyi3Uw/g"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5326fxi9031139;
	Wed, 2 Apr 2025 11:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=pV9XH6CD1IkJS9tTpp
	NBphGefpSI5/CXSWaJepsRF3E=; b=BE2I/7dOg5CqvhgeubErBiujN+xDIqCKwA
	zm/vgrJsRhsQG/HOC5FvdIsQerLJPZZw7su/77//2dOJZwAm3jnec4S2Lk0B6R32
	Lg/twVsV8Sk20orL3Rkm0M02Hd5Sffs33VTkyd5RoWNIQaNaJTa2I6oBX5rpAQK5
	jsyR+Nrap0QZaZ+AOl77YjbtVq6YX+jgq+y0WzDR5SX4HiCKbQgcSfRDMieHpYvC
	SqonN4HLOjNOz1ODE2TNL6mjt26OW+w8l2YuukN+bYUohZBaE9M5J8NlK2D19GU0
	3btu76eGoW1qhLGJKT0sKZTJN/Xo/vGR88+yTCzqUNIBGvJnIiBg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8fsaj60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 11:49:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 532ARBMA032724;
	Wed, 2 Apr 2025 11:49:42 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7aarewd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 11:49:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RamrUYM1ojXdxupLaGhfCwFTSro+0Z/jz6awfcH69NF8L9Ybn/KyaH7FiPHEYns2O/ntmies/D11B8QEOp90WKckno3WnNVyxmB5G/ilI47a/5gPXT3j5teVXMzzWrh80LpnfuPftFLZt3+/3ld4Rh+JSQgnehddkvSERCE76fHUSvOvGeXLzqAc4bRIQ13SvLF5e36alJYlsNEtFBRxZgRTE9ctDg0Z7rpzUwnLu4B2MD5WrSz6ZTTZLlimjU4hi6ky0e3YV/uf/Mvkf4CBFRPKS5dpLkeKJGvezmeC4RIl8n8JT3iXa3KGz/Fe7qer3ddC0NSVhL5dJiPvWpWGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pV9XH6CD1IkJS9tTppNBphGefpSI5/CXSWaJepsRF3E=;
 b=wcbH77mzdbFn1vczTPkYTArFCswtmohXgf3FkfeqGLgO4bL3MdK4rSMiB7KrRVRik4RxFpK4qYpT8XczBILooWXI5lHKUH9shcJLGLMqf8mu6FAS9xnzqzDbZa1ajORRih+zMYUMRU3G7bSB2yz+CsAXh1TNjvWxetVMRfDvhEZNnyYMKbzWcxxJNqJExXyViF+x3FWzGpdxHjAH6dp0F6UKFMcNZNa9gUrYlmedKdOE1ZczBYQ0g44bfqXtoCaT2XZO1v5OcwMPZ6kIcnsYkaHb3WPOEMVod8J4M+grNUL3h6/+XbudebAFQwwDOa8VhWyU4PRnVpecXNQrGovhNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pV9XH6CD1IkJS9tTppNBphGefpSI5/CXSWaJepsRF3E=;
 b=Fyi3Uw/guAxBsfe5fmRzkjiq89pFBt0klAK8uK4yt7fqWOEEMATyCFSkkTRlJ/la64jfOcilfCtHx84mSxo3FVMRv7Ainc0viIcOk46E9dOoSbYHaISI3PvStMluwYhec4NV1GfsBD2p39jJzn2Rirr4pHK5zKCgNfODlcUnfH4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BLAPR10MB5154.namprd10.prod.outlook.com (2603:10b6:208:328::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Wed, 2 Apr
 2025 11:49:39 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 11:49:39 +0000
Date: Wed, 2 Apr 2025 12:49:37 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+e3385f43b2897a19be24@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, jannh@google.com, liam.howlett@oracle.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] general protection fault in sys_mremap
Message-ID: <56fcb1ba-b9c1-4ec5-b1c5-dc90e3d81552@lucifer.local>
References: <b648feeb-d33d-4476-bdac-1d1a28eb72a1@lucifer.local>
 <67ed237b.050a0220.297a31.0019.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67ed237b.050a0220.297a31.0019.GAE@google.com>
X-ClientProxiedBy: LO2P265CA0050.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BLAPR10MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: 2985a72a-4f3f-4215-ad81-08dd71dc7357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EZTYXgf+Q/QGNCzUs82PPxcn9wSAjG/Hirw09HwVdaIz1+C1xpecdebySeUH?=
 =?us-ascii?Q?L/O2PEQuoPfQDp1Ns3TyBC2LtT4TGahnjPKd+4hesBTPiXSHha3HeCBXcPuy?=
 =?us-ascii?Q?jp5nW/ceKHlEaLLookhSXpL2nsYXjamG605mNn/jQHF8TrulMMq5Z73YSuAS?=
 =?us-ascii?Q?wiH4/fQVnv6ixpgV6YV9LMJ+bkONLE1Q0MwayYnyo3BSMn4DXZsNwVXW+JVI?=
 =?us-ascii?Q?71CK9/RKUpvJV53JMUdZPZKDssJHm8itr1gDaxRb5FW5oSZZEbPxX0vdFogW?=
 =?us-ascii?Q?HXczZUtXOOxRumNwyr/K5AVeS3Et7NbeRu3Gtuzp2WcYbobXBfbYuZC4Ga8B?=
 =?us-ascii?Q?+s94dYCjYa04m4yjSRuC5mEP/o0xMlLRGz8uYv0v+59sbf1kHXXf8ERAbK1S?=
 =?us-ascii?Q?3qBapF2rY2TujMFy10jhU2hEV1VALCl9JrgY/JlyIQBq+tUXrnC4jnAjjTuu?=
 =?us-ascii?Q?YS/qw33nWIoEr5vvzWWUSmRnfR8p000aYf7eUyeSOBVEv2kcx9M0BWpd7QXO?=
 =?us-ascii?Q?5S4YbrZSMENX3dvZuo8kposonhIfG0YnXUm4yX2CtQPoIzwzh2LcCys+6JU5?=
 =?us-ascii?Q?7cy1z85CPCnp9UMzFcwKdc/O/910a1XDUM5JkuiXvogQrs1G17unedFobw++?=
 =?us-ascii?Q?AIWDXh5X5zo3U4jAK950mzGt+uxbrAIwQG9Nn+LtYYG7vNSHYdboqBgb6Pwk?=
 =?us-ascii?Q?g823cX5pQIjRcawx3QUtw6cr72BovBHw+IpnYOHb/geexlIxMRRBK7jlfgw6?=
 =?us-ascii?Q?m28wSaVCdo02CbOztxP14+cn0aQChlZf+OripYggSu8f/lwRsKpemrV/qAY/?=
 =?us-ascii?Q?vEw30mGudyRQHov8VmD74qn/iI5oUX/IOF0KEKj9R5lCGmKCfiG73cYYtOUK?=
 =?us-ascii?Q?3z5Z2P++O4vKIPEjq26Fq4zlSwIY9LULgluyFyTQlAoxrQUFymOYMLeRHTFb?=
 =?us-ascii?Q?wr25LW+2NQqaMxR6FgOJa3HVI86sxrRC7eIdkF8qw9P9UXU5txGtIZaPjirz?=
 =?us-ascii?Q?93jpw33voXzp1KpwWZhrPqpt0IlB0X9860VJefhJwcOx0Vkg+Vb1HqSIy+Ch?=
 =?us-ascii?Q?tWmFVVZfntJI3SFuL+Fjenjqb7x0QGcszFQnk4inZTCK7SaCdlHc/ED5NGai?=
 =?us-ascii?Q?yANFxeXzQABnE5K3aLKyaiN+0HVAYoT6oh0WUjMRuLwcx5jbaDAxXVIciDb9?=
 =?us-ascii?Q?Do5wZCFjI6qIDyFXH6zl9cW7GizGy1Un16qmxZJPVqZCg8+Yad/1GVxXVo/F?=
 =?us-ascii?Q?sGG8yRra1gPY05KhafhprnmrT9lO1gybXweJd8mDZ5ubK2B2vs/8/xq/Ql8I?=
 =?us-ascii?Q?2f+YJ8aXHYmApfueHKZ9tZxOE5I7CigQK3Lg7a2D+ZIKfA1Zyy/RHyuTQ4Li?=
 =?us-ascii?Q?/qNbmK2VLw+2UgOXSW3dsUcB5nqv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9hqTY706i2gMwJru7CQ+yLkCsvpf5bzitrdvDwgMvXRDHVnCsa8/xcqOQi/L?=
 =?us-ascii?Q?fagq0bgPuqNZyDGsWCMuuREsmgzFcdXxHa9rbUTdcOUF9nJ3n2AmVmjipw+d?=
 =?us-ascii?Q?un1ABDOyb60KvrYnkSUn6sSIJ9ztdr12K9j8sWU+FtmDNuQx6TSHorGOSiM0?=
 =?us-ascii?Q?jf5K+hgO3xm1RCwm1S9ifTrApf8XFAUYzPyiYaV9ssd3vUiwiqc09iaa0L4y?=
 =?us-ascii?Q?Re0/8g+LCSJPl8VjZdZ+TISsKoNOcUUyhu78Z2Nmijrw/6fXlTko60eFpjWL?=
 =?us-ascii?Q?f/VxgqMWkNVYNrzrmV8aEeI2pCSVAaNZXNzcLH+AxTo2LBzlFVNWKL1CgUrt?=
 =?us-ascii?Q?ehCbZR7TgA8+a8+tzP9KwRzlb/amg6BRjhhhG5F8TSE36X+Xk9Utx6FA9wgc?=
 =?us-ascii?Q?HKFhD5+bRQGEcVozkFPOtEZbOHrWUsEgI3Ir30cEzMxiHmxB4p8RN52GNpXj?=
 =?us-ascii?Q?jOFBjXvlZH3WxsKLIA2C3rDn2Ejc3RRB6HE86nonuzHv6JjQEoC9uFECoxYN?=
 =?us-ascii?Q?WJCtQgf3TpfClxKj9AItujwQaBLO8jigAE2Pa0JJ8HPrcxybqZmTZy6nFyV4?=
 =?us-ascii?Q?HRXQeKGbGD/2LD+r4vLJoGvGzVas+V4/Eo0hBQe40mikwwcpDRBs2AMO+o9P?=
 =?us-ascii?Q?GXAPBcm0w+fyAI35IQ3S8vmoG1wHkO2MZd0/7fAW9FeRf8IRV1i2H7N4sn99?=
 =?us-ascii?Q?mwW2fRQrPfIOJP49Rk9GJ9s96/mGT2l9tl2Ufa4S1XxNbmaudP7qsx+YOhe6?=
 =?us-ascii?Q?BtufRdPUe+pWjF4uTD/W8yIDtIKStoVdljy0vXB8TnqH53kVUaDWhgEjTfQF?=
 =?us-ascii?Q?Q3sTx79EgtkQXtAKHnTYSoEKblNQOE1BU3MURPSMwLL1mF1bdwU+QkSbeV4f?=
 =?us-ascii?Q?WmPoPj8xxfFjdy81qfZ42v6NYqNKzVYn9+FwrMWy7rCETJLxQ66CqiGwnXia?=
 =?us-ascii?Q?XJmPRIrERZ44DEnDSO/4HVO9o6BP/9+PMVgLVodiRZotrozw1x/TuLLG2+S1?=
 =?us-ascii?Q?InVSIXasArJlWtf4tWFjUJsnqOSQEYtM3aEt6UbqicMyJ8ooOqxINYUhoQXD?=
 =?us-ascii?Q?EVX/ryWgR+L172TczrBHYerKpePrCsGtWHBX4E7ilN9deTqhpPj3k4X/TKy0?=
 =?us-ascii?Q?9zCqCMDJUWlPmPwR4uaQDg8+mMtwS9RPd4fVO1gh3K90j+6O7pCXFD5kYsXC?=
 =?us-ascii?Q?WlmKGiN3vTQHuIj3VsAJAgSHU7Eg4yN4uNQgZ2M6gDAhcPgD5LXmYlOtFgua?=
 =?us-ascii?Q?MdLw8gbLX1+HvZVijpmoP4h+tUgWapTRjRJ4Wqazg5CrIPrw4Us5HnA8+4uG?=
 =?us-ascii?Q?u/MigArbucm1/1+q/Qdk7oD/huAjKtQ9Ia+2uhWE3NVyChKoHPfgxjZPHRvo?=
 =?us-ascii?Q?Qhd934BtarcXj1oyeocGTxVAD79q6KyHb5wIrivn5nYXoPRVqNjh5t+rT4mF?=
 =?us-ascii?Q?oJLZB2dmSXsz0H3ptlXUhjGYBsy5MsMC7mV6TCegScDHl0CbjuGPSsmUs1az?=
 =?us-ascii?Q?4bffo6KzdwNLFhQglheC2BjDnqKWesVqUJPvECTBylp+QlwbokhCh/l2Wb3F?=
 =?us-ascii?Q?18hh60hF8q/lIwdz2pDWtRw96QgpxGqvdq84cXvyoTZOPU3Yemz/Gs2LldaP?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bLWVfHC+S4ItL7xJFRwEtCkyWZE1fQcLZmVznsWVnq692u9WXKKWIsjLQwDBOuedLFucPOxQOOn0ygsdRePWpeFRs+SoPkNNtpf5PoZWz+Q9Ufo2rSnZt/PFk40Y4BnCO2b4XGNRF2eV0hs+UjUZdlZZ7sbEdwpDxefXP0XJD7xKxv10COvPmHZXi+a0VyPqvPo2/7Yt0HWImea+OvzS0Es5LoODLdB2aK0vuDloZFFOTkU8upG+TIxC8bx+t4jEXHyYAYVOjiUP3oRlPRZjeAVDDebMf54BX84wOP/9iLsFlPp6gQsi97utxYn6lrH819JmYPZEl+FdOXEtEN9epCnLDtgG6hPVT/6eap8AcwfwB+zqcmxnBgnQm7ncD5gcMNRwzAVpEZSwSVVKwu0CrcFZcHjayXM936wa8FdUUEfL5DBagvWYuj3bU41QNZ/9aITr+VEPIo9sRz9ScwtsrhrLrMcn8cHVVAkaSvrZlFVOktJww3joYGIhbEzkMHadM+avifANvw1LYocUBzL8sgpvBzUmYWQv7DSsibPjzrlU7t51WUwy7QuIw4IKJZvL5mGQKGXp2HH6KBISaKnOk+7xonCEUlYW3L/E09+TG1o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2985a72a-4f3f-4215-ad81-08dd71dc7357
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 11:49:39.9024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agWuFb33Nvc+GQMwGXmxuyE5SSnSjvMao2FHiwNwf+tdS7N0DHLJgi5aWDnMys3AaD7c3yAlYyJVqfz1VLqoDKEg2f6Am1q1WjhyB478qjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5154
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_04,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxlogscore=913 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504020074
X-Proofpoint-ORIG-GUID: OBkaAORKwJ7XTPCAivskU-TJL-Kx6whn
X-Proofpoint-GUID: OBkaAORKwJ7XTPCAivskU-TJL-Kx6whn

On Wed, Apr 02, 2025 at 04:46:03AM -0700, syzbot wrote:
> Hello,
>
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> unregister_netdevice: waiting for DEV to become free
>
> unregister_netdevice: waiting for batadv0 to become free. Usage count = 3

Yeah... this looks like a syzbot snafu.

I have tested the fix against the repro _manually_ and confirmed it works.

But I guess, let's try again? For the sake of... something :P

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-stable

>
>
> Tested on:
>
> commit:         e20706d5 mseal sysmap: add arch-support txt
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-stable
> console output: https://syzkaller.appspot.com/x/log.txt?x=167a694c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ccf540055069887f
> dashboard link: https://syzkaller.appspot.com/bug?extid=e3385f43b2897a19be24
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
>
> Note: no patches were applied.

Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017FA270ECD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840689; cv=fail; b=Zw0ZNIiizvih5poYpPeBCmhhjWEAM9213OUZUBQlAR+GxfmjgYyTlGs3g5v9jGepzX6koMqd4HEMwycd5LRovViAlE+NMBEHsNqSs4W7sRf238PVl221+lpdK+YK9p4zVD0n0azLANA1EWCYYbajfTPIVQFdhI6dcoPJ6LDYSqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840689; c=relaxed/simple;
	bh=f98u08tV46+JTyjD//jXtky8XYPujeloWtHR/XI0NxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MDQfhmD1wpqi4HytS1W43tDD40HxQ6G6UfnkOG0AnkhwnV3JXk75qBZcxCQa5mC0VggGc69+6SIKQqMhfcpp/+lJrtV1kxkGQnl2NmIjZx/0J54+FpeU/dBslDCGj9r6dIvajCAmSkn9AKH8yIayZ1FoRzQaqA5Iuwyj4SmPsFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UYAWYeMt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GQ3FJB5W; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UYAWYeMt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GQ3FJB5W"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P7fe9g032649;
	Wed, 25 Jun 2025 08:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ZD5mD7noJveBOSJa70
	Cgmnc3ZXzWUiAmRjr7qiHi9eg=; b=UYAWYeMtHQFfPuwTdpMImCrPCsa3pTi6gf
	ELXGYKMZc3X8DOQOywkQ4FjrRBUiGLXPOUkOj5QiAU8YLlhMh3PNymfJr0F0PYjf
	lxHgzVogwvy1l7BGiy3XakUOrIo4TAo3iCvAk4eDfTtt3g3xKs7h4yNbAsER7rBf
	F+BFUMY0gAiDdc9jeeD3czD3cjGXtI5K6zQFQyu4YM9+1OYqljvBgEs5XyF3wPtm
	pjMZWx+PM23O0XzGBajGvhLhGmxpdVycktoGNqHesiO6MFMPEDTYkEmgH1WZUYrI
	DuNzF6W4TJlnqxHHxQxX2avowE7T1PWuvsTj7PUujJPEpSCJ9xeg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7uxym0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 08:37:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P7CBej028823;
	Wed, 25 Jun 2025 08:37:46 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpr9e52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 08:37:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdlTKPdoYySuNcX+wlXC9RubEjYP5JJ7hE3sXvnA1FN/jbH+/agOpgTlSovy2WPrdJF5I/TTCDicR1//1lwLlk2M4sfHnHVw2uotz5VbCzbpVLIeBPyIpnyBfDIJXHcnKJHLK5Mr6RtexwWNsAcFc920oAgb4zVNvWUc6kTDqmJGRGJIEzWfQIspliS6AaFfvgIAOIP/zD56iO0dgUfctrrmI4H5U8LwZ8urtMx7duRRqd0f4FJu8gFpb4wO91FaCAFi9U4JltwoMqBmJ+hxGcrRqCtwtxMgc3J9IEq+Q3TKaTjbgYdbmD+rATZmHEX5dbuLWI+iJwq4QXo6t4Gzhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZD5mD7noJveBOSJa70Cgmnc3ZXzWUiAmRjr7qiHi9eg=;
 b=cthigUKpeRzZjehEdGefGcgjRQ1tqhjA7Iteef6hMvY3FYmbJxe5VUG8MMszKn5BHp1UtTAn4+ZX8/X95RG58iXyQv/GBnlOnBTnFP8SxG3gq5NrJi36hoBDFbwwf6l4oePaEToMEJK9jkbUeaavqWrCpFZinHGShIjs3Yd1j/wTxlM7g/bqYhwfi6RT83xfyitSST7Pvw6hyICOn5uQHMU0sWRWHutCXaG5KmwaHowB+i4letwblcSY7HZy6g8pn3iTf7zOHusjOwZgsGPF9/s6M9x5xp493XzM4v8hRiSigQVqUyD6686wZkGZ0C/+mc7PAjDLq8ev9RTwXh1tag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZD5mD7noJveBOSJa70Cgmnc3ZXzWUiAmRjr7qiHi9eg=;
 b=GQ3FJB5WHDUtxWMn7m1jK7gmcgLS9oTlr39DUXmoApzldFYKXV1nyWoNrzOafmZgqubTV0En0Z9/O27KqlHhGWfBDFMdcE/LDFqev2toGTR0+ORStQ7MqzdzDxEPh4uaSTlhXd2VvR/Qt6RL7097cw9XIbJPbgwW8HqLr4MAdZs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB4638.namprd10.prod.outlook.com (2603:10b6:a03:2d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Wed, 25 Jun
 2025 08:37:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 08:37:43 +0000
Date: Wed, 25 Jun 2025 09:37:41 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
        ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
        zokeefe@google.com, shy828301@gmail.com, usamaarif642@gmail.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
Message-ID: <decbae07-0c84-4379-9f9d-6e2bd6dbad6e@lucifer.local>
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <f1782ae5-c1d6-4f46-a676-666505990f4d@lucifer.local>
 <008ec97f-3b33-4b47-a112-9cef8c1d7f58@redhat.com>
 <01d679f2-fd64-472c-b9dc-ebe87268ce82@lucifer.local>
 <a16071e5-ae97-4e1a-9df8-f353f6b319c7@lucifer.local>
 <23b8ad10-cd1f-45df-a25c-78d01c8af44f@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23b8ad10-cd1f-45df-a25c-78d01c8af44f@redhat.com>
X-ClientProxiedBy: LO6P123CA0058.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB4638:EE_
X-MS-Office365-Filtering-Correlation-Id: 89360f2d-c45a-4302-98d7-08ddb3c38df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pTWVz6cByLXEFf7L1CnabTpKyAg4hUCRCp9PByXU1acMDNkufAmbOgaSpNNR?=
 =?us-ascii?Q?RDw3m5EIOzdMal4mJG8+e0t6eZ6Pkfw5WMAShHKtPAIUNudFIO2R7Bz3FjtF?=
 =?us-ascii?Q?czGWl6KAc7r5LxXkZe1QKEaewe3aaCWPtSZk1vqm018qYfkpOqbPd7uoH9iB?=
 =?us-ascii?Q?WwpwMXk9RmJR2xeSU30nbNdNV6VeMcoetAy0aIkCk0skLuS57rEhVEkh6p5i?=
 =?us-ascii?Q?7culpkCRCAovrjczTa1MBJhUoKouUVZI6XQrQjSi8YmESX9ISww3IDI7ZSSi?=
 =?us-ascii?Q?Ff31reiABKCP84S6FSH2bdye47v5tOz4inldOPgnijbK6oKSs1cG9XCEBQli?=
 =?us-ascii?Q?6ndw7v0wCmMvY3wAi15wzv3m6CAxjezawvcrPMugtLHMCDqmC5JE1dLKj5/e?=
 =?us-ascii?Q?K0lVGDDXlRxgM+7AFlIdMYEnubrYIDKzA8jT3hGTw9IU4l7TAO7ruijcuIvP?=
 =?us-ascii?Q?yzQv7Rz7FZQlb0Q7v2wPQdEuV2YGkOBQaI7YNc1OjSXZbUv5X1WT44JiVbR9?=
 =?us-ascii?Q?E2Q7NZNBqLm621SZ7NWbcyNljm+vVSguZgjWBqOgM1D0yMHU0VEm1GQMjoAF?=
 =?us-ascii?Q?Qul3HAzTm2e1GM6Uw4AekNFmrC3vfOp3GocrhI+Sd+2SYnOjXdFs+ocx6tzm?=
 =?us-ascii?Q?PyNyA5W4C1zAFXIpHcDlOv5+u7bAyk9N9LdbNwbyNaxKBgUJtXQFgP7PpzZ0?=
 =?us-ascii?Q?yKIKcU/lgK8lR+3UCHs86OmObgHu+gMafaJL5+i72tzqo1R2/ZGqiToflJN5?=
 =?us-ascii?Q?6SlQ5EouaaqDKpbQe/6FfBYNa89va5ERQi9/UeTXft+fDkiYGrR3NRrPwXdr?=
 =?us-ascii?Q?DIbYr2InF2jJY4MCOfzc/CSPml5M3OScijsp2xIhlmZvY90JiIcM2ikHfIEL?=
 =?us-ascii?Q?S5liz+iO/Psh+4rB9+ItQTwjSpoHpdKE3c5RUTK6hhlJrCSbXSpXB8OymIpC?=
 =?us-ascii?Q?xJHKAfcHKKSw/tWNRRdGlnTLNisH9SE4c61N0330AZxmJ0+Z4z+WNMaRx+fW?=
 =?us-ascii?Q?QHftBljImDSfZ2JP4pNhZKYJpWMOR7uOGhkkakytkXIuJxN6C/pOCxp+/7M9?=
 =?us-ascii?Q?3M8MXGpbRnc18DMQ9NlYUu82q5Q5cNNb1EczfU2asMeHSktFLG14enouq1YG?=
 =?us-ascii?Q?xUvOU5S4u9m9kcvu/5pT6kkEEvv9hUGs4iIgAPzUOLPi7CWGy5v88bIAhKGP?=
 =?us-ascii?Q?INqWZ9syYnEQNNVCxldQQYI2uYmxH6hFP1HECfVxoewC59NGxlEAKmbKVrqJ?=
 =?us-ascii?Q?3NhjBay6Yb5Qy48Olca8XP8j3DMih1wFaVTXy6IivWrChxl/P2imUdXxnCkw?=
 =?us-ascii?Q?i7KlLFq1alAQDQz3HrsJQiZRNCfdiQ5IC7C6oAmZXSaaM/FwMpEX2F/r489W?=
 =?us-ascii?Q?/RJjoFqnbYOv6txlDMjLGfYrUvYaKkMHUjCB0aeJ1KXc7yWGUC5dY66Bfu5z?=
 =?us-ascii?Q?lqfras9Cs5I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BQDEzK7UZBEJ+9D8iUiR2Q4TcSrCvzpP+JpEMizKBu2O+/aUT9cxhb2DYRyK?=
 =?us-ascii?Q?v8fQtTLPtlm6k2+vZ7Lq2qmM5kQQ7uJoVubLLNPD0deL6Npj9fujYzev5ihI?=
 =?us-ascii?Q?GwYNmidAIPOMUSH6GEG8LuEI4ZDpjBc5Ed5E8Y1FqHuKCOBeTqD9q+ftgeqq?=
 =?us-ascii?Q?sAJ4lGakJfSYcWWSq+qQqFXknbH4ulgkNxy0Rjqm/jBjdxnbhSMHiXg4QDGa?=
 =?us-ascii?Q?bkoDSZjRJPEO9vfIl39XeeEE7E1jxiLHfMPhNqXw0rmQcwx7oED6LvDO8xlP?=
 =?us-ascii?Q?kxAHjcUo88aT+wphrnp4+8PdzTrlbm5DO7OixFUwcdRmFuv5NGbg6Br8XZkf?=
 =?us-ascii?Q?GuZA1UPAHv87C35NR9uVoEOcvU/Xl3f+9mGfWfF6zp88BDXsM2HXfNnIs3MB?=
 =?us-ascii?Q?c9YQZWWSVuSRvMxsiX49V3tecyTRAm1vNJLBrbNoyQ1qvdO5hy6a8xR8fWrB?=
 =?us-ascii?Q?UUr78NRQrCAOV3bo5b4p8omHUYpfZuV7IihgrLVr2Y3stF4NvoTLvYhJatJ3?=
 =?us-ascii?Q?4XFhoySWX1YXu6uV8TGkJilu6ZBhpRt+nEqtOaBcAzJGAM2/NjI9ztNBlpz5?=
 =?us-ascii?Q?CztbZrbX39qe/bcaUyLRjsDkyI/E4mLFe++/lH80VKHPQMs6PPcCBksB/9PE?=
 =?us-ascii?Q?60+aCuxVqVYX81Ga04rCtdtBhJcZUbEyGN8edMCyUmerhzCZoRjS/HM9CUwV?=
 =?us-ascii?Q?YFpEgcBxxLJE8Q66Fk8uBpvQPWxpdAT1j/W7QhkNmzZ+cJekwn4WbobzMpYr?=
 =?us-ascii?Q?h0YNskQdAbxiy8McvHUxeHlWXiqNLXyksxKo7l18s4So3EJw1si1n4mQ0kpr?=
 =?us-ascii?Q?ju8POc6y3U7xzCIHNadpUOCOispxah/iv6IifnkqU+Ahd0Dvn/RzeKs8543w?=
 =?us-ascii?Q?Q/VMl7JqJ+3G1+2TwzTvBuaEhcNVshnlpkpwTR6FMiHuYUCozDn5guB99rAu?=
 =?us-ascii?Q?IpsKHZK0Nirqt1b286HUJQ9qBcz1GhK/AaIMIe0jJeJudOIV3t7C52BZwjsQ?=
 =?us-ascii?Q?Kra+QWu2Yk0DaLIFLHM9F6N9rONMy9Hkpg6oduVOB0YGOCISQUp1iM9z5sgW?=
 =?us-ascii?Q?fQC1oKNAXpVsghxXWgzhA/n42qk3OtohRwWwMruXtuGzfRbq2eiA/IKDepn2?=
 =?us-ascii?Q?z0X7vJrVbzHBablKUtr2VZyRad+kKdh6atioxuYn1ylMQ0dHiQrhBPZ8VP5k?=
 =?us-ascii?Q?viCbb+SJts0Yl/me4DZzVXkP++s0ZgqGAD07v4Pl49teVbaY73t9iR4vcgaj?=
 =?us-ascii?Q?t5u1f3OAxoYvVQnm1vJKwRHVYgKmAM0uN/73dQOv/avtf7WG42TkU0MS4dCQ?=
 =?us-ascii?Q?jvX6t+cmIC2TOhCp2OI8ovGy53BEAe1pMsmP2KPxVLx3xGGBRjH3KoWAIPa8?=
 =?us-ascii?Q?4vb7SOQ33XyS4r+ld8WeZ5SbtYVbTcs0Wji+ydzFjmhHqP8fZcJmFrtn8SVg?=
 =?us-ascii?Q?L0HGA0qxOStnvgrKRQ6cBcrvg869NvzYXOrOSaaIoTYJD05ChTmFy//JSnOi?=
 =?us-ascii?Q?n1Y04ZZjqkNDL7GaLGTQit9BB47ky7Gbd7Qggk16IFhX76Cnthq3w+GYjh4o?=
 =?us-ascii?Q?98nWxRSEIFSJdroMfFufWPadUihAbPM+IlNwkWARGBPcH9yu4Ja1izl1UQ9F?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	P93kamFhFxGbzvINf0gmMLak0hXuUMZQPKQGYddLBxxdIWZigAdkZLLGgXeY4X6WLU3exOqKD+9CTU3Ox0eBE7uIRWcYltm5bleKMMwFbBIWfkKGbD4iY1QmOF/AA11tS7T3qmn4F2RgsqPAPA4iqDXjnBxIRnC9vXIjCLYrMWy+pFnnJubnFcuOHKzqw22wwDvZDnEdtJA6ru/BTZZCwmJQ17tQiEzQo8A/WgX58zc69XfhSoMclBHxc1Yw/VlJuZ94z3T6a0hrA2rtKepHpkWwD523zgw5Oyd9s4mfGg/BHrvoixYApZYezz/iqpl6E2giMBR0mGNLutaGV49RweEipBZq2ZWvofnulqM427ZyhRdiksaP9VXg9ryLkyrV4eFU9hwd06pNnRR3AWa+Ddtj82lJWqs2RpgLXuChEsaL5JkQg797SlJxVvX7vlAs7uZQhIrouua6XP0583GnDwx4PYGw7cvK9f31VWPUq10PplnC3yXbNtFDn/dP6dhWlCCVR4xrzTfidYpQ4/ZAkaLm9sOsDa6fsCPxPr4iEapBrbCNXetRzQQ67H24j1RFx1D1/f/usR3A/CwMduP9o15GeTgL/Tiv7iX/Sn/gbQY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89360f2d-c45a-4302-98d7-08ddb3c38df3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 08:37:43.8740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZDkygeUM9i61NdfsMSB9r6zykv5JugCdQJ2WtWbzd+TqaC3xAeFdpOq6yxOumtcIGV8ORAOTnd3ZNX3t0P43YoA4Gi9TG0pPgJ6MFhhHNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4638
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250063
X-Proofpoint-GUID: u0HuPLJOwk8shONMIiABm2Sve7mk7KHV
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=685bb55b cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=SRyWv8gS9IM5ZP0jeyoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: u0HuPLJOwk8shONMIiABm2Sve7mk7KHV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA2MyBTYWx0ZWRfX92qmdQJAznT3 4wvY94mLuEPfIwDAdtvCuODUDKWAlDt30ITZ5bKch0aRmKAoeq6ok1vuwvLnrAoAU3LWfJ08Qy2 wn/pvO5nZ6KO7VS05Q3udH8NnzDK2w5uvnmbOSEqO27klSsWvH0b2BBcEYsSbGJOT/5u3pixjVF
 wU1ZS9c+VAKmFaA9yp3KxI2QrknBCYI6QxvRrWkBE6luP+Rx8Xsf+nGWToAKTmtaTOTunM6bb34 QOor1aGECtNTNqANLksQFP4jGz6IAfTNU61O1MlPVSW8NwrHD+h/n4we1husS87/R7VwV1zBPBa ha6eSJlRSeOdh4mmvJ8xhgp7aKejf48HrleG/h5kNAj/cspzfaq7l3zMZpKBGnyu6aU2bcwxr4B
 YFTn3Ic7wIr1PN8M9VrtSfT11Z8le61yj6zQb8slSgUqIJ3nMkDi0YwGQCTjhOyOFnEAUzcD

On Wed, Jun 25, 2025 at 10:24:53AM +0200, David Hildenbrand wrote:
> On 25.06.25 10:12, Lorenzo Stoakes wrote:
> > On Wed, Jun 25, 2025 at 08:55:28AM +0100, Lorenzo Stoakes wrote:
> > > I suppose the least awful way of addressing Baolin's concerns re: mTHP
> > > while simultaneosly keeping existing semantics is:
> > >
> > > 1. Introduce deny to mean what never should have meant.
> >
> > To fix Baolin's issue btw we'd have to add 'deny' to both 'global' settings
> > _and_ each page size setting.
> >
> > Because otherwise we'd end up in a weird case where say:
> >
> > global 'deny'
> >
> >   2 MiB 'never'
> > 64 KiB 'inherit'
> >
> > And err... get 2 MiB THP pages from MADV_COLLAPSE :)
> >
> > Or:
> >
> > global 'deny'
> >
> >   2 MiB 'never'
> > 64 KiB 'always'
> >
> > Or:
> >
> > global 'never'
> >
> >   2 MiB 'never'
> > 64 KiB 'always'
> >
> > Or:
> >
> > global 'never'
> >
> >   2 MiB 'madvise'
> > 64 KiB 'always'
> >
> > All doing the same. Not very clear is it?
> >
> > We have sowed the seeds of something terrible here, truly.
>
> Fully agreed. "Deny" is nasty. Maybe if we really need a way to disable
> "madv_collapse", it should be done differently, not using this toggle here.

Yeah maybe the best way is to just have another tunable for this?

/sys/kernel/mm/transparent_hugepage/disable_collapse perhaps?

What do you think Hugh, Baolin?

>
> Regarding MADV_COLLAPSE, I strongly assume that we should not change it to
> collapse smaller mTHPs as part of the khugepaged mTHP work. For now, it will
> simply always collapse to PMD THPs.

Yeah thinking about it maybe this is the best way. And we can then update
the man page to make this ABUNDANTLY clear (am happy to do this).

This keeps things simple.

(One side note on PMD-sized MADV_COLLAPSE - this is basically completely
useless for 64 KB page size arm64 systems where PMD's are 512 MB :)

Thoughts Baolin?

>
> Once we want to support other sizes, likely MADV_COLLAPSE users want to have
> better control over which size to use, at which point it all gets nasty.

madvise2() this time with extra parameters? ;)

I sort of wish we had added a flags parameter there.

But lacking a time machine... :)

>
> --
> Cheers,
>
> David / dhildenb
>

To summarise:

Drop series:

* Might degrade performance for very specific users using
  never/MADV_COLLAPSE (quite possibly via process_madvise() + a remote
  process).

* Matches 'de jure' interpretation of documentation.

Keep series:

* Provides no means whatsoever to have a 'manual only' collapse mode,
  though does provide for manual khugepaged THP.

* MADV_COLLAPSE automatically gets mTHP support based on obeying 'never'.

* Matches likely 'de facto' understanding system admins have about THP
  usage.

Action items:

* Either way, I (Lorenzo) will improve documentation.

* If we drop the series, provide another means to disable
  MADV_COLLAPSE. But not using existing sysfs toggles, something new. We
  will document MADV_COLLAPSE as PMD only.

* If we drop the series, also consider how we might provide mTHP-compatible
  MADV_COLLAPSE.

* Totally and completely refactor the hell out of the THP implementation
  from top-to-bottom (over time this is becoming more and more of a me
  thing... as I'm getting ever more frustrated with the implementation ;)

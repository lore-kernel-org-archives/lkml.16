Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A7A17BA1;
	Sat,  7 Jun 2025 08:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749284355; cv=fail; b=qnn0TJttaGivcDAMOAq6tWzdZYzUZz8zGA3aFHdCQARqAo0VOerYtOIrqY3JSBwmp0t6RKG7GiZA67O/4Unq4J0L90iT4+jb5ZALD+kyMC36S6RmpCseXd9a1zb4R/GKt3hTKy7FWIT9hsqhdNmWHk1ddMZgx+jUgcdDoJcyGxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749284355; c=relaxed/simple;
	bh=t2iA1jfve6MneL0pRt/OMUdMc6VivNo+XEoSOPO4/ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UniJl1itvZr3xMJQ8rwe6xxWbH33vv/Ej9GUya3EIzp3CTylJRg9zTfX01T01sDSdS3RrbAHF2/vd37lMHMy9mx+Y0jrlKaaSSfl/w09GK7TGenwkPZPMAdrLBSCJphx+bwIXdhbNmFp8PckJoTr10F5RSgUZaoTsqCxbWztbDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OWteRkto; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BqMI7bsZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OWteRkto";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BqMI7bsZ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5576nwOl024809;
	Sat, 7 Jun 2025 08:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=E/UUQEq6US9kBKzEUD
	RKdGoWCPliL8OzmVOXiurqiH4=; b=OWteRktoS12agT6pKLt97syS+KYTUUAW01
	tJXpY13YK/2hMCnzcmbyTeQ1X+MkXOwTGpgO7EARIWTXmlf+67Fjte7nihir/IbX
	aVbFPDj402FyiJJhgoHnew626HFIf94uNKNQcJgk5tCKiYucdInhkNC+W+CSHIpP
	gFd0619Smq3V1iG5hrZMKrIg79MZJ90HiVJR5iP0w4zTfLsS5KnZicx/mS4jC5tj
	SEXZApxMAwfdnDo1NiSVfDefex7Fp7VcpKGGsnWRH56LocM0lVuEIOD00/knt5Vf
	W+QLSOGg8O2cir1Q9+94E7PpI9poytx2xVhekW8JpOvAy45Jnspg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dfe83x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 08:18:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55766fVU011966;
	Sat, 7 Jun 2025 08:18:21 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2087.outbound.protection.outlook.com [40.107.102.87])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv6wpmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 08:18:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciGZtNElYAzPBH6JdtG3r2ZZ4m7eITtRL2FAZYzqVYkJrqN2sgbHdSYXyTVQm+wUBoRtlHmKIv9i81NnT5+Qx1033TGon9aqq25EXVrS2SbnbRZ3bSRt+uc4GYZA7OxC/oF6KQ2xGHxoZ+dvVdDeyPtgyStAqRR+6+KhBt2ScXurkY8QDKP7FWSFyU1J/gpPU4orNxT7pQUKSpbM4vSeTT/3AVzJE/BdeydFeCjH9ckyG4zyw9eBskFralNvklOA50YR1hZ8IJRuSk5sUbidtjhxP8YoNhGNZ7ax/kwjful5A5wVu9QG+1PRn2X3g9oKikvwjCvHQuSVfgSXVjbAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/UUQEq6US9kBKzEUDRKdGoWCPliL8OzmVOXiurqiH4=;
 b=UNAlfm+MIVSiMBlKNRlwqim9ntJsjgHpfCum7/8Z9xeaAQq+KpCbkHVrcPjRVnE/5K/cfAkf2OCJwiikGdWRAt9cTsP58BlA8oEp3gp6xADKFHyPV1NZXIixqzQdfh9kEjcNU68typOijyu/BnLozz4cpcL3mxuPeR/tbyl3hiG8R40xUu/xLcWqOjju4zslpirOIrXGuBDt9nEp8EyqPj4hVhh5Oi715VgESC4jaak5ZknUJPLY8NVKk/Zdtt0qOcC2TSXxnVPgMWobBeOqKFfrs1Us1kuiidWO3in1AA+vqN4KmqQmJDJeeswwQkslsdUQi0Q3ce3XgqfdCP44Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/UUQEq6US9kBKzEUDRKdGoWCPliL8OzmVOXiurqiH4=;
 b=BqMI7bsZmnxYikZr8+77Uw6pQ6FpG7IE97nIUHSsg7Z8v7LvAmu51kiQxPapM8KjtgVRDAQNEB5FKqbqfJBaACWMWzQ2KS7qKzSuxJ+SlN6qZGcEAKAbwhlteiVP2+R2g3kQd39UKUy08eG570Az+Srsl7aYPsLu1moc9026tCk=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by BY5PR10MB4147.namprd10.prod.outlook.com (2603:10b6:a03:20e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.39; Sat, 7 Jun
 2025 08:18:17 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.018; Sat, 7 Jun 2025
 08:18:17 +0000
Date: Sat, 7 Jun 2025 09:18:13 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
        linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
        riel@surriel.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        dev.jain@arm.com, hughd@google.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Message-ID: <063273aa-a852-492a-93da-ba5229f544ca@lucifer.local>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606143700.3256414-1-usamaarif642@gmail.com>
X-ClientProxiedBy: LO4P123CA0249.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|BY5PR10MB4147:EE_
X-MS-Office365-Filtering-Correlation-Id: 98625e20-9faa-497e-de49-08dda59bda27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?agpSCVCF+FFSApms1Z4A9X/3KqTTdSXVI6Y7IxoBYcCfA0jQ5m1VjRz0xyjm?=
 =?us-ascii?Q?V4EzmgD8HKmC+LlDbtQ60ONgTJcO/ZvwWSrDBodhMrJiBg6N80d9wGjGHTzt?=
 =?us-ascii?Q?MEjSD/+dNnR3sMLWLSV1W+2cvtbTBSac6M74MquiwGdJ0H8LriGclbJh62+8?=
 =?us-ascii?Q?JsgM4uE9PthreavPysLq2w+jIogP1zdPdIC4KbME97Y5pPzsDil0xSgxB62C?=
 =?us-ascii?Q?w1SAUwChsbbrQ6fUsv+in/sB55wfgcvmUeNdmjODQ+fuZ4QKjnzzmdtBTDm5?=
 =?us-ascii?Q?P0Yj8c3NTa4GIrUVqBN/5HWESuxCiJGyGw4icChSfipwi69z79dL0Ctc/M8v?=
 =?us-ascii?Q?NEqA5gZIsHCrr2lvPzDbkNYztLGB87G4CuIZ1Wmomhk8IhoJJF73IR1+KL/7?=
 =?us-ascii?Q?fY4xXZwVS5RgEw9imB/Lkkkd7AefU3lHcfxoKg4ZN62Me03UbOQULdzQvG8Q?=
 =?us-ascii?Q?HumdchnyxxJZHi1P0W0PJCgYoE8KPieRY9QtTzw3S8YL3huXzEf67JYqQbHk?=
 =?us-ascii?Q?jwC/sWopmMijUwwEkkZ/BzUhyBztukqfs8woPHHvtO0zi8DtAQLb7vgZWOOF?=
 =?us-ascii?Q?Zi2GhPjcmNBkeOHBL56QHBU2Ewz3wQ6upB736K+JiP8ScBztFKmIRPGKz99D?=
 =?us-ascii?Q?5Y80M1ZrdPp4BFMLB1MbTrUqsvF58LbIpFqA/AE11RUQzIUsuQ9LinBIWFDO?=
 =?us-ascii?Q?/187xgEGIXPl/5ea0Idp5VsRO0/NEtBGIWriAep5PRCEUZ/zhZrCPJ+QoOwq?=
 =?us-ascii?Q?u8QHiMWmoopUwUrwZMQH9ofobP73H4RF+9xJy/DyiZMKinx+O7NkwrvZhNsS?=
 =?us-ascii?Q?qw4VMmKBPxPE9vtphhVr3IQ1rcSztzzYYkKqSH0/1xqkhOYqYCNFFrxi65gZ?=
 =?us-ascii?Q?B28Gyz0JxT/CFA7YsopwAlrbUwlsbaZA0atoQqBVGosXq+8emnhu4g21+L6u?=
 =?us-ascii?Q?yP43Rkphv2htPSJ9GokNxX5YG3F7NhjQY9X5kUtQFR/rXX2BvmZxZwkIIwji?=
 =?us-ascii?Q?ETpV8LbG8f/oSsfuGeBmQJTFHl4oumFsm/iDMdDVJu3JQGe2bedtMxeNu0Jy?=
 =?us-ascii?Q?+ovLXCZfxg6Y18a0qLoUq0Ba2eCAwe7O11PvF42+drMdHwecx8R8wrHyZEMS?=
 =?us-ascii?Q?CzhShCPsHjHNbyRS5v0NEYu1fneIlzvoG+wiYCOkV0ImZg+2Ymjgrf/GDMNm?=
 =?us-ascii?Q?kk3/J+ScVlYfRsEk2rpAqsQYwNEHMbPNt5B8XVlobI4yFbG93/ohEW5vztkx?=
 =?us-ascii?Q?zYZ+9wi6fB8VJibxvLZW94AP7hEVHI3BNFQRBVe0ACyjgOFq9mw6hSPdgja5?=
 =?us-ascii?Q?dXTZks4LgUhHvnscdDdMf1OsnS+Yh4CYCfYRHrj56CYJ4GMSCBIpLNipvqj8?=
 =?us-ascii?Q?wKRIcYCuDQ2VYFPBz0e2dtEXIB81+a3Vii4SWHnesaC7LnQGgIpF31Gll5BS?=
 =?us-ascii?Q?FaJ4KM1U82Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gb84xp6oBq1kJiL9r0L2R9Yk47JnNNElQ90BRhX/SBmVpT3yodcaEgBYE8kH?=
 =?us-ascii?Q?Hm2/zmwXz2b7aiaITlacxeQQ+W4Dw74fb8M7TEyQMrR6oDppJI8FJWUwHtEe?=
 =?us-ascii?Q?sjlBjGuYFYLxysQ3LTj/I/UVMTK11k47K+6alsLFEyb42oRpz9I2AJWKf+Sp?=
 =?us-ascii?Q?Z9Isuz/6+ZdUNO+2/hr+WImoNz4oOgqrI/EU++2KX+dhqDo+uQzsTECD/V+A?=
 =?us-ascii?Q?aFLzXCx97TM+I4/ckHuiUT7NdGC0raFfuaeDY6J24qngFxNlerk4J5Ozbp0A?=
 =?us-ascii?Q?DnRNj4RoL071P8MXi3yoItOsLBV7ebvlCIn+dBAsUR6h85KBatcNaI9iX1zr?=
 =?us-ascii?Q?5Z3I0z8reDK2k6J/S+icQovSvsAM1nUltZaln9eV5pP69garpKPmfEdVGo0B?=
 =?us-ascii?Q?yexMid6Cp1U6KYfVlmCxVt6DwuHEiDSaRKoORtCU3+gpyrq+q5ho3u3sHbM+?=
 =?us-ascii?Q?GpvuNAgkESZXmRJPJ67NpnkjuNzazEg4sYM90DyrGkBMWIsGGCWBszhdSnBO?=
 =?us-ascii?Q?/xO3WxZudtfm/BpoKbQm976yVyiXK0Il0w5MJxYZjUsTEoRTLXxIS0UJTTtS?=
 =?us-ascii?Q?f6mDAzRMZWTaF/LbFgchJ5LMKkxmt65PeR4Imy0okTDYdm9gaB4iP7uvoPN8?=
 =?us-ascii?Q?48+LM9C8ZbnHmmD3X/43GD5tAvihvJiilr4FZTaPJkQEBNXIb9JRbIVcyuy5?=
 =?us-ascii?Q?tEYnajg+fidBMwU1CeXOs/HlZ6oD6BScC51rUy63MOwgI3/ayV1ua2IwOBFi?=
 =?us-ascii?Q?LBrVOWiMVZIeyiBXoJ3WHtwtdr0sZ76y7B/zfaOb8BDt+hQz6JV53qrP91Hp?=
 =?us-ascii?Q?znHC30C5qEDNkf3+f1jeHpCx6NRUyXLqVoZcloGbllvslytxrLq9oULJQ5mK?=
 =?us-ascii?Q?RveufsaMkTawlSksX4b4bRtdwoCXRY0zq6GYVwpddhF3jrBBbbEN1u8AxlCh?=
 =?us-ascii?Q?NDHAPMjQYsfi50+VayvEOOqXA2N5ge7TycJwkmHWOEQwVFJ2pxHVMjRNoFJq?=
 =?us-ascii?Q?Qy6vTQphrn1ZTv+XKh1uHCo/sAzikZaxx0cK7mvWFvvgaBJmKrcfeoHoIEnU?=
 =?us-ascii?Q?1cAlNmpo/VlIRCTQKCfIP8CADr977JA5w5Sm9dSPOZhcV1Ata/LGkFpVOS6P?=
 =?us-ascii?Q?mjRZ15Hi8tTh+JDUuSCB8XUcOGIoxklZOoFD8r8PRDB259Rpho97473CFeF9?=
 =?us-ascii?Q?aMZfF0oXqnDWZ6bTIE0FR8EmbiRLIkujMqKlsP07vB+puhrdDWGpQo0zQy1/?=
 =?us-ascii?Q?J+27yYrOzJ5g5uWZex9S/jvR3Of5DGSuB9Di0N6+J5zHujV+f6V0FUeyLj+t?=
 =?us-ascii?Q?g7oDg/VAP9MucUmQL+ottP/HoOkajN57aCf9EMq5rzNRUo7uu8kfst2PaBXE?=
 =?us-ascii?Q?cSSn79vH+R9sXfwyo4BWySROB8dlmvK+fiiv5KCBV2WH4AnKBuPvqgXGCfNf?=
 =?us-ascii?Q?tnwYeLFLbZGULsjugPmvPAwnMcSKu18+V5sxedt7eRyRPhK2YF2JxqQvpNRi?=
 =?us-ascii?Q?2HeJOnkmFMRQrKrHufxNoUZh7XCbR42cbJGJo+jhORXjiOeip9JwIOHlvsx8?=
 =?us-ascii?Q?r0R6On2GSsYuXy5DujRpCVAaBYfCMV/pwoRv76Wo+VeRAqPbjXQWoZ4ae2n8?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yGGxfZlaRdfHUlz6Zq1hMMaJCYDAA4IX2s5pLAOYPvK0eaIKT7Ya26tY32lT0JP/+O71L2Fva4r2oIliOmrLFXdiUpMXrCvF1lWJVQuFzMAb/vSBV/CQ8QKGld3QPTmEmgrN3CxUJ9+6j0j5t3WyY9AjsPRu68KxM6XRKKgX3rySx5f1VNtS+D/IWund7uHxKuWMsmHb7AEJ5hnQ69cazPsa2ZmChjNSZGX4puafigmJ2sIvX3WxICmRVuO60NUSeh6CJynWVOVtFEIDI8AAdhlBBBtmjPzxBjvlF/pPbT5n+Y8e5aSWPnbBgtUEhF1FTVBPVZcYXfOyWqqRNLuvsZe3g6VOkx67jrsiX5d7G7+MZ0snr2qUDZOZU1avYYEFo6vX42stiwhywws7VUtzp8rGwId/EaUx3sxdvIF6yFqu5OCT3vAZSyAUy5U2aMbe0zA1Qviju0wtnmPA4OE532kIcBRbD3211abrCr77nIk1vpE0wqEgLf7yr9Kdsn+K0ljZ9E3sRzDNt6Ktps6YLRzpPVqayOm+ly4yLlRcb6C1y/sTxG4gHzjJCOlxQQpktxbKOcBitF0qveCNQBuhmPULMYxzl6kEq6Ii1GyhBf4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98625e20-9faa-497e-de49-08dda59bda27
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 08:18:17.5162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5NSA8Oh07V0SUrTDpuLaWgzP3qbphnMVUmhldCbkh+ZdrqUurJuOR+lsQXH1ULztetlX3a46CMriUTR/Ur3zdP3++g3bQ7oNTAU47XmM2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4147
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070059
X-Proofpoint-ORIG-GUID: vUOsAiDOAlT04YRPf8kELOLtKYiM30n2
X-Proofpoint-GUID: vUOsAiDOAlT04YRPf8kELOLtKYiM30n2
X-Authority-Analysis: v=2.4 cv=MMhgmNZl c=1 sm=1 tr=0 ts=6843f5ce b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=pGLkceISAAAA:8 a=bvqPwbmyMqAi63Tnno4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA1OSBTYWx0ZWRfX/HLU4mJnqkvd OtrrobT9LUHM5rvJU3KNZtCdATy9l0+ZG76YYYM5pDc9OwiQ4ztmwPbHe+NfFNbyYRZLNbYX7li 5nr4THbT01fIwq1Nlm7dBTOqplY6liwz7qAOhUXg8lV0Pu0z/ARNevFC3kSHN7TmfxECQGLTidD
 Iti5YbLe50TLL+E+tKldk5FUrUIR2JFasp+Va3fFz0NL9PbZP0AB/eROBnUkobgZJJ+IBQVm+G7 VEbU8IAPwXEgN0phVuvZvx18CpzqnQh6TwxLDRGkRDWSvImp4Y+/bPtrfnlyeqGtBnmmPN7Tr3G 4y73+XYIOp9Bs2zpOZkkHWKMleMZ023BJ/OQQ4bUQGp5XlC1ipKjWdzT/fCASF59ehJI1J6ihK+
 TtXmHMsuSzWX/vyb2oT9okyqc8/Vj6sPENn4aVzf+AWRuCnPIlVGZwu3yq0wqd15C9Tmc6F0

It's important to base against mm-new for new mm stuff, PAGE_BLOCK_ORDER got
renamed to PAGE_BLOCK_MAX_ORDER in Zi's series at [0] and this doesn't compile.

Please always do a quick rebase + compile check before sending.

[0]:  https://lkml.kernel.org/r/20250604211427.1590859-1-ziy@nvidia.com

Overall this seems to me to be implemented at the wrong level of
abstraction - we implement set_recommended_min_free_kbytes() to interact
with the page block mechanism.

While the problem you describe is absolutely a problem and we need to
figure out a way to avoid reserving ridiculous amounts of memory for higher
page tables, we surely need to figure this out at a page block granularity
don't we?

On Fri, Jun 06, 2025 at 03:37:00PM +0100, Usama Arif wrote:
> On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and hence the
> watermarks are evaluated to extremely high values, for e.g. a server with
> 480G of memory, only 2M mTHP hugepage size set to madvise, with the rest
> of the sizes set to never, the min, low and high watermarks evaluate to
> 11.2G, 14G and 16.8G respectively.
> In contrast for 4K PAGE_SIZE of the same machine, with only 2M THP hugepage
> size set to madvise, the min, low and high watermarks evaluate to 86M, 566M
> and 1G respectively.
> This is because set_recommended_min_free_kbytes is designed for PMD
> hugepages (pageblock_order = min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)).

Right it is, but not this line really, the _pageblock order_ is set to be
the minimum of the huge page PMD order and PAGE_BLOCK_MAX_ORDER as it makes
sense to use page block heuristics to reduce the odds of fragmentation and
so we can grab a PMD huge page at a time.

Obviously if the user wants to set a _smaller_ page block order they can,
but if it's larger we want to heuristically avoid fragmentation of
physically contiguous huge page aligned ranges (the whole page block
mechanism).

I absolutely hate how set_recommended_min_free_kbytes() has basically
hacked in some THP considerations but otherwise invokes
calculate_min_free_kbytes()... ugh. But an existing issue.

> Such high watermark values can cause performance and latency issues in
> memory bound applications on arm servers that use 64K PAGE_SIZE, eventhough
> most of them would never actually use a 512M PMD THP.

512MB, yeah crazy. We've not thought this through, and this is a very real
issue.

Again, it strikes me that we should be changing the page block order for 64
KB arm64 rather than this calculation though.

Keep in mind pageblocks are a heuristic mechanism designed to reduce
fragmentation, the decision could be made to cap how far we're willing to
go with that...

>
> Instead of using HPAGE_PMD_ORDER for pageblock_order use the highest large
> folio order enabled in set_recommended_min_free_kbytes.
> With this patch, when only 2M THP hugepage size is set to madvise for the
> same machine with 64K page size, with the rest of the sizes set to never,
> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G
> respectively. When 512M THP hugepage size is set to madvise for the same
> machine with 64K page size, the min, low and high watermarks evaluate to
> 11.2G, 14G and 16.8G respectively, the same as without this patch.

Hmm, but what happens if a user changes this live, does this get updated?

OK I see it does via:

sysfs stuff -> enabled_store() -> start_stop_khugepaged() -> set_recommended_min_free_kbytes()

But don't we want to change this in general? Does somebody happening to
have 512MB THP at madvise or always suggest we want insane watermark
numbers?

I'm not really convinced by this 'dynamic' aspect, you're changing global
watermark numbers and reserves _massively_ based on a 'maybe' use of
something that's meant to be transparent + best-effort...

>
> An alternative solution would be to change PAGE_BLOCK_ORDER by changing
> ARCH_FORCE_MAX_ORDER to a lower value for ARM64_64K_PAGES. However, this
> is not dynamic with hugepage size, will need different kernel builds for
> different hugepage sizes and most users won't know that this needs to be
> done as it can be difficult to detmermine that the performance and latency
> issues are coming from the high watermark values.

Or, we could adjust pageblock_order accordingly in this instance no?

>
> All watermark numbers are for zones of nodes that had the highest number
> of pages, i.e. the value for min size for 4K is obtained using:
> cat /proc/zoneinfo  | grep -i min | awk '{print $2}' | sort -n  | tail -n 1 | awk '{print $1 * 4096 / 1024 / 1024}';
> and for 64K using:
> cat /proc/zoneinfo  | grep -i min | awk '{print $2}' | sort -n  | tail -n 1 | awk '{print $1 * 65536 / 1024 / 1024}';
>
> An arbirtary min of 128 pages is used for when no hugepage sizes are set
> enabled.

I don't think it's really okay to out and out add an arbitrary value like this
without explanation. This is basis for rejection of the patch already.

That seems a little low too no?

IMPORTANT: I'd really like to see some before/after numbers for 4k, 16k,
64k with THP enabled/disabled so you can prove your patch isn't
fundamentally changing these values unexpectedly for users that aren't
using crazy page sizes.

>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> ---
>  include/linux/huge_mm.h | 25 +++++++++++++++++++++++++
>  mm/khugepaged.c         | 32 ++++++++++++++++++++++++++++----
>  mm/shmem.c              | 29 +++++------------------------
>  3 files changed, 58 insertions(+), 28 deletions(-)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 2f190c90192d..fb4e51ef0acb 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -170,6 +170,25 @@ static inline void count_mthp_stat(int order, enum mthp_stat_item item)
>  }
>  #endif
>
> +/*
> + * Definitions for "huge tmpfs": tmpfs mounted with the huge= option
> + *
> + * SHMEM_HUGE_NEVER:
> + *	disables huge pages for the mount;
> + * SHMEM_HUGE_ALWAYS:
> + *	enables huge pages for the mount;
> + * SHMEM_HUGE_WITHIN_SIZE:
> + *	only allocate huge pages if the page will be fully within i_size,
> + *	also respect madvise() hints;
> + * SHMEM_HUGE_ADVISE:
> + *	only allocate huge pages if requested with madvise();
> + */
> +
> + #define SHMEM_HUGE_NEVER	0
> + #define SHMEM_HUGE_ALWAYS	1
> + #define SHMEM_HUGE_WITHIN_SIZE	2
> + #define SHMEM_HUGE_ADVISE	3
> +
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>
>  extern unsigned long transparent_hugepage_flags;
> @@ -177,6 +196,12 @@ extern unsigned long huge_anon_orders_always;
>  extern unsigned long huge_anon_orders_madvise;
>  extern unsigned long huge_anon_orders_inherit;
>
> +extern int shmem_huge __read_mostly;
> +extern unsigned long huge_shmem_orders_always;
> +extern unsigned long huge_shmem_orders_madvise;
> +extern unsigned long huge_shmem_orders_inherit;
> +extern unsigned long huge_shmem_orders_within_size;
> +

Rather than exposing all of this shmem state as globals, can we not just have
shmem provide a function that grabs this informtaion?

>  static inline bool hugepage_global_enabled(void)
>  {
>  	return transparent_hugepage_flags &
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 15203ea7d007..e64cba74eb2a 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -2607,6 +2607,26 @@ static int khugepaged(void *none)
>  	return 0;
>  }
>

> +static int thp_highest_allowable_order(void)

Thisa absolutely needs a comment.

> +{
> +	unsigned long orders = READ_ONCE(huge_anon_orders_always)
> +			       | READ_ONCE(huge_anon_orders_madvise)
> +			       | READ_ONCE(huge_shmem_orders_always)
> +			       | READ_ONCE(huge_shmem_orders_madvise)
> +			       | READ_ONCE(huge_shmem_orders_within_size);

Same comment as above, have shmem export this.

> +	if (hugepage_global_enabled())
> +		orders |= READ_ONCE(huge_anon_orders_inherit);
> +	if (shmem_huge != SHMEM_HUGE_NEVER)
> +		orders |= READ_ONCE(huge_shmem_orders_inherit);
> +
> +	return orders == 0 ? 0 : fls(orders) - 1;
> +}
> +
> +static unsigned long min_thp_pageblock_nr_pages(void)

I really really hate this name. This isn't number of pageblock pages any
more this is something else? You're not changing the page block size right?

> +{
> +	return (1UL << min(thp_highest_allowable_order(), PAGE_BLOCK_ORDER));
> +}
> +
>  static void set_recommended_min_free_kbytes(void)
>  {
>  	struct zone *zone;
> @@ -2638,12 +2658,16 @@ static void set_recommended_min_free_kbytes(void)

You provide a 'patchlet' in
https://lore.kernel.org/all/a179fd65-dc3f-4769-9916-3033497188ba@gmail.com/

That also does:

        /* Ensure 2 pageblocks are free to assist fragmentation avoidance */
-       recommended_min = pageblock_nr_pages * nr_zones * 2;
+       recommended_min = min_thp_pageblock_nr_pages() * nr_zones * 2;

So comment here - this comment is now incorrect, this isn't 2 page blocks,
it's 2 of 'sub-pageblock size as if page blocks were dynamically altered by
always/madvise THP size'.

Again, this whole thing strikes me as we're doing things at the wrong level
of abstraction.

And you're definitely now not helping avoid pageblock-sized
fragmentation. You're accepting that you need less so... why not reduce
pageblock size? :)

	/*
	 * Make sure that on average at least two pageblocks are almost free
	 * of another type, one for a migratetype to fall back to and a

^ remainder of comment

>  	 * second to avoid subsequent fallbacks of other types There are 3
>  	 * MIGRATE_TYPES we care about.
>  	 */
> -	recommended_min += pageblock_nr_pages * nr_zones *
> +	recommended_min += min_thp_pageblock_nr_pages() * nr_zones *
>  			   MIGRATE_PCPTYPES * MIGRATE_PCPTYPES;

This just seems wrong now and contradicts the comment - you're setting
minimum pages based on migrate PCP types that operate at pageblock order
but without reference to the actual number of page block pages?

So the comment is just wrong now? 'make sure there are at least two
pageblocks', well this isn't what you're doing is it? So why there are we
making reference to PCP counts etc.?

This seems like we're essentially just tuning these numbers someswhat
arbitrarily to reduce them?

>
> -	/* don't ever allow to reserve more than 5% of the lowmem */
> -	recommended_min = min(recommended_min,
> -			      (unsigned long) nr_free_buffer_pages() / 20);
> +	/*
> +	 * Don't ever allow to reserve more than 5% of the lowmem.
> +	 * Use a min of 128 pages when all THP orders are set to never.

Why? Did you just choose this number out of the blue?

Previously, on x86-64 with thp -> never on everything a pageblock order-9
wouldn't this be a much higher value?

I mean just putting '128' here is not acceptable. It needs to be justified
(even if empirically with data to back it) and defined as a named thing.


> +	 */
> +	recommended_min = clamp(recommended_min, 128,
> +				(unsigned long) nr_free_buffer_pages() / 20);
> +
>  	recommended_min <<= (PAGE_SHIFT-10);
>
>  	if (recommended_min > min_free_kbytes) {
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 0c5fb4ffa03a..8e92678d1175 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -136,10 +136,10 @@ struct shmem_options {
>  };
>
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -static unsigned long huge_shmem_orders_always __read_mostly;
> -static unsigned long huge_shmem_orders_madvise __read_mostly;
> -static unsigned long huge_shmem_orders_inherit __read_mostly;
> -static unsigned long huge_shmem_orders_within_size __read_mostly;
> +unsigned long huge_shmem_orders_always __read_mostly;
> +unsigned long huge_shmem_orders_madvise __read_mostly;
> +unsigned long huge_shmem_orders_inherit __read_mostly;
> +unsigned long huge_shmem_orders_within_size __read_mostly;

Again, we really shouldn't need to do this.

>  static bool shmem_orders_configured __initdata;
>  #endif
>
> @@ -516,25 +516,6 @@ static bool shmem_confirm_swap(struct address_space *mapping,
>  	return xa_load(&mapping->i_pages, index) == swp_to_radix_entry(swap);
>  }
>
> -/*
> - * Definitions for "huge tmpfs": tmpfs mounted with the huge= option
> - *
> - * SHMEM_HUGE_NEVER:
> - *	disables huge pages for the mount;
> - * SHMEM_HUGE_ALWAYS:
> - *	enables huge pages for the mount;
> - * SHMEM_HUGE_WITHIN_SIZE:
> - *	only allocate huge pages if the page will be fully within i_size,
> - *	also respect madvise() hints;
> - * SHMEM_HUGE_ADVISE:
> - *	only allocate huge pages if requested with madvise();
> - */
> -
> -#define SHMEM_HUGE_NEVER	0
> -#define SHMEM_HUGE_ALWAYS	1
> -#define SHMEM_HUGE_WITHIN_SIZE	2
> -#define SHMEM_HUGE_ADVISE	3
> -

Again we really shouldn't need to do this, just provide some function from
shmem that gives you what you need.

>  /*
>   * Special values.
>   * Only can be set via /sys/kernel/mm/transparent_hugepage/shmem_enabled:
> @@ -551,7 +532,7 @@ static bool shmem_confirm_swap(struct address_space *mapping,
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  /* ifdef here to avoid bloating shmem.o when not necessary */
>
> -static int shmem_huge __read_mostly = SHMEM_HUGE_NEVER;
> +int shmem_huge __read_mostly = SHMEM_HUGE_NEVER;

Same comment.

>  static int tmpfs_huge __read_mostly = SHMEM_HUGE_NEVER;
>
>  /**
> --
> 2.47.1
>

Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6521B136E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 06:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751522458; cv=fail; b=PP9K4ntZspBXBv/gNEr9mUhyYoMmchxj+rKZNTiftHqQ6lfrDEKRxLO18SdVoTq4QtL7UHllDfNZXWla2Jd1JupZ+r2hjAFxUd8byayyDu2PpYzUoIdACtQOuOKiV9qbxVxPDc+8rDkzglQFH+Vyw76HikjnohyFU5D8H0+ZdZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751522458; c=relaxed/simple;
	bh=c0tL/+NAf7LnIqscQsOY5v5qgCw0gUnWnCYEZ+uOYJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WHWEhAlQUY40mzf2QEpd+lrNYrkuygOPu6kc4SptnQzdjhaiQkVDmn9csDlBaobV42JgdipsGIlRFazZQaEtDQATp2W7iEXUmlp4a5hHaibXTbncWLUBh3cya91bBCuvIiFcamBeYfz0QSfbBBZMMWkGJzt+A4SZE9ylG03t0eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Yu1t3zEI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jGyrkbYe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Yu1t3zEI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jGyrkbYe"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562NgDAN007704;
	Thu, 3 Jul 2025 06:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=MT2NjCzSP6Bs0ZxMgo
	pd7I3zSwSj14wOyWBuUon5c/k=; b=Yu1t3zEIyBUncHceg+WsaLJQ5+aFCz5p3z
	6Ttw9ia+YqBSCWHIDRgE/b6LOGsgjUSgCekl3H+IK8ZL/PkJbZVPPrp7hLPM1ZEw
	h+mNK/tgiJbBq+t3y4TVhK4ott2higK3MWfamdHEGpZJpY5ePgonoAZnOPf36/hQ
	7WcXMngTwgAzBL/zhYKnm32PsWC+SFU0K73CSOxv0ArVGKrasELUzLAasWz0EzI7
	gDChipWc9T3eVllXTHejdVOQaOwUb91ZCll3BtoIaMcOVosEXjnYbuqLG7eYN2rF
	nvChkJB/Bk2MHY53hnOhEQvRiZVTZkN0k1mfTXQDkVZe7BWRPjMA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j704gcwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 06:00:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5633eWm2030283;
	Thu, 3 Jul 2025 06:00:43 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6uc7quw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 06:00:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3lXzI5OhSbnpc1t2ds0BrB2x7GBIObdOLWeJuW4IiJWBPPql1PMfC/CnfC11Kncvr1MrCRV0OkADfwMLasbnND4Uz7G03XuxEE8YI4dbuqTNq/IhD7f+u+xhyOxa9IygYv0Fndg334dRdvsdaT9yi6cT+OykhJxBi4eh3HFL59S46DjL43Xr9lnPWcQ82oLvGie3GIguboI9Ps0W03UZwqzWNgJxSO9v2fFQbFLJY4SCkGoRDWOaJIUq4hUVfaF8PtFQ2QLRLkwl/zMQwTYWm/OoQSAyDGwa20/ngiYGHjH4OsmZ/YZ1Gor/PGafoc+Bt3WZ2yNuKgmwkyX+hCobw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MT2NjCzSP6Bs0ZxMgopd7I3zSwSj14wOyWBuUon5c/k=;
 b=lEsMy/Hbl/URsUsiJ7OST2qY4gNzNwlm4iXt9LWBRfxqfSVbmb+wnu1pqDv2txLuAz+hf73N5wqrL+adEhyHVu1tleqqnCFS22gX5U3J8DdyFCFdyYXypqM3tP968ddqwPfYiKhcyhO/gossiTVa/DYEbyg9HLElPMXSZfXv8dHv4DPTl7BRBcTpv4RqCztQWBkSPjQ+luZ4ntw0BgRIsIkMqFMzlhiuULJak6F+uuYOAuu2GA+1LQpEnyNF81iXmchlOyTQCjAEP+sZW2Ix4fPlCzJBcTc+80n0LtRdUZoWDjZbOPtHdFmb69uncYUzm0xsDZ5UiOFVuvakdWqoqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MT2NjCzSP6Bs0ZxMgopd7I3zSwSj14wOyWBuUon5c/k=;
 b=jGyrkbYex81sowG/do0Mkrt9qjh62viPnzBtA7WrfIwT/CJmVCOkBnRIXB/c9Tr8GeOYE3d2/o09bBNrJdyKS9BNZOLovLtkg2uh9mVslzTQTK+x14UTGLBzpwtVKXJdRvM2Wy2TXPR5hQKVqujHc/DsN0vICm4lWFI2/dSiREQ=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by LV3PR10MB8180.namprd10.prod.outlook.com (2603:10b6:408:286::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 06:00:40 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 06:00:40 +0000
Date: Thu, 3 Jul 2025 02:00:37 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, richard.weiyang@gmail.com,
        maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] maple tree: Clean up mtree_range_walk()
Message-ID: <pmbppturwnp55itvjqw2xukilf4z6m2mj2fjub5tmib7uy76ia@rtvg5v4ruh2t>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, richard.weiyang@gmail.com, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250626171918.17261-1-dev.jain@arm.com>
 <3yrtyxb6mwtwrov4vngtcy34pl77easph6hueo5m3nxlqx6o5c@f4frvl5cxees>
 <58be76a0-8fc3-4d5d-959e-eabe7664e277@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58be76a0-8fc3-4d5d-959e-eabe7664e277@arm.com>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT1PR01CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::32) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|LV3PR10MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd044da-61c1-4ef8-cc70-08ddb9f6f00e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4n0aNyziDjnV7BmxFGVNe/CxNOf/q1B/R/FoCyllnqcq3cHg/FRzTYkZ3LCX?=
 =?us-ascii?Q?6zIx8QTSFkcWj3pcWAVZMZYzFn3nViQhJhyjAKxBhz1fkdIm8boPqExzU3LT?=
 =?us-ascii?Q?OxbG0RpUF+PfvjocBSPiM2s3Dalpg8ktvKwpqenVt9WroK+ASsGFZQq1TUSw?=
 =?us-ascii?Q?KxF5/se2qzlZLiMrgg/bBCIiqRqds6MOeeCGM0bHhbuO1IwJBRxBGN5dOaAH?=
 =?us-ascii?Q?CXyfaXPyrleGhwWilsXUuRl7Y6TNLNKv2RUMwwFfqdxQ2NvYXwGUqeMsK0N/?=
 =?us-ascii?Q?wLrHOkeT/JEICEceLBRZk4paka3M+QScf5OmmeHmdmZC2JgKcshUZK4Vo4le?=
 =?us-ascii?Q?fwMTTM9t0IIC2h3w+HURDW/ooB8vjtks8Nh/QpHiyWuXVng2xGkKmcq7SMT9?=
 =?us-ascii?Q?V0AlKhUrdIOdHSma8J2IDGhPrUNQOL1U2LZnNkafttjghAJ8Om6MUYGaRfFu?=
 =?us-ascii?Q?Y0g8sxnZnImCwd5NtNNehBrvTnsdMADZOd8kTAVUGOR71+1GyQ7GnxmvmTOz?=
 =?us-ascii?Q?F0cAjFkI7TpkjQenkytKlPRIZtnwlaxvoiCjdOArxUvdiZ2AktPxxzCGUBjW?=
 =?us-ascii?Q?7qdSFiBjJS5GE1ZWuIirohdFnpMa9UcKbwnu0oyKcBZGJwlW2sD2IjvITqLj?=
 =?us-ascii?Q?ot92Y6/zKyfFg4eBLK49Jv4TrBLCY08lAc8EnxOED1I1swV1lHoIOQm0Sdj8?=
 =?us-ascii?Q?lZnM/tBnFPTJQscp2Hzoi7xj7hGFKF1GnYQVNiR6m1AZAfhkqvbFtfbCtonw?=
 =?us-ascii?Q?8UUZ2GmVLvlCUkpaoH13YoiLcN99GDHTPICj5CDSihBlzhaqeQ3FpfhZ1T2r?=
 =?us-ascii?Q?DshUou/aSIGf72twJ872cuXjt2/qCPJO9UpK17fxhNDDzUUH9iN/LGbasKhw?=
 =?us-ascii?Q?/pvNKvQlCHTla/Ul/WcIOBYTbKDjd7heZmwTdVuQaxlWpb/+5/uusrwvhLvt?=
 =?us-ascii?Q?pIBwtFbg8pgiZq1loqYDsH1p32ZT+iVDTzk2gOC311AQnqTpNiaCujAWIrK/?=
 =?us-ascii?Q?MZR4S5mSgqLbATI0rOdXMmCuxE9QQGJbtvbfPNpXpt/lJaWrv5PiALoyKHlY?=
 =?us-ascii?Q?z/MSD7gIEOEumHnWZIctPC6wLskq/lVItJCyi9nNnLzsXXurexI0DWzgoEBM?=
 =?us-ascii?Q?xXTgJNlUTtn0emj/Nn6UhD+JHqi+gPOPT1HEy6sNzt4YqZDIRlN8OeZc6Vom?=
 =?us-ascii?Q?JRgqXwD/zaVqs5GC5oPcVFUBYl7+fnG2zuvuQ4Jnc7IibxoOQA30Thjbu9V8?=
 =?us-ascii?Q?uuV8FEUpmMXCMYXkSE90zIA4WUODa7dlPigCdaRxuJ8F2Z0TbVpZ+JitEpza?=
 =?us-ascii?Q?3lWKVCxkYwJ/m40l4H04iqFZAxI8wHDOScWQL4CF+mjFxBQafZv6URJObfl2?=
 =?us-ascii?Q?Ggee1/d1ZdV5KOiG1goZYaP1g+Pv9K0O2SZPytuK+aElYQusVxkNsp6gVdxZ?=
 =?us-ascii?Q?oidVZbGcxws=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FEmALGbwdiOyMmJhFEsB6tKg7XxQW3ZRXZusx3BFNbmigcwvCE7BP/swnagc?=
 =?us-ascii?Q?swXZ0Etk6zopHa2kc/ol34qENEEMdLsAgZuSGGBAvc/1aZ/xT+cTJNTgdnFh?=
 =?us-ascii?Q?31LCEXGbHzVzIBic05Rc/LXcg4BTaF/WTz/dnd7ivtx4S9ATtV+VisHHAFhP?=
 =?us-ascii?Q?Nh1qZRVY0uK2wLKb1EBcjLqAxCk2LT9NQFJTfOq3p2ryXOJ5KH3WhcIg1b5+?=
 =?us-ascii?Q?xmE5qZ9rGiPpchi7TbTdGyxZ8xSvReGnq5dPeBvN6se/kaLY3m8SuoM0PDi2?=
 =?us-ascii?Q?hTeY/Be3fQ07E+z/cZp4MSKWsqfU4MZiprBD2A8YcU07Eb+tqUk2uMTYr6KG?=
 =?us-ascii?Q?mWVMi1Rz6igYx2Xvjlp/G/zzsdREdwwB0o3Wd6JYk3mnjOkHkS1PVjRMaYJj?=
 =?us-ascii?Q?mv6eIYoULh6z4swoJ4EQS0QOG2wkgX4cbhgCbHxnju+Gan+6ToUDsbvQHErN?=
 =?us-ascii?Q?sl+kSRiElBUUwphTAUBn/oMv4xPx7zeDOb+5j7PdCfwfXGpmAis9QJPihwYd?=
 =?us-ascii?Q?T7CnMFReRmWoQPplj4eNRjVm7CAZk5ZxI+vtvV+x6xPU5zFCt07g534zeTv/?=
 =?us-ascii?Q?CqbpnPtT4LdIMiD7916yQJYEPmmpX956biHXOCh/zmLY/Pdiyuf8gULZHWUz?=
 =?us-ascii?Q?6zbzD5Jh73TVf8tZYvUNXc1OSymtqrbjwWN9zHrMA4sTdr6rbyYi2FkQvCk+?=
 =?us-ascii?Q?WiwJ2ybz8fXM73xoqfr3PgKpWa9JGf/jB8M5nAwTTGhwLUbQMJEVGTckxoYX?=
 =?us-ascii?Q?k41uNSDaIYFz7tzbLdMgubD/9PO+z4oL9PriNUIaBuvsHaKAsJlBrzPRXR9J?=
 =?us-ascii?Q?EtOjm80mS6fC4J2OH2bfSHLLnDpzPAJNhmjQBNEI34gl4DVi2vXldCwmEPk/?=
 =?us-ascii?Q?hGQj5TOnTO9X28Opj2UAMFrdgxgTc4aRxLgVOvR7TcpaUppUM/lBeC1D391/?=
 =?us-ascii?Q?A1UFCpCCF7H7lzUZQlSEZ5eUrTPf8H1CjObSPs3EsC7rM5mzUfUDezqrg1gx?=
 =?us-ascii?Q?z2yd+eri/WDHid/qB2Kj7+Z4MwMmNRbn/Zt+ZAsiib1JTuxrFZ2ZnmmiVgke?=
 =?us-ascii?Q?tca7K49zCvFTHeNVrfZX/mYdfVC/4D3xg/kyZ5/YjuNY03ZIa3EzKN6+9/tJ?=
 =?us-ascii?Q?u+I0Km3pEYdjuGP6Ik/f0IEK7GWtwoHGJ2IPRwLKuKJ0kZFvAcyqkoAuPH9N?=
 =?us-ascii?Q?pLyLA7523ykSmtmZmFsrv7fD5ZI+X1inb7XzyEMZaouOgPT+tKWxZhhIQhh+?=
 =?us-ascii?Q?sOlT/yij+ceZIC8fc6GasGtKgpFsIizUJQBXjBc2/MZ9UgyBoLQR04oZ+m/n?=
 =?us-ascii?Q?g3zVqitrx13ITMlVQggFbhFewpI7amMEB9Yfq1e7+hJQPX6j+q3Aef4t7eIQ?=
 =?us-ascii?Q?CzvssrVV/udyChPH56USVOKOSelLfHpxsOZ1n0qDckO1GsIXVvMTb8pM+yHl?=
 =?us-ascii?Q?Jf3dD5/SolUQaI/2BxY5/c/GkD+QYLtMSwzxAwwaen4gZxGzc75Z4ZzziMsI?=
 =?us-ascii?Q?5K/RlQ/jujuVv6nSEEH8kOmgqJ1/xtrLFTjcymLF8eZWPVGeJwNXlZMPJcoA?=
 =?us-ascii?Q?Ig0VEP//qyOgLFnMFft14LWcqZjET5MBAyhEfg/U?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	735cAGe13jz6xo9J6H4/N4g+c+LumCYKlh/rO6p7jDxgrngYPYDfjILxoqiFJVXVwcRjp9GmN2+XkGUwBNJ8bKYWJaI48/RW4VRS6+CrqgV//lK71WVKDUqqufMPn1f5vNVWvhZ6Uj3KbIm0UwqiOjI05S4BCR057kJYp9TMwE0S+x+3mt0t/2oQRNHfbpF+6RvcoeoqeAQhXwrzU7DBvrw/BEXWzfDrxc7TJ/iF9gH8XK1fcQdSprt8+qvz9tzD1OKedbYUXkYcZ5bG8HxdWzr7Qy4RLOodRBf2qWaaEIN9Ydte0JGyVp+U93MFhf5td+RT2WjuR+2HajsSjlxqU67f6EvMkA7NQLK2QMZJqitu5YAVubl5Jerko+eU7jIbvZ0z4PkBKPNNWKnK6ESxHObt3jRXoY8F001z/nWhSblY1tUYVCWVW9jG4CbNIeCly8uvtFR0JI35Gm/DJhUAcbVEqRazDcciaVRwFCUC6exAh2CYB8QAF9wY60GqQ2nT3iKbaX4igwp+qObHO/mei5F9OfjL/K2iIsefnY3K1BF18KAPScrfuMaBBaQ+hpWDn9n/k9LQBRU7kSUsnn833ARPrtroQwj9MIGhfwMsmo0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd044da-61c1-4ef8-cc70-08ddb9f6f00e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 06:00:39.9035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HuATx+fZsg3vUmmyF9liphzeSv+/OuZx4onLFgP9qmZ/i9L34ek/EvaEfiS4Yq4y17Ik7wAB42TS0MZuuhbAKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8180
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030046
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA0NSBTYWx0ZWRfX8D540F0oOgyj kgN4I/CN9jC1mM+lGMsf69HUvXOTI8dpKoAqB7zsfu+dcmdtHmKAkGSHHeuW3fEIWphGx2Gk/NF lH9JaUfiR5FrONdX/Vp+AuktG9ZCawE8lFrR+M11//1lUQ3x9Zva8TSFfB5TnS2ldOZ8PlWj4Vx
 hLeYpwbiHxiNs1lUpIZLI2uMgFMf9+ziX6q4mEPtSWaSI6hYOqC10lcT0i/AvQCwrYcNhQPkFTn kUbtP93pU9kv3yF6XRljRBDvLGsXclFvV+yTROHV+usk717k88j8tV/UYbwTVsItWizVibDwRVr m05uUi7vDz08aTdaodgsKiulA/qFaH22x1WvGjqqP1zQ4/zFS1qCX3932CpNMA6DHjTfGoUy12Z
 Sz0zVyhcCHUhe83wAQiXyO6TqgzTV7/dpUR/tvhGJXt+yJtqHZZDMYn+Z40GD+ArjK6h+pZi
X-Authority-Analysis: v=2.4 cv=LcU86ifi c=1 sm=1 tr=0 ts=68661c8c b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=fasuHzh_2AU1ybKEqLEA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:14723
X-Proofpoint-GUID: QxNCTj5stY-2cS0j4EoJzMScR-rtcLji
X-Proofpoint-ORIG-GUID: QxNCTj5stY-2cS0j4EoJzMScR-rtcLji

* Dev Jain <dev.jain@arm.com> [250628 07:59]:
> 
> On 27/06/25 1:28 am, Liam R. Howlett wrote:
> > * Dev Jain <dev.jain@arm.com> [250626 13:19]:
> > > The special casing for offset == 0 is being done because min will stay
> > > mas->min in this case. So refactor the code to use the while loop for
> > > setting the max and getting the corresponding offset, and only set the
> > > min for offset > 0.
> > > 
> > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > ---
> > >   lib/maple_tree.c | 11 +++--------
> > >   1 file changed, 3 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> > > index 0e85e92c5375..6c89e6790fb5 100644
> > > --- a/lib/maple_tree.c
> > > +++ b/lib/maple_tree.c
> > > @@ -2770,13 +2770,8 @@ static inline void *mtree_range_walk(struct ma_state *mas)
> > >   		end = ma_data_end(node, type, pivots, max);
> > >   		prev_min = min;
> > >   		prev_max = max;
> > > -		if (pivots[0] >= mas->index) {
> > > -			offset = 0;
> > > -			max = pivots[0];
> > > -			goto next;
> > > -		}
> > This new line should be dropped.
> > 
> > > -		offset = 1;
> > > +		offset = 0;
> > >   		while (offset < end) {
> > This should now be a do {} while();
> > 
> > >   			if (pivots[offset] >= mas->index) {
> > >   				max = pivots[offset];
> > > @@ -2784,9 +2779,9 @@ static inline void *mtree_range_walk(struct ma_state *mas)
> > >   			}
> > >   			offset++;
> > >   		}
> > There should be a new line here.
> > 
> > > +		if (likely(offset))
> > > +			min = pivots[offset - 1] + 1;
> > > -		min = pivots[offset - 1] + 1;
> > > -next:
> > >   		slots = ma_slots(node, type);
> > >   		next = mt_slot(mas->tree, slots, offset);
> > >   		if (unlikely(ma_dead_node(node)))
> > > -- 
> > > 2.30.2
> > > 
> > The current way will check pivot 0, then skip the main loop.  Pivot 0
> > has an equal chance of being the range you are looking for, but that
> > probability increases based on a lower number of entries in the node.
> > The root node, which we always pass through, can have as little as two
> > entries, so then it's 50/50 you want pivot 0.
> 
> My understanding of the tree currently is that ma_root is a single slot.
> Or can it be a normal node with 31 slots?

Ah.. ma_root is a pointer which could be a node, null, or an entry.  We
won't get here with a NULL or an entry.. because we don't need to walk
those.

So at this point, we are entering with a node which could currently be
two types; arange64 or range64.

Cheers,
Liam

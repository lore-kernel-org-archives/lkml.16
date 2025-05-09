Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2041.outbound.protection.outlook.com [40.107.247.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3860E139D1B
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 05:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746769653; cv=fail; b=bAp2DasBCFelP40xFkk7vDg9bkHbwB9Ec/K/TleaopaLi7IKTToWfxpxDwYFreSv9tCLZaDI4J8uQktp9v4rBiNfjqg/AwSIY4FuINeEBF7OTp1i4JzglgVssz4pfGiPR3sHEw31oR1+ak4riqyntY8MI+D6xFd2zTq22HmldV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746769653; c=relaxed/simple;
	bh=AD0ulrNvc3OBbRGMiFd+aoN/dJH81m3UQvWvf5KZmG8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DUZsKoSeeE6uwntOxqyGjcHSEj6tM3iCGSeXnZLy1nTr3Dbrk5bpBWhVQMAPmRebwymCaXwiB/9yG6FZD/dHbIggeDuSQYNhgxNJzKmyop2j4VGqh/sPx8Nnp9u3Ub02qCtKbYR5/WogQ0VCZKpbQDRC4tZyMrmS/MSSqysBKic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com; spf=pass smtp.mailfrom=kuka.com; dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b=ttABv8DM; arc=fail smtp.client-ip=40.107.247.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuka.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b="ttABv8DM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UR5WmFqdXAoN6a+fsY0SeTjF0Hxh2/6IkRtiLj/2wLBZyEAsAnOzEicyNWGoSoivGkqJKaTBFVyBJrPsCIIzPOqTKGmZabCtGCDMX6LQuE216EXD0BV+HAGBQ1SoJ5tx83AZgTuYBrn+Aogcol4atuATfchIAkyJ4rEaK3IMJTm4pXfcpAnTnBz6a/hXWG0CMLqcdj0aKgqONhToPFx94/ahNJXGFAvVcDC1EOMMqp7tIIX36/sC9qteK4WKAk4Qjqea1h22eR6wLLi//WNboJFEXPKbArD/J5F+0iMV8r1abLapIRZj8VvD6LmBnkS0kHwD8W1ZdVSDEOHfsY6mug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AD0ulrNvc3OBbRGMiFd+aoN/dJH81m3UQvWvf5KZmG8=;
 b=l387etgojUVwLvRnDCveBSpz/+rZ9ZhB+NKj6POIv8mxlv+NyDDjrZbHvhe0n0CQzjXA1bvi2ns9WM/N/rqJ5NgwG7pbftcNCdrzcZ5jXuHwKEvnru0lrvtFpTmdXchwu8cNDHXPtW3eeE42bKIjOe6qZ/aCFjpvQqqr7l4uJBoBv/uTK3Ba0CyLiR1kNeicdWvVYrmQxWKTq+DXgw6bRfD+7xhXl7//sjtMw08naq8EbaEr2rd2n7Dy7Dfe1yp6W5CtViPeA9Ek9fM9LNkt8UAqc18jtha4wEvJ9nBIGFtELOFOt13ixdswmbeCDr/aRDByG/bnWzf8vhAOqWhdjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kuka.com; dmarc=pass action=none header.from=kuka.com;
 dkim=pass header.d=kuka.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuka.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AD0ulrNvc3OBbRGMiFd+aoN/dJH81m3UQvWvf5KZmG8=;
 b=ttABv8DMrVRc8xq/nId2qxNTngc421yN2WnUllmd4N80Ac67HG16ghpvPuJdwzHlSF+75dpXx3yE4K8GEFUXocvqlYYQ1sQ5UP9jlqa1QeKyYpz4pg/mBT0fKlu0+sHlXWQVe+RlI1M4nIB4Imdx4WYDos1eGB03+33vjyrCTTfnsfIqPHgtlC920Q5p2IZUD6j3T7zCmiiD+5wYMxYA7m1+r44SEMrNb2zBx3u36mrX6FcSZabCI+erO8hyMaWlLToHszbVqE//fF0FWYMHsUGF0kWL+GQZDbd1qJxHl9Kp6DHP1M+XVSRP7khZ9qpNONNH/6oJc/BUzZNiTokWiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kuka.com;
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12) by DU0PR01MB8902.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:351::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 05:47:26 +0000
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba]) by VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba%5]) with mapi id 15.20.8722.018; Fri, 9 May 2025
 05:47:25 +0000
Message-ID: <88ea8437-4202-4b72-8c77-ce1b0ea4cad8@kuka.com>
Date: Fri, 9 May 2025 07:47:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, yang@os.amperecomputing.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
 <wpxllvzvr5yxmmz6cjcbxc3gkpfdlfxikvoyt3xoyjcjriqys6@befrpxo3o7fh>
Content-Language: en-US
From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
In-Reply-To: <wpxllvzvr5yxmmz6cjcbxc3gkpfdlfxikvoyt3xoyjcjriqys6@befrpxo3o7fh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0265.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::8) To VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR01MB5696:EE_|DU0PR01MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: ba4802e9-057d-4b32-ab16-08dd8ebcf9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bEg1UFVDMUtXMVY4ajlpNmNOeFRta282N3IzVzhlaVBmcm12UDlLZktuT1hJ?=
 =?utf-8?B?U2hFZmJ2T2xKZytUbU9vVWRxMmZGWFR2Z01XbGtDdEpWYWs3R0l3b1gzd1o3?=
 =?utf-8?B?enJpdU1ubWh0R3VoNkJpZnNENnlLWHpMSG5BY3BBUExkZTd3WnU0aWNQQnBC?=
 =?utf-8?B?OGpwbjZydzZSOGwvaVRxOUJOMWlDYWNpSGpqb0Y3VGYrOGp4OEFOdGk2ZUFL?=
 =?utf-8?B?UlNYdnpuVmxHR2dXdlZjUk1aUmxEOStrb1lTRU5LVmxia2hKNW5KSWlTOXRo?=
 =?utf-8?B?aGFvekJBbzZ2Y2p1dlVWUCtGejFZb0NubG9hLzdCSnQzNUozU3VsRlBpV09S?=
 =?utf-8?B?M000UDAwVkpZRVVqTGkza2M3cG54U1VXWWZJSWJURmJvN3loNWdOMVpZd2Vp?=
 =?utf-8?B?RlBaRVRieUVHNUNBaXZ4WXFDL245QTJ6ZHlSWkIrYUZkYVdXRERDZ2NrcTRv?=
 =?utf-8?B?VlYwMThIZ2FDT3ZqanNGNGo0eS9tOFUwS2ZvdnBLNHBNNXNpeTZCQUpsVUVu?=
 =?utf-8?B?R2ZaS0prTCtzazN5REVScGExWks2aHdkR1ZtR3NFbkllL1RkeFIxd210L3RK?=
 =?utf-8?B?UGFpanlPMU9rVGFEK0Z1N2ZSSjFUUWorTmFTYlAxYk9ZY2pkZGVnWnkySlU3?=
 =?utf-8?B?Vi9CZzVTMWliVGFrclpPK0RlQSs3alFEVFh3MzJlM1p0OUFhV0hBSjdSRGsz?=
 =?utf-8?B?bzNvQ0lzYzdwTzFtMDZoQUVXR2V1Y3NVZE5CcHJyZWttZ3NDUktZNmdQSGZJ?=
 =?utf-8?B?OCt4NEhyb0MrWndKZ3NNUUNFVXJNVVBmZjVNQTJmYmFjV3FHVW9taHZ2NnJ1?=
 =?utf-8?B?Mmtqa3pkUWRER1ZUck9YSTVnaEVYOTkvS25BMEZvZWFGZW5ZaFJ1U2c4Z2gx?=
 =?utf-8?B?bm9hV3ZpOE5kWUU3SEZJd2dFa3NYcmdoTzFuK1pHZG9OcTBoNDNFREVoNjZ0?=
 =?utf-8?B?L3AxaXZERGt6UFFxZHdhckxKR21WM0JOeHQvUWdwemVvckEyRFY2Y0Y5aTdV?=
 =?utf-8?B?bzJxV0hlbVBhOXVNbEpVbWx3clZ2alV6TkRXRURPOThSSml3R0pLUjNzTTJQ?=
 =?utf-8?B?aXRzYU91UWNZK09jM2FPM0tnTEVrSm9pMUtpM05kc2FmVVgyMkZxVDB2VXUv?=
 =?utf-8?B?Y25KTXRPWW1NcGY3RjZqYlplc01nWldlZXFUUkJrck5DMTJ1QUt1a0VKRDNu?=
 =?utf-8?B?S09YZS8wcVFLNTFYVDN0Uk5WZ2xqdFI5OTUvQmNtTkpmdlpZWlVoUTg1VCtr?=
 =?utf-8?B?ZzZtT016NzdPYkk1VWdHUWY2cjQ5aFd6UCsxR0dERXJuM2pXdlBvMytLWWN6?=
 =?utf-8?B?ZFpCZlVZaTRNV3k4NFhQMlNDZHJuSEpQVmsyMlljU0dxUFJQL0VpdDNVZ3ZI?=
 =?utf-8?B?MElCYUc3VDY3UVJsTXozWml6bDVoM0EyeWVxdmxvMklvbEJzZTAyM1gwbFNq?=
 =?utf-8?B?T1RneTUyN1dJMExUR1dHYlZMSUw5TG5qNCs3Tmx2TWt0VHJHT1AxbitXN0hG?=
 =?utf-8?B?VmRCWERFTGo0TkRYYy9mUG5mK1VlMyt0Qy9HaVJ3Wld6UjZSZVJrZjJRZE5k?=
 =?utf-8?B?eXVnOHBjWm5ueEx0VlMweFNTNTdRTE1WejZJOVJzVUc3MTB3TUxJc2x1SnpM?=
 =?utf-8?B?b3UyRGE2ZUtzNlU4cG9YVDZwRHZuODJqbVR3QlozZ011U2oybER1d2pha1h1?=
 =?utf-8?B?WDlGZlI4RHVxMGs1ZU0wWnBwb1ZNdjZqMkFmS1ZVNkxKRGZSeUlITVIzelBQ?=
 =?utf-8?B?QXZwY25XbzVSMVdzQTI1ZlIyN0w0QmY1dzFkQVRYZ3V0MnZSSk1oMklsb2hM?=
 =?utf-8?B?dHVtYVZBNXdNNlp3d3JqWDg2WnVCQzh5bC9XOWl1K1hncTdNL3pvZHFCbzZr?=
 =?utf-8?B?OHpUSGdiZUNGK2lnWHNkbFJ3cU94NnR3SEZ1RzRxOVJIbW9QZTV3YVIxa1JK?=
 =?utf-8?Q?dE50PcUhfg0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR01MB5696.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGNDWXFWVVM0MnpwM3VJVGJ6RWVmMFNQNlJzOXRFc2N5NGE0TlRIcC93eDhi?=
 =?utf-8?B?SGdQSVVsRTNJeGZSTkUxZVg3QUtIdXFUbm5SVklPODhNTHE1MXByTU9Ua1A5?=
 =?utf-8?B?bGd0SFQ5N01UZVduNUdybW41YlphQmVtMWsvTmV2QTYrVDBSazZmUEhrTytv?=
 =?utf-8?B?UThVdWhJTDF0ZXlaL3pRbkQ4S3RIbGUxeFMvQlNWOXlTQXljL0MxTFpqbDJZ?=
 =?utf-8?B?OVRIRWxTcXB4YWpENE1lMjdaZ0thMjVCSXFuQWMvZjR4bU8remZ6NnpaVG5X?=
 =?utf-8?B?eEErdk5MWVYrVStEOGl4T0RQWXFHaXhCcSt4ZS9SK0tOTGxNSFZuM3ovaWlx?=
 =?utf-8?B?WUdBOGNPMmlZQkxvN0ZIekdvMnBTb1dBeXozK05mL1pMWjkwWmkrQ25paTBI?=
 =?utf-8?B?Sm05Tjk5OXFobzREeHYvN0dPVkVCNUdIa2txTnU0bmViMjlLbjRTdkthOVBT?=
 =?utf-8?B?eVVROGxKc1REWnk4K2JxNEtzVFpBZ2NQbytiNHpxZUtMb1kzSmtiOUxrQjh3?=
 =?utf-8?B?NCt0eElPWlN3VXoxb215cWpKS2FEL1RPZmFnVjNKY1JOZlRENHppQ1dNeE9L?=
 =?utf-8?B?L3JpT3FTWnB6NVh5S2xnbEtFWGNBZHVIRmR1Sy9VZlVBTVIrRHdIMnR2UUVB?=
 =?utf-8?B?UzZOMzJmQUNhc0p6Sisyb05YZUZBNmJLV1ZYazBGWlhaR0NWaUNwVDBTMDlD?=
 =?utf-8?B?Y3Q0dHNBUFZXYlJqbzgweUJVajZZa0JETXBhbncwUDdOU2s5VTh6MnJ1QTY3?=
 =?utf-8?B?NEUyVnRFUTJzaFVtc2JGZzBFUUhaNTdUVGw5Z1hQSUwrVU5tcnhDbXlyOWRI?=
 =?utf-8?B?SkdlaWZxSEtja1daKzNwdHFiSDJ0V1VwU2pSTUo3dnR2VjR6V3MwK1NpNitr?=
 =?utf-8?B?WmRXUndIYjdBdHhHTktuWDhEUEdCS1Yzd1NnbWVFdndNRkdzYW5Ga01ZbzVu?=
 =?utf-8?B?VlF5QWt3NlhOUk5UMnlYUkVpSTZ5M1I4K3VLL2c1a2pJM1VGOVlodFhLajAr?=
 =?utf-8?B?WkFpcVlKSnE5a1FhV1J1L1VwbVlZMkIyTW1pQlNJRUNKcnNla1JPcVFWWUxv?=
 =?utf-8?B?YnUwd0c5dENQQjQ1MlhvV3BuTXZwdi83a1lMc0NRam54T1Ztd1RUSkMveTNi?=
 =?utf-8?B?MmRTS2pnTFJIS0pOeWtTS0pON0tIeFVZMDhiN2loRmY5Z1plYyt5Q1Z1UXdv?=
 =?utf-8?B?bXhqbnFFYmV4Y0NuWUM5SDFaSzQ1R25lTWhPRHRXd3FGTGpIb2N3RjdFOUZk?=
 =?utf-8?B?Qzg0LzFZay9PRitvbTRSNWFvRGlnbEd6dUNES3VFSDhBd1NrZ01GTnQ3eU5n?=
 =?utf-8?B?RXowcDlLTFdlSlEyS3BtdC9RSXNtSVhuMXN3eGJJNk9vaXVNQUNHVVdvVFhS?=
 =?utf-8?B?TVI4TUxkLys2OEx5US96NUo2TzBWaFpsUjZoR1BzWWhkQUhBb3ZrdTlscHlN?=
 =?utf-8?B?TG00eXVXMDE0MEZsY3VPb2kra0hlcDlFT0ZwRWFwdklsUDNuNXRTeGpBN2Mr?=
 =?utf-8?B?eFNTczlrNHdZWDQzM0dqYW82aFRWY1VjT1QyU1BOUWV4MUQ5UjcyQ3JjTy81?=
 =?utf-8?B?Q1FOalJjNXg0MnlOWTUrK0trSnZwM2N6SDZjWk0yM0tWYkVTY3lBd3F2Zkxz?=
 =?utf-8?B?WDFWbXVtNEc1KzRpdUpqODYwRlpyOU9DT215MjJ3VVFJd2Zycnhub0RBMUUr?=
 =?utf-8?B?UHRzQnZzTGw1VHlxTTNoZGd5S0dGZDZhREcraEpsNTMvNW1ON1c1N1c3bVdB?=
 =?utf-8?B?TFBGcURXUjhUVDdOMGoySlZMNjRHN01kZjhvNVh2VXd0NXc2di9iN1BZS0Yv?=
 =?utf-8?B?aUtVUVBsKzVEU2hlZzBRL3Z6TU92LzU5Z3VXK0tucUR1VFBwdDJKQlZnUk9v?=
 =?utf-8?B?OXZTc09xWS92Um1hUkVRSEdITEkwWCtOS1pzQzVQZXdiT1g1end6U0ljUGYw?=
 =?utf-8?B?cWExcUJtRjl1L2kxK0RCRnU1Rk0rUGZJU3o5TmMxeDREZXlGQSticjJWMkc1?=
 =?utf-8?B?SjJsSGxyYzJvOU1ZOGMreFd4WWhmNUJSZmVPK2d4VHE1NUpYZjUzYmN6cmJi?=
 =?utf-8?B?em91VGVVQnVBS2FkUzZDZ1pKZ0dSeFZxWGgreHdUajBra2tqa3hkOE5QaHVZ?=
 =?utf-8?B?VUZCZ01mYnlGWnVNcEoxY1RrYVhKcCtOTUpGWitVdW1HbWNqUHhnbUJDb0xq?=
 =?utf-8?Q?kq5uPwTiPIX7lU1lb40rueM=3D?=
X-OriginatorOrg: kuka.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4802e9-057d-4b32-ab16-08dd8ebcf9a3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR01MB5696.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 05:47:25.1609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5a5c4bcf-d285-44af-8f19-ca72d454f6f7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1B/g6Qkp6odZOovOxiHUF1jbTVLbmPU4BQUqSFN3tmWADXNdywLpJAAA8v3I8eZMEQFlFBmZxoAkX023MuP92i7+TCfy7V/jXksMPV7YRbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB8902

On 5/8/2025 9:04 PM, Liam R. Howlett wrote:
> Which one should Cc stable, I don't see it on either patch?

The patch in this thread is the one without CC to stable, and the one here:

https://lore.kernel.org/linux-mm/20250507-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v5-1-c6c38cfefd6e@kuka.com/

has CC to stable.

I had submitted both patches together in a series here:
https://lore.kernel.org/linux-mm/20250506-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v2-0-f11f0c794872@kuka.com/

but then Andrew explained that this is troublesome, that's why I then submitted them separately.

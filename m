Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD221AE877;
	Fri, 20 Jun 2025 05:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750398659; cv=fail; b=nexKby59rVmTQjwLqozCvbq8Ge6ZeOwxz2+xmpQop6/WRrRPZ1guEYxZwclCkCPXZrV2n/GUiuWW7Wp+tTZFB4rMT+yo+wW1KvCku9e1HSLJFOQHus5XefyB8cMthOiUroJMCJT6Kdm3OJQyfVI03N75ifa2143TSgl5/zJXPt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750398659; c=relaxed/simple;
	bh=1y989TLETxHZLkVDSyDOqzd/FxPqtdEG9xjbyqKEkGE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Hw4wQsr3n9cq9AEotR9P/s8SUz3a/qEQaHuz4AbFee8/NlbzoNUkkWKcYA5OJl2gi/N8jtcgJEW9J8a2KKQZ0rtes6SAQpdC6Fj/8FwKWJtx6qTiozW5w0qV7SOYqweo3wrpTfceQToQ0m7tnhnsmf4cHnYFCW6ooXJrpS+bGGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=MYVK3Tu7; arc=fail smtp.client-ip=52.101.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="MYVK3Tu7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2YbsfrgBcchnhRQL3iv6BV7Op9a+XaHLj2t3iqLW3YKvrOlI5PctXDAZQ8B5GmWB/+ZKCqrMIdkAtqCKMkKDaHXn+qcSrova8LFrMyOr4zWckRkpurBCTvIg2a++59AATA90LiehJEKz0IBDSVo1Wchay+L/Lq+li5BmJcHsb3VU/TE6xyCU6LhdloYh5qcWv9Tgg9UcGijFZnsmXbaB4ipj5XMLACL3n769mULnoiQUWWHFnu0l6GijE5UOK+VfiZWE5/GYgJVaDB06xHuudjq6DxmGOdaj7pHxhJ6wlPoyYrXmDryZDc8brZa1GxDbcyoLqRIdzcKcEnYy81MOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Gew87e1SrhjRWmsBVVwS9BoJhGdxfD94v/rWtnUuoI=;
 b=t/E2wtNmUGsiux5U+rsq6XdAAZsHsOl1L+VmS6ejNma9diLwv5ZmRKM9SD4XfsSOcWJAxDaa1wFiSHrMujrT6uvSKtexNKDXs6BV+uslk4T7nyHzKfNUyfKRYS4auoLwpXX6HeWh6xYRg1gXurBZMDQ7scnH/85skbbfjJlfRnSnqXDTyzgOPN4QfPDODQzkaffbFng9ofhisrTP3jDxECMlYrr36yDaQz7LPm6VJVh/SPnpwM520tBHyh7a+VvQjiDskfrJnsHHqZQbyR09Zi09R3pjZlOquzKjyuYIezFhQHlRsxg31AaEldLyHUJMcqd/sMReoCydFCoJKgLO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Gew87e1SrhjRWmsBVVwS9BoJhGdxfD94v/rWtnUuoI=;
 b=MYVK3Tu7ge9tMGbJk+wbL9E2v8L1XXyvwBJm/osE08BP+9FANEqh7nh4vYFylXkxx77pSzOOlsUBgBzUjxVX0J70UIr94uWCitVFKa7CuRQe4JmcxB4O7ugxYHc9RJauOwhKJgsSgC+xFuPpMIXGi12x53wX6g5NTrR6qfuq3sQhLVOeyBX0EC1rjcuQqbXHhqdWs0OBE6zooAvc27CW66Mgmy9JFg4iSEOPnl4fKcQEe732jXcVTsjebirCh8a1Rwq0UshT58saRcU6hFKAXz8BErihCXP7FggRnNGbpdJ68Tpmql6rEg7vH7yuluilojCXMgPq7jQ3+nQUWKngOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AS8PR10MB7279.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:615::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Fri, 20 Jun
 2025 05:50:54 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408%5]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 05:50:54 +0000
Message-ID: <2f48008d-b05d-48b0-bba1-f37ed59301b7@siemens.com>
Date: Fri, 20 Jun 2025 07:50:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] scripts/gdb: fix parsing of MNT_* constants
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Stephen Brennan <stephen.s.brennan@oracle.com>,
 Tony Ambardar <tony.ambardar@gmail.com>, linux-kernel@vger.kernel.org,
 linux-debuggers@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>,
 Christian Brauner <brauner@kernel.org>
References: <20250601055027.3661480-1-tony.ambardar@gmail.com>
 <7984ea38-20cc-49ad-ad72-c6433ad64698@oracle.com>
 <6388ccbc-3189-46ad-a146-b6b732417a09@broadcom.com>
 <7ab95eac-47c0-437b-aa45-5b2871c31a8d@broadcom.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <7ab95eac-47c0-437b-aa45-5b2871c31a8d@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0239.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::16) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AS8PR10MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a4778e-57b1-4a7c-7df7-08ddafbe6b80
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXNyODFSdHUxdHZoT2JQcjNQV09TSzhKWnVvQU8zNlhaaXp0dG12ako0VGMx?=
 =?utf-8?B?SjhkRllWVk44cjMxUUtPQzEyMlRjRmpTejQ4ZDlKUTlOdVdXQ2xFQWljOUh3?=
 =?utf-8?B?dGwxeXFmMGNQc3NYU2k2UHk0THNwa0RTSkQ2b1oyclVJOWh4NDBYTVhiMEtZ?=
 =?utf-8?B?eHdZa0RlVTZZYm9IWVlPT3FpaEtFQzNibzlKclNwR29oT1RkUWszTGh6OUtC?=
 =?utf-8?B?d2ZvQTkxdVpmRGJTdlRLU0wzMEhUMzY5bElPOGVxSnRnMk9YeUZNUldMZUYw?=
 =?utf-8?B?OE9UTkxmSEFyZE5XZENsV2JiZFM4OE1kQ1h4cnFFZG5ldkYyajFRMkUxaWd5?=
 =?utf-8?B?UVZkOUY1MS9TdFR1YysreklCZ0o1ZzMxWlVKN0tJQ0NoNXNEd2szZHY5Myt1?=
 =?utf-8?B?Y004cmNPRUk4VFB6Q0xDWVFIdmRmWVlBUWsrdjR1S0JKeXRPTjNydGZZL2dw?=
 =?utf-8?B?SkVnYWRDUytSaEFPWjNnZEthQlNid1hsWHhiT3d2dWZuWEl5UzJNTjdFNXJs?=
 =?utf-8?B?WTEwRXhnYUd2RGt6bElUQVpDam1ORWUxY1lYdEZFazh5aitqclR2bXV5aGti?=
 =?utf-8?B?cnNxcktOa2RqUFY5dE5YUVU3ZFR4RnBTV0RmUm4vZWVhZFRLUHJ6VG5CUDNq?=
 =?utf-8?B?RktONmQ1dUFma3NkL3IwTkVJOWlGRkNKcU01UmtZamVFa083SDgxSnBBdy9B?=
 =?utf-8?B?blpZeFZXc3FqTkY1N3NYeldTQzczWXpOOC9uOHlWQ1MrMGJDdTk2L1VnUmgx?=
 =?utf-8?B?c2k1MnNQVDJuUk4ycDE1NlpsdE15djVNaFpMS1BZNG1lZElBeGwzcDlWRyty?=
 =?utf-8?B?ZjRLTWphY3k5OUtmeG80U3h6VU54Z0I5VkFPdWhlMm9MMDdYVTJZWUk4R1BY?=
 =?utf-8?B?Y0NrNFRRNDQ3TjVXY3FwN0VUNDhBSXZpWWdaZ0lva0VpS2I4K0dzRXc4SWND?=
 =?utf-8?B?Yjl4WG9ydTNLQU1Qek11SmhaTm5wL0xIdTdWMzFReXFTTUYxTy81SC8zdG1t?=
 =?utf-8?B?TWprS3hXSTNMTHAyMG80YXVtY3dURGhXTXpwRXRPeGZENnVzcFB6eTB3UVZz?=
 =?utf-8?B?eVRmdG9WWlhyaXcranJ5RmRkNUNOZ1JDbURtemhmRDVSSVRsUWsrcFdTQlhP?=
 =?utf-8?B?LzZXYldDQzg2VmkrRitkVldzWEVTSDJaNVF5eWxVaFNNdHVRTy9NamQ2MWNG?=
 =?utf-8?B?ZTV6d0xVVG9JVEdKRUh0aUpsUVNpZXB1R1Y3UktPWkNub3BkZEhRdTlwelIr?=
 =?utf-8?B?dTQ5NzBUR2NucUZld1VLTlBEMllVYy93b3Q3MnY5ZHBlYUEwdVBMcUFZRTJV?=
 =?utf-8?B?TTByNUNIMWlPYVBCN2VBZWVOYjc5RzFXcjFlR3pEZFZkcWFSeDB4OW1vcm5Q?=
 =?utf-8?B?MTZFWlpoMWVVZFBMdTNOTmNnTlZ3bXVwQ0R4SDRlN0doaWx2bjg1UG1KKzJE?=
 =?utf-8?B?Ym1NZVBvc2w0SnJaWEFnd1U0ZkFzb1gxbnVDZDI2bWlOaEdJVzlpMmJjcGRo?=
 =?utf-8?B?dUNaRFJoa0liVjhpY3BxUWd3YS9rTDRPYjIzY3g2Wm5VYWE2UWdLSU94OHVF?=
 =?utf-8?B?M3BBUS9qZTZ5Y3RzeU1CcTJIUEo4L21DSzNaOVQ1TVpxM1NHQ3NwZUZodFV2?=
 =?utf-8?B?Q3h1YTEzN01HMWFCMG9ZOGErNW93NE5KSnBGN0VhbjdmMlBsR0xOT0taWGlN?=
 =?utf-8?B?WlJxZENsK1hwYVRCVFlkL2pBVCtkOEJwUHpJczg1RVFGY0Y3ZmtKWXpRRWhP?=
 =?utf-8?B?UUlJV1lsL1VPSG5vN2xXWjZJdnVzMHJvSCtrTFF3MHM0bklaRURIQ1o1L1l0?=
 =?utf-8?Q?TnxzbJlUcNgocexPtbyGmBgj2+yyBhCuZhKe0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXhubTBCWHJ2UEZlVlNzZnBQME9vNUZzd0t2N0lUUGhsazhyODBqOWVRQW1F?=
 =?utf-8?B?NnkxWE80emwxRmI0R1FKTFdPazQvbFRrbGFieFZSNG9ueGh2WUZEMlU2dFZ4?=
 =?utf-8?B?dGc5UTVUZmdkZ0t2S3N3MHZCaldmY3ZtZ0duYTVrM2g1Ly8wdG9PN3BzTGg3?=
 =?utf-8?B?bGlGTFlVTTVEMU44UWlHcGxlaU9PYmVSWU1uYlVWL3lWWU9rb0JPV3NwcDVJ?=
 =?utf-8?B?ampDRTVmWmRWUER6Z0hHbUhhTDdxTGphcStBdit0UHhjT3JYY3pUdXBTR1pZ?=
 =?utf-8?B?NGhSWFNKNGVCZDlROFVFT1htdVRMYllIQUpOa2s4S0ZMaXlweTJLR0NGTDhT?=
 =?utf-8?B?YzJ1R1ZxRzh1NnJHditzQ3pzNHNER1RndncyeFFzODRJeWRrQ1dEeHBaZVZz?=
 =?utf-8?B?TjNxbWQySWtoNHY0ZUpRTWpGdk5WdnNadUEzdmQ1SGZXT0pqQ0ZhQ1RHa3or?=
 =?utf-8?B?KytKZUE3RU1LdHN5azVuSElMZldncjJNMHdqZjdTRFJ0UVp1MkVlZE5FelJs?=
 =?utf-8?B?WnNSRTZ5SVlwaUx0NGxqejhIanAxMk1CdkRzTmZlREVBbmZSZEw1QUxDL2JO?=
 =?utf-8?B?YU4rVmlFZG1YTklVVjRvbjlrVkJqUE9QUXhDSFNoM2YyREhTUUo0UWp3MlB4?=
 =?utf-8?B?eEIycFBmMXRGRWZzcTVSYVhGb3BsbSsxNG5YNFF2TUtTRC9oNzc3NE1RdjUz?=
 =?utf-8?B?RG42UjVTSm1ERjFLajAybWlkeVpMczJhQXBZV0NtNHFjL3MwWmlRVTdmSXpo?=
 =?utf-8?B?azRTY3JTOEQ5aElUSG1uNHI1MnlBbzhNQk9xNXRqZVdETDd4TFc5ZTJNWWg2?=
 =?utf-8?B?dlhnQmk4UFFoUnBaNldxMXV2SHlaU3NVenMzN3JaempGQnB3TXZyaEMxRHd4?=
 =?utf-8?B?ZDNyR29NdUdWZkRxa2FJbEM3dW5Kck5kNi9zUVhBRWhTVWlocmhKZWQ5Mkth?=
 =?utf-8?B?STRQWW8ya0ZweE9Tc2VYN1R5QUQ0OTI3YjFGQjNnVXkraVQ3MElaTE5wTHFY?=
 =?utf-8?B?U3ZIVVJ6RDRDNnhDNVlyV05CeGdtNzBRVGtoTGtMTzZGUjN0WkczbjE0VGxa?=
 =?utf-8?B?WDhUazhlay9TeHNES0NBTWl4MkZyakJkekZ3V3hiZXZFMm9vRlNGYVFwNFA2?=
 =?utf-8?B?akdjd2owU05WOFVUb1ZhbHh6cVJydytzYWwzdktBZ3prb1pxSnYrZXJ0UGtm?=
 =?utf-8?B?NFBSOEREQkdyYThJaGprOVEvWVk5S2dQbVFINEN0S1ZHVUtwZkptODA1SjZ2?=
 =?utf-8?B?cG55R3lYaWlnZXhXejZ3dVAyMnh5b0Z1QlBPbkJFVnI5SWM2UnVhb3lIcEhv?=
 =?utf-8?B?V3FtMVU1eWpDU0FURVY4OUswaENTK1VDQTBpNW9RWWJDOWM5MmE2Ykl2Vllw?=
 =?utf-8?B?Ukx6cWRXbVhxYzlBU250SWJoU3ExNDlsby9LYitXeGwxODFzVWdra1VCTXNp?=
 =?utf-8?B?ZWNJV290T25vWFBMNk93elF2VlEwcUwxclcwT1UzRjJ5aUdremJPbkFYSGJZ?=
 =?utf-8?B?UmlEREtmWGxRbVp4OWdJZWhQay8yYWRWaW1Ib3l3Ty9PU0N1UmNrcWxoK3FF?=
 =?utf-8?B?UFIrdk5yRFMzUWx2a0xvMGltZVVBSmdUUjdVekt1bjBBNTJLSjRJZVBhWlUr?=
 =?utf-8?B?eTBNcUpON2RLVEdVLzU5YldRUUw1NG12c295c0FJNHNvZzBjNzJXRTRjWHRy?=
 =?utf-8?B?T3Qzb2wxZnFvdmRzTXVJbTFGL1Nob3Z4OFNsRGowVm9NOStGNkNkcEpBNk9P?=
 =?utf-8?B?UC9yak51clp0WGlEdnR6TTNlbTJUZTh3Wk1FdGVGaHdaenp6UU1hRVdZMTQv?=
 =?utf-8?B?TTEvekFoNWZ1cmFOcURxcGdxZmFJRy8xZGZDMDBNa1VRMFppaWQveEpKUU9O?=
 =?utf-8?B?YnpOUVJYM3FDc2lEVW5rcHZ3M080UmhRekZYazhoQjI4N2R0NkE4emdheDQy?=
 =?utf-8?B?dlpXOVdsSm44Vm1WQkV0WWZ0RzUvMGZzcElrMUk0blNWMHozMHQzTGZMKzQ0?=
 =?utf-8?B?ZDVQeHlYaGdrRENFQ2hqajd1NTlnVVk3ZWxoRmJVU2tuT2RaM3o3MGhaZzc3?=
 =?utf-8?B?cEl2Q09MU0NvYlpjRmZEMjUzaWlyOFlyaFY3bU42M0NPOHE2ZGM3Z2dtM2g4?=
 =?utf-8?Q?4IGsQYPi1Lab7QaItfc8Gtzk4?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a4778e-57b1-4a7c-7df7-08ddafbe6b80
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 05:50:54.2748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SCyMb8EfAMAjJAGLC0Qbc2Aw9drH7h2rYfMA6BQWoa8O1DsheINFXyBXdoWKBWlDDsgYSsgtJlvsykF/sYSAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7279

On 19.06.25 23:51, Florian Fainelli wrote:
> On 6/3/25 09:17, Florian Fainelli wrote:
>> On 6/2/25 21:42, Stephen Brennan wrote:
>>> On 5/31/25 22:50, Tony Ambardar wrote:
>>>> Recently, constants in linux/mount.h were changed from integer macros
>>>> parsable by LX_VALUE() to enums which are not, thus breaking gdb python
>>>> scripts:
>>>>
>>>>    Reading symbols from vmlinux...
>>>>    Traceback (most recent call last):
>>>>      File ".../linux/vmlinux-gdb.py", line 25, in <module>
>>>>        import linux.constants
>>>>      File ".../linux/scripts/gdb/linux/constants.py", line 19, in
>>>> <module>
>>>>        LX_MNT_NOSUID = MNT_NOSUID
>>>>    NameError: name 'MNT_NOSUID' is not defined
>>>>
>>>> Update to parse with LX_GDBPARSED(), which correctly handles enums.
>>>>
>>>> Fixes: 101f2bbab541 ("fs: convert mount flags to enum")
>>>> Signed-off-by: Tony Ambardar <tony.ambardar@gmail.com>
>>>
>>> Hi Tony,
>>>
>>> I was totally unaware that these constants were being consumed by
>>> another debugger, and having fixed them for one, I broke them for
>>> another!
>>>
>>> Thanks for the fix. Having read through the preprocessor magic and this
>>> change, they make sense to me. In the future, I'll be sure to make an
>>> extra check for GDB users when updating enums.
>>>
>>> Reviewed-by: Stephen Brennan <stephen.s.brennan@oracle.com>
>>
>> Not targeted to anyone in particular but this is a recurring problem,
>> the GDB scripts are typically not part of any CI and it is not natural
>> to grep for constant names outside of the C/Rust code where they are
>> being used...
>>
>> I suppose that QEMU it should be much easier to ensure that GDB
>> scripts are being exercised than with my current set-up using OpenOCD
>> + real hardware...
> 
> And also:
> 
> Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> Jan, Kieran, can you please pick this up? Thanks!

Thanks for all the fixes. The version of Johannes has already been 
queued up by Andrew:

https://lore.kernel.org/mm-commits/20250618223437.C3BB2C4CEE7@smtp.kernel.org/T/#u

Regarding automated testing: This would indeed be a valuable addition. 
Some QEMU-based tests should suffice, but I do not know where those 
could be best hooked into for broad visibility. To my understanding, 
KernelCI is right now focusing on single device boot tests, and we would 
rather need some backend/frontend test setup here even when only using a 
virtual device. Some self-built pipeline could provide that as well - 
but where/how to report findings then? Ideas welcome.

And then it would obviously also need some folks willing to contribute 
the actual test cases.

Jan

-- 
Siemens AG, Foundational Technologies
Linux Expert Center

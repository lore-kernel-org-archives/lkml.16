Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2041.outbound.protection.outlook.com [40.107.241.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307CA1F12EF;
	Thu,  3 Apr 2025 10:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743675327; cv=fail; b=VrsRnGmnFtfZIrM01rYBaOrPW0tdb9JrWJ3Epl5W3SzpjOIbhv16Uy8wUna9bMLMSUR6k/j5cK5n1pFTsqEBXdAplNUI2QT4THghzs79/dGUWHsYLu/eZ1hAvPqt2DVkOhtDeQUa8Mcyb0g4mYzY3HKbyFtR2PtIIS8BefmPfUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743675327; c=relaxed/simple;
	bh=GGdHJF4qkClCEd6d/gvFk/GyDAvX3FqBN7HuL6Wwk44=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DTQ0j3Z/mX1L2AKN9pAmRuUHqOYivJNG6Sip2L0O9X+nDrF5cSQhW4LBc1xOIM2GVIgHEM7l4MkxpJOlC61MWgziI0pEY2Nkv9ai7eblFxA4pEEVc3j+WZ2jj9YmtnPBNHVDJJgZ64PQQYY00OFoCWoTFShyutrMf8WJF8m8TvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Z48NFqnd; arc=fail smtp.client-ip=40.107.241.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z48NFqnd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUmlRd70y6bey7p18eGZHmNNAzBEvGuwblvWWfQNhfMAKj88uT1UdOvtwtx0iKjA+SsXnjfXE+ojhXLYMTCLJeddSvl5j8f0QHr9JuCVS8lFkWvVVuoc7X/PEt2DoSTZwxPwUDONGw0azu/fnN4g84hnofCWAM/bjMwA1tMZwEh9YDKNfRBNaxdPwaYASTzdR3zW1wwxdFki3BKrjVQk9z063P3aEFIPM6q8ArN7c7n4LEqAk48yR/qLcPGUnsTJpIivY7mFLb43M3Rnmz23RAqAg0rMSNpmTchZOreE6N9kg/MmZPW4IvqrYBZ4HAZeJOK4u+Z4qyilqZOlcWu5tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NW9ymndXZZ1kA06JY6T4Hx0P9QW7wyO2doedh6OpVV0=;
 b=htpJfgZI56+XaY40e5j2SxquS6+tVjA0i7sbKvlFwFMjfPeetH0FAWnb4aSaDPg6HY3Vmq1YBezkVOYoUw2aOA0XEGpDSCKzVcKkdV9D7P0Kw6zi8SK4IeXnmY9u+MKUFCpIF9HgU2E7SKCl3mTaT6yinpLXnegdKrOMM3PTljM/Cu1HDuOfdLudvAYW3t5/n0V1c34Do1ph7yHyug3SpglkysNAg919eyH8jxCjwClR9nx7q2ZBvs88E6AyC+0wH/pZ3X1W6rrqTPiqEzetK3f8n/XCf07yjrIBa0ck/Ns/+P1q07YzonbNW4NuH3jyV09xuQmgZH7nFhWv3UyGFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NW9ymndXZZ1kA06JY6T4Hx0P9QW7wyO2doedh6OpVV0=;
 b=Z48NFqndawcms6u9wNGh9PK7VhhmxW1Xc3vlyvRNyW2BQeS0mC44+8dkuM9p2LUATP8s5ZWOruazh+5nU2KaHePSwBaAJvYtTtnECI+c3iusx+1nZLw/kp+bk9xt6uz69BNzuU72Zu9ogs9Jf80rXsZGLmnGm+8LErSSWMdKXGiqmXQDP7d1BeQ+JM2af58Mx33o1gKgW/+7vACT3SCtbwI1326NkW08uTpHZ6AO+Utkp8pWHXM8Pk7STm0C0lFPZTXV9xo79XBhxNOSnnlmjz2GCgxhgjnvNE9UlegBB7PN7LvDR+PvHQPNrTnmsKTbGoeMbjKTMhiTIe0GxMZ9yA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GV1PR04MB10821.eurprd04.prod.outlook.com (2603:10a6:150:200::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 10:15:21 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 10:15:20 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Florin Buica <florin.buica@nxp.com>
Subject: [PATCH] hwmon: (ina2xx) make regulator 'vs' support optional
Date: Thu,  3 Apr 2025 13:15:16 +0300
Message-ID: <20250403101516.3047802-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0203.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::10) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GV1PR04MB10821:EE_
X-MS-Office365-Filtering-Correlation-Id: 5acc6dd6-5230-41af-dfc1-08dd72987045
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rm9TbGQ1cU1UU0RQUHUvL2lFUWtLRDZzVzB1TERiNUpLOVBIL21zN2NiRDFP?=
 =?utf-8?B?bitWRUdMT0x3SERMNXJLNlR3d29ZZnQyNll0d1ErMVdzLzNXdjRjdXR3OGp4?=
 =?utf-8?B?L05VMm9aajNzV0FuSXpJRTdMN2Z1Y2xqeWdCZFI1dkRETHhjUHRVS0dDYWQz?=
 =?utf-8?B?djFUVm5NT0dKNm1HRDdiRjZ5bGhveFZWcWJOOTdtSU01ZzdJRS9qMWpmWEZS?=
 =?utf-8?B?UHorVFdnUUVHS1pHM2srYnVZZTZ0bjE4cWtRbVhwSnR4QnBpeXNPbkpzT2Nt?=
 =?utf-8?B?TFZ3Rm1tOW1Sa2JYcis4UU1PN1hITGFVYk1Id243TzZEeCs3eE43MUgzUE5D?=
 =?utf-8?B?YUEyWkRRTVlrTGdxWDZsR053UFhSRVpIa0c2TzBWcnRyNmxPQnpTMlRldnFH?=
 =?utf-8?B?T3RyR2Z0dUwzSGl6c1lpeGQyZFdIQUxSak8zMVBjRWErd0xSUHM3Q2d5bXJP?=
 =?utf-8?B?ZFh4SVJwb081MERDZVFNQ3NRYnY3aUNMK3docWRUQ1NVb0dKY09nWlVIY1cy?=
 =?utf-8?B?c0UvOHR1RFlOeUxYdEdrVkQ4eGE0L2lmZXFDTnpVRkJWcGV3OEloOTdGNmdV?=
 =?utf-8?B?Tm9rQVgwWG9tT1pEMVVKRWxtbExWSGJJMkx2cGNUcEFHSFA1RGNTVnhIbEVS?=
 =?utf-8?B?QWp2SnRSLzVaZmJlaXRDaTdxMWNsRjc2UEthQi9pd0hEVWpPWDNtWG9oRVBs?=
 =?utf-8?B?YkcyN0lYTGZHRm42VzMxY0tOU3puWFNFRGhZUkNZM3kzSTRQNkhaYlVjL3Vu?=
 =?utf-8?B?QmNjNkVkYmVpbWFPSmFiRUlmTmMxY3FZdlVhTmpTeWs5OExqaEdaYjRkTlpN?=
 =?utf-8?B?TmJVcEpZS2dHSXFnb3g3Sk5MTE1WWm1qbmlMZVlsM204TFE2V1ZnejJSTkxt?=
 =?utf-8?B?djhKMGRxMjR5TVc4SlZ1Z0NNV0RGTU5VYndXZnZYUStzZ25XT2c5cDhrbFpZ?=
 =?utf-8?B?YkFxKzdDWWZSL0c2WHJhVGMwWGY1eUFTdFBDdXJQZ1U1VUhLeHNCaHRXSEVC?=
 =?utf-8?B?aWhPdSt1SStTSGJnekJpakFva2tkVHZZbXNFbU9vUkNVRHRzZEtmY25iU1VG?=
 =?utf-8?B?YlVlYUoyeG5QMDM1czFZeWxoSGVtRHYzYXhQaUpOZUlKT0RsMkZvYzNmczc4?=
 =?utf-8?B?WVVsSVBMZXZOTm9FM1lFMlpEUUlsK2p4QjZDRTdwOXRMUW9NZVlYN0xEeWF2?=
 =?utf-8?B?TUpBcVMzdmlzWEFWTGZRRmZtZmlUeXovZEtoTk8xajJ2d3JVdVRpNGRUb1dm?=
 =?utf-8?B?YzdtVjh2ZVRnR3lxQlJ1WHlQdUZHSXkwUWJpRVBOenI1NHJTNFhYRWR1Y1lY?=
 =?utf-8?B?N3ZXYlAzUk5CMVduNG1RaWI0Y09MaitQVHVWUk1sSXlZM2Q2MVlDaHd5UXpo?=
 =?utf-8?B?Q2k0T0tiMWQxTktRL3lweFh3ZFk2RlZkMWlLUHRaQTZwOWQ4S0ZDVUhLWm5K?=
 =?utf-8?B?bDh5UmxsWmU4NlI1VEllcU9YYmNUYUx3VEoxM0Y3TXFsL1p3RDdJUlU3NkNE?=
 =?utf-8?B?NmZBeDJxQXYwRHVhd2o2RVB2QnpFZWlWVnhRN3NxTDI1SVBJMkhBMU1pdVRR?=
 =?utf-8?B?OTl3QXlVMjRPUE9aNjlDdCtFL25PVC9iKzRUMEJQVUgvYitrUldSV2YzcmdX?=
 =?utf-8?B?WTVWQkNLT1YwSnBDM1AzSjgvSEhWZVFZeG1RRkhEM1N4cHR1MUd5enNGNjZw?=
 =?utf-8?B?OEY1c2FxMmluMWh0aHFIQzVDZkJ1UEl5dDJIQXV4Y3lDRE5lZ1pPTk9uczRR?=
 =?utf-8?B?QXpWUzlPNXJ6TWZiK1ZpRElORjI4YThrRFVINUQ1VVkzMUVJcEY5MFFpaklw?=
 =?utf-8?B?V3hSZk9FN1dXMElnVkpvVmRZWHIrL1BIV1Z2M1p4VDA4bWlCZlFmK2JyUEM1?=
 =?utf-8?Q?k8AqX9FdmlLpO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW5ldFlQK0IyQ0hJc2s3T3prbnhhd1MrdGVFcWsrUUNmaFVhbzB1ZXVTQzNk?=
 =?utf-8?B?M1FGNFZ6NXB5LzNkU0JZK1lpTEpIMU5OZkF6Zm1iMU5QOUxVNG9mNTdkTlBX?=
 =?utf-8?B?VHNESUxka3UzWXRueXZ5MkFod2hnbDFqL0w5eXNNY1RmK3V1VjNIcmJBSktH?=
 =?utf-8?B?d09SNHBxYnRIWjBYUUNXWmF1L3AxVTJ2L25Wb0ZUUXF2Q1RvTWRLVHR5cUZh?=
 =?utf-8?B?VTFsYUpvekxXYmxROG45Z1pzaFJPQ3NKNzFDbkJteTFLWlVvblp2bGdySHg2?=
 =?utf-8?B?N1FpMVFXVE40RXQ5eTN1UEozT2d5V0ZObTM0aVczU2RKWHBVOTZEOHFmM3Mr?=
 =?utf-8?B?TmRsZzFpWEJ3NmNNRWFia0R3Q1BqMTVUS2NMbk9zUlJIUjNJd3piTi9ZMlpC?=
 =?utf-8?B?UFIvVWJYUHBuS3NoVVZUZElUYitkb1d6Si8zNFNnbFpRRnFyU1M4aGpzcUc1?=
 =?utf-8?B?SHJ6NDNnaHltUytEZnhoVnhoMS9UMDZ4dHhDcGcwMFJvekpZOTBtWHV2YnFn?=
 =?utf-8?B?QSsxbTVKMm1xUThMWWExKzhKQXZvdU9zRnh0TU5GVXlncjh1ajk0a3hVeVg1?=
 =?utf-8?B?dmpKTzZFMC9xZGVjWFNtblpnbWRnQ0xRY2NUMWZwOUM4eTkwbEFJVlJHVllN?=
 =?utf-8?B?UjhIV1VQYWpDVTVEaWJxYmgvdGR1RWtHbGlXZ2tML1VrRzhjWFlid0lOOE9Q?=
 =?utf-8?B?SWdvNmxCNFBBT1RPMnlRQVp3REZVQk52UFhTekZDUWZzaUdvVGl5cTladjhY?=
 =?utf-8?B?ZUdLc2NOSHJacDdTbWxSNytlY05HbHkzaVNBenBmb3dvMTE5Y2YyNlFGbXBP?=
 =?utf-8?B?NVVyWFlkN0NRWmpvZW90eVJaN1JUZnVhQ09wZmsyZENoempLUmwxZ3lPc3RP?=
 =?utf-8?B?MEl1UFRPZ0U3NFh0TU43eTk1UTBhbnVtNmNyeDdlVGVrUDdvK01yOEtWU1FL?=
 =?utf-8?B?ZFlWKyswcGFPalR3NE51VDR6Z2RGVHZDK1k5WmVhRG9JcS8wR0hOZVczK0NP?=
 =?utf-8?B?ZkxjUXMyc0F2TFcwZmpzSEpaVkI4NDgrN05EeWtLSVhyd2JjQ2hYbHBEbUly?=
 =?utf-8?B?NkpVNzIrSngvRTVTeEJCalZBY2paeW03UFNVQjhBOHM4Y1VzaFh6Z1VsRy83?=
 =?utf-8?B?Rm5QcnpQNDB6blJqZTBFQ0JGUmVxNFZEYTB6QStqWVBqUldDSkNmL1Q3QjM3?=
 =?utf-8?B?eVJ5aWxZem1EU1dDYUlFMVJiYmhvc0NBWGRpeERFTlpkMktJeHhrN0FiTzJO?=
 =?utf-8?B?c2pEeVVlWDhVbGY0Rlg0YlkybWE3SDJmMGx6T0tVck1rQ1JwMk16Ykx6bC9n?=
 =?utf-8?B?b0wvTGt2ZGVvcTR4WTZJcVNHRzdMakRUK1RLZVM4b1JHRmpYWkYrVjBIUmow?=
 =?utf-8?B?RTZGUU9MVmZhMk9NRVZqQVhKT0NpRGNtR20rY084azVyUU9XUUFicFNKVHpB?=
 =?utf-8?B?WEk4M0M3MGZrdlpmUWE3aGJtRXlPMzVjd05Zc0VBa0U2TE44T3NWbjZmaEUw?=
 =?utf-8?B?QldIZkdMa3VZUFpvL1NQR01VRFQ4ak1vN0RaTXZFVFliUFRWOXhHQSszMVBr?=
 =?utf-8?B?VFQzeWJIM3NqdXYvU3F2QlVRT0RyajFDekVlYkxlOHpLWmNZekxSYTdOYmpG?=
 =?utf-8?B?dU1KZDdzUWt3U2k2U01XZkh5UGRtSVFOU2Y4SmVvaEg3SnpTRnZ3YmxYWWxF?=
 =?utf-8?B?TTZ3Y2NjTzFnT2I0ZDNzU1lYSVROVE9jWVlVYlc3MHlyMmdST3hiek1YYjdS?=
 =?utf-8?B?M25xSndieC9LK21zVGpzSDVQZjhXTG5uZWo2dGZ0NWV2WmxDZENOa3FDMHlW?=
 =?utf-8?B?N0wyL0NYb0pRS1pvRlNMSEtvOG9Ia2xoMHFwMEkxSnBMdzlqNEllTDZBZ2Ra?=
 =?utf-8?B?Sk1iaGN1RHZTUzJTQjQ5TmNYcFZEVUszM1loN002ZzE0NFRrK2Z0ZXRlOHR4?=
 =?utf-8?B?d2NhNHNBUEdqNDJZdE94bzJUM2lYUGlBeFdiN0F0U3YvUVV5TFZLK0YwYmlW?=
 =?utf-8?B?M0F5MEhiQTlwWnNtR1hKR0diTk55SUZRM29IbnlSNEthMmUyZGhqVGZrYzZQ?=
 =?utf-8?B?UXdqcDFZODJGOVFaZk9Gb3hZR0xqWlRXUkN3VDRZR2NxVWMyQ1VtMFpmNUJI?=
 =?utf-8?B?dDNuZ1VMQXdqQUFwbysyVjQ0NTcyVmRoaUZXQ0NRK1NQUUdWVE1wVG55cUNa?=
 =?utf-8?B?ZXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5acc6dd6-5230-41af-dfc1-08dd72987045
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 10:15:20.3845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oORq53bmslFcFt6pwWu41JbofsWnp8zAjV1RhFT/FzsdvOG09wwKgIwRkBopSZ9nOw9tfKgbdIhA5QgCMoNGH+16mnStS1GqrH0vCcglMAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10821

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

S32G2/S32G3 based boards which integrate the ina231 sensor do not have a
dedicated voltage regulator.

Co-developed-by: Florin Buica <florin.buica@nxp.com>
Signed-off-by: Florin Buica <florin.buica@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/hwmon/ina2xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 345fe7db9de9..ab4972f94a8c 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -959,8 +959,8 @@ static int ina2xx_probe(struct i2c_client *client)
 		return PTR_ERR(data->regmap);
 	}
 
-	ret = devm_regulator_get_enable(dev, "vs");
-	if (ret)
+	ret = devm_regulator_get_enable_optional(dev, "vs");
+	if (ret < 0 && ret != -ENODEV)
 		return dev_err_probe(dev, ret, "failed to enable vs regulator\n");
 
 	ret = ina2xx_init(dev, data);
-- 
2.45.2


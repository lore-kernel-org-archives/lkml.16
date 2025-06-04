Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023105.outbound.protection.outlook.com [52.101.72.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006F91804A;
	Wed,  4 Jun 2025 07:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749020670; cv=fail; b=gAFYLF6XTgv/5UwwT8LZX4kYckQ9m6XGjtPDOx9hcgubF9Wikk8Hhe76D04OVbjtgykSLDEdCmr1fHaA90mWUKRxRae0WGaLlD0v+2JRPgH8JIzl7L+IjCawofu03v7fWXzIqSaD6YKGYq6Zf1lUMtb3Fl8MU/RbYNEaeVvOBUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749020670; c=relaxed/simple;
	bh=7Z5TMFh4QpcYb/aI2e7nNgXOhJPLOm6l5R6i3YwBIYM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HRUU9rqvQGV2M2h2bpl8q4EDzA/8s6uvD9Cc14b6ffXEKNwVv4eBkTr3dRPZdFcNfItD82Ok85yYUqZC5uDjQhMGXFpOzaCF4lpzIE/TFh97oyvBULoSmsXkkfArlGh1ZQd4p6TaaDbWLo9W0UdPG3la8Pm781Bvib7MZAKI0bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b=l3tch8rr; arc=fail smtp.client-ip=52.101.72.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b="l3tch8rr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPFr4o5dGWapbo8FVDFT4kdeJ9x2C+XYfW2770Zbxxyh+NnoQ99k2CadXKJliT/W6MQCnnmc1pcW8TodS5h2K6blmm6jG0bls2CrwCIE/ZlGvDbariUGkJXlL/TeZVdgsYq1NoG/Gcnu/g87vImXmqhbs+cXQC9q1LlloiKyV5dDEv4t45cOQNvUcBWwn5HZXeyPNWG60svplKXfVPcIt/qvMyi3wBJc79rajDGev3YnaC8poMMSRkiqvDYwV3GzA5QHQKc1WfzVrS8LHmFsTCQsxYWtSJjqv/iA+QtJf28mVU93pioA35Aezp3EHSIp5gWMJvZXhiun7JHGgOSI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XrIezF8bIHjYX0Une4NF4BKYYnioKYRKIGt/lgiN8s=;
 b=swNMjl0/n80PKrpRhPVWbuwMb/krP1QbjGI20bACzVaqT1Xd+jUMssJ4M7TB8apYZ2XW+egwgvOmLZa3nGfX55jFGbvAZZq0to9M1Igr2s8xlLPIH8OlaHtr3oZhnGYpp9/Bqj7Mlr9RHqoydOQImMvIY6JGDLl3QGfZFYLUZXM1+vYckXNAIl0L1CfjXR48lExmjS/f1952u5g4+RedntcbqB1LEtEzfbM5bosJVq3iX11FJBHg2JR6w6iylRXqRgtTwViAj+5jZoIabnD1ZrjcXUFRlPmzzRe2OtM9fnwiXe9kAWehPg8hAwrVxj92pHlAFC4oyCXOMH6ARYCtVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prodrive-technologies.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XrIezF8bIHjYX0Une4NF4BKYYnioKYRKIGt/lgiN8s=;
 b=l3tch8rrl5Tmm+l7lAATLT2NvLmaJpMGygp365K331IqQbIQUVni2qcjfSdIUZ4/BLCn2sJesPV25vQT8ZRmWIlI/ibfJ4R/0b6Ne1fScfGnzjsGDxx/ryptv4iKELQfpcDS+L8Em65yxWlaCgG1Acsr70jsdLHUA0Xg8SwNgA8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prodrive-technologies.com;
Received: from AS8PR02MB9532.eurprd02.prod.outlook.com (2603:10a6:20b:5a8::17)
 by PAXPR02MB7312.eurprd02.prod.outlook.com (2603:10a6:102:1cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 07:04:22 +0000
Received: from AS8PR02MB9532.eurprd02.prod.outlook.com
 ([fe80::4636:d263:14f1:bced]) by AS8PR02MB9532.eurprd02.prod.outlook.com
 ([fe80::4636:d263:14f1:bced%4]) with mapi id 15.20.8792.026; Wed, 4 Jun 2025
 07:04:22 +0000
Message-ID: <aced65a2-937e-494d-a3bd-aa9b295f73b7@prodrive-technologies.com>
Date: Wed, 4 Jun 2025 09:04:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: add pca9450: Add
 regulator-allowed-modes
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250525071823.819342-1-martijn.de.gouw@prodrive-technologies.com>
Content-Language: en-US
From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
In-Reply-To: <20250525071823.819342-1-martijn.de.gouw@prodrive-technologies.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0046.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::6) To AS8PR02MB9532.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a8::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9532:EE_|PAXPR02MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 503e525c-de07-4a9e-2940-08dda336085d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVhIWWhKVTZVUXJFampKMXZOeFpnRnBMYUFPTnRpUWFBcURwVmRodWJ2anRO?=
 =?utf-8?B?aENCQzM4blRXNmRlS0liZXlDZDczenRPVVBHSmVYMytSR3B0RnFKZ1ViSHoz?=
 =?utf-8?B?b3czRzM3YkkwYUl2akNvMjM4U25OTVpuOGh4YWtqajNuOUNKeFNDazluN2lo?=
 =?utf-8?B?N1NVSU5oUnpoU3FtMnhCZ25Sejh4VnIrNFl6cjMycm50OVdpYS94OVd5eHVa?=
 =?utf-8?B?aG5oZlFPVHlvdnZMSTFoVVpuUkY3STRYSzgyZGhlOWl6SWwybmdPTXlZcWFB?=
 =?utf-8?B?ZmhGZGVseWhwOXhoQnBNb1c1WEF2c2lwNHoxU2tUbFlZRzhIbjdjQXc4SmdP?=
 =?utf-8?B?TGdzNW9NWUQwa3lZbzNMejl3OVdseTVxUFRnWFF3NkJnQysxdGVTV1RsUXVj?=
 =?utf-8?B?R0hkTE82TG1yREszVTloQTZ1Yi9wL0dVUElzcEFQVXJXMlhLcUNRQ3FjcjVW?=
 =?utf-8?B?d1I1bDFiRGJKYktyWmYzZnZaMjg0cTdHSEVrMTRXdStHdk93NUpkU1UxYjdm?=
 =?utf-8?B?ZU9CaHBEa01MRGpWTW4wTXpqbklpR0c1cVNSNFZJcWsrOWZVZWhBM2ExYmdz?=
 =?utf-8?B?MG96SzY1RHM2cEJTaW9oMU9GZTVoR2dYa0pLMXFsU0tad2ZqVDk3R2w4dEFO?=
 =?utf-8?B?dU1oOUhRMnlIaXphNlgwcEpmR1lmdGoyTEZEUmZqMWlMSGF2VlVuS2NVZmZO?=
 =?utf-8?B?VjBMZjRsSjI0dmxJK2ZUSkloNlh6eGpLUi80akRXU0J0c21Yb0h1eE1FMk5R?=
 =?utf-8?B?RFEzZkc5RGxua1BqNTdmSjRtWXY3aTZScTZVWkQ3a3FQemJQdm0vS1kyVUhu?=
 =?utf-8?B?YXc4RERYUjRjeWM4MjBFalEza1duMEtvV0pPeXhpNTNqUDdKbXowRkZDM2RZ?=
 =?utf-8?B?bm8zOXgvM2pUTlF1SStsWVNaUnVGQ2hibjF1a3hpcThUUDI4eVZpSkhmS1BO?=
 =?utf-8?B?NXgvY0JPemdjRnhrdWdVcHlidk52Kyt3SWhaWXA0TzJvN1BYU0dKT2p0WmhX?=
 =?utf-8?B?OUI5ZlREN1FiSmI5SVo0WTdMclBwK3lsR09HemlYMVVaSEkvcDU5K3lDbGJW?=
 =?utf-8?B?N3RBVXJIUG9zUWg0WjlpTDVGTm9IU2lKTHR6MlYyRlFDZEVTanpSbEF1OXhX?=
 =?utf-8?B?UnlQZGZ3NFFoR0IzaTJQL0ZMOWllYVVlVEp2djhtcmNvZ3JLOVMxd3ZwNWg0?=
 =?utf-8?B?akordVFBS1RJcDhwWlVMNHVCT1Nka3M4YXp2Y2RqZGJ4UmFSNnhiU3JXWktP?=
 =?utf-8?B?VVRxUHBVWnBDL0RnNjJWS2hBR1VFWEExaWNPRWoxempEMHVWYzJ5OGlGbEl3?=
 =?utf-8?B?MHN3L1oyNDhsUFoySGV0NVlJR00vTlB1ZGJvTlBJQzk1dnBXUXlVVGhkeTdr?=
 =?utf-8?B?UEVyTXp0Z1NHa29nTGNKNjJ1aVc3MDZFT1JTQmhJU3k1SGhEVzc4MTZDMERL?=
 =?utf-8?B?YlkzMHVBaU9SRzFkSDB6MlJqMDdpbkl2OHVSOW80ZUhINVRHQzZmcXRUZ3Vt?=
 =?utf-8?B?TVVpUE9RdzRxTlMycG0xQ0swZGgvZitDMS9lY1J3OUNYR3VFUjVaeks4ejRQ?=
 =?utf-8?B?SkYyenBIQzhFbld4Z1laOGdncERuaWdmNjNTWnlmVDd6SFd4QVhBY2ZkTDU3?=
 =?utf-8?B?TW5vNlQ0UHA4ZHVrNllBd3NCOVNVSTVEMVcyYWhTTG9PSWJlTlRpemduM0xR?=
 =?utf-8?B?UjVpUnZPWEEvbDUrVTlYWEN5c3pTU1VqUmNwQlZkdENQZGtIK3NjblVkbS9K?=
 =?utf-8?B?TENtamE0c3UwOHJrZXRtMkJGN3VmWlNzaExwZ3RZOVRONUJtRGxxaVkrbDE0?=
 =?utf-8?B?NWdWVldlRW5xa1ZzaElKOUs4SWV5TEdNMGQ1Nm04LzRaU3BQbHhRbXYzMnFG?=
 =?utf-8?B?RzNVY3B0ZmQwSzNGUkM0b0RuUkk3YVUxSHVHSlk0QlpVQzlVbktlWlpjM3FB?=
 =?utf-8?Q?kv3tTgxoCYs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9532.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmRRMjB2WkpmU1FuMjNFWUZCNEs4OHBPTjRXWWRQTTUxbVJrNnhRM0l3dy9Q?=
 =?utf-8?B?MGRaQ2o3TU5qSGlwVlk0dDRkMUllMVJvMHU2Ty9IU1V3NW84UGRkanpRcy9j?=
 =?utf-8?B?clg5czhKOXMrUG5KYmxqVFlQZmRFMnNveERJOUpkSjBwcTkxeVphdmNRNFhU?=
 =?utf-8?B?SGhYLzR4OTdIUUpIazV5NGlyYWt2VnFEZC91eXUySFVFUWpWcEtHMmVEckR3?=
 =?utf-8?B?ZU1TVnlpdUJMNzNmVmlyNDByME1uK2x1dGp2Ri9PeHgzYzVBZVFod1N4MUt0?=
 =?utf-8?B?WUhmVGEyTG9IbnprbkRmVjRXRmVrOVh3d1l4cTdnY1pRVVZ5cDhuTE5jb3Za?=
 =?utf-8?B?WS9GVWlOdHhYVTBsYUNFSFlOd1BFV2JhOE9razN4aXN2TlZKaGtkV0lSVWRx?=
 =?utf-8?B?aEw5aFYvSHQwcFdlL0JmdlkwaXZ0THlBTHNhTVVGK0t2ejltajNhUzlGckx6?=
 =?utf-8?B?cDNtd0VKbXUyWnBra094LzNtSTFwNWN0UkMrcVJCY2JZdHhLbmFoeWozMGxr?=
 =?utf-8?B?MlF2Z1pYaDBxRXh0cUJ3U0tDM1VZVkxYbVNob3pXV281REYwSGJSRlpsVjAw?=
 =?utf-8?B?djR5OHk2dldQRDZiUU56N1FFSzBIMHV6a1dGUUZBeEZOcUhYSE1TeVNLeVg4?=
 =?utf-8?B?eTN1VlR5STQ2MHpsSTBzdXBRTmJuYkMvaVVnTlRyNngraGpZZFk2YTNMcnIz?=
 =?utf-8?B?a1ErWHRhM2JzdWVrU2VyK0M1OXA3OFJSMGhKbEliTzV5THNNNzRUaFg1Ynd2?=
 =?utf-8?B?bmFmSkdnMGd5VW5LUGtyZ0k5OUZUUEpWMXZaMmFwNkoxdk4zcTY5Vk5oV3pI?=
 =?utf-8?B?NFZsWWNURURKVDgvQjNhSGZpditlUDRRYUdCR2F2Q0l2QmlNVFM2ZVArOXNQ?=
 =?utf-8?B?dkhuKzJ2RUF4MnhoczhpMmpaZDY2dk4vSzZTSUxkREo5MlRVZ2JmTUh4bk85?=
 =?utf-8?B?WXJKMjBUMzZtNE1aN0h1OGgxdGxDTXc0Y3dKN3piTGtwR2lIc1JWeTVFTCs5?=
 =?utf-8?B?czUrSW9Ga01Fbyt2clZXc0dYcXpJTWJXcXB3OXltaEpUYU1vM1VOQ2wxQUhL?=
 =?utf-8?B?RjZjZUZOYnppdEcyeEhTK3NmenZPYlBtVEZZV2pTYndIWU52Q25xRWxzaXNn?=
 =?utf-8?B?cWY4azU5WG5zejdBdXM4UzVZMGE1MHdqRENUei9sVUVneGVpVWJqWCs5YkRa?=
 =?utf-8?B?UlZhOWJlWnBQeVRNdDJjb2dkTERHNHBFcU9jVXphR1kxaUo3R3NpN0J3Y1J6?=
 =?utf-8?B?YjFXeURLQ3VrYUg2M3VJYnpNUExLNG9uUU8rV0lHa0dNNlpPUDJNMldPUXp3?=
 =?utf-8?B?aVdBVy9NNkxnZDBtUWpCRnU0YmVMMkZGTzhueC95ZlM1dm1pbVpXelJ1ay84?=
 =?utf-8?B?NzRDUVFXayswYXM2SXBMMzUwRzk0c1FIeFNqMFJ0TkxRdytqVU9FYlZkeWRV?=
 =?utf-8?B?UGszSFdBQW5WRGFyUlRjYXpGNUszVTBHb2pBZlQyNFlCeTcvYjFBUGwrVTVZ?=
 =?utf-8?B?Rll3UlNoaHBNTkNDdFZuWHhFNll6MjM1Uzd5MDhxSUQ5cmtyWk13UWhHenhm?=
 =?utf-8?B?RjRRMlhDZjh3eDZJenZHdFk3NytEc2llRTJxVk1oVDVqVUQya0NKNzBJcDNY?=
 =?utf-8?B?ZnRVSmN5M1JsY3Awd1NCTkNSdFR2OFFqV3dyeXZ4bzJLNVBCUHVEQWtVVTlI?=
 =?utf-8?B?cERzS3ZHcDNvdU9CejB3eEsydXlJQzlGcUV4WUVQWksrWlZFaVFYNjNnYmxq?=
 =?utf-8?B?a2ZDc2IrZXlmUUxDRnQ1Y0QxTmcwUWdwMlBZTVEyaHpCMHBBU2NJVXpjRGly?=
 =?utf-8?B?TDhqRGZVYndCNTZnTzloeVF2MEowck9pQmdsUlhPc0pQRXRUdDRnZlZGeEE2?=
 =?utf-8?B?aEt5a0ZYTUtuSER2dUtCWEw2WWFhUmhMcGdhc3pqZkRGRFY2QWFIV2htVnZE?=
 =?utf-8?B?MlRCREdodUIvNUQ5bWtJMXF5RFRlMzhRV2FJd0NSK3drZkJ0S2ZYNFBUS056?=
 =?utf-8?B?R3d0OWxLNGJkVVluUHdVTTdySlVsVk44eVlIeVhXSEZYaEtpeHF5dVZCRmJv?=
 =?utf-8?B?TzlieGQ3cXZWSFpjaHNUY3VhUWpJeWNJWVJxS0J6LzlYQjgwMmRhZ1ZHa0Nv?=
 =?utf-8?B?d1BIVkZkVWVWRFVDbUptdnEvRVJWWDBHZVRHK2V3dEU3cEJaVnFyd2hGcVpy?=
 =?utf-8?Q?0TXylmNszBWRhSp/FLgmUXw35fswjgglYe07DP+a8WYa?=
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 503e525c-de07-4a9e-2940-08dda336085d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9532.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 07:04:22.2215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0Di9Sz4mC4b+dkqZad71ra2JpNjerKfMQEQc+1fbszve1gKW8q3W+CYXw1x3l/iIOGidKOHKkZun+mCeKDorzscDjczps7J1TZ1SKyLdLpiW3gN1Lhiyy9BNE4w9AOY6aUAiRrPTtY4hePSGiUTqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7312

Hi,

On 5/25/2025 9:18 AM, Martijn de Gouw wrote:
> Make the PWM mode on the buck controllers configurable from devicetree.
> Some boards require forced PWM mode to keep the supply ripple within
> acceptable limits under light load conditions.
> 
> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
> ---
> Changes in v3:
>   - Fix typo in the examples
> Changes in v2:
>   - Add the header to the binding patch
>   - Improve commit message
> 
>  .../regulator/nxp,pca9450-regulator.yaml       | 14 ++++++++++++++
>  .../regulator/nxp,pca9450-regulator.h          | 18 ++++++++++++++++++
>  2 files changed, 32 insertions(+)

Does this patch need additional changes?

Regards, Martijn

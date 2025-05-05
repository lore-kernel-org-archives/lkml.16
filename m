Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11022132.outbound.protection.outlook.com [40.107.200.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A872741CF
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 21:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746481179; cv=fail; b=oUVeY1nTBWoTwse2exdum2NBaC50Zb32RkBL0UhCemwhAEncGYuaYL+Y5/O4hO9cnVNPN0iNwCskvKJRM4+BMQsKySFuQFC52gWjUWtp/mwzQEeX3aWEqkJDNBdXJpiTTyq1Cxn2hp8nbycC9pD694ns4VCgbt002WKnXsJKvEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746481179; c=relaxed/simple;
	bh=gKRSSRAHYd3UvJU6c++y6JHX1ZrIj1zpZ/voQZa7reQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FaZT94G1Jmn3QEELuuKpUjb+WDqtkSlQ0wSH8h0D3vKd6SRS4kEFlXF9rymmuIzqaMCq9UgwCy7an6WrlIcmOUXH1zixNa6k3G9OV3X7vEPQUpF3BrxCDTooOIBtjC8uPHnfbw8hvXMkfqkcNchvO8HEEqkrsy96GTLZcXkYnxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=YPw3iZ1Q; arc=fail smtp.client-ip=40.107.200.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="YPw3iZ1Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVzGtowRhCQKBgZSQ3WiiWT/Lo5rA1/p1wN0IPEIKy9W0BmGY1ET5uHG1QpjwjaE+YSiSZSXBal5e5wEgP8IsROXTiR+S9W5ZYc6jJVB+djj/d2zDo2C5C4GyTleR8zJoy5KCqQNFrq9A0pvn8wjsZl2ZETI+X2OFay71dCYfVOqqfv+GotWnNBHb/p0grPiQ40BpFAHLSzbiwgEPTUdTELVj9INMaTr+RtIMMBx2JJ3TZr8u8uI97lB3WVDf6nP1ekWme1pImmhkTfTuGR6U5kNzP0tiFpppFjsd24ZOxVPxCPcPXneaG9OUi+iAciUS404H6CWjrLiZsu8bvZzwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yQLnDiJGPakDDRFDqJqVA4lfQMEbVS5+iiD7l8V6UM=;
 b=wZGUtq5zxDLTUcUyWk8aW2z+O++kVWh3lKg5JuCuT0cWjfGGfaOIAIdeCn9x9siqsSVMr0vl7Chh+uEZMF3AL12ogL2ktVtXrqHefdJubIefQCVoZFZtXrXT1PzbMlMNfMw94/JSevY7kcmuyMQtrIzjhR+QkPJH6LCcqHxcGR6rVuyphHA6KgyqX6p4QFghT+Ah/eL5vkinOqnWEopzaUH+J99BYpWOcg1kYVrM+n5KoUa0Ziz4p+QW8yt/Rd9vbW+3hTZ0yZ658XqUh7qKeUdrKP4fPqWr6Ij1eW4HdAjvOfIzZ0qsaoBHVD7Ml4ehEI/ZgVl02V+YGSSqeV/R9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yQLnDiJGPakDDRFDqJqVA4lfQMEbVS5+iiD7l8V6UM=;
 b=YPw3iZ1QSqhdQZBATcd5ltr6+LsV/iOBsU3Z8waZ4WLZVUJDsfKZw3eZx2OYQ4WsmKj69rMSxeYjBLZbZUSxNm6fng/mkTRJROSE4TurrPzMMeaiatXG7KO1Kh7NA9OqUMV9onw2s2XAtHZb7EZnYqsEeowg4VpKgDS5+SlW++k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 DM4PR01MB7764.prod.exchangelabs.com (2603:10b6:8:6b::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20; Mon, 5 May 2025 21:39:31 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 21:39:31 +0000
Message-ID: <2ab5f65c-b9dc-471c-9b61-70d765af285e@os.amperecomputing.com>
Date: Mon, 5 May 2025 14:39:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dev Jain <dev.jain@arm.com>
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <3750d3f8-17c6-4bb8-8107-215d442e4ec3@os.amperecomputing.com>
 <2fb974bb-1470-4a5f-90d5-97456140c98f@arm.com>
 <22b53cff-00db-48f1-b1e8-b11a54ebb147@os.amperecomputing.com>
 <4794885d-2e17-4bd8-bdf3-8ac37047e8ee@os.amperecomputing.com>
 <5c6d9706-7684-4288-b630-c60b3766b13f@arm.com>
 <4d02978c-03c0-48fe-84eb-0f3fa0c54fea@os.amperecomputing.com>
 <912c3126-8ba7-4c3a-b168-438f92e89217@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <912c3126-8ba7-4c3a-b168-438f92e89217@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:332::6) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|DM4PR01MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: d749b34b-b315-4043-8792-08dd8c1d51ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUNqOGNJOTAyQkxUTnBDeTFOVTZqQVF5S0Roem9GNDhBbnprd3pBbjNseDFX?=
 =?utf-8?B?aUVnd0pqVURzV0hUMjJFU01BTmZvS0FrbzlDcmhTSENoR09PbDdSZnlBRW53?=
 =?utf-8?B?QzAwaFlUMUp4UkNnYUxJNEpvNjhxREYrcDlXT1ZpKzVQWjNycldwOU80RFNB?=
 =?utf-8?B?S2VWUi9EdXFZaTQ0WXU5OFVrSDB5TktrWVJydTVlTWpocHp3YnZHVHNiS3lj?=
 =?utf-8?B?b214bGV1RXRjeFY4TjR1cUl1Tm9OUE9NRFF2d0ZCTHYxdlVRZFc0RVZoWWFi?=
 =?utf-8?B?YS83djR6N0xTYjBhaWYzc3lEYWNuZ3h1Y1ppeGszdVNidWE0SW9ON1BxRHhP?=
 =?utf-8?B?SHNhbUoxWmJnMmxWYmkrOTZmaVBoRmNyWHlGUWVQSVRpUmhKZ2Y4MTJhSW8z?=
 =?utf-8?B?Rk1EeDFma3JFQ1dhWm91WWxLWmVkcmdyQjdNUlFCVjBjU3ErY2VzdDdKbG5M?=
 =?utf-8?B?RmwzdktQUUtrRno4bis4RS9za3Y0VndNTVowSUQ5QlNsY2VlZXEyYURPUDQz?=
 =?utf-8?B?ZVBTYW55bm5XUEMrMEVVTFJnZ0w5RUl3SnFXT3ZwZTRuZUVKaUhhaUtCUUpn?=
 =?utf-8?B?bEtQekJiRzU1VGtEL2NPT2pmalRVa2UzQTBsU0xWNm5DUThUQmNqc056T29L?=
 =?utf-8?B?TFYzbjA3cjNScDQ2TGt2Vy9kVzAzWE5FNTBWbmRCMHVXQjRmbE5QN004dlhQ?=
 =?utf-8?B?RFFjRE5lMHVyTzVNMGhqUWU0elQ5ZnlpWHRaZzIwcE9YaFFVMkRpUVAreWc0?=
 =?utf-8?B?K1hUZGszeldyNWczdnpoc05WWVY5ZGRNb1RzQkN3ZkEwT1B2ZEx2d3JZamwy?=
 =?utf-8?B?anhJbnNtMGQvR1BrTXBnbEVhZGpaaWlUc04xek9LdnNra3lkTXJoUVI0WnZt?=
 =?utf-8?B?b1dkOXNRV3lyUS8xZEFiZkRkNW5yYmp2bVM4QU9xRVd5ZjlXZ25lTUNvU2ZY?=
 =?utf-8?B?dHc1SzlWb0ZXa0xtNWU4dUxITVFDT1ZaZzFaKzRjU3ordFgrSVl2Z201ci90?=
 =?utf-8?B?NWJFQWVLcXBOcWg1eG5sV3ZuWnp6VHRNS0ZVUkY1VVYyMEJOK3QxZG1Gc080?=
 =?utf-8?B?N0xXS1pUVjcvUC85blFpMkV3a0MwM3BxOTRjT0l5TGxVU2JqK01lQ1FkYTQz?=
 =?utf-8?B?Rjk0blJxUEJTWkZJcklRaW5TZzNWVUh6b2xMTGdpWGJoVW5oNmV3a0NNUFpu?=
 =?utf-8?B?QVJIWERjQ09McVQ5WTVkY1YzQlE1b3hWRWhrM04vM1E5QXZCbkoweWZHRkZP?=
 =?utf-8?B?L0loNUpHdElzeVN4ZFFYY1dneEVIUng4UUpmYXkzbFVzV2NiMCtrTkQ5MWpY?=
 =?utf-8?B?THVOU29qNThDbTB0V0FoaWNza1h3WDB1ME03Q0E4YXFmbDBmVVJnTXE1bUlR?=
 =?utf-8?B?eDdsWUVTN3FCS1FzVlNBcXVWTzJkUVExMExYdUhmcnFiUVRvVGtYNmhoVXpS?=
 =?utf-8?B?QkQ2dkpHcnlMM0JEN0d4KzZQakZMOThzTFordERQVUpQMGhNZnFMVUpreHhx?=
 =?utf-8?B?MkZGbUlvcHk0NEJpNmQ3ZUw4ckp6ZE9LQTk1NWRZcUluRzhrU3RtTlc0cTBS?=
 =?utf-8?B?Q2lsTG9VT0JyckRsRC8xVWIzdTJ4a1JLV3ZsaEE4d0VUMjMxMk1DU3p1Z2lF?=
 =?utf-8?B?TXl3OWJOTURQZ3o1djJRRW9PQ2tjMXY4LzZyMi9wOHZnenJiQVhSbllRaE5H?=
 =?utf-8?B?T055WDNEUDdHaTdDcTBjdXpYTE1tdTRkL1c4MzhScFJ5cU1qaUFxYmRhQ3d3?=
 =?utf-8?B?VmJSVEtEQTNQWjB2c0lUU1gwRnNBdWtyL1dkV0RsMllGYTF3c043RXRaRCtY?=
 =?utf-8?Q?Ze4AeiIdl2+7SjEwlUs7Nq7Jp+hMoMb5cdn0U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dERzVnhGaGRWbFk4RU5QWVBsR1VybXdEWGFqMlpXcmZLaHdyd1hnc1hPK1ll?=
 =?utf-8?B?YnpxKzNHVytMME5ITzRjSmtHTGVEOUc2ZitpNC9yN0Y1QmdVcTRYVzRQMlRB?=
 =?utf-8?B?NHh1OCtOckdIZG52aUlROUZWWHlhOEUvcUIrNm9TKzA0NnhGTUtGQWRuZE1t?=
 =?utf-8?B?c21MVUxZM3lFdmFidm1tMVM1TzIvclhtRFZ4MjBpUkpsaTFES2VRTStYUEw1?=
 =?utf-8?B?eExwaE5zbE5xZDBNaEpCcVVuWUlmNTB1MGlTY3c1OCsxVlF4eE55S0xpcFJM?=
 =?utf-8?B?L0RnQXVDL1EvLy9ubTZ2am16SitUQXJoelNidWxJZzVrelBLMDRTWHN2Y1k2?=
 =?utf-8?B?WUtiRXlycFhWeEVycTR3QUdLbG5udDQvSGFXOFRoalNFNzN5WE45M0RSVHA1?=
 =?utf-8?B?eWlaN2pvMVNsTUxoblFVQ2VDNVM4WXhHMEIvQjk3KzZWNVFYSTdudllIQXRm?=
 =?utf-8?B?eXRNNmNQWHNIeFdLa0hOWFZIYjhNUXNVbTJIZVg1cFdSdzNLQVpsTzBlaHRy?=
 =?utf-8?B?WVRNOXExZ1J3b09DbUI3d3lrRFV5VVVyL2EybEhXVUtTSGRSK2E1SkJNcHF1?=
 =?utf-8?B?NmdTQ283U3dPakg1Y3UreWZnOHg1dmxmLzlqSzdZdjZwL2ZqcVk5VEVDRXM5?=
 =?utf-8?B?QXZBbmVsTXR0N2xaRUU0dVBoaTJ0WmUwOUFrN2ZEOWVCaWpyZHBuTkVuMCt0?=
 =?utf-8?B?THRJNEpPVXdLL3pEV1QrN1hPaENPbjMvb0U5NEtHMU4zN3ZCcW1ySlBRKzFm?=
 =?utf-8?B?RG1YWEhBU0Y5UW9JUlZTYzI4QktnSHdzQ2RmSy9MdHdoZ3hZRVRVaERiMm1N?=
 =?utf-8?B?cHRrc3p2NkovNkZoeEw0TUp0MDJNM0dVckFLOGNuNmtJcDl4d1ZwMSs0TkJD?=
 =?utf-8?B?TWlmbHBzZVZNdG83SFlqNU03dWhsaW9HdmVzUFFMWmhJVmFMT2NzVzJGQ05M?=
 =?utf-8?B?bm13UVZmdThTZUpvK251dzZZdDQ1M3FGU3lyNFc5R3AvbGZXZTgzM28zeGFH?=
 =?utf-8?B?dmFEdmlxK0d5RmNlcjhaWTI0a1VtMXVhcWFXbFB4ZVVCNjN4aDFueDZDNmVV?=
 =?utf-8?B?WThCM3Myb2o0QUVsNXR1RFRpeENWc0hVemtiOUUrNGdlRU5CQWptNUVSWWt1?=
 =?utf-8?B?eHVpRk1BVXlkdjZ1WDN4ejRmVkRxdERWVlExd0tDMkpVRGxIUVB0TGtUQnZq?=
 =?utf-8?B?S3EvQ240VzJSNFFFL2hmay9sN2lLRXRIVFRpT0xyekdsOWp5WE1RR0JMN1Vp?=
 =?utf-8?B?WkJjc0dLZ2ZLckwwTU5lR3VnME0zM0RnY29XckZ5QVA0SnJvL0s0ZWY0enhG?=
 =?utf-8?B?dHRXQkt2MWZ4WkQ4NGNEQlY0QkplTE1IUHp0VnJZNHVYZFlUTTBaK1dZSFIw?=
 =?utf-8?B?ZG5ObEFVeG80RjVsb1l3WnkwcGwxRlFsZXB5a1BqSUNZUnFYRDBuWG1KaGVC?=
 =?utf-8?B?VmhVeHp0ejNkeDVlOVhSK1VpcWk5K2NWejJmQWd3Ni9sSWQ0ZG9pRjIvQ0hE?=
 =?utf-8?B?MmE1Nkc4ZkRtUXlidFRZZ3hjcGYyampwUDVSZ0JqQlhQb3VoRlVLTUdwNlBx?=
 =?utf-8?B?SnJ0cE02T3paTjJmTTlGZUI1bDZrTjV4ZjU2dVpZN3RkRFY5dHNySUZGNkNJ?=
 =?utf-8?B?aXFRbjdBS3VCcE5manBWajdWMUFwbHJBTDVHSktxNGMxZTUxZDJmK1htVGda?=
 =?utf-8?B?YktDQVViSllneEtLZ0dLSHdSUFR2ajVtd2MwenZCWjEyKzVvYVIzdHJoaXdZ?=
 =?utf-8?B?bklZdUcwelhTY2lNaStaN2EzbGhjTVMveFhibnlndXk4c04xRkN2SW5MMHRL?=
 =?utf-8?B?ckFVSGp6eCsvNDd1WmR3aTY0R1VnRFVFZmc5VHNtcEtuVEc3ZmhzY2daR3BZ?=
 =?utf-8?B?T2srR05RZ21tOEJuYzUrM28yKzFRYVliNnJIRzRScE1xNzlqb3VRVUY3eUIz?=
 =?utf-8?B?bHBTVmN0RVJaVjBURjVWWFIyeWF0L3l4a0Y2VEFDUStFVVpnU0VxRVlQYVFy?=
 =?utf-8?B?T2c3NDJrcVRiOFdaZ0Nkd2V0azEvRlowVkQ2cUtmblRWbDlqbk1JUUkxeWVV?=
 =?utf-8?B?Z094SFFCSForUzNTZGpCYzdzcUlUWUFhcytkNVdHZk4wUVhyWEREWHhjTjhV?=
 =?utf-8?B?MVhSVGpMTlNPRTkvUmpGWUtiYlVvL2dTTDJkRmpHcjIzV2JUQWU1d0N4VFNl?=
 =?utf-8?Q?Jnd+34CSRd8EvZ31A7huCUQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d749b34b-b315-4043-8792-08dd8c1d51ee
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 21:39:31.5343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dY9ssDq1ml4WTv9GQ1+m7r++b5PwqsMjaa3dr+NVidIo+ry6oXOoXbSPJMXkAU1yI9zSs0yko4OmW3yXEJ3JMBkKTXfRkhU45oLXmSy85Fg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR01MB7764



On 5/2/25 4:51 AM, Ryan Roberts wrote:
> On 14/04/2025 22:24, Yang Shi wrote:
>>
>> On 4/14/25 6:03 AM, Ryan Roberts wrote:
>>> On 10/04/2025 23:00, Yang Shi wrote:
>>>> Hi Ryan,
>>>>
>>>> I know you may have a lot of things to follow up after LSF/MM. Just gently ping,
>>>> hopefully we can resume the review soon.
>>> Hi, I'm out on holiday at the moment, returning on the 22nd April. But I'm very
>>> keen to move this series forward so will come back to you next week. (although
>>> TBH, I thought I was waiting for you to respond to me... :-| )
>>>
>>> FWIW, having thought about it a bit more, I think some of the suggestions I
>>> previously made may not have been quite right, but I'll elaborate next week. I'm
>>> keen to build a pgtable splitting primitive here that we can reuse with vmalloc
>>> as well to enable huge mappings by default with vmalloc too.
>> Sounds good. I think the patches can support splitting vmalloc page table too.
>> Anyway we can discuss more after you are back. Enjoy your holiday.
> Hi Yang,
>
> Sorry I've taken so long to get back to you. Here's what I'm currently thinking:
> I'd eventually like to get to the point where the linear map and most vmalloc
> memory is mapped using the largest possible mapping granularity (i.e. block
> mappings at PUD/PMD, and contiguous mappings at PMD/PTE level).
>
> vmalloc has history with trying to do huge mappings by default; it ended up
> having to be turned into an opt-in feature (instead of the original opt-out
> approach) because there were problems with some parts of the kernel expecting
> page mappings. I think we might be able to overcome those issues on arm64 with
> BBML2.
>
> arm64 can already support vmalloc PUD and PMD block mappings, and I have a
> series (that should make v6.16) that enables contiguous PTE mappings in vmalloc
> too. But these are currently limited to when VM_ALLOW_HUGE is specified. To be
> able to use that by default, we need to be able to change permissions on
> sub-regions of an allocation, which is where BBML2 and your series come in.
> (there may be other things we need to solve as well; TBD).
>
> I think the key thing we need is a function that can take a page-aligned kernel
> VA, will walk to the leaf entry for that VA and if the VA is in the middle of
> the leaf entry, it will split it so that the VA is now on a boundary. This will
> work for PUD/PMD block entries and contiguous-PMD/contiguous-PTE entries. The
> function can assume BBML2 is present. And it will return 0 on success, -EINVAL
> if the VA is not mapped or -ENOMEM if it couldn't allocate a pgtable to perform
> the split.

OK, the v3 patches already handled page table allocation failure with 
returning -ENOMEM and BUG_ON if it is not mapped because kernel assumes 
linear mapping should be always present. It is easy to return -EINVAL 
instead of BUG_ON. However I'm wondering what usecases you are thinking 
about? Splitting vmalloc area may run into unmapped VA?

>
> Then we can use that primitive on the start and end address of any range for
> which we need exact mapping boundaries (e.g. when changing permissions on part
> of linear map or vmalloc allocation, when freeing part of a vmalloc allocation,
> etc). This way we only split enough to ensure the boundaries are precise, and
> keep larger mappings inside the range.

Yeah, makes sense to me.

>
> Next we need to reimplement __change_memory_common() to not use
> apply_to_page_range(), because that assumes page mappings only. Dev Jain has
> been working on a series that converts this to use walk_page_range_novma() so
> that we can change permissions on the block/contig entries too. That's not
> posted publicly yet, but it's not huge so I'll ask if he is comfortable with
> posting an RFC early next week.

OK, so the new __change_memory_common() will change the permission of 
page table, right? If I remember correctly, you suggested change 
permissions in __create_pgd_mapping_locked() for v3. So I can disregard it?

The current code assumes the address range passed in by 
change_memory_common() is *NOT* physically contiguous so 
__change_memory_common() handles page table permission on page basis. 
I'm supposed Dev's patches will handle this then my patch can safely 
assume the linear mapping address range for splitting is physically 
contiguous too otherwise I can't keep large mappings inside the range. 
Splitting vmalloc area doesn't need to worry about this.

>
> You'll still need to repaint the whole linear map with page mappings for the
> case !BBML2 case, but I'm hoping __create_pgd_mapping_locked() (potentially with
> minor modifications?) can do that repainting on the live mappings; similar to
> how you are doing it in v3.

Yes, when repainting I need to split the page table all the way down to 
PTE level. A simple flag should be good enough to tell 
__create_pgd_mapping_locked() do the right thing off the top of my head.

>
> Miko's BBML2 series should hopefully get imminently queued for v6.16.

Great! Anyway my series is based on his advertising BBML2 patch.

>
> So in summary, what I'm asking for your large block mapping the linear map
> series is:
>    - Paint linear map using blocks/contig if boot CPU supports BBML2
>    - Repaint linear map using page mappings if secondary CPUs don't support BBML2

OK, I just need to add some simple tweak to split down to PTE level to v3.

>    - Integrate Dev's __change_memory_common() series

OK, I think I have to do my patches on top of it. Because Dev's patch 
need guarantee the linear mapping address range is physically contiguous.

>    - Create primitive to ensure mapping entry boundary at a given page-aligned VA
>    - Use primitive when changing permissions on linear map region

Sure.

>
> This will be mergable on its own, but will also provide a great starting base
> for adding huge-vmalloc-by-default.
>
> What do you think?

Definitely makes sense to me.

If I remember correctly, we still have some unsolved comments/questions 
for v3 in my replies on March 17, particularly:
https://lore.kernel.org/linux-arm-kernel/2b715836-b566-4a9e-b344-9401fa4c0feb@os.amperecomputing.com/

Thanks,
Yang

>
> Thanks,
> Ryan
>
>
>> Thanks,
>> Yang
>>
>>> Thanks,
>>> Ryan
>>>
>>>> Thanks,
>>>> Yang
>>>>
>>>>
>>>> On 3/13/25 10:40 AM, Yang Shi wrote:
>>>>> On 3/13/25 10:36 AM, Ryan Roberts wrote:
>>>>>> On 13/03/2025 17:28, Yang Shi wrote:
>>>>>>> Hi Ryan,
>>>>>>>
>>>>>>> I saw Miko posted a new spin of his patches. There are some slight changes
>>>>>>> that
>>>>>>> have impact to my patches (basically check the new boot parameter). Do you
>>>>>>> prefer I rebase my patches on top of his new spin right now then restart
>>>>>>> review
>>>>>>> from the new spin or review the current patches then solve the new review
>>>>>>> comments and rebase to Miko's new spin together?
>>>>>> Hi Yang,
>>>>>>
>>>>>> Sorry I haven't got to reviewing this version yet, it's in my queue!
>>>>>>
>>>>>> I'm happy to review against v3 as it is. I'm familiar with Miko's series
>>>>>> and am
>>>>>> not too bothered about the integration with that; I think it's pretty straight
>>>>>> forward. I'm more interested in how you are handling the splitting, which I
>>>>>> think is the bulk of the effort.
>>>>> Yeah, sure, thank you.
>>>>>
>>>>>> I'm hoping to get to this next week before heading out to LSF/MM the following
>>>>>> week (might I see you there?)
>>>>> Unfortunately I can't make it this year. Have a fun!
>>>>>
>>>>> Thanks,
>>>>> Yang
>>>>>
>>>>>> Thanks,
>>>>>> Ryan
>>>>>>
>>>>>>
>>>>>>> Thanks,
>>>>>>> Yang
>>>>>>>
>>>>>>>
>>>>>>> On 3/4/25 2:19 PM, Yang Shi wrote:
>>>>>>>> Changelog
>>>>>>>> =========
>>>>>>>> v3:
>>>>>>>>       * Rebased to v6.14-rc4.
>>>>>>>>       * Based on Miko's BBML2 cpufeature patch (https://lore.kernel.org/
>>>>>>>> linux-
>>>>>>>> arm-kernel/20250228182403.6269-3-miko.lenczewski@arm.com/).
>>>>>>>>         Also included in this series in order to have the complete patchset.
>>>>>>>>       * Enhanced __create_pgd_mapping() to handle split as well per Ryan.
>>>>>>>>       * Supported CONT mappings per Ryan.
>>>>>>>>       * Supported asymmetric system by splitting kernel linear mapping if
>>>>>>>> such
>>>>>>>>         system is detected per Ryan. I don't have such system to test, so the
>>>>>>>>         testing is done by hacking kernel to call linear mapping repainting
>>>>>>>>         unconditionally. The linear mapping doesn't have any block and cont
>>>>>>>>         mappings after booting.
>>>>>>>>
>>>>>>>> RFC v2:
>>>>>>>>       * Used allowlist to advertise BBM lv2 on the CPUs which can handle TLB
>>>>>>>>         conflict gracefully per Will Deacon
>>>>>>>>       * Rebased onto v6.13-rc5
>>>>>>>>       * https://lore.kernel.org/linux-arm-kernel/20250103011822.1257189-1-
>>>>>>>> yang@os.amperecomputing.com/
>>>>>>>>
>>>>>>>> RFC v1: https://lore.kernel.org/lkml/20241118181711.962576-1-
>>>>>>>> yang@os.amperecomputing.com/
>>>>>>>>
>>>>>>>> Description
>>>>>>>> ===========
>>>>>>>> When rodata=full kernel linear mapping is mapped by PTE due to arm's
>>>>>>>> break-before-make rule.
>>>>>>>>
>>>>>>>> A number of performance issues arise when the kernel linear map is using
>>>>>>>> PTE entries due to arm's break-before-make rule:
>>>>>>>>       - performance degradation
>>>>>>>>       - more TLB pressure
>>>>>>>>       - memory waste for kernel page table
>>>>>>>>
>>>>>>>> These issues can be avoided by specifying rodata=on the kernel command
>>>>>>>> line but this disables the alias checks on page table permissions and
>>>>>>>> therefore compromises security somewhat.
>>>>>>>>
>>>>>>>> With FEAT_BBM level 2 support it is no longer necessary to invalidate the
>>>>>>>> page table entry when changing page sizes.  This allows the kernel to
>>>>>>>> split large mappings after boot is complete.
>>>>>>>>
>>>>>>>> This patch adds support for splitting large mappings when FEAT_BBM level 2
>>>>>>>> is available and rodata=full is used. This functionality will be used
>>>>>>>> when modifying page permissions for individual page frames.
>>>>>>>>
>>>>>>>> Without FEAT_BBM level 2 we will keep the kernel linear map using PTEs
>>>>>>>> only.
>>>>>>>>
>>>>>>>> If the system is asymmetric, the kernel linear mapping may be repainted once
>>>>>>>> the BBML2 capability is finalized on all CPUs.  See patch #6 for more
>>>>>>>> details.
>>>>>>>>
>>>>>>>> We saw significant performance increases in some benchmarks with
>>>>>>>> rodata=full without compromising the security features of the kernel.
>>>>>>>>
>>>>>>>> Testing
>>>>>>>> =======
>>>>>>>> The test was done on AmpereOne machine (192 cores, 1P) with 256GB memory and
>>>>>>>> 4K page size + 48 bit VA.
>>>>>>>>
>>>>>>>> Function test (4K/16K/64K page size)
>>>>>>>>       - Kernel boot.  Kernel needs change kernel linear mapping permission at
>>>>>>>>         boot stage, if the patch didn't work, kernel typically didn't boot.
>>>>>>>>       - Module stress from stress-ng. Kernel module load change permission
>>>>>>>> for
>>>>>>>>         linear mapping.
>>>>>>>>       - A test kernel module which allocates 80% of total memory via
>>>>>>>> vmalloc(),
>>>>>>>>         then change the vmalloc area permission to RO, this also change
>>>>>>>> linear
>>>>>>>>         mapping permission to RO, then change it back before vfree(). Then
>>>>>>>> launch
>>>>>>>>         a VM which consumes almost all physical memory.
>>>>>>>>       - VM with the patchset applied in guest kernel too.
>>>>>>>>       - Kernel build in VM with guest kernel which has this series applied.
>>>>>>>>       - rodata=on. Make sure other rodata mode is not broken.
>>>>>>>>       - Boot on the machine which doesn't support BBML2.
>>>>>>>>
>>>>>>>> Performance
>>>>>>>> ===========
>>>>>>>> Memory consumption
>>>>>>>> Before:
>>>>>>>> MemTotal:       258988984 kB
>>>>>>>> MemFree:        254821700 kB
>>>>>>>>
>>>>>>>> After:
>>>>>>>> MemTotal:       259505132 kB
>>>>>>>> MemFree:        255410264 kB
>>>>>>>>
>>>>>>>> Around 500MB more memory are free to use.  The larger the machine, the
>>>>>>>> more memory saved.
>>>>>>>>
>>>>>>>> Performance benchmarking
>>>>>>>> * Memcached
>>>>>>>> We saw performance degradation when running Memcached benchmark with
>>>>>>>> rodata=full vs rodata=on.  Our profiling pointed to kernel TLB pressure.
>>>>>>>> With this patchset we saw ops/sec is increased by around 3.5%, P99
>>>>>>>> latency is reduced by around 9.6%.
>>>>>>>> The gain mainly came from reduced kernel TLB misses.  The kernel TLB
>>>>>>>> MPKI is reduced by 28.5%.
>>>>>>>>
>>>>>>>> The benchmark data is now on par with rodata=on too.
>>>>>>>>
>>>>>>>> * Disk encryption (dm-crypt) benchmark
>>>>>>>> Ran fio benchmark with the below command on a 128G ramdisk (ext4) with disk
>>>>>>>> encryption (by dm-crypt).
>>>>>>>> fio --directory=/data --random_generator=lfsr --norandommap --randrepeat 1 \
>>>>>>>>         --status-interval=999 --rw=write --bs=4k --loops=1 --ioengine=sync \
>>>>>>>>         --iodepth=1 --numjobs=1 --fsync_on_close=1 --group_reporting --
>>>>>>>> thread \
>>>>>>>>         --name=iops-test-job --eta-newline=1 --size 100G
>>>>>>>>
>>>>>>>> The IOPS is increased by 90% - 150% (the variance is high, but the worst
>>>>>>>> number of good case is around 90% more than the best number of bad case).
>>>>>>>> The bandwidth is increased and the avg clat is reduced proportionally.
>>>>>>>>
>>>>>>>> * Sequential file read
>>>>>>>> Read 100G file sequentially on XFS (xfs_io read with page cache populated).
>>>>>>>> The bandwidth is increased by 150%.
>>>>>>>>
>>>>>>>>
>>>>>>>> Mikołaj Lenczewski (1):
>>>>>>>>           arm64: Add BBM Level 2 cpu feature
>>>>>>>>
>>>>>>>> Yang Shi (5):
>>>>>>>>           arm64: cpufeature: add AmpereOne to BBML2 allow list
>>>>>>>>           arm64: mm: make __create_pgd_mapping() and helpers non-void
>>>>>>>>           arm64: mm: support large block mapping when rodata=full
>>>>>>>>           arm64: mm: support split CONT mappings
>>>>>>>>           arm64: mm: split linear mapping if BBML2 is not supported on
>>>>>>>> secondary
>>>>>>>> CPUs
>>>>>>>>
>>>>>>>>      arch/arm64/Kconfig                  |  11 +++++
>>>>>>>>      arch/arm64/include/asm/cpucaps.h    |   2 +
>>>>>>>>      arch/arm64/include/asm/cpufeature.h |  15 ++++++
>>>>>>>>      arch/arm64/include/asm/mmu.h        |   4 ++
>>>>>>>>      arch/arm64/include/asm/pgtable.h    |  12 ++++-
>>>>>>>>      arch/arm64/kernel/cpufeature.c      |  95 ++++++++++++++++++++++++++++++
>>>>>>>> +++++++
>>>>>>>>      arch/arm64/mm/mmu.c                 | 397 ++++++++++++++++++++++++++++++
>>>>>>>> ++++
>>>>>>>> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>> +++++
>>>>>>>> ++++++++++++++++++++++-------------------
>>>>>>>>      arch/arm64/mm/pageattr.c            |  37 ++++++++++++---
>>>>>>>>      arch/arm64/tools/cpucaps            |   1 +
>>>>>>>>      9 files changed, 518 insertions(+), 56 deletions(-)
>>>>>>>>
>>>>>>>>


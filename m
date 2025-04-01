Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11011035.outbound.protection.outlook.com [52.101.129.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9235A1C1F2F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743505810; cv=fail; b=hTtX0mz3qhhxWQIyl6LlU8c98HDm+8yxwZloP59cjd+6PWXozexd4Sg+uETIIw3O/JCs1rY25P7r5n1DSze+usiB3wzCUB+JXavSPN+t7dBKJTrg2IFa64uGe4VoG+HPu7g2KFeaUwmnDr+xPbPSZTM6SQrmmHO0g9zomHEhKwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743505810; c=relaxed/simple;
	bh=Wn6PIB+XdZ0kYlI6zYaEKTZlO5+FqCLVa683/+Q8W2k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b+kokNMOADQ6p4X9dKeqpfHIyso3DpSi8JqVusCdRdJzN2VE/UmBL7n+sVwdroo5Fo5Jd9Y2LpVA2Asey6SCAzRL9w+YojaPJcCg3mo6pLndLYdYgVKw4PVCW1pDrO5rdB64hE2oVb5YQeeI4EbKtWe60qHx4iTz5BlCFxb76Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=PzKtfvop; arc=fail smtp.client-ip=52.101.129.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="PzKtfvop"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjs33vNKOAedXGebtRQbRMcScK/4IS2gDn/UEGiYYFSCI7L/6H/QDI/c45VFEwjweccv+lDgUSDgxq5rTCWQNThXb3QMdlWcfGu2LBHcEioZVfuEjUAK7oIpgrLG8/iXapzkiJR9B3pAsw1vegp4x+oFUvIG849oyWY6n7CADXdzwcf7A5RXIuBEg3UvHfPf+Jj9PsPntz2SrVyVCFt88qEKMQfq3D3KhGRT5pH0gxbiy2GYqx6RxVAPJVLf89Vzh7zv/smLeECylrX+3749DSulxZI974yK3DsjfUbYTzg3+Yxmj1cqLow1dvmHfRmHWVz9tG6Nip9E+Nw9JeDgvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hP3O6+WcqHWmVaunICHjtMsErtLEmTs2sVJnm0njwSM=;
 b=vWicBV7GEdCATNQQU1F7AMwSZ1vymF6yEI4KEyHoAdatY0epCL2dhKgikjNI4Tj1eW8fwKOxW1TtTrLAHltAoYNrsOwtBsjcu804TwTz/UteVuEyxj9B/98o1+TMfyCUq6/CE0i06ijOgiFMCWuqT5Jo2/Tm2cKsLNhv/W1Cy0YmPQXqj8UjHlwx9oVTC4a1TeF75thIG1sDIKeP7Y8IGI28/W17/db2Z2axJk+Lg3Pk0c98dCZtiM+SwIXGDxHZrRaKA9eZHF80o1AoPNyg4ublbQsaE86L71F9CgpiMlsQGGY4IbLLljkTi4RTxZ8KFXXw2ABrz37WZKf//ucj9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hP3O6+WcqHWmVaunICHjtMsErtLEmTs2sVJnm0njwSM=;
 b=PzKtfvopq1jSyrdRWhlK599LTMnLy1OPt8x2xR5msZqOXsE7rpN8PyLNWyAkOaTeerLws6+1Ztn8HvQ8mw1u+SOgssL1oDoYAhIPDJqpuUXG4hS9rL+WyCbyI6SDMF7CxCQMvy7m7s04RF8wz4rTWJEVJlDgI6lFJJ4VTBmiNCd8oO0EDKmgXC930iRA//CQlIovJ7Bqw7AfUFVJF1QYEbRgmYOAlhYI/ktKz/V44mPfQgUjsqtJ+riu9pjoTGbxkRVa65lWJCyouW18Mqpjf5yyLipZBrZf48j6Yk6hRyB4ga/7+kkNpvzkDO/wDk1HLezuwEfmyh9qjetETlwgIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SG2PR06MB5240.apcprd06.prod.outlook.com (2603:1096:4:1da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 11:10:01 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%3]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 11:10:01 +0000
Message-ID: <a0b86b75-5f84-4cf2-b69e-c20dd9d025fc@vivo.com>
Date: Tue, 1 Apr 2025 19:09:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/1] Introduce vmap_file()
To: Uladzislau Rezki <urezki@gmail.com>,
 "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, linux-kernel@vger.kernel.org
References: <20250328211349.845857-1-vishal.moola@gmail.com>
 <02ba63ed-ef1c-426d-b469-09878c5f03d7@vivo.com> <Z-tGXf5mfTclxZgl@fedora>
 <a3618dd8-5b4d-45d7-b619-1c89ca7fd6b5@vivo.com> <Z-tbTWP5MYzwrRYX@fedora>
 <efd24da3-2da2-4acb-be7d-a070a78b80bf@vivo.com> <Z-u2O_MO1NWP42kL@pc636>
From: Huan Yang <link@vivo.com>
In-Reply-To: <Z-u2O_MO1NWP42kL@pc636>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SG2PR06MB5240:EE_
X-MS-Office365-Filtering-Correlation-Id: 025537af-f70e-457a-3953-08dd710dbee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3habzB3U09icXVlUjEveEJjdGJ4a3JaYXNCa3BuTmdqbmxxcUJDZ0haT1R3?=
 =?utf-8?B?YzVIMldCclFTa21GTWtkcFFuaEVWTEJmWWNocUM2ZE03djBTWHhnR1o0NThr?=
 =?utf-8?B?cWFiZUxKMENQZjZVQ1hWYWE1dnR6UmlGenZONVJDY3NXRUN4M1R1U1Bmb3dG?=
 =?utf-8?B?ZHpqV2twTkZpNUdTbjJzOG1ZTElQL3RsRlYxajdSVE9oQ0FxMlhReGJsbG9E?=
 =?utf-8?B?ZTdiNW1PYUc5V1J4c2h2WlJlbEJsSlVadUtKai9HeUp1R3RsWVA5aTM0RS8y?=
 =?utf-8?B?OEVwUlY3U3VEYjNucWVkWVRGWWtqWEtac01tbWpVZHVNZDlka0Z3TU9tM29K?=
 =?utf-8?B?bVd0elJCZFF0U0Q2bTFVTTd4VS82dXpCcFNhbHV3RStoZ1NyWk9lR3A1V0lk?=
 =?utf-8?B?dmk5cjNxYkxKRmlvVksxS2w0a3VXMDFKczdvUjJWZVBrS3BKSFBXTStEWDJJ?=
 =?utf-8?B?TlVZdWZPNzVQN2ZyeFJHZjNrbjE2YkhhRm5oaTFQWnlCZlRvcU44TEdIQklX?=
 =?utf-8?B?Ym8wNHMwZWxBOTAwRUxaYmczd2JDeFU0dk9Nb3lJVEo1eVVxdE1HQ2NUY1dE?=
 =?utf-8?B?SXM1UDkzNzdrWFpqVEVXcE01cFVROE5JbUxsWTVTeHNkVGF5eEFxcFpSbVJH?=
 =?utf-8?B?alVrcnZUUHRvaGhCTEZwYzFHTE9UZ09yUmU0RUdwRk5YVVg3QnRVck9rUFoz?=
 =?utf-8?B?bHBXYXpUT3hmMVM1YThsVElKMHFZUWJGcVZKbTU5SlE1d0UrRlJYY3FMTWQ1?=
 =?utf-8?B?aEVOMWVFVXdqaVhhMFVjektoQ2NObUc5bDhyVFUxSzJuYUljem9zaExVeDBi?=
 =?utf-8?B?bHNNSW83d2E1UFlMcUZmcGw5Z2JVYkw4TXRFeFE5MENFR3M0bHZiZkJKckVE?=
 =?utf-8?B?OWt1R2c5ZFBhMmR0QTVQaE9lK0dGbFR0c3Q3NDlYMjR5Z2F2WTJ3WHFsK3ln?=
 =?utf-8?B?WVFBdy9KWDB5Vm9IdlJBU29aMFdoT2UrekJvK0lubDhPdjdnZTZTa2tWMkJZ?=
 =?utf-8?B?NEhxbTRBV2NvZVVlb2Y0ek9UWitvcnFsWEhLeW9TWkhMalhTb0RlbUY2QTRo?=
 =?utf-8?B?dnFEeUVsNnNIdHNEWE03ZzFEaVE4MGhrcFUxdmFaU1I5WjdTdUtoRm8wUWcv?=
 =?utf-8?B?ZnFjVm1zbHBheWlVQWdqUFB4OWoxTTFJSnBQZURiQWZVeGo2VVMrR2ZxOURr?=
 =?utf-8?B?ZUFVemdIU055cXpsc0xFM1NnN1hPS055STlmNlNKakxxOVFpTEFSd2NIYTR0?=
 =?utf-8?B?VHpOVjhHREFJSitkRjk3YVNkbDJTVW5uUk5Qd1BweHpOMXBTMkc0NGZNSFNk?=
 =?utf-8?B?ZTZJSVNwMWpCNTFoWEZRQmVVdStHSHYzRU04aFBJbFpFNHloaTY3eHF3NmlQ?=
 =?utf-8?B?R0lMUERJdS9welJXRkZkVGV5dXlwTW91bjJTL2xSKytkRFYzQ0tqTXpqMUhB?=
 =?utf-8?B?SnFER1pmOWhRSFh4d3pQVmx5S3NjengrbFZDUTdsbVdKeDByd2lXOHREMUVT?=
 =?utf-8?B?VDRsdnBralhUT2pwdUc3TGUzV3pCSXdOVUhKaXljTFZIejJlbHlYTm1uNCtr?=
 =?utf-8?B?bllNb2MrZ0pIODVsbjR0NWhIL2hDekQ4cE5ma3NRSDJkblVrUFRIKzV6Tmps?=
 =?utf-8?B?RjJnWis5WXYzS29hdGl2WDZ3WFVHSlNDVzA3VWZyU0FUbjBlTXhaUDZZZXF3?=
 =?utf-8?B?UVBzRVZMTWVReUFuTFlNb1B1N1IzKzMvNEdsYTloc1NvOWlyWEtTUUZGK1Fm?=
 =?utf-8?B?a01aemxPaDRKd2dlVVdQdHhJSzlPUlQ4V1FjOWwxa0ZRM2o3RlZzS3JxSGFP?=
 =?utf-8?B?cDJIOHk2dVBhb2RWZ3VveWhXSU9uVUVTY2FZZWVVM0F1ZUZCNHNCN0tYTDk5?=
 =?utf-8?B?YTAzL3Zrb21lb3lOa1VLclZYbEtTRGlweCtoSHlDVTdEREc4SjJKYnhnUEsw?=
 =?utf-8?Q?KBBSYwtLY2i+QbSH5O0QWTvoKYCjoC+/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5676.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1lacDBIYkJLYVdoYmhaeVRZVFk0blBZU0xieDlFK0hTUWJnZWVrQkhrKzNX?=
 =?utf-8?B?dUFjODBJUVFxSFdTQjc4d3ZyOVVVT1A0SFpWZDZmdkdlUnNZVVY2YlZTM21y?=
 =?utf-8?B?VHNRYVlPZ0MxdFFGOWlUQTllRSsrQ0xrTjU5Qmw0b0VFRWhyVGxOcVVGV3JV?=
 =?utf-8?B?aG9rcWJDYWplQ040aS9TSmFMblcrdDJFZDBhSW84dmovTSt5azhldWszNFZM?=
 =?utf-8?B?bjc5dVN3V3NjcUVDQ3dQdVlzVitsQ0RjSVFPQ0F2WGh4NUJJZFdJbDE4Tm81?=
 =?utf-8?B?a2JvL2liZjFhSVpjZ3ZUVVBEKzNUcWdKRGZsTERGVlF3cE5DR0lYbnNtY2NK?=
 =?utf-8?B?a0pUaFl3a2lNRkpjanNMUW9OU1NZM3djNzNDaXRvaVNTZHZOU25OdVRVYXFI?=
 =?utf-8?B?WWQwQ3h5Q0dHOE1YQ2pKRHhLaVJZR0owWGJoZGZXeVBOeVdnaDRKdGpvSnJQ?=
 =?utf-8?B?TGxFNnVCRUNUSUp3TFBwelhXSVk4RkEyc3J0Z0dvRGo3NGVTV2QyK3Q0bGNC?=
 =?utf-8?B?SVJKR05nODJHczM1MllEZ2VKTVkxcE9lcXRxbFBPZTBnMStVczFRR3FsdEcv?=
 =?utf-8?B?WUJ0dm9Cd2krVUdGSXNpaEJsVDBacWhzSnNTd211TldyNG5FaXMrSGNVT2g0?=
 =?utf-8?B?c3ZpZ3c2UHdRQXJlYW9vU1RSZS9pZ0JwRFV0QnJHRU9NOU9Vd2h0YkQ3b3NO?=
 =?utf-8?B?andBalNyZjdpaytZeXdJL29Va0hTb2F4V3h4Tk9RRkRyZXllbno4VTBmaVQ0?=
 =?utf-8?B?S3JjYStidDZvbmVWTG50TllqbXIvS1NKZllqQjlLdWlsbk1HdjBBU1VodVIv?=
 =?utf-8?B?R0pzaVU5MG5aQWdsOW1IT1F5SjI3Zm1QU20zZ1RMMG43YWpNcFFMMzJYNG5N?=
 =?utf-8?B?K3hveFZORi9XT1dmNndWSGVUdU85cGhwY2RhOFp1MmtmRVdHRlBydmtQVlQv?=
 =?utf-8?B?NVVlemMyUUErRlNrNVIyZG5HWk8yQUlTSXB1enh0aXZkNjhKd3dCOE0yZndo?=
 =?utf-8?B?M3BqU1V5aDJKUkpKSzNYZkhTK3lPTUU1NHcxQ3NUNTJweFc3L09neFVwK0Zr?=
 =?utf-8?B?THd1L1JqdDJNeTZNcXpRTERMU3Zib1gxcHpFeU9YS29zWmNmMlNQYWErcmx1?=
 =?utf-8?B?T04zZitWNlJRZmRwNUY5dzlSQUttbjZ3UE9jVC9ydGtMQkxjcGVxbVdNZUtN?=
 =?utf-8?B?V3JmR3A1cVJjRzVYSUdMTExVaGFMMHY0QVZZMllYUzNiS0QvdW91alRLZ2Nk?=
 =?utf-8?B?TW5DYzVCZ3RETCtRM3N5R0ExSzB6NlJXcXNDMkJueDRwVlBVK243K1kwMEFC?=
 =?utf-8?B?NlE0N3lOY1hNRTYzRm84OVIvWkpOZnkwSVFOblpZT0VlR2VRb01pK2lqNUdG?=
 =?utf-8?B?enliYWF1UHplSkJpd05wZzVjdzlmREEyTUxYSTB0SlNGeStCR2dVWjMxWk5D?=
 =?utf-8?B?bEF6cUxaei9RaFFVRllhcHJrWEhXdUJtUlhCN0NJRjhkRFlzQ0NUNHVGTHcr?=
 =?utf-8?B?Ky9ocmNVckxxT2R3OGZtbnZZbmU0VVNKMG9kR3QxRmxOVHpjb21qcCtpc3B6?=
 =?utf-8?B?YjBrQ0FvczloQWUxNEZYbnoxWU5qd0ZnUVpaQ2ZvcU1VUVZ3bU1JMWJNYyt0?=
 =?utf-8?B?dFp2N3hHMzdwWk4xdWhJVkpoM2R0cGJFYjNIc1N4c21KSW5WMGVoT2c2WVRk?=
 =?utf-8?B?UVJtOTJ6a1lmTnpCemw0ZGZpVUdBRTZObVJzT2hLUDRXV0t2UGVLTU1XMkxa?=
 =?utf-8?B?RUJhcndLQTYxdHprWmswcjhhZWlldjJyam0ySFVmSW8raGZXUEsybldXRVFn?=
 =?utf-8?B?SkxURXArQW5tUEFaUmdTM010NlBCUExiSFNOczM5L2YxT2VIWUlaYnlRVnBF?=
 =?utf-8?B?SWdYUXJnYU11aHZleklBeEhrak9zR0NhbkVYM2JLQUtuKzJ0UWdBVmo2MWl1?=
 =?utf-8?B?VUxkRzh2TFp4eEdVbHV0WmdEcXJuaWxNQTVzSXU4MEJOdDBxcE9pSzlsVlVP?=
 =?utf-8?B?ZCtTc1FVNHdDeGhQTUN3ZnRQajdSdWlaelh4bU9zTko2dG15S3l5aUlodzFK?=
 =?utf-8?B?bzlSczJSbkZBUWgvdm9KdnNlUW02TXRCWEVXZm91Y1VnWlBDWUpoL2dmVzNs?=
 =?utf-8?Q?IDzreS+uKQTYGWkT78TGIDqrP?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 025537af-f70e-457a-3953-08dd710dbee7
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 11:10:01.0102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAEn5p2qCZatXupjWTweU1j9qj65bl3oVz3letZgDfDAfXrsW5g18Cvze/Ql40y6jGcutNL4GDRgIylMaE0zbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5240


在 2025/4/1 17:47, Uladzislau Rezki 写道:
> On Tue, Apr 01, 2025 at 02:08:53PM +0800, Huan Yang wrote:
>> 在 2025/4/1 11:19, Vishal Moola (Oracle) 写道:
>>> On Tue, Apr 01, 2025 at 10:21:46AM +0800, Huan Yang wrote:
>>>> 在 2025/4/1 09:50, Vishal Moola (Oracle) 写道:
>>>>> On Mon, Mar 31, 2025 at 10:05:53AM +0800, Huan Yang wrote:
>>>>>> HI Vishal,
>>>>>>
>>>>>> 在 2025/3/29 05:13, Vishal Moola (Oracle) 写道:
>>>>>>> Currently, users have to call vmap() or vmap_pfn() to map pages to
>>>>>>> kernel virtual space. vmap_pfn() is for special pages (i.e. pfns
>>>>>>> without struct page). vmap() handles normal pages.
>>>>>>>
>>>>>>> With large folios, we may want to map ranges that only span
>>>>>>> part of a folio (i.e. mapping half of a 2Mb folio).
>>>>>>> vmap_file() will allow us to do so.
>>>>>> You mention vmap_file can support range folio vmap, but when I look code, I can't figure out
>>>>>>
>>>>>> how to use, maybe I missed something? :)
>>>>> I took a look at the udma-buf code. Rather than iterating through the
>>>>> folios using pfns, you can calculate the corresponding file offsets
>>>>> (maybe you already have them?) to map the desired folios.
>>>> Currently udmabuf folio's not simple based on file(even each memory from memfd). User can provide
>>>>
>>>> random range of memfd  to udmabuf to use. For example:
>>>>
>>>> We get a memfd maybe 4M, user split it into [0, 2M), [1M, 2M), [2M, 4M), so you can see 1M-2M range repeat.
>>>>
>>>> This range can gathered by udmabuf_create_list, then udmabuf use it. So, udmabuf record it by folio array+offset array.
Here, :)
>>> I was thinking you could call vmap_file() on every sub-range and use
>>> those addresses. It should work, we'd have to look at making udmabuf api's
>>> support it.
>> Hmmm, how to get contigous virtual address? Or there are a way to merge each split vmap's return address?
>>
> The patch in question maps whole file to continues memory as i see, but
> i can miss something. Partly populate technique requires to get an area
Hmm, maybe you missed ahead talk, I point above. :)
> and partly populate it.
>
> As i see we have something similar:
>
> <snip>
> /**
>   * vm_area_map_pages - map pages inside given sparse vm_area
>   * @area: vm_area
>   * @start: start address inside vm_area
>   * @end: end address inside vm_area
>   * @pages: pages to map (always PAGE_SIZE pages)
>   */
> int vm_area_map_pages(struct vm_struct *area, unsigned long start,
> 		      unsigned long end, struct page **pages)
> {
> ...
> <snip>
>
> it is used by the BPF.
>
> --
> Uladzislau Rezki

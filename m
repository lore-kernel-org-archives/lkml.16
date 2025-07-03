Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023116.outbound.protection.outlook.com [40.107.44.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876702989BA;
	Thu,  3 Jul 2025 07:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751527696; cv=fail; b=pqpAiTgC3eiSjiPVMgJT0wXU9B9L3YAuSULFCyret3A0GuaLCjI5juraH9SUJRFrzmmC7QGd+PurNdDIfhCF95iTy0o/95WSjKUvgGXxDOoQq43UTZMom9djSF0A5gX6qX85li1UPu88Vwk0MA++nz1IWN/6W38TgJfa1qTDsv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751527696; c=relaxed/simple;
	bh=mPTWyA+FMCEEqQKz7h5xZgW4eqZlZoKlRHtuwm/Bbzg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R7p7hIKfQqL1W4wd5RzvFyKZ1X6ulEeTFOGwucQFeCSOpHYzD6vPEn1QaIwbnEBIWhf4+1feL9A6LoZxob3W6gPnxkiD1rHOX3oHPP1dpB7gIFqWb2V7vAhdS39Ohg2tp+OcZ9EvB4EB7V0a9q9LpUfW/CNMFJ4Vq2T8JYrNsto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=hm3lz3B0; arc=fail smtp.client-ip=40.107.44.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="hm3lz3B0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKbPvkcYbl3ZbO7i6VA26pQKvJkbuYv9gebdtoLLT1BmxiiwgFNmrNROsaaoczrCbu0pn15T8oc4k8JT0M3l3EANwisrZRpg2jNyNpx4wqK05tQ5/5N4hASE0OwTV0ebmKlCa6jI7HyFYtVARvgkeGm8MtgIVYL4ep/1EIOaSl2p6puIBpMzgZEC9b+y9XMoyPAAtTEP2q7EzZXzfk5Hiao2LYh04V9k2Aq3KxcmrbDMI1Ve5CS4jf2TYAldHi3VFWK1k+zh+Do14+h4KnKFdRE5IfYPZIYoFOhzCoQSNajm7DioMuUNkRVHP5uCtlmYrrtOkyV8pAd2pju5MDQMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8zhuKAGGgXV+eEAfFtofrhBfHUHisyuTcSigbkBSL4=;
 b=aJUsR+5IUkRjD5FfzCF+4v2GeFn94woYnByU7hnMe4WRetRATqYjekoXh269EHpsv4V5XYAKG+Dsuz2zZGsris9GqNpcX2CAznfgqzY6SpfA+FFnlBfh+2aarAPTm8qGrzyrod478g9wsD50YDeXPSr4lk7teqG+EznfHA6VmjOUJIEoSfdrUPZ6nEptYcZB+bUq6sOT45Gs3mzYI9GXICsKTTeZ3p2e9hO1ZsOe9gvtVZaAvZDSJ2EfZec62iqIOpmuKoU0zIWVvV+INyDl1fPpOq6q6H/PGt51Ff9pYc4JeLnmWatt82I8Qqkwr9wIIIbUEJK8LzYk45IuOSsE3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8zhuKAGGgXV+eEAfFtofrhBfHUHisyuTcSigbkBSL4=;
 b=hm3lz3B0I42OIqGRE7I7tfYLl4VPv/jran8dCZpfRZ6FZ20UGkCK6HTKDCMmDEHznFWl4PSmvm82V3e3KfIW8GsnJIzKpEJyAWiXh8qFIpp/oj9RQZzBpVcrFHR6QrpnoqyXKUQibrosmWeBh5LMgmYWgqREEWZRm4wZcTap7+LTZNTc5RqrawAarzbRMOuEk6SEIZmys/vc6AwJoj30qzLZDIdsJM3ZWj62aXoDJqWveqEgD+iwD63Wlr5F76fe9rbIc0Gac5TZEebzceznLbuFIUJOAc66E59Qb8+DGF7xjcbRW1QqbiwyGqNRqS0QthMOFIoAgffElZCqJSbuHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEZPR03MB8469.apcprd03.prod.outlook.com (2603:1096:101:223::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Thu, 3 Jul
 2025 07:28:07 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 07:28:07 +0000
Message-ID: <a3acb2ef-24dc-49c4-a4b3-2304cb02504d@amlogic.com>
Date: Thu, 3 Jul 2025 15:27:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/26] clk: amlogic: align s4 and c3 pwm clock
 descriptions
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <20250702-meson-clk-cleanup-24-v1-25-e163c9a1fc21@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-25-e163c9a1fc21@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEZPR03MB8469:EE_
X-MS-Office365-Filtering-Correlation-Id: 80299520-e0a4-410f-08be-08ddba0327d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXMrL2piQ3U1NmpyR29lOFg0ZG8vY3I3VHE5cjRRZW9oakl4SGxQOEQrcEV2?=
 =?utf-8?B?aWs4UDFnakNkNjhRa3N0OFFLc1JSbGtOTkh1SXEzS0ZIMkE2VStEUEdDSGQv?=
 =?utf-8?B?UDlXTTA4azFteWxaMlVXTHdDL1FGVUt1NHBsUE1ESzZUdWlWems2ZmZhT3Vm?=
 =?utf-8?B?TUE2VjhUZERwVmNJRmpzRGFKNGljZDk4SUJZcEduNW5CRlVSWTJ0RkRRZE1t?=
 =?utf-8?B?U3R6ZXp5dTBCSjNRMlI3Z1A2dHJSeDhpemFTNnMxcXFQL29wTnZTL2NOTmNE?=
 =?utf-8?B?eGdiWVV0d1VjSTZHRlQ4T2Z4cXpObjA5eGtlaUlIWFJmS0Y5L1JsV3o2dEVk?=
 =?utf-8?B?eHFzUnh3R2d3eDl1V2J6cVJTbzVzLzNOa2FZSUllRkdEQmtha1dxcCs5V3c2?=
 =?utf-8?B?NU5IKzlBeE1XQ3V4SllZZHVINXErQWltSXlIRlRybzhGNWM5d1RXaCtvRHFn?=
 =?utf-8?B?TURiNkxUNVYyS0tibVB2ZGVUcFc3K2tmMWU4amMrcUI4Z0pjVVNPSDdWM3Fo?=
 =?utf-8?B?MDh6WktjZWxIdGRJUWlKbjV2dlpOelE3d0ozQy9tQzhwQmdFZFBQcnJmSWhQ?=
 =?utf-8?B?eEhvWENUeEd4NzVQcDZWY09sckZTaGZsM1dWZis0N1JobDBaYUNidTdjUy95?=
 =?utf-8?B?amxzYjBBcWFzdURicGE5YnJYeWVEVHVKVVNmMHM0QWh1MnprdDRzbitxRlli?=
 =?utf-8?B?MytwMy9wNFBFdFc0UUd6K3l0UXRNWjlMOW1BOXMwN2pTV1dSNDZqL3IxTS8v?=
 =?utf-8?B?SmltN3JSNlUyWTdIbVI2bDdQeW81TTNQR01jbTZtWHBYbjZqUi92MjQ5SGFZ?=
 =?utf-8?B?cFdsamliMGRqcXZlRFNiZS9DM05xQitQcDBZWGtBZ1ZtY3VIMUsyMXZNOEhO?=
 =?utf-8?B?UmlRTXBWNGNXV2RFUm8xcnJhMXpseVFqdVMrWFQ0M2ZnZGVMZHhuZDVCa09Q?=
 =?utf-8?B?MWorc3k2VHVMLzhKY252Q1F0SDAwVlJ4OWhoeC9NZFRLUUxKeW9peVMxVjhq?=
 =?utf-8?B?NVNHMXl4QW41MW1vdHdJUzAxNjJ2Z3R0cDdJY1FqNUZTUG9tcjVhUE1MaDJX?=
 =?utf-8?B?SVFZdVFha29kd0xIRHJWVzZxV0k3ZUo3ZG4wd3FTcXJWdTV6Rk14WHk0a1RV?=
 =?utf-8?B?alZoZzhxYVE0N1puMWhMeGh5TDBGd1VxNjhxLzNucXRQaWZUVnFmUmxObmJ4?=
 =?utf-8?B?c2N4QjBxYi9Qc2dzeFBnMVdaUitOeEpvdVZUc3piMHpyOWZWQmw1SkJIZmlK?=
 =?utf-8?B?UHVpV2RDUjFiREtxUlVmMHJUenUzblA0MUIzaERCaWwxb3dEa21nWDFjQmN3?=
 =?utf-8?B?cFlFQTU1ZXZ0OFFDUUUrU2JmOW54WjZMTE1lOXk0YnRLbUhxQi94Q1BSd00z?=
 =?utf-8?B?SWw5VWQ5cEZjWFdxaitlUkdldFdvdGcxNUZiaE1QSWk3aEcwTC9wQkFqbVJC?=
 =?utf-8?B?d3FaUURuZ1JVSjE1R0N0eG5SeVN6eC9YWTNSU1owQWpRZEhsSjZQRlo1K3Fi?=
 =?utf-8?B?RmFpMXhhUm9ZN3ZRTVRVRjVnZDZuS1RDSk1qZjZhcmt0UTAxaWs5dkpyU3Bt?=
 =?utf-8?B?T0pJb2ZkeTAxQXF6b2RMODBYM01nNTZ3MDFMWEoxL1dMbGF4bWVjSU9ONE9I?=
 =?utf-8?B?dms2RTFmYmNDSis5Mkt5UmpUd2dhVTdPZG1Md2dTV1REbEhuUGl1ZWFRMWxG?=
 =?utf-8?B?aXg3R2JtM2F5SEdQNm5meVVpajM1OVpTcmI3WWlMbEhxd2tNZnV5NlBFS0ow?=
 =?utf-8?B?ZEREL0hJaitRaXN5TWNZMGJEYWtxM1VXaTk0WUNjUzg2cHZuSk81eDBiblFC?=
 =?utf-8?B?UEdnN2tZQlMxT1NKUVlWejlPeVdUNXZCSXVkRnBidTllQ1Q0bFRNb1owZFB2?=
 =?utf-8?B?bUlKNk1sdCt1THMrMWxiNXNqWFdzbFBkcUV6TzF4Q25ZcHF3bXNFblJDdURT?=
 =?utf-8?Q?D0gbu5XHOys=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2ZkejdBdno2NVZKUnRVNjVXVVZnQVczOXF6VGpQRzdMZGhNcFpWcWxTS1h0?=
 =?utf-8?B?S3JDQ3R2ZkVzMHY2emowRmlHd0taYXpydm5WMHllUndQTEwvVzNXTCtqTlpr?=
 =?utf-8?B?RnZqVVVSTVZMVlNIT1hCdjlpUzRTY3dlUGhnemhNUE02Vzk2Mk10eWNETU5V?=
 =?utf-8?B?RkxUTVBNSnBGamRvZFlGZ21EUFlnL0FWcGYvdGdGSTliTGpOK1EybVJoVEpV?=
 =?utf-8?B?ODJPNk5HVE1oSUc1TlhWa3B2UDhpRUhjankvSWM0WlNUT0RSVmNWdVVxTEFz?=
 =?utf-8?B?aFkwb0M5K3JITDh6ZTZScXBqZnFxYXdjSjRnN0pYcjRMS2l6SVF6ZVZiSGEy?=
 =?utf-8?B?OTJSL0JqSzhxbXM4TWNaZVFsU09mTTYwTzRkSXZ3R3lKMUhaZmJMRkloSHRp?=
 =?utf-8?B?K0ZYL1FzOWlzKzRYdXgrNHlwcFdoSzFSSStDZXNOUzVFanA2akgzanA2RFlL?=
 =?utf-8?B?SGN2RkxHS2w3d0s0MERhMU55c21wRXA0RDJXQWpnK1dIVUw5S1ovcTR2YmQv?=
 =?utf-8?B?TUVxc2dCUmpjTW9WUWQxVExta1FKRFppbzFXcGh6YlVtUUttL0lwZFM2Zlhr?=
 =?utf-8?B?elRoK01aT1Npb0hocmsyWmdOZ1QvZjBnVXFUZmtoNVI3UUdvc2ZuUXhmeXAz?=
 =?utf-8?B?RUJFeHAzL3krcVNvcHJKVzZKUUROblM4N241c01nQmp0ZC9HK2Z0UktZMGQ2?=
 =?utf-8?B?QnF3RVpRdEF0VEVmeDZsRmNnSDVteklsRitIN3B4L0NsRjNEbWdzSnNVU0VE?=
 =?utf-8?B?TW03UVFGMTdxdDVQd3BmYVFSNDZMNnRVYVo1ME1CRUhHQkpEVUV4K0tIVUM3?=
 =?utf-8?B?cHYzUGtXQXZxeUpodTJxU3J5ZlNlZVNkYll5L2dFc0NKTTlwOUpmVFlnL1l0?=
 =?utf-8?B?Rkd1YzBrc1ZoUTcwd29HWGEyd1BwbWNPcU8vWEgrTHZxUTg5SlNRWENXNWlI?=
 =?utf-8?B?YU9GaVZlVFZRenRod0FXckFFeTN4SFQ5VUpmWFlIYVVSdUtYM0QraGZyTDZk?=
 =?utf-8?B?VzdYaEJiVlhRdncwUlJ2aVhqRXE0WHIzWkU2TDNUWHArUDVXZDcvSmR6ZE16?=
 =?utf-8?B?c0hncDI4TXVsck81dXQxOS9pMzR5L0Q4ODRoOUpraHNXRDBRcVVNY3I1NytH?=
 =?utf-8?B?dVNIUmxtQzBiN2tzbjRnZWJUWlpJakZyWWtkSG9IL1dXc0FDWWpDWmIwVjFq?=
 =?utf-8?B?c1ZCWDZtY3ZEWVVaQVNNYW8rQTZUZ0tObE1OZHVCS20wQ09xWDI3ckZydzc0?=
 =?utf-8?B?RWwyNnZOOFFNTCtsdTJSSnZXUzRKai9zKzRKMzNLRm5XUFlyTFB6L3l5dS9W?=
 =?utf-8?B?dDZqTldWUVRVSXE0TlMvcjVhSERkZ0pkWDk3TUg5WTRMV0hZT1I5SWttYlJD?=
 =?utf-8?B?cmFJU1pQajVrcTRlMWNTa2dleWpEVG5uekwvK3VhNFV5UG1DK3FMYkpaVkRm?=
 =?utf-8?B?OStLbWo4eDdXb2h5dHgwU0JMdGl1T29UeUVlR3BwNkhneHFQZHYzZGxhYitC?=
 =?utf-8?B?YllDVjNmODRGRm8xQXF2UGU5QUFsZGhhKzY1WXAreXFzR2UzTS90ZnZ0Q2Z3?=
 =?utf-8?B?bmYrRmV3UkJLb2NMU0dBRUo2SjNvclB3ek94SHhYZGxKNkNERHJSMDF4Mk15?=
 =?utf-8?B?Q1kxSVZYR2wrOUduRHZxNjRkWCt6UjlMLzJmK0J4Z0RlLzNIakZBWWN2M0dx?=
 =?utf-8?B?STFqWU9xdktlQ09zbnBMVUd6NDZPWmxYRWRWQ2xHUkNRMnVySldUUFlmdXYv?=
 =?utf-8?B?RE5BK2lHa2JBNUtvdVpKOXdSUEQ2V1ZzNnE3Wk1mYkxBeTRES2ZDSFV0dm9z?=
 =?utf-8?B?eThGZG9wbk5sdFhkSWxOeXVkaFp0R1V1SGQybCtZZi9sUjJGbzNQK204d2ND?=
 =?utf-8?B?dXBScGhDeEQ2M003eStRa090N1BlQ1ovdVhFSG1Ed0tWNUw3SVZ5Ylk3a0Vo?=
 =?utf-8?B?Z00wSktHZC8wVFlUbVU5eDcwRHlvb1Nkd0VZMXdDOTMvQnlWSk5qL0ttUUF1?=
 =?utf-8?B?aHd3WldWK1k1bitNa2pFR3ZzT2pITWlTTDVQUmlVVkRSRUVSK2hhTnhwUU80?=
 =?utf-8?B?TTdMcXNFQXkrZng2akJpOGdnUURLOEdkb3N6eFl2bE85QVZmWUIzbnVpMWtI?=
 =?utf-8?Q?cLFSUCaJc0Tszv67zKXZVVzQp?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80299520-e0a4-410f-08be-08ddba0327d7
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 07:28:07.4673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fgVns2ou6pqXCY42sbQWG5XPDPdNnKUhi2XBQRg9w+zbOBggBE/dBFRKc7XKdsomL/Nbj2tQhYoHRLcV/f5jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8469

Hi Jerome:

It's good for me. Thanks!


Reviewed-by: Chuan Liu <chuan.liu@amlogic.com>


On 7/2/2025 11:26 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> s4 and c3 follow exactly the same structure when it comes to PWM clocks but
> differ in the way these clocks are described, for no obvious reason.
>
> Align the description of the pwm clocks of these SoCs with the composite
> clock helpers.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/c3-peripherals.c | 204 +++++----------
>   drivers/clk/meson/s4-peripherals.c | 508 +++----------------------------------
>   2 files changed, 103 insertions(+), 609 deletions(-)
>
> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
> index 02c9820cd98655e57a290859b595cf09d39e5fe3..fd35f9b7994720d069c5f72142d6064790d40b60 100644
> --- a/drivers/clk/meson/c3-peripherals.c
> +++ b/drivers/clk/meson/c3-peripherals.c
> @@ -48,6 +48,15 @@
>   #define SPIFC_CLK_CTRL                         0x1a0
>   #define NNA_CLK_CTRL                           0x220
>
> +#define C3_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
> +       MESON_COMP_SEL(c3_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
> +
> +#define C3_COMP_DIV(_name, _reg, _shift, _width) \
> +       MESON_COMP_DIV(c3_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
> +
> +#define C3_COMP_GATE(_name, _reg, _bit) \
> +       MESON_COMP_GATE(c3_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
> +
>   static struct clk_regmap c3_rtc_xtal_clkin = {
>          .data = &(struct clk_regmap_gate_data) {
>                  .offset = RTC_BY_OSCIN_CTRL0,
> @@ -512,146 +521,61 @@ static const struct clk_parent_data c3_pwm_parents[] = {
>          { .fw_name = "fdiv3" }
>   };
>
> -#define C3_PWM_CLK_MUX(_name, _reg, _shift) {                  \
> -       .data = &(struct clk_regmap_mux_data) {                 \
> -               .offset = _reg,                                 \
> -               .mask = 0x3,                                    \
> -               .shift = _shift,                                \
> -       },                                                      \
> -       .hw.init = &(struct clk_init_data) {                    \
> -               .name = #_name "_sel",                          \
> -               .ops = &clk_regmap_mux_ops,                     \
> -               .parent_data = c3_pwm_parents,                  \
> -               .num_parents = ARRAY_SIZE(c3_pwm_parents),      \
> -       },                                                      \
> -}
> -
> -#define C3_PWM_CLK_DIV(_name, _reg, _shift) {                  \
> -       .data = &(struct clk_regmap_div_data) {                 \
> -               .offset = _reg,                                 \
> -               .shift = _shift,                                \
> -               .width = 8,                                     \
> -       },                                                      \
> -       .hw.init = &(struct clk_init_data) {                    \
> -               .name = #_name "_div",                          \
> -               .ops = &clk_regmap_divider_ops,                 \
> -               .parent_names = (const char *[]) { #_name "_sel" },\
> -               .num_parents = 1,                               \
> -               .flags = CLK_SET_RATE_PARENT,                   \
> -       },                                                      \
> -}
> -
> -#define C3_PWM_CLK_GATE(_name, _reg, _bit) {                   \
> -       .data = &(struct clk_regmap_gate_data) {                \
> -               .offset = _reg,                                 \
> -               .bit_idx = _bit,                                \
> -       },                                                      \
> -       .hw.init = &(struct clk_init_data) {                    \
> -               .name = #_name,                                 \
> -               .ops = &clk_regmap_gate_ops,                    \
> -               .parent_names = (const char *[]) { #_name "_div" },\
> -               .num_parents = 1,                               \
> -               .flags = CLK_SET_RATE_PARENT,                   \
> -       },                                                      \
> -}
> -
> -static struct clk_regmap c3_pwm_a_sel =
> -       C3_PWM_CLK_MUX(pwm_a, PWM_CLK_AB_CTRL, 9);
> -static struct clk_regmap c3_pwm_a_div =
> -       C3_PWM_CLK_DIV(pwm_a, PWM_CLK_AB_CTRL, 0);
> -static struct clk_regmap c3_pwm_a =
> -       C3_PWM_CLK_GATE(pwm_a, PWM_CLK_AB_CTRL, 8);
> -
> -static struct clk_regmap c3_pwm_b_sel =
> -       C3_PWM_CLK_MUX(pwm_b, PWM_CLK_AB_CTRL, 25);
> -static struct clk_regmap c3_pwm_b_div =
> -       C3_PWM_CLK_DIV(pwm_b, PWM_CLK_AB_CTRL, 16);
> -static struct clk_regmap c3_pwm_b =
> -       C3_PWM_CLK_GATE(pwm_b, PWM_CLK_AB_CTRL, 24);
> -
> -static struct clk_regmap c3_pwm_c_sel =
> -       C3_PWM_CLK_MUX(pwm_c, PWM_CLK_CD_CTRL, 9);
> -static struct clk_regmap c3_pwm_c_div =
> -       C3_PWM_CLK_DIV(pwm_c, PWM_CLK_CD_CTRL, 0);
> -static struct clk_regmap c3_pwm_c =
> -       C3_PWM_CLK_GATE(pwm_c, PWM_CLK_CD_CTRL, 8);
> -
> -static struct clk_regmap c3_pwm_d_sel =
> -       C3_PWM_CLK_MUX(pwm_d, PWM_CLK_CD_CTRL, 25);
> -static struct clk_regmap c3_pwm_d_div =
> -       C3_PWM_CLK_DIV(pwm_d, PWM_CLK_CD_CTRL, 16);
> -static struct clk_regmap c3_pwm_d =
> -       C3_PWM_CLK_GATE(pwm_d, PWM_CLK_CD_CTRL, 24);
> -
> -static struct clk_regmap c3_pwm_e_sel =
> -       C3_PWM_CLK_MUX(pwm_e, PWM_CLK_EF_CTRL, 9);
> -static struct clk_regmap c3_pwm_e_div =
> -       C3_PWM_CLK_DIV(pwm_e, PWM_CLK_EF_CTRL, 0);
> -static struct clk_regmap c3_pwm_e =
> -       C3_PWM_CLK_GATE(pwm_e, PWM_CLK_EF_CTRL, 8);
> -
> -static struct clk_regmap c3_pwm_f_sel =
> -       C3_PWM_CLK_MUX(pwm_f, PWM_CLK_EF_CTRL, 25);
> -static struct clk_regmap c3_pwm_f_div =
> -       C3_PWM_CLK_DIV(pwm_f, PWM_CLK_EF_CTRL, 16);
> -static struct clk_regmap c3_pwm_f =
> -       C3_PWM_CLK_GATE(pwm_f, PWM_CLK_EF_CTRL, 24);
> -
> -static struct clk_regmap c3_pwm_g_sel =
> -       C3_PWM_CLK_MUX(pwm_g, PWM_CLK_GH_CTRL, 9);
> -static struct clk_regmap c3_pwm_g_div =
> -       C3_PWM_CLK_DIV(pwm_g, PWM_CLK_GH_CTRL, 0);
> -static struct clk_regmap c3_pwm_g =
> -       C3_PWM_CLK_GATE(pwm_g, PWM_CLK_GH_CTRL, 8);
> -
> -static struct clk_regmap c3_pwm_h_sel =
> -       C3_PWM_CLK_MUX(pwm_h, PWM_CLK_GH_CTRL, 25);
> -static struct clk_regmap c3_pwm_h_div =
> -       C3_PWM_CLK_DIV(pwm_h, PWM_CLK_GH_CTRL, 16);
> -static struct clk_regmap c3_pwm_h =
> -       C3_PWM_CLK_GATE(pwm_h, PWM_CLK_GH_CTRL, 24);
> -
> -static struct clk_regmap c3_pwm_i_sel =
> -       C3_PWM_CLK_MUX(pwm_i, PWM_CLK_IJ_CTRL, 9);
> -static struct clk_regmap c3_pwm_i_div =
> -       C3_PWM_CLK_DIV(pwm_i, PWM_CLK_IJ_CTRL, 0);
> -static struct clk_regmap c3_pwm_i =
> -       C3_PWM_CLK_GATE(pwm_i, PWM_CLK_IJ_CTRL, 8);
> -
> -static struct clk_regmap c3_pwm_j_sel =
> -       C3_PWM_CLK_MUX(pwm_j, PWM_CLK_IJ_CTRL, 25);
> -static struct clk_regmap c3_pwm_j_div =
> -       C3_PWM_CLK_DIV(pwm_j, PWM_CLK_IJ_CTRL, 16);
> -static struct clk_regmap c3_pwm_j =
> -       C3_PWM_CLK_GATE(pwm_j, PWM_CLK_IJ_CTRL, 24);
> -
> -static struct clk_regmap c3_pwm_k_sel =
> -       C3_PWM_CLK_MUX(pwm_k, PWM_CLK_KL_CTRL, 9);
> -static struct clk_regmap c3_pwm_k_div =
> -       C3_PWM_CLK_DIV(pwm_k, PWM_CLK_KL_CTRL, 0);
> -static struct clk_regmap c3_pwm_k =
> -       C3_PWM_CLK_GATE(pwm_k, PWM_CLK_KL_CTRL, 8);
> -
> -static struct clk_regmap c3_pwm_l_sel =
> -       C3_PWM_CLK_MUX(pwm_l, PWM_CLK_KL_CTRL, 25);
> -static struct clk_regmap c3_pwm_l_div =
> -       C3_PWM_CLK_DIV(pwm_l, PWM_CLK_KL_CTRL, 16);
> -static struct clk_regmap c3_pwm_l =
> -       C3_PWM_CLK_GATE(pwm_l, PWM_CLK_KL_CTRL, 24);
> -
> -static struct clk_regmap c3_pwm_m_sel =
> -       C3_PWM_CLK_MUX(pwm_m, PWM_CLK_MN_CTRL, 9);
> -static struct clk_regmap c3_pwm_m_div =
> -       C3_PWM_CLK_DIV(pwm_m, PWM_CLK_MN_CTRL, 0);
> -static struct clk_regmap c3_pwm_m =
> -       C3_PWM_CLK_GATE(pwm_m, PWM_CLK_MN_CTRL, 8);
> -
> -static struct clk_regmap c3_pwm_n_sel =
> -       C3_PWM_CLK_MUX(pwm_n, PWM_CLK_MN_CTRL, 25);
> -static struct clk_regmap c3_pwm_n_div =
> -       C3_PWM_CLK_DIV(pwm_n, PWM_CLK_MN_CTRL, 16);
> -static struct clk_regmap c3_pwm_n =
> -       C3_PWM_CLK_GATE(pwm_n, PWM_CLK_MN_CTRL, 24);
> +static C3_COMP_SEL(pwm_a, PWM_CLK_AB_CTRL, 9, 0x3, c3_pwm_parents);
> +static C3_COMP_DIV(pwm_a, PWM_CLK_AB_CTRL, 0, 8);
> +static C3_COMP_GATE(pwm_a, PWM_CLK_AB_CTRL, 8);
> +
> +static C3_COMP_SEL(pwm_b, PWM_CLK_AB_CTRL, 25, 0x3, c3_pwm_parents);
> +static C3_COMP_DIV(pwm_b, PWM_CLK_AB_CTRL, 16, 8);
> +static C3_COMP_GATE(pwm_b, PWM_CLK_AB_CTRL, 24);
> +
> +static C3_COMP_SEL(pwm_c, PWM_CLK_CD_CTRL, 9, 0x3, c3_pwm_parents);
> +static C3_COMP_DIV(pwm_c, PWM_CLK_CD_CTRL, 0, 8);
> +static C3_COMP_GATE(pwm_c, PWM_CLK_CD_CTRL, 8);
> +
> +static C3_COMP_SEL(pwm_d, PWM_CLK_CD_CTRL, 25, 0x3, c3_pwm_parents);
> +static C3_COMP_DIV(pwm_d, PWM_CLK_CD_CTRL, 16, 8);
> +static C3_COMP_GATE(pwm_d, PWM_CLK_CD_CTRL, 24);
> +
> +static C3_COMP_SEL(pwm_e, PWM_CLK_EF_CTRL, 9, 0x3, c3_pwm_parents);
> +static C3_COMP_DIV(pwm_e, PWM_CLK_EF_CTRL, 0, 8);
> +static C3_COMP_GATE(pwm_e, PWM_CLK_EF_CTRL, 8);
> +
> +static C3_COMP_SEL(pwm_f, PWM_CLK_EF_CTRL, 25, 0x3, c3_pwm_parents);
> +static C3_COMP_DIV(pwm_f, PWM_CLK_EF_CTRL, 16, 8);
> +static C3_COMP_GATE(pwm_f, PWM_CLK_EF_CTRL, 24);
> +
> +static C3_COMP_SEL(pwm_g, PWM_CLK_GH_CTRL, 9, 0x3, c3_pwm_parents);
> +static C3_COMP_DIV(pwm_g, PWM_CLK_GH_CTRL, 0, 8);
> +static C3_COMP_GATE(pwm_g, PWM_CLK_GH_CTRL, 8);
> +
> +static C3_COMP_SEL(pwm_h, PWM_CLK_GH_CTRL, 25, 0x3, c3_pwm_parents);
> +static C3_COMP_DIV(pwm_h, PWM_CLK_GH_CTRL, 16, 8);
> +static C3_COMP_GATE(pwm_h, PWM_CLK_GH_CTRL, 24);
> +
> +static C3_COMP_SEL(pwm_i, PWM_CLK_IJ_CTRL, 9, 0x3, c3_pwm_parents);
> +static C3_COMP_DIV(pwm_i, PWM_CLK_IJ_CTRL, 0, 8);
> +static C3_COMP_GATE(pwm_i, PWM_CLK_IJ_CTRL, 8);
> +
> +static C3_COMP_SEL(pwm_j, PWM_CLK_IJ_CTRL, 25, 0x3, c3_pwm_parents);
> +static C3_COMP_DIV(pwm_j, PWM_CLK_IJ_CTRL, 16, 8);
> +static C3_COMP_GATE(pwm_j, PWM_CLK_IJ_CTRL, 24);
> +
> +static C3_COMP_SEL(pwm_k, PWM_CLK_KL_CTRL, 9, 0x3, c3_pwm_parents);
> +static C3_COMP_DIV(pwm_k, PWM_CLK_KL_CTRL, 0, 8);
> +static C3_COMP_GATE(pwm_k, PWM_CLK_KL_CTRL, 8);
> +
> +static C3_COMP_SEL(pwm_l, PWM_CLK_KL_CTRL, 25, 0x3, c3_pwm_parents);
> +static C3_COMP_DIV(pwm_l, PWM_CLK_KL_CTRL, 16, 8);
> +static C3_COMP_GATE(pwm_l, PWM_CLK_KL_CTRL, 24);
> +
> +static C3_COMP_SEL(pwm_m, PWM_CLK_MN_CTRL, 9, 0x3, c3_pwm_parents);
> +static C3_COMP_DIV(pwm_m, PWM_CLK_MN_CTRL, 0, 8);
> +static C3_COMP_GATE(pwm_m, PWM_CLK_MN_CTRL, 8);
> +
> +static C3_COMP_SEL(pwm_n, PWM_CLK_MN_CTRL, 25, 0x3, c3_pwm_parents);
> +static C3_COMP_DIV(pwm_n, PWM_CLK_MN_CTRL, 16, 8);
> +static C3_COMP_GATE(pwm_n, PWM_CLK_MN_CTRL, 24);
>
>   static const struct clk_parent_data c3_spicc_parents[] = {
>          { .fw_name = "oscin" },
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index 3e048e645b080f9e5982ef908e3f9c43578a0b5f..6d69b132d1e1f5950d73757c45b920c9c9052344 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -62,6 +62,15 @@
>   #define CLKCTRL_PWM_CLK_IJ_CTRL                    0x190
>   #define CLKCTRL_DEMOD_CLK_CTRL                     0x200
>
> +#define S4_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
> +       MESON_COMP_SEL(s4_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
> +
> +#define S4_COMP_DIV(_name, _reg, _shift, _width) \
> +       MESON_COMP_DIV(s4_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
> +
> +#define S4_COMP_GATE(_name, _reg, _bit) \
> +       MESON_COMP_GATE(s4_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
> +
>   static struct clk_regmap s4_rtc_32k_by_oscin_clkin = {
>          .data = &(struct clk_regmap_gate_data){
>                  .offset = CLKCTRL_RTC_BY_OSCIN_CTRL0,
> @@ -2559,484 +2568,45 @@ static const struct clk_parent_data s4_pwm_parents[] = {
>          { .fw_name = "fclk_div3", },
>   };
>
> -static struct clk_regmap s4_pwm_a_sel = {
> -       .data = &(struct clk_regmap_mux_data) {
> -               .offset = CLKCTRL_PWM_CLK_AB_CTRL,
> -               .mask = 0x3,
> -               .shift = 9,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_a_sel",
> -               .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_pwm_parents,
> -               .num_parents = ARRAY_SIZE(s4_pwm_parents),
> -               .flags = 0,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_a_div = {
> -       .data = &(struct clk_regmap_div_data) {
> -               .offset = CLKCTRL_PWM_CLK_AB_CTRL,
> -               .shift = 0,
> -               .width = 8,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_a_div",
> -               .ops = &clk_regmap_divider_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_a_sel.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_a = {
> -       .data = &(struct clk_regmap_gate_data) {
> -               .offset = CLKCTRL_PWM_CLK_AB_CTRL,
> -               .bit_idx = 8,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_a_gate",
> -               .ops = &clk_regmap_gate_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_a_div.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_b_sel = {
> -       .data = &(struct clk_regmap_mux_data) {
> -               .offset = CLKCTRL_PWM_CLK_AB_CTRL,
> -               .mask = 0x3,
> -               .shift = 25,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_b_sel",
> -               .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_pwm_parents,
> -               .num_parents = ARRAY_SIZE(s4_pwm_parents),
> -               .flags = 0,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_b_div = {
> -       .data = &(struct clk_regmap_div_data) {
> -               .offset = CLKCTRL_PWM_CLK_AB_CTRL,
> -               .shift = 16,
> -               .width = 8,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_b_div",
> -               .ops = &clk_regmap_divider_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_b_sel.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_b = {
> -       .data = &(struct clk_regmap_gate_data) {
> -               .offset = CLKCTRL_PWM_CLK_AB_CTRL,
> -               .bit_idx = 24,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_b",
> -               .ops = &clk_regmap_gate_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_b_div.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_c_sel = {
> -       .data = &(struct clk_regmap_mux_data) {
> -               .offset = CLKCTRL_PWM_CLK_CD_CTRL,
> -               .mask = 0x3,
> -               .shift = 9,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_c_mux",
> -               .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_pwm_parents,
> -               .num_parents = ARRAY_SIZE(s4_pwm_parents),
> -               .flags = 0,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_c_div = {
> -       .data = &(struct clk_regmap_div_data) {
> -               .offset = CLKCTRL_PWM_CLK_CD_CTRL,
> -               .shift = 0,
> -               .width = 8,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_c_div",
> -               .ops = &clk_regmap_divider_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_c_sel.hw
> -               },
> -               .num_parents = 1,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_c = {
> -       .data = &(struct clk_regmap_gate_data) {
> -               .offset = CLKCTRL_PWM_CLK_CD_CTRL,
> -               .bit_idx = 8,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_c",
> -               .ops = &clk_regmap_gate_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_c_div.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_d_sel = {
> -       .data = &(struct clk_regmap_mux_data) {
> -               .offset = CLKCTRL_PWM_CLK_CD_CTRL,
> -               .mask = 0x3,
> -               .shift = 25,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_d_sel",
> -               .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_pwm_parents,
> -               .num_parents = ARRAY_SIZE(s4_pwm_parents),
> -               .flags = 0,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_d_div = {
> -       .data = &(struct clk_regmap_div_data) {
> -               .offset = CLKCTRL_PWM_CLK_CD_CTRL,
> -               .shift = 16,
> -               .width = 8,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_d_div",
> -               .ops = &clk_regmap_divider_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_d_sel.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_d = {
> -       .data = &(struct clk_regmap_gate_data) {
> -               .offset = CLKCTRL_PWM_CLK_CD_CTRL,
> -               .bit_idx = 24,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_d",
> -               .ops = &clk_regmap_gate_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_d_div.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_e_sel = {
> -       .data = &(struct clk_regmap_mux_data) {
> -               .offset = CLKCTRL_PWM_CLK_EF_CTRL,
> -               .mask = 0x3,
> -               .shift = 9,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_e_sel",
> -               .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_pwm_parents,
> -               .num_parents = ARRAY_SIZE(s4_pwm_parents),
> -               .flags = 0,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_e_div = {
> -       .data = &(struct clk_regmap_div_data) {
> -               .offset = CLKCTRL_PWM_CLK_EF_CTRL,
> -               .shift = 0,
> -               .width = 8,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_e_div",
> -               .ops = &clk_regmap_divider_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_e_sel.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_e = {
> -       .data = &(struct clk_regmap_gate_data) {
> -               .offset = CLKCTRL_PWM_CLK_EF_CTRL,
> -               .bit_idx = 8,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_e",
> -               .ops = &clk_regmap_gate_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_e_div.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_f_sel = {
> -       .data = &(struct clk_regmap_mux_data) {
> -               .offset = CLKCTRL_PWM_CLK_EF_CTRL,
> -               .mask = 0x3,
> -               .shift = 25,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_f_sel",
> -               .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_pwm_parents,
> -               .num_parents = ARRAY_SIZE(s4_pwm_parents),
> -               .flags = 0,
> -       },
> -};
> +static S4_COMP_SEL(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 9, 0x3, s4_pwm_parents);
> +static S4_COMP_DIV(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 0, 8);
> +static S4_COMP_GATE(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 8);
>
> -static struct clk_regmap s4_pwm_f_div = {
> -       .data = &(struct clk_regmap_div_data) {
> -               .offset = CLKCTRL_PWM_CLK_EF_CTRL,
> -               .shift = 16,
> -               .width = 8,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_f_div",
> -               .ops = &clk_regmap_divider_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_f_sel.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> +static S4_COMP_SEL(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 25, 0x3, s4_pwm_parents);
> +static S4_COMP_DIV(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 16, 8);
> +static S4_COMP_GATE(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 24);
>
> -static struct clk_regmap s4_pwm_f = {
> -       .data = &(struct clk_regmap_gate_data) {
> -               .offset = CLKCTRL_PWM_CLK_EF_CTRL,
> -               .bit_idx = 24,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_f",
> -               .ops = &clk_regmap_gate_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_f_div.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> +static S4_COMP_SEL(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 9, 0x3, s4_pwm_parents);
> +static S4_COMP_DIV(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 0, 8);
> +static S4_COMP_GATE(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 8);
>
> -static struct clk_regmap s4_pwm_g_sel = {
> -       .data = &(struct clk_regmap_mux_data) {
> -               .offset = CLKCTRL_PWM_CLK_GH_CTRL,
> -               .mask = 0x3,
> -               .shift = 9,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_g_sel",
> -               .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_pwm_parents,
> -               .num_parents = ARRAY_SIZE(s4_pwm_parents),
> -               .flags = 0,
> -       },
> -};
> +static S4_COMP_SEL(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 25, 0x3, s4_pwm_parents);
> +static S4_COMP_DIV(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 16, 8);
> +static S4_COMP_GATE(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 24);
>
> -static struct clk_regmap s4_pwm_g_div = {
> -       .data = &(struct clk_regmap_div_data) {
> -               .offset = CLKCTRL_PWM_CLK_GH_CTRL,
> -               .shift = 0,
> -               .width = 8,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_g_div",
> -               .ops = &clk_regmap_divider_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_g_sel.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> +static S4_COMP_SEL(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 9, 0x3, s4_pwm_parents);
> +static S4_COMP_DIV(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 0, 8);
> +static S4_COMP_GATE(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 8);
>
> -static struct clk_regmap s4_pwm_g = {
> -       .data = &(struct clk_regmap_gate_data) {
> -               .offset = CLKCTRL_PWM_CLK_GH_CTRL,
> -               .bit_idx = 8,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_g",
> -               .ops = &clk_regmap_gate_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_g_div.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> +static S4_COMP_SEL(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 25, 0x3, s4_pwm_parents);
> +static S4_COMP_DIV(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 16, 8);
> +static S4_COMP_GATE(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 24);
>
> -static struct clk_regmap s4_pwm_h_sel = {
> -       .data = &(struct clk_regmap_mux_data) {
> -               .offset = CLKCTRL_PWM_CLK_GH_CTRL,
> -               .mask = 0x3,
> -               .shift = 25,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_h_sel",
> -               .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_pwm_parents,
> -               .num_parents = ARRAY_SIZE(s4_pwm_parents),
> -               .flags = 0,
> -       },
> -};
> +static S4_COMP_SEL(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 9, 0x3, s4_pwm_parents);
> +static S4_COMP_DIV(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 0, 8);
> +static S4_COMP_GATE(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 8);
>
> -static struct clk_regmap s4_pwm_h_div = {
> -       .data = &(struct clk_regmap_div_data) {
> -               .offset = CLKCTRL_PWM_CLK_GH_CTRL,
> -               .shift = 16,
> -               .width = 8,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_h_div",
> -               .ops = &clk_regmap_divider_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_h_sel.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> +static S4_COMP_SEL(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 25, 0x3, s4_pwm_parents);
> +static S4_COMP_DIV(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 16, 8);
> +static S4_COMP_GATE(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 24);
>
> -static struct clk_regmap s4_pwm_h = {
> -       .data = &(struct clk_regmap_gate_data) {
> -               .offset = CLKCTRL_PWM_CLK_GH_CTRL,
> -               .bit_idx = 24,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_h",
> -               .ops = &clk_regmap_gate_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_h_div.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> +static S4_COMP_SEL(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 9, 0x3, s4_pwm_parents);
> +static S4_COMP_DIV(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 0, 8);
> +static S4_COMP_GATE(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 8);
>
> -static struct clk_regmap s4_pwm_i_sel = {
> -       .data = &(struct clk_regmap_mux_data) {
> -               .offset = CLKCTRL_PWM_CLK_IJ_CTRL,
> -               .mask = 0x3,
> -               .shift = 9,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_i_sel",
> -               .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_pwm_parents,
> -               .num_parents = ARRAY_SIZE(s4_pwm_parents),
> -               .flags = 0,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_i_div = {
> -       .data = &(struct clk_regmap_div_data) {
> -               .offset = CLKCTRL_PWM_CLK_IJ_CTRL,
> -               .shift = 0,
> -               .width = 8,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_i_div",
> -               .ops = &clk_regmap_divider_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_i_sel.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_i = {
> -       .data = &(struct clk_regmap_gate_data) {
> -               .offset = CLKCTRL_PWM_CLK_IJ_CTRL,
> -               .bit_idx = 8,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_i",
> -               .ops = &clk_regmap_gate_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_i_div.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_j_sel = {
> -       .data = &(struct clk_regmap_mux_data) {
> -               .offset = CLKCTRL_PWM_CLK_IJ_CTRL,
> -               .mask = 0x3,
> -               .shift = 25,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_j_sel",
> -               .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_pwm_parents,
> -               .num_parents = ARRAY_SIZE(s4_pwm_parents),
> -               .flags = 0,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_j_div = {
> -       .data = &(struct clk_regmap_div_data) {
> -               .offset = CLKCTRL_PWM_CLK_IJ_CTRL,
> -               .shift = 16,
> -               .width = 8,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_j_div",
> -               .ops = &clk_regmap_divider_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_j_sel.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_pwm_j = {
> -       .data = &(struct clk_regmap_gate_data) {
> -               .offset = CLKCTRL_PWM_CLK_IJ_CTRL,
> -               .bit_idx = 24,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "pwm_j",
> -               .ops = &clk_regmap_gate_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_pwm_j_div.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> +static S4_COMP_SEL(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 25, 0x3, s4_pwm_parents);
> +static S4_COMP_DIV(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 16, 8);
> +static S4_COMP_GATE(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 24);
>
>   static struct clk_regmap s4_saradc_sel = {
>          .data = &(struct clk_regmap_mux_data) {
>
> --
> 2.47.2
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

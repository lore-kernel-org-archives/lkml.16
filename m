Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2047.outbound.protection.outlook.com [40.107.102.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E5B1E1C36;
	Mon, 10 Feb 2025 11:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187520; cv=fail; b=II2bHUr55SXg/NLHrfq/poK1fnjoA7gRHVU8jcZFYaGuNWIXgFtlM5AQzwk+4TAJdjmOEN845VyQ+1w0kfVpm30foqE15sCI3z5ztxCGd85CEL1WlhhqzobXFTP0MBDfI10agavtA1g4cg8AO4mhvjiyN+s9WlfktffPrDwOD0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187520; c=relaxed/simple;
	bh=625xC9ePmHzCatvtK5FEyFhMRzBNOS56XvDtv1ksP6g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nK/nc/mliJPd8152ph4TyV0ln7dQenzKwLHyM6hUXiRKysv1MP17yHsPyG4qQRxeoXBGgUBp4NDNr66UeNd6jG0BcLWqUNagSCwf3jhUwTkH3Ft5gZXrv7nXAI94d+lraGQ2kKnbGnN0i71FiOqDUulJzIsET6AUHPFxKPV5XsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wM53tjdW; arc=fail smtp.client-ip=40.107.102.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wM53tjdW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJqGErc3UVWP/45B4oL6LJolwTfwX+blB1ihh7Lzq6IdQx0MbaCfs7daubvyalGQeEtV+7shFudQ/8a8zBt/Kn+EhPb0FVgm62p2CuIW3xrTuIeQb611vh96Z+MF3UGFKjOUlZXCj6RROOIfbNtOOCY1k38dadpRkmaLq6lupqUyIgMJL/c88sO7fE7y7AqIZ4YFZUDWLwWFdYSkmGuB06qWXpq14MX9VwGsH2EsZpwvDH+fu2mFg/0Vedvl8ti57wLP3X2svYyHNJXS+Mo0sI3XMbmhF3XYXVMe2eCjZ2hNOCJ4eFw5qHx84fZK/CFt320NBvpw2LUpvvvNjGxZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuPDYBBcAEtczBnt//PwowMM+FEbrsj7yew5VUrtvFI=;
 b=vLaYP5coObd0tdyrNjhL6cT0McOlS3BLLMOtw11qSoliTGskF4o6IGoMfDHccfOexg1/VL0s9W9QgH338LCsFDZsaDiuGeFW1hrVH7eHUAVBbnCB3HCg/gTNHcG4z+irNjbo/MbCmKsXjbDJbg9lrQ30tGJZ/12C/ggXFedPTnBnMLQAVCz744AqL+OrYq2lCQTabEQTttmogjTSVP5cmLKIhl+U970BlvzMDNsVRowxBAxSPu1oCLimq5YU/waygtSjfhIlKcUr/buVpfk+QxoK0QknSCwJ4aUdbFzJ9vOaWAgtKVLkFtB5Mk5DSg2UW86UDs/UGtdMnqrWRd9MXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuPDYBBcAEtczBnt//PwowMM+FEbrsj7yew5VUrtvFI=;
 b=wM53tjdWPtqhCf4GV3o0uQW+NcgpBUGPZn+yRtxuCogjfU9xkLCg+xpITKPY5XW9CpDdteOoX3y2eqrcHloQhs7Ju6qlTPtTZMcxjMGnTmr3cow54EKvF7nuPlUyt1VyQr2XOW7LGjaXaY6rFwIiPw1uYYHGPMGysLz5EQvqjbY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by CH3PR12MB7737.namprd12.prod.outlook.com (2603:10b6:610:14d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 11:38:36 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 11:38:36 +0000
Message-ID: <3f84884e-62e6-4b43-aa86-e1fe03507631@amd.com>
Date: Mon, 10 Feb 2025 17:08:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: SOF: amd: Drop unused includes from Vangogh
 driver
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: kernel@collabora.com, sound-open-firmware@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250207-sof-vangogh-fixes-v1-0-67824c1e4c9a@collabora.com>
 <20250207-sof-vangogh-fixes-v1-2-67824c1e4c9a@collabora.com>
From: potturu venkata prasad <venkataprasad.potturu@amd.com>
In-Reply-To: <20250207-sof-vangogh-fixes-v1-2-67824c1e4c9a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::22) To PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5951:EE_|CH3PR12MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: d73c4218-5955-4197-8022-08dd49c774d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1ZUV2cvL0FYYlF0R0h6RGFvQWdmUnUvaTBldVpTRzRzZWNBT3RoT2NWdCtJ?=
 =?utf-8?B?S0dJblJBSkRIQzFGRzJYVUk5OWN4bUo4eVZ6cTdRNDNIcHRGdkg4WThxUnVG?=
 =?utf-8?B?MGRxRkVBTElCU1NWVmJxZzE0a0EwVzlhMkQ5SisxQS9lSzRTVy90Skw1aWJM?=
 =?utf-8?B?VHd0U0R0M2ZKR053cyt2V21OU3lDWHFaUG5qY3lWM2RpWmdEbUxrU1pRN1l3?=
 =?utf-8?B?YzNKQS9yd3k5c3dXVU80OVpFbStIVDB1cUphQTR4aDJZb2J1Wnk5emdGOUtH?=
 =?utf-8?B?L1Z1MHQ2YlVHMGpYQWN2bkRSWFczSWM1SEdNekRUWThXSCt3K1Y5SjhtUDBO?=
 =?utf-8?B?UFN5dzFkcXBsYXVsUmFlY2VhUEtka0JUc1l6U3BMMXdoOXNxbDlUSVlhNFFG?=
 =?utf-8?B?Yk9MUVlXdk14QWlSYTZ3UDdnREI0OCtTN292cEszOHpwbWFmc2xDcFVPa0g0?=
 =?utf-8?B?N3JlN1hXeW5VNU5TZ3VSNlBNU29qSlZWcER1Qk9mNUhTcnc2cjFocThlT0RK?=
 =?utf-8?B?dTluWGoydTRGemhhRi9HanN2ZFR3V0RmUmdvNGFDbnNONkh1SENNbTBlUFNk?=
 =?utf-8?B?S3R4RGo2WmdwU1AxenV2Ymh0MHdCWU1rZlM1NHd6NC9NTnpKVjBaTkYzaEZv?=
 =?utf-8?B?WExEc0k2ZGZoOTdDalZveHA0NGltMkovYVdZaHRBUVJ4U3ZNdXgrUEo4a3dS?=
 =?utf-8?B?WWZJMk5kSUp4ekpZY1duUU85S3ZDZVBDbWVWVEorTHpmcFl6R2VYWHl2VzJU?=
 =?utf-8?B?dFFlNXJuTFl5RkViTWw4QUV3TzkzTCtFcmpsRzR4bUwvSEFwREh3dzlWdUJh?=
 =?utf-8?B?Q2swVk0xMjZhc2I2SlZ2S2FiOFJQWkt5anhIVWJXQ29kRVdGejVNcXo0ZnVv?=
 =?utf-8?B?NkR0dUFudzB0TWhFYzhKTVhWSmMvZW1RSHBhZnVXdEN2ZlNEdmtRb29MejFh?=
 =?utf-8?B?OE1xUllXYjRsemhuOWUxdmhCUlhDck1CQXpHeFFSckY4VGd4dy9uT2haeUZr?=
 =?utf-8?B?a1FhV0dwaCs5eVpPbFNyQmZ6VXkxN0pMRHVsR0x3cWlsM2g1Nys2VTU0SURP?=
 =?utf-8?B?RWJ4Y1pGSGtjT3U0U0NRUitBYkp6czQvUllZeWVsZTBRSVRTYm8vYWlSWS90?=
 =?utf-8?B?RDFUKzVsZnhJMDFMVkNCUjlMN0h2b2c5VVIyMXNMbG1lOHhvbjZFZ20wU1Fa?=
 =?utf-8?B?STM5YnNxTk9SMmM0SEpkWkV6OExDbU9UeGZPZE03VmgvQnBJY1k3ZW9HcHpC?=
 =?utf-8?B?N0xWRThxQUlLS0g0cU5DZ3Zva0ZnMXp1dVNjTWNVREI3dTRzTitvaUVWSUtG?=
 =?utf-8?B?bFo4bW1iZWdYSFhsNFdKaXF1cmJaS01OS0VFaysyMVJuT0tkdFp6SG1pWGxZ?=
 =?utf-8?B?UFpwcnJIMXFtTXpmYW9VYXorQWRUb0NLZzdZZVRRR3V0Zm9Cd3R1cEVVZFRZ?=
 =?utf-8?B?VnlWZ3oxdTlUYUhVZThjSmp1NHY0T2t2djUwN1JsTEN5blpiZ085RE9yaW5j?=
 =?utf-8?B?LzdJZ1pPcHFOZHhGNUtPeWxIcHpBMUtMb1QwYjlTTGVSRHFuNWZBcXlQeUNv?=
 =?utf-8?B?Q1BseFB1cnRPOUlYNk1oaG5nT3ZvK1FMOTZsWW5KN3F1SENBMkhuQy92b1d6?=
 =?utf-8?B?YnFETnN4cWRFUkNpTi9pUmwxNDI0cld2VkhkNnZ6OWhQQUdxdXE4VlkxTzhC?=
 =?utf-8?B?RVRoWG54LzlpM3FCZmxPSU5zcHZFbC9pR2pmb3djejZxazNYa0tWUnQ3RVpL?=
 =?utf-8?B?RUZxWmR6bGFaMURza3FkK1RTbi9yWTYxTTg5emVjSk9kS0RDTUpZa1VVa1pI?=
 =?utf-8?B?dnFtMnR6UEdWVE5jT3BYeXdrcHlTeEpuWHJYMHNXamVndzdHVHEwUUk5d0Jl?=
 =?utf-8?B?U0NXc3FjWDdYQnA0SzA4L0FQWmFycHV2T2xLZEhnSW0rQXV4OEc2YzR5Sjhs?=
 =?utf-8?Q?8HXo6meTKCM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5951.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXE2SEtlN1RxdHdQOHhrS1QrL3BTUGIzVUo0b0RXOHVxbytXa2Nmc0x4TVlY?=
 =?utf-8?B?VWxiVlR6QkQxNmt1ekQwV3ZWcDU1SUZwaXJWaEEwNTYvNnVUM2FEQ1FtSHBu?=
 =?utf-8?B?R0xlbkFTazZUT2NkOTlXcWs3NWdSd0VuNWVEME05MDNUVEUwU3BPSktFRFdK?=
 =?utf-8?B?YjVYSFNGVitsdHJDNXh3QkhnQmZ4Vnd1blpDcFZaUHJkSm1SdktwWGVvZVRP?=
 =?utf-8?B?a3E0MDNlQzdiMXFlSDhaM0FrRlpnNTlXMnRITkdWZFllS2JLUGFMeUQyZFdB?=
 =?utf-8?B?eVU3djNtTFp6ZzRQSzNTODNUTysxSXkyK0cxSHpWd1hEekVNT3h1VlZoT2ZL?=
 =?utf-8?B?UlZLSWgwcER0bDZiWjhxelNwUGM5ZXBHdFFpeXJ2ZGh3akRsZTNORDFLSVFX?=
 =?utf-8?B?ak4yQ21ma2h6RkhsLzVPc25mRlluTVFieDRZdWI2cEtOUkpyTEFGWVdPV015?=
 =?utf-8?B?TUxiZ2V3YTF1U3RQZFkxM3F0aWJuUnBVZ2RnbkpjS2pCdm9vc3E2R3Q3aSsx?=
 =?utf-8?B?YVQrWUoyOEpoU3pPSCtkZ054YWlDbDdGRS93Y2JMcm0zTFp5Z0c0T1pEMzF0?=
 =?utf-8?B?NlpBYi9ZT2RJeFZDSnR0eXljUmZkTnBpR3ppUUVJYWVkRHBMam1kd2hzdjNo?=
 =?utf-8?B?RXdiTllGalI2MVZNY3NleDdxQURVUlFVMk0vSDBDbHY0T2tpY1ZOZDFkSFY3?=
 =?utf-8?B?dVlyeWo4endPWHM4cWVRdVNzS2d0ckdBV2tFaGI1RFJUYmZxQnpHTUIxcDF5?=
 =?utf-8?B?eUE4dkR1N2VQcnlnVEFaQ0hzbDFYQzlSV3J4NzFWQnhDUXdTeVBxQ2xzeFls?=
 =?utf-8?B?R1FhRnQrNElRVTY4cHJ4c2E5ZHlmMk4xSGNjR3UrUEZyK2Y2WFVVdGQwbzVT?=
 =?utf-8?B?UkpTVEZZdWVSVnJIMk8xaEZWSXk3NjUxWHFPZEtYQXkzcUpUZ0Flem5QVVZ2?=
 =?utf-8?B?RXNvRmxJRENJQ2FJWE1GcnJ1a3p2TkR5c1l3UUEyNkNtR0pBVGpSUEhuSkVK?=
 =?utf-8?B?OUthUWNsTkZpUTZ4Z2djV0s4NVA2dURwaFdnYmJoOFpFL3A3dUgyZ0UzNXJH?=
 =?utf-8?B?clozRVdhR2R3QkdxZXZaYnRsQW1vK2c5SGVFZzFndi9SRStYVmJkNkF4Um1t?=
 =?utf-8?B?dS9ORTViNjRsV2lYYjl2elZvNklKMGV6UDVOT0JiUVVDWFlLZzhGMm9VVnlB?=
 =?utf-8?B?cjNGVVVEZHUzRExkZDY0TEt6TTkwbUE3Q0VYRiszcnBDeTgxcjg5WmNPbTIv?=
 =?utf-8?B?RFJCKy9ib2J5U1U0MG1yWENVMTR1bU4xb21xTFBYbkZIRHAyT3pvd3N5djRj?=
 =?utf-8?B?OGtRdEY0Y08zQVVQcG9abU1BbVpVN2FpVmlkbDk0Q2hRQTZEQm9kL3N4UUJW?=
 =?utf-8?B?RmwwcVQ3ZzBmRVY3aThBcEZGSGFnM05ER0dYajBsSVlxVWtYcHJGQmJ1a0sr?=
 =?utf-8?B?OEc4N3pORXpKdktpNnVXK0dieU5Uc2Q1cG5aYXFCUTVuTEZoMWRyVTgxZjE2?=
 =?utf-8?B?T1ZwaFp6TEtUbUFkVjBGbkpER3lmU0k3cnhWSWtRaVRpcUlzdmtnMHd3R09I?=
 =?utf-8?B?NTFha3krMUFiRzdiMnlJbXZjdGhBU25YRlE1MHA1T0hJRmRFWms5RWliOS9n?=
 =?utf-8?B?QVdlY3ZkZDdyZkU5Ym0vMjYzSytOczBFQkNNVnVDbU9FMGIrT3RUZzdLZDZa?=
 =?utf-8?B?Qk4wWlRHd1lYVHZGbnMvMTBMVlB3eC9ENXhtdkZzQ2tIWnRCLy9UdzdDSXZl?=
 =?utf-8?B?dkdsbElraUpRNXNoYWRhNjg2T1Y1ZkdGQit2WDNqdmZvQ2txdXVtMTNjMGNy?=
 =?utf-8?B?Wi9aNzBET0JFRTFoUkxRaW5tRDA3Z084SzJiU1hHVmhGcHdINWdZZDByUmQy?=
 =?utf-8?B?aHV1cW4renZreFNES3FuSHdNZXBYcG50dk9Vb2NocENoU3llUUpjbkZ1VE4w?=
 =?utf-8?B?NkZ0N1BheUhKMHVJL2FsbzFjWXJGV0c5QXc1NSs2SlBPcEhLMlFPY2tuVXNX?=
 =?utf-8?B?aDJ1Qm5PR0VvRTB3aGlvMDB2aHV4b2UvV05BdGpzejZuRjg1L2cwaW9aQlFY?=
 =?utf-8?B?dkpKaDlxL2hsNi9DOGg2YXM5VGVxSExKOVlzQ0pkbE1nZi9aYk50UDJ1RS9M?=
 =?utf-8?Q?XzjPxvwK4WfSUqQ/CdOerEBfr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d73c4218-5955-4197-8022-08dd49c774d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 11:38:36.7085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SItnys9q32KAUiqpcYME9QuzJtfXZpdVS+gjlLOITIljVivanAKDvFon+p7hKMKntDMwePdPeMg747kY54Q9yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7737


On 2/7/25 17:16, Cristian Ciocaltea wrote:
> Remove all the includes for headers which are not (directly) used from
> the Vangogh SOF driver sources.

Okay.

Reviewed-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>

>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>   sound/soc/sof/amd/pci-vangogh.c | 2 --
>   sound/soc/sof/amd/vangogh.c     | 4 ----
>   2 files changed, 6 deletions(-)
>
> diff --git a/sound/soc/sof/amd/pci-vangogh.c b/sound/soc/sof/amd/pci-vangogh.c
> index 53f64d6bc91bae9e2ec506384a83b209a296860f..28f2d4050a6769335b5908c16946eff85aa7161d 100644
> --- a/sound/soc/sof/amd/pci-vangogh.c
> +++ b/sound/soc/sof/amd/pci-vangogh.c
> @@ -13,11 +13,9 @@
>   
>   #include <linux/module.h>
>   #include <linux/pci.h>
> -#include <linux/platform_device.h>
>   #include <sound/sof.h>
>   #include <sound/soc-acpi.h>
>   
> -#include "../ops.h"
>   #include "../sof-pci-dev.h"
>   #include "../../amd/mach-config.h"
>   #include "acp.h"
> diff --git a/sound/soc/sof/amd/vangogh.c b/sound/soc/sof/amd/vangogh.c
> index d5f1dddd43e72dd62b3d031130193e6125edf9df..6ed5f9aaa414e696b0ae9b3bb83bd92a5dcd8d4b 100644
> --- a/sound/soc/sof/amd/vangogh.c
> +++ b/sound/soc/sof/amd/vangogh.c
> @@ -12,13 +12,9 @@
>    */
>   
>   #include <linux/delay.h>
> -#include <linux/platform_device.h>
>   #include <linux/module.h>
>   
> -#include "../ops.h"
> -#include "../sof-audio.h"
>   #include "acp.h"
> -#include "acp-dsp-offset.h"
>   
>   #define I2S_HS_INSTANCE		0
>   #define I2S_BT_INSTANCE		1
>

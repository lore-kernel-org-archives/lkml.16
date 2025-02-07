Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333E381E;
	Fri,  7 Feb 2025 12:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931734; cv=fail; b=UK/MfuALOE3Kdg7yGZxTgfIGpcWkh+p0JAr+/yEy2q13Nfsj5CRzCy2GKdAslI+YhwGY6Ep4cQ3VJQLdze9iG0adFXEmnEUEDW4yJjEB0/P8gpbbpjMaeQWE+Rse+UaQhQglznVjIHhaEp2mcKnUr6frms8GWSyZn2aqUxgrAzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931734; c=relaxed/simple;
	bh=PCfIfjPpzVQvQnczhufiu7HHbsBt91pJ7r6m//2dAfs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dfur/V0VwAlvLAzgp+vRZ839qBBuNnzHUDLZw0+LZu43jmbNsNEyj5+mDMHcW24Za5QWK3RoFRwzd325vIeyGi8kRT97edxlLx+1S5iVPdwX9ZvTuUwMeWteXek03IiaKvOK1x/LSTFibgoH2MB0b989D9YJ9e3z30F2EgI+ZKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hL4iXrA4; arc=fail smtp.client-ip=40.107.243.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hL4iXrA4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ue8ajP+jqmJOQQbDsfxsSv4EutV80yRsHGOSTrgSPrG0cPtoEPAvSDYfAoufQw3dKZRb5RSb93gXeoPLn8xI+O0OoDgjGm28fG0bkiG48MYQ2ciG1POA9RBIZMrBuHse6OcA5jA9EGOz2gtDKTeabdZ20lsxGpe/TIP9Tvgtt2KQTUpJ+V4gDxSJMlm4rigep+b/2/lNeGeMZSeJf25mxSNLOE1oyBkt7QyNV+v/t43tDDXsbrsCpyuKSeDA3FrOAMyzKvOXY5LzNZGL+GvHJuefynhKW3UKcWhuqpFNit6o6vGLpLNA+b69XtbdxaDobAiNxe8VKZOo0sWPyFDzcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zB2RM8E8EHd2U19TcWD1NIux7ukukdnHf+Koa4ykho=;
 b=NnUjV8HK9ci4FDlEYYHiGErke9I60JTLommF8Nbvsh++cdE7TNVRqgRjiDtk7WtIOWWzs1CD9s88VakUpDJEZylpNaXCHPfFiRbAoXEhvyFT2D0wrG9MMiRitJwfcHQE7befXR6OBsEbXdS5kbavIVWqWVBvkCVKZTauOha6PAVB2TWSmZyvlZjUf66zT4CR/eJfLkQt457MDxWgconGvhGFPdFQJl2tkx66hAyS/10b0NMnS6u8EPDY2sa4RkWRm2EbJ1I5EGbxvo6L65VwxAggcfUT/p53wATyhppW54xy3bT8amd2g8LigHSPq0p3NIwg9PYn5OYgCUKETv/sRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zB2RM8E8EHd2U19TcWD1NIux7ukukdnHf+Koa4ykho=;
 b=hL4iXrA4zwjsDay0IQND570iwQtTpqzgmJWi1F34p/9M+FOSfK7lVwYl2QfNh5EtmZG+zJ8RtTaOTrjuWJZ326saoFyUn2gBNOfAprJKqRI5GPy2doU3+euviimbLeNVK8MswqV98dwR1ITSQ2q36RYfZWq+Lzv41sMBypu285c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by PH0PR12MB7908.namprd12.prod.outlook.com (2603:10b6:510:28e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.28; Fri, 7 Feb
 2025 12:35:28 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%3]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 12:35:28 +0000
Message-ID: <b9c412cf-32af-4cc7-af6d-d4be5b796ccd@amd.com>
Date: Fri, 7 Feb 2025 18:05:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: SOF: amd: Add post_fw_run_delay ACP quirk
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
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 "Hiregoudar, Basavaraj" <Basavaraj.Hiregoudar@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
Cc: kernel@collabora.com, sound-open-firmware@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250207-sof-vangogh-fixes-v1-0-67824c1e4c9a@collabora.com>
 <20250207-sof-vangogh-fixes-v1-1-67824c1e4c9a@collabora.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20250207-sof-vangogh-fixes-v1-1-67824c1e4c9a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::26) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|PH0PR12MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bcb3fd6-a3db-468d-0486-08dd4773e754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTdRVzI0emV0QkJ4YnRqMHJoOTEyS043cWNXWUFicWl5S051RnliZlovdDhZ?=
 =?utf-8?B?T0FRbllyVCszNEdGQWpMenhhZFc0cHk0WVpYVi9Va3VSbFU3eXVyS2NLQ2Nk?=
 =?utf-8?B?VWhTMjhQdmlPUWVKWG9lM2QvVDdQbGFGZ0N2WjJOQ3oydkhUWEpxSVNWcFlV?=
 =?utf-8?B?ZmhsMzhBNFVCdWpqUHI0Qm1Lc29UUDR3WVJRbXo4NDN6R1kzc1RFbDBLNHIz?=
 =?utf-8?B?Ykt2T0E2d2ZsWk83M2NBQ0o4SzFDa2ZidHdFcFJ6NXY2cGgyOFE0QjZCU2lI?=
 =?utf-8?B?ZzUxekhkWEl1VUdRdExjSWpKTXRQLzFMMGdQM3QxYm1BUXZRUFBQekhlbzlF?=
 =?utf-8?B?UHAybTRhVGpNVkNJTjBYT2p5Qy9oWGR3dFI4NUx3NDdBUGR4d2xtZ3hKVzhG?=
 =?utf-8?B?KzVqRVczOHJRcWRBVzhQVFM0UHRua2dHK0dWdWMzVjdxZnJ0QnlHd1ZpM0hp?=
 =?utf-8?B?NjF1MzFyL2hRVXNGd2N3ZTVHSjY2UkZycnI4QWtjTUNWZWNzTnFMSVNzaHE5?=
 =?utf-8?B?S29UU2czNE5sbDl6dEM3RTA5ZmpUMzVMZHpGMEJtM1lORllNalY5YkxacHhY?=
 =?utf-8?B?L3RlRW5VUllQOGpBbXVLaDZHM0ZHcW9OVW9XamtaT1Uwc0pxREVlMjNHZThS?=
 =?utf-8?B?cEpzK3RkSlAyNEcwU1lkbjBkakxadTdLUldzbGo4bTV4Y2hPNWx1eUtSNERk?=
 =?utf-8?B?SlhJRytYUUx6RnhPYzR1N0lHN0J3VlFEOTFUZTcyZE90eHZUY3cxTWx0TEF1?=
 =?utf-8?B?emY2dW5ldWV1QzkrdXhHVkpWc3hCYU9tOHl3eWVOMnRyTkNTTHlsUUhvb0t3?=
 =?utf-8?B?eHhQZ1RuTm1kUElEeTZhdHNvQlBaRmJzREVXRnFHcnNjNXVTRVZ0MlNOdndK?=
 =?utf-8?B?TkpiR2pwbGRZZkhzT2d6SU9hOTBKcXpYVkZwTHpJTk1GWFQ1TVpjZUVCTXJm?=
 =?utf-8?B?T2EvcG12cEMyVEdTZHYvZWh1RWdteUlRZERYaE03MUpGVTFEQnRLcUVaaHdE?=
 =?utf-8?B?dmQxYldpTGtBcXVmWk42TnlTSjRkcnhxSUFWVWtDNG5uMVVUUlZQamZEMnF6?=
 =?utf-8?B?V2FqYXA1U0tRdE04L1V2aG9rcEE4dU80RnI2QjRhYkQ4VFptY3pMZVIzMFFK?=
 =?utf-8?B?dGYrSnViL1Y4ckZrdWZBVnJMR29pdm5adUMyMUNKYzdHb28xY3dWS2FsbDFO?=
 =?utf-8?B?SjJkV1BOYUJNUndING95RDFyM1JPMGZtelR6TEluUXBxMWtLNDhFNmpLMmR4?=
 =?utf-8?B?dklpTk1maTVXdytYaFAwVE9STGtCYllvdDByT0MxOElXM095LzU0MlZlMUtT?=
 =?utf-8?B?djE2dUkyZytlVkFiM1h1eDVpMzMyaVJwSlYyMW5MS2hBeU5wSFo4SitTWFc1?=
 =?utf-8?B?SEd3VGZidUxsVGszUWVDUFBCZ0VvUUd3VEQxQ3d1SnFnMDE3YmdDdXU5Sm5l?=
 =?utf-8?B?NStFR0gzcGVKOWxldmxJZzFMc3YyMk5xdkxRbjdCSkh4ZWR4MllKWDdMMWh0?=
 =?utf-8?B?dEp3U0NwQXJTa2Z1dUxQcHBqNGJDaElha0RrdE04U1pqQ2tkTFNLaEhsbWFy?=
 =?utf-8?B?d1BMWWRYUDBFMkNiT0dIY3VFRFg2UEZkcGIyMHo1b3Y1RFJsclpHU1d1Q3Br?=
 =?utf-8?B?eGVscUppUVhEY0NadXpsNjJnMVVveVl4a1g3MEpiRURPS3l0S0VUbDR6YlBa?=
 =?utf-8?B?aS9XekM5UUxnUlNidERHdi95anZ6eDYzK0ZHZkF3RFJFbnkwWHBnSWxMTUla?=
 =?utf-8?B?VnRKV1E2bStDVThuVHdwWDA3S1lWNGJ1QXBTTW5mVUsxaHFjUUhHbTNUR3d1?=
 =?utf-8?B?QVFpOUdtWkpOemdLT0dkRTNLMXZCTW1nSTBEUE5FL2JYTVFpQWxCZzRoNnNn?=
 =?utf-8?B?d1M4ZEJuSWdlNkRCOVNJRXI4VHhqcGpYTWt3bzFWV0JiRGRJQmZuN0ZONWpZ?=
 =?utf-8?Q?GK0XbF/ynfQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlhBUXJZUVZMdFNORmh2VzZ0UXNnYXVuU2d0VFFEZTk1Sm96VlVFYlNobzRw?=
 =?utf-8?B?NUR2TEtwNmE4NTdhRnBDMWNJYjFhQTVMWkN4ZXRBNklCRklDU3V0MS9jN096?=
 =?utf-8?B?d0F1UTFYbzVGeEJ3WEc0NFpqWHFlcklLN1VKc2dRaUIrNitaSDY3UmZnd3RG?=
 =?utf-8?B?bjNnZTh1Zm5pSkthUXlyMnVJb1VqS3JhNnNaSUhCREJpb3pCMWV0aVcxNi8r?=
 =?utf-8?B?NCtHaThkemJ1UEtSVzVxN0lvZFVJYjU3bnRpZ0VOanoyV3RHLzRoNVdwZllC?=
 =?utf-8?B?OHV4ZEJNMjk0QmRrcFdRRnpOaDhjcEhTck1MYlN5Y1V1UTNxL3NxT0tVN2RL?=
 =?utf-8?B?NXdjdDF5S043bTRUbmh5bjh3bk9mMEhXeFZnczR5cFpIZ1JJVFJiK1VQTHFC?=
 =?utf-8?B?QVRQYVBhK1lQYUJqTFNOeUVyMHp1VXVKYzBJOHpJQmpkM09rSFBtUlMwcHJJ?=
 =?utf-8?B?bFJtL0pDaG90VzdFVW5RY0kyY3VBejFxY1J4Ny9UR0JBU1QwY2lpUG5kN2xa?=
 =?utf-8?B?dk1CTmJnaUtVWCtPOWlnOGNIWUVVajBxRzVQWmdpckpBT2FaL25VZWFwaEtJ?=
 =?utf-8?B?ZHNzQlNSaVRicjk3RDUyQm9uVHptb2pMY1VWMzM0TFhQbkJFK29BV1FXU3M0?=
 =?utf-8?B?TWdUWFh0T2pYUVFGVUFiRCtTbFFvd085Q2dtUVltclVjZi9xSmZpeTBZOUZY?=
 =?utf-8?B?TXZVK3NlQ21jRENqdk4xUWFWK01PRWJSbTUwZmtzeDd4b3RIaGFBdVpPL2V3?=
 =?utf-8?B?RG5RWEcwY1QveG1xSXJzeks5dnF1dG5HTDBMdUJBMWlRV1FYYjFuY0RwYXVS?=
 =?utf-8?B?R2FjV1N0Vks0ZXA1T2Z4YllBNEdnZlUxTndTdE5FVXMwNVRsekM0RHEyaTFa?=
 =?utf-8?B?VEl3L2FkQzRVSnZQbDlwUTRGZS9nRXU4V2dGRjl2TjhxOVVraGl5YlFzKzNV?=
 =?utf-8?B?MnB6MXpzMytzMXgyVkIrZVQ1SU5YeStvYjQ4WTlrbDdwOHBkbW96bHNFUU5w?=
 =?utf-8?B?S1NPTG02R1ZrNGkxZFVWek5vUEZQNDRNNUo0aUFTSWhxcXZqc3UvTnREQ2ds?=
 =?utf-8?B?QjRhTk52Z3pCdnoxM0piSSswQjBnRS9QMDZObFU4VjFUR0thSWg4d0pKV2My?=
 =?utf-8?B?b3FCVGVudDROUGRzVWd0YmxheTQ4WUJmUytCckJxSytIOXJVT3JjZERrWU9M?=
 =?utf-8?B?SGxPQ2RCWEZkSDNKMGUwVFd6S3dyTjk0UWQyTkNjeHkxaDRhcjcrZU4wRW9v?=
 =?utf-8?B?d0M1YnNHQWo2c0IyWnpSSTVLUlN4blRUd3QrbXdjZHMwZThSbkR2OWltZ0xN?=
 =?utf-8?B?L1UyNXlUMW9mRWx6c0JkTUhkQ0RaSzc0UW15U3lobEtnWVB5RVNGQzkxK0R3?=
 =?utf-8?B?cXFjeW9FUEMyaE9MZzBCRk9HdGE3MEZPM2NVdE1WTEtIbUcyOFpJcTRBV1RI?=
 =?utf-8?B?MVVBaldCbjgwNTNQb2tXeXNQTHYvenVla1k3a3AxNU1uM2EwelR4cUhQOXRL?=
 =?utf-8?B?bEVqU0hUVlA1TmdyZFp5TWJRWHBtOVhnakRXdmh4Z25aU0IrckFlb042Q0Q4?=
 =?utf-8?B?aW5vbFY5WmorZW52NlNSSkxYQzB6WWlXV3FCeUNGczc1ODI0cUI2M1J4M2x5?=
 =?utf-8?B?VVV5bCtrSU8xdUZvbURVZDJBTnF2TUlYZmp0UXE4bldjZ0pnV2wxYTA0WmJS?=
 =?utf-8?B?SkZmZHdTREtCM2pnSkZtZ0M2SEVaVmhYUVhjc1lsS3VHZERLbUtSTjZQcXh0?=
 =?utf-8?B?cjZtWUpkbnV1Y1RiRjhkVERhK0d0dU90eU4rS2srZWplWU1YUzZTSlV5TWFC?=
 =?utf-8?B?WnlCWUNmdkJnazhvQUFXTlpJeGt2ZzVFLytoOE0vSWcxUEdJYXRNbm5iL1VN?=
 =?utf-8?B?SnlMNUU4Ymt6eXpWb1lTb2dSa1JuVDlOTkVMa3B5MmFQWnRRVDJZWGVOOW9N?=
 =?utf-8?B?b2p5VWY0KzVnUVlFeFVpOHdiRjlWbGtZQ3dLam5zUWd3VkU5b0NpNGMxYkll?=
 =?utf-8?B?ajBQUDdVeEFDVVd6dUh0KzgveHByV21obVgzSXQ1OXg5bE5aOEQxUTMrdlky?=
 =?utf-8?B?b0FuQWJhN0czZXZMNjJ3MUJCMkkzY0JSZEgzNTM0ckJOWTdMc0h4dUVrRmFm?=
 =?utf-8?Q?K4RA8LSDIGDsgTtha3K1TJgcN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcb3fd6-a3db-468d-0486-08dd4773e754
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 12:35:28.5635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4208G+u9D1TT7D0KEqRtwrn2PuOR1667pA6wQ6IU+F2nUGcPGQJJHCVBJCTerro04pS1821ji7S2kUYlFHi87Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7908

On 07/02/25 17:16, Cristian Ciocaltea wrote:
> Stress testing resume from suspend on Valve Steam Deck OLED (Galileo)
> revealed that the DSP firmware could enter an unrecoverable faulty
> state, where the kernel ring buffer is flooded with IPC related error
> messages:
>
> [  +0.017002] snd_sof_amd_vangogh 0000:04:00.5: acp_sof_ipc_send_msg: Failed to acquire HW lock
> [  +0.000054] snd_sof_amd_vangogh 0000:04:00.5: ipc3_tx_msg_unlocked: ipc message send for 0x30100000 failed: -22
> [  +0.000005] snd_sof_amd_vangogh 0000:04:00.5: Failed to setup widget PIPELINE.6.ACPHS1.IN
> [  +0.000004] snd_sof_amd_vangogh 0000:04:00.5: Failed to restore pipeline after resume -22
> [  +0.000003] snd_sof_amd_vangogh 0000:04:00.5: PM: dpm_run_callback(): pci_pm_resume returns -22
> [  +0.000009] snd_sof_amd_vangogh 0000:04:00.5: PM: failed to resume async: error -22
> [...]
> [  +0.002582] PM: suspend exit
> [  +0.065085] snd_sof_amd_vangogh 0000:04:00.5: ipc tx error for 0x30130000 (msg/reply size: 12/0): -22
> [  +0.000499] snd_sof_amd_vangogh 0000:04:00.5: error: failed widget list set up for pcm 1 dir 0
> [  +0.000011] snd_sof_amd_vangogh 0000:04:00.5: error: set pcm hw_params after resume
> [  +0.000006] snd_sof_amd_vangogh 0000:04:00.5: ASoC: error at snd_soc_pcm_component_prepare on 0000:04:00.5: -22
> [...]
>
> A system reboot would be necessary to restore the speakers
> functionality.
>
> However, by delaying a bit any host to DSP transmission right after
> the firmware boot completed, the issue could not be reproduced anymore
> and sound continued to work flawlessly even after performing thousands
> of suspend/resume cycles.
>
> Introduce the post_fw_run_delay ACP quirk to allow providing the
> aforementioned delay via the snd_sof_dsp_ops->post_fw_run() callback for
> the affected devices.
As per our understanding, Till ACP firmware starts responding to the
driver's IPC messages, FW won't acquire the HW lock.
Adding delay in post_fw_run() callback seems to not a correct solution,
as there are no IPC messages will be sent from host till FW boot ready
is received.
Is fail to acquire the HW lock is for first host IPC message?

>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  sound/soc/sof/amd/acp.c     |  1 +
>  sound/soc/sof/amd/acp.h     |  1 +
>  sound/soc/sof/amd/vangogh.c | 18 ++++++++++++++++++
>  3 files changed, 20 insertions(+)
>
> diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
> index 33648ff8b83365e76d7d90e52c2cb8f884a2fe72..9e13c96528be3371e063072513c118cfc8b93fe8 100644
> --- a/sound/soc/sof/amd/acp.c
> +++ b/sound/soc/sof/amd/acp.c
> @@ -27,6 +27,7 @@ MODULE_PARM_DESC(enable_fw_debug, "Enable Firmware debug");
>  static struct acp_quirk_entry quirk_valve_galileo = {
>  	.signed_fw_image = true,
>  	.skip_iram_dram_size_mod = true,
> +	.post_fw_run_delay = true,
>  };
>  
>  const struct dmi_system_id acp_sof_quirk_table[] = {
> diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
> index 800594440f73914e7b8ccaf86369ac686e1da630..2a19d82d6200223cdfccd49fbcf1b52968ae1230 100644
> --- a/sound/soc/sof/amd/acp.h
> +++ b/sound/soc/sof/amd/acp.h
> @@ -220,6 +220,7 @@ struct sof_amd_acp_desc {
>  struct acp_quirk_entry {
>  	bool signed_fw_image;
>  	bool skip_iram_dram_size_mod;
> +	bool post_fw_run_delay;
>  };
>  
>  /* Common device data struct for ACP devices */
> diff --git a/sound/soc/sof/amd/vangogh.c b/sound/soc/sof/amd/vangogh.c
> index 8e2672106ac60a22824836a944503a05616f8661..d5f1dddd43e72dd62b3d031130193e6125edf9df 100644
> --- a/sound/soc/sof/amd/vangogh.c
> +++ b/sound/soc/sof/amd/vangogh.c
> @@ -11,6 +11,7 @@
>   * Hardware interface for Audio DSP on Vangogh platform
>   */
>  
> +#include <linux/delay.h>
>  #include <linux/platform_device.h>
>  #include <linux/module.h>
>  
> @@ -136,6 +137,20 @@ static struct snd_soc_dai_driver vangogh_sof_dai[] = {
>  	},
>  };
>  
> +static int sof_vangogh_post_fw_run_delay(struct snd_sof_dev *sdev)
> +{
> +	/*
> +	 * Resuming from suspend in some cases my cause the DSP firmware
> +	 * to enter an unrecoverable faulty state.  Delaying a bit any host
> +	 * to DSP transmission right after firmware boot completion seems
> +	 * to resolve the issue.
> +	 */
> +	if (!sdev->first_boot)
> +		usleep_range(100, 150);
> +
> +	return 0;
> +}
> +
>  /* Vangogh ops */
>  struct snd_sof_dsp_ops sof_vangogh_ops;
>  EXPORT_SYMBOL_NS(sof_vangogh_ops, "SND_SOC_SOF_AMD_COMMON");
> @@ -157,6 +172,9 @@ int sof_vangogh_ops_init(struct snd_sof_dev *sdev)
>  
>  		if (quirks->signed_fw_image)
>  			sof_vangogh_ops.load_firmware = acp_sof_load_signed_firmware;
> +
> +		if (quirks->post_fw_run_delay)
> +			sof_vangogh_ops.post_fw_run = sof_vangogh_post_fw_run_delay;
>  	}
>  
>  	return 0;
>


Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C03207DE2;
	Wed, 28 May 2025 07:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419021; cv=fail; b=MX0KXXv1dULSzKqcdZkRQq5uCnBvymTPqxA7IO36pMGGt1LNJlkGaF3Efs9RBy7C8jVsKfWbnDnKDne7EPuOURb9V7il/vqu7CS8uXyCmMob9NhPTkaj3Nw/l8MNJKXvH/l66RI7GdXCwcTWxez8IqU6CUBT/awm0Kuow/ftQOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419021; c=relaxed/simple;
	bh=76T1Vh+iBA5HH93fkjwph9NXWvmDkzOYcHdVesVRsvA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nLwOFIUV8cfi5AaFoXLeGZuG1F+dxhR3Pdh1ngG7wP6ZnXgbfD0eUP+TwZ2jE5rq56nRFXCB91MT6cGFAMYwpUyUKOq21tT0VC52I05+KpIKXrEn0ZN864fm1R4ZG3wtE4Vnx6GBO1anq9x20SC+rs9HBi5OgkJDA+IH/tnXANo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=ctmeYbW0; arc=fail smtp.client-ip=40.107.162.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="ctmeYbW0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YB0kwjY0cgwPvlSTZrnVWayfi5KkxGWBngB7+1LzO/HRxGxwbXyMNl/JY8g4pSbwITrzLVeG/3lFgW+BisekTJat570OBVpbjq3gn18URtgrd+ESostjmJF0wZQyhq5xztewy4SupcjM0/B8KB45KhV5GQRnRFgSmSr2X4QlMCDmxKKd7/Jf9n23yuGn8WmjP+bRUVRxvLs0Uk0OcCSt7QMou2oezEVx2wtayRbKUno7ENbVkPRLTTq0i2Yh0HfV0tZbZcCuWjPZIcWpZeLFiog+ITxuHw14xXIkWcH8PMMV0tMYMNcKmZ9hfK4ielQLIpCeb/RGO2WSZ4A+PI0oew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJGyll++d4N8cr/UuHrqmerbjAl0ICsQjhWR5FgUS84=;
 b=Kusbm/uBy9md3Iarj+ShYsbNnLWE6Gf8XtTKHA75OnixIo9+3G6/sCuKMgrIYeXnOU/fWLFmBCsKF6s3iK+1A1zK2Du9QXEDM5i8VouCdBLAvoDnWMDdk9kGS34UtWnq9ecziZd8djzHXFhkKUuOIsytnpASzNxogHF9i33eCJk+RPO1f8QqfdOiDnSo403L1Y0YO/JgAwbfGhryUQ9JmluW5hdYpukAyrdBSNf+vedlUuwVeBpVeGaDg1UFNodT9/ihPCWfZVybXcDQB9nMp+H5IOyOR5iH3FoUgTxGId6j2WtnqDE0Y8UjLIhdf5V0OaYYvCN2Uv0eu5nLG7CQzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJGyll++d4N8cr/UuHrqmerbjAl0ICsQjhWR5FgUS84=;
 b=ctmeYbW0pJYBsKJJN3rqO5xJPw+F5k1IEH1JhOhcigdVSK5zHW0wKhPvvaToE7y1AeUHIUztdOdXkqfT+3PdbmpCzTPgwBWpfvdboiMZ8zBa3K4uup+6v6sVQyn0Rqvl4CEPkj7R0ROBFJfjKX4cqWv7tJOj3FSqESuux1ahz/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB9836.eurprd04.prod.outlook.com (2603:10a6:800:1d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 28 May
 2025 07:56:53 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 07:56:53 +0000
Message-ID: <380ba32b-bb9a-411e-8006-127461cac08a@cherry.de>
Date: Wed, 28 May 2025 09:56:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: rockchip: support Ethernet Switch adapter
 for RK3588 Jaguar
To: Andrew Lunn <andrew@lunn.ch>, Jakob Unterwurzacher <jakobunt@gmail.com>
Cc: foss+kernel@0leil.net, conor+dt@kernel.org, devicetree@vger.kernel.org,
 heiko@sntech.de, jakob.unterwurzacher@cherry.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 Kever Yang <kever.yang@rock-chips.com>
References: <20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de>
 <20250527131142.1100673-1-jakob.unterwurzacher@cherry.de>
 <35e0a925-4cba-41de-8fe4-4dd10e8816f1@lunn.ch>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <35e0a925-4cba-41de-8fe4-4dd10e8816f1@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0082.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::22) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB9836:EE_
X-MS-Office365-Filtering-Correlation-Id: 232ff0ac-6d49-4a2a-50dd-08dd9dbd358c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlZXT1NWMTVBem91eGw1V3BWTTR1V0NEU08wWHJ0YzBMenQ3SlRYdFJidTF3?=
 =?utf-8?B?M1RmZVNLLzZ6T29aZGxTTUFUM2U2bXNaOWw2SDB3STY0RlNVRVNBZCtld1Ew?=
 =?utf-8?B?S0pVMTJ3dEtPcHEyYU1lWEpwM0FrbzBKSmVGckpRQXZ0bVBDOXhETFFXQXgx?=
 =?utf-8?B?Z0FyazJqSGJYb090T3RrMTY5K21DdSttRUhVQm9hUUhBS2EzOUU0YlJDbHJZ?=
 =?utf-8?B?Q0wvWHlyUHlhWU4yTXhvelhWZmpENGd2eCtLRGR5Si9NNFdRaFF2SlNTUS9k?=
 =?utf-8?B?NnBkanJuclFKdHY3VEFPc1FVTnRnU3hnbm16ZE9NQXdMc0VvYlhMd3JTdDgx?=
 =?utf-8?B?dUN1dVRwb1hFSjRYTllreUI4TE8xUHloQTdTQnd3S1RXL0xoS0MrTWRFWVJF?=
 =?utf-8?B?djRTZzk0ZUR6MVQ0ZHpCanhDUHFoV01rV29XUkVlRWl4ZklldHpTLzJER1hY?=
 =?utf-8?B?d3FNWGZzRkJPUkd1cUF2Tk1XZ0NaOHRtczZERFdpbUVpZzN5TmNRUXZpWHF6?=
 =?utf-8?B?UVhOZU9oOGtTc0Z5VFlMSGd5eGxzQTVFL3RRUlh3aDBGY2RxMy9HcE9jaUJp?=
 =?utf-8?B?VWFLcWJhL2FDbk9ib0JlSThuK2RvdEY5YWpDM1Y4Q0NrYUhWK2ZFQ1MyNGc2?=
 =?utf-8?B?NlFFcVJMbWtvcjUrcy9QZjVsZkJGZ3B5RjBJRW1IYkFCdy9xWVI0OG16dmZO?=
 =?utf-8?B?OXpqeXNlZ2dGM1pjZGM2Z3N5WXdUbTBwUTlxZTFxYVMrY2FtRHo3WERVY3RR?=
 =?utf-8?B?cko3YUlnL1U0WktBdEhFcDhZMUNsd1VjUUpsMFdTT0JndnUvc21RdHY5aHlJ?=
 =?utf-8?B?VktMRklOdVprSTJ4YlBSK2hqK3REbVdLWms1NFBoY0xaU1cwZkQ4YnhCa1V3?=
 =?utf-8?B?bE42a2daVzFkTHRFUjNZWEtXcEREYWpUOUhQWkxIYThuUGNjNTNYZXZWeW5H?=
 =?utf-8?B?WjhJM2NISEs0RTkwdXVOVG9ncElQUHFra05DOENxcS9JbDVIVkowa3p5dWF5?=
 =?utf-8?B?NnU4L3Fzc21EOUdmMU9obTFSeGFIMWVVYjdBdUMwYS8vTUYzbVJCakhsZkpP?=
 =?utf-8?B?TWNIbTdtMVZ5d2VuU0E1UGlwMkYvRjMvTFA4UUNrakNIY3VobEZkY2FSM2Vj?=
 =?utf-8?B?Wk92SUdxZmFVVEZTQmluVnduZTFOdWJKeXVucEU3eTFJK1Q2OTRoUENtdmN4?=
 =?utf-8?B?L1F6YStXK0hRdG11TUREUnFhb1dLOWEwa2t1TGdVYXFSTnFWZFFXZllMYmhF?=
 =?utf-8?B?WVBsNWR0b1RUNjlUSFZ2MlhURlFsZG5SbDJQQ2R3V2RIRkZoaXg2TElBeDk0?=
 =?utf-8?B?R1hMU0Z5MTBSUXA4Z3R6dGZReDkydHFaZ29sd0ZMOW93QXBQQUVDUnNDUHZo?=
 =?utf-8?B?NjFnYzNvNWdtZXh2QVBpTU84MzFrQ1BQeEdpdGpvdkJzSUxmUVpEMTQvMTd3?=
 =?utf-8?B?eTdFd0ZKdU83U2N0S3pselYvYjd2VmpmMm5Kbzh3TFVBbGVlakg3a01GZHIz?=
 =?utf-8?B?MW1oaXY3VHA1WnFiSzZRWjV4MFFBNnlUazJacTQ2My92UjF5NjNuMFJHY3hH?=
 =?utf-8?B?U1lxYldacWIzRmlZVVg5ZEJvQUF5L3JCN0NKOGVyMEJ4VXMzN0diVk1qTzg2?=
 =?utf-8?B?Wk9NRXFSbFY4a0Zua3Q3Z1hxbGNMbk9IWHlTYVBBOTVLWEhzemQ0Tm11U3VK?=
 =?utf-8?B?ZmNUWjdmWlF1SUZIc0ZnWnIzVExRRnhsOEdWWWExckZNVmRDdkZ4NDBtQkRQ?=
 =?utf-8?B?QmZjakhzSmsvOXYySDJPWFhLdDVlcGR6YnpmaHF0UnVQcCtsL2tpQTYvYUYw?=
 =?utf-8?B?d0xDZHVjUnh5Rk0vRnNsa0NSNWxmSUlWRzV6L0V4eHNJUVo0TlVOSkZVYStt?=
 =?utf-8?B?M3E3WjE3UTdIZFZMRmw0MFV3ODMyc3dGRExWbVRGRWREbmJ0SmZpUEg4aVBU?=
 =?utf-8?Q?5E/J0BoNGpA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cko0RDNWd2xjL3cxd3E5MHk5STFxeXdRWUdFOGF3UUUwbWtwQ0loVDhSMHhW?=
 =?utf-8?B?YkF6VVRleHRXT2x4VGV6bTRBQVMxaVptdjBVem5VUkYzTnZuOHJhdTFsOTZO?=
 =?utf-8?B?R3FDSkR4Q05sMWt5UXRsTVZDMEdLclNqZUJpc25ycDc4eS8rMlcrL3hwamlv?=
 =?utf-8?B?enplbHhabWNGZkVaN1pIam1KUnY2bm9MVCtiU2t5dFpFNXRtei8yNnV5djlF?=
 =?utf-8?B?RjJXNTk5SHpmU1o2RXBJRXNxM2RHRm4rNGQ3NCtoVDdmbDZra050N1dOUU51?=
 =?utf-8?B?OGFINHEzL3RYbHZMdXlrNWxyZEpIUkdLL2lEVlJCNHdEdkdnNHdEL1RXWFAy?=
 =?utf-8?B?MDhkeXdIZjFOM01vbFNmTmF2WExmN3pYejJLZERaa0R6dFc0cnFmeGZ1RFZx?=
 =?utf-8?B?SzJUN0RrMnBSWUhHUlh0c0Y0UUFMaGxoWWR4cUd0SS91K3JzZkFqTmZidzVD?=
 =?utf-8?B?YWs3UWFUdUF4STJqT09WM0g5TWFtck9CdzRrZjhyMzBNSEZ1RnMzbzFpdzdx?=
 =?utf-8?B?dUxodGFhc0RObFB6ck5DRTdSd0hSRUpjY2Y4VzlGVnlseHc3RUl0Rnh0WGFj?=
 =?utf-8?B?V0hmYWJSSkNNd1F2RjRBTHRBbmt5bVlQOU9neHlVb2dmME81QmVxd204dHk2?=
 =?utf-8?B?cldDZkczVkxNR1RqY2ExN0MzNVpQa1doZzNNVFdDNnBsMGJWWWxkME1rMlBo?=
 =?utf-8?B?Z01aN2JLbVJNa29RekZ1TlM5UjJMWXBlZjJReDZJVGxaeEtqcXQ5Z1FWSi9X?=
 =?utf-8?B?WEVKY09kLzZRR3F5YVBLVnQyc2ZtdVhTL09hNHRqaUc1ZldjMFEzeUVvZVgv?=
 =?utf-8?B?SUZmQnkzdGJJSDRQeXo5OTZIc3RuOVFkRCt4VzR0UTAzaE5VdVZqdDlweFMz?=
 =?utf-8?B?Y1g4Mkt5UEd0OWN4bGs4NkVVYzR2eFkxNEU5ZW0yR1dVWkNJNlR4U3A5ejFR?=
 =?utf-8?B?MmRQb3o2bXlpTU04Q0VDc0RVbzFUazdpRFdXZVhqRXJuK1Jja2VHRHR4V29B?=
 =?utf-8?B?d2RhZDBzSmN4cUI4UHRKZVE3cDNQcW9veWZXL0ZWdlUxTzduQjlkSWEwZzBT?=
 =?utf-8?B?bGVzV1pmVFRLbDFocHBXVk5PZTJ4SjdTVHlSNnQ3RVo4ZnNDM2kyT3N2TCtE?=
 =?utf-8?B?bExqN1ZDL2wxUWR3ck5pdXMvUWUzQ2xQMEdZMlhtQUordGs3T2Q2eU9qQWVH?=
 =?utf-8?B?UmdqalJ0Y1RzcDFKUUNGWmFLZVZzZ1Bxb1BQVC85cVVlMWRTVGdOV0VEUFJH?=
 =?utf-8?B?dmF2d0JLMjc5WmZuLy9WZmIwK3JoeVM1QWR1VE4xcVF1cGRRc0prT0VFZFVI?=
 =?utf-8?B?blMwM1JpN3FCSUlGVU5HTzdXUGgveDZ3NEY4VHdKNVpJUURSbTRzWmJScklV?=
 =?utf-8?B?NTZzdklMWmZVY3VDd2hMWUo2VC94VXl0eEJGZXB2OGl4MnNYT2N3Yy8xOGxy?=
 =?utf-8?B?eklFMmZYWWpsOThkNjBqWEczOVEyOUxTMUE2NU5kbWR2NUpzVTFPRDgxdTU3?=
 =?utf-8?B?YkoyRk96Ykd5Vi9ibDJxT0ROK3AycW4xSFZxTjMySEJCbkVXV050R1IrZHN3?=
 =?utf-8?B?eGtXMXVINGNreXNqMEtNb1F1LzBxNjAxaXdUM0VEZ0VWMWVmZzFtVmtieUZm?=
 =?utf-8?B?eGNwWVhWbWoyMUhuc2lVWWVrRXZ0anpmM2JyTmp1MmhoWTJHdytqbnhDeFRW?=
 =?utf-8?B?bW11WU9rcjRWK2FTYVo4MjJieXJsaDJMWTBiSUtVTTZPcXZETVJBTlhDbkln?=
 =?utf-8?B?alhFb2o2c2xwUCtuNHBBUXBSelBDUlBoR1ZIRGVkT0c4REJsTVMxSjNJelRs?=
 =?utf-8?B?SzFYblhQTzhtRHFQTlljdVY5SmpZdzUyN1RZUkJiczFQcFBsME1SWEltUXM2?=
 =?utf-8?B?SzZDbWRIK3hLcVlQQlltdUNDVGxVZTJ3RjhiNFVLZTNjdStPT0tId0dZQ3NX?=
 =?utf-8?B?aWJzRWhiUVVlZGp5L3hCZHZ0dERIRHJxT1QrTTZjVk9wYTdlamhWNk5LaUdR?=
 =?utf-8?B?dmdwRWVPeCsyUjJPcFRiWVY5eUlGdjNuaWNzWVFmT3VTRFlvZTQyUVFzbFlQ?=
 =?utf-8?B?R2ZBSGNmRWJENGF0NFJPR3RxVFArenJsK2tiUnc0UDFTV2swdEp2UFBncEQ0?=
 =?utf-8?B?SEYyTGwyU2s1cWszL2QzWGdsRjFydVFsbHhzbWhORnZ6aDBpbkJHWjg5TjE4?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 232ff0ac-6d49-4a2a-50dd-08dd9dbd358c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 07:56:53.0938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcePiZqUjzWtwtxKdkXckOkezBnlPdJfhPqZMfDH21cBGSrUkyTOnu/qoPuCOeXms1JumHcDb9SfcUiDzlys8fk7vnakjAyjc+xGKOCQdo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9836

Hi Andrew,

On 5/27/25 6:18 PM, Andrew Lunn wrote:
> On Tue, May 27, 2025 at 03:11:42PM +0200, Jakob Unterwurzacher wrote:
>>> @Jakob, is this something you could check? devmem2 0xfd58c31c w 0x3c0000
>>> should do the trick to disable the circuitry according to the TRM?
>>
>> I measured TXCLK vs TXD3 on an oscilloscope on gmac1:
>>
>> 	Setting	Decimal	Actual TXCLK delay (ps)
>> 	00	0	47
>> 	0a	10	283
>> 	10	16	440
>> 	20	32	893
>> 	30	48	1385
>> 	40	64	1913
>> 	50	80	2514
>> 	60	96	3077
>> 	70	112	3565
>> 	7f	127	4009
>>
>> 	off	x	-315
>>
>> Setting = tx_delay (hex)
>> Decimal = tx_delay (dec)
>> Actual TXCLK delay (ps) = Measurement from oscilloscope
>>
>> Plotting this we can deduce that one tx_delay unit is about 31ps.
> 
> Nice to see somebody actually do the measurements. Based on this, it
> would be good to implement:
> 
>          tx-internal-delay-ps:
>            description:
>              RGMII Transmit Clock Delay defined in pico seconds. This is used for
>              controllers that have configurable TX internal delays. If this
>              property is present then the MAC applies the TX delay.
> 
> For the moment, please limit it to just the device you measured it on.
> 

What exactly do you mean with "limit it to just the device you measured 
it on"?

I'll need to implement reading the delay from the stmmac driver to use 
this property, do I need to restrict reading this property to the SoC we 
tested (RK3588)? Or should I just apply it indiscriminately (considering 
that no Rockchip board actually set this property in its DT?) and let 
future users fix up the scale for the other SoCs whenever they want to 
use this property?

I assume you're then expecting tx-internal-delay-ps only on this new 
DTSO's gmac1?

Would you still want rx_delay/tx_delay to be set to 0x00? Maybe only 
rx_delay since we won't have a companion rx-internal-delay-ps for now 
(until someone from Rockchip answers :); adding Kever back to the Cc for 
that)? Or should I remove both of them?

Is this request blocking the merging of this DTSO patch or would a 
follow-up series be okay?

Cheers,
Quentin

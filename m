Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010018.outbound.protection.outlook.com [52.101.69.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80BC202F71;
	Thu, 10 Apr 2025 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296224; cv=fail; b=mFo1BqW1V0e1/rg/vYnebQxmwdA8Co9ANCWqg4Ez+Mg+xmEyO3GWI+qQSKFaMac42N5e9VzPN9VMP03581AkoLB8FedcHj6WGTvRWBZg9SwgoSb5PUsJAYj/lIFbpA9XGUk7BlSpDaFO+og8DQxL2/6i50V424jvnxiyRw2t8lY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296224; c=relaxed/simple;
	bh=UfFKniQt4sohx/+HnBlt74D80xKS1QHc9MDoZwAQ6Fw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jWEr7WKt+gNAqPxxfMEVYOSQHTjLBREbo3piLtrXPhClQficb7w2BWfUEavitkbOxUJzGoC0CqCGwE87FNyL0U+K/a7HbqjQeWGotkMrm0RglxnZjk6GuQ62NySlumlU+Quxz+gag2w5lY7BKiGMLeOi3iobKQZSpq2oLyf66/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YQhF0cXW; arc=fail smtp.client-ip=52.101.69.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YQhF0cXW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XshjSqhBlqGJ08PZSY8N/eosxEyPZF0+W3r7FTf5gQBY0PGqM13LODNOiO7Se9vDqZg49k+q5JIyBwsJL4Hzx51GQNIKOeMmHo7EeuXxJUwcN3qy7NXIf9G0PxOmaRvPxSFdyTLhIIjNaXemulrpUJKma5spSnCLCzRjvsv3J7+Bx6k+MMPd42zS5jaGfXk3IaO1yPnwnCuvkz7WzKS3+j+g0H+x1xu5TfAi0KwCglypJlPm0qDQXrZS4DIZ6hl2jsAxvDlLYGMTvFuABGXsRPcJUA+gJflgpoXqp94LS/ELYUjASW5CBV9JXYAYhWb9tu3a2keUlxXus3EehEUVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSgtNDPw14tsY72V1LKvNQyG6T+1dMAUewghBBNB8e0=;
 b=CMgMmJcMsarYZ6DGLpKjvWHvRUw1lWgla2QB3nesLfpcHrja5rshbesm7AqoWl1OXjKS4spXZtr1f2/Ohxkr3cSEPaG1utOGowFzxA+W+13wD22r1RL1WPEKYDFa4fTgUYs+NU+abEk8ZIQEPjHfvOipaGOxx0EdxG7Uxg6rsJwh8Z9A/ddX4ZPpiQc0EtLFxAasmbY4LyL5+aEYwVkCrXJifPIV/Di98/KNWDcdzPtjpQxG1x9QLSyGZtaecZuedWZU6jynfpoBCkUHLbO8GjhhFYQxdbyMSwawoN0l9y4YkBdMB3h6cp15hmSeMkfBeQDV/ytExf4bMxBL9uiy/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSgtNDPw14tsY72V1LKvNQyG6T+1dMAUewghBBNB8e0=;
 b=YQhF0cXW0PhlqKls/f5o8j7Ksnr2SHc5vvwPxCzVLjZZiBJ4TEPFgFFdoD7Zb7S+yF4zSYpyCf3XiTkpy5m0yQb1C6fxO5foRjSPzDO+NGD2qnNKDqC2vgaC5FaGTGAkEM+l3jvDEkY+XU5YZgHLMijKN+an8uC6KylAkum09w30pueguzeXHcOO8YSrxiKMdAEANxAirFUJihvbCaOQ4sT+353B46XwncrmleDUhUltLbuVfcBWB1k92KKaC7aONHgagU95lrRY5+KKoZskieNWMwsPdQD40RGol+5dp4lsk9fjJ7DauVWmVYYhlJZb/afq24ztof8MbxN1gGgjJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DBBPR04MB7577.eurprd04.prod.outlook.com (2603:10a6:10:206::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 14:43:39 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 14:43:39 +0000
Message-ID: <9d712c3d-ca69-4a8a-8237-0543fdc2ce5f@oss.nxp.com>
Date: Thu, 10 Apr 2025 17:43:34 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: s32gxxxa-rdb: add RTC module over I2C0
To: Frank Li <Frank.li@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger
 <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, s32@nxp.com, imx@lists.linux.dev,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>
References: <20250410133028.5871-1-ciprianmarian.costea@oss.nxp.com>
 <Z/fWNxhtLb7Mz20R@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <Z/fWNxhtLb7Mz20R@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P251CA0002.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::7) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DBBPR04MB7577:EE_
X-MS-Office365-Filtering-Correlation-Id: e2b28c59-ac0f-45f1-d11b-08dd783e14de
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elgyK21GQmtaM2p4KzYvRnJmTkNCVXYxaVFQa3dnczdUOWtML2x3a1FiWnhR?=
 =?utf-8?B?S1FPdlJzSll5SUY1MzVna1MzWHBKNWlVZ0RPb1RrZXRZcEQ0eGUwWFQ1bDVL?=
 =?utf-8?B?RXJoWlMyUkpWRmVxYjNDV00rbnBTVTk1NXNyQjk5WG1IOGQ2OU9ZY0ZOSU1I?=
 =?utf-8?B?cHVYM1NSUWZML21YbGNWTFhYYkVUZEFrMXpmRmhwbThvejNTdGE0T0MxQ0xO?=
 =?utf-8?B?TWpZVFIzVXo4cUc2RytNMEpkalJab0hSMndXdFQ4YWEzMlBxS2xHcTJxZzg1?=
 =?utf-8?B?Z1cxQkg1Mzg3UjlGK1FtRTZGZHlwbjhDa21HOTV5dUw0UzZNTFlVNk5JcHNH?=
 =?utf-8?B?V1RnRkRINjU5eDZJU01UcDNMTGpJL3Z5QTBvaUxSOVBDMU50bnV3bnZpeU5F?=
 =?utf-8?B?akNSZGtFck1RNitxclVnT2hkZ0Njakt6Wjd1ZXRTR0dXTkQ5bEpkWmZacno5?=
 =?utf-8?B?aDZ5NG56NEFxMjgxczdoOW5NaXAvUVFkNGMrQnVQYVEycXMzTTlZL0I3ZmJy?=
 =?utf-8?B?b21Gdm5abzVUOUJqaFNwd3I3Zit6djhMZWtlOTNMcEJsa2dxbWxkbVZ0V0ph?=
 =?utf-8?B?a3pzK2Nvdm5BUGxOT3FONERMa1BYRXh3SDVwc2dUQ1RCLzlxQk4ramNXVDNi?=
 =?utf-8?B?NjM0bnVSU3BSSk1aYjlUK3lLUW0xNmFjaUVuN2lNVFVCZkFvN0FvSTJjN2Jl?=
 =?utf-8?B?U0tzek1wZUVTL3VOUVFZeEtWMUJ0YURjOWhUa1pRNVNucjBFbDBtcmMzandD?=
 =?utf-8?B?cC9mOEU0KzF5cGovZTYvZ2lqQ091N2dHMmY5d09NcXZwd1EwOUp5Rjg4RG9B?=
 =?utf-8?B?RGt4UUFMQkZObWdPOGJQdGJXVW1YSHV0YXprMlI5NXFpZmYxZ2ZvNlVOK3FC?=
 =?utf-8?B?UUI4OXBkYnFLREJmOG9ERVFGTitrYUZjWWordEJvbHVrZ216R3JnS2k4anVY?=
 =?utf-8?B?RzRuWUcxQ3lJbUNtU21GTlVrUHlqMlJkSnBJa2d1anYrMm1SSGVlK0FrTVpF?=
 =?utf-8?B?bGprYkwrUVZkeVJhQ2xBemNmajBPalhTUnlvcE5lWFY2MFdyb3FoVmR1U3NR?=
 =?utf-8?B?K3FxTnRzYVIxcTdheFUxZkN3WWdTMDJuZndXN0dvQmY2QjhBb0l6bHhVMzF3?=
 =?utf-8?B?TjFSZVQxaWpRVU9LcDFsMEV3dGtiL2lxYjA2bGc1THlMVndteFJVaGxvK1FN?=
 =?utf-8?B?VG9VZUJQMWJ0eVh4bzVKUTBibEZra0FpQjJqd0VVQjFRZ01tNTVjd250S1JX?=
 =?utf-8?B?QzRoUFYvdXdQR0pweEpzMWJ1Y0gzN09aTFloVVFCNU0rR1V2V2lJN2hwbWg4?=
 =?utf-8?B?RmQzTW51aTc4eHpoSVVIWGpJajYrUGFqeGI5cG03djJqS2RYTjlMRDBPViti?=
 =?utf-8?B?WEtXdFAxYmszczY4SDlmTWtvRkxXNE9mZVdqV09XeXFwSEw5QkdYZE5WcnFM?=
 =?utf-8?B?eVdXZ2pBMU5oRmozeDZzZFNvQ05NUldlOVJLY042M3JoQVkxb3F5YkRydk1I?=
 =?utf-8?B?bWRhdVVEMlZuRGkzTWRlTzdxVDUrdjlSSzhDOWZZL2E2VHRpKy9sY25rZEpT?=
 =?utf-8?B?cVgyVGZwUGdkVWZmK3c3Z3VKbHo2dFpYYmNFSzlwSkUxbDlTb01jUW9CbW92?=
 =?utf-8?B?ZjlTL2ZVU013YU1pYWN0eHJvWXlTOG0vOER1Ymh0c1JxS0xlcXI0cm13Smhk?=
 =?utf-8?B?WEVlRkNHTEQxS25GREg1R20wR1IyTU1XbDZXNHZ4d2ozakhCamMwckdvbUU4?=
 =?utf-8?B?TnhYbnpYTEkzMGQ3Wm5MN1JUeTc2dXhXdUhicktMa2tGazlBSWNIRFlrbk9Q?=
 =?utf-8?B?Q3MzVFlYOEh0LzI2dGgzT3NjRDhvQUxub3BpWXRocUpDRDY2VEJ4YW9lWjRi?=
 =?utf-8?Q?Iy3y1+j4NpOlh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0E4cDNITUxNOGJEYzRFZERJbk01ditxRW5FdFArN2loWlFaRW1aa0h6UmlN?=
 =?utf-8?B?UWE2akVjY3RQenRVZ0hhelVQRVFFVmFJUW9PTDN1NE92Vk0rbm1UMEtzWWJB?=
 =?utf-8?B?UW85R08vbUxsU1hWR0l6RmRiQVRaSEhwNFhmTU0vYUxRWHJVbjJNTjVnSFN3?=
 =?utf-8?B?djZTK3VwQ2J6Z2xtVFBVMVFVMjltVS9ES0JxcFB4Ykc1RlpvUnNHZlBVV0Er?=
 =?utf-8?B?Z28xOXdPckNRTUprTHdycUhobHZNTjRNZDh3MzN2Q1BNZXU1VkJIRy9pN2ZZ?=
 =?utf-8?B?K0FkN3M2SHhwVTV4WlF3eVh3T3JaL1VRZ01HY2dHWWkvVzViNWxjSjRwYWJw?=
 =?utf-8?B?cy9nUmhmejNiazFDRis1aXF5MWJScUR1RUNLNXpaTkxzOHpNQXJNNlRkaTB4?=
 =?utf-8?B?WUxKaTJoSWpqS2tmaVZubGJDamx6Uk8wb3duWVhuRXBFaG5NcHJMcmRydUxz?=
 =?utf-8?B?VjFYRzQ4b0xleDFPaEU1aVZxMFpxUGJMWmlZK2czRWFvRXErQWh1eVBmeHB3?=
 =?utf-8?B?UkJ4dVM0RGJnQlloOUY2SExLSFVoR2NTN0F3eENYK3pWa2k3aFd0aVZwZTd1?=
 =?utf-8?B?L2RKeTRrMTdxRTBRWWVJNG5kcGthSFhWZ05TaDgvSUNHSzgwNnk2OThBNERU?=
 =?utf-8?B?UjI0R3hNVVEzWGZWQlBPVjVYREdaTTNKYlR6OFAvUDl4Q1lvSnMvcVQydTBy?=
 =?utf-8?B?bzNIVHVhVC9NRmZVNnYrT3dvdW9CSkJ4WFhkanVOZFRzdTl2ekJjdTlsMExY?=
 =?utf-8?B?dHJQQ2M3aEFBZVp0T1pBMGxWSDJWa0JkWDFZemZRL1IxZW5aQ0trUCtIdDhj?=
 =?utf-8?B?TW1XcnoySlVkNmZQbHhLck1uc3VLSys1SUR4NDZYdnp4STdlUUdCWDJQTEVq?=
 =?utf-8?B?bGhGdEd6YW1KQ0RaNTVRd21hY3dHUmo5SjgvdW8zNzJCbnNnd2ZZQ3Exbkdj?=
 =?utf-8?B?VmhWZGdFcVdMTWVIcjNJaGc3d0NBclp2Rko0OWpXTE95REtyZ0hDZHZRT1Yz?=
 =?utf-8?B?TkVjUW5BOVFwWnlaWEtRSlZ1NllBUUIvSmVOVXU3SldESjhoSUpXWStRMGpv?=
 =?utf-8?B?NnorYWtWdW1NNDdvTkY5VndjTXBjSkpjTENHQUp1MVdEdkRkZFVvREYxRkVj?=
 =?utf-8?B?cmQ2cDRsdlR3WHluaDVlZis3c2MyRnFTdVJ3NHpUazcrZVNSaWRUTUJON2dY?=
 =?utf-8?B?Y1UxTlYrditVb0tSdVdQajc4VDhieUlQNmxrWFVIU0hEbUU0NHM1T2NqQTFH?=
 =?utf-8?B?VmxSYStXa1JPaG03cFp5S2toSE8yVi9JOGJQVWJwQm5HZjdDd2cyZWdKQWV3?=
 =?utf-8?B?QTJSNWFJWkhJbjhzbFE0UWxic2h1TGIrczhyOWsyUnJTWG9DbElSOUU3TStX?=
 =?utf-8?B?dDgvL1pocFpTZFRNbzE2T0J0QXU1VS95TmV0bjJWSStSV1M0OGRiN2FabWgr?=
 =?utf-8?B?VVVHQXZ5aGZXRDlodkluMmRJclh5VEcxTnB5Sk4wRVllNnRtbDl3cXUyRXp3?=
 =?utf-8?B?WXJEWFpsVmJJWlpLLzZhWnloZ05oRzRla1V3QUZodUd3YnhQWENYR3AvOGpM?=
 =?utf-8?B?R0RwRi9WT2pjNWFkVC94anIwZ2JodXZaUEZnSG5xekpobDhqNXV4WFo5Q2Qx?=
 =?utf-8?B?RkpaRVZ1bkdiKzJLd25NWmE2dkRJQWhqbVFIeXBHR21zOGpPRyt5NWUvbE1D?=
 =?utf-8?B?K3B3WWJFeXVwWTdLTGthWFpjZEFRa0RpRGJKOFUwbEl1VzExU0ViN3hCb2hM?=
 =?utf-8?B?cXRmeSsrcUpNMmlLeGpIdzRnbTRscmhZZUJJWWJjc3E3d0pCTjgvYkREZ3Vi?=
 =?utf-8?B?aUlTOFI1Q1dKZGhzSGFjTXo3UDJ2aFN1bytUaVFIeCtSSzluL29OcEczUUVD?=
 =?utf-8?B?QTVCLzVvS3Fna1ZPZkllTUNXRFFaMTJPMXl2eWNSeTZ0Rkt0cEc2OUZYdGJs?=
 =?utf-8?B?OFQvaGZrTXNGN3NKZW5HeXhOQjI0TGFGN0FRNFBld3NkMU14TXhRTzlmOEo0?=
 =?utf-8?B?RGt1c2hxYzdXamIyV213YjgxQ1dJcjFZRWxTNXg0d2ExSlJodXFqQ1A2di9X?=
 =?utf-8?B?QlRsZEpsbzc3RzZ3REVOVHBTWnhac1RHVTBTTmxKYWNqVzB3OVZVQ1RqZzZS?=
 =?utf-8?B?Yjl2cHNvQjI5RjBhREFVYWhvSGd5ekdhQmFnUTU2RVRrRE8rWjRxOXg2djhV?=
 =?utf-8?Q?exNx4+myD0bov1RXrl5wmmo=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b28c59-ac0f-45f1-d11b-08dd783e14de
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 14:43:39.2611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lbt7rxMl83ESG678MfTPJeLIhwT24F1eBkTamAvd87z6zHk580dUn2vbcc9CixBlcfQWi2UuzNBvTMaX3ndorn/yE+E/vO27zq+LeypGbns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7577

On 4/10/2025 5:31 PM, Frank Li wrote:
> On Thu, Apr 10, 2025 at 04:30:28PM +0300, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> S32G274A-RDB2 and S32G399A-RDB3 boards have a PCA85073A RTC hardware module
>> available and connected over I2C0. Note that the RTC module is not battery
>> backed.
> 
> Suggested commit message:
> 
> arm64: dts: s32gxxxa-rdb: Add PCA85073A RTC module over I2C0
> 
> Add support for the PCA85073A RTC module connected via I2C0 on
> S32G274A-RDB2 and S32G399A-RDB3 boards.
> 
> Note that the RTC module is not battery backed.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 

Hello Frank,

Thanks for your suggestion. I will send a V2 accordingly.

Regards,
Ciprian

>>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
>> index ba53ec622f0b..4587e1cb8835 100644
>> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
>> @@ -153,6 +153,11 @@ pcal6524: gpio-expander@22 {
>>   		gpio-controller;
>>   		#gpio-cells = <2>;
>>   	};
>> +
>> +	pca85073a: rtc@51 {
>> +		compatible = "nxp,pca85073a";
>> +		reg = <0x51>;
>> +	};
>>   };
>>
>>   &i2c2 {
>> --
>> 2.45.2
>>


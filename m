Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11022129.outbound.protection.outlook.com [52.101.71.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE8326A0FC;
	Tue,  1 Jul 2025 10:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751366700; cv=fail; b=Z89WdNShP3nt1p3qP1mNkWloNiki59cpIkBku1KlHg4TzimaS5TflolbxOVF30mCXOmU3uTl4m/1Yn0+1qK1SVO8BsECByjyNQkXH0Qa4IXf2SXG6e+7OoMFOcQm4vnFPUVFjhJQrVTRIbgYQuSRa+C2X4CFB0ndJFPhBRPtyRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751366700; c=relaxed/simple;
	bh=0oCafaiZRC9zEDrZwGRt5g46P+ujTKt9r5vAmFu+9s0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MjF4Fd9tRjZnTEDdfU/MmkqulxCK1WiuirYFXio3JqruhcyRmueJnwgBFdcjbYsAQGERDRJLRK65RcoozoR8Yw2ng3xnAfBcIJnmSQVXvw+jbJ5BKievLZe4LdFRC7w8/YoDlysJnw9DHjz7ujouMHqi7XJON/FZjgXRk4VlW/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b=Yf9Iyz0T; arc=fail smtp.client-ip=52.101.71.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="Yf9Iyz0T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lElLxL6CB0LE1DILjWjm7BzalPjUuyPTVAPF6/y2DVAaP46AC1v5h9ylxbZJW5zTFJNSaop1yGSyAlcv7IGi9IebEmksJmzm9hHOB2Wq43OSlnVARxrZAcYTrYKb2/7Oy5vfPIpjsDsKl/0FwP8rNtL4K9yIK8Oqu42nipprknqE2xppj6gNOpAsCsBitByQIPCTYHjQLX6NaXs9Q4TqRfxasVmHkbOPw5emTBIH+YARTlST7S+get5dQZmfW9V+vnROAWAuI67r4wWaxmfQP4ngx/HcJiT/RXanPJnilXvDaluzS7EadDdQhn+lfj1j+5wAFN0k3MyPHDzZCDEsgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zULYfYbB+bq+u74ZxxzSDcQyy8ZPQ037DVLvjCflkVY=;
 b=LtHez5LlA8s0udgA2DN713dIhz7r+y1oqzgHig467WefMn06RLFR7MyPq6PBCMSeKtoxfB9xZQKGiTHt+cJ/rJ3Rl1YtibfuRt/c5omSdS899bemX6GU8fASAvAKZ/lnQJkhVYcQqP2Zj8HdHxnInX4bmEMW2jY13Te44vXWFaAv1fini46YmPHqwsZ78SKKsUx6O1tE8jq2wz68akRAXDdI6ceiFWTZE9ai8JgIS9oFLZTZr0gN4n3PUCF6P59eq0HEwe2PCF0XGv47e2pFYzlJkI+fXNwWXolGMCyf7NPIGsDti27l8MIkYF7BXj9VGMcmFXXmgXH4vKc2d5pPjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zULYfYbB+bq+u74ZxxzSDcQyy8ZPQ037DVLvjCflkVY=;
 b=Yf9Iyz0TJre7D1cXGG3kmCti4/HzIpRrTZNTrinc9C1AKgtHiKM0d1+TsARito5NRJZ3fLARk6KAxt6OuBKMyIYLxjBxBRG0zEoQT43HUrfzqFWQFW9Tn33s7tHAQPP3VHmXBce8Z9qp7Z1mHD13nRT0b16EDiKGEq0iQ+dVp+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS8PR10MB6433.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:56c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Tue, 1 Jul
 2025 10:44:53 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%7]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 10:44:53 +0000
Message-ID: <087b8689-7443-4720-a94c-160edd31a5da@kontron.de>
Date: Tue, 1 Jul 2025 12:44:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v18 3/7] firmware: imx: add driver for NXP
 EdgeLock Enclave
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Frank Li <frank.li@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
 <20250619-imx-se-if-v18-3-c98391ba446d@nxp.com>
 <20250625105546.pxuatcnfpe7mssgs@pengutronix.de>
 <AM9PR04MB8604611B8D91B5526C9704E69545A@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <20250627084653.6vgwnm3llf3zknlp@pengutronix.de>
 <b02055bb-0995-4fd8-99f3-4ca5146eedd4@kontron.de>
 <20250630121722.wviidlggt7hguyt7@pengutronix.de>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20250630121722.wviidlggt7hguyt7@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::8) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS8PR10MB6433:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f3da64-080a-4ee3-4bfc-08ddb88c4fd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0NtYkIweXdULzBGL1BMZllZYkVpS3ZmbE5MNS93QXhkZCtKM01zY2tVVjZp?=
 =?utf-8?B?ejEvNEFjdHlrYVhqREVoN1liaGRWdDBoNUM5RjR6NTE5c3l1ZHVFT050bFZ6?=
 =?utf-8?B?TlR4b0w0T3BLOEE3T0FFYVdFYVB2a1crd0txd3UzK0tZcVl4ZU5JRE5jZlZt?=
 =?utf-8?B?d1ZGTVNNdnJBRzc0cFV1RDlZVndPWVlhYW13ekF3ZWRVYWlSelFOMVFJS2Fn?=
 =?utf-8?B?cUZCcVlGUkFoTnBNRzU5S0tWUi82Y0FNVnU5c1hmOTNickRBVk1pUnpScEpK?=
 =?utf-8?B?ckI5MkJEcFZ4akZhTkFFa1ZaRlhIbWUrUlBQdHg0dXlIQWZkK0dhOUR2WWcy?=
 =?utf-8?B?eFBVeGtWWDBTby9TeDNlKy8wZkRGUHdsUE4vWG1qTjlreFEvOUMxZExwcjVS?=
 =?utf-8?B?eTJ3QlhMcXFXNzlwWVF2TlVJSk1pWDhFYmU1TjZKbmwvTHZhbksrdjJoelI2?=
 =?utf-8?B?RUV6bWd4VUdiNDN6WkNEbVptcFN3dkVHeUsySG53VlQ3SUwyRlhnemc3eGQ2?=
 =?utf-8?B?TGRYSkhKSEJoQzJuczlOcHlDTFQxNCtCTHRINW5JR1RuYlZtak9WY2J3ekpH?=
 =?utf-8?B?TS9BNU5CalJPVVVneFFJQmk5dDVucHhITnI2eDVQdzhxYjNLcVpScS8vMHJx?=
 =?utf-8?B?ZjczOU1BRG5hcktQN1pIMlkvVm1heER6cnVjN2toSXBVdlV4ZjZqbFlROEdK?=
 =?utf-8?B?Q0h2dDBCNWpLdzBBdTB0dUJhckJhLzFNd1ZuTG4vUDd4OVMvV1dRdHhjTURS?=
 =?utf-8?B?Q1BHaXZWNFp6cUtLQ1luNkpVQ3k4MHpnTkZ3aGpQUWhFOGUzam5DYUxtQk1B?=
 =?utf-8?B?aFhKUkdYcmwwcXZ5L2JzTFZxOGNsNUYwaEwwdHM5V0MrZU9ISEtKTWN2QnBs?=
 =?utf-8?B?YS9LNkFtRmZ1UnhpcnMxYTVRYmF1Y0lDTzFSeDRFdFdOQ1ArYk5aUXpBNEpm?=
 =?utf-8?B?Uk0wSlRTZTZVZVR3eE1QWE5jNHlBSCtraXpETEs5RlRtVFFGWFJOTGdibXhE?=
 =?utf-8?B?T1JSRkxOOWdDY00rbm8wYXg1UVJKbDM0L0Y5enAzVTdGdS9PeFIzL0s0Nmlx?=
 =?utf-8?B?b2RLemdaNDAzOHk4VGhOZHZLOWtZSlo1VFYya2JOZ0tMTHJCc3hxSmF6VHVX?=
 =?utf-8?B?UVpjVmMyVk9tTHNuWnZSYnI3TkwweXF4TTdQMWpnTDNtNVlweDJJdEVTZXZr?=
 =?utf-8?B?VmthaFVlS0RVeTFxRWpEVlZkanRYL0c2SzJvTFZSK2VwbjFBdDBEdjdPS1NX?=
 =?utf-8?B?UlE0N3pVUm1HeHA2SjAzWEZvbEkveVBDTHowUWZiaCtTOUJ2NFp0Y0tPc21u?=
 =?utf-8?B?enRLMHZQS2dLcXBaOFZtdTN6MlZxZ0lxQ0diM3gxM040TlJqS1MwWkcrUVl4?=
 =?utf-8?B?MDhTQnNvVlhCVmQ4Nis4R3ppZnZPamVORnVpVWwraE8yTVVkUHV3QmpJck80?=
 =?utf-8?B?dy8vSWNuWWJqZlMyNyt3MkgraDU1VW00ektLMlpIS05aLzZ1TEpPU0VUcUVY?=
 =?utf-8?B?R21yR0tYUjYxdllOaWhiaTNqeGIxQzRhOHF6QUJ6Nm10aFhrem4wWDlka2hZ?=
 =?utf-8?B?L2ZLZU85LzBUSHJmSSt4bzdaSDMweGNHTmpnSjJ2MUNEMzFHOTNmQzEzOVlP?=
 =?utf-8?B?ZHlTWEdMQ3U4OTJEbCttaXpaZzVjdWpIREY1bFBzRjQ1b0M5K1M4TmowS2J0?=
 =?utf-8?B?UzBJcmxsY20wbmNDUlFWeWhGZkE1b3RHNTJWVFdoa1ROL0s4VE5lZ1RMMTQz?=
 =?utf-8?B?ZTQ5cmpidThYdDBLRTBSOXNSdlI3VHNadDlVVUFBVWVsblFyaFhMVFBKbldQ?=
 =?utf-8?B?bHNGdXFTeXRyK2VTM1ZrbnNRZ2Rqc0YzZmc1ZlV5cWNmcHZXdG00dkxLc1Fr?=
 =?utf-8?B?ZFhNOTVpc2xZU3MxQlFkUHFDeklRRE5sVlVEdzFDcTNTSWRMRlVEc0dMdExm?=
 =?utf-8?Q?oilG3AHun0M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RllVRjAxd3FmUWxSUkhFeUlXRDRDNXN3ank1azZLRmJ6cGJYWVFKSVlUdm9N?=
 =?utf-8?B?bmhBQzBHbEM2WmZHUDNtN1RRTHRoN2NGSmFOdWZMbE9HMkFROFMzSEdOT1Zq?=
 =?utf-8?B?ZGI3T0hSNm4vQldPdmRQcFRheEttcVMreHUrL3c1TXNRUytoRmxkVFZrOVNQ?=
 =?utf-8?B?MTBQcmd3WjV0UmF1TDdYazZ4ZXZnSy8rNUUwZVUrajVlQWI0MENHRlJ3eW5r?=
 =?utf-8?B?UXlwV1llOUdyYUNPMnEvTnpxK2Zaa1BFM0wwb2djRGtvYTIvS2tyRjFLQXlV?=
 =?utf-8?B?bkF4MjgvVDcrQzRkRG1nZVd2VDcySU9rWlB2S3gwNFdaRjAxWjFYREZ3MTJJ?=
 =?utf-8?B?ZDlJRTI4OWQ3RWp5dWxEb1ZmenlZczY2OWNDeHVMR2JPQldEYURQUnZnK3lK?=
 =?utf-8?B?bjF2ZUZid2tWeWt0WTFtZldaeXRkZk8vaUlIWExIKzEycCtvWUw5ZXVDRzBn?=
 =?utf-8?B?L0VTcDlDcjd0SHpZb3BmQkZHZlZkbUtYS3FyQlNRNkRDcEhzL1ZFelIraHIy?=
 =?utf-8?B?SXptTlNoQVZuNDl3ZmdIb0ppbFduazhKM3ROcWFuMHFmd1dYaElrS0ZMaERm?=
 =?utf-8?B?TU5FRkdENkNzcjNHUVBsZmg3amkwbVhwQWlMWVlzZlR4dkJRWEk5UXZhOU9K?=
 =?utf-8?B?QWVWWStEWXNrbnRrUHhkU09qSXhWbXdydlEra2hNdzdZQ3gwQnVFQ1lVek41?=
 =?utf-8?B?bzNCNXFBUXdCZDVoOHY4cXM4aHBrcm5JYi9uTkpLdnc0VnpJMVRnV2tZTGVR?=
 =?utf-8?B?MmFKclE5bk9MSkxCdXRjN2N0d2szYTJaSE5iQmhWSnAwSThwYkJ3ZzcrSE5r?=
 =?utf-8?B?RXNXd09zdnA0OStscnRpSitsUkJ5ekZpOWlVbnBaaW00RitqandKQjBLb29s?=
 =?utf-8?B?VGJWY2VjSUs3QWlHZ2x2L1FleCtNa055aGRNYWZpMmwrbnc2M05yVTlsS0VS?=
 =?utf-8?B?Q254TEE1dTVWRllFVlpHOE5XTkYvcWFHb3FqV28ySEpoWGg0bk9rSS9LRHRI?=
 =?utf-8?B?QWUxZWRRSUc3aG5SWWJDNUg1K09hck5QK1FUcWNFcWpzdDFGdVJ0WWNMSUhm?=
 =?utf-8?B?cUwvb2kyNlZHV3QwYlZMTVgrVkhXOEtFWjZPeSs3cDJINFVCM1AwZkdIYXRu?=
 =?utf-8?B?WHZUckMyaDd1SENrUFAzSnhmaUNjNS9lY2V3QmoxcnJLRUJReGpyNXhYejhp?=
 =?utf-8?B?NEZ1anIxY09maDBKdlg5bFI5NEl1ay9Gc0JJNzNvc0dvdUl4c2JVdGNnNUxY?=
 =?utf-8?B?bjhWa1pWaXV2RENFK2NIdUc1VVdJVmpyb0VQN21zNkM0WnhERTd5blp3SWRu?=
 =?utf-8?B?T0s1dWNvQU92Vk91bVVPVXFiWWNyWEpyVG80RzVDOHZoZE5WejdOcnd6cWpi?=
 =?utf-8?B?QzJvaEdrZjVSZ0xQeUo3NWswT0krd1VDekZsQlh4L3laWTdKVjBBMUlpL1cy?=
 =?utf-8?B?R1l6QStPdWFUT0ZKdkR1UDBzeksvU0MrS2RWdUR4dFdIVGxITUZ6cEZRcHEz?=
 =?utf-8?B?a3lTTlZJMVNLOUlZbDdnVlBZUlYrZUprMWdJSENjVVdyaU5UM2FLTEgrMFVs?=
 =?utf-8?B?R0x6WmFQYk5Fb091aEJMdHpVWmZrcHNVMUZYZzRRNlA3TG00dThIZ2xQWkM5?=
 =?utf-8?B?clFYWExWVStjM3Vzd3NINElKR2p2cGVzZFlaTHNVWE44aUZZaXo3cDByV3VG?=
 =?utf-8?B?bEtYY1FjN0YrbmsxMVF5RnhETEhxWEVTd2wvUEJtYXNzbk52cHRDVDZIQmtI?=
 =?utf-8?B?Y2ZZKzdXN2RwQnB4NnhGNVhKMGZINzB1SlVUY0FLSkVIeHVMdG5DUVl0U2p5?=
 =?utf-8?B?OVZnaUlDRUU3SS9mQmdsZldhUmN1aTlVeU5icTE4dXZ4VmFvcER6NFhCOWo5?=
 =?utf-8?B?ZVE5TVhLcDMycEJmdVpid2k2M0xQSUZ0ekJ2NEVveXI4V3U3NU5ZWlJXblgw?=
 =?utf-8?B?OHVsYyt6dkFueDlxT0pZSmsrcHp0blU0R3lrVk1QOFh2cGw1NGxpOVNQb1BU?=
 =?utf-8?B?bFhJYW00V2VSRHNFN1ZZMlhWdjVIcUc4MGRLY3pOd0pxN29sa0dpVFBKZnZ6?=
 =?utf-8?B?UmF3dzdqWGpHdy9iOVlkOFo3Z0lqT0c5NWhHNTN0SnZ3cDFOckVNcEpRNEkx?=
 =?utf-8?B?YnNIZDgrM2NyRmdmRFRmQldHbkNjWXZwWUZGUmU0aVliUlNkdlcveXZhbE1q?=
 =?utf-8?B?WEE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f3da64-080a-4ee3-4bfc-08ddb88c4fd1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 10:44:53.2308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STzLnt7ZtFnnMR16/2pw0JLe6DhOofSUoq0T+oOhQUFBK93L8vodBNqIp0RF4K9rfLQQngFaj6irB8ISami4Ljdka5e7c6v4Cc5+oxtnfGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6433

Am 30.06.25 um 14:17 schrieb Marco Felsch:
> Hi Frieder,
> 
> On 25-06-30, Frieder Schrempf wrote:
>> Hi Marco,
>>
>> Am 27.06.25 um 10:46 schrieb Marco Felsch:
>>> Hi,
>>>
>>> your e-mail configuration mixed my e-mail with your answer, which makes
>>> it hard to read. Can you please check the quoting next time :)
>>>
>>> On 25-06-27, Pankaj Gupta wrote:
>>>>>> Add driver for enabling MU based communication interface to
>>>> secure-enclave.
>>>>>>
>>>>>> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are 
>>>>>> embedded in the SoC to support the features like HSM, SHE & V2X, using 
>>>>>> message based communication interface.
>>>>>>
>>>>>> The secure enclave FW communicates with Linux over single or multiple 
>>>>>> dedicated messaging unit(MU) based interface(s).
>>>>>> Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.
>>>>
>>>>> You write single or multiple MUs are possible. I'm aware that the i.MX93
>>>>> has two MUs one for the secure and one for the non-secure world. But I'm
>>>>> really concerned about the fact that both MUs can't be used at the same time
>>>>> from both world:
>>>>
>>>> Yes, you are correct.
>>>>
>>>> Fix is still work in progress.
>>>
>>> So after ~6 months no fix is available :(
>>>
>>>>> Also how is the secure and non-secure world talking to the ELE if there is
>>>>> only one MU as you have written?
>>>>
>>>> Till the fix is WIP, either Linux or OPTEE can use the ELE, at one point in
>>>> time.
>>>
>>> That has nothing to do with the fix. The fix is for platforms/SoCs which
>>> do have 2-MUs, but you also have written that there are platforms with
>>> only 1-MU.
>>>
>>> This MU can't be shared between secure and non-secure world.
>>>
>>>>> IMHO it makes much more sense to put the complete ELE communication into
>>>>> (OP-)TEE and let the secure OS taking care of it. All non-secure world
>>>>> requests are passed via (OP-)TEE to the ELE. This involves:
>>>>> - eFuse access (done via OP-TEE i.MX specific PTA)
>>>>> - ELE 23h59m ping (kernel SMC WDG driver, requires OP-TEE watchdog driver)
>>>>> - HW-RNG (kernel OP-TEE HWRNG driver + OP-TEE HWRNG PTA)
>>>>
>>>> There is a dedicated MU "trusted-MU" for OPTEE-OS. The idea to converge to a
>>>
>>> Yes for systems with 2-MUs there is a "trusted-MU" and a
>>> "non-trusted-MU". As of now, there is no fix available for using both
>>> MUs at the same time. Furhtermore there are platforms/SoCs with only
>>> 1-MU, as you have written in your commit message. This 1-MU system can
>>> have the MU either trusted or non-trusted.
>>>
>>>> single path via OPTEE-OS, is good. But it will impact the performance of the
>>>> features at Linux side.
>>>
>>> Performance? We are talking about a ping every 23h59m (I still don't
>>> know if this is a feature or bug), eFuse write/read, and the HW-RNG
>>> which can seed the Linux PRNG.
>>>
>>>> Since the fix is still WIP. Let's wait till then.
>>>
>>> The fix is for the 2-MUs SoCs but not the 1-MU case.
>>>
>>> I would like to have a system design which doesn't differ too much
>>> between SoCs which are equipped with the ELE engine.
>>
>> Do we really want to depend on OP-TEE to be available for having things
>> like OTP fuse access and HWRNG? Personally I'd like to be able to build
>> systems with OTP access and HWRNG but without OP-TEE. Requiring OP-TEE
>> only to make the ELE available to the kernel in cases where the secure
>> world isn't used for anything else seems to be unnecessarily complex.
> 
> I understand your point. I don't like pulling in more FW neither but we
> need to the face the following facts:
> 
>  - OTP eFuse R/W access after doing the LOCK_DOWN fuse is no longer
>    possible without OP-TEE. This involves general purpose (GP) eFuses
>    too. We faced this limitation in a current project.

Ok, interesting. Where do find information about the LOCK_DOWN fuse? I
don't see it mentioned in the (Security) Reference Manual of the i.MX93.

> 
>  - With new regulations like the EU CRA I think we need some sort of
>    secure-enclave anyway.

Probably some sort of, yes. But not necessarily in the form of TEE or
TrustZone, I guess.

> 
>  - Making it optional cause more paths of potential errors e.g. by not
>    including the correct "secure.dtsi". Multiple paths also require more
>    maintain- and testing effort. IMHO I do think that one of the paths
>    get unmaintened at some point but we would need to keep it for
>    backward compatibility.
> 
>    Having one implementation eliminates this since.
> 
>  - All above points assume that the ELE-FW and -HW is capable of talking
>    to both world, which is not the case. As we learned NXP doesn't have
>    a fix for the 2-MUs ELE yet and even more important there are 1-MU
>    ELE-IPs.
> 
> I do see the (minimal) drawback of having +1 FW but I think this is more
> an integration problem.
> Speaking of FW files, for the new i.MX9* you already have plenty fo
> them: bootloader, TF-A, ele-fw, scu-fw (i.MX95). So your integation
> needs to handle multiple firmware files already.

Sure, but I really like to keep the complexity and therefore the number
of FW files as low as possible. I'm not sure what has more weight in
terms of security: shipping an additional firmware and therefore
increasing the attack surface or maintaining an additional code-path.

> 
>> Anyway, I see your point of having a single implementation for the ELE
>> API in the "right" place. But as far as I know other platforms like
>> STM32MP1 also implement both ways for the HWRNG, secure access via OPTEE
>> and non-secure access via kernel directly.
> 
> I'm not a STM32MP1 expert but here you have this setup with the
> *-scmi.dtsi. So you have two code paths which needs to be maintained and
> tested. Also if one customer of yours want to use OP-TEE you need the
> integration anyway, so you (Kontron) needs to maintain multiple
> configuration as well. I don't see the added value.
> 
> I think for STM32MP1 the *-scmi.dtsi support was added later because it
> required a lot effort to support it. This is not the case for the i.MX9*
> series.

Anyway, thanks for elaborating. Your points are all valid and basically
I agree. I'm fine with either way. But I'm afraid that implementing the
ELE API in OP-TEE only will cause another tremendous delay for having
ELE access in the kernel, especially seeing how slow NXP seems to be
working on these topics right now.


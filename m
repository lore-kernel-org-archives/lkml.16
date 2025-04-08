Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0220E264FAA;
	Tue,  8 Apr 2025 08:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102046; cv=fail; b=AWei5PkS/dILK+MGLSXkMFAnEudIAQwqKGK7xSp8e+Rs02OBuggBhDGQvr4tB0HdfvBi0Zo54ODf01WpEZSaCDSUWrG5trJAmTY1JfYYmEm49ISflQsIVzz70CUZ96nW9aOzP735aWgO2q4ZjvBxI0rED+zcmhlnWu6mgeHdyg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102046; c=relaxed/simple;
	bh=JlyhLs3Ph9dPaK9LLuD0Ijl6Vxr5RkNDoRW1wYe6/ho=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=E18YH+cXRvEaFhwbudTM+UThEsIZ8JtDtAVcdED11CrrGUP9lGpztu8LSJhC60sMOxSE8Y/ZK4gxB+YjlLzHFAAL8IEOWKqKVEDsSO3NUqaUYIYIAb+FyyLjenOzx2kka0st/FbaWCPEfg4/T/xwLD0D1eFR/6ANmFDD5SLbQms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QlDdOeGh; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QlDdOeGh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0SI4DwURoOjp254HKxAv0s6anWtB4kbY1Iuxoy6Op++bEJMOwJf1dkzR0seimw8EY5pu1Mknrp4NgYGH+jgJlgIaRtaREJiaMl+xBiLEDnJ+EN5z1l42cyZH3iksh6xsXidGo2eKzBYA6+vGxa9TElrPw035J2WAR1XgSvEY/00GvrfduzGH5i2B9pxMpAM6bubBai4U06UP+yr2cPYLaxVomx0fsV75O1JBL5zhgrDcak09BRYsG1QCh5SZqFsmy6HkNa8M45TDLDJmhZsUk6jGg6YMxQI7RtjwETbvKgzLILga3Eu8RjEqDN1otzvQ5eQh6R+2f65WZcjbRTDiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoXTun6c7q8EbkV4oFsXccEkdxXzNh80FDjlBDcVE0s=;
 b=sBB/3MYqw9T29qABq28bw763fziZB/4WOQ1qoWzk/ZZ57Ad4BQBCWByo9VX6SY3LVv8Jb8KNFVr6tmCFAGa/vIbEfTQXKKmZ3NAG7h4rkOva/CVcT7RZ8NxmnCH7zZIgdNftvjnrdAic7/flRESVHPoW8EW0LVw+rzy3gNsioX6l0Ouz/on6sGz2EWpSJS8cM1E4QKPq7qQ2F6JcVr4XW+NQIVtldi6hQMtxa2DHzxszY39Lk2A7IuSa0Oc96Gbjhn2U5O7+I04XtTRpdiwENKL0A8OoBz2uG9pt0/Yfg9mjirZ06vTGWoz7wxuDULfHn5O2uyOGamCcZQmjDaaeLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoXTun6c7q8EbkV4oFsXccEkdxXzNh80FDjlBDcVE0s=;
 b=QlDdOeGhslGz2aK0BPsO6LYTA05c9VQM3rtmNRvnI+FwgJG/S+rExH2m6jlXd9th3G8JFPwiksMdx5ytk9NKZu7ZH0Oz3FiQVqFPawJYsHYGCxzajsWBV+HODikUoKVJAXWhlAVo0WBQcFF1v/aLtCu1OnAzEQWRRjIqIZooPsa8/ApPnDKVN/e6jF8sN7pay1kw9pWztgLOt0cZ04z2H0gHhwCA9KDjo/nRutO2y3aaM37azivTzbPpqtmOiS+Sij28U3Z9OpEkq/dU1ovZXXyySGQKBevcfpW4F/frAWKP2zvlH8YHAEaJk9poh5NYrExQzg61aNmlWBGvk5/nPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB10063.eurprd04.prod.outlook.com (2603:10a6:10:4af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 08:47:19 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 08:47:19 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 08 Apr 2025 16:44:26 +0800
Subject: [PATCH v4 2/7] dt-bindings: firmware: Add i.MX95 SCMI LMM and CPU
 protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-imx-lmm-cpu-v4-2-4c5f4a456e49@nxp.com>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
In-Reply-To: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744101964; l=2150;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=UVPVtyqvAw9BWvW/abBd2sBVxsFgUdE+KuVHUN9Q9vM=;
 b=cSraMTd31uveMum888FumqKwFujjtZilZzcXmnidLngW3SkYICIOUZ01jOJ1QyrCAuRIPsNdc
 BJDsDKAp7aKC2xlitd7uR2UJC/kjk6CUdvGgHDrPX1SQGlMqhiAnUrD
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DUZPR04MB10063:EE_
X-MS-Office365-Filtering-Correlation-Id: 43d67848-c07e-44a7-ac94-08dd7679f87e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVRZTit6RWFhVngyc0pmYjQ5RVhPZEY4RG90VzQ4VTVUQms1ZkNsQUcyc0s3?=
 =?utf-8?B?KzBsZkRoV2lOVFR4Uk10cXpWemkzdzZhdmk0NDN3Rkw5a2kwUlZUcERWZHpv?=
 =?utf-8?B?eHNsNHgzWGtLK283VGZCdG5SOUFyMlFvQjM3UVJTODh0MHdIS25jWUtLbXly?=
 =?utf-8?B?dzlaaDNDNDltQ09iOFlQWUNXMlIxRWJicktIUWpYZE1hSUZNdStiZStxbXVH?=
 =?utf-8?B?NVUraFdVdVFQYzZRRFVzL0hFbE1hdEd5T1BYd2YvaWtHMnF0Szd6MWppaG1y?=
 =?utf-8?B?M3hyVncxamczSGJsNUc1eVZDbXRWaG5oR2ZjVnJVT2xEcHp2SzhmNWYvdUhZ?=
 =?utf-8?B?ZzBZMzlQOGdvZFhZd0FNa2RrUFhRVHBTSkk2cUhtNTJKVG1yQlkyWExoUmE4?=
 =?utf-8?B?UEdVNjhKbFZKWDNEUDBRNWhoMzNRNlN0cE40NEsxdjQ0YkRzMmxXakdqNmpq?=
 =?utf-8?B?eHVFZ2ZEQVVNazNRODRrWkRvMHFuZVU5V0VqY1o4Zm44aUExamV1eUR5VXZG?=
 =?utf-8?B?T3ZGT0FkUnBDeXF1Ky9heis4UEpmWGc1K2MwcnNrTTF3bnNrUDAyYXd6OGpC?=
 =?utf-8?B?QVE0cFd2V1IvTW1mZURSOGFmZHdFUmI5QlhaeWxsSTdPMjFtMVMyR1ByNE1l?=
 =?utf-8?B?bFdZak4yZzQ2QlB4YW03WjZXcENSQXdCSWlSUGxUUzdsZldZOWFYS216N1RY?=
 =?utf-8?B?UmtuMWZpazBYL3NVNEZBQ2xDZ1pNUGRjdk9OaW82VTBZTVRIQm1qRkxWWFRk?=
 =?utf-8?B?Rml5VFJDK1RtWktGandZdGZScUVTcXpXd21CYUhrckJVU1RmOHhnRUpRRmp6?=
 =?utf-8?B?dUtXY0dpK1I5blpEc1dqbHh1L3JjZFArMDU5aU1URTZvUzFrem5iSnJBaDNO?=
 =?utf-8?B?THNCRy9IUytCUGhWUHQxbGc2MHpJMy9Nc1dzQUFDaFFjQkNhK2NNNDJidjAy?=
 =?utf-8?B?YWFVMnNuU3Qvd3AzV1d4d2JZRjBiVnU3RHlEalUvVjMzTG5VZ3E3V29mN1Jy?=
 =?utf-8?B?bGN3MEhLKzhWcktYcERSU0lJVjJ3STQrMm9sdllNazU5aWR2NDZUUGF0MUpY?=
 =?utf-8?B?Z1kySUxkSzJYY3FOYUwxZzBRUnJTZ1lvR2JvdjdnclVnVFhaWXhONWwzNDE5?=
 =?utf-8?B?UUdDdHpwN1Q0NkYzNGp4cHFpQmpjY1lOU0NicGVweEFObk94ZnNpUkY5Tmgr?=
 =?utf-8?B?c01sLzIxN2NIbzd2R0NqRXllcnNjbFQ1cTVkbnBhcDFSVGlIbGFUazd1VGhE?=
 =?utf-8?B?RTZHenpKeFNvdks1Q1ZnTHhEeklrMStBajBpbHhyY01acFEvRXJZR0tFMlll?=
 =?utf-8?B?UGRCZUNFaXhadDdleUpheFpLR3paM3oxdURaZU9mbGM5aVBuVGRXd0pFb0t5?=
 =?utf-8?B?d2dPVVNPWGVHc1NBRlNmZCtkUnJlOFpxZS9YSCt0NHhGTFI1VHBhMnhOQWFR?=
 =?utf-8?B?cHMrRmVmcWpBd1JCS0hSUlFXallZaXpKWDZuV2tGYkd4QUdHN1BUNmdWVk10?=
 =?utf-8?B?YWZPbDQxTWtSR0dYUlpHZWlhNk9nQ2pwelBDbXI1S0xHYW05MkovbUdzcCts?=
 =?utf-8?B?ZDZsUWFiSkJXY2lydjJRRlNQaWlPWXJpTVh6bnVNUm1ZbUNxWDY0cm9VS2pH?=
 =?utf-8?B?RE1jdGpTSGMvRUIxLzNUVEwzRnhlS0dtdW9kZUVrbXJ6UG93U2d5K094d0xT?=
 =?utf-8?B?czBKelVOWTFqd0VNeUlyNGRPczNnaGUxRDgrQWU4RHVVbTY2bWsxVzFhRXhR?=
 =?utf-8?B?LytkNXlyOW0xL3NBK1hEdlBtSEsyZFIzbFRCbzFkMEx6amJKL0FqeWZjd3Q0?=
 =?utf-8?B?TXVuNEkwbVNNVXh3RFRmdUdrdVJEbERLVkpnRU92VVlFc0d1RWJSWlVmN1J3?=
 =?utf-8?B?VzhFMUUrUXdjcFNseVYvVEFROXZaVC9Zb1pxNHJ1ckZVNVJTOG9KMDhxNFRq?=
 =?utf-8?Q?yRy0XhT49hXe0viCe9poSyv2SkLY1mu8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGdWSSs1YjdVclRFUXVvRGtWOUNyUmZkKzM0blM3VWxZdjJsNXcvc3ROMlZX?=
 =?utf-8?B?a2d2V1VaUTYzVjQ0Q2ZKKzZaN2lOSGp4cFVBenNNOWE4YlhGMXVxaG9pWERV?=
 =?utf-8?B?cTM0eXFlRldnanBubzh6dWtJWTF5S1hLbFcrT0V2WGNXQnZEcGJsOW02Ylc3?=
 =?utf-8?B?QnB6SVZzdjlRU0hQdXFYd1M0RlJQMjJaVkwwTzR2ZUJtR01aclRYbml2OUY2?=
 =?utf-8?B?cUhqczJKYStDL0J6dGxqMkFLeWlXK0VGVmd6RnFHNXhqNWJtMWI3NU8raUlL?=
 =?utf-8?B?eWR0elVvRkxUSklYYnJSTmx0MDVENkQvNkdiWFM1WVhDbzUzRFV5c2ZjaHJF?=
 =?utf-8?B?U0FxdlpVMTZiRm1wcjdjOXM2ZzFlU1IwMjVNSjZMZVo2Z2E4Nmk2OC9MVlpM?=
 =?utf-8?B?Z2locWw3R0loak1RWE53aHZnSDdnMXdVNGRRb29rM2pydTdhUWgvTkxuMFQw?=
 =?utf-8?B?eWswTll4dzk0aStadXE1NFpHN1pJVXppM1FUTnpnd28vOVJmcTF3Q0ppeGxO?=
 =?utf-8?B?QXdJMXphZ0xWaEtObTAzZWF6dTR5YWlJY2pRU1RFdEhGYTlYaTlXeTFFSXJN?=
 =?utf-8?B?d0ZvMWhxaktSVVRHV3U1ejlLRm5BK3RBTE1pR3o0cld6bmVlRVA1WDRWTmNw?=
 =?utf-8?B?YUJlaXp6NWpCQ2QvUzJ4QXpVUHl5R1BDa2txTis1azhONlBGM2daMHQ1VXUy?=
 =?utf-8?B?cXd0OG44R1FyMEl6UmVESjMzN241NjJrYk9EWGs4VE1lL2FlTG5iWGhzck9O?=
 =?utf-8?B?bk5oVFAxMnJjOWQ4VjYxK3VNTHY3VDdpTXYzUDhtV2RiVlJaZVluSFFuQnA0?=
 =?utf-8?B?MGtVK0NBb2FsSDJ3N0I4NmZUeFdLOFM2L3REQ2F5ZzNiU3JBWTBQdVR3NTA1?=
 =?utf-8?B?dVJoMTJjK3NOUVljeE05UGMwdDBZb1Qwc05GRnM0bUlzL1I0VCtPcTE4citL?=
 =?utf-8?B?WmhqOUFYdTVwVkM4MnNtN1RPd0RjUnpLWUp0SHhWVmF3ejhFSWdSQTdaMW9p?=
 =?utf-8?B?MVg3M3NKUFFXQm8wdDVZZlJNbjFVdUN4SXQxMVVibzNxZFl2RTBXVFFDKzU1?=
 =?utf-8?B?cFJDQ1hWenRVKytaZUxqeWxjMzVvQlhWYVJLbXZTU3ZUVHBsTllxYi9HNkIr?=
 =?utf-8?B?MFdPeFJvVUttVTNkOG14c0trTG9LZVp3NmJlbTN6TisyRnRvMnNOVzE1SDRy?=
 =?utf-8?B?OFhzZ2dFQlg2b2l6VVFuYTJmc2Q1WnNLTzNxREVoSEYrdXlKNDBPR29IZlZQ?=
 =?utf-8?B?clRWQ0toRS83aC9IaVlLcjFMbnFnWHhyb3pkbi83dHEvZnF6N25MUDdFOGQx?=
 =?utf-8?B?dS9uWkp5eEp5eVJUandjaGxsZEo0S1NyOVNGMkFIMnRxbnF0VVNuNE05ZVVJ?=
 =?utf-8?B?MzRtQ0cvYzVmajNjSGpZS08vVWVraDVWTHY0RTQ4dzM1UWw0Y0h1WGk1WlV5?=
 =?utf-8?B?MFJYaWFnY1BsT3FhcEdKbjFoSVVpVHp1RUlBb0N3cmpIcHdWdHU0a3BTUWRS?=
 =?utf-8?B?QVcvbkE1bWgvVW1ueHM0TFZpcFZ1QVBpVWRvUU1Wb1huNjNMeUFtTEVtZ3Fy?=
 =?utf-8?B?aDdNK3ZndHc4ZWFyWmR6YUozTUcwVWhqdGRwRXorNndmSkxEUWlveGRqbEF6?=
 =?utf-8?B?VzY2d01DcWR3NXBhVmUrN2R4YjVkSDQwOUZJRGk2ZGpMVWxMK3lKeGhnMWVP?=
 =?utf-8?B?YXF5dlZ2OUhEcml0MnlaY0kyS1VuNWRSYktKQ2RqaGV2NEpGREZzNkZ4YkFt?=
 =?utf-8?B?S2dhWncvVFZWa3BOK0dPMTd6emVKMUJwOFBwNUQ5WEhmRTJMbm1GK1B5SVZi?=
 =?utf-8?B?a1FiMnlyM2VkSVlUTFBwTmNzZWtSN2FMVzRud21TZURERHlTL2VZaWgrSHAx?=
 =?utf-8?B?dkhLekZvNzFiRWxkQUZYNHcwbnMyN1R5OWhzZWhOQ2N3UkZUK1JNVFRMOWRp?=
 =?utf-8?B?QkZnYUhvOGxKNjBWNEpzSWVSWEs5bS9JKzZpQ1FSL1MrTkxvSzdtbW5ZVG1B?=
 =?utf-8?B?cCtIcTBOZkk5U0xJV01FUmNXYll6TmZMZEN2ZHlyM09HMmhHc3UyRGlRWlRy?=
 =?utf-8?B?LytveE81VndhU28yOThqTTBmdDhDa0tmMmtzd0lKRmdhR3U0b3lERkd5ei9W?=
 =?utf-8?Q?B1Z7bnc4vNqDGyAobBtqvtdvd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d67848-c07e-44a7-ac94-08dd7679f87e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 08:47:18.9846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uepimDkKZBfX+eNpcBGhMTlrjiefNc6Z7AGAufuoGoC7Mx2QxJoyR3PxjRLz5aIKxiyOwOs24YOFpxkCyr8TOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10063

From: Peng Fan <peng.fan@nxp.com>

Add i.MX SCMI Extension protocols bindings for:
- Logic Machine Management(LMM) Protocol
  intended for boot, shutdown, and reset of other logical machines (LM).
  It is usually used to allow one LM to manager another used as an offload
  or accelerator engine..
- CPU Protocol.
  allows an agent to start or stop a CPU. It is used to manage auxiliary
  CPUs in an LM (e.g. additional cores in an AP cluster).

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../bindings/firmware/nxp,imx95-scmi.yaml          | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
index 1a95010a546b14b1d3d97aa990c0305a551f2620..2bda2e0e13693f12816762137e07dc308d2c49e4 100644
--- a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
@@ -11,6 +11,18 @@ maintainers:
   - Peng Fan <peng.fan@nxp.com>
 
 properties:
+  protocol@80:
+    description:
+      SCMI LMM protocol which is for boot, shutdown, and reset of other logical
+      machines (LM). It is usually used to allow one LM to manage another used
+      as an offload or accelerator engine.
+    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x80
+
   protocol@81:
     $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
     unevaluatedProperties: false
@@ -19,6 +31,17 @@ properties:
       reg:
         const: 0x81
 
+  protocol@82:
+    description:
+      SCMI CPU Protocol which allows an agent to start or stop a CPU. It is
+      used to manage auxiliary CPUs in a LM.
+    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x82
+
   protocol@84:
     $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
     unevaluatedProperties: false

-- 
2.37.1


Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012067.outbound.protection.outlook.com [52.101.66.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD95925A2D2;
	Wed,  9 Apr 2025 07:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744184738; cv=fail; b=do2icYJIXhY0iRIh/Wwe5BkIh40C/UslT+1eHW8PYIaElb0ZwWn6ctE1WKjQjDit2dW/o8KOXzvnOIr7H7QsVI+2K4QzygNp0JOdgvc+3PdcE09d5g81RFhY8WZMqQlZ4l2jfc8Vd7LHTItjSpOOOfUjQ1jy+faHVJPsNKbqYfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744184738; c=relaxed/simple;
	bh=Kp+ljsw4LjafbeWaYUI/UFZd/hHKAjei3N7FFcmHVEk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gbL3aGFuaDdRuKyzbsW7UVdNPZE9i1bs7HUB1pFH83Vadg49XH9yJfNFKysMhd/HYbd+76J8tmMUSpW6sMMrtXCvavUlPVk+6E4ECYxgdt5/yiOOuIpiCuoaja6uyyHOu2A5EGFApxTjnMXhT3r/mYT0ePW7tDFdYBrriyjtUbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SdUqGVq9; arc=fail smtp.client-ip=52.101.66.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SdUqGVq9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lN2e7mJEmeJFkmmBt9r/pKpODi84/pRGRJ6YG5ePdpB7k1C4sNbpF/9sM+xp2XhOfQ6DVKy9JDWpPwdS61psn/3HaSUdZM9bPHj+MwNm6MjThVWWocvzNQEBFNW2X2QQKC7B7VPeHu2pD1T2sLdxlSEG6ECKr2Oz3KyuXDfNimUZxBHN2BwcTH68b3JYSLagq184hSM4PskhB3n54PB/sTMpxXaE2UHEEPOQJoWQrcl6zYxZ4PwWLlVPtLu13LQYhETfwpTlbDB6wd1baZfxopb75tRGOKct2rbVh6eGKHXdkAlayKXq9a8B6wHhUh7UsgvlFVaskw6RNLvp9umlpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJgZWtO8qVyg9Op/H2cRNon2bvhKjpE/Z67LWvNH6v4=;
 b=R2p11+NaDxPTMgPMm1c6FoPiP3sAHmlOkDqXgalRxEAk/Wza6tEdl0sgL4GiFoSrQM15Wpv2hM/w1rkxmN4VOHCOkxnHJfDsexoF9BWjxye2+OU31aJS2jQ+cHfRCGPmuMbrLG/kUDroZwb7betAUgjb2LlgWWlT3T6KQ+u2JMsl7YXum1Ap1RyEQh8+Flo+rwtVJEah0AYHNTQcxPR9S6UlrmNT9DMlcSycl974U+eCWdUrUWjSxBL3dsUEvWCWDz66LA6JKmBhQqUJun1tdNwYW0ZaUsmOBW7fOUCat9VOdRbjKV8eUxS/WrwCGnuqBWTig+iYui6mZm1mn0LF8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJgZWtO8qVyg9Op/H2cRNon2bvhKjpE/Z67LWvNH6v4=;
 b=SdUqGVq9CiH2Z+CQzBYa+/nG4w8IzEIMWiD8Dq1c95irbo7Vd9Aox6vyzSY/rgwOXZaN4t8APuAXlosckPBw83iOkWEXQxKVb+rQvnY0Gnf0vpTwO2KyKGmxEj+0+BBpUK3Fk+9DuuaoM7f+NbY6CYjgnLJJkFod0gkK8hdH3B9XWLjqT+Nqa7VQyijgb4YrZ5Z1Zn16dfcSt5D9kr41/8h/E6jT/KI01sgk+7Drka1hwfT9vMo1FM+wBI8nHd6Q3SbJp3QcpENWOyJlhwW08SSaNp3i8G/aryotWX/s+ZvNVs/8w/aAcl9HBzvycbvbdzaGsJ5KvaId/MS0fA5Ahg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS8PR04MB8104.eurprd04.prod.outlook.com (2603:10a6:20b:3b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 07:45:32 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 07:45:32 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	s32@nxp.com,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Florin Buica <florin.buica@nxp.com>
Subject: [PATCH v2] hwmon: (ina2xx) make regulator 'vs' support optional
Date: Wed,  9 Apr 2025 10:45:29 +0300
Message-ID: <20250409074529.2233733-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0011.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::15) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS8PR04MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: 4529d6bb-68f0-4d00-a8b3-08dd773a819a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkZpSVFsODVycFZTWWttT1lFM1BTU0tnTmZ4WDRMU0ZoUFVjSnZhNEFQWUI5?=
 =?utf-8?B?THlSazZ4UmhaRzVkZEZ5ZlNuU1IyOWVkT3dpRDFVM1h3LzIxZjQwZ1FVRnll?=
 =?utf-8?B?S2FJMk5aajg2eSs1b1cybmdqdGF0bGovWEkwMmtZelo0NmRGUGVkMTcrczhO?=
 =?utf-8?B?TFJONXlORFJpbllmbGtUL3JWOWpTYWFTUGlJUC9kVzZnZ2k1NVJIeDdMZENr?=
 =?utf-8?B?OElhOFo2ZWVSdG1sa0VOWU1vclllcVNLYzdveVJ4aUdMMTNuQ0ZnTkV6ZXZR?=
 =?utf-8?B?WnBuZm5vQVBsQzZlNEhuRWw2MXBrTC91WHlsS080VjRIMXZmWDdhbDMvcFln?=
 =?utf-8?B?VEd6ZkVKMDR0bU1CRWlUZ3QwdnpYY3IxRG9Vc1YzTWEzTWkvQnFVa0ZhSTBQ?=
 =?utf-8?B?OEg0OVpKTDREQUlYc0xBN05ZanRKQzA2T08xYWdzaE5JUDVCckJUN2Z1TkFw?=
 =?utf-8?B?M3F4aGpYM0QwOTdzTnZoNFJjaWNNMHJUdWlhMEl6WU12Q1NJZGNScWFuS05t?=
 =?utf-8?B?K2o5bjUwbzQ5UW5PUlZQbWptTmkvZE4raElHNHg0ODBxT2poQ2Y3bTFaSHRy?=
 =?utf-8?B?cWtNNXYwSHZiTjg2TXZrd1hpTlRCTE9WdzJpZ0xYUzhseVkzcDFPaVVRUVpZ?=
 =?utf-8?B?a3JZVm9zUFBGT01zY3RGWlN5Mk15R1ZJM005SWF5Tmp6dUt0b1EzbHZqTmFu?=
 =?utf-8?B?Vis4MkpZV3g5RlVsbTVUa0NzUHZGaGp2eVV4Q3RmUGpMd2dBYVVLNEFjRUlV?=
 =?utf-8?B?QzdoNFQ4bkFrdTM4dFRScHQxa25sa0Z0Q21iUEhsd1V6N2hsSW1BMFh1a0I2?=
 =?utf-8?B?c2k4dEhoNGF3VzI3aGtrY3h3UHdoaTN0TFhpeUJ0RUxFNkMzT0I0L3krNUg2?=
 =?utf-8?B?WUNUNkhjcmhnaXFieVIvKzl6d0MwSWUrTjE5Y3prSVJWOU1CNHluK0pqK1JE?=
 =?utf-8?B?bjg1b1hEQ1BySWlNc1JwUEZ2UWhJbXZsMTYvendWRUczbHg2c3ZKcjhTaGtY?=
 =?utf-8?B?dmp0QjErVUt0enNhVUc5RGh6L3hQb2Y0VXNUekVIR05BVnYxN3JqVlhJWG9V?=
 =?utf-8?B?c0EzTVJadkZBTzFGWXJLbDR5aDh0RmZ4VzY1MVRVMkthZU1QbXd5bnYyT1lv?=
 =?utf-8?B?OVRMRVB2b3JrTTgwV2JBdnlHLzBFamoxV01IcEh2aXUwNDZwb3hsdktzNm9D?=
 =?utf-8?B?N0hSVisyb0x1RTR5d1ZYWHgxa3NDUXU3b3VlV1lSU2VnWTdwUU5ER0d0clB6?=
 =?utf-8?B?aGFRd3B4RFZJU2trenEvWHhkUHJsLzBCL25vbnRiQ0tHNnozY0xUS2xTSG02?=
 =?utf-8?B?RUZYRG1zN0hBQno0SVNJdHlMWlJ6YXIxTWsxUUt3MUJvaHZEaW12R0wrNVl0?=
 =?utf-8?B?UWxkZzBva2x0eHdOVW9VQ0pUY1FiN251S21NODd0blFYcCthOWhaNE1xYVlm?=
 =?utf-8?B?SCtRWEFVVGk2bS82THFKOXVBRFo0ZTNVcVFsMWh6Um9IN1oveExNQW9YZVl1?=
 =?utf-8?B?N2Q1ZXl4Q3Z2WlpiUGpBbDNtNmdzc3EzcHFKdkhaOFAvVm1mRWY2MGRjRXdy?=
 =?utf-8?B?QzdpTEIvOHJCeVlWYWtpVXVGeXJSTSszR2FaWEVMMXVRc09vNTdHOHFLamU3?=
 =?utf-8?B?WlQyOG9UZ0F0N3VyVzNneEl4QWlzbW1rZno1eVlERnZxT3IwM2ZEUXlqcXJv?=
 =?utf-8?B?UHpSczZUTFJFd2VyQmQxZHcxc3g0VDgyQXdUT29MR0hBUFZPYlRGdmRBRVNy?=
 =?utf-8?B?WHhhN1lYNzVxWE15MUN6ZmVBczJ5eHF0WlhhMkQ3SGhWa0VKUnZtWlBTQ2pw?=
 =?utf-8?B?MEQvdzJ5eis1MHZpMDhkOFlhTTN2VnFQZzhRSk42TzU4ZGwrdjd1bEhHQ25v?=
 =?utf-8?B?TU9Yc0thMXd1YWV0MTlDa1ZxU2YzYkpFbWljcW1mbE1BKzQ0d2JyTkZWV3Vj?=
 =?utf-8?Q?CJLgTpJGjvY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MERFd052cFpRblBZeFZnYm1YbGxMQW0yU2tLbEpwbXpOOFIxZFdVeW5uT2Uy?=
 =?utf-8?B?UjhaNVZGUXJZbnZQc1FVRzQ2VTNXYTdPb1lwZjVzdEVTT21rUkxFOE9QaFFF?=
 =?utf-8?B?MitaUGhXM09TZDBEY1g1ekxnM09xMlM1bm5hQ3VMNmxjZlRGRnQ0c0lPWm9x?=
 =?utf-8?B?ZFVKUmMzVGkvWjlEVHhRTGRpTFlTNDVETmNpSDBWTWFBTDlJeFY4VlhoN2Rk?=
 =?utf-8?B?VGJNc2VwMFVFb1ZOcVExZjBFbVlUL3M4TFBKS1BoNk5BK2x4eW13UnZlWnRR?=
 =?utf-8?B?Z2trcSt0UU1UR3RhK2IwNUVWQ1pLZEdYK3M5N01yOE1Sc3doa21FRTRLU0ZZ?=
 =?utf-8?B?ZGkyNUFTdCs5ME5tY1R2MGI3YkJ5bkZHRGlQSzV0L3gyeHZUY0pUNzBOcm1n?=
 =?utf-8?B?aXBhelExZ3NVQXpYak9tcWpScHl6MitNUmV1WVd3ejZYWHBES2NQSnNmOHV5?=
 =?utf-8?B?RFpBUmZhR3FIbkNZRVZGaTVEekd6bXY0RllzV2E4cFVXMDhOQWVxayt1VWZC?=
 =?utf-8?B?WFBuNTIvRXEwa1lqOTdNd24wamxSL1BMaHZTVTh3WU9HUmUvdlUyM3hUVGFl?=
 =?utf-8?B?d3hYQzZveTN5alVZMk1hWFVNSDVqT3NUUS9ZeTJkRVhQd0YrYVl1M2FzMTZz?=
 =?utf-8?B?dVR1eDIrSE0xS3FLb0YySmhLOXpyeUpvaHN3dldwSzNvNjhwNzFENmJvNkpl?=
 =?utf-8?B?WDlNL2dFMFRzenNKMmIycGVuZnJjUUtYR0pVa2N5Y28zSlJ5MHlMa2dQLys1?=
 =?utf-8?B?cUNSNDQ2WWdoYUxPcU9nd3E0TGZSSFovZ1hNUm5FV1Yxdm9tN0JOemhLZWhy?=
 =?utf-8?B?UVMwdUlld0Q2Qjg0cDk1Q2s0WVBhSy9weDN5Y2FKcnhIMm1ESkNOdjdjOHRz?=
 =?utf-8?B?ZW8yS0VoUjVkdWpDcXNQc283elREajEzM29jSzFIT0JSVU5iamF2bzRJUjlQ?=
 =?utf-8?B?U3AxUUZsUit5bWRTK3hsUElYT0kyM21YTUJBYUNSS0hSV2pMUDczOUI4TDBl?=
 =?utf-8?B?aGVYWkZGZkt3dlRsT3VRUS92TUdQNTVPcGdkOTRvNFgyQnQ5REtEMzFpcXdV?=
 =?utf-8?B?bXRFaWNZcE9Yb3RoWXU5TVU0aGRDblNFMzhURkFUZ1g5WGJkVmJkTmgrdGVS?=
 =?utf-8?B?WG9wd1pJQTBvWWtQYWxRVVRyRnF3RUYxMjNTK3VjR2hhSFV4NVFMRHExZmJh?=
 =?utf-8?B?VkFId3NPWWhBUzVDT0wrY20vZmZWdmNrVWFtUk9SSEpyaEFaZGg2UCtFazFJ?=
 =?utf-8?B?QUhoN2wyd2dwNDFKUFhsQWt6eFlZRitoaGVHanZsSkhtOGxRQ3ptbTh2RERp?=
 =?utf-8?B?TzYzaW5ORlFEay9uVFVwSXpXbHRlVlpSUEgydlg1Ukc0ZXNmVkpXWm1XOGpK?=
 =?utf-8?B?VGZkbCtEMVRYMVdVOWpYbmV1aXhMTUl2YTZSVXZVODRZOGttUGhTa3VndTIy?=
 =?utf-8?B?cXRNRXFhUkptbExaUFVENnNaNzNkdjZjODQxT1dYOGZ2eEk4eWxxWGdWQXZv?=
 =?utf-8?B?VUhCNFNhSXZIejBHa0xpNXhBd1BUUU80SGFFeGVLa3QyejdnSGhlbzBYbGEr?=
 =?utf-8?B?R2pnNXZUaXRmemU3QkRlWWxwM3RpNjQrUDM5bzhXNDRvd0VBNGxnVmRjaGV5?=
 =?utf-8?B?RFJKSGVIemZLdGRiVHBYekVlM3N6a2M5eVR4TzJrTUxQYXNkTTNDenJLWkQy?=
 =?utf-8?B?eGFyUXQ2bjl1dGt5ZzUreTBTUFk0OGlndExrZmdnWlV2dVhGVFBkZU5IZmd0?=
 =?utf-8?B?VnhRQ3FlUEJ3bUU1Q0NpclZzOFJETUhubVNhb1V1Q0RZcGpRKzNQSEROcitm?=
 =?utf-8?B?c1o4SGtwQW5XdjA2cm0zdWExUDdKQlZsbU5IemJtS25KVUVyY3E3NmpoN1la?=
 =?utf-8?B?ZG12eFhSdTJPTE5CSWY3QnJlZlV6OEhSNFZZU2NjQ2plMUdEQnpoeFl6cVdT?=
 =?utf-8?B?ajZSekE1aUVOUzBuWC9vSmp1MStnM3RtTkZ1YjREbGUwUTlDTGVOT1FPd2hn?=
 =?utf-8?B?UHFNK0RwUklEcEQyRzlXVy9obzJtd2lEWU5mSjdPQzVIYzkrMEJiZmZoN1Rt?=
 =?utf-8?B?RVlVdyt0d250S0t6MjhPbEY4bTdqVnc2ZExpK0J3WlZ0eUlVTXRHNzNvcDVS?=
 =?utf-8?B?ZmtSenFILzhvanpsbGI4V3JIajY4ZjdtQVp3VG96WVpWa2dqZjQzTC9DT0xX?=
 =?utf-8?B?akE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4529d6bb-68f0-4d00-a8b3-08dd773a819a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:45:32.7117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPQ/Aou/PtZUjM3njwP0Kt6jdFWKkEsS2fXZQ8yYaBJL9f6g8NFB9huDnAIy/HcQo8PyWdWjBGnNeaQjJhClioDjMy/csmGPcndbgONtjdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8104

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

According to the 'ti,ina2xx' binding, the 'vs-supply' property is
optional. Use devm_regulator_get_enable_optional() to avoid a kernel
warning message if the property is not provided.

Co-developed-by: Florin Buica <florin.buica@nxp.com>
Signed-off-by: Florin Buica <florin.buica@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/hwmon/ina2xx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 345fe7db9de9..b79e9c2072b3 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -959,8 +959,11 @@ static int ina2xx_probe(struct i2c_client *client)
 		return PTR_ERR(data->regmap);
 	}
 
-	ret = devm_regulator_get_enable(dev, "vs");
-	if (ret)
+	/* Regulator core returns -ENODEV if the 'vs' is not available.
+	 * Hence the check for -ENODEV return code is necessary.
+	 */
+	ret = devm_regulator_get_enable_optional(dev, "vs");
+	if (ret < 0 && ret != -ENODEV)
 		return dev_err_probe(dev, ret, "failed to enable vs regulator\n");
 
 	ret = ina2xx_init(dev, data);
-- 
2.45.2


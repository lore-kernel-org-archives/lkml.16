Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2117.outbound.protection.outlook.com [40.107.93.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D99B1CA81
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 20:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748897714; cv=fail; b=dgS/YUrUHroIFOgFsiq9MQiEa3Da9vjOWUGCcYwnHTJtUmNH/Uc+W+xlA2hlOUtphQZC+2ShNiufofkMVP7xpU0nhnZqKNY2H+Cjz4j1QPwGBTZaY/6u02JNpSqjC50yOR/KSo5OflcvBPtDEc3h+WRXqZactoyhPX/sKtmOqw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748897714; c=relaxed/simple;
	bh=gFG4Dv9O1oqGGXB9JROYiRQ2SrJQVB0xBdZiMWX4eC8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f3xzJchVef9Kk8vP5kibf42uxlonlvyTDIZrKYa3TQJfJLaaK/4luQod0V4kUR70GoLowyyeTYMe4AQBKshM76CcnPPWnu+xORP89O9lUJGFXDTS9//2nP9AXfotwDk17wiCwfLHQfMIUylU2/f+U0L2SquOcsPa9SkChVm9vTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=CydIbeuS; arc=fail smtp.client-ip=40.107.93.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="CydIbeuS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZVrw+AcK6JkZxGCaR14d2VnA+hvSv6xPyHAeJuPIe0DITrTzfXV56dftPPyaqB5Lon6G7COeE0amIgh4RcuiTjuG16LWFhv18NbDEstiqKpcTEntTuda9lCR6EPB/SjtyJvQ4wYTkpQZdjvGiJgWYqxukeAMl9EBLQQe50Yc+8GiTnDt1rqOD9SZP17oQ5pReP5SgK9Nl8FEpzXRjqZTLYJ/LixjKKscpb3qap+n/2TacTXTQQtJyKgics3YTFwa0nZBaGd2OHHUYu0S7UN1M5pJyEo7x4dWERzklKLy3hlIE3th26olGth0BqA8fAvkdpG4tdcIbzL7VWHJiE4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cetel2XkJf6b8L4R8wRkZ3PGcpeSR5/nXVy8Zp5+eX8=;
 b=f2gEmZ6kz6wntDLt2dRzGiXj7fFy2JvLQKYGKws7JNmUku86hYK8PjsXzQ1okZnHHumrCuLmJozBYI4wdnCXVmLLwx+9uKRKRs94QF/k57dA5WCDzVwkS69bqaVxSJEccvCAgYXNUEXmdO6BqpGhHpyzbYry9bVywJTqK4H5hcPykKpzZWAq6dHsd7rBUeJRntJdW6Nl1MVC8mKepyqx+ZupD0yqmJ5ySEzC0YXzSToArT/KvEckt+W8cqgqmV1o0k+7gtRUOtaR9sBJ5QM6TurbER+erFDPBwFoI8WwCLxcAu3bJSw+8trgOZJ6CfA3Dq6jjnE8gJUgwUS3PO1qvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cetel2XkJf6b8L4R8wRkZ3PGcpeSR5/nXVy8Zp5+eX8=;
 b=CydIbeuSr5VvJUR5nj5VkHzqaBkLlmefJqg0KTIaDy5/LL4DgML/cTpeRH2tgrvzMjR2K2XTrIJI6yCeQr0czUsvh7njRyi0RpBX2VaIcy2EBrBtSturKhtM3WvynRHjmR+CRAXdtTYZh0WuqFZ4A/Lg/kaWo7u19xijAlf32Bk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SA1PR01MB8621.prod.exchangelabs.com (2603:10b6:806:375::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.33; Mon, 2 Jun 2025 20:55:06 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8769.029; Mon, 2 Jun 2025
 20:55:06 +0000
Message-ID: <4a22af04-bb41-4c1f-b5d8-f53d19439599@os.amperecomputing.com>
Date: Mon, 2 Jun 2025 13:55:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dev Jain <dev.jain@arm.com>
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <912c3126-8ba7-4c3a-b168-438f92e89217@arm.com>
 <2ab5f65c-b9dc-471c-9b61-70d765af285e@os.amperecomputing.com>
 <239d4e93-7ab6-4fc9-b907-7ca9d71f81fd@arm.com>
 <1141d96c-f785-48ee-a0f6-9ec658cc11c2@os.amperecomputing.com>
 <9cdb027c-27db-4195-825d-1d63bec1b69b@os.amperecomputing.com>
 <e3e6a3e0-3012-4d95-9236-4b4d57c7974c@arm.com>
 <0769dbcb-bd9e-4c36-b2c1-a624abaeb5ce@os.amperecomputing.com>
 <f31792bf-3b54-408c-9deb-7058a79c60d4@arm.com>
 <a27776ed-4b45-4269-9e3c-5ca1463e4841@os.amperecomputing.com>
 <bfae581e-3988-44b5-af5e-8e2de4db68ed@arm.com>
 <cc1522f8-85b9-48e5-951f-9a1bb2075918@os.amperecomputing.com>
 <e0960267-0dd5-412a-be54-1afaacc6bace@arm.com>
 <4b2278d8-d627-47af-ae90-9d62ad249c88@os.amperecomputing.com>
 <ca1673c4-1c8d-40d5-bc40-abc6489b2fdd@arm.com>
 <ce0ae0fd-3a9e-4cc2-8a60-f4ff434f3872@os.amperecomputing.com>
 <953c5369-ef91-4f86-924a-20f5788643fc@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <953c5369-ef91-4f86-924a-20f5788643fc@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:a03:333::8) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SA1PR01MB8621:EE_
X-MS-Office365-Filtering-Correlation-Id: d30b913a-f690-478b-07ed-08dda217c0a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1M2ak8zQ3MxSW15bjNGWDVYOWVDUXdSNDlFZlJydFhIVGVubHZqaVRJWGtn?=
 =?utf-8?B?MlV3UWZiNFV2eWhUVnBiSFdOR1NMdmljSURqSGlmWldtU0VMMExCcFdJdm5Y?=
 =?utf-8?B?VSt4RzlGNk01S0lZcGd2azZ4VEdjSmQ4OFk5U0pjeW5hNlpVdGpxcHRSTmFu?=
 =?utf-8?B?NjRXOGNyaUEzK1F1YnRrWEV1bU9OZXVIL1JuTDRYYWdseStmM1NwblVsbUNl?=
 =?utf-8?B?RmpOblZWSGxDQk9XUDNQcElRN1QrQWRRdFZZWWoyM0RISWV2eU96dHl0MUFM?=
 =?utf-8?B?U2w0Vi9peE5QbzIwZWo4QnIyd1Q5cjJZWkRSbW00TE9JdzJWZVJMcm1sZFB0?=
 =?utf-8?B?ajBTamxoUFB2NGFiNVFjN0xTUjhFVHpQR2ZhR0txVDVGbGNhUFcwVUMxZjRK?=
 =?utf-8?B?RGJxaG9vbHY4MW84NmFNL0c4VDJlRmRTdCtLUHBYVkRpaVpacEZ1aFVGMGc0?=
 =?utf-8?B?a2JaTWZxcEFZdWJhbDVVYWpJQzZFYmxaa0hzRTBCbzBFL1J5ZGhWSWZEWDdS?=
 =?utf-8?B?T3MxMkovaEZnTTFmaFJScjVCR3JWZkpuN2ZwVFpsVVBMTWlzSXpSc1h1THFT?=
 =?utf-8?B?ck5qR1grQzNaYktDcGhrOWpkNEZtSnhmTmdRTllPcnpBTXNLZWc5MXBXdWI0?=
 =?utf-8?B?R1NxenRuczJLTzFYaktaOGpqM2RPUlJhcVFKVXF1YUFJc0RsVmhNaEpuVUJi?=
 =?utf-8?B?SnpINlBmNXlCVXdZaWsrZ1g1MmZOUXdDY3VaQzVHbzdIcE1xVm43V1pGWWJu?=
 =?utf-8?B?VUlhZmZtV0xaaW04cXUra0ZOVmhjbERWbFE1UlhsNGloRCtuM3RRcWZtK0Ry?=
 =?utf-8?B?Lzh2YWUxY0V6ZHlzdXpuZnhhZXltTDFZNDc0Q1IrWWpsN2hnUWtPSzRmR1Bx?=
 =?utf-8?B?QTNnYjZrUllUby9Ec1VTUFFLNVdVN1NlbzlPSVUrekZBZlh2QUpUTHdMWTNm?=
 =?utf-8?B?bldGSDRZckFwUzllUWwrMFNXMmFHRk80RWhpWmRFYVJtY0dHNExKN2llbTJh?=
 =?utf-8?B?Ukd0OFBkUnRuUmhSR042NnRzSHJiMi81NGorMCs1d0RxZTFTN1NZaEtRU2to?=
 =?utf-8?B?OGszUXdnSC9zaGhVM2xGUEZjcnB6Z3dmUlFaMTdmeVZ5UEtielNtSGt1L2FY?=
 =?utf-8?B?ditEc3pHYkI5dzdjQkhXUkdWOUs3OGQyRVhxR0JFMzhJV0gwbGFsNkJxOVJU?=
 =?utf-8?B?bm01MXpwcERYNS9WeU1EM0pBUVh6Y2d0WElMMmJCZzNuTUp1di9LZXUzd2k4?=
 =?utf-8?B?OTJwY25xS1BFQ0x4SC92RVdTWkhwR0hsamRlWDBnVnJSbkluVU1lVCt6bjRL?=
 =?utf-8?B?RFdrYUZRM2xlZmVBL0w1SFhMMWlhM1E5ZjlKd1p0dk9JMlpqT0tybnVjSjJh?=
 =?utf-8?B?UlI3K0VHaEhYZURuMHRybkovRmtydWRYRDNKcnhrQS9mZjF4VEUyM0lWdXRr?=
 =?utf-8?B?Y0Q2bWJnS0tpb2hEZjJsNkV5U1pEUk5lUmNVTzVjdko4QXpQUGdKeEZmaUhi?=
 =?utf-8?B?RUlmSE9IbTdNK1NLc3owd3JZMVRnQlJkWlhEYlJrK0czOEhHMFhjMS85QlBz?=
 =?utf-8?B?RVMvTHd6REhocXI1WjN4SWJqb1NaK0RhT1VtWEYrYktpOEhPT0ZlenE5Z0N6?=
 =?utf-8?B?NEo5ckkvdnlEMGxOeG5YT0g5eFVDVzd5K1hSK2I2OTgyVlAzczV6d0Y1MTRl?=
 =?utf-8?B?NzJqeVhxVjhyQWRZZU1WVnJnSDYrWTRuNXB1YVcrcUVPUXBSdGpwME15UjJi?=
 =?utf-8?B?QzdVUXAxMkhDcnV5M2ppdVNBeDNVTndwQnJ1OTJlQzFFZ3hvOTFoZW5HYWNv?=
 =?utf-8?B?emU2b3pUaC9MZlVnZVR3OU1yTjBaR25KZnY3dENBNnVBMWExWUZPS09qYVF3?=
 =?utf-8?B?WGFvUHhNaUFnVURmaDd2MlRJSWQrTG1MTnJBTTF6bm00V2V5WEU4ZW15OVo1?=
 =?utf-8?Q?PJ711EToviY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXBQckdoZ3U5SGpueThkajkxYzF4WVpKQWhMNS9NMWY3Z2tlbE92R1Znc2ta?=
 =?utf-8?B?aSt4Y3E3c1lzeUtFaWdwVHRGMGVobmhZWTcvOFBJeFlWUDZJWVBGQkhIdDZq?=
 =?utf-8?B?Y29LZ21odktYQk1LUGV5WCtFYzlHYmE5TytVS3I3Mm92ZzlOUkkrV1dmbTZF?=
 =?utf-8?B?OFA3SjNUbzJPU3VubnFaUWVFWjdHd3VCSEEyWUZzTUhiSnVHd05La2xFRDll?=
 =?utf-8?B?ZFU1a3ZvQTBEQUZWL2UrNVNEVkVFdTZXVW5MaUtZR1NOZ1Jsa1hCaTZiTUFR?=
 =?utf-8?B?bWd5K2crN0ozamsrLzRYdmEzZklVdkwrenMwZy9VYmNZKzdZZ0pWQjRnbnpR?=
 =?utf-8?B?VEd0R256M0xoNnNjdVdEVHVBanMwWCtDN2psK0xMUWNrWWRBRTFJbXhnRThU?=
 =?utf-8?B?M0hQdVl1UTM2SXowTmlGZTNJUG1mRCtDVkJxbzdKY0V5U09sdnh2dkRUZ212?=
 =?utf-8?B?TWNFamk2bUhsZC9nS25YS3A1NTA2VFRwZkw3LzJJNDNKQmwzZ1d1K1M0SXhj?=
 =?utf-8?B?ajZrZVUvZEdGb3lxdlAvMlg4R0VNNWxSYlpYd3pDRmw0aWNjRGFkbjRhWEhz?=
 =?utf-8?B?d0ZQeGFDK1B4VjI0aUZUTjhtaFIva2RreW5SeEYvSW5sYTBYRndDZHZqenFK?=
 =?utf-8?B?SGkya3JSNkZGTE0wZFhOY2RiaWljUGZqTUEzK0tVaTBQY1hLSUFzbHNBck14?=
 =?utf-8?B?REhOZVhLQjRzT1p6SGVCS3FDaExIZmEyQTdkQkIwV2JsQm1IVi9IUWd3NkhJ?=
 =?utf-8?B?VWROc0hTelkwTWVkUkpBL05PazJ4Zlp0aFNiUUswVnp6dHVnTmF0RXh2aHRw?=
 =?utf-8?B?djhPdHZyQkNEdDJSU3I5b2sxTkV6VFoxVGx1YmFRS3VwSmFYckFIWGIycW5B?=
 =?utf-8?B?RzJQSDZ5bSt1RUVnL3VWSHVzTEx6Y1VHNC9jNDBVZFhreWo4WWk5ZEJHSFFv?=
 =?utf-8?B?KzhCWFFZa0pYMXZ5K0NmRTVCeVVwMndyNjNGYURsa0luZENjREo3RTNjL2cv?=
 =?utf-8?B?SHNVMWJSaitJcEtVYS9ZVDlpUlpmR3d0dTZqTzNjOTBsQk1obTJXQVpVTkwv?=
 =?utf-8?B?WjlTOW9lS2daYmp0SVFnNHZ4OGN6amFRcEo3bjlTQVpnNTVxVDFSRkE4UWNE?=
 =?utf-8?B?dVdLbjdwWko0V1pjN2lCa2Q5RHI1bk9TbDlKc0VHeHpJNmQydDhocjl6dzU3?=
 =?utf-8?B?RzJ6cFdialNJbmxsYVRqakc1ZEViSzFjL3dDQ0dVeWsrZkVYc3YyNHlwMnhM?=
 =?utf-8?B?dUsydjFYeEN4U0t0UXF3Ry9KdGE0RFYvbXRQbU92dTA1dzJtZm94TXoya2hC?=
 =?utf-8?B?Wjc4M3Q5TUNRYXoydVNuOVJ2MjVNeDE5QjRDeUtVWUNNVTIyRGdsVGxJMFBv?=
 =?utf-8?B?K1krNzNzRjdEeEFTVUdUY1paelFNc2UvMFdmNk0zQVM0eEJSaEhvTnhWdjht?=
 =?utf-8?B?QlEvQ3p5VlYzNUt1dy9qYUtNd1Byb1JhVmhrMm4rNS9FVWVvZEwxSDlwcVBZ?=
 =?utf-8?B?b1BQaVJvNlc3OW9pM3BkaXdMTjF5T0VKLzdTNWJtaWVLY3F2WHBzSFRjWm5V?=
 =?utf-8?B?REJxalRxOG11dGd5ekR3dXdST2JqV0kyUUJGUldVREVrM0xpRXBBQmV4VW1C?=
 =?utf-8?B?c1NkU0N6amFyZ1A5RDFBMFJLZzdvL3plQmM1OUQ3TW5GZzFKay8wTHNDb1Bi?=
 =?utf-8?B?NFVlVUlRb1Y4enpSRThtUStpRXpYVFV2OVRjcWJFL3U0T1lVQjdYd0VCcHEv?=
 =?utf-8?B?NS8yMzF2R2F2ZkxsN01ReFRHOFZVVDdyTXR1NHJzMTRLeTlCaVJoQlJvSi9J?=
 =?utf-8?B?VWtqQmhranlSRlNYL0RBZmM5cUN0YzFvMUFGVGFNeEsyd2ZVUGNjMHRiWDhB?=
 =?utf-8?B?dFF2Wi8wbWlwM0tqd0c3NUZmQm0wSS9jNXRhcC9ZZFY2cFdZdzVWTkNla2JZ?=
 =?utf-8?B?M1VBTDN4ZzZvTUJGUU1wRnM5bUladDVZWnhpMlkzR2ZnL2tHbHVtRk9iRTA5?=
 =?utf-8?B?cXpWbUl3MjFzaUNKczJZSnk2dFlEVUlVYzFQV2hSczl2R2ZXMTRjdnhzSlZo?=
 =?utf-8?B?emcxM0pGd0dhbnp3YndHbnVyR2xJUkgyMy82eC9UUnUwRHo5ektyL0x5cWd3?=
 =?utf-8?B?VjF4UWxZZFJZV0FtVHVyc1lGdEd6M0xSdEljeGg4TU5RbWpPalhkOUZWS3VC?=
 =?utf-8?Q?RBqTkZt89S4YlvDAK3Vv3Mw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d30b913a-f690-478b-07ed-08dda217c0a4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 20:55:05.9292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRnD9NrFJFEk/pFDZVzcViOv3LVnWIY7NdV61pFO5+FVq5uBReYsizu3FNA+9+ieg2qQ427x1b0lJTywBwWDn/z1G8OZXVugUKq1PDz1DvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB8621



On 6/2/25 3:47 AM, Ryan Roberts wrote:
> On 30/05/2025 18:18, Yang Shi wrote:
>>
>> On 5/30/25 12:59 AM, Ryan Roberts wrote:
>>> On 29/05/2025 21:52, Yang Shi wrote:
>>>>>>>>>> The split_mapping() guarantees keep block mapping if it is fully
>>>>>>>>>> contained in
>>>>>>>>>> the range between start and end, this is my series's responsibility. I
>>>>>>>>>> know
>>>>>>>>>> the
>>>>>>>>>> current code calls apply_to_page_range() to apply permission change and it
>>>>>>>>>> just
>>>>>>>>>> does it on PTE basis. So IIUC Dev's series will modify it or provide a new
>>>>>>>>>> API,
>>>>>>>>>> then __change_memory_common() will call it to change permission. There
>>>>>>>>>> should be
>>>>>>>>>> some overlap between mine and Dev's, but I don't see strong dependency.
>>>>>>>>> But if you have a block mapping in the region you are calling
>>>>>>>>> __change_memory_common() on, today that will fail because it can only
>>>>>>>>> handle
>>>>>>>>> page mappings.
>>>>>>>> IMHO letting __change_memory_common() manipulate on contiguous address
>>>>>>>> range is
>>>>>>>> another story and should be not a part of the split primitive.
>>>>>>> I 100% agree that it should not be part of the split primitive.
>>>>>>>
>>>>>>> But your series *depends* upon __change_memory_common() being able to change
>>>>>>> permissions on block mappings. Today it can only change permissions on page
>>>>>>> mappings.
>>>>>> I don't think split primitive depends on it. Changing permission on block
>>>>>> mappings is just the user of the new split primitive IMHO. We just have no
>>>>>> real
>>>>>> user right now.
>>>>> But your series introduces a real user; after your series, the linear map is
>>>>> block mapped.
>>>> The users of the split primitive are the permission changers, for example,
>>>> module, bpf, secret mem, etc.
>>> Ahh, perhaps this is the crux of our misunderstanding... In my model, the split
>>> primitive is called from __change_memory_common() (or from other appropriate
>>> functions in pageattr.c). It's an implementation detail for arm64 and is not
>>> exposed to common code. arm64 knows that it can split live mappings in a
>>> transparent way so it uses huge pages eagerly and splits on demand.
>>>
>>> I personally wouldn't want to be relying on the memory user knowing it needs to
>>> split the mappings...
>> We are actually on the same page...
>>
>> For example, when loading module, kernel currently does:
>>
>> vmalloc() // Allocate memory for module
>> module_enable_text_rox() // change permission to ROX for text section
>>      set_memory_x
>>          change_memory_common
>>              for every page in the vmalloc area
>>                  __change_memory_common(addr, PAGE_SIZE, ...) // page basis
>>                      split_mapping(addr, addr + PAGE_SIZE)
>>                      apply_to_page_range() // apply the new permission
>>
>> __change_memory_common() has to be called on page basis because we don't know
>> whether the pages for the vmalloc area are contiguous or not. So the split
>> primitive is called on page basis.
> Yes that makes sense for the case where we are setting permissions on a
> virtually contiguous region of vmalloc space; in that case we must set
> permissions on the linear map page-by-page. Agreed.
>
> I was thinking of the cases where we are changing the permissions on a virtually
> contiguous region of the *linear map*. Although looking again at the code, it
> seems there aren't as many places as I thought that actually do this. I think
> set_direct_map_valid_noflush() is the only one that will operate on multiple
> pages of the linear map at a time. But this single case means that you could end
> up wanting to change permissions on a large block mapping and therefore need
> Dev's work, right?

Yes, set_direct_map_valid_noflush() may be called on multiple pages. But 
this was introduced by Mike Rapport's "x86/module: use large ROX pages 
for text allocations" series. So just x86 supports it right now. Large 
execmem ROX cache is not supported on arm64 yet IIRC.

Thanks,
Yang


>
> Thanks,
> Ryan
>
>>
>> So we need do the below in order to keep large mapping:
>> check whether the vmalloc area is huge mapped (PMD/CONT PMD/CONT PTE) or not
>> if (it is huge mapped)
>>      __change_memory_common(addr, HUGE_SIZE, ...)
>>          split_mapping(addr, addr + HUGE_SIZE)
>>          change permission on (addr, addr + HUGE_SIZE)
>> else
>>      fallback to page basis
>>
>>
>> To have huge mapping for vmalloc, we need use vmalloc_huge() or the new
>> implementation proposed by you to allocate memory for module in the first place.
>> This is the "user" in my understanding.
>>
>> Thanks,
>> Yang
>>
>>


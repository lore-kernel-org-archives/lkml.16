Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89F524E4C3;
	Tue, 11 Feb 2025 16:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291672; cv=fail; b=aOQmNr9XrdBjreR0Dm1zFsHXiJZzXF6Hq2JXhU2hMAhKzfxpE9M6LnoNnkCNJTl2tl6vtdaLTHhb560b5COvN/qQM1VpDkVGIc8TMal40fJaAn39TbNL0gIthNN/cfR6xdxbqVqFCkoZeJwrDD+ut7W1m86p4E6aWy8xgzHgaH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291672; c=relaxed/simple;
	bh=NxEY3f0A0QLIxOt6eHLHftMV4cLwJ7rgncncTMBbJuY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t424I4WvpXSfRAycCPbqoxyVKG3aVnQXWZFaBM4G6FCYwPvNOCtH05dQe+r0vivjjzlzXovo7V2c6bAkKN7RixvzebmxKNnCdkwYpTNxmfsN0cFHmXCR+N8VfaixXeG0mhuiUeTNnaCecrhrYgUHiNSFwkp2U+BEFrbjNg72l68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=JSlxScVV; arc=fail smtp.client-ip=40.107.22.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="JSlxScVV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHwhPKVcoMyeMEs0KSXrq1SROBJPV19D2a2LbU9uzGqCNmycUatReEPTUA7+d8JO26baYt1x3wx5q4q1Pvn/NmWytxA28PXHHx9Mk8sz4x6q716/pTr+A/GplRrUvM8THOqThH3LWP6nZMYuXbs9V5HXnYCkg37eZ1x3jJUnO4azTaNaNuwiCra9VJ4KH1qpFDph+tIs6OuB+jtrQZNF6Pm8HnjcV1fEJdXXHZAg9DpAMK1xbhecWbWxcj+RPKTkbAvoB6jOPeCKqhPc0dAuxy6c1ioWXiLe6uE8F1gsK4KOuRlz7gR2OX6SQOkfwkdd5Z689k0UWLhjhNg5YUIV9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5oZvXXd39UbKKmo+voCHPhpKUB1k6iYY9OkvvxdUIM=;
 b=GZKbK8lXFGAnGGQxHipylrOO8+8QhTfWERcu6Ip2FLdPl+eQTzmt5Lpkb1rVv1ZSP93D+wpFhamb7OU1hGMs5uNbmxuD1hXpsNzkUeu6KM1e7sAljOJUHjfWKRMFniMSXSd9rZaUJz7XnqM4efk44d9eKJB8RrO/UgfF/k/+eOy88jq+qBMKrrfaUIty7M4GDKm4D59oB+ExpsdFl+x4HRZIFa2X+8onMC2Gb6J0IhoBBBtS2aZwaI5ujFWjEz/4QIJLpcWXSTp5OWZJKgsdlXtZH1MjreNoOxJAekCW111m1Ar0jsrbeP1TBW4iCQbkjSz3dj2GLvjR0pLa2jh41w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5oZvXXd39UbKKmo+voCHPhpKUB1k6iYY9OkvvxdUIM=;
 b=JSlxScVV6HB/zBT2WhahM/QDguMRhouUaWURnHqJVqpdSR5be68hvf2mzoBxebf6neoK2rDtpn5ByAyIMWkiIxSHqQdVslV6oUd39jYYluFfaIdYi7XxyvOLcegD7LQyUrJtJcsyzf/K2bS5hjaMJeB9j7Eo1RRfwYVeeM2vmac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10686.eurprd04.prod.outlook.com (2603:10a6:800:25d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 16:34:23 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 16:34:23 +0000
Message-ID: <9d6a7724-5380-407f-9308-1bd3e5083267@cherry.de>
Date: Tue, 11 Feb 2025 17:34:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] arm64: dts: rockchip: Split GPU OPPs of RK3588 and
 RK3588j
To: Alexey Charkov <alchark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Dragan Simic <dsimic@manjaro.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Chen-Yu Tsai <wens@kernel.org>, Diederik de Haas <didi.debian@cknow.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240617-rk-dts-additions-v5-0-c1f5f3267f1e@gmail.com>
 <20240617-rk-dts-additions-v5-8-c1f5f3267f1e@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240617-rk-dts-additions-v5-8-c1f5f3267f1e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0174.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::31) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10686:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a13c1e-d21d-4caa-3b70-08dd4ab9f12f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1JwQUxjTFV1YU4xWkU5aHBhQ2ppOUd0Z3hqRldGYXllcVZ6VDk2VytvbUVu?=
 =?utf-8?B?cWtvanVnS0xjeUlqT0NIQVdGRExwTHJISmdIZW1VQk8zZUE3RmhINTV0a0xB?=
 =?utf-8?B?VEt6bHRUSEpFMk5oSzVuU1MweDM4eGtPWnlZcE9nQ0owSUtQNXN1dTNEMlF2?=
 =?utf-8?B?bjlMWUJBN2E0SnpibHFOZTM4TmVHd2lrb0IzeDV0ZjFEblVPREpKSVhVcUl1?=
 =?utf-8?B?QU56NEFpZUc4a1VWbWFpWElhOTUveWQ0TVVqUkpBQjMrZElqU3I0OW5tZTVp?=
 =?utf-8?B?cWhrQ2Y4emVWdytIUDZSZFNDNVBHTHk1Uk5kMjBYMjRMZ0IxcW5uUGxZK3F4?=
 =?utf-8?B?WFRYZGk3UTl0Sm5ORGM4cTcwYVBsaDZBcUxtaXBqN3lnVUZqbDJScllyTXJE?=
 =?utf-8?B?YkxrcjZiVk9XcFpYSmw0U0czeDZURy9aSFZNL3c2bXpncFF2My9FWVhaamMr?=
 =?utf-8?B?MUlDaG1ZeVBuTGRnSGNyanI0YVFpRlMxMDh3b1VGOFltZmhYWmZBQ3pvbmp1?=
 =?utf-8?B?cU9VNndBTlRBbHRlT1pDOGZNRmNXRVZaWm5XVmljMTNGNUMyalJNdnlKSUFo?=
 =?utf-8?B?Z2tPemNkV3lqWTZsWUhoY0xVU2VXMitsSTlHeGVVTk5xZkxDaVQ3N3RVNVNH?=
 =?utf-8?B?Qy9JOWZ3RzJkeXZRRk15VzJMR2VYa0hDYkxrYkhLSDhEd0kvOUx3QWljUFhS?=
 =?utf-8?B?TlVmQk56WFNVdXA1ZzVzY0hSQll4MXh1Y1BheDdJOG9EYnFlWnNzK1c0ekl2?=
 =?utf-8?B?NENxY2FKa0t1WFg0anVjYnJLTllLbFI1K1JDcGM4RHhzK3FtUVlKMjN5Lzhi?=
 =?utf-8?B?NXpkNHA4K3ZiMCtoS0tZYXpnU3NqUGZXZDMreG1GZ1VNakY3Z1JpSFZBM01i?=
 =?utf-8?B?MVlNVzA1ZXpSd0I0UU0xSkJzVHJ1ZGo1bWRDbm9UV0xFL2xzV0FocXF1amJO?=
 =?utf-8?B?TDd5UlhYaFRMQ2dWVnhSdGVJczRjNjRJdmlOK0tSYVppY2ZQUzE3enhGYXVJ?=
 =?utf-8?B?dkpvUm5vcGZwZnZhOGtpcm5XbjJLOEpLWHJHRW1tM21pOUlkWURaSDRCRUo4?=
 =?utf-8?B?VkttQzF0U1NnakpGV1QzTSs5ZTBPNnFQb0prNDlhWHFJMDdkeUw2Tk9UY2Rw?=
 =?utf-8?B?SXI2c2JGbFZDanB2UTBuckVDbW1mQmF0bXpJQnl4WFBMbVJYeDRrQWtYbUlq?=
 =?utf-8?B?cHovd3hpMHRKcjRHbmJNeWRQdnNTWE1zeVUwTWJ2WUlvcHBZMzVpc0hTaDlS?=
 =?utf-8?B?QVRkVjh0eDJ4dDB2cE5KcWUzWEVVOS9MVXpjbU8zY3JqMi9lV3Y3NzRVTVBV?=
 =?utf-8?B?UFJpby9UdEJ1d3FWSitZTVBUcTZCMEsrNkZ5UVY4elprVEJOZWxpSkxrM3NR?=
 =?utf-8?B?UDQrcWZ4cFd2QmhyakxFK2hIQ3pia29uUXZ3ZlRxNGE5N0g2SXZiK09HQ1Iw?=
 =?utf-8?B?T2hPUy9XSFJPeE5YWDNCWWtLdjZYU280WWh1T1UxZkdSbjB1UWJXWEpyQ09W?=
 =?utf-8?B?UGUxY1lDYVJlOHVTN05xanh0V0tiNzdoL3RXQXNPSThSc2FvNy91aXd6VFpJ?=
 =?utf-8?B?OExLdnFSd1dDV1NCLzNZWWxFWnpOQk9xMmxjVzJJbXczTU15VEJHU2Qxc2Fr?=
 =?utf-8?B?M2IrVEwvREJvNkFFcmpRbEJZd3locUxFSTRvUjk4SzFKY28wNGxYeE5IQTBK?=
 =?utf-8?B?VTh0NFFYN2FUOVdNMHpqS1RBRTk2c2tHYjVHOU5NTkF4UkFNdEc1RkJOYjJw?=
 =?utf-8?B?U0pzcXJUOXQ2NTE3Y2cwMysxYnFKQ0sxclArbHJFVEtnYzloNXVUeXloZEYv?=
 =?utf-8?B?Zmlxa0ZwVHQxRXFsSGIwdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:nb;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXhWcHFsMHJuQjNCMnRnajQzQ2U1bEVRQmI0ZmxQeldSdXppS0ZCSkZpWHd6?=
 =?utf-8?B?bzJ1TkZnd1pLZHJUM2p3NUhYNHAzZmw0aDBLdnczNGJDaS9lS3E0alN1SzlK?=
 =?utf-8?B?ZVVBWFlPSkFobE0xTjFnTUJmb2V4azZhSlFScUNBcTFJMEZOT1lvWWQySXQz?=
 =?utf-8?B?ZXdJZ1hiVnhZazJ3S0tRaWw4eFdYYVZGYVg4NFlQeVNTdUZUVWYzN0hrbmJI?=
 =?utf-8?B?NXpydnZZS0k3bjE4MlpUWHBXYU56K0IwOEtiZS9jODRZRkJ0RjZuZWI4cTla?=
 =?utf-8?B?OHF0YUlaclZ4V0U5dzVPcEFMZkRUVTFDWEtSb2RwNlFrajIxcFJkZkVyQlA3?=
 =?utf-8?B?TG9YRkdUSHFxVE1JTkpTbTZUdHVCYnlXRUhMdzdVa1hjMXM3SGhKVG1OZ1N3?=
 =?utf-8?B?eTZkSU9Mc1E5MmlGZkptUDViSXJRZlF1MEZvRmVIQ1NhY1FsMWY2eUNQbFAr?=
 =?utf-8?B?MUtPbTdicUtHWm1KZXpSbXNRM3owbDE5QkIzL0NLaDdOTXZLTUFiL0l0TW5Z?=
 =?utf-8?B?YVFDc3N4WlRlcVliTVU5aGFYV0hjZTdWMmQrNFVESkM2V204TjRhR1FVUk56?=
 =?utf-8?B?S29zNWpzR0orcXU1Z1pXVnZPb1JlcnJJRjFlRHcrNnlud0hXV3YwY3pnZHNk?=
 =?utf-8?B?a0VRZ3ZxNEx1cXJFL1ZzYVNqVlliMDVueEtMZWM4SEpIazdoeHBVR1dOYTdH?=
 =?utf-8?B?d3dXejI4dFRoTGloLy8zcFl4OWJjMTlmZ2MrWWQ1TGdJRmp5ZVJGR2VsYlhu?=
 =?utf-8?B?QkpLZ1JFMkFSbXBTTGVEQnlpMlp2cHh5d2ZLbEtqeFVFK3NPRVRmYkNFWHpD?=
 =?utf-8?B?OXhaTDc2WVJYSFFVZTFVUEpoTjNMUXNXQkJHOWo2WGFVL3JEakJ6TjV2eUVx?=
 =?utf-8?B?U2NHaVNKUmFDSmZXelpKWStPOGVGQnhmMi9kNkpuZ2NkcHV0S0VORm5GaUtX?=
 =?utf-8?B?d2Z2ZWFKSDBISTlMTWQ4aGgwekpBS1o2VjQ4TWQrOFlYdHNHVU1JdFAxc2k1?=
 =?utf-8?B?LzRqOVpvQjBEcWNkUnVhcXBnYjFNQkp0QjUxWFJLRXB6WkQwZ3JCa3lwRms3?=
 =?utf-8?B?RzMxTkQxNXRPNmZ5eTBwYTZJRmdTeWFmSjJwdDEzWFYzZXF0TmtpUXliNnVn?=
 =?utf-8?B?ZkZZdDI5TmwzZjdtL0VVQ2V0UjRqQ2NKOXNjcEVZdDd0WERYQlZrWi94MHox?=
 =?utf-8?B?c2g5MzBlWXZoQm1pMjNuMzRQWG1WYVYySHplMFpUM0RQa2NiU2FZWEQramE2?=
 =?utf-8?B?a2lsa1R1cUhJL05vWmlMejFTWmczSlhvUnptenAvTHIwbUlPcFF5dDhHZ0R3?=
 =?utf-8?B?WGx3cHkva2txV0EvMldMTURPYnhCYVI1QmdtT1l2dFRXaWxJWkF4Y1Q0Z051?=
 =?utf-8?B?SHlmQ3Y1QmRLTzU2VHBjNEdMRGh4NXBmdXpudHNSbGNxR09OaTh3R2dXNzJT?=
 =?utf-8?B?VEUyL1BXRERGQzBKYkQrWitUa2JzQUZhanEyMnhMdC93amFacitKSENpSXVi?=
 =?utf-8?B?UlM1V0M3OUZyY0ZFN0hNYkRYdnEvbFlqbTNETE4wUG81TFBXSG5haWpxYUhH?=
 =?utf-8?B?NHpiZGhNQmNlWmdYQmxlZ1RFZWVXdU45ZkROcURyNVVna05sVFk4VDFsb29p?=
 =?utf-8?B?bVp0ZnVHWlVPWmJKVW1SV1F6OUFGZ2xTaGtSV2VXN2xxYjZHVUhRaFNJRE5W?=
 =?utf-8?B?OWg0Nk53c28rTkN6M0JGd0c0dDRzNExiRWtDY1FrbmJhSjNTQjJORTBoWlFN?=
 =?utf-8?B?TjFWd0R4QlFaL3BVVGhXMHJhSE5OWjdqekI1QUpwQkc3R1RXd09NSGhuOWlV?=
 =?utf-8?B?VFVHemNieGt1Uytaek5nVmZ6NlV6RjRpL09JNnpham5oeURsZEVJNkluM2Nh?=
 =?utf-8?B?WlB2VmY5QmM3a3g5bjF3Q0I3RWNSWXJzclNsc0YzQmRqNVp2ektuY0pUelht?=
 =?utf-8?B?bm5lOVo1ZDRydnhZWE15UElpL0dZNk1oQTR0NDArMnE3USsvMnk4cUkvNHBw?=
 =?utf-8?B?VmltbVhlUmNVTldCMXRxMWdLczM1VVdXWVV0bmpJTGt2bnZReXR3U1NWNm5m?=
 =?utf-8?B?VkJlWmlJSlpsK1B3Q0JuT0NuNnI3WEl0SFpwejZoUGdKRExMUXdBRGdDV2pJ?=
 =?utf-8?B?UzdyNXcwclJ1R2RCZlJKMi9Xa2k2dEVJeEZZSUJ4cm1mOWoxbHhmU1JZT1g2?=
 =?utf-8?Q?c3HRMQeEw1VnaZYaOOO8+rc=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a13c1e-d21d-4caa-3b70-08dd4ab9f12f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 16:34:23.3556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MvlI6h6svGlos07Vq7fkOXygHFpz3doCi8Fa4ecdbNrQzoQAu1bU18EjPcZYUw0kouZTvkjJ7hm+Zy+7zEvV0v9/v4TJ6+4SRlI/0BDF04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10686

Hi all,

On 6/17/24 8:28 PM, Alexey Charkov wrote:
> RK3588j uses a different set of OPPs for its GPU, both in terms of
> allowed frequencies and in terms of voltages.
> 
> Move the GPU OPPs table into per-variant .dtsi files to accommodate
> for this difference.
> 
> The table for RK3588j is adapted from Rockchip downstream sources [1],
> while RK3588 one is moved verbatim into the per-variant .dtsi file.
> The values provided for RK3588 in the downstream sources match those
> in the original commit.
> 
> [1] https://github.com/rockchip-linux/kernel/blob/604cec4004abe5a96c734f2fab7b74809d2d742f/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> 
> Fixes: 6fca4edb93d3 ("arm64: dts: rockchip: Add rk3588 GPU node")
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 38 -------------------------
>   arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi  | 41 +++++++++++++++++++++++++++
>   arch/arm64/boot/dts/rockchip/rk3588j.dtsi     | 33 +++++++++++++++++++++
>   3 files changed, 74 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index 758aff5e040b..3d918874aa02 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -451,46 +451,8 @@ gpu: gpu@fb000000 {
>   			     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH 0>,
>   			     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH 0>;
>   		interrupt-names = "job", "mmu", "gpu";
> -		operating-points-v2 = <&gpu_opp_table>;
>   		power-domains = <&power RK3588_PD_GPU>;
>   		status = "disabled";
> -
> -		gpu_opp_table: opp-table {
> -			compatible = "operating-points-v2";
> -
> -			opp-300000000 {
> -				opp-hz = /bits/ 64 <300000000>;
> -				opp-microvolt = <675000 675000 850000>;
> -			};
> -			opp-400000000 {
> -				opp-hz = /bits/ 64 <400000000>;
> -				opp-microvolt = <675000 675000 850000>;
> -			};
> -			opp-500000000 {
> -				opp-hz = /bits/ 64 <500000000>;
> -				opp-microvolt = <675000 675000 850000>;
> -			};
> -			opp-600000000 {
> -				opp-hz = /bits/ 64 <600000000>;
> -				opp-microvolt = <675000 675000 850000>;
> -			};
> -			opp-700000000 {
> -				opp-hz = /bits/ 64 <700000000>;
> -				opp-microvolt = <700000 700000 850000>;
> -			};
> -			opp-800000000 {
> -				opp-hz = /bits/ 64 <800000000>;
> -				opp-microvolt = <750000 750000 850000>;
> -			};
> -			opp-900000000 {
> -				opp-hz = /bits/ 64 <900000000>;
> -				opp-microvolt = <800000 800000 850000>;
> -			};
> -			opp-1000000000 {
> -				opp-hz = /bits/ 64 <1000000000>;
> -				opp-microvolt = <850000 850000 850000>;
> -			};
> -		};
>   	};
>   
>   	usb_host0_xhci: usb@fc000000 {
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
> index 35bbc3c2134f..0f1a77697351 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
> @@ -114,6 +114,43 @@ opp-2400000000 {
>   			clock-latency-ns = <40000>;
>   		};
>   	};
> +
> +	gpu_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000>;
> +			opp-microvolt = <675000 675000 850000>;
> +		};
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
> +			opp-microvolt = <675000 675000 850000>;
> +		};
> +		opp-500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			opp-microvolt = <675000 675000 850000>;
> +		};
> +		opp-600000000 {
> +			opp-hz = /bits/ 64 <600000000>;
> +			opp-microvolt = <675000 675000 850000>;
> +		};
> +		opp-700000000 {
> +			opp-hz = /bits/ 64 <700000000>;
> +			opp-microvolt = <700000 700000 850000>;
> +		};
> +		opp-800000000 {
> +			opp-hz = /bits/ 64 <800000000>;
> +			opp-microvolt = <750000 750000 850000>;
> +		};
> +		opp-900000000 {
> +			opp-hz = /bits/ 64 <900000000>;
> +			opp-microvolt = <800000 800000 850000>;
> +		};
> +		opp-1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <850000 850000 850000>;
> +		};
> +	};
>   };
>   
>   &cpu_b0 {
> @@ -147,3 +184,7 @@ &cpu_l2 {
>   &cpu_l3 {
>   	operating-points-v2 = <&cluster0_opp_table>;
>   };
> +
> +&gpu {
> +	operating-points-v2 = <&gpu_opp_table>;
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
> index b7e69553857b..bce72bac4503 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
> @@ -80,6 +80,35 @@ opp-2016000000 {
>   			clock-latency-ns = <40000>;
>   		};
>   	};
> +
> +	gpu_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000>;
> +			opp-microvolt = <750000 750000 850000>;
> +		};
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
> +			opp-microvolt = <750000 750000 850000>;
> +		};
> +		opp-500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			opp-microvolt = <750000 750000 850000>;
> +		};
> +		opp-600000000 {
> +			opp-hz = /bits/ 64 <600000000>;
> +			opp-microvolt = <750000 750000 850000>;
> +		};
> +		opp-700000000 {
> +			opp-hz = /bits/ 64 <700000000>;
> +			opp-microvolt = <750000 750000 850000>;
> +		};
> +		opp-850000000 {
> +			opp-hz = /bits/ 64 <800000000>;
> +			opp-microvolt = <787500 787500 850000>;
> +		};

Same remark as for the CPU OPPs, here Rockchip removes opp-850000000 for 
the GPU OPPs on RK3588J.

Cheers,
Quentin

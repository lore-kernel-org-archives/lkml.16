Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2107.outbound.protection.outlook.com [40.107.104.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B42502BE;
	Tue,  6 May 2025 15:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546106; cv=fail; b=o+oAYO/1Rl/XWKYhCqxiJF9mVUdZPeQaKmPiFqjDNwo1ZmrpPcD02f3CeiRDwZTkec6Fyj7zpZqumoZc6/Z2ymWqLwhXwZodWKlUO9hX8JyofPXQGoGI8bSaP+5vDzm7YbQCi2zynlZpJPcY19EQM4W/bRUhU7b57aY8kO8NKpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546106; c=relaxed/simple;
	bh=XEcAcZr/5ad7o0jOtAtpGoLhyxcpvYPs4Of6f5O/jaM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h3IjyhX35PocdRayfBOgazJ0vHUI/N/YqZoeO5imIm2qAO1mAJovLSFbxHyDg2zfigYzrUhlIWB3wDv1jSYhfrZtheNcp0iuY4zN3dfX4aQqd0yebLpIzaF7ua+ZARQNf7WMV58jj9+0Wx/f7CBKzUZJIX16MHwFaHqu0LOsHvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=Z6DYY9Ii; arc=fail smtp.client-ip=40.107.104.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="Z6DYY9Ii"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtJyjnKYUQdXwFDSGEZAr9XCeIwf9DmYILP1AjQwB4rrZ2Mbmvinekx3A2xpqJZYFUyAc13mZ1veW6MSB+BpcZ9nlwAJTRXU+/VzUJ1UTnHL/JBMou3oScTJqXY/I5vZGQG4hSd1ZF7o8182wkjeIFz2PtUscBTvxngFr+p+IQiS4n/ZdhyTQr5salxqhV3ma6EICOgfYdcBdY6FGJ/ek9AHq6fft6NZKN3Ag1fjY8w2TUOzADVkuusri/ogsRNkiacWyGwrB5SQMNBGD31A7TP79OcliC3qc8O0q2VHJZTRSi5f694AEXVuR/j+1XZBAUjo6WsLPOBP98UKyryNYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAEM3kP4d05O19mZs3wv/jpZoOBvY3WYgNigi2Ad+7w=;
 b=DPJwIvtfqE7nC0OO1BwjGD/o9jrrd8CfKwJRBmW2rJY1u4/lpYIRp0nkcl+fk5jax1Lb9Qe1zxssovh3Zi8J89dynTOZoZb9VhcuI/7LlgpscwCc1z4rPOhbRujDGUaUewfiGNSx+xHqaJEapOORqVEbr0oU1qzStflJ82EaUI+taM+BXO9GwgvIPx/y1exlZZkgsM5Mhc85TzkMUnS08uw6ub7dIcBRLbCXNyonuRYSV2Npzo5qu6jXVCJrbDBeEt5HE/IQ/iTmXwwWe6RSpJz5NXt9oXHwxUY9EyyYJX6/XBxeCsZvmmXHl9YazPMTLPI8GCqZIAc/+FpS/dUccA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAEM3kP4d05O19mZs3wv/jpZoOBvY3WYgNigi2Ad+7w=;
 b=Z6DYY9Iitb9L3Fjj3A1f759gNPJijXnD7YaxsSnk4+ux8MMGbnCV/i1m1sXBAuniZqBjb5H4xwN+58Je+83oStFNYZAvlbNklaChOoPmfWRqkX8tRwvDiN49waFoOnN0dGbApjkJqciuaIHl+ZUfRf9zz8e12k0B9snce96nkePG8b58o3+X7iaE3RgSiBZ9vwZJ5l5ArTo222EK4cYLGU/M8Py+tEIuo8NxqqKrODNDY+sWPC3yGA6m/5U8KxJzu2qfgd27e4T4Mq7w5qVQ/EpAW/GsAwbvzV/xj+G1E8xAJX4x9DMFqyFKSbyML3KxIEiw9hhhZjrELHglEC9J6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by DU2P195MB2346.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:495::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 15:41:40 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 15:41:40 +0000
Message-ID: <eca138f3-1ae6-49e6-ac36-3302fe867950@phytec.de>
Date: Tue, 6 May 2025 18:41:38 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: ti: k3-am62a-phycore-som: Enable
 Co-processors
To: Daniel Schultz <d.schultz@phytec.de>, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: upstream@lists.phytec.de
References: <20250506133604.294920-1-d.schultz@phytec.de>
 <20250506133604.294920-3-d.schultz@phytec.de>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <20250506133604.294920-3-d.schultz@phytec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::23) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|DU2P195MB2346:EE_
X-MS-Office365-Filtering-Correlation-Id: e0086d3f-58a8-4f40-91ae-08dd8cb47e75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzRyMEhEWWJBbC9oUkNOUUZZWU1ZQjNqd0Y3Y1RFNlVtZ0V4dmFEeTg1NTY0?=
 =?utf-8?B?Tmw2M2FvbjIrSzVRcG5EaWYrREtjZVVlWk1tWUR6bGxFNnBLNGF0Ny9aRGVP?=
 =?utf-8?B?NGlvY1R5cTZTNGNEREhxOGJPVHp2VjczaG4rQnJzT2tkWEIxeTJYcnRFYVpw?=
 =?utf-8?B?OHRUUEhYcG5LMTlLbzdTK0pxU3VQUlVQMkdHUXFrYmRFeWJwY1JhSHc0dzU4?=
 =?utf-8?B?YW8ra2E5TlZEdENEWEZUZjFqTzY4WDJQU3NFZHRBQkkyYzIxQXJiNnREa2J4?=
 =?utf-8?B?VXd4bFZwQ2VmSnBDTUJTSVhiQzJTWEZGQzRkTFpyMnNVMFNFaVB6aWo4SGlS?=
 =?utf-8?B?d0laNmtLTEhtYXdINVJrM1IzUnpFa3VpRDJZNCtLM3V0MVpLSExBd0gxcDdT?=
 =?utf-8?B?SnJPOWZRN2pZaFNsZ2o4V3Q0blY4czl5TGxMY0pQZFpPUG11Uk15a1ZiVDFu?=
 =?utf-8?B?L3hLS0lXT1Evc2FBc3NkaHI1c09Ka0N3RFBMRUVFQ0Q4bFdMSFpHWjk1Tjds?=
 =?utf-8?B?WE1SK1N3ZnREc1JmR1B6eVRRb1hIbXlRWXNidEJRU1FNV3FtaWNlV0wvcTRZ?=
 =?utf-8?B?RmRFd082UDcrS05nNzk0TEZFd1hnZzl0ZXlWbUVNQS9aa2l2NExqOEtpTFNt?=
 =?utf-8?B?bXZiQmFqc3pTeFlEajRTc2crRnVZVEtlK09LQVorejN6WGV6OFVwcFU1b2xh?=
 =?utf-8?B?cmVoNzN1QjZqaStRdXNvTVU1WUpsYUJtR1d1cFBFdVZGYytLVDBhTDhEOTF3?=
 =?utf-8?B?SFZtVVlyeWgzZVNaWmcxUW5tTTJBbGpoVG5xZlEvM0VaSVc3TGh3V211Ulc2?=
 =?utf-8?B?b2QwbzdHdllCeEV0bDl0SnZNSFAxN0djRDNubVFUK0p0dCtYaHZYckpVbXdW?=
 =?utf-8?B?N1Yva09EeTk0Z2NpK3UzQk9hbXBaQlIvOFZIOHdUVS9sbkFYdU9yYWl2SVpa?=
 =?utf-8?B?dEEzNjcwMWhvNkV5RkhSKzNvSGg5bkh6M00wSXdQM1VNdkt5Vi9YMDZFZENw?=
 =?utf-8?B?Yk5jTlVMMWlEK3NzR0VtZDJlK3lVVEFhSkY3NXhpM1p1SzZUYkVGb3NadS9G?=
 =?utf-8?B?QVlpMmtIR2dEakVjL2lxa2FmdWhnRXJJQkhUQ05zd3lqNGtlNi93bUY2ZXJC?=
 =?utf-8?B?cW5CYnJ0YURaRjRxQXVpUXY4c2NhU3UzWEY4cmJJZm42UjFIRHA1WWx1M2JN?=
 =?utf-8?B?OGgwN3pjV2YyaGZnWWJPMXFwQlF2SXFxTStPVXhFZDVlZkxhNW9hUHBaUENH?=
 =?utf-8?B?UVoxUU9hSlZuUHg3S1gzRVhpSEM4REZtaTF0dlNGRFRmSmMzV01ZNlgrSWhL?=
 =?utf-8?B?YXR6NllaZVpMWFdENlZJQVBSSXVpZ25PekZvTVpEeWVKbk1UTCt2TmVXVzdN?=
 =?utf-8?B?Y0w1WUg4ZTRjbFlXbFVPUGRYbEV1c0N6OHpackZsbkUwV1Ewb1BuNXExYWt4?=
 =?utf-8?B?d3ptUG1sUEdKZDQrV25iQTRvZXU1OXUzNFlNakJVWmd6ckRzWm5jL2lvd0lw?=
 =?utf-8?B?RkhiRWFPZzVwMG1uRlVKeHNDZnFGMFUrOVNoeUpTVWxWejYzTkcwVWFzNEZU?=
 =?utf-8?B?eU03SGxXaEd5c0hTbzk1TmV4L09yT3Z1d0RjTXVEVlVua1lHR283YUplNWJC?=
 =?utf-8?B?eG1mV3JFVUZoWXhBMVQrS3RnMVhRbUR3Z25JNEFTQ3dpK3Jsc1ptWHZ0dW5a?=
 =?utf-8?B?YkRIbGo2WGltS0Q4VVFzZ3RWUmdTcTcwOTRhUGd0RG81VDZNREN3MU80V0pB?=
 =?utf-8?B?dm9NbXliQVJGaXdOQVVjR3l0QWx2ai93RUgzS0lNR0dZMEhqUGhDMndLaWJD?=
 =?utf-8?B?aXN1eDlZcmE3MzBGWlFsaDJTZTJMaXJ4TW5Bd25INDhPblMxL0tUTS9nRk9E?=
 =?utf-8?B?SnlxSy9CQkQ5VnlWTXFDQVkwamN3M0tnMnV3MDhZUmVDV1FyUTN1akg3K05R?=
 =?utf-8?B?cEg4WTQxSmZ0YkVDU0padWRmTkk5SHVnWGpWOThkK2wwQ3F5M0xzN0lzYSt5?=
 =?utf-8?B?OENhTE5EWnVRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHZjaEtNdmx4bGlyREI0endhN3F0UWdWTVovSUVVaFdndEQyS0M2OTJWOTJX?=
 =?utf-8?B?dHJDdkpQSjJsZkVwbTl5RkR0MytFN3JQOGpUcmdUWjZUS3M2eThpUUpGR0ww?=
 =?utf-8?B?YmpoM1htejY1R25uMTFnaFVVOUNBSXRHYnJybmpVaGdwWGJkb1pQNDFsRnMr?=
 =?utf-8?B?RkpMT1dydWt4VkNBM09LSnlqNW40YUtOdm1BYlBySGJyQml6a0lCd0RuM0RG?=
 =?utf-8?B?VHZ2dDEwb1V2TmVzUlV5YzRMVDd2ZGxXa1NjZnplVVB3VWdHZkEvNW03ZzBz?=
 =?utf-8?B?MGtrbXdiK2JiS1dKeWZzSHlKUFRZQzZPYm9kZmtpNmlTU0V6VTliL0JyWlls?=
 =?utf-8?B?ZmFEM0tuSUdpeXJ1TG5Jd0Rid2p3Z2EveFNKejVYbmxDRzNtSzM2d0dKR3BT?=
 =?utf-8?B?NEt4Rm1oQWFFdktIUzhZaGNENEdMZVRzc25qaWhLRjVtTVVubktHaVNjMzRP?=
 =?utf-8?B?RldOTWlOeHh2S0pDd0g4dkVlcVJzZ1J2SU5Xd0Q4UmVMMk1nNCtUS2VWRUpz?=
 =?utf-8?B?NnZKcXNNcjdDaEpHWUZXejZ0VVVhV3VQVFVCT0ZZakJoWHduTUhxYmNpYjlz?=
 =?utf-8?B?bTJjcTJLM0s1VXNYanBzbVJZclg0NVJ6bTFmU3ZDQjZYV1VhRysrdXRBN0pv?=
 =?utf-8?B?V0NGbWNLdzFlanJOWkwwSDdtS0o1N280VUFmWjlSUERKdllJODN5MGdXb3lX?=
 =?utf-8?B?YW5rcSsyOGMzZXlIaXFocmVMZHFVdHJXZlBYa1lYQmJ2ZTBXQzVpeko4Nmpz?=
 =?utf-8?B?b3NFWjVCQmJzKzhha1lVSG8xaWZleDU5aGk2ckJYcEk4K1dIcU5qTGtQNHhT?=
 =?utf-8?B?aVc3RW1hVkRxbk5LNVNrTENwa3N6NFJTWlFzUW1MaU1Qb1dvMDhicUIwUTVm?=
 =?utf-8?B?WjhSRnB6SlJVeEZqOUFrMENkT2IrbjZqcjNvUjVjdUZsTG1PWUcxMyt6NnJL?=
 =?utf-8?B?RzluekkyTWRlbWRhNVc5NUcrWnFrYkdHV1l1TkpFd2pDKzBqZDByQ3NDOGxH?=
 =?utf-8?B?aXFPbjRpVVJGbi9VMmVlY1hMdGRQOWZRenVXVTNlbHR6dVlDTXdxKzYxSm9V?=
 =?utf-8?B?RkFvSVVERWRQMklZMlFGdEQwZDJDdlhwNXM5Qm85ckRxM0dkUmh1Tmtna29i?=
 =?utf-8?B?ZFA0ZTI0bUJHbExnS3ZFRklyN1UwL2ZSaEVQQ0VFWk13RkR3TXNEczVMWnVJ?=
 =?utf-8?B?RFRaR1lkK1ZFbmRJMTlndk5sR1ZHS2dlVmk5SmUwNXNvT2tvRVVRaXZBeUVM?=
 =?utf-8?B?WEZNZFNDanVCZWdpOFN1VWFOMEYxUXNlV3ljc21CeFMwWURnVGxLYVcwNkpE?=
 =?utf-8?B?UlZvT3VzZ3hBYnpwMzJPNWJMeUh6WHkzOU91ejRZOUJrNnd2dGQ0WlVpRW9m?=
 =?utf-8?B?Y0o4NW9BSzIyUG1OaGY1WmFkYTFWZFVTY2pNY2VIR0M2UHkrU2pHU3BiMWs0?=
 =?utf-8?B?eVV0RCtzWmQ3dkJoRFN1dU5CcWo5UzhLRHpMcjNwNHNua3VoRndnbG9kNzhO?=
 =?utf-8?B?bTNwKzhDc2JKR2xyZ0l3USs3SWFmeFBGQm9OQXhYY0EvQnN4MFdmYkNlZDdC?=
 =?utf-8?B?U1E4cGxrNGlJbkxMakFxcjM1QnRKU2YySUEzTWJLNUtQNkc3czRpQURyVWdo?=
 =?utf-8?B?WTg3cTcrNHlQd0tISnVoU01QS0RZVmdyM0JHS2lPMjIrM2FiMmFoYjd6cUVY?=
 =?utf-8?B?QVNBOVBmcnk4QU5GVXp6NDFWRm0yWUZWbzA2Q29oaWltb1k4dmJ3VGU3blRo?=
 =?utf-8?B?MkRHRjVFdXdsc29hQ0JtditKcFhZbXNKVjhQMWdNbEUvSk9WdFR1OG9IWUor?=
 =?utf-8?B?Sk9GeUNqVXd2N1VKSUNuek5aeUZ6cDdsTUZpeXF0b3hrYXFLNHY0TE1Ocnh0?=
 =?utf-8?B?dTVQZlFrbFJwZk8yNjZUNVFGZWJtcVR1K3RlMkhjTEhzN2VZNGdncWxXS2JV?=
 =?utf-8?B?MTBINmo4UzVaekhHM1czVno3Q09ERzhpeWZGZmkxdkUxZlVvdHRBbU1ldzhl?=
 =?utf-8?B?cGFPME5rT2x2M2UxY0N0cVBYem02czdHVkw2YWRZWXlNdGloQnFBL2JFUXg0?=
 =?utf-8?B?anducGxJMzZzT0ZqS1dxaFpjV05WUUNCMnMwNkE0SDVFazRna3BDZHVSNGY4?=
 =?utf-8?Q?Cfg66/RpfwWnGmol07TTUNO06?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e0086d3f-58a8-4f40-91ae-08dd8cb47e75
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 15:41:40.1745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tFMLrQBTxbhRjW2YDU1m73uZyCavje0KvJrCY1W10uEbcZPx6RpdY+SKoZTP424TmFw61eH2xxFIkteOpefYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P195MB2346

Am 06.05.25 um 16:36 schrieb Daniel Schultz:
> For every remote processor, set up dedicated memory regions and
> associate the required mailbox channels. Allocate two memory areas
> per remote core: one 1MB region for vring shared buffers, and
> another for external memory used by the remote processor for its
> resource table and trace buffer.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>   .../boot/dts/ti/k3-am62a-phycore-som.dtsi     | 96 +++++++++++++++++--
>   1 file changed, 90 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> index 147d56b87984..049aa358e796 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> @@ -59,6 +59,42 @@ linux,cma {
>   			linux,cma-default;
>   		};
>   
> +		c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x99800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		c7x_0_memory_region: c7x-memory@99900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x99900000 0x00 0xf00000>;

Just checked the origin of this for the am62a7-sk, which is 
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=10.01.10&id=a82cef91b301e3a03a4efe0f49e6cb8cf50f43af

The size for the c7x-memory is 0x01f00000 and not 0xf00000

> +			no-map;
> +		};
> +
> +		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {

which is relevant because your next reserved memory area starts at 
0x9b800000 (would be fine with a size of 0x1f00000). If you really want 
to have a size of 0xf00000, your next block should start at 9A800000.

Can you please double check and use the free memory inbetween if 
0xf00000 is correct.

> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b900000 0x00 0xf00000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c900000 0x00 0xf00000>;
> +			no-map;
> +		};
> +
>   		secure_tfa_ddr: tfa@9e780000 {
>   			reg = <0x00 0x9e780000 0x00 0x80000>;
>   			alignment = <0x1000>;
> @@ -70,12 +106,6 @@ secure_ddr: optee@9e800000 {
>   			alignment = <0x1000>;
>   			no-map;
>   		};
> -
> -		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0x01e00000>;
> -			no-map;
> -		};
>   	};
>   
>   	vcc_5v0_som: regulator-vcc-5v0-som {
> @@ -170,6 +200,13 @@ AM62AX_IOPAD(0x1f4, PIN_INPUT, 0) /* (D16) EXTINTn */
>   	};
>   };
>   
> +&c7x_0 {
> +	mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
> +	memory-region = <&c7x_0_dma_memory_region>,
> +			<&c7x_0_memory_region>;
> +	status = "okay";
> +};
> +
>   &cpsw3g {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_rgmii1_pins_default>;
> @@ -200,6 +237,33 @@ &fss {
>   	status = "okay";
>   };
>   
> +&mailbox0_cluster0 {
> +	status = "okay";
> +
> +	mbox_r5_0: mbox-r5-0 {
> +		ti,mbox-rx = <0 0 0>;
> +		ti,mbox-tx = <1 0 0>;
> +	};
> +};
> +
> +&mailbox0_cluster1 {
> +	status = "okay";
> +
> +	mbox_c7x_0: mbox-c7x-0 {
> +		ti,mbox-rx = <0 0 0>;
> +		ti,mbox-tx = <1 0 0>;
> +	};
> +};
> +
> +&mailbox0_cluster2 {
> +	status = "okay";
> +
> +	mbox_mcu_r5_0: mbox-mcu-r5-0 {
> +		ti,mbox-rx = <0 0 0>;
> +		ti,mbox-tx = <1 0 0>;
> +	};
> +};
> +
>   &main_i2c0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_i2c0_pins_default>;
> @@ -315,6 +379,16 @@ &main_pktdma {
>   	bootph-all;
>   };
>   
> +&mcu_r5fss0 {
> +	status = "okay";
> +};
> +
> +&mcu_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
> +	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
> +			<&mcu_r5fss0_core0_memory_region>;
> +};
> +
>   &ospi0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&ospi0_pins_default>;
> @@ -343,3 +417,13 @@ &sdhci0 {
>   	bootph-all;
>   	status = "okay";
>   };
> +
> +&wkup_r5fss0 {
> +	status = "okay";
> +};
> +
> +&wkup_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
> +	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> +			<&wkup_r5fss0_core0_memory_region>;
> +};


Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7A7647;
	Sat,  7 Jun 2025 00:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749254775; cv=fail; b=FF+jMDzfBR/zunXp3LH74ErAv2Ws88s88x/Xv+R30gy6Yarcu5/NC++gmhg7yTqONIDIkL5ZlZp1MssuL/8XLirTlmPzn5V3RSZRetikM0zn7RBo3cqgeFCN5Ye6wAbnxor8M9koJpRIpkxMnegDuAuA0N2v3jWdJerW6Xc9iqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749254775; c=relaxed/simple;
	bh=dlskv5/x7sWmFpwf43j8PjHJG4NssZPxYAHMo8LzBxQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tKX2yIVAyoOl0SKVFPnuWM9vNZ3fEpmJrtoIaxd8Dh+Euz4OnK81kiKVbeLOXwo32KyWXIv1r705Eq8sZqZh8EBrZ/TqB9xyIiZ4IMp1lE55TbQ1GdS56lZRkCP6LMVMsqijTgy1QuFZyrWovVDRmBIVVf1VjSC+2ILxYv1xjAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LN+JswTH; arc=fail smtp.client-ip=40.107.237.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LN+JswTH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqBSmBli+Nyi+sMtW5HNVw87w9yCvX7hNaEI4BB+AQMt5b7e9Fr7YfAGrdquIe7LUBq0S4UKtiRwnhDUip2xWEQoLTbom8lDDE3w01DaVox4wElqLzTkbxGCjPEhjDhLBGsoFsJO1ZPofREP9HRSqALmFPC9oJVBnyQgRTb5dtK1VDOhRkXAdhU5FQI4ELbhLUqa8bhEFhUju+YD+XGFayRdTuKMaonRX0W0qitlzQy+pGnpHoD8OcHrKMGLh0N/0QYXj4LanEGZK2qAMhjTW2xk8YbRh1Gra4wpZ4NGquA65ngrMRp7E6PzYcyV4wmYlPUJi/lc1dXwIkosXB+CwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lO54XQE3ep5DST63cTviAZ+0bA44c5rlqkVInhLF0QQ=;
 b=pt6lzpvQ+2sM28C9dfEfrWAkDTTKc1wv0jqnHCT4gE6IftdatWVwf1JOuXogzic4pMmV631rnkaFDdaqL8JkIrkadKSTmSuQDXYHsx7srh/mIIrjN5Nds4oDRlb9eMKI7N8lWCH8W7gDnQ03IM78LBu8YqHYFLKKUQcft3miaohQKXLtcWOsOl2IOsZjfmhomMusyrvvspU6F74wM4DQJwwaEZXYQPAcUMjNtesMgUjlwuKKiuJL4zYlyB+mwYgUtn6HLYF6q823iw5lX70EDYbjx5QDx7G0jQr1gO2+vvtXJA7YCosCykOoUGJSKxKYuIuFdksr4o18KngT5cpvsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lO54XQE3ep5DST63cTviAZ+0bA44c5rlqkVInhLF0QQ=;
 b=LN+JswTHHGD5ApxBdxUZggGyIJ4VKx0zUr2W6+wHp+m3MOCPOpEUepxUyL/0TsLpqjzQisktvCwAPaMeGFQsY7vQevtd0m8NBnBfnVmD4BUIkSmlUasAogQ8ve0OM9RtxWJNRTSGFq1VpvqE6y+vof83TQe2uInBQKwlMsLq2/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SA1PR12MB9513.namprd12.prod.outlook.com (2603:10b6:806:45c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Sat, 7 Jun
 2025 00:06:10 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%4]) with mapi id 15.20.8792.034; Sat, 7 Jun 2025
 00:06:09 +0000
Message-ID: <d25c5e19-5c3c-46d1-8641-75ae36833331@amd.com>
Date: Sat, 7 Jun 2025 05:36:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] soundwire: amd: fixes and improvements
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 sanyog.r.kale@intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250530054447.1645807-1-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20250530054447.1645807-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::20) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SA1PR12MB9513:EE_
X-MS-Office365-Filtering-Correlation-Id: 3266e9dc-484e-4ab4-a180-08dda5571b22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmdzbzhJQ3piQzJ3eU4vZnBWVlNnUlFXZEV0RTJHK0tpdmhQbjMvWWxjREZu?=
 =?utf-8?B?RWpyU1F4NllxZjJLOEJkZmdQa3NqL1gvRFVJSGJOdGtheXB1SEt0T1Q5Tk9j?=
 =?utf-8?B?NDg4SmlGcCtIczVCWXBibCtjcnFpSGtkd0NxRVg0eUVUbmU4VW0yay9OeWUr?=
 =?utf-8?B?SWxFcEJXL3c3N2VKQ0pDVjRucXprcjlSYVVGM3VtSkFTV2dFV29FeTRNcFhN?=
 =?utf-8?B?eEdMV2xGd3J2ckFUVFNDeTdzdUJCbXM1ciszelVpRzBkY2h5QzRBVXZBTXgw?=
 =?utf-8?B?b0xwUktYRldxQ1ZXbTRNMnlpL2p0eG11OXZFcEFxZysyYnBFV2VZWG5FUTk4?=
 =?utf-8?B?TExPQkZVOU1GOXZ1N0Q1dm5jMEoyZTVBeUgyKy90TUFGK2xMcktTYVYxc3Qw?=
 =?utf-8?B?WllDZkVOSWlDUmtYd1k5aTZWMGo2ejlwWExQd21ldGZMNHJMTUZCQ0k1WFhv?=
 =?utf-8?B?NkNGR2dtSnZPUGhCRTBrTU4vQzZLd0xUMG9pc05aaStibjNid3hFanAyMDl5?=
 =?utf-8?B?SHExQnBUUVMwVTFka2ZyY2xtMkQybjdaZjlpOEt0L3JuYW5NcVFjSkMvK3JJ?=
 =?utf-8?B?WmJyNWt0TmxEcEh2a2xtNjFkbGJEdkx2cXdtQ2RnbVNoQVR4V0RaOGNuTkRz?=
 =?utf-8?B?Sm50cHd2MDlGNDFiVTM2MGJUZDVERTRpemx0MlRFME1lWkVRYSs5RXhjRDNa?=
 =?utf-8?B?NmJUQWtQVFJtK3h4NnI4SzFDcW5ia2loOUNYanJVTGp2cUp0TFVtYm9wRGoy?=
 =?utf-8?B?K2ZXbHpIUG1kdDJvV0N1NkYwMGl0VjVIMHpHSzdDS1ZXRlRNNGxqQzJkVDRy?=
 =?utf-8?B?T0J5cHgrZitmVVVGdXFjOWdBdTNaanVFY29jS1dYaVEwdWkzTVpJanFTS0Iw?=
 =?utf-8?B?ZnJaNFRzTWs2SDA2cjZ6V2Z4L1Zvek9MU2ZZRnhEZ21PT0h2R3JxTHRoNWZi?=
 =?utf-8?B?QWdGUzJGTnJsWUFYRVhvdG5FQUl5MmJzVngzQ09zVzNBSjNpclZQZHpYeU8y?=
 =?utf-8?B?UndNNkFTZmdseWo4TW9wQThubm93RWd5ZTRSaWFtOVVYa0pFMFN4OGNaYXNN?=
 =?utf-8?B?akM4dXZ0bXlEenl0bzJkZVpqT0Q2OUYvRGw2bXpldkZDbHVGTlAvckJ6Nm83?=
 =?utf-8?B?VjRWK082RnpVdzZzVWltQmR4REpPTUdxNU9CSGlzUWNmdFVxczdZbHB1NDJi?=
 =?utf-8?B?VkFtU3ZLZlZmdXVLVGxpR2dlUTU5NmM2VS9xbDBVa29kN0ZBdzN1VEZOYU1x?=
 =?utf-8?B?Z09GTmVOSmU3QXdkTVBJWUk3NUo5aXRYeWN4a2diTGcvendGVWJrL01rZWJC?=
 =?utf-8?B?eTczNzNGN2xzRVFQWXQ5V2VyVDdYd2YwRjR3SStReFovbHNpdVdXVVpxSnNW?=
 =?utf-8?B?QWNab1B3SjNvSENoT0VKUUpSTndYQktNcHFVUXluU3ROb2ZkcnMvTmFtYy9B?=
 =?utf-8?B?NXgzaEE4Mkd5citTSm8rOWJzMkE0OFdrajYzRUR3aFNTUzUzYW5nTFYyR2tz?=
 =?utf-8?B?YnJFb3hodmpqZmN4aCtMdFZzWUdXb2x3b3VQaUZzREpYTmtSanMvM1V5NENJ?=
 =?utf-8?B?NG4yRGE3YVFwRkhRU3E2YkxkVW5PS2tJNGkwNG40a3R3eDBmZ1d3VVpqZHlP?=
 =?utf-8?B?NWxNOTUwWi9tNS8remcrWEFEWG5pVnE4QnJPck5WOGJUcFcrbVowQWNkT1hn?=
 =?utf-8?B?c0FYNDlBY1g4N2wrVk8rNk5wWk9FUDhKeDJWYnZvVnFCRCszVVI2MStkcnFH?=
 =?utf-8?B?ZVl1R29lNEdPa2hPTXR2bkNpYWlwN3FkUGFJdWhpQ0JNOHBzbFgxWVVGUytt?=
 =?utf-8?B?SXJuM1ZzaXhSTEFKZ2k5aEpDNFkxY1dyQWhnVTlBQmlZL2pEU2FuQ2R1M3cy?=
 =?utf-8?B?dys1MURGQUp2VHh4RXErWWhKRzFLV3ZOWUZ5WjM5VWFKUExBU0xPVTU4RytS?=
 =?utf-8?Q?8tnXOKTROFs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDNJZ3BXM2tKby9HbDFoajNvMWNnaHpCa0tDQUdKWElpTUs3SmFkNlRBUE5a?=
 =?utf-8?B?VmVNZnl0cDFTS3p6L0I5U3FmSmRBSXlWd0M5VS9kUGpVOFZCNDRRRys4bTlh?=
 =?utf-8?B?UHJGK2E1K0hKV0l6QnVCQWlqUHVMYStwanlNQ2hTdFFhRk5ZRXpnMVBjeG9I?=
 =?utf-8?B?aVFTSkU1bG84VTZON29xN3QreVlNUUtRczEvUVhVQi9HZ3Z0YTcwSHdnS2Nu?=
 =?utf-8?B?UnRVaDZEaStvZGpWTkpxRUdHVmE1d1dPL3hSYnUrbytRV1pSQkk2NVlPWnJm?=
 =?utf-8?B?eEVmQ3QwaTRFcnNrek9sOXVGb1M0MkxtZDgrRnI1MnZTNllOc1NqZkpXMTRh?=
 =?utf-8?B?ZTVMR1BTam1td2VEbUlsT2h5WVZmWGwrNUpDSlBQNlFiYjdYUnRQOUpEWFdO?=
 =?utf-8?B?cmNGQnB4ZDN2dmEwRmoveWtPVUVkTXBWbnFOdnhlLzhWbDg2enFsTEp3NkxX?=
 =?utf-8?B?VkRrM2dnMlh1UXJsbUgyL3JwSWhDU21tR3o1a1dRbExYQkhWd1lDckZLa1BX?=
 =?utf-8?B?NW1XTjJveEJCZ3VzSmJkSjkxRTdvOVdQTDR0LzlkMkIrZE5SV2lPYSs0Q1I3?=
 =?utf-8?B?ZDhVdVU1Mlo1dnA4Zkw0bFJYZGcvYjh0RklUMXNpQ0JXZ2JZN25TSTdpdktM?=
 =?utf-8?B?cDFzUlVZb3Z4RUdoKzhaVERTSk5YZ2Q3a01INlhBUGI0azRVZ0FqYUZHNjh6?=
 =?utf-8?B?clIzcnlRcGhnTFlXWExibGZLQ2pTV3ZXRHZucFBLa3ErUUo2N29MM0pxcFNR?=
 =?utf-8?B?bXRoU3p5Q1Y3S1VxSTBILzRMdEZoR2hXL3NKd0hqU3BidHNORGNtQlBzSjFi?=
 =?utf-8?B?ejVMT1l6OFRsbkxSNEt4WDdTQ3dqSWFCWndMb2k4RmZlejB3eFV6L1I0N25O?=
 =?utf-8?B?VjNOaTFlU1loNTBJOHpMbkhaSTJ1S3FkSmppb2dIZFRWVlFVbk1qbVBpc3pK?=
 =?utf-8?B?bXF4amdVa0xOZTFpODBuS25UbG9yQk9IZzJuVlduUzM3V1VDRTNBZ0tzNG1o?=
 =?utf-8?B?bzBOajBFeGNqbm4zRmhReVNyNXhPZElsZzZTclpqOTNJU2J6VkhkODRUT01F?=
 =?utf-8?B?YU44VFZoWFdqeUM0aUxCMUc5R3VocWRNaktCVUxSVm9hdXRNNys4b2dMSXFP?=
 =?utf-8?B?Mk1yTHVUUmQ2S0pQTGRYeGo5U0Y5bDFEaG1jN1JwS3dBa3JxMlBCenlmY0hT?=
 =?utf-8?B?ZDBjRmFRQ3E4c1U1c0lCSGdGOFNUMTdiM0NhS2ZUZGV6UGhVMncvTkRBZTJu?=
 =?utf-8?B?L3NQNWV3amxuaGFTR0NqckQrQzREQ244clVKOU92S20yQ1VjNllWWDZ1d3NB?=
 =?utf-8?B?dVVBcEM4Q2hnZ1JnTFA3eXlKVzFndXU2WW5zMVZMU1ZsaXhjREdVVXJkZmcy?=
 =?utf-8?B?cW5wTFpwQTZmdW1RdnZtdk1uSEZUdlVxWm9uSkw5bTNScHp1NWo4UFZLZFI5?=
 =?utf-8?B?dnRqUUprTHRhTUsyWldkcU5QMnRpWXdCNGFyaHcwVzlpcHc1NitpMkkrNXQv?=
 =?utf-8?B?TnhJb29hdDh1Wm5Tc3FOMEZuT01qSVNWNHFDUCtPWTU3NlFqUlhmbmtGaERQ?=
 =?utf-8?B?bnQyY1I1VjNRRldhUGlTMVc4TFBrUkpreUhZVWZlTUlNdGtaMVVMQ1VWWXIv?=
 =?utf-8?B?dW9HbkVOTWFFREVGRzNRM3locWNoZzJVa0UwVkNHMUptMVpwWFVYaWFqeU8w?=
 =?utf-8?B?Z0xkOHZSQ3o5Rk9PRzZrOHQxZUJ1WTkxYWpkMWZVdDN6cUpZc3BMb25hUHho?=
 =?utf-8?B?WXpvYkpJTG52akswZ3RiRzBtaS9zWVVxVkpyS2dHbDR2Q1VpNjhoN2UvSGl0?=
 =?utf-8?B?ek5xWXBIM1M1UUtiMUI3YlhQNGtnQllrZ0hTS1pLOXNZeUdYMkszTDYrOWxj?=
 =?utf-8?B?TE1Dblp3TDZlVy94bFJWaG1idUdpYk52UUtEYzlUa0s5UnJrVSsyYTZjam1E?=
 =?utf-8?B?eGdrZHc2aDRsZy82U0FLL056cTJhdThPRDF0cnNMbUxLUGczblFyUzBGMzNR?=
 =?utf-8?B?UVFiM3c3YThCWXMrcGJOYnlOVEYrYjFCZFZhdExHUURxcU9NYnFzaFF1b0w3?=
 =?utf-8?B?cnZSdWlPWjlQb0k3RkFGc2M1dUJpVkZwUXBGdWlNa2VsODdnRWszVHFVMExD?=
 =?utf-8?Q?B1GNSpuKuoriVJ3qioYDx1aJe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3266e9dc-484e-4ab4-a180-08dda5571b22
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 00:06:09.6599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AE6F6bT17HChSCyBjsndUxS1ADtK5kjUNET0axjRSB1VLVBjbjRG9vkoKH+erJlhOCxWtpwdsJP3/A3Mvi9lhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9513

On 30/05/25 11:13, Vijendar Mukunda wrote:
> This patch series consists of fixes and improvements for
> AMD Soundwire stack.
@vinod: Could you please help to review the patch series?
This patch series contains fix for system level suspend/resume scenarios
which needs to be landed on OEM kernel base.
>
> Vijendar Mukunda (3):
>   soundwire: amd: fix for handling slave alerts after link is down
>   soundwire: amd: serialize amd manager resume sequence during
>     pm_prepare
>   soundwire: amd: cancel pending slave status handling workqueue during
>     remove sequence
>
>  drivers/soundwire/amd_manager.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>


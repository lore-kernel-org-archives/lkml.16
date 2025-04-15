Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2084.outbound.protection.outlook.com [40.107.95.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76808C0B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744695651; cv=fail; b=ab1924CqYS/+NB/E2T3iaVyjj6X6qMC01EkLV32wENlYLx0fMEYD4BYcoXaq/hXVwh5JmtkGk3+R/WQo0tSFloPblsSP6GQ/DVJWJ8mgWct7HUrywJXse7MHp4HcDZlTQTNahzsR0JN4LhDZM7+zo6bqURd55uLjTyHI+LlTBjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744695651; c=relaxed/simple;
	bh=O3EFgfQIL5IqxlMNp9Mn68IuBQQWCG2qGam34s2Vz08=;
	h=Content-Type:Message-ID:Date:Subject:To:References:From:
	 In-Reply-To:MIME-Version; b=T2S5nTPB/gmCJnP/lz3Cm3m1LfgLOxjJsdFykV3HpR3SEoWyN8cK7ntDdw81ZdH0xvPrhVbZu5f8VVxNdLsgA+B9KrYd1deV+m4dMN7uo7ce/2tUOHahbZvGTRhBUYgUDIy2kac5SHMfGIC+uq0GoWq7WJPCUFzZaZKSEnP/HxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jrL66RSG; arc=fail smtp.client-ip=40.107.95.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jrL66RSG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+1L3qriGC/a9/h30BgIZA/CI6cIT50buaLlj3LiFh/kip+BydmInL2kfzxwIpgAyV0Aa1JHB0FTIHjG0UdfnphNZ0id3L3G+x0Y4dTFPeLJQLqIIjr/2TvUVcdl4bud8cZlETnd2b9svxVCNWOWwbW9p2o5Jwq9LYFimsqmWf0OKnwVmZqDnJs7cLEO+C9/LMrHxU/E3GAXLrP/+LTj2bIRyH+OjzbAZmqYGbK606czLa3MUvYiipEYzYJBP+eem4Ff6MkCba7sRjfuqGrTMsSWIP2NddD9jUBz9yh8vx+mAIN9Y8eWR7CzIN8stK8AqypU6/JxKZ8O/xr/DB9Baw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2RCwQ1Pp2hEPjvuzmzhvnHmUdhgvmtQqYpG6q1DNHA=;
 b=dPwRt8Wtww2wYiATG3wuJa+Iesp/wNrNko4Ns5v20ZtttbCG03CTyzDSa3BCNhWl5E58ZD/Y0uyJUPZktqcFkEq1CpMWwa5vxsoBeqxj5YmsLnJeNglbxeY0LXrFYVtMgRot6FDDlQBxXvG/moElRNLwqTlvwALKGL8fiFKRElhbykRdzTn/4m8cZxQy48mv14mdsB+fZ7bIFngHYQ3/41ZfgiTanDJXSkgy+OdgxQeEyAxIHtw8fvN1JZSbPypO4JwZOXaUBgJU7fjq3aVsbXJE39bU5Ecky/B/TsIrDBtdO4SOihtxEMOUG8+6kwpRlINtvF0HaGee7YwLWBH2ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2RCwQ1Pp2hEPjvuzmzhvnHmUdhgvmtQqYpG6q1DNHA=;
 b=jrL66RSGuWWraDt/9z5hDw1Cdq8PCwzXePZyLMfJqjKxAZrhVMrCAEsbHlua4t5A6P2vAhzOpGP3OtJPfFpqY2F4AfQlN+wqG0LU3bUhdd1MYTIxa79mVR7Ex2LTM16i8AAnaL5rJwek3w1X8JLnCTAMMl6g5Qbm0t7xzVOPkWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by LV3PR12MB9331.namprd12.prod.outlook.com (2603:10b6:408:219::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Tue, 15 Apr
 2025 05:40:46 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 05:40:46 +0000
Content-Type: multipart/mixed; boundary="------------NeTgBRpr0qejpOF6IdpZFbsC"
Message-ID: <ae35d5a9-c958-4cad-96fb-673e8bb9d46c@amd.com>
Date: Tue, 15 Apr 2025 11:10:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING in move_to_new_folio
To: syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 shivankg@amd.com
References: <67fded75.050a0220.3483fc.0045.GAE@google.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <67fded75.050a0220.3483fc.0045.GAE@google.com>
X-ClientProxiedBy: BMXPR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::18) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|LV3PR12MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: c918fd9f-dd32-4be6-a25b-08dd7be011fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4053099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjFrY1ZqQkdWSVpTV25tUTZCZnZFbjJIYzhQS0QxSlllOThCY2crTVdvaC9C?=
 =?utf-8?B?SW83RXZDRDRJS2pRTHdSRVYvZHdNelZwRHNvNWlJUWR5WHVnYXBmR1BhMjFZ?=
 =?utf-8?B?dGxhd1p2SE1mcGJWZlQ4dEo4MHlpY0RiT214a2FZUDBCbktmL2pWNTd4ek1V?=
 =?utf-8?B?bGFmRlVqd05walZjeVF4cVk0bUZrUEFrU1VITEVMTkxEdDlsMFNqS3VyMk9k?=
 =?utf-8?B?R0VINmk5ampkcGhjOUJXb0laVzBiV3FWOHBhc2hVckZoNmpUYkRpc0tydklQ?=
 =?utf-8?B?aGNqcmgrbk50cVFlQ3RuNWF2NjNFUUdYcTVtZmFmaGhJZkxsd012a2R3OGhE?=
 =?utf-8?B?aGE4VEdxYkhRWVUrTUNiaTNFckdOMVlEVlo5L0VMVjVnVHFxWWgzTFhQSGlt?=
 =?utf-8?B?Zm9GZUp4K0lzRmZnblo5QXhGdWhhcWNtc0VEZVVXLytHYS8zRXIxWGsxK21h?=
 =?utf-8?B?ZGdmU3JFcmpIOTJiQ3ZIVTNteUJMczQrWlJzWmRGaXJPR0gvQVRrQkpLSVF6?=
 =?utf-8?B?MUlXanQ0RHg1T2EwNEhxUTh2NFBKS2RwUXRkQnBuelJaR2JIUnJBYmVuVkJo?=
 =?utf-8?B?UU5nWUhFT053NDlVaGkrbHdRVFJyVkJ0RStyWHdLenlGRnpvV3ZYSDF5L2FT?=
 =?utf-8?B?NUZySzJmRUNOME9MY0ZiekpyY3J3ZXg5K0diMEplT1hEQzVvN3pKN2Jtdnpi?=
 =?utf-8?B?STQremJJVUY4c0U5YXVFN0Y1VVpQN0JBeEUzNUdaVUJzcmZsWWxDWkdlYzJK?=
 =?utf-8?B?YUxsWlk1UUphcWdEdDRDYVBXYlRpaEJKQjJ5V2Y4NmZLMEhrSXJieEIrOEs0?=
 =?utf-8?B?Q1hiUldnN1hRVXpOWjZvaUxZelR5ZFEzWmRacGVxNTZuYmRBU3BKbXZaQ0p0?=
 =?utf-8?B?MWFDd2lja1ZrZFFZSUdYTVM5ZitWSEZnV2pIL3hYNjliZXMydUhTcitoTnkw?=
 =?utf-8?B?QmlzS1p0Z25hOXBNTnF0VmFPSmZPeWVqRVpZWXRlYU0vNldTdGVkb04wb1ov?=
 =?utf-8?B?OW1pZ3BjYmpVVEh1NFRkS1Z2RWs1U3VjczVmZ291MVM2VWNJeGFPaTdrSEhO?=
 =?utf-8?B?MWJLRVVMQ3pnZWFCUFAxeEJ3TGhjaFEvaU9CTnA3QzIzelhXTXJXaVFUWWJQ?=
 =?utf-8?B?T2FqVGlvSCtxWVFISThiRW9xN053OWdjbExWOWFnMXRhM3NHRWc1Y3pHZUJq?=
 =?utf-8?B?QnI0QStOQit2U3JNNzNWRnVpZHFjdjIrM1daVzJrQmFlWDI3Y2UweGVLdjBT?=
 =?utf-8?B?K1RaQmo1cDZoRTZHcFRXQTEzTVpoU1dyWjB3eGsxRXNWK1pTVFpHS1FzUFJi?=
 =?utf-8?B?MXh3ZDNuYnBPb05CLzlEbCtOQm9QUXN5NmFQMzQyNDhtci9QblBld0J2dnFl?=
 =?utf-8?B?aWRMdWh3ZUhSVThraVZwRjdzL2ROYXRublVZOW9Gdmp4NUVyZFNaaHE4VFVF?=
 =?utf-8?B?VFF5REFPQlBZSDZrMmVzNjA5cEttR0JrRzF2cEhZdlFZU29VWWgwS05EMlMx?=
 =?utf-8?B?UXlhZDR1V09ZanIwUHNBemxwSlU0SXp0ZmdSdGVXM1FiQUhVUGNZVDVtUUNL?=
 =?utf-8?B?a3pPUTQvcyszVVpZNWhZc0R6dndHZFJBT2cxZ1B5cDdCa0liYXBEeklPVXRE?=
 =?utf-8?B?c20rc2U3bUQ5SVZ1bnJwcHhFZVp4eUh0alVKT2tCaVFrZDYycTJBaURzZTgx?=
 =?utf-8?B?Sjl2UUM2UFJJOWhaZDd6ODVSek9tdVQxTmJhSVFsUkZGcHNJZlVyMWIraFM0?=
 =?utf-8?B?MEJaS29wS0YxOTJhSDVWbTVMSU8xY3pQT0lRU0grOW5lUTVPRWZLTlVKZ0Vk?=
 =?utf-8?Q?mW1xHfnCw1Z271g7qjsSKOe1/L9okT/PjOLfM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnZTMGNnZ1VUakR4Z3dwMnZkb29MZUl3WEFndDRNbVgrZDRrUnZPdlM5UmFE?=
 =?utf-8?B?dlIzSkVEdngxMVk2OGJsRXBCQWVqSFViQi9DTUtBWFZMTnJOYWJDdmZEVCsy?=
 =?utf-8?B?QW83Vm5sUHpTeERpU3cyMWZGWW8rMnhJUTIycGVRdmM0WlJZMnVOcGVmUTAv?=
 =?utf-8?B?TDM3UzNiZ3FRZVBzN2U5SlNlYzByS1ZQeFNhTjV2MjBaOG40cEFoSm12VkYy?=
 =?utf-8?B?ZEQ3V3FqbTd0RHBUS0ZEcEd6bjlWd3ExQnpyVEhpc21BQkcvM1htODlqUlN3?=
 =?utf-8?B?V0czbHVtTnEzVy91RkFERGJlR2loYUNaZS9HSS8ycStrMVhTZmtsQnNsSFQx?=
 =?utf-8?B?MlY4WGR3WndTOGovMDdLbERIMEpDZ2RPOEc4Y3lEcDgvSXRoTnU2YkR0bUJP?=
 =?utf-8?B?QTBLNGhmWEx2WWM2WW5OYUZGQXhtVWhaN0hoZ0ZuclA0V3JqOTM3TU51d3hz?=
 =?utf-8?B?L1M3YWF2Uitna2FrZHA4Myt4V2JBV0VkbFk1ZXpBQ2JROVVsc2NycGhMbGV6?=
 =?utf-8?B?R1N4MnF4RUdEYjdTK2hFZUV1ci9rWExmUkZTUGcxQjdwUGF5bmY5RHNYQ3Zk?=
 =?utf-8?B?eWFRb0pxcFBlRE1KZ0k0KzVXWENJcWhqRnYvSmlCemtDUytYZmZtYjY1S2w5?=
 =?utf-8?B?eVdOdXMwcFJJZlR0eXQrOVNNTUNwT3MvREhkajF2ZW5nU0xUai9uQ1F2cjM4?=
 =?utf-8?B?ZW96Tk5RNjM4RC9VNVdNZkF3alZUODdpT2NOeWVCaVBDMVZPNUI1Y2VBVUF1?=
 =?utf-8?B?bGNXdGRyZDNCUFJud0Z5bHgwc3pJSXV4aHlpK2RucDVENVdwNXZCN2JTcE5y?=
 =?utf-8?B?ekg2djN3WXhLd1hXaWxia3RMZ05Qb0diM0VTU0h3TC85SGorZ2F2QmJtSzhx?=
 =?utf-8?B?cU45V0lJOFRtRit5MkNkWkR1d1loOWQvUEljc3Nrc0RaaloxT0x4OTcwTktX?=
 =?utf-8?B?UDZORDlFbW9rRTlPRlBvMG1YV2tWMlo1QTNsTmZxbk8wT2ZySmNTTWM5R0N1?=
 =?utf-8?B?cVdNOFVYZEEwcU1GL2JKSWVEVzhNamQwUjV2bWVIWnVFTU1kaFhSc005STVy?=
 =?utf-8?B?Y1B2V1JiRXU3TytCcjRwSFFVU0xpQ1AvYXZ4QVRyTVVCRzIvVzhGK1VuZytT?=
 =?utf-8?B?VnVBd3FKc1MxV2d4QmMyamU0bWVjWG5LV3pKNEhQL2VXRGRZV3F5blpQMXkw?=
 =?utf-8?B?VHphL2swT0g5dzBiS21uTGFjVFUwNnFWdGpXbmJ1VUxBQVhlWktncVhFYVVu?=
 =?utf-8?B?ek1JLzQ2VEdDNUJhMjNGaHQ4SUNlN0IzTFlBc1phSWswaG9wWHA3ODY5YjZF?=
 =?utf-8?B?RVgrNitjYm16SjJTWlNmdzZZazkxTnlxNVFEcGJLc2l1ckI1Rk9BSFJyNnlw?=
 =?utf-8?B?MkRRWHhHOGprdzB6eUkvbmMrdHc2d0ZJUS85M2ZSTkZ3bnFkWlB3UVpldlVD?=
 =?utf-8?B?MVBteXR0MGk5b2JYT0tsM2FyNFVBcDZiOE1qaHYyckUxL2VEOFlPOGxua3c4?=
 =?utf-8?B?d2lTbnptV2RPLzJCa01Xd3FWWGpJWmpDbG1TYnRaRHhIdXEyOE1sREY0c3Vy?=
 =?utf-8?B?cGpQbkVycXRvc0dSSXljQXlnNnBQaHkyZmxmNk9sekJEVWVucnRxUFE2Umxl?=
 =?utf-8?B?UTlZN3hQWm5aZWdSTnFzUEZVN1h4TVQxanFWVFdHbFdIQTZLcisvbk1SOHQz?=
 =?utf-8?B?bEtFc05OMlZoZTB1Qlo1Ly8vNWhpb2xabysrNGlHYkFnbXh6ZzczcGNJemFE?=
 =?utf-8?B?d0JUQTFiY2tPam9XZUFJQjNDRTVIb096ZkRlMmlxbEhaaUpJalFlTlZJdXU0?=
 =?utf-8?B?d2RGWERWYmdwSGIralk2SHNjUVJJdFhVbklBK25qbENrNzFzVE02TkRXL2Ro?=
 =?utf-8?B?dEZqZWxVSnZvS2VJS1hwWUhwZWpEb25EbTRSOURKOXhJY3FXSGU3eFgwZzND?=
 =?utf-8?B?TnI1WGFVQTJseWtaSHRGcUtzTjh2dlVOaUhteTNOaTZiWXdLWURZcFdHNElM?=
 =?utf-8?B?WlBMejM5cndNNWZPNy9mMDVLRVVDLzRIdFVoWkpjMXNrcm1WeWdNeW05bU9o?=
 =?utf-8?B?TE5SV1o3cVVLa0c4dFBaWTV3TVlxdWVDb3Z5TjZ6MkxBTmgxc2pOQkkwZFRp?=
 =?utf-8?Q?YJzxTe+duEe5h2biwAQhjNONJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c918fd9f-dd32-4be6-a25b-08dd7be011fd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 05:40:46.5623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udRqah31LQUmcFcGAGBL+TNpEiOfhBlvg6KGQScGPGbiCosg7FiApIgzdQp+9QErimNGZ6YewKQN3a8A/jgAVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9331

--------------NeTgBRpr0qejpOF6IdpZFbsC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I made a mistake in insert_metapage. I hope my revised patch work.
I'll post it to original list if this pass.

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 01c6df60d5d4

Best Regards,
Shivank

On 4/15/2025 10:54 AM, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> unregister_netdevice: waiting for DEV to become free
> 
> unregister_netdevice: waiting for batadv0 to become free. Usage count = 3
> 
> 
> Tested on:
> 
> commit:         01c6df60 Add linux-next specific files for 20250411
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=1142f0cc580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=db03cefa26ecf825
> dashboard link: https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=107a60cc580000
> 



--------------NeTgBRpr0qejpOF6IdpZFbsC
Content-Type: text/plain; charset=UTF-8;
 name="0001-jfs-implement-migrate_folio-for-jfs_metapage_aops.patch"
Content-Disposition: attachment;
 filename*0="0001-jfs-implement-migrate_folio-for-jfs_metapage_aops.patch"
Content-Transfer-Encoding: base64

RnJvbSBkYWExMzM0Zjk0Yzk0YjUyMTE3ODM1ZGNkMmQxMGVlMzE5NjE3NDU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaGl2YW5rIEdhcmcgPHNoaXZhbmtnQGFtZC5jb20+CkRhdGU6
IFN1biwgMTMgQXByIDIwMjUgMTY6NDA6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBqZnM6IGlt
cGxlbWVudCBtaWdyYXRlX2ZvbGlvIGZvciBqZnNfbWV0YXBhZ2VfYW9wcwoKQWRkIHRoZSBtaXNz
aW5nIG1pZ3JhdGVfZm9saW8gb3BlcmF0aW9uIHRvIGpmc19tZXRhcGFnZV9hb3BzIHRvIGZpeAp3
YXJuaW5ncyBkdXJpbmcgbWVtb3J5IGNvbXBhY3Rpb24uIFRoZXNlIHdhcm5pbmdzIHdlcmUgaW50
cm9kdWNlZCBieQpjb21taXQgN2VlMzY0NzI0M2U1ICgibWlncmF0ZTogUmVtb3ZlIGNhbGwgdG8g
LT53cml0ZXBhZ2UiKSB3aGljaAphZGRlZCBleHBsaWNpdCB3YXJuaW5ncyB3aGVuIGZpbGVzeXN0
ZW1zIGRvbid0IGltcGxlbWVudCBtaWdyYXRlX2ZvbGlvLgoKU3lzdGVtIHJlcG9ydHMgZm9sbG93
aW5nIHdhcm5pbmdzOgogIGpmc19tZXRhcGFnZV9hb3BzIGRvZXMgbm90IGltcGxlbWVudCBtaWdy
YXRlX2ZvbGlvCiAgV0FSTklORzogQ1BVOiAwIFBJRDogNjg3MCBhdCBtbS9taWdyYXRlLmM6OTU1
IGZhbGxiYWNrX21pZ3JhdGVfZm9saW8gbW0vbWlncmF0ZS5jOjk1MyBbaW5saW5lXQogIFdBUk5J
Tkc6IENQVTogMCBQSUQ6IDY4NzAgYXQgbW0vbWlncmF0ZS5jOjk1NSBtb3ZlX3RvX25ld19mb2xp
bysweDcwZS8weDg0MCBtbS9taWdyYXRlLmM6MTAwNwoKSW1wbGVtZW50IG1ldGFwYWdlX21pZ3Jh
dGVfZm9saW8gd2hpY2ggaGFuZGxlcyBib3RoIHNpbmdsZSBhbmQgbXVsdGlwbGUKbWV0YXBhZ2Vz
IHBlciBwYWdlIGNvbmZpZ3VyYXRpb25zLgoKRml4ZXM6IDM1NDc0ZDUyYzYwNSAoImpmczogQ29u
dmVydCBtZXRhcGFnZV93cml0ZXBhZ2UgdG8gbWV0YXBhZ2Vfd3JpdGVfZm9saW8iKQpSZXBvcnRl
ZC1ieTogc3l6Ym90KzhiYjZmZDk0NWFmNGUwYWQ5Mjk5QHN5emthbGxlci5hcHBzcG90bWFpbC5j
b20KQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvNjdmYWZmNTIuMDUwYTAyMjAu
Mzc5ZDg0LjAwMWIuR0FFQGdvb2dsZS5jb20KU2lnbmVkLW9mZi1ieTogU2hpdmFuayBHYXJnIDxz
aGl2YW5rZ0BhbWQuY29tPgotLS0KIGZzL2pmcy9qZnNfbWV0YXBhZ2UuYyAgIHwgOTQgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvbWlncmF0
ZS5oIHwgIDEgKwogbW0vbWlncmF0ZS5jICAgICAgICAgICAgfCAgMyArLQogMyBmaWxlcyBjaGFu
Z2VkLCA5NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZnMvamZz
L2pmc19tZXRhcGFnZS5jIGIvZnMvamZzL2pmc19tZXRhcGFnZS5jCmluZGV4IGRmNTc1YTg3M2Vj
Ni4uZDQ0MDUzN2RiNmZlIDEwMDY0NAotLS0gYS9mcy9qZnMvamZzX21ldGFwYWdlLmMKKysrIGIv
ZnMvamZzL2pmc19tZXRhcGFnZS5jCkBAIC0xNSw2ICsxNSw3IEBACiAjaW5jbHVkZSA8bGludXgv
bWVtcG9vbC5oPgogI2luY2x1ZGUgPGxpbnV4L3NlcV9maWxlLmg+CiAjaW5jbHVkZSA8bGludXgv
d3JpdGViYWNrLmg+CisjaW5jbHVkZSA8bGludXgvbWlncmF0ZS5oPgogI2luY2x1ZGUgImpmc19p
bmNvcmUuaCIKICNpbmNsdWRlICJqZnNfc3VwZXJibG9jay5oIgogI2luY2x1ZGUgImpmc19maWxz
eXMuaCIKQEAgLTE1MSw2ICsxNTIsNTQgQEAgc3RhdGljIGlubGluZSB2b2lkIGRlY19pbyhzdHJ1
Y3QgZm9saW8gKmZvbGlvLCBibGtfc3RhdHVzX3Qgc3RhdHVzLAogCQloYW5kbGVyKGZvbGlvLCBh
bmNob3ItPnN0YXR1cyk7CiB9CiAKK3N0YXRpYyBpbnQgX19tZXRhcGFnZV9taWdyYXRlX2ZvbGlv
KHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLCBzdHJ1Y3QgZm9saW8gKmRzdCwKKwkJCQkg
ICAgc3RydWN0IGZvbGlvICpzcmMsIGVudW0gbWlncmF0ZV9tb2RlIG1vZGUpCit7CisJc3RydWN0
IG1ldGFfYW5jaG9yICpzcmNfYW5jaG9yID0gc3JjLT5wcml2YXRlOworCXN0cnVjdCBtZXRhcGFn
ZSAqbXBzW01QU19QRVJfUEFHRV0gPSB7MH07CisJc3RydWN0IG1ldGFwYWdlICptcDsKKwlpbnQg
aSwgcmM7CisKKwlmb3IgKGkgPSAwOyBpIDwgTVBTX1BFUl9QQUdFOyBpKyspIHsKKwkJbXAgPSBz
cmNfYW5jaG9yLT5tcFtpXTsKKwkJaWYgKG1wICYmIG1ldGFwYWdlX2xvY2tlZChtcCkpCisJCQly
ZXR1cm4gLUVBR0FJTjsKKwl9CisKKwlyYyA9IGZpbGVtYXBfbWlncmF0ZV9mb2xpbyhtYXBwaW5n
LCBkc3QsIHNyYywgbW9kZSk7CisJaWYgKHJjICE9IE1JR1JBVEVQQUdFX1NVQ0NFU1MpCisJCXJl
dHVybiByYzsKKworCWZvciAoaSA9IDA7IGkgPCBNUFNfUEVSX1BBR0U7IGkrKykgeworCQltcCA9
IHNyY19hbmNob3ItPm1wW2ldOworCQlpZiAoIW1wKQorCQkJY29udGludWU7CisJCWlmICh1bmxp
a2VseShpbnNlcnRfbWV0YXBhZ2UoZHN0LCBtcCkpKSB7CisJCQkvKiBJZiBlcnJvciwgcm9sbC1i
YWNrIHByZXZpb3NseSBpbnNlcnRlZCBwYWdlcyAqLworCQkJZm9yIChpbnQgaiA9IDAgOyBqIDwg
aTsgaisrKSB7CisJCQkJaWYgKG1wc1tqXSkKKwkJCQkJcmVtb3ZlX21ldGFwYWdlKGRzdCwgbXBz
W2pdKTsKKwkJCX0KKwkJCXJldHVybiAtRUFHQUlOOworCQl9CisJCW1wc1tpXSA9IG1wOworCX0K
KworCS8qIFVwZGF0ZSB0aGUgbWV0YXBhZ2UgYW5kIHJlbW92ZSBpdCBmcm9tIHNyYyAqLworCWZv
ciAoaW50IGkgPSAwOyBpIDwgTVBTX1BFUl9QQUdFOyBpKyspIHsKKwkJbXAgPSBtcHNbaV07CisJ
CWlmIChtcCkgeworCQkJaW50IHBhZ2Vfb2Zmc2V0ID0gbXAtPmRhdGEgLSBmb2xpb19hZGRyZXNz
KHNyYyk7CisKKwkJCW1wLT5kYXRhID0gZm9saW9fYWRkcmVzcyhkc3QpICsgcGFnZV9vZmZzZXQ7
CisJCQltcC0+Zm9saW8gPSBkc3Q7CisJCQlyZW1vdmVfbWV0YXBhZ2Uoc3JjLCBtcCk7CisJCX0K
Kwl9CisKKwlyZXR1cm4gTUlHUkFURVBBR0VfU1VDQ0VTUzsKK30KKwogI2Vsc2UKIHN0YXRpYyBp
bmxpbmUgc3RydWN0IG1ldGFwYWdlICpmb2xpb190b19tcChzdHJ1Y3QgZm9saW8gKmZvbGlvLCBp
bnQgb2Zmc2V0KQogewpAQCAtMTc1LDYgKzIyNCwzMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcmVt
b3ZlX21ldGFwYWdlKHN0cnVjdCBmb2xpbyAqZm9saW8sIHN0cnVjdCBtZXRhcGFnZSAqbXApCiAj
ZGVmaW5lIGluY19pbyhmb2xpbykgZG8ge30gd2hpbGUoMCkKICNkZWZpbmUgZGVjX2lvKGZvbGlv
LCBzdGF0dXMsIGhhbmRsZXIpIGhhbmRsZXIoZm9saW8sIHN0YXR1cykKIAorc3RhdGljIGludCBf
X21ldGFwYWdlX21pZ3JhdGVfZm9saW8oc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsIHN0
cnVjdCBmb2xpbyAqZHN0LAorCQkJCSAgICBzdHJ1Y3QgZm9saW8gKnNyYywgZW51bSBtaWdyYXRl
X21vZGUgbW9kZSkKK3sKKwlzdHJ1Y3QgbWV0YXBhZ2UgKm1wOworCWludCBwYWdlX29mZnNldDsK
KwlpbnQgcmM7CisKKwltcCA9IGZvbGlvX3RvX21wKHNyYywgMCk7CisJaWYgKG1wICYmIG1ldGFw
YWdlX2xvY2tlZChtcCkpCisJCXJldHVybiAtRUFHQUlOOworCisJcmMgPSBmaWxlbWFwX21pZ3Jh
dGVfZm9saW8obWFwcGluZywgZHN0LCBzcmMsIG1vZGUpOworCWlmIChyYyAhPSBNSUdSQVRFUEFH
RV9TVUNDRVNTKQorCQlyZXR1cm4gcmM7CisKKwlpZiAodW5saWtlbHkoaW5zZXJ0X21ldGFwYWdl
KGRzdCwgbXApKSkKKwkJcmV0dXJuIC1FQUdBSU47CisKKwlwYWdlX29mZnNldCA9IG1wLT5kYXRh
IC0gZm9saW9fYWRkcmVzcyhzcmMpOworCW1wLT5kYXRhID0gZm9saW9fYWRkcmVzcyhkc3QpICsg
cGFnZV9vZmZzZXQ7CisJbXAtPmZvbGlvID0gZHN0OworCXJlbW92ZV9tZXRhcGFnZShzcmMsIG1w
KTsKKworCXJldHVybiBNSUdSQVRFUEFHRV9TVUNDRVNTOworfQorCiAjZW5kaWYKIAogc3RhdGlj
IGlubGluZSBzdHJ1Y3QgbWV0YXBhZ2UgKmFsbG9jX21ldGFwYWdlKGdmcF90IGdmcF9tYXNrKQpA
QCAtNTU0LDYgKzYyOSwyNCBAQCBzdGF0aWMgYm9vbCBtZXRhcGFnZV9yZWxlYXNlX2ZvbGlvKHN0
cnVjdCBmb2xpbyAqZm9saW8sIGdmcF90IGdmcF9tYXNrKQogCXJldHVybiByZXQ7CiB9CiAKKy8q
KgorICogbWV0YXBhZ2VfbWlncmF0ZV9mb2xpbyAtIE1pZ3JhdGlvbiBmdW5jdGlvbiBmb3IgSkZT
IG1ldGFwYWdlcworICovCitzdGF0aWMgaW50IG1ldGFwYWdlX21pZ3JhdGVfZm9saW8oc3RydWN0
IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsIHN0cnVjdCBmb2xpbyAqZHN0LAorCQkJCSAgc3RydWN0
IGZvbGlvICpzcmMsIGVudW0gbWlncmF0ZV9tb2RlIG1vZGUpCit7CisJaW50IGV4cGVjdGVkX2Nv
dW50OworCisJaWYgKCFzcmMtPnByaXZhdGUpCisJCXJldHVybiBmaWxlbWFwX21pZ3JhdGVfZm9s
aW8obWFwcGluZywgZHN0LCBzcmMsIG1vZGUpOworCisJLyogQ2hlY2sgd2hldGhlciBwYWdlIGRv
ZXMgbm90IGhhdmUgZXh0cmEgcmVmcyBiZWZvcmUgd2UgZG8gbW9yZSB3b3JrICovCisJZXhwZWN0
ZWRfY291bnQgPSBmb2xpb19leHBlY3RlZF9yZWZzKG1hcHBpbmcsIHNyYyk7CisJaWYgKGZvbGlv
X3JlZl9jb3VudChzcmMpICE9IGV4cGVjdGVkX2NvdW50KQorCQlyZXR1cm4gLUVBR0FJTjsKKwly
ZXR1cm4gX19tZXRhcGFnZV9taWdyYXRlX2ZvbGlvKG1hcHBpbmcsIGRzdCwgc3JjLCBtb2RlKTsK
K30KKwogc3RhdGljIHZvaWQgbWV0YXBhZ2VfaW52YWxpZGF0ZV9mb2xpbyhzdHJ1Y3QgZm9saW8g
KmZvbGlvLCBzaXplX3Qgb2Zmc2V0LAogCQkJCSAgICBzaXplX3QgbGVuZ3RoKQogewpAQCAtNTcw
LDYgKzY2Myw3IEBAIGNvbnN0IHN0cnVjdCBhZGRyZXNzX3NwYWNlX29wZXJhdGlvbnMgamZzX21l
dGFwYWdlX2FvcHMgPSB7CiAJLnJlbGVhc2VfZm9saW8JPSBtZXRhcGFnZV9yZWxlYXNlX2ZvbGlv
LAogCS5pbnZhbGlkYXRlX2ZvbGlvID0gbWV0YXBhZ2VfaW52YWxpZGF0ZV9mb2xpbywKIAkuZGly
dHlfZm9saW8JPSBmaWxlbWFwX2RpcnR5X2ZvbGlvLAorCS5taWdyYXRlX2ZvbGlvCT0gbWV0YXBh
Z2VfbWlncmF0ZV9mb2xpbywKIH07CiAKIHN0cnVjdCBtZXRhcGFnZSAqX19nZXRfbWV0YXBhZ2Uo
c3RydWN0IGlub2RlICppbm9kZSwgdW5zaWduZWQgbG9uZyBsYmxvY2ssCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L21pZ3JhdGUuaCBiL2luY2x1ZGUvbGludXgvbWlncmF0ZS5oCmluZGV4IGFh
YTIxMTQ0OThkNi4uY2IzMWM1YjFlYjZhIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21pZ3Jh
dGUuaAorKysgYi9pbmNsdWRlL2xpbnV4L21pZ3JhdGUuaApAQCAtNjAsNiArNjAsNyBAQCBzdHJ1
Y3QgbW92YWJsZV9vcGVyYXRpb25zIHsKIC8qIERlZmluZWQgaW4gbW0vZGVidWcuYzogKi8KIGV4
dGVybiBjb25zdCBjaGFyICptaWdyYXRlX3JlYXNvbl9uYW1lc1tNUl9UWVBFU107CiAKK2ludCBm
b2xpb19leHBlY3RlZF9yZWZzKHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLCBzdHJ1Y3Qg
Zm9saW8gKmZvbGlvKTsKICNpZmRlZiBDT05GSUdfTUlHUkFUSU9OCiAKIHZvaWQgcHV0YmFja19t
b3ZhYmxlX3BhZ2VzKHN0cnVjdCBsaXN0X2hlYWQgKmwpOwpkaWZmIC0tZ2l0IGEvbW0vbWlncmF0
ZS5jIGIvbW0vbWlncmF0ZS5jCmluZGV4IDZlMjQ4OGU1ZGJlNC4uMGYwMWI4YTg3ZGVjIDEwMDY0
NAotLS0gYS9tbS9taWdyYXRlLmMKKysrIGIvbW0vbWlncmF0ZS5jCkBAIC00NDUsNyArNDQ1LDcg
QEAgdm9pZCBwbWRfbWlncmF0aW9uX2VudHJ5X3dhaXQoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHBt
ZF90ICpwbWQpCiB9CiAjZW5kaWYKIAotc3RhdGljIGludCBmb2xpb19leHBlY3RlZF9yZWZzKHN0
cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAoraW50IGZvbGlvX2V4cGVjdGVkX3JlZnMoc3Ry
dWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCiAJCXN0cnVjdCBmb2xpbyAqZm9saW8pCiB7CiAJ
aW50IHJlZnMgPSAxOwpAQCAtNDU4LDYgKzQ1OCw3IEBAIHN0YXRpYyBpbnQgZm9saW9fZXhwZWN0
ZWRfcmVmcyhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKIAogCXJldHVybiByZWZzOwog
fQorRVhQT1JUX1NZTUJPTF9HUEwoZm9saW9fZXhwZWN0ZWRfcmVmcyk7CiAKIC8qCiAgKiBSZXBs
YWNlIHRoZSBmb2xpbyBpbiB0aGUgbWFwcGluZy4KLS0gCjIuMzQuMQoK

--------------NeTgBRpr0qejpOF6IdpZFbsC--

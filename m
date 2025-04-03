Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C341F03FF;
	Thu,  3 Apr 2025 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665777; cv=fail; b=plsg+LNNtOXcHPp1h0JDDq9u2oWNUPNaS815p2YqUTUQQENTB/+RvXgEzEm1FrS82APUcvjQbipsmJfFrMdPehPgYS1r8TT1n3ZRIHM2CDZbvB58Xx+eS/PSOP3T+1UJRJ8qEvtn3ZMD7Vsidae735txXeyobi6MAOMGkarO+sE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665777; c=relaxed/simple;
	bh=5WLl8nt2WfPbz/zJJH8PGWbWOVgSBJL+p4UkSuqKwss=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rMgnjBaXMnIegxCM3dyTbiBHSXzEuCIq4FNkPBRwBKyGawH1ik76iJ1KY7xXoNdEP0nCrA1W0gN6awyuG40BmYFl8x/K6HIHfVyuWuxzv1DG2dQei+VXf+XhHMvQYK8hY8UdiAPg6JeSdQXinIj36+5tAMbJ77uSAEbo8ZndaFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SOB71eyb; arc=fail smtp.client-ip=40.107.223.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SOB71eyb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtHih2dILTP+WduBCkXVr/C659hLu4CJVbD+X24cwYsGSKkMWMYIiB5o0D5Gd9csIwsta40mpVthJj3/3RMCwfa4926wH/WyYIDZSteM2LR39EfBDkUXXQcnvRn9OkoV0Xjq0D0yeN0db8YDxJvgjhcPYK1fRQMLgbE/t2W3eWEol+E0DuWiy6dA7ygybcwVm+heRSTTDrWFzlc9Fvpg96Bmad+fg+Ztsuj5p/PUtabO+MIk9/LDZoCZL/lMYGp09Ttljoi+QGvSPp9ds0wRJ9i1TpXXt16fye14/gszu9AwXpnN44u09wxs36RuVqfRmq4pCkcRwoHqTIIihmADbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4S4HRHMw0wMmtsGwfRfPK4h3nvd0ZtY7Yu3xZhWgXQ=;
 b=Gl7OOtKDoxU9Y9kgIxh44LN+ZryNITuJMLCFQ7Pq2MwpJAG/MvQYNmF13N9AGsatrMYmA4eeuvLnHI0zxXYxm4fGnpMYVLBIpiDy3ifJGI7YLiovxYnpfLpRyf6q35BcBHDtQqWjEKXoBfKJzXrmw3C7VnQtT89IWwghSefefXI4fVLANgmSlGR0ulhaw+zgNaDqI5GldmNN5flcvlNw6mq2zyKGg/RBeFeQe/Rv92lWTB3I9YmfEeTlarryLefJEiBZ2XwHpFdCnyEGowXIoB5VCK1MziXwPLd8Ub5SsHu1YsVdupV/KrXtZZRcERzX1JrFyg0cwDFq1OApQcw6jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4S4HRHMw0wMmtsGwfRfPK4h3nvd0ZtY7Yu3xZhWgXQ=;
 b=SOB71eyb/Tou1qI8zx+pZr77eU/UnolZdxFT9nkIaWqIg3MuLV//O58ERwsOAsfpplOY1vWnXvxRiy0sCrI3L7JcxNHNExl/ZLW/kqpF8e+9W4KNxDO9kRzReODMXGSFnJ64syyvPZhfHRYNnc3xr0W54RIrFazAvVPG41foqpw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by CH3PR12MB9395.namprd12.prod.outlook.com (2603:10b6:610:1ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 07:36:12 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%7]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 07:36:12 +0000
Message-ID: <9635c502-3635-4875-ae1f-53b4b7aed855@amd.com>
Date: Thu, 3 Apr 2025 15:36:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] transport-pci: Add SWIOTLB bounce buffer
 capability
To: "Michael S. Tsirkin" <mst@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>
Cc: virtio-comment@lists.linux.dev, hch@infradead.org,
 Claire Chang <tientzu@chromium.org>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?J=C3=B6rg_Roedel?=
 <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, graf@amazon.de
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-4-dwmw2@infradead.org>
 <20250403032152-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20250403032152-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|CH3PR12MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: 8634a022-0b66-453e-6891-08dd7282357a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2J4MTRFSGd0TEdTTUR4Q3VWVXN6VENSNEgvY0ZNRXc2ZzM1SXlaNDRHb0V1?=
 =?utf-8?B?UUxmM09vekJGOEFUWU1RRW9oeFN6aGc2VFVwblhxZUZuYnhUQWVqSnBMdnN2?=
 =?utf-8?B?K1ZEL1NTR2swaWIrUlVtazVkekNOdmhocVZ4Z2lmaDYrNFA3TXFVcS9JNmIr?=
 =?utf-8?B?Rkp5RkJSLzk0ck5Lbk9FcDNKdkRiT3pBTFh6amhsWUtUdTNwNUc1N3p5bURs?=
 =?utf-8?B?TmVIUEsvdzJBOGF5b1JIaHIrbkFKQ2JCTXI2ODFWZVBmQW9qS2lkTk1GWUFI?=
 =?utf-8?B?bUlYT2JNaWprTXdJelArclZFZlNhdzBLWGdwSVFCMFhFdTdYWFAvMVZ1QVhS?=
 =?utf-8?B?cmFhcUdKOGVBT0tlWnRDNGgxY2tuSXdvTnNhNk5rRFZJM3d6cmYxbFpHWStB?=
 =?utf-8?B?YU43NlR6RGJOMDlOS2JZcmd6Yjh3ZUhKU2w2M1JQT1R1akgrL2xGS0V0WnBh?=
 =?utf-8?B?d0EvTmdhM2p2NkZSVXNzTkRrT1hEOHNtV1FWSmxvTFluaHNWMEtkVlVWeTFP?=
 =?utf-8?B?eTRqTkROMXpqM1NTbFQ4YUExRjZ0eEQrYXZRTlNvS0tsa1dpd0lleERnaTd2?=
 =?utf-8?B?MGthbzh1QStBRG5xeTNtTWRKNkhNL1N0RTg1R2RxQ25GZlNidTIwWGU5WFly?=
 =?utf-8?B?Zmg1S3JsYThMeGR6R29henE3V3NDTDQwUGpXSlVoL2g5eFFHbnVjN3RCbnJC?=
 =?utf-8?B?WHRvUnFudnJMMkdBdzhRa1c5WDg4Z0JPWHVZWXg2dkFRZ1ZoVUlSYTJFK0N6?=
 =?utf-8?B?WEtVZEdjZTZjSnRxc1ZyMjVrUnlhUHhhMDZNNVpBS3ZVeUVyZkdvcnRVZjdK?=
 =?utf-8?B?Q3A0YjZ4QUhtTmNncEtyemRUdkp6SmorUVhLSDdWak5zQ0dwTUdUWHU4bG9E?=
 =?utf-8?B?TWFTdTRWT3lTMW15UnZWMVpMTFk0dmp5elVNK1pqY1V2T0w3TCtMZS9jUDJu?=
 =?utf-8?B?aDIwbXVvaCt2NHlkQU03TEhyTmRuV1grYnhQM1RkMzRBRnc2bXdEbnhHWmJu?=
 =?utf-8?B?azNvMFZIbm9zKzBVMk9VSXVvV21xZjF5WVNyUnl0UlB6eWRKRUpnUmU2L2NQ?=
 =?utf-8?B?M3paNWk1aEtZOXA3WWtucDYyRndXUFVSMmFIWWk1VkJoNGZlTnFrdXIrb3dk?=
 =?utf-8?B?NlhjOXdBdzZxSHFSdDVFWWlpa01RNE9PaStGN1BYVi9hRUt3U05OTGpFdkd2?=
 =?utf-8?B?aFNlK0V3eFZHQnA5SjR6Q3M5SG85RE5nTFEyVzdxOXhGWkpDVTNqajB4TWIz?=
 =?utf-8?B?YlJsbk1XVm9YVjRpd01XeDBlWGNqdFZYTFpkbEw5dktZZjN3TTd4TmVPdDZh?=
 =?utf-8?B?ZUtyUFJRS3pyemIxeTZhZlUweXJ2bDJSQWlBRDM5aWdwczN4TDhqbHpWbHRy?=
 =?utf-8?B?VllRU0ZsR1R4Q3dNOVdvSzNldEJHc2xoQ003K2Voc2dnQTFvNjVNRjFJR0wv?=
 =?utf-8?B?RkhCTVF2amFRVHAyZkFIeFdvenFhdGNkdlNtZTF6M3RqSjRNQzNZQVFBaG02?=
 =?utf-8?B?WitOWE9ONFhPWHpjRFdhdjM0RllyUzUydU9GbElhMWJ1dWJVTGVKdXc3SFNY?=
 =?utf-8?B?MzlaOVMzMEhYa0wveVBqSGtLanlad2Z4WTB0cE1lenVUVkg0NW5laUhHNzdt?=
 =?utf-8?B?QU1la3VtbmlFME1QKzR4UEs3aUpyUHlXVnM4MHVOeUo4VkxOc3hMN3JpUzJO?=
 =?utf-8?B?QS9WQ2VWY3dTaDZ5YVo4cFBwUFdvMFFMV0o2dHYvb2h4TFB4YjgyVmptR1M1?=
 =?utf-8?B?WDFWQTdzOUpqQWdySFV3RE9IaGpxTkp6Y1czalNxcVdCZUVRdkFydHZ4UjlO?=
 =?utf-8?B?ck1aaEFEcVpKTkpRU1Mxd0ZtWEtPanM0Rys0TGF0c3AzYzFRM3lLbnJzWndV?=
 =?utf-8?B?TDJrYTRRL1o3Q3hKejFldFhMVGVYK3RITFE0SkpFVTd1QTFGd3B0dnVJczkx?=
 =?utf-8?Q?fBIVIClA/Yk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXRyb2w1OFNvSG1OZUVtdVFSNFdnZGVGMDlBWmZGYzNGWFZLbGJ0Ukw5RExG?=
 =?utf-8?B?ajNjU09hSHczN0JvdFNQNjZjbW95WTcrU3VwSXJYQ3RPVnpkeXJWS0JSemM1?=
 =?utf-8?B?VWJwdGo0cmxmZ1dhdUVlQ2E2eWlrMWo2Q0NDS2tKMlpwTHRHdXFUbGNEbHE0?=
 =?utf-8?B?N3lHZ2pmWi8vNnVpdmRYdlhub0J6SThsQmoxRnRWdmNsT1NTVk15eTJLSmJQ?=
 =?utf-8?B?Q3JacmJ1NlNjRjBPc3pkWDNKdlk0SXZuVVBVbmRuT2tLL29aTnlWU2ZRelFp?=
 =?utf-8?B?N1d4Z0x3NkoweW9VcW9UZnRmQ3dTTVpRcmNSSWlyODg5ZXFNV3Jpa2RmUExN?=
 =?utf-8?B?SFFGdytoeTdQa3p1RlZPWmpSajZCa3lHb0xsVFRDSEs2anBMdHdPa2IxUmRK?=
 =?utf-8?B?eEh1QWFtRnZGYkFONWlwRmNxcjhhZXFxTjFRQ2lzcDRBWlY5NFJUYWVZR05m?=
 =?utf-8?B?eW1qOU1CYTNFVWdhOVVrb0FzcEIzRkRFdEJWN3FPdEozdzkyUmE4ZWhCemYw?=
 =?utf-8?B?SlFaUityVmd5LzNhakhlQndRdW51U3JMSFNDdU1TWEVtM0hXaVg3K3hPeXU4?=
 =?utf-8?B?Vk5GQ3dKaVpLWnAyWTRtdFppazhHeVplRVVsYmhXOGZWbWROU3VyNUlNdkRi?=
 =?utf-8?B?OTJ1Z2g0dkJuWlNBMEdVbTcva0hnelFyK0E4TG5PT0lUVlozRGNWWFJ5Rll2?=
 =?utf-8?B?bnExLzF0ZEFRTFpwdUoyUmNNcTdramhld2Z6UndWR2ZUc2F0R3hZS0o2RDRU?=
 =?utf-8?B?Ky9zeTBhM3hUanR3ckYzM3ViVnh5amN0R244SlJ4RXgyVmVYMmhaQ2FyeWtM?=
 =?utf-8?B?dEZGT1lLakJXbUQ1ZWtpRmZkWWxVMldrMVZSMHJDUVRkSVczanVXQU1nSnow?=
 =?utf-8?B?OURZY0piODBLRk13VVpLUHZRMFZtMzN6c0Zuc3FkSzBPYWVjM3M3TFFIMUxh?=
 =?utf-8?B?cy9wSmxJTUVxclQzV1ZsK0Znd0t0eE45UjVBWXdsU1VVY0JhNytlaklVcExF?=
 =?utf-8?B?dEtpazJmaTFCSklEMlRuTExlM1pHbk1EUW1OelhCZjJ1b1lBckk1aHBodTBi?=
 =?utf-8?B?bEhKWnNzQWM4S2tYeW5nZ3BUS1pRL3daUzF6eTJ2RDdMd3p0QlVBbk1qeXlD?=
 =?utf-8?B?eERqSzhVYVRZMTBac3I2SUdBVE9KU0JYV3J5b2R2dkZtS21xTGM2MXNVaWds?=
 =?utf-8?B?dUVDQUVsdkdNS1JQU0VTRjE3UU9tRUJqQmVMYjJoYnBUaVI3MUN4WTNheEpE?=
 =?utf-8?B?eGF0R0ZYaVRrajV0Sm0rT2xNZXBUaVJ5Z053Y3JRWXZGVU04U2NGdVlHSlZr?=
 =?utf-8?B?QVNWbW1QQkpWRTk3ZkRtRVFna09QWkg3K2dveHNSMUs0NFBwT0VzVHRDV3dM?=
 =?utf-8?B?V2lORE5nbWRYSDViMHk5T095ZS9NSElKNXJZcC9wajNQYkZmQkViTUVMNS85?=
 =?utf-8?B?ZXpPM1BqYXkyekM5RGFQdGRIUmRmZ0t1TmlDNjZDVGRuWHh4RUZkOXJPWVNK?=
 =?utf-8?B?aFQ4YjQvUU1ha2lpRDFkSkQ0VGZFNVQ3NTJlaXdoWmtuem5SbGZxOVdldnZs?=
 =?utf-8?B?ZmpCMmFWa1J6VSt5OEIrcDJveHVkeVVJOGpySW13bVl2dXY0aWhaYnZaY3lX?=
 =?utf-8?B?L0R4N0M3WlgvWU10ZlZpQUpsd0ZSY095RGJKVmRnOUV5T3czdFg4TE1pRWY2?=
 =?utf-8?B?ZmtwRVM0MkNCbDZsSnk3Q2cwTzFtc3ZQc0pLZ3MwbkM3a0JRbkp4MmlhSm9C?=
 =?utf-8?B?NzJ2eW5saFpGWU8rdld4WFBLRE9JZW85bTlSNjhkTTNnS0JZMk1uLzI3STk2?=
 =?utf-8?B?cCtJenY1WHorZ2xLdVVvVi8xTC9PUng1bmRhb3owRDkremF2WXl0K0JIbHgv?=
 =?utf-8?B?YXRqMXZkVW5kWDVKYk1EekZ2N3dtR0VaUEFCUGRNZnR5K1h6c1RHS0ZXSzhx?=
 =?utf-8?B?M2RBY3J2ckF3amlsdThBODZXaDBXSUNsZnZlNkVZWVcrZTdjelRHZ3I0eWRR?=
 =?utf-8?B?SFZ3OWxzcVV1SElzdVM4am9Lc0ZRbHV3ZEdnajFMWXhtaU1RRHpGZnE5cmph?=
 =?utf-8?B?OVF0RHdmRHNPajJ3eDN5eTIveHlSTndIRElQM3hTSjhUWHdueVhsaGZEemc5?=
 =?utf-8?Q?7Zv8Vz3mSU2rUA1kiHSDMUP4c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8634a022-0b66-453e-6891-08dd7282357a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 07:36:12.7881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: haeC1+2vt30zxenhBiOBTC2lYWp2Viy/sX1FZWcJBb0Yg86Ch8r6cla+41F+nXzPyjuuYmY5br92hud7WOTa9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9395

On 4/3/2025 3:27 PM, Michael S. Tsirkin wrote:
> On Wed, Apr 02, 2025 at 12:04:47PM +0100, David Woodhouse wrote:
>> From: David Woodhouse <dwmw@amazon.co.uk>
>>
>> Add a VIRTIO_PCI_CAP_SWIOTLB capability which advertises a SWIOTLB bounce
>> buffer similar to the existing `restricted-dma-pool` device-tree feature.
>>
>> The difference is that this is per-device; each device needs to have its
>> own. Perhaps we should add a UUID to the capability, and have a way for
>> a device to not *provide* its own buffer, but just to reference the UUID
>> of a buffer elsewhere?
>>
>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>> ---
>>  transport-pci.tex | 33 +++++++++++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> diff --git a/transport-pci.tex b/transport-pci.tex
>> index a5c6719..23e0d57 100644
>> --- a/transport-pci.tex
>> +++ b/transport-pci.tex
>> @@ -129,6 +129,7 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
>>  \item ISR Status
>>  \item Device-specific configuration (optional)
>>  \item PCI configuration access
>> +\item SWIOTLB bounce buffer
>>  \end{itemize}
>>  
>>  Each structure can be mapped by a Base Address register (BAR) belonging to
>> @@ -188,6 +189,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
>>  #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
>>  /* Vendor-specific data */
>>  #define VIRTIO_PCI_CAP_VENDOR_CFG        9
>> +/* Software IOTLB bounce buffer */
>> +#define VIRTIO_PCI_CAP_SWIOTLB           10
>>  \end{lstlisting}
>>  
>>          Any other value is reserved for future use.
>> @@ -744,6 +747,36 @@ \subsubsection{Vendor data capability}\label{sec:Virtio
>>  The driver MUST qualify the \field{vendor_id} before
>>  interpreting or writing into the Vendor data capability.
>>  
>> +\subsubsection{Software IOTLB bounce buffer capability}\label{sec:Virtio
>> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>> +Software IOTLB bounce buffer capability}
>> +
>> +The optional Software IOTLB bounce buffer capability allows the
>> +device to provide a memory region which can be used by the driver
>> +driver for bounce buffering. This allows a device on the PCI
>> +transport to operate without DMA access to system memory addresses.
>> +
>> +The Software IOTLB region is referenced by the
>> +VIRTIO_PCI_CAP_SWIOTLB capability. Bus addresses within the referenced
>> +range are not subject to the requirements of the VIRTIO_F_ORDER_PLATFORM
>> +capability, if negotiated.
>> +
>> +\devicenormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
>> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>> +Software IOTLB bounce buffer capability}
>> +
>> +Devices which present the Software IOTLB bounce buffer capability
>> +SHOULD also offer the VIRTIO_F_SWIOTLB feature.
>> +
>> +\drivernormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
>> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>> +Software IOTLB bounce buffer capability}
>> +
>> +The driver SHOULD use the offered buffer in preference to passing system
>> +memory addresses to the device. If the driver accepts the VIRTIO_F_SWIOTLB
>> +feature, then the driver MUST use the offered buffer and never pass system
>> +memory addresses to the device.
>> +
>>  \subsubsection{PCI configuration access capability}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / PCI configuration access capability}
>>  
>>  The VIRTIO_PCI_CAP_PCI_CFG capability
>> -- 
>> 2.49.0
>>
>
>
> So on the PCI option. The normal mapping (ioremap) for BAR is uncached. If done
> like this, performance will suffer. But if you do normal WB, since device
and this even possibly can cause TLB thrashing.... which is a worse case.

Thanks
Zhu Lingshan
> accesses do not go on the bus, they do not get synchronized with driver
> writes and there's really no way to synchronize them.
>
> First, this needs to be addressed.
>
> In this age of accelerators for everything, building pci based
> interfaces that can't be efficiently accelerated seems shortsighted ...
>


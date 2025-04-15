Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF3613EFE3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744697944; cv=fail; b=aFrGIncec7l4H7ocUZilpcTxY8/rox1RIZOQ60G1NjnAdRIJqWN52RiIS0+yIb3+9/K/gSG9CKD0/m/m6qv/bOLUry3v/MH8HUhKnWED6kc9jHXelUrSnLs8TtSwKnjGy+hHFX4kexN1hw+zU2kB5P6iFaeKTR+LDsSgjt2OOWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744697944; c=relaxed/simple;
	bh=s8UXD27+UWLNdWBug+ERJWVrnbL0yAvvTknVJJDec0Q=;
	h=Content-Type:Message-ID:Date:Subject:To:References:From:
	 In-Reply-To:MIME-Version; b=oYGCNtcZqxgOwTikcc0NHVGw92/cn43iz7Q11vOrh1+PQZs5oUJ70GyPMfzoB8LBjTOarZzlwUjJzKSG6f7iwatqU+JhOgSEsaeylphNpJnMx4y8kYL0xsO1FnhYm8/pZ+qlE0IOYjTzgTaiK6SwyMWbWr2Ljy7VdzzoBziYXxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=k5482WW8; arc=fail smtp.client-ip=40.107.92.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="k5482WW8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1rijT4oyu9o3ZxgU+tAXToEdh+YPwmq/xijpqwFe1hML4pMwD4q26XHjlkTk52OvcLTCJIcwwrVi2SCTsbz3SG6qXYlejDxfQ8bTo11uu3kC7MlwFf9rXM7OOk9+v8pq5pBD1VanhIeGkwLVHVTZtw4mndFhXWV6uxpiwmLt599tc0TB/UKD2sCgSgvtMByDqGxAFcFo/nZ2EVmrojp/xMnIewSV/WitKjNRJZZf6o7tlb/s31uPN5d5kYeqfs9o+r+v7J0SX1V8tECdLh3cUvMfQPZpVFHiN4eIt+cZWCHKCi00jA7m6Xqc3m9a+Vm8SV8LBC+LrJjC6M6M8UpLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tQcW01eG/GLwElD2VxI2P1c3ZwjyhHm1ditRJrsBPA=;
 b=A8jUeVliDNnP5HaCGuObYIjPXlGvrvJKwMltDWxo5fAHarfHu0mAcTlwXT8wk+Djcn57ChRimC1TT3nKx2tAUjyBpn6MDXf0N8Iy/V6ck+Wptd8UCUMcTfnrBalS8hAnK0S1yHaU4L5iDXr7/oii18gVUeObXPylCz++5NQ5f5oDyHSOVaoNQy0WLfnZHvbPERaNXtJM42rqCQqACC4tS8hEANZ5yGp/6SvrCTC2EFvBTIHlPsW91+k1XvzZBuphVlTFwSLplA2vmMikEK7ChM0xCnH2SCW5WhjBKmNnkIYO5dDdmDmq380xG2uwobV6w9B6L9By98Z+0aa/6WVC8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tQcW01eG/GLwElD2VxI2P1c3ZwjyhHm1ditRJrsBPA=;
 b=k5482WW8FRFH0hsBojjcgVO/WBcd/tB3dMyqqDWubUE6A45aI+v+QlzwWjze2Oh/HCfme3zRUThUWgQe//i5lDe72EXeqCOGwbVdmXORLjJGCxB72mt6/UgaeZFyNuieiQjDMTTQXDuYoKZ/KoTfluEpG7McDHkA0ZHTQkXVblI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by PH7PR12MB7940.namprd12.prod.outlook.com (2603:10b6:510:275::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 06:18:57 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 06:18:57 +0000
Content-Type: multipart/mixed; boundary="------------mQ03c38kCJDsQBC7j3wBACPp"
Message-ID: <da6db2de-0f48-490b-8f91-a94e80d0567f@amd.com>
Date: Tue, 15 Apr 2025 11:48:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING in move_to_new_folio
To: syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <67fded75.050a0220.3483fc.0045.GAE@google.com>
 <ae35d5a9-c958-4cad-96fb-673e8bb9d46c@amd.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <ae35d5a9-c958-4cad-96fb-673e8bb9d46c@amd.com>
X-ClientProxiedBy: PN4PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2af::10) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|PH7PR12MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: 45e32b56-12a5-4cf6-e413-08dd7be56758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4053099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?am1TUFhIRkNNRjlHQkxVVFAvaW9TSmFESWJDamtVRVhzM3dsOFVCNmkxKzhv?=
 =?utf-8?B?ak1zL2QraU9vU1ozL29GUHhSNWV5aWw5cEwzblJsdVFLaVRoSDBBTUJiSVZ1?=
 =?utf-8?B?TXg4Mm1ZK25qL0ZKcWR6VmNUUmFUQVRZWG9jZDBnS242MWFSWTdRQjZQZmN2?=
 =?utf-8?B?ZUdxaFRnN0hNakMrSmh0blk0cUxnUEYzRmNrUkxORkpsbVNjRWdveUVvYU5Q?=
 =?utf-8?B?RXRrZmV4Vnp4V1dITkN0V0c5NVZ3ckFsZ3ZmWlJKV2tGTDl5MXJiV2E1RlpO?=
 =?utf-8?B?UEk5T2NxUmF2QUtSRTdRVTg2dC9yK3BId1V1MENIMm9iMlNHQ1A3eEtUMVg1?=
 =?utf-8?B?ZDZxM2lxRzZMNnVMRjZ5VnJQc01sYkhha2lPTWZDTGl0VUU3WDBoUHg2Zm02?=
 =?utf-8?B?UFZuclpiZlZWSGtEdzVKNFQvWlBIczVzajNOeGZaOXcxcGx2dlRvVE1wT1da?=
 =?utf-8?B?Y2djUHBBQWxYWCt4NWRsdmNKM1BFeGRScVVxVzg3bVUxenE1OWRkMTlGL1h4?=
 =?utf-8?B?S3hiYXRtdmNONTA5eUtUaEM0MWx1eCt4bFJxRHAzNDE4eTJhRVlDMXFaMXpn?=
 =?utf-8?B?QXFBMGFvZG5VMTVjdk9oKy9KM2NMQ0xxbVN3aG9lWVEwbTIxdm5KWk4zaXV1?=
 =?utf-8?B?eGVuYWIzakI3alFOZUdBS3o5ZEQrL0pUSDE2NEY5Y0Q2VWFFWUt0eUpKWC9T?=
 =?utf-8?B?ZytrSUg4a1ZJbzh4MytiZTR3YkRVYkhmNWppQ0ZDMVFOT3BwQU0rUjZlR0x2?=
 =?utf-8?B?d1VlT0Jjd1FNMld2V0xzdU5lQnQ3c3RXVTNwdHZEYkk5a3IxMzFUZ014SWJt?=
 =?utf-8?B?MjdWTFQ1S25mK1BnenlBcEJ4T3JhK2FnU3ZhbGFKVmdWSGcvakFEbGlHZ0kr?=
 =?utf-8?B?bkhSbXhOenBTNjFoR3BtcFAvaTJwQTIvVWlNK0p2Q0w2YjZnQkdyT3dTQ1Bn?=
 =?utf-8?B?NUxOa0t0OGpwRFplMFlwRXNhOGhuUU14UWhJNm5wTU04YTNkQVRma0VSd0hY?=
 =?utf-8?B?aGUrOEhraVlXbDhMRzE2aXNSb1lGR29Sa0tTR0Vla2VzOWV5MTZETEYzQzVv?=
 =?utf-8?B?aW1kV1Jybk4zQmxmenBDaVQzQUdCWjZKRjdwSitIYmE2UHkyd1RxWWxhQWNV?=
 =?utf-8?B?U0Y3ZlIwNU1KVUJaenlwSWdnU2V4ZzFBa3pqTllmNDlpc3AzcVkxdGJndUNM?=
 =?utf-8?B?SERVQ2h2amEzTVdKZDlUeWxhNU9CemE2RFdPcTNFaFUyTUNhTnFPV0lMWWx4?=
 =?utf-8?B?RTdHdVRUYWlWNGxNeWxVT3ZiU1BTbUFLbWNCam9Lc1c0Zi83dkdJL1lGNW96?=
 =?utf-8?B?UE5GeWFXV1RVK2NxWXFwUkVoQmttYmVOVHowRWI2Y1lJQXlPZmYyTkxtdlBi?=
 =?utf-8?B?WFg1Q0l3Mloxdi9UREpUMm0xU2Z5eG5ENmQ2bHBlNFRkMTdlVURnUmRIbEtr?=
 =?utf-8?B?RHVLUmF0YmFNcnZmeTdreGMzRktGaDFhWWZUNEtXOEpVMUFjMWRYVXBTZlk1?=
 =?utf-8?B?QklKOE1XMHZTMmh5bWhSa3RzWkJNRWl0cHpTOWpEM29NTnZKMXZHNWhBaWcr?=
 =?utf-8?B?YWRrNXRMRm52bVZUNWJ2N1FEZ0ttRDVLdUdYTngrdVp1QWtMZTNzamxrL2VF?=
 =?utf-8?B?ZXBRZk9leDR1bG5VOHpuWVhNMUM5WWNnaFlTVXhrWGpQU2ZuajBDMGJRcVg4?=
 =?utf-8?B?RGVtY0YzQWFMUWJrdlNqcUpzNFVCSUIyKzZMNXRvd2ZxZDR4VEE2VEVHL2VG?=
 =?utf-8?B?OFBLNENqQnNzYlFCaWNsUVRjL2d5Y3VBd2ZmN2luQVJVZU9NNUFTb1BzS1d0?=
 =?utf-8?Q?D2YjnHt51Y/urMfkmuqn2NVXzd4ao0p0QOCjk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnNHMk1CYy9OemN1ZzhUUzdOL0JGSUZhMklvaWF6Yk5KZVk0dmdOdU95YkNn?=
 =?utf-8?B?dElCUjd3aGt5Vnc2SnUzTWVVOWw1c0ZtOUZsRXVSam9zVzRWc1pRNGpXOCsr?=
 =?utf-8?B?WHNlN2cxOTlodm9OSE1hei8vQ0gybS95ZjQyeEZ4eUM5WDd5VDlpQzNMejFw?=
 =?utf-8?B?eS9kWkR0R1IzVTV4ZlpNTDlSK1pEL1BZaVEwNkZ5M1NZZnB4QkcyYi96ekZ4?=
 =?utf-8?B?ejVDbGV0c3hyem1tZWxiNTZEREtFQTZLUDY5Q2FrelZGbWFPaUwrUC9sSWFM?=
 =?utf-8?B?SmlDZ0xEMWxIM1JROTN1SXl6clpoZXVlOUYzOE4vWW9EK2kzSFhnSENLdGo3?=
 =?utf-8?B?cWJBRkJ6SUpDYVBLK2EycjJBdXU0WWdsKzByd1ExMmNPcytqem9ML1VqZmEr?=
 =?utf-8?B?dnUwMnBUZzNJN2U5QUg4WThwbWhoWFcxZTZ0alc2d3pnYUFOL2JBdmRwaGxz?=
 =?utf-8?B?QzNzbFROaEYwYzFJQk12R1RDMTgzVnAyd0IrM0pOL2V6RjZ6ZSsxV2F0WTB3?=
 =?utf-8?B?MnVaanZGRWxIV3VFd0lpRUh1K2hYOHhKODhEU0dZRE05LzkzS3ZrSDNONTE5?=
 =?utf-8?B?WXFoS0daT0hreVg4Z0Nhb0U5STgvK3ROMnpibzVLUWJ4RFhLWk14b3AyU09Y?=
 =?utf-8?B?elR2N2lxcWRHVDdLN3NoR3hUM2M0V041ZUxFeEFLOXVKNkd2MkNYTnBQeElX?=
 =?utf-8?B?dFZJZmkwVElGTmFlTFZOQmtVcUVEanlEVk9RdDNXaVpzWjhNckpCRDlOVmxX?=
 =?utf-8?B?cTViVTFQK01QdHpCWFhaNjZtYUw2V2I4alRBSzJTMnh1VkZBR1B5cUhHSG5s?=
 =?utf-8?B?bzBjTm1oaHRNcDBsQXF4U1VNTmJYYVZBRGZFYjZEU1Z3a3hnSGxxS2labTFO?=
 =?utf-8?B?SjhPR3dZeWJMdmhROC9wWmtSSFRPa2d5b3pJM1JLOHYrcGNHNXlaVWwvZTMv?=
 =?utf-8?B?WlBESEJMWkxTaDl2eFFRd0hzRFVUNFVjQmZkbzdPSTBjWG5PbDMxRnJXemRY?=
 =?utf-8?B?eURoZU9kZ1RoanZ6SWJNVEd4TGlubkh5L3gvNW9qYnNKWUFjMmMxV0hBcDFv?=
 =?utf-8?B?dFphQWRxU2lHdGl3RDAwNW5PbXZwN01tdjV6bXlZREpWaFd1UW03Zzk1TWlr?=
 =?utf-8?B?N0tzS0xJU2p3WGZmczhDWHJsNTFkT3EvYmJVT2tkeGs2cHk4Tm9iR1pNWDV5?=
 =?utf-8?B?aS9XOVVjUUx1UzdkekM5SzF3aU95WlpUb0JBNFRaYWVnLzFrZkxuM2RHK3B3?=
 =?utf-8?B?cnhkN1pRWnlhWUFTQjFZZlpST1VTYTRlM2h5TGpKWVZLM2tSVGsydzlGTllG?=
 =?utf-8?B?SGNRVXJkcUk1Mm1XKzR5UnlJMitWQUg3aEUzc0RlbVBJQ0tuTytFYlVZaGJR?=
 =?utf-8?B?K1FuSGoxdTJvNU9XUzJvRFk5eUNRbDh6RGt1OWlwNU9sZ3FMakdGYkxZd3Zv?=
 =?utf-8?B?QnhRTnhIT1kvZmxUYjIyVzVlbldUV1BXYnA5eUpRbVJpTURhQ0NvbTEzaHpP?=
 =?utf-8?B?S1hQSWRnNjIwMnROS3lkNDRxY2tFZkFYUGJzL1V5SHhxM29HVUVncEpVTXg4?=
 =?utf-8?B?UzJDU0tJOWltQmFRTnBQY3NRckZaZElicWZ0eFNHaDdwenhSMncwRTduQzlN?=
 =?utf-8?B?SzZtbjg2M1lxRmt3TzFURDgyYVZnOU8vNDZWdVltWTBtUE9jelloMFdkZGp1?=
 =?utf-8?B?SUhPUEpkUElqeno0NzAxTDI4KzJkUi9yZVBoQjVJWTE1SlQwMDJiMXdwOUxq?=
 =?utf-8?B?SEhXeDExNWhmcGhvUE1lMVh5bWJCcEp6SkpIcTA3SDJJYjNyc2tqZmdWNEpt?=
 =?utf-8?B?WVhjOS9NcUY0bmkzeDUwZzZZOVdSMFdKUWg0emk2Y3pJSmFkQ0hRYzYxZGhu?=
 =?utf-8?B?U0xqZFNHTDF0d2xTWHlMdjVWYkhEVW1QTUpDaWVaankxZmczSFk0TU1xbkw1?=
 =?utf-8?B?KytZeEt3blpBWkVSZU8rbHhhNGdNbXdyekxORlpPc0tESVZid0NwN3pXa0pX?=
 =?utf-8?B?ZXc1TWcvc1JFenFhSHZVTzlOOFNEWXFhWWJlOXV1QWZHbmhOZktXNzNubXUx?=
 =?utf-8?B?UlA4dDdzMEVreWxaMG1vS1lab1hJb2RtbDFlSkhtcDNjZWl0dnRPcFczdGhj?=
 =?utf-8?Q?oC+K5CcdqW3o1LH1DUe/bSIGB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e32b56-12a5-4cf6-e413-08dd7be56758
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 06:18:57.1961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMqOlmDneLIK3CzMZ+oVmv8W6VeeWZ+JyBBGFNwhRkDYg0Nwz/gPL57AGh32mGq2cf30CYuWRBVUAoQjBrpVmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7940

--------------mQ03c38kCJDsQBC7j3wBACPp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/15/2025 11:10 AM, Shivank Garg wrote:
> I made a mistake in insert_metapage. I hope my revised patch work.
> I'll post it to original list if this pass.
> 
> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 01c6df60d5d4
> 
> Best Regards,
> Shivank
> 
> On 4/15/2025 10:54 AM, syzbot wrote:
>> Hello,
>>
>> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
>> unregister_netdevice: waiting for DEV to become free
>>
>> unregister_netdevice: waiting for batadv0 to become free. Usage count = 3
>>
>>
>> Tested on:
>>
>> commit:         01c6df60 Add linux-next specific files for 20250411
>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1142f0cc580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=db03cefa26ecf825
>> dashboard link: https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299
>> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
>> patch:          https://syzkaller.appspot.com/x/patch.diff?x=107a60cc580000
>>
> 
> 

Looks like this error is unrelated and due to a different issue:
https://lore.kernel.org/lkml/20250414-double_hold_fix-v5-1-10e056324cde@narfation.org

Retesting with Sven Eckelmann's patch for batman-adv

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 01c6df60d5d4

Best Regards,
Shivank




--------------mQ03c38kCJDsQBC7j3wBACPp
Content-Type: text/plain; charset=UTF-8; name="revised-diff"
Content-Disposition: attachment; filename="revised-diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2ZzL2pmcy9qZnNfbWV0YXBhZ2UuYyBiL2ZzL2pmcy9qZnNfbWV0YXBhZ2Uu
YwppbmRleCBkZjU3NWE4NzNlYzYuLmQ0NDA1MzdkYjZmZSAxMDA2NDQKLS0tIGEvZnMvamZzL2pm
c19tZXRhcGFnZS5jCisrKyBiL2ZzL2pmcy9qZnNfbWV0YXBhZ2UuYwpAQCAtMTUsNiArMTUsNyBA
QAogI2luY2x1ZGUgPGxpbnV4L21lbXBvb2wuaD4KICNpbmNsdWRlIDxsaW51eC9zZXFfZmlsZS5o
PgogI2luY2x1ZGUgPGxpbnV4L3dyaXRlYmFjay5oPgorI2luY2x1ZGUgPGxpbnV4L21pZ3JhdGUu
aD4KICNpbmNsdWRlICJqZnNfaW5jb3JlLmgiCiAjaW5jbHVkZSAiamZzX3N1cGVyYmxvY2suaCIK
ICNpbmNsdWRlICJqZnNfZmlsc3lzLmgiCkBAIC0xNTEsNiArMTUyLDU0IEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCBkZWNfaW8oc3RydWN0IGZvbGlvICpmb2xpbywgYmxrX3N0YXR1c190IHN0YXR1cywK
IAkJaGFuZGxlcihmb2xpbywgYW5jaG9yLT5zdGF0dXMpOwogfQogCitzdGF0aWMgaW50IF9fbWV0
YXBhZ2VfbWlncmF0ZV9mb2xpbyhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywgc3RydWN0
IGZvbGlvICpkc3QsCisJCQkJICAgIHN0cnVjdCBmb2xpbyAqc3JjLCBlbnVtIG1pZ3JhdGVfbW9k
ZSBtb2RlKQoreworCXN0cnVjdCBtZXRhX2FuY2hvciAqc3JjX2FuY2hvciA9IHNyYy0+cHJpdmF0
ZTsKKwlzdHJ1Y3QgbWV0YXBhZ2UgKm1wc1tNUFNfUEVSX1BBR0VdID0gezB9OworCXN0cnVjdCBt
ZXRhcGFnZSAqbXA7CisJaW50IGksIHJjOworCisJZm9yIChpID0gMDsgaSA8IE1QU19QRVJfUEFH
RTsgaSsrKSB7CisJCW1wID0gc3JjX2FuY2hvci0+bXBbaV07CisJCWlmIChtcCAmJiBtZXRhcGFn
ZV9sb2NrZWQobXApKQorCQkJcmV0dXJuIC1FQUdBSU47CisJfQorCisJcmMgPSBmaWxlbWFwX21p
Z3JhdGVfZm9saW8obWFwcGluZywgZHN0LCBzcmMsIG1vZGUpOworCWlmIChyYyAhPSBNSUdSQVRF
UEFHRV9TVUNDRVNTKQorCQlyZXR1cm4gcmM7CisKKwlmb3IgKGkgPSAwOyBpIDwgTVBTX1BFUl9Q
QUdFOyBpKyspIHsKKwkJbXAgPSBzcmNfYW5jaG9yLT5tcFtpXTsKKwkJaWYgKCFtcCkKKwkJCWNv
bnRpbnVlOworCQlpZiAodW5saWtlbHkoaW5zZXJ0X21ldGFwYWdlKGRzdCwgbXApKSkgeworCQkJ
LyogSWYgZXJyb3IsIHJvbGwtYmFjayBwcmV2aW9zbHkgaW5zZXJ0ZWQgcGFnZXMgKi8KKwkJCWZv
ciAoaW50IGogPSAwIDsgaiA8IGk7IGorKykgeworCQkJCWlmIChtcHNbal0pCisJCQkJCXJlbW92
ZV9tZXRhcGFnZShkc3QsIG1wc1tqXSk7CisJCQl9CisJCQlyZXR1cm4gLUVBR0FJTjsKKwkJfQor
CQltcHNbaV0gPSBtcDsKKwl9CisKKwkvKiBVcGRhdGUgdGhlIG1ldGFwYWdlIGFuZCByZW1vdmUg
aXQgZnJvbSBzcmMgKi8KKwlmb3IgKGludCBpID0gMDsgaSA8IE1QU19QRVJfUEFHRTsgaSsrKSB7
CisJCW1wID0gbXBzW2ldOworCQlpZiAobXApIHsKKwkJCWludCBwYWdlX29mZnNldCA9IG1wLT5k
YXRhIC0gZm9saW9fYWRkcmVzcyhzcmMpOworCisJCQltcC0+ZGF0YSA9IGZvbGlvX2FkZHJlc3Mo
ZHN0KSArIHBhZ2Vfb2Zmc2V0OworCQkJbXAtPmZvbGlvID0gZHN0OworCQkJcmVtb3ZlX21ldGFw
YWdlKHNyYywgbXApOworCQl9CisJfQorCisJcmV0dXJuIE1JR1JBVEVQQUdFX1NVQ0NFU1M7Cit9
CisKICNlbHNlCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBtZXRhcGFnZSAqZm9saW9fdG9fbXAoc3Ry
dWN0IGZvbGlvICpmb2xpbywgaW50IG9mZnNldCkKIHsKQEAgLTE3NSw2ICsyMjQsMzIgQEAgc3Rh
dGljIGlubGluZSB2b2lkIHJlbW92ZV9tZXRhcGFnZShzdHJ1Y3QgZm9saW8gKmZvbGlvLCBzdHJ1
Y3QgbWV0YXBhZ2UgKm1wKQogI2RlZmluZSBpbmNfaW8oZm9saW8pIGRvIHt9IHdoaWxlKDApCiAj
ZGVmaW5lIGRlY19pbyhmb2xpbywgc3RhdHVzLCBoYW5kbGVyKSBoYW5kbGVyKGZvbGlvLCBzdGF0
dXMpCiAKK3N0YXRpYyBpbnQgX19tZXRhcGFnZV9taWdyYXRlX2ZvbGlvKHN0cnVjdCBhZGRyZXNz
X3NwYWNlICptYXBwaW5nLCBzdHJ1Y3QgZm9saW8gKmRzdCwKKwkJCQkgICAgc3RydWN0IGZvbGlv
ICpzcmMsIGVudW0gbWlncmF0ZV9tb2RlIG1vZGUpCit7CisJc3RydWN0IG1ldGFwYWdlICptcDsK
KwlpbnQgcGFnZV9vZmZzZXQ7CisJaW50IHJjOworCisJbXAgPSBmb2xpb190b19tcChzcmMsIDAp
OworCWlmIChtcCAmJiBtZXRhcGFnZV9sb2NrZWQobXApKQorCQlyZXR1cm4gLUVBR0FJTjsKKwor
CXJjID0gZmlsZW1hcF9taWdyYXRlX2ZvbGlvKG1hcHBpbmcsIGRzdCwgc3JjLCBtb2RlKTsKKwlp
ZiAocmMgIT0gTUlHUkFURVBBR0VfU1VDQ0VTUykKKwkJcmV0dXJuIHJjOworCisJaWYgKHVubGlr
ZWx5KGluc2VydF9tZXRhcGFnZShkc3QsIG1wKSkpCisJCXJldHVybiAtRUFHQUlOOworCisJcGFn
ZV9vZmZzZXQgPSBtcC0+ZGF0YSAtIGZvbGlvX2FkZHJlc3Moc3JjKTsKKwltcC0+ZGF0YSA9IGZv
bGlvX2FkZHJlc3MoZHN0KSArIHBhZ2Vfb2Zmc2V0OworCW1wLT5mb2xpbyA9IGRzdDsKKwlyZW1v
dmVfbWV0YXBhZ2Uoc3JjLCBtcCk7CisKKwlyZXR1cm4gTUlHUkFURVBBR0VfU1VDQ0VTUzsKK30K
KwogI2VuZGlmCiAKIHN0YXRpYyBpbmxpbmUgc3RydWN0IG1ldGFwYWdlICphbGxvY19tZXRhcGFn
ZShnZnBfdCBnZnBfbWFzaykKQEAgLTU1NCw2ICs2MjksMjQgQEAgc3RhdGljIGJvb2wgbWV0YXBh
Z2VfcmVsZWFzZV9mb2xpbyhzdHJ1Y3QgZm9saW8gKmZvbGlvLCBnZnBfdCBnZnBfbWFzaykKIAly
ZXR1cm4gcmV0OwogfQogCisvKioKKyAqIG1ldGFwYWdlX21pZ3JhdGVfZm9saW8gLSBNaWdyYXRp
b24gZnVuY3Rpb24gZm9yIEpGUyBtZXRhcGFnZXMKKyAqLworc3RhdGljIGludCBtZXRhcGFnZV9t
aWdyYXRlX2ZvbGlvKHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLCBzdHJ1Y3QgZm9saW8g
KmRzdCwKKwkJCQkgIHN0cnVjdCBmb2xpbyAqc3JjLCBlbnVtIG1pZ3JhdGVfbW9kZSBtb2RlKQor
eworCWludCBleHBlY3RlZF9jb3VudDsKKworCWlmICghc3JjLT5wcml2YXRlKQorCQlyZXR1cm4g
ZmlsZW1hcF9taWdyYXRlX2ZvbGlvKG1hcHBpbmcsIGRzdCwgc3JjLCBtb2RlKTsKKworCS8qIENo
ZWNrIHdoZXRoZXIgcGFnZSBkb2VzIG5vdCBoYXZlIGV4dHJhIHJlZnMgYmVmb3JlIHdlIGRvIG1v
cmUgd29yayAqLworCWV4cGVjdGVkX2NvdW50ID0gZm9saW9fZXhwZWN0ZWRfcmVmcyhtYXBwaW5n
LCBzcmMpOworCWlmIChmb2xpb19yZWZfY291bnQoc3JjKSAhPSBleHBlY3RlZF9jb3VudCkKKwkJ
cmV0dXJuIC1FQUdBSU47CisJcmV0dXJuIF9fbWV0YXBhZ2VfbWlncmF0ZV9mb2xpbyhtYXBwaW5n
LCBkc3QsIHNyYywgbW9kZSk7Cit9CisKIHN0YXRpYyB2b2lkIG1ldGFwYWdlX2ludmFsaWRhdGVf
Zm9saW8oc3RydWN0IGZvbGlvICpmb2xpbywgc2l6ZV90IG9mZnNldCwKIAkJCQkgICAgc2l6ZV90
IGxlbmd0aCkKIHsKQEAgLTU3MCw2ICs2NjMsNyBAQCBjb25zdCBzdHJ1Y3QgYWRkcmVzc19zcGFj
ZV9vcGVyYXRpb25zIGpmc19tZXRhcGFnZV9hb3BzID0gewogCS5yZWxlYXNlX2ZvbGlvCT0gbWV0
YXBhZ2VfcmVsZWFzZV9mb2xpbywKIAkuaW52YWxpZGF0ZV9mb2xpbyA9IG1ldGFwYWdlX2ludmFs
aWRhdGVfZm9saW8sCiAJLmRpcnR5X2ZvbGlvCT0gZmlsZW1hcF9kaXJ0eV9mb2xpbywKKwkubWln
cmF0ZV9mb2xpbwk9IG1ldGFwYWdlX21pZ3JhdGVfZm9saW8sCiB9OwogCiBzdHJ1Y3QgbWV0YXBh
Z2UgKl9fZ2V0X21ldGFwYWdlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHVuc2lnbmVkIGxvbmcgbGJs
b2NrLApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9taWdyYXRlLmggYi9pbmNsdWRlL2xpbnV4
L21pZ3JhdGUuaAppbmRleCBhYWEyMTE0NDk4ZDYuLmNiMzFjNWIxZWI2YSAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9saW51eC9taWdyYXRlLmgKKysrIGIvaW5jbHVkZS9saW51eC9taWdyYXRlLmgKQEAg
LTYwLDYgKzYwLDcgQEAgc3RydWN0IG1vdmFibGVfb3BlcmF0aW9ucyB7CiAvKiBEZWZpbmVkIGlu
IG1tL2RlYnVnLmM6ICovCiBleHRlcm4gY29uc3QgY2hhciAqbWlncmF0ZV9yZWFzb25fbmFtZXNb
TVJfVFlQRVNdOwogCitpbnQgZm9saW9fZXhwZWN0ZWRfcmVmcyhzdHJ1Y3QgYWRkcmVzc19zcGFj
ZSAqbWFwcGluZywgc3RydWN0IGZvbGlvICpmb2xpbyk7CiAjaWZkZWYgQ09ORklHX01JR1JBVElP
TgogCiB2b2lkIHB1dGJhY2tfbW92YWJsZV9wYWdlcyhzdHJ1Y3QgbGlzdF9oZWFkICpsKTsKZGlm
ZiAtLWdpdCBhL21tL21pZ3JhdGUuYyBiL21tL21pZ3JhdGUuYwppbmRleCA2ZTI0ODhlNWRiZTQu
LjBmMDFiOGE4N2RlYyAxMDA2NDQKLS0tIGEvbW0vbWlncmF0ZS5jCisrKyBiL21tL21pZ3JhdGUu
YwpAQCAtNDQ1LDcgKzQ0NSw3IEBAIHZvaWQgcG1kX21pZ3JhdGlvbl9lbnRyeV93YWl0KHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tLCBwbWRfdCAqcG1kKQogfQogI2VuZGlmCiAKLXN0YXRpYyBpbnQgZm9s
aW9fZXhwZWN0ZWRfcmVmcyhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKK2ludCBmb2xp
b19leHBlY3RlZF9yZWZzKHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAogCQlzdHJ1Y3Qg
Zm9saW8gKmZvbGlvKQogewogCWludCByZWZzID0gMTsKQEAgLTQ1OCw2ICs0NTgsNyBAQCBzdGF0
aWMgaW50IGZvbGlvX2V4cGVjdGVkX3JlZnMoc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcs
CiAKIAlyZXR1cm4gcmVmczsKIH0KK0VYUE9SVF9TWU1CT0xfR1BMKGZvbGlvX2V4cGVjdGVkX3Jl
ZnMpOwogCiAvKgogICogUmVwbGFjZSB0aGUgZm9saW8gaW4gdGhlIG1hcHBpbmcuCmRpZmYgLS1n
aXQgYS9uZXQvYmF0bWFuLWFkdi9oYXJkLWludGVyZmFjZS5jIGIvbmV0L2JhdG1hbi1hZHYvaGFy
ZC1pbnRlcmZhY2UuYwppbmRleCBmMTQ1Zjk2NjI2NTMuLjdjZDRiZGNlZTQzOSAxMDA2NDQKLS0t
IGEvbmV0L2JhdG1hbi1hZHYvaGFyZC1pbnRlcmZhY2UuYworKysgYi9uZXQvYmF0bWFuLWFkdi9o
YXJkLWludGVyZmFjZS5jCkBAIC03MjUsNyArNzI1LDYgQEAgaW50IGJhdGFkdl9oYXJkaWZfZW5h
YmxlX2ludGVyZmFjZShzdHJ1Y3QgYmF0YWR2X2hhcmRfaWZhY2UgKmhhcmRfaWZhY2UsCiAKIAlr
cmVmX2dldCgmaGFyZF9pZmFjZS0+cmVmY291bnQpOwogCi0JZGV2X2hvbGQobWVzaF9pZmFjZSk7
CiAJbmV0ZGV2X2hvbGQobWVzaF9pZmFjZSwgJmhhcmRfaWZhY2UtPm1lc2hpZl9kZXZfdHJhY2tl
ciwgR0ZQX0FUT01JQyk7CiAJaGFyZF9pZmFjZS0+bWVzaF9pZmFjZSA9IG1lc2hfaWZhY2U7CiAJ
YmF0X3ByaXYgPSBuZXRkZXZfcHJpdihoYXJkX2lmYWNlLT5tZXNoX2lmYWNlKTsK

--------------mQ03c38kCJDsQBC7j3wBACPp--

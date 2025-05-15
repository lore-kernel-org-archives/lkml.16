Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABA8191
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747267826; cv=fail; b=a712V5JR75kSl4r+daog3U1lY9fjNf6rMEH3vNX/w6a/VB9iVgMAqBaLzOofbsqFmAlaGaBlECBlUaftQlqEdnCPbY9kno70X2NQ0PIbi1mEOGo6af5rU3Wjx1NRYafUZ8GH4BR3aNF+dTBAHJotsVfQee51f7brxIcnNveZMgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747267826; c=relaxed/simple;
	bh=uJVXT6iaeATiE51fkb/rZvuqgLFcOrYRuXB2HgF9W3U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y8o9T+z//FyhvN75GPaA3QbFNd4Ab9pmDFt1uA3nx5k8m6vketMYjGH+7wftZT+VWipU48nrvTJ56x+UH6Twd8ZzGDLozqfmXAU+KXl+YOMUskvFnnF+zWb0Uo9Ks27hCMJ8D2Pny/3P4kTfR2/Fo8Xj94T6skwIuRULfOA1OMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WfO7ErFV; arc=fail smtp.client-ip=40.107.243.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WfO7ErFV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOu1l+Guww7OglQ+oMCZ23TMSbXwgre17DRNUH9aZh5clR8h/FO4xT0kv7srt6dDVKWOwDke7+8W/UDVIFYTtvK/stpe4o4i1ZRQMM9804OVeVxtBHQ6qgheg01efHGhUjp1tSjLBNFO6eRAeoqETFGh2FdWb1T7US8JfUODNss3TTN2MXZT7PERRUY4rE009cHBHVS12enMPGW2e4wGenF4r3tm5W75bJLeKI3g4wNFX6g7g5r60MV9Ei8FCYd7kpjj5/2zv3BcXk7ccH7UzLDQpEe5R8HokftfLzMjryosPeKv8CfsVEuu1SAfSqiZpv1xAw7aFBbcCe0smwziFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRFwtKnKAkgX2a147TSPjUCAIXWzQaLKVb6iearjTik=;
 b=ulYqQFN7uOJRCpNMu3LG7RPkRzokK/fMkQmdguPstnlvxaXjWM+9vKESsjc96pKU/HceGS38hKqJdpdwdy7fv4n4dpxac5jY/qd+C/3aWNWXMPX5qikCMTXb3IZH+m7ptpCeus5Qy8PclQ6IrjJGEfjd2a6Hy24aZAEPZMGfgLagIcUnJZ9pB1i3qijj2hpzu8/5K0spyDEYrjVuZN7QlTiqxXrvxWFhYOp2+WGghyToX+QSRjmxAZ77o43eG4VLpyrh2ltSlqLqJdwRPxuLWgC58taTFK1+HDsVmP+Oz1A4vKTpRkxXfT0Zf6Ol6QYQSACn6s3nPmublJSbun/v3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRFwtKnKAkgX2a147TSPjUCAIXWzQaLKVb6iearjTik=;
 b=WfO7ErFVuWUv4ILD/AHCLSveFuDm8LdfCY7lkWaDJgI6m4m5AoOO7i2o0S4RZKh7qs+ljBPuIfIr5xjK5VFgPqHQtpDSTqijMYbSB0UJdkas8SGkkx8Y2qMmZBFvTYiew9aSh0CQfgyPUeItQWM7Cp6cLBmlKNm6UYZFj90+ndMmcZKhlxWfuToKTdqgJqKtIs+5b0SyZYPGDz4jHiNPMbQkE/2MOFfUqk8XO2SAy+1ooiBotgWL2rZLos4IDLZdSFCfZ1nZskUJDyV3f6VPVssNOZFFfgnwvYOBXFILd3aMSHO0t59SIEiRYw9qiNJaTES8+p7qxe20sRZwAqxC8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 CY8PR12MB7681.namprd12.prod.outlook.com (2603:10b6:930:84::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.32; Thu, 15 May 2025 00:10:19 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 00:10:19 +0000
Message-ID: <471ad597-c803-4f13-908e-17572aabe212@nvidia.com>
Date: Wed, 14 May 2025 17:10:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 12/30] x86/resctrl: Expand the width of domid by
 replacing mon_data_bits
To: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Tony Luck
 <tony.luck@intel.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20250513171547.15194-1-james.morse@arm.com>
 <20250513171547.15194-13-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250513171547.15194-13-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR20CA0004.namprd20.prod.outlook.com
 (2603:10b6:510:23c::12) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|CY8PR12MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 34df9660-3467-497b-7b7e-08dd9344e093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTFPeVRxYTRST09ZbHVKTmpMWFQ5bnFRWEh0bS8xRHcvUnpYYzRLZ1NpSXcx?=
 =?utf-8?B?SDY3VXJpTVdScWZUUnppMTVSRml0Y0VtNDU0cFVWeTdQa2VXQjcxdU9WN2xF?=
 =?utf-8?B?azJUZ2JCVU1yTTNOeFZEZVZybzZOU056R3VHdGl4ay9FZGpPekZRU0lqWEFk?=
 =?utf-8?B?M0ovTlJGN05DY0tzRGJXTHVMTkE1ekpjdHIyZ2l6RTR3Vi9VNUQzVjkrWHI3?=
 =?utf-8?B?bUxzR2VmQ1czaXFpaWYxZEpNbTQ0eWhJYkxWUndFdG84Y0pvWnNOUzIrQ3k2?=
 =?utf-8?B?RkYzZ0Z3ZzM0UkJhUFFrN3VnZEdLejlWNE02aGtVK0VUU0pVcW5HZ2I4U1Jz?=
 =?utf-8?B?bWU0UXYxUjZSb0NhVFpBejcxTk5RMkUybURQbW0vNWF1RlFrb2hBcTVVbGFC?=
 =?utf-8?B?NlJWVWZYbnRsSGs2ZC8rc2tDWjAzYWpXeHRxeWtWQ3paWkdrUEhzbTg1TDNr?=
 =?utf-8?B?UHVIdE51NnE3M0NPTkxwN1E5R3RYbW52V3J2RGhxaW9wQks5S2NMK0hXcm8w?=
 =?utf-8?B?VmJCMXVyZFkrQUk5VmpkL2pvdlREQmF5KzFrUk1RNG54YVpLYzFjb29pSmJk?=
 =?utf-8?B?QTFHeHdRcStJWDloUTlsQzRpWHA5QllFTHczRzJ2aXNxRlk0eC9aZjlHWDZ3?=
 =?utf-8?B?cVA3UElRY0J6VE00Snl1Mzh0SVlHYUZuckgrSXFJcU1JNFkxZlhzN2Q5dWxr?=
 =?utf-8?B?enB3KzhyQUJNYVNvcTlVOVNuZkQ0T1NJU2NXQ2trNlV3Ty9Jb1ByZ21RMnhv?=
 =?utf-8?B?NGZFTnBzRmRITU1oYS85Yk40MytCMVJibmVrVGtEN3M3aFlIc3oyQ0RJdGZK?=
 =?utf-8?B?bUltWmtLZEE1cVZwQmhQMDZ6QWdTL3Yzb2gxN0dacnRGclF4SWgzM0Q2N1pj?=
 =?utf-8?B?RHlpK3dLaWNZdEV0d21LU2swcU10a2VwQXdpRDd6VE5PaElLL01ZcXZtdTA1?=
 =?utf-8?B?MXBFNDdNRXBETUNmWnRVeXlnL0t4UlhwMFZJNTVKU044NHRvbHpacFV1dlRF?=
 =?utf-8?B?VGNJbnpWQm9KbERScVlqSXNYdzJHcjArM2trNVJrS3VXM1FHOFQ5RU1iZmpm?=
 =?utf-8?B?V25hcUVxWFhHUjJJVnk5TDlZRlVEcldrb0RHNEZQTHZYQVBmR3ZHUVl2a0V2?=
 =?utf-8?B?Z2FXNFBaZmxBMFBweFNkTmNWUlhrTHQrNCtMRkhUbFZyeVVMYUZBQ3NNaUVn?=
 =?utf-8?B?Yi8xT1FwVjRYQzlEU0piTG1qOGhYY01QSlFyOVNEOStLTVZqbWRadTZaL1Jn?=
 =?utf-8?B?dDIvMDdUMDU1d0Z1UFM3WGNmOUVDaTljYVhBRldFYXRmd0ZWZDlhUkE4VU5X?=
 =?utf-8?B?cXc3RG85Q3RURW4wQUU1RTc4V20zajdOVDlncjJzaHBCbUUzTThTZWVTOGda?=
 =?utf-8?B?Y2RCVUdXM2JkTkZEVUU5QldHZEszcFJ2MHRFaWV1NEw4S1NPVVpaRWNlQ1pZ?=
 =?utf-8?B?emRZNklSZnBUcCtUV2NuYjVmRWtYSXhpMURWZDkyYzNNeStoWS9CYWgzWVBv?=
 =?utf-8?B?cVRhTCt6V0wrb2hOS1UzalFDS3NPMjFpSHEzc0dsc2ZWOW5zb0ovTUxUU01p?=
 =?utf-8?B?Ui9VdncrVzhnd1Q0T0k0emtPQWx3OXM3Zk1SYjNWelVOd3g5QmREdFpFWVBm?=
 =?utf-8?B?RytZVi9waVJyNzdOb2Fzd2lhU0ZBZmJ2aG5GS1VCZ2EvcVpJelVPQVBKdjFi?=
 =?utf-8?B?TWRqN3U3dHpPK2ZDWTdDenV2OU13dklJbnllUTFTK0JIcVEvRlZlSGdhQy9H?=
 =?utf-8?B?UmZwWFIrMEpPcUZjaWx0ZmJ4bnhIM1RORXdxREtDU2F1a3dOYUIxOXY0Y2pO?=
 =?utf-8?B?ZTc3UW5JUkdvVW1TdlU2KzBRMWVBRHY2K0VhNk1YWlhoemp3c3ZBang5eHVm?=
 =?utf-8?B?aHZNUTUydEJmZ2xOYkJaU0tTRWg1Mm5lTG0rL1c0YnkwU3JaZnAvb2xxd2k0?=
 =?utf-8?Q?OxwMrA9Sz9Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1BSZU1nRVdjWXk4OWlwaml1UlJWcGpnMVRneXR4R3BrMWZ5Z29lU3ZoRmdQ?=
 =?utf-8?B?UnlYanhRSWc2OFpIS1lkRUxMQ3VVdUl2dTlDNXp5OFgzR0RzbXdDc2ZUcXpM?=
 =?utf-8?B?MFJpZ1F4bTcvTEliSzBZWXdEeTRPNkNuaHdYSG52UEtpVjYycHg5dHZVT3V1?=
 =?utf-8?B?UjZuWmd6NUd2bFhlNktES0pxNm13ZklSNlhNT0pHNFpkSkUrem9qc3l4Skw5?=
 =?utf-8?B?akhDN2lqdndMU3FoSU9OWTJSZkhLRUEwQW4yZlBQOG9yb2tKeTY0VkV5M0k0?=
 =?utf-8?B?MUkxM2JBTlFLcys2MG9hVmhiN0I2bXFCWjlSTzZKRDk1anMvRHlTYStYTTA0?=
 =?utf-8?B?cHNOYlFZQXBaSTlyY1Y0OHRqeW5LYXVkMUhYZ2xXNm1oWVpxSE9KVGU4QXox?=
 =?utf-8?B?QWFRTUpyYTU5TzhkdXVybTVha2tzaU10WWlkVnd1TjQ2K0gra1c5amlHRUND?=
 =?utf-8?B?aWhmMjJ5YlRaMW5uYUd6UmU2Y2V6ck1hOEN6cVliajQ1UnNjdWVDeVAvMjJj?=
 =?utf-8?B?Z0ZVU25aUFpQUnQrQTN4N2xrU0llZTExNVZjYU1oL04xSzFUOXBIbG9FSEhn?=
 =?utf-8?B?YU1hMjFDVE9DMVNiVDBaMEExQ29WVlNLeEtNYkxjc28wQ2hrZlFHWEZ4ZTBU?=
 =?utf-8?B?bGVzakxUVkJWa0hKZ0wrc0hIRUoxaHhoYmlmUWl2NlhyU2NhSVdtOWp0Vjl4?=
 =?utf-8?B?UlN6K0xPb0R4U21hV3I5VUExeUk3M1NPTWVPKzFUMmUya2krTlBSMVVvTzY2?=
 =?utf-8?B?OEdCQUpqYmd5ZUVrUnVHMWJodFB5ZHRRK1VDVlNsZU5sVWVVYVMrNloxb00r?=
 =?utf-8?B?TXJTYyttVFE2eitUY0pabWJ6NFNtblpGZ2czTGpnREhoa2dMcE91bmsrc1F6?=
 =?utf-8?B?ZlZZaFpkQXJXZnV0OGpIemhTUGF2NFY0cFpBb09XT29CdlNUUUd2dEVsL0xY?=
 =?utf-8?B?Qk1NZUNpUHJzRGVnV01FTzdXV0Nub2pnN0FRSjFSS0NGdEhEQWJpUmxqZUNC?=
 =?utf-8?B?VHJTNUJ6ZStxZ20wSzlnS1AvendLVkpnZTBSWFN6Q0o5SjhFL3RENnVwM3p2?=
 =?utf-8?B?aE1FTkhNa0tPNzliaUxKZGRMTnNpeFFDS3FlNTg3QkZzQXV5akpid0RoMUc2?=
 =?utf-8?B?NytNcVRORkNQMnROSzAxblNGU2dKVUxFL01HcVdVc3NyTlNDVlNoZGtuSW5s?=
 =?utf-8?B?Y216eVN1S25KTGROV1pZa0FZUjZWN29Rb2lNMzFxMzU1UEVzZXBuTis1bHZS?=
 =?utf-8?B?TUZWZHJPSlcwb2MvWGFRVUZTaWkwSmsxSVNJbzlpRVAvYmE5THpWVjltbEZt?=
 =?utf-8?B?QWx2VjBuUUwxcFY2SmZtczNQSHhISHZJWW85c3lmV1JXcFZwbER6MjVBaUc0?=
 =?utf-8?B?NWcyU0J0VnFHdWNXV1owekVnQ2tkNnZkZDBEYkkyRkZYanBuQWFxall1ak1l?=
 =?utf-8?B?SUZId2E4YnR1djJZRTY3Q3VtZWYrRjBpNm9CemdkZEpWVVpqeDNHcS9wem1H?=
 =?utf-8?B?SFY4RTgwTFdUcWhObysrZ2FrZGMyYUNIeVIrWjFkMkgvTDM0MCtqWkpRMWpC?=
 =?utf-8?B?d3I2OEdWUTRLcDhmcG5qaURjejNnNjFrOFhkWVQ0QTdKMzhnblR4Qkc1alhp?=
 =?utf-8?B?UzcyeFM0SDZ3eEpqdFZpR3NvUEM1L2tsRUJRZVpBd3ZXcjBIQkpMWEwzQ3Yr?=
 =?utf-8?B?Z0t6YVVjVGpONjQ0WVZHaXVpSnAwZXc2RkFNanp3amtzS0hJeDBrWjF5S05p?=
 =?utf-8?B?YU9qTSswdnp1Y2FkVW9tWC9wNTZjYVVFRXFOazNQRmpTOUgrTzByZVliNlJk?=
 =?utf-8?B?cllGK2xEdVlQVFFPS2RoU0h1U2ZSRUVXUXhHVTNjRi9UNHpNUDNQWlJtMFFt?=
 =?utf-8?B?elUvcDlCMk9qcms1d0pOcFAzanEwSi94Y2tQSW5aR1ZXZTg0d1NaQzd4OGhv?=
 =?utf-8?B?MGw3Qm5ZcFduWmtTUVpSUjl4T0d0ZkQyNjBzVXg2a3lkOUkwTFd1alIwVXN4?=
 =?utf-8?B?cWhpT0k0YVBObjB3c2tmWmxwT3ZKMnozbGMwY1dmQTd0TnByVUxlMENtWmwz?=
 =?utf-8?B?WG82MVVxanZwWEVzRFh2OWFmWVYwZUdqcXNnSkVoMVhMNW41QmlUUnlZZ0ZL?=
 =?utf-8?Q?afaQGLVgE03nfIiXlSeGYc2XD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34df9660-3467-497b-7b7e-08dd9344e093
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 00:10:19.3037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5a7gQHo7/PK0pSBkpmj6A3e3jbOaQ85ehypakUFO3pmuRr4Pl2MS7zXNrJYAhKS/xBSr7S8EdsHdUNq5qaHGHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7681


On 5/13/25 10:15, James Morse wrote:
> MPAM platforms retrieve the cache-id property from the ACPI PPTT table.
> The cache-id field is 32 bits wide. Under resctrl, the cache-id becomes
> the domain-id, and is packed into the mon_data_bits union bitfield.
> The width of cache-id in this field is 14 bits.
>
> Expanding the union would break 32bit x86 platforms as this union is
> stored as the kernfs kn->priv pointer. This saved allocating memory
> for the priv data storage.
>
> The firmware on MPAM platforms have used the PPTT cache-id field to
> expose the interconnect's id for the cache, which is sparse and uses
> more than 14 bits. Use of this id is to enable PCIe direct cache
> injection hints. Using this feature with VFIO means the value provided
> by the ACPI table should be exposed to user-space.
>
> To support cache-id values greater than 14 bits, convert the
> mon_data_bits union to a structure. These are shared between control
> and monitor groups, and are allocated on first use. The list of
> allocated struct mon_data is free'd when the filesystem is umount()ed.
>
> Co-developed-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Babu Moger <babu.moger@amd.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

> ---
> Previously the MPAM tree repainted the cache-id to compact them,
> argue-ing there was no other user. With VFIO use of this PCIe feature,
> this is no longer an option.
>
> Changes since v9:
>   * Used more specific enum types for resid/rid and evtid.
>
> Changes since v8:
>   * Removed underscore in dom_id in the patch subject.
>   * Change types in struct mon_data to match the data.
>   * Renamed the global list to be more descriptive.
>   * Numerous comments were clarified.
>
> Changes since v7:
>   * Replaced with Tony Luck's list based version.
>
> Changes since v6:
>   * Added the get/put helpers.
>   * Special case the creation of the mondata files for the default control
>     group.
>   * Removed wording about files living longer than expected, the corresponding
>     error handling is wrapped in WARN_ON_ONCE() as this indicates a bug.
> ---
>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 24 ++++---
>   arch/x86/kernel/cpu/resctrl/internal.h    | 39 ++++++-----
>   arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 79 +++++++++++++++++++++--
>   3 files changed, 106 insertions(+), 36 deletions(-)
>
> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> index 0a0ac5f6112e..110b534d400c 100644
> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> @@ -661,14 +661,15 @@ void mon_event_read(struct rmid_read *rr, struct rdt_resource *r,
>   int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>   {
>   	struct kernfs_open_file *of = m->private;
> +	enum resctrl_res_level resid;
> +	enum resctrl_event_id evtid;
>   	struct rdt_domain_hdr *hdr;
>   	struct rmid_read rr = {0};
>   	struct rdt_mon_domain *d;
> -	u32 resid, evtid, domid;
>   	struct rdtgroup *rdtgrp;
>   	struct rdt_resource *r;
> -	union mon_data_bits md;
> -	int ret = 0;
> +	struct mon_data *md;
> +	int domid, ret = 0;
>   
>   	rdtgrp = rdtgroup_kn_lock_live(of->kn);
>   	if (!rdtgrp) {
> @@ -676,17 +677,22 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>   		goto out;
>   	}
>   
> -	md.priv = of->kn->priv;
> -	resid = md.u.rid;
> -	domid = md.u.domid;
> -	evtid = md.u.evtid;
> +	md = of->kn->priv;
> +	if (WARN_ON_ONCE(!md)) {
> +		ret = -EIO;
> +		goto out;
> +	}
> +
> +	resid = md->rid;
> +	domid = md->domid;
> +	evtid = md->evtid;
>   	r = resctrl_arch_get_resource(resid);
>   
> -	if (md.u.sum) {
> +	if (md->sum) {
>   		/*
>   		 * This file requires summing across all domains that share
>   		 * the L3 cache id that was provided in the "domid" field of the
> -		 * mon_data_bits union. Search all domains in the resource for
> +		 * struct mon_data. Search all domains in the resource for
>   		 * one that matches this cache id.
>   		 */
>   		list_for_each_entry(d, &r->mon_domains, hdr.list) {
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 576383a808a2..01cb0ff89c85 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -89,27 +89,26 @@ struct mon_evt {
>   };
>   
>   /**
> - * union mon_data_bits - Monitoring details for each event file.
> - * @priv:              Used to store monitoring event data in @u
> - *                     as kernfs private data.
> - * @u.rid:             Resource id associated with the event file.
> - * @u.evtid:           Event id associated with the event file.
> - * @u.sum:             Set when event must be summed across multiple
> - *                     domains.
> - * @u.domid:           When @u.sum is zero this is the domain to which
> - *                     the event file belongs. When @sum is one this
> - *                     is the id of the L3 cache that all domains to be
> - *                     summed share.
> - * @u:                 Name of the bit fields struct.
> + * struct mon_data - Monitoring details for each event file.
> + * @list:            Member of the global @mon_data_kn_priv_list list.
> + * @rid:             Resource id associated with the event file.
> + * @evtid:           Event id associated with the event file.
> + * @sum:             Set when event must be summed across multiple
> + *                   domains.
> + * @domid:           When @sum is zero this is the domain to which
> + *                   the event file belongs. When @sum is one this
> + *                   is the id of the L3 cache that all domains to be
> + *                   summed share.
> + *
> + * Pointed to by the kernfs kn->priv field of monitoring event files.
> + * Readers and writers must hold rdtgroup_mutex.
>    */
> -union mon_data_bits {
> -	void *priv;
> -	struct {
> -		unsigned int rid		: 10;
> -		enum resctrl_event_id evtid	: 7;
> -		unsigned int sum		: 1;
> -		unsigned int domid		: 14;
> -	} u;
> +struct mon_data {
> +	struct list_head	list;
> +	enum resctrl_res_level	rid;
> +	enum resctrl_event_id	evtid;
> +	int			domid;
> +	bool			sum;
>   };
>   
>   /**
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index e2999f668593..d48078410d77 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -45,6 +45,12 @@ LIST_HEAD(rdt_all_groups);
>   /* list of entries for the schemata file */
>   LIST_HEAD(resctrl_schema_all);
>   
> +/*
> + * List of struct mon_data containing private data of event files for use by
> + * rdtgroup_mondata_show(). Protected by rdtgroup_mutex.
> + */
> +static LIST_HEAD(mon_data_kn_priv_list);
> +
>   /* The filesystem can only be mounted once. */
>   bool resctrl_mounted;
>   
> @@ -3093,6 +3099,63 @@ static void rmdir_all_sub(void)
>   	kernfs_remove(kn_mondata);
>   }
>   
> +/**
> + * mon_get_kn_priv() - Get the mon_data priv data for this event.
> + *
> + * The same values are used across the mon_data directories of all control and
> + * monitor groups for the same event in the same domain. Keep a list of
> + * allocated structures and re-use an existing one with the same values for
> + * @rid, @domid, etc.
> + *
> + * @rid:    The resource id for the event file being created.
> + * @domid:  The domain id for the event file being created.
> + * @mevt:   The type of event file being created.
> + * @do_sum: Whether SNC summing monitors are being created.
> + */
> +static struct mon_data *mon_get_kn_priv(enum resctrl_res_level rid, int domid,
> +					struct mon_evt *mevt,
> +					bool do_sum)
> +{
> +	struct mon_data *priv;
> +
> +	lockdep_assert_held(&rdtgroup_mutex);
> +
> +	list_for_each_entry(priv, &mon_data_kn_priv_list, list) {
> +		if (priv->rid == rid && priv->domid == domid &&
> +		    priv->sum == do_sum && priv->evtid == mevt->evtid)
> +			return priv;
> +	}
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return NULL;
> +
> +	priv->rid = rid;
> +	priv->domid = domid;
> +	priv->sum = do_sum;
> +	priv->evtid = mevt->evtid;
> +	list_add_tail(&priv->list, &mon_data_kn_priv_list);
> +
> +	return priv;
> +}
> +
> +/**
> + * mon_put_kn_priv() - Free all allocated mon_data structures.
> + *
> + * Called when resctrl file system is unmounted.
> + */
> +static void mon_put_kn_priv(void)
> +{
> +	struct mon_data *priv, *tmp;
> +
> +	lockdep_assert_held(&rdtgroup_mutex);
> +
> +	list_for_each_entry_safe(priv, tmp, &mon_data_kn_priv_list, list) {
> +		list_del(&priv->list);
> +		kfree(priv);
> +	}
> +}
> +
>   static void resctrl_fs_teardown(void)
>   {
>   	lockdep_assert_held(&rdtgroup_mutex);
> @@ -3102,6 +3165,7 @@ static void resctrl_fs_teardown(void)
>   		return;
>   
>   	rmdir_all_sub();
> +	mon_put_kn_priv();
>   	rdt_pseudo_lock_release();
>   	rdtgroup_default.mode = RDT_MODE_SHAREABLE;
>   	closid_exit();
> @@ -3208,19 +3272,20 @@ static int mon_add_all_files(struct kernfs_node *kn, struct rdt_mon_domain *d,
>   			     bool do_sum)
>   {
>   	struct rmid_read rr = {0};
> -	union mon_data_bits priv;
> +	struct mon_data *priv;
>   	struct mon_evt *mevt;
> -	int ret;
> +	int ret, domid;
>   
>   	if (WARN_ON(list_empty(&r->evt_list)))
>   		return -EPERM;
>   
> -	priv.u.rid = r->rid;
> -	priv.u.domid = do_sum ? d->ci->id : d->hdr.id;
> -	priv.u.sum = do_sum;
>   	list_for_each_entry(mevt, &r->evt_list, list) {
> -		priv.u.evtid = mevt->evtid;
> -		ret = mon_addfile(kn, mevt->name, priv.priv);
> +		domid = do_sum ? d->ci->id : d->hdr.id;
> +		priv = mon_get_kn_priv(r->rid, domid, mevt, do_sum);
> +		if (WARN_ON_ONCE(!priv))
> +			return -EINVAL;
> +
> +		ret = mon_addfile(kn, mevt->name, priv);
>   		if (ret)
>   			return ret;
>   

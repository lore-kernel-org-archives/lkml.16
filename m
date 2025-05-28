Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCC31E9919;
	Wed, 28 May 2025 19:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748459746; cv=fail; b=AS715DLUlXzNhtkBwYIsN9b1Se0RcskmiYEk5bOcI89SPnrJ+JT15XU5QXzi+LQZ2j+ABqvhUO3A7dePa9SQFkGdnIeWDvXi6TVZ4q2ubW+o09PrXPMuOyARAkHuXgzNI04MZZ40wWtq8RHfQDDcDPUWYEmfYQoaumaeTLR7i1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748459746; c=relaxed/simple;
	bh=bDdRtDOPXe1+MPkFGpqRxyQ9mrqbCs9QlK59clxbWkw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tmvSAZyzACi1jRi+qelTabmq9XZBwAUC2mg4PmFlNeCbN3DEAwdwO1SWCx3OMLSGT3bU/h6M2tqgq3hXpgf6QQzDz/ZlHQOUIH+7lUpUuY8fBPxvqRXcUwto06YsHzVBCKAV12MEY6kg48bTIYqRjECcoYJxlk9idbKP0OL81jU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yEdJx1Gm; arc=fail smtp.client-ip=40.107.93.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yEdJx1Gm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFU6lK1oILHrfqeuKzZa9dXYuv9jvkwuNWbcUSdF/0mN0ZKCSqKlpTp4IT0his/WQtA5r1h2pb7awhraziL0ndH+XDuS1EsLb+ZXOIY9AGSjuk36CVDnzzV+iEaGJqkJm+DCHF3Z00virFIwslbpDsSAwkIxyblDjTBySwh0v7N570UWzPsLrh+bjy7x+bKfc7mG0VvIxenO6dy+5FkqqteJGKigpEi7Lf3ev3JmFPiO7d1Y3F4edUU+AJKI3u5lDpUlVOEPjDLtvLKxe2dmFPW0OQb6Kem1kbxjFlpGqR3K8W+Mpo+FPcOCjytmUDqnsByWskTJV5hHNWWeb+AOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4hK4UichzP8x0eAF1hAi519jBK4jgKBiog4sa5tJKU=;
 b=iA5n71PMy+0We0DwQmx4+tHXO/istb+oBL0RL5X/I+eDhyITsbr22AOJdWao2R1hPuESaezqOKbYVsJhqmMc00zBrI3CsPHtxp3ilVWri9LihrDmMDTRyQWbwBXeZcSCUeh0Lc63EqpJAYL9wlUrof8DjdBZqe7z3+myNctx4gYDMyAKsKxW6Jc23uHdehi/wykDPvpWG8AIKd9eBTsimnJBA2+u3ICH2fuu9kJC77l0uLI6GeZ41SlfPpVdyAcG60zHUa1UyN4TzkjtyxAIFoG4h/NjjLrrdc4tLbELnagv5RGNWf07K2V6iQDO4vc69XQj3am3KcsVpsmk/QJ8wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4hK4UichzP8x0eAF1hAi519jBK4jgKBiog4sa5tJKU=;
 b=yEdJx1GmTtSdtavXV1qsWN9ZIfp5HMLrIgwhfkHr0vAFbBSmX0wwhI0cZ0kX+BsG2Gme+ny/ClDSwBzstgr2w4zGe71f3Pw96mb+KGFJ7vX0NDElLoVhOwmBDGLzYdCmZUPEtz6xTu37/GCCl9KsKuHR84PFcYUdHiJl+o+fpJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SA1PR12MB7102.namprd12.prod.outlook.com (2603:10b6:806:29f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 28 May
 2025 19:15:41 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Wed, 28 May 2025
 19:15:41 +0000
Message-ID: <2bbf9401-3a3c-448a-bcb9-9bd6317b1950@amd.com>
Date: Wed, 28 May 2025 14:15:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 10/27] x86/resctrl: Add data structures and
 definitions for ABMC assignment
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
 x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, alexandre.chartre@oracle.com,
 pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com,
 perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com,
 ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, maciej.wieczor-retman@intel.com, eranian@google.com,
 Xiaojian.Du@amd.com, gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <5fa043432aa1a697b11b0bd5fbd25a778014fb43.1747349530.git.babu.moger@amd.com>
 <63e37e50-10f6-4408-a89d-a5f4e8cd749c@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <63e37e50-10f6-4408-a89d-a5f4e8cd749c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN1PR12CA0106.namprd12.prod.outlook.com
 (2603:10b6:802:21::41) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SA1PR12MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb376a0-e0c1-4767-bd58-08dd9e1c0961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzI2ZzJud1pwNWl0ak4wcUtBdXRPWkp4dU9iNEZ0Z204RGVUYWNQWEFiTFN4?=
 =?utf-8?B?YzlPOWpReFJ6OHRuVzk3YlgvT2VoNmVRenlnMVNqV3NpVitIL3V2bFJtcGxm?=
 =?utf-8?B?Z01PVlU2OXNlNktPcy9QdnNEaTFmUU1IZE1BckM4Qm9UZGdxQk1qeFNiYjJp?=
 =?utf-8?B?ekpEYURaTHZKRTlDbGtrSjJlZUF2R3FRaCtFVVpaejhWeTdxR3BSUUlFK0Yv?=
 =?utf-8?B?TlYzeUJLeElwUTFyQkhuN3pta0krSU1LamtUbTJHdjJFTkRFejZtOGYxaFpu?=
 =?utf-8?B?ZWhyWHN2TlZueDFSRWd3d1JGa0tES3YwOEFQa3J6M2J0ODYyM2lDbUhrdDEr?=
 =?utf-8?B?RW9SaW9QUFJ4UnJ2cUlQbVMrRVFpSVdaZmt1Z0VPM3lBaDBVaGhlb0dCdGNp?=
 =?utf-8?B?OThFc2NXV0NjM3ZBZTJKQVJVQjZLWWs4SUJSMGw0V093c3lDdmVjZUZXeTVn?=
 =?utf-8?B?UkJIL3NLako5aThFVVdTdFZUeTZVS1BQbTMwdTdUMHBYWFpzcU5CNlRoTHEw?=
 =?utf-8?B?MTU3Y0t2aUxOUXpNMFpaamFvWG1QY29mMmlES1QwMjhpWlg3eDJkbmtDNk5O?=
 =?utf-8?B?WXZpUmdxcHkxdXEwTmIweDFRbUw3dU9Odjd0d3V5U01oYkJ2T0hMVk11L3hG?=
 =?utf-8?B?QmpHMWpBaWNKUHVUUkdCYWNKVDJGVkZIRG5QVVByMHRMRURYUkliODNmQ2N6?=
 =?utf-8?B?L3VJaUx0TE9KNkNGMEtXc2d4Z3h4K3dadGR5K0RKaWh0cXNDVVVQZC9Nc20y?=
 =?utf-8?B?eVYzOHlkL255TlFaWEwwTkZYZE1ySDI4OXE2dWJqTnRadkN3WTlrYW1USU9q?=
 =?utf-8?B?d2ZzT1BhWTJGcnQ3c3Nrd3JVYmo1OCtwVi9OUWs0QndXdGdyNHZjMEs4aDVJ?=
 =?utf-8?B?eEx4Mm1jbXd2eFR0S05aQ0lQc0ltc0dzRmYySVdoZ0d0dGNtNlNQRlFNSllN?=
 =?utf-8?B?WGg5UEorQVE3clJxQVJnNzFkZm1ZSWNkN2RLQ0Z2bFhicm5XSmI2Y3hiZGpO?=
 =?utf-8?B?THpVbDNaNDNRS1VOVk1zdldUTURXdGtyZGpSYXp0Q3hKRUJDa0ZnM2s1aC8y?=
 =?utf-8?B?QUNZTVhQckhHUjBhVVd2MWxseG5NYXRUUXBWVnVvVWV4R2hoQ2RweTA3dTFK?=
 =?utf-8?B?ZXhGUm5LdSs1VVNwdXF5emFCcmtuMnpZRmJ5QktYTmtOYi9tdHBjZkZ5a05K?=
 =?utf-8?B?bUV3N3Q1VklEOGdiU0Z3ckxnc2JOWEM3OHh0ekJGTXFKMGcrM2xmUWh3MUFu?=
 =?utf-8?B?NkhWMUQrR1RrcFVQd2E3SU9QN3ZQUVNMRHFmalZsZEw5M3J1dzA2dmNucFVj?=
 =?utf-8?B?dGFzY1I5NlhEL0E3QXJuREs4VFZpeUo2dG9Cd1ZOVEJwUWVpZXVoOVlydFN3?=
 =?utf-8?B?Mk12VTB3dExMV3V5eGlxTEtyN29RcmhnTk4rTGdkalVLeWxqVVkxQkJHNVBy?=
 =?utf-8?B?YmZaVUhIU01Nc29MUVVwdEkvbUhlaVZoby9Hak4xYVI0S3h0UHVhS1VqSUxt?=
 =?utf-8?B?V0hpZHZmd2xtSm9IWEkySjh6WmxoU0ZrZFhWRDY3S2toMVdqZEJMTU5wNkFz?=
 =?utf-8?B?aUZMcm1Help2VHNDcS84dW1jWHdyMXlVRGFIUWtkUDdEZ2JycHBjNWdxYm95?=
 =?utf-8?B?SHRNYy9sdlhvR3FITlpnT0hSbURxaUJwejVGb095YXVJOE1zYm5Fd1NPNXZV?=
 =?utf-8?B?cEJOYUxPUnpRWTZERldSVmhzWVhXUzJaNWRHV1ZxZjMyNW5Ud2k3cTk3ak5y?=
 =?utf-8?B?MW9RTXpwREg2T295NXMxR095akh4YWhwVm1JYjVISll3VXRiZlBvNGpjcTRW?=
 =?utf-8?B?eEo2Wk9VTS9hcTZRVWFWYmVWN3pJR0hsQUdONHlCOTZGTlN2c2RMOHU2Sy93?=
 =?utf-8?B?dXo0aXhwQkZxNUFsVUJYNzExcXRCaXdrV0lmSUowbHh0WXd0N3VQcmcvaTdn?=
 =?utf-8?Q?jFo8DdjNkYg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVpFK0F1SXpjTGUvTUVCclFsTHNyQnM1QTQxNWJEcDJoZFMvYW1LTUFha2VR?=
 =?utf-8?B?STFtQ3BhTUFBelJLcC9YcTNWZlQvTXFiYndYaWhEMG51NUFqZzNiQ0VYb1c0?=
 =?utf-8?B?V3RDY05obVZBdHdiSVQ1bStCZVBwYkt0aXA1TXNNdWE3d01KcjI2Wi9WSG1G?=
 =?utf-8?B?WnlucVRtOEVzMHovWVE5cm1iMkgwN0MvTXVMM3VvMEgycjJQVTRERHFTZ1l5?=
 =?utf-8?B?M1RrM29RVHd3VkdtWVRkTjZvWjhsWmdEUTg4ZkMxN2diZEoxNVJKSVp6T09r?=
 =?utf-8?B?ZlBBdWtqS0x3NS8vQWdpa2MxUzBjL3l5NlV2dm4wOHpmMDFPU0hhcHhzaGNo?=
 =?utf-8?B?YkNlcjBTb3RudTgvWU9XbTRGTnpNQVp6UGRiRTRJbW11RE14WDFFZWZhYnpt?=
 =?utf-8?B?ZEZIUGcyWEtIdUhJSGVyQ1k5Q3RpT2VsWDlXaW1PVmpoY0dKMm52QUhpRXhM?=
 =?utf-8?B?NzhaWHNTTWJvWjVzaW9NUnV2bzd2cDAzeTN5VTNMdzZrS2d3VTJGUHdyNExM?=
 =?utf-8?B?QzJIUjlJTnhpaWQ3SU90NXpPQ3ptVHE1T3ZPQVNIaFZCZ01GVjd0R2RLaytZ?=
 =?utf-8?B?Q0NTUDdjc1BFTFJGZU5DeVB2YUpEeHNPVmdMRVdheXNzcDdZNUVuRTRhdGk3?=
 =?utf-8?B?YWVHZjI4YmdJY29lRm9KeVhMbWNQcXBlSDN4d0NzRDFtQlI0TWVIcXZNai9w?=
 =?utf-8?B?em1tMFpOWllFVXV2VXlWM2Nud2w2QzdTQ09qQ05scHB0bmxDNldzeEpzeG5O?=
 =?utf-8?B?V2pMeUtzb0w5STBETWptTmk0Y3M4OEZiZWpaeVl5STZVQ0JWZ1d4SWgzejRt?=
 =?utf-8?B?bm5GYW1FeG04TEtsRnhPUEVyVFJjTE9pdEhoNjhsWTZlZ2w3UG53UFRYUHJo?=
 =?utf-8?B?UzhRWEw5eC9oekZHSjJTaDVjc2VRVDlqOFhpcHBEeTgxeUxwbUZKbFp6N0pp?=
 =?utf-8?B?NEFlWjhac2hBSUM0bmJrdEpzSmNHWmc2c3I3N0xZK3c1cFJmeUxBVUxxT3BH?=
 =?utf-8?B?SlVBcHBsY2RzWlk3d1BuRk56bCtFWjVqSFFnNWl2Q3JOdGs1TTYzaHlyMThi?=
 =?utf-8?B?OHFzd2hSQWRPcUlQa3hhWDVMc1JZS1ZTTDRrV25ZSEJ1KzIrdVN6dUk5dHh2?=
 =?utf-8?B?YUdFdXFGVUhnMXRhbzNVY3FHSndMTVQvVWhhSDNocm4vTytpVDZuOUxWSUk3?=
 =?utf-8?B?dURBTFprVVRib2JUOFUzTk16YjBEdEhVOE1WalY0TG00SG82NGYwcXRMUjVx?=
 =?utf-8?B?ZnNTK1c4STcyRUlpM3doNW9RNERYZ0xIbHJ5REc4NWl3Zm1aeE9Hd3FhQVZY?=
 =?utf-8?B?Tk9qY2RKYjRqY2FWL1ZCNUc1WURMZ3ZPMWQyV0VxcVRGV0x2SWVhbVcvL1JO?=
 =?utf-8?B?eUUzcXptMElMUVVnSEgwcVVqazMyN2tyaWxwWVF0WW1OOWo3a01DSWpJY3Vh?=
 =?utf-8?B?QzE0T2ZibVZ4c3FmZ1haR1RzV0lUQ09oaWhJWThWZmRSVWRpNE5tOHM5REo0?=
 =?utf-8?B?aDZhcHd6UnVHcDZtcEtPbmhPMDlBMWhycld6N0Y3SU1DNmFWazVqMVZCVk1m?=
 =?utf-8?B?ZU5jZzZUc0FQKy9mcXBFVHU2MSszaW9qRU1Ia2tUTk5DUGZnbk5KNGcwUnM2?=
 =?utf-8?B?Rnl3bUY5K0pzYkJHbVJvSkh3alI1RHJhSlcyTkV5VEtmNW5ZclhaQXVWWmh6?=
 =?utf-8?B?b2ptZVV1Zm9iazZUUEVIVUhJUjM4Qld1K0JQWkJpK3JWeHlBZ3l4RFZDR3gr?=
 =?utf-8?B?b0xWU3lxOEJjK0RYRUZzRkVzNGlMYUF2UGNqQjBnY01GelArYm5MY01jNlpH?=
 =?utf-8?B?WTFFZW03WXFLM1B4K250SklRUjNCY3RsRnU5NE12V1lML25YTjgwQ3dTK3o2?=
 =?utf-8?B?RE5wTGViUnhtTDFaWEEzR3BoWTlYb1g2emRVSTVKYUZJbENJd1o4a3U0ajZt?=
 =?utf-8?B?bnA3YWNHWlJnbDVVcE1zbXlEMlF4UisweXRSTTlpekRkOE9pT3Q1ZXlsQXdO?=
 =?utf-8?B?aHl1REVtQVM2U0hHUEY4Y0NOMjg3UDFWRzhNa2wyQ3dBMHkzZXA5Q3Y4S2xZ?=
 =?utf-8?B?dGF2S2lMc0NRaWo4UWt6L1hSUjVQMVZOYUdPNERiSVEwM2hQUzhxTiswcHpq?=
 =?utf-8?Q?yEn4qbR38huhoji+W2lb85xoe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb376a0-e0c1-4767-bd58-08dd9e1c0961
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 19:15:41.2042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ygS3sE9xS8Ag64tNXw17k4IOGFWkoqys69mCgunhNRrNrhRom2ZxNE8LtVFEOu4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7102

Hi Reinette,

On 5/22/2025 4:10 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:51 PM, Babu Moger wrote:
>> The ABMC feature provides an option to the user to assign a hardware
>> counter to an RMID, event pair and monitor the bandwidth as long as the
>> counter is assigned. The bandwidth events will be tracked by the hardware
>> until the user changes the configuration. Each resctrl group can configure
>> maximum two counters, one for total event and one for local event.
> 
> (please update, above describes previous design)
> 

Ok. Will drop the last line.

>>
>> The ABMC feature implements an MSR L3_QOS_ABMC_CFG (C000_03FDh).
>> ABMC counter assignment is done by setting the counter id, bandwidth
>> source (RMID) and bandwidth configuration. Users will have the option to
>> change the bandwidth configuration using resctrl interface which will be
>> introduced later in the series.
> 
> "will be introduced later in the series" is similar to "in a subsequent patch"
> and should not be used in a changelog. Just describe what this patch does.

ok. Last line is really not required.

> 
>>
>> Attempts to read or write the MSR when ABMC is not enabled will result
>> in a #GP(0) exception.
>>
>> Introduce the data structures and definitions for MSR L3_QOS_ABMC_CFG
>> (0xC000_03FDh):
>> =========================================================================
>> Bits 	Mnemonic	Description			Access Reset
>> 							Type   Value
>> =========================================================================
>> 63 	CfgEn 		Configuration Enable 		R/W 	0
>>
>> 62 	CtrEn 		Enable/disable counting		R/W 	0
>>
>> 61:53 	– 		Reserved 			MBZ 	0
>>
>> 52:48 	CtrID 		Counter Identifier		R/W	0
>>
>> 47 	IsCOS		BwSrc field is a CLOSID		R/W	0
>> 			(not an RMID)
>>
>> 46:44 	–		Reserved			MBZ	0
>>
>> 43:32	BwSrc		Bandwidth Source		R/W	0
>> 			(RMID or CLOSID)
>>
>> 31:0	BwType		Bandwidth configuration		R/W	0
>> 			to track for this counter
>> ==========================================================================
>>
>> The feature details are documented in the APM listed below [1].
>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>> Monitoring (ABMC).
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v13: Removed the Reviewed-by tag as there is commit log change to remove
>>       BMEC reference.
>>
>> v12: No changes.
>>
>> v11: No changes.
>>
>> v10: No changes.
>>
>> v9: Removed the references of L3_QOS_ABMC_DSC.
>>      Text changes about configuration in kernel doc.
>>
>> v8: Update the configuration notes in kernel_doc.
>>      Few commit message update.
>>
>> v7: Removed the reference of L3_QOS_ABMC_DSC as it is not used anymore.
>>      Moved the configuration notes to kernel_doc.
>>      Adjusted the tabs for l3_qos_abmc_cfg and checkpatch seems happy.
>>
>> v6: Removed all the fs related changes.
>>      Added note on CfgEn,CtrEn.
>>      Removed the definitions which are not used.
>>      Removed cntr_id initialization.
>>
>> v5: Moved assignment flags here (path 10/19 of v4).
>>      Added MON_CNTR_UNSET definition to initialize cntr_id's.
>>      More details in commit log.
>>      Renamed few fields in l3_qos_abmc_cfg for readability.
>>
>> v4: Added more descriptions.
>>      Changed the name abmc_ctr_id to ctr_id.
>>      Added L3_QOS_ABMC_DSC. Used for reading the configuration.
>>
>> v3: No changes.
>>
>> v2: No changes.
>> ---
>>   arch/x86/include/asm/msr-index.h       |  1 +
>>   arch/x86/kernel/cpu/resctrl/internal.h | 35 ++++++++++++++++++++++++++
>>   2 files changed, 36 insertions(+)
>>
>> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
>> index 3970e0b16e47..b5b5ebead24f 100644
>> --- a/arch/x86/include/asm/msr-index.h
>> +++ b/arch/x86/include/asm/msr-index.h
>> @@ -1203,6 +1203,7 @@
>>   /* - AMD: */
>>   #define MSR_IA32_MBA_BW_BASE		0xc0000200
>>   #define MSR_IA32_SMBA_BW_BASE		0xc0000280
>> +#define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
>>   #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
>>   #define MSR_IA32_EVT_CFG_BASE		0xc0000400
>>   
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index fcc9d23686a1..db6b0c28ee6b 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -164,6 +164,41 @@ union cpuid_0x10_x_edx {
>>   	unsigned int full;
>>   };
>>   
>> +/*
>> + * ABMC counters are configured by writing to L3_QOS_ABMC_CFG.
>> + * @bw_type		: Bandwidth configuration (supported by BMEC)
>> + *			  tracked by the @cntr_id.
> 
> The "supported by BMEC" is unexpected with the new design that separated
> the two features.

My bad. Will remove it.


>> + * @bw_src		: Bandwidth source (RMID or CLOSID).
>> + * @reserved1		: Reserved.
>> + * @is_clos		: @bw_src field is a CLOSID (not an RMID).
>> + * @cntr_id		: Counter identifier.
>> + * @reserved		: Reserved.
>> + * @cntr_en		: Counting enable bit.
>> + * @cfg_en		: Configuration enable bit.
>> + *
>> + * Configuration and counting:
>> + * Counter can be configured across multiple writes to MSR. Configuration
>> + * is applied only when @cfg_en = 1. Counter @cntr_id is reset when the
>> + * configuration is applied.
>> + * @cfg_en = 1, @cntr_en = 0 : Apply @cntr_id configuration but do not
>> + *                             count events.
>> + * @cfg_en = 1, @cntr_en = 1 : Apply @cntr_id configuration and start
>> + *                             counting events.
>> + */
>> +union l3_qos_abmc_cfg {
>> +	struct {
>> +		unsigned long bw_type  :32,
>> +			      bw_src   :12,
>> +			      reserved1: 3,
>> +			      is_clos  : 1,
>> +			      cntr_id  : 5,
>> +			      reserved : 9,
>> +			      cntr_en  : 1,
>> +			      cfg_en   : 1;
>> +	} split;
>> +	unsigned long full;
>> +};
>> +
>>   void rdt_ctrl_update(void *arg);
>>   
>>   int rdt_get_mon_l3_config(struct rdt_resource *r);
> 
> Reinette
> 

Thanks
Babu

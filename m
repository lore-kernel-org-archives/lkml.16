Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F5F10E0;
	Tue, 27 May 2025 18:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748371254; cv=fail; b=mx1dq/O/oGUZgltjxWSbEdDy3ka3b4MXQI8ziiH53zPzHEh+w556x7wlPmuQnSFObSBx8a+FZns9dLj6wpqmHsto7MSi5x5yCCH9MzSDPOmghQobHQ56LL+4SVuN0KS/o46aX8Fi4zqAe8I0ESuCOLaQZOZrN9w/jKXogcu6TNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748371254; c=relaxed/simple;
	bh=YwtMdQKHTqOieWejpJQ6Q67GFmyHz7P0NjWdJ4VaMFM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=swjWiJ5Khixm0sHT8uIiLh0in6Jg5Wq2G6oAVQv+/aW/uY1qcnqyRhmGK77JA3j+oc0UXu/NlGFUt8p4YSmIF9g2MiXyHtBcgO6zmQLt2uWZX/xITKNhA9LYRM0E+msmavzBLC0dTTYtwE1+MjvC2MDDFZqnRpFC8miUL2fqUp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mudCCx4W; arc=fail smtp.client-ip=40.107.92.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mudCCx4W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rg6yvyH5175RRzXdi9LC+zDovwREhYou5GLxIKZ//BAXCOxBJ1nHOq29QqLi1xDGafabr06nTiWw0FG0AixeaHoYkvAlgx/74olyalchg5s+7TkT5Sd05Fe7kP53efEo31xjaqV3MQq1ZEfPMG9ewyb0PMeOp4ewPC1ILfoXtkOmH6Eh9xSCABL8BuAWZTN8XC92y/xhCh4iYWpoKLXRVuydr08PajDKkzdbGEreGt3+Dri47JWntBsDbXNitJOYNMN6i7jQjXAnkIS5sGsb0ZmN7w5FL4Q95qbhjbzqw6EBLemmgpOle7ZbozSIqMmgXnDdVAN3lU87M/AXlz81QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcpZQJWRd1RLcDMuHMCNqMLu6K5+PYCs8mJdql47zzc=;
 b=hskvYOLlw7nk+YEQY2TiFGd4pF07DYBuAdwF9Tw4xDfs57ktASdCNmiph/WLB+QYzbkWu1WFGT7PZ5RoYBbqIfS5/8zzmi1u1Q0vWOv0uIOoxOZyUnYdDx8PkZ527Jckza3D7wG1iHClxuOvGunvKw7Jy+itpvAQ1Xtj42GuzUMSNoR+Tm5nh6jHBYyUyL6L2Eur1GTBhLeNgWlid95fiZwrY4MT6gdghkMiUagkv7x7u31iBHZeUqzmO82kti7Kshd1LuDoCgd/UOrBXRe4l3inua3pj5PNMOY4DcphDG24T7GPSbhQ7H4uUXK1RQpqZ3ZeXCLO3YkWclXbRJAe6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcpZQJWRd1RLcDMuHMCNqMLu6K5+PYCs8mJdql47zzc=;
 b=mudCCx4WmzlMqUNcaadxcNiG/2wskcnDZDQqXDlxZc9fGcm8OfNnJocDSagpLqW0PTjzxgBFl2Vl/J5019aCsvzRaE79uTT0IsrkbjdB/xR7gfQfh9PSHepQjs0cGyWDDyge1S2VEh5sQTiNxJUP+0BfMmCNnOJjYSQ6yG8FbOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 18:40:50 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Tue, 27 May 2025
 18:40:50 +0000
Message-ID: <3c22ea8f-7467-4a25-b1b7-4f7f47177211@amd.com>
Date: Tue, 27 May 2025 13:40:30 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 01/27] x86/cpufeatures: Add support for Assignable
 Bandwidth Monitoring Counters (ABMC)
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
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
 <aef9947e5ed68feb0d33a2c882c140e2e472276f.1747349530.git.babu.moger@amd.com>
 <505f530c-810a-41a4-b3cf-7eb326bb6990@intel.com>
 <6cd9873c-1add-4d19-8d08-a7c3a514bfea@amd.com>
 <5f8b21c6-5166-46a6-be14-0c7c9bfb7cde@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <5f8b21c6-5166-46a6-be14-0c7c9bfb7cde@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CP5P284CA0070.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:97::21) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DM6PR12MB4171:EE_
X-MS-Office365-Filtering-Correlation-Id: 6156e0f1-1101-42a9-fd7e-08dd9d4e0081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a09Wc3IxQTRoa3JZczZvUUdVSUVNWi9pbGIrVnZ3d2l0WlNTazFOa0NyTjVL?=
 =?utf-8?B?bEEyL1phM3lHYXY5eEZ6djM5VEpOSG5RY2twbTBkWkRGSnBadnozUEhsdG9L?=
 =?utf-8?B?aVJmbzkzNkZrYStMR2JQcEhjT1ZubFRmaWxOOUV3ZU1NbTRXcDM4MHFUYytO?=
 =?utf-8?B?TzJsbEp2cXF6QVV5Ymo4dGxsN3BiNms3eCtaek5XUkRLVnVmVkFsUzhDODJM?=
 =?utf-8?B?MFM0Z1VCd09VSURmNDJCUjdSUGVhRGVRWlVRc0lCY2VTbWRKVXFwT3J3cm05?=
 =?utf-8?B?K1p5bTZoWU5FMlA2NGZPMHhQK0FXNEpvVU5XRUtxenBxTWUrSW5VRzBvOXJO?=
 =?utf-8?B?N21LNnV2dEtoYWg5OTg5Z2p4Q3IwLy9YZC8ybHpVQzBudzV1dktVbDhkcnFZ?=
 =?utf-8?B?VUpwbkZIZ3F1TGxNTlU0OWdncWJBd1doVFpLYng1TllqZkJWampjUkJCVXFm?=
 =?utf-8?B?NUlaN3lRZXVHVzM2M1VtMXNsYlptR05nejdRZ1A5VVJtNlZvVFVpSmVWaldF?=
 =?utf-8?B?ZEhrbzErYW9OakZWOHp4TzhuZGVCamtPRTBXUDVXM0lieDFIb3krT1BuWms4?=
 =?utf-8?B?UXNkSjFpR1NDb2x6aTEwZkZ3bTZ2VFhWNThSYW1hMnVCVlhtZFMzN2lPQkk0?=
 =?utf-8?B?MVMwUXZZMXVqaDhHK2Yydi8yM1NISzA5clZmWHVqb0xjSkdZT0RRV3dOUFZ3?=
 =?utf-8?B?bDl6ckZYTElXbWdTS0JsWS9qRTZwMmFsLzZWY0ltQXBYbWo2MjRpMEY4WmR4?=
 =?utf-8?B?cjJLSE5EdU9FaDA1eUNlQnVkQ2dsRTh6MWpieXM5ajB3amV4Z2prTWhtVXhU?=
 =?utf-8?B?ZUIreDg5Uy9jNm1VSEZSdm1GbG5nWHVVekpRTTZRcDdMM1pOd2h6SU1VdHJ2?=
 =?utf-8?B?Z3kwRHJuN05XOFJ6UmFKNFUzVHhpeHVOVmdQUmtESlhtWmRvT2xIZHgvV2pO?=
 =?utf-8?B?eWtmbytDMEhJbmVvaHl4UmFVbU85TGtBTURpWUo4QUd3QXBMRGlRam14Ty8v?=
 =?utf-8?B?bFVCaVZvNWljZUF1c2JEZmIvZjA3ZFI4ZGtJdy9uL3ZMbEZpMFo1ZTNjTVpX?=
 =?utf-8?B?ZFhoekYrWjdhbTR5OEhtZ3dlcUduc2tBN05TMDUvK2Iyc3hvRld1Z1ZjUWdl?=
 =?utf-8?B?bHNQdVkrcEdVTytHdDYzMC81WW9UNVd6aXVmNk44dDlZV21GZVlPVVp3NExn?=
 =?utf-8?B?VkpORHBURjdDU3R3Z1EwVmJXQjEyMzFVVHRNTURWbm9LQ2lJZnV4TjVwbDNr?=
 =?utf-8?B?TWFVVjFvenA4bTdNOG9KRHF0c2F0VkttWmJJeDZWbzlrTUpwaC9NSVVZYU1M?=
 =?utf-8?B?TlcwVmhzcGtNcENFUytzc2FjUjlSQS9kWWl6QmVrMklJN0JROFpJczR4Z3h4?=
 =?utf-8?B?K005a2V6bVRON2lKeXdFNDRRUEk5c2Zzb3RZVmgwSVJzZ2RmQ3lJeHNpdTFU?=
 =?utf-8?B?cE5FVFdtK3p5dUxMRUV2eThwdVhiMmpodnFlZTB3TkFDVFJ6cDNPdTJiVXhB?=
 =?utf-8?B?TURWckN6TUt1K2ZJb3VhS2dEL1k4cjNUTC8yQVhLVnFKS1BlYi9iYXA1RmYy?=
 =?utf-8?B?ODVCd1lCMElVRVNVRzJ6Y3crcFM3RDI1MXhXbmRlTnJMNnhlalVCTHd2cThL?=
 =?utf-8?B?OEg2Uy83bE1yeTEyVGRkRzVIWEFSUFdWUnovWUZDK0VlbVBFcWNPNHBXRlh2?=
 =?utf-8?B?NTFZUGE5Mk4xMkc2OFMwK2RNYVhCSENQYXpYM1dGUG1lMG82Yk43SDZqOFUv?=
 =?utf-8?B?TE1UWUtHSEY5Z0kydzZObmlzUUhLNXR3Qkk0YUJlazRCam92L2RlQmxmUzRQ?=
 =?utf-8?B?Sko4eWZiMG82ekllNlcwVFFwOExTOXdDbEZUQi8yQUFjTndVUlprVGJreU9n?=
 =?utf-8?B?ckN3MDZrcHJUbUNQeDVxRUdIK3ZvV3NzU2tuY3AxbG9pQi9TZE1uUmJLNVFr?=
 =?utf-8?Q?UB43/qnXB18=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnhBZHJxU1Avak5DZU5pVGFzM3lXSE9TaWVxYWFkZ3hieG9UbmsxSlc2NzM4?=
 =?utf-8?B?TlRpbmFHU2NlNU5ORURQSXo4WmVmVlVidDM4OXJrM0REdUtCNVN3QlZHVkNk?=
 =?utf-8?B?NUJRWU9MUm43cDg0djduRmRVZmJyT0kwMXlkUE15Q2xOU2tTQi9XV3lZRmVX?=
 =?utf-8?B?Z29QckxwQmNFWHlrdGRhaGdjNnQ1OGhsWmw4dmwrcHNJQ2FiT3ZBNyt5a1RT?=
 =?utf-8?B?ZW02WmVhRWpxNVJRc2hFaGtqZUxhcU5GRU9PaWVEcnZhNW40UlNYRTFMS1Jx?=
 =?utf-8?B?MUVkSEpIemRYaTQ5R0NPMlhFMHUvbVhGMWFseW5tUmlzWU40Q1BnRXA4MWlv?=
 =?utf-8?B?S2pvRGJXMWU5UmFVR2hRUXdXM1lScCtsa3diOWxtc2gzQWpybXMxbU5KYzlH?=
 =?utf-8?B?UWNPcGVKa01jTmNyT1dneDdhK1JwdEZqaG1GamVOOHJrRjFaMGZBZ0Y5OEVW?=
 =?utf-8?B?YkdxV1hkVDZyWlZVVlVST3N1UXNIM1EycXBETlZWS0wyZkpSenpEbzFIOG9H?=
 =?utf-8?B?MEJINERMN2s4dzdQUmlTaFFrOFhucC8yK0VYYThvbFVPU0gzZkY0dWJkQ25Y?=
 =?utf-8?B?T2ZwVjJKeWRKeGJhNkVOcmJ4Um9JLy9PdGRWWjNDalZZQ0lGMzRUVE1KMUN0?=
 =?utf-8?B?WURZZldPdGFUUjUzcmZ3dWZpTnZvZ1p1WHhsSWkrQXhnNWhWY1RpNGlqMjVp?=
 =?utf-8?B?SU15S3pNOGwwRFhBUFBDd3BBZjVRMStHY2VKMmtSb2Jxc04yd2dVekhvU0Q4?=
 =?utf-8?B?K3VacEdxem1qV0tsRUwvYlRnK0dDbVl0TXJzcVMxekpTSHQwc0NoUFc0Zk5q?=
 =?utf-8?B?NlBEbFBUR1pINlpnbEU2L2grdU9jeTY2SnNtQUgyREVzS0FGVndOMjBXeUR1?=
 =?utf-8?B?UXE5K0xFQUxGNVRwdHlueFhpdUdjNlMyOVZhNDFkb2t6aDc2Y2s2Q0JGRHFC?=
 =?utf-8?B?Q3U5YXdjOWtPd2tNY2tFc08zVkd2dThTTmZkMk02S0puNEI5WXQwMGZGcUYw?=
 =?utf-8?B?VnA5SUEyeCtXcEZWRVB4VVBKOWJ1blc4Z0NpTlB4RXFWck4yNDl5WHgzV0Rv?=
 =?utf-8?B?cFY4TXUwaE1ySUJhalpUOXpSdCtvRjFxSVQ1K2Jrc1ZNTU9PVkU0ZUxIVmhS?=
 =?utf-8?B?TVFWd2NubEVSQUJxSzNheDIwcUhuVnlDMUlqdDNHZ2xYT3NVYThUNnZiNWps?=
 =?utf-8?B?ZldPaWdEdHRhUXZCVnpCSnBKeTJTWGlUV3VUNmxrSlJ1Y1ZkcjlrckFWcjhx?=
 =?utf-8?B?am5BT2h2Z3lmb1BWWmxkSzNMU1RXdDI3TFRsNkp0TEZsSVY3TWZhNjBvbE5B?=
 =?utf-8?B?UG5HZVVCTGE4aFg2MjM4SmRrQzBwbW81aGJqd1h3aTIyOENvaUhFUmdDN0pE?=
 =?utf-8?B?aTBhR0YyeG9iQitJMjVjSUZpUG1XUXlhNTZRTmE4TUhIVzBEbzFmUEMvTGxy?=
 =?utf-8?B?NnNyRktZeFZHNWlNOE9sVWlZSnB4cnh5dm91L1AzNkR6Z0duczlBbEZJcDJX?=
 =?utf-8?B?QlYyUmg3QU41S081bkZJWUVjaG0rMUM3MFYyYi9PQnFJVUhFdFNKeG4vMWk0?=
 =?utf-8?B?VzVodzYvcmh5RXBLZVUyQXRsMDdOZTMzVnlkOW5yQVNGanoyZHB1SG5GT3NR?=
 =?utf-8?B?RXNkSUo4THVkVi9uWXN0alV1UWpOYkZMU1BueHVJM1RUWENjZTNWRU9uRGhS?=
 =?utf-8?B?R1hDa1gxdmFSZU9WczZxUjZ2Zkg3bnZKeThCR3Q4WGdFRnBzWXNrWDZBS2FW?=
 =?utf-8?B?U0R2TkVPVlFlWTNLMjF1R3E2aFR3UlFvWmVBeFROMTRyZkdIcnJWY1JwOGJ4?=
 =?utf-8?B?cC9BK0Q5V3lxczd6LzNZbmF2NUpvL2JLT3UwYmU0MGk5K1g3UmN1Vml3STkw?=
 =?utf-8?B?NktYa0wyektreHdmSjROVHZEN3FrUi9SUzM0TnVST0tTZkxiR0hRekY5NXNy?=
 =?utf-8?B?VmZIeTdwSkJ3bU4ySWI0VXVOZElWbFBsMmIrTjhJSWxMQU5GZExvYnQ5SjUv?=
 =?utf-8?B?TTBVR3VuZ29VSGhIRG1xVFlpbno0RGpkVCtudDdVcGFhTWhaVGY4YUpWMjRI?=
 =?utf-8?B?TEUrYStISHBUdXVBM2JLdmJNbjlUV0lMMkdSdFRHSmhSTkg1UGlleTRFdDNW?=
 =?utf-8?Q?pBMs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6156e0f1-1101-42a9-fd7e-08dd9d4e0081
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 18:40:50.0823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7pCmQx4ZekfWU0GlYwKtfnLtghU7yuxg5GwI23UpH/P+9mrNDFvjay5Ocuf6UCt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171

Hi Reinette,

On 5/27/25 12:54, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/27/25 10:23 AM, Moger, Babu wrote:
>> On 5/22/25 15:51, Reinette Chatre wrote:
>>> On 5/15/25 3:51 PM, Babu Moger wrote:
> 
>>>> diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
>>>> index a2fbea0be535..2f54831e04e5 100644
>>>> --- a/arch/x86/kernel/cpu/cpuid-deps.c
>>>> +++ b/arch/x86/kernel/cpu/cpuid-deps.c
>>>> @@ -71,6 +71,8 @@ static const struct cpuid_dep cpuid_deps[] = {
>>>>  	{ X86_FEATURE_CQM_MBM_LOCAL,		X86_FEATURE_CQM_LLC   },
>>>>  	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_TOTAL   },
>>>>  	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_LOCAL   },
>>>> +	{ X86_FEATURE_ABMC,			X86_FEATURE_CQM_MBM_TOTAL   },
>>>> +	{ X86_FEATURE_ABMC,			X86_FEATURE_CQM_MBM_LOCAL   },
>>>
>>> Is this dependency still accurate now that the implementation switched to the 
>>> "extended event ID" variant of ABMC that no longer uses the event IDs associated
>>> with X86_FEATURE_CQM_MBM_TOTAL and X86_FEATURE_CQM_MBM_LOCAL?
>>
>> That's a good question. Unfortunately, we may need to retain this
>> dependency for now, as a significant portion of the code relies on
>> functions like resctrl_is_mbm_event(), resctrl_is_mbm_enabled(),
>> resctrl_arch_is_mbm_total_enabled(), and others.
>>
> 
> Avoiding needing to change code is not a valid reason. 
> 
> I think that without this dependency the code will
> still rely on "functions like resctrl_is_mbm_event(),
> resctrl_is_mbm_enabled(), resctrl_arch_is_mbm_total_enabled(),
> and others." though.
> 
> The core shift is to stop thinking about QOS_L3_MBM_TOTAL_EVENT_ID
> to mean the same as X86_FEATURE_CQM_MBM_TOTAL, similarly to stop
> thinking about QOS_L3_MBM_LOCAL_EVENT_ID to mean the same as
> X86_FEATURE_CQM_MBM_LOCAL.

oh. ok.

> 
> I expected that for backwards compatibility ABMC will start by
> enabling QOS_L3_MBM_TOTAL_EVENT_ID and QOS_L3_MBM_LOCAL_EVENT_ID 
> as part of its initialization, configuring them with the current
> defaults for which memory transactions are expected to be monitored
> by each. With these events enabled the existing flows using, for
> example, resctrl_is_mbm_event(), will continue to work as expected, no?

Yes. It will work as it uses event id.
> 
> This would require more familiarity with L3 monitoring enumeration
> on AMD since it will still be required to determine the number of
> RMIDs etc. but if ABMC does not actually depend on these CQM features
> then the current enumeration would need to be re-worked anyway.

Are you suggesting to remove the dependency and rework ABMC enumeration in
get_rdt_mon_resources()?

-- 
Thanks
Babu Moger

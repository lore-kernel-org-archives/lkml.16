Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2072.outbound.protection.outlook.com [40.107.101.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3351E1CB51F;
	Mon,  7 Apr 2025 20:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744056819; cv=fail; b=h6dDmKxkKvzD/9ctj+andM51Ngmr1cm5q8a20NvkHldHrQnF9bU9xi0Zzv5S7GTAenSlWEKb/0U9z9l336eh/nZQU6DmRZuhYZhtjaJij5/j3vC+Kvg6W1QsKTmINTWyMjOPcW6qiTazGfDyEj4+0BuEg0COGzjiCnizFA4cCBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744056819; c=relaxed/simple;
	bh=4hlFip6hKXglAOhDlE3Ao2Q4wYA9yp8FPvTbUeOb9mk=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LfwL9ur/R5oRW4aEyq+d60gHZ7WpeSUElTldh+m/IwNeFOmIqhZncSPjzcBAPaOpvW2xqE22giFM3UWZTk+dFh05xE6YA379oityJzMBBJ7qWGZu7OTILsbIdw/0ZLgSnBC2XfA9H9/C6fonHoTQ4mw0zOyXrkCisf/7g7TL2D4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rdUgC79l; arc=fail smtp.client-ip=40.107.101.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rdUgC79l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftpW/cpcV/ptKBX+KF42KxVtLn7WClx+K0uBsR9i5hAixvBDeqRe1jEtnc52SJyOz2bBh5U90YZip3y6AKvaXjeJ7SnXZhV1Dh58yAi3rXK6HlphKmo2ADHQFRx2W4h/LyfiY7yMPIOu/TvII2EuKC3USV1NITQQqssx4G38z4Fbm/pejy49Qvcnrfbh37VaPe45AwCbJpaSKSf4EXVZkGPSebt2R3eUeToTzb4ZpX+HBXK9kYRfNNnYO/thy5pXCBd7lBvk1ikeG6k089rbFSG/WSqLifBFYoy384vUOlZNBzo7rW/K9nfihtvGRfnK79svXZhg6Ni+3NBqkfwGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYPIZNTzmnWe+9DF3XXRGrL7OIYyWkwW5j4s2UmG0wE=;
 b=jVo4IDFxd22trbp35uNUOju8kqTnwXcnfJ31uXLp9b2ZxRZeqtgc64zGgQWxOabaQ/cqWYsz8RDuX2kiE1t9HlOE7PtgTdn0gRIOORhMBkUTWegNwCPW0PCjDg73/KkayJaBeRP5vf6iPwo0eo1OpeHal0w1WKX9MNi8WPWhVbqHb8Y4+vsLnxqeRS2zcIqlEJLaAnA0qcDM+YctkPTvGPIqizx2BxU9FSwWoh/Q6Gyzl7WVNg1LyCv7HM0YwtNcR8DnqopllxXqDe4ZMAmHOZmYemUBWJkiYxMkTiQOzyQhfO3ytBkvFVrGBQTOPZaHYcJf76LsuxBMJ86+mNILAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYPIZNTzmnWe+9DF3XXRGrL7OIYyWkwW5j4s2UmG0wE=;
 b=rdUgC79lvMrApe5gg5SX5C3G4vcwC/iTj4VVGNMuG8qYfyP0JppmOz2TVjRpVv66cNMUJz/Pkr0S0wR9pdqGCc135fXtOnm591MJovntyNOY0AGmNpohX3hR4i5w4SI1qoahqxRkv4fM0bZ3l461TEe+w25hG01WGvJ9t5bY9VY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SJ2PR12MB8111.namprd12.prod.outlook.com (2603:10b6:a03:4fe::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 20:13:34 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 20:13:34 +0000
Message-ID: <384d6c26-33f2-4699-986e-a8c71d225f49@amd.com>
Date: Mon, 7 Apr 2025 15:13:30 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <babu.moger@amd.com>
Subject: Re: [PATCH v3 3/7] x86/resctrl: Detect io_alloc feature
Reply-To: babu.moger@amd.com
To: Reinette Chatre <reinette.chatre@intel.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 paulmck@kernel.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 jpoimboe@kernel.org, daniel.sneddon@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, sandipan.das@amd.com,
 kai.huang@intel.com, seanjc@google.com, xin3.li@intel.com,
 ebiggers@google.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 tan.shaopeng@fujitsu.com, james.morse@arm.com, tony.luck@intel.com,
 peternewman@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, eranian@google.com, corbet@lwn.net
References: <cover.1738272037.git.babu.moger@amd.com>
 <3c07cd3fb7963320819e555086f701f125b55f4d.1738272037.git.babu.moger@amd.com>
 <fff9df3e-34ae-4aa0-8847-130a4ffd8fcf@intel.com>
Content-Language: en-US
In-Reply-To: <fff9df3e-34ae-4aa0-8847-130a4ffd8fcf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0028.prod.exchangelabs.com (2603:10b6:805:b6::41)
 To MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SJ2PR12MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 508ad7cc-b82c-4f50-9acd-08dd7610ac79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnlmZG5ja084NlB6SG0vSjZqMHgycVQ2Y3FqUVd2QlBKK1duempRUENIcFNC?=
 =?utf-8?B?cTdJNWwxUmtjTnlpc1lzQzVwdVpoeWpvU0NJbTRsdU9WaFhoRW5XbHVVZTVy?=
 =?utf-8?B?bFV2Nk53anBoNENMKzVMWEkzYzRjQ3dCdDl6cTgxSmsvK1dzdTNNOUt2TG9T?=
 =?utf-8?B?ZGNJK1BNYkIxZmdPU3dMSmNMaWkwVmw0Wm9iWUVaZnJBeE5kckdrcnR6c0o1?=
 =?utf-8?B?UjAwTXhXNE4rS0RrRElEbG1QT2NBUmxRQVBJeXJHd2hnNGF4d0tUaHU2YTU5?=
 =?utf-8?B?ek5hcmFIRC9OSHp3MjRzdjNySDNVTE9YM1NoLzQzMWNEaWI0UlZ6K09uTmtZ?=
 =?utf-8?B?Tm9RYllCL1Q4d0MzTTg4WGIxOExuTExPYmViaDQ0WU1aMC91akNvSHJZUWVn?=
 =?utf-8?B?T1I3emdQcCtkbWtUeGFLRGU1RmEyaTVXN09NQTcveHJ3b25ubk41YkgrTzR5?=
 =?utf-8?B?STAzakdBaUxoTnJhL3YvRC9CcUVpalNCcU5NRnFURDk4aG1jQ0wvcmsrWlp6?=
 =?utf-8?B?UDRPT0NXVko1VlFNUXVBT2MvZm9BQy9VN25hMnpsSnBXVXRhS1h3Qk1xRDlY?=
 =?utf-8?B?a1o1MHAzS3cyQXMzVFZuZG5xZ0QxVzZyblFsZEpLdldXR1hhUEZXY0EwdWo0?=
 =?utf-8?B?cUhPcHhCMVg2Q1N1ZVd0Mm8zRWRvM3VQa0RHWi9MWEZRWEZ4TTBGeGF0YnpW?=
 =?utf-8?B?KzAwcVJ6S0ZEUnoyNU5tbWhwcEN4OGJZRzFGdVJuMUZ5N1llTmRMdHlnUTRO?=
 =?utf-8?B?K0djZUlsYTJINFN0blc3akp4YkxNTG85TjRqcWFuaGF2WmFlSDdDT2ZkdU9l?=
 =?utf-8?B?ckZFUjFveHUwWmt3b0dnQU53WjdXOHRiSVlvZDAxVDdjZkMydTZWeVZQdHBC?=
 =?utf-8?B?OWNncENiSlRiT2hlUTdvNHU3ZXZYYlAvdnhHanlHK2dBOTR4YVdIeTBkWlJV?=
 =?utf-8?B?M2tzZXhOb3VIaUVhYmpuaTVwVHMrd1paYkdmdGlodGorY1JKeElFQjRrbEtR?=
 =?utf-8?B?N3AyQXhRenZVOXJ3L1BnZDZlZlI1bkMrTFJzWWJ5NWRVUmViWkx0U3djL2ZE?=
 =?utf-8?B?bUdxYkdxQ3lhcHVHWlMrOTVRM3dVOE8zK0NwVEdyTjUzVjF1MlpJbFRCZThw?=
 =?utf-8?B?Ui9MV1JmL0pIdTArR0p4TnFlK2d0dTZEWXk3bTZ4RHBwM3lnYWkxMHMrVVRO?=
 =?utf-8?B?MTMxeXhsbzg4SU5XSnRtMXRVYXhnNFc1QVp1eUtWNHUzRXlmL29VNlZyWFRL?=
 =?utf-8?B?VHQ4Y0pNWUgwM0VNcTNySWl6Q3huWktxQWN4K3g3SVZRdnZMWkQydGFERUsx?=
 =?utf-8?B?bytTWjd6TFk0OXFmZW40SHJwb0VQdE9NMUkzYUowUzBGSkVuV3FiL3FCeXZK?=
 =?utf-8?B?TVVJQUNyckpWUUh1ZG5TU1E1RUZvZ1BLNEkyUlIydzRadytDTXdrb2xEdXhu?=
 =?utf-8?B?NGI5VVlLUDdqb0QwWFp1dkJCbXdUb0h4Mk9CSWM3Qy9xSnZVcDQ1Nkg3dEZm?=
 =?utf-8?B?SlFWV1pNbUpIYW1jSWpzOU1HTVBJVXVLNU0zQmlWRHk2d1F0OHp4dlNXZTZu?=
 =?utf-8?B?SHIvc1lxL3BPWXpRY2pzRVNvRlpuQURlQlROcGVYYmE0eUZDa05yM0ZBL1VW?=
 =?utf-8?B?TXhJK1FYK3BGc3VSV3JTcEM3c3Z4TlZ2SmI1Z3Nrc25yNXVVM3FyMFNXZFZZ?=
 =?utf-8?B?aEU0V3lJTWU1SklkNjRUVTR6Y296S0tpRFdNOTFQYm8yaFF5ZmV0WHUzR0h5?=
 =?utf-8?B?NFBsUkJlejZvdlV5T2hwNmtaUWFlS2JMVVFHTHVwT25GQUpLOUk0ekNlQ2Ur?=
 =?utf-8?B?djh6dVhWQ3pkdnVGN1BrdGVUVWhpcm96dVNiNjJNOE9ic0Q1RzBRWkUxN1Bh?=
 =?utf-8?Q?BIn8FGTlOfmte?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWZ2a2plOWhQUVE4djR3dDh1NmptVWtWRmZtbXhKT2ZIbC85a1NJZ1ZFdGlU?=
 =?utf-8?B?c0FETUFaSXlRZWlhZ2RmTlMrNHE1TXowWG13WjcyZGNjS0tMZURsUUJKVndU?=
 =?utf-8?B?andVdGRTZnMyL3JWMlZSVU5PbkV3UDc2R2FzbSt0SWF6ZFo3YlB6cTZDRWRk?=
 =?utf-8?B?TTVCUmtpQ01WV241MUE1bkF2LzIvTVd2RWNWN0NrR1VuelNwbGYvemlLM0NE?=
 =?utf-8?B?R1I1WFdtYnpvZEZReFpNeVd3N3YzdlgyaGQxenQ1dmFrN1FNT2NPSi9SYWtv?=
 =?utf-8?B?VUJYeFRlbllzVTZnMUNiTWliZVlNR2J0eVRMZENibXZsVE1HRU10ZHNEd0NF?=
 =?utf-8?B?RFBWZTZYNXBxSm42NTRUQWU0TjI0cGV3WUU0YXNsa3cvQjF4eHoyMVpIbkpD?=
 =?utf-8?B?NTI0TzhQY1l4eXo0V3N5MTV2NU1Ec0NyMHJHRmVDeHUvdS93d2ZLVWF3VUJJ?=
 =?utf-8?B?NHNyMTlBL1pRWk5vNDJOZnMva1dGWTBRR1gwZGxoSUZJMk9OSVM3NWhaSDQ5?=
 =?utf-8?B?VGtqUzRxVVlSV2NQZWJOYkhpeEduQTAzZEtCamE0VWNyTHpmWWVaTkh2MXBk?=
 =?utf-8?B?WGZNWTlOVXpDN2dUeTZsRktwY2NPQXlKYnlJS210N08vcElXUi9XMldMRHh6?=
 =?utf-8?B?QVBQaERzSjVGRjYycUJ6VS94Y1cvREF5andQc1M1VkU3bWp3MHZ4dnVrUEEw?=
 =?utf-8?B?bFltMmY1UmYrbzNOUW1jamF0TXpyMXkrWmhwREsxNTdVNVlFVVlrUCt2MFZa?=
 =?utf-8?B?MHYrN1d1RnUrTEpJUnpERUVJS1NBcFRTZUI3dStUQ25uT1Nyc3FKMGZESDRh?=
 =?utf-8?B?UFBrQ3NqTDViclY2TkVwTlk3NzR1TStPVjVJcFpZOEpYYjFiaitRZGlGRWtD?=
 =?utf-8?B?MnJ4SEppeGx2M21vWXdYZlI0N2FkU2NFOFlnandyc0Y3WW00enEvYmlGaXVk?=
 =?utf-8?B?dDlaT0JOdWJZdXRweVVRTDZGOUVwM29GMmxUb3d3bHM0ckFiVzNHV2tmRW9H?=
 =?utf-8?B?VTFJWnRNd0gyZWdLUXgydHBQanhIRWEzVDJMZzNSMGFMeFRieXVud1RFczU4?=
 =?utf-8?B?cG5YbWtaQnNtUnFNY1cvOVZ4M20vaDN0YXhGTFZISjFVMnpVb0xUcjkxakov?=
 =?utf-8?B?UnNIeVowWCt4ZGlVbVovbWJuVVltdHVtR3pNNEZGbnNoZExyOFk1Q2ZMd01S?=
 =?utf-8?B?L0dqWk5idDgyUU84dkJabjFIaFp6WFQvVG93aDY2N3dneGR6STM1d3RLUTJR?=
 =?utf-8?B?MW1yMHljOXBKUG05clNTYnBnbVIwZ0dhRTdPYk95RUlNMllEVi9DTTlQSVN0?=
 =?utf-8?B?NGthbThxeDZDZWNnd0RKMytXVGN3NDdISnJlRzNTWjdqeFNWaXlRZU1LNjM1?=
 =?utf-8?B?OThFZ2lCTHdiREoxUWRTL3FKS1dNRyt3RDRTc0pwOVVxYUxwVFpGWUNLbThH?=
 =?utf-8?B?bDBMVityUUR5T0dmam9leDgrTHliM0dUM1Z4VnFjTWt6SXRoSk9MbnZkdWxV?=
 =?utf-8?B?NUxHSmhla2lLc0VsbEZyTkdFWTRVYndDVEdES0JGK29VMmxWOE9pMUUyRlV2?=
 =?utf-8?B?WHlMdkszVnJQMmU1bi84NnZJU1hxQlVwbStEZjFlVVo0M3dPYmNiSnBBK0Jj?=
 =?utf-8?B?UzQ1a0hoZGsrM3QraXVOWDN6M3BKSDcvR0YvVmM1ZVJ1RSt6S0Qya3JyaDdZ?=
 =?utf-8?B?UmQ4dVByaDFQWFJ1MVRqWm9YQklCd29DbFhHM2IvOWN1ajNHWVRPYVJ0M2tx?=
 =?utf-8?B?RUJOU2ZYelhNNEpvQXNjd3pCQ1dkWHVlZ3V0Q1ZTT215bC9BNml2bXpUL21a?=
 =?utf-8?B?WnhhOCtZQ1FHRkYvSEpBejFQc0wxV21jUjduVXB3WDdwaUg1YkMyM0dDZXRI?=
 =?utf-8?B?SG1Ta2JEWWVzRzgyU0swc3VvOW9vNk5NTTBSN2RWcHNkVU1ZaHhTUEwwMTZ6?=
 =?utf-8?B?allxMjJOVnlGRHhHUlBuaHUwY2ltdnN4VHVaNVRQU2tlNjRZQy9QMW0xQmgr?=
 =?utf-8?B?YnBCYVB0TXFDblE2SThJVEdNd0puYWdOOVBrNGd2aTVxVGRTeUxCNmw4L0JM?=
 =?utf-8?B?eFZiRmVLR2Z2dUVYeXd4d0NIbUxGUmMrS2NvSTBkY0NhRGE3RnlRUGMwS1Vz?=
 =?utf-8?Q?5z2Q=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 508ad7cc-b82c-4f50-9acd-08dd7610ac79
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 20:13:34.3367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4F+NROFrrSeKNq5KM6JnJYTqxDpoPL4YB197xegj5NVa23q+PBP8MdpT7e5Zsxsr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8111

Hi Reinette,

On 3/21/25 17:51, Reinette Chatre wrote:
> Hi Babu,
> 
> On 1/30/25 1:20 PM, Babu Moger wrote:
>> "io_alloc" feature is a mechanism that enables direct insertion of data
>> from I/O devices into the L3 cache. By directly caching data from I/O
>> devices rather than first storing the I/O data in DRAM, feature reduces
>> the demands on DRAM bandwidth and reduces latency to the processor
>> consuming the I/O data.
> 
> This provides good context but the changelog does not mention what this patch
> does.
> 
> An idea to get started (please improve):
> 	Data from I/O devices can be inserted directly into L3 cache. This
> 	reduces demands on DRAM bandwidth and reduces latency to the processor                  
> 	consuming the I/O data.                                                         
>                                                                                 
> 	Introduce cache resource property "io_alloc_capable" that an                    
> 	architecture can set if a portion of the L3 cache can be allocated              
> 	for I/O traffic. Set this property on x86 systems that support SDCIAE.  

Looks good. Thanks

> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v3: Rewrote commit log. Changed the text to bit generic than the AMD specific.
>>     Renamed the rdt_get_sdciae_alloc_cfg() to rdt_set_io_alloc_capable().
>>     Removed leftover comment from v2.
>>
>> v2: Changed sdciae_capable to io_alloc_capable to make it generic feature.
>>     Also moved the io_alloc_capable in struct resctrl_cache.
>> ---
>>  arch/x86/kernel/cpu/resctrl/core.c | 7 +++++++
>>  include/linux/resctrl.h            | 3 +++
>>  2 files changed, 10 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
>> index c2450cd52511..1ebdb2dcc009 100644
>> --- a/arch/x86/kernel/cpu/resctrl/core.c
>> +++ b/arch/x86/kernel/cpu/resctrl/core.c
>> @@ -306,6 +306,11 @@ static void rdt_get_cdp_config(int level)
>>  	rdt_resources_all[level].r_resctrl.cdp_capable = true;
>>  }
>>  
>> +static void rdt_set_io_alloc_capable(struct rdt_resource *r)
>> +{
>> +	r->cache.io_alloc_capable = true;
>> +}
>> +
>>  static void rdt_get_cdp_l3_config(void)
>>  {
>>  	rdt_get_cdp_config(RDT_RESOURCE_L3);
>> @@ -931,6 +936,8 @@ static __init bool get_rdt_alloc_resources(void)
>>  		rdt_get_cache_alloc_cfg(1, r);
>>  		if (rdt_cpu_has(X86_FEATURE_CDP_L3))
>>  			rdt_get_cdp_l3_config();
>> +		if (rdt_cpu_has(X86_FEATURE_SDCIAE))
>> +			rdt_set_io_alloc_capable(r);
>>  		ret = true;
>>  	}
>>  	if (rdt_cpu_has(X86_FEATURE_CAT_L2)) {
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index d94abba1c716..dbe6461f3fbc 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -129,6 +129,8 @@ struct rdt_mon_domain {
>>   * @arch_has_sparse_bitmasks:	True if a bitmask like f00f is valid.
>>   * @arch_has_per_cpu_cfg:	True if QOS_CFG register for this cache
>>   *				level has CPU scope.
>> + * @io_alloc_capable:	True if portion of the L3 cache can be allocated
>> + *			for I/O traffic.
> 
> Enforcing that this should be for L3 cache is confusing. On a system with
> L3 and L2 cache resources each resource will be described by the properties in
> struct resctrl_cache for particular resource. We do not want to set "io_alloc_capable"
> to true in the L2's struct if the L3 cache supports this feature.
> 
> This can just be: "True if portion of the cache can be allocated for I/O traffic"

Sure.

> 
> 
>>   */
>>  struct resctrl_cache {
>>  	unsigned int	cbm_len;
>> @@ -136,6 +138,7 @@ struct resctrl_cache {
>>  	unsigned int	shareable_bits;
>>  	bool		arch_has_sparse_bitmasks;
>>  	bool		arch_has_per_cpu_cfg;
>> +	bool		io_alloc_capable;
>>  };
>>  
>>  /**
> 
> Reinette
> 

-- 
Thanks
Babu Moger

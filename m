Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2058.outbound.protection.outlook.com [40.107.96.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A00420E037;
	Thu, 10 Apr 2025 22:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744324185; cv=fail; b=aLl0Cx43JopQVLblxZcFKz6Lc03FhIWC/oAcvAR8wuURgDGUUXsXOB9EKpibva7VyBooHkC3+WpqNWWQ02TjIHnnKAca7vyFbcTGrC4GYyTW6uNvQLjamwqnLyJV0ntqP8u0FsVKdC9c+Wz+oycS1C+sHDBVn71e+6JlKX6hLfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744324185; c=relaxed/simple;
	bh=fYttwuVaOPIZ4RRdfCfO2MqvhUKUFqnKcexUwNB3lKA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DesK5vFZ+BtsIbHugPKzAxlIWRPabPtgQ3CGqTUhHRpgd9CkjFB3KKjW6u9oC55Gzvc34XKsnxOm+6+s4t9IikFhpCjeaZOmzYA4cMjQfQ2LccHrtA0hXOT1dfJgEWP1GdHJijqE/O7Yu7j3EQbN0AxNqPNXgJjgkJeVWoGG238=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vQ+ksFBs; arc=fail smtp.client-ip=40.107.96.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vQ+ksFBs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxbMfSG0lLGw7ZpvrTnamW1d7kgMGtY8yoXqfVsxS4E/E9vxxTkBDwD/kgwh2Nv+s6CiWLioRx+WS6pUOitM1MZYc1MoWfOSPQuYR44V15Ks1gracUJNOf81liWgxmEQD76gQCQb1MzduayG75wWzuF/Esh4yvM0cPMMGgjToXUUuefJ+vP8RDDS1hkhO7ziDcOcKdkcEh25MIIy7ifs/sBpfzlSxZen3KRD24GbhqIAyKXEEHb3MMnU60DLb7O9KcXe14F+oXVVbWOzoMAOG3f1aK1guZQXPs1OgpvGFws46n+izJfE5UyuUjUZD63D61Q3+csh3+gHGsCsSYbTyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GdxbxgCecDSkLOFfxwprJFCjDGG6e1p0pThXTsSrgk=;
 b=y55JHp6LU30ziaujzNgZJVKbYkdGzj7PknPTue1SLAtfXxoO+iLFQ4Vf+BcDbxhn7+NlpGMGxLTkL5V7ft8jbuHX1fgNuVCQFASZgFJtAhB43FQzCfEpTsKBWxRBq6fR5lwTAWJEGe9IrLn4w3Wr3U2jkJf0OZVA5+LrxCl0hbauUpbtHOkqlbUl5lE9Pj9jFyjgf7kGFPsmglYd782zvnXSGt0AIVDZmfVy4hje+n28uid2EqCSErlaDB+uZoEr40iTCTML7oTJ7+zXOKu1hX4OTVGPxe+K+UoboGuVli0/6TWxdL0iDEBCIifxWU3yMO26KARj/WZ1oBF6/xolNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GdxbxgCecDSkLOFfxwprJFCjDGG6e1p0pThXTsSrgk=;
 b=vQ+ksFBsMsk61Eahq+1IN64wZgGeoL/U0XxdR29GfDuI8F1lW2A+khFN4tyCqklcIv0p4DG3xQr0/Tpq4B7/EZLDk1TRdWAMEq15CkOvz9TIY9ZGgAGuqaCP1UJebq8I9y402O/+jbI6E5NZOtPzllyPLxHUsRMecz5GrwCDlM8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BL1PR12MB5948.namprd12.prod.outlook.com (2603:10b6:208:39b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 22:29:37 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 22:29:36 +0000
Message-ID: <15a2cb8d-e9ee-4512-8142-2f9307fdbdf6@amd.com>
Date: Thu, 10 Apr 2025 17:29:31 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
To: Reinette Chatre <reinette.chatre@intel.com>, babu.moger@amd.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
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
 <7c135464-d859-459b-b86d-e8c18f106fc4@intel.com>
 <251c8fe1-603f-4993-a822-afb35b49cdfa@amd.com>
 <4a98eccf-4d31-40ac-8112-c89cde7a1c6e@intel.com>
 <46e40771-c73c-4ceb-acc3-812693f98f19@amd.com>
 <5ece1b6b-a225-4fab-be74-b48037986686@intel.com>
 <f16697d8-be6b-4dd2-b0dc-3c628fc4eec6@amd.com>
 <a546a42f-206e-4a0a-9e3b-0d4ac472729f@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <a546a42f-206e-4a0a-9e3b-0d4ac472729f@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0118.namprd04.prod.outlook.com
 (2603:10b6:806:122::33) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|BL1PR12MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: 438bedf2-6944-41b4-fd8e-08dd787f2c96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGlJVkpOVlA3SHZKY29oUUN0emx6U3ZMeVE0ZjBOMmZHMFJIWDVVbDkrbjZ1?=
 =?utf-8?B?K2JzbW1RT2lNQ3M0RzU2ckpZY0IwSml6SHlGL1pvaWRqb1VhQkkrNjZ0c2Rs?=
 =?utf-8?B?OTZXbE5yblZzTGRha2tidnBxdS8wU0ZtaDQ3Rk1ySFJub3BVWWk0U2tHb0xY?=
 =?utf-8?B?NDN1ZlZpZVVYY29pR0NQb1dSZmZSRjVORE1zdnY3NUwxSUNrcVJlSEZsTVZI?=
 =?utf-8?B?ekhlRU5sZ2tVcmhqM3pSYmk0ZytDczV5RGkyeldVNlNwMDd3ZzVDYjQwdXFX?=
 =?utf-8?B?TURHRHpCdklzVEYra25rQjRoQjNuNjZESmR5ZktWc2R1eFBvWC9KZlpZRXRv?=
 =?utf-8?B?ZzFUbC80RWQwTFlWSmhTOXhDSERCMnpwckRaWDFaTmQ1S2Exa2M0cVNJQ0h1?=
 =?utf-8?B?a0xKU2h1QytIY1hLcDlYZWNPRHRmdngwbTUxSkptdUZ6VTAveGFsWXVCUS9K?=
 =?utf-8?B?b0h3bGg5RmFzb0tjNXhzeTZvMzdqd01oUElzMmhHc0VyUG5jcnNxTExlWHRD?=
 =?utf-8?B?THVrejVORFFzcHVmWU51K2U1L3hpcTVpQkFneFVDNDJ2WHJwUllEUGxxZGxZ?=
 =?utf-8?B?MmcwTG43NkErVlA4M0o0SjYyZmdXZjd6YVJCeTZGekVVMDIzVkNsZXBmOE9i?=
 =?utf-8?B?amJNQUpNaTBKUzErWjBQTjB3KzVvT29aaXhVU3lnNlNZenJtbFA4ajI1UFB4?=
 =?utf-8?B?OUxNQ0g5OHZnODBDOFZXT2QwZkxGaVhmcVFVZjZBcHFsQWcwd2Fnd3JnczNa?=
 =?utf-8?B?RXUxWERzOVF4OWhXeHVGSkRhcyt0b1h0NkNNMThvcEdJR2ZvN1krMktvR1dm?=
 =?utf-8?B?VFl4QVRaSzFVdXZkUVR2azJsUU8zcHRqRmhLQXBiblBOSUMza0ZYdmRyd1A2?=
 =?utf-8?B?NEJzTDBQTUxNMXhjSGJRV3FBQXRSa2lNVG1PWlRSTWhnL2VyWmgrTlI2cndh?=
 =?utf-8?B?eTZoa2hUSzZMaGE4ck1vdGMySXFEbzBBMjljZjJMWVNOM0R0OWVsRXlKYkkr?=
 =?utf-8?B?WFBITmR6VUNBOEtDK2dpY3NkcEFOU1cvdlgwa0E5VnFydjdGVml0WFdSN3cz?=
 =?utf-8?B?bEszV0s1Sk9IVDdNakZuMEF3MHlKa3d3bkNiY0dJbGJVeHI5WVlxRUoxc09p?=
 =?utf-8?B?ME0wdjN4cEFOcERTUWlIand6dTBnR2hIeXQrbmRJUDd1OUdLQkhWQkxPZytR?=
 =?utf-8?B?NDVsKzRzUWNoQVFyc1VzYnROSHdNbmgwZWN3bGVFNldlbDNZOGRNSWw0WE1t?=
 =?utf-8?B?dFRPSUM5ZVdvMnFUTndqeEVYdDB4aGVTa0pFd2RYWWkwU205YlFEZ2tkSXpi?=
 =?utf-8?B?TmtNeXZtVG82Z3RUOHlSWCt2Q0hOUnJTT0V5Z09hTmw4bjB0eG1YQ3d5QjFw?=
 =?utf-8?B?b2l5Tm0vckhIbzNPK0IzT1RnaUdLRFVTeHJ2WmhlakNjUWZiUVhIUGhzY1Ji?=
 =?utf-8?B?Z3V0R3RkZjZsU2dlT1hmWDVRWHVsSDI0K3VzS0hFR0hOem14bzhzSlNBTWNx?=
 =?utf-8?B?MmRQTDA5cHptcER5dUpTTk1GR2lGVmdsMGwwb1VNdUtSY3cxU0pTTHdVUDN5?=
 =?utf-8?B?L2t5MUZjNkRvMkVPOVBzcVhuYlBGWmVTdnpRakgxZ3RteExhZG9JQ01uTndN?=
 =?utf-8?B?cDhYZUs1WUFGcnZxdk9heTQ5dUJFeUZoU1BNcXoyVlpEaWsyTmtlUkxCSHov?=
 =?utf-8?B?QTNYSE5CalBKaGhJR3lBZlk5L2xDRy9DQlczT2oxUUFNWE9BUGY2SHNzSHpp?=
 =?utf-8?B?MHI3cjFUV3BmQnhJak9ESHFGQjVpZ1g0MHQ3R0cySVZtem02dGQxZHExR20w?=
 =?utf-8?B?Mzk4V0hKVmFUbjc3cEErZHZEWDdYUG1MeU1iRC9CSzZvQS9rNlV4NzAyN1VI?=
 =?utf-8?Q?1t85hhIZ79eqZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzRQbFhVR0ZPZkxONE1zSXYyQmhjcGI4bUU4cVpOUm85SWxnUU5tZ2lQcytM?=
 =?utf-8?B?Z2RCeHBmeTQrbjRFUW9tR2NybU9YTk1tVDdwL0NjWlZXREM2YWZxU0tEcHpk?=
 =?utf-8?B?ZnlZeEJBQ1o3QnJjMEJ5TXFORkxTZ1ByMFV2NE12WTVheENvMEVqd1lDcjhP?=
 =?utf-8?B?OWt1TCs0TUUwOFF5TFZ0ME9yMytvck5vOE50OGpkcXpIbVZzRUdyMGxhOEtR?=
 =?utf-8?B?U1MwM0xuUmpMU1NvNW1PZmJuWkpEZDZUN1JMeVQ1VEJzbUc1LzFoUldMVGs0?=
 =?utf-8?B?aGNDL2syUTJuZEc2TThYR1JPdUFJQUVWc0FZWkQxd25UNHRRYTFCWEN4c3F2?=
 =?utf-8?B?TW95NE53Y0NKeGZkMUpXQUVPOXZSQ3ZqSkJ0U2VmUWJNNDdFVjV3ZlNYZ0wv?=
 =?utf-8?B?dWFtV2ZIMkd1dnQwVHZqeU0yVFlmeGNmank4L2toVmJzL1gzU0U0SGUvMVhI?=
 =?utf-8?B?ckpWWjRNeStBcDNnZ1RUQk9HVmNDeVZMZEM1NnlNbVdHSm9rU2tRWUNhcHhU?=
 =?utf-8?B?dU94U0RlRmdFaFhZdkRxUlk0QlNua3pnclFTeVh2cHYvSmttMnUxRStYcnhz?=
 =?utf-8?B?YVhsVDlIaTBRaGY2SWgwbWxCb2xvVm16RFpkaEh2d1BzSkMwN2FHTDZZSENT?=
 =?utf-8?B?KzNwWUNHN0s0MTVrUnZCeVM0NGtoVEJXUFF1SjFwQlVVV1lHMUpvblNqWmtr?=
 =?utf-8?B?Q1NFSVpVZTFaaWl0d0F4Qkthd2tBTFBIOTkvRVZEOFNQTHFiMzVSU0tVeVhD?=
 =?utf-8?B?cnBhVllyVlRqd1EyT21UcGNjSmplVkd1RnMrdFQ4bGtxQWZmMnkvNlljSGxx?=
 =?utf-8?B?NEt4VjgrQ0htaWVwRjJiMUFRU21KQS8wVGVPUVRKR2dTODdjNUdTblhJMVdG?=
 =?utf-8?B?TDNNTEoyZ2tFUDJVQU5ZZjlVWG9BMHp0UTdRbGZxelFiOVhKRk9pcmsvZXB6?=
 =?utf-8?B?U0JmODA5Rit5SkZkVk1ISkhzcGsrR01vd0lYV3NQdDVTVHlFVHNRYjdXcVVF?=
 =?utf-8?B?M1NnRVEyOVBIUHFha3A3d1B1dmlXd04xamM2NkVSN2tkSTR3ejM4R1pESVBn?=
 =?utf-8?B?MUQxRzd0dFhJMUg5Rkx4Q3VzTnJnS1hodUxrYlVQVXlwWTVBTnp3ZWk3S2xr?=
 =?utf-8?B?bVZ6K2czOGttcm9aR3dRdWpZVDF6TndEejlqMTdYV0liTkR5bTlvRzhUc0s1?=
 =?utf-8?B?bjRKVG5CWHZteFJQMjhvVThWQkJhMTlJdUJzSjNiMnVEd1laRFkzWHJ5akxr?=
 =?utf-8?B?bzdJREtIZ3d6em5kc2lQRTRFa1NxMHZLMEo2L1ZpKzZ4R0ltUHp6Qk0yakRL?=
 =?utf-8?B?alVBT05lU3BnbndoWmRXb3NRR2UrS1JpL0Ixc3p1M1czWXVic21IMzR2Umtr?=
 =?utf-8?B?TmpJRVB2V2ZQTkhzZXZ3TG5TNzZtVWlQNmNkUUxOaGZuQU55V0IzRGtOcWkr?=
 =?utf-8?B?YXJ0Y2RNRllma0ZaeXZzQTI2bnd1V2lTcmVWQ3NTQWN2MkJjZENYQXFKZVNh?=
 =?utf-8?B?VnlqeDdoVkdxS0lOQk9VV052eW96RGZXRVBycmNPSDRpZ3dUZXRkWEh2STh5?=
 =?utf-8?B?UmJ6d1VFcy9ORmt2ZHRUU2lNWGV6dDk2ekxxdVU1Q2NOdnpCN2dRMmVnaXd4?=
 =?utf-8?B?blJzaGszU2s0ZzliTkJjSXpGVkMybGV2SnVmR2xmV1l3N3dkL1ZWdENsbDI1?=
 =?utf-8?B?bVVKQTFYMG90ZmhURU45Mk9DdUtla1hwS282Z0Z1RzdqRS9CRUFkZUhReDQz?=
 =?utf-8?B?eVZ3eEt6QWVWSWxObnM3M1NHbXVCcGhreHhuRVluN3JFOEhMU08vUUs1R1J4?=
 =?utf-8?B?WHFPcDlEOHYyazdPVVlXbDVPNjkyb3Q0MjYrZWk1ckh1eEs4aUR5RitWMVJO?=
 =?utf-8?B?bUV6SEZwQVk3Q04wZkc3YXlYSTZCcmcrbWtWUlBmKzNSSmxiWVZzd0xmRXBX?=
 =?utf-8?B?cVJoM3dtZklBRTZCbEFudk11UXZJeGtOWnB0aXZOakdQd2VzTGJIMHVUUEdJ?=
 =?utf-8?B?N2MxR1JXN2VpMnpEUWpYUnlXTDhkR2hlQ2ZBSFFHK0dTZDh2VjNudXVqN2RZ?=
 =?utf-8?B?ajNlVWdXQVozejBqTFdyYVQ4c0JLVnlrY09hd3hVQ2ZTdG1uQ09tblhpWlB2?=
 =?utf-8?Q?o6ZXZQPlTz5Pl13qqxDlNn12D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 438bedf2-6944-41b4-fd8e-08dd787f2c96
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 22:29:36.3950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHx7m7++QwuRy0O9g/zVIBc0O+4pWConSvOo1xzOAIAqwLhHrwHptW/CCWt7CmDD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5948

Hi Reinette,

On 4/9/2025 10:59 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/9/25 5:58 PM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 4/8/2025 8:41 PM, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 4/8/25 5:41 PM, Moger, Babu wrote:
>>>> Hi Reinette,
>>>>
>>>> On 4/8/2025 4:44 PM, Reinette Chatre wrote:
>>>>> Hi Babu,
>>>>>
>>>>> On 4/7/25 1:12 PM, Moger, Babu wrote:
>>>>>> On 3/21/25 17:50, Reinette Chatre wrote:
>>>>>>> On 1/30/25 1:20 PM, Babu Moger wrote:
>>>>>
>>>>>
>>>>>>>>
>>>>>>>
>>>>>>> AMD also supports what is exposed to user space as "shareable_bits". According
>>>>>>> to APM:
>>>>>>>       Depending on the implementation, some portions of the L3 Cache may be
>>>>>>>       shared by other system functions or used for some other purpose not
>>>>>>>       under the control of the PQOS feature set. The L3 Cache Allocation
>>>>>>>       Sharing Mask returned by CPUID Fn0000_0010_EBX_x1[L3ShareAllocMask] is a
>>>>>>>       bitmask that represents portions of the L3 that may be shared by those
>>>>>>>       functions.
>>>>>>
>>>>>> Here is the complete text.
>>>>>>
>>>>>> The L3 Cache allocation sharing mask (L3ShareAllocMask) returned in EBX by
>>>>>> CPUID Fn0000_0010 with ECX=1 is a bit vector which represents portions of
>>>>>> the cache which may be shared with other system entities or used for some
>>>>>> other purpose not under the control of the QOS feature set. When software
>>>>>> sets a bit in one of the L3_MASK_n registers at the same bit positions a
>>>>>> bit in the L3ShareAllocMask, processors executing with the corresponding
>>>>>> COS will competitively share that portion of the cache with the other
>>>>>> function. If this mask is all 0’s, then there is no other entity in the
>>>>>> system competing with the processors for use of the L3 cache.
>>>>>>
>>>>>> The "L3ShareAllocMask" is always reported as 0 on AMD systems.
>>>>>>
>>>>>>> Could you please include what (if any) the relationship is between the CBM
>>>>>>> discoverable via Fn0000_0010_EBX_x1[L3ShareAllocMask] and the CBM of
>>>>>>> "highest-supported L3_MASK_n register" when SDCIAE is enabled?
>>>>>>
>>>>>> No. There is no relationship in here.
>>>>>>
>>>>>>>
>>>>>>> On the resctrl interface side the documentation currently states:
>>>>>>>
>>>>>>>       "shareable_bits":
>>>>>>>           Bitmask of shareable resource with other executing
>>>>>>>           entities (e.g. I/O). User can use this when
>>>>>>>           setting up exclusive cache partitions. Note that
>>>>>>>           some platforms support devices that have their
>>>>>>>           own settings for cache use which can over-ride
>>>>>>>           these bits.
>>>>>>>
>>>>>>> Even though this was originally used to expose the content of
>>>>>>> Fn0000_0010_EBX_x1[L3ShareAllocMask] the intent of the content does
>>>>>>> seem to also apply to the "io_alloc" CBM also.
>>>>>>
>>>>>> It says "shared by other system functions or used for some other purpose
>>>>>> not under the control of the PQOS feature set".
>>>>>
>>>>> This is a quote from the AMD spec, not the resctrl user interface documentation.
>>>>>
>>>>> Please consider this from resctrl user interface perspective.
>>>>>
>>>>>>
>>>>>> "io_alloc" is PQOS feature set. I feel it should not affect "shareable_bits".
>>>>>
>>>>> When I read the resctrl user interface documentation for "shareable_bits" it
>>>>> sounds relevant to io_alloc. The "shareable_bits" contains a bitmask "of
>>>>> shareable resource with other executing entities (e.g. I/O)" ... is this
>>>>> not exactly io_alloc?
>>>>
>>>> I agree the text is pretty generic. Actually, the whole bit mask (0xfffF) is shareable with io_alloc.
>>>
>>> I think the value of "shareable_bits" presented to user space could be the
>>> actual io_alloc_cbm value. Thus, not the "possible IO bitmask" but the actual
>>
>> Confused little bit here. The shareable_bits is resource property.
>> io_alloc_cbm is domain specific value. Not sure how to display it.
> 
> ah, right. We should still aim to not let the new "io_alloc" interfaces cause
> confusion with the existing "shareable_bits" that is already part of interface and
> used to communicate IO allocation to user space. Perhaps we are just left with
> needing a modification to the existing documentation surrounding "shareable_bits"?

Yes. Agree. Will add the details. Lets go from there.
Thanks
Babu


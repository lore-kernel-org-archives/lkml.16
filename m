Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2075.outbound.protection.outlook.com [40.107.96.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4B115D1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750133226; cv=fail; b=XKXF7eA4jjDPub+0l9Qjo9GdLPqo1iwO8Xm2qLiyH0quyQcbfpJXi9NiQ1tTgwJFzAR886vHDVwW7PqfTJ7WLeH9ok9fMEp7Req1GR6JyZWMrqUKKroGHqxKl05sZihXXNhxdQGObaTJbUiOPmGfqOGx8NMGgBhIjppc314eps4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750133226; c=relaxed/simple;
	bh=lQmu7IXxAwe2sCbbynkuwNpcBbuC69srv0VHPjhWvM0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DDguAA/W3kCVR6cbkb64vHTYSgNee/Hcj47aTNRo55japCu/z4ae4Id0jw1H3NVw18p/LuRpQkAIQXN6LBi66Lwsdh7venYAeuENLZ42oJRbzMuKhGoLKUnI3FqT6Dvg8ZEYa8TbXvKhh3t1J5kaEd9yWLSiDh0gUbV9z4EHHdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KvkxnoQX; arc=fail smtp.client-ip=40.107.96.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KvkxnoQX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7F5Y4JHOTFEVvOi2O4aolsfZDS05Jh0w9QAGZqPG+Mw9KXEnyfl4wDsNyAH57/s0KUbxlLKp0qiOJHuceL/KW3BuXC88blylQ1UfYwjNI1anELFmLlO+2TM5p/rUXAFbHmIbonUnP9QYMB+4faF20BN6lAGrs6pekmo/0JfQLufItiNJqkUFvxmtMEAo0PK/Ei9bYF4RKXcS9c3+TNLt2mb2RDGdLAeheTShwfC/g4KPJJvKxiASvyvTNUcKjA45rGR8jVIa/HjiLQEmB6p/8YvhK7WS4YyLXMBlNUfiuIJ/05BgLaqFtPcTZixGN9SibsuJMdG849bP2P0uMuqeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIYU6asWA1FGu0fe5r+8HMlqnIQVZRBUFRsNU4ucAm4=;
 b=lB5fhg49Z+E2IDHKVywQnW+/FzU/17wf/JZWwDZLzVWCojageK91eD8Drha15P1fBmbc58q8pl6OwRgrReM7nZXGZgsI4VGv7AwWvUVeUzzoywf1YUmdGunYJlTHwLa/CZfRbvURgO6uXBrKx9Fmi5NadIr176SWucQdC0m3efFmnKPgugxYc/otUorKdwhQM7xtb/nBFTzy+aYXKnI7NYH5uj1Hse8KdaZEC/4ua7wtDdqq2BPbVBPFfS8fhcVO+iOv47klxDnANAteyvRy79ndIaRiEPiOj7rjGChxTw7DzKspE7W7yJMrDsbZe306bBFYvxZ/nZHBuZHGR/NPfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIYU6asWA1FGu0fe5r+8HMlqnIQVZRBUFRsNU4ucAm4=;
 b=KvkxnoQXHfhKhd+drgr8W77IuStVLJEtIdoH6UgETVjE5AcwJ17gAlv2Y0Howd8x3KoqZ4R+Xsie/PEeDjZm8k4om6bvnVQJtfNxv2peRoab/wA9s5Q0hl0KlFL8wpX0zoR04LH0bqMYvh5CI0k9PeQjS0aVJPU66/0nYIhZWbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:07:00 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8835.025; Tue, 17 Jun 2025
 04:07:00 +0000
Message-ID: <5e3770f8-3386-4204-9877-bcbec353207e@amd.com>
Date: Tue, 17 Jun 2025 09:36:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/fair: allow imbalance between LLCs under NUMA
To: Jianyong Wu <jianyong.wu@outlook.com>, Jianyong Wu <wujianyong@hygon.cn>,
 mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
References: <20250528070949.723754-1-wujianyong@hygon.cn>
 <e2b79e4e-f964-4fb6-8d23-6b9d9aeb6980@amd.com>
 <SI2PR04MB49310190973DC859BBE05DE2E366A@SI2PR04MB4931.apcprd04.prod.outlook.com>
 <db88ce98-cc24-4697-a744-01c478b7f5c8@amd.com>
 <SI2PR04MB4931A23ABF08616FD8A133D6E370A@SI2PR04MB4931.apcprd04.prod.outlook.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <SI2PR04MB4931A23ABF08616FD8A133D6E370A@SI2PR04MB4931.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::23) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|PH8PR12MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a8f1e44-4d56-4ff9-92e1-08ddad546834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmxqbGNsVzdrZU9GMG0xcEFKL1pJZ3JPRkdCbEpLeklLNE84MjEvKzA3cTFC?=
 =?utf-8?B?OFBsQ1FkYTVyWURmMnVoSXhXV256Rm95Sk1Ga2NQeFhNUCtUMjNCN1ppSC9j?=
 =?utf-8?B?aTA5aHVCUE5TVGZNYyttVTl6MXFtclNyd3VjcFl4K2xwT2JCQmc3VXBNOU5B?=
 =?utf-8?B?ZXBPNm5TeFJJbDdiRWZubVFaSVZKeDB1b3U1ZWxkRDhWSUhkcEFhclRxSVpw?=
 =?utf-8?B?d0FDVEQ4STJMMjZsT2V3M1ZOdVMwZTVGc1BnNnI5ekF0NFh5SGZoZllIdGpi?=
 =?utf-8?B?WXlyZ2MyTTY5TmJ1dm1kLzkvSTdqaFZjLzFlczZjUlU3YStra2E4MmRVTEx2?=
 =?utf-8?B?cENhSlNlbEo4TnA2TUE4Rm1WOHBVaU1vY1g2RGsxZnlqUWwvRkM2OHR1amhj?=
 =?utf-8?B?Sm95Unh3Y0xKUnU3WWU1QVUzUEdSanlsRllnRmFzUWZLY0FreFA4d09DalVE?=
 =?utf-8?B?Wi9SQVMrS0hoc3Q1RnJiWTU2eU5hN2hRWnQ3cmN0V0k2a3A5Y1FzUGlXQnE5?=
 =?utf-8?B?VU0rYTMrcDRNV0Exb2R4RjdOc0dhS3Y4LzNyNE95OTdUNjM2ekpWU0Q0UDZi?=
 =?utf-8?B?amFLeHV0cXhMVWZFSmxFMlcybjVxNXNlazJnL2JCN3A1eGRTaHYvNUJ3TXRk?=
 =?utf-8?B?cEVKQjE0ODBOZnZEbm1iQVhtRlNocm14Zy96VWlpV1A0UE90aDBJWjQwbXhM?=
 =?utf-8?B?ZVU3Q0h5YzZQRTRNM0hReHE5bzl2aExQdDdCeWN4UWRIQ2t3dHpndUMwdVFM?=
 =?utf-8?B?dXJ5UEt1QlV3Wm1ZM3dPbXhPRlBuTzZxamQ3QlJ5RndJNFpvSE1sS0V4b3lk?=
 =?utf-8?B?R0VXd1d6YzVzMHBKOUF4eWJhM0RHU2xlcFhJSmdQei84V3N4RWJlbjBFcmlZ?=
 =?utf-8?B?eENGQU5BZm1VRURwRTB6MU9WRGNLYkFaMFcyTG1NcTJQNXRkWUtlQ2N4d05l?=
 =?utf-8?B?T3RlTzRHQVVWSksvNHpEak9Fc3hnM0lmQXpGaGY5TkF2ZkJvS2pZbExEa1dr?=
 =?utf-8?B?dWJqWkhqNmNrQnVSSHlMa3NpRnF4MEtZMEZOQnFSL1d1YTRLQUhDSkdaK2lR?=
 =?utf-8?B?OC9UMy9uSUtwYWlYZXIrcmcxczZUMFFhaUVJWDdRNkdQL1p0eGJPOXlHVkZM?=
 =?utf-8?B?dkQrOHBiVGc2MTNTTVJOTlkyeXJEL3R5MVdNL2t2OVZ6ekVxSi9qRVNUTmEv?=
 =?utf-8?B?R01Ma2l4RCthTk5aMUJ6eFArSUhnNk5NVEtrZjBJd1pZd1pmeUtkd0VwV1hF?=
 =?utf-8?B?bTRUaUE0MVp3V1puZHd2bVBmSHNINjNOaHRzRnhCVE1ZaUQ5aFplR3pFTmhq?=
 =?utf-8?B?ZncyVm1NQzZPVjdIM3N5RFVOMkcyRkQzV0xsaG5mcjZPaVlnUXdUanRINC9N?=
 =?utf-8?B?ZkZ2bXZCSHVmemFjSjUyOHlyVHQ5RXJLNHp2SHBmWXFFVXhua2JyQnlIQy9q?=
 =?utf-8?B?LzhTVUV5ZVFSUjh0Zzl0YnBXalgxZS9lN2VkY0JCMXRBby9nY2RTY0hrUzl3?=
 =?utf-8?B?L2tCcmhNT3dmaTBhbHdGVUIvOWtleFN5WmovNzR3Mk1yaytXTlh6bzRFZTR6?=
 =?utf-8?B?NTlIaDJLWnc1dG4xK05LeFgvaUdzdkNqalNXR2ladG83SkhwRm92RHhkQVU3?=
 =?utf-8?B?TXF5MjZNbnNqek12azlzd2hZei9DM2h6ejdtSWdoWlAxQm4vMlVhQlViUTZp?=
 =?utf-8?B?NnBBeHhTU2RJcGdlWG1lL2Y4eGNrQlJOTXNVSzl0cFo4bDJJVlJUUjhTTERl?=
 =?utf-8?B?b0ZNQmppZGdDR2RzaGtDRVFYOGpNL3ZJTjNTREcwOXJIS3J1bFFIR0QzMmhO?=
 =?utf-8?B?WEE1dkFFWWFBVnUzdjQ3ZkdROUR3bm90cGNsL3I3U1RPWEZCRzk4WjZHMnNy?=
 =?utf-8?B?cWZBaWh0dEpWRXRhVU1OY1hibUF0bWNMT2ZwNTk2Wkt4R0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFh1N1BJbjZFNVJZcnpBNUxtWnFlTmFpMUNBSWRBSVJpYmhmVVRYLzQ4RzVr?=
 =?utf-8?B?cmZicjhYWTYyb3dpZmU3ZjFmNVFKd2cyYVRGMGtuRXNNaDBsK08vV2tQWk4x?=
 =?utf-8?B?VElmYmRkd01nZnh5dSs5dDJ3bHZEL0JtK1hCUFhIT0FQYW93a2JYK3lSMXdE?=
 =?utf-8?B?LzdGSkp5bnlCRXAzbWZZQTJIMC85dGJlKzRTQXhKZ0RtWmpqVjJNUFpMRmdT?=
 =?utf-8?B?MFZIY3VXaXV2ZCtvTzF5SDkxbFY1OUFzWTZaLzVuZStEcTZLTXY3bStoWUFw?=
 =?utf-8?B?OS9wZVY0NWZWcXRvNkNHTEF3MGt4YXcvR3VzRjJZNVpPYmtJNEJQTjlKRHgy?=
 =?utf-8?B?UTJHVWN4SEdEUzIrY2t6ZkN5T3B5TFpSLzhoUXJyTmxTdlJ0U2tzblhFeDlP?=
 =?utf-8?B?Sy9xdzhOb09RS3VlQnhmUWwzcU9sM0JoRTNvem1hYXNPT2F0akgxMGxyNUN6?=
 =?utf-8?B?aWZ6S3p0dWpoYXlkZ2pQS1pYVUVFekU2TFduVG1YNGFlUm96bFFVUWtHY2Nv?=
 =?utf-8?B?SjlGMmg2TjdGdmlzbEZlUWhqSXhlMWtycktSNDBBOWRLbncwclU0aFJsaGFq?=
 =?utf-8?B?V2lZU2tqeHc0d256aHZHb1FFVEcrTDV3NFhjVlZaM21YUkxDMW83OHB2Mys0?=
 =?utf-8?B?Y3hrU2Jmb0xpdFpPNlBsR2F6V2x6dlJzTGhSVkVsNitDa3VlSWQrUmNwRUZL?=
 =?utf-8?B?Y2dSbTFBb29qc2JqV2pOa0Vtc3JleXVUai9KZzFxc1p3dXA5eTQ4NW5kSm04?=
 =?utf-8?B?MlF3azE2U1IxM3RJRzFnOFh5QWl3aGtuYmVJNWdkMXhVTVE0aUVkWGVKZDRX?=
 =?utf-8?B?MXQvWDhCam9HM2loL21WMGJGSzZ5WE5FS05xZzFSelpGdFFGMC9QRjBmSXRp?=
 =?utf-8?B?SXZUMjdDeGdRYnp5YTJSSG5oWjYrTHlaRHN6UGh3RXdBbzQraWY4TzBBWDVL?=
 =?utf-8?B?dkJPS1hCSzd5Uldrb0Fzc0pqUlRqeFFLczNoT2hzbEd3YU5CL29RRytOMlUz?=
 =?utf-8?B?RWt2Ti9lbjU1SDNwU05oOGtjakp6YUJqd1lRalVQTmE4b3FsY0hXMXp6NkJS?=
 =?utf-8?B?L2lFdktZNXIzdk5pUXZCbXFlMFR1OVVrVTlBclZ4WmdKYkltZHovbGZzVENB?=
 =?utf-8?B?UkZQUm4vbHJ0SWlzdk96d0tpVDNPSDkyUkEvUExCRm9PWEU2djJLV2NJRFY1?=
 =?utf-8?B?T2lkRGRWRXAxYXFlcWJVb3RsaStGVlhYT2YyLzhQMWRqVTZoNEhjUUlOaHYz?=
 =?utf-8?B?WnBvMWFSYzlFUWlqbUJBNUNwZ1gxUERCb01xdmUvclQ1WmxEdXRoL0hlZ1lz?=
 =?utf-8?B?am1BdkdTOU96K29xR0xIVyt3eUxLOEIwRG9tNlloWDZkTWV5RG4xNklRTUhS?=
 =?utf-8?B?aDJtRHZzOFRYS0FreDUxYVlBc1owalBkSFpVT2RvK1hzNW5XYkc0WmptU3Q5?=
 =?utf-8?B?eXVyN2RERHBwQlMraTNFc2FxT0hjSmpvMEE3ZDFvNHJkV3FEME9RckpyK2Jk?=
 =?utf-8?B?RENQb2RuY3JQQnVTODduT3UwTDN2QW11SkxUWVBFTVlSbXdwRUp0K1gyQnBQ?=
 =?utf-8?B?TWt6NjQ4TjQ0VVZORFRwQis3OWc5ZFI4YTcyVmNLanBleDlaMytDNU5pcXBh?=
 =?utf-8?B?RXpYQkU3UjBZOVJ6eHFSelJsZkE0ZThLdXAvNXNKOUNpUnN6elgxOHYyc3Z1?=
 =?utf-8?B?SzZYZHE4Q0w0VEQ0VFNjbG8xM0tlcnpNTmRFQ2JmQ2U4VWhsekxNaGs0T29o?=
 =?utf-8?B?R3NhcEJ3TWJTTGdrMlh1VjNlemRiOG1nRWJSWTNhS2hFS0lUMnFYRHQ3bkZp?=
 =?utf-8?B?OEtoUTcxSzBwMTErSUd1WWcxWitackFGa0pBK3BCMWVHU3l6Uld5aGRRSnFx?=
 =?utf-8?B?Z1FaSTBGUTJzemZFK1FNR0grdVZNSmt1Z2lBMGgyRy80bDNTTlE1ZWt2Z0RT?=
 =?utf-8?B?NGtuZy9raWJqcXVnNURTbHk1ZjUyanpnVkF6clpTSWVIazY0N1NzVkx4ck1i?=
 =?utf-8?B?NkpiLzNneWVKWE9oQXlDWVFQWmNRblUyYS9HTWE0dk5Vb0lJczhGVFBqQkh4?=
 =?utf-8?B?cGVicDQ2b05Qck85Nld5Q3gvdm1oMVZ3a0U5Qk14R0RzMmFwMUorKzllQ21p?=
 =?utf-8?Q?F8XP6w+TI05MmLS1pJWRKYxSm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8f1e44-4d56-4ff9-92e1-08ddad546834
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:07:00.3421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KCNwp2GUqoLDs0sev0NzP74VQnW32XmPz7IgRQl1P/vOI8Y9RpTbgnNssMpnoGh1i0UfE/A9GX9j7SJlV9DSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7326

Hello Jianyong,

On 6/16/2025 7:52 AM, Jianyong Wu wrote:
>> I'll also give this series a spin on my end to see if it helps.
> 
> Would you mind letting me know if you've had a chance to try it out, or if there's any update on the progress?

I queued this up last night but didn't realize tip:sched/core had moved
since my last run so my baseline numbers might inaccurate for
comparison. Please give me one more day and I'll get back to you by
tomorrow after rerunning the baseline.

P.S. I saw a crash towards the end of my test run (might be unrelated)
I'll check on this too and get back to you.

-- 
Thanks and Regards,
Prateek


Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9123824C699;
	Mon, 10 Feb 2025 20:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219178; cv=fail; b=cScs/35Kl82Fn66/vG6hp4+pZrHgvIAWVO1IlLj9k5eii2qveQ8uTkJpxRp4xxcAA6U5s9XfHzPpUkBWHt174k0sT/dETdRqNkkOmiXcX0WB6ihHSUG5HodrPrUi8vGoOiYzEpXuaCh6NYXSINQ6Ele7jnNwrw0A/OulU+1vfeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219178; c=relaxed/simple;
	bh=XzpUyynzmWtC5azXvPejIszjPPzugrWt+mJBGTIKmXk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FQjAfQbagtt0hTF4Zes7lmbnGYoxpQWQgJ8CRLeh6GRDQNXuYjBlDyim/It85euTa+/Mc8U9ZFOPRu9ZUGpOuqz66s+5g6jsDmVh03wcRMIL/B2vVBGgXYKlI9OmDXuKhwhg2/D9z3hybLijWcu4Orzr0e/kKdZrLMnigM4k0HU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=i/+kcH23; arc=fail smtp.client-ip=40.107.244.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="i/+kcH23"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcDd/tiWoM4WZ1EhO5RVgihnWQRfNK6ryFbeIu6bf4zMRnJ3VYrvR2y1EU5kJFFpB3U+gw2MfEzxcFD+tH8Tt4rCq4K15QfiMWysz7nZz7WVnyFfq8PqJtVRLihg8cDh0TdkEQkNHmouZjHQbNolNiWlidAmtMiWw/3p2Kv5WbckaXnA2SICEh7UaqeoAlN+BvP9P5YFe0yE5CKxABi2wlx7DdmjyEIPURv09dtH6kAwrSmH31LX540RItH1PDi923NwshPmRfecnOB3Dq6KS21aXFZAO71bxlwJmXOhR7vK1OL6ve8TLjNqRCLRE6VqDbZUy9FbMZU/HQmNfWzR9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZYmrXL5gUTUa8iy1JTpdhaYV6ECACLrVTDPSVfqBuk=;
 b=RvT7eviR0KMYyMUuMa8bZaLbqjjV1et+xNvENZk1Ljsa3CMPA+4jyn5SbYftGt23kZgmhczcCDEkFdgqPCclUn8vPaJtKyx4t1XY2hWneVSL37CHCg5TQ6y0tJH/0cQI8Bs/fsB8uu3ApH5//qgu00NmeQyrdKdNIypROuM8BY073UpuvYuHQpDl1OIAy6f5ah27ZESUNoP0Ck9OpRJd6dgEDztajcX9iMkFYarfed8QS1K7VICT67Y2svXFfUEjtSx5ujXl5MVxNVz1Dpb2XRN9+vC6UfE8N0NW7tFswPV0cUcygmoBXWK3CguBMExNEOcaJtaiMYUoBZMsGnsZGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZYmrXL5gUTUa8iy1JTpdhaYV6ECACLrVTDPSVfqBuk=;
 b=i/+kcH23WSTixZQ8byIG1W/gXP9T31ML3g2qfiFeZD30TizpNcSO8Ci0g1GW0rFhCwq02dXm5gQZ7dfBLzdjNIr2805zDj5gpqtTq5TAsCg3NQVTSHY6V9/kBZTUXzdf46UBFQSwEYvKDmfjPCLqTV9ckN3zgFjxrRvgl5CwzJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DS0PR12MB7678.namprd12.prod.outlook.com (2603:10b6:8:135::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 20:26:13 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 20:26:13 +0000
Message-ID: <d820ae51-39d1-4f1c-883e-e64f3ad26a82@amd.com>
Date: Mon, 10 Feb 2025 14:26:08 -0600
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v11 08/23] x86/resctrl: Introduce interface to display
 number of monitoring counters
To: Reinette Chatre <reinette.chatre@intel.com>, "Moger, Babu"
 <bmoger@amd.com>, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, tony.luck@intel.com,
 peternewman@google.com
Cc: x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, xiaoyao.li@intel.com,
 seanjc@google.com, xin3.li@intel.com, andrew.cooper3@citrix.com,
 ebiggers@google.com, mario.limonciello@amd.com, james.morse@arm.com,
 tan.shaopeng@fujitsu.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
 eranian@google.com
References: <cover.1737577229.git.babu.moger@amd.com>
 <80457612b98078bd7786c73f83775e4de86c699e.1737577229.git.babu.moger@amd.com>
 <6376ea35-4ce7-4ac1-967b-97f2728228e3@intel.com>
 <a6120ad5-c9fc-48cd-b2a6-cfb7ac33100a@amd.com>
 <11da060c-fb57-486f-bb8d-4ef830a2addb@amd.com>
 <817b0c73-5898-4769-9356-a90435559f84@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <817b0c73-5898-4769-9356-a90435559f84@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::25) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DS0PR12MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a12267-9d1a-4236-2e9f-08dd4a112985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MERzNFV1SnlMcFNWZ0p0M0k2QkVUd1JnZEttRlBDUDZwczB4RGRSMUxPM1Vo?=
 =?utf-8?B?YTNXUEFrMDdpdjRsRDN2d0g0M0VJUGJ0eGo0QnVCUGFZdVlWRXJod01jOTFX?=
 =?utf-8?B?dk41bE1Mb2xoYmlJT0RPN21MVGd0akdHTWpHeUlkemxPVVJhdHJ2SUJUQTBT?=
 =?utf-8?B?MTY0elFEYXFGQjB6TVk2aUxBMEFwZlN2L3A5YjNDd1lzcE5rV0k4ODJXTkg1?=
 =?utf-8?B?Z3FEQjUxNndrMC91NXJVS1gxelVyTmJzdHQraHcveHlOQUV1a0hZU3BhSWcr?=
 =?utf-8?B?RmM1RlRYYmYwUE15T1dKRXAva25ybEowWi8rY0Z6eE5uK1FBRS9nWHRYcGtZ?=
 =?utf-8?B?WnB3Wkk1b3NsK0VoWWEwMUZtSUhnejdCNlNYZmpFUjgzVmMyM01LOEx5VjRQ?=
 =?utf-8?B?aWFRaGJEdFhuYTg5V1c1ekZvRG41dldmU3FtZGZOUjVHUTUyK3BxeVI5UEJF?=
 =?utf-8?B?TEhrNWtNb2JHbXhDZTNPaDA1eVlPWFhtRUE5ektYTFpCbEhpQkFjblU5YVNX?=
 =?utf-8?B?SDROa25XZnNJMjJMblB2bHFKUVd5YmJMVXRUN3ovRGpPTUZEMmJYK2JxM0Nx?=
 =?utf-8?B?TXNEQUdmMDJzdWNKMkgyVDMvc0dDZWJZa1RONGJFc2tEZDd0OU5YVkdQRHJn?=
 =?utf-8?B?VDN2dC9qVWloUU1rWG1xVkkzZHBtTEpQNVRpR0VQREZFTEc0VWxVdWR6K0ts?=
 =?utf-8?B?eGt5Wm5vNWNVMUJaZnhzcTh1MWtGWGFKNmlOMkhBNzVCNWtXYWRSZHN1Ylln?=
 =?utf-8?B?YkIvN0xOc3lXQzluVlc1MVo0Y0lUM29vVmppSkl5dHRxT1lqQUc0T2VNaDZ4?=
 =?utf-8?B?cll4dk91YlVJUXJobmwwblozSDREdmNBVlZzSUNUMWtNZVpxUk1aQ0lPNVF5?=
 =?utf-8?B?ampqdmpaLzBidUk5TUxkZUFFU0Z0Zm9tYkkyOTNCTmZGNHdZWFNjVTV0bkpI?=
 =?utf-8?B?RU42VUpJTysvWDlRUGNkbFBqdTFhWG40VFhGOWcrbVJtdCt4YXc3RkNEUm8z?=
 =?utf-8?B?WTJiYllrRmpxNmpyRWJqN3pCejdSajJxQmJ5TjdXWUJBSmVJVEhWT3ptUWdY?=
 =?utf-8?B?dEpudDZuTktVcXBUbnpCUm9FTzFkZ2tCVkNkaUlYc2p4RW00MnFVbHgyOFFS?=
 =?utf-8?B?eDRRbXErajJPY3NNUlNpNlhGQVNQY2VnVm1FZHpLUm05TENreksxazN2STlw?=
 =?utf-8?B?S0RXd3FQeHM5N3dZU3JDTCtseUpKbVdURkhWdElNNEF1VFYyVW50VGdYem9o?=
 =?utf-8?B?emVzeXpMTmlPY25rVyt3VkxUL2Yrd1BMZjg3bmhMb1dISUo3Q0RaN2UwU1Rh?=
 =?utf-8?B?RUo0YVVaK0dUSGU4c0ZvUFJPK2hDaTZ1UnlkWklnL255MFoxMkFaVGE1QXc2?=
 =?utf-8?B?YWM5Mnd4c2s5RktjS3JuRjU5Q0ZSNU9ZUUQxQk5iOXZKWlUwbGw5cndURTkz?=
 =?utf-8?B?K0E5YmkyRkRxQmxNcHRHMkx2WEdtdjgvQkdNRzZBdlp5V21iNlhxOU5VMzNT?=
 =?utf-8?B?RFFYcW1acVNnWnhDS2FCRHQxNUdZM0l1N2ZZMjdMdVJ3MXd6UEFSWm5aRTg0?=
 =?utf-8?B?bXdBWUhyMkRpbCtIeTRFeVdTKzFENXYvdGUyNXRSVGVKODFWbnh5VzlQaWxx?=
 =?utf-8?B?VWJtU3IxRGZ0RTdmS0RFOEp3NGw3am94QjY2c1RGTWtsRHRKaG1NVk9wVy9a?=
 =?utf-8?B?SlFRVm55VHdteVE4Um1vbFFES2MrNm1NUnVObUQxakhvUSsxN253c0gwcmFr?=
 =?utf-8?B?Z0tYTnJlTFBwd3pDYzJmanNXMllBTmtnQ3pwN3Z3dVpYemM2L241b1NQSTVi?=
 =?utf-8?B?SzM4MGpocWhMWGtlU1QrQWtXZjlaWWI1ZmNwek41UE5PcCtZTm41RGZ4TWlh?=
 =?utf-8?B?cG9iaXU0WWZmZUFPQVhZTnE1UFdTTWNJZGdPckxIdjVtNE5kNjVDSEQxQXN6?=
 =?utf-8?Q?GxX8otHrpxc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlZpLzg4Z3g3OE96Z0k4Tit3Szd4QzhwUXVIa2xMNFVTb3d3NzJKTGFqQmky?=
 =?utf-8?B?SG9ZdDNWZGNSWmJtZVFTUjNsQjRwd1N4dkxrQkFudHdmSTM2MDd6T2k1cHRM?=
 =?utf-8?B?bjBjcDE0cnR6dkxZQS9mdG1IUE5kdkpoaWpsRHNxcEN6R0JITDB3bWt5WGM2?=
 =?utf-8?B?SjAyQzh2clZtMURIVmk4QmJCd3ZMNk1aa0phSTQ3MFBQNzQrUnNVVlY4a0JN?=
 =?utf-8?B?dHliVDJ5Wmc1OElJdFBMTUlScmFyOHZEOU9VMHYzSDhLcFBERzU3LzlUMTVx?=
 =?utf-8?B?bFhnVzRsOHJNaG9ybTZmQUFWSjZ3cWFjS01FMGQyZllQYUcvSnRoSXN5Ym9G?=
 =?utf-8?B?alE2NUxTaFpXZ3AzZm1lYVB6WFdtQWFrNnp6dys1Uk83TmxqRm1NZmJENTBB?=
 =?utf-8?B?K0JPTGI0a3FJMTFDKzl4VS8zKzNIK2Uzdkg3MG03cEZpRmJYc25XWjJzMlV5?=
 =?utf-8?B?b0x0MWpWWVljcndhSm1Jb2hnT24xN2FXd004MVViUVhUMFpOMkYwOE81WHIr?=
 =?utf-8?B?VDRhVTdvbWRINERRWXdoOHJyZTFlOEw0K3VRMk9sWWJjaGgyS1cvMGI3eU9C?=
 =?utf-8?B?VHBkdkxLQ2FncFFjaVFuaFhXOU0xQXVLK1BiZXYvTHY5Mmx4WmgxeEZRb1JB?=
 =?utf-8?B?dnFESG9IVk0vL2F5L0ZGaVRheXpvRVJvWkJCOXV6NXNNSStvMUZ4bUJJellJ?=
 =?utf-8?B?VHl6NTNnV0twRXQ0Q3QzRjllK0sxcXRHOWlDT01KQ2g2QUZXWFpya1dnd2dk?=
 =?utf-8?B?YzZUOWorRDZYdGFNWHpFVWZlK0hGamtVYTF4VlduVEhtMlpCbnlmbHVXcm9j?=
 =?utf-8?B?WFpxSG05eDhtTE5tSmw2Y3JjampLWUJGbGlIVWFRNURMaElEWEg3NU9nN0xj?=
 =?utf-8?B?djhJak1ZTWxvTk9WQ1B2TVlKTkF1UE5UaytrQWFGNXQ3RUZvSzRWYXRCWnk4?=
 =?utf-8?B?UzN6NkhnU0tUQk9QL3ZKVmR3dGx6ajZWbW9TWHpKSUlMMXo5NnRSV0VpZlR4?=
 =?utf-8?B?b2N1ZlZ4R1FzZXlRWlhnVzZWU0tVaVZFSVd5bnB4OVV3R3dQNjRYOE1KZnZ2?=
 =?utf-8?B?R1FGVmovZGxzN3J1S0VPNG14MUdZNWY5bDFpRWEyRWkrTS9jditEVERYUkpU?=
 =?utf-8?B?aDQyQzVHV2tWWXdRaURDbWdXOVBvaDEzdnI2UmhLN0U0SGRwQUxVTFU5Qkd1?=
 =?utf-8?B?SzNXaUVnQ240SUVDU21qUG1rbjVPaDNVUS9Id0FsUGpNT0FiV2gyZk1xdHE5?=
 =?utf-8?B?alNLWGYrMDQyZHVtUW96ZDV0VjJkY2RZak1JcEwveURwRlRwZVYzOFZobi93?=
 =?utf-8?B?dEdxY0VJL2FMbG1MdEFzbEhvZjdSaXZadGNxTVU4RmRpTW8zamRnSmMrMDI2?=
 =?utf-8?B?dllIbzhvUE9mbDNhaURsMDFDaXpVQjJ0NTBzYVlDa1JoZE15bXd3WllubC9H?=
 =?utf-8?B?UlFZaXpVSFdwZVZlK3VxUVdhQ0RnbEtQVW5wdzM3ek5OUTdwYU9NR0UxamZG?=
 =?utf-8?B?TFFJdzMxN0ZWT3FuRG5kcGpLRmxxaVRuMDNWZGp2UlFydDBPcHVOQStkbEFW?=
 =?utf-8?B?V3JwR1g0b2NTTTRsMGdDTWlUU3ZCbTNkZHhqVUZGblI2b2dvT2NSUktwQWRs?=
 =?utf-8?B?bUFuV094S09QQm0vOHQwbnB6NEJXS1JqdjdZS0xwa2dmTE4ra0g4Y1NVY2cv?=
 =?utf-8?B?UHdIWnIwQ1NGenVFOFU0cy9wb3JCVU9VRlBkWVN5d2RJcm8zdmIxaFo2azBR?=
 =?utf-8?B?aDQ4WlhLN09BNDZTOUxrZmQ4dnIzaHNlWVFlTHBxeTIyNy9Uc3B4Nk1QT2Jp?=
 =?utf-8?B?SzNjSVdyV0J3aGZBZkdRdzV5UlVWa1pQY2pLK0lqM1NrcUVkMWVsU0N1VWw5?=
 =?utf-8?B?c0QwU0dQWUYzSlVWWWg4c0I3UmVHRmZYVGNMdjB1elBSeXZYSGtsYlZxdHFB?=
 =?utf-8?B?b0hTamxSUk5ISEV2cCs2SjFFdS9ZQ0RGS2poWmdxL055THBZMVBRSVZCa0RS?=
 =?utf-8?B?WVF0YlIraHJKQjBzRmZXbW5TYlg3NHVCbjZPbHFBeGdjRkQxWUVKVXYwV0NM?=
 =?utf-8?B?ekFyUFB4VEhMeE9kVFYzUCtqOGFIVG1QQy95eFdrWDdPd3NHRmE5SHd4anlQ?=
 =?utf-8?Q?Vlfg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a12267-9d1a-4236-2e9f-08dd4a112985
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 20:26:13.0433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uG3WkDI3KrCdT2Dgq2N8giMjGGwAwGqkNP6+c5UujPotwsxhLfNB48uoFsjaQoYE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7678

Hi Reinette,

On 2/10/25 12:08, Reinette Chatre wrote:
> Hi Babu,
> 
> On 2/7/25 10:52 AM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 2/7/2025 11:18 AM, Moger, Babu wrote:
>>> Does this look ok? Just added domain in the text.
>>>
>>> "The number of monitoring counters available in each domain for assignment when the system supports mbm_cntr_assign mode.
>>> ::
>>>    # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
>>>    32
>>>
>>> The resctrl file system supports tracking up to two memory bandwidth
>>> events per monitoring group: mbm_total_bytes and/or mbm_local_bytes.
>>> Up to two counters can be assigned per monitoring group, one for each
>>> memory bandwidth event in each domain. More monitoring groups can be tracked by assigning one counter per monitoring group. However, doing so limits memory bandwidth tracking to a single memory bandwidth event per
>>> monitoring group."
>>
>> Revised again:
>>
>> "The number of monitoring counters available in each domain for assignment when the system supports mbm_cntr_assign mode. For example, on a system with 32 monitoring counters:
> 
> I think we need to be careful with "available" since all these counters
> may not be available. That is why "available_mbm_cntrs" exist.
> 
> How about something like (please feel free to improve):
> "The maximum number of monitoring counters (total of available and assigned counters)
>  in each domain when the system supports mbm_cntr_assign mode." 

Sure.

> Could you please make the "For example" a new paragraph (this follows existing style in the
> docs). It could also be made more specific, for example,
> 
> "For example, on a system with 32 monitoring counters in each domain:"

Yes.

> 
>> ::
>>   # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
>>   32
>>
> 
> The rest of the documentation seems like a repeat of what can be found in
> the "mbm_assign_mode" section right above it. It does not look as though
> any information will be lost by dropping the text below?

Sure.

> 
>> The resctrl file system supports tracking up to two memory bandwidth
>> events per monitoring group: mbm_total_bytes and/or mbm_local_bytes.
>> Up to two counters can be assigned per monitoring group, one for each
>> memory bandwidth event in each domain. More monitoring groups can be tracked by assigning one counter per monitoring group. However, doing so limits memory bandwidth tracking to a single memory bandwidth event per
>> monitoring group."
>>
>> Thanks
>> Babu
> 
> Reinette
> 

-- 
Thanks
Babu Moger

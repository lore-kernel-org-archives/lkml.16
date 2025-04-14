Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48691DF723;
	Mon, 14 Apr 2025 20:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662616; cv=fail; b=CVW98gUbER/YP/7taEaPt+r7Nv2on/xQ/upfQqZJPEDJjmRQraT04XNuqdQZ/Pj2B4388yWstS34eozq3arNAeOm3XJniacdqR6ov20bhColDXtJexx9RmVw0mymAYAQrv6nyYQX6EXAZhMtO95AKqdLHDli1eVc6K27W73BlBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662616; c=relaxed/simple;
	bh=3GKq7YEAwCDlCQfRbbH3GcB5P5SGRK9v2kOZ05yLQwk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E6uKJEiBng/n0Yjb1IROj4gcmZrlvVsSdJ6xPf3voLWpehF+W5Ho/qCh7MmvwTrM08cWQbgujBBZ628dZDfo/SmcChnAHLlLxrdRjdP+orvYVd76UA8F8lF6MVCbPbDJ09fQlDL8lj7L1YweKnxYYgGWi2/2IP0zmBNYHNN5Cd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ydKM9W3s; arc=fail smtp.client-ip=40.107.244.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ydKM9W3s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhseuh2CnQdPL5awJuqeDv2KHbAkyehqggys+jKnxuTqoVXKxxXfsE8C5TmMvMywgo/quNrefWPWggLjIcsfA8T+0Ame0/yr1ju4CKNH/+9y1c1ejshxIAaN6Bb5nZfRHNEnFm6EAleMVDJDrygsZaUAISBO0IIgPAzYo+V8lQI5sFv7HCOGZyQd3lLaI1FMYW5oL1i9nUIrZ9jLifek31WxHpmgJV9SuLS2YcaBXNUckO1yATwmzO6AhBYVIkQxhWeQ/+i2czt8lkSO2glOb3vHu3vX3EtX3KU8jn4DV/nWx2xhRGFyWzXQ6ZN1QhHWW7/5hzW4QjLieVNmeDWtQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uotC1ooU0CN4eUMyDDWIXcDiTvX++cepQWbnb4dSluE=;
 b=cKU160Ve2kdp9Jk6AHqFnvBJkJCZMKisaf+3ugdao0du9CnqoBnh5Uvsf5ocdHDqGYPCqZBCfSuD74lgolek7zC6MJU4lDQU4DFEIydtX976cK4FiVmSBY74RZUthxIqcpfhBJ9NO6y1E2evI9tgsX9zYeUjbKlPGwO4mS3/hV9agkAVpH+iknyfWN6tggEc7UHbAqehEISleWEzp3AmIswEPHx6GiFvXDA6akfaPKITbnpoYuYTr7O8VGa7G9BcNO27kT6fqD2TdGK9cMz1CdMEe83eSa46JQrJrUPNv1ASgqeqKFJuLGSnijiEw6z9Dz/8QhwQrTlU6fRGrTtzUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uotC1ooU0CN4eUMyDDWIXcDiTvX++cepQWbnb4dSluE=;
 b=ydKM9W3sRgURsBddUbabnjITr2G+dpQ7UicaUbpguJZsMpS8B7Fi2qnc1yKEmZxa4RcLbebOZ+K0KrlXv6odYJY5o3Cg2cByVX1pmOUl6qOm5nuLfN1obLDg+fp0w3zA3SBBU00ZVm8kvXm2ylUR5o6b4ANgtyJkfq7jnSXZ644=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DS7PR12MB6141.namprd12.prod.outlook.com (2603:10b6:8:9b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 20:30:10 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 20:30:10 +0000
Message-ID: <0d8cb80a-d34e-461a-9864-cadd5497bcf1@amd.com>
Date: Mon, 14 Apr 2025 15:30:06 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 12/26] x86/resctrl: Add data structures and
 definitions for ABMC assignment
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 peternewman@google.com
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com,
 rostedt@goodmis.org, ardb@kernel.org, gregkh@linuxfoundation.org,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
 alexandre.chartre@oracle.com, pawan.kumar.gupta@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 xin3.li@intel.com, ebiggers@google.com, xin@zytor.com,
 sohil.mehta@intel.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1743725907.git.babu.moger@amd.com>
 <3a15e2e5d6c8a5e9ee65b3fae48ada7eafb77628.1743725907.git.babu.moger@amd.com>
 <cb71665f-a732-4fd9-90cf-213f5609e872@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <cb71665f-a732-4fd9-90cf-213f5609e872@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0052.namprd12.prod.outlook.com
 (2603:10b6:802:20::23) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DS7PR12MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: ce661890-4360-45ad-8f2e-08dd7b9326dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aU9XZ2lPYi84bTZ1UkhuK0VFZmNUUXVhVG50alVLbklPdWdNbDNteFkyNDdX?=
 =?utf-8?B?VUtGQjR3VHIvNzZ6YVlBNmx0LzdYNG85QkxKYnFlWWNxdUJYb0tzZnU0ZlFP?=
 =?utf-8?B?MFZhbm5TS2tmVDhwVDZ6aHdzMUdudzQzcmdIWElxNHhFclBPL0o4aE5IUGx1?=
 =?utf-8?B?MXpuNDBHTldvc2dySnFLRTlWZUo1K1MzcVFXek5ENk9MRFk5WGVvcFZyMzFN?=
 =?utf-8?B?emhTcThzckZxLytVbzVBRVllOXJvZHBLNDVGR3BHMUNQNnJpQ29maDZwNDBz?=
 =?utf-8?B?Q0M5R0psT2ZrRTBIbGZyQkFYTUNFSVBlVnJiTDk4YXgyc0xuNDZ6RWdZTEhI?=
 =?utf-8?B?Yis0ZjBBaDd5N0o3ZUZVWEpnL1NNM0Q2c0tqdHZiRCtVaE0wK250a1d5cFI1?=
 =?utf-8?B?WnhYR2srMkxCVjdmSDhyek1kbzZQWEsycG1YbTFrT2t3Ym5RVExzK2tVcEhQ?=
 =?utf-8?B?ZGhZcTdxOUhHYW1jNHlRWi8zVmcwS05adEdNY2VQdS9GWnl2aXgxdHJEQ1Q3?=
 =?utf-8?B?SnRyQ2tvUFFWUXNaUVFrNytmb3ZURjBqRTIzakg1MEZybk5tUEM0QVZXdTBy?=
 =?utf-8?B?ZnpvUmR0VHBHY2Rid092UC9wdm5yNHBVSXBaUzJmUk5MT05reGZxMitjdVRK?=
 =?utf-8?B?MmJRQ2x1RDNCV1o4TVZ1VGFjNzd4Y1ZjdTdyVDFNeDdRVE5uYlFYMTQ5SmtS?=
 =?utf-8?B?VWVVWDVHa0FsaGZSR3NyQW5PaE0yekpyaGdIR2xBUVJQaDJ6TVlGRFkrYUJJ?=
 =?utf-8?B?MTNoQmV5ZDF6c0FRQjhmSXk3V09NRTgvSEFPS21YblFOLzlaYmxCR1lKU0tS?=
 =?utf-8?B?Nlk0K3FxQmRLYWdXTnNveS8wemd2SFQrZkdhdi9GNEJBTGw2Vk5CS1FHdFZt?=
 =?utf-8?B?dTFCRHBKQVp3WDhHbm56dEhSNml6SS9MMXVseklTaUloci9pYmNHNDY3VlVv?=
 =?utf-8?B?dGxzWWZXaHlpREJLajdMaWtwa2VTS2g3VUlZdEw4VGhMcThnYmlyaEhpN2Vi?=
 =?utf-8?B?alBaR2oyMkg1RkYvdUdSSHdEQ211eVBCY3VWY2R1bTJwaUh0WWhvd1dkTk5z?=
 =?utf-8?B?YnkzdU5OTE1kVENkS0E2T3RVSGR3UzdlcVdnNVVJVkcrbW10YVdJTDJjYzBv?=
 =?utf-8?B?SU9kRlRyVEI1VU1EZ3hvcTFVRGlnd1dKbFdRbFRuTm8rNVlMLzZVVDZqTWNt?=
 =?utf-8?B?UnRyR0VtOGlqdHU1VHFYWEdDMDZtN0pmdVdQSitYTEVzS0UzUmJhemZVZVBF?=
 =?utf-8?B?MnJOK1krUmFQYWRneFdVdTFUaHZDSkt5RHpkZVBTMzRMUy9HcDFYNWhFdHg3?=
 =?utf-8?B?ZnBScUZVOEc5K2Q5WEl5VnhNdDNVaURDSGJXcGFrQ0dsY3lRdUh4NStXVzdJ?=
 =?utf-8?B?NFptOURLY0hJdE02eW5PWnEvbzJpbUxHbUorRGk1Mm04eWprc05EWmZiSjI5?=
 =?utf-8?B?cmhzRmROVHlXNWhWaThSR0p6bEN2cHVGMXpzcjlrdHVKVkc2RmxPaGEwQ1Nn?=
 =?utf-8?B?VE02OW5FNEVIUUx0RXNIOHVZV2pQUU1qVG1DR25hQmdLTzVIOHhYV2NFZTNN?=
 =?utf-8?B?YXYzQkEwWDhIKzdTRXBkemZrQnRBOUMxbkRPbjd2WWF2aWh1bVNvNVQrSlNU?=
 =?utf-8?B?K3BLL3U3YWNVWlFCOHBqL0ZhMEd5V2VJVk5WVHhNaENnYXRlNlZITUtFVWJa?=
 =?utf-8?B?ZEt2Q05qdjZ3TFZSejcrMnZneG8yY3RyNzJ2MlNINlNMaUNPSDVleTU5eVVt?=
 =?utf-8?B?Q1IrZjlQTTljMnJzM1N2V3ZlRzhwSkdDb0ptWkpYZlhKOCtNemZFekpuSEty?=
 =?utf-8?B?UXJGelpndHF3NXhDMm0zNUJydU91L2NENkMwT3AvK016YWtVLzRxaGFFOFpx?=
 =?utf-8?B?Y3NRdzlzdFdMMmpsNWVGeFFRVkZxU2RCRy9CSzBiN29YSlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGNCdSs1MURnQWtpZEJ3a3RnL203VExLWlVHWldMVzQrem80WUk2MHg4dkhN?=
 =?utf-8?B?aDNJSEsvZWl6aDZ1bXNUSFk4Qk1uRzYwa3RGaXNGZFVrQjUzZitiNDhmV2Va?=
 =?utf-8?B?YWhpRjJYZWdjQTA2NmRFZHFmbTNkdmtnR294dmtzOVhiRHpkU1VDYnpOSHZ3?=
 =?utf-8?B?cFdUblhoVHpNUjVvRWxTWGJNV0dLb1c2RjlCNWwveEZwUEtsQzZHU24xZGxq?=
 =?utf-8?B?LytjYmE1cmJhQUZUd01YY3YzUU5XV21kb283MGhEcjhTK1E1dThkVlgvamdS?=
 =?utf-8?B?ajhBRWZHbXhGZ0cyM1YwcXFZZjdlQTVPRnN0TDNNOC9WTzlzR1lQcnJGbnpS?=
 =?utf-8?B?TlVySml5aFdvZmRGM2RkWHZaV2JWVGtNTnV6bktvSkd1SS9ORVo1OFhpYUdO?=
 =?utf-8?B?TFI5OXV0c0JiNkc3SHpHSWNiMXRJSEsvSTFpR083M1BqNFAxNU02ZXl4NkJX?=
 =?utf-8?B?amUwUGZWOVcwSnFTVEVyTkNxdG9IdWVXZTN4QmQ0WWF1aHhqM3JqL3g2bVY4?=
 =?utf-8?B?WDErKzNaVDZUQy9aV2dsTEV6c21uN1NBUTNGSlU1bGdwT3phZit3YkRlcCtr?=
 =?utf-8?B?NWtuMWZZZysyc1B1ZGhIZkIzS1JqRCtZMXhVTkZkajMweWxUWXdNMkNGWUh3?=
 =?utf-8?B?NGVpM2JXVXgxaXMvTTZCTzVFamZQYzFxMXhqdzlqTDlVTmEvZUlQclNEd3Zx?=
 =?utf-8?B?SDBRRFZWYWxlWlU2SjZsS3BLa2d5YmxuWExJdjFjR3E1ajQ4SDU3WEJxa3dw?=
 =?utf-8?B?b0VrMldZUHYrODdTelQxSExTQzZXUzZNZ0FmdE1tdm9FM3hiVnpBVkFGeC9P?=
 =?utf-8?B?SjNKWHNpTk1WRUJ3cWtTdWlLdEU3L0hVdWFZNTVla05NbUlkOXJPcmxraGlV?=
 =?utf-8?B?bDlRbzFTdDVhZ1pNWmNiNksrOXcyUGhmZVRPOW1GNDlhdXBaTk1QckhIVS8v?=
 =?utf-8?B?SEszZ2NTRm1OOGVPOTg1TjBDOU1Pb2ZLVU1ZQnQzdmd5KzYzbFl6ZTk2T3p1?=
 =?utf-8?B?cUZ6OWg2ZkJFZWNudDFnbGtrR1UvRmROdXJ0Kzl2VTRCbXNsbXRiY1o1Sktq?=
 =?utf-8?B?U3oyU1IwUGxTZ2dHamJHV3Y5QUhRZ1lwcFFtRTc3azBmbjRrZzA5dlJIR21L?=
 =?utf-8?B?WWpIdGNiWDFwQ1Rza3NQOWxDUDFESFhOd1d3T3BLdk1wdDZTYk1hdWt4SHM3?=
 =?utf-8?B?aW1zWjRObWJsemw1V3VPMkRVUVNpeUZJc3ZJMVFmTGdyWkJsbFFwbVIrbEEw?=
 =?utf-8?B?SGgvdW00TDhCVnYrMEtuSmlpRHlHVUZ3R1FCazVzZWFVcGMxS0xDZVdERm4y?=
 =?utf-8?B?anFwbUQ1cklKdzlnczhZRDNnbFZ4eEFBTWw1UEpxZWNYeDhWUmp1am9xUWVZ?=
 =?utf-8?B?MHJkUFVjT1FnV3RJNmNJWGRBVjdMUm1zM3Q5aXZoSWpneVFSZUtRVXMwWTZv?=
 =?utf-8?B?SjZUSklnSWhLV0o4akVhMVF3bGFHbE95TDlQWVpnbzYxSUs4NkIyQkRBa1or?=
 =?utf-8?B?MkdGZk5qVGRkdGNLeGNXcHJSNXEyMVNIL2JMVSttd0dlUTM1LzJtZFQ1eVlz?=
 =?utf-8?B?TEREMHNTa2tXeTAxRms3TGkvd3gyc1V2VlpWaUdPZmNuTCs1ektaUVNYTjV2?=
 =?utf-8?B?bnNHVkJOczIzcXJMQlJvMU8zb2FDUm8yMmtKL1o0SkhFUUtRTGtkbVByOU9H?=
 =?utf-8?B?cUFoWTI4UmRZMkNsVGxLU0psckNBWEpuaDM4eVM0bVkvM0V6TXZrWFgyb2Z0?=
 =?utf-8?B?OEY0L3hLY0pLck85cnVBbHNjeHVDYjBOZjZMNUMySDFBTU1UemJkS3V6bzl5?=
 =?utf-8?B?ZUdobFlTRmRZSTZTbXp1YnJJc3A2Zi9JZGhGODFTWnJoaFZIZjRzdEx6NVQ0?=
 =?utf-8?B?dXZ0cklsR2w0OENhKytXOXJzMWFGbHdDMHc4TUNhMk1RSUx6UlVTNW9UOU5J?=
 =?utf-8?B?Q2xsMEJGMGdKOWJGUUxWQWhwOG1qNVlxOUJEM1hZWlY3L3NRU1dFQW1tc3VZ?=
 =?utf-8?B?VnFGamdqblZFSnplYzd4ZC81aFRQK1NtSHNsVnFOZm1ZRHNPOSswcFoxOFhI?=
 =?utf-8?B?UmJWUFkwK0pZRVBvMVJzd2FzR0pJZU1ZYWQrR2ZBclhtWG9TNXhBLy8wK0Zz?=
 =?utf-8?Q?cKOw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce661890-4360-45ad-8f2e-08dd7b9326dd
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 20:30:10.0599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2iwJoMPQIu611J+OohNcAvktBiraPOnUKX3CtHS16Hu+zKY0TLMBMcALY00Ps5+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6141

Hi Reinette,

On 4/11/25 16:01, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/3/25 5:18 PM, Babu Moger wrote:
>> The ABMC feature provides an option to the user to assign a hardware
>> counter to an RMID, event pair and monitor the bandwidth as long as the
>> counter is assigned. The bandwidth events will be tracked by the hardware
>> until the user changes the configuration. Each resctrl group can configure
>> maximum two counters, one for total event and one for local event.
>>
>> The ABMC feature implements an MSR L3_QOS_ABMC_CFG (C000_03FDh).
>> Configuration is done by setting the counter id, bandwidth source (RMID)
>> and bandwidth configuration supported by BMEC (Bandwidth Monitoring Event
>> Configuration).
> 
> Apart from the BMEC optimization in patch #1 and patch #2 this is the
> first and only mention of BMEC dependency I see in this series while I do
> not see implementation support for this. What am I missing?
> 

My mistake. I should have corrected it.  How about this?

"The ABMC feature implements an MSR L3_QOS_ABMC_CFG (C000_03FDh).
ABMC counter assignment is done by setting the counter id, bandwidth
source (RMID) and bandwidth configuration. Users will have the option to
change the bandwidth configuration using resctrl interface which will be
introduced later in the series."

-- 
Thanks
Babu Moger

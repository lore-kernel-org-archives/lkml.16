Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7056C1D5173
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749785348; cv=fail; b=m5Mkctb6si1CEZKaV7TootSIk9+9V/vpEKW+JDGOD/6MrBd03+O+lc94gJKCHL9a5e0+MDkglXqlw+6+8BXu0GiGbaBq4BlZrlL3aJYZqhE7tbKOwmb2vyhMlSVGU7SPpoc11TONQQ2CVCilM/J9uRQqPSVThjCpf41lHRe8R4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749785348; c=relaxed/simple;
	bh=lSxKW/fR+FhHbzcGfV64AEN5qGMKM/I5C2V8WwuZsvM=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SxnNyarvRQkUPCF1driq5reOsWrGqNu09N94OTzCjvxX5YZAKbQC9tfWcDTqGuMpTInGlaS6jg4WMephLTloCVlGOhxBUzYnWfTRhUph8QFMmzB/KNmXQg6bTD9ekuhcs934UR0T6mqmiloXDPPjrYzdmuJvoSCu/mXcVIWF8J0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=L4Tq+z7r; arc=fail smtp.client-ip=40.107.92.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="L4Tq+z7r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2A1lNRa0KqxeuyzCESiero8rpremV/Pz2BYOiKzaNSzG/my/2LUVEg5lGXVyLoik8BdQwH8VyDQF2K59bTCmAZVcwe3tK8znxow01DTIDmkA/1rZk5DHR7l+yANBG1sbTfFkyW5KwnCHweVbaxid18D/TVY97CAt23kYsMafWGBSmSs5n2xOkI6OFWxbwev99HGeCLrw9eVvxmonqLKmoXCpePhS2sZDBbAQZsAP63Wl3hPdk2tXyVLrD52UnnFcXJ7QJUevDjONIGH+vgvB23XqP1y7Gq4dNVmtxBxWsECGQ8aAJakUAgx3zvt3j1yy40lusRzRgB0tT8O7RdpWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K18qzP49AfI6F180l3mDkn6/QGWd9MKKhH9ZL6W+y+M=;
 b=P3UN966LwdW9F2PtyhQIMnfHOWopmZkqx6eK6o0aJO5Gi+7LlCNiEF+4esf97wAMbT1ZvbcaovmRsuxOJcCkAmVsqP2mnfE7LwTA/gUR0rEjPHiGNBZSqkpEbwABKdGuq/TFeL3f3kAQisfmWI3KqRpRsT2lmHifibjN5o8Hci/I2DvTaY+/vfjeXWSL3YTBkCIMP7Ht03+D/LgdxsBId14P5qDzJsq4V2t9cAdthMszB5eU9zRO3CVWJSNfJ6KeCMSW6diDFmPIhAte+XtjV/S3OtZauZiI2zpLLYbipPxx8er6gKyWO6T01HMyZZ/pOoF3YcBIKhVKaBSwLwkApw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K18qzP49AfI6F180l3mDkn6/QGWd9MKKhH9ZL6W+y+M=;
 b=L4Tq+z7rVwLliKOdNU56aeGX1BF4kXcHvYC3qZtcrtaveIHyNygfd2J54qeLpq62nAZ75brEmvrsBojk1JZbao4p+pcHrz8EK2WzAWN5ZNoBYtSFuUPC/fGmBz7Fi2ySrZoUQqaoe7VveSqCBNDiyg4dlwR85Y/2AzZ3q8PUZJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by DS2PR12MB9615.namprd12.prod.outlook.com (2603:10b6:8:275::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 03:29:03 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%7]) with mapi id 15.20.8792.040; Fri, 13 Jun 2025
 03:29:03 +0000
Message-ID: <2d747fb5-81e7-48ac-ae51-db737a170b81@amd.com>
Date: Fri, 13 Jun 2025 08:58:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 0/5] sched: Try and address some recent-ish
 regressions
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
 juri.lelli@redhat.com, vincent.guittot@linaro.org
Cc: linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, clm@meta.com
References: <20250520094538.086709102@infradead.org>
 <2bb35bb3-cbe4-460f-a209-1fe4095e1dce@amd.com>
Content-Language: en-US
In-Reply-To: <2bb35bb3-cbe4-460f-a209-1fe4095e1dce@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2af::9) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|DS2PR12MB9615:EE_
X-MS-Office365-Filtering-Correlation-Id: 90384f9e-3809-4621-f4a1-08ddaa2a7196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjRxM015d1c4M2RKRng4YURLV2FWZEhOY25LWEkyZU5Xbmo1RXJxL0VQYTVt?=
 =?utf-8?B?cmcvZXRnb0orY3JhamJ3K1NjL04xdGpGYWxZSlhUWVcxY28yREZEbzRzb2RW?=
 =?utf-8?B?aC9zdkkyRmhjdW1sM2JkQzF0UmwyNkFzVExFQzRudDI0UkRidWRoK3h0K1gr?=
 =?utf-8?B?UmlIZGRsemNPN05yRm5IeloxMmpOU2VrZHZMM2V5VHdJazdzb1Y0N0N5UHls?=
 =?utf-8?B?cjRtQ21haFhFZTJwTXJMUDJuVG1CRmcyc0Y1NFZXT1JpQ3B6MHpTOFhaci8v?=
 =?utf-8?B?TFUyNlJJTUxtZTRwMUVMVE4wU21QRlZUcWtibzJDOUh6YjR5d21qakZNQWUz?=
 =?utf-8?B?bURzOUxOa3FqUkhYd3JBcGVxZkRCUVgrQzBaUFhWWW1OWFhWdjE2emF4MTZY?=
 =?utf-8?B?U3VGK3FiT0JvR2NGVDVuZ0xNVlFyMVNPSjBrN3QxcEwvT3hUWWVLaG5UV1Vp?=
 =?utf-8?B?NVdyNWkvQVQzVlpnRkVDTjg0RWN6dGl6Ri8raWhCdzJjVVlrTGtqOFk3NHBB?=
 =?utf-8?B?NkxjZ08ybzJuNERWRUxrb21WRjJGRGpudDh2dE05ZG8ybS94bjU5aXE5TFdS?=
 =?utf-8?B?OHYxWEQwTjhhMlRzclpiNzVjODQ0SFovTkc0dUI3SStxSG81UUkyMHRyOGti?=
 =?utf-8?B?QWFVNmRZK0NTZ3pmamRlOTR6VDArS2FHOXp2OEtEK3hUek5oYzk2cEFsWEl4?=
 =?utf-8?B?bkdwazVPbUFUdDRsblZDZ2lpSWloTzFTeW5SVFp1ZHZDdVcxTDZxUzQ2ckF2?=
 =?utf-8?B?QVF2czJHNWoySmdNT3JWLzZUUDFiZFdjOWo5S3hjODhLSUNvRzJBR3VoMVlv?=
 =?utf-8?B?WVBRNWtsNzJJTHQyNWsxNzd5c095d1krbjJuVjFDOC9NSE5sOHk4ZzFyekph?=
 =?utf-8?B?WWhXWkdENEZOQ0kvSGRIRUN6M0ZhaGlKWFUrazQzU1ZWL1JGYVZZZkJ2NGsx?=
 =?utf-8?B?VFVnK2xPOGx3d1pheW1zclArQ3VkQXJmeFM5Yi9iZ2l3QTVBYUVuNk9lL3Q2?=
 =?utf-8?B?TzBOUHhDeWZ1S280WWVqeGJRSEJOZnNaK3lSQndhUFo0QUdWU1dTcE5oSFJM?=
 =?utf-8?B?VWE1SmlRNStxZFBaeFRCNE9JZ0hQcERXbTlYSjRXTEI0eG1CVjhGODBRMHVR?=
 =?utf-8?B?VEJyUUFsa3BsWHl6QmNTNFRuSExuYXlZTHA4WlpOZSsrV2NHZ1FyWGM2SjJL?=
 =?utf-8?B?eVdDR3BOamUvZXYyaGxScW94Z1JOTlo3TkhrQXVxNFZBMUduclVBUHI2UXdp?=
 =?utf-8?B?YlptU0d3a0VtU1lJY1U3ZjF5enBYL3k2OWhFcmdOcC91UnFUNXRyYmJoT0Zs?=
 =?utf-8?B?Wm5ZcHptaWhWMkJNVC9leTJkRFgxbnRIRFNxS1Y3anVXalpKakhiaUlnUitu?=
 =?utf-8?B?NXJ3TVJtSzh5ejBPWmlMZkMyK2JBS2toOFFYcGpNQysvRjFqcXhxUlVSd1BR?=
 =?utf-8?B?T21kR3VuRi9YZ1BFQUZDL3dMS1R5NGx4ME1zRXd1b3hrSVQ5WitpYk01ZC9G?=
 =?utf-8?B?QnArOUZHQnYxam9ZRjYxNEtWNTBBWmsyRHcrc1Y2M3FmZnllYlZYYStPNkNR?=
 =?utf-8?B?VW5GZHovWkVubjdnMk9RUDduc0xoRWVSZDVOcVcwQ3c0cmp3SUdkbkRPaUli?=
 =?utf-8?B?K2dJaW96R093ME5YdU9SZGgzM3l3MDJpaklOQXdWSE05bmlTOTBZYlhxdzNC?=
 =?utf-8?B?cFpDVzJVZ3V0RCtKT2pCSmtWdEw0NVRBOWhtM2htWnI5WW5HTE5YY05zZkU0?=
 =?utf-8?B?cVNBZFNvZ29PdXhDVnpzSGJERlJFRXErNFlqVDR6M0xEb09peW9jQXhWQ2Nz?=
 =?utf-8?B?V0VnWkY2ckorcU1TZjQ1bWRjcEVxTWNXUHVWOVcvMGxNbkxqN0JTNjZ0WFZY?=
 =?utf-8?B?UmlDdXdHUURhUG03SVRybWhlM09uSjZaRTFqMm15S0xwOEhxSG9vT3V4RU1y?=
 =?utf-8?Q?VJeOKWW3wY8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SE5jNTE3NDdOL0NmdXZpaHVxT083MlFYOEdGNFpEeHZrbnNJcHRxdEE4NVo1?=
 =?utf-8?B?MW5MTkpiMU9nWFFQaEFXbEVuUExTNlFyaUdPRnN6eUIxcUhwN0JRMkg4REx0?=
 =?utf-8?B?Z0NFNllNUlM4eFEva3JpdnZJYWlFZGtyZVNVK0ZRMlBScFUwYjZrR0tUWGo1?=
 =?utf-8?B?NjRLMEtoTVo3bFBKMUtxMVkvbCtrSGRXQkM5bWRsVkkwWkkybzhQaXJ0dkIy?=
 =?utf-8?B?bHpVYzg3N2JwNU43VklDTjR1VjRwNDVlaU1WbzAxR1BOZ05DMDcxWCt2TGFV?=
 =?utf-8?B?aGNQaC9YMWZweVlFUWhYZkVNaXZDcWdVaE1laWhYcXJCZEhlZzF6QWdVL0xs?=
 =?utf-8?B?ZkZ4dXQzcXVGVjB5L3loVFBtRGFRN294NVBkZ0tjSXBLdXM4VzFaQnBCVUJN?=
 =?utf-8?B?V2FORnlaWXJYTGFFRE9CNVpBNE1WUzZ5Q0VaWTZ2RURNeXMwNml3Z2QxNUU2?=
 =?utf-8?B?RDVQYTd4MGw1U2ZpWDQvTm5RaVc1VnZ5bWQ3SlZzUi9LSC9oOXlQZFZ2QjFG?=
 =?utf-8?B?TWlzbzVSLzJlZmxER1hjMk9PLzlGa2EyWDNJS2xlZll5YzlhNjRpSjZNNmVh?=
 =?utf-8?B?WkdVNUc0QUFpOTF2SkpaUHpKR0NSQm9NMGptajZJTVlxM1l2aTZDNzhBWlZZ?=
 =?utf-8?B?NStLTlVCVkVlZEx5TjFzeVFnSEVteTJ4L3k5dG1xdlFQV202Z0NROW1jUkFp?=
 =?utf-8?B?R3grbkErcTlEb0FPdFZsRzVYSFNlOU1uNlhDVmtKeEdNdXZNdE9WUVBha2Zz?=
 =?utf-8?B?QXZvVlZmRmVtbXhBTXNUME9HVk13ZithR1gxYXNaSUo4ZDVpN3V2YWx6RmJl?=
 =?utf-8?B?UEwvWDc2R2l5cUwraUdYV08vY3BoWlkyaW1rWXV3L3c0TVg5T3VXdTZweGxt?=
 =?utf-8?B?OFZtdUIvUThSUWk1N1dIeDRyYVpRTFJoYi9rZUlrbm5CRUlDZmM1UW43RHB1?=
 =?utf-8?B?UC9YKzJVOFZIZ05wMkwrYXhNQmRRSC8yMDFSWjhXRXI5eEE0em1CSVdYU0dh?=
 =?utf-8?B?QjFiRkUzNDZwN2R5WnRSZm5BdUorMk5OMjJuY0Y2Ry9ldXNiNzQvN1AraDNk?=
 =?utf-8?B?R0drTmp6OFNHeXdqV2FKL1FmZk9XWis2QjE2MXp2aWtpeFVNZG9mU3FRRUFt?=
 =?utf-8?B?NmZuT09ITmlDeWpKT3dsS2V0TlE4QS9scUNnOXJtTk1Cc3lPU0ZtTk1xMHNl?=
 =?utf-8?B?R2xKMWdndUQ4UEt6TDQxWVAxd3VYQ0dPbm12OFAvLzJFSENkOWNIK0dLV2oz?=
 =?utf-8?B?bUVRQUVJeUN5VFhNSEpBUDFlZEk2ajlyN2NUM205QVdPM3NmaEUzbGQ3dUFB?=
 =?utf-8?B?UkNkK1RITndYSzZLSXJDME9Bajhpa09abDA4alVVZVI3ZEs3RjJzUTB5ZWFa?=
 =?utf-8?B?cWwyOVFkMnJwYUpXcTJ0RFdYOUl2MjNzT2RaeXRBbHBGT1Y5U1BJeWxCcVha?=
 =?utf-8?B?SGl4YXJwbi9UUmY0K250NFcwOFMrdkpBWlVZTklyT2ljQVJ5cGRGN1RYcmVM?=
 =?utf-8?B?RnhOcHZBUWVVQkF6RUNHdUNPSktnam9mTk14SXBZNEJYbVNveXlrbzUyVEV3?=
 =?utf-8?B?QXFrVHA3WWNmRlIvWWpPQkkyalZJaGVFQVZqdFJEMmw4S2YzVUZyUW52OEhk?=
 =?utf-8?B?S3VldVpYMUppaGJRZGZsN3FvdG5KaHpuQjRUVkkrN3p0c3d4VDhVOWFOVHBi?=
 =?utf-8?B?cy9vbzVxZzlGYi9ka2ptbHJ2SXZUMWhwWVdST1piaXpNVTdReS9keDYySmh2?=
 =?utf-8?B?WGtYSUpuQzY0MGJtWnRYZmprdWdzRXVTT0twVFJOM3hXZmNnUjR1MGVQekI5?=
 =?utf-8?B?ZTdwMHNPblRaK0IrdkZLYUdCK2Q1UytvYUI4aUFFVXAzdFJIVk4yMHpTSUpw?=
 =?utf-8?B?dFJlbTdhZ0xaSnV5WnowNnhuTllMV2lIOE53alFpNENnYzhvSm9nd29vNW11?=
 =?utf-8?B?MVhMalBnaUQ2Y1BCVmZJK2NrL0ZBSlhnbjlsZm5lMFNvWmtxWkFHRFRrYi9L?=
 =?utf-8?B?enJnL0V6SjhlRnR6bEZxNkZXenRnL1BHMlVhdE4zWENYSlJHa2tvV1NiMUZa?=
 =?utf-8?B?bUJUYkQwNDdXTnZ0SkR4OTVxZlBEVXhaTUpRaktnRllZWUoweUo3REgzTFQy?=
 =?utf-8?Q?nO3kNvBPqcYA3FWadfRmkjpFB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90384f9e-3809-4621-f4a1-08ddaa2a7196
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 03:29:03.3775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBSkzBYYHg9GXpV6cPRSMZcXAGSmS67uhQ+4oUn98p2zKwc6rW91L7RQt8jvMWzFmtKcaHP315I8s74emrRo2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9615

Hello Peter,

On 6/2/2025 10:14 AM, K Prateek Nayak wrote:
> Hello Peter,
> 
> On 5/20/2025 3:15 PM, Peter Zijlstra wrote:
>> As can be seen, the SPR is much easier to please than the SKL for whatever
>> reason. I'm thinking we can make TTWU_QUEUE_DELAYED default on, but I suspect
>> TTWU_QUEUE_DEFAULT might be a harder sell -- we'd need to run more than this
>> one benchmark.
> 
> I haven't tried toggling any of the newly added SCHED_FEAT() yet.

Here are the full results:

tldr;

- schbench (old) has a consistent regression for 16, 32, 64,
   128, 256 workers (> CCX size, < Overloaded) except for with
   256 workers case with TTWU_QUEUE_DEFAULT which shows an
   improvement.

- new schebench has few regressions around 32, 64, and 128
   workers for wakeup and request latency.

- Most others benchmarks show minor improvements /
   regressions but nothing serious.
   

o Variants

"DELAYED" enables "TTWU_QUEUE_DELAYED" alone, "DEFAULT" enables
"TTWU_QUEUE_DEFAULT" alone, and "BOTH" variant enables both.
vanilla was shared previously which is same as out of box with no
changes made to the sched features.


o Benchmark numbers

     ==================================================================
     Test          : hackbench
     Units         : Normalized time in seconds
     Interpretation: Lower is better
     Statistic     : AMean
     ==================================================================
     Case:           tip[pct imp](CV)       vanilla[pct imp](CV)     DELAYED[pct imp](CV)     DEFUALT[pct imp](CV)      BOTH[pct imp](CV)
      1-groups     1.00 [ -0.00](13.74)     0.92 [  7.68]( 6.04)     0.95 [  5.12](10.12)     1.02 [ -1.92]( 6.70)     0.95 [  4.90]( 5.28)
      2-groups     1.00 [ -0.00]( 9.58)     1.04 [ -3.56]( 4.96)     1.03 [ -3.12]( 5.12)     0.98 [  1.56]( 4.30)     1.01 [ -1.11]( 5.78)
      4-groups     1.00 [ -0.00]( 2.10)     1.01 [ -1.30]( 2.27)     1.01 [ -1.09]( 2.68)     1.00 [ -0.43]( 2.58)     1.01 [ -0.65]( 1.38)
      8-groups     1.00 [ -0.00]( 1.51)     0.99 [  1.26]( 1.70)     0.99 [  0.95]( 4.92)     0.97 [  3.15]( 1.60)     1.00 [ -0.00]( 3.67)
     16-groups     1.00 [ -0.00]( 1.10)     0.97 [  3.01]( 1.62)     0.96 [  3.77]( 1.42)     0.95 [  4.60]( 0.67)     0.96 [  4.44]( 1.10)
     
     
     ==================================================================
     Test          : tbench
     Units         : Normalized throughput
     Interpretation: Higher is better
     Statistic     : AMean
     ==================================================================
     Clients:    tip[pct imp](CV)       vanilla[pct imp](CV)     DELAYED[pct imp](CV)     DEFUALT[pct imp](CV)      BOTH[pct imp](CV)
         1     1.00 [  0.00]( 0.82)     1.04 [  4.33]( 1.84)     1.06 [  5.97]( 0.42)     1.06 [  6.12]( 1.02)     1.06 [  5.54]( 0.73)
         2     1.00 [  0.00]( 1.13)     1.06 [  5.52]( 1.04)     1.07 [  7.17]( 0.42)     1.07 [  6.81]( 0.30)     1.08 [  7.96]( 0.39)
         4     1.00 [  0.00]( 1.12)     1.05 [  5.41]( 0.53)     1.07 [  7.39]( 0.67)     1.06 [  6.45]( 0.91)     1.07 [  7.36]( 0.63)
         8     1.00 [  0.00]( 0.93)     1.06 [  5.72]( 0.47)     1.07 [  6.90]( 0.24)     1.07 [  7.09]( 1.45)     1.07 [  6.94]( 0.45)
        16     1.00 [  0.00]( 0.38)     1.07 [  6.99]( 0.50)     1.05 [  4.95]( 0.98)     1.05 [  5.39]( 0.71)     1.05 [  5.43]( 1.05)
        32     1.00 [  0.00]( 0.66)     1.05 [  4.68]( 1.79)     1.06 [  5.70]( 0.54)     1.07 [  6.93]( 2.39)     1.03 [  3.17]( 1.06)
        64     1.00 [  0.00]( 1.18)     1.06 [  5.53]( 0.37)     1.04 [  4.05]( 0.84)     1.07 [  7.35]( 1.57)     1.06 [  5.62]( 1.13)
       128     1.00 [  0.00]( 1.12)     1.06 [  5.52]( 0.13)     1.05 [  4.94]( 0.75)     1.08 [  7.56]( 0.81)     1.05 [  4.80]( 0.55)
       256     1.00 [  0.00]( 0.42)     0.99 [ -0.83]( 1.01)     0.99 [ -0.58]( 0.57)     1.00 [  0.06]( 0.68)     1.00 [  0.03]( 1.47)
       512     1.00 [  0.00]( 0.14)     1.01 [  1.06]( 0.13)     1.02 [  1.67]( 0.18)     1.03 [  2.62]( 0.28)     1.02 [  2.17]( 0.33)
      1024     1.00 [  0.00]( 0.26)     1.02 [  1.82]( 0.41)     1.02 [  2.48]( 0.27)     1.03 [  3.38]( 0.37)     1.01 [  1.39]( 0.03)
     
     
     ==================================================================
     Test          : stream-10
     Units         : Normalized Bandwidth, MB/s
     Interpretation: Higher is better
     Statistic     : HMean
     ==================================================================
     Test:       tip[pct imp](CV)       vanilla[pct imp](CV)     DELAYED[pct imp](CV)     DEFUALT[pct imp](CV)      BOTH[pct imp](CV)
      Copy     1.00 [  0.00]( 8.37)     0.97 [ -2.79]( 9.17)     0.99 [ -1.29]( 4.68)     1.01 [  1.25]( 4.86)     0.99 [ -0.66]( 9.29)
     Scale     1.00 [  0.00]( 2.85)     1.00 [  0.12]( 2.91)     0.99 [ -1.34]( 5.55)     1.00 [ -0.20]( 3.38)     0.98 [ -2.09]( 5.33)
       Add     1.00 [  0.00]( 3.39)     0.98 [ -2.36]( 4.85)     0.98 [ -2.32]( 5.23)     1.00 [  0.10]( 3.17)     0.98 [ -1.99]( 4.73)
     Triad     1.00 [  0.00]( 6.39)     1.01 [  1.45]( 8.42)     1.00 [ -0.38]( 8.28)     1.05 [  4.69]( 5.66)     1.06 [  6.02]( 4.53)
     
     
     ==================================================================
     Test          : stream-100
     Units         : Normalized Bandwidth, MB/s
     Interpretation: Higher is better
     Statistic     : HMean
     ==================================================================
     Test:       tip[pct imp](CV)       vanilla[pct imp](CV)     DELAYED[pct imp](CV)     DEFUALT[pct imp](CV)      BOTH[pct imp](CV)
      Copy     1.00 [  0.00]( 3.91)     0.98 [ -1.84]( 2.07)     0.98 [ -2.06]( 6.75)     1.01 [  1.31]( 2.86)     1.02 [  2.12]( 3.30)
     Scale     1.00 [  0.00]( 4.34)     0.96 [ -3.80]( 6.38)     0.97 [ -2.88]( 6.99)     0.97 [ -2.62]( 5.70)     1.00 [ -0.37]( 3.94)
       Add     1.00 [  0.00]( 4.14)     0.97 [ -3.04]( 6.31)     0.97 [ -3.14]( 6.91)     0.99 [ -0.79]( 4.24)     1.00 [ -0.35]( 4.06)
     Triad     1.00 [  0.00]( 1.00)     0.98 [ -2.36]( 2.60)     0.96 [ -3.80]( 6.15)     0.99 [ -0.61]( 1.33)     0.97 [ -3.05]( 5.48)
     
     
     ==================================================================
     Test          : netperf
     Units         : Normalized Througput
     Interpretation: Higher is better
     Statistic     : AMean
     ==================================================================
     Clients:         tip[pct imp](CV)       vanilla[pct imp](CV)     DELAYED[pct imp](CV)     DEFUALT[pct imp](CV)      BOTH[pct imp](CV)
      1-clients     1.00 [  0.00]( 0.41)     1.06 [  5.63]( 1.17)     1.06 [  6.03]( 0.53)     1.09 [  8.63]( 0.79)     1.06 [  6.36]( 0.09)
      2-clients     1.00 [  0.00]( 0.58)     1.06 [  6.25]( 0.85)     1.05 [  5.47]( 0.83)     1.08 [  8.24]( 1.29)     1.05 [  5.15]( 0.57)
      4-clients     1.00 [  0.00]( 0.35)     1.06 [  5.59]( 0.49)     1.05 [  5.06]( 0.65)     1.08 [  8.15]( 0.82)     1.05 [  5.46]( 0.62)
      8-clients     1.00 [  0.00]( 0.48)     1.06 [  5.76]( 0.81)     1.05 [  5.26]( 0.71)     1.08 [  8.19]( 0.60)     1.05 [  5.34]( 0.80)
     16-clients     1.00 [  0.00]( 0.66)     1.06 [  5.95]( 0.69)     1.06 [  5.52]( 0.78)     1.08 [  8.31]( 0.86)     1.06 [  5.76]( 0.48)
     32-clients     1.00 [  0.00]( 1.15)     1.06 [  5.84]( 1.34)     1.06 [  5.57]( 0.96)     1.08 [  8.30]( 0.90)     1.06 [  5.66]( 1.45)
     64-clients     1.00 [  0.00]( 1.38)     1.05 [  5.20]( 1.50)     1.05 [  4.67]( 1.39)     1.07 [  7.43]( 1.47)     1.05 [  5.18]( 1.48)
     128-clients    1.00 [  0.00]( 0.87)     1.04 [  4.39]( 1.03)     1.04 [  4.43]( 0.98)     1.06 [  5.98]( 1.01)     1.05 [  4.60]( 1.06)
     256-clients    1.00 [  0.00]( 5.36)     1.00 [  0.10]( 3.48)     1.00 [  0.09]( 4.22)     1.01 [  0.71]( 3.18)     1.01 [  1.25]( 3.69)
     512-clients    1.00 [  0.00](54.39)     0.98 [ -1.93](52.45)     1.00 [ -0.35](53.30)     1.02 [  1.75](54.93)     1.02 [  1.76](55.71)
     
     
     ==================================================================
     Test          : schbench
     Units         : Normalized 99th percentile latency in us
     Interpretation: Lower is better
     Statistic     : Median
     ==================================================================
     #workers: tip[pct imp](CV)       vanilla[pct imp](CV)     DELAYED[pct imp](CV)     DEFUALT[pct imp](CV)      BOTH[pct imp](CV)
       1     1.00 [ -0.00]( 8.54)     0.89 [ 10.87](35.39)     0.78 [ 21.74](34.41)     0.91 [  8.70](12.44)     0.72 [ 28.26](26.70)
       2     1.00 [ -0.00]( 1.15)     0.88 [ 12.00]( 4.55)     0.78 [ 22.00]( 6.61)     0.90 [ 10.00]( 5.75)     0.82 [ 18.00](17.98)
       4     1.00 [ -0.00](13.46)     0.96 [  4.17](10.60)     1.00 [ -0.00]( 8.54)     0.96 [  4.17]( 3.30)     0.98 [  2.08]( 8.19)
       8     1.00 [ -0.00]( 7.14)     0.84 [ 15.79]( 8.44)     0.98 [  1.75]( 3.67)     0.95 [  5.26]( 4.99)     0.91 [  8.77]( 2.92)
      16     1.00 [ -0.00]( 3.49)     1.08 [ -8.47]( 4.69)     1.07 [ -6.78]( 0.92)     1.07 [ -6.78]( 0.91)     1.07 [ -6.78]( 3.27)
      32     1.00 [ -0.00]( 1.06)     1.10 [ -9.57]( 2.91)     1.07 [ -7.45]( 2.97)     1.07 [ -7.45]( 4.23)     1.05 [ -5.32]( 7.80)
      64     1.00 [ -0.00]( 5.48)     1.25 [-25.00]( 5.36)     1.17 [-17.44]( 1.44)     1.23 [-23.26]( 2.79)     1.20 [-19.77]( 2.19)
     128     1.00 [ -0.00](10.45)     1.18 [-17.99](12.54)     1.16 [-16.36](21.21)     1.13 [-12.85](12.71)     1.09 [ -8.64]( 3.05)
     256     1.00 [ -0.00](31.14)     1.28 [-27.79](17.66)     0.84 [ 16.21](32.14)     1.19 [-19.21]( 1.68)     1.07 [ -6.86]( 7.48)
     512     1.00 [ -0.00]( 1.52)     1.01 [ -0.51]( 2.78)     0.97 [  3.03]( 2.91)     0.98 [  1.77]( 1.07)     1.01 [ -0.51]( 1.01)
     
     
     ==================================================================
     Test          : new-schbench-requests-per-second
     Units         : Normalized Requests per second
     Interpretation: Higher is better
     Statistic     : Median
     ==================================================================
     #workers: tip[pct imp](CV)       vanilla[pct imp](CV)     DELAYED[pct imp](CV)     DEFUALT[pct imp](CV)      BOTH[pct imp](CV)
       1     1.00 [  0.00]( 1.07)     1.00 [  0.29]( 0.00)     1.00 [  0.29]( 0.15)     0.99 [ -0.59]( 0.46)     1.00 [  0.29]( 0.30)
       2     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.15)     1.00 [  0.00]( 0.15)     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.00)
       4     1.00 [  0.00]( 0.00)     1.00 [ -0.29]( 0.15)     1.00 [  0.00]( 0.00)     1.00 [ -0.29]( 0.15)     1.00 [  0.00]( 0.00)
       8     1.00 [  0.00]( 0.15)     1.00 [  0.00]( 0.15)     1.00 [  0.29]( 0.00)     1.00 [  0.00]( 0.40)     1.00 [  0.29]( 0.15)
      16     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.15)     1.00 [  0.00]( 0.00)
      32     1.00 [  0.00]( 3.41)     0.99 [ -0.95]( 2.06)     0.98 [ -2.23]( 3.41)     0.98 [ -2.23]( 3.31)     1.03 [  2.54]( 0.32)
      64     1.00 [  0.00]( 1.05)     0.92 [ -7.58]( 9.01)     0.86 [-13.92](11.30)     1.00 [  0.00]( 4.74)     1.00 [ -0.38]( 9.98)
     128     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.00)     1.00 [  0.38]( 0.00)
     256     1.00 [  0.00]( 0.72)     1.00 [ -0.31]( 0.42)     1.01 [  1.23]( 1.33)     1.01 [  0.61]( 0.83)     1.01 [  0.92]( 1.36)
     512     1.00 [  0.00]( 0.57)     1.00 [  0.00]( 0.45)     0.99 [ -0.72]( 1.18)     1.00 [  0.48]( 0.33)     1.01 [  1.44]( 0.49)
     
     
     ==================================================================
     Test          : new-schbench-wakeup-latency
     Units         : Normalized 99th percentile latency in us
     Interpretation: Lower is better
     Statistic     : Median
     ==================================================================
     #workers: tip[pct imp](CV)       vanilla[pct imp](CV)     DELAYED[pct imp](CV)     DEFUALT[pct imp](CV)      BOTH[pct imp](CV)
       1     1.00 [ -0.00]( 9.11)     0.75 [ 25.00](11.08)     0.69 [ 31.25]( 8.13)     0.75 [ 25.00](11.08)     0.62 [ 37.50]( 8.94)
       2     1.00 [ -0.00]( 0.00)     1.00 [ -0.00]( 3.78)     0.86 [ 14.29]( 7.45)     0.93 [  7.14]( 3.87)     0.79 [ 21.43]( 4.84)
       4     1.00 [ -0.00]( 3.78)     0.93 [  7.14]( 3.87)     0.79 [ 21.43]( 4.56)     0.93 [  7.14]( 0.00)     0.79 [ 21.43]( 8.85)
       8     1.00 [ -0.00]( 0.00)     1.08 [ -8.33](12.91)     0.92 [  8.33]( 0.00)     0.83 [ 16.67](18.23)     1.08 [ -8.33](12.91)
      16     1.00 [ -0.00]( 7.56)     0.92 [  7.69](11.71)     0.85 [ 15.38](12.06)     1.08 [ -7.69](11.92)     0.85 [ 15.38](12.91)
      32     1.00 [ -0.00](15.11)     1.07 [ -6.67]( 3.30)     1.00 [ -0.00](19.06)     1.00 [ -0.00](15.11)     0.80 [ 20.00]( 4.43)
      64     1.00 [ -0.00]( 9.63)     1.00 [ -0.00]( 8.15)     1.00 [ -0.00]( 5.34)     1.05 [ -5.00]( 7.75)     0.90 [ 10.00]( 9.94)
     128     1.00 [ -0.00]( 4.86)     0.89 [ 11.06]( 7.83)     0.91 [  8.54]( 7.87)     0.88 [ 12.06]( 8.73)     0.86 [ 14.07]( 5.01)
     256     1.00 [ -0.00]( 2.34)     1.00 [  0.20]( 0.10)     1.04 [ -4.50]( 4.59)     1.03 [ -2.90]( 1.95)     1.04 [ -3.70]( 4.13)
     512     1.00 [ -0.00]( 0.40)     1.00 [  0.38]( 0.20)     1.00 [  0.38]( 0.20)     0.99 [  0.77]( 0.20)     1.00 [ -0.00]( 0.40)
     
     
     ==================================================================
     Test          : new-schbench-request-latency
     Units         : Normalized 99th percentile latency in us
     Interpretation: Lower is better
     Statistic     : Median
     ==================================================================
     #workers: tip[pct imp](CV)       vanilla[pct imp](CV)     DELAYED[pct imp](CV)     DEFUALT[pct imp](CV)      BOTH[pct imp](CV)
       1     1.00 [ -0.00]( 2.73)     0.98 [  2.08]( 1.04)     0.99 [  1.30]( 1.07)     1.02 [ -1.82]( 0.00)     1.01 [ -1.30]( 3.10)
       2     1.00 [ -0.00]( 0.87)     1.05 [ -5.40]( 3.10)     1.02 [ -1.89]( 1.58)     1.01 [ -1.08]( 2.76)     1.02 [ -1.62]( 1.45)
       4     1.00 [ -0.00]( 1.21)     0.99 [  0.54]( 1.27)     0.99 [  1.08]( 1.67)     1.01 [ -1.21]( 1.21)     1.01 [ -1.35]( 1.91)
       8     1.00 [ -0.00]( 0.27)     0.99 [  0.79]( 2.14)     0.98 [  2.37]( 0.72)     0.99 [  1.05]( 2.53)     0.99 [  0.79]( 1.12)
      16     1.00 [ -0.00]( 4.04)     1.01 [ -0.53]( 0.55)     1.01 [ -0.80]( 1.08)     1.00 [ -0.27]( 0.36)     0.99 [  0.53]( 0.50)
      32     1.00 [ -0.00]( 7.35)     1.10 [ -9.97](21.10)     1.01 [ -0.66](10.27)     1.25 [-25.36](21.41)     0.90 [  9.52]( 2.08)
      64     1.00 [ -0.00]( 3.54)     1.03 [ -2.89]( 1.55)     1.02 [ -2.00]( 0.98)     1.01 [ -0.67]( 3.62)     1.01 [ -0.89]( 4.98)
     128     1.00 [ -0.00]( 0.37)     0.99 [  0.62]( 0.00)     0.99 [  0.72]( 0.11)     0.99 [  0.62]( 0.11)     0.99 [  0.83]( 0.11)
     256     1.00 [ -0.00]( 9.57)     0.92 [  8.36]( 2.22)     1.03 [ -3.11](12.58)     1.05 [ -5.02]( 8.36)     1.00 [ -0.00](11.71)
     512     1.00 [ -0.00]( 1.82)     1.01 [ -1.23]( 0.94)     1.02 [ -2.45]( 1.53)     1.00 [  0.35]( 0.83)     1.02 [ -1.93]( 1.40)
     
     ==================================================================
     Test          : Various longer running benchmarks
     Units         : %diff in throughput reported
     Interpretation: Higher is better
     Statistic     : Median
     ==================================================================
     Benchmarks:                 vanilla     DELAYED   DEFAULT    BOTH
     ycsb-cassandra              -0.05%       0.65%    -0.49%    -0.48%
     ycsb-mongodb                -0.80%      -0.85%    -1.00%    -0.98%
      
     deathstarbench-1x            2.44%       1.54%     1.65%     0.18%
     deathstarbench-2x            5.47%       4.88%     7.92%     6.75%
     deathstarbench-3x            0.36%       1.74%    -1.75%     0.31%
     deathstarbench-6x            1.14%       1.94%     2.24%     1.58%
     
     hammerdb+mysql 16VU          1.08%       5.21%     2.69%     3.80%
     hammerdb+mysql 64VU         -0.43%      -0.31%     2.12%    -0.25%


-- 
Thanks and Regards,
Prateek


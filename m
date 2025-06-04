Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474692C3261;
	Wed,  4 Jun 2025 11:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749036188; cv=fail; b=pr77t32IP9oK76kIKz6cwFjKOP6d5nMRZDRQTbkb2KZuoRCsF4H7wbA1mYkmC7rgDKmbJkHT9eai8InQHqrQzD+hNDi3egloCd70q7LcSUsDt+NxKTWDDQs39/NQ+f78aYPwcd2G0wtRnYqBLcx3+yya6UV3KogdbBa/TicDTDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749036188; c=relaxed/simple;
	bh=9xMBhfCX/LoMOYYMeeRFCzvvW9eCiwinCmX1WM7l+fw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rrNqllnj+vYd4oMSyf2jj84xNIbMu7tKBNa19/njm/OCdmE7NBlhFRHdKT9bmDhEMnDOK8EP5xbGVDHuRl0p4WgSUMUTu/7qvlKbqDT+zlZSZWUqDQc9uvFr4IQyVPf+3aqjoYEhNEBxMb2AtMisStPjG65+nhBDLnsOd9vYJ+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hm2UJ0Mn; arc=fail smtp.client-ip=40.107.223.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hm2UJ0Mn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxFmwZzZTaJQeuMDsOy0X0El6gWNVHNdAPBJgGR8Q0jN8IN4r9X92D+Yj+nBG6YL8oJxUMreXySCHPAjm89JDP1q++XziziekYmrCjSPk/FDAruKIw6QWg7Cz6XaHGskjuQKO9hPhrq5ByIQjPkTpm1iRA6ANO/sm72YNGUC6+8z0u01felpWn+hjGQ//d7+ChScnXpi2hhOHz7YgWox/d8LWutxqBqoyjzwOpbxWoBj18Fgcvex83gGNFezdACF4cYPQ8bTKzf3vRcrXuAX7NOtJuwnPRs85F8NHn/YyFHwrLgoZBYaN1GsHU+Ti7VYEIbtGJrN+/+y4NVKss1DLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04ZmDTJyKYMGviXE8BbOW1jo+cUBpaQVU6cJCkobJXc=;
 b=a7lgHDk0UFFATAtPlr5G0C/AWGkaO8fIzsU1CUlnIeI6tFOO0H1apBQEXmeb8sbuw7SB4T2yUzwHbrSdHHiJt1H6SSDYX5TUca4AGRJmz5p9E0u/+t4FDzgzIRiCXv/ySCTFHr4XUBXBq1XyUJdo/+mCuX8ddK2gRv3GUcfIm29sZ+L8gduHQbsNzJzixp66h/IJhQSCAfESgMR9+xtljWUH+AeAjTlfHnA1ZVUqkUrsG4xEQK3BrOiJDbzMipjrpBbAfJkiETTH24IY2JyKsS0QOlAR+F97H8FALLHKIpuoUDV89TcSxoiZgGT49LvUSEG9Pb/SE16iTl+rWqvcMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04ZmDTJyKYMGviXE8BbOW1jo+cUBpaQVU6cJCkobJXc=;
 b=hm2UJ0Mn5RWFktw69gh5NOHILVjDIB30Z/1Yaocm1FbLxvhsatBaqhd1YJpR07QeVdwMVZDhD7JVGKkjgf70AiQI8f3XCckU6wkIjL5V9/4RsdRG4ocBLCN3783X6XU8QuZzjkpgu/5QeyetyfAderTE7rTL/dGaE+rKKbS/nNU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5962.namprd12.prod.outlook.com (2603:10b6:8:69::7) by
 IA1PR12MB7710.namprd12.prod.outlook.com (2603:10b6:208:422::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 4 Jun
 2025 11:23:03 +0000
Received: from DM4PR12MB5962.namprd12.prod.outlook.com
 ([fe80::5df0:a9be:ee71:f30a]) by DM4PR12MB5962.namprd12.prod.outlook.com
 ([fe80::5df0:a9be:ee71:f30a%5]) with mapi id 15.20.8769.037; Wed, 4 Jun 2025
 11:23:01 +0000
Message-ID: <4bc3ebce-2b04-4686-b8a0-c08243a88d1b@amd.com>
Date: Wed, 4 Jun 2025 16:52:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/platform/amd: move final timeout check to after
 final sleep
To: jake@hillion.co.uk,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 sched-ext@meta.com, Blaise Sanouillet <linux@blaise.sanouillet.com>
References: <20250530-amd-hsmp-v1-0-3222bffa4008@hillion.co.uk>
 <20250530-amd-hsmp-v1-1-3222bffa4008@hillion.co.uk>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <20250530-amd-hsmp-v1-1-3222bffa4008@hillion.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0118.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b0::7) To DM4PR12MB5962.namprd12.prod.outlook.com
 (2603:10b6:8:69::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5962:EE_|IA1PR12MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: f065ab7e-9dde-443c-e471-08dda35a2a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajRzNUYvWGpyYWg2NnBNUC9xMDV2MFZGVHM2dlRneGx1ZGtTRHRJY2w4WnZP?=
 =?utf-8?B?V2RwRlExbTh4VTVaT1MwZ0dodCtmUG0wNTdzc0gxQ0Z1SENwY010cW9zTy9U?=
 =?utf-8?B?YmtDY0s4UVpYV2VjR0d0ZUE0bGdYREF0Rm5UeFo5NUFscExzMkwzYzU5T0JZ?=
 =?utf-8?B?bWlvMHVEZkxSR284Qk9HV2xGUlRUYmhWQldQcmdZbjB2Qkg3b2QxZkh3eE5w?=
 =?utf-8?B?YlFMZ0IzTXlhMnhRWm5hUkkzakN6WE1reVZBLzBMYVcvdXJVOUtRQmRFUE5I?=
 =?utf-8?B?SlRJSTg0SGkya085eDhiTlhjOHRFU2V4VWVFNmNva0VmakxhQmtCb3AyQWNt?=
 =?utf-8?B?cUFLTHhzdmZlNW9USTNVM0ZUQk9xT21BaFZuT0Zzc0JSRTJUenkwMXJ5UVVs?=
 =?utf-8?B?RXJWeVhsOFVxeGFjT0FQZ1FIbnV4cHpvOUh3T3daQXZPM3ZhNmdZUlZDNU1H?=
 =?utf-8?B?S1J2YnR0TmVUMGxwRGNMV1VYQlVwVkhMdEdPK2t3c2ZQZXJhZkIzdFZSUUQz?=
 =?utf-8?B?MHlKakdXUUlEUUZZVEY5dFl3eUxlenhxbDhGdENlSWI2NVkxUnB2Sjdaa0tK?=
 =?utf-8?B?clhZOXZRM1B0NGNDTjFZK1pJOFZGQ2lIK05XR2JlOUJKV1kwYmRPd0FHZGNj?=
 =?utf-8?B?QStHelBsYlk5NGs5V2RNVVRFa0IwZGQveGdScWR6NjQ4TmNjNGdUQTJUUWV1?=
 =?utf-8?B?bmNxNFZxLy9wQ1hZamM3N2FxQjR3d2xmZ1ZmZERra1ovMWNPVkZlQzQ3RjBv?=
 =?utf-8?B?SFNGaHdhcEUxdG1EM1U2NDlNd0M3d2dOMVVaYlNZMS8zaGRrT2RUSFl1aGpw?=
 =?utf-8?B?OUZ4ajROQldoSVV1K0pBZEJjVlR5THZVYjdiaTY0N0phM1hXTzZmLzJ5VmMv?=
 =?utf-8?B?dHd6enhCcGE3VGYyd2pGbHVVd09VNmtPUVVIYSs4T1JNaVp4YlBrcWp5Q1do?=
 =?utf-8?B?cGxza0RBVU5aa1djcjZsTFVRTzZCZGh0dndTTEpyRVFYbHJ1RTdQZHl0eDVQ?=
 =?utf-8?B?cDljNlNEMnFud21NQzYrTUxQM1BvMlFvNXY5SnNIcWNpV2UxZlRsZVVRemNl?=
 =?utf-8?B?ekx5SStKNFU0VTNmdTJIUHR4bGJzSjM3RmRPR3NYblN2b1hWZWNPaWNneVo4?=
 =?utf-8?B?VG9Yc1FieFVFa0VKVFN5WXZCbjlMOE5TQ1ZRZ0NrR0lNaFkrckpsd2VvQWZ3?=
 =?utf-8?B?VndKK3VzYXFQbnM0SUltejNGb05zMUhtMi84aDh2ekpLRnFMVXpKL09wdHI4?=
 =?utf-8?B?dFltMDhhZC9vYWRHbk5sOVZsZEdaQTk5U1ZWZzNEOTlGVmU5dXhUNmVkNjBX?=
 =?utf-8?B?SS8xc2ZiSmEwV1pUODZkTU1FV3Z2eDNCclZrNlhIU1FYaW9FK0lBQkduSEp1?=
 =?utf-8?B?KzY1NUdPSENTRDhYa3BkZWNrNDVHUStheWpJQlU1QThvQWVTUFd4Mm5IWTl3?=
 =?utf-8?B?U29VTkhoeWVNL2hkVmRWZ01nQ2hMZEt2eVZwSDZ0TjhpakhkRmNlZWtrbmo3?=
 =?utf-8?B?dkVFRk1aZ2NaRW54SEREMUt6SGRiMXhrYVFyQ1BEazB3UUx0dEJMNkk5MHRs?=
 =?utf-8?B?MGxiRDhHYlZWb1k4a1NUNVpjVkhoMm1aNlM2MzZOUGwzckZPM2J4K3VBSks5?=
 =?utf-8?B?Y2txN0k0T0NlaWc5RmVsRVY0WTdwWFZnMFFsZGREcERmNHVXcXdOeEhIRncr?=
 =?utf-8?B?Zi9PaWQxWDF6RERJWXRqeVA4QzhDZTg0SnBsMGFTeEEyOFZoalZLRHVWMG51?=
 =?utf-8?B?RDREZGhpVHJvTmxXQ1B0djZYbCtBN0RjRjY1U1ZQajc5ZnE5WU9sK01GSjJT?=
 =?utf-8?B?MVFXRXVybEdFU1dUVE9vbDdqbU0wbTA0cUc3U1hrVHJtY2NMdVp2OTJKVmwy?=
 =?utf-8?B?OWw0UzQ2N3dHY0c1S1hwT2hYQUorQWRHWW1hU3pGZU9paUp4OTRSU3Q4NjVG?=
 =?utf-8?Q?peGNJpAqoJs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5962.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGNOejNvUzhoc3FIbzdqblYzUThDYnpwODJHU1NkTGVmdlBvVUZ4MFZLNllE?=
 =?utf-8?B?dkJ1WWk1WTE4cnhkc1JtMmRERWNUNmtNTUpDNENFYlZkNUhTUHBTR2dMci94?=
 =?utf-8?B?YitqZFdZUzd1TlhQdlJpdkxGNktvQkhmQlZqMHZVSUl5UWdCRkJqckptdXU3?=
 =?utf-8?B?Z1JGYUFaVnhlRjgvaU5FTjB2bUhpbVZ3YlV1RjBwYnh3ays1VS9Sc0ptODBx?=
 =?utf-8?B?QXpON2RWN0dTeHpyM0lCUmU0eGwyYm1JYWZ1U0swSG4xTGNoNlRXK2lFcld0?=
 =?utf-8?B?YUZkcmU4Umw5U3VrT2dhSzgzKzBiQ0FrK3AzdVZ6azl3Uy8wOFVWOUFEVEdY?=
 =?utf-8?B?TjhsYXc0NkJQUXhVeWVhNzVGZk45TGszMytUTUJwYlNiVmU1bEx6dVNML3Bo?=
 =?utf-8?B?YndydzNkV3hhNVN2QmVuUGJXc3FmOWVsQTY1UndYWUJpaHRzaGxKMGtJY0dF?=
 =?utf-8?B?TjJsaUJUTnBmbE1nYVBQMnlKbXREZnpPK09LK1dndGhwZXBHTFplZmJtRmdS?=
 =?utf-8?B?bVFMMDIzd1Q1aG4xQ1l1aSsyekszVXhxNi9ZQzRHRG9uSW05eU55TGc5MnpU?=
 =?utf-8?B?K1I5Zk04R3Z5NW02ajJMbmNNSWdDTDFub3B4azN4Uzh4UGlmQktIemoveHFT?=
 =?utf-8?B?UXp5UnlzYXBWK2dvNndIdlllbG5tbEVmdUhFQUlUaXUwNk1pMCtySnVUbWFO?=
 =?utf-8?B?cFJVREV0NlAzV3p4ZUdGQVl5REF0Z2Q0NWpHVlpCR3dFcEI5Ly9OY1M1S0Qr?=
 =?utf-8?B?R2VQcW9qTlVXQ3FOdjdiKzVVYTI0OCtNWjFSNjRId3h0ajREVHBmLy9RMXlv?=
 =?utf-8?B?S1hsVWt2NHlaYTlFY29aWWNlN0ZmdzVNS0ZJZEhlTEFSUDBUQnFOZW1PWlB6?=
 =?utf-8?B?RkN5c1pVczU4TWVtbUFEVHBJWEc2Ti9IL3dUNS9tazZnVDluazhWQnlCYWsx?=
 =?utf-8?B?TEtHOVN0bkNMUFBlVEhqSFdGL2JFY3c5V0gzdk1maEcvUElIaWk1cHQxeXJm?=
 =?utf-8?B?YytPckNVdDJjRTlZeFFEWHkyOEg5MGxDRkNKd0VrOWNZMFNvTDFTc3lWYnZE?=
 =?utf-8?B?WlMxRkdPeWxmeDNHck5qK2hPRFErSHJBQm81QXQzamFyUEJCeW4vR3pCVnVB?=
 =?utf-8?B?T1NOU1hnK1dHNDFnZkEyK3BmRWsxbkVrS1FsdDFndFhQaHY2Z0JoSzdDT2o3?=
 =?utf-8?B?R3hiV1ZNM2xxdnc3VFcvYys5QW5vY2duSXJDaUNWRWtMVzJNVUNTb1ZOZmZo?=
 =?utf-8?B?ZHo3dDlHRWhWYlZWSmxvbmp4dVZWb0NqdnF6bEhocVRtZ1lFZHY5VWp3MzRM?=
 =?utf-8?B?OEdRblY5QTVaSTJZQ3htQ20wNzN5dTZpUk1qblcvSUxCeERWY3RyODI1Vml2?=
 =?utf-8?B?MDdIT0xTVnp4UFRIYjEvdXZqbi9LQk9VNitMVVdmRG1TN0xjM3ovZzVHeHc5?=
 =?utf-8?B?dy9YcUl1dFVKUTgwUHltZWZibUZVekJxWUZOSktVQTJJRDlpWVhvSUFGSmVF?=
 =?utf-8?B?bXQrUlhFUSt5RWkvR0gxQ2dQaXhvWEJRZVNSajVRby91MURpVk9BVVk3V1Vo?=
 =?utf-8?B?bHRFRVd5My8yRkxjQ3BCZmNmYS9lcENWNkV5d2lSdms5NHNsV3RQYVJ6WlZ6?=
 =?utf-8?B?TFdiL2luRCt4MytHbGhrbVp0TU5zZU5ydHpDZGRoUU9ickQ3QURyL1hkVUMx?=
 =?utf-8?B?V3JRRVN0NGJRd3h3V3NraW1vTGwxaGJqWHJBS0VGQm4rWk9hSm9uNUR5Zllj?=
 =?utf-8?B?V3VGVmhCdmtCTUdIOUJXSjRiSmpZU1BQbTF0bHAwWlk0L2NhdU9QUlpQeHp2?=
 =?utf-8?B?UUlvc3RlMVIzYmFMWEpNdXlIbzhkdFRpTE56VlNPdDl0M1BoQ0Y5UDJyK1pK?=
 =?utf-8?B?ZGlRYlFIR3Bud2hHWG05NldRNEV5SzhQVjhncDBXelRzOU5JbkV1VFhLVThX?=
 =?utf-8?B?K0NnOTdEb0JiWm5oZ3VQczNlZjRqcUhubEtpdXhtaUxuTjc1c0U2VWp6VUNF?=
 =?utf-8?B?M2JIanlhYmxGVGF5MDFoK1VtUWQ0YTZaRzJMRzN3a01GdzIrMExYaTQ3SXp3?=
 =?utf-8?B?L2tmN2tWUkVUcjR0QVFqSkdxOFpFUzdoa1ZGMGdpaSt5Si8rcWNBdHJFa3dv?=
 =?utf-8?Q?kQ/6zZLtcSbInQ8B4eW7Kj6Ef?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f065ab7e-9dde-443c-e471-08dda35a2a99
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 11:23:01.7221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzPglnMoIiSovTsywLhXZ87aeACSzxlg6ILaSt2QatW7ozdnzJY8PK0yusGQZtsIMDvFEL0WVOsEEFEED68gzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7710

Hi,


On 5/30/2025 9:45 PM, Jake Hillion via B4 Relay wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> From: Jake Hillion <jake@hillion.co.uk>
>
> __hsmp_send_message sleeps between result read attempts and has a
> timeout of 100ms. Under extreme load it's possible for these sleeps to
> take a long time, exceeding the 100ms. In this case the current code
> does not check the register and fails with ETIMEDOUT.
>
> Refactor the loop to ensure there is at least one read of the register
> after a sleep of any duration. This removes instances of ETIMEDOUT with
> a single caller, even with a misbehaving scheduler. Tested on AMD
> Bergamo machines.
>
> Suggested-by: Blaise Sanouillet <linux@blaise.sanouillet.com>
> Signed-off-by: Jake Hillion <jake@hillion.co.uk>

Reviewed-by: Suma Hegde <suma.hegde@amd.com>
Tested-by: Suma Hegde <suma.hegde@amd.com>


> ---
>   drivers/platform/x86/amd/hsmp/hsmp.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index e262e8a97b4542a389e09a82dad71f7d2e8b2449..f35c639457ac425e79dead2515c0eddea0759323 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -99,7 +99,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>          short_sleep = jiffies + msecs_to_jiffies(HSMP_SHORT_SLEEP);
>          timeout = jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
>
> -       while (time_before(jiffies, timeout)) {
> +       while (true) {
>                  ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
>                  if (ret) {
>                          dev_err(sock->dev, "Error %d reading mailbox status\n", ret);
> @@ -108,6 +108,10 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>
>                  if (mbox_status != HSMP_STATUS_NOT_READY)
>                          break;
> +
> +               if (!time_before(jiffies, timeout))
> +                       break;
> +
>                  if (time_before(jiffies, short_sleep))
>                          usleep_range(50, 100);
>                  else
>
> --
> 2.47.2
>
>
Thanks and Regards,

Suma


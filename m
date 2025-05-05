Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD0F1DFF7;
	Mon,  5 May 2025 15:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746459755; cv=fail; b=J8GQEpUkN0kPV8shXnLdaW/TG1bfFN7qJiV2IcIboqUBXEl0VC4zIBsXRxQRI5B+DtvNI8JGVSPQdh+24Z0yolxIb4QDd9IeLoT4GgUsuT0FXbbusITeynKcd/UI9YVMfi3vkGLEaYUQznMYtowl0xhlb7tPjLutvjOQ43MZaLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746459755; c=relaxed/simple;
	bh=R8NWtm9Gjous4G6k3EAOynMKV63Kp+eWPoh0aOZxrdI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ioPpHoJ5YU3z/lVd9VNQh+bE5Ais57sgHo3CPwlbfrBcsdRSwYz1DN1WJvXpAW8xcsgjVVddWXY2CoIwESeMcntoHrwCjGaP5Kc+WmbxUBg5cKEBRdy2C1wzLnzYlgI96dPhjTfuGZkJUdMatY1AZldWBLUglsauLvwSq/mdRX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vL67iHKD; arc=fail smtp.client-ip=40.107.94.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vL67iHKD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y78Y83Hq3Yml35XAyf7n7wKE+Ovc7n/fmo8Ow26PtofEli41NaMAUZU1KfcaDK2z7vSDGba85oPFlQSATbpSqX+/u9URfpvnUlVFbNPnmG+J/+AqrPYeYm9CXQoTzf4lxJJ/8Qb6amRDimaJFzYXWHXNzVRu6I5jNtkr3z0cpjw7dQdc1IGVH3DOplAKJNAdm3jRr8s0AxSteP64OVtFqstH7B8i7gG+O772db9GKaUROyVqdZlgu0cto800FagNzWw5HchCifTG5oEj9qiZ4IbGq0Kh0D94oVI9UFkZKMhnvVbqiBTCwMDEO/gORmXxm+PXlzcoYN/0Sw475BXtJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjpSktlpFbEL99F1H0DHe8QkhfVg9AJOzEwXq12bTCY=;
 b=kkcD/BfD0mAWc7qT7d4EzJw8TMiGMEHwGRKVqdW+adGspsWwkPiGhxkIGrgsw63fLNQOm/h0FTUwwuJIXVuxFjg4uiLxUUPtUGnitnRPuq38wIzLU4x4Dq58FF/ALGHEbIBF1PVe+98rwLEgrrS2yzwLnoY2WjaLBcjNyRmOQs0E1QcgUkPV5zhyfMO5o30MF76f424ydHR93LVhWo8QMAmYWKB4TmpXPjHvzgqx6s+GVPb6yG8eHmmfWqA4k+Drn8z5nXyyqNDjmv22S8NhAGe3+fZpFwuHsIuJtkCs+4sI8hT40lw6HyRTJv9tRK3BVNOwqR5RwqK2j6E9VGcnUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjpSktlpFbEL99F1H0DHe8QkhfVg9AJOzEwXq12bTCY=;
 b=vL67iHKDnIGPXtv8Qy4OHDsBNLuyKSWpI71KPb+FOmdFEnOdjZSASyzOqC8ws03UDGlhNwl7ZsVZwZpd7UP/xyG58yxYlXWqgmrAHKM51qh8F8Cn11fY1IAJqwwOyW1ZroP02of2ZpjulV4p7nZozX1nxSgoXBDEhvx8KIgr1bU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by SA3PR12MB8024.namprd12.prod.outlook.com (2603:10b6:806:312::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 15:42:31 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8678.028; Mon, 5 May 2025
 15:42:29 +0000
Message-ID: <e2ffa4a9-28c0-40c4-bbf5-f0a3504df35e@amd.com>
Date: Mon, 5 May 2025 11:42:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] platform/x86: Add AMD ISP platform config for OV05C10
Content-Language: en-GB
To: Armin Wolf <W_Armin@gmx.de>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250503002448.3753937-1-pratap.nirujogi@amd.com>
 <2d640cdf-0347-4283-a5b1-880f6b7e1f85@gmx.de>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <2d640cdf-0347-4283-a5b1-880f6b7e1f85@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0183.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::27) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|SA3PR12MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 9069a550-30e8-4002-562a-08dd8beb7193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azJtMktwazVIaW5iTS9UMnNtYjlOUW4vL0ViTWYxcGRZV1ZCQUNyMUdSN0hG?=
 =?utf-8?B?WnFDbnRyRVJyVm9FLzVUZExFajRIRnV5Z1NkMjNGQWtRVGIwS0IwSTFFSXNw?=
 =?utf-8?B?N2FjTkl1cm9veGNyYXo1S3RqT25YNUdURFQrVi9YWUdUZlF1UEJzbDV2ejlx?=
 =?utf-8?B?aVBld2Z6cnYvaFJucG9KUHhFRCtJQzhldkNHVW9qVUVORUZUL3BEWFJ5TTV0?=
 =?utf-8?B?MzRESDVKZTEzRVVkSG92K0ZpVFduT1dCS3NwbzE4S3Z3enZHQ3ZFNXcvLzdO?=
 =?utf-8?B?RGFnb3ZrTE1IaXlCalM5S2wrWCtmY1RiMVdRQitmUEpsOHlsWElIYTYvRkRW?=
 =?utf-8?B?ZDZNMzExcXBqci96R3pXNE1JZmlCRS9LZmpHeEY2RVppM1VjYjJkM1ArR213?=
 =?utf-8?B?Q0dVYXBmOUdxZ2xtNGk4UXpCaC9meDZoTk9pVGhtS0xreUF5WU9XN0YzVkFk?=
 =?utf-8?B?MXZaRGFUM3dmT09FQ3QyRXBhYzYvUWhmbVJXSTFrbVh0dGxYZUJrb0wyS3N6?=
 =?utf-8?B?aUpEdjRYMUZZWXYzbXN5VS9CUDBTdnNjbzJMNHoyZzBTQ3REZHJrektqTnZZ?=
 =?utf-8?B?a3NhSTdsNnJzKzJWTC90OGJzU2lXbU9SUEFNTWpGQ1VRZXozeC9yaVI1dDNa?=
 =?utf-8?B?aXJhOHRwd3JOdmFlaUlLZDJNRVRsUUp4WVRrc0pKdk5sMVovbVBVNW0rSzlh?=
 =?utf-8?B?dElYYklBZFI2MnR2UzlCZG9md3pjNXR3WEtSN2w3cU9QWVZzMksvV2hNSldH?=
 =?utf-8?B?elQvVldwbGhEMGViY3dQOUx4TTNuRDQ2VHo3V2w4ZW9XL1VUYkZuUFAvOE02?=
 =?utf-8?B?MEVtMXlnUnRBS0hYdDF5UUxlb2xrem45aTY4cDJHWWF0eWdkckUrNlliemhQ?=
 =?utf-8?B?R0hFTHRCZVJYb2IrdTZXZDAvaHFJcHNBUFFMVjNUQ2FWYlN3TnNveWoxRTR2?=
 =?utf-8?B?SmZaL09hNHV4cUtrRFY3T0JRL3JLY1FIQjR5NnAzdGhwb0ZuWlFIV0pXM1Fo?=
 =?utf-8?B?RTNSdTVxZTBSWnFSTmY1SDViS0gxUkhNTTZsdDRSNXowMnlVNXJRUFM0NHd4?=
 =?utf-8?B?c0twNjVDWGsyUWFlNWZTdTEwQTgyRFNvRjNvVFR3Y3NUOUNOMjMxVTlScWF5?=
 =?utf-8?B?Uk8xTXkzZXNlSnlYU2RuamVKTlJoQThGdzBwNmU3NDlhTVl5aUtRSU44Q2tx?=
 =?utf-8?B?M0NSY29MVHRhbkFKOS9pMjJxV09zYkYvZFMzTDRaVnVuRW9CNnBsQ29BZ3hk?=
 =?utf-8?B?N3B4RnJtTkh4MHJGdmdEQjhvRE5hR1V0MWN1TnNuVzBmNDVEZjEyYTlpd3JW?=
 =?utf-8?B?R1VaakVOVVk4dkVhTzNuTEF2eVpjWlhJYWU0NFc1cHVYRkwyNXBqcTdtMTFN?=
 =?utf-8?B?YUg4Unh5MnpmOXJaYWJMTWhwbnhXblpqalBjR0t3ejNjRUw5K0FVVDYyNEsr?=
 =?utf-8?B?ZTM5aCtCN0R4bzA2MmQyZHJZeDNBM0huaTBUN2dGTmZ3NnhiQ1BqMXRqbG5N?=
 =?utf-8?B?OWFoTjNHeHRRZ3ZBTGRwYWJCM2ZnTkZMcWZwTUV5UWtIVTRqZGJHM0FFWElS?=
 =?utf-8?B?UjREd1JuS2ZXL2RlbmRMaE1XYVA3Vlh2Y0h5QjZGS3NXK25Gb3FJdFB0VHIz?=
 =?utf-8?B?NytQVDc5aTB6L3NqWjAxKzFuRzZKbi9tOGZvTTUvQm5kWDVSL1QyL3MzaVVQ?=
 =?utf-8?B?VnVXSmdrRGY5VU53MHZybTBjb2RtWGNLbXNXKy9nY3dwZXVUWjdBVGdheWZq?=
 =?utf-8?B?TzNNa2NhZXdOZlNCQU9FcEdDZ1ZaMFpqMXNaSmhpL0ZRaUloeGREaXFjMHAz?=
 =?utf-8?B?bVZtbEF4Q3h1UzFVell1aE95dDhtVG40L1g3RURjK0hWZnRCR0FUTkF5M2k5?=
 =?utf-8?B?allUcWRpLzQvWmI4dG0xQW5SaThQbFpOS2c4eE9mLzV1UFJjdHIwQm1oVFdD?=
 =?utf-8?Q?uOl6W3G3gNk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG1yMnJXL1JacGlBcnIxV0IxeGV6TjEzUTJMT1RaZHZUNXRmWHRnRVE4QkdK?=
 =?utf-8?B?ZGxNNVNHVHVPOFhoWERJRVUzc00xRkZjU2QvVUZBNGJFNkFudmlqcTVhV2JE?=
 =?utf-8?B?cDI0eVBaUFlGN1dncGhJTnNzV3AzdWVUbWhSWHdVaWpRdm1oZVJYbTI2dFUr?=
 =?utf-8?B?UjVMYlIzSjZ4OFhhSnVVVFZnaUJEMll1bXlQNkNjNVhSWGdmQ0RLTXhLZFRz?=
 =?utf-8?B?dGxZUnhJaXlWUmZWY05pM21UdFRjM040Ukd2VGgvWEJDYzhBSXBuaHZTcTFJ?=
 =?utf-8?B?TDdjZ1NkRm5YTjUxcTFjQm9YQ1dwbGRmM2pUOU9ZM2dzR01VdVkxVnhwa2Yz?=
 =?utf-8?B?ZkkyQ2s5TmRKMFNXNDBDS3o1ajFhQlY5WXdTT2JRSzhncDVkQnZGTTlIZm1a?=
 =?utf-8?B?cHdRUDF6T3RISCsxUUw0L09TeVRORUM0WGt2clViRUJxOTlENVRXU3d1Kzk2?=
 =?utf-8?B?VGRTeWZpRHBIalpiSzhYM0RGdDJnb2UxTlFoRENUVUN2ZlY5WUFKRkc1U1Rs?=
 =?utf-8?B?czRWUWVsR0o1WUFVQmZoVVlwdkpnazQ3VWc4SXMwRG9hZWQvaVN2T0lhQUVT?=
 =?utf-8?B?OU4wRzlEOG5SNDNyT3lWdWpUSjVhbHhYWXJYUWp3OEpDYjdwZFpseWp2bzJI?=
 =?utf-8?B?dnNJKzVwTWlYdnVvbHhhdmEvdlJ4ZGgzLzlKNW1zOVN3Tkp1OEc1c0lIN2Nw?=
 =?utf-8?B?bU44eDI3RG5WcFFBalM5cnMxSXltamhyL3NGMnRsUnRkYWRVZWdKenpWZDkx?=
 =?utf-8?B?NDA5dWhEcHFzOUZzbmhKOTczZWFNSTVhQ2FzMC8yQTNCTXJOWDc4ZjBXUXhH?=
 =?utf-8?B?cjFRbzJHNTJpL01mZ3d2YUZocll3aHkyYU9oY2hVMXlYbkpVUE9DOEdGWjZV?=
 =?utf-8?B?Y1NCaERTam9VVTgra3pDeW1IeVgvRDdlTmx0a0owS1p1eE82b1lvdFZwVFl0?=
 =?utf-8?B?RlhFT1pmMndEcDBYTDRkMnJHSStWb1NrWU5YMlVBMFBTYnZyOHVndlNkUHZp?=
 =?utf-8?B?Y05zeS9lLzdDdTR4QjJOdW5KaG5MOFowbXJzV1h4NnFUVVRLNVhIaWZEd3Rh?=
 =?utf-8?B?SjJlM05aS3V4aDFUdmFaZFVBUDV3L21hbzIrMEdMVHQxR2VVYkltdjc1ZnJU?=
 =?utf-8?B?QmRXVDZuZXdKc0NPd0xST2ZjMU5jK0lRL3dzSmtaMFJxQzhheG0rbW9NMVNI?=
 =?utf-8?B?SU1CWThsLzE0bmVWdUtqdnlyUTcwM3MyeTU3WFJXcHUrT0k2UjUvTUZlZ3V6?=
 =?utf-8?B?akNLZFZkanVRcE1vK3gyclQzV2ZId0dyaTlsRXMxQkxNeCtiYzA4VVBFMERm?=
 =?utf-8?B?eUtVbm5WRit5Skt4T3poQ1I0emVqZ2RDcCtwZlhqOGJ4bE5hQUo5czRmZE1x?=
 =?utf-8?B?clZoWTBoU2hkMkx3WWVxY25mLyt2UGpLS3pPemhjQUg4YkJWMG8rOTNUMUZF?=
 =?utf-8?B?ZW0vZFU3Mm8rT1JZVW1jQWhlWTV4VjljVXBtUmZIdmZUcHZ4elB4UTEyejVQ?=
 =?utf-8?B?QWpIakkzdjVjTE8zS2paQllMMnZoTUV0Yzg0REtuWVRwVnZXdncxQ0w5dHYy?=
 =?utf-8?B?UkNrekZtcWRNL2ppby95ZmtFR1c0TEtQNDZBZ1F5RWhrQitaSStlTjFSZlgx?=
 =?utf-8?B?MVNpbDZIdG5XL0d0LzEybnVReDIxb2tKYllPSHJuVXJFSDNSZW9VZmRhWW95?=
 =?utf-8?B?a1AvQk44T055NVlGcy9GUU1LakVheFZrMkN4bng2Y0pBYThZa1c5OVY5aGlE?=
 =?utf-8?B?NTErMGZEQmtvNUhteEpOWXlmVlJSSVhnWGtuOUJQMEJ6MWt6RGFDOVhCOEZj?=
 =?utf-8?B?RjZBVSs4MVMyWlhVbWwweDRsbXJHMm8vZUFtMU5oUzBxV1MwUmZUdndkbmxr?=
 =?utf-8?B?Qktha0xCUFBxWkREakFsaVhOUnZia0EvNXl6UGNsMzJPVndpaEpkVDBnbXRB?=
 =?utf-8?B?SW54bjhFTk5oU0prcEQxS0RubHhVQWJFRkJMS2JiV1Qxa1U2UXg2eEw4TEMx?=
 =?utf-8?B?V0toMnhqY3o2TmZkUGtxZGNyRWYwRjFzc29TTTF2ZFdDWGdCT2pBWEI3cnY3?=
 =?utf-8?B?YWxUbW8yampwMDBrbnJrMXpuNzl2ZVZhb3NCOUJ6bWViNkxHVUFXeitsNUpC?=
 =?utf-8?Q?xnUEtA2/Xw0mmhU5ZDVU03BDm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9069a550-30e8-4002-562a-08dd8beb7193
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 15:42:29.8165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48NTzSiVAXkYrv5510uy4e9cKaEmV2h2BN9vz+zmVYYVDCcC5FfupWqwjBbOgxiopHwIH/NXM30F0QPnW/L53w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024

Hi Armin,

On 5/3/2025 10:11 PM, Armin Wolf wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> Am 03.05.25 um 02:24 schrieb Pratap Nirujogi:
> 
>> ISP device specific configuration is not available in ACPI. Add
>> swnode graph to configure the missing device properties for the
>> OV05C10 camera device supported on amdisp platform.
>>
>> Add support to create i2c-client dynamically when amdisp i2c
>> adapter is available.
>>
>> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> ---
>> Changes v9 -> v10:
>>
>> * Remove i2c_board_info->addr check in instantiate_isp_i2c_client().
>> * Update mutex protection regions as suggested in the review feedback.
>> * Switch to devm_mutex_init() and skip mutex_destroy calls.
>>
>>   drivers/platform/x86/amd/Kconfig    |  11 ++
>>   drivers/platform/x86/amd/Makefile   |   1 +
>>   drivers/platform/x86/amd/amd_isp4.c | 277 ++++++++++++++++++++++++++++
>>   3 files changed, 289 insertions(+)
>>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>>
>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/ 
>> amd/Kconfig
>> index c3e086ea64fc..152a68a470e8 100644
>> --- a/drivers/platform/x86/amd/Kconfig
>> +++ b/drivers/platform/x86/amd/Kconfig
>> @@ -32,3 +32,14 @@ config AMD_WBRF
>>
>>         This mechanism will only be activated on platforms that 
>> advertise a
>>         need for it.
>> +
>> +config AMD_ISP_PLATFORM
>> +     tristate "AMD ISP4 platform driver"
>> +     depends on I2C && X86_64 && ACPI
>> +     help
>> +       Platform driver for AMD platforms containing image signal 
>> processor
>> +       gen 4. Provides camera sensor module board information to allow
>> +       sensor and V4L drivers to work properly.
>> +
>> +       This driver can also be built as a module.  If so, the module
>> +       will be called amd_isp4.
>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/ 
>> amd/Makefile
>> index c6c40bdcbded..b0e284b5d497 100644
>> --- a/drivers/platform/x86/amd/Makefile
>> +++ b/drivers/platform/x86/amd/Makefile
>> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)               += pmc/
>>   obj-$(CONFIG_AMD_HSMP)              += hsmp/
>>   obj-$(CONFIG_AMD_PMF)               += pmf/
>>   obj-$(CONFIG_AMD_WBRF)              += wbrf.o
>> +obj-$(CONFIG_AMD_ISP_PLATFORM)       += amd_isp4.o
>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/ 
>> x86/amd/amd_isp4.c
>> new file mode 100644
>> index 000000000000..336ac3da2041
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -0,0 +1,277 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * AMD ISP platform driver for sensor i2-client instantiation
>> + *
>> + * Copyright 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/property.h>
>> +#include <linux/units.h>
>> +
>> +#define AMDISP_OV05C10_I2C_ADDR              0x10
>> +#define AMDISP_OV05C10_PLAT_NAME     "amdisp_ov05c10_platform"
>> +#define AMDISP_OV05C10_HID           "OMNI5C10"
>> +#define AMDISP_OV05C10_REMOTE_EP_NAME        "ov05c10_isp_4_1_1"
>> +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
>> +
>> +/*
>> + * AMD ISP platform definition to configure the device properties
>> + * missing in the ACPI table.
>> + */
>> +struct amdisp_platform {
>> +     struct i2c_board_info board_info;
>> +     struct notifier_block i2c_nb;
>> +     struct i2c_client *i2c_dev;
>> +     struct mutex lock; /* protects i2c client creation */
>> +};
>> +
>> +/* Top-level OV05C10 camera node property table */
>> +static const struct property_entry ov05c10_camera_props[] = {
>> +     PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
>> +     { }
>> +};
>> +
>> +/* Root AMD ISP OV05C10 camera node definition */
>> +static const struct software_node camera_node = {
>> +     .name = AMDISP_OV05C10_HID,
>> +     .properties = ov05c10_camera_props,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Ports node definition. No properties defined for
>> + * ports node for OV05C10.
>> + */
>> +static const struct software_node ports = {
>> +     .name = "ports",
>> +     .parent = &camera_node,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Port node definition. No properties defined for
>> + * port node for OV05C10.
>> + */
>> +static const struct software_node port_node = {
>> +     .name = "port@",
>> +     .parent = &ports,
>> +};
>> +
>> +/*
>> + * Remote endpoint AMD ISP node definition. No properties defined for
>> + * remote endpoint node for OV05C10.
>> + */
>> +static const struct software_node remote_ep_isp_node = {
>> +     .name = AMDISP_OV05C10_REMOTE_EP_NAME,
>> +};
>> +
>> +/*
>> + * Remote endpoint reference for isp node included in the
>> + * OV05C10 endpoint.
>> + */
>> +static const struct software_node_ref_args ov05c10_refs[] = {
>> +     SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
>> +};
>> +
>> +/* OV05C supports one single link frequency */
>> +static const u64 ov05c10_link_freqs[] = {
>> +     925 * HZ_PER_MHZ,
>> +};
>> +
>> +/* OV05C supports only 2-lane configuration */
>> +static const u32 ov05c10_data_lanes[] = {
>> +     1,
>> +     2,
>> +};
>> +
>> +/* OV05C10 endpoint node properties table */
>> +static const struct property_entry ov05c10_endpoint_props[] = {
>> +     PROPERTY_ENTRY_U32("bus-type", 4),
>> +     PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
>> +                                  ARRAY_SIZE(ov05c10_data_lanes)),
>> +     PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", 
>> ov05c10_link_freqs,
>> +                                  ARRAY_SIZE(ov05c10_link_freqs)),
>> +     PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
>> +     { }
>> +};
>> +
>> +/* AMD ISP endpoint node definition */
>> +static const struct software_node endpoint_node = {
>> +     .name = "endpoint",
>> +     .parent = &port_node,
>> +     .properties = ov05c10_endpoint_props,
>> +};
>> +
>> +/*
>> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
>> + * fixed to align with the structure that v4l2 expects for successful
>> + * endpoint fwnode parsing.
>> + *
>> + * It is only the node property_entries that will vary for each platform
>> + * supporting different sensor modules.
>> + */
>> +#define NUM_SW_NODES 5
>> +
>> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
>> +     &camera_node,
>> +     &ports,
>> +     &port_node,
>> +     &endpoint_node,
>> +     &remote_ep_isp_node,
>> +     NULL
>> +};
>> +
>> +static const struct acpi_device_id amdisp_sensor_ids[] = {
>> +     { AMDISP_OV05C10_HID },
>> +     { }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>> +
>> +static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>> +{
>> +     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>> +}
>> +
>> +static void instantiate_isp_i2c_client(struct amdisp_platform 
>> *ov05c10, struct i2c_adapter *adap)
>> +{
>> +     struct i2c_board_info *info = &ov05c10->board_info;
>> +     struct i2c_client *i2c_dev;
>> +
>> +     guard(mutex)(&ov05c10->lock);
>> +
>> +     if (ov05c10->i2c_dev)
>> +             return;
>> +
>> +     i2c_dev = i2c_new_client_device(adap, info);
>> +     if (IS_ERR(i2c_dev)) {
>> +             dev_err(&adap->dev, "error %pe registering isp 
>> i2c_client\n", i2c_dev);
>> +             return;
>> +     }
>> +     ov05c10->i2c_dev = i2c_dev;
>> +}
>> +
>> +static int isp_i2c_bus_notify(struct notifier_block *nb,
>> +                           unsigned long action, void *data)
>> +{
>> +     struct amdisp_platform *ov05c10 = container_of(nb, struct 
>> amdisp_platform, i2c_nb);
>> +     struct device *dev = data;
>> +     struct i2c_client *client;
>> +     struct i2c_adapter *adap;
>> +
>> +     switch (action) {
>> +     case BUS_NOTIFY_ADD_DEVICE:
>> +             adap = i2c_verify_adapter(dev);
>> +             if (!adap)
>> +                     break;
>> +             if (is_isp_i2c_adapter(adap))
>> +                     instantiate_isp_i2c_client(ov05c10, adap);
>> +             break;
>> +     case BUS_NOTIFY_REMOVED_DEVICE:
>> +             client = i2c_verify_client(dev);
>> +             if (!client)
>> +                     break;
>> +
>> +             scoped_guard(mutex, &ov05c10->lock) {
>> +                     if (ov05c10->i2c_dev == client) {
>> +                             dev_dbg(&client->adapter->dev, "amdisp 
>> i2c_client removed\n");
>> +                             ov05c10->i2c_dev = NULL;
>> +                     }
>> +             }
>> +             break;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     return NOTIFY_DONE;
>> +}
>> +
>> +static struct amdisp_platform *prepare_amdisp_platform(struct device 
>> *dev)
>> +{
>> +     struct amdisp_platform *isp_ov05c10;
>> +     int ret;
>> +
>> +     isp_ov05c10 = devm_kzalloc(dev, sizeof(*isp_ov05c10), GFP_KERNEL);
>> +     if (!isp_ov05c10)
>> +             return ERR_PTR(-ENOMEM);
>> +
>> +     devm_mutex_init(dev, &isp_ov05c10->lock);
> 
> Hi,
> 
> you should check the return value of devm_mutex_init().
> 
> With that being fixed:
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> 
Thanks very much for your thorough review and expert feedback on the 
patches. Its a good learning experience addressing the comments. I'll 
push the final v11 patch adding the check for return value of 
devm_mutex_init().

Thanks,
Pratap

>> +     isp_ov05c10->board_info.dev_name = "ov05c10";
>> +     strscpy(isp_ov05c10->board_info.type, "ov05c10", I2C_NAME_SIZE);
>> +     isp_ov05c10->board_info.addr = AMDISP_OV05C10_I2C_ADDR;
>> +
>> +     ret = software_node_register_node_group(ov05c10_nodes);
>> +     if (ret)
>> +             return ERR_PTR(ret);
>> +
>> +     isp_ov05c10->board_info.swnode = ov05c10_nodes[0];
>> +
>> +     return isp_ov05c10;
>> +}
>> +
>> +static int try_to_instantiate_i2c_client(struct device *dev, void *data)
>> +{
>> +     struct amdisp_platform *ov05c10 = (struct amdisp_platform *)data;
>> +     struct i2c_adapter *adap = i2c_verify_adapter(dev);
>> +
>> +     if (!ov05c10 || !adap)
>> +             return 0;
>> +     if (!adap->owner)
>> +             return 0;
>> +
>> +     if (is_isp_i2c_adapter(adap))
>> +             instantiate_isp_i2c_client(ov05c10, adap);
>> +
>> +     return 0;
>> +}
>> +
>> +static int amd_isp_probe(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10;
>> +     int ret;
>> +
>> +     ov05c10 = prepare_amdisp_platform(&pdev->dev);
>> +     if (IS_ERR(ov05c10))
>> +             return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
>> +                                  "failed to prepare AMD ISP platform 
>> fwnode\n");
>> +
>> +     ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
>> +     ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     if (ret)
>> +             goto error_unregister_sw_node;
>> +
>> +     /* check if adapter is already registered and create i2c client 
>> instance */
>> +     i2c_for_each_dev((void *)ov05c10, try_to_instantiate_i2c_client);
>> +
>> +     platform_set_drvdata(pdev, ov05c10);
>> +     return 0;
>> +
>> +error_unregister_sw_node:
>> +     software_node_unregister_node_group(ov05c10_nodes);
>> +     return ret;
>> +}
>> +
>> +static void amd_isp_remove(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
>> +
>> +     bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     i2c_unregister_device(ov05c10->i2c_dev);
>> +     software_node_unregister_node_group(ov05c10_nodes);
>> +}
>> +
>> +static struct platform_driver amd_isp_platform_driver = {
>> +     .driver = {
>> +             .name                   = AMD_ISP_PLAT_DRV_NAME,
>> +             .acpi_match_table       = amdisp_sensor_ids,
>> +     },
>> +     .probe  = amd_isp_probe,
>> +     .remove = amd_isp_remove,
>> +};
>> +
>> +module_platform_driver(amd_isp_platform_driver);
>> +
>> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
>> +MODULE_LICENSE("GPL");


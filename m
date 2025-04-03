Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2061.outbound.protection.outlook.com [40.107.102.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBB618E050;
	Thu,  3 Apr 2025 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665513; cv=fail; b=LY9AmDwr18jRIJtpD2FZydRcMrVUAx0f2+ZB2GUGyqYpS74xZFbL88Lkt4tdjv2DDw5Rxp6XrSZC3uwWU/O+qhvzycJ87THID0jzTegEjVfx5wytZnQ/+vRJ19K+xnnU2zFWc/mq+To1AKZzD67mc1AN3uS1Kb2xRW3OpS298Og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665513; c=relaxed/simple;
	bh=DPgGzPVW982URgoieRPKqihvZqPOWhuc/6ital1GNSw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z12Diz1nUj0cMLTQZ2pwIobbcHhwJA/sPsLTXNH9NeETGQ7E3gSWLTpK9BUsNJXEetbFVPbOKXAO3Q2QCcadZoHBH2SMntlRxctOd6soCELN2mFbHPgoCbmmcSNzKWqLLvSDY/AGTXOA6e2JCK+SQSuNSAe2XAOxdvdKgMojhbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N7ZC3Avf; arc=fail smtp.client-ip=40.107.102.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N7ZC3Avf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1gsTU5bT1nso2mFsa5wbsBoWxqMPWFdsXG6zwilVMDl1BWdk4d48EMCCJVVqUhnXxAbB/6E23VToP7ZgUB4f5QfclajPJOj6HSP/DQsVphQeJVNRv5DBRrX47MAiAInJnOTL9kCuBndaOIQo+RJry/cYZ0yGb8w4Fjpg1M9SN9HlA/OJiZma4TL1IYp6oE39vMM7P/q6Wy0IceCXNOBqkdqoVh6Z7tin0NnNAZKXXJyxLBUUQGUFzBCtvvz2OZTcujWf271jma7MO3OGsl4BcexSqek5hR8S2O00dQwl0gK/zIrqFyX/EfLUIoBSoqqIBXOX/g5jZ/LIfBJaG8vLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPgGzPVW982URgoieRPKqihvZqPOWhuc/6ital1GNSw=;
 b=soEcrQ9snUnCgCXqrGYRM1QKoCy4CC3LIyreP2OWncoa3zLmx9WBrAV2TK2LTuPHwtmKtlYocGkjD0vGRSMX+8FuRpxi7LQqWZ/rD//fU5Mn1ZVN34nXsF5MnOC78l7jDi9xPS/Bqar4nzJcWYmEazpwyYpNKaOqiufYctvhMcHynP5nkweDZd4Tr3KO0dOR263e6WgYkU8wfZl1G8O5XP2At3UqWXWxJSxE4DVt3hjQD2GrMhfHsPUNMsuQigDyP+B3hiTshkVdpiyT+Y+xQ/g2lvgIsxwDsaZPsPDjtnoj9uA8jA7fWHSG0XohhCA2xTQZte/TT18Pn3RgKneE3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPgGzPVW982URgoieRPKqihvZqPOWhuc/6ital1GNSw=;
 b=N7ZC3AvfzbGha2x5uyg9zE6GMnhRloKa27msfJCSyiFeJPbhKAp/8VFVOQzu5siqAWBegNEONiNfEAk3PcpwKD7u02kV0dwDaraqvkFNjXps8GG4AvmsSkEnDV5nQi6nKtOuGDci0/VW1f9UlGx90epE95daAGM2w009YjzHbR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by IA0PPF316EEACD8.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bcb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Thu, 3 Apr
 2025 07:31:48 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%7]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 07:31:47 +0000
Message-ID: <1fb64766-f945-494c-ba0d-0123cf498ea2@amd.com>
Date: Thu, 3 Apr 2025 15:31:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use of
 SWIOTLB bounce buffers
To: David Woodhouse <dwmw2@infradead.org>, virtio-comment@lists.linux.dev
Cc: mst@redhat.com, hch@infradead.org, Claire Chang <tientzu@chromium.org>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?J=C3=B6rg_Roedel?=
 <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, graf@amazon.de
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <1966cbf1-a430-480e-a78d-3d6bbcb4ada4@amd.com>
 <f32b0dbd8d92b0ac0a33dcd586521ba180004952.camel@infradead.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <f32b0dbd8d92b0ac0a33dcd586521ba180004952.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|IA0PPF316EEACD8:EE_
X-MS-Office365-Filtering-Correlation-Id: cb055dc9-a525-4ac9-e9ba-08dd7281979e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2hFTGc5ZHU5MGEyNFBLN0tmNkhXZHIzVkhEdkxLNWF0S1RkUTEwNnMveG95?=
 =?utf-8?B?MjB5czBIeXVVb24wWmlkUURkR1AybXg2NEtQV1BWOVhKL0FCcnd4NzN0RDUx?=
 =?utf-8?B?dTVSUlhKc0J3VVdSaUpxODFiNlk4TDdDZ3JkRHpYeHdMSkJZWkh0QUFxOTNu?=
 =?utf-8?B?L2hLdUZnZ1BPdjNFdU56MkpwUFRyd001eldZRThEQVBYNFpiWUtrSEJXenl4?=
 =?utf-8?B?Vk5jdDVwUC9wMXU5ZjhvWHNKMzFqTHU3TnpFN1VuQVU1S1FVMkdVZndlOVRx?=
 =?utf-8?B?Z2VjaWpneXhmcXgvQ3gxQjZjQzQ2M0RPRDUxZTNpTHp6dHFhTmlQYjhaZ2xM?=
 =?utf-8?B?Q2VKMUxHZWFHYk1Cemp5dFV5cU1MUHBGclZPVVZZWVM0eUQ2eUxFQUtHejZG?=
 =?utf-8?B?Qm5qaEp3dzI3bVBsUjZKaE52emxxaHhFNjVodnhORzNRb3hsN2k0TlFLVXZv?=
 =?utf-8?B?Wk90MlI1Ym9pbFhzSlhET0publgzZldVbk5jZ2s0eUxuS3E3ak1nZFJraWVX?=
 =?utf-8?B?YlowVk9IZXZzbTVBNWhQL24xNUlBRTNWWW5uaGphNjVBSFVTYllqUEZ3amZ5?=
 =?utf-8?B?WHphZTdPTlh4TDZsT2NDNHM1bkt2a1o0eTBYSXVOOVh0YlF3dXBJQ28vcjE2?=
 =?utf-8?B?N2dxRjErUnFXcGdHWndLRkx1ODRIS2dQbHJVaThaZCtIbE4xc1RrRlUwZjJ1?=
 =?utf-8?B?aHh0Kzh0NGNQaTY4VE1WUkR0dDUvTUY3UXFqamc0RUI5MjNpRWtmUUFMUWs2?=
 =?utf-8?B?cjVOaGE5b2NwcCs4L1BVbmFBSWE5T2svVVVrQTJodHlQVFc0YzhLaVhuT0lQ?=
 =?utf-8?B?Um53TDNFYkMxTXJxUEljMkg5V1Z1NHUxMW9aM3NCZmpDN1BOUG45eTZiOEdM?=
 =?utf-8?B?RjRwdlN5MHdwWDE4YUxzaTdQLzNubU5TcHdQRDE1TkVoV2MxYnVQY05hMUhw?=
 =?utf-8?B?TnpLVGZ0TDRydEYwL1l1S2wwVlBqTnBIRFFEOXZwWVM2Tk50dDNZdHBJRHps?=
 =?utf-8?B?QjVuL1JDSHd1Q0YzVmtLaWpvMklCLzZENEdZbURjeDc4VTFpT0NCbHVGellL?=
 =?utf-8?B?a2tSMFpSejRhb1FXd1JNWkZ1YW9zT2NzaWNYNXhmU0NQS3B4aTJ1bmlHTzRi?=
 =?utf-8?B?aFRoUUZzc212b1lJOStzYXgxSjU1bmd0aUZBcGlwempxeTBJV3RmZ2hEdElu?=
 =?utf-8?B?a1ZvVUtFL1lGN2Nybkh6Wmt3cmNqNkx0emdrUEhUa0NVb24ra25pOC9LM3Ri?=
 =?utf-8?B?S002L0dvK3ZQS1JqaHNWVVVmdERLd2JtbVV5bUNPSUJ5NW50L2xXeWpXTXQx?=
 =?utf-8?B?VExJZEdMM3A3V0ZMVGN4YUVreXJwUGlkY3pNcm9Tak1Kcm1VWWpmeWhhRHo4?=
 =?utf-8?B?WTJod2N1eUhTSUxMN3lKWVRzSEs2RjRTamFnQ1pDOVRHZ25HZVN5QTdoNHpm?=
 =?utf-8?B?YWdVZjVWUEthZVBaUWNOeGRhdVBmMzJsa2VKVHArRmpRV0x2cDZBRkwyMzh2?=
 =?utf-8?B?N1loWlVDWE1JaDdBdjVyaE11ZDQrRHpBNGFZd2s4RGNYZWlUVjd5Wkl3SkR2?=
 =?utf-8?B?RzlHQWVYMldaZDI3UWRNd2taaWVvRG0ybldGQVRhU3l0M3dSekhNWTN6WmVT?=
 =?utf-8?B?K09TUTJlYWRVVkcxRVdmWXpZcUI1ekZtNGNTQnJ0RTFqT1k1d1h3Tzk4TzZh?=
 =?utf-8?B?NHYyMmRWUFhNU0ViRllYaGZCb0hYOXk4SUttQmR6SkNsMmhoRUh3WmNwckFB?=
 =?utf-8?B?dG1VVXUyU1RnTU1BZm9RK3lxNVNqK1RUUk9OSXpPa1V2WlhsWVRacy8rM2pQ?=
 =?utf-8?B?NkJYaS9kSXhwR1NtRzFIVzBWVWpSUU14WVptNWVqV09WbmRoT3BVbVFDMklp?=
 =?utf-8?Q?yLsFX0APDy0q8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnBJRDJlQ25qelRaSCtiamRLTmFqck5LdDI4QjhGNnU4d1N0NnEvNnI0Q3hZ?=
 =?utf-8?B?YlgyKzRNbzBqSC83L0Uyd0FmVCt3OUtoRkt2T1RhZXpMZEVyclRKRUdtRTRj?=
 =?utf-8?B?bFF5K0tBWFAvUU1Cb1kybG96eCticzFlcUp1Q2NYODErNGd3ckpUME5kMENJ?=
 =?utf-8?B?SXZUb01tMUJKeHlMckMvYUpwanBVYWxIdXdkaVYrY2orREtRUTdRN0hiS3Iv?=
 =?utf-8?B?bUE2ejRnMERxTGhVR2NIam9jZlR2UUlybGJWcjVsU0JseEFVQUEvNys3cUVo?=
 =?utf-8?B?WmRkbHN3R1RUUmp4Q0NlajY5R1VEdUZDSGxlSkFtcjhrU2lUR2h2ZzJGOVhr?=
 =?utf-8?B?c1BTcVhpZ0xyQVdVMHVhR1FBNkh0TmZQeC9wN3F6TmczZ1RvSW5lZVR4TWFj?=
 =?utf-8?B?bStvaXdZQlNNa25NdS9MSlB4dUtONTJqN05PVDBWK2RyODl3SGpmc0NRdHY4?=
 =?utf-8?B?a0QxRTNhYm5Ka2ZnVkFSOWI3NmRralpvcjFrZWRNamxPb1N6U0JPRXUzQmgv?=
 =?utf-8?B?ZHZIVGozU1lkaTFsS3M1anpBODIzdmExbU0zbUY4bkRtZURzVUhOU1lmbURE?=
 =?utf-8?B?YW1HWDdNclQwdFVxbmVzdU9mMVJXbGFuR2Z1WkJvRWdnL3FBTk5ZNS9CVWVZ?=
 =?utf-8?B?NTFFWXNqRjZRYk1DVVUzZVB2bjZsYnJYRURTcXNqWFhxYWYwR21OVTVqQkZ1?=
 =?utf-8?B?YlRsSlJpZVFLSDlRMklwaVo4cWVjaUcrMFlzM1g4YWk4WnlqWWhmL2hLdndF?=
 =?utf-8?B?SE9FOGZOekdSMStyNk1vVVEramNxK3pqbTRGVjdyVnFVVXRWOEZ5OVBRL0Fq?=
 =?utf-8?B?dHNmNnV6R3VTWkc0dTJEMmZXYXF3clFsMnQvcVBqc2ZTRWxRMGlsQnhhVS9u?=
 =?utf-8?B?a29rMEw2bGxoTXpKdlkweUNvNUVrcVF1LzFmODA1MVlTdU56MUZJU0FxRUhG?=
 =?utf-8?B?dEdQK0RXNkwrYUZ0YXAybEhzTlpXVlJLVkpjNmNwNFM2RHljUDlnUTRzZFNh?=
 =?utf-8?B?bHpScmUxY3c3SXk2dGlnTWRhUzBETWlFZlpBdTBjSWJoazl1clNhQ1k3bEd2?=
 =?utf-8?B?NjNjK0ErZXZDZGwxM0k1Tlc2MjlCNlF3OG4zcE4zN01lUHh2TXJBYW9MMmJL?=
 =?utf-8?B?dFJIV1hsUmhIZGxOOHMxdGZjbVJRNkRSRDJNejdiNm50UlJwZ2l5Uk1TM01C?=
 =?utf-8?B?S0N4d04yM0pWQ21lS0ZGaDNqYjdYcTBUY1dFRlpmbjMrMlhiaFdBTlhXWjM3?=
 =?utf-8?B?NDZmbWc5QkVtZmVjbUlCYml4SFQvOUNzU1BjLzZDU3Y5V1M5eklxaTMvaWlL?=
 =?utf-8?B?Mmp4OGY1Yjl0QThGWndySXZlMElIWURXa3ZuZmM3M1I0S0U1ejYwdkZRQTht?=
 =?utf-8?B?U1BRb0EvUC9BUXhoUngzaG1ZNXFEWUhOU3gvbW5zYjJiYUNRakVxbzlJVWNJ?=
 =?utf-8?B?V0xaQzhwTWxuNDYrUlFKNlJhNlZ2S2xKckV2bjRNT3ZKWE9XMUVqaDdRenFN?=
 =?utf-8?B?WEhpQkJ1MTA5ZzBoNER5MmUzbnA1Uy9HaG5uUjZBV21qNmNKcHZqZUVUcHRM?=
 =?utf-8?B?ajVETmxERjl3ekxUbjVvdVJDT0ZrbktKb1NUMFpPeDdWeEQ2bGVBbkM2QXFJ?=
 =?utf-8?B?QTFxZnJpUHBJcU5wdjZRaWczSnkwdklac0tpdGs2Q0dGanlORUd0SW9ralM0?=
 =?utf-8?B?RWNrb095Ty9iRll1L0J6S29jNmpQOWQzcTVzejBiSFJVN0tOdGR1Q0tReHQr?=
 =?utf-8?B?WTQ3US9QS1NpbTJGOWhUanBrb0VsVUViTDBDN0pZVENmTlFUOWFxczhNTDZk?=
 =?utf-8?B?RjR4YisrQklhWXc4WVJWcnZubUhnU05QMTF4SUpzNmdXTGxkWlRpNVkyc3hY?=
 =?utf-8?B?VUtqSmRtZGVsWm4vdUJIT0Y0aFRvZmQvWk5SV2g5NHlZTVRUOTQvZjFub1Uw?=
 =?utf-8?B?WWMxUjgxbkVLWnJOdmlJVzJjNXlHSHdqU1IwZnVGM002b3RnOEJvYXJSS091?=
 =?utf-8?B?OHRnbTRMY01OMEVId1o4c1dKSTZVckJLYXpMNzVxRFZ1VzVFdVpqV0UxSENF?=
 =?utf-8?B?NkdSdWtDYUJ2cWI3OHFScXdxU0FnR1dLUkdLeit4MzNXN0hlRHhTajJCVnJJ?=
 =?utf-8?Q?NGkZ9PbuwTZubs/20iAbGFkUd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb055dc9-a525-4ac9-e9ba-08dd7281979e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 07:31:47.9365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehBlYpTpz/WWcoykOlwV2Ha8DuPNQy4X0D1twF+lNqAgWVR4v1gkPHFUecpNLV3EwymOynVuXkYSYHN3gjfNjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF316EEACD8

On 4/3/2025 3:24 PM, David Woodhouse wrote:
> On Thu, 2025-04-03 at 15:13 +0800, Zhu Lingshan wrote:
>> Hello David
>>
>> IMHO, if we need a bounce buffer, why not place it on the host memory?
> As explained in the cover letter, this is designed for the case where
> the device *cannot* easily access host memory.

Do you mean CoCo encrypted memory? If so, what is the difference between
the host memory side bounce buffer and a device memory bounce buffer
to a guest except the transport(DDR or PCI)? The device should be
able to access host memory side bounce buffer.

Thanks
Zhu Lingshan

>


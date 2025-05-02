Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52694158DA3;
	Fri,  2 May 2025 22:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746223977; cv=fail; b=dYHafn+/o8i6lktcQwuhXnVfLXYQ9ruhjW9Kz2DmB1hz+zuS0KaSrRQyS0kvqZFBnPmEGBzVCfOp2XVxZE07d34KWA20aiUFqPxIek7aapH9qskhYxGr5x7yi4D+hyr1/Q6k+ExBACkzUwTqankek8u19XCRB3IrC8HYhpO69Ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746223977; c=relaxed/simple;
	bh=8e2/hKml052dCVF2ikJyhkV8+xpHAwJuTHykgGrnjKE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pV+bPjhiOzevTaU2QDeUog+IrL+HulUkcTw8GANROQBDXpxzQRYhz7SNBYjlOdNZAMfiiOMYFNG2wkCXn/GmMe0ETX13GIJvnncObhotsCUKuvwGSd/d77XOjuvD6RwqOdeg/QJBC04ARwr9FObKd86zqtehd0TG7AlpcfSD128=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hW+73mLZ; arc=fail smtp.client-ip=40.107.236.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hW+73mLZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfd9nhhjK2AUN8G3Q1SkDvTz6B2mgK5YkyvHfDDmNMojBAJNN9/0S57LV+0rlQLFIHRGhWhE1SIH6Pg5CugPiRDwuV+umbueOnpE9Bmv+I0Zx+9xIwiU6nQrpYjvzlXwmaoEODV3U++bDX+sJCqT5MkjK9r2shLAzsRKZYi7XuolltnGxqMrbOWq6cT11+Xyt+swiZDi5Sv2wk9HFy876xQdeM3HMFKLPKAw6YdquQJQr1sOjiwaffKWmsRZhvAubgxhRS2JsinP4iuVELMZS1M8gA8tSZaazighRjd0KD8nBDgYZBgb3jEyE44qZTiOyZ2eFLDD1ZtbKiJPttmsFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkTwZ7MclbYtUn0abnoA4eRn8IrSzBBOg2KeSVtyv1A=;
 b=WW3mFBPpN1ggCt+5yw1cKIrYhqTV/FSEPGYVbTmdKJ7kIQx3rTTkRC6zD3jIbVa2mfz6ILCO7X03orzKkVcSO+Bc8XeRgj7mH+S0OG48w2p8O9i/gVRqMhpGGXUXwqpTuG2Ip9wWk7Gzx5J/Xn/FgLWAExsvpZfs1z7sJ1/AXQ9QoGADIEv13TPrcY6k44vZ6BsysXugNHG7bZiLy+Q+rMUGxQweIHMx+vEY46VmE2rg5pLMUNOD7ByJ5wsKvjeKXsqjIkoIQ0JIjxLQx/cwMpQt3bxHhbBtDOfaQSUaavXUFw8IVHbfCOGuXJSBTvuegKIIreH5kYanT5D8Zy2SMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkTwZ7MclbYtUn0abnoA4eRn8IrSzBBOg2KeSVtyv1A=;
 b=hW+73mLZ92aiw6hfrP5Rz3PIcLvGKbycCRTR3q/Ie77uwCzT7hWofJ/XCeLEMeWwT2peVzjSOgw52cUNdnblGfa5grgpO0FECq/d2c7k6k4Z2q6bRlFKYOp5yzcGoAUI1GDQZYmHgaBVnvvibVX1YdolPH7Qu/G1E43nrWrkPn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by PH8PR12MB7133.namprd12.prod.outlook.com (2603:10b6:510:22e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 2 May
 2025 22:12:51 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8678.028; Fri, 2 May 2025
 22:12:50 +0000
Message-ID: <dc625df0-7053-42c9-b79a-0cfaffc9392c@amd.com>
Date: Fri, 2 May 2025 18:12:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] platform/x86: Add AMD ISP platform config for OV05C10
Content-Language: en-GB
To: Armin Wolf <W_Armin@gmx.de>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250502184736.2507703-1-pratap.nirujogi@amd.com>
 <f2909e89-fcc1-467d-a2a5-ea8942b755c4@gmx.de>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <f2909e89-fcc1-467d-a2a5-ea8942b755c4@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0168.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::27) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|PH8PR12MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f0db87-a357-4364-0f5a-08dd89c67a66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1ZkUjQyU096NythZ2hGOHhNWHNUUnhpNFBaMXlDMUE5ejVoUXRXeXFwM09U?=
 =?utf-8?B?YVdreTAyR04xYldSczJXRG5VbktCblZaMzVCOStoZmg5UlBhSERoOTd5SVFt?=
 =?utf-8?B?UzVWZHR0MWo4V1M5T0F0UkZWaDU1RGQycllvam91SHVaT3RxOU82ZFdZaWU5?=
 =?utf-8?B?NUMxZlVFamhTa1FqYk0xOCthMEsyYXlBUUMxcGlBMUM5Rm1sNFowWXU4OG1R?=
 =?utf-8?B?YitLVmIzT3NoblcvZDVBcXVXdXpBRHAxMmt3SVhRSTJXMC9YMHEzeWxWU21n?=
 =?utf-8?B?MTJuQ0hWZ0d4MmFUSmh1My9DU2RNMEJVNHZ0TzA1NmpBUEJNdnRRT014NmhD?=
 =?utf-8?B?bDRDczlKTGY0YTdNTVh6MklYN1hXc2NPc3hqUUlFaEQwazR6R1QzYzRnSjhO?=
 =?utf-8?B?ams3dVM5ejl2cE5aSmd2ek4xeFdxZURKSXdrU1dkelhXc3M4UkczS0MwOFNp?=
 =?utf-8?B?Qko3WUVkdE85ZFlWdmhvdzBxRFllMHdGQmVaWElnOXQ0MXE3aWZqNGxQZVpE?=
 =?utf-8?B?cGhFcU1vY29wbk5qdUt2ak1CU0QvRHdSYXhybG9oU2FZWmFoTXVQeXQ5ejQ5?=
 =?utf-8?B?MGpPck9lYlA2QXkxVUZlU2lmWnZNVmp1NTJFWXNqY3VnS3prVzFOMFJtb1VH?=
 =?utf-8?B?bllZSVNHU0pKN2lsU1l0NW51UzRoNUJBa2NjaTdrb3BrVUdFQ2praTI4WTJI?=
 =?utf-8?B?TUlZL3lQbC9BK1pVV1NpaE43UG9kWU55bGZUNUZlRWFXSDZQK2laWXJiSnVw?=
 =?utf-8?B?NkYvNTUwMVdzRkM2ViswNGZ1NVVNN1pQZWhjUlJhSHJKUVlGL2lKZXRKNXpu?=
 =?utf-8?B?RnhjaC82bE1weVllbi8wRHg0MHpOcEdzNEoxYlRMVXl0SXJlVDdPSm5IVTNL?=
 =?utf-8?B?c1RUNVc2T2hJVUhHYzByckxPQjFvK2djRFEyeC9MbjB0YWQzWUhqZitwZVpI?=
 =?utf-8?B?QmtEWnIyM3lSYjMzWmptbUdiVVJiZ1VSdXNWQWREUy8xV3lxTmhqa3pCS1N0?=
 =?utf-8?B?eUVwV1pkSklkdDkvWmV6YTJaTE1WNmE5bGVuam42blRNTjRENVF6aUNsOXhD?=
 =?utf-8?B?TUduUzlPTWNwZEV6TXREc2swb2pNRU9hbHlLL0IxSzJKeFRkdGNTa0tWYVdV?=
 =?utf-8?B?S1ZFVHovTWw2bmJUQVgzam50eVdGNkFZeHJPeExOUzl0UEhCRHpXRXIyWEFV?=
 =?utf-8?B?ZHh2bkJaTndNOVRCWW91eWVLSWorYTRuZXVGd3FWRFFhUW5zTWdXMENrcUIz?=
 =?utf-8?B?eDdSVUdKUTIrREhsMC85d2RVNkQyYndocjh5bHhnYlFPZlBqU0dYbUFlTndJ?=
 =?utf-8?B?aS9EQnVrVHFGTWdjNWhyQzQ4OENOd0Q0MUt1clF2dEg1VGRqdWRtYUswSm9Y?=
 =?utf-8?B?SkVCak53NUNhRjNmb3VsZ2FLQVVXdFJIMnFvd2hPVEd0cnN6Wk5yZk5jMGFk?=
 =?utf-8?B?S3ZTMUZaSlBPZkttMGJUMkZ3YUZuandVMDJqMG9iTys3cUpkTWs3UkFzNS9Q?=
 =?utf-8?B?RTRLbTFzb3EzUkFaTEw1VGdLZUJyTlQ2c1F6Y1VCQzFaelI3aTlwc3pVSVJD?=
 =?utf-8?B?dHJ0OHpvVmVmdDQ3RUZTMFFlUS9tWkloRWdxZjdzdE9IaTV6K21qVHkrTHJ0?=
 =?utf-8?B?MEsvVW5sQlJkUHZpOHNYd3lKTWJuTnc1aHV6Q0VUUkN2QVh2cElnUno3bmU2?=
 =?utf-8?B?VE9ITGdjdU1BRlV5T3VFcFlybVhuTjk2K1RwTlpkd2pneU1qVlBhbm80ajVF?=
 =?utf-8?B?VWltOVNNUFlDVENDN3p0VFY4TEtySjV6Qyt0Rzh3c1BDRXg3MkNYakNjVE14?=
 =?utf-8?B?eTFNZmhiaTVod1BqQ0xLdkxMRXhPQ1REUU9Ea25nTjdlOERqVGNRSldwdklw?=
 =?utf-8?B?MkRSKzlGcTBhd2s3dlZjN3N2dllUb1Y1QUNuT1JwUkhLeFFHZU9Ic00zWjlY?=
 =?utf-8?Q?QxgIiWy1jtE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTBvcXJ5OGVwcUtOaFZxbW1vUHN0Z3QzenhZTkpaQk1GdlJTMmIrS0M4aXY3?=
 =?utf-8?B?ZzlVT2hFbk5ZRTFBTGhNbDR6czJOM2xsRDFKK2xyWXlwdUlnWDRlaTZVS2RU?=
 =?utf-8?B?THBxU1BiUnRIMGp3QmJRa2ZtbjNFZFhsWXFsZlh0Tm1FSTdxZ05PMXBxY3po?=
 =?utf-8?B?WVhYVXZYMHprNTBqSHoreUxEalZqM1AwUEtFK2lPcXhHWUVJSVV3aVIyd3Js?=
 =?utf-8?B?d1AwajUxbnRLbTIzMGZMR2dIVHVSWmFIczNoV1Z4TktibmxwVGYxVFREdXRS?=
 =?utf-8?B?SWZQY3NsaldSMzVjaURtd1hnam5oSFZkTVhiT1lDdU9neVdZQWpqUldXeTZr?=
 =?utf-8?B?RUt5MXQzbThnK3FwR3UybnpzeWZJbUExR1hiQ1VVVTlPblNiVWNrZTQyMjlj?=
 =?utf-8?B?Mk1kWDN2NGpTRUxML2J5WmE1bnBTTXF6S21LZ1VYbktIcklPQ0s4WUJJRmgy?=
 =?utf-8?B?d2JCdU81bll3SzRsMkNIZHZubzJaYUJlSFlHWW9aSWtmaXB0MEc5WU1hNzlL?=
 =?utf-8?B?VDd4a1I2dERGVGZtTkdoT1p3TGlUbkpWSUhMTDQ3MTVUbGdVdGgwaGwzZjhK?=
 =?utf-8?B?dW1CUkJvdllCdVlqSWtiRnZvcHY1QnRYVFBsMXViWitqc0NVd0JWQis4d3NV?=
 =?utf-8?B?RkNKaDhWMUUrLzBMdVkxZHZWbVU0OHdOWUhnTmR1dyt6RStUUFhTWGlkZDJr?=
 =?utf-8?B?TUNWdENzL00yWFRBTjRGa1lHbzQxcnYyVk9jclhJVFlOWjdBY0xhSDFYazBx?=
 =?utf-8?B?dVVGdXZGVkw5Q0NhOWpBUzc2aHhtY2JqZGlIZ1VmUnRVME16bHVpL3YwYlFL?=
 =?utf-8?B?OVMyTjMzYkhnNWd0KzFkREJoOGtjbGRrbTJzUlo4UkNEQ0pDMWNwRkw0WS9W?=
 =?utf-8?B?UWFHWlROWGtJc2t2VU5FY1JoQTlyWmlxTUw2U0ZzM3BlNlViNnRrTnYxUFdI?=
 =?utf-8?B?U3FPR1BIVE5INkhWa29zZ0lsNzZ1c21GemdYdGxjQWpYalpxVVRpeUE5WFZx?=
 =?utf-8?B?b1lKYWloTytYVlFJYVptSkJ6b1lKb1lWU21Ld1lqMGYvdEE2dHBvQ0E4WXQv?=
 =?utf-8?B?MEtwR2VDa3JiMFh1SFR0TStzSC9qUEZ1V2wyZVFWZVNqWTRmZTdWd2hEZUxj?=
 =?utf-8?B?eFdZWjRsZTBLOFhraUJnMnZRTUJuS1hyLzA2Y2dBNUVpWEVDaU9MZUw1Z05H?=
 =?utf-8?B?U0ZuUjRqbE9MWlB6Z1NZemtPRlF3MnFWWHFYODhJaks5YUVJcDdJcmNRZ1E1?=
 =?utf-8?B?T01LeGM4Q1F5Z0hJVDdKYlVTTTVMaHQvMXFIakNYdU1FQ0E0ZnN6SjJhZ3B5?=
 =?utf-8?B?dzgrR2tadktOdmxiQmFuRU9XZEo5OGlocjZvcytsTThCWHRLdDVydHQ0Zy9R?=
 =?utf-8?B?WWdwelVqNmEwRy9kNVppVDR1WENtRmVlODUrRU9QM2hZREwrSjV3MTNjZ1BZ?=
 =?utf-8?B?UUROVG1ZMWVpSkk2S1ZkVEkxZ1JpQnA1VEMvWUw4bjRyT2JWZk5rZ1F3ZnJJ?=
 =?utf-8?B?Ly9zY3NGM1RXSW5UbG9lYXliUlozSUUwMmJXcWtyM2g2dXN2aXNSSXBiY20r?=
 =?utf-8?B?M0c0UnFtTElmcmpyc3Z4YTdrSzJUUHc4Q1F4dTNENnl3WUp1RnlrZ2MyMWNE?=
 =?utf-8?B?aTg5NGUvT3ZJK1dHbWdBNXhTSXBzRjhXM09QRm1jczNrRzFNVDJHMVBJL2E2?=
 =?utf-8?B?cTRRWFMwT2g4T3dWMm13aUkwcytUQ2M0WVVRU3VLbDlCSUtFVmYzUlR0MEdE?=
 =?utf-8?B?VkF0enZxOWNDUG1ZcHludDJUc0didWxRbmQwc1NleTluNDh2YXREYUtldXpx?=
 =?utf-8?B?cHlBQkYxc2FHc0w0b1FZaEFZV0htbFBLOFM5T3lGclFRUTc0NEZxRGtnYVpl?=
 =?utf-8?B?dmRlOGVGMHVYQlNJSmJBZkd0MlcvMTJHQTkxN3FZMGdnem05SzNMVUxPOUlN?=
 =?utf-8?B?c1RtczloejFhUTE0WFBkTy95VElmOU9PUE9WLzY2cE51NUJWdlJlT0dJcUJI?=
 =?utf-8?B?SXFaeFY3bVBGNll6ei9EeGtvcXBvN1U0djJhblpocjhtdnQzTmo4eklRbFZZ?=
 =?utf-8?B?Smo0UUhTajlHTWVvVlJoeXRyNVhhNTVyYjJaRkNvWUxac0JyV0NKMTlpR1dK?=
 =?utf-8?Q?lWcwxh++O2Hw6Ld2KdkynhRKU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f0db87-a357-4364-0f5a-08dd89c67a66
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 22:12:50.8464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZRQDhy70T9tNGgM3RWWh/YbLTnSK/9WvOHSzGTFRjmWH2IfOMkNkFMb25MKPaX3+aXALf5h4GrzgRy34Go/Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7133

Hi Armin,

On 5/2/2025 5:14 PM, Armin Wolf wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> Am 02.05.25 um 20:46 schrieb Pratap Nirujogi:
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
>> Changes v8 -> v9:
>>
>> * Add mutex protection in instantiate_isp_i2c_client()
>>
>>   drivers/platform/x86/amd/Kconfig    |  11 ++
>>   drivers/platform/x86/amd/Makefile   |   1 +
>>   drivers/platform/x86/amd/amd_isp4.c | 283 ++++++++++++++++++++++++++++
>>   3 files changed, 295 insertions(+)
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
>> index 000000000000..312a92f60dcc
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -0,0 +1,283 @@
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
>> +     if (ov05c10->i2c_dev)
>> +             return;
>> +
>> +     if (!info->addr) {
>> +             dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n", 
>> info->addr);
> 
> I just noticed: could it be that info->addr is static? In this case this 
> check would be pointless.
> 
I agree this check is not important. I will remove it.

Instead of moving i2c_board_info variable outside 'struct 
amdisp_platform' to make it static, I think the existing definition is 
still valid to use. Its because 'struct amdisp_platform' variable is 
passed to notifier_call and i2c_for_each_dev() only after it is 
initialized with valid params in prepare_amdisp_platform().

Should I keep the 'struct amdisp_platform' definition as it is and only 
remove the check? Please let me know your opinion.


>> +             return;
>> +     }
>> +
>> +     guard(mutex)(&ov05c10->lock);
> 
> You need to guard the check of ov05c10->i2c_dev too since another thread 
> might already have assigned i2c_dev
> after you checked it. In this case you would leak the first value 
> assigned to i2c_dev.
> 
> Please move the guard above the check.
> 
thanks, will move guard above ov05c10->i2c_dev check.

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
>> +             if (ov05c10->i2c_dev == client) {
>> +                     dev_dbg(&client->adapter->dev, "amdisp 
>> i2c_client removed\n");
>> +                     ov05c10->i2c_dev = NULL;
> 
> You need to guard that too, including the check.
> 
thanks, will place guard before ov05c10->i2c_dev usage.

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
>> +     mutex_init(&isp_ov05c10->lock);
> 
> Please use devm_mutex_init().
> 
thanks, will switch to devm_mutex_init() and remove the mutex_destroy calls.

Thanks,
Pratap

> Thanks,
> Armin Wolf
> 
>> +     isp_ov05c10->board_info.dev_name = "ov05c10";
>> +     strscpy(isp_ov05c10->board_info.type, "ov05c10", I2C_NAME_SIZE);
>> +     isp_ov05c10->board_info.addr = AMDISP_OV05C10_I2C_ADDR;
>> +
>> +     ret = software_node_register_node_group(ov05c10_nodes);
>> +     if (ret) {
>> +             mutex_destroy(&isp_ov05c10->lock);
>> +             return ERR_PTR(ret);
>> +     }
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
>> +     mutex_destroy(&ov05c10->lock);
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
>> +     mutex_destroy(&ov05c10->lock);
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


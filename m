Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2083.outbound.protection.outlook.com [40.107.212.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A812E22097;
	Wed, 23 Apr 2025 01:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745370189; cv=fail; b=OYhzpvj+daoKpWC8booLJdCbbVcqUJ4hO4aoBohl4UWnbpiGImckSDIsjlY1NQVpC4V2IFopfkqDpuVIUhSwp1Uig39AQLQdlNxxjGNxhiOAX3Xzhpi9TC3WeG/REhBNBo5kq2q2BDrcfppcLuL9/kEeGbxoVDDj25baxZLDziM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745370189; c=relaxed/simple;
	bh=lzNkv5eH7IazXbJPxeffOGDGkRgKBPJuF+0QyAX7Cpc=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=cR9/G57IKm8Phw9fkEuCGSzXX3GYFVYK/13hCdqxuIjiR8MhPjmSLBlcJBsbVF0X0uztEDR+e134XLVLMgTYLLqjOJEtMAV+Dkc7J2obc//W+MhW0slYv1509gI5K+AViATKQenBZpNQTBJsrGqoCQncc7c9PRXSrBR1lYegmM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p4t6rCrV; arc=fail smtp.client-ip=40.107.212.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p4t6rCrV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYO+apBkmbublGohaPvHy4VTzs8A3wjYiaEdCjVFqdGvMSAfed/8daxRz0IZKE/Ft/Mz1vSFFcmWuYXrnmvCjhI72o24AwJlCYbHq/FB1TUe6cKg95lPBm9LuYpRtGkPyX4YYATM99miVqWycYeow2vI7Zi4NPtCTM99mLEJ16uyGA36I6auvSkcapdcHQclbQK8lzh5beqqtia6c+C54GWVwnHJR9ndPDCxA9J11Mk/WAaALEOC9ZB8lvGM5poaoK96yxxVXg+dK6VF5qN93hxF9ezQJNOR7IyPDgJIgXQKTl53gldZaZywNw6N2oj1PCJdJAtJcd6ermsO5uFpWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSaPy3ZOLJtX2t6C98r15Dci8ookJxftaqEATLnEbOw=;
 b=ZBE0D/mVaQQmcQmi2wmf2fLeFHY7fuahRdsn3hPwgXssu8lNSB3p13CJl8yvQUulYklX/tfBoj7SfdrCmLL1kAGEbKIq4Y2gPZJ3CCNabtY7Q3Jy51dVaZpCAhua5NAeWgDYtqZ44vbiss4fiSGr4yEWMbi/CQ/DVzaNNXpt4XfabN7OnMf95biyqmvJ/fP9va91ZfmJ2DRoy77M+yoZqUhrC6VpOmtWVQFxPOcaEL5lJGm2m3rgTBY4FBwVWBj4X3OqW2O8NDzy9JG2aOsSJK01djt++wbqV3vebeTEZy3HmAJqX/06C2TtgOEbbXWz17wLHKl+dhiETZx4g0uZIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSaPy3ZOLJtX2t6C98r15Dci8ookJxftaqEATLnEbOw=;
 b=p4t6rCrVCmwk62L3iDUxKXEn7nTdNBLF9L/gIv2/QXCFbOGSr5+4lRMbSc0DNypD6rEq1U9WeHOT/oHngSJfXuzCIdhKWZCRL/bqSBiNKLwf5Fegv3cRnufG/NvEN3E7ovhleAxCDxYWL3bPgA/ZGme63zox4yb9tqGRZSqfgbgfl+CRupQY+cJG4P4VNij2FXNdGZadNKay39JQhxjjNKUILm5808cY+Y0f6MfSM0txYo8OM+XuIh3fhjFbuAEI6WG68rP2qbXeW+kPdhY8u09/2XskPpMhVYE0JZcbco/e8ZdCyf/vVqNmxuAlJnLpHqeTtWOYe857ATK3a1LwjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB9114.namprd12.prod.outlook.com (2603:10b6:a03:567::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 01:03:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 01:03:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Apr 2025 10:02:58 +0900
Message-Id: <D9DM3AR3FUAF.6JSNSB9WAJ4T@nvidia.com>
Subject: Re: [PATCH v3] rust: alloc: implement `extend` for `Vec`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250406-vec_extend-v3-1-ec5c5c0acf2a@nvidia.com>
 <Z_OwmEKHgsZlt2cs@pollux> <D91AOKOTDXWC.7R5K5DI87QU4@nvidia.com>
 <D9C61DDI99JX.31T59XPQGYBB1@nvidia.com> <aAfL-e6qA9oBce5t@cassiopeiae>
In-Reply-To: <aAfL-e6qA9oBce5t@cassiopeiae>
X-ClientProxiedBy: TYAPR01CA0052.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB9114:EE_
X-MS-Office365-Filtering-Correlation-Id: 35bd0025-6f00-436a-6e36-08dd820298c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mm9jTTJSMG9yL1lYUDl5VHhBaEc3ekhtdlJzNTYybVhQcmNFVE50ZGdPSjBQ?=
 =?utf-8?B?ckJRMldOejZhUFRUUFpuYjZjUnl3OGdnS2RaMGM3TVJ4eHM1eXhudmJSUktF?=
 =?utf-8?B?RGwwTFJlUWF1anFtOEEzaWF1KzNyZGM1cHV1Y3ZNd00xUmFoRVhVTWZmbmE4?=
 =?utf-8?B?YjAyL05XR0lDbTBBdWw0eXd3VS9VVHZKNFhuMTZYUHEzUFJLNm1aMEtQQ2RP?=
 =?utf-8?B?VUxROVJzOVVHcCtNcWYyc2p2empXZzNuRDBxYkl2UWIzU2E1b1JoRVFjRHdk?=
 =?utf-8?B?aUJ6QXNjRmlnK0R6dUJwTVdyNW9JNXlNSFlLbUQ1eHhneDFvakJkV1ZORGhr?=
 =?utf-8?B?SVRGeDlhd0pOOHVud0VVcVMyQjJ0aFFiU1ozTlkwTVdmU281OG5YMTk3dm1G?=
 =?utf-8?B?WFRmU0FSMjBIOXQxYXpKR0dsN0k5VjQ4OVJVNml5NTF3b0RPU0Z5SzRsTm9r?=
 =?utf-8?B?NkNZelJmbnJiY05SNFE1OFNYQ2RJVGpMNFlRS1c2VzUxSks2aGhRU0RRajg5?=
 =?utf-8?B?V2h2Q2VYMTkyRDB0aXgrSlRZSEsvMGpKK29uM2Y3UmRndlV1MlROZmJUdUE2?=
 =?utf-8?B?cTBKQ09ubTBWU2tQbFVSc3RLZ01jelpELzd3cVI3ZWFFcU9uUGxoYlZFVHRJ?=
 =?utf-8?B?V1VDclVKNXFBODJuSjdLdHNjYUQ5aVRnODlGVEJoL0hsVDYrd3FMNFc3aWQ3?=
 =?utf-8?B?Tm1UU01FbjNlaDhWVjd4UGdvdHRCNW96VXZXckh1MVpjN1haaElvWDc3VjFD?=
 =?utf-8?B?SlJjOGxFYmxISVZIeWFCeVpiRklQcVZHeSsxQjB6RFcxcUhHUURXc1RGMnhu?=
 =?utf-8?B?eWwxdFNiMTFXYVJISW83aEhWU3pZNER1MHpYSFNmSkNoWkhFSlk0S0NCYllF?=
 =?utf-8?B?OXFNZ3JXUlpsYTl2OWs1WDN2dXQ0MmVIYVZiNzVkR2pnTWtFcy9LMmpvVVN3?=
 =?utf-8?B?YVVGL2Q1Wkl2ZkZoUmNKV1JZTTBaU3JLcTNhM0N4VS9UbEJTNW5EQUVGdDhK?=
 =?utf-8?B?c3ZSaTMrUU5RWEdtYnhCK3VxakRUQ0dadjFvajR6NVBoNWNwVXF2dlQ2aVR1?=
 =?utf-8?B?SENlT2NmbnBaQ3JkOUNEbWkwSnZnd3lic0E1OElVRnhnR2Via1FTRk9zTzQv?=
 =?utf-8?B?US9sWE80WWljN0czUTVLQVVpYlBxTllUUm9uVWtVR2F1WGtqdnZKT0prY1hY?=
 =?utf-8?B?QzdsOWpjSmh4clBJem0vbUNFd1FrVDdHYUVIdTZmaGx3ZmpYNWhRVVJIaHhp?=
 =?utf-8?B?ekkzdnc0cVk0M09ZT2x2SVg2NHpIY1o3dTF0Q0hORklrTzZTdmNSaXRQcklI?=
 =?utf-8?B?aFhzSmVVSHI4cGlENHVwZVkxOE0rdVF6UjRaRnJPWjhEV0JkYk9mcHBsbEdz?=
 =?utf-8?B?ZGJsQms5OStxMi9yRDFMNFRYZ1R0bGU2VDAzVHU5VVpyOFZ6UkREcXRmanFX?=
 =?utf-8?B?WUJkSXVvblZHSzMvWSs4dVRLRm1rU0VFU3E0TE5ZL3dqQk0vam9pZFl5L2h6?=
 =?utf-8?B?VmJ5eUxrZUllNFhsV1RsM3NWRDl6eVpZSGZPeERoK1QySm50WXVoamxsTytO?=
 =?utf-8?B?R2tOaFlwL25IYjQxZ1gvQlBuYVpDRHBoN1BvbWU0VThYQm5oS1pZdkJmSDZH?=
 =?utf-8?B?cUJnLzMrdlVqbGlrTFJncHNzYlRFYlpwV3ZPdFpSeHhCY2hPSXBmRTQvVWRE?=
 =?utf-8?B?a25RRjkxbnZmMFg1ejAwWGFBUVlvNStCbkRPL24xZUo0dVphMllpbVBMRC82?=
 =?utf-8?B?ZmxaRkl2NVRFRXZueFRpZFFtZkR2d1B6VUxJbGRBVmIxczJXWitqSS9rRjNi?=
 =?utf-8?B?emNzOHU0Tzk4NjZuQmR1bTNRWWw2MmxCdGMzSDRKdkxYTnk3UGhzaGV0bDE3?=
 =?utf-8?B?emNGQ2dHdHoyL0JocTVFU2t3UmUxaVpPaGd3YUJtM0doMG5BNzlnU092UEZO?=
 =?utf-8?Q?O8SKWQy9SoE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTRha2NuMmJmc2dWM3FPalUyTWVESFlZSW5Ed2Z5ZE51SEh3UERhNFVSdDZM?=
 =?utf-8?B?MXEydkgyMkM3QlhwbE5xczI0dHU3NnVQVmtRaHlXckRnMUJQZ0Nzc1NsWFhT?=
 =?utf-8?B?Q2I3V043VURJWWRTZm1wNm9zSXFGRTlvbGZMNHk5UVNCSnZMU0lMRS84Nm40?=
 =?utf-8?B?cFMyWnptL3lTakh0RnEzR0x1YXowbmgyL3R0eFU2ZmlZMUlSQVNGR05zTFFr?=
 =?utf-8?B?RCsra1J0ZEJXRmFYVHV6S09RNjM2UlZZNVZ0dUxVRGxXWXJUK1N3aHN3WFZL?=
 =?utf-8?B?YjlPb3h1a2VPbWd2NnB5Ni9GYWtOU2srejY3aHlCcDMxdzNZQ1J3R0RPZmM4?=
 =?utf-8?B?MjJNaCtjbjUvSGNsUmNMTEtQOG5ITnpUU0pLcW8xV3Ezdmp5SGFEN0xnSXM5?=
 =?utf-8?B?ZVVkc2JvZDlkcU5uRzVYNjhsMm9LaXd2andxNXRhTXpuZXdVYmdLYWpZUWh6?=
 =?utf-8?B?NG9oYmtpdm5NcS9zMmZhc2RhdGJHQzJ0ejVRek54LzFqcHFvV0svTEdMQ1Z3?=
 =?utf-8?B?czBKWGlUZHdSNHA3WGVsMWFveGNzNy9HeTByd2EyYnl4dUFpdGhpaW9pcHg5?=
 =?utf-8?B?QlUzNUhVdDhpbUVRWVFqRkd6OUNSZVl0VkNkWThPVHpzdDRqVXRvRXJkY01t?=
 =?utf-8?B?cGpneDFzb3U3cUcxeTloMG1hTEZpYndJQTJmdndPL01OUkRuZUFnRld4eHpU?=
 =?utf-8?B?NTBkV2ZIekg0cUJUcnQvNlBLS0krMG16Q0ZDTmJLV1RCUFlUVlF6SXllQVZl?=
 =?utf-8?B?UDBweEUrSVQ0ZFROa0U2YjFPQkE0Zis1UUpmaWVpa21qcGZFNmZLVGlHbWJu?=
 =?utf-8?B?LzJ3dEo3TThCWnJiaFlpS1k0VVc0TjRoeTIzV0JPNVBuTlVJdWNUeS90RjZj?=
 =?utf-8?B?NEQwdUxPc0RPb00wS0ZPU2kvUEFsUVlYWnNFNEV3WXdNNXcxbGtLRmR5QU9m?=
 =?utf-8?B?SCtiQVMxdTFjUjhpeWlDNzZZNEpSME1PR0QxaUxLYnlkbkRTbXlZZmtvc0No?=
 =?utf-8?B?Q2JBbjVDejJDUVJXbEovZGsyMk5kMmF4OUE1Tm45NFpIMUZmVlB4V2ErRFdD?=
 =?utf-8?B?T1Z0K25lMlAvZDM5bFVBZzUydHlJMjR1Zm96OXRnc1hicS9PVDBvMkpuWUpa?=
 =?utf-8?B?cVR0VkMwazRQK1krQmFwR2NwTXJmRGE0WVpJdW9LTFV5SktQOXRleXdJbnZu?=
 =?utf-8?B?ejlUVXF6NkFHOWxDeHRaMzFmMjZCN2RBWXlNOHZHSGZLUUs0UW5tRFpxNmQx?=
 =?utf-8?B?bFpUNGg0cExsQmRpQXNoYkl1OWRzUnRianJtWEdNTmJyV0hPN3ZEZjJ0ZU1h?=
 =?utf-8?B?K2xyTkNZZTRDdGlaQ2R1L1N6dy9FRllucHJ1RlowajdhVDJmUHMrUVIrSVp2?=
 =?utf-8?B?aVg3TkE0SEo5OHhJSjF2Z1BsSHlJbnYvSmlOZlNoRGZPdlJZOUxHejRjeVBX?=
 =?utf-8?B?RjhUTHlITmhUUngwcjJyVm1sQWZXQXViRXhIUjNodXlSTkJWMU9ud1EwZ1My?=
 =?utf-8?B?U3ppT3JRTmJQempDWUpLU3dqVnZMWmgvRWlibWxYUm1UT21kdWJpV2EvVzRM?=
 =?utf-8?B?akdIV295SkRWSFphTDB1UlpDVHBwdmh5MFBIdmdoYkhVZVNWZitUd2xJMXBy?=
 =?utf-8?B?WFNzb3B3Vm9TL0NrN2s5VDRpVjVUOSsrTjVGS3NvMEFWdFF1OVVXUmhVQVlq?=
 =?utf-8?B?RldsSUdhU2toSkwybmlVTHNxN3lkZlhQeExrWUdWU2VsZDFyWGhWNnE2Wmph?=
 =?utf-8?B?QW5Ob2JTMWVUZTBhN3FsbTBJdE1aVnBueUdqSFZnc0thcUpXUGhRSmlLcjFo?=
 =?utf-8?B?bk9zWEtZNTJQZkJ2WlFRY3kvZklDbzVuYjNwV1NMdkM3bDhZdThIVUFxdCt5?=
 =?utf-8?B?K2dIeDBVZW5pMktGRkZmWm5PbW1JZnBLVlI3VUh5TGhiMjVIbmZ1VHlxbFMv?=
 =?utf-8?B?cjRLTVoyeHpsMnJLRTZWdHd6cUhWWlBRUExPaUxUcTZMRGxzQ1NCN05mdUpO?=
 =?utf-8?B?U0Q2ZVJPeXNNTWs4MGIwNDJ2ZDJUZUdoYWttNXRocFR3NFZZRlNaMmU5U2E0?=
 =?utf-8?B?bEdsbmUzeGJDU21NeGJLWHl0YUc4N3l4bHJLV0hrOXkrcEd0SzdKUUFUazlY?=
 =?utf-8?Q?vcZsEiPEWJSrHhmHs7nl9JYgR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bd0025-6f00-436a-6e36-08dd820298c2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 01:03:02.3272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTsRolc7Okx3E9pXSjiBB0rHUkrH/kw1oB5BJmWaYFL1G9JNW194roK+mTAlMZjHb8fASfmwGfqh3GmR9Wu3yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9114

On Wed Apr 23, 2025 at 2:03 AM JST, Danilo Krummrich wrote:
>> Well, that turned out to be an interesting rabbit hole.
>>=20
>> Leveraging the existing traits seems a bit difficult:
>>=20
>> - `ExactSizeIterator` cannot be implemented for adapters that increase t=
he
>>   length of their iterators, because if one of them is already `usize::M=
AX` long
>>   then the size wouldn't be exact anymore. [1]
>>=20
>> - And `TrustedLen` cannot be implemented for adapters that make an itera=
tor
>>   shorter, because if the iterator returns more than `usize::MAX` items =
(i.e.
>>   has an upper bound set to `None`) then the adapter can't predict the a=
ctual
>>   length. [2]
>
> Why is this a problem for the above implementation of Vec::extend()?
>
> I just looked it up and it seems that std [1] does the same thing. Do I m=
iss
> anything?
>
> [1] https://github.com/rust-lang/rust/blob/master/library/alloc/src/vec/s=
pec_extend.rs#L25

The problem I see is that if you try and do something like:

  vec.extend((0..10).into_iter().skip(2));

with the standard library, then the use of `skip` will remove the
`TrustedLen` implementation from the resulting iterator and
`extend_desugared` will be called instead of `extend_trusted`, which
could add some unwanted (and unexpected) overhead.

If we want an implementation of `extend` as simple as "confidently
increase the length of the vector and copy the new items into it, once",
then we need a trait that can be implemented on both shrinking and
extending adapters. Anything else and we might trick the caller into a
code path less efficient than expected (i.e. my original version, which
generates more core even for the obvious cases that are `extend_with`
and `extend_from_slice`). Or if we rely on `TrustedLen` solely in the
kernel, then `extend` could not be called at all with this particular
iterator.

There is also the fact that `TrustedLen` is behind a nightly feature,
which I guess is another obstacle for using it.

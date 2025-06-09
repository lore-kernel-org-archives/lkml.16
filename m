Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDD619F42C;
	Mon,  9 Jun 2025 15:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749482415; cv=fail; b=FtSrUBo2vgbn0OUpbtp9RKEr5S+vk6uNncjPiciLRAxG3usXMTUg71Iul8BURqJBE0IvjdGLw6Wkp5pqH1BEaNpTF74nFFwpxwhLGIQ47dBqm6rFIbAvUz0KBr9i2rkPYvlT4HwE7qTrvrWTDWxA2c8L1NjfAhLe3wgqpoQlefc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749482415; c=relaxed/simple;
	bh=BjB88p8J9MG3yra37zybtxgLUIPUg9WJIaf5+nQ6a5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VSoHJHVdeRsTrJ2Ue86WTeghQgNEEzAa+zC3x/8gyUfPE3YYNW5NS++xKZvwYem/uzHsUkNFVIx22k4UebbsG0AZrg9WtFCmi7AboVVO753fVQnLrojl7d4TsKavq8s7DM0S0A7ApWG+7rRNQwurQJNBCiVwXpS6HNjwEOrqneQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uBfdEddD; arc=fail smtp.client-ip=40.107.236.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uBfdEddD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AP7+VgKuL1a7XNBswD0orL0Rmyfr6HpzP2xuboV2Arxzc6FnZ+XJMYz+B+1dsS3fgUXQQfKMvkpebeyhtRWFQu+Xk5arVsNJv5aVj79b8LkyMWVvy8AmwYVTmO1/hWdHHPNFT6el8oHyWN6JVw4pRwtyuOQPV0VEFcudFWVtrdny/3ZR49kd3UDcxxbyyKL/fAzCim+Fk1jLd/oTx+NotWKp2vd8Bd0olI5ZHCp4N4B6CEd1bmo7+R5cFqRYg4rHoBzhfIK6/xihQ6ENWRYT9YrlwB+Miagpg1ess4EMjfbKyycalF+JJaAFJVwgWy8BbI0F4u6t5NyViqoO1YEcfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdhBMED/RbPeG8wQXOC3ghMx/vNVe3t4gww1vNl+BU0=;
 b=JNsaWU6Go2wxGS1uF6xI8SVDwS8tzvuo4sZ64Bf5dwynOPYIfquA+VYpOOzhVMqr32+aUpH14JFwZcBP4YfwrUUv9vMZZV/7dGmhGMYwtxu3oZ1p646TEpTDcrZJ85PySGpP+t0l1XqHlw11B2I9b5HQkT5KU8oUnII4ncenPHvqHga45YTAEXfnIkHfC/QejHfs4gNDdZG1Ikb3vg3c4sYBJ0wxKXq+UEuGeMaKXq5Qsp+3P4zoaLwj3IFZJlYFKSAX6ZvhAGzrKAhkRwwNWjkbXMcGehNRJC6Fs6DipTiFEwA1EdJm4OMcikcMsBJonr+hl/CQf/V3rIMC9cRnWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdhBMED/RbPeG8wQXOC3ghMx/vNVe3t4gww1vNl+BU0=;
 b=uBfdEddDnWzVDbRfGdW1tPd/LT0Axx1jkMjhH/tvWcBaqfwh8J+ojN1yWvunvv33yKS+PHz5jlvW2HhQ+Ey9hxwl5ew24epguA71fgTGhGcGJnUUa/Nw9MAKMtxVPL4ZtpcQNlNF5sE32lwxdXLG6B4h1bdgyV5p/EDxGT7l9AYR6TsHmvY2oUtJC3Qb3q2GnROk9NVhxTikwNzmZLFhRy6WmHadvxQbHRYTAxkywn7uxkr13LJtxeBJx3aJezcFnQCLrF4AvGrTiAOBhRQtMTGENqiSmDbC6qeYcjAa0UzWDpf9q169QPVJ/kbCEY1Ns+Y9G7Lz+qZxmmzGQS6ItA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Mon, 9 Jun
 2025 15:20:09 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 15:20:08 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Usama Arif <usamaarif642@gmail.com>, david@redhat.com,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, hughd@google.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel-team@meta.com, Juan Yescas <jyescas@google.com>,
 Breno Leitao <leitao@debian.org>
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Date: Mon, 09 Jun 2025 11:20:04 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <AA2C4D68-B1DC-48A6-A807-56516067B9C7@nvidia.com>
In-Reply-To: <61da7d25-f115-4be3-a09f-7696efe7f0ec@lucifer.local>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
 <b807deec-99a9-4691-9001-c2f3adf586b9@gmail.com>
 <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
 <c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com>
 <18BEDC9A-77D2-4E9B-BF5A-90F7C789D535@nvidia.com>
 <5bd47006-a38f-4451-8a74-467ddc5f61e1@gmail.com>
 <0a746461-16f3-4cfb-b1a0-5146c808e354@lucifer.local>
 <B2F966F0-8F5F-43AB-BA33-BD3E65504F4F@nvidia.com>
 <61da7d25-f115-4be3-a09f-7696efe7f0ec@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: CY5PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:930:1c::12) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SN7PR12MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc5e840-ce67-41d5-71ff-08dda7691ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDJ4bTEwSktkTisvY2JsdGpnRDNLbFpycmZLK2gxeDJYTFpZL1MvMng3bmE4?=
 =?utf-8?B?OFA1RFExUWJTbHN3Y21oZFI4a2JPZTdzdml0VWQzR0wwSnFPOGNEQWJla2l1?=
 =?utf-8?B?cjBSNXM5VVBEdi80L1IvdFFSRXRGNVZkUStTemR3cU96UGlMWFB3T01lSG9Z?=
 =?utf-8?B?bkQ3dW9aZnluR0hvaHpmM3ZJbnNRbmYxa1dxL3pRSCt4emJtYURvb1R6Uy9U?=
 =?utf-8?B?eUNZbnBkVVhLSFFKNnJLZTRZVGcvOWZUVGViM2o3M0Q5d28rSUtPamNzM1NJ?=
 =?utf-8?B?WlpyMzM5L3NWZURUWUZHUG1IK2hkTStiUGlIdDZNbjlzblRoZUh3ZUJzSlRN?=
 =?utf-8?B?d0ZDdVJjaFBsbnlGZWlHc1A4enhKU25ob29ZdEJtK1JDS05MQ2FtY3lzbVVK?=
 =?utf-8?B?MHBwVGJvRFQ0blNaaUpvZmhWaWZHaGpMZmRPQTBrUUJZeVVtK0lYTEU0a0FM?=
 =?utf-8?B?WFQ1T0VHODdna1UyMlR4ZzA0NHdOazdKYWNHTnJXOUhzaS9nRlh0VlFpc1FB?=
 =?utf-8?B?czZHMkkrUmgzTGNwTGN5SFBabEZpME9OcHFBU3lVSnh4RXVscFYvLzdmMm1t?=
 =?utf-8?B?MTJ6V0YwT2w3amNrZjFldE5GcFRVWmJjMGlnN08zam9TK1hXaHc0ZnNMbEFM?=
 =?utf-8?B?dUxocWtFYmtzR2ZOREI3MkgvSkQxWGlJZXd1L041SjZwVWhkUmo3QlpDUUtG?=
 =?utf-8?B?RTlYbzNLUTBYWDVSQVJJcXYwOTk0NVp4S3NrYjZGeUVwYjZSTG1QV2lmVDFK?=
 =?utf-8?B?a1NvMFYzcW1HN0ZsbEhsSGtGMTA2V0J2N1hqTWNGeWFySzJCTm9iTzB1T09B?=
 =?utf-8?B?SWhubWNaVTVMallyZ0p3cjd3MzB2YkJYSllFa25URWhxZkR5cUpRNjFnc2ZI?=
 =?utf-8?B?azM1WHhHRU0xc3UvVmg4VExGNkJzWjR5WlFTb2svWnpCeFRrUDRnOXJQbXhq?=
 =?utf-8?B?OS92ZnZBMm5KNTBuektQWlhXNmUwd0FudVBaWFpRNjlyVXZRSlNlZnBFYy9v?=
 =?utf-8?B?TE12c0F2YUorL2R4dXBkbWJUcGNWUXZtcFVldThYRFFZQm5Bai92SUpZWktP?=
 =?utf-8?B?SGZmRFh6bW9oRWpORFlBTGtPT09QbnhvUzJQc3dxRXRYWEQ1S1JFSGlpQnkz?=
 =?utf-8?B?U3VrWnRkSEs3Z3g4amwwWTBtZnFoSDVIRXlpUGpqaUU5eXpXTkhYWFVJQU5P?=
 =?utf-8?B?dmI0dENYOUM0UHd0RjZab1BTbUdzbFFsemRZdGZuYnZ1V1VVMlBicUlMQ0o3?=
 =?utf-8?B?dk53SXMvSjk2alJjUkg2ZkVwOEgxdUVGaEY2eW81ZWdLeG9RdktFN3RqZ0V2?=
 =?utf-8?B?RkJnOXFDS2lBQ29hRFU5SVFuMytrd0xOTWc2RHBYV1dvRlArUUZaMHVUVzBK?=
 =?utf-8?B?b3NkMUpqNkp2U3Z5TlYvb21BZ0cwdmVzN2lKRHZFUDdsTXZlR2NKVFdPWWJR?=
 =?utf-8?B?cXVxSWkvRE5PbGZ2T3l0VmlUWC9iMWRwUGNPM0Y1ZVo2RGlhZVMydElsdXVL?=
 =?utf-8?B?OVZESzFrVk5EcEdaRm5QY05GMlRzbDJlTDlNN2hwWlk0a2NtSEpNMldKdjNs?=
 =?utf-8?B?a3BNNFRaekdKeHhIbXBTZ21yRHdvODZ1eE5TUnhmOFo4S2w1WnI1SGFRNFJt?=
 =?utf-8?B?bzIxaHdVOGF2eVcrSlAvc3dsQUh3YmVjdW1WUUZ5cUZuaHFPRkpxNncxRFNE?=
 =?utf-8?B?QldlUlFvRDBzSG84Mjdzb1ZSYW93MnR4VmJCSUh0ZUxiRTk3Z0VGaGw4cnhD?=
 =?utf-8?B?ZTRxYytJUHQrZ04vLzhvVDQ4ZldpVHRXV0tVRXdmQVhLMmxSVW81ZldBb1d2?=
 =?utf-8?B?MDVUZ0Y3SFBiT2hWV2MyUU5GZXdYc3RhUXl0VXA1aUkyVjhXanc3bENnbFB6?=
 =?utf-8?B?OE1xMkpHTkxSMnhYY09WeGNIbmVtNDJXRVZLVUcvVXNBWDRQQkVHU2dxaHZE?=
 =?utf-8?Q?p+IiSfHsgF0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXE5em1yVFJMNFVidXVaWXdnSmlqRitFSnhkaXoxV25MMXJ3a2wvRHJqTEEy?=
 =?utf-8?B?bHlOdlZzWWptT0FSTVJpaUhiNkhWQ1NJSHVjcXAwY1FBclVOYWRocHR6b0lV?=
 =?utf-8?B?TW5zblNRczJvMlZUdkUwRGtJMHhBOTRCcXJPcDFOaU90Y2Vmd3FVM2FPV3U1?=
 =?utf-8?B?c0tNcVZVT1NOUmZYZ3p6QzJQQkhHRDZBemxjQU4vaGxZWDl1MldXbllXTUEx?=
 =?utf-8?B?akVQNk1oNEFUK3JFUDVxb09UeFhVanhQZllrZmY3aW5adWxCc1NLVnp4QUJ3?=
 =?utf-8?B?VTFPc2ljNGRpTWhma2QyV0ZwWTNaTmZuaHhreDlGaVVkUlNSd3Fjc2p4MFYr?=
 =?utf-8?B?QjFIZEZ6QitlQlJiY3dHOVNTVEhaRENQRGtOSFI4ZHZyL254dUs2MEk5MnEx?=
 =?utf-8?B?OHd6MHpFeS91dTR6dWNrODduQytHdzQzeHRrazFzMldSSVNFWVpVVno3TTk4?=
 =?utf-8?B?bzBpQVVKdC81QjkvMHVrV3RYeDNaWEFDQ2JrQURpc2VJWGoyTU4xc3NaUnZ0?=
 =?utf-8?B?alhhMS9oREFoK0wvOVhPMDVRTUVlTzJJbTlObFE1QTdSRXB3bEpSelJwVXJU?=
 =?utf-8?B?bzBNNTlVQnI0alBtcHNhSGVGOGo3Vjh2cWZMU1dTUkd2VE5JSk5OTlkySTdh?=
 =?utf-8?B?ay92Zm5WR2IrbzcxWE1PRVVoOGJYYXM2OXhRT3Y0K09tbEFKVmZrbnNMY3dz?=
 =?utf-8?B?VSsvWW0rUXpia0hPNHdvK0srYUdFTjlKd3FCZlpDYzdTbjBGRmFPVkFEUEJJ?=
 =?utf-8?B?dDBoK0xBc2hlaXFmRXZXOEdvUE9HNHBIVmpvT04xMUtrUlRKQUVUdkxVdnQy?=
 =?utf-8?B?VksrdG82UmxUcVA3djB0Z000NnJ5OVBQMm42Wm5kMDBOd2tSZzdlU2Q2STVR?=
 =?utf-8?B?MG9nVS85NHdGaitOVUtpcUFKYUVHYjVGUWVnUU5pSWlwVXZ6U2ZjdCtEMXlm?=
 =?utf-8?B?SjBEbXBMTGxpUTh6WVV2OFdjWVBNMHZteE4yNGRxTWFUTGZ5TVA0eGpwU3dl?=
 =?utf-8?B?YUxsRGw2RG1Jemgxb01GRDVtanExUHJVRkFmbUlxQzBrcVl4V0lqeGJtWENp?=
 =?utf-8?B?cWthYmFhK2JOaWtvOEduZDZ1Q3ZoRUtpaW9wd0Q4T1Vtd3c5OUQyMlNiVGh2?=
 =?utf-8?B?UjI0WmdSMW5hbFAvUGpqMEtYMytVZUNNMnhEa0pRL3h1d250c1E5WGJiVE9w?=
 =?utf-8?B?YkJBMWRvNU9CSmxyMVdsM0I1Y1pkNHFxUG9LRTBwWXo4eEtWcDE1R1BLY0Uz?=
 =?utf-8?B?Qk5yTVJaVWY1Z2lEZFRsUEtRY0Nmb1dtREE3ZEdTS01GRG1lYUoxVUg2MExI?=
 =?utf-8?B?c2s1ODgxeUN2MlZlaHp0OG5BS0RuK2xOOEl5aE5yS1QxQjMvRldaZ0R1elpV?=
 =?utf-8?B?OEx3NGZiZDJST0xQM2VYd0gxOWMvcWw4eXl4Qnl5Zm5LY0Z5Q3BhTTUrSXFE?=
 =?utf-8?B?a1BadW9yRjM3VmdCeWVCV0p4ZmNVdjc5UW5RcXRKUEhlU05uSHdJMHV5RGpK?=
 =?utf-8?B?OWExZmcvZVQxWkE4dWM0aFc0OFhldVVjd1BzZEd5Z1ozdXNZOUYvVS9RS2ZC?=
 =?utf-8?B?bkxPK0hkZFVQdG9WTGZhVGxndmtZWG1nUldlQkRDSGxnZWk1dHVySzRjVHhy?=
 =?utf-8?B?eU1uazhkVjh2LzlSZGEzU0JvaHlDNnhySXBtRFI1UTJkREo0bDg0WXE1dDFG?=
 =?utf-8?B?L1ZWMWhIei9rQUJaMlhRQm1RcDFWaGNZbFhqRVF0ZVNMTHUyMEVBYzdFbFNB?=
 =?utf-8?B?QTdEdm1EVnVRcTVBU04zdHhFdDVUNTRTNVFjZ2V1YlRJZWhKc3lmRG9hZTJx?=
 =?utf-8?B?NHpjWGRvb2xmTzBxdjROS2c5djdPclVIMmZiWFJxbFo5emp0dlh6b1VNNS9O?=
 =?utf-8?B?MnpuKzVhMmpGRjB5djN4TVZWdWRiR0VLcHRXUUVlMTcrNjE5NTZFK25YZkZM?=
 =?utf-8?B?UTFzRWZNTEZQQlpWWjdONXE0SFhBbnR1aEdIZzE1ckJBWkszK05YWjNLc25N?=
 =?utf-8?B?NmxpVU9EVVZ3YXk0TllzVEFDaW0zWWdCclZmeitHdUxGWm9zZm51WWJwdkhP?=
 =?utf-8?B?amY1N0o1TFoxS3lPUm40eGZmMnViS29Pb01Dc1B0RGE1ajRTSXpHTFc1aGcx?=
 =?utf-8?Q?pL4s=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc5e840-ce67-41d5-71ff-08dda7691ea4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:20:08.5224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tyQ4vpVJiWWccqT6DgodvMPBPsjBKu+oTc3ULxX5EMPjunAqNMTf3lAfqkBS279C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8769

On 9 Jun 2025, at 10:50, Lorenzo Stoakes wrote:

> On Mon, Jun 09, 2025 at 10:37:26AM -0400, Zi Yan wrote:
>> On 9 Jun 2025, at 10:16, Lorenzo Stoakes wrote:
>>
>>> On Mon, Jun 09, 2025 at 03:11:27PM +0100, Usama Arif wrote:
>
> [snip]
>
>>>> So I guess the question is what should be the next step? The following=
 has been discussed:
>>>>
>>>> - Changing pageblock_order at runtime: This seems unreasonable after Z=
i's explanation above
>>>>   and might have unintended consequences if done at runtime, so a no g=
o?
>>>> - Decouple only watermark calculation and defrag granularity from page=
block order (also from Zi).
>>>>   The decoupling can be done separately. Watermark calculation can be =
decoupled using the
>>>>   approach taken in this RFC. Although max order used by pagecache nee=
ds to be addressed.
>>>>
>>>
>>> I need to catch up with the thread (workload crazy atm), but why isn't =
it
>>> feasible to simply statically adjust the pageblock size?
>>>
>>> The whole point of 'defragmentation' is to _heuristically_ make it less
>>> likely there'll be fragmentation when requesting page blocks.
>>>
>>> And the watermark code is explicitly about providing reserves at a
>>> _pageblock granularity_.
>>>
>>> Why would we want to 'defragment' to 512MB physically contiguous chunks
>>> that we rarely use?
>>>
>>> Since it's all heuristic, it seems reasonable to me to cap it at a sens=
ible
>>> level no?
>>
>> What is a sensible level? 2MB is a good starting point. If we cap pagebl=
ock
>> at 2MB, everyone should be happy at the moment. But if one user wants to
>> allocate 4MB mTHP, they will most likely fail miserably, because pageblo=
ck
>> is 2MB, kernel is OK to have a 2MB MIGRATE_MOVABLE pageblock next to a 2=
MB
>> MGIRATE_UNMOVABLE one, making defragmenting 4MB an impossible job.
>>
>> Defragmentation has two components: 1) pageblock, which has migratetypes
>> to prevent mixing movable and unmovable pages, as a single unmovable pag=
e
>> blocks large free pages from being created; 2) memory compaction granula=
rity,
>> which is the actual work to move pages around and form a large free page=
s.
>> Currently, kernel assumes pageblock size =3D defragmentation granularity=
,
>> but in reality, as long as pageblock size >=3D defragmentation granulari=
ty,
>> memory compaction would still work, but not the other way around. So we
>> need to choose pageblock size carefully to not break memory compaction.
>
> OK I get it - the issue is that compaction itself operations at a pageblo=
ck
> granularity, and once you get so fragmented that compaction is critical t=
o
> defragmentation, you are stuck if the pageblock is not big enough.

Right.

>
> Thing is, 512MB pageblock size for compaction seems insanely inefficient =
in
> itself, and if we're complaining about issues with unavailable reserved
> memory due to crazy PMD size, surely one will encounter the compaction
> process simply failing to succeed/taking forever/causing issues with
> reclaim/higher order folio allocation.

Yep. Initially, we probably never thought PMD THP would be as large as
512MB.

>
> I mean, I don't really know the compaction code _at all_ (ran out of time
> to cover in book ;), but is it all or-nothing? Does it grab a pageblock o=
r
> gives up?

compaction works on one pageblock at a time, trying to migrate in-use pages
within the pageblock away to create a free page for THP allocation.
It assumes PMD THP size is equal to pageblock size. It will keep working
until a PMD THP size free page is created. This is a very high level
description, omitting a lot of details like how to avoid excessive compacti=
on
work, how to reduce compaction latency.

>
> Because it strikes me that a crazy pageblock size would cause really
> serious system issues on that basis alone if that's the case.
>
> And again this leads me back to thinking it should just be the page block
> size _as a whole_ that should be adjusted.
>
> Keep in mind a user can literally reduce the page block size already via
> CONFIG_PAGE_BLOCK_MAX_ORDER.
>
> To me it seems that we should cap it at the highest _reasonable_ mTHP siz=
e
> you can get on a 64KB (i.e. maximum right? RIGHT? :P) base page size
> system.
>
> That way, people _can still get_ super huge PMD sized huge folios up to t=
he
> point of fragmentation.
>
> If we do reduce things this way we should give a config option to allow
> users who truly want collosal PMD sizes with associated
> watermarks/compaction to be able to still have it.
>
> CONFIG_PAGE_BLOCK_HARD_LIMIT_MB or something?

I agree with capping pageblock size at a highest reasonable mTHP size.
In case there is some user relying on this huge PMD THP, making
pageblock a boot time variable might be a little better, since
they do not need to recompile the kernel for their need, assuming
distros will pick something like 2MB as the default pageblock size.

>
> I also question this de-coupling in general (I may be missing somethig
> however!) - the watermark code _very explicitly_ refers to providing
> _pageblocks_ in order to ensure _defragmentation_ right?

Yes. Since without enough free memory (bigger than a PMD THP),
memory compaction will just do useless work.

>
> We would need to absolutely justify why it's suddenly ok to not provide
> page blocks here.
>
> This is very very delicate code we have to be SO careful about.
>
> This is why I am being cautious here :)

Understood. In theory, we can associate watermarks with THP allowed orders
the other way around too, meaning if user lowers vm.min_free_kbytes,
all THP/mTHP sizes bigger than the watermark threshold are disabled
automatically. This could fix the memory compaction issues, but
that might also drive user crazy as they cannot use the THP sizes
they want.

Often, user just ask for an impossible combination: they
want to use all free memory, because they paid for it, and they
want THPs, because they want max performance. When PMD THP is
small like 2MB, the =E2=80=9Cunusable=E2=80=9D free memory is not that noti=
ceable,
but when PMD THP is as large as 512MB, user just cannot unsee it. :)


Best Regards,
Yan, Zi

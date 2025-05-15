Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E793923BF9F
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747270810; cv=fail; b=SG6v6R3ER82RRPJubS4R/irYOiOE0MBpcvJCAxdxWO3ug1OiMCdJj9sGBloR1hyLcREia3ariUmX8i8/wwAnFd0Q0pvYTeCoQ8lfNS8E+FaAvfbY19teexSzf281w7tEq8QiKZ3nCWAZ3rALyhpNioBbm+l5WvrX81SfNSrOeFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747270810; c=relaxed/simple;
	bh=bI4MtyOW7Y4hKhKZPpO3CzfQ8qQhK3vlnzhkfFuTn9s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aXFNqJhz1pGV4VwmxNBzsr+MhTFIYKq00QgNFiibBwyLwEm7sMX+bdzMfJOfrvtnlswOqEYDP7MQdbhsQdGuKIUAbw7PduInoY7jWvzvBsyB9aXI0/emWo7HhTd6TWkvz8FNmeqhHx621+n4WQxT6RzwpTjlC99Vz2Z9X08JdmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZYMI118k; arc=fail smtp.client-ip=40.107.94.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZYMI118k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/Jlk8mw284JfmzH526Dh1Z1ydxBky3XEBXxD6zQDhm2A2aY/hz3AYp5KDiIWn6+rl0R//jfFGmNPpezVe5FnRWpudMhNbdfmYkkBXuVLo/+O9VxgXnHGkRVQlqNNQ4QmHH2riSu/4P6qixkITTUculnGHkq87bmjawpdjYeJQ6QBOfat0cAuPc5t5UzxqRbo4whiQG/eXCpsYecv600HjxUTSSashb4ScG9a0po7LGWO7IEpqo+S2tPr0a9ATgfsP1eLzeWAMIx2yFmbgx1epGY/LvpUl+HZUaYugtZhcG1wPyRjA8owzk4N6ephQu1EFAf6wMAJmqifv3dzdjxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqIwF1hBwN9r9bNiUT6TXPc4JzqzUsLuHZwIudY58Sk=;
 b=uZYOGnZq9KQyDyROK8ZM8ujmhBiqvFYQtQ+2dsl/m57sOosp7I2Mr8qj37pP4K8Zwz8a1inv6iVkEpLYlwknagZ1IdLq35M8mFNFAM4XGPMLOGQ8YdVlH02mUOk7QlPlsrHLo1Y8g1EEhDBmbRTGCSGBWDFO2PN36XCxYYgxTvfyiEc41q0/ZaCD5yB1yzUT38sKU4Sz42WjUuJg3cMfn/rBaAYbPGY5J7i7xVcfMVcNddX1UK0pjphcPidPuWWfxpjQp2QSDOPlvq4wuoWGmH7VOWtjF1bSXVe8oKEYL2E2kt0hu9gQRhhHeFsghjVFLReyL2WkbwxoqOQha6bN7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqIwF1hBwN9r9bNiUT6TXPc4JzqzUsLuHZwIudY58Sk=;
 b=ZYMI118kilg/0qGm7JjSB/M3oHG5IHQESmSjePl/n9/7dHtWCqWJs/xAucfkRjsrhuoQQ9vUHx4Vb+DaRTBi0baI0tq/d9jcVaRfVD4i+0y4cz+C1E/Pzi2ozG+58i0J0X19RC/1HaGN2AqsYDa9JHa7uI7O4r/nCCqP7scJeEbDigb+wopdWo3+ZOBKWXGU5jYL4AjGH844o4Q3tjoVsaQfcomvks1Ar3WTafb3qsQgSZ8980cT3kCDPa4Ro0CiPIrFdxengljoWg8NJrKMgQKF5gz/FhZudz3b4r7VqRkvX27AAx76gXznGHVd/Vs95ubLh7+QmDNbuy4hQOKVXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Thu, 15 May 2025 01:00:05 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 01:00:05 +0000
Message-ID: <1bb359bd-c534-4947-8eb1-6231d6b062f1@nvidia.com>
Date: Wed, 14 May 2025 18:00:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 17/30] x86/resctrl: Move enum resctrl_event_id to
 resctrl.h
To: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20250513171547.15194-1-james.morse@arm.com>
 <20250513171547.15194-18-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250513171547.15194-18-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P221CA0057.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::12) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|DM4PR12MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: b4debc04-d579-40b6-81c3-08dd934bd3a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0RSTnVhT1ZUdi9zb242TFdhbnhuMHFTanBrNFJVYVdrMEpUSHhldFVIRWVh?=
 =?utf-8?B?bTI0MzM4T1NnY3B0M0FJWUJ4MXZYanlSVVhsZjlsWnRVRzB2K3gwOE1sbE14?=
 =?utf-8?B?UWZYTDUvK1BxSjdSQzFobXR1dUdCOHl1ZllxNjgrR1RFUDFOMHQ1WVRpMTNC?=
 =?utf-8?B?alp5VWpXK3JzcXZ0a0hQL3Zzc1hoUGFGanBVTXBza1dmYnRZcmdTYitJQUky?=
 =?utf-8?B?ampXSVMzMXlFYTFEbGU2N1VNdUk3S1pyMFNnelFkVU9uMURBaUZrK0JvM0gy?=
 =?utf-8?B?c0lTSHBTZEJwK3M5K3FBS0Z2Y0ZvZlhSYmFOS1dPSXJnaHg4UXRPZVhLS0JG?=
 =?utf-8?B?cU8yZlIvV1lDRjUzUEpUZW9EQ2dDeUg5UE5nZG5lT25OZ3lXU2JVVXI3Tzcy?=
 =?utf-8?B?WFd5ODNiNGFvdVlhN3l5RU9qdXlsUXdpYWdLTTcrYzd6anNxbGMvSWJsUTh5?=
 =?utf-8?B?Qm9tYWh6QVNTMy9PZFVHZHF2MVUzZStwSlQ2VTB0RFlSK0tKb1MwOFdKa2Ri?=
 =?utf-8?B?NDJnQUVFNmtwK25iRWU1T2lSOHNpWWxqOFVxbWwrNEY5NXZKWER1eFc0Zndv?=
 =?utf-8?B?SVFXenFJdU80V0xHUnVIc3pHc2s0MnZKT1ExeUhVUjNncHRqZW51aXhXaGZT?=
 =?utf-8?B?NFVKc1J3Yi84SHFpaUsrN044TWdwWmxQN1BWV3hmRmRHT3g2QjJRZFIvYjhq?=
 =?utf-8?B?VTNTL2pXTjRSenlISk40WENrc0FxM1cwSmlpdHh0ck1lTnFzaXdITk1HeVM0?=
 =?utf-8?B?ZTAvRDRSUFdnL1BkamRxKytFbTE5VmtkOUpIcGZjUG1UWUNnZkhtYVBQa3JG?=
 =?utf-8?B?MUZXWFFzankwNnZUalhGRXBrMTc4cVVqYXkyUy85SGNnN0FjUG1QSjZJVkd0?=
 =?utf-8?B?Y0h6RTQ4eTFhb1E4SjhSeklOdUIrVjJreFRqeGRrSmR5bzRVN3JPVGloN1ZW?=
 =?utf-8?B?UEJ5dGtiZFJ5b1BuTCtxV1p4OTF3cUZPUFdKRHhFSmtHNzVCM2NndzI4bTVB?=
 =?utf-8?B?NDVsdTRHY1MzTTJPeEpINU9sYmJCMkI2NTdFWmJ4Z29DdVV4dnE4cGVOLzFz?=
 =?utf-8?B?RitmRzVhTURqOEI0NnFqYks1WTNCcGJFRyt0bzhLT0xiOEN1R2o4aDZ0S3BP?=
 =?utf-8?B?NmUyeTduRGltbEFjVUhwNlBLWElZSGEzcVZLMHRSdGJycHNqb3pXcDVqa2l1?=
 =?utf-8?B?YTMzMHZMcHV5NzJFWnBsWXJVam1KOFJMd2pjZ2RhUXh5cUIwbzJsMzRkcWpF?=
 =?utf-8?B?N2Q0MmNBUGV3TzhxOW9sUlVNWVl2cXd1RDZWQUFhUE5NLzhyUFNTemtSUGxB?=
 =?utf-8?B?UUZXZXQ5OTdibitvZkRKU25Lbi9uMXVzTGE2VjBaWHd0Q0xMTG1hRFdQMExt?=
 =?utf-8?B?T2hTdUovYm1RSXZSd0QyczBhK1NpOG9EWHFnSExNTG5XOTNyeG9wcncweXZW?=
 =?utf-8?B?TEF6QVhuSjB5Ty93eDY4Y3JvSXUvT3E1QlRxSnJpRzF1bWZtUnhPZU00TDZU?=
 =?utf-8?B?Yk1RdnlVYmprMmZzNEZmZkNEVkFxdUxxWGNkdmpkTVlOSXJJaGI0eW9KL3ow?=
 =?utf-8?B?akQ5cHMvK1Z4dzVJNjdEbGZsZlJnZEtQWGlGYmpLQUJ1aUVERWZ3ekE5UExK?=
 =?utf-8?B?OUU4S2M2bXVNSjFuUnRBZTJQSkJlaVlTSk9SYmU2TDZpOVhQd1k4SExBcUQw?=
 =?utf-8?B?S0gxbGRsWk51T2RyaGRmUVNnMElTQTd5ZnhFVngrN2IvdVp5VExrTjNoWjhy?=
 =?utf-8?B?T3UzZFlnTDdEZndKYWR5UFMwTnFXZGxBYTBnQzFzclRJN094QVJRK0Z2RHhL?=
 =?utf-8?B?SU1LKzl3RXk3dmRRWWNXd1ZrMmRtZkphcWt3c21ZcVhpK3hPaEF4WFp6OTdp?=
 =?utf-8?B?UEwyeENTSHJFZEVyNlBCUFh5SG54clp6eEF5L2htaEcwd2Vyb3U3RDdleCtp?=
 =?utf-8?Q?7tX9gfuIRMQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWVEM28wN0xPY2d3Rmx5ZWY1all1QzYvV09Wa3o3NFk3cWlaNFN4Y25QZldD?=
 =?utf-8?B?c0tVamZRR0NtTjF6YWp4QmtJcldTaXg3Y1lBa0VpL05QS21LTWNsdUh3WEow?=
 =?utf-8?B?end5YzQwK05KeVdRUEN2cHVQTnB0NnFoT0VnTEdkVHlTM3NpMHhZQzhiMVQ3?=
 =?utf-8?B?Ym8zRnl2dldLSEh0bGlPbWNTZWlaakFzYlFYSW5ka2MyeEtHRCtVR1dZTEQr?=
 =?utf-8?B?cjBaRDdKbkl4ZnZMR0l3SC9zRHpySE5CQWVqaGpHTks3b3lMY21URWovS1dT?=
 =?utf-8?B?aTluUzZYWGFkN2FGYUgzVklTWlhlWUNMVjByQUxIVFU4R1doWWpLc2VUNml5?=
 =?utf-8?B?YlA1YVpnTUV2MnBReDBFY29KRXNKNGJhdUpEbmdDekhybUJ0MlNPUTVCa1Zs?=
 =?utf-8?B?NGJXcUE1QU1jN2JaTFo1Y0pMYi9pWDRpeDlsT2x6S29aNEVRL0JiVHJBeXVR?=
 =?utf-8?B?d3h6d2krN0F6Z1ZZdEFNYjJvZHNKS1RvRUVLdktlWWJXUDdTRTRzRzU3ZWhT?=
 =?utf-8?B?WEtHMWgxRSt0ZTBYcmlReTNEYU9CcG5aamU2V0ozVXZXakN0M0tLcWk0ZDdI?=
 =?utf-8?B?ODE2V3M3M1Y3aEV3MlNHRllSRE0xQkRPa3k2TzhpUXQ4QlVQbkIySlN2K2Fo?=
 =?utf-8?B?VzYyOTJBUDhIRHp5Mk9aSjFQQ3ZPQjl1WEFtR2JnNGc3NHhHeUZvTElSUDJC?=
 =?utf-8?B?NmxaSklwVk1ubTNxL245UXRnSE9hRXBqWmg3TzgxNHRhdG8ya05vb2xrZEkv?=
 =?utf-8?B?Y0RudWJYWm91aFJLZlBnR3M5TUFtdGh5cU5CRUt5QjhQZ0tjZGdiQ3Uwc0Nz?=
 =?utf-8?B?TUdnT0R6V3FwR2VlY1I0ajJaam93UTA0Z2ZjU3dnMU9FSldLb3orakNReXNq?=
 =?utf-8?B?Ry9ZbFRWRXduOWJZZGU3M3MwaVduRXVYLzdkcnZOQTdyZS96OTVadjRPSkFm?=
 =?utf-8?B?WXNlZU5GY1VoL1FreWZ2V0xMUjJOeDBoVlltQlpXTXREamJVNXBiRyt1ZXF2?=
 =?utf-8?B?K1ZWVHRlVFR1VVA1SktiakRoMXlzVmVVTE9YRHJxUE5NZ0JDNm1lWlpzd3I0?=
 =?utf-8?B?RFlwZVlYVlIxUmhmVWZmazF4Y0kxTDEwVnNsTHZLejFpR21oTUhMTDBsT0cy?=
 =?utf-8?B?L1d6ZFFwbTdMYWRSNUVZYmI3bG92aE02eG1LZUkwKzd0ZkpSUTAzajJxRTVp?=
 =?utf-8?B?WUpVcE9QVnBISmpVKzZRMndweUtGWmVqN1N6MlA4UCtGZVU1eGhBTTZud2lM?=
 =?utf-8?B?YkRLMTA0K0lRZnFDVU9pNDNWcnpYNzlveXFTRWpIdkEvN2Q3SmZXbmV1NDhL?=
 =?utf-8?B?T3EwK3NKdWlGZHd2di8yQ0lraE1Xam55NW9DNVZDazBRWHlyVWliUnliWVd5?=
 =?utf-8?B?N1QySmJPTEMydWRGK2RxNlZLY3JkbTNMWldIbENyTnJDeTdJeVlIZWtxUmcy?=
 =?utf-8?B?VGtBRFhtUXRWYUpDNWE1YUh3NURHYkUwMzlod25uamxTZU41eXBOM1VTc0o1?=
 =?utf-8?B?NHUrTFczajJRanhHQkZ4dStqbDg4V1B6UTZBbHVmUDhKdE5RWEdqMUNuNUhK?=
 =?utf-8?B?dkMwVGN0MnRWUm1mQktXc1Y1cW9SMkZCWVR6cmZVd1h2a3d1QWN6NFR4aXE0?=
 =?utf-8?B?S1pNVFFmWTJDQmlZZ2xPZjdCdDVUNlhYdzF6MWg4Y25BTjdIWmloWmx0NlVF?=
 =?utf-8?B?N0xYQXFYYU56VDFCQjJ5WGNCTXFZSG9aWkIzZmRrbzNRc1N0eTZCdDFOQ3lS?=
 =?utf-8?B?NDBLeStyVnBiaVVaejVkZ1RVa2VPNkx4clhKL2FMckZUZ0RaR3NhZTJXTWNr?=
 =?utf-8?B?RE0rUnR5QVVXQVBVb0E0Z1pqZ1RqWTVRazJIR2hjS2pKSnJ1YTB0Sm9oTG9a?=
 =?utf-8?B?cyt3eEx1NnEyUStZbDV5WEJlNmdITElFbHYyTHFHN3l0cTNzcVhhMVV5ZVZx?=
 =?utf-8?B?blg5RjlFQmtBMFFDTk5ieGZ6ZDNaYlBWMjZmWFlWSXN5WitJWlMzeU05K01Y?=
 =?utf-8?B?R2lEMUNoM25NZXByL1BMSys1alRmNUlnKzcvaG44MHdPaFF1UG1ab3l3eDNi?=
 =?utf-8?B?cFVBY2JrNi9LV1FERWN4K0xlZlZOQnMzeFlzVVFYSXdrWE1yQUxOWlZtYW1R?=
 =?utf-8?Q?gRYtTsvWsJHcNN9hJgONbmivh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4debc04-d579-40b6-81c3-08dd934bd3a6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 01:00:04.9720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVFgLu61oeZT/uJgVxPpznAzRkEOd6d3lbqfzDLgOWqP8fRett/ZvItBrjBeU1UU8SdQGclaSoaPbkx8p4a3DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600


On 5/13/25 10:15, James Morse wrote:
> resctrl_types.h contains common types and constants to enable architectures
> to use these types in their definitions within asm/resctrl.h
>
> enum resctrl_event_id was placed in resctrl_types.h for
> resctrl_arch_get_cdp_enabled() and resctrl_arch_set_cdp_enabled(), but
> these two functions are no longer inlined by any architecture.
>
> Move enum resctrl_event_id to resctrl.h
>
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Babu Moger <babu.moger@amd.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

> ---
> Changes since v9:
>   * Replaced commit message with Reinette's version.
>
> Changes since v8:
>   * This patch is new.
> ---
>   include/linux/resctrl.h       | 10 ++++++++++
>   include/linux/resctrl_types.h | 10 ----------
>   2 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index b9d1f2916e9c..5ef972cbf56b 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -48,6 +48,16 @@ int proc_resctrl_show(struct seq_file *m,
>   	for_each_rdt_resource((r))					      \
>   		if ((r)->mon_capable)
>   
> +enum resctrl_res_level {
> +	RDT_RESOURCE_L3,
> +	RDT_RESOURCE_L2,
> +	RDT_RESOURCE_MBA,
> +	RDT_RESOURCE_SMBA,
> +
> +	/* Must be the last */
> +	RDT_NUM_RESOURCES,
> +};
> +
>   /**
>    * enum resctrl_conf_type - The type of configuration.
>    * @CDP_NONE:	No prioritisation, both code and data are controlled or monitored.
> diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
> index a66e7936943e..a25fb9c4070d 100644
> --- a/include/linux/resctrl_types.h
> +++ b/include/linux/resctrl_types.h
> @@ -34,16 +34,6 @@
>   /* Max event bits supported */
>   #define MAX_EVT_CONFIG_BITS		GENMASK(6, 0)
>   
> -enum resctrl_res_level {
> -	RDT_RESOURCE_L3,
> -	RDT_RESOURCE_L2,
> -	RDT_RESOURCE_MBA,
> -	RDT_RESOURCE_SMBA,
> -
> -	/* Must be the last */
> -	RDT_NUM_RESOURCES,
> -};
> -
>   /*
>    * Event IDs, the values match those used to program IA32_QM_EVTSEL before
>    * reading IA32_QM_CTR on RDT systems.

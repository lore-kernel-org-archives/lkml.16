Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011021.outbound.protection.outlook.com [40.107.130.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF299242901
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.21
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682872; cv=fail; b=cl1pxgO0IyThwgqW+lqGOE45BEJvrNteJx6NDmBm3VbOc0z/sH6qfA/4s7n9ETDu3fikGKyes4sRD0QHz0ESpSEZJdYIFMae/vWL0NlB/sxRMQ9MDGPO4Q1FnWn2/z0PPj/fu3Jnoqivaram1lfr6DVmooa6xdXJd0I1cJbr8x8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682872; c=relaxed/simple;
	bh=XikPuIHOJtFWACG296sMoN+LMpyONCRElAwO2IOwLv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SRala3H5mhb6WydC3ZlxiKeTxyFexFNK2UkwUN0cj9As/U6i4hxWmkf/qoNrB6ZDAeyI+NuYataPHxzQgDivr04T4iphwZ1p6oUQV8gmeWZoCnXxTldiQmenfAUzn75g17+9Li4Bsw5Z/dIuQCQhix6n6LqEDu7D/u755Uhz5so=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ej9izi2T; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ej9izi2T; arc=fail smtp.client-ip=40.107.130.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ej9izi2T";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ej9izi2T"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=keqOs24rmgpEFWoU6Yni7MD/KLQC3vWseYA4y30zZsvvp8KvsZEdyFPKH7iv2csh/1gZFaz/P6yVT+LanQnVefS8X1YakbrpTca6S65/SfWxGgLPS46+DNJvJLEkFklh0KJL3CHjbKMK54SUGsoQ3ne9KwLo+uKF7s0h9C4hWZ+eF9Jx0sLqnNhoLqdcHzjWO+Iu2WgBPSDVK7xODiK3VZy1qctKsezd5gSOEyf4bC020fH0ZSXnTLBvcAqAw+wfMR3ThY6BlYJdu2UC42YNI77cRN7XaWpP8hlXCY+Shza9/UnzIIk+77MUT+kU3YQYokgBQ9R5mvYG1eQ8g5CBKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JK+1F9SJbcg3eTD8G/F1LcT1R+teltVREzpXad9EPsg=;
 b=K6KT7tQywlPGbfXwzHoIAAR4Gk7MoNu8D2pXOO6M5RkP9/iPZhmFuWCLft/eUPFSxlGH/zg4Fl0u6+4GXxjdcAczC73evnOMBIipEP6XwWSakqyrt6GgvG0pRMCPV1TdfqPnrGwBTqgWVhUQ8VaDvWld0ySXbNvLndPP4px+LY63Q0AZht76f561M5gvvHpfbPi0+p04dTIfm0Qe06kIX98AZI0QHAViZDmw5qQhoKX6QTbOvF+B7caxPtgBkrOGQeVXHfIL46KvkyzlEhj2YErB6hJL482aBPGRAykXkpgGEeAZLOmyUOiC4fSdQefbJUy8wxxTsY1FBF/KSAt68w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=huawei.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JK+1F9SJbcg3eTD8G/F1LcT1R+teltVREzpXad9EPsg=;
 b=ej9izi2TMPmz3eUbJzNxUw+3aSSB5LBXKN9j9Fh3DyBUi5h0tjqfIwZql7D3DAeo5f32+ip+z+x96lAVWgVJBacD7g7xv60m2eKidkvn9QknRFGegjpZpvIskkg6BGLsU2PI7NhRw5sTFnALLOVPoveXsgOGbwX+B5lRPX0rQLQ=
Received: from AM0PR06CA0136.eurprd06.prod.outlook.com (2603:10a6:208:ab::41)
 by DU0PR08MB7834.eurprd08.prod.outlook.com (2603:10a6:10:3b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 12:21:02 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:208:ab:cafe::b8) by AM0PR06CA0136.outlook.office365.com
 (2603:10a6:208:ab::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.26 via Frontend Transport; Thu,
 3 Apr 2025 12:21:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Thu, 3 Apr 2025 12:21:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8QgMrhmztFNG9ZLiwdu2YWbpJvjH+QSmp44xg4uumNMEQzccotsAv+ymB+eFCZctYsQyzxKy0iZbTfHieZSW0U/2uql0Ha+aKKHezTpe6iviLyf3/Edsgwl5g6Qzzba0S7kOCdoSwcQQKrQYrwmvkWsruFL9i2uSQTRFp6tMjhNsXbpqVrb8xGBL84DqBOVe73ke5yvgjJlDAkciJFe9OHtS1Z8Cxdr7Dj7mzsxRLvGVV3UZTHAG5AAL5WamVnkjFsBZErmsp0fXdIRLTl17fo6Et0DMAcyn18btyfUOsDJmRQrZnPcWcfHyXI5G8mjCWCMVXGRB4Y2MtfrZB9tYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JK+1F9SJbcg3eTD8G/F1LcT1R+teltVREzpXad9EPsg=;
 b=iOULv7nT/bYu6pmfxuSpo4TzQjxJhp+rP1nu+aAYcBoGAafz5h9/i4D7zX18O/U4W2mAToTi2yRDg/ltwE8Ajc/Y2yWixDYztNmQhvyCIupFH/oJDE6tev+yPxIuEnW2razt83VgotLr//uvw6U094xvjHlCiJ4VJ4vC1rbDT8qMy7vmA+38cS/CyzviM8pe0n/S38sayxuARNcZUWDZOnV3rVgpG30m2PhKafToGGXUhiMyADBws/EK1LZ3CwlUeG8fbO9yJ4z/4ZQOt37P7pnfzEyebKr3i0mIIuQqog7W91BhVHZF6g/dQ/IB6gq0WNAEBbepfMh3UBCv9+/gzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JK+1F9SJbcg3eTD8G/F1LcT1R+teltVREzpXad9EPsg=;
 b=ej9izi2TMPmz3eUbJzNxUw+3aSSB5LBXKN9j9Fh3DyBUi5h0tjqfIwZql7D3DAeo5f32+ip+z+x96lAVWgVJBacD7g7xv60m2eKidkvn9QknRFGegjpZpvIskkg6BGLsU2PI7NhRw5sTFnALLOVPoveXsgOGbwX+B5lRPX0rQLQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAXPR08MB6461.eurprd08.prod.outlook.com
 (2603:10a6:102:153::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 12:20:30 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 12:20:29 +0000
Date: Thu, 3 Apr 2025 13:20:27 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Qinxin Xia <xiaqinxin@huawei.com>
Cc: yangyicong@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	naveen.n.rao@linux.ibm.com, anil.s.keshavamurthy@intel.com,
	davem@davemloft.net, mhiramat@kernel.org, linuxarm@huawei.com,
	linux-kernel@vger.kernel.org, fanghao11@huawei.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com,
	jonathan.cameron@huawei.com
Subject: Re: [PATCH v7] arm64: kprobe: Enable OPTPROBE for arm64
Message-ID: <Z+59CzngNTKGSuwH@e129823.arm.com>
References: <20250216070044.1792872-1-xiaqinxin@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250216070044.1792872-1-xiaqinxin@huawei.com>
X-ClientProxiedBy: LO2P265CA0274.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::22) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|PAXPR08MB6461:EE_|AMS0EPF0000019C:EE_|DU0PR08MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 15399b2e-e449-4f9c-20bc-08dd72a9ffe6
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UTMra3RPc0poczRJcWo2NEVoREJ6Y3hzdTV6N005L0NjemJ4OXJ6Skk1NG43?=
 =?utf-8?B?MERzb3lRemRKY0poNVlwanVmQkJMOE1mRE9UWDBKVnROV0FYMFRvRHFxdSs0?=
 =?utf-8?B?WHFrOElmZXQzVEd1ZWlBbER2Q3QvOTlnc1IrOGwyOFN6dlBPY3F0MWdOaU01?=
 =?utf-8?B?NE1zMEJnVXJwSHU5MFFjemNveUpST2Zwb01BMzJOeDR3MUFtVHpyQnQ1ZFlR?=
 =?utf-8?B?dG5DK3o4LzZjMmRPcHljUmxUMGUyZzlXMHhQWWR3SVBNRU8yVmRmMXpNcUo5?=
 =?utf-8?B?ejFUemFmVE01QkN2K1hjN01uNjM0S3ByeTJ0WlRiVlFySGF5dXAvSUh2ZVpS?=
 =?utf-8?B?RUtWUlRrRzVUT0FtM1hXbmtsVGhXQkNNT09SVDBxUi9WamhKbmVmNm9PU3FP?=
 =?utf-8?B?N093TG9tWDgxeU82d2cvWExQUys2UHBRVDZTTDVhTGtwTDN6ZjcxdllzckM0?=
 =?utf-8?B?OEV2QVRWT3NIVWE3T2VERVhBUzN5KzltOUlwdVJEdE1GRWxHMU84Nm4vbnlP?=
 =?utf-8?B?YlE4TU56RWI5SzNCNWw0Ty9pNTJTS05Jc1BQblVMcTl2Yi92SXI3ZkI3UHY5?=
 =?utf-8?B?UFo3Yjd0VU9yTDRNSW9vRElYczRrMGYwN0pQTzlaaWJKQ3RWUEI3V21rKzhY?=
 =?utf-8?B?dXV5QlB6cC9Bd0hLaENkRFFObHJla1B0MFdtdGRSOTJHbXFWUFlZU0FORkJW?=
 =?utf-8?B?U0dkRTc4bWFaYjN0bUNZTE9kWUNCdnlnbDROVkV4YlJRdUFhcmNUbnF0bjFV?=
 =?utf-8?B?bGxLYUdadzlwMW1IcXJsVVdBNmpqVWlZcXhidEw3LzVhcXRFa3FxRFp0bkI2?=
 =?utf-8?B?T3hkbUFaK3M3WDJGOWJVYnNkZjV6aitZK3RrQzJidlRMRWJzV2crQmtkN3VF?=
 =?utf-8?B?T0pDVzFuN0ozTThQOEhCZ3ZLY1NzVjRPNW9aMFhkSE9md0hqVTJFVG5NU1Vz?=
 =?utf-8?B?YzJQUklaTDE1S0tmb1YzUExTYUNUQ0xMcFhLVDNkNUtGQlVTQldPbnpPZlNz?=
 =?utf-8?B?NUNtRUY2U0lHSG93ZUNRY1g5QjRRMllGSkxRVjV5cE03R1ZEN0VxR3JmNkhE?=
 =?utf-8?B?SG1XN2IyM1daNEdGVHB0b0V3UEtkMmltbDRZNWhUNk5aSkVIWDlHVm1WeWgy?=
 =?utf-8?B?dVdraFkvcDI3UC9KOFhzcUxENzE5WnhGNHozVmRncmpsY3Brd1Zycy85U09V?=
 =?utf-8?B?czBIQkN5RXJBaVh4V3JKbTVMclBJNHFPMnY5cERWWTFqNnY4ZUpWTzNGVkdx?=
 =?utf-8?B?UW1ibldXNDVNK3N4aDdxbUtESHpXUGFHRkd6ODl5dGJreE9abGdqblBObTNv?=
 =?utf-8?B?QW03b1dKeUpOS2FPa1g5RlhXdmp2TW5MajkwMWxxemdoNEloNjhwNVEyWXh6?=
 =?utf-8?B?aTZvYkZCZ3pna1B6d3FEamdMU2ZHMjhseEErYnpsZ1AxT1BMb1UxRHg3WFJ1?=
 =?utf-8?B?QlRtdXoxMGFwVlk4V1QrZkhRaXpUd2tYMlF0cndhUzBqNXVBcE8wMS8vdGxX?=
 =?utf-8?B?ZEJoZ1pqQjdyQjU5ZHhQVUd5YnVPbDFyTmZ1RHJBRTZGUGUreEJ3UmFpWjVx?=
 =?utf-8?B?V1l0TVZUNndnUE0wNDhJdGVhRXNmM3A0Y25qejdQdkZINk51ZmM2QXhTbWtP?=
 =?utf-8?B?eUlwcCttWjJOOUphUE96K1pVT0ZHRGZIdUMwK2h5YjAzdjJFV05XN0V2YkJR?=
 =?utf-8?B?aERCTkdGQW5zUjlKcG5MMG4vQWNMdGJjR25rUTl6Z2YyOEt0N0VzUk1UMHJn?=
 =?utf-8?B?dFJic0tvZWdMNUQ1ekhjajNrN29hZ2JJZ3QwbnVVZ3kzalJ3WElSRVRkSWha?=
 =?utf-8?B?SG41TjVES0VtemJUbjYxL24vOUFob0JUWGVzUVVydTFnbkt5OFNVT0ltRk44?=
 =?utf-8?B?aUVFNFdBbVQvdXJ1eTBoK1VPTWdvT2VGdVJOYjdIbHdzOGpKaDFrTHo5UVhh?=
 =?utf-8?Q?WZeVMRPkMu0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6461
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bf50961c-396d-4ba9-7454-08dd72a9ec34
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|7416014|1800799024|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXNITXNZR1RZTUprTnNoeFlZVVVMcVBNdHlLQjlnQmFCTnFSQWc0MnhZaFow?=
 =?utf-8?B?V1Axd05xQzlxZXRpTE0wSEVtRUtCQWJYMlM3UEdtekY3cnhMd004T2FzR2xn?=
 =?utf-8?B?ekJKNHM3RitldWlnRzRYcWVBQS9Nano4MUl3eFFHOTdCOG5qUmNrd0F1UWg3?=
 =?utf-8?B?N1czWUg1bDVsZG9MZGp5QUxkSUJRVzJEdjRGcjhFMHFROEFwaTRVS3VQUm5w?=
 =?utf-8?B?cEJQRmFYWmJEbWJJeVp1eVJ5eldsT2RFc2RqMFNLbEdOUnN4b0dQOXJFMWVt?=
 =?utf-8?B?Vm1EUnFhV0JzQWJMV0x2V1I4ODVwSVVyM1lRZUhYQkdxTU5XOFl5MlBhT2c5?=
 =?utf-8?B?ZWdpKys2bVpINWxURFFtRFFuWUEwc3lZWUpYTFpoOEdPWW1DcXl5cmJFRFZX?=
 =?utf-8?B?c3YwLzV5bFAxcllWSllzMHVMVUpBZjJmZHQ3VHlqL3hsN2djc0VMcmNMVlRr?=
 =?utf-8?B?V2hncDBzb2t0WGxmbHFtYXhzZ1NQWFJ3OFF0SUx1dmVERWpTRk1hNHViNTFC?=
 =?utf-8?B?Z3NBS01HOWVsSVlHMjhIT3Nqd1ZQRVpHWEJPQ2xLL2JiUHBQRFc3TDRGRzI0?=
 =?utf-8?B?WHZibkpQb1ZtY1p5NzMwd25BM0NaVVhhWUR5SThuUGhWMUY2QmhrVkZYc2dD?=
 =?utf-8?B?U0dXSW9zZ0dnS3pEOFliTnZnS3Z6SnRWangvOWtvS3FVN3pOUXNSL0paRGgx?=
 =?utf-8?B?MXJrK0wrN3M3TEdKdWZYc0dhaTROWEpXZ3l1Yk05NlRRQ24xdjg0c2F6Ry9u?=
 =?utf-8?B?MmxmTzVIZ0RqSkNGSVhkTFBIOWdXV3QyK09jSXBUWWxVTGJhVDBCd1A3QTA3?=
 =?utf-8?B?VTRTZVlrOFhFMzVIWkpyQ2NOODllWDRJRkJvcTJFcUlvNGxjZTRJaTljV0E5?=
 =?utf-8?B?b29zSStFRUYxdUVDNjlxZDIvUHp6b20yMEpCbkp5MUZXWityNUl2STI5bllO?=
 =?utf-8?B?OG1mZzhaOXZQRmo5MVNmL1FJbGxHdGx3YmJOc0tqc0lCR2VKcFExK1FRT3Ux?=
 =?utf-8?B?ZzlIOHNVL3pvdjVnd2owUnVhTHdsMW5LVVF5VkZUa2diSmdaRWk0K1BYUEVx?=
 =?utf-8?B?djJnVXI2MzgrL3dpK1lGb3dueVp1OVhIYWYyQ2RKN2MxOVMxTW9ncWlKVkNz?=
 =?utf-8?B?eFJ5a1pWNE1BT25KNTR6d0NROVdaRXNTNjA2ejhmdENhbzdSWFhIbU9GU1Vs?=
 =?utf-8?B?OVBuanYwSFRDWXdVK2ZEOHJBWnU3VW1Eby9YVW5kbTBLZHdlL0VVd2RUMHV4?=
 =?utf-8?B?NEdlcm8zOVlTQVlTVUt2VTNZSDRxWkxQZ0ZSdjMvUzRFUmF3dzhqTnhkQzZp?=
 =?utf-8?B?RndUbVUxK251RjFUc2o1K0dCekJydDVZNVdtNmU1dTlwTnE1MS92YnV3T2Vt?=
 =?utf-8?B?M2wvVTQ4MjJLNnhJZGNyMWJlNXV2dHFQM0M4TndISUVKVWJsUE5NcUNqdW5z?=
 =?utf-8?B?QXhOaEpZdisxWnQwTjVza0JCcHBadmNBQU9qcDdOM1JhUkloV3JYZ0N5c2JL?=
 =?utf-8?B?c0RmRXo0NVNYT1A0YVc0NGFtT2FsWkdHNE1FOStlejBudzh5Z0pFM3hySHZG?=
 =?utf-8?B?S0N4TVNEWUdlMjNvTi9TNFZGeThsSU9JMjVrTklGa1M3WThLMGxQeit3UjJ5?=
 =?utf-8?B?R1dsSU0vdmNWYlBJdkQyQXlqM2pQMTBqTEdsbERJWW1JdzhoOVdNN2pWbHFI?=
 =?utf-8?B?bFQ4T0NFamxEbDRmY2N5b1lock5GUTBqci9jcUMzblJEZUtzU1FVczBoZFBm?=
 =?utf-8?B?dGNrZmV4bnlZV1NOV21jcFNBOUpCQkJqaVc4bjBpL2MyMzdyeERYbW5NSHNj?=
 =?utf-8?B?RUYvam1jVU1LOGl1VzhrZjI5dXU0QkI2ZzN4Z0hSSkpZbUtudHhBM2FUZmc2?=
 =?utf-8?B?RnZQOFhKWnFUdjNGZlV3VVFwN0ZYRmpFbmt2RGdCMlg1VDlwSFBFSGVMZzN3?=
 =?utf-8?B?TjZ5TkdIK25GS1RXVFdVRyswTFpFbGtJenl0UXY4NlJ4RzdNeTJhYlZRZUs2?=
 =?utf-8?B?S3g4TTQwME50NjRBcW0wZ0hydlZ4cEcrOVJQOUx4TDlXREtXc2FFNDBPRWJL?=
 =?utf-8?B?N2NWY3lWUVVIUW5Td1gzOThFOWJoTU1uSzhsQT09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(1800799024)(14060799003)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 12:21:02.3852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15399b2e-e449-4f9c-20bc-08dd72a9ffe6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7834

Hi,

> This patch introduce optprobe for ARM64. In optprobe, probed
> instruction is replaced by a branch instruction to trampoline.
>
> Performance of optprobe on Hip08 platform is test using kprobe
> example module to analyze the latency of a kernel function,
> and here is the result:
>
> common kprobe:
> [280709.846380] do_empty returned 0 and took 1530 ns to execute
> [280709.852057] do_empty returned 0 and took 550 ns to execute
> [280709.857631] do_empty returned 0 and took 440 ns to execute
> [280709.863215] do_empty returned 0 and took 380 ns to execute
> [280709.868787] do_empty returned 0 and took 360 ns to execute
> [280709.874362] do_empty returned 0 and took 340 ns to execute
> [280709.879936] do_empty returned 0 and took 320 ns to execute
> [280709.885505] do_empty returned 0 and took 300 ns to execute
> [280709.891075] do_empty returned 0 and took 280 ns to execute
> [280709.896646] do_empty returned 0 and took 290 ns to execute
>
> optprobe:
> [ 2965.964572] do_empty returned 0 and took 90 ns to execute
> [ 2965.969952] do_empty returned 0 and took 80 ns to execute
> [ 2965.975332] do_empty returned 0 and took 70 ns to execute
> [ 2965.980714] do_empty returned 0 and took 60 ns to execute
> [ 2965.986128] do_empty returned 0 and took 80 ns to execute
> [ 2965.991507] do_empty returned 0 and took 70 ns to execute
> [ 2965.996884] do_empty returned 0 and took 70 ns to execute
> [ 2966.002262] do_empty returned 0 and took 80 ns to execute
> [ 2966.007642] do_empty returned 0 and took 70 ns to execute
> [ 2966.013020] do_empty returned 0 and took 70 ns to execute
> [ 2966.018400] do_empty returned 0 and took 70 ns to execute
>
> As the result shows, optprobe can greatly reduce the latency. Big
> latency of common kprobe will significantly impact the real result
> while doing performance analysis or debugging performance issues
> in lab, so optprobe is useful in this scenario.
>
> The trampoline design is illustrated in the following diagram.
> Some commands will be replaced in arch_prepare_optimized_kprobe.
> +------------------optprobe_template_entry---------------------+
> |- Saving stacks and registers                                 |
> |- Loading params for callback                                 |
> +------------------optprobe_template_common--------------------+
> |- nop                                                         |
> |(replaced to the branch jump to optprobe_common)              |
> |- Restore stacks and registers                                |
> +-------------optprobe_template_restore_orig_insn--------------+
> |- nop                                                         |
> |(replaced to the kprobe->opcode)                              |
> +----------------optprobe_template_restore_end-----------------+
> |- nop                                                         |
> |(replaced to next address of the probe point)                 |
> +------------------optprobe_template_val-----------------------+
> |- 0 (two 32-bit words)                                        |
> |(replaced to params for optprobe_optimized_callback)          |
> +-----------------optprobe_template_orig_addr------------------+
> |- 0 (two 32-bit words)                                        |
> |(replaced to origin probe point address)                      |
> +-------------------optprobe_template_end----------------------+
> |- nop                                                         |
> +--------------------------------------------------------------+
>
> Co-developed-by: Qi Liu <liuqi115@huawei.com>
> Signed-off-by: Qi Liu <liuqi115@huawei.com>
> Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
> ---
>
> Changes since V6:
> - Address the comments from Masami, add design of optprobe trampoline in commit.
> - Address the comments from Yicong, add nop in optprobe_template_end and move
> optprobe_optimized_callback from framework to arch.
> - Link: https://lore.kernel.org/lkml/20250103012753.66988-1-xiaqinxin@huawei.com/
>
> Changes since V5:
> - Address the comments from Masami, saves stack frames to obtain correct backtrace
> and make an array of usage flags to manage the reserved OPT_SLOT_SIZE.
> - Link: https://lore.kernel.org/lkml/20211207124002.59877-1-liuqi115@huawei.com/
>
> Changes since V4:
> - Address the comments from Masami, update arch_prepare_optimized_kprobe，
> if the probe address is out of limit return -ERANGE.
> - Link: https://lore.kernel.org/lkml/20210818073336.59678-1-liuqi115@huawei.com/
>
> Changes since V3:
> - Address the comments from Masami, reduce the number of aarch64_insn_patch_text
> in arch_optimize_kprobes() and arch_unoptimize_kprobes().
> - Link: https://lore.kernel.org/lkml/20210810055330.18924-1-liuqi115@huawei.com/
>
> Changes since V2:
> - Address the comments from Masami, prepare another writable buffer in
> arch_prepare_optimized_kprobe()and build the trampoline code on it.
> - Address the comments from Amit, move save_all_base_regs and
> restore_all_base_regs to <asm/assembler.h>, as these two macros are reused
> in optprobe.
> - Link: https://lore.kernel.org/lkml/20210804060209.95817-1-liuqi115@huawei.com/
>
> Changes since V1:
> - Address the comments from Masami, checks for all branch instructions, and
> use aarch64_insn_patch_text_nosync() instead of aarch64_insn_patch_text()
> in each probe.
> - Link: https://lore.kernel.org/lkml/20210719122417.10355-1-liuqi115@huawei.com/
> ---
>  arch/arm64/Kconfig                            |   1 +
>  arch/arm64/include/asm/kprobes.h              |  22 ++
>  arch/arm64/kernel/probes/Makefile             |   2 +
>  arch/arm64/kernel/probes/opt_arm64.c          | 244 ++++++++++++++++++
>  .../arm64/kernel/probes/optprobe_trampoline.S | 113 ++++++++
>  5 files changed, 382 insertions(+)
>  create mode 100644 arch/arm64/kernel/probes/opt_arm64.c
>  create mode 100644 arch/arm64/kernel/probes/optprobe_trampoline.S
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 100570a048c5..f9c4e2625595 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -244,6 +244,7 @@ config ARM64
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select HAVE_KPROBES
>  	select HAVE_KRETPROBES
> +	select HAVE_OPTPROBES
>  	select HAVE_GENERIC_VDSO
>  	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
>  	select IRQ_DOMAIN
> diff --git a/arch/arm64/include/asm/kprobes.h b/arch/arm64/include/asm/kprobes.h
> index be7a3680dadf..bd4973bfb58d 100644
> --- a/arch/arm64/include/asm/kprobes.h
> +++ b/arch/arm64/include/asm/kprobes.h
> @@ -37,6 +37,28 @@ struct kprobe_ctlblk {
>
>  void arch_remove_kprobe(struct kprobe *);
>  int kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr);
> +
> +struct arch_optimized_insn {
> +	kprobe_opcode_t orig_insn[1];
> +	kprobe_opcode_t *trampoline;
> +};
> +
> +#define MAX_OPTIMIZED_LENGTH	sizeof(kprobe_opcode_t)
> +#define MAX_OPTINSN_SIZE                                                       \
> +	((unsigned long)optprobe_template_end - (unsigned long)optprobe_template_entry)
> +
> +extern __visible kprobe_opcode_t optprobe_template_entry[];
> +extern __visible kprobe_opcode_t optprobe_template_val[];
> +extern __visible kprobe_opcode_t optprobe_template_orig_addr[];
> +extern __visible kprobe_opcode_t optprobe_template_common[];
> +extern __visible kprobe_opcode_t optprobe_template_end[];
> +extern __visible kprobe_opcode_t optprobe_template_restore_begin[];
> +extern __visible kprobe_opcode_t optprobe_template_restore_orig_insn[];
> +extern __visible kprobe_opcode_t optprobe_template_restore_end[];
> +extern __visible kprobe_opcode_t optinsn_slot[];
> +
> +void optprobe_common(void);
> +
>  void __kretprobe_trampoline(void);
>  void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
>
> diff --git a/arch/arm64/kernel/probes/Makefile b/arch/arm64/kernel/probes/Makefile
> index 8e4be92e25b1..7b2885b23ff6 100644
> --- a/arch/arm64/kernel/probes/Makefile
> +++ b/arch/arm64/kernel/probes/Makefile
> @@ -4,3 +4,5 @@ obj-$(CONFIG_KPROBES)		+= kprobes.o decode-insn.o	\
>  				   simulate-insn.o
>  obj-$(CONFIG_UPROBES)		+= uprobes.o decode-insn.o	\
>  				   simulate-insn.o
> +obj-$(CONFIG_OPTPROBES)	+= opt_arm64.o			\
> +				   optprobe_trampoline.o
> diff --git a/arch/arm64/kernel/probes/opt_arm64.c b/arch/arm64/kernel/probes/opt_arm64.c
> new file mode 100644
> index 000000000000..a7f34ab82a2f
> --- /dev/null
> +++ b/arch/arm64/kernel/probes/opt_arm64.c
> @@ -0,0 +1,244 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Code for Kernel probes Jump optimization.
> + *
> + * Copyright (C) 2025 HiSilicon Limited
> + */
> +
> +#include <linux/jump_label.h>
> +#include <linux/kprobes.h>
> +#include <linux/wordpart.h>
> +
> +#include <asm/cacheflush.h>
> +#include <asm/compiler.h>
> +#include <asm/insn.h>
> +#include <asm/kprobes.h>
> +#include <asm/text-patching.h>
> +
> +#define OPTPROBE_BATCH_SIZE 64
> +
> +#define TMPL_VAL_IDX \
> +	(optprobe_template_val - optprobe_template_entry)
> +#define TMPL_ORIGN_ADDR \
> +	(optprobe_template_orig_addr - optprobe_template_entry)
> +#define TMPL_CALL_COMMON \
> +	(optprobe_template_common - optprobe_template_entry)
> +#define TMPL_RESTORE_ORIGN_INSN \
> +	(optprobe_template_restore_orig_insn - optprobe_template_entry)
> +#define TMPL_RESTORE_END \
> +	(optprobe_template_restore_end - optprobe_template_entry)
> +
> +#define OPT_SLOT_SIZE			65536
> +#define OPT_INSN_PAGES			(OPT_SLOT_SIZE / PAGE_SIZE)
> +
> +static bool insn_page_in_use[OPT_INSN_PAGES];
> +
> +void *alloc_optinsn_page(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < OPT_INSN_PAGES; i++) {
> +		if (!insn_page_in_use[i]) {
> +			insn_page_in_use[i] = true;
> +			return (void *)((unsigned long)optinsn_slot + PAGE_SIZE * i);
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +void free_optinsn_page(void *page)
> +{
> +	unsigned long idx = (unsigned long)page - (unsigned long)optinsn_slot;
> +
> +	WARN_ONCE(idx & (PAGE_SIZE - 1), "Invalid idx with wrong align\n");
> +	idx >>= PAGE_SHIFT;
> +	if (WARN_ONCE(idx >= OPT_INSN_PAGES, "Invalid idx with wrong size\n"))
> +		return;
> +	insn_page_in_use[idx] = false;
> +}
> +
> +/*
> + * In ARM ISA, kprobe opt always replace one instruction (4 bytes
> + * aligned and 4 bytes long). It is impossible to encounter another
> + * kprobe in the address range. So always return 0.
> + */
> +int arch_check_optimized_kprobe(struct optimized_kprobe *op)
> +{
> +	return 0;
> +}
> +
> +int arch_prepared_optinsn(struct arch_optimized_insn *optinsn)
> +{
> +	return optinsn->trampoline != NULL;
> +}
> +
> +int arch_within_optimized_kprobe(struct optimized_kprobe *op, kprobe_opcode_t *addr)
> +{
> +	return op->kp.addr == addr;
> +}
> +
> +static int optprobe_check_branch_limit(unsigned long pc, unsigned long addr)
> +{
> +	long offset;
> +
> +	if ((pc & 0x3) || (addr & 0x3))
> +		return -ERANGE;
> +
> +	offset = (long)addr - (long)pc;
> +	if (offset < -SZ_128M || offset >= SZ_128M)
> +		return -ERANGE;
> +
> +	return 0;
> +}
> +
> +int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *orig)
> +{
> +	kprobe_opcode_t *code, *buf;
> +	int ret = -ENOMEM;
> +	u32 insn;
> +	int i;
> +
> +	buf = kzalloc(MAX_OPTINSN_SIZE, GFP_KERNEL);
> +	if (!buf)
> +		return ret;
> +
> +	code = get_optinsn_slot();
> +	if (!code)
> +		goto out;
> +
> +	if (optprobe_check_branch_limit((unsigned long)code, (unsigned long)orig->addr + 8)) {
> +		ret = -ERANGE;
> +		goto error;
> +	}

Nit: according to origin opcode, it wouldn't work properly
as typical example is adrp. See the arm_probe_decode_insn().

> +
> +	memcpy(buf, optprobe_template_entry, MAX_OPTINSN_SIZE);
> +
> +	insn = aarch64_insn_gen_branch_imm((unsigned long)&code[TMPL_CALL_COMMON],
> +					   (unsigned long)&optprobe_common,
> +					   AARCH64_INSN_BRANCH_LINK);
> +	if (insn == AARCH64_BREAK_FAULT) {
> +		ret = -ERANGE;
> +		goto error;
> +	}
> +
> +	buf[TMPL_CALL_COMMON] = insn;
> +
> +	insn = aarch64_insn_gen_branch_imm((unsigned long)&code[TMPL_RESTORE_END],
> +					   (unsigned long)(op->kp.addr + 1),
> +					   AARCH64_INSN_BRANCH_NOLINK);
> +	if (insn == AARCH64_BREAK_FAULT) {
> +		ret = -ERANGE;
> +		goto error;
> +	}
> +
> +	buf[TMPL_RESTORE_END] = insn;
> +
> +	buf[TMPL_VAL_IDX] = cpu_to_le32(lower_32_bits((unsigned long)op));
> +	buf[TMPL_VAL_IDX + 1] = cpu_to_le32(upper_32_bits((unsigned long)op));
> +	buf[TMPL_ORIGN_ADDR] = cpu_to_le32(lower_32_bits((unsigned long)orig->addr));
> +	buf[TMPL_ORIGN_ADDR + 1] = cpu_to_le32(upper_32_bits((unsigned long)orig->addr));
> +
> +	buf[TMPL_RESTORE_ORIGN_INSN] = orig->opcode;
> +
> +	/* Setup template */
> +	for (i = 0; i < MAX_OPTINSN_SIZE / MAX_OPTIMIZED_LENGTH; i++)
> +		aarch64_insn_patch_text_nosync(code + i, buf[i]);
> +
> +	flush_icache_range((unsigned long)code, (unsigned long)(&code[TMPL_VAL_IDX]));
> +	/* Set op->optinsn.trampoline means prepared. */
> +	op->optinsn.trampoline = code;
> +
> +	return 0;
> +error:
> +	free_optinsn_slot(code, 0);
> +
> +out:
> +	kfree(buf);
> +	return ret;
> +}
> +
> +void arch_optimize_kprobes(struct list_head *oplist)
> +{
> +	struct optimized_kprobe *op, *tmp;
> +	kprobe_opcode_t insns[OPTPROBE_BATCH_SIZE];
> +	void *addrs[OPTPROBE_BATCH_SIZE];
> +	int i = 0;
> +
> +	list_for_each_entry_safe(op, tmp, oplist, list) {
> +		WARN_ON(kprobe_disabled(&op->kp));
> +
> +		/*
> +		 * Backup instructions which will be replaced
> +		 * by jump address
> +		 */
> +		memcpy(op->optinsn.orig_insn, op->kp.addr, AARCH64_INSN_SIZE);
> +
> +		addrs[i] = op->kp.addr;
> +		insns[i] = aarch64_insn_gen_branch_imm((unsigned long)op->kp.addr,
> +						       (unsigned long)op->optinsn.trampoline,
> +						       AARCH64_INSN_BRANCH_NOLINK);
> +
> +		list_del_init(&op->list);
> +		if (++i == OPTPROBE_BATCH_SIZE)
> +			break;
> +	}
> +
> +	aarch64_insn_patch_text(addrs, insns, i);
> +}
> +
> +void arch_unoptimize_kprobe(struct optimized_kprobe *op)
> +{
> +	arch_arm_kprobe(&op->kp);
> +}
> +
> +/*
> + * Recover original instructions and breakpoints from relative jumps.
> + * Caller must call with locking kprobe_mutex.
> + */
> +void arch_unoptimize_kprobes(struct list_head *oplist,
> +			    struct list_head *done_list)
> +{
> +	struct optimized_kprobe *op, *tmp;
> +	kprobe_opcode_t insns[OPTPROBE_BATCH_SIZE];
> +	void *addrs[OPTPROBE_BATCH_SIZE];
> +	int i = 0;
> +
> +	list_for_each_entry_safe(op, tmp, oplist, list) {
> +		addrs[i] = op->kp.addr;
> +		insns[i] = BRK64_OPCODE_KPROBES;
> +		list_move(&op->list, done_list);
> +
> +		if (++i == OPTPROBE_BATCH_SIZE)
> +			break;
> +	}
> +
> +	aarch64_insn_patch_text(addrs, insns, i);
> +}
> +
> +void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
> +{
> +	if (op->optinsn.trampoline) {
> +		free_optinsn_slot(op->optinsn.trampoline, 1);
> +		op->optinsn.trampoline = NULL;
> +	}
> +
> +}
> +
> +void optprobe_optimized_callback(struct optimized_kprobe *op, struct pt_regs *regs)
> +{
> +	if (kprobe_disabled(&op->kp))
> +		return;
> +
> +	guard(preempt)();
> +
> +	if (kprobe_running()) {
> +		kprobes_inc_nmissed_count(&op->kp);
> +	} else {
> +		__this_cpu_write(current_kprobe, &op->kp);
> +		get_kprobe_ctlblk()->kprobe_status = KPROBE_HIT_ACTIVE;
> +		opt_pre_handler(&op->kp, regs);
> +		__this_cpu_write(current_kprobe, NULL);
> +	}
> +}
> +NOKPROBE_SYMBOL(optprobe_optimized_callback)
> diff --git a/arch/arm64/kernel/probes/optprobe_trampoline.S b/arch/arm64/kernel/probes/optprobe_trampoline.S
> new file mode 100644
> index 000000000000..f564b119da69
> --- /dev/null
> +++ b/arch/arm64/kernel/probes/optprobe_trampoline.S
> @@ -0,0 +1,113 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * trampoline entry and return code for optprobes.
> + */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm-offsets.h>
> +#include <asm/assembler.h>
> +
> +#define        OPT_SLOT_SIZE   65536
> +
> +	.global optinsn_slot
> +optinsn_slot:
> +	.space  OPT_SLOT_SIZE
> +
> +SYM_CODE_START(optprobe_common)
> +	stp x2, x3, [sp, #S_X2]
> +	stp x4, x5, [sp, #S_X4]
> +	stp x6, x7, [sp, #S_X6]
> +	stp x8, x9, [sp, #S_X8]
> +	stp x10, x11, [sp, #S_X10]
> +	stp x12, x13, [sp, #S_X12]
> +	stp x14, x15, [sp, #S_X14]
> +	stp x16, x17, [sp, #S_X16]
> +	stp x18, x19, [sp, #S_X18]
> +	stp x20, x21, [sp, #S_X20]
> +	stp x22, x23, [sp, #S_X22]
> +	stp x24, x25, [sp, #S_X24]
> +	stp x26, x27, [sp, #S_X26]
> +	stp x28, x29, [sp, #S_X28]
> +	add x2, sp, #PT_REGS_SIZE
> +	str x2, [sp, #S_SP]
> +	/* Construct a useful saved PSTATE */
> +	mrs x2, nzcv
> +	mrs x3, daif
> +	orr x2, x2, x3
> +	mrs x3, CurrentEL
> +	orr x2, x2, x3
> +	mrs x3, SPSel
> +	orr x2, x2, x3
> +	adr x1, 2f
> +	stp x1, x2, [sp, #S_PC]
> +

Nit: In some context would be, but I think it could raise some problem
clearing other bit in the PSTATE to be used restoration.
i.e) PSTATE.BTYPE field. not only this it's almost unpredictable
what problem will be raised by this and this is one of reason
optkprobe isn't improper to arm.

> +	/* set the pt_regs address to x1 */
> +	mov x1, sp
> +	/* store lr of optprobe_common temporary */
> +	stp x29, x30, [sp, #-16]!
> +	mov x29, sp
> +
> +	bl optprobe_optimized_callback
> +
> +	ldp x29, x30, [sp], #16
> +
> +	ldr x0, [sp, #S_PSTATE]
> +	and x0, x0, #(PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT | PSR_V_BIT)
> +	msr nzcv, x0
> +
> +	ldp x0, x1, [sp, #S_X0]
> +	ldp x2, x3, [sp, #S_X2]
> +	ldp x4, x5, [sp, #S_X4]
> +	ldp x6, x7, [sp, #S_X6]
> +	ldp x8, x9, [sp, #S_X8]
> +	ldp x10, x11, [sp, #S_X10]
> +	ldp x12, x13, [sp, #S_X12]
> +	ldp x14, x15, [sp, #S_X14]
> +	ldp x16, x17, [sp, #S_X16]
> +	ldp x18, x19, [sp, #S_X18]
> +	ldp x20, x21, [sp, #S_X20]
> +	ldp x22, x23, [sp, #S_X22]
> +	ldp x24, x25, [sp, #S_X24]
> +	ldp x26, x27, [sp, #S_X26]
> +	ldp x28, x29, [sp, #S_X28]
> +	ret
> +SYM_CODE_END(optprobe_common)
> +
> +	.global optprobe_template_entry
> +optprobe_template_entry:
> +	stp x29, x30, [sp, #-16]!
> +	mov x29, sp
> +	adr x30, 2f
> +	stp x29, x30, [sp, #-16]!
> +	mov x29, sp
> +	sub sp, sp, #PT_REGS_SIZE
> +	str lr, [sp, #S_LR]
> +	stp x0, x1, [sp, #S_X0]
> +	/* Get parameters to optimized_callback() */
> +	adr x0, 1f
> +	.global optprobe_template_common
> +optprobe_template_common:
> +	nop
> +	ldr lr, [sp, #S_LR]
> +	add sp, sp, #PT_REGS_SIZE
> +	ldp x29, x30, [sp], #16
> +	ldp x29, x30, [sp], #16
> +	.global optprobe_template_restore_orig_insn
> +optprobe_template_restore_orig_insn:
> +	nop
> +	.global optprobe_template_restore_end
> +optprobe_template_restore_end:
> +	nop
> +	.balign
> +	.global optprobe_template_val
> +optprobe_template_val:
> +	1:	.long 0
> +		.long 0
> +	.balign
> +	.global optprobe_template_orig_addr
> +optprobe_template_orig_addr:
> +	2:	.long 0
> +		.long 0
> +	.global optprobe_template_end
> +optprobe_template_end:
> +	nop
> --
> 2.33.0
>

--
Sincerely,
Yeoreum Yun

Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2079.outbound.protection.outlook.com [40.107.247.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8C11E2307
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.79
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748333233; cv=fail; b=DIjD0CbYWHQjIK+SIaHzsCn5f0ee5Yn4mUZgE5rwZ/agHuUwk7E1HkjGD6CUnT7hhwaSfyAmgurve6VCOJ+PQ6AA9ztdPk6Tywd9FzxQBCz6+2TQ+7rVxx8UkFhRdiDTYp8kz6TE38FlNvE6fLRqZLzy/hp5VgyrLJoCFNfgAkQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748333233; c=relaxed/simple;
	bh=Rwx0m5L6arboSb0ZKgmD1PzK515Nxi150+bvuuB5d1k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EaWxAelHh7Kr9DidgIr/ziWZh3mrEYPNvGGm92Xjk4WFdVNIkHf3EJ5mi4z38/6Bb3GZtLDSyZU5B1oOpBrVCFK27u6TjgoWc6uMn4WCdeK1tqabRytw+dvgClDtoePjdyTG2DBj1T84pq2UrENSHpdgwP/UuCgMsTzDsjM1gBk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Y1effmOp; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Y1effmOp; arc=fail smtp.client-ip=40.107.247.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Y1effmOp";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Y1effmOp"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iD6IRMkNMisP3zRbTmNXLA7iwBZSMgYd7F/3+8XoLJ8i5ABTfGn0klehtwleYlPXikASRZ58+GClOAAWHO8zQ1F3ruFnHyjr72JaCZAxTVTt+gPGbM17fMrpAJjf+QoLNhmoDTF1qT5Qm2etacwINm192FXDhd+XbsGIMcAbE9tWqw0bvDzHS1NZxEWx6wFGRcbPldKCJcWGyGOus65im3osZn3KCzDUWMLAwMzOKbNmQkuX8L++pxGkB0otELF9EH/B1BO5lpHmFjeXxn8Y2DjbG86GWtZ4eJfASpO75miLUtXdbvHGVdbw6lXnJpYshppSHYbbhAqr5N5iyKi7Eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SFk0Vk7Y2RjOnXgbEpYCymfh+pxK4XuQ7X0CBbhW2Q=;
 b=W8ZxWKTw3asfHrjRXB6jGK8sLCBvr3cgpYY/VXisL6vCqytRxkm/ZMItQXRR22PbM9nUwt5bHn75XXyuivkBdHm3NHCr8ah9ws/U23+TfAU+Rt+znQYoBN+ot3Mp6m/xCz5G32DeVFT5lLT14LIq3fO3uP78RTToN82JjO2W+j24SBRosKpL+ECF8yfj8JoQl1BuwRGQ8C1U4grM4EMCDHtBOU1G8wp/upFRdEGYu/nRJN3xma0wTiLbJHvScmVhSIDzUcjCeElC+Z0YYewYMP2Y25ECxjfhhKOFGD7zfxy0laPYSKFjSxT4Bd94pjXwQ/2EMJk2aubhm1a8Kwnl8g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SFk0Vk7Y2RjOnXgbEpYCymfh+pxK4XuQ7X0CBbhW2Q=;
 b=Y1effmOpO/6a0B0APAye/onacwIdoTD2EotEH8sTEdf9xKK4yNriMpQOiqYIxcGbnJqFV1XtpKOPm8QiMZGHEwUwpMVUAP6wb3uO5IhiRL1XIUP27DwamcpRw9Ni7i7jzFliV7H4q8JWnh9II43WFM4xa8jMLY09BVDjIn1OPlI=
Received: from DUZPR01CA0275.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::6) by PAXPR08MB6367.eurprd08.prod.outlook.com
 (2603:10a6:102:15b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 08:07:04 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::25) by DUZPR01CA0275.outlook.office365.com
 (2603:10a6:10:4b9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.26 via Frontend Transport; Tue,
 27 May 2025 08:07:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Tue, 27 May 2025 08:07:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTlFZKZ5YB7ilK/wPCQTxlNZD1BKzbAmH4TU6plG6lkODLxOfgmiXAjuNRlTWnuCH0pdQT3fipQ02ep7sHv3jR6ke6KD1nO3Abfi72xi9BwYXDNrEG2rZpoXn5M28DzHPPC0U+BaFpBdnqhpAqZhjt+b1hVt3COgA2jo0Ad8IVWr5efjYS4uzzqixeQYOSuWUU15iVP2J09JUEVZuh57k6gdxkZNFFZ4eH7oGuOaVjOUWzh70F8GLSvhJXNpS/USLay5FPmjDVut4mi235p5iR0GrKi5+fgf9f/HSGpArdCLwJqCWxzR8CeyFQ0C+MqFkewjtsgk6CiSnMwL7Erf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SFk0Vk7Y2RjOnXgbEpYCymfh+pxK4XuQ7X0CBbhW2Q=;
 b=ySij97GerKQB6DMEM8miEwvH2EWtdNm555deNpO1YwG8HYkefTnj2rFacubTWjTgrTlQoTVXdiMvh/1slW0JSS2H9gw0H1DJQq0an0qvzdMZyo42PlNYFWP0SBd1bgxEWRoN2bzHZGRVUTsfyMo8JnirQ/eBWB27lf8AeocKWCBu0x3NxF+Re00PCLjPR783bTp7rTUhzPAs/fUE+x+FZ1UwFGx/IRb4S+e+zMAg55zc8/7VViNGgEJ8pGj20DUWzgXibFyguqs5hi0Dgy6NpRCIOzeok2IJe/dKvFvYZ5c1bX0gV7otn1Ay9gzw0ciyMJQO+oGODhkL6gjIooTFKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SFk0Vk7Y2RjOnXgbEpYCymfh+pxK4XuQ7X0CBbhW2Q=;
 b=Y1effmOpO/6a0B0APAye/onacwIdoTD2EotEH8sTEdf9xKK4yNriMpQOiqYIxcGbnJqFV1XtpKOPm8QiMZGHEwUwpMVUAP6wb3uO5IhiRL1XIUP27DwamcpRw9Ni7i7jzFliV7H4q8JWnh9II43WFM4xa8jMLY09BVDjIn1OPlI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PR3PR08MB5756.eurprd08.prod.outlook.com (2603:10a6:102:90::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 08:06:31 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 08:06:30 +0000
Message-ID: <cf22aeef-0160-46f8-b2e3-d308ccee0504@arm.com>
Date: Tue, 27 May 2025 13:36:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] mm/khugepaged: fix race with folio split/free
 using temporary reference
To: David Hildenbrand <david@redhat.com>, Shivank Garg <shivankg@amd.com>,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, fengwei.yin@intel.com, bharata@amd.com,
 syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
References: <20250526182818.37978-1-shivankg@amd.com>
 <b19653ae-8c9a-46f1-af93-3d09c3b0759e@arm.com>
 <0dc0fef0-ec1d-4971-81e6-0add808a8551@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <0dc0fef0-ec1d-4971-81e6-0add808a8551@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::18) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PR3PR08MB5756:EE_|DB1PEPF000509F2:EE_|PAXPR08MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b18c77-0559-4f11-1b00-08dd9cf576de
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bXl1K0pVWFo5YU1SOGhKT0MyYlYzQ0J5aXA3SmVvbEw5OHNJMVAxQ01mMXh6?=
 =?utf-8?B?ZGVIbzUwT3F3QzNrOGNuYnZJZlpkRW5LN3IzelRRTUZLeW5idUlMVlFyT3pq?=
 =?utf-8?B?TDZNWVlwdmVyUWRmNUNkZnVHMTcrcElHTTZHbzF4cUtNUXREWlh0Wlh4NlYv?=
 =?utf-8?B?S0Q0eitkTDFkc2JpSzF0Q0VUQ1M3SS8wZnQzMXVveVlYWTcvVUVQa0ZYNHNP?=
 =?utf-8?B?cHcvcVZjMENXZ1puNnBBQ1hHWW5naXhSK0w0NDFYZkwweFZBWEk1bU93eklr?=
 =?utf-8?B?a0Q4U0xUcHk3M1BtS3c2a3MwcTJrSUczai9xWWl2eDFXT01ITkRFL2RhbFBj?=
 =?utf-8?B?bWRURDVtNkJPcXA0T1ZmWHBEVTNhUjk1QSt4SWFxbFZ2RE9XbWNpbzdweG9j?=
 =?utf-8?B?L2p5QVkxWDZFd0M5M0NHUWc4SGNDbkdkbmF4dHF4ejBrS2lZcDB5ZmJoWU1v?=
 =?utf-8?B?ckhzTEo5c3NqdE9uOHNlTGpVcWpWQjJBdlNXbldQRGc5TGtjYzZqRytuQ25U?=
 =?utf-8?B?R2lMZWJrUFQ1YytEcDhpTHBaMlRoUERPT3U5RXU4YnJKZXpBZVg2UXppNDhV?=
 =?utf-8?B?UGZkUzVPTFRoUFZtYmdlZW9tKzFEK0RtbExoQ01jRlJBRks3QUZDd0RBbTdL?=
 =?utf-8?B?eFIxM08xUU5pR2pzUkwzUStRb1ZSYnNBeXBFVUNmVTh0Y0poNWxKcjhHSHky?=
 =?utf-8?B?cGpaKzJvUEJXTm0wRXh4Vi94UUN3UWJIdE13SkpZYnF1blVFMHZ6RFJLODdZ?=
 =?utf-8?B?QStqYkFLSDdrdGF6SDNPaFBpYTRKUzkvWVFKUHIxclFFclp2ci9rL3d5U1BC?=
 =?utf-8?B?VDV1R25kYll0SThjaUU5QmY1V1B1dEhLb2VTWDAweUdpRG5qZitlb0tRemNH?=
 =?utf-8?B?K2REYUJJZXVtSkpmVVlyZ2NPU0FwTnd0SFNYTXAvamovOG9JZHJ0M2tSbU1x?=
 =?utf-8?B?RUpuNFhuWVdVb0NTWTJRVlVVcFFCT3k4bDl4Y1hOdUxJL2tsSFI5MW14VFFK?=
 =?utf-8?B?RUcyTnJvL3cyV2s5V1dFT1hqa0ZYZFRPeG8xdEVSWmlaVk8rQytGdXlyNEhk?=
 =?utf-8?B?UGpCdEFTQWtDb0VvaWEzTEdJM0lQeDNkQ0NiQXVCNGE3MHpIZmtoUHIvMWRE?=
 =?utf-8?B?eUQ1T3JUUG56MCtRMjBJUE8wMzFnaHpVTFJBcGpxa01DMlpLRXB1c3Q0ZUl5?=
 =?utf-8?B?L3RaalczeS9JSk9MN1pzdTc4SmxTcXB6OVZ3QVVwZmtSajFReUZ4V25vbUtt?=
 =?utf-8?B?YUplNHdSeGFXdWtxSnlUODhyNXVkKzErYUFCSlBmWjlrUWtMaTRnMDlZKzg4?=
 =?utf-8?B?WVdPSHdrM0w1N3U0RURBSzdiRHFWY1RyZ1I2VjBuUDBOekUzZFlmUXJSSzhC?=
 =?utf-8?B?T3Q1OXBYR29RbDFPRTBIeWJ0Y3Nyd0I0bkFvRXgzTURJNkMxUldNTW9Zak1v?=
 =?utf-8?B?YXlYRHFoenY4SERjZWVUTG43WDJrNDRIcUZkR2VJeGM3RkkwQzhYczlCVzNS?=
 =?utf-8?B?bEpvMm5lMVpTTDlJT0IyMzNSWXpEY2FXUUM4cVlmaU9LdnFjSUlXeCtacjFO?=
 =?utf-8?B?QzJJN2NOaklMaEdSdGhuTHVaMHN3ZTg2Zk5RY1pHaDlleWRMWngyb0JsczNS?=
 =?utf-8?B?cmprdy8yL2t6ZEtrNzNkMTN4WDdEZDR0UjBmNUxYU0lOWWc5amd6VmExeXhh?=
 =?utf-8?B?NlB1ZXZKYTExcWE4ZnJRUTIvbFh6YW42ZVdHbzJQS1Foc0F2OTIxdWdnVGdG?=
 =?utf-8?B?WDJwbTcxV3hkWTFieUpqQkk3TEYxWGUxZUpjN1F1RTFKb2lyVk1zbjdTbzZH?=
 =?utf-8?B?WEJUZ2NhZnFCOUNRdTU4R0haaVFFbFhvVGduU2xEQUprUEIzWVhhMlNmcTFR?=
 =?utf-8?Q?m+G5SIcx6TFb5?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5756
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3baae6dd-a254-4e45-b41e-08dd9cf56351
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|82310400026|35042699022|36860700013|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1JlL1Jkc2FGSnAybzRmOWlQS0VWT1lhU203VDZYM3lZVTZMbjFyelYzbWlG?=
 =?utf-8?B?cGVZUnNWeXFoc0t3WmpoT3l2dldxQld3M1l5d3E0SzV3V2FrOUVRTG1FUEMv?=
 =?utf-8?B?Uy9Vd1lDRHBCTzNPWTFoQlpZL1ZET0ltSVZXQ3dLVDNTdW0wbGp1TWtCeHJz?=
 =?utf-8?B?K0xmdUl5WVJvY1VYcVpXUGo4UVphSk1lNXBVOGZWblVaVytWblR6T0hWRlRl?=
 =?utf-8?B?RmUyZUpJZHRabHBybUpwT09SWHJ4NUE4T0lkRkNvZ3RZNVFXUm56SUZpbGZy?=
 =?utf-8?B?VXZaWmxUdHQ0d0YwWnJrNktpMERubUlJbjY5Q1BwMkZoTGRuU2t2RWtkd0RX?=
 =?utf-8?B?S05NdUEwUkRLYXVDZWZaekhlUDFINzlKRkxFMG9Qby9VUUZIR1JVZkNmUW5W?=
 =?utf-8?B?SUk1NjJNaDArTEl4ZWhpVjVYLzlPaVU3NVRjaWZ4YXlDQ1NoVGlVd1ZvN3J4?=
 =?utf-8?B?YVZody9WM0lZMjg1aHZuNFlkNllQQSs3UEhILzM0S1kzZytUZENlSHhhL2N2?=
 =?utf-8?B?c3RDdU51aWZjeUZGZy9IR3BrRDBYUklQYUl0K2Y1VlZ3RjNKV25iUS8vQzM3?=
 =?utf-8?B?dDAyT0JJeDAzZ1E5OEFnRzUza3prR25kWTVyN0FCRzlHQ2FRMC9SSy9WZm5i?=
 =?utf-8?B?aS93ZmxzeHk2RkdKVHByRmhOSzhyenJqWGd3dWx1ZVRmRmRXaEV2aVdQWnFI?=
 =?utf-8?B?TFNBcnFhbEwxNm54Zm02VytjUURDbUtBRWpyajFoQXBVTFRCbFlGV1F2UUZH?=
 =?utf-8?B?cTR0bUxidE9LOTE0MEo4d2dEdjhBZWlBclNIMWl2RytpeXptS2pTaG1EbURP?=
 =?utf-8?B?Y2Q4MlZBbUJkcEFZWXNZNUNhNWVlUlJPVWFtNURSUnFGUS92OEd2WngrOS9G?=
 =?utf-8?B?TDc2VytNYU5SbHJuN1RhTlVHVUZqMUpHSW9rVFVEOHdYRnUrWjk1MEJtbGRN?=
 =?utf-8?B?NFduWmJBcEIxNUdpeUJvUkhXK2ZNall6UGdFclRQZlVGYmZ6eUJUbjhtN29i?=
 =?utf-8?B?SWxOMnpLZW5DSlJiMk5HeDJQVm52RUpvUXIxVlNXT0IyUjJCbHNNMFZDN01x?=
 =?utf-8?B?YmNPQVhQZmdWN1l3ZmV1YmlwTWl4WUwwMVBaQ1k5b0s5ZU1aL1NMclEwc3J1?=
 =?utf-8?B?d2NvenFCMmZBa0tmbzlYMk1UNDIvUnZqMkYvWVNVVzRMc3p0SFJKelpHRDRs?=
 =?utf-8?B?UnM3WEhpbHBTVmZheVNKRVh4aUc5UkQzTXJxSWZzOTlFQnhTZnhua2o5UmRR?=
 =?utf-8?B?UWIzVDREZXA1dlRnS2t4S25keUxhZGJURU95UTlQTGorSzhabTlYYkNpL0ll?=
 =?utf-8?B?M1ovaHRYc0RIWFQ0a2NxVGpUVGQ1eElTMWJjc2NjQ3Z0djBITC9ERmJjRGJo?=
 =?utf-8?B?eGhtYmZiQ0xmRjh1NG1zdFFxVjlwa1BmeUQyZEtlUDE2MHhKUG9PTmF2eXh2?=
 =?utf-8?B?VTJ1MFkwK0kzazNzMEVrNmZvR0ppeGlpTXBka2JGZVZKS3VqRjR0R1JCVVJx?=
 =?utf-8?B?RkhmTFBVd2FaTXdDOFpOb1Aya084Tk5FYjlST0RqM1BWUUF1K2pGSmxpYWts?=
 =?utf-8?B?aXcrYmhyTlRZWk9RQzNTWG9CWHhjL2dFcUZPbnFxQ0RpVWQ5Q3B0dU9Jek9a?=
 =?utf-8?B?M3NiMU4zRG4rcmRBMU4rb01hMlBvdDZKRjI5NmgybVhIMEVtNXRVSElIaVA5?=
 =?utf-8?B?RnNWYzYxeXhQVllmUzhmNndqRUs3cmJZZmtEMEpqZ3dFUHVNYVNPK0daVGNU?=
 =?utf-8?B?dS9lZUxvMUhKTVZDNVJkNUhjUzk1OWRLY2pVdnJKRmtyT0x4U1FCRmdVSlVx?=
 =?utf-8?B?WElUVEFmY3pyQUZLTlEwc1MwUVFZb01rekhLOEFmUXlsM1JIR3kzdkc3cFZJ?=
 =?utf-8?B?ckt3cmprN0J2NmNSYXNtb2R5NWdpQmNDVGFyTVcrR3ZYaW5rUnNUOVFjR2ov?=
 =?utf-8?B?dDNKb1JkQkR2eEoxd0s0elZkVTFpNElDZ1ZMbmh5Mi9wRzJCVGZGRkJTZDVt?=
 =?utf-8?Q?6W5RYi+6pQtJ8IT1rxIhqIXvjoS4Hc=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(82310400026)(35042699022)(36860700013)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:07:03.0685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b18c77-0559-4f11-1b00-08dd9cf576de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6367


On 27/05/25 1:18 pm, David Hildenbrand wrote:
> On 27.05.25 05:20, Dev Jain wrote:
>>
>> On 26/05/25 11:58 pm, Shivank Garg wrote:
>>> hpage_collapse_scan_file() calls is_refcount_suitable(), which in turn
>>> calls folio_mapcount(). folio_mapcount() checks folio_test_large() 
>>> before
>>> proceeding to folio_large_mapcount(), but there is a race window 
>>> where the
>>> folio may get split/freed between these checks, triggering:
>>>
>>>     VM_WARN_ON_FOLIO(!folio_test_large(folio), folio)
>>>
>>> Take a temporary reference to the folio in hpage_collapse_scan_file().
>>> This stabilizes the folio during refcount check and prevents incorrect
>>> large folio detection due to concurrent split/free. Use helper
>>> folio_expected_ref_count() + 1 to compare with folio_ref_count()
>>> instead of using is_refcount_suitable().
>>>
>>> Fixes: 05c5323b2a34 ("mm: track mapcount of large folios in single 
>>> value")
>>> Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
>>> Closes: 
>>> https://lore.kernel.org/all/6828470d.a70a0220.38f255.000c.GAE@google.com 
>>>
>>> Suggested-by: David Hildenbrand <david@redhat.com>
>>> Acked-by: David Hildenbrand <david@redhat.com>
>>> Signed-off-by: Shivank Garg <shivankg@amd.com>
>>> ---
>>
>> The patch looks fine.
>>
>> I was just wondering about the implications of this on migration. 
>> Earlier
>> we had a refcount race between migration and shmem page fault via 
>> filemap_get_entry()
>> taking a reference and not releasing it till we take the folio lock, 
>> which was held
>> by the migration path. I would like to *think* that real workloads, 
>> when migrating
>> pages, will *not* be faulting on those pages simultaneously, just 
>> guessing. But now
>> we have a kernel thread (khugepaged) racing against migration. I may 
>> just be over-speculating.
>
> I'm not quite sure I understand the concern you have. Any temporary 
> reference can temporarily block migration, however, the retry logic 
> should be able to handle that just fine -- and this code is not really 
> special (see filemap_get_entry()).


You are correct that any temp ref can block migration, however, that 
reference has to come after the folios have been isolated in the 
migration path.

So the probability of someone taking a reference on the folio is quite 
low since it has been isolated. The problem with filemap_get_entry() is 
that it finds

the folio in the pagecache, so isolation is useless, then takes a 
reference and then shmem_get_folio_gfp() does a folio_lock() instead of 
folio_try_lock().

This was the race which I talked about an year back at [1]. My concern 
is that we are adding another candidate to that race; just wondering if 
there is

a better solution to fix the race mentioned in Shivank's patchset.


[1] https://lore.kernel.org/all/20240801081657.1386743-1-dev.jain@arm.com/


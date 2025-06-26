Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013065.outbound.protection.outlook.com [40.107.162.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39F52EB10
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.65
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750916896; cv=fail; b=PAl3I1H6aE0Ew3ojkY0sLjMyxav4wnSiI2xIdVfwISZvHydUaoda/cKal6yeQrb7RccHApeoQt2VGPKSRoLfVCvGoJJ0fen3IVFPs+ti8hI15+9hBBhFIOF4+xD44DrMbxr+y6LyIrw9pp4vQznXDm3pqyxO5R3x2P5Qw8C6Dkc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750916896; c=relaxed/simple;
	bh=rv2yim6g1F8UE56aa4CH4NavG29h+paAa5a/5HQD6fo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DYVcPDwSh2kGs4jVtSONiHMG8howW5bdCdDSM3SebNRikkjB72v0HI/NP+2eaUXC8NXym3NDJ18sPonYe0cT1UXdXkJVON9onI2kyRr77YYkN6p9sZDKftNa4UBd6piwIoUa4VakZEdHjvvERirZnbG19v8+KqmXCG/1Sda3o7k=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WCY4RqYp; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WCY4RqYp; arc=fail smtp.client-ip=40.107.162.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WCY4RqYp";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WCY4RqYp"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KMlNzeVqfnMGfYC0Lhmfl5otwotqmfevR+v0NdXEVN8ek2G3VnAlDZqS4i80ysVp60av1IdSJUQnbNNl/szAfm/w4XAHAC+3D3vCL280o/OT0LKmV90vYENMXjCKzidG47D6r5vjpFQdJEKbSFpbb8lWFq7eStrAh2ZCXY6zVUMJttmT+iTfmC56nPzrAkNNNp6duxQTRdf3L2jZTsoZNAb+MR2dERvJaaxNTadG2firCDxAx8ZxgJCZnmBNaaTpUOqht6zjKKCbM2zPtE5dfcmgJWQFNNNNyS4Lf0BP5wzcHLRunyUIb9Won6BBVo5slczqwLSl4ZVaVFD2F8WFQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOIk0t6+cAJOfMkObNH31ui7PwPazh5OFiSs8lz7rwY=;
 b=BhWAF3fgNUFwAesYZo6lkYyni6IZmolfY1Gjpl65/6zxIFSMa2G6F6e9WrD4zMfCGPkUVwKtTMzCeeexVrP+nYP72NsL6dfpJ4o6vQunGSyzAQuDlk6XqXD9K72eLr+PJDoE1cZ+AuYCV1WZrr/f+VRrY1gzXL/jbHDoGDVatLbVaEisnOsW4zSXvcZn2kD5EJJg68up7LZrD1CX0lJJpdzYI/p3tHYK7ecosA3v5qsTkjXzW+nPNmKmdUb4fAsMu5dbaKBrNjDAuHaR4OETfO2MvDGGMFkq3ifr9hll5NCFzd1j1Dn1fbCd48hP6PExaQUG0jzoZR3UCMmsFuBhQg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOIk0t6+cAJOfMkObNH31ui7PwPazh5OFiSs8lz7rwY=;
 b=WCY4RqYpCB9ee3iXoL45osIXUxXXQzl1Ln1WiPsPGP/OQibNrFnmyrfWlrdWNYCFGFHVzfl3XY1JmoXee0PXqW3dNGlEpvrkkDit4IQ1cj01haOryUnRLeZDiyfdEAOCX4tjyCNhWICJCJ4fZ98P59Cbbz2+4VkoqVaRm6azWXU=
Received: from DUZPR01CA0168.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::24) by PAXPR08MB6607.eurprd08.prod.outlook.com
 (2603:10a6:102:152::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 05:48:07 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::bf) by DUZPR01CA0168.outlook.office365.com
 (2603:10a6:10:4b3::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Thu,
 26 Jun 2025 05:48:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Thu, 26 Jun 2025 05:48:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=paZsvw2yhk78cXSLWMgpbMBf3sz1bEAkYQoVSwzpeU4VmK+gw/2b9RcyffqxhHvozTYJPzjJUm6JWOtrH2SVKArER3M4YNmjmSZL1SGfp8bjCRAkelKWqAP+dCSIJ14AnsfcIxAN5H09GSUDZY/4ZjNuOYExQxkKI96Uump71id4BwYmoLt9Vlt6t235CxjKtjOMX7rykqw/Jx972PBNdaeVmpCzwgtJCILqKQob74Ivac9il9dJplsEk+K/fOeDKxAztouR2sOraq0/DRFTlLKPY1d/KZXOexCX1WknYQ433kbXYmmLhUEJ0KWwdw74JY5HrEcBpIbqLLBEOcGw/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOIk0t6+cAJOfMkObNH31ui7PwPazh5OFiSs8lz7rwY=;
 b=yGKTyzPhiUcWKTIjPSVM6WWD7QafRHPm23wpkMIhGkNt1CNLEOT32hA6f+rp8ke5t0GIQv8O9RVLYV8mvhcn8IiHLpkIIlXkvnzlvT+xYukcmLsarsofmbHQNDQhbPEhouaptbQsiVBZUYf+iYFqhjvM2rSoZfJqmi/6XpfmrlSf49Wy2vdG3FkALuxvfr1Mx/rhYGDHG+UnrB3zVvy9fsnz+CZucnxc9Frx/IKqSwIY9h95F7UDYuH/RqjRi3TlJuDhgIrCH+2jcqRXwOs/L9R2bZemqUvdvYLgliNc9fme9Yb/KYsjrLL4RVb5eL7wMiBKKn44uimQSJQpM5k7Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOIk0t6+cAJOfMkObNH31ui7PwPazh5OFiSs8lz7rwY=;
 b=WCY4RqYpCB9ee3iXoL45osIXUxXXQzl1Ln1WiPsPGP/OQibNrFnmyrfWlrdWNYCFGFHVzfl3XY1JmoXee0PXqW3dNGlEpvrkkDit4IQ1cj01haOryUnRLeZDiyfdEAOCX4tjyCNhWICJCJ4fZ98P59Cbbz2+4VkoqVaRm6azWXU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PA6PR08MB10781.eurprd08.prod.outlook.com (2603:10a6:102:3d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 05:47:30 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 05:47:30 +0000
Message-ID: <1bb09534-56bd-4aba-b7e8-dad8bf6e9200@arm.com>
Date: Thu, 26 Jun 2025 11:17:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change memory
 permissions
To: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250613134352.65994-2-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0164.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::34) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PA6PR08MB10781:EE_|DB1PEPF000509E5:EE_|PAXPR08MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5976b3-a622-44af-ef72-08ddb475067c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UlNiVlc3QTQ1d1hKMkF5OXhGa0luMXNOSWFraWJCOWkrV3NFWVYxMFNSbU80?=
 =?utf-8?B?clJZWTVsUTIycVRFdG8yVmZPS2VSWTRKTFl0QzRVcUpiTSt3TkY4aGhnM2JR?=
 =?utf-8?B?TUVJaXp1RjJLQVZpaTZ1WWdYNWpBSGtERFQ4Ymp1aUlQeUxzQ3M0R3NFbzBy?=
 =?utf-8?B?U0pyS1g1b1FSTERGTmwzWWs3RFJMWE5tbFZFOFVUUnV6emQ3S1dUTWdUVGhN?=
 =?utf-8?B?aEU0ZkJNUm1zSXRjVyt3Y2RnTmd5UHZsL3lQUEFmY2pEWGtPZVhCYjhkblds?=
 =?utf-8?B?c1RrYnhVQlNGS3M2aHlPemRGR1ZxWVhWcHFYc1FLNGt4Z2g5bmZzQW5Ud2Fk?=
 =?utf-8?B?WDd3eU00UkhybUE5UnFZNEdTQm1yQW9Xak50RFJCNXdrUWg0WHE2T3lrOUFO?=
 =?utf-8?B?M1VEdmFUMnVRSjFsRlBOZS9jRzBGa1NHMTB4VllIcDl3T0xiZy9LclcwM3Ar?=
 =?utf-8?B?a2JOOFQvL0poVVg4STRMQkxEWldkY2Nad3oxMHNsdEJTd2EwMThYb2lHdC9K?=
 =?utf-8?B?Sk1DNC90NDArcVBJMmNIazFYMVpIWnhiZ2V2SVkrNHlEeThGMXVEWVpmSzJB?=
 =?utf-8?B?T0RrYlZnSERvTkJrc1RucWhmNkNNaUtYSzdyeUV0STNOT3NROGU1WnZjNENR?=
 =?utf-8?B?RDh2YkRhbWN0TUxJOGNCallVZkpMUCtVVUd2TzhOYUZTMkNOWlAxeTAvNFpK?=
 =?utf-8?B?L3lsTEVHTWU4d0E0akN5cHdVMFVreU9SYURlQ3QwZExydnBWdE0zWWZsQTFQ?=
 =?utf-8?B?dFRteGVEL1NpTWw0TUt1ODVtMEoxMEhOT1Z1LzNVbHhpRTZTMHVBaVhnUXdl?=
 =?utf-8?B?SDdiSzJzR293NGxKTFFXSTcvYWNEc1g3KzZxeWc1SmEzU00vRkpBNGx0Y1FK?=
 =?utf-8?B?ekJxWTNKMjI2bG4zZnZ5WmNPWC9MVHhkUzFzQzRCMGp2WUVURVhUbEJ3U21T?=
 =?utf-8?B?Q0FJU1NDcmd0RCtqS0tZYVJ4VTRDNHc3c25jNjRXeElGelJ3czhUWXhZR0E0?=
 =?utf-8?B?YUxqWVErcjdhMWM1eGR6VUduMXAxZHJ1aW9FZ0hSOXpyYTZlSHhIOGFYUzBn?=
 =?utf-8?B?VkVVN01Sb2x1RkphaU0rUWpwUTl6UlRVc0ZwenJieS9KWS9HbEpHMDEwZ01s?=
 =?utf-8?B?RWl0WTJEcktDNUlPZThic1dqYlVPbXMvcC8zcUo4aTVEQnZKUUE1dW9seGVZ?=
 =?utf-8?B?NnRUSXA0KzVRQTIxU0EwQUlUN2p4azI2bmdHSVM3TzZoYkF1N3Y4eWlsQ1FJ?=
 =?utf-8?B?MzREOEVTYStOTml1MU9MVGJ0dFFTWTBBWHJFdGtsZnRXSFlXekJFaTNqaGNa?=
 =?utf-8?B?dkJJL093QnByekpKVkZZVDFmdHY3L29WeHp5NTNwQ3lPMTgwRzg5MkY5T28z?=
 =?utf-8?B?SW0zUVVvTHh5Tk5KNk1td0V4S3RjRE1QL3JwNlAyUzdleGdwZXJub2diazlj?=
 =?utf-8?B?REU5MlphYkE5dHhkbXZIVzZjdUF1S0xhY1ZVVTc3SlJmTkd5ejFiTGtzY2FS?=
 =?utf-8?B?UTNGY1dta3c4NEEyMVYrOEFCQ1pGZG42RTRCQnVtVFp1QWxGakc5bzBzSVYz?=
 =?utf-8?B?MWZob0tWV05HMTdhS1NtZmZkTm81YmJMVUw1RnFSTVhCS2JIS1lraEVUblI4?=
 =?utf-8?B?Q3NmdW1WbTltcDY3MHQ2OU5ZL1VKbjNzUVFTV3F1TEJXc2ZqUlZXN2tldCt5?=
 =?utf-8?B?ZXdXVHphVVlMSmtveUQxa3BzY0lJYWUrbitaL2w3REJiUHhoN1c5VnA5ZzFR?=
 =?utf-8?B?bEE1aDVUOFZrTW9jWG9zcWtKYlZIZTlKRVFmemU1L0FCTUJqVnkrNnFEMGVK?=
 =?utf-8?B?REw3NDl5OFdDTlpxT1RFVGVtdjVjYm5pczlDdlk5RDgvZmhrMHhaSFJ2OG5u?=
 =?utf-8?B?dmMvYVpTQVNXdXM2cnFQaXhTNzc5MkFPcE56eTJwZVp2T1h4TytUTlA2NnBI?=
 =?utf-8?Q?i2fdxs0V5Xs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10781
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	54c0ddb2-06ec-4ab7-38f7-08ddb474ee41
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|14060799003|35042699022|1800799024|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFRCeFNwK2xZZ08xdVQ4Qk9jRmhvbzZyd2FCa0t6Ry9PcUJHQWNpRm5XcUMr?=
 =?utf-8?B?Qk5UcHByRVBpUWl4ZDBXejAxc2ZYQjczYXhIMFNUOXhpYW5MZnVWRmNqZmhp?=
 =?utf-8?B?aG9kRzhxcnAzWXhTaHVhdUtudTNtVW9DQ1U3aUlzYmljejRLYnlid1BtWWJs?=
 =?utf-8?B?a2ZXUWd1R0JJZ2hnQlJFRmswNkRuNTEwd1NFK3FRdzdiTkw1YXRocndhcWlt?=
 =?utf-8?B?a2VSQkxUSzlmYkFHbjZoSEc1S1JqNHVGd1p4SWZYQUcza3htcUdub3E0M0M5?=
 =?utf-8?B?R2pyRzBOVm9iVGt0azduc0Z1MVhyV3o2WG5nV1hBODdwYWFzcjFEQUxORXhU?=
 =?utf-8?B?SWR5R0Y2cVBkeGtNeUJYanRnb2loNTR5aWRTd0NNeVVVdzFxTjVjMVBjN3BN?=
 =?utf-8?B?N3k2aGFuYTdRMGNELzFKRGVJU2pYRjNRTlFYZ09od09KNnFQaTNZcHQrQTA1?=
 =?utf-8?B?RVpOclc0dzlDUE9DNUJwQ3ZaaDBRYkMxS0thTGQ3Z3cxaEYydXZOVWFONTJG?=
 =?utf-8?B?WmFBRTFMSGJnSkQzT3lkOU5CaU53c1p4b3pFbWpRcUZ1ZzV1b202a1U0WUQy?=
 =?utf-8?B?eWkyVTlIUGhLVythS1pMQURBcm11UUNERk5udG82MEdmaWVaZXFXZUNIbU1Z?=
 =?utf-8?B?S3JnWFBiNVp6bFl6YWQyZlRxdU9NMjlVeDU3SDlkN2RpZzdCWjI1b1pwUXhC?=
 =?utf-8?B?YlhyYUlNZDIyNnBxbWpNOG1oaDBySm1BNVhlV0NBRm9yNFZQOWRRTzZ4SHB1?=
 =?utf-8?B?aEE0VWxSMFBGOVdEVlZaS3dNRkFZU2s1Ujl6T2pXb1VDRC9RejMwVlRxeVBn?=
 =?utf-8?B?T3I3elJlOWF2WUNvRzJFUUxhREo1RVFMekUwSHJCVXI5Y21NaTByUmhQTmo0?=
 =?utf-8?B?Ti9LU04xZkhKamFCWkltMFB3OHRoSHZ3dEtJandocXF1WnBWNHVsT1NBWmo0?=
 =?utf-8?B?cjFJbnJJQkJwNnAwbWJHRi9RNkJNU0pmVGNOR2Vka0xvaURsTGx4cHZ6ZTJw?=
 =?utf-8?B?L1hLSUU2N1p3VVdOMTE5RTZ1bjVQU2tEcS9iZFpYdTRYSTlsU09YSktsV05y?=
 =?utf-8?B?MXpBNkc3L0RHR1FHZHE4QitsdGtWdEhnZHZMVlpTRmQ4YVBiWlhmeTBReko3?=
 =?utf-8?B?aVY4K0d3b2RlUHlNd1VDNjhCeHhlS0dyQVZ0Z3JpQUYydVhUZEMxS0twZGUv?=
 =?utf-8?B?RFhkN0U1TVg3NEFjbW5ZR3NZdGNhK3MwaSs0VENXUEkveEx4bnYwbTJpRjFh?=
 =?utf-8?B?QVRPazVHWElnYkhwbjZuMTQ4dU1HdGIvRnB2S1BTcG5xU0VxR3hVbHNHZ1Z4?=
 =?utf-8?B?cWtjTzE1VzZUamVVdGNuYjJCQ2syK3V3a1dGYnNaVEhuZEVIb0FhM2lSaVVF?=
 =?utf-8?B?VklhNitlMGxwRTZwZVlCMUVQNzMwT25XMm4relIwUHV0c2Nrb25NOTJSTnIx?=
 =?utf-8?B?dXNPTlFwVjhEQ3lEdGpHWi82d3IxUU9IajYvTjFrRlJtbmQyZG9KUFh5MVkr?=
 =?utf-8?B?cnROMjlZd3hDSDdKS2hwS3RpSjdlQTRGZmIwejN3SENCdDhKd3lyY1BUOXla?=
 =?utf-8?B?M1laWTRMNXN0VHJtVU53dUFQdVVMNXRlanE2SStLaXdPbG11VkROMExaTC9H?=
 =?utf-8?B?QXVOd2ZiVHo4WDVvZlNDa2x4dHV4Y2xsMzdUaFVzME1HWmUyS2hVUVd5dmRE?=
 =?utf-8?B?YTRCbld4ME44UnlKK0R2d2ZNeWwzQWJCbWx6bXNYdWZ1NmNyRjZLZHZ6YjdW?=
 =?utf-8?B?ekZlTWtKaFJVOGoxYXd6UHNOMmJpbmYvSW5jR1QzVjUrUW5EQVFoS2Q4eGxD?=
 =?utf-8?B?eTh2eVlnNktYZWM0MjhFZGIvOFVjelRUNmJHbkh5WUhsOEJqcWZtMGg2cnRk?=
 =?utf-8?B?ME14ZEZrcGJDUWlSdFVneFZWUW9hWWlvNm5lUTdNaGdFRkxMUldKVXVkTlRV?=
 =?utf-8?B?UUdob1NMNDg4cmNGNTZRRmdVOXFPdHRMNzMxSEdFbGVrdkNsTFd1TmsxWVJh?=
 =?utf-8?B?NjdpWm4waHM4ZUQzZnJGMG1qNTU2ZStFQ29PRnRWTlIvbTNUU1NRRlBuY0tt?=
 =?utf-8?B?dXVWVkpLdmNGT0MwVWVudDJ3S2FVUmVvUk9lZz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(14060799003)(35042699022)(1800799024)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 05:48:06.8428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5976b3-a622-44af-ef72-08ddb475067c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6607


On 13/06/25 7:13 pm, Dev Jain wrote:
> arm64 currently changes permissions on vmalloc objects locklessly, via
> apply_to_page_range, whose limitation is to deny changing permissions for
> block mappings. Therefore, we move away to use the generic pagewalk API,
> thus paving the path for enabling huge mappings by default on kernel space
> mappings, thus leading to more efficient TLB usage. However, the API
> currently enforces the init_mm.mmap_lock to be held. To avoid the
> unnecessary bottleneck of the mmap_lock for our usecase, this patch
> extends this generic API to be used locklessly, so as to retain the
> existing behaviour for changing permissions. Apart from this reason, it is
> noted at [1] that KFENCE can manipulate kernel pgtable entries during
> softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
> This being a non-sleepable context, we cannot take the init_mm mmap lock.
>
> Add comments to highlight the conditions under which we can use the
> lockless variant - no underlying VMA, and the user having exclusive control
> over the range, thus guaranteeing no concurrent access.
>
> Since arm64 cannot handle kernel live mapping splitting without BBML2,
> we require that the start and end of a given range lie on block mapping
> boundaries. Return -EINVAL in case a partial block mapping is detected;
> add a corresponding comment in ___change_memory_common() to warn that
> eliminating such a condition is the responsibility of the caller.
>
> apply_to_page_range() currently performs all pte level callbacks while in
> lazy mmu mode. Since arm64 can optimize performance by batching barriers
> when modifying kernel pgtables in lazy mmu mode, we would like to continue
> to benefit from this optimisation. Unfortunately walk_kernel_page_table_range()
> does not use lazy mmu mode. However, since the pagewalk framework is not
> allocating any memory, we can safely bracket the whole operation inside
> lazy mmu mode ourselves. Therefore, wrap the call to
> walk_kernel_page_table_range() with the lazy MMU helpers.
>
> [1] https://lore.kernel.org/linux-arm-kernel/89d0ad18-4772-4d8f-ae8a-7c48d26a927e@arm.com/
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>   arch/arm64/mm/pageattr.c | 157 +++++++++++++++++++++++++++++++--------
>   include/linux/pagewalk.h |   3 +
>   mm/pagewalk.c            |  26 +++++++
>   3 files changed, 154 insertions(+), 32 deletions(-)
>
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 04d4a8f676db..cfc5279f27a2 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -8,6 +8,7 @@
>   #include <linux/mem_encrypt.h>
>   #include <linux/sched.h>
>   #include <linux/vmalloc.h>
> +#include <linux/pagewalk.h>
>   
>   #include <asm/cacheflush.h>
>   #include <asm/pgtable-prot.h>
> @@ -20,6 +21,99 @@ struct page_change_data {
>   	pgprot_t clear_mask;
>   };
>   
> +static ptdesc_t set_pageattr_masks(ptdesc_t val, struct mm_walk *walk)
> +{
> +	struct page_change_data *masks = walk->private;
> +
> +	val &= ~(pgprot_val(masks->clear_mask));
> +	val |= (pgprot_val(masks->set_mask));
> +
> +	return val;
> +}
> +
> +static int pageattr_pgd_entry(pgd_t *pgd, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pgd_t val = pgdp_get(pgd);
> +
> +	if (pgd_leaf(val)) {
> +		if (WARN_ON_ONCE((next - addr) != PGDIR_SIZE))
> +			return -EINVAL;
> +		val = __pgd(set_pageattr_masks(pgd_val(val), walk));
> +		set_pgd(pgd, val);
> +		walk->action = ACTION_CONTINUE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pageattr_p4d_entry(p4d_t *p4d, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	p4d_t val = p4dp_get(p4d);
> +
> +	if (p4d_leaf(val)) {
> +		if (WARN_ON_ONCE((next - addr) != P4D_SIZE))
> +			return -EINVAL;
> +		val = __p4d(set_pageattr_masks(p4d_val(val), walk));
> +		set_p4d(p4d, val);
> +		walk->action = ACTION_CONTINUE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pud_t val = pudp_get(pud);
> +
> +	if (pud_leaf(val)) {
> +		if (WARN_ON_ONCE((next - addr) != PUD_SIZE))
> +			return -EINVAL;
> +		val = __pud(set_pageattr_masks(pud_val(val), walk));
> +		set_pud(pud, val);
> +		walk->action = ACTION_CONTINUE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pmd_t val = pmdp_get(pmd);
> +
> +	if (pmd_leaf(val)) {
> +		if (WARN_ON_ONCE((next - addr) != PMD_SIZE))
> +			return -EINVAL;
> +		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
> +		set_pmd(pmd, val);
> +		walk->action = ACTION_CONTINUE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pte_t val = __ptep_get(pte);
> +
> +	val = __pte(set_pageattr_masks(pte_val(val), walk));
> +	__set_pte(pte, val);
> +
> +	return 0;
> +}

I was wondering, now that we have vmalloc contpte support,
do we need to ensure in this pte level callback that
we don't partially cover a contpte block?


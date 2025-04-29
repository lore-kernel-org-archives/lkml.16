Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04FF26ACD;
	Tue, 29 Apr 2025 20:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745957642; cv=fail; b=bb5stX3ByajXAfNFotpMlQN2EpIsmJFGg3qeq9PQtxJWzzjCkpQl8/ea7GFMcf0oQovMxMtoS3qvYxEXJN0RkTd5AqrXOwJT3jNgdBIX+w+aeFcQSubqcMMcEXHlsormQqDDvUVOJynhmKcLJjU6I8y+KF/a1P4dbnByX2+A1KI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745957642; c=relaxed/simple;
	bh=pAPt4ijRWyMYK+8+7PQGW7iR74MMRzVj2SFzIBZGFtE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H2CCBkfsU+ifmAKb9EB8YA731i3EOMFNG14amvnhLy2qFnhLkuM45qrIckeB23RATejizM801NbZ+0ZnD2OILV9ZT5/kOz29NIDECzJncNSSqJNXSLMMm5zuAXNAFNiHbLGgbLwBQh2ZLb7tXOclwbHcr0gFWa5DMp9HL1rknGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oXIPjgbl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=b1suL1PG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oXIPjgbl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="b1suL1PG"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TJq5DM032052;
	Tue, 29 Apr 2025 20:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=G3NU3IrMvtBl7kR00DBfEMj2vKPyWV51G+ACZt3OLMg=; b=
	oXIPjgbl/Tv69cp1+VIyCNwyUriP48xAhkMsb5oJ+zbsqfQsHl5rtz81RAgCIIvF
	uPdMAWrmA3JoE9ZQ/HHqKjgsUd1lILjuKboivTvflRumSDzc/4HS8oOz0rQzA5A5
	hAqpWWzovV0HcewbBAsw1uPljbcS0yKRG1cZOPQuUkPkQF5UNuSGH2iestWpU+ls
	4CEoQaFEt/fOjKfguKF7LdXcoYy/3LAoG4X15rgasUz62ilAZi0sRFaoGlu1Xa9x
	h/0/H96Itu9fMa9StlRoLV0El9ZpfqRWmbZGN9Yu5q9dU3UAYF/HJz+7eMoW86Cv
	NfPM8WVG3k+kpOclr56wRQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b5a3r17h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 20:13:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53TIUMIG035447;
	Tue, 29 Apr 2025 20:13:43 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazlp17011030.outbound.protection.outlook.com [40.93.14.30])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxa5fhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 20:13:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlXmu4ZRPiAZ+uAXOyQrtnRPVxy7bFZ1VyqYdRwvptmeGSmY1kkRYWW1cTS+DE9ZymBYZBxuNFnJX+Cmya/YbGctXAIPSc+/Vf7xpinGH6cV17+yMaPAvkDV/Dlef5euMp4c3SR76oUJ1gTA4SUS8hwZVc/w+MAj4eYiTbn6KBwW9s8bjKGuetBFbwLOVVQVNALs93wirhd5Ph+5XyI+NvQqLDKYn9hD7p6GNibiS6M9Oo1gHrth2gFCj/Nt8rRP87xVIzhNjk/vzdDJ7WsGn01Uh0itS7nJ0OPbKuyMnQbTpOvh6PXXGW+cFNU2XMWmWMBGefifVMFAXD5LI39AHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3NU3IrMvtBl7kR00DBfEMj2vKPyWV51G+ACZt3OLMg=;
 b=GMhuGLC01yAQ1VbWS5AuUHY3joX4sUErRoVX/RvQdj2hqtaqqGe0sT9cEe7Z1EVJxFSw+YIgjbZuyASDgSHEvJrRlDmpz1xVl9RxokoTF4/oJ3B8OqoL+dL+4RUeAKcIuXkb7u0nlZ7VK6apoDHBlLryo3jbgF9IQcaaLe3QDQ0wcyUsiTzRu5ytacd2fGpMYF2rrV7mTvWZaoFMap8g4xtnMP4eo2ko1Whc6YAHzbvOt/on2IyUXahOp1w5pnAIk9p4B3GHvkvagRGm8dpCegSA2AdYMS8KGkiLVdARmJFkCMQNEqjhjWDBsazQDNEDAawYSYMB+MtHAcx34tNuNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3NU3IrMvtBl7kR00DBfEMj2vKPyWV51G+ACZt3OLMg=;
 b=b1suL1PG5LbNhvq36XC3xx+Btr5TcDRkeEE7vaAydG3bqq8QTUAMbWdRfE1ghwVzA7RMUvszgI9wG302wZqhPsL+1HqsuSm5x5j00/+44Gaxhmok9pVswMZQ2iF3fEZGABZ8W2TXKZzj01bsLcmW2yRugrYz8yfIFXbsq61otyY=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by CO1PR10MB4595.namprd10.prod.outlook.com (2603:10b6:303:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 20:13:20 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 20:13:20 +0000
Message-ID: <625dd9b6-0015-4ced-8659-66755695ecd6@oracle.com>
Date: Wed, 30 Apr 2025 01:43:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] platform/x86: Add Lenovo WMI Other Mode Driver
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
        Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>,
        Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
        Mia Shao <shaohz1@lenovo.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
        "Cody T . -H . Chiu" <codyit@gmail.com>,
        John Martens <johnfanv2@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250428012029.970017-1-derekjohn.clark@gmail.com>
 <20250428012029.970017-7-derekjohn.clark@gmail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250428012029.970017-7-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0108.apcprd02.prod.outlook.com
 (2603:1096:4:92::24) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|CO1PR10MB4595:EE_
X-MS-Office365-Filtering-Correlation-Id: df9be8fc-0c89-4864-f06a-08dd875a48db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWl0RWxOdnA2dDUxWWpoQ1crTWFEUHdCbXFQazlSYk1IU1M0UWZ2Z2lMNkgw?=
 =?utf-8?B?VDd1bnZsU3Mzalh3Z0k2K0oyRVozK3RTRE1KWFNYcFQ4M1hNT01Nd050TFhx?=
 =?utf-8?B?VVRGNnoyTVZ0QmNnMGJEVVU2SkJhdURSRTVXcFlOdUE2QUROOUZaN3FNNWFh?=
 =?utf-8?B?VC83SFdnc2VVVmdSQUFWZXUrMEIrMC9iOUFYY2tRNGZMeGpvaS9yVzZYQ0Jy?=
 =?utf-8?B?Z2x6d013cG9TWlBCM0xWMzlubGpIWVdxSUI5NGpnQ1h3b2hYYmtMRlRrVU01?=
 =?utf-8?B?M0VVQVdDSWNPcDBOSXRFejFrdkxOc1RiQnczMFJqRExKRnMwWnJsWUVzQ2ZF?=
 =?utf-8?B?N2NDMGdFTDlwNEN1dmlYeTZROG1BbW14SUFzeisrMlFxVkNPT0xuV09HOGNs?=
 =?utf-8?B?WElzalR6Sk1kQzJnSno4c0t2VjJWTDAvK0RHRTUxRlpZRGx5MUF5b0VySHNl?=
 =?utf-8?B?VVlmQzFPMC9POHp1UFFpMC9aTmFjbjhEbjJodFgxbEw5a0ZWOFI3N2EzdGpm?=
 =?utf-8?B?ZVBKUG0wU09jOUlHbDZkYVpGUlgrbzJzamR4VnJVM3JjdjdZMnRTK1lOdklF?=
 =?utf-8?B?emlZNWlGVlVxZG1Ha0lWMWxNSTFWM3RlMlNPVFFvSUsrWXFoRW51OWxVd2ZF?=
 =?utf-8?B?bEpiRmtxKzVuRTVYNis1eU9RSDRFTDJPL2FSaE9vNllGalVONldIUlVSMlNE?=
 =?utf-8?B?UUtJRWY0dE1BbXB5Qk55SEdteWpsOFUzNFR6aXlUWndhZkRVNjhZY2VpZStX?=
 =?utf-8?B?ZXNHbUZKZktBcVd2QjF6NVJEK2Jqb2ZhZjRIZTBxdjJZdVpNaDcxZTNmanZB?=
 =?utf-8?B?ZjJ0emZXZ0gzajE2a0lZSmhBNTBpNVFlR1BSaERNTlhHbFNaQzc4c25MRVRi?=
 =?utf-8?B?M0FGNTRzWXlMb3JPWTFjTDNZeFBnZjRnUGhtYVJCQ1B6eDlqRjIrUWVzMTJS?=
 =?utf-8?B?VUx0WUNpU2dBUlNnK3JPNE9SczNYWHhDWFdZWFI5ZGd5a1NZTFV2NjhEaG1w?=
 =?utf-8?B?Qm9qR3IrOHVXUFV2YjFERGhJTU85WUVkSnpabTdHU1A4VlhIOHVOSWozZGdm?=
 =?utf-8?B?THlRalNjZmlkdXAybU8rdW9EYU9mNFcrWnZXSXdnbU9xakEwcG5CS1BuR1Av?=
 =?utf-8?B?c1UrZ1ZFRy9yYnRHQUo1R1VDaExJc1ZLeCswTGora1JkV0RDMFlOWWRvcmxC?=
 =?utf-8?B?UnFjQS9Fa1FwTHRNTWJRT2taWUJiaFlBWjE3T2FYN2thVDc0UFpsUlZkZ3Q1?=
 =?utf-8?B?UjViMXEvTFpzTTFIQW8vbkZkMzVFS2tnaEhDczQxQjlYQTU2U2pGT3M3Yms0?=
 =?utf-8?B?QTRwT2lvQ0p3ZUNNZGJVSTNTQTNFMU0rdFNRVFd3Z2s3L2pBWDcybDIwTnQ1?=
 =?utf-8?B?ZnVESmhVSjlMd0FmbUFscU1oL2NCdDNCQWpuRnJKUHdCRGpXUDZLQXFPc0c1?=
 =?utf-8?B?MzFoQ2xSV3pHRURSTUwvRGZQbUUyWjhYbWwrUWhEcUxvUjY5N2lTcmZTbFI3?=
 =?utf-8?B?QXBHNkV4T1pITFpQT2lwZmVmelE1VUtaTWJNS2pIRi9aTnRQQmE1eEtDSDR0?=
 =?utf-8?B?b0lLTGFqUU5SMXc0bEp0T3JmRTBQM3lweDJyMGdDb3l6eW0zTjhLRWJzdjRM?=
 =?utf-8?B?cUNRcjk5Qll6M3J1VmpIdFpLcVFLcndhSmlJUmpGWnNZOGJEeGJza1NmamMz?=
 =?utf-8?B?Y3NqMmdTSk91VXZ3ZWdPd0I0RzR6aXJTNTUwYnE0OEdITUNLeWZzOHZHYytN?=
 =?utf-8?B?cXVlaHJoVjdSWU90dlcwUi85Vlk5bVAycVB6L2xvSVQ1anlLUGFzQi9hanhB?=
 =?utf-8?B?OEQ0aXJpeW5uMHFNcFBsams5dDZodUlBeHlOR0NYMExWTVNLdkJTbHlnSXV6?=
 =?utf-8?B?NkdoRWp5d3BTQzlTWGtSVlNkRWxqTmlaZ21HeHpGNlFxY1R2ZURIVEo5R2R5?=
 =?utf-8?Q?VqQ9ZB/lM/8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aklWMW1ESnpHWTlKYmFUcGFMV01lRzVDa1ByVWp2WCs3V3AraVFJd2ZXaWd4?=
 =?utf-8?B?dVpTbGh5a3U3QnpnZStGTXh6MERsVUZab0NlMjVLWWhpSFFEVDhSZGhwTkZq?=
 =?utf-8?B?VmROcTY3L3ljRE9NT0lGdFE5dS9YTEE5MkVrYzZMMmNxMTRHc0VVdExzWmgw?=
 =?utf-8?B?dWU3TnNkZUJTeGNDOURibTk0YnowTkF3ZlJYZWhPOVVpMkZRVmhtYjUvSTJY?=
 =?utf-8?B?ZWRybHJQUFRaaU1ZRWsxYy8wdlBTQWZ2dno0R3UvYVFxKzBjZXYyZE5KcFBD?=
 =?utf-8?B?OGJwSzQ1Y2JoSzZuRHhwaXRpeFJVOXVzK3RxQjhpVWdzcE91SDNrY3hHUnlI?=
 =?utf-8?B?RGhqUDMrU3dHbXNXWjBOcHJLS2wwQXVPNDl2NmRJd3lDakhIU2V0WGhMZThF?=
 =?utf-8?B?R21heHRrTFV3Y1lhSW9TcFcxb3BNMHdvK3pWbUxtSkFaUlJNcnFOMnFBWjFX?=
 =?utf-8?B?VUNGVkZPUFRCejdEM0JyWkhYWktLbU1CQ1p5U0ZEVndDMTF5RFkvWkM2YU5j?=
 =?utf-8?B?b041ZW53VUQxdXVSOXYzVHRjUXhsSlNBUkN2Q1Ztd0U5THcwVHRidzRXSEQ1?=
 =?utf-8?B?ZEcrMmtpS3h0Z3N6VDJjVGRyaFcyODY2OGlpL2tMdUJXQWxidHVITDZiaDVB?=
 =?utf-8?B?OGNKeW9LOGRhaW5QZ0hQUFNWRXVnOHMrVlhrZk13Kzk1MEt0dDhpdGZKWWlE?=
 =?utf-8?B?TFc1SDJEWWt5YW4yS1lub2hPTXJhbG1EOE9wbFZjTVF3d29USUJUeE9kaVdy?=
 =?utf-8?B?cmNJdWhiamxOd21lSTNKWmtnSkxtZHhQVkZ4SFQ5Z0NPbWNNTlprWHBNdWl5?=
 =?utf-8?B?NEVUOXFENDVVbFd5dnFWUVloOVhCTTVkelZmQ2hQM2hRS295WElBTnJyVjFx?=
 =?utf-8?B?dmJFNnhrRXpUUXVJSmxDOVd5dlJsbVlqYVFKb0U0Z3M1MnNzUnZUUmxqSUdl?=
 =?utf-8?B?T1VYcHZqRTlwVmRYS0dPNmc0dGNxMVg3QUxvbFAvdC8zZkFPUWhIL2dhZXg3?=
 =?utf-8?B?a25UT0lPVzd1cjNjUHJrUDFWTHpPS0pkSERUelRsYm5jMUhYcE9aU0wrek1w?=
 =?utf-8?B?bkhGU05qYmQ1ODhBMC92TGo1bU4rZlJkYVZPNE1wZHc3RFVqWE1hbG4rYW0x?=
 =?utf-8?B?Tm53UlBGdlFwSTlsSm90dU81UGlBdSt4RFlBNjd1Z0dEWmV3NEJ4Ylc0QTJj?=
 =?utf-8?B?SjlMY3dhV3JITGhLZU00RHFXUTBkdGl4bzNXRmtiRVBRaHIyVVZmYWc3TjNP?=
 =?utf-8?B?KzRLRW9OcCtpWWF5akxPSlVabXZmT0FRKzlJS2RreXpKQklLZTEvZm1MYjhJ?=
 =?utf-8?B?SGc0dzVaaGhxSmVpcWVHQkRnOGxveld4Q3VQTkVVQVE4djFobnkxQkFveG5P?=
 =?utf-8?B?S3o4NlhXekZ6Y0Y0K3U4dHhGbkxyMkJwbWxkN25Mait1TnhwLzJDR2FJNGRa?=
 =?utf-8?B?eUI3RkZ6UlN4NHBleUxnM0k4enN2SlF4Q1dsVzRxOGVlRXFZRHVCR3huUjZK?=
 =?utf-8?B?ZnlkT1Z3VGZXK2hGdHRyWjIwcXl3TmJtT3dKM0c1MWNQU1FDdGs2b1hhcDJt?=
 =?utf-8?B?bDNKR2dRc0VlRkQvcVk3N1psY0luWGFMK0RmUFN4OGJtYU9HWXYvT3FIdS90?=
 =?utf-8?B?cHVMM0pjY2pmOXJ2T0VQYXIxeitvT0RUczJYRkR1bmFFc05mS09TK1U4WkRl?=
 =?utf-8?B?UEl4VjIxNmwrM2NrUXJqTTdONXNsL1BzWDRCR0NJcDFYOGd0NWNvSHJsd2RY?=
 =?utf-8?B?clJTOWVHRll3UUlPMkFTZHpHcjdWcmN3ZTdkaUtMdTBvLzFhVFV5WDdvaXQ2?=
 =?utf-8?B?cFNJSTRQMFBKMkx4SHV1UTkwZi9tUHEzbTA2Ui80T2dabnFKWklVcHdVeEE2?=
 =?utf-8?B?VmNhS2hkMTlBbzZEUTNSc1E2dmMxcjBsMk8zN3Q1UkplK2VUNVBuVmgzTGFm?=
 =?utf-8?B?SXdqR3NRcGJESW1LeHF2ZCs1dDc3elBkY0NCK3lITzJUc2dwTlVJRWZmTmlv?=
 =?utf-8?B?b0V2M09UclZhbCs0WUUxbWt4TTRUM1hOSURJM3JNZnpNT0todmNXVDhTUElE?=
 =?utf-8?B?OUp0TkNYK29EN1FWcE8zeFVGN2szZTlTclRNREdjK2Y3WHIzZU8wQTJ2Q0pF?=
 =?utf-8?B?cFNaYkN1MHgvNmxSZ1Q3dGxBL3liNEIvZlBJRStLYWNsNVErZ05nbGVZQ0NO?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y9bmY4i+NX5CyPlOKZk9HTwmuAONley4alnxNGK1AAWcjUkTqiEJE94uFJHqW71oY5VtDZ/4EEo3MDJ/IvwtZtEw3sB63O3hFWFTi2TNQm9szmN+phEh0M6qoZoXJ67rmYpc7QKPnpWum//wXsNdExzl6Oqwp6zfVtTSfSXeWofRn0kpp92jGZCy/lFP+QfZ9Jn+AVvDCNPLPuAqirnvN9JLxhZ5YZ5hfc1C2wK3aekviGGFO3oEQUe8xW4b77oj9yleaoZMFX+HE+ztLakh12fN2czpguwbC7ITOYUflYZtN23AS9juoeAW5OWJRzyxWFmHoCuxc91TUWGQLDR1mpX/XHZFKLoQcESljhc7TZrj7UZXkGShgd/OzXIRggpVJtXJ2Ua08Rvs9bEhqbDHXc7gUEUgvWZYy2665i6vDGD4W7ZHnAm1SGyrel0MrOFI+VrHJqUL7iUfmfHNqPdTGK4ARdCkq+qdOifwPoWF4V+lVOBLagk/qlgpOaSGwQ3tJhoowDbVeHPEdOxJEpOqe9sS34Xj0vzkklUt0wGRGt3znv45ZNO6x5/bKNkMtZgGonqHAqlhk11zBNJRhFgeRFaOzY9B79QvjckU7pTsmxs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df9be8fc-0c89-4864-f06a-08dd875a48db
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 20:13:19.9150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2LDtE6z86lko51/L5aoZeDaqFSuD1c4U5DbHW5UIhYlIRPdpIrvcg9ckwxwnMxz+188HngUrPgZJj30ztXBg5Te1ABf1Vo2TUk+sITqUls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4595
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504290149
X-Proofpoint-GUID: oLuD8fIcadhS-h0O2DqHxCXMF_OJoi5z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDE0OSBTYWx0ZWRfX3HBmoxSWqOM+ dueFORayMqwuvgWNspGSJqfE1ecx8//vW+Su5E+3TeZ5/WZwHou5OnitLoT8xrnUuVDQ9e6JaWp X2CvYjfWtbUyET+sD2nnr++OtIvRuhdNTrwuRWCen431C9cyqi7edar9CjZMYGvCeIbqgfdz6/E
 iJxfUakor2mCzk2dUtPYYyqc9hl9BbVJ8h4Yu7x1E3ENda2gz7PmdkAPJ21sLZb3OGA652erEF9 XhtghoPWvUlIC5wujr9ARsErB96iyKJK4HJsr8vqaUBYzVdRf5ML7gqhe+2K1SEk7DToQ4P+Ghz qYGBF4WBJzO/Rqnd/d9apuVT2LoRjipPnltCOOYrGhFxdRmxxZK9F9gSmLiORIvzxSKKs1yE34z hQlu2w0q
X-Proofpoint-ORIG-GUID: oLuD8fIcadhS-h0O2DqHxCXMF_OJoi5z
X-Authority-Analysis: v=2.4 cv=fO853Yae c=1 sm=1 tr=0 ts=681132f8 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=mAfOFuHhF6l8wEcQ58cA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14638



On 28-04-2025 06:48, Derek J. Clark wrote:
> Adds lenovo-wmi-other driver which provides the Lenovo "Other Mode" WMI
> interface that comes on some Lenovo "Gaming Series" hardware. Provides a
> firmware-attributes class which enables the use of tunable knobs for SPL,
> SPPT, and FPPT.
> 
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> +++ b/drivers/platform/x86/lenovo-wmi-other.c
> @@ -0,0 +1,655 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Other Mode WMI interface driver.
> + *
> + * This driver uses the fw_attributes class to expose the various WMI functions
> + * provided by the "Other Mode" WMI interface. This enables CPU and GPU power
> + * limit as well as various other attributes for devices that fall under the
> + * "Gaming Series" of Lenovo laptop devices. Each attribute exposed by the
> + * "Other Mode"" interface has a corresponding Capability Data struct that

typo "Other Mode"" -> "Other Mode"

> + * allows the driver to probe details about the attribute such as if it is
> + * supported by the hardware, the default_value, max_value, min_value, and step
> + * increment.
> + *
> + * These attributes typically don't fit anywhere else in the sysfs and are set
> + * in Windows using one of Lenovo's multiple user applications.
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
[clip]
> +
> +/**
> + * lwmi_om_register_notifier() - Add a notifier to the blocking notifier chain
> + * @nb: The notifier_block struct to register
> + *
> + * Call blocking_notifier_chain_register to register the notifier block to the
> + * lenovo-wmi-other driver notifer chain.

typo notifer -> notifier

> + *
> + * Return: 0 on success, %-EEXIST on error.
> + */
> +int lwmi_om_register_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&om_chain_head, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_om_register_notifier, "LENOVO_WMI_OTHER");
> +
> +/**
> + * lwmi_om_unregister_notifier() - Remove a notifier from the blocking notifier
> + * chain.
> + * @nb: The notifier_block struct to register
> + *
> + * Call blocking_notifier_chain_unregister to unregister the notifier block from the
> + * lenovo-wmi-other driver notifer chain.
> + *
> + * Return: 0 on success, %-ENOENT on error.
> + */
> +int lwmi_om_unregister_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_unregister(&om_chain_head, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_om_unregister_notifier, "LENOVO_WMI_OTHER");
> +
> +/**
> + * devm_lwmi_om_unregister_notifier() - Remove a notifier from the blocking
> + * notifier chain.
> + * @data: Void pointer to the notifier_block struct to register.
> + *
> + * Call lwmi_om_unregister_notifier to unregister the notifier block from the
> + * lenovo-wmi-other driver notifer chain.

typo notifer -> notifier

> + *
> + * Return: 0 on success, %-ENOENT on error.
> + */
> +static void devm_lwmi_om_unregister_notifier(void *data)
> +{
> +	struct notifier_block *nb = data;
> +
> +	lwmi_om_unregister_notifier(nb);
> +}
> +
> +/**
> + * devm_lwmi_om_register_notifier() - Add a notifier to the blocking notifier
> + * chain.
> + * @dev: The parent device of the notifier_block struct.
> + * @nb: The notifier_block struct to register
> + *
> + * Call lwmi_om_register_notifier to register the notifier block to the
> + * lenovo-wmi-other driver notifer chain. Then add devm_lwmi_om_unregister_notifier

typo notifer -> notifier

> + * as a device managed ation to automatically unregister the notifier block

typo ation

> + * upon parent device removal.
> + *
> + * Return: 0 on success, or on error.
> + */
> +int devm_lwmi_om_register_notifier(struct device *dev,
> +				   struct notifier_block *nb)
> +{
> +	int ret;
> +
> +	ret = lwmi_om_register_notifier(nb);
> +	if (ret < 0)
> +		return ret;
> +


Thanks,
Alok





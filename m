Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2101.outbound.protection.outlook.com [40.107.215.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EECF610D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 03:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743996102; cv=fail; b=eHE9WwdnJQLWdzWY/malWiFnGeVOw/suxB5ZACISU+UXGrI1ZGd8pJMUuPb0558Y0jKxYCc22b1lGraCBJt+1Rnbc46tMIAOp9dMNg22IyMdqj0Y75konXWnF2XcBvW8WrxAWNTVHY9HtzZZfBWs1XtYzpHOHVBRShWRc8vjNOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743996102; c=relaxed/simple;
	bh=jqsYKBGyVtmDx6cgzSMFwZD//EqFovfrTdBB24qI98g=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bVUnGMTU0QxrNMTZr0bzPzNtgkYtuOz+pt8NSz4xyHzUe1f44SDuWEo8jzKJXk3vqARVd0K7JKxgrsJDC9VkWqRROry55KmbxJBs1t4ieM4WJhQG2pBoaLvbkk6z1IAMqFN6zlZHpJ3tLf0u6a2tTJ2sQkqiqoVIdXwWUGKicVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=transsion.com; spf=pass smtp.mailfrom=transsion.com; dkim=pass (1024-bit key) header.d=transsion.com header.i=@transsion.com header.b=PM30sKtk; arc=fail smtp.client-ip=40.107.215.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=transsion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=transsion.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=transsion.com header.i=@transsion.com header.b="PM30sKtk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXkWj5fNLpgJfzfAPjirIxvCsxXY4NoX+9M3B7i6y3JnOT78Ch7MnPdJHwyOFEFsO6EYJCCcF2m/uhiugogWEvwA8tDjKWVIpEZKot4puZBq0o+fLl4z3pBH+rl6QCJKLsKYvKFi7MpJ3Nk5vdSQD+hKH3BD1xQG+4wA1MILPevvbTOQpsqrqITauEhdeX+/3G7M/ud2EQFB3HVlHbsmAhAxFEMBaux7fzWIripM8hoeeoNOUIlFiL4Xefq9II03LrtI8FcyWgArZfklpO+IiKyVi2wUGzIrr96CyjI2Y8AXK98FquS0T7BLFI69fBblEk3w7J0tn/3aj1s4duuVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqsYKBGyVtmDx6cgzSMFwZD//EqFovfrTdBB24qI98g=;
 b=v+BRoT+sQx0aY69Yz7Hb+FIYdEcRMhqIwWfBRSvIeFLtn+nzZcVrojivVSwcbzolaThYjOUzrJ0V277uob4ekzdejiKaw/NoAvvn3UcLRwFavc8OoQyAYuFJ8K1RVhcpYGmKr+s2bwBwb6zfLaRD/GvFC5sGNKJegPzI8BioyKTO9IncspRAW6NCzjZZ3VRircTIGOiprF7TIkyaalqDjps2lpfOx57IAuItxkhvXvulOSLPvbctX9RthMpzoPCsORkQADtuzmq1YUXNq7BrDc25Ue/A4GUk+01CByKuNwPvtEw2aZH+lMy3jLI+CsFSzsL5z/RIYigF9sK5jZSkxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 58.246.63.154) smtp.rcpttodomain=redhat.com smtp.mailfrom=transsion.com;
 dmarc=none action=none header.from=transsion.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqsYKBGyVtmDx6cgzSMFwZD//EqFovfrTdBB24qI98g=;
 b=PM30sKtkAwxe5cLKKi+zCvzVqyNq9Oik+JVeElVCjJtVmkeWejVb0H7IVWpp/+AU7WaopdD0US9pd34B+ANMI/jXmS2vz04h1gyAMXILXPtzteIuFWkSVSaWHwJOXmPhv3YKlj7T5kYuWjRaDWIrf4qt5VgCge46F2yRyfqRN2o=
Received: from SI1PR02CA0025.apcprd02.prod.outlook.com (2603:1096:4:1f4::13)
 by JH0PR04MB7536.apcprd04.prod.outlook.com (2603:1096:990:6f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 03:21:33 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:1f4:cafe::f5) by SI1PR02CA0025.outlook.office365.com
 (2603:1096:4:1f4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Mon,
 7 Apr 2025 03:21:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 58.246.63.154)
 smtp.mailfrom=transsion.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=transsion.com;
Received-SPF: Fail (protection.outlook.com: domain of transsion.com does not
 designate 58.246.63.154 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.246.63.154; helo=mail.transsion.com;
Received: from mail.transsion.com (58.246.63.154) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.8632.13 via Frontend Transport; Mon, 7 Apr 2025 03:21:32 +0000
Received: from SH-EXC-MX06.transsion.com (10.150.2.44) by
 SH-EXC-MX03.transsion.com (10.150.2.43) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2507.44; Mon, 7 Apr 2025 11:21:30 +0800
Received: from SH-EXC-MX06.transsion.com ([fe80::954b:3df8:a403:9ca3]) by
 SH-EXC-MX06.transsion.com ([fe80::954b:3df8:a403:9ca3%12]) with mapi id
 15.01.2507.044; Mon, 7 Apr 2025 11:21:30 +0800
From: =?gb2312?B?eGlhbmhlLnpob3Uo1tzP1LrVKQ==?= <xianhe.zhou@transsion.com>
To: "mingo@redhat.com" <mingo@redhat.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "juri.lelli@redhat.com" <juri.lelli@redhat.com>,
	"incent.guittot@linaro.org" <incent.guittot@linaro.org>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
CC: "dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "bsegall@google.com"
	<bsegall@google.com>, "mgorman@suse.de" <mgorman@suse.de>,
	"vschneid@redhat.com" <vschneid@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND] sched: Fix incorrect runnable time calculation in
 sched_stat_wait tracepoint
Thread-Topic: [PATCH RESEND] sched: Fix incorrect runnable time calculation in
 sched_stat_wait tracepoint
Thread-Index: Aduna6yc9WP8s4RtTTy3MbaASRKX2g==
Date: Mon, 7 Apr 2025 03:21:30 +0000
Message-ID: <b2da09b0aca542cc812bd4959f773e55@transsion.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|JH0PR04MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: af7f37fb-fd0f-4165-6300-08dd75834b70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?gb2312?B?STkxcUljVndzQ2x4RHhUaG9sMWlncW1IK0Z5V0svOTFKQ3dwTmpxdmJ5RUZC?=
 =?gb2312?B?eXp6enhnTG9nVnV2MXZwL3NXM2ZSR2pXbXFFcmdDTDFUaEsvODA5aUhhTVVu?=
 =?gb2312?B?eGRBa3RiL2NNUnZxTEZKeUUvdmxqM3ZjZmV2aU9xUlA2Tm5aNnpUSjFzMWxl?=
 =?gb2312?B?Z05CZmhYKytBS3ZseGdjR2pGVVZXdnJkTGZFWTJIZXZaOU5JdmdVUEdOSytj?=
 =?gb2312?B?cElHdHEvaFB0Y1dTdGd6ckdhYVVwL2FyRHFhWVQvRFpFMTZJNTFLR1hUR3M2?=
 =?gb2312?B?bHVIRHVhSnBKdXlGVmxCUi9oMlhZczZ6Z1hHblVFTVArZzhsV0RGSWp6aUZh?=
 =?gb2312?B?bGd2YzlTR04zZndiN1RoSlRhWE0vZENKRVpETjdNa3lpYXh1cm12dmtyVXZr?=
 =?gb2312?B?bzU2UnhTNnpGU1FZS2MvR0l6WlU0RWlsOVJCbkN5QnNvVWFRQVJNakNwZTY1?=
 =?gb2312?B?L3NIQXlWVisrOHN1VHp4MUw4WUFoSUJJTVBDT1pYWUlnT1NnT1VtelowNDY5?=
 =?gb2312?B?UjRaTXV2QkhUTFArUnhRWEhoQjMrL1lUNnBuUnhFWm5XdnVTTCtsdjliYkpI?=
 =?gb2312?B?NU05VHV6aXhXUW1RUFA4aWlydHBqeXdVb0ZQM3JqeC80RXA4WHN2d0VONnJk?=
 =?gb2312?B?T2JjY3dmaml1VlBSOVpwQjdoR01vYWtaa2ovREFiZDNkOUFpWUZyZDZFQzE5?=
 =?gb2312?B?a29HYmZtSXBaSVhQZVVlSUFMZGFPanA1dVRCK0pBODhpWC9YWFltaE9ITUp4?=
 =?gb2312?B?bE9FcGxRNjBMSGozSG83WTNIS3ovRi9Bb2V4cEdDRVE0c0tEdG5UQ0QxY05V?=
 =?gb2312?B?VUYvc1NPWnprNkJZSHBzWWdaV2ZEUlBtSGlRTWdwUjRmUS82c3BZbnBxdmxC?=
 =?gb2312?B?MTVDSEdVWXNOMHcrU3loNldwajNqL0FOMWZ6bXRMVU01WVRBS2sweWczMUNv?=
 =?gb2312?B?SU9qODRJdHdWU21YNWhSUXFHYVgvVVh5dktNY0lMS0xxWHZidXY2YmszNGFy?=
 =?gb2312?B?V2J1NUtvMVp6d2hnTWhvN09UQXdrSmFTRE45cDBjc25NVytMTFcxcFFqWXlD?=
 =?gb2312?B?NHIwQ3BMT0tQVm03MnJHNzBOcDhJMDBNb3VheGxqM3FVb0RaQ0t1VmtwbTFR?=
 =?gb2312?B?QVg2VlhtaFdkdU5LY3BCWHBGR1haaXBvSE1yL3J0UVpuK0IvZ2xJSlpCMi9J?=
 =?gb2312?B?Nk8xSHpGMExMNmNoT0ZnaTVUWW5kNVFzRnMzMVJrNktkVkQvY1I4Y1R5bUlq?=
 =?gb2312?B?NDhodmQ5RWtkb3p5VjFuUEFJNnBjaVNVRFFQSHNERFg2N1JUVEFjczBvZm1a?=
 =?gb2312?B?Kys3cUtQNEl0Y1Z6VHdRVEN3SmVPV1Q0ajFYL3c1cmNybnJ6TkhLREp1a3M2?=
 =?gb2312?B?S01VbTVoQUhZZjhKRVNCTTBqdjMvOUMxYk9NU1ZWTndJYXAvdkUzTnBrYzVu?=
 =?gb2312?B?NE9GQ0xhMWFMdmoyS1lRT2hWWmxtSkZxam9mQXpSZWJTVUM3K3orMkNxd3Uv?=
 =?gb2312?B?L3E5TGt4YnRld0ozUkwrMDQxTjAzU3J3V2dDcEdMbHl0OXJPc0RubG1LTGsy?=
 =?gb2312?B?dHhOT0xIeEF6RUs2a2kwWnhMRjBNTUd6WFEzaDdmbnZKK0NuRWxMbkljWXNX?=
 =?gb2312?B?U0c5ZWlBU2FFeGFXb1hMYU44YjE5ajlIdGpPalM1dVBmZzlyenM1azB1QmJM?=
 =?gb2312?B?OFhGOVBSdE1jenk5RjFzdWpieUpUeSt6SW5tckpRMVRPUGFwMHMyVExOWnpZ?=
 =?gb2312?B?VmJtdithSzZHejFmQlNCaUs3NEVuakxJREc2ZllIY3ExS2Rvb01oTDl2UWMx?=
 =?gb2312?B?a1JiY1pEdWpMNCtZWTQ4c0hEMFd3MHVPMkhuUzRTR0ZIcThjelhpSlpaUHE5?=
 =?gb2312?B?SDBrajUvdENneVZCak5DT0JlK1JsRU8yQlJxc0xZcnNub2o1UDBQRzdnMkVu?=
 =?gb2312?B?WVc3NTR4SnBibDI5K3hBNVFXMmk2TGtaMTJVQjNHMGFCYklTSnFiWjUyUFov?=
 =?gb2312?B?YlpvZHZLTEFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:58.246.63.154;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.transsion.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 03:21:32.1113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af7f37fb-fd0f-4165-6300-08dd75834b70
X-MS-Exchange-CrossTenant-Id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2;Ip=[58.246.63.154];Helo=[mail.transsion.com]
X-MS-Exchange-CrossTenant-AuthSource:
	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7536

RnJvbSBiMDdkZjNlZDNmZDIxODZhNjk4ZWY4N2FkMzY2NTIzZWM3YzdmY2NiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogInhpYW5oZS56aG91IiA8eGlhbmhlLnpob3VAdHJhbnNzaW9u
LmNvbT4NCkRhdGU6IFRodSwgMjAgRmViIDIwMjUgMjI6MDE6MjYgKzA4MDANClN1YmplY3Q6IFtQ
QVRDSF0gc2NoZWQ6IEZpeCBpbmNvcnJlY3QgcnVubmFibGUgdGltZSBjYWxjdWxhdGlvbiBpbg0K
IHNjaGVkX3N0YXRfd2FpdCB0cmFjZXBvaW50DQoNClRoZSBzY2hlZF9zdGF0X3dhaXQgdHJhY2Vw
b2ludCBpcyBpbnRlbmRlZCB0byByZWNvcmQgdGhlIHJ1bm5hYmxlDQp0aW1lIG9mIGEgdGFzay4g
SG93ZXZlciwgZHVlIHRvIGluY29ycmVjdCB0aW1lc3RhbXAgaGFuZGxpbmcsIHR3byBtYWpvcg0K
aXNzdWVzIGFyaXNlOg0KDQoxLiBUaGUgdHJhY2Vwb2ludCBtYXkgaW5jb3JyZWN0bHkgcmVjb3Jk
IGNvbnNlY3V0aXZlIHN0YXJ0IHRpbWVzdGFtcHMNCiAgIG9yIGNvbnNlY3V0aXZlIGVuZCB0aW1l
c3RhbXBzLCByYXRoZXIgdGhhbiBwcm9wZXJseSBwYWlyaW5nIHRoZW0uDQogICBUaGlzIGxlYWRz
IHRvIGluY29ycmVjdCBydW5uYWJsZSB0aW1lIGNhbGN1bGF0aW9ucy4NCjIuIFRoZSByZWNvcmRl
ZCB0aW1lIG1heSBpbmNsdWRlIHRlbXBvcmFyeSBkZXF1ZXVpbmcgYW5kIGVucXVldWluZw0KICAg
ZXZlbnRzLCBzdWNoIGFzIHdoZW4gbW9kaWZ5aW5nIGEgdGFzaydzIG5pY2UgdmFsdWUgd2hpbGUg
aXQgaXMgcnVubmluZy4NCg0KVGhpcyBwYXRjaCBlbnN1cmVzIHRoYXQgdGltZXN0YW1wcyBhcmUg
cHJvcGVybHkgcGFpcmVkIGFuZCBleGNsdWRlcw0KdGVtcG9yYXJ5IGRlcXVldWluZyBldmVudHMg
dG8gcHJldmVudCBpbmNvcnJlY3QgbWVhc3VyZW1lbnRzLg0KDQpUZXN0aW5nOg0KVGhpcyBpc3N1
ZSB3YXMgdGVzdGVkIG9uIGFuIEFuZHJvaWQgMTQgZGV2aWNlLiBUaGUgZm9sbG93aW5nIGFyZSB0
aGUNCnRyYWNlIHJlc3VsdHMgYmVmb3JlIGFuZCBhZnRlciBhcHBseWluZyB0aGUgcGF0Y2g6DQoN
CkJlZm9yZSB0aGUgZml4IChpbmNvcnJlY3QgdmFsdWVzKToNCg0Kc2NoZWRfc3RhdF93YWl0OiBj
b21tPU92ZXJsYXlFbmdpbmVfMCBwaWQ9MTUzMyBkZWxheT0zNTI0MTgzMTU4MzkgW25zXQ0Kc2No
ZWRfc3RhdF93YWl0OiBjb21tPU92ZXJsYXlFbmdpbmVfMCBwaWQ9MTUzMyBkZWxheT0zNTI0MDk5
NjE4NDAgW25zXQ0Kc2NoZWRfc3RhdF93YWl0OiBjb21tPU92ZXJsYXlFbmdpbmVfMCBwaWQ9MTUz
MyBkZWxheT0zNTIzOTMzMTc0NTUgW25zXQ0Kc2NoZWRfc3RhdF93YWl0OiBjb21tPWJpbmRlcjox
MTQ4XzMgcGlkPTIxMDIgZGVsYXk9MzUyMzgwNDkzMzc3IFtuc10NCnNjaGVkX3N0YXRfd2FpdDog
Y29tbT1PdmVybGF5RW5naW5lXzAgcGlkPTE1MzMgZGVsYXk9MzUyMzYwMDMzMzc3IFtuc10NCg0K
Q2xlYXJseSwgdGhlc2UgcnVubmFibGUgdGltZSB2YWx1ZXMsIGluIHRoZSBodW5kcmVkcyBvZiBz
ZWNvbmRzLA0KYXJlIGluY29ycmVjdC4NCg0KQWZ0ZXIgdGhlIGZpeCAoY29ycmVjdGVkIHZhbHVl
cyk6DQoNCnNjaGVkX3N0YXRfd2FpdDogY29tbT1rd29ya2VyLzc6MSBwaWQ9MTM2ODIgZGVsYXk9
NjM1MTY5MjMgW25zXQ0Kc2NoZWRfc3RhdF93YWl0OiBjb21tPVN1cGVyQV9SWzEzNl0gcGlkPTE1
MDc0IGRlbGF5PTUxMzI0Mzg1IFtuc10NCnNjaGVkX3N0YXRfd2FpdDogY29tbT1TdXBlckFfUlsx
MzZdIHBpZD0xNTA4MCBkZWxheT01MDI4MDUzOSBbbnNdDQpzY2hlZF9zdGF0X3dhaXQ6IGNvbW09
U3VwZXJBX1JbMTM2XSBwaWQ9MTUwNzEgZGVsYXk9NDg5OTU2OTIgW25zXQ0Kc2NoZWRfc3RhdF93
YWl0OiBjb21tPVN1cGVyQV9SWzM0XSBwaWQ9MTQ5NTEgZGVsYXk9NDE4NzYzMDggW25zXQ0KDQpB
ZnRlciB0aGUgZml4LCB0aGUgcmVjb3JkZWQgcnVubmFibGUgdGltZXMgYXJlIHdpdGhpbiBleHBl
Y3RlZCByYW5nZXMuDQoNCkZpeGVzOiA3NjhkMGMyNzIyNmUgKCJzY2hlZDogQWRkIHdhaXQsIHNs
ZWVwIGFuZCBpb3dhaXQgYWNjb3VudGluZyB0cmFjZXBvaW50cyIpDQpTaWduZWQtb2ZmLWJ5OiB4
aWFuaGUuemhvdSA8eGlhbmhlLnpob3VAdHJhbnNzaW9uLmNvbT4NCi0tLQ0KIGtlcm5lbC9zY2hl
ZC9mYWlyLmMgIHwgMTMgKysrKysrKy0tLS0tLQ0KIGtlcm5lbC9zY2hlZC9ydC5jICAgIHwgMTUg
KysrKysrKysrKysrLS0tDQoga2VybmVsL3NjaGVkL3N0YXRzLmMgfCAgNyArKysrKystDQogMyBm
aWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCg0KZGlmZiAt
LWdpdCBhL2tlcm5lbC9zY2hlZC9mYWlyLmMgYi9rZXJuZWwvc2NoZWQvZmFpci5jDQppbmRleCAx
YzBlZjQzNWE3YWEuLjM3YTMxNWIzOTA2YiAxMDA2NDQNCi0tLSBhL2tlcm5lbC9zY2hlZC9mYWly
LmMNCisrKyBiL2tlcm5lbC9zY2hlZC9mYWlyLmMNCkBAIC0xMzMxLDExICsxMzMxLDEyIEBAIHVw
ZGF0ZV9zdGF0c19lbnF1ZXVlX2ZhaXIoc3RydWN0IGNmc19ycSAqY2ZzX3JxLCBzdHJ1Y3Qgc2No
ZWRfZW50aXR5ICpzZSwgaW50IGZsDQogCWlmICghc2NoZWRzdGF0X2VuYWJsZWQoKSkNCiAJCXJl
dHVybjsNCiANCi0JLyoNCi0JICogQXJlIHdlIGVucXVldWVpbmcgYSB3YWl0aW5nIHRhc2s/IChm
b3IgY3VycmVudCB0YXNrcw0KLQkgKiBhIGRlcXVldWUvZW5xdWV1ZSBldmVudCBpcyBhIE5PUCkN
CisgICAgLyoNCisgICAgICogQXJlIHdlIGVucXVldWVpbmcgYSB3YWl0aW5nIHRhc2s/IEFuZCBp
dCBpcyBub3QNCisgICAgICogYSB0ZW1wb3JhcnkgZW5xdWV1ZT8oZm9yIGN1cnJlbnQgdGFza3Mg
YQ0KKyAgICAgKiBkZXF1ZXVlL2VucXVldWUgZXZlbnQgaXMgYSBOT1ApDQogCSAqLw0KLQlpZiAo
c2UgIT0gY2ZzX3JxLT5jdXJyKQ0KKwlpZiAoc2UgIT0gY2ZzX3JxLT5jdXJyICYmICEoZmxhZ3Mg
JiBFTlFVRVVFX1JFU1RPUkUpKQ0KIAkJdXBkYXRlX3N0YXRzX3dhaXRfc3RhcnRfZmFpcihjZnNf
cnEsIHNlKTsNCiANCiAJaWYgKGZsYWdzICYgRU5RVUVVRV9XQUtFVVApDQpAQCAtMTM1MSw5ICsx
MzUyLDkgQEAgdXBkYXRlX3N0YXRzX2RlcXVldWVfZmFpcihzdHJ1Y3QgY2ZzX3JxICpjZnNfcnEs
IHN0cnVjdCBzY2hlZF9lbnRpdHkgKnNlLCBpbnQgZmwNCiANCiAJLyoNCiAJICogTWFyayB0aGUg
ZW5kIG9mIHRoZSB3YWl0IHBlcmlvZCBpZiBkZXF1ZXVlaW5nIGENCi0JICogd2FpdGluZyB0YXNr
Og0KKwkgKiB3YWl0aW5nIHRhc2sgYW5kIGl0IGlzIG5vdCBhIHRlbXBvcmFyeSBkZXF1ZXVlOg0K
IAkgKi8NCi0JaWYgKHNlICE9IGNmc19ycS0+Y3VycikNCisJaWYgKHNlICE9IGNmc19ycS0+Y3Vy
ciAmJiAhKGZsYWdzICYgREVRVUVVRV9TQVZFKSkNCiAJCXVwZGF0ZV9zdGF0c193YWl0X2VuZF9m
YWlyKGNmc19ycSwgc2UpOw0KIA0KIAlpZiAoKGZsYWdzICYgREVRVUVVRV9TTEVFUCkgJiYgZW50
aXR5X2lzX3Rhc2soc2UpKSB7DQpkaWZmIC0tZ2l0IGEva2VybmVsL3NjaGVkL3J0LmMgYi9rZXJu
ZWwvc2NoZWQvcnQuYw0KaW5kZXggNGI4ZTMzYzYxNWIxLi45OTEyNTFmZWVhZjYgMTAwNjQ0DQot
LS0gYS9rZXJuZWwvc2NoZWQvcnQuYw0KKysrIGIva2VybmVsL3NjaGVkL3J0LmMNCkBAIC0xMzEw
LDkgKzEzMTAsMTcgQEAgc3RhdGljIGlubGluZSB2b2lkDQogdXBkYXRlX3N0YXRzX2VucXVldWVf
cnQoc3RydWN0IHJ0X3JxICpydF9ycSwgc3RydWN0IHNjaGVkX3J0X2VudGl0eSAqcnRfc2UsDQog
CQkJaW50IGZsYWdzKQ0KIHsNCisJc3RydWN0IHRhc2tfc3RydWN0ICpwID0gTlVMTDsNCisNCiAJ
aWYgKCFzY2hlZHN0YXRfZW5hYmxlZCgpKQ0KIAkJcmV0dXJuOw0KIA0KKwlpZiAocnRfZW50aXR5
X2lzX3Rhc2socnRfc2UpKQ0KKwkJcCA9IHJ0X3Rhc2tfb2YocnRfc2UpOw0KKw0KKwlpZiAocCAh
PSBycV9vZl9ydF9ycShydF9ycSktPmN1cnIgJiYgIShmbGFncyAmIEVOUVVFVUVfUkVTVE9SRSkp
DQorCQl1cGRhdGVfc3RhdHNfd2FpdF9zdGFydF9ydChydF9ycSwgcnRfc2UpOw0KKw0KIAlpZiAo
ZmxhZ3MgJiBFTlFVRVVFX1dBS0VVUCkNCiAJCXVwZGF0ZV9zdGF0c19lbnF1ZXVlX3NsZWVwZXJf
cnQocnRfcnEsIHJ0X3NlKTsNCiB9DQpAQCAtMTM0OCw2ICsxMzU2LDEwIEBAIHVwZGF0ZV9zdGF0
c19kZXF1ZXVlX3J0KHN0cnVjdCBydF9ycSAqcnRfcnEsIHN0cnVjdCBzY2hlZF9ydF9lbnRpdHkg
KnJ0X3NlLA0KIAlpZiAocnRfZW50aXR5X2lzX3Rhc2socnRfc2UpKQ0KIAkJcCA9IHJ0X3Rhc2tf
b2YocnRfc2UpOw0KIA0KKwlpZiAocCAhPSBycV9vZl9ydF9ycShydF9ycSktPmN1cnIgJiYgIShm
bGFncyAmIERFUVVFVUVfU0FWRSkpIHsNCisJCXVwZGF0ZV9zdGF0c193YWl0X2VuZF9ydChydF9y
cSwgcnRfc2UpOw0KKwl9DQorDQogCWlmICgoZmxhZ3MgJiBERVFVRVVFX1NMRUVQKSAmJiBwKSB7
DQogCQl1bnNpZ25lZCBpbnQgc3RhdGU7DQogDQpAQCAtMTQ3NCw5ICsxNDg2LDYgQEAgZW5xdWV1
ZV90YXNrX3J0KHN0cnVjdCBycSAqcnEsIHN0cnVjdCB0YXNrX3N0cnVjdCAqcCwgaW50IGZsYWdz
KQ0KIAlpZiAoZmxhZ3MgJiBFTlFVRVVFX1dBS0VVUCkNCiAJCXJ0X3NlLT50aW1lb3V0ID0gMDsN
CiANCi0JY2hlY2tfc2NoZWRzdGF0X3JlcXVpcmVkKCk7DQotCXVwZGF0ZV9zdGF0c193YWl0X3N0
YXJ0X3J0KHJ0X3JxX29mX3NlKHJ0X3NlKSwgcnRfc2UpOw0KLQ0KIAllbnF1ZXVlX3J0X2VudGl0
eShydF9zZSwgZmxhZ3MpOw0KIA0KIAlpZiAoIXRhc2tfY3VycmVudChycSwgcCkgJiYgcC0+bnJf
Y3B1c19hbGxvd2VkID4gMSkNCmRpZmYgLS1naXQgYS9rZXJuZWwvc2NoZWQvc3RhdHMuYyBiL2tl
cm5lbC9zY2hlZC9zdGF0cy5jDQppbmRleCA0MzQ2ZmQ4MWMzMWYuLjM2N2Y0YmIxYzc1OSAxMDA2
NDQNCi0tLSBhL2tlcm5lbC9zY2hlZC9zdGF0cy5jDQorKysgYi9rZXJuZWwvc2NoZWQvc3RhdHMu
Yw0KQEAgLTIwLDggKzIwLDEzIEBAIHZvaWQgX191cGRhdGVfc3RhdHNfd2FpdF9zdGFydChzdHJ1
Y3QgcnEgKnJxLCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnAsDQogdm9pZCBfX3VwZGF0ZV9zdGF0c193
YWl0X2VuZChzdHJ1Y3QgcnEgKnJxLCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnAsDQogCQkJICAgICBz
dHJ1Y3Qgc2NoZWRfc3RhdGlzdGljcyAqc3RhdHMpDQogew0KLQl1NjQgZGVsdGEgPSBycV9jbG9j
ayhycSkgLSBzY2hlZHN0YXRfdmFsKHN0YXRzLT53YWl0X3N0YXJ0KTsNCisJdTY0IGRlbHRhOw0K
Kwl1NjQgd2FpdF9zdGFydCA9IHNjaGVkc3RhdF92YWwoc3RhdHMtPndhaXRfc3RhcnQpOw0KIA0K
KwlpZiAoIXdhaXRfc3RhcnQpDQorCQlyZXR1cm47DQorDQorCWRlbHRhID0gcnFfY2xvY2socnEp
IC0gd2FpdF9zdGFydDsNCiAJaWYgKHApIHsNCiAJCWlmICh0YXNrX29uX3JxX21pZ3JhdGluZyhw
KSkgew0KIAkJCS8qDQotLSANCjIuMzQuMQ0K

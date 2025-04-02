Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DBB23814E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.66
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596815; cv=fail; b=Fn1QwlLqKbjLrJxlbnA8hcmwmWEeYYRYaTMpgEex0Zv4ejgNUVpnsMFvZaAIvUo5s8R+4XGkdMFAE9hZsd/YFS1ZUjFBdkCNpi0q9G1WS/Qzs4KgGK9qvoL5HB1yZ5049gV5upD4SCSSxeGPzB4gtwVykBMsuzGXfk3+Ape7Zbo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596815; c=relaxed/simple;
	bh=2CIMxGz4IAyHE0Eq2WnhgFxmUlA2Ux/eC4WgIiYzLHU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uwKrk+BjYmWlMVzNidDXnoasmWSHjh5/gN+R83JsDQ4RCBFoLpKwmNWb1u4TrNAdDuJmAuC5t0J0yvgzXE8DaTcZKLafJid/+O/rZuQuBZd8zyyTQVp3DEfyIRMNOPF+KmFOo7iABxIKgaWF7BNVIS023w7Rd0leSbkM8QC3sMY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fMG6nY1b; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fMG6nY1b; arc=fail smtp.client-ip=40.107.22.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fMG6nY1b";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fMG6nY1b"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=e2f0TV3jLf50srrA6IUzQ9pz+iWd6Up2HzH2MTQ7wRKzZ5ayM96r6X4+heX9xNI1pCWesptfn7nHLimC1+c6hJ9jpAg6ECgbwiWWmimJIfHDxU1lDLsauW2ezO6PYxG3NFAqQ0RY4cM3UhHc15AsyXpeIh2z3ms8R+TDf7IPWtymnzK4tGahcpOQ+D5I4eluAa0enNapoxiaq859KGce0jYBvAAuCWJ9JH5eevk7SRQl3Y5/fFwcbSZEZPTLOvMG3p/fPwJDiQba7v90JrjRRobENiSRFaq2kxhqAxYFiqTolyeAoLYNo8C9uKYArzonC2h6GWt5lElVMoOHMGBrmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mgarb0RcEqQSnR6PRZ2VQeYomxvV4nAWvVAf6OVFD1Y=;
 b=adMgVC3C9o7AUf6RQM+mkrduNnCbY2pGHHFIhJW1NRrlVVNnZboxYOerQIiAL0GkrEBgrMa9vqZb9uxj1wmru6E+ZKVgFMO7yH2NzMxq2qINvKr1kbo6L88aXzzMegnyM3PFXeRJmje5oLMEjWsoznmaBdF1UJ42Jk5B4AZ8SZ8q14OUMr0syPJ3TKua30USFf731HkVLbbM45T9SLPCv12CKtWDqElvP+pr2ECS4P1aZhqv04AYtFyQtT6x1oF7kNjSsMZC13MAC+Rhn8EmTl6y3A5Y1XngIMXjuuXSkhl13pll9jx7Y2bWCe6+5QjEoA2irsjDzvI/PU5Fiv0tng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=0
 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mgarb0RcEqQSnR6PRZ2VQeYomxvV4nAWvVAf6OVFD1Y=;
 b=fMG6nY1b4GnmaUvDLAuI3o0z2snGKYa7GIXVbvw8z+DrWbyd+xWvlH9dV2d6q4eW23DHL5ozBWUirgI5ymN/cM0IRYB//CLkzEgdSS7a/yxjFkYthUi2MEb3d3nc7zriLJqvlk3tKLTCdHKKop5jtXe8xMdVMHhC+lzHZUFzFlw=
Received: from DU7P250CA0030.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::34)
 by DU4PR08MB11175.eurprd08.prod.outlook.com (2603:10a6:10:574::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 12:26:49 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::89) by DU7P250CA0030.outlook.office365.com
 (2603:10a6:10:54f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Wed,
 2 Apr 2025 12:26:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (10.167.8.74) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22 via
 Frontend Transport; Wed, 2 Apr 2025 12:26:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gl0M3yBzgZ3T3LVOnpuHiEGomrvw5zVAR3Ni8SzEZcYFnoDRWp58eIYea4qJ0pE630cx8hxGYm643SknOtgNFefeEYpuDIA2EL4z5+Ir128rb3+sibAGmFjlyviNhWltzDzNAKpSVxIo9r98+NgdWXhOCgsqFJM6WVN1dusNx48kRmmUuCPl58dnazXYFXXD+a9Wjou66Dp4aw5zClL3UBdwPX4XaTfF6V/p+M5rpe8eHKqntDneoSnja5y+j7J1Qltn67xz8SUGGKDG6Hv/xtiAbRlt60X/128pTputACnvbgeYmPGzYoB1MH+RcXWHB926J2tZMoIUf5K7BHqxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mgarb0RcEqQSnR6PRZ2VQeYomxvV4nAWvVAf6OVFD1Y=;
 b=tURKVP9XvQpUvLffJoZwZsr1H6aYKVw9QWyV9nrXa2KUAKC4i2B2Kvn9Wzi3wjH8V5+GAkmOds8DJlFoDeHDR6Ypt7DrHkNLU2wLxHhuywUPy+OyDjqoTV9rnrQ9iOX1oEiKq4ACFq0UZic1LIWkNrIIYDkxXg7ohPN1gNgkofWc96AVu6ZODihboxHh9bp3M7hruu73gJ5C7Itw96NYp57yulha++UK8DOfg9zsYIatlCEaObWAo+wSJteb3PL8CosjyREeY3sX6A2HUNydWXNny/T5Bpp41eo3327QyFrIr2WtHYlXY81+spo+g0OxO79HQCiVo6Eb6EB5YK4jSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 172.205.89.229) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mgarb0RcEqQSnR6PRZ2VQeYomxvV4nAWvVAf6OVFD1Y=;
 b=fMG6nY1b4GnmaUvDLAuI3o0z2snGKYa7GIXVbvw8z+DrWbyd+xWvlH9dV2d6q4eW23DHL5ozBWUirgI5ymN/cM0IRYB//CLkzEgdSS7a/yxjFkYthUi2MEb3d3nc7zriLJqvlk3tKLTCdHKKop5jtXe8xMdVMHhC+lzHZUFzFlw=
Received: from DUZPR01CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::11) by GV2PR08MB7954.eurprd08.prod.outlook.com
 (2603:10a6:150:a8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 12:26:14 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::19) by DUZPR01CA0053.outlook.office365.com
 (2603:10a6:10:469::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.42 via Frontend Transport; Wed,
 2 Apr 2025 12:26:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 172.205.89.229 as permitted sender)
 receiver=protection.outlook.com; client-ip=172.205.89.229;
 helo=nebula.arm.com;
Received: from nebula.arm.com (172.205.89.229) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (10.167.8.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 12:26:14 +0000
Received: from AZ-NEU-EX06.Arm.com (10.240.25.134) by AZ-NEU-EX06.Arm.com
 (10.240.25.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 12:26:10 +0000
Received: from e129171.arm.com (10.57.71.10) by mail.arm.com (10.240.25.134)
 with Microsoft SMTP Server id 15.1.2507.39 via Frontend Transport; Wed, 2 Apr
 2025 12:26:10 +0000
From: Luis Machado <luis.machado@arm.com>
To: <linux-kernel@vger.kernel.org>, <peterz@infradead.org>,
	<dietmar.eggemann@arm.com>
CC: <mingo@redhat.com>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>
Subject: [RFC] sched: Improving scheduler debugging/tracing interfaces
Date: Wed, 2 Apr 2025 13:26:07 +0100
Message-ID: <20250402122607.2982523-1-luis.machado@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DU2PEPF0001E9C5:EE_|GV2PR08MB7954:EE_|DU2PEPF0001E9C5:EE_|DU4PR08MB11175:EE_
X-MS-Office365-Filtering-Correlation-Id: decb91b1-be05-4891-d451-08dd71e1a476
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?eWFkWE5UOTh4b2trOXFQSFJaMnF3eElVUkdrL2J5bkhRL2o1K293eXk0U2Rj?=
 =?utf-8?B?VTN0YUUrOVE2MlAyU0VvMElONzFXM24rZzFiaHM5K3EvbVB4b3BDSkgwWThw?=
 =?utf-8?B?TnQzbkRGTHZUMm9WSzJkSUxFdVRFMDdVWUJid3FaY1BjdzZ6ZE5rKysrcmVy?=
 =?utf-8?B?T3FRazhaNGhzN09XS052aFJpbDRsWUdqZnpKSk55dUplWHY3aTZJOVhrQmZa?=
 =?utf-8?B?MlZ5SHY3Tm9VVC8rdEloeEhuOTc5c1JWYmVVZW1aaUNGUTc2R3RoVVM4V09I?=
 =?utf-8?B?SGRkRTRqOWNiNWdmSW5BdWRuRHlQWkFOdmlUa1FQQ0QwTEYwY2xwT3ZBRmVK?=
 =?utf-8?B?NTIyVEJyOE9Fajg3aThBS054OHlScWkrNlUzdDFueURaRDN1ZHdtM0c0M0JQ?=
 =?utf-8?B?NVk2KzJZV3BLNHEyZk5ZenJQWWdGT1RYclRlUUsvSDI4ZFNnVk5rZndrR2I4?=
 =?utf-8?B?NHBZampueDJVc0N6TmFCMHlTeU1tbUdUUWJzdERkSFVrUlF2b1hyODNOSm01?=
 =?utf-8?B?ZUphMjgzU2t0Q1BSbkUxUUllNG9zcEZoc3B2T3dvdmN0K29vRUFmRmZlZkM3?=
 =?utf-8?B?NGJINk51TXQ0eXl6TGMxbVdYSXluVjQ5dkdwaGlLZEdBN1pXZDMyTjh6UlRB?=
 =?utf-8?B?TVRWV1IzZGpRZHY5WG9vRGJZL2Jxc3BaUmxPQ1dpWGtzUDJqMUhnWU9Ocnor?=
 =?utf-8?B?VzFxR3ptK05xaWxZNE5keC95ME03blhzQm5oMlhHN1VwZnhBeStwRXVsSHpm?=
 =?utf-8?B?Z1pPUjlkNGJBaE5zbDdNMmpzdUlLUDhUQ1JaMWdjbTFBL3hvVVhIUG1BRW40?=
 =?utf-8?B?QlgxYndzTldQU3oxMjAwcU1pb0FyR0xtdHlPNFYvU0JMZ3NnWjBJQlprM1Nq?=
 =?utf-8?B?bkJvRTBURktjdG41R1FUS3hPK3M1U1pNTjBEc1h1OEVpRmM5YWh5TjJ0d2hq?=
 =?utf-8?B?UXFlSE1iU05maHNJWmJES0RsNTRaZkF4a2dEdk4zZFJwNm9GWmJwbnRFZDBl?=
 =?utf-8?B?ZDBXbHUrb0tLOEFXRDRkY2pTVzZnZkh2TU1VUXczbVNaTVlWS2tBUnlOWFM2?=
 =?utf-8?B?U2swdWkydW1DMXdlL24xSG5zZHp3T3RXS3NCY2xsR1dEWkRwT29aV1Y1eVJv?=
 =?utf-8?B?TUhkYUVxTHhVL09vNGllRmpaSHJyMHRlOFRpNHZkblhlS3BJd3VpU0xYUWNC?=
 =?utf-8?B?cHR3Z1FNbVE5T0lITmpQNm5iZFFhTGh4TDdUWVh6WFNkRTVyVno3dFRadTNl?=
 =?utf-8?B?ZlZMY2dtc2plcE1ySE1JMTJhRmdTT1R0M2JWbCtrd2RZczUvS2ZvOWhMMXV6?=
 =?utf-8?B?MWUvSnYxWnhSdlRXWEl1a1htLzd5V1pFNHVWMFBKZVUyUHg2ZkFQOWMzekZQ?=
 =?utf-8?B?eGphNmtLSzRhUFRocHpvdnM4QXVxYzFpTVIwNlVvZllVeFNZdDlLenFZeVU3?=
 =?utf-8?B?RUVaSi9UQ25WNzcvakdOdnFOMkl2blE0V1hWYmE1N1BDM3NyK0hSa3dodUph?=
 =?utf-8?B?Y2Y2cldKUUFwMjV2OVRZbE4xdUZpcGFhUXJjem90RFBHREFDVEc5WlE3NTcz?=
 =?utf-8?B?b2N2Zmp6emZOV2hsQ1d1TTMzV0ZadGhRYUorVitXRDlDWlF6ditYOWUrekNI?=
 =?utf-8?B?ZHh4bjJIUytZcUc4RDhiMS9LYmFtbjl3d0g0c1JyNjFOd0VGa1JLOHcyVUtn?=
 =?utf-8?B?MGlrUEJaKzVQWmU5MjdvTXVqc1pWbW5MeG5adWs5RzhJWnR1TW9zQTVQTXd3?=
 =?utf-8?B?QTloVldkNElBU0RXSGZXRkdTcGFGdDF3ZlY3WE1tdUhqSnlJWjAxTmtWSnlS?=
 =?utf-8?B?bEtzbEFUMVN5U3RzYVZjRzBTUmxTOHA4WnRldUNRZmxhWTBxVk9Oa3dyMGN4?=
 =?utf-8?B?MG96TnVNK2VzSzJ1WFE4QmhKU3l3dnJHdThqdDVnem92b3ZYQS9pTGpMMlB6?=
 =?utf-8?B?Y0ZMYXlDWTZrNlpQNEV6d0UrTWdJVXJnSmo4RE1HOFpMeEgvVXhIbnNqTHEr?=
 =?utf-8?Q?Ls/hnswkz5EbcF63lCww2n0vwxWi2E=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:172.205.89.229;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7954
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4536cd70-f145-4316-45dd-08dd71e18f5c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|35042699022|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OW9TWHhPMnpHTzR2YUY3alJKSnAvM2szdnZEdkQzZmo4bU56NFY0MDBDYXRU?=
 =?utf-8?B?UGNvS0w5VWVJWUtoNVJ3bTUrOUFMTlVGTm5JUVhzdUFWK2dTaVd3S0NKdGEr?=
 =?utf-8?B?VUx3dDRYVUQxOGVscmdHZGFSMlk4bnhZb2Z3WUdRTU5rR3ZkZUdqS3NlMnVu?=
 =?utf-8?B?VWFpSVFoQXhsMEFMSmZla2piRklmNm9FTHFoRlJQazZiRzVROEF0dTlLTllB?=
 =?utf-8?B?WU1zMDlJL3YvRm5nUlFVREFGRjRGNUl5bWtEQ3F1MXZzVGx5dU0zdDcwamtj?=
 =?utf-8?B?TkZxUkZnWjFUbURRbUdxMlZEbnMvY0d5QTIrVHB6ZldRR1dDaTBQMjRNNWJX?=
 =?utf-8?B?dUIvSUtoN01HNzM4N0NtTGZPY1Jxc3pNZHU5Zkl2eUgxUkk5MmVyT1lZd3Fi?=
 =?utf-8?B?WCszdzU5aEh5c0FRY1RHWUg5QXFxcDVRUTRBeFh1OUxpMGZhWG1ZYTZIYTN6?=
 =?utf-8?B?V0J0Y080NGh4c1VFZE9ySUZEdk1FUzNXWUYyU0VPZ0hFd0VEanJiSndjM0h4?=
 =?utf-8?B?a2dhb2tyMytrZ0R1dFgyRloyK2RIQnI4NWFtQVQ4UUJvRlgwUGx0L2dnTEVV?=
 =?utf-8?B?WFY0dE4vZUMxNCttcVpldVhSQjNWTURKcS9wTmlVNUFQQzhyZTlHd0VXblRR?=
 =?utf-8?B?UlE2WXFaVEVxaVRKSHJWZ25KOFZjWk9sa1Q3SjluNHltL0JBSDU1eXJ6a2NQ?=
 =?utf-8?B?RWgvZ1N3WDVkcU5DbGJQdmxTL3BOc244YkNNUGF2aFVoT2tPZEtkTk9ad2Nz?=
 =?utf-8?B?WjdHSWs1MDlxR04zOC9hNWV5MVM0UlJuZUYzMThaUzVUSWtlMGQyaFFzN0l2?=
 =?utf-8?B?OFZKbWlqT0dQTjZwMGlOSXlQRFBubzZtR3hTRmhITGZEbUVWRm9kMXFpZnh5?=
 =?utf-8?B?bmp3eG9XaStaRjVISkMvZFJKbHcvOVMxckRhN2pFREZJaUQzYnZWSFI5eXIy?=
 =?utf-8?B?RVFsVHozOVlVVHFaczZXNHBDTVEyb1NMRytSbjBaVFQ4MFF1dkIxc2RnVU5q?=
 =?utf-8?B?cjVteGc4UU1Na3NQV3JxRjNoZ3E5K0UrTFgwOHhXSlNVR3dYMm1Ua1pTSzZv?=
 =?utf-8?B?VVIvUktYMCtRS3JxSGVQM3R4bXVPNC9TMndxVmhpWnB2RnZRS0xRZlFvVFUy?=
 =?utf-8?B?eE1OQnVVa2E1SVllbjRYYkhGcGVoQjBpMWc5ZGtjVFNDTW14NEFPK0NNTzdZ?=
 =?utf-8?B?S1VSN253MklFK2JUZGJwenptNFVYR25kR21HMGtMY2hJNStHOForMWRLbExN?=
 =?utf-8?B?bklFTmVGZzA1cFg0M0RxWnBPL0JvekQvRzRCZmlvUWhmdFJ2QlhoYzBxa3Jx?=
 =?utf-8?B?TFFwZ2FFZVk1T090WHRFbWNmQlkwY3pVQUpHUE5RSU9VUnJvUzNXV3M1c09D?=
 =?utf-8?B?MVpCTzlPZmhLMDIxak9TTEh2cFdZZlJBL2pKVGxvZmFMa2hIUmUxdEVRNGxt?=
 =?utf-8?B?UWVjbll3T1R0QVAvY3l2cU01cHB1dkJ4NXBnWWhVOTdTRjJjbEM2RmVxRFRW?=
 =?utf-8?B?d2E1dzZUSkVkaU9adFFqSzA1V0JRTktHUEdVbWVRZ3hhdWdHeWZXY3hubWUy?=
 =?utf-8?B?d1VLeEw4ZmgzU1VQaEZQQ0tqNWo5ZUJDYk9vV3ErM2IyNzN6V1NUQ2VGNURR?=
 =?utf-8?B?WlJiNWdWNUtkYW5GM0RBUlo4azZ6cFhjVGRrVEtvR3k2b3dEcS9aMDJ5dkto?=
 =?utf-8?B?T2p1YkYxZ0tKMGgwbGlmVlk2N0FWU1BWeWo2MGxUSnV3b0tCTnFING0vL1VO?=
 =?utf-8?B?YS9qY2tVdmZIMXNhWTQyUTlza3V4a0dGZmRBZWpHN1hlQWp4RUs0RGNwK3My?=
 =?utf-8?B?SmhqS3BsK2c1dzhBVnRaSFdxZ0E0QU8rUVlsazNGM1h6ZUgrdFlXSWlXcFVi?=
 =?utf-8?B?WUN1ZkxXREczdVc0ZkE1V3FlRG14QVE5Ti8yaExielNyK1dqR05lS3VXSGMx?=
 =?utf-8?B?MmJkRlRDOHNhNmFTSGwwbEdPZlROdlg1ZWR0S291SUdlcHNXTzhGajQ4Rnc0?=
 =?utf-8?Q?RVNXmCbb08T7ym6v74xtk566w0A4/w=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(35042699022)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 12:26:49.6215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: decb91b1-be05-4891-d451-08dd71e1a476
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11175

This patch is primarily a proposal aimed at improving the observability of the
scheduler, especially in the context of energy-aware scheduling, without
introducing long-term maintenance burdens such as a stable userspace ABI. I’m
seeking feedback from the community on whether this approach seems viable, or
if there are suggestions for making it more robust or maintainable.

Today, validating that a set of scheduler changes behaves sanely and doesn’t
regress performance or energy metrics can be time-consuming. On the
energy-aware side in particular, this often requires significant manual
intervention to collect, post-process, and analyze data.

Another challenge is the limited availability of platforms that can run a
mainline kernel while still exposing the detailed data we need. While we do
have some options, most devices running upstream kernels don’t provide as
much — or as precise — information as we’d like. The most data-rich devices
tend to be phones or Android-based systems, which typically run slightly
older or patched kernels, adding yet another layer of complexity.

As a result, going from reviewing a patch series on LKML to having a concrete
good/bad/neutral result often involves several intermediate steps and tooling
hurdles.

Our current data collection relies heavily on existing kernel tracepoints and
trace events. However, adding new trace events is increasingly discouraged,
since these are often treated as part of a de facto userspace ABI — something
we want to avoid maintaining long-term. So extending the trace events set isn’t
a viable option.

To work around this, we use a kernel module (LISA) that defines its own trace
events based on existing scheduler tracepoints. This approach gives us
flexibility in creating events without modifying the kernel’s core trace
infrastructure or establishing any new userspace ABI.

For the past few years, tracepoint definitions for the scheduler have been
exposed in include/trace/events/sched.h. These definitions are not always
made available via tracefs, and are documented as being for testing and
debugging purposes — which aligns well with our use case.

However, this approach has limitations. One issue is the visibility of
tracepoint argument types. If a tracepoint uses a public type defined in a
public header, we can dereference members directly to extract data. But if
the type is internal or opaque — such as struct rq — we can’t access its
contents, which prevents us from retrieving useful values like the CPU number.

One workaround is to duplicate the kernel’s internal struct definitions in
the module, but this is not good: it’s error-prone due to alignment issues and
requires constant tracking of kernel changes to avoid mismatches.

A better approach, which we currently use, is to rely on BTF (BPF Type
Format) to reconstruct type information. BTF allows us to access internal
kernel types without having to maintain duplicate struct definitions. As long
as BTF info is available, we can introspect data structures even if they’re
not publicly defined.

Using this, our module can define trace events and dereference internal types
to extract data — but it’s not without friction:

- Struct members are often nested deeply within BTF type trees, which can make
it awkward to navigate and extract data.

- BTF describes data types, but not semantics. For example, sched_avg.util_est
appears to be a numeric value, but in reality it encodes a flag alongside the
actual utilization value. The kernel uses the following helper to extract the
actual data:

static inline unsigned long _task_util_est(struct task_struct *p)
{
    return READ_ONCE(p->se.avg.util_est) & ~UTIL_AVG_UNCHANGED;
}

There is no way to infer from BTF alone that this masking is needed. And even
when such helpers exist in the kernel, they’re often inlined or unavailable
to modules, so we’d have to reimplement them — again reintroducing
maintenance overhead.

To address these challenges and reduce duplication, we propose adding an
extra argument to certain scheduler tracepoints: a pointer to a struct of
function pointers (callbacks). These callbacks would act as "getters" that
the module could use to fetch internal data in a safe, forward-compatible
way.

For example, to extract the CPU capacity from a struct rq (which is opaque to
the module), the module could call a getter function via the callback struct.
These functions would reside inside the kernel, and could leverage internal
knowledge, including inlined helpers and static data.

Here's an example of the proposed callback structure:

struct sched_tp_callbacks {
    /* Fetches the util_est from a cfs_rq. */
    unsigned int (*cfs_rq_util_est)(struct cfs_rq *cfs_rq);

    /* Fetches the util_est from a sched_entity. */
    unsigned int (*se_util_est)(struct sched_entity *se);

    /* Fetches the current CPU capacity from an rq. */
    unsigned long (*rq_cpu_current_capacity)(struct rq *rq);
};

The idea is simple: given a base type (e.g. rq, cfs_rq, sched_entity), the
module calls a getter function that returns the data it needs. These getters
encapsulate internal kernel logic and remove the need for the module to
replicate or guess how to access scheduler internals.

Since these additions would be part of tracepoints used for
testing/debugging, they are not considered stable ABI and can evolve as the
kernel changes. It would be up to the module to adapt to changes in available
hooks, types, or fields — something we already do today using BTF for
disappearing types (e.g. struct util_est becoming a raw integer).

While this approach would require some extra code in the kernel to define the
callback struct and register the functions, we believe it would significantly
improve testability and maintainability of tooling like LISA. It could even
be extended to support non-energy-aware scheduler debugging scenarios as
well.

Our current testing pipeline already makes heavy use of LISA [1], which
automates test execution and data analysis. It also integrates with rt-app
[2] to generate configurable workloads.

The attached proof-of-concept patch adds three such callback functions as a
demonstration. We’ve tested this against a modified version of our module
that uses the callbacks to fetch scheduler internals.

Thoughts?

[1] https://tooling.sites.arm.com/lisa/latest/
[2] https://github.com/scheduler-tools/rt-app

Signed-off-by: Luis Machado <luis.machado@arm.com>
---
 include/trace/events/sched.h | 27 +++++++++++++++++----------
 kernel/sched/core.c          | 27 +++++++++++++++++++++++++++
 kernel/sched/fair.c          | 16 ++++++++--------
 kernel/sched/pelt.c          |  6 +++---
 kernel/sched/sched.h         | 11 +++++++++++
 5 files changed, 66 insertions(+), 21 deletions(-)

diff --git a/include/trace/events/sched.h b/include/trace/events/sched.h
index 8994e97d86c..0687f4f62d9 100644
--- a/include/trace/events/sched.h
+++ b/include/trace/events/sched.h
@@ -767,6 +767,13 @@ TRACE_EVENT(sched_wake_idle_without_ipi,
 	TP_printk("cpu=%d", __entry->cpu)
 );
 
+/* This struct is declared here so the tracepoints below can pass
+ * these types as parameter.
+ * This is only used for testing and debugging, so tracepoint probes can
+ * use the callbacks to fetch the data they need.
+ */
+struct sched_tp_callbacks;
+
 /*
  * Following tracepoints are not exported in tracefs and provide hooking
  * mechanisms only for testing and debugging purposes.
@@ -774,8 +781,8 @@ TRACE_EVENT(sched_wake_idle_without_ipi,
  * Postfixed with _tp to make them easily identifiable in the code.
  */
 DECLARE_TRACE(pelt_cfs_tp,
-	TP_PROTO(struct cfs_rq *cfs_rq),
-	TP_ARGS(cfs_rq));
+	TP_PROTO(struct cfs_rq *cfs_rq, struct sched_tp_callbacks *sched_tp_callbacks),
+	TP_ARGS(cfs_rq, sched_tp_callbacks));
 
 DECLARE_TRACE(pelt_rt_tp,
 	TP_PROTO(struct rq *rq),
@@ -794,24 +801,24 @@ DECLARE_TRACE(pelt_irq_tp,
 	TP_ARGS(rq));
 
 DECLARE_TRACE(pelt_se_tp,
-	TP_PROTO(struct sched_entity *se),
-	TP_ARGS(se));
+	TP_PROTO(struct sched_entity *se, struct sched_tp_callbacks *sched_tp_callbacks),
+	TP_ARGS(se, sched_tp_callbacks));
 
 DECLARE_TRACE(sched_cpu_capacity_tp,
-	TP_PROTO(struct rq *rq),
-	TP_ARGS(rq));
+	TP_PROTO(struct rq *rq, struct sched_tp_callbacks *sched_tp_callbacks),
+	TP_ARGS(rq, sched_tp_callbacks));
 
 DECLARE_TRACE(sched_overutilized_tp,
 	TP_PROTO(struct root_domain *rd, bool overutilized),
 	TP_ARGS(rd, overutilized));
 
 DECLARE_TRACE(sched_util_est_cfs_tp,
-	TP_PROTO(struct cfs_rq *cfs_rq),
-	TP_ARGS(cfs_rq));
+	TP_PROTO(struct cfs_rq *cfs_rq, struct sched_tp_callbacks *sched_tp_callbacks),
+	TP_ARGS(cfs_rq, sched_tp_callbacks));
 
 DECLARE_TRACE(sched_util_est_se_tp,
-	TP_PROTO(struct sched_entity *se),
-	TP_ARGS(se));
+	TP_PROTO(struct sched_entity *se, struct sched_tp_callbacks *sched_tp_callbacks),
+	TP_ARGS(se, sched_tp_callbacks));
 
 DECLARE_TRACE(sched_update_nr_running_tp,
 	TP_PROTO(struct rq *rq, int change),
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c81cf642dba..a0ee7534aaa 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -99,6 +99,27 @@
 EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpu);
 EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpumask);
 
+static unsigned int cfs_rq_util_est(struct cfs_rq *cfs_rq)
+{
+	return cfs_rq ? cfs_rq->avg.util_est: 0;
+}
+
+static unsigned int se_util_est(struct sched_entity *se)
+{
+
+	return se ? se->avg.util_est & ~UTIL_AVG_UNCHANGED : 0;
+}
+
+static unsigned long rq_cpu_current_capacity(struct rq *rq)
+{
+	if (rq == NULL)
+		return 0;
+
+	unsigned long capacity_orig = per_cpu(cpu_scale, rq->cpu);
+	unsigned long scale_freq = per_cpu(arch_freq_scale, rq->cpu);
+	return cap_scale(capacity_orig, scale_freq);
+}
+
 /*
  * Export tracepoints that act as a bare tracehook (ie: have no trace event
  * associated with them) to allow external modules to probe them.
@@ -8524,11 +8545,17 @@ LIST_HEAD(task_groups);
 static struct kmem_cache *task_group_cache __ro_after_init;
 #endif
 
+struct sched_tp_callbacks sched_tp_callbacks;
+
 void __init sched_init(void)
 {
 	unsigned long ptr = 0;
 	int i;
 
+	sched_tp_callbacks.cfs_rq_util_est = cfs_rq_util_est;
+	sched_tp_callbacks.se_util_est = se_util_est;
+	sched_tp_callbacks.rq_cpu_current_capacity = rq_cpu_current_capacity;
+
 	/* Make sure the linker didn't screw up */
 #ifdef CONFIG_SMP
 	BUG_ON(!sched_class_above(&stop_sched_class, &dl_sched_class));
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e43993a4e58..f115842669b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4433,8 +4433,8 @@ static inline int propagate_entity_load_avg(struct sched_entity *se)
 	update_tg_cfs_runnable(cfs_rq, se, gcfs_rq);
 	update_tg_cfs_load(cfs_rq, se, gcfs_rq);
 
-	trace_pelt_cfs_tp(cfs_rq);
-	trace_pelt_se_tp(se);
+	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
+	trace_pelt_se_tp(se, &sched_tp_callbacks);
 
 	return 1;
 }
@@ -4698,7 +4698,7 @@ static void attach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
 
 	cfs_rq_util_change(cfs_rq, 0);
 
-	trace_pelt_cfs_tp(cfs_rq);
+	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
 }
 
 /**
@@ -4728,7 +4728,7 @@ static void detach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
 
 	cfs_rq_util_change(cfs_rq, 0);
 
-	trace_pelt_cfs_tp(cfs_rq);
+	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
 }
 
 /*
@@ -4865,7 +4865,7 @@ static inline void util_est_enqueue(struct cfs_rq *cfs_rq,
 	enqueued += _task_util_est(p);
 	WRITE_ONCE(cfs_rq->avg.util_est, enqueued);
 
-	trace_sched_util_est_cfs_tp(cfs_rq);
+	trace_sched_util_est_cfs_tp(cfs_rq, &sched_tp_callbacks);
 }
 
 static inline void util_est_dequeue(struct cfs_rq *cfs_rq,
@@ -4881,7 +4881,7 @@ static inline void util_est_dequeue(struct cfs_rq *cfs_rq,
 	enqueued -= min_t(unsigned int, enqueued, _task_util_est(p));
 	WRITE_ONCE(cfs_rq->avg.util_est, enqueued);
 
-	trace_sched_util_est_cfs_tp(cfs_rq);
+	trace_sched_util_est_cfs_tp(cfs_rq, &sched_tp_callbacks);
 }
 
 #define UTIL_EST_MARGIN (SCHED_CAPACITY_SCALE / 100)
@@ -4970,7 +4970,7 @@ static inline void util_est_update(struct cfs_rq *cfs_rq,
 	ewma |= UTIL_AVG_UNCHANGED;
 	WRITE_ONCE(p->se.avg.util_est, ewma);
 
-	trace_sched_util_est_se_tp(&p->se);
+	trace_sched_util_est_se_tp(&p->se, &sched_tp_callbacks);
 }
 
 static inline unsigned long get_actual_cpu_capacity(int cpu)
@@ -10009,7 +10009,7 @@ static void update_cpu_capacity(struct sched_domain *sd, int cpu)
 		capacity = 1;
 
 	cpu_rq(cpu)->cpu_capacity = capacity;
-	trace_sched_cpu_capacity_tp(cpu_rq(cpu));
+	trace_sched_cpu_capacity_tp(cpu_rq(cpu), &sched_tp_callbacks);
 
 	sdg->sgc->capacity = capacity;
 	sdg->sgc->min_capacity = capacity;
diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
index 7a8534a2def..7ca37abf46b 100644
--- a/kernel/sched/pelt.c
+++ b/kernel/sched/pelt.c
@@ -296,7 +296,7 @@ int __update_load_avg_blocked_se(u64 now, struct sched_entity *se)
 {
 	if (___update_load_sum(now, &se->avg, 0, 0, 0)) {
 		___update_load_avg(&se->avg, se_weight(se));
-		trace_pelt_se_tp(se);
+		trace_pelt_se_tp(se, &sched_tp_callbacks);
 		return 1;
 	}
 
@@ -310,7 +310,7 @@ int __update_load_avg_se(u64 now, struct cfs_rq *cfs_rq, struct sched_entity *se
 
 		___update_load_avg(&se->avg, se_weight(se));
 		cfs_se_util_change(&se->avg);
-		trace_pelt_se_tp(se);
+		trace_pelt_se_tp(se, &sched_tp_callbacks);
 		return 1;
 	}
 
@@ -325,7 +325,7 @@ int __update_load_avg_cfs_rq(u64 now, struct cfs_rq *cfs_rq)
 				cfs_rq->curr != NULL)) {
 
 		___update_load_avg(&cfs_rq->avg, 1);
-		trace_pelt_cfs_tp(cfs_rq);
+		trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
 		return 1;
 	}
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 47972f34ea7..5b0b8bb460c 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -182,6 +182,17 @@ extern struct list_head asym_cap_list;
  */
 #define RUNTIME_INF		((u64)~0ULL)
 
+struct sched_tp_callbacks {
+	/* Fetches the util_est from a cfs_rq. */
+	unsigned int (*cfs_rq_util_est)(struct cfs_rq *cfs_rq);
+	/* Fetches the util_est from a sched_entity. */
+	unsigned int (*se_util_est)(struct sched_entity *se);
+	/* Fetches the current cpu capacity out of a rq. */
+	unsigned long (*rq_cpu_current_capacity)(struct rq *rq);
+};
+
+extern struct sched_tp_callbacks sched_tp_callbacks;
+
 static inline int idle_policy(int policy)
 {
 	return policy == SCHED_IDLE;

base-commit: 328802738e1cd091d04076317f3c2174125c5916
-- 
2.25.1


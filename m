Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013007.outbound.protection.outlook.com [40.107.162.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C2A283C82;
	Fri, 20 Jun 2025 09:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.7
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750411715; cv=fail; b=VVq1WZznBangLgaa3vKKxr+RHZS7h3iP/TF/kGCPhW+MaMohDNAct0AtirRb6t6MfkVQukACYdDWCy5YGTgo6zJQR1EqZOfMxKBrsrGYmOJ5UBDh1Z2UzJzbxA3LpfJCrbT5ZcB00DK6L6FYty5KxHbpIMBRJawKzmZXkxKHf6I=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750411715; c=relaxed/simple;
	bh=F1nJTc7M9Ug5EGjLJ3aWr0Q4CeiVdUFfu7X3WvrxQ9g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QXU/Mkjp/XL/BLLBmxGVC3VWhQx6H9wHnoYoDsJIg7OjuWody+k9FGiiEC6BzQF2ejPsHVDRLDOOssaETUtIEy/1MjFH3ySNd8t1bj8W6Op32FxiVBVI+qGE7bonYzYpPWB9j3Olx1Tk5CJFbO8ZQe3DNV0iEcC406BlH6/zItQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Vmj61XdU; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Vmj61XdU; arc=fail smtp.client-ip=40.107.162.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Vmj61XdU";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Vmj61XdU"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=w6JPLN+DdwxV0gvE0d8pZdXL1UaI+Ekkx3yNllCRBwehYQZw8y2tehjSxtDu78EakhRLtemkNcZzBOjoXtEfao6xVBxJ04WrZ6cIJiM+T9hW2GMNrsWJ60ZbkTzPmL4iZdxGtZ8f4xdGGDOIe65qv+DTh9F2f7P8JGYjEPRZOULiTEofkQICs0LBiSsgawhfotXjLO2neeNyuSgybvNL+ILzYVvG8PyS2subAm9j8mw0C27dcDWTpDNpc60daQDb7XJplukKpwpNjh6MLDzvgy3G442qPsv+OlqVUXZfNs/Yv2QcWImitf5F/hioNtQr0e45gPcxgib7jZv03A6Neg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1nJTc7M9Ug5EGjLJ3aWr0Q4CeiVdUFfu7X3WvrxQ9g=;
 b=bm12sA5x3qe+M3kIt1Pkb+4/UJVcuQkMfdrzhOn45hnuupKgNqd1PUxV9XUdETGfuLT2Fhv45z0E1oGYAGb0ikNClpeuO3gWwbi1JxT7583WcWTMk+r7IXKLKV2P0Ga3WNAjwn9+Wlf3r0OLAPc+AHg/fczMW8Ssqa+RVJ1wfiYl9cpNHvHtDzZP3U40ttRU2efanxZzIVig4hkAHYR5/vOug4OSNXUwtps/whX3GOcU35mFG3ot9ir4XyVmC3pkEISDW9off2fo1iPyqzOR/1ScQrWo5mYauDlDapfm2JmnjjD5/KYEXryjRvXYuiQRcsakOOMrTwxCGLYt4Z7WaQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1nJTc7M9Ug5EGjLJ3aWr0Q4CeiVdUFfu7X3WvrxQ9g=;
 b=Vmj61XdU8m32a3FNz6FKibfjFebaXFQv6JkH6GeLf9zJPggY1rfrwu5LvyYnfqWQMqfpjAQk54MUGdNvCDsYCR7hV4mLPtC/z2DpTbYMejpvd7l37qs6dLBYA170XSpHJsiqKYXUSncUthXtLyDLk8xT7PAOoBu42TeG5EsM+8o=
Received: from PR1P264CA0070.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cc::10)
 by DU2PR08MB10185.eurprd08.prod.outlook.com (2603:10a6:10:49e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 09:28:28 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:102:2cc:cafe::9d) by PR1P264CA0070.outlook.office365.com
 (2603:10a6:102:2cc::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Fri,
 20 Jun 2025 09:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Fri, 20 Jun 2025 09:28:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnHE7p1wpbWOlD3XvAylLndHavORHIVgE+hUwlG5HYVmQ80uJHQDQDjs9EvoGpM6aICJ3z98IugW/fr7atSBAGUoysOOYcWi9PPpBK6uVO+5EK3bzwwnPBcNOdBgAyTtcDUQs6aZ8lXEK5GzTDxvQdraVTpTrAbppqQqBS9IE2eJdwFylrCsHYesFIF0RKmaFtT80nWX0eC5nmRwSpvlXSMXKtbh+r392tOWMXikrdXAic1Hh/BryYT589Jn0etKfgo4tBdrQMWKt3WeE3xITObI44qB9VU/xMxkpKqFUPrV4gZLyZKyJz9C0JmtXK/QYtUml8oo2prgfykO0wbQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1nJTc7M9Ug5EGjLJ3aWr0Q4CeiVdUFfu7X3WvrxQ9g=;
 b=EP18PGiQ4KIPeI+HpiHwO/9iCKn6sZDbrtxaho47t/nTMan19dDNWrXk7ZMl/AzqyPXWr0IsBpShOICLgjPnTXbdWwgAgZxuuc7Jj1AaVdkyKpwjvvUJuZXdYZ+gx3dXiCYVOU7mZfFkuXvlda+3iRXYb0pOY3WY91g41fwA0vHkruV7tuse7a8lihGS++IbOMNBj97zjzWUs5XdcV9fFblxoBsYn+JqMRfs3sjOmJKIQVBF5ilituNyFAMYlTUB6D0tlLB7rUozvBMWfIDlQKZJ9tl4f0zrm4ixnNmdjmFfLxoAqAZBDMvzwFPVQSAevJ47AbBxNGIseIrI3abqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1nJTc7M9Ug5EGjLJ3aWr0Q4CeiVdUFfu7X3WvrxQ9g=;
 b=Vmj61XdU8m32a3FNz6FKibfjFebaXFQv6JkH6GeLf9zJPggY1rfrwu5LvyYnfqWQMqfpjAQk54MUGdNvCDsYCR7hV4mLPtC/z2DpTbYMejpvd7l37qs6dLBYA170XSpHJsiqKYXUSncUthXtLyDLk8xT7PAOoBu42TeG5EsM+8o=
Received: from PAWPR08MB9966.eurprd08.prod.outlook.com (2603:10a6:102:35e::5)
 by AS8PR08MB9193.eurprd08.prod.outlook.com (2603:10a6:20b:57d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.36; Fri, 20 Jun
 2025 09:27:53 +0000
Received: from PAWPR08MB9966.eurprd08.prod.outlook.com
 ([fe80::be59:a46b:ae74:347c]) by PAWPR08MB9966.eurprd08.prod.outlook.com
 ([fe80::be59:a46b:ae74:347c%5]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 09:27:53 +0000
From: Philip Radford <Philip.Radford@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, Sudeep Holla <Sudeep.Holla@arm.com>, Cristian
 Marussi <Cristian.Marussi@arm.com>, Luke Parkin <Luke.Parkin@arm.com>
Subject: RE: [PATCH 0/4] firmware: arm_scmi: Add xfer inflight debug and trace
Thread-Topic: [PATCH 0/4] firmware: arm_scmi: Add xfer inflight debug and
 trace
Thread-Index: AQHb4RSKr8fZZD8ejkycuWOIE0be7LQLvX0AgAAK6BA=
Date: Fri, 20 Jun 2025 09:27:52 +0000
Message-ID:
 <PAWPR08MB9966E79130C52CA8460AC4B7897CA@PAWPR08MB9966.eurprd08.prod.outlook.com>
References: <20250619122004.3705976-1-philip.radford@arm.com>
 <20250620084634.GB27519@nxa18884-linux>
In-Reply-To: <20250620084634.GB27519@nxa18884-linux>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAWPR08MB9966:EE_|AS8PR08MB9193:EE_|AMS0EPF000001B5:EE_|DU2PR08MB10185:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c5cc54-9bfb-40dc-e6e3-08ddafdccfc6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?nlr/rwie1S8NUIah5o/9j27v5/x5SrSzH5+fZ1OTcBMvYW6XL0MPdPv/OTa3?=
 =?us-ascii?Q?YYGztTZVL/yhmD0HFH6gsVY3D0waGyll+ZytpcoOrf5rlr54vMD40EChmqxR?=
 =?us-ascii?Q?hvrJbFtPd+3Xa0xyxdDg4GRtjSwynyDaLCrKkHscSj3Op92y++OZiYSM5jTy?=
 =?us-ascii?Q?WWFsNMyfFe+IcWMuoKco2AE+O2KVJrpbN2bNrlnuvWhJxDQHvspMwxJNvdmf?=
 =?us-ascii?Q?Agq3df8qcRUd0tONJAFimGOMl5Mx7adxYgV8pLrcaXDZMS5lyiFwj7sKZEA6?=
 =?us-ascii?Q?x9jSRFekVlhFpHL8k2uI8d1RxwAi7Qq9e6a1yldZktG1CuNNyJeXep4yEaQu?=
 =?us-ascii?Q?NNOiYj82uehJYzRhUkiAxKWYyh7M15PIwNhnjJHAJUyE8jjt3g8dkXAe5OoL?=
 =?us-ascii?Q?ILcJigTyKhhqSj9uBDKqpyw5EYQIGMenvroNJNjWkdKWimgEF7sDRbVH1EtP?=
 =?us-ascii?Q?Cx4AsH8P3k7LnCsC01fNdLp9OVv43xS8ZzlwDUkCUFU7Y4yr1+GRkkXzngbG?=
 =?us-ascii?Q?zMzK2XCfdaQ+NaUAKJ/cPxi3mv6I0LLrrwNsGD1qzPL1GdemVX9vNRhH3/pg?=
 =?us-ascii?Q?u7H7aLMMzfrOeSg/mzIURmi41wIrkpf1kKG/PYKNYDD3UFc8fSfn/yGhlywi?=
 =?us-ascii?Q?7z5hlP2mbZll9rzDTRm1C33PIsycpuEUmnhMdUs3okNIeyvsY/ei4obTpn3K?=
 =?us-ascii?Q?gufG2JlJkoyDVMIZBqWB5BizGXbUcZO5MF+5JuN9rAndlQ+BH/BXMQaTh6bz?=
 =?us-ascii?Q?5Pr9NfjrGUkcZ8CaphkCok7d71ijxyqq5F4CXyW0BNQgsNJSCVnzrh87QRE2?=
 =?us-ascii?Q?GpqRbf3fGEgJk8aK35jJ8ptVBjtmJ0AhkN7c/mCyWlzBqpaivpy9MKIUPEa5?=
 =?us-ascii?Q?MtOnlx1ara9jzAAAO6cVNB/4FbNqqpTwfauAW/eOFwq1l+wigixdEvJCpR+n?=
 =?us-ascii?Q?bdSJ44Ys4+Olrdskovket0ABOdQrp5hcLOXScG9Vg7BmOxgqfr2grMis7QuV?=
 =?us-ascii?Q?f445P5yR/hKuNOrWVCZyuITOkIcUL3J7Y3hnwAhwO8qA+1vt84aOJtqs1kGC?=
 =?us-ascii?Q?CFi1dgGAHLr4jQFU6pfjGMyg44ju36OKlWErD0M1zZ9YLk6FoXxI2hHs0JbW?=
 =?us-ascii?Q?MAi+QH2a/VpfHUnIdpJf1F/NLMC3+fjXDpaPv9B1+IsgymB6fatgQxS0qTv/?=
 =?us-ascii?Q?2zFZAqFFbNWpuPvaLpa5U8DqcBzwZJAfom4L84T8VVMCecISVK+rxxjUfo1Y?=
 =?us-ascii?Q?k+9JE5jNIAs4Q3Sz8yoimRULfBN16Wi4ubOeVQc5I8o5jIU8tj0hjQdc2a7G?=
 =?us-ascii?Q?NZATNPjtNyOAvrvMLFrDc7dCcFbcghBOn2GtwKbDBra4VKBeBbZfbMG8d9GX?=
 =?us-ascii?Q?lS/ZWGbDAYlJ+mOEBmIzZDrTs+ShyM2Y57yJl+o4QZPXQHkYq5SgWRqc6euI?=
 =?us-ascii?Q?xxmu+AM5XxIljTH2AH4ewgqaWYDl2vqoqydPPmGMXPo0SWAlSd6z2fuO/hbz?=
 =?us-ascii?Q?FILLwpHoNqxIl0w=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9966.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	23440808-f0a8-4185-8b33-08ddafdcbb8d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|1800799024|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ah/cc/FHb+TfZos/qkfCGyOXzkKr4rOix15GMq/nXe6PERV41Y6zdVPj6jdP?=
 =?us-ascii?Q?F4/m4qfebwXtZvoK9gV0bNV5Qi+YF4NmU41AxtGHw1PzJ3+BQEdoJcyvHGex?=
 =?us-ascii?Q?N2WFR39tUxsJZrDH1enr7SozQheTdEBInVF6Vd9IwUkjnya3NGZJhGek+qyp?=
 =?us-ascii?Q?tqvfWkes8l53OGynxiOFNt1Q4GD+E8dqt/iiY1wqTfWoFG3JAAZPQrNO6wa/?=
 =?us-ascii?Q?zZuGCWDvftb1SaxivoMYRxdbBVvXCtuCzq4lag1Ki3bxgzKMSVV5HcrxlenQ?=
 =?us-ascii?Q?c46LG9HB1VktIOYe7GONJUkbiMmLDscUYFziyC7Fab/c0amW6aLbbtp0wd6h?=
 =?us-ascii?Q?JF831PZPaaewQmQ1FOMDkzdiKOBNJWzrcyjNcwNyTETCObiCB0ajv4k7E7FW?=
 =?us-ascii?Q?CLYEis9ZCf0ULOUJ1LJ+EHUapC5vn3IQ6xUoYRH/JVQckHReYXgnuQQsFqlR?=
 =?us-ascii?Q?9lyi7dSG6PR47lkx6p41PnqIVapT0dpc4qIZ+GXAawqPhj9vGvxaOTreXQZ3?=
 =?us-ascii?Q?XdQl/H1D1x3kFnd/dtsZMUHWCcP6Rm8G1p41XkQjob6cjU6h3XkqptBSpyfW?=
 =?us-ascii?Q?tTsv/6libraM8hnp6HdVFEA/wrzP1zQ2fzCzd1N+jEv6iG7HKeA//z+nH4rx?=
 =?us-ascii?Q?tv+X9fqyFAqAiShUBtluMPKsPrr4K2Ld0oJbJroAlUUUZlcGfiiAVngtATcT?=
 =?us-ascii?Q?pm6SbAvNnmZF+M4uSCSBCUyRfugNwQALlKK5K+qG6BXiwq5kRrkdtrqQsDXs?=
 =?us-ascii?Q?bZQLd7z+G73ZKbRROZzmzyZCkkEVkX3/am65jshgvbfypiGuSzSgStpCSK7H?=
 =?us-ascii?Q?ygHDFApfQpqnSWRZ6FJNU+BPVt3vKN6CaBCoVnkbBYbmB9naA7KCYHFN51Ld?=
 =?us-ascii?Q?RVaFHhJW3mi0O2SDNTZ+gffLs8u2wcFGqIqol4kbG82m6w+wx6YdYyaT3FuP?=
 =?us-ascii?Q?cTh8WxvRNcuoJ62I686jO7ibXdWHYD3JN2B8gB0gpdxAu1yH6e7TLZLmdbbM?=
 =?us-ascii?Q?btOh0cX4YXUfjaJhRruOhIMsINuFwFiCbtvJtDoB9D4abxwlP9dN9WHsnoKE?=
 =?us-ascii?Q?u6A6Y134XszMWOZnXml5hRQQXRaAUUquOENT/7NLN29aM4vQWxlD352fDLCP?=
 =?us-ascii?Q?5JjheG6sepf1jcmZ+/rYvAbe+K+U7v8ArkYSEND1vyuwZg7a03r+NeoirUW6?=
 =?us-ascii?Q?QXI/SS4k0wteIanJMMVddN6x3shIKVV0+GYAUujmVc9uWwrd+s4VOaL2jALb?=
 =?us-ascii?Q?i5hiyDq7FJULuRjaIjGCr3OkleeL1s6FCV2NVgtiufrsTQIcr5dJMnq4Poo5?=
 =?us-ascii?Q?kKBCXVd8qK7waCh9ACvvno9b5NZvahb3y/OGZXF9/W0nSrjqh+fPrleIqs0/?=
 =?us-ascii?Q?skmq9+MoN8ngVDEiQ4IhEdZcuzbfviJsZKdf6q6KbGs+IX65ttzBeoiiWkq6?=
 =?us-ascii?Q?qL53GFGUBx2WLuoh1c9OtK0KDu90pAy08OwFYw02qGRQutGgupqCnZjWMJhi?=
 =?us-ascii?Q?pBUvUcPC0Ajr0LKDkr92VtsxFlpKEkOdK8ZN?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(1800799024)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 09:28:26.9139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c5cc54-9bfb-40dc-e6e3-08ddafdccfc6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10185



> -----Original Message-----
> From: Peng Fan <peng.fan@oss.nxp.com>
> Sent: Friday, June 20, 2025 9:47 AM
> To: Philip Radford <Philip.Radford@arm.com>

Hi,
Thanks for the review.

> Cc: linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; a=
rm-
> scmi@vger.kernel.org; Sudeep Holla <Sudeep.Holla@arm.com>; Cristian
> Marussi <Cristian.Marussi@arm.com>; Luke Parkin <Luke.Parkin@arm.com>
> Subject: Re: [PATCH 0/4] firmware: arm_scmi: Add xfer inflight debug and
> trace
>=20
> On Thu, Jun 19, 2025 at 12:20:00PM +0000, Philip Radford wrote:
> >Hi all,
> >
> >This series adds a new counter to the Arm SCMI firmware driver to track
> >the number of in-flight message transfers during debug and trace. This
> >will be useful for examining behaviour under a large load with regards
> >to concurrent messages being sent and received. As the counter only give=
s
> >a live value, printing the value in trace allows logging of the in-fligh=
t
> >xfers.
>=20
> Just a general question, is this counter count in flight messages
> for a scmi instance or it is per transport? I ask because
> one scmi instance could have multiple mailboxes. If counting based
> on scmi instance, it may not be that accurate.
>=20
> Thanks,
> Peng
>=20

Yes, you are correct that the counter is per instance, as are the other cou=
nters.
This would mean that if you have multiple channels you would see the total
number of inflight xfers across all channels, limited to that instance.
If the inflight counter is non-zero and something is wrong, it would not be
apparent which channel had an issue, however this is the same for the other
counters.

I feel like this series is a helpful addition to the current counters, but =
what you
have pointed out is something that could be reworked in a future series?

Regards,
Phil

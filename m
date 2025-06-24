Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010044.outbound.protection.outlook.com [52.101.69.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC857257435
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.44
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756718; cv=fail; b=QS7zu90y0sJ6xkR15/3mc3fyQqf9/aHO5mLx4QDkZ3OoERnL5+XSK3+3f496SIgxWNhxmD6RJFHKvOZJlrnMKPt5lWJDAPF27HFJR8nzI5tfRAb7pLjGyiMtc8vKrJvwDEdKh5l5F7BLD0/x3TssEZ+dA1Ic4T5MIxZTxHuCm6s=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756718; c=relaxed/simple;
	bh=JWRozIHSiQKPpSUOioCS3r5bU9G+tcKJufrmx4U7VMg=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XmWKm9wiVNwn3SUQfXYRUmcaaF9BSh5kZlzC0m5IaFmrZMh+UK3Ps/jFySkIjDapKS31Qp8nHqAafzOOhuVzJ1iW0P4EO5EyrvRuDzD699O0/e6Hym468FN6S8QNoA3oavlon0w2XndG2C23W4huAXxuPodn7gliKnDtsIQjtRY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SsY5VXzA; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SsY5VXzA; arc=fail smtp.client-ip=52.101.69.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SsY5VXzA";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SsY5VXzA"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MbByna85dtctWtICzVoMsCwjTVNz8hI6XRUeVAiT2E41uLrMsykl9/mYdstBkwkdtLmiAmjxmb3rpSwy7BphH3nR5BRV/Z7m2rSWfnSPalqfpkYzFU2RyAxxtrRuyES1FtiaVTr66PEtxBN/cuRn7WG10qDmB/HhqvnUp6EanPdyaoBPls0bWJLGt507ctloOJc+XxJh/rHPFPMpsG4tqRP7G23/heiGHAV5Y6MghOfRUZlNQOvMUu34l3p+1bpqX7SD8udn4PHn0Oi43MKgWDIiEPQR8T4XKY2yfB1CnD8ciqob36XzAUIeg31JYSkGLWCR58y0rZIuDcFjD2dkzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4RJHTVyAcT8Cg4CQGkd7FcYcO19Q21F5sb8Fd7vUNU=;
 b=BZri78OQ7Z73LIER+iardzERiV+1uRuKh8yD+i+x/GixRrZp45riA46NiBetUfo51Rxa/R41BfYqamQ0YRnYhIO3VBG5x4hBOPzfupXRupYIQPW5OcCJMrHeVyTD60fkTul7R6evvPuijZLH3VyYU3uaHYF6HV+61QbYFspbThV1+ccY7i5pZhayZPDmD33QSh7RhPfFQElrafvdgr9GkhnLBROJgTobdy6BlZQA7+eZYxxFm1vsCd8ZzK2WMcTlAzTn8Q9Qv7KlHUWrAV/IMNS/yArkH+wxR2IJw4iBy2p4pZ0Af5yeSnTpBxhct1sLrba1qqQ43rYRPNrtNbVH5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4RJHTVyAcT8Cg4CQGkd7FcYcO19Q21F5sb8Fd7vUNU=;
 b=SsY5VXzAXSOkpnL+B0l5+gKNAO0iS66sDsNtZuE+Va0CYFDTXCa9Mx7qMYRed41w1WUNZ2Mu7MHXF4S4BST3YyHLtjGbvSEf+xxDJOs3APLoUODm1dAXJzDyp/Xe7nUy04YFRYoCi/srDRywMWRhywCW1hFgEOsGS3VhfvnyCZ4=
Received: from AS4P189CA0064.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::24)
 by DB4PR08MB9382.eurprd08.prod.outlook.com (2603:10a6:10:3f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 09:18:31 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:659:cafe::de) by AS4P189CA0064.outlook.office365.com
 (2603:10a6:20b:659::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.31 via Frontend Transport; Tue,
 24 Jun 2025 09:18:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Tue, 24 Jun 2025 09:18:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqOtFzSM+rOvlWOCNbpopN8RWzamSPgRWR3FjjlbbUgNwO3hIxW9X4VnHzTqtDNrnAL919izO/VJagRVJwkA+PQ8XHtPQHTvY5XI9VMUftW7YnRI9tJMYVcUtsQB08spBV7UeWSSZ8gOX5AIe6H97AooKZDBuizRVk1Q709S120yzgdGU4bcgXl00K1YHirfkX1OTzYw4xTniNFzzypCYQdAHv76g2QpvKP6Z6VnBE72JYcBnwyXvlJbY3y8z2TNGtFMYr3NsHIR7XGiYQtLX36xXOPHdbCm8vszGc0O7lnBQOLK2+CLaeVwWK9OdW4yjpVXoI/l9HFokNEtyPajZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4RJHTVyAcT8Cg4CQGkd7FcYcO19Q21F5sb8Fd7vUNU=;
 b=F/N+U3k/s7crED78siq2N/jMbgyCR4rEeNKfHe3Me65Nb2rbS3w/MSW4ljyMtERaFoL5BvzbMzEdFqUh8YRmzVHZY1DTPltxXhZU3EpyB/SJFJPi7Shh7nPP5MPp8tGvds+QAHfMha2v++iMQYxiAveoWc+aI0IE5f9yxhCWSKmIdQxIxvgbwcgqQn7c9KrJu/zecv9fUTCnxena0NtFyGhGMc3YSEKFwckpduakNWkcrI8oWwq6TInFwQemaPOQEjB25RY+rbc5Uxj2clyhQdz/AWGlQDH7ccTeDQuR1plYXztSO9+A6VMT2FdL4mWvj6JKBNrvBWwQeunQ/6J2cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4RJHTVyAcT8Cg4CQGkd7FcYcO19Q21F5sb8Fd7vUNU=;
 b=SsY5VXzAXSOkpnL+B0l5+gKNAO0iS66sDsNtZuE+Va0CYFDTXCa9Mx7qMYRed41w1WUNZ2Mu7MHXF4S4BST3YyHLtjGbvSEf+xxDJOs3APLoUODm1dAXJzDyp/Xe7nUy04YFRYoCi/srDRywMWRhywCW1hFgEOsGS3VhfvnyCZ4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com (2603:10a6:102:8e::21)
 by GVXPR08MB11131.eurprd08.prod.outlook.com (2603:10a6:150:1fb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Tue, 24 Jun
 2025 09:17:57 +0000
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d]) by PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 09:17:57 +0000
Message-ID: <07cd2109-bc75-4838-96fc-2dab37756584@arm.com>
Date: Tue, 24 Jun 2025 10:17:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched/events: Improving scheduler debugging/testing
 tracing interfaces
Content-Language: en-US
From: Luis Machado <luis.machado@arm.com>
To: linux-kernel@vger.kernel.org, peterz@infradead.org,
 dietmar.eggemann@arm.com
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com
References: <20250409151338.1046335-1-luis.machado@arm.com>
 <1214790d-5f2a-4bc0-bf9a-ac1688174f21@arm.com>
In-Reply-To: <1214790d-5f2a-4bc0-bf9a-ac1688174f21@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0175.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::19) To PR3PR08MB5852.eurprd08.prod.outlook.com
 (2603:10a6:102:8e::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PR3PR08MB5852:EE_|GVXPR08MB11131:EE_|AMS0EPF00000197:EE_|DB4PR08MB9382:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e17cadd-52f1-4fe3-3f2e-08ddb30015e3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TldUYnA3WWFOK2ZaSVRSTy9IM2RJQktHTTNHUkZJaWNZVC9semFDWXNXL3Nj?=
 =?utf-8?B?UjY3aDFlcW5iWmNDVXp0QSt6WU9nNEJBNk02dS85eTJMVStIV0k3NUEwTXoy?=
 =?utf-8?B?cmhUdEQ1VmhXNkc0Z0U1T2ZpSU1BSnNCai9QVGFmcE9USk5tWDQvL1UzQ2Vj?=
 =?utf-8?B?ZUJWMktTa0IybllKeFl2cTVsOUp5TE9zZjNEY012OVp0YjJmOXl1UHVZU2RP?=
 =?utf-8?B?bjhYS0o5aHowQ2xnQlR4SHN2eUlQRjRubjZWVnNLVzdXM0w3ekF6TUFUQlVx?=
 =?utf-8?B?L2pJaDA2UlRjU0JFUDNaS2FUQ3VVaWY1WExYQUhlQlhiZTZnTzN1QW5rdTdq?=
 =?utf-8?B?QXJiR210cnBURXBZK2c0RU83cnlBSGxHUnZ1RmE3ZHdQVHBwTEV2eHdnbXor?=
 =?utf-8?B?emJjNGc2Y2FZOW5NU3NyNXRPUkw5dTNqOXNnU3dYdFRhdnYvUVdNVVlaL1RX?=
 =?utf-8?B?NkhmT1l6SWlxOHQ4VElheE9scS9hak5VdmFLV0ZTSkJ6Mkg1ZzFBb3JtRzJz?=
 =?utf-8?B?RWJ1VVBJT1RhUUk4ODRJK1FoY2daeFBGK0l4Y3QxS1JmZklJWFVjSkozQWgv?=
 =?utf-8?B?OVFmRy9XNHpQR2E4SXlrdHJtaVRTVzRuNDZ1UmoydE5BZnVlN2dYdHIzbVZI?=
 =?utf-8?B?RlZMV0IzbXcrU1JSRHJwVXhudUZGa1RJUkkvYnhoU01EcU93MHdKSnpHMmRk?=
 =?utf-8?B?OUpHMUY1VDhxVlZDcCt6SnhLTDlPc1BrTFhPYmlkeEFBSXh3RjhBTWJsSWdm?=
 =?utf-8?B?RXNuMEZMRkMrcDVUeC9MdSt2UTMxbDh2WndhclJJTW02THZlLzJKbEVPeG5D?=
 =?utf-8?B?UWQ0NDJpQWpFeW4vQ0JZbktKQVVKQnRrOGhZUVdQZ2tIWEluQU5RaWdua2N6?=
 =?utf-8?B?VjBza25mQ3NuZ0JhQnFRUHFQeVBPUEM5OVRlSnNaRjV3K3VPZ0d6dkVQZ25v?=
 =?utf-8?B?U3FzbmF5N25WTTJVOUx6UC9TdEU1WWNpMGlNVUVpMEo5djZhK3h0YjFoOUlT?=
 =?utf-8?B?NmlPT204TURQeGY4OHNBRVI2TkxBdjhPdyt2SEpGQXFnZ04wUEZYWjJhdkdR?=
 =?utf-8?B?QWJ3dDNva1ZHTTB5Ykc5VHhmaTFRblNYdC95SWxLekdaQ0RMdUZ4V3p3VVBR?=
 =?utf-8?B?cWVQaEJ2ZE1pc3B6bExwRVU5aTl0OFhIVXhoQ0p1SjhoRDNCS25UeEtEUVdD?=
 =?utf-8?B?TS9LQm9vaFR0bm8yOSsrSjJVZ000SDhUdk1Pa3N6WTVpRzJSYS9lZEVrOVRY?=
 =?utf-8?B?cUNOdVhzQzY5MUVnVnhjQmZUUkIxeDlUKzRIZHljRkliTHhvWlNPYmhaRi9z?=
 =?utf-8?B?QWhmSVdBU0R5aDNPQkNET0dCZzl4b3BmcHJhMlQxeThTemZ4YWovai9ER2VZ?=
 =?utf-8?B?Z3BPVUpxaGYyQXFNek9heEdoQnhlcnRXYXVTM1dHVTk2S0srME56cEJMb1pW?=
 =?utf-8?B?SU9sWTFkWDlST3dMTEJ3V0RFU3E3ZkE3Y243VGV3ZWkwQkx2ZHhJRk1CRGVh?=
 =?utf-8?B?Q09iRWRUOVhJS1FaU3ZYamxrZ2dJdFdQK0trSEt6aXJTVE56NkMxWi93WG01?=
 =?utf-8?B?NDBLUUFUb01qaFJHNWJDOTFtdndlamNqa0VMdDZmOEhpTWw4VUFROERURDZk?=
 =?utf-8?B?c1RUdzNTSFRrMCs3SW9jaHVOOHpaR1AzUWFVNHFTVFZmSmdjbXNadzZQcWtB?=
 =?utf-8?B?d1Jkblphdm03allmNktFd2s4T0dVZXNYWkt4Zm5KaW9CcHhnN0V1cGo5STho?=
 =?utf-8?B?dWlMTW5xWmxUakQrckJCSS9ucFBHU1poTzJrY0ZUZlN1RjErUGwxUXlvcDdy?=
 =?utf-8?B?SDA0aEZYM2JkOVh0OUUvb1lmN0FqRFBlWEo4b1YwSk4wYVpFUDJkck5Kb2dq?=
 =?utf-8?B?TWxKd2JraFp5UzNmZDZxZHhpeDRtbkVGMjVZanhxeTU2YnIybnJ6dk5PV3dm?=
 =?utf-8?Q?hyt8ocNPxKM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5852.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11131
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	26adc22e-d599-4fc1-39dc-08ddb3000218
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|14060799003|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b24rcVZXa3JLakF1VTkrYlpBUkcyOVNjTUtTQlVacjNJeWczS1J5RWxkcUZa?=
 =?utf-8?B?WUloSm5sVWlNZWd5eHF5cW5lT0p1QUxEMm1Ta2tFdThDQitPa05vclBVYkcr?=
 =?utf-8?B?engxSmZKQmdRWmx2ZVhmZll0RmFESlNiZFVUamIxeGlhTHhqc3dYeUNEK2FE?=
 =?utf-8?B?ZW1xcTNEUU84OHA0NGFIVnd1NnVpZkRPRXA5QW5oQjhzR3V6dFJBT1N6alR0?=
 =?utf-8?B?cjBHN0pDYThHeThDN0FjRUdPaGlJNTFnZW1pK3B3NElzQjJZeDRIOWNBNm5p?=
 =?utf-8?B?Mi9jNWgvaC9ZYVhMQ2hlY1llci9BTktZVWQwelY2TTlxOC9zamNXcVZIbmtL?=
 =?utf-8?B?RVFPN1Z5YUo2cnB0NmFmaGlzbzJyLzVXQUFJR3JVd3NBRko2d1F6bDZaSzZJ?=
 =?utf-8?B?S2lhUEk5Y1pBOGdSMElRNWZvbWpOREhRT21KR3p3UU5wV1pmMFJJQWpUZFdS?=
 =?utf-8?B?Qm84L2xiMWN2Nk05eHdSdjNWQWN6UlJzSUVxdkJpTnBtZkNrWkdCRXF0cmky?=
 =?utf-8?B?d2JaT0JEdjJKOU02NzVDdUtiVzhrdTN4cWtrUE82NWVFV3FPamV6UWJoTlpy?=
 =?utf-8?B?TUdUMUN5N0RndjBwREtqcHNYd2FaRzVCTEplREVuN09sejNnTzBVZ3p5UUJl?=
 =?utf-8?B?aVRubzNYRUtyMWxpNldKdkhhb2ZlM1VMVTh1MjYzMHRhUUN0TFdEYmJ2MjZM?=
 =?utf-8?B?NTVBYllJN3V3cmx5THVXUzVTV25USWNYRTRpdGRPMXd6dHRXZGZFdEdRTFh1?=
 =?utf-8?B?OUxYWk5yaHJla2QrendsSDVET2JlakZCUWE1eWFaa1lEOUpKcmhBUSs5a3hK?=
 =?utf-8?B?RWJrSTNORGxCSSszNUg0b3RsRWRDV25Kb2Nac3J4OVBOYm1NRUE5cHpySytB?=
 =?utf-8?B?RGphbVlnRjlMaGZHOGh6YU8wdG0xQU94Z0gwWUV4QS9OR0pWc0dLNkc5OFRh?=
 =?utf-8?B?eVRlYWcvQXZ5QlpHVUk5YW1hMG9mTlp5Q29OZGQ3WE1aWXJXazFpZlRqcjlz?=
 =?utf-8?B?bVB4ZzZHRFl3c01HbERuSkFHYjJzUFp2akJBb01nMUlLT0UwMGV2MHozbThB?=
 =?utf-8?B?T2RzQk9ZMjl6aStDZ3hMVU1tNXRLWUNLSGJXaWNELzFqUjk2eGFzSEZSUkdF?=
 =?utf-8?B?MmJBUDN2L25ORWpjV3lGaG8xVWI0b0lZd0pOMWZac0JRSldCNTBNV3BYeDFO?=
 =?utf-8?B?V2JnUmdHR2tRSmpnbVRxL3c4MWtLenpFTTh4L2ZVV1dHWTUxenJ1VExzM0dh?=
 =?utf-8?B?ajJmKzR3OWQxYXhtbjRGbDZ2WDJkOXM4MFpsYmxGUU0wakJiMG1UNDVXZlpL?=
 =?utf-8?B?V00xUHBmWjBaWXg1Unl2ZmVkeTJrS0NyV2Z3T2xUZ2NrZ3N3ZmxIcjU3b1VC?=
 =?utf-8?B?SmxnZ3VtL2xaNksreU9rWGF0Y0Z6TzdlYUVKWXF6TXA2aDl5ejdiM2RrQTB2?=
 =?utf-8?B?QnJka0RhK2NHenJxTHNJOFhHbGxzY2R4WEVQZjB1bWJxemthVmV3Y1NMSExj?=
 =?utf-8?B?UXQwaENIeU1UdnMxekEzdjB6dFA2UWNaN052Z2FkQmVJalE5V0RxeWUxaDVN?=
 =?utf-8?B?Nkk1UnlrM1NNM1F1T09FTTF6WVhlTUF6SW0wU3kvRCs1cFQ0Z0tqTDBNQU5m?=
 =?utf-8?B?WDUzVW9HdWpBWWFZQ1ZXOWNzUzQvZ3Zpcy9xNys4d1hqaTBSWjJDWGNLaE9a?=
 =?utf-8?B?LzMvSk1naERWczFUTmxNMkIyMFdMc1Bvb3VtNGdBSXZ4Qk1SQi8raDdHZWt4?=
 =?utf-8?B?RnZSWlYzN2dtN0psSGFKZGQrUXkvS1dmMWtKRjIzc3ZGQTVabVRaM2FIT0s1?=
 =?utf-8?B?eWQvWVE1YTZhSm9WL2xXaGFrbnV6VmlhOGZlL1ZYY0o2dm5vNXM5eXRKZmpq?=
 =?utf-8?B?UytiY3RMNTZ4djlNaXBSM1l2Y1FxRlJmdng4ZFRqaGZRMXF4bm9ZQk9MSjRz?=
 =?utf-8?B?aEIrL09IOXVqblpBdWxydm9pUnc1dE0yMmhkRlhVRXpZRHdzWURzeHowbWl1?=
 =?utf-8?B?cUkvTmlJZFhmWnplQU94UVd0TTJ2ZXR6WmJQbWk3S3N6aEVGb3dRTm96bDVE?=
 =?utf-8?Q?/An1xs?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(14060799003)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 09:18:30.4056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e17cadd-52f1-4fe3-3f2e-08ddb30015e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9382

Ping?

On 5/6/25 15:13, Luis Machado wrote:
> Ping?
> 
> On 4/9/25 16:13, Luis Machado wrote:
>> This patch is primarily a proposal aimed at improving the observability of the
>> scheduler, especially in the context of energy-aware scheduling, without
>> introducing long-term maintenance burdens such as a stable userspace ABI. I’m
>> seeking feedback from the community on whether this approach seems viable, or
>> if there are suggestions for making it more robust or maintainable.
>>
>> Today, validating that a set of scheduler changes behaves sanely and doesn’t
>> regress performance or energy metrics can be time-consuming. On the
>> energy-aware side in particular, this often requires significant manual
>> intervention to collect, post-process, and analyze data.
>>
>> Another challenge is the limited availability of platforms that can run a
>> mainline kernel while still exposing the detailed data we need. While we do
>> have some options, most devices running upstream kernels don’t provide as
>> much — or as precise — information as we’d like. The most data-rich devices
>> tend to be phones or Android-based systems, which typically run slightly
>> older or patched kernels, adding yet another layer of complexity.
>>
>> As a result, going from reviewing a patch series on LKML to having a concrete
>> good/bad/neutral result often involves several intermediate steps and tooling
>> hurdles.
>>
>> Our current data collection relies heavily on existing kernel tracepoints and
>> trace events. However, adding new trace events is increasingly discouraged,
>> since these are often treated as part of a de facto userspace ABI — something
>> we want to avoid maintaining long-term. So extending the trace events set isn’t
>> a viable option.
>>
>> To work around this, we use a kernel module (LISA) that defines its own trace
>> events based on existing scheduler tracepoints. This approach gives us
>> flexibility in creating events without modifying the kernel’s core trace
>> infrastructure or establishing any new userspace ABI.
>>
>> For the past few years, tracepoint definitions for the scheduler have been
>> exposed in include/trace/events/sched.h. These definitions are not always
>> made available via tracefs, and are documented as being for testing and
>> debugging purposes — which aligns well with our use case.
>>
>> However, this approach has limitations. One issue is the visibility of
>> tracepoint argument types. If a tracepoint uses a public type defined in a
>> public header, we can dereference members directly to extract data. But if
>> the type is internal or opaque — such as struct rq — we can’t access its
>> contents, which prevents us from retrieving useful values like the CPU number.
>>
>> One workaround is to duplicate the kernel’s internal struct definitions in
>> the module, but this is not good: it’s error-prone due to alignment issues and
>> requires constant tracking of kernel changes to avoid mismatches.
>>
>> A better approach, which we currently use, is to rely on BTF (BPF Type
>> Format) to reconstruct type information. BTF allows us to access internal
>> kernel types without having to maintain duplicate struct definitions. As long
>> as BTF info is available, we can introspect data structures even if they’re
>> not publicly defined.
>>
>> Using this, our module can define trace events and dereference internal types
>> to extract data — but it’s not without friction:
>>
>> Struct members are often nested deeply within BTF type trees, which can make
>> it awkward to navigate and extract data.
>>
>> BTF describes data types, but not semantics. For example, sched_avg.util_est
>> appears to be a numeric value, but in reality it encodes a flag alongside the
>> actual utilization value. The kernel uses the following helper to extract the
>> actual data:
>>
>> static inline unsigned long _task_util_est(struct task_struct *p)
>> {
>>     return READ_ONCE(p->se.avg.util_est) & ~UTIL_AVG_UNCHANGED;
>> }
>>
>> There is no way to infer from BTF alone that this masking is needed. And even
>> when such helpers exist in the kernel, they’re often inlined or unavailable
>> to modules, so we’d have to reimplement them — again reintroducing
>> maintenance overhead.
>>
>> To address these challenges and reduce duplication, we propose adding an
>> extra argument to certain scheduler tracepoints: a pointer to a struct of
>> function pointers (callbacks). These callbacks would act as "getters" that
>> the module could use to fetch internal data in a safe, forward-compatible
>> way.
>>
>> For example, to extract the CPU capacity from a struct rq (which is opaque to
>> the module), the module could call a getter function via the callback struct.
>> These functions would reside inside the kernel, and could leverage internal
>> knowledge, including inlined helpers and static data.
>>
>> Here's an example of the proposed callback structure:
>>
>> struct sched_tp_callbacks {
>>     /* Fetches the util_est from a cfs_rq. */
>>     unsigned int (*cfs_rq_util_est)(struct cfs_rq *cfs_rq);
>>
>>     /* Fetches the util_est from a sched_entity. */
>>     unsigned int (*se_util_est)(struct sched_entity *se);
>>
>>     /* Fetches the current CPU capacity from an rq. */
>>     unsigned long (*rq_cpu_current_capacity)(struct rq *rq);
>> };
>>
>> The idea is simple: given a base type (e.g. rq, cfs_rq, sched_entity), the
>> module calls a getter function that returns the data it needs. These getters
>> encapsulate internal kernel logic and remove the need for the module to
>> replicate or guess how to access scheduler internals.
>>
>> Since these additions would be part of tracepoints used for
>> testing/debugging, they are not considered stable ABI and can evolve as the
>> kernel changes. It would be up to the module to adapt to changes in available
>> hooks, types, or fields — something we already do today using BTF for
>> disappearing types (e.g. struct util_est becoming a raw integer).
>>
>> While this approach would require some extra code in the kernel to define the
>> callback struct and register the functions, we believe it would significantly
>> improve testability and maintainability of tooling like LISA. It could even
>> be extended to support non-energy-aware scheduler debugging scenarios as
>> well.
>>
>> Our current testing pipeline already makes heavy use of LISA [1], which
>> automates test execution and data analysis. It also integrates with rt-app
>> [2] to generate configurable workloads.
>>
>> The attached proof-of-concept patch adds three such callback functions as a
>> demonstration. We’ve tested this against a modified version of our module
>> that uses the callbacks to fetch scheduler internals.
>>
>> We’d appreciate any feedback on whether this general direction makes sense
>> and how it might be refined.
>>
>> [1] https://tooling.sites.arm.com/lisa/latest/
>> [2] https://github.com/scheduler-tools/rt-app
>>
>> Signed-off-by: Luis Machado <luis.machado@arm.com>
>>
>> ---
>>
>> v2:
>>
>> - Fix build failures related to unavailable cfs_rq avg field and lack
>>   of arch-specific capacity and frequency variables.
>>
>> ---
>>  include/trace/events/sched.h | 27 +++++++++++++++++----------
>>  kernel/sched/core.c          | 30 ++++++++++++++++++++++++++++++
>>  kernel/sched/fair.c          | 16 ++++++++--------
>>  kernel/sched/pelt.c          |  6 +++---
>>  kernel/sched/sched.h         | 13 +++++++++++++
>>  5 files changed, 71 insertions(+), 21 deletions(-)
>>
>> diff --git a/include/trace/events/sched.h b/include/trace/events/sched.h
>> index 3bec9fb73a3..ac45fb9b1f5 100644
>> --- a/include/trace/events/sched.h
>> +++ b/include/trace/events/sched.h
>> @@ -793,6 +793,13 @@ TRACE_EVENT(sched_wake_idle_without_ipi,
>>  	TP_printk("cpu=%d", __entry->cpu)
>>  );
>>  
>> +/* This struct is declared here so the tracepoints below can pass
>> + * these types as parameter.
>> + * This is only used for testing and debugging, so tracepoint probes can
>> + * use the callbacks to fetch the data they need.
>> + */
>> +struct sched_tp_callbacks;
>> +
>>  /*
>>   * Following tracepoints are not exported in tracefs and provide hooking
>>   * mechanisms only for testing and debugging purposes.
>> @@ -800,8 +807,8 @@ TRACE_EVENT(sched_wake_idle_without_ipi,
>>   * Postfixed with _tp to make them easily identifiable in the code.
>>   */
>>  DECLARE_TRACE(pelt_cfs_tp,
>> -	TP_PROTO(struct cfs_rq *cfs_rq),
>> -	TP_ARGS(cfs_rq));
>> +	TP_PROTO(struct cfs_rq *cfs_rq, struct sched_tp_callbacks *sched_tp_callbacks),
>> +	TP_ARGS(cfs_rq, sched_tp_callbacks));
>>  
>>  DECLARE_TRACE(pelt_rt_tp,
>>  	TP_PROTO(struct rq *rq),
>> @@ -820,24 +827,24 @@ DECLARE_TRACE(pelt_irq_tp,
>>  	TP_ARGS(rq));
>>  
>>  DECLARE_TRACE(pelt_se_tp,
>> -	TP_PROTO(struct sched_entity *se),
>> -	TP_ARGS(se));
>> +	TP_PROTO(struct sched_entity *se, struct sched_tp_callbacks *sched_tp_callbacks),
>> +	TP_ARGS(se, sched_tp_callbacks));
>>  
>>  DECLARE_TRACE(sched_cpu_capacity_tp,
>> -	TP_PROTO(struct rq *rq),
>> -	TP_ARGS(rq));
>> +	TP_PROTO(struct rq *rq, struct sched_tp_callbacks *sched_tp_callbacks),
>> +	TP_ARGS(rq, sched_tp_callbacks));
>>  
>>  DECLARE_TRACE(sched_overutilized_tp,
>>  	TP_PROTO(struct root_domain *rd, bool overutilized),
>>  	TP_ARGS(rd, overutilized));
>>  
>>  DECLARE_TRACE(sched_util_est_cfs_tp,
>> -	TP_PROTO(struct cfs_rq *cfs_rq),
>> -	TP_ARGS(cfs_rq));
>> +	TP_PROTO(struct cfs_rq *cfs_rq, struct sched_tp_callbacks *sched_tp_callbacks),
>> +	TP_ARGS(cfs_rq, sched_tp_callbacks));
>>  
>>  DECLARE_TRACE(sched_util_est_se_tp,
>> -	TP_PROTO(struct sched_entity *se),
>> -	TP_ARGS(se));
>> +	TP_PROTO(struct sched_entity *se, struct sched_tp_callbacks *sched_tp_callbacks),
>> +	TP_ARGS(se, sched_tp_callbacks));
>>  
>>  DECLARE_TRACE(sched_update_nr_running_tp,
>>  	TP_PROTO(struct rq *rq, int change),
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 79692f85643..d4b4646f984 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -99,6 +99,28 @@
>>  EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpu);
>>  EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpumask);
>>  
>> +#ifdef CONFIG_SMP
>> +static unsigned int cfs_rq_util_est(struct cfs_rq *cfs_rq)
>> +{
>> +	return cfs_rq ? cfs_rq->avg.util_est: 0;
>> +}
>> +
>> +static unsigned int se_util_est(struct sched_entity *se)
>> +{
>> +	return se ? se->avg.util_est & ~UTIL_AVG_UNCHANGED : 0;
>> +}
>> +#endif /* CONFIG_SMP */
>> +
>> +static unsigned long rq_cpu_current_capacity(struct rq *rq)
>> +{
>> +	if (rq == NULL)
>> +		return 0;
>> +
>> +        unsigned long capacity_orig = arch_scale_cpu_capacity(cpu_of(rq));
>> +	unsigned long scale_freq = arch_scale_freq_capacity(cpu_of(rq));
>> +	return cap_scale(capacity_orig, scale_freq);
>> +}
>> +
>>  /*
>>   * Export tracepoints that act as a bare tracehook (ie: have no trace event
>>   * associated with them) to allow external modules to probe them.
>> @@ -8526,11 +8548,19 @@ LIST_HEAD(task_groups);
>>  static struct kmem_cache *task_group_cache __ro_after_init;
>>  #endif
>>  
>> +struct sched_tp_callbacks sched_tp_callbacks;
>> +
>>  void __init sched_init(void)
>>  {
>>  	unsigned long ptr = 0;
>>  	int i;
>>  
>> +#ifdef CONFIG_SMP
>> +	sched_tp_callbacks.cfs_rq_util_est = cfs_rq_util_est;
>> +	sched_tp_callbacks.se_util_est = se_util_est;
>> +#endif /* CONFIG_SMP */
>> +	sched_tp_callbacks.rq_cpu_current_capacity = rq_cpu_current_capacity;
>> +
>>  	/* Make sure the linker didn't screw up */
>>  #ifdef CONFIG_SMP
>>  	BUG_ON(!sched_class_above(&stop_sched_class, &dl_sched_class));
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 0c19459c804..e0ccc763ef9 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -4433,8 +4433,8 @@ static inline int propagate_entity_load_avg(struct sched_entity *se)
>>  	update_tg_cfs_runnable(cfs_rq, se, gcfs_rq);
>>  	update_tg_cfs_load(cfs_rq, se, gcfs_rq);
>>  
>> -	trace_pelt_cfs_tp(cfs_rq);
>> -	trace_pelt_se_tp(se);
>> +	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
>> +	trace_pelt_se_tp(se, &sched_tp_callbacks);
>>  
>>  	return 1;
>>  }
>> @@ -4698,7 +4698,7 @@ static void attach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
>>  
>>  	cfs_rq_util_change(cfs_rq, 0);
>>  
>> -	trace_pelt_cfs_tp(cfs_rq);
>> +	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
>>  }
>>  
>>  /**
>> @@ -4728,7 +4728,7 @@ static void detach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
>>  
>>  	cfs_rq_util_change(cfs_rq, 0);
>>  
>> -	trace_pelt_cfs_tp(cfs_rq);
>> +	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
>>  }
>>  
>>  /*
>> @@ -4865,7 +4865,7 @@ static inline void util_est_enqueue(struct cfs_rq *cfs_rq,
>>  	enqueued += _task_util_est(p);
>>  	WRITE_ONCE(cfs_rq->avg.util_est, enqueued);
>>  
>> -	trace_sched_util_est_cfs_tp(cfs_rq);
>> +	trace_sched_util_est_cfs_tp(cfs_rq, &sched_tp_callbacks);
>>  }
>>  
>>  static inline void util_est_dequeue(struct cfs_rq *cfs_rq,
>> @@ -4881,7 +4881,7 @@ static inline void util_est_dequeue(struct cfs_rq *cfs_rq,
>>  	enqueued -= min_t(unsigned int, enqueued, _task_util_est(p));
>>  	WRITE_ONCE(cfs_rq->avg.util_est, enqueued);
>>  
>> -	trace_sched_util_est_cfs_tp(cfs_rq);
>> +	trace_sched_util_est_cfs_tp(cfs_rq, &sched_tp_callbacks);
>>  }
>>  
>>  #define UTIL_EST_MARGIN (SCHED_CAPACITY_SCALE / 100)
>> @@ -4963,7 +4963,7 @@ static inline void util_est_update(struct cfs_rq *cfs_rq,
>>  	ewma |= UTIL_AVG_UNCHANGED;
>>  	WRITE_ONCE(p->se.avg.util_est, ewma);
>>  
>> -	trace_sched_util_est_se_tp(&p->se);
>> +	trace_sched_util_est_se_tp(&p->se, &sched_tp_callbacks);
>>  }
>>  
>>  static inline unsigned long get_actual_cpu_capacity(int cpu)
>> @@ -10002,7 +10002,7 @@ static void update_cpu_capacity(struct sched_domain *sd, int cpu)
>>  		capacity = 1;
>>  
>>  	cpu_rq(cpu)->cpu_capacity = capacity;
>> -	trace_sched_cpu_capacity_tp(cpu_rq(cpu));
>> +	trace_sched_cpu_capacity_tp(cpu_rq(cpu), &sched_tp_callbacks);
>>  
>>  	sdg->sgc->capacity = capacity;
>>  	sdg->sgc->min_capacity = capacity;
>> diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
>> index 7a8534a2def..7ca37abf46b 100644
>> --- a/kernel/sched/pelt.c
>> +++ b/kernel/sched/pelt.c
>> @@ -296,7 +296,7 @@ int __update_load_avg_blocked_se(u64 now, struct sched_entity *se)
>>  {
>>  	if (___update_load_sum(now, &se->avg, 0, 0, 0)) {
>>  		___update_load_avg(&se->avg, se_weight(se));
>> -		trace_pelt_se_tp(se);
>> +		trace_pelt_se_tp(se, &sched_tp_callbacks);
>>  		return 1;
>>  	}
>>  
>> @@ -310,7 +310,7 @@ int __update_load_avg_se(u64 now, struct cfs_rq *cfs_rq, struct sched_entity *se
>>  
>>  		___update_load_avg(&se->avg, se_weight(se));
>>  		cfs_se_util_change(&se->avg);
>> -		trace_pelt_se_tp(se);
>> +		trace_pelt_se_tp(se, &sched_tp_callbacks);
>>  		return 1;
>>  	}
>>  
>> @@ -325,7 +325,7 @@ int __update_load_avg_cfs_rq(u64 now, struct cfs_rq *cfs_rq)
>>  				cfs_rq->curr != NULL)) {
>>  
>>  		___update_load_avg(&cfs_rq->avg, 1);
>> -		trace_pelt_cfs_tp(cfs_rq);
>> +		trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
>>  		return 1;
>>  	}
>>  
>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
>> index c5a6a503eb6..2519da0c920 100644
>> --- a/kernel/sched/sched.h
>> +++ b/kernel/sched/sched.h
>> @@ -182,6 +182,19 @@ extern struct list_head asym_cap_list;
>>   */
>>  #define RUNTIME_INF		((u64)~0ULL)
>>  
>> +struct sched_tp_callbacks {
>> +#ifdef CONFIG_SMP
>> +	/* Fetches the util_est from a cfs_rq. */
>> +	unsigned int (*cfs_rq_util_est)(struct cfs_rq *cfs_rq);
>> +	/* Fetches the util_est from a sched_entity. */
>> +	unsigned int (*se_util_est)(struct sched_entity *se);
>> +#endif /* CONFIG_SMP */
>> +	/* Fetches the current cpu capacity out of a rq. */
>> +	unsigned long (*rq_cpu_current_capacity)(struct rq *rq);
>> +};
>> +
>> +extern struct sched_tp_callbacks sched_tp_callbacks;
>> +
>>  static inline int idle_policy(int policy)
>>  {
>>  	return policy == SCHED_IDLE;
> 


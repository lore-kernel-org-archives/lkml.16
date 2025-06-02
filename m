Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE4A523A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 17:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748886702; cv=fail; b=MeOdfgGBQ6mohJWwYPJqgPLCbY+a3/Q8vL4uaeaQENh+J+Xfl0f32sPf1lxRv5AwE7fluOYcQ3KsMpTs2AdEcDVbJqjiBYl3YZyWK9NZv0zuxoaBlSqNdqrp6GTSQbVOlY+r0GS8hyQS0p25nX6g/C4QH5DJ4u2TrE+QKTmKOYw=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748886702; c=relaxed/simple;
	bh=3efxnxcpjDw9G8PnKfLlnS4pgVztXOTmLc+1o6AHM4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LNPp5INaoke+fY9VHB5EThBab5LYv4g6tQ17YmNbbvYTzwNIPJ7dy2ffAuSq1nSXhgz8j3JuBmXCWefNNY1UMi/JiCiwXUmRHYyJ3DSJic3DYuN1B5YNxsDnzOgjM2KCQt4t43B2uahKa5h0Mc6MnK25CR6VqnVBy/lSUIBN/hA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nSyn8h7V; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nSyn8h7V; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nSyn8h7V";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nSyn8h7V"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sMFWhxLo3rhY+D9xi7ABDd7Vwqn+b/H4Jhs6rGmSHdcVe6UpZ4pkbAr3DIF22qFjz7Cbp7E5NcyEMZQdBuWzL7K85t6XosExnbUIqYyiV10fsknc4xaunGH7krWdrnbf4+yAJtQX7FfPwERNGyz6g7BNDirJ+zwoatLgEfW3JEtqbvMm5ruccspusOE2MCjJaUUAnbJTmoJ7bqp6iKQ5D1Vc1/xo1PM8y0AHS9eBCczej+H8eWdPZsxGiofHAZUagW/PmE+oxx9fZr5i+B8b2aTzMgH/k761nk7l9bpo8jwfyLBh5EC9sp6xC2KNtk5TgcxiTVfbtKcxDnh7ndZV2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/unZOICYgSu+qYWUE/qkyYJuACBrKdRnQBEh86VB8cs=;
 b=h6XyJCHNsDClQEjF6WXnuNfyU84s9BWyrAskUGwqDLPMStDFem7Shdq6C0whAsKSfvlCleUvnkcA55HWiNxLcIl9Dp3vtU3IRycl7FKg+fSKRNHX8wcP/4oqPO0eCHe3jsrWbbNAsIiq5oqjUBbaCsfvvKFMDv9Zkltdbd4MYJBYq82C+emXqAEan7t9YG2lFncUK8gxQlIJT5yLJtGo2Cn+zOZfAUapzOBeTS+cqQUisPkTDufzWIdxqGxApQmqf5cXqEv0I+x14TqK8YsCygw1+PreGbklt/X2kzAi0kOmRQwD4lWF8jBTjVpOG2r4T+sMJBn1JdDTnbRxk1K0ng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/unZOICYgSu+qYWUE/qkyYJuACBrKdRnQBEh86VB8cs=;
 b=nSyn8h7VJ8/Apd5/Mcn0nFUznfrrX3hF0yaFNaHByddCNGna6LWKAJPAl+Yy7aCIM8wjVXD7dYhCmL+cL7s99LnVmnnJ1aVCMVU5HNmQTNtsWXsvCMcrnjlTMUA17ZWQ6jBG/9VSwBsu52ORIE1TXfwAAjpyWdNdYq0PCv0pCmQ=
Received: from DUZPR01CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::8) by PAVPR08MB9555.eurprd08.prod.outlook.com
 (2603:10a6:102:312::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Mon, 2 Jun
 2025 17:51:33 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::6f) by DUZPR01CA0017.outlook.office365.com
 (2603:10a6:10:46b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Mon,
 2 Jun 2025 17:51:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 17:51:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leXtngoVoKcVXinegD1cGWen5okow2HZ6qkE3bYbhXmGwrmEMjChe68KimpaV63z481oS+HAMewa06muChSAWkYhG2cIX8fl51YZ5aRslaa6qXEulh6zun+jLn8ZR9xCVvObcLc68ycyvLCw3MFFaGb9LVAnFVcONHLYkVrXRPLiGOAH11ZZxmx6ovz3FcvZ27HcpfDcLN7KRVb7ztGXOKK7x57tFijZYkSB+72WuOpjV793gwfQVevKUwHK41CjLPoglhPkY0JcDiUge9ifQBGXfMshqjqgk0F8hCb628X31D3fVJzEBFSF0chqxb5oWgEB276XMg8xJDUmaDNvhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/unZOICYgSu+qYWUE/qkyYJuACBrKdRnQBEh86VB8cs=;
 b=jz+qnsnnQUMYNMfFEwXxmtRCu6xXT+5iRHk0EX/LTQlAOMJsbD8FhHbmchM2JViZJzvyxWP8VvN+1P28f6pIoViEIOIScYOBtrK6lviJH8S1PUnkiZWHdMxGqBs3brzmo6HEM0Z6S6Uo7FImiDJ+qtqk98cug9QwxIFa7teU2zLY9SD/VgUBbT2L+56EBZX8OwGi2zeT7nbYJ09GGOzqr1SpoEf3/p/O9GIdNMK2IJ4AhKfLKkH0V0LT7R03M5My+oH7OziWfG5o2Hc2o9ICh1RwzBODc/wHgohva2yv47528gmVPqP546un2L1vfDjGhuyqfVzl5QtRyvQEOjcHVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/unZOICYgSu+qYWUE/qkyYJuACBrKdRnQBEh86VB8cs=;
 b=nSyn8h7VJ8/Apd5/Mcn0nFUznfrrX3hF0yaFNaHByddCNGna6LWKAJPAl+Yy7aCIM8wjVXD7dYhCmL+cL7s99LnVmnnJ1aVCMVU5HNmQTNtsWXsvCMcrnjlTMUA17ZWQ6jBG/9VSwBsu52ORIE1TXfwAAjpyWdNdYq0PCv0pCmQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS2PR08MB9836.eurprd08.prod.outlook.com
 (2603:10a6:20b:603::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Mon, 2 Jun
 2025 17:50:57 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8792.033; Mon, 2 Jun 2025
 17:50:57 +0000
Date: Mon, 2 Jun 2025 18:50:53 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
	geert@linux-m68k.org, broonie@kernel.org, mcgrof@kernel.org,
	joey.gouly@arm.com, kristina.martsenko@arm.com, rppt@kernel.org,
	pcc@google.com, bigeasy@linutronix.de, ptosi@google.com,
	james.morse@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ada.coupriediaz@arm.com
Subject: Re: [PATCH] arm64/trap: fix broken ct->nmi_nesting when die() is
 called in a kthread
Message-ID: <aD3kfTx8sF8/Yar/@e129823.arm.com>
References: <20250530092723.3307630-1-yeoreum.yun@arm.com>
 <20250602124738.GD1227@willie-the-truck>
 <aD27GxSWsFekORcy@e129823.arm.com>
 <aD2_Jp7CQgnp15Kx@J2N7QTR9R3>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aD2_Jp7CQgnp15Kx@J2N7QTR9R3>
X-ClientProxiedBy: LO2P265CA0511.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::18) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|AS2PR08MB9836:EE_|DB5PEPF00014B99:EE_|PAVPR08MB9555:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f06dbea-b8c2-4812-9452-08dda1fe1c63
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YWFkVWxDS01GQXhmSDV3eEhvY1gyclNoOTNSV2U2R3lQYlh5aUZlQ3RYY0l6?=
 =?utf-8?B?K3gvMFhzSWgwcnczS3YxN2xGRnRCRWFwSTMzU21BRmZTWEw5OVEzSDhxWlYv?=
 =?utf-8?B?cnVoeEtlLzhlR01yb1o2RUljUnk3ZXh6N0M2NE4vQU5EbFE1Y1JQY3BvanMx?=
 =?utf-8?B?SzhBMnJiQTkyRGlhRS9hRmRkaVZhaGVmSDN3SFBqaEI0Sks1eDBjTldlRm5j?=
 =?utf-8?B?TUJBcEpLYkRrbDZpM0tWZzhIMWNQdTNPOUdJOGltaFVZSm5GTk0xWUdXSVRS?=
 =?utf-8?B?elV2b0swSmVlM0VQc0N0T0tnOXVEZVdtdWVCUVBTS29xMDluUnZrelNtSW1u?=
 =?utf-8?B?Z2xmKzVPcFVNQkJISzFuSDZZQmVDY05WdGVsS3Z4NG9GbTVJVFZxdHRBc0tG?=
 =?utf-8?B?UzJTb3RyeTRSMENtSjFFeGk3MkhxQ0dVT3NPY2UzM0ZPemJzRk9qY1NINGF5?=
 =?utf-8?B?YUptcUVsY2E2YVNud1dFRUpnUUZISVgvSVNkWkpIVGgrdWxxeHVlOGdvMGxS?=
 =?utf-8?B?MEN6WnNTNEpQSnAwUHdDa0dOMWtkazBTa1l0UTREUFNjcFRkRUx5VmtSb2R0?=
 =?utf-8?B?QTJXVURqb2xoN2dWWHBrbVpZenYrVkcxYk9PVENpNGo0TmtnT2lWSjJFd0xQ?=
 =?utf-8?B?VzNTTTNqM25BRFRIWDFGMWxLTGhFa1phY2MrNERqS3VtM1hGUmRpNVVGZzl1?=
 =?utf-8?B?em5EYTdaMnlHU09pOVVrcDJwN0FJRVFyWTJHdEhVdEJMWW8xcExROEpyYTJH?=
 =?utf-8?B?VlNCTFZUVnlVSXRBSHc0SzJ3Z0wrYmZhUUVidEJWQVZCcXBnR2JFcHlDTnk0?=
 =?utf-8?B?dVZGT1NSQWZ5cEtBc2hpS25mdHNzQ2ViQmZpcnpnRlNSK282YXNzTThqWmEw?=
 =?utf-8?B?L3k1YmdCTllpQ09ZVlFQMlR1blpTcUsrbEoxS2FyYkNSeldBakRzNXNoMkVF?=
 =?utf-8?B?Y052bGxUT3NlbkNOTlQ4M1NEOW1jeHpLVVg4a3VkRHlOSEFyUHc2ME9CRTM3?=
 =?utf-8?B?a3RBUWtSTDFDL3NKRWhNUjdJNXlKd1N3VzBSczlsUXVhQ0M3SFMraGNhcEFP?=
 =?utf-8?B?TFlVcHJ1TFozdS9ES0U3a2FPeEloNG56OVF4ZCtaK2ZlUkVEbTR6UERwdWNB?=
 =?utf-8?B?MlVGVWRaTWFraTdJSWxIWlVVcmFzSmVlb21UWFN4STVUMUlGd21LSU1pRzRI?=
 =?utf-8?B?VkZ2ZHBkNEYwaGNyZzI0QjhLa3BMYUdCS2g1QUpkTkx4MHZzRDFmckdkK0xI?=
 =?utf-8?B?clJZeHFvVm5oaThMbVlBNVBpZEFsTHIvY2pQdVUxOXlJKzNYb0lKNnpSbHB6?=
 =?utf-8?B?VjYybTcvcUhpZEhhNHZSOVJpVTdjS29YVGlXY2cvbUJ0c0o1em9FREc0SVJl?=
 =?utf-8?B?Si9FNkRtcEhab3RQU1hMWXdiRVZFZkkxRmhobXIwMlRFbHJEbmpkK0hOWXFE?=
 =?utf-8?B?cmJjRURhTUhPMU03cTZkcHpkYWtTSU52NWpEcnY3YlJuTFFKWC9NUHBNVEZx?=
 =?utf-8?B?MWU1VXMzSjJLVndka3FpM3VnZk4yWVJrd2hMcXNOKzVWSW9zd0hBS09iZHVU?=
 =?utf-8?B?WUpHU21Eek9oR2ZBZDlTaFZxbUNJUEVrMzk0QzRIS0szZlNOTHFkck1WbE00?=
 =?utf-8?B?Q0FpY3dVemcrZE1KR2RoUnh2RWlneTV2ejkyc25qdWNwb2hWdTY5RWxwU3Y4?=
 =?utf-8?B?MnIwRjVGTUY4RzZ3Qk9LeUY4Q2JWa3pGMjVSUXpqbSsvUEJkT0p5Mmh0U1BY?=
 =?utf-8?B?S25CbjlVTW5laTZmTFFKTGRkQnQwbjdCMExvWS9WVTRvdVI2YmhpcHpHbGJ0?=
 =?utf-8?B?dGJ1UGpJYk94NU1ldEQ2YWlLVWNNNTJRbDR3RmZCZ0hoVE1HTjhJMzF5eXNo?=
 =?utf-8?B?R0t5NmpaajlXaWJ3TnlESHVDMXJETGV6bXF6azFXT3FpTDdYRkpJd05hRExO?=
 =?utf-8?Q?Mo7Hif5QBmA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9836
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	007be14d-0a22-4212-898d-08dda1fe0721
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|14060799003|7416014|35042699022|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTZDZUo4RFlLaWxtaDRRR1JER3dkQU5QdnhxaTdMTzlTMTRBMXVUQWRMQnRp?=
 =?utf-8?B?QVhNWDFaQ3crVDZ2WE9PaDkxU3Z4Wi9qVDB0WTd1R04zcW8wU1FNWUM2K2Zh?=
 =?utf-8?B?ZlJHQXZ5SEpVVjc0L0NQSlkrU2xUaWJQU2g2UlowM28yNENWNXRpQ0ZRazJZ?=
 =?utf-8?B?MFowQnprd2VhZVdEVGFMM1lHTzdIYXRIZllYYWFZR25VVTc2N2VCd1ZJVCto?=
 =?utf-8?B?MDBucVZBQm02S2V4NkFTZjhXN3pFNCswRnU0VklNcm5UU2w2MEt6TXZhRW5w?=
 =?utf-8?B?ZFJqUUkzTjlNZ3FVSEZibm5XOEhuWGF1ZjFFYzY5UlVBekpaUng4Y0pEWmd5?=
 =?utf-8?B?WithamsxbGxTK3djNEYyNUZGUjFiS3drcDlxcmI5dlEvNkltR2dXWVBRQXhG?=
 =?utf-8?B?M0xNcWsreWFKU0JQOWN4c2JIbFF1UTl4VzM1KzQzVUFSaVNoODcwOHl5Z2Y1?=
 =?utf-8?B?YTI1SXhyUkZ6c1R0WjNpbG9KcmQyZngrUGtMOXpNY0ROOFl5clRiSXZNMDhs?=
 =?utf-8?B?RW5iNVQzVFZmMnFmTjdTaEJqZndUQUplMFFQczFxeU02N3J2MEU1SlJPWkxy?=
 =?utf-8?B?aDlXYmVPM1FKSXArb2pHK3ZtZVdCU1d6di9KQ3hPakN4bG1rbTdNWXBEY0pE?=
 =?utf-8?B?SFJBd0l6a1I0Z3QxdnFpbStnc1ZHemY1d3k5aGUzRXRwWm9GT2pPTGpaZkhp?=
 =?utf-8?B?Ujd6NmM1UnFXOG4weldxQnBVdXI1TEQ1YW0zMW5MYU9UcVI0VlVQTWlRUjNH?=
 =?utf-8?B?OHoxbXhhVm9hQkJ1OFpXaTB2U1NTbDFhaVRDd081cmNJR254S1ZYYjdSUURa?=
 =?utf-8?B?a2srbFU0ck1pM3RqblpXWnNPdlNZMFZRbmp0UkVVeEhpUlIvWUNyemRNdi9U?=
 =?utf-8?B?WEVRTXdHeU9HVklmT25SeVJuajJLOG9zbEQ4THE4bGwvRXVuQk55eXpHZm9F?=
 =?utf-8?B?RlVlQ3dUUnR2SUFmQzNIWGRSQ3diblAwbFJ1dENNKzBjL1R4aVBpZFBNVDhB?=
 =?utf-8?B?VGNOYVI3SE0wcDRTcnNaN0ZIazhmUVNVYkZGSyt5bVJXdmNVRTNsbFIrdmpG?=
 =?utf-8?B?L2x0bTNxREE5alJCNHlCM3lBWVlJNC8xNjJnYmx4WUZOWlc5NFlyUXB5bzBU?=
 =?utf-8?B?MjZiL24xRXRxQ1YwNHJrQS85VSthMU1hL25BTTZPeFJVK2JCcTJab3AwQm5P?=
 =?utf-8?B?Q0RVY3JHVXQxcUNhbGJQbzlaamFZOFhtWDBuaWtXeHZRdDIySWJlT0FMamNu?=
 =?utf-8?B?T0I5Rlh6bFdYN3dlamFNb25lamRlTnM4NHVHWnMzMFZHU2U5Yjc3a2g3ZTd5?=
 =?utf-8?B?K2JBU0UzWWRJbHoyUUNUOWJubkRZQlh6S1pUeVg4dUl0R2orL1MrLzBDeGU4?=
 =?utf-8?B?dUNuOUI5bmtDbDE2VmlJdzNSM2I0MkZaL3Bsdk5sOWhDN2Rncmljd2dGci9v?=
 =?utf-8?B?cmtkamVPRnAvUGxxRVlUZld6bUlkMWUzS1VjNnd2aHkvdktoZUQwcEQ3VFVu?=
 =?utf-8?B?NkFuZHRialczcVMyOTU4dzlzd2FhM05jM0cvdk9QRHhSRm1kaDRKbW5wM0p3?=
 =?utf-8?B?VFV5Wnh2M09KQTd6alRMZTI0UGVneDErUjJjWm55aU5LRkZZQ1ZsbGc5aVVX?=
 =?utf-8?B?a0hHR3hkcmdKdVpkKzNxZE5PVEVKUWNqTXpmV3pnZ2dkbUt1UDZKTElKdnFm?=
 =?utf-8?B?SGoxTjBXRVMvWklGTjQ5bkZoRWl4QVovckFGZlRrYVIzUUJtVDdJc3p0K1JF?=
 =?utf-8?B?L1AzemVmZ0hPeE5STmZoZ1NSakg4WTIvNStqUVRoNWFTU3F1UDd6OHVqRjZW?=
 =?utf-8?B?R2ljNFM3NVltSk5HZkJocGxKYTU4OWNsRmVzYzkvM0hKQmhaQ1pxcDIzSjZo?=
 =?utf-8?B?U1QyckZZYVFrcDRoUFJzUlArK0M2V2hBRXQ3NFlyQk1ISmpSY1MydkFscUZu?=
 =?utf-8?B?bFltNHJ3VFR0dEVuRy9IcjhPU0pJeUQ0ZUxyN0JkclE4cWhSckM0b0t2V2g2?=
 =?utf-8?B?eGF1blBGNDdzemphdVhReVFJWkJpRHoySFZPZmZ4K0tydG4vSFRHdTJMaVJY?=
 =?utf-8?Q?VODu53?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(14060799003)(7416014)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 17:51:32.5450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f06dbea-b8c2-4812-9452-08dda1fe1c63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9555

Hi Mark,

> > Hi Will,
> >
> > > [+Ada]
> > >
> > > On Fri, May 30, 2025 at 10:27:23AM +0100, Yeoreum Yun wrote:
> > > > When a kernel thread hits BUG() outside of an interrupt handler and
> > > > panic_on_oops is not set, it exits via make_task_dead(), which is called by die().
> > > > In this case, the nmi_nesting value in context_tracking becomes
> > > > inconsistent because the proper context tracking exit functions are not reached.
> > > >
> > > > Here’s an example scenario on arm64:
> > > >   1. A kernel thread hits the BUG() macro outside an interrupt handler,
> > > >      and panic_on_oops is not set (ct->nmi_nesting == CT_NESTING_IRQ_NONIDLE).
> > > >
> > > >   2. The exception handler jumps to el1_dbg() and calls arm64_enter_el1_dbg(),
> > > >      which invokes ct_nmi_enter(). (ct->nmi_nesting == CT_NESTING_IRQ_NONIDLE + 2)
> > > >
> > > >   3. bug_handler() runs, and if the bug type is BUG_TRAP_TYPE_BUG, it calls die().
> > > >
> > > >   4. die() then calls make_task_dead(), which terminates the kernel thread and
> > > >      schedules another task—assume this is the idle_task.
> > >
> > > This sounds like there is a genuine imbalance, then, as we're scheduling
> > > in the context of an exception taken from EL1.
> >
> > TBH, this "scheduling" is called in do_exit() to kill BUG()
> > happend task:
> >
> >  el1_dbg()
> >     -> arm64_enter_el1_dbg()
> >       -> do_debug_exception()
> >         -> die()
> >          -> make_task_dead
> >            -> do_exit()
> >              -> schedule()
> >     // unreachable
> >     -> arm64_exit_el1_dbg()
> >
> > Because arm64_enter_el1_dbg() always call ct_nmi_enter(),
> > If do_debug_exception determined to call die(), there is no point to
> > call ct_nmi_exit().
>
> One of the reasons we treak BRK as an NMI is that exception entry for
> BRK will leave all DAIF bits set, whereas schedule() should be called
> with debug and SError unmasked (but IRQ+FIQ masked). Generally, calling
> ct_nmi_enter() prevents preemption (and hence calls to schedule()).

I think ct_nmi_enter() doesn't prevents preemption but
debug_exception_enter() disables preemption.


> Another is that we may have a BUG() or WARN() in entry code where the
> task could be in an inconsistent state, and we need to treat the
> exception like an NMI to avoid consuming that inconsistent state.

So, let's think the "inconsistent" state like:
  -> el0_enter()
	  -> enter_from_user_mode()
		  -> before update ct_state (context_tracking.state), call BUG()/WARN()
			  -> el1_dbg()

It need to call ct_nmi_enter() in el1_dbg() right?

> To handle that properly, we need to:
>
> (a) Figure out what to do with entry code. Last I looked I was under the
>     impression that x86 either didn't have a problem here, or simply
>     ignored it.

TBH, in above case, x86 seems context_traking.state will be broken...
>
> (b) Handle BUG/WARN traps separately from other BRKs, such that we can
>     use local_daif_inherit(), and treat this as a special function call
>     rather than an NMI.
>
> (c) Somehow teach make_task_dead() to handle the case where DAIF.D
>     and/or DAIF.A are set. Most likely we simply have to panic() here,
>     as with BUG() in interrupt context.

Right... It should handle for DAIF.D and DAIF.A bits...

>
> > > >   5. The idle_task attempts to enter the idle state by calling ct_idle_enter().
> > > >      However, since the current ct->nmi_nesting value is CT_NESTING_IRQ_NONIDLE + 2,
> > > >      ct_kernel_exit() triggers a WARN_ON_ONCE() warning.
> > > >
> > > > Because the kernel thread couldn’t call the appropriate context tracking exit
> > > > function in step 3, the ct->nmi_nesting value remains incorrect.
> > > > This leads to warnings like the following:
> > > >
> > > > [    7.133093] ------------[ cut here ]------------
> > > > [    7.133129] WARNING: CPU: 2 PID: 0 at kernel/context_tracking.c:127 ct_kernel
> > > > [    7.134157] Modules linked in:
> > > > [    7.134158]     not ok 62 kasan_strings
> > > > [    7.134280]
> > > > [    7.134506] CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Tainted: G    B D W        N
> > > > [    7.134930] Tainted: [B]=BAD_PAGE, [D]=DIE, [W]=WARN, [N]=TEST
> > > > [    7.135150] pstate: 204003c5 (nzCv DAIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > > > [    7.135441] pc : ct_kernel_exit+0xa4/0xb0
> > > > [    7.135656] lr : ct_kernel_exit+0x1c/0xb0
> > > > [    7.135866] sp : ffff8000829bbd90
> > > > [    7.136011] x29: ffff8000829bbd90 x28: ffff80008224ecf0 x27: 0000000000000004
> > > > [    7.136379] x26: ffff80008228ed30 x25: ffff80008228e000 x24: 0000000000000000
> > > > [    7.137016] x23: f3ff000800a52280 x22: 0000000000000000 x21: ffff00087b6c7408
> > > > [    7.137380] x20: ffff80008224b408 x19: 0000000000000005 x18: 0000000000000000
> > > > [    7.137741] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> > > > [    7.311316] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> > > > [    7.311673] x11: 0000000000000000 x10: 0000000000000000 x9 : 4000000000000000
> > > > [    7.312031] x8 : 4000000000000002 x7 : 0000000000000000 x6 : 0000000000000000
> > > > [    7.312387] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> > > > [    7.312740] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff8007f947c000
> > > > [    7.313096] Call trace:
> > > > [    7.313210]  ct_kernel_exit+0xa4/0xb0 (P)
> > > > [    7.313445]  ct_idle_enter+0x14/0x28
> > > > [    7.313666]  default_idle_call+0x2c/0x60
> > > > [    7.313902]  do_idle+0xec/0x320
> > > > [    7.314104]  cpu_startup_entry+0x40/0x50
> > > > [    7.314331]  secondary_start_kernel+0x120/0x1a0
> > > >
> > > > This behavior is specific to the arm64 architecture, where ct_nmi_enter()
> > > > is called when handling a debug exception.
> > > > In contrast, on other architectures, ct_nmi_enter() is not called when
> > > > handling BUG().
> > > > (i.e) when handling X86_TRAP_UD via handle_invalid_op(), it doesn't call
> > > > ct_nmi_enter(). so it doesn’t cause any issues
> > > > (While irq_entry_enter() does call ct_nmi_enter() for idle tasks,
> > > > that doesn’t apply to debug exception handling).
> > >
> > > It sounds like you're suggesting that we don't update the
> > > context-tracking NMI state for BRK exceptions from EL1, to align
> > > with x86.
> >
> > If el1_dbg() doesn't be called in idle_task(),
> > I think it doesn't need to call ct_nmi_enter() in arm64_enter_el1_debug()
> > since its nmi_nesting is always >= CT_NESTING_IRQ_NONIDLE and RCU wathcing this cpu.
> >
> > But, it seems el1_dbg() could be called ct_idle_enter() and ct_idle_exit().
> > actually this situation seems be possible in theory when
> > some idle code have BUG() -- i.e) cpuidle driver's enter callback have BUG().
> > However, this case triggers another quetions. what happen if idle_task was
> > killed (I think it seems panic() case...)
> >
> > So, If arm64_enter_el1_debug() doesn't need to call the ct_nmi_enter()
> > instead, __nmi_enter() should be called only for idle_task().
> >
> > Am I wrong?
>
> As above, I do not think that this is sufficient.
>
> > > I think Ada's pending series might make that easier, but then
> > > the patch you propose:
> > >
> > > > diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> > > > index 529cff825531..9cf03b9ce691 100644
> > > > --- a/arch/arm64/kernel/traps.c
> > > > +++ b/arch/arm64/kernel/traps.c
> > > > @@ -227,8 +227,14 @@ void die(const char *str, struct pt_regs *regs, long err)
> > > >
> > > >  	raw_spin_unlock_irqrestore(&die_lock, flags);
> > > >
> > > > -	if (ret != NOTIFY_STOP)
> > > > +	if (ret != NOTIFY_STOP) {
> > > > +#ifdef CONFIG_CONTEXT_TRACKING_IDLE
> > > > +		long nmi_nesting = ct_nmi_nesting();
> > > > +		if (nmi_nesting && nmi_nesting != CT_NESTING_IRQ_NONIDLE)
> > > > +			ct_nmi_exit();
> > > > +#endif
> > >
> > > tries to undo the context-tracking when we realise we're going to kill
> > > the task, which feels like a hack.
> >
> > Although her patches is applied,
> > I think this problem still exist if arm64_enter_el1_dbg() calls ct_nmi_enter().
>
> The idea is that Ada's series will make it *possible* to handle this
> correctly.
>
> > I agree it's a hacky way for handling kernel task die() in debug
> > exception since in case of user task will be killed via signal.
> > However, unless arm64_enter_el1_dbg() calls ct_nmi_enter(),
> > In my narrow view, it seems the best...
>
> As-is, I think an extra warning in the case of a BUG() is fine given
> the larger functional issues.
>
> I do not think this patch is correct as-is.

So, what I think:
  1. arm64_enter_el1_dbg() should ct_nmi_enter() as it is.
  2. in bug_handler() while handling BUG_TYPE, add above ct_nmi_exit()
     conditional call.
  3. DAIF.D and DAIF.A handling.

Is there any missing?

Thanks!

--
Sincerely,
Yeoreum Yun

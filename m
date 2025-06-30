Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AA31AE877
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.36
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751261202; cv=fail; b=mr6dHC7A1VFzl3v26OYWNy4Av9z71nX0b1pqB0avOh+TC8vmeJldU+yIdggY8QgG9FezeK9AWyoLQtsuTATRl17DwJcwYilo1BJ74BNsTN4SMvu1Bz/wOX21UZz/XLKOBeqhbA3jt5q+/c+TyXPN4fF5XyxKJVa1etatYpjxuGE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751261202; c=relaxed/simple;
	bh=DE0g6A0ZY523kQDoiDwaHyJnMFV6qnyYFsQtxk4ft5k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jhV0w8vBbjXJV/XhEwUMsRRvDVM0ys3f7p2iURo5RLLfDUgwGY2Q18JA/14xSBr8yiKyR4rqgJXnzAuctB/OvInK8k7nt0j8qKyXJQfkpx5svrM5mAoFF2kh6PSabkVejRdlnjHtSKB/VlciZ2XU1q+SQYy3ewHTdBU+0XgrC/Q=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iIqXfRq7; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iIqXfRq7; arc=fail smtp.client-ip=52.101.65.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iIqXfRq7";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iIqXfRq7"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RsF+hJaKgy1WD3FMoAuxqYm73vSFSNg7/ilwe6QQ61RR8W9QiPdoXGMX/1mmLIhQ8xZ6alO2N3lP6+gDktM7If9OUK24mS1j7wUrBjz3gINfZy0rh2J1kOdMUJ/VQqS0QjYT4n+FTHNxwPtCve3UAeazeGAFVEN18OOtGUDiP40tWeF93DcbgFEYlSv509hKEIwdz6xoRQcZ7AKHhHj3nWrZJAEeLQwciUwA3xjOGQyQ6G3gWWwOHJfU81zy3CRMcsYKJjJfyfakcCp5bMiJgG0MO4860SqpRLq1r0GhvYgHf+AxiOrgsWtXpA+oGLlNmYs31Ro9837x+clKkUNCFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QX4SIFX+kDiFQFvFfCV00p4nU3b4gLw+LIRZ66edNDk=;
 b=KJcLS1hJ+TpVPEhwFGmfVhw5yuvCqVEDs4Mi189uitS5gNTYNh1zLVjE08aC5pZmxzbQzPRP54D/2iuQb/RTzTuNljdp0fWKp5fHusG2oaoCtXuWuHvmVVX4Bajh0m/byRpuKwBX7YcRe1B2caLIMoRPI26NWa4R/V+6JoTWvfu6hmMjP93rKck7jSbK491aFwP/WnKicf8qWrKLMa73si78dQ5us7IPPq0q7RMCu39yXQUA+nIam9K3IoJOLKqVq9X92A4FBr+9YYRkUf6gP4W556K3uC10RwjNb7SYEIW9FFBFnvt8c9ZPCuWUep01SnDI3KDo3HwPP9tlfQRB6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kenip.in smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QX4SIFX+kDiFQFvFfCV00p4nU3b4gLw+LIRZ66edNDk=;
 b=iIqXfRq7ci4+UN8zeiN3+iv8QjimZwxsTSm2mdhp9r565FSL09cQVVianaGvUoop9zjP3PU1pz8aj6jZ3Rdke3ogkUkz0gO1FM/GCQdjXxLr493nWMgciV4Q3f2y1wjV6kaQjpkEwDS5om5393Fxs89GhHa/qgs8skQqDkqA0tk=
Received: from DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) by AS8PR08MB6199.eurprd08.prod.outlook.com
 (2603:10a6:20b:296::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 05:26:31 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::b3) by DUZPR01CA0035.outlook.office365.com
 (2603:10a6:10:468::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.31 via Frontend Transport; Mon,
 30 Jun 2025 05:26:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 30 Jun 2025 05:26:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drIYs25Ydk0acCQj+3vU/7F35ehgXxd2l4dQ0tC8ViU1DLSqEIiYnKeVAa/l2ZNgWfMOrMZJhdMse1vt4F/763an0sNqAqauQWpJJq0bR0zdrX5UabUd/iiKOfYSPObJBmJxytS9GG/2JNwsu+3rsKattPlPq7euRvmCIJWhnxG8noHUrx5pgvbUtv0S1+blZ9kJOy7Vq1/sBPaPVnUrGTl7PiOK6qiABnel1FKDfTxnQCIJ+reF/JA+q+fNN6vxNIyH/xtyAGxsU9FvfD70yTdHaEkTusY+RMGNO8Ca2TPc9OJwWLM0KrvJmxp4vSMEgTKRtqj05/wcNxkSCOAenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QX4SIFX+kDiFQFvFfCV00p4nU3b4gLw+LIRZ66edNDk=;
 b=Z0Nc37/D5ddDbZyANRfZTXKhb/UNoVLCGoylAENmHOgrekz95NsCaBZO5DQx7dTSfeyC27L2eQzJRbnchc+XPM8NZVn7qJw2uVtrDpisv5ON7nyCxnb+Z/jinyNTrnPE23zT4TxupLYp7vkdTNGKrU/M7IFg07HyyGLruqWlEp8dyoqPtFv1PrMe7CjaAfaPWYFd4fEYEpuPl4paHZa6BSRnVFu646IeW6pUEmHcL5LuA/c56R5B/JrsKTenu689wBvz8Sacp7ptu9hMc9PIUGPVuhUGGH+q5YWeEqlkZLN83NG2ZlF1iA5Nyz6uzRWav//0HmZxszCNp/qSHG7rHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QX4SIFX+kDiFQFvFfCV00p4nU3b4gLw+LIRZ66edNDk=;
 b=iIqXfRq7ci4+UN8zeiN3+iv8QjimZwxsTSm2mdhp9r565FSL09cQVVianaGvUoop9zjP3PU1pz8aj6jZ3Rdke3ogkUkz0gO1FM/GCQdjXxLr493nWMgciV4Q3f2y1wjV6kaQjpkEwDS5om5393Fxs89GhHa/qgs8skQqDkqA0tk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AM8PR08MB6385.eurprd08.prod.outlook.com (2603:10a6:20b:36a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 05:25:57 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 05:25:57 +0000
Message-ID: <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
Date: Mon, 30 Jun 2025 10:55:52 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_mm=3A_limit_THP_alignment_=E2=80=93_per?=
 =?UTF-8?Q?formance_gain_observed_in_AI_inference_workloads?=
To: siddhartha@kenip.in
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, mgorman@suse.de
References: <28338f055b3c9afa8b69ff6f05ea20ed@kenip.in>
 <4990838b-660d-46a2-b21c-67adcba61ff9@lucifer.local>
 <19714cae-6b73-43ec-af7a-1455196561d1@arm.com>
 <3ee2e7fea6f263aa884e3e715632b09f@kenip.in>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <3ee2e7fea6f263aa884e3e715632b09f@kenip.in>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::10) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AM8PR08MB6385:EE_|DB1PEPF000509FB:EE_|AS8PR08MB6199:EE_
X-MS-Office365-Filtering-Correlation-Id: fa1c8e75-f8f9-4ba2-4bc8-08ddb796ab5b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZXA0MXJFK2dsTVByREhLT0xQTlN3MFpBaWFaNEN2TE43aUFWSnB5UkpUZ01F?=
 =?utf-8?B?NWhzdHJvREZ4UGRBZHEzelR3aUk4dUd0Zk04bENydTJMK0VrOG5ObUY0aHhO?=
 =?utf-8?B?VDBlYnMvK0R6czZxVmtBNCtBQkJhREw0UXZ2WllQSVRnNis4MWU2NG51YlBF?=
 =?utf-8?B?MDQzS1RzbFJMd0x1S3VIdjdaZUhna1pBS1kxREtpTzJ4UXBGdEZHTjVzOVN4?=
 =?utf-8?B?TjI2dEVqR0xZRE9QWFB2N1cwSGVVeU5kS1Y3NXljNGs4ZHY2L0RidURPY2l6?=
 =?utf-8?B?N3NkWGNmZUdmM0M3OGhrdi9ES21kSWtadUwvZmFPTUhZWmxJWjIvREMxM0M3?=
 =?utf-8?B?cUwzMHM1N05oejU4ZmxaM0U4VmYwRVg1ekU4LzA5VzcxNjZNUFRBZkc2MWRE?=
 =?utf-8?B?M203VXpVOGZsVTNHNnY2a1VvNHNINmEyN1FUOWp1VEZUSWxsdmVlVFFia3B0?=
 =?utf-8?B?dnYxUkhYRXpGcXBORzNqWVA3eFlja3hZNWhxWHJpR3luWDNHOW5yeTExcmww?=
 =?utf-8?B?NXNHb3k2ZHN6UDhaeEJXREVxdHJFbitOcWNkek1yVEpJM210cUlGUXhjbVl2?=
 =?utf-8?B?eEh0anB3clJlaVlDSHlsQlhjdGJ2RzFQRUNNRUgwZ1VkUzJKaU5ETkVuYXZn?=
 =?utf-8?B?ZUhSRGZxREpWdW9sVlZkQSt4V1ZxRFE1ZUREQ3JremVWOTV6OWlMK1hhWEFv?=
 =?utf-8?B?NXdTeDdnZldBeGdydUtBdUVUbXczNlNvamJzbGN3ekFQQkczS3dza1lTNFFS?=
 =?utf-8?B?ZUNpUC95dTFWVnE0MEFFaHdtTTc3RjVIcCs3R2Y0OTErWWxCR1FmSHA4Wm1i?=
 =?utf-8?B?RXhUZnpqTDAwWnJKTWYrcFRDM0R5VTVUSm44NEtjUEhVay8zMFVOUlJqS2Ux?=
 =?utf-8?B?UGJZQTBReGhCSDdROTUrN0YrdjVWT0kvMDdMTGRzdGZyRGM5Vytsb2JpdDRz?=
 =?utf-8?B?SXJQR0dlWVdzVURWeHNRK2lHZlFxOTV5TVhMKytvelZRaUJPWVRPR3pYcUlk?=
 =?utf-8?B?ZkVyUkc0MFV3YWtEZlQ5RmFqNERYcFN3cFcyQUl0dE9McVRsQ250UmdjWk5s?=
 =?utf-8?B?ejJrT05INEV3bGpYSEp5bTBkbDNma0s3RSt3Z2tUU0ZzYkNpbWZ2Sng1cHF1?=
 =?utf-8?B?VXZ1RXVoMG9IVkF3NmJPcThCVzJ6Y3pUeXBjS3ZVZnNLUzE3c3BGUGFPNlNx?=
 =?utf-8?B?U3dTTWNsM01MdDVOUXBEQk1zdW5qRDRBZVlCM2t5eUhtQ3paRWI0alo5c0Jn?=
 =?utf-8?B?Rlp1OGxzNCttYXZzMXRMK1pkQmNiSElzaGc1NDlqa3QvUjZlTVBkK0c1NmF6?=
 =?utf-8?B?aUFMNlhPYS92OFQwdTF6RSszbmlOMHN4K0orM3NCMFJic2tDa1A2MmVLZlZQ?=
 =?utf-8?B?WHhEdkdMbjdCaFFCUlhmakNsWjJNb0NrU0JGdHZVMzFaYzVzR29hbkhsVEJ4?=
 =?utf-8?B?dC93bWppMkF1YXo5RWRBNnBOZW1rOUpWNVdNU3JnNjJHN0lRU0Y3YmhSZnFv?=
 =?utf-8?B?TEFWdFU0eU1VU2Jrb3JGTUc4Q3JOb3VQamdGYjYyOWozUFlVdkZvaW9uaGVx?=
 =?utf-8?B?Q3h4dW4waXN1WDErcmd1NzdmSkRmdWN4ZEM1N3hwVTQyandoN1cwS29ic0J3?=
 =?utf-8?B?VG90L3ROemZxeHBOV0hkbHBqVk1TeFlDWUo0V0RpdjJRdmU0clhpbGtwWlV2?=
 =?utf-8?B?RzZKV3RpTXAxS2pKQ0FyM0wyK2k0TllIbjlsSjRUd25oaUdWWWJqc3U5bW1T?=
 =?utf-8?B?YjFZZzVsZWhwbjFtZzlhSUVQaUIvMStkU3VOUXZDQTQyb2V5RHNhdkRjT2p2?=
 =?utf-8?B?d1lZTXBHRUdBTFZ6V3ZjSlpXTkZDS00vR2hDOUtnY3hnQ2pSdEMraEdjVTBH?=
 =?utf-8?B?M1NSaU5mbGxKNmkwL3NoK05qTzZoTUVJWmpMY2RuOVp1TjNhZWUxTitNWUtH?=
 =?utf-8?Q?ZkoznkcaSPw=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6385
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d633d347-ea77-4d9a-8dce-08ddb79697a2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|36860700013|376014|35042699022|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3RBNktvTWphOVdndEM3blMzZWxSVExBdnNKQXJFaWcwVHZvVFMxeXRJUGty?=
 =?utf-8?B?Rm5tVHUrL0NXUUcwVVVCUFJqY2ZuQnlSRThmQm05UFRkRUlDdTgxNTBYL0g1?=
 =?utf-8?B?aWFhbUZDWUJsR3pFbUgrcmR3Mkg3SnFjNGRVZXFCUXZZbnpSYWZML0luYWs5?=
 =?utf-8?B?ejNsUnpaMFUvT0tnVVRlQkF0U3ZDTzZKM0tOemhlYTMrc1dtUmk3Sk5sTnVv?=
 =?utf-8?B?dHh2QlpVZmNQc1VWdjVBUW9leVRvWTU0cUhWYjJmTHBUbEhyb2o1VnFSOVQ0?=
 =?utf-8?B?aGJlRUhUejRTeE1iTjdFWXdFMmYzd0pDN2g0bHpnUWdmSEhhMDBEdGdDR1hu?=
 =?utf-8?B?elF2Y3BKNjAyS3NiU082Mno3a1VFVHl1dzJBTmlqaXRqODRjTjNpeTlhVXpt?=
 =?utf-8?B?U0Rydk1URnE3VXZCdE9KUFZ3QVNhOTd4cEJQM3NLZnkwcVlZYXAwSks0SlBm?=
 =?utf-8?B?ZUJZOUxYZVpNSm56aWVUMEl5U1ZCQUtCVDVPVERBSFNIVFdqa25DQ2ZqYXAx?=
 =?utf-8?B?dlpna2h5MGh6RGJhZmxweSswOFJvT2dxZmJFaGhteGxjQlZrTU53MEtzV1li?=
 =?utf-8?B?K2M3b24zNHNSMmtQNzlvVytTZ0d4aEg3YThDb242SFliOXhuRGV3QXNkNXVj?=
 =?utf-8?B?MW1uR3JNTTZoVWVFUkMyZjJLbkNIbnlwYUZERkN1LytlMW5oQjB0bUxsd3Zr?=
 =?utf-8?B?eDVoaEFuK1RCOVROQ2ZZY1VoQlhQV2tmeHhXOFFhR2RIN3ZINXJNMDgxY3or?=
 =?utf-8?B?cWNYblBnWHFFQ2RpeUJyVThheVByRFA0c252RVZrb05leUxIZUlyRkZoQ0xK?=
 =?utf-8?B?VFg1ZjlncnJKaHZiZ1hFbDBRMGFTd0JpZ056dSs5YXpEdTdmR0k0SFRnVXlQ?=
 =?utf-8?B?aFN2RUtjNkZrbEtoWmNrYzRZc3hjbnNwVVFHWC84N3RHYXMvY0tJbk9LZzRI?=
 =?utf-8?B?TkhOTUhkd1V3WGVTeUNXTUk5SjY1c3kza29ybUJ6dmFTSCtkSUJvV2RzK01W?=
 =?utf-8?B?bzR2UCtkY2YzWU50Z2toWEtwWjhjTG5ia3F0RCt5bUdrUE1IVi9HMEErSUNu?=
 =?utf-8?B?TGY3bllXcy9id1pzcDNoUkZUMDZoSGZmN1pIRmtVT2ozcXF1MTJKaTErNkhT?=
 =?utf-8?B?OGtndDZRWXM5dzh6enpzM1ZMRStBaVRkc0YzLzJ5WWx3THNSMFNWbFF1TFdK?=
 =?utf-8?B?S0ZVL0RLVU14YS9rbGxXaWRlTTFlUVZmdFA5SUVRVzQrUnRCSzJwSDNvZVRp?=
 =?utf-8?B?U2w4Z1M4N0pPaVF6NU9jVmNKUmhqZXRkRHgrVjAzLy9sT3BRRzhURXFUVjcx?=
 =?utf-8?B?S0JBU0owSzkzaFBuU0IrRUErL0FlNnpCeTExYnh3bWMxR3dibkkxRHRrT24y?=
 =?utf-8?B?ZC8xZDgxYTdIU3A3b3pLcmhaRkhjSTJBVk03eHk0ZTdjZmRhbzQwamszaTI2?=
 =?utf-8?B?eCt4WEU4RWwvSE1RVVVJSXk4ZGpQOVlzZGVVdXJ2S0RoMGVudlVSWUx3TUV6?=
 =?utf-8?B?ZDN1QitlVDd0RXo3RVhXL202ZEY5eXpIampnRllXamdVZVVFWEVvU0RCSDN1?=
 =?utf-8?B?TldqSWttRXZDOStuK2hhc1AyUDhXdGVpdGN1NURSNldGQ1FrSDcwRThkTnhZ?=
 =?utf-8?B?N3NuTGF1TUNmTUN3MDR1bkxNVDMvMkVtU0NZVDR5VzVvWjJ1czZCUEdHSzY0?=
 =?utf-8?B?d0FxbFhMdWpsc2NKZEZZb0k3cXV6M3BTZGs4NlJDb1ZZOUNUMTFVa3R5a3NX?=
 =?utf-8?B?SjJHaWJoVkUrUS9JR2k4MHNHN2p0b3N1VW9xSTBmTTBPYkRGMEM4czAvLzI4?=
 =?utf-8?B?Z2JSOHBMSjFaeGpsSy9ibWMxUU9BMWJSeUloMGVubFBsTVNVMXRUd1NEN3Fl?=
 =?utf-8?B?SFM5WXFkbmRnRVVtR1FCVFBKbHcrK0U1UTFlbEE0OVBwV3FLK2NiVjVONGs1?=
 =?utf-8?B?UVNLbmJnMWR5VlIwbDlGL1lCejFNMC82QVIvTlFpQ0pEQUloOEFRTlN4Mzh5?=
 =?utf-8?B?aWFKRVl6VGI2SE85MG41TFlOQU91bjZkanVDMU9NdURlQTY5Qi9mRG10MHov?=
 =?utf-8?B?aGxlVCtkYjl3SllMU2NkVzg4V3JVMDQ3bWM2dz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(36860700013)(376014)(35042699022)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 05:26:30.2948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1c8e75-f8f9-4ba2-4bc8-08ddb796ab5b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6199


On 30/06/25 6:13 am, siddhartha@kenip.in wrote:
> On 2025-06-28 09:19, Dev Jain wrote:
>> On 27/06/25 9:00 pm, Lorenzo Stoakes wrote:
>>> +cc Vlata
>>>
>>> On Fri, Jun 27, 2025 at 04:09:16PM +0530, siddhartha@kenip.in wrote:
>>>> Hi all,
>>>>
>>>> I wanted to share validation data from a Hugging Face-based AI 
>>>> inferencing
>>>> workload,
>>>> which was significantly impacted by the THP alignment logic 
>>>> introduced in
>>>> commit efa7df3e3bb5.
>>>>
>>>> Using transformer models with dynamic input lengths on Intel Xeon 
>>>> (Cooper
>>>> Lake),
>>>> we observed up to a 3200% throughput improvement after applying the 
>>>> patch
>>>> from Oct 2024:
>>>>
>>>>    mm: limit THP alignment of anonymous mappings to PMD-aligned sizes
>>> All congratulations are owed to Vlastimil Babka for doing this, cc'd :)
>>>
>>> I gather he enjoys novelty beer mugs as tokens of thanks ;)
>>
>> I was wondering how the change can get us such a big optimization - the
>> alignment causes us to gain at most 1 extra PMD-THP mapping. Is there
>> something else I am missing?
>>
>> I ask because when I was reading the code I was thinking whether a 
>> similar
>> change can be done for mTHPs.
>>
>>>
>>>> Metrics:
>>>> - Model: BERT-base
>>>> - Inference engine: Transformers + ONNX Runtime
>>>> - Kernel: 6.6 vs patched 6.6.8
>>>> - Batch size: 8-32, input length: 64-512 tokens
>>>> - Metric: inference throughput (samples/sec)
>>>>
>>>> Thanks for the fix -- this change had real impact on a 
>>>> production-relevant
>>>> workload.
>>>>
>>>> Best Regards,
>>>> Siddhartha Sharma
>>>> ISV @ Kenip
>>>> Solution Link: 
>>>> https://www.intel.com/content/www/us/en/partner/showcase/offering/a5bHo00000045YUIAY/deadlock-clearance.html
>>>>
>
> Hi Dev Jain,
>
> Thank you for reviewing and for your thoughtful question.
>
> You're absolutely right that, in isolation, gaining one additional 
> PMD-THP mapping wouldn't explain a 3200% speedup. But in our use case 
> (Hugging Face inference workloads with dynamic input sizes and many 
> allocations), the original PMD alignment logic caused a cascade of 
> side effects:
>
> The performance improvement comes from how that interacts with dynamic 
> memory allocation patterns in AI inference workloads, especially those 
> using frameworks like Hugging Face Transformers.
>
> In our specific use case, the workloads were running on Intel 
> Developer Cloud, but I no longer have access to that particular 
> environment or the original profiling output. However, I’d like to 
> highlight why this patch had such an outsized effect:
>
> 🔹 1. Fragmentation Avoidance
> In model shard loading (e.g., large BERT or GPT2 models split into 
> multiple memory segments), many medium-sized anonymous allocations 
> occur in rapid succession. These workloads tend to allocate many 512 
> KB – 1.5 MB buffers dynamically (token buffers, intermediate tensors). 
> Aligning each one to PMD size, even when their length wasn’t 
> PMD-aligned, led to gaps between them — defeating natural coalescing 
> into a single THP.
>
> 🔹 2. TLB aliasing and cache index pressure
>
> These fragmented mappings caused frequent TLB misses and poor L1/L2 
> cache reuse.
>
> The result was what looks like “memory thrashing,” with slow memory 
> access dominating total inference time.
> When every mapping is PMD-aligned (even if not PMD-sized), the gaps 
> between them prevent Transparent Huge Pages (THPs) from activating 
> effectively.
>
> This breaks THP coalescence and causes fragmented page tables and 
> higher memory overhead per shard.
>
> 🔹 3. Latency & Throughput Penalty from Memory Misalignment
> This leads to higher TLB miss rates, especially under multi-threaded 
> load, which dramatically slows down token embedding and attention 
> calculations.
>
> When loading model shards, memory initialization becomes 
> cache-unfriendly, with poor reuse across cores.
>
> This affects not only inference latency but also model cold-start time 
> — which is critical in autoscaling deployments.
>
> 🔹 4. Qualitative Observation
> Without this patch: shard loading stuttered, warm-up was slow, and we 
> saw CPU cycles dominated by page_fault and TLB miss handlers.
>
> With this patch: shard loading smoothed out, THPs were correctly 
> applied (based on smaps), and throughput shot up by an order of 
> magnitude.
>
> 🔹 5. Measured Impact
> On Intel Xeon (Cooper Lake), a 6.6.0 kernel with PMD alignment on 
> non-aligned sizes showed 11–32× worse performance.
>
> With the patched kernel (which skips alignment unless the length is 
> PMD-aligned), memory layout was contiguous again and THP was 
> consistently utilized.
>
> This isn’t about one extra THP — it’s about preventing widespread THP 
> fragmentation and the resulting dramatic cache/TLB degradation. For AI 
> workloads with high concurrency and dynamic shapes, this small patch 
> has a massive effect on layout and locality.
>
> So, it's not just “1 more huge page” — it's avoiding massive 
> fragmentation that leads to:
>
> 1. TLB miss storms
>
> 2. Poor locality
>
> 3. Cache index thrashing
>
> 4. Improvement in latency and throughput
>
> This applies across many adjacent, odd-length allocations typical of 
> AI inference workloads.
>
> The original alignment logic created a pattern of broken contiguity — 
> defeating THP benefits altogether.
>
> In AI workloads using Hugging Face Transformers, model shards and 
> intermediate tensors are dynamically allocated during inference. These 
> allocations often fall just below or above the 2MB threshold that THP 
> relies on. Misalignment or forced alignment to PMD boundaries causes 
> fragmentation and disrupts huge page coalescence, affecting performance.
>
> 📊 Memory Allocation Pattern Diagram
>
> Without Patch (PMD Alignment Forced):
>
> |<--2MB-->|<--Gap-->|<--2MB-->|<--Gap-->|<--2MB-->
> | Alloc A |         | Alloc B |         | Alloc C |
>
> Each allocation is PMD-aligned, even if it’s not PMD-sized
>
> Gaps prevent THP coalescence → TLB/cache fragmentation
>
> With Patch (PMD Alignment Conditional):
>
> |<---------6MB Contiguous Region--------->|
> |  Alloc A  | Alloc B | Alloc C | Padding |
>
> Contiguous anonymous memory region
>
> Coalesced into one or more THPs
>
> Improved locality and TLB efficiency
>
> While I regret not having the raw perf output at hand, I’d be happy to 
> replicate a similar test locally and share reproducible results if 
> helpful.
>
> Best Regards,
>
> Siddhartha Sharma

Thanks for your detailed explanation! I misunderstood that the 
optimization you were talking about

was due to efa7df3e3bb5, instead it was due to the alignment. Your 
explanation makes a lot of

sense!


For this workload, do you enable mTHPs on your system? My plan is to 
make a similar patch for

the mTHP case and I'd be grateful if you can get me some results : )

>
>

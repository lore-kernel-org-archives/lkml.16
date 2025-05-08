Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020130.outbound.protection.outlook.com [52.101.191.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFE7EEAA
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.191.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746709918; cv=fail; b=CoY0uWqUdJohE3oRPMXVm8M++hEt/HTu494LJbjpilCTuRdkIFQgqa92IXrrZziKZSJf0Xgy5nGUV0B7vo5gfSRUzn46SHjM2JSJ0xH7TG3Q1N0s4bpm4I17zUVDPHfPgKUz0RhwkJyhF7+Srb74UG6AbIRRMe4Je6+j4MW8VgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746709918; c=relaxed/simple;
	bh=VJid0ibwDkTyTkbnsjFr8Kapn9/zActT4b3zq0hGSNk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IIqwUaXyW/dOvjxGSloydlt3XXsNFn5PMZPOn25LYR8rAIx+eNl/T/0thjFR80vp0KSw4Frte6hkKlH6k4N/LEyUzrRI7zdr3vB1NBfHTf9oXS2U6RH/TWwi5QTAFmbGXK9apG+ttLNpQ1Zb4BEh4fhGURjxxfkLKgvD49gyedw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=Y96+uByS; arc=fail smtp.client-ip=52.101.191.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="Y96+uByS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XR8cdOhDSbqXrgLKSpYXlSA6PVb6GCf/JtYEjkkRx/kQnJFS2ZQOJLiXfb/CETpwCaHWfCbaHOMjBIeK+uCN1I4b/+VWSy1Q8WQlceDwh1hGKAGh7IdxxyHnjut5I6YOzC7pbxPCDTQKGqpJY6PC0M94ABk1ZPHPBFsHStP7vQ4GDIJ0x7kjWmEscF0sBg3RmE9csZO5YQVM3AmQ1sV32JbFyOPsYefjJQYetnNwiyshNOp+BRUKAb1W524F+zc1aeuEj+W2whMJluKWUaw7d42ltI6iVsoexoFTSbPIxNRBM0GgAn5OuY+RQQSI9z6nYKmXRChw+vdVaWdWNF/2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsFHLtxMUdLX0vsQ11su2T3t09QmaMqcHtoLRkd7oNo=;
 b=zSIG9BsRNZDrMtf3pTR4Ky4ftP0+lpqegYRGqMOlaViilAkkaxqGdEcboWx4rAQCttCVoeD3ZlofBEEaVVejTSXHj1uytMUWr3sMIRHMJP301Ie6TWt+AHNW9geXUn9XQ7wkDZzaqEiUhc1atvqgTLYMarKOA2plgJjYnZqLPv2KKMhZ9wAqdJSIN4/fscaX9ncMdlEOMXxpKN2ZCVq+XehHeLhO2e31cr4oVN4TJzRuZ+6EY4U55xUiL2pg83vhE24PzeCkOS+N/ZN74PVLPcXiVDedS3FadIdmSmCrUz5QAcsWLlEMg/ujYqLmA7Ika7xyORNLP/5wbYyejXnHKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RsFHLtxMUdLX0vsQ11su2T3t09QmaMqcHtoLRkd7oNo=;
 b=Y96+uBySa2lN9/EfZT/9eLahXr3BGo11EtivAcC0t+JobtcO/Thj6jg4+iX876lIHdJXZ4Uzk4maVQMDZFjuKYQLXiBZeKQ/ryXg6gticayohSD7q+FoV5wkAYzeGvTN3ZadZxmVhlCfzmRyvToQVQYp4eEIqArX/WmsvMto/nF7yzLjW4tjJcRXWaGpL1RmqWdbe7XQSsrRZLUzFhJiQfatoF/ktCy+hoLUyhgsGEL9F1+JsWTPBXjAkrdYQY+r2I9TP2cUpxGj6e6d/NAWku8VE01mkyOimEsF2GUs+a+MYLlOWKxYgUCCYymbbslNJy36HklI0h7qo8fnBONaiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT3PR01MB9692.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:8c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 13:11:51 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%4]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 13:11:51 +0000
Message-ID: <8a4a5d6e-d2cf-420d-91f3-2797618e7255@efficios.com>
Date: Thu, 8 May 2025 09:11:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Memory hotplug locking issue: Useless (?) zone span seqlock
To: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>
Cc: Michal Hocko <mhocko@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Pavel Tatashin
 <pasha.tatashin@soleen.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>
References: <b3acfb1e-2d7a-42ef-9705-bf0b20a0d152@efficios.com>
 <a5cde237-0dcf-4e85-b763-7a38e9f9c563@redhat.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <a5cde237-0dcf-4e85-b763-7a38e9f9c563@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0143.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::29) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT3PR01MB9692:EE_
X-MS-Office365-Filtering-Correlation-Id: 336b6df6-16a5-4d36-dce3-08dd8e31e576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEt3ZEp2dFdQWXM2MGQyQjNzU0ZWblFCM3F2a0NmbmlERHU3ZFB1RnpkM2sx?=
 =?utf-8?B?WFd3aUNPRjlUY0V0dkY5cCthdG8wRFhPMmpDZVRta1pBMDQrU1l6WiticHRq?=
 =?utf-8?B?Y0xGUzVrbkZ3WXVHbGpYdVo5a3J5U1plSnZLaytOUmZ4ZnE2a2VKb0ROYVlv?=
 =?utf-8?B?M0tsZ0VnNmR4SDg1WFlEQmx5S2VWYzg5bHh4eTZKTWFEdjRHbDJqZXhJTjNE?=
 =?utf-8?B?UGVhS1hiKzFBdk5SSTRkM1IyYXR2WjNhNmRYdWVwd2FaYjFvZk1mWVNOTnZu?=
 =?utf-8?B?ODNlOVJwTFU4eVBCZzR5Yk9ZK2c2L1dqbWc4YVZBRkNWSVFCYkJhWGhqcSsr?=
 =?utf-8?B?c1FtOStGL2NCNDAzdGVmakMrN3NBUFB4VlljZ0hrOWtMMVAzRHlGaCt6UUFQ?=
 =?utf-8?B?aHgrZnJWSFkzSXQ2ME02c0xCUkE1MnhlRTV6VU5sN3Y4QmRNUkEwd0s0NUxQ?=
 =?utf-8?B?Um95S0o2S2pRNThRamdVdmxrMDdsd04wc0dhSHNUeGxyTkJKaUs1cFhrTUx0?=
 =?utf-8?B?L2JYcmg3YllWNDdRVGRYMTZyc0J6NEU2WlJ5NEZFYk5kbmE2YndPeExGUTl6?=
 =?utf-8?B?N0pFakRYaWU3eFRheTd1YXJWaG1YOVRxaVFwZ2ZKTTZaUW5KemplUm54WDlJ?=
 =?utf-8?B?cFR4UGthVDlhQTNYMmFGTzFFMW9QT3VFOEF5QkhyK2M5dGRHOUI0TWhjbko5?=
 =?utf-8?B?ZXR5UXZNajZGLzZVa2dPeGNOWDZFcFNOa0NsbGo1SmRBWUhhbkwzNXhIVUk2?=
 =?utf-8?B?YU0zYUN1SkJGTlhycnJzaC8wR1NwTmtBWmw1VURYTFFSbU4yV21STjFveVpN?=
 =?utf-8?B?TG5mb2ZOUUNXeDIrQ3k2Y0pjOGlCU1ZST1ppWndHS3g0WFRhNFpwNWFKTVZI?=
 =?utf-8?B?UnJpMTBJWDBXakpka1FqcXFXbTJTQkZ3RWZVZGtCdExpdDU1RmNIc1J2V0JC?=
 =?utf-8?B?SXBzUHo2L1l5Q3Fwa05hOGhVUnBtaDdDdUlWZzZyMTduNU1tdjhHcjcyQmxW?=
 =?utf-8?B?cHAxd0taVUdyeUREUGtIYVdjWi9WdG9yTWF1d0k2ZUxZUnlMb1pWZExaUHFE?=
 =?utf-8?B?SHVZakd2RHhPNnZSNjRWR2EyUUFFK05vWWE1WHVKckFXQlpuOW9WRzc1ckV4?=
 =?utf-8?B?ci9iZzkvcVk0TUd5VGJud1dDU2NpYWNmODJFSG5qOGFkRU5CTFlZbC9SVW1X?=
 =?utf-8?B?V2xKL0lOa00zZG5HOXpkNm5QQUEzeHZMdXJZOXBYek5BWFpUM0h0aGRIbEls?=
 =?utf-8?B?SDNYNHlxbXdDMkEzdmNDOHBGWDQzRW5WaFFLMWJ0RlZ5ZXZjL3N2ZS9haWsr?=
 =?utf-8?B?TVFDUGgwNnBaWVZvZE5HRW82M0djK3c1cUFoakpyY2J3Ukt3SWNkbG1ZcVZ1?=
 =?utf-8?B?ZCtJZzJ6TjlGS1NsSjRJbDFrWVN4b3d0dzJnajhMSHBWWkRWcXVNaVltMjF1?=
 =?utf-8?B?aTM5Z0hoRDI4SXBWdjJvWEthS2VNeFg5Ni9Ra2FCSG5HWDNQakl3b3RmZlJN?=
 =?utf-8?B?NVZTekpCWFVHQzF4TTk1MzAvSldWb0s4SndoNEhSSWtQMVNzeiszeVRtNEt0?=
 =?utf-8?B?bW80V2pXNFhick4xZmk4TnpYSjZuS1dVNlJIS3phMFRnU0NwWEZld3gxMkpp?=
 =?utf-8?B?SVArRHArNTRJV1JWNThIVTNJZE9IQ2JNRldJT3EybjZzajBBeE9uOEFldkFY?=
 =?utf-8?B?aWFFUXRNcTlDdWNSdERONGFnVkludk1zUmc3RmhBRnloVWYxUTZoaGc5bkdH?=
 =?utf-8?B?ZnNxNjJsRWhudS93aU8vY2N0Zmc3RHcyY0JXSENWcmlCQ1MycmltMDRnYU45?=
 =?utf-8?Q?ZKlLhxztIYLKLWkeEzY8G44jyVesxTkV+EE7I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDQ4eldRSFVWb29HUENETm1ydG85OEVLV01aMkxCeWJBYkVyMFRPTDNJUGJp?=
 =?utf-8?B?Qkc3QW0vR0MvamdPQjJOejRDS0dnVlpaQzNySjJEZEVhWDA0K3pzd3BiZmUr?=
 =?utf-8?B?UG9oWW5XbVU5bWpZdlZwNUxpSWJ4a3h4bmZmc1hReTQ1b1ljVnE3eDJaL3Bq?=
 =?utf-8?B?cktFWHFoanRFZG1xYjlOZzRIRXhDY2xIeUhXT28ycStEVzJnQ1g1OHNJZi92?=
 =?utf-8?B?S3pYMk9lL2ZaS3FlQWxsaWVjWXRxaXYzQTNsVG5YZDNWcFBXMndUalNXSlZC?=
 =?utf-8?B?WjdMcHh3dVZSUUdoZmRHYjVucXJUbUVmcVBISEsyT0JPdWtBV2pwU08wWGlM?=
 =?utf-8?B?UEFvUkFXbkdObzN3V2ZFM2UvSVNEdTNjZ1VzMnBMdXcxbFdUeDlod01tZHJk?=
 =?utf-8?B?YyswRUV4QXFqYUlwZjhGOGkyZ094WHJWNGdIanRxNkRHbEd4Ky9tRldBWW1u?=
 =?utf-8?B?ODhoNnFsakJKbWVpSVQwQ2djcWxWaEZTREwxYVB4NDIxZ24yVjJ0SUVZZzNz?=
 =?utf-8?B?ZHZXZmxUR3VCS3VEQlBRcGpEQ3c3dU5sV0pQUVNuNWFjOGNtYzlabXBnVGJJ?=
 =?utf-8?B?MGZLVVo5dEREQlcwSHMrb3R3T3RHY3EwVGJneVROVjdBRkt6Z2tzN0IwL2xW?=
 =?utf-8?B?Ni9ydmhDOTVFL0IyVktab0dnMlZQZW5JWHVmVUNuVTNTRVcxalRtR05OL2Zh?=
 =?utf-8?B?ak9CTUp0S1p3dTV2M1J2eUp5Z290T3Jta1Nib1lObmZzTi9lNzFMOUpQR0lo?=
 =?utf-8?B?bjVrOS9IQ1RlTTM3dVcvSGZsTHlRdW1KK05XYi9nbDFMMTMrVm50dk11MUlR?=
 =?utf-8?B?aFFFYWtGbW5LU0E3UmxzTnVteFlQRkRFZS91bk5IOUU4WHJxNllIcnU3azY3?=
 =?utf-8?B?bE5ZZnFVU1pnVk9jT0R4czBFWEhyUzd1dHA5STlMbTVlbWQ3bVZ1Y1l4U3FJ?=
 =?utf-8?B?Z3JSVDRnNTFMaDluUGdZSFBNZUg3M1duM0xqbElkQmViTFhMMnRGNVpwUkQw?=
 =?utf-8?B?dnZ5UkFwODFtWEhvQkJpMS9qTlQzbzV5Z00wajBLV2x5ZXYwS2VWK21zUEZz?=
 =?utf-8?B?bXcvQkdoNy9aNnFTVGVibWRxcW0wd2p0bFptdGVUYzFhaytZYTFLN2QyNFNS?=
 =?utf-8?B?VkZhZWlERDB1VDlKT3lWRDR4em9GR3hNcll0ejVDbDNSNENYMHdZQVFQeFY1?=
 =?utf-8?B?MUlIQW9MUFkxa2N4ZDI0MFRlZzdBRFdCSjRMc3ByNnlpWGlxamV1YWJZNFRo?=
 =?utf-8?B?Rmw4eXh2WUkxTTgrNWY1aHNxRS9QaU8yTjJmWm50V3Z2SDlReE5vZ1drd3hB?=
 =?utf-8?B?cXNVZGdNZEUxblp0eGxKQUxHTmp3dzRWSlVnd3lYd3FobjdEdmVhK2oyR3RN?=
 =?utf-8?B?cGNVNUVaM3FjR0dtREIrS1c1aFNJOWZXc2JqWnByRS9IeTVoZ25SYUx0Y1Jw?=
 =?utf-8?B?SUpRSDNhNXZoTVIvK0tnUHM4NVJ1NVZ6Rm05YXVqckpQajlFcW1BVHJuS1B0?=
 =?utf-8?B?WndhWGJYVFNlcFNqZnlWdFc1M0lwTTFXeWJON2YxSVhPSXQzcThxbzVtT1dV?=
 =?utf-8?B?QWk3RDhqVEdYZUJ6NW1obFYxVFhSb0l2Q2Q1OEVZc25CQ3RZUXFuU1JtUTFu?=
 =?utf-8?B?a2JNS1V4VHp1WkFKK0JzQWVOdnZ1enNRR1lRd2srZ2hJRmpPWUV0T214NDFl?=
 =?utf-8?B?dkx6d283OGRiMzkzN0tFamJzTTdkSnBSYnB2YUlWQ0dNLzhaUUhMSjIzNExv?=
 =?utf-8?B?RnVUQ2ZxMExtU3M5WGFYZFl2WitZZ2p4dVl2ZnNGZ290c1NTQ2ZLbHdySWx5?=
 =?utf-8?B?djVHM29WWkFTQURKUGRTOHRUL09VY0VuRjA4R0czZGE2QzhjbXpjUDlkODF6?=
 =?utf-8?B?ZHZoYnRnZ3Yzd241OU8zaEErMlpYcVozOVVlY0Q3L0dFcFh6RjNnb1loa1NT?=
 =?utf-8?B?SDhPWTZERlFPakRoeU1YZk1jYkVMTzFwdEg0TWlqS0FmSDgxQ3N5RTBidjFs?=
 =?utf-8?B?SXdQYjlsOVRid0NkNXIzZW8vdEhHb2E3OVh2RTBKa01tQ2RPY295OWg5dk1j?=
 =?utf-8?B?YU1wV3l2QjNrYWJHeGpFWGhDY0xPZkduQmkwdkR3emxrNGpncS9pdyttemdG?=
 =?utf-8?B?bkhPZ2E4ZXhEYTV4MlByTEwxMzg0bG1qMnhBZEsrSnAyZytXQVdOUld5RUJ3?=
 =?utf-8?B?SThxdW1jMDRtNWcwc0VwRHZibmtUSnVsVDJpT29QRnNjanpjRmlCNC93di9l?=
 =?utf-8?Q?KX+PjSlnWP2H0TJ+DyisaG3lzygIm5p/+wgVqIYL2k=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336b6df6-16a5-4d36-dce3-08dd8e31e576
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 13:11:51.2367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +f6WHcrfxt5S2gJIsaLN5PoHHNSSDgjlW4s2AXh7W1Iqx4ZCrbftsrgmfkwNlXsnPGXzjWlQ0knnhXaDnN5nCDSRfYQ6upGsTiv/lVjyezM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB9692

On 2025-05-08 06:45, David Hildenbrand wrote:
> On 07.03.25 21:22, Mathieu Desnoyers wrote:
>> I'm currently perfecting my understanding of the mm code and reviewing
>> pieces of it as I go, and stumbled on this:
>>
>> commit 27cacaad16c5 ("mm,memory_hotplug: drop unneeded locking")
>>
>> This commit removes all users of zone_span_writelock(), thus making
>> the inline useless, but leaves the now useless
>> zone_span_seqbegin()/zone_span_seqretry() in place within
>> page_outside_zone_boundaries().
>>
>> So I'm confused. What's going on ?
>>
>> And if this commit got things very wrong when removing the
>> seqlock, I wonder if there are cases where its partial
>> pgdat_resize_lock() removal can be an issue as well.
> 
> I stumbled over that myself recently as well. I think I mentioned in the 
> past that we should just store
> 
> start_pfn + end_pfn
> 
> instead of
> 
> start_pfn + nr_pages
> 
> 
> Then, concurrent resizing could happen (and we could atomically read 
> start_pfn / end_pfn).
> 
> Right now, when adjusting start_pfn, we always also have to adjust 
> nr_pages. A concurrent reader calculating end_pfn manually could see 
> some crappy result.
> 
> Having that said, I am not aware of issues in that area, but it all 
> looks like only a partial cleanup to me.

I wonder if all callers to zone_spans_pfn() prevent concurrent modification
of the zone start_pfn and nr_pages ?

For instance set_pfnblock_flags_mask() (called by set_pageblock_migratetype)
does:

        VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page);

If we look at zone_spans_pfn():

static inline unsigned long zone_end_pfn(const struct zone *zone)
{
         return zone->zone_start_pfn + zone->spanned_pages;
}

static inline bool zone_spans_pfn(const struct zone *zone, unsigned long pfn)
{
         return zone->zone_start_pfn <= pfn && pfn < zone_end_pfn(zone);
}

A concurrent updater which shrinks a zone by moving its start would have
to increment zone_start_pfn *and* decrement spanned_pages. If this happens
concurrently with the loads from zone_spans_pfn(), then it can observe
an intermediate state (only nr pages reduced or only zone start moved).
The first scenario at least can lead to false positive VM_BUG_ON().

Likewise if the updater expands the zone by moving its start left. If
the observer loads an updated start pfn without observing the nr pages
update, it can lead to false positive VM_BUG_ON().

I notice that zone_intersects() also uses zone_end_pfn(). It is used for
instance by default_kernel_zone_for_pfn() without locks. In this case,
reading both nr pages and start pfn concurrently with update could cause
a false-positive match, for instance if the start of the range is moved
but the nr pages prior value is loaded (concurrent shrink). This could
match a zone outside of the function parameter range.

Another reader of those fields is update_pgdat_span(), which appears to
be called only from remove_pfn_range_from_zone with mem_hotplug_lock
held in write mode. So that one should be fine.

AFAIU, updates to nr pages and zone start pfn are done by:

- remove_pfn_range_from_zone (AFAIU always called with mem_hotplug_lock
   in write mode),
- shrink_zone_span (called from remove_pfn_range_from_zone),
- resize_zone_range (__meminit function), called from move_pfn_range_to_zone()
   also called with mem_hotplug_lock in write mode.

So I think your idea of keeping track of both zone_start_pfn and zone_end_pfn
would solve this specific issue, however we'd have to carefully consider what
happens to users of spanned_pages (e.g. zone_is_empty()) callers, because it
would then require to calculate the spanned_pages from end - start, which
then can have similar issues wrt atomicity against concurrent updates.

Thoughts ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

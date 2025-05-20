Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBA824C063
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752842; cv=fail; b=NqxeQ8QhTkCTxARFs4rqSBTcMzRlgcT4CZhVCj7Mh3epcTuLDrHPMlZ65RsPb2lbugkQaimY9uU30oAuBgalyqvgS+u5EOixIU0SxfasyNmemYdrPbaw5wAFHdZZFhdIUImnkAW6Ed+TwDDKWi8GLz6xh/ZvrlacVoGbvZlUIl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752842; c=relaxed/simple;
	bh=8ZC7hhWaFDGTwx3GUxJUEHTx6KmAAvM/0oPoB97+i0Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DkzzKo1KIZ3MZk2jhM3vgxpQsqVvm3peNPtmBCgyontq1I/FURuJ5iD8WM4U38pVA7r2StDfQ9skECs+GgOQdgsmC81tdE9A75DjQ0RKRSsYZMPP8h0m9uybpQmp+ExBAv1aLXY274mW28aOrD2mMy3Syo5FXttmYAScCZ+6VzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=ZGXLP9eD; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="ZGXLP9eD"
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7j5GS004760;
	Tue, 20 May 2025 07:53:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2021-q4;
	 bh=KMxnNM7N2KRRWNpXf4VUmKr7BwkRPDWKTUr0Y4NQF8s=; b=ZGXLP9eDecMN
	YhJKWBgEkpLbukr7abdAT8jzOFTuOUio5nMEewNLGY+VuUdi+iZAng9AwBPrcVW7
	wER/Zc8E2aU7tVwIOgR36AN2GQMSL2Wp9Yv6GLUPzd+osxZtfSNRk7kSkmCWXBjd
	N1+/sXmoADD7r/wxahC0+n7Pa7KSO2U+TYBJO7yyEhoIlEa4OIwMtffKYDro+aGM
	AJAHZBBEncpPE1M5pHxpLBrvJ/F2dfBz9ogD5i8ygLKTHJ4Q0Dn52B9i90UEIW6D
	jFsNpe6nKcS9C6teOlj7C18aWKzqfq8D/5P9qYH3alntI5XyuuN7jESVCpvwBteX
	VSoeWCDScA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 46rjgjbj5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 07:53:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jD6mSPvHN5kY46JkwycF+Uj7EMcekjI/CjXUaye/A0DgKN9xSK8ODwvrBK4fBNTtuPBtlxdiXKreivvLCbHhnfAOSHoxgoTr+CZBaCqHPzUz8eXQQ4USRlUHHoDJLQSoBSnOcFdMQEJoMiT94m0s0frqp8dmiC3PMcf+tj/fezVk7UHqbohXCoaAyGSMb76qc9axsi8g6H6qvQjKdwg15toeSqol0Av0wOjuZRLVVnx/i3vBtNkqLL40W8qkg4dAxkeSiRSgWl2hT2vnTYwQc5cSnLBobIo74E2hCbV77yGYpA27SO82Kn7Z958QI0gs9/cJ6FBTvQD9g0I8otk4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMxnNM7N2KRRWNpXf4VUmKr7BwkRPDWKTUr0Y4NQF8s=;
 b=NJL2xVSb/wNSZYSnvKY8KIDDpeOEXB+ud1oYALvRdPO/tmkodY9TFriNOsZ8w4a2j0ykR9ysyGz0MeJ0MPzIwpvfYDuagEu1moECwy2RxsZa6ctRpUlP1McB4DiaE69xrTQQA//ICPsmJBG+Kqv8OGEiCtUeKt00KPpKx9QOwdPgqL4pCSEBH65KjT4REc9rFzlp+XD7cAKArTdiYSsBOV0t8aF+y7LiOmbUw5mhNe4vkvs0dLFRLC+ikYBd+gaeX6XQNyAgS2yZMUi2vTQ1M7XGA8llVOjDv9fB1FmXlsCbz7/YJ90UQMNmlld1mpVx5/FVGHE98B45lu1G2QQ7ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by SJ4PPF5E66B6E98.namprd15.prod.outlook.com (2603:10b6:a0f:fc02::89c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 14:53:33 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0%7]) with mapi id 15.20.8722.027; Tue, 20 May 2025
 14:53:33 +0000
Message-ID: <23576497-af63-4074-8724-d75d0dca1817@meta.com>
Date: Tue, 20 May 2025 10:53:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: scheduler performance regression since v6.11
To: Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
        vschneid@redhat.com, Juri Lelli <juri.lelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
 <20250509194955.GA25798@noisy.programming.kicks-ass.net>
 <20250512180846.GA25891@noisy.programming.kicks-ass.net>
 <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
 <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>
 <20250516101822.GC16434@noisy.programming.kicks-ass.net>
 <2084b7d9-bb4f-4a5e-aaec-98e07b3edc2e@arm.com>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <2084b7d9-bb4f-4a5e-aaec-98e07b3edc2e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:208:23b::27) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|SJ4PPF5E66B6E98:EE_
X-MS-Office365-Filtering-Correlation-Id: 629a5eaf-9adb-4ea2-1b90-08dd97ae17a2
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjdMNmxONUZES1VFNVpsVFRPYzB5c3BKeENNZXlWYS9rcXkwMnNPZ3p0KzEz?=
 =?utf-8?B?MkVFK3dUbTZHWjhic3hmcWtuUndMVzhhUC85N1oyZjBKbDlueTQwMzBZWlJ5?=
 =?utf-8?B?Y2VtNW56VXlyeVZ0TDArc09sdHVwR1lEY0g1QXFRcmhoM1JCWndLZU9aeHo1?=
 =?utf-8?B?KzRxdWtReEhsNWhwWE00b0ZpU0ZhcjhORk1hR0FSTVVBTFJOSldUYjdWenJC?=
 =?utf-8?B?dEZURTBDRHZTdDM4bXp5THdYQ1VJTmJLbVcvdStiaUtaOVdEanA4QW9pYVRC?=
 =?utf-8?B?RUxLdlZpN3N3cmdoN1hFdlQ4NThoN01kZ2RBNXo1RW14ZlNkM05OTE1nd2tx?=
 =?utf-8?B?TU5CcG1GSFpmZ3Y5MGNITXoydEZuNGI3VEllQzFJRjFFVFdSMkRYbTgvenl1?=
 =?utf-8?B?bldEK0srZ043UGwyVFZ3TkRsSGxyejNUMWhlNkJid1dLYWZEOXRlTklLN0w4?=
 =?utf-8?B?U2ZQbWpCajRseG9RdnNXemxPUG9jY3VtTU1DRkI1OTQ2MU9kckhEMlc4TzJt?=
 =?utf-8?B?NXZodUFMaCtORFBvalJxNU9PZC85TUhMZUE5TVZlYlkwdVNiNDJ5R3MwdGI5?=
 =?utf-8?B?S3E3ekE0WGRCSnBFWS9xaVZhcjNRWGszRkkwOFcwTVNOUE9RNS8wRndpeU4r?=
 =?utf-8?B?dGFIZ01KVXRucWdMaGp3VlV3bVBTM2lxV3VjUDhwMGFPa3VzVXc4c1RsaTc1?=
 =?utf-8?B?WHF5UU10WWJMdWhuTWtvMG9ZMWxRYUJvZDFZRkhjZVJGTEdSRkMxdStCbk9k?=
 =?utf-8?B?eTU0SXdBV2l4bHlybUZNRXFsd2Z5d3JWOW5sUWF2aXBvUC9ncDl2SWMrUmF0?=
 =?utf-8?B?cm5MRFdHQ25URStoVFZiN0U0V2xEc0JXanVrVEFQUFA5ekNTeWxQYzdRaTM3?=
 =?utf-8?B?YzlGRnE1Y3ZQbmdEQml1WG5YZzlFdW0zcFYvbUdNamQ1ZWtuOEV2THIzK2ZB?=
 =?utf-8?B?WXZmVzBseEs5T09OckxDSjJhd3NaeFJrS29RSDJZT0NzeTJWSTRncGh3Z2Qv?=
 =?utf-8?B?SC95dmxyWVdSaXhLZnNDc0dIK1ZyejB1M0x4WVVJN1NaZmxkYkwvZEtITE1z?=
 =?utf-8?B?WGNSTmJ2anFuSmY2djkzQjRHQ1ZDN1phMy95SUlSSXE3T2FTeEtuS1NGMWhS?=
 =?utf-8?B?S2p6WTRCU2c0a0YrWW85MlBPWVBiVjV1R252Y1ZnZjZwK3I3REo0WW5mb2xC?=
 =?utf-8?B?TFlsenkvMTdCd1g5UkxlWllDNjJaSlBZNE80Y1dJcGFDelhWaGw2WTNlcXUr?=
 =?utf-8?B?M054TFlxWW5FSkxQdnhLRXBkUWFEbzdaQkQ5a1c4dDk2NHlRWUNtbkNBM0w2?=
 =?utf-8?B?VTV4S2dSSVkvRUVLWVRNM3FweXJhbXpDUVBXaC9RY1RtUkZTS0FoM3RxTThm?=
 =?utf-8?B?QXVZWmZsWDJjT2ZWbWFZdkwrU0Z6bWFwMTE3VmszcVJvYmdyZmMwSjlLRGxm?=
 =?utf-8?B?bGJxdEdQTTRyNlZMRzMrclFpa3R2cEtmd044UjUzQkEycmc0QmQ3bWxlcysr?=
 =?utf-8?B?ejZxM1M4eENmU0lJQlY4VGhZbko5NWlhK2Q1eENlVUdRTmRKeWhkdnNiNHp3?=
 =?utf-8?B?OWR6STQ2Nm1FWFYvOEcrM3lKUExJRFpjWnNHSUE2SnNHbnIwQkI5Z1MvU0Fs?=
 =?utf-8?B?WWFGUVc5N29SeE9qNFJ3bVBvV1lkZmZqMG9SNk10cXhTNkRNeDYvK3BkNk90?=
 =?utf-8?B?bVNFOGNCKzFkTFZGR0xRbHdsVUNDNHl5dmQwSUVFMktrVFlvVTgraHQweVdR?=
 =?utf-8?B?UEhuTit0R2tkdEkxNEdpb1FxWW5DbVQvanBDekl2TEJCMFVrNkNMb1pHUUg1?=
 =?utf-8?Q?3Ss51HogKSfLV9Fh8krOv4xHyMQiLNy418X9o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTMrWk9MYStXVi9rTTFqam5ZWlVEZjVYSitrTlBQaDBkZTFIUzd1YWUzWmZL?=
 =?utf-8?B?dDl3VXhFeUdTclVPN2hPZUcyb0hCOTdDVHFITkd3bTRQcHFqVnlUbkFsS2hD?=
 =?utf-8?B?TG9QbFhLcHBYY1UzREFrdHdMM3hhdnlCcThnVTU2NmdJeGFmcXpZN0dvWk53?=
 =?utf-8?B?Uk5IMExaYUcwQ05KdzlxTEV3V3djVFZCdnM0R2FZekk0RUxUc0ZrZXhFdmV4?=
 =?utf-8?B?R3NtbnU4QmdoU0gxRzA4TDdKZS81SHFnWE51bTc5SkhZMjJ5eE5CK2VaWGha?=
 =?utf-8?B?KzZVY2JYMFhETEMvaFhpTmYvRzZhMEhxSFhjRUZTbm82WW44cC9CU1M4VFFm?=
 =?utf-8?B?VlQ3LzhQMHhnL1NPT0VlQzgzZXk4bHpvNTMvem1iYjVoaWxocVNNbmtCdGZ0?=
 =?utf-8?B?bXI0ZzRBanZMZjBCSXc4aFhRWWdudDFoYnNxWjVJZ3hDZWliRzFOTk1PWFFH?=
 =?utf-8?B?c2lyUGxHajBLdnJlS0QzVG9uUkJzOVJ6VDBEL3p4cGVhenlTbFRZcFAxY1kx?=
 =?utf-8?B?Q1VkeTlOSy8ybFBsWWJqbnFXekNDdk5iSzZoOFJndkU3VlQ2bGt5ZytkSWhK?=
 =?utf-8?B?TjF4QVZzWEpaeUVzWlZpRWdkL2M1a0RudlF5Nll4K05ROGg4b1FzVnNtcmFV?=
 =?utf-8?B?VmZlcWJoSloyVWlHUVc0ZTIrOFE4UURZVjB0bWNQWlBWcHF2amc1YWw0YWRX?=
 =?utf-8?B?aUFQRzcyYmJtMlVSRTQxeXJRb2ZoZUwrL2hQcDl4YThmUWJlMGVyd1JYY0Zl?=
 =?utf-8?B?WGZxN0NJYkluaFJ2Z2ZlTXdTSG52dHpQclh2aXE0Z085Rlk1V3BPTjNaSWFs?=
 =?utf-8?B?dURacTdRdGx5WUNoQVBoZlNkdEdJaUczYWZlbldZeTVrQXVEZCsyYnk0d2pj?=
 =?utf-8?B?RGV0OTVnZHZzUUJvRVo4dnA0OHpGdEVmOUlwZ1NMWnhpUWQvY2Q1d0VqMy8x?=
 =?utf-8?B?R2xIc1B1cGtTZUk3R2U1OGN6MEJwK2w3cjVrL0E0S0tyU0o1VFg3aGtpdjMr?=
 =?utf-8?B?aElnemZJOXROcmxUY0RxWDdnTDdyS1YxNGtFUTFXZ0N4WExXczBhUC8xRTRi?=
 =?utf-8?B?WUw4V3hBZGw3aXJDT1RGYzB2azY5enFJdFJNYWxVZlZEeDV6MzdSMURJYnQw?=
 =?utf-8?B?Ukora1FXZkJ2T0RwQlQwSGJLbmY1d1hxYkt3ekdtUmtXK2Q4YjBiK1Z2RE5v?=
 =?utf-8?B?MlMvUFlnb3Z5bUJRVHJTOEJhRWlVdThUL1grSkQrWGd6cmg0ZHloTmVXa1RQ?=
 =?utf-8?B?SEwrNDJNSjRPUFpHYkg0bUhwNG5NRVFzWnA3YzJmMEg2RVA3RmVqL2VMWVM0?=
 =?utf-8?B?cE5EcUE4eWczYkk0U0g3bkdyOXljRUkwSW9EaU0rTVljYUl2ZFFJc3B1OHd2?=
 =?utf-8?B?VklpbFV4d29tVys3VFdCMmt1QkJYYmhiZDJINkJNTVJvbnRlNWQ4OXY3dHM5?=
 =?utf-8?B?OFA2a3Jtb2w1OUZPRzdxUExDUHBWb0ZyTHNZRlRGazBWVVZHellwQ01NVmlC?=
 =?utf-8?B?K0xBM3JYc0g3dmhTS29kNW1oQjFpalJvQnJYQnJWOE5RaTBVdVdod29Bd21a?=
 =?utf-8?B?cFk1S3RuT3JtODRKMXhGQk5FR0NKTmcvd3pjejhab1h0VE9TSjRxTHJ4aFIv?=
 =?utf-8?B?bmt2aFZKRkJpVnlQYjFyNUJnL3QvdjBKMTVHbHlMb3hVL1RyM3RMSmlDWjlL?=
 =?utf-8?B?dmNOVTllZ0dTSzBwTGRTNFkrTXNBZERMODEvb0Vxc2U1L2JqM0NKam5zNFFw?=
 =?utf-8?B?OWNaVTBVcCtiTXJnSTd5WHhuNmdDcE84VjRvSnhSRGlMTDBpL2ltSHluTXc3?=
 =?utf-8?B?Vi95aFZuZFFoVXYxK2JjWG1DSzNuTEU2R2c3WTJIYW1SRHp2RW1mVlk2Q3BW?=
 =?utf-8?B?RktUN3E0SGVKOU8rNGtRdHpPM0FVenBXRURndWdrbGg2WUFQbVVVK1drMUht?=
 =?utf-8?B?a0pYK3hSZE1ubklTejNxeklML2tZdkNJTzdVQVc4SFRUcHdndFBKMzVSdFk0?=
 =?utf-8?B?d0ZWenp5UVVDRks5YlNCWkcrSFFET0RNYmlsWWRPbEdkY2RqOVFubXp6cmd3?=
 =?utf-8?B?VEd1WjJkeXM4OGV5cnErZTh3ZG5mUndoTmZHckdrUmMrWHAwUU05WnY5UC9t?=
 =?utf-8?Q?X25o=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 629a5eaf-9adb-4ea2-1b90-08dd97ae17a2
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 14:53:33.5205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3454a/TurSGTWZqiRxV4DCcT/HFLpJKr4ChXCSatZIxIeCWdgvG3CDvgIzrBBZV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF5E66B6E98
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEyMCBTYWx0ZWRfX/aSPptf9xNiI KN6JSNTpZOtd8VfDZDkrNkCBb6yWMQjPEM+l5RpuJEpXdZUDzkKgk4DOU4mNX5JLobbnggVYNAV wSZBUxVZ9O4kyqP8gTXBf5A/zKyFv8Gh3OCMm/HxCM5XArnZPfeSMfHZnmdxwQ7n9R88zLQmsP6
 zm+o7Hx67mPRRPb3c7Zl/mYd/GFWSVFZjU9CC7I+1YXb55r2HC3M0p6o2AG3b9k4t/8Fr3LIpWf t3g4ZM2hPBX1whz8MUXP/qHCESluEzBSdlNL2YWTGgbiLwBkRqaQzJGgH9QS610v6cXiEYSxtiP O+JAHrzKvfBLK3bRUHaM8dZo9pC2SWAmehk/sIc9++PWe46PFahQIhJH70/an1GLEMwLP4LccuZ
 Zlv0rFGWux3QoGrhaEZw3mQEq0aHu2cg+1sQKdwlQc7FdbJp4oFZbdZju4LCyRBVH1fdBIki
X-Proofpoint-GUID: cLYLomRWAwfJjApIvv4yxf3puRpdeLFj
X-Proofpoint-ORIG-GUID: cLYLomRWAwfJjApIvv4yxf3puRpdeLFj
X-Authority-Analysis: v=2.4 cv=PqCTbxM3 c=1 sm=1 tr=0 ts=682c9770 cx=c_pps a=joO5rFOndlhnht97C4Lqsw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=1kh535N3VjSecvVthCkA:9 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01

On 5/20/25 10:38 AM, Dietmar Eggemann wrote:
> On 16/05/2025 12:18, Peter Zijlstra wrote:
>> On Mon, May 12, 2025 at 06:35:24PM -0400, Chris Mason wrote:
>>
>> Right, so I can reproduce on Thomas' SKL and maybe see some of it on my
>> SPR.
>>
>> I've managed to discover a whole bunch of ways that ttwu() can explode
>> again :-) But as you surmised, your workload *LOVES* TTWU_QUEUE, and
>> DELAYED_DEQUEUE takes some of that away, because those delayed things
>> remain on-rq and ttwu() can't deal with that other than by doing the
>> wakeup in-line and that's exactly the thing this workload hates most.
>>
>> (I'll keep poking at ttwu() to see if I can get a combination of
>> TTWU_QUEUE and DELAYED_DEQUEUE that does not explode in 'fun' ways)
>>
>> However, I've found that flipping the default in ttwu_queue_cond() seems
>> to make up for quite a bit -- for your workload.
>>
>> (basically, all the work we can get away from those pinned message CPUs
>> is a win)
>>
>> Also, meanwhile you discovered that the other part of your performance
>> woes were due to dl_server, specifically, disabling that gave you back a
>> healthy chunk of your performance.
>>
>> The problem is indeed that we toggle the dl_server on every nr_running
>> from 0 and to 0 transition, and your workload has a shit-ton of those,
>> so every time we get the overhead of starting and stopping this thing.
>>
>> In hindsight, that's a fairly stupid setup, and the below patch changes
>> this to keep the dl_server around until it's not seen fair activity for
>> a whole period. This appears to fully recover this dip.
>>
>> Trouble seems to be that dl_server_update() always gets tickled by
>> random garbage, so in the end the dl_server never stops... oh well.
>>
>> Juri, could you have a look at this, perhaps I messed up something
>> trivial -- its been like that this week :/
> 
> On the same VM I use as a SUT for the 'hammerdb-mysqld' tests:
> 
> https://lkml.kernel.org/r/d6692902-837a-4f30-913b-763f01a5a7ea@arm.com 
> 
> I can't spot any v6.11 related changes (dl_server or TTWU_QUEUE) but a
> PSI related one for v6.12 results in a ~8% schbench regression.
> 
> VM (m7gd.16xlarge, 16 logical CPUs) on Graviton3:
> 
> schbench -L -m 4 -M auto -t 128 -n 0 -r 60
> 
> 3840cbe24cf0 - sched: psi: fix bogus pressure spikes from aggregation race

I also saw a regression on this one, but it wasn't stable enough for me
to be sure.  I'll retest, but I'm guessing this is made worse by the VM
/ graviton setup?

I've been testing Peter's changes, and they do help on my skylake box
but not as much on the big turin machines.  I'm trying to sort that out,
but we have some other variables wrt PGO/LTO that I need to rule out.

-chris

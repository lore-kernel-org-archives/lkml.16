Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B15984A3E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 00:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.149.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751677201; cv=fail; b=bigIO3+cckgv1zLctM5B4n7UZEdrT6uCitIpDpDnbEycEJh8C8T65cd7kKHsdi1Ai/8vZdAbhhoUJ2iywLadCDkElzhJ/rrBcub/GTruSJeTvpSzIcErqczPoB9orQzUfngGw94wbok0d310xlxdnWcAE73W5HhuDYgkF9X0mVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751677201; c=relaxed/simple;
	bh=qVZcIjbPj8RdV6K+cm6XBOxRTzE7Me/rwMsGkPHBHHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ix57pocsx8TXnF1aNfFtFzXfyAj8vR0jwCd+9SceX77+mAa+Csm1CiCgqaCPWiY42AwzYWNeCD9uMNR1/T7/8bqz4mX12SVm+WeHLDT3RBgnv3PbTdX6+DBfzE8irPMsTM52k2dbbLl1XW4U8abUxjKPzGejw6GJqMye4yVqmdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com; spf=pass smtp.mailfrom=silabs.com; dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b=fypmnpG7; dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b=VYpNU3Hl; arc=fail smtp.client-ip=148.163.149.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=silabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b="fypmnpG7";
	dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b="VYpNU3Hl"
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564No2mF017370;
	Fri, 4 Jul 2025 19:40:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=l6TrGuuPLuunJaJORXckr2VCFTWAc7aCLVkh4Mujbps=; b=fypmnpG7+HXS
	gxMqeckUUsmjUOWgdgwMaG6gV664tIs5446O5uLa5bn1b+1p3pJqsEyjbMnLkXtK
	oywHBOFcLTvfCgfM9I6eh8Hwaa2VdUiaOrlL38i/DLKGTyIuG/xWP2Tjbb9OuLuq
	vnqq4XfbBKrkUljQAfOElvxDzy+4TxA72bOxRtHI/i/MZebj0Ky6N3K+sdjXybS/
	zc6g7xMyipESBZn0/u3LEIdxHKz5zM04aG4D9kCs28jcyQKbirOTTZjph7Kk9l2C
	nG8CctITuMWSAfJRyhGwB5PPzDu5Blo6/SceJ7rCjNOB1QNYhydvcfCOMDS9rDYU
	VatSA0/Yzg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2109.outbound.protection.outlook.com [40.107.244.109])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 47p8pvhb7y-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 19:40:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGuxandrA2OdiI1vVKQlyDsmr35NKfuRdozqW1UmrJzdTN4NYpskl2Ftkh+MtWd1vUB34Gd0zSvbRF0YN661NT9gA8iK60uNb8QAkeBzbEZEUXt6ucMNRDJ5AoEmRdi6ok7qT12pP7oc/OXXBEUMnyTc64HVvgox7ySg8fyTbcXfCpLSsngf6TZeuu6/QsRYhMVfVkvKoD+8A7jxizrRETiwZyQqkJt0T3yIclHCayHEr8TLDTDQFSH153hAuelXmKyr0s650wO1tsojZlivjWED+CLS34w2mb8St01ZI4GGBj/yzGf4PMi+xRx87RkvQ53N0SmEe8WwshUR7TzJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6TrGuuPLuunJaJORXckr2VCFTWAc7aCLVkh4Mujbps=;
 b=RHmyokdTCEewosXhEVjHcpx7+EWEkDXNLYdayp5NuoEDaJg8nF/VbYJYRy4bX7B96/13ppM9uBD5dq0+1P3EOAa7Pt/PPS4ewNOP3d7uaMjJ9P/o8YRsL4GTE6DjPvQqcnm0xi8+lKDHJcBpbdwruwDwytU7lMwqc89KnMXcbw0S+BT/6TRgHEIpplCldqgOPNatZH7Bv22qJhnPQySL+OnlLzmMk0m3BiP564hU0RFlFWvHkc23sLkHBDC1TB6Ne++yTItc5zLqFYDh8UAOh32q7w/iMC64qoVymq8jfb0Z6oCclt7N8R/hn79HE6cJYppgMHOEIU8iaalWgiAYxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6TrGuuPLuunJaJORXckr2VCFTWAc7aCLVkh4Mujbps=;
 b=VYpNU3HldVh9dbBb4TbS/xouBhMaLQSPEbwvHb64unPX5S1WBQ9NLAtOy/4dCmfAVVJLzQR+bCYT8WjVxhqQdVrLUxGKt05TNiYVRSNyqsAduE8gNbkVoUNl3ZgjRF3f9kdHf68/H4LM4FvOvlSBZK9eRNp245EDUi0Um0ZEtnY=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Sat, 5 Jul
 2025 00:40:51 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%4]) with mapi id 15.20.8880.034; Sat, 5 Jul 2025
 00:40:51 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Cc: linux-kernel@vger.kernel.org, linux-devel@silabs.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
        =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
Subject: [RFC 2/6] greybus: cpc: add core logic
Date: Fri,  4 Jul 2025 20:40:32 -0400
Message-ID: <20250705004036.3828-3-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250705004036.3828-1-damien.riegel@silabs.com>
References: <20250705004036.3828-1-damien.riegel@silabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::26) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: 3af7f484-9e43-44e6-2050-08ddbb5c97cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEJuQ0JlKzNjaTZlME9CWEJVZ0U5bjJrMzV0bDQyS2M1ckVhREgySFczdUlH?=
 =?utf-8?B?VDRNd0RRUzNtbm1tbExwc09mNFdzbXdMWit1dlBkMHZZRzdsOTI1QUZJR0tv?=
 =?utf-8?B?RXJhUGVxMUVnS0RZV2NWL1daNStiR1dzcjNqa0NFekNOMzhXYW1qNndWMUQ5?=
 =?utf-8?B?ZWk0YUVRbVhBOXRaMzNCRys0M3dPcTB0bGFUUGt3djhRM29kcG1TbGNKbnBR?=
 =?utf-8?B?Q29STkFSTUdFdWZWQVducFh5VGFhcEl2UEdhQXE0THZ2U0F1YjVlRGQ1QUYx?=
 =?utf-8?B?VnN2OUN2dFNwQmVTUTZQa1hpazE2VFVWcmlQbFJrQzlHT21PUDAzNHhNYW5T?=
 =?utf-8?B?M2x6QUgvRjRHbEVLdndPanlpQ3B2SlFZRHREVzNOTjkzVzJ3cFJjUmVvVWND?=
 =?utf-8?B?NG5ueTJGeDRMYTlUUVJxcHFGYXU0ZkNpRjlNSXpTa0Z6WWUrOTU2dDJYeFRj?=
 =?utf-8?B?dTZsUVN2YVJiRlRJblJtZjBKR2tJOGkyM0laYVJXRHVvVk5UUVUvQm93VUhp?=
 =?utf-8?B?TkVZZ1M0YWdDVWpWSzdpYW9PckJvMk42MnpVWnJqQk9TbzkxcHQzbFVkNHR5?=
 =?utf-8?B?WFQ2S2RuNXE2NXVyM0dZSUt4QzJKUHkveWlnQ29qbDB2MEJDdHNKWW9IdDBx?=
 =?utf-8?B?aXJzNFVtK0F4NDdJVkFZZm1sK3VjY1I5YWhWcEw1eU95RG01azhiV2ZmYUN3?=
 =?utf-8?B?bGZKZ1RpYURKZCtXK0lmUGJxVC9KSnIzd0x6OXQ5QmVyYmdDazd0dGhNdEdx?=
 =?utf-8?B?ZjZaUi9mY0hLc2hsaE93V29Jc3M1NE1oVlZCdWd1bm81MzZzSHVWZ2VJVEth?=
 =?utf-8?B?bnUxS0gwSlBmWVpRY3ZQMmZMR2RmN05lYlAza1pnTWtOYzVRN0dkV2pUUzlw?=
 =?utf-8?B?TnE1c0xIY1BEZm13d2ZyR1Y3SWowdWRtSTdEZG1Wc0t0UXJycUNXRk55YWRS?=
 =?utf-8?B?RndQSDBocVQyVjluVy9nOUJ5dzZQalljRlgwNFprcXA2WG04TUYxS0NzZm95?=
 =?utf-8?B?RzBXV1JhTFdGZ1U2c1dMV1MvMGgzSHZDV0FBa2FLNWFiRjNrV3NmMGo5K3pR?=
 =?utf-8?B?L1E2ckpwK1R1ZlU0SnBmdmlxNk9lU1R6SEQxTDBWbnh0SFZPUVc4eW4zcHJP?=
 =?utf-8?B?NnFKNmo4UEZ4RERyWkh5SktoT1hITFc0cGFHNDVUUVk2YXZnekJxdCtiUTlW?=
 =?utf-8?B?dEl5aXowMXBEVjh0WlhlVStYRys2dFZUV082S0hKQVF4ZHVnZVRoVnRJOGd1?=
 =?utf-8?B?bGhFemRHeDVybEV0SmVSa1ZDdFpxQkFZOThBTnZOb3VNMEtCQkpKYW53Tk9O?=
 =?utf-8?B?REtCd2I1NkFiSU4ycUR0T1Z2UnBrbjFud0xiT0ZCeEt6bldnZmQ0bFBydm43?=
 =?utf-8?B?K3VLQmVTSFRjR0k4em9SZzdzYjVJRXBBR2NmcUZpM0hNZ0Zsc2xROHpJYUxM?=
 =?utf-8?B?SVlEK3hIaVcweWdZZlgzcXM5b0FscDViZW94dDJia2s0RGVyMWp1T0Vabm9U?=
 =?utf-8?B?enY0c2ZlSFc5dnB4d2ZFRjZWcFBydzR5R1llV05lY3A1TWVLMllnRjhabGxG?=
 =?utf-8?B?RzJZU1hYMVVNd3dXVnlBM25xaXhxKzllOHNob3JGNjladkZJY0l1RHZxTjlF?=
 =?utf-8?B?Rk9vQ3VnSitDRnNabzBoNE1nZ1AyVFBMbzIwTHFua2M0eDBLdnJzL1drMGtt?=
 =?utf-8?B?aS8xdzNacS8wOUFPVldnVGVwT1NUSHIzeXVKL2YvekUxTG9JZER2dzNIdDNR?=
 =?utf-8?B?ZGtFdzNGTHJtZDZkUG5PbkViWHYxdWNuTTBjdUN5K3QyMnNQMTdNQjJ3djRJ?=
 =?utf-8?B?MVBxaEl1ck51QmZFQmpJUHcwV3ByenZ1ZjZJUjQ2cFpucU0ydkx5RTU3Zk8x?=
 =?utf-8?B?cTJKOEJkYmRqeTkrd2JMbHlwY29sTWxKTXdVOHlxRVo1T0hWblJmYmR4THFP?=
 =?utf-8?B?YkU1VWxwSDNjMDZ1SVNUNU5DZmlMNGk5Z0RPVUtuTXBFZEVYS09LcFI3ZUl2?=
 =?utf-8?B?bVBMZ04rQVpRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck5RTmJySXM1cGZpY0o5a2dFZ0ZEdzlZQWFTZmcxUU5qRXY1enM5OCtKR3BT?=
 =?utf-8?B?YXJ2K1FnU05KaWp1OVVzMy9ydHpxZlRzNmJJTGg5M3NUZi92RStocDdoRkd5?=
 =?utf-8?B?RUg1TSt4TWlYcjMvOG04eHFNV1JrNnZMZTNxZEMxYkY0WWJJSWNVdmE1VFZ0?=
 =?utf-8?B?cDR3dmE2bGlwN2o2aGJnUlZoN0tBYUY2TUphd1BYN3NNaGpCQk1LMytaSFRu?=
 =?utf-8?B?RmJ3NDlQaU1ReEduS1dYTWR4RjBBWWF4NzE3azVUbzlHcXB2dzNKaHRMN1NX?=
 =?utf-8?B?TlZyaFpMUW5vbzV5NGdvaHBBTzNieWNHWk1QcG5iSHp3N0JYYTkybDZjRkZa?=
 =?utf-8?B?a0FZT0NHdWpQRVZFc29VVWRteGVFei93WXA4WThhaFpkM2xPTEFhMEovTVBQ?=
 =?utf-8?B?ZHAvS0RzT2owWlRrWDRub3gzM2prNExKM0JXZXh1b2tFbGpnRkYxNUcrRHZV?=
 =?utf-8?B?ZDNySlhKMGxTVXQyNTYwZ3RnTXhUN1VWckR1V2ZRd2REMnA3dnN0R2krMTNF?=
 =?utf-8?B?N3ZCVVZSTnlrbHE0NVdtUVJKWXMzekRXQnRVRFEvUjVydU5nWi9vZGdwcXVK?=
 =?utf-8?B?ZG5Xd21HRk1QVlRIRkc3YVlPT09EVzNZY0Z5T2FZb2orbFVET2ZUcndRREdo?=
 =?utf-8?B?aDU0bTRiZmcwSlR3ZGRBcGlEU3pRVFl0V2RlUHY1NW9zNThwWG1JY05aZUZs?=
 =?utf-8?B?L05sd2xHTGo0c1k1NE1veXN4Q3IwY05xdHpMckg5K3BiOFRqTmlmUThwakk5?=
 =?utf-8?B?dWxJeGV1NWswSGlML2FlaWhmMFVoRUNsZEk1UFVwTUJJcDdKQy9MamJaTDQy?=
 =?utf-8?B?bXRWbkl4bDdJeHIyT2FFTGdZSTlGMnczRnpxN2NwZGpEYVpyWUNjVlFCQmMw?=
 =?utf-8?B?Q2JnZVpxNG9sUFc2YTVoTXNCL3ZLak5aWDdsVnA2dXdZQnphS0xqZzRTekhp?=
 =?utf-8?B?cm51cnFSeldpVFQ3TC81V2NkUm9XK1dHUzRvRkpSNVBNUXNsZElwUm81b1or?=
 =?utf-8?B?dmdtQTMzQWdlUU0vOVlLQnVHT21NdW5Kc20rSHJqU1dQQk5zR0NobStLL2JB?=
 =?utf-8?B?a1hTQktxa0pzQWJ2NHluSlBJOFpsNjh5QlJoY05kckJ5eWI1SWg3YkhZb1Y0?=
 =?utf-8?B?R0F3OVBjWTB1K0ZqT1IxZGtsVThsNnVsa2tPSll5VDl4bW1KZkNSSDhMNnNP?=
 =?utf-8?B?dTUzcldRWmp0akhZS3J0TEdCMGV6cjlFOEpWdHp2TDFMTlNwNk5NcDMrZmNL?=
 =?utf-8?B?N0Mya2pSNEhGNXZJMXhBWjRPZy9lbFl2cVlvbDVSbkE5ejYycVc0dTFMT212?=
 =?utf-8?B?Wk1LeDdxR3RMZFFhbzcxZTl4bzdobVpWNzZKS1IvUXdUeHg4VUZucll2NldN?=
 =?utf-8?B?enFGM0FpdHpZWTJxUGhjRDFHNnBNZEYzc2g5NFRlNmowby9ESisvYVVPYk93?=
 =?utf-8?B?SFhUWCt2MnF4QWEzY2VCKzc0aFo0YVlCN0F3UEhtUGcySXdMT0RIMlZDckEw?=
 =?utf-8?B?dGViOVIyZm40WlFvd05zMGxzTVNCOFhGZHJuSFd4c3gzWEtvVFNxakl4a0NZ?=
 =?utf-8?B?dXIyUlFFM2pSNmZ0Q01tOGpPK3YwZHQxcTgzbENLaG04OU96aTVRZ1Bsb09i?=
 =?utf-8?B?Q25yWnNaM1FCWXhVazZDSFg4TTJkdnBmMHVXbVVSMjNRYnJmdktEcVdPSHpt?=
 =?utf-8?B?dC8vUU53UGM2UzJGNjNwcmJjS005Z3hTMEMxT1RjcUVmOEFOVGhuSUFqL1Bv?=
 =?utf-8?B?ZlFFVlhJT2ZxQzVidWYyZHRoaUZnZ2VNcExlS05LcjF4UU91UGpRTGZqWkxD?=
 =?utf-8?B?aEZicStkNmVKWmNEVmxUK1Y4STZuTTgyK0hrTjlPQ0dQdlpQUzlhazNRNnA0?=
 =?utf-8?B?TnBHaTYxdzMyOUxlRnhiS2lWL0UzZi9xNXdqaGVHdUZCR2lzeGhCNnRwU0F5?=
 =?utf-8?B?ZDk0bkdsVityUko0WnNPK24rZGlvNkFGQXdxTEplOGpHT2RzNzVJN0dTaUxy?=
 =?utf-8?B?N3JsQzhDaXpJdHhUUUlqYmRIdDhockdFNWNnQ01RZnc5WS9wNXVnWm9ZaTdI?=
 =?utf-8?B?UDNNemkyNHVEU3JYZDFWTGpZZzhnR2NFK01uYWM5cjJyYk1QWERpR09IQVRi?=
 =?utf-8?Q?jjDxry/R4ImV6+R6KTeVTsCfm?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af7f484-9e43-44e6-2050-08ddbb5c97cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 00:40:51.6312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LvNqyQGkxtvlG2UrUQ60hlRiqNxFvLI4M+iK/Dr9fANUK9AMSdnRnJTYtjlrlZcKo1Bq1yGXxG2N/rzWpE8JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
X-Authority-Analysis: v=2.4 cv=L4EdQ/T8 c=1 sm=1 tr=0 ts=68687496 cx=c_pps a=U259+el5m5zn0mdk/7qTUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=M51BFTxLslgA:10 a=i1IsUcr2s-wA:10 a=2AEO0YjSAAAA:8 a=VwQbUJbxAAAA:8 a=DYa9-_WpzSahMzQztVoA:9 a=83a8osvCpJRvxTeB:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: qgzUN_2IcAyRJfM3jOxW3p-aTlv0yeDe
X-Proofpoint-ORIG-GUID: qgzUN_2IcAyRJfM3jOxW3p-aTlv0yeDe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAwMSBTYWx0ZWRfX16cFRSbE2ids zWqecP6gu5IfIHEjMeh21RmFMq9g2P4sT66lr+OkHOU8uJ0uzCGDqfmHPzymCeHTiP+auTtUMVK vum5t2yX8GsIbBLlyQIZdjZISv5n8C+28Pfr/Meo80LicM1kPvXrN6055jG0MzI5hzVSgvgVu5K
 3MiaZySUwN9vLTtSfS73LdGhZFxiOSFqmt0SS3CvMK4aKioG8tfsRcOjiIBVTzZpEz/HJAbmnsw wcs+jgmSktr1RCsZ43hM0oJdGg/uT86guTwHyWub1yt5nzaSqzmF0WZ7Xv32BO2LtZbJflXknZF oHO3tEKEPJ6Mv8QHf20qrBQLk4Ih21RhUGqLejHTBKhd0bESJBoWo+shwUXxjL58Rz/r4x2T62B
 sNw4ps0TRhuhs2jbbxiflYi4C6eeBZ8rb73ve61dDmX2U3PZawKf6JCIrt/A0wAjqznA57QL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507050001

This step adds the basic infrastructure in order to use CPC as backend
in Greybus. The goal of CPC is to add reliablity, by implementing error
detection and retransmission for links that don't have that capability
by default.

When Greybus establishes the connection between two CPorts, CPC will
create an endpoint for this connection. Greybus messages will then be
encapsulated in CPC frames, which basically are a custom header +
Greybus header + Greybus payload.

As this is still evolving and not the main point of the RFC, the whole
core is squashed in one big commit, but it will definitely be split into
more digestible commits as we refine it.

Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
---
 MAINTAINERS                    |   6 +
 drivers/greybus/Kconfig        |   2 +
 drivers/greybus/Makefile       |   2 +
 drivers/greybus/cpc/Kconfig    |  12 ++
 drivers/greybus/cpc/Makefile   |   6 +
 drivers/greybus/cpc/cpc.h      | 135 ++++++++++++++++
 drivers/greybus/cpc/endpoint.c | 158 +++++++++++++++++++
 drivers/greybus/cpc/header.c   | 212 +++++++++++++++++++++++++
 drivers/greybus/cpc/header.h   |  81 ++++++++++
 drivers/greybus/cpc/host.c     | 113 ++++++++++++++
 drivers/greybus/cpc/protocol.c | 274 +++++++++++++++++++++++++++++++++
 11 files changed, 1001 insertions(+)
 create mode 100644 drivers/greybus/cpc/Kconfig
 create mode 100644 drivers/greybus/cpc/Makefile
 create mode 100644 drivers/greybus/cpc/cpc.h
 create mode 100644 drivers/greybus/cpc/endpoint.c
 create mode 100644 drivers/greybus/cpc/header.c
 create mode 100644 drivers/greybus/cpc/header.h
 create mode 100644 drivers/greybus/cpc/host.c
 create mode 100644 drivers/greybus/cpc/protocol.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8256ec0ff8a..10385b5344b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10016,6 +10016,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
 F:	drivers/greybus/gb-beagleplay.c
 
+GREYBUS CPC DRIVERS
+M:	Damien Riégel <damien.riegel@silabs.com>
+R:	Silicon Labs Kernel Team <linux-devel@silabs.com>
+S:	Supported
+F:	drivers/greybus/cpc/*
+
 GREYBUS SUBSYSTEM
 M:	Johan Hovold <johan@kernel.org>
 M:	Alex Elder <elder@kernel.org>
diff --git a/drivers/greybus/Kconfig b/drivers/greybus/Kconfig
index c3f056d28b0..565a0fdcb2c 100644
--- a/drivers/greybus/Kconfig
+++ b/drivers/greybus/Kconfig
@@ -30,6 +30,8 @@ config GREYBUS_BEAGLEPLAY
 	  To compile this code as a module, chose M here: the module
 	  will be called gb-beagleplay.ko
 
+source "drivers/greybus/cpc/Kconfig"
+
 config GREYBUS_ES2
 	tristate "Greybus ES3 USB host controller"
 	depends on USB
diff --git a/drivers/greybus/Makefile b/drivers/greybus/Makefile
index c3564ad151f..4ebf8907405 100644
--- a/drivers/greybus/Makefile
+++ b/drivers/greybus/Makefile
@@ -21,6 +21,8 @@ ccflags-y += -I$(src)
 # Greybus Host controller drivers
 obj-$(CONFIG_GREYBUS_BEAGLEPLAY)	+= gb-beagleplay.o
 
+obj-$(CONFIG_GREYBUS_CPC)	+= cpc/
+
 gb-es2-y := es2.o
 
 obj-$(CONFIG_GREYBUS_ES2)	+= gb-es2.o
diff --git a/drivers/greybus/cpc/Kconfig b/drivers/greybus/cpc/Kconfig
new file mode 100644
index 00000000000..1512f9324f8
--- /dev/null
+++ b/drivers/greybus/cpc/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config GREYBUS_CPC
+	tristate "Greybus CPC driver"
+	depends on SPI
+	select CRC_ITU_T
+	help
+	  Select this option if you have a Silicon Labs EFR32 device that acts
+	  as a Greybus SVC.
+
+	  To compile this code as a module, chose M here: the module will be
+	  called gb-cpc.ko
diff --git a/drivers/greybus/cpc/Makefile b/drivers/greybus/cpc/Makefile
new file mode 100644
index 00000000000..08ef7c6d24b
--- /dev/null
+++ b/drivers/greybus/cpc/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+gb-cpc-y := endpoint.o header.o host.o main.o protocol.o
+
+# CPC core
+obj-$(CONFIG_GREYBUS_CPC)	+= gb-cpc.o
diff --git a/drivers/greybus/cpc/cpc.h b/drivers/greybus/cpc/cpc.h
new file mode 100644
index 00000000000..4aece6da9f7
--- /dev/null
+++ b/drivers/greybus/cpc/cpc.h
@@ -0,0 +1,135 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025, Silicon Laboratories, Inc.
+ */
+
+#ifndef __CPC_H
+#define __CPC_H
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+#include "header.h"
+
+#define GB_CPC_SPI_NUM_CPORTS			8
+
+struct cpc_endpoint;
+struct cpc_endpoint_tcb;
+struct cpc_frame;
+struct cpc_host_device;
+
+/**
+ * struct cpc_host_device - CPC host device
+ * @gb_hd: pointer to Greybus Host Device
+ * @lock: mutex to synchronize access to endpoint array
+ * @tx_queue: list of cpc_frame to send
+ * @endpoints: array of endpoint pointers
+ * @wake_tx: function called when a new packet must be transmitted
+ */
+struct cpc_host_device {
+	struct gb_host_device	*gb_hd;
+
+	struct mutex		lock;
+	struct list_head	tx_queue;
+
+	struct cpc_endpoint	*endpoints[GB_CPC_SPI_NUM_CPORTS];
+
+	int (*wake_tx)(struct cpc_host_device *cpc_hd);
+};
+
+struct cpc_endpoint *cpc_hd_get_endpoint(struct cpc_host_device *cpc_hd, u16 cport_id);
+void cpc_hd_send_frame(struct cpc_host_device *cpc_hd, struct cpc_frame *frame);
+void cpc_hd_rcvd(struct cpc_host_device *cpc_hd, struct cpc_header *hdr,
+		 u8 *data, size_t length);
+struct cpc_frame *cpc_hd_dequeue(struct cpc_host_device *cpc_hd);
+bool cpc_hd_tx_queue_empty(struct cpc_host_device *cpc_hd);
+
+/**
+ * struct cpc_endpoint_tcb - endpoint's transmission control block
+ * @send_wnd: send window, maximum number of frames that the remote can accept
+ *            TX frames should have a sequence in the range
+ *            [send_una; send_una + send_wnd].
+ * @send_nxt: send next, the next sequence number that will be used for transmission
+ * @send_una: send unacknowledged, the oldest unacknowledged sequence number
+ * @ack: current acknowledge number
+ * @seq: current sequence number
+ * @mtu: maximum transmission unit
+ */
+struct cpc_endpoint_tcb {
+	u8 send_wnd;
+	u8 send_nxt;
+	u8 send_una;
+	u8 ack;
+	u8 seq;
+	u16 mtu;
+};
+
+/**
+ * struct cpc_endpint - CPC endpoint
+ * @id: endpoint ID
+ * @cpc_hd: pointer to the CPC host device this endpoint belongs to
+ * @lock: synchronize access to other attributes
+ * @completion: (dis)connection completion
+ * @tcb: transmission control block
+ * @holding_queue: list of CPC frames queued to be sent
+ * @pending_ack_queue: list of CPC frames sent and waiting for acknowledgment
+ */
+struct cpc_endpoint {
+	u16			id;
+
+	struct cpc_host_device	*cpc_hd;
+
+	struct mutex		lock;		/* Synchronize access to all other attributes. */
+	struct completion	completion;
+	struct cpc_endpoint_tcb	tcb;
+	struct list_head	holding_queue;
+	struct list_head	pending_ack_queue;
+};
+
+struct cpc_endpoint *cpc_endpoint_alloc(u16 ep_id, gfp_t gfp_mask);
+void cpc_endpoint_release(struct cpc_endpoint *ep);
+int cpc_endpoint_frame_send(struct cpc_endpoint *ep, struct cpc_frame *frame);
+int cpc_endpoint_connect(struct cpc_endpoint *ep);
+int cpc_endpoint_disconnect(struct cpc_endpoint *ep);
+
+/**
+ * struct cpc_frame - CPC frame
+ * @header: CPC header
+ * @message: Greybus message to transmit
+ * @cancelled: indicate if Greybus message is cancelled and should not be sent
+ * @ep: endpoint this frame is sent over
+ * @links: list head in endpoint's queue
+ * @txq_links: list head in cpc host device's queue
+ */
+struct cpc_frame {
+	struct cpc_header	header;
+	struct gb_message	*message;
+
+	bool			cancelled;
+
+	struct cpc_endpoint	*ep;
+
+	struct list_head	links;		/* endpoint->holding_queue or
+						 * endpoint->pending_ack_queue.
+						 */
+	struct list_head	txq_links;	/* cpc_host_device->tx_queue. */
+
+};
+
+struct cpc_frame *cpc_frame_alloc(struct gb_message *message, gfp_t gfp_mask);
+void cpc_frame_free(struct cpc_frame *frame);
+void cpc_frame_sent(struct cpc_frame *frame, int status);
+
+int __cpc_protocol_write(struct cpc_endpoint *ep, struct cpc_frame *frame);
+
+void cpc_protocol_on_data(struct cpc_endpoint *ep, struct cpc_header *hdr, u8 *data, size_t length);
+void cpc_protocol_on_syn(struct cpc_endpoint *ep, struct cpc_header *hdr);
+void cpc_protocol_on_rst(struct cpc_endpoint *ep);
+
+void cpc_protocol_send_rst(struct cpc_host_device *cpc_hd, u8 ep_id);
+int cpc_protocol_send_syn(struct cpc_endpoint *ep);
+
+int cpc_spi_register_driver(void);
+void cpc_spi_unregister_driver(void);
+
+#endif
diff --git a/drivers/greybus/cpc/endpoint.c b/drivers/greybus/cpc/endpoint.c
new file mode 100644
index 00000000000..12710edebcf
--- /dev/null
+++ b/drivers/greybus/cpc/endpoint.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Silicon Laboratories, Inc.
+ */
+
+#include <linux/greybus.h>
+
+#include "cpc.h"
+
+/**
+ * cpc_endpoint_write - Write a DATA frame.
+ * @ep: Endpoint handle.
+ * @frame: Frame to send.
+ *
+ * @return: 0 on success, otherwise a negative error code.
+ */
+int cpc_endpoint_frame_send(struct cpc_endpoint *ep, struct cpc_frame *frame)
+{
+	struct cpc_header *hdr = &frame->header;
+	size_t cpc_payload_sz = 0;
+	int err;
+
+	if (frame->message) {
+		cpc_payload_sz += sizeof(struct gb_operation_msg_hdr);
+		cpc_payload_sz += frame->message->payload_size;
+	}
+
+	mutex_lock(&ep->lock);
+
+	if (cpc_payload_sz > ep->tcb.mtu) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	memset(hdr, 0, sizeof(*hdr));
+	hdr->ctrl = cpc_header_get_ctrl(CPC_FRAME_TYPE_DATA, true);
+	hdr->ep_id = ep->id;
+	hdr->recv_wnd = CPC_HEADER_MAX_RX_WINDOW;
+	hdr->seq = ep->tcb.seq;
+	hdr->dat.payload_len = cpc_payload_sz;
+
+	frame->ep = ep;
+
+	err = __cpc_protocol_write(ep, frame);
+
+out:
+	mutex_unlock(&ep->lock);
+
+	return err;
+}
+
+void cpc_frame_sent(struct cpc_frame *frame, int status)
+{
+	struct cpc_endpoint *ep = frame->ep;
+	struct gb_host_device *gb_hd = ep->cpc_hd->gb_hd;
+
+	/* There is no Greybus payload, this frame is purely CPC */
+	if (!frame->message)
+		return;
+
+	/*
+	 * Increase the send_nxt sequence, this is used as the upper bound of sequence number that
+	 * can be ACK'd by the remote. Only increase if sent successfully.
+	 */
+	if (!status) {
+		mutex_lock(&ep->lock);
+		ep->tcb.send_nxt++;
+		mutex_unlock(&ep->lock);
+	}
+
+	if (!frame->cancelled)
+		greybus_message_sent(gb_hd, frame->message, status);
+
+	kfree(frame);
+}
+
+/**
+ * cpc_endpoint_tcb_reset() - Reset endpoint's TCB to initial values.
+ * @ep: endpoint pointer
+ */
+static void cpc_endpoint_tcb_reset(struct cpc_endpoint *ep)
+{
+	ep->tcb.seq = ep->id;
+	ep->tcb.ack = 0;
+	ep->tcb.mtu = 0;
+	ep->tcb.send_nxt = ep->id;
+	ep->tcb.send_una = ep->id;
+	ep->tcb.send_wnd = 1;
+}
+
+/**
+ * cpc_endpoint_alloc() - Allocate and initialize CPC endpoint.
+ * @ep_id: Endpoint ID.
+ * @gfp_mask: GFP mask for allocation.
+ *
+ * Return: Pointer to allocated and initialized cpc_endpoint, or NULL on failure.
+ */
+struct cpc_endpoint *cpc_endpoint_alloc(u16 ep_id, gfp_t gfp_mask)
+{
+	struct cpc_endpoint *ep;
+
+	ep = kzalloc(sizeof(*ep), gfp_mask);
+	if (!ep)
+		return NULL;
+
+	ep->id = ep_id;
+	INIT_LIST_HEAD(&ep->holding_queue);
+	INIT_LIST_HEAD(&ep->pending_ack_queue);
+
+	mutex_init(&ep->lock);
+	cpc_endpoint_tcb_reset(ep);
+	init_completion(&ep->completion);
+
+	return ep;
+}
+
+void cpc_endpoint_release(struct cpc_endpoint *ep)
+{
+	kfree(ep);
+}
+
+int cpc_endpoint_connect(struct cpc_endpoint *ep)
+{
+	int ret;
+
+	ret = cpc_protocol_send_syn(ep);
+	if (ret)
+		return ret;
+
+	return wait_for_completion_interruptible(&ep->completion);
+}
+
+int cpc_endpoint_disconnect(struct cpc_endpoint *ep)
+{
+	cpc_protocol_send_rst(ep->cpc_hd, ep->id);
+
+	return 0;
+}
+
+struct cpc_frame *cpc_frame_alloc(struct gb_message *message, gfp_t gfp_mask)
+{
+	struct cpc_frame *frame;
+
+	frame = kzalloc(sizeof(*frame), gfp_mask);
+	if (!frame)
+		return NULL;
+
+	frame->message = message;
+	INIT_LIST_HEAD(&frame->links);
+	INIT_LIST_HEAD(&frame->txq_links);
+
+	return frame;
+}
+
+void cpc_frame_free(struct cpc_frame *frame)
+{
+	kfree(frame);
+}
diff --git a/drivers/greybus/cpc/header.c b/drivers/greybus/cpc/header.c
new file mode 100644
index 00000000000..4faa604b13a
--- /dev/null
+++ b/drivers/greybus/cpc/header.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Silicon Laboratories, Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/string.h>
+
+#include "header.h"
+
+#define CPC_CONTROL_TYPE_MASK 0xC0
+#define CPC_CONTROL_ACK_MASK BIT(2)
+
+/**
+ * cpc_header_get_type() - Get the frame type.
+ * @hdr: CPC header.
+ * @type: Reference to a frame type.
+ *
+ * Return: True if the type has been successfully decoded, otherwise false.
+ *         On success, the output parameter type is assigned.
+ */
+bool cpc_header_get_type(const struct cpc_header *hdr, enum cpc_frame_type *type)
+{
+	switch (FIELD_GET(CPC_CONTROL_TYPE_MASK, hdr->ctrl)) {
+	case CPC_FRAME_TYPE_DATA:
+		*type = CPC_FRAME_TYPE_DATA;
+		break;
+	case CPC_FRAME_TYPE_SYN:
+		*type = CPC_FRAME_TYPE_SYN;
+		break;
+	case CPC_FRAME_TYPE_RST:
+		*type = CPC_FRAME_TYPE_RST;
+		break;
+	default:
+		return false;
+	}
+
+	return true;
+}
+
+/**
+ * cpc_header_get_ep_id() - Get the endpoint id.
+ * @hdr: CPC header.
+ *
+ * Return: Endpoint id.
+ */
+u8 cpc_header_get_ep_id(const struct cpc_header *hdr)
+{
+	return hdr->ep_id;
+}
+
+/**
+ * cpc_header_get_recv_wnd() - Get the receive window.
+ * @hdr: CPC header.
+ *
+ * Return: Receive window.
+ */
+u8 cpc_header_get_recv_wnd(const struct cpc_header *hdr)
+{
+	return hdr->recv_wnd;
+}
+
+/**
+ * cpc_header_get_seq() - Get the sequence number.
+ * @hdr: CPC header.
+ *
+ * Return: Sequence number.
+ */
+u8 cpc_header_get_seq(const struct cpc_header *hdr)
+{
+	return hdr->seq;
+}
+
+/**
+ * cpc_header_get_ack() - Get the acknowledge number.
+ * @hdr: CPC header.
+ *
+ * Return: Acknowledge number.
+ */
+u8 cpc_header_get_ack(const struct cpc_header *hdr)
+{
+	return hdr->ack;
+}
+
+/**
+ * cpc_header_get_req_ack() - Get the request acknowledge frame flag.
+ * @hdr: CPC header.
+ *
+ * Return: Request acknowledge frame flag.
+ */
+bool cpc_header_get_req_ack(const struct cpc_header *hdr)
+{
+	return FIELD_GET(CPC_CONTROL_ACK_MASK, hdr->ctrl);
+}
+
+/**
+ * cpc_header_get_mtu() - Get the maximum transmission unit.
+ * @hdr: CPC header.
+ *
+ * Return: Maximum transmission unit.
+ *
+ * Must only be used over a SYN frame.
+ */
+u16 cpc_header_get_mtu(const struct cpc_header *hdr)
+{
+	return le16_to_cpu(hdr->syn.mtu);
+}
+
+/**
+ * cpc_header_get_payload_len() - Get the payload length.
+ * @hdr: CPC header.
+ *
+ * Return: Payload length.
+ *
+ * Must only be used over a DATA frame.
+ */
+u16 cpc_header_get_payload_len(const struct cpc_header *hdr)
+{
+	return le16_to_cpu(hdr->dat.payload_len);
+}
+
+/**
+ * cpc_header_get_ctrl() - Encode parameters into a control byte.
+ * @type: Frame type.
+ * @req_ack: Frame flag indicating a request to be acknowledged.
+ *
+ * Return: Encoded control byte.
+ */
+u8 cpc_header_get_ctrl(enum cpc_frame_type type, bool req_ack)
+{
+	return FIELD_PREP(CPC_CONTROL_TYPE_MASK, type) |
+	       FIELD_PREP(CPC_CONTROL_ACK_MASK, req_ack);
+}
+
+/**
+ * cpc_header_get_frames_acked_count() - Get frames to be acknowledged.
+ * @seq: Current sequence number of the endpoint.
+ * @ack: Acknowledge number of the received frame.
+ *
+ * Return: Frames to be acknowledged.
+ */
+u8 cpc_header_get_frames_acked_count(u8 seq, u8 ack)
+{
+	u8 frames_acked_count;
+
+	/* Find number of frames acknowledged with ACK number. */
+	if (ack > seq) {
+		frames_acked_count = ack - seq;
+	} else {
+		frames_acked_count = 256 - seq;
+		frames_acked_count += ack;
+	}
+
+	return frames_acked_count;
+}
+
+/**
+ * cpc_header_is_syn_ack_valid() - Check if the provided SYN-ACK valid or not.
+ * @seq: Current sequence number of the endpoint.
+ * @ack: Acknowledge number of the received SYN.
+ *
+ * Return: True if valid, otherwise false.
+ */
+bool cpc_header_is_syn_ack_valid(u8 seq, u8 ack)
+{
+	return !!cpc_header_get_frames_acked_count(seq, ack);
+}
+
+/**
+ * cpc_header_number_in_window() - Test if a number is within a window.
+ * @start: Start of the window.
+ * @end: Window size.
+ * @n: Number to be tested.
+ *
+ * Given the start of the window and its size, test if the number is
+ * in the range [start; start + wnd).
+ *
+ * @return True if start <= n <= start + wnd - 1 (modulo 256), otherwise false.
+ */
+bool cpc_header_number_in_window(u8 start, u8 wnd, u8 n)
+{
+	u8 end;
+
+	if (wnd == 0)
+		return false;
+
+	end = start + wnd - 1;
+
+	return cpc_header_number_in_range(start, end, n);
+}
+
+/**
+ * cpc_header_number_in_range() - Test if a number is between start and end (included).
+ * @start: Lowest limit.
+ * @end: Highest limit inclusively.
+ * @n: Number to be tested.
+ *
+ * @return True if start <= n <= end (modulo 256), otherwise false.
+ */
+bool cpc_header_number_in_range(u8 start, u8 end, u8 n)
+{
+	if (end >= start) {
+		if (n < start || n > end)
+			return false;
+	} else {
+		if (n > end && n < start)
+			return false;
+	}
+
+	return true;
+}
diff --git a/drivers/greybus/cpc/header.h b/drivers/greybus/cpc/header.h
new file mode 100644
index 00000000000..5d574fef422
--- /dev/null
+++ b/drivers/greybus/cpc/header.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025, Silicon Laboratories, Inc.
+ */
+
+#ifndef __CPC_HEADER_H
+#define __CPC_HEADER_H
+
+#include <linux/compiler_attributes.h>
+#include <linux/types.h>
+
+#define CPC_HEADER_MAX_RX_WINDOW	U8_MAX
+#define CPC_HEADER_SIZE			8
+
+/**
+ * enum cpc_frame_type - Describes all possible frame types that can
+ * be received or sent.
+ * @CPC_FRAME_TYPE_DATA: Used to send and control application DATA frames.
+ * @CPC_FRAME_TYPE_SYN: Used to initiate an endpoint connection.
+ * @CPC_FRAME_TYPE_RST: Used to reset the endpoint connection and indicate
+ *                      that the endpoint is unavailable.
+ */
+enum cpc_frame_type {
+	CPC_FRAME_TYPE_DATA,
+	CPC_FRAME_TYPE_SYN,
+	CPC_FRAME_TYPE_RST,
+};
+
+/**
+ * struct cpc_header - Representation of the CPC header.
+ * @ep_id: Address of the endpoint the frame is destined to.
+ * @ctrl: Indicates the frame type [7..6] and frame flags [5..0].
+ *        Currently only the request acknowledge flag is supported.
+ *        This flag indicates if the frame should be acknowledged by
+ *        the remote on reception.
+ * @recv_wnd: Indicates to the remote how many reception buffers are
+ *            available so it can determine how many frames it can send.
+ * @seq: Identifies the frame with a number.
+ * @ack: Indicate the sequence number of the next expected frame from
+ *       the remote. When paired with a fast re-transmit flag, it indicates
+ *       the sequence number of the frame in error that should be
+ *       re-transmitted.
+ * @syn.mtu: On a SYN frame, this represents the maximum transmission unit.
+ * @dat.payload_len: On a DATA frame, this indicates the payload length.
+ */
+struct cpc_header {
+	u16 ep_id;
+	u8 ctrl;
+	u8 recv_wnd;
+	u8 seq;
+	u8 ack;
+	union {
+		u8 extension[2];
+		struct __packed {
+			__le16 mtu;
+		} syn;
+		struct __packed {
+			__le16 payload_len;
+		} dat;
+		struct __packed {
+			u8 reserved[2];
+		} rst;
+	};
+} __packed;
+
+bool cpc_header_get_type(const struct cpc_header *hdr, enum cpc_frame_type *type);
+u8 cpc_header_get_ep_id(const struct cpc_header *hdr);
+u8 cpc_header_get_recv_wnd(const struct cpc_header *hdr);
+u8 cpc_header_get_seq(const struct cpc_header *hdr);
+u8 cpc_header_get_ack(const struct cpc_header *hdr);
+bool cpc_header_get_req_ack(const struct cpc_header *hdr);
+u16 cpc_header_get_mtu(const struct cpc_header *hdr);
+u16 cpc_header_get_payload_len(const struct cpc_header *hdr);
+u8 cpc_header_get_ctrl(enum cpc_frame_type type, bool req_ack);
+
+u8 cpc_header_get_frames_acked_count(u8 seq, u8 ack);
+bool cpc_header_is_syn_ack_valid(u8 seq, u8 ack);
+bool cpc_header_number_in_window(u8 start, u8 wnd, u8 n);
+bool cpc_header_number_in_range(u8 start, u8 end, u8 n);
+
+#endif
diff --git a/drivers/greybus/cpc/host.c b/drivers/greybus/cpc/host.c
new file mode 100644
index 00000000000..0805552d5ec
--- /dev/null
+++ b/drivers/greybus/cpc/host.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Silicon Laboratories, Inc.
+ */
+
+#include <linux/greybus.h>
+#include <linux/list.h>
+#include <linux/module.h>
+
+#include "cpc.h"
+#include "header.h"
+
+struct cpc_endpoint *cpc_hd_get_endpoint(struct cpc_host_device *cpc_hd, u16 cport_id)
+{
+	struct cpc_endpoint *ep;
+
+	for (int i = 0; i < ARRAY_SIZE(cpc_hd->endpoints); i++) {
+		ep = cpc_hd->endpoints[i];
+		if (ep && ep->id == cport_id)
+			return ep;
+	}
+
+	return NULL;
+}
+
+void cpc_hd_rcvd(struct cpc_host_device *cpc_hd, struct cpc_header *hdr,
+		 u8 *data, size_t length)
+{
+	enum cpc_frame_type type;
+	struct cpc_endpoint *ep;
+	u8 ep_id;
+
+	cpc_header_get_type(hdr, &type);
+	ep_id = cpc_header_get_ep_id(hdr);
+
+	ep = cpc_hd_get_endpoint(cpc_hd, ep_id);
+	if (!ep) {
+		if (type != CPC_FRAME_TYPE_RST) {
+			dev_dbg(&cpc_hd->gb_hd->dev, "ep%u not allocated (%d)\n", ep_id, type);
+			cpc_protocol_send_rst(cpc_hd, ep_id);
+		}
+		return;
+	}
+
+	switch (type) {
+	case CPC_FRAME_TYPE_DATA:
+		cpc_protocol_on_data(ep, hdr, data, length);
+		break;
+	case CPC_FRAME_TYPE_SYN:
+		cpc_protocol_on_syn(ep, hdr);
+		break;
+	case CPC_FRAME_TYPE_RST:
+		dev_dbg(&cpc_hd->gb_hd->dev, "reset\n");
+		cpc_protocol_on_rst(ep);
+		break;
+	}
+}
+
+
+/**
+ * cpc_interface_send_frame() - Queue a socket buffer for transmission.
+ * @intf: Interface to send SKB over.
+ * @ops: SKB to send.
+ *
+ * Queue SKB in interface's transmit queue and signal the interface. Interface is expected to use
+ * cpc_interface_dequeue() to get the next SKB to transmit.
+ */
+void cpc_hd_send_frame(struct cpc_host_device *cpc_hd, struct cpc_frame *frame)
+{
+	mutex_lock(&cpc_hd->lock);
+	list_add_tail(&frame->txq_links, &cpc_hd->tx_queue);
+	mutex_unlock(&cpc_hd->lock);
+
+	cpc_hd->wake_tx(cpc_hd);
+}
+
+/**
+ * cpc_interface_dequeue() - Get the next SKB that was queued for transmission.
+ * @intf: Interface.
+ *
+ * Get an SKB that was previously queued by cpc_interface_send_frame().
+ *
+ * Return: An SKB, or %NULL if queue was empty.
+ */
+struct cpc_frame *cpc_hd_dequeue(struct cpc_host_device *cpc_hd)
+{
+	struct cpc_frame *f;
+
+	mutex_lock(&cpc_hd->lock);
+	f = list_first_entry_or_null(&cpc_hd->tx_queue, struct cpc_frame, txq_links);
+	if (f)
+		list_del(&f->txq_links);
+	mutex_unlock(&cpc_hd->lock);
+
+	return f;
+}
+
+/**
+ * cpc_interface_tx_queue_empty() - Check if transmit queue is empty.
+ * @intf: Interface.
+ *
+ * Return: True if transmit queue is empty, false otherwise.
+ */
+bool cpc_hd_tx_queue_empty(struct cpc_host_device *cpc_hd)
+{
+	bool empty;
+
+	mutex_lock(&cpc_hd->lock);
+	empty = list_empty(&cpc_hd->tx_queue);
+	mutex_unlock(&cpc_hd->lock);
+
+	return empty;
+}
diff --git a/drivers/greybus/cpc/protocol.c b/drivers/greybus/cpc/protocol.c
new file mode 100644
index 00000000000..610e4b96edd
--- /dev/null
+++ b/drivers/greybus/cpc/protocol.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Silicon Laboratories, Inc.
+ */
+
+#include <linux/greybus.h>
+#include <linux/mutex.h>
+#include <linux/skbuff.h>
+
+#include "cpc.h"
+#include "header.h"
+
+int cpc_protocol_send_syn(struct cpc_endpoint *ep)
+{
+	struct cpc_frame *frame;
+	struct cpc_header *hdr;
+
+	frame = cpc_frame_alloc(NULL, GFP_KERNEL);
+	if (!frame)
+		return -ENOMEM;
+
+	hdr = &frame->header;
+	memset(hdr, 0, sizeof(*hdr));
+
+	mutex_lock(&ep->lock);
+
+	hdr->ctrl = cpc_header_get_ctrl(CPC_FRAME_TYPE_SYN, true);
+	hdr->ep_id = ep->id;
+	hdr->recv_wnd = CPC_HEADER_MAX_RX_WINDOW;
+	hdr->seq = ep->tcb.seq;
+	hdr->syn.mtu = cpu_to_le16(U16_MAX);
+
+	cpc_hd_send_frame(ep->cpc_hd, frame);
+
+	mutex_unlock(&ep->lock);
+
+	return 0;
+}
+
+static void __cpc_protocol_send_ack(struct cpc_endpoint *ep)
+{
+	struct cpc_frame *frame;
+	struct cpc_header *hdr;
+
+	frame = cpc_frame_alloc(NULL, GFP_KERNEL);
+	if (!frame)
+		return;
+
+	hdr = &frame->header;
+
+	memset(hdr, 0, sizeof(*hdr));
+	hdr->ctrl = cpc_header_get_ctrl(CPC_FRAME_TYPE_DATA, false);
+	hdr->ep_id = ep->id;
+	hdr->recv_wnd = CPC_HEADER_MAX_RX_WINDOW;
+	hdr->ack = ep->tcb.ack;
+
+	cpc_hd_send_frame(ep->cpc_hd, frame);
+}
+
+/**
+ * cpc_protocol_send_rst - send a RST frame
+ * @cpc_hd: host device pointer
+ * @ep_id: endpoint id
+ */
+void cpc_protocol_send_rst(struct cpc_host_device *cpc_hd, u8 ep_id)
+{
+	struct cpc_frame *frame;
+	struct cpc_header *hdr;
+
+	frame = cpc_frame_alloc(NULL, GFP_KERNEL);
+	if (!frame)
+		return;
+
+	hdr = &frame->header;
+	memset(hdr, 0, sizeof(*hdr));
+	hdr->ctrl = cpc_header_get_ctrl(CPC_FRAME_TYPE_RST, false);
+	hdr->ep_id = ep_id;
+
+	cpc_hd_send_frame(cpc_hd, frame);
+}
+
+static int __cpc_protocol_queue_tx_frame(struct cpc_endpoint *ep, struct cpc_frame *frame)
+{
+	frame->header.ack = ep->tcb.ack;
+
+	list_add_tail(&frame->links, &ep->pending_ack_queue);
+
+	cpc_hd_send_frame(ep->cpc_hd, frame);
+
+	return 0;
+}
+
+static void __cpc_protocol_process_pending_tx_frames(struct cpc_endpoint *ep)
+{
+	struct cpc_frame *frame;
+	u8 window;
+	int err;
+
+	window = ep->tcb.send_wnd;
+
+	while ((frame = list_first_entry_or_null(&ep->holding_queue,
+						 struct cpc_frame,
+						 links))) {
+		if (!cpc_header_number_in_window(ep->tcb.send_una,
+						 window,
+						 cpc_header_get_seq(&frame->header)))
+			return;
+
+		list_del(&frame->links);
+
+		err = __cpc_protocol_queue_tx_frame(ep, frame);
+		if (err < 0) {
+			list_add(&frame->links, &ep->holding_queue);
+			return;
+		}
+	}
+}
+
+static void __cpc_protocol_receive_ack(struct cpc_endpoint *ep, u8 recv_wnd, u8 ack)
+{
+	struct cpc_frame *frame;
+	u8 acked_frames;
+
+	ep->tcb.send_wnd = recv_wnd;
+
+	frame = list_first_entry_or_null(&ep->pending_ack_queue, struct cpc_frame, links);
+	if (!frame)
+		goto out;
+
+	/* Return if no frame to ACK. */
+	if (!cpc_header_number_in_range(ep->tcb.send_una, ep->tcb.send_nxt, ack))
+		goto out;
+
+	/* Calculate how many frames will be ACK'd. */
+	acked_frames = cpc_header_get_frames_acked_count(cpc_header_get_seq(&frame->header), ack);
+
+	for (u8 i = 0; i < acked_frames; i++) {
+		frame = list_first_entry_or_null(&ep->pending_ack_queue, struct cpc_frame, links);
+		if (!frame) {
+			dev_err_ratelimited(&ep->cpc_hd->gb_hd->dev, "pending ack queue shorter than expected");
+			break;
+		}
+
+		list_del(&frame->links);
+		cpc_frame_free(frame);
+	}
+
+	ep->tcb.send_una += acked_frames;
+
+out:
+	__cpc_protocol_process_pending_tx_frames(ep);
+}
+
+static bool __cpc_protocol_is_syn_ack_valid(struct cpc_endpoint *ep, struct cpc_header *hdr)
+{
+	struct cpc_frame *syn_frame;
+	enum cpc_frame_type type;
+	u8 syn_seq;
+	u8 ack;
+
+	/* Fetch the previously sent frame. */
+	syn_frame = list_first_entry_or_null(&ep->pending_ack_queue, struct cpc_frame, links);
+	if (!syn_frame) {
+		dev_warn(&ep->cpc_hd->gb_hd->dev, "cannot validate syn-ack, no frame was sent\n");
+		return false;
+	}
+
+	cpc_header_get_type(&syn_frame->header, &type);
+
+	/* Verify if this frame is SYN. */
+	if (type != CPC_FRAME_TYPE_SYN) {
+		dev_warn(&ep->cpc_hd->gb_hd->dev,
+			 "cannot validate syn-ack, no syn frame was sent (%d)\n", type);
+		return false;
+	}
+
+	syn_seq = cpc_header_get_seq(&syn_frame->header);
+	ack = cpc_header_get_ack(hdr);
+
+	/* Validate received ACK with the SEQ used in the initial SYN. */
+	if (!cpc_header_is_syn_ack_valid(syn_seq, ack)) {
+		dev_warn(&ep->cpc_hd->gb_hd->dev,
+			 "syn-ack (%d) is not valid with previously sent syn-seq (%d)\n",
+			 ack, syn_seq);
+		return false;
+	}
+
+	return true;
+}
+
+void cpc_protocol_on_data(struct cpc_endpoint *ep, struct cpc_header *hdr,
+			  u8 *data, size_t length)
+{
+	bool expected_seq;
+
+	mutex_lock(&ep->lock);
+
+	__cpc_protocol_receive_ack(ep,
+				   cpc_header_get_recv_wnd(hdr),
+				   cpc_header_get_ack(hdr));
+
+	if (cpc_header_get_req_ack(hdr)) {
+		expected_seq = cpc_header_get_seq(hdr) == ep->tcb.ack;
+		if (expected_seq)
+			ep->tcb.ack++;
+
+		__cpc_protocol_send_ack(ep);
+
+		if (!expected_seq)
+			dev_warn(&ep->cpc_hd->gb_hd->dev,
+				 "unexpected seq: %u, expected seq: %u\n",
+				 cpc_header_get_seq(hdr), ep->tcb.ack);
+	}
+
+	mutex_unlock(&ep->lock);
+
+	if (data) {
+		if (expected_seq)
+			greybus_data_rcvd(ep->cpc_hd->gb_hd, ep->id, data, length);
+		else
+			kfree(data);
+	}
+}
+
+void cpc_protocol_on_syn(struct cpc_endpoint *ep, struct cpc_header *hdr)
+{
+	mutex_lock(&ep->lock);
+
+	if (!__cpc_protocol_is_syn_ack_valid(ep, hdr)) {
+		cpc_protocol_send_rst(ep->cpc_hd, ep->id);
+		goto out;
+	}
+
+	__cpc_protocol_receive_ack(ep,
+				   cpc_header_get_recv_wnd(hdr),
+				   cpc_header_get_ack(hdr));
+
+	/* On SYN-ACK, the remote's SEQ becomes our starting ACK. */
+	ep->tcb.ack = cpc_header_get_seq(hdr);
+	ep->tcb.mtu = cpc_header_get_mtu(hdr);
+	ep->tcb.ack++;
+
+	__cpc_protocol_send_ack(ep);
+
+	complete(&ep->completion);
+
+out:
+	mutex_unlock(&ep->lock);
+}
+
+void cpc_protocol_on_rst(struct cpc_endpoint *ep)
+{
+	// To be implemented when connection mechanism are restored
+}
+
+/**
+ * __cpc_protocol_write() - Write a frame.
+ * @ep: Endpoint handle.
+ * @frame: Frame to write.
+ *
+ * Context: Expect endpoint's lock to be held.
+ *
+ * Return: 0 on success, otherwise a negative error code.
+ */
+int __cpc_protocol_write(struct cpc_endpoint *ep, struct cpc_frame *frame)
+{
+	list_add_tail(&frame->links, &ep->holding_queue);
+
+	__cpc_protocol_process_pending_tx_frames(ep);
+
+	ep->tcb.seq++;
+
+	return 0;
+}
-- 
2.49.0


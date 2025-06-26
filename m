Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CFF1F8AC8
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750935737; cv=fail; b=gOfTz7SZ4j6u81KmvQm4p8Fkt9j40Ax2+oT0sY6XPgWbIaPHMD2lqLm8U+iSyNcxcEG9zSK1ymluZ+4WQokXh4OvBRdE5/I2Dg86FcvqyTh401vOjGsoaadl0/BsQSfNQyjkO6Xf/V7uSDAj7gAAYcU94XCldps40mZ2wQNKW4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750935737; c=relaxed/simple;
	bh=dxGD4tVYJKqLNZK7Ot3uUkxBoUUP4eQXt6UuoDic9D0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TmB92Xzlxz9wKTfmRqPw2o9DmOwcguMCtbX8OKZkMbFRjIwEeGmtYdNpJqFMHU23xhWZDV36yiiDktYHxuycvgKtFi8BIqArhmYIz5W+iYWPKnvID2fMYjCVjO7X4nqBZfmnh16DE6oEaL9d1coQCimcnR3M1nsMkWcyMUe5Qe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=Oyy6mMWq; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="Oyy6mMWq"
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9Noxh026162;
	Thu, 26 Jun 2025 04:01:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2021-q4;
	 bh=dwTjTfM1Pc+/+mJprfVENhs6vi5mmEPD+z025irM59s=; b=Oyy6mMWqt0Qy
	eTmO1Vw9u1Q1NyrivyAK/m+XPghfkUdPvncrW79BQg2mQJlxLxAZPHOZ3T3gGhbB
	/6TVTS5Y8cpAMocO0lMHpVIXG8WmgPkEuMjrq2gsjBGRe69z1/QCod6l5GYbswtr
	RlT7tPt7fTEVYWV/pwI+ph73uDYx3qwXX+7HEYUlYOX7Tbi6BaPbEZlPAScLvRZr
	7VZ/3NNj67ejD5rHoBSN/2jxFG0tvNQE+8dtX1/zW6BMInhllsV00zVeD2onwQRn
	a/NvV6/ZFke//xit5XOTKpbKqFRYsXLLDN+nVs54hjtaxy7dywaiK9lf2x7BKjZy
	zY3DvHvdsw==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 47h17ms6r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 04:01:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezfu6J3CLDUEf0mZVaxy4ql81XTKobIytdLDGzkh8fP/gF9laaHlcnNR8NMssrMkUwhEz1ja97xga+XCZYm3pveuwve74o96BmBMYD5Q72QBDi6xjipTQgI/cLJYWZrJwdAWBxuxCStC+Sr99G5w4qxdghG2jzPZ802wiS1ol9wNsZX0W3p8mgiOQhWQ5tKfpVm4x3MvEHfLYlS+gHdGOn7wbuAuoQj7bsY5eTLaGQvbEFVysd59DqYcXy1zV4PYkT/OBYbaR1Ae8DpCS05/YmHsuAq0PMYWdBoXMLrDLdr/HdMetNN+0ZVwXeMkt0ThD/RfkuCsX6sC3ZamynYWlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwTjTfM1Pc+/+mJprfVENhs6vi5mmEPD+z025irM59s=;
 b=JBgRtEUJNpPHwDzDU37IEylTSEShc8ZEf3b/nchmpqLogUr07TXm77HAq7vNYOMcLiDpdVHCZqsoyWGqJSF09q35mf6iOTNgjGpgxb3zzifivhBIS6RoteuZFp8/tPBUj4Y7Y127f2Z1NDmexYw0hixXSsAlm1TpSCKnL6funzZvU8GnDXCr61geDon7Mvsp27uZ7fTaMuGlvs18XtIc/HUFfPUW+2VFTZo3gyLlL8rMym6HSfAD50gyWnyQ2ml1CjlkdlnWq/JLbelB3aP55m5fqA4YoC24yUVggEFgIGe1XUgh1kUwMIiqdJQTl2Kix7RkEDTBuwibIEMAVlSZBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from PH7PR15MB6463.namprd15.prod.outlook.com (2603:10b6:510:304::9)
 by DS0PR15MB5573.namprd15.prod.outlook.com (2603:10b6:8:13d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 11:01:52 +0000
Received: from PH7PR15MB6463.namprd15.prod.outlook.com
 ([fe80::15b4:afb0:f4e9:5bc9]) by PH7PR15MB6463.namprd15.prod.outlook.com
 ([fe80::15b4:afb0:f4e9:5bc9%3]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 11:01:52 +0000
Message-ID: <71ea52f2-f6bf-4a55-84ba-d1442d13bc82@meta.com>
Date: Thu, 26 Jun 2025 07:01:23 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
To: Peter Zijlstra <peterz@infradead.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
References: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
 <20250604092815.UtG-oi0v@linutronix.de>
 <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
 <20250604200808.hqaWJdCo@linutronix.de>
 <aa6154d1-726c-4da1-a27b-69d2e8b449c6@meta.com>
 <20250606070638.2Wk45AMk@linutronix.de>
 <20250624190118.GB1490279@noisy.programming.kicks-ass.net>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <20250624190118.GB1490279@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR12CA0021.namprd12.prod.outlook.com
 (2603:10b6:208:a8::34) To PH7PR15MB6463.namprd15.prod.outlook.com
 (2603:10b6:510:304::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR15MB6463:EE_|DS0PR15MB5573:EE_
X-MS-Office365-Filtering-Correlation-Id: 3122a0bc-91b3-42c6-9749-08ddb4a0dafe
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzJiMDRLNGNTZSt6ekswb2FySzdhc3lYb0wzQkM1QmpmWUVFSmo2cDY3UlBZ?=
 =?utf-8?B?aU44aFlSamRhSURnNmpWYVhuNDBVaHpjZXlNWXBqMnFmRGNiR3AreWJBckFH?=
 =?utf-8?B?eUNMdGJseVQ2ek5MWTlsV2tLKzluWFdjYk5Wbm9PY0k4OFlGNk9DWHRPSG80?=
 =?utf-8?B?ZHorVUxaNW5nTkRueS9ERlRYOFpKQlErRjVuSjF4bHgybUVESXpSaHB4NHAw?=
 =?utf-8?B?Q2ZPZjVxZWFqbmFpYjdrVGVLTWJJTkMvTzNYODhndS9hTVBPazF6UkJzWVpt?=
 =?utf-8?B?allDR3VhUTArUHBtWkNMRmdiUnV5SnFrQlNZVHpsNzRVZ1JYU0ttRWJaK2U2?=
 =?utf-8?B?KzVkbkNaWC9XUWNMWXBEVkxXWnM1MW9Sc0g4OVZnSE5MTDNxY2tkQXZqNkwx?=
 =?utf-8?B?N2pPd0J6bUc1WURMR0U3VE9tQXVxREptUHhxS0c1bkZRUTdUM2RtcjYwbGJV?=
 =?utf-8?B?YmpFNlJ5QVlxSTJHL3N2TjM1SkJRRElQUFlESTEwdlFOT3RBS0xvbXFnS0li?=
 =?utf-8?B?MDNrN1B5cTFTZWNTcUVVSFg2akowTDFxUHFRUDdFSTkyNUtNM0huZGpqaUxE?=
 =?utf-8?B?emplUlBVelJJdmZxdHZWRmIyUXpEeEczVHlEdTFrTGxRbi9NdEM5SVh1WFJ3?=
 =?utf-8?B?eFQzU3lsNkxBK2pFeFRQNnpQNHkvdk01TzZoWlpwRS9xdTBwWjBDWVlqc29h?=
 =?utf-8?B?WDR5U251bVk2cXQwSkdJT1RuTk1aV1JOcTlOYTR1YUhlUEI0dVVFNTRUelVT?=
 =?utf-8?B?eGFMbGY1V3gxTWp3TDkzd1B2NExodlpTS1ppYTdJUnhXMldjbmNBdkRscXZW?=
 =?utf-8?B?WTFlQzhCQzhNeXhnU3RSUlhkcldZRmdrSFVJS3RmWUpwYzM4NVVjcTdoMzB1?=
 =?utf-8?B?YlQ1YWR6c3ZJM1VTMmdwVmVNWFZwdFFVNnpWOTZWUm5qdldvekNNL2doVU15?=
 =?utf-8?B?cWE4RklzUWp4ZFhLWHhDMC94ZTU0VGVpUzRYQUZKd1lTblptdDBNMFVQNVRX?=
 =?utf-8?B?NmFyKytVNUE4endHTDlCTlRXRktPNm5jaTk2NE1URGZmeS9tSGxBK2tJNHBQ?=
 =?utf-8?B?Um53aGYwSFBJRlVQUE1HTlllVU1MaFo1OXdOVXhlZnRCb1ZLUUNPNHgyUnY4?=
 =?utf-8?B?eWQ2ZkVURFZ0UnpZNFlRTHNyR2hVSVZvbTVmYURGSDQ0Y1dXR2tVTU5vUFRo?=
 =?utf-8?B?TTFRc25vU2crQVlGUE9BcEluYUx1UUVweEJWcDZMOFhOdzB0dnloRFZEOTVv?=
 =?utf-8?B?Z0RtNjNldUR6SjFKVzdwbS9CeCsvdnpwVTY1djRKZGVxUlJFOGxDN0FKWHJY?=
 =?utf-8?B?U3VJYW5hcXJKSHg2bk5GUFhjekVjR3pvR0pmZnY4YWI3TzZDSzhsa1pJTndk?=
 =?utf-8?B?V2tZY3RiRGpjMmk0R01ZZ2dOUjhpTWpES0crZnl2VDBucHZMZm5NSTlSRzNa?=
 =?utf-8?B?Tlo5Z1N3VXcvZ3pxRllQQ3FDSllUdmI4V2JoNzc3SmdYK3NHYXp2R3ZNTVRO?=
 =?utf-8?B?MzU3U1hRTUJMbkZkVzFxMEFPZUxneFpSbWRjK0NyamsyeFBPSzVuUHVlM0xl?=
 =?utf-8?B?SVA1ZmR0WEJnOVAySE5ldEdyV1IwZHhFNDdYK0NkQTBWTWI0K2E2VmJ5UXlv?=
 =?utf-8?B?cE9tbE5IVEwrdFlTMkZ3Z0VxNHlLbEl2M1FwYTU3cUtOcDhTL3lmUkp0TTJN?=
 =?utf-8?B?UVdEL3lZSk9pUzlscTFBZFdlYkRSZmJUYzExcUVwNTNqTEY2MXVibUdWay9U?=
 =?utf-8?B?YVI0Y09HNnc2T1BnOTVSN3NmRFVPT2NFaTRNMzd4NmZRUy92UjlRU3FkcFIv?=
 =?utf-8?B?dFlSb2VPdGxkQmZDbW1OYUxJQ0FoNTc5MU1sZ2VlTnpVOTYzWDI2dmdzYmsz?=
 =?utf-8?B?bG9Md1FLc3lLb3RiYkFNa3FxUy9OZno3ckxKRkFMc2xCbEFZTWR6OFg0dk9O?=
 =?utf-8?Q?dIW/r0jU01E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR15MB6463.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzI5ZFhOa1ZNbnJMNm9FbTBTekVpL2pBN3ZjWmJGREIxTlNqMHdNUU1hVWNm?=
 =?utf-8?B?UHV0SnFqc3hKTWJabVBMYW45TWNRRFpqbGo2SGJFeTd6QUs2ZHRET3NUTVMy?=
 =?utf-8?B?Q256WTlJallzeDVWYXFMaXdXaWNuekh2MVIvdm4rZDV1ampzSTZPYy9tT0tS?=
 =?utf-8?B?WmJoOWlBOVpxV3A3QnhWL28zZ0pEdnJoOTA4TmRXL0V0alFVY29mbjZ0NlF6?=
 =?utf-8?B?Tll3RDhVL1c2L3QzL3YxL3BKWDFvUXdqWU90bzZzbHJxaTdKdVRvSG9wU3N1?=
 =?utf-8?B?UWdzV2JSZy8xVXFBZC9jYVRiaUNHVlJGRmU0WHZ3d0VKSFFPbGY5N1hmTlRj?=
 =?utf-8?B?b01JdTVydURhMG1CYkdLZ3VTc3lGbERVM1B3N3d4cWg5NEJJUmVhSFpjVjJT?=
 =?utf-8?B?UVdMaUt0TE9EY3lGTzRqb0RDbi92K1hwclJqZ2s1L3dCREN6ekNjQ1Q5Zjk4?=
 =?utf-8?B?UFFhbXVSTlNQUE4zeTY3aHU1TE1GUjJWcVVWQ1hKSzhvTnl1a2Q3MytSM01W?=
 =?utf-8?B?Ti9ramFEY3VLc3NBL1VWTFdwWFpEUlVIa0Z1dU4xOXZrNjJwV3YxNnRJRnM0?=
 =?utf-8?B?Nmc1bmNsK3FVYjJKS0tMVWM4UXVtWWlHRjdmTFlDRS8zQUJNSEhUbGNNYUJx?=
 =?utf-8?B?YzdTajFkZVZNNUxPVytJQW0zYVFURyt5UFBRS2xQR0wzUTZMc0lxWjJ5ZkVn?=
 =?utf-8?B?ZWU1dU5TYUFkd1ZId0tMazJGSzJWSCtjY24yUjgvZVhFVnd3MnRVdmhGTitX?=
 =?utf-8?B?MmFsS0NFdGZVVDdlNktzdE93TGl6N1FCUklqbzR3ZGhxaEpyNjcxbW5DWjdx?=
 =?utf-8?B?SHM0QUloS1BpaUNKOXVGcE5HVTkrbmNZU29pbGJxbXB0R1I3NTBXeC9BZkdq?=
 =?utf-8?B?bkE3dmlxOUtDbXAvTlc1cXVsaEpMRlgvbnovVDhyWlg2RzdDb21tTG9rNlFn?=
 =?utf-8?B?eW45VHVuM3pBaHdBQURCMlBKUHQrQ1NtVHJEMCtndmYvTi9SbW5oblBNeE43?=
 =?utf-8?B?WWU1eWhVbnNGb29FaldJWUkwY1dtOFZqdzJXNVorM051M1A3UFM0V1NFSk9t?=
 =?utf-8?B?MmY1NjJaN3NWR2pGRFVWWjg0SFo5TWRnUUxPU1lUSGNmaE95MFZmV3duMGNu?=
 =?utf-8?B?cDR0bzdQTUdHSGp0REIrWmZ2VVM4Mzc2c29zVFQ1ZzdSckhXOGNWSnZsaEgy?=
 =?utf-8?B?a3BrOWFIaDU0TmdneVBwMmdXMzNFUVVyRld4RzFEYjJOdnVsYmI1R25aOEpy?=
 =?utf-8?B?YnEweEtXM0RLMlZMc1pnUzR4Y2xoOVEwSndsYTdlbzkxR1RCZVk1WDJaYjJC?=
 =?utf-8?B?UjZBL0J3WmtvcHZmd3lMb2JBY3ZaSEVnZ3lCUGFoZDN6NTY0aFFSMzQ0aHJN?=
 =?utf-8?B?SjJGbDAxUjZOd2dKRHk2ZzRLRFR6M0d3N3JPV3pSRHhWVlZueXdpenNMRVlO?=
 =?utf-8?B?UGVoWDFRL1N3S3o4czI1VGtJUHpYRGdqNmhTUlRpQXhMcTY5U2R5dEtod3A3?=
 =?utf-8?B?SlNPRG50TDhOMlRubE16cFoxdGtGa3lTQnE3dnNqVmFNbzVROGtRMlRCUkN0?=
 =?utf-8?B?bFdVV0g1T05hVlRuU00ydXN2ZTVWWUY3Rm0vNmllZmFTcHFkODg0TmVOYlZS?=
 =?utf-8?B?YTNpUFVOdjlmMys4US9GbUNrbk1nSEkzKzhTMVBMQU04V21BRXlSaHE1S2hI?=
 =?utf-8?B?Z3BLZFlPUnVpV2NicVR1YUlMUXltemF4ZU9vUDlwMGQvdjBncUM0cGFtQzBI?=
 =?utf-8?B?RnVJRnBLUExHVXFaY09Bc2ZCcWJFOVl4YlZHdElkM1J3U1NLazU5RVIyeThw?=
 =?utf-8?B?WkliTm1ZN09ZREZLeFY5VjVnUkVJazUvWTNGNzF5WFdVYzFjV1VUWW9XczVk?=
 =?utf-8?B?dmp1Wml2MWI1MnQ1bitoVHgzZzZzUkI0L0JGWE5wU0JDUjBwcytFTjVwaHZV?=
 =?utf-8?B?MnpnWFNhMkllUm1ueGp2aFppOTNSditKYllLZVVIRjJGQmNoSi9pVDYrN1Vo?=
 =?utf-8?B?VWlFREMveDBsVGpnVlNpSlYwNjdtMW9STGtPSU1Dai9lY3VFTGw4WkFvOUE4?=
 =?utf-8?B?OFhxM2dWdG1OYllycTJnNjhxUGRDdWh1WmNKblI3SFNaVnZqSTBtaFdWQTds?=
 =?utf-8?Q?5ETQ=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3122a0bc-91b3-42c6-9749-08ddb4a0dafe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR15MB6463.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 11:01:52.1755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwcNdpO4A2phdYU1AKQm8ZUcBjrkhSKIVk043QV6uZtOwSQCm9pDRxZJM3zpFAQg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR15MB5573
X-Proofpoint-GUID: UAF67eiMne0t8gtA9OcyCSStkYT3d_yN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5MiBTYWx0ZWRfXwxGFdupF/CvP 0z5E2QehlA4XmlbRnrOfH7BeB306HYP1jvhtHIoCY6OKHS81RLtNeE02cht/k2ZQBGaYXslBJAh ljy5pw/mYd4qrRe5yLpBm2ztg8v/D8MsO4fQzy3p2eg/e+kGNf0vlvK2w6gswlYU5Dzno1i7/IB
 TewpN11rFFdMxKfWgdsEjtbEKmivj/jKM+u6Knb8hKWYrE2C1jF/TG1qGYYOF1GrzeMHETbp+Z+ //jClnk8oRmdbzkNrLHOKOErENxTH3z5aRvGE8m1Zof8KSgfLLf17gvfyceD484JB20DtdERt3V laSsQvamvmQRjXB2K0pHiWnqJV2UbqUsmgkXJrxSyTQHAwGuNPuas9AgCn1t/i72U+uXhV2FL3Y
 foGgJUoDaVXYBbYsln5VrqTRxh3CcjyCoh5oiWxmyGLEgCayioncwv+jd4Z8tH9zJGSpx0Oj
X-Proofpoint-ORIG-GUID: UAF67eiMne0t8gtA9OcyCSStkYT3d_yN
X-Authority-Analysis: v=2.4 cv=DcwXqutW c=1 sm=1 tr=0 ts=685d28a2 cx=c_pps a=pz8Qo8/3TH+4vYshqIBPvQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=iQA33Igq_sq4cjcDEwsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-25_01,2025-03-28_01

On 6/24/25 3:01 PM, Peter Zijlstra wrote:
> On Fri, Jun 06, 2025 at 09:06:38AM +0200, Sebastian Andrzej Siewior wrote:
>> On 2025-06-05 20:55:27 [-0400], Chris Mason wrote:
>>>>> We've got large systems that are basically dedicated to single
>>>>> workloads, and those will probably miss the larger global hash table,
>>>>> regressing like schbench did.  Then we have large systems spread over
>>>>> multiple big workloads that will love the private tables.
>>>>>
>>>>> In either case, I think growing the hash table as a multiple of thread
>>>>> count instead of cpu count will probably better reflect the crazy things
>>>>> multi-threaded applications do?  At any rate, I don't think we want
>>>>> applications to need prctl to get back to the performance they had on
>>>>> older kernels.
>>>>
>>>> This is only an issue if all you CPUs spend their time in the kernel
>>>> using the hash buckets at the same time.
>>>> This was the case in every benchmark I've seen so far. Your thing might
>>>> be closer to an actual workload.
>>>>
>>>
>>> I didn't spend a ton of time looking at the perf profiles of the slower
>>> kernel, was the bottleneck in the hash chain length or in contention for
>>> the buckets?
>>
>> Every futex operation does a rcuref_get() (which is an atomic inc) on
>> the private hash. This is before anything else happens. If you have two
>> threads, on two CPUs, which simultaneously do a futex() operation then
>> both do this rcuref_get(). That atomic inc ensures that the cacheline
>> bounces from one CPU to the other. On the exit of the syscall there is a
>> matching rcuref_put().
> 
> How about something like this (very lightly tested)...
> 
> the TL;DR is that it turns all those refcounts into per-cpu ops when
> there is no hash replacement pending (eg. the normal case), and only
> folds the lot into an atomic when we really care about it.
> 
> There's some sharp corners still.. but it boots and survives the
> (slightly modified) selftest.

I can get some benchmarks going of this, thanks.  For 6.16, is the goal
to put something like this in, or default to the global hash table until
we've nailed it down?

I'd vote for defaulting to global for one more release.

-chris


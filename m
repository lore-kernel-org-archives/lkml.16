Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2124.outbound.protection.outlook.com [40.107.105.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1256FBF6;
	Wed,  7 May 2025 04:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746592707; cv=fail; b=OPPVTJgeX9eivU6Ptx25IxNX6Icos3z0HBmrbVRufQIozrO2YQdTCaiOc6Sx01Zq3jWGCFjIBzzPWe8EuTGEZydInQ67EjUGBlL779rY6joGgqmpt14+9JzPRX7Wig7PTjf4XVPI3bW8/Ru5p0QSLIx8MJbudIb+UBWJuUnwqyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746592707; c=relaxed/simple;
	bh=W7ik6DiEzRL770HMmsQj3Xtd/2km3VNf2UknyuX8ciA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eNHNVLHvtYphg1z5UgTdoLceCwPQ1/ONjRPPgL9X8Hyc7bf6kKfVztC+wr76iExqFOFe6FK3oBLh6kne7SYx4TLZ8Cu65PcdYGQwzRBkXwDZKHtuCHzGHkGtevopRefgVILedtQRWHfmsbBdL9o0NPuVP//qVoJuvb5aJqymH3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=g8uyNsx+; arc=fail smtp.client-ip=40.107.105.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="g8uyNsx+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWg+hofq6gWGHEfoqDlBg63KBzLrHgqM7ZT6O/Ta4x+KNlG8nrcP460wJplHlk+0at8RA47LVCgfm1tz8UVUt0s9/CD0DOe9Tk/hLvFV6BPkPwJhM5QM9mKiDKwn4J+sTctrKK73SiD3xbV1Mbo6b0oR5Vngq+QILL9UkhyAor3TIxszglvqpGhJg4O1Bd1WzLGqU6eHuz9czFRRX7Bb074TqVNjz0TW+4SV1UNEDIELZHavdV8Le6SSjVbRy03vaaa56oem60LYDhKHBbVrO1pPbyb5cHp9nsAMZWU4W94p7nhOzGCwPj+b7+2loWSp2mxrJISPR2hoQj/wTlRnOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmF08OQJQ8Hn91TF2cEDsvF6iM3+HEsaYOX7Xn3Tcnc=;
 b=JI1bhRoeup9FJIJ1rvkxFWRtDb944YFQKDotKFhoFIswimLjUsT335f798KKgEuO5ccWY2ADbB4o5cXEiM2hWZu1nJI8wtxmq+SZXmV9NiJ/wIdw3rhxUtcA9HlavrcVjhxvq8X7OuD5EBmNDhWVX4nj5mmO1ba30KieVaklE4eNmAFtfXczSTvPX1GTnKTPfUkHfRw94504pHy0rjYxVqpJ4dUKV98AQLli6c7Uo0oQjIXUaq9y/mwPqChyK1KARBeiMwCr0gp/EoqeQbAJOu/WjpQXkyaDQoQeiPSnZouYi2kqdCFp+r7ycYGx8gswr/4Q4uZYLYstpqo91A4puA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmF08OQJQ8Hn91TF2cEDsvF6iM3+HEsaYOX7Xn3Tcnc=;
 b=g8uyNsx+mhACAczX5JFf+q4tXiGMs5lfxC5mJsD1qJHG6AWwAUCe2M4N9pdO38tkAxZoVy0FK8mrMGDL0OmsrG0Qm1WzEs0r3acjGL71T4AnWwLfP4gyOldUNd6jebHK6awJ6ExCv8z2TVTZPoDiHhgnui7oshuiP6jmm2AN5GdlXUkqjEbmdwao7FuBmrOsdd2ayCl1KomDwHypUPrud2XSV1iOXcL7FUeScnx83UchtH9o5lPNEvAEXxRrun/81iN2BzcJRg5f2x8dugEsAA8iTB6X9PlqtCABNZp89sde1ys4C7sT57tuFl0q6FxFVwCo1bpTAwi7BGD2QVeNIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by AM9P195MB1155.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 7 May
 2025 04:38:15 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%6]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 04:38:14 +0000
Message-ID: <f806853a-199e-4a04-8bae-a9697e9a5cca@phytec.de>
Date: Wed, 7 May 2025 06:38:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: ti: k3-am62a-phycore-som: Enable
 Co-processors
To: Wadim Egorov <w.egorov@phytec.de>, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>
Cc: upstream@lists.phytec.de
References: <20250506133604.294920-1-d.schultz@phytec.de>
 <20250506133604.294920-3-d.schultz@phytec.de>
 <eca138f3-1ae6-49e6-ac36-3302fe867950@phytec.de>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <eca138f3-1ae6-49e6-ac36-3302fe867950@phytec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0343.namprd04.prod.outlook.com
 (2603:10b6:303:8a::18) To VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:248::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2484:EE_|AM9P195MB1155:EE_
X-MS-Office365-Filtering-Correlation-Id: 43816f40-cc5f-440f-462e-08dd8d20faac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEYxQ3p5VHZWMDgzRXVoM3FDb2o2VlMwU0k3cmQraSs3eEJZQWJrVDEwcUt2?=
 =?utf-8?B?eGxYN2RoVWpyZjNRaU1MNGROOG90dDNIaEpoazFKMXBLZFYrTzdWWEhxNzhF?=
 =?utf-8?B?Mk4wMmtLeDg1RGlQQXhiM1VKVFExc0wvdXhGVnlnSGZ0WFhQK0REN2Jvb0RK?=
 =?utf-8?B?QzZNTDdyMG51cmZLbGRRQ01SS2YzOXVOdFlKKzR2U0F1RmFGQkdEKy85TkJ1?=
 =?utf-8?B?dkFXcHpBeGFQcUk0QU0vbWp6Y0l4dnJiMFpEQm5PSEp1NmlRc09HenlML2t2?=
 =?utf-8?B?YTRnYlI2NE43cnhFejZxRG9ranRXeFYvREJYTThWNFlIc3VDTVQ2bnZwSDRh?=
 =?utf-8?B?dVBKNktOT0tsU2FJNVpwWld0YzM2alNwWlcvQURNdmFCOWNVeTJseUJLUTRr?=
 =?utf-8?B?dnFSZDRNT2hTNHNGdHdZVEN5bituTDRlTHFHSnprVmo2LzFRNnM0aVhkUndI?=
 =?utf-8?B?SklJcHZxYUU3eXpzQVhhSE1QeDg4akg2dHRpcHlqczhsMGhGNTZFSUtkdVY4?=
 =?utf-8?B?VFBjY2VBTUYrRWdzVjlkWUY4b0tlTWdId0Z6WUVkbkJhL1QwU3BMZVhTVVNa?=
 =?utf-8?B?c2pmaEx0MzE3cy9zSzk0Wjd1ZlBOQTVVZVRNakM2UURoU0tPY3o4akNQUDR4?=
 =?utf-8?B?SFdadlBkRXJkdjdQL2JYTWFTT3JLL0FkeFl4UWluMzhGN1JEdHRUU280bU9E?=
 =?utf-8?B?YXlqSXVwdW9FaFhZa1BkZFBzY1ZNZTNMb0FtQUg1d3ZFa3RXQk90dHZJeExi?=
 =?utf-8?B?MllGMFRLWkgyTTRsS1VJSVVzaWZFWk1wbzRiVzlOcTlsc3VRSnY3d0xBQ1VW?=
 =?utf-8?B?dExlUUx1S0pLa3dYbWprNEJPdVNrWVVWTDUwVnhCVHFwVFVzY29TQXZJcndB?=
 =?utf-8?B?OFJ5TEpRYWZYR2QzQTUxRUprKzBGMnVuamU4aXV1NU1VZFdXSE1JVmx2dmRn?=
 =?utf-8?B?REIyZU9VcDN2R1ppdFBEZmdwWEswL284NlV6ZitackNKSWRWNi9YQnQzWFJC?=
 =?utf-8?B?dHliMmNKd3kwbHJTUmNQaEtHZHFiUE5XNFN6cFhCYWNCQjd1ZllWZTVuVXBh?=
 =?utf-8?B?ZWlWeXpmSHZXZEJGTUg2NzVvQW9FcVFoazVmOW5XYzZETWtkcVZkMFlDWm1j?=
 =?utf-8?B?Mzhob2I2aTMrTDRONTd4OXp1L3pFdkxhRUVpZHptZ1hEM1I4Zk1SK3VJSHcy?=
 =?utf-8?B?eHlnaUd5Z0greFNUT3k3K3B5c3pZeDdZY2NGU29yeW1vZHhiTThrN05pS3FP?=
 =?utf-8?B?T015MGdTZ083NDlxekQxNW5tVVFWdU01K0FndFRZSnpVelVwT0NMUTZtTWhW?=
 =?utf-8?B?QUtlelB3Y1BEV3BiOWdnWEc1dnhyVnNTcEhSd0plOHVZM2dqODYzNEFjbDU1?=
 =?utf-8?B?amNxcXhFZityL2pEVWJMV2dnRmtSTlI5a09HcXozdEhueUtBb0FIMVZUdWVN?=
 =?utf-8?B?NXZkRFVWeU9vYkdoa1doVmY2Y1VBdVZjbTZLb0JwV0I1K091Z040UkpObkZP?=
 =?utf-8?B?bEd3UDhqWnVEdms1MXAzVWdFT29DRWJ4dThnQzNHQ2wxVTNQYXE1SkIyQmxX?=
 =?utf-8?B?NENtNnhDS3NVS3U5VGJEYk85d0NhMTNtRlAvYkpxaTNBa1E1eklOTXJLaE1r?=
 =?utf-8?B?aVRSVW8wZ281MElJWU1GRmlCcnRORDIyd0lmVmJHSVI3SW0vR3ZtdG43R01T?=
 =?utf-8?B?d0Vvc1daYXpqRXJ6NVc0aENpSm1mWVhtb3pXMC93RjRqNkgxMjhocDRUNDZS?=
 =?utf-8?B?OGJYS1NUK3p6M29FUFNXdExJdGVNbEhkeGgxSGMzVitEdWEreGMxdjI3Z0N4?=
 =?utf-8?B?Q0cvWW1lU043cUxvc3ZUSWpWVlVOZzVIN0k0bDRvMWc2SDErV2lqSEtHdUlJ?=
 =?utf-8?B?OElCVUgxd2lVM0o3ek1mNHduZVRnR0NUN0s1cm5zbWZIM3hIN2VoUE9Ua0dB?=
 =?utf-8?Q?35wy666MK/I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDRtckhPQ3BySGpVaU1jQkRqTVlVYmRENktQWEFtTDZiQnNWU0tQbmhWZjZw?=
 =?utf-8?B?eXkrR2RiQ1hQS1JzRU9BZ1duUnRJcDZYS2IrMEVxalZTOUZnaWVZQUhEejJI?=
 =?utf-8?B?aiswTGRZWDRtMy9hVCtQUDRDY05wZTYzOXFtVlMxUHFDeUVLTzhQZytaNUhD?=
 =?utf-8?B?d0RZVGZrWVZzWDIwdk1iemlQa2Z3TTQ3eFZVZXdNMk16Z28wQ29YbGQ4eDl3?=
 =?utf-8?B?eHJrMzBoL3lvTVpmTGJwOHR2NGU1SDQ3M2xPcS96eFhOdjhhdzBlRjh3allt?=
 =?utf-8?B?a3I2TE5IMUJHM2o3TEJ1a3NBNElMYWMyNTdlaFVGSFJOT09FQWptOCtjdVFi?=
 =?utf-8?B?UytyL0RobzhNODM5ejhndGxjODBqbUx2anIybWplallXV2UyTURlTW1OM3Fi?=
 =?utf-8?B?bUNYelJqU05TMXZ1eE0vU2c0c0IyYWdYZHhGbmVRZHZ0V1Q4SDlkQUs3SmxW?=
 =?utf-8?B?bDR0ZmJLZ1dESzJWRmpFcGZOUGtXM1pXbUNmakRlQU1TaDkyLzlLSXUvcElw?=
 =?utf-8?B?SE1sTUk3M3hwQzhhaGovZDBSTGozaU4vQWh6c0UzTmk0OElUYi9PNW9DYms5?=
 =?utf-8?B?cXRzZ00yT1pmYmJDei9oaWxrb01hODhNQlgySnBwelhlR0U1TEFWaWVFM0Fn?=
 =?utf-8?B?WTF1dkVIdmNzVWhHc1hYWklCYnJHU3p0RDU5aENjcG11TDRYY2loSytZWXJH?=
 =?utf-8?B?QTAvdjNLN2lyTzFwT1YxaGQ3WHUzMEc4VnJnSmJyK3o1QjRTY1VETTc1cEVV?=
 =?utf-8?B?a1I1K0wvTFhYaWRva2pwZG1ZY0dxS3VvZmlvTDcrU2l4c2Z3MW12dm5MbXYr?=
 =?utf-8?B?UjdzTlRxUlV3Vy9xWE5yY0VNNm9JQXhacWFIOEExTi8zdi91WXpRc1pqd2Jk?=
 =?utf-8?B?VjlZR0gzQlBlYzlQR0VzV2Q4dGgxUmpKQ1dHQzh3cUp2ejlFck9MSlBIV09O?=
 =?utf-8?B?YXhPRkNXcitXeVJ6S2JEd3VSaXFSc0VjMlFMWUlBQ0NJUFZ3WEpZZ1k3cWRJ?=
 =?utf-8?B?M2hiUUwzVlE3RzA2dW13eVhFRWhCT3ozK2RQb0MzUFJXZFp1UlFDMlhlOFpE?=
 =?utf-8?B?dWFKV3k1NlBHU0RBelJLNjBwOG1vdFkxaDNNdzRJaTVZdmRheTFndFBidzUy?=
 =?utf-8?B?Sjg2aFMrZ3VQOXJjbllEK01iV040QlVLbG11UVQvSnd4SkJzY0tNWUFCS3FF?=
 =?utf-8?B?NC9ZbC9sUTR6Q0Y2bHhLaU5RdzhMdVBmdTdRMVNKeXZJbGx3bk5tRTA0MXZK?=
 =?utf-8?B?TVdOTzR1TUgxTzhMMnFEZllTY1dZUmQ5TERFcXpXMzNlTmIxRHVkdlBWaGVr?=
 =?utf-8?B?OEdMNWRpems2cFdmbHh2dzh0QXRhcGhNY3hSYUFDRnJQT3dESFlZUlFJcWpp?=
 =?utf-8?B?ZTdyNTdsYUxjR0oybnJ1REQ1SUpQR3pBN0N1ZWoza0xoS3l6OC9vZUMvUWs5?=
 =?utf-8?B?d1NNRnFDWi9yYmhnNWR3aStmSUhMZ0k2TEJxM1J0aDkreW9aWHFjNXV5SFF4?=
 =?utf-8?B?U3ErOWhjdGtCTkgzMUNpRUhQZEdmbVhXRGh1MVB6SndTMk4vdXhpQlVrVWFG?=
 =?utf-8?B?MVE2QkhIZndnWnZoNWZpWWJMdFlZL3JoZjJRZCtBRy9CeHJ1eEwrYitrRzdp?=
 =?utf-8?B?eUFhdGcwMlNsVlZSMDM4cFlvc2g2T3UwQmRuYXoxS1JTdFBzZ0NodWZicXpI?=
 =?utf-8?B?anF0T1BzdVRrU1VIYnE1SVp1OTJaRGxDWldoQ0pyM0dhODN0dzRIcXZMM0wr?=
 =?utf-8?B?YjlrSlI2MGhIemZ6Vi9sWWxzR2wzTlMwY2lDYlZWRm4wZ2I5SnhmUlowbnFx?=
 =?utf-8?B?b0tBZlM4Mmw1SndORXRIcXhZUndqRkI2clR2VFRNejdtaTAyQVJ3MGZxWk5Y?=
 =?utf-8?B?VUtKL25DUE5DdFFQTWVaSUhvYnhpQXpWMTl1VWJlc3E4ZjFJS013YWkwYTlx?=
 =?utf-8?B?QnVXaldlZzhZc3hSR3pHSHB3ZGhtckZURm9EQ2x3VHRFT2h6dnFaZThIU2py?=
 =?utf-8?B?elhQUjNiY2t3R0lZS1l1NTJBMHhFQk9ScWIwRzdscmhnNzVBZW1OSWxCNEJ5?=
 =?utf-8?B?Tloxc29XUFMyKzh4cTAxUmFwMFdsNGZzTWhGSUZGa1V3N2VDc2tRNlppZVFB?=
 =?utf-8?B?Q3FhQSs4RHA2UHRlYzF0OUJsTUNoT2liUDIzMTErWTd4VWNUR3RNYm16YURI?=
 =?utf-8?Q?W8zbQlAV8TNaA1KGJklM4249OuLvMu9eC9BdBJi75kS8?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 43816f40-cc5f-440f-462e-08dd8d20faac
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 04:38:14.3846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNTKapYwx0ls/hGVLKfikC0dj54vmbTfFXY/NJJd7VAW8YV+feX7JjNhJ76mPpeKWfeH5uo5kaXA/s7y3dXqYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1155


On 5/6/25 17:41, Wadim Egorov wrote:
> Am 06.05.25 um 16:36 schrieb Daniel Schultz:
>> For every remote processor, set up dedicated memory regions and
>> associate the required mailbox channels. Allocate two memory areas
>> per remote core: one 1MB region for vring shared buffers, and
>> another for external memory used by the remote processor for its
>> resource table and trace buffer.
>>
>> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
>> ---
>>   .../boot/dts/ti/k3-am62a-phycore-som.dtsi     | 96 +++++++++++++++++--
>>   1 file changed, 90 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi 
>> b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
>> index 147d56b87984..049aa358e796 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
>> @@ -59,6 +59,42 @@ linux,cma {
>>               linux,cma-default;
>>           };
>>   +        c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x99800000 0x00 0x100000>;
>> +            no-map;
>> +        };
>> +
>> +        c7x_0_memory_region: c7x-memory@99900000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x99900000 0x00 0xf00000>;
>
> Just checked the origin of this for the am62a7-sk, which is 
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=10.01.10&id=a82cef91b301e3a03a4efe0f49e6cb8cf50f43af
>
> The size for the c7x-memory is 0x01f00000 and not 0xf00000
>
>> +            no-map;
>> +        };
>> +
>> +        mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
>
> which is relevant because your next reserved memory area starts at 
> 0x9b800000 (would be fine with a size of 0x1f00000). If you really 
> want to have a size of 0xf00000, your next block should start at 
> 9A800000.
>
> Can you please double check and use the free memory inbetween if 
> 0xf00000 is correct.

Hi Wadim,

I copied all those nodes from the k3-am62a7-sk board update which just 
got merged [1]. I don't want to change that now because I'm afraid the 
default TI mcu firmware won't work with different addresses anymore.

@Andrew: FYI there is a gap now in reserved memory but I assume you're 
already aware.

- Daniel

1: 
https://lore.kernel.org/linux-arm-kernel/174653697389.718892.12387672790395559537.b4-ty@ti.com/T/#m7f099b9507759c8f56733004222ed1b1bbdd0736

>
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9b800000 0x00 0x100000>;
>> +            no-map;
>> +        };
>> +
>> +        mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9b900000 0x00 0xf00000>;
>> +            no-map;
>> +        };
>> +
>> +        wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9c800000 0x00 0x100000>;
>> +            no-map;
>> +        };
>> +
>> +        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9c900000 0x00 0xf00000>;
>> +            no-map;
>> +        };
>> +
>>           secure_tfa_ddr: tfa@9e780000 {
>>               reg = <0x00 0x9e780000 0x00 0x80000>;
>>               alignment = <0x1000>;
>> @@ -70,12 +106,6 @@ secure_ddr: optee@9e800000 {
>>               alignment = <0x1000>;
>>               no-map;
>>           };
>> -
>> -        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>> -            compatible = "shared-dma-pool";
>> -            reg = <0x00 0x9c900000 0x00 0x01e00000>;
>> -            no-map;
>> -        };
>>       };
>>         vcc_5v0_som: regulator-vcc-5v0-som {
>> @@ -170,6 +200,13 @@ AM62AX_IOPAD(0x1f4, PIN_INPUT, 0) /* (D16) 
>> EXTINTn */
>>       };
>>   };
>>   +&c7x_0 {
>> +    mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
>> +    memory-region = <&c7x_0_dma_memory_region>,
>> +            <&c7x_0_memory_region>;
>> +    status = "okay";
>> +};
>> +
>>   &cpsw3g {
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&main_rgmii1_pins_default>;
>> @@ -200,6 +237,33 @@ &fss {
>>       status = "okay";
>>   };
>>   +&mailbox0_cluster0 {
>> +    status = "okay";
>> +
>> +    mbox_r5_0: mbox-r5-0 {
>> +        ti,mbox-rx = <0 0 0>;
>> +        ti,mbox-tx = <1 0 0>;
>> +    };
>> +};
>> +
>> +&mailbox0_cluster1 {
>> +    status = "okay";
>> +
>> +    mbox_c7x_0: mbox-c7x-0 {
>> +        ti,mbox-rx = <0 0 0>;
>> +        ti,mbox-tx = <1 0 0>;
>> +    };
>> +};
>> +
>> +&mailbox0_cluster2 {
>> +    status = "okay";
>> +
>> +    mbox_mcu_r5_0: mbox-mcu-r5-0 {
>> +        ti,mbox-rx = <0 0 0>;
>> +        ti,mbox-tx = <1 0 0>;
>> +    };
>> +};
>> +
>>   &main_i2c0 {
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&main_i2c0_pins_default>;
>> @@ -315,6 +379,16 @@ &main_pktdma {
>>       bootph-all;
>>   };
>>   +&mcu_r5fss0 {
>> +    status = "okay";
>> +};
>> +
>> +&mcu_r5fss0_core0 {
>> +    mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
>> +    memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>> +            <&mcu_r5fss0_core0_memory_region>;
>> +};
>> +
>>   &ospi0 {
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&ospi0_pins_default>;
>> @@ -343,3 +417,13 @@ &sdhci0 {
>>       bootph-all;
>>       status = "okay";
>>   };
>> +
>> +&wkup_r5fss0 {
>> +    status = "okay";
>> +};
>> +
>> +&wkup_r5fss0_core0 {
>> +    mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
>> +    memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>> +            <&wkup_r5fss0_core0_memory_region>;
>> +};
>

Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazolkn19013079.outbound.protection.outlook.com [52.103.20.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A839220F069
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751366021; cv=fail; b=bnH0DSOd6a5iimiM1apNahjGTOfkGrwK2uuJ3wFCk6PhCscmPYC+QirYODMBS8OKV0/xGtvR/QDDtGgvt58xgIO+9GI3b8lOSKKdTGoV83O2Fw9ExvmHt9bwnuXPDugSdeD6lkBwOS/or4fXQE+mcIElqhSRD+yM8ExpsBdMIWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751366021; c=relaxed/simple;
	bh=A2oU1oy5Dy+Nb2kuREvJqlww0/IbJ4aGPa4sYrsTX08=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BjHjsye0mXI6KMLsBwBXkQBLWbhraxui8fBjHo8fiTuCtK3QLLhosTu8UGx+hOJtIxmGKDo2JwQOmcjlPDqk1FPNJ9X7dzkmV/HKf1pDOi/MQ4s43zNZc/45vjfILYh6rAzaej4Pw6YiobULmM//urRwkDIxbEdly0i0Lz32t58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=swfPoBKd; arc=fail smtp.client-ip=52.103.20.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="swfPoBKd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thI32nq1i5vgCLmr5xItaRfYRkT/N+5yyqTuoxTqlbwpwmX1vLE8/ItqqXEFIxjR7ntIDe+gXbWdQvAPDpe0Ghq6DwtK7I23XAu04nUHo3KKvzNOrUjnx+ohmYkw5jNHRZzF6SHI06eznXPFqS9ZBxrOU6pA1kgueXycQOuDQsoW+cTpMSrgk8R9t3U/l/abEkz5qSuVDy16P8f+efZD5QBlP4OWabYWDOnnk4YpTnHtaSzsu/6tuktChDcr89QQVTj//cV+66pdwuhYXeYHaqRh3PwgyZg3FMj1StHUOlcxlVTpnaVMl2Zj5gmoSpauOJ3ct50wlX1UukZJP6jUtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u905rzEFp0kXVPOF9canI3Eqv8A3rK2AZA+nqOI/1WI=;
 b=ez54I7M6tIJpBvJDNCFqnPcQXIAgVe2lBB1CbV3Y1r33SpsRXa6y+fdc3U4hsHP1K0ixxvRhare5qxEibZ0mjZ1PVNPxPaUbc3D/6qR0elF1PR6g7uPBkTjxpGhpojVaXhu9eC3fkhmvT7Ov0ddLvz7WuwLmH6RpfS7+EUYhrgmHV+AWYgO7F7OYHhWpd6E9liKnM72fePzRT5Xm7cKyOYDKgc8s83KgmrfkfSJ4utyNGGpDTY3Ct0IM+0c41fIptM6JmftOvEZO4+2wwKKhFDmTxlbufkIgwmAO5TkD7EQVV9hldtjA6oH2e0c//XmX6LcXSpoBqy29YkRxlOQ27w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u905rzEFp0kXVPOF9canI3Eqv8A3rK2AZA+nqOI/1WI=;
 b=swfPoBKd/cvrfdXJzheRc2Ofa4g70zhqDehv7mZQlOmh003ZCyPUT6XRPMR9YixhtY0f9mjX+SJr5T1AuxxZPUCcI6hfXkaTUMSAcnZf0ec9ORAIYnHtVa38yVq3r83VIueFwK/ppMCJ/i1O1EdXjOjUq4tl06AvLgzKxpg2llOkVAFJvjQWMPA3VyhdhJ4qXS/eRffIAQjwMVjMTM8JEgnVFlmveYC4qTcawCP0GJ3n5znrFwcwFNufMUVLPMd6zkETERw8BmkalwlM6zr9c62BHFnkQmpKqPFvTe3Lbw+zwDO64yvA+UqRlCmW7WZyCIV4DEoo7rsnOVFGMxoS+g==
Received: from BN8PR06MB5604.namprd06.prod.outlook.com (2603:10b6:408:47::32)
 by SA0PR06MB6827.namprd06.prod.outlook.com (2603:10b6:806:b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Tue, 1 Jul
 2025 10:33:37 +0000
Received: from BN8PR06MB5604.namprd06.prod.outlook.com
 ([fe80::4094:b32f:840:c057]) by BN8PR06MB5604.namprd06.prod.outlook.com
 ([fe80::4094:b32f:840:c057%4]) with mapi id 15.20.8835.027; Tue, 1 Jul 2025
 10:33:36 +0000
Message-ID:
 <BN8PR06MB56046FE563174567FF7744AAC541A@BN8PR06MB5604.namprd06.prod.outlook.com>
Date: Tue, 1 Jul 2025 06:33:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [bug] spi-nor not unlocking on Ubiquiti XW and WA
To: Michael Walle <mwalle@kernel.org>, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tim.j.wilkinson@gmail.com
References: <DM6PR06MB561177323DC5207E34AF2A06C547A@DM6PR06MB5611.namprd06.prod.outlook.com>
 <DAZRDAEP431C.26ALRPF1GSJQH@kernel.org>
 <DM6PR06MB5611F88B8684C981CB986867C546A@DM6PR06MB5611.namprd06.prod.outlook.com>
 <DB0J1QW7DG98.CDM408QMNM74@kernel.org>
Content-Language: en-US
From: Jean-Marc Ranger <jmranger@hotmail.com>
In-Reply-To: <DB0J1QW7DG98.CDM408QMNM74@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::18) To BN8PR06MB5604.namprd06.prod.outlook.com
 (2603:10b6:408:47::32)
X-Microsoft-Original-Message-ID:
 <08e82002-e1f0-49e7-bea9-06250a2b7aaf@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR06MB5604:EE_|SA0PR06MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 050c4722-8113-45c2-0739-08ddb88abc8c
X-MS-Exchange-SLBlob-MailProps:
	+bEufbke4JeoJg+fIXU4oevx1a0eI6+0oJLgQ8EC/leDBAl0X4imGMQcl82DqMi63ekE8N6aebIi4AkHUps+pzbMCUmkJMXEE/NR5KLpxMCpnX09FNUsR096AjFohEKOwOEwsaed7fw5C18W4/OJkLusfHAMD+1Tol2GvcbN/Zhnt5AHJ5eol9hJyk5tava2qO0ZiKrGpndaMfG5/LzGkJ1djR81/o8h3o3RM2476oIdY2GNNuVIFVBkuFGCmFQrFrZQH4FUrEapy3PsXD7MBcKKt0xtPzcliYz8mbBXuDcdGuwtGTQZaZ8IZeOJyU5bRwcdFYUQjDPDpZrp+lOCwyzeXtahTBeMB16jcvGRQBfDOPzB5QAJhYSwalKEku5B4JMi6Gst9ld+8FNaWfBgAVgo08U0IL2gu4HQ/W7ru5JdfM7UapaXrbDZHZp4Ui6I9tIKycDnTJNB/HF35DOEgbzK86qL8A8h798j+lKsBfZ9nDTuRJZLF1IKUvEAG8c/qgVF7b5q32bFqMHYvoOOnGTNmU4L3GefhZdfsjUeWnT+A9cYcvGhamVZ4X/g/6tiW85qIfz/OYVMj6x4Kx5lr+bunhkiXhmR62W3O7Wl5bvsQAiBkX74kb29L+0y2enLgQ5qUMZj6cScUkPDU0vG7FA4u1XuxBHvZucTGmp15zVPp8hiUDVbHr9SSm8wkq6SjECfHMbX8t2iCO1ORAHOopJKh0HFhCJ9ptFGDOlqy9kMg+xweC9ha9K/04WjWr+6WvtITfIoy8KzgvQZZq7XkQ==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799009|8060799009|7092599006|19110799006|12121999007|461199028|6090799003|5072599009|1602099012|3412199025|40105399003|440099028|10035399007|4302099013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0lOYTU4NmxISmFoem9sUHkwU2FCWFNrQm9zUmtCUjZKUWtoc0RrY1IvbGdo?=
 =?utf-8?B?VTV2MlVnZHJCVk5Nai9HVXJCVXRpdXdBUDRUb2gzOXY4bFVyS2kvOVdkRnZU?=
 =?utf-8?B?T3B3ZHZ6SWU5VkxNUk9OSXhtbkhOdG8reG5KbXU5RGVSZkxraFgzZ3BlbTRj?=
 =?utf-8?B?bVZNMWQwayt3UmQwTjVvQ3RjQjVSSUhkZHEyc2d6VUY3RFo1Z3A1T2QzaFp0?=
 =?utf-8?B?cUtHQzc5bVMzalJxSExYdjZwcEFYUjNzbXZlNHN5Ti9ZY2dpTU16bmE4cVlQ?=
 =?utf-8?B?dXR4c2lRUklYUVgzcG01UDRTTVNnQ3pOT2dXQW94THBhbkpMd0RNVzlZME9D?=
 =?utf-8?B?QW5oK1B5TjArZWFUZldhKzd0cUUzVHBrM1RWWkc4NS84QyszNW5hNUwrbFVV?=
 =?utf-8?B?MmVKemVLUGRrVjFZVG9abHA1cThubmdWM2JBVk5HTEVFOGx6STFCbzl5QVZs?=
 =?utf-8?B?KzF6ODI3dG1NYUZvbHlTMWZXREtPUmNzcjlOay9WTyt6azN2Q1lKZGJLMWQw?=
 =?utf-8?B?bEJ4L0F3Tllzb0dDSWdTRjlvLzlKRm1kN2Fidk0rRjZzcWxWcW05QnJaNWgv?=
 =?utf-8?B?QWpRRTlHT2pkenZSckI1VUQ3SUNxM0FOL3F5eWZDa2lYcE84d0xweTNGc1Ew?=
 =?utf-8?B?WmxKYXdJUi9sNWFUQ3M0cUNnNHltWDhDREJXMDBEVzRpZE9PcjV4WW9ja1Jo?=
 =?utf-8?B?Tk1vdWM1aW5Gam5tNlMxUEk5cElWZGVmUEx5QlVMaUdJWmhhdElhQXByQ2Ro?=
 =?utf-8?B?UnBqQ0RLUEQ3YXZEM0hQaVl1TU1qUnExd1BDc1JSMWswTWpVQ1BBTkNlYXdT?=
 =?utf-8?B?MG5IZTZpRmxzN3MycVNMK2wyMzVlLyswRjN3SzFoanlNZnpwUWYvRDhrQ3pD?=
 =?utf-8?B?UzNPakVVS1pMSXVzb2NYMWlhcFdBNEd0eHlMdFkrQXJJcytNa1p2MU1lTVU5?=
 =?utf-8?B?L2pVYmJlaTBGZ3dhWWZuNncweUU4VHJKTnZjbVZKNHVIRGxkOXVZR2dkT3BY?=
 =?utf-8?B?elZWaDdtb3ZIVDAvYzdWQWF0MjNPeDFVUDE3MC9SbVIzSkI2U0JZRnh3YnpM?=
 =?utf-8?B?WURtWGljRlRtRDhCMk1VaXFSRXJ2NUszRDViM1VTL2pWTEFHWUc1bXcza2pl?=
 =?utf-8?B?MVl0dDFxNlJSb2t3RzRPdHQzRXZrSlJWQnkyVHlaSnNUeWROWEVGcGhWbC9G?=
 =?utf-8?B?dUw4NzlKZ09lODE1Q1NBaDlHSWNWRGpobC8zZ25iUEVsajVJLzFnTXB5dGcw?=
 =?utf-8?B?T3cwejBWaTA3UnFoVlV6S0dRZHpRZ0I5UDViWlJMelVVcUY3UXJ2dFZQUzZ4?=
 =?utf-8?B?SUFQc2ozOEcwbHVqeExWSjJVSE1PbHRxd1l3K2Z5UDFYdUNVMThObmFvbXkw?=
 =?utf-8?B?Uzk4NVM4b2NGanVFTmhRTERkWW5YUTZtWTZNS1NjbVNRV2N2b0RjZ2t0aXRQ?=
 =?utf-8?B?MG80WGFYNk5zVWhsanBLODh6eVppeHFVS3ZDMlc3VlhLZWhDRkdMNEJnUllI?=
 =?utf-8?B?ZWxpcUY4Wll2SUdtSFRPZWlWME5tVThzc3hwOE42NUhOajNhcVJLeEVwRVdP?=
 =?utf-8?B?UnpHRWVac2NzYmlqNDdvVHpMQU9Cb1JmeVp0ajJHMmlqZlFUYlBoeUdGNUlv?=
 =?utf-8?B?d2t4TXZLa3VQMmdPOTl2VjU3N3FmaEN5SHdoZ2dHMTZxSGxqdVg4TTI1SGVV?=
 =?utf-8?B?bmNQTzM1WUFWdExIOXhLS1hmbnkxcHhRZ3BKT3JpbnVFY0l6aDVwb3doQTMx?=
 =?utf-8?B?VWxFZGhCWU9iWnFlV2d2T3VwaUt6ZFVnVnNNMW9sdzd1M1FvMjlsZTdSY25h?=
 =?utf-8?B?aU04U2VRcE4rRUVDcktrQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cS85V3EwMXBONFJTWXV2MjhjalYvb0VCQnkwbk01b0diZ1JVOXkvSXJ1RFN1?=
 =?utf-8?B?TkdWZ0tHSHNEbDZWcER5WE9UUGdBR3VPNzNoQVVYYUJVQXhOMWtHNE5USXB2?=
 =?utf-8?B?cFlmSEY2L2hUdStjaXhNZEV4Q2N2dkdNajBUMW8yMzdWQlE3VUtVVHVKcmRi?=
 =?utf-8?B?Qi8zejVrRlpQcVN4VEZUWE9vRGZCT3BuR3I0TUUvSlpWbXRQMTJ3dWR3TXEx?=
 =?utf-8?B?TnFabjdiT2VrWkI2SXVXRkZ6ZWRUY0Q2V3NaNnpXdkpEaFVMOUV5cHBSdm5H?=
 =?utf-8?B?K2piQ2wxUytuNTM5NXZpOUFncGFvcFJpNm9DYWQ4M245cm11dlNQeU5aMzIr?=
 =?utf-8?B?enF3em5pR2h6a250RUpERmRicTdiZForWEd4ZnM0ZWlSaXJlTk9mQjMrek0y?=
 =?utf-8?B?NUlPNmhkUyszUmFPcnBLUUVpbnltZ2N1M3JVY2pDSGsrMXNBaElaZFFWRGI1?=
 =?utf-8?B?RmFRKzUzMnpycURuRXFXcHI0bERFd1FySW9ONUljQVd5YytDTGhBWjlwMjBk?=
 =?utf-8?B?U0FjME5PY1g0YlpDa3pqNy85cEN1RWRFOTFFaFplV0RzalBRRzc2Z1lvYUFG?=
 =?utf-8?B?eUZKV2Vka2FDcTZpb2J4ZlRDY2VvM0lSVTZubWtReGJjYm9VT3V2TkpEbzF2?=
 =?utf-8?B?UkMyWXJxcTQxa1VuSXRTai9IeU4xZXZMb2crMU9vdUNrMFVCeE42U0xXVVoz?=
 =?utf-8?B?c2hTM1hMNzgrUnF6VlVud2RxOEI2TDlReDBLL0NvR3pFTWVYcWZrTDhZM2Jq?=
 =?utf-8?B?dklGNitaUXZmVUlHZExIM2J6cHdqOGRyYXE2VDZSRjB3T3IzUnVGdWRUMW5G?=
 =?utf-8?B?dkZpT1Q1Y1hVVEtXMHlWUHdveVRGNkhIdSs5cDlqalhZbXRKcXRHNkxwTWxV?=
 =?utf-8?B?eFZCZzFXakZxcTFydTJ6d1FLdi9CanYzTitnQ2hMakpZSjB1Wjcra2lvWmZK?=
 =?utf-8?B?OE84VHRUTTlwQTFDbUlqa1E3V3FFL0JBb00rMjF0VkRndERRZFpLNzR0TVJV?=
 =?utf-8?B?bm5RV0VHVFZwVGNpRVNXZjV1QnFNcjJqNDBHaWpxVVE1d2hpRHR6R25tY3po?=
 =?utf-8?B?bTRDdVJlVGg5SjJZVnZpM25BU0lMTWhBR09udkR4ZFFIMVhWays0UXNmQUhC?=
 =?utf-8?B?UllIMHNRbW40dmJkMndpNi9JR29YVXRld1hxazV2RVZpMERnTUNrZ3FRVEZh?=
 =?utf-8?B?TUgzTFFiNmhxdXpGTTBOS3dXbE5WSGVDVzl5Z2oyMWhvMEc2RFoxcTAya0o5?=
 =?utf-8?B?b2JyNjlEaGpxQ3BGeWZsSTZUZFpkRE5pSlllYUgxOEFqRmxtVm9nUys2TE4y?=
 =?utf-8?B?RlNUeGd1UUtCYUtxK3JkQ2p0RXY2MGdIakhRU3lta29hdG9oMmRORjRUK3lC?=
 =?utf-8?B?dTlRWWdIbzVnZG45aTBjY3BhbmhYblloZWpXd1FxK2FSUjZrNmhISFdDdDQ3?=
 =?utf-8?B?dVJuTWNRUHFGSVAxRDFVOWJveU80SXhtUi9NK3crMDdidG5pRU0yQW5OQ2U5?=
 =?utf-8?B?T1FBdnR2RXhvdXJOa2xuYW1JZUJzU0cwWHdhd0NnMy92bmdMNGl5TzNKMWg2?=
 =?utf-8?B?L2REUk5udDJ6bHl5OU1LRDczZFU2bnFOV2dDbHQrT28xdHFKck5jeGlaL1pV?=
 =?utf-8?B?RGhZMVh3aUtJdTZROUQxRSthaU5mVnIreGNjUjJNNVdKNC9wRmV3YTIrQVJM?=
 =?utf-8?Q?OlrP1dV+AQuQS/QluZ1b?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-a1430.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 050c4722-8113-45c2-0739-08ddb88abc8c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR06MB5604.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 10:33:36.7752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR06MB6827

On 2025-07-01 03:07, Michael Walle wrote:
> On Mon Jun 30, 2025 at 7:50 PM CEST, Jean-Marc Ranger wrote:
>> On 2025-06-30 05:25, Michael Walle wrote:
>>> This seems to be due to the use of the uninitalized "mtd->size".
>>> Could you try the following patch which is based on the latest
>>> next kernel. It replaces mtd->size with nor->params->size, so you
>>> could backport it to 6.6, but maybe it will apply anyway.
>>
>> Thank you so much for taking the time!
>>
>> Your patch applies automatically on 6.6.93, with minimal fuzzing and
>> offset changes. And it fixes the issue! Formally:
>> Tested-by: Jean-Marc Ranger <jmranger@hotmail.com>
> 
> Great. I'll prepare a proper patch shortly.
> 
> But I have to wonder whether this flash is locked by default after
> each power-up or if it's just locked once after it comes out of the
> factory.
> 
> The MX25L12805D datasheet reads:
> 
>    BP3, BP2, BP1, BP0 bits. The Block Protect (BP3, BP2, BP1, BP0)
>    bits, non-volatile bits, indicate the protected area(as defined in
>    table 1) of the device to against the program/erase instruction
>    without hardware protection mode being set.
> 
> Does the bootloader enable the protection bits on each bootup? If
> that's the case be aware that the bits might wear out over time
> depending on how often that device is restarted ;) Likely won't
> happen but it's still not nice if the bootloader fights against what
> linux is doing (or the other way around).

My understanding is that it does. What was written when the same issue 
happened in the OpenWRT 22.03 to 23.05 transition a year ago might 
interest you: [1].

Since we're on the topic of locking bits in Macronix chips, I noticed 
yesterday that OpenWRT carries a small patch from 2021 on that topic: 
[2][3]. No request here, only FYI.

Jean-Marc

[1] https://github.com/openwrt/openwrt/pull/14237
[2] 
https://github.com/openwrt/openwrt/blob/main/target/linux/generic/pending-6.12/498-mtd-spi-nor-locking-support-for-MX25L6405D.patch
[3] 
https://github.com/openwrt/openwrt/blob/main/target/linux/generic/pending-6.6/498-mtd-spi-nor-locking-support-for-MX25L6405D.patch

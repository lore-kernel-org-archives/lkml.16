Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2121.outbound.protection.outlook.com [40.107.117.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74CC21B18C;
	Thu, 10 Apr 2025 11:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744283571; cv=fail; b=d4rpM3uSraksV6IbOYX5Mlw6jyfaxFW2s7YK7eSc1fplTWWD/W8FjVwl7LyOMgcvtpsyGivCTC7ZT/c4OfpUOps/syT9smwWCVS6+kWmD2fIZswIBNMAWR87sZae7cRTlbcz/9lmUt/Y+e/lHMRIIXxSdKB9ejN5gOoyY66AUuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744283571; c=relaxed/simple;
	bh=ipi8LPKIAdkiPPhYOD5uQLz2HhdEJpzc5siToEqZYls=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fENbkqUCmEMfekm3LhEGZHtC35JsgMXRO8v/D77QRKVBSFqAn4NfZb4eXPhC0NNZWYDOH4vY4qeqrf2gQpzGc/RPq0H4fYNAQGoBiYCKt1FZ7r4q/zZFlP+yhWskW5ng8uA1X1xJdzv8BTG3Q+RDJr4xQri44VSxQqPmR7KTjco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=f1gt/eNI; arc=fail smtp.client-ip=40.107.117.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="f1gt/eNI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIW/KKbtPr4jr2yTac3Hi3qUITgklnmaCv1cN+1mPbOceeOw5UJFrsQzka1+8sHRrjeX4dJRiinc7PQ7UB4IPHk/rhxdUlypqPAjE/jAY8PBC+JhEHtUm5UMh2ueFHWSe/QHwRG19qKRfJtvtSRrurdFCWxn2gpSwMNK65/6puB3bPcpi3Hodaz+JJBywi2xOau7Y294tUUmw87ZbXxdnNeuc3m26fbweVzrK2C1xAPZh736gvppiRl1kE4GKeYIjH7mF6KE9cc8dKU24hV+v7sCsTwCKzP7Hrtp7yPrrtxPWfS29l0AOmYKhz/NxJFKRG6iqmPwVr5dvyweOBQlzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2j3if/X9DyCFCttqaT4bbKcYqmyAzXbXpDn57XNUXnw=;
 b=rRvWEqXSggTC9usq+ILUaMZh8+iTUZ5RPnkBKrWWwoi9GbiA74OCzm3L9IIxxQG0+Oquxzt1bTQAUnHVEyRErDTWZwLDWboo2jwta73fiGcnoHf4IEN/pLK86VLxxehy57S1VbLL4y/YPtIG4lPf6GVxSTIwJZ3ACuWS0Mu+AtE7h6pHV6oPJP+Dml/8IBTsGFwrRTOabwI0uKT/ltMnRUsddNQtenl8rJQJJha4U/LRFPZnlonRkC/BbJmwA57AnIf6ocZ+pAJUAtJzmRvtv60YZ7UBwSWtSrWzIV6elvVpjTUL6JRhB2G6qDALBR1V9UNgAAD7YwyyGbEBzeQxWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2j3if/X9DyCFCttqaT4bbKcYqmyAzXbXpDn57XNUXnw=;
 b=f1gt/eNIxdjLw/8KbFANUKzROmH31AEjW+J1cgshkPvwCl7YS4tA0iPvuglB1t/X4m9mLRm5runpAqUTpSqeeJs2gq0F3Te2w0HTjFVvidpTdwkiuHGYbOu1coXRx2mnI6rmlgFhTwORYKMIKvyk1PSg7CroL2qxoAXYlwOFeMKIVuQm+xkc/y0hREdk+7eizOOCc47QTw09G+ayCORy6+6gIDfZ3v6mCtt7r0oA2DsvbJ11BSlxRNTiZn5KiEah00Jf/aZ+Id91G3EnGfPsMAckMnybrXOrAWEyECG8dFZZjfA65HEhNLNIdCgoZoHon7XiHYNi/d3Pf0N7Pwy/RQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by SEYPR06MB5040.apcprd06.prod.outlook.com (2603:1096:101:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 10 Apr
 2025 11:12:43 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%5]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 11:12:42 +0000
Message-ID: <b69e7752-abf1-4f8f-8a90-e62378c84252@portwell.com.tw>
Date: Thu, 10 Apr 2025 19:12:41 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: Re: [PATCH] platform/x86: portwell-ec: Add GPIO and WDT driver for
 Portwell EC
To: ilpo.jarvinen@linux.intel.com
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, jay.chen@canonical.com,
 jesse.huang@portwell.com.tw
References: <3ec9d070-2d2a-45ff-af78-923ff1628c08@portwell.com.tw>
 <ae9e7c27-e5b0-b431-2811-c5d8d3549e43@linux.intel.com>
 <b326ed0d-0917-4361-8093-abc9afc65533@portwell.com.tw>
Content-Language: en-US
In-Reply-To: <b326ed0d-0917-4361-8093-abc9afc65533@portwell.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0014.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::20) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|SEYPR06MB5040:EE_
X-MS-Office365-Filtering-Correlation-Id: a1d0c276-d43e-4416-b51d-08dd78209d20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bE5JS1BzSnJEcWxDV0JyOXVkZ09TS3ZWRUp4TW81UjdiOWVkNXVTc3BteHJH?=
 =?utf-8?B?Z0xCd1R6NTJNcU1LUEpHVzZld1IyN1V2ZVphRW8vTEgxdDN6MFZYeTNya3J1?=
 =?utf-8?B?V3k3K2VDM2w0bUExK1MrVW1rNHBoY05hdWhWQTJzaGNETnpzWWFlZGRRbG9O?=
 =?utf-8?B?empRSVBRTDh4SU95ekh6WGdaQ1poRWRNTEQyZnpJMXpUV3RJM2h4aEF2WEFl?=
 =?utf-8?B?RnQ2ZXRBZEt4ekswWnVPdjU3SjQ4eUgxbU9LWDgwZEhXWjhNTFhRbWxwbWc0?=
 =?utf-8?B?MlI3OW8vdTFKaW13QmdzdkF4TE1rRGxZR2x3dmdkTUMrUDg3TFpQdEpGVlV6?=
 =?utf-8?B?cyt4bGxIdkY4bFBwZmVLMWE4aWJGRVFmU2Y5RnZhdysxbVIxZ0RSc1lzN2I1?=
 =?utf-8?B?TERGQWk3OEJrSUd5RGdvL2FoRlhpR2F4SW53QmFZN0NERER1VDV3c0Vsenc3?=
 =?utf-8?B?UGZZYUwrTGRGdFdUdjFLSXVHL05CNDdhU0ZwZHh4QkdjdVVSVzg1MStKc1F4?=
 =?utf-8?B?am5IVkY0c3A5cG1qbFVRYXFhcDRncHMzRnlKWHFwSGczeEhjMkh2aCtMOEdZ?=
 =?utf-8?B?WVk5aFFvUFNaU2F0STdXeXRFMWVRRlNFbGNYTnZJRjhzeDVlRmVsalM5aHlw?=
 =?utf-8?B?NElXRkRoL08xMGN5U1dxcXV2bEtDL1Axc0Z2SVY4ckU4a013bXhqZ2VoMVlM?=
 =?utf-8?B?cHdLcUlkUDhNS1ppMkRIbE1hMldTTVNvekpXamVuc29wOHNjb3p5c2Iyelgv?=
 =?utf-8?B?MjhTZzBTZXppb3lqc0pIemtZejlZazhRQnpYNEloVmpaMjd5RzhJaGJQOWYr?=
 =?utf-8?B?aER2ZFhYTFdXR1V3dTgzcy9zbVBMVzNkckNMVU13RGdiS0l0cjlET3hDS3Ur?=
 =?utf-8?B?eXJkRDRPN3c4Z0p2di9kdHQ3WTdWRURzTEs1QUJIZFgvMUR0bVk1d09kNnJG?=
 =?utf-8?B?UzFGZ3IrTklPRy8wa29HbTNDelczUCs4UXlOZWNUYmZzRmFNYmJBQVNUNjZU?=
 =?utf-8?B?VVVpVTl1eEtyUU8rUlYvOGMrSlFMZjZZR3RhTkgreDNNY3ZVTWRHdmxwdkV3?=
 =?utf-8?B?eU1FR1Q5UnMxSyt4ZUZFTk5tNkZ4WTArdlhHTWJUeGxHQTZpbHBCSkcvSGdH?=
 =?utf-8?B?MEI5ZHYxRXJjTnVxb3YvdWJya1VCR1d2ZkgrekJhSmJVZyt6ZHh2d2FnSmp2?=
 =?utf-8?B?c1AwQUN2YXorckJyRi8xZXNVMzlmcm9MQnZpUVRNZ2pWUk1FZEpubjlKWkZu?=
 =?utf-8?B?L2ZER3ZLSXZJQm5MbnN0YUJMaFdVWSs5UEZFQkhPa25mZ3ppeXZJMlU3TEJp?=
 =?utf-8?B?ZXZKRnNOMUVtcitSMzVnMTB2YkU5em42WXNLb1BHajliQS94RjBKRWdINGJT?=
 =?utf-8?B?bHl4RXdIcC8zRnJSS0VIL0FVNFpiemVKcitYb29NZ2toTlRtYnpLd3VKd0tC?=
 =?utf-8?B?RWJCenBVTmkza2tCU1NOQjNibmtkSFZ1RG8zWWVsQjBYYVEwbWw5SldyUnRp?=
 =?utf-8?B?eDQwMGdyQWUydHhoR3RSWEF6RnZYZXhXQTZxdEQyTk5OSXBuZmdRVzBBU2lV?=
 =?utf-8?B?eGlvbmNFdXlnTXpJQlJUTVJTcEhGTjZXZk5xWk9EMmRrRU1peGJEVWxwcDQ0?=
 =?utf-8?B?ZU5WUnlhS2xxYjg4c1JHK0pwQ0lPQmppN0RRbGZFdHUrZExPVGdyV2QwMTRF?=
 =?utf-8?B?U3hXQmtzWks4Q1d1SHV0QytTUFc3emxGMkdxSEV0UVFxbjZEdDNMWjZsR1Qz?=
 =?utf-8?B?a1hzL3MwQllTYnh3UGt1cGZ1K2tPWHNYY2hFNFdQc1BVaGV1TFFZUzlGMm5j?=
 =?utf-8?B?L3N6NW9VeFZpcm5YUGxwWFppMVcwVktEU09Xdm9pdktNbzdVYUhyelRGd1dn?=
 =?utf-8?B?bjdkQ1BzN29qZ3Y0b2I1KzI5SDlLanNFeXZZYXZNWTlhR2w2b1MyTE5ibFRQ?=
 =?utf-8?Q?jMO8sJoFnoU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm1Lak1SVThSb1NOZ1JuWHpweWpLU3YwdnBPaVk0OHVWWEpRTGVIdzBNZ3VU?=
 =?utf-8?B?VVZpa21nQU9jRTdRdXFmSHgvaCtURlE2d1FBVGRCckFVMDk1a3NMMHdpaVNG?=
 =?utf-8?B?aEZUOENpL3VGTnQ1M3VmVCtSOGQzTDZBUi9UcVkydkJOY0xvOXNiQ2tGVVp6?=
 =?utf-8?B?R0V6aVY3UVAxdVM3cVMwWExmWWErK2FsbVpWblZhaGpUbVNhcGhyVTVvUkt1?=
 =?utf-8?B?VkpHNDNQL2llUW82TzY2YkhxZ2RSNkN6Mnc4V2E1NVR6VVZKNFZINkt1UEl4?=
 =?utf-8?B?Y2YreDlVVStOQW9JeU83VTRabDJWK2dSWXlVTEYzSGEyaTBBOWdIVjVXYXVS?=
 =?utf-8?B?aDcyOUtWSkNGMXdtVFQrbm1KQ2d3T3FhVDdkNXlMcGZrLzkvZXc3bDFEZ1RW?=
 =?utf-8?B?Q2lXUWdvazF3V1hnTW5uZUxKUlhiZDY4d1ZJN0dadnhKTnhrTnhZQ2VLdE9H?=
 =?utf-8?B?eFp3ME5DZExRZjU0VGdNYWp4OXI4MHFNeTdJYjBXOEtmcVNSV2Noalp2VGR1?=
 =?utf-8?B?dVZBMSt6SnptTGJrZ2laeGJLakdPOTlPYkZEQkZkL1Y0N3FzRUdiZWtJUkpt?=
 =?utf-8?B?V3NvcGJHYlFVdnhDMDBzYnFyUVgxMHlvTEQvbkVubTdId0tDU1o4bE9pTkdV?=
 =?utf-8?B?ajMxNCtldHQyTkxBUjRvVzMrMXp5ZEE5WHVOY3k0bmFQcGtrQ1RTNVhxYjg0?=
 =?utf-8?B?RExGeThna0d4YmdVcTNTTEpzN2dmMnlURGNVdmFMWHd3cWlLd2NiKzdxb29X?=
 =?utf-8?B?bTMrVGl0Q2VxWUNyU3p4LzFNQk9UTkdscnFLYnlkL05RYzBMN2lqbnlSeXpT?=
 =?utf-8?B?L2VmRGhLQmdDWlJRZERxdHJ5TW9CemM1c0dpa1U0dFZjVVo2Qjd4VlNSemRa?=
 =?utf-8?B?RWJTT1BTM05UdUdIRzBhekdrM20ySTZIck9BZzBQUnVPcUhuck8rbFNFckVo?=
 =?utf-8?B?OWQ2YUF6eHNteFEwVUhlbzIydkJ0UEJoOGl2QjJDcDZkVC9aV2xJWHNTbWRR?=
 =?utf-8?B?ZTUvQ3o4M0tYRi9XRy93WDBCTWdLSWNrR3haSTcxTVZyS2xzdW9DSXpyeGxp?=
 =?utf-8?B?Z2NvWWNlRXcxL0ZhTGw5Vmd2NWJHRElpcHJoSzBvNEhMaHlCMjdoVUhEc08r?=
 =?utf-8?B?ZW80c0krSkhCOGduenJ2MXRUWktsb0JtNjQ5ZzBDOVhqUkw0WnRFT21oY0VE?=
 =?utf-8?B?QVF3ODlnZGVubGNnMXpzRHlTd2tQWkxYcHpqME9KVzY2WFZZUFlCTS9OQllK?=
 =?utf-8?B?S1NRcFlHTzg4V3M5YmN4dFcwcjBVTHJydlN3bDJHckRLTFhMQUdtS2J3UGNM?=
 =?utf-8?B?NzhnV2M1d01SK1F4Z2xTRXlueTFFRU5ZWkNaVVhjN1d4TGJPM2J2elZQazRj?=
 =?utf-8?B?TGQ2eVlJMFBJd0E3UDM2MUF6cVRrbkdmU0dpeEhIbXNVTFdyajNXZm92SDhF?=
 =?utf-8?B?SmtFVmFCRDh5Y3UwN3FXbnNaZWc3VmlHWWxSVVNKK2lwL2dDZDM0ZWlmT2pZ?=
 =?utf-8?B?Y2tGQnVuSkdnN3FGUkxMYnJZcW9aa0lhaDJaSS85TXpsOWplWTRESXBSeldn?=
 =?utf-8?B?RlJPMlcwdllOd3lrK0V0V2FzaGg0alVLWTJpMnlmNkNGZ0pmQnc5ODllYldr?=
 =?utf-8?B?dm1wMWpPb09RRXZxeTlRUmlDV2w0NStqSUxPUXZoTHFzbUdGZDRiUlRaL1cw?=
 =?utf-8?B?S2E2S3dhMTRsVzZ5US8rS1JqSkkzT0hXTWxIK25HUm5aeXpYNXB1Z0pFVWdY?=
 =?utf-8?B?anBLQUl2cEZHSFE4cWhoNHFEK2N0THgzbHY4MzlrT3QrRlYySitEUHZ1VFln?=
 =?utf-8?B?ZXJXT1Q3SjJvZVNpblFPR3FRa1drWHNxVHBTSGllU00yK21GM1JvWHRUV1h4?=
 =?utf-8?B?Zmc5ekhxYXA5d25uU3pTSk1QcDNGbjV5cDRvYUFrQjRTM3Z3U0czaTM2SFU0?=
 =?utf-8?B?Y3lIdjJpSGlrcTVpazFGY2E1R0R6cVZUZGRoSm9UYm9FR0x5Q2JldlRYWEQ4?=
 =?utf-8?B?UmpWOFBYZURkaDMzaEg0QmhTZXdad1dxaEpOQUFOU2NZU0RTQVEzckpqaVgv?=
 =?utf-8?B?bWJrRGpEY3Rscm9xd3o5QStmQlVWY1VaK0lxallQaGNDR3VHdGxjMXJCSW9u?=
 =?utf-8?B?V0RDMHozWkxGVmRPV2Y2V1ZPMWxCeVpRTFBHU1JMakhvY2JIa1Z2Q3BBVUpj?=
 =?utf-8?B?NVE9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d0c276-d43e-4416-b51d-08dd78209d20
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 11:12:42.8985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WVZ4xiinsnAcM9B44VlUUZ1WhmR+PYyeAh3gLAWZgpayku7oASsXOlaLA9eiNzP75bRPjilkziCMiKGzKsikbalnOrsoI3VhZiXEOej8XQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5040

Hi Ilpo,

Resend this reply due to encoding issue in the previous message.

Thank you for the review.

On Thu, 3 Apr 2025, Ilpo Jarvinen wrote:
> On Thu, 3 Apr 2025, Yen-Chi Huang wrote:
>
> Please add watchdog drivers people/lists from MAINTAINERS file into the 
> next submission.

Will add GPIO and watchdog driver maintainers/lists in PATCH v2.

>> +static u8 pwec_read(u8 address)
>> +{
>> +	return inb(PORTWELL_EC_IOSPACE + address);
>
> IIRC, CONFIG_HAS_IOPORT is these days required for iob/outb() so you 
> should add depends on HAS_IOPORT into Kconfig.

Fixed by adding `depends on HAS_IOPORT` to Kconfig in PATCH v2.

>> +static int pwec_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
>> +{
>> +	return (pwec_read(PORTWELL_GPIO_DIR_REG) & (1 << offset))
>> +			? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
>
> Please move ? to the preceeding line
>
> I'd add a local variable for the read result to make this more readable.
Fixed by rewriting this using a local variable and `if...else` in PATCH v2.

>> +static int pwec_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +	/* Changing direction causes issues on some boards, so it's disabled for now. */
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static int pwec_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
>> +{
>> +	/* Changing direction causes issues on some boards, so it's disabled for now. */
>
> Perhaps just one comment above both functions would suffice. The functions 
> are right after another so it seems overkill to have the same comment for 
> both.

Fixed by combining the comments into one above both functions in PATCH v2.

>> +static int pwec_wdt_start(struct watchdog_device *wdd)
>> +{
>> +	int retry = 10;
>> +	u8 timeout;
>> +
>> +	do {
>> +		pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, wdd->timeout);
>> +		pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, 0x01); // WDTCFG[1:0]=01
>
> Please use named defines and FIELD_PREP() instead of comments.

Fixed by defining `PORTWELL_WDT_CONFIG_ENABLE` and `PORTWELL_WDT_CONFIG_DISABLE`,  
and replacing the hardcoded value with named constants in PATCH v2.  
>> +	do {
>> +		pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, wdd->timeout);
>> +		pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, 0x01); // WDTCFG[1:0]=01
>> +		timeout = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
>> +		retry--;
>> +	} while (timeout != wdd->timeout && retry > 0);
>> +	return (retry > 0) ? 0 : -EIO;
>
> Duplicated code.

Fixed by reusing `pwec_wdt_trigger()` from `pwec_wdt_start()` to eliminate duplication in PATCH v2.

>> +static int __init pwec_init(void)
>> +{
>> +	int result;
>> +
>> +	result = pwec_firmware_vendor_check();
>
> So this goes immediately to poke some io ports? On any x86 machine?
> The cases should be narrowed down first with dmi matching.

Will add `dmi_check_system()` to limit EC access to supported platforms in PATCH v2.

The following style and formatting issues were also pointed out and have been fixed:
- Removed extra blank line in the file header comment block
- Sorted header includes
- Fixed missing blank lines before section headers (3 instances)
- Fixed 4 spacing issues around '+' operators
- Removed 7 `pr_info()` calls from success paths

Appreciate your detailed review. it was very helpful.

Best Regards,
Yen-Chi Huang


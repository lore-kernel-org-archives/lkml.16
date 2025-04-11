Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2137.outbound.protection.outlook.com [40.107.212.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121B522338;
	Fri, 11 Apr 2025 03:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744342067; cv=fail; b=W11bT1cAuMjbXW4K0FpvJkJwax1a/bUPHiqGpuRXlPqfDjd5PJHEmbKikrpzWMtEMycqZ1KmmhLZYs6b74ll2B/wqO3g74kTqCzTKCZVHns1DhtpZSOgd3Fgfpengz380l/lC+gvYITB2xo3vgp0Tv+6LFbfYB31PJmwJZ+CIDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744342067; c=relaxed/simple;
	bh=MzN1eSIVj8IAWiceALmI5C5WO6BfNntcg582znkMtDA=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=aTxX3PdDPdNZ32jZ+s7/5nQ6R+8cxgYEkE7wellAyUjTyp4a3mvGpJuFGl0W6o/YEJmBvXZTFFpIANA08NPDXPFBTdEAcifRgZpTs4puGNxtCTXFr02EIDKfLGuZyU5ZSeYqJAshz6dGWJTEoPxDgls9fAbYcqjfcwlWx3mGCUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=Z3yqB9Rj; arc=fail smtp.client-ip=40.107.212.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="Z3yqB9Rj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CiyH16HfFgsznkZSzV6QNG9U8m4xXl0vqw1n8u8yjELaw4Jp2Rqa4S/6zSzM93OKIbCu7VfPe3wij0i9AifGdeQpzNpTVAL35axRoDKSQF03cPFwndUzWOmKlhIFJTcZ2LdyqvSvoxr2uesVd16tvf0U1oIkzBD8FHG5zvji1kKwSa3gfLYsL9jzifoJBYNWnsDImp32SpQiysh78LlCbURa4dDwUDshSOu7NMvaw1AfUs2w08hByhTmMZRbco8wTwIpO3Q3WuyAnFZJ7KXBr8jEvjo9LaaAxIfCQ9bTo4EHVzQ/Jj55jvK4NDjgbTesJHWub50wRPupDM1XG7y5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoyVwhPkWvOwqeS6n7F5XnG19gtGWbdBJ6OhY3pVIZ4=;
 b=aTpGpaDCPzpp/pH8cjhZamOiLz/Oz7VqNXGuAfTmYnSUsulPJCZ16WrbOZutO+VmJoxa+Ial0uA3zlzYlP2BsNwi3HvPPSrc26KAsKGif+di8XAZ+L1jm9eWJOgTG1Dk0xErmEyXSAyB5ENAleMKJ6FbpbkX9n2wc12ouQElb0CVTm+SvWkUyXrzlDlfcrTDXQuiRp6CSW8ZJhb4LBWYaXUnHAJVjVSuO2kPBevO+oFqcj3WW1sk4puwles/EbaAPmMMPxLHOj6XEQyPBIDMRrU5Ghl6786kgWzDABMSgJ1SngrIYdBEesH2wNrxnznhIHaopES3fsVi/po7HuM2Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoyVwhPkWvOwqeS6n7F5XnG19gtGWbdBJ6OhY3pVIZ4=;
 b=Z3yqB9RjIO9VOsxnoo68FBCRU8eSfADuMfkM94pNiMffvgwvPxGaqWK7FG+4yXVW36JyomQU1lMNgSMAoak5lepHsiCKgSUttcBPhTGG1j3dl+d+sfEIswQvIpZJNOAthLIA8+v55b7vWdQ4dTjm+WRkvrwE7G5BAkLEk/gXmlg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
Received: from PH0PR14MB4360.namprd14.prod.outlook.com (2603:10b6:510:26::18)
 by PH0PR14MB6655.namprd14.prod.outlook.com (2603:10b6:510:291::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 03:27:41 +0000
Received: from PH0PR14MB4360.namprd14.prod.outlook.com
 ([fe80::f91d:52ba:8284:3e02]) by PH0PR14MB4360.namprd14.prod.outlook.com
 ([fe80::f91d:52ba:8284:3e02%6]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 03:27:41 +0000
From: Chance Yang <chance.yang@kneron.us>
Date: Fri, 11 Apr 2025 11:27:33 +0800
Subject: [PATCH] usb: common: usb-conn-gpio: use a unique names for usb
 connector devices
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-work-next-v1-1-93c4b95ee6c1@kneron.us>
X-B4-Tracking: v=1; b=H4sIACSM+GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0ND3fL8omzdvNSKEt0UC0NzcwvzFDPjNCMloPqCotS0zAqwWdGxtbU
 A2ytCNFsAAAA=
X-Change-ID: 20250411-work-next-d817787d63f2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 morgan.chang@kneron.us, Chance Yang <chance.yang@kneron.us>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2154; i=chance.yang@kneron.us;
 h=from:subject:message-id; bh=MzN1eSIVj8IAWiceALmI5C5WO6BfNntcg582znkMtDA=;
 b=owGbwMvMwCVmsuR+7eedxj8YT6slMaT/6NFkvlPK/fixqtJyHZW5Qc9fMH4WNH/aFf5YSli34
 rN00Hb3jlIWBjEuBlkxRZbP2Ur7vVua59260rMfZg4rE8gQBi5OAZiI6lxGhpec4bduTI/V0iyt
 KRGq7LQM1/R/tSFy096uqjpxd95Cb0aGW/Mfvl/B+FUvd0v+7Z33t7DLcGiuPRDGXRyoyienL5r
 ODQA=
X-Developer-Key: i=chance.yang@kneron.us; a=openpgp;
 fpr=F36B22BF4B84839EDAD48CBF34A4DF7DF3B933F8
X-ClientProxiedBy: TPYP295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::18) To PH0PR14MB4360.namprd14.prod.outlook.com
 (2603:10b6:510:26::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR14MB4360:EE_|PH0PR14MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: ba5d625d-9f9c-4cfe-2109-08dd78a8d10f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|80162021;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFVMSlFTK2wwdzhSTkhSMWlWSlBXWUtZL0lheTJxWm5LeUxRSFBCYUZxSEhX?=
 =?utf-8?B?dzg4SUdhVzNxMWV2Q0QzOFpKWFlWMWNiVEowRXJ5VmtPbnNwWkY2UmdXYjZC?=
 =?utf-8?B?aTZNRzFBRE16N29mRW5leHV5TVR5bm5YaEhnSlNGMm1VT3pmWDZRVENBMFJD?=
 =?utf-8?B?b0lsZ1FobWZGbThDRlFsblYxY3QyOEVFaGY5aHlZNEg5c0UxRFg1amdMSVhN?=
 =?utf-8?B?MzN2K3c2ZWYyQlpOaHNsZ3p3bWlxUFExRFlmS2dQWWRkTHZpa0o5OXIwYnFK?=
 =?utf-8?B?SEdsd2ROeU1yWktpcWU1UTAxMDRLakJGRlkzZWpqYXYwYnczQ2xabG1qc0pk?=
 =?utf-8?B?eU1UYnMrMWkxY29kRjBIVUZ1VzNHRGk5ajgwUVJwZklYcGpZREZpNWVoUE5C?=
 =?utf-8?B?NjdBNG9jYlZteHB0KzErNEFYTEtuVG1ndHViODZ3cG03WVdTUDR6Z2tlQzJo?=
 =?utf-8?B?VmMyTEJWLzNmYnZqdHRncUJ3N3NjbFYxcHM1alNuTmY4RWxUTWhDalVsczA5?=
 =?utf-8?B?QXkxTVgyaHlpOWlKSVZpemFVSlpYbFdKWElHRkV0T05icEM1ZnEzdzFOVVBU?=
 =?utf-8?B?NmprWWwwWWJ5NHBXRWJlTlBSczBLemE0OHVadXI5Qk1GWGpWVDVrbHdla01j?=
 =?utf-8?B?NnpTd1VMRGtZNjcxRWRSbTV5UmY4bnU4TGJDQmpRbXpDaUZ3eGlsaDJMU1g1?=
 =?utf-8?B?djJaU3NiY2hncmtGSXAraHQxd1ovNiswOUdEVlk4ZVNwWVdTTGNCa2FwYysw?=
 =?utf-8?B?RVFIMWNpVDBhM1RjeDkyYm40RnpoTnZac2VMcUNNb1BkYnJHS2tRRHBZQXQ0?=
 =?utf-8?B?NkpHakFqZHRLVG9CV09hZ2g1L21TSUQxQ1I0Ykp2TUFDVkgwZnN6R1RVNS9V?=
 =?utf-8?B?NEcvTHh5YkJtam1DeGN2U3NKcmtIenNxd2tDY3MwdERRS0F5cnFKRU1HVkFj?=
 =?utf-8?B?NytLZG51cllBVVNHUlZpTTlST25kVVp0YXpGK3FmT1dKdW1MNEJJUHByTHBK?=
 =?utf-8?B?Zi8wS0lYajB5eDZWVGROc1NpZnN0N3JEMmFlQWtndXBXaE5aa0tGZHNEdU95?=
 =?utf-8?B?L1NzMHlLdGh3dEtPemZGSmhjeUY1eEM3ZWR0Tk5HUE1PekM5S1dHRE15czJX?=
 =?utf-8?B?UlpXaUp2YVM5U2dkUExqTm5FZlNHRktjL052eWpCcWhEQ3VTYis5WkFKY0Jj?=
 =?utf-8?B?WjRTamVhbDVkODZGVm4yTVdUZzFINTI0L0xxQThza0haTEpXZUJUOUFYa0FR?=
 =?utf-8?B?cU1KTmZoV0hLV0kvRHB5ZWJ5ZkVKNzRKNmNSelZMTkRTYUFWc0hzdTNtdTV3?=
 =?utf-8?B?dnNrbEx5RktFaVFweS9KRmNyRExxRGdMamkzdkg5WFJBMEV5bGgxUzJQNXFE?=
 =?utf-8?B?d3hVOGxuWlBqcml3OGhFbWRpSEw4aEpkRU1KZWlmYm5nNEJRR25ueDg1dnI0?=
 =?utf-8?B?aW1sQTNuK2dVTkNjMVBLOCswRVZtY1JOSE5EQi9kbC9mcHFzWmc4UTVYK0o2?=
 =?utf-8?B?NHdYTTQweFR3ZlpWZFY3RCtrZ3IwQ291dTVSSzMzNmhJVWxPZE1CM0tPUGlr?=
 =?utf-8?B?WEhEZ29sam9hNXFLQ29NRXhERlA5dEYzbUhCYXJLem8rTEw0TTZJU3Bla0pa?=
 =?utf-8?B?OElUdDJNVElSOGMrcFJmekZadU5nUGFkSnVac1l0bkRnUzJ4T1NOM1NlTGEw?=
 =?utf-8?B?bzVtcFRjUEZmTDJUemZJZ0g0TklWMEdPUlpsTThtYlRjdVRIa1hTN3Voc1NQ?=
 =?utf-8?B?UFkzQ1J2MWx5ZVR5QlR5MnZSRE9BeURVSUt5ZndsVVlKaElHTXBIbVhCTDdC?=
 =?utf-8?B?a2lkMng4bGhybUdCaytqVmRKd3hpVXFseUVYZTVQTlFUWTVJTy9hd1RxQ1di?=
 =?utf-8?B?QkZmV0YvOG1jK0dqZGx5ckJqSlg1dURwMDVQbTMxNFVJeWJIUkF6WWZGbjFX?=
 =?utf-8?B?dGg1VFVTQmFSVXFTcmtEOHZuVkJHb2l1S3VGV0QvM01jOGtCQlFyYWp3UDhD?=
 =?utf-8?B?cHlzb3hSZjlmOEN6VzJJNlVhWUI3RmJxQnlRQjgvUHhqVjhtZ2cvcnRYZVBh?=
 =?utf-8?Q?N/Iu04?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR14MB4360.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(80162021);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmtKQVlwdTNWR2V6NVMraXQzVnJ1eWF5V2ZrR3hBeldFNTVzWDlzZ05vV2Nk?=
 =?utf-8?B?RlFSQ0lUWDU2ajZQQit1b2JTK0R3ekp3bjVMbSt5QlBBYy9uZC94WHFTV096?=
 =?utf-8?B?YmgrcVBlWmNMUEVteEdNQU0xV1JRK3YyK05nK0liMXJPOE9FRkFjRmU2YkVX?=
 =?utf-8?B?Nnk2cjQzS05lNThUYTdDcVlLc1BVNmUzNjdHT1MzcWlkUWhwRDVFdWcySjZ0?=
 =?utf-8?B?dEdPK1VMbjdqQ0RlWS93VFZyeFp2bCtFaEFqbFBOM2VkbU5SMnlBK2pvaGNh?=
 =?utf-8?B?TWtQOXZhTHd3NEFTZEE4aFRYVThRTThLNHcySGJ5TnE0Nkt3dDcxbWtnYXBL?=
 =?utf-8?B?eHEybXFXNjdFSUVUbkRMaHhvMHNtQkpGUnRrZk8vUW5pcVhIbFUveTRWdVlo?=
 =?utf-8?B?cHJFN25pLzBEa3BrQ1VTSGk2MldabjB3SmFvcTBxRkYzMXEvMlpCYUtJalBD?=
 =?utf-8?B?TnRiQ2tvUUR5YkxSdzV1engwNnhKTFFCYUY5UXZpdHY3aENIUTZISVJTTlNi?=
 =?utf-8?B?Y3V5ak45VmlrR05vN05ldDlaRmpocEtkV1F5dDdpWmhIUFRxRmowTmQ3N1Ju?=
 =?utf-8?B?VlFlbVJmMHNLWm1qWFpPZ0RDVU1tTDB2cUJiaTM1elhTY2ttbXN6dEcxaUpi?=
 =?utf-8?B?MWJIbXlOZ0VzREMxdVJZTTRxRXQ1SkU0aVk5NGJWUndiQnU4eHQ4MWtPdHhT?=
 =?utf-8?B?TzFCVGF3VGQ1eS9TMUdqQWovSi9vYTFBYVlVVWFaSitJTkNOdzRUSkVHK1lJ?=
 =?utf-8?B?ZFFya084ZXBNMUpzQWhZWUxUSFhTZHlyQmhZZlUza2tpOUcrY1l5VVN5NnpS?=
 =?utf-8?B?MDU3V295Q2VxZEtoMFY3a0dmcHV6UW1iVHFuTjBjZFN4RFdidDZiVUV1MUpH?=
 =?utf-8?B?TmpxcUVnTmsyMHZpU3V3Ri8zWUZmRkM4dFRpVlVkaTUrR1k5MWZkdW1XN3VM?=
 =?utf-8?B?Nll6d1RwbW10dzlrK2t2OW5UUDFldXNUbW9SZy92bUdQSXlya0R2M1RIWWpF?=
 =?utf-8?B?N01lRitXSW44SHR0UGVOdjhlWVdoMERGY2kzbWZtZVMxNHNNMGhsUW1zQXZz?=
 =?utf-8?B?d3J6dDY3TXp3bEdTTStpV09OdVp2U2M1aWU1b1BJRFhPSjMyNXkyeGRWSWJ6?=
 =?utf-8?B?Ujd0VWJmSDhKc0JFYmNTS3hYMnVsSnA5M0I0MC8rSjBMVkhzUUhtakVvZi9V?=
 =?utf-8?B?azczNllvOUF2VEhkc2Y5ZUloaXlyNTZGVkY2bHMzaUtOalhZcElQcDVxaTFM?=
 =?utf-8?B?b2JCa1NrcjNLNzJ1REJNU3YzQTNpUmpZOTdVZzA1THlJeWE0MGxGSjYrVWJH?=
 =?utf-8?B?UWttSE5jdjh0aXJsMlhYdnFpZXpibURtMThoa0pjR3NHWGdlbitBSE5KMzBy?=
 =?utf-8?B?SkUrK0VZTlNEN0RlRUhranc1L1ZvZzZheEVDT2pBMDVMeWNOYVA5R0o0R0V4?=
 =?utf-8?B?SngzUkhwaU82VytCRHF6K2tEYTVsMG9zSFlxcW9QT3BsRjdDbTJjZ2dsQVc3?=
 =?utf-8?B?RG1JbVlFMVpRa2R0bC9PMmcxekpkRm5yMkRCSW1MK1lSSGJIYzR4UCt2a0p4?=
 =?utf-8?B?b0NzUFQyQzlHZmlRSVBtL0tnZjRKRDdSQzlRb0doZjN4Rlp5K0M3SVJha3ky?=
 =?utf-8?B?S1JLcktyRjNtQmFYTXpyNTFVd3BMMm92Y1lSaW5tVHo3ZTlUejIvSGNvWjVm?=
 =?utf-8?B?eVd2cTYwUi9ZYlBMdUM3YWdVQ1lBaXh2UjI3TndFSVRRRFlNdFNFYWRqbnlC?=
 =?utf-8?B?Zk5JbHF6YTZJRy9IN1U4ZEdPVng2eFJkUG95eERYZmZPT2o3Z0xVSlNjM21O?=
 =?utf-8?B?U2Q2S1JoU3pTeEJyN1lMMVo2cysyVU9BNitRZUszcVZ2amJIZjhFQVhhUmNG?=
 =?utf-8?B?WS9IbDZlWXVwTjN1dElDN0QyU3Zmb21xeFZwejlxNHpITTZ1RWs2QW4vZ1pV?=
 =?utf-8?B?TXBhWjYrbUM3RjE1UXRLOG9oSkQ0ZGM1djIyRHFpVUwzcVJTUmNucDl5YVBi?=
 =?utf-8?B?Q0RGWDN4RVBHN2U1SUVvYlIzOWQ5QXhOaEs2OW5NTDQ3K1lveVcyanFDOC81?=
 =?utf-8?B?ZlRaMnNSNVlhU3FhSDdiQmFwLzZ1ejVxUnhxcFZlSnJQWDhzeVlXMXFKUFFw?=
 =?utf-8?Q?lMSIZl1YkEoHSIgR4BxX7Ddus?=
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5d625d-9f9c-4cfe-2109-08dd78a8d10f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR14MB4360.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 03:27:41.6567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5mnCOED1s6oSaLUlljkOLaRzhXcpwZcXyFXurh3ff+JwSURAnfyK9XWcbPIDwJ/H6QHsMiPjFviWh7kbF9Yyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR14MB6655

The current implementation uses "usb-charger" as a generic name for
usb connector. This prevents us to have two usb connector devices
attached as the power system will complain about the name which is
already registered.

Use an incremental name for each usb connector attached.

Fixes: 880287910b189 ("usb: common: usb-conn-gpio: fix NULL pointer dereference of charger")
Signed-off-by: Chance Yang <chance.yang@kneron.us>
---
This patch addresses an issue in the usb-conn-gpio driver where the
generic "usb-charger" name is used for all USB connector devices. This
causes conflicts in the power supply subsystem when multiple USB
connectors are present, as duplicate names are not allowed.

The fix introduces an incremental naming scheme (e.g., usb-charger-0,
usb-charger-1) for each USB connector device, ensuring uniqueness and
preventing registration errors.
---
 drivers/usb/common/usb-conn-gpio.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index 1e36be2a28fd5ca5e1495b7923e4d3e25d7cedef..2702e1a26634770500febd567f9d0891e63a8c4c 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -155,13 +155,19 @@ static int usb_charger_get_property(struct power_supply *psy,
 
 static int usb_conn_psy_register(struct usb_conn_info *info)
 {
+	static atomic_t usb_conn_no = ATOMIC_INIT(0);
+	unsigned long n;
 	struct device *dev = info->dev;
 	struct power_supply_desc *desc = &info->desc;
 	struct power_supply_config cfg = {
 		.fwnode = dev_fwnode(dev),
 	};
 
-	desc->name = "usb-charger";
+	n = atomic_inc_return(&usb_conn_no) - 1;
+	desc->name = devm_kasprintf(dev, GFP_KERNEL, "usb-charger-%ld", n);
+	if (!desc->name)
+		return -ENOMEM;
+
 	desc->properties = usb_charger_properties;
 	desc->num_properties = ARRAY_SIZE(usb_charger_properties);
 	desc->get_property = usb_charger_get_property;

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250411-work-next-d817787d63f2

Best regards,
-- 
Chance Yang <chance.yang@kneron.us>


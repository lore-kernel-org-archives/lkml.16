Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11011038.outbound.protection.outlook.com [52.101.129.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4524F15AF6;
	Wed, 14 May 2025 13:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230717; cv=fail; b=fNLaOeFOkoUoQ4ULdnpJXZw1rlTYTcGgUF7Ze2wr/EUp8ZZT6H7vFOoiuRFeON3r1XnYxCcVmXIVrEiqVdcTxOmC7OpS/0TN//LDFoZjQU/4EQ8kiCu37uYyIJf7dUJ88jsUcmIn77arpkSh6FyShyAho1jjBlNx1Dh3obI36/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230717; c=relaxed/simple;
	bh=XMnLjuC/PP8rp1zoBHmHMgVwSn8lgAsMM3mhfyYG5l0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kj2vQpinIYopI5faIXvR4LmpoeOmgwhXinT6oWBb3rF5kSXOXJV1hyrYnL0/6i2DKy9yyLkB60CnQKR7lD1FMFLniAyLzxe4FMJ0epZsEiv15p7Vk3VO31XWKRAQQ9qbE10hhWxF3Aitdv+fuorvjaMhQ2br6BQqFLqVuRckiCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=dh1hs2Gp; arc=fail smtp.client-ip=52.101.129.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="dh1hs2Gp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrUvkwlI8bKAer3ttDpolAHD0WdC1Ch7Mc2HhaJXyU0PwAUdFg8K8OvcfDoq7K+2y/CgPohe+FHY4jEooYoX8m5AXRLC2edwxq3RGCllPTFnyHRCNAfdGZe2hpwESmYXjxrs58FgRx4zX27yOCZnJZE5QYA5P+pCzcJOLoJVECaJKnWxrZFCxY0yPjxKC2+evO+Awsh5mEdtwbapCvYIgNLwYnGLi7mAqppsgiqCMjCVL5DOgrAK3vvCNb+vri/G4PCB3tQQ0gIg0L0urwIXibBqDeMmQcrIuXxF8eFoIPoJ/ryQsnM8MD9m4Gghs8TdQnfoq3FnzJ8BQfbf7fXomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMnLjuC/PP8rp1zoBHmHMgVwSn8lgAsMM3mhfyYG5l0=;
 b=i0KGk5Zdh2hTUCelss0E4TyI1j+xwOPwzGA2PCUc5AvXftLmni7Hcav6zPacCv+T/3A6eLIYOuvt1XoPDY0APht6WV1M8NA+Q8fwVYZoq5yQLWv/3VThGuWCPV+X316lBP7vnMQSaT5+lX3WRjF1RRfXt2RR/0rRgTu7k9SDQVmqNeL+qrJIvJcWeQHrfEb/48phpV1dBLbUKwoKwVRitbdGcrX39vlV+uVXhZdwIASEQCY9z3/i4pkq5vFxMoboBKN7lySYT4DloKXelsIImRJV3QXC2zVIdrW4HmXqqUQSHMt2JSW5JkcyzGGyvXjJ1vRTdCKjQ1JYMlOJ57OhPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMnLjuC/PP8rp1zoBHmHMgVwSn8lgAsMM3mhfyYG5l0=;
 b=dh1hs2Gp39FRboEKmd2BsXGWRA+MHCfIMzLFK1UKfmWnmfZx3Vi03XSOHAtDg4+enswp4IL61gM6nQepnmLW5cWE6rc6A0eDIU4EV9GVe85mOkwIAAkx5AcX24F5vG9BZCRQmSLKNgmOCY89Ph6nDFDRkKd35Puhxl2Kh4Uqj5xTNzL0xRFzA3E3Ekv+Ss6a6OYZIx5dfq8RBhB82S4Zm6Yxb4ihhx2CRr+t2emGepGXGA48FfuszhGbPrIOnZYRPSW1TTrK1MvVtAAncEk8eT6r0XUxUv62sjhm4C9paHg80Yp1R/l5wJ6MzJAWwVsYcVCpN35LNE8fYBmefkzl/g==
Received: from JH0PR06MB7294.apcprd06.prod.outlook.com (2603:1096:990:a1::6)
 by TYZPR06MB6746.apcprd06.prod.outlook.com (2603:1096:400:44e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 13:51:48 +0000
Received: from JH0PR06MB7294.apcprd06.prod.outlook.com
 ([fe80::6bd3:c327:c5c2:bbbe]) by JH0PR06MB7294.apcprd06.prod.outlook.com
 ([fe80::6bd3:c327:c5c2:bbbe%6]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 13:51:47 +0000
From: "Chen, Jay" <jay.chen@siemens.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Shao, Tzi
 Yang" <tziyang.shao@siemens.com>
Subject: RE: [PATCH] usb: xhci: Set avg_trb_len = 8 for EP0 during Address
 Device
Thread-Topic: [PATCH] usb: xhci: Set avg_trb_len = 8 for EP0 during Address
 Device
Thread-Index: AdvD5Kfvhxy5Vw0sQSyzmQpOxYTl4AAvYqmAAA0W+MA=
Date: Wed, 14 May 2025 13:51:46 +0000
Message-ID:
 <JH0PR06MB7294B8050FBFF1AE9E954CA58391A@JH0PR06MB7294.apcprd06.prod.outlook.com>
References:
 <JH0PR06MB7294E46B393F1CA5FE0EE4F78396A@JH0PR06MB7294.apcprd06.prod.outlook.com>
 <2025051451-pedicure-aspire-1c8d@gregkh>
In-Reply-To: <2025051451-pedicure-aspire-1c8d@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=bce94e80-59e4-4587-874e-c7a2e4db7dcb;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-14T13:46:12Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR06MB7294:EE_|TYZPR06MB6746:EE_
x-ms-office365-filtering-correlation-id: 204088ad-1f06-40bf-7186-08dd92ee7803
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?MmZmVWUva0lkVXlsSTNhekowRmMzUEJsaFkvVURqeHlVdld2MDJZdERJdXZy?=
 =?utf-8?B?Sldwemc3WHZlOElFTE9keTBhdDZHbHVIU0lNdFNOM3owZERhWmdjMDZzN2hE?=
 =?utf-8?B?V08xMDZHOWZ6bHF1WlUwYmlFK2R1Rm8xamdNbjQ5SXBvWUp5dnMyMUtqNldX?=
 =?utf-8?B?cHBZTWxNbE1hc3dpRnBXZFRZTjBDd1BhNjI1T3NpMTYreVR6SDV6TUg0bnFh?=
 =?utf-8?B?V2JZdTBOZEhHVytXcnRERFhNaStKcitRNUpEYTNjU1RUVWhidlNPTjZZeEFL?=
 =?utf-8?B?NStwYWx6YmFuNU0wd09KNHhIOG5WTVFrdkxzQnlINmVDS3dYak1nUWRSek1J?=
 =?utf-8?B?eWlvUCt2THZPMi8yOU85ZW1YbTdlbnI4OFcvakQyeG9IbmtBSkwySitBUnQy?=
 =?utf-8?B?Q3owa0pBMHBTOEJ3dEJFUE56OEhMeTg3Y05scUE5cXhZRVR6UGsxMWNFSnBG?=
 =?utf-8?B?UkJYOW51OUJoUVJ1ZmxwVkxQbWpaNHJaVm5MaXJLOXJhb1ovM1hiditWZTkr?=
 =?utf-8?B?NncwdDhVL0dsTDZmeFhqN2E3a05jSy9sbmIrMUxickhBRWpJZkg3RGpFK1Vm?=
 =?utf-8?B?TGhRNExxZjBtSWtDTjdzMlZqdzF0bElzWWhmdWhvdWdoNXB1bG5vZUhvdWhk?=
 =?utf-8?B?YWFPb09hNDhsdDZRVVBpR0Z3a2JiTHViUmJjRlZJYTdvTDRaRTl5RmVxODVK?=
 =?utf-8?B?a1gvNUNBUjBKNkw4UTRqZDdYempZZ2p5U0dseHVNaTRzejJYWDJseUg4YWx0?=
 =?utf-8?B?UEU5RFFESE5qR0piVzlaQnBsVm93RGJYdnlXb0ozUUttYStsbmcwYSt1bGNR?=
 =?utf-8?B?U0lUMncycEU2cUJ3WG5GQ0cvOGttWUlTb2h0Wk5zSHltdzFjRjg4di9vYXNU?=
 =?utf-8?B?N0xTYVgvMmVodWNIQ0YvZUFKVHFnOE5nSmdFK1BPMjg2clExVHhtWTZOT3Vo?=
 =?utf-8?B?SnU2S0RUTURjQWlzVWpGbnBKdXo0YVBoU0RaUVZQK05RaXRDOVJIVDlZZ3RL?=
 =?utf-8?B?M1FBMU5ZdDVhQ1BUMWlveFNzcUdLbUFhN2laM3lhQlA0VnFiNUViNk5ueFV6?=
 =?utf-8?B?RU8rZDVVeXhQSEJmMXJmN1NTL0hoa0s5dmhGcVVJVE90Z2orVkZyd0d0Rmpo?=
 =?utf-8?B?RUQ5VlRJeTlKbmQzKzIyQXhHVzZyVElPY3BVdmpSSHNxYnREWFFoRnMzcWds?=
 =?utf-8?B?MnhtS2UxblZTd1dER0xPa1RPTDRGQ21ta3RiNFloRTZrRS9rVEY5Uk1LcWhO?=
 =?utf-8?B?QmI2M3NFblIzUFFEN0I4cHBiM3p3Wk9uelRlWFpJaldmMUpsRGZSTEhCY3Rt?=
 =?utf-8?B?VXhYeWRDSjRSZWtCbGVVak1IL0dVcnNMTzZPVGhBUEc4N2NvS0ErTlVVb3lN?=
 =?utf-8?B?TndUREl0WjN0SFlySXBha054YWdnampqWCtFWGVZQllWUm9jVmhWZm9GR21u?=
 =?utf-8?B?NURNQjlIQk54YVM0bGRuTEpDNWExTWIzZWl3Zlp1SGFrckJTaE1FUlZ4TERj?=
 =?utf-8?B?emJMUzZiaHNKU0pKcEdxM0diV2hyam5qN20yQmJIU1o4TE5ROVNKNDVLbzVo?=
 =?utf-8?B?VEJTUFdkUmV4WnJWZEEycmg4UHBnUkQ4VkJTNk9uS0dIUFV3RUZ6ZGxyUk8w?=
 =?utf-8?B?SXFTaFdBeEkzZmZreWVDVmJtTmgrUk5WTFRqUFZ4Wm1ucVdKS3BqL1lpcVo1?=
 =?utf-8?B?V2xUV0E5d0tIYmdJQTBmWmFDSXVPcXpXRjNzOGVOd05FZkw5NjN3S1ExYlJ5?=
 =?utf-8?B?TmFBcXJpVjl5VXZ3cUo0eUZSUmdmMENHemJJZythS2dtYUVBTndyaFRKK3NS?=
 =?utf-8?B?dnc4TDlocTIvMERNUUZCMTVkdXJOQWJOZ0ZUV0hlYnduVTRsbWFLRE13NHpi?=
 =?utf-8?B?UElWenkzS1ZUUFNuNWxJTE1rZHJPZUZzdEN5dDVhb1dXMGFXTkptU0VRb3VI?=
 =?utf-8?Q?mML7XY8ppRQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR06MB7294.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bHBjaXdJN3o2YlFCNTMvRWl0SFltaEh5Z2I0N3JPaDUwZHQ3RWIyVnJicENs?=
 =?utf-8?B?Wncxd2pBUHp0WTZnOTlxWDdDZXJaUERQNjZ6VlZuQjQ1ZzBHK2Z3d25KOVUx?=
 =?utf-8?B?amV6YmRzdnVQbHdBd1FBZWRMWjVVYkp6ZmppWWl1cG5WS3NlRng1OHllWmRV?=
 =?utf-8?B?NjlMOUtEY1ZiNjhGNHlzcU9MbWQwNGlVd1FvMFdPeEpnZ2Y1WjV6Y3lGaEJt?=
 =?utf-8?B?MzBkNDRGcXVncG5xdmNmWUtrdS9iRkVucG12ZGtVVlRZQSswZEw2dm9iWUht?=
 =?utf-8?B?U0FzVXFPbTdFRWlMZEVRUEVkL1NuYWNCSHo1MEtXMWtJOTJGU3BxWkk1eDFD?=
 =?utf-8?B?NkpEQk9yU29LdjVuczJHYnQ4SUd5cDljTUcxeCtLYWxtZk1IbVphay9qWjMw?=
 =?utf-8?B?Nlo5Y1A1ZlMvVkJOZTJLUnZyc29iK0VGSEVocFZObzF3MWpNK2cxVkswMS9Z?=
 =?utf-8?B?L2RkVkVBR1F4c3U2bTRvKzhwRFd0SXV1am5HWFh6Ni9kVDZoMGtiYVBPcCtG?=
 =?utf-8?B?dHVPQUZuNE1zdVRkRW95VXdsUjJKR1FFWmk1a3JxenNDazlrclhuMmptc1Bi?=
 =?utf-8?B?WU5zSkVWd2cySDR6WnNqVG5OVmplU2w0TEQ3RFhZRzhXci9pZ2ljSTgwM0Q1?=
 =?utf-8?B?Vm5GbktUVXZka01sSlA0eUJFZm5NdVBvOFJtb1I0OWRtMENxYVdvSHhhTElo?=
 =?utf-8?B?MHoxUnlzL0NYSFc5ZWo1cHJpMldIZ3dGYXJWSEJqRmp4cjJ0cDNudFhLRE9R?=
 =?utf-8?B?VGYweGYvaXdKbm5CWnFTbmxzanV4bDhjMm4vMXdVb3J3SEhnWDE4KzV1aVFI?=
 =?utf-8?B?b2kxTHF2bkdUNEtFa2prN1ppNEhpclRQbGNGcFlvVHpuUzB4NlVGUHhjVW5E?=
 =?utf-8?B?RU5qZjdvN0dFSlhZOTVzY0dMbHFsMklKRloyUGc1cHowQ3hlK2xZaUlQWWJ1?=
 =?utf-8?B?R2xoMzZoNGRyQVQ0SnArZGlmdXBwUGtUc2VJWVJ4OVNlMnQyS1V4RkN6dHdF?=
 =?utf-8?B?KzlYbzdHMU1uL3daTnpyVWVxSlB5ZC9TOVovbDBxejZwUmZqR2hqZFRSRVM0?=
 =?utf-8?B?RDNhMGtpNUtvd0tvNWFqdmhYQ3lYcGo1Y1IvOXYzbEl2NVNqRjFxSzF0c200?=
 =?utf-8?B?bWh0T081NXdLN0ZiNk96cnI2SGNtbTlRSDROaHFQUWNkdUdTQTRUU2Q4RTJu?=
 =?utf-8?B?eWh1RG83VmhGUWFNaFl3OGZERWVkQ3lYRkE0WDhDMkgvRUNWTDlUdHl0WkFD?=
 =?utf-8?B?ZzVIcXdZWk5tWWJSZ2ExNWVadXBiZnVTcVJ2RHVWNDZlTnhVODVOZmlaT1hM?=
 =?utf-8?B?TVIrZzBoYWpMQkhENEZid0EwcGhMYlRBclZHRkovQnE4aXJVbG9BanZ5c1h2?=
 =?utf-8?B?cUdVY21SU2xvU0MzZE9DbG1tdnpPYytpT2xCbVQ4dlRycGNnNXlXZzJYWTVU?=
 =?utf-8?B?NE50WDZXZ1dhRW8vUEd3emcrZlNHVFdaeTVDTHNlMEljeHZneDVZdFBYM0g3?=
 =?utf-8?B?eFBQZVA1YmpJRUx0TzZya1VyZXJOdkd4TWp0eHlNUm1pMjVvQ3htWjd2WnZ1?=
 =?utf-8?B?ZnVjR2RtaS9iY1pJWVBTVzBIK2xPbURWTk5jUDlOeUhHK3M3QU1qZTlaUUdX?=
 =?utf-8?B?TEVaWkVxd01FdEtoR2J4Y1did2ZEY1BaZmJoT1BOdTJCRjdocXJMQjBJZ044?=
 =?utf-8?B?U1l6KzhrUkcrb0l0VnlsZ1QzR21CdndTcWpTdm5HRHJXUWxEQzdIdGpxTm85?=
 =?utf-8?B?S0pReDVUUThmVDVVWXg0aEhxK2N3U1VseThLMWpJTUpQK3ExLzlwSTA0eGVu?=
 =?utf-8?B?U1ZzMVR1V0Zta05OSVpWTWFLZDJpWWFJMU44VWlMWkZQbFR3Yk1uM21Ccmgv?=
 =?utf-8?B?WHV2eEhQQ2J6SFNnT2FZNnJPYlF6QlJMRUhwMUkrdzJSRmtoK1V1cFV5ZWFx?=
 =?utf-8?B?K3VIWHNyOHpGN0tQK3c0UmdNT0dBazFqeUc0NE1ZWGxkRWVmaG1qeU1lMTJK?=
 =?utf-8?B?c01aaTZwRHZOdGpwVVBwTFIrTmxxSklTaW5KczhjL0hRVWpNK2lzanpHZldC?=
 =?utf-8?B?V0ZNYU9PSmZsMkxLcmFmTVp1aEVGZk5Pa3JEb0tobVh4MXNtbUJ6QkwxV2oy?=
 =?utf-8?B?MlRuVWpKb3h6emtlMnM4aUcvbHdkTUpobGw1aWhUN2tSKzduVW1hLzE4NlM1?=
 =?utf-8?Q?byp1BupfY6wvpurEX9U0t43B4S8ClESDMdt1FPvDXvVJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR06MB7294.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204088ad-1f06-40bf-7186-08dd92ee7803
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 13:51:46.9526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qRkV+CPPiPeHvaLa67mjxoE+KwV7X0wb+0n1i37ajTM3tdXI6rqg1CdnGXV9R8sZhw2TA462K5Eya0VYU1DdkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6746

SGkgR3JlZywNCg0KPiAicGxlYXNlIGZlZWwgZnJlZSB0byByZXNwb25kIHRvIHRoaXMgZW1haWwi
DQoNCkkgYXBvbG9naXplIGZvciB0aGUgd3JvbmcgcGF0Y2ggZm9ybWF0IGR1ZSB0byB1c2luZyBP
dXRsb29rIGluc3RlYWQgb2YgImdpdCBzZW5kLWVtYWlsIiAoU2luY2UgSSBkb24ndCBoYXZlIFNN
VFAgcGVybWlzc2lvbiBmcm9tIG15IHdvcmtwbGFjZSkNCg0KSSB1c2UgdGhlIHBlcnNvbmFsIEdt
YWlsIFNNVFAgc2VydmljZSwgYW5kIHRoZSAiZ2l0IHNlbmQtZW1haWwiIHdvcmtzLiBJIGhvcGUg
dGhlIG5ldyBwYXRjaCBmb3JtYXQgaXMgY29ycmVjdCB0aGlzIHRpbWUuDQoNClRoYW5rcyBmb3Ig
dGhlIG5vdGlmaWNhdGlvbi4NCg0KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
dXNiLzIwMjUwNTE0MTM0MDExLjE2Mjg1LTEtc2hhd24yMDAwMTAwQGdtYWlsLmNvbS9ULyN1DQoN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gDQpTZW50OiBXZWRuZXNkYXksIE1h
eSAxNCwgMjAyNSAzOjMxIFBNDQpUbzogQ2hlbiwgSmF5IChESSBTVyBFREEgRFZUIFJEIElOIEFW
RSBVUzMpIDxqYXkuY2hlbkBzaWVtZW5zLmNvbT4NCkNjOiBtYXRoaWFzLm55bWFuQGludGVsLmNv
bTsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZzsgU2hhbywgVHppIFlhbmcgKERJIFNXIEVEQSBEVlQgUkQgSU4gQVZFIFVTMykgPHR6aXlhbmcu
c2hhb0BzaWVtZW5zLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0hdIHVzYjogeGhjaTogU2V0IGF2
Z190cmJfbGVuID0gOCBmb3IgRVAwIGR1cmluZyBBZGRyZXNzIERldmljZQ0KDQpPbiBUdWUsIE1h
eSAxMywgMjAyNSBhdCAwOTowNzowMEFNICswMDAwLCBDaGVuLCBKYXkgd3JvdGU6DQo+IEZyb20g
ZmVmODkzYmNmMGFkZDg5Nzk1Yjg1YmNjMWY2YmRhZTUzN2YxZGFiZSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDENCj4gRnJvbTogImpheS5jaGVuIiA8amF5LmNoZW5Ac2llbWVucy5jb20+DQo+IERh
dGU6IFR1ZSwgMTMgTWF5IDIwMjUgMTU6MDM6NDQgKzA4MDANCj4gU3ViamVjdDogW1BBVENIXSB1
c2I6IHhoY2k6IFNldCBhdmdfdHJiX2xlbiA9IDggZm9yIEVQMCBkdXJpbmcgQWRkcmVzcyANCj4g
RGV2aWNlIENvbW1hbmQNCj4gDQo+IEFjY29yZGluZyB0byB0aGUgeEhDSSAxLjIgc3BlYyAoU2Vj
dGlvbiA2LjIuMywgcC40NTQpLCB0aGUgQXZlcmFnZSBUUkIgDQo+IExlbmd0aCAoYXZnX3RyYl9s
ZW4pIGZvciBjb250cm9sIGVuZHBvaW50cyBzaG91bGQgYmUgc2V0IHRvIDguDQo+IA0KPiBDdXJy
ZW50bHksIGR1cmluZyB0aGUgQWRkcmVzcyBEZXZpY2UgQ29tbWFuZCwgRVAwJ3MgYXZnX3RyYl9s
ZW4gDQo+IHJlbWFpbnMgMCwgd2hpY2ggbWF5IGNhdXNlIHNvbWUgeEhDSSBoYXJkd2FyZSB0byBy
ZWplY3QgdGhlIElucHV0IA0KPiBDb250ZXh0LCByZXN1bHRpbmcgaW4gZGV2aWNlIGVudW1lcmF0
aW9uIGZhaWx1cmVzLiBJbiBleHRyZW1lIGNhc2VzLCANCj4gdXNpbmcgYSB6ZXJvIGF2Z190cmJf
bGVuIGluIGNhbGN1bGF0aW9ucyBtYXkgbGVhZCB0byBkaXZpc2lvbi1ieS16ZXJvIA0KPiBlcnJv
cnMgYW5kIHVuZXhwZWN0ZWQgc3lzdGVtIGNyYXNoZXMuDQo+IA0KPiBUaGlzIHBhdGNoIHNldHMg
YXZnX3RyYl9sZW4gdG8gOCBmb3IgRVAwIGluIA0KPiB4aGNpX3NldHVwX2FkZHJlc3NhYmxlX3Zp
cnRfZGV2KCksIGVuc3VyaW5nIGNvbXBsaWFuY2Ugd2l0aCB0aGUgc3BlYyANCj4gYW5kIGltcHJv
dmluZyBjb21wYXRpYmlsaXR5IGFjcm9zcyB2YXJpb3VzIGhvc3QgY29udHJvbGxlciBpbXBsZW1l
bnRhdGlvbnMuDQo+IA0KPiBMaW5rOiANCj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVj
dGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGYnVneg0KPiBpbGxhLmtlcm5lbC5v
cmclMkZzaG93X2J1Zy5jZ2klM0ZpZCUzRDIyMDAzMyZkYXRhPTA1JTdDMDIlN0NqYXkuY2hlbiU0
DQo+IDBzaWVtZW5zLmNvbSU3QzhjNjljNDMwYmM5NzQ3MzRmN2NkMDhkZDkyYjk5NmU5JTdDMzhh
ZTNiY2Q5NTc5NGZkNGFkZGENCj4gYjQyZTE0OTVkNTVhJTdDMSU3QzAlN0M2Mzg4MjgwNDgwNjYw
MDE5NDQlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKRg0KPiBiWEIwZVUxaGNHa2lPblJ5ZFdV
c0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJDDQo+IElz
SWxkVUlqb3lmUSUzRCUzRCU3QzAlN0MlN0MlN0Mmc2RhdGE9MHp0SyUyQnNmdkV0NGZoZ1ZUZktr
VXlkVTNaNnpqJTINCj4gQldXS0lGcGVFb09VOWNrJTNEJnJlc2VydmVkPTANCj4gU2lnbmVkLW9m
Zi1ieTogamF5LmNoZW4gPGpheS5jaGVuQHNpZW1lbnMuY29tPg0KPiAtLS0NCj4gZHJpdmVycy91
c2IvaG9zdC94aGNpLW1lbS5jIHwgMiArKw0KPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLW1lbS5jIGIvZHJp
dmVycy91c2IvaG9zdC94aGNpLW1lbS5jIA0KPiBpbmRleCBkNjk4MDk1ZmM4OGQuLmZlZDllOWQx
OTkwYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNpLW1lbS5jDQo+ICsrKyBi
L2RyaXZlcnMvdXNiL2hvc3QveGhjaS1tZW0uYw0KPiBAQCAtMTE2Niw2ICsxMTY2LDggQEAgaW50
IHhoY2lfc2V0dXBfYWRkcmVzc2FibGVfdmlydF9kZXYoc3RydWN0IHhoY2lfaGNkICp4aGNpLCBz
dHJ1Y3QgdXNiX2RldmljZSAqdWQNCj4gICAgICAgZXAwX2N0eC0+ZGVxID0gY3B1X3RvX2xlNjQo
ZGV2LT5lcHNbMF0ucmluZy0+Zmlyc3Rfc2VnLT5kbWEgfA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBkZXYtPmVwc1swXS5yaW5nLT5jeWNsZV9zdGF0ZSk7DQo+IA0KPiArICAg
ICAgZXAwX2N0eC0+dHhfaW5mbyB8PSBjcHVfdG9fbGUzMihFUF9BVkdfVFJCX0xFTkdUSCg4KSk7
DQo+ICsNCj4gICAgICAgdHJhY2VfeGhjaV9zZXR1cF9hZGRyZXNzYWJsZV92aXJ0X2RldmljZShk
ZXYpOw0KPiANCj4gICAgICAgIC8qIFN0ZXBzIDcgYW5kIDggd2VyZSBkb25lIGluIHhoY2lfYWxs
b2NfdmlydF9kZXZpY2UoKSAqLw0KPiAtLQ0KPiAyLjQzLjUNCg0KDQpIaSwNCg0KVGhpcyBpcyB0
aGUgZnJpZW5kbHkgcGF0Y2gtYm90IG9mIEdyZWcgS3JvYWgtSGFydG1hbi4gIFlvdSBoYXZlIHNl
bnQgaGltDQphIHBhdGNoIHRoYXQgaGFzIHRyaWdnZXJlZCB0aGlzIHJlc3BvbnNlLiAgSGUgdXNl
ZCB0byBtYW51YWxseSByZXNwb25kDQp0byB0aGVzZSBjb21tb24gcHJvYmxlbXMsIGJ1dCBpbiBv
cmRlciB0byBzYXZlIGhpcyBzYW5pdHkgKGhlIGtlcHQNCndyaXRpbmcgdGhlIHNhbWUgdGhpbmcg
b3ZlciBhbmQgb3ZlciwgeWV0IHRvIGRpZmZlcmVudCBwZW9wbGUpLCBJIHdhcw0KY3JlYXRlZC4g
IEhvcGVmdWxseSB5b3Ugd2lsbCBub3QgdGFrZSBvZmZlbmNlIGFuZCB3aWxsIGZpeCB0aGUgcHJv
YmxlbQ0KaW4geW91ciBwYXRjaCBhbmQgcmVzdWJtaXQgaXQgc28gdGhhdCBpdCBjYW4gYmUgYWNj
ZXB0ZWQgaW50byB0aGUgTGludXgNCmtlcm5lbCB0cmVlLg0KDQpZb3UgYXJlIHJlY2VpdmluZyB0
aGlzIG1lc3NhZ2UgYmVjYXVzZSBvZiB0aGUgZm9sbG93aW5nIGNvbW1vbiBlcnJvcihzKQ0KYXMg
aW5kaWNhdGVkIGJlbG93Og0KDQotIFlvdXIgcGF0Y2ggaXMgbWFsZm9ybWVkICh0YWJzIGNvbnZl
cnRlZCB0byBzcGFjZXMsIGxpbmV3cmFwcGVkLCBldGMuKQ0KICBhbmQgY2FuIG5vdCBiZSBhcHBs
aWVkLiAgUGxlYXNlIHJlYWQgdGhlIGZpbGUsDQogIERvY3VtZW50YXRpb24vcHJvY2Vzcy9lbWFp
bC1jbGllbnRzLnJzdCBpbiBvcmRlciB0byBmaXggdGhpcy4NCg0KLSBUaGlzIGxvb2tzIGxpa2Ug
YSBuZXcgdmVyc2lvbiBvZiBhIHByZXZpb3VzbHkgc3VibWl0dGVkIHBhdGNoLCBidXQgeW91DQog
IGRpZCBub3QgbGlzdCBiZWxvdyB0aGUgLS0tIGxpbmUgYW55IGNoYW5nZXMgZnJvbSB0aGUgcHJl
dmlvdXMgdmVyc2lvbi4NCiAgUGxlYXNlIHJlYWQgdGhlIHNlY3Rpb24gZW50aXRsZWQgIlRoZSBj
YW5vbmljYWwgcGF0Y2ggZm9ybWF0IiBpbiB0aGUNCiAga2VybmVsIGZpbGUsIERvY3VtZW50YXRp
b24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0IGZvciB3aGF0DQogIG5lZWRzIHRvIGJl
IGRvbmUgaGVyZSB0byBwcm9wZXJseSBkZXNjcmliZSB0aGlzLg0KDQpJZiB5b3Ugd2lzaCB0byBk
aXNjdXNzIHRoaXMgcHJvYmxlbSBmdXJ0aGVyLCBvciB5b3UgaGF2ZSBxdWVzdGlvbnMgYWJvdXQN
CmhvdyB0byByZXNvbHZlIHRoaXMgaXNzdWUsIHBsZWFzZSBmZWVsIGZyZWUgdG8gcmVzcG9uZCB0
byB0aGlzIGVtYWlsIGFuZA0KR3JlZyB3aWxsIHJlcGx5IG9uY2UgaGUgaGFzIGR1ZyBvdXQgZnJv
bSB0aGUgcGVuZGluZyBwYXRjaGVzIHJlY2VpdmVkDQpmcm9tIG90aGVyIGRldmVsb3BlcnMuDQoN
CnRoYW5rcywNCg0KZ3JlZyBrLWgncyBwYXRjaCBlbWFpbCBib3QNCg==

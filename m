Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013048.outbound.protection.outlook.com [52.101.127.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2A31E991A;
	Tue, 13 May 2025 09:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127227; cv=fail; b=SmWqjFACmDIkuvi8oVQWxGRzxsyo+NQQCumX4yEOgNtOQyrqGiwa4PQN1ZuHxN4aaN250hlXEU6udireAzscffp6LBDv9PU+5Vj9xz3J+ZLWPOEZXd6VnpaFuVVu92765wbNnF2/paQJxHH+YQmTExb2N4H4RT0GbIWCIT5IvyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127227; c=relaxed/simple;
	bh=1KvQ/VdWheTCl9zo4hpsLTZE3C4pG4dO8ZF27SR4i2w=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YR/AkAV0aDV2Bzu/igIue/6vGgW6F2pJHaFPPxvZQs6Xb7qjLNHFExaZi9T2iC/CwNk1sHOC3nbLXlNiO+2ZwuOrZdm6w67A9K2GhgF4qST2AalbciB7JUTKQqDxnk9ab1vgkVJsR7/z4kkIvZlper7oXDWLrunS99mnJOm19HI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=AxCD/wSy; arc=fail smtp.client-ip=52.101.127.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="AxCD/wSy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+dFl3b6PReyhOsCR6jtEoLaD+D5teRG4d5+XmEo93VPhN4ook8iz27N0sxYwWdlKaypKirZjUcYWwPqtvLVBRhFo4ymiP7InpAUXJiW7/OXBXoADZg4l8Tw/0a6xBtdBNQ6ULjMz6HPTq1XaJ+vBdmzN8THIuZrKXtyHntAi1DYgLyGZT+vdi5bfHZkSe3HTVK33JsO9DfRzLlrcJm14eJ7Qo1pyavcZMgkUCRy9NkEo4BDkcrrcL0oExr/rgW7yw473UGNcExfwHte9/tr4kjyDi9Ov9t5faZTpLMtgF+DYEHfgm+Qs6KB2uomK5cVEa+Dgc7IbUKoQVqusub/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KvQ/VdWheTCl9zo4hpsLTZE3C4pG4dO8ZF27SR4i2w=;
 b=vnCGS1l6kjvlEaqnY2i1ztcYoM8f0cXjTIYKqtjpWBYuwG01pJIKtUB5f3nEIrGyPuKzPDgeqKY1V0Xt5GjwUJNVYS7YX0ziYAwBUPSi88TFGMpEFEZNuN9Xe9Vsy/al/33IKvK5TWYv9ly4UPoFVurnQ5G9RC2o9knkgj0TefnE2IivpWqIZeSGvsMYyPbbCYPwG0zeq7DCqDeuvMJXeuPJoHbaECOUlgwA7I/y9Y1W8GeUj8H/n/s8zE5AcnTujWqbbB/vbo33/1oEbZEQw4UwYf8e+ZVWhVGb9O08GOZroyI0pfiUvcw6Qvs4pvVGAc6sQE4bFL0MUQIGSHB4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KvQ/VdWheTCl9zo4hpsLTZE3C4pG4dO8ZF27SR4i2w=;
 b=AxCD/wSyHto3tAiCWKwT1WNCHZO5Te8cvXHbP2gcFJT+qCSYV9E3qaVgVDvAfo/kYo3RD8SX1XkfqPEF/KMw+HBZV0h5NKmz1LfXezpp0FTlfv8I/Mi6npqP/m+cQ9VkzbgWMNRxvolg6+QeIRUlwdxpgTK9V60D0g/08tWWzxxR8uM1O/SE/F8AFF21BWZu+YWtZWE5AO4nscq18ItxLXPAcJXXeAzBNIzaTcHCvt3LTjsdTweltdembe44c4uJbqgt1lBJESrD/9rNuLHlzuVGQWZwGTz76k0/B/EwNy8KPRyiRAbJt+I9xmR00brkrqm6ih28xquu4I883S1jKQ==
Received: from JH0PR06MB7294.apcprd06.prod.outlook.com (2603:1096:990:a1::6)
 by TYZPR06MB6698.apcprd06.prod.outlook.com (2603:1096:400:463::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Tue, 13 May
 2025 09:07:01 +0000
Received: from JH0PR06MB7294.apcprd06.prod.outlook.com
 ([fe80::6bd3:c327:c5c2:bbbe]) by JH0PR06MB7294.apcprd06.prod.outlook.com
 ([fe80::6bd3:c327:c5c2:bbbe%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 09:07:00 +0000
From: "Chen, Jay" <jay.chen@siemens.com>
To: "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Shao, Tzi
 Yang" <tziyang.shao@siemens.com>
Subject: [PATCH] usb: xhci: Set avg_trb_len = 8 for EP0 during Address Device
Thread-Topic: [PATCH] usb: xhci: Set avg_trb_len = 8 for EP0 during Address
 Device
Thread-Index: AdvD5Kfvhxy5Vw0sQSyzmQpOxYTl4A==
Date: Tue, 13 May 2025 09:07:00 +0000
Message-ID:
 <JH0PR06MB7294E46B393F1CA5FE0EE4F78396A@JH0PR06MB7294.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=acc53e72-aa49-441b-a4a4-b3f05e64b6f1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-13T08:54:19Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR06MB7294:EE_|TYZPR06MB6698:EE_
x-ms-office365-filtering-correlation-id: a354f989-f294-4366-43e8-08dd91fd855e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eWZlaUJSZUVDcDR5LzdjajJyb25HNk50eVc0WlNLZkxETzNZR2tWWk9mcjZM?=
 =?utf-8?B?R2ZaNmhLbkkrTUswUG51alVrMUlyMGpFcEpIWFpuNE8xMXgxTGJUZk54Mmds?=
 =?utf-8?B?S1UxSGtSb3g0ekNaOGhFQzBoUjlzN3RMUGdBa1pPTUh3cjBtYjd1c2lPU0Zp?=
 =?utf-8?B?cTUzc2xDUTUzMUt3WDYvYXQvTlNFREFhWEZoMXhldTRsR2JrV25aWENtUUxH?=
 =?utf-8?B?L1NwREhYWHZTUUh0NGU2T09ObStZbTYwODhFbjNPVFNFQzBOZzNGc2c3Rkph?=
 =?utf-8?B?TnFvOExTSlBZVjQzZGRKbFNLc3ZkNCtQaTVFZW9BR0hEcjdIaERlbGZiNDd5?=
 =?utf-8?B?K1JiVzZ3MDZrWTZDQmdWRTRscFFhYmkvL1Z5RWUwbGlWM1hYZVRZeGE3aGRl?=
 =?utf-8?B?NUZGYldqUmxGVDZTM05wOElZV0pNaXhaR3VEaGlBZHc2dWtkcHpNb05nYnhX?=
 =?utf-8?B?UHRjUlF1Z2FNVWVDMmJvUlBmQklGTGg1bXJBSUlRYmM1N3NtcnZnSEkraHB4?=
 =?utf-8?B?Z3ZBWXptaUV2VWlOaW1ncGlwd1R5OSsrQW9wSVpueVY0WStUZ1g2SVJlait3?=
 =?utf-8?B?aHJQQkRoRDMxbEhQTUhxYjZJNFAwZEV3QVpQeVZjeE5Hckk3cktScmpCb3NL?=
 =?utf-8?B?bDBMZHl1bW9nNDR5WngybTRpN0dRYlJ1d2hLSVhEOUkvNU1pTklWOE5XdVUx?=
 =?utf-8?B?UWdoV1VOOHZtUzZhSk5FNVYzWGpEM1hHZ0FzRnJMbUZqTy9KZ09yVmswTi9l?=
 =?utf-8?B?Y2dVd1lPaXN5T0tMeGo1b2JaUjl3RVFrTnl6ZFBTandqSUl1MUNLNWdTMDFq?=
 =?utf-8?B?M2drMDlBTllZNVI1WWV6R1JPZllDa0wydVdIUEFNRVZGVkZ5aDJPUiswaXc5?=
 =?utf-8?B?STlZa1pvWmNIbW4vWE5GaGZwTk5DNlhYSnp4blYvL2U2VVY3UXZwYnBta1d2?=
 =?utf-8?B?bFlxMzhMUVp3NjRtVndHY2NyTWNFWkdIVE84NE1EQVkwS1UvNmQwaVBRZUpG?=
 =?utf-8?B?VjEyeGc5bjhYVkFzMkh0NElZeWdZby9jbmtDNG5ud082Y1RiaXN0aDliZkYw?=
 =?utf-8?B?N1ArbDY0ZlFRVk10WkNMOG8wUlBrTE1MWWRjWXpmM0VwK3F6cWtVOEUxV3pW?=
 =?utf-8?B?dHpRaVlvbkUxM0NpRXZwTVZYSmhrbUdzWXZIaWNoM0EvQ1R6MTlXakE3Q1F2?=
 =?utf-8?B?NnlRbGNoRXpMKzNubVZrMmViQ2FBTjhOUFBkT1lWemdyNVhBejFoano3em80?=
 =?utf-8?B?aGN2aGVUKzdJdUFhZWN4Ti85aTNCRFM4TGtEbG9xc1lhMDlSMG9SdnJDb3Vv?=
 =?utf-8?B?WFpCUDRJbEU3elR0bzJCNzk1TmM3VTYxNXRjVWxIWjR1NzdXcGQ3YlNyNk5W?=
 =?utf-8?B?R1VHV1dpNzRBMW43Z2UwU1UzbHkwcVdnQUNmTU1LS0VPMFZPeXJhOVYyQ3Bh?=
 =?utf-8?B?MjBLQzh4OTFXSVg3cUdocXVpWkZQRmVRVUs1b3lLbDY2c1lCWVpkMWZGY2Fs?=
 =?utf-8?B?cTlROTJXYnEyK3BOM1ZtQk9BMDkxTUVlZ3BBNURmRk8wT1ZYOWxCZ1REcnVx?=
 =?utf-8?B?N3M0cEVXbzcrd2h6Q1Z0OVhBOVhXY0R2V3Q3TEJHTkdmU3ZqcHNMMHNERnRD?=
 =?utf-8?B?andrbGJvd0RxV3A2NTdabXJscjRRRFNQNjFyZUxUNHczUVpWSDFSNmIzcnU4?=
 =?utf-8?B?V1FuNFk3YVRDVjBwK2dBWHZvSnRYQ1ZoZ2syNzN2cHRtYkRTSTU3UEVSdHRW?=
 =?utf-8?B?MElhbG81MU5MTDU2a0p1Z3VySHVCRG5BRlBIZjFGMGIyOWsvb0JtNFRNWkpC?=
 =?utf-8?B?emljd3piOHhheWc0RUdDWHhha1YzdXBYQk9vcExVcXNYUkRzZ0xRbHpheDN0?=
 =?utf-8?B?UkRqTnkwZVhzL2NibTRhZ3JlckRCZDg5bmxQU3lCQTBhT2cweGJyWld5Y3Zl?=
 =?utf-8?Q?PKIcSMfdlpI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR06MB7294.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTk5Y1BCRWorekprZk1SWm5yT2NSMzg1THQ1cTBocXlEVjIvcUVGTFFzRVg2?=
 =?utf-8?B?V3ZOdlJodkhxREtnUXh6Sjhac3FFL0VNQ3ZNZ1pMMTIvZXl3VHBGRFA5bWNV?=
 =?utf-8?B?dFE2dXdZQzdocWhPVk9YaU0vNkNXQVhhZlhwdW4ycGhONnloSVI5U1pQTENn?=
 =?utf-8?B?dEd3Zmxja0loRlZuU2ZIL3VIamZlT096d3p0ei84Z0pleGF6ZEtvWWxlbnRS?=
 =?utf-8?B?ODhkb0crNWZDV0ZrT2huUi9QQlRQMW4wL2V2OHRGcnVJRGoxTnNJOFppNjlY?=
 =?utf-8?B?cThlSU1pdkVuQWdFRlZRMnpxVlcvaTdzSDVTTG02Y1R5K2E1Ri9jT2FUT1VP?=
 =?utf-8?B?cUlkMy82Rklac2xWaXE1ZG5ZeVhHMGNhUTRMOW5uWmJGU2NiSGJVejdqTUtx?=
 =?utf-8?B?allGbVNHZVNlQzloL1AveGRJOTlkbVFqMzA0aFFoRnplSmpRWnp6aGFQQVlj?=
 =?utf-8?B?Tm52dERCWjFLcU9OMXd6Mis4WmZRVzJlUVlJNzNHaXEvWk14Sk9sZlYycTlw?=
 =?utf-8?B?VUlMOTNxaTNINEx2ZG1SQ2p2clplaUdQTkdVTEs1RVV0cXdYTFJFSHNOOFNV?=
 =?utf-8?B?WVJaMDJGQ1I0S3JJRzN0dmgydnIxNk54dXhFcnNzUDNCS3RTMUJaN0tEbjRD?=
 =?utf-8?B?Z2F2WWtMc3ZiN2pSVmVCRkRKYjBWbnRKekhNYTR3NnR3VURISGlCVmZyV0Iw?=
 =?utf-8?B?RkZnaUVUNFZJdlNJdkVYV0lNWWZxVElXck5KWVpaZDR4MnppaVZ6enJPZEpM?=
 =?utf-8?B?RWxPQ1VvR3Y2TXlhK01qWFVsTUpkUWUvWG9GQmVRZ1A1QmROTWdNRFNKeVRX?=
 =?utf-8?B?WUFxYmFyZWlZRUFza1JzZ3ZONG9rdGhIeWZWTDVESkV6RUdGODRTNVEvZzV5?=
 =?utf-8?B?ZHd3WE1uQWpUdk9zVmFidzF1MlNBWUtnQjFiQVRhSTRjZnNLdzIyRS9VUkgw?=
 =?utf-8?B?blZ0elRzc1o2UUdRMXhPb1k1UUE1SWpVdGttOWQ3SmtENmlVTkJvSFJOTElh?=
 =?utf-8?B?RVdvaGg0ajhsc1hjNnhMaWZyblhVNTBSMFJPUFVCWHNuUGFZcWlSekZMbWVN?=
 =?utf-8?B?UnA3aHJ3LzI3Q2h5dTVoMHA5TThTYlpsaURKWTdnM2dRUGplblJKb0dVdWMx?=
 =?utf-8?B?eTZvamRYZzJ4d1ltN2tNYW41ZDRhaW9ZdTUramRUbHN0ckN2VDFSb04xbjhH?=
 =?utf-8?B?OTlHeGlibXlVSDc1dDNVVzBVKzZzZUxEMVQwZVJxUHJFQmY5ZFZDVWV3OStY?=
 =?utf-8?B?cjdHNHpaTWx2aXNTd3FIUUVRM1QxUlVXdEpzM2tmeDA4QnB5Y1NIb2hQMklT?=
 =?utf-8?B?M09RUktFN29IYytmTVBBbTUwVnFGdHB2bEM3SDZoYkE4UjdOUzloK0hnYVdB?=
 =?utf-8?B?RG1XUjh5S1BqK0lVMjUvQSt0L3VwVGJUMmUzc2tnOWZkUmg2dFJ4YU1PT0Q2?=
 =?utf-8?B?b1lGTGxhWnVpVHBaaEpCeUZ4dng5aEVXcm9QN0ZuVHFwcHBQcGdaT2dTNllj?=
 =?utf-8?B?WlYybkEvaENwWkRJK0lsTnlwbGdHbEw2ZWt0U0t0RzVWSldldlFoell5anV4?=
 =?utf-8?B?S3NOb0owSG52Ky9aZHo5YzVGdERFWVdPZCtZL2RvL3lZV25nTjdmdnNMTnpV?=
 =?utf-8?B?V1ZPY3Rjb29RQUNwWlczM21SckdhZXdMZFdCU29VWDdySVNhY2o5TklMV0Zm?=
 =?utf-8?B?VnhiYm94S0hhMFg4U1NuYjh3QjVIcU13NW1RWHpnZFIwaTNRM1oyOFlhRGJI?=
 =?utf-8?B?UnlsL0VEcURnY3hTTUhjMmtVdEo1ZSs0T0VISWxQL3RraVd1ZTU3T3Z2UGdZ?=
 =?utf-8?B?eGNybzVtQmNGVXJzMjlwNzFxZUsvZXVxd25mZXk2SFMwZ2dpY210RTJJejlo?=
 =?utf-8?B?L3dqeEpwSlRBemhlMDljcm13OUhKT1JDUEFXaGpkZS9ybitkZ0o5c3BKL25x?=
 =?utf-8?B?cmdWOXB5SWVHL1VyTkxIWVpCK3dUMzdjRnpITTRtc3djVUt1M2UwNDBLTm9U?=
 =?utf-8?B?SGpyQklyOW03bXpuUWJkUE9wc1BpK0t1RTU1UDdnTnM3V0ZiV2RrY0dqdFNN?=
 =?utf-8?B?WE5yeExtTmJlclpmTVd2Q2xzb0ZmcGIvd3JZRjRhVXJPYko4OFQ0Q0tLQkIv?=
 =?utf-8?Q?kY3SDLfH8Kh6mD6vk0KPLlEbT?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a354f989-f294-4366-43e8-08dd91fd855e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 09:07:00.6499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UXYmywwSX4mPi+qNbFPXjmvQ5dHacanB6Ztp9OBsvqylH1ZhzJwnOZZvFqV1g07W5fnTkG18mN4kZqpnpcNTpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6698

RnJvbSBmZWY4OTNiY2YwYWRkODk3OTViODViY2MxZjZiZGFlNTM3ZjFkYWJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogImpheS5jaGVuIiA8amF5LmNoZW5Ac2llbWVucy5jb20+DQpE
YXRlOiBUdWUsIDEzIE1heSAyMDI1IDE1OjAzOjQ0ICswODAwDQpTdWJqZWN0OiBbUEFUQ0hdIHVz
YjogeGhjaTogU2V0IGF2Z190cmJfbGVuID0gOCBmb3IgRVAwIGR1cmluZyBBZGRyZXNzIERldmlj
ZQ0KQ29tbWFuZA0KDQpBY2NvcmRpbmcgdG8gdGhlIHhIQ0kgMS4yIHNwZWMgKFNlY3Rpb24gNi4y
LjMsIHAuNDU0KSwgdGhlIEF2ZXJhZ2UNClRSQiBMZW5ndGggKGF2Z190cmJfbGVuKSBmb3IgY29u
dHJvbCBlbmRwb2ludHMgc2hvdWxkIGJlIHNldCB0byA4Lg0KDQpDdXJyZW50bHksIGR1cmluZyB0
aGUgQWRkcmVzcyBEZXZpY2UgQ29tbWFuZCwgRVAwJ3MgYXZnX3RyYl9sZW4gcmVtYWlucyAwLA0K
d2hpY2ggbWF5IGNhdXNlIHNvbWUgeEhDSSBoYXJkd2FyZSB0byByZWplY3QgdGhlIElucHV0IENv
bnRleHQsIHJlc3VsdGluZw0KaW4gZGV2aWNlIGVudW1lcmF0aW9uIGZhaWx1cmVzLiBJbiBleHRy
ZW1lIGNhc2VzLCB1c2luZyBhIHplcm8gYXZnX3RyYl9sZW4NCmluIGNhbGN1bGF0aW9ucyBtYXkg
bGVhZCB0byBkaXZpc2lvbi1ieS16ZXJvIGVycm9ycyBhbmQgdW5leHBlY3RlZCBzeXN0ZW0NCmNy
YXNoZXMuDQoNClRoaXMgcGF0Y2ggc2V0cyBhdmdfdHJiX2xlbiB0byA4IGZvciBFUDAgaW4NCnho
Y2lfc2V0dXBfYWRkcmVzc2FibGVfdmlydF9kZXYoKSwgZW5zdXJpbmcgY29tcGxpYW5jZSB3aXRo
IHRoZSBzcGVjDQphbmQgaW1wcm92aW5nIGNvbXBhdGliaWxpdHkgYWNyb3NzIHZhcmlvdXMgaG9z
dCBjb250cm9sbGVyIGltcGxlbWVudGF0aW9ucy4NCg0KTGluazogaHR0cHM6Ly9idWd6aWxsYS5r
ZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMjAwMzMNClNpZ25lZC1vZmYtYnk6IGpheS5jaGVu
IDxqYXkuY2hlbkBzaWVtZW5zLmNvbT4NCi0tLQ0KZHJpdmVycy91c2IvaG9zdC94aGNpLW1lbS5j
IHwgMiArKw0KMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2IvaG9zdC94aGNpLW1lbS5jIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLW1lbS5j
DQppbmRleCBkNjk4MDk1ZmM4OGQuLmZlZDllOWQxOTkwYyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
dXNiL2hvc3QveGhjaS1tZW0uYw0KKysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLW1lbS5jDQpA
QCAtMTE2Niw2ICsxMTY2LDggQEAgaW50IHhoY2lfc2V0dXBfYWRkcmVzc2FibGVfdmlydF9kZXYo
c3RydWN0IHhoY2lfaGNkICp4aGNpLCBzdHJ1Y3QgdXNiX2RldmljZSAqdWQNCiAgICAgIGVwMF9j
dHgtPmRlcSA9IGNwdV90b19sZTY0KGRldi0+ZXBzWzBdLnJpbmctPmZpcnN0X3NlZy0+ZG1hIHwN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldi0+ZXBzWzBdLnJpbmctPmN5Y2xl
X3N0YXRlKTsNCg0KKyAgICAgIGVwMF9jdHgtPnR4X2luZm8gfD0gY3B1X3RvX2xlMzIoRVBfQVZH
X1RSQl9MRU5HVEgoOCkpOw0KKw0KICAgICAgdHJhY2VfeGhjaV9zZXR1cF9hZGRyZXNzYWJsZV92
aXJ0X2RldmljZShkZXYpOw0KDQogICAgICAgLyogU3RlcHMgNyBhbmQgOCB3ZXJlIGRvbmUgaW4g
eGhjaV9hbGxvY192aXJ0X2RldmljZSgpICovDQotLSANCjIuNDMuNQ0K

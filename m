Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560F9208A9;
	Fri, 11 Apr 2025 12:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373264; cv=fail; b=U2xeRY/SQ5fNnHyykJ7facg874DPQFRjlYsmxga+mt/4VPSJwPpV7MVSga83RxjET3KtCtLnEDhytU3mUOwpo5ODKzcOZz3ICUKfjLE8JksdaYmyt+U/YfIYNQd7KLsV9yHRjc/QitJOAE9alMQ8V4yIxTJz9QFz9pya6akS2ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373264; c=relaxed/simple;
	bh=crF+FnrCVEUE7BJ2PJ8WbQ95dViwBpyKmWIfnwA+vZg=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=HLyBQ343Y+vB15LSmAaOb+2xftzBvJBXavSJs7XtWMpeVKhoZLz96H6hqT5xBuKZCL1TCVNpFpFGaed8lNxh7cXMrbqlRGNKTQ8MAsikFqwy4EfXOExXzOyLmELCbP4QvSaitVaIEtsZn6OOpu7RlkZwOHmgrTVwSIMxskPS91I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RDFQ5kvk; arc=fail smtp.client-ip=40.107.220.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RDFQ5kvk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsUsg5Rc1GBFEdcpWlXnlJIiM8ZNq9A0+CEbN7loc1hMHF8zL3NripSAU1fC7iNr9x4JTge+Bj53Yzmz5u5TOGJnkyZjTQvA8/DvfSIEDW3ncoWR8edaYoXxpWEW3rYZ77eWYHtR4bxmCs/LdxBM7GH5+au74NqzKAE6I6zjLAn/5LMKG1ZFpLpM7P7plyEb7kXHML3Og67qCn4YmKLay5i9KKPfli9zYi4kR3XLYam/2qGQGFRr0OTkSEKBrxeCaaNP0/Tc45P/BWHhPbTA+QTOgQI6ToFc9MYDC/pDeWxiThDZb7kM5H6byhDGgjGZFFUUovXcXiPJYZUHAgwg9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+PyESZCmelBZ7j3iTh65LyuSo4ePO1JOqn8ccs9om4=;
 b=GYEw23giWM+QPukjIOl/7fqRj0+cHe0tJievF7vo+y0UQlEXUi6y9BVgst6fW8Xv6/tnXpQzPjFeQQGy+7qm3qon+shUoj+xwWAaEzescveNnakoGlwdg/T3ras2QHxa0ZpHcF6Bt7BFDpELxJqvd3PRgzl2OkDFSsJu6I515dLgjeNHkfFDwXwJ+6/y6chx6U1UFZ5N7kc8+XedXA2SWwbMpzozpQdPXOcQHxldmcAX0HHBVVXOkcFx4zhGbtNrNpTcTKtFFGvFKPZr+LEZfIjRQEKMThfQNt/dZthog7aHgEw4qadlz0w5O8sAbCr05mh6HpGKcypagfKTri/VoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+PyESZCmelBZ7j3iTh65LyuSo4ePO1JOqn8ccs9om4=;
 b=RDFQ5kvkxwrA1/QEex9UPJfLkhRby+FCiy6VGpPsWd9pUWvLlYdiLMV4XYtieRDYEP+XgkryULryxVtfjwC6U//9tcflMyxBBziK7BwWqTJkAAhPOLJ9wrUUBZQJV4DH/r+XhD8tcGMaEQV8cE9dgbjqSlDR2csH1d2au/S2rDjYN8fNMptnDrCQuvBeaX5hUvzhs7bQFPJnjgD9YQkfa/lR6v3cSsjRzNY5EvJi4BfqT9q3mAbFXhNTjzxD6d7sleSoTocnI3o6OykDCSrg3EroFpxkhJmscUPVkCqL/fHN+a7bLzWyz+eqhJXK8gBLbaMNmJQWgEaEotNqEQRsYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7877.namprd12.prod.outlook.com (2603:10b6:806:31b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Fri, 11 Apr
 2025 12:07:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 12:07:39 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 11 Apr 2025 21:07:26 +0900
Subject: [PATCH v2] rust: alloc: allow coercion from `Box<T>` to `Box<dyn
 U>` if T implements U
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-box_trait_objs-v2-1-c5f31b8db847@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAP0F+WcC/3WMQQrDIBBFrxJmXcsoDZGueo8SgsaxmUJjUZGU4
 N1rs+/y/c97OySKTAmu3Q6RCicOawN16mBezPogwa4xKFQ9XlALG7YpR8N5CvaZBCozYDukRwt
 NekfyvB3B+9h44ZRD/Bz9In/r31SRQopeO02Dtuituq2FHZvzHF4w1lq/NCQiH60AAAA=
X-Change-ID: 20250408-box_trait_objs-02a700401f0b
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: OSAPR01CA0313.jpnprd01.prod.outlook.com
 (2603:1096:604:2a::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f8a74c2-cd76-445b-f8f1-08dd78f1744a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjM2Z0lVbzRUNk1IZENqU1NZM2VudisrdEJkZlBWc1VtNlhHN2FGMWVibHFa?=
 =?utf-8?B?Yk1SWXVhME9GUVV6b244V2psajRXMzFtQm50bjM4RndNOGFRNmZQNXVUTG1R?=
 =?utf-8?B?Um0wNzNCZjdaU2lTR1dkY2pvT2pDQjZVeGw3N2kzSUxhdzFubUZiRWxGbmFV?=
 =?utf-8?B?MHBseng2MWM1b2tYZWJJU3lJajhPT3dYQVgwbHMwbnJaM3NnZlUyZmcya1lq?=
 =?utf-8?B?ZlR6dFZKMGh6RmlISWkvTGZSaFd1TitQdUZiTmErQXhWTFU3OVcwaG5GdHdL?=
 =?utf-8?B?WkFIMzU5TFg0eGRURElGMWxGWnpyek5YR1VQRm92WHQydlRuRkVGRnFFNXFs?=
 =?utf-8?B?M2RCZjlRNGJhK0dVa1o5eXcvTVhSUjNqWDd1THAzYisyNmlsRXZ4SURGZ3VT?=
 =?utf-8?B?YTBhcmpqTWlhdHordWljcGMrR2pVZUhPc2FwbExYTXBZZmFxcUNtT3p2QmtF?=
 =?utf-8?B?Qy80aXN6RXU5cVhsbmd1TUZndFZyR1lDR09Tbm1qN2RhbDd1Z1dYZkhraE5O?=
 =?utf-8?B?RnpKbmdPZHRCOS92Q0x2bS9BWUFNV3RJNzJnWVhPanpIS1J1cTBablRhUXZh?=
 =?utf-8?B?Y1BERFBCVUUybERwT2VGMDMwVlpERmZPb3lTbTNBdzI4Qi93ampMNWhFL2M1?=
 =?utf-8?B?Zzg4ZDI1Y3pxMzJtalNkOUo0YXROZkdUNVhTc0kwODltd3V1MHRka1FWMGV6?=
 =?utf-8?B?S1Y4NlY0dFFRcFdwVEJRZDFzQmJlcC8vcG1IWjZFZ2VHUTJIMVFIN3JDakRr?=
 =?utf-8?B?bkZzYklCcHhGWUpvc0J4NFhIRHRkUmdnZUNpVTdWajEvTFJxUnpWbXl1Tkxk?=
 =?utf-8?B?eitkMHo3YjMrZW1vNGllazA2SCt2T0h0SzNvRTVPM3BWL2t1RGVMTXZISmQz?=
 =?utf-8?B?QzVHVmdVK3JZelFBUXFFZkJiZDl3aWZteFdERzJ1T3M5clNmOWxxdEw4c01F?=
 =?utf-8?B?ZzVSdnJMSEhITHkySlFYbmMwSUc3a01JMlo5RWlvZURMQm1qT3VYdThmVFRE?=
 =?utf-8?B?a3BmZ1RheXViaGNVQVp1M2t4NG12T29veWpYV3kvTFJuOEZUTWpGVW1PN2Jw?=
 =?utf-8?B?ZHhRcUpKekhqZnFrazg1UE56MkZmV2VjTWJEOVR2Wm91UEFHQU12K005M25x?=
 =?utf-8?B?bzFrQ0FYVlVPN3JvZllhZU9BbTF4NGJKckRoSFEwTFBjdW9Ud1FYNW4vNlFN?=
 =?utf-8?B?c1lLa0NQZjN0QUNlWVpFU0tBNTY0bXNKM3I0cytDUmFwRkJtLy82bGRVVHB4?=
 =?utf-8?B?ZmU2MWdodkJaY2txYjcyZ3VJbXJJQzZPblZRcUZMUitPWExXSSsveXMyNy9h?=
 =?utf-8?B?d2VPY0l1c2xzN2wzQXh2UzNDS2x1clorMkhGZS9BOGhhb0hQQ1d2OGU0d2Ux?=
 =?utf-8?B?OStwamtnVUxFRnBOQnkvQXlKUmxZNWFMSnQxTzdlTTI1cDQ3bmt4TG9DV0U4?=
 =?utf-8?B?aWg3c0x0Y0RMYkNMSHFrTkw3NzRwRndmNENpeVFhOG9uanU2N1J6S0YvNnVV?=
 =?utf-8?B?dXNNN1VuY2Vybk9pR0EyTUVhbStTblN2N0s4S0pQRVFmdU95Wm1vaFl4cnl3?=
 =?utf-8?B?MkF4R3lDM01GUVdwcFR2WFgvdHFWOFUveS9ieFFQT0p3ZWYzNlRNVFFqcHdQ?=
 =?utf-8?B?aFJZbWpTNENieW4wQnBiMWwrV0gvWUVndmhVS0UzbGJ5VjlzRHN1WXMyQnBK?=
 =?utf-8?B?ZUtQWjViS2JheDEyVml6YjZtTzd2SVpPOEZEOVYzMk5Tbm9nWHVqQVU5TUl4?=
 =?utf-8?B?eTlTdG4rUkptcVJUbGMxNUJPKzBnenk5YStpYXNJN2lTNFlseXVpVE45QVd5?=
 =?utf-8?B?WXV3M0RING13T29OcndNZFFGaUZqN1hXNHZ5OEdRNkxvTDQyVENEUWhWWUxW?=
 =?utf-8?B?ZnlsTzNyTzE5SlpLd0JCay9yMXBaU1pFdHVkbytQYm5ueThLWXNIM1F2d082?=
 =?utf-8?B?MjBDWW1TV1hpSFBNT0NWOHJIOEptTm8vSVBUVEtOTjI2MS9OWElDaWRJZFh1?=
 =?utf-8?B?SGFUZ210ZkFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVBDeEJidk5rcnQ3VGx1TVlnaW1JUCtJSDY2eUFkT3ZxZXpQZ1Y1bjdTT3ZI?=
 =?utf-8?B?RGRiS1FyMGhpekNyQ3FNRzN3MXB2M2d0dk5IWlR6TEZkRlNjQ3BIdUFiRlBm?=
 =?utf-8?B?K1JZbm9tSU56UDdYSGpuNmZPZW8rMkpaRmQ1RldRS3RNZjRSVDFaZnFRdmRB?=
 =?utf-8?B?by9EdmdQQWtlWTcrOGs5Y040Q2FYZE9KTloxSUI5V1FHdzNvS0FPUUdhS3dv?=
 =?utf-8?B?ck1qYmRLQlM1dmFmRytIdi9EdkgrQ0cxby9RSmhJRHBrR0l4dVR4STBTdHcy?=
 =?utf-8?B?K2gwRjhpT0wvWjZPSEJNclQvMldMWDdZMkIwbXR6UUJvYjVFdmJaMkkzS1dO?=
 =?utf-8?B?RUVlOTViRy9pZEEwSFNhNnlQcUlRNmtjN3ZXanpMMmI1SkV0YUtEdGcwalZp?=
 =?utf-8?B?RGRneUF3eGZUWDdYQm1aM0o4UGpOTVFocW9nZ0dma1pBKzNqWmgya0VabWU0?=
 =?utf-8?B?TGFUaTZ6cDNRUE9KN1hTZ0lTMmxXY1FRWU1nN3ptZDdCRCthUXl3NzliSDJL?=
 =?utf-8?B?L3pja01qdDhvbUt1am44Wm5pc0pESjFBdnI2dXc1VDcveHhuYXlGQy90VlVy?=
 =?utf-8?B?OGdwWGg3UDkrazlMNzk3Qld0Z3l6MGFRTmlMcEgwZmQyZGRjTm55M3ZxZ2Ix?=
 =?utf-8?B?SldkcTFPTzJpTHFHVjZlS3JKUC9VbkhtUmxpTDVqZi9XVDd2ZFh3Szh5NEVI?=
 =?utf-8?B?M1lXbnB1VHBLVGlORThtM2dzSU5yd2tURHBEOFE5ekRmZnM2WHlWY2k2ZXQ1?=
 =?utf-8?B?Q1BQNnBoS1B0SU14d3ZWMmVNUWludHk5N0dRQS9GcVpMTHNwOTI0R1U3aHJj?=
 =?utf-8?B?SUg3SkNOKzkwRWVPUVJwTlkrcmZxUW1mMGt0bGY3VFJoU2Q5K1RnWlpKdTgz?=
 =?utf-8?B?K0E4UEVzRGFpalZQUU5lRDRyS1VDYkVKQk9QMjhEd09wZ3hra3NyVmZzbDJX?=
 =?utf-8?B?aHVZWHlOU1k2cmt6cStLNVpqNnRpT1BIZnhBSjN4Q01DRTNEUUVubG9UcHY3?=
 =?utf-8?B?Z2NxaWFrU3EwcnpNcEZxMWs2RzhBVnA4eVVacllNYVF5SDEvcjV2QmFuTU9r?=
 =?utf-8?B?QmZoOUlmeDAwUVRGZUo4UHZuNno4Vnk5RTFuZ3lXNjFHT1huYVFSM05Cdjk5?=
 =?utf-8?B?ZkpOWUhFcVh0aTZRVk13TTNBMnNDR2Q0dFJqK0IydDZhcDNRT0xHZ1p3SEVx?=
 =?utf-8?B?QitFdG1GRHJidmRGRFBVYXdudUxpbk9XMmswdDVMbk1iNTFtUUZ0ZEs0REhE?=
 =?utf-8?B?ZGlUL05rSmlFMnJnazhJN2pqcFZNTlBGMDdrREtrT0JZMFcrSGpBMW5taVdn?=
 =?utf-8?B?ZWxweDdxRno1THZ5Y0xNZ2xoSUwra2M3bUxMZkdjb0Z0T2p4RmZFZ0FBeWNV?=
 =?utf-8?B?VWhHcXpqdUxzMVpDc2NOdWFnUkxiWG12TnAvRW4zcUR3TW0wdGhmT1RBNTVB?=
 =?utf-8?B?cDJVUHJKZ3I3N083Mmx3WmlJY0xTR2VVZHgrSVNzcG5oUE91UGloZlVVUm4y?=
 =?utf-8?B?dlM4V01oWExkY3JtYksvRXkvZWdyVEo3RTZkZnI1bVdnNkpqdTIzYTVQcUg4?=
 =?utf-8?B?YjhmdWFaWHVHUVRaNG45ZEpwNEdLN3VkNlBLSnpKck0wZlBvUUVqRkxXdUQw?=
 =?utf-8?B?aHdLdlBNRys5aWJjSTZhbmFMVUIwVEZTVmJ3eExnRDRMU09xRnJLNEtsSzFC?=
 =?utf-8?B?aVZ2dWoycmUxOThNb1pUQzVKdGpjWlI0V0lUQUxYc2ZnSVBCR0JUWk1wYWVE?=
 =?utf-8?B?NjQ4ZHdwOVJabHBqR3NaZFRTbURVcGFkNXBMNFRLY05ObFVLeVM5a3RUenVw?=
 =?utf-8?B?aTRCQktaVC83SWptWEwyWitOalMyQUFZSHVhMTJtUTNzUjRwaDNzamRvOVJ2?=
 =?utf-8?B?ZGJuRUVZcVNxeVByVlB1RVc0anhNRDdYMCtVNGtsTXJNU29idGZ3Yk94NjlK?=
 =?utf-8?B?SGZhNU1WMWJDb0EvbFMrV0VxTUpkclE2cHA4R01RaEJyQ3RoSFlKT0tvRVhY?=
 =?utf-8?B?SWE5WXNOaUtiazE5T055dzM5UU9HbXFGWjdqVy9ZT1JLYkNWOHlhUC9HbXgv?=
 =?utf-8?B?SUh3MDhTT3hmaStzalBtQjkwUm9wdS9vZld3UzROcWhZM1BLWlEzdDI2V2dC?=
 =?utf-8?B?WVFjeVFvME9rQm5QekNPYzFSWXkyZ0FKakJpeFNObjJlR1o2Z3FnYjdEREdG?=
 =?utf-8?Q?ZVQd2AhudpcFTeQSbuvJgpuSRcGN0LsRMnEF/MMqD2Lc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8a74c2-cd76-445b-f8f1-08dd78f1744a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 12:07:39.3606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEuWAZBydzOhowUOO8Bf6DWfnXBfv/JV4I2S9mm7tXr/5FukKc9k96BrcX0uxNxitMC85pDjTHc9zh1TOYhyLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7877

This enables the creation of trait objects backed by a Box, similarly to
what can be done with the standard library.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
From this discussion on Zulip [1].

Heavily inspired from the similar feature on `Arc`.

[1] https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/topic/Trait.20objects.3F/with/510689662
---
Changes in v2:
- Use where clauses to improve readability.
- Fix build with rustc 1.78.
- Link to v1: https://lore.kernel.org/r/20250408-box_trait_objs-v1-1-58d8e78b0fb2@nvidia.com
---
 rust/kernel/alloc/kbox.rs | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index b77d32f3a58bab5ec73c612bdaaba0d79bfdff65..b9a905cd4bd285782b0db284b6771aec03e0c10b 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -32,6 +32,8 @@
 ///
 /// When dropping a [`Box`], the value is also dropped and the heap memory is automatically freed.
 ///
+/// [`Box`]es can also be used to store trait objects by coercing their type.
+///
 /// # Examples
 ///
 /// ```
@@ -62,7 +64,33 @@
 /// `self.0` is always properly aligned and either points to memory allocated with `A` or, for
 /// zero-sized types, is a dangling, well aligned pointer.
 #[repr(transparent)]
-pub struct Box<T: ?Sized, A: Allocator>(NonNull<T>, PhantomData<A>);
+#[cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, derive(core::marker::CoercePointee))]
+pub struct Box<#[cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, pointee)] T: ?Sized, A: Allocator>(
+    NonNull<T>,
+    PhantomData<A>,
+);
+
+// This is to allow coercion from `Box<T, A>` to `Box<U, A>` if `T` can be converted to the
+// dynamically-sized type (DST) `U`.
+#[cfg(not(CONFIG_RUSTC_HAS_COERCE_POINTEE))]
+impl<T, U, A> core::ops::CoerceUnsized<Box<U, A>> for Box<T, A>
+where
+    T: ?Sized + core::marker::Unsize<U>,
+    U: ?Sized,
+    A: Allocator,
+{
+}
+
+// This is to allow `Box<U, A>` to be dispatched on when `Box<T, A>` can be coerced into `Box<U,
+// A>`.
+#[cfg(not(CONFIG_RUSTC_HAS_COERCE_POINTEE))]
+impl<T, U, A> core::ops::DispatchFromDyn<Box<U, A>> for Box<T, A>
+where
+    T: ?Sized + core::marker::Unsize<U>,
+    U: ?Sized,
+    A: Allocator,
+{
+}
 
 /// Type alias for [`Box`] with a [`Kmalloc`] allocator.
 ///

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250408-box_trait_objs-02a700401f0b

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>


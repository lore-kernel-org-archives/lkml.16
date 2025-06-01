Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617486ADD;
	Sun,  1 Jun 2025 03:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748746853; cv=fail; b=dULo8OPFn5tWugK5Yv49lxRrwsiXbgBy5ilkWKIMOh1kO81zy7vrhMizXzkp68mDGlzjanSjYdigx+KCjAYurGLyJmPDX81FjUfm7z6vgq4HdOpe6rnP9hywihRyvgmo86kgvIPdEg0i816ioZPDQetjah8UCpzeXl14AlLPcXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748746853; c=relaxed/simple;
	bh=LrikHPp7PQchiAX3alXXX3KOTj9wjhG5lSgAf1iaDsQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=B0WAJOu47fxdbYsM5eRQHrTbZ4Z3/Tx92IB8iONFPqVUljEBkrS5HdN1ci0tbhsU+QXpiuEtrMm0NBOFSAFB6Cid53V7BNrid/cXDUdD5//jO6DPNfYuwRPnkjCDwcMvMVyqhngLCVlETzFTMFRMRuwxLs0oLnvEZNyhPrX2M4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tnFYPOfy; arc=fail smtp.client-ip=40.107.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tnFYPOfy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRjrP/ce35YAKfgxjC9otE7MsepHNu4WCDba3NGYuKCcgEZQb/l3BX8QBXTMLgrVRhRVvUKAZGLftnDOPMkpzkIbId1T9kiJEXxJVDayAh9XY/I9KO1cTFPHPsX+P67BhhlYc/SD3yIX8Yvs7D1l2spHX/lBKMN8qSjA8Syznfa17zQJhV+/fe04JAmnlR+3dyLUlNBt3CZAK5TkJF57qtH726GhOyCkAE9c3MwNu4Q2RyaITsCjoZDD8OSkRwyDQ0hXVU7dq7Z4lWCi1w63aCtVo508rw7Xe+sgPqG0gZVGhNWeRg79xKvtU0DoH9EdwlYrSKDroV4OnHCAnm2xQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVFE8RLv0bJF2HGiJQbjYDA/efpJfbl047vjuHgHeRA=;
 b=eUa1XaD4BGkrGAUXGMouQQbwS9yuBrzN8oGoHrOQ6PAP0g3wEhxUKGzABBJtAQ99ke4TGFoqJfeSTvtonjBULkg/uwWcV124xzhlPep1WM7l/iug869eJqS8MZ/CZcDZwkn45hYy01AYbepmB7g+K4b+mPkMHcUpPYTbWGaPy9671jk4dHE6cW7uGIgmW+hBi4GBP8Xo+rj2bRd5R81skUX+XQqBuW4sOcQaQ469aGAMqjBLkAN3mBeXKWHyuzgm1/04TUP3bu64OiaUKeWQaZ5Ix0nDCd8QkGzL8yNiaZ0iCxxpjgTlgTxbQGDTt07N8kcFQrNltX4q6fK7WmSehg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVFE8RLv0bJF2HGiJQbjYDA/efpJfbl047vjuHgHeRA=;
 b=tnFYPOfyvW6fW9yg80Vjy8Ao7aPVPqQRHt+pud3UjxIIj4mZjzep2FzxClznn34DQIedg9YziIjs0OlPqkigBeGoNsgSVrQC0hC9wnOpjYrYyMYzED+LENBhGcC8+DMAvNwdkygtMXW02YN9il3H72WHtX8CEDLrOyfg0qkQp0DCOE1xb+QiIsbNJiS4ydIRbFfW55Iez8vSu5Xxk0gKPMuRqkyki7pGG8s4y6ppLZQBAzxOGC4mb88E5dbC0IaNMh4rHMJWwnCl3bJ+vzU3gxxFg1J8rwqhKvpOseD9jI9bLY/38BcsqNr5XuzCoV7V46B134L1GFaA0NLaxS/z6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB9504.namprd12.prod.outlook.com (2603:10b6:8:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Sun, 1 Jun
 2025 03:00:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.029; Sun, 1 Jun 2025
 03:00:47 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/4] rust: a few common Borrow/BorrowMut implementations
Date: Sun, 01 Jun 2025 12:00:38 +0900
Message-Id: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFbCO2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU2ND3aT8oqL88vjM3IKcYl2LlLTUNOO05NRUS2MloJaCotS0zAqwcdG
 xtbUAwfY5tl4AAAA=
X-Change-ID: 20250531-borrow_impls-8dfef3fcee93
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0209.jpnprd01.prod.outlook.com
 (2603:1096:404:29::29) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: ba972b80-f746-423b-0375-08dda0b8819f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmdhNVZVd2pYWHVtbHFBaFBlTkpXREt4eEV5MGg4RGw5T2NNQml1Zk9KTnJO?=
 =?utf-8?B?UDZieDFRMDFxSjluTXhkZW0vaThNRDZqTklySDdOWnNJcGhSUkhwZyt3bmUv?=
 =?utf-8?B?Kyt4OEZJTGkyR1d4QUF2L3hkN21Bb0VRT1hGQUlwTjNtazJvb3FCVzBtQmRi?=
 =?utf-8?B?OUVrWmRhVW9nSk1QSEk5Vng5RkQ0ZU5STGxGWXVZYlNDbnBFcExuKzV4bHM1?=
 =?utf-8?B?OEJnSE1HaGJzMnk2TW1pbmFsT3lOeHF6dFAvT2ZzYVJqSFF5blp1WWMzclN1?=
 =?utf-8?B?czd3eFdMRkVBNnc4bkpQMkZSQkYwRWQzOUlna05VYVk1UkZJVCtnblRmREpV?=
 =?utf-8?B?eUsvTnNFQkNqdFVpQnI1K3B3aTdETXZUa1pnbm02bHgrN0tkWDlJaEZtSHE5?=
 =?utf-8?B?MXd1a213RGlzbEY1TkJLdnF5UTd3VDhXRExhMlhnM2xIKy9Hb2JGbWJQUEhQ?=
 =?utf-8?B?SVVyTnlqMFVQc2pBTmRlSjk0ZDJnTWJ2aXZOKzlkbzQzQnRtZ1RrRk44LzBh?=
 =?utf-8?B?U2pza3krSWYxZmVVYXdqTlhvRExwRW50N2k5REF6SUZGSitzTjB5dEtpME1l?=
 =?utf-8?B?ZE0wckFvbUlBK2xaeDJibFU0VG5JajFkOE5HNE5CUXV1R2JZU1orU0d6bDgw?=
 =?utf-8?B?WUxhNzFXa0ErR3ZacDh4T2ZZdFlabFlEbURKZ0NlNm1rSC9XYStOdytjdEpy?=
 =?utf-8?B?S3g0UVJSeGZNSURNaUVBMWVjWTRwajlhZGZjNDhLYSswYjlsV0lRQ2FlelVP?=
 =?utf-8?B?eWwzbkJ3bFBLWnlTSzhmMU5Da1I3aHQzQ21Rc1NxR0dvekZKaDVPUDJiajRs?=
 =?utf-8?B?NTBOdEJtYzZMWkFMMWQ3aW9kdjA4bVNybmRmN1k5TWh0OGM1RVBrcWQwVS9F?=
 =?utf-8?B?S0g3dUNVOGFzUDlCR2VCcmVqdmZNY1JCNTdSbzk2bWtJa0ZaWU9PbFpFMjcv?=
 =?utf-8?B?NEJJUjhuZmcxSmRBTUlvSk9XZGFaejRjaTFhaDdWeWlQaTVmNTE0dGxBVHo0?=
 =?utf-8?B?QzQwc1B0VU1WWjdHeFpjR1FUM20wa3NIMlZDOUZLRGRLTkZmQmlLakRxTFpX?=
 =?utf-8?B?NzNhaDRyLzdzS0cxR1dFK1NwcERSa2swUDMvUEFtak9NOHRwdTh3TGtUVEMw?=
 =?utf-8?B?dHNERjlKeGZUb0NWSGNYbkRpWDhSSnFtSVpVR01YekNVS0daZndQSktKRHdw?=
 =?utf-8?B?UW1mYVA2N0Y4TVRXSHJoYlRSclE1c3lObkFTRjB1MUdvY2tPVEFQRTFjMlF4?=
 =?utf-8?B?NFJlUWlmUllpR0pldFl1bVdHcThWNTVubmR0YjFncFRiYVhETTJHaXZZMHQ4?=
 =?utf-8?B?VVFoMXYrMzJ3N1pLWjkxUTk2YjlEZE5ZcnFSdkQ4ZUQyU2tWUitwWTlUeWdE?=
 =?utf-8?B?VG5Tc0ZYalZ1ZEttZFd2UFdpU3NEdFlBblBZYy8xUjZJcXJZbERwV09XRHU3?=
 =?utf-8?B?emtjTlNVOFl5M0NQWmpNTm4wZjFhRHNwaURjOXNXVll1WkU1SkZEZGRTMmt1?=
 =?utf-8?B?cXNZYWdyNzdBQ3k5dmlkb0pTZ1FudDVvVkxPZUZsWmgwUGV3U1RaTHNrWEsz?=
 =?utf-8?B?Njh2YVAwV2NTV2dpTDJsRlpLemgyZFdkbC9VYkRyVWxDRmhidE0vK2JxcDRI?=
 =?utf-8?B?QkQwSDNyMXJ1OW5DNjFxd3Z5TzR2LzlJVkJ5T2pDc1NMamRqb3ZJSkNLTzRz?=
 =?utf-8?B?R1VuYlFKaEFRMnJyRGpvMzJTelF0RE44Z2g3MkRHT010Vi8vWTM4MGRjQ01m?=
 =?utf-8?B?d1RxZ1B2WkwxTDIrUXVJOG9sK3VhR1oycldmK3dudkEvVzlxTDF2Y2hKYldu?=
 =?utf-8?B?L3hkMEhhTzJvZTJNYkNGelJmVXMwSlk0UitiUHZNN0Rqa3hPMjIvaS9QL1RC?=
 =?utf-8?B?ZlVUL1Q3eCtMcGsvSjNEY3BvM2x2ZUxpV20rQkxBVWowWWtNalhwQ3lsVy9x?=
 =?utf-8?B?anBRaU9FNXFLcEpDanlLaWIrOGt3Tmg1bGtXTXQ2MDRnRlpIbzlNcHAxMjBT?=
 =?utf-8?B?VjdkUisyYUd3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWFHQkxNMGNUTVEwVlBiMm5PdDJ6WGNaeWVnYXpMaDdjRzdjRHNieE4zMmE4?=
 =?utf-8?B?Q2ZlS1ZSb0NwaWtOMUdTc1dzNlV6VnA5N3Frc0puUFdob2h3Yi9lU2xlR3d2?=
 =?utf-8?B?MHdCdVlZNlhnTjlzWGlGR2ZiNjlpRGJqemdVOUdRQzk3YzdUb0QrdWtxcERp?=
 =?utf-8?B?SWlhNnBodHcyaEFYMEp6RnJxRlV5MzZLT2pSZVMrTUhoUkNoMUtja2VSYW5l?=
 =?utf-8?B?b1l4WjB4dGh0UFhhb1RvNVArV21rcGo1ZCtLSnJFdndSaEpYNXZQd3BqRFFQ?=
 =?utf-8?B?M3hYSkYrYnZ1VHZ0bWRvMlF3NkQ3azZEUWFPMURWTC82VGxZZ2VnY285bWl1?=
 =?utf-8?B?RVBZb3ZXV2t0REpCVVovWWJCTGU2c3hNbFY1eHpkVyt3NDMzV3UycTE0QVY1?=
 =?utf-8?B?ZDk4dVlvdTNEZzdrdnZKbndCS0E5L0VLQjVMdXlZUVlJRi9hOGlWSnlhS3lp?=
 =?utf-8?B?L1NCQ3dXalN2NGxHQkhldWczblhBV3dwYUJyVUxTdUVWY2RDWStjU2Uya1Jt?=
 =?utf-8?B?L0Z5NTdDc1ZPaTZBdnNKa2Q4THZySm5zSTc0N3M4TGNGaEFIK3dLckdmZ1A1?=
 =?utf-8?B?d2NIYVRwbjE4WkU5NS8ySVU2NnlqQTlQSEJxZ0FtYTB2YXpsa09JVllwZHNu?=
 =?utf-8?B?cFZad2c0cDI4M0tCWW5adHVQN3pTc0tiZ3NSZ3g0ejV0R1lJR1kvWFFzUlpm?=
 =?utf-8?B?ZDNab1ZhTXp1a2o1Ym1abHdxODA5d2E3RDRDRXdNOGR5OU41YlV6SzBQUHNK?=
 =?utf-8?B?L1RvajNsZnRIMjRhNmM3U0NMSDBlelRkK3pZSGhlY09GSFhaZ1JEa3BNWllC?=
 =?utf-8?B?OHEvc0hickNnL1cxVitnQTJEMkdGUDdic1g3R2xqWHhpNmoxdjZoekpYREdM?=
 =?utf-8?B?K0F0ODJzRmdxNTUyejUvN1VMdGhydGlIMzBSbVhtOWhCalg4Mm1IN2pEMUpE?=
 =?utf-8?B?OWt2TFd5dDAwTGd5NWRaOW5GeHNieGdoVDBYUmZucm10QWg3VGRnY2VjTDV4?=
 =?utf-8?B?QStBN0NBWVFmK2JvTElLcGR4ODBGb0krSkVVSVV0OU1ldVQ2eGx3VFZ6cW83?=
 =?utf-8?B?VjdhVEJ6WHFpY1NLdlNveFhGQVM2aVFNQkR4cXdVNFhkbW5FUFhEaC9qelp4?=
 =?utf-8?B?OEE0VWhvWUlHSmg5MGljdlBuVloremlUUXhhMlI0YWRTMENpdVhjQlRwc2VP?=
 =?utf-8?B?czFNRXNWcWNSaVV5dmlkSGdXZm5wbXJrbXpqUW1DOGRVeldWbUpabVJUTXBw?=
 =?utf-8?B?Q0FwKzV6aHhPMnZqTzdpMnlZOGlHL3NWTVJxYSsrQlQvM08zd0czMDNqUVRG?=
 =?utf-8?B?d3RTTFA3eXdCOWR0QktOdmRydnpUREtJK01vcUxmNWtZdkd0WStPV2I2REV3?=
 =?utf-8?B?VE5HOW1rNzJyb1hiaXhMRzZhS3FGU2lheEoySlhESGsveDQvdHVvc1lSVUgw?=
 =?utf-8?B?cUFza0xIcEtBZGJ3Q0dsVGpxbUh0N3RFTlZTeDFhazA3SDJaSno1Z3M4UjRp?=
 =?utf-8?B?bDFCd0tjU3hVLzlBeTZxMUE0cDlURjg5clMwYmN0NnlsMDMwR29kZDVLcjBj?=
 =?utf-8?B?WVFmVTlRSDBRaGlDYjI3a01pQ2t3OTdGaWx5OGVyZUg0VU1lZ201K1BST2dH?=
 =?utf-8?B?KzJWaStjZVdhdENZRm16dXhaTTc5dTFaeXp6dWtScWVRV2k3bGFSSlRWUHJn?=
 =?utf-8?B?UStPL1Myb1c4MWRPWnhNRmxGbXg0SVRZSEZGeUNrSWlqb09heWd1azVaaEJj?=
 =?utf-8?B?ZVF5SndXRkhoNmtXSUtTTHg0MFZjTGVRUWtBaTlsS1lUa2NhVkFpT2h4amty?=
 =?utf-8?B?YzFuWEhuMWRYZDBISWt1RXZNbW5iY2ZmN0FReVdSc3dqVWV4a3d4eXd6NHNj?=
 =?utf-8?B?UGpreFk5SVlhaFhDNS85cWlYa1V0MlU1T1BmU1pCWnk5M0ZzenJLaHpoMkM3?=
 =?utf-8?B?aVVGdXhCRjI0K29TR3R6ZzNhVWV5NXNsaHdzYWVGb2cyTUw2N3FtWk4xMXZl?=
 =?utf-8?B?S2NuMEkrSE1rT0RiQTZ4Q1Q2SVl3dFhQa1ZmNnVaWFB2M0d5dnlhYythTXZD?=
 =?utf-8?B?NS9ZeXp4OHE0cVB4bTBwYmhvbGFKeVhWdWlRelhBblp2cjc5M25VMFpKYmdl?=
 =?utf-8?B?NTlLbEJPZzY5Ui9ZUjdIYURRL2lkRkY2WHZhWktMSHBqNHpOVW13Ukp6UXJx?=
 =?utf-8?Q?LCy58lA1CKY4NH7+ly4ZuCmPo7IReFpe0vSXZeGxY1W/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba972b80-f746-423b-0375-08dda0b8819f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2025 03:00:46.8622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wH53hJVJmH5gHgZjcsMVOCpeKw0YWdTihtcjz9tMPLCOlaS+gI0X1C8YWkk6uPkxzCIcs5E+wIU1ZtgalbrCGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9504

The Borrow trait has multiple uses, one of them being to store either an
owned value or a reference to it inside a generic container. This series
adds these implementations for `Box`, `Arc`, `Vec`, and `CString`. I
came across the need for this while experimenting with the scatterlist
abstraction series [1].

This series provides just the `Borrow` and `BorrowMut` implementations,
but another common use of `Borrow` in the standard library is to use the
borrowed type for key lookups in collections. For this to work, a few
consistency traits (`Eq`, `Hash`, and `Ord`) need to be implemented. I
am not sure whether we want this on kernel types as well, but please let
me know if we do and I will add them in the next revision.

[1] https://lore.kernel.org/rust-for-linux/DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (4):
      rust: alloc: implement `Borrow` and `BorrowMut` for `Vec`
      rust: alloc: implement `Borrow` and `BorrowMut` for `Arc` types
      rust: alloc: implement `Borrow` and `BorrowMut` for `KBox`
      rust: alloc: implement `Borrow` and `BorrowMut` for `CString`

 rust/kernel/alloc/kbox.rs | 21 +++++++++++++++++++++
 rust/kernel/alloc/kvec.rs | 19 +++++++++++++++++++
 rust/kernel/str.rs        | 13 +++++++++++++
 rust/kernel/sync/arc.rs   | 21 ++++++++++++++++++++-
 4 files changed, 73 insertions(+), 1 deletion(-)
---
base-commit: 7a17bbc1d952057898cb0739e60665908fbb8c72
change-id: 20250531-borrow_impls-8dfef3fcee93

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>


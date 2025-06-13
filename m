Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020FD2D5C79;
	Fri, 13 Jun 2025 13:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822395; cv=fail; b=aP2g13YlBw2/2Zx/7DY3XWVvTASJde04tAqGm4rbb768MP0nOd6rCO2f4rq3seJHpxcbERCoNd5Ak/Cuwp15sKH+JJKAqedtW9+w8nwHdEvLNS7JtlI+O5cLNLZ6P18WGVXTQ13NFdbHmujv+W3PDLL+5wP3Na8LyfzWM4cJ59c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822395; c=relaxed/simple;
	bh=kr1y0SYHNZGMDzE+p3pP7zUxKLUCBH4I18+/ahL93gA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FwI1MAQ/pdOQcQDpPlZPBXg2gYupyv++mJmx8zd+bAcaBaVLZF2VUrBkapzG2pAbxC9AXjk4h9FQWZ8KDuKsS7k4V55XFUPffuRMtmuU1HsD6iDqDHE6YkBQJY+/NDhrQEGQ2OsUwUJ3gIrmlD3aJC58pzMQNYqVSpasf73UOU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LGSt2vAJ; arc=fail smtp.client-ip=40.107.220.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LGSt2vAJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etxv1PtnmVpJ5jbVXD9VOJVMfnwXnUHVTeHocplqMvOMUtp6+bZjlrGWXtnCjBHMys21xyFW3EAlcD4hw9TzcgtWoKHemHVUeW+vDxmH0/oD29GsX827FeF3Brhk+gtOt3/T4oG/fJTd+397if6tlPsI6AdccgMxpU3PRzucMFH+8xCvDbOBHaTNpEaT6w8eT78HxC1GaLmsIDgiy1az0oI3Dzxie0iKNmsNWrJDcQEXAix0sq15zsD5nKyaWAE5MebQ7CHDeyGQvZOKIUx/Ccb3Xb2SHzP61ljEOJ9dCvzWMI23LRB3NkFyul5XqdqW39egwj/WPbZzb8Uzg65N1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FV0y9OBHkVsRVwylRzoB9AXVwlJbrCOWJ+BfI0MNMc=;
 b=syCJW/rP98PXSHEldlmvLbHOwPFRiKm0Dz+FaPuW0Qz6qC4VIQBgxC0LVpAa6cauwfZS7NYVCp1e4Od8pkaviPgaUiw9JQZ+L13MgVdj9f5UbFeZUjP2AFe4m7SXZOq1orPDbggX9CfLNnD4T545zVmP/ghbvmsSAjxcaWTLfXt4MJk5mSzBsGru1Ex2z2yMCCx7uV99NUvMVe+CtHQKYwipnLGBgO6oT3yo0uGOwSQSMzRzmpTO5SNdt3O/VHKVVY+CqNwjooe3Ff1tNg2EKWmkGcdzLnEPbN15JAKdwlz21HgegpK57tOAMUOJ4JXXwOeKnh5EsTSCaDcTpWAm/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FV0y9OBHkVsRVwylRzoB9AXVwlJbrCOWJ+BfI0MNMc=;
 b=LGSt2vAJlm9iqiBgs6hAkiQ26eokqubcsm9hGsxIW0EdBAfKEvK9d4ii7C+bIneDqEc9BxsILJQjCZ+H1K9QSkR0ShJrJNuOjtiKtMLoSiDICkUpsocg1VCgpK1Q9dW6lnQJfDTyA1SWBHO7wYPGLXzz/FhCfODKsXAmxHCkrKQQNmwHhyIbdZh5X9W4sakuIEVvkJz+7BMhoZS486IGZtKDFaEo46PFtMSefYLHE+smyz0U7V8ib+UhKhuPQMzgPHbqi4dA6VWkNYTV0BoiRzO/IZ8pitVM+mOsbGibjPfboozx5zxcjMjwrgfIUyko4e5WtisoNwu6Biyh6hciBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7892.namprd12.prod.outlook.com (2603:10b6:510:27e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Fri, 13 Jun
 2025 13:46:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 13:46:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 13 Jun 2025 22:46:10 +0900
Subject: [PATCH v2 3/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `KBox`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-borrow_impls-v2-3-6120e1958199@nvidia.com>
References: <20250613-borrow_impls-v2-0-6120e1958199@nvidia.com>
In-Reply-To: <20250613-borrow_impls-v2-0-6120e1958199@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: ed834c26-34fe-4d7b-811d-08ddaa80b437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFhwNlJLb1dXWFkvOVdSZkhZVXhBSWhuL3FQOWdWd0VLZTFEcUVVU1lZRTk4?=
 =?utf-8?B?L0ZvU0M0Z0dpOENlUmwwVmdFMHg4SDBoRG9kMlYxd2ozdjlkWjFyTnhIck1T?=
 =?utf-8?B?RmoyelM2c1d3WEZPTXo1MEVqL1JaMjh4UDhNOUNvSDlQcDNpLy9Kc2hUUHpj?=
 =?utf-8?B?MGppanhVZjRqZFBMOUVpVGVjMUhSL3lmSnAzSkh1OXUwdjMxTXZURmU0UXRO?=
 =?utf-8?B?eUJTMm0rSVRqWTBxUXg0dUtXemNtR1ZUWWdUMDMrNHZFdEJmT1FQUTdreHVl?=
 =?utf-8?B?WGJENSsvRmlQNzNqZjE4bU02MG5Dem9RT1dRbnRMSHQxSHoySHg4K0UzZ1FZ?=
 =?utf-8?B?RkN3V05rTGIvUWRvcTR6Y2grS1NuMzZLQUM5TzRnb0xlNkZkRGJybDdIdGV1?=
 =?utf-8?B?SkowMkVsbXFZNytKaXNDak41S0ljMkExVDFYc0dKUElZZ2xMYSt6bEpRK2Ja?=
 =?utf-8?B?d3M0bHQ2YnBrR201b3hURi9BSUlVbHU2YmJOSUgrV3J4SjNzWmU2QWdMM1dR?=
 =?utf-8?B?b2I1MW9PMDJ4WDA4K2pwbllLenA4aWVNZ1ExMVlqd0NFTi9meXNqUW1Wd29K?=
 =?utf-8?B?VkttMldsVy95SXZCRUZJRkxZc3RUTUtMUEFZbDNETlpwT0ZNdTZvanh2YmVu?=
 =?utf-8?B?Skd2c3ZwSkJjRjFkbWQ4NytPUFFIdnY2TXVIOHJjR0dkdC9OTXV4cE9UcWZM?=
 =?utf-8?B?ckErUk5wQS9GaTIvZXIwdEZYR3Z6aWpLSnhRUWwzK2FnQVdyZUF5aUdpdHlM?=
 =?utf-8?B?RGRucjRpNFFEdUpFWUFFR055QzhFbWZnSVlEVEtaekRYYUs5Y2tmUkNreVdP?=
 =?utf-8?B?RTN6bU1DTVdwa1BsSXlOV3BUOFY5STFxYTNZSFF6UVNUL2NEQVNiT2NrSEky?=
 =?utf-8?B?U3dsM3o3a05NRnJpaE5aWDJZMUpxWkVSTUpPZU1vaWFwQ2Q3WkJVZFBZRjcx?=
 =?utf-8?B?cGpocjMzTjhPQ0V3aVBpU0VCcERxNG1iWFlza3czKzQxdjB6b3lCa0RUbXdO?=
 =?utf-8?B?VHB4Sk53a01SZHlwTHdJOHpTVVJQZWUvdE9pRkJGYW1FclNPaStDa09nd3RP?=
 =?utf-8?B?T1hMbWxVTEdBS2F0V25hc0luNkZwNVRwTmNtQ3lvRGVsWDRYUmZibGNGQ3Bl?=
 =?utf-8?B?ZmdoZGxqcWhMcUwwbHYyUjJNNUthN1ZvQjdSNlFwVFVJekVSWHhlU2tPajRs?=
 =?utf-8?B?TW5weHIwamNWay8zOFV3WnNkVmxGZ25SbXd0eHRjNXJBY3RFdlVQTmVySmpN?=
 =?utf-8?B?bzNyaFNKcWF3dmNRb3pEazk1WDc5blFxci9kaDV2K3Q3TVB2UGZLRkNydzN1?=
 =?utf-8?B?bkxoc0pNbnliSlpYYUk4YnhkYjllbWNBS2F1NWRlZGdUTkw1MDhTazloWllP?=
 =?utf-8?B?a0V3WFU5V0c5NENWaGR1RWQ3dWNBUDBlNHU2cDQyVW5LMFZ5QTVlTkMxM2NX?=
 =?utf-8?B?aUx5eEhDaHRsUGZjRldOREVZVzJ5RVVDMld1MHQ2ZmgwdmlkZkU5a0xGWm9q?=
 =?utf-8?B?WHF0anRqUmY3RzQyMTVuQjhMS3VKVEhSY1B1SVBFdXdrWXBhaXV2Rm55MTJK?=
 =?utf-8?B?ZTFBcE9hZzBXd3BKRExnTFp3MGNtSEtKVHcwYUgzTklMeE5QSEQ2bXdNR052?=
 =?utf-8?B?eWd3QWMreHJKT1N4SE9xbE8zenBIUWJXbVVJWDVTeFhYWEsveGZ3K1R0aDJ6?=
 =?utf-8?B?RGlueXhoSE9EcHFrV3JnUG5lb1FRUi9IdkpFNmxqVXJTVnB4azV4M1N0TUkx?=
 =?utf-8?B?T1R2MlV2OHljeXhWcFFBVnRlQkp2RjlvNzBCQjBNdjhyczFQZW1VZ2JWTWhn?=
 =?utf-8?B?YW5UWWdOT0VGdzhlQWNBMEJlTlZYNEE3b1BMbWFoSG9Yd1owazNqVEZZZVho?=
 =?utf-8?B?UHFINE5hcTEwdklEemVoMCtUckxPSHFBbEpJeFJmcGhFcnl5Z1VIMlhieFhF?=
 =?utf-8?B?WHVQZDJEUDlzT0toaGF0M3h6eXQyRkNaazhoRXAwa09PVy95L2c2VTZVMElP?=
 =?utf-8?B?WDZxcmRqSEhBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTU4STM2aElXZ3J6ZVBzYm9YbjIyempNRURlRENrdk1YOUMwaE1TbUI1cDhm?=
 =?utf-8?B?UmlmWmpIcVRKRlo3a3RWRWFtZkV1WnRhcUcwWDVWSytTbm92UENUQzZEbGVa?=
 =?utf-8?B?a3hzczI2N3lFU3VtcjhKcy9lMjFxWFRFR0N3VkZMNm5Rd3VBblZBV2YzUDNK?=
 =?utf-8?B?YWN0QVlvNmpBbm5XTE0wUU9mdHArSnBhbmhpNis0WFhkSE1GekFVR3VFZysr?=
 =?utf-8?B?VUNVUUN0dytpQk1qZzBBbWlPWEhJNzBUbjI4cDNxVVR2a0NQSDhxTnVnUEtl?=
 =?utf-8?B?MTV3bjdSOG5iRTNPNCtBbk95c1Z4MHZCMTI3ekJEWTZFaXMreE1kUDd6YWlS?=
 =?utf-8?B?c3BrVFNIalVhbW5wKzRHTzR4QW1Ic1RLdEpkZ08xckdpWmxuQ0ZDWjFYQWls?=
 =?utf-8?B?ZTU5a3dBcHVFNWtlZGlGSit4MnhMS1VQVG1ZQ1c3dXM3c2NtYkRtQ1g4YUtt?=
 =?utf-8?B?L0NpTGRjOFlYbEVTWUI5MVFQZFZjNDNjZ0dCZGxHaFlFelI5YnhTTWhQSEx6?=
 =?utf-8?B?OXRzTUhiQlhQdlhuZ1kxMk5OTEdmU1BjVTdGdFJtNFowZmNOKzkza3JxSDlo?=
 =?utf-8?B?cmo4dmFPMjlWZVhBVXc5SFQrZDBqWU5lN3FJMExJMUxqcXpncmhmUmlDc2FU?=
 =?utf-8?B?WWdzaG1iWlh4SWQ2dTF2ZUhscUswNXlqLzUyeCs0K1JQZGpJRDNGSC9zNnZU?=
 =?utf-8?B?YnlycnRMNnBCbmNqeG9mV1BPbzN1Y0o5clVuSUtuWmdjNG1tTjZmSlhaVExD?=
 =?utf-8?B?ekE5bVIxWklaeDdsV254QXV3dlNvZVVhNUplMjhiQmxKVnppT0lOWGY4T3o1?=
 =?utf-8?B?a3J3TS9oaUpBVWtJNzc2bWhMZG9MSHAwZ1k1T0hDOTRSQU4wa2F6ZWRNMmNR?=
 =?utf-8?B?dFNQVzZQUmVnVGo4NDlRWndoL3pzWk1WSmR2Q3hDeEtESWNRbHV2M3JHenR2?=
 =?utf-8?B?Sm1kY2RsZjJIUE00MW5TRHZJS3dMZ0FTK3YvdmRVc0R1MmU5dThIMHhwa2lk?=
 =?utf-8?B?K2RMeTdlSjlnMU9YNE50OXorVlUzNUdRNmpBWDVTNGNyb3dXdHJyY2M5Nk1r?=
 =?utf-8?B?V2xXRCtaQUk3UGs1UGxMWGZYdkIydllTRTMrVzRpeUFwVnRWNlNZaW5ZK240?=
 =?utf-8?B?dnZ0bzlJNlZGZlhHTmJlTUdKeUpJb3hWM2xMOUtlbU8wamFMWDNlUDNOSExt?=
 =?utf-8?B?RnZTVWVGd2k5aWpqVlhlbGYya1VUYkVpREc4S1lxRmtSOE1nSk1wb2ZPdTBH?=
 =?utf-8?B?bDRhZ1VIZklEQUdjaWZnQmoyc3RMZENHQWVOckZuK1V0MFBFVWNRYUFmcmNp?=
 =?utf-8?B?K05TZjl6TksrazhJd2JMWjk2ZnZDanAzMnBoWGUxczgyamVOV3FicXhmQ2VW?=
 =?utf-8?B?M1dad0FJSlJ3ZXlVaytKczYvWS94emVadzI3azZnT0ZjcllHcWNCNjVnMkFw?=
 =?utf-8?B?R0lKajA2RExvOG5Memh2Qkx2YkM5RlQrR25hSnRJRUdhaSs0dnNicE1RU29B?=
 =?utf-8?B?ZWNvdGxjTGYyc25nc1NaVEFRbTdFekxISWJaMFFiSW9DeFVVRmk5b01HQWhY?=
 =?utf-8?B?UzJWc3dBN3psMU5CVldQVWJsd3Q1OEN6RG1ydkFEcVdnMFdTeFpaWCs2Wjgv?=
 =?utf-8?B?dGMwbXBWUWNGcXlrOW9iOUJGOEpDYVNzS1ZyUDZGMWVpTUdMOVEydlFIZXQ3?=
 =?utf-8?B?WVZLMFMwcS9YWTd6dHhIaVozbWpRMFFYWld3UDBxS3NUdVVFLzhESDY5V0lm?=
 =?utf-8?B?VFZaWjJvNnprT3pwU1hOU1Y4ZnBWOGdncUh5ejNEYkhaQStVOGxEYUxPLzJx?=
 =?utf-8?B?U0VvQStoallLR0wrdXJ6RGJwd3RWZXQ1TmRxaUN3MVdDV0NPNFJudUFjSmln?=
 =?utf-8?B?MzF2RUFWcnlwMlkwUVhGY0Fja0dIeU9rTnZjdVZjcGRaM280TWtqRlJCazRX?=
 =?utf-8?B?ekw2ZG1Ub0lzN0lMYjJGRUFGTy8yVS9vSVBhSjhsYklmT3hWWnBnY3hRSWp0?=
 =?utf-8?B?NEpsSTRONjMxZGNWVzAwSGlNWFp3dFg1V2EvOGRxNVNJWTMzaUZRMmY1RTNi?=
 =?utf-8?B?YzViUzEvaW9MbWNTclI0RnYrU2x2VnZDb1A5aXY5ejRCWHlkK3k4NFVTbzAv?=
 =?utf-8?B?Tjg1WmtGbW5SOTdQMzZsMjlxdTRQUFo4U2JybW9wVk05bjArcnFlVTc2MGFi?=
 =?utf-8?Q?m0mAxfEbn4R2yZmt0n7CQukvAodqoRnVJVNmIvKkqkRZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed834c26-34fe-4d7b-811d-08ddaa80b437
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 13:46:31.5048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+qnTos91VMsPpZvnYWEXZbD0QszAjVp+dQdB/zv77uSaYKN6vM7g+GI2bQLhC03SAS2Da4UHWGq/D5+fUS0OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7892

Implement `Borrow<T>` and `BorrowMut<T>` for `KBox<T>`. This allows
`KBox<T>` to be used in generic APIs asking for types implementing those
traits. `T` and `&mut T` also implement those traits allowing users to
use either owned, borrowed and heap-owned values.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/alloc/kbox.rs | 61 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index c386ff771d506a2eb4c211a93ea9b59bc04c93f5..0e3cbe809a878766ee8f8508ed0d30b4f8afaa07 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -6,6 +6,7 @@
 use super::allocator::{KVmalloc, Kmalloc, Vmalloc};
 use super::{AllocError, Allocator, Flags};
 use core::alloc::Layout;
+use core::borrow::{Borrow, BorrowMut};
 use core::fmt;
 use core::marker::PhantomData;
 use core::mem::ManuallyDrop;
@@ -499,6 +500,66 @@ fn deref_mut(&mut self) -> &mut T {
     }
 }
 
+/// Allows `Box<T>` to be used as a `Borrow<T>`.
+///
+/// # Examples
+///
+/// ```
+/// # use core::borrow::Borrow;
+/// # use kernel::alloc::KBox;
+/// struct Foo<B: Borrow<u32>>(B);
+///
+/// // Owned instance.
+/// let foo_owned = Foo(1);
+///
+/// // Owned instance using `KBox`.
+/// let foo_box = Foo(KBox::new(1, GFP_KERNEL)?);
+///
+/// let i = 1;
+/// // Borrowed from `i`.
+/// let foo_borrowed = Foo(&i);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T, A> Borrow<T> for Box<T, A>
+where
+    T: ?Sized,
+    A: Allocator,
+{
+    fn borrow(&self) -> &T {
+        self.deref()
+    }
+}
+
+/// Allows `Box<T>` to be used as a `BorrowMut<T>`.
+///
+/// # Examples
+///
+/// ```
+/// # use core::borrow::BorrowMut;
+/// # use kernel::alloc::KBox;
+/// struct Foo<B: BorrowMut<u32>>(B);
+///
+/// // Owned instance.
+/// let foo_owned = Foo(1);
+///
+/// // Owned instance using `KBox`.
+/// let foo_box = Foo(KBox::new(1, GFP_KERNEL)?);
+///
+/// let mut i = 1;
+/// // Borrowed from `i`.
+/// let foo_borrowed = Foo(&mut i);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T, A> BorrowMut<T> for Box<T, A>
+where
+    T: ?Sized,
+    A: Allocator,
+{
+    fn borrow_mut(&mut self) -> &mut T {
+        self.deref_mut()
+    }
+}
+
 impl<T, A> fmt::Display for Box<T, A>
 where
     T: ?Sized + fmt::Display,

-- 
2.49.0


Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4E528F937;
	Mon, 28 Apr 2025 19:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745870069; cv=fail; b=DyIPiGDNMBzdDypkpeE6r2g5F/TT93CIh8/8+Y1mgECftOtfaI948HBX/xgto5nvHfr92tynrFUF8pEKB8TeYCXbqyxfXfmXkXI6C/K2tIlvwLFqdAqhppg8UVF1BziqY2mLIwRmc4IoMXAFvspqFeFXpntLx4DId4vuYLRyN2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745870069; c=relaxed/simple;
	bh=bsa2uMu9NdZgGl58m8OTlpwyULNTviv3jrvh9bdkHms=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lsswtJULudWun4Y/HiurZDO0vyj7SNP4nUXKre7kcJwzExuS622vJ/nxnMZmV1oVu2fFrgYMnrDDjgNbrsy0aWFIaNz/EW8hQ0Nm1OwXC/WZ3t7d2oM6V/mO1OP8I18oae9WLsGf2tEw7ua8lGnhTmmNG6/Wc+v4xRPiMCp98b4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EGIPcT97; arc=fail smtp.client-ip=40.107.244.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EGIPcT97"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nK7TK5x5MA8j+cA8gXuesPuBpOM1XjlQIe2PHqbwimoCf4cla+Ya7P/6AydzVD9tKOxMawu+seW8NG1tSrvlCF3vGPElDfqItqxbswFP9OvSqJloAA0+L827q1BVrjvOQSCPhw8SNejTyIbH1S2gdDTiXUzJwiFyc5YMjU/7J1FTsaBbXWu/NDL8emDFjPxGKtCBDGmOeL6A9Sap+DM415Lrt8fbK2gWqHX+Q30+/z0K2wIFxtuh03c7h6HmMAqi6MYNq928HoARjYKnPatgkXABx7748QSmrWzotngMyC5v6cO6gFeVlxZXEH5jlkoDSZL1EN6fpbZV/3yG7lsILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUHZ9QUrgUGwYMzUrioROi7pcfytj3Sb5Xe9qSdilQk=;
 b=azm4PaeBE1zIC7KQm3twitIPtMbYQ8EbgsyAZMzhL1x/e0mMcrIRRJIcD1oKVY06VB+2edk0r1fuFgU7vOShtiuYkBOBy1IFRPnN3xCsfSZM4GvkScTRV2laI+NJDHjzxTL8hJwqyIZvwGvJUQlPnoxCy6+Z7BTyPsk22syhiNQICn7pq5HsMvHd1w3mJiy3EvNUsFRlp7r8GBS1jfQweYeivcN/B1yMxmYQSF6VarXlLPj72ntahZbaMX/jf6YuPZRm7xWs6ZYfAS3whjYwhGXeQ0RkGoks8QIs8Z1+qXfNf15MgYNB2jtCduFollKFw8nXNGWrPqEKH1WmKD24Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUHZ9QUrgUGwYMzUrioROi7pcfytj3Sb5Xe9qSdilQk=;
 b=EGIPcT974N55JS69HoLb7izIcbt7Yf+cCwmz9YQT392seLWYZ7DYvSUrNKMCL9CmfZ3k8YWtCBiNBBQ0inOiujDWAXZEh0CaRY0XllRNtWK7HkScqjWk9eRAttBSnm5eDRpOq+Hq66gs3TGy5xQYqShtsVzt3EtRqcuAowGq3BkwfUFF8cNWxDrUEoUPpMP7fWkqIAbVu6L0N7U0UYp9UEa/lFfom6+a/e6HPpexoDJ5Z5J6yMSCCiqtMV+RrdrF2r6nvQBqSUcbzdwUg6DNTAb7d08fkK53FhPgQpBYntm0Frt7WgfYSYbBxV4OGMaOdLEvLMMrflbvYDBV50HjMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14)
 by SA1PR12MB8698.namprd12.prod.outlook.com (2603:10b6:806:38b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 19:54:22 +0000
Received: from BL1PR12MB5945.namprd12.prod.outlook.com
 ([fe80::1faa:be1:ae57:44fd]) by BL1PR12MB5945.namprd12.prod.outlook.com
 ([fe80::1faa:be1:ae57:44fd%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 19:54:22 +0000
Message-ID: <509c3fb5-310a-43ab-ab84-75207e0c577e@nvidia.com>
Date: Mon, 28 Apr 2025 12:54:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: check type of `$ptr` in `container_of!`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250423-b4-container-of-type-check-v3-1-7994c56cf359@gmail.com>
 <34457c78-fdcd-4f1b-a349-4ca9bcc2febc@nvidia.com>
 <aA9M8_K0MQfWg52t@google.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <aA9M8_K0MQfWg52t@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0128.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::13) To BL1PR12MB5945.namprd12.prod.outlook.com
 (2603:10b6:208:398::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5945:EE_|SA1PR12MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fccd6e9-23d2-4af0-d1ad-08dd868e785b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajFORXZnSXl5aUplYktpNGgzc2RXYS9VY2U0NDhoVHFub2ttQ2FQc1JnS1Yy?=
 =?utf-8?B?T1kybVM0YlZtb0c2aHZVbkp2RC9TUXQ1d1ZPNmNaNitCVDNIdE5yU0lMTnRM?=
 =?utf-8?B?d01FRWR4STZ3NjgvTG9kNTlHTjlKYk12Y0tpR0REeThJT21aS25USm5mOHlY?=
 =?utf-8?B?ZXhaekZINW9YM0REdUNPbnoycDZLOTd0ZVc1Q3c1QmUzcVIrSkxYZHdwVWRL?=
 =?utf-8?B?RWZxeWVpZVZ2ako3RHNCME1zcjVlcGNzWGZ3U1ZGL0JQSGpGVG9ZbmgzVW1Z?=
 =?utf-8?B?SkJBTFZ2cjNpeUNBT3JYOFN0QVlvMVhRRkhTZHVMZjcwcDhoQVdjWEZEMCtt?=
 =?utf-8?B?VEdVazY4QUN0VVArdVdOSjRDWTVObkl0eWRDdHJsd0RMZldwMEFOb3R1Z0Zj?=
 =?utf-8?B?WGsxT3o3eDZJZW55UGlSVktRSXBtM2oyZ2VBRm9ndVJrdUdWUXQ2bytjUXJt?=
 =?utf-8?B?ZEFCSzkwNnhMMmJlZ3dFT1BBOTJYcXdJVzRPdHpqcjBYWk5uVlcxbFltajNR?=
 =?utf-8?B?VDRUcHduc2gxR01ySHdGQ2Mvc3l5dHVqSmgzeXRUWlllY29aYmxvZWFwNG1n?=
 =?utf-8?B?SUs4eTNWajZnaE5nNlNvUVd0Q2VPTExVUHRPMkZrRG10bmYrS1ptRkFQRGxi?=
 =?utf-8?B?cUh4SzE1Ujdrc2Z3UXVqN2hCVVcvY2hJb2tuTlM3U0pGZWhFRGUxczViS3ov?=
 =?utf-8?B?T1NnOUtkVjZWRGcycE9JSW41YloybXBpZFlyT1luQno0UGd2L2w1MmNBTDFn?=
 =?utf-8?B?TjhIcGdYVkY2ZGRrTXI4MTdmSWRVSmtTZ3U2dHN3YWxBS3dBTFJWL2FuVUJY?=
 =?utf-8?B?ampOZ3ZVN3BZcW4za0tnVkFiWE5uMzJFdDBmeWN4M1l3K283bnR0Vmc2b1Y2?=
 =?utf-8?B?L0NQdG8zVUhSRVpXYXNrSkhVMFVpQzBhaXlkKzNXR0k5SXROb2l2ZTcraEVG?=
 =?utf-8?B?cU13S0xQek8ybmtEYWYvNnlWanFCOFowcDVIdU5qRGxrbDNFWDQxdnFsR1hM?=
 =?utf-8?B?Y05VNHhwTlN6QS9VRlZORnpNNGEra25tMFV2WjdsZ1p5MUR6U1gzREJsdG9p?=
 =?utf-8?B?OExOeSsxZUpFVzkvMmFFU00xWldLaUxja2M1S2R0NldoUzR0ZmFwOEh4bkdl?=
 =?utf-8?B?cEU2WnN4Wm9yRFRnbTJ3QTk3NzlJSk40OHBMazVFVU9jTXB0bzB4UGcxUlNj?=
 =?utf-8?B?U2R1dXZZbE9JUzVZd3V3emtlQVg3TFZPbDNQbkV2SjFmdHNEL2ZXNm1WWFBS?=
 =?utf-8?B?RDdycmF6d1BuNysyM3R6TERZSjhTZGFpcnlOWkxvOUI5cUJnRHNlTzAyRXor?=
 =?utf-8?B?YU00S2NZZ0pQYi95L2hEY1pINm5XRVdxcEl1c2lqWnpNWEU0YUJMK2Y0L2I4?=
 =?utf-8?B?Mms4emgrNGk3WVdQWlplUDMwbFZ1YlJjZHBsQnFIUWJqanp3bFNEQjJ3SmNR?=
 =?utf-8?B?UHlMeTNGRGI3YVkwcWpuSnhXdE5JSVgwTUVtZ09XeDNXWmp3NEJlM0U2VFFm?=
 =?utf-8?B?enhtM3p4enN1RWJtR0VhcmN6NzQ0dXJBSjZrejdDOThlRGFwdEltUVBLTkFj?=
 =?utf-8?B?ZTlPWVNEYVNhSlhZY1JCcjRwYmFLWm5rUEtsaHU5U09rU2cyemQ5VXIzUEZp?=
 =?utf-8?B?ZGxCditPVElDcVYvY0xGd2tYQms4eHBpSGppMnNXMUxYWmk5cng0MUJyRXRU?=
 =?utf-8?B?RWZzZ3NhWGd4OURxTXM0MjB5eXZmSUNWUzlxUHA3WEpNejF4bVpyOVVZVGxX?=
 =?utf-8?B?bjRpdEE5Ym9KR3ZCYVgvRk1xZkY3bWJrY1BXcFBzUmJ6K2xSZ0VYVWJPazE1?=
 =?utf-8?B?V3RhS1ZiY0t2M2VNdWc1a2Y0ZzdYTGNmWGloV0RuWDF2TjFMU2M0UW1QTXFS?=
 =?utf-8?B?VnNva0w1ZzR1bHhBSUVqbmd1T2NCME9jZUFGNDcveThRVmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5945.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzJsM2pXVDZQSk5XeVRuN3NKbGZKNy94SFArcmhRMDk2bEZpbE9qRTN3dFJj?=
 =?utf-8?B?L3U5aGNoZ1lpK2tJcTdrRkFseG1weXY3bzNicitwbDc3MHhwTG1GOXdKUGNB?=
 =?utf-8?B?cFBOaS90a0E5KzBJQXdMbDJwdUtmY0ZFU2JXRlIxRXM2amdTNXMyME8vY0lF?=
 =?utf-8?B?Y0J4dkJnQW53enV3MEF4c1ZxZDk0dUxGelNYZkVEbndwQVNEMDFaYnZmMk92?=
 =?utf-8?B?RVdrOUdHV2loTzJIY2Z0ZU53b2xYRTEyNlNhamJ1dVQ0YnE2aHJVTW9KdXFE?=
 =?utf-8?B?SGE0RFZhU2RmVnIyd2xaZzI1c25xK3plWEZ5REV5UWxjMld6Z1ZvWlVRd1Z2?=
 =?utf-8?B?TCtwaWllenJIcCtPVXdtdkFkK2hLdUpPTGJGNjY5Vk5xNWhOek1Sd2tJd1JD?=
 =?utf-8?B?bFhySUdtalVra3J2L2RLY0UyMjkweWlVOUJ6VmVrREpQK2F6bEs5aVF0dk5S?=
 =?utf-8?B?NDcvcW15amJIbHhXTVoxaDFlRmd3QURVNGowd0dKRTJRUkNkVmoxY1VFZ1VE?=
 =?utf-8?B?dndRR0ROUXg4WW5YZDkwWEF5QjBRNG4vTlJTeTEvc09KbVc3TEpvdEw3YWZs?=
 =?utf-8?B?cldsQ1lvYlhDSHhOTU1pYUFXYSt3Y016UG54RlFpUXBCZ0F0UGFWK0lEcXVy?=
 =?utf-8?B?L1JrQVluMDhSdlByUGF1dlVhc2Eyd2x6VUhVR05acG55NVRXWXBuMWxad3J0?=
 =?utf-8?B?ZThZMTZzRGJDbUJZcDY0VDBYbm5Ba3QycDNQQWp6a0JpbzEzcmNSZ2ptRnZx?=
 =?utf-8?B?Yk5saGRrV3N6ZDVmY3ZvV3JEZC9LQ1o4VWR5R2JsMXdGeG9nejNEQ0lqM0tJ?=
 =?utf-8?B?MXlNUlVJdWRRd1MvcXpoUDQzWEdjbnhVNG4yam1nSnpyM0pnTmFNZTUyajVP?=
 =?utf-8?B?MEd0a3BGQ28yNTRJc0oyS2FXM0EyQTU5UnRJWDZkZkJGV0NmL3VzWTZrSG0z?=
 =?utf-8?B?aWZjTVp2S1V2K29UeTZSMGphQktFcy9uQmVBc1hVb1F6TGdPRHlIQStjQ1NG?=
 =?utf-8?B?TU5pSUUzQWRBakwwWC9CYkxkSXpnK2hGQUxmNXkxOFphT2c5SFdvQWI5VXBj?=
 =?utf-8?B?NGVrUVE2M0hBZEMzbW9wbDFjWjZaUGNuYXg5TDU2bGw5OTMySkdmK09hTlBY?=
 =?utf-8?B?MFBieDJUNTQ3U3QvZEFESWd1QWErdDNaK3ZQTzI3bDJ2QmlraWpjNUw3b1E5?=
 =?utf-8?B?Y1pvdng5QjFDcko2YU91WmxZalJwc2VNL09zY2FMY1VUdjdZWSt6dlhNUkd3?=
 =?utf-8?B?a3VMVkJwaUorbEF6RzB1YWhsNEhEajE3NUw4Q29vb2twOVlKNHovM041Si8x?=
 =?utf-8?B?ZG1PVTRpY1RWVGRXeE4vOFEwNGZVWlJMV3lNM1lycjZpRm5ySkN2ZmJESUJo?=
 =?utf-8?B?ZTBaY0ExamVpTzE2YUxyR2RDR2NmdkoxalJrNXJ2alJvaXVXckpveFBnbVli?=
 =?utf-8?B?QjZiL3ZFd3J3NlRzRFg4U1oyczRSNjNra3NvSmRVRXdSM0FOWXQ5MnJ0c1RT?=
 =?utf-8?B?S3IyWUxNam4vNGdGckJpVGtFZ1hmRWtDbXk2a3A3SjdKMk9zdHNoaVgyMHhY?=
 =?utf-8?B?dVBJV2lvc0ZkVk5UdDBKK2JxTVJtdDUyQ3g4amNvMHhoMFZ3b2ZmckJvMDkv?=
 =?utf-8?B?SWZKZTB4Zmc4UFhPaWlSMFNkd0k3TWU1ZlB4RmxWUUNxUkNBdjJlNUMxejNO?=
 =?utf-8?B?MDdxaVhBbmRCdTdtUUFWY3NrSUJYU21kTC9IWVBLaW5rNzVYTFVqMU1KVkZM?=
 =?utf-8?B?Q3RRWVIzVjhRekVVRGhsNXFYWmlXUkh1cXRJOG9iSTdWODFySUFveXdHM3FH?=
 =?utf-8?B?Q0JEZ0ZOSmx6T1ZRSVJ3dlZFN0hrdjNEeXJXWExrYTQwVjdvdWhidU9CYVNQ?=
 =?utf-8?B?RGJaN01uYWYrcHdtRjVHVldVeUZHaEFwV2xxM2psMWcvYllwMTdDL2pnQ2Vw?=
 =?utf-8?B?T1dQYUxIenhGRmtvcWdYTmdXbzJ6MCsyblJSL2U1TytZMnFCT3FObzJSa0ky?=
 =?utf-8?B?L2RodTkxVWFTY1VxOVZtWGRmcjhDYncwMHQwcDV5M1pYRDNTQWtkRGtWRjA5?=
 =?utf-8?B?QmdSK3cvUnhSMGFnWDJQOXEvcGt1eWZEWjVUVHpTRFEwUUlBSDNYdEl5WGM0?=
 =?utf-8?Q?fWyu2AisUSJgPNkwaWpnI7a12?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fccd6e9-23d2-4af0-d1ad-08dd868e785b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5945.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 19:54:22.3611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoZEUWhrQcfEkyTGifM9uBz1S4svv8CwAY78QR08g7HRjLKyWlIPotYF7e4428cFfz0wc2bduf8bIErZC9Sp5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8698

On 4/28/25 2:40 AM, Alice Ryhl wrote:
> On Sun, Apr 27, 2025 at 03:59:48PM -0700, John Hubbard wrote:
>> On 4/23/25 10:40 AM, Tamir Duberstein wrote:
>> ...
>>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>>> index 1df11156302a..d14ed86efb68 100644
>>> --- a/rust/kernel/lib.rs
>>> +++ b/rust/kernel/lib.rs
>>> @@ -198,9 +198,15 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
>>>   /// ```
>>>   #[macro_export]
>>>   macro_rules! container_of {
>>> -    ($ptr:expr, $type:ty, $($f:tt)*) => {{
>>> -        let offset: usize = ::core::mem::offset_of!($type, $($f)*);
>>> -        $ptr.byte_sub(offset).cast::<$type>()
>>> +    ($field_ptr:expr, $Container:ty, $($fields:tt)*) => {{
>>> +        let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
>>> +        let field_ptr = $field_ptr;
>>> +        let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
>>> +        if false {
>>
>> This jumped out at me. It's something that I'd like to recommend NOT
>> doing, here or anywhere else, because:
>>
>>     a) Anything of the form "if false" will get removed by any compiler
>>        worthy of the name, especially in kernel builds.
> 
> The `if false` branch is used to trigger a compilation failure when the
> macro is used incorrectly. The intent is that the compiler should
> optimize it out. I don't think there's anything wrong with that pattern.

OK...probably best to either encapsulate that, or at least comment
it. I'm accustomed to seeing that pattern in cases where people
expected the code to *not* get optimized out, so it triggers me. :)

thanks,
-- 
John Hubbard


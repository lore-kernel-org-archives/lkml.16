Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2075.outbound.protection.outlook.com [40.107.212.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EFB1A29A;
	Wed,  7 May 2025 18:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746643579; cv=fail; b=NtNSbH8dEzg2kkEx5DUdOEQYjB/5ZOuWBCWOFe4ZirggWXaoaaFuN0hhF0fyCudNGlhEVvo/DuEfasTjdG9JkdKau4lQCH+UrwYilRH+9r2Q2N80MDFnx1eH1gvDVDNspQ/DkdmYdGOZrvqOmzIktE2+8QEjO0PY2HxauXLANi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746643579; c=relaxed/simple;
	bh=e+v1zToUwGMLmBfL86ND6oIE532ly2OUUM6VeqeCagI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kJic7BO+m3HlKzH4Pf6tlqQVJA8LfYyyxSkdm7qumr1OnoUimYNLnDecr3yxIJ1F7IQnc3mFtfUwQNQj7szydd5GE/pN9XVWRkC7o/4ZYTpDAC9tSDuTl+PMcFRIx9wVgQUu28I41Nm1NXB2J5quAtqYq4pJAo+mEGvw3YcnQIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kHiImHAV; arc=fail smtp.client-ip=40.107.212.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kHiImHAV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yd4YsbGzNgIK83v8khBn0Br8DMuhhzI6pUdaAsUZfIyclJSJy4pZKnUlEf3QIQ0MGbGE78WPPf6yc37hxU7kz6FEyUISkqKRTDe5KSIkdNNyMQaz6xHLAb5KravTDzbl/h2KZYOI4boFYln/00uRLrBedfwzNcYUIy7bLG80QLdZOkPP22RB27MEBZM9NqnVNCDVDr3NKEIYj5cmdgWbYF03d1w0gHWYFJ871JpnI2iqrg++VcqBajN15q1elLr5UCZBWOpf6w46qpuACf8SI4fwoL3XhK4OAk4D2FmrpvnkWLC6RgD6DUmTxDhPNQ87ALs/Ja/Lteh2aMUXtkJwLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+v1zToUwGMLmBfL86ND6oIE532ly2OUUM6VeqeCagI=;
 b=JQWLOPRXNLZaw3VqqYQD3W0V6nUQ8tQJqFj7xvbYX2Bm8H9ZJGEoP+4IEcbpuUrWJ6Ures1vqwFCDxRMybkI4/AnPsUFtLZ8yOqFtvUPmEGdG1uGWeW1t6FtmR+aE109FV9IZZezH2WVSnc04eL/S/1cUIS9MF3unSUCnPWUnMV+KVDkukpOBgvbWgZJNqLEX+avR6ISJDjbEzDp0gv5XK6CvfkSWi6Sg6yb7wvzTGquehE59jYT1uI4ynnF8/MAu2fh48RfnaaTDaBg4HuIT1DcGcwCmZcXq1byJjbh1C96hf32bp0tduoq05YXZqf5OHbVJ5Ug38XYy/8wWjG8zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+v1zToUwGMLmBfL86ND6oIE532ly2OUUM6VeqeCagI=;
 b=kHiImHAVgJVuhm2S3rouIn8Y/kKVMLyQ8rCCjMa6R1SKGMdzV62svTnRH2oPgQRwcbYRuAVjIQYV0l8y/RTUJDktKDBlPwGpwLQNtE9Z5SpL/ycrjDG69nzPRhanB3tjFsfn5MwuI/vxa4ihRbn5oiw3SDoIY+1gdX4FbCD7MmZRCeph/9+G9z74+q+XHSw0qqoRsh2nb3JnE2g+GZfBvrpmlVGY8eBruM49QfVNDDA36G2KcSnOmsqUOm+PxHsWZltoamNgN63yfmG6Rg0yUsscqgp+D3zv2TkiFKDnaO0t+5N3nqDs11VlHF4uTCSRoojMiDsDN5syqPHYLde9+g==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DS0PR12MB7630.namprd12.prod.outlook.com (2603:10b6:8:11d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 18:46:03 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8678.028; Wed, 7 May 2025
 18:46:03 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "tmgross@umich.edu" <tmgross@umich.edu>, "benno.lossin@proton.me"
	<benno.lossin@proton.me>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "gary@garyguo.net" <gary@garyguo.net>,
	"mmaurer@google.com" <mmaurer@google.com>, "a.hindborg@kernel.org"
	<a.hindborg@kernel.org>, "bjorn3_gh@protonmail.com"
	<bjorn3_gh@protonmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"dakr@kernel.org" <dakr@kernel.org>, "alex.gaynor@gmail.com"
	<alex.gaynor@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
	"ojeda@kernel.org" <ojeda@kernel.org>, "rafael@kernel.org"
	<rafael@kernel.org>, "samitolvanen@google.com" <samitolvanen@google.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 1/4] rust: debugfs: Bind DebugFS directory creation
Thread-Topic: [PATCH v5 1/4] rust: debugfs: Bind DebugFS directory creation
Thread-Index: AQHbvhim3AWmxN1/IESr7tamgqmE7LPHhF+A
Date: Wed, 7 May 2025 18:46:03 +0000
Message-ID: <57ddf59f8f2ca740b11650360ea7d5356dad7112.camel@nvidia.com>
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
	 <20250505-debugfs-rust-v5-1-3e93ce7bb76e@google.com>
In-Reply-To: <20250505-debugfs-rust-v5-1-3e93ce7bb76e@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DS0PR12MB7630:EE_
x-ms-office365-filtering-correlation-id: 894d9764-3721-4671-e1db-08dd8d976b63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eW9sMmJmUG1oOEpvd0J6RWR1WlZrSGZPSTRhaWxNYVFSdUdrbnc0K011dStQ?=
 =?utf-8?B?NWYxSzR0OFM1NjVKMlNZQUk4QVpnY1o3LzFFeGFodURxdThyK2lNdUI3dndm?=
 =?utf-8?B?RDd2a2VyWG1aalBvam9tUWtjcWwrUkxTL0Vaa1lIRjFYV081SUlXN1k3RmU0?=
 =?utf-8?B?UDdLOEZUN2REblVJWkFqR0hUc1VuMERmNkEydHJhN2NpQlVIbXVQZlhsSUw2?=
 =?utf-8?B?b0xqaVJaeFQvdkRDUnNHQU5vSS8xOEJ2ZXhOY3R1T0MzMFo2YVhXSkd0QUtH?=
 =?utf-8?B?VlVpNHEvdlJYOHd2RVQzRVk2K2VTcUZrc2h0VzloYU43MStEeWpiNGZhclFu?=
 =?utf-8?B?OWlrN3FWQk1mQU0vc0t1WFN1NjNsN3dFT2hQaTVqbW9OTE95M09saXRjR3Nr?=
 =?utf-8?B?TS9IY1ZKWFMrMnpJb3RqUHVuMWFsTGFwL0NMUTVCRVhBdEtmOU80Zi92YzZO?=
 =?utf-8?B?Z0hGSFpsRDV2dEZaVTUwT0xYZjcrRElpRERDRTAwVkVSVlk2cDdBZzl2dlhE?=
 =?utf-8?B?eTA1QnRWMzVlaGZHM1FCZFBkR3VLbTQ4TVN3UlM4TmlwOUNpRiswUFBTSk5m?=
 =?utf-8?B?Zjg4Q0FvUFdIQ1F2M3duV1BHa1ZQUW93bmpNZXFhaVNKQll0SENjZjQ3aWhU?=
 =?utf-8?B?TWNLQUd3d2hlamd3M2JML3ZHWWszSlNrWHBEZXQ3bnRHRmNNTHNhQXZEOHVx?=
 =?utf-8?B?U0E0ZlB3RnBkRVhhY082MXFoTktEeFNYTEFxNkJsbzR6OFlUNFBDSCttWWZS?=
 =?utf-8?B?ZnFNUUl6Tm00Zk9UTkNML2dMUFJjOHpROUltTUtHK3NKNUJtYWdYSXh1YjE0?=
 =?utf-8?B?VTBSeWU5NXMxcTRnOTF0dnRWYitiV3JwQU92UkN5WE1uOWFDM3JIVlZUaFdJ?=
 =?utf-8?B?R2JyZkJsejdSZm84ZWpmalNXMmo3WE8ySm82TUk5dUhIck40YW9KQWxGNGxF?=
 =?utf-8?B?UzFqczFXRHBCWHNkblF3VXY0MjM5MkloMlZIV3Y2Tjc3NGFmMjdJOXNWUncz?=
 =?utf-8?B?TDBaZUVNOEN5NzVnSDJVc2J0M0oxV3BjN01SQWNnZFdMT0hIYVdHMHZDZjNB?=
 =?utf-8?B?M1ZpZFlnTkVDdGt6emlpVkJkU0dnV0QyODNPdkxFUE9uQlIwWWRVeUs2b0FD?=
 =?utf-8?B?TnAyS29pYW9Ed0dLNW9LcEF2TkR5YkcvSHlsSEtxd3RTS3QwK2I2Z3FsOVlS?=
 =?utf-8?B?TTA3UHZWVHZpZFNkdi9ab2ZVYmF1UTB1bFJuUVFvNnhIMWtHc3U3bmdSNy9X?=
 =?utf-8?B?WXBOY1QxMkRrYnprUS9TZVR6bWdYM2E1RHNLRjVNb2ZEbTQxS3NzV2swOUJh?=
 =?utf-8?B?Zm5JNzJsaDVuNTN1MGdoN2ZSdmttNkFxcFEyNEhiTDZwbnYrT2hQTGtCMzVW?=
 =?utf-8?B?TjhFa2hqeHo5WEVhY254N053R3JFZlhPQis3VlpQSTRHdzhvcXFIZGtZeDha?=
 =?utf-8?B?MlZQTXU2dUlWZDUxcWR6WnFNUjZBeTdUOG9obVFUQ2hhRHlPN2YzK25QbzVt?=
 =?utf-8?B?b2drdWR5YVhZU0ZEeTU3UEs1OXo4TE0rbURHVGR1V3hBZmRlQXVnTndSRklH?=
 =?utf-8?B?cVNuUjdGQXF4WlBaakVoeDA3SHNoLzg1SkhUelZmNks5RXlkRGdFVS9kYytY?=
 =?utf-8?B?OVp5MGFSSWJRa3ZQazkwMVVwSnA3N2t0N3UzUnhRNmZKbENPYnBUWVNFdlpP?=
 =?utf-8?B?NG5qb2szVC9wRVg2R2FrVzNCZHB2NWNBZHFlcVdUaW5HZUxsMWg2Rm5rSEl6?=
 =?utf-8?B?dVM0WDg2ZTFNeWw1cVU5WWFZbWZOU0k5cTJQUVd6ZTNJSUJuUXdrRDJIY0h2?=
 =?utf-8?B?U3BDSElGLzZFcGdFemcxbm93WTd1aTMwQmkxV213ekJpcnRPQ01JUFk5Z01U?=
 =?utf-8?B?S0RUZUJMUHBtRzE5RUNnTTkrQUV3ampJa0pUV1dFYTlhT21iRERKNlVPWUMv?=
 =?utf-8?B?dWNrYTFZSFBiSEpGeFRzRG9rNHdzVWJmQVd5bmNFZ0lEQ0kyclREdHk3ejQx?=
 =?utf-8?Q?28XTpvZITROZw6q8x7hVajMBsLCvhA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RDU1d0hiYUkrdjI5YWJnT2V6YXFhNXpZemZCVkZQTktob01zdHEvdElncnA0?=
 =?utf-8?B?aEZTS0xjc3lOc3d3QVlVekJ6SnVCL3FSV3p0aHZnNTI4ck1LUm53clltWUx1?=
 =?utf-8?B?RWtTTE1jWnRzdHhXRURDMVBCcG1DQUtWRjNhS0RxN3l0d2t1OW5IWGpGSHFh?=
 =?utf-8?B?Zm5MZFpXdkRDRFRGRURXdHVITjA0UDExamRZdzRIL3dmTUxaMkQ4M2xLb3FX?=
 =?utf-8?B?bDdqaVN4aGdzZnQyZGFPUG5vVlZaV3pOSUZUcEMxYW1rTjg2QlduazJTZWcy?=
 =?utf-8?B?M0lSbUVLVkRoRVRzSWFCbzd6ZkEySHZtOXdxZnB3RzN3Qm9qMDN6NS9ucDQ1?=
 =?utf-8?B?VVAwK0oyR3Y2U25lazg2L3doaUhQUnU2TzFCTTh5aDFsZ0ZVVys0cXF4YldD?=
 =?utf-8?B?SzFxKzRvRkVMaUNWU2s4OWtIZkpuSzY4MUduNTN4bUhPc2VRYUNaOEh3anNk?=
 =?utf-8?B?MEFuWXk1VnBZdXphdHdiRjg1aGRHdm9UaUY3emdMOVJReXlwUWQ3dmZPVVo1?=
 =?utf-8?B?dkZheDdFLy9Ra0RQdXhxK2RmbFhsS0dqWHc2T3hwc1Z6R3JuQUZ0OXBLZVk3?=
 =?utf-8?B?V0ltM2l5SHNyM003MVVmZGt1MGNUZzhXa1FiQ0ZEMUJzWnlBWElabEZ1Nzdn?=
 =?utf-8?B?YmdEMjlIaHYvQStZZ0xJNnFUc2tzNkFwL2VVTXptRDdiaU13MFhFS0JabTBN?=
 =?utf-8?B?d3RhYVFDdllDaDZVVXoxMEVzWWhwKzRYbWUxaXlTWnJ3bFFxalFtbUh4WjRs?=
 =?utf-8?B?L2kvTnZ0MDgzV0ZmTkV2S281dnkvZkZCejh5S24yZlFNZ0VPNTZPd241YnNR?=
 =?utf-8?B?b1QxbTdjLzVhbGNLYVpaUFVyNHJTMTZxbklNNklXVG40Tm1iOEN5UEJidVY4?=
 =?utf-8?B?NUFFcTNGeHR0a1lEUGtTYlhLZ1l4TmMxRzNvZUdSMUcvcGc2RTlGRUdCSjh2?=
 =?utf-8?B?UEg5djBSdjRhZjl2cmYwYXJlb1B3N0JxeVNSK0IzMi9NTmlXaEF3VDFabHR4?=
 =?utf-8?B?MGxuaklLOUJLOEQ0ZGROVFRuZjU0OWRXZG96OWFta0hBazllQzNheHdlZEZz?=
 =?utf-8?B?eDdESWcvdXlDNnE2UVczTEMwNzk2SHcvRVJXd0JNcDN2MHQ0RlpDUVpCZXVT?=
 =?utf-8?B?NVFXTXdXWWhwdXUwMkE2bldFSTNBRHNFZ1ZLU2lCNGdrQzdqdkZleDRWVjF6?=
 =?utf-8?B?QldVVHVuQXJuTVA0dDVxTDNmc3VTWFhXL2JiSVprVFZLbU1UVmpPUmZUUlFY?=
 =?utf-8?B?bXB1VTRmSUtpY0diTjdYTW5LUldaVVYzWnlxWGZ1WWJvY25uQUNFVHZ3SXVn?=
 =?utf-8?B?OVh4cmd3em5yRUZZOFNuVE05RXFXZFNzanpkcWQvVmh6dzVQc1B2T3IrZlgr?=
 =?utf-8?B?SUhLUVc3bXJPM09McjJKaGlHc05HcHpuZmZyR21DL253dkRQT00ycnJDNkkz?=
 =?utf-8?B?L0FxUzBSaWIrQ3ZpaUtZRlZBTTRJZVlqMktGWDZub0hRc2pKQ2h3ekd0OHpQ?=
 =?utf-8?B?dlp6OU9aL2NaQ3JwUVlCanZiQVg0cEhCa2pKSU1PRGd2R0FwTnRjaWZwWHFq?=
 =?utf-8?B?WHd6Mk1pRGhKSnhGL3lHT3V6SHdSU0I3R3RTK0F0TkdiNXNTL2NUZGVNTCt6?=
 =?utf-8?B?NWpMNkNpa0djRmlOSTdVR0JvaVZreEphWnkvT2ZDYy9vdjNaRk1QeVRJRk5M?=
 =?utf-8?B?U05mMkt1UWdPLzFteVh4R2paQVlTVWgrMkNsTUF2VFJ1dzNQREVMQ3cxMkMx?=
 =?utf-8?B?VUtXc256eFJMY0xINGo5TExxZzBWNUpaUmRGQjZqTU1BUVVVTVdDd1lKWTdX?=
 =?utf-8?B?blhSOFFLczZINHdVbXJ3aE1OTlJQSHNsYWNGbzFpeDQyWEhhVkJRcTVybGZW?=
 =?utf-8?B?MUpKRXdkMTFUdG43a3QxM290d0NjUnNQdVIzSnlBZlo2Ui96dzYyaFk4Wnpn?=
 =?utf-8?B?eWU3dG5kQkVPZERTOEFjZ2JKai93OG9LUG9qTFBSU3gxU00xK1BNS2g2aVAy?=
 =?utf-8?B?RTdPWHF4Z00wVm5pRk1Ca1cwMEZhM3g4TXBWN1ZiNUJtUW5jZ2ZiUVZYNW40?=
 =?utf-8?B?TnN6eTVUaFJjTlRDWTYyNStJWmRUYzFYVjRoV0hEdDlvSkJDTml1b2tvaUNI?=
 =?utf-8?Q?LeYV3Ilj+wiYaVlTk1BV/vx5h?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <597906B0DB7BED46B4F4DAA17FB2FD00@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 894d9764-3721-4671-e1db-08dd8d976b63
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 18:46:03.7328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LhToUPKVXsaJT/qY43IjKQCIKZFhjvU6EnmPxDtGyYQf1xPmvOgo+0RuBkpS9gTK75kjO0g7sQlNAdkujHCVbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7630

T24gTW9uLCAyMDI1LTA1LTA1IGF0IDIzOjUxICswMDAwLCBNYXR0aGV3IE1hdXJlciB3cm90ZToN
Cj4gDQo+ICtpbXBsPCdhPiBFbnRyeTwnYT4gew0KPiArwqDCoMKgIC8vLyBDb25zdHJ1Y3RzIGEg
bmV3IERlYnVnRlMgW2BFbnRyeWBdIGZyb20gdGhlIHVuZGVybHlpbmcgcG9pbnRlci4NCj4gK8Kg
wqDCoCAvLy8NCj4gK8KgwqDCoCAvLy8gIyBTYWZldHkNCj4gK8KgwqDCoCAvLy8NCj4gK8KgwqDC
oCAvLy8gVGhlIHBvaW50ZXIgbXVzdCBlaXRoZXIgYmUgYW4gZXJyb3IgY29kZSwgYE5VTExgLCBv
ciByZXByZXNlbnQgYSB0cmFuc2ZlciBvZiBvd25lcnNoaXAgb2YNCj4gYQ0KPiArwqDCoMKgIC8v
LyBsaXZlIERlYnVnRlMgZGlyZWN0b3J5LiBJZiB0aGlzIGlzIGEgY2hpbGQgZGlyZWN0b3J5IG9y
IGZpbGUsIGAnYWAgbXVzdCBiZSBsZXNzIHRoYW4gdGhlDQo+ICvCoMKgwqAgLy8vIGxpZmV0aW1l
IG9mIHRoZSBwYXJlbnQgZGlyZWN0b3J5Lg0KPiArwqDCoMKgICNbY2ZnKENPTkZJR19ERUJVR19G
UyldDQo+ICvCoMKgwqAgdW5zYWZlIGZuIGZyb21fcHRyKGVudHJ5OiAqbXV0IGJpbmRpbmdzOjpk
ZW50cnkpIC0+IFNlbGYgew0KPiArwqDCoMKgwqDCoMKgwqAgU2VsZiB7DQo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGVudHJ5LA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfcGhhbnRvbTog
UGhhbnRvbURhdGEsDQo+ICvCoMKgwqDCoMKgwqDCoCB9DQo+ICvCoMKgwqAgfQ0KPiArDQo+ICvC
oMKgwqAgI1tjZmcobm90KENPTkZJR19ERUJVR19GUykpXQ0KPiArwqDCoMKgIGZuIG5ldygpIC0+
IFNlbGYgew0KPiArwqDCoMKgwqDCoMKgwqAgU2VsZiB7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIF9waGFudG9tOiBQaGFudG9tRGF0YSwNCj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4gK8KgwqDC
oCB9DQoNCkkgYW0gbmV3IHRvIFJ1c3QsIHNvIGZvcmdpdmUgbWUgaWYgdGhpcyBpcyBhIGR1bWIg
cXVlc3Rpb24sIGJ1dCBpdCBsb29rcyB0byBtZSB0aGF0IGlmDQpDT05GSUdfREVCVUdfRlMgaXMg
ZGVmaW5lZCwgdGhlbiB5b3UgbmVlZCB0byBjYWxsIGZyb21fcHRyKCkgdG8gY3JlYXRlIGEgbmV3
IEVudHJ5LCBidXQgaWYNCkNPTkZJR19ERUJVR19GUyBpcyBub3QgZGVmaW5lZCwgdGhlbiB5b3Ug
bmVlZCB0byBjYWxsIG5ldygpIGluc3RlYWQuICBJcyB0aGF0IHJpZ2h0PyAgSWYgc28sIGlzIHRo
YXQNCnJlYWxseSBpZGlvbWF0aWM/DQoNCkluIHRoZSBEaXIgaW1wbGVtZW50YXRpb24gYmVsb3cs
IHlvdSBhcmUgY2FyZWZ1bCB0byBjYWxsIGZyb21fcHRyKCkgb25seSBmcm9tIHRoZSBDT05GSUdf
REVCVUdfRlMNCnZlcnNpb24gb2YgY3JlYXRlKCksIGFuZCB5b3UgY2FsbCBuZXcoKSBvbmx5IGZy
b20gdGhlICFDT05GSUdfREVCVUdfRlMgdmVyc2lvbiBvZiBjcmVhdGUoKS4gIFNvIHlvdXINCmJh
c2VzIGFyZSBjb3ZlcmVkIGFzIGxvbmcgYXMgbm8gZHJpdmVyIHRyaWVzIHRvIGNyZWF0ZSBhbiBF
bnRyeSBmcm9tIHNjcmF0Y2guIA0KDQpCdXQgSSBndWVzcyB0aGF0IGNhbid0IGhhcHBlbiBiZWNh
dXNlIEVudHJ5IGlzIG5vdCBwdWJsaWMsIHJpZ2h0Pw0KDQo+ICvCoMKgwqAgLy8vIENyZWF0ZSBh
IERlYnVnRlMgc3ViZGlyZWN0b3J5Lg0KPiArwqDCoMKgIC8vLw0KPiArwqDCoMKgIC8vLyBTdWJk
aXJlY3RvcnkgaGFuZGxlcyBjYW5ub3Qgb3V0bGl2ZSB0aGUgZGlyZWN0b3J5IGhhbmRsZSB0aGV5
IHdlcmUgY3JlYXRlZCBmcm9tLg0KPiArwqDCoMKgIC8vLw0KPiArwqDCoMKgIC8vLyAjIEV4YW1w
bGVzDQo+ICvCoMKgwqAgLy8vDQo+ICvCoMKgwqAgLy8vIGBgYA0KPiArwqDCoMKgIC8vLyAjIHVz
ZSBrZXJuZWw6OmNfc3RyOw0KPiArwqDCoMKgIC8vLyAjIHVzZSBrZXJuZWw6OmRlYnVnZnM6OkRp
cjsNCj4gK8KgwqDCoCAvLy8gbGV0IHBhcmVudCA9IERpcjo6bmV3KGNfc3RyISgicGFyZW50Iikp
Ow0KPiArwqDCoMKgIC8vLyBsZXQgY2hpbGQgPSBwYXJlbnQuc3ViZGlyKGNfc3RyISgiY2hpbGQi
KSk7DQo+ICvCoMKgwqAgLy8vIGBgYA0KPiArwqDCoMKgIHB1YiBmbiBzdWJkaXI8J2I+KCYnYiBz
ZWxmLCBuYW1lOiAmQ1N0cikgLT4gRGlyPCdiPiB7DQo+ICvCoMKgwqDCoMKgwqDCoCBEaXI6OmNy
ZWF0ZShuYW1lLCBTb21lKHNlbGYpKQ0KPiArwqDCoMKgIH0NCj4gKw0KPiArwqDCoMKgIC8vLyBD
cmVhdGUgYSBuZXcgZGlyZWN0b3J5IGluIERlYnVnRlMgYXQgdGhlIHJvb3QuDQo+ICvCoMKgwqAg
Ly8vDQo+ICvCoMKgwqAgLy8vICMgRXhhbXBsZXMNCj4gK8KgwqDCoCAvLy8NCj4gK8KgwqDCoCAv
Ly8gYGBgDQo+ICvCoMKgwqAgLy8vICMgdXNlIGtlcm5lbDo6Y19zdHI7DQo+ICvCoMKgwqAgLy8v
ICMgdXNlIGtlcm5lbDo6ZGVidWdmczo6RGlyOw0KPiArwqDCoMKgIC8vLyBsZXQgZGVidWdmcyA9
IERpcjo6bmV3KGNfc3RyISgicGFyZW50IikpOw0KPiArwqDCoMKgIC8vLyBgYGANCj4gK8KgwqDC
oCBwdWIgZm4gbmV3KG5hbWU6ICZDU3RyKSAtPiBTZWxmIHsNCj4gK8KgwqDCoMKgwqDCoMKgIERp
cjo6Y3JlYXRlKG5hbWUsIE5vbmUpDQo+ICvCoMKgwqAgfQ0KDQpJcyB0aGVyZSBhbnkgcmVhbCB2
YWx1ZSB0byBoYXZpbmcgdHdvIGNvbnN0cnVjdG9ycywganVzdCB0byBhdm9pZCBwYXNzaW5nIE5v
bmUgZm9yIHRoZSBvbmUgdGltZSB0aGF0DQphIHJvb3QgZGlyZWN0b3J5IHdpbGwgYmUgY3JlYXRl
ZD8gIFRoZSBDIGNvZGUgaGFzIG5vIHByb2JsZW0gcGFzc2luZyBOVUxMLg0KDQoNCg==

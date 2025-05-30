Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A456182BC;
	Fri, 30 May 2025 06:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748588206; cv=fail; b=dhji2MUdlKFpK6kfhzGVbL3fM9OxUwCZEywbSl8+neTFQPpZXcNvfP+WBB4ksBSEsxwpnXdH3qZhlttRSmQXJ3xN+TbXhFaJ/TnJpjy9VLenfWhKfaSno2ZnTXSu++s9XLm3ZWmc/X0Ry/zjmxTfFmlOOybBUw/fwEpIFqLL/7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748588206; c=relaxed/simple;
	bh=LlVNvbRnTd9GB+JMGgtpVcqe86guBV/nPMIZO4Eqt/Q=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=bsEHX7y30l6NcyGrmtpNuBg+59JAlqBu7VmjVigklWkuzt7QypDH+f+0NaCMqhrAVIaIW9YxuFZ5jDoY3pqG1dv14aHPnie7bdTd3kclqt85qeAS4laNthDYM66ppZK0WS5nIDR0jE92bZSzuFoMoW41Uq+wG0IqtMPFPVU0Msw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ni/0NZ4W; arc=fail smtp.client-ip=40.107.236.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ni/0NZ4W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVYXpK7qwrXRdVB6dI1ipqEdKZUbYkYQPfItFjtY4C3Nyunj6SmFeFm5wLICp2rYsxTNVIAUiLeaAl2bjgtd5oWvkCrfIGDwcFdpJSu3UKvUWI4zybAOcY/miMlfHR2wkPrLndW+Fg/BtGBmxWPrkNS0Y3BQcxt0wSJ0/ENZV7RbSpA4iadJFl3+VSOXocHdjE3LGJKBro0digi6ufGJAErmmrLZKwpPqUXc3GI+3PUQ8Zhg8nip2/yN7M2/56Xcj/kUvMN8mQ6B71e0p9lygB7dI/x4EPqmIyCofBSUnsGldV/VyOt5u4ZlmP2ojwWoAH1AUof7r0GyK950c7yYdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWky0K3GUSs3YgVvdlrE05ByqJCu+V7fpIgjvP94454=;
 b=BVhJ8TRIkiDkcOicSj1JThMMytJlaf0Tqn1IHQb90geGtSLBvemtFRsvEoRd3ngPPha3KQW80eJZ/TDpzisCcrmt4rY+8rQA+2bTwy4y8Ftr99cwwO6V4N6p9cYMcibsqtO/yRZ5Ls17IvSLF2FOZN974pBjXzyeb9TOV66zUmMIf2qXj40yjltfejjxzcU1h9fqCq3DETdDMZKNPfxiD880VcBqvvgVIq2QCGZLKUX6ja5GnM5qqrrnG31WlJQNun4DxmywZUEhjfKK4Atd7I4Cy+crfPt6OtXZKXJSxC7ECPJ1Y8F8ZkSjwudq170Nowuv8hpuFwMrGFWugLuWZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWky0K3GUSs3YgVvdlrE05ByqJCu+V7fpIgjvP94454=;
 b=ni/0NZ4WGKuDNhYELTJGF08I/06xRl3KqKF5kDKgbxUwKSOXjBrQyPS52CXPDRs5+nNM06sb+CtghX8u1dmpAgtUOxVwSnPXVCaxipH43UIn8h/2EtCI9Dt4Lse47jZnCbQRJoQKLxtQnfE3BGI0X1c2GjbUaUvQduqLY3CY0DCnSSAW08tFUFsTd3YWUDD11DEdLfLJqB0sHBt4z4m6zC1PbFg4rBn1Kgwg+XBW16Ci2H7HOBPEvlrxQdKiixw+/DCpwEFu74C+dGDhkQ/XlmyFviGS46yRHzPbD85mDeMeEdex4lWmOyhc4vJGAR2tbE+jcdUk+fZnxg98EWcO7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7933.namprd12.prod.outlook.com (2603:10b6:806:342::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 30 May
 2025 06:56:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 06:56:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 15:56:37 +0900
Message-Id: <DA9AS88BCFX2.FET64FP3J2WO@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <timur@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add basic ELF sections parser
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com>
 <2025051647-urology-think-b8e0@gregkh>
 <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com> <aCc_PSOPkLWTcTru@pollux>
 <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com>
 <CAOZdJXW+PoFgxH+wPEum-kYvRmSRd8c4kaxvbNAq5dfZJiXapA@mail.gmail.com>
 <D9Y0VJKOAQAY.2GJSAZ5II54VV@nvidia.com>
 <DA8G3G918FS4.X8D7PQMT4TGB@nvidia.com>
 <2025052932-pyramid-unvisited-68f7@gregkh>
 <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>
 <2025053058-siding-emperor-d8fd@gregkh>
In-Reply-To: <2025053058-siding-emperor-d8fd@gregkh>
X-ClientProxiedBy: TY4PR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: 47994e2d-3e18-4e28-5ab1-08dd9f472176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3VMcW10Y3RBZWM2YTdUL0hoU3I3ZkVSeDRWekdmc2IzYWF4cEVVNEVTaGMr?=
 =?utf-8?B?ckJ1MUVtNFZyRytLZGJzamxTVFZnVnU5aXZNMmgyS0RxTlF6bFEwUmdDdW1I?=
 =?utf-8?B?MjArbGxwaTJxVGFHTGdndlJRWlB6SzJ5RjNzSC8waFNUOXl4ak1LUmhsZGkv?=
 =?utf-8?B?R3hHekpLWUlycDlPd0pWWDRSWjduVlBKWEFFcXZlc2JONVQvNG1iSEhWeU5o?=
 =?utf-8?B?RHVDTzY5ckFRcWNxVy9VRzF1WjdjSDdkdmhTNk5RV01PalRUWWpxVCtHVERQ?=
 =?utf-8?B?TDNGem1wdDZlM1JQc2FCemhtekdmMXc2M1FmK3VMb0QyWmtVSXZGTEkxZG9C?=
 =?utf-8?B?MU9oVDQ0dTFHSG9yQXFGSE0xSlAvNk81ckdUei9SZWpSVktpYUFjb25vaHJV?=
 =?utf-8?B?STZRL1RXNFhqRmhYTEUyV1VBcXkxM0pobHEzQ3lNVlJ1NFpKaW1GdU1HTk85?=
 =?utf-8?B?dTZSd3E0MFZxMGJvdGpqK3ArMndSb3ZpQmlmbTBlRFIyaENjL1ZHdVNiaDR1?=
 =?utf-8?B?UVhlVjZESDZhUkhPQzRCd1JYMEF1Z2plMGtXNm5MWWVXYnhQbm5VaVRXU2w5?=
 =?utf-8?B?NUZjS1NxNXg1ZElPNm9sZ1NEWm81S3RocUNLU1BxdDJmRFp4YkhEY0lRazlT?=
 =?utf-8?B?SVN2WHBnYXUyYVlmYmVJTk1YZkxnNFRKYUpGV3FRWlJKVU15YnhWTmk4YVBN?=
 =?utf-8?B?MHJ5Uk0rQWhBYjhPU3BQc0prWXNRQ1E1dTZWR0FpQkZQTnZVWTIrZTZmSVR3?=
 =?utf-8?B?a1BEYXErK2NVc1NYN0R3ZmVobVhsVk10cmFocGJRcW9TblczRkI0TjZMKzhM?=
 =?utf-8?B?SHR0SktJSUhMOXB3YWR6UlhqZlNLaFpOR3hDTXR5b3h4SlZuelFaWHRmWC9u?=
 =?utf-8?B?MVd0Q0FEOVUvQTUvRFpNZEZlbmpQQ0dhbFpiNHBsbnh3c0F4YXQ2RmdKa1BD?=
 =?utf-8?B?emFOQWo4RTJrV3ZJVnVnNnFWdk1Ga2lKZnZVMWJqekQvUjhXeUlGQXJNL2Vt?=
 =?utf-8?B?enUrbitWZjgzOHNVSjM5OVA1MFlJV0JJMVFmck0xMVVFaEZ2MXhyVHJGUUhi?=
 =?utf-8?B?UW5sd3ZYb3Q2eFZYczVqZTlkbkNLblV4ZVZYdngwbi9ETUVaQnFGUnpVaTJw?=
 =?utf-8?B?MXpZOFErUWdBQWh0dTEyQmlwYzkwRWFqa2dWUjlSeUdqMGxGc2VrOWUvTXpt?=
 =?utf-8?B?OW5uVmZIbDZpdEZhdzFLemMzQ3lCSy9xWHZDVjlaS3Q4cWFQYko5TW1HRkNa?=
 =?utf-8?B?Sk9iTXltSDZDV3MzSXZzQ28xMjg2L0ZXTkFnT1VNOXM2THRrQXE5VHpKazN1?=
 =?utf-8?B?K2NISituRVlhZHJyWW1ERldaKzFYNXJBWDlJSDZFU1BkdVF6bGFuNmRuVmNa?=
 =?utf-8?B?eEZDZ0ZaSGJQZHFETzVhVUl4dlhhMStWNFpxZE1mN1dQcmo5a1dJMURWaXFG?=
 =?utf-8?B?TlpEV3pMNWVKMWFmRFVDNEp0ZVFDalNQUmh3d0R3RW5MMzE0bjFjeFp1ZGRR?=
 =?utf-8?B?RzBjZm5YNFRoT0NSUy9jaWlJZGtHYi9JYnNHOUg2NU01QWk0aE9RUTQxODBK?=
 =?utf-8?B?QlBkVUxjWWVnQ3ZjNERRUlMzYnpoNU9zeTl0ciswV0IxdnRmUU90SzIzNVY5?=
 =?utf-8?B?bDdSODlQdnR3TjM1cElpSk9MTUVrbCtWb20zYm53RUFmMzVZbU9udTdSQVhv?=
 =?utf-8?B?bmlPU2xHRjVYUkUwZHdhNktpd2pRUVhOSXE1c0dFejh5RTI5TExLZEpXWHdD?=
 =?utf-8?B?QUQrNkZGTmxBYi9PeGJUOERueU1qR01HcWVIR053RGsxUi80YndHOWE1SDNZ?=
 =?utf-8?B?U0IrcjJaVmIzRFR1Tmg5aVVQM0V5RytiQzhWdUJRYnowWXNYK2dENm1aRzlz?=
 =?utf-8?B?N0J1b0Y4OUxER1RrUkN1amtRUnFHWVhZc1pLRUFOYXRrZmRlR2hLS2hJQ05C?=
 =?utf-8?Q?3SPxUNQkdLo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHBNQWszckw0bm9INzBHellJdUVTcXFQN0dOQWw4MXdRaFJxemxwanBvYzBI?=
 =?utf-8?B?dHUvd0xyc1ltaG9iR29ZNnJUMUxDZWRsK1dsOEtOcDlnNDBOblRHZGdtbzJ2?=
 =?utf-8?B?Znk1T3RtdjNReTA0ZU5ZRXVNd2I3WUJONkRtUVJOWk13QTFhbXhKNy9Sb1FP?=
 =?utf-8?B?d0xQWk44VzNvbDJHaXhRekNEWXcvVlJ0QW9EUElaVWt4RE9PNjZoQjFBVVlm?=
 =?utf-8?B?NjFwZ0E4VFl2azBLcHhvTHhBVURMNGdJU2ZJTnNBUERhZmpDcERLSzNkOTBK?=
 =?utf-8?B?VlJ4N1Y3ZjBYKzVxOFRzU3kzYmVjSVYxYUQxR0ZmT2hLVjFSTlExa3h5cjVZ?=
 =?utf-8?B?OWRZZTRlSVFCSTBkT2NmZS9UbjV2VlJaeTd1Zm5hZU1nTmpXSUU4ajdtVTRx?=
 =?utf-8?B?bjIyRWNtdzNtU0pHaXFJTmRxN2lZMXA5c0R3Mkh2QzArRFRaejNlU0JaM0lO?=
 =?utf-8?B?Q3VVTUdkUGk1QUhoYXRneVAvOGVTZUxJY1ZWVCs1TjZONFpRbFF1Y0pra3Az?=
 =?utf-8?B?bURJQU1NTUc4VWNRQjJpd0ZOU1d1SytFdjJIZFVoSlRRbjBCUUZPTHYveFFq?=
 =?utf-8?B?UGk1a3VNVXk5dUdldUxkQUFJTDlxNFpGYVdSdHVMR0tZdVBuVGhqc2FiUCtm?=
 =?utf-8?B?VmdZZTBXVWMyUkMwV0pBcVB5amNDb3BpTG9ocFpnMzR1b01vaUhUUHlUMUIr?=
 =?utf-8?B?eVpzNDNEb0U1YlR5a3kwUlBrQ3hCcEIyMzFSOThRbkRJZVcrU0g4RXpIdk5Z?=
 =?utf-8?B?eTNaenREV1Y0VUxEMlpPRUFVRFVvWFlZQUR3VStsZTJjMks0K244K2dnRG51?=
 =?utf-8?B?VzNIRmZKZjhEVTVBam91R0lLaGFTQXpMSmFobHBlNFduTXpBME13eUJ4NVow?=
 =?utf-8?B?VzVkU3gwRTlXTzl3OU42U2dLMFZucFhzd3p3U3liZ29nSmtGSndkQjBhak5R?=
 =?utf-8?B?M0x3OU5WTkpUUFkxUVgwd25zL3VqNVF2U0dhYUU3ODhaSWVDS08yV3ZydER6?=
 =?utf-8?B?ZTZWNklmeFBzRTcxbWVONlpvWUJiZ3VMYUlZTWhUVHRGZ09McHVhdEJTRmV3?=
 =?utf-8?B?dWxsM1dmS01vTHNtQ0xLZlV5NGxLdFNlTkdQanRZclI5clVyUkJEZS9CeEc5?=
 =?utf-8?B?cCtGWXI1VUNIRDVhUy9JMkZmeTN5cjRVYkw3Y3VSQkpiREF0TERuRkFiK3Bt?=
 =?utf-8?B?UnRwS1JRcDV0V0JrSHpEeG5PdTFOU2dha1J5WEpEWjA5eVE4V01mc21qU1hV?=
 =?utf-8?B?OUQ1blExc3ZoaUtndHdwRHVYek9rcW50cTRMTVRSN0Rta2l6dUxCZXRhVUdy?=
 =?utf-8?B?U0ZXR1lKekJZb0ZXbWllVjE4RFNSU3JpWjdMUVlla3cyNGtjK3V6VG9WUnhI?=
 =?utf-8?B?TnRobGY3NjQvVmtFMDByZTBieTNnMUs4UjRCZ3NYUHRNSFB5Vk1BdFp6L1Zm?=
 =?utf-8?B?eGJPM2NRNUNVWStQVnNRZUd0cHZEMWpyazhNaDBkTWpmcFMwVWR5SEZUSk1C?=
 =?utf-8?B?eHd4YzVvaElac0c2MXFuOGlPVmdUNG40TDNzb1pwWmhxVFJGVnU5QnV5SEVm?=
 =?utf-8?B?cUlrNVB1cFo2eld4bWhTTjVuUmUwWHpIYVNQTmZaZXRnOGJJd0FCQzlvUVNt?=
 =?utf-8?B?RXE1VTJWNExlUmppeVROOS8yN0U5MWFnRW9BWU1rUkNNYWxTSXU5cHlkNUN0?=
 =?utf-8?B?Q2p4QmZmNDVKVnIvSVpvb25IVzE2Mm9qb01jWndzZFJUaThhZFJzUjJnT21t?=
 =?utf-8?B?MFk5d3hXUXRUZEliTStCV3M4RFZucitiWWRIZnFnZDlockdLNG5lNkNIbmJy?=
 =?utf-8?B?UExhalNqWm8vYW1ldUNUMDg0cmhzMmdqS2tWZ2pzSmFCUVlwRTNmdDlHSW5n?=
 =?utf-8?B?cS9oOVpFL0RnMW01cXREb3lIdlNWUzRWYXN4YUFLbW53ZTQvOUwvNHBINGU5?=
 =?utf-8?B?WmJHcm82dE9FaCtLc1JsUVRqMzdpY1g3cTlFT3ZyWGI1Mm1HZW10aU11dUEv?=
 =?utf-8?B?cDhBbDlwdmx5R1BFRFM4KzF2TFpjcDMvZDVqQjJ5VmFBWXRpbHRTWlVkMEtx?=
 =?utf-8?B?SEdCQjJsY1U1eHc0WnNtd1pMRkpueDd2MzByTkRURndBMTd2bUVuNTVOWU52?=
 =?utf-8?B?UTcrUndoLytjc0I2QmdzOVV1ajN6NTlSeXdSQmFwU3o1WGhhREhmZVZUQ3pW?=
 =?utf-8?Q?ard1xTL6NdJzWZJ749+foRH0VeeAq5Np2jc/zaNhQsq5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47994e2d-3e18-4e28-5ab1-08dd9f472176
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 06:56:41.2227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEBpEd3dCaXl3NmngkIWlrZutGXszEGjBKM7LbnNMIMlB84b65SUfkpOBN61MvDrW7HQtLylcA0XJAnLuN+z/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7933

On Fri May 30, 2025 at 3:21 PM JST, Greg KH wrote:
> On Fri, May 30, 2025 at 09:58:02AM +0900, Alexandre Courbot wrote:
>> > But for now, doing it in generic code, that all systems end up loading=
,
>> > yet very very very few would ever actually use makes no sense.  And
>> > adding it to a driver also doesn't make sense as you can define your
>> > user/kernel api now, it's not set in stone at all given that there is =
no
>> > existing code merged.
>>=20
>> Eschewing this from the driver would require duplicating the GSP
>> firmware (a healthy 26MB compressed binary) in linux-firmware to provide
>> both ELF and non-ELF versions of the same code, and also store the other
>> ELF sections as their own files. I expect this to be a hard sell for
>> linux-firmware.
>
> Why would the linux-firmware people care about the size of firmware
> blobs being given to them?  That's the whole reason for their existance,
> to put them in one place instead of having to download them from random
> locations on the internet, or to have them in the kernel tree itself.
>
> It's already 300MB or so for the whole project, what's 26MB more?

Roughtly 1/10th of the current total size as avoidable overhead. ^_^;

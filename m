Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331B2A95E;
	Mon, 16 Jun 2025 03:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750044890; cv=fail; b=rWTG05Th2WI9bJFh/T0k6nsdHisLFNDqYBIG/JmL5KC+1u8UZ8oovitQwDLZEbLsd9NK6q+2skyVDewWO8AzH1itUl5bAryz7nyefdt/ixEhJbed4XCREz8wYopsQZXByZr2WUerZa6KfmwGmNke8jTAhG6EOOOgnI2WnM6ztgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750044890; c=relaxed/simple;
	bh=C/o+8HPPBt6322ltJ7Jg/f2TCiSY37L0Jl2+YxCe7o0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=ZfgIrdHxsGQi+nsQQvmHBUiKMI+WzZLUew9t4vF3FF/9ZMFoaNWfrPe0H1lZFjoHb6B0y5N2gnIHxwvB5B8/Vw6ULoUTqlgiglVgWkl0YF0p0B77oUeQxPcbbY6b6XRgO62VAD/Cq+DT1+/ckvO5dOpEyGSFFVuPilMYGMHGMgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sm0AqRf2; arc=fail smtp.client-ip=40.107.94.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sm0AqRf2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mI4NDoGrx13O51Jvznk4xv9jVPOAuF4P8rU5uCHknaG/ylCgm4145hyAccxA/9E6a+1y58Hs2LyZ70dZWFAFkuFgfoM6RAjL8gqR3qYSMwFBE+3D7MNu1DQv1f9JZJnBFKV9dfhAiN0OXgonYrDoEMl7044aVZcxDYjGYozcwXyswbUed5IzZ8CrVR6UI5t4+lK5bp1SH8aB+jhKzqWg5IIYgQYyrpHzUxdrDrB8I9jKiqJEMQhnPMXiCfz6NIevYy0FNtRzQcN7HOJUAWHmrSIB+gYu90sTPqdadoxmQneHyozXVOuc7svN0fpQ7R8J1YyCGNzqA8P4Q7F7Z6xcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVudIRMmAaMTRMvdgZnHlCV8AayuTPcEZg5BPpr+WSE=;
 b=q/RtP3VTdTLvRCr7VtgZRXcNNueYIKEXgbNe8pj1igo3igmEyygYE9LXpETEoOITEL+vUxoDIK473RdYBXiXgtZB+S3btuDLYrg9fkP2fE4JuqFlRK4Mkcwk3wXjVRKOwoISMQ8FF92IA8ALS7LexBQWDydQ8M6c0oxJFWdQiqHUBg7OUqJBR020uOScC+qKsGa4iz1rSvgC2CjQxfplZSdi5hqNJp9bzQPXe2hMTK6GLhFcfUq07RIOLKzcf1Zw5/iqEOHX6iwtuR38kwNeXh2Q7c1KQhInB4vtg8XQUAFillyV/7k3C8nUg3Kw/RaO7i2+MjKyAL/c0oYNCtxNXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVudIRMmAaMTRMvdgZnHlCV8AayuTPcEZg5BPpr+WSE=;
 b=sm0AqRf2FdS7zmJynFQRog+1aPofIdqlWQv+tvfqo6BAQkDVywQAD5fE50cpRbSH+60q8XfPn3rNjuXpRRZcGUtCQRDRvkdI/kRPSrkJmNkxajb8Rul8zqCh9yzywPx969GW2qoHzAzvOgGcbtIumMnHDeOEO1l7r2OYN9yuRdBFFTHJ5u04kn1q5dnN0pBXKqjVLHVCVep/17VHo1Odr8yOSIvFzyyJNNdzfJtj8Lu5T0lJ3cQt1wZCoyKdZS2VerIhNFFBWYsF2tDDNFYxBApwQ9K0bk+k00rQflqwqZ74vaAS1njTcPy7X6U8Vg2P/6BAHRTI1dn/8f8nc8Okzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9027.namprd12.prod.outlook.com (2603:10b6:610:120::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 03:34:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 03:34:45 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v4 0/7] rust: a few common Borrow/BorrowMut implementations
Date: Mon, 16 Jun 2025 12:34:04 +0900
Message-Id: <20250616-borrow_impls-v4-0-36f9beb3fe6a@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKyQT2gC/2XMSw6CMBSF4a2Yjq3pbXk6ch/GGKC3chOhpDVVQ
 9i7BSeIw3OS7x+ZR0fo2XE3MoeBPNk+jmS/Y01b9TfkpONmUshUpAp4bZ2zzyt1w93zQhs0yjS
 IpWKRDA4NvZbc+RJ3S/5h3XupB5jfbygTm1AALjhCU2GdyELXyakPpKk6NLZjcynIlQa10TLqD
 KRAKNMCyvJPq7VON1rNWkKuMo25kb96mqYP1j6DriUBAAA=
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
X-ClientProxiedBy: TYCPR01CA0005.jpnprd01.prod.outlook.com (2603:1096:405::17)
 To CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9027:EE_
X-MS-Office365-Filtering-Correlation-Id: c43cca82-d382-4b29-cd36-08ddac86bc8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVZuWVB3b2NXcmFzNStxcXliMVJreE05azhuYW1jcmVLMzlqWkxBZ1hHUDhq?=
 =?utf-8?B?YVJRaSt2cVBSRmVLcy8zVGVKQXdNOXgyS202M3h6T0ZuWWRkQjRpaVVJNjNR?=
 =?utf-8?B?NFMvVmM3SlBUb0tnRmN3ZnlhMnVtT2xzK0pDSW8xa2xiYlJKRHZqWm1tMWdR?=
 =?utf-8?B?TlFrYmo2UHZ2amV3c2R4Wkc2YXE4QlRIeW94aGVKMDFLM0tCWGQxN0NEMEtp?=
 =?utf-8?B?aG9ITXdNRFNQZVJKaDVVOWx1emhWWVQ1bm9jSllFd2dXS1FLSmRNWHBTSnRS?=
 =?utf-8?B?dVFsWlA4bCttNkJESHlxWjhhUDBTVk03L0NzbUNNUjhYR3g3QWdVU3g1ZEkv?=
 =?utf-8?B?MzdQcGhxcHdEbkluUmFrTEgvZXNIVDNJemxwc0x6NDVVbCs0dzMzMlliK1Nn?=
 =?utf-8?B?ZUZXWmtTM3BGeGV5eFhRdTdmeDRIS0NDckM4bjgyanRqeWc3VE5UUmZsQWQ3?=
 =?utf-8?B?WkMvWXVHRzRjTHpQUHN5Y2pPR3cwWFZuUnphVFRmSDVrZE1VRWUzWWQ3elFX?=
 =?utf-8?B?S2ZFMjNGTXpmdlp1dTF0YTZ3dk5xbWZvRGEwd1oyaGNHajlvellwaXRweTdo?=
 =?utf-8?B?QWtrN0tlQ0xvK3h3alNHSVZWVWlheEczZWM3SlBLL3FKQXN5YlVtVXNLMDh3?=
 =?utf-8?B?cmlkbUpxYWF0K2RPUDAxb2JMcnFyUm1WMXo2Y2lMcjBsdlpjbExZMVdvVWVh?=
 =?utf-8?B?WDJwSmtGSWNDWHROaW91TEpuR2lDUFhVREFDRk8vbzhYVWh4a2hCak1zOHdp?=
 =?utf-8?B?MS9xQzZqQkJBUzZ1cFJSV1JLdG45TldCZ3J4NlN0SU0yakd4Wmc4OXcwTXJF?=
 =?utf-8?B?N0YvenV2dm1LM0h6Z3BPb1BOckJOZVBlZDV6bXhLRDZIZk1iSnpWRklYTFp3?=
 =?utf-8?B?SzM2aVJVTnNGR3lZTlVxd0lJMjhMQlpXYjFhb2thT0JIVkYzZEx1VEdyR0xr?=
 =?utf-8?B?MUxudkthMEloalFWQVpuVnRnbU92cXhqSUZqQWF1b1pYZ1pna1hMUU9XUVQv?=
 =?utf-8?B?Q3BGZENkeXo1dDNtbDVqTUdObk93N3NNU29kSVRhWGEwWEhrRERSRlQ3ZERX?=
 =?utf-8?B?R0J4cHFsbHVLdEoyUzRWUk14N3J5eVdMbHB1aURVditLdkxXSTlucUVLL1dy?=
 =?utf-8?B?T1JSQ3BQb0lxU3VuVmtzYmtTR1M5WmI4V0tncVJlK3E5Yzc1OWxuUTRyNjZR?=
 =?utf-8?B?M1dPVFcxUjc0aHJkYkRvMzlDZmZ4SVhRS3FGbGJleHBvbElpcGl6U1VINm1B?=
 =?utf-8?B?RTltZERWbjNVUTJxSlQ2azFIVmFyZWRHNUhFNjU1enRsS0hoanh4RFhYMFdz?=
 =?utf-8?B?WEh0VjU0djJRT2FIRzdKQzRrMWtjZFBWZXprUG5ESFVCMm9keU1pQisrRjIz?=
 =?utf-8?B?MHo1WGtoaWR2R0RYakRyK1FuaVZzdWh1YmxrVjJkRU8wdTNzU0U0ZlF2cU1H?=
 =?utf-8?B?Sm42b214VzRnOGhvd0VUb1NXaVdwVHRCTkkyRS9VdzVhOUFZZHN4RkpGS2lw?=
 =?utf-8?B?UExodzZRTUxBRDliWmd4TjlzSnJlR2dQSHBGeFVBdDBackVsaHlqb09wQngx?=
 =?utf-8?B?U3Y1YWNBUERYcDVwM0k3WjF5Sm9sR3UrTENVTkpCY3AyOWpZaGEwZnJ2RlNy?=
 =?utf-8?B?MmF2WVltRnh1Q1cvRTFEUVVLWUhndUtYNkU4aHNvOFY2OWY2OXhTL213dTBn?=
 =?utf-8?B?S3g2R0xBeTE3THdKeHBxMmFNQzd3THY3MzFMVVU2d3M0MUs4eHkwcU43WXBs?=
 =?utf-8?B?YmwzYTJ3MVBaKzRVaDJLdFMwekRVV0dWQkFmQnNUMFQ1TzdvUWEyU0hPMVJF?=
 =?utf-8?B?dXBhc3hNN1R5YVFRMTRoWFU1M0xWWjlOMEo4N2NQWWk3YWxLYS9DYUpPYmxx?=
 =?utf-8?B?YldSTkNaekJKNlpEanZsdUVPRXpvSnFMUnhDdGtuOTlnMG9aOFFNMmZOeTE4?=
 =?utf-8?B?L2ZjWW4yUWppTUdNYXcrQkV3Q1VNRGRyZS91cHh0amxhMXBkd2hucEpHM1Qy?=
 =?utf-8?B?N0VvL2lVUWp3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ujh0OUlmQTE2SmFUNjFFQmREVUp4bGQvYzFYOU5ySDlpR1ErQ0dxQ2xsN0w0?=
 =?utf-8?B?RmVyWmJqMXl4WlhBNzdLbGlxTWorNFR2QVJKOUZpcyttaFRZMSt4cVI1SWQv?=
 =?utf-8?B?eUUxT1hyelpNc2ZlbTVPQjl0TjZWTkFGa0FKTGkwR2duLzlHNXBUdFlMb2hu?=
 =?utf-8?B?dWtWTXRsUGViVVZoWnR2c2VWejByK05BV2UrU09LWG5qUVhnRVpneXltdEc4?=
 =?utf-8?B?VXpNOGplR3BBcEEwYkg1Q1RvdW12Sk1zQlZDNzdSNHpiZ1ZuOFFLbkM1NnFN?=
 =?utf-8?B?N2dPQXEyUnc5Um1henNQc2xySGsrWWkzcnc5MDBwSEtBbUxlV0FGVGVNeGxT?=
 =?utf-8?B?U0tpbDJ1bEpJOXRtaWI0NmhnSGIwMEsxNFdXMHZTaU5jMURoVndEMTM2SkxF?=
 =?utf-8?B?WFRyQjdLUnBhUlpTekpuZ2lPVlU2Z1V2MjA1VmlEQ3lKdldVOVBNUCsrcElT?=
 =?utf-8?B?TUZHRVNyZ0g5U2Z5bS9hcTRXZ1BmZElzUTJrTjMrdmRKYVduQ28rc1RvMU5n?=
 =?utf-8?B?K2JQUXFBMURjZHdhNXVhNjYxV0Z5VEhqaytsM1ZMNFJYWWYwc0ZIY0VHYU1M?=
 =?utf-8?B?eDRYTUxCSXU1dmxpT08zanhHdFMwRmhERUZOc1ptYWhUZkw0OFFNTmcvdTlY?=
 =?utf-8?B?Rlg3MW9qU2V4V1Rtb09OUEVralR3Y2ZnMEIxZFErNXhWUFAvOS9QUEQrZFEr?=
 =?utf-8?B?VUtsRVBocjhaai9jV2FIRHJGV0txR3o1RVppUVpaR04veHYwR0JPVDV2YTZz?=
 =?utf-8?B?eVdFV2hWK3loVHNyT1VZMHNCR0hCTVdZRGNBcm1BR2lwWWF1V0luM1pXWFFL?=
 =?utf-8?B?ZUFuU1krdnBUVUZzSXJYdGh2emVDK3hlN3JnNlNQZTVEZ2tYYXRwWjVOM0Fm?=
 =?utf-8?B?Z2x0Wnc0NEdxU2d6WS80VXcwQXlhU1c5czhkU2NMMGJNWm5iT1VWbCtrSFl3?=
 =?utf-8?B?dDh0SjRwMGdxMU1mQkVja3Bkc3I4M0JhalRGVDNwSnk4Q0I0cEhrQy8rbVFz?=
 =?utf-8?B?NG03SjZrcVZIY1pZLzRrRTljS0dtaGEvS1VJdXVJS3RoOTRQdmFaZlJ5VDlB?=
 =?utf-8?B?dVg5aTBaa2tRc1AydnVQMmx1N04rOEpZWENUQlF3L0xHZzJVaVgyS0o1Ty9v?=
 =?utf-8?B?Y1YyeUJoSFNXNXRkc05jbXNhSWo0UUlxY3FCdFhMUXErRFlRN3I5a1krM0Nm?=
 =?utf-8?B?LzJjdFV6WGxCMFNyZExTUXk2bkF3ZTBCd2pVTTRoS0pVRi8vb2ZrYlNOM0N6?=
 =?utf-8?B?T0c3NzZaMUNISmk5bXdhZlVZQUs4STkvRUo4OG85YmZBcVFlWDBBdHJsZ2ZL?=
 =?utf-8?B?QjE4bGdqVWhKQmZuZnZXVFpIYzZEYjIwOGM0Mm9ZL0orVllreWZYVm44ZXZ1?=
 =?utf-8?B?VjByYVhsM2RaNjYvbkhGSFZLQjVLQXlDUGU1WExPcklGclJiNlhvelc3WURD?=
 =?utf-8?B?SjlwUDRXNFlzR2MvU28zSWhic213S3ArNnBzdWV4cDE2bGttOGFMZnZqMUVM?=
 =?utf-8?B?aVBVT3BZcldZSEQ2L3lGWThBcHl1bW96TzA0ZDFUa2JKSVN3ekQ4WFVCenRW?=
 =?utf-8?B?Rm1TU2ZabmdFTmczOHc3ajA0RmR0R0dhRFhwNjFwV1MrSGtRM3o0MXFVNllR?=
 =?utf-8?B?TmwyalNlK2lqbGYrdmN4L1daVHBzbllNZUc4bHZobHJuRmJhQjFsamllWXR2?=
 =?utf-8?B?THZWNGU5U1FJamcrYTdSRU1PYmFuTjFyWjJONXpWTEc0YkxBK0pMd1VVTlVV?=
 =?utf-8?B?Wm52WVlpejY1aExZeGRCU1pHRXREa3lhUkFLNm1nWXRKWFg1eUVyM1hBM2wv?=
 =?utf-8?B?MCtJYzljOUd4SkZpb1FmS29PM1V6eGRLbmM2QWZXVWY4R3RhMzIvNHg2QUE1?=
 =?utf-8?B?Rm1jL0dHVWdNd1BObVNhSEZPa3V5RmdmVTFhc0J4NU9TNzBzbktCMy9xRU1x?=
 =?utf-8?B?VHcvaEJZYU1YazlYNi81S0l3QUltNTZ1MWlpdDhwOU9pZDdVdU5iWXFCWDVp?=
 =?utf-8?B?UWdianluSHRUTHVQdG4zOW94NWlkZElRZkthbjFkakd0bTdZUHEyWlBGYTUx?=
 =?utf-8?B?bE8vcldzZVkwdStpZldtUmt0MUlOdG1VQVRjZURZOWltcWlvVURPRm9sSU9S?=
 =?utf-8?B?MkUxYnZtQWI1MUxJRTZucjRkcWNUcUUycXVtc3RnRzlLNTNxdjIxVU5Gdnda?=
 =?utf-8?Q?YteLFtUr13qz/LSGPrHCvmg68zLGfHAsSoSHgCPcLaAd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c43cca82-d382-4b29-cd36-08ddac86bc8d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 03:34:44.7388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPqni/NwBdk5jydW54y3uSLlfiuhixcmSJ3PWW0nCmfPOC+gPh/1Ft1xlowtygkWVJUByiFvJ2OfXq8HqwdiIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9027

The Borrow trait has multiple uses, one of them being to store either an
owned value or a reference to it inside a generic container. This series
adds these implementations for `Box`, `Arc`, `Vec`, and `CString`. I
came across the need for this while experimenting with the scatterlist
abstraction series [1].

In order to avoid an unsightly unsafe block in the doctest, this also
implements `from_bytes_with_nul_mut`. `from_bytes_with_nul` and
`from_bytes_with_nul_unchecked_mut` already exist, so it looked strange
to not have it anyway.

While doing this, I noticed that `from_bytes_with_nul_unchecked_mut` was
not const and not using `transmute`, which I attributed to the absence
of the `const_mut_refs` feature at the time the code was written. I've
tentatively fixed that, but my assumption for doing this might be wrong
so a double-check from someone more familiar with the timeline of this
code would be appreciated.

[1] https://lore.kernel.org/rust-for-linux/DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v4:
- Implement `from_bytes_with_nul_mut` to avoid unsafe block in doctest.
- Make `from_bytes_with_nul_unchecked_mut` const and use transmute.
- Use more explicit names for variables in doctests.
- Link to v3: https://lore.kernel.org/r/20250615-borrow_impls-v3-0-621736de7f29@nvidia.com

Changes in v3:
- Remove undeeded first line of doccomments.
- Link to v2: https://lore.kernel.org/r/20250613-borrow_impls-v2-0-6120e1958199@nvidia.com

Changes in v2:
- Rebase on top of v6.16-rc1.
- Improve commit messages. (thanks Benno!)
- Add examples on each impl block.
- Link to v1: https://lore.kernel.org/r/20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com

---
Alexandre Courbot (7):
      rust: alloc: implement `Borrow` and `BorrowMut` for `Vec`
      rust: sync: implement `Borrow` and `BorrowMut` for `Arc` types
      rust: alloc: implement `Borrow` and `BorrowMut` for `KBox`
      rust: str: make `from_bytes_with_nul_unchecked_mut` const
      rust: str: use transmute in `from_bytes_with_nul_unchecked_mut`
      rust: str: implement `from_bytes_with_nul_mut`
      rust: str: implement `Borrow` and `BorrowMut` for `CString`

 rust/kernel/alloc/kbox.rs | 57 +++++++++++++++++++++++++++++++
 rust/kernel/alloc/kvec.rs | 53 +++++++++++++++++++++++++++++
 rust/kernel/str.rs        | 86 ++++++++++++++++++++++++++++++++++++++++++-----
 rust/kernel/sync/arc.rs   | 78 +++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 265 insertions(+), 9 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250531-borrow_impls-8dfef3fcee93

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>


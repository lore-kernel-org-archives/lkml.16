Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE6E79CF;
	Sun,  6 Apr 2025 13:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743944750; cv=fail; b=GTt0NXXm1rdCumnRTOn4EM1XvARgDNWVzYrkk+jYHNRLy56tdWZKxBx10ayOJpTLzCZOd6sfctV7Y5iFPLEbRRM7sshU4PtWG3hT6u6MPPZmSBpr1a44ktboULI0NlGfxLw7xtRNSfI91SSE1NP4SLa2nI8AAsfHXq64BdAiaXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743944750; c=relaxed/simple;
	bh=Uo/tJ+IgV0BSVx4YDlp+4CdYpEi40TN6j+GQEj+boZw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Zbe+GT/pXouHpU0LqQBfrLtgdwlTHubJ4Oc9rT6JTU53c52bLVuhs3qd3jwQ4K77f2bI+ajvV7q8dBucY7dxYLm2poAyYBMv/F/hb0CELF+4mupW9Wr3RPq35rtsGkiklpPjxeMMxic3uRmCmhkTIx3MzQfXM1OY+jjU/PYVbhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V5MgJcRx; arc=fail smtp.client-ip=40.107.243.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V5MgJcRx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=arODCqRLl7T808gVMSpDErT+Z4axFoJ4LYqo0IVEydWHas0ux3W/JDcqSNx3Nd5BVXt0b4tW6CYwIl6xeWy6wsZ/nSpwDp9jfX6PGNBSs5QflZqBnnMrTROVfr9RkYXf2OgBJxvYDyROgVrda1uM/+k46LTUtbfZKrCYf/cBEb164+O6Nl4yaysD0hChVUHZ4/TQl4vykd+7++heHJvzLKskChdrp7iNMwvSnjFsTS1uQZ9txhQIwi56ZFgIyxO8mUcPNskxCI5c8Imwzx36UF8hMCumV3yq7out9YqBkZ/55AV5/3hOBxiD7X+p/sBBUkLh/EToekkr8Gl5GNEJAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2vSc/IeF2Ff4R4gQKCpOoa/HSxnnwGtWVQdvKNu9iY=;
 b=l4/+Wvj3WiWxkna8Vqip4GetrOcewwOtDr2XSf2AopJmahzzwqzSI7SWEvbe1JcTMnU6vq6UD+ky4UX06vbiiF9xkQle5zjVk6HhHQM8peMrbg5aRDfGz+1U+F+n06L8duWMOjT/Q0Wxwqoo769iGITq3XIk758NhcXGFp//1Y5pFhuC/1nSHWc/OrY/1QVim4bLE8K+iOPvv3Z4r8yt97CTm1qR/Zof1L9MIEo7VoEQpTJQvtDYGSnCpAyk/gqPZi2hZYE0ZQ76KS27cKntRzJsAlI3/JJmC2LNdi9VHjniKmbwCvbvqZMKC8V9e1r0EukxPsq96GhueCxzi8fNfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2vSc/IeF2Ff4R4gQKCpOoa/HSxnnwGtWVQdvKNu9iY=;
 b=V5MgJcRxYNcULdV6S+eNUDY8VgZSqiFNGYJ2O7Qy8jyOMpDsLsvL4Y6/bZnwg2cT1y0DugwG03YJBX5qR0X3mXvz+vvm+jGkeYRRhTBBUVM3AOHJAnXbIByvemhNY5d6O8n2QINJtWsT2u6q00XsnhYXphGTYDk5mmi37grvs8CxBhVGaskfCmL2rcnSlHyj+0o0MbPhm7HClHteDzNtxOyG+zW5ktp3bfDlwCOWTe+DfDw3LxTUV/Yr5Eh972SsNRzUBwW69z/qHTLTPMsyjAj2GGtokTYPY0dulb1n48YDywyiWwApBXS+rRyTaFHxkxX54F88khAcHBiv/AmXoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB8087.namprd12.prod.outlook.com (2603:10b6:208:401::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Sun, 6 Apr
 2025 13:05:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8606.029; Sun, 6 Apr 2025
 13:05:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Apr 2025 22:05:39 +0900
Message-Id: <D8ZKTDE05HBM.2S9OI9WDVEV6U@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: alloc: implement `extend` for `Vec`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Boqun Feng"
 <boqun.feng@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250405-vec_extend-v2-1-e4a85af43cb3@nvidia.com>
 <Z_GIELVB_HI_qeWX@boqun-archlinux> <D8ZKOIHKPBCN.OIHEWU3TUE1W@nvidia.com>
In-Reply-To: <D8ZKOIHKPBCN.OIHEWU3TUE1W@nvidia.com>
X-ClientProxiedBy: TYCP286CA0297.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 2174982d-46e1-46d9-fde6-08dd750bbc98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RS9sVlpCd1BtK1FzRkgyYzZvYlNIaFltV3pzV3RJaGpSQzArdTJxR0hDMXBo?=
 =?utf-8?B?Vi8zWU5RQ0VrWHFuQllrRmNYYlBLYlA2N1I0NUpSSlhJZFo2dTk0eTRoeXhh?=
 =?utf-8?B?cHZDVnM2bU84VlhKOTNaK3hrL3VLblhHYWplaFBzOFl6blNZVmo4UUprZ0NK?=
 =?utf-8?B?UkhjblF3WUkwQkUxaTdsUkRLbVR2eHA5cWtPZUtsQVFpTC9tdEhUdUVya0xH?=
 =?utf-8?B?UWdFRjNKNE5hS08weVBGeXRsdXcvRVJ4U2lyTW1ZR0R5U2pQMGxtOEtGRnAz?=
 =?utf-8?B?Q3FtNFZuVXI0WVJTTWdHV3FBd0grSkpvTkhDUmFkNEhiTUtkekdCR0o2dUZR?=
 =?utf-8?B?byt5TE9lZ3FOMzNuOXJFTjFDRFFhd0Q4UUx1U1hXS3VFWU1FTzhDbjFHVWtN?=
 =?utf-8?B?Z21PcHZ5a0hHanFrWEpyYnkrNE1UZWxTbjE2T2h2SnJYelkzVnp4S1pBTFIr?=
 =?utf-8?B?ekhhSWo3Y056ZG5rVTBGZDdNZlRDN0NyYVYwa1dSbmlTOGNJcTAxaURhQU1M?=
 =?utf-8?B?a0VCOXIzVVdzSHo1Q2svRDdoU0p0Z2p3UTdNdEtIUFdCbHh5SHRQQnZMQWFG?=
 =?utf-8?B?eUc0M3kwL3V3SjJuZ0Nna2RSQThVajRXY3c3WVdkYlNTUFpFdTBGdEhvbDVo?=
 =?utf-8?B?UVlBVnpOa2tpQkttNGhad1VoSjhQTHlCMHRZSlBHd0VBMCt1S2V3dlp3OTRQ?=
 =?utf-8?B?QUxXUnJHVFBQdFJyVjRQdXFIRk1pZnErOFIwNGUyOFRtTmdLejNFeFp6U3py?=
 =?utf-8?B?cmpVUkwrc0tERkE1KzRCWE5kUFB3ait2MWtEQ3lzcUNUOFIxZzQ4b1loZ3RN?=
 =?utf-8?B?dklueXc3c2JzalJhMFFUVFJLQXlYRlZKbGVweW9EekdNM2tCeWlSZHdoTTl6?=
 =?utf-8?B?RmlMYXpITm9zOWpqMW9BQzJabFhGVkJhSHg2c01teWJPUGN1eWpabE84QlZy?=
 =?utf-8?B?bHhVais4czcydkNuOEl0YS9qc2p6TTFiY2liMklSQlAreGprOHBaelk0ajJj?=
 =?utf-8?B?clNYY1NKd29QcDN2UVE0WmVCQzlXM1FQUU1IYzduYUVQOVgycStKSU5TSHdT?=
 =?utf-8?B?V2NNd2ZKM0hobXFreHAra0E3V0x1amt5OTBTWG15Y2tQUk1vK2dxY3hYaThX?=
 =?utf-8?B?cVdET1VxbEc0enZsYk5TZlkzZk1udzVmV2ZuLzBKUmVDVW12Y25URUsvZFo4?=
 =?utf-8?B?RXcrYUpnVCtjUThnajVkdDZMM005aDZQeloydUE0QlVqc1EwdFUwK2pxRHJz?=
 =?utf-8?B?VzQyM2d1OUljT2hDQ1ZvU1o5NGR0dklpNW5CQXdzbmp6WmNGWE5Kd3g3ajlt?=
 =?utf-8?B?ajd1NkJNU0xTeStmYldFTTlmSFhRc1FFWW9JUjZqaEs5SnhYZEcrMDNmbnZ0?=
 =?utf-8?B?NTcyeDZuNFc1MGkzSUU1eFZSZHFqS0hhM2RMUE5DKzZobTJYN2NmRjM5V0VU?=
 =?utf-8?B?MWdJZHlmcjB0K3RkelJIWDZPWnE2ZmM1NEhwRTNFSklSTWoxbnFqMWRFL0h1?=
 =?utf-8?B?b0ZvZUdiaU9VZ1FHdVplWFFwSytnVmI5RDlPMzVKM1M3OElSQW9UYkNObzNw?=
 =?utf-8?B?bGJ5SmluTlBhNEFsY3NCWERLNGlTTmZwZzI0aGFhZ2JqY2RYa2x4eW9rM1cw?=
 =?utf-8?B?Kzg3Um5sZnkwbjVxL1lKbGdxMmRLQmtIZjJvUlVTNDhjUGg5RmxxNXhsMTB2?=
 =?utf-8?B?cjl4ajdnQWR5OVFSRmNCamo2a05IWEF1QVdUSjZKZjNjZEprdXNuZ29Cb01k?=
 =?utf-8?B?RmtUNEwrRklpMmt5V1Y4eVZ0NWpNN2pRUDBvaFh0WGQvQVQ5MlNKRFIxMjVT?=
 =?utf-8?B?WkhTd1d0T3hPMkFodkFtSzVqVGNKdTFNR2N0M25HeXJVUW9TK0RSWVJDSWdk?=
 =?utf-8?Q?vtCvN27aNhd74?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzNYSFFmY05qNGRGd1AwUU9JWm04eWEzbGZxV3JreXgyR0ZhYitJS1JtOG83?=
 =?utf-8?B?UjQ4OVhxZUdiWnNxQ3JNSms0Ykd0dkRMMmIveXJNYWtZaEVIWExBZkVFMWds?=
 =?utf-8?B?cFdpV2V3dmRkcjBOeGVtMkF4MElvcFZBRmxvU1RjakwrL3M3WWt5T1hCUDZ6?=
 =?utf-8?B?UmVWbFZZSWx2TUY5NStmeXhORHFseXdsbWROdHQxeEhFdGU4ckFvNGZZcDV1?=
 =?utf-8?B?bEtHRlNlYUN2WE93WDZGQyt6RVRjYkNtdWVXZDEzQVFYMTg3RnI1ZFhLTXFZ?=
 =?utf-8?B?Qnl5Q083UnNCQnhoaEp6MDNuTldNMTltWUxrM0xDNm91Q3gzcE1rRHJuN25o?=
 =?utf-8?B?M1VxTzI5WFpYanRIa2F4RzNoMUtpak9telA0aGh5VStGZEZieUZPb3krcFJX?=
 =?utf-8?B?clQyZExCUUhLTzNDOHFpS0RqaHFjNm13RWVUaHRLMyswN0Vwb3hyK0NmL3Vh?=
 =?utf-8?B?MHFrZVJaanJJQVVRWk03UnRoMHlaZzFWdTQ3K04vR1k4SzRxak1BZGxGNys2?=
 =?utf-8?B?VW5RYmkrNUpmNkwyVW9tUlBJbXRJNHNFbXd3SUhRZzB0OXdmTFJFME5FT2xX?=
 =?utf-8?B?bTFXM3U3R0VyczVDM3U2R1MyWklBdUFXK1N0QXdtSVRWR1FoOUxiS0xsSEh5?=
 =?utf-8?B?NEVjdEdxZUFaalJiYzdxY21Sck1IV1ZDZjVkSnRhQTVpMEJVbnVCL0FJaks5?=
 =?utf-8?B?YXVEQnFDellEVzcwcnQyMmlmanpVRkJ3S2ZxRjFENnpWRW9ETGszS29JbUY0?=
 =?utf-8?B?OVQwd3dqMFdvcW9QdzloNkxwUHhVTlhUUkk5ZFZLcG16b3VMeFNlOHpiTWdG?=
 =?utf-8?B?bktYZDM1cTgvNWlGSHlRTXB0NjNiSGRFMVFUS2VHM1VNYm9xdkI5VlNsNEgx?=
 =?utf-8?B?ei8xU1FiM251Z013NEN1b3J2Tk5tOXF0dExab2ZVcHhvUnNFckd5TU56YjRl?=
 =?utf-8?B?bzg3RTZlVlMvaG1hVy9KSjFMNUVyUlNBMlFUd2FPdmVyWU16QjFNQVVMb2Mr?=
 =?utf-8?B?cFQvYWR5TEc0cW4zc2lDOW92Tmo4RE5tT0dMQWRqdklvMW0weFlqbGFhcnN6?=
 =?utf-8?B?Zy80TUxpUm1vZ0FMWGtISFlPQm9FbmNVTWxkSENXMEhwMlNnaHdFa1ZGWmE0?=
 =?utf-8?B?MmpRNnY2K2Z0TytjV0pKcmpDS1hDUEUyVUZaMzIraS9mMjRWUzdnd1c4dzNx?=
 =?utf-8?B?K3RadkZuL2hYNFpGVGgzOGZ6amovUU5NRG5Hd1BPLzFQa1YxaWs2cU4zTERy?=
 =?utf-8?B?dDhGeFlHNTA0c2J5WnNoeGsxWStLdHZYRmVldUE0eUVjeERaZmJkbkpWYkQr?=
 =?utf-8?B?ZlRJT2EwcWJpL2hVdGFLeDQzWDViS3hGOGk2NmM3eHpJeXFBTXpTbXVsK0wy?=
 =?utf-8?B?WXhHOVdiZkJIZUtjYytBQnhVSE80eGlSTkFGZ1hOZ0tkelVQdzRFUGdEbko2?=
 =?utf-8?B?SmZibnUvRy9QWHB6VEZ5VmpKZVZjOUkwTDd2WjhTa0FobTZQWTBGM0JEdUx0?=
 =?utf-8?B?WGc3RVlNdFVmRlg0Nkl6S3I3dGRBYXd1M21Ya0pIVVFzWUtFTkhjeEZvS2hs?=
 =?utf-8?B?T2FWSmRXS0cxQ1Z4YkNsL1Mrd1BJTHRhUmYwZ0d0UFFqaURScUFLSG1zK2p4?=
 =?utf-8?B?Y0JJeGpweVRFMEVUZXJvNThrWXRycGFzK0hNN2JsczkvempJbzBabVIzazhF?=
 =?utf-8?B?dmw4aHNwMGcybWhKM0YxSHdCTCt5cUZoeGdNOEtmRmtjWExnaGV3eUtpUHlW?=
 =?utf-8?B?YVowbjZ1Q3NyNS9sc0lkbjdkckdWK2pQM2lxZHZFUVk0UFo5YTFVN29tR2Jz?=
 =?utf-8?B?SU8yNHFUcXczT2ZKNGVZelVRYUgxL3IreWcwamdNL3d5WGJvd2E5Z3MyYXU5?=
 =?utf-8?B?Q2w2ZVlmUVhGd0NwSkpDMllPSW5lYlhqMkd4WnNzcHdVVmVrUmZjOVZhTVUw?=
 =?utf-8?B?VjR6Wm5aazYwRHRuNTN1blVPa1pvQy9acnNnVFFIa0krbE1xVmdxSW5sTTRQ?=
 =?utf-8?B?WHhOakIzS1ZEbGZ5UUg5T0hhUVJOeE9rT0VDM2JhZXo2bTJMVGxvMERSbHlT?=
 =?utf-8?B?UWVOOGxPNnhuSVJGd3hWS2hORXpXQ2xlVDBFcytCR2Rrc0ExRDBvOCtGRU1L?=
 =?utf-8?B?dkNhM0J4WUMvcXJLWFpuNkpxQ1RkQWh0Nis5VUhYV1l4aGpEbm1jT08wY0tJ?=
 =?utf-8?Q?OA32qcR5t8HflGHkirt7h42t7OxYLfbFl9WfrkEO3WwC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2174982d-46e1-46d9-fde6-08dd750bbc98
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2025 13:05:42.6857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dt1eddJZtnb4lRSSVNM+deBSxh6AKtP9ulZTvA3wdSsxWaN+CUlNN899pXFzB6Bsw1I4gR6QlUy4uIRuzTzzhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8087

On Sun Apr 6, 2025 at 9:59 PM JST, Alexandre Courbot wrote:
> Hi Boqun, thanks for the review!
>
> On Sun Apr 6, 2025 at 4:44 AM JST, Boqun Feng wrote:
>> Hi Alexandre,
>>
>> Thanks for the patch.
>>
>> On Sat, Apr 05, 2025 at 10:51:41PM +0900, Alexandre Courbot wrote:
>>> KVec currently has `extend_with` and `extend_from_slice` methods, but n=
o
>>> way extend a vector from a regular iterator as provided by the `Extend`
>>> trait.
>>>=20
>>> Due to the need to provide the GFP flags, `Extend` cannot be implemente=
d
>>> directly, so simply define a homonymous method that takes an extra
>>> `flags` argument.
>>>=20
>>> The aforementioned `extend_with` and `extend_from_slice` can then be
>>> reimplemented as direct invocations of this new method - maybe they can
>>> eventually be removed.
>>>=20
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>> I was a bit surprised to find no equivalent of the `Extend` trait for
>>> KVec, and while I anticipate to be told the reason for this, I also
>>> didn't hit any hard wall trying to come with my own implementation so
>>> here it is.
>>>=20
>>> I expect the new `extend_with` and `extend_from_slice` to be optimized
>>> into something close to their previous implementations, but am not sure
>>> how I can simply verify that this is the case - any hint would be
>>> appreciated!
>>> ---
>>> Changes in v2:
>>> - Changed the diff algorithm to histogram for a more readable patch.
>>> ---
>>>  rust/kernel/alloc/kvec.rs | 89 +++++++++++++++++++++++++++++----------=
--------
>>>  1 file changed, 56 insertions(+), 33 deletions(-)
>>>=20
>>> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
>>> index ae9d072741cedbb34bed0be0c20cc75472aa53be..e78cb5ee575ce01e44283f8=
b4905689fb1e96165 100644
>>> --- a/rust/kernel/alloc/kvec.rs
>>> +++ b/rust/kernel/alloc/kvec.rs
>>> @@ -454,30 +454,64 @@ pub fn reserve(&mut self, additional: usize, flag=
s: Flags) -> Result<(), AllocEr
>>>      }
>>>  }
>>> =20
>>> +impl<T, A: Allocator> Vec<T, A> {
>>> +    /// Extends the vector by the elements of `iter`.
>>> +    ///
>>> +    /// This uses [`Iterator::size_hint`] to optimize reallocation of =
memory, but will work even
>>> +    /// with imprecise implementations - albeit with potentially more =
memory reallocations.
>>> +    ///
>>> +    /// In the kernel most iterators are expected to have a precise `s=
ize_hint` implementation, so
>>> +    /// this should nicely optimize out in most cases.
>>> +    pub fn extend<I>(&mut self, iter: I, flags: Flags) -> Result<(), A=
llocError>
>>> +    where
>>> +        I: IntoIterator<Item =3D T>,
>>> +    {
>>> +        let mut iter =3D iter.into_iter();
>>> +
>>> +        loop {
>>> +            let low_bound =3D match iter.size_hint() {
>>> +                // No more items expected, we can return.
>>> +                (0, Some(0)) =3D> break,
>>> +                // Possibly more items but not certain, tentatively ad=
d one.
>>> +                (0, _) =3D> 1,
>>> +                // More items pending, reserve space for the lower bou=
nd.
>>> +                (low_bound, _) =3D> low_bound,
>>> +            };
>>> +
>>> +            self.reserve(low_bound, flags)?;
>>> +
>>
>> I want to point out this might cause a behavior change, previously
>> extend_with() and extend_with_slice() do a "all-or-nothing" extension
>> depending on memory allocation, i.e. if there is enough memory for all
>> the new items, do the extension, otherwise do nothing. Your changes here
>> make it that extension can fail in-between due to AllocError, that is,
>> only part of the `iter` is added. Of course, in practice, both
>> slice::Iter and iter::Take will just return the number of all the items
>> as the low_bound of .size_hint(), but it's not guaranteed.
>
> That's a very valid point, and one of the reasons why I would like to
> see how the code is actually optimized in `extend_with` and
> `extend_with_slice`. While the method is designed to handle
> imprecise/incorrect implementations of `size_hint`, the expectation is
> that outside of very unusual uses the code should be able to be
> optimized into a single-allocation, non-loop pass.
>
> We could probably enforce that if we had access to `TrustedLen` or
> defined our own equivalent trait for the kernel. The set of iterators
> that could be passed as arguments would be more limited, but for the
> same reason as above I don't think that would be a big limitation.
>
>> I don't see a direct correct-or-wrong answer for what behavior is
>> desired, but if we are moving to a new behavior, we need to make sure
>> updating the document of the extend*() function. Plus if failing
>> in-between, should we return the `iter` so that users can continue do
>> something about the `iter`?
>
> I have updated the documentation with more details about the sub-optimal
> and error cases. I am not sure what use a caller would have from the
> remaining items - and after all, the currently existing methods also
> don't return the iterator upon failure. If we want to preserve the
> current behavior, we can always reduce the size of the vector to its
> pre-call value on the error path.

Err of course they don't have any iterator to return so that last point
is mostly moot, except maybe for `extend_with` which doesn't return the
passed value, which the caller hasn't necessarily kept a clone of.

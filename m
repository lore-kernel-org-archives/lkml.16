Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FB11F4199
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915826; cv=fail; b=h9fOyAtkROzcjBMCmlU3b15rxXhsGLm54fgOO2RXYXuUJTP2TXHJJIzhnDD/5h6UK5q8Zq2TdfzZvAllFWx1988+GbbLn4V+Bph/HPY9REZhjrwfuD48TdZoeqaLHpv5NQyS09X7RHodiTfIvebv0pmBnn9P2Z4dVdbmfB63HVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915826; c=relaxed/simple;
	bh=Tzj5AcXa4vGMJnPCwLW/a6lzA8uKBKK2a0xTL2jnibk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M4slFYmSCMOLsFByE5k+pQQI7PTcLhGrtF1qnkoA1A+EJB8qrdXwH7oPKSmN7T7u7HzWmeHk8CvzcxWjoJdsR6heCu3A9xBX5DM0YH6CcF8nmvT9ENzraF0zwOWly2201eDGihiyqD2r2Z6iSj604TkrvKJOZYHP6A7UDCi1KtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LqGuXwBv; arc=fail smtp.client-ip=40.107.237.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LqGuXwBv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkAVQ4NggDHqTOHlRc6MS29VhyhbFoLLiwly54kHYH13ZeDM/MvjVtlDbFfxbbEamlQW19HEVB9Ntv9B+VwyCkIJ3DDKOYamF8sHQaJAl4LeK52B86Vp2nN2xaggKMopNoVtsTW1rXJWnRKnWgPTh37auffc4hqSXbnzCGZM+lJ6PgjATpbi/rUOZ/uFj6M60U4u80oXaodE6WTZZAn5yfoXpC6ZsKWZXnyt8AI0NxRa70/v2CV/LIuJ3aeYQp79wlb/sM3TCVfMwh+9TLaZPjb/JCv/k8ayfXrCF1/33en7k7WXrs/M5xMRUaoA1TeNgIkiLj1pN8SamgRu6MRhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COBSHuENDKvPc33fvu+QwJVNOc4uwi45dKVIGogHdCo=;
 b=TavgGucBd/Z8B0mGOur2u+X8XWVQwLdeKfoT28HOnlN0wVW7uOJCrB0YPokhKdjrbls1iV9/P678iZ+cjr/alJtBUZS7MiSn+W5u6dX7xBRVGA2v0Bou4pplwSudkat0n8hFOdAHINVryD3mBbmCOmI1VxpaGsTp78Ki6ecuG92R3kJTgDTxaxBUGYgjG4vAYD+AyEumxzkk8ko/WNsth60tZkXut+Q5g9bfKxqOjHG4kPjVX1aFkxUr/dLnBYytc/dGVRoZx6Sy6z+t3lYMQTDXsQWzrAjObri5ck/hN0VitXsLZmAQIEzF3LyMpbadG8jZcgLolXRITkHfArH+3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COBSHuENDKvPc33fvu+QwJVNOc4uwi45dKVIGogHdCo=;
 b=LqGuXwBvlyXAW0EWUF3+7vlw3TPVuPUlgWc7BAgd3Fax/goYCuzkG115YTBki2maLmRKH12cL43ARm7/Ru5odCCGnnwHH7CCQHEbN1yJEIUNXRmSp/ELn/KRP2C2dLJiMBRxj9D1bZCcfT+CKbPjq+UTKtiX+f3ovUvRnRuJHws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by MW6PR12MB8705.namprd12.prod.outlook.com (2603:10b6:303:24c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 08:37:01 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%3]) with mapi id 15.20.8678.033; Tue, 29 Apr 2025
 08:37:00 +0000
Message-ID: <c71408b5-2ead-4408-83b3-dad30f153d2d@amd.com>
Date: Tue, 29 Apr 2025 10:36:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy-zynqmp: Postpone getting clock rate until actually
 needed
To: Mike Looijmans <mike.looijmans@topic.nl>, linux-phy@lists.infradead.org,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 "Katakam, Harini" <harini.katakam@amd.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.298e943d-5a80-491d-b36f-77b3b9a86df9@emailsignatures365.codetwo.com>
 <20250428063648.22034-1-mike.looijmans@topic.nl>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20250428063648.22034-1-mike.looijmans@topic.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0056.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::45) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|MW6PR12MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: 127e395d-90a4-4907-413a-08dd86f90243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWxFOUU5cmNrcFl0cVRtbktNNlo4QVBESU9Fa0FlUHRmbS8xMUhUZXNLdVQ1?=
 =?utf-8?B?Tldja0JGaUdQbUpkc212SlY3c0NaSEpFMUtSQS9uMS9QbmJJUm9YQjRxOExB?=
 =?utf-8?B?VmF6UGVaZXFFU3cxWVNRZDlIV3JnMlBHYnI4bEt3cXhBUlZqNUxkQmZwQlY2?=
 =?utf-8?B?clZRM2VIVnRiN3l4VzIrbm5RcHhhQTBRQnhpbkkxMHFHQlY4TkRkcTd6YzZo?=
 =?utf-8?B?c2VIZFhhOEN6NkdvTERzeEIxaXo4T2JkVUZMTnY5c0JjdEMzbHpQRVdhSU4v?=
 =?utf-8?B?aGNQUm9YWXlwY1JZYWYzdWt5MHNTMG9IUyt1dmJvRzA2OFB1Z203K2UrZXpn?=
 =?utf-8?B?WVBzVFpmcW5hRWc0K3ZZSEdEZGhIdnVwTVZvOENmcFFabEl4Yzh1Y0s2bXpm?=
 =?utf-8?B?bDVDZngzUGdqdFRnV0t1TGN3RzB4ZVNNS2h4YSt2NE13RlJpYThOUnlrQXJs?=
 =?utf-8?B?aTFKNjZQaTZXM2V0ZHZDNnZIeHd2NDBXTElwaG5FTjRWZytrL1BYVFpObzVH?=
 =?utf-8?B?MUc0Nm1DUDNJWCtack5BeE1HSWJ0M2taK0VyYXZxNFM5Tit1b0JpcUJEbnVy?=
 =?utf-8?B?L0JUVnBpRm5OWEJVYUVYTXJiQXJnUFk3dEVDK25QMkZHcXAxQVhuT2FVOVFB?=
 =?utf-8?B?WWQzdENjbGpSZElaa3BqbnAzVTQ4Ynpxamx4TW5GVkpCUVRLZHV4NWFDcC8y?=
 =?utf-8?B?bWJVY0xLSFdZODNaYjhhUWZjNzlEWUJCTjRFS0lJYTBuajU5UWtoaVJidlM2?=
 =?utf-8?B?Q1pCY3FLTTc4Qm56a1FNaHNydkwvMTlVbThjL3NsVjJzK1kwYlF0ZFJCRkRC?=
 =?utf-8?B?Nzg0WjRPODZ0OXN2TjRkTXAvQ0RkbjZwcGJkTDBxWWVsU1pZekJzVzlLemV1?=
 =?utf-8?B?RTIvSlpHVVoxUmw2Q2dTNktGZ0JtOWFSaGlCcUtqNzZiSGk1UWE1MjhJajI2?=
 =?utf-8?B?b3dweUpHRGtOS3VQWXBUUjhxZ1J4S1Vmb25oS3piQ1ZKSTFHOFd5eTlvUjBM?=
 =?utf-8?B?NEJrWmpHVXF4bWNlNE8vVTdiM0JQTFJydTNRSWtFOG42S0xCT2I3Q3IyRmR2?=
 =?utf-8?B?eGQxQjFFcEFoN3o4L3lqWFpPam5IZHBMNHdhOG9QVEQ2RWlHNHAwQ0tvRi95?=
 =?utf-8?B?Yk9JbklCNjJrNDlPMmlGZVpRNmN0eUJsYUZvYkhvQlFmYS9Cc1ZtWFlQZEJC?=
 =?utf-8?B?QnlsaFY1Wm5lc2V2YWN0ZUFzNGVjR2NsL0VrOEdRYXZvQzdkci9PUzhDaTM1?=
 =?utf-8?B?Nis4TWRiSEthQ1RTeWNScDBFZ3ZRT29adEd3Y1gwSE5xRkl3eUYwUVFVMzVE?=
 =?utf-8?B?V2Y3ZkF3WlVJa2FZR3d5WmJkUGdCUDlZZTVoRmxWc1NUd0YyTnFnaVZORitF?=
 =?utf-8?B?MUNvOVFwdEVxNVloYUdBRnBrRXhMRnp0T0JaMThnRjJZTWQza0ZrTWRZUU1r?=
 =?utf-8?B?VGNReTVuUzRCTWUzRS9kS3VpenZlWUU5S2pmQlFrYXZLTkM0WmxYUnBjZ2hi?=
 =?utf-8?B?Q3FuZVlzbzFobWp0MzlSTGZHd3pMK25jdUZxMFkwSDZxVDArMmVtZzlJZk9P?=
 =?utf-8?B?ZUN2ZEp0aVI0L21KekNPNVdpQm9TVkt2R1JsZ094VEd0d2pMWlVrSEg5eHFQ?=
 =?utf-8?B?QmpKaGw5NEN2QWE4WjloS1hNTkZLTzBicndpTk4wNnVNeWpZTFBFbHFTTkZi?=
 =?utf-8?B?YlVjSXJ1OEd3Qitva3pEd2ZlSmFQWk9xbjREMXJidUhVdjNrK0N0WDdzQStz?=
 =?utf-8?B?aUVWeFNRNnpXQkY4ZVBDL0hWVVlnSzZCdFZLdlNnK1FETHNrV0FzNldqL1ZD?=
 =?utf-8?B?em16eEdnRXZXZS9CdkdLcWE5S2o5RTYrUXBYS0FTcWFHZHRROUxoaVNPQk13?=
 =?utf-8?B?SS85NkFwSXJ1bEU1RER2QURNcnVtMFFxMUgveEFJYzJsejlGWjNCZlpBZ2Q5?=
 =?utf-8?Q?X3L2qi6NX5w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UENWYVN0NEFOZzBJeGNLVDE1aTU5Z2hGS3ltM0tPdUlOSzcwZDdmNGViNmdx?=
 =?utf-8?B?aWxRYnhncmpmdGJiUTBPSU5SOVUrZzBsWkdPT2Z6U0dWWklhUVdTNTJyRW9W?=
 =?utf-8?B?WWJNNjRzNzhtQ2ZZOVZXeWlzUzMxM29Qc0JxMC9kMUpqQklEc1JWQzFZdmhn?=
 =?utf-8?B?NFRKU3dsbUUzVGdubnFYM3ZmV1Bqb3FUTTNGOGdnYk1JK05tYXk0U2FuSzJK?=
 =?utf-8?B?amlsR000SFdvS01RMXYwSlNOR0ZiV2g3eGo4T0h0U2xyOUpTdWJhRVdJVE5C?=
 =?utf-8?B?cGdVWDNpL0hTdWx0QTB2Q1U3VHNsY2FEdExaejlscXIvbWdUQjFGelplQ2ZW?=
 =?utf-8?B?ejZGb2dRUFh3dE9Eejh0bFF2bC9oUkJBZ1hCU1owNjh0TTB2bStydjZsY3RY?=
 =?utf-8?B?VFZwOXgwdzlsbWQ0eUxWUmNNS1V0RFU5Sm5YTjR5THIzdE5VTFJkcDJqNS85?=
 =?utf-8?B?Z1IrUWxqL0xSU2lxRGJPajREbWdHRklCMnV5VGYrYWZhUlpmamtVUDRhbTNN?=
 =?utf-8?B?MXlZOFd6cmpzSnc1SXRlQlROQ0x4RTVtSzZHbVZIck83aUIyaVJyOFg3MVds?=
 =?utf-8?B?cUFtQjVRMDdaSWkwRlRtdHRzNkluMlZIYWVUTGxrUVozcStlTUVHMm00Qk91?=
 =?utf-8?B?NGlCMDl6SldCNEV5VUpKMDdWTHB2amZGZHd1dGJ0YjliaEdJMFZUTlVBcXFn?=
 =?utf-8?B?Zk4vNGxtaHcyUkZjVXJXVk9ZUlJRempoTlIyUUV6OEg2QjFOSm9SQW4zS2Q1?=
 =?utf-8?B?VGVXOXRFWGN6VU5lSGJtV1ZyMGF6ZGJCTVhLckNra3Y2aWhNY2pFRk5PcGFD?=
 =?utf-8?B?WHorNWxsUGEwZXZJdUJ2TThsd1BhRXJVNGVyaVhoZWIrQVFoQzhSajc0c0g2?=
 =?utf-8?B?YzdGMVVYQktmWGRKR3A5bmFLWDQzSXppM2UxV0tGWjZ0ZHY0SzBjOEVxdzhF?=
 =?utf-8?B?RTlrNCtGMExXVTZUa2F3WDFxUXh6UG14Syt0RUpDbDF3aHNMNVRCMndhNlh5?=
 =?utf-8?B?MU45YURhS0dkV3ZYQ3NmbUJ0UnNzSENHM2w4SEJHUXhVcnQ2dlplVkEyaFls?=
 =?utf-8?B?SHRqb2pISzRXVGlqUjAyYkpDYlJzYk85aDNIdjIrUUNnRm5MV2pEQVFQZHpw?=
 =?utf-8?B?Um5zY2xZcVc0YkJJajFoU3BlWWJOeDdDSTlocUs2c2FtNmVEeWZ6QmozZGZG?=
 =?utf-8?B?bzNhUjlKbVhlUndYanozSlRHVnk4VDgvWHBTQ05uYUhkQzBPSU5aY1ZudW8v?=
 =?utf-8?B?UXdodGRwZWtwQ2Zxckd6dkYzOUxMOEZQT1BYdzYrYkE5d0pyNXo1dytBcGQr?=
 =?utf-8?B?V1lHc3Ywd0hWaWpVQTlzcUMzSXhyaE8yQnQxWDdPOCs1a2FDc1FGeVdiM0Rh?=
 =?utf-8?B?SmhZeC81L0hhb2Y3ZWNNRW9wcVJhem1JTWhENDJNNmNnNWVuN25rMGtlbnBl?=
 =?utf-8?B?UlM5Z1R6U1lRUVdEeTI1NFJ6c0RpVTV1M3g4Nk0xSVluUGxFWVErZ3hMdG1i?=
 =?utf-8?B?SHI2VVV0Q1FXZ0lBUWM5aTBwb1hsL21WYUlzUTFrNlI3bzlWa3J1QStGekhB?=
 =?utf-8?B?V0VacDUrSlpRQloyZlNnMXh5WXFUZ3R6ZWdGdkVYWjlMQWRPbmRPU0RuQW1E?=
 =?utf-8?B?bG85bnV6aW0zM3hMb1FPNWdjU1NhQ2JnZVM5YzlJY0p3NVN4L3g3azJ5emdu?=
 =?utf-8?B?TU8wSkxma0hvUlVVMWVCcE9OVnN6MEMwNXlhTmljc2ZSNFhiVmhTNkZPelBp?=
 =?utf-8?B?bUtpR1lVYnlUZVJRNElHNkhDNXhVSU1Ndm9kVUJYaFQwK1IzZEZHNnE3YXpz?=
 =?utf-8?B?d040amtTaE1YTWt2bmV1bG1NOXpVYkZPYXZUS1JOaHc1VlVyNGhsOXc1TmxO?=
 =?utf-8?B?WFM2R3VhVTlmbWRIUVN2dy83TTBIRnpCMDBZdEhoclgyUkd0andDWkFOaURD?=
 =?utf-8?B?bEg1SWkwblAvNE9CNVNUbGZ1VGhSN2tJa25BSWNEWU5NZTQ5OEx2Z3VnL0h2?=
 =?utf-8?B?QlpuR2hadEJJQmVZR2dpb0xYWldBWVdjZzE5RnNoNXltR1p6ek5KZmJESUFE?=
 =?utf-8?B?bkxrTDEyVGdmTzRqeFRBRmM1d21BbHFOdFEzYUJadjl4d2xjQzM4L3pZSkRH?=
 =?utf-8?Q?te28vIEnqjL09taN16ZZN0323?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 127e395d-90a4-4907-413a-08dd86f90243
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 08:37:00.3155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUklHxQAr7gtvF5N+hrwycdSCWVwDONwb4dUaqruxIECG/BqbYoFbbCU8E++p2ad
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8705

+ Radhey, Harini

On 4/28/25 08:35, Mike Looijmans wrote:
> At probe time the driver would display the following error and abort:
>    xilinx-psgtr fd400000.phy: Invalid rate 0 for reference clock 0
> 
> At probe time, the associated GTR driver (e.g. SATA or PCIe) hasn't
> initialized the clock yet, so clk_get_rate() likely returns 0 if the clock
> is programmable. So this driver only works if the clock is fixed.
> 
> The PHY driver doesn't need to know the clock frequency at probe yet, so
> wait until the associated driver initializes the lane before requesting the
> clock rate setting.
> 
> In addition to allowing the driver to be used with programmable clocks,
> this also reduces the driver's runtime memory footprint by removing an
> array of pointers from struct xpsgtr_phy.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> 
> Changes in v2:
> Explain the issue and the fix better in the commit text
> Propagate errors (as reported by Laurent Pinchart)
> 
>   drivers/phy/xilinx/phy-zynqmp.c | 70 +++++++++++++++++----------------
>   1 file changed, 37 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
> index 05a4a59f7c40..fe6b4925d166 100644
> --- a/drivers/phy/xilinx/phy-zynqmp.c
> +++ b/drivers/phy/xilinx/phy-zynqmp.c
> @@ -222,7 +222,6 @@ struct xpsgtr_phy {
>    * @siou: siou base address
>    * @gtr_mutex: mutex for locking
>    * @phys: PHY lanes
> - * @refclk_sscs: spread spectrum settings for the reference clocks
>    * @clk: reference clocks
>    * @tx_term_fix: fix for GT issue
>    * @saved_icm_cfg0: stored value of ICM CFG0 register
> @@ -235,7 +234,6 @@ struct xpsgtr_dev {
>   	void __iomem *siou;
>   	struct mutex gtr_mutex; /* mutex for locking */
>   	struct xpsgtr_phy phys[NUM_LANES];
> -	const struct xpsgtr_ssc *refclk_sscs[NUM_LANES];
>   	struct clk *clk[NUM_LANES];
>   	bool tx_term_fix;
>   	unsigned int saved_icm_cfg0;
> @@ -398,13 +396,40 @@ static int xpsgtr_wait_pll_lock(struct phy *phy)
>   	return ret;
>   }
>   
> +/* Get the spread spectrum (SSC) settings for the reference clock rate */
> +static const struct xpsgtr_ssc *xpsgtr_find_sscs(struct xpsgtr_phy *gtr_phy)
> +{
> +	unsigned long rate;
> +	struct clk *clk;
> +	unsigned int i;
> +
> +	clk = gtr_phy->dev->clk[gtr_phy->refclk];
> +	rate = clk_get_rate(clk);
> +
> +	for (i = 0 ; i < ARRAY_SIZE(ssc_lookup); i++) {
> +		/* Allow an error of 100 ppm */
> +		unsigned long error = ssc_lookup[i].refclk_rate / 10000;
> +
> +		if (abs(rate - ssc_lookup[i].refclk_rate) < error)
> +			return &ssc_lookup[i];
> +	}
> +
> +	dev_err(gtr_phy->dev->dev, "Invalid rate %lu for reference clock %u\n",
> +		rate, gtr_phy->refclk);
> +
> +	return NULL;
> +}
> +
>   /* Configure PLL and spread-sprectrum clock. */
> -static void xpsgtr_configure_pll(struct xpsgtr_phy *gtr_phy)
> +static int xpsgtr_configure_pll(struct xpsgtr_phy *gtr_phy)
>   {
>   	const struct xpsgtr_ssc *ssc;
>   	u32 step_size;
>   
> -	ssc = gtr_phy->dev->refclk_sscs[gtr_phy->refclk];
> +	ssc = xpsgtr_find_sscs(gtr_phy);
> +	if (!ssc)
> +		return -EINVAL;
> +
>   	step_size = ssc->step_size;
>   
>   	xpsgtr_clr_set(gtr_phy->dev, PLL_REF_SEL(gtr_phy->lane),
> @@ -446,6 +471,8 @@ static void xpsgtr_configure_pll(struct xpsgtr_phy *gtr_phy)
>   	xpsgtr_clr_set_phy(gtr_phy, L0_PLL_SS_STEP_SIZE_3_MSB,
>   			   STEP_SIZE_3_MASK, (step_size & STEP_SIZE_3_MASK) |
>   			   FORCE_STEP_SIZE | FORCE_STEPS);
> +
> +	return 0;
>   }
>   
>   /* Configure the lane protocol. */
> @@ -658,7 +685,10 @@ static int xpsgtr_phy_init(struct phy *phy)
>   	 * Configure the PLL, the lane protocol, and perform protocol-specific
>   	 * initialization.
>   	 */
> -	xpsgtr_configure_pll(gtr_phy);
> +	ret = xpsgtr_configure_pll(gtr_phy);
> +	if (ret)
> +		goto out;
> +
>   	xpsgtr_lane_set_protocol(gtr_phy);
>   
>   	switch (gtr_phy->protocol) {
> @@ -823,8 +853,7 @@ static struct phy *xpsgtr_xlate(struct device *dev,
>   	}
>   
>   	refclk = args->args[3];
> -	if (refclk >= ARRAY_SIZE(gtr_dev->refclk_sscs) ||
> -	    !gtr_dev->refclk_sscs[refclk]) {
> +	if (refclk >= ARRAY_SIZE(gtr_dev->clk)) {
>   		dev_err(dev, "Invalid reference clock number %u\n", refclk);
>   		return ERR_PTR(-EINVAL);
>   	}
> @@ -928,9 +957,7 @@ static int xpsgtr_get_ref_clocks(struct xpsgtr_dev *gtr_dev)
>   {
>   	unsigned int refclk;
>   
> -	for (refclk = 0; refclk < ARRAY_SIZE(gtr_dev->refclk_sscs); ++refclk) {
> -		unsigned long rate;
> -		unsigned int i;
> +	for (refclk = 0; refclk < ARRAY_SIZE(gtr_dev->clk); ++refclk) {
>   		struct clk *clk;
>   		char name[8];
>   
> @@ -946,29 +973,6 @@ static int xpsgtr_get_ref_clocks(struct xpsgtr_dev *gtr_dev)
>   			continue;
>   
>   		gtr_dev->clk[refclk] = clk;
> -
> -		/*
> -		 * Get the spread spectrum (SSC) settings for the reference
> -		 * clock rate.
> -		 */
> -		rate = clk_get_rate(clk);
> -
> -		for (i = 0 ; i < ARRAY_SIZE(ssc_lookup); i++) {
> -			/* Allow an error of 100 ppm */
> -			unsigned long error = ssc_lookup[i].refclk_rate / 10000;
> -
> -			if (abs(rate - ssc_lookup[i].refclk_rate) < error) {
> -				gtr_dev->refclk_sscs[refclk] = &ssc_lookup[i];
> -				break;
> -			}
> -		}
> -
> -		if (i == ARRAY_SIZE(ssc_lookup)) {
> -			dev_err(gtr_dev->dev,
> -				"Invalid rate %lu for reference clock %u\n",
> -				rate, refclk);
> -			return -EINVAL;
> -		}
>   	}
>   
>   	return 0;

Sorry for delay.
Radhey/Harini: Please test this but I have read that code and changes looks good 
to me.

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal


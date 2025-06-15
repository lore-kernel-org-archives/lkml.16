Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECEDEEB1;
	Sun, 15 Jun 2025 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749991044; cv=fail; b=ldjzu3rtmt1zGOHQvdzALKf5aqqvV1VGRiUZi61GX1l3f4TW7/vkxzoHKvH+eaWaNumqX/fOvwbNYzcFyGstzb7+DqYHMbZUdcM4xckSEgqx7gHUHiSJu/xuCt9pm0fVJPiJW73ztOBt1qmMjsMdpCZHPapS4LSrRsxZu+dx32s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749991044; c=relaxed/simple;
	bh=HWnfkwtBr9/Su7e/FJ2vCmkELV89PT8VHNqeyaecX/8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=bNTSb53lgBhAi0Igpzy2rPQTCQXmSnPX3PaizmSxxlKgwqwclDmYzpV2sUSwYCQUeq+65A+RUk3//UjYTKQUmIhifsqUmzfuTlT8GXIahTpzhbC1CHFMyXuED9cVXrkdVqDpLOZA+7oc2T9s6lKsg9o+L203JcKnyotLL1xXrHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WPFcU908; arc=fail smtp.client-ip=40.107.223.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WPFcU908"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JU2ES1a1oqfWnq1jjWLx7gDqqip0kvh6jgaCo6Y0d9oZUdcZdPg9EWpYYSbhAOc5J0FS1emFLaKNB4/1Zlw3tifiGFzYIjJjwStOCknvGiD9VpQ21HDyioD+NfmPUysDbrIgXIAPy6Y/RBYm69AmVMgu4U8ZF6710x/iewYYWUDGCCcRlHzQRUqgVVnKIYH6pJQeIQO2cYSSjmFuLYaeGig8s9GTYhgE1IsA55P6VuzeiLfpRDl6ZyCunbfNrO2qwJ0zfR/Z2ea08yv/3Sk7HCLoU3y73b+LJ0Ea3xZa07aMMNUVHS/V4KkV5+bxbt3EDZgNt3XHC9a7Tv56MB7BjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ueo2+f1JQSrqsPq0GorOUEpUgWtM5pqtHwi/PM80Rj4=;
 b=yTSElAHTNuYjkFgT7dHUZcXD90yCIZze+Wc3oeRzB3gSC3nMqtrVgF1FAdqDCRsGt6JPw6jDSlI+WMeNHMbAlqTPoAmaU1VM/oOL12bSN/jKs7zoy+27GTW7x7pwqdFk1s62b2IIHPsnIVo828prG/IVXWUpMgayUfZxX0jn5J9ETrrnNaBYcsmxYso7X/7sirD4aqrnx/guPxd4vxQSe7xF70iXe9YOSsoGsw/rYELNjc/B/HjhD2dkSSsPNHUUDvfqKzTnCzmgj2eSucQT6dPz3E2C+XKs2d0j8S3GpMTEp9OLRyUITuO1hS3Vwo/6PFbQqxF+hWFpgkwoC6BqVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ueo2+f1JQSrqsPq0GorOUEpUgWtM5pqtHwi/PM80Rj4=;
 b=WPFcU9082nkaRPoGdGkRBMxtjujfuYHv1A6BrUUTctWXo70r73w0uNsr70WfCYfwPvGrAlHUE92RcrtXd6rGL3Igv8EyK8wjLQE9Al4YWITF1vjFuK2QM1ufD4s6scmDio1lwCfzWVN+JQkf3KuZKPJS2WxId3h422aSzOugoTot6KbeYV6HbOV5udjJ/9hxkaK+qrpZ9dJYPJ5JiwDzrBnMyFVUaVAuF9+eB7d2LEk0Y5Y5CdraGVwa2q/++BksSsImqfZr3shBu/Wfqo13Xnv5zUheqM3ticaqGuPLInSbHxf7aSHrPNe98g2+OzM3CDw2mlB4Euj77eidTfAxLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7278.namprd12.prod.outlook.com (2603:10b6:510:222::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.33; Sun, 15 Jun
 2025 12:37:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Sun, 15 Jun 2025
 12:37:19 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 0/4] rust: a few common Borrow/BorrowMut implementations
Date: Sun, 15 Jun 2025 21:37:08 +0900
Message-Id: <20250615-borrow_impls-v3-0-621736de7f29@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHS+TmgC/13MQQ6CMBCF4auQrq3ptECoK+9hjIF2KpMoJa2pG
 sLdLbhRlu8l/zexiIEwskMxsYCJIvkhD7UrmOnb4YqcbN5MClmJSgHvfAj+eaH7eIu8sQ6dcgZ
 RK5aTMaCj18qdznn3FB8+vFc9wfJ+oVpsoARccATTYlfKxnblcUhkqd0bf2eLlORPDWpTy1zXI
 AWCrhrQ+q+e5/kDqsDihecAAAA=
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
X-ClientProxiedBy: TYCP286CA0171.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: c60736ed-a016-4054-36ea-08ddac095e2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0lTTUpwamtoUVRVWWxNUXRENXErNnFNNm4zMXk1cEVTOXBqUVM1VU8xVlds?=
 =?utf-8?B?U3F4MHVwTGpnQ3FJUDdWRVF1aTNBdlJuUDJsM3JCRjVlUERVcE5PZmcvMXNy?=
 =?utf-8?B?OGhLSS92TTZjMFAxVWRHZ1ZDUXFPTFVtTVpjdWpWMHpKZjJQbk1Jbnp6SHNk?=
 =?utf-8?B?WWdDMmZTa2FkdzYvVXluYjZybWpTQ21FRGJTdXVOY3IraDExQy9peGhFRklI?=
 =?utf-8?B?Y1Z1K0YxYnBhSDljcXhJZVlJd1ZQWTZ3WFhrSHF6WW1YNWFZelI5aEs2Y3Zp?=
 =?utf-8?B?SXVLdjdqWHRMbGgweXVWRWJCbWhGMVhqUkVaTUloOTZZOGlTMFVHYXVpQnBY?=
 =?utf-8?B?VitETHNzWEJDVFYxTWhONWhtZ1dnNGdhTzhFM0dKR1pBNFFVcDJmL3pUN0w3?=
 =?utf-8?B?QWJXQ1JieVArOGlvQ1RhVk9hS3lGWkZwT0d1bGxSOXJpUEloSFUwaXVqK2JX?=
 =?utf-8?B?VlZLOXRZWitmczNsQlBxWUVvQ2l1aXM2RGpFNkJwa2F2M1pWUkFDNXBZOEJS?=
 =?utf-8?B?M3d0VDVoMDQwblpLQkxHbjlIaG9PRURjOWllRWgwbENHNEl5OERseGxEaWVC?=
 =?utf-8?B?bDVKbExsbExaSS94TGtlUCtuak5qVEdFYmpzUzFyN2tCYlhocWh4Y3htWkU2?=
 =?utf-8?B?MEsrbUgzQ0FGbXdmcGJIdkx2YTBKeHBxM0JVb2Z2VEtkWHU3SDJPK0Y0c2dx?=
 =?utf-8?B?NGFaUFdDWjZRdUJic210eEhHUHBsVkxvc1FVWnBIL3kwazkwWG4vdVlPVjFa?=
 =?utf-8?B?UThEbUtSZzJJVGtYNkcrTGt4U3BNZEhUL1huaURpRXhXTUlGRjM1QTJCU0M4?=
 =?utf-8?B?K1RKZG1xUS9qV2UwTWRsaW1TUnk0QzU4YUtLdUV4SDQvRHg1dERmUGhaMXFU?=
 =?utf-8?B?ajRaRk45TllrTXVsRGhVTER6TUZvNVVFZUs2Mk9HRVliYlRZay9DS0tvOEpo?=
 =?utf-8?B?NlozY05BT0w0QmQvNGdNR0xTemJlMDdwNmZSZlBMR0dlclF6bmNNaGlCZ21a?=
 =?utf-8?B?KzFuSDNSU3d4MjBidllLOW54OGNOUDFKK21rL0xFMEVMMHVDZHV4VDYweXo3?=
 =?utf-8?B?aDZFZEpZVTZrQnF6SFF4NjZOUWdtQUY3WUlFT2JYUzVMUmJzaUVveFpaTVdR?=
 =?utf-8?B?RjlqU2E2c0Y0dEF0UzR4blNZcDNwaXd4SDkzVGthaEdpZEZFNnVzVUlEbFph?=
 =?utf-8?B?aHN0dy9tVTNRL3lmbUpNNFh4QjRDTHRsZVg5Nm4yUFJ6WHhrU1lRV2Z4TTZa?=
 =?utf-8?B?NERpMi82MHc3ZVFJdlNjaE1GVTl6YVJpdFFvWXlNQldoKzVWSzdEUSs5alM3?=
 =?utf-8?B?QmZ6M0xRSW4yVzRaM01JcmptYkIrVmlhT0VicGpsV2tnUFpUY0xEeFhoRWpo?=
 =?utf-8?B?L1g0eW0wMElOTnJkOHBEWk9SNHRLeVpzaW1TT2p3QktybHVzcktqc3VvaWwz?=
 =?utf-8?B?cFBIeVR3Q0trZGgraXo1YklXUlV6U2E1SmVScm0wV3BNMGIzM3hCRmZOOENp?=
 =?utf-8?B?Q1RUYnBxVE82eUNjL1JIQW4vYVhzK0VVbVVzT2FLb1E3Z3o0SmNmMlRDVXVn?=
 =?utf-8?B?SlBYdjg0Z2ozWUFVZlg2M1B2VXNqZDVYQncvRDlnemtjdUdNQ2RnWFpxeTZW?=
 =?utf-8?B?elRnOUxGYmJCRjFGQWxiNUtlTmNZa3ZSYWVZMWZXQXgvWnhDYm1hZ08xbXpi?=
 =?utf-8?B?SUtwUXBEUEp5aEJMWHNIQWpoQUViK1hnWnlvR2c5cmEwQXJrZ0VxeDlDWW9w?=
 =?utf-8?B?NzFDMGVUMEV0NjMxN2R4NUlJNldFaXE3Y01Ick1FS3pIZWxEeG41WGVVbnpH?=
 =?utf-8?B?bmFpdjlJUm1hVndMM1RvNFp1Wm4yTFVZeCtJenZXNGtDTUl5ZHVEY1V6WUN2?=
 =?utf-8?B?dUZPSFBwallWTTB2WUpOK3lucTRtRjRmRW4yanB0QldTa3JYQ0NSdGZ4aHoy?=
 =?utf-8?B?MkxwYy9PS1NYU2g5YnphMU9LVUx3NXNSMlp3Q1dCeFI3dnNPbzE2eHVYS1hX?=
 =?utf-8?B?ZVhPZzM4Tmt3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm1xWTBzbEY5dW93QWswMlhJd3p2UXFHWU9qYmpGN1B4Z3dNcnhyN0ZLaEpw?=
 =?utf-8?B?Z3JKWi9pclJZa2ZOUnlYK25oNHhsUDNyZFdYcHVHTHJ3NDRWWnd6MEVaUWl4?=
 =?utf-8?B?NVFyak4weE1yWHBmdmYzc3BsVENXVG1iQUU4K1Z1dlNtZVBEc21kbmw4Qk5Y?=
 =?utf-8?B?R1N0LzNkeXhueEVZa0tzSnlURTZBMnRDM1grV1hidEpYNnk0YmwrVysxVEdF?=
 =?utf-8?B?Vmp6RWM5SkRmdUk2bnNhUDlnaENVekFOZU8vRnR0d2VIUVZQVURibkhjU1Q2?=
 =?utf-8?B?a3l0azY4aGRmWnp1d0dSUlVLZE9WYlM3ejVmQzJkdnlPZ3Fva3Jwcys3N1Uy?=
 =?utf-8?B?RFVMeklnN2hvYWYrYXo2TTZOVmZqTGpsMGwyUHZxUThFbk4rVzB2Z3N4NFps?=
 =?utf-8?B?MmdsWnMzbmZuNVhaRDZlNGNObFRvNDJvTGZjTGdOWDJyVjByRC9xVkk4cld3?=
 =?utf-8?B?M0NhVTNXdnBBRkY4b0x3aWlGZWN2SXhPRE4rc0pqWk54L1VCekVnZURNeDdq?=
 =?utf-8?B?MCtsNzV2K0lDMEIxY3YyeGVubVJXenFPWUNoU2FlY1ZMWVhYS2JYR1FNcE0y?=
 =?utf-8?B?YkhPQ3Bsd0wyT3MzTlNiZUZpNzFjTlJ4cVFkQTA3RUlNb0gxU1cwSW5raWVL?=
 =?utf-8?B?Wk1UYWNhNUZVSlBUaDRJSU1wNWdvd09zNkV2dUdDNmp4bkV3SUpsK2ZKTDVJ?=
 =?utf-8?B?NVFzaFo2WUR4OFBScUc3dkxSV3ljRWJtM0RNUVRFdklDN05sVG40QVRBZHV1?=
 =?utf-8?B?djRvSTdRNFRDdTgxaDREUlRNdUwrbjFpY3ZTc2d3N3plSTkzcVR0UDVTOERo?=
 =?utf-8?B?WVdRcGN6QmtMQ3owS1ZCK3FudmNtWEhhWkllOWZJN09yZTNtWVRtWVkrZkJC?=
 =?utf-8?B?WTN4aTFSSG1GemRDejFQZHY1ZjBQdHBDWWEvUEFwZkt2NkJ2OEswc2FaRHJS?=
 =?utf-8?B?bkc1N1R5UGdDdWJ3T0QvOEpBUDF4dEFWeUE3dWtGLzZVOXJWdmdiVnJYa3VX?=
 =?utf-8?B?WnVCRVZWY1VjYk51TGxBUktOWkNWYlAwNEpUQlpmMHEzZ3d2NCtJMU9BN0Fx?=
 =?utf-8?B?Z0R1amdzZDg3NXJTU1hsSVJ3RGF5ZnhDeXVFK1gyTVJZMHhnQzZsN2x3aUE4?=
 =?utf-8?B?eGI4bjR4dVlDT0V3K0xvL2lHdDBMUXJWSFRwaWUzYWdFT2twaCtzTHVDWGZq?=
 =?utf-8?B?NEVodU1Ub0pxREo0OVV5bklEY3RpUmlFaE9JQUpNaEZBWkx6dVFZOFFDY0Ry?=
 =?utf-8?B?SjhPVmRHVythL3FnUW53d1ErTk96M1Z0ZGZUcUJ6MFBmdmpMMWNzczRwNXZ6?=
 =?utf-8?B?VWdzWUwwZHIvZzFyUTZOSFRRYUpScFB3ek9jUHBQRWROa3NPdEhFdU5zeC9Q?=
 =?utf-8?B?K3p3SHlmY0NsRVZFbDJEdmVuR0xLdittdkhLTC9LRkZoWHZXVlYzZ0dXbFZP?=
 =?utf-8?B?aG1SdjJUMUIwSUNYSE9kRmJrYi9mYmg2czNBblBRUCtDT3ViOVQ5NTRSSEhT?=
 =?utf-8?B?ZmRwOVNQdGJkNnBzMnhPK3FZUEFrT0thMG00c1EvMHJVY0FVRUt3SFl4ZHZO?=
 =?utf-8?B?ZXRoZUdkbXY5b1hnb1F4WGNqK2ZYTVgvVDVuaG1QZU50OG9MY3NZS0VGUDRT?=
 =?utf-8?B?NVNaSHdIanJaQVcwQ2RUL2xqbVN3US9MWkpHaFRzMXdBRlR0bmcyRUNZMUJE?=
 =?utf-8?B?TXRsZFFBT1hOYjI4WGxaRTEyQlJoQjFnYUlHZDB6RWJkdWF0RDM4OEdnUFFM?=
 =?utf-8?B?dkNvREFQQldqUDd3ejhKbUNuWXdxeDUxbGE5V1phWm9uaENPckZGektPZk1O?=
 =?utf-8?B?Tk5LMDl0dGNHNWxqaEt6QmMraDFYcFZMbzVEdWk1N3dkMGgyWUwwZC9xcUFT?=
 =?utf-8?B?a0pMRGFUaHFDNE1FVEFhTnJkVjdUcVluM3NlSWRLMzlUTzYwOXlWL0NlSGto?=
 =?utf-8?B?Uml4azQrMGhCdkY3TnNFQUQxWU96WVVTeWkrbXNDbmNPYjBJVHlKcnJSLzFS?=
 =?utf-8?B?ek8wb01ZT0hJQ2RzZ1hzOFRDbG5BdVkzUnpzbTY3S0h6WG9nN25GQlM2b2hk?=
 =?utf-8?B?bXJ2a0dEeWZzWVl2VkgvZTJBT0E1NlE0NnE5YTRlSEtkdTBKc3o3cVR3KzVT?=
 =?utf-8?B?ajlieWlZa2EvdGpyVklHWTFjSGd3QXV0azJDQ1lTY1ZFdkErSldYQVNnSXE3?=
 =?utf-8?Q?3nVdTqK8ERquSbOrX/ixWyfeuFY/8e0ZwU+zLb0/P37u?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c60736ed-a016-4054-36ea-08ddac095e2a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 12:37:19.4329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIeEexscp/z62t8yy4z0JBAzEWmwVzQlHnxIKYtAsT1toWiCqoSGnEqPQ2j2gr43eR8S9TdQo657Nyf8/U1Y7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7278

The Borrow trait has multiple uses, one of them being to store either an
owned value or a reference to it inside a generic container. This series
adds these implementations for `Box`, `Arc`, `Vec`, and `CString`. I
came across the need for this while experimenting with the scatterlist
abstraction series [1].

This second revision adds examples to each impl block as requested. I am
personally not quite convinced that they are needed, as they just
illustrate the basic usage of `Borrow`, but have added them to this
revision so we can decide whether we want them or not.

[1] https://lore.kernel.org/rust-for-linux/DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v3:
- Remove undeeded first line of doccomments.
- Link to v2: https://lore.kernel.org/r/20250613-borrow_impls-v2-0-6120e1958199@nvidia.com

Changes in v2:
- Rebase on top of v6.16-rc1.
- Improve commit messages. (thanks Benno!)
- Add examples on each impl block.
- Link to v1: https://lore.kernel.org/r/20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com

---
Alexandre Courbot (4):
      rust: alloc: implement `Borrow` and `BorrowMut` for `Vec`
      rust: sync: implement `Borrow` and `BorrowMut` for `Arc` types
      rust: alloc: implement `Borrow` and `BorrowMut` for `KBox`
      rust: str: implement `Borrow` and `BorrowMut` for `CString`

 rust/kernel/alloc/kbox.rs | 57 ++++++++++++++++++++++++++++++++++
 rust/kernel/alloc/kvec.rs | 53 ++++++++++++++++++++++++++++++++
 rust/kernel/str.rs        | 45 +++++++++++++++++++++++++++
 rust/kernel/sync/arc.rs   | 78 ++++++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 232 insertions(+), 1 deletion(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250531-borrow_impls-8dfef3fcee93

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>


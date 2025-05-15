Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EAF25B1CE;
	Thu, 15 May 2025 06:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747289072; cv=fail; b=Yjwc2n1jTYvHxwVRKmLwurLFwKF6s5l91BmeDnkH2HT2LLoOkwrCKmW1fZPt4K1ERUIsZ0p6CjZ2UYcTvv45b3r3Rjsz665qCZvXGak/bhGGstD88m4xPYyQNR1VjTU7j4xaN0CSUCFTqaB9B1+kYP3iO4kUXy6kFzrkrMXnQAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747289072; c=relaxed/simple;
	bh=7iM8CKB2RgVAMfy/LW+g+lPLVgk3rb9VmP3dLmevQzs=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=ogat1FVIDZIMlDezCz+hyGeA08khGeAsM1YnfnLgOAyMAc7wPXk+qkXzvo0JjqT92RnHV+brij43hZbh74rtx5rfprY/KzToxHqUYkv7oNsdd1eT/2vw3GRFNd05OcNcVj1mC9yudVsnc33Vjh26+WLpNd4WIf8dnvnjUrekDvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rlKF5HA5; arc=fail smtp.client-ip=40.107.223.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rlKF5HA5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=de7v7pjTiZsm5YNuStnJbIF87oyNwoDPTKKRhRbUi/SDTGBD0t7+GJ/a6zw+GjQ4S6a3KkZNkDBWatN3lDG+LmmPLinIsdmoGgUxeOg83ujsAVSthgCtdq7kAit+xvJTisksMXh6FK3edX04KRaW8hz5PU1VNlMSWlbsHEAZltq955Bx+nF6ieI8WxHVpPq8RlR5fFEYfw//RhxmsXn9qRdRmiQGVwIh1PYbG8eweVwPmYYW3fWyPwqB017dKWKIanC39uSpdLeTXjjkKOAIM4UsjI1Pdj6m2VLKiPmpLKmGaUdKarS6E9LVpog1iQuNrzuFA3yleQQJJFwWirtYSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=945ErUxVYzTvd6wXLkqZdXYyXIvX/fjzKrVIKiGoroY=;
 b=gZaYX3y8dUoHC4EZXJm8lWdleCoqsE3vDdGrNaDXC9lMcd2AtQRcNUBD4Gjh6c0FS2MzXlsw73K+ZN4CNyu+LcuW7rT5mV2YhNaG7JvcRmDI4Pu0ArMuZRJKSJX8t1paiMhRJ0Bc5qmGaRuqK14opQQ3RZJGEYnR+mYFBh+SZp0IZwDZUQRYLUIqK29y05f6ve03U0RoO8qGn5c2Y7iPbVNsZBjjOmbTEz++jH8COYaUsqX7KuAyInpuxckIBZ9QUnTJnQKYHAZseW6P8U69LoYX2lMepAuny4tCXzPDtAYAXnhzVA7fDkNV/omSRYm/girq6OFvs5UhYWG2wigEWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=945ErUxVYzTvd6wXLkqZdXYyXIvX/fjzKrVIKiGoroY=;
 b=rlKF5HA5QAz8hPIoEby1mz0Y3YIWOJ9vDMWeAKWuPQkn6kYWOp7R7TGshmf2ljWfGfcGupqAZBPHC/ECXBmrbupHp2U/1jj9oCRg2KwZS23jq/Lk7256TAdRb6y3Je3wihswttqtfWW2nL5FLtCQDGav1RutXFuBarz1rx4XpSat2FhYOy1t+pN58BlaJmr1QYpdf3cixQCJih/GzjyyDku82NcDS0uCeApkufoy59oQx2ePomyziVhKaOVXu/sidBWv/Riycs0mp0DJfQWm61LQtwQFbmITztg/6SfqsmvEYjE++C0US+x5ujmGnNL01f5M/xmHPfK5XIocovyjtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB6937.namprd12.prod.outlook.com (2603:10b6:510:1bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Thu, 15 May
 2025 06:04:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 06:04:17 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 15 May 2025 15:03:51 +0900
Subject: [PATCH] rust: add basic ELF sections parser
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-elf-v1-1-4b53745453c0@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAMaDJWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0MT3dScNN0kyyRDszRTs5QUC0sloMqCotS0zAqwKdGxtbUAwxSb6VU
 AAAA=
X-Change-ID: 20250514-elf-b9b16f56dd89
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB6937:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d0a6d55-57ea-4096-898c-08dd93765356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXZPTmJueWVhR1BTZndrbU9NT3Facldzc0Q3a0dUczNqZTlIS21RRnBBY2Jr?=
 =?utf-8?B?TEsyemJDVkxjZ0dyZ0ZxbmgrQVkxdG03Rko3QnQ3WDNjaklSVXlOb04xU2kw?=
 =?utf-8?B?K3c2d09GMG4vcXpSVFVDTGJDL0dxM1VnS1ZHbm5xQ1hQUGl3MDVEYStLSWtG?=
 =?utf-8?B?M1UrNGtYQmlNMTFYWXgvZWRSd2ZyeU1JZzdpOHBxOVpOUEFQNytjbjhYNDdI?=
 =?utf-8?B?VS9JYzcvc3dWclhDVzR6bVl2U1N1b0dlWUtBL0RnWG5vS0FGVXgvWUo5NUZD?=
 =?utf-8?B?STJIYndreWF5akZBM2RmYnpiWGJkY3VZQjdab3NTMDMxZXIrMFhiV3FidDda?=
 =?utf-8?B?TEdSUEdOa3l2S0ZlZUlPVE50Q01FNnVzeHRsaXNJblpyU0p2WEJvNFVmZlBT?=
 =?utf-8?B?N2N0Y1dRRXg3R0lJc1lVQXNTblRnbXhxQ3VKUVJmU2pscFBsc013NThTQ2Y4?=
 =?utf-8?B?MS9oUjJKUFFTREZxY0dDM2R2VnozeGx5VFVseHlkR3V6SmxyRzBhWlI5aU8v?=
 =?utf-8?B?eUtJUHNXaXdyRGJXajhBZ2lPaXB6RzBZY21lWm1UQ2oxZkFMTzZZdWRzbUhs?=
 =?utf-8?B?eEpPOUJuZjZzdU5vK0luamlabHRQWlpnOWFNc1JHd2tIaTBjclp3U0ppek9Q?=
 =?utf-8?B?V3BsSklmQUR5d2F5ZmJVOTEvWjJOOFhUSmV6ZmlzMnhzTDRPUU1VbVRLMFJC?=
 =?utf-8?B?UTgxZ2pqZ2VoV3dkaEJvWUVGTFNDcHdlRlk4blgvVC9pVWZ6TTMvWGJEQzJL?=
 =?utf-8?B?UUE2S2MyOTFraGhzZThJVVdVMnhkZGJrYU5ncFZZWEUvNE92K3dPYitXaVNP?=
 =?utf-8?B?ZmY1UnBreXU3eUZBSnZmWlYrc0RCU1VPUmE0amhDcCt2cjBzcWxVMXZKMVVz?=
 =?utf-8?B?dzQ1eGxRWS9ueEUxMTlmY3FxbSt5WENWRXI0TXlXbnpMN0ttSXcwVUQ4NERo?=
 =?utf-8?B?QVJpc1lnNHBReHo4RHhtb0hlQ01pbjlGM1E3SytKamg0MUl3K3hqSk1vK0ZD?=
 =?utf-8?B?TVdhQklpSm5xTTR0ZjRvKzhYcEs5TG5LVGNvWWI4d21BRmJNTlEyV0p1SDcw?=
 =?utf-8?B?UitrdFVkcStZTStsVzV2Mnh4SlB3akR6akI5VEdyTUlqczJrNjZscUc5NFE2?=
 =?utf-8?B?K25ML2xwTTZNRDNVeFpGdDhhSm1qZ0FycDdhcVFFV1duTVM3d01MLzFrVzlU?=
 =?utf-8?B?bCtDYjJEcUI0OUNmM0RYYnRRdjFHaTM3TTQ4cXpTSnJ6LzAwMS93Yzc0WERu?=
 =?utf-8?B?Um9oSEVQNHBuVmxuU3k4dzBQeE9YVlZpdjBkRGcySmxFalVDZkVCUnhVRnN0?=
 =?utf-8?B?dHJwbXBKamxaWVRnZXU0Lzk0cldNZk4rTUZHd1BCZDZKbSt5K1orVVhndVRw?=
 =?utf-8?B?RjA5aEhVT3BRd2Qzdmd0bUFUbTQvaXJXbUdteW9YQkNkYmxYUVlWOTI3Q2pm?=
 =?utf-8?B?cXlsMkxBNXFZbnRaZzIxa0ZnVFVNUCt3MWlSdmhybHpLOXc3VFNZOXpvT2dG?=
 =?utf-8?B?UnQ2RFAvZkNKUWo2eE9rdFF1WTJaWHQvZmtpazVUV0dUUXFrQnVPVk5PRTBT?=
 =?utf-8?B?UGdCTVpLajc0MkY0MCtXNGdmNDdDK2tsUis3bDlDYmxKR2hLMVZvNlNVRDgx?=
 =?utf-8?B?ZitHMU5raEVueFdhcHNWWFdPbmpBT1IyRjBWK1B1WDhRSWVDWlo3OUVVMFdQ?=
 =?utf-8?B?c0ZaNThId0UzMkZ3VXZDK3k2NjRCZHNBVUlkaGtodGtFNXJFWkVkS3Y4QlBP?=
 =?utf-8?B?M0FhRDZRbW5RWG1OK1hyb0x6YU54VkZaU1pYQSt4Q2lFek5aNmV0S3Q5Kzlk?=
 =?utf-8?B?Z1pKTlUwYjNWdExiUFRDc01YTkdWMEthWmJ0VEt5L3BubDVqVWVjWW12VUlX?=
 =?utf-8?B?TmVvdkkyQ29qZHR5L0h4Yi9FL09ramJrZ25DSU5DaWg0OGkvNDExZWRPSkxG?=
 =?utf-8?B?YnBwVERJTlJSSmY3UWQvOUVHelVwQ2ZIVWdQcHNTaFJCbko0cmx4VlRESEN2?=
 =?utf-8?B?ZFNSV2p6Nkt3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkJqcUl4VlByVGNQcjc1dHp2aVM0ck9ickhmazA3cG8vM0liNzFreWFRUnpi?=
 =?utf-8?B?S0FUVm15aFhGYjVPbitzckFBbjJoaDFGdGFQTks3Q1VCWU03ekRnT0tvNVlB?=
 =?utf-8?B?blFDb0xrOWs5UkFBL0R3MFpyVjlTeCs3bm11RU05Mkppb3lBa1JyMzJ1V2VE?=
 =?utf-8?B?RkhwZDRLTW53Q1dEdzUwRmdqWUlIWE1hSDhBNS9HTWlMNjVURjRaM3dlSjkv?=
 =?utf-8?B?WFN1VWRBd0tTbnlPdWd1aVhIUnJoYk43S05xM3NTRThzTUhaTEwyWXc5ajZt?=
 =?utf-8?B?T3dvdFJsRHhGTlRrVXQ5YUs2RGRaNFZDbzRIUVZXMVBLT2dpZnU4ZEpZVlFh?=
 =?utf-8?B?bVZTSlhzRjE1QVVFVkp2TFlENWFjRU50djNLTXgwSW9aREpsazJFdnE4WW1q?=
 =?utf-8?B?dlBiWFNrUjRFQnNVRHZ0Z21qUFhIN3J1QnlPazIrMEJabXJRS0VieGZ6bVhv?=
 =?utf-8?B?enVjTHdsL2d4dE9CbmpvWmF4VmdXd2Iwb2lCUlZGeFlaKzIrYXAzMTVIVjU0?=
 =?utf-8?B?dXg3SHZCV0lJcitxdVJFUUtLVXhzOXdRNEhCKy9UREtVUWJMekt6enArdHNw?=
 =?utf-8?B?SzVXT0srb0k3VlBqMmovK2c2by9FSVJsc0hEOGpDQTc0dmRxQTNZN3Q2ZDhq?=
 =?utf-8?B?c1N2NDdTVzBINlFlNEFKSTYvNHRwZjZWNHhsbnE0Y1g5bi9aT3NFSG1nK0hL?=
 =?utf-8?B?Nk03MEZ4eXhLeVZkZXFvckxBa3RoVlMrdUd5U29FL1d2UWRtQkJCdmpzbGtp?=
 =?utf-8?B?QVdwUGJpNmdPOTdOUUM0bVg1eW5ES0dDUzE1Y2VwcjZaQWVXWm5sL1kyNkds?=
 =?utf-8?B?angyc2Q2bVZLK0lJanhBcVJLWTUza3VhMEJtUzhSb1dzMmdRMkh0QlNEK0RZ?=
 =?utf-8?B?ZTR0VHlwdGVvVkFHbmJOQ3dZVTE0UHVvQ05WZWFFZVNlcjFuaUVFYWhzR3VE?=
 =?utf-8?B?by93WFZ2MDI5Tnh4TnRJbmZDL2tzUFJPd2lnV3k1UVdPMForeFVneUprS0gv?=
 =?utf-8?B?cHJmdUxoWFMwQnUxc2JSZlNsbUJ2aVlWWFlWRXo0TEtwWlN6T2dyTWVmR3B5?=
 =?utf-8?B?d25yeWtYNWl6R013UGFsNXVwNE1Qcm5GclI4YWl5K1pwdjNMSlpoOXo3Tktl?=
 =?utf-8?B?SERIcFdDL2xnckkwKzZGdEk3djlOOEJIV2JFVGF6QUxMUEVyRHY1Vm9SRURW?=
 =?utf-8?B?VzFhZW9hQllBbHY3OGNqOXZOZ25FVDd1OWxva21HKzNlK01HNnhFQ1FWVG9X?=
 =?utf-8?B?bmJDQXZFdXp6a0V3L3B2SU9wMStFMkQrblZQSDhNTzZxTU9MY2U3RkJDSG1O?=
 =?utf-8?B?TjVjWlpiZWgxNEdONWpJd0VjV3NpUnFSc3ppckErRGxpUndEQklZd0Ztb2Rn?=
 =?utf-8?B?YklyM2JsSjBmR3lXMzNiRG05OHJGK0wxTDVwcG9uU2cxMEJiV0lYKzkyRHVm?=
 =?utf-8?B?TlZHeXVHNERHK2dSZWl5RDlJVm9aVTFza3ZOTXBZRHJzeWNybWlzeVdRWWpE?=
 =?utf-8?B?Z1gzVW9ROVVWRWlKS2FZSGc5UXJ2TG5ldGd3T0NlRGtFV3RrVDhvWU16UEE5?=
 =?utf-8?B?bWl3U2s4TCtkYTk3UE9jNjlpVWlXZUd6U1UxRTZSSGdIdDlnUnlvRW9OQ2hC?=
 =?utf-8?B?UXkzTFpQYit1ZVhiaEx5cUl1b0tUaFAxYmZzRFY1aU44NVd4UzR4Sk9EZFB4?=
 =?utf-8?B?SzQ1Mk5wdEp6aTJMRGltK3JncE1JQ1hheVZQY0o0U3BRbzM1OVNxNUFBNS9i?=
 =?utf-8?B?NVN4U0psUGg1a284eVpCejFLWGMxSnB5a1ZNSGtGZDlkYWZtL2VyNmpuekd4?=
 =?utf-8?B?RlJERG9xRFhoS08wRFFKVTFvUmJzek9lUThwM0lWL1FmTDJDYXBRNEREUDFo?=
 =?utf-8?B?SWhGdHd6VTJoUjQ0dHNsSXhOa0pVUk5HOHRxVmtNZFAxYmZQeDc2Zlh3K3ZR?=
 =?utf-8?B?WmdWRmFtWkpPWEVGc3l2N2NscE56SlBJY0tPWWZ2RmtldS93czR1NzhZVUxx?=
 =?utf-8?B?KytDN291cTFYbDRYUWZMek9ySjZ3N1ZPU245c2w5TVRHVTYrNGV5Q0xoSmdW?=
 =?utf-8?B?eUQ0WGlVT0I5T2p6OE9tbHN3WUd6QXdOVnQ5TXZYaWV0N1RDaWZ1d2R0d1dT?=
 =?utf-8?B?eUpVdVQ2V1IyMmdKT0Y0ZlJ3eDZLcW9tN3JiRjdIOXpmaWR0Vi9CSTZTb0pp?=
 =?utf-8?Q?mceWlnqPmDTii2WpFfpZlc0zZgKgF8yZxaV9lv+QoCIc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0a6d55-57ea-4096-898c-08dd93765356
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 06:04:17.2936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: raCJliqAC0YdhJITabIUzUgmtWK7hAapcaS8GAMlfMO1dY/sR119MWhsXbmMn8wuBfI46AcSgVAIcRwRhsgAgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6937

Add a simple ELF sections parser for unpacking loaded binaries from
user-space. This is not intended to become a fully-fledged ELF parser,
just a helper to parse firmwares packaged in that format.

This parser is notably helpful for NVIDIA's GSP firmware, which is
provided as an ELF binary using sections to separate the firmware code
to its other components like chipset-specific signatures.

Since the data source is likely to be user-space, checked arithmetic
operations and strict bound checking are used.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
This will soon be needed in order to load the GSP firmware in nova-core,
so sending this early for separate review.
---
 rust/kernel/elf.rs | 322 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs |   1 +
 2 files changed, 323 insertions(+)

diff --git a/rust/kernel/elf.rs b/rust/kernel/elf.rs
new file mode 100644
index 0000000000000000000000000000000000000000..c6af2f23a360a76992546532214fdc093522c797
--- /dev/null
+++ b/rust/kernel/elf.rs
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Simple ELF parser, useful for e.g. extracting relevant sections from loaded firmware.
+//!
+//! C headers: [`include/uapi/linux/elf.h`](srctree/include/uapi/linux/elf.h)
+
+use core::ops::Deref;
+
+use crate::bindings;
+use crate::prelude::*;
+use crate::transmute::FromBytes;
+
+/// Class of the ELF binary, i.e. 32 or 64 bits.
+#[derive(Debug, Clone, Copy, Eq, PartialEq)]
+#[repr(u32)]
+enum ElfClass {
+    Class32 = bindings::ELFCLASS32,
+    Class64 = bindings::ELFCLASS64,
+}
+
+impl ElfClass {
+    /// Validate and convert an `ELFCLASS*` u8 value.
+    fn from_u8(value: u8) -> Option<Self> {
+        match value as u32 {
+            bindings::ELFCLASS32 => Some(Self::Class32),
+            bindings::ELFCLASS64 => Some(Self::Class64),
+            _ => None,
+        }
+    }
+}
+
+/// ELF magic header.
+const ELF_MAGIC: [u8; 4] = [
+    bindings::ELFMAG0 as u8,
+    bindings::ELFMAG1,
+    bindings::ELFMAG2,
+    bindings::ELFMAG3,
+];
+
+/// Wraps the passed `inner` type into an `outer` newtype structure that implements [`FromBytes`]
+/// and derefs into its inner type.
+///
+/// This is intended for local use with ELF structures for which any byte stream is valid.
+///
+/// # Safety
+///
+/// `inner` must be a type that would implement [`FromBytes`] if the implementation rules allowed
+/// us to.
+///
+/// TODO: replace with FromBytes' own transmute method once it is available.
+macro_rules! frombytes_wrapper {
+    ($(struct $outer:ident{$inner:ty};)*) => {
+    $(
+        #[repr(transparent)]
+        #[derive(Clone, Copy)]
+        struct $outer($inner);
+        /// SAFETY: any set of values is a valid representation for this type.
+        unsafe impl FromBytes for $outer {}
+        impl Deref for $outer {
+            type Target = $inner;
+
+            fn deref(&self) -> &Self::Target {
+                &self.0
+            }
+        }
+    )*
+    };
+}
+
+frombytes_wrapper!(
+    struct Elf32Ehdr { bindings::Elf32_Ehdr };
+    struct Elf64Ehdr { bindings::Elf64_Ehdr };
+    struct Elf32Shdr { bindings::Elf32_Shdr };
+    struct Elf64Shdr { bindings::Elf64_Shdr };
+);
+
+/// Reinterprets a byte slice as a structure `T` and return a copy after validating its length.
+///
+/// TODO: replace with FromBytes' own transmute method once it is available.
+fn read_from_bytes<T: Copy + FromBytes>(data: &[u8]) -> Result<T> {
+    if core::mem::size_of::<T>() > data.len() {
+        Err(EINVAL)
+    } else {
+        // SAFETY: `data` is valid for reads and long enough to contain an instance of `T`.
+        Ok(unsafe { core::ptr::read_unaligned(data.as_ptr() as *const T) })
+    }
+}
+
+/// Converts a 32-bit section header to its 64-bit equivalent.
+impl From<Elf32Shdr> for Elf64Shdr {
+    fn from(shdr32: Elf32Shdr) -> Self {
+        Elf64Shdr(bindings::Elf64_Shdr {
+            sh_name: shdr32.sh_name,
+            sh_type: shdr32.sh_type,
+            sh_flags: shdr32.sh_flags as _,
+            sh_addr: shdr32.sh_addr as _,
+            sh_offset: shdr32.sh_offset as _,
+            sh_size: shdr32.sh_size as _,
+            sh_link: shdr32.sh_link,
+            sh_info: shdr32.sh_info,
+            sh_addralign: shdr32.sh_addralign as _,
+            sh_entsize: shdr32.sh_entsize as _,
+        })
+    }
+}
+
+/// Safely obtain a sub-slice from `data`.
+fn get_slice(data: &[u8], offset: usize, size: usize) -> Result<&[u8]> {
+    offset
+        .checked_add(size)
+        .and_then(|end| data.get(offset..end))
+        .ok_or(EOVERFLOW)
+}
+
+/// A sections Parser for an ELF binary presented as a bytes slice.
+///
+/// # Examples
+///
+/// ```no_run
+/// # fn no_run() -> Result<(), Error> {
+/// # let fw: [u8; 0] = [];
+/// use kernel::elf;
+///
+/// // Obtain the data from the `.fwimage` section:
+/// let parser = elf::Parser::new(&fw)?;
+/// let fwimage = parser.sections_iter()?
+///     .filter_map(Result::ok)
+///     .find(|section| section.name == ".fwimage")
+///     .map(|section| section.data)
+///     .ok_or(EINVAL)?;
+///
+/// # Ok(())
+/// # }
+/// ```
+pub struct Parser<'a> {
+    /// Content of the ELF binary.
+    data: &'a [u8],
+    /// Class of the ELF data (32 or 64 bits).
+    class: ElfClass,
+    /// Offset of the section header table.
+    shoff: u64,
+    /// Size in bytes of a section header table entry.
+    shentsize: u16,
+    /// Number of entries in the section header table.
+    shnum: u16,
+    /// Section header table index of the entry containing the section name string table.
+    shstrndx: u16,
+}
+
+impl<'a> Parser<'a> {
+    /// Creates a new parser from a bytes array containing an ELF file.
+    pub fn new(data: &'a [u8]) -> Result<Self> {
+        // Validate ELF magic number and class.
+        let class = data
+            .get(0..bindings::EI_NIDENT as usize)
+            .filter(|ident| {
+                ident[bindings::EI_MAG0 as usize..=bindings::EI_MAG3 as usize] == ELF_MAGIC
+            })
+            .and_then(|ident| ElfClass::from_u8(ident[bindings::EI_CLASS as usize]))
+            .ok_or(EINVAL)?;
+
+        // Read the appropriate ELF header (32 or 64 bit).
+        let (shoff, shnum, shentsize, shstrndx) = match class {
+            ElfClass::Class64 => {
+                let header = read_from_bytes::<Elf64Ehdr>(data)?;
+                (
+                    header.e_shoff,
+                    header.e_shnum,
+                    header.e_shentsize,
+                    header.e_shstrndx,
+                )
+            }
+            ElfClass::Class32 => {
+                let header = read_from_bytes::<Elf32Ehdr>(data)?;
+                (
+                    header.e_shoff as u64,
+                    header.e_shnum,
+                    header.e_shentsize,
+                    header.e_shstrndx,
+                )
+            }
+        };
+
+        Ok(Self {
+            data,
+            class,
+            shoff,
+            shentsize,
+            shnum,
+            shstrndx,
+        })
+    }
+
+    /// Returns the section header at `index`, normalized as a 64-bit header.
+    fn section_header(&self, index: u16) -> Result<Elf64Shdr> {
+        if index >= self.shnum {
+            return Err(EINVAL);
+        }
+
+        let offset = (index as u64)
+            .checked_mul(self.shentsize as u64)
+            .and_then(|r| r.checked_add(self.shoff))
+            .ok_or(EOVERFLOW)
+            .and_then(|offset| usize::try_from(offset).map_err(|_| EOVERFLOW))?;
+
+        let header_slice = self.data.get(offset..).ok_or(EINVAL)?;
+
+        match self.class {
+            ElfClass::Class64 => read_from_bytes::<Elf64Shdr>(header_slice),
+            ElfClass::Class32 => read_from_bytes::<Elf32Shdr>(header_slice).map(Into::into),
+        }
+    }
+
+    /// Retrieves the raw byte data of the section header string table.
+    fn string_table_data(&self) -> Result<&'a [u8]> {
+        let strtab_header = self.section_header(self.shstrndx)?;
+        if strtab_header.sh_type != bindings::SHT_STRTAB {
+            return Err(EINVAL);
+        }
+
+        let offset = usize::try_from(strtab_header.sh_offset).map_err(|_| EOVERFLOW)?;
+        let size = usize::try_from(strtab_header.sh_size).map_err(|_| EOVERFLOW)?;
+        get_slice(self.data, offset, size)
+    }
+
+    /// Looks up a section name in the string table.
+    fn section_name(&self, strtab: &'a [u8], name_offset: u32) -> Result<&'a str> {
+        let name_bytes_with_suffix = strtab.get(name_offset as usize..).ok_or(EINVAL)?;
+        let name_bytes = name_bytes_with_suffix
+            .split(|&c| c == 0)
+            .next()
+            .unwrap_or(&[]);
+        core::str::from_utf8(name_bytes).map_err(|_| EINVAL)
+    }
+
+    /// Returns an iterator over the sections.
+    pub fn sections_iter(&'a self) -> Result<SectionsIterator<'a>> {
+        let strtab_data = self.string_table_data()?;
+        Ok(SectionsIterator {
+            parser: self,
+            strtab_data,
+            current_index: 0,
+        })
+    }
+}
+
+/// Describes a single ELF section.
+pub struct Section<'a> {
+    /// Name of the section.
+    pub name: &'a str,
+    /// Type of the section (e.g., `SHT_PROGBITS`, `SHT_STRTAB`).
+    pub type_: u32,
+    /// Section flags (e.g., `SHF_ALLOC`, `SHF_EXECINSTR`).
+    pub flags: u64,
+    /// Virtual address of the section in memory.
+    pub addr: u64,
+    /// Byte slice containing the raw data of the section from the file.
+    pub data: &'a [u8],
+}
+
+/// An iterator over the sections of an ELF file.
+///
+/// Note that the [`Iterator::next`] method returns a [`Result`]. This is because a section header
+/// could be invalid, but the user still want to keep parsing the next sections.
+pub struct SectionsIterator<'a> {
+    parser: &'a Parser<'a>,
+    /// Slice to the string table data.
+    strtab_data: &'a [u8],
+    /// Index of the next section to be returned by the iterator.
+    current_index: u16,
+}
+
+impl<'a> Iterator for SectionsIterator<'a> {
+    type Item = Result<Section<'a>>;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        if self.current_index >= self.parser.shnum {
+            return None;
+        }
+
+        let index = self.current_index;
+        // This cannot overflow because we would have returned if `current_index` was equal to
+        // `shnum`, which is a representable `u16`,
+        self.current_index += 1;
+
+        // Skip the NULL section header (index 0).
+        if index == 0 {
+            return self.next();
+        }
+
+        let header = match self.parser.section_header(index) {
+            Ok(header) => header,
+            Err(e) => return Some(Err(e)),
+        };
+
+        let section_name = match self.parser.section_name(self.strtab_data, header.sh_name) {
+            Ok(name) => name,
+            Err(e) => return Some(Err(e)),
+        };
+
+        let section_data = if header.sh_type == bindings::SHT_NOBITS {
+            &self.parser.data[0..0]
+        } else {
+            match get_slice(
+                self.parser.data,
+                header.sh_offset as usize,
+                header.sh_size as usize,
+            ) {
+                Ok(slice) => slice,
+                Err(e) => return Some(Err(e)),
+            }
+        };
+
+        Some(Ok(Section {
+            name: section_name,
+            type_: header.sh_type,
+            flags: header.sh_flags,
+            addr: header.sh_addr,
+            data: section_data,
+        }))
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index ab0286857061d2de1be0279cbd2cd3490e5a48c3..5a9a780073b23d46e1ca70dd944826ee1c902bca 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -52,6 +52,7 @@
 pub mod driver;
 #[cfg(CONFIG_DRM = "y")]
 pub mod drm;
+pub mod elf;
 pub mod error;
 pub mod faux;
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]

---
base-commit: 61479ae38cb7bf6083de302598b7d491ec54168a
change-id: 20250514-elf-b9b16f56dd89

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>


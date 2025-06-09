Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB264C8E;
	Mon,  9 Jun 2025 20:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749500682; cv=fail; b=XyuXzdKF90ELQ7yscOruy/SHmNf1HpFQz2NnDmIGqTVCzFdXSgodNzmT3F7FTAKxtyWfimZCLH/OP81SnasQiuBuiy48xu7IOXzZko3aR/giWBTR0gmV600BoVEtZbOrFZh7FRO7wCc2HjRxZ7pqluphoJTKk1h17R7NjMBt7j8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749500682; c=relaxed/simple;
	bh=iy3DKvdOMMXZ5pFmIBewTNQ0NfkCKe77bSqe5SEkuIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UKZ4s0n6OIOZcBT7Pru1zKhU0+rU3OQg2ItTHAXONKsiuMf9r1LZO9tZu9GdOELD7tGIIKL1HnLelAHaKz0rIhOgzNlJ74gJZBvP+Rc8V9XEKvM6mjbYcPa1ou8IK/9TPyiAPFEEj/hoS8zdssvXh23vxbBNEG+LvErW/8TacaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g0e+uQA0; arc=fail smtp.client-ip=40.107.223.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g0e+uQA0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLw8S4EkGFdSpa2zKejTsINI5hEMXJQpEHAhAHObBvO1Sg1uRtWw7XdPBWnKQFPyEzpkYJxKeZKrqzjfxPczwYN0TkWx0IWs8UPWSX1BAvJdO5l29p/OqyBJGdUgD2xvza1kr4IekOS1vrNmfKDiUtHOZW1l+Z8nAsMcbuBLI+tb55cendEW25i+58XKU9A8fKb9Wcpiq9xbyMHN1hjQilxSuso5dzqGp1KSczT8Q3EPkA365JiRU0rperbNl4bhzHb7NeUyO2lVC+3YZ/DqOf6aH80gy13zi6J4cYDAWU72IT+t/akbfa7JoNC5vjTdW9JATqpRvAUjsc3SdPaBdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKUAVNoj8HY5tJ36sHouyLv88Xn8w4b33nxvF4gCP9Q=;
 b=rhWQMWY4WFPx0ctt3RIOJNiTaCysUOt+YbJRrdEEEkcn08IaCyGXa8OxqwLzm7Pfw2csjDVLTPCqx6bjwu6mK5visVK+nLwcVOXK1SloKKRzRDVexBU5urPrMHVYhIa5c6I6xSu2yIjzrQGrxqY7JlZpR5+MBiMFRs9jMXqr+HAnp19WlC6U6rXiiQHuTiFtaHNV7IxSpuUozBSs8Z+OJTkZb4pN9zgYS5Ck6pbLIjrObj1UlzEl6dc/zgwVLJON1Bp+KPQ8lNloEZ9SSDBheO2AvK+tp0enAOI19uhLVdWhe60ot9pFlgWgA2/4VkSnbOmfj+e2uoI/Gji+mf8gLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKUAVNoj8HY5tJ36sHouyLv88Xn8w4b33nxvF4gCP9Q=;
 b=g0e+uQA0ySH32LzS/rpTWa1DBoWP4JJ4rGBwNEFtbh87yURbQDzsmgqSZz7fzyhbyGALG6Pwxw51T3Qu6nn/pOGgT5m1nc32Lra/bITB9q8pIfym6FcqwK1BxkRhEnI8fh+KvMwA6TBC/FzWWjhKgYfQCQFNhLpDTO3y/XB1jJxcsCUfQUgnuW75X1bJ36SEnu1dgFxE3HyWRT7tKPbRBJNqjwZqAWUz/JQEgiX54IRzZ/mAr8b8kDLL4+twCzf9lWuhvnN3Z6r5/Us/XOOk1+Ri+fOqAYSrFEAxZzdgLCK/xhnp2qPNmGw8ALNkLJWXxCjK752vTPCQFgmY/xSQRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV8PR12MB9619.namprd12.prod.outlook.com (2603:10b6:408:2a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Mon, 9 Jun
 2025 20:24:36 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 20:24:36 +0000
From: Zi Yan <ziy@nvidia.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, david@redhat.com,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, hughd@google.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel-team@meta.com, Juan Yescas <jyescas@google.com>,
 Breno Leitao <leitao@debian.org>
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Date: Mon, 09 Jun 2025 16:24:33 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <D3992D01-63C9-42A2-A0C4-0A119AAC1BE2@nvidia.com>
In-Reply-To: <35c82f60-0090-4d23-bb83-9898393cf928@gmail.com>
References: <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
 <b807deec-99a9-4691-9001-c2f3adf586b9@gmail.com>
 <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
 <c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com>
 <18BEDC9A-77D2-4E9B-BF5A-90F7C789D535@nvidia.com>
 <5bd47006-a38f-4451-8a74-467ddc5f61e1@gmail.com>
 <0a746461-16f3-4cfb-b1a0-5146c808e354@lucifer.local>
 <B2F966F0-8F5F-43AB-BA33-BD3E65504F4F@nvidia.com>
 <61da7d25-f115-4be3-a09f-7696efe7f0ec@lucifer.local>
 <AA2C4D68-B1DC-48A6-A807-56516067B9C7@nvidia.com>
 <f980e652-8e2a-41da-af9b-39fdd439fefc@lucifer.local>
 <2338896F-7F86-4F5A-A3CC-D14459B8F227@nvidia.com>
 <35c82f60-0090-4d23-bb83-9898393cf928@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:c0::30) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV8PR12MB9619:EE_
X-MS-Office365-Filtering-Correlation-Id: fc0d759b-3be5-4369-1fc0-08dda793a701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUpYQzFCRUJxa1N1UUpCeTZMTUE0NWNuZitCSWZZZGk2dTY4Y3FoSlRwTU1j?=
 =?utf-8?B?bkd2eE5LZHlkMDZkNzJ1dEdYc3ZEdGRGK3hSU3VmUmxORG5mLzRBWnJGZWxz?=
 =?utf-8?B?ZVhRY1doNzZnMGFKeGZXNUpWV1FHQmhUVnRlZmk0T1A3WTVtdzFTUVZ3dXB2?=
 =?utf-8?B?YjJsUmRYYUpTMUF5Z0R1SjRSNS82QStxSDJqdXdvdDI5M2ZmSThHYmxCSExa?=
 =?utf-8?B?MUtqWW9uNncrNWFMTW9IaktmWldxK1cyV1dodEhpUml4Vy81RUFKNU5jYmhT?=
 =?utf-8?B?dUZXZFVuNmRpZzM5MEVjdkRlbElaMktZckVDZW5KRmhFUy9PRitmcXpaY25Z?=
 =?utf-8?B?czZybEkxTCt6aUROUmFESW5mczlBME93MVpiVmhSSHgxU09mbTdlbWNqdGVC?=
 =?utf-8?B?ZjZhZENPdXlmL283VzFKZGU4Zm5YZG9RUDNxa1dZZ3ZDYXpBMnplVFNiMU4r?=
 =?utf-8?B?RWh6Y0hnbnlzUk9xc0M1UWdRZEVGU0JmM0pNakEwaEVuWjdPY2o5Z1RTK0tC?=
 =?utf-8?B?U0diakpreUlZTUZkYmNJZW5FdDZtVWM2YzdqRmJnQ0Fob3pWY29EME1IU2cw?=
 =?utf-8?B?VGVUWkJjYWkzcFNDSGR3aDh4MUlRbGtTQ1FjcStWaGFLYUNuTW5jaFRTeFd3?=
 =?utf-8?B?OUJXalZ5T2FEY0dDK0RnTzhyd21XdEs1a1FaaXpIUUhraFRMYjZZaVJoZUxL?=
 =?utf-8?B?RG4ya1hYci8vRTNhWEFnZlhaNDlidjMzTG0xK1ZSTnlXVFRhODgrZjBVU1Fs?=
 =?utf-8?B?ak9XNXBhTG83c1JUdGNUZ2VTaG03Wml5UEJzeTZHMWl0U1FNQTN0V0RKelBH?=
 =?utf-8?B?L2Mxdnh6VHUxTTd2OVIwTTZscEprbWJBTGZvMVM0eUR4M1FqZ2E4ZEg2TVdR?=
 =?utf-8?B?REgwVFdDQ3NzSW9lajB3UU1UNlZ2ajZMa0lDdGJaVkpndWE5ZTN0VEdEckhu?=
 =?utf-8?B?cjl3bVZZbCtJTFZ3dFMwN0cyMU1vSndmMGVMVExWWDVmMkQwWlRjejJRbDJi?=
 =?utf-8?B?UGVaZlZpYXF6cDRBV0daakg1Zml6T1FsVjdCRVpkN0N5NUdIc0x2emFaZExK?=
 =?utf-8?B?V3BDOGR1bEdkTjZ4RUljUG1wUVphWGpOanU0SGJSQnF1TUgxZE5aY25DS0E2?=
 =?utf-8?B?NkluV2V1eXp1d0JiZ1lTTEQ1YzJVUjlWUjJxbkw0RjZwWmZCS3lINlBwWFZq?=
 =?utf-8?B?L3doZks1R2dVT1JVRzMrWThFZE5peFZ2aU1EUFhBZ0FMalZpcVBaUUthNVk5?=
 =?utf-8?B?dk1oUEJ2ekhLVmZ2ZU5ERkdxTkRLWVM0RlVxOUlkeU9NZVVjRWdKUzM4d3FO?=
 =?utf-8?B?em5IcnBFZmNQSll4QVNWS2krTDFwK29pdXc1QXJhc0ZpR1RLNXBJZkkxKy8r?=
 =?utf-8?B?OXI0MFE3YWU4ZG5sUVJyMmMzNkV6cGhtSWs3aVdnNEUybEkyZ2JxdDJmay9L?=
 =?utf-8?B?TjFleVkxOUN6N2FhL2FxVlFuRUo3eW85WmdvWVlTM1psU1diSk1hNXdEWnY0?=
 =?utf-8?B?Z2lTU1RSZUZ4aC8vNTRvcmx1cmZMRlF2QXp0bWIreEFOcDJyWTBRMmlnOXI5?=
 =?utf-8?B?REl3MXoyN0hjdGw5RTd4TDlsWWVZWnU3RDZKdDJUOERJeXRhUnBwZkJLYW9S?=
 =?utf-8?B?cTh1QVNCUmcxZ2tUQWhNZHVIQWwxS3hFTGtTZys0bEp6eDNJRHNqWjZqazdz?=
 =?utf-8?B?cjN4WE56S0hSbTE1cnFmU2hlNXdPdGt3a016VGVxU1JtVFF0b0NFOXN2alBk?=
 =?utf-8?B?aXBsaDNnd0JtY05QZS9PN2d1UnZ5VVN5aW1YMmtmcGY4QkdSRWhlMkp3L282?=
 =?utf-8?B?TUN2WWw3MEtiVzdaVHdnd25iNjFjUnVZd2NKZyt4eGZQb2szRnJ6YlhrZERL?=
 =?utf-8?B?ZG41N2tZb0cybElIZ2FEV044ZUZkcW8wT2pqV1c3TlVseUZKcmZHMHVDK3V3?=
 =?utf-8?Q?E0O8bFWymaQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnJyWEZLc3lGcWZJdzA3QW8xbW5udXp1TG5ZYzVCb3ZMMnRYT0JqY2hlcVRX?=
 =?utf-8?B?YURLeENsMUhkcC91UkhtMHdsWXhwZWxIUXlJSTNYOXBRYmRodTlTRGlIdzZ2?=
 =?utf-8?B?ZTdyemUvZXdSOVYyOHYyRUFZNWpOektqNXRnMGNlNC9HZUMvVEhCL1lzM2th?=
 =?utf-8?B?L1hoNFhlZjV5bmNzWFpYa2kzVGl4WlN3amMzQ0crRGFnbksvTjJMQ2tTMEpl?=
 =?utf-8?B?QjZtSEVGUVdlQk1sMXBPbHVoQ3Q2MWtFandZWXBNTjZnbTRUV25YNXl4b1Jn?=
 =?utf-8?B?N29uekpaK1U0Y0lGaWpZL1ZKTGRjMnlzSm1qSVVFbm1RNUN4ODB5L05EdkhP?=
 =?utf-8?B?ZmY4VGNiVGIrVXVHVWQranNTNlJUNytiNEk1dGdBb2cxdkF0LzExL2IzdnZZ?=
 =?utf-8?B?Z1R1Q3BuMmlLSTBiUGxOeHF1YjBpQk1Qc3NoSTM2ajRMdzMrVGlCaHl6QXF4?=
 =?utf-8?B?aSs4bnZSOHQrR2E3MnRrMlJVcUZsZUZ3UFpZYzhvSjhKOUNZbXR3RGdFb1Jm?=
 =?utf-8?B?Qjd4ZnpTdThtbUIzcUYvb2xXdk9RU01tZmRseDV1cDJvd3NPWENkNWd4dkNu?=
 =?utf-8?B?bUNSdGxYWHY0aFhXb2cvTksrZUE3SFdwOEh2YW8vS0l6eSt4Q2hmWGh0S3lN?=
 =?utf-8?B?aUFuWktoU1dhbmsycDFqMHZOK2ozek5DSUJzcUdRbDllbkllSjd5ZDJwSFh6?=
 =?utf-8?B?Uk43Qi9RQndzUVIxcXRLdlViTXhQNzlLaUdMRk5ia0w2bTNrdmFPdGxlTzdQ?=
 =?utf-8?B?VWFLbkxUakVpNHlVV2JFUnFaUHRaS3hXOTYzYURDeWdueVBCajhOVUpta2pI?=
 =?utf-8?B?T1I5ZXEvbXZEaDZxVm1NWnhnQmRRUnNObFFnM29QV3J0WjVsMHkraGNWWE1L?=
 =?utf-8?B?d0N6UHRWeUVsajYwUG9xNVF4QlFyekxkaVJyczIxd0MyN2h0YTlYTzhQSlhG?=
 =?utf-8?B?eDdyU2k1SDBhRngxVEtXaGZOeC8yUUFmSjdvT0dhdllQekpCMmR0WEk5NWd0?=
 =?utf-8?B?djlXd3BuVjlUTDRDUmZxS203MXNRck1SNmZ2MXZQVE1qREJlT2FHMU9rSC9Y?=
 =?utf-8?B?VmtrMXU0dXVNWWxXY1daSUZpU1RTQTd3TEV6M1Npd0NhaTFDa2NmaHJxZXU1?=
 =?utf-8?B?Z2V4SHlVU2trMWI4TXNCVkIydFh0OTdiWEh6dkdZMStjVGk3U1hab202MS90?=
 =?utf-8?B?UzFGZGVWQlhUVnhMUnQzYk5zVXhteVQzbjNONjBmcWcvTjAzV3lpSkVsTHVS?=
 =?utf-8?B?TjZkVVBCVWdTamxQVzFXNlF4WW5TY25Yeno4K3NBNzlybnhRMkpCU0hTUEZk?=
 =?utf-8?B?ZlNKLzNaRnV3SjhXYURDQTljczl3aURtWW1UMWRsZTRCOEZ3dkE3VWdMMzA3?=
 =?utf-8?B?STFJZ216VHIwSUpqMDRxdVhWcjdaRW9wbXIxYXdOZ2tvZCtVV2cwYlNQc1Fi?=
 =?utf-8?B?UElNditWOHpyeVhtVXZKdld5cWx4ckk5L1RST3BiUHJQeE9Ba0lYZW5YckRI?=
 =?utf-8?B?Q1dTNEZBV0g1UExLdWF2YjZWUGtaQ1ZuLzFaM2NlYVFIUzMvdlltWFJhMzBr?=
 =?utf-8?B?VU14KzUyQmhNT21QSVprdkl5U1hCMnMyMU5XbnRzeG03eVowMUZiWVRXb2Zx?=
 =?utf-8?B?V3RWL3pBT3BLWmc5NW9NTmtwZ3BIREZTY0RLbGY1OGVxUGlGSGljcDg0VHlu?=
 =?utf-8?B?ZGNXZERKN25NY1hjTFZESG9xS3l4TzF5UjZ0d0Q3V0puSUduTEFJV0ZuWEpR?=
 =?utf-8?B?K0tjRGxYanNaVlVRZDY1S3ZqSGxrYmovTGxMOGdKUWdRUkNrZ3QrN2lXbkVS?=
 =?utf-8?B?WUxsUGEveG5oZzlnQVJNMnFRMHVCZC92Wm1ZdEM5OCszNGd3YURwTEJGQVRy?=
 =?utf-8?B?OXFRU1d3NHNUamVwZWxLLzFjQ0o3VzVGbjg2SytKbWdobENuS2N1akVOenR0?=
 =?utf-8?B?bVN3Q1dkcWZkS3NnZDlCNGJ2UUpDbGNMbGVtNlZBY28zR3RDRG91bTh0djc0?=
 =?utf-8?B?UmE5eGZOcGxnelFPcCtHSHFLRENjNHhiMUkvTFBaVzNoSzhCREUwSHNveHBi?=
 =?utf-8?B?elFSVmVtRmE1WDhkL2lod0lFVlBzbm92cEcrYmg3cnNPSnhPVGR3NzBXOSsx?=
 =?utf-8?Q?ivDzGzDyHnsdyMww8CkFyaHAD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0d759b-3be5-4369-1fc0-08dda793a701
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 20:24:36.1482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HC3ylYf5mM2fUNHZN5gU000mN4eiHgai4yBBkZi04ZGvBcG3lall3uUtf24AefYx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9619

On 9 Jun 2025, at 16:03, Usama Arif wrote:

> On 09/06/2025 20:49, Zi Yan wrote:
>> On 9 Jun 2025, at 15:40, Lorenzo Stoakes wrote:
>>
>>> On Mon, Jun 09, 2025 at 11:20:04AM -0400, Zi Yan wrote:
>>>> On 9 Jun 2025, at 10:50, Lorenzo Stoakes wrote:
>>>>
>>>>> On Mon, Jun 09, 2025 at 10:37:26AM -0400, Zi Yan wrote:
>>>>>> On 9 Jun 2025, at 10:16, Lorenzo Stoakes wrote:
>>>>>>
>>>>>>> On Mon, Jun 09, 2025 at 03:11:27PM +0100, Usama Arif wrote:
>>>>>
>>>>> [snip]
>>>>>
>>>>>>>> So I guess the question is what should be the next step? The follo=
wing has been discussed:
>>>>>>>>
>>>>>>>> - Changing pageblock_order at runtime: This seems unreasonable aft=
er Zi's explanation above
>>>>>>>>   and might have unintended consequences if done at runtime, so a =
no go?
>>>>>>>> - Decouple only watermark calculation and defrag granularity from =
pageblock order (also from Zi).
>>>>>>>>   The decoupling can be done separately. Watermark calculation can=
 be decoupled using the
>>>>>>>>   approach taken in this RFC. Although max order used by pagecache=
 needs to be addressed.
>>>>>>>>
>>>>>>>
>>>>>>> I need to catch up with the thread (workload crazy atm), but why is=
n't it
>>>>>>> feasible to simply statically adjust the pageblock size?
>>>>>>>
>>>>>>> The whole point of 'defragmentation' is to _heuristically_ make it =
less
>>>>>>> likely there'll be fragmentation when requesting page blocks.
>>>>>>>
>>>>>>> And the watermark code is explicitly about providing reserves at a
>>>>>>> _pageblock granularity_.
>>>>>>>
>>>>>>> Why would we want to 'defragment' to 512MB physically contiguous ch=
unks
>>>>>>> that we rarely use?
>>>>>>>
>>>>>>> Since it's all heuristic, it seems reasonable to me to cap it at a =
sensible
>>>>>>> level no?
>>>>>>
>>>>>> What is a sensible level? 2MB is a good starting point. If we cap pa=
geblock
>>>>>> at 2MB, everyone should be happy at the moment. But if one user want=
s to
>>>>>> allocate 4MB mTHP, they will most likely fail miserably, because pag=
eblock
>>>>>> is 2MB, kernel is OK to have a 2MB MIGRATE_MOVABLE pageblock next to=
 a 2MB
>>>>>> MGIRATE_UNMOVABLE one, making defragmenting 4MB an impossible job.
>>>>>>
>>>>>> Defragmentation has two components: 1) pageblock, which has migratet=
ypes
>>>>>> to prevent mixing movable and unmovable pages, as a single unmovable=
 page
>>>>>> blocks large free pages from being created; 2) memory compaction gra=
nularity,
>>>>>> which is the actual work to move pages around and form a large free =
pages.
>>>>>> Currently, kernel assumes pageblock size =3D defragmentation granula=
rity,
>>>>>> but in reality, as long as pageblock size >=3D defragmentation granu=
larity,
>>>>>> memory compaction would still work, but not the other way around. So=
 we
>>>>>> need to choose pageblock size carefully to not break memory compacti=
on.
>>>>>
>>>>> OK I get it - the issue is that compaction itself operations at a pag=
eblock
>>>>> granularity, and once you get so fragmented that compaction is critic=
al to
>>>>> defragmentation, you are stuck if the pageblock is not big enough.
>>>>
>>>> Right.
>>>>
>>>>>
>>>>> Thing is, 512MB pageblock size for compaction seems insanely ineffici=
ent in
>>>>> itself, and if we're complaining about issues with unavailable reserv=
ed
>>>>> memory due to crazy PMD size, surely one will encounter the compactio=
n
>>>>> process simply failing to succeed/taking forever/causing issues with
>>>>> reclaim/higher order folio allocation.
>>>>
>>>> Yep. Initially, we probably never thought PMD THP would be as large as
>>>> 512MB.
>>>
>>> Of course, such is the 'organic' nature of kernel development :)
>>>
>>>>
>>>>>
>>>>> I mean, I don't really know the compaction code _at all_ (ran out of =
time
>>>>> to cover in book ;), but is it all or-nothing? Does it grab a pageblo=
ck or
>>>>> gives up?
>>>>
>>>> compaction works on one pageblock at a time, trying to migrate in-use =
pages
>>>> within the pageblock away to create a free page for THP allocation.
>>>> It assumes PMD THP size is equal to pageblock size. It will keep worki=
ng
>>>> until a PMD THP size free page is created. This is a very high level
>>>> description, omitting a lot of details like how to avoid excessive com=
paction
>>>> work, how to reduce compaction latency.
>>>
>>> Yeah this matches my assumptions.
>>>
>>>>
>>>>>
>>>>> Because it strikes me that a crazy pageblock size would cause really
>>>>> serious system issues on that basis alone if that's the case.
>>>>>
>>>>> And again this leads me back to thinking it should just be the page b=
lock
>>>>> size _as a whole_ that should be adjusted.
>>>>>
>>>>> Keep in mind a user can literally reduce the page block size already =
via
>>>>> CONFIG_PAGE_BLOCK_MAX_ORDER.
>>>>>
>>>>> To me it seems that we should cap it at the highest _reasonable_ mTHP=
 size
>>>>> you can get on a 64KB (i.e. maximum right? RIGHT? :P) base page size
>>>>> system.
>>>>>
>>>>> That way, people _can still get_ super huge PMD sized huge folios up =
to the
>>>>> point of fragmentation.
>>>>>
>>>>> If we do reduce things this way we should give a config option to all=
ow
>>>>> users who truly want collosal PMD sizes with associated
>>>>> watermarks/compaction to be able to still have it.
>>>>>
>>>>> CONFIG_PAGE_BLOCK_HARD_LIMIT_MB or something?
>>>>
>>>> I agree with capping pageblock size at a highest reasonable mTHP size.
>>>> In case there is some user relying on this huge PMD THP, making
>>>> pageblock a boot time variable might be a little better, since
>>>> they do not need to recompile the kernel for their need, assuming
>>>> distros will pick something like 2MB as the default pageblock size.
>>>
>>> Right, this seems sensible, as long as we set a _default_ that limits t=
o
>>> whatever it would be, 2MB or such.
>>>
>>> I don't think it's unreasonable to make that change since this 512 MB t=
hing
>>> is so entirely unexpected and unusual.
>>>
>>> I think Usama said it would be a pain it working this way if it had to =
be
>>> explicitly set as a boot time variable without defaulting like this.
>>>
>>>>
>>>>>
>>>>> I also question this de-coupling in general (I may be missing somethi=
g
>>>>> however!) - the watermark code _very explicitly_ refers to providing
>>>>> _pageblocks_ in order to ensure _defragmentation_ right?
>>>>
>>>> Yes. Since without enough free memory (bigger than a PMD THP),
>>>> memory compaction will just do useless work.
>>>
>>> Yeah right, so this is a key thing and why we need to rework the curren=
t
>>> state of the patch.
>>>
>>>>
>>>>>
>>>>> We would need to absolutely justify why it's suddenly ok to not provi=
de
>>>>> page blocks here.
>>>>>
>>>>> This is very very delicate code we have to be SO careful about.
>>>>>
>>>>> This is why I am being cautious here :)
>>>>
>>>> Understood. In theory, we can associate watermarks with THP allowed or=
ders
>>>> the other way around too, meaning if user lowers vm.min_free_kbytes,
>>>> all THP/mTHP sizes bigger than the watermark threshold are disabled
>>>> automatically. This could fix the memory compaction issues, but
>>>> that might also drive user crazy as they cannot use the THP sizes
>>>> they want.
>>>
>>> Yeah that's interesting but I think that's just far too subtle and peop=
le will
>>> have no idea what's going on.
>>>
>>> I really think a hard cap, expressed in KB/MB, on pageblock size is the=
 way to
>>> go (but overrideable for people crazy enough to truly want 512 MB pages=
 - and
>>> who cannot then complain about watermarks).
>>
>> I agree. Basically, I am thinking:
>> 1) use something like 2MB as default pageblock size for all arch (the va=
lue can
>> be set differently if some arch wants a different pageblock size due to =
other reasons), this can be done by modifying PAGE_BLOCK_MAX_ORDER=E2=80=99=
s default
>> value;
>>
>> 2) make pageblock_order a boot time parameter, so that user who wants
>> 512MB pages can still get it by changing pageblock order at boot time.
>>
>> WDYT?
>>
>
> I was really hoping we would come up with a dynamic way of doing this,
> especially one that doesn't require any more input from the user apart
> from just setting the mTHP size via sysfs..

Then we will need to get rid of pageblock size from both watermark calculat=
ion
and memory compaction and think about a new anti-fragmentation mechanism
to handle unmovable pages as current pageblock based mechanism no longer
fit the need.

What you are expecting is:
1) watermarks should change as the largest enabled THP/mTHP size changes;
2) memory compaction targets the largest enabled THP/mTHP size (next step
would improve memory compaction to optimize for all enabled sizes);
3) partitions of movable and unmovable pages can change dynamically
based on the largest enabled THP/mTHP size;
4) pageblock size becomes irrelevant.

>
> 1) in a way is already done. We can set it to 2M by setting
> ARCH_FORCE_MAX_ORDER to 5:
>
> In arch/arm64/Kconfig we already have:
>
> config ARCH_FORCE_MAX_ORDER
> 	int
> 	default "13" if ARM64_64K_PAGES
> 	default "11" if ARM64_16K_PAGES
> 	default "10"

Nah, that means user no longer can allocate pages larger than 2MB,
because the cap is in the buddy allocator.

>
> Doing 2) would require reboot and doing this just for changing mTHP size
> will probably be a nightmare for workload orchestration.

No. That is not what I mean. pageblock_order set at boot time only limits
the largest mTHP size. By default, user can get up to 2MB THP/mTHP,
but if they want to get 512MB THP, they can reboot with a larger pageblock
order and they can still use 2MB mTHP. The downside is that with
larger pageblock order, user cannot get the optimal THP/mTHP performance
kernel is designed to achieve.

Best Regards,
Yan, Zi

Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085FD246BA4;
	Tue, 10 Jun 2025 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749565233; cv=fail; b=HH2anF3j10ekDcH0Zg1M1iesRod1U/hiL7L/hijMYA7583edCYvyuz5xN2X8NP0bQ/3Fsa4I2AeZl6tGMxVv41H2VKgYP8WMetIX+GyFm7YTeV3A2zpFIcadDrS/HSgw+DmXCNqhUOMZCH98cxwDJtHnJM/0x1S6zzrQBwzFXPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749565233; c=relaxed/simple;
	bh=idtEggaeogPilx5sDCgB/LUQ1PHRow1g3VX1GgydVAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m0eubF2yRI+RxupGxCeoDl81BwHOf2Xau4ZHpCXQ/5oLkYzUeA1Pf2pxhyLXTckm7U2lbcHyMWxme5OzT65wBECldWMjTLz+fOLxLQUiWVsBOa3jaE4Um4KwN0FOVX82S3AuxmyBQhRbDlCFBFS34FIvks93jZsOt1wBn1ez8fQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RCu/YGrF; arc=fail smtp.client-ip=40.107.244.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RCu/YGrF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcaEzylsPse36r0F82IQIhO8OTdEbA7V+thTL8XOr2pre5ui9kHl/ntRFJs1AsPECXVJnfcIRLyHT7O111A4Pmc9sQ9EeMTRvhQVEU0o8R1/FAElUtRPp1s/06xk+OTF8MmbFwgqPCwnEzWjVo2frW0dgssplmhewla996woUhUX29vneKWrHml57sMXOCR2j23RN9xV3tZO2WUjML8TycEsyDc9d8o+FNVeR++KUE/9VRk9X0fcDSURTg6WFpaGMokCr+n8+QLjjMbWD7goeDtxiCWAQTgrbEVPp9execDm2n5AhHrWIGuH6jo+puLb8XxJbtl0f+cozWP26Jsdyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idtEggaeogPilx5sDCgB/LUQ1PHRow1g3VX1GgydVAE=;
 b=yiZLw84X9vjiKhhqTvbY1AYAITBi4SlvndeTplnbm/MM2OWxRZumAFeLgnVsPi0VDQIl5rmUWIkyuUh+K4ZWNAXAFmZbEcfoVBMJ4DfZpFRhOkkd9p9vjG/i082FU8zp8w2dPnNsb2ClA14/tYctZjT6Iu7YXD2tHevfUQ6jJ3e2mIKNUMlmh6VU7KTBNAmA52P4rh9MC47REhHIC8+PM2pjMSWb3Mdduv8d1+tQxvdIblPHZ+HPxI7U0uxja89nhrYO43KVRRgqqdl3MAYrpqM0jW2GMlSbcULkeMpxM2K3OLD/IqKaRtYtQ0GSt0qg8mG1lgBDcbbVzh8vusoqjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idtEggaeogPilx5sDCgB/LUQ1PHRow1g3VX1GgydVAE=;
 b=RCu/YGrFeU//t3wQA2bT0yhA1yrDEi54rEs0WdWUtjGGT/pBnSMsJaRZ1SlEpBh56T7DVsiTif4ErKXa3kYPUL/AIchwXDpYj69WXuUgT33I42bY2WFXIzn57pLQlBX9l7K62zV+3ACY50z8hMFtgG/0ToXnpd565QkruCa7aW6k0+gS5X3WbinHaMSDx0TSX72WjERlyGRdxi3TGb+Qpqs5UiQc1Oych1UfEJt1skA4UW4Rpv8CyPyYndqyYF3rG35qXpgG9m3aVWaVGqunCFMqDo1m7z0TwgZ69SrxAo0D5y8CsN0Mi8lIW7j+ouNp1Uiya99CJr+c20UXf8fL+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS0PR12MB6606.namprd12.prod.outlook.com (2603:10b6:8:d2::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Tue, 10 Jun 2025 14:20:28 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8792.038; Tue, 10 Jun 2025
 14:20:28 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Usama Arif <usamaarif642@gmail.com>, david@redhat.com,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, hughd@google.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel-team@meta.com, Juan Yescas <jyescas@google.com>,
 Breno Leitao <leitao@debian.org>
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Date: Tue, 10 Jun 2025 10:20:25 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <46F6B7C4-542C-4310-9C70-F7469B151C7C@nvidia.com>
In-Reply-To: <dc32ec54-88c5-4171-a2d0-389e3ab428c3@lucifer.local>
References: <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
 <c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com>
 <18BEDC9A-77D2-4E9B-BF5A-90F7C789D535@nvidia.com>
 <5bd47006-a38f-4451-8a74-467ddc5f61e1@gmail.com>
 <0a746461-16f3-4cfb-b1a0-5146c808e354@lucifer.local>
 <B2F966F0-8F5F-43AB-BA33-BD3E65504F4F@nvidia.com>
 <61da7d25-f115-4be3-a09f-7696efe7f0ec@lucifer.local>
 <AA2C4D68-B1DC-48A6-A807-56516067B9C7@nvidia.com>
 <f980e652-8e2a-41da-af9b-39fdd439fefc@lucifer.local>
 <2338896F-7F86-4F5A-A3CC-D14459B8F227@nvidia.com>
 <dc32ec54-88c5-4171-a2d0-389e3ab428c3@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:91::15) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS0PR12MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb5a216-f22e-4432-d5ac-08dda829f2e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2ZOQzBLcVVYQTZTZGxaT3RlUkppTkxYZGVIMEp2NXpMTEY1cCtSa2ZLLzho?=
 =?utf-8?B?SjY0eVI2MGo0RjhzK3JZUVBzaU5hQW0zb0pxNE5wSlBUTnM0WGE5YjlyWUJJ?=
 =?utf-8?B?SWdicjRwdjNXZ3JRNmlIWHQxUk1NUnhVS0prOE1BazVjcW5DY3lWME91WVJs?=
 =?utf-8?B?dTcxNWhoU3JVdjB1U2xKdlFXSy81dWZaSVFlRkhhWnQ3djJzbDkySVBZQkdN?=
 =?utf-8?B?WW5OeUtKK2JYajRST3prZjB5U0hmSEJhRWY3MUExdmIrV2FiNE1RbXV2WmF4?=
 =?utf-8?B?U2ZwWENCcHZxM3h6enRvanZjZmU2TldnTUJPeUhNdVFiQUVTTHdrREpNRENx?=
 =?utf-8?B?TGxFR0lUNDk3bExwWHpVa3lqTU15amEvdXFuUkY4MTV1bEh3T1dnUEx0ZThD?=
 =?utf-8?B?dHdsRm1RZHVhaDI0RzRqT3gwckx2VUxrRnVXQjhsMW4rSTd3NFlhTUpTVy9O?=
 =?utf-8?B?Z2I3dlVrZUJNM25ZL1BQQ1lDNldXK1ZWamUwdGlvbFJLTThRMHZsZFMvdU9p?=
 =?utf-8?B?aC90Mi9ZVG41VFR5NGZ1a3NoVDRxSWwzbXBxMTR6dWhlV2RWVnZGS3h4M3RK?=
 =?utf-8?B?eGsybEh0YWxhR09Ib2ZjUVdIbWhpQ2FiNm9PZEdkUDFXR2I1SnEyQVNyUS8x?=
 =?utf-8?B?RldyYXI2N3kwN2xseDhkNDRoR1VaRTNEKzN2OGJMS1M4ZFFMbXRQSnZZNU1Z?=
 =?utf-8?B?M00rOVBMNHVDdHZJUTlFOTVxeFptQ0RLSWxhYk81VWp0UFdlc2lLSS9MdnNQ?=
 =?utf-8?B?RUVneERJZmZIeEZwYlhseUVPN3V3cEh3SGM5ME02YnZpUllXRkpXY3JTdWV0?=
 =?utf-8?B?TWhLZFpzaXlTV1JVcnV4NnIvUEFKdFFjajZCWkRCRjdPMFRhYkRTZDdCY3hN?=
 =?utf-8?B?b2VyLzR3OEpsL21pRHFySVQvUjlEeW5SMmxoS1lmSFU5dnlsaldzdDlqRFoz?=
 =?utf-8?B?Nk40a01NNDdsUVJDaTE1VDJqQlJiUmw0b1d2TjJqWEluT011R1lNU2JWcnBu?=
 =?utf-8?B?Qk9zUFR5ZGt4cDBRWlBrSnJRRTNXM2Y0VUtjUkVuQmJjVjA4ZndjWjdYd0ZH?=
 =?utf-8?B?VFNlUWRVcGp4NDV2VHpWeWN2Y1RCRUhwRHNwTTV5YWdWM2EyYzBVMkdDVVRZ?=
 =?utf-8?B?U0sxZ0FvWTFFWmlWVjA2a0N5YU9BSjdSUjdZdFBiQ1ZPUnp4YnNsVCt2R2ps?=
 =?utf-8?B?cEJ1MTNXNXhCYWhtamtGNk9Yb2lSL0xlQlBTdFZYVCtMZlNSYnE4TWlJMUU0?=
 =?utf-8?B?N3FTNTBFRVVKUlExWHp2cTcrS2hHUGlpY2s2UFpjb0p6akhSTkV3UzR0di8z?=
 =?utf-8?B?c25QWG0wWkN1KzRjaDZzaWFpdDFGdHo4czR0VTZ6OENBR2VZV2JXUkt4VlNr?=
 =?utf-8?B?L25OZjBqRlRyVUlCTnZvclVvSllPVlhQU3RvYkdsaGpzTjg4K2cxeGxmYy90?=
 =?utf-8?B?N3JrU25lYm1nRmFlam5qSEdBemdXbWsxRHR2OG95QWVYVnVNRjIra2VhMlRt?=
 =?utf-8?B?cG1TUmhnRDFiODVoL3FjTU9VMmQ0YXdWaDJjVmpCUGV3RlJXSEtNampPT2lu?=
 =?utf-8?B?M0t0VUhRckZGaTFkNENKOGNaTGFVaVBRejR3WnRKcWNDclJPdkxuVWM0VTFZ?=
 =?utf-8?B?bVpJaURuaGpFc2lwMUtubHJCcmZWS2FTNEllbUVubVQyd0dGUExwU0sxQ005?=
 =?utf-8?B?NXpKMXhQb0daYy9rcTNCeUcveUx0UFpxWVRrOTNzSVZtdGxoR3BwRmR3QWt3?=
 =?utf-8?B?UEhhR0NTOTFSNytpZURzYjJaSUFQcWloMnI5RVg0MGdLY0NnaFoxYzZaV0g3?=
 =?utf-8?B?SGZCd3dHZDBwRUZlRmNMZnFORlRMeUlkRUZRZDFQVGRzT2l0ZzlENVhMcEE2?=
 =?utf-8?B?alJobXV5bDBmUE44amY0cGNuQUZnb3FQODZ3QjNJdWZyeFRFeWdiZ3NVMk9B?=
 =?utf-8?Q?ZGnlm9IDTVQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHU3OTlKTHZydkpTc3FVNVIxMXN3Z1RJRVdFMG9CWklFRnczbnV0R0dGT0Qx?=
 =?utf-8?B?RzBRZmptdjVIUFhVemZQLzJaaGpFaGxDVEpwWXNtSjY3WnR5eFlpaSt6ZDI1?=
 =?utf-8?B?MUsrY0x1YXhqMTE4aWIrUWZRY1B2eHZzenpYOGoyb0R3NkQwYlZpWmEyeG5i?=
 =?utf-8?B?NVJpMGo4V3F6dnZKUlo1MlFwa2JXZFpEWE5MOUhaZE80TEFBZ0RPOGNUWFQ0?=
 =?utf-8?B?eEN2eUt1MGdmWDdTemRsN3pZeU02NHNzYng0NUtPWUxqZ2J5ZWx2OXc5KzFn?=
 =?utf-8?B?ZEpFaDAvTExQaGJ4QkIzSWFRMkJmNS8vb1B3Wnd0cXJNTFo4ZU9QazU5aFN0?=
 =?utf-8?B?VkpVRDdJdHIyaWhmYXRYc0J4MjFzSXdnUmFEQk1FdlJ1SW9JVDlNcEY0VHls?=
 =?utf-8?B?a1JBNXVscXhoZms0aHE4TXZWYVFnTTVWdSthRHB0eUJ0VDZGZWlhRE4xWVVs?=
 =?utf-8?B?MkhKRjVPRjVZa1Z4UVU2VDFzUzVKTHQzZkpBbkNQTHcyN2Q3ODZWSDNXWElk?=
 =?utf-8?B?aFpQMEw2NzIxbktaU1FySlFVbHU3cHBZd2ZDK3FtbVE1Ulk1S3BOZU12YmhD?=
 =?utf-8?B?V3p5SXFIK0tlNUR2STZRNkhsczdJcWFxeUlZSW9ab2tsbWExS2lFVnQvaGx1?=
 =?utf-8?B?NThJKzFSQVZMNGJ1SjB5Y2RvdElZZlp2Zmw2ZXBPN05sQ2NHOXRmTnp3NEUz?=
 =?utf-8?B?ZTdSZWtHVEV0L0JKaFY5RE53dlB0bEtjT0lQdXNGbjF4ZlpKNytpTWxtNkpv?=
 =?utf-8?B?aHV2V21JRUZYSk82RTlrWklPUEgwN2c3MDVYOGNNWmpNL1I1VkkxYWFXM0Rk?=
 =?utf-8?B?b0lpaG9lVHRHSkNjVTJwcXJEejdiVGFiZXhKUlhqRWhGekpkYmMrNnIxaVE2?=
 =?utf-8?B?RVVRZmNOS3BKb0ZlL0pva2hCT2lzOG9FU0R5OU9QSGRsYjNTd2RFRjhJVWZ4?=
 =?utf-8?B?VjRYU3VOSXpvRFY5eE1RQ3M0WE9iSWx4WTJRNlU3Ri9WSVAyV0NQaUx4akND?=
 =?utf-8?B?Zlg2RmhqQUErY2VNUzVNdFlHTWNoZ1lPUjJSYStkTkZJL2ZDY1I3ZVFPbUpN?=
 =?utf-8?B?eW9wWGdoT3YzN0NkNG84SmtjV1E5bTRtR2lpRllWZmJqcDZ5S0hQSXdnRmFI?=
 =?utf-8?B?M2lVYjJXK1lHZ0lqZkhYNHlraHppcDJTWFc0NHNES3JNektDTWVYQnMydkpt?=
 =?utf-8?B?ZHpDRk5lRDNmRStnQlhLRWdaVFByL25jUkpBMXpHYmdpOSs4SFAyekZnazF1?=
 =?utf-8?B?Mm90YmxzVkV6Z3hkZ0VLQTgwdG1KdHpyNzNnTkFZcWNvRTdXYS9XYzYxUUlS?=
 =?utf-8?B?aTFla0wvQXhyUjBKWitKdzNjV2VCYTNGZ2JpaGNtTk1UWHdTanRoUm5lc2NW?=
 =?utf-8?B?cVJLYkVIc0xlT0NwdTRlQ1RMb1MyZ3UxNXVQS3BCbGsxdE9KaHVSOWNnYzVa?=
 =?utf-8?B?d2ZFSGw5K2FaRnRlRzEvRDZ0c0pWTjZIRXBtcEJDWnN2Yk91SjN5N3RCb09n?=
 =?utf-8?B?d1JPZWFGTVRNODk2Q1BDNmdWSFU3eWlsRWlUNEp5a1FZUGphcGpETDE3Ums2?=
 =?utf-8?B?TEgwdEFYYllPaGw5eGR6d3VOSktLUTN5WVhlTFBUblRYOUdIMFhTb0IzZTVW?=
 =?utf-8?B?cllHdWo4eXAxRElkUEVscC9JVUN5cjdMbDF3eThjczY2NHprblUvSlVKSkNC?=
 =?utf-8?B?VUNzOG5TeVpUMVdieDhWVXdNUVlQaU8vdWJOY0pxK0IvU0M2UTlKRGxlcFEr?=
 =?utf-8?B?UlQ4RDZwUWozcGw0c25aM0xBVzlFNnRjc3Ayc21Nd003ZDE3MkdRbEsxL1pN?=
 =?utf-8?B?aG5RMWNuaDV3VDIxaFNWNjJabjlrVWVnRzZHTHZQeTRHaVZxNUVMbUU0Nk9V?=
 =?utf-8?B?U0FoTkp2Qk14RWQvQVY3eXp4WFgyMXRCRVhZRXlhTDBTWFhhVlRvU3JKVU1s?=
 =?utf-8?B?L0pPcHZDUTcrbVo2VVBaZkNrekJHUVJIaU83MjZDL1doeDdWdTlvVXlPN21N?=
 =?utf-8?B?M3dsRnprdGZhT3JMcWxjdE1qS3pORGlJTDRSQkZ1VUpHZTVQcFo1NDdDVVI4?=
 =?utf-8?B?M0IyZzBxZGY1Szlrd0xjcHdOVGtvb01kRFFJTHBDUmNYbDVLcTV1aWtFWFpa?=
 =?utf-8?Q?mwrxwtkaTd6S4DymEiZp9NXI7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb5a216-f22e-4432-d5ac-08dda829f2e6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 14:20:27.9943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ds70zeIuZVB4GPqzASrdEiVZz7JhYaOy/lXsvum6S4Nxeqahsii28bMGq0GtUrry
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6606

On 10 Jun 2025, at 10:03, Lorenzo Stoakes wrote:

> On Mon, Jun 09, 2025 at 03:49:52PM -0400, Zi Yan wrote:
> [snip]
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
>
> I don't think we can set this using CONFIG_PAGE_BLOCK_MAX_ORDER.
>
> Because the 'order' will be a different size depending on page size obvio=
usly.
>
> So I'm not sure how this would achieve what we want?
>
> It seems to me we should have CONFIG_PAGE_BLOCK_MAX_SIZE_MB or something =
like
> this, and we take min(page_size << CONFIG_PAGE_BLOCK_MAX_ORDER,
> CONFIG_PAGE_BLOCK_MAX_SIZE_MB << 20) as the size.

OK. Now I get what you mean. Yeah, using MB is clearer as user does not
need to know page size to set the right pageblock size.

>
>>
>> 2) make pageblock_order a boot time parameter, so that user who wants
>> 512MB pages can still get it by changing pageblock order at boot time.
>>
>
> Again, I don't think order is the right choice here, though having it boo=
t time
> configurable (perhaps overriding the default config there) seems sensible=
.

Understood. The new pageblock size should be set using MB.

>
>> WDYT?
>
>>
>>>
>>>>
>>>> Often, user just ask for an impossible combination: they
>>>> want to use all free memory, because they paid for it, and they
>>>> want THPs, because they want max performance. When PMD THP is
>>>> small like 2MB, the =E2=80=9Cunusable=E2=80=9D free memory is not that=
 noticeable,
>>>> but when PMD THP is as large as 512MB, user just cannot unsee it. :)
>>>
>>> Well, users asking for crazy things then being surprised when they get =
them
>>> is nothing new :P
>>>
>>>>
>>>>
>>>> Best Regards,
>>>> Yan, Zi
>>>
>>> Thanks for your input!
>>>
>>> Cheers, Lorenzo
>>
>>
>> Best Regards,
>> Yan, Zi


Best Regards,
Yan, Zi

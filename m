Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733A42C10A8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924242; cv=fail; b=FuVQpf1d83vQF+fmYtYCB1b7v2PQ8a30ycXeUipeQNVTSiFtZ3OSzDCbEXYuoP+9fhO1G83NeSWpwL83QZkF1im8PJ2YAEuGYlDSHDHGCDfNTNNWHaTlpOEa8wNwIoURPPwmrU79IqFUhpe42h0cfYBg5TDJdsVv7di8yU1Txao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924242; c=relaxed/simple;
	bh=K2twNao6K0V2XeOj+6ER82E1dVGefnUTCSNdwxKFd3A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WoI8rss/ksdwFPgD+31xJmqMvN83kX4SKaZWzrTz5LnEsgAoG5/sbEvjPfK0oMh6W38CAiv8DGjtxamGw819ap98Of0se+ZevrqRCm8hzMeSmLqRryss7+m23BUqj5gLFDf0zi9IAZqS4BXVj/PGNlu4oBDSqsJGEHDP9FobP2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=a3mCBbwJ; arc=fail smtp.client-ip=40.107.94.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="a3mCBbwJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqiIOIeC9XwqlPaot4f0K09ReggFFalNT82QtxZiTHA3oICMrHVrska51EMGbeNlf1/7SH3CcW3tj6oZdlPfV6KguhvFaoH2Ey1dryLVFMH4RQActen/RD9q4uc7xoKAOyvEnZPGysnqSkxGurbLmZBPOaQ9tOkxAYgp/AYKOGHX4ly7hU+HeYl42CYlIl6uLHEdPKKl2OEbJkNC1O6PRSP0HFuy7XORCiZDKx97gWAhnzuqh2wdIX4gS9d0N/PcEduVyvAavqpH9VTqPcLXN2UJjfjyDw/7du2n31CZYag3A6Fmn272raNvNl6quAXnEycS01Je+mknGgOzPz/B4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUXBqbTfy886BntypX9z42BC6UkKHtD7Zniklbnavuk=;
 b=R3zs6IqRq/HIjh2+GQxbCrxuhnJuYKaZe3uQSHVDnnxKZMubvadrgrZLVXAUh7noxMFsEFmCgiSyoqxtIOw3vci3ZQcOffwPBExJok5w5KgcHpveKIvTncyjo6mvD1w23kGXIBcb+E4t/SggzOIf9gvBjzoj03QA/ZONrIV08UyxP+FOGGJTBAJWNMUHSVKSYpjq/PQMrRSR65EkK/kefTgOvhWagFxeY0v/FTIChYzgwj2X/h/wpiaqqTHQJ8SPBaU05Z9tFHtglCrCKGxNF5f2vUfq1BnicygwHP7APvxL78mKBKS4DAKMw0IcDokYJRBtfAFPqRv3u6GfHGyhIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUXBqbTfy886BntypX9z42BC6UkKHtD7Zniklbnavuk=;
 b=a3mCBbwJlmwj8AEHtgUvLriKryrDRktkxspeF32bHWafZ/0ByFbIpECp1o6dFLNT9lMBxR6X05XzFE1iJywyV/LjuhK/o15HpQe+fbxNR0XEvYzdxgFwBSuz7PLrrs9tTVk6oJmsEYK0KY/IMjM+T/Y8tKjyMOQmUa27uVof7to=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by PH0PR12MB8776.namprd12.prod.outlook.com (2603:10b6:510:26f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 10:57:13 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%7]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 10:57:12 +0000
Message-ID: <57536c5a-23dd-4f14-af35-9c5523000e80@amd.com>
Date: Tue, 29 Apr 2025 16:27:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/2] mm: add folio_migration_expected_refs() as inline
 function
To: David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, shaggy@kernel.org,
 wangkefeng.wang@huawei.com, jane.chu@oracle.com, ziy@nvidia.com,
 donettom@linux.ibm.com, apopple@nvidia.com,
 jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
References: <20250422114000.15003-1-shivankg@amd.com>
 <20250422114000.15003-2-shivankg@amd.com>
 <20250422164111.f5d3f0756ad94d012180ece5@linux-foundation.org>
 <aAg1-hZ0a-44WW6b@casper.infradead.org>
 <b84b6c31-578f-4abe-9b06-6e7cf4882eb3@redhat.com>
 <8f24de4d-5088-498a-968d-9e8bb85201ac@redhat.com>
 <aAmtzAv6ZbbRpKHM@casper.infradead.org>
 <7ff5b149-534d-4bb7-8c6d-3147279d3fae@amd.com>
 <604a1db2-bd64-455e-9cf7-968cacef0122@redhat.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <604a1db2-bd64-455e-9cf7-968cacef0122@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::19) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|PH0PR12MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: e0f58331-a23e-47b7-452c-08dd870c982f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWpBdHJoVnBsRTlDT0FLdVBqTklZeWlxQ3J3RXlmZHE0K2xPckg2VWhFY3hl?=
 =?utf-8?B?TW1sVTAxZmFsLzVtSGNXL0VJRG9SbVBtMDZBbmh0UUtSdDdlYkVjWStneElw?=
 =?utf-8?B?VjZ1RFgyZkREbU41eURrcHU2RFVpR0xOai9TaEdzRUlicFBibEY0QjZZekw1?=
 =?utf-8?B?MXE2TGtQejBzK2E4TnN1SjZpdktLTisrcVZwaGhBMlFacElaK2dDaXpTSjVr?=
 =?utf-8?B?L0VxT3VKU1lvSG5jcUdXelRJUkNvbEI3Rmp2bHc3c1FnK2JWUHN5Q0tscWQ5?=
 =?utf-8?B?dUVkdml0dWZsZE94VG5pVXljRFExRWNjRkxWUVluTXBPekhhU3hZYWZtcWxX?=
 =?utf-8?B?WHlLeTZmTjIzcUtUTjg0YVVqNTkwVmp1Q0Fvd0E3b1BpSXdjUlFDMWtIY1NN?=
 =?utf-8?B?R1MyeUQzcUl4T2YveHdzZW80Q2lEdlVBMmR2YVhaMWJtTVVkV1hxZHlGRFQ2?=
 =?utf-8?B?Y1EzSERUNDBjdDMxVTA2OUl3QXRTRFpycTNYYWtxZW5ySFFsYUUzY3ZQemox?=
 =?utf-8?B?ck9vdmtITGh2M3pKNHhwL3lFVkZSaTVzaCtkQ2oxVVU0ejMyNlo2ZFZVY0Ur?=
 =?utf-8?B?OVVzelAvcUdCRFhqR2dsY0tMNlRaZHpkc3FraExhRzdtTU9UL2xxRmxsNHU1?=
 =?utf-8?B?ejdlTkpXek9wZWY4Z21YY0dTY1lVWUdEbExVY0t6dUxZNlhWeEpSTlNLNm1i?=
 =?utf-8?B?N0drQ2haeTVhZmdPU2lFN2xHNGtJZHNXQzFLdXA0ajlnZG1wZlFCTVNtWHVq?=
 =?utf-8?B?RE1QaVZjdDg3S0hPZ29KMng0VGovQkFZckRkdFpKUGFnOHpuN1pBcGtpNGhI?=
 =?utf-8?B?YU9kb0N6NHVtSFd1ODhGK01ZZ2l1d3JIN1locmtQemZDUGZqbFZiU3BZNmlD?=
 =?utf-8?B?elFicmtLZGR6L25BWGtoYk5hM2tEQ1grYUtvNGhpa24rcE5SMG5mQU50VGRP?=
 =?utf-8?B?UnRDZDJYUXVwdzEvVHNnRWkwNjd5K1M3REtkZndpM0k1V3dWWGdBR0txSFdJ?=
 =?utf-8?B?c2ZzMklNRE9OT1pJS3RBREg0eTQzUHV3cHg3dzQ3TmRLQkRHRmRSTFJJU3Zx?=
 =?utf-8?B?T3B3bUtmd0x4d3QrQmR4ZU9sWjRHN3dCWnd5ZlBCVm5XeXBHbHJRajN5WHdq?=
 =?utf-8?B?dWlEdGRqL0hPSVA3UG1BdWJqOHliSGNjRGZqMGY2dS8xUGhobk9tQ1NPYlMy?=
 =?utf-8?B?NFlhMkk4T0d0eE5RSHo3RnNPVlk3K25mWDZvdDFwQ3BNeEwyUlZqT3FOWFBp?=
 =?utf-8?B?aEREMnJKZXdHVVp1VDJFOTVhYWdMK1cvQjFrYUxHV09Camcwekd6aHVjS3F0?=
 =?utf-8?B?M0hOMWk0Q3ZueEVWQnR6dER4TzI5TzJsZmxucXlMMHdxd1k5TXZ6d0RVNmdC?=
 =?utf-8?B?NS9Pa2hEYzBzQzVKaWVVSDlQb3YwRzhhOVpVbEtwZ1dSZ1A2eWdMQU50RSts?=
 =?utf-8?B?ZWcxdG9JWmtibG05ek5LMnY1WEMyc0RRcEo3Tk01ajN5RmRrRWhJSVduTlJD?=
 =?utf-8?B?UmFTb3J4VUhUa0JjMXgvSGJ5Tnl4T1NYU3BSM01jWFpxekl5T3BYbkFPU2Fl?=
 =?utf-8?B?SjUyRnhqeVFUUHNiR1IyN2ZjdUg0UWsxQWI4aGVQVkNjeEFHWWtSRkJ2RmVw?=
 =?utf-8?B?RHRVN1QxemNyNS94dm1DNGtPQWtQckJmZG5GTUJ2Y1NzTVBZQU5ya3RFNDRt?=
 =?utf-8?B?TU96amJSNWxNV2QwWWdOYzNZZVJwWnJLbEExZ3ZnaklDSXljeUs2Y2dtS2w5?=
 =?utf-8?B?dHlxemZpaWk4TEY0QmxUTEF0RFB0dzZxMDFiRmpUS21OQnUxUnVDKzR2aURX?=
 =?utf-8?B?bkoyZXh2MWdjOExsN29aSjQwYm5UWkpMak1QbzFFSk1peEN1cGRvQUJxb09J?=
 =?utf-8?B?RG0zTXJUZUQyYlpEUWQvYUZydENjek9hOWVHbTRoMGh1MWpRUklPR1BkaGwx?=
 =?utf-8?Q?iEwn/s8BY0k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTkyNkI1cFQzRlQ1elkvdkZvTWNua2F0QXl6cFd3UFRMWGdueHhLU3lkRTJG?=
 =?utf-8?B?R0ZIZEdoRm54THIxaFFHeE9PeTBpTUpaeFJZZWpkcW1TTThaUzBpYmt3ZlRU?=
 =?utf-8?B?TlVXVkJDVlpNbCtyOWh2NC83SDFBTHpESmFPT0tZemt4VlJBQ2EyNzhZUVQ1?=
 =?utf-8?B?SkRsd04yVm5idENCWnNpaWxWQ1ZKcGlDNGoxQVU5TTMzU0JyN25kRTNWeHJU?=
 =?utf-8?B?SjZFT3JWcTErc0JIVDZaV09haE1uTStuOGhZbWF3WStDZ2ZYUFRDN05Qc1RZ?=
 =?utf-8?B?bWMvWkVvY0ZiZFoyRi9FdDdScVcybTVZWTFPaUYwaUcrZHdCb3VkRDVqcHYx?=
 =?utf-8?B?eDg4VVhkTWNEUUwyK1I0UFFXbC9xbmlVb1RlK3Q0TUJ5ZjFVWUNEUlNOMVRr?=
 =?utf-8?B?SWZqU0gwc1g3cHhiWEs3WjcwVlZadm1ibVgxZE1CeEJZWDFmT1BxR1pPUVdi?=
 =?utf-8?B?dFJHelQvbVA1Ukl3MUdXWFJjR1JmOWlyUUptL1Bjb3R1NjF5UUJPSkplQ0R0?=
 =?utf-8?B?NE5TSHJFVmowOWtDRHh5SENVODZwWXdBMC9HbXNiQUlpL1FOWXFNOC8wcERW?=
 =?utf-8?B?bFREUnkxWDhKMVVybVJGN2N4ejdwMU1JTTVwYUMzUVNLL0VqOE5ZNGw5eFRN?=
 =?utf-8?B?TTNpVnlmanEycHl4YXJVQUlLOUlxTnpCTlZRbmVQV2F0RzZSRWU4b0wzZWFX?=
 =?utf-8?B?OWp5TXBMMkNaU1BEZG9YQStVYmp0VWZIc1QyY0lZZFJONk5uQjUvVXE3VmNp?=
 =?utf-8?B?Z3VnMzFGM3pNWXQrWlV1c1FaZkVXS2ZzSlBya3VEWE91K3BSV0V6UDBXYndM?=
 =?utf-8?B?cDlCaFdIWFl2bThMTEVsS1VSeFRsOXRYTjh1MmVpcUwvSkF4MFFqSlozaXQ1?=
 =?utf-8?B?Vy9HQzhxWGZMN2wwM1RJT1VXd01kMmJNYUJNc2hrRSt1dnZuaHYwVGZOcm1k?=
 =?utf-8?B?QnYwb2hQaEwzd3ZITjdRWGIwUHRKRi9QalprUVg1citqUktaYnZaemJOeSts?=
 =?utf-8?B?dmtwSVNwYllhM0dXZ1V2S1RRSkhaUlFOb041bHdhQ3BvMEpDc3I2YktBUjBZ?=
 =?utf-8?B?QVozRE1LSTgzYnhXbkVkR3ZRbHlHTFgzVWtINVNuUVJtRTRIYVI2d01XSUc5?=
 =?utf-8?B?a0RJR0VOM2k3ZEpMRURFWVhxQVRvcUxaYVRScWVtM3FOQUVySzRQcTd3RHBC?=
 =?utf-8?B?ZnhiNi9JWDRFbHp1RzV5RXFBNU5takJUSGUvOXVWQ3RWMGZPeWFLOXA3Y0Jx?=
 =?utf-8?B?Zm9LVmt0U28rbWhFdTFZd2V6TEhxTEo3ZVJUK3JoQXI2OG1KMXVsOXFNTzNI?=
 =?utf-8?B?Z0ZiWFoyaEdHYnRiMnFkN1lXdmlkaHEyTlc2SkEwVEl2K0dwSG5yQ25ZRWRY?=
 =?utf-8?B?Sk9hckRKUXJhUGlMb0srMEVPYUJxVUE2bml4Tklkc0RFOUFOWExOWFRJYjYr?=
 =?utf-8?B?MHM4YURXRGhBRk5IUU5CYy9xU0l4ZDVzVFEvazdrNUFldG84UGZhK0VTb2tj?=
 =?utf-8?B?Y2VYVkNUM2NJYTQ1ckU5UHFvSExURktaeE90dDQ1UVIwb2tMVkhWSVN1TVFr?=
 =?utf-8?B?RXF6dmhTYzhPS00vZlhUZUZxaUtUM3RIMDFFeUVJbUNjVUxmdG9QdTFHRmh5?=
 =?utf-8?B?VGU3dFBMSWdWWWsweHAwZVFzSGtJVHc3bTJrdGtiZitRajhkcElLK09pejFz?=
 =?utf-8?B?UVM4MjNRMUFFWnhPTUxiQUhVcUIwZnkrWjZINnIzaWFMQlF0clZQSFVaNlRw?=
 =?utf-8?B?clAwSVd5UDdoZXFqZlZ0S2RER2o0U2R5RWViYy9qbTU0UXg2TUJycVg3bGpT?=
 =?utf-8?B?VEpZYjJReTRRZWNTMVV0SUtyNStlQk44VDU1U2VFQXFBV3pMd3BsLy90UXZz?=
 =?utf-8?B?RkhhWHBNZGVZcnQ3QTBqN2NDbUtPdWRIWURjTytmQ3ExSEpNZG1lN05lQmhO?=
 =?utf-8?B?cFdpdGlCTFNSS29FOE1xd3NCbGlsaFcwZkJjdGFvSjhWclVWWFE4YWtTdDNO?=
 =?utf-8?B?RFE3VG5JenN6ZmR1Uk0zY3VGL3VreGhkaGMrRzZkMnlZTEg3cyt4MHdFamJi?=
 =?utf-8?B?MDhZQUlqNWFBbnRGc0JKT2xWQWhnMkxaRnJMMGhQNFlHMHVTVEkzaUQ5bzBV?=
 =?utf-8?Q?xyTjctPqnldARQZmWcMqc9ehQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f58331-a23e-47b7-452c-08dd870c982f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 10:57:12.3616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yR38LDCAIXtbp6QP2UZjcjFpbJ0Z+1DDXeRA/Dduj1JtlTSoJcPd18dIss1UHNikbnfRwW97+v0+CgG3ddIVag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8776



On 4/25/2025 1:17 PM, David Hildenbrand wrote:
> On 24.04.25 13:57, Shivank Garg wrote:
>> Hi All,
>>
>> Thank you for reviewing my patch and providing feedback.
>>
>> On 4/24/2025 8:49 AM, Matthew Wilcox wrote:
>>> On Wed, Apr 23, 2025 at 09:25:05AM +0200, David Hildenbrand wrote:
>>>> On 23.04.25 09:22, David Hildenbrand wrote:
>>>>> On 23.04.25 02:36, Matthew Wilcox wrote:
>>>>>> On Tue, Apr 22, 2025 at 04:41:11PM -0700, Andrew Morton wrote:
>>>>>>>> +/**
>>>>>>>> + * folio_migrate_expected_refs - Count expected references for an unmapped folio.
>>>>>>>
>>>>>>> "folio_migration_expected_refs"
>>
>> Thank you for catching this, I'll fix it.
>>
>> I wasn't previously aware of using make W=1 to build kernel-docs and
>> check for warnings - this is very useful information for me.
>>
>> I'll add to changelog to better explain why this is needed for JFS.
>>
>>>>>>
>>>>>> What I do wonder is whether we want to have such a specialised
>>>>>> function existing.  We have can_split_folio() in huge_memory.c
>>>>>> which is somewhat more comprehensive and doesn't require the folio to be
>>>>>> unmapped first.
>>>>>
>>>>> I was debating with myself whether we should do the usual "refs from
>>>>> ->private, refs from page table mappings" .. dance, and look up the
>>>>> mapping from the folio instead of passing it in.
>>>>>
>>>>> I concluded that for this (migration) purpose the function is good
>>>>> enough as it is: if abused in wrong context (e.g., still ->private,
>>>>> still page table mappings), it would not fake that there are no
>>>>> unexpected references.
>>>>
>>>> Sorry, I forgot that we still care about the reference from ->private here.
>>>> We expect the folio to be unmapped.
>>>
>>> Right, so just adding in folio_mapcount() will be a no-op for migration,
>>> but enable its reuse by can_split_folio().  Maybe.  Anyway, the way I
>>> explain page refocunts to people (and I need to put this in a document
>>> somewhere):
>>>
>>> There are three types of contribution to the refcount:
>>>
>>>   - Expected.  These are deducible from the folio itself, and they're all
>>>     findable.  You need to figure out what the expected number of
>>>     references are to a folio if you're going to try to freeze it.
>>>     These can be references from the mapcount, the page cache, the swap
>>>     cache, the private data, your call chain.
>>>   - Temporary.  Someone else has found the folio somehow; perhaps through
>>>     the page cache, or by calling GUP or something.  They mean you can't
>>>     freeze the folio because you don't know who has the reference or how
>>>     long they might hold it for.
>>>   - Spurious.  This is like a temporary reference, but worse because if
>>>     you read the code, there should be no way for there to be any temporary
>>>     references to the folio.  Someone's found a stale pointer to this
>>>     folio and has bumped the reference count while they check that the
>>>     folio they have is the one they expected to find.  They're going
>>>     to find out that the pointer they followed is stale and put their
>>>     refcount soon, but in the meantime you still can't freeze the folio.
>>>
>>> So I don't love the idea of having a function with the word "expected"
>>> in the name that returns a value which doesn't take into account all
>>> the potential contributors to the expected value.  And sure we can keep
>>> adding qualifiers to the function name to indicate how it is to be used,
>>> but at some point I think we should say "It's OK for this to be a little
>>> less efficient so we can understand what it means".
>>
>> Thank you, Willy, for the detailed explanation about page reference counting.
>> This has helped me understand the concept much better.
>>
>> Based on your explanation and the discussion, I'm summarizing the 2 approaches:
>>
>> 1. Rename folio_migration_expected_refs to folio_migration_expected_base_refs, to
>> to clarify it does not account for other potential contributors.
>> or folio_unmapped_base_refs?
>> 2. Accounting all possible contributors to expected refs:
>> folio_expected_refs(mapping, folio)
>> {   
>>     int refs = 1;
>>
>>     if (mapping) {
>>         if (folio_test_anon(folio))
>>             refs += folio_test_swapcache(folio) ?
>>                 folio_nr_pages(folio) : 0;
>>         else
>>             refs += folio_nr_pages(folio);
>>
>>         if (folio_test_private(folio))
>>             refs++;
>>     }
>>     refs += folio_mapcount(folio); // takes mapped folio into account and evaluate as no-op for unmapped folios during migration
>>     return refs;
>> }
>>
>> Please let me know if this approach is acceptable or if you have
>> other suggestions for improvement.
> 
> A couple of points:
> 
> 1) Can we name it folio_expected_ref_count()
> 
> 2) Can we avoid passing in the mapping? Might not be expensive to look it
>    up again. Below I avoid calling folio_mapping().
> 
> 3) Can we delegate adding the additional reference to the caller? Will make it
>    easier to use elsewhere (e.g., not additional reference because we are holding
>    the page table lock).
> 
> 4) Can we add kerneldoc, and in particular document the semantics?
> 
> Not sure if we should inline this function or put it into mm/utils.c
> 

Hi David,

Thank you for the detailed suggestions. They all make sense to me.

I did not understand a few changes in your patch below:
> 
> I'm thinking of something like (completely untested):
> 
>  
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index a205020e2a58b..a0ad4ed9a75ff 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2112,6 +2112,61 @@ static inline bool folio_maybe_mapped_shared(struct folio *folio)
>      return folio_test_large_maybe_mapped_shared(folio);
>  }
>  
> +/**
> + * folio_expected_ref_count - calculate the expected folio refcount
> + * @folio: the folio
> + *
> + * Calculate the expected folio refcount, taking references from the pagecache,
> + * swapcache, PG_private and page table mappings into account. Useful in
> + * combination with folio_ref_count() to detect unexpected references (e.g.,
> + * GUP or other temporary references).
> + *
> + * Does currently not consider references from the LRU cache. If the folio
> + * was isolated from the LRU (which is the case during migration or split),
> + * the folio was already isolated from the LRU and the LRU cache does not apply.
> + *
> + * Calling this function on an unmapped folio -- !folio_mapped() -- that is
> + * locked will return a stable result.
> + *
> + * Calling this function on a mapped folio will not result in a stable result,
> + * because nothing stops additional page table mappings from coming (e.g.,
> + * fork()) or going (e.g., munmap()).
> + *
> + * Calling this function without the folio lock will also not result in a
> + * stable result: for example, the folio might get dropped from the swapcache
> + * concurrently.
> + *
> + * However, even when called without the folio lock or on a mapped folio,
> + * this function can be used to detect unexpected references early (for example.
> + * if it makes sense to even lock the folio and unmap it).
> + *
> + * The caller must add any reference (e.g., from folio_try_get()) it might be
> + * holding itself to the result.
> + *
> + * Returns the expected folio refcount.
> + */
> +static inline int folio_expected_ref_count(const struct folio *folio)
> +{
> +    const int order = folio_order(folio);
> +    int ref_count = 0;

Why are we not taking base ref_count as 1 like it's done in original folio_expected_refs
implementation?

> +
> +    if (WARN_ON_ONCE(folio_test_slab(folio)))
> +        return 0;
> +
> +    if (folio_test_anon(folio)) {
> +        /* One reference per page from the swapcache. */
> +        ref_count += folio_test_swapcache(folio) << order;

why not use folio_nr_pages() here instead 1 << order?
something like folio_test_swapcache(folio) * folio_nr_pages(folio).

> +    } else if (!((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS)) {
> +        /* One reference per page from the pagecache. */
> +        ref_count += !!folio->mapping << order;
> +        /* One reference from PG_private. */
> +        ref_count += folio_test_private(folio);
> +    }
> +
> +    /* One reference per page table mapping. */
> +    return ref_count + folio_mapcount(folio);;

> +}
> +
>  #ifndef HAVE_ARCH_MAKE_FOLIO_ACCESSIBLE
>  static inline int arch_make_folio_accessible(struct folio *folio)
>  {

I tested your patch with stress-ng and my move-pages test code. I did not see
any bugs/errors.

Thanks,
Shivank





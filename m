Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798C02DCF5A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585790; cv=fail; b=jgU/A+IveJ8sDwl+oPKsiTR5XQDA52JzfzTA21oYxI3Tvv2qiiVqP+sXeNiocFvMp6Hljwu8Ko//DlGa2TvBH7J4n38h3SMzfYDb856WfCW4dc/S9Tckd9tehY/XR9KtS8K4kXfTygs19IKzsm3hQV3kdS5w59+8J86RmNyiJ1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585790; c=relaxed/simple;
	bh=ra2UFLH26tyPodWrHl7JvtWB3w/Tc0WERhRbPXihrJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OYUpwQk7lchaxYt1kMZBx+b+VjxFok01Az0jeOwqX7KEwKE3gHCTPxPYQDTq5h2RpzHA/sbaT25BrEPV1wbTDgKK8cL9Ehl3VlVommalhFXe5mhKujotnHttvYF3mCP4MbUsYFl227cG6pCsV7rMcEcDx/uPKkLrejqG2oD7rPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sRlIKhD8; arc=fail smtp.client-ip=40.107.94.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sRlIKhD8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvbfSrnxjX5TJipl0lACBn/GK2efaTWsx/uXfOcuhiNU/XyE8N8IqZiZJBTTdfOpm4PWok9oVfETQeL8UmRIhtEucflKLo13V9obRD9XiUC5ziofsc5DnOInHAvTMB19xEJQCuzC21Iexo3sXMaUtukXnu1SkL672W2BqHw3f6kSwEO1/F6QhLfUap2JhjcO7PaM1/42fPezqZ0cdCJjwlP26XlnN4mmF6M/I1+lVrGmPFUHe7bb2lv2ecglQR+8be8prR3KB+sDL+xQFcO46UybXbqz9FxAja3YBOGfPZPXOgnUstVON0QNSsg7388eQ62MSx2KJrUj5k5DzFZihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vg8MYCXo/+xi1xuCVDxZKDAJn3R9eEGaCfOFzfLaX4=;
 b=dXOTogFNauaCT1pnQVz86tJuGgILPFmfcAnVD+Hjy2vQGCmayMqf+byrFpcXx17Imx/+WBIpwjCCEAl/vx0+dZLsVCrvt5C31rnbPf9dy8vdznUbGN2PxsCPLmOguKn6pUbF2p0LcI1UJ9EWU9zPHW6FWpFRfiVGHbAjksDOlcH/VD0WQaWe3V7ylvN39KDf5K4WxZbXp8CG/VZL697j6L7slzBPtNWwBRWiSE64dOJebvbCfZTl1qRkTBdtI5XUR50XRDlSqJR2tSIkCRpqQNHyERGjdO7BNJUDPWesZmgEBlRPoBimHrIxkf3gX+EZ57WpQ/ldUFLBdc65jHDFzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vg8MYCXo/+xi1xuCVDxZKDAJn3R9eEGaCfOFzfLaX4=;
 b=sRlIKhD8vnB6BWY7f1uj6O3K5HTz3q/X6/qxbBB3JVVFRsY89eObFrc63bTXH5e6mmaraqK8G8Ih3RWAGAAm3tCVE4+X/lbCWndbIjAENRR59AQAru5a4lc3jJxIcx4TNPN6ttRUB688HQTe45IiAvmnABbSrfMGTpt0KSC8n6bTlWQ6BGXT7MMjfE/SqOxd7FC5Ievr9UTGtsAuq388bFwIJ0w/XR06LqC4I8NIjln4v4pcvxa+jNCI7M8SatFlegFNC64gyIKFRr/1BWqz3MvgWs1uGBSuhIDi8zDRJlvRCbEe1Bns0RPAHFSurIZF9PLt5WvwUYjmR/SHjLufmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 23:36:23 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 23:36:23 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Xu <peterx@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Jane Chu <jane.chu@oracle.com>,
	Alistair Popple <apopple@nvidia.com>,
	Donet Tom <donettom@linux.ibm.com>
Subject: [v1 resend 11/12] gpu/drm/nouveau: add THP migration support
Date: Fri,  4 Jul 2025 09:35:10 +1000
Message-ID: <20250703233511.2028395-12-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703233511.2028395-1-balbirs@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR01CA0028.prod.exchangelabs.com (2603:10b6:805:b6::41)
 To PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MN2PR12MB4142:EE_
X-MS-Office365-Filtering-Correlation-Id: 49140db4-89a4-4eb4-95b8-08ddba8a6c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzBxeEpWNGYzOWRGLzF2cVYycWpBZ0RISy9EZ3dWRVdIb0k4Ny84dmpiaUFK?=
 =?utf-8?B?eVd4bTFJK0FudEVlbENiU0p0Z1RMaFVVb1dlUmoyR2dRNGZBN29rYWVLK2NQ?=
 =?utf-8?B?dkp5ZXFnaGY5UWdscGMvdjdvemdQVkRCclpRRU4vYWRCdHNidjZqNjUxR284?=
 =?utf-8?B?VUJ3TFpTbGs3V1RidEpGVlFjZmxEY1hGdVozVVpXVW5aak1TaEpRaThMTjRB?=
 =?utf-8?B?Q0RkOFJXb1FjQ21PWHJXdzRHK2kwWEI1SUkwNzVVNFRUZUhPRThScUYxaGxO?=
 =?utf-8?B?S1NDT01MTkpwZ05uSVJxZkxZN2ozNk5xTUlzRzhlYnNFNU5aa3MwZ1ZIVUUy?=
 =?utf-8?B?dFlEelFaa3hkOG5CUUR0S0ZZSElvSTRRMjVtc1F0ZlpXei9FWDdUM3BiSkdv?=
 =?utf-8?B?MkF4cENmVnpOYytsVHBPeEs3WitQb3c3M1U3YlZqaDhLWnRRRTl3ZjZSc2xR?=
 =?utf-8?B?WTltL2dhc29xOHFHaGRudUlNWTMrZjVaMVFUc0JTei9KamJmRHVoNXhJOGtR?=
 =?utf-8?B?cFhnaXYrSXIrSFQzbCt6bm5CUDRQVENKVDZobCsxOFppbDlydmJxTm9RMHlW?=
 =?utf-8?B?aFRIRC9xL3lUM1lsSEJOdzQweGhjWlVCRTFDaVMzOXV3N3RMakJkQlR3UVpM?=
 =?utf-8?B?b1RzRHpQWlRJa0w2dnpsSjlRSFF3aUpSSUFMMEF0Z3BmY1dVd3JUS3Z3TVVB?=
 =?utf-8?B?THlTb2d1NDRTSzVoemR2MVVFT1pZSnVlWlZ0Y3RJTVBseGlFUkI5NnZsR3dp?=
 =?utf-8?B?Y1d2T0xKSGVob0QzMDZuUEYzbUhkTGdEQ0l2VkZTR2cwNUhib3pqQUZPcThy?=
 =?utf-8?B?NzN5V0FZODVtRkJtUlJHUXdFU0dnZEgrbzByL3RFRkNaZmVzMy9KampSRDZz?=
 =?utf-8?B?Z0Zpb002cFArbHJ1dUN0NE5Najg1ZU5kSkhNUUF2Vm1wWTVPV3RJNkFJTVRG?=
 =?utf-8?B?UTkwVytQeFpldk9NZk82M0xPdUNSRHVjT2VRd0V1bVdma3gyelo1SlN1czh1?=
 =?utf-8?B?VS9uRHFERUtJREQveWpOSnlZOEtRU2d3WXNQbWZXdldzV0N1T2ZSY3RZSFcw?=
 =?utf-8?B?Yzg5RHhFNkxtNnBoUFE5QjZRTUh5bmRYOXZ3cnFWNUpobVdwMVVieGtIeE9t?=
 =?utf-8?B?RWlvbjRaN0NoS2J0TjJpSXNmUitidmg3ZnJCVWpEeE9URDRvL0d6azY5R2dB?=
 =?utf-8?B?NDJ1dFpXbDk3MUd4bGljRngxVG41WEVvazdSV00va0RGUWlWQThVVjlTU09N?=
 =?utf-8?B?YmE5NVNtaVBOcFRlUzFmbEgwYjVTNVZLZHFZY25kTlQzZU43K1NGS0VDeS8v?=
 =?utf-8?B?Zk9zRTVTQ0RhbVQrN01ZZ3NFZEVxWi9iVG5kdkhobUZiWFppRTgyVDZSUThz?=
 =?utf-8?B?NnRIaldrVlJrbFRhKzE4ZnNlU1diOVAzQzF2ZXJEYk1yVzF2QWtCSUxwZDFa?=
 =?utf-8?B?ZGdPTXJERnA0UjN1NU1pWmtVclFuQ212TU5rTUVRcmFrbmFjM2N5VUQ2akJE?=
 =?utf-8?B?dW1UcVFyL2dCY2pNVFh1M1NKS3RZOGt4VWpsRXRXaklmUWVoWVM3bjBRRWRQ?=
 =?utf-8?B?eHdMTmZ0ckluNTZIdlBpaXRvRVNhV2R1d1pIYzd6VGdGb3hoWFB5NzNZYXox?=
 =?utf-8?B?dzVVbFV1L09wU2lKTlRSY1oyQVVvS3FlMEdJRmp1Z1R5ejdkT1QxaU5PMzdn?=
 =?utf-8?B?bnFSazhXK0xBVXpONlgyWHVEZ2xoTGlhL2l5a1pBU295WTdNRFlISGlzZFlx?=
 =?utf-8?B?Z1ZwZE5WUFBWREkxMkRwYXdzVGhqOVZpQWFiRUNZSGtBWDhTWGV2Z0o2V1d3?=
 =?utf-8?B?ZU1JQkoxR2ZHbkorZkJ1VkozVGdYcEZtTXQ1VUt2NDQ0dXI0NHVhTUhwaitJ?=
 =?utf-8?B?c3J4Ukg5VGhGVnowQjZxSFNocTVWbXRxWUh0bzNTK05kS29FWC9ZNTMwdU54?=
 =?utf-8?Q?jsKhoIXfFco=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTg3d3FFVHE2RFJPRGlWQ2tNOTY4ZnZtNG9oVmk1blUwTFkyTFlvLzJLUzFQ?=
 =?utf-8?B?d2JLb2FpV2RLcEV6eC9JWXNScVJGZE5yWitpV25WZzlkWUg3dk1rVzlGdW5M?=
 =?utf-8?B?TE1Ic1lyRTlQU2pmRFVNM0htUjJmQzY4cmJtZ1JQc09peUZ5Z1VLWTBwUW8r?=
 =?utf-8?B?WGZFUWVQYzJ6aDV4TFd6R204V2M2bjNCb2Y0U0NiODF5b1hKY1NlL3ArSk1H?=
 =?utf-8?B?eWcyRXpweGNMUW1tSUpPTFhOTi9TcERtcGgzT0pTOHF3c0s2cVJvdEF2WXFF?=
 =?utf-8?B?U0prWUM2Q0x5ak1IK2s3VHVBWVNQQ2t6dUhwRloxa2k1QWVyaG5YTWI3Vzkr?=
 =?utf-8?B?bUpoaFNBQm52R2lZOVF1ZWtwRjdSOFZSbkM0dzlPUXppdW5IZ1ExRkpwYk0r?=
 =?utf-8?B?ZzhKaUhmS1RMZFdZeHR3d0owYzc0M0RJS0pFOXVVMEM0MG5mcVJTM0w4SHRO?=
 =?utf-8?B?VlFVNjFsbVhZV1NhUHlOOU9HYk5URG1GNTFqT0dZcGMzdnBiN0tQSWo4S1lG?=
 =?utf-8?B?MndONnFzaXVCLzRLazBtU0lWWDFBS2srNGRnaS90TzhSalZoZXAvdmZqcXRk?=
 =?utf-8?B?WkJLcll5WDQyRGRpNXlOVjZKYmJtUjlNZDVNeVRMY2hGdEtkNnc2aXlSaDU3?=
 =?utf-8?B?d0tMeVF2TFFyMHNmQVZTQzJRbE1HOElOWnVXOHdjVEdtdVkwMW4xWExKOGJl?=
 =?utf-8?B?R2JaMG54ZW54S2U2YVZMTG51QTlEUndBcTFGU2pEMGViYXlQbkx4c0ZLTll6?=
 =?utf-8?B?OWxlSW9EbDZ1ZFFGcGNFZU5PMVRIUHcrZ2tndmlBeHVjKy9zeVBTU3ptckEv?=
 =?utf-8?B?aSs2aXF6eGxVQTd0Tm9EdE9YZEZidmVpYlp5RzFHS0JoaHFZcktQUzRwdGt6?=
 =?utf-8?B?U3dYZExlZHpscVpLL1pFWU1yR2RzS2JTNHFHa2dISWk3OG9JbHF0b25qdHBV?=
 =?utf-8?B?RWxGUjk3cjNRcXhISlYvbWtPTitCS2NTNHZHU1IvMFdOMVJWSlFuYmtIY3FS?=
 =?utf-8?B?WlVibnBWZWFDaE1oNHNMUEhwZ2VjTnByMEcrSGF1WHRpVUFPK2FDeE14TjZS?=
 =?utf-8?B?TlN0TnREYlhkKysxdGk1Mm9MSlNoSGJ0QXBRcmNaQWZ5Kzk1WHl0VlFuNzF5?=
 =?utf-8?B?YjhTY3lXbFh4aW9hd2ZISGg1dW5JRWU2T1dZMmo0akh5aUF0c3N6bnZuZmNU?=
 =?utf-8?B?clR0Wkp2ZjRkbXdRTlZNaDFCZmcxdDJraUtDMUk5VTlaamxrZFZRdTYrN0Nm?=
 =?utf-8?B?WCtyYkhRRGd0aWFtOVZJbmkrMHpNYVVlbWFYNnVCNUZpd3R5ZnJGYnhuMnFE?=
 =?utf-8?B?QlZ4MlBndGc3UmgxMmNpYWJjZVQreWxPUVdGMlFHUE93NFpmbjI4TU1DZkd1?=
 =?utf-8?B?ZjBLa3VyZVhUWkRvdm41RWJhZ3ZKanVJSHNWNy8rRjRGa0ZXQ1RpTSs2eUU0?=
 =?utf-8?B?alBCVUJzSk9IWHJnWUtwQ0gveTJvTkxPZzJkK3d3Nlpib203VlE2RmExdWJE?=
 =?utf-8?B?cDdDNllHRXhBZEZxdVA0ZDZrU3cyZnBWTUxIc3VBUktuTnRaVEcxK0dlUTJO?=
 =?utf-8?B?Z29SOWNKenpUaUdRWGdYUHJIZHQ0bUt0MXd3WUdqNE4waWNtMm50R1NmTUE1?=
 =?utf-8?B?Ym56bm1YQStIMVM4K3RJNSszVDN2amYvS05mZkZVWnZzQmVKNTFkMU9YNGtG?=
 =?utf-8?B?V0ZzaUpPbkw2Q0Z0WWRuamlPR1VxS1BSaVRRMy9mTFREMjZ2Sm01NTJuNW8y?=
 =?utf-8?B?ZzN0cFc0TWJ6aEdxSGxHZC9leDNCK3hlZXFxRFgwbklPQ0R6SU9RZkxwRzBk?=
 =?utf-8?B?N01Ta1dGejdpaHhnbEdkakg2WGdnWWJSYkRqRzdWamJZd2kzRmtBa1hReHNw?=
 =?utf-8?B?R3Z2K1dDZVZORGhXSE40aDgyeFVhbUFYY1RKcVpvVjBDTFExdW1lY2ZaMDlN?=
 =?utf-8?B?VlZoMGtIZjNNenMzYkdqSXpqd0FlU1k4cnNnMHRxRTRWcHltbWRlZlZIMnNE?=
 =?utf-8?B?dW5qNFJ1bFlxR2FtaERzcUNqalNqeE5MSlpjRTVGUGZPcHB3WFo1L1g3cGRk?=
 =?utf-8?B?VjFheHA0d1l1b3QzL2hMMVZsNHF6ZWZSSXJFV01DSFRuMit3MkI4emd5TDVG?=
 =?utf-8?Q?DWTG0WT3rcNlPNytWBMbdlFud?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49140db4-89a4-4eb4-95b8-08ddba8a6c04
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:36:23.8372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ePXQGNkxVlFpWapSODP2UKzbZOXcZbNyrgkNtDYH9SFEdvqpDb60XJDBZczZXVXHheUgTkDDjy+Il8qFXxvMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142

Change the code to add support for MIGRATE_VMA_SELECT_COMPOUND
and appropriately handling page sizes in the migrate/evict
code paths.

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: "Jérôme Glisse" <jglisse@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Jane Chu <jane.chu@oracle.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Donet Tom <donettom@linux.ibm.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 246 +++++++++++++++++--------
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   6 +-
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
 3 files changed, 178 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index ca4932a150e3..92b8877d8735 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -83,9 +83,15 @@ struct nouveau_dmem {
 	struct list_head chunks;
 	struct mutex mutex;
 	struct page *free_pages;
+	struct folio *free_folios;
 	spinlock_t lock;
 };
 
+struct nouveau_dmem_dma_info {
+	dma_addr_t dma_addr;
+	size_t size;
+};
+
 static struct nouveau_dmem_chunk *nouveau_page_to_chunk(struct page *page)
 {
 	return container_of(page_pgmap(page), struct nouveau_dmem_chunk,
@@ -112,10 +118,16 @@ static void nouveau_dmem_page_free(struct page *page)
 {
 	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(page);
 	struct nouveau_dmem *dmem = chunk->drm->dmem;
+	struct folio *folio = page_folio(page);
 
 	spin_lock(&dmem->lock);
-	page->zone_device_data = dmem->free_pages;
-	dmem->free_pages = page;
+	if (folio_order(folio)) {
+		folio_set_zone_device_data(folio, dmem->free_folios);
+		dmem->free_folios = folio;
+	} else {
+		page->zone_device_data = dmem->free_pages;
+		dmem->free_pages = page;
+	}
 
 	WARN_ON(!chunk->callocated);
 	chunk->callocated--;
@@ -139,20 +151,28 @@ static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
 	}
 }
 
-static int nouveau_dmem_copy_one(struct nouveau_drm *drm, struct page *spage,
-				struct page *dpage, dma_addr_t *dma_addr)
+static int nouveau_dmem_copy_folio(struct nouveau_drm *drm,
+				   struct folio *sfolio, struct folio *dfolio,
+				   struct nouveau_dmem_dma_info *dma_info)
 {
 	struct device *dev = drm->dev->dev;
+	struct page *dpage = folio_page(dfolio, 0);
+	struct page *spage = folio_page(sfolio, 0);
 
-	lock_page(dpage);
+	folio_lock(dfolio);
 
-	*dma_addr = dma_map_page(dev, dpage, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
-	if (dma_mapping_error(dev, *dma_addr))
+	dma_info->dma_addr = dma_map_page(dev, dpage, 0, page_size(dpage),
+					DMA_BIDIRECTIONAL);
+	dma_info->size = page_size(dpage);
+	if (dma_mapping_error(dev, dma_info->dma_addr))
 		return -EIO;
 
-	if (drm->dmem->migrate.copy_func(drm, 1, NOUVEAU_APER_HOST, *dma_addr,
-					 NOUVEAU_APER_VRAM, nouveau_dmem_page_addr(spage))) {
-		dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	if (drm->dmem->migrate.copy_func(drm, folio_nr_pages(sfolio),
+					 NOUVEAU_APER_HOST, dma_info->dma_addr,
+					 NOUVEAU_APER_VRAM,
+					 nouveau_dmem_page_addr(spage))) {
+		dma_unmap_page(dev, dma_info->dma_addr, page_size(dpage),
+					DMA_BIDIRECTIONAL);
 		return -EIO;
 	}
 
@@ -165,21 +185,38 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	struct nouveau_dmem *dmem = drm->dmem;
 	struct nouveau_fence *fence;
 	struct nouveau_svmm *svmm;
-	struct page *spage, *dpage;
-	unsigned long src = 0, dst = 0;
-	dma_addr_t dma_addr = 0;
+	struct page *dpage;
 	vm_fault_t ret = 0;
 	struct migrate_vma args = {
 		.vma		= vmf->vma,
-		.start		= vmf->address,
-		.end		= vmf->address + PAGE_SIZE,
-		.src		= &src,
-		.dst		= &dst,
 		.pgmap_owner	= drm->dev,
 		.fault_page	= vmf->page,
-		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
+		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
+				  MIGRATE_VMA_SELECT_COMPOUND,
+		.src = NULL,
+		.dst = NULL,
 	};
-
+	unsigned int order, nr;
+	struct folio *sfolio, *dfolio;
+	struct nouveau_dmem_dma_info dma_info;
+
+	sfolio = page_folio(vmf->page);
+	order = folio_order(sfolio);
+	nr = 1 << order;
+
+	if (order)
+		args.flags |= MIGRATE_VMA_SELECT_COMPOUND;
+
+	args.start = ALIGN_DOWN(vmf->address, (1 << (PAGE_SHIFT + order)));
+	args.vma = vmf->vma;
+	args.end = args.start + (PAGE_SIZE << order);
+	args.src = kcalloc(nr, sizeof(*args.src), GFP_KERNEL);
+	args.dst = kcalloc(nr, sizeof(*args.dst), GFP_KERNEL);
+
+	if (!args.src || !args.dst) {
+		ret = VM_FAULT_OOM;
+		goto err;
+	}
 	/*
 	 * FIXME what we really want is to find some heuristic to migrate more
 	 * than just one page on CPU fault. When such fault happens it is very
@@ -190,20 +227,26 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	if (!args.cpages)
 		return 0;
 
-	spage = migrate_pfn_to_page(src);
-	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
-		goto done;
-
-	dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma, vmf->address);
-	if (!dpage)
+	if (order)
+		dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER | __GFP_ZERO,
+					order, vmf->vma, vmf->address), 0);
+	else
+		dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma,
+					vmf->address);
+	if (!dpage) {
+		ret = VM_FAULT_OOM;
 		goto done;
+	}
 
-	dst = migrate_pfn(page_to_pfn(dpage));
+	args.dst[0] = migrate_pfn(page_to_pfn(dpage));
+	if (order)
+		args.dst[0] |= MIGRATE_PFN_COMPOUND;
+	dfolio = page_folio(dpage);
 
-	svmm = spage->zone_device_data;
+	svmm = folio_zone_device_data(sfolio);
 	mutex_lock(&svmm->mutex);
 	nouveau_svmm_invalidate(svmm, args.start, args.end);
-	ret = nouveau_dmem_copy_one(drm, spage, dpage, &dma_addr);
+	ret = nouveau_dmem_copy_folio(drm, sfolio, dfolio, &dma_info);
 	mutex_unlock(&svmm->mutex);
 	if (ret) {
 		ret = VM_FAULT_SIGBUS;
@@ -213,19 +256,33 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	nouveau_fence_new(&fence, dmem->migrate.chan);
 	migrate_vma_pages(&args);
 	nouveau_dmem_fence_done(&fence);
-	dma_unmap_page(drm->dev->dev, dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(drm->dev->dev, dma_info.dma_addr, PAGE_SIZE,
+				DMA_BIDIRECTIONAL);
 done:
 	migrate_vma_finalize(&args);
+err:
+	kfree(args.src);
+	kfree(args.dst);
 	return ret;
 }
 
+static void nouveau_dmem_folio_split(struct folio *head, struct folio *tail)
+{
+	if (tail == NULL)
+		return;
+	tail->pgmap = head->pgmap;
+	folio_set_zone_device_data(tail, folio_zone_device_data(head));
+}
+
 static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
 	.page_free		= nouveau_dmem_page_free,
 	.migrate_to_ram		= nouveau_dmem_migrate_to_ram,
+	.folio_split		= nouveau_dmem_folio_split,
 };
 
 static int
-nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
+nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
+			 bool is_large)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct resource *res;
@@ -274,16 +331,21 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	pfn_first = chunk->pagemap.range.start >> PAGE_SHIFT;
 	page = pfn_to_page(pfn_first);
 	spin_lock(&drm->dmem->lock);
-	for (i = 0; i < DMEM_CHUNK_NPAGES - 1; ++i, ++page) {
-		page->zone_device_data = drm->dmem->free_pages;
-		drm->dmem->free_pages = page;
+
+	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) || !is_large) {
+		for (i = 0; i < DMEM_CHUNK_NPAGES - 1; ++i, ++page) {
+			page->zone_device_data = drm->dmem->free_pages;
+			drm->dmem->free_pages = page;
+		}
 	}
+
 	*ppage = page;
 	chunk->callocated++;
 	spin_unlock(&drm->dmem->lock);
 
-	NV_INFO(drm, "DMEM: registered %ldMB of device memory\n",
-		DMEM_CHUNK_SIZE >> 20);
+	NV_INFO(drm, "DMEM: registered %ldMB of %sdevice memory %lx %lx\n",
+		DMEM_CHUNK_SIZE >> 20, is_large ? "THP " : "", pfn_first,
+		nouveau_dmem_page_addr(page));
 
 	return 0;
 
@@ -298,27 +360,37 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 }
 
 static struct page *
-nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
+nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct page *page = NULL;
+	struct folio *folio = NULL;
 	int ret;
+	unsigned int order = 0;
 
 	spin_lock(&drm->dmem->lock);
-	if (drm->dmem->free_pages) {
+	if (is_large && drm->dmem->free_folios) {
+		folio = drm->dmem->free_folios;
+		drm->dmem->free_folios = folio_zone_device_data(folio);
+		chunk = nouveau_page_to_chunk(page);
+		chunk->callocated++;
+		spin_unlock(&drm->dmem->lock);
+		order = DMEM_CHUNK_NPAGES;
+	} else if (!is_large && drm->dmem->free_pages) {
 		page = drm->dmem->free_pages;
 		drm->dmem->free_pages = page->zone_device_data;
 		chunk = nouveau_page_to_chunk(page);
 		chunk->callocated++;
 		spin_unlock(&drm->dmem->lock);
+		folio = page_folio(page);
 	} else {
 		spin_unlock(&drm->dmem->lock);
-		ret = nouveau_dmem_chunk_alloc(drm, &page);
+		ret = nouveau_dmem_chunk_alloc(drm, &page, is_large);
 		if (ret)
 			return NULL;
 	}
 
-	zone_device_page_init(page);
+	init_zone_device_folio(folio, order);
 	return page;
 }
 
@@ -369,12 +441,12 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 {
 	unsigned long i, npages = range_len(&chunk->pagemap.range) >> PAGE_SHIFT;
 	unsigned long *src_pfns, *dst_pfns;
-	dma_addr_t *dma_addrs;
+	struct nouveau_dmem_dma_info *dma_info;
 	struct nouveau_fence *fence;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
-	dma_addrs = kvcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL | __GFP_NOFAIL);
+	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
 
 	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
 			npages);
@@ -382,17 +454,28 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	for (i = 0; i < npages; i++) {
 		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
 			struct page *dpage;
+			struct folio *folio = page_folio(
+				migrate_pfn_to_page(src_pfns[i]));
+			unsigned int order = folio_order(folio);
+
+			if (src_pfns[i] & MIGRATE_PFN_COMPOUND) {
+				dpage = folio_page(
+						folio_alloc(
+						GFP_HIGHUSER_MOVABLE, order), 0);
+			} else {
+				/*
+				 * _GFP_NOFAIL because the GPU is going away and there
+				 * is nothing sensible we can do if we can't copy the
+				 * data back.
+				 */
+				dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
+			}
 
-			/*
-			 * _GFP_NOFAIL because the GPU is going away and there
-			 * is nothing sensible we can do if we can't copy the
-			 * data back.
-			 */
-			dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
 			dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
-			nouveau_dmem_copy_one(chunk->drm,
-					migrate_pfn_to_page(src_pfns[i]), dpage,
-					&dma_addrs[i]);
+			nouveau_dmem_copy_folio(chunk->drm,
+				page_folio(migrate_pfn_to_page(src_pfns[i])),
+				page_folio(dpage),
+				&dma_info[i]);
 		}
 	}
 
@@ -403,8 +486,9 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	kvfree(src_pfns);
 	kvfree(dst_pfns);
 	for (i = 0; i < npages; i++)
-		dma_unmap_page(chunk->drm->dev->dev, dma_addrs[i], PAGE_SIZE, DMA_BIDIRECTIONAL);
-	kvfree(dma_addrs);
+		dma_unmap_page(chunk->drm->dev->dev, dma_info[i].dma_addr,
+				dma_info[i].size, DMA_BIDIRECTIONAL);
+	kvfree(dma_info);
 }
 
 void
@@ -607,31 +691,35 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 
 static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, unsigned long src,
-		dma_addr_t *dma_addr, u64 *pfn)
+		struct nouveau_dmem_dma_info *dma_info, u64 *pfn)
 {
 	struct device *dev = drm->dev->dev;
 	struct page *dpage, *spage;
 	unsigned long paddr;
+	bool is_large = false;
 
 	spage = migrate_pfn_to_page(src);
 	if (!(src & MIGRATE_PFN_MIGRATE))
 		goto out;
 
-	dpage = nouveau_dmem_page_alloc_locked(drm);
+	is_large = src & MIGRATE_PFN_COMPOUND;
+	dpage = nouveau_dmem_page_alloc_locked(drm, is_large);
 	if (!dpage)
 		goto out;
 
 	paddr = nouveau_dmem_page_addr(dpage);
 	if (spage) {
-		*dma_addr = dma_map_page(dev, spage, 0, page_size(spage),
+		dma_info->dma_addr = dma_map_page(dev, spage, 0, page_size(spage),
 					 DMA_BIDIRECTIONAL);
-		if (dma_mapping_error(dev, *dma_addr))
+		dma_info->size = page_size(spage);
+		if (dma_mapping_error(dev, dma_info->dma_addr))
 			goto out_free_page;
-		if (drm->dmem->migrate.copy_func(drm, 1,
-			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST, *dma_addr))
+		if (drm->dmem->migrate.copy_func(drm, folio_nr_pages(page_folio(spage)),
+			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST,
+			dma_info->dma_addr))
 			goto out_dma_unmap;
 	} else {
-		*dma_addr = DMA_MAPPING_ERROR;
+		dma_info->dma_addr = DMA_MAPPING_ERROR;
 		if (drm->dmem->migrate.clear_func(drm, page_size(dpage),
 			NOUVEAU_APER_VRAM, paddr))
 			goto out_free_page;
@@ -645,7 +733,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 	return migrate_pfn(page_to_pfn(dpage));
 
 out_dma_unmap:
-	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(dev, dma_info->dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
 out_free_page:
 	nouveau_dmem_page_free_locked(drm, dpage);
 out:
@@ -655,27 +743,33 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 
 static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, struct migrate_vma *args,
-		dma_addr_t *dma_addrs, u64 *pfns)
+		struct nouveau_dmem_dma_info *dma_info, u64 *pfns)
 {
 	struct nouveau_fence *fence;
 	unsigned long addr = args->start, nr_dma = 0, i;
+	unsigned long order = 0;
 
-	for (i = 0; addr < args->end; i++) {
+	for (i = 0; addr < args->end; ) {
+		struct folio *folio;
+
+		folio = page_folio(migrate_pfn_to_page(args->dst[i]));
+		order = folio_order(folio);
 		args->dst[i] = nouveau_dmem_migrate_copy_one(drm, svmm,
-				args->src[i], dma_addrs + nr_dma, pfns + i);
-		if (!dma_mapping_error(drm->dev->dev, dma_addrs[nr_dma]))
+				args->src[i], dma_info + nr_dma, pfns + i);
+		if (!dma_mapping_error(drm->dev->dev, dma_info[nr_dma].dma_addr))
 			nr_dma++;
-		addr += PAGE_SIZE;
+		i += 1 << order;
+		addr += (1 << order) * PAGE_SIZE;
 	}
 
 	nouveau_fence_new(&fence, drm->dmem->migrate.chan);
 	migrate_vma_pages(args);
 	nouveau_dmem_fence_done(&fence);
-	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
+	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i, order);
 
 	while (nr_dma--) {
-		dma_unmap_page(drm->dev->dev, dma_addrs[nr_dma], PAGE_SIZE,
-				DMA_BIDIRECTIONAL);
+		dma_unmap_page(drm->dev->dev, dma_info[nr_dma].dma_addr,
+				dma_info[nr_dma].size, DMA_BIDIRECTIONAL);
 	}
 	migrate_vma_finalize(args);
 }
@@ -689,20 +783,24 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 {
 	unsigned long npages = (end - start) >> PAGE_SHIFT;
 	unsigned long max = min(SG_MAX_SINGLE_ALLOC, npages);
-	dma_addr_t *dma_addrs;
 	struct migrate_vma args = {
 		.vma		= vma,
 		.start		= start,
 		.pgmap_owner	= drm->dev,
-		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM
+				  | MIGRATE_VMA_SELECT_COMPOUND,
 	};
 	unsigned long i;
 	u64 *pfns;
 	int ret = -ENOMEM;
+	struct nouveau_dmem_dma_info *dma_info;
 
 	if (drm->dmem == NULL)
 		return -ENODEV;
 
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+		max = max(HPAGE_PMD_NR, max);
+
 	args.src = kcalloc(max, sizeof(*args.src), GFP_KERNEL);
 	if (!args.src)
 		goto out;
@@ -710,8 +808,8 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	if (!args.dst)
 		goto out_free_src;
 
-	dma_addrs = kmalloc_array(max, sizeof(*dma_addrs), GFP_KERNEL);
-	if (!dma_addrs)
+	dma_info = kmalloc_array(max, sizeof(*dma_info), GFP_KERNEL);
+	if (!dma_info)
 		goto out_free_dst;
 
 	pfns = nouveau_pfns_alloc(max);
@@ -729,7 +827,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 			goto out_free_pfns;
 
 		if (args.cpages)
-			nouveau_dmem_migrate_chunk(drm, svmm, &args, dma_addrs,
+			nouveau_dmem_migrate_chunk(drm, svmm, &args, dma_info,
 						   pfns);
 		args.start = args.end;
 	}
@@ -738,7 +836,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 out_free_pfns:
 	nouveau_pfns_free(pfns);
 out_free_dma:
-	kfree(dma_addrs);
+	kfree(dma_info);
 out_free_dst:
 	kfree(args.dst);
 out_free_src:
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 6fa387da0637..b8a3378154d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -921,12 +921,14 @@ nouveau_pfns_free(u64 *pfns)
 
 void
 nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-		 unsigned long addr, u64 *pfns, unsigned long npages)
+		 unsigned long addr, u64 *pfns, unsigned long npages,
+		 unsigned int page_shift)
 {
 	struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
 
 	args->p.addr = addr;
-	args->p.size = npages << PAGE_SHIFT;
+	args->p.size = npages << page_shift;
+	args->p.page = page_shift;
 
 	mutex_lock(&svmm->mutex);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.h b/drivers/gpu/drm/nouveau/nouveau_svm.h
index e7d63d7f0c2d..3fd78662f17e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.h
@@ -33,7 +33,8 @@ void nouveau_svmm_invalidate(struct nouveau_svmm *svmm, u64 start, u64 limit);
 u64 *nouveau_pfns_alloc(unsigned long npages);
 void nouveau_pfns_free(u64 *pfns);
 void nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-		      unsigned long addr, u64 *pfns, unsigned long npages);
+		      unsigned long addr, u64 *pfns, unsigned long npages,
+		      unsigned int page_shift);
 #else /* IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM) */
 static inline void nouveau_svm_init(struct nouveau_drm *drm) {}
 static inline void nouveau_svm_fini(struct nouveau_drm *drm) {}
-- 
2.49.0


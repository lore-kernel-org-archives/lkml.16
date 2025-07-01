Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37B22AE68
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352621; cv=fail; b=rcD8FUkckS8p8edOyUh+c+Pq55sqVbcDx68yEABo5Bqoz/mPU2H13vwMu69QGRuT77mk86QzmP/+hAePymtYtsh5ovk3uG/SWvgEakC9UXu4mvzovT5g8tTOWaIM/fIYrl5nsWFE5qyR4Dd38oPsR5RY2bBZD4TqrNB8eIdK1lE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352621; c=relaxed/simple;
	bh=ZNsBw0eUNAPSSURMLbvHLLUY9ZJj/Kz465uZ9t/TDg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Kn9X/a4dk9p+D87hsJSbSBC2CiMwy8i3KHfk1YDemtJCNGZ8XfBqJGOx0YeEGrDRZttjqzcAtk2SnUKaB29Pgv8GRxUKm3c2mmLyzTUmqMA8RnztE9nhCNjP0mLTQsuUuGEFi+jvMVfydImaPpFeHfJVr8MBIXjo8Co9wa30uDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bez2bj36; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IU+q84U/; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bez2bj36";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IU+q84U/"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5611NvYL013649;
	Tue, 1 Jul 2025 06:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=C3XkS9/rifxSV4kfJI
	ev+gD2HLkY3BvOVxcTh9xygg8=; b=bez2bj36tEE1oRvej1WAB3HcZotdke0aP3
	yWwbMPperylhpo3LlsZr1FtQjkU6vynDH+jgjbwwPc7uiTEKoO2QVr6cCa99p9jT
	pZKbyYhsoqRMem1MnkJswmaJh91tEfZbPFPE0LxzFzrvTqfcciWOHP2EH2ehB55M
	aA8fQU71Vr5/0ILdkUnjVBHn2svHmuPjpebOhI53isvoC3ZlAcoZeZF05xyVHG8a
	9pUNjBqr6cXBopQwh+XsaaJnn4PDjmBmr1xiZcXQQqmO4pK/t7cYQD4oG1mSJizl
	KplcOmx12XmBO9eh7bbt6lEweoBVu31FW+kyMscrk/ktSwSEEtOw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tfc184-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 06:50:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56154hYg029956;
	Tue, 1 Jul 2025 06:50:05 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u9b9u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 06:50:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxNI639zMPKceHvfMgsqWL3nzM+XFhIwrH+GV0Hh92Sa5sFQj4ByLW2DSZrxOwJ4RmEJh/Fw9Qa5LG8dKpaQI9havZbNimWMpvLOOy6Bh43It+eFto3Cq2V19d2uUlDw145DWctJ8KEoK6/FRagduXPRzLDw/EOyR5OhyOeJlJZEsePrWExwAYetBtG2JC0nGiqHHadaZ8QN6emMatyqIfu6W32G4F8qPr0/roGQxFoV57Dh1aXCvRjIp/spxt+b+8VUS7WKKy5BZVl4bKtxqQHm3mSw2eeZUOgbLME05f9sTb9Y4ZA5pTCXiG8ZSVZ3x1shrC4kK0PszsA5IDhdOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3XkS9/rifxSV4kfJIev+gD2HLkY3BvOVxcTh9xygg8=;
 b=dqLDn/7U2Ku9RZvbZp9bPrF7f5m1VjmA1Z/VyZvzX3HUsW0YlUC0aAN5rhgCz8UR9vc71KBfYqEA6vaY3KpaWgN5aDChVOcknaXfPz08nWftcTUWi6J6jzkbXcvSvAibUW79NejXFRBAbZN2FvCnAV9SeGxwTx0Gdv3RIKSnQVoPoYAXl1zUnLzr28Stzm+TeRzDCvm+hgvSegOHDShkvcjiaIkiieo04JZksvHxW/k0n4+BSLHfSjKEGIGHFZc/fyPxzsHKoJNzr2faplt9GIAAel7KFI2f1oyI07oPYfcf4kjKGvOFvC7CGBIpos7nF8x6XHSNmfYSVE9Wf5KGZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3XkS9/rifxSV4kfJIev+gD2HLkY3BvOVxcTh9xygg8=;
 b=IU+q84U/z4i9Com9AuMfHbB4Ot7zXinbbajhAMOXbBfsSNWQ57JPMzPpH8KNo6/hy1fFlOlbKX/aSAFGUIyJPGv6cFIue5h2J4sxBMmbybg9/gba4casSlQ53zmfIv6xFXv9eCzelWeuncvv1CoPmTttgAjzjEVefuMW4z7yDtc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB5858.namprd10.prod.outlook.com (2603:10b6:a03:421::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Tue, 1 Jul
 2025 06:50:03 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 06:50:02 +0000
Date: Tue, 1 Jul 2025 07:50:00 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: siddhartha@kenip.in, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        mgorman@suse.de, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] mm: limit THP alignment =?utf-8?Q?=E2=80=93_performan?=
 =?utf-8?Q?ce?= gain observed in AI inference workloads
Message-ID: <2e99712b-8dac-4762-9fc5-fe3ef569b65e@lucifer.local>
References: <4990838b-660d-46a2-b21c-67adcba61ff9@lucifer.local>
 <19714cae-6b73-43ec-af7a-1455196561d1@arm.com>
 <3ee2e7fea6f263aa884e3e715632b09f@kenip.in>
 <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
 <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
 <5816677a-705e-4a8f-b598-d74ff6198a02@arm.com>
 <ee92d6a9-529a-4ac5-b3d0-0ff4e9085786@lucifer.local>
 <e7152150-2f3e-4ad7-a6c5-f4b77e5c0e05@arm.com>
 <f746d3aa-17e7-4b42-9e08-97cdb2cad89b@lucifer.local>
 <80b849d4-faf3-47a9-8b8c-e8053299cfb2@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80b849d4-faf3-47a9-8b8c-e8053299cfb2@arm.com>
X-ClientProxiedBy: LO4P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: 578257fa-d56c-4728-4613-08ddb86b8169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cv4t5p7DR3RFdouFi47fxlnMD9iXTj47OsJhZTokFeFf8O8Vo0pxIijVbpPE?=
 =?us-ascii?Q?uASMl+xQnTGv4kjPpSa/dro0/G2K5/FC5OGM84DCHEB5oM8dsI/s3b6m1q8z?=
 =?us-ascii?Q?H4+joVpGhUG4bYD9aTkkZ6D6SksrqjmZiailLzVdseZEL768aOwGuuiNflTm?=
 =?us-ascii?Q?10CzBXh9Tlej4B2NxzyIWBQ+4IJjYY6hdaq+oSDK5ZagzfCb0SIQEVMZr5xK?=
 =?us-ascii?Q?U4IkECr9UYMxlSkjR/IybeMBxnYvOQ+JdYGTGE/57LxxN/wfuvXLVuNaB2wK?=
 =?us-ascii?Q?wuTlbYkf9ZevOQFHu0j562J42+ThoFHS5v9q+qB2WEFAMVBxjl2F6azQj1pH?=
 =?us-ascii?Q?tnFnmKceILRYl3FuqzPIJQKSwCo0eTmU2q0Br9R3GJ+bChQv4KhXcihAD9ZA?=
 =?us-ascii?Q?aLJ5/0oH69uTRXtpG+ERmLd37btAa5GUFt3MtsUjeRWhPW+8dJLQBMhlJKDf?=
 =?us-ascii?Q?WkvySY9lrqjqTKuYmJMa1gpsWhfnDJ7w6Qkxv1SgFjFAYNGYPvci9RhKRzcM?=
 =?us-ascii?Q?dp+g7KnmtDRFxpm6UGy5NRmEJwxNtF+FtRmu/8D0tIPoPiRsl47yHVLOIeSL?=
 =?us-ascii?Q?VAUznn1KJNyQCVjcrNI0ER1KNeHIPhRLgKx08VhOkXGRYfyf3AoBcShR+rDM?=
 =?us-ascii?Q?Nl0fYy5pw3b8kj8YcYCtp+fHfBcrRP+b1a1ga2ZFfiUsaq63pTtH4Vr1QBZx?=
 =?us-ascii?Q?8fn/k2OH+7P7FtaGDj5jU5mF2BZpsDLDUvzxHGXQWNWSdb8UAtAcriCtbIWb?=
 =?us-ascii?Q?QvdRdF4DjgPp2ALqUcm7VQm6vANK2sJcQQG+m4z83xvI9N6/+rA9aOQ4Zk7t?=
 =?us-ascii?Q?x+gUaxFzm0GV2kjmOykha2CNJ3ipTk2bax2dvj04Ku7wI2BwOyAcbZzo4HpX?=
 =?us-ascii?Q?j9WcPVNYvnCh8FnGzkHq9PPbNp/PdMW/NHc0Ot37jxgUcYROkv+I15ExnOPw?=
 =?us-ascii?Q?a3JYlpv94ftFNxHkulWlKhEgHj45Cv9fUC/8Gta32MHB/jkyDkmb1STrdzAz?=
 =?us-ascii?Q?sFOIdrrkHSBNa7I3bXqr5YLdM19Mw87bJzce8YuoaaTXRR1TRRxGdl1IK0i5?=
 =?us-ascii?Q?cvnFTo5Uc/Pgz3h2lYzoPdUphiRPxV7n9hZzvEOi6c3pIAlzNnZi6hmcsYez?=
 =?us-ascii?Q?7wXdhmfrxS0PFyZfY3nQ7xo6GY252yl1X6D/B7k6bTNqWMsXyUVeiqmixD7T?=
 =?us-ascii?Q?1qRmLNZsfrJ5pNNFuBXojjlEAOV5Ojngxuq7gbvn8ywhRIe8Mc4hII/PHU6k?=
 =?us-ascii?Q?vEj95oM+hS+Yu2wPH4ROOKsqNBNkr45fCEvY4/YV/arzhCbCjYwChU8fEMc0?=
 =?us-ascii?Q?+PWcOM9lTzVlwzHFyRYUGvau5U1wD0+EVV/z85GAOqhmWa1h34mXDcI4EJiA?=
 =?us-ascii?Q?OgO8RCqyFHXffFjPCDAjKJUpbPQIQ3pSZDIvonhgqtXKH/Pnz5JuyFzmmqj2?=
 =?us-ascii?Q?g/e9lThLUvU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lly+JGmjNj+Zy+oC7y2YNMRIdVeZlBQLit9/NBU+H4j1ttJZrg7XfMeOLY7Q?=
 =?us-ascii?Q?IZUJlJOOjxPmqWvJl43iR/nCvzRCNZApfxBXMQ9N4AxjSDWETtcQpqOZoWzl?=
 =?us-ascii?Q?E/aFsLTEvM5l1ZaeVPuLUIo6CKRDH4kZ9YEnxOwKabAruRC38Sv+Wd3XCBZ7?=
 =?us-ascii?Q?EjsxMG+rYCUuby5RZjCwHbCdSDRCFxVkr0zeOHmDKzBE8INF9b08TsxWc/Mm?=
 =?us-ascii?Q?c2Az6crvN6rnZU7defFp5hUQ6qFwmnMZDYQ7NUoN15IbCaDQgB2DC6kPNR1v?=
 =?us-ascii?Q?jXjKJeNIes12SXwhhdXU9/z3fCryjVx4VBfNZtbzfsV7znQezFx+7JrSCKm1?=
 =?us-ascii?Q?92kCnBKPKq3HCs8jp2VbltV9VyyIvlaxYW1aLEPdPs4RREuZa4mIWOXNqP66?=
 =?us-ascii?Q?8kEOdF9RXrAIi3y8yDH2G9etq/bfcNMreIgaPlQJOf9nMHqhkw0lq62N4sMm?=
 =?us-ascii?Q?EGlPhuDyL8MLjvqfgWuXutjp4kxN+iiMaGQSqvS5gU9HLf5NRf7g7O1xxLhf?=
 =?us-ascii?Q?qF5ZLJ0s4HMmAU08yhPu82i/w7tz7vNs3uBYdgzZH1vnPrLDL24QW/w4zo6F?=
 =?us-ascii?Q?F2UoNcCSvg4B81RhZcA2HE4MsJ2tUYIho77JK+LuL2dBMr0ltS43gmfXeqhp?=
 =?us-ascii?Q?qIPIL+DmM488E0UBdS0AJywkEH0rGG8oIKDMJ0FVN0+24i7PT7Ss4yNXH6rk?=
 =?us-ascii?Q?lqszZiQch+N7S7ru1p0nkdQUirUjWjRyMiM9XaJ0ZL1pYsPsbVLz/BrI7y/U?=
 =?us-ascii?Q?ykKfZPzP/q5RfM7c2LZuIeAYIWBWqAfGzEBCzS/U+sNM+g3JzpJCOiQGfixV?=
 =?us-ascii?Q?IW9Cv39+HpX6csgwrPiokQ4xbv3uc7Fkso08ZOKI7Jz64i3ard0e+chqQDR+?=
 =?us-ascii?Q?H3qnsw3SYVKTnyATAukIoJAQgbvADWi63gcF1hwTxaFTZzESfB+Z+XPxr0gW?=
 =?us-ascii?Q?8HVkyPCWnJGw93oM58LvzFS85MrJlkFQXgklmo5SFnLQxaj1z1ea+fZ/oqHM?=
 =?us-ascii?Q?blMAh14YkScZFV8954KrUN3c78gV1r2ufP4Dqku9cNJCjDplkMemK1msyBwu?=
 =?us-ascii?Q?68/cBeomkXxG5KvCiWyaJf6EZ7EX//RRnQ0L91ldrdjD2b7YudE+OCxbkhim?=
 =?us-ascii?Q?72Ohj1cylOaBA7QgkhO9GzroU3QrwKedWeDwknyYNIUs605IffXr1EMcj9ue?=
 =?us-ascii?Q?Yhqt84suooKPOZlx6+fHz5hozNKHLBKHwaN+viHVra/JglvWt+t+rhFTt62o?=
 =?us-ascii?Q?JeNPXYilk3XR13+7mvRja9syBBllPcenpXfaYZr2k7YbijcdtzyJK5fNHyh9?=
 =?us-ascii?Q?lgoX2RZ5qxhlmqjifJfWrfgKC6tu/L7vNTHgFjC6ckckQAfZtx0nyIz7JrRc?=
 =?us-ascii?Q?MbFvFq83q14rKwda+aGP/wvFY/XQIPEvi7IAUzsFzbr62rehs2HK117SFg29?=
 =?us-ascii?Q?f69Y90DcVBUz4zMTzwDzShszeJYNsCMuX8eWg1Gi3hlS7AcFjwZET3YHH+K9?=
 =?us-ascii?Q?KaCDhNRMjrGD5VAAdXVlOAFZdbUCunGO17TPWjoJvfUYRJyfMQoNbzXicdHC?=
 =?us-ascii?Q?5SL2n7Yi+PCEDYnvj93jolFn9SfXcB+syKF/gfx8Jf6dmxVZJwLcCBma32lo?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4HFx+GzE5K5h2pqsHzssmWAEK2NSgEB2YTdJHti6N/+KxqpUdRFO1COmuOdtvVUMcmGTCraLkEhYtIQ1jkucA2Xuxp2JGi6ALJm7aC0Dq2UrGYoB69p0jvKeTobo7W2VcgrWtCRO4C9pQlgEHBpWRsaLgdw3lTwMA63I6xkvhhjtORsRS2KjpuLr2ah9y84qUZUcVSq7yAVFRs+DXVFbGlUD0miVROS7eTUIe4f3R0Gaa8hBbf9ySBEd9FyDzmjLkfL1mOc+Zq2WzJL+nq1pP0fmIzcJhRXL8z6DxRHcUl/yw0h9mLxPbLbP7i1EQPP8tbMSM39Au18DtA3eJ8vqGYV0MFAcRtyBZECySuM6b80QYlrvqZUcofmk8+CZ1LDNzykfGH9Zf30/NG6aR3kIVYNAJsjyLReFbA/TZpvE7eUHcY3u+io0ct7wjtPwNfqOQIpA7g/iBEIhXFD9rEX+f48AJ+8vGtoVI5IA+8rrZPjiwsLNX5Tounf3AuLWBIcdBx28nU5khe47x7jKlcdh0UTJ+h2D+4pE7MAuEXTXUulZOztvniPMPxwaSuY+tUL5htIp/fjeJxZ+JQD+cyGuYML2Akh25l9a1ysKgE5WFl4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 578257fa-d56c-4728-4613-08ddb86b8169
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 06:50:02.9246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iU03o0VxUkfjYllrRj0dP0vi3kkJQHszhxayih7nr2sHGaRw3q/chzaxfTxhpqLms0gFc7jWS1o9ZGgDnjYSq1hxscjK48yqUulOiyA9RrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5858
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=930 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507010037
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=6863851e cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=5KLPUuaC_9wA:10 a=GoEa3M9JfhUA:10 a=lbcwc7RSIa-RHK_cpL8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: j_-JSE2mGq6ZLZ2ACj7IAlbd8efARbhT
X-Proofpoint-ORIG-GUID: j_-JSE2mGq6ZLZ2ACj7IAlbd8efARbhT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAzNiBTYWx0ZWRfX8ltTCzk6vTvp bROnVMZR5HdgGzyaabGdoxRQ1lp7TWczmC2VgS8MkHG4IqtLMRqUS6oIthja0+vbhtc3rj6uwOD ZEf+I0K14GQAWOy31d44Bopg/CClM+x1gPoT0QhMSNiMh9hZuHdvgRtyEYa/sE7iCdt/sujt50J
 mYkk6qiCvjV29ymKfqS96GQB1Ukijovp8di/Ak7Lw1VwVoA9N26spUNLRMc/5VP4Jx41V6G3WbL 6xxiBBH+LHQ9azhyZIpGNOXDbn8EWeS9BvGvj05F97BJhY/UBS8Ysf0wvV8IwL0tAeHYgQrMD/o 3u+raiwj7/YCSW048sWsjrA9wGQGNyhDAKZMJ1lrsn8/6GEGmKqYVwn9ZYJsJ66TtpyBqycB1+S
 cOqVtOyaSprx3uYRu7v4rDHTUspT3Q9HNn2v2p8zWed8vzwFeGkVFTtCcW1K/k0Hdt2Vu+JP

On Tue, Jul 01, 2025 at 12:00:21PM +0530, Dev Jain wrote:
>
> On 01/07/25 11:23 am, Lorenzo Stoakes wrote:
> > On Tue, Jul 01, 2025 at 11:15:25AM +0530, Dev Jain wrote:
> > > Sorry I am not following, don't know in detail about the VMA merge stuff.
> > > Are you saying the after the patch, the VMAs will eventually get merged?
> > > Is it possible in the kernel to get a merge in the "future"; as I understand
> > > it only happens at mmap() time?
> > >
> > > Suppose before the patch, you have two consecutive VMAs between (PMD, 2*PMD) size.
> > > If they are able to get merged after the patch, why won't they be merged before the patch,
> > > since the VMA characteristics are the same?
> > >
> > >
> > Rik's patch aligned each to 2 MiB boundary. So you'd get gaps:
> >
> >
> >    0            2MB                 4MB           6MB                      8MB          10MB
> >    |-------------.------|            |-------------.------|                 |-------------.------|
> >    |             .      |		 |             .      |                 |             .      |
> >    |             .      |		 |             .      |                 |             .      |
> >    |-------------.------|		 |-------------.------|                 |-------------.------|
> >      huge mapped  4k m'd
>
> The effort to draw this is appreciated!
>
> I understood the alignment, what I am asking is this:
>
> In __get_unmapped_area(), we will return a THP-aligned addr from
> thp_get_unmapped_area_vmflags(). Now for the diagram you have
> drawn, suppose that before the patch, we first mmap() the
> 8MB-start chunk. Then we mmap the 4MB start chunk.
> We go to __mmap_region(), and we see that the 8MB-start chunk
> has mergeable characteristics, so we merge. So the gap goes away?

No because there's a gap, we only merge immedaitely adjacent VMAs. And obviously
gaps mean page tables wouldn't be adjacent either...

The get_unmmaped_area() would have otherwise given adjacent mappings. Vlasta's
patch means in this case we no longer bother trying to align these because their
_length_ isn't PMD aligned.

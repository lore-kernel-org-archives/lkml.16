Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93426EEC8;
	Tue, 20 May 2025 05:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747718667; cv=fail; b=L1OFAExj+Sk91OxeVH0GZjbPvhXLnaJYk6E+ZcaIs7VYGtR9g01tfVM9Oig6vmKVofcow9uOgRwXv15eM8NOrdrjVnu88hde3vY78yqU1SvhQAfAzhTRw2M1VUO9iyWzr6OfLpJS3LexLll7AQrge4CAvA0LoDUpEmmpRQeRP28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747718667; c=relaxed/simple;
	bh=waoGB+V3iZanI9uo/omvok2TkBjKXogecs0o4FyxSwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fxHm7FsXT+9yNfuRYLkFxD8NTkgjUZ71WPXQeVZVzC2OhPCrSCUI0agwQYBy0zdyThy1Psgts2fSbxI71pPzEY8hXRiZRq/y2WbE2TJFqAgE9XHIiyyMw1tv6+2DhyB9SDaEMHzb6Y6F8Pu+WOsBHNAS6orQFIVxva6UEAgDtLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qqVJob2P; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fNY9bVgp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qqVJob2P";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fNY9bVgp"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K1NH8s005807;
	Tue, 20 May 2025 05:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=9tD2dGqOO+GX9W/lw0slQe46fo+7qY377tCrhjvFWMw=; b=
	qqVJob2PE0b6gqpU6zATtI3YRnUE9TXDmyko2ZEZLL2iVNsGgSqtYKuXeE+9hI4+
	2GjHqqfn/c9SLArjQhrP3wGFLg7LCuaMOi4cdCrTUcKukTFawbMdoObeO+RLTxQ/
	T8yJT3jlnoopW521xsz/Od93rpGXjS+89rsIue2272DKmA2mfrjlcZYD6CK50v+r
	KncaviW3zF5Sz6qMc6Hxnuo/TX8Fy7rN7wgy+Hreb0CNhsHc0GhlixETo1iTZjCs
	BXYX4knsla/swZiS31tzbqIIMRj2PpZhHBsyNzLbzgT3M0cCO6q7t+zKi7AeVi/U
	muFi5yVe5nA1EwExClTELw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46rdcegcwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 05:23:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54K35ctw000841;
	Tue, 20 May 2025 05:23:37 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012051.outbound.protection.outlook.com [40.93.20.51])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46pgw7huj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 05:23:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwqAzfidodoPzEaD7LLxbxPR6LGn9Z46P7MI34pmo6G9lthqDx6eNGKLAqrlbJX2Q1Ev6CaoCr9NLg0+HsciBQFNsd/6ZYJv44JhWLieKQQPhrLHq/9VzCVL4/NAUOv5GKAiJq77JghGdqTRVuEHOZ7UcOXJIzwMTkor9H4R1VKQ49W3BRfmI9hVgagucamV0W3S0MkJCei0kFfMZfdz/d/K9VV7KKSPqGF+KejFv2WTBcgl4ybpWRJ/o/f7/2JbMPuAYJzlwvSBQfVbDmtI9KzsGAzEnORV/WfymcwyLD2rYsjgoHrWH7x0gD1c/Tq+fjzAZ3b41tHpeuB62B5qWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tD2dGqOO+GX9W/lw0slQe46fo+7qY377tCrhjvFWMw=;
 b=OeCk/oKqp7cmYMFXjt4IaVtY50a363h0lLiWLvnilIIU0dEZWRngTizHt7B+2hTRHcH59YPmihVKueHIx168cKbuRf2fdKBRInhca1ptzVjwuSUNcAvo6yexnzWinfHLVImpxQr+SI9hy/sfOelTgrfoyv6pB8YrM5w/1NYuHQ+gspWMs5Un4Dew5nfrABte4k6o2ozGoPU0cAlRnKqG1wVjPE5UAvSElotMWpMrUfhVjnvgSQ0Cp0fm22Sn7uqXHngFc7ejc3WK4Q+QGysxXkWBV597ar3r0kQ5zkWHUxk8W1uPlVMNCwiXtTixRnr3oyq1HQi7KTb1OrMTfcxeJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tD2dGqOO+GX9W/lw0slQe46fo+7qY377tCrhjvFWMw=;
 b=fNY9bVgp4tySR9VanB3ANHQXEIl8SA4PQR1vVfO4aHxZl/UwD8fBnbRn9H9nhVM2s8hYaDctmTQr7w9X6l3l34uElr3obukPl96Z8fz/225vF3LL7Dd4208JTC8ylcQDLsX4DBbbnpzp+fLrTKOZ0cJ97gtPQtw1gQnRnfNJQsU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA0PR10MB6796.namprd10.prod.outlook.com (2603:10b6:208:438::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 05:23:29 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 05:23:29 +0000
Date: Tue, 20 May 2025 06:23:27 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jann Horn <jannh@google.com>
Cc: Usama Arif <usamaarif642@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
        linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
        riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, vbabka@suse.cz,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 2/7] prctl: introduce PR_DEFAULT_MADV_HUGEPAGE for the
 process
Message-ID: <13d618ed-2cdb-4a5b-9dd4-189f65244a60@lucifer.local>
References: <20250519223307.3601786-1-usamaarif642@gmail.com>
 <20250519223307.3601786-3-usamaarif642@gmail.com>
 <CAG48ez2y_PP7Uba8uq_Y+auKRUHPcJ19Nnn15GAaVS=M4DC73g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez2y_PP7Uba8uq_Y+auKRUHPcJ19Nnn15GAaVS=M4DC73g@mail.gmail.com>
X-ClientProxiedBy: LO3P123CA0027.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA0PR10MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 116e63d9-28a2-47a9-4b9f-08dd975e74b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEpyTEl1K3RuT1FibFZab2xNN0JsWkd4SlUrN3p4Vi9PS3BpSURuelJsT2Fu?=
 =?utf-8?B?QXg3NDkwRWk5bkwvSjQ0aTdMTWhCN2RrYmN3c0VYaVlLTE1ydUVSckQxZGI1?=
 =?utf-8?B?NDJOeHR0dml4bWI1Q0t0VXkvYjFzYnJscTZPWWFSNnhkbmJrWG5SVE1oWFRT?=
 =?utf-8?B?cG44c3RSV051b0xJZUpCR0UxLzZuUGtjcnhvMWJ6SXAxZkI3U0p2cGxtSlJl?=
 =?utf-8?B?V05JN3NQa0o3Rmx1Q1VWRWpKcElZVW0rSXVpaFZHNThtZGlrT2J5YVI1ZmE1?=
 =?utf-8?B?Ym01M2tMNCtOc0lkTFVaN0F5YzZlYzY0akZObUdtT1gxTk00YjA1R0xaODFS?=
 =?utf-8?B?S2tqVWlpcEpTNDE4cmtONDFoeC9QcUc0OU9qaFkxREJvU01HU3N4OGFaQWRm?=
 =?utf-8?B?b29SM01YSVN5bkdUT0lEaVViRmJJUU56Q3RUb1dpOUIzdmdScUxCUjl6M01z?=
 =?utf-8?B?ZHdFaHM3aFQvcTFPYmJ5ZXNwb1B2SzRNSEZmTDdXaldHUkIxdlhlZElUWTNv?=
 =?utf-8?B?L3ZwVzY3RzJNUUdnQ2RQZSttQThtZzdZSWoyeFZvQ2pXVFd3Q3dVNGpmU3l5?=
 =?utf-8?B?UW0veGF2NHFNSjZJaVNCZklYRmNOa1IyZlVGUDlKYm5SNEpSMlJQdXlVa2tF?=
 =?utf-8?B?TTJRYXIrajBKMGl4NXRYOENPTWw4Zk1kSENabmZSL3hidVZqeXZIczBYVWMx?=
 =?utf-8?B?WEx2cUVDL1NneTNuYTZ2K1c0d05rZmVsaW82UWIzV2pXZk8yK0tkc3FycnM2?=
 =?utf-8?B?dHk2U1hTdG54dHA5cEt4SUNab2EwUk9SaUluclg3TTZtQlkxeGdIQko4S1h5?=
 =?utf-8?B?a09Ja2Z1YklhRzluUmc1SklPcDZobjkxNko0UHBEenBTMGl0T0x1WEJKZVFG?=
 =?utf-8?B?aklJU3JKbmU4NGtlWGU3cW9mMG5qZUZpekxHWEhKdVNjeFRiYmxNbW05bHBK?=
 =?utf-8?B?L1o5YmY2Rm54T3RtSmREcXZsVDZaalQwejdHQnd6NmVSSmc1SENYWEJVeHNh?=
 =?utf-8?B?SWRJeTlyM09sMmpxc1hydlB6OXRZNnpLb2x1SThuVzRMOEE2bndkY3FBY1p6?=
 =?utf-8?B?cy9WOFdQbkVBYVg1Wk1hK1pUZkxUdmZ0ZDdEcXk3VGxNOGNUKzZHd0xrRS96?=
 =?utf-8?B?bFl0YUZFUUh3a3NHaGZXQlhmK2R5WndaRnJQLzNKVURrSnRnc0E4SkxFQ2xz?=
 =?utf-8?B?NFlQZW91cnNQTU0vZ1NNbkNUTlYzYVB1bXdpY0dEV2o0WE96dVVBanQ4dDZq?=
 =?utf-8?B?L2VjOTZQWkF1aGo5ODN1L1JGOVJEbnUwVXlFWkc5QkxndTcrWmgxTXBrOTFn?=
 =?utf-8?B?QktoSWFyY3ljdXU5VDlDZG1teTg0SThQMkJJS3pBSG5Bd2NCa2ZEWFZlMWRq?=
 =?utf-8?B?dlV1Umw0VXNTNmtyNmpmQzJMREZqL2w4bTFkcGFvSXd5S2RNRTZURENxdDlx?=
 =?utf-8?B?WXgvcjdZTkVKQ1B5WHZsUUxiUUVPeituN292L1p6b2lKdkc4Y2w3ZlpJeFY3?=
 =?utf-8?B?RFBCdDZhTUJQYmQwUkZxd3B2eEluV2h6MDZwR2VaMmdLS3Z1cnUwTFJqRXR6?=
 =?utf-8?B?S0gxa1J4V3E5a0NDMkZ1L1RFV2dnV0l3M0JoYnowaGN2ZThCRGtYTzlTc3By?=
 =?utf-8?B?UUNDVCtnK0RWWTJnZTdLajhpSVYyRW5oWjVtVHpEZzV3UjRTYno1bERNVnNN?=
 =?utf-8?B?YzVOaVl3S2FWa0IvNHpSMjJpVHZHNjkvMGdFb0dlWkpuTVBVb09XTEUyWk5F?=
 =?utf-8?B?UE92aXlVZm1lSHpESExSZGZ6UVNhMjNVR2FKRERYSkJLOEtRVkJSTU1SeU9j?=
 =?utf-8?B?MFVtMGkvNUUyNDc1OWpzeUtoS0ZMZXdMdDV1b2FhaFRMdGptV3h1L1BURm4x?=
 =?utf-8?B?NXZuTDN1c1BhcWZvWFMxZElOYmhTOSsxOHNMaFdKamovaFVKaDZRZGRDb2o4?=
 =?utf-8?Q?Wj3op+oYM/8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmpqOWFlNUMwR0tXWmNyaXg3UDJXb25rU215OXpSbGdZeVdZb3lnajU2TUZQ?=
 =?utf-8?B?YlQ1Z3l6cXlqQ1RSZ0w4THNvY3NFam5ObmVkbTlyS1ptTWxINllSVlpSZUFz?=
 =?utf-8?B?NndsQ0NKaFJEcDNMOE11Tk9HVzJWOGo3QTVLUkpBS3UrQldyL0JmcWoyQWJs?=
 =?utf-8?B?aks3TjlPcWkzRU9wNVJXMFdyTS91WG5KVlo2TkpPMEFaWG5hdmdpa2pQRVM3?=
 =?utf-8?B?YXZTLy9UcDhqTk8wM0ttbndQRGNnZE85UHVrVDlwUkF1Rnl1R2dJWjdIL0pQ?=
 =?utf-8?B?MG94MnYwZW8wNjRFbUd3eFVDZ1NWN3NIZVY3Y1RNNGgwbVQvOGNlYUZ1dFVw?=
 =?utf-8?B?OERKQ0VDcDVHVjREVFEzdmRtaTExbDlreGkrZ2tUT0MrQXUzMlVOK2t0K3Jh?=
 =?utf-8?B?ZHhVK0F0YktueU01WlZBZ1VqS0ZnWU9vUisyQ2lpeG9rMGE4V01yNStqcnNI?=
 =?utf-8?B?NThiTTgzVDBoYmh1VnRWMTFUb3JOWEl1UlpObUdqUkpHeTZsNnBaRG9aVk1u?=
 =?utf-8?B?aFJOZEREYkpZVjVKNXNvcWxpQUkraFZlMFg0QUFVd0IyQWRBd0FEclNJdVR0?=
 =?utf-8?B?dUhyNWRBSG1uTldNNWJKWUtBdkRLUHpvTS9GU3B3Mm1rczhnajBzQUJVam1R?=
 =?utf-8?B?SEoxOXI5c2Z1TUh5b094QXlaZWV3ZGFpZDhVaDg5WG03YVhhN0lFV0p2WXJC?=
 =?utf-8?B?YjE5QWhreU8wemVnVWRJc0lXR1ZzaDM1WjEzZmdkQXllQTZWZ21TanpWN1Y2?=
 =?utf-8?B?Q2J5SDZvMFpETld3WE9UNDFHT2JpdSsyT2pVaDlUd053TmhvRllHZURmdnlR?=
 =?utf-8?B?MXBUbkpFUkVubkQxSWxGVXBudEMwYzltUStnbUh3THI3ekVjYzE0b3I3UW1u?=
 =?utf-8?B?MkR0TUpvaE9OZ1JPcjJkYlA3YjUxNDVIcXRPVkJrZVMzNEFXMnFIWmtPeHl2?=
 =?utf-8?B?dUZ6MWFvcys3cEtzOXlCOVBuU2VZZFBjZUZ6UFVEUklaTVFvS3I0bkNKU1Vu?=
 =?utf-8?B?d0ZIU2FXZ2FJcHp3blBEM21uM1phSDkwVHhIYWNiMG5vWFVUOXdDTDE5VjJC?=
 =?utf-8?B?NUVCRmFDOHN3bStnOUJzeDMrdDFuMllDZHdob2oraHZoT090NHdibUR0Ym05?=
 =?utf-8?B?Q2hrSWQvcTE2bHZwbWdNRG1ncklVK3psTE1kQ2xuakpuZWkvVEI3dUZaMGZL?=
 =?utf-8?B?bGp5U3ZKejRjTEFoNWd0VHVYMmFCVC83RFNjMDNRZHpyYkxJT2hFdlNDck81?=
 =?utf-8?B?V2htUmxTcWk5aWJtNE5SdWpkRUJkdG1JUU10b1h1ckJGSGR2b2JpdS9oZEo1?=
 =?utf-8?B?QVRuMmdHUkMxZmRxMWhlYVF5bWNwSjdrUnFTVnBEbXlBeDdiSjNLSXQrbENF?=
 =?utf-8?B?NUdxNVhteDd1ZzVVRmo1ZVVtb3lvdklLaGdZQ3hESnhRSFVoRE5Zd0lxUVd3?=
 =?utf-8?B?OGRjeWtEUjhDMTlKWk1hVWlrZkZ6Z3hRS2FYN1FRUy9vTEFCMTFOak1yR2Z3?=
 =?utf-8?B?U1VlN29UODRGUDdaSDJsSmJ5c3FYbnVXZGgrVFk1Qk93RFovL2VMZUxEemdE?=
 =?utf-8?B?MHJIV2QyRnV4b0QzQ3BHRXFMMlhUSWdDeGJXdmdlOVUxTjc5SzcvV2ZJbi95?=
 =?utf-8?B?Zmk0RzBtQ0dWeFRJdjl1dk0wZVUvUzBXWTdKa0xsNUQ3aDZvelY1dXEvVEwz?=
 =?utf-8?B?Q3BsUVJWSSs5RzB3bUtvSkNTTGJHVTA2MlI4Y25SZGtSTjVOUVV5M3MycXB6?=
 =?utf-8?B?NHlLNDk1UUUzQ1VzRWhsaVQ1cGxaa2ZHSjNSREJEaEJNb2lMajBHVzhJbjBC?=
 =?utf-8?B?UGlic0dxL2UvelRSTWJCZkVUcnlraGhJa0UvWFgrOU0wdENyejZLblFsSnFp?=
 =?utf-8?B?b2pSMm8vQ1hJMzczcGUyR29jQS9JN3ZnWmJmYnFLVzVSWFhOTlM4RUxodVVC?=
 =?utf-8?B?NzI4aVNFcmNNUnQyMXhZZWdXQUVYUHRoNHQyVHZrNTdvNWhnUXRYT0h5NXhz?=
 =?utf-8?B?ZlpYS3pxVm51ZVZ1SExMc0RadFdXMjNmOHZoUUhYQWxwcUdCcEdHeVY0NUJG?=
 =?utf-8?B?elFXdkMrbTVmZjJ1Ri9nVXlwUnVQV0lPSmwzRlRnMTZ3dXVCbi9BZ2JqRUt1?=
 =?utf-8?B?NGpoVDhWSktTenZuRkV0emZpZ1g5WkNCem0wcG1TQUJYT2szTWFwb05SU3Fm?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Pa/7I4jVE6Ebq5LU7azknc9tYei6UngTeqQ3IGzq6x7mvsunVFj3YDvOU5g8EdvYNAHiw4Qgo+vtgVhbFqz0tyqidioYiW8JqTKsgofyRtd2VMC/AUSuUjHdhxKsPnDkTR7FDbDLadbIUkJamgP27hQyndK163J54xQGPQEplG6RIcs+/p5DmjdLivqHm1brV5xtPtWzjApeYQZkeD8+HqIj45SAZ7eRvHuhicdG5nq3wAWmgSvVd1abDiKmy+J5fph+RWXxRIFPNhc9Qvyjg/1TwVpVVHFNwkkww3s2MAdAfjRN7HcvjFDbyu1Y5yKnU55gNLe6PFFcBvTlO+lAhar+xnUNQRCUVzTT3AAGY3GldPbQZnryT8bgGsXtGxxM2CHygvKQVrvNc0cZmN6BJa1I0cwxz7OdDGTmoy+Y0WJSES9rxyJXdQh/9THq0/6GWwLxNr6KfV+lnmpM4U5pypJMhYlmg1dYjhQGDiNA/Lw8Zj7J+96HRdMnLR2l+UR8cpn0EWmaerW8mQyyrxU606e+41yfBvrWVLmHp5QHYneFK8EpCIsQOnlWefoNh1TqE9TK85M9wuJd2KQYCMkemeAd9yLYIvc4DLeNp7ecGAw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 116e63d9-28a2-47a9-4b9f-08dd975e74b3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 05:23:29.7703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dti0eWG6Rk/MF1EDfMlPF+weTZ75zItvYFHJPJZh2nq5XtUbtdNAZN72OKheuwKiDPy+vZA/9GJOasxMhOdiC9S0iXKznvweuDIT4WB3Q5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6796
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0 mlxlogscore=684
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505200042
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA0MSBTYWx0ZWRfXwJb5tgeBhlY0 Tk2MS6RYfuLIif8LcRZIag8hZt3FzifT8DkW9Ggt/v+5Aohr2fqUScqIbfjyt3TDM/ppsl0hsqi Jpm6e/TwgbquYkPbUL2k7hjATHdsysXRY793dvANJCih9JJAecTqhZKM/DiO9GhFzxL+7eOZ7tg
 RAZnOXC5oDAsB2tVd9NW4bznGNnz5tFOZi53qdSaGp+aDJQAWEMvAePKtyh5nq36FY4G7JyvNQ/ kw1u+th4lhaNFlQIXARNOlZr0rvkn+OxLTMPApkqC3OAS5hjhdL7O6ayy4R65BRKnHsOfKHiqnH KoGArGt73RA7rELip8L/RwKM2mzpe0tOC10mKlektFY/1kTkTLSgY5uZVnOhUTK08L77ciNn1Mr
 /KIhyTiBCqyxARw0AkR/UvQknb8vPTnC1uTEtymO2QuBK0IwFvjFp0n0/x37pWwfAxbXlKRs
X-Authority-Analysis: v=2.4 cv=WO5/XmsR c=1 sm=1 tr=0 ts=682c11d9 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Oo03a0OyVYw7potaCC8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14694
X-Proofpoint-GUID: 9bh-CDwG1UAWxUb97g88pGVaOv-13EoT
X-Proofpoint-ORIG-GUID: 9bh-CDwG1UAWxUb97g88pGVaOv-13EoT

On Tue, May 20, 2025 at 01:01:38AM +0200, Jann Horn wrote:
> On Tue, May 20, 2025 at 12:33 AM Usama Arif <usamaarif642@gmail.com> wrote:
> > This is set via the new PR_SET_THP_POLICY prctl. It has 2 affects:
> > - It sets VM_HUGEPAGE and clears VM_NOHUGEPAGE on the default VMA flags
> >   (def_flags). This means that every new VMA will be considered for
> >   hugepage.
> > - Iterate through every VMA in the process and call hugepage_madvise
> >   on it, with MADV_HUGEPAGE policy.
> > The policy is inherited during fork+exec.
>
> As I replied to Lorenzo's series
> (https://lore.kernel.org/all/CAG48ez3-7EnBVEjpdoW7z5K0hX41nLQN5Wb65Vg-1p8DdXRnjg@mail.gmail.com/),
> it would be nice if you could avoid introducing new flags that have
> the combination of all the following properties:
>
> 1. persists across exec
> 2. not cleared on secureexec execution
> 3. settable without ns_capable(CAP_SYS_ADMIN)
> 4. settable without NO_NEW_PRIVS
>
> Flags that have all of these properties need to be reviewed extra
> carefully to see if there is any way they could impact the security of
> setuid binaries, for example by changing mmap() behavior in a way that
> makes addresses significantly more predictable.

Indeed, this series was meant to be as RFC as mine while we still figured this
out :) grr. Well, with the NACK it is - in effect - now an RFC.

Yes having something persistent like this is not great, the idea of
introducing this in my series was to provide an alternative generic version
of this approach that can be better controlled and isn't just a 'tacked on'
change specific to one company's needs but rather a more general idea of
'madvise() by default'.

I do wonder in this case, whether we need be so cautious however given the
_relatively_ safe nature of these flags?

I do absolutely agree we need to very carefully review whether:

1. It really even makes sense to do this
2. Any such restrictions need be made

I am weaker on the security side so very glad for your input here (thanks!)

I suspect probably we want ns_capable(CAP_SYS_ADMIN) _as a rule_ for this
kind of mm->def_flags change.

I also wanted to dig a little deeper into whether this was sensible as a
general approach.

I, however, do _very much_ prefer it to an mm->flags change (that'd
necessity a pre-requisite 'make mm->flags 64-bit on 32-bit kernels'
series anyway).

Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A2F246BC5;
	Tue,  1 Jul 2025 17:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751392756; cv=fail; b=W6g2EbKf9ASrdEtytC4RZKva4NSjQArAHfLY14zdR48qbQ4h9YoAiNgFAzsh1r9tb7xvwimbete2v0SkohkWOjwHJdYbW4enaiFXnPi/sC4OcJW21O+D9f9Qb8qstYIrzvtWo6Sa4i24ai06O4io8A98OA04L2GJPpgeLA6IVs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751392756; c=relaxed/simple;
	bh=jX6GXkg9CIlkYenynKd58TKRkAhssPrjcBjs5dscTxU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hhJLx4tLhuix1XLbRrwu3aEt04z2AEkyBxbrMp5F+kuNGkBp/jK2u7tanov/t+1MA6KNdQMxAjsl4R82uPr/X8ww3QmCebA+oFdgU/32ds2xwtu8e70tDYAaPCKGwzReNAk1oDGXveejNyHNPjeo52zY87l0EK5lfq8zWMzOmI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a2qlIw/a; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zBLPl7Mo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a2qlIw/a";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zBLPl7Mo"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561GfkKo027421;
	Tue, 1 Jul 2025 17:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=GqtniU29xs+s1Q0ZEx7JMj/CYby9kIfr6eZJkqz6Hhc=; b=
	a2qlIw/alHyP7ISjdHUR40sP4qM5Nz5OwvqeOXoLz+QcgTfK16WTJDM9XDRmEaB2
	p9h7BYAJg16E+qavMXSe52A443eqBBe7jz7kF9p5JFzWyP6tuu177vz4la0qyE9d
	40NQzy+6R6d7FWlVovdLGBHkL1g0aIBrTAqai8fwN6Lq7BW11rdTOQNy7zjAqYNU
	jcu8tmVQtwaGgDcoP8hUFI/fijC2ZQwm4D4kwkwjmNAXRmVw0PfCTbDCK1YAbon+
	uUAul8fpTyna2JYdOgKlk4KohrDEuGMChDUi6opUepLSiCIDG3jgOmMN5GL+rDlb
	TTkKFKFgR3VlCMfwcWo3pA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tfdadj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 17:58:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561HuLnj030260;
	Tue, 1 Jul 2025 17:58:46 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2064.outbound.protection.outlook.com [40.107.95.64])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ua5t3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 17:58:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AG1XAxKmoftuYxQWfiT3qXAvpL5iyAVbdsZxMi+Z7WjTqtT4PA3QNZLe38P+qJPMzLa8jNLdfEsGzhJsxoT5+/QvHuC4o8tLpU5dEMkDBg6qBmkezX38hblyyeU87HUiukqcLO3DtP4DGXn5OLZinSgzHkbvatyPv3rhPBv4uv/ln8NwcDkzyntDkYztDqIigegwwniQhdzwJJN7JZ8nWUf1eVmAV9611Fcckg6PgOwXhkNmEiKf0/TaSLA7AwfPRISSGYWJaiuEwDjkFUo6FIoytPq8MjSfUnuSf09HyotrG4iG9BpkTB67bZVvJB6nm1oEcyRGY/Sj4AumVSXV3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqtniU29xs+s1Q0ZEx7JMj/CYby9kIfr6eZJkqz6Hhc=;
 b=PljP0Xq3V0JId0IjtQ5eX+UgmLsB/KsX87sKiaoDOe8oJKhw9oc6hiNPtbSqJbAt3rfskeMFz/QZfEvoi2Edcj+Gex0xx8aU5lVSaRk+zker4kTrI0V0Smqgm8m8fFqjgzHq/ZSrMDyCc3TIGdTCFCPhqLedUxz8UQfmL+kDv41iBt6O0WjFGpr4u0jW9XsI+VkeGzWdw/k0MjzVRCFWdIn5TnyFvpucVKQjMmr0tpPQF5YABVtAuv9NczKoiJoeQjMtLl1wwg2gVVvz+bnvbbE8V6cL1BQJZkRzayAg6KWLQTcxACgZgCbc/I69Jb+b1eErebkFgKBZjD+JCHUGwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqtniU29xs+s1Q0ZEx7JMj/CYby9kIfr6eZJkqz6Hhc=;
 b=zBLPl7MobtS8Zcrn6iu8shC057b5SC8JmZNSjg+Ebbu62xkmDDlW4orR+lnpBXGijMxwDPVp9YxawnY+WEPlpCGTOBkDmGLFq31EHFdrQMSTkA+ZXb8ZJxplkxGwypz53qdRLFNYtajAcTVheag3/3V9zXSJnsxdoPymbCFH3hg=
Received: from DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d1f) by DM3PPF7961280CE.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::c32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 17:58:42 +0000
Received: from DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 ([fe80::2072:7ae5:a89:c52a]) by DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 ([fe80::2072:7ae5:a89:c52a%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 17:58:42 +0000
Message-ID: <82fb706f-b12d-4340-8f8c-6f949ab82913@oracle.com>
Date: Tue, 1 Jul 2025 10:58:38 -0700
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH v2] sched/numa: Introduce per cgroup numa balance control
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Juri Lelli <juri.lelli@redhat.com>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Phil Auld <pauld@redhat.com>,
        Tejun Heo <tj@kernel.org>, Daniel Jordan <daniel.m.jordan@oracle.com>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        Aubrey Li <aubrey.li@intel.com>, Tim Chen <tim.c.chen@intel.com>,
        "Huang, Ying" <ying.huang@linux.alibaba.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Shakeel Butt <shakeel.butt@linux.dev>
References: <20250625102337.3128193-1-yu.c.chen@intel.com>
 <706c24a8-125c-4902-bae8-82eea16ee2bf@oracle.com>
 <b09bd5f9-d029-40a0-a853-2a90ef969854@intel.com>
Content-Language: en-US
From: Libo Chen <libo.chen@oracle.com>
In-Reply-To: <b09bd5f9-d029-40a0-a853-2a90ef969854@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0168.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::19) To DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d1f)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF5ADB4ADFC:EE_|DM3PPF7961280CE:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a06ccd-4171-4e13-171f-08ddb8c8e9f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2RzMkpxMy9yNm9YZFJjY1JwS2ozQnB0ekhSOThGWmtWb1ZWQXlkODJ0OTg0?=
 =?utf-8?B?RFN5T3dwYlhzVnQ1TXpRczh6L3IwL1EyNFVuMHBxWllGV3lhVlJ6NVYzSW1Y?=
 =?utf-8?B?TElKbUM3WExvSmZKYXhoQ1NLbm1KdXNpdkFFR3B3a1B2MnhKN2NDY0xQWkxw?=
 =?utf-8?B?amkyWHY3dDMrdll1V25kQkcrbkprZXRxQjU0Zmk0YVNTdTZSNk1EQ0xqc3lR?=
 =?utf-8?B?Qk56VjcwTmZxNW5sSmVjVm1GYVZocmorcTlVVlhINnBCeUJ1UjJvMXV1VDh0?=
 =?utf-8?B?b09nSzg0bnIvaWY4cjdMSWR1MHFUTHdYK0FBSXZ3VXNGMEpHTS9xbW5oVUJ4?=
 =?utf-8?B?bFl1Vno2NGUxNDdSWGNaR3ZGdW1XNWRKRFlkcGp3Q2ZlbEk1N21SbzdoVzc3?=
 =?utf-8?B?dG1pWWRZZVowWjZOYm9YSUk2M3ltYlk4TmxNWkExOUFEWEdzSGhhMWR2ZWdZ?=
 =?utf-8?B?ZFpXeEtZc0t4LzVhamhqOUtJOGJlRUFmeWZrb1d3ODVvcXNQL3Z1Y0QwZ0kw?=
 =?utf-8?B?c3VFZjZQbWg5M3FBNklvWkpaZmk5aFU5Y0NmUjNoSkJKeFVRVzAyNGZHWU1L?=
 =?utf-8?B?d1UyZEcrZEVDUHZrbStycFRYT3lCYjhueEI3U2U5aEtaNTN1Uk5WUHR1bnEy?=
 =?utf-8?B?YVBSSHRMMTFYZWRleXdFN083Q3F3YjBRRjJtdnBHcUV2WXVENW1ZTEp0RXph?=
 =?utf-8?B?SnVRaHVGTTBMeXgvT2lydWlEVzJFNE5qRlh2dkN1RlpMcFJuNVJrUy8rQ0VF?=
 =?utf-8?B?TFF5bGpud0JKMlB2VUpLUEdSVzlncGZJTHkyM0F3Q3hMN2JFZjBoUEc5YTFZ?=
 =?utf-8?B?VmdLWklXZHdNYXFrRy9sdEZGcmpZMm02K2ZBRDY1SUd5Qk9JT3ExWWtaY1F3?=
 =?utf-8?B?Nm1RMml6cjVQci8rZXVLakF5bjd5RzBnRG01bUp1aG5ZbW9KNEh3SFZwZGR4?=
 =?utf-8?B?cVJpTzlsVDFlQnRjZ3Nwa3B2VlhXcHRDTmtJVTl2dTRFQ0VyOHRLR2dSSUFm?=
 =?utf-8?B?OEZVWkoyV3pHYzZ0V3kxOU5EZVVqYjNIMGpNdS94MG9lenhwUHZ5ZTQ5eXdH?=
 =?utf-8?B?WGMwS1VsRWg5akZLNFFRaHhpQ2d4OHpKVU9KVUR0NUJIL3JiM3dXMm42dFhv?=
 =?utf-8?B?SXRwcnBZaHBzdjVnWDdpdFpmOGxxTENFM21DcTN6ZUdlempSdE1keDFRV3Qr?=
 =?utf-8?B?cW9YSkZleThWajhXKy9SZEIrdDFhSFh2RGVXbHpMZU5hQTRYNkh6TDhVa0tl?=
 =?utf-8?B?Q0FtVnJYMVZnYmMwV0wwOTMybjVsQTZxaDIxWjYxWEFlVGljU2hBUHZ3d1hU?=
 =?utf-8?B?c1FOaHowc0xrLzdvQzJwV0JOaVY2WDFXNkZ5dzAvdFlwV3pEeXNVdkpsQVZm?=
 =?utf-8?B?YzJwbi9LVllCZy9kbHJWVEQ2NGU1bVF3MTl1emlSemxZeUFvOEs5YlpEWVpi?=
 =?utf-8?B?c0QzQ1FHS3MwYit1Wkk0bjl2NGFUbFpvcFpMNlhoekhyZ1B5TUJMYmYwdjB5?=
 =?utf-8?B?MVJhWlFSbHBsUktuaWh2ZEpVUWtRNHhxY0pJVDVMOGs1ODh2L2tjWldrL3Nh?=
 =?utf-8?B?Ym1HUUZKdm9yUmIvYWZXbTJKdFJrTFdKT1hyMzNQczRuRGdERDB6S3JJUTZM?=
 =?utf-8?B?TUNyWGhrTHlMQ0pGN1dKRXJpejhwVlZJUEk3SWdkNjZZMU5TVUtOZE1Rc1ZC?=
 =?utf-8?B?UGdhMnhxT2FvbkNYWEd5Vm5QSHJiY0lSMFpTU08yZktWUEJ3M1RTYjkwL1RM?=
 =?utf-8?B?R09OVHFBcDVITlYyV1F0VzdQRFVrRmNGa05RV281NExRdnZ5RzdxOTZHKzFR?=
 =?utf-8?B?c1JiNDZFVkZ1MWxjWWJRUEJOQ1ZEWDFTSHN5VnVWTEl1VDg4SWpLbFAreVIx?=
 =?utf-8?B?eFBFeWNkV3J5OW1DUXljOGdUOUJKK3pLVVJIanBDcXUyZDdTem9TSkRPSjg4?=
 =?utf-8?Q?aFzV85sVt+w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF5ADB4ADFC.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ek4yRGd5RDAwVjhDSklicktwWHVsTG5LSnBsRUE0VnV0Vnh0dzJMVHJUVUwy?=
 =?utf-8?B?TjJtdndMaHR0UUZFWmxRVUZhTmU5ODJ6dXVwN09EekYybnBpdTk5UGx4V3lj?=
 =?utf-8?B?SEVVeTVhem1lV212MStVTkVMWXR1ZXAvOVJiTm5IcWV0Ti9xWjk1bG4wYkxV?=
 =?utf-8?B?SFFXM2lFNUpaVkZydzVJYnNyaDRyODFVY043eFRLaU5pbnZPUjZVVSt5cHNm?=
 =?utf-8?B?aFA3SUFmWlgzQTkzTk1OTW90dDdBOWdDUGJsb1p2T2lrRlNtY3BadzZ2Wis2?=
 =?utf-8?B?OHlhTlBXWVZsK0dtRFlXR2ZGdG5JRklLS0o4U3JhNGRKYXIxRG9ySnRjRnhX?=
 =?utf-8?B?T3ZKZ1N6VklYV3VRZTZ4SXJQOUVFeWtxZXpiR3d6dDBDSzc1RXkyS2RVakxl?=
 =?utf-8?B?MXA1aGtKVXd4R0R0TXo2eFpqUTRlaWtjZ3R6anRlQTIxVExpckJycEVBeFVP?=
 =?utf-8?B?Y0I0U3hhdHJjNnhzTmgvTU1kOHhaWmFONnowQXFHY0h2dCtMVmdkNVoxaDFw?=
 =?utf-8?B?NjhvbmJWS2xQQWs1MERCNlZ0Z29QeTBQZWpaWWZSYy82Tk1qVFY0bXZwVlh6?=
 =?utf-8?B?cFU1czgzV1NuVGhSMWJlV0w1OXdNc0JqU2lRNXVtQWZkTWZ4TXpPczVKRW13?=
 =?utf-8?B?VWRBSy84S0g4OXQzeXhFeG1JbVBxM1lISEZqWTJac3ZpZlZNOVkrUmNmYUZP?=
 =?utf-8?B?eDNISWJTelBObTJqV2UrWUwxak43VTdQT1FTRGorcU9rY3d4b3dWc3FRL1p0?=
 =?utf-8?B?TWJvWFUxWkVlRjJWRk9veU9qNHhpcUpUYnZ2YjUrOVlmeGhvT21ZMnJacXVu?=
 =?utf-8?B?bEc2c3pZM0JnSEk0aEQvR2kzZFJabVlXY2ZmRHRWUHJWeDJURCtPRy9rTG1C?=
 =?utf-8?B?eEdtOFBtNmppVnowL3RGU205RVlMNHEvU3ZhOUh2YkR1WG5FVVViZ2dEaU5w?=
 =?utf-8?B?emJCNmZCbS9QT1ZPTnhCemMwOXBkeDhLS2V4VGlFNndhRER0bG4yWDdQaGN3?=
 =?utf-8?B?ZmdDMTJMQXh3dGxKRnpFYnN6Mkl4MHAyL1FJMlg4NGJJL0dPSW44OTZPb0Qy?=
 =?utf-8?B?dXMxREh0K1pmc2VrZXgwSDNCeFJwVXhQM0ZNNXNHM3J0M1grZ1NDTk9kWCty?=
 =?utf-8?B?RmdHTnlleWdNUlFVYmEzaHhUQkloSTJnR0k1ejE0aEwrT2ZRQm9QYXh6dGl4?=
 =?utf-8?B?RUdsajZ5LzROVTFXR01hNVBVYlorVS93NndHZEZWMHRsbWM3R2lIVTdXZ2Ju?=
 =?utf-8?B?eUwvMitKd25KYzZCY1piOE9BYlpjMTcxb1RLSVZEZ0Q5K1JwTFNIb1hpVy8y?=
 =?utf-8?B?Z1lvUEdGSVRmV0pHZ0g5S1NaZWNhRUJqcUVlZVV0SXBlKy9hNkpIbElKT1dL?=
 =?utf-8?B?cU8yTXljS2hCM0c3dGNBczVEZWhpMUFieXc5eFR0Um13L3RIV2phNTlFN0Jj?=
 =?utf-8?B?YnBMdmVIY3g3SG5rSGZwMjBBSCt1NENKbnhYZ3VxRHhGUVJ6VWRWL0NHSDBz?=
 =?utf-8?B?SGlKR0x1SGpqRnBhK2RZMGZEQUN2dVhRVXk4N3dSdDloVDB4VXUwOFYxVnZC?=
 =?utf-8?B?bHB3TG90RzRYOFozd2tJWHNrT2lxYkdnelN6NzBkVmhpVEZVbHpzZWJ2ZjIz?=
 =?utf-8?B?TVBWTzJJZllXTC93bERjZWo3VWNpL2xOWGxINDJyVWY4QU5oRnFsclRrQ0ZY?=
 =?utf-8?B?OUZlZDRWb000Q2xVNnQ3TjRnV3I3V1Y4bG1qWjhwZFAxWUdsQ0JObEtlTGFR?=
 =?utf-8?B?ak94ZlF4cVFCRTNGbHZ4bzFzeisrUy9qV3VRSEpWOXRCckJ0QTR2UGtwb3Vr?=
 =?utf-8?B?eXl4M0RXR2d2N3E4amhzKzI5bXNKN0plQ2U3SjRKTVE1Rm1VeDhWOWtPRnEy?=
 =?utf-8?B?NlZOalg5RjhraTRpZVhuUjBjNXljeFBJYVkwcTd6V0hENjZoN3VrZjkwNW9B?=
 =?utf-8?B?OU1yOHNydUdwRVpNWVNpSEl2NzcxMlJzWStHbW1wMWtjWTdtRFVRdTVGSTFl?=
 =?utf-8?B?eWE3QVZSZWJEREdic2xkZUVlbjF3VWZKRzJSMm52aFhISWdWSUZXZEIxU242?=
 =?utf-8?B?dndZdm16UWZMNGF3bzZxdkw5SW1nQzcwRkJYZStIN1FkOGNkbHVIa2NnYjlN?=
 =?utf-8?Q?aBJF2ViIRZLmzXsQJhK23Baab?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o8xczydC81KIzavSX4mKPqjjv91mc7XwOoreqXfYxUIHnPRbxpr2iEFzTXm1JAe9ihchxpbTcKi2v43/RHWOI6EPzeL2WiH3kUpqaolRpcK9Anifht8/q0Ww7tSTWJ0vNFCzJu3qLKTBOvUWpvyPkx9Im4VfZLG5Q4dg5K4VCzhTs5uELR3UAVmdF4+c+/OoM+1DwfsVmkq6AFKO6gsLA7jFX851fMfFrnuqwwIOdS1ty4/RcdNCcg5KJ1+6b+nbX8F+jkqTfsAsxOHH8iH2rQrvPbOs8Z09OrTfXiEBWPgw9QAQdC2c9+jkXgMWpzuEGPMVNuzjeECvson3XNgbPd7ABB/Ijmk0RCisFIDXfAEmaSd3AVCRpl+25b/Mi2+mWrMtvRy0DrcocXzYrT5wgeftJFZb8sqYdaZ/7eYJsTLNa7ZLIqrvBFxhjisUhGAF7F0ykDgwaEeAA6q7JB25fyJbwF49oJapQGeGMyKBTt5VV9hK7dejumFE5MhYMexpu18cDvwy9i336Is2la3B9PuDjBdXs85FKLkqtNAvYZEj5V4Zfik2X4KI6z2UIpF1vqp0TaRd2kLiEu1PaXxjTUWgsuQP4U2H+R0BN1l6O7Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a06ccd-4171-4e13-171f-08ddb8c8e9f1
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 17:58:41.8511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QehKRvSvZ/xY/6fx/xAfxxyiOecphISMRfdgPlAepvkzVy2K+g9DjwPcLXNX3Of3P7Ixy0ut1S3stY2zUcwobw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7961280CE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010124
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=686421d7 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=QyXUC8HyAAAA:8 a=yQi6MSdO2T-eM1WQ4HsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14723
X-Proofpoint-GUID: IDcl3-ENgTJbuLvmZilnmUMX3H8UZYbL
X-Proofpoint-ORIG-GUID: IDcl3-ENgTJbuLvmZilnmUMX3H8UZYbL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEyMyBTYWx0ZWRfXz6TiKyojxuf6 DZJ7MzCBf8lCCxjzFItcKWEZCrTURoLoyGxG17QN+1JsR22XCOuEGJcnLMP8+McxCmjG0ul6daL TUhzchqQLG5dtHWbceqHkqUjS0Wc+HH1bFQhyWOXFbFJXabaFz6nHGGsjsivw/0I3KHez7DKY8T
 RqN4Pr4nKGwXYqtWHWCLkEGpnxf0OMYQyz1kK5KxvTZLI1+FOzT+TSNkar+w0EpkrLAi51Pfbf7 Q5DwY5Hb7qyVeuaBWbvTer+J3TGHoLUeM8ZO0ojEIIeXijajfGMUJF2dTEDb0CAVB6G2hK1E7ng 7snKtSjpqvfPKYTH7Lh/6uLuYJbhRyOL4pvRE88Y/3x9iN8sBOKgTbD9bdzH1cP5NhP+dMsmT+j
 2pvAqL+TdENO+/cveJ4N/x6ly53gCKSxK4Vs4N0Z71n7AqVXfUJj76FmV8T8q6Roiqx1AqeK

Hi Chenyu

On 7/1/25 09:36, Chen, Yu C wrote:
> Hi Libo,
> 
> On 7/1/2025 4:25 PM, Libo Chen wrote:
>> Hi Chenyu,
>>
>> Thanks for the patch. See my comments below.
>>
>> On 6/25/25 03:23, Chen Yu wrote:
>>> [Problem Statement]
>>> Currently, NUMA balancing is configured system-wide.
>>> However, in some production environments, different
>>> cgroups may have varying requirements for NUMA balancing.
>>> Some cgroups are CPU-intensive, while others are
>>> memory-intensive. Some do not benefit from NUMA balancing
>>> due to the overhead associated with VMA scanning, while
>>> others prefer NUMA balancing as it helps improve memory
>>> locality. In this case, system-wide NUMA balancing is
>>> usually disabled to avoid causing regressions.
>>>
>>> [Proposal]
>>> Introduce a per-cgroup interface to enable NUMA balancing
>>> for specific cgroups. This interface is associated with
>>> the CPU subsystem, which does not support threaded subtrees,
>>> and close to CPU bandwidth control. The system administrator
>>> needs to set the NUMA balancing mode to
>>> NUMA_BALANCING_CGROUP=4 to enable this feature. When the
>>> system is in NUMA_BALANCING_CGROUP mode, NUMA balancing
>>> for all cgroups is disabled by default. After the
>>> administrator enables this feature for a specific cgroup,
>>> NUMA balancing for that cgroup is enabled.
>>>
>>> A simple example to show how to use per-cgroup NUMA balancing:
>>>
>>> Step1
>>> //switch on per cgroup Numa balancing.
>>> //All cgroup's NUMA balance is disabled by default.
>>> echo 4 > /proc/sys/kernel/numa_balancing
>>>
>>> Step2
>>> //created a cgroup named mytest, enable its NUMA balancing
>>> echo 1 > /sys/fs/cgroup/mytest/cpu.numa_load_balance
>>>
>>> [Benchmark]
>>> Tested on Xeon Sapphire Rapids, with 4 Numa nodes. Created
>>> a cgroup mytest and launched autonumabench NUMA01_THREADLOCAL.
>>> Each test runs 6 cycles.
>>>
>>> baseline:
>>> 29360.56user 16280.68system 3:33.29elapsed
>>> 29788.41user 16060.31system 3:34.38elapsed
>>> 28307.51user 17043.45system 3:33.03elapsed
>>> 29552.49user 16307.65system 3:34.20elapsed
>>> 29847.41user 15966.15system 3:34.65elapsed
>>> 29111.10user 16532.78system 3:33.19elapsed
>>>
>>> per cgroup NUMA balance:
>>> 7589.78user 16494.90system 1:53.18elapsed
>>> 7795.54user 16537.65system 1:54.11elapsed
>>> 8295.66user 16391.21system 1:55.98elapsed
>>> 7836.34user 17312.31system 1:55.71elapsed
>>> 7773.26user 16856.19system 1:54.08elapsed
>>> 7534.43user 17604.58system 1:55.01elapsed
>>>
>>> The user time has been reduced to 33% of the
>>> original, and the elapsed time has dropped to
>>> 45% of the original (lower values are better).
>>>
>>> cat /sys/fs/cgroup/mytest/memory.stat | grep numa
>>> numa_pages_migrated 10238503
>>> numa_pte_updates 24378124
>>> numa_hint_faults 16921590
>>> numa_task_migrated 253
>>> numa_task_swapped 4
>>>
>>> to-do:
>>> Per-cgroup NUMA balancing should consider the
>>> hierarchy of the cgroup. Initially, NUMA balancing
>>> is disabled for the root cgroup. A cgroup that has
>>> NUMA balancing enabled should have all its parents
>>> enabled. For example, suppose cgroup A is the parent
>>> of cgroup B; if A.numa_load_balance is 0, even if
>>> B.numa_load_balance is 1, NUMA balancing for B is
>>> disabled. This idea is derived from
>>> commit e39925734909 ("mm/memcontrol: respect
>>> zswap.writeback setting from parent cgroup too").
>>>
>>> Suggested-by: Tim Chen <tim.c.chen@intel.com>
>>> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
>>> ---
>>> v1->v2:
>>>
>>> Add documentation in Documentation/admin-guide/sysctl/kernel.rst.
>>>
>>> Add comments in tg_numa_balance_enabled() to explain that
>>> the newly introduced NUMA balancing mode is naturally
>>> exclusive of existing NUMA balancing modes. (Tim)
>>> ---
>>>   Documentation/admin-guide/sysctl/kernel.rst |  6 ++++
>>>   include/linux/sched/sysctl.h                |  1 +
>>>   kernel/sched/core.c                         | 31 +++++++++++++++++++++
>>>   kernel/sched/fair.c                         | 28 +++++++++++++++++++
>>>   kernel/sched/sched.h                        |  3 ++
>>>   mm/mprotect.c                               |  5 ++--
>>>   6 files changed, 72 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
>>> index dd49a89a62d3..ff88d1153c19 100644
>>> --- a/Documentation/admin-guide/sysctl/kernel.rst
>>> +++ b/Documentation/admin-guide/sysctl/kernel.rst
>>> @@ -709,6 +709,7 @@ The value to set can be the result of ORing the following:
>>>   0 NUMA_BALANCING_DISABLED
>>>   1 NUMA_BALANCING_NORMAL
>>>   2 NUMA_BALANCING_MEMORY_TIERING
>>> +4 NUMA_BALANCING_CGROUP
>>>   = =================================
>>>     Or NUMA_BALANCING_NORMAL to optimize page placement among different
>>> @@ -729,6 +730,11 @@ different types of memory (represented as different NUMA nodes) to
>>>   place the hot pages in the fast memory.  This is implemented based on
>>>   unmapping and page fault too.
>>>   +Or NUMA_BALANCING_CGROUP to enable the per cgroup NUMA balancing.
>>> +This new behavior can be opted-in/out on a per-cgroup basis via a new
>>> +cgroup CPU subsystem file named numa_load_balance. By default, per
>>> +cgroup NUMA balancing for each cgroup is enabled.
>>> +
>>>   numa_balancing_promote_rate_limit_MBps
>>>   ======================================
>>>   diff --git a/include/linux/sched/sysctl.h b/include/linux/sched/sysctl.h
>>> index 5a64582b086b..1e4d5a9ddb26 100644
>>> --- a/include/linux/sched/sysctl.h
>>> +++ b/include/linux/sched/sysctl.h
>>> @@ -22,6 +22,7 @@ enum sched_tunable_scaling {
>>>   #define NUMA_BALANCING_DISABLED        0x0
>>>   #define NUMA_BALANCING_NORMAL        0x1
>>>   #define NUMA_BALANCING_MEMORY_TIERING    0x2
>>> +#define NUMA_BALANCING_CGROUP        0x4
>>>     #ifdef CONFIG_NUMA_BALANCING
>>>   extern int sysctl_numa_balancing_mode;
>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>>> index 8988d38d46a3..8e9aa59193df 100644
>>> --- a/kernel/sched/core.c
>>> +++ b/kernel/sched/core.c
>>> @@ -10078,6 +10078,30 @@ static ssize_t cpu_max_write(struct kernfs_open_file *of,
>>>   }
>>>   #endif
>>>   +#ifdef CONFIG_NUMA_BALANCING
>>> +static int numa_balance_write_u64(struct cgroup_subsys_state *css,
>>> +                  struct cftype *cftype, u64 enable)
>>> +{
>>> +    struct task_group *tg;
>>> +    bool was_enabled;
>>> +
>>> +    tg = css_tg(css);
>>> +    was_enabled = READ_ONCE(tg->nlb_enabled);
>>> +    if (was_enabled == enable)
>>> +        return 0;
>>> +
>>> +    WRITE_ONCE(tg->nlb_enabled, enable);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static u64 numa_balance_read_u64(struct cgroup_subsys_state *css,
>>> +                 struct cftype *cft)
>>> +{
>>> +    return READ_ONCE(css_tg(css)->nlb_enabled);
>>> +}
>>> +#endif /* CONFIG_NUMA_BALANCING */
>>> +
>>>   static struct cftype cpu_files[] = {
>>>   #ifdef CONFIG_GROUP_SCHED_WEIGHT
>>>       {
>>> @@ -10126,6 +10150,13 @@ static struct cftype cpu_files[] = {
>>>           .seq_show = cpu_uclamp_max_show,
>>>           .write = cpu_uclamp_max_write,
>>>       },
>>> +#endif
>>> +#ifdef CONFIG_NUMA_BALANCING
>>> +    {
>>> +        .name = "numa_load_balance",
>>> +        .read_u64 = numa_balance_read_u64,
>>> +        .write_u64 = numa_balance_write_u64,
>>> +    },
>>>   #endif
>>>       { }    /* terminate */
>>>   };
>>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>>> index 7a14da5396fb..dcdee3bf9960 100644
>>> --- a/kernel/sched/fair.c
>>> +++ b/kernel/sched/fair.c
>>> @@ -3161,6 +3161,29 @@ void task_numa_free(struct task_struct *p, bool final)
>>>       }
>>>   }
>>>   +/*
>>> + * Return true if the NUMA balance is allowed for
>>> + * the task in a task group.
>>> + */
>>> +static bool tg_numa_balance_enabled(struct task_struct *p)
>>> +{
>>> +    /*
>>> +     * The min/max of sysctl_numa_balancing_mode ranges
>>> +     * from SYSCTL_ONE to SYSCTL_FOUR, so it is safe to
>>> +     * only check NUMA_BALANCING_CGROUP because it is
>>> +     * impossible to have both NUMA_BALANCING_CGROUP and
>>> +     * NUMA_BALANCING_NORMAL/NUMA_BALANCING_MEMORY_TIERING
>>> +     * set.
>>> +     */
>>> +    struct task_group *tg = task_group(p);
>>> +
>>> +    if (tg && (sysctl_numa_balancing_mode & NUMA_BALANCING_CGROUP) &&
>>> +        !READ_ONCE(tg->nlb_enabled))
>>> +        return false;
>>> +
>>> +    return true;
>>> +}
>>> +
>>>   /*
>>>    * Got a PROT_NONE fault for a page on @node.
>>>    */
>>> @@ -3189,6 +3212,9 @@ void task_numa_fault(int last_cpupid, int mem_node, int pages, int flags)
>>>            !cpupid_valid(last_cpupid)))
>>>           return;
>>>   +    if (!tg_numa_balance_enabled(p))
>>> +        return;
>>> +
>>
>> I think this one may be redundant when you already have it in task_numa_work().  Without the
>> scanning, there won't be any hinting page faults on that task, so neither do_numa_page() nor
>> do_huge_pmd_numa_page() will be called. Though it's a minor issue if tg_numa_balance_enabled(p)
>> is fast.
>>
> 
> Previously I was thinking of the following sequence:
> 1. the NUMA balancing is enabled and task_numa_work() is invoked,
>    pages are scanned and PROT_NONE is set.
> 2. cgroup NUMA balancing is disabled by the user
> 3. do_numa_page() is triggered and PROT_NONE is cleared.
>    We don't want to do further task migration and
>    task_numa_fault() bails out.(page migration is still
>    allowed as we mainly want to control the behavior of
>    the task)
> 

Ah right, that makes sense. Does that fall under unlikely()? The timing window seems to be
quite small to me. 

>> Overall this is good. But more generally, I am thinking something finer-grained, like per-task
>> numab control with numab tunnables at task-level (if possible), that will be so much more useful
>> at least for us. There are use cases for controlling numa balancing at task level as applications
>> tuned for NUMA (that don't want numab mess with their tsk/mem placements) such as databases can
>> be in the same cgroup with other untuned applications, or not in a cgroup at all. Right now we
>> have to turn off numab globally but that's not really optimal in a lot of cases. I do understand
>> your use cases for per-cgroup control, but I wonder if there is a way to nicely combine them.
>> Per-task control should cover per-cgroup control functionality-wise, but it's an inconvenient
>> interface as one has to set for all tasks of the same cgroup, 
> 
> OK. Michal has also suggested using the per-task interface
> (prctl()/sched_setattr()) for NUMA balancing instead of per-cgroup
> control. In theory, I think it is doable. In a cloud environment,
> users can set the attribute (enable NUMA balancing) for the first
> process of a cgroup, and later child processes will inherit this
> attribute. But yes, when the admin decides to change this attribute,
> each process of the cgroup has to be iterated.
> 

An on/off button for cgroup could be added to libcgroup or similar for sysadmins, but still
inside the kernel, each task's attribute will be set one by one. What I am more worried about
is cgroups that frequently have tasks join and leave, it will become very annoying to set/unset
at each entry and exit. 

>> I haven't thought too hard about
>> it yet, just want to bring it out and see if we can work out something together.
>>
> 
> Sure, let me have a try on this per-task version and we can
> discuss/co-work on that.
> 

Cool~ Looking forward to it.

> thanks,
> Chenyu
> 
>> Thanks,
>> Libo
>>
>>>       /* Allocate buffer to track faults on a per-node basis */
>>>       if (unlikely(!p->numa_faults)) {
>>>           int size = sizeof(*p->numa_faults) *
>>> @@ -3330,6 +3356,8 @@ static void task_numa_work(struct callback_head *work)
>>>       if (p->flags & PF_EXITING)
>>>           return;
>>>   +    if (!tg_numa_balance_enabled(p))
>>> +        return;
>>>       /*
>>>        * Memory is pinned to only one NUMA node via cpuset.mems, naturally
>>>        * no page can be migrated.
>>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
>>> index 475bb5998295..4b0dc656688e 100644
>>> --- a/kernel/sched/sched.h
>>> +++ b/kernel/sched/sched.h
>>> @@ -485,6 +485,9 @@ struct task_group {
>>>       /* Effective clamp values used for a task group */
>>>       struct uclamp_se    uclamp[UCLAMP_CNT];
>>>   #endif
>>> +#ifdef CONFIG_NUMA_BALANCING
>>> +    u64            nlb_enabled;
>>> +#endif
>>>     };
>>>   diff --git a/mm/mprotect.c b/mm/mprotect.c
>>> index 88608d0dc2c2..c288ffb92bfc 100644
>>> --- a/mm/mprotect.c
>>> +++ b/mm/mprotect.c
>>> @@ -155,10 +155,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>                   toptier = node_is_toptier(nid);
>>>                     /*
>>> -                 * Skip scanning top tier node if normal numa
>>> +                 * Skip scanning top tier node if normal and cgroup numa
>>>                    * balancing is disabled
>>>                    */
>>> -                if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
>>> +                if (!(sysctl_numa_balancing_mode &
>>> +                    (NUMA_BALANCING_CGROUP | NUMA_BALANCING_NORMAL)) &&
>>>                       toptier)
>>>                       continue;
>>>                   if (folio_use_access_time(folio))
>>


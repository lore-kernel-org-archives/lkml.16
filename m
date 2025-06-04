Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD652C3251
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 05:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749014301; cv=fail; b=KnUwmA/oC1Xq3zbCWOK3B2WVzRjs6oubiBeGfImX5qtEHJmMqkqfZvCEG7MZ8u76J97dmuahd+ot+rurnHSp6zQTAL1b5Cl/yIXtWhNXiTNgBIQvi4wbKc7wImifqEGMdyRRyctoNxRcQc7zPzcEqQ7GqxeLNvhu6S6vpcnNDfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749014301; c=relaxed/simple;
	bh=vt+0jNNcFNUylVTQsV8mIJlb00kuG8oy042mvj9O7ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rVsEXPAghr++vjI5ZE+MDoY1qaBgkfwQVrzM0oerFIETVwg4XpTMO9b2iP2AckMnP4h5HwEjYLORcst2phjkqRWBUOjOPyDx3NxK0v7q8QR5TT0osPSRPkQpAZIE6dDwdjviSXtlWRWLudmGHvPsxFXHNykI/J787tDL7xMIdsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a39kgYU/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aV5Wbean; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a39kgYU/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aV5Wbean"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553MN1Uu027670;
	Wed, 4 Jun 2025 05:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=vt+0jNNcFNUylVTQsV8mIJlb00kuG8oy042mvj9O7ik=; b=
	a39kgYU/vb8FyA6/OdKjOIs4ro5aIB1p0qB8HgzAwshGhAaeQScU4gTymkhhbY+k
	ni8ljXKlyftBJxO1NIuM2gYv7jJkIddAGX/L/j1DBJeGFH1GCz5ib6OLtkm8wxAr
	G8uxy3hkC2h1TJIXsXmLf7blhKqAzkpZ8gOdEKNKtOkHH1Xx56+u7BaelJHCXD3b
	/nNjLUiKGqo9ln7NV07wEn6WfxQ8qEY59Phg7TxoegQBn1Riv9txeaeJAUBsHqwk
	HaPrt+PlBwTztbCOTd+G90sdRAWQh/bdrXgTQ2VKudc4gT2p+3D0w1ry90IN8cTu
	ijLLYZv5Q2Iyb4RbTTwokQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gahb93u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 05:18:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 554523Ih040095;
	Wed, 4 Jun 2025 05:18:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7aj1pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 05:18:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbtt2e7RYP31477OgGWi2s6xHOer5wzbipH2xSfEDQhMcC1qgoJSNWEy50M+l2F2mFqCfGFsVGQOubNBhzz8sMYPPDDrhF+rk29J2Y9loJb/husqenuyMqXJz+FHrU+f68wwQzL7otUuhv1FTIdnHM7DZko+z+Vn/016Dn1v5QBrHI+7zlz4gbZGuO8rkZQzLeZPlbW8gFesmBGFQyJzqEx1kCmHxm6V2ynQhhwgFgAC7bMgwMlnYQfq+GpdE97/PYuu95M+zShqPGk1uUfWn6wCakWrw+czYeavXvEWOhM94R5oWZEsvhrVDRKiRh/UN0r2Nd4aHZJttF7H+bdoFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vt+0jNNcFNUylVTQsV8mIJlb00kuG8oy042mvj9O7ik=;
 b=B2PS9U0FSaSUOXCraX4YL4S8eYBDUyTBIX9yV4+J38j1syEbVbRE0jtByHk1agXbjqyUfKRZ7cA5c/gyCu3C+qeeItrDpx0XJ1VGeBq+u8YKYdr2//bIBXrwoKnYXH8GFQKedcXVfkQIxc+CmAymuBgXGEflamGHCTA1fxGCQqFJLguUEhSi3J8+Cotr9sC1jFjDe3EpA15sJTnmGJv+uEYu+U6kfB9uvgtv70nHVDI20CHUhZ4m2mGtT1HpUab0Fu1Gj+lV3ejDyGQDkMCA7iYeZWtj59AGdeJSsHahhzH24472hEgx7+vKiklFkjGUBRw5YWw+oZb4XshaSrHBkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vt+0jNNcFNUylVTQsV8mIJlb00kuG8oy042mvj9O7ik=;
 b=aV5WbeanS1MZ3loM02qdceLvWB35PaXqaOiv3P7ru7/7GW4SmWuCpHpMEGjNpEa8dvebh4KQv/p7nu5QhWQpIf65+n5AQzSMwVXFVgHw+WoB4rm6pSpSjzq1/az5gbHs5N3YA6GxLBEFlOujhRPL/B4NqzIPwe4tCiOO0Uzpkyg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY5PR10MB6072.namprd10.prod.outlook.com (2603:10b6:930:38::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Wed, 4 Jun
 2025 05:17:57 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Wed, 4 Jun 2025
 05:17:57 +0000
Date: Wed, 4 Jun 2025 06:17:51 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: syzbot <syzbot+23de6daeb71241d36a18@syzkaller.appspotmail.com>,
        Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, pfalcato@suse.de,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] possible deadlock in __vma_start_write
Message-ID: <732ff578-d11d-44f6-8406-aadb14546b84@lucifer.local>
References: <68387feb.a70a0220.29d4a0.0830.GAE@google.com>
 <04c893fe-0498-4847-a525-9efb6d9306da@lucifer.local>
 <CAJuCfpGRaP2H8S6ZEr4PmxktL1tVdGM-18QyQ_N54S=RwE5tvA@mail.gmail.com>
 <59aed5fa-1d19-442b-9b7b-a99aee9b7689@lucifer.local>
 <CAJuCfpHeHYxo1ZvG-mjDxcHd63nq_g9o5i-au-wZWHj+_dRy_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpHeHYxo1ZvG-mjDxcHd63nq_g9o5i-au-wZWHj+_dRy_A@mail.gmail.com>
X-ClientProxiedBy: BE1P281CA0318.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:87::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY5PR10MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: f411b9cf-57cd-4eef-5196-08dda3272aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGxjbFVhQmNFVjlINzFvOFlvc2hjSFNTWHdSNGFjRTQ2eG1DcklnVGx3Z1dl?=
 =?utf-8?B?R2VwU2NBK2xDWXUvRWNWME5yNThGc0tUMkdPVHFMRktZeEMwY1ZmZFdiNE1R?=
 =?utf-8?B?RnpVMUFyNkJxZlJyTU5TYzIvYUxTSTU1dWV3WlFaR3NUeHpkdkdTNEhPL0Rj?=
 =?utf-8?B?LzRLQmFRZDJlM0l5NDVJMjhtVy9aeE5GS1drNGh3OXFXamVaZm5uRitBb2FR?=
 =?utf-8?B?T1RpZmhpVWVGNGZUYmpwdUg4OFRRUU0rNGpUSGRoWDJidXVVL3NLNkdYWHZw?=
 =?utf-8?B?bFRkQVV6bDlOd0h5RlN0bm53S3lqZ2o4UmxjRWx6azRCb1pESjRnUHNlUXdE?=
 =?utf-8?B?T1JSNk90cjk4QXNhUXIxanoyOE9odlNUTHNURC9pTVhGQWJVS2s3TjNXL3U1?=
 =?utf-8?B?d0FXM0dMSmFvejFLVi93MloveExBSmx1cTNhRmxJRXFwNUNRWHZjeURGb1Zq?=
 =?utf-8?B?dWp1RXJGbmhSTVNrRTJMTzVFem9TZVlBSVlQSGRFZmwvTElPWm5NRUUybFhS?=
 =?utf-8?B?OHhZZHg4MEUvY2MzcG5TVHR5c2s4R0NZdjFob1VzMS80WTVqbXBaWEVYYzJ1?=
 =?utf-8?B?MUFoWGhiMGYxdjNneTk2UGFudGJkSjg3VnVRbDBxNlYwSkpkUnk2Rk1PbTBM?=
 =?utf-8?B?YVl2OGtxclFuelZMaXIxYU1yeklwZnpXdXI5M2ZjM3FQcFRzVThVUS9DTEZV?=
 =?utf-8?B?M0tTMlEvZTJnK2JyZGRVNld3VTdCd001S2VKK2FXN1dzcE5xTnZpNVRSQjNp?=
 =?utf-8?B?UThBTUJGdWZRdmp4eU9tbnRScDU2b2kyK1VqYWN2aGxOTGt0bjQzYml0Y0ts?=
 =?utf-8?B?OEtDYUlOaVZsOW5uL1krOWlPb29vaFVsY3Vwcjd0VlZsbFAxdk1pNnJRYXlC?=
 =?utf-8?B?ZStTVUlWallPVi91WXFKOXgvYWVncHRxeXQwM3NNMkErLzVMMVJXb0IzWmFt?=
 =?utf-8?B?QlFKVmovQS9zeGZsa25jRzN4U0ptcFphTFZlYk9nbTF2NzZ0Qm1OVElSUU1N?=
 =?utf-8?B?NUVwQW83VkV4NUxWSnZCdTk2UUlVZTlJaGxjUkFBcWZHdkpyMUtrcmZMVTgv?=
 =?utf-8?B?VlpOM04vaGRzb21xNkN6VzBlMGR1NXNPZjJhWTJwWDR2U2pyeGJDdWRjZENr?=
 =?utf-8?B?dENKREJsU0lWbkNDc0o0MEZWR2MxaFFOS004UTNBUDQxTEN3QVVOTDVxZHNR?=
 =?utf-8?B?bExENlBpNXkzWlJtNC92ZkNqYWMxMDlUTHIvdVZoSGxubElBdlUrZkprRUEz?=
 =?utf-8?B?d0l4RE02MFBhV0I5cGlZa3RLM3VzQSt1ajcyTzEzQnZSaFVic0dmbnVNNTJX?=
 =?utf-8?B?b0ZRaHZka3hpaVJDTVpIZ0NqQXVCNlE3NU1teW10N3g4OXY2Y1pjWjgzRnpT?=
 =?utf-8?B?UFFxdndXSFZaSUEvRUVQZWpXK1FCcHB5Q2dJbXE1OGZ4aDkrcExmUk0zZVM0?=
 =?utf-8?B?ZDB5UW5CR2tjLzhkS0pTemZpVzB3dWM3Y1M3ZzFBSWZrU1Fjb2F6ZG51U0tR?=
 =?utf-8?B?NzNaeFE4TGg2Ym5SYXJUMHZrSjVaZTJxd0JIUGZlR1l6c1ZGRW1seFNRcWw5?=
 =?utf-8?B?VjNKRmxINEZ6MTZ1cHM2YzJVd2p2QnEvMVc4Z05PY3ArMUt4VWJFbEM3c0xx?=
 =?utf-8?B?ellqSFc2bFl6ZGVxVDg3QXVVRUFZOE9UbDRNM1ROVm5kVTB0R2JiUjNhS0Jy?=
 =?utf-8?B?R1NBZlpPK0tFa0tHbHpvS25DdUtXcmpncUhDd2R6UVNNVVJWc0c0eEhwL3pF?=
 =?utf-8?B?T0xjZXZmbWcxeEhGa2s3SFpTN1BKQzIzYnFaMVh0Z1hNWHI2OVBQNWpYMnNN?=
 =?utf-8?B?TDhleEdNMFVPWkgyT1F5WnR2bkRzMU5FK0llUW9RclpOdXphRUduTmgyLzBk?=
 =?utf-8?B?cG5MVXMwS2hEN1hEMlEyVkFteU1qc2Q3NmFqM3ZiaEpaZUVqa1lXL1V4dWxB?=
 =?utf-8?Q?VlMUeH50mH8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3ZxNlU3cWNZcnZKU0VGZndrZ0dFKzRiUFFWM1pKL010ZUpXWnJlR3ZvS3VK?=
 =?utf-8?B?VHU5MUZ3L0dkaURNVGgxTkNacUxSQmZqRWtvSldWOUJvRjRIdmh6Vkc5UlIr?=
 =?utf-8?B?L09mRFFHUW5nVnJIYjh4QVY4UnE1T2JLSHlGN3JDK2F4NFBUd1RJbUhVMFQ4?=
 =?utf-8?B?cWJqcExLMXlkSDI3bnpkR1VUQ1Q4aExMQTE3YXMzQ29aSWZVQlgxNGN0dEIz?=
 =?utf-8?B?a1A2bFAxdFVTYi9PSituWmdseFZuUUJncHFlK2hseGltd3RYaDJ5WXFKaEUz?=
 =?utf-8?B?SThHUmFGZEtWRnNIVDAzdWIyUVQzeWtNQ25jU2wzT0xhYnByWDJYbmltOHJB?=
 =?utf-8?B?M25ybXg3aHRZZ0huampQNzM4WGxEMmpCQWI5dlN5eENRUEpWbzhKRk93T0Zv?=
 =?utf-8?B?VHltaEFjMVdXcHBYM0JMaUxnbG4wQ21PMjRmWXV2WHk4dmkrdkVkQUJvTXdD?=
 =?utf-8?B?bWNjK1U3aVY4Uk5iTndzWWs3R0hna3R2aW9VV25rQnhRSjNYdCtpSDNFdkd4?=
 =?utf-8?B?cng0TnozQkFFcWVoYnJwaXV4L3ZTcllLbGNnNjFTOWc0UmVmek0rbmkyOStP?=
 =?utf-8?B?VXZndndCNzBESC9rNHM5RWdlaHc3MXNUQTU4cndnQVczRjk3ZzJXYldraytH?=
 =?utf-8?B?SndnSlJYSGZYVGp3VlRjMy91VmNaR1hpRDl2V0JlbVVPazZvbFB1MkU2VmNx?=
 =?utf-8?B?SUYxRWlGMERqcnBoeDlnaTZ1andJNnNNS0ZNZ2QwcFFkdEttdHAvcmdiTkph?=
 =?utf-8?B?Vzl3V053ZkRyZU9tVkJHSjFOUGljVW5uWDFML1pUNUx1WWFwTVVoSWtpOXdM?=
 =?utf-8?B?T0RLeXZvWklnNEFGdzg3OWdCS0ZNajB6L2RDVk5melk5bXNsWS9CMytaS3VI?=
 =?utf-8?B?UjhIQm9MU1JJNjExVzlTR054YzBZTklRckZSNHJZZzBSTE1xeDhKeWF0SjI5?=
 =?utf-8?B?N2NVdC9JNnpxVXVVZkxhRUtTd2VGdS9tL3MxenlYOHVCWVVCQkxFSVk4VHRX?=
 =?utf-8?B?TjFhazlPZXBNTHBSb09nNnBNQjd2NWNqQTRpSWFQMlVFL1kwTWsvRW9lYzNQ?=
 =?utf-8?B?YjZ5dlc3eEVSUW1lUnRIZzVRalhhYWlxdklPcUhlajVxL1lVaFlKVjVDa2FP?=
 =?utf-8?B?Ujlzc2J1ekd6aXZYQVYrOWwwT25qUm0wUWR6bzluaVJNUDltUTVOcGljaGRK?=
 =?utf-8?B?Ym9MbUlMREVNVjUzYzhoY25QL2VkNnpvN29RK2NPVlQvSVJhY3JNY3Via25q?=
 =?utf-8?B?bitNM2J1N3F0enpEZno2YjVDeUlWUWFrSmlRLzN2VjVqanR0bzhIOTQyYTMr?=
 =?utf-8?B?SkVIdm9uYUxJVStCNmswSWxRK0syMURqN3pXSzZrcGExOUgreFY1bStZakRU?=
 =?utf-8?B?Qm9TN0FwQXByVlVmZ1l3SDFQRDZMNnBxSGgwSHR1ZkZPdzZOejQyMHlqbUk2?=
 =?utf-8?B?Tjl0cDRIN0M5YUY1bG9CNkdhdVMwWHU5eGJyZnpzekdna2sraE4xY0RXOFht?=
 =?utf-8?B?cW5IczlRbGRhQVN2aGs5ZzN2UnpIbThyWlRteU9PZU9qVmRaNGV6OGlDckRq?=
 =?utf-8?B?OXpvQnJIZ0RTMVpCVjZNZVJnblBzVHBLQWZJUEhMREdjckNWOHUwMzZpMEtm?=
 =?utf-8?B?bHA5dlYxUHZNSldsUVA5dGtBOWxIWTFSVWlnb2JhbWVOd3M3UUZsSllNQUJv?=
 =?utf-8?B?VWtOVk5UWmdBd3FJSGc5dTdTTjdEWXJXdm5wOUFZMmxZNm9PVHJXUTFFZTVC?=
 =?utf-8?B?endFUUNhSGdsakhBVkdOK01SUmlqaDlnYnFtQmV5MmpBY1JOa05BOCt3Umk2?=
 =?utf-8?B?MUdraHdPVWk1QzdyYktnTGJOMzlMZko1ZTFVZldEbkt4MEdpRHVoRnJPZjFV?=
 =?utf-8?B?Uk9QTHovWUFEVzNqZHhFUndKTmpUODJWT2I1aTVMQXV6VXN6djd6SlEvNGtu?=
 =?utf-8?B?Q1IwVTRnVWpxU1grRUZaczkvUGxVN1dIMTFxY09lN25sMnFFNzRvdVI1THhG?=
 =?utf-8?B?cVdtTjJEbjB3SU9DbmtLQUJvTEJXNUtmSFQzWDZiYlN5ZGpWWEJ1M1VOdjBL?=
 =?utf-8?B?a2ZMaWhIeG1pK0c0MDdaakVtdVRaamtxajJGVGxUdklUQjYzK05oMEtuYkdk?=
 =?utf-8?B?UG5Nc3I2OUhHSUpLWEZTZlNhcjRuSVJzOXAwU0xuOEdsMHpXM1BoODJiK1dG?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OiOzpPfDfcQmYKq4RHXO1PSls7XdV3A4LjCpbVhiz8YJo940IVTXIErP6gd36xDwCigfOPK71xJk/OEKXiqW7harhbnsCbSdtmN1KBaxmcLknOk8o1OmZZd2vtrTDSlX/zsOg364OdZl7CDBjowQ9alnRZ0VGsJcE0coDrcQu1cZbUaOshqMsPlbcKo7H2z3GIl5jYfsb+3sY0Wt/R9G+iX5V5m/Vp/KLlTBgIkuT6PKwnsCRzNs4oHkDgpEShtzil0OZRDo1DKFFTKYRasTBAV2X6k3esVKKo3ZFQVoW5ai+ol4hwp5iqha0GyLaFUFV6/V9ZHXKLYpN6jUGecEZhJcbHpqdaY6GvtRkLKJy5VqkRUOOAmc4cIlOSke+mAK4rzfEI0aG+7M01GsDpJfL38XQBuVj2FfAxcrQiXETbIsltcljVARpy8RdpywPYogSwYSg6zL1+HuJ1q4jLrqhkmU5RZhvAhHhVZf26/zf3HkS49bAhlg/wpNUVMHcqEDkNV9VPT6tCzCU0mU/BkavBeHqq6gah5nsSHUbBhRf99xGIdJUlRs+I4wXpfXVhqKQXzp/IaxvN5pywmott+r1d+D+4UxQHxR5FeI371MVGI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f411b9cf-57cd-4eef-5196-08dda3272aba
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 05:17:57.5340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KYxZceM2lgzIL2tSlDgvJQC4iTZImmCp9BpcXFfmazZCTi1VSHq1RVqoUDAB1qHICkta3veAnbxzU8rYOWwqs+ekQKf0OdDhZGR7Jr5kspE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6072
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506040042
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=683fd709 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=fOW4A4Px1FdUhDM7ErYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13206
X-Proofpoint-GUID: ktxY_GJFKlxSFpRUHmapWvifpcU8foUu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA0MyBTYWx0ZWRfX9GNqule1KwsW KeMRtS7QXiM9mPYA4aHsjT1AXGGL/PQSXyPYxgwtoD/aYROECGSgZxLGB+leIkfqhM9HNzIWTit Nz1+l8BA8tp6ayBbLuAZaOrh05midz4Wm38thvWqWoAADATpuJXBhiwiSnRapzOpUT4wFe6u4GD
 bgmn0It0DasbbPZmbhF4OgUkgEYyWY/OznVNh58ZMak5X4VYqYRsZtgqV6sQGZHYxpw1I1FarqY GZoqvUjBQNlYLuL8wkHiX0XGV9rUnSqVasUBwWALrOp5NggQUbJ9Frue7bhhPlzrR4Gn7HhW+r6 v2jwiuE0V8LWSu8rBuj/zyeVsLXRGaUpgyx4wr19BsnzC+7zxEZTko0DKaq3gvswNZs/tttyMLq
 4u1N5Q63qSAOaO+JqYgFjUTQ4rENmmZfUvLd8KM2VbBjCHq3gPA7G08g6v3HxEeFRgnkBT6y
X-Proofpoint-ORIG-GUID: ktxY_GJFKlxSFpRUHmapWvifpcU8foUu

On Tue, Jun 03, 2025 at 05:51:41PM -0700, Suren Baghdasaryan wrote:
> On Mon, Jun 2, 2025 at 7:19 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > On Mon, Jun 02, 2025 at 07:16:40AM -0700, Suren Baghdasaryan wrote:
> > > On Mon, Jun 2, 2025 at 6:04 AM Lorenzo Stoakes
> > > <lorenzo.stoakes@oracle.com> wrote:
> > > >
> > > > +cc Suren
> > > >
> > > > Suren - could you take a look at this please?
> > >
> > > Sure. I'll take a look today or tomorrow once I sort out my email
> > > backlog. I was away for 10 days and have 2K emails to go through.
> > >
> >
>
> I spent some time trying to connect the dots and still don't have the
> definitive answer. I'll dive into it again tomorrow and post once I
> have something useful.
> Thanks,
> Suren.

Thanks for taking a look! This is a tricky one as non-repro, etc. I suspect a
very short race window somewhere.

>
> > Oh man and I thought my inbox was bad :) Sorry to add to it!
> >
> > No pressure, just a weird locking case, I'm wondering if there's something
> > here or we just need to teach lockdep that this situation is ok.
> >
> > Hope you had some nice time away anyway :)
> >
> > Cheers, Lorenzo

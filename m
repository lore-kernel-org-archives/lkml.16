Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970D2748D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744602415; cv=fail; b=cYfYFfyAfbMpT9ZzIvya9dvTKT+cbVVFNwAG5b8vX2TuYMVkzzwuwRcS99bdl9hOEv83HoQ0griICXA4UWNrQLOA8dcg4yJWVjJtxvzEFKe/NhNhrJAydxcY+mgq3BWZiv07Zz1zPTIEqXAHWBbD6D0d251v3pJ0fcl6JqprqdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744602415; c=relaxed/simple;
	bh=AHJj92DKlvDLQn22ngtCnUDW/Cj1kJoxeMZhs3wnVHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V5JhDwusoFW5ltanRrMz+wI1dgNof8yxXPAfpvoMjFBOjp4iga9XS0QsRM7dQ5VilzJ0hjuRuTNOy4OvnWZFzGohpn2O0dtsE4yYKjgwuYBOl7DrUeuJVyPjj/cmjPP8MgTABIhIcV1ATKK1cn5P6YSo+kwF2r38DivBmJsDHyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dbtWDngw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LO+ai67A; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dbtWDngw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LO+ai67A"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E3MKj4000707;
	Mon, 14 Apr 2025 03:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=IvLmEHZA0zPv9FTSfiq/rKt9GX75OUBIareZZvifBFE=; b=
	dbtWDngwTs+RsuXUaN9vILsT55WI9i8RdCISt8IqVmkpUsO6pXrYGiOF3QyUY/ti
	45nzEfcaIGt96fu+aahnOsU6S0SRybrcG10ZaUcoNJeVsLAWOWyagbPw9FOR3jmN
	RFRBEojRlS3zYckyfk1rpQKDm6iQiJ7pKod7hgi5BHwxl886FCC3HyUNnaYoXr42
	tn3SOjAUV8f8xZzNIi0HGqne7q7F+KavtXa2cYIzPwyEACZ52OiUuGKO5BO2PlNe
	dnmzkz5+NTiP5IxUuTR4YAJp23cG8mOASKHdUZ9HQ7XhEEz6MA55XMcrtpeWqxcB
	cqtgQ1fvPGEnTJ2kkTJa3g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 460td100ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 03:46:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53E3UUVV024638;
	Mon, 14 Apr 2025 03:46:11 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010003.outbound.protection.outlook.com [40.93.1.3])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d4x6e8h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 03:46:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWaa8ujdoblk6M+e5EKgIuqr9daqTVPeyH9xJFgV6btYWMsy8XG9tCyQmAmIA9jfNaPO/XMQyJU52wurOzjeSYT7O9Y7VQkRpbAW/j9ipbVsekP4rR9kxk/PFNA2J5ZiRa98Xa+BRF/a6RZKgnDVq2rj0Cw4Z0HiO46aRc2NLHKx446MTSXRZlohf0TgfoCAlzUFIyJ/QLF6nmPYatLn3Te09+0gdsBzaZM5WGDpxQe4LIW4X28Fb5AmZlpD44pnCWtxii4CNVLySh/jMkApEI9Ax+I3iJ+VDg6Zx1j4NNoupN4D2g6dDsb3TD7y3GWSi1p6WqMI7SSIuMOZDit/MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvLmEHZA0zPv9FTSfiq/rKt9GX75OUBIareZZvifBFE=;
 b=HGnaD2eXzsqZH/5Cm3lB4P9DqplnnmkUbtWRlTpLxttkSiLSRbM2Fqf65VAPALSKn8QPTUAupcEnyjpl1xBawqdFUJrrtSNZ44Y42iw4wwmVU6XeDLxWNbHditRW/LrWVZqyT6nXhVgqRjsHqCKumb1LBMznFyvQiT58MFISR991WejXLEyVTuusynHrHO2DiWrgu7WRB2bbPEbCCFuQQ5xRRX7kJTUxP6r/iRcpiBKXEg6nvJxqvMsXPxZviagaHt0oGF2PQ8HSzC1sE4GpgxKpFETQMMgSioWDCF7X0CjhZ5vi/dw1yw9/XfiaNffIOysb05Hls9OVfcp00p8OJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvLmEHZA0zPv9FTSfiq/rKt9GX75OUBIareZZvifBFE=;
 b=LO+ai67Au/iZi62Ae9P0yreDOdT2NQPy7g1sLX+kEPDgUIua9B/SvDm4CIWFhsEDfZmjmb9/Z4hQnlc3ss5B3i1h8WAcWcoeUtq8xKvkLVC90SUKHSEcX9B+yA7mP3V7Co1xT4ebx4Zg5jXNQ40xUBMMMymHdtme+M8Gz2LCtBk=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by DS4PPFDB583D803.namprd10.prod.outlook.com (2603:10b6:f:fc00::d50) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 03:46:09 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:46:09 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
        luto@kernel.org, peterz@infradead.org, paulmck@kernel.org,
        rostedt@goodmis.org, tglx@linutronix.de, willy@infradead.org,
        jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
        ankur.a.arora@oracle.com
Subject: [PATCH v3 1/4] x86/clear_page: extend clear_page*() for multi-page clearing
Date: Sun, 13 Apr 2025 20:46:04 -0700
Message-Id: <20250414034607.762653-2-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250414034607.762653-1-ankur.a.arora@oracle.com>
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0340.namprd04.prod.outlook.com
 (2603:10b6:303:8a::15) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|DS4PPFDB583D803:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f644c2-a573-4d97-876f-08dd7b06e4bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dYGOXcbeHkDqStIQjEDZ0jf7mSYRvBSWtSqYUFE0GmY/A6lt5f6EKMlniizO?=
 =?us-ascii?Q?tc4lmuy4Tj+ai72Sl7AwQZepiw3fuG2nl2A0DQH+uqx4xRLacPt49ThU+O8R?=
 =?us-ascii?Q?746MyiZYcfGTGEBTEemqBl5MykU9yxgTOxLIBAEPe+yxb2vgO5Whd6dfTvZ5?=
 =?us-ascii?Q?Voc0k0ousF/KynkHbAJ5vS7uwJtc/4bZwSeuIjdIkY6614m0nXyaI+DvCx3O?=
 =?us-ascii?Q?UYUUhFC96e58ieQP46bEkvn29sFFhZCZEUMRtIEez/a/TXZv8H0O5pV+fsw+?=
 =?us-ascii?Q?5W2gjUiP04Yv1ikUH025RApx5yXJLOkmPXJPQXeA82v55UgK2JAiA01lgnZT?=
 =?us-ascii?Q?ga9k/VvOLiLPv2OhUgQD4wU1j9o6PoU3aeT9GRcY0KI1MXNK0KjQmtAlaYMl?=
 =?us-ascii?Q?LmhseSJwiIdlKECBFOkXKw+KVbVAljSZoAY5JDvVc8VGjw4ApbVUFys9V0NT?=
 =?us-ascii?Q?Bk/7BMgIj5Z+DUMiaDcTK4/xjfvsXvAGlLQ5Tgk8WDrtrmj+2Kura3owqAtu?=
 =?us-ascii?Q?PJnFT7i5Zx3ncZuyxP7fSyJ+OlYGYi7eEybsP+ENZl9zovaqP4Q+HZVH+kC9?=
 =?us-ascii?Q?h4Pa7YKRRcunyO3uzz471K6Ma2NE7Ip4pf6BYYha7T5/HIiIKXtUchTp6Zms?=
 =?us-ascii?Q?B75VDq6NjoZlKGn9WbZapvMHMV62B+V0whWft4kkcmkC+kfLqr7MoK9Al0eh?=
 =?us-ascii?Q?yiRWNZrqrxdePi5/67x7uSN7KU60cqCAy2UDwhueIZSLkkL397Gf/GcG7Uir?=
 =?us-ascii?Q?Wt/y7ijcyCTSF7hVTHcLGKS2etDSsZDTMIqRVzmq4D1avKQJzDoVFDKbKnYW?=
 =?us-ascii?Q?BWE2119mxNR2sUrin0lMJy9HmP6RVTC9EHB5RdF4p1F7uPObEtDx1Y6JVtxQ?=
 =?us-ascii?Q?A4CENARfJtBVlQgOTZv6Mh0i+P3R+lmCnioTktFfV9zfpisyHbqryLRGXIzI?=
 =?us-ascii?Q?54aOefjbjob91yLNhcyq8KvWK1eXXfTIZ8KFhcOgwwzN0aCtc70K6VLLjbap?=
 =?us-ascii?Q?rsJMJI8tYw1yWQBjEqMKgY4b40FtvgMf2G2nktgYsKjaRDFvw84TKdlF4kFb?=
 =?us-ascii?Q?2nWOzQ+/WqdWbwv6eCAn/aauzaXyBNc70sTPh2TGdbC/EQiSCK30V7llpjRE?=
 =?us-ascii?Q?0ZJnLyAm64zq91n6udPSHhlpco4A9uKekTKQfHoam6CV2Jz58Nyj1tn2BP2/?=
 =?us-ascii?Q?udSGLS4eqIwBsqq2hK/4lZvi+hdiTygqa34ePFry8WgCQBopuy4011HDnyvH?=
 =?us-ascii?Q?oAQ4nHsU0Rw39mPQxuYyCTRVzo6LwH6+5TZGcCsXpATkZcnORiJrZIFwGzpw?=
 =?us-ascii?Q?PV4Gu0cnnlo1wlSterVKS5J7au08Pp2Gc9PoaB3vzO54ghQeuOw2x4c6Bf08?=
 =?us-ascii?Q?qWYtOG37a6lZrq7ho3RtIRlLGt8WtI2RSKHw50Eu7X1SCLvr/zTXhH5417WI?=
 =?us-ascii?Q?dp7LtqPZc8w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LDYjfWQJTjlfGAHYdVbJk1/gHQsC//UHNTyjERnG3d6aa7HWLHEXS7oEDbjL?=
 =?us-ascii?Q?ML/tyjLYmvyzg64htSG8LpaxCyD+gAmSxc5yOr9bg7q/zTY+/mLxnp7Eb7YE?=
 =?us-ascii?Q?4qrAhA30b7dy/BTc5nU+KXK4/Vj6QuumIo4ZShe5Np+33c8R+kuY2OSYoJo9?=
 =?us-ascii?Q?xE0/ivxQyGgTzLvKzOP6G5c9JKgn66zYyoOwQF3Vvh/Rq5xK949RFCPY2jmE?=
 =?us-ascii?Q?afdWMWODZIYGZmmhJZu15q2kGrTMxkao2t1eTnLl6n3uBccE8zjTrgowxOP2?=
 =?us-ascii?Q?Hi8S2H8kOJa1utu0dtJDypaRk2qlQD6YWxqBwbvy6m7bMVr1AAUbFTS2rh9m?=
 =?us-ascii?Q?4oMPKYuWffCa9B0soXj+WhbA5MeeuqWR3pFYcx2ttUqgZvW9jgv0TwGrAksI?=
 =?us-ascii?Q?Cz6Fshkbpj+Cdi+jiSAoT7m8VwzgTXcDtZnh9R1Fn0NJ0egOV68yjMu046xV?=
 =?us-ascii?Q?qgZkTa2TPbR1vipFvnrfGeYCojn4N2lKkbpOT6+awH5SRssNy6Uvgrqli/Vx?=
 =?us-ascii?Q?+mIGs4/H+nCU21s9fMq7EmXW3pW+Qe1bhqTMW46D5/3R3uN93GzMUtRMRIyO?=
 =?us-ascii?Q?mTbop8zlcW+ead9SgTzuFduHNrPxQIgDv1v4pgW7GKWnwYcYxJughJj5Stti?=
 =?us-ascii?Q?uLQd/8cJen5TgVzX2QQCrqqEbJ5DD6NHvFVyLVIL4bWVvaoe+tCLh4pnljJ8?=
 =?us-ascii?Q?C9e3W8XD6ygeXOlrMPgICWh55GVdxu31I0X3+noc/bGIXg1twglc6cZRrXke?=
 =?us-ascii?Q?wegXE7QmCs1Py6FmGShSPRT1oqL5ocLooTVLz/pVbuBMAF/kQc7bXw0462P4?=
 =?us-ascii?Q?CyD9GLxx3vR9oNOC2vgr5unophu5KUi9JjOwjyT52S5NdSoDOsuvryT+6Nmp?=
 =?us-ascii?Q?Ay0sw10RNuWbfi7owUNcQrlNsXc6NG8jcZkduTazQsTnnz7PJslxfc0MQ4CY?=
 =?us-ascii?Q?5N8N9uC2EGxNRgJXDWqdtam9EQi/GXDeIZcBMxxU+bwmHeA8NKsvFZLzIBQv?=
 =?us-ascii?Q?++sOssmtRzd8W8JuTrKDCNUKUlH3PRC0abTqGQ5Xq55vIuf0oCPT4MSxq/hL?=
 =?us-ascii?Q?egLuSd0AVzl6eob8xsJUamwyYaE7Mlio99cXuXUrzNPe6TWkTpbQvrSV1YXo?=
 =?us-ascii?Q?VLkvQeBMSrYgZIREuWPPdRlpGLfDpnfOD9U9mg5ijWReO324oSjSy/ELQ2d2?=
 =?us-ascii?Q?Hw9IpiiEXnnqJHcBDJfpMBm4tx/CSdvWthiV+ThnDVhqf8kC2YupQzDOIVza?=
 =?us-ascii?Q?XazEcJa7rhubnDWas1niaSOCN5jh6Zp21ToglPuAnDxa4fCxbubgVVj1vwk7?=
 =?us-ascii?Q?NFOsHOjv34zR5e8kflf/qSD/recRGWa1vXgW7uS5YZkVyvLwGhIh+h1KQZxc?=
 =?us-ascii?Q?5ybidCbPMjVPMOmOy1tdx9G8qAZP/bR5hNtVLVRhOHScbq+Lf3CZ3g3/m8cD?=
 =?us-ascii?Q?M9q34SpRL+1o4kBJsrBNMOOKxSgdGakm0DWpRYUMxjt7HXx7BfFQ8eNGC6ve?=
 =?us-ascii?Q?UbDQz0y/dz5VrHKsAsRRN6cLzwZtEEYv1WcEkQMCqRMK5m4Y8RUBDF2zfDjs?=
 =?us-ascii?Q?OjAZALFayi4kAFTdr7dp5EE4kYToOM+FklY3hlqD8wZkeuvHaPqMT9PBDa87?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Afan5+0HLc2jaVUM/eBz+uxTKESeV84DMkXLqmXTp6Qk7tImQC7fojNnUiehIS0YZXput7Xu9PGJEh/6XluBCwYTAE4+qUkvHpn2+BvKb+Li5g/pBLPDEqHhvwwNKbXDmk2H1d+/QwWFZ+zwHHlRnK5Pxx07TgG5vPZ/TVx6V6VWpBnikrxNnsTOxzejx+wVYl2wZA8IvWZFdqi8p1HDiQLo+MJ+nzcVLRlkXOcoiK/N4TD9B2FjVTMjEEp0pFcK3MvjIP6JzwIQnSOUEPYItvYyRK6GbnVRtkj3Z3R2SkOUKyY/7PeYmvhHBFto7wTXyQpW/f4o978BWuUVDXy6OYqwxRa2J0BCk+WXkQoD/bKSJV3m/7aIhKZC2bwukAdree+UmfSHe6i1wTgazI4EEaEtmuMI6jp1AtBBXscGMlQ+n61a98g+64iz02XBF11rDxSSrq0h8+1gJqzs/bXE0XfodLHnx6qApCod/ysmge4C6SuI9jmKIgZMqCB4vfrZt2uHuRBwXbaEamiUK/33KSgQ541vZAoK9j2cZtwXX9D0OPSx20L9EPlcMSUjSQAFF6UcAS8HvH7hOMAnIkczG9bWWLky7ZmTZdr6lNUsE0g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f644c2-a573-4d97-876f-08dd7b06e4bf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:46:09.5459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NRgNwNkOqwC0V1/AJVVknSxFhHFjy3O2O6Yf5Bh1GEtT9J+izpX5dLsK+6AJRYrZIPds/6T5kUgVR29oIxQsk4l8ehUqboI87073ZIdaX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB583D803
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504140026
X-Proofpoint-ORIG-GUID: hqmA70WF9qnVQQHmjhfAeWjqmhgfLc2D
X-Proofpoint-GUID: hqmA70WF9qnVQQHmjhfAeWjqmhgfLc2D

clear_page*() variants now take a page-aligned length parameter and
clears the whole region.

Rename to clear_pages*().

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 arch/x86/include/asm/page_64.h | 20 +++++++------
 arch/x86/lib/clear_page_64.S   | 52 +++++++++++++++++++++++++---------
 2 files changed, 49 insertions(+), 23 deletions(-)

diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_64.h
index d3aab6f4e59a..45db74db9021 100644
--- a/arch/x86/include/asm/page_64.h
+++ b/arch/x86/include/asm/page_64.h
@@ -40,22 +40,24 @@ extern unsigned long __phys_addr_symbol(unsigned long);
 
 #define __phys_reloc_hide(x)	(x)
 
-void clear_page_orig(void *page);
-void clear_page_rep(void *page);
-void clear_page_erms(void *page);
+void clear_pages_orig(void *page, unsigned int length);
+void clear_pages_rep(void *page, unsigned int length);
+void clear_pages_erms(void *page, unsigned int length);
 
 static inline void clear_page(void *page)
 {
+	unsigned int length = PAGE_SIZE;
 	/*
-	 * Clean up KMSAN metadata for the page being cleared. The assembly call
+	 * Clean up KMSAN metadata for the pages being cleared. The assembly call
 	 * below clobbers @page, so we perform unpoisoning before it.
 	 */
-	kmsan_unpoison_memory(page, PAGE_SIZE);
-	alternative_call_2(clear_page_orig,
-			   clear_page_rep, X86_FEATURE_REP_GOOD,
-			   clear_page_erms, X86_FEATURE_ERMS,
+	kmsan_unpoison_memory(page, length);
+
+	alternative_call_2(clear_pages_orig,
+			   clear_pages_rep, X86_FEATURE_REP_GOOD,
+			   clear_pages_erms, X86_FEATURE_ERMS,
 			   "=D" (page),
-			   "D" (page),
+			   ASM_INPUT("D" (page), "S" (length)),
 			   "cc", "memory", "rax", "rcx");
 }
 
diff --git a/arch/x86/lib/clear_page_64.S b/arch/x86/lib/clear_page_64.S
index a508e4a8c66a..bce516263b69 100644
--- a/arch/x86/lib/clear_page_64.S
+++ b/arch/x86/lib/clear_page_64.S
@@ -13,20 +13,35 @@
  */
 
 /*
- * Zero a page.
- * %rdi	- page
+ * Zero kernel page aligned region.
+ *
+ * Input:
+ * %rdi	- destination
+ * %esi	- length
+ *
+ * Clobbers: %rax, %rcx
  */
-SYM_TYPED_FUNC_START(clear_page_rep)
-	movl $4096/8,%ecx
+SYM_TYPED_FUNC_START(clear_pages_rep)
+	movl %esi, %ecx
 	xorl %eax,%eax
+	shrl $3,%ecx
 	rep stosq
 	RET
-SYM_FUNC_END(clear_page_rep)
-EXPORT_SYMBOL_GPL(clear_page_rep)
+SYM_FUNC_END(clear_pages_rep)
+EXPORT_SYMBOL_GPL(clear_pages_rep)
 
-SYM_TYPED_FUNC_START(clear_page_orig)
+/*
+ * Original page zeroing loop.
+ * Input:
+ * %rdi	- destination
+ * %esi	- length
+ *
+ * Clobbers: %rax, %rcx, %rflags
+ */
+SYM_TYPED_FUNC_START(clear_pages_orig)
+	movl   %esi, %ecx
 	xorl   %eax,%eax
-	movl   $4096/64,%ecx
+	shrl   $6,%ecx
 	.p2align 4
 .Lloop:
 	decl	%ecx
@@ -43,16 +58,25 @@ SYM_TYPED_FUNC_START(clear_page_orig)
 	jnz	.Lloop
 	nop
 	RET
-SYM_FUNC_END(clear_page_orig)
-EXPORT_SYMBOL_GPL(clear_page_orig)
+SYM_FUNC_END(clear_pages_orig)
+EXPORT_SYMBOL_GPL(clear_pages_orig)
 
-SYM_TYPED_FUNC_START(clear_page_erms)
-	movl $4096,%ecx
+/*
+ * Zero kernel page aligned region.
+ *
+ * Input:
+ * %rdi	- destination
+ * %esi	- length
+ *
+ * Clobbers: %rax, %rcx
+ */
+SYM_TYPED_FUNC_START(clear_pages_erms)
+	movl %esi, %ecx
 	xorl %eax,%eax
 	rep stosb
 	RET
-SYM_FUNC_END(clear_page_erms)
-EXPORT_SYMBOL_GPL(clear_page_erms)
+SYM_FUNC_END(clear_pages_erms)
+EXPORT_SYMBOL_GPL(clear_pages_erms)
 
 /*
  * Default clear user-space.
-- 
2.31.1


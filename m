Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E557C18FDA5
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770441; cv=fail; b=jrmu6H1aSTgeQ+OeCmVlf5YQfjeOthF1vnXhyVPk1Awh9/2p/x/qRCy3Tb54rLjoz+bFL/SxVwmAPFjS3yBYvg3XsY1YwllycFpe4GuHWKz4TvmZIhxJser5UF3ZcRRGK53Hkr+uwy7a3B/PX95/4sImO/yxEQIfTGCv1mgMQbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770441; c=relaxed/simple;
	bh=UdvWd8WgTVOp6BuZmyh7gg3Cn9tfs1DY+jK5cot++a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iMu3vHtB8KN80Tjgxfu0S2WGc0qt6IRM3vSD6T+CCJPeKjXfRoN8oSMBmjmyVpSCVvAjh+tcBgo1FIa9gEHJXMLPpLEPc8jATdYt40pdke9ohWH3x/yeFaVhLH84ycf2dWkAj9gXLNPU+3wk3KcirL6N2XQtYhDzBD5zZa/t5YE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MOBoLMqy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Zd2V+hLE; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MOBoLMqy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Zd2V+hLE"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515DRQFo028413;
	Wed, 5 Feb 2025 15:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=tmzA3SiuBkVV5/pc9de+rJeT/nFZ5Nul/LhwhJITls8=; b=
	MOBoLMqyBmjvZSlNPjH6JVonx3ZEI5bexBqGsNvsoEgud1+WpOr/nSAyT7LAXXwM
	2P0vhStuJN6vWpuur17ZjuIdig2PGk0mhDsEcfQIeaU7JH3TevfyG1lrEEdXllwH
	BH2ROx2VlGToCx/1S5AynC4RyXKMYIUUOhaePIkYMF/eAmd0JcKscw/1uDFsCOry
	d7AWe3egWVxOOS201OU+XleMkHrSAASPQda1Sbtw/WRibxV6Lx/t7F9ZN0yqvDLN
	4gRxn83cNqho38vgD+d8V4sBdBwLpPbCGtv7pxI81DHJWM1zy2Z5Bm3m2Q3z8NHy
	UE2578xAH0ZMJ3KC7xF21Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44kckxkbgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 15:47:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 515EcDfI023618;
	Wed, 5 Feb 2025 15:47:09 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8gjg7a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 15:47:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPLrIbtb6vN5zBh5z61loz+9f1bGitoEGMQ4O8j/ps1yVdxi0xjQLl7I+RZwTV3Jr/9sIsQIHqGojZHNRh8ii0XYJVU+OZj/GAiEm+AhMFaf5O69kCgARXVerrBogkZk5CkbpULvdac2YBukJT5zU/3fjbwYzOUuuUB2vMXAlX0rG1h51lbYhdq6EIVqu7izVBQnHdwdtB862A8n+dKJDvUqpRmWXZo0XgVxJtdjLKEVA6TCAlbbSgVg0mTw8MmwNrYGAI+euAa8fKWWbx57s84QjTrK3HGsy6bA7lYDHk+BfEWC7eTSQ2+EY9xseeIhu5/OD9QRVjWnsZjZ+erXpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmzA3SiuBkVV5/pc9de+rJeT/nFZ5Nul/LhwhJITls8=;
 b=mtZ+dgfDWCuNtQnWt7rlIimmt8dRbUfS5O+VTLhS83UFRseN4GN4oTFYh4gK/zuY1d4gXt01JxPb5Fj1gKsXNP0C1eMIfZi9IBMD/lAKeCd43YJneQG5IenoTmg1DAQB0ArFx3fiGdNdFc97T9wNa/ZJYnRkjkWV3Bqh/IZ1LvN5quVvOzjdL5OAgUusprfzMIl42Ivo7lVIElwnDwIKXwMOZDVlmYaElP5A0j81oZATSZKwUZKUzzSZPIsGovJJ2BF6rs28xed66M3kPZQycLodvNWceIDJrrsAw9qZMV13jlAiQ73L3A1lhBwieGXNC68sB0cLSEp1mDqxuor00g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmzA3SiuBkVV5/pc9de+rJeT/nFZ5Nul/LhwhJITls8=;
 b=Zd2V+hLEtdyYcbmabMNhC//aoSef3sxfVrqLCvMKp+kTdBXaqOljw87vgLxeURFabZmD4fmqZ+kyuBOrIcnNhFy8dLiplM6omeSlt+72JagTUZv78kdIAc3qOCP28VHeNjNzguuos+Kbk8PezKgkO6qT2M62siAS4OA6z13/wyg=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SJ0PR10MB5629.namprd10.prod.outlook.com (2603:10b6:a03:3e2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 15:47:06 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 15:47:06 +0000
Date: Wed, 5 Feb 2025 10:47:03 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Jann Horn <jannh@google.com>
Cc: syzbot <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com>,
        akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, lorenzo.stoakes@oracle.com,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] KCSAN: data-race in mprotect_fixup /
 try_to_migrate_one
Message-ID: <tuqu4yuub5mj627dobasbiy4hbtkuvrk5gyqqf5zynli2t7xod@jxxjoworr7tp>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Jann Horn <jannh@google.com>, syzbot <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com>, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	lorenzo.stoakes@oracle.com, syzkaller-bugs@googlegroups.com, vbabka@suse.cz
References: <67a34e60.050a0220.50516.0040.GAE@google.com>
 <CAG48ez3KKEYRU+-Mkk+tq1Onv3QWg0jP6fEKYjNjRS+ziP5dAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAG48ez3KKEYRU+-Mkk+tq1Onv3QWg0jP6fEKYjNjRS+ziP5dAQ@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0289.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::29) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SJ0PR10MB5629:EE_
X-MS-Office365-Filtering-Correlation-Id: d9501725-dcd8-4836-5b8b-08dd45fc57ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHJsejQwUlF5N1FWMm9QV0dPV2dnVFAzb1Y2NmxqbUdBZjlJNTJ5ZXBMeGoz?=
 =?utf-8?B?K2d4RWV1dTBrNVY2c1c5WWFiaCtPNVhVQjl2NGdvb3FqMHZMdEpOTGlLUWR2?=
 =?utf-8?B?dUhRMXRYdlpkSFBsWU1YUzBKNmtFNDBiMjA2Wk4xdmZqQjgralRZQksvTHZT?=
 =?utf-8?B?YTQ4SmozK2cwNWpXSjdaalZHTXpUUHppTk84SFIzSDZxSzc3cy9sZm1kRHQ5?=
 =?utf-8?B?VE56NUFNTXV6SHpWZ09nUXFoZjM0Tkc5MktrK1JHVjRXUVNFaUpIQklJaUh5?=
 =?utf-8?B?aU1WQmxGb3VMYVhOekN5S0Vla3l0RnhwaXdNNFFBUlNHdVgzcWp6ODdqR3Rs?=
 =?utf-8?B?dHYxZFU3eW9XWjJxMFh5SFJ3dUMwRUZ3L0c3aEs2TXd0TXJBYUNTV0kzWnY3?=
 =?utf-8?B?bEhMV0l0aXZqWDc2UDhvYWNpeTJicytOZXJHdlZxT3BKdEd5a2dWV1Z3N24v?=
 =?utf-8?B?N3ZuejY4ZXZDL2RibkVqWVREdDVWNTA5amFzTG4vS0praldRcXV1bEFNVE90?=
 =?utf-8?B?OVIyalVjaE03ckY0Ti9KMTFBb2t6WktUUWhKWGRzOTZ4WUM1Qk9TdHROSmpB?=
 =?utf-8?B?R254bEVSb0RvL1JvMzRpWVRWcm9sMmJwN2lJV2wwWFZZY2ZKZUM3NkhwREYv?=
 =?utf-8?B?NitDVUgxS1oxcktJYXlFYmtFdXBCT3JGNkl5RnJFNTBNdWorTGlIZkM2a1RW?=
 =?utf-8?B?Mmt5TnNDZTJidjJ5eVhuY3EvZ2JacDk1cHozQmtPcGY1NG0xSEdydWhjN0VM?=
 =?utf-8?B?M25DeHZMbm1IR2o0WEFSb01KeUEyaUR0M1NtdVBjNUFJQU0xbHRObkJDaXFp?=
 =?utf-8?B?WlJFQlBuV0VRdkwvZkVzM1lRdFVQbnlTREp1N1FHVGloajQ0YUx1bHRCS3hQ?=
 =?utf-8?B?d0FZRXN0VFI2SjRBeWsvY3lNYVY5cFJxSlRzNjRyZzUxUmY1czdleEpDUkVz?=
 =?utf-8?B?emVvd013MWNkL2R3eWx3cGd0MjJ1Z290QS9BRk5KcWNHNTBucExJNVRNUStE?=
 =?utf-8?B?UFhqTEVjVUxObTVtZ2hlbHZiY05pUWRQeXdlWGxGODl6dDI5Y3I5VHpvUlRZ?=
 =?utf-8?B?Tkk5Y0twVGJ0WHVlb3lXZ0RkOTNNOFpxMnFIdDl0NVVPOFk4NW5OZ1FEYlI2?=
 =?utf-8?B?a0liMzFxbS9kVG8xMzZiRjJ6UGpnd2UzbFNIaFRqZkliUEQrSVBOU1A1cktI?=
 =?utf-8?B?Z2VUV1VDTDFuUnV2Umt1OFZ4UDQzc1g3RHg2UDc5RjcyeVhZb0s3MU5QVnVu?=
 =?utf-8?B?eVIwVW00OG1xTjBJaysySDhlNkNKbVp6Q2p4WE1ZNUFKbVh5b3RkRTE0b3hJ?=
 =?utf-8?B?djNvLyswVXVOUlVldjRKb3VwWnF0YUR3elkzL01wOVFsYVU0Zzg1alkzVjNq?=
 =?utf-8?B?NThwbGNqSkk0VC96dVhUSW5iRVBzOWxvUW1QWFR4UUUzekFXNnl2cWlaY3JQ?=
 =?utf-8?B?bmxabmVGWFFvbndmUEhTVnA5YW5CR1BDenh1VVFnY2FzYUYxUWFKanFHWkxC?=
 =?utf-8?B?c050aXV2MTZwTHQwbXJCZDhZM1hUVTNicTloOEd2MXpXSk95OWttVkgxN2JX?=
 =?utf-8?B?U1lVY01BZTdLU21SY2lHNlZsTTNpTHFCWWpid2pIeFVmSVZXZ3BBeFVQVXRL?=
 =?utf-8?B?dlc2U0lib3cyb0JrQitCdEZtTlVhbCtvRXVTR1VBTm83YkxYZG0xUWJqK0s5?=
 =?utf-8?B?akd4WDI3SHd1YWpIUXJlbHZaS1MreFczaDNKNzU2Mk5KWjR2dGgzMVFBbk96?=
 =?utf-8?B?OWJFdkxubWtYaUdTYndPUy91RWFxVld2UUVuNVhBRVZUYkRJa2wxekFOTVh1?=
 =?utf-8?B?NXNpeFY0enZaY256SitlUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWl2UlVoTXJDdFgvaXlFNWJhRUxKanlJMkN1aEJiSUV5NVVReEZjZ2lzbTRM?=
 =?utf-8?B?SE5aRE5KZ2IrSGR2WERtQTVXeVB2UXV4RjBRekNEQmp5NG9Sbk9wNE56SDdY?=
 =?utf-8?B?TVlPK2tQbXdPVUg2ZkVGWm56WW9kOFJDZXlqQk04L3RXSThGRjhVcU5oYVZv?=
 =?utf-8?B?WWdEQU9qL0pBZUlUbmdPSjJSSERRTTRrQ3JxS1o0enBKZnpoNHNRTVlhMzNF?=
 =?utf-8?B?T3A4QUY4bmNhK0FVaHhnbzF6TkVIYVp6M3g0b2djUjdrKzlEbGc2eGJJd3N5?=
 =?utf-8?B?Nm55Q1d6RTRNdUtWTHZyZWFVZ3FoencrbnY2NmlZQ1hVc3VZaHZ3VHBabGgv?=
 =?utf-8?B?T1dsMkhFZWpPbHpyMkNlMHBhTVlFYjB4cHIvai8zNDJxeVhzdU1ubldMdElJ?=
 =?utf-8?B?V0JwZHRHMGNSMUh1V0lQdEtGSVBLbHo3WWdqcXY2SGg3L1EyU3Z0a05XM0do?=
 =?utf-8?B?dzBGRnZyTnV2aElSa2JXYzB4NHI2M2hzUDNld1ozWGNxRXE2Y2tETjRvbE93?=
 =?utf-8?B?aWpCK2pyajNtUEtYbVFsZ2l5M1FqTkhiSnhEOU5seUdoRURBZ2ttc3FtOElr?=
 =?utf-8?B?bDMwM0dZNml4Znhyc2s5UTJOOWY2cUpoanprdXJYVU1TaW1BZ1BiVUltOWNS?=
 =?utf-8?B?RFFCcktna0lhWmtOa2FzbngxOFFEaHJNTFNGSkw0L2ZpN0F3UHBwNjY2cm5o?=
 =?utf-8?B?endIUXFwN0xUbHYwZGdlY2FEY3grNEhBSDdXZjF0QXpYb29iM0pCbzlqTnFl?=
 =?utf-8?B?UnhEU25zMlAyTlJoT0Nnbjk5bWpKVm1LVHRVcGRoWlErWFVyRTZLN0JXZS80?=
 =?utf-8?B?NGxPcUhKdHNHUUdDMUFRa1hXVlR1QkJ6WStXMVdZQkZwcHBoc3FDZHlZdGZP?=
 =?utf-8?B?LzBqRWlIZml0SXM1RkFqdUxJbUhabnVKcmQvOURoelhaK3pxU0twemcrNXgw?=
 =?utf-8?B?c3Z3aVJ3QVUzQ3p5NVhObG5RcWplN2RDQUJaZHZzdGZ4SHJjY1NBbFV3WjhZ?=
 =?utf-8?B?ZkUwTmh1OVlMbVg4eUYwUXNrU0w0Sm5sZ3ZyMnh6Vml5MnVwdFRVdTh4SnVB?=
 =?utf-8?B?VDBWd0FvNzRmdzJvc2t0Wjdaei9qR3VBUi9Db0VFakxjQW9CR3MwY2dXdDVH?=
 =?utf-8?B?UTB4WlZzaDRLTUw2WkhucUxQVUtIZktsS3BReGlQUzB2TGZEMGVGYUg5NWFk?=
 =?utf-8?B?SEp2RGNCMnZ6NmRJck1idnJNTXh5azB4QzBTclAxeVhLbjd6eU5xTmZQWFdj?=
 =?utf-8?B?WWorenBFQnArR3dZakV4MklEV2pnbERVZ3o0clYzVEphRjQ5b2VIYXBDSzFG?=
 =?utf-8?B?VFdGMlhJWll1T0JGTmpHa3lsMUZvZVY1TmhRWHYxdDh3ZWtvczFqMEJlbmtJ?=
 =?utf-8?B?Q01tNjBOaFhNS3dHcHkzdGhiSE9pVDJsNEhFVHNKdWdrZmJWaVNwbjhvSHc0?=
 =?utf-8?B?TG84NFU0N09XREhFRThCSmVkMWt1azlncFVFMFp5MmxCUitBZXlIdVBlMmJp?=
 =?utf-8?B?OEV5NXc2WTBqM1A5L3o3cTdwUHh1Mk5oOXdXakZiVU1tSUd3MTErN3N4SE9S?=
 =?utf-8?B?VVo2cFN3cDltOVh6WGUxZHlIZUszLzNQNTZ0alpUakZCTkh3aElKSGw4UVIy?=
 =?utf-8?B?cnpvMDVaakhMWXI1aUcrY2JFYXhIZGtpNlJzRklXN1RXM2JnK1poSzFNUnpF?=
 =?utf-8?B?cWxORmhUOFNhMU9lQWdMNExoTDB4MTJuaE9lVTM4QkVwRDVOQTNMZHFXS005?=
 =?utf-8?B?dlZKYVpDNXl2NGl4WStrcXRpQUN6Z2NOSzdIZWNUdjArNEE1Nnlhb1ZJcHdm?=
 =?utf-8?B?NWluUDQrbmlaZ2xHSDRWNjI3VElOSXVEallWdlY1V1loYjVzaHVkOHh1Q2RB?=
 =?utf-8?B?K0w1eXRPT3FxTVpGMDdpY0Y4cFNOWUMyWk16SmNOdTNNOXBPS2JyTDBZa2lD?=
 =?utf-8?B?Vi91M0c4OVRPVFJkaEhDaThvemVCOWtSWUZKZm5GbDJQQWZ6RFVNNUE2Qktv?=
 =?utf-8?B?UjFkZy9acUNpUVJrRFcxZVRuUkhsWEIvVjY2NUF6MTFNa3RYK3Uvb0htcjkr?=
 =?utf-8?B?QzdVdEhDVmFKY1lJVTJnT2FJbkg1dm5VWnJPOVRlSm1uUzhjS0QyOUg0Y1h3?=
 =?utf-8?Q?AyhAoL3Qu2hzeKOr+GGfqH91S?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4Cu/tPeSvgfqmu7lCxJMnaGB2LNi0l5qwucXioWWvLmUP1p1glpfG7rLGXFWrgwPjGQci9emq4wxF8syHp4+CUW4oPphIy5ZuCpYwtmgQV8QTdp6pYLs2+yZr+5DAWR8SXk70ahwJaHV1Vpf8x/Aec14Zj+azgEUvvDD/4RK5CO5Ftt3sDe9QVqTbNyyFGc0yU/wyYCg+bw4h697JY+QKIlbjESM+3oDQjaA2dSldD5K1J3LtprGKHBOk6IoFusTeTyGMcW5SjxQdM+Xrgs1Tl2lzCkuGEqwi2Lvuwt0qvTJqDt+gEOCukM2ZWWi+wqibkA4pzvY9feQxkE5iA1LZrmqd01JxoUksbv9cxKkL5b43vM1nsWn+5Jpf+PLJhbPeRTr4JGkXciPbVq0U4xXCWueLvZ66ySoeMwpTVPdd193ss4UlO0JZTjEBrp5JO2Smbx1OlnjsQpr50gzWtyXPZ3PW5+3c+pSr+67TkdV2oXlPP7uxXlL0pixzpu0BeZtRXkZH7OtYJuKiY1qbSSgOpsQUluSJ1ODwT79cjNwFe5rGGC5MChU4Uxg4ckGJaZAVrmnAzheXpkw4xssCS6M/VYNs9rrSRgQCTI4VfdgDXY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9501725-dcd8-4836-5b8b-08dd45fc57ca
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 15:47:06.5000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rb1Knbkg8THpT9ugvT6yTO4b3RD/CKqaFyPvpBCyIlXXLnPc0FshhkjAAdN7zQdLG8O0csD6mGkumRhlGwRKWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5629
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502050122
X-Proofpoint-GUID: WsuHHHUV5MRZQgxVYTFw9YI4exbYrnLv
X-Proofpoint-ORIG-GUID: WsuHHHUV5MRZQgxVYTFw9YI4exbYrnLv

* Jann Horn <jannh@google.com> [250205 10:00]:
> On Wed, Feb 5, 2025 at 12:41=E2=80=AFPM syzbot
> <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com> wrote:
> > syzbot found the following issue on:
> >
> > HEAD commit:    d009de7d5428 Merge tag 'livepatching-for-6.14-rc2' of g=
it:..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D12b678a4580=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D9e757e3762b=
d630b
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc2e5712cbb14c=
95d4847
> > compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for D=
ebian) 2.40
> >
> > Unfortunately, I don't have any reproducer for this issue yet.
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/9235000a1b88/d=
isk-d009de7d.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/098ef82f8ab3/vmli=
nux-d009de7d.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/4f51f5eb5782=
/bzImage-d009de7d.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:
> > Reported-by: syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > BUG: KCSAN: data-race in mprotect_fixup / try_to_migrate_one
> >
> > write to 0xffff888114b41700 of 8 bytes by task 6432 on cpu 1:
> >  vm_flags_init include/linux/mm.h:875 [inline]
> >  vm_flags_reset include/linux/mm.h:887 [inline]
> >  mprotect_fixup+0x419/0x5e0 mm/mprotect.c:679
> >  do_mprotect_pkey+0x6cc/0x9a0 mm/mprotect.c:840
>=20
> This is one side changing the VMA flags under the mmap lock in write mode=
...
>=20
> >  __do_sys_mprotect mm/mprotect.c:861 [inline]
> >  __se_sys_mprotect mm/mprotect.c:858 [inline]
> >  __x64_sys_mprotect+0x48/0x60 mm/mprotect.c:858
> >  x64_sys_call+0x2770/0x2dc0 arch/x86/include/generated/asm/syscalls_64.=
h:11
> >  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
> >  do_syscall_64+0xc9/0x1c0 arch/x86/entry/common.c:83
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > read to 0xffff888114b41700 of 8 bytes by task 6418 on cpu 0:
> >  try_to_migrate_one+0xb5a/0x12e0 mm/rmap.c:2321
> >  rmap_walk_anon+0x28f/0x440 mm/rmap.c:2646
>=20
> ... while the other side comes through the rmap, which does not
> involve the mmap lock. Yes, that does not have any mutual locking by
> design, I think.
>=20
> The comments in the VMA flags code incorrectly assume that no
> concurrency is possible here; and I think the comment in
> mprotect_fixup() about protection by the mmap_lock has also been kinda
> wrong since the beginning of git history.
>=20
> The VM_LOCKED check in the migration code was added by Hugh in commit
> b74355078b655, but that's just one example syzbot stumbled over; we
> have similar racy vm_flags reads through the rmap on other paths like:
>=20
> unmap_mapping_range_tree -> unmap_mapping_range_vma ->
> zap_page_range_single -> unmap_single_vma -> unmap_page_range -> ...
> -> zap_pte_range -> zap_present_ptes -> vm_normal_page

I think we need a list of vm_area_struct parts that are OK to access
without the read/write/vma lock.  It seems flags is not one of those as
it could be racy.

>=20
> I think the right fix might just be to make sure that we use
> WRITE_ONCE() for these vm_flags updates, and READ_ONCE() around
> ->vm_flags reads that can happen in rmap walk paths, though we should
> think about the consequences of concurrently changing flags in every
> place that gets a READ_ONCE()...

...But it's okay here, for this one.  I think - maybe.  Everything is
fine.

>=20
>=20
> >  try_to_migrate+0x11f/0x150
> >  migrate_folio_unmap mm/migrate.c:1320 [inline]
> >  migrate_pages_batch+0x786/0x1930 mm/migrate.c:1866
> >  migrate_pages_sync mm/migrate.c:1989 [inline]
> >  migrate_pages+0xf02/0x1840 mm/migrate.c:2098
> >  do_mbind mm/mempolicy.c:1394 [inline]
> >  kernel_mbind mm/mempolicy.c:1537 [inline]
> >  __do_sys_mbind mm/mempolicy.c:1611 [inline]
> >  __se_sys_mbind+0xfd1/0x11c0 mm/mempolicy.c:1607
> >  __x64_sys_mbind+0x78/0x90 mm/mempolicy.c:1607
> >  x64_sys_call+0x2662/0x2dc0 arch/x86/include/generated/asm/syscalls_64.=
h:238
> >  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
> >  do_syscall_64+0xc9/0x1c0 arch/x86/entry/common.c:83
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > value changed: 0x0000000000102077 -> 0x0000000000102071
> >
> > Reported by Kernel Concurrency Sanitizer on:
> > CPU: 0 UID: 0 PID: 6418 Comm: syz.0.1339 Not tainted 6.14.0-rc1-syzkall=
er-00026-gd009de7d5428 #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS=
 Google 12/27/2024
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >
> > syzbot will keep track of this issue. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> >
> > If the report is already addressed, let syzbot know by replying with:
> > #syz fix: exact-commit-title
> >
> > If you want to overwrite report's subsystems, reply with:
> > #syz set subsystems: new-subsystem
> > (See the list of subsystem names on the web dashboard)
> >
> > If the report is a duplicate of another one, reply with:
> > #syz dup: exact-subject-of-another-report
> >
> > If you want to undo deduplication, reply with:
> > #syz undup

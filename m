Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF9F188CB1
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 20:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738873702; cv=fail; b=uZDk90OoxqWq3uucPRk0TUSVcF6Ktn82dTTnt38n5ScDZn+lDNZ8iYJgv5pzuk8XK/BybfD2jZotRxOByb83SgaxXMHBs6B+gGkhCsqdlAU9REH1dY1OE+/rHv9sSi+cZi8f+E3pk5NPfAM9gDTZItn653UlKY6vLi6XMBYll/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738873702; c=relaxed/simple;
	bh=ke2saZIOxHb/3E26y1OyYqsZFZZyx0jfqGHaSqtZ5PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H3392tgb9C4gxWkZgq5lKflW6Mn1P1lgyHK6UeByb+A+MYv3091t2hLSQxnYSDdZg150s+ZKUIHutamSch9rs/6lp65dpmit2pyp+cW/Kjcy5QsWDPcncwDBOJ1cOMkZ7fAQK9d7fHWAiaK/AEYLaNnDnqfhnPEvSQ2N6TGOXpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QBxk/G33; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=g7kRqZAA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QBxk/G33";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="g7kRqZAA"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516Jfuqg004588;
	Thu, 6 Feb 2025 20:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=rvDOVNHq9tzjgdLi13
	LJLTytl/UlNfXYmhq+8lA/OJE=; b=QBxk/G33wYcuZoaJXvbgoSPSmMq7ydOj6n
	/qHmP3SIlP9VA60EpSALMkPI1Umd87FgIirbaIwljKQvXba79yULMFJxIYz8DfX9
	czVZHaGVKl/viE6PgpdxV324mAwj17pMc/kxZnF+WJeWxq3R1wxbpkMEZJ2KbWz8
	rG/GJNTUxdIRVKmyvUeyWG+Ly+0xA/yLQFbvJnf3R5Mxq3SNLcrs68ydAmVLPSGG
	uygeqH1V8MTulUYEHnnOXbcQhPKzCideUmbtJ+qJAZTtjONj9GlfOL8BNSpf8dr3
	Pyuy3b0gEeWNIXENomm07MqkxeC6TuCjSNAjdtWFfYXcu4mSIYcg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44m58ckh3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Feb 2025 20:27:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 516Ipua0023531;
	Thu, 6 Feb 2025 20:27:56 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8gm930r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Feb 2025 20:27:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nft8krHcgN62tQj0JzxSc86N6PwSTZ7i3YlA8fcyj0tRZpJ6ZZAL59WlNCimymGbBZBlClz19GrnpG9dcwtA81vGLBqxwWgj+Yu2a54ydGkKKXIn54m4fxt5AuN95SJUbZNstG39Qn6Bf6p3yj3fbfZRk/4ssAd7CYie0aGWWTjA/jtP4arBMQSmN3tiovv/wg2EDOaPRqHlL+lAA25TSGp3iaSUTdSaTxiYLp6QIxjGonz9pSUMa4zgGtnYxel1U+EfcQH2n19YzIf6IMi4kKUChMCO65/6HWrirV8484dReus/Gp9c3nmwLF1gzPyyOPdpUF8gVKcs5VWP68VMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvDOVNHq9tzjgdLi13LJLTytl/UlNfXYmhq+8lA/OJE=;
 b=shd/kqqRJra7ZFlWprkee5LzsM0KeohiMx/fdNU4+vVLle7g2LF6FWUtJH03gb06us9A7RbQKdFvy62fmTQDU3kxGZS7r9lsL5a60d1juaMslChXzZ/1KS3xCPIiuS3z0zS6T6d3SlSb9XCrzDNxWsz+QpeknqwB623NIVDR4mEa7HAHtmoVoeU5/UC1GblBAiauUHWr70z8NH8SfciBbsEaWjkmJQg3RTvn9E9pt1HEFQnJt/iQKdk03SxqhYA5TzW+ZdXnZ4HuMmMOmcApQTU7nq7FfIbPdsHL9ZrgsfEabsplDuq0zhx5x4GWjpQibRqrG+jF6l2cBbrqVMJfYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvDOVNHq9tzjgdLi13LJLTytl/UlNfXYmhq+8lA/OJE=;
 b=g7kRqZAA+CWEIhs2TC8SkwNwy+2PKgMgKe2mfFXCOYeWQgX0QNAUlQKKIqyNdJpy3vkkioHY5qM1E8XeN9ZV/Agn/5cvkZJOJyhdaGD1Mzkz8glH9ZxCSMqw6y0zvj9vgTJoJAcCy6ajWnGTgUzRumF6/Pf8hcMoNw7Yky1Yfug=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CYYPR10MB7674.namprd10.prod.outlook.com (2603:10b6:930:c7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 20:27:53 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8422.011; Thu, 6 Feb 2025
 20:27:52 +0000
Date: Thu, 6 Feb 2025 15:27:49 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH 1/4] mm/madvise: split out mmap locking operations for
 madvise()
Message-ID: <joi2hayh52maacv7kkhcmlbbmc266444esfjgkgjzaq5pa6nr3@5ptnphhunaow>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250206061517.2958-1-sj@kernel.org>
 <20250206061517.2958-2-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206061517.2958-2-sj@kernel.org>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::6) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CYYPR10MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: 766e89b6-78f0-4483-7051-08dd46ecbb14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ywM2hUo9PtjWthnDXRYUli0LlmJxP85MpnJzf20xb+LVWCdT62gani5/Wmxj?=
 =?us-ascii?Q?U7wi5Knpay29cWRHrLoWoYoYyRXwlJ3fTn4Usj+LKFBLiJD0u+uvDalzgVJ+?=
 =?us-ascii?Q?4JkA7lEMNBBkXcuvYbOtPcCl9/hYFn5PbZ8rXqOB7dat0wSxZ5qeoHef1K8t?=
 =?us-ascii?Q?nYA+81lkeaZd3PStYdbRI85LcIAyAmrVcaGOLggyYbMrITRxY3PuO9tqFT6R?=
 =?us-ascii?Q?BUs5aiAo5DlCiM1mihlNMbGM6+4fnzq4us8eVv2LtHsfLDO+6wIGEeHIm9db?=
 =?us-ascii?Q?AtA9XLZWxU0ElHe9AMgn6OnnDq91T69SwSI/ZsJR3EzkHmm6GEKxXoDjrE9X?=
 =?us-ascii?Q?hvp3AQaPVGZgcaj4l+7rc9npuAGTQLotW6S/AofbOQHz3ssL5t178/4Nc62g?=
 =?us-ascii?Q?6LGU6a+HwMGr3lnOWYtE69F1cZdvJA9uaXXVK299jXM3mviBRGHjivTS1WUW?=
 =?us-ascii?Q?np3NohmbP4vm8ywvDNEwb5NbXK10/s5JcfM1U6/hT+D3JtRXCPQ9lAoIMuzY?=
 =?us-ascii?Q?kYxmGukJXns2xl8xzLBUUfkluuU5u937+SZrKkqtqOWBBCzvEj/VNDXIcF5G?=
 =?us-ascii?Q?C4SYKzWIeZ/tL0VPBSgjdSR820FAePt94cblqiIantG4KPw4h8Xacar2Pg+R?=
 =?us-ascii?Q?D/a3tGj1VV0nC3evA5NxJYfr0wCQ+0QBBQ0mN4vb/ju54aFFEUIbxlDW4UuE?=
 =?us-ascii?Q?1bbl/A/0CZ8EG6uu3LUnI1OfUI+WWaSwR4N7OSEex9fyf0gFslLZOFUDAni0?=
 =?us-ascii?Q?QravSgIY5sHSeXMJjEmn4ITqPzVbTdgJlGHS5wtc7JnuC1TAsrOmTOq9k9Mb?=
 =?us-ascii?Q?ZOAyaegm0c6zML/MIiEHSSVRLJyx0KYCyzyxo3fWBOSoQhY9ZBZtPDtJ86Iq?=
 =?us-ascii?Q?q6OYwYr1qAS49QSlqXrccbgkaqNbzmZPXzblEZXOWvSsz8Xpvj0g/z2kKieP?=
 =?us-ascii?Q?zckf4duJe7wtNNLt2oi89G11/gMkPHRMjQrgv5N8+OqMKMtUbFE7aRsQNoqL?=
 =?us-ascii?Q?BaaeOg2H2xiCcAlO+Ma/9mKFvcwy/2b+k3pv96JMRUS9cDz3Z6taKO2AgZnl?=
 =?us-ascii?Q?phcCZHkGCZ/xBpse4SPeMkHF7eRg6PaqLUcBki59O/G1UsMydCgBZ7c4NEmH?=
 =?us-ascii?Q?GFLMSz/JZlKFkLQtqyTVba6vLvIdIy/i0c7aivgUe1ma8FOACSIzJJdcv4ny?=
 =?us-ascii?Q?WMArT574SB5ZbSqNd676InZTItuBsSN8DkxJ+x763/sAnPOUm/QvR1b7TKKA?=
 =?us-ascii?Q?smgJ9ic0masTfGUeLGQb7Q60+iRXcz0fTSxtij8vamF3yhXn7CX2zf+s3m/u?=
 =?us-ascii?Q?YCgqTrbFJbkWEh8tbuaRSTRuxcCB0RyezVyz7J5dZcGcHqgF62Cz8/O7Arnq?=
 =?us-ascii?Q?AOINZxWP5mbYdja7jiQS2lPaXAmD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M8b0gJr2G5FId3AOC8A4zysjxHfSFl9HmV2gtbOCx6I9oUOFXgPNcTRAif/x?=
 =?us-ascii?Q?LTPCzvjmc7wwIaRFt3aoy+YLlQ1WHIeu8DYr44nUvXfCOE0eYycWdyHwu3gJ?=
 =?us-ascii?Q?QrcPucVIA/hmcFy3gQKkW/wh7cXkrQD88blQARtNk90vm0XAf951h6bk5sN+?=
 =?us-ascii?Q?eQiR6Vl3reHlxnQkH2Fh2i7gCMhK9U7nWjWDG3vor7heR0ECPqENyPQ0dtTx?=
 =?us-ascii?Q?ptHuu2OwqL7tzaamqBW2nghbT+XCxxHiOzXY5E2KOgkMXlhy6sYvlpnbRSr/?=
 =?us-ascii?Q?fedcd/A1sWPqqmlbrx5Zprp8lbyiBwhUwvgwOkvK7UhX3mgEwDVPDOucwtVk?=
 =?us-ascii?Q?k4qMZKfMykpUG2bJGJArkNne3lA3Y2IdOYHioRQ3U2okn9Ich8D5oCJBRrUR?=
 =?us-ascii?Q?OC0geGz1p6BHS126mVFAi3r+eCsp1cLbzEIzrE2jaeHYhmN5D3/YPaUcmXjD?=
 =?us-ascii?Q?Tcvi6NLh0ijS1xYu2uo7jiqD6H4Olw65oUf0DmeD2kHdA/gNglkFlYhrj0bq?=
 =?us-ascii?Q?yZ4nZFBBzv74/329JzQjHc8t0zK4LRqtsIJY/6Zih5m8fkaNC3UBsMiiSb5W?=
 =?us-ascii?Q?hVTsRXp8tBb+jEGGBV5L6AsebYIubkPIrWHrLYMZ94VuPAUUilD+a1o3Ju1N?=
 =?us-ascii?Q?8xxa2GUXXQBridTGqxHvc9UMbCoUHpvZoD59bXA7bfRaRuIPX8jGD/SvgOpS?=
 =?us-ascii?Q?hqMth9cRsNkWN+HrChe+brBKqvp0ueXasxKku9aqW1eJzd1S8M5ADLgONS7p?=
 =?us-ascii?Q?CS3phVHc3LThHV1myuJxpe9qwYPEw66v8PM7SBgOBU0mf5pNFhMIiqx8F7p+?=
 =?us-ascii?Q?ilP3ZoNu9Wg71G1XfaUtsonrsXARGRpZLcWisj3ii5Zy15p77xID38yzAd0z?=
 =?us-ascii?Q?6p4sHFccDP7oa/KviW8P2VVhY/rjj3uchUdfHJkg2+bUYCG6nJOINq3Xz+Kq?=
 =?us-ascii?Q?RFSG3rigH0SFDJ9dJuw4VMox35TbD6BdJ0JqBgBQMT2YX3M5ndP9e7bl4Z4B?=
 =?us-ascii?Q?SAq6hRch7SSilY3FIKSxxk8qIM3giUwffEXn0zYDRYZz1Mu5QNlz128uDxvT?=
 =?us-ascii?Q?kwfvxBFIblJz0CFe9ZqqIKAXS8qMRCCa2ZkFlkyT7oGnCVMxnm7XRN156p2d?=
 =?us-ascii?Q?S+gWCEYm8nVTWv51s98zEZQjL9jQntMBbxoG4z5XNd5KxgmmFFnKENPLzoaj?=
 =?us-ascii?Q?bkh8hlVTEej6Re+U5B3bY40ckDQ+VtXtKDPIFLdLyXp/jvYCiZmT3NQmNRo3?=
 =?us-ascii?Q?BDsoFG+KhPMZmNxP/TUlqOJC/RA9ocEA5STJVh1lYKwR6M+05PJbs2NN5oAR?=
 =?us-ascii?Q?8/APf4KZW3E+K/bCH82aLRfMDgsgHL+VLwTt6oUm1zB95tmQCXrnBQI8anVq?=
 =?us-ascii?Q?sBYTDDVFq5MfUTQNH3dah7fLuxp9ljD6AmtA4R/3NEcR8oeFGP9eX4zGPR6l?=
 =?us-ascii?Q?ke/UHJccFBZnROhkE6ymYDd5jDBUhMHp1whsRDc5MMY3Y5tU6QKS2ib525Df?=
 =?us-ascii?Q?Jduh+g2CACMVolt8qR36mBsr3p2hsRIng9qn+8DZ81wgXnyyo/44J+kdRWfL?=
 =?us-ascii?Q?DFR0MIga44ohxyMu+Up4VLqkr5IQTRaL8Q2Tz6f9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zEv50hZ2gJ3wHWEUSPJjDPlHqyFJB0P3UtwBZzx9wGWlCxMIV8d3854jR5iCYcsll6fciucO5rOdyHIbl1kvv2aoUrqkvFD93ZENmyzAt3DUYf2n/SlyV6Az0FXvajrO5dciZdLa5c1ZLh7FqaivZWc8rwfhoxF+p+z/87BJPWYwSeKMxMt4lKtmxJ1qQIl81jo1JLaxLhe6QI9zWxU7KQXQ/OBdq104/rBxhBpoNGs5FxCx6ixCNj5GRQisStMd9Qw229PEqPDzTvcP/hgRzQ1s18g0HdfEeinCkrPgRdBl9cugqRm+V3gwogjmIWozorowoeyHcICluan3UFgqcVJGXgIIf2ROoEJ0OMnTNpiAweTbgsP4A+Mhrbs8nctzWNiWTdoGNKBYBKkrVkTBzN6rWIJewXGDWYfdxAHPcuS4YLDvG+j7l411yDHJp+YzV6rRIyqPvrU2VPCtFTnRlgZi+9uCI//r3vjB4V1Recw+T9PcPgA9p9TIphMK8NNaL/7N3MR1L2RimFwAFx7Wsx++pMPcX3J5oayfUbR3suM0cqulsnS+1EXhAUKLFWPwO1e7ku1AQMpyDrRR13tUDJxwHkjaBlv71854Dfz16ZA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766e89b6-78f0-4483-7051-08dd46ecbb14
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 20:27:52.2769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G82LJvFytNUMwXr81yStygQfmnDLV+hX09z5OYlqiK6AHwB9kVuxvUDsNAohJva9nmLTZU8eDjzrkYTeOfnNhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7674
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502060162
X-Proofpoint-ORIG-GUID: CjVHc7fKZERoV69ilpwIMoFH-rcqCwF0
X-Proofpoint-GUID: CjVHc7fKZERoV69ilpwIMoFH-rcqCwF0

* SeongJae Park <sj@kernel.org> [250206 01:15]:
> Split out the madvise behavior-dependent mmap_lock operations from
> do_madvise(), for easier reuse of the logic in an upcoming change.
> 
> Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
> Signed-off-by: SeongJae Park <sj@kernel.org>

Reviewed-by: Liam R. Howlett <howlett@gmail.com>

> ---
>  mm/madvise.c | 45 ++++++++++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 13 deletions(-)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index c8e28d51978a..df5a87a1846a 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1567,6 +1567,33 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
>  				 madvise_vma_anon_name);
>  }
>  #endif /* CONFIG_ANON_VMA_NAME */
> +
> +static int madvise_lock(struct mm_struct *mm, int behavior)
> +{
> +
> +#ifdef CONFIG_MEMORY_FAILURE
> +	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
> +		return 0;
> +#endif
> +
> +	if (madvise_need_mmap_write(behavior)) {
> +		if (mmap_write_lock_killable(mm))
> +			return -EINTR;
> +	} else {
> +		mmap_read_lock(mm);
> +	}
> +	return 0;
> +
> +}
> +
> +static void madvise_unlock(struct mm_struct *mm, int behavior)
> +{
> +	if (madvise_need_mmap_write(behavior))
> +		mmap_write_unlock(mm);
> +	else
> +		mmap_read_unlock(mm);
> +}
> +
>  /*
>   * The madvise(2) system call.
>   *
> @@ -1643,7 +1670,6 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
>  {
>  	unsigned long end;
>  	int error;
> -	int write;
>  	size_t len;
>  	struct blk_plug plug;
>  
> @@ -1665,19 +1691,15 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
>  	if (end == start)
>  		return 0;
>  
> +	error = madvise_lock(mm, behavior);
> +	if (error)
> +		return error;
> +
>  #ifdef CONFIG_MEMORY_FAILURE
>  	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
>  		return madvise_inject_error(behavior, start, start + len_in);
>  #endif
>  
> -	write = madvise_need_mmap_write(behavior);
> -	if (write) {
> -		if (mmap_write_lock_killable(mm))
> -			return -EINTR;
> -	} else {
> -		mmap_read_lock(mm);
> -	}
> -
>  	start = untagged_addr_remote(mm, start);
>  	end = start + len;
>  
> @@ -1694,10 +1716,7 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
>  	}
>  	blk_finish_plug(&plug);
>  
> -	if (write)
> -		mmap_write_unlock(mm);
> -	else
> -		mmap_read_unlock(mm);
> +	madvise_unlock(mm, behavior);
>  
>  	return error;
>  }
> -- 
> 2.39.5

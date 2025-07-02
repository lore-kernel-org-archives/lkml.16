Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A98C2E7BC3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470886; cv=fail; b=V2Ap7hHOBUzPP8ghy30V4G7ZkHaSluS3AhLOYs8nUzEMOq1Qt2f3HVJX0X2E5WLabOynXV5bo3VTWaQ3j1PXRULFCZMp1v62gDm/qn7V0pmijpLdWGwLkBp+bJ6P5XAzOrW10MUYQlNZ9Kl+Ozd2bq/pme1C0Sr4qZO5UpNu5SE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470886; c=relaxed/simple;
	bh=2vGgx6yXu47EuXXLrS5zKNSKaj7a44w2nie9wUeX+A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oMOaJSYCsKa0SKqBXBAkivbiw5ZL4w55ibwtrKaYpCt0GbDQaxwlaBEDDmYXct6++J1kHJ/rrbhXBAeVJ+WIbZ0PT5nlF0sYAUl3v45vXAIEPbpco3odwXbXZI+8Xo1RVBzWg6g5xhfN6bQs86ZSPi9j9fdgct0iLOT3/euOBG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=m9I1ICiO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JHRHZFdF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m9I1ICiO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JHRHZFdF"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562BiSaH024268;
	Wed, 2 Jul 2025 15:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=s/wgqdj7jgbvmotgQd
	/CYstJ6rHPtCJ/VnF9UDE9g64=; b=m9I1ICiOfZ53Z5zHqf2biDAfnrjvCpovHC
	vzTBW6iO8Q+mk6dcUeANzT2N6hf4xUrHKz+CTGuEGZNFFC8lKSKEhxBgCWnxBkoF
	iDkI+Wc3bae49Bthnfs0sFtH54jBurK5366+gwZf5HsWn93iAgBBhmcYFIJhKz2l
	4ZnIKpfBMCy0Akf0C8xYI3OLiJTkPX7aqkfU7fKYRUHIqHBl1jNiCL+L5iDWUxBe
	+npqhhiUC4pSRln7eQpgWf5Ru16CyNZKKVbhppeKwP1DaFOum15TI1MWn/zBltl0
	+cFM8giuDADTg6HaPOgSsKlqlhIcSYPv9N2X6nSTLD10lZOvNuUw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tff6gh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 15:41:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 562EJvJt019299;
	Wed, 2 Jul 2025 15:41:04 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1g5ava-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 15:41:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vp7CDA/Wi/EGQTad2mRiC6otB/QVyC/m+6VkTuW0xV86W0oo1OwasV/de1Kxsu+pMX13CXqp/sV5Um528G+8ckJNznIYDDQ6+BSfqcQr/ISyEjn1aksHyDB5AgBAkVPfSwmvz4SVzTAnJnS/u9fl1uZ6YbsJ0qqxgf6pRCzpQ4xk5woJdpBskM0Uqk6w3vkmvGqJJ02X3dAfI7gFLyZIAE0uy8KXFp8k4OfD8S4Wg1EPIiz33jep1Y2TvW3DTOOjGMkgvQjp6xNHCdHLyIdGbZ1giiSDZKRFrDY54L1Gj3c2QtYiF+u+DOGg+Y2bu8JdGAWRgZ1DteX+ZafYmIvieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/wgqdj7jgbvmotgQd/CYstJ6rHPtCJ/VnF9UDE9g64=;
 b=oNidHt4prMzGCcJoT1y8tXk8xQB/f1CHXbkgm1g314YzaMz60inn+QxWaiy1/wbmOz+BOshFJg7hdUIkNmg+KIjswOFMndsJV6yZhBectOiHJZHtgUXvEbSFkr2mCI4bx071ytttVclgIbrlU8GLTZYAO5pufrxs5XWZJrPe0yAmEF84AHHRyu5YBHatlwtSkyZsJPNWQIg6QlUIIYxiMJ/jIrSewdDHOOKMzx1VisJmMPamqOw+xz+fVx9DUVvu2SzphjaxFFZbjNZicabohAbf9s79WMGaxLRdWwv/jSy8EOp5ca68wcM81GbRBbJR1WopY0Ul/gEqG9q55l5vPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/wgqdj7jgbvmotgQd/CYstJ6rHPtCJ/VnF9UDE9g64=;
 b=JHRHZFdF160pdjxwhuR1YyF1uhNpRc+Gl7OBMDBhInS9PSubUcWwftGAFU4Vo+RAjaDydVTboJjgBuj/P4K/Pr87sZzbkLU9fdTVXqDCdGpXNXU/ukKxIm5hFc5ua9/heAFnXWEucYrpYhDfRMn/BWfNB7nTj2Ybhr9nMtWsaVw=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DS7PR10MB5152.namprd10.prod.outlook.com (2603:10b6:5:3a9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Wed, 2 Jul
 2025 15:41:01 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8880.015; Wed, 2 Jul 2025
 15:41:01 +0000
Date: Wed, 2 Jul 2025 11:40:57 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Peter Xu <peterx@redhat.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Vlastimil Babka <vbabka@suse.cz>, Muchun Song <muchun.song@linux.dev>,
        Mike Rapoport <rppt@kernel.org>, Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        James Houghton <jthoughton@google.com>,
        Nikita Kalyazin <kalyazin@amazon.com>, Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <mv4sazenh632fk2gkzhys4zz2mduuyxl3aqkj7micypgitqich@m3mgurwjarep>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Vlastimil Babka <vbabka@suse.cz>, Muchun Song <muchun.song@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, James Houghton <jthoughton@google.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Michal Hocko <mhocko@suse.com>, 
	David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, 
	Oscar Salvador <osalvador@suse.de>, Axel Rasmussen <axelrasmussen@google.com>, 
	Ujwal Kundur <ujwal.kundur@gmail.com>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT4PR01CA0295.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::6) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DS7PR10MB5152:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d94e0f-237a-499d-69c0-08ddb97ed8bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WjC/D/PNqzW2jSOxJ0TuU2foN4a7TKtjGt44EEz8Jm6TNgr5/PPrduh9pYWt?=
 =?us-ascii?Q?Y9BcRPQMrpDeTeTyA6Vj9REHgdLGEMU8O2NgAld4EA7HBHqmqzhv4jxE86H0?=
 =?us-ascii?Q?EybSnrrvOchz4Ktp7qI0IggU3Rf4l5zlWKuRo3UHKqzQZ9Y0kQQyTC1q1/sR?=
 =?us-ascii?Q?VQA4H9vs11BBAyUHzLF8KpWdoxzQ2e07nd9t9+VD8RC3fGM5HK7+xpGmNUlH?=
 =?us-ascii?Q?R/KuFaOCKcQBNdAjooFwJ77zNM8R68oetNReWviNMFhzS8DQClx4wTi17+N7?=
 =?us-ascii?Q?HeLCAmWSzyBiOyc6yotSPmBxEDnplXb8z2+v/KohRw55xa2oJW1d5LFQeUJA?=
 =?us-ascii?Q?8dKLC45YeZIKLa3bTdbHKWuffdpTQDwX2khxaZ1F55RQ6a/RuWkrZiJCPQGV?=
 =?us-ascii?Q?9JPArGoBePwnicnyQQAIPy/GdRlS+4utm1fwfUPzZQdRdmmX0qN4Vt2FGKlC?=
 =?us-ascii?Q?5N9IeawJYLR5fdwniIOMxG3BiIalfIc9hCc4ylaB4kcEIZJJXsFMwJp9Dgww?=
 =?us-ascii?Q?knUOXd4K8OC7v0W4CNsDzLf9sVsCz44Kg0Bxu7h4B/xb65Y3Ml+WHYHPrYMP?=
 =?us-ascii?Q?/j/HmhnWDudyamJ0rVisdC+V+N/UYFuSNofcFvUxdK74rRuaCr9j3ct7HRrP?=
 =?us-ascii?Q?bNyKjJ0th1ylUo2owAsL6ZPXzSquJoxgZsADUAm0raMbox4fzzgoR/UunFGD?=
 =?us-ascii?Q?6TPKtsEycBebCX1PrIzcYoztZxYKzBy1SMC/NoFkZpgtK96/uKfqkJzVdGXx?=
 =?us-ascii?Q?H5l9JQ7wn09U3b/1hRy3tPtVqAPo08CTD1P0hjmWtLBXJJwiNkqS78t7XwSK?=
 =?us-ascii?Q?E9wclyo6jyBY+fCb4tM30RJk9G2fClAQFLWJmXrmpnrPMoyfXP4PUFX1VpeZ?=
 =?us-ascii?Q?2Y2kUu6fiAiL1NZVt7//SQTpQwlHXfhPTJZ79YO0kMDFUJ13E3P3fk4qLrIz?=
 =?us-ascii?Q?UVJWZQHQh0ovGb/4/01DXSwnjn4EdycXq4Xf8TSBOd/ytqonre2nDMpukNZn?=
 =?us-ascii?Q?UrMNTIK1jkP9DUXvz4EsshrgsBz8YDbJnOatfWpc/lEKMF+vrj84V75PVUma?=
 =?us-ascii?Q?taq7Z/pN67y/PvJK/ypzVbOaaSyIzyWfJPx4vtzt9OZdundNkVrx5KANfeN+?=
 =?us-ascii?Q?GiJVTRgmXuGFoTA44Dz6O7OfVj/of9VXIozVXeSs0Ixq0xk8ec+tPCbycU0z?=
 =?us-ascii?Q?h9Ueg+pE0bfyXBMwQCXnuZt2k5azP6dQXXp7MluiYqt+VIQo5F0A3bXW9SPV?=
 =?us-ascii?Q?6jFoh0oYWBa9gWJiDOUIlHoxyxJVlGv9Ah8RpUTvsOVea/yl/lWn19hxhIPw?=
 =?us-ascii?Q?G319qsKTeKTf9X02NYOwUlXRqfE9X/LX3SrCG/mw7ztb5bmcphM00WhfSXjI?=
 =?us-ascii?Q?GpmIjnP/GSIdbHjOnj/pwk3do7Bo2tEzTiofRrg/3z+X4H930Xhy08h66hlz?=
 =?us-ascii?Q?bWVaci5tN/A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?muDqX5NbGCh8yCULCa94AFkK+elPD10ivI+HNGUh9AgU6aGRjPaT7530H0P2?=
 =?us-ascii?Q?RhO46AbtFe7F7/JL4YIIXfCjawe/Ujnb9LTehkUt5RSsvSTZWMgfQyoNijGt?=
 =?us-ascii?Q?mjczZ57JqCeZguI6yRghAGWFK4oKLWh8tsCHvCndORfyFVkMMrwYMcUnLfjD?=
 =?us-ascii?Q?Kbf0k6lMwa8R++scU+MpkKFYC2EwLf2wMiPiTjKITpxhkBT0yd+AzX1/+7yz?=
 =?us-ascii?Q?8RuVEUkLDQjUJM8dHJQMxK/2Z80y7yXOu7puKKNJQBwg/EyplYoPt1V8JdtX?=
 =?us-ascii?Q?9NI8PiBju8xMDkq4UIg8tJZY2VCbSXBtdeOjKEPRwEMjbpgSYETo3TtJv4ZD?=
 =?us-ascii?Q?YcqcqGcCHYmR7MlUEP6Ne54whIj7EEZngF/JIh9GAH9NwVJ+fNR//Jp/qm4K?=
 =?us-ascii?Q?DDtKlZFXy3NrCYFy9ZmrwQRCAXCl+CiADoxRzpBgOFWZ3cUnzcKAjSKfXV/q?=
 =?us-ascii?Q?l/HnBNRjiWKGIFpHXuPvuT3O5HJj/Z8ZZDSs72DqFe9xYHldEN4yfvg9HHwq?=
 =?us-ascii?Q?v8vyXyTeN1VkwlDxKPHToGM2BCo1CzG3OiVnYajDmbhR/tHMLNkRinN+9Fpz?=
 =?us-ascii?Q?ImyGrKjHrhMR6lIDwBB6891NEmLeR55s2D11Rn8z772DB5rsC/vOy9olexSv?=
 =?us-ascii?Q?mKlNvAZQ2ZOqI6MHi5JkdOUpsLDTCDk+xSxICkjj+gMd8GNiiwl6GSrA4ugT?=
 =?us-ascii?Q?ywbBxvAOZW2S4VCCGOY9mc02/dpW4vSBJUKQ4ieRRxa08OAaCpHpXGqWjOro?=
 =?us-ascii?Q?9FS3o5xjpRgnPN9LcHAPCL3v0Vh4O5sNZjBQVngqIuu60JoH5aSmlrUY1IfV?=
 =?us-ascii?Q?VerByVzM2cUpuUvxkD018LUwl+2H4rsf5oVTYYVyd7JjlMKkUE7OFL+E48by?=
 =?us-ascii?Q?q5tjhNqkmHDrk39w5DXjbcU7gmBSxJv2pZedMdw84ogciduUX48u/UoS6KlT?=
 =?us-ascii?Q?DgkdyTB2BZInGAC4yA3Yp+UgwT3/3zJK7LNXKgSCEzDug2KjgdQd+Iz6UUdQ?=
 =?us-ascii?Q?5g69bCT0VQ4XYRQhgMuJ6FwUfJYcUU4hjGW1i8a7WYXK9XwUyLxhY84Su/B2?=
 =?us-ascii?Q?yebmdpBWGulBJYdQvbPD3s9/p6qfDQ1TtLn5+pA0/5039tyerG6JYGAcjN8K?=
 =?us-ascii?Q?z8FCq1OiA/s3C3I3MFDWnkV67PFX0b2+A8QVr2UEIUUukDV8qqrg3QRfkMhc?=
 =?us-ascii?Q?i5VkNQLrnPaQJ2yJaR3io3eCq9J0TgUNnPjilC1KIm6/jKamDg4RegQm1s4h?=
 =?us-ascii?Q?CYpciKJozSIPzmXN03Ds6uTkMVoPF1Ravu3CBUp7WW5u970tOgCdVoB7m3xx?=
 =?us-ascii?Q?XcesYD0/1ETuRBkWnGSfxe8Xj5ULmWBtuQr1z/blXhOWS2Ma+9q0Oe7yAjgM?=
 =?us-ascii?Q?AIrD4MlT764v3X4obNU2u/8YXDhAy3/VMM5NIuQ1Tw2eLK9Scs4Dbt79Jo8O?=
 =?us-ascii?Q?gl4sH6eHhMq2yrxwNxphjmoyXCLX9hJNhhUFZZFvEGevm4SX0C2JWjMnK7j6?=
 =?us-ascii?Q?U/XoEkTeEqa2Zy4X6oKEHkwTxvZRJAx0QEvtpUhCkjI6D4GTqyqxaON1g5DJ?=
 =?us-ascii?Q?Lvn1+AOLaR2l0H9ce+2phkPPviDkZpe/CyI56opJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zWeQBcfDjvipyIco6UUNf0bCzcQXnjnz5t35rhSiFaXtXJD7mL8XhcYHH8f9Epu3rjUp2NVoV6YWGW3AkBzVKNLMxPO59qLmPV6NnU6M2zQvjhySDrSLlS6+Y83FdO/Lk5PqTSFUeglYP6NGHWnBeC5kUYRognWDxaQQHq6+miHJzVydzzb3Cw7tg6PqD1MedPgK7yJMZJeFug6VJKx8QKc2ju2YPZgB1qU56Q4lmyjiFoK22ea1uNTBRA98VyASaOY1LjNiSXLnp0MzHtN8Tlhvd7IV69OFLrbgg4wVSv7LbbYajViXNRPz2HNdFdqoGOfx1j7Hl1ddnpjxXEW7OT94e7xZz+ZK2RahacDf1Qvt7XwZqihiCpIjmxrbB3nLvlqfRe/HlgMWeuDbOqtgTa34RKrBxLcfVy3cj14ena+PzWaiJG/e9ydQKrKqBMEd3A/CtHw52xb96qKvsNiMZSbF3Yc7gk03JXLQxXsJzeYS/jC8PsvhfqdRDD91dz8LbwfGa7VPXznK4QqLmXwhYROleJNCw99j7pBIwxIhCXo+VESgKc+iOj1F8HKgg+F5DsPDLGWwjDkwHb+xmLOx0+37kFyPutuQiFRldcRI/jU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d94e0f-237a-499d-69c0-08ddb97ed8bf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:41:01.1200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGLFdqmvOSOuIlS/qksIe+yVqPbKzidC2X2yDcnVxhUzMmNotovwf2Li4Lu9AWdZzPB0ep9QhDukALKPJjjo3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5152
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=971 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507020128
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=68655311 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=1XWaLZrsAAAA:8 a=cSZq1LJKPQuRHhzLg4YA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13216
X-Proofpoint-GUID: KsPikis4bMubzaRej8Ri9DzwOydQ2Izc
X-Proofpoint-ORIG-GUID: KsPikis4bMubzaRej8Ri9DzwOydQ2Izc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEyOCBTYWx0ZWRfXxYXoczf95zGl Ppqy/UNIgrk6Cafs80IfwwabYSVo8IBIAyqBeysffkw2UFzxXCe2fiy/gPXKQI8rsII/UUi3rAL 6M0tN/hgaulk9HAX8zZCbqdUd5RtJt7g67jw5serOAfvbR40txK7+wy2ioI3tb99/WDPiDxek7r
 egn/4SD1BbvhEG0Rj4hDd6cANosY6pN5CQiMfcmKKlIGiCNBhV6QLUiPdpDAA2Goc26t1jOWCdg /MDY6Gfwv/LBYaD2Z306F7rux2iV2CFVuZIKsQzkAxMl/UvtsaGSovGZbNvzEfQTCBXJh9Z2z+z MeuNlhLLTvtfhwpVD1ULlA2P5DA9OwRxjhGOWgf/sQVtWyvoLcxJs4RHSksDQeNCuN85AUPaDas
 tQMGiOO5dpcS6QZOiz2y/5efQI6xvPe3HmchiAi1O16FDO4WVriEkxmi/WQC71wzAT6/0UYI

* Suren Baghdasaryan <surenb@google.com> [250701 13:04]:
...

> > > +     /**
> > > +      * uffd_copy: Handler to resolve UFFDIO_COPY|ZEROPAGE request.
> > > +      *
> > > +      * @dst_pmd: target pmd to resolve page fault
> > > +      * @dst_vma: target vma
> > > +      * @dst_addr: target virtual address
> > > +      * @src_addr: source address to copy from
> > > +      * @flags: userfaultfd request flags
> > > +      * @foliop: previously allocated folio
> > > +      *
> > > +      * Return: zero if succeeded, negative for errors.
> >
> > Can you please ensure you put details as to VMA lock state here. Uffd has
> > some very tricky handling around stuff like this.
> >
> > > +      */
> > > +     int (*uffd_copy)(pmd_t *dst_pmd, struct vm_area_struct *dst_vma,
> > > +                      unsigned long dst_addr, unsigned long src_addr,
> > > +                      uffd_flags_t flags, struct folio **foliop);
> >
> > Do we not need a uffd_ctx parameter here?
> >
> > It seems like we're assuming a _lot_ of mm understanding in the underlying
> > driver here.
> >
> > I'm not sure it's really normal to be handing around page table state and
> > folios etc. to a driver like this, this is really... worrying to me.
> >
> > This feels like you're trying to put mm functionality outside of mm?
> 
> To second that, two things stick out for me here:
> 1. uffd_copy and uffd_get_folio seem to be at different abstraction
> levels. uffd_copy is almost the entire copy operation for VM_SHARED
> VMAs while uffd_get_folio is a small part of the continue operation.
> 2. shmem_mfill_atomic_pte which becomes uffd_copy for shmem in the
> last patch is quite a complex function which itself calls some IMO
> pretty internal functions like mfill_atomic_install_pte(). Expecting
> modules to implement such functionality seems like a stretch to me

Yes.

I don't think this is a good idea to expose, since there is no way to
restrict it to a specific implementations.

We used to pass out a vma to a driver for updating the vma flags, and
even that proved to be too permissive and it ended very poorly.  We had
drivers saving the pointer then dropping the lock, we had drivers
changing things under us.  Then there was the fallout in the mm for
trying to deal with what may have happened - and the failure scenarios
of the dealing with it didn't work out.

What this is doing is leading down a path to allow such things at an
even lower level.  I think this is too flexible and opens us up to
unintentional abuse.

That is to say, I don't think we should expose this outside of mm for
the benefit of everyone.

> but
> maybe this is for some specialized modules which are written by mm
> experts only?
> 

Even with 'experts' (do any of us really know what we're doing,
anyways? ;) we may get into a situation where a company may write
themselves into a corner, depending on specific functionality that's
hard to re-implement and a nightmare to keep working. I don't want to
bind.. er.. to a specific example, but I believe we can all think of at
least one.

Is there more information you can share as to why you want to expose
this functionality?  Maybe we can find another way that does not expose
the internals and accomplishes what you want?

Thanks,
Liam


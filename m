Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E3D1E500C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749132277; cv=fail; b=ojgPZ/DyNa09p4GhrZeQJu3oCKWz+IEpeYlIGmthV5aDALrSy8H1mkba8SnxbposGwXl3iDv0PJmyTJCvvjqwl6IOl9StGq0Q+Tz3kKQc+KwbJ5a33sNujof9tDn+p0KQKur+/MTvZtRnyhcNkMnvslx0VH8m16b833qD4zcvfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749132277; c=relaxed/simple;
	bh=DLxfpJQYh1UV9aIVIIe5KMNCCjOaZl0r371ac7jc+t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dKVSh97VVncKYqLcdgTj1uRWtlhGumv6QSbG/FRGDLPEkGgL+/2tz3z8GF4fEJpkhjBSv1YTeMppUr4+mVXQfy0D1toTYBFRS2a3G55YeRix5MYRrtB8fi4gB4OlVAODlCNLK1ZK5PMVZOYOXH0EF3V+3wTcGtOUqRViwW+HduQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B1gph5cy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ywrixxMk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B1gph5cy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ywrixxMk"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555AtVRI011517;
	Thu, 5 Jun 2025 14:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=7aDTNz4gzyQ2t9F39dSNooct+tlmDoGZsMBRoGk8yDs=; b=
	B1gph5cyPvVGGlE+30QsXkuTvd+94HidMchL0FgcftKlY+muPkHIQf03vo5BNcjz
	2vA8Zy2PnUzex3Qd+S1+lHY1C6O6snV63ZbeLCzg6Gdq5XCZJ0aiYYSGJAhiBemp
	R/DM7hINOxsOfawSDJFrSKFMsFzKeBm+h8St0grz9KAY31PeoCP/jBKSdhHxkZr/
	rIhCeDlUCV2TU4TbbksoXL65+WY68Ln32RZ0a9XFN0HvjW8m3G265rm7ZQwJFWLU
	QItlpQiphk+5qmvvsRFz7FFU3IO4jeMespU1MI5xCC+xM/+0FSTaRJPyAWuvunh9
	n0fspJ/QXScW/G7aejW6Iw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8j68q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Jun 2025 14:04:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 555DU7GT033811;
	Thu, 5 Jun 2025 14:04:09 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2070.outbound.protection.outlook.com [40.107.95.70])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7c42fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Jun 2025 14:04:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8lJTwdLgYz7S6FwPvOtVgMVhKjucEDZd0zJDMjx9DfiydsOVIW/QcwMn3QT5ObnFg/NnPOVkFsked5jcBS0GMngY/gpf5I6d2mOj3p0N24J6gnYI7dOjlLMIB37oMVxSpadkvKgXzKQeD01i/4zCpSK37M0dPczVY/xcSDiszBSwUWHo03a/LRgCfknr+LTKNszHwd6WxPD9CIf9Rs9h7aHg7lGPny95htuq6PTwdkAwk4AFJUgLK039fBGtK2XhHt1HrfYKljFDZ+PKxYcItvUsOS53wpu3glOMrQjtSgJdbd2EHz2xwRUfgWeIQtagBeOkL5PhDv41x3rRpysfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aDTNz4gzyQ2t9F39dSNooct+tlmDoGZsMBRoGk8yDs=;
 b=O7e5ptVfKZ6q9FEEQkEr/a3ORWESq3nFfzjy5VR97L+lEUBzdeROXBebfRH0ut7EIiPgxMR20YQgzD/Bj854eT1wBr9dSjoBPNHhPrTLTCYdH6/zOynn6IcO9cwjfdfVljw3qYnz1tJvPreIzeSbGP+jUq1DoDh27DRcVANabxPbk7I/Hkfs99nvRwPzsZNkWtzJu2FPM14IVoq1d6rybET9GsQm78ga+o5uCyPvat5xfKxJ9Hq6d+yECp8ZSTi5oVYF4oqdm3vyRIEzJkRoTgLpmi95mnqbXpLhJzWu/CAXjqvhyX7B06xXnGR8UqinBwoX3nX9hrOhqd7uxlaMtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aDTNz4gzyQ2t9F39dSNooct+tlmDoGZsMBRoGk8yDs=;
 b=ywrixxMkTiu0oedVWrXpKM0s4X0qWcBrR6C20ZKESXD0dOj5jylOc/+MqG/rya16zwgo1RAEVlp9nAkraUXKo4L18BSkYSkiKfDS4eHbyJKoPtFSJzC8NWpihNmajJyAEcs9+hulwmDleBj0IFhLAIKoTsWWLmHxqlGtO/vP+fU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB4558.namprd10.prod.outlook.com (2603:10b6:a03:2d8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 14:04:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Thu, 5 Jun 2025
 14:04:05 +0000
Date: Thu, 5 Jun 2025 15:04:02 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Jann Horn <jannh@google.com>, Barry Song <21cnbao@gmail.com>,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <bfb56be6-d55e-4dcc-93a3-4c7e6faf790f@lucifer.local>
References: <20250530104439.64841-1-21cnbao@gmail.com>
 <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <0fb74598-1fee-428e-987b-c52276bfb975@bytedance.com>
 <c6dbfb68-413a-4a98-8d21-8c3f4b324618@lucifer.local>
 <3cb53060-9769-43f4-996d-355189df107d@bytedance.com>
 <c813c03a-5d95-43a6-9415-0ceb845eb62c@lucifer.local>
 <7cb990bf-57d4-4fc9-b44c-f30175c0fb7a@bytedance.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7cb990bf-57d4-4fc9-b44c-f30175c0fb7a@bytedance.com>
X-ClientProxiedBy: LO6P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB4558:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d678d9-0544-4221-170d-08dda439d4e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVUrR3dQSnd5Z29jMm9CZnpRenVtTVVPNlAzaFZHUUxXNTVUNGpWMEYyTUo0?=
 =?utf-8?B?dXYxMHMyZkxGYWF4M2pIVlkxNHh3aC93c25nSWlDYVh5OEozYmZXT1YxMnlR?=
 =?utf-8?B?NmwzS1NZMGJIckNTRDl4U3E4aTNDbldFRWY5cVBJSTk5TU9YWWs2L2NIYlB5?=
 =?utf-8?B?UFIyOVRCQWljSnpQb0k1Q3ZKRW4wclJpdUhCcmhlUkhPTlJGS3M5VHNMYkts?=
 =?utf-8?B?TnhvMjllTWVIMU5jenU0ZHd2c3ROMVdYUWxTQmFNcE0xWTIwZDJkN053dk9J?=
 =?utf-8?B?VDBqMVBERUFjcGVnT3M2RUpwWG1hQTVsY1RFWFhpb1c0bStzMzROMDFYNTVr?=
 =?utf-8?B?TStNUTZ3dmZ1K2xIRUM3QzlVUkkwQngxakdUWGg3SVY4a3JSNjFIRkZDNUVm?=
 =?utf-8?B?SENZdys4Nks5V24wTklvSXlVLzJpbFA2WkMxMTFUM1BlYzF4c3prbi9mSC9k?=
 =?utf-8?B?REJKT0U0aTE1QUhEenVZR2JuWmc1MzZUdU5WaXdubXFhTTRCVVBLcUhleHBP?=
 =?utf-8?B?cURMOVl2TThJR0NqYkw3RDNab2Z4ZFgwdTVZdExLeXBPRmErMEdPTmpMQUYx?=
 =?utf-8?B?VC9ZM05tN2E3WmFMOFM2YlpPMFlSUG1ZVVpGMC9wdnlxNjVlTFppcnRoeHhz?=
 =?utf-8?B?VzlqN0NqOUE2ZGlwYnJTT3FpOGNjZklqNENsQ1JDZXhMTFE0ZUNKZkp1T08v?=
 =?utf-8?B?UHpCQkJJa2pZK2UyK045VEJ6QWR3NnhaVS9rTmdzY2tJTGQyaXpIZ1hFaGNh?=
 =?utf-8?B?Uk1XeEJXMkw3ODhHdFhUamhrWTBnZkJOb3k2RzM0cGp3UEs2a1l6SmJhVkJu?=
 =?utf-8?B?TktNaUIrL3VtUndvc1RKeXZScXdWTnNrUEhMWTM0K0NkQ2w3amFFS01FUmYx?=
 =?utf-8?B?QkRPaGJvSDBDNU5FSDJMTnhwUXVra1FuajdyRUg3OGRWOFFyZWhzYWg5SWZ5?=
 =?utf-8?B?L0NrS2tNelhtQ1ViK1dacmpwQUx5TVlhOU1sSmdPSThlWkd5OWVNZTFrREtO?=
 =?utf-8?B?aC96UkduVnZJQ3JlRGVrVWFKY2xaZk8xN284cFE5RHhDSElHSnBrZUsyTytS?=
 =?utf-8?B?NS81dGpKM2c5ZWsvYm9UekI4dldFS1UwakRYUGVSVTh6Zm02ZjkwdEcvbEgw?=
 =?utf-8?B?bU1OSWNEY2RFOTJFbHZZTTAxcXJGS2hNKzhMZzF6bmNZK2Q2cTZOWlVRYlpX?=
 =?utf-8?B?K0s1S2pOOHBoOFhzNUNQcmxrL0ZlTnoyNlJ2Z0l0U0UwTDFLVnpWbkR3SHpO?=
 =?utf-8?B?ZGMvSkJwcEVuMzdDSEVTanhHQUdKK3FLZWZMc05EL1Vob2FrSy9pUVZBa3B2?=
 =?utf-8?B?WG1nK0xueEV3TkppYUR2YS9PYlVrdHZwazZuWUFFYjA4MzNQMVVLczFQUno4?=
 =?utf-8?B?UjQyamplM3R3K1NtR1RqRUFVSVRGRzMxbzNEM0VySzVJNmladzRpbk9pdkRU?=
 =?utf-8?B?QlZ3YkQ0Rm10U1JYNVpzR0RMMlA1RHltRHhhNGhTRjJDa2o1VUJJWVdpVlRu?=
 =?utf-8?B?aTF1WU1DcUR4dXVUMHdqcytmTzhVbFUzM3hXTUdBY1o5Z3ZXanh6TTNlMWRW?=
 =?utf-8?B?b2xMRmdjOWpuNmpUK1VZd3NERlZaZkU4WCtnQnVJaXgvcG9MaFlqdkZUaGdo?=
 =?utf-8?B?QzExME53cUhudVhOTzRvcjRXUGR4RlRkLzhJQ0FSNmdlL3VrSXFJT0x3WDFC?=
 =?utf-8?B?Y3lZMnN5UUlQcTUrUVRzTnhZWlNtTzQ3U1R6NTFPTlNkZnVSVTNBOTZPalNy?=
 =?utf-8?B?eHFqOS9zQjk0WTYyckFzbkJDUHdDN2J5VVdwc0VqN20xZDdScGJZNFB1dmZI?=
 =?utf-8?B?dFRpQThsN0VMWFEyM0VDSzRIK3lYQWkvR2dabkpsdmw1RDRNSUpsY3FVanZo?=
 =?utf-8?B?TDg5WUw4VEEzZXFQeElTK0JTUnBWK0ZSL0JUVUZ2aGViRnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NS9adVRVb3lrMFdKQ1hoRkJZNnJNLzBpaUN3ZjNmZkpZNHZsdlZ2YURiN3F1?=
 =?utf-8?B?R3JlcERVdUNpL1p5eHloOXg1SXU4dlhBYnFPMFM0THl0MHpadzdlRGlKRC9G?=
 =?utf-8?B?NG84VzZicGh6eEhxWFRmb3FrZmRsc2xwZkR6OVhsMENIRk9UYlErZytpMXZP?=
 =?utf-8?B?dzJiaElPbjNxdXFIMUUvK0FJaHZ5ZlN3MTRsOUkwVWJOU1B6TDJGVHhOdjFC?=
 =?utf-8?B?MHNJMko0ZjV1WmcvSUtTSWtucDBwckFDZ1N0Q1BNMTErSVN5bHE2NWlwV2tm?=
 =?utf-8?B?Mmh3RERKV3dvZi9mK3FZM2N2dVhGMGw5SmRUVVBPdlpRT2YxNGV4MGJpQ1JP?=
 =?utf-8?B?NkFXNzBhWkt5VWwxL2UwR0NjcGlRbGVqdUU3TmtxSGVvSXBmRzhQdDdxaUk4?=
 =?utf-8?B?SE0wdndqVytlb21MZk1ucTY0N25QT2lORkFmUlJSNEU5NTFXTThBUERLa1hT?=
 =?utf-8?B?eTVsMnZheWJhQTMybFVob211Tnkyd2NMSy9mZ0huUVBWZTdseGJRaDBCV0po?=
 =?utf-8?B?b1pzbE1DSm5MUXAwWXFHN094UmJTV0F3QWUrMlorS2lRNVAySTNMVFNsVGZ4?=
 =?utf-8?B?VjFBamVYd3dtcXdTMVFmdE1WeEFacVlXZ2tjRUtKSFUvcklkbndmWGNvbEhO?=
 =?utf-8?B?aEJodS9HalNVdVBpd0xEUjQ5dW01Mmpkcjd5UzlvUGtZQnVtcGcrNVFVOVhs?=
 =?utf-8?B?bXhtd25ORDFqZFRrUEZ0WlJzMW9WaXFNellReDZWNldxUHVDS280am9UTlpN?=
 =?utf-8?B?bUs5YWlRY1g3L05qUDVmUi9UNmpMU09wUjBtNjJ3alh5MUxTd2x3MG1NcHBK?=
 =?utf-8?B?NVJnSGFBWGkwSnh3NFVGbTRqTXlFeEdoK2M0Q3Q5cWdCWFZKd1pxNS80cHFO?=
 =?utf-8?B?YjJxMENQa1lqeGpRVWNudkJSK3I2TFZ5YnZlQUNLeW8xbU1QaXprVzdZdUgy?=
 =?utf-8?B?RFdKUWlqM2c1OG9aY05FZVppbW9lRWIvSno3Q2p6VFlPM1JxbktrQi9zUXF3?=
 =?utf-8?B?V2lkQ1o3djU5RTFkYXIvRWU1NzBUNnpmdXRWblVHU3hFR2VjTUtETmVrTFlu?=
 =?utf-8?B?TWJjWjhxS3ZJbGdXd3BrS0xmQVo3VjRDdzJXbDlHYVZmMUdTQ0w2UGlRY0lE?=
 =?utf-8?B?VUZCaWt3YzRVVXBuVTZVbHFtTjZ0OUdaODJzQ0FvK1FHcnVmbmFuNnIyTjF6?=
 =?utf-8?B?ZVIva1FuQW1hT3JXZ250VFN1R1YzVVEwN2x6UkhNNmo5VFo4TVdWSGtHNWs4?=
 =?utf-8?B?MmF0eXFzQkJybHIweEI5Y2k2UXgrNUVWM0FtbEJJOUxXeFBKQXN5eFlyMzNi?=
 =?utf-8?B?dUwrKzZuWmt4TXY4MmYxcXl4Rlg4TlkyVU1EeTBHWk5VNnlpZCs4TXIrSTNN?=
 =?utf-8?B?QmZXU3FCNEJQMHdTNlNVUXhUZzF3cnhZQ09TZzNqSGlEZlJMWTVhNjhuR1BO?=
 =?utf-8?B?NHo0dzdkdHQzeTFsVXBnMm5Ia0VpZ29OOWl1UXFGM3Erc1ppUTlJaUQwZUV6?=
 =?utf-8?B?QlhML29lTVNjbWFobGRzV0N6ckV0cFpjUFZncjBWc20rV3pOdjZ3Qmh5Zk93?=
 =?utf-8?B?bG1Gei9vL3kzL215VEJ6b1BPK1FTWEJRTVZ3RDRhbkExS3QzNW16c2duUUNN?=
 =?utf-8?B?RS9tZEtGMExGY0lXdG9EWFRESlBncmVxVlFlYnpQaTlCMkg2T1JVOWlaTWNN?=
 =?utf-8?B?OFQvaWZjTkkxWFdWYTR3OUJEMklpS3VVblNlZ1hKOEZhVnI3UnE2cWhnQmdn?=
 =?utf-8?B?OXV3eDVOSmxHU0Ura3Z1eVpNNk5mWGJKRjh3Q21OQmdrVXNXTXFMa2Z2ODQ3?=
 =?utf-8?B?U1prRUlka0ZrdGxVenJQMkJjb3lGNmIzSndKR2ltVVArU3FhV3h0bmY5WVFO?=
 =?utf-8?B?TE1kVGpFdVgrMjRBRzZWR3NLdXgwNzZONG9sNnN0RGFMMkRJTnBXbGM3ZFd4?=
 =?utf-8?B?cnFVWk14TTRPdE1WQjh2eDVadkcrSTVIUUV4cUxOS1BhQncrak5KalBZa1E4?=
 =?utf-8?B?ejBWRWd5eG9TazJ1VDFXdDl5QjFsT0F0UkxWb3lTNnJyNm0vcGdEMWZiSUlC?=
 =?utf-8?B?N1JDbkhoSjlQcHNxMnpPcndwSjJlV05HRklhVkNIYys4bUJ1TUwxaTRiM0xW?=
 =?utf-8?B?RFVxSktqS0p5UWFmV3FvVkJyRzEwbitNRVNWQzRVa0l6SXBSaUt2QXZkS2Vv?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LuEnR42W5NNK1yubRSLIZhHILILypQHeIfima1X/JbF3oeNEBSZcBnNk+4KUzy9i1VWk26btKiwaMMcpgLtuLvsSso/Ewy5gLwCUWFOL9bOsDNkalkfDmM4HwfA6jlLWbttqafz77qv7Iz6JH5BNNTNOAaFCxXQRQPmyDLnyEBrRsJICFRZyBo2fh6c0OJ12xDbdTmwWoq6BgeeP4cylva1B+tgP7HteUUM4mmrYaFH+Yvi7c2APP82RzPEzWYvG9PUXL4DL2J0Ik6ewtqHxAMwJI9uYDz7F3ZHMR50uMLezV59yQpFYAKrSMR2bvJwOCB4Kz6LY+iuNxmUZD938qbKymB7cB/hOd1eCRFqI5RcWhjJ9lH5B2EzgoePwPRM68deDVNEocpBh7oR4TU5VDsTv7z66tww6xyuy33jP+FJJOwSbEhyZbtQYexxlRHfjns2Gc5OaQyqoLDA1hAKBIIA9NL/7pbDaqAc0cm591eP2GqrNeNQxACzbO8QOUubOEQYx1QLrnsyKFWhMB8sZ8aEXwdMBE4wsro1tYfYRk+8R14qXKNsxMs05DMnE4CUl3cUZUUft7nIOWTf6kyxp785GFuBZK1YTxci7mhYn5iE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d678d9-0544-4221-170d-08dda439d4e5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 14:04:04.9907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kvm82rXpqk5mzqSjJ7XhFzdvNuDdS1kL+Ge8edfjtLg6StRZzV0MFavyFgv1eNhUWiGPhbM/ROPn7dR/IGhkQHeWGmn781WGbBka/wBdPlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4558
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506050121
X-Proofpoint-GUID: 9aAO1s_-vlDWei2JJVwpvXNzwEic5VEf
X-Proofpoint-ORIG-GUID: 9aAO1s_-vlDWei2JJVwpvXNzwEic5VEf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDEyMSBTYWx0ZWRfXxQlZVXZ+AaW5 ZohWQrl+3+3Ne+e0GkeFC6gOwb9QEJ0J20gkBgmgDK3iZQE5atSs2rAhVPN6lvKdsdKVATECg05 gnRb6Z9eKAGH2y/durswFDsVHlOlADj0B9A5JVVMEcu801pYZk/uIG5zNaLR8jvd7fFOAym/IKL
 1Y9vxqKCHLUIMaGdGeSqZm8j+ssJ6QTFBHiVrH0bJ6sZTWhPwWwxjX66buVO1SBM1XJEPPsN/EO sNO6FQG2N6veIK1dNaAdYDvdhWXZqcuxZBl3dRkZJOfmbLjw3dCEW7QSeUCARiPFirUtkVVSx4X Qch7L20fH/iRWIfrhWbOfXz2RUmuAnsk5MKGaVXMMAIMrtCJPGJTQk73LxdgIpd7bYmao9nfGMW
 Rf8KsPRRYDnz2zRjs65/IPbUZNnvzkrOP8GuNkB55J0Bl24rPCFdZHhyfjuez+U2LHJGj3qO
X-Authority-Analysis: v=2.4 cv=QI1oRhLL c=1 sm=1 tr=0 ts=6841a3da b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=yMelWy21kOp2rXCf5nEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207

On Thu, Jun 05, 2025 at 11:23:18AM +0800, Qi Zheng wrote:
>
>
> On 6/5/25 1:50 AM, Lorenzo Stoakes wrote:
> > On Wed, Jun 04, 2025 at 02:02:12PM +0800, Qi Zheng wrote:
> > > Hi Lorenzo,
> > >
> > > On 6/3/25 5:54 PM, Lorenzo Stoakes wrote:
> > > > On Tue, Jun 03, 2025 at 03:24:28PM +0800, Qi Zheng wrote:
> > > > > Hi Jann,
> > > > >
> > > > > On 5/30/25 10:06 PM, Jann Horn wrote:
> > > > > > On Fri, May 30, 2025 at 12:44 PM Barry Song <21cnbao@gmail.com> wrote:
> > > > > > > Certain madvise operations, especially MADV_DONTNEED, occur far more
> > > > > > > frequently than other madvise options, particularly in native and Java
> > > > > > > heaps for dynamic memory management.
> > > > > > >
> > > > > > > Currently, the mmap_lock is always held during these operations, even when
> > > > > > > unnecessary. This causes lock contention and can lead to severe priority
> > > > > > > inversion, where low-priority threads—such as Android's HeapTaskDaemon—
> > > > > > > hold the lock and block higher-priority threads.
> > > > > > >
> > > > > > > This patch enables the use of per-VMA locks when the advised range lies
> > > > > > > entirely within a single VMA, avoiding the need for full VMA traversal. In
> > > > > > > practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.
> > > > > > >
> > > > > > > Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
> > > > > > > benefits from this per-VMA lock optimization. After extended runtime,
> > > > > > > 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
> > > > > > > only 1,231 fell back to mmap_lock.
> > > > > > >
> > > > > > > To simplify handling, the implementation falls back to the standard
> > > > > > > mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
> > > > > > > userfaultfd_remove().
> > > > > >
> > > > > > One important quirk of this is that it can, from what I can see, cause
> > > > > > freeing of page tables (through pt_reclaim) without holding the mmap
> > > > > > lock at all:
> > > > > >
> > > > > > do_madvise [behavior=MADV_DONTNEED]
> > > > > >      madvise_lock
> > > > > >        lock_vma_under_rcu
> > > > > >      madvise_do_behavior
> > > > > >        madvise_single_locked_vma
> > > > > >          madvise_vma_behavior
> > > > > >            madvise_dontneed_free
> > > > > >              madvise_dontneed_single_vma
> > > > > >                zap_page_range_single_batched [.reclaim_pt = true]
> > > > > >                  unmap_single_vma
> > > > > >                    unmap_page_range
> > > > > >                      zap_p4d_range
> > > > > >                        zap_pud_range
> > > > > >                          zap_pmd_range
> > > > > >                            zap_pte_range
> > > > > >                              try_get_and_clear_pmd
> > > > > >                              free_pte
> > > > > >
> > > > > > This clashes with the assumption in walk_page_range_novma() that
> > > > > > holding the mmap lock in write mode is sufficient to prevent
> > > > > > concurrent page table freeing, so it can probably lead to page table
> > > > > > UAF through the ptdump interface (see ptdump_walk_pgd()).
> > > > >
> > > > > Maybe not? The PTE page is freed via RCU in zap_pte_range(), so in the
> > > > > following case:
> > > > >
> > > > > cpu 0				cpu 1
> > > > >
> > > > > ptdump_walk_pgd
> > > > > --> walk_pte_range
> > > > >       --> pte_offset_map (hold RCU read lock)
> > > > > 				zap_pte_range
> > > > > 				--> free_pte (via RCU)
> > > > >           walk_pte_range_inner
> > > > >           --> ptdump_pte_entry (the PTE page is not freed at this time)
> > > > >
> > > > > IIUC, there is no UAF issue here?
> > > > >
> > > > > If I missed anything please let me know.
> >
> > Seems to me that we don't need the VMA locks then unless I'm missing
> > something? :) Jann?
> >
> > Would this RCU-lock-acquired-by-pte_offset_map also save us from the
> > munmap() downgraded read lock scenario also? Or is the problem there
> > intermediate page table teardown I guess?
> >
>
> Right. Currently, page table pages other than PTE pages are not
> protected by RCU, so mmap write lock still needed in the munmap path
> to wait for all readers of the page table pages to exit the critical
> section.
>
> In other words, once we have achieved that all page table pages are
> protected by RCU, we can completely remove the page table pages from
> the protection of mmap locks.

Interesting - so on reclaim/migrate we are just clearing PTE entries with
the rmap lock right? Would this lead to a future where we could also tear
down page tables there?

Another point to remember is that when we are clearing down higher level
page tables in the general case, the logic assumes nothing else can touch
anything... we hold both rmap lock AND mmap/vma locks at this point.

But I guess if we're RCU-safe, we're same even from rmap right?

>
> Here are some of my previous thoughts:
>
> ```
> Another plan
> ============
>
> Currently, page table modification are protected by page table locks
> (page_table_lock or split pmd/pte lock), but the life cycle of page
> table pages are protected by mmap_lock (and vma lock). For more details,
> please refer to the latest added Documentation/mm/process_addrs.rst file.
>
> Currently we try to free the PTE pages through RCU when
> CONFIG_PT_RECLAIM is turned on. In this case, we will no longer
> need to hold mmap_lock for the read/write op on the PTE pages.
>
> So maybe we can remove the page table from the protection of the mmap
> lock (which is too big), like this:
>
> 1. free all levels of page table pages by RCU, not just PTE pages, but
>    also pmd, pud, etc.
> 2. similar to pte_offset_map/pte_unmap, add
>    [pmd|pud]_offset_map/[pmd|pud]_unmap, and make them all contain
>    rcu_read_lock/rcu_read_unlcok, and make them accept failure.
>
> In this way, we no longer need the mmap lock. For readers, such as page
> table wallers, we are already in the critical section of RCU. For
> writers, we only need to hold the page table lock.
>
> But there is a difficulty here, that is, the RCU critical section is not
> allowed to sleep, but it is possible to sleep in the callback function
> of .pmd_entry, such as mmu_notifier_invalidate_range_start().
>
> Use SRCU instead? Or use RCU + refcount method? Not sure. But I think
> it's an interesting thing to try.

Thanks for the information, RCU freeing of page tables is something of a
long-term TODO discussed back and forth :) might take a look myself if
somebody else hasn't grabbed when I have a second...

Is it _only_ the mmu notifier sleeping in this scenario? Or are there other
examples?

We could in theory always add another callback .pmd_entry_sleep or
something for this one case and document the requirement...

> ```
>
> Thanks!
>
>

Cheers, Lorenzo

Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1434C28DF4B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750364859; cv=fail; b=DQbPBBMyOQf92yIsoWaPdsqMbUjWGtpaB2IcXXvmuwCihYQwom4FeXPqdRf3On5aUNp0ZzZaEcEBjhUUQZexxIKjUTpNrNhN/HVlmrtb+axhrhVJZTZlC+NIv6CiPWaAdfvgJiMpyrfcf70x27rfWV/OQTzwZFgGLPHjlDpmoac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750364859; c=relaxed/simple;
	bh=72WujZOYWUFqq+jVzcyFH+OR5/eFQJ6EbvXj/VJLEuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dZqsTMBj1o6iCbIRfvbdyL4YkvOiWG46am4ru8oUzyOu+i16xKwm3OuU0JDxf/VXERn+Jz6sIhei2E5XajIR8bggXPNfgfi5JvW3I8Syjcv04PRlM3Ux9LTCMNNrn34jOA9Fj6jcybJPeC4WlxqCTSHipbfS3WhI5p9WGKz/+4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IB9UOhI7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JDQpTHNx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IB9UOhI7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JDQpTHNx"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIfbBP016371;
	Thu, 19 Jun 2025 20:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=lzDBoiehB+ORskSmZw4KbHEoEdjU54CX0+GY/qTNvTc=; b=
	IB9UOhI7/ly2XjUR+keTPdNDf/gyP5S3Ll4bVA0+XhVp/f0sHkg8J26wDwCKwL47
	E6f7LABxHkgUNUTdhpfULCZMcntnkO1iXTyqh0j8fXEvBnyEpXLTNTe73qpFcQNe
	VCOd7NXdWHAamMOhoqBzFyHPyiJz654SfA1lWqEKsAHhhoQsCLE4P44gnlWvke2S
	NYAoQEf9PeAhGr4ejoZsG2ypLwjyVtMhMelxEgoUt+6UcWKubolbShWYBpFB53MA
	50LkZuo2uMAk2Kd+5U2czMbJ1CvvF8yhKjYpav97boVLR0x/823s7WF7c3pPAqVB
	0CQvVjesQnbClBbYuz8DXg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xx224-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 20:27:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIF279038493;
	Thu, 19 Jun 2025 20:27:12 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011005.outbound.protection.outlook.com [52.101.57.5])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhc7m9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 20:27:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XoWJVHJXZUFUsN6ltA6y9mE8nJjZjFFrK8bDVBeR3JfTonJ+EmPmBmVYbMbh3JvwGs6aGTf1Awxv833blOQGw8r2Rl4nqsWcmD3dxRzp5MTS7RUSBg858RT1WiZxx96dH3DMnINNK4CICHIQRwiWzcavDr1MtCCHLaqsokL1Yvw1IqIHNUIC14lge9qwOoc7W8SWdohs3AhaYoePUJzlASkckqXnYcrlUXB9bW6whgtYMfKG9yFExQjJLo+qmjsZjj8/3TzpEQph6wgQJuPD7fRTndMrjKYmmEpcvm6/kYuwFDQ+ITfb4lxf8dqTlSYYjbUFJiZlYYAomTF7cIJ86Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzDBoiehB+ORskSmZw4KbHEoEdjU54CX0+GY/qTNvTc=;
 b=PQwur27wn8SLkvESBhHg1DfOiXIhLE7D2treIkQ0CZDtyDWqe6nhHAG7Kfgh5AlUzht+yKHpIZ8ANOgHiMjiRXMrbTUoc06VFx2AlvIbpBcflbGRCJZM9dAgAaOdUkbioMx901kPlAorMeLtXqe6FDn75O/ofwJQpQN3Jg4bW/AFgo75+enG+c+bSqSZYgC7LzFkh2GEdfBy9DzBU2Jd3nKZsBiTWP9YfmOopB41V2erpFSTcMizBEQ39rCHTEWSAyYpAym1u0ZjWQIAxRxKaJ34v9M5NBedwA1MqRrDhc2YXHsEbfB/+CXMdmLEb0KIw02GL9r5k8AVyipDnXTJAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzDBoiehB+ORskSmZw4KbHEoEdjU54CX0+GY/qTNvTc=;
 b=JDQpTHNxHgPTAgCFIf/RxHEzYz7DmCmMsBWMhSskc/31Sz4He0496DbloRwQfjmwA37BcMf3e9ikF9Dih/IhbkjK85PrCHFrcnZ9Lz7Lx/vPgbp94D5VupZQnmoXXK9yHrzbaDFTGLCPvv/hCDs7N/Z0g0Ncw6iOqQP830At0K0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA3PR10MB8042.namprd10.prod.outlook.com (2603:10b6:208:50c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 20:27:10 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 20:27:10 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Lance Yang <ioworker0@gmail.com>, SeongJae Park <sj@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>
Subject: [PATCH 5/5] mm/madvise: eliminate very confusing manipulation of prev VMA
Date: Thu, 19 Jun 2025 21:26:30 +0100
Message-ID: <441f6b68c62bff6aff68bd1befe90ffc1576b56f.1750363557.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0098.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA3PR10MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: 4874f37d-8dc3-4cfe-9ef6-08ddaf6faafb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/7n+Bb9j1wlpShDq9WxKmNg3Jig0vymqrI0/u6TdcbdJeCxMPHfC0PGg3GbF?=
 =?us-ascii?Q?OsCXUUAi33UgYPiJDnHetfkuai/yZBtAYif+ky8B9xYQL3Bp2bGRMkJZVz8C?=
 =?us-ascii?Q?BSTN85MABiehgVtfjYyD8QwjePeHVdkf2XUfmnCbkF6xNu3GBjKzmEJnjc5d?=
 =?us-ascii?Q?/qHO6DAuSJfqj6GuJW3JXDl8zr4IeCptsEwhIUd+eM52Sk0oFp0hc45n06d2?=
 =?us-ascii?Q?yzHKZadH5MDO6O8lqnE3GX4JSvftbo3yzerP/kqkB/p+QengSkwteKPWjDff?=
 =?us-ascii?Q?13D10zeJwyl97xLlm0b0jBc1iupt/6W+bhZvFFU7lk3hk99QJPzx15DbHlB+?=
 =?us-ascii?Q?V5weTy9JfQ5IWoUDUNdcFbbNCu5es6hML4ZTZt7YDGQScwDJYiG8idxRqEel?=
 =?us-ascii?Q?XGbu72oYwxByN6zvPgXbI8lwvCPop7f7mP/AINlk9CoijZaJVH2oyImqhIDt?=
 =?us-ascii?Q?2P6cev+Dod74tXejXqn6Sz2YdCWtvCLSZhHFiBdDdoFDJadvDGVuD9gtgbRJ?=
 =?us-ascii?Q?DT+x1uSLVGRxQsCa0LQtmNcpbW6QgkwOegXMgQ4uQ3m9nL3AXBHy46WeRI2k?=
 =?us-ascii?Q?yewspta1zjRT75bbJtC/ornkcn5t0N3e8Pm+ZH4p+nt5j/xK7AIDgLOKLTqd?=
 =?us-ascii?Q?JVXOxcVJjqRv7vcl3tkOSatPF7iADKzDX4zazxStIhr7tDb8uMcob8blYSMo?=
 =?us-ascii?Q?cVKRmBti6s2Ip8IOvZG9clOs4bq1vqCvYlDR3tYSQixPDgLDqx53rOaMA03O?=
 =?us-ascii?Q?qDuj1cznlo6ZqAHHJ+db1NtTrLJg4XYVYLPaI0XEOKJxwak9soCaiz89Nmlf?=
 =?us-ascii?Q?QmN22kH+X3blbPXmQK+HcLZvsc4qwCB6rG9a+geDXjvFvO6GRcns9MAB/JAB?=
 =?us-ascii?Q?qPzM2/VHCx/3XPHc1R3Zrx2gsIhWzLudDwNIVybXQ7OJHINIp/wOBf28LXB/?=
 =?us-ascii?Q?tZLqyAWhb1Qd5M+w5aVTZaUpij42vN9nnqnwDpLjPSvHj+2cRs/5dgJkJwzO?=
 =?us-ascii?Q?WvGQ3LXdDZ/1rDgD8c+alKNw4rclbqq7s4NaztCBxQQiIGFKPqXeEh4YYmT1?=
 =?us-ascii?Q?IlKHCXoCVvARKe69iyFgXLAH337u5Qocdnd5cegJHLQAZ5eRKt720B9R/TdG?=
 =?us-ascii?Q?LYqQbzrr9TaFhnS4kUgcc6EdH/i44WrVjyZkuCTF3OVtvfEvNfDKCnwFFAGH?=
 =?us-ascii?Q?rRGfvwBo+RqUhSQsxXlmKUrRY/GY5dHH0HFHrtk18qmK+h2du17xFjNT0QSI?=
 =?us-ascii?Q?c8MOtUxnfG70lh5yZV938SVbDy/fT7iHHI9rMYSxneFsNGVoOHsX1LNJyVF9?=
 =?us-ascii?Q?vANWUKlToDh5ION34svsEENkGBBjf/ccaVhfpSGCjxlrlut9RvDvpEvov8hg?=
 =?us-ascii?Q?wG+TdbKjfCmPIIJMJLnhACHRmmNxCQ9EhkJad7khslhVSgBk2uDMH74acDzc?=
 =?us-ascii?Q?Ofb8QWR1CxU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C3/LrFA7DiPt8gxZ1idivb8mu/AhTss38dJGtNN61v6Q0qU7spCs6eeu9BI+?=
 =?us-ascii?Q?ZvyLR1Hb99bL3EVuJ/0A/ty9m6kjY2S+ZsMi5qcIzr3Hxp5mSxPKMnpDA209?=
 =?us-ascii?Q?jnZ3fcJvhW1tViYCOnaYc7s4Fdbc2WA//vYmJLwFpiYwfifY6Fc3xzq9E5km?=
 =?us-ascii?Q?AqGBpeJs4O9v6p2UYQNb/9KRsXt9Y5XPGy/K6Menz84w8j4di0WCO5BtYAuP?=
 =?us-ascii?Q?R+aKAVwylkSeLvu8bKXbOmAQ7XUrMTEFkWf2BcVQEtBUgv9X7pel2l1D+E4G?=
 =?us-ascii?Q?pF5WHUmxgUuzlJZVlW3lV7G7k4/mpCQCk9SwQ9TXawKBsEmaE8H/8THJeDx1?=
 =?us-ascii?Q?hOjOSbS42OeaiZAXKw+ugRf6sRRvbatEsiGVSw3UioumAHdz+IV59HwMo6yA?=
 =?us-ascii?Q?MtVIflggEgYFL+0y2Sl05+C/fnLsZ/g3MCw8Ht3GnoPIY9BoQ864G1ujgm0O?=
 =?us-ascii?Q?h5mVlISM/N8Ptsp4jSKZr9gdrZxKzRqco4HfjHfvPADcx04x2sr0n+kVGPw0?=
 =?us-ascii?Q?ynwTdVMm7v2pHMQ7YQyoIBdz7a2M3kRkqB0dbk6uH/TklHzSI2leT/hRZ8q4?=
 =?us-ascii?Q?WQmCVqhRq9eA2Sh3qUmzffF/7VD7EQF10Xb9lWDNr+j/M0LxYIqciy2klYAq?=
 =?us-ascii?Q?5QirSvqOk2cJfPUmC31J47GgXrycDasLHmr3C9kOUNZqt6D1obFbc6B8LwHs?=
 =?us-ascii?Q?ddVCXMWpLG3pBvM5tL5TSS78bI9sg4tQ4xK3rEizzVO/ap+B9/E2gEekx4zV?=
 =?us-ascii?Q?ph80GDGiOYuV+13ueFt7suYzZDq2OsfWcQpQVuxvhnEwvUEyH2uQsbWaxP4h?=
 =?us-ascii?Q?dl7SbSuf8lQyq0WJXykbdnMGeoEZrHn6go+097Zyyn164milC1sX9bvBWkTi?=
 =?us-ascii?Q?AkBhdWIuo/CU0df4tuX3IFFudLl4wV/DKGJMxuLt+/Z4xgfUs74F2pWdIFhk?=
 =?us-ascii?Q?43fQ6vv/lLYVOfwEkVpjbOyfbhnYogTz1Lt2qPEeRTwFCbb9ufQvZ0VasmuI?=
 =?us-ascii?Q?THobqURzpDUcJshMNviEjSDC8Lv5xPTyq8HrfSoNfU3QKtxLqcMfTQNlNPne?=
 =?us-ascii?Q?ISIXIT6Co8eMheVMqsrfXNv1+j6oXVRPQE7ZyR5MgK0HjH3OkX/r+WYI4GOM?=
 =?us-ascii?Q?ls88yK5Y2ZXlvsghWmUtwHlh8zreNSwuZrZyWcTfn/QqeVPCPc6xaEh84R7k?=
 =?us-ascii?Q?9Ifco5Pi1bDrzrFvrd/xHH74jGF/MWEUZd1jKYlPdvKfo2/piKY2SryNZ7Vk?=
 =?us-ascii?Q?DuUHM85CQqrJMrr5glwJ9nQntJ90l8STQGIfUmyNv2wqG3+J6UBIBlOGbimW?=
 =?us-ascii?Q?/HMbiUO/V9ccpRTJ0v7KIRY6n9vL0mXGCYHK9xW9IIi3qWIuZzVKXBkJrwUM?=
 =?us-ascii?Q?XOpFux8yFczo+vLGtYlajDocnyd6ByQXHfJQ9k4P/rbygQuVHyN7w5Fu/ABs?=
 =?us-ascii?Q?9ohifV/WjZYEKwazd0QJQAosdGKPPiTloyQemNoGdgSE6tgaoHYMEIF3dV4J?=
 =?us-ascii?Q?qxYeTuXHMNQYIdcR2xNNXbli4KMlc2l0aNhIb5xq+BE5iqBok5BwzIiALtKF?=
 =?us-ascii?Q?zLH+yL9PZ0a65faMtFxjWRxWCNQBSjhxaPhrk2YdZ3RA/cq50P0pXnDmlyWY?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F4YStL3R3MgSAh1i8G28aPkIddp+xfr/SiDIqtNKTSASwkjG+BRr1/+oM2DOY5UKWcTBHFDx7Y8r2xiR6UVtsnRhlWgi4u87DUQgfhgGldTEH6cNpG44vg9m7zck5xHczGDxk9sCWPDUP4ZqrzNS7LvoMJ/1O/4MsgWY4uxMXG9kdHz/FSU6rbaIVP3vDPo62kDMNCpJg2Q2MYeAiPi1PBDzR5vR5r6i9EG6KGIn8NAREye0b8AM+T/mTUT11fkgQcw3YhsZuvkspWjjqxqQ9KZd2AxaVYCAX2sy77V0dby/6qLKBTK2bHqvJxuQr+rpqgMFkPn3Jv+TJoLYWhUmMryyqOrS6sXsg51LBC2DxMA7Rkaf9Kn0SCYHLHJXn4ip5VxI3ZrC1eWlbopATNB6xZ6dyhoHu0rQG1Mrzr1EwrY/w31lP+gRPy6Rat9mxJCoel0DOcz8FNkVOhpDajADSkgJ35WW0okzXpwCEAI9jIi4CARELngaojzh+ARzDqcvk7RRT1JFQ8hGi7a8k6kKy0UvkaUD6/HJJ7osC8L8VDX9ls1pD3yNIUNljRwe2NQT3DL6oSPyQ7kOm1Mgfh/FuXs0hHxr2zvv/4fH1YF1i4M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4874f37d-8dc3-4cfe-9ef6-08ddaf6faafb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 20:27:10.3129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CM38HaGZ8Hb2XSrnNNxoEFGVLvTg3iLY1WJFW1WT7Gh6gpVvt7bhkjboq37m11KvbZBr8oCYGl7WuRn0L1AOdzCMQdrTBkQQ1HhXIgFyNTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8042
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_07,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=995 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506190167
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE2OCBTYWx0ZWRfX+aPHY1ehtNbh 5h5XV9GYNh2et1eCCXAsCPZO+okBBZYGl4h45JgGZIl5NL5Pysh5+qTGLzvjomlV565QdCc0LY8 +Os0+sURH2MU05jFkKnt87tTSuKHVFL3yZwKUUmhpYqFqKMIIalxyXZm49y2iBsSYSOVZfYTfeN
 Ry0nHkv6bC83iOpy7rEG3GLhIof7Ikl3df61SNfjtf30xOLKCSefiN5Ywft2Cf6d2JriMIyHVY0 xW1v2O9nOm60tas/JXXvGPZvqB71pGYX2oPGdA3qtbrJAUFxjvZ854YR6LC1p7XFH5w2Qmiizw4 QYty7K2tIMBar+uLkq6ONxY/sZnfu4/2NQeGtgcH+tFW+YqiN9w9i+gyNhyJDR4AiAyRQ3R0sJZ
 2a1eTYLMV4JhNt/RCHWOOPQnmvjaOQIEJANZaO/embgDf8w4S4qDXEsZxvYZy+RHtY1Mliwd
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=685472a2 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=3PYvvxC6y3Yc54peycEA:9 cc=ntf awl=host:13206
X-Proofpoint-GUID: FgyQX7JZUNR8sq81PWCboMfkueDCAyU6
X-Proofpoint-ORIG-GUID: FgyQX7JZUNR8sq81PWCboMfkueDCAyU6

The madvise code has for the longest time had very confusing code around
the 'prev' VMA pointer passed around various functions which, in all cases
except madvise_update_vma(), is unused and instead simply updated as soon
as the function is invoked.

To compound the confusion, the prev pointer is also used to indicate to the
caller that the mmap lock has been dropped and that we can therefore not
safely access the end of the current VMA (which might have been updated by
madvise_update_vma()).

Clear up this confusion by not setting prev = vma anywhere except in
madvise_walk_vmas(), update all references to prev which will always be
equal to vma after madvise_vma_behavior() is invoked, and adding a flag to
indicate that the lock has been dropped to make this explicit.

Additionally, drop a redundant BUG_ON() from madvise_collapse(), which is
simply reiterating the BUG_ON(mmap_locked) above it (note that BUG_ON() is
not appropriate here, but we leave existing code as-is).

We finally adjust the madvise_walk_vmas() logic to be a little clearer -
delaying the assignment of the end of the range to the start of the new
range until the last moment and handling the lock being dropped scenario
immediately.

Additionally add some explanatory comments.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/linux/huge_mm.h |  9 +++---
 mm/khugepaged.c         |  9 ++----
 mm/madvise.c            | 63 +++++++++++++++++++++--------------------
 3 files changed, 39 insertions(+), 42 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 8f1b15213f61..4d5bb67dc4ec 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -433,9 +433,8 @@ change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
 
 int hugepage_madvise(struct vm_area_struct *vma, vm_flags_t *vm_flags,
 		     int advice);
-int madvise_collapse(struct vm_area_struct *vma,
-		     struct vm_area_struct **prev,
-		     unsigned long start, unsigned long end);
+int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
+		     unsigned long end, bool *lock_dropped);
 void vma_adjust_trans_huge(struct vm_area_struct *vma, unsigned long start,
 			   unsigned long end, struct vm_area_struct *next);
 spinlock_t *__pmd_trans_huge_lock(pmd_t *pmd, struct vm_area_struct *vma);
@@ -596,8 +595,8 @@ static inline int hugepage_madvise(struct vm_area_struct *vma,
 }
 
 static inline int madvise_collapse(struct vm_area_struct *vma,
-				   struct vm_area_struct **prev,
-				   unsigned long start, unsigned long end)
+				   unsigned long start,
+				   unsigned long end, bool *lock_dropped)
 {
 	return -EINVAL;
 }
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 3495a20cef5e..1aa7ca67c756 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2727,8 +2727,8 @@ static int madvise_collapse_errno(enum scan_result r)
 	}
 }
 
-int madvise_collapse(struct vm_area_struct *vma, struct vm_area_struct **prev,
-		     unsigned long start, unsigned long end)
+int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
+		     unsigned long end, bool *lock_dropped)
 {
 	struct collapse_control *cc;
 	struct mm_struct *mm = vma->vm_mm;
@@ -2739,8 +2739,6 @@ int madvise_collapse(struct vm_area_struct *vma, struct vm_area_struct **prev,
 	BUG_ON(vma->vm_start > start);
 	BUG_ON(vma->vm_end < end);
 
-	*prev = vma;
-
 	if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))
 		return -EINVAL;
 
@@ -2788,7 +2786,7 @@ int madvise_collapse(struct vm_area_struct *vma, struct vm_area_struct **prev,
 							 &mmap_locked, cc);
 		}
 		if (!mmap_locked)
-			*prev = NULL;  /* Tell caller we dropped mmap_lock */
+			*lock_dropped = true;
 
 handle_result:
 		switch (result) {
@@ -2798,7 +2796,6 @@ int madvise_collapse(struct vm_area_struct *vma, struct vm_area_struct **prev,
 			break;
 		case SCAN_PTE_MAPPED_HUGEPAGE:
 			BUG_ON(mmap_locked);
-			BUG_ON(*prev);
 			mmap_read_lock(mm);
 			result = collapse_pte_mapped_thp(mm, addr, true);
 			mmap_read_unlock(mm);
diff --git a/mm/madvise.c b/mm/madvise.c
index 86fe04aa7c88..53c3a46d7bf6 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -76,6 +76,7 @@ struct madvise_behavior {
 	struct madvise_behavior_range range;
 	/* The VMA and VMA preceding it (if applicable) currently targeted. */
 	struct vm_area_struct *prev, *vma;
+	bool lock_dropped;
 };
 
 #ifdef CONFIG_ANON_VMA_NAME
@@ -205,10 +206,8 @@ static int madvise_update_vma(vm_flags_t new_flags,
 	struct anon_vma_name *anon_name = madv_behavior->anon_name;
 	VMA_ITERATOR(vmi, madv_behavior->mm, range->start);
 
-	if (new_flags == vma->vm_flags && anon_vma_name_eq(anon_vma_name(vma), anon_name)) {
-		madv_behavior->prev = vma;
+	if (new_flags == vma->vm_flags && anon_vma_name_eq(anon_vma_name(vma), anon_name))
 		return 0;
-	}
 
 	vma = vma_modify_flags_name(&vmi, madv_behavior->prev, vma,
 			range->start, range->end, new_flags, anon_name);
@@ -216,7 +215,6 @@ static int madvise_update_vma(vm_flags_t new_flags,
 		return PTR_ERR(vma);
 
 	madv_behavior->vma = vma;
-	madv_behavior->prev = vma;
 
 	/* vm_flags is protected by the mmap_lock held in write mode. */
 	vma_start_write(vma);
@@ -330,7 +328,6 @@ static long madvise_willneed(struct madvise_behavior *madv_behavior)
 	unsigned long end = madv_behavior->range.end;
 	loff_t offset;
 
-	madv_behavior->prev = vma;
 #ifdef CONFIG_SWAP
 	if (!file) {
 		walk_page_range_vma(vma, start, end, &swapin_walk_ops, vma);
@@ -359,7 +356,7 @@ static long madvise_willneed(struct madvise_behavior *madv_behavior)
 	 * vma's reference to the file) can go away as soon as we drop
 	 * mmap_lock.
 	 */
-	madv_behavior->prev = NULL;	/* tell sys_madvise we drop mmap_lock */
+	madv_behavior->lock_dropped = true;
 	get_file(file);
 	offset = (loff_t)(start - vma->vm_start)
 			+ ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
@@ -650,7 +647,6 @@ static long madvise_cold(struct madvise_behavior *madv_behavior)
 	struct vm_area_struct *vma = madv_behavior->vma;
 	struct mmu_gather tlb;
 
-	madv_behavior->prev = vma;
 	if (!can_madv_lru_vma(vma))
 		return -EINVAL;
 
@@ -682,7 +678,6 @@ static long madvise_pageout(struct madvise_behavior *madv_behavior)
 	struct mmu_gather tlb;
 	struct vm_area_struct *vma = madv_behavior->vma;
 
-	madv_behavior->prev = vma;
 	if (!can_madv_lru_vma(vma))
 		return -EINVAL;
 
@@ -971,7 +966,6 @@ static long madvise_dontneed_free(struct madvise_behavior *madv_behavior)
 	struct madvise_behavior_range *range = &madv_behavior->range;
 	int behavior = madv_behavior->behavior;
 
-	madv_behavior->prev = madv_behavior->vma;
 	if (!madvise_dontneed_free_valid_vma(madv_behavior))
 		return -EINVAL;
 
@@ -981,8 +975,7 @@ static long madvise_dontneed_free(struct madvise_behavior *madv_behavior)
 	if (!userfaultfd_remove(madv_behavior->vma, range->start, range->end)) {
 		struct vm_area_struct *vma;
 
-		madv_behavior->prev = NULL; /* mmap_lock has been dropped, prev is stale */
-
+		madv_behavior->lock_dropped = true;
 		mmap_read_lock(mm);
 		madv_behavior->vma = vma = vma_lookup(mm, range->start);
 		if (!vma)
@@ -1081,7 +1074,7 @@ static long madvise_remove(struct madvise_behavior *madv_behavior)
 	unsigned long start = madv_behavior->range.start;
 	unsigned long end = madv_behavior->range.end;
 
-	madv_behavior->prev = NULL; /* tell sys_madvise we drop mmap_lock */
+	madv_behavior->lock_dropped = true;
 
 	if (vma->vm_flags & VM_LOCKED)
 		return -EINVAL;
@@ -1200,7 +1193,6 @@ static long madvise_guard_install(struct madvise_behavior *madv_behavior)
 	long err;
 	int i;
 
-	madv_behavior->prev = vma;
 	if (!is_valid_guard_vma(vma, /* allow_locked = */false))
 		return -EINVAL;
 
@@ -1310,7 +1302,6 @@ static long madvise_guard_remove(struct madvise_behavior *madv_behavior)
 	struct vm_area_struct *vma = madv_behavior->vma;
 	struct madvise_behavior_range *range = &madv_behavior->range;
 
-	madv_behavior->prev = vma;
 	/*
 	 * We're ok with removing guards in mlock()'d ranges, as this is a
 	 * non-destructive action.
@@ -1352,8 +1343,8 @@ static int madvise_vma_behavior(struct madvise_behavior *madv_behavior)
 	case MADV_DONTNEED_LOCKED:
 		return madvise_dontneed_free(madv_behavior);
 	case MADV_COLLAPSE:
-		return madvise_collapse(vma, &madv_behavior->prev,
-					range->start, range->end);
+		return madvise_collapse(vma, range->start, range->end,
+			&madv_behavior->lock_dropped);
 	case MADV_GUARD_INSTALL:
 		return madvise_guard_install(madv_behavior);
 	case MADV_GUARD_REMOVE:
@@ -1601,7 +1592,6 @@ static bool try_vma_read_lock(struct madvise_behavior *madv_behavior)
 		vma_end_read(vma);
 		goto take_mmap_read_lock;
 	}
-	madv_behavior->prev = vma; /* Not currently required. */
 	madv_behavior->vma = vma;
 	return true;
 
@@ -1627,7 +1617,7 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
 	unsigned long end = range->end;
 	int unmapped_error = 0;
 	int error;
-	struct vm_area_struct *vma;
+	struct vm_area_struct *prev, *vma;
 
 	/*
 	 * If VMA read lock is supported, apply madvise to a single VMA
@@ -1645,19 +1635,23 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
 	 * ranges, just ignore them, but return -ENOMEM at the end.
 	 * - different from the way of handling in mlock etc.
 	 */
-	vma = find_vma_prev(mm, range->start, &madv_behavior->prev);
+	vma = find_vma_prev(mm, range->start, &prev);
 	if (vma && range->start > vma->vm_start)
-		madv_behavior->prev = vma;
+		prev = vma;
 
 	for (;;) {
-		struct vm_area_struct *prev;
-
 		/* Still start < end. */
 		if (!vma)
 			return -ENOMEM;
 
 		/* Here start < (end|vma->vm_end). */
 		if (range->start < vma->vm_start) {
+			/*
+			 * This indicates a gap between VMAs in the input
+			 * range. This does not cause the operation to abort,
+			 * rather we simply return -ENOMEM to indicate that this
+			 * has happened, but carry on.
+			 */
 			unmapped_error = -ENOMEM;
 			range->start = vma->vm_start;
 			if (range->start >= end)
@@ -1668,21 +1662,28 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
 		range->end = min(vma->vm_end, end);
 
 		/* Here vma->vm_start <= range->start < range->end <= (end|vma->vm_end). */
+		madv_behavior->prev = prev;
 		madv_behavior->vma = vma;
 		error = madvise_vma_behavior(madv_behavior);
 		if (error)
 			return error;
-		prev = madv_behavior->prev;
+		if (madv_behavior->lock_dropped) {
+			/* We dropped the mmap lock, we can't ref the VMA. */
+			prev = NULL;
+			vma = NULL;
+			madv_behavior->lock_dropped = false;
+		} else {
+			prev = vma;
+			vma = madv_behavior->vma;
+		}
 
-		range->start = range->end;
-		if (prev && range->start < prev->vm_end)
-			range->start = prev->vm_end;
-		if (range->start >= end)
+		if (vma && range->end < vma->vm_end)
+			range->end = vma->vm_end;
+		if (range->end >= end)
 			break;
-		if (prev)
-			vma = find_vma(mm, prev->vm_end);
-		else	/* madvise_remove dropped mmap_lock */
-			vma = find_vma(mm, range->start);
+
+		vma = find_vma(mm, vma ? vma->vm_end : range->end);
+		range->start = range->end;
 	}
 
 	return unmapped_error;
-- 
2.49.0


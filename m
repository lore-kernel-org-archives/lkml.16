Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54C91AD3E0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750396921; cv=fail; b=hWWsEw9zPI+O22BpbFPlYQzscXgnNQpnT0DbsJCYh9f9wleCBCRW9lDZLzUMyyJX2KGqpmC6lwAca0w+oJE4+Xx6C2EWsM4nUkf4jQUMMP0/MDIwvVN0ORMx3G1DlaIZoFsROwXxEyKJRJMpi0TK4cKYt3/fWTWKXkTJrM7m5v4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750396921; c=relaxed/simple;
	bh=XSO1TbkYWrApvrwCAk/tKVZIJX6BGxoBkFng3gVV5nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jDVvrHDcL4cTKXcfV8Bwo05jllhH7d2O5BCHsKa4xgEbZDkfJWrYTeGEQUtHDe1eNWL+Q1X+98zrNM5scMcqLrz8c+TsGl7IIXpUzYjg2uJ4MFzTjHuSVbdYk4VN5mmRY5qJb4m8p69I3edzTtEK9fmBz0TtVLNXtqyajFkkNqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mkPPKlR2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZSBYCkJM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mkPPKlR2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZSBYCkJM"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K2u37h022393;
	Fri, 20 Jun 2025 05:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=CEEP/dQN7L0QwAIGdY
	Fo5cDAMb60WqeaUzevzEcOQ5c=; b=mkPPKlR2rpWf4diBaDWtpx59Pwjmdu+PW0
	2rwLhEPEkUqC0TgN1HT8OYplLZ2eOV8WrPPjbM4IvvE+pRQgdmwxKnx59jyJMks3
	6VvRlF4KUegiBO7L4nAUKWlCwdLAEVHk78Uxpbcnw84UUfZYEkZqOeL8CR68Ywk2
	SYWpr/lA6q6tvUGKk3whCz4kCeHyocDigm3/ujEeI916geq5b3v8X0xU+vR2UF2/
	WMPpcQqQePCVvshtXXvTDHNbKtKOIout9HZ16mCApUSsCCQ2aShCXKMcdSFQ6RcE
	gXyS/t5/bQqjnG+r6sMb//kGCrl9CXsJWK6fy4apvhwaTdwgP0Dg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv5aw7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 05:21:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55K4wWC8038444;
	Fri, 20 Jun 2025 05:21:37 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012028.outbound.protection.outlook.com [40.107.200.28])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhchpwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 05:21:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnSSYc0O8RXyJmqSZt+Qlt1JbOTLP959b/f5lVW1YZ14GeMJJAMGibyxL6umVD+lDABqS8o2rZ7QMPR7JgnxVUlx/tglUSQX1gNDnL/ktu2GnErYqFuLXkkVo5YqFqRh8pAuJRa+YVPs+oi+wmVL+sRzMZzltoebn8OrAwLOsxA0C2+NjbRroatHaPX5F/zdkMazjFu0GP4t84bGR0O79ovEWpHnrx6F4kKysaW8VuWrCk/1YLAlyjubZZFUNwp7RNRCtFOP9CxWLzLyHQoXYJpXKfAl0AjL5/lHL22RrAPP2oxogPG2TNFHQSt6twq3RW1rszOzZsOPNcjo8K9yxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEEP/dQN7L0QwAIGdYFo5cDAMb60WqeaUzevzEcOQ5c=;
 b=BXuxBz2Eap57NZRG6Vl0eEuJ/lk5C9ZBTrZ2zV4puXMhMBtwqvAtuAMwWczCj06hEFuz8xAFQ7D5z7hbESCaDG8MIfk8Mqm/FEToIHRfD+zy59aov4HFsVOrR5WVJLOE0JFGCG4UKVKID8r7HwOuErlbBip5Byj0G+gzKkvhNW+g53hpAovsoSxhP1q/GU4C0jYVcPs0wVQ2aiGVRq0SDOXryURf/XgFArxtpCBMLlDuDr4lmnEcfQewGzBq07KrPgd+VwL5XETRRbV7Q/bmgbAJaAJJ26YuLW3I/iWnKbusZ/X60BjH6SC4MUq4+jMgYb5QijY9OCBKzI4DS3f8yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEEP/dQN7L0QwAIGdYFo5cDAMb60WqeaUzevzEcOQ5c=;
 b=ZSBYCkJMixY0vFMehP25jdWikYxqsLYbqk/gNeVh+HPWe0ussYeu7NYT1A0gc45hcCMq0/m1y/OOL4oaydRygrdVYROYYZ9NSKScPdrdRmzKEWN2Z4sqY4V2ItYSpmEUBAUXOcbo1CTW4hbE28tqwFBo+0DQzLPzX0QE8k3qW3o=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DS0PR10MB6055.namprd10.prod.outlook.com (2603:10b6:8:cc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Fri, 20 Jun
 2025 05:21:29 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8857.020; Fri, 20 Jun 2025
 05:21:28 +0000
Date: Fri, 20 Jun 2025 06:21:26 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Lance Yang <ioworker0@gmail.com>, SeongJae Park <sj@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH 3/5] mm/madvise: thread VMA range state through
 madvise_behavior
Message-ID: <c77d1201-41be-4c55-af7f-07432b139b88@lucifer.local>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <a520417243ce7f8122de05a0420f964a922e392a.1750363557.git.lorenzo.stoakes@oracle.com>
 <3651A1A2-6EB0-4731-BDB2-E11FF7E63749@nvidia.com>
 <A88CC419-113E-41DA-83F0-016BFE50B660@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A88CC419-113E-41DA-83F0-016BFE50B660@nvidia.com>
X-ClientProxiedBy: LO4P123CA0354.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::17) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DS0PR10MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf48521-91a0-4566-75e4-08ddafba4f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EOtRkbh+oW2mwO/LJhKxaBCUpgdrllkBSzB7WlTMi8OqUtx855uuTUfTowS1?=
 =?us-ascii?Q?aLsmQmZvK5+RPyi8jrZOzloTGoZDs8zWKEkRXNwqezcwGM4/IePjmSAxvzOO?=
 =?us-ascii?Q?OVz8JLWiuIAgWVjfA9MUh7zi15iTl/CZxsh25hahQudFxGtCa/HPNbJbzA2q?=
 =?us-ascii?Q?pfL88bzuoQIwdTJTl/CVKR+yllLy8k1FDLbqdKd9vTvQmCZa4n7jB3vv3Dsp?=
 =?us-ascii?Q?6FyAYVVWmFGJLRWa3W+ZXPzFMBKt7K7ux48do/7HxNtHUOcz98NxF7Qeo4SG?=
 =?us-ascii?Q?XZ4IVFtHM+auR02/XK7CTqk0Q2lCdZajPf6CeqlprdXPo8PC3XgH2g5kabeQ?=
 =?us-ascii?Q?Q2OPczZXyLeQOUg3THW8mY2c2ibIrnZGUOSWmuDFUBUbGUd+ejOPthIggaWO?=
 =?us-ascii?Q?gTHaCvqVraTC4TF+g6cZyou2Y45qLTZGdXgNOx0XGWvLdJnxBZcyGU3m+VO2?=
 =?us-ascii?Q?sixzLu1DoaOSRsk07YywAXjBMqYLDjMUh2ypj0bFd5XFlLnJCcqutKPgJMXB?=
 =?us-ascii?Q?5/9F4/TCeeyN575SxBDZpI3aBnam+kQU+fjm9CR2z+PBYkoCRTb5VoU2BONt?=
 =?us-ascii?Q?0eHovAJLkQHomhu+TU7z1fE2qRSJso+75oTx64Vz8x0MC1875w/uEJjaabxc?=
 =?us-ascii?Q?8bDrv3TW9H+MP10cQJ1xtinoI9C83CYRqx2oDIiRBfpGBqysivLnPCCjUotc?=
 =?us-ascii?Q?IsRGC8eMbhBmm7yYmx1F2CBBjjGQe1ZmpVP6kJ2AYXu3PAxP5g+7vdTqptRJ?=
 =?us-ascii?Q?xW2sR2YNJtxyfPf5NYClY/f1AbWNPNk+uFrUA89F6tIFpxqkKvrU8VcL9BP9?=
 =?us-ascii?Q?l0UdYqRMLl2K7ANviN1OjTUa6e6uMI1CN1mN4JrJfsKQih1cGoeH2uZHqKPl?=
 =?us-ascii?Q?qbec+CmU9mgLnI96+4KCYeQDbUF0Dyj55znA8ZmZaFU+pOtslMNlRbt6Zxsh?=
 =?us-ascii?Q?MNCBmlqtySDTYvQC8eHW1/7/hAAHTJAfbBW3MmdOME5VwDM8kJCMw5YxM7nm?=
 =?us-ascii?Q?BNTJ5vk2ucsM3EUcUIjprU//f4lXlXpT8dcx0R3CnDtoxPp52mtcaLPUxK9J?=
 =?us-ascii?Q?dA0HkAI9k8KUP5eBOnuvjQ3XKOUx+dS/HMV1jLqFOltxFbfNs83HmjV7+5ID?=
 =?us-ascii?Q?CoQQihW50LTaOYJadXdF37h96EXPGxcX67WXeVeKMddW2tSgYGN2LqkPB9HL?=
 =?us-ascii?Q?5Gv4FTkuJSDlXDkbW0FcZhItaHfl/Edqtsh338NXyyg8kc8fvJp594wbz9MC?=
 =?us-ascii?Q?qGFrTthRkjw7PpwxTKRf2m6Qcl3Kz4CfeLXfkCanJepgv2pKzWejHDXRXGZA?=
 =?us-ascii?Q?GWClBsdyoltPy7nWmQB3jbhfGdQI/hZHWZPaGR3ThBXeDooMdCcLbq0az5RH?=
 =?us-ascii?Q?4wgwMWnI451ModBry5yrvBDR71Gn9tMxx+E+MoeF6XqB8xUHc2hmlyQNmeTM?=
 =?us-ascii?Q?tRgv1G/Cv3k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oUzDRbdKRGEOaIG9q9kjWXksl+Qt+JN7PuoR7p9gAbr7F5QbVZs8b0GB/JUc?=
 =?us-ascii?Q?N1FjJD+zxdkiUYK/dwFpz8Cv1jVRq7ZIzPdVyQpN4j+TUk1ubJX20ZUoTdGd?=
 =?us-ascii?Q?b6xOEF3dsCSoc6hlwiXRQVs3cytsKy69Cg3Q4WmWFAW/Xgh56MlUTqPH9DSX?=
 =?us-ascii?Q?VZ94kYbwX3RaDA5Xk9oWG2Ryi4l65LeDPlyIN7/4OBlJvLnxbDFdk+8cTVYo?=
 =?us-ascii?Q?8BBCmKOnqO021ISJI7eFYvi92LYBmUadbGmHfKKU15eJV9dYdlxiYPtLOJwo?=
 =?us-ascii?Q?B77yCP2jMs2BLHqaMDg4nye5KjKxdB6fmzRdGT+pAWzBJWD81LcMI2gHp7W5?=
 =?us-ascii?Q?Szn72R/XpSOQNUdO8HI9oZ2JkH9jckAE4ldgZQ1M+0kuRlSV9yWwdXl/L8yw?=
 =?us-ascii?Q?qM6nrlj+cBEa25tadRxYvt95eidHRGE3k8sDcPMUEN0qXrlUlS4D7ljH049c?=
 =?us-ascii?Q?piLCR1cn9VxIhgo4yGNpFCj8G+cMQYJ6mEf6mjsafhoaREZFyJAe7Wh/vQb4?=
 =?us-ascii?Q?gQkI3HLeyBWzN0QvRJUKRY3AvyTnYxphms9oMBadm8kyQyW/9Lvo22iDavYd?=
 =?us-ascii?Q?e33al2wjN6H6yurJlY+uS6TLKhCB5aQ1viYtrFcQmDe3T/ozD/QqKKd12Vzk?=
 =?us-ascii?Q?Kx6IDmcZ6YrMXr+eTgaDUZwqkbA38NvHons4wtg3TWb0oFPbXVJmCi3uqYII?=
 =?us-ascii?Q?15Pugkx1E/Ta3rtmxSWO8xRWPj36ZTE85aCgGaMqgmJD5tUw0D2mN7+GjnUT?=
 =?us-ascii?Q?ARYvSvjMJ0urdfhN2FabGiSMynsjbB3xt6XGOTQUhvTaKSuTeLeWLhurOv4a?=
 =?us-ascii?Q?96J0j4Px1SjPYYuKkwG6f5hScQUNPJtXFuINiBtg0lnmhIfyZEEnEJHOwEft?=
 =?us-ascii?Q?k5COmbD0SQ6WpPl6ONuFXJzXcJUQ3tS8zOzC5VLrWPs0GntvbjhDmALlcm8m?=
 =?us-ascii?Q?5w4UQWKlKIB3A0wiVh5bc2Y9UeAjme5cyZ8p2nJ0t35QXxn3VMgIRpK1cwMm?=
 =?us-ascii?Q?whyqkTibxkVYwZ9Bap7WUqe63hJ4nhiQ5UQVcQCPkD75d6gt8CwIQdDOBSc6?=
 =?us-ascii?Q?Lz35l71m21n4g6C/eIfyTsX64SU35cAhSJmvwwpC317/XbVHTsvtounLrSf1?=
 =?us-ascii?Q?05gChmx/GVl42rOmTZ4JFRFU4Pn7aSsc0WaR9+ZxqnOaUaLi7eQ2gC++EszJ?=
 =?us-ascii?Q?ejH1fIF9qdc0WOlSYcEL6IY1lbG8Gh8jhNESA4mAw+TRNPOY91nr5zq5jg7x?=
 =?us-ascii?Q?adhlTpmFn9CMfhuovFTEHs/CkQWOW3wE07JRglHk969OnwxFK+YECYak4nXG?=
 =?us-ascii?Q?/utcqC4t9UO5lwIX4mXlQdjFavC8p7GhuAb4EGbJkWuAE5YaZvTgS5uzrHSD?=
 =?us-ascii?Q?n9w4YzzSI50cxFcPOzEI855Iuhz+HdzFYPgyRbyoRnjOR0U8xKlIuD4gbgJO?=
 =?us-ascii?Q?1vjfJSkgf1tD30MAIDwbcy6D0F9AxrtJSPo2iNPczx6/nwIHjqHsp7s22ddO?=
 =?us-ascii?Q?AHhzQdKcpVfn/VjJuQ3Wt4LlJqKyPusRm5h+ExEgS+b7Get3OPT0GO7+Ia9w?=
 =?us-ascii?Q?WX6wt2GW+BHFMj0joeggk6y4BhrZOL5ns7vIbUqwQdsHcfc2dThrgOggkqdH?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	h9Yog2OFrxv7PJl2oPfaQcmJghkIAsmDXFMB8SlQ7XinkxkaSf+akGvufd3H5g9eWydpCMisdw2bfPudzgs7w+SFwuLaF6A4rdmNmcwE8m/cX6ceS8TkVyWFa8HOsabbRW52MArXYQU9gxhQqNBZnWxJBhjqHVEX7lyf7AluyT/auWWfjwJBEDzLoeiUz0n45OW9IvPZJ8SbYwB9s1rh1E/wrpPO9+esET5+F3JPr7oMxp6y4LodyiLIr9/agFRr0bm8gpvNZpGSO1RYm973YdnHmUK60sy47HEeAn37d3Buf8IXkJDmQb/uXNRNmqlvD03/73XazTySvcYYXkYM6YZ1X5ARG1cBvbjbJcYTZ5zkSivigqWC9hAqnC7/7nTjnqJmzWvLVfYlPCF3/w/GiAAM/aQ6tqRXw15732ySRKOu9eY8NV6zFlCEduZzDAw48mww6J0U5yUAXysC5Rww/CoqFnDSpfwIsa/2xkhiwF5GMQehKlwOZi8JR47pJeV5oKb6wiFK48MPj/oEQtosg+oqcbLnYV672cNK7hm/KF9hi4fpul53Td3CbZwciDqv4ZyK8TpXAZrnEL/S49v2dIwLLkscIkZnNwWNwPuelTc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf48521-91a0-4566-75e4-08ddafba4f3a
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 05:21:28.4940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JX4ihRE/V14CpdQn173CsS1izFeCWYT1Byv/Eed4hEVNl4gMQwsXNQhDZ7n7MgIUuE3snWSAwxMvV3b5Biy5zRP435V7yOhNXiYu4jX8p6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6055
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200038
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAzOCBTYWx0ZWRfX5rdlhNUOkvOv e+Xbee3+XDuXA3b3gNvko9DdryO9bYXpft0pLf8Wx8EBMRlxQt5GRHoAZ7E+8srBJCZLrtGyU3a IYBaVph43wfdZ5US7jO1Ae3u4/4NmSFenMD9PPw5J7Bwt9jnsQSjVN7cc/j4ejKBwV8QAuilFTM
 hAqHTB8kiKrhIsuuUOdw6vczJX3ttSb6SztgnhJZjyyLU6+BXXK2YYpSCvaxmcRYWT3D0JUWRT0 9m9W1SoFFXxn20WdVf1TxMPd9w3Ef7T5vIeXtvFVDempLtwy8scKmrO2ft+h8oTiFFaUFXJeIzp NBQ6gL/def818VhXcJKb09AcVw67bPS64kZ+eJPmdT1bRsBZc1+RCaVGArake8RVqP0Mfvik+Ys
 ETdHkpG2CnzA+PSNbBlPrh4srV1I2nZwJTGRH5F94z5ahdTN/c1HtG3Q1yMIlLCqbf9mig+H
X-Proofpoint-GUID: 9IyB__lTrUvIDZytwdAYZRMGSigMHztq
X-Proofpoint-ORIG-GUID: 9IyB__lTrUvIDZytwdAYZRMGSigMHztq
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=6854efe1 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=f_3wAF_0buI-D5XO594A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206

On Thu, Jun 19, 2025 at 10:13:19PM -0400, Zi Yan wrote:
> On 19 Jun 2025, at 21:54, Zi Yan wrote:
> >> @@ -1846,22 +1854,23 @@ static int madvise_do_behavior(unsigned long start, size_t len_in,
> >>  		struct madvise_behavior *madv_behavior)
> >>  {
> >>  	struct blk_plug plug;
> >> -	unsigned long end;
> >>  	int error;
> >> +	struct madvise_behavior_range *range = &madv_behavior->range;
> >>
> >>  	if (is_memory_failure(madv_behavior)) {
> >> -		end = start + len_in;
> >> -		return madvise_inject_error(start, end, madv_behavior);
> >> +		range->start = start;
> >> +		range->end = start + len_in;
> >> +		return madvise_inject_error(madv_behavior);
> >>  	}
> >>
> >> -	start = get_untagged_addr(madv_behavior->mm, start);
> >> -	end = start + PAGE_ALIGN(len_in);
> >> +	range->start = get_untagged_addr(madv_behavior->mm, start);
> >> +	range->end = range->start + PAGE_ALIGN(len_in);
> >>
> >>  	blk_start_plug(&plug);
> >>  	if (is_madvise_populate(madv_behavior))
> >> -		error = madvise_populate(start, end, madv_behavior);
> >> +		error = madvise_populate(madv_behavior);
> >>  	else
> >> -		error = madvise_walk_vmas(start, end, madv_behavior);
> >> +		error = madvise_walk_vmas(madv_behavior);
> >>  	blk_finish_plug(&plug);
> >>  	return error;
> >>  }
> >
> > We almost can pass just struct madvise_behavior to madvise_do_behavior().
> > I wonder why memory_failure behaves differently.
>
> Based on git history, it seems that no one paid attention to
> madvise_inject_error() and the [start, start + len_in] has never been
> changed since it was added back from 2009.
>
> OK, it seems that Kirill (cc'd) moved start = untagged_addr(start); from
> before madvise_inject_error() to after it at commit 428e106ae1ad
> ("mm: Introduce untagged_addr_remote()"). It changed code behavior.
>
> So memory_failure should get the same range as others, meaning
> madvise_do_behavior() can just take struct madvise_behavior
> and the range can be set at the call sites.

Well it's also page aligned in other cases right?

Anyway overall I'm not touching that in this series, sorry. This is a clean
up, and this stuff is a functional change that needs to be carefully
thought out.

So this is legitimately I think one for a follow-up. But this series makes
it easier to fix up later :)

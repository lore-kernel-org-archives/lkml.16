Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB0C1EE7D5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475973; cv=fail; b=vCCCRHKLhvUR/K7Xu2d6j4ZsGvgobZ0x+drt2oMboT+QF2GOppYOpQZnVJKxy/gSO/PdJjl1yYfNJkd+stmWkupv+96M6EGKjY71fKIkQSmm/n+NfIBjpENjrA8Ib8VdGimPP0v4Su7DnY0CA8ZobfKRBB6KDVUfd2UssTdO+Xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475973; c=relaxed/simple;
	bh=ocuiMmyVYJfnrk/Jj+ze2vh8w1C3l3R8XAYQHvA40Ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dt+3PudCB9FQpwL1OlH62jd/UaSzLp6xpAFCYB+TGzK774RgT1azefCQn8Nuf+OK4ITsf9cTiBi2dO/7iboHBg+Z7dmlfDGvcoF18/4YQOibSUPVGXy9aoyDhUpOQlYmu5T9LkSSyzSN9BSZXD76oWarftml+3L0eKLliNUaX0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HRCoTrTJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GTkpO1/p; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HRCoTrTJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GTkpO1/p"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593gD4T008668;
	Mon, 9 Jun 2025 13:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=wYlfTsedOBWqMSiKDj1OINWecpaY9migKVanWKSmP3E=; b=
	HRCoTrTJO3X2kDs44zmDmu1BGu72IPaX56HqOxhK8+Xv03+lFvz5DAg8hksa54pB
	RyO/r/B5QmIoEXWiV1C5FaulepwDARoveGmn5oJPPrxuwBQbKK5of98AW1o83Hnf
	Ma6k4M6GYoxDdq6I8FbCfIK9BHrR7982ZgMH0Qw9oCN98nQxTCctTQp2AeTY855N
	EX/2rdw/A96M7osNNqn78p3dWfUNiBWQcHe7wIUKAYWIwS4V1wA2CQy5LC1BBP+u
	NMsm59YgGlrpt1quvXlNtX5lOwrfO2PPwb9LoSFZfbeCodk//Wd2k+ezy9gJIZqu
	aiqtJihy5NuqkMqr544uRQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14a4jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559C5GHb011797;
	Mon, 9 Jun 2025 13:27:05 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11012045.outbound.protection.outlook.com [40.93.200.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv8ed3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYkuVZvLfxqe4xDIJwJiFACUd2J5Fcmh+HHW8v8vUZFOKRDOOcsMRvoRSgP1GX6PHXSoiuaoViCNm8egb2pbdwaA2nlTOFOPxXpA2WWvlI67aoIxd1OvPhVKvkslfd+ASY8vatXHjndA4T2JnBwyBHpuRe+pDkLMgCSLaNkfplSoIMi2KDjt10ZxT6bMtRZWAJjSzCkN+EMlXhrMuGzb0+/O4aYqETXM18tDevauGIUsuf9AykfTRWUL0B8Jf+Vz4qla9A241Y+YA1L1cd3DKeqaurmAZu3siMGzf7YYDhbzMJiCDgBSF/Mce1MQYFXWEPqt+1OGGK5UDVxXxuBQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYlfTsedOBWqMSiKDj1OINWecpaY9migKVanWKSmP3E=;
 b=uWSBy15vwghOWBbsz8oGU7V/fi083rfeC3ps9vde4yXHBNgID9bHdyUgh1S9MLluccMhQvZFKPPD2JQdllTQ9E9QGU74giiw6MV5Gb9VLUJayNJS9CXGXvrF+2Y4H/YrA4N8wWxLzCp1t8l3b3YyM92jwdCVcXevPM9xkYZ+HgPepYnB/9fvgC3wcEDyypTKfSJns8Ulr16hGopaDNE6HYr4nVvwOf3m+EWrUeyXVPQnYwnU8aTjxoukoqYVplDjxxvYS5cj6Txi3N6E1oSsvqjgSlAMhJfOOn1w3huiT6uGT/YsbSZxH++w3rBb9pr8Mwr8v1KDFpN+qtBXIsTDHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYlfTsedOBWqMSiKDj1OINWecpaY9migKVanWKSmP3E=;
 b=GTkpO1/pl8gki1p6Epww/1YkyQAA1N4CS5DBq9BbJMMNqJAWUhPgsZGvDeTdCbvycI0grrDiL2vNSDrUhr1ZJIOyJKcvoK3T2QPpoTaWG6Op+LNZszDHs/jrdmTyTM7UD/k/N6fZaHGNKLHHlaw3s3bDnhm+b6k4mY0n2olwPj0=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by PH7PR10MB7849.namprd10.prod.outlook.com (2603:10b6:510:308::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 13:27:02 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 13:27:02 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
        Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] mm/mremap: add MREMAP_MUST_RELOCATE_ANON
Date: Mon,  9 Jun 2025 14:26:36 +0100
Message-ID: <d770c484f643c77ca11191eec63073457ce03d63.1749473726.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0234.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::30) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|PH7PR10MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d11bec-16e0-41f1-ed17-08dda7595215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N1wQMVakvoklrpOuuDseo8uUlKjumC3cziOBTU23jthIFy0B2G0YvGGMXj7k?=
 =?us-ascii?Q?jsQSmwUaf5COLOhRbuAfM9q8Up1W2AyHfiMA6C7LjtKyRnDXJz9/JBHQZHg9?=
 =?us-ascii?Q?KXlwnrXkV+1z4c9XpPr9vQtlJ6fV5tzB1G/0BWqwP4K6QfFXDbjOFW5bFiIn?=
 =?us-ascii?Q?nRjrtt4JheHFFjfWh5Nnyuueev/tx1ZveHK8lHariyOS2Utbm+ANyqpZy8aD?=
 =?us-ascii?Q?kaRm2FG8gPkqKuGBqC3aCvqU0eH/PoYTF/dbSTfRDJeEVc9414IjOhbz3kVI?=
 =?us-ascii?Q?rbzW3wqysTxZHz0FsD42g7Q2tWXkGkn2iCRQJCHF/SvwMRLhrxHFLAka9w4E?=
 =?us-ascii?Q?WhD6abJIGoJduzeAS6ZpnMG5/DH2RGoLWPkmYNFr/QhgVl0KG127sAeKllkR?=
 =?us-ascii?Q?S/ZRuEtDbR4WSyhkbqEDFsFRDpA3oeI830B1npu0ZwLJSkr8IoghzR0Jsdhq?=
 =?us-ascii?Q?xaz9zY1gtRAF1SUbb3V5b9JTX8nKCqkglXPAs3mMLG4hfRt5W2mmA2LMzvwX?=
 =?us-ascii?Q?XIcoVssDNApSe8qThrjHELrdn6Rdn0mxZ6V5VW/DDj2kSdDMGN+26AefOk7m?=
 =?us-ascii?Q?yVxQR/V9t2p3AYPcWahueCMoUnVfPVFXhZ6eH1kHSxQY4dnAYfBEkN6UmZmR?=
 =?us-ascii?Q?jYG+nQWo+A2NyvH2DwYvdxZbCUihAERlTeNp657TYyMU5AFmfma2hK6oboeg?=
 =?us-ascii?Q?GAK3J80JrD6CYhMpehUEY+9j5MBHf1NmUuD6dkIUpu0ptJY8O9Ny1+VG/wr/?=
 =?us-ascii?Q?SmXIf9PxBjkKSxD8FzbaXB7nYM5Ae2GH2ZR819gSczSsUAq1B5oLC2oZJLjU?=
 =?us-ascii?Q?09mxY53J78vgC6TLiMr41ualIJtKJKLh1bzwDSllvuAiIXTxgFrS/dI2csl4?=
 =?us-ascii?Q?mWQDpDfrxXsc6HwLfGKA8ZSFS1l/zs7fGPIez+kNQJcG4p9C+8lsQx/FrzJE?=
 =?us-ascii?Q?ZdPOHddia2rSROsJXU4VoNxQ4GfqrPigH8zHINAZUW4WOZr8vXRdp/lnyDAC?=
 =?us-ascii?Q?ID8n4UNabmmSxApW/sK+4YRir2rD4HRBVmlo7xlyIo2ZGUHvoCl4s4d0X+LF?=
 =?us-ascii?Q?COLQvOVcXIimHBSKxu3GehtYQDWj2b3VP4gpnSOmpI05LF+HGMm0uoTmyU1u?=
 =?us-ascii?Q?EE1fjKD0cRsXzhfpkheagiNJP7LZn1AJKB9cGQmuU7a8l6Cq1sdscefRj5qG?=
 =?us-ascii?Q?FxaPJBfWj7OcB6xR/OSIw+zz5awoXsxkFZpYl0Gn61GS4QU+U9zoUkaX0qTd?=
 =?us-ascii?Q?ls1Wh373zmbjpzZGl+C4cGpSUg0A1Yzku3ZkPL8lycpPsWQlWfXWrztlum37?=
 =?us-ascii?Q?obLtJkCTRYMhtXjTo/V66wk0FZN0CToNo3nQeVEYuO775GWm3dtl6dSApCNu?=
 =?us-ascii?Q?7SmXXxp+++j+EesVzGz3tUwHox5wPcizDFFEJEGVyY4YO4CbNDLjFkH/kaTA?=
 =?us-ascii?Q?TSqfrl2XjRw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4LbxnXolJAMHRBUKGoor4IoU8IN2kP8SDWRXqWCWOZ6Y/WL070M637rYx/Dz?=
 =?us-ascii?Q?ymIDbxlOQfGWhXUCHySDGMG3KlKmsnFT4+kA5dmLzEyfvo7SpinqV4afipa9?=
 =?us-ascii?Q?0Pc8FxYMauJhSJcZSc6byw7KTQM638htAWv3dL9CHaNJbebxag53+IyPGHB8?=
 =?us-ascii?Q?ekWYfgWIcdlC7IFc4eY3KY+Tpi29PT0XS+uwKF/MAduGiWD/RpbIA7mW0wJ2?=
 =?us-ascii?Q?cZd3as8xO5zMv170LEZGkpMYrDKpzuNNRxCbXig899hcwlPanmZJqcPnNpck?=
 =?us-ascii?Q?HOKZ25WWlTLP2+buu7acS2+ijEGpe3JxDta4ODl07feGtU5r6GFeaQ4iqTIm?=
 =?us-ascii?Q?3wj1NvYIr4vgFdv9zlgMKQw3r2LnHl300BvSeX8Yg4Ur8jIjW1HUOvzQxUYU?=
 =?us-ascii?Q?FnTBPe/K9irWnh4LrO3wY4/WSnQHLhIaeGkrsueCJZI7YcHgZ30Yv1hsMY6R?=
 =?us-ascii?Q?kRse+7F4atsOVW6YD4HTWJrmr+Dfby42TjAyZ3snt6k1jsy5Paw74WoARSK7?=
 =?us-ascii?Q?Jh5g/hSRBpFpGheJ76unf+bsGg8v9y/3TKbkrM3o3Rselgs3D9ytN1wLvmPV?=
 =?us-ascii?Q?MWTVK2hzSGZ31W05H2XnAnkVyxCfQgzxXD4I5RweXw8zkF1dfb56TjzbdNXM?=
 =?us-ascii?Q?mTCp3YbKiWGO/srLRGVg2+Bx4C9oegVfjyKTZPCzXNqAAxzYrYRaOrKoJGZS?=
 =?us-ascii?Q?jgR4vexonq+Cv7z8s037mLBWWt5e3YcYZibXDXGq2sdrGkeuZA8Nz8iSdCsC?=
 =?us-ascii?Q?2OXKkVrN11TWHGarolq+pCW9yR6pSCy/nVvVtApfEXzacpvxClstpbASN1eE?=
 =?us-ascii?Q?JYXA/ysTqjX6eR93RrEQajG7plo7iHUVg//FbTT/wHhMqocGjv5L6uZGyGYq?=
 =?us-ascii?Q?q4kbPiXAR3roV2F9iayJhlg2bfWi4Oz5KU1tpoP3gy/Hsz3g+9PkkvU0DTci?=
 =?us-ascii?Q?VRibWMkzhW/FRrDF311wSxzQwdxJApNkWA7T8mb1SssSq5IM6QbpSnwHUOyL?=
 =?us-ascii?Q?ndUxTDN7O7SlD4rFJdRwL6MghuDmZo7DRxxFgaXdkeVqv89OngChKSj2Hbpt?=
 =?us-ascii?Q?20e1QKR7JbfV8+X3JvSOhpZ3S4g7uawWeis4c865RW/XdJNmGe+w6YXqebKe?=
 =?us-ascii?Q?4sw99RjHZLAhmE6yKeOsboXu9Rr6QvCyMKU/u4IQW92Aj+JrbR0VSJj5IvYR?=
 =?us-ascii?Q?a3qHUH+1hJpxBbIwkImpklhedN/tTEFFpK0QqL9L8sD3DpthyRhJq2VAIb4k?=
 =?us-ascii?Q?xxz0cZ1o3eg80svNRIsjfgpmK3467wVdPEaAV5pshCFxtOqbDzRnwejRZ9JK?=
 =?us-ascii?Q?mbHJI+nBS3/tstYhYmQ5qGO0ub1wxtsFlTccBbKd1jLnkLZqlmSjUyY/oSie?=
 =?us-ascii?Q?OAl27U/T8/sKJhvO64gHXaGMzx7SjXVJu6Xhe6zUufZXYzwOoG7WvW1UYfNM?=
 =?us-ascii?Q?8qWH0TapTmvHkZ1MAaQpt2U2fHB//KOB+kR/lNykQcqWxydBPiCGQV0eHgRu?=
 =?us-ascii?Q?r54oYCOZQfGkgftXsYorvWPr7OLQRCWX5qceOdiqwYaupYDvb6jzAplzPdmq?=
 =?us-ascii?Q?olzL57ST85w2oV7Hs0LKj4pN/Z+FNmJJKDbFprmo2PZ0w8sNAvZkKFtYJc7i?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PwTlhGoADKVbt6AREYQXsBk4U1jKus1sYBNVWTDxwbU58MKDODMuU7O4db9zNf+qrMXmW8kYRSUYKJCwtxWdBP0Xyz+vkS56xKCzw904uECyDQQh8zKyZDE+8/hdApG85MJCBafN7UDf+SZoIeLXQbic75gWUA2DpyNbdTK3eo+I+WksMIHnd/wbnDpcCiTvgzXz4cNbgCSQIdWtWmxwrPBAYOixD5/iD7SBK2br0ptzTe+0Ize3k1qjcG0JHNk1INUkuKGj1rR5Wi4XF/Xw2wDG5BKuGSHPjJXd+uotOksqXAavcBi99x32pcHwpG9KcACG71syAVsGhRrI16DFu9/7m4hRpolRFjk4aaExi1Ur/RbM8XeYrYjpE84to54lBBYZCxbQgwHtgCupSM9F7LHacQ7tQzqFbeyKDh9vFmnuQM82OJSOw5DhWNdKH7rhAJo3il0ctTX9HranjqB4pDXQnOeyihlEZYg86bWmNgHU2JJy6oP60cPcR5Sd+0S2eR6PvVjJAgHKzrwLjXH18Yh3nmEiscaXvBPZDil3e+/W/rN2clAV58kmGg08ycGKRC5c3ORb2If0VEBewJlPoWRHGtH46BtTSFuBkoLD8JI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d11bec-16e0-41f1-ed17-08dda7595215
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 13:27:02.8200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iv5TtDI4ooNHrgK0Lysp2Y3kIXDUdHKCLaEFVCay+WzCAB9e2MO4+VKEaDypUDdj/PjcOTLM3cQZgNnCFmxUfht7fC4/otpGyD8yQRqdh+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7849
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090098
X-Proofpoint-GUID: TMgZ_RsLYJf8ml6oG90hSIpHPWeu8Cr6
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=6846e12a b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=qNC_Z3nAvvFLoNyIVMsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5OCBTYWx0ZWRfXwnOIU5+wEne4 R0F2apw4ncXmYEunbWFUPPTQiQJXIrwy/awDm8pyiW39CZJG3k5ax/btcMESYQ/AMZX96uzj0tL vGV11QQ6n6J393Uil6D64XQv3MuDDWh6Nv1mzEdwG3xp9I/cbOkZ5szqZg2mfQOxOyU3i62mnzw
 9U0nOSNTCzywjfwdNxH6bWzKhdFAqEGg3UKGL4S5zw0HXrZV5uyPgJtqCJV0mSzELJ/aqP8ndRt kwAZ8G9ruQcVSYHd5PqGfg7g8JDhA+pWpMb+nib++N+NTzp0fUoZ/iSBslmr36x0vjI3EUvyMR7 PBEzd2MoohNEEZF5yD3iNHO6AZ9JrIE1VtuYP35/lrmmZzg9EJLNwiUhjc5UY9aqLRUKl6ACEwx
 38w0B/H16qyAJHI6z4o16B6GDaj1c3vq80F7UbfQx4Rjxv+L/VbgxJKaKzM/FCa2TcnmV6wz
X-Proofpoint-ORIG-GUID: TMgZ_RsLYJf8ml6oG90hSIpHPWeu8Cr6

This flag is the same as MREMAP_RELOCATE_ANON, however it returns an
-EFAULT error should folios not be able to be relocated.

The operation is undone when this occurs so the user can choose to proceed
without setting this flag at this stage.

This is useful for cases where a use case absolutely requires mergeability,
or moreover a user needs to know whether it succeeded or not for internal
bookkeeping purposes.

If the move would be a no-op (could be merged, or folios in range are
unmapped), then the operation proceeds normally.

It is only in instances where we would have fallen back to the usual
mremap() logic if we were using MREMAP_RELOCATE_ANON that we return -EFAULT
for MREMAP_MUST_RELOCATE_ANON.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/uapi/linux/mman.h |  9 +++++----
 mm/mremap.c               | 35 ++++++++++++++++++++++++++---------
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/include/uapi/linux/mman.h b/include/uapi/linux/mman.h
index d0542f872e0c..a61dbe1e8b2b 100644
--- a/include/uapi/linux/mman.h
+++ b/include/uapi/linux/mman.h
@@ -6,10 +6,11 @@
 #include <asm-generic/hugetlb_encode.h>
 #include <linux/types.h>
 
-#define MREMAP_MAYMOVE		1
-#define MREMAP_FIXED		2
-#define MREMAP_DONTUNMAP	4
-#define MREMAP_RELOCATE_ANON	8
+#define MREMAP_MAYMOVE			1
+#define MREMAP_FIXED			2
+#define MREMAP_DONTUNMAP		4
+#define MREMAP_RELOCATE_ANON		8
+#define MREMAP_MUST_RELOCATE_ANON	16
 
 #define OVERCOMMIT_GUESS		0
 #define OVERCOMMIT_ALWAYS		1
diff --git a/mm/mremap.c b/mm/mremap.c
index 2da064f8c898..41158aea8c29 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -1385,14 +1385,18 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
  * is being moved to by updating index and mapping fields accordingly?
  */
 static bool should_relocate_anon(struct vma_remap_struct *vrm,
-	struct pagetable_move_control *pmc)
+	struct pagetable_move_control *pmc, int *errp)
 {
 	struct vm_area_struct *old = vrm->vma;
 
 	/* Currently we only do this if requested. */
-	if (!(vrm->flags & MREMAP_RELOCATE_ANON))
+	if (!(vrm->flags & (MREMAP_RELOCATE_ANON | MREMAP_MUST_RELOCATE_ANON)))
 		return false;
 
+	/* Failures are fatal in the 'must' case. */
+	if (vrm->flags & MREMAP_MUST_RELOCATE_ANON)
+		*errp = -EFAULT;
+
 	/* We can't deal with special or hugetlb mappings. */
 	if (old->vm_flags & (VM_SPECIAL | VM_HUGETLB))
 		return false;
@@ -1401,14 +1405,17 @@ static bool should_relocate_anon(struct vma_remap_struct *vrm,
 	if (!vma_is_anonymous(old))
 		return false;
 
-	/* If no folios are mapped, then no need to attempt this. */
-	if (!old->anon_vma)
-		return false;
-
 	/* We don't allow relocation of non-exclusive folios. */
 	if (vma_maybe_has_shared_anon_folios(old))
 		return false;
 
+	/* Below issues are non-fatal in 'must' case. */
+	*errp = 0;
+
+	/* If no folios are mapped, then no need to attempt this. */
+	if (!old->anon_vma)
+		return false;
+
 	/* Otherwise, we're good to go! */
 	return true;
 }
@@ -1460,7 +1467,10 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
 	struct vm_area_struct *new_vma;
 	int err = 0;
 	PAGETABLE_MOVE(pmc, NULL, NULL, vrm->addr, vrm->new_addr, vrm->old_len);
-	bool relocate_anon = should_relocate_anon(vrm, &pmc);
+	bool relocate_anon = should_relocate_anon(vrm, &pmc, &err);
+
+	if (err)
+		return err;
 
 again:
 	new_vma = copy_vma(&vma, vrm->new_addr, vrm->new_len, new_pgoff,
@@ -1491,6 +1501,12 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
 
 			do_munmap(current->mm, start, size, NULL);
 			relocate_anon = false;
+			if (vrm->flags & MREMAP_MUST_RELOCATE_ANON) {
+				vrm_uncharge(vrm);
+				*new_vma_ptr = NULL;
+				return -EFAULT;
+			}
+
 			goto again;
 		}
 	}
@@ -1840,7 +1856,7 @@ static unsigned long check_mremap_params(struct vma_remap_struct *vrm)
 
 	/* Ensure no unexpected flag values. */
 	if (flags & ~(MREMAP_FIXED | MREMAP_MAYMOVE | MREMAP_DONTUNMAP |
-		      MREMAP_RELOCATE_ANON))
+		      MREMAP_RELOCATE_ANON | MREMAP_MUST_RELOCATE_ANON))
 		return -EINVAL;
 
 	/* Start address must be page-aligned. */
@@ -1856,7 +1872,8 @@ static unsigned long check_mremap_params(struct vma_remap_struct *vrm)
 		return -EINVAL;
 
 	/* We can't relocate without allowing a move. */
-	if ((flags & MREMAP_RELOCATE_ANON) && !(flags & MREMAP_MAYMOVE))
+	if ((flags & (MREMAP_RELOCATE_ANON | MREMAP_MUST_RELOCATE_ANON)) &&
+	     !(flags & MREMAP_MAYMOVE))
 		return -EINVAL;
 
 	/* Remainder of checks are for cases with specific new_addr. */
-- 
2.49.0


Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB51E1EEA4B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309405; cv=fail; b=ny1MgRuw8wRViy8HpgcZfYyfDh2QgHLsBubafcd33pzGWgx8soPOTNkYVJOMaVoU1CrfupUpgdzbGfpCramUur/bqgxuOGn8cLYpGTCnmFWI7xloo3m6HApsmyhq6NS3YH0IU5AePFQm1RJUiZG9fgtKWW2lrRY8TZ1ptyIfUqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309405; c=relaxed/simple;
	bh=xpB4JfXlAbnhRCWj8kFSKd6BmM4HASZAmtSp1KRYRJI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=C2ERVvKg0uuJDVzotqJc+yPMUkkQd8mGKzNjqEQ7CMSgAdcqA1yHvduOB9ieqC6G6yqrLr5oiTb5RafDwlLL/AkVtirS90eVctr5TabDIYWnia7RrQoG5wVYa4efe9iBCrkPKAbim+lUp1VG3eCRedBjlLuM+QrO5nnRdUQqA+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Kj2LzpuE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XkzhWkVk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Kj2LzpuE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XkzhWkVk"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7N7UB006880;
	Tue, 22 Apr 2025 08:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=qj1dFSyRyOc8zdpS
	Pl3IO02oPi/tqiwFF7vOmu2BEHI=; b=Kj2LzpuEhff1pWI4I7glUKyDe4HckbZL
	OFS55juMCGIaEmIFDeOUTtZpgRkRJC/M0wGEpf99djt3I4RhbB7JlKanrlP+/5mJ
	bL3ljA7fLeRDJaZLPVRnMZ1Zy51Bi1M+cLW5Cgbca1bwqBqvvQISYxUKFuwOX8zR
	9fi0ATOK9ksNwieYuiRkNclvoQN2WEis/6Fmgn98i7ByVybJ+fbLRgZCclMDU5Bx
	EP9zJe0O1vDaf7KISSagOiNFPXdjWZ706t22hHkt3J22nZo5UjVpD4Wmhznws/tT
	AwRj2Dj01WN2RZWhHwBGt2NnTWs8ibrjsydX9HyJRN+Vsj7OIgCqZg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4643esbyxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:09:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53M6lDHu003082;
	Tue, 22 Apr 2025 08:09:46 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazlp17013074.outbound.protection.outlook.com [40.93.1.74])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4642991r0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:09:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvuT1+b6AM1186ZIL6cJWr1whH6yudUK73JioSamnPVs41h9mtEkaGokzoGLsckvG1EnX9ApHQed3rpt4ZIZpdULVUAlgKYw9KRmR9MveGpT0WHv/NJ+XCHQO0m4GOPa7rhVL/6p5wu4TiUb0VPDNxCA2dKmoKLJscVaBJMfSkWwe3lQ/6gH1Eg6NBgSJGnPn5PqhJBh2m5pcPyKy8ENIgY0Zjas0OW/JwLev5yQ6IK+W1pnMPB3d2r86c3Erp8Mm38cYD6Ae2tbKB+5adX2pQ++NOamqzNOYu75MnFtklVh5Y9pOx4ve8A/LdJOVPitXjj6qqsfFL53bV1Yvw+eFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qj1dFSyRyOc8zdpSPl3IO02oPi/tqiwFF7vOmu2BEHI=;
 b=XueJlMXnnDdfd6xQdduMkCpVaHiALUBL4GPxxb5TmRCI1mI7HnOvT6BSyE2mgOVbGOeYRkhQOpWn2byV6VH4Xre+BentknvRm/Xn9HUQrCUMFPt9izvQgzKmtLLbv4KjuiFAkh/+n2MvBUAZBXoLn+kQnY7U35ZVhSaaIGxg/oiqNm00lhOlSpawU38uRRJuDczPpPUMhRkY0t2TYUzi1Eyn4VI14lHCDePiy+e1OZuvV4swn+FosKQL+o/pdPW9gM0UjsYcu7bnBC1+iW9fFbvL2fIp3d/WR1DRg0j9tqSo0OX0HSvv9DPZ0PUG42B4RB9QwR8ecU/21j1bl9TZZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qj1dFSyRyOc8zdpSPl3IO02oPi/tqiwFF7vOmu2BEHI=;
 b=XkzhWkVkTDtVx2KxnShtLEqc2GoQGUkIhVYnQHeqQ7xCSn9VbgPlyIYSyv4/RgSRt+4U7WSyINJwO/huJZQPi5dXO67TsvgsTMrxL0bp85eluCEteSh0ZqhUv59jozgo/Y701RB0QoCtEG5ZUMXLfo+vIME1t+cAtH97JFnPxXw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4587.namprd10.prod.outlook.com (2603:10b6:806:114::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Tue, 22 Apr
 2025 08:09:43 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 08:09:43 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 00/10] mm/mremap: introduce more mergeable mremap via MREMAP_RELOCATE_ANON
Date: Tue, 22 Apr 2025 09:09:19 +0100
Message-ID: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0110.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: 62fd4d39-fac8-40ca-8ff6-08dd81750a04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SZK7+fgWXJKeI7K36Lu9zqbU9k6hnf26wlRHs3/p30pnaHe2blscD1B7DeDd?=
 =?us-ascii?Q?VhvuxTLwMUssQyB7dpK47nJUNqBj3GMhQTGp2vLCA3a4xD/rOTVAFqJWSkRb?=
 =?us-ascii?Q?1wjGPBFC99nDQdbl5RSTFHSKye84ThIeGx1fsuErgU0mUDMfzYd/3QiYXTPb?=
 =?us-ascii?Q?/epJEqpW9tXB3DSjIWmNCYSLeylrACzwSJkWgqZmPoFj2/jgOYQnpZ/4FTdP?=
 =?us-ascii?Q?0ow9DYTKkoqBeznpg2l760Klg9CH+GvoGBao832uEdKSxKaErVVr0okzkG0N?=
 =?us-ascii?Q?qJUR8Ip5iPs452zoaposgPYjHjN2Jm3IEyjQhyK5ebyHRlEugSwAR/s7+wY8?=
 =?us-ascii?Q?TifHi31/fSx2vgvSrjxXvz3IyToRRpdDL+DXbJilPYboqvUshIFpNl80hbsG?=
 =?us-ascii?Q?1UwjXGIzOV6paRuP+QevG5MG5EFXGU7KBnRpaH3QMBUP4KAlp2044pLeex/P?=
 =?us-ascii?Q?Ev5HaJ2sXbYGGVRT0THrtrOz25eCMroMlpItzoNATr7wvVBFiTvRfmXFcsfh?=
 =?us-ascii?Q?++bZem0cq0B4ygwkEVaPVxr/pUNeX0UaGXbbomVv6T3rL0XVSla9Ea8mSq1o?=
 =?us-ascii?Q?AUJ3TORTrGktYZKWJ2aU0IvA/Jl/Vo1j80IEikETPgPUoPXEJw4yFWKkKMWC?=
 =?us-ascii?Q?tPnttM+EBy3e6NM5m7RtiKDdvWLCb9WDYVKsHyOpumMmSvJcBmipXItPtDaZ?=
 =?us-ascii?Q?wflUcbDK5WgkU8rxJuu7rYkEGTnLUpl13rvxqAHMBmYAct6uGDumKH8xZ8Qj?=
 =?us-ascii?Q?1POg+JALo6ZTXUn/z2laIUdVJ2Xt3j0XbpREHB3iIA3wO7GMxJSsZixxx0XR?=
 =?us-ascii?Q?/I1xfcnuZHEnl5u6aGmnFzpNe1LpxxXSpeon2H89libYTRedP0j9vR3wAnNq?=
 =?us-ascii?Q?8NguJcjpH5eQ5cTi0n6EPG2XwU9609C8pRla5QO7fnCmYWCZy8Z7TzWtxYo4?=
 =?us-ascii?Q?PkdCw9aSqujRvaFL3r3u1kNjNM8F3huS921hhyQDJarBklwnA5N6GjwLQtlf?=
 =?us-ascii?Q?uEWUoeo5Sl6uGoNlnzlCKR3z8TJKhdcA83fDsTMootAjG7lruwjKJsMD+1rJ?=
 =?us-ascii?Q?43IUzFPknA+NHX81Vin3BYZcHUWwObKnS5UhQXb8Yb1xEhC28BZiENFa7oAa?=
 =?us-ascii?Q?YniPI24NxIfYDKQ3TAucTRMoeyAOgStyL+2HIHujE6H6AnhqnZdHbbS7XdgE?=
 =?us-ascii?Q?N2E/3SJBivkF3Ml6THrfPklCvEdHOC3WSa7TxnTp13C07I7M7EbiHCSp+LbH?=
 =?us-ascii?Q?A8uqdju8DuD1lpI0EbqGuuA18yK87aZQTEGO+wz3TFNCo7Nd+zNew3Rqk29S?=
 =?us-ascii?Q?bgJBUWtLJ/Qdd2KuGsShiGB+LhsJbZErbUrRtcasyW20VAuhhIQ+zoaBWhm6?=
 =?us-ascii?Q?2fVBv6zFq2gXKrtwpFnIfpMu5b8xr4vIZQ66agUHKv47O4IEY68ys7cLthzV?=
 =?us-ascii?Q?ss4/+MoKO4g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rtk1hPAgowkTV00dRzMmVzkBMb3aTDpca4zYACEfksJsfG5AqqTCdVBH34s4?=
 =?us-ascii?Q?RaxldR2fH4SLRlMSpSAOvig5mPlnK3GBaYfm/+0QbTRpe3ToW3chdQ74LPYS?=
 =?us-ascii?Q?+CPPdiMzs+LWVjQ0Mxwp2yAJUMaibDwZ4DzEBCbYHbEr/+4i83r+bfPaUp2d?=
 =?us-ascii?Q?dkWCtHiVdpUV/NAVGtNt1hNJUmEhyqteCo/wjcXsMjbGRLlrg5fgY+t/5ykD?=
 =?us-ascii?Q?8FGMCHvGcf71JWYSspxPxhalAUGGeZxpJftMNp4zKhi715nLJb8c5kBbWxcu?=
 =?us-ascii?Q?3xUISSplr7djbN5EK47VaPcd62d4VxjWPvhJzqTf7uUuVaQSJMl1QFu7KIvG?=
 =?us-ascii?Q?blcd8ozpdCCqbY1dU/k8yVKRd5e29EjN1/rG5XrdJURKVoatGnX440tBelTc?=
 =?us-ascii?Q?8rBK2w0dvDlFN2d6BavDlwsFjx0UOGU+GedXFf9Pj11vxUopXIpjSEfPKgDj?=
 =?us-ascii?Q?fvrracu+beOFHhI0dwE1XxQtCiC9lYwuk5pKsOEPeRWCTJgO2ZwEc1l1m6sr?=
 =?us-ascii?Q?q5z7kFQAuve54yDAOM5sqUwKFyOUOnz4ExfoEJzJoYC+PCeblryw17aNLEN9?=
 =?us-ascii?Q?sTCjk9C/xrBnF2U16/vRtWfaJWXn9eJpcUteduxwKlLeWSiH9ucU1Cr8Bway?=
 =?us-ascii?Q?R2q5Z5EQ5EEy1tsqCVpzQWY6Je6YpE3jU++yTHsWrFfafahgXkyT6qNtWVbk?=
 =?us-ascii?Q?pOL/4n5T1B6l3bnJpmTt4HF314I4c4zcfkpJfSljcrIXRiUfWpo0M1tR6OT9?=
 =?us-ascii?Q?oMBktaRyktrx32HgZeK+WlWuHpcdndzbrxJOZcf76GBgNGy6p+/CkUtG1M4U?=
 =?us-ascii?Q?4tU11D31dOdRsEiTx6H9EGlV9CMX0lNlUezPf5r+vSsTyleb33z5y/d3njoQ?=
 =?us-ascii?Q?eQM6HmS+HgfyEGao0I9OC+bMfPouj4jAMECloPyKcngqO1Am0/E3lfLeBxgd?=
 =?us-ascii?Q?/r6ysz6sHf7GUW0agYc/+nFpGSwF0JJy0dGtpfoHAD8drrw3hrD+BlbqhzY8?=
 =?us-ascii?Q?nqyxbjSc/6WDnRXzhuExac8+dyu36CSq8cMKVGM4WiDn19SB3xUK1kqykQ7k?=
 =?us-ascii?Q?9wGenx/e5VLIuzuBlZeraaGXRWQnvcTYJD662xJqaa7BdTX4+wD0kqOi2Atg?=
 =?us-ascii?Q?sYMGs7D15WHDNjAgEx2dBJc+6rppDYoZoPH1I6lbzupZnwsvMhhZonAbyXyU?=
 =?us-ascii?Q?gdIgWAlAKulk7Pr2E7DA4j+8REtFRmKw5hjj7Dp/9IgNGd95AQ8iUk2NgJJ2?=
 =?us-ascii?Q?fS4LeBRAB9QGB4WwXHOsw8X+vVG60k655WpWyUAElu8dm977anpLNlwwFlYN?=
 =?us-ascii?Q?cO/li9cmwHgJGzOeVXp1SJkagiY7asSNx1KCtLO95bRCBZiP8crsh4jZ3VCU?=
 =?us-ascii?Q?53l4B0nxsd1srbxcG2ryPlixhDLlvR1GVNIG2E0/1TL+tmChNoT1ke9g9W/L?=
 =?us-ascii?Q?QGbvvfl9q6i0+qPUkl/J5+VtiLQPsagIRicV/0DjIBYBrYiaXrNI4WoeZ5yj?=
 =?us-ascii?Q?T4PkVPklJOV0NiLnexHbkwyQYq6yKYy6T+/Q9Lb7GvYthqpI2wZn6s0NDIMH?=
 =?us-ascii?Q?hC1UZgdLqUxwSSL/JMlfEdFrS25m9PsFsF2OnzSDYVyrdir5qYv1+3FsgWos?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	O0L/B3eLhCzewSO1r0j+dYq9DGQzTVaz/Sz4gkjs5OTUWkf8ZslLQ7JP66vttnx577snjR5ooVwYZTnMFMI1FNeHDt0vMk3r+Y2712i5MdFr3aeR8mY2TfQ/swEf4QU0qpLBKbTqZUuZXfacNV+7MKciiHTzf3OiE7zp0KTT7ZRL5F2hzs5uZTUU+esJV20gQmbvebxpHup/PIvOS2FnM5dJ5CycZyCzLKMirHAPyaI62qqg6x/Bb5JviHFDSNxa0AfebM8Z0kNXfllESGXADrA0u/fzuA6lxQAKn0i5p+ntELuMZca9HHbAvbcPsVOOhsnQFOFCToQOEF9hIDhMzXndxoGd7u9uDQAbV8FQxsU7NyEzkk3q34Crc/lEDIQWvusMu/tXZ4w8gTbQrGBl7DAIRjZSVuDWSr4bH0yuhiXVv1hTDlqn7wBrboKUB8eYZizQ7daGAFYhonT/XgCN3r32VDfqOmQBdyl7Meq2EJcm/U1QLu3VJW0NWKeomwVp0BloI9vh6ampiANU0gdmQtwUULgKiit9B57vrAAe4fv8I/JYMTkIDIASWOCds/VwEwz8iCeoJvI9eHEYKfNBRPfnPYD/5qAl5VBGjzWcwss=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62fd4d39-fac8-40ca-8ff6-08dd81750a04
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:09:43.7955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DiNXurt2fPtwIkJKAyOSavu0i6QFizpWqo837TkLEJebkgbvkkpQpLmUqClqqnGgTRSymzqiFd+C5aVMLemsQnIVRJBfLt9vexWu2MjJOq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4587
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504220061
X-Proofpoint-GUID: vlNXOLmej7dUkAM4U2xeizhosD5x8MGa
X-Proofpoint-ORIG-GUID: vlNXOLmej7dUkAM4U2xeizhosD5x8MGa

A long standing issue with VMA merging of anonymous VMAs is the requirement
to maintain both vma->vm_pgoff and anon_vma compatibility between merge
candidates.

For anonymous mappings, vma->vm_pgoff (and consequently, folio->index)
refer to virtual page offsets, that is, va >> PAGE_SHIFT.

However upon mremap() of an anonymous mapping that has been faulted (that
is, where vma->anon_vma != NULL), we would then need to walk page tables to
be able to access let alone manipulate folio->index, mapping fields to
permit an update of this virtual page offset.

Therefore in these instances, we do not do so, instead retaining the
virtual page offset the VMA was first faulted in at as it's vma->vm_pgoff
field, and of course consequently folio->index.

On each occasion we use linear_page_index() to determine the appropriate
offset, cleverly offset the vma->vm_pgoff field by the difference between
the virtual address and actual VMA start.

Doing so in effect fragments the virtual address space, meaning that we are
no longer able to merge these VMAs with adjacent ones that could, at least
theoretically, be merged.

This also creates a difference in behaviour, often surprising to users,
between mappings which are faulted and those which are not - as for the
latter we adjust vma->vm_pgoff upon mremap() to aid mergeability.

This is problematic firstly because this proliferates kernel allocations
that are pure memory pressure - unreclaimable and unmovable -
i.e. vm_area_struct, anon_vma, anon_vma_chain objects that need not exist.

Secondly, mremap() exhibits an implicit uAPI in that it does not permit
remaps which span multiple VMAs (though it does permit remaps that
constitute a part of a single VMA).

This means that a user must concern themselves with whether merges succeed
or not should they wish to use mremap() in such a way which causes multiple
mremap() calls to be performed upon mappings.

This series provides users with an option to accept the overhead of
actually updating the VMA and underlying folios via the
MREMAP_RELOCATE_ANON flag.

If MREMAP_RELOCATE_ANON is specified, but an ordinary merge would result in
the mremap() succeeding, then no attempt is made at relocation of folios as
this is not required.

Even if no merge is possible upon moving of the region, vma->vm_pgoff and
folio->index fields are appropriately updated in order that subsequent
mremap() or mprotect() calls will succeed in merging.

This flag falls back to the ordinary means of mremap() should the operation
not be feasible. It also transparently undoes the operation, carefully
holding rmap locks such that no racing rmap operation encounters incorrect
or missing VMAs.

In addition, the MREMAP_MUST_RELOCATE_ANON flag is supplied in case the
user needs to know whether or not the operation succeeded - this flag is
identical to MREMAP_RELOCATE_ANON, only if the operation cannot succeed,
the mremap() fails with -EFAULT.

Note that no-op mremap() operations (such as an unpopulated range, or a
merge that would trivially succeed already) will succeed under
MREMAP_MUST_RELOCATE_ANON.

mremap() already walks page tables, so it isn't an order of magntitude
increase in workload, but constitutes the need to walk to page table leaf
level and manipulate folios.

The operations all succeed under THP and in general are compatible with
underlying large folios of any size. In fact, the larger the folio, the
more efficient the operation is.

Performance testing indicate that time taken using MREMAP_RELOCATE_ANON is
on the same order of magnitude of ordinary mremap() operations, with both
exhibiting time to the proportion of the mapping which is populated.

Of course, mremap() operations that are entirely aligned are significantly
faster as they need only move a VMA and a smaller number of higher order
page tables, but this is unavoidable.

Use-cases:

* ZGC is a concurrent GC shipped with OpenJDK. A prototype is being worked
  upon which makes use of extensive mremap() operations to perform
  defragmentation of objects, taking advantage of the plentiful available
  virtual address space in a 64-bit system.

  In instances where one VMA is faulted in and another not, merging is not
  possible, which leads to significant, unreclaimable, kernel metadata
  overhead and contention on the vm.max_map_count limit.

  This series eliminates the issue entirely.
* It was indicated that Android similarly moves memory around and
  encounters the very same issues as ZGC.
* SUSE indicate they have encountered similar issues as pertains to an
  internal client.

Alternative approaches:

In discussions at LSF/MM/BPF It was suggested that we could make this an
madvise() operation, however at this point it will be too late to correctly
perform the merge, requiring an unmap/remap which would be egregious.

It was further suggested that we simply defer the operation to the point at
which an mremap() is attempted on multiple immediately adjacent VMAs (that
is - to allow VMA fragmentation up until the point where it might cause
perceptible issues with uAPI).

This is problematic in that in the first instance - you accrue
fragmentation, and only if you were to try to move the fragmented objects
again would you resolve it.

Additionally you would not be able to handle the mprotect() case, and you'd
have the same issue as the madvise() approach in that you'd need to
essentially re-map each VMA.

Additionally it would become non-trivial to correctly merge the VMAs - if
there were more than 3, we would need to invent a new merging mechanism
specifically for this, hold locks carefully over each to avoid them
disappearing from beneath us and introduce a great deal of non-optional
complexity.

While imperfect, the mremap flag approach seems the least invasive most
workable solution (until further rework of the anon_vma mechanism can be
achieved!)

Testing:

* Significantly expanded self-tests, all of which are passing.
* Ran all self tests with MREMAP_RELOCATE_ANON forced on for all anonymous
  mremap()'s.
* Ran heavy workloads with MREMAP_RELOCATE_ANON forced on on real hardware
  (kernel compilation, etc.)
* Ran stress-ng --mremap 32 for an hour with MREMAP_RELOCATE_ANON forced on
  on real hardware.

History:

RFC v2:
* Added folio_mapcount() check on relocate anon to assert exclusively
  mapped as per Jann.
* Added check for anon_vma->num_children > nr_pages in
  should_relocate_anon() as per Jann.
* Separated out vma_had_uncowed_parents() into shared helper function and
  added vma_had_uncowed_children() to implement the above.
* Add comment clarifying why we do not require an rmap lock on the old VMA
  due to fork requiring an mmap write lock which we hold.
* Corrected error path on __anon_vma_prepare() in copy_vma() as per Jann.
* Checked for folio pinning and abort if in place. We do so, because this
  implies the folio is being used by the kernel for a time longer than the
  time over which an mmap lock is held (which will not be held at the time
  of us manipulating the folio, as we hold the mmap write lock). We are
  manipulating mapping, index fields and being conservative (additionally
  mirroring what UFFDIO_MOVE does), we cannot assume that whoever holds the
  pin isn't somehow relying on these not being manipulated. As per David.
* Propagated mapcount, maybe DMA pinned checks to large folio logic.
* Added folio splitting - on second thoughts, it would be a bit silly to
  simply disallow the request because of large folio misalignment, work
  around this by splitting the folio in this instance.
* Added very careful handling around rmap lock, making use of
  folio_anon_vma(), to ensure we do not deadlock on anon_vma.
* Prefer vm_normal_folio() to vm_normal_page() & page_folio().
* Introduced has_shared_anon_vma() to de-duplicate shared anon_vma check.
* Provided sys_mremap() helper in vm_util.[ch] to be shared among test
  callers and de-duplicate. This must be a raw system call, as glibc will
  otherwise filter the flags.
* Expanded the mm CoW self-tests to explicitly test with
  MREMAP_RELOCATE_ANON for partial THP pages. This is useful as it
  exercises split_folio() code paths explicitly. Additionally some cases
  cannot succeed, so we also exercise undo paths.
* Added explicit lockdep handling to teach it that we are handling two
  distinct anon_vma locks so it doesn't spuriously report a deadlock.
* Updated anon_vma deadlock checks to check anon_vma->root. Shouldn't
  strictly be necessary as we explicitly limit ourselves to unforked
  anon_vma's, but it is more correct to do so, as this is where the lock is
  located.
* Expanded the split_huge_page_test.c test to also test using the
  MREMAP_RELOCATE_ANON flag, this is useful as it exercises the undo path.

RFC v1:
https://lore.kernel.org/all/cover.1742478846.git.lorenzo.stoakes@oracle.com/

Lorenzo Stoakes (10):
  mm/mremap: introduce more mergeable mremap via MREMAP_RELOCATE_ANON
  mm/mremap: add MREMAP_MUST_RELOCATE_ANON
  mm/mremap: add MREMAP[_MUST]_RELOCATE_ANON support for large folios
  tools UAPI: Update copy of linux/mman.h from the kernel sources
  tools/testing/selftests: add sys_mremap() helper to vm_util.h
  tools/testing/selftests: add mremap() cases that merge normally
  tools/testing/selftests: add MREMAP_RELOCATE_ANON merge test cases
  tools/testing/selftests: expand mremap() tests for
    MREMAP_RELOCATE_ANON
  tools/testing/selftests: have CoW self test use MREMAP_RELOCATE_ANON
  tools/testing/selftests: test relocate anon in split huge page test

 include/uapi/linux/mman.h                     |    8 +-
 mm/internal.h                                 |    1 +
 mm/mremap.c                                   |  726 ++++++++-
 mm/vma.c                                      |   78 +-
 mm/vma.h                                      |   28 +-
 tools/include/uapi/linux/mman.h               |    8 +-
 tools/testing/selftests/mm/cow.c              |   23 +-
 tools/testing/selftests/mm/merge.c            | 1329 ++++++++++++++++-
 tools/testing/selftests/mm/mremap_test.c      |  262 ++--
 .../selftests/mm/split_huge_page_test.c       |   25 +-
 tools/testing/selftests/mm/vm_util.c          |    8 +
 tools/testing/selftests/mm/vm_util.h          |    3 +
 tools/testing/vma/vma.c                       |    5 +-
 tools/testing/vma/vma_internal.h              |   33 +
 14 files changed, 2363 insertions(+), 174 deletions(-)

--
2.49.0

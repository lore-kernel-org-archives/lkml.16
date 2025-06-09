Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DE6259CBC
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475719; cv=fail; b=uDm5bPqDm6akgmNMkxeMX1Nmw0quB2oUkWYDXKllNxA9fa7BU7nVlw1NxCux2JikP/6S4g3AoddfZA414XRoFIq+qIsmMXNaGmpKd4sZjp1Jy5ZqfzQw7PXFok9Q6J+CsEgbuIRz5qsFJNTNErSiupDZyHWH49ZWoiZD/e0bJb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475719; c=relaxed/simple;
	bh=6ZK+ii4SH5BbhcK2GQKYsAwZUd7kLoFMiexg4xqledY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jK65A6aN9vkJPISR8etUgGpHm505diSB/ZA69/usIswdqH2Rtc370HeTIQgRy/DaErUa62fnD25hBtXJ0oMzlOxqwAuANzrSqoePrmIzWRrTwKaxJCUsensXx5K3ptKxFq6IOtLTOogLC5JP0pxpmFoqsa5uSM6hL2LIlLfrogw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AovSZw1h; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZyaHIAt4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AovSZw1h";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZyaHIAt4"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593fkpL008071;
	Mon, 9 Jun 2025 13:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=7sUlLyIc7FZE1ZLKD0qdhYftFDjBwrHbarYVUSzd1cM=; b=
	AovSZw1htGP0gxUdVMflPu1k2SoI44VuvfCHuSI7lNuxl+zVC+sv7hjadpwa8Nzn
	t4MP1k+dDyG3CwqZiPho1IIi9DaF1t+MJjscwmTHJPI7pV29mRK/hSGZedd0H+uy
	4wOZq70wH6INZKxIDWxzi67Uaq34si5rxqmm+r10LLH6JW/T9rgjIhyBRPMPJD3J
	HgzK/814T3Q7sRMgO3HxJO01I6tAb5BN+4rGSeUgg0sIbtdEf2k/UdxaMSmiQOCu
	t0DDdMRYglXRYzUlUvVChe8ni8k1QKIDNfovh0dxm+N3rlbVbLJmSQL8pD90sgJ5
	r+u0WhMjPUM3lE6bkjyabw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14a4jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559BJEKt021452;
	Mon, 9 Jun 2025 13:27:08 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010050.outbound.protection.outlook.com [52.101.85.50])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv85swq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjaJoiwTLPf6Iz+I0bJMKs2IGP+J3SCdywPipqNFq8ncrEUrYLcRXhhi+zRC66+O6RwkbODMPoUrbwEVljwAdWysexIODgu0WeBqfa+KCjj9LWvQafKanZv7KDyDyORuJ8kRjakxPDOFp2Y8efaPKg1O+pl1Gli1kHP66AdIf5uqXl2SjKSYGdC+1h4w3Fl9r2/MKDDtJNSGriZqI7dT6VEAh/7AS1yOwwed5sQvyrES+8aYFv4TpT56YeM+nqunaa23M4iD0k5EyEgMjUN454RsAHoAxKKzHy6z19jPS63QU+D2UFxBA9DaPsU+ABdDxfAdwNKaokFI65SqBUkZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sUlLyIc7FZE1ZLKD0qdhYftFDjBwrHbarYVUSzd1cM=;
 b=Swv2D859HrJO6apIpkHd/1FLCgEYCoxLlcl0spBloX4SecV0QVzcivYVNDO5aBl7z25mlFbXwXMFs99b0NV2gzUEDHQmlGnsc0374qqRs6WwXP7ARu472V6fVqrJTH4eCxQELDHG5HbMUKNlQC5Z7JRB8dDCo9l7G7BqAB6/X6fZgYe3OdTL0AAg7kf3rbSYHdFu8KKbx6H2HJI6x3ifATCrslTtcjbHpUFAttwkZ8cpxrdsq3G/ySpdPpd5nvLRfKhyGxHn4K/Bk3zstBokasrKr+C+19lVO6LGunOBrdVhJBTKSFGqzslVB3S9YYFMTL4dj+gD2R3mHeY2xsxKKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sUlLyIc7FZE1ZLKD0qdhYftFDjBwrHbarYVUSzd1cM=;
 b=ZyaHIAt4BAeIvey1KSu0+V7DLCq+IcOp5f1K+zmBfpxiSmY3vsCqtLA7VFk4lev+lqpLZpbmcrFGnYJ5L41ClbF4wVh58x5UDS9rY9lzxHQJypCeqoulvt2ugJNTiuVzDgUUXKVef2Tg8JVFqTSSFXY6FINv94/sptN4fwerhq8=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by PH7PR10MB7849.namprd10.prod.outlook.com (2603:10b6:510:308::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 13:27:05 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 13:27:04 +0000
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
Subject: [PATCH 03/11] mm/mremap: add MREMAP[_MUST]_RELOCATE_ANON support for large folios
Date: Mon,  9 Jun 2025 14:26:37 +0100
Message-ID: <43175a21c9e93bc4eb51d73190226411e6b9a7b8.1749473726.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0525.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::8) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|PH7PR10MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee64387-cad4-4cd1-8742-08dda759534d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9G8327Rot/2vNgjojv4Vb3Fyqv/wpTTuzcvKXtRH95d1/JfG0l0E9EfYrdt8?=
 =?us-ascii?Q?yxviReCBkx8p1Y5qdFmQIBuvtV1VlcLOV6H7IeTkAX7vNnV2BPs2due0lKfs?=
 =?us-ascii?Q?rpebk+CXg0N1aJKk4j+Azh1dP8Fyk+nSGuTzcl3jLtbd7kKi1SgI0QSLvFEY?=
 =?us-ascii?Q?k5ED9u2CymIWUHLxwUYctO7fV8K6145ma9qfqHCM2BNuSGK2dE2XzKzeHjqX?=
 =?us-ascii?Q?RO/gcL5I99OF9nwNupL7U7px2WSQGMoSF0m0C8bhLJFS0q2x+GwluBp9dKv+?=
 =?us-ascii?Q?Fz+veLjxadtMbiTOfMkrY+cL2fSwKICIsp5+O751Zx2cVJZOG06jN3/2AiW9?=
 =?us-ascii?Q?3DtUwNVUNpP8jYwS0WXULIKEm1+JF0WwH1D/0DszKkYfHdiB5uzjbStaL4Fv?=
 =?us-ascii?Q?NmT1UhMRLpaELhQt2PBpgMn50s6ZtA2wTPYfJ0ChrE8EKdLOxgIILxRb37Zg?=
 =?us-ascii?Q?3BNILSYSHaD/NxlKfOWqopnzC6uMQglcyd5ECl9+rSzrGH6wFECGfq9+fwey?=
 =?us-ascii?Q?+67n0uowiqIvSEFGfXaTe+nWhthYQDvMb2ObFldrbfEuPxv6QVtTG3San7Bm?=
 =?us-ascii?Q?qUNUHv6LuHs0zVR+2lC9609ROrTJ/aGT5u3RvbwfJXOMGpioCfPGWhJ21W1v?=
 =?us-ascii?Q?eb1cQZUX+bzWnY/Gwz7nLQEVuVZ416LO34cbxr56HdU0tsbd3ZaeBXvF8U6Y?=
 =?us-ascii?Q?VnoDu7AlyIrmHW+VDF/VS68AG1R05K+ceXpqMKV1HhmDUzxI4MLl8iqDs+I0?=
 =?us-ascii?Q?S8/4NcATBNBKYww5//DfCFFA/Ex+yM/ajO4tanPwyozbHA7QIFKRvyMCp4HV?=
 =?us-ascii?Q?enBS7cQvQobxrXcGfB0Vftju077MMDhLJMcxfU/at9V5nqXDhqVeaIXdCVLv?=
 =?us-ascii?Q?Y6vyC9tDqLxmiDJMddrp/mLop2ZrsoYx1Ir9B7LrEBOhRs+m2RQRHXPj1IPy?=
 =?us-ascii?Q?HFzjK9odNZyxu2wMd06N/Ov3UHKDjcJ/CG853BEgKHu5j1K+qR1zuSkj5xkq?=
 =?us-ascii?Q?HgH6DHYLDemfNfJQus6dNGQKxMRm4EBruk0i9j/ayxfq7uw48zEHL/wF9jDn?=
 =?us-ascii?Q?m6dRKfajjrkM1vtGIeF0npLMdob07te1WjJWc+VL4swTil+WbjrnTx4LWqcQ?=
 =?us-ascii?Q?UB+8g/FedJSC0GcV738cuKG8hK0TkAvJLmhgv7x2KWTy9DAMB9388oFQHbBe?=
 =?us-ascii?Q?t+KY1HDeB9rbFKlt4vdr7J8maqUD7Xa6e3SD8j+V1gCtyKiq+2t8RFUxPWEc?=
 =?us-ascii?Q?HVwjrbiECAikjFG7Yy4Nwr28OTWp9WQkltBdMl+m2iRbTempX95bYVxrfGur?=
 =?us-ascii?Q?TlU5KzQdJfiIcqneRl3yr7Y7ITcddrKlchMryflk9yXP3gXcu5pTpZ/V6PdS?=
 =?us-ascii?Q?TJWecn/v3KxZwd9DNmdHYewL3qlD1yA9OL0aRJFWaGc34m+x9d41J+aSqOZw?=
 =?us-ascii?Q?g0QIrK5fgBU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F1ZQ9kYIxvhLcR93kLyggOBT468PEin0gPuftZg1jJwsZ2XMa/gH7bhwOCPB?=
 =?us-ascii?Q?EUFDf9zvptx+4BWUzWaHYPKz4VfjZtkntUd8JDLtA5gHvOpVHPhWsHHp1lmx?=
 =?us-ascii?Q?v37W3ArId0VXKIji1L0TgvRBIddpDE/86lIDDdnT/y7kgcKTlInhJDJTKtXy?=
 =?us-ascii?Q?El5Kq0UrtbYo07kaXnU1DJ3eb3hey+OGF2pRzm1ehdV2XpYlzmkRj1pBdkW2?=
 =?us-ascii?Q?lbH5SOvt4pr6NLRe+DgaaNtXqPvYIDNA6wMcr4FHf/mbgkkokwP6eIJ3MSAi?=
 =?us-ascii?Q?LcyaFTKRsSTObRh1lJVr3vV1M1Ia7UIe8fE10D3aUABh7dz/sWxoaGpq/0wt?=
 =?us-ascii?Q?ZfGGmU3hLoSkbtDo4VO58gjUfnHD3xmFfC5KLO/kdkhEgl3UJPRAMLoIQ+vU?=
 =?us-ascii?Q?x/fWD+QsqK/Kn/Ttq95XYi4EP/1/pvdtHnNaCEUfV4HnNeM9ycBlpB0peQ8O?=
 =?us-ascii?Q?UmlvW+i/dNwjQCBND0dG4je0md4QjluRO/00h54gqfW+/oVIvbEARZuR46hH?=
 =?us-ascii?Q?Yy+Mv8y2aP07pK+uSYx2JEbcwk1W53PEq9qlQojlOjovykIwyl8IOa+atR/B?=
 =?us-ascii?Q?E/ieB2QVsZKdw/If/jT+mYdjbI9bZueLnILmrTuoZLtrDwxEbFWuL5KIVO2Q?=
 =?us-ascii?Q?mCxyj1C8qE/GgjzpR8Kr1kWxiU5lAUhw34coOAtVU5kB/Hq+Iswh9GL0I5wc?=
 =?us-ascii?Q?alJMk/5L5NahG7ZkxIOcaztuEUwPbR9kq2IXgrW2ufJJ3mtQyGwRtPVzHOBi?=
 =?us-ascii?Q?o0L1fRyS9HNLAP7wKAIY/6CAFGcXkgbKvGIO2EzxvnX1qrLteEralCGKvHLW?=
 =?us-ascii?Q?hSNMaD6BsX+IOq67lmxlKE7z6Te1fITkF7phWZHt/uIYKzVBozqBPkhcN6ep?=
 =?us-ascii?Q?idzSqBPM7W1dVTjspgC730imDJipxPy+PGcqv3qWbM4vk3SGIOsOFJRrKwdQ?=
 =?us-ascii?Q?jZdcVULMPdXdP0MK8v+T7y+KD0aggPtUqDIRg3MYQeXnGMgJiKssJ0UKtoKe?=
 =?us-ascii?Q?bLjcULXIefd4g242Zih1NgVDdXbaMXvho/fX5J57K/DTaWC7efAYssqEqNi9?=
 =?us-ascii?Q?y1/oGSjB95JEnYP/dP5LqxU+Yq0eExpo7lmjqWZ23j9jZ7I0Ig0Nphz53Diu?=
 =?us-ascii?Q?sWg+a9qXhDBFFTDuRXYUHDuxO3mLuzXlNsN6mSkzScG6ykxknFs2QDgxeecK?=
 =?us-ascii?Q?XY3QuB2RRZv1/MRHxOqBuLJOd5L5kkRUIQwSH5sgEhwGq7+l38uyPmr/8qqd?=
 =?us-ascii?Q?B8KTEB6MzpyTQoHJiDuaV/pP8GmhM0o0LyzC42OSQc2dCuAsxmb9G444iw4W?=
 =?us-ascii?Q?AfIKmKVORvNxYmrEh+j7P+lCywxo8iTtxeBNefIpsEXYPJdwRhuxNbjssGjh?=
 =?us-ascii?Q?5oJ7InK+D+1YNzQuHQcm8eY5btEbQlFgaaHEx2YCjSnhLa7u2X0RBK5JNdWU?=
 =?us-ascii?Q?7PdYWYsOC5rHickQgAcVnkuWosv7M8IQCINz18fP7odDjgiqPQaegQ+6cjiY?=
 =?us-ascii?Q?9/nsaOnxjGFrXuCXNehXGXEwmCxyXv/mddcwXSus6DHvLSNIMLUXBEdovVok?=
 =?us-ascii?Q?78w6YBhTUL/EpSNlSLOD6Wc4mYwPCHdRiwwmONKkRh8vQCP8QUeWaf4YXAuT?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KKPnlG6j51VZCm6HJjdcyjqkKGDqReqLH8kjb0BbhTSPyZ9p0SFEpVMw7x6TddgSYKu54pqfuqgUC+DxYyxdPPoH/+MGH8M9zkxRCLC5dwHVk6BUGYT546i/+IulLuUWLuT0yp5awtTaOANPYyS0U1LQEuycgrhAovgFhx+2amzJ/LkoVE5uvVnQi2q5Psjy66FWDnO7JICNbFYXaKGSxUzlmILP9ympiuWNPFXJQTZ1Ncc2uDZLUoo4dFAusgPDk5JtVTw/yZuqp+Sslizv4+uxU+OTUw4kNz91xo25RT9DLfNsssj6WuTZp3Bh0SRiIU7CfvBizWWoejwlnG7HIimoPPuwPvJuFRRs/Rb7wXpprFvLjhOynPbJcR8EBOtxk5bztIjD/fS8xC/fz3hiLwarF8Z2eLfkyayPrqFJFQLA5Vyg8qISYO3nuF8UvkmTEyQsSSiah69+7B2dBH43Q7IB/9xS9o4BUbxPnl1BzH+sLZeSfc0DEuSmVH7iHdMVwpmYPmkZt0aAX/qZO0sqHDLBnkBjbnQ+gKGL4+1fP5m7vZ/dBRouh/8sOSssTEugESOQqwe9IBGF5wOtN23w6Qy/tMZYbPP9a4wS6zUS9D4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee64387-cad4-4cd1-8742-08dda759534d
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 13:27:04.9309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qlfw05XfPwDsIomyFE2SAbjwa6tQYd+v4p+CXWDHW3ReRznDVRrJdgmkF3Q3LnuGsQGSaE21cieIE8YDGM94/kRaOvLfHEH0xfc2sR+gn0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7849
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090098
X-Proofpoint-GUID: XYLdOU3v4JKmbATnf6FpVYtHOsv2DEhz
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=6846e12d b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=OzY_kpnUWJltT3yWpIcA:9 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5OCBTYWx0ZWRfX8YE/c4rqTWKa 0UMYk/d7c1ekktdmpv1hnRTS8sozCFZBWaMhKNuv4B2XZ64ZWoyOn/XqEzkJjzF3WLFowFOUTjp xq6+fVbR2MZ6O2DgOVhAnKR1aLa+/f3tngjHuiM8fo3ROZLMeCn8Ahb468E4TzC80GkQLhSUUFN
 wGLosehNkONU6/3EWrjxLHf+JP4WEuMYVb/7jeQQ4IO9xxBkpNMhC77QWrpk3T3yyp2h38USJPw jIv7DOt3rpmiHxMtfxOaig3jx9Xivvj88S3wrkdgnGoToaTIkF+OGcUO/UtkbKwmAAwgdzvLRWP cqpGdv3voeRzG9LI7p9FG15mXbR/B7sOvvkuvQZjSNhpapsBgYIdLzPI73zAcYumZao1ycu+rtt
 0IDlWPkl7YZ7pGlO4xno6zcuh+qiyVB8dZo+HWTf2vDM1vFoxBya965VKa1EDfiGn+vYpSAt
X-Proofpoint-ORIG-GUID: XYLdOU3v4JKmbATnf6FpVYtHOsv2DEhz

Larger folios are a challenge, as they might be mapped across multiple
VMAs, and can be mapped at a higher page table level (PUD, PMD) or also at
PTE level.

Handle them correctly by checking whether they are fully spanned by the VMA
we are examining. If so, then we can simply relocate the folio as we would
any other.

If not, then we must split the folio. If there is a higher level page table
level mapping the large folio directly then we must also split this.

This will be the minority of cases, and if the operation is performed on a
large, mapping will only be those folios at the start and end of the
mapping which the mapping is not aligned to.

The net result is that we are able to handle large folios mapped in any
form which might be encountered correctly.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/mremap.c | 327 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 297 insertions(+), 30 deletions(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 41158aea8c29..d901438ae415 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -77,6 +77,7 @@ struct pte_state {
 	unsigned long new_addr;
 	unsigned long old_end;
 	pte_t *ptep;
+	pmd_t *pmdp;
 	spinlock_t *ptl;
 };
 
@@ -534,40 +535,67 @@ enum pgt_entry {
 	HPAGE_PUD,
 };
 
-/*
- * Returns an extent of the corresponding size for the pgt_entry specified if
- * valid. Else returns a smaller extent bounded by the end of the source and
- * destination pgt_entry.
- */
-static __always_inline unsigned long get_extent(enum pgt_entry entry,
-						struct pagetable_move_control *pmc)
+static void __get_mask_size(enum pgt_entry entry,
+		unsigned long *mask, unsigned long *size)
 {
-	unsigned long next, extent, mask, size;
-	unsigned long old_addr = pmc->old_addr;
-	unsigned long old_end = pmc->old_end;
-	unsigned long new_addr = pmc->new_addr;
-
 	switch (entry) {
 	case HPAGE_PMD:
 	case NORMAL_PMD:
-		mask = PMD_MASK;
-		size = PMD_SIZE;
+		*mask = PMD_MASK;
+		*size = PMD_SIZE;
 		break;
 	case HPAGE_PUD:
 	case NORMAL_PUD:
-		mask = PUD_MASK;
-		size = PUD_SIZE;
+		*mask = PUD_MASK;
+		*size = PUD_SIZE;
 		break;
 	default:
 		BUILD_BUG();
 		break;
 	}
+}
+
+/* Same as get extent, only ignores new address.  */
+static unsigned long __get_old_extent(struct pagetable_move_control *pmc,
+		unsigned long mask, unsigned long size)
+{
+	unsigned long next, extent;
+	unsigned long old_addr = pmc->old_addr;
+	unsigned long old_end = pmc->old_end;
 
 	next = (old_addr + size) & mask;
 	/* even if next overflowed, extent below will be ok */
 	extent = next - old_addr;
 	if (extent > old_end - old_addr)
 		extent = old_end - old_addr;
+
+	return extent;
+}
+
+static unsigned long get_old_extent(enum pgt_entry entry,
+		struct pagetable_move_control *pmc)
+{
+	unsigned long mask, size;
+
+	__get_mask_size(entry, &mask, &size);
+	return __get_old_extent(pmc, mask, size);
+}
+
+/*
+ * Returns an extent of the corresponding size for the pgt_entry specified if
+ * valid. Else returns a smaller extent bounded by the end of the source and
+ * destination pgt_entry.
+ */
+static __always_inline unsigned long get_extent(enum pgt_entry entry,
+						struct pagetable_move_control *pmc)
+{
+	unsigned long next, extent, mask, size;
+	unsigned long new_addr = pmc->new_addr;
+
+	__get_mask_size(entry, &mask, &size);
+
+	extent = __get_old_extent(pmc, mask, size);
+
 	next = (new_addr + size) & mask;
 	if (extent > next - new_addr)
 		extent = next - new_addr;
@@ -797,6 +825,165 @@ static unsigned long pmc_progress(struct pagetable_move_control *pmc)
 	return old_addr < orig_old_addr ? 0 : old_addr - orig_old_addr;
 }
 
+/* Assumes folio lock is held. */
+static bool __relocate_large_folio(struct pagetable_move_control *pmc,
+		unsigned long old_addr, unsigned long new_addr,
+		struct folio *folio, bool undo)
+{
+	pgoff_t new_index;
+	struct vm_area_struct *old = pmc->old;
+	struct vm_area_struct *new = pmc->new;
+
+	VM_WARN_ON_ONCE(!folio_test_locked(folio));
+
+	/* no-op. */
+	if (!folio_test_anon(folio))
+		return true;
+
+	if (!undo)
+		new_index = linear_page_index(new, new_addr);
+	else
+		new_index = linear_page_index(old, old_addr);
+
+	/* See comment in relocate_anon_pte(). */
+	folio_move_anon_rmap(folio, undo ? old : new);
+	WRITE_ONCE(folio->index, new_index);
+	return true;
+}
+
+static bool relocate_large_folio(struct pagetable_move_control *pmc,
+		unsigned long old_addr, unsigned long new_addr,
+		struct folio *folio, bool undo)
+{
+	bool ret;
+
+	folio_lock(folio);
+
+	if (!folio_test_large(folio) || folio_test_ksm(folio)) {
+		ret = false;
+		goto out;
+	}
+
+	/* See relocate_anon_pte() for description. */
+	if (WARN_ON_ONCE(folio_maybe_mapped_shared(folio))) {
+		ret = false;
+		goto out;
+	}
+	if (folio_maybe_dma_pinned(folio)) {
+		ret = false;
+		goto out;
+	}
+
+	ret = __relocate_large_folio(pmc, old_addr, new_addr, folio, undo);
+
+out:
+	folio_unlock(folio);
+	return ret;
+}
+
+static bool relocate_anon_pud(struct pagetable_move_control *pmc,
+		pud_t *pudp, bool undo)
+{
+	spinlock_t *ptl;
+	pud_t pud;
+	struct folio *folio;
+	struct page *page;
+	bool ret;
+	unsigned long old_addr = pmc->old_addr;
+	unsigned long new_addr = pmc->new_addr;
+
+	VM_WARN_ON(old_addr & ~HPAGE_PUD_MASK);
+	VM_WARN_ON(new_addr & ~HPAGE_PUD_MASK);
+
+	ptl = pud_trans_huge_lock(pudp, pmc->old);
+	if (!ptl)
+		return false;
+
+	pud = pudp_get(pudp);
+	if (!pud_present(pud)) {
+		ret = true;
+		goto out;
+	}
+	if (!pud_leaf(pud)) {
+		ret = false;
+		goto out;
+	}
+
+	page = pud_page(pud);
+	if (!page) {
+		ret = true;
+		goto out;
+	}
+
+	folio = page_folio(page);
+	ret = relocate_large_folio(pmc, old_addr, new_addr, folio, undo);
+
+out:
+	spin_unlock(ptl);
+	return ret;
+}
+
+static bool relocate_anon_pmd(struct pagetable_move_control *pmc,
+		pmd_t *pmdp, bool undo)
+{
+	spinlock_t *ptl;
+	pmd_t pmd;
+	struct folio *folio;
+	bool ret;
+	unsigned long old_addr = pmc->old_addr;
+	unsigned long new_addr = pmc->new_addr;
+
+	VM_WARN_ON(old_addr & ~HPAGE_PMD_MASK);
+	VM_WARN_ON(new_addr & ~HPAGE_PMD_MASK);
+
+	ptl = pmd_trans_huge_lock(pmdp, pmc->old);
+	if (!ptl)
+		return false;
+
+	pmd = pmdp_get(pmdp);
+	if (!pmd_present(pmd)) {
+		ret = true;
+		goto out;
+	}
+	if (is_huge_zero_pmd(pmd)) {
+		ret = true;
+		goto out;
+	}
+	if (!pmd_leaf(pmd)) {
+		ret = false;
+		goto out;
+	}
+
+	folio = pmd_folio(pmd);
+	if (!folio) {
+		ret = true;
+		goto out;
+	}
+
+	ret = relocate_large_folio(pmc, old_addr, new_addr, folio, undo);
+out:
+	spin_unlock(ptl);
+	return ret;
+}
+
+/*
+ * Is the THP discovered at old_addr fully spanned at both the old and new VMAs?
+ */
+static bool is_thp_fully_spanned(struct pagetable_move_control *pmc,
+				 unsigned long old_addr,
+				 size_t thp_size)
+{
+	unsigned long old_end = pmc->old_end;
+	unsigned long orig_old_addr = old_end - pmc->len_in;
+	unsigned long aligned_start = old_addr & ~(thp_size - 1);
+	unsigned long aligned_end = aligned_start + thp_size;
+
+	if (aligned_start < orig_old_addr || aligned_end > old_end)
+		return false;
+
+	return true;
+}
+
 /*
  * If the folio mapped at the specified pte entry can have its index and mapping
  * relocated, then do so.
@@ -813,10 +1000,12 @@ static unsigned long relocate_anon_pte(struct pagetable_move_control *pmc,
 	unsigned long ret = 1;
 	unsigned long old_addr = state->old_addr;
 	unsigned long new_addr = state->new_addr;
+	struct mm_struct *mm = current->mm;
 
 	old = pmc->old;
 	new = pmc->new;
 
+retry:
 	pte = ptep_get(state->ptep);
 
 	/* Ensure we have truly got an anon folio. */
@@ -853,13 +1042,55 @@ static unsigned long relocate_anon_pte(struct pagetable_move_control *pmc,
 	if (folio_maybe_dma_pinned(folio))
 		goto out;
 
-	/*
-	 * This should not happen as we explicitly disallow this, but check
-	 * anyway.
-	 */
+	/* If a split huge PMD, try to relocate all at once. */
 	if (folio_test_large(folio)) {
-		ret = 0;
-		goto out;
+		size_t size = folio_size(folio);
+
+		if (is_thp_fully_spanned(pmc, old_addr, size) &&
+		    __relocate_large_folio(pmc, old_addr, new_addr, folio, undo)) {
+			VM_WARN_ON_ONCE(old_addr & (size - 1));
+			ret = folio_nr_pages(folio);
+			goto out;
+		} else {
+			int err;
+			struct anon_vma *anon_vma = folio_anon_vma(folio);
+
+			/*
+			 * If the folio has the anon_vma whose lock we hold, we
+			 * have a problem, as split_folio() will attempt to lock
+			 * the already-locked anon_vma causing a deadlock. In
+			 * this case, bail out.
+			 */
+			if (anon_vma->root == pmc->relocate_locked->anon_vma->root) {
+				ret = 0;
+				goto out;
+			}
+
+			/* split_folio() expects elevated refcount. */
+			folio_get(folio);
+
+			/*
+			 * We must relinquish/reacquire the PTE lock over this
+			 * operation. We hold the folio lock and an increased
+			 * reference count, so there's no danger of the folio
+			 * disappearing beneath us.
+			 */
+			pte_unmap_unlock(state->ptep, state->ptl);
+			err = split_folio(folio);
+			state->ptep = pte_offset_map_lock(mm, state->pmdp,
+							  old_addr, &state->ptl);
+			folio_unlock(folio);
+			folio_put(folio);
+
+			if (err || !state->ptep)
+				return 0;
+
+			/*
+			 * If we split, we need to look up the folio again, so
+			 * simply retry the operation.
+			 */
+			goto retry;
+		}
 	}
 
 	if (!undo)
@@ -906,6 +1137,7 @@ static bool relocate_anon_ptes(struct pagetable_move_control *pmc,
 		.old_addr = pmc->old_addr,
 		.new_addr = pmc->new_addr,
 		.old_end = pmc->old_addr + extent,
+		.pmdp = pmdp,
 	};
 	pte_t *ptep_start;
 	bool ret;
@@ -955,29 +1187,64 @@ static bool __relocate_anon_folios(struct pagetable_move_control *pmc, bool undo
 		pmd_t pmd;
 		pud_t pud;
 
-		extent = get_extent(NORMAL_PUD, pmc);
+		extent = get_old_extent(NORMAL_PUD, pmc);
 
 		pudp = get_old_pud(mm, pmc->old_addr);
 		if (!pudp)
 			continue;
 		pud = pudp_get(pudp);
+		if (pud_trans_huge(pud)) {
+			unsigned long old_addr = pmc->old_addr;
+
+			if (extent != HPAGE_PUD_SIZE)
+				return false;
 
-		if (pud_trans_huge(pud) || pud_devmap(pud))
+			VM_WARN_ON_ONCE(old_addr & ~HPAGE_PUD_MASK);
+
+			/* We may relocate iff the new address is aligned. */
+			if (!(pmc->new_addr & ~HPAGE_PUD_MASK) &&
+			    is_thp_fully_spanned(pmc, old_addr, HPAGE_PUD_SIZE)) {
+				if (!relocate_anon_pud(pmc, pudp, undo))
+					return false;
+				continue;
+			}
+
+			/* Otherwise, we split so we can do this with PMDs/PTEs. */
+			split_huge_pud(pmc->old, pudp, old_addr);
+		} else if (pud_devmap(pud)) {
 			return false;
+		}
 
-		extent = get_extent(NORMAL_PMD, pmc);
+		extent = get_old_extent(NORMAL_PMD, pmc);
 		pmdp = get_old_pmd(mm, pmc->old_addr);
 		if (!pmdp)
 			continue;
 		pmd = pmdp_get(pmdp);
-
-		if (is_swap_pmd(pmd) || pmd_trans_huge(pmd) ||
-		    pmd_devmap(pmd))
-			return false;
-
 		if (pmd_none(pmd))
 			continue;
 
+		if (pmd_trans_huge(pmd)) {
+			unsigned long old_addr = pmc->old_addr;
+
+			if (extent != HPAGE_PMD_SIZE)
+				return false;
+
+			VM_WARN_ON_ONCE(old_addr & ~HPAGE_PMD_MASK);
+
+			/* We may relocate iff the new address is aligned. */
+			if (!(pmc->new_addr & ~HPAGE_PMD_MASK) &&
+			    is_thp_fully_spanned(pmc, old_addr, HPAGE_PMD_SIZE)) {
+				if (!relocate_anon_pmd(pmc, pmdp, undo))
+					return false;
+				continue;
+			}
+
+			/* Otherwise, we split so we can do this with PTEs. */
+			split_huge_pmd(pmc->old, pmdp, old_addr);
+		} else if (is_swap_pmd(pmd) || pmd_devmap(pmd)) {
+			return false;
+		}
+
 		if (!relocate_anon_ptes(pmc, extent, pmdp, undo))
 			return false;
 	}
-- 
2.49.0


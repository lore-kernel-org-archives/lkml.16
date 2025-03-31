Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6FB1ADC69
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743425791; cv=fail; b=Jm8vJccmGoeFjeFp5nh9G0sE6OvCe76lEHBUTVY7T0fzRzXNuGB2N45A3r6WaLoODvSmvczPCqKwgDfY1gCvM/yTPgpfPrG5JNeApa5vihdW0qZ7sC90TrtMmllhP3zq+EZo0kzPoK+gLx8lTo6bco7gVJ6alkUYehCBDe0TgnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743425791; c=relaxed/simple;
	bh=9zGZAtnZ0bBb2XVvxvhcf0/4hmrxeynKa3Zg7CwhX1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=D21HvJXocQJchyZSUfjBgh7lKxCOTX3FR3KofgOKSOAWnLHBZc4M2xxiaNHV6xwTk+Pvmk6NodRcko1s+UFIax4SyOAqr2/GsxTWf3vgzqqCaw9qObydUTBeAnzc7UMHgzVTIlzWebrMsyEuO0YoPe17Xc1VIzEMGpk99opCCNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VPaXh56A; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xBfn3Vtb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VPaXh56A";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xBfn3Vtb"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VBu4H7009189;
	Mon, 31 Mar 2025 12:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=1T7L5jJzA+JRmcWA
	2iuAXjcpKRuP/fumtazd9m0TjIk=; b=VPaXh56AVGvAp0WgrWRgoY9787bsuCWu
	bujHD8TzymcT769jPOl9M+hpEBGC22Fv6wkxFmk9H5D7mhLdpgBAWnILK4XGkdZ8
	5j0/NPmxYYvH1Q05Lh6N7amAI2Ycq0Op6pCxmJZef5iWNsavdAzH7eBJOFaAKQvt
	MgDJcr2jU+wKxltfMoyhHjS68FiZEo7Lcp5NnrGyPDHcxs+P9KAtYip42o2f/gZJ
	5JJYb+vdVa94F58GQCuhxpL1QVLoCipp0wTsD1wTyOd1XoYfdv1kFPv+EPbxYIwa
	WclImWCGJiATLuI+E7oZ+BFuuQ0Z9lYqfaX8R8xXjiKkop4HSURrSA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7f0b548-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 12:56:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52VCEDOx032658;
	Mon, 31 Mar 2025 12:56:18 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a7v4a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 12:56:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bob2RCQ7eWL6C5n78CWzoxsVs+d+cZcUpeGPY/kI0lRdmA3l6QrHxlHV6/YMwlvxx2/s5IpzXooZdnnNa7293Wl88yfg0vi0vRXKt8ATMNQn+WIXVgbKqExycPJemjA1tD/7k487bLeRuoGgRX/PS+KUDxl4+E0x1Sy75mB/skuyf+6gq+eriXrgIsaCr9I+GIV4Q+L9cFOJm6rVfSzWxR08yUrycAWJkfqYksdW1sb3yTgI2wXlLw/ul2R7P34fjpacCnoX1t8aDkJwPNlmC9U3Wb9J948S9KEubrtBVd9NsytIDQKq0izRHWAOfieuwZXlnUzJVPFZS9oSHBlixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1T7L5jJzA+JRmcWA2iuAXjcpKRuP/fumtazd9m0TjIk=;
 b=bnK/XfUnrSvODz1YWsPAJw8jcPo1e8boq6kYMssIXTk5muKSVWP3DnlWh8lGeAaMYPpXcbZB+K+pqpf4qz7nWLEQgWmE2inj/RkM15E600jAeziUpQl4VmCJAXA1iUjLZ75ESOeN/cB9NaQ4fbaRvDZ7idJA+1l2j8xYtN2POcI2HhVWkgFPUc8b/l9x3uSRTNLKxfYmMNM4Eg2XV3TC1Lyb5WzofVuRE+F9q18lkJEHnqqJOZFmZMYpuqAcDApCnRbRLBSRG3zR8Rv9vUkv1L3tw2PpWEqQlHJO6lYfm7oeLFijh2RgYR9CECcy1wBBHpg3J9yaREyspIvhrc606Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1T7L5jJzA+JRmcWA2iuAXjcpKRuP/fumtazd9m0TjIk=;
 b=xBfn3Vtb9ebRIyDtl8HPwfAjbU+lmDuN+15fmFdFu5YB/6kZV9DaY9UmxhMDUaPJhAjY8Ckw9nkbuMt3lipA/SF8Z1kRi5bTLpB+MFaZaZDquWkUlChdZdVjzZflQfqer8giqLif2GJXjKyrUMV58DfhGyBA4l0GZWJzJU9Oozc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4699.namprd10.prod.outlook.com (2603:10b6:806:118::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.29; Mon, 31 Mar
 2025 12:56:15 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 12:56:15 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 RESEND] intel_th: avoid using deprecated page->mapping, index fields
Date: Mon, 31 Mar 2025 13:56:08 +0100
Message-ID: <20250331125608.60300-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0617.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4699:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e713bcd-970b-452f-5c00-08dd70536c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RW9UF8psAYJuqTjc/62qt0LAjD5MNOZEgv1kLvu2vASyMXmkMYa6/LYRzoX8?=
 =?us-ascii?Q?CKr5gJmYxkYi1fe2ZNLeyVau4+FLX+gejNRRMxkO0vQOMZnJD0N9eFZ/XwY3?=
 =?us-ascii?Q?KMGYGC+ysAqKfv8S0GFCt3tCGy28Bs0h4+p3r6zC/i4hN5UABspCU7oDnpWg?=
 =?us-ascii?Q?oSsn23tCk/WRwWAH9lFKwx9z3x4Zuy9wCZGsmNdPo65rZgUoRI6tzOlerIwY?=
 =?us-ascii?Q?yr9aRGgDBKWQCGyG/amr0c3wns0BswxCE58EHJipfaq7CVKWAmYcRO+cplNM?=
 =?us-ascii?Q?rTRPJhvslXA7NISk+/96R4OB+v0XqSk/+NIzr7LLLuHgo2qcF57yZKksU4J9?=
 =?us-ascii?Q?e820tGIV6ugKYiwB8sRRO3RrwFdI2C2DbBAOCqcZaKtzHtLGWdDBhQDGbnwy?=
 =?us-ascii?Q?HVsaPaBBYI7zr+ymA8f4vnJNWJMUTLmTsDaNhqYogzCaVpP/EkZbICj7N5Fe?=
 =?us-ascii?Q?Uzdkx88jzYVFLIvPQ2LfQ12FyKJOIo5uXikyD2s2CseUEgNajR6C7G+k1jfp?=
 =?us-ascii?Q?ErxH6iZRHugulWbqB77eJeyf3eO4pT8oTOkyJeg427IiWXXMngecuQZ9d4hI?=
 =?us-ascii?Q?EXIohyJoWYGiuSFVqhhUKcJQX9QFghqItyQ1okEFz3DFkTTx3BAcsfl1jiPR?=
 =?us-ascii?Q?WJV59g5hG8+JdSuTkiyTNtycYsSvICzwWeDkxm4/VnMabd8zz+5KtCGyl26N?=
 =?us-ascii?Q?JJDodIJxS4hWJeZrFW/u14TzMgOY34Wo/yjb5iqVd2FidIlBzC3TrLjPPd3Z?=
 =?us-ascii?Q?OWbpgGd8NkE0y0qD0RHIHW8ktdDn/nWr+vOVU67M7l5uzBLQyk/1m9vD3oex?=
 =?us-ascii?Q?zf27oiP29AOp/ud2MTSVCBGB6WRZAWdahvAj/sb5iIto/dZm7F3iwHi82bax?=
 =?us-ascii?Q?lanu4c74nWn/1aDQ5A+VrJI66ApsOvMzYUegIn7yBG3vEjDVteClvqZf+Vup?=
 =?us-ascii?Q?BvH0olRx8O1cFr9VSmtg4hg/CL6Awyd9VzAymU33Jxk56BjDPeOtAsExnSFx?=
 =?us-ascii?Q?ws+G/XkIvWsIUt8seKCC1rWKFNzcSTPO51IiPPhmXH3na1SemPIICoO0PyNN?=
 =?us-ascii?Q?DJgrkjI+WzyU1Agg70J75kRD/lYcy9N+bzh1yTtzVE9hcS51Wt7goxBA8YUf?=
 =?us-ascii?Q?notfHhyMXpfYZ+39h4/54kLrACPX+mMKWVX81IXXWQaLJmf9FH6+m62bSuzH?=
 =?us-ascii?Q?Fmt1oXFnVqHxeWekwFvSmpVUINP0UGT5tqPV7GvtNBSmFW0gC3vymlapYB4q?=
 =?us-ascii?Q?zR6QT0xYCPqZHGserkHpi4NqOe9xvPSuzktsJXixQZm6f8X9oL7V4vybLDF0?=
 =?us-ascii?Q?uus9UPJnvrONfvl0oNSNJFuRPNSJSTu8p2OPRBbyinjl068CnzfEaXtqakmw?=
 =?us-ascii?Q?3MlsJQGKbU5RwKxeG13M7wwv8NSNp6rwCduejgnf35wrvrMxRw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q6Q3rfNfBMqXROIT4qEco6LAUOOJdv37YO71XYECBBL5LnpJZN18LEzdCXve?=
 =?us-ascii?Q?TUpeak0rCsDAwRwZXYhCBVm/HSUZ4po2M7cPkGhA7LAmrw99pqWhG6XT8LlK?=
 =?us-ascii?Q?gFOJEQeAQ/PySB5LC8KZ9vtXOCxlxyQZwSJRunbG0VZS9ARPdR0UJb1GYJKU?=
 =?us-ascii?Q?9Q2uq7jRMISwgw5rvobYoG19DDr5IMeZsuxapxpugVWbjW+3NZ3ESHH8ncMD?=
 =?us-ascii?Q?S6jQdstkmYz+RQWoVjKtbc2TB0/L1ZMP5mvOGyjvFbse5tYL0UO0F7Pis701?=
 =?us-ascii?Q?LfGvwHHIaLeo41hy+48YTmbzla1jOy2TBSxEhufjBTtLPn3NUbW67M5xwr6f?=
 =?us-ascii?Q?Tet0mJU7ztrvkQmXtmpGklPsB2XV70X112yAHPECxzL4lhSiDbwYOkeoyw4I?=
 =?us-ascii?Q?C+AVM+DoeFacDbd+/LQs+lkqN21uny/5Z81nhiuDBE4SxbJK8IAgIL6ShHYv?=
 =?us-ascii?Q?o++1ON1oXPJv2jBcsyZeAayl5HYB7MCL02Ad2Ia5uMrMBU4GBBn1lg5b8TCu?=
 =?us-ascii?Q?BIXc2pilSoNqyMMycv2YceqwnK175/wujFNI/GvgbmNsDPH1zvTuFkcPRfRW?=
 =?us-ascii?Q?jRCWqMJroFLnEt5/TPRlElHgnAPo+6MAixuDdGPVdWnpkw9xuWxhvAP7NOzT?=
 =?us-ascii?Q?Yp1JPUV98M+uFy9AgU153jbf9WWGdrXBqiPgHsfdmwfJXWTB4E19NzivNurO?=
 =?us-ascii?Q?mosBteSt3YSqAeaue13dNyojo3QeGpARRV7agb7W50CT+QqWlK+hmiJvcaLj?=
 =?us-ascii?Q?vp1Uyyp1vTrVo5qNRtRmJFEo6vUAECn17UkSqM67wEwWQ7+NM/9W8HZW6HKW?=
 =?us-ascii?Q?gjn2LOkcqM4B3Q/vEPZs08sMCKlXQOi5BR2yhSIe/WztLOW/Gm2FiKHzHXPu?=
 =?us-ascii?Q?Jsl7ayvqxNkT5Zb89lPck5xaKl/S4mD5Z7UJ8f0DJnp40anxBAM7pkTKcuIB?=
 =?us-ascii?Q?yNUmzzVii8EJPYLH+0UWjv0k8hA4Gv7YReCdMsQRVFGJvMNyMhcitz3IN31w?=
 =?us-ascii?Q?M0Onox6vpHOs9Ia543BM9s9QTwUkrLEDL3haYSxR+dpELqb2Zty4fJPMnS0h?=
 =?us-ascii?Q?UGgcDe05tUvhzzsKNisr6N11nZfJ/cSLXAt4OzoI1hb8VEQxjdRrzaCEmb93?=
 =?us-ascii?Q?NKnlbcVoj+vEDRkCX+C4lRZtaqXX2tl/m0SjlteWPJhhbLGwoTCkjOqXD4Xz?=
 =?us-ascii?Q?8qhu8PQ2kXrB18CQroPKDpktOzeCGUZxeSfbubs9bV12bszdye3u4ssuUrHr?=
 =?us-ascii?Q?RdiHfjiaT2b7mfNpBX03NZiUXJEBWy3VtfIEmcVhcHgJGqHyGnVo0fZ5TZu1?=
 =?us-ascii?Q?57Bug1TMib/xJGqMTtA6MA3nMuUSa4E+QV3avSDJ78pWhdZQ04oueRQEogzl?=
 =?us-ascii?Q?UlntK9ypDtSHlC70txWrXkfVLZK7m3VdbnvqhLVd921CbBCWDD6wJiRmZI+c?=
 =?us-ascii?Q?+KI1Ev0LuIRJ2wzfxn1E0rEC11zblRSrAzprjOoBlzLm+k58BsZhnojLpni6?=
 =?us-ascii?Q?b+EQi3HDtCKPRWm4bz+EVehddqk88g0AOB3bnqhi9DC7Kazv5iRddl0EpxoI?=
 =?us-ascii?Q?hGWDsSdmOWU+o4fZ4Zy5DP8eacekP3jB2UurbVrZDFzyHJDq5UZyauCYA+cI?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AQbYuBy/FgWf0eZb9MIJaxZQe/hyFgw6IZCLS5iwz/PPi86PF1gpFVHIB/KmvRY+mMHUDgO31kUIRNuD/whRFt6gFScgstAJJlQO+nCWip3RJJKqlbba3/1YnmEgW6o/1Qf9JXsBYbvocBizYeByoEoHdsp61LNju4X9vehggYTbQzstMb/CHbKfit3uiyR9vkXdofG+0mxl79VFND7gKEi/vJBmLx9WWPKnMUHHTMH0gQzU26pm3O3AS/HrIaBMZVTzf+bhdWzmMNt9KXokp8ojFQvoIYzWv/ZFf7slfdBz1Hctt71mafPlaz+dXRmx0Mp9vvpu1kJBjEZjwQET1u5us1jFE75DHPo7KTB9B2EVJBrqRqwaLx/+Yk6/Hgau01t9tBSjcvTpjyGCCf+ovmmqIsj6q9o+/fH76rrmKtMj+Z0vQrpBDN2FqyFxhCHDe5v+w6eAs6aYIAMhLg97egfYMYcna3yJRVboRkYKITa8XJhxRXEKtzAWg1PR7JApVtnIKiYgtPzfWd5S2jMwNb8D32jTCtTaShcf+fEAqEzoCFjt1uUsjElVNWl4p7xUuIEQIv2H/8uF4IUBgkhyWR8/eXD8+NpoV08BTT9oUeQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e713bcd-970b-452f-5c00-08dd70536c18
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 12:56:15.5818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCHZlk7ioFXpB7khV7d6vUaDc2KcZ/7mMB4JAsiBry/tSNJ7+Z4WHFE8R7g8Kg2g4AsXY/wKONBg5GRUcV5vYXci0Wax1fYIJju4CcbiCuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4699
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503310092
X-Proofpoint-ORIG-GUID: ZElvU9lhFcVy68b-Tm1mtR0jKE8sqjPk
X-Proofpoint-GUID: ZElvU9lhFcVy68b-Tm1mtR0jKE8sqjPk

The struct page->mapping, index fields are deprecated and soon to be only
available as part of a folio.

It is likely the intel_th code which sets page->mapping, index is was
implemented out of concern that some aspect of the page fault logic may
encounter unexpected problems should they not.

However, the appropriate interface for inserting kernel-allocated memory is
vm_insert_page() in a VM_MIXEDMAP. By using the helper function
vmf_insert_mixed() we can do this with minimal churn in the existing fault
handler.

By doing so, we bypass the remainder of the faulting logic. The pages are
still pinned so there is no possibility of anything unexpected being done
with the pages once established.

It would also be reasonable to pre-map everything on fault, however to
minimise churn we retain the fault handler.

We also eliminate all code which clears page->mapping on teardown as this
has now become unnecessary.

The MSU code relies on faulting to function correctly, so is by definition
dependent on CONFIG_MMU. We avoid spurious reports about compilation
failure for unsupported platforms by making this requirement explicit in
Kconfig as part of this change too.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
---

Resending, as not taken for 6.15 merge window as promised. Sending direct
to Greg for expediency.

I rebased on tip Linus's tree and applies fine.

Greg, as we're late in merge window obviously now, could you roll up into
6.15-rc1? Thanks!

This does not require backporting, as this is a critical change for mm
moving forward, as page->index,mapping are deprecated and will be entirely
removed extremely soon.

Adding Acked-by based on [0] where Alexander explicitly stated he was fine with
providing this - Alex - if this is a problem, please indicate so.

[0]: https://lore.kernel.org/all/87v7tyyrvb.fsf@ubik.fi.intel.com/

v2:
* Make the MSU driver dependent on CONFIG_MMU to avoid spurious compilation
  failure reports.
https://lore.kernel.org/all/20241203080001.12341-1-lorenzo.stoakes@oracle.com/

v1:
https://lore.kernel.org/all/20241202122127.51313-1-lorenzo.stoakes@oracle.com/

 drivers/hwtracing/intel_th/Kconfig |  1 +
 drivers/hwtracing/intel_th/msu.c   | 31 +++++++-----------------------
 2 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/hwtracing/intel_th/Kconfig b/drivers/hwtracing/intel_th/Kconfig
index 4b6359326ede..4f7d2b6d79e2 100644
--- a/drivers/hwtracing/intel_th/Kconfig
+++ b/drivers/hwtracing/intel_th/Kconfig
@@ -60,6 +60,7 @@ config INTEL_TH_STH

 config INTEL_TH_MSU
 	tristate "Intel(R) Trace Hub Memory Storage Unit"
+	depends on MMU
 	help
 	  Memory Storage Unit (MSU) trace output device enables
 	  storing STP traces to system memory. It supports single
diff --git a/drivers/hwtracing/intel_th/msu.c b/drivers/hwtracing/intel_th/msu.c
index bf99d79a4192..7163950eb371 100644
--- a/drivers/hwtracing/intel_th/msu.c
+++ b/drivers/hwtracing/intel_th/msu.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 #include <linux/workqueue.h>
 #include <linux/dma-mapping.h>
+#include <linux/pfn_t.h>

 #ifdef CONFIG_X86
 #include <asm/set_memory.h>
@@ -976,7 +977,6 @@ static void msc_buffer_contig_free(struct msc *msc)
 	for (off = 0; off < msc->nr_pages << PAGE_SHIFT; off += PAGE_SIZE) {
 		struct page *page = virt_to_page(msc->base + off);

-		page->mapping = NULL;
 		__free_page(page);
 	}

@@ -1158,9 +1158,6 @@ static void __msc_buffer_win_free(struct msc *msc, struct msc_window *win)
 	int i;

 	for_each_sg(win->sgt->sgl, sg, win->nr_segs, i) {
-		struct page *page = msc_sg_page(sg);
-
-		page->mapping = NULL;
 		dma_free_coherent(msc_dev(win->msc)->parent->parent, PAGE_SIZE,
 				  sg_virt(sg), sg_dma_address(sg));
 	}
@@ -1601,22 +1598,10 @@ static void msc_mmap_close(struct vm_area_struct *vma)
 {
 	struct msc_iter *iter = vma->vm_file->private_data;
 	struct msc *msc = iter->msc;
-	unsigned long pg;

 	if (!atomic_dec_and_mutex_lock(&msc->mmap_count, &msc->buf_mutex))
 		return;

-	/* drop page _refcounts */
-	for (pg = 0; pg < msc->nr_pages; pg++) {
-		struct page *page = msc_buffer_get_page(msc, pg);
-
-		if (WARN_ON_ONCE(!page))
-			continue;
-
-		if (page->mapping)
-			page->mapping = NULL;
-	}
-
 	/* last mapping -- drop user_count */
 	atomic_dec(&msc->user_count);
 	mutex_unlock(&msc->buf_mutex);
@@ -1626,16 +1611,14 @@ static vm_fault_t msc_mmap_fault(struct vm_fault *vmf)
 {
 	struct msc_iter *iter = vmf->vma->vm_file->private_data;
 	struct msc *msc = iter->msc;
+	struct page *page;

-	vmf->page = msc_buffer_get_page(msc, vmf->pgoff);
-	if (!vmf->page)
+	page = msc_buffer_get_page(msc, vmf->pgoff);
+	if (!page)
 		return VM_FAULT_SIGBUS;

-	get_page(vmf->page);
-	vmf->page->mapping = vmf->vma->vm_file->f_mapping;
-	vmf->page->index = vmf->pgoff;
-
-	return 0;
+	get_page(page);
+	return vmf_insert_mixed(vmf->vma, vmf->address, page_to_pfn_t(page));
 }

 static const struct vm_operations_struct msc_mmap_ops = {
@@ -1676,7 +1659,7 @@ static int intel_th_msc_mmap(struct file *file, struct vm_area_struct *vma)
 		atomic_dec(&msc->user_count);

 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTCOPY);
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTCOPY | VM_MIXEDMAP);
 	vma->vm_ops = &msc_mmap_ops;
 	return ret;
 }
--
2.49.0

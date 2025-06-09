Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B701F4191
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466006; cv=fail; b=eTv40adpjBCVOqU7UzS4nIFO1Xd2B2+aQP4nvgQlv1KDoFvPAKeoueN4/H4mPaamzWU5zwUXTVLDvyovbB0GSsRPQ3umCny/vOIfU+H3uAA6oiq8YQKscEYWsePpunjdOGbG+WH+rR/epdSIMrf3kUK3kSGnFD6kYgbT9mlmRpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466006; c=relaxed/simple;
	bh=KtVTNEt8g1eXshF7DQNGWCkvCUM3h2QvWnUkIZuct8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ax/eAIVJjRWVFQzHTr5aaP8btxONqW1/xe7l1ueyY5mcZWIh4hGSv0ItooYijJ5MAOPM5VkHcVXgNsnUbOnKIMhtS8IRAEvQ2UmpDGZcCkyfS24XglVXm22hvtzvpZjhAwejHNWMOojju976rYIHlIJrYIXt5CQz5wuLlYFZ/UI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OAzZOnSJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ucmyWjP6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OAzZOnSJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ucmyWjP6"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593i8KO010902;
	Mon, 9 Jun 2025 10:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=tCjjF0BLKKFHw0iFlm
	5s+XEROBx1GBBRa5GosBdmPBI=; b=OAzZOnSJi8/uuFcQaogjBT7vJbkULMBbcD
	Pi13Gkg1Z7V+tegOo6yEOntH7citJsV6XGYtmBKVsds++kH1/QZFiEoDzuW9vcLG
	nl9lOznWGWUJ8Dhc53p+Im5vZHOVAV7rvVqqB0uwV8QZ+np69KxcH3QNwEwW/lpK
	QK5xOCVx3WYc50Q9p6CWMrxXGX5m1VN9KA6m7vBkCw2pJcdl4vaUcnOnOAJeDHGs
	gX53lvprSEfJVU/wGbrtjDcItQjoyRAz/N93pWavB2id4VMH5HkcQBBAdskPKzu3
	p90JtIhF65JDhJ56KeSVHwvlyDN+Jn8FvdU0aY6rl1kekp+caN0w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474buf1wue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 10:45:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5599DeOr003304;
	Mon, 9 Jun 2025 10:45:41 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv79rqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 10:45:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mi3DjPt2hSESy2mhor2erAyyzuKqTDqqdFf9+3Imkm5ZgXKqx7Ru2vAIL7BQPRVNnNk2UzVEqTntw0QmJdSHzGYXEVUYEvIGuN9z6vuUsiikUv/e1e+TBXIHaS+sZ3dK5mHI327R9XhSNKZjnNkn+w8B9dN0B2u6jmRBSj07RDDYARzmnsA68okrGlvnopJlDblSYQmYPPv2qP0Avi3Af5q1OSsRRGndi1CTJJ8VJColg1XfCp5UjCT6/1hd4io+qQWMD5AFVj3vuhdI/ovFjuAN2dKU8Z5uY2ZnyvPIARcJS3hspQGF/9txJe4w5pd7d5nfHv0OSFivB3EtRVF+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCjjF0BLKKFHw0iFlm5s+XEROBx1GBBRa5GosBdmPBI=;
 b=pUckUKAEWCqPNEpQyPxRVfQHnxpKwWYYIj57nljqWoTFwDUqDkUD0q11+CEMxpobRXyFfgnRokRZ6pRyXqYFdaZ3eaM2Rg/PP/GncuFi3+o4SrW2Oc+vykbcq68OCkT4WigrcstxUmArLA+dOEzWOXL+k9Zuo0AgzBqOrWPrSj04MtEZhE1XsX12wivCyXw9X01m9dUGTmxq5JArlz713YdiQX+txNiHHqeHHyPOb3bZVB6djVRoJkl/jJT9C84Dcc78AqJ5cC3CdbEZh2179JlFizupkcvn8MSyKmXiWolND0E6fe6kQrN/Blm/i54Er4+d57QlbymFzceiNqB+Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCjjF0BLKKFHw0iFlm5s+XEROBx1GBBRa5GosBdmPBI=;
 b=ucmyWjP6XUM+pDYhLCaK3Pv6bIu+uNuBTSnso3H+42HHR0a8xS4DviAOrH72sd398aQzFoyzvxPmKv/fgIHXd9iTbVEfCHu49BVhqz2WQXh7TVDIlr7+9BPUEbajFt3PXTyVcHiI+/8O5DZbzgZQG3RZvmd58L6OC6M+GQAsEbo=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN6PR10MB8095.namprd10.prod.outlook.com (2603:10b6:208:4ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 10:45:38 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 10:45:38 +0000
Date: Mon, 9 Jun 2025 11:45:36 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, David Hildenbrand <david@redhat.com>,
        Rik van Riel <riel@surriel.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v1] mm: Remove arch_flush_tlb_batched_pending() arch
 helper
Message-ID: <48375ad8-7461-446e-9002-8d326fba137b@lucifer.local>
References: <20250609103132.447370-1-ryan.roberts@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609103132.447370-1-ryan.roberts@arm.com>
X-ClientProxiedBy: LO4P123CA0326.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN6PR10MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: b930acf2-cf4f-4877-776d-08dda742c5b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HXCDKZvwlGQxa/d3caj35wnjwKlscQ2J2UB+T4MtUjZF6ays4g8/1ufebUSM?=
 =?us-ascii?Q?N66FE6acWrR9JpgUyU/cX1pqqTOKDfgDxZPqAd76bUwSGHdgpjxbK8G91H3r?=
 =?us-ascii?Q?mQ4Y4eCkAhvpRe5oh/DQPvKBlNPiNVXn+W0bZYkxytivXFpxdYIvIf/6RUCm?=
 =?us-ascii?Q?0hPz7Lm70t+PjnvjXSsFGBxp+5VpIjWlK9Q8dCp4kJwpfKLxPxQfoVI0Ujfp?=
 =?us-ascii?Q?2nftuXtOjTRAY44uh88r9JhNSccGTYafahD/tTEcPf6hjNPv6DKZjpK9dh4p?=
 =?us-ascii?Q?JgeUlksMpls7+OdYas5zT62YRUtEZpRbwYbT9k1TWtQPTq19CmpNyWvY5sMX?=
 =?us-ascii?Q?PIrKkIuKjNXJkQ4bITeDggYrykIpetWYaHO2n+HTVfEnQjVLWuQcp1trMXhr?=
 =?us-ascii?Q?xF012czSt8rsljtXoSY0gzD0ud1bf4MBjbw8lt5CYk9f7cqDmvVQPOHYvcPu?=
 =?us-ascii?Q?UZVo4j/YcgkZw5Bmbj1WJbmXEQ0FG5zHwuiIJsNi9LrYco9ACY+j0oJSQeXq?=
 =?us-ascii?Q?WAGCCC6Zc7hTEw1lSr1Eb3DQHnx/FfzUDcZClZJJwMWfsbpvOQ29Me3yfUe+?=
 =?us-ascii?Q?Mdd3ziTqTtt/Pff+02PJOfI2d8eOhsifCN1gskW2N2q5TWTQmvSkELrgf2LD?=
 =?us-ascii?Q?H+9XnIT+h+r0/laPTWdJeqv4VBRFhq1obGFDHRYNZpxCil419+GkrLNv4MCI?=
 =?us-ascii?Q?8V10QRGT9es1EtJBzurrgrUbkEHf9Q1M/dQawUIBFl3LLhxPV7pdFIl9TDi+?=
 =?us-ascii?Q?Og706pYofH7Dc4YI8CLJdRkfsrqB7wTb1+J+/QoGVb4x5K/pLTzXT2uz4+pJ?=
 =?us-ascii?Q?ju5LTkCFOmhzMZCI4QR6oltVXAEOfyYi/nGS1Nq7/MPTG4ciNX4fll9Cero2?=
 =?us-ascii?Q?CXYPNbYxKlcVK6gyGVGrH/CKO7MKHyHSmBXL5r1LyoYPiwi2ACKI+evG4QAx?=
 =?us-ascii?Q?FAtO/FwNLTtov7W09h8dbxBr0df0GQVn2dnCN+lSFv7DbIy+GWfJMgQfNU7y?=
 =?us-ascii?Q?yN4PGfHpqK1D6B3kVANFiiJX4qy1sg44NfG3YhCfvXdd9dtd2zmx3Jmzk0ZD?=
 =?us-ascii?Q?HHKevNj5V0OQnSUUgebR6z5ixj+Yh4Pm01hCg8w8IhydrMhtucPcHJGfWSt1?=
 =?us-ascii?Q?8BlDlMSgjNlVjXDd/50TkvYIuAv68pNwCV88MBLk9EF+QNXrVszp/rYjcOoz?=
 =?us-ascii?Q?OIo6NeyDPu/FLskXJHZx6NzBNLwvFG5nXfsxhxsx626bnQjsv/anzX/x1Gg5?=
 =?us-ascii?Q?9K9CqI9KipR/24rMi347hgLu5wFkG7uHeNpced6JpFfrI5JxAJIrcQCxeB3k?=
 =?us-ascii?Q?EX6ptAE/FtUKeSIet14m0KylMLpRaVmEB8wq+yzG/rlUJOlYUbURc3qXFxkv?=
 =?us-ascii?Q?Oe13r/mG77YIa+TqgrwgkfJXg634ovMUzKSJLCrTAxLimxbBqt6SaGLc6X77?=
 =?us-ascii?Q?Qx+gWNk197Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9EJudnvfffyPJuyWl5jfMBGZrZ0TjXHhR3Pre8WGubNHGPMsMt4/LTVgfDbl?=
 =?us-ascii?Q?gA9y4K3ZyqsAUdAWU0aFCR3iEWh4ilxcnGcsxGCZK78xNSUqIFesnh1Hw62G?=
 =?us-ascii?Q?A0j+q8iGpFafGpCMUSVn+r2E6zo7k1v82OV/CHEc2VuTgHJY65ivx57bqMLy?=
 =?us-ascii?Q?5P39lL2nqaMiHqO4zoWHIQ2ux5CJiGA6jPKEiobQSmLHFT/eBjMeuG3sAQhw?=
 =?us-ascii?Q?z94K1PRXprsBvTIpiMgkhu0aeTGTWaVqp8XHb5nj9uqblFCxfLL8EKwshzV7?=
 =?us-ascii?Q?0EqFLc9+5zRSwqlJkKmcI+yR5jF1KUEHUX/D8ZJMGoEsVPMv29xJhABBUINS?=
 =?us-ascii?Q?ADolw8KbdnwNlHGWyiL8N0uiPMDzuV2ajTNxb1FDB9B+UIrnxMgXIGfVS5yr?=
 =?us-ascii?Q?k/5zl2SGPcayow76tl9xFLqHM13cVAXE61JO5NX/gIhYQMkBwDO5KXig4N61?=
 =?us-ascii?Q?gxqDtMVkPBJMtIcdalm/fITzgUvPzwKBhqMgAuhUVFh1lyIZZ4b0PP64xhlb?=
 =?us-ascii?Q?ClnfJA94A1ZbN7UYHP87/GC5uNLmKizqXBGNYp1Dxj2ihAVhZVnfmWN+wZgd?=
 =?us-ascii?Q?HDbp1KpxnN++2I+0w1t+LdhPFMji6DS6i32Op4pCViJgxyuIZ8EQ5qJ23V8P?=
 =?us-ascii?Q?wrz3jfqGR78XKRYwc6pC6xTe/C9ywlGQnceHd6YSC+ch+6RW8FJe/Kkl7ab5?=
 =?us-ascii?Q?y1Ka/8YmjhqxGJuJumR7Zii8hVCJoK4FKsuUZwJTOXDKcMH5wRrFfnX9jbu8?=
 =?us-ascii?Q?rT+fkH9M61AfBRPsaKGoGHIxXkGzfP39HbQGPUgzei6LKXSwb5RBwXt1VI6Q?=
 =?us-ascii?Q?kejEKDU618MV1M6Ta14uId/kDQl+iOEUJ3uP/zh2puIl5Z87Cfmnq1aiz73L?=
 =?us-ascii?Q?cOrddapq5b/5+luf+EMlyzC5f7c7msG7gCFIu4rWjm374MZj+MZQE+fLGqvh?=
 =?us-ascii?Q?uKnzSqA8GwQm82YgzEDcDnwvStdMHCO6M/fMx0JsUA3a6yJ0+3QWSxKqOf1P?=
 =?us-ascii?Q?UlJ8kYYywLvckbHY8ElBNY3+YXjN2+DtnQWx4ZfO85n0cZbYjd/qF3GaNMuX?=
 =?us-ascii?Q?Omq8xfbuHDCiuJO3ILRzxunPhqoc2kT8EdUvndFKtmw4dW33JmI9j7+Cf6gS?=
 =?us-ascii?Q?2FlbqQnyRA5cPSWmMGN9KKh4HqhuKfrB4VyvSUd5yOqWzFE2CW1QmoDD5lpd?=
 =?us-ascii?Q?WRSzlKTSItBW3XGgO9Zvk6gEI2dujYsNsmKsSlZmvIlF+LSDR+M2J3t2YzZ5?=
 =?us-ascii?Q?NRBSBiwPIUU4jA2h7x8c7MkZiP0M/fDnUyTgdqvJcbqywZcTiu/kUNpL+75O?=
 =?us-ascii?Q?f0sR3yjQdxviT3ESFsS8q/g279ZeN1ax3+BsgVSQGomVj6X3a7LD13A6oS7L?=
 =?us-ascii?Q?bnkfDw2NJiQukWM8S0rP4HrnmRiEhnHsVacmBoJrdhwjkuWlqsG8dKn9ehcW?=
 =?us-ascii?Q?6nTnGPXuzkFEkfo2yedGC3RUUpnD8iyI9uAICbaJ5IONoiCCTdptfhypRCt1?=
 =?us-ascii?Q?0F2PJJnkBy/jDMAVCoNSYVA6MXPhrlmNGQBkumbH3UTcjI6U1Nn5DUleFvHq?=
 =?us-ascii?Q?pRmi+NzuQnRRPRVGiVOXzUG2E6k09krqyFMMPjgSethxisQWkaXfXnG7oV63?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8z29urZ6HG6ZxOCrSLo6UOOl8Qn1xfBOfFtFNkhBf9IT1SGc6fxYToCOjn73R7rnk4eZn+rGPwb6aQ5ga9Gp1DdRIdCZzCsHR0cbK7Gd9jnehxKbdBUQVDyEkqrnhcbSx6C4UcQtFZ69uupbRB+ciEbEqUtWGe/1k6G5+dnjXfM8FKbhsQQ8W2aE2XKv0e+xO6it10x7IVwqJ0Je6lbFxIxO9wYNEURdpNvmd5wkwKlAZ4pMvehlA4vmWVty7i6a56+L1D20Qe4vWEKxAxmNO4J72kWZwUtoJ5cG0wRJgwWzi83qu0Lq4++bSzl2GSF1K+0NdwCl9hiM9W5OORx2itCyR8zuCobzcwgf3Xror+B2AkU4ADhuJyTmHtIAL+dQraaPQs2BFhMz/u/UgCukaDfBmVB3m5qWh/zj7xiQgd20GEsyrvcJwI92XoOD73FOYJ+0lqCxKeQ+u97h3H4UqI69jI8JjN+G5K6+RnH3CsiKj/LdYKmw5o/+WDaKCLXUYkpkynFhvsSo3e5TKY/AIbmw174aCaC/wC/UyQhLYhrAyq+XstcosXDZFS8ouC2KZtw+zNveRW8ceqciJPc5DGgwEjG3IYwTXeF0uCERoX0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b930acf2-cf4f-4877-776d-08dda742c5b7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 10:45:38.4203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ldUjT9a+CYsQtveXd+V3rfvDinBzE3PH/Ee1F3DoiGsU9vJjyQHqpLZL58/sgsnz9pmkXhh/zMyIRWtYLKoOWmHgBGPKR09ZrobsaEXvwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8095
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090082
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=6846bb56 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=yPCof4ZbAAAA:8 a=8U-DqOgDh9AVG98Aa1EA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=CjuIK1q_8ugA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:14714
X-Proofpoint-GUID: Z8SZ9sdccZ9DLzeLgFGQOJg7amlNa2wF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfXyuEK1IX0sbWO mdt733IpFXo6iuVhSIBq8l+0afYbPivwcOJKWaSFLtWm2Dw8l8pzYPnsTJCf091aSjDwewhz+Rl AmjLZCW9ISK1BJvh1TQuToktIvoL2M82ryhcvNjbzrzTORcms2RJzVxwOTJO3vULJGvnhIAxjWj
 SbZ4PP4K6dAwm5EhtkOIZt+m3LNDfb1YxXxdjnBkq5jtJMHAfR4ymqoGy1UpfqAnfgEYr6VBLq3 0TwRNM3Uyb4/untmlTKLUx3PZvxI2kDOl0KDBw0UYeuDyqsKASyITOTqC57G4Coc/Lkoe8AG2Y4 gwCzdIPTCEou2WODcbLQzUa/krE91mb7I0Ts8PcQQIEqckfWdAhw0Zrr96TKOQe3R2Yf7YKlfdT
 OPH75XlrumqA3JauQTGTkB865AJAuCxt41A9nHKlpzpK5QwmKOzDFBUPu19Z46BrnrSGs/yZ
X-Proofpoint-ORIG-GUID: Z8SZ9sdccZ9DLzeLgFGQOJg7amlNa2wF

On Mon, Jun 09, 2025 at 11:31:30AM +0100, Ryan Roberts wrote:
> Since commit 4b634918384c ("arm64/mm: Close theoretical race where stale
> TLB entry remains valid"), all arches that use tlbbatch for reclaim
> (arm64, riscv, x86) implement arch_flush_tlb_batched_pending() with a
> flush_tlb_mm().
>
> So let's simplify by removing the unnecessary abstraction and doing the
> flush_tlb_mm() directly in flush_tlb_batched_pending(). This effectively
> reverts commit db6c1f6f236d ("mm/tlbbatch: introduce
> arch_flush_tlb_batched_pending()").
>
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Thanks, love to see an arch_*() helper go :)

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Couple points below.

> ---
>  arch/arm64/include/asm/tlbflush.h | 11 -----------
>  arch/riscv/include/asm/tlbflush.h |  1 -
>  arch/riscv/mm/tlbflush.c          |  5 -----
>  arch/x86/include/asm/tlbflush.h   |  5 -----
>  mm/rmap.c                         |  2 +-
>  5 files changed, 1 insertion(+), 23 deletions(-)
>
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index aa9efee17277..18a5dc0c9a54 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -322,17 +322,6 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>  	return true;
>  }
>
> -/*
> - * If mprotect/munmap/etc occurs during TLB batched flushing, we need to ensure
> - * all the previously issued TLBIs targeting mm have completed. But since we
> - * can be executing on a remote CPU, a DSB cannot guarantee this like it can
> - * for arch_tlbbatch_flush(). Our only option is to flush the entire mm.
> - */

Hm are we losing information here? I guess it's hard to know whewre to put
this though.

> -static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
> -{
> -	flush_tlb_mm(mm);
> -}
> -
>  /*
>   * To support TLB batched flush for multiple pages unmapping, we only send
>   * the TLBI for each page in arch_tlbbatch_add_pending() and wait for the
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 1a20dd746a49..eed0abc40514 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -63,7 +63,6 @@ void flush_pud_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  bool arch_tlbbatch_should_defer(struct mm_struct *mm);
>  void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
>  		struct mm_struct *mm, unsigned long start, unsigned long end);
> -void arch_flush_tlb_batched_pending(struct mm_struct *mm);
>  void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
>
>  extern unsigned long tlb_flush_all_threshold;
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index e737ba7949b1..8404530ec00f 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -234,11 +234,6 @@ void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
>  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
>  }
>
> -void arch_flush_tlb_batched_pending(struct mm_struct *mm)
> -{
> -	flush_tlb_mm(mm);
> -}
> -
>  void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>  {
>  	__flush_tlb_range(NULL, &batch->cpumask,
> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> index e9b81876ebe4..00daedfefc1b 100644
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -356,11 +356,6 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
>  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
>  }
>
> -static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
> -{
> -	flush_tlb_mm(mm);
> -}
> -
>  extern void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
>
>  static inline bool pte_flags_need_flush(unsigned long oldflags,
> diff --git a/mm/rmap.c b/mm/rmap.c
> index fb63d9256f09..fd160ddaa980 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -746,7 +746,7 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
>  	int flushed = batch >> TLB_FLUSH_BATCH_FLUSHED_SHIFT;
>
>  	if (pending != flushed) {
> -		arch_flush_tlb_batched_pending(mm);
> +		flush_tlb_mm(mm);

I see that CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH is only implemented in
riscv (if !nommu), x86, arm64, and therefore we are only going to invoke
this for those arches which previously did the same anyway, so this is
safe.

Kinda wish we could avoid this ugly #ifdef #else #endif pattern here in
mm/rmap.c but probably necessary in this case.

>  		/*
>  		 * If the new TLB flushing is pending during flushing, leave
>  		 * mm->tlb_flush_batched as is, to avoid losing flushing.
> --
> 2.43.0
>

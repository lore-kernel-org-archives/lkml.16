Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD621FCFFB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051416; cv=fail; b=cPP8mL74umMb2iOLf/fbmmNjMKFlDfbn2QhgTZsWe/HYoL6IbVODqnuNKsJaXuUpfq30Ias7FKLzPOP4EnWbDgO+MOwGvWzaKwTOY5gEtK+fZlw0nyYdaFBotybVMRn5TrM5vYspeswXv4Jj+uyY0CXNKwfhgqq/ele00asz5n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051416; c=relaxed/simple;
	bh=WG/1BUgW0tEd7u0Bq+iWHJGwe8L7GEwGfuFzuuHh7BQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=da2ShTUtHOolsvbhvE3g6kOJQdHFeVM7TKKFJG3z/W5upef5zk0AKEydYY3KPWaNwIj8NMkw4Sz6YtgPsuQrlqUZH9jwHi+vggauOx/qCzF23jNXpbTzXY/0BPGTJts3QDq+VfdxQ4FduMDnlyZI+ll7Xd49bBbyzeyNSvMykAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SuKWKtp3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=h/6soMtR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SuKWKtp3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="h/6soMtR"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNpJHH017676;
	Mon, 16 Jun 2025 05:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=sOBerAxhEfBSuBr8L2CHvxD6YCCcmvhK+T6aqU4W6A4=; b=
	SuKWKtp3pn+PtUR28ciYWSjo/P/wa1AeuCEPFxcpmFP6KMW0NzaPEnpsvBooBIF8
	D1s7BfwiJePuxHdzIpkEsup8ZHRhUXSSj1/DEB06GThwl8bhg+cHVBDLc2IOLF9T
	+5Ip2BogG+B22/5JxvVDYWzBWQ5ao8Q5jmTHWLnepUJ1LLgBOmPWoGi0fyFwhhGL
	9GMSCuKb5n0UpG2GT3lnaEeU4vEz5ORDt5Fc3QTLtBT8raEVkSdVN8UB9E36R0ZV
	dJ16lSHra1Nnx0JCjSBv3/j/+IN6mq56KOb4g3ewsJLC4mVGTny9LQ10vaCtDrcI
	xAbjzY3vSLceVdBkczDYqA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd1p61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:23:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55G4Mqxt032103;
	Mon, 16 Jun 2025 05:22:56 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011045.outbound.protection.outlook.com [52.101.62.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh7f1ay-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAoj2wSYjK1Cm7Zk2ETgQF9fqQX6HYxDG7VmkQLR1Ab5/AReNIJffn7wW1yX6MLrYMO3ZYqC/2iJNbC5i1Yh+91lCLhmlG6TC0NilKRT29/Y1l2WRYZZaUsaX8YIcI2pHso+1VxGiM5lGD38gLznOv5YE0wg0aXzL5gtzCmTU8EMTzOusJknXeSR7OcRqwsEwu/ZSZan8AgMK/i8RZt3FWcw9DFrK8qphkuI36VVPuA8T/KyRulU266QbMn2ASPkPjeIG+nNfutKVfB77b/qzlc+M7+WFC2E77ggbfG4uH04AusNhndm7ArRVkZw3SGO8GU6LTGF6rywXZw3194CZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOBerAxhEfBSuBr8L2CHvxD6YCCcmvhK+T6aqU4W6A4=;
 b=MBu6NAC4xH4qa6GNDte+0dvy3SrCmGTkwT42ftPTeFR1+Zx8sxJe7dE3KvJiN9TBbmdj0yzHwaMPNFvr3shsB5ykfHXL41F4ZvGgcpBu622RIA/lecor1lvH6hX/Ued8vZbshZmlcvAlhZuaWUdxwrHy1Br3LK9NrNX4n5jSDr0YsHPl4xlJt5Q5LdnVx4YCFdEiCd+oXxquKbqmu5wZqCU7w9lRAw+86Y2S+7Kojxip14sv4Oxq5jsOQ3/2BDzSxHnxtF+k2aXKHhKrAisMYiaLPlryCq0xVOqR5Blm7NDIpHQ4EIrURBmc/Ofrt0TSBIj7PzBSq5kNt48WwkqiRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOBerAxhEfBSuBr8L2CHvxD6YCCcmvhK+T6aqU4W6A4=;
 b=h/6soMtRPXwp/yhxKY/3/jgj1f3al48M10aIxYlE5jRF5xabtNDHQRIZlVExQVh7IsnXF4lh9uvaYXeuMY2QLVgfhBEfujUdCmShW6O0EvMeXXTq46hivRNC0JouIrCmRInb4KKxM3hASQ562q76FylcFsN0xcJF2dShlE4az2w=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by BN0PR10MB4903.namprd10.prod.outlook.com (2603:10b6:408:122::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 05:22:54 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8678.028; Mon, 16 Jun 2025
 05:22:54 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, ankur.a.arora@oracle.com
Subject: [PATCH v4 13/13] x86/folio_zero_user: Add multi-page clearing
Date: Sun, 15 Jun 2025 22:22:23 -0700
Message-Id: <20250616052223.723982-14-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250616052223.723982-1-ankur.a.arora@oracle.com>
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0042.namprd08.prod.outlook.com
 (2603:10b6:a03:117::19) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|BN0PR10MB4903:EE_
X-MS-Office365-Filtering-Correlation-Id: c61bc771-d973-4d85-e30e-08ddac95d8d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iCqhezJGvNnWCqHdZCT0oG7Ia/6sPjxnSGp2SD4mkwhHBh91oduk7/8Bg1tX?=
 =?us-ascii?Q?0iuhfKjfoCzN+b4L7GO/dJFdnLZZnT6x/kz5+GDmsVhSfBXOPRVLBl4xdrx6?=
 =?us-ascii?Q?EBFVoU/bkZNZOwn88XJKFTFwqu3SfxetyAnBWLwWcTjsr0oTeE1hONcZMEBS?=
 =?us-ascii?Q?FBmTxHMoasULaMwNPiUjAedAAuQTgYgEvHTN6QErRY2PUSkr290fFAyWJTqv?=
 =?us-ascii?Q?tI+894zo+ZPnUH5N5I7KzKYwcl1SbPoGw7SVH86xZhT0QYmHGpB/Fw85uQvh?=
 =?us-ascii?Q?zXibBaQ/hQrmKEcaAFbZ+DHJY9a/GzhKn1B/588bPfynprPngH4vd1o14d8W?=
 =?us-ascii?Q?H/sKWa4zR9saI/QIi3W7A6Bic/1fSo2/wk9uJ+I/1qCJL7Lb3iTN56HNJhn7?=
 =?us-ascii?Q?fsoysa4yxcpYWF0aL11v6O6aflH54tXZvD5yj5quIbe8WenzqjXmpbaIs/ze?=
 =?us-ascii?Q?AFOiwIYCc5iouIdMEoIZgHI79zxZQGBVzOhUcVoIXM2g+Jjw4M3O5YpH19tM?=
 =?us-ascii?Q?ZYRjLzQF1h+Im0B4LVS6L3cbpdGSwN855NvafjuMto4sDYzNYBw0SPCSjfMn?=
 =?us-ascii?Q?d+xXtQyGXGSFbC0amCQtQiVGuDI4oIAdiDLFwdjoHwsA5AmL0JOGMAQAu95Z?=
 =?us-ascii?Q?DIVVlJY60u9c0CBKjRA6z7jpP9A0VzyXazd6xmCPuH1fIdFB+RSrEPjNfTk6?=
 =?us-ascii?Q?dQe2n9zxTvoIDmKWtvnLdgJvTTQPgJ9HEOTyH9TpZlpa/HPCJDaSreyORxqW?=
 =?us-ascii?Q?EVoJAa5ezqteo1PIZQ5WGIeWaT2t5YoamJmX0JZf/GWL3DKfw5PKmmRgAQhf?=
 =?us-ascii?Q?JJRGBYgwC2KU0foB3e4a0+5VcpdOF/s2qxU+J5nY9F3d4CTJ7ymhdJVAX/nL?=
 =?us-ascii?Q?PDbpYFU3AHvnFKVA6Zn07Dbvb4xTqV60tYUMwM84HoYrJFmi8kDe+V1dmcMC?=
 =?us-ascii?Q?QYyLHF8kXuWjSktDJgh5UGQiezaTcP52QqVIBtBx/RhJfGOvUIDw0AoUBsHt?=
 =?us-ascii?Q?NN/nGJYqoPWgX1ibUtllTPJHFNn02IvI9DzGYI4yvoIY4LvVxJyxYHvlR96s?=
 =?us-ascii?Q?v/mz4RG9IgWoe7NOI/vEZu262wTJPMWAEIFn++L2u3YgIVztwjYIwrGwUvJ+?=
 =?us-ascii?Q?qodjuNTmMjNStgQz34vQdQbjo3lI6sVJHtFuILDCce4n617VEMQXSOlKD8pJ?=
 =?us-ascii?Q?SwZGZDgpYW6/RF6s60PpaJB8yMLTr95BrTAZM/fEdT0pSUKMvueileNBXAl/?=
 =?us-ascii?Q?vg2tdQYPXAsadXOmSFOt0xM1SudBna2SMpCkkYXaOXoou4DgVqqnCFfP5/8n?=
 =?us-ascii?Q?OHyATNwQx7RwJKlhfB3wqnkpjKNAu1LxP0fP4C0k8IsokRjUwif3ivEMhWXg?=
 =?us-ascii?Q?76rw/+ZMwPHUhBhNbs/wcx2RXs3Wca2IAmu6Vvx2+8mji3aKovIQHutYNo+3?=
 =?us-ascii?Q?P47FfQU/0Tc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wy+LYnbn7EUluajpJ+DuPbSPtQTB/+cDkvkJvxU1N1sHEK91W685HHyFUESh?=
 =?us-ascii?Q?ud7E3yPYQyU2P0F5IuDgVJHldBblRbnyXxDhmdeujpORGPlmfl+la5z0EO9z?=
 =?us-ascii?Q?Ne9EfuUj8d3CIXdwDUSW0H/pSUGz4/T2lx+qeB+WGBHnO3L+zIP8hiA3NUNP?=
 =?us-ascii?Q?trinfeqaGIBWDq2WEHmrwtZPtweLSsk/mhdujhQS1sSpp3lejwlwU4ZdEFfW?=
 =?us-ascii?Q?H3Urd6oYzBezB6omCm7y1/x9IS8M4xORBk11SQMxOXJqskBYxo3k4uvAMdv6?=
 =?us-ascii?Q?7XWkeRAmR4f/qVicDt+25PLt4ye8XSc9ajnogofjfQxzLFlMt4RitE1vuak7?=
 =?us-ascii?Q?yS9MrGE1ZFpy/CoC3lZcssNRDHkHWsOSOdMAWi+3PjUAk+qlD9k4dgHUW3x9?=
 =?us-ascii?Q?6IR5yryxv6BFoMgMw3t/7MnMFvYZHQd+e+Ml6C9aIp0hmK2HLwPqfuxLVvVE?=
 =?us-ascii?Q?t1red1y3zFcX1mZmYRPU0LcgavBw3SAKasswlaa3fkBkq4uVDec32++PGSfG?=
 =?us-ascii?Q?9qoKiVkebtUOguSXgdqp4ELo8fzkx7uUxcBDl5BDjwz9MJwQeXsZLGtE7ssk?=
 =?us-ascii?Q?7LnmCYHyg6KjbT+skdEmpx1KC19oF8GABSYFWBY1kOt+XiD0DfHq0wRkmSan?=
 =?us-ascii?Q?GvUHAQ2AJQOVI09nToC8fJg5iy7ETiISQNRxBi6UBJeaP1Ep++uKXRSamhzK?=
 =?us-ascii?Q?4pBTGs3i88Y1mRePftFVpmhVHzNmNkgpLXgqM2voQ/jw4unihC1ts7T/VaA9?=
 =?us-ascii?Q?S2oDTosiHdRmQBZIDPFlfYw+7b5KPmuO4Yq6kLKG0+3qJeLvuMCKUxyIV3K9?=
 =?us-ascii?Q?sbh79kMBKAIyVaSvI4VGhFhewZYo8/ADsnbiDY6Fnc9KXKzZ4xIlKiUs6sid?=
 =?us-ascii?Q?GykETs7DYWiOZuA5MXAHCLT01fEj9R3Bf6z2Whu1eZSvL2k2CjlnIFK38DC+?=
 =?us-ascii?Q?py/W5uNt4m//gmAQH4QmjdxoZdxsitKL9TpIK5CAfkffRIswiAIyKIvpX2rA?=
 =?us-ascii?Q?D7DNDcpStT2V1NvFOMWIqgJV3URrGLr8/9/jPRxV8cW/QBOjH42ZGbfBUdBw?=
 =?us-ascii?Q?H8n9o1fn+GduTmt+k2c5EW9NM9Yx4oallzi8TIVZhJfghhwY3Z+Rlqkf4ZBi?=
 =?us-ascii?Q?TXQeNnQl0mAPMu/2k48nd8NFEOPimsltTLHh1PtxXFvs2T3dhEzDi63/OxY4?=
 =?us-ascii?Q?JyynX3eeJe4lryOjMEMKggarWM4We4VqS8mkdf0YrYgoRp2ETaYLx/zUk+cN?=
 =?us-ascii?Q?pAuJcmkWqbClx+XUQp0cDKY/MsHNJsA6K9swFg9CBBSSlCnEjRzDvKuptqt0?=
 =?us-ascii?Q?D7xZaNijN5lcBx6iK5mHxFCrbbRfVnPwAU/qbPl//3sGRFFkQLwQv15CtryH?=
 =?us-ascii?Q?6vnm6eAsPNSNBlbTQkddluVSo7eOWJoDyhmM1+II8CQxhJfuQbomIX2C3nB6?=
 =?us-ascii?Q?iqhvIk3oXPZjY6XrPIzvcZm0V6kt+3DDvV8qHVwqbCxKK+TQYAHmuewy5pmN?=
 =?us-ascii?Q?N1iGOWu2+rALj6x49RxaV6OGhw+bj8lS4qq5PAavUnZY5/WmrZvSOyEEgCXO?=
 =?us-ascii?Q?jOvMAMYSnQPLQB9SAcjqkfOZvoEu6TWnmD7bLZhejV/cxEryckGhcjxgTUMg?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WaZ7K2GAyD3unP9dhcWJGk5ZHplyaw/nf4kdRdfJIZYetqYBlYVKqz3KArWHCPJKbqQzAzUaOU9VfL53f+9jtaVe54Z0zsZq0i6UInB8yAvq7j+plKokW/YI4KYJm0nKZwOGYB4w8Gz/VM/KjZ4fDbC3230ReBG+fP1SLtpnC7RvchG/0Z1fDthP2Gxdjh84Pp38B+cjiEHaBzMxEoWGLeEmpe9Ys/OYWeYKiY1FJrk2OouAbqjhFOF+efi11irzVfmAk3oi1lidntdz+cDwQY+KckIpjW02E0weOyF3BLNXudUYaaJRYPVui64Kcu42UbJG2OOMc5Z9/XIrcw3fKcXSUwMaC65+iAptlWGHDp8hNAEo5dA2KAHXXbfQw/CvT6pae/CU2t3ydeJ+QdWYRu32ZzUbcOO8KAQ0SwXfaRnWac30ZX2tzERDhWriBgdPRNFJWSzWNZ7Z/bQueP0B6dx5h6zLFCviIN8RMul4jKwWjXgMcbhpB0UxZAXqB+9Fgydjsf3UUIfq9w2zQs4wxqan4hMLWkL3+QC1/bkLY9aKUOusXxqEs3W9+6h7fDFssBNeWYXRT0xo0GkUG+CcJkFvwQ9M55yO3Liv3avc/2w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c61bc771-d973-4d85-e30e-08ddac95d8d3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:22:54.5528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HA1UgE5zIRXswvigg6RJUGRtaQ9xThs9Df0z8haRcEAOufNiOdEZtsSjnsPP3Fw0xpG+Y65MSAJZuPUSb/DO0LgjzKJNsu9AVugJn80h37M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4903
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160033
X-Proofpoint-GUID: KoNIG7glBR7VAtff2wtwozR7dd9-EUOw
X-Proofpoint-ORIG-GUID: KoNIG7glBR7VAtff2wtwozR7dd9-EUOw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzNCBTYWx0ZWRfX6Gx4XCAIP1qN 40K1bSLlW+RWz0bSkk7So7EQQFZJarGQ7siP9/SsLVam7E/RY2RRg7HGGh4ozp7+Ip1YpXCEj6G SMsYbMdGnZgK3wm1ngp2lgq5MThetGJaogpqowPggFQ3/jfi1kRaYsxNYxCq1hiBH2Ob0iXvfwH
 5uITSNxWS5hW/tn5uoJ83vLfbcVeGMTGNJSqk+8RsyFOLfuT4AolkR9CKoBB71my6KlItVTAfqO XAjCMFflRyHUeNzrUVX/tvubYjIPc09iwcHg0ED+ypyg5nhddcwFuloZpz9SJhOuxO8WB2RWhsu JeX2+Lln74CYswWZi7QfSXPRv/unq0Atug7xcUWWYWoccoMBtnTQBkG0hgtN2kFpalVPiSz5Mcn
 REJMl86AG3lYVf60adZMinwd1GyhoEjbOmkVkfjXS5/KhSzzXUR/qd4VAGHJMRBb/qBDuwAp
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=684faa42 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=-03d-XzUNsdE7hy3SBEA:9

Override the common code version of folio_zero_user() so we can use
clear_pages() to do multi-page clearing instead of the standard
page-at-a-time clearing. This allows us to advertise the full
region-size to the processor, which when using string instructions
(REP; STOS), can use the knowledge of the extent to optimize the
clearing.

Apart from this we have two other considerations: cache locality when
clearing 2MB pages, and preemption latency when clearing GB pages.

The first is handled by breaking the clearing in three parts: the
faulting page and its immediate locality, its left and right regions;
with the local neighbourhood cleared last.

The second is only an issue for kernels running under cooperative
preemption. Limit the worst case preemption latency by clearing in
PAGE_RESCHED_CHUNK (8MB) units.

The resultant performance falls in two buckets depending on the kinds of
optimizations that the uarch can do for the clearing extent. Two classes
of optimizations:

  - amortize each clearing iteration over a large range instead of at
    a page granularity.
  - cacheline allocation elision (seen only on AMD Zen models)

A demand fault workload shows that the resultant performance falls in two
buckets depending on if the extent being zeroed is large enough to allow
for cacheline allocation elision.

AMD Milan (EPYC 7J13, boost=0, region=64GB on the local NUMA node):

 $ perf bench mem map -p $page-size -f demand -s 64GB -l 5

                 mm/folio_zero_user    x86/folio_zero_user       change
                  (GB/s  +- %stdev)     (GB/s  +- %stdev)

  pg-sz=2MB       11.82  +- 0.67%        16.48  +-  0.30%       + 39.4%
  pg-sz=1GB       17.51  +- 1.19%        40.03  +-  7.26% [#]   +129.9%

[#] Milan uses a threshold of LLC-size (~32MB) for eliding cacheline
allocation, which is higher than PAGE_RESCHED_CHUNK, so
preempt=none|voluntary sees no improvement for this test.

  pg-sz=1GB       17.14  +- 1.39%        17.42  +-  0.98%        + 1.6%

The dropoff in cacheline allocations for pg-sz=1GB can be seen with
perf-stat:

   - 44,513,459,667      cycles                           #    2.420 GHz                         ( +-  0.44% )  (35.71%)
   -  1,378,032,592      instructions                     #    0.03  insn per cycle
   - 11,224,288,082      L1-dcache-loads                  #  610.187 M/sec                       ( +-  0.08% )  (35.72%)
   -  5,373,473,118      L1-dcache-load-misses            #   47.87% of all L1-dcache accesses   ( +-  0.00% )  (35.71%)

   + 20,093,219,076      cycles                           #    2.421 GHz                         ( +-  3.64% )  (35.69%)
   +  1,378,032,592      instructions                     #    0.03  insn per cycle
   +    186,525,095      L1-dcache-loads                  #   22.479 M/sec                       ( +-  2.11% )  (35.74%)
   +     73,479,687      L1-dcache-load-misses            #   39.39% of all L1-dcache accesses   ( +-  3.03% )  (35.74%)

Also note that as mentioned earlier, this improvement is not specific to
AMD Zen*. Intel Icelakex (pg-sz=2MB|1GB) sees a similar improvement as
the Milan pg-sz=2MB workload above (~35%).

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 arch/x86/mm/Makefile |  1 +
 arch/x86/mm/memory.c | 97 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 arch/x86/mm/memory.c

diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index 5b9908f13dcf..9031faf21849 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_MMIOTRACE_TEST)	+= testmmiotrace.o
 obj-$(CONFIG_NUMA)		+= numa.o
 obj-$(CONFIG_AMD_NUMA)		+= amdtopology.o
 obj-$(CONFIG_ACPI_NUMA)		+= srat.o
+obj-$(CONFIG_PREEMPTION)	+= memory.o
 
 obj-$(CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS)	+= pkeys.o
 obj-$(CONFIG_RANDOMIZE_MEMORY)			+= kaslr.o
diff --git a/arch/x86/mm/memory.c b/arch/x86/mm/memory.c
new file mode 100644
index 000000000000..a799c0cc3c5f
--- /dev/null
+++ b/arch/x86/mm/memory.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/mm.h>
+#include <linux/range.h>
+#include <linux/minmax.h>
+
+/*
+ * Limit the optimized version of folio_zero_user() to !CONFIG_HIGHMEM.
+ * We do that because clear_pages() works on contiguous kernel pages
+ * which might not be true under HIGHMEM.
+ */
+#ifndef CONFIG_HIGHMEM
+/*
+ * For voluntary preemption models, operate with a max chunk-size of 8MB.
+ * (Worst case resched latency of ~1ms, with a clearing BW of ~10GBps.)
+ */
+#define PAGE_RESCHED_CHUNK	(8 << (20 - PAGE_SHIFT))
+
+static void clear_pages_resched(void *addr, int npages)
+{
+	int i, remaining;
+
+	if (preempt_model_preemptible()) {
+		clear_pages(addr, npages);
+		goto out;
+	}
+
+	for (i = 0; i < npages/PAGE_RESCHED_CHUNK; i++) {
+		clear_pages(addr + i * PAGE_RESCHED_CHUNK * PAGE_SIZE, PAGE_RESCHED_CHUNK);
+		cond_resched();
+	}
+
+	remaining = npages % PAGE_RESCHED_CHUNK;
+
+	if (remaining)
+		clear_pages(addr + i * PAGE_RESCHED_CHUNK * PAGE_SHIFT, remaining);
+out:
+	cond_resched();
+}
+
+/*
+ * folio_zero_user() - multi-page clearing.
+ *
+ * @folio: hugepage folio
+ * @addr_hint: faulting address (if any)
+ *
+ * Overrides common code folio_zero_user(). This version takes advantage of
+ * the fact that string instructions in clear_pages() are more performant
+ * on larger extents compared to the usual page-at-a-time clearing.
+ *
+ * Clearing of 2MB pages is split in three parts: pages in the immediate
+ * locality of the faulting page, and its left, right regions; with the local
+ * neighbourhood cleared last in order to keep cache lines of the target
+ * region hot.
+ *
+ * For GB pages, there is no expectation of cache locality so just do a
+ * straight zero.
+ *
+ * Note that the folio is fully allocated already so we don't do any exception
+ * handling.
+ */
+void folio_zero_user(struct folio *folio, unsigned long addr_hint)
+{
+	unsigned long base_addr = ALIGN_DOWN(addr_hint, folio_size(folio));
+	const long fault_idx = (addr_hint - base_addr) / PAGE_SIZE;
+	const struct range pg = DEFINE_RANGE(0, folio_nr_pages(folio) - 1);
+	const int width = 2; /* number of pages cleared last on either side */
+	struct range r[3];
+	int i;
+
+	if (folio_nr_pages(folio) > MAX_ORDER_NR_PAGES) {
+		clear_pages_resched(page_address(folio_page(folio, 0)), folio_nr_pages(folio));
+		return;
+	}
+
+	/*
+	 * Faulting page and its immediate neighbourhood. Cleared at the end to
+	 * ensure it sticks around in the cache.
+	 */
+	r[2] = DEFINE_RANGE(clamp_t(s64, fault_idx - width, pg.start, pg.end),
+			    clamp_t(s64, fault_idx + width, pg.start, pg.end));
+
+	/* Region to the left of the fault */
+	r[1] = DEFINE_RANGE(pg.start,
+			    clamp_t(s64, r[2].start-1, pg.start-1, r[2].start));
+
+	/* Region to the right of the fault: always valid for the common fault_idx=0 case. */
+	r[0] = DEFINE_RANGE(clamp_t(s64, r[2].end+1, r[2].end, pg.end+1),
+			    pg.end);
+
+	for (i = 0; i <= 2; i++) {
+		int npages = range_len(&r[i]);
+
+		if (npages > 0)
+			clear_pages_resched(page_address(folio_page(folio, r[i].start)), npages);
+	}
+}
+#endif /* CONFIG_HIGHMEM */
-- 
2.31.1


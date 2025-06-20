Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13BE2D4B6A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433628; cv=fail; b=IyHxmCw/oD8jH9Rw7x2hI4RwL35m6hWxYeS5exJ+bfYS3Oc3EcXCW38YzvEUIo/tP/RLLeUdgu+yLAk+8jQYk86DLlA3in8zozg5SZCvlm4+kzPNqwF5T7HPQ7l3LoBmZi/vm2e59vXQcK5cVJnFnMbkKuRytahkrdY7S0dPi4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433628; c=relaxed/simple;
	bh=86XVffWJXcbwwPSl8UAduQsbLz2FeUh0yvi2RTVgjGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S283JYcFWmQXXNgMvzqt2aCkOOqpWDddX8ajWXsfhfg3P5ZSwkLkHilGG543Hl1QLpgSCrjmPcVnooWKqbptkth0+lj4eLCex9jnfhxcHFH52LKy+AAC4F+2H5o4UYHAKwTJ+36kBKiU2q8ri+Z+P6QcnHGHpXd7T759yDnW+Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N1weL4VJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PHy5oEL4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N1weL4VJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PHy5oEL4"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEBmeL007768;
	Fri, 20 Jun 2025 15:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=LLLT1IxFcXgYOX1QMP5MH8ZqOofQGU5oMAjOpuE28iQ=; b=
	N1weL4VJfrthFYG5EUA79k2wqbeGJfxivKUkg5grloXNJU87l92shs+0z/Ud/Fbw
	4UV8XBmw+gEKvqO77XUKROKbUpgQbt27X6sz1/g4JOdZ0M9VQP0OfAS7y413RAK6
	lz1DeUt6hkuEeS+YKetIaC9ftdH85a1Tb1QjM6daWxVivDq01ZKdMnWNrOfZOajc
	BZIUef8Cuc7GkZM+TlNaSMYNu6RUeA22EhvaORjGcDIUCMuiEeXkMO7e6U7/h/w7
	is3erX/wx/Vore/EWD6DkgHAksOL9Hc+q5WBwVy1QaI1M5YWNjMGoxYTjhC/V/q/
	49WG1phLbvcQ+e87UDc6Hw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790ydbuwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:33:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEjVOZ018271;
	Fri, 20 Jun 2025 15:33:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhd2abm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:33:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imxogFoHp4KVDlLnY+wO6arOGkZB0M98e3RReBMsPyyRVeo254HKWLrtg+dG9YpoxuMf1FaOUlm6Y+E7MjBkXnBxm00v4t+msYpK3FNE5TVN+ytiSJ6YgxidtqsobSudDuGrAj54PNVDML1GB4ilZcToofC5kN1jYV7U2DrdGNsgZoVfAxQa+f/YiKa00HMWbCPfM/azG9WgO3FHlMxiEZjDSsMc8jb8JONLfQbv+yg9nv2VFtOSzBPPebxoXNxdKTDeMGbVIAIR+JuWbn7RqafW+ij5ExP2LqUCX+RxN1eeLCp9jaA+yjLqYfOLWGDSQuZ5i+QbGGlIeTF4dAbL0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLLT1IxFcXgYOX1QMP5MH8ZqOofQGU5oMAjOpuE28iQ=;
 b=VFoNYk1feu3Ens9M+MleFcBR0jZJIdKUdIA1YF2qLK8ELRYRubO5PtC4ZcaFZhR4Wcs28xt2X9F8p59oDkcRAmO0UtQfPWgQGdEo427PjDH//NizsKVpL7FK7fRDsEVdOxOR9UVI+2goyYIILcWm/Sx8hCLzrQpBE7ZxkTgm8NIoYDBoM63W6N4cmbVic3RqOxn7iy5mwEqPlTEX+z6CuCJtYOCBN0r1CHpSeKB7+9QWfeXxeHvFeD0JQgUJ+d7fU2zkElwQGxPgiRCVKir5D78S4k4xInkOmfy3S+bUUvPlOhYAgCrNEYJnEgOI3ziHvgO8hLlnjbsnnQXKT2fN5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLLT1IxFcXgYOX1QMP5MH8ZqOofQGU5oMAjOpuE28iQ=;
 b=PHy5oEL447/6d7i3oTxkRPVkOuar2zfieyIfSjZ2Fg54tTiJVB7qSANyqvue8MNs61bGdfr8wX9DnbYaiid2W3eXPvLW6tSmz1+8UA/JNkngWrwfSOrwTFH8YlJ9Ky8pq+IOvqMzIwPWUR198xMsmm34jmAfz9RB6OYKcpo7nb4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN4PR10MB5591.namprd10.prod.outlook.com (2603:10b6:806:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Fri, 20 Jun
 2025 15:33:18 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 15:33:18 +0000
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
Subject: [PATCH v2 4/5] mm/madvise: thread all madvise state through madv_behavior
Date: Fri, 20 Jun 2025 16:33:04 +0100
Message-ID: <7b345ab82ef51e551f8bc0c4f7be25712871629d.1750433500.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
References: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0238.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN4PR10MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb8a947-cbe0-4b25-bf77-08ddb00fc7d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HbTAMghHep9tvjRGxO0Z1tUBwsRIhkhN6OQq1VycAOAIUfpD4L8IUjLYpp2S?=
 =?us-ascii?Q?hXiy7eIbSNV0ZG6zxAoHq6of61WCsOpbv2V1Yrk/r6XwAEk/woaAsxa1pQ0a?=
 =?us-ascii?Q?+gP0JcZdwM7PKG7Ryw3b3/UWOQBEmbJmnU91Zd/wAmhKMZmc9e6RpQdDyHWW?=
 =?us-ascii?Q?Vv3IOG+4/T/dQ6i2e3nIbFtH/uUArq2tp0bKckHE+AMGZ0C5iJ3OPTS29Eeu?=
 =?us-ascii?Q?/39MbBmxDSPmDReyjjaCf4ynghWS3BMTUxoK/27X2UNIJus6n1kHgW9hBK36?=
 =?us-ascii?Q?GRwgJ39QcizH2sAGaSXd6GjOAdJqq12PIdp3EXFmYDN9HQtM8rsDydTTr/Ej?=
 =?us-ascii?Q?c2c1NHwOxQHs4SyCYqbHGIXpP0NgwYQeSW44Ac4tLtsbrOAaOSxjBu7aw/PX?=
 =?us-ascii?Q?ynRh8TkqSNq3etdClbkIXgH9nwEHskf0ucZWgn2iiyI9la50q5EbYEZMNcy9?=
 =?us-ascii?Q?0OFWT6ZTXzm71JiWZ6jZ9QFIV3ewBiWZlPA2x9wNNqpshJmtcKMa667Yiqho?=
 =?us-ascii?Q?1OkYTBU9Oj0V7HwkkOjOuU68CMrolR5I/EmGLPeQfaG1+9Sqi3bHB1XdGZkG?=
 =?us-ascii?Q?628uSNxs4Bdy3IOosla8RRLhVI4dGKR6ytAJj6OM8QAgUxR/701WX3VH785c?=
 =?us-ascii?Q?B+1Et+6e94dtGytCCd7PZTuaNgHns3I1VABZmK+ZCxgkzUgw00CKfyDZwRx9?=
 =?us-ascii?Q?icCruprFW5tD89MkTne+tifj+MKxU1ZVYVjdMlSeCPHJaV9z+9EMddRgW2Ew?=
 =?us-ascii?Q?eTYx3cP/YlrsSOgLBqnE0jyxgN4gJYy1Q3hZ5iLrG1gz6G3o0akF5EKjN7U1?=
 =?us-ascii?Q?EBJWtmY8tX1aBo7+N9R7A5O4EJPfbAjWsJORIUxNGXZu0JsdGUkxrxv8Nk1T?=
 =?us-ascii?Q?RASLkEdH/Hrh1mU7SuaV++IwU3nxa65Uv0TgteAbaG6pYJIwz+nSZPDHmhUK?=
 =?us-ascii?Q?HT7VYtX+IwSJ/oz1+gRxv9aPxcF009oOsryN3P90kXS60ASEBF58fBLyXgLR?=
 =?us-ascii?Q?OIOmB+2xzkPgGtrOkxhY5/rpNvgolVCMgXOxHvbLPVVd2v1lD2rJGqWGds+l?=
 =?us-ascii?Q?32wLsh8qHZz9A+VfxfK477ybPhjkbg5K6kgdgIEjXtejQuIRrcvJhMnDC1GN?=
 =?us-ascii?Q?qKrLe09ZO9tqPpEpFXOjKX/J0RX1l+jggpT6dBHnJAaLJxxgjfAi/WZLGXdj?=
 =?us-ascii?Q?8kP3vGQly5vllK31xdKNME1YEiDVP/97VC2f+eXyq+K8t49BmUiBZG1s/uxJ?=
 =?us-ascii?Q?g+9taeIReyXKenEUzK9C8ZcLgJfxKPL4BRr5dtfo9QnxIJDF7yt6S9vKvGPR?=
 =?us-ascii?Q?cJu/7ZLYHUbv6G7+SBoCgH64I7hPr5ejWtuKKhoiFUlYhGv/SJvvweRKmsOh?=
 =?us-ascii?Q?tcUlxHkZjm/m2gfu9FdU5eRu+WttlI/76snySwy2rIf4XyIBksqpyFXjYSsV?=
 =?us-ascii?Q?LqvjM/t0/L0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d3X9kdCUxdddvDnaLHfqfr7mEStpMGWka0wwdNxDrLkXH8QSBGHSWLa0Gh7N?=
 =?us-ascii?Q?GdlngB6DexyARrNKhrO6I8x48rm4b69K05pbJk1Dz9Ly3UfdHoIZ6/D/Dy1F?=
 =?us-ascii?Q?O9ZBDS1KvudmqdHf6hNrv2tGVQwEFTfDmjTiNQsbax8TSfmT9p+Q1azBAgY3?=
 =?us-ascii?Q?BHj3hK4Q0ALZ7jZO0NcSNWomoJAL96YTbdz3ZRXRP+vXG8Ff5/rwGk2+CHTy?=
 =?us-ascii?Q?v3amOrVPXOZM/3EuSlv9nFJ1qlLmqCuHrUtuuymVYeGwcwO7MHN7B3lcBhpm?=
 =?us-ascii?Q?I0hmn25R+yE/rLkhB/xVyDPL3vKOGZR1+4dwWxrLkvT6tiCO+3Bb6Fyxg3qg?=
 =?us-ascii?Q?8preJ9E5qk385pOcHxBnpf/IPtO+l/lmkKMdeQQpgFTumV3AI7zxnUGyN2Ar?=
 =?us-ascii?Q?FCOmivZ4/LvtbX1XZsHGjJkg6JigJ3CNtr1Og6GgmJe1SyVrezFX2/8QSYA2?=
 =?us-ascii?Q?/3smIYVuDfLOBaekqUKdNGEQtCwxuIYSxrVWRb0LKX8+Rxzhgd/R6/rp0ooa?=
 =?us-ascii?Q?yHFzx4fx4XY4mRtO+jSRYOgRI97CKd/IJl3ro7cmPbUhdAzZwZSbXIYOh83k?=
 =?us-ascii?Q?BpHX9OKtKpP0+HkohWQ5KXUWWkutDTRxCtan2hTFaD2lvoXPR0BYbX+O2LF2?=
 =?us-ascii?Q?T4R9dh/+tM8leby/d5N46qMUXSrk1plkWm4sdsum5J9/LbwRrjtjhIo3bzGm?=
 =?us-ascii?Q?MhjyeSrVwyK61HyPouYcZAffiRCM/8Tt3PB1ATayBtINY7qyq42e3g9A8m7k?=
 =?us-ascii?Q?s6h+J4cUTUdqtlkLC1NrZxt1Q1lt4T/TCWR6xHNTflpnAb9EXu0aYyDYiRQE?=
 =?us-ascii?Q?qIgEmXVzD691yvg3orxjntL9/XsE8AwW3uT0hzipZR1QBI1zre1XtxcP7is+?=
 =?us-ascii?Q?Hqfqb4kKcRvQCx8jl4NOpBWlKjQ625hlJ2B9qqVyp4yn1Oe60wdO00BoyDdi?=
 =?us-ascii?Q?NiaucTgFveFykE/icx8oCFkXnrfOiLLkStMoikwI38MUwidkBMaXdROwW2lK?=
 =?us-ascii?Q?sghnfC2omKRGpfKrcxlLqQg65oPIdgdhtHmaEnKL1NGGycKQEelUPg4E2BTQ?=
 =?us-ascii?Q?QXzDdBEkvSB672VlJ6Ww5MoIaCy4v+Ysq7syIa4eAEmifjfFHPpD03eZGZJY?=
 =?us-ascii?Q?oOgW9UxyQ7NQsdqMYkBMRhIiJGO48Zhh01Heeqag/emtLG27G/WZwCLelsI4?=
 =?us-ascii?Q?5iRAuph6O8ob7/IVRONRD6tU6789ghx+i3XwcMOZ/sVM7Mgumo7XS/9LL3gx?=
 =?us-ascii?Q?9+FF9B+kRpRruCl4cOKsSut/unofdOj1zARzOvoA8SGB1rr1ai4VHzLA/4F8?=
 =?us-ascii?Q?jiRzvnwf/Qx6n7zb1PiK40QYrnL/MZP81EowMyrwHKpdLyA3kMagSo4H8F64?=
 =?us-ascii?Q?HSP4i8oq9TMlF1lNcJYOzrTwoUzf//A5DaAR83us8esPfK9s/gpDz9oY0btL?=
 =?us-ascii?Q?pX1Nn4Vgwpz5qeLfiGr6QlxrkHr6lx5BkrQNYUAoHD1Bpfe1jMgbjLYg2jkj?=
 =?us-ascii?Q?BD4lybVbtZlXNWl/DsRKQ4/nE4vjogmwaxea9S+dDxnXU4z7DnfPNzCAlHto?=
 =?us-ascii?Q?yvrgNMFSw9sV7gFVluELbx9x+Eyz1XNWjWWVYzDRhsL2cVyl9ljCI9VmGSB9?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	m44wJg9f08PpfoQw9XXpJmRR07LzRW9yu7pFFJiVg+zJvLjsj8Gu3g6v1XFa7tLZbG3gAGIrY9rtu6H+//Tw5vgE/QZlWBIsSsrl7YpwoOAZ0bbj7dkenDbo72cVKnDvAuIsCus72RUbHv64nhqNMGDQFuNxJQ21tiFCGv2coeOIz3AuAI7CcQbf711O8KKTHbyiTT8ncSGaXqPcTRm9d0pGWXdJ8+IpgcXDmdl6QZ/SgJoeiiiLh99dP9pAI4ZlecuCdLNt4hfnAhA1vKZl7GxE3rT3QzTwQSimrtIAdL1U7YBUWIurGkXtn78+qf8ZMybV6qS/hDzMYSTwHu27T/xmmr2l98Mn6YhdCJlSsfEBLOd50LgrSQLQP1f43M0/vdR+kua2Au0aW6StxdXpnHcZS1XLPVLIRMwmLrq+NgoyIZbn/FS+OwIr1jwn0nxmxpQEdFNj0g/XPxLRx0wbobMJba6b07cR+4EfcP+1mQANFqo3Gp8uzfKNLQikXE03DeFqvVqAUFaEiCHH8Es8Rxdgvoz8cLGdZhTenSvvU4/5k/tOS4wMcHbIYVKxvZ21OvrkwZWJXnCu0ZFP8g2nKSZZKgpvqf2mD2HSU86L/ws=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb8a947-cbe0-4b25-bf77-08ddb00fc7d5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 15:33:18.1876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3suRGsSmJe4TE2cPfIZNzgidzVh2KBf3u9vCsEoDmGpsmNmRZJpBSC/7I11iZ0QZ2AjZAgQ5K3gII++uWuiJcfL8WqKKVCf2C47o+24veA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5591
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506200110
X-Proofpoint-GUID: 4hs74_Dx2mTbA7ukPPLJLFRfEfI684Oi
X-Proofpoint-ORIG-GUID: 4hs74_Dx2mTbA7ukPPLJLFRfEfI684Oi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMSBTYWx0ZWRfXzlzLMv/FjTIw bXNMR3yWml2f7mVwxOpDx619Dn/T1MEzEjLP6IyndpguXi54L5FlsZWtlfjMs4tSrIANp50lvyJ rZqFOFGno1v5vnpUfx3z/mDBUY3Uy8m6p79+3YyW3JjFiQei919ew6zE9uDACFUJvVN1XKb33oN
 YgVgerbHyisUhWzFs2qTku5omX8TNNHU2VE11Lgm68DkMDh5Mx7j5ujR5USRugC5CufyurMADr+ D1d9U4kau8QnXkPK0GwAJHX69eD807VXVnllf6uPWM6iocDprHYv77aX2p7k9PyADTAHP1OgVG3 /Rqp3nmJR6quL3Bs4Rg0v6TKwQF5VeZnKi9q92vNzC9YqO8JIPbmHpy/WgzVkocj1hkgv39v7/b
 qwd5ofz0C7uHs8tF0mJFmQZ9AWQZ2cXr99oxu/A3YhbL7p2zuXK3ZE1vJim6tRdfp2OjYnKI
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=68557f41 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=Ikd4Dj_1AAAA:8 a=yPCof4ZbAAAA:8 a=eDijRFol0gWCE8jJwDUA:9

Doing so means we can get rid of all the weird struct vm_area_struct **prev
stuff, everything becomes consistent and in future if we want to make
change to behaviour there's a single place where all relevant state is
stored.

This also allows us to update try_vma_read_lock() to be a little more
succinct and set up state for us, as well as cleaning up
madvise_update_vma().

We also update the debug assertion prior to madvise_update_vma() to assert
that this is a write operation as correctly pointed out by Barry in the
relevant thread.

We can't reasonably update the madvise functions that live outside of
mm/madvise.c so we leave those as-is.

Acked-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/madvise.c | 281 ++++++++++++++++++++++++++-------------------------
 1 file changed, 145 insertions(+), 136 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 764a532ff62a..f04b8165e2ab 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -74,6 +74,8 @@ struct madvise_behavior {
 	 * traversing multiple VMAs, this is updated for each.
 	 */
 	struct madvise_behavior_range range;
+	/* The VMA and VMA preceding it (if applicable) currently targeted. */
+	struct vm_area_struct *prev, *vma;
 };
 
 #ifdef CONFIG_ANON_VMA_NAME
@@ -177,26 +179,27 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
  * Caller should ensure anon_name stability by raising its refcount even when
  * anon_name belongs to a valid vma because this function might free that vma.
  */
-static int madvise_update_vma(struct vm_area_struct *vma,
-			      struct vm_area_struct **prev, unsigned long start,
-			      unsigned long end, vm_flags_t new_flags,
-			      struct anon_vma_name *anon_name)
+static int madvise_update_vma(vm_flags_t new_flags,
+		struct madvise_behavior *madv_behavior)
 {
-	struct mm_struct *mm = vma->vm_mm;
 	int error;
-	VMA_ITERATOR(vmi, mm, start);
+	struct vm_area_struct *vma = madv_behavior->vma;
+	struct madvise_behavior_range *range = &madv_behavior->range;
+	struct anon_vma_name *anon_name = madv_behavior->anon_name;
+	VMA_ITERATOR(vmi, madv_behavior->mm, range->start);
 
 	if (new_flags == vma->vm_flags && anon_vma_name_eq(anon_vma_name(vma), anon_name)) {
-		*prev = vma;
+		madv_behavior->prev = vma;
 		return 0;
 	}
 
-	vma = vma_modify_flags_name(&vmi, *prev, vma, start, end, new_flags,
-				    anon_name);
+	vma = vma_modify_flags_name(&vmi, madv_behavior->prev, vma,
+			range->start, range->end, new_flags, anon_name);
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
 
-	*prev = vma;
+	madv_behavior->vma = vma;
+	madv_behavior->prev = vma;
 
 	/* vm_flags is protected by the mmap_lock held in write mode. */
 	vma_start_write(vma);
@@ -301,15 +304,16 @@ static void shmem_swapin_range(struct vm_area_struct *vma,
 /*
  * Schedule all required I/O operations.  Do not wait for completion.
  */
-static long madvise_willneed(struct vm_area_struct *vma,
-			     struct vm_area_struct **prev,
-			     unsigned long start, unsigned long end)
+static long madvise_willneed(struct madvise_behavior *madv_behavior)
 {
-	struct mm_struct *mm = vma->vm_mm;
+	struct vm_area_struct *vma = madv_behavior->vma;
+	struct mm_struct *mm = madv_behavior->mm;
 	struct file *file = vma->vm_file;
+	unsigned long start = madv_behavior->range.start;
+	unsigned long end = madv_behavior->range.end;
 	loff_t offset;
 
-	*prev = vma;
+	madv_behavior->prev = vma;
 #ifdef CONFIG_SWAP
 	if (!file) {
 		walk_page_range_vma(vma, start, end, &swapin_walk_ops, vma);
@@ -338,7 +342,7 @@ static long madvise_willneed(struct vm_area_struct *vma,
 	 * vma's reference to the file) can go away as soon as we drop
 	 * mmap_lock.
 	 */
-	*prev = NULL;	/* tell sys_madvise we drop mmap_lock */
+	madv_behavior->prev = NULL;	/* tell sys_madvise we drop mmap_lock */
 	get_file(file);
 	offset = (loff_t)(start - vma->vm_start)
 			+ ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
@@ -603,16 +607,19 @@ static const struct mm_walk_ops cold_walk_ops = {
 };
 
 static void madvise_cold_page_range(struct mmu_gather *tlb,
-			     struct vm_area_struct *vma,
-			     unsigned long addr, unsigned long end)
+		struct madvise_behavior *madv_behavior)
+
 {
+	struct vm_area_struct *vma = madv_behavior->vma;
+	struct madvise_behavior_range *range = &madv_behavior->range;
 	struct madvise_walk_private walk_private = {
 		.pageout = false,
 		.tlb = tlb,
 	};
 
 	tlb_start_vma(tlb, vma);
-	walk_page_range_vma(vma, addr, end, &cold_walk_ops, &walk_private);
+	walk_page_range_vma(vma, range->start, range->end, &cold_walk_ops,
+			&walk_private);
 	tlb_end_vma(tlb, vma);
 }
 
@@ -621,28 +628,26 @@ static inline bool can_madv_lru_vma(struct vm_area_struct *vma)
 	return !(vma->vm_flags & (VM_LOCKED|VM_PFNMAP|VM_HUGETLB));
 }
 
-static long madvise_cold(struct vm_area_struct *vma,
-			struct vm_area_struct **prev,
-			unsigned long start_addr, unsigned long end_addr)
+static long madvise_cold(struct madvise_behavior *madv_behavior)
 {
-	struct mm_struct *mm = vma->vm_mm;
+	struct vm_area_struct *vma = madv_behavior->vma;
 	struct mmu_gather tlb;
 
-	*prev = vma;
+	madv_behavior->prev = vma;
 	if (!can_madv_lru_vma(vma))
 		return -EINVAL;
 
 	lru_add_drain();
-	tlb_gather_mmu(&tlb, mm);
-	madvise_cold_page_range(&tlb, vma, start_addr, end_addr);
+	tlb_gather_mmu(&tlb, madv_behavior->mm);
+	madvise_cold_page_range(&tlb, madv_behavior);
 	tlb_finish_mmu(&tlb);
 
 	return 0;
 }
 
 static void madvise_pageout_page_range(struct mmu_gather *tlb,
-			     struct vm_area_struct *vma,
-			     unsigned long addr, unsigned long end)
+		struct vm_area_struct *vma,
+		struct madvise_behavior_range *range)
 {
 	struct madvise_walk_private walk_private = {
 		.pageout = true,
@@ -650,18 +655,17 @@ static void madvise_pageout_page_range(struct mmu_gather *tlb,
 	};
 
 	tlb_start_vma(tlb, vma);
-	walk_page_range_vma(vma, addr, end, &cold_walk_ops, &walk_private);
+	walk_page_range_vma(vma, range->start, range->end, &cold_walk_ops,
+			    &walk_private);
 	tlb_end_vma(tlb, vma);
 }
 
-static long madvise_pageout(struct vm_area_struct *vma,
-			struct vm_area_struct **prev,
-			unsigned long start_addr, unsigned long end_addr)
+static long madvise_pageout(struct madvise_behavior *madv_behavior)
 {
-	struct mm_struct *mm = vma->vm_mm;
 	struct mmu_gather tlb;
+	struct vm_area_struct *vma = madv_behavior->vma;
 
-	*prev = vma;
+	madv_behavior->prev = vma;
 	if (!can_madv_lru_vma(vma))
 		return -EINVAL;
 
@@ -676,8 +680,8 @@ static long madvise_pageout(struct vm_area_struct *vma,
 		return 0;
 
 	lru_add_drain();
-	tlb_gather_mmu(&tlb, mm);
-	madvise_pageout_page_range(&tlb, vma, start_addr, end_addr);
+	tlb_gather_mmu(&tlb, madv_behavior->mm);
+	madvise_pageout_page_range(&tlb, vma, &madv_behavior->range);
 	tlb_finish_mmu(&tlb);
 
 	return 0;
@@ -840,11 +844,12 @@ static inline enum page_walk_lock get_walk_lock(enum madvise_lock_mode mode)
 	}
 }
 
-static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
-			struct vm_area_struct *vma,
-			unsigned long start_addr, unsigned long end_addr)
+static int madvise_free_single_vma(struct madvise_behavior *madv_behavior)
 {
-	struct mm_struct *mm = vma->vm_mm;
+	struct mm_struct *mm = madv_behavior->mm;
+	struct vm_area_struct *vma = madv_behavior->vma;
+	unsigned long start_addr = madv_behavior->range.start;
+	unsigned long end_addr = madv_behavior->range.end;
 	struct mmu_notifier_range range;
 	struct mmu_gather *tlb = madv_behavior->tlb;
 	struct mm_walk_ops walk_ops = {
@@ -896,25 +901,28 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
  * An interface that causes the system to free clean pages and flush
  * dirty pages is already available as msync(MS_INVALIDATE).
  */
-static long madvise_dontneed_single_vma(struct madvise_behavior *madv_behavior,
-					struct vm_area_struct *vma,
-					unsigned long start, unsigned long end)
+static long madvise_dontneed_single_vma(struct madvise_behavior *madv_behavior)
+
 {
+	struct madvise_behavior_range *range = &madv_behavior->range;
 	struct zap_details details = {
 		.reclaim_pt = true,
 		.even_cows = true,
 	};
 
 	zap_page_range_single_batched(
-			madv_behavior->tlb, vma, start, end - start, &details);
+			madv_behavior->tlb, madv_behavior->vma, range->start,
+			range->end - range->start, &details);
 	return 0;
 }
 
-static bool madvise_dontneed_free_valid_vma(struct vm_area_struct *vma,
-					    unsigned long start,
-					    unsigned long *end,
-					    int behavior)
+static
+bool madvise_dontneed_free_valid_vma(struct madvise_behavior *madv_behavior)
 {
+	struct vm_area_struct *vma = madv_behavior->vma;
+	int behavior = madv_behavior->behavior;
+	struct madvise_behavior_range *range = &madv_behavior->range;
+
 	if (!is_vm_hugetlb_page(vma)) {
 		unsigned int forbidden = VM_PFNMAP;
 
@@ -926,7 +934,7 @@ static bool madvise_dontneed_free_valid_vma(struct vm_area_struct *vma,
 
 	if (behavior != MADV_DONTNEED && behavior != MADV_DONTNEED_LOCKED)
 		return false;
-	if (start & ~huge_page_mask(hstate_vma(vma)))
+	if (range->start & ~huge_page_mask(hstate_vma(vma)))
 		return false;
 
 	/*
@@ -935,41 +943,40 @@ static bool madvise_dontneed_free_valid_vma(struct vm_area_struct *vma,
 	 * Avoid unexpected data loss by rounding down the number of
 	 * huge pages freed.
 	 */
-	*end = ALIGN_DOWN(*end, huge_page_size(hstate_vma(vma)));
+	range->end = ALIGN_DOWN(range->end, huge_page_size(hstate_vma(vma)));
 
 	return true;
 }
 
-static long madvise_dontneed_free(struct vm_area_struct *vma,
-				  struct vm_area_struct **prev,
-				  unsigned long start, unsigned long end,
-				  struct madvise_behavior *madv_behavior)
+static long madvise_dontneed_free(struct madvise_behavior *madv_behavior)
 {
+	struct mm_struct *mm = madv_behavior->mm;
+	struct madvise_behavior_range *range = &madv_behavior->range;
 	int behavior = madv_behavior->behavior;
-	struct mm_struct *mm = vma->vm_mm;
 
-	*prev = vma;
-	if (!madvise_dontneed_free_valid_vma(vma, start, &end, behavior))
+	madv_behavior->prev = madv_behavior->vma;
+	if (!madvise_dontneed_free_valid_vma(madv_behavior))
 		return -EINVAL;
 
-	if (start == end)
+	if (range->start == range->end)
 		return 0;
 
-	if (!userfaultfd_remove(vma, start, end)) {
-		*prev = NULL; /* mmap_lock has been dropped, prev is stale */
+	if (!userfaultfd_remove(madv_behavior->vma, range->start, range->end)) {
+		struct vm_area_struct *vma;
+
+		madv_behavior->prev = NULL; /* mmap_lock has been dropped, prev is stale */
 
 		mmap_read_lock(mm);
-		vma = vma_lookup(mm, start);
+		madv_behavior->vma = vma = vma_lookup(mm, range->start);
 		if (!vma)
 			return -ENOMEM;
 		/*
 		 * Potential end adjustment for hugetlb vma is OK as
 		 * the check below keeps end within vma.
 		 */
-		if (!madvise_dontneed_free_valid_vma(vma, start, &end,
-						     behavior))
+		if (!madvise_dontneed_free_valid_vma(madv_behavior))
 			return -EINVAL;
-		if (end > vma->vm_end) {
+		if (range->end > vma->vm_end) {
 			/*
 			 * Don't fail if end > vma->vm_end. If the old
 			 * vma was split while the mmap_lock was
@@ -982,7 +989,7 @@ static long madvise_dontneed_free(struct vm_area_struct *vma,
 			 * end-vma->vm_end range, but the manager can
 			 * handle a repetition fine.
 			 */
-			end = vma->vm_end;
+			range->end = vma->vm_end;
 		}
 		/*
 		 * If the memory region between start and end was
@@ -991,16 +998,15 @@ static long madvise_dontneed_free(struct vm_area_struct *vma,
 		 * the adjustment for hugetlb vma above may have rounded
 		 * end down to the start address.
 		 */
-		if (start == end)
+		if (range->start == range->end)
 			return 0;
-		VM_WARN_ON(start > end);
+		VM_WARN_ON(range->start > range->end);
 	}
 
 	if (behavior == MADV_DONTNEED || behavior == MADV_DONTNEED_LOCKED)
-		return madvise_dontneed_single_vma(
-				madv_behavior, vma, start, end);
+		return madvise_dontneed_single_vma(madv_behavior);
 	else if (behavior == MADV_FREE)
-		return madvise_free_single_vma(madv_behavior, vma, start, end);
+		return madvise_free_single_vma(madv_behavior);
 	else
 		return -EINVAL;
 }
@@ -1048,16 +1054,17 @@ static long madvise_populate(struct madvise_behavior *madv_behavior)
  * Application wants to free up the pages and associated backing store.
  * This is effectively punching a hole into the middle of a file.
  */
-static long madvise_remove(struct vm_area_struct *vma,
-				struct vm_area_struct **prev,
-				unsigned long start, unsigned long end)
+static long madvise_remove(struct madvise_behavior *madv_behavior)
 {
 	loff_t offset;
 	int error;
 	struct file *f;
-	struct mm_struct *mm = vma->vm_mm;
+	struct mm_struct *mm = madv_behavior->mm;
+	struct vm_area_struct *vma = madv_behavior->vma;
+	unsigned long start = madv_behavior->range.start;
+	unsigned long end = madv_behavior->range.end;
 
-	*prev = NULL;	/* tell sys_madvise we drop mmap_lock */
+	madv_behavior->prev = NULL; /* tell sys_madvise we drop mmap_lock */
 
 	if (vma->vm_flags & VM_LOCKED)
 		return -EINVAL;
@@ -1169,14 +1176,14 @@ static const struct mm_walk_ops guard_install_walk_ops = {
 	.walk_lock		= PGWALK_RDLOCK,
 };
 
-static long madvise_guard_install(struct vm_area_struct *vma,
-				 struct vm_area_struct **prev,
-				 unsigned long start, unsigned long end)
+static long madvise_guard_install(struct madvise_behavior *madv_behavior)
 {
+	struct vm_area_struct *vma = madv_behavior->vma;
+	struct madvise_behavior_range *range = &madv_behavior->range;
 	long err;
 	int i;
 
-	*prev = vma;
+	madv_behavior->prev = vma;
 	if (!is_valid_guard_vma(vma, /* allow_locked = */false))
 		return -EINVAL;
 
@@ -1207,13 +1214,14 @@ static long madvise_guard_install(struct vm_area_struct *vma,
 		unsigned long nr_pages = 0;
 
 		/* Returns < 0 on error, == 0 if success, > 0 if zap needed. */
-		err = walk_page_range_mm(vma->vm_mm, start, end,
+		err = walk_page_range_mm(vma->vm_mm, range->start, range->end,
 					 &guard_install_walk_ops, &nr_pages);
 		if (err < 0)
 			return err;
 
 		if (err == 0) {
-			unsigned long nr_expected_pages = PHYS_PFN(end - start);
+			unsigned long nr_expected_pages =
+				PHYS_PFN(range->end - range->start);
 
 			VM_WARN_ON(nr_pages != nr_expected_pages);
 			return 0;
@@ -1223,7 +1231,8 @@ static long madvise_guard_install(struct vm_area_struct *vma,
 		 * OK some of the range have non-guard pages mapped, zap
 		 * them. This leaves existing guard pages in place.
 		 */
-		zap_page_range_single(vma, start, end - start, NULL);
+		zap_page_range_single(vma, range->start,
+				range->end - range->start, NULL);
 	}
 
 	/*
@@ -1279,11 +1288,12 @@ static const struct mm_walk_ops guard_remove_walk_ops = {
 	.walk_lock		= PGWALK_RDLOCK,
 };
 
-static long madvise_guard_remove(struct vm_area_struct *vma,
-				 struct vm_area_struct **prev,
-				 unsigned long start, unsigned long end)
+static long madvise_guard_remove(struct madvise_behavior *madv_behavior)
 {
-	*prev = vma;
+	struct vm_area_struct *vma = madv_behavior->vma;
+	struct madvise_behavior_range *range = &madv_behavior->range;
+
+	madv_behavior->prev = vma;
 	/*
 	 * We're ok with removing guards in mlock()'d ranges, as this is a
 	 * non-destructive action.
@@ -1291,7 +1301,7 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
 	if (!is_valid_guard_vma(vma, /* allow_locked = */true))
 		return -EINVAL;
 
-	return walk_page_range_vma(vma, start, end,
+	return walk_page_range_vma(vma, range->start, range->end,
 			       &guard_remove_walk_ops, NULL);
 }
 
@@ -1300,41 +1310,38 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
  * will handle splitting a vm area into separate areas, each area with its own
  * behavior.
  */
-static int madvise_vma_behavior(struct vm_area_struct *vma,
-				struct vm_area_struct **prev,
-				struct madvise_behavior *madv_behavior)
+static int madvise_vma_behavior(struct madvise_behavior *madv_behavior)
 {
 	int behavior = madv_behavior->behavior;
-	struct anon_vma_name *anon_name = madv_behavior->anon_name;
+	struct vm_area_struct *vma = madv_behavior->vma;
 	vm_flags_t new_flags = vma->vm_flags;
-	unsigned long start = madv_behavior->range.start;
-	unsigned long end = madv_behavior->range.end;
 	bool set_new_anon_name = behavior == __MADV_SET_ANON_VMA_NAME;
+	struct madvise_behavior_range *range = &madv_behavior->range;
 	int error;
 
-	if (unlikely(!can_modify_vma_madv(vma, behavior)))
+	if (unlikely(!can_modify_vma_madv(madv_behavior->vma, behavior)))
 		return -EPERM;
 
 	switch (behavior) {
 	case MADV_REMOVE:
-		return madvise_remove(vma, prev, start, end);
+		return madvise_remove(madv_behavior);
 	case MADV_WILLNEED:
-		return madvise_willneed(vma, prev, start, end);
+		return madvise_willneed(madv_behavior);
 	case MADV_COLD:
-		return madvise_cold(vma, prev, start, end);
+		return madvise_cold(madv_behavior);
 	case MADV_PAGEOUT:
-		return madvise_pageout(vma, prev, start, end);
+		return madvise_pageout(madv_behavior);
 	case MADV_FREE:
 	case MADV_DONTNEED:
 	case MADV_DONTNEED_LOCKED:
-		return madvise_dontneed_free(vma, prev, start, end,
-					     madv_behavior);
+		return madvise_dontneed_free(madv_behavior);
 	case MADV_COLLAPSE:
-		return madvise_collapse(vma, prev, start, end);
+		return madvise_collapse(vma, &madv_behavior->prev,
+					range->start, range->end);
 	case MADV_GUARD_INSTALL:
-		return madvise_guard_install(vma, prev, start, end);
+		return madvise_guard_install(madv_behavior);
 	case MADV_GUARD_REMOVE:
-		return madvise_guard_remove(vma, prev, start, end);
+		return madvise_guard_remove(madv_behavior);
 
 	/* The below behaviours update VMAs via madvise_update_vma(). */
 
@@ -1351,18 +1358,18 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
 		new_flags |= VM_DONTCOPY;
 		break;
 	case MADV_DOFORK:
-		if (vma->vm_flags & VM_IO)
+		if (new_flags & VM_IO)
 			return -EINVAL;
 		new_flags &= ~VM_DONTCOPY;
 		break;
 	case MADV_WIPEONFORK:
 		/* MADV_WIPEONFORK is only supported on anonymous memory. */
-		if (vma->vm_file || vma->vm_flags & VM_SHARED)
+		if (vma->vm_file || new_flags & VM_SHARED)
 			return -EINVAL;
 		new_flags |= VM_WIPEONFORK;
 		break;
 	case MADV_KEEPONFORK:
-		if (vma->vm_flags & VM_DROPPABLE)
+		if (new_flags & VM_DROPPABLE)
 			return -EINVAL;
 		new_flags &= ~VM_WIPEONFORK;
 		break;
@@ -1370,14 +1377,15 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
 		new_flags |= VM_DONTDUMP;
 		break;
 	case MADV_DODUMP:
-		if ((!is_vm_hugetlb_page(vma) && new_flags & VM_SPECIAL) ||
-		    (vma->vm_flags & VM_DROPPABLE))
+		if ((!is_vm_hugetlb_page(vma) && (new_flags & VM_SPECIAL)) ||
+		    (new_flags & VM_DROPPABLE))
 			return -EINVAL;
 		new_flags &= ~VM_DONTDUMP;
 		break;
 	case MADV_MERGEABLE:
 	case MADV_UNMERGEABLE:
-		error = ksm_madvise(vma, start, end, behavior, &new_flags);
+		error = ksm_madvise(vma, range->start, range->end,
+				behavior, &new_flags);
 		if (error)
 			goto out;
 		break;
@@ -1394,8 +1402,8 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
 		break;
 	}
 
-	/* We cannot provide prev in this lock mode. */
-	VM_WARN_ON_ONCE(madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK);
+	/* This is a write operation.*/
+	VM_WARN_ON_ONCE(madv_behavior->lock_mode != MADVISE_MMAP_WRITE_LOCK);
 
 	/*
 	 * madvise_update_vma() might cause a VMA merge which could put an
@@ -1403,14 +1411,12 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
 	 * anon_vma_name so it doesn't disappear from under us.
 	 */
 	if (!set_new_anon_name) {
-		anon_name = anon_vma_name(vma);
-		anon_vma_name_get(anon_name);
+		madv_behavior->anon_name = anon_vma_name(vma);
+		anon_vma_name_get(madv_behavior->anon_name);
 	}
-	error = madvise_update_vma(vma, prev, start, end, new_flags,
-				   anon_name);
+	error = madvise_update_vma(new_flags, madv_behavior);
 	if (!set_new_anon_name)
-		anon_vma_name_put(anon_name);
-
+		anon_vma_name_put(madv_behavior->anon_name);
 out:
 	/*
 	 * madvise() returns EAGAIN if kernel resources, such as
@@ -1560,13 +1566,13 @@ static bool process_madvise_remote_valid(int behavior)
  * span either partially or fully.
  *
  * This function always returns with an appropriate lock held. If a VMA read
- * lock could be acquired, we return the locked VMA.
+ * lock could be acquired, we return true and set madv_behavior state
+ * accordingly.
  *
- * If a VMA read lock could not be acquired, we return NULL and expect caller to
+ * If a VMA read lock could not be acquired, we return false and expect caller to
  * fallback to mmap lock behaviour.
  */
-static
-struct vm_area_struct *try_vma_read_lock(struct madvise_behavior *madv_behavior)
+static bool try_vma_read_lock(struct madvise_behavior *madv_behavior)
 {
 	struct mm_struct *mm = madv_behavior->mm;
 	struct vm_area_struct *vma;
@@ -1583,12 +1589,14 @@ struct vm_area_struct *try_vma_read_lock(struct madvise_behavior *madv_behavior)
 		vma_end_read(vma);
 		goto take_mmap_read_lock;
 	}
-	return vma;
+	madv_behavior->prev = vma; /* Not currently required. */
+	madv_behavior->vma = vma;
+	return true;
 
 take_mmap_read_lock:
 	mmap_read_lock(mm);
 	madv_behavior->lock_mode = MADVISE_MMAP_READ_LOCK;
-	return NULL;
+	return false;
 }
 
 /*
@@ -1607,23 +1615,19 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
 	struct madvise_behavior_range *range = &madv_behavior->range;
 	/* range is updated to span each VMA, so store end of entire range. */
 	unsigned long last_end = range->end;
-	struct vm_area_struct *vma;
-	struct vm_area_struct *prev;
 	int unmapped_error = 0;
 	int error;
+	struct vm_area_struct *vma;
 
 	/*
 	 * If VMA read lock is supported, apply madvise to a single VMA
 	 * tentatively, avoiding walking VMAs.
 	 */
-	if (madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
-		vma = try_vma_read_lock(madv_behavior);
-		if (vma) {
-			prev = vma;
-			error = madvise_vma_behavior(vma, &prev, madv_behavior);
-			vma_end_read(vma);
-			return error;
-		}
+	if (madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK &&
+	    try_vma_read_lock(madv_behavior)) {
+		error = madvise_vma_behavior(madv_behavior);
+		vma_end_read(madv_behavior->vma);
+		return error;
 	}
 
 	/*
@@ -1631,11 +1635,13 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
 	 * ranges, just ignore them, but return -ENOMEM at the end.
 	 * - different from the way of handling in mlock etc.
 	 */
-	vma = find_vma_prev(mm, range->start, &prev);
+	vma = find_vma_prev(mm, range->start, &madv_behavior->prev);
 	if (vma && range->start > vma->vm_start)
-		prev = vma;
+		madv_behavior->prev = vma;
 
 	for (;;) {
+		struct vm_area_struct *prev;
+
 		/* Still start < end. */
 		if (!vma)
 			return -ENOMEM;
@@ -1652,9 +1658,12 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
 		range->end = min(vma->vm_end, last_end);
 
 		/* Here vma->vm_start <= range->start < range->end <= (last_end|vma->vm_end). */
-		error = madvise_vma_behavior(vma, &prev, madv_behavior);
+		madv_behavior->vma = vma;
+		error = madvise_vma_behavior(madv_behavior);
 		if (error)
 			return error;
+		prev = madv_behavior->prev;
+
 		range->start = range->end;
 		if (prev && range->start < prev->vm_end)
 			range->start = prev->vm_end;
-- 
2.49.0


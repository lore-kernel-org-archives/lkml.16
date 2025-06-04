Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBA02820C1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749027264; cv=fail; b=bPYF5cKwKwu7o+h+RX3aeFxYkh3Dd5h9kXf31MTlnot0c0QXHHYWHFIf6foLrPPdNVSNeUiO/Qa8Aa1B6m0/WsIIvWIwHAcil6SD6MKl+ehuZdww3OMJbLUBQa+FziEMkjsc1+rCWEM3LsExAGmXwvRxxZunuWpr/9mlRI/J6Nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749027264; c=relaxed/simple;
	bh=IJSqb40CQZL3G16ghcbEFs/H1ypnpl6+RS/uQ9TWDD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uULy3stfzzPYhMbmCGYZumQoNS/prJkvTAFga5weqQlS/O3B8RyjeHJuvvt2vAhrzaZKOKK4E7iQcm6dgDlvAGEaZb9FwrvBy0lPLqADM/zypN5y58Q450x2YuEjLeKUeKAzNkASMFSEltJRf7Rs1+t1tRBmv1O0dxKrZS0/weU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kEPeIGhl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zkWf2984; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kEPeIGhl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zkWf2984"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5548fwjD016659;
	Wed, 4 Jun 2025 08:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=JpwTMK41ExUu0DXFUA
	j62JWphPtJlQ/4Kqbt8+OLBD8=; b=kEPeIGhl3P2EDYnSm/Pb/v37CAvrmmxLqL
	aP8NcbTu1KZH3o8v+P7yzYRvYWEE3mcnjCLoQk9peRcm+bXZOyGReWkXRlqs9Fu4
	YUo7jq3oMe6rBgJsJqP0fhQhSVZZO/Di1X0XADPw3ODY6SfO6SZ+rKoazjYLZvG6
	xw+dShSJV9iBuy5H+TBQo9+Ey6utTPEph9Vx+2kPQuc+qnoq2Z4+VQNk1OCC8OYH
	QKgzixoRC44MsxmNgNyVH0U9/V2moIUbmtV70mSX6cY1csp15DThIFY8Kdu0ATks
	BwLelPI6CaNWL8lQZe5y4+Esa66wtIS8pWTPZYpFqqpqRpote9wg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8bkgbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 08:53:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5547GSpP016388;
	Wed, 4 Jun 2025 08:53:57 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2070.outbound.protection.outlook.com [40.107.212.70])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7agh8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 08:53:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1NaSRaW5qsjpQEIt78+Rq+5RYAz+en0t7T8jeF9nzlfKWbADq29sAZVU9qBXY1vi4Namha1P+eatTYpA7cVFUDBVHAnLGL2GGoU2K7d2zBZiZ2MPELERwRJiGgwijDIM/QBLLr2pTnySDXqViW/ojtorbn5zEGj2kSYGH3rMSf5t1jWJsjiimdgBICONYWnsb3SeKK4d8LACBP8UYyg8psLVOPc6uQNHVrvzyuGEAPiNPxhkio/O68g48RpJJqNBeGVmEstWW9m7CEvtHEtLnqx87/TRj5WVEjzixFGCcmFsXo5BImOJApjug3NJ0Y04QXCeeTmptUPDZ6glwEegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpwTMK41ExUu0DXFUAj62JWphPtJlQ/4Kqbt8+OLBD8=;
 b=IwBHbaNgDt/j/3JStZcA2Ggb6m9slslf+1RdHgujUjVRlHCN0xoKpN98RXenqV80gFucR6T48aBS5G7dBQDhZErya0nNfcZxkzhAsDwoBkK1mjLWh3KOzq9k+mWQoLxYdj1mqrGNOyiCW5jKoLnhMnsyDtP+XSYYAkzdluNVBxnUNTROAqNB7QPnPFKN8zr69PdvWxI49xgVRMQA6rQWyGY8Or42uL76wwotx4oFW+QAaEetTZYdMrV3nOceVKAN9ORQ2ZBg1qbesgQPCa5kfGoIVBjeG6Qppxi6ol6AFgwrpBKqy6wUf2jmTlNG4o/1/v6ofyKTtD49pIVGYsuukw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpwTMK41ExUu0DXFUAj62JWphPtJlQ/4Kqbt8+OLBD8=;
 b=zkWf2984MPGyBk4EOvXXKY2HveNdVh1sLAddB0dtimjXMSMReRbH8v801WsRz280hooqRw0/1rM1h5BDiNL4AA0NhrztL1IyNoR0skMaWun1nau6KIUsS4O5u/7dcvGwyt6YTAmxr9+tOsBv35vCgaZlYQvQWbRr/6RHyfbsoHM=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by PH0PR10MB4662.namprd10.prod.outlook.com (2603:10b6:510:38::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Wed, 4 Jun
 2025 08:53:54 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8746.035; Wed, 4 Jun 2025
 08:53:54 +0000
Date: Wed, 4 Jun 2025 17:53:41 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm, slab: restore NUMA policy support for large
 kmalloc
Message-ID: <aEAJlbJ9FP3e0DEh@hyeyoo>
References: <20250602-frozen-pages-for-large-kmalloc-v2-0-84a21f2c3640@suse.cz>
 <20250602-frozen-pages-for-large-kmalloc-v2-1-84a21f2c3640@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602-frozen-pages-for-large-kmalloc-v2-1-84a21f2c3640@suse.cz>
X-ClientProxiedBy: SEWP216CA0048.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::17) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|PH0PR10MB4662:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0ff0ef-aacc-4962-7f1f-08dda3455576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ozKyLBe3PiNsa37XQS9jiG80yoNnWmphQhvOF6aKDSvk/g2SEz6d5LlUulbj?=
 =?us-ascii?Q?3IFqq2nU5XkIBx9iRVGKF95uzbqiCuATkCsYgEfi7KyB5Pv+GjOWG0XWCezR?=
 =?us-ascii?Q?hTttM2IyH1vwjzkM5j1JR6/Ms9dUYuyTO/EnqhnhIXIkmyzNiKQpGm3cR2Kt?=
 =?us-ascii?Q?o/tDwyZdIp/uN2UBrEzQeRjYGtLWP/zNRb1zuIg+OPErDJpIWdMCWQjM1v7U?=
 =?us-ascii?Q?wewHZ4SRQXfWxmm+Fy3xMld/oABjdW5+Er8OLnzLJ+JRZL08UhR+GWHlnsn6?=
 =?us-ascii?Q?TjBNqTQb/hdeqX4edboxVZG4bimFaEXSKYRzrFeuUNdr9bGXOoXP64V4Ycpn?=
 =?us-ascii?Q?NNaWmwQeUTV/QgID8UZqQOii0i6o14VOx+C8iQjlT1+aQHKGsqGbJpuexleB?=
 =?us-ascii?Q?sco3WNZXJHXd9TS27T21YzJ4dtvA3tyKoB81KY8zJ4m1j6GhyIWb0+e3KnEL?=
 =?us-ascii?Q?4YM2DJOBlXUoINARR6fu+wli+Y+Pztl0taCA9ucxk1nc3rjA7zZBvbhIUAk2?=
 =?us-ascii?Q?hJWRpzW7rrbMjiE1oHElircNiA0XdjbVJCv5zaAppCPF1q1qCY69KA25cqJT?=
 =?us-ascii?Q?l0jIENyBfJDAlwKisqZEblUeJIQAWtwrtf2ovKkz4EskaBYjh86MTArkOba0?=
 =?us-ascii?Q?qdJJKB6EYWyEBPgKZRH2oGEfnPYl5vn4/vDXjOvX2BSVwTGdt0vTQKKl5ixJ?=
 =?us-ascii?Q?fAD6egmT/bK0xBIKg7QNhu27gLlajnTcdetVbqdEfnBesfv+BDNny7q55Eh3?=
 =?us-ascii?Q?OhERu1kr1HXKMEXa1btbNZETpob0BOGtHs01+k7pBbi+uyCIVLoLsGMsCN/S?=
 =?us-ascii?Q?4N6YNAshhWlIcF4UvTZ3D9ilONnmLixfLZFzOILYDaHCkJKD2zo75N4v5fBC?=
 =?us-ascii?Q?OMtzc8HQKwqKsYBQdtjy2ARKk/3qbeXg7swoFz84rngcB2pyrC0XapHJz4w2?=
 =?us-ascii?Q?OwHspbnNyBiJ47vqVf2EDdagMmq2PkgksGwuirC9+GUfL/eZRHAPl1C2HZ7H?=
 =?us-ascii?Q?LS1dJxjPOlt4g8AANM9phLjEsO1455PDk1KlI26QT60y5Nq7kM1dSi2rTCLq?=
 =?us-ascii?Q?t8SQsV4GPnwqI4g7k7LodA0r9PtS1BjuH22HSO4B97Dpyuo3ci1JWDp5gtxL?=
 =?us-ascii?Q?k01B1Q5b12blWcieYS6FbqEdFdIAHfefZ75fjAhhU8985vWq4LGkpgq/RlBs?=
 =?us-ascii?Q?neoffV8hzZQjJowyQWBVJ+M91361JBwwbKNharD4WVRtmJ1rEmuECA9f3fcW?=
 =?us-ascii?Q?yJfQHt2xIR5BVvjJ4LnjPBU6OGdML279uSex3ZfPx5MCB+uGVhol+NGCrPr1?=
 =?us-ascii?Q?pTsD3b4EO4iKTt0ERaQiOYmGvyrT/EbzRqGe01QMgsgDFZ9bld4IakNvEXyd?=
 =?us-ascii?Q?07y8XQPYTUPy7D6VWW9xpX6qHTQHPhAW3rh4FGyiBr8RNe5f2A9MWkNHmBsg?=
 =?us-ascii?Q?v4qZkeOvIvQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K+0HpHiuLaFt8ZEwzSrVt/mhRObG5RQJPhgX49qI5u2o/MehqvQCQKX8MzHj?=
 =?us-ascii?Q?WVYmYYQ1tSGA1KEvVzU5FG/fp09lyg4o1axSyvlytEseIzdVpuUFkvK0ZPXp?=
 =?us-ascii?Q?XCFYMTeAtV/9YvFP7CXrlaCbdjKcI18CFbQEiG5JsLTOkLnvsL5fs5IhPaQT?=
 =?us-ascii?Q?0tAYuTOtKs59xtoLs5qhQ03YRw/B+t1IZk908wyW8IU+I/gsAztlW1l64bIJ?=
 =?us-ascii?Q?2+QhJBXvA/f2ktQKoe8Lxcyu0lD9PH3jwa/FVBpEufutqEN/9KJ26QjZvHIY?=
 =?us-ascii?Q?wn6ZNVRt1fSgQcvJS4l3fGvwuJL4POIDerYiS0F7wdwBi3Ez7Rrpia6DYT8W?=
 =?us-ascii?Q?LNOuh4Q0tM2WAxj0fIJD1uUuI8PXszQkbtGWBGCvrGn80aD1Dzq6AAf1Kjlj?=
 =?us-ascii?Q?V1xBhU9we9VXSxpPyMkocEKybwX+QTMTMWeUb6qW0SwgoSwCSYRtxdW7erOp?=
 =?us-ascii?Q?7IgZplKbd6ac2/qp/70xTfF5OI1IoEXWtYFPEeDGQop4rBE7l7EyMa5bn+Zb?=
 =?us-ascii?Q?0WRvy+tCtP1puzA/VQE8rfYtMtBJBh1dHK4G3/tjoYYbee1tzuIQYi4Sbp9F?=
 =?us-ascii?Q?0V0elEp/521xAICqCpAcHQGlla304XdLTl1JebJgWGIqW/lAYNZ9qoqiyvMz?=
 =?us-ascii?Q?YIwCirtoquh6m6YFMQZkU3RLYPS9yc/tEWiLHCDLpjKzVjKsw7McvceHFx/p?=
 =?us-ascii?Q?PueugCQqeN2uGeqNjuLf6lSkvXet9MszCtEqtCAFwkjF5NMFHaQjB46vtgFx?=
 =?us-ascii?Q?7+MY7cbDUo1aoh8zMH/jVMUgqQ/jfJZWo7++Tc71IW52S7+z4x7rmQzo+ey5?=
 =?us-ascii?Q?MVJ1199XGiu9DlBGB435yVPcvgUoZltDbSx7gt0CMgAQ7FJoRZxtxKG+qM0P?=
 =?us-ascii?Q?SYA2nQTJOC7x2eHOtHnRtYZJMD1rsE/VARePV/fdX+zgJ8JsD8Nfi8CRvNlu?=
 =?us-ascii?Q?tQAZ7LB2gQZQoApT0aIYm4FqfRb3fXbI2b11gt5L6bXBxqLl+QrqZ1aHL+uR?=
 =?us-ascii?Q?mA1KRumutP+R7ga2gixuwtn2rq7a+QTB/t30YJ1S48EGh1552DLaCODROZi/?=
 =?us-ascii?Q?wPQOEcpUvzBElaOcNmJUNEDCzxQalYyGPUvYm1ZP9UFRZsHUcAlQFETkuZWV?=
 =?us-ascii?Q?xwGNwI91ABNSNozATZ10AXg4JzafoYnScbnky6BkMjEFGPNNfpLPujoACQSR?=
 =?us-ascii?Q?bGzjohLQZVyEvuhS+lQqlQQMZIGRnVVDzsacon4IrAAR0nk1RBIPOdQxE4Gz?=
 =?us-ascii?Q?E+HPL1lybxkRtMqnz83dl9UFG7kTx6b3F6B2WNkUr3IFcIxoIYqh8T5+HqI3?=
 =?us-ascii?Q?8IzAD+Esx8mWweZu5lBJcKmhUuwoeEoFB3fttErGhnAb8as8944H7BTSv5GX?=
 =?us-ascii?Q?JfbSMEEczg2e5iQIay9BXr5SjrTXcqz44fZfPCIB/aqy1g0Oj2HFpG6z0Xge?=
 =?us-ascii?Q?fUOlw+xtD3lFsl2FFZPThIjUxw552+pUkLqI2jpuyWKpf45uGJdZfWWltn75?=
 =?us-ascii?Q?OvNCdTocnirLBWM3MDLLoI5rhCnz2CE20rI2qm7ZLD0EZPnn/7KhHfHaFmgP?=
 =?us-ascii?Q?JIdMfHP/6i6+IQFfCymGU61ldNjA6OQOxJ4G2xJP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6X3L7o929Ppq0ZPXbvu9rkdHiHCdPobqM6vohvGmVbOPM8r+MeSJzGvVKu7Yf7IGZQONNldaWXjbF5RE4jYw3x5crx5YuqD+y/rhrTX/xeZZ6yPHr2RJcXaIgI+2NxzpYf5Nz1ZcNBzUqD960fbCCtccgxjvNDXYkQJ0l5I1Y1HpOhRoVmnNqEk9CBtzkJY6Rimq5WYYQ7GWWLel222K2UtswA+7MIzrpEc4zlxL4k3viROQBIIUicgmYnxblFDTkvai0BGjnwg23voyAup3ZSUr9MYI9+w8j65/3UmDgfa/iVUPQDnG+OqVz3lEntLyCsiRBSSMv7X/laVJTUw6mTfCr3umTMA/00u9bRPYh9Mo6wiqGwxaCKSNDQqn9DcMwvYQha4PdwyG9kBLQK0fB/waNMA7OEs3/dO90vG0/dD6I4yt9Kf3+WcmiGjLQ4HH8wOWnP0valYijKVLRqm0KBI9BHSZluvGQncLBMw9uteM0jZQ4EHK8CcvNRXXnIFsea49TFwxIbsjU+HCO9ELSTnLbHAXQtiiN5nOzolB5p4SxXMOVPirNwyjXdX2UVKP4Lq6g804IjnLqAPqNSWMJEcB2aBEQqJQN9soYfLwULM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0ff0ef-aacc-4962-7f1f-08dda3455576
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 08:53:54.1717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvGsKi2Noby+zEufGcdqw4CQDnOjvqmUpCuU45+nkSjQn4QYyLJXGjVUpZQQpTEuwbsLfZPgDydqbFXRtUY/hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4662
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506040067
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2NyBTYWx0ZWRfX3B1AFh6YBhpE EsOd9NhavACwy48lrUUYxDzBXUvjFcVviJvR7el8F5ybHuplljS0zSyITpQ3rLeiQFHU62pBAqk N4BWbowEVWI/PHVL38YtRlqRoMJNoV8DiRmuomMfMz01cL/q9vRRTCWqxzuex+zq/Vddo3AjOZs
 +2oLLo/LJXFmeGCmyo7m7O5OtwGAMgxODuH0okHYkRjMrDTQOn3gar+hYW3v781HziirU+qNkpL LBjdov2E/pou0GVUIByK7J5A8V5BkEP98ASjK4bmRD3KFQLtYO7fnGqSB+Th3JRVB6wf/ncVuXA Acuyz99OTuk3PryH6g0X1gxhrP3fPS59h1y8VXAjZt2cvU8zCVPK5rz7nLTGNi/ClDERt7kJ84+
 VK3cPwGfW8LQLketryrxrwwc44LhWdEN7i5jAK6y9HMy9rSJG0Ru8cUPfPohfdmmbcTS0qFd
X-Proofpoint-GUID: aKKnIYC6gaR2nySq1x7RCGeUohrN__N-
X-Proofpoint-ORIG-GUID: aKKnIYC6gaR2nySq1x7RCGeUohrN__N-
X-Authority-Analysis: v=2.4 cv=H+Dbw/Yi c=1 sm=1 tr=0 ts=684009a5 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=5Or3Sm6iuSDKPoAoRkwA:9 a=CjuIK1q_8ugA:10

On Mon, Jun 02, 2025 at 01:02:12PM +0200, Vlastimil Babka wrote:
> The slab allocator observes the task's NUMA policy in various places
> such as allocating slab pages. Large kmalloc() allocations used to do
> that too, until an unintended change by c4cab557521a ("mm/slab_common:
> cleanup kmalloc_large()") resulted in ignoring mempolicy and just
> preferring the local node. Restore the NUMA policy support.
> 
> Fixes: c4cab557521a ("mm/slab_common: cleanup kmalloc_large()")

Oops, I broke it unintentionally :(

> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---

Reviewed-by: Harry Yoo <harry.yoo@oracle.com>

Thanks for fixing!

-- 
Cheers,
Harry / Hyeonggon

>  mm/slub.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index dc9e729e1d269b5d362cb5bc44f824640ffd00f3..11356c701f9f857a2e8cf40bf963ac3abdb5e010 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -4282,7 +4282,12 @@ static void *___kmalloc_large_node(size_t size, gfp_t flags, int node)
>  		flags = kmalloc_fix_flags(flags);
>  
>  	flags |= __GFP_COMP;
> -	folio = (struct folio *)alloc_pages_node_noprof(node, flags, order);
> +
> +	if (node == NUMA_NO_NODE)
> +		folio = (struct folio *)alloc_pages_noprof(flags, order);
> +	else
> +		folio = (struct folio *)__alloc_pages_noprof(flags, order, node, NULL);
> +
>  	if (folio) {
>  		ptr = folio_address(folio);
>  		lruvec_stat_mod_folio(folio, NR_SLAB_UNRECLAIMABLE_B,
> 
> -- 
> 2.49.0

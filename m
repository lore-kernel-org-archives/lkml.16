Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D5329ACE5;
	Tue, 10 Jun 2025 14:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749565251; cv=fail; b=T7dsqXbywSAsyhDrZ3EQ/xh8Ypjqvqd7FZ3DFJHdGT3suYVpvG6LzurhK3o/crGevzamBgx8p0Lg0ChBCACQ6v+VUG+y+dqJR6lNo8aRxGhVersORbzXlUVHPnUp8Zlrqz4ouFLhNlYqiHr5gbOTIa5o7RQd+iEYF5yUAX4gRr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749565251; c=relaxed/simple;
	bh=U+S8vldILOIz0qGbDUiY05TaMT5PLh8IJYmcw1fgxMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b39/K+LZuhDTjw1C1xalX2W+HsIqZJesJnYsfuqmW41EjE03CKDQswj1gv5K24O9KmOtQg6KsQgFc3uCOf6vAi7NYhZJY4UX2I5lmbLrgC3ZZnfXDYI3UVDTYhoOJrmiTo32kv9CUvsCWedIYpqPGJ48tYNxkRmdexoBRjY7K1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DTsYbbC+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Q8jO4qbz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DTsYbbC+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Q8jO4qbz"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ADBZ7s030103;
	Tue, 10 Jun 2025 14:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Ipgs6ONfHT4msTO5Nw
	pbFP4Sa0YzqFQ+vIfiNK8eR7I=; b=DTsYbbC+tL8z+SxV4yIq5kYJzkgOrjwHBq
	oHl8jefjSRYClJ4oVnjzePuF+cOiGRj0N36MTVtNqPwWNXyqLuDBWw8BggRnxXCI
	qFqUuHBM+eRXjHdR0V0aUvCBNHqj4dl3FQCuudF3kCIwjzErHGpVdobDkoCc6f7B
	IamYcTNNdT+LkVPf0Y9WzhpDa4f1Yk/PsbR3Ms4uYLKP6X4j6bnXRX/EOQFl1bmz
	66ApvvhYynB5QiWpRMkJzenE7fITcbq+aNrFstgcDx+ixcBlB+KfiuywGdfzwMj6
	EaGedIDjFyt69ijMrSTSeBLhMBJfVmCH3F3LSCwa+aMnGZdgSz4w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4752xjuquw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 14:20:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55ADGvNu003893;
	Tue, 10 Jun 2025 14:20:34 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv8t7pn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 14:20:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYXzGb19IaBaYgxxprwZ00HMJ0C4MqJa4nD7HVQKMVw8FHio4T4m84ebw+eAot918dMhQVfrSQYSjrz6viK+YfQrYvrH3Hy6Z3J/ChBCGKOOPImYF8ziWaxtm6OuDngLUKZPbZrZ3CQej9fPi39n9/EgHfNEAhDVTmvYJSp3z05E3uOd5MvvzcgUQGbCpuphwgDDuITHg+YdSZIwgXAYEyRqZ5ho8UJAuSZmDHJalWGbbovDe7hKMK0Zibc53Xd9HQ0njPtTx++lfp5zM5n7zn5W8ukMoks2sgZVD/ZkATmMXgdo0cUSnDOl8+p3Hz8PbMlq9yYUebB+soe9I0sxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ipgs6ONfHT4msTO5NwpbFP4Sa0YzqFQ+vIfiNK8eR7I=;
 b=hRn3b/1zf4+ZTK4wyVOCM2LjNDchodvJX0XM4b4Nw2WzbD/CSMs2M2B9RBUA6niSJhE8uSL8wHD2MwnwkRvxLRay1YhSvU4s8uWkQp7WSDaupPXBhoxwf3nrCjI3dXIKVPvM7XPpgnNiIf9l1CwRzDVmWFrka6REsnuTszCSneFfNaUxHtnEfcc/YadXv309rbdudEgIAbZLind7+5mxwfLquiI2lUjJjKnOcnh1EOYmpf6I0h16xCN/qXrUgTWeG9xOzKXawj3SDE+vvV0SyjDcmt0nvNqP729kpXK8XVEpj00r0+3Jv4WrdisQTWDVnhllJfhrtmoT7VZRpk2Ozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ipgs6ONfHT4msTO5NwpbFP4Sa0YzqFQ+vIfiNK8eR7I=;
 b=Q8jO4qbzEKKsSrLbr12lmBBA84YZntSvCPa8Mcwnca7SlTk8s0BOSRRFnAs4kjJvQzqH5PY+qgL3BQ54Sc7sgF1XYANuYuzpjp8z46eTW0P3DmtwCTHOMSa84/6DToRUTtS8nCMkAWvv7pmVEaCrOUbvClHZpEawz4lmyLKdhHo=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by MN2PR10MB4399.namprd10.prod.outlook.com (2603:10b6:208:1d9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 14:20:32 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8813.022; Tue, 10 Jun 2025
 14:20:32 +0000
Date: Tue, 10 Jun 2025 23:20:14 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Feng Tang <feng.tang@intel.com>, Christoph Lameter <cl@gentwo.org>,
        David Rientjes <rientjes@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] mm: slub: Wrap krealloc() __GFP_ZERO semantics diagram
 in literal code block
Message-ID: <aEg_HtGuJ8Q8G_s8@hyeyoo>
References: <20250610092153.55093-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610092153.55093-1-bagasdotme@gmail.com>
X-ClientProxiedBy: SEWP216CA0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::19) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|MN2PR10MB4399:EE_
X-MS-Office365-Filtering-Correlation-Id: e7894cc3-75e7-401f-4acc-08dda829f534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fUCzYZJrdz/IQTZkgDpiSGm6lPCLtT3b6SXBYPJWsQX7ECK0+dptWBwjlrCQ?=
 =?us-ascii?Q?XArjtWFgkjpoAY05rZVk9S/rzZzUU5EfE1msKs8nMZnm4TVrK/CeP68A+BJK?=
 =?us-ascii?Q?xu6dpq+nhpV2UH8HWuBSrKBaaQIBO0jaFdoD9bYQSM7+tkNvRz4Mj1E8Uv8l?=
 =?us-ascii?Q?CCmFzyf3PfTmzNXZLxcPKfvipWxcx4GWNBMSStfU8/1RkRFNk/o7oueRj3l7?=
 =?us-ascii?Q?qCt4b0aRMCVwWJAH1tpJwaGIrUABoVqSuOSNlkUqbcNPqMjzfZfG5jq4zNIB?=
 =?us-ascii?Q?HlCnaoRMBtcvc4PrRliD95eIP8oKOGAuPpFLqJjMhHDgSKjQCJQ0PCuwb8dY?=
 =?us-ascii?Q?2e6WzxLWpP1Eb9rbjIYa28OxsfT0s3Y6YmU3gbecUJ2IPhaBXqX5sYAsP7QT?=
 =?us-ascii?Q?9AOewZ5vgujn+Ur+LQm5TFGkWJI/M0QtEy565uaamIAyFQMNO9jW2faS9znG?=
 =?us-ascii?Q?AG/qIMWAMgEqJRNI7v7MMRvM3Tr+RaqiSlpUmvfohFGUAiugqSg++tLvkLIJ?=
 =?us-ascii?Q?gk9Vjt+KhtrCVhdvPZyFzqNJGh2Ss+zi8zSAmTqiHDTXeNvkCw2cEB01a2JJ?=
 =?us-ascii?Q?22o8lGJRddfaqnHemo8mkR5BTos/tTK73zBVzqEqAmWXa6Ze8HybZ50xrCP1?=
 =?us-ascii?Q?V7ob1UnjlfhOy2XLGpu0JGUiwS+54E3XzSCyxUOb9cvi1vTPJl56XdvkVDt5?=
 =?us-ascii?Q?TK3xTrbHFsozX+d3IPIYZ1F+PhUA7136p9Y9LYUjgGNgIEE0pCuk/lVs+JYT?=
 =?us-ascii?Q?IK8oik9WVQUDQA3d3AnBDZ4asfEiUpG2EpgSZsPV6VQ4+dy7VDS70eHhWc7R?=
 =?us-ascii?Q?ElaZilAzDeefSD58TcBHYY9vv6Td3SKaIeKy9CkZXivDdhqhM15fkHqPXH4s?=
 =?us-ascii?Q?3OFrTflLjNRbYlxSEV4IUU7Z8cuu38LHyskiEAQfay8x6lbASq7Sj8idyEza?=
 =?us-ascii?Q?t59B4Ud/0Hu0EcdSk1m9One6Ec82QvYBy6MiOybYY1tboxYai5enfxeJDyht?=
 =?us-ascii?Q?8ENtunLdYG+ZcSD5Ak9lE62K0mBXT9zuKL+kqVAw6QnHodlPXQdGAlkHM5RO?=
 =?us-ascii?Q?rV2ohOKhdwQiPAi+o1a9o14p6eYflIF5mcSEgacy642ATrsEy7PTU4RROQ16?=
 =?us-ascii?Q?/WMBCRGUwuLNe5iAZjXz+9CRXXsbNgZa3uHdq1a5WTRCnQ1Ah8gtzGwT672S?=
 =?us-ascii?Q?DigbUhLYqaOdig5JCbGRF6s5E3Rfm2q1FZPNeplg++O/D6gAHiK71e7lQSyM?=
 =?us-ascii?Q?HDu32j/TyJyCectOhow97xiFZoL+GvoSradpIhH9kT4PVSfSFSdMYuovBZYd?=
 =?us-ascii?Q?3h/fX4SyOWX1m/CNTgpMxcjEBMZJgvubcPk805dR5lYbvFcBKwPXPKZbmvDa?=
 =?us-ascii?Q?B9Fe8UBYl1kVh2+qbIAJnXERBHQoWLnyYLZ8T406/fv66ulsGeWS/mrYOI9W?=
 =?us-ascii?Q?NBScI85T5Fk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OCX9X6FBKkBpjUZbsCpWZBb7qkXfoAHtGq59uZ6adSYsrU1F35bYJ3Ir1Byy?=
 =?us-ascii?Q?aJ5BlUA2TD4XORPEOVw0mUfpYxonui/Ikukxo7xWGcRtx/ecI8VzuGiKCxb0?=
 =?us-ascii?Q?tkqmILxuytcNIJelUKNsX8ID0VmsenE9Gs+XzlsqEPPThq5viDTMPIa8cMqQ?=
 =?us-ascii?Q?AysTiQupykQc0kplhpCKG7Ble3/Aa6ZBYHtnNUCWf5qLLD9+DjAwOs6Q26GZ?=
 =?us-ascii?Q?7rOK17/rH9+NGPIddESjWf5GxYkmX2zORygwZ8xLo07K6++wlgOzdbU7YHZt?=
 =?us-ascii?Q?L9vmunu2WFkOvQRYxVIhGJlNaH54oY7KrA8xchJqMs8AfgScWNEqtVLjvLpt?=
 =?us-ascii?Q?RhRVbaYE+WqVqQuTfhjJhULnvsYy7i4/oEXlzgqlezswHrpP1Vg4372khwDw?=
 =?us-ascii?Q?ViFjS3fHKpPajTKbPJGbqZtIuNtCXGGG6isJYA6SCTGk6blxi7loYX6g5/Ox?=
 =?us-ascii?Q?2dI0iKMcH7FxOgWU7TOgOUyQd9su0FXD1vuB0qfJs6UnyAUfS0JbHq3SOFvK?=
 =?us-ascii?Q?5zqyoFJ/qW3QKrGIuTG7W8zthb3KjxJENeHIOf0OqjKFNsjaOK8ybR8/wfKq?=
 =?us-ascii?Q?bZJGV/HITbaiRXEx+d1id/bRb1WS0UizFgdB0cN1+owFgXnuM5EgdjJVqM3/?=
 =?us-ascii?Q?6usFcgtFDChBx17HF0IOsXTpJt29nSPL4KWW7mejLd2YuMzNfNqXfNB8UQx4?=
 =?us-ascii?Q?/rvZAKbkbt3NELryU0x2TeXo1hJE+9Ow6PB6p2OSBweduikwY/Z7E1A2nR9z?=
 =?us-ascii?Q?sy1rzi1q7QsYSoJwSC7R2wnd6vYnmzkx/8FBTaYvHhcuRvTEaCqiCh9R+K4T?=
 =?us-ascii?Q?ryBBTnu6cqEt1k1DB9siwT72bZ8Ne+/77c0Aqg7o48MbHuNhJJRue/B3pxtu?=
 =?us-ascii?Q?+mkL4dV4C+w+c5MkOc/0r2lMWLwzQrDUtgvKfpN6DcTgSz268CjSaTE+tnqZ?=
 =?us-ascii?Q?uySgY06zVVrwA8kaTA6I4n/4uh1ltFlc4FpOxNN96KEppyZYC2wOnNeYp0Jn?=
 =?us-ascii?Q?kx/HG2Q6bo7w6n7RxegYL5fGBuuGLuLKcsM0bI/Xi0sF6BGM4/bMLorrhAtU?=
 =?us-ascii?Q?xUsehzPQ9OM6sL41Y8sKImx1DrF58PS1C3LxjXv0qkrDl2u7gdQ9kBzIRd8o?=
 =?us-ascii?Q?PEG/U3sHYK+MvnD8uEOoWrwrOvq3/iCkEezJzhJ31Ps3tp+Hj253Xyr630Bk?=
 =?us-ascii?Q?RH1Qx2HlUFWlGeVBmK+c//v6AswL2BM3iJqwfzURn/SBrRvWKcCBlJKLafqm?=
 =?us-ascii?Q?miD2swBwRN7qnMMNVq4Kke02FlGgUSxpMsb8mD5dExc3Y0ehq7Lg/9Wd1Hou?=
 =?us-ascii?Q?Qre/CtwuAUUR8GZlrzHSej3O4V+8WP/TQP2nF46UfwbcmNV+ciwn7rpNq3oE?=
 =?us-ascii?Q?Z5zDVgNUg8qehABC8syIgbstNeKDzidhUNfKK7G9ZrfTqPHO7aKDA1rKMyvS?=
 =?us-ascii?Q?vdx1CdzEFG684yFIR1ZacxMFj8lfCt1fotD9II5YalwDvBtGSSmmJy/x/aS4?=
 =?us-ascii?Q?MNKyXssDMrrJMxUaw05PSEWxYG9sjfnGoPT1+trW4YC2MFcRcAItRQgEBLUB?=
 =?us-ascii?Q?r4x1WAuQpE57vbhG6RMUcGMKaRZtnxHguQzR3Sxp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bM2BJJB+Nq+MOHivFtJA6SoAty3xi0Zt+KEaZye/gBgJawOaaDZw4CgTiZZDEk6v8PRff7FK4Ny+EPN8JQ8CXjORopDOmXgnzd7BZuuoz/cnMnDqBhQ4ge2viRaZ14voY/IvP36TSMLyy6U2yyiFZ90IP0hrchZY8G3MJtARmG7xge6ivXOEPKTquwiDRp75PV06hBfICglYxQwJdJnB2VxI3HKdwaoq+JkQimzfX3bq5D3eluJY3Iz0O5FLjbHcW2FvfSVgz1AmWABxoopJJEpAerBMAEKmHW4ASo9Sk1a3ugywIT41XqIV07osyo4RVsLeeGaSem8doAm0789Yp/47XLFINHG5CNRGPTxYnjpoxM43HBT4yUM5bZgn0bDwbG8yTzcH2UzC8sTN2Phw+VROScf2G0OxpZ3014hCiQ75j4lPMOyYgM10Gj8oxnTgCt2iFunOjGtp5lJv0W3iLh6ifzzmujYkCDovbi8XOYO3oRwRHWSCZZ9OYcNkm+FhLEgejukq2QVsMO9HEoV43MN3Ip5kkPpYaPMR/dEeOlxQ3Eo0OCU+K8PwHWLBeFYTzrtMuuQhv2fU3xwDrFQSddFquKwYBWs49PFZmlSOsEA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7894cc3-75e7-401f-4acc-08dda829f534
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 14:20:32.0845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dARSEQzKjTowvp6j7fNS17xKNO9Z1a1yyaWTqFsG6SpCS0MhSa14v9OWcwgqBkPUPOi6gbCPBjmpJdBPcVGvFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4399
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100113
X-Authority-Analysis: v=2.4 cv=K4AiHzWI c=1 sm=1 tr=0 ts=68483f33 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=6ClX3P5wKM0FyNxOxOEA:9 a=CjuIK1q_8ugA:10 a=pr4zOeGnsmwA:10 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExMyBTYWx0ZWRfX0FxfZgxqw/fk iZ5wX6jKOyAh0bolPTMR5lP2vTBotyXSXQDnGzea1HEyY9W/1O6KX0vqIjv8ddWSjgdG+7tGkH6 e5wmIgTHT1TkVPDXvNsICE55bshQzexPJoF6ju+M4E7AD5jz/qM6mlixYR2CiAZP6RvDOxbuK4C
 bpveanKEG0p3o8Nf39eKUC/WWWcXB4tIOvTze35vQrbI9mrD7oufgwJ4JC+nkQW84qMjpsHftjL Xh5aXGuv4TGr0F33q8B5jS64UxDZwipXMqQPUyrZZW6DAKO5sfA5docQV8q9suQS101j1fFPCy0 mK3X51vqT9uJdhdF7cn5G90HYFyFdWkGeJVlxfs9GMPyNFo7lMqNuQqYadm1DkduDsliYVvuA1p
 4yUdJ85xls8WyjqP99SQo4O/5Jyn/TJVQnaxjiASKjMYhmUjIzAtRhKUvWjl1nBJIk1/138I
X-Proofpoint-ORIG-GUID: k_b1d3QjiSAfkGH2rpAi8rUvSLGEse-J
X-Proofpoint-GUID: k_b1d3QjiSAfkGH2rpAi8rUvSLGEse-J

On Tue, Jun 10, 2025 at 04:21:53PM +0700, Bagas Sanjaya wrote:
> Sphinx reports htmldocs warnings:
> 
> Documentation/core-api/mm-api:40: ./mm/slub.c:4936: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> Documentation/core-api/mm-api:40: ./mm/slub.c:4936: ERROR: Undefined substitution referenced: "--------". [docutils]
> 
> Fix the warning by wrapping krealloc() semantics diagram for __GFP_ZERO
> in literal code block.
> 
> Fixes: 489a744e5fb1 ("mm: krealloc: clarify valid usage of __GFP_ZERO")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---

Hmm not sure what I am missing, but neither `make htmldocs` on my machine
nor docs.kernel.org [1] list kerneldoc for *_noprof() functions properly
(which should have been listed), so no errors show up...

[1] https://docs.kernel.org/core-api/mm-api.html

>  mm/slub.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index 31e11ef256f90a..45a963e363d32b 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -4930,12 +4930,12 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
>   * When slub_debug_orig_size() is off, krealloc() only knows about the bucket
>   * size of an allocation (but not the exact size it was allocated with) and
>   * hence implements the following semantics for shrinking and growing buffers
> - * with __GFP_ZERO.
> + * with __GFP_ZERO::
>   *
> - *         new             bucket
> - * 0       size             size
> - * |--------|----------------|
> - * |  keep  |      zero      |
> + *           new             bucket
> + *   0       size             size
> + *   |--------|----------------|
> + *   |  keep  |      zero      |
>   *
>   * Otherwise, the original allocation size 'orig_size' could be used to
>   * precisely clear the requested size, and the new size will also be stored
> -- 
> An old man doll... just what I always wanted! - Clara
> 

-- 
Cheers,
Harry / Hyeonggon

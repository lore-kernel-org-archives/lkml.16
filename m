Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5EB1E8327
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716884; cv=fail; b=YQo3zhn/c0k2zoURv3lTmqjdpVgAjQMulu5DFePPJKjudIv7IY1u2fasBlTvlnXArLNlU9C0Tmwyhd8jVssTwNLJnY99wIe6lHIFj8Xc4iLmeSj8TmeUrpmcgN7+Q2mIV+5DGO53c5ihOOm0xgTg7Rm8Wt6gbMS20NFbJ1u8/LA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716884; c=relaxed/simple;
	bh=xRlO2jPY84zSMlUvk7xqchc57dCm/LEPOWGIVZrdnzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oTQYcfzDIH3teNb4JOlBoyyGSZ62IPxIqRajfY22/SxkvXix9vNDCJCMU+HPtj/lyU3MX0YHSiW8tc8/7y79DF4UsOb3crP+XTQ2KL9TyMuBtR905GYZKo3tTlCAQ4h3i8dnAqzWTUJJYsIZipGcQbPkvaqdLz58uLXlmj+0QA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A/9oVMSn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OcOTyAgR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A/9oVMSn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OcOTyAgR"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F6frOB004652;
	Tue, 15 Apr 2025 11:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=dR2UqNtSWrVEJmxm6I
	uaKG/8q0gSqoidgNCup5pWsls=; b=A/9oVMSndmWteCUxmqWzhMJtXflNdp37EV
	bAWAmPU59ZMFTnLSndRUrU1sm3j+ABQ4aJpqyCAn6/BWBTKcPHxnBA5lfhnegcyH
	exXcDx8qgw1+6IfxnhWRUsWcY5qQHvWta+LKzEIeaVoj+HB1SXTwxbKhmGOd6ZvZ
	bmcJDs8Z+7Ydqk/T8dOrIFrlCcsEfQAXAATPMztQJWRjqtzJvC0YA8Gmthjx9FRj
	bn/b6j/DYz8M+CZ/DhUlXwd9kePuugKU2+dRjSODR1Fz+gcPMHgRtLyRKGCCYlGq
	cllCMNoEvjadK16AknhZVTpxj0Ezi/E7HiJbzr0xLjR9adddEEvw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46180w9fv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 11:34:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FBVwXX024716;
	Tue, 15 Apr 2025 11:34:31 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012052.outbound.protection.outlook.com [40.93.20.52])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d504bkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 11:34:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4Mk3Jd62aYzfnTdKryB5i1KdEX0WcDES+TKTxJYZIRnJCT3FPpLG1fXTmO5nehuJakFmqHynCSTT9GS5TcDNmLS4lDmAzQ9Jp2eA4Iy9YfHReB+OjSu2YJbVjhiSWgbtQC08IM8x1gk1X854Eh7wJLdmvYcU9XNmFuk2GK+fCxdBqcruPN26jvfW5xtYI3Wy7ItlEt0up8UCi8XCKqIQpe6MdoO5sLkTm71UpZo+/0rrw7nuYaQONs7/WWeMsHDA3KFMGLpDNX6blxhcLuqcTkI4lNFYr5nDhgd6zMtajTdS1g7BieQmGkyWbxPIWG05zO89TQM9NhmglAKLJcWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dR2UqNtSWrVEJmxm6IuaKG/8q0gSqoidgNCup5pWsls=;
 b=vNhhKSWAlad3hi5UdLDwLu7kFZEgCpFU5T8zeJEyXZ2wIEbuQZdT1xDy9GuilHvfEWhYlpkLOtZvNYCA4HVkKTJFpX9MI8lHLV3uDHyY9xMTEkIAEnRKGozHAaUeI8ChrEUp2KzMxnM1AeS4OSFQdxaYacMZg+HXaK4wNX0fDZkkxodKrRRnJmvh+fk2+twCXrR20H2r0sAJsE3iyV9G19UfJtBFh86JDLPEuno6UvuAeK7LlPs7HMgvYRZdpnZTxGEkhpts/i3/y4k6WpWhw4KjjueyjDTTWQV0TfQq2beHh4hc2SvwZIyYAMLSX51aOxZxhiqV3dW8L80yXbU7IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dR2UqNtSWrVEJmxm6IuaKG/8q0gSqoidgNCup5pWsls=;
 b=OcOTyAgR6r7oCY/ncX5w29BNbKI3OAagKVBZOa4VbJ3XJ/d+6npv01dk9uJjebSwiuIZFfaOkR+Ksz8x/dNmz7R8piQ93Rg4S8xTmvyA0N6yxF6xd/o/QwLBZYI3H6Z/02ioWrCKwtuwfw3t886lblzkhdMpz7NI7E2qVu222KA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB6538.namprd10.prod.outlook.com (2603:10b6:930:5a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 11:34:28 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 11:34:28 +0000
Date: Tue, 15 Apr 2025 12:34:26 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Wilcox <willy@infradead.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 RESEND] intel_th: avoid using deprecated
 page->mapping, index fields
Message-ID: <57daeefc-0ce0-413a-abc8-f8f406e93a3a@lucifer.local>
References: <20250331125608.60300-1-lorenzo.stoakes@oracle.com>
 <Z-q5Gf57y9LEZcUE@casper.infradead.org>
 <2025033142-rack-viewer-80d4@gregkh>
 <Z_0c1TGH27ecE4hM@casper.infradead.org>
 <2025041536-exact-chief-f2c9@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041536-exact-chief-f2c9@gregkh>
X-ClientProxiedBy: LO4P265CA0205.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e52fca-e864-401f-ffa8-08dd7c117b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QaddHwKtJ2Pynhva7tZJ8Y8nlan7LbIuINk7AxmkJEKoCRt5rORLwSsrAdUm?=
 =?us-ascii?Q?a3QUg7ezdOLOn+dWyU7KvpskV/4ifvRMvs7ZDDqUanKkD9Pe1ZwvD2X8fOb6?=
 =?us-ascii?Q?e+TfnC/qYF2cDxm8sD9vAhm3utuB8kqpE9seN0XkBFpNin94GO3h2PEXvv/J?=
 =?us-ascii?Q?PpDuzyS9ecAqprrRKHpcoaKPqdcWAR/7Yan333UuuIQEq6d8q4iVnK/DZlcF?=
 =?us-ascii?Q?tm5nlltYZoz+ziIEliTiQLNX8ia7qxYqy2fKyAdAEBoWWuc4DB07u9kkY7S1?=
 =?us-ascii?Q?xjyM4qGY2cZOGDMI3p0nsb7oOGUeeQBUQgVeWAjcOw4u/HalILSclGYIH1ZB?=
 =?us-ascii?Q?8rKKHXShjKBASVk/gsu3i82dO5+sqBhMK/JYA8pEg/g7OZgNU/REFTNMrroq?=
 =?us-ascii?Q?9W8pMSvEeAJjSeoGaU5MxndgqWMOuVGBMcXm+zyQwDyKmrz549vba1pf0AMK?=
 =?us-ascii?Q?EmwwyqlwlPm0BRsOjE61g/TGFHoQs/7oEZMpaNLJd59UiPpLrygImd/W4e6P?=
 =?us-ascii?Q?npRMktDGSdN7A2OpdsP0MQplgmkgVh821mBb94+IYKqZuu98b5HTxelMrRZI?=
 =?us-ascii?Q?Unbcg51qleLUc2m28mAPUvcxULfUjaS17XLNz8mAaGcmv67sbu9InL5RxbG1?=
 =?us-ascii?Q?qFwnyEVWqbEPO0jeYc/Jm/UNoNj2AUuufy9W2y0z8iwD7ZIYXN9GDX61J05U?=
 =?us-ascii?Q?tUJrmU6sV2q4GpmhaCRXBU4p3skl6lnYP9Wu8cHAoknP74W0lBWRouTdl2El?=
 =?us-ascii?Q?nIskOPqNr1BwDPqc+P0cuBodjWupfi6r2Mf0Yp3IAzNswPOcVCqxU2oDMb/A?=
 =?us-ascii?Q?VUSF2pXNOmcPUCLdZs/LsQn0OS5CoNxpJl8TRwNyiry2wghCAe2A1S7E46yN?=
 =?us-ascii?Q?6DTGRdAkHAlV1ge0xrLzhVfRwMAiRk2QejIU3eHItqveCCf1H9bnci9VH0G1?=
 =?us-ascii?Q?tk5wnAflTAxdGKEICGqhcZbE8E1fCjSVZn1SGiYv6kR3twBuI/lwUYFlv3NO?=
 =?us-ascii?Q?e/xKTkya/TUrP4fwIfjO0vxarzOQaAVbwKoXPnUI6Z0s/QBRuwhZFuPC07vV?=
 =?us-ascii?Q?Yv8UKwMYNWLOt0Aezwjrrt2npQgDGav1hYjDcHqzg6FfhgNINKqr0kK/JKmN?=
 =?us-ascii?Q?mmickDWP3GZpIlqrj2KEF4RdOl9VUTqz4YDM903d9+hQjlpj89HmYaBUzq8+?=
 =?us-ascii?Q?2MQLMZamVtVhclLIHfB0UW8Cw5Gc8dlh8DpV1ZRRM8q7AZBd3H90GXsZUKym?=
 =?us-ascii?Q?xz0RNROvLuP0DwEFNWpylTdQZgoyoQO77YUeXCN7yy1N2//f7mWTy+Xxxoh2?=
 =?us-ascii?Q?NNefcbnMJjHLZhLDkogovY7SEKCCe59aTlR187qSHahuM8OLC2QqDesjs8Mn?=
 =?us-ascii?Q?UMjtiyGbtjfetO5oWC7VhTFTkOTTlhACeRVM1nxvU+ELSCXduFvzoSUwoNsn?=
 =?us-ascii?Q?HPg32fs3U2k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hY1FQcM70TSd4DIYwZklpWJBBPhJRGBwBxmdCVcqxyLyfZXp/5oQjCmdE0Yv?=
 =?us-ascii?Q?2VAkqHHODyuH8MWXPDynaWchjT7K3gBb2fD4eoKmfOzA1hgQ51wuIjI6sOdb?=
 =?us-ascii?Q?2f7BqXR5eveXmvJn0U3l5LmWFE+W6832wrcWgFuiyXnFCJMdvCSBwVAygdd7?=
 =?us-ascii?Q?TLH+OxL6FprdCKqfWbm0F3syJOAnX1BouYPEUuQoHSskICvk8jV4p8kAJJoW?=
 =?us-ascii?Q?yvgYe5gkSYe6GZD1WYzPwut0abIwWsXFBpqbgQMXCKyAcRsM/JqmWu6fhGub?=
 =?us-ascii?Q?crhfX/80KR3hDKfJ1v4Gl5O6YEAau9inUPlDNvkGo+2zjXoZh6v+I1yyMpgZ?=
 =?us-ascii?Q?PCuC+1dXj5+ScOlHnWgXk22ToXuW3JHLbFQGjyJz7J/evEwXSxGmtS3VryGZ?=
 =?us-ascii?Q?Gf8VHCGFES3xnUWWUljzo4Pj6QaiXzmrnoYTcFgbMz2bfsTaKAbBpXF4yNOx?=
 =?us-ascii?Q?2i2WngiLEELN/0TnhxiDxhFWKKFkmbHjEjhxDTasft++Dap6hACSvmQMtQoC?=
 =?us-ascii?Q?XAXNIKdTRKRryRJMqCCHecv5QZ7a+N+DxjXRzKdaJsIXp9ZONwH1Jm/9BwGE?=
 =?us-ascii?Q?CPBoLNZzmoDANkBmq+DePrjl3usg67C1lLBIPPYT6O/rINWvuWCpztr/Xm4h?=
 =?us-ascii?Q?xI002u8qN00mg6JBA6q+i0W7lnNBQIL/UazrgRAJmcTHhFcYcXzLLDJlywW1?=
 =?us-ascii?Q?3jtn2m7liPTvpXxELaHqKFFjEmUn22J+PMKYCh6PRd5lolhqfv4zrxCVttGd?=
 =?us-ascii?Q?UTLT6UwvTomCsmjoYuhk6OiuXWR/1IG19uR4C7emizMedqJSwoYNm+JOtAah?=
 =?us-ascii?Q?bMsr3DADVE0VZC03n+zcpWrV0Vw3WFxvTYF3SCtH7+QD3PUz0+NP20wMO6RJ?=
 =?us-ascii?Q?dAm0aQKje9FJj6nnWy5dHrDBgd/IynyFUqNPDJPKjPx2wXYwLamuOqBMbVXr?=
 =?us-ascii?Q?JHoUNaHzGDrEyEcuzavNtJpDuHZ0HXhINOjbZWsbox+eAiY8WJa+C9I3DJa6?=
 =?us-ascii?Q?6b+nH6RTbzf0B47aplVBgJEqnlzX3Ny7mFJsMcp6Eqboe2TopAN8T6Z0lDG8?=
 =?us-ascii?Q?zhLdPUHZU3F6UlHpHUooCUi+dH1rQBBUwwGqM3P8OzQDFkSJu6H/KzHKrghB?=
 =?us-ascii?Q?fjTXvrUreRlr1OlqLR3pQWqUSxlBHWIfVPtdCtEw6JhPInzrgxyrxvWJaZVp?=
 =?us-ascii?Q?rsfsFkvM31mC2Aj+SO52OOJVOPqe/5+A2YqERYZKJdux3xl6c9Ki74o1W1kc?=
 =?us-ascii?Q?xVJIlqjspcpah1926NcptP8Il+hBD9oUGtCsuzpE+5IiCuUTq2O1zqidIBIp?=
 =?us-ascii?Q?poTEnOAaRs7tO1ef2pBXY5n/jrkNus90Ar7+qAMSF1QS7+PZ7J6pFdImZUxC?=
 =?us-ascii?Q?vgtIPN7f1uQ2UkRwWxGzZc8cBcy8QlBynb1Zen7yVbZZDXDYizYZrpou8VK3?=
 =?us-ascii?Q?9zv9tbIBMpBBTeuZfoQ6a4MJHmb82g+MuwypEwGFfE2Yi4tw+UK7+/Zvyftr?=
 =?us-ascii?Q?vnQsl2yMl1r/xyYNWWlCRg65vmI+XaSz0tdcKE7slD/3L7k9N1+nGxzFhpPG?=
 =?us-ascii?Q?Ajvkdpd796875utmIWPbqwRLYKWV+JcQj8+qpk/SVvq3Mu5k3CYZBMXnuix8?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/NHwz3V0hDkHH0xGTawDTSFLgQKaYUiMio5AeTYO6hDo3kvlOMJIt6hu+rdnHcDygogS0QNlFvDKIDYC0Pk+R2B0LTZAThdPKdnVxlzQluz1r8DBpmkYSbawMazPN5E3hOIZjDlb1V+G7mLFMIZrd4le9GJjkvyswytb6a1+rBrcnWuadr6jm+fX6c1FaxbFhWn2h5hXIrnthH0uJmIx2yG5giMJe4GFgQxqK0yOXVUMld7iJPu6TLcaF8T2Yc8RNBhihPCgdEzOBd0R41GRtElY9Q/VjiXq0MOC4oyez1R5y1/oGZrl66XIqOecL/jpTYckDOb7/XbRR4EHIYeSBKRy4k9wevaHVpCV2mQ9p4VHD7gVEyUaPzprv+7H4kn2A5i7BgpgBtfvn3/Bo4957DYM88/hDP46QDmscP+hYo0TunmKG2+wbprh1TFycbAq6W6E8Z1jOHemI4fLKyl6yyNjPNz9T/S0q4uQvsNH+VJBa+XYdG5s+wAcQESznoUZmJKFEb2h9Gvp15kaaH1Ir6j0gqxtgK7PX9mW2RGBTAzCubPaP+BnMPlJ/iA0Z6w+vhLjALJaHgD2HVSbm9a5M/qJ+2xqi0shfqxuVxeZr+U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e52fca-e864-401f-ffa8-08dd7c117b82
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 11:34:28.5815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7SSEfCwwDQtR/lYyhK/JfYZ+N7D5GIRrpxZ8yX+udRGj3MUFfseMWXGYDPP71TTgwYEof1JjSrU7fCBdYHBvlxvoR2lrG3loEpF9q5fzQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6538
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504150082
X-Proofpoint-ORIG-GUID: VQ-kbSLFFnzJxu3fl4Bj47c1-dE9Cs7R
X-Proofpoint-GUID: VQ-kbSLFFnzJxu3fl4Bj47c1-dE9Cs7R

On Tue, Apr 15, 2025 at 01:29:44PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Apr 14, 2025 at 03:33:57PM +0100, Matthew Wilcox wrote:
> > On Mon, Mar 31, 2025 at 06:15:14PM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, Mar 31, 2025 at 04:47:37PM +0100, Matthew Wilcox wrote:
> > > > On Mon, Mar 31, 2025 at 01:56:08PM +0100, Lorenzo Stoakes wrote:
> > > > > Greg, as we're late in merge window obviously now, could you roll up into
> > > > > 6.15-rc1? Thanks!
> > > > >
> > > > > This does not require backporting, as this is a critical change for mm
> > > > > moving forward, as page->index,mapping are deprecated and will be entirely
> > > > > removed extremely soon.
> > > >
> > > > "extremely soon" as in "There are four places in the kernel which
> > > > currently use page->index, and three of them are gone once Andrew
> > > > sends his pull requests".  So this will be the last user, assuming
> > > > nobody else decides to add a user of page->index in the meantime.
> > >
> > > I'll get to it after -rc1 is out, thanks.
> >
> > -rc2 is now out.
>
> Sorry for the delay, now applied.
>
> greg k-h

Thanks!

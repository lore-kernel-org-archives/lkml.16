Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A9421ADC3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023747; cv=fail; b=kMuhMsVvlx/OINNsf4gO9onTH9eiK3GClII2a1ySQiJ6y7y66hu2F4bWD1YgZXQUHjMXUO63eDEy37UVWnWmEPwXD5SfCSqmTqT+dUOa/HLiiyOWzqSxxrg8bSWFMk0Ju0/DaYBqXDTL/sPtCVEAkex1dfabys7ZYOR2JzALUYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023747; c=relaxed/simple;
	bh=6f+4bj7Z7JyKX7ja0oRLxrAAFnfqxfpJG7W8RJ2Oqmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NpFRYqUQrNSB0B9PmGKs6kcLTCYwwQ4oMuuDok12qUk+GgdJoIXvGGrxvFQYXTI2aOhLcfdbFXGttdz6Z0t4Ln1uCbSQKy/JwWnR+scVM5QBsffbBkEwBFlTKLuMS3iWsxtEnwxrPGcL1vKtwsUv0QpqtPJqcZpnZpO8K3F4dKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iXmSfJYf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GuYFujeA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iXmSfJYf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GuYFujeA"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UDaegW004572;
	Wed, 30 Apr 2025 14:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=TAxwUvClFc6PhOYsSQ
	jiBCXd1INn0gYsw8p/fkU690E=; b=iXmSfJYfluZsHoRYdruzRZUKQYr5Q7s3NK
	JV9P0o9GD/XNcwWuf8QkxhtEYw7bC5RGyAdxKcAkFvLzFc439NJskBjM/yCMpcdk
	q07aoCwPlpLYzecbZSJwHTPGQIgeXPyVbiRI1qVsAgIoZCq/6VCaMvCL1leTEjeG
	ClhYLNwj+nhT1gCFLrkQZybI5tGeCFXKmyWNzUDXcBzRXcIzgNhHRLiF14dhEefW
	vJtmmagRrFE9FUEZzOjgUXvHozRuTuZAU2HwiZ/TrYk/QdyEe8HZt9D6mj8KSRKh
	l3sH5YdRK/0YIgBI3XkBW02rMD9nMyiwM7yBBq59Uh9Ioa5ZImlg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6uksbgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 14:35:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53UE3Rdt001295;
	Wed, 30 Apr 2025 14:35:03 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxbcv4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 14:35:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xD+QS+sXKwYseHebreee58CRsdX9fB2v9yKK8rs+TlGKhexIp2T6ZXmgpWT1vC8Zh0d1GCzojC5qXzibAJbgqevEE4YEEO5wp/B3ImdSIE0oJdWKLa9iUpJtCZXXQeud0fuQUJjrCZA6h1VlJiSPy5jmFTvz4EchoGdcXm3c65HB/aONdtQHNzUkLXOX0dfsUDkXMQ8iijKsbmCAIQXproXNM+hO54okgwVxeG5bRJCSXRF3+9pjDPXSWJvhw1atA5ORa4zKsvnuYE0QEFLTbV+8MVgTXVhZeNkUKQdY5gSk5wBu1aaNzLb+9h7O/FC6bqkv8AyKvUgy/0Q2xBs2lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAxwUvClFc6PhOYsSQjiBCXd1INn0gYsw8p/fkU690E=;
 b=lGPKck5cvho4MJm8pTSiXvjFdaFY5fs4OJvV1+3/Z3rcnyNoqHMyHAEfURBNzf7ncVzF2P19xqEVQbqHnwSQu2ufr59upUi9pkzZoo7z4O3heGoN0Vr62xlSdPtRXFPZfHR+zkMdX1PsWS4A36ZfP+8gPvcXEzdz/OFe6Xlhyn/r1S49ByRhfuiiOBEpGEXf/wv+xuGaHsBOiH50+xWX2igQcCa/+c8yqc367/nLmFDxLiUtGYhjYXl/iW7VSVFmcJbGRMlLtJVDKHeHnHKWJmfu+cLEuK4yGdcPyJ25SlHKxM5aJMPDjHPDWA77gX+GTaSyLyoh31tpt9kbdXIrZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAxwUvClFc6PhOYsSQjiBCXd1INn0gYsw8p/fkU690E=;
 b=GuYFujeAuJwW2uE/Ospj3ACzUlrszsbc38ze2zaeTQc/r/nusJe9CEoT6PG0mjrCX6zl7HIVzwBOMfaLee6ZpW0wMb0g7YSu0/MTV8trkP5aHahmLyZ4ubjsOH7NfwiBqtSoarPo9FQSxTn4bPJ+yb9uQIy/TRo2B+av3L28uD0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA0PR10MB6722.namprd10.prod.outlook.com (2603:10b6:208:440::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 14:34:59 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 14:34:59 +0000
Date: Wed, 30 Apr 2025 15:34:55 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, namit@vmware.com,
        hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v2 3/7] mm: Add batched versions of
 ptep_modify_prot_start/commit
Message-ID: <9a2129ce-55b6-47e7-a879-00e7982c8ec4@lucifer.local>
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-4-dev.jain@arm.com>
 <8780e63d-22c1-4133-a800-dec50fd1b5fa@lucifer.local>
 <f561dab6-c70e-485c-a3f7-2c5198fcf8c6@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f561dab6-c70e-485c-a3f7-2c5198fcf8c6@arm.com>
X-ClientProxiedBy: LO4P123CA0341.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA0PR10MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: 33774304-c231-406a-6055-08dd87f42f2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2vxIE7+1l9ZgQh7ccHw+ED6rGlv67aqQKecideXt+nXi40bsVeuHL6w3ZeeI?=
 =?us-ascii?Q?LY4OqCDBcv88/in9KQEt3uBMu8dU69wBJgcYG+IHG8vlRZe1tLky+SLDxaYH?=
 =?us-ascii?Q?We/HPb7no8a4z3EDV+VsXjlAJot3wEmCjnz3Hcfk+X7j0seZ9p5OJNdr33nG?=
 =?us-ascii?Q?MDs06EUkGc9fjKUwNUktZ/uyuetF1DRfyQA5mpnAFCftPbQGbeKZAef6e4N0?=
 =?us-ascii?Q?L1pMHvBqasZk+ICoM6Bu8UYHOJdvnkZ6lZbXARnKNt5B2ligJf+JvAcbXp73?=
 =?us-ascii?Q?ENdEE+wQ85bSHywcO5+k0R3fTH25eUw5A1r1sldt44ExEfSyqkxCCwjwldj9?=
 =?us-ascii?Q?6i1J9p4KUB5wQ08vDDCB9OOeDH3S5gdTSwi0C9iDHMRxa8l+dVUSWtt4G3hT?=
 =?us-ascii?Q?vwsseggHlabr9p/X1Hpelajs4PSpEOVRedNVEmht9DeUi/BpQUn4edoLRIKO?=
 =?us-ascii?Q?zKTX5X6IXCRyLPAtARywpH2udj91h2X2eiHpaIbFedZ3vHEetjYnTDz5cwkD?=
 =?us-ascii?Q?YzgY3PjA4TlRRlf8ZBRRL5DTP1+ktWYOPMl8hAfMj8iV03T2jP0rENGoZGSM?=
 =?us-ascii?Q?wvsBzw8be/OgXUezP2XGUQmPD7O3K2ADGY1bpYBa4GetMhOBiwZb/a9w6AQY?=
 =?us-ascii?Q?Vuapb87f5Y6Q081U1RFqyGHQosYKfAMm/+UcLVS4vioTfJ3M8N6Rv1DSJJnY?=
 =?us-ascii?Q?bIxU86M7ugFyLMOEYBSnAzHgsULqi7aUicy/eCPlG4OAvslKgrGmik0dE2Mb?=
 =?us-ascii?Q?jdijV5TPGikPyBUG+pB7qnJTFzURoDQ2v21BT/vb1LxHwS6oZMpysyo3Za6E?=
 =?us-ascii?Q?n2IlMb66wvdQNajhx4ED8NEG88BmsJA//TI4z8JDeSmotTtXMmz0XPZ+2oOU?=
 =?us-ascii?Q?/ZjoGqezPj58NmRno6YH0RLzsxBV9kGtIQJLdfgic6pstfXm7bV/c27kgjYn?=
 =?us-ascii?Q?dJzJR+sVUeV1YCBFPTm+ICfeDFmn5Mjsn39J9ErDH8D6GZqSWVf1cXOdS9Fn?=
 =?us-ascii?Q?uxBWhJqwF8egUbauh+WcMGdH2s143Bs+0ZOA9+IuMxk+RFo27ftG3XGxJFzB?=
 =?us-ascii?Q?CiXJ1WJzVXgb9NssHJSLxNybJCTkAzZ/qWD5FivHI8PMGlwCHgf+bs+2yD/k?=
 =?us-ascii?Q?mA6gCRCU00vZh2Chu0F78Z7mhGItaQjexhP7udiKhHRHS+vu2mo1KZYT13kB?=
 =?us-ascii?Q?SZ7huRAJAg6SFoxwaPkAaBMhZ9SL3q8fCLs2ZIPaCxGa9SZC6fbbtLiUmxGk?=
 =?us-ascii?Q?GoGFCkBEcgqvIQG0T0rptQDd2hDGgfuHA43kYDzfrlsPVjHvrD6/anlsfBx9?=
 =?us-ascii?Q?98a6raeF9S2KhZFqLgHm49CLq8/o/0hUlCgE69YXWpe/YijWk1IZYbCWBiYx?=
 =?us-ascii?Q?9eVvFMWtzORTZaEQzli+IyJWnMzbhfqY6eoshL1qxmSk4C4/kW7r7umgzU8F?=
 =?us-ascii?Q?2SUSKbKsO+U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8lrOumReYDNUgbGYoe1HqFrUfl1CXv62QgJBdPThenNbiWMvcS4Ooj+8k64j?=
 =?us-ascii?Q?5aRTtXLnG+Rrx38r3RwK/DKB4VkDMuKKnp5/PlSOj9Kt36rsrKGWQrdNaXAB?=
 =?us-ascii?Q?d96NoVahFZnPaexoB+TVSI2bw7O5v8L++N3Hzjr5eXM31KyH9vLGYNpyUdyg?=
 =?us-ascii?Q?Och7Hviq/5exqQpdylKmXKJzbWFsDKfgvNY0Wk5EsveAk89webUnsw5x8qzK?=
 =?us-ascii?Q?8fIPIuVNiuEXK80LC9oARTKcyhVSlwPabDbcHglDxunRDHCcYbqGMpwFoapQ?=
 =?us-ascii?Q?AlA1JTA3rrlFrk40BfjM56mxJ7o5O4KKVXGqBPtB6qXfuQEKTGZAQPoyar+b?=
 =?us-ascii?Q?VvRq4iiKXc3fu6utFmXpiPOCaO1TY3aBeXbltlxy63irbtaCiuTHXMHv2DRE?=
 =?us-ascii?Q?+Ry7EOM4b2by4Z4HRGrPzOFcHWe4Frvz+yXoN4rOI7UNwTiitLioBxtGZl8W?=
 =?us-ascii?Q?ITitnLb0kJmkKVSADUz1hxSD0bVBU7Q0oLJkWlQLKaXe59vnGt/465uZYMsj?=
 =?us-ascii?Q?Gb5WvHNujcWGTiV9BtfiQvM/qUa3TCV6v2Yv23M+uAeu30uYcY4Yas6GW0Yj?=
 =?us-ascii?Q?ONt27fa15+9Pmd2RTZdrFY9WRIZYUrWD66C2iQzr4j0Quqy491VBS5V7or3Z?=
 =?us-ascii?Q?vGkIHdTHkUKiDpQpKOSoT+gYsCtxnd8tMutDzkd/o3UfNbuyoD0v/nQeMNlG?=
 =?us-ascii?Q?BiYRHSaalk7xYZsDuQRkN5A+k2DFGCw4V0Vy5gxbMOL5Td58OcGC5yv3rr3K?=
 =?us-ascii?Q?AAa8wFgeIJi+qrH8FeRK/oiiI4VRZU63hMZUDIJoJgx37C5+ciqWUwvYOolF?=
 =?us-ascii?Q?Et/xwzoi7l3ej35gxwFnGPH5PGj/IvrYMRUey9WCFx22m7PoQA0QRgo3BkpV?=
 =?us-ascii?Q?jQQpngV+Qk03R0nIXfWenZcVjteaCEpfFK7BBKFJNQDs129mWqzW5iZR8ViR?=
 =?us-ascii?Q?twn9Sdx2BT81KVY/MtLSWWSPhr2u8j+mFtdnqQ6XcouoTdPPPtH83yh8MALG?=
 =?us-ascii?Q?I+9aXXoJ5KwHncXW1gFnR/Af07AFjXbI3ddC4rcBvH0+irukt0ko16ACGlsf?=
 =?us-ascii?Q?dgNGrHmynHgBLdTBQbQHwQPEwNapS9jMKM4BxpPJScFnxW9ObZfP1WfuciVj?=
 =?us-ascii?Q?+9XHkQNA8pSXSx7bvMSru/lp3xIQq0w3mxPUedKFoL0HWxPr2bc8/3ly3V+M?=
 =?us-ascii?Q?L4as2L7KRsgfPJ3NjVW2B6/3EAjcciF0zQS9IwBtMiWig3hE2H7F0XNDZfE+?=
 =?us-ascii?Q?G5TDXV6AEsQVcLdeWTJ8iyo7HMANRnmQJp9ZcT9aJYiKkg8RQAeThP/UHV5V?=
 =?us-ascii?Q?AEap4vyp9JloqnEPwrwXcqAxFnnibzAMeNPCg+zgphiZQM3YW79k5evmORnC?=
 =?us-ascii?Q?lyjxUGyi5n7zWQxiqT9FPiuSIaC+u/Vi7HBubH5+/wofg+12benYZ+3LbVM3?=
 =?us-ascii?Q?AHKEQE07WI4NCK9wp4iecjBSOQkL44kxxYjVII8RvDNN2QxXN9Zf/X7C1NVj?=
 =?us-ascii?Q?RzNKaalKo85qpAQ2ZHFb0md+O0kSSJDTBMvDkKwGgsqa1+Km29rq3h8bAgyp?=
 =?us-ascii?Q?LlHoDejS+C2atXlKSV9tUou2Sn/IrwI5a4fmCd1FAmZn23o6bmUFKj1w40ds?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AMEICtaFUO010RpPVpGpzxt0Gk8mKkdFQEBH9ck7cGT98paC09jTKtbAQFF8KmBkNUPew55lT2pp4+rnW0dPj1DXyi+KUzssCDmcNM5siT9RCATAouBpoegtUSkAazPaDpN63pdvzkAKwAHdK/shUHCT7SIomHljGzoWoxw2zVPbLdB0R33IZ0CoO066iqa69riYvSqgshZMRiyx3hcm22uaRSOGc7d0ksh92hcwM93tUUJ186n13v3BQy8MjrRBQJEPJysfXCZwC6lXZUHOBaWMXc21+QUKugpZ+9ag1l3nZa30NwTPbjwzloBgEA3+pIG0ODN5feMavqpxsGpvx/jgrNP4EXb5OAQLtKQhmn3WVpgAsyH1pEWcnwOmfWhXcQygYCxInXNV9k4ALlnLUXFB9l+Dd5d2e6Ybk5zpCSEWDpadDhi6i49LnKYReMlwI9T8Ce9gwgFmOkQJ4aQ6IVf1UwTSUaR8Nlphpi5W3EAvKjC4L5DqmPrKsEtyxE4ds67xP52i854QY+OlRDKAyOyJ6r7C6fvyhzvuhWM4jDLvHcmby5EGVFA5+qAj1vqM8Y3iCP2gmaEmkxUZhs/z+C6ft4YDPsLlPzNVzK0JwN0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33774304-c231-406a-6055-08dd87f42f2c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 14:34:59.6183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPmbK4fRtWHb/gmfalbiYkLBsfwA9OM+SfPaLdN2/Vc1cB7XeY1DzPvAKUCV9uGsI3uZw++plFEzvrjZrt/zAMYg1vWpzVV4YI2h41EZsB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6722
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504300103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDEwMyBTYWx0ZWRfX1RXgJqN56W2j VzV20zUqNN13ym5cVCADfBvJxi4MKAURoDHqp9ljkutNzGq1uQ00pkmbMSJTPtIqEF41yDoG+HY B6QF4Sk5RNoOwBsEIVGm5moO3WJyOSBz+dnqaCOG/zK7XFiM5FC60haS4H2zIAUwpg1v5wy6s9K
 pcY43m/hNkjE5hUT1GCwPijxKlGAxpjr9LfRj+aOefmdriH88t3pX23E5Sf+c50AmPzMlo1OrNY i7aHpdid7m+x2xvtWQQYCb9cHb9VzExHkwwkgi7XyduIbLQwcwk4YdEd+wp1QtKP+lPebf8JzXe WgAIkta31BiVu2xZMjjGt9J51QjqOF89dW6WZ6w3vqdsQjziQz9CSXDBpBbAfyOHTDnOwxID/6K
 q0PZgz9oDvGSEyOza2CmOf1eP8IClZ+jlJrKS0Teaq6Ts4/lna2I7RB+ZLqLnw76vtc/aLKw
X-Proofpoint-GUID: 9XHO-wN7Upi0xuHlC-uYjnyIU_foiRDF
X-Authority-Analysis: v=2.4 cv=A5VsP7WG c=1 sm=1 tr=0 ts=68123518 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=E5ofCvxB5CP5SYqwKgQA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13129
X-Proofpoint-ORIG-GUID: 9XHO-wN7Upi0xuHlC-uYjnyIU_foiRDF

On Wed, Apr 30, 2025 at 03:09:50PM +0100, Ryan Roberts wrote:
> On 29/04/2025 14:52, Lorenzo Stoakes wrote:
> > On Tue, Apr 29, 2025 at 10:53:32AM +0530, Dev Jain wrote:
> >> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
> >> Architecture can override these helpers.
> >>
> >> Signed-off-by: Dev Jain <dev.jain@arm.com>
> >> ---
> >>  include/linux/pgtable.h | 38 ++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 38 insertions(+)
> >>
> >> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> >> index b50447ef1c92..ed287289335f 100644
> >> --- a/include/linux/pgtable.h
> >> +++ b/include/linux/pgtable.h
> >> @@ -891,6 +891,44 @@ static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
> >>  }
> >>  #endif
> >>
> >> +/* See the comment for ptep_modify_prot_start */
> >
> > I feel like you really should add a little more here, perhaps point out
> > that it's batched etc.
> >
> >> +#ifndef modify_prot_start_ptes
> >> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> >> +		unsigned long addr, pte_t *ptep, unsigned int nr)
> >
> > This name is a bit confusing,
>
> On naming, the existing (modern) convention for single-pte helpers is to start
> the function name with ptep_. When we started adding batched versions, we took
> the approach of adding _ptes as a suffix. For example:
>
> set_pte_at()
> ptep_get_and_clear_full()
> ptep_set_wrprotect()
>
> set_ptes()
> get_and_clear_full_ptes()
> wrprotect_ptes()
>
> In this case, we already have ptep_modify_prot_start() and
> ptep_modify_prot_commit() for the existing single-pte helper versions. So
> according to the convention (or at least how I interpret the convention), the
> proposed names seem reasonable.
>

Right, I'm fine with following convention (we should), I just find 'ptes'
really ambiguous. It's not just a -set of PTE entries- it's very explicitly
for a large folio. I'd interpret some 'ptes' case to mean 'any number of
pte entries', though I suppose it'd not in practice be any different if
that were the intended use.

However, the proposed use case is large folio 'sub' PTEs and it'd be useful
in callers to know this is explicitly what you're doing.

I feel like '_batched_ptes' makes it clear it's a _specific_ set of PTE
entriess you're after (not just in effect multiple PTE entries).

However, I'm less insistent on this with a comment that explains what's
going on.

I don't want to hold this up with trivialities around naming...

ASIDE: I continue to absolutely HATE the ambiguity between 'PxD/PTE' and
'PxD/PTE entries' and the fact we use both as a short-hand for each
other. But that's not related to this series, just a pet peeve... :)

> > it's not any ptes, it's those pte entries
> > belonging to a large folio capped to the PTE table right that you are
> > batching right?
>
> Yes, but again by convention, that is captured in the kerneldoc comment for the
> functions. We are operating on a batch of *ptes* not on a folio or batch of
> folios. But it is a requirement of the function that the batch of ptes all lie
> within a single large folio (i.e. the pfns are sequential).

Ack, yeah don't love this nr stuff but fine if it's convention...

>  > Perhaps modify_prot_start_large_folio() ? Or something with 'batched' in
> > the name?
> >
> > We definitely need to mention in comment or name or _somewhere_ the intent
> > and motivation for this.
>
> Agreed!

...and luckily we are aligned on this :)

>
> >
> >> +{
> >> +	pte_t pte, tmp_pte;
> >> +
> >
> > are we not validating what 'nr' is? Even with debug asserts? I'm not sure I
> > love this interface, where you require the user to know the number of
> > remaining PTE entries in a PTE table.
>
> For better or worse, that's the established convention. See part of comment for
> set_ptes() for example:
>
> """
>  * Context: The caller holds the page table lock.  The pages all belong
>  * to the same folio.  The PTEs are all in the same PMD.
> """
>
> >
> >> +	pte = ptep_modify_prot_start(vma, addr, ptep);
> >> +	while (--nr) {
> >
> > This loop is a bit horrible. It seems needlessly confusing and you're in
> > _dire_ need of comments to explain what's going on.
> >
> > So my understanding is, you have the user figure out:
> >
> > nr = min(nr_pte_entries_in_pte, nr_pgs_in_folio)
> >
> > Then, you want to return the pte entry belonging to the start of the large
> > folio batch, but you want to adjust that pte value to propagate dirty and
> > young page table flags if any page table entries within the range contain
> > those page table flags, having called ptep_modify_prot_start() on all of
> > them?
> >
> > This is quite a bit to a. put in a header like this and b. not
> > comment/explain.
>
> This style is copied from get_and_clear_full_ptes(), which has this comment,
> which explains all this complexity. My vote would be to have a simple comment
> for this function:
>
> /**
>  * get_and_clear_full_ptes - Clear present PTEs that map consecutive pages of
>  *			     the same folio, collecting dirty/accessed bits.
>  * @mm: Address space the pages are mapped into.
>  * @addr: Address the first page is mapped at.
>  * @ptep: Page table pointer for the first entry.
>  * @nr: Number of entries to clear.
>  * @full: Whether we are clearing a full mm.
>  *
>  * May be overridden by the architecture; otherwise, implemented as a simple
>  * loop over ptep_get_and_clear_full(), merging dirty/accessed bits into the
>  * returned PTE.
>  *
>  * Note that PTE bits in the PTE range besides the PFN can differ. For example,
>  * some PTEs might be write-protected.
>  *
>  * Context: The caller holds the page table lock.  The PTEs map consecutive
>  * pages that belong to the same folio.  The PTEs are all in the same PMD.
>  */
>

OK I think the key bit here is 'consecutive pages of the same folio'.

I'd like at least a paragraph about implementation, yes the original
function doesn't have that (and should imo), something like:

	We perform the operation on the first PTE, then if any others
	follow, we invoke the ptep_modify_prot_start() for each and
	aggregate A/D bits.

Something like this.

Point taken on consistency though!

> >
> > So maybe something like:
> >
> > pte = ptep_modify_prot_start(vma, addr, ptep);
> >
> > /* Iterate through large folio tail PTEs. */
> > for (pg = 1; pg < nr; pg++) {
> > 	pte_t inner_pte;
> >
> > 	ptep++;
> > 	addr += PAGE_SIZE;
> >
> > 	inner_pte = ptep_modify_prot_start(vma, addr, ptep);
> >
> > 	/* We must propagate A/D state from tail PTEs. */
> > 	if (pte_dirty(inner_pte))
> > 		pte = pte_mkdirty(pte);
> > 	if (pte_young(inner_pte))
> > 		pte = pte_mkyoung(pte);
> > }
> >
> > Would work better?
> >
> >
> >
> >> +		ptep++;
> >> +		addr += PAGE_SIZE;
> >> +		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
> >
> >
> >
> >> +		if (pte_dirty(tmp_pte))
> >> +			pte = pte_mkdirty(pte);
> >> +		if (pte_young(tmp_pte))
> >> +			pte = pte_mkyoung(pte);
> >
> > Why are you propagating these?
> >
> >> +	}
> >> +	return pte;
> >> +}
> >> +#endif
> >> +
> >> +/* See the comment for ptep_modify_prot_commit */
> >
> > Same comments as above, needs more meat on the bones!
> >
> >> +#ifndef modify_prot_commit_ptes
> >> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
> >
> > Again need to reference large folio, batched or something relevant here,
> > 'ptes' is super vague.
> >
> >> +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> >
> > Nit, but you put 'p' suffix on ptep but not on 'old_pte'?
> >
> > I'm even more concerned about the 'nr' API here now.
> >
> > So this is now a user-calculated:
> >
> > min3(large_folio_pages, number of pte entries left in ptep,
> > 	number of pte entries left in old_pte)
> >
> > It really feels like something that should be calculated here, or at least
> > be broken out more clearly.
> >
> > You definitely _at the very least_ need to document it in a comment.
> >
> >> +{
> >> +	for (;;) {
> >> +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> >> +		if (--nr == 0)
> >> +			break;
> >
> > Why are you doing an infinite loop here with a break like this? Again feels
> > needlessly confusing.
>
> I agree it's not pretty to look at. But apparently it's the most efficient. This
> is Willy's commit that started it all: Commit bcc6cc832573 ("mm: add default
> definition of set_ptes()").
>
> For the record, I think all your comments make good sense, Lorenzo. But there is
> an established style, and personally I think at this point is it more confusing
> to break from that style.

This isn't _quite_ style, I'd say it's implementation, we're kind of
crossing over into something a little more I'd say :) but I mean I get your
point, sure.

I mean, fine, if (I presume you're referring _only_ to the for (;;) case
above) you are absolutely certain it is more performant in practice I
wouldn't want to stand in the way of that.

I would at least like a comment in the commit message about propagating an
odd loop for performance though to explain the 'qualities'... :)

>
> Thanks,
> Ryan
>
>
> >
> > I think it's ok to duplicate this single line for the sake of clarity,
> > also.
> >
> > Which gives us:
> >
> > unsigned long pg;
> >
> > ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> > for (pg = 1; pg < nr; pg++) {
> > 	ptep++;
> > 	addr += PAGE_SIZE;
> > 	old_pte = pte_next_pfn(old_pte);
> > 	pte = pte_next_pfn(pte);
> >
> > 	ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> > }
> >
> > There are alternative approaches, but I think doing an infinite loop that
> > breaks and especially the confusing 'if (--foo) break;' stuff is much
> > harder to parse than a super simple ranged loop.
> >
> >> +		ptep++;
> >> +		addr += PAGE_SIZE;
> >> +		old_pte = pte_next_pfn(old_pte);
> >> +		pte = pte_next_pfn(pte);
> >> +	}
> >> +}
> >> +#endif
> >> +
> >>  /*
> >>   * On some architectures hardware does not set page access bit when accessing
> >>   * memory page, it is responsibility of software setting this bit. It brings
> >> --
> >> 2.30.2
> >>
>

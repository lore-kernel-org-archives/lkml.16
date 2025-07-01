Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833C74A0C;
	Tue,  1 Jul 2025 08:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751358367; cv=fail; b=BWw8Rta5iDe1mKVz9e1N4ex6fNIVFooU/KueBeE2LLuJ4bcuhKn9NIbM+7bYUpTWCyVwzP+piZ8u0bZqG+xfIogvsJGIzvY7yzq+osAGpiYJC+YQV9eMOp50xe+3he256kdA/u5GQKJoqgUMowLPuzohTPLNn9oWogyjkRlv2b0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751358367; c=relaxed/simple;
	bh=0sTgISCrBjd64LDzVR6RbstjKPfkan4QUitUgB9CgHc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G3QU/963TgwPwNIjF2iWQNy9//jqiK1VJC/1VKaw/7vmTUCPo0nmWFFZQtJYdnJ5aKHb76yFfG2udgjcegfNG0FQO1Du6ozhgFeHpe1vockBlkSmTFTOj0HUrIFOTaGV2I4xuZIhlrqPWjeoB+Sfsa3S8DfQCncBFipCib8A//4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W+xbOGlR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jiiutEoT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W+xbOGlR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jiiutEoT"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5611OcUC025895;
	Tue, 1 Jul 2025 08:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=c4ZJlvPkklOPiZyvanZ/xBW36RhTo1o9AB2c+JQqhxA=; b=
	W+xbOGlRmMKIHa9IASQ6hZCfJmXKS3heCwdMm6bOdxYF960g3ZBP//WRf58D2UNx
	EJRXOBKJgSP+uIBgQ7Wq5d07cQY6ToSi5D+y0609p0fc4bxomS18Bdws69iBcbn1
	4n45SzNCHvliadXyoYQSmOjN/dFEih79MGfqBNHB8d0NaUbmAC2FIaXmVAvgcxEn
	Yv0aSLOY5WJcxc5txnCvy5eRcP10z+/ikk/SDs7+4dHhXJlk8PAjU9p0Bkckt0lT
	b3dGsrngUy2DTmLsX69zNWJw/rFsTDEkHZU61+HRWr2OyJ/npfl/I6eFfU64kG2l
	kPwGB0YRdf/gve9ftvlICA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8ef47u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 08:25:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561729Nw017760;
	Tue, 1 Jul 2025 08:25:37 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1e6s90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 08:25:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMq7qBJ6wEtyzN0MaOiwJcUXIULQja+Zp1yinBXHz74Xt9wU2dKOFfcoCVTy+Xu6H97B+E1Ne8UEH415U2SXGknDSnU4A8W3ULAwzWfBM2pHwWLXfezpufXtlQLLsYNL2mY58j9vwx3+KEB0yDvGuTz/jauA7ph0LTa8NCmBI6XHXOx5QMGTp8W8ljw1I1WXn8kRPZ8l9Qy+dKh9HoLIqZOyUnBA7C7xLRLnErUPy/J/h5EZaSEYrlnSqTxCtCtw4BaoFmmEX5+/fyUGB8/qUVz3V8LVIpG4b67V1tl/E+RTsoTSCf+OWt0xZ9ex/2HjarH5PuOGWP4xA0z7ZsSvwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4ZJlvPkklOPiZyvanZ/xBW36RhTo1o9AB2c+JQqhxA=;
 b=iEXky0fzzUFBlUG0nbO48s9B+Z3/9fR988VsPxOta6pyX8P02kMgOZuwjsLoCb0jbuubhYAVSsT7gLJ5pRso/4ljXvQlNZJwGg03I0O21NdxknlENlTQ4931JTRqv3Zw5iW1hSYV1e2TA1jCiIRRv7r3psBZbJyyZSE4ieNiPaq/ZY+FYIjcwKyL76HGmicbDsFC/+3pqDA87Osv0oVCnyZ9fFS+eOOLkmRcpAwc6bx3I93Vavqkw5Jn19eyk2HKfnJRTJ3H9lQoPCflwPu5PnIFjNi7htypu6xN9TU2geSNAdF2sPLSuLrF5eaxCTl6vtsJOmUuUsMHnFJqF7nBkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4ZJlvPkklOPiZyvanZ/xBW36RhTo1o9AB2c+JQqhxA=;
 b=jiiutEoTDsJ+8gtMplswD7jcW7lfMS8QG9H05WH5ByxhW2awD8WnxtM5McGuJhzEgCTNJXIvmyngj8eC0cHdiiaDWkDizLocLq2lRRf5GNGTr5VxmIsZEV+xc0q5BRHX2CHszuA01TvNeeW/wzr2HbwY0Wcd0srLtL0xRYItm1o=
Received: from DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d1f) by CY8PR10MB6468.namprd10.prod.outlook.com
 (2603:10b6:930:60::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Tue, 1 Jul
 2025 08:25:34 +0000
Received: from DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 ([fe80::2072:7ae5:a89:c52a]) by DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 ([fe80::2072:7ae5:a89:c52a%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 08:25:34 +0000
Message-ID: <706c24a8-125c-4902-bae8-82eea16ee2bf@oracle.com>
Date: Tue, 1 Jul 2025 01:25:30 -0700
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH v2] sched/numa: Introduce per cgroup numa balance control
To: Chen Yu <yu.c.chen@intel.com>, Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>
Cc: Juri Lelli <juri.lelli@redhat.com>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Phil Auld <pauld@redhat.com>,
        Tejun Heo <tj@kernel.org>, Daniel Jordan <daniel.m.jordan@oracle.com>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        Aubrey Li <aubrey.li@intel.com>, Tim Chen <tim.c.chen@intel.com>,
        "Huang, Ying" <ying.huang@linux.alibaba.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
References: <20250625102337.3128193-1-yu.c.chen@intel.com>
Content-Language: en-US
From: Libo Chen <libo.chen@oracle.com>
In-Reply-To: <20250625102337.3128193-1-yu.c.chen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:510:5::32) To DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d1f)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF5ADB4ADFC:EE_|CY8PR10MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: fb2275cb-1a98-490d-b132-08ddb878d991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHBlbVVJZmI1alY3d0FYL1FEVThXWTJXYTdOS3BRaGtHdXViVzE3SWhBTGZT?=
 =?utf-8?B?Q1dRMGRsejhGOUQwQS9lcUtYaXAzbjUxQzBGaHFDOWlhV2ptUEgyT1hYL2lt?=
 =?utf-8?B?eURhb0R4OXBRY0VUUTFpNzI3RHlFN3lxODc4RS84bWZMbmpqQWJsZ04vSXpT?=
 =?utf-8?B?YytFeXdUOGhDS1BoUUFOdHJabkRwN29wM1NiMDI1a0xTS1UwOEFTUUlLL1I0?=
 =?utf-8?B?czU0Y1dZdndYU213T2lVTDhaaWJwdlUycGVwbDlHemJNalRjclpEeGtFSHhm?=
 =?utf-8?B?R01UZUZERmdqUUZoZEM4YnNrRTMrZGtLMFYrZmhmVkVVS0RsZEVoN3I4d3Zk?=
 =?utf-8?B?azBWWFR6MzUvcngwdFRCTU9uRG9VMWtFY1hhTHlRT1hIV2x0Z3dHMzdtbm1l?=
 =?utf-8?B?a2VWSkRORmdpeFVxbnpweCtNR2p6TEp0QThyTjVIOW8zNjRrL0xLTEI1UEY1?=
 =?utf-8?B?MVliVllTNEdPbDMzTU83V3dLRkNmVE5rbTVwVDJ1SS9NMm1BUXRJT0JLSjJC?=
 =?utf-8?B?OG41SlQzVFFsTWdwY05aVHJZT0dwQjIyRTFEcDFrT2g3bTVDa2JTVUJvelFm?=
 =?utf-8?B?SG5JRFJRUkIzRjJzTmMvbHZ1d0Zza3NqS21jdWN5Rkc5akluSVpZcyt4Vkpa?=
 =?utf-8?B?TmtlKzdoTUtqajQ3Ky8vZCt2ejYvUHRjQlRJQTN3OFJILzhSZWdQb05CQzIw?=
 =?utf-8?B?WG5UQTdmM1NVcUo3V0hZOTloMkNLSTNVaXhSbTNpVUMyanFJaElnQ3VHT1pp?=
 =?utf-8?B?VW5Va0lXTjZiRWl3Z1M0TnY1cDZYdHNCMGJMYkhoVGxRcWpnTkVnWHl4SXd2?=
 =?utf-8?B?dGF5VzkwWXRHRVFBTU05bnM2V2xTQWlsazhSOVY1RHBBUml3TCtrRjZZVTZY?=
 =?utf-8?B?NGlnbmU0Z2lJaGJkNklrbTZ4eWVjK3hnMkdqVy9JeERnTU1CSXA4UDNLa0w5?=
 =?utf-8?B?bS8wYmxGVWcxbUcyaEdYRi9RaDFkb2FscVFWQVE3RXd5RlhBZFFZd2kwTDE2?=
 =?utf-8?B?QWxUTjF1UTJ1NWN2TGYvcnc5SmtQNVo4ZUtVVmhGYXMzclNPL0pKeXUybGdt?=
 =?utf-8?B?T0c5dUg3SmhEbU1tUE4vbU56MlA2SU52OEVWeWppb1lKNkdvN1BwZGhVL0pQ?=
 =?utf-8?B?OHNqMU9IK25FVUdUbmFxWFgzemRSN2VlK3pGNE1wZ1BwbEs2eGhUVlBVdWJ3?=
 =?utf-8?B?Zjh0VE5jSGdTYkNtNkFjbTYrTFQzSndrZTdQaXY4MHNOR3owaml2TXF4aUtK?=
 =?utf-8?B?VWJLcHF0dEI2WDBwZ1UvSzRFbURCaEFOc2d1TGZWcTU2czdYcjJOeXZQWEw0?=
 =?utf-8?B?RTh6aTFyazFXOThKeFBpQ0Rib09iREFMa1BXcWdMb3lHTGJYSkhmaHR4TW9t?=
 =?utf-8?B?NnlTYjVUWTUzYUVDTURKS3pXZkpiQ2dueTRNTEFBOUJzbjV2VS9za0htZzJD?=
 =?utf-8?B?Y0diQWxuZVVsUHhOL2YvbzBWK29mWEdVQUx0U3dpdmdKTnh6S0NtbGtyaGg1?=
 =?utf-8?B?bkVSUlhlaExxSnRmNVpvRzdSSmxLbTExVXVYZGo2Y3dOaE54c0hrSENCZC9O?=
 =?utf-8?B?bjN4WHMrZ0NxWjg5L3U0SHlxMWdyeW1XL0RhcHB1UDBHWExVTGNJczZVTytj?=
 =?utf-8?B?OVEzNUQ5Kzd6RjJ4MG5BRHovR2w0L2JkSGk3VDZOTUZ2KzMwcWVkMkNpNFk1?=
 =?utf-8?B?bmc3TlczVTkxejVHNTI0bkY3cDZRYTBMRUdSVnNienl3UGpSZ1NCQ2hTSUNK?=
 =?utf-8?B?K3FEendiYnhkOWdUV1hBY2lJNnptWDBycUZLczBCOExRVHRONE5GaTVjMWZ0?=
 =?utf-8?B?azhScmkramtDTFZTOU1LNFlFUTg4aDQwcGgzNWQwWXQwdlJtRHhaYXBVbm9M?=
 =?utf-8?B?UjcyaHYra0VFS1lRSW5DbU50U25YZGVIa2V4Q0tCT3A3YWlkNm9DNXlGTjEx?=
 =?utf-8?Q?AYCqtZr3KeI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF5ADB4ADFC.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0V1Lzhqd1o4dGtqRXA2c0tETVBTTzVPWXJwRzVSZ2RRTUVMZEIvRkVvM1VK?=
 =?utf-8?B?cy9qU3dxelZ0MWNSK2JaRCtrMkhqc0dadldWdE9nRUFUY0dSczFoZGNEQTZk?=
 =?utf-8?B?TWRtcG40bjZJVWs3bXBmUTJUUFBjUzZrT0dFOVZubnI2c05HMFU3MUI5dGVG?=
 =?utf-8?B?aVAyUjRWTEJ1VlNTSG5wK21zRmYvRHoyY0sxeVRtV0NheFg5V29oWU8zSjVC?=
 =?utf-8?B?bHZNNGFpMXJDOGhyOUQ0Zk1DVzh2VEdHOHprYTJnYzV0bG9xWElsU0lpRzZH?=
 =?utf-8?B?QzA3NWJNbTFRVnRuUndEd2IxOTdsOEc2TWxKQ05VZ3pQNFRJUmlpakFLaVRH?=
 =?utf-8?B?eXlRTjYxRFpiOVYwa0tGdDRLQnVWUnFaRnJuaVloa29RbXN0dVNDUGJZZFl0?=
 =?utf-8?B?a2Uxek1wTnc0S25tWEV5Qzl5VTlUSjcvNTdOQUR2elJ2N2I1V3pkOGpnZlVQ?=
 =?utf-8?B?czNvMzZlb04xM3Rrb0xaN0xwckI0QnBFTUc0OCtDeUxBT0o3anNySE5sWVhk?=
 =?utf-8?B?bUVnRWJJaDRxNlYvZ0FXbWpnK28yU3NZNVc1aHFOeHNwcFI3L2p6NHJoQnhO?=
 =?utf-8?B?ei9ITGRSNllndnU2Z1dJVjYyT2E0SEFUOGJ6bUJ3NlRRUHFHOGkvVnFRbmxn?=
 =?utf-8?B?aVdweWxPbFBmZ1ZaNndlZHk0VURxT3l2VDVheE52aUZmTG40cDRWR0IxTFlM?=
 =?utf-8?B?NVN5WnJpU0ZjNFo5MnRad3pZdlJxckpWenBMaGtzSDR1cmFaYlBsWUZJYWJS?=
 =?utf-8?B?UU9XMXVpM2hnUk43ZDNkMUV5eW82bGNSWi9VTmYyZ2FqT3RyWDM1V0dXTzl3?=
 =?utf-8?B?VWtnVzJqRHN3VC9zNWJ5RmRiR3ZTV3k2elJZQURITVI1RWUxNGNtWXhZQnZP?=
 =?utf-8?B?Z3V6YTJPY0V4ZGdmYWF5R2VHV0swZTgydXN2T1FxTGp6eFE3MzJsbXpHNnpB?=
 =?utf-8?B?Z1UxcDdwcWN0S1dCaElNTEFSNkpadENnMzdCK2FWVmdJNDFDZ05vRUxHTTla?=
 =?utf-8?B?bmVUbk03d0orYTIvY0ZUR3dETmkwSXVGTG9LUVBiV0tKNDFrTGlLVTFRRERo?=
 =?utf-8?B?c3JaRUlCOUlsN2QyeTJYQUZUWjBLdFhjUXRSOGI5VkhScWNXZmhOV3ZULys1?=
 =?utf-8?B?VW9SUkdkMktaaTkyU29uaEtnNmo4TmcyVTBwVGJHNkl1aDgweWhmck84SUJE?=
 =?utf-8?B?Z1ZMSjBSSGJUdmVkSDNXaGxFWnVLRjN6My9RWHhUMDdPTlljekkyWXI5K202?=
 =?utf-8?B?MEljdUlOeVMwUklzUFNnalEyUnJ3bnl2cmlYZ1J4UXV3ZTdnems3SUhkVFFS?=
 =?utf-8?B?SzZzUHlrdjROVVdSYTZwcXhCdUpTTExOS3V3MXU4M2NpTXJydk4rQ2cyRWlx?=
 =?utf-8?B?RndQVHZpRmQxZFIwSW5kOXJQWWtRTWdGSER3M0pvcm40NUxPN25tVTBLVW4x?=
 =?utf-8?B?K0IzRE5kRUM3SlA1TkIwK2RKM3A3RjFMNkt3WTVySG1NekJnM2Vxd1E1ekJM?=
 =?utf-8?B?RWY4MkFydjAvaWdBKy9PdnFZMGhWd3NFSm9sVDFidHY0dHF2Q2FGWXFNUW5o?=
 =?utf-8?B?c005ajFVMStCei9PSGRVcy92WnE1REVwT0FZaGxEWDhvRm9JNjJNSElYbE14?=
 =?utf-8?B?YnAvdkgzb0VZQUtKSk5RM0oxVDJ4K0dRL0c5Rm84STNtQnpNZlU5OHg3RWF5?=
 =?utf-8?B?Q09Hd0hyWnpROGtjZ0xaN3V0cXNHRGJXd25iS0V0c1E0TndCQ2FDZEpvdGtv?=
 =?utf-8?B?bVpQK200aHFVRTlhalpLNE96YnNqYjgyQ2RMcjZIcWc0NGdRRS82MEkvaXdB?=
 =?utf-8?B?UHJWSEVGYWM3Nm9oRmFFRmJVVGNQUmdxcGRDeFB5SlgrWlpSckZHSlBJNUp6?=
 =?utf-8?B?WVhDU05jWnBna1VSb2Z5Q01IcWduYmM0Qy9GZVhNVldLVGpWZzZGcU1vY2s2?=
 =?utf-8?B?Y1ZVQUhYbVZoTElyS3JkQi9LOUFBNEpjbW15TnFoK2JnTGZESGgzNW5CRHhL?=
 =?utf-8?B?Sk9BYSswSEZVTUd6a3dTTDdRb0E1ZU9lTWw0K01VUzgzbHZmTnRwY1ZUNHpC?=
 =?utf-8?B?cXFJVmFFMnQvZ3RDUUlDQmxId3lGMDRWS0gxakJhWGRYUVVGL2E3UlNlSlBY?=
 =?utf-8?Q?kSej/XRNDtn9DmmCfNSkurh+Z?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7+WK6xAp0q7Wq6AJo4wK++biw+xtW/FNQmDEMvlkVuWnir8f/zbPKRuS1VHuOTTycoe3iREoCbTxMNQeIFOSpKOT+CqhdCWztHrCdN26dyJYPZ4JTsPA0R7plrwE/12e7U3dMU/9rljyYdoI+UoplWpvMddaBQDKPX1+ifVkyvLW3UW894KLiyHNvcT7LsY8gybaNY3Ii0sfU4KCvR2GGmW48jbnm4ZOjOm2cQ26Nvlobj1mhjv02ngwKEt5xdbb0oJzdo3IhB/G5nfwadeVKkNTCkWrjDAJFJyHMQotReXdbOO1NHpeScUjvQSkTzqN6ogKDEMt6nY48cmORA/qsSopGfvQLcvHu0irLHgA1xwPZhD7Iq8UJI0CMEBGD4RdYZnkYiEQ3z3ntQj9skNHvPHhkIctNGwowEXeqRXcjK684pnxUkMQHP9WPOc9FMAdGxe3NKjtx1a+2/Zmb/ULn6SneSIuaUOMl1L5qzEO/6enq3xvc1jE+gbMbiu8W85+1f5OIi/BoTsl2XqgEgTttPJeBVwkpJqYHz/qksbLYExESKSfCkfe51mhWPg5alEGX7k46AWtfdO8/zaUB1EAkuc1RBPPTJaYeJ4n9yEMcuc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2275cb-1a98-490d-b132-08ddb878d991
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 08:25:34.5432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEXwArw1nzX+i9BXdTrxYY6iQhTvctILxlhn5Q2pbGEzObZIJnH7AkFK0++GhQXuZM+Ij41qT3ZfIkr5ZBlpSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6468
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010048
X-Proofpoint-GUID: auqJG0FU94TSGh6WuRqGVPP6xsDnPP47
X-Proofpoint-ORIG-GUID: auqJG0FU94TSGh6WuRqGVPP6xsDnPP47
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0NyBTYWx0ZWRfX6zxQjNP7Z3Cu 6H9lwfN6ZxDhtAj8KHY5dVyYeQRIA97MmeQ+/aKcaI33AvJR6Q28gelidRiRxz54eg9NBj1Y+Hf 0Ggq2IIuj6p9sbpZeUhx3mq8HdOEnu4/fJrcoXBv7tGJijI1sG7mNwxLYP80XI2Vbk5roug+vrl
 CB+264p4lnY5JVSmbwwlGchhktfxYiPCFqCUXYPaDKCRamPaGIMm+zyPRaN21UjRUmicuY8wsLn QgSVmWXM4WzsKqOK5Bu7RzApUeTZre05Lmsml1KXkJeXoHf5vjWtndqcaO7OAoGLTaT4fL3oXyQ 3aiiMpC9uxBJIKp+EVDjM9K3bQOyEXyT8jvBnb1sgy2eZXXlu3ZvhS4RIGXLBj3S8RnPBic9p3n
 2TcCw13KQmZ4rkx/ir2krt98JfwbWClNnkCYBdeI/ZXHn2BlDDfkxDi87yHOeL66yVogw4a+
X-Authority-Analysis: v=2.4 cv=ONgn3TaB c=1 sm=1 tr=0 ts=68639b82 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=QyXUC8HyAAAA:8 a=WOlpDGCng_InijLjBpEA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13216

Hi Chenyu,

Thanks for the patch. See my comments below.

On 6/25/25 03:23, Chen Yu wrote:
> [Problem Statement]
> Currently, NUMA balancing is configured system-wide.
> However, in some production environments, different
> cgroups may have varying requirements for NUMA balancing.
> Some cgroups are CPU-intensive, while others are
> memory-intensive. Some do not benefit from NUMA balancing
> due to the overhead associated with VMA scanning, while
> others prefer NUMA balancing as it helps improve memory
> locality. In this case, system-wide NUMA balancing is
> usually disabled to avoid causing regressions.
> 
> [Proposal]
> Introduce a per-cgroup interface to enable NUMA balancing
> for specific cgroups. This interface is associated with
> the CPU subsystem, which does not support threaded subtrees,
> and close to CPU bandwidth control. The system administrator
> needs to set the NUMA balancing mode to
> NUMA_BALANCING_CGROUP=4 to enable this feature. When the
> system is in NUMA_BALANCING_CGROUP mode, NUMA balancing
> for all cgroups is disabled by default. After the
> administrator enables this feature for a specific cgroup,
> NUMA balancing for that cgroup is enabled.
> 
> A simple example to show how to use per-cgroup NUMA balancing:
> 
> Step1
> //switch on per cgroup Numa balancing.
> //All cgroup's NUMA balance is disabled by default.
> echo 4 > /proc/sys/kernel/numa_balancing
> 
> Step2
> //created a cgroup named mytest, enable its NUMA balancing
> echo 1 > /sys/fs/cgroup/mytest/cpu.numa_load_balance
> 
> [Benchmark]
> Tested on Xeon Sapphire Rapids, with 4 Numa nodes. Created
> a cgroup mytest and launched autonumabench NUMA01_THREADLOCAL.
> Each test runs 6 cycles.
> 
> baseline:
> 29360.56user 16280.68system 3:33.29elapsed
> 29788.41user 16060.31system 3:34.38elapsed
> 28307.51user 17043.45system 3:33.03elapsed
> 29552.49user 16307.65system 3:34.20elapsed
> 29847.41user 15966.15system 3:34.65elapsed
> 29111.10user 16532.78system 3:33.19elapsed
> 
> per cgroup NUMA balance:
> 7589.78user 16494.90system 1:53.18elapsed
> 7795.54user 16537.65system 1:54.11elapsed
> 8295.66user 16391.21system 1:55.98elapsed
> 7836.34user 17312.31system 1:55.71elapsed
> 7773.26user 16856.19system 1:54.08elapsed
> 7534.43user 17604.58system 1:55.01elapsed
> 
> The user time has been reduced to 33% of the
> original, and the elapsed time has dropped to
> 45% of the original (lower values are better).
> 
> cat /sys/fs/cgroup/mytest/memory.stat | grep numa
> numa_pages_migrated 10238503
> numa_pte_updates 24378124
> numa_hint_faults 16921590
> numa_task_migrated 253
> numa_task_swapped 4
> 
> to-do:
> Per-cgroup NUMA balancing should consider the
> hierarchy of the cgroup. Initially, NUMA balancing
> is disabled for the root cgroup. A cgroup that has
> NUMA balancing enabled should have all its parents
> enabled. For example, suppose cgroup A is the parent
> of cgroup B; if A.numa_load_balance is 0, even if
> B.numa_load_balance is 1, NUMA balancing for B is
> disabled. This idea is derived from
> commit e39925734909 ("mm/memcontrol: respect
> zswap.writeback setting from parent cgroup too").
> 
> Suggested-by: Tim Chen <tim.c.chen@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> ---
> v1->v2:
> 
> Add documentation in Documentation/admin-guide/sysctl/kernel.rst.
> 
> Add comments in tg_numa_balance_enabled() to explain that
> the newly introduced NUMA balancing mode is naturally
> exclusive of existing NUMA balancing modes. (Tim)
> ---
>  Documentation/admin-guide/sysctl/kernel.rst |  6 ++++
>  include/linux/sched/sysctl.h                |  1 +
>  kernel/sched/core.c                         | 31 +++++++++++++++++++++
>  kernel/sched/fair.c                         | 28 +++++++++++++++++++
>  kernel/sched/sched.h                        |  3 ++
>  mm/mprotect.c                               |  5 ++--
>  6 files changed, 72 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index dd49a89a62d3..ff88d1153c19 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -709,6 +709,7 @@ The value to set can be the result of ORing the following:
>  0 NUMA_BALANCING_DISABLED
>  1 NUMA_BALANCING_NORMAL
>  2 NUMA_BALANCING_MEMORY_TIERING
> +4 NUMA_BALANCING_CGROUP
>  = =================================
>  
>  Or NUMA_BALANCING_NORMAL to optimize page placement among different
> @@ -729,6 +730,11 @@ different types of memory (represented as different NUMA nodes) to
>  place the hot pages in the fast memory.  This is implemented based on
>  unmapping and page fault too.
>  
> +Or NUMA_BALANCING_CGROUP to enable the per cgroup NUMA balancing.
> +This new behavior can be opted-in/out on a per-cgroup basis via a new
> +cgroup CPU subsystem file named numa_load_balance. By default, per
> +cgroup NUMA balancing for each cgroup is enabled.
> +
>  numa_balancing_promote_rate_limit_MBps
>  ======================================
>  
> diff --git a/include/linux/sched/sysctl.h b/include/linux/sched/sysctl.h
> index 5a64582b086b..1e4d5a9ddb26 100644
> --- a/include/linux/sched/sysctl.h
> +++ b/include/linux/sched/sysctl.h
> @@ -22,6 +22,7 @@ enum sched_tunable_scaling {
>  #define NUMA_BALANCING_DISABLED		0x0
>  #define NUMA_BALANCING_NORMAL		0x1
>  #define NUMA_BALANCING_MEMORY_TIERING	0x2
> +#define NUMA_BALANCING_CGROUP		0x4
>  
>  #ifdef CONFIG_NUMA_BALANCING
>  extern int sysctl_numa_balancing_mode;
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 8988d38d46a3..8e9aa59193df 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -10078,6 +10078,30 @@ static ssize_t cpu_max_write(struct kernfs_open_file *of,
>  }
>  #endif
>  
> +#ifdef CONFIG_NUMA_BALANCING
> +static int numa_balance_write_u64(struct cgroup_subsys_state *css,
> +				  struct cftype *cftype, u64 enable)
> +{
> +	struct task_group *tg;
> +	bool was_enabled;
> +
> +	tg = css_tg(css);
> +	was_enabled = READ_ONCE(tg->nlb_enabled);
> +	if (was_enabled == enable)
> +		return 0;
> +
> +	WRITE_ONCE(tg->nlb_enabled, enable);
> +
> +	return 0;
> +}
> +
> +static u64 numa_balance_read_u64(struct cgroup_subsys_state *css,
> +				 struct cftype *cft)
> +{
> +	return READ_ONCE(css_tg(css)->nlb_enabled);
> +}
> +#endif /* CONFIG_NUMA_BALANCING */
> +
>  static struct cftype cpu_files[] = {
>  #ifdef CONFIG_GROUP_SCHED_WEIGHT
>  	{
> @@ -10126,6 +10150,13 @@ static struct cftype cpu_files[] = {
>  		.seq_show = cpu_uclamp_max_show,
>  		.write = cpu_uclamp_max_write,
>  	},
> +#endif
> +#ifdef CONFIG_NUMA_BALANCING
> +	{
> +		.name = "numa_load_balance",
> +		.read_u64 = numa_balance_read_u64,
> +		.write_u64 = numa_balance_write_u64,
> +	},
>  #endif
>  	{ }	/* terminate */
>  };
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 7a14da5396fb..dcdee3bf9960 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3161,6 +3161,29 @@ void task_numa_free(struct task_struct *p, bool final)
>  	}
>  }
>  
> +/*
> + * Return true if the NUMA balance is allowed for
> + * the task in a task group.
> + */
> +static bool tg_numa_balance_enabled(struct task_struct *p)
> +{
> +	/*
> +	 * The min/max of sysctl_numa_balancing_mode ranges
> +	 * from SYSCTL_ONE to SYSCTL_FOUR, so it is safe to
> +	 * only check NUMA_BALANCING_CGROUP because it is
> +	 * impossible to have both NUMA_BALANCING_CGROUP and
> +	 * NUMA_BALANCING_NORMAL/NUMA_BALANCING_MEMORY_TIERING
> +	 * set.
> +	 */
> +	struct task_group *tg = task_group(p);
> +
> +	if (tg && (sysctl_numa_balancing_mode & NUMA_BALANCING_CGROUP) &&
> +	    !READ_ONCE(tg->nlb_enabled))
> +		return false;
> +
> +	return true;
> +}
> +
>  /*
>   * Got a PROT_NONE fault for a page on @node.
>   */
> @@ -3189,6 +3212,9 @@ void task_numa_fault(int last_cpupid, int mem_node, int pages, int flags)
>  	     !cpupid_valid(last_cpupid)))
>  		return;
>  
> +	if (!tg_numa_balance_enabled(p))
> +		return;
> +

I think this one may be redundant when you already have it in task_numa_work().  Without the
scanning, there won't be any hinting page faults on that task, so neither do_numa_page() nor
do_huge_pmd_numa_page() will be called. Though it's a minor issue if tg_numa_balance_enabled(p)
is fast. 

Overall this is good. But more generally, I am thinking something finer-grained, like per-task
numab control with numab tunnables at task-level (if possible), that will be so much more useful
at least for us. There are use cases for controlling numa balancing at task level as applications
tuned for NUMA (that don't want numab mess with their tsk/mem placements) such as databases can
be in the same cgroup with other untuned applications, or not in a cgroup at all. Right now we
have to turn off numab globally but that's not really optimal in a lot of cases. I do understand
your use cases for per-cgroup control, but I wonder if there is a way to nicely combine them.
Per-task control should cover per-cgroup control functionality-wise, but it's an inconvenient
interface as one has to set for all tasks of the same cgroup, I haven't thought too hard about
it yet, just want to bring it out and see if we can work out something together.

Thanks,
Libo

>  	/* Allocate buffer to track faults on a per-node basis */
>  	if (unlikely(!p->numa_faults)) {
>  		int size = sizeof(*p->numa_faults) *
> @@ -3330,6 +3356,8 @@ static void task_numa_work(struct callback_head *work)
>  	if (p->flags & PF_EXITING)
>  		return;
>  
> +	if (!tg_numa_balance_enabled(p))
> +		return;
>  	/*
>  	 * Memory is pinned to only one NUMA node via cpuset.mems, naturally
>  	 * no page can be migrated.
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 475bb5998295..4b0dc656688e 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -485,6 +485,9 @@ struct task_group {
>  	/* Effective clamp values used for a task group */
>  	struct uclamp_se	uclamp[UCLAMP_CNT];
>  #endif
> +#ifdef CONFIG_NUMA_BALANCING
> +	u64			nlb_enabled;
> +#endif
>  
>  };
>  
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 88608d0dc2c2..c288ffb92bfc 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -155,10 +155,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				toptier = node_is_toptier(nid);
>  
>  				/*
> -				 * Skip scanning top tier node if normal numa
> +				 * Skip scanning top tier node if normal and cgroup numa
>  				 * balancing is disabled
>  				 */
> -				if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
> +				if (!(sysctl_numa_balancing_mode &
> +				    (NUMA_BALANCING_CGROUP | NUMA_BALANCING_NORMAL)) &&
>  				    toptier)
>  					continue;
>  				if (folio_use_access_time(folio))


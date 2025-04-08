Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A3C204599;
	Tue,  8 Apr 2025 06:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744093570; cv=fail; b=sfoNYEW3jREDCr+sxObgTW4ApPigobQUVJtxbmLwttslv3HkdLdxlxYPDnEL1Xg/3cS8h+NXTVlNE32565NUDfVfUwcp2PyclitDK3u2y9Z3JHdRCzfi54To/tcBPqxCQDarZhetl0Y8sjUA27lgz2j69EfzXORNWfP/2/kvKUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744093570; c=relaxed/simple;
	bh=lc1E+INcRIgJy+LyqkqQD5NdqLvbrElPKpLZHrSBQ+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VNQiWwSiS+N/LW9Ejjhtoz2n+c4OKvGL5W09ozhhoiYyo6f5lLDyM/Vt853Z38cRtG7/UTLi3tw8sCNSjKekOxS1EVHP34HQziqGaCNRIsSZ17vPKAnqcqBVdMJ4tCpnxXg9Eo1zvwRzAdjcXwPCRODCWMlgbD3/iPnI+dF6DW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NeLfwhex; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XBPPLYSz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NeLfwhex";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XBPPLYSz"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5381vLg2030590;
	Tue, 8 Apr 2025 06:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=UhpFrKDTt1j/zNg/Bb
	WDpzwwA7uaB8qbhaq4KDl/6eY=; b=NeLfwhex3KCAclrmiUU3qnFwz+MOMkHxpp
	2X88kuDtwC9leWXgJdLoHVPImXbmmqwZjAeVirpnBD54cZN6Esy8g5YU8lTc1uYc
	npS2eKrnztaDT9X7nQtqZzwdopqhHNK925UB+j9jzKieTpwwIs7z46Y6GuMpidNn
	WErgz7PV17ZWTLtSSh2xplc+YiCL1LZHSApksGxFy5m/IdGivMTZBPpRnMpjOnsq
	hG0ViQfQHAyCWk4ER4lpjMq2fibW2vvAa8bAMnK9pC4bvxUkDttsB9MiJIZqD70L
	nyUlx84jcWEZExeUDahRfhBjp2z6RhcxMrm16be3pa3aaekWAwzw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45ttxcv2rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 06:25:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5385TM3H001900;
	Tue, 8 Apr 2025 06:25:23 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012038.outbound.protection.outlook.com [40.93.1.38])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45tty8uf2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 06:25:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TzU1aG5w4gIB9TuKqzb3LbtvPs0kUdqS8MGjddW3IZv+o0uUuAz2fyuZOnuGphfqeZKCyRUReS/4gBziWYWe61lEdrru8HwFs4cx4mFXID960AXEQMzAHVLH3BH5M20elkNhnUyd+RMiItbwvSv3XuF8Y/lpxeNs0yoVx2RnapoWLaTQ5EKQTwyPgfRgTFDIA2t3dDDxTKsLU8a5/v4AGAr+38R24nmMU7A5MH7MBiItB896hVTnpGeQ2xAva8TCIOS7ZE/5FhW//qrAjP3/s4YQPYDjo7nZgYngUhphfOC6Cc1h9diuQo7RAy4tC9diVYs8GIvha0d6XZ2qNlW2Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhpFrKDTt1j/zNg/BbWDpzwwA7uaB8qbhaq4KDl/6eY=;
 b=NtQ24F9sKRor/HIZu0/qm77buKWTqLf7uPQaAZzhf/5NsnA1qsi0d/HIXRYP4m45EkdjQBf9jjJd6rqcDV9Wg10nU4ijXoquRd9Qms/+qVBt5Qy34gRHCe1EaDDiNHo7041NRPMb/Ib3gWKHZa9R27wXyBL+CGAN55GEUtbgu4K/cUbK6CpvLh08WhCZmF62cD3TljwM9ZuFHROR0vHJPqVAi57S9x07PLcBXROt20xfMNb3HQiAg2vfn3mwGvVbPqEWOXmiNdhrjjPR3tLzFcXZeYCdF9PmjjQfWfaqPDDaT1uBNAT0UIq1IrFurApLGJ0xPow5D3DWQ9CIUAiZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhpFrKDTt1j/zNg/BbWDpzwwA7uaB8qbhaq4KDl/6eY=;
 b=XBPPLYSzq+KuOA0YtNXha/pZTYxb/sp7SFLM4g5To5MPR4Eb8t0tWi0DYnHzwuAEDyFTXe2jBvzEIYttf8SA4Cspx25cFnZINU2SOqQArwYAMDaXy3N3Aop9iCTrYVRQIGqOmZWlc1mKNo82XPu+1XiUrJ4uKfiNSipX2TXk9dE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV8PR10MB7870.namprd10.prod.outlook.com (2603:10b6:408:1e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 06:25:20 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 06:25:20 +0000
Date: Tue, 8 Apr 2025 07:25:13 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Eric Naim <dnaim@cachyos.org>, Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
        peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com,
        mhocko@suse.com, hannes@cmpxchg.org, mjguzik@gmail.com,
        oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com,
        peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net,
        paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com,
        hdanton@sina.com, hughd@google.com, lokeshgidra@google.com,
        minchan@google.com, jannh@google.com, shakeel.butt@linux.dev,
        souravpanda@google.com, pasha.tatashin@soleen.com,
        klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v7 10/17] mm: uninline the main body of vma_start_write()
Message-ID: <3f9f8a06-a044-4bce-a4e6-f17090cb3c0f@lucifer.local>
References: <20241226170710.1159679-1-surenb@google.com>
 <20241226170710.1159679-11-surenb@google.com>
 <0d36fd53-b817-4bbd-ae38-af094bd301df@suse.cz>
 <40182b31-95ad-4825-9c0c-0127be1734a6@cachyos.org>
 <Z_S7yjRXWIXnVXsf@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_S7yjRXWIXnVXsf@infradead.org>
X-ClientProxiedBy: LO4P123CA0338.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV8PR10MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 8635e72a-c305-4d80-93b4-08dd766622ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?daJXsb5NJbtJ/32bFh/qxLDNnKUJ25GPT1Kz9OfmZTC2dAYuJr3hdgXdJHqt?=
 =?us-ascii?Q?GSfn8T833+GVmpDTJqwWkZfcLnNMCOfh4seJFT8eiC4X/tEna4sN5YBWJuQ5?=
 =?us-ascii?Q?PI5J7PmTEDZgdjJ9BpEgwRjlze6TXl1bxhpOnZb7E5DU6i4McPXFbnyqBCt0?=
 =?us-ascii?Q?2sw1dbjApa6nAQLfqwDkFkdbkk7zTi5Zdxg0cAmIUIxDHUWCwgNTp/9HHr1U?=
 =?us-ascii?Q?kpJVAa6yVNr0ZIZHfnuP9kiBurnrRXiSUisIYDSkqzuMIj0WHsBuQg4b6OTO?=
 =?us-ascii?Q?y2K2v4KJLBPJ9seQZzkQLoNCHXf1+64MLXjCJpAYHLrrM01dYc2lUe4wA24Z?=
 =?us-ascii?Q?37yrf/XQSHOa+lgoRTQFb6y0WI5DSm8wJaqns9ecgwksPIhAShNhTzm4Y8Sj?=
 =?us-ascii?Q?DRRmpQUbPSwXTd1AAWAWYUnS6IFqWuy1n16/Gjprg8TMlcY96qLImgHGes0L?=
 =?us-ascii?Q?YTNt6/ZYxqRVYKQP1eHr0IWSrH3/0LSYqMkWtdEobh1JYgiP3J4zJhKsnnS4?=
 =?us-ascii?Q?pYPRUHm1UpIDzQemHbvhy8c8MLZyyGl7i5BsvHo8T7TCi7vVJYRnidHiZ8lP?=
 =?us-ascii?Q?EyePaC4pdKW7cD6CbrmuHOi3nOf5fVNp06ZIqp/sIKmBamDXaAOjeGCk8K8Y?=
 =?us-ascii?Q?kQv5C6Bdk8GWVskNoDpMVzigobWgC3Dcd4CJeyy7AMrqgYmTdT8XJzWrPVj2?=
 =?us-ascii?Q?Pu63UD1oZYqnqSsSGse1uL9C/1sXNMGeEcwjSA23Dsf4ZQa3hadP631wctLS?=
 =?us-ascii?Q?fcal+4W5ysqmS88Rb5J1lT9CXgEQ03FZCgf9v2xF9IgUsfYEweUD7ygwR8yy?=
 =?us-ascii?Q?R3m2o1DO3w4qgRWtU72rT0I9p3CWlBhKvnMoj1dG8u6voqsv1fzkamjLXkwL?=
 =?us-ascii?Q?GaeuIoEsZYeUkkTT5k/NEh1tbWeqLb9CD1WdCO8GzhNopg2Itdrx1CthwqEK?=
 =?us-ascii?Q?+gZp4WPj1J3cauJLFwM0g1qtO4Qumh6KpSKjvcw+Dj+22Zhs/k+dfMes4nWs?=
 =?us-ascii?Q?Lo37/wXRrFx0L1A6p4iQE0WsJ9fE8TP2Dr/4Y5DUWtcYpYMUlT6Y+ymtiVvZ?=
 =?us-ascii?Q?jIe6wP2+vOmqmb7T118DCAIBmEuXks1vMybGNW9Ft9cv7hKjfdwzyXgsvdPR?=
 =?us-ascii?Q?ess1Qh58sQgPLgLfy4GtuJ9iOOo3sHf+XKD0XwbmAs/i7hlhC9oUjYa3bx6G?=
 =?us-ascii?Q?HN7x1ISoHgoLwQLiwaphrEMUOBOyFtRYC/T6HGVHxafefLuQmaQzfbVgAuyA?=
 =?us-ascii?Q?zELbTDWjGa6cMsQlGQP0iAUYHDla4Kcmdyl5YaFZVgBFZ6xJauuLvamiCNGC?=
 =?us-ascii?Q?E9KenX9Pf3KgDNjNhkDUvN07rp1HxgjgqeaXKsAqDTdfTWJfSltn9uwLjneN?=
 =?us-ascii?Q?yPC8TkGlRGDWZKTY8Z25j/4t4VPN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fFkF729qmMzPAH04qTPJfpPyuVcuAPZdhO4dqdC+Kk7EfkgNPlGDZmgwNUje?=
 =?us-ascii?Q?ib/dLYz+IQwHxmtCKll1ykxVFF4KBLgzaCa8zJlNkHG7k0/FxBMfHsDjYz/i?=
 =?us-ascii?Q?PmEEHB4NwVI08VMIIEFhmYr+kastPEGybBwsJ8a4h9P6aAWVCBU+A/5Y43bo?=
 =?us-ascii?Q?zCTc64P0zAnPq4l0hq2JVbK7PtNjL+bOHqzJjWMIPY3tyuiG2/rqjK8zwSH0?=
 =?us-ascii?Q?JjteUBVd3p/1qOdtRLLi/wDtyWRb//AQvdKFtzef9h6YHFJx0Mhfoqto7VZ6?=
 =?us-ascii?Q?Ln4M5jdlOwAvgefiJMOQftQGpw7/GYimzgS6k8qreR3Og3Nu/PPV0ZdrfJmB?=
 =?us-ascii?Q?aX2PANQY+03V9eiUcSG+J9xN3kRD7Rx2+lvoNj600kEmjAlSrmoMVLT3SrzF?=
 =?us-ascii?Q?NTSTliFG++dVv68YRWQ9MtT4aFXvIULZQJpbPgKppTGNl5VVBGNeXVzcBVXh?=
 =?us-ascii?Q?FiT5RBczoHJ+cJ0glOPQl5Utw4jvddCzYsQF7aiBHcNhNmx/aOMQ5XoIUWe7?=
 =?us-ascii?Q?7jJ/ogRN1DUVd8WX5KvB9maf28Eux5ce6xHqspaUAg7EsoYvABG5jvk4eahN?=
 =?us-ascii?Q?4TwgdR4H5gc1YC13fudGuW79fFBqewJLWuz1rSbdqQwzYpr+FON4Fkc2rP6V?=
 =?us-ascii?Q?kdzygl+zz+QeRVHer0c3bnoBAMiVx9wEoi/ocGsCVtMTzRF5D2/KQRRrJMK7?=
 =?us-ascii?Q?CVRLejzJpYI7/+Vep8F3lW1BILahkpw5kaVmkczBnyJci+u6oI7nlH62rNAy?=
 =?us-ascii?Q?oH2nPuddSthLPFfgxgf4PxOZvVq5/pPphzExr/ssJlu6p9QhWqsetfi8oBM+?=
 =?us-ascii?Q?lA9UCGkB7Mvdcy9JyV1clZI8zbZukxfSujOXlRs7N3yBjySRhx4lLEXEO7Pg?=
 =?us-ascii?Q?CqrgqphThd6aXbCeLt+zfM6lLaTzparKHu99KlfrWts20pHvTNPW9ezr/3Ns?=
 =?us-ascii?Q?OECx1ekZL7EgMluB8jpAldamdKdIvWN+ujWTOAS3xQ7t19bYFXOUzuGiSodj?=
 =?us-ascii?Q?lupVwCqNq5tTzIcnfWJk/mi6ywFA1aX9z3zVNY+FEQLm8XjgLjPDCWj7nSt9?=
 =?us-ascii?Q?2UW1wXEyZZ/GEcK80bPvvbIa11gcoN8QJsaEdH9atSsxN5f86MEzw9kpWPGM?=
 =?us-ascii?Q?X0qyVAz79/1EKG7CNFFDqsCppqSOHFJq6O9pVbA4qzBw+WaPFo3YwSAQqc5+?=
 =?us-ascii?Q?Ohlh3Wp3N7BEw9sIJ+S5NI5cBrQ0j2Fnf469REObhLZzdV0cLJ5EVkXC/ZMd?=
 =?us-ascii?Q?k2rEwQ18Xf9+ejX2OG5NBcE9WsH2ZipuH5FXZu1SmREKW7Ok2Hpwch6gbaQW?=
 =?us-ascii?Q?+xvAANB642qdaco93xAMFP6+/Mp6K4E3LWoVaYNCGsKD0j6+Et7eVmNWwi0r?=
 =?us-ascii?Q?jfT6XqOB+Ge7viU0JgT+CQW8injvNsXPDr1QIHwwmvfn2q6g2PyBPorhCvSR?=
 =?us-ascii?Q?JOMFJoWoYb4AfWFHz90Ax5PPjkuQKyiJPXNg2z2u0c9PJECyspXfBg+4fN+N?=
 =?us-ascii?Q?GorRJDZDtiZNKEu89kR2MOfTVAq08kz4aKMM3xiloUfRs0Ijx7v1ZQIlnRLl?=
 =?us-ascii?Q?Zq0bQzMYhqYoOHCF7vrZDVXqSjepufCA1S7/h1EZ6+Xx7hk49dUAbC3l5Xx3?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hboqXWP7uvemBFi7XPgjMBIMOy0tOa9AjMUUI7YbaXmhdqxAdW07nV3emqLVroHZz2+bQHCbF50iCveetLdXGx6XoeHIY+VxijoC2X2PyD2Sol5adgf1kosBvkXECQnoHmbhy2QbnbrsOICw2b1LJHMe57eGAsgqBhrpM17gOFF89Tmt20SeUFHKAFgKGUS1dqbrq7tx09pFD/75k2w+Ijq/5vbPVW3DzhjKQnLAPDA2q73sNjv416iCQ9ICEK+4UsQlyYeYWJazFyYLntM/4LXEww5dr97fuuaaHByUhG9/+kVLeoag4EOE3vjc4TKZ4UtSX+BaFoJNEmC7jrme+XwYFzOCpJ4oxt/2PZcWVXcGKAVZLPbiKvUSoJc8vle7kNgQRluEp1zWKLALsJWJ1MxYseZ8MsiIXgmpLPZtu6aHFmfIwZKM9DCmYVY29YUI9YdigL2v1RrzYw+WjDvSs5KmFuYUfabgu2dLAiA+BLuFUxPn2hshq8yRmcivY4xQdbhphc6KSjYHnsCAuixhey/BjUsm9NXMWgSzJ/vAp+mbvKDV86Ibfzo+bWWiXAL0TQkx9L8IVtYmwsw3Jafx51bEmg35FJpHUFWg3+28/X4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8635e72a-c305-4d80-93b4-08dd766622ef
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 06:25:20.2798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vgd+/v5qu4LTtO8LCPW7rqsDwQe26wpq0xcVhZPPjlDVs4l6U3YcK1vuETXpqsJ1R9wX2mvz/lRD/R6l08AGTN2Bp0o27z9D2Y7nX4GnlCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7870
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=858
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504080044
X-Proofpoint-GUID: SW_W9AWERNh6gNslCfPAVC33BaJJLDSx
X-Proofpoint-ORIG-GUID: SW_W9AWERNh6gNslCfPAVC33BaJJLDSx

On Mon, Apr 07, 2025 at 11:01:46PM -0700, Christoph Hellwig wrote:
> On Tue, Apr 08, 2025 at 12:39:25PM +0800, Eric Naim wrote:
> > The out-of-tree NVIDIA modules seem to rely on this symbol, is it possible to use EXPORT_SYMBOL() here instead of EXPORT_SYMBOL_GPL(), below is the modpost error:
>
> No.  They don't have any business using this.

What on _earth_ are they using this for? Is this just via the VMA flag
manipulation functions? If it's something else, it's an unintended use of this.

Anyway, generally speaking - agreed, this is absolutely a no-go Eric. In my view
we simply should not be using EXPORT_SYMBOL() for _any_ new symbols whatsoever.

Out-of-tree modules are simply a non-consideration for core mm code, this is a
GPL open source project. If I had my way we'd simply revoke _all_
EXPORT_SYMBOL()'s, not add new ones.

>
> In fact vma_start_write should not be exported at all, just the
> vm_flags_{set,clear,mod} helpers.

Yup, I'd rather we just kept vma_start_write() mm-internal, though of course
kernel/fork.c (ugh) needs it (we could probably refactor that in some way to
avoid), and literally just the PPC arch (again maybe we can find a way round
that).

Maybe one for me to look at actually... hmm.

Anyway Eric - I wonder if this is simply the nvidia OOT driver doing a
vm_flags_...() call and then having an issue because the lock is uninlined now?

I guess you are jut noticing this is breaking and don't know since - proprietary
code.

Anyway in this case, the OOT driver should just write some GPL wrapper code or
something here. Or better yet - make the driver open source :)

Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4795383A5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744660064; cv=fail; b=MxqlGHnbRMGk1osWSu/t2PUYUlVh6NCuWEu1L1fZTjkoFnS1TxCewtOd691RoRHH/j+aePIJPlNCvlrEFK+XoVAp2kCAIcZlhWKu4O7/YgBttLFneGNTx78FIfxOStxf6Im1dDLtGuYgXwc45Zk03TycYUmNlOH0yxgRMhCNtP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744660064; c=relaxed/simple;
	bh=e2m+zlnnV63qsvpzBf/xpGrLA7wr7pBwgHShBUd7XLE=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=Q7ge7SDrUAEasXB4gW2jRPIqZaPMeZjC27DKR1tIPei5ZmExOLFkE8YgQ0vHLbxG1vTG7UnLcIWEKDYRC7a7gDCldAxIcSLUNSW0NAKlJ1Z+8u7X11QX4JBdanLhRLuWtl+XZPxNDE9x97hipc92AXY64JohIunN9aosdV5SwAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SFkquTGh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aqrIyDeh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SFkquTGh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aqrIyDeh"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EHW1JF027755;
	Mon, 14 Apr 2025 19:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=eRXksl8rK3rY33vxFg
	wTXG2XDNkHHd2AcroSQ6bECX0=; b=SFkquTGhv0kati6iuPJLUXGU9M7Cxe78QN
	8ytMSNYbQpIlL7LMxmlw6zkFOdAXwtx+X08NomxClZ8tShmyvKNrzCs1h5K7f46n
	5fij5TIUn1ogE914WiK0lHsCoDGFJNd9N7esUWxvxFw1ZCtJYG7G3Zvd2nUay6sk
	3CKP5uPas0SOxFg9kVib1rGfQTh2JPu/D2b3jrX7e6nz/rzajqK6d8LuMin+YRst
	6cXEWQgfwKSYNRVnlbCJWHi0J3vM7HOFaioqMHVlsw3M6YP2B0EQoDzZlxVRNdC6
	+fjxKO8k5OljzsBUZUjDB4Cwgx7AejAOfYjQSQF+R3IFjepmuDlQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4616uf09s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 19:46:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53EJH4s2009250;
	Mon, 14 Apr 2025 19:46:45 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010002.outbound.protection.outlook.com [40.93.1.2])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d3gyeu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 19:46:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TW1bOcXnSoTacPengCfCRXI1dlp6tGWnK/iQuYPN/kqSJhnM+pZAse9mt6vCqQpoOimVAUDQa8IJI5wbDEf+bkdjftlQz8GtHI23acFR6FVLcZzFeqkHEukL+9KWWuJ3cgbwuAB8twslwGEatjvq66MxvRGd44K3vEsGCkMqZbiUiJimRIE+1Bw6IsdZVyYiPM9PaRf99Y9yACgzru53LYmOn4pm9gIDWRNVjtuyBrprNq6LYykcOS7VtLUx/bqCsyWLGoPZRg1QEfPh58hnkByl0HKwWGerlv6L+r/rq9tH379zSPF4tH0yysp0hsZ0W4fISJOIFQYtYX+4F3WbVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRXksl8rK3rY33vxFgwTXG2XDNkHHd2AcroSQ6bECX0=;
 b=BeJl6jbg6rmdOV3OsZn47JUorH52sL5nZWhvEbn/7Rwrr9aXd+mbtdSLXspGNAFXYTOWBubUkPQo+E3rFY+4+y5cnZ2hLFyb03GxCe+bjspV+u8Pdx6gMVO4jqmxT4DVY51hBQ3oaik0LFtk8LztjUqPKPkK/zvTy9yYnvydXJTYqoqCRt5SxfY627rHr3qXSdDOqf2HjAz2KXQuIzXWWxc8lXSKnLRCDZMAHlU3yGImxAr5qBOb7TutlZ3uFn/lEq2GvNdIZaZWR/FkHkO/egj34hRN5PD+ptgk2tncpQEUXETNZVD98FyitSTv+ugYinzAF/QTF0aQBbMJWC5Aiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRXksl8rK3rY33vxFgwTXG2XDNkHHd2AcroSQ6bECX0=;
 b=aqrIyDehlWElEA6d2z7C1H2Z7O8AeydhwZyNIJCqJoetzEroBs/1xPVoR19mNWbQV1KI6rfyYYEIo8q6dDA1LfJ1DzrPGagIP7ArJYNbMPOXqp9Rls5C+Fn9oWAWl5EP8sq7OuRGg8IGQc6233y3ls5aVk0Y/QAgkGkM75GUses=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by IA1PR10MB7141.namprd10.prod.outlook.com (2603:10b6:208:3fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 19:46:42 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 19:46:41 +0000
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-2-ankur.a.arora@oracle.com>
 <Z_yr_cmXti4kXHaX@gmail.com>
 <20250414110259.GF5600@noisy.programming.kicks-ass.net>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Ankur Arora <ankur.a.arora@oracle.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
        luto@kernel.org, paulmck@kernel.org, rostedt@goodmis.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v3 1/4] x86/clear_page: extend clear_page*() for
 multi-page clearing
In-reply-to: <20250414110259.GF5600@noisy.programming.kicks-ass.net>
Date: Mon, 14 Apr 2025 12:46:40 -0700
Message-ID: <878qo234rj.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:303:8e::15) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|IA1PR10MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 5758ddb6-4dfa-442a-7586-08dd7b8d1441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?392LUhoB8yXuCkKpWg6HvoSZjG8x6RuDbvs0jLQsWUach78Ra7Ng44oQ9Lcp?=
 =?us-ascii?Q?tvrhdG78FScqjb3pG25cJMAtMrCf5JzDzWFpFbN7eCJ/B2Hg+mdcbRNd2yz7?=
 =?us-ascii?Q?Hr5Fjm8sMSQn5+r8/JqPCF8VtzD9OVyqtlvv1H2bfbdmD2jUoDBx0oZUN2E5?=
 =?us-ascii?Q?rdbF1cVenx305aRzP5OOHWUKh22oOS2nXzbgYq0l4rjeWIboTTShGHBRQUuf?=
 =?us-ascii?Q?Wq9C6MX1fZ1UNZBKDdTuLYL4s1JRofCy/cWG89mjBfb1VHKX1fsWd5IU+/wo?=
 =?us-ascii?Q?vZaub9Re+w49aw/sjwu3jUMIMkAJ7DezN+q6usM/iLg4ripOATF2ql/QPA4z?=
 =?us-ascii?Q?5TtDifjv1vzQJHzDKfRGeiP0ycNAdGJo6crcg4ZFr6eIhQq0lk5gnDsRx0uc?=
 =?us-ascii?Q?KslZDy2wIwgFsi1Z+dvhhcqa2ergx0m+j994L5wslyaroa70tDbyIvKTS849?=
 =?us-ascii?Q?C7VXU8pfZ1I8CTXH4ZL0SHIYfi4Cr8RpkKjYVcG2WO5UfRT/covvMByuSKNW?=
 =?us-ascii?Q?+8zz4xC6VuYsDUgqCn/S+U5AckA4IxH9RI60iAv+W1fr/lk9RZnuFgUUZvcb?=
 =?us-ascii?Q?r1YPf6N/KZzc02BJJAxSkug7K9x2Y/o0gb9jcuyfDCjI3tDZz+z1D/rrIRFm?=
 =?us-ascii?Q?iAMagxKdhsqFNsEMfw+WRpvdwNB7BYgUN3pYjDbf2drvmZHhBDQhiXz6PeXV?=
 =?us-ascii?Q?t2N3J33jb4M2TRf8VWI8vb4G++vDEnlJQZureEUGM8lMTaFbkpjSrD9uiKxQ?=
 =?us-ascii?Q?r4bexqxy54Eora4UAwY0QsxuTZaXNr0eqSNZCF//heualoJkO9Akgx0PEodD?=
 =?us-ascii?Q?cgS7F69+FQy1RJy0PMldHnBhj+ftRcpRhSKg3J+Oei4Vg9kLTpODSqwjpbbF?=
 =?us-ascii?Q?LcFhRkFH9B3MIgOUMm7Fd6KUo/cw9lb1k2RhxgIot0t4oCGakgs/7TExA1ph?=
 =?us-ascii?Q?YvcQvLhkxp+RiAmIdQshwYrT89vu7i2Dk05+cZHhjGD1lqWTQpMgNl8jB3Nj?=
 =?us-ascii?Q?whN7k59ro6+uJ2CkVIjg8ua/iiFBSTAhrgu6iQ6cvcZPvYUsTBb5dnKzbN88?=
 =?us-ascii?Q?5cAR3Fnk7Sfz88dVtJZC/3upNXwA/W2P9GP1+JLP34t8TB742Wen4m+lQK1v?=
 =?us-ascii?Q?Xv3vXG9P/VswqKHvosxb+np8SeISnBdQl2GwXCqrvUzn4Bm4Ccl3rEUVv339?=
 =?us-ascii?Q?lKf2Z4C8MPtyndZiZaQjDhb2zblqZNg/e98I3RHj9J6XoRQcecsVSTZCD62L?=
 =?us-ascii?Q?NA2Nlaiw6DDH3tqNDUo85qFPPavWoIfaawQ+lIyzGFDSAGfiLo4PhVZHCOvv?=
 =?us-ascii?Q?TSB8hqnNAQ4t1zce7hPhKvKRzhMbonpGLLCrUZu7eSr/vYl1R5mT1qUwWUTe?=
 =?us-ascii?Q?/5G3XusOjHOR6h1ancqV85olnun+KOCWnHi8eFQyj9MevYrvoA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tw7v8lquzkZuufAwqb/aFMzat0Iq+shybKF8a3VEti8wlB/PZLbgEfIKJv3p?=
 =?us-ascii?Q?IScc3eTPT82NGh2NlEByzURD4rotqNrWtA/ilPRYp6VgNBGh2WdZsPgSLUEH?=
 =?us-ascii?Q?GQ3zCtqhrHA2wl81i2qyuTSeZeczSNtSyzJPTp+QJGVqoODEO1GrQVg5pDRk?=
 =?us-ascii?Q?C5Sa9n+C90IFNKrZ235beC0Tj6co+R1HumB6C4bmlcodC/ECYqJpYzzeFORq?=
 =?us-ascii?Q?1JwDFhOSv9CiP414Vag4oFkeRSctI61Dp9kp4pCp/Kt/JgAf9ux7k2dbXndU?=
 =?us-ascii?Q?L732l9zGg5i7LFWWNgJo/nyHOEptUknmKnQxrppJPityGytpvTrBd5nPRGN/?=
 =?us-ascii?Q?8/4MboaVOJsIEYlFxvVmVrNhQiUanYBRrfG/lkoKLi8PIfrqYQPDTFwkc74L?=
 =?us-ascii?Q?Eu9F7K8bvugNCXtzaZLDUwa/fVm7KCNtnAjqoHEZFePt8m1v191+DgTTaQ4K?=
 =?us-ascii?Q?xN5WaSRRKiXsON8SR+Nj2y6vEPHsGsw3H/zMsVFJasZM/mjpen5+NIJvoST/?=
 =?us-ascii?Q?hz9BXjalpbtW6GY+MWTjor6/mESllw1GkTQKiVB/ZrZwrvRrBfT3efwG2lRf?=
 =?us-ascii?Q?d+Ie3zAOCVH55lKAiQ5kSXBcLpEX0jPjX0fOE+JfStG9ZQILERPJr2zkWcZl?=
 =?us-ascii?Q?kWTf98W4FDDgIpRMnq3wka4VoWo/sFiIxPhGR7X6hXi8oV7oazYJMw8yQrzn?=
 =?us-ascii?Q?Gnur22ooBgh4u0PyFlgB4TCgdVUgYOpp2KqPGl880BM0MCerqgSmv5VjsMTz?=
 =?us-ascii?Q?9mfyDz5y46RvqNW9gsxkXT6/Bcrr9MR0ub7UsAkABVTbLnzzt7khdZFHrFoZ?=
 =?us-ascii?Q?Z5PdMGhsLVhHxXRzvo3naxoMJD1Ym1IyzGJUFlfpQuGRZ9Cc4+Mkf6F/Pcdr?=
 =?us-ascii?Q?glCS7u4LeJvFimGnplP8wFasMw5xUVhelgDB2Q4AH6uQ6HE2x0s8UyGTNdbB?=
 =?us-ascii?Q?iGa/AiUiLRbg8aydhuZ5Mdlcns7YQO5XnqpvEm8wbUlFVcrk0MaU/63Pm/kX?=
 =?us-ascii?Q?QF6ixgpTr4E3dKSbEkTPVXutmIInzpDyC9UqwhgFnECBl7hlmpMl+38/3sn/?=
 =?us-ascii?Q?DGIaUCXhqxgdpuRBV5WvXrAqemdLnJeM6KiFiwsMQaCYOwFNoH4B2uO7geBZ?=
 =?us-ascii?Q?PZSjVtKpMhTXOYb6FF3+GGQK/oKu6zlgri6/uwtO1/ejuHEutZfMD8uV+KDs?=
 =?us-ascii?Q?dJ5yUfxmSfrz7ZBYMSrGQhltmlZiUo/djuddsAzhhlWADfzqWdI0tgN0P8Rn?=
 =?us-ascii?Q?0ot3YcZU2HfpWf0eyih8OzpnonxU1N6j3J4AGQwa52IM1gb4HJxACUaLetdZ?=
 =?us-ascii?Q?RydEEyx7deBUtKCNxVGleU4d4fXXGw7rZn+wWsqVUOefsR1QqrwPt/LScxa3?=
 =?us-ascii?Q?/L62WHG2J/ViNc6A9yUoJ5i2UOLgdUaMVnCUS44p7QGMWx3ktLmC074cAMIQ?=
 =?us-ascii?Q?dWg46sJQKmFcXgtoN0182mnGBwsCWBE52Z4vJJtZG3gJBr11qwAJPS4cr/gI?=
 =?us-ascii?Q?sDrm5uLLnp1ALqrzFV6A4nM9bWr9ISFNFXtwREFWPBQXCldxGOAnwab/2N6L?=
 =?us-ascii?Q?PuihLVePkuWghLgoiXfZzBKQWO5vD5XwAQrBeBLpJ2J0L7LQF1b57mCipq9J?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y0KsOhnKMmyfS6EZsB/kIxTiXICxphbCZ8sfiIoJl/JfrBf/YfrQGrQAWxyIH+E7PnjkHlyn+f2Pi97kGTvvLdBiZtHezdf++CLuHsVBqyUy7cbopOBvvGdWQGomYQSst7n3NT2OlZ8LRyaJVEPGkyWGMQ6KlMsSA+V7KWQSe38cj0Rme7Bsje/CjDVkqnXlicVZI5P8hP8kCVY/q7/gsuh6W4PilH27j05rZ4N+8Z/tibvPGTCsAFyN2Xww84bgA+7un9VqXYV4jrOlYbeDQKGRJcMOIJsH30tjIstRpAepGFQA/IL68yns/TGPFBIypbMI37cKnUZVvXpFI33B7ym4WBXHnJ5rh2Bv3PV3bVbebmSfXa5Qwb8MnGKq0o3+CI4mbmSynrJAw3b0pkg9pw4s/jsDdx578PojnR1QfFZVKWJCLjoAGD8rAePL44qoewrU6HG54PI7E9UE0W29px7Ea+XEBZqT5cXgMcexz59sG5mcSMoZX6fdhqut7D643Jj5Bz2WlCmtbbp8tpN06usSgo2yP3L8K2FEKrahpbWq01NbBzNDRABggt0aEVCtyqoS+DS9TGTupRisBa1tun/2U6kF60oEQIJdqv222rI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5758ddb6-4dfa-442a-7586-08dd7b8d1441
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 19:46:41.8466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ie8j7RKC+Fr6zXG44AwnH6kxxCpV2i5o6yhlJ0uloevEjQDrYiJPzSfitxQQdR5Srpfa7KCv4p7DYLKwHx2fDQpnKTKyIta8EJaNOB0cSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7141
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504140143
X-Proofpoint-GUID: Vu3yTvd5ZxH0RkXKZhMxr7jqZ-2QDQGw
X-Proofpoint-ORIG-GUID: Vu3yTvd5ZxH0RkXKZhMxr7jqZ-2QDQGw


Peter Zijlstra <peterz@infradead.org> writes:

> On Mon, Apr 14, 2025 at 08:32:29AM +0200, Ingo Molnar wrote:

[ ... ]

>> > -SYM_TYPED_FUNC_START(clear_page_orig)
>> > +/*
>> > + * Original page zeroing loop.
>> > + * Input:
>> > + * %rdi	- destination
>> > + * %esi	- length
>> > + *
>> > + * Clobbers: %rax, %rcx, %rflags
>> > + */
>> > +SYM_TYPED_FUNC_START(clear_pages_orig)
>> > +	movl   %esi, %ecx
>> >  	xorl   %eax,%eax
>> > -	movl   $4096/64,%ecx
>> > +	shrl   $6,%ecx
>>
>> So if the natural input parameter is RCX, why is this function using
>> RSI as the input 'length' parameter? Causes unnecessary register
>> shuffling.
>
> This symbol is written as a C function with C calling convention, even
> though it is only meant to be called from that clear_page() alternative.
>
> If we want to go change all this, then we should go do the same we do
> for __clear_user() and write it thusly:
>
> 	asm volatile(ALTERNATIVE("rep stosb",
> 				 "call rep_stos_alternative", ALT_NOT(X86_FEATURE_FSRS)
> 				 : "+c" (size), "+D" (addr), ASM_CALL_CONSTRAINT
> 				 : "a" (0))
>
> And forget about all those clear_page_*() thingies.

Yeah, this makes sense. We don't call any of the clear_pages_*() variants
from anywhere else.

clear_pages_rep() and clear_pages_erms() are trivial enough to be
inlined in the ALTERNATIVE as well.

Thanks!

--
ankur

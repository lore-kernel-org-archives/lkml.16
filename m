Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8912721CC60
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 17:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746811520; cv=fail; b=VlqbR6Ve2+QtxfvcgVKkbJ6OvVpq1WR4KwLV6EzVd9/byqUs8MTwUhm1EPbPDS4TL8ZX0knjNc3sbejaVbWUMsRiSm/CKD0lys1F1vqP7iUb83gv9c5qaFk0xqAEbZIeRRrBQFca80P+YVIC/SkXFHreTR1yMaYK7GSz6as/gnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746811520; c=relaxed/simple;
	bh=6eF1aN2AaDqdhcTOBmC/VaNgD3wPhefQUSF+JL0w8/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gp3+IGNKgvu7uFnOO/LHGu2cs90UUZuYqULsyW6v1GU4dd845YbZlIj8pINXp/SEUuVaGgOIfxZg8Wevge9kS95N6+7Yd/RJpL0TaTR+zOohqnEDVCQi+9+01zsooqK0fTWxJ5oB72532Gh0L+KZFqrjysbwSFDbLTS3OJvtzDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VC6XXjxY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WY0lFCFC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VC6XXjxY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WY0lFCFC"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549HMNkC024034;
	Fri, 9 May 2025 17:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=qRFYEeDRLX95/8RYnz
	BAwCuoi8+PeBPyqxOqKRLnaj4=; b=VC6XXjxYNQDIhN3CWI8GhZ1QRd0eoiITUx
	mrbaec5/NFTCpwGaoldVT8fGRoklcJ8IqNaLMO70/JK/9SVTT/3AcyHFAQuV3sVt
	dyP6Xa5bynWdNqlvwQz2BmLZbdgVbEXs+C/NE7dvSnbliosnIFUG1b5iHM9tCwIh
	Mg04mcsVFYEQIUK1T1MVz983fI7aU/eBs005MUmG+vB8eXfJmjcltSVzNU6uKCGV
	KMqcmn2RW4cZ79NhbbifnQFR0pU62eXxIN6Q7/glrsRUrsJDbm3ytcZ6PeyTjCTj
	bPb3eHAKHZtjALpUx+S+ZfnwE0cgQ2kix4dOcdgYVFMZa641QSqA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46hp1ur060-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 May 2025 17:25:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 549G4m6Q018325;
	Fri, 9 May 2025 17:25:03 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azlp17011025.outbound.protection.outlook.com [40.93.12.25])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kd0ctx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 May 2025 17:25:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+aePGa/4RJvd54zdOrjbfvjv0rCMqQS1S/SkXjbLwhI/itq+jzJigBL1MqnAqutnkjvuBszyb/D8P3zg/6V+I8FZm2dgk+H9oXRL8WW0HMbocw3b5eUUdhY3/LSVnwc0QHh37iOZ4DbaCRrOUqoBYNlRXfjaX1fL2XRl3VZplNNYQTcOcGEz1Sv7+OfrM50awCBwbRdg4rxaMhRTwrb2t1/PSdm+qmeMUwy3gAeyJoOko/2MBVwvbN6xJmu3tz7aC3IAUFFiX+oZSPx/1b3UGcpQFHhZRbg78jkMQoTJh79FeeM9p3YEQ2rDFvshCv66OBSXPkiKXp+wv7RPzXqQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRFYEeDRLX95/8RYnzBAwCuoi8+PeBPyqxOqKRLnaj4=;
 b=nR1SiFj4DQXpLrVWFgnGMg+14XAA6s9ch7wpZJdk9FhZ8hqqww9GP0n5tatILag873O1k42lg9+3xK4bF/itbTGcxJ0Vq+qfxgQ8DCmWJ5p7ktKW7Wh64rBlRKxSRdMlTx5ki+LS5272GQ421NYfyalTnKVb/6q+v/l0UCVwp9ls+KS4KJlmlJTgAD2j9FhP52dqbgn0aNXK5Jc4IlqyX9hSJCUxScZAre4CgbGy5UHvYqMoeSlFzfr99gPh9yw9jvdCeku3iy4oNR7hnqQl/weFm7Kjr2FerPxz4Xj14ryuMpLRW70vG8W3/ZKSfibSmQmPi+HVz7nwZRMToBDFNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRFYEeDRLX95/8RYnzBAwCuoi8+PeBPyqxOqKRLnaj4=;
 b=WY0lFCFC8e0M0bcsdF7LziswO6v78g2TKed4kJDlEGkQ0A7y8zYzpgfh2hrcp6+/0Z+6TpYwVAGMWj6RF/mQDd2Hum5/4esTbwbl7DzT2SzrnERuD/M+RZxYyesDp7lXPNSlySy9tb7RHeVX+9ZU9zej/R+kIK8i30HwDtiFzIU=
Received: from MW5PR10MB5764.namprd10.prod.outlook.com (2603:10b6:303:190::15)
 by MW6PR10MB7615.namprd10.prod.outlook.com (2603:10b6:303:23f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Fri, 9 May
 2025 17:24:59 +0000
Received: from MW5PR10MB5764.namprd10.prod.outlook.com
 ([fe80::8d9b:9200:a7f5:19a9]) by MW5PR10MB5764.namprd10.prod.outlook.com
 ([fe80::8d9b:9200:a7f5:19a9%7]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 17:24:59 +0000
Date: Fri, 9 May 2025 13:24:56 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        yang@os.amperecomputing.com, willy@infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
Message-ID: <jpydvwxzf72l64p5owytl7wusqhrpvfmcsqaeuhoxvymjkeue3@xb6skacvappg>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, yang@os.amperecomputing.com, willy@infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
 <wpxllvzvr5yxmmz6cjcbxc3gkpfdlfxikvoyt3xoyjcjriqys6@befrpxo3o7fh>
 <88ea8437-4202-4b72-8c77-ce1b0ea4cad8@kuka.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88ea8437-4202-4b72-8c77-ce1b0ea4cad8@kuka.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0267.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::22) To MW5PR10MB5764.namprd10.prod.outlook.com
 (2603:10b6:303:190::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR10MB5764:EE_|MW6PR10MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bbdcce8-8f47-4d23-8f0a-08dd8f1e6c9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b5Ob6n7rMU1Inmu+icGXqZD0xYUdRDkw32KHD1x2m3r9OGpzTeIQXY5d7gyx?=
 =?us-ascii?Q?6Y/JAHPkmhGxA+F5ebGNAWt4N4oVTlOOITVFiMFHTBEluEBT6nVxKkbrNdGd?=
 =?us-ascii?Q?sxJSV+HELbKUP8UvtO5b89ShLZ06cJFq9+hXvjA/OLMed9B0JH3dF+0P1eV5?=
 =?us-ascii?Q?0L+DgxLnMW6mZnpeI2N+bkPfX6Hn6vxQ8ZbGTuDIVg5qLhboOd67LZj3N4pQ?=
 =?us-ascii?Q?0UQbM6SwyN1xsv6NBZ+Im3Hw+zE3gDgr7J8bzdBymRxKQXFwTW1kEu7iB9W7?=
 =?us-ascii?Q?tmnsRQqO38qFrlnRe3k/YsR7YibD3BKBORafB3OZQtIAwvIRB6mWywxObx+j?=
 =?us-ascii?Q?ihan4hI7WC6aTY42UEGmwNocdX1JNe0WRWUuNWiZXSpseRHcKrVQlMyqBpTf?=
 =?us-ascii?Q?+AwsRaIwHY+N08vWB0qs3NNdhAhOb3jKXtoTFfWJ074EoCxvaxWGiaNKvCOA?=
 =?us-ascii?Q?rWQecsUi97T/2kRh0fYf0Q97rM2jjrXnHGGCYCdeaRmlPfzbXiTJWeuhnc8O?=
 =?us-ascii?Q?+B9eRKlQlw4y3Vsmsa2s9k63zgsE55a15LWLtVREdIhr/kqIhvkSCtnJrUHw?=
 =?us-ascii?Q?RhCY+MmtBTXhpWZAq49JcfOPuMNVJ9AozOmwnDnPjzpZzltCzI2lEDFZeWS6?=
 =?us-ascii?Q?3UXyGWZQjOUvIKZ96YsZjR/nUCRDRW3YrAJyQeguC0twJpIn3nZChaW61Qlj?=
 =?us-ascii?Q?/dhx/4WfzBR7pFY5XFztla4edPI7sC6Um6esChxXmHeD8bRRoV1CPIUrYHrX?=
 =?us-ascii?Q?8SrgMXKO2NFi5WibXZRk61oipmyAFU1eewCXPMKZvr4M0DKheRYgjfpjjYdW?=
 =?us-ascii?Q?t5xDdyPBelLrPN3tWNCd4UJMAmv6zPEO4lHfkFNjUDcOQefRVQGyXfK+ZYuO?=
 =?us-ascii?Q?C+HRCtaI/1Is+CoQPcDMKvgg1lOKaBne2QHh0locmAziQmaVjEjLuCXbjAYs?=
 =?us-ascii?Q?9UwkpX/SA0wyPSHlgaMvpTIJnyG5K5cl9SJnxefe8jx3m8yNE7YTpsSU423t?=
 =?us-ascii?Q?V7oAhOnCP42z1QAOngtsuE5O4p2hy4wEBlJkqcjyqoVumupPOacigvZ4xhRG?=
 =?us-ascii?Q?s53MT125DKI7fGvqgQQ30PrgJf9AJjZQA7nA2xUs56hBn7EGh4SOsUg0N5yG?=
 =?us-ascii?Q?NnWcfpxlOmVPacgHCMVqSH7sDMhisfiC6ozfMlIYlHfy+VJMm2Nrx2jsoCWZ?=
 =?us-ascii?Q?6g/UkTKQiiuO1q/YzoyRJa698m00vl/zIZSsV49ked89FDZz7X8up21JDnNO?=
 =?us-ascii?Q?4FazK3S+3Zuf+FrNl6wNokWAcRFqO3zDZoaOZmM2/q1JMZTb/T5yHF/nP3PB?=
 =?us-ascii?Q?Q/Q99N3VqCq11pd3e1kua1rnTM04ZSj1tjiFciBaWXsZcDdpo73h0RznHpYD?=
 =?us-ascii?Q?xOuB1uG7BLY+KTvm7No2PpyrYoJfeok3Yc0KIPYM5imPT2N5ZfcWDCWzJA5P?=
 =?us-ascii?Q?RBFhPRdNQrk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR10MB5764.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9eT/QhmsgCRf3wB36ZfvrRiobs308VmsDjdnKfrGVA/gf4OfA+orgVG8TK+W?=
 =?us-ascii?Q?rPh2Ali2IlfO4PBUgA7Qeisa0XbBOo9X2o0c7tFMDr8l1CGXoy5eIim3Zd5f?=
 =?us-ascii?Q?SbrpxGLhWW5FQUQYIbP4aSwIBimpMIo+edPRVam5iXySZCn4atUaSBnrDa7o?=
 =?us-ascii?Q?iBLc3CkYFOzQPiVFKXp2+Yi+vVdjsU9CCUdZoUXFA+7AGnpnm35qYTwksfdG?=
 =?us-ascii?Q?xpTXtGxpJtkkO4xXn3PHLvASpDgLc44Zd7AUQVam/UnrhNVvyIbogx3ZmI3Z?=
 =?us-ascii?Q?u9KLzP94GLDk1rNAJwKiFfMp1AePbMkRQcHwZQ4QGO8MGzsn9fzlzs/T5wB8?=
 =?us-ascii?Q?/ukWoEsW6VqngZ0ipPe9AOCJBQQpx3ccuJ8Dj1T2ALR6ek2opAqBsOHD5zDm?=
 =?us-ascii?Q?Ek6clJ6LHdZ71n+yqkPan7QXKptLjKOHrG3N9u0Yl1TBD18bRnkfE8E5U4WF?=
 =?us-ascii?Q?DG5Mjbs7APLQzZcaeGBkznWiRQGGDokGK1n0Wjta3hSkCJ/E95Dp1tjVwbQ9?=
 =?us-ascii?Q?WmkNaVzlG8TofADD2DOZUqsaMbHITHSS9Bnc2hBsAqfGwdTBH2VY2fHRZjEb?=
 =?us-ascii?Q?GsB/JMhkzZnFhedI9ZODp0McbxgbJ2ucw1manLDdki2iS3mlozY5AylkdvUe?=
 =?us-ascii?Q?O5cBRVSqUBzxsGrKmqv/sC8a7oBwKb09qHOFQt+5pDLldUyifErNOf/XmH2Z?=
 =?us-ascii?Q?1YLxT3DDvCBHFPM0NUog1eecGU81NW+X5W7zITsNdST1jxv1meAGwpOq6+Ig?=
 =?us-ascii?Q?cRLh0S8eE0tYv0TiAJHZ15hRzmL/7YmEdH3rfoMxyMhF4nCJ4AqDCh4iFz7/?=
 =?us-ascii?Q?iS5qp374tI9Av8JLLETHmuKENFqBKGpBfx6EHGWVqgF0IEzMcZXQXsphtFFf?=
 =?us-ascii?Q?qwSbmOSmg7nCrK1u3FYJVDD5xaCiHZI2fZZiK29Z9y1/PaobFYRLZY0OvPpn?=
 =?us-ascii?Q?fHAsEDbI+3KST+1bOivAoJ+STQElvqzMzyxYPC2EJQE80OXsu8kULM9WfFaY?=
 =?us-ascii?Q?c6EfvBxdGiMivevBubmLtejnrE9wDlQbEEKqgOrx8+TShEcNbMPfxT1X8pAG?=
 =?us-ascii?Q?+3BQDMI1iMsPkJWoGe2XhLNrvKb8wAYqLLnuzfWglCtzadfwQ00GpsWaSiew?=
 =?us-ascii?Q?YagO0oaWqBB7xMCXMmjCFqJG0XuzWyWp18lggZ8pPhdb//17agXuNZRyXN5+?=
 =?us-ascii?Q?FMUtpzB5aM549xoXqgu4L120GdTMtRWKjMDd7XH/u1rHFG6PVZ8kfxC6PCWN?=
 =?us-ascii?Q?AwpooFi62XwuWmB9/0KSec1L22VI/5HGLbmja1jcj0+DVrRoyRaAkHshP2Wa?=
 =?us-ascii?Q?7VKxzvaWJWaP6ZBohdQpA7NZkD44UFd6Idah4DY6eqGJK19jf6HHaYA8Eg+x?=
 =?us-ascii?Q?iU2ydBn//QIw0Ppe/FoaeMH4ZnRxtzrKxDG3O7pa81z02E3/eggyTyOjrsBk?=
 =?us-ascii?Q?iHzmks0wVLC+QrWCviqYDGEEBvgwYaNDJeU+SpzIsyWMo0yOYBhGUzDUI/j/?=
 =?us-ascii?Q?mWxy5lpLUv9/7tBjTQyHzVYxDd5WimhxpbvuydV7iocUlg5DCW6omAYIfe/j?=
 =?us-ascii?Q?u8BVIPZ0HO3rfXyMflkNJuTWfBM+s6r0MqoGiLpc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	M3kmfGeYz7wVbQnETiEbYuWTKiT8ROp9qvk4WejXS2a3ZAKFQosnukAmzWBJY/vCaWIW+OrPpVJk67mPH8pQTyNanfvwh8YvggrzCuf6Czz+3q9aB0lHxWOfbPG34BoaHp6Fy5ueF9p9BpH9Lc6bGddy4sbsFoBgW48pQk18pm50VMX1tOgLL/TjOqcUI9lzP7W8Q4EeqPfKycmVFu/3YCyiwratUziG4MdPGnBE8ZZLCkFv3+2X5V+UiC0Vr38sHz/FpLij/iSh6ryy0lMe6j/vHpTH2WZpq/q32UkjmV1bhW3kEsnY9OmsEhZavXt3MZh1FLSNA/FwdRamhqkuJJK7fuzSgA0g466R5Z7vfXL6L8qlirFws+kFw7RUU3F5g3XOGFst4iyFjhCbG4nW5u9Nl+QY8UmhvedBo3JuR1O7tVMvxPQb5vxQy3OBOfLnfnS22IQWv/K6xs8LkahBHZRFwvzEje4N3KD+mNVtd/dm29apCXSTSo0P0MeZInxtbwh/P6Zy7N6NMdN2p8XdT03snp5yoB6fR/TqKcqMRXthe9p0+JlC+X/Xbpu53xq955+zNPcnjFInvl4bJkaZYKrNxORS8QNsBCZ3ht+9I2s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bbdcce8-8f47-4d23-8f0a-08dd8f1e6c9f
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5764.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 17:24:59.2489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9E27y4hHKdyZpNTG5CqU62Fs7BAuywJnb6AF/nnJGb36hlys8385Wtd3kaJMoklZNqkdLL+lEVFRorK58oiQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7615
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=870 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505090173
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE3MyBTYWx0ZWRfX3ObIXIodJREa y07YPjFKF0u5zIPHs/tDY5S1gZdssg2NMXMjSxjXCqn1pFIY8BfdjSFPTotuBvzzGu1Rh/QmQ1b ZF+0SOPS+FcZNDouxZjxI/cx5g0ZtB/WfXgk8lPGrIpP9czCdYj1wOqbTn6Cve/WO6xMB7VBa8g
 SzS8ID6/RZKySCjNPL/muregtymOSQ+nfJdHhXuzF0lS9sX7mfiCo+/nmgQAmQIoM2CXMHg9ums XJzK6d0mxl5fSKlNjlks/+teFfYv6pBAqGERE6XfFYTf26aJ0QNbta0+vQqRqDV1SzfTUTbr1fP uzBdkvLn9Kv39WHzbWSVO74Vru4TmMN2rOEzRNS36n9JHd+SbLbBoDrSnkZ+wODkqm1D2knZuQ9
 flTLcC/qHCNcP3P/a9c9GxoZq9m1eM+fdWdWUjth9Qyr8GwjqgaUz236Kx4/YILKAqwUz6C9
X-Authority-Analysis: v=2.4 cv=IIoCChvG c=1 sm=1 tr=0 ts=681e3a70 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=TAZUD9gdAAAA:8 a=tf4hL49xuAT5i8PtW-wA:9 a=CjuIK1q_8ugA:10 a=f1lSKsbWiCfrRWj5-Iac:22
X-Proofpoint-ORIG-GUID: hSQWGwd-4mWhRwIWPxX4lRqkMoVnsb5G
X-Proofpoint-GUID: hSQWGwd-4mWhRwIWPxX4lRqkMoVnsb5G

* Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com> [250509 01:47]:
> On 5/8/2025 9:04 PM, Liam R. Howlett wrote:
> > Which one should Cc stable, I don't see it on either patch?
> 
> The patch in this thread is the one without CC to stable, and the one here:
> 
> https://lore.kernel.org/linux-mm/20250507-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v5-1-c6c38cfefd6e@kuka.com/
> 
> has CC to stable.
> 
> I had submitted both patches together in a series here:
> https://lore.kernel.org/linux-mm/20250506-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v2-0-f11f0c794872@kuka.com/
> 
> but then Andrew explained that this is troublesome, that's why I then submitted them separately.

Right, okay.  I felt like I was going crazy because I was sure I looked
at this before, but couldn't figure out what was going on.

Thanks,
Liam


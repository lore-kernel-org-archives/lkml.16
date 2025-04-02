Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306C2233704
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 06:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743576734; cv=fail; b=MdE2cHI+TNbPCr3zeOBYbAvZBNRbvt7dVg22q5F2qrI3JBH0eWoTceJmFXxCu3VhRnl+xFUwMMamkUNl9/SWiAAhprZsH1x/IY7K3PyJvNNAvWAeoMFT6dmQsLLh2enc5fl2d9wAibjmQWgyrWc/4AFpCCp+h+g6KqNGXlp8ff8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743576734; c=relaxed/simple;
	bh=oESJHDjH63JkwN+p2WKJP0yW1yN+/teWWVUW8RwxZlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c1nZ98pcVzfpX1794ypONMUgVzSGykefYF4xv9eeyg4RclUaNFhnogvuw3j6fJ4maCgq6/G6U/zvcm+Bz1dp4IEX4DBDtEuJouEEMNot++xLo8IaecMBPmjpu4lVQktq+J94wzhaSkzMDAiZOh5jhD8eZB7Se8q5dZERqbO9viQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jlQY3psz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=baYDwKNV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jlQY3psz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="baYDwKNV"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5326g5V5007821;
	Wed, 2 Apr 2025 06:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=uURWPy/VHLvaKarPKUBF7Xagx/ClOQj1sj9lYooXQ2g=; b=
	jlQY3pszXrCflW+ODhd/aQyevVBindmDj8M1nmDOOftlgifdof1h7Q7kqfWHKqBh
	JE3nS6idpywptFb+XfOTuUYnacwd5COX6IoXrRLYGmT2gJe/aw+X6z/RaGdQJ5d0
	tgb1cxVCwoD6FcRjVDhTw/hoUPoh8e8Nl6Y9s1Q1O/s7qqp9IWhuW3Mn3meCU1uI
	G/ZI4aM0PrMdFlNDK4d3fCvjOOtbYXEJBLEQQ4n6W45hJ8BTwrQ8TRZzaqPIo9pQ
	c6IVPoBRdqTxPHnPIiu7J1srny1zRl8cMxj7B+KpRsEiG4NrKWjXmQOghAxobIRT
	iFR1W4dSpk+tT9nHUChGpw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8r9hhbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 06:52:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5326a6f3004236;
	Wed, 2 Apr 2025 06:52:10 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7aagpk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 06:52:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8IvB5tyoabJ6LjmT88CnkNx6NjdaCfrOhit4pxgczQqkrI828LBM89moUflfe/hfZws6d9qGPrJnQzFy1x7KZ1NQCdu1ED8xIM1gARHODRM1ioE+E8zQv+GA5xfJOgPajlKWEWWVCRFHXvsX4WgIfiUotivluazBOkiEqBIDkb+D4T4Xgy2UjwWrn47B6GfI0uyr9KlvNe31E1qIvnzM6/PHl5EKFy4vrPbMTPYb7yGoyQUqjeQZsD22Yrp+T14RoEmf7gJ5bgK40CWiu3mENgmI0LKYyxpiXmdWluDNko8RaJNVjKmI7Cu5wdAaCTATQGcQ/fmChOj/Sde0LWHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uURWPy/VHLvaKarPKUBF7Xagx/ClOQj1sj9lYooXQ2g=;
 b=WvFEuBSBc+uqddlUpntt1TzyiaXgWJRv+kqYVFWnH/T09B9EAvcPYDakEI+JLqf9t4g8aCaGIwAyCM6iwO9AvpRxEZxx1yrsYhpE5X+m7vUqeaRDvAN89qq7IQW8z7xh9TjEWFs0ShI4xp997Voea8RbxcIhhp6iwXfVrV2Q6C8tQ5CRlfX/Sn0w3xYQ97g03vch4qfKwzG853JjLgPx9OSL5uLwIBrDUCHCOVHG4ho0F/cN/cvcsgsU0IgSw3cZCqLYBWVnOkHPi8LJrlkK32Yer533ix72IKHbBX6pHPmgJmPR6p1MPOjQqegXnEvCyn0/YxiXMquAhh2SLpo5Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uURWPy/VHLvaKarPKUBF7Xagx/ClOQj1sj9lYooXQ2g=;
 b=baYDwKNVlGBqem2IcWCA8TSU8uPdeK3vt14i/Xn0xYFGnN9JIVjda2wYWCcPf6NdoNx/tLC+/q0WkY80XJb8tAA4YXaNKakqqq4l7pgADbpkQkmikGmxRCzyx9WXqgKXyjrTsC7ZJFSg/aNaac05/xhFeGTBiZb7blfeXPBqKAs=
Received: from PH0PR10MB5563.namprd10.prod.outlook.com (2603:10b6:510:f2::13)
 by IA1PR10MB7538.namprd10.prod.outlook.com (2603:10b6:208:44b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 06:52:07 +0000
Received: from PH0PR10MB5563.namprd10.prod.outlook.com
 ([fe80::1917:9c45:4a41:240]) by PH0PR10MB5563.namprd10.prod.outlook.com
 ([fe80::1917:9c45:4a41:240%4]) with mapi id 15.20.8534.040; Wed, 2 Apr 2025
 06:52:06 +0000
From: Siddh Raman Pant <siddh.raman.pant@oracle.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] published: CVE-2025-0927: Rearrange fields in JSON.
Date: Wed,  2 Apr 2025 12:21:53 +0530
Message-ID: <93257fe21a95499b59e410f3dd514d287ffc8cdb.1743576485.git.siddh.raman.pant@oracle.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <80cd3f46783cd5702b3abd40c11f3f08f64717ec.1743576485.git.siddh.raman.pant@oracle.com>
References: <80cd3f46783cd5702b3abd40c11f3f08f64717ec.1743576485.git.siddh.raman.pant@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::19)
 To PH0PR10MB5563.namprd10.prod.outlook.com (2603:10b6:510:f2::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5563:EE_|IA1PR10MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a137961-455c-4f0b-da45-08dd71b2e1ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cGYLZ6Vw3rOytSG+vLlVzljJ7pxoe6mfvAiczQv4wAq8tR/tyQ0WpehnE3cD?=
 =?us-ascii?Q?duiDqL4ibzBx4vBuPdFcsWntKWkxsKgZby1oLdetlWcEhnoX2oajToUrNt+a?=
 =?us-ascii?Q?JA/5DMw7wWM9ZblX7ou1ClbMEBsABJOSANJkqiywYb+NjyVyoXoqeF+bokgV?=
 =?us-ascii?Q?RlLIxxBClTMXCkBTLeh3sdaZgF/zhW7kRttGhUCPx0deOsCQ4FDHpGJSiA5O?=
 =?us-ascii?Q?MPn/O57vUkfxl6FuzHuR8tJ575e+vM3MZfwplqMUjzuRE4hPjGWSTZVMovpy?=
 =?us-ascii?Q?IeexfNNJLiw7tJ4JIUZ96Krt/MnTzMbinyXtbAd8p0Ysy8DWc/0NQLj8XUZl?=
 =?us-ascii?Q?skS+dOurM1p8l+6mCItX61kiznET6T0PGXRuYJ57Fiu9SPcjWb/aIrMe35V2?=
 =?us-ascii?Q?wG3+15ytDaewPU5ZPQLuRIQkV3NQLY24tQ9xBcVlRlSDGJ5d6dkK4CLRCjPm?=
 =?us-ascii?Q?QOX0YnB5BcLCz3Su8kEJMmEGR+7CEtw9q+ISiaRNijV0sei0ImZcTIlbIrp+?=
 =?us-ascii?Q?ZcY0gHKCgvHBBERXaNKbX6vN+KqJWkh6OHgSW4HrNFFU1TNm16jvhZuKwxDf?=
 =?us-ascii?Q?ymuEqiqM6DPFfDb8wxT4a3y2Rk1lbXyyZwHpsrhQ8mIjHySKxBn8bCg5hZKu?=
 =?us-ascii?Q?4UK769mQbxPMTrKAdhdv7t7LROH/kU4TKAYQtqP7ioR8xjHncQ5q4+LgnVPp?=
 =?us-ascii?Q?9QANlawP7ud13AA+e5+5lAMwd/SAHNHc5OCfjygXviJn0Y0YYeWSRqf8OpHM?=
 =?us-ascii?Q?LmgjKP7fAA64v7p3HVhkn7L2j1QCmIogqRb3rlVJNLlRubvKwly+9qAS6d5S?=
 =?us-ascii?Q?3Rgh7YTxf4zN2uowXqTl70UqbXiWX4OpbuWpAyai0aD16Kq4gKa6jKy/o+dc?=
 =?us-ascii?Q?U/V74BQMuC2/V6nKIbXBTdzVQmXgz1OUOi1yPm05ku10Iu25uuIMAd2hqA9I?=
 =?us-ascii?Q?wgEp9ejz6VUgrStocOXsxDgOAhie1JugcO3j4F0gAmSROfIZ2jw8QW8dxdzz?=
 =?us-ascii?Q?EUIQZr80CO9UZAkejy0XAx1kO/g4YXgbsrXfVo/oQHE+d4zmSftdQv6BWvPS?=
 =?us-ascii?Q?EQf/vseFi1xe6yH/rbaLHDGMax5jQVE6Z5FHReDP1vilw4j2DqAgTQsv4phP?=
 =?us-ascii?Q?xP23f08T0UfOMtflKbuPdsOFWklcacIc80bKnl2aaqn96/xQINoEOQgQ4U7/?=
 =?us-ascii?Q?1B4V4lPHjeHTrA/Y+/tIYivQ2hpz8yO5C2qmdsVa4eb8DfToSRI+fttWWprR?=
 =?us-ascii?Q?WCleYzNZxv2ZkB8EopGIQ78QtT1j4URYcoYp0y1rXQZXobC+939E+P8cbcNl?=
 =?us-ascii?Q?1yEST8F6QVbegody9huTWe+HziunCQGjz6bzpBsXBJfimQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5563.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VnL/yFPcnru2tIDH0xFv5sFUYJUBRrihINRXqVQfDEYE2twFvxetkDKvSCa8?=
 =?us-ascii?Q?9y3Sq6Bb+wIqV4UXmHxs7EvoYZmQTWelwIu3jbGtr+lhX5y14Kyhzx9R4WxQ?=
 =?us-ascii?Q?6CcLW7TFh3FOMRtQAyQ+3c4gC2OTL2xnMHw+iuu66HBWIKQYpjMQHsq4tgl8?=
 =?us-ascii?Q?jpH7lm2stELhg8ih00cMF/eLBXm2XEqM+nIk7iM7nmUsEaEX6IO0jm7SFXKx?=
 =?us-ascii?Q?Q2O4CUEZ7LCip+gd84x0qQ0uGb2/Q5Vk5WnV0Kf6pynAd6XpKxASKEjjCBPi?=
 =?us-ascii?Q?MEBu1WzMJF//XFw/Q0T5Q++mukZso/2a0t/eTZf5GZwxN135WkQlRTWpiye/?=
 =?us-ascii?Q?ybvKqFTXeua/oFYyZwD4BizxarBdj51pzROZESRcnEJOwBhy2mqtSPpHko5B?=
 =?us-ascii?Q?SMbrKmlPlFABjMFx8FDJV/j9oug0PHmW0mT8yCw1NEny06eYDb4kNQ6weP59?=
 =?us-ascii?Q?OgAK4ZxD27kZ7isURfkaAHFFRy8FJuqBF/FmDHazgLC3SBmkARbtjxfC2ra2?=
 =?us-ascii?Q?uljsd5740OHt34qmq7yq98711P4MMzzz31pbkMVW16A8PBdH0KzWLtSlvIJa?=
 =?us-ascii?Q?uM1c+iiKHUTefZeRSLseNkeVLuTtE5NxRzvX97Kom2wisVThfE6J/ib4CNh0?=
 =?us-ascii?Q?42LJ7xyZWsh84179xAz1WQHo7FkoSBlM5GmGPXZNwk8jHOFZ+9jV4k17Xf8x?=
 =?us-ascii?Q?+d4R82EyV3KArpr8JA5//jmXxq2l8HyGqGUuO/W6WW9M5db3JPxJUYuNyFXl?=
 =?us-ascii?Q?O3ggWlUvb5pVZ3mgDayKh6rgRkf8BDJz4h2Ae0rngD8w/e4JJmJnJj3nMNPy?=
 =?us-ascii?Q?/wBxjNi1j1O+jGUJiFPghyWotyHKpMGela7gNpCOFMQRXlSpqdZP/ug3xXAZ?=
 =?us-ascii?Q?qH5f/Y+8HGeYH3u3BonOCWzyBSZV76l2DEdvGGMukddXqlBLXtrHgrQmKEkX?=
 =?us-ascii?Q?hyMCxJXHkQYijlDJdkb10wmNPg83wjA7BWLn6HFvmVA0WIq9D4l2Y4NsAJTu?=
 =?us-ascii?Q?h3kJFo4WEOwKba47bVP531aPUnlwTtshgfk2ElgzZBX+/674t++wLxcr0KCC?=
 =?us-ascii?Q?t4V+sY4vRFiCXy/7FHawT/OaAeOeGbY7HfX+VmOE6zALH0S2yQ+8pRyeMvAE?=
 =?us-ascii?Q?+yfsJS/vkd4Je3ISBLPUmByPVDK1UYUsWJulPAB0uH57s7dQ5s7DyFwVQIK3?=
 =?us-ascii?Q?jBY2sGA4hnJ8f9AItBxS1Jjpq2BU6FOJMfPLdxa5KSXOekQGwF4PUIKexeKk?=
 =?us-ascii?Q?ttjbgrj1vW/DPju4NxGIDNj3BTdax6a1YhjLZXefnYh8QJWnaba0I/MY9S+f?=
 =?us-ascii?Q?JIDMLvemohWAGOimpzYPU0wiUJCznztfd8iCfRE3WtzhMMSfVq9gvXaBXYgI?=
 =?us-ascii?Q?eHkrCQAnHXCF1pcZutuLqpNbls2rhrPpQBDYz46cyHM0tOhQMeIV3sU5rfhd?=
 =?us-ascii?Q?H/AyaiD9GV6PYYUgexw9s3dK+1UizRzeW6bjD2qselYlpjP8k/Eege1MD4xU?=
 =?us-ascii?Q?UYNuinuMRfXPLUwVDxBc61Zsc5CQNNj24jYMBLIidSN64MsCsUcexhzLNWmb?=
 =?us-ascii?Q?CmMt7rwGzIngkxsscEZm6Wbqg+C02o0U3es9bMccdMpP38eemKYPbyk8L8yx?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3Rm0/agF1gkMHgFgnT8sAwff1dic7SuoPzotlhNSnAV+ORGezziF3iOUuSs3r7KaX4h6WFXjOrGYUpi28yJoyIdKdnlKkgPe6eShWDiRqPBvgR3ijJRqyovPx92BkN1ni2PrwBwzazXty0P7sV4GxImjJC7uwT0ChF69qVUYFkS646k6RJqLtVPhGTL2Orl0aKWoOIKgB0ZJ2V2SVCA6snUp2ta2JakVte53oaqL6Lmd03wtbYMhJaosX3FbBpo3NstXj3t02QJID4jIY6f9wGV4fPuNR7nC4I5kMUFC6BRhpKkK5iskvF8vdZE+h7MDciDyDp1b8HASoU5gRJfM34XtDPuBMP3twaa6qyMYJktj15tWoGFX63092iBf98GdWm2AI3yqwUqclQzGVZpD6+JdzfDaw8s3Lo7T9t0LiwdnYUk5HY7dDKnJ+hrUTGKk2QAm2UsnJrR1SG7J+EFGqDK/X+tVMhlen4lypXXEkhDFPHMcowr5ygx9E6a1Nd1tI7QIegyXa2VfXhzm2KgH8xKHVrE3YrPIvKQmR4nDnaMkNP0e4E0g6/is+fxeEOAiE7MiQqLbNq/Kfj75XxCkntNM1YlecSCw3FbhjYgaZ60=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a137961-455c-4f0b-da45-08dd71b2e1ee
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5563.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 06:52:06.8076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bJ+1GF7meL+Oa89ewhwR4w8tcoMUWLCx19nundyYfwk1BMW59R9fGY+s8mJVajDKsw6ARJk3o+eVO1UKF1yjVqsH1hDYrYocGiMDwskZjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7538
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_02,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504020042
X-Proofpoint-GUID: Nd13inxgDI2hZC-ThUlNbi83o5zNNRhp
X-Proofpoint-ORIG-GUID: Nd13inxgDI2hZC-ThUlNbi83o5zNNRhp

Now that we manually fixed the values, let's rearrange the fields so
that it looks like other CVE JSONs.

The order doesn't matter, but it's nice to have it look the same way.

Signed-off-by: Siddh Raman Pant <siddh.raman.pant@oracle.com>
---
 cve/published/2025/CVE-2025-0927.json | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/cve/published/2025/CVE-2025-0927.json b/cve/published/2025/CVE-2025-0927.json
index 743e70d4b100..fcd9fb51e620 100644
--- a/cve/published/2025/CVE-2025-0927.json
+++ b/cve/published/2025/CVE-2025-0927.json
@@ -1,11 +1,20 @@
 {
     "containers": {
         "cna": {
+            "providerMetadata": {
+                "orgId": "f4215fc3-5b6b-47ff-a258-f7189bd81038"
+            },
+            "descriptions": [
+                {
+                    "lang": "en",
+                    "value": "In the Linux kernel, the following vulnerability has been found:\n\nA heap overflow in the hfs and hfsplus filesystems can happen if a user\nmounts a manually crafted filesystem.\n\nAt this point in time, it is not fixed in any released kernel version,\nthis is a stop-gap report to notify that kernel.org is now the owner of\nthis CVE id.\n\nThe Linux kernel CVE team has been assigned CVE-2025-0927 as it was\nincorrectly created by a different CNA that really should have known\nbetter to not have done this to this issue."
+                }
+            ],
             "affected": [
                 {
-                    "defaultStatus": "unaffected",
                     "product": "Linux",
                     "vendor": "Linux",
+                    "defaultStatus": "unaffected",
                     "repo": "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git",
                     "programFiles": [
                         "fs/hfs/bnode.c",
@@ -19,21 +28,12 @@
                     ]
                 }
             ],
-            "descriptions": [
-                {
-                    "lang": "en",
-                    "value": "In the Linux kernel, the following vulnerability has been found:\n\nA heap overflow in the hfs and hfsplus filesystems can happen if a user\nmounts a manually crafted filesystem.\n\nAt this point in time, it is not fixed in any released kernel version,\nthis is a stop-gap report to notify that kernel.org is now the owner of\nthis CVE id.\n\nThe Linux kernel CVE team has been assigned CVE-2025-0927 as it was\nincorrectly created by a different CNA that really should have known\nbetter to not have done this to this issue."
-                }
-            ],
-            "title": "heap overflow in the hfs and hfsplus filesystems with manually crafted filesystem",
-            "providerMetadata": {
-                "orgId": "f4215fc3-5b6b-47ff-a258-f7189bd81038"
-            },
             "references": [
                 {
                     "url": "https://www.kernel.org/"
                 }
             ],
+            "title": "heap overflow in the hfs and hfsplus filesystems with manually crafted filesystem",
             "x_generator": {
                 "engine": "Human fixing output of Vulnogram 0.2.0 for Linux"
             }
-- 
2.47.2


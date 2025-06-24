Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17FD42056
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750780140; cv=fail; b=NOg48fBgVhQx8tzCBhMok07boJ8eeih4a4f82nZAdJsaLjPdNxPtGV9dxBrQsR0YgdYlJVryhtmjdF28jqexeVtF/mkwoGJm1wkj5ChrVpyK2MklYVcKU0Z/4npGjHU7CStHS/WHJvdbjQoN9w0jQkjW+Ex8M7gT5q4l7AhYYC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750780140; c=relaxed/simple;
	bh=ICG7ryiOwZkjIy0a8bmh1VUnZE/hDD4hScGWPqcqkDk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Ls0OKZOpw3nnBNcowD/sGBctMKAoI6UF+jS3PlTgcw2vZBX9of/klQbYiDSYJPD4vK9pAqj9N63N1cjgKh4XaP8uAN+XTKNyEh4/sEVjXzP9BAQ3tHyRFRXIJu2es+Ad7wyV14duufrfTgQmtozAUAIURNHiHPFVShwFrNfhDs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pKXWL/Cj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VCyUODL+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pKXWL/Cj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VCyUODL+"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFMmoX004111;
	Tue, 24 Jun 2025 15:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=44SafM2ej3VKKFgu
	TBtjXAc//Zt80j0pjYtfWpIheHw=; b=pKXWL/CjspredZi2saSTb4qoZwg+VCI5
	7B5UqdNZJyDFNWCDS+06ZufeecM49bFBj2qOXTEW7OERCZ2N/U3dus+4hrWgxg3K
	E7cyG4nu4hLI5HF7qeE5Dof6wY69ieM6s2WJyhCYd1zWapsDJS+wVRZ9rzT6jJLN
	W9BOGVCCjC8XPNZ9lYYhW60Q2v8lgQ1a0OESSnlpenaQFkUSF5nGmq0kWr2ziBr2
	c6xpjOM4NFZOXy1d3SQB8U2Sg0vPVVLOS03fb/8sv1dPXY0wuUs7SETwddD5ZewJ
	3D+QRzQMewZnCa2E1RxBuNu7F1/n6eH9FoRUgGFCbpfux+70lZoQww==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt7cbff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 15:48:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OEGWOw039359;
	Tue, 24 Jun 2025 15:48:46 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2076.outbound.protection.outlook.com [40.107.102.76])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr4t4ax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 15:48:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/+G8E0DyUWUCORZVWsl7BOqa2n8dQyTBVes9dXbr+SOqRmepH8kJrcVIKCeGo6PrIKLTDj9q8UbaeC5TFheahMxAXnYzbPi63N0vDn/4bk3ioc3t/fDoEbOO898ulOQnZd1EcSNewqdA17horCNHuvL+y1p1rmaBijZ3cRl7oOoQe3TF1Prd0rA3a1MgsnFOvGwzWp4cLarbeoZkFDasz5LKiPZmhFb8eKvHUkGBHG9aa4FAD0BfRYd2U2zxpkXzojyEZBecgq0Lo7okD+onXFVSq3ZCk7Rc0IzmmU5+IKKQQ4QLHZi+RH5RglwlLwn1rWGs0iPBxHU3CPAwcW4Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44SafM2ej3VKKFguTBtjXAc//Zt80j0pjYtfWpIheHw=;
 b=O+E77HQPvxlG2ow7MxtYvMgcJXOcz/ymrCoIc0zpsXGYjGJcEMaBs7LCU2L/3DBe1h32uhrROKIdoFabS3ERkUsOZvkqne0rMlbOKRILjeWWRz3DfBgfePg3XS5j5SwSpfI8MZ/EPdQOC2dKjB4B/aQr7MmZcqt7mm8g/mFQwL1GDj+ifowFLw9JS9ytYUCpALLggxirQkZnmR6H8Gh7GS/0nz1IKQqhwkG4//VscEcBvS8cDZ6bO/BU6i0ipZj8TR5fijFAupKVywt5ZwpVvEKnsrHtifqd0wCsDHz2Zim8SySPC7zHVRlvGpvaxmA824a3R9jj+qLNSL6jLMeBmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44SafM2ej3VKKFguTBtjXAc//Zt80j0pjYtfWpIheHw=;
 b=VCyUODL+IStjZxiBII5powH7nc8NgUWMUGaJLJnUwKM66lUPTnq/COZDCvduFeo6g/XGUjuyaMhqv2t+CGMG37gnq+EF37CWzwQLSvZUku+USbkDuujMJ0vCqyEd8eH8xFCbr6eM3O8FW4pVCRfEdQYJUwn2B76aPPKpwMuu+hk=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SJ5PPF7A7588508.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 15:48:43 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 15:48:43 +0000
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
        kernel test robot <oliver.sang@intel.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH 1/2] maple_tree: Fix status setup on restore to active
Date: Tue, 24 Jun 2025 11:48:22 -0400
Message-ID: <20250624154823.52221-1-Liam.Howlett@oracle.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1P288CA0007.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::20)
 To PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SJ5PPF7A7588508:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e78c1d8-352c-47c5-a87c-08ddb3369904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oIJp+jnXzznRribS7YpiSFmPT8hWVsTg/Aa0mPb4xHjb7LDGnpMsX2ou0yZh?=
 =?us-ascii?Q?+vBC12s7S4VCruapDjh2m+FK4WYZV5pm/wK5N4dp+DLrmHZm0XDepAEDsQAY?=
 =?us-ascii?Q?/HrllOX4dg3r4pHXwREJ3/5foq7U7PE7liIJbOCGbg0yAGIAPUNghS7lYAtg?=
 =?us-ascii?Q?h/Th7MSgB4si+hYbtUrdWXdxmGUKHbUp4uBrrrPsoO7xL6ydyiCUn/Zb6C6E?=
 =?us-ascii?Q?HcWKIktnwK8Qniybd6ruJPSRhYBuxFGM72aE95RzyXN8XybSo5cxa5XH64D+?=
 =?us-ascii?Q?em0G3tiNMFLwmilSAe++1K011TuDMxIKhUFfsw0XR8RxBjqkKrVfV7E01IMH?=
 =?us-ascii?Q?BKaa8dbQyP7YrQu2XYXtLU4cr66KYEcCrJ6iEB7B4MJfx1ZlJRKTcNKXvs5V?=
 =?us-ascii?Q?vxJQdLjpgsnLcsfBuJC7y8kpyhjSMsyWqRuGISd/Ql2j4O5qnSe9HqZBGmI6?=
 =?us-ascii?Q?f9LhOOxq9rFKWcea1KbNOzArahhqGl4geSA+uSwmibhvoqDuvA2s0/nmsMqO?=
 =?us-ascii?Q?Dt2GpCZaDW//KxKWF7z76QpzfXxfaUI6u3pViLlFVbksKUafln+v0V6N/tPc?=
 =?us-ascii?Q?6xdwNR5gzeqRxWWn+41zbRqgoDKL/3IQJVSEu292lXrUdca1E60Wg9igb7Bi?=
 =?us-ascii?Q?6cEZmY1RFGqKDW+OQMm1GliQ2csEzaAOgaCHXIYrvXRY/nVrJbKuG99iVTOT?=
 =?us-ascii?Q?aLv0kHST9F5QRYoItZDWf/54TSzrS4LhziftrjkeIFdaZ6wuD5gCPLdn78OH?=
 =?us-ascii?Q?rwi6V8l6b2ktnQ65UbL+CvX6pkjYtxja/wPO3mmTDjXZ+s1ZAdf7jLuy7RVR?=
 =?us-ascii?Q?337r9n8RrvJZqh7yn79fis4oL1jK0h3Kk8CkwW4oD1HDr3iXAnhjdv8s4zYu?=
 =?us-ascii?Q?TIEo9is5YIDiwEN3g2NQlCACF+SVfF3WmqK02aEC2/zrfEtYoagN1goBUCaY?=
 =?us-ascii?Q?8gQbMmJ0SvDIu3lRpSj80jcyAjnUmEYbnJ7S+0193gb6rY0Ynz8z5EPNBhX+?=
 =?us-ascii?Q?GydUGk/i/OYESFmGlFQ7tVlisj0RtlWgQv8pB05zz9uBuHdtO1VBCLk/L7F3?=
 =?us-ascii?Q?qY6u5TUGpx6nDmbev/OG78V0mokprYkUDk2O0Ie5CPHOdcGN2TAwXErh37jw?=
 =?us-ascii?Q?B00wErfqpRPkc6IZ4mvMSYtbOcMuz5Pw+ubVQFNoxE5EwMlyT9z2+W1A8dNa?=
 =?us-ascii?Q?CKCMMvi825xhtAL0pnc3X60v3YUEpGrYOoZQTxZDv1/D2tcXdU0bVTawDnW3?=
 =?us-ascii?Q?7g4n9/k8Cby7or0/+yz/xWQWtMLnrwsP3xG617GlwP9arhVye9I0LHzJayIJ?=
 =?us-ascii?Q?MPB5r972ifMWATrnRm6n7HslpiqNH9DjH2iWkcrAclMHc65vzmPr+s6M3fxc?=
 =?us-ascii?Q?n3SHvsZLclFJC/sXTFQTI2tfxitIkxEd2CuL89zzzpCY+jxxMY7Ww9TFeUkb?=
 =?us-ascii?Q?LYqJPnKVO9E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HDiuYm5u4/YL+oyfDrP+PGWT0l4RdsPMjk8EyeOOm+1TkyMGzi8hplOjjUew?=
 =?us-ascii?Q?Ee9ecV8oM7KnnHxROObhcuUqG2p/Z/ZnYeDPvxH9DVBlUAutqISfoQANAQk3?=
 =?us-ascii?Q?+uRyLwCRxX7iGaWL4pmqyDhIJzbvANZOrnAicjDqpruWp650QRKdBxa4qaxY?=
 =?us-ascii?Q?G08MbGyhpQ0fmEQRmpwnjf2o3HPVwcDE2bv9sRMeIrcTkGWEUIys7MiW9CZ7?=
 =?us-ascii?Q?D2puyg6emY+cZFAgx0D+qKCs/QLkim3pW9+kJ5ZTiseqCAY6AnPdz2tldLW8?=
 =?us-ascii?Q?cCWmnIlx3UXwsFo4YT2K0POVLbaJDCEIRofn25Nzr8uQhtiRu1zwXAIPaNUu?=
 =?us-ascii?Q?zHZys5YWaXTHVjsXg0765+uVb+nBVopN9JDm5ZPLQ2ITJ4CuqwaN1VI6CTZN?=
 =?us-ascii?Q?4XNO+k7iTXvPWFLX9y1m8AGYBuuHx6Qta1eno+uyecNshxapjkJ+/Xkyy+xQ?=
 =?us-ascii?Q?pK7KHah0uVX/YRAym1I1g03zB77uQbk5+3uYkbvIKdaBZWq9kokgdFtdvUe5?=
 =?us-ascii?Q?1iOcIwH6bq42buA90GabN6YpFO50xaZsgCt2Y67XZvjX6cnugvSUCtu9e6i4?=
 =?us-ascii?Q?HLocMuqb+V3IDrr277ewo41PbU98c7/mZCR/xYZbFvJO0ufUJIG1ncSn+VUD?=
 =?us-ascii?Q?+NXmW/Pdc1MamzbzUnemlbF/pkcsgGM3mT/gODQ+NlTOf285AAeufwdlcMu9?=
 =?us-ascii?Q?kohpm3+eow/QDBX6RZW2ZJ59DQZcJhyn9zFfD2bR/BUdRfWMWiO8SGm0byqn?=
 =?us-ascii?Q?/u/PCZ2FzyzMF07BNrlfEwG1eGj1paPNSkx7OVO9D0PhQo5+YurZGvTP12TX?=
 =?us-ascii?Q?Dd1CHHLIMDgqX3u7UcVRhLpzSgzxuj5gf+3QqlnGo4jzKAemtH0Luya3ociQ?=
 =?us-ascii?Q?DfTxOWKwlMd31Uo6L7Qui7MfLmTikD6LZEwzB0cLolcpYfzumi7Oac4B1Cqy?=
 =?us-ascii?Q?cNhofkokl3R1B4QKpC44aEvYlz/YARKkFVeFuQVLYSgD60cBQDnz/mQquXX+?=
 =?us-ascii?Q?Nv8YK9+CX+rysdHsnpxPJHGD7R/7u8EisOj9h5UViWR5PBJIWc+72Paa7+K/?=
 =?us-ascii?Q?0FrSCWJcfOn7SLkJq7iXUH/4QfGx0pWmAcIKcMTZCDJSXMv0cxWv8JNiUw6n?=
 =?us-ascii?Q?9GBx4GwKGIFyzK7HfZFzgJ8kOXXR9QKGbBiFcynjCu30HW1kSoG8W1DSfqFF?=
 =?us-ascii?Q?9/aHEDfJDo8chS9G7r14TOdwdGbQ4JVRGPi4yS5Z8vqa3kIjnbJ4YVdlhFDa?=
 =?us-ascii?Q?uFboSD5hkYb66XpSVEk/Vmh7BTSzBbFdXnQHtlqmY8ba80O87HdbclA0BFKt?=
 =?us-ascii?Q?KTkw4V7XRETfFNl6k14C9qJXog1QasWxOPGqx7PVvi54dkGlK8YGsyXaalwe?=
 =?us-ascii?Q?K19jKxcb70VklkeB39QXFL7bWkDQ1ZNnNQl6+4nRb2ORgK2XxusPJc6WxRvT?=
 =?us-ascii?Q?jLMg76Y2mRkA9Vh01XhKL6jUrq/ezvbGXBJxQizMocEghr2PDQfQM1d59TTF?=
 =?us-ascii?Q?bMn8hnkofJ9Q8Z3uk0mgrGEBjJd7xMi13Q9GECtmZE+q3pH20VJl/f08Z1I6?=
 =?us-ascii?Q?StORLopdUX5SxLyzaqI3G01MKyGJA8Cd0pd7H3D1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ChV2qE4r/Q+hpJ/9OzBuZdXlWCTwXk3w0pFwukOqM5icx4I7/uS3wnNNyr4IxrFbJK999G7j3RsjkxECG4mEiMFl/3dcxH+hKbi7F8k/k0X1jJOxhkZfMv/vdyJVg//hWy9QH8rn9c+kCqpgvVcKthcrDXdVTiXE1zoz9LLnZ94pGDtoi2ieKZOprVKp/pxxMVE0SFncXuhCP+sP/ux8gllkoi2N04Qun23GxxSTZq0RTYQovy6FrD50GoJbExpMZNvTK3Zh1fXewbse44VM029tcNkfKOsaSCPaUyBk1igtUjfX+71p1SnSnl4mPGTksEs6ZHYjWvkgISrFj2gOog0eahwdObyOqT3v75bfhRjH7Qjdatj1JkG4M3wM17rhXRGaXwXM1XHhMbgTCfj9um7xFuzUlmIERqTyRqfsClNRVKM+jgjQ7ZfpxT3YvDPYDWdAC3/MfaRGN7TfYjs6mUdlNRrZiPaMTVKocWewQeSl93bcBuNZdi6yb4R53mJwKeh6jPM617QegtPyJtoIhR9x6Sf9KbPr0gfZdIALQcZeLQ+92ICQ33qapWlurlYxH40cg3qkJw4ZkLXh0gOuCkTuOkijYw6Gg3KnN9MCP5Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e78c1d8-352c-47c5-a87c-08ddb3369904
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 15:48:43.4328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SV+0drRNvqSoJV09D0ihLKkhCnYruQMF/HxclGwthcEH7vvDE/EoIKGgozCUkmLrizzL9avGEheRLZPlj2FlBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7A7588508
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506240132
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEzMiBTYWx0ZWRfXwPRoCwHHI0uY A7MWgnEFMdynNFrK0TUoEPD+DoRUAH7GFjqsnRJFhuMYFK+GOmjbg0Oc4T/Ynp7TtufyppAFUdN I/pw2CoBfmAtQZz6CsGraEXZ40uPvOeAIm0qt3qZrOYovbgqVQ4hOAeiFvUJrOdRcYrujCZCr1d
 msHBrd3Z8VUK3kOeU5I4w2XRqPHMXJ6KmQ2N7NYtVAxrmn6kNNjnsDpS4yqQpgcDQNkZ2MaQfsa L0pHLgdFcpd0CGmSSXqnmbS0dwbv1DnUlO5Hza0kno+/7b6LFU62DHn9UePZutciSd0VGuF6sMU 5m0UgrNFpb3mo1uAFBLiQJ1GMTRwPJrMh0ZNo4gU5nh+KuB1Iy2g5IC/QjIBE4UKk87VU7Basfp
 Qh2pXTBdwwbdNukvli1/9X4zVj1UNbSH6FpOnv71PRPQoRsg8dHVjieVY4yffgatp2mYqh/7
X-Proofpoint-GUID: r2NhQ1Qt9zRReMxNl4RYUeOMBPKWLEJb
X-Authority-Analysis: v=2.4 cv=QNpoRhLL c=1 sm=1 tr=0 ts=685ac8df b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=yPCof4ZbAAAA:8 a=Wi3NtW8mb-oN4AeyrzMA:9 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: r2NhQ1Qt9zRReMxNl4RYUeOMBPKWLEJb

During the initial call with a maple state, an error status may be set
before a valid node is populated into the maple state node.  Subsequent
calls with the maple state may restore the state into an active state
with no node set.  This was masked by the mas_walk() always resetting
the status to ma_state and result in an extra walk in this rare
scenario.

Don't restore the state to active unless there is a value in the structs
node.  This also allows mas_walk() to be fixed to use the active state
without exposing an issue.

User visible results are marginal performance improvements when an
active state can be restored and used instead of rewalking the tree.

Stable is not Cc'ed because the existing code is stable and the
performance gains are not worth the risk.

Link: https://lore.kernel.org/all/20250611011253.19515-1-richard.weiyang@gmail.com/
Link: https://lore.kernel.org/all/20250407231354.11771-1-richard.weiyang@gmail.com/
Link: https://lore.kernel.org/all/202506191556.6bfc7b93-lkp@intel.com/
Fixes: a8091f039c1e ("maple_tree: add MAS_UNDERFLOW and MAS_OVERFLOW states")
Reported-by: Wei Yang <richard.weiyang@gmail.com>
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202506191556.6bfc7b93-lkp@intel.com
Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
---
 lib/maple_tree.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 00524e55a21e0..6b0fc6ebbe363 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -4930,7 +4930,7 @@ void *mas_walk(struct ma_state *mas)
 {
 	void *entry;
 
-	if (!mas_is_active(mas) || !mas_is_start(mas))
+	if (!mas_is_active(mas) && !mas_is_start(mas))
 		mas->status = ma_start;
 retry:
 	entry = mas_state_walk(mas);
@@ -5658,6 +5658,17 @@ int mas_expected_entries(struct ma_state *mas, unsigned long nr_entries)
 }
 EXPORT_SYMBOL_GPL(mas_expected_entries);
 
+static void mas_may_activate(struct ma_state *mas)
+{
+	if (!mas->node) {
+		mas->status = ma_start;
+	} else if (mas->index > mas->max || mas->index < mas->min) {
+		mas->status = ma_start;
+	} else {
+		mas->status = ma_active;
+	}
+}
+
 static bool mas_next_setup(struct ma_state *mas, unsigned long max,
 		void **entry)
 {
@@ -5681,11 +5692,11 @@ static bool mas_next_setup(struct ma_state *mas, unsigned long max,
 		break;
 	case ma_overflow:
 		/* Overflowed before, but the max changed */
-		mas->status = ma_active;
+		mas_may_activate(mas);
 		break;
 	case ma_underflow:
 		/* The user expects the mas to be one before where it is */
-		mas->status = ma_active;
+		mas_may_activate(mas);
 		*entry = mas_walk(mas);
 		if (*entry)
 			return true;
@@ -5806,11 +5817,11 @@ static bool mas_prev_setup(struct ma_state *mas, unsigned long min, void **entry
 		break;
 	case ma_underflow:
 		/* underflowed before but the min changed */
-		mas->status = ma_active;
+		mas_may_activate(mas);
 		break;
 	case ma_overflow:
 		/* User expects mas to be one after where it is */
-		mas->status = ma_active;
+		mas_may_activate(mas);
 		*entry = mas_walk(mas);
 		if (*entry)
 			return true;
@@ -5975,7 +5986,7 @@ static __always_inline bool mas_find_setup(struct ma_state *mas, unsigned long m
 			return true;
 		}
 
-		mas->status = ma_active;
+		mas_may_activate(mas);
 		*entry = mas_walk(mas);
 		if (*entry)
 			return true;
@@ -5984,7 +5995,7 @@ static __always_inline bool mas_find_setup(struct ma_state *mas, unsigned long m
 		if (unlikely(mas->last >= max))
 			return true;
 
-		mas->status = ma_active;
+		mas_may_activate(mas);
 		*entry = mas_walk(mas);
 		if (*entry)
 			return true;
-- 
2.47.2


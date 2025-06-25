Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A1B29B228
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845185; cv=fail; b=R3K6opXM/cJQfR7Lj9ttGw7A4wci+H6ACn7tQGsaOy8TsmvDs2mvyhpz+mibMk3SKd5Rw2OntvwNGLTPOhk+nbac40fD4o/AUt9mFp+g3Q3VNv+xG67V5+9VqBBttzQQwHHelXvcEqHVr0XieIfzj1Axxg89ksUjdHEoSSaMezU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845185; c=relaxed/simple;
	bh=fQaCIIHjxjCtM6hABQW0OXGvNIOvLzty/MB7iHJPmns=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Dg5m19g/K3Zq6aslBmB6+6eIBdN1buD0cI8trG884KgZZpKiUcWTbACLV1yEfQweOFJ2LDCCjMk9UN+cZx/1XuuJj0o3ck7XLaNxDlFXJTOZe+0t9BAmEvl5tqTS/UtA/1di4JeCb8PtcsM9LhsiCTkTv/dLWYA+IL1ziTjz8zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LF59dNmE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TLTfn/Od; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LF59dNmE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TLTfn/Od"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P7fhoS012086;
	Wed, 25 Jun 2025 09:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=PXVpD07UbVB3KDuW
	tc44hkSZJMRsjy88PCk7aMTFHKI=; b=LF59dNmE7xCqM05XF/xNt2SeswAFvNOY
	k3EFIeM5A8SxGtSMxw0mbPNLymWTHD/Xk20zaxrNGbtN2orxiP7V5SDBMgchz2er
	fCswsiDKQECQvnN+TrJYLp60LD2EOxnEU7DdrJ3poA8/1suvIt3gyBoTqWRDGZDf
	hEZ/RcnAi5dzEoyaEEOlyVjJF/Y0Gc3JWzYPl12xmdaL2XdhlMfhHrt9Rsc6IzRn
	LJ5pOM2Mxk1AjDvlX7pkPH4XxNh9hAtdMljwcwAtBuQVwm3yNrYA/yvllnoT8Jzn
	Sq56TLTv4CKSms7uBpaz0kEu1Cl2cV5xIDiiezcU3IuUVBtgnB0/HQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y73eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 09:52:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P8u9xE031390;
	Wed, 25 Jun 2025 09:52:44 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehprbr68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 09:52:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4tEaYzG7MvENtzOQgMU1cYOJLQuEfj1I1/W8rhu7dEgnR3dlmcFzm9hvsKB3mgOmuybrACUPAn8cPdriuXFClGw8Si7cOp16rUgwglBwKyw7f2vrPkqH4DP8iM3u5BxEZ/ttScDVgvGa1IOoGHb4RZlQGRWIeoWu3UQbAjyLrRSswAHHvP1+cUgWZN50b20Z98BmDZ90rFxTCNsfD6/8ybd261TUvKgiybyo9kbKDBjlqR/dgXZ8G3EFA6RLE66Af3XAyWMPrl4TJ0gd/2tDNRt0TCNYYuUFlg6wr49gQPVWd+1rrxRR/06zgugaO572j0ZiP2RgaXfe+MlMirY/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXVpD07UbVB3KDuWtc44hkSZJMRsjy88PCk7aMTFHKI=;
 b=wLhU4mdqtkCMUOVOqMTg4khQhG0u4kmfxiG/tw1/vvJnFfIuRDoBJnmvu4VXwUQuam6lnIvb2/jWqaym0CvM+2IG+16y/ua4Qp/Ovnw5iN8hd7mHqdvErrRkCDzvpIzHRxFOgUzSHAkAJ/NHWaLd2pF7geuoX9TbB3TxthwolkWUcLabQZdFll5ulbhcXbmCrwRpU5CiKaa2H+tl4hh8373ooqiDD4R9xhr0WQGs8K6sJ+GnRGlmymQoxOGphpIAzsdW/p+eYNxA+GsyKqYkc4IbjpCSCbXutDKW5+N1EjLqObSseHasedm3JhTe7xZII2hMiGHbRtqI5+hg9x7YmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXVpD07UbVB3KDuWtc44hkSZJMRsjy88PCk7aMTFHKI=;
 b=TLTfn/OdgTekDtUGHszFN1FsudgCEk2HmFLqd8ZaYyn/gJSW6CAJZUHNjICnRKDfaOy1P9PhVufdQ8IAEc12Uv6VjhiH5zrWWPA7cikGTZUfap5wlYRLRQ7Z1vP9Iun4r0IP8D4CgFReqoZFyiclCC5nKewDaasQ0NyvYXKdiH0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW4PR10MB5677.namprd10.prod.outlook.com (2603:10b6:303:18e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 09:52:41 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 09:52:41 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add myself as THP co-maintainer
Date: Wed, 25 Jun 2025 10:52:31 +0100
Message-ID: <20250625095231.42874-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0356.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::32) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW4PR10MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: dfdd4c48-6966-4731-a01b-08ddb3ce06be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UNVW7qvoQXLc6hd87GRkwQ3MUvU/qHaMc2TO/a1J3vAsHjz948K7YhFERqxH?=
 =?us-ascii?Q?CP0QmBktGkrNwq84h8InJSxoFesTrnJI5Ljnb7BknUG3/ne9Uw+9C7flHsJu?=
 =?us-ascii?Q?wB9cCsjQn10g7LsUCbRoAa8wekv+kb4g3Rsso5QX3QHQr5rZA8UODgxZa5jr?=
 =?us-ascii?Q?g1UEGnddPTLzpymtzB73UlazPM/W4Dt/I8CRaRvQYzK2TnwTJgRulpwwVPQz?=
 =?us-ascii?Q?1SKBvjeWLwjIa0FRflfgs5U/krqkamauHWDaczTSVt2vkWAfKRs5FAen7l3w?=
 =?us-ascii?Q?zbuGvx3NAh53Bqnurt3rQw/okSo7vZ6ctAKf3JdfUvFjTGHKnc/AzNumeha+?=
 =?us-ascii?Q?IZhPHtHINpVDazRVstt6pZ9RyH37gsB3iU5M82c+rmCDMS/xS2Cpcblb0VGp?=
 =?us-ascii?Q?OE2WTfrG3Fck69q9b6kTqc+IgHTAAzECqjsPVvieMkr8alUN+LFoKLiWQSDL?=
 =?us-ascii?Q?llpITgz7JOjooPYBKYsTeZU2O2o69L5AnIN7cD1OrJlT8N/czpVsRXGF9wSJ?=
 =?us-ascii?Q?F5XA0YgMRQyGDOO2Hwrit91dpTzwYykg9S4nHufb1Ovw2/LFXPZv38sXSMIt?=
 =?us-ascii?Q?X8EJCWH0bNZXQ20VvWYJsiePCb7fipVmid+52caI3k2sSBiyGq7hpuyv5eJO?=
 =?us-ascii?Q?I71beYMVAvk3E0SFceqNjt4COJvflEmq9TViK95bTXvuu7c3SxGdxMX6bZYX?=
 =?us-ascii?Q?gqBklemWGzlJiN3BMZ9nP5pe+g265/gxmgnQwbp2rbDdq5N/4ySIzB+Bn4uu?=
 =?us-ascii?Q?10K1CBuodCrm+Fnk6rfjlEV0P/vipUv+0XG/L0PFx6+WIyXFG9SoskvlyOGF?=
 =?us-ascii?Q?4vK8ZWbKFpY4f66RHlJfJY83LDIsJah4eijja25c3VZjdQrg+0G5R3lbXDW2?=
 =?us-ascii?Q?apkT9gHDnsHhaMADrETH0vNBh0Wm5N0OdHHI+N8aOnxy3wmdXmh/qoLsYRSr?=
 =?us-ascii?Q?+5lpEOIqrQQ+ndlaxXvk/3No37U3IRkBizH9bUMBhZ48DQM4JbDPTLhuUSCL?=
 =?us-ascii?Q?+ZtJPqhoRSSE6Iw/tqmj/GbyTfqTESPRI3xV+hniYG/DLMkVR1UCeGDWRKyW?=
 =?us-ascii?Q?PQt30Yw0E1gMldTQLs2HpJZZXuKrBBK9yRFmQi6P0ojkRT0uG5lfLdihV3yS?=
 =?us-ascii?Q?OduVx0yxuXznowrbttDpiZdlPFkeH67H+1YRK7hW8Y0APnzxxFaXqYNHp8Cc?=
 =?us-ascii?Q?H+9Qs0Fft0LPSaYMypD3W/3INS3c3H/mzIyYXVy17FbFM04sl0B0XJqRlSFw?=
 =?us-ascii?Q?tsvXsog7LRSqASicPw7tnzroamcAjvjvfEHgdjLdOekfdCaaJVQyFiX0axpL?=
 =?us-ascii?Q?RKRhMF9hu6CKheWS7hvLOiDAhDeFEaJSDutz2xt6Q4oUrIcKoex8LDCJtBdM?=
 =?us-ascii?Q?De3dqgJpwjU6ABF5opw0iaLJiuMRLvMWgBvL9hEW3pSIZTZcV2sVSxm5/uUH?=
 =?us-ascii?Q?tx2/6oRTwp4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W1XFRn1LYJNBwa7Gfbchnn7r46LLv7TRppWsmad19JDjE2rcMI/hsbSCpUAs?=
 =?us-ascii?Q?lUA5K7zwkH+Unm6NEO7nLtazdrhaBzygL08WbMSKg7CSyaHRvf95NGqAkvTB?=
 =?us-ascii?Q?nHzN30Hz7viZKvXDXqwzIA0dpGNK/UkTQP10UUhkVJyZ5vExdUeejB4k4m/T?=
 =?us-ascii?Q?YXcwN0Uio5qCM2uCQeqT9vukMBKu4juZOzrZlJWll99lceVL1aPdky5J01xX?=
 =?us-ascii?Q?Rypw9AIQ15m41cAGw5KF9aWrfGNrb6PMr+HvwHmV8FTiwTdJdlyjCvaG4SUM?=
 =?us-ascii?Q?8a6WS6Qxfl22tdZR8Sbud34jih27ToqkaApavnm2fYyoHu3trdMhzGTM7TVT?=
 =?us-ascii?Q?sxf97DmEJEYpS03ibAsQfa+L6HHMM/skQnDt20pmmR1cgRoVZyUADRC/mXLA?=
 =?us-ascii?Q?Y/2frncEaC20FgE2WwYZ9015EQu6JYltgaFdvNXyGy1hrxxrmYDf+lHA3ZgK?=
 =?us-ascii?Q?r3pp8EsoHMH8iW3pMHivIjTnEi9B7+1dd8D9QLBWooVyo0Cc7IO3JdGzb+zf?=
 =?us-ascii?Q?zGNT7GuKsYmb61/nuYP3HdG00FGE3aSrLJ0tsA/D9CniQAH8jQsiqDQsUeli?=
 =?us-ascii?Q?DvPDmfkRXx7X+6N0Se9W+rV3fu/HGsGZIsxwkNVsTtpSUQ+HFct86bORLxcg?=
 =?us-ascii?Q?w/xmsQQCeetlsXUi673XXiU0GhsYVDFpvjFQ2NvLvcUl0m2Pbwjs6Qx98VPV?=
 =?us-ascii?Q?Xfb8gyZhv80uPiNgWrJ6DQx+MbTjJi4+TpwdE2enGM9XNp24HcubtRLGAKE9?=
 =?us-ascii?Q?2WyMp2iaEa2j2jPtJeROjtC/h41LiC0JAyIsmNyJBklToH15E0aXsF9ZFFiB?=
 =?us-ascii?Q?TrtU/pR7rBzsJGAgR6uvTb53knr5KO02dwOlBeO9ilnqMrSPEHGc6QXUTzvh?=
 =?us-ascii?Q?iHIHldyfdiUKKkzeHpj0eZYxMpQt9EDozPiyvNqEkJ8pLbbae8UCdu4kcIe1?=
 =?us-ascii?Q?NCQV38+d/xlxz2Bzp88XYWrXvgkl352VlkFwOFKZSvFE7sITKEhUCicP3bBk?=
 =?us-ascii?Q?KXA35J1DBhCl6aUe7jfesLgoljb8oOHrCcA5ocnKvYOvdkz8TCwyQRIBcuP1?=
 =?us-ascii?Q?1zHkLHz2lN2r71+7lJiJRvlHTZ4aDuhBjE/b6Jpg4eJVGhlgNGEDuPL8c1ba?=
 =?us-ascii?Q?ndnldK55WW3ayg2anwzyni2tH2zQZLkX/9e2ofN9CZ925UQ8R6RGxAtBTVAO?=
 =?us-ascii?Q?MILRgtZATeXiero7sxWD94Nc0wZFfaQ4hY2vcsLdS7WsDlz7sG+ARcXFFvu4?=
 =?us-ascii?Q?qHF6q0YxSKOWDae4HOxY1bIBtuzTCJlv3Ysv7d1ztgCc7UjXAp+R+Y6S0wg9?=
 =?us-ascii?Q?hVZkkGPuVxaId16bmtki24TANzK8YOvfqs1vK6ktcQzVQOBvIFsBIPZ2aXzW?=
 =?us-ascii?Q?IQfOsXMbXfGEEmR7goQqHOcCnd+eqTyfDUM1PXyL0mWvfLkFaKQ/LSrEFEkR?=
 =?us-ascii?Q?oFy+jXmsPUKMWCuCTKhy0npeIitDgGzr+t34BmktoaSzLOzpLKEOMbFCHA2x?=
 =?us-ascii?Q?gGZ6yeq/MaWWh6dw+MV0ncnEePRTCYuCPC58r3mrlFO6tc33I1MK0fnMCerP?=
 =?us-ascii?Q?vR0QUOJE/S6RVV95WbVS4UdCBpvZ1ZtRfSEwNNYJDFSr5FvvMSnq/016UeYA?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2TlFQO00DRTRoZPYTmk1bqIs9EWZbp6gXp4YGgVwEwGZBI4fJTfkdZYVMvvjXVmB3kB3CLZUXJ63ZWsR5t43sc8BXl7FfUtje18P9CHnf8PcCH4B7RyHOrNwPD8pBxHcnN5zS6aCwnYQbX90NJfS4c6ebYMf66B2bQ2+nNcmUatvNTT9PaYRIfb6vn4o4yTsu4yE+2PHeLkmVpGQRqzqcXg+YOfuRnAiL2B5j9AHspXfjEHZsUEoTsYvEgnXwMl2Byrz8Vq20kJLa9r3MtA661MPMuglT7dvDWSAG2JB7TOmNw9sdPNkv5JCFKUwii/ycAbUaLSmoBCfpYqPUm6UxsdpFiCcPc+RFqHBwIEJDxEotCkxcnq1eEKw5BFdR7apfSMIwipzalx92zBCmc6Qs6Sy8yeNZ37/g5GU0n40MmWqft3g1tezjnWIBy4BAa7JSpQ0tHFBbAcbojuBJeihE5adr96z8ayujUSGlADX1zljCx9OiqGRUVqFvv1Hv5wLSObbaA64W3YvXNmxzcMNYEUUCfGn2yOxI3oKLbfL5VKmlok+7GnJvdV7yYcGh5GM1bNwqHYoLWl2Hmt/U66afE26ykqOAwEV1eSNdX4QU0U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdd4c48-6966-4731-a01b-08ddb3ce06be
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 09:52:41.5008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAWMOeRUe7wFCcF/Mwovk0ixOpMQ23LqElvH2Cv4bmZ0GOTbVoJitN714LVjDywqJ9yjJXi5GzYEIjx5ol16GDRkH1cRbGaDiM6uPuvknoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5677
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250073
X-Proofpoint-ORIG-GUID: 3Lb1jGSyGEJ-qNR4T3qulAiDcIs5EW8N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3MyBTYWx0ZWRfX2pMmcBa5UKkO fi37gomCa4JU4Tt9ye+hPkwc934+49pOdg2JORHaKS192m9LEwkLOqJNU9EKHUmu3vA8svu3kZz tADPmY14kEfclvev0D+DT6nsDNQj46/59ev9pDc1j5ybTlmaP0SwB7yCKGZzAexyQCHpXJ00kt1
 idAIh1C27PXAwxglhYdMSMBKgZJ93ftRp5FIwGdHj6VZPV8kWIdJ9a7zJO4m/OyG7Djy4M6Zthc sinm3BWdx63ngCakVqX9cW2NcDPLZKeJLDYd0ZM0jA3KVbJTLdclxG9Q6enrs+txqv4XBKLwHYK fw3n/T9ZZzybwydR2yc8N1mCZznougid4eN02IGKgMDVNMw9SGY7dPvt6rV8v0NOzoIpyGBDWEZ
 pWeGMePgkDeF+79UfjcbtPNOC9Tm+nhjjLJi+nPz0NFULmJMVvki+xcbiHh6lPRdlVaTvj8F
X-Proofpoint-GUID: 3Lb1jGSyGEJ-qNR4T3qulAiDcIs5EW8N
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=685bc6ed cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=SRrdq9N9AAAA:8 a=7CQSdrXTAAAA:8 a=yUJy9A55FvRqm4sKtxYA:9 a=HkZW87K1Qel5hWWM3VKY:22
 a=a-qgeE7W1pNrGK8U0ZQC:22

I am doing a great deal of review and getting ever more involved in THP
with intent to do more so in future also, so add myself as co-maintainer to
help David with workload.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b9a4fa905e1..a8a963e530a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15945,9 +15945,9 @@ F:	mm/swapfile.c
 MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	David Hildenbrand <david@redhat.com>
+M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
 R:	Zi Yan <ziy@nvidia.com>
 R:	Baolin Wang <baolin.wang@linux.alibaba.com>
-R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
 R:	Liam R. Howlett <Liam.Howlett@oracle.com>
 R:	Nico Pache <npache@redhat.com>
 R:	Ryan Roberts <ryan.roberts@arm.com>
--
2.50.0

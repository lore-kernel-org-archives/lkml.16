Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAF12F50;
	Mon,  2 Jun 2025 21:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748898464; cv=fail; b=VF4AQ2xif/MFUN3k1IZdE1tABq7yvFbVoOhADXrafT4C8lXWhZYG+vGOKUH34MIe5J/a9aWQGwJAJky2BRpXvwlaj1qu8g+KpTfp2Kv23umZoOZHGijOH5O6rbxV914vDKOf9aXyAkfh58CSPh5zAMrEEpMIY3wMg7DjUM18GF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748898464; c=relaxed/simple;
	bh=DGOiMvZ2nlGHi/eDZLGQeOe2ES6Jbj8DLDPq0RIDjrA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Ry1Rlp0W8mikhHRKTtLjjABA1gXh/NJ6N9OPfnQWklHnGkhNUyaPiiJOhfwNhUBr7lRVu6X3jrnqXcIN6+hmUQSF03+9pqXw6q2GApMsVxIph48Ce/RWVKcPsm2xdEzOwDu7lg+4Rm0Mb0apH2wgG/k4os3KgcrdcHwrlyhTJ9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HkLPMgxa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Jew+rvIk; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HkLPMgxa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Jew+rvIk"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552Ju2VA023838;
	Mon, 2 Jun 2025 21:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=jxu6Zo2tQSfjvOgK
	Om+WK1Ymec7mTnfkczKCnMI9PCg=; b=HkLPMgxa6Y59w3zeKZ3QdMQztg/c/MGn
	tMknKGZDIFhNQfrXDpvSxU4vvodPYcSUn4wWuqylj8tcQ2BCMNebdJkG+YU58HbF
	NHwiQSDTmSLBOY2JAwDmB25+Y4SQMYRU2Yt6BWpW4bfe7JLopcPb/ACQuNwS8B6+
	9AOFo46bwkAjsQ88pnq8OWhGfneJulGrG+sB5wWuq8SPvXX3sGj1NDSg3koMW2uB
	uVp+HmAwIOibtY85Kyl1lQT9rYskyEWfm66oGj0gfdnd59ToRQTrhGO6v98MTHGl
	vri0JVU9ma7QekBdNRFaUjRsHSvo9nZ07zWRurzDtBOtoPI7H1kkew==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8k8f87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 21:07:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 552KmdON040644;
	Mon, 2 Jun 2025 21:07:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr78r7v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 21:07:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9iGEGE0jNblkO6/qQTzQWNoMb6Q2So10BFuk2i//cp+Jdozq9HJWiZ/0F6OKDN4H6A+e/3diz9ekzkuz7D7qeErGnmS9H1gr2XOiZTfk9zCsRuU/nTzFOfb55QS8f7dCrhy9Pvxoq7StuUdY7KeaAq/LWUEWriWN7DThTaGuPAz/26878i4jcXc0bQ+ckf3tcoPV4mH89Nff4EUtpPJnIf8G2sDzkl93F56VjEQpYXyqGEf8rQRj36JESHOMjUstgeLATMuXuejvUuimEY0liSj6eg2Tc5LBhTnSBjfvYOq3+MF/P01IZtpFTS2q3RRCC0OPuy3Ngd70zTv/I/WUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxu6Zo2tQSfjvOgKOm+WK1Ymec7mTnfkczKCnMI9PCg=;
 b=xy28WsR6tt8oJbNNp6MhlnB2bAdeRjN1/cLY894l43clcKa5QgTX4osCQoY+4UFkgFwKskh8pTuerhXchaL+BaHqGWp13QXLdjeoSl2MRwrolN9m+vkEOlMYo984NHt/jzrIY5MjsXYm05QBP3C5+/FjVNfPElRqgBH+joAayrzQr0Gq9PRFgz8NoO4PAj882MBdgaAw8sNG3aeAw8qr1ZTMr/9hMCRW3EbogQlOwstE81jUmZTUylZtJ58Xs/kMyZIIfv+n/HzmqNhz5bCFt+LHJmsnYregAWLTVXdNBWtrWJok6ya6J8Vjjo86mEwbWLwfMsPmct6SSd9ELboIZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxu6Zo2tQSfjvOgKOm+WK1Ymec7mTnfkczKCnMI9PCg=;
 b=Jew+rvIkXu9GcsVxLA/Dg0VEOz1Q+jA/QJxK3veHHY842YWJvZ7q0aUEvxZRd1CVlLD8fXth/2EL6n80Tp6hQvvGmMEj6gIxQL3UKwxVu1py3fPj+7sUbS710bTCRL8cwrw0ZawDSInBMUY4f+C7mrb//zlokCsA3pvkiwlbGDc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB6590.namprd10.prod.outlook.com (2603:10b6:806:2bc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Mon, 2 Jun
 2025 21:07:16 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 21:07:16 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Jonathan Corbet <corbet@lwn.net>, Jann Horn <jannh@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs/mm: expand vma doc to highlight pte freeing, non-vma traversal
Date: Mon,  2 Jun 2025 22:07:10 +0100
Message-ID: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0350.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::26) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB6590:EE_
X-MS-Office365-Filtering-Correlation-Id: 28440d3c-f22e-47d4-7d39-08dda219742f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aqZhqFrhMoy9C2mr52x3hIJ3I8NiBWsxUFeI2QWJgS2bnwmWsH3iOmyCs/HJ?=
 =?us-ascii?Q?eBySkIXZNzuRTit5LPqVM+uUImCemXBHlAj2hC3rFuHoj3W967mAC78YyOf7?=
 =?us-ascii?Q?NJ4RxuLwcDXq6u+/bj4dzxH7rL4u0iJdM1XngBH3N9xAwoB0Zs0JY1nj8CTS?=
 =?us-ascii?Q?XeDxTuZ1SYN28NHSGt+VD+H6dA6hgw2Y92LO9fhldEID+Sa269MCp/+0035n?=
 =?us-ascii?Q?MVj8tqcRX2HF2aEjLa7T1WtAkABRcDxOSj+YUrseNVlwKg8i1riXVo3QLTuH?=
 =?us-ascii?Q?OqTN0F6u/XV5bSQu1kts/gsSE5MxQF8Jgue6wRkXCdcg/NAhr6UdzblMSXR/?=
 =?us-ascii?Q?rz4qpFecsJKSymHH17JNJBm5IcD+HTaod2rLBs2P7nLJwLkB5UwBqnccvKWd?=
 =?us-ascii?Q?7jVU40/OeNp3yd6FbTfes8auNZeNs6G3yk59lDlk1EH0Sm3scJ9LpXF3loh8?=
 =?us-ascii?Q?z06rCL8JU6IO7mh4KN2iqGKcKnJoIT+OPKZFnOke2eCoD+7uDmZCOF3jTRyH?=
 =?us-ascii?Q?9lfplasq+RY0OMZZBiZoSg2xDhUpdikyctsLm617XX6IiPuTLgHblKUk3dlY?=
 =?us-ascii?Q?HEBYFigauiB8JtQpIXxIqhskF9Nj5c4ERO2t25VQPpXdG9c7Ub9QA0O/wkOz?=
 =?us-ascii?Q?5zzuSR0z6IocC+eTxqnfBFai3Js1Gxr3/wSs6TJvU7R8XqzgAe9gVL+TeOTZ?=
 =?us-ascii?Q?6hcH8oYJr2adqdql/gDbocwNu1dViA01VRbBkZXYkuPdpZkhlSZHtfNYNGoV?=
 =?us-ascii?Q?p5LDI/mGuxR8+XWr0M60wdMQnrio2Sd9xt8mlLr/UZSlnoLUhUpe08KaWboI?=
 =?us-ascii?Q?I/NKatbDjZfVRhxPeTh1QUQxoTbd6WwiafIWv18oK21LquWDpYX7n2WkseJY?=
 =?us-ascii?Q?ycUu8Lvc8qi7ce7/VtgqawPTmB6ihlivGJ73xH6F1KTaau4eMgK1QuHXoGU2?=
 =?us-ascii?Q?iQmr++9KLrWAa/JDvlBRKYWn66D7sQr14tGmDZJqAP6CSYXyoQG4MadVqhZO?=
 =?us-ascii?Q?gigR4CZ76c0eWGdBCoeuG2QgApSa7f17YRI2JJKsLft/Yv96aCgI2fRYerV/?=
 =?us-ascii?Q?gwpcROR6KMsVPAQgV6Thoe1QExNowh/eXrxagOCKnhQlXoU3lgFnvE5knDpx?=
 =?us-ascii?Q?CNGpZFN2d2Z6RX6RP4OTcT99PRtxjzNlGBCp1gky3yKPXPNK4KvKxfjWM715?=
 =?us-ascii?Q?lYW967Np1l1dUoQyglMip2nxEqseMoc09XbkwekYlJ49LJc16J56oTqKhy0K?=
 =?us-ascii?Q?LGOe1UElsL3B8/8s0alucCIDn5tAanO46dLa2FUpCmAf6/0qQ+5zEHajfv2W?=
 =?us-ascii?Q?llRXfRrTS7Hw6AUGfL7HVaykJS2xqYGw0HbWLpli0d2U7FcuWa9msaM/uBII?=
 =?us-ascii?Q?6KvPWlwpkC+2RKKWKRjqPn+/xTWtVLJPkVoFaCtBLTQqAVlBYVyUZgFQZ4b4?=
 =?us-ascii?Q?AFFpkJ8UJ4U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RVV68EBJuLbjeIJ3ar1c+USINYFgu9TtzI12amuVYBYs3qMjLSvgCtaXXXi4?=
 =?us-ascii?Q?kJ/8e+TiqLd9fFggO+4RniDFeXXF4FpwIVNgoQUFvia3WnlE+asNgURe8YMx?=
 =?us-ascii?Q?JPeKQfab9h9YmibWBHpudMWDCLnM4vLZoMkbTCv81/7tXHnrWHO9jhf1IdfG?=
 =?us-ascii?Q?gBHkAlD+SjK67eVs7EPyuQfUDv4DOygctU+0Z79ofThVi0tDf8OuqOfRwZ0A?=
 =?us-ascii?Q?WcVbT3Xwyg1aT3/L3MkiiONBBLe15ANNfKlG+YpTE7PDuq2fmTcDxPqZ7dgh?=
 =?us-ascii?Q?xScRF6WtrPf2SKtX3k44kqf44b5rHNlxX6PZOx+5bdvnYUwwhLP0PmHOQyJL?=
 =?us-ascii?Q?aRzwS/yIEOjinO8AFSZiL2clIsiUhl6Z09P7BJ4N33N0d1LRFzYqEUe7cl2p?=
 =?us-ascii?Q?OY7hcjL9Tzscb5Q/yirS2ZlrDUFMYUHCGKo+8o4Wv5rUteGQbh/09JPAwvgn?=
 =?us-ascii?Q?/bSLA/FFVBS7cawlvLPrL6EqBX+/tgTsfylNaHU26vq6+T8sATUsdpzUi6jD?=
 =?us-ascii?Q?8pdGoOSA5UCBjHuZKMTm4/oYfiLA2aZcAysxUevscNNHVxafrp6DOGdpoOx2?=
 =?us-ascii?Q?ztuj4XCxzbCpOHAJ3HFwNHRqm6WmHbaSu+JczZC6kHZBW3AjEIwJIoj0Aju2?=
 =?us-ascii?Q?2Hv9xz6MtKonph3lJXa7tiepXjozgqwq7OAbwfDfUt7J17I9/NKVZu+YLyd7?=
 =?us-ascii?Q?ryHlJzkteZX3S7EintNA0vLNdrH3UxBjbPmoYSzV0cycfsixmPlkMyBQNcyC?=
 =?us-ascii?Q?15WrRcH/899JuNxA22YpcpGsD2WKU5SN4Jah3deYWu0eHQcbfF+gT22qARaU?=
 =?us-ascii?Q?ccZvWFdh9IeTb9B0tOf5S++JZfkHBOzPhR+gZdOfo3eZxMIIjM6dMGmFmbRW?=
 =?us-ascii?Q?FfYv817jceBaICbG3Cb40MHbgCwnYKrddbjJ/hxAHnNxXoaFZCCmr2QeD1yc?=
 =?us-ascii?Q?hOM9p0Dlbaj+Sy8C3tBraUVcxKPZv9yUFAbEblIJZTsvlh1RHJo4SenDO5/9?=
 =?us-ascii?Q?gXhtdJwXndoyBbmxZOyKNEODNLdMtWCIZ5us8RdGIN93KT/ZQqzrucU9blSN?=
 =?us-ascii?Q?uC9yPz/NW5Hd8VUn1KYVGnGj/BKDnGKVr4VYHm3wYxEhedVpmlLFm9lv/yi8?=
 =?us-ascii?Q?RdD5kxEPPfY69yxi3TdlrrYVQuyN4RbKCa7zUA/BtE52DNqTRZbUF706h2C7?=
 =?us-ascii?Q?etNAsM+GCM4+WCjJRxWvIeR9x5rnbHGcznDV9ZLAaocG+tU13FY9Xx9uL6lI?=
 =?us-ascii?Q?Snzjv0xJS+xq3pjTHJsRHnyNx5OFLlh6JB3vNx2+9Gz2gejwkRE2+Nwnm45E?=
 =?us-ascii?Q?RUPoA5s1BqB7vRzeNovrhyClpTHAN19BBwUetuIkb6gf4xE2v99+wtLD4GK9?=
 =?us-ascii?Q?XMhR5SNPClcAR71X1Sl/gbsQsyaVz17n3Nu5REaVcQCUKJrFALfbuwSbKikV?=
 =?us-ascii?Q?QjWL14eckyzM62IaHm5FyzckgvFfpInHAZS0DcA1YWqadfY+qLsSBRLCuJcd?=
 =?us-ascii?Q?oR0jIw3nDt6k90IvyIWJS1uD+nMFVLv5evm4s4/RpxSSj9FEo6P7ai8410DY?=
 =?us-ascii?Q?u8YoeRyemncfjzfP+esqg79uKkFYYejdSuseTGgkrqCNJY6I99rAwwIGVyuz?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9ZNyPV8GDOJO/yn6UyVw15oAHsf6d/cA/fX0gs9Oml/fbLY+NBU4fJzeOtnokpR9ZolfUHmv9PhrwGrlF5RUR+3il//224+S8iR3gBS/gDzat+4hAkKPNHwpm9f6trmKM9UPTxsuYXHE254e7UkNEWhiXKjVnpuvCgqNOVMxBA92MqjlkTY8XWg9fEj0JZhxHurgOQYB5hFEVEoIUwqDGbsoA6KDrvNEcOM0zKxaLK6oq2PSa78VCFhJo1wtbTW5WmzZYQuNdxckG4v/XoH9pvIaYSQrELsgrIQIShrH1UtdtSxh7lzKtgXmtwhSGE5GpYwR9QKLdbYoDXC3JBw/cFv0ytkVGohUFPiYnr22d3hWrgQYOLEyFOTaazSxdBxY2oUadWn+hJuvoFvQKyILhfuZAVpgFV4G9HAg9d89A6oRCQHTon6zNrwlECOvhy1goaBjIob366sLJdoPAjplW+UwMLnz7sy6xzpQuNIjeLON0nkiNRKBG+jBmaBj1Z4EUNTUEfl1znN7fjmx/VSPTPcSoQaPBloavKoSLR6cUNFLEzT006S8zK/uE8pNr48JhrrdkCpGWslGWnhvENF+q1luuBx/ZGuw36rrliiQTwc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28440d3c-f22e-47d4-7d39-08dda219742f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 21:07:16.4838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZQEkkUVzh7ojytVGy3lpkGdY+fzbSKGR3e1x+ea4rCJ37yQXwswbLTTjbELTqMoW7Ux7fBG8EC9VFjOao8FR3yRFCbYzPixurgiw5O3pH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6590
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_07,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506020174
X-Proofpoint-GUID: 7lkYDzw2nLw3mUq7cyw61Pb__EroDOVN
X-Proofpoint-ORIG-GUID: 7lkYDzw2nLw3mUq7cyw61Pb__EroDOVN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDE3MyBTYWx0ZWRfX+cjH9JT1uRlT aOaYLa24ERsGSfiYbXmGNBFPKkAJGLVOOCWArvaCII1G3BCtfnlz4gMmcgusmSJgw2hqLKKrCOf zRF4vKqgvXkthL4WqgU0LBpC+MDiR0Z7JdOfv2VG0WWgp7G+CTNZZfHpgMYejj9Xp8ah87dv6+Z
 PkmG/+uc7CbkQOznPVPnrDmzFnqqqTd0nOGoT6HDmv2peURMnfFjBUCWK5fBcVlR+lqGVLn77SE 8mCLBzr+ib9jfmXIyEDjxgGHntMka+hu3sMFQhoyZ98ukk5tcMKV5P8MpvnNoPJHfeC2uzImlOp stwOk0/ZM/47+wqFcPQ7sYIubR1+JxjQ6QV676Q7XLyRfL+U3xnLp7qPn6nqYzVeGWuF59MaxIk
 8uSU+0KK5utwtFsVGugCV/UH9VY8ee3f/iFUlmB2VfOJiUALoL1jssJfDW9SSttugD3rkIPS
X-Authority-Analysis: v=2.4 cv=FM4bx/os c=1 sm=1 tr=0 ts=683e1287 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=brj9Pt4pMQsRI3ToJi4A:9 cc=ntf awl=host:13206

The process addresses documentation already contains a great deal of
information about mmap/VMA locking and page table traversal and
manipulation.

However it waves it hands about non-VMA traversal. Add a section for this
and explain the caveats around this kind of traversal.

Additionally, commit 6375e95f381e ("mm: pgtable: reclaim empty PTE page in
madvise(MADV_DONTNEED)") caused zapping to also free empty PTE page
tables. Highlight this and reference how this impacts ptdump non-VMA
traversal of userland mappings.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 Documentation/mm/process_addrs.rst | 58 ++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
index e6756e78b476..83166c2b47dc 100644
--- a/Documentation/mm/process_addrs.rst
+++ b/Documentation/mm/process_addrs.rst
@@ -303,7 +303,9 @@ There are four key operations typically performed on page tables:
 1. **Traversing** page tables - Simply reading page tables in order to traverse
    them. This only requires that the VMA is kept stable, so a lock which
    establishes this suffices for traversal (there are also lockless variants
-   which eliminate even this requirement, such as :c:func:`!gup_fast`).
+   which eliminate even this requirement, such as :c:func:`!gup_fast`). There is
+   also a special case of page table traversal for non-VMA regions which we
+   consider separately below.
 2. **Installing** page table mappings - Whether creating a new mapping or
    modifying an existing one in such a way as to change its identity. This
    requires that the VMA is kept stable via an mmap or VMA lock (explicitly not
@@ -335,15 +337,14 @@ ahead and perform these operations on page tables (though internally, kernel
 operations that perform writes also acquire internal page table locks to
 serialise - see the page table implementation detail section for more details).
 
+.. note:: Since v6.14 and commit 6375e95f381e ("mm: pgtable: reclaim empty PTE
+          page in madvise (MADV_DONTNEED)"), we now also free empty PTE tables
+          on zap. This does not change zapping locking requirements.
+
 When **installing** page table entries, the mmap or VMA lock must be held to
 keep the VMA stable. We explore why this is in the page table locking details
 section below.
 
-.. warning:: Page tables are normally only traversed in regions covered by VMAs.
-             If you want to traverse page tables in areas that might not be
-             covered by VMAs, heavier locking is required.
-             See :c:func:`!walk_page_range_novma` for details.
-
 **Freeing** page tables is an entirely internal memory management operation and
 has special requirements (see the page freeing section below for more details).
 
@@ -355,6 +356,47 @@ has special requirements (see the page freeing section below for more details).
              from the reverse mappings, but no other VMAs can be permitted to be
              accessible and span the specified range.
 
+Traversing non-VMA page tables
+------------------------------
+
+We've focused above on traversal of page tables belonging to VMAs. It is also
+possible to traverse page tables which are not represented by VMAs.
+
+Primarily this is used to traverse kernel page table mappings. In which case one
+must hold an mmap **read** lock on the :c:macro:`!init_mm` kernel instantiation
+of the :c:struct:`!struct mm_struct` metadata object, as performed in
+:c:func:`walk_page_range_novma`.
+
+This is generally sufficient to preclude other page table walkers (excluding
+vmalloc regions and memory hot plug) as the intermediate kernel page tables are
+not usually freed.
+
+For cases where they might be then the caller has to acquire the appropriate
+additional locks.
+
+The truly unusual case is the traversal of non-VMA ranges in **userland**
+ranges.
+
+This has only one user - the general page table dumping logic (implemented in
+:c:macro:`!mm/ptdump.c`) - which seeks to expose all mappings for debug purposes
+even if they are highly unusual (possibly architecture-specific) and are not
+backed by a VMA.
+
+We must take great care in this case, as the :c:func:`!munmap` implementation
+detaches VMAs under an mmap write lock before tearing down page tables under a
+downgraded mmap read lock.
+
+This means such an operation could race with this, and thus an mmap **write**
+lock is required.
+
+.. warning:: A racing zap operation is problematic if it is performed without an
+	     exclusive lock held - since v6.14 and commit 6375e95f381e PTEs may
+	     be freed upon zap, so if this occurs the traversal might encounter
+	     the same issue seen due to :c:func:`!munmap`'s use of a downgraded
+	     mmap lock.
+
+	     In this instance, additional appropriate locking is required.
+
 Lock ordering
 -------------
 
@@ -461,6 +503,10 @@ Locking Implementation Details
 Page table locking details
 --------------------------
 
+.. note:: This section explores page table locking requirements for page tables
+          encompassed by a VMA. See the above section on non-VMA page table
+          traversal for details on how we handle that case.
+
 In addition to the locks described in the terminology section above, we have
 additional locks dedicated to page tables:
 
-- 
2.49.0


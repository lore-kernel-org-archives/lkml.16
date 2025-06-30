Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9761C2036EC
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751280908; cv=fail; b=NAMM12LGBaZ12BBUkanK+2PrhOL7HWprZfjWbrypVuGF7BngYEhVPGwMphOJMOLgO2dGwM3p7EFq7O5RZhjIYaw13DiLXi76+Oo5t/wMCztqEGifIVqmHBwLzMgCM2zQs55n6Tj3yAYLoaHuXhUvGNF2AzDVHoh3aA7qCLvjHeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751280908; c=relaxed/simple;
	bh=88e8iaS7KhNnZ/NfihioFtSYAAtsuwAyRT7+jzRZzLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UvBLa+byC/0DisBiibAfOLMrVkxPGOObt96c37vvlD0QjMyE81rvjp2VO04ZNZAaSGX1OctXdJu4a94J/9sBHhrK359Orp/ys1UJ0X1jdnOR7MsW+90sMFv/fJwouMyWnjp4flsEPurJe04gcycuDb2oWKLSmAl+RORMgb0VsRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Hkve+usR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=x2rjekXi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Hkve+usR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="x2rjekXi"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U84eAX029513;
	Mon, 30 Jun 2025 10:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=88e8iaS7KhNnZ/Nfih
	ioFtSYAAtsuwAyRT7+jzRZzLM=; b=Hkve+usRwku69EsLj4mM9qKJ2FAgqRH/1h
	prOBEh7MltLklBPodubxfHYkHrRQupRsD+ZiS2JmxWMNcSof1+eWcTAgQGX6bLG3
	0fEWas+Aoa14NVaxVMZ+AY/nOLx4IqJxjbBPqQNE0RsdWQWu8J8BcsNaC0Z0JoDJ
	VUxbvffSpH+7fXvnT4lweJnTMoAM1+J6dRx/EKok+W7W8TdJQD5MDjjTCU5tU2LP
	3+zRZ0DMDx1bVu+wazohGdyb6oL+OXIXvWl3N2cm8me2uP3MQPn6hKTlAOSTDzqV
	3hNe01by2PY8gHkxXy8ZxSF6AZf7+KIyP071YOKL4u7+YmNO6VIw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af28fa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 10:54:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAKU5C021637;
	Mon, 30 Jun 2025 10:54:47 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1cwwnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 10:54:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oubbg/UrVObk5xiENe6q05j/bPC/1E5EGRE10C2XPUh3jaDcymHXM7xr8Y/BjcIBcQDBaexcBe6zbAZcEuXM3wilrOvQ9CNiPo8+fqYHGdS8poV445J09FMgFrfPP4A/J3jNCAekDulRF8+QTmdd2ODPPeAQ4UKXrW+kf9fLkQrYnOrGwxvv2jp6vGpIUeu4I3qafqP1wJ55ESybC+0qX5vbzQXigyLWiyFh97SJh5fWdZamwiWDvh7uwqJoHvyt69VHGsxNdCP8HKYEgOr/zuXHW68O5P7LixQqH3kdWIhuMm+yPu9KyWn1rQ/RqPEf8d8Y6jtwFgBmhVCuGjTAwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88e8iaS7KhNnZ/NfihioFtSYAAtsuwAyRT7+jzRZzLM=;
 b=ydclAZ/l+6XYLWugtwQKMjjIUIBdlg6s21yDwGHYW/G6sIaVx1EzGAG4wo5K/U/diZHuSQ3poLWX4GMkNAPiZUl5//nSUUdqU/0Nde//mx4YVLzBqhWOlqpvc6Ri8M8PNVF6VJzO3LKHr+J6+BoBY0tT+/1txTFUVkEX1VGLDNYJEsqELsatBYyBtbbaB0UpTq1WhY4u9sEH8F/qbZXMMdZAYBiUV9K+WcWcr+1CUEFu5An03U0rjJ5Mel7El6sq5KA9OhEWVgNILEeZ3P+n9vVbwhNcNseKU8O49DfZ7nbGFtMwwncFC/kcqkPnMQjN4a8evprDFfXdb6jLFbS0yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88e8iaS7KhNnZ/NfihioFtSYAAtsuwAyRT7+jzRZzLM=;
 b=x2rjekXiAO6c0xxCZF4WeGAzSnjC/N7LF5pQKx9w+id3DBGMwk5VFqvrzzt1mYSuGEB1KEiENyoECOmnD+wtUDvkSpDYSoXUlH3efSkRUQwEHhx1Tgmyhd8fmyvdmj8nRjEWS5BnnFRz07acehn7ejkyUbABgYHsB3AmkluO5CY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH8PR10MB6456.namprd10.prod.outlook.com (2603:10b6:510:22c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Mon, 30 Jun
 2025 10:54:38 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 10:54:38 +0000
Date: Mon, 30 Jun 2025 11:54:36 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: siddhartha@kenip.in, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        mgorman@suse.de, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] mm: limit THP alignment =?utf-8?Q?=E2=80=93_performan?=
 =?utf-8?Q?ce?= gain observed in AI inference workloads
Message-ID: <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
References: <28338f055b3c9afa8b69ff6f05ea20ed@kenip.in>
 <4990838b-660d-46a2-b21c-67adcba61ff9@lucifer.local>
 <19714cae-6b73-43ec-af7a-1455196561d1@arm.com>
 <3ee2e7fea6f263aa884e3e715632b09f@kenip.in>
 <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
X-ClientProxiedBy: LO4P123CA0458.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH8PR10MB6456:EE_
X-MS-Office365-Filtering-Correlation-Id: 36f86532-653d-4aea-81e2-08ddb7c48271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+VWQFoqb+xn3gqb/H/jTrEPXCocg759Lq6YWdmdTLmVvJTAHGXpxCYSrYXv+?=
 =?us-ascii?Q?uvj0Kj0sB5hhHS6YG/rzE2X76zXOvn/+g9/LRa5TjUk4373TC6k8NwiTcoiu?=
 =?us-ascii?Q?E6RsGCpB5f3P6OY6Q75d4O5Qlyj9yvubta8TUGiOUzvKh81wk1Wvmp2zIpAE?=
 =?us-ascii?Q?+Pf1AaFYUxuMgg60VI5jvsoEvDNZeIKuqAHK9vKHKFBD38ZSEqR9Y72k/tbc?=
 =?us-ascii?Q?tTBT5ETovdwfI85InXwZvpa6q50er4evIiFS2eTs8/lj/h5XoJmKA9rt0fRM?=
 =?us-ascii?Q?aqpPUNMNI0bS6m9E3tHgGW+XZrZHl5Ow8IT2CKIRz0Yz9RfvgM6wu+ENIvlK?=
 =?us-ascii?Q?DZUCggNl3h7a5M65JOVBdftmVH8eCLo8BLYyOMexoCm3+pnxTDy9cSWikB3f?=
 =?us-ascii?Q?eGMYQccs+E4l8oLHifY6ojIfa9/Hh87ZxSIWDWTKaENue44qfUi+6ZQV/KR4?=
 =?us-ascii?Q?yKlh8cb5qm0XhgdmqL3vQYKmuHdyya6xCeSejBl++orXTsMly45AAJbhaeXK?=
 =?us-ascii?Q?vOluiREJZALvF7+vZwB+b54vFGuA6UpfsVrBgP4D8rYOFof4L7erP/GXN/xw?=
 =?us-ascii?Q?cL4njNMls9y6uZxCuvxLK2Ruvul02MgfSvmFc/JuJSN3rtF/KrCKq6sO9VaI?=
 =?us-ascii?Q?ROQl0bgUkHtX5JDY7/IU0gWR6JzUCKf5DrjYZB4HU+KVipRlNfUQrPak31zG?=
 =?us-ascii?Q?hycgd4Kd6c9fYJne1Ulomdoj0HpYxYOZLslK94fiCM77HQUDtdU7rbYg1Vt5?=
 =?us-ascii?Q?bghbeokc3AoyVgIp2n/4Wm13W17oeWwxgLs1b7PMpwK9agroJE69kjBmCw4w?=
 =?us-ascii?Q?bU5rQS9Ch8mjYS7MBur4JdNLzdxd3AiYrw/zynRx/SreIN9b3bRCTH6xlqGh?=
 =?us-ascii?Q?PyHHwXWWo9zSSvsjtU4TysV5cf7XscA2CdZlnlI3am1RbFJYOrfcBOOh6e8D?=
 =?us-ascii?Q?0fNfRNwKFwpWDrLrhgkGfiutvmFLdXSk130fIIzqWeF/hlh7ak2kvUmpJFFb?=
 =?us-ascii?Q?BPqpxZvI+yORqDLh6aHs/N7wL42zGOsWUgnb4cAnnCOSgqpsOi6p3uAKjI+j?=
 =?us-ascii?Q?EqPh7AKv8eSPToeFPkB1hCWDsef7GuRqah8lggQyqr0gNvc+3SpSr5Avx7nl?=
 =?us-ascii?Q?I8HEL390U/TGahlyyEIPvCmxqn/jt7LfiOviAzj5OX348LWIRaLGQP6MnGR8?=
 =?us-ascii?Q?17MSqYbb7I+z/iMH8OL11pRN4PsYHqQrBW/DFPOgAaSqZx5jGy+i2nnGAo4a?=
 =?us-ascii?Q?UPtalxLIzMsdK/D1YA8xOK8QfDJSTMx7SdIGW6dr+NT7AJugNnJ0YQ5EWfOI?=
 =?us-ascii?Q?XoLvbJvQQWLuMwqz/emLRFgbzgtqOLtsf4D3l6a/3QZtQYfEUhz50u1jNv2H?=
 =?us-ascii?Q?LLqD+TE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uKf6iT0H+yAXNR5G8Vui448n5LsqUlcpjub+pZqwfcFSiue9hZcwMryHB64u?=
 =?us-ascii?Q?BqLoPkQvKGIA6ZyjO4jh2I6l6nJbuu+g/lssqWhHHiKhxaDHjr+E8myoWadn?=
 =?us-ascii?Q?PcY4PweCusbhysd2UI+T4Ue9bwlmXHTlv+5P35P/H4TVH1p0P/7VMlULlbnt?=
 =?us-ascii?Q?/tjQqL3Nl2GOOcUC1DrDfCuV6+iDwB2ZwTIRcnHZFDlYIpBRTvI4vj8XrMT3?=
 =?us-ascii?Q?LprXDUWZWguBG101qv4dCcH7YXPpxhRUnvrQACNdj1pWVnrqf+QPymFbZ0HO?=
 =?us-ascii?Q?ujd2DTX4Jaq41+r0K+0tm7l9BYObP/FVSsDY7IuzCCuiOP7TrJN6hrhQet5B?=
 =?us-ascii?Q?GumC9NGx5MvpFF0RIL9v894TR+92c1zokhsrjTgWQUhZL1ONQWHxEgxM2ETj?=
 =?us-ascii?Q?DKRKGxtZ5fkFQjSKzC2zcb1PYnXpUjPjx0sqbUTUZKr8iGOgXSx140dn3DNk?=
 =?us-ascii?Q?W/MUTt3Iaa93Jyh6pAbRlKFdiJ3d1VRkNy4zbq/toWKaJUvCgMfRul+lhhCu?=
 =?us-ascii?Q?CumdEhoEdsAUVHJmWAqA+HbcUDHTDKPasnyb9xVEEFXddYIHvezbQnu1FrgH?=
 =?us-ascii?Q?QoI2Zf630Zt0RdRYmUeDtmVAipBXeUS2LAHzu1d9RxAif6XfOL7Aw8poI+KN?=
 =?us-ascii?Q?2eFclly8F/W6nd6LC6f9xakwvlpByQAPNCXdkGRMSGbZwcPprReZPn70ynL+?=
 =?us-ascii?Q?Evyu93InZtP2SG/1m3mso/MsPRe9/O+Bxwr9b5Uu6Bsjh0jpdg9DDvNj0WGE?=
 =?us-ascii?Q?nf+/jKJIuwpDKfbKLWQUzm/65qwOIi8HBt9wbUDlj8CJ++IWkc0WxUccyhAq?=
 =?us-ascii?Q?a8YXAGy4phuQFKbo192B40GEQRKIKW48X4g1voVZxmsBp+vPUPHmy/ja2S+Q?=
 =?us-ascii?Q?sa6MnMmVghJEYGFktFN2XAZLqog+NhzLfowHSnmtVP787Qyb94Mj9xPapERy?=
 =?us-ascii?Q?7CgYOiJfAvhHKEdOV5iNBcuTuJaT1waVqe3jMZNePAT8Wp2OEpJtkv6Muf9S?=
 =?us-ascii?Q?UXAoW/XRFTlkW8f/A58veju8yzBNUAkjEXLG6qHPmn/1WPQ9MEhnc+1J2Kua?=
 =?us-ascii?Q?toszLcpzZyk6RAh3IrhPV6TItUmfq24G0XMYom1lIWYwi2zaIFqxMOFwfekW?=
 =?us-ascii?Q?qwpw+tp54zXSUqxOEgVQLJxaPLpycMD1ZgLug6nE6DXWyN2cviDppm+yRbTv?=
 =?us-ascii?Q?xUPAh2njC47wFwtBRroQwvg0wX9Ltffws17C65h5p9C6HxOxaPTuDu1ntvPX?=
 =?us-ascii?Q?qI8mq2JMRbKobv3DTqzhxziVguD1/fYQiT+ew/L2oo82M6SIpPLdqeao61m8?=
 =?us-ascii?Q?iaa0i0MdzBfCx9jTcbliSfe83xzKfiP03ZygHy/BBUrv0NC/LwgwKW9K1efB?=
 =?us-ascii?Q?Xoz257eGqCZcUYMIhyfQ9ZGKYzXw8LPiECWLXD70IKse/Wy4qBhgNbaQ+yXT?=
 =?us-ascii?Q?EUJh/Hlsse+R+Mu9wRzOySSOUoQfgJ7ap6d3GfdkyZy3GmGIJyBq/2LLjp66?=
 =?us-ascii?Q?hJ0M7IPBI1yCAbYz7u4NAwizYQjzIbaMtz5MJUVPtRczYqmoEU+F6jrizrlT?=
 =?us-ascii?Q?55655ntKJq1odfdM4ICsHW2ycoPAQkzTKE0nWmslKo8RE011jtwOKYRgVXIT?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jtyDe4bl+DpMXW8EdPUptZgRIVBnglqjhF+LgRBbZ1M0776OleM5lP9lMhFftH0A5dCRx0lKSGVUcUP1W63y99XB4za/TMLSP4Hw3RPcjE96nqyw16KR31J6c3uck2CcWpYs0142E/Mu8gO3d8jBSJe/ygZKrx2id8C5Pmc9286yILCeIfj6bqqBDkh03xmhg71nhAfM6bawUvk8bBoUWVbn/fKnuBKeDxPNOTUMX0B/XworwTCBWVCV0/FpjUPAR3KcKM55MTiVcryHksQ1xfJTfTw0BsW32sld9XPmBBSM4DLMJNdK0dlfHUNR0QW7Usbr70kBN4aRPwa1RmY/fldXzWRFv3bmY/zOBMPnzY6GHORpaDo6MYMX2NNERxREPYFptokktulgTn9YW+P7qBIvBQRRVMT1m7AJhctjcNEq//NS3GJdoIp/sJ0qqKbD0OHZWZ/WI5y2w9cxGfd7PBz22Cvm8eTkunWZn8mpNsDvw0kcfM7u6/+W9Cgzq1Ylz8KEb41O/OmFGqMsik/EThv4rTRAxb+5Xsh6XeMOszf7sP0P8zZlz1G9OmnlQQKlDzZEiqvgvcFk0FXwzbXlxbB4CnDELDozBLF1E04dCgI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f86532-653d-4aea-81e2-08ddb7c48271
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:54:38.7016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3JNAU4Fmhk8ZcFQyhkKgOgxmDVXaJcCABSXYTv7+ax7t10pQ+bRUKsQ7oyIBCaqcvj18BnFfo6VcDyLLCdkNSSbfdmyl7lgxVQl/qGKjj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6456
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=786 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506300090
X-Proofpoint-ORIG-GUID: mG4MyKnmYxHC-AmUoz3HL7GRkGkozvzk
X-Proofpoint-GUID: mG4MyKnmYxHC-AmUoz3HL7GRkGkozvzk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA5MCBTYWx0ZWRfX/cNcIyIG5VAw VTFnO0YvwAxifxMFyMmkrHNKnea9IVCdbq9qHf7jheJU9+xed7j7KcfgmILYkjZ1BLjsbzO9k9h 9bL6790kvXBmiMf/q4iok2M18kONEXcaBk0lWp9mJiJdjQnGyWCNhKRWxetQXIiJSm6hrWPbc5m
 uTdcKpey/O0p6YBDYG7D0R1WGm5b31bqYox8S55z9NYHVRKZDE+aiAMBP59Q61cEFqNEhPJDWLo s6pQAIMYbFJRbbSm+H2ckLB54G04X0rl6/2sWefOdqW+iUiTyKOCA97wjgrbf4R7NPZYAGhoyi0 c9q+np5T5673DAjZHZB3l99JomXVO3Iy+TDfa1T/ov+hboS6/p08sPXSFKwvv+tavxs4OERzrEG
 BfPsVpLlCaeWs2sSTE60Q7Yl3mygwXeRgBJpR6x+1QGpsJJ27ShxiVhL3z7qm/xBgIP0HhIX
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=68626cf9 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=5KLPUuaC_9wA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=lCsmbWgNGKpW4q6HwvAA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13216

+cc Vlastimil, please keep him cc'd on discussions here as the author of this
fix in the conversation.

On Mon, Jun 30, 2025 at 10:55:52AM +0530, Dev Jain wrote:
>
>
> For this workload, do you enable mTHPs on your system? My plan is to make a
> similar patch for
>
> the mTHP case and I'd be grateful if you can get me some results : )

I'd urge caution here.

The reason there was a big perf improvement is that, for certain workloads, the
original patch by Rik caused issues with VMA fragmentation. So rather than
getting adjacent VMAs that might later be khugepage'd, you'd get a bunch of VMAs
that were auto-aligned and thus fragmented from one another.

So while you got speed ups on some workloads, you got really bad perf impact on
some that were subject to this.

The observed speed up was on a very specific benchmark also. While it's a great
improvement, it's important to understand the context (see the original patch
for details [0]).

I do think it's worth considering changing thp_get_unmapped_area_vmflags() for
mTHP, as it's currently very limited (just PMD alignment) and it'd possibly be
sensible to change this to checking against allowed THP alignments, but I'd not
assume this is going to get some crazy speed up as observed here.

Note that any such change would probably require some refactoring in THP first
to make it not quite so awful.

I also think for Siddharta's usecase mTHP isn't really relevant is it, as intel
do not support mTHP currently do they?

Regards, Lorenzo

[0]: https://lore.kernel.org/all/20241024151228.101841-2-vbabka@suse.cz/T/#u

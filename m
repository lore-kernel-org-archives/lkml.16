Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4623714885D
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738345932; cv=fail; b=MR8kf9X4ef6KynUgQq1pzS/jqHx8DIyMBvcYvOKm5UxOktvBxM6xysVxIPC24uT3Vtao9htIkJltuiuWIGL9fNsj2VahmvCCiLv3IX1sDsMO7F0tuXG/XWE/W6YSQoNmTZvQMgEXYgH6uPtPBHn/uo/JvDQt/GaFW4NYspIbZog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738345932; c=relaxed/simple;
	bh=nzpnvAeKvOLgVGJgHyw/Xxy8PNxA6AqxR+r9DS1yzgQ=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sa+4BIpryzgA3/r5xG/5P5DCFRMO+PsBjlIMq+PU+cP7a4wRjc1pWvq27W3hl3TiZViyPjk3hFJzX6lc0Q+xmVZtVdWJDg3UgQGMfPgpfNc5jI7GzlkUPwniND9KfMQYs1CLMOR5actjsYGUW9jvRyUGG1gHr9zHDqtwkpekklw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C+4Je5gi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Djyih80q; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C+4Je5gi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Djyih80q"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VHnrdB025882;
	Fri, 31 Jan 2025 17:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=odEOo5+Arlj9ieCLaZ
	prLgYQhwXPx0GrxYihitT4QkU=; b=C+4Je5giG642V369E+RkCm+0eZGmrYwXhT
	tiwZk6neA+uWyaTAk4vFoT0Ht/jS3vP8lWnfFf4wEILH4LnZMc9tGxYE80yUeyYc
	wwptBdDbo/xTDNeFmFlWRwFQI7RTIHr6YDjvoHM94lqIgdsyO6OigT9JVVE/LCyW
	OLKdgsHIcSVxw+e6gt0/atIsFr+0gt8kDB/Odq/NWngPQZcoqBG5Z+segEm8kZ19
	8ETZPjzts7foCIedL86Wnfjn1rzdGEzTrt4F0DniS+tb5uiMJ/FSgWvMUZrMLEJ9
	gyMoTBx9t5Y2zqqaTSRmXolJgFhZ1URM1buEVKkdpAh1hB5dbwiA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44h32rg13d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 17:51:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VHW4H8009407;
	Fri, 31 Jan 2025 17:51:57 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2048.outbound.protection.outlook.com [104.47.51.48])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44gg1gp7pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 17:51:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1sMIpUnRrR6kRNsPf2+HUVAVH6owyWatS7+/nC1LfXC2i3ks0Bz2zrIiwPVnSkfEmMXB0N3yWcrvOsbi32nm3JJtf4770Zx95Pd1pTf2UJDGu4M3/hEnwgegCIMndAAQPvLHrqKhbdCmL/vU+V21jcx8Y3wzSvkkvyF1xEOI7mT4jtk/b1MKxUKsjnONINM8IsqA6wythIgeLOnFZiG/TQ+7nYey7yHls48FZxcrIwTMnDfaRukAji4g4rSeuUh6TN50lbygzUEdoTWOWMNQisHUY4JYgIxkEsMok5m8uBhC9sLW/LcE6OiX77F7jIuK+fb0+dJ/UoKghr9cusz1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odEOo5+Arlj9ieCLaZprLgYQhwXPx0GrxYihitT4QkU=;
 b=j16CJoCUGbdKcy9T/r3XAQbXh20F4I9ZbRb5FYDvpu1fnLYS3W8J9Ns+CEj8xjgxliafcwM9p7CT9MgvpqIp2qbSDU5alkFCbutoL+chlAje+qluRyCVltBGHyp0vGlOF4d/YjdIYNMEc4z76fayAB/Fh59o7dhLrlxPlb657XrRaJjmjEnEvdLhnJN/nMApTBcwg31ryIjDyyjp8wJiNU667qYKofwdVUEcdthaC3EZ9bWrokruVGYyPiZRVTnPYXRkzAHbpgytqGieUWx0wFxVJWcDEpZKxQZfAUBAsGBSzGynsBGUNrfQTHtU2+rocxLb+r6/WI6nFNYXnKa/KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odEOo5+Arlj9ieCLaZprLgYQhwXPx0GrxYihitT4QkU=;
 b=Djyih80qv7wLo0jBozmXc4zZmU8SL/9YosOEhsNuP40tB6FT0UWBdX7aLzQXBzBv+cjRPt9ep4U84ZVXVMe14BZhHW51eRyNRaSd2zFcLYx68iG0WBfdaO8kEmL9zmxxejIGK4YLPvyjx38BY+m08KjNClZfXcKFY8T+DXcZv/k=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS7PR10MB5008.namprd10.prod.outlook.com (2603:10b6:5:3b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 17:51:50 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 17:51:50 +0000
Date: Fri, 31 Jan 2025 17:51:45 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Davidlohr Bueso <dave@stgolabs.net>, SeongJae Park <sj@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 4/4] mm/madvise: remove redundant mmap_lock
 operations from process_madvise()
Message-ID: <5fc4e100-70d3-44c1-99f7-f8a5a6a0ba65@lucifer.local>
References: <20250117013058.1843-1-sj@kernel.org>
 <20250117013058.1843-5-sj@kernel.org>
 <aeeac6f3-f828-4bee-966f-c8df41df30bc@lucifer.local>
 <20250131173132.uqjwrzj7e5vx2sbv@offworld>
 <7k2gs6xmx2q7la6kle5xpn2p2f6bccbiv5lrdowp5hnecxpijx@rzwxdhcl6mc2>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7k2gs6xmx2q7la6kle5xpn2p2f6bccbiv5lrdowp5hnecxpijx@rzwxdhcl6mc2>
X-ClientProxiedBy: LO2P265CA0480.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::36) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS7PR10MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: de5afe44-6990-4a1c-2b8d-08dd421ff043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k8QZA/zgc/PUMhb3dcPvT/HV7BKIVDZD+YWSgYaKZRgs00FRJnEqM2tEWhP3?=
 =?us-ascii?Q?JPBB8QLDKLIaclIBx7JX+KHIW/7FKfjGoMHQuO9eyXx9ICCqLGIFqsDyXWRI?=
 =?us-ascii?Q?htQxH6qyzLv6dljXC+DAF/FNSiPYLF+E8m0kM85RVFk41jbtL1pm/p2sH02H?=
 =?us-ascii?Q?Pg3zTLgDjEK5i8Vfl+Cs8+87SfD0+lMrVHiKhYBc2gXpBLvtYjyOhUPKo5tY?=
 =?us-ascii?Q?uCJq9lV9k2aRM3GczwARl82DtBYt8dffTaTPV1qDgF200dYX3gUvH8pP9PqS?=
 =?us-ascii?Q?SIoGcnro1WOT2dfTyNTRt0k5VzmNu6YNRBPK2bPEh58Sts90+sKEcLWwny0i?=
 =?us-ascii?Q?lw1fVIkgcsxn7ZnJSWPOBfOMSEUkl0BOtFhMrB6dTXivmoN7yKswV4hPtL4k?=
 =?us-ascii?Q?evt7IqAmSwGUWBGesFD/ea94ba9nR9+f+FGK2yCqfP33d2Sr7WgZllJ6ZYN5?=
 =?us-ascii?Q?2Tdt3s3ezDxY0HRybAbERNkDN66OmRwBitlClA527xM6g4XKl6MxxUebtKpc?=
 =?us-ascii?Q?WWWd57Vdl40H5pn/cOjYM+ExxIAmm9ZBk2ThImpZ6Y4pKOEOR7Ef66Xq2VNS?=
 =?us-ascii?Q?WcC2TTgZoCPmzBswpGqXLTdg/fhLBRc9Qp316NAKtQWQ89GLWjHE/SczNesK?=
 =?us-ascii?Q?5sru2b6T1F14bXTaOTHEFJGXaFtZQ0Bg/o3coPmj4S0nbqZNlJJzJjpqEuqE?=
 =?us-ascii?Q?fjb7YELPVqRZ2lGYwlbbnxXwS5eLU14ZrsFfHCqA1XL8cgND9yTVUoMpYHfe?=
 =?us-ascii?Q?npVymJrVXqXXJqR/wk3WvDbPTj5ligAEBNqSgylY/NxSFzayjjyaLa6573Bu?=
 =?us-ascii?Q?TrbwryjP7iisLq+M03QV94cWVK3YrvZ1OHFkSfLucKKitV6at6f0aXvAZr9M?=
 =?us-ascii?Q?V75bD9nbz5ooXRmi6U+u3OCmIz//59Yq3ktlH/v5sjVLkHumXBUzgP66ASZH?=
 =?us-ascii?Q?epM8YOT20Qbkewrue+aJInX1etaDDCPZjqtHZEOmYNWRHSJgZSaH4psl+BVB?=
 =?us-ascii?Q?C6Y+elgT5EhofBnOp6s6jWDKG333QzCM8DHExpr5aqvKqSRlmGbM6+Cu3SFP?=
 =?us-ascii?Q?Kq+U/KBN7bRk5BWVJ8KcI9bQiih5vNi71w52V2hjyoYparZ86k545IhyViy1?=
 =?us-ascii?Q?7El9VN54LraCoj64vUOFKVZr+moAtcRkcISSnlJlRnnkUNyOdQDnMKVQ0cO2?=
 =?us-ascii?Q?jvzH/mi2M2czsW+BfsjwmhPz3oisB6WqD5D1/irRW1kYnr0u5UY4iEUhG/q3?=
 =?us-ascii?Q?e0L50cpMngyr+XWAuKLeXbCIwM/72/KXJyHlXV7YPn01kFvFAZfXmmag1FgW?=
 =?us-ascii?Q?njcNfZaRWi5yor3xpALH0tMXizojGgMFC14qJE1t3+Jxq5lJcifblNz0ltDv?=
 =?us-ascii?Q?3EMUioqgNEk3zWK+5RM9NfQ4tPBw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fn9HoWa9Euq48mkZNZ3NPIBDU7jr7UKF+MBps3Y85XLp+VgunN13zRNVB3ZR?=
 =?us-ascii?Q?BzVg6sOwCdAnaRxWEqCKm3zTnrMNEOiB05FN7HJJPhe4580nQMlYwHo/bg2H?=
 =?us-ascii?Q?lqlNNNJ7J75ovq8ZYcjQDk29R5QFBSOML6S1mpAbRWC0Vd+sMNvWB+GvJTdO?=
 =?us-ascii?Q?6xUQ15k/Slari5oPyg1qfUw2ExH//GlsZmIuzQHF0upUV/3Y1Kc3uaxW3LC8?=
 =?us-ascii?Q?A63fqFKIi6DrQW8gilbmda3S+D+7jfaZdfXuSV6aQPbQkUvwlRkUcfI70sJY?=
 =?us-ascii?Q?FfGwSdg10tcWgxvZcS2+4labu9DP3zvsjsBql1IZoVClhG8xL5/6/S1VTz7r?=
 =?us-ascii?Q?pS0wcPK+VYXdf4//V1rEyCLrncldU6FknH3VUB22eFS8WBLeL/nWUAOuuNiX?=
 =?us-ascii?Q?bj4+FsTNIl+jc2UDSMgeexplMQ/U547bTgz5tpx8PmpH88628rmQ7CEOPl5q?=
 =?us-ascii?Q?+vTghaGJMR6MJZB8DQB6nE00v1AK6Z6UX/8s136pV03FyIaljBDhngwJSHJq?=
 =?us-ascii?Q?FDQkh5F79QP2MyvG6Qh+nCyIAnPZMcfrcxXIAtg3An0LXKHm5qIArfShtcar?=
 =?us-ascii?Q?J2fekwBHgAR9FhJsQJ0orpHeoUYBvRfcKucwh5DxmnqlymDcijK32pMuHjAq?=
 =?us-ascii?Q?ueTTGmraiXp76PqzZelZxduTzLvaNA2m6/lmsi9vvhzVKbbptnwRgyCPqcev?=
 =?us-ascii?Q?tdN9CKkD3YvraWo5OAfm+CH0nsSXx5Z17zy/mQcFazYXYRAdV9dzxCXKDniK?=
 =?us-ascii?Q?1z93LaIdegdA3ap4clyqkP7tuQjWwedlXncd0O6+TCDeSCRlnhbzgUsNQx1J?=
 =?us-ascii?Q?zzPyI5pOnETCZzXpmUgVeSPy5C/p77c7uzvWY1fpfz7IUoA1jduvvyNYwd1S?=
 =?us-ascii?Q?bOf5Ff8WDv+90zWNSFGHBCgQcvl8uXb0jLwJLcY1aDHHJPSWt+uExvYJiRbH?=
 =?us-ascii?Q?FK5mqOFjUcAcjOgdHqbMIpe4P+/e+00xug4JbSX8eNNyL7adMnH3yDmR1wmA?=
 =?us-ascii?Q?Hyhc4PW9DMfxP++sodMufGtCephXfEVEGjjUNOLfY0msFE6OBBzswmhgZK15?=
 =?us-ascii?Q?TXSs9kufjSi9s3x7znEzjYRUH4pxxeyA5Ghnnp1PMUJ3oK8s2dmWHvQzsU7D?=
 =?us-ascii?Q?FXuf7SGCxMepAP8Se0NkgO/L9m14kHsuwDF71MtYQRAR+YwvkFKB08ynW4LU?=
 =?us-ascii?Q?7E4j/a1CA+8mPk+VLptEy2W1dDvdUG0mPOATumwbglVEgVz4sucvN7pc2Giq?=
 =?us-ascii?Q?ctBOHgLZJWZs3VYUyk90OZIFspROkY1KyNZbfOdUE82rEPHRTfSvzvgvz19J?=
 =?us-ascii?Q?v23LUStT7OLpBDXTZXJwr0+5rOsIHPHVhhnzD9Ily81VpcBYk8djxGBy7V2N?=
 =?us-ascii?Q?gJnGQuBzTzw42vInCNnAaKkfHyxS6od27VihPkEyU6qVoDztZ4bAI5kTcjU0?=
 =?us-ascii?Q?gJvma4ajmOAgCZYtJzM1BvFIt14YcMdqqIivnd9jCQ2ohMAcvN2dtMKvywlj?=
 =?us-ascii?Q?ElJ32uCdkkF6hb8Rkj+kDnxQ9FF+xKcQvtUrMzaZSzKp6INlzwMD5SFdhOCM?=
 =?us-ascii?Q?XFGO7Uf0UWIKCEBona5lRffzAkbfR8B4t7ltfRdJrr7N9ep1tiCNPCeftk3h?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	d80JX72IQBj7X9fbaQwgPY6fn9D0oHxWmrXUxMI02DImqnN79yWpIEn5MHfTcmD7sxPi4vMO7MSNNMkFHvUl/nn0vZUnYCpWqhlgVjrt880RnNHGceSSp4xoMPN5/x6R6MfqK23J5jw4SuO3B6nFXOWP1haWrLFzZGCe6oHAITVbwGifsysT/JmAxo7nQtz5kBv41EtcZK5kx4lsa7tw6i2AoacTF2BYXY36EJWr0+Ql45QNWOIv5VzdJykt7Zt+Ji06rNEc5LCt7lwXLr5QXCN7sMQlO/nlq+loJ0gSCBNlAJw7kNvvJRSscK6ciU5DIy23jMvUC++JsisVyVo2Fd6RXacupwI2AR4UMzNJP0I0na5ccsN/CqKWkIAyQlTze0gKtkQ/ZueHjXdZ8mNBDsoOSRyLRi9Re+SZdAbo/2AXxMegoEE+ueGffCjOjjrTkKFiIh54YCH4OG8QPQIwShDkdKgbqukqS+G8ia4edGUX68GkOQWqFOnGEFI8PQYY2vklzLfch7qD2KXmpv1qDvcvSR8Lo4tN60Ms8XShLQuZ6viVw95uSlJBG9PPQY2ErrWl7EK0mZsOkLFZ9DCgitUjNBbfmJP9Whk5KFreuBw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de5afe44-6990-4a1c-2b8d-08dd421ff043
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 17:51:50.0184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: la97801ppLwXIufeBRbJHmFUUkC/w/fUevFXjDt60thzs6mkCQVu7Axe7cjdlCrmbtTY0eMHodGFKo80GUQFn6v+7I7a4UiFktRs2mmqMX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310135
X-Proofpoint-GUID: MaDCrK7StwYtsCBEYhu0BTz2NJqr67S1
X-Proofpoint-ORIG-GUID: MaDCrK7StwYtsCBEYhu0BTz2NJqr67S1

On Fri, Jan 31, 2025 at 12:47:24PM -0500, Liam R. Howlett wrote:
> * Davidlohr Bueso <dave@stgolabs.net> [250131 12:31]:
> > On Fri, 31 Jan 2025, Lorenzo Stoakes wrote:
> >
> > > On Thu, Jan 16, 2025 at 05:30:58PM -0800, SeongJae Park wrote:
> > > > Optimize redundant mmap lock operations from process_madvise() by
> > > > directly doing the mmap locking first, and then the remaining works for
> > > > all ranges in the loop.
> > > >
> > > > Signed-off-by: SeongJae Park <sj@kernel.org>
> > >
> > > I wonder if this might increase lock contention because now all of the
> > > vector operations will hold the relevant mm lock without releasing after
> > > each operation?
> >
> > That was exactly my concern. While afaict the numbers presented in v1
> > are quite nice, this is ultimately a micro-benchmark, where no other
> > unrelated threads are impacted by these new hold times.
>
> Indeed, I was also concerned about this scenario.
>
> But this method does have the added advantage of keeping the vma space
> in the same state as it was expected during the initial call - although
> the race does still exist on looking vs acting on the data.  This would
> just remove the intermediate changes.
>
> >
> > > Probably it's ok given limited size of iov, but maybe in future we'd want
> > > to set a limit on the ranges before we drop/reacquire lock?
> >
> > imo, this should best be done in the same patch/series. Maybe extend
> > the benchmark to use IOV_MAX and find a sweet spot?
>
> Are you worried this is over-engineering for a problem that may never be
> an issue, or is there a particular usecase you have in mind?
>
> It is probably worth investigating, and maybe a potential usecase would
> help with the targeted sweet spot?
>

Keep in mind process_madvise() is not limited by IOV_MAX, which can be rather
high, but rather UIO_FASTIOV, which is limited to 8 entries.

(Some have been surprised by this limitation...!)

So I think at this point scaling isn't a huge issue, I raise it because in
future we may want to increase this limit, at which point we should think about
it, which is why I sort of hand-waved it away a bit.

> Thanks,
> Liam
>

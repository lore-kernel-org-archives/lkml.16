Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA412BF002
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750099582; cv=fail; b=ugtvKy33epbmXJPqs7oUp/btmu+Mg3lu+sTzvj7URsR/XEanepoJc0cOpyX7IxpSHxcQQZopbuUVwQVMovKnXAF6SNJG+8pUBWI1xbKgKWtCXqOUUOkxU6r9nqN7ugzp/tXhqI1kH0yMlggfPZZ/3ZQf8jC0knzwnRCTL3QsWlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750099582; c=relaxed/simple;
	bh=0wP4NXzv7DRhEkD4qyckqfoSsvi7gu2YS8ueceGHaZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ndCItWXlX8+GGxp3p3ot2FH1XkArdy5W0Vu9K/0Eh55PNwF6ahLYM3LH+2KXviGUNQdhbkxvoHOKgbeKHsck/m3hpJfQ1gvSXhy0ZSwkZ//VEFTLR5XJryH8Gf2T12nFTE4Kkc9N4jPbThBDmewfq5Y3e7YK1Ca11GaQSaq83gM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CXsJ8lLM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Wmckhc5F; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CXsJ8lLM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Wmckhc5F"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuTXk017601;
	Mon, 16 Jun 2025 18:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=11idnBat2/M09qv5qbVHKqoYUf3VSAvuIsdEHEsSdhs=; b=
	CXsJ8lLMzmvPo0847GjUzkA7c75Ca72MJPKGwsLc2adRijJFZ1cbOPQ0cILUSbje
	GrMkpsLyZNEV3JQtZ0nkvnKST1R0lngVzF4iLyzTsDDiX1Krd9zMke/9eDvUz9kx
	CSCBINhZ04hKqxIu3zcp9narQfBeeP8wJ6z2XR9Et2026BwNTrzE7R8x23SoAiso
	iRdqmL/m4EQBBAtO9uHFRoxaMNl3SO1V8Ll4Mp/v5moUWWBp4EIJijhGVyAIl0Mv
	rurHd7OOlXQHE2GDl6s22OwSZXyDdMgZpbi7vDStCCHPufCGsHluMRXeQjXni72x
	Jw5xqHRFp9LTZ+ubiw7CFg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4kjkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:45:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHHVWp036254;
	Mon, 16 Jun 2025 18:45:53 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhessds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:45:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXLwn7KWmDaSi+suV8nzLO+V6CGpjioK2o8x+wjtlMBFzQyXEWTk8cDuBoF66MV8kbYmsVDQ3LujYn62iDZI/ClFqtQo2+cgRVZMZdDGsewqBB6acs8sHHbfVcq4ZBhW/DyTdopA32pXUGJTh6MbqhxfTG7SuZE/+U5YouKTsij3f/+L99b/LBZgR4jVwFUSKG3Vsl6UabiilFe5hxTdpZxgkBaA3yfEHRynKHKLTVbs+cRj2kjq6A8SOqeJA5kn77TeItDZVO1rq92HRlt/F4a4dJ9JuAC3Q+rwm3TnyyC2gBCu0QbHZ56oAva4YVEw9yAWVnMfp7P8D4qZFe8F3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11idnBat2/M09qv5qbVHKqoYUf3VSAvuIsdEHEsSdhs=;
 b=FH4KSLhaFeY1CqYXR3J/flt3eJQ4SrHxKFHVsncexnlOEy6fj6ofvs6tFPg+OlPO9a+gqNlV+7RuI3Ft3/f0AGQvmBxBnUqs3xbvzhpOQTeMFDAm587FS1duvOrz33gSbIc8d/e2OZlpqGOWlQdLvIebs18rA6r/fzWX0rQ2R4AxdZPgHA7Q+cTDJ5bnIj2PzSjORZCFCh2WtgZqZ9BvpN0hf0KdFrn1tkVxPLlNEYWbSYPiqD2pmgkiCLHKTyKfLBHn+QR+wv45KGFouMu9/KIERhq2mGKn3QoyQIRaliXInLfrSTlcdkITsRlMUUBrog0NE4JXZi3sCToGnCMm+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11idnBat2/M09qv5qbVHKqoYUf3VSAvuIsdEHEsSdhs=;
 b=Wmckhc5FAuHg5qkD3ul0kGx9xPUkj4/P86qpquTz3jCnFel6QupBVnR3UjYHaxm9mlWYC1theazLHOYyuwxnQDlR1ms1JYTkb5wfOvra3iEPqT6US2LXlxqjeEwNikgYswcmRDJpIGyxm3TWzFCsnCWxchzhoBr7M2JVql+kJ5A=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DM4PR10MB6063.namprd10.prod.outlook.com (2603:10b6:8:b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Mon, 16 Jun
 2025 18:45:50 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 18:45:49 +0000
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Suren Baghdasaryan <surenb@google.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Hailong Liu <hailong.liu@oppo.com>, zhangpeng.00@bytedance.com,
        Steve Kang <Steve.Kang@unisoc.com>,
        Matthew Wilcox <willy@infradead.org>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        "Liam R. Howlett" <howlett@gmail.com>
Subject: [PATCH 1/3] testing/raix-tree/maple: Increase readers and reduce delay for faster machines
Date: Mon, 16 Jun 2025 14:45:19 -0400
Message-ID: <20250616184521.3382795-2-Liam.Howlett@oracle.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250616184521.3382795-1-Liam.Howlett@oracle.com>
References: <20250616184521.3382795-1-Liam.Howlett@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::8) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DM4PR10MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: f5dd370d-b0b3-47ed-a6ff-08ddad060355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5m/zIvaWVwAwrLNbXAybXJ8zX/ANomP6vScu+CeOzfYtqjf0CjVlPIsDyPuQ?=
 =?us-ascii?Q?Th4rwGdTxw2GAyG7AkCv//4ThGBQKQAbS97O9inmRsu1yLNaX0P8ThUR5Hxf?=
 =?us-ascii?Q?C4lXhdHCN4H/eAQVV0QOwKIlqEIXbzaheubA/gPao3v8umlAPtSzLgUoODEy?=
 =?us-ascii?Q?IkCSHlsErf4CWVYVc2VQDbgoH3ccz/aO6itINCd25D00jBlqYxr3t9PfdeeG?=
 =?us-ascii?Q?/oUzcrR8NLfKKXsVOqFCMo1pGbZiz1HEZMHRoxPMiBVXfV/j38sF9a9bzDax?=
 =?us-ascii?Q?H+LOi7fy4JI4GcZ3qS10hhomeDjdIX9HMJ1jc0tmjlDLw5Ea5z5sW/yuITLt?=
 =?us-ascii?Q?N5VFkgc2MH5z/RUT2reh7GD7HwIN6+ppP2VRjcbtGBSKJTqJExNQmZUKufOu?=
 =?us-ascii?Q?d13OS+fduVyttPQVqn872wIO1mZ1AnPO3zFYe7nThQ2+ZQ0DrGVkugXy3LHo?=
 =?us-ascii?Q?WNr3aVHwYXS9AABfGOVG4W4K5hhnblKTN/oyNjJ7PCjsfvqVe9Ej20+yQer3?=
 =?us-ascii?Q?vgPObjdzl25mOqGAXcJtjkEv/VIw6rNViY2WWX6yCrSk7ZVqNnWVFjHSBEoR?=
 =?us-ascii?Q?iq/3YvnM41wSy70Pv9GDfkI85sgDG9Y41AXtd5G/UqFMpL4nKmBwU6FCM56d?=
 =?us-ascii?Q?tJs6w8blZ0rhrHR0ygSJS73Tvap0uCcUolEmZPZ2k7nmz1MSw6sCHQNBfvRF?=
 =?us-ascii?Q?UaN8FAdpDzwsd0K7PZwf21kVoi7yUDNxKFCx3tF6gTJ2wfb9qsctvdVNp+/j?=
 =?us-ascii?Q?YgD/DjJg77yO+Ow8ZJ3z0Uf2T8sUqZoimj6J3wrOGEMSF16H2Q+2JYmXmSYW?=
 =?us-ascii?Q?Dd3HbWUvMxETq5n6KbzHjgmqwma16lktqtoyfomvsLS1gSnu7pP/dTlZJORj?=
 =?us-ascii?Q?vQKzATl4AZDbe2o0+BeBYqOIcOruzMeb4S2eCyGnZANZ86YKmiARq+74ak9Q?=
 =?us-ascii?Q?8yHXz2ltyqDvUOX55CHenWIYN68SU4cwsNlf39jpZj3zBanmkDoSM2KlLjPo?=
 =?us-ascii?Q?YFZMi3uyVi0YtN03ndgjwsRsfL3xmC5zNMmd38MuRAQHo7pWejua2FZqtfnu?=
 =?us-ascii?Q?liz60l4ZNeYUU96g1MVwc17hq88e2HCix7dyXvaOQ1CA/EyI1o6DsyzaCYZQ?=
 =?us-ascii?Q?1vNMiCPJkGPzlRyR2Y4Bj0o69lg+oviBKjMTFXYW6s8ABoEeljqPwGvzdZfY?=
 =?us-ascii?Q?uDOanEUmqtOLXcox9N7bDNJ8SomtaCyKswYs2AT9aAxtDnqvCgYyZKQZrFLM?=
 =?us-ascii?Q?7eW7h+zWyrqsyWhCorGebtquaLoQrs7WZwhmT+AXqueSPlarYna7auRJDCKt?=
 =?us-ascii?Q?60pVGnUhUjkewPMU9Mb+QYhCZowTr6rVI1R4u/apWfGs2WC9mpyoQ0Z7Un02?=
 =?us-ascii?Q?70fEgzU3WOfye2ESeufZ7lPl7yaixfA+KA9sgQUr9XN5L1v4jSFlHte9nWwn?=
 =?us-ascii?Q?MrgyOjFr8GE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WE+zi5roE4WrFW5p7YAat+kgszVq0f1719u2ZviFSeRER+NGRogDF40Ghejz?=
 =?us-ascii?Q?e/zEQFRz17CGErjDeXCk71GrCzTXvKQu/BCI4q7JGsuDNcAKNubsJnhnEIFV?=
 =?us-ascii?Q?67fEkPWJP8sVIO6rJWMWTGE8nBHlKn1mpiTSBzO6yTsxlQVc4CyslQySKBW5?=
 =?us-ascii?Q?NhM/m1Xiyc3FBrr5Mp5uIumApWuqI5JIhpNghJKCNUxZN0MbBBZAL4hjq6sM?=
 =?us-ascii?Q?S75MnXO7FHY0nQlAp9w+xoHbPJ0NNzGacR9349qZuN1L9i+tM4YTF5qOk0Yu?=
 =?us-ascii?Q?G9N3aAzh6t1O0GA0WI7JTfMvTAYDZkL4PkUzx/2Cu4j8T6l/942n6YvGmzAu?=
 =?us-ascii?Q?sI6aBdOkCjVjQbwqFe3GWjvXdoa/dME7nsSKI1ntpDafyjwKb2ikVgdt8sTw?=
 =?us-ascii?Q?g5Ctm2fSfI9DJHs3RQ/IttaMaDhj3vYvGCE9PYVzLGLiRtR+WM/d3zgBms3t?=
 =?us-ascii?Q?YLG7kPfg2VXIHMBOm1rhy/xqdP88Cdlg/rX9bflUokbYqXm88U+vzyTNz0R9?=
 =?us-ascii?Q?CLWy6SWH0jQbLAk9TNRzBPVHzXQXH/U3/0dA3qjeGryMeyUhQu3Rims4DeWW?=
 =?us-ascii?Q?FINMkH6FWNxYyKHlCnW/lZDtQG+8H9whvQomp1PBQbvLslxePTt8v68aQoEV?=
 =?us-ascii?Q?EWL9WlGfNzO667d79x1RMV4O2Oyj5wMc9/nKORjHGEamChysstmanYIlzAse?=
 =?us-ascii?Q?irUVzkfU/ZeVsQUI1OPq5GVCvxisbOV/CjL7xb3dNjxm/8V/oZCuMiOSkKUo?=
 =?us-ascii?Q?B3R+x55jIiEu1qzHrFv1x6BWwU/CHeetmqe6WO2t5aMAOnRmcVnVgGlfZvc4?=
 =?us-ascii?Q?x/PyQNg5g81H+VQoauyVM123hHlAok4WhgOq1STCX03o3aIsd+vmpv+hLpOI?=
 =?us-ascii?Q?/yCxAIjS/TA463GFhrCm4v2okUpL+1SyNSmd7ApzJLZAtWbavGJG4ZkXVwF5?=
 =?us-ascii?Q?9fhfLnaWSUGBhIa529n1YcGnBi2rT0OYsfxnKv2ckhvv4Pk8tGunktcO+Uwd?=
 =?us-ascii?Q?0I1tODLOt/MjTphWZ3UT3nO6lBtluikCYNj2cy3nrQbAkfXJ3Bky3MKbpUN8?=
 =?us-ascii?Q?1jsfK9k0cfXwZzJNPSjCaGOPfc7ztGV6PfK4EZVi7zar+mjzF/Vb8I0eIoJa?=
 =?us-ascii?Q?bexZyOvqmH9g9hAjtc7Zk2FP4D24JZ76JiFdxuOn6ELFDrtO9l1BNXN/EP7b?=
 =?us-ascii?Q?MRfr3ARVLxqGMEdvvQhgc27f8p+6h7GI5Pl0DqzVzluI4AQ5QL1eOKL3fK07?=
 =?us-ascii?Q?cHwpJTNRUgfiut3f4Yq9bQWfexBZXftMuxAdlqMhEkwQNMavMXIEqhNDPVDG?=
 =?us-ascii?Q?2BWTMbKdbs9UA7LLb8iwULwri1Yfpw/W13itvUrk48Kg8KhWjuxXq/yfBvmZ?=
 =?us-ascii?Q?9ntmjXWVl3qDreOSx+cDx7NBhVSH5726rL7cJGz2IGcNnvxivNqU3kGIBG8q?=
 =?us-ascii?Q?AVzz3ql79j62LjnhscnW2Pe+BW687OboGpwjZjNaC78dw4YRv1t8CqcW/JA6?=
 =?us-ascii?Q?LZxtO+wiArnzuVLA/PDL+C5kVQ2v71wTei0xC7jAv6kC69A/SxsEyKfqP2iE?=
 =?us-ascii?Q?WNoFh68ZVF3D9L7Q8bSf79c9jK/8cavLA7wKSheRehUFmm856jPNKgtor+wY?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2sCG3W0yEqHKynrMhA5kE8aEGRRqPRAtrH+D1Z7c7qAGm48CYo5J6prZdHV6reRBZKgnzSzshEJh7BZXcImsYTdwS1+x+7FnraZnYIPGZf8Y8j3Mc708T7lgW9mmaLwZNO3PGUtrDQ9AzjJ8w+hfovMwDLpASa7qsoPFUa0nhppegAOmbBr52Xlx7UErwDNOelCNxDG7tJ1qnqyKlFb8s843boZXIKihepeiE8h5avP4QX4yL5wqrj9vpPidHCRNp6TgD2jz/i/f+L/xGOkP3Dk9dttU5u0UcPCVwzlXFQhMxR13HpFcjSPGj7W2io468YVUdKJ49MyqkGrH0eAA25fZA5ijjvO4++24KmJ3ORd+6neq20WAhtCIo8J5jYxTHE8kP7+jGuFoRIXk/7a3rUv/pBnT8vJ7qDTJmGBY69qpxJzkT+8wp+FS33Kgswa971dXpcNI2UMSYBi9IMX6f9PFUmJ+rC/mfFjp6u6HsKV3dwX3kafjT26VomQjD2BuSkkaeEWK4hnh88xDawOhQp+POyBr3eBvzmgeDf/H88ge9OeyQ9ts8bqVspUmIk5vXHS3PWzjlNqEDwyT/t/bTKvcCLhgaVg5LrvxRPwwraI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5dd370d-b0b3-47ed-a6ff-08ddad060355
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:45:49.6069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdCzsbDteyOkSv9yjFsgqHomlKQjXpIFVNde19Gew89v59QWlHCWvhA+Sm07N1xq32+e4s/B5x3jWc9mJBk9Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6063
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160126
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEyNyBTYWx0ZWRfX/gH78e/BYdX4 3MI7+0Bb3zxnZH/FVSF7EpfPpUL6D4mQeS1m1zxbuDPv7Ep+zNurebuEYko3MdXh6VRkKpHPjf+ S2wjDBu7IFXyRRCdpGYGFG8akkqrHVbsuvzDuRjRAsMRICFeYbO235MNuTlXO5lfRJu5p43zJIC
 SLtn6kwQdHRi4F0Rjy83zRiyAHOYbyIKX9gYfIqBkTKGc/3fXtXC2/IIWS+VDLw33rGK7Q9Omr8 x4IWhe1/HqO2yf2xA8Mk7Rx124NL2DmAFAXJvdSBjzHOY8dcnH4PnU8s2gjshPbO8U9xz0J8Kgd tJv0bg9JfCzkoFTI3JQVfdMI0DOLggVHaHghHUkodRW5r0pr/nnSxi+bTenNU3sY+aXUTxVduxT
 3wwoWq64DktBsAM8Jt8YbnR/Wtjk4NMsQaVIOmH8Mtyly0MmAaERP749pJp24DIXzR+Ceh5r
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=68506662 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=9VFX2c5ERtdKlhUpQU0A:9 cc=ntf awl=host:14714
X-Proofpoint-GUID: dKOfEtCNQsUUQe-IekfUmvH4tEEfzreG
X-Proofpoint-ORIG-GUID: dKOfEtCNQsUUQe-IekfUmvH4tEEfzreG

From: "Liam R. Howlett" <howlett@gmail.com>

Faster machines may not see the initial or updated value in the race
condition.  Reduce the delay so that faster machines are less likely to
fail testing of the race conditions.

Signed-off-by: Liam R. Howlett <howlett@gmail.com>
---
 tools/testing/radix-tree/maple.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
index 8b97aac1084e9..6a5b0342941c4 100644
--- a/tools/testing/radix-tree/maple.c
+++ b/tools/testing/radix-tree/maple.c
@@ -35062,7 +35062,7 @@ void run_check_rcu_slowread(struct maple_tree *mt, struct rcu_test_struct *vals)
 
 	int i;
 	void *(*function)(void *);
-	pthread_t readers[20];
+	pthread_t readers[30];
 	unsigned int index = vals->index;
 
 	mt_set_in_rcu(mt);
@@ -35080,14 +35080,14 @@ void run_check_rcu_slowread(struct maple_tree *mt, struct rcu_test_struct *vals)
 		}
 	}
 
-	usleep(5); /* small yield to ensure all threads are at least started. */
+	usleep(3); /* small yield to ensure all threads are at least started. */
 
 	while (index <= vals->last) {
 		mtree_store(mt, index,
 			    (index % 2 ? vals->entry2 : vals->entry3),
 			    GFP_KERNEL);
 		index++;
-		usleep(5);
+		usleep(2);
 	}
 
 	while (i--)
@@ -35098,6 +35098,7 @@ void run_check_rcu_slowread(struct maple_tree *mt, struct rcu_test_struct *vals)
 	MT_BUG_ON(mt, !vals->seen_entry3);
 	MT_BUG_ON(mt, !vals->seen_both);
 }
+
 static noinline void __init check_rcu_simulated(struct maple_tree *mt)
 {
 	unsigned long i, nr_entries = 1000;
-- 
2.47.2


Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47504B1E71
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 05:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747287065; cv=fail; b=eCg4z7UYauGSdGNjBU3Vg6Zt6yff01rm/8ephhWXjWaQbyXMxKPb1LGUHn8vJ6cNKvTSmPOFIJ+6zmvf20s/057K+hIo6BrKlTj0W4oAaENV8RKNg7KObrbmh1Drk6vkg3W0rkTi4dpX1+Yw2qwHD6JKmgx2EHSG4jufCW/YQ7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747287065; c=relaxed/simple;
	bh=VaEGNHHHvacOQ8HP7ySGslPONYZt+2GN2atk50zlj3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SD51FhWLvB40wcPG/ObfO+VG16tW6KbzywzGLj6iWTQYxLFZtaQzpU+e0+to0hkNV6IU4Be/Tbq7gO8x9pwGspv2pwTTLzpSPc+0V8iwO45IP2jRPn5CiAqc9WYMSSAwV8NEmgOyIGwhU1yy4j48dyNE++3aC11Hs3fOULPQzZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TgTxHt/J; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yxUD0S0d; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TgTxHt/J";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yxUD0S0d"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F3NMqr014309;
	Thu, 15 May 2025 05:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=VaEGNHHHvacOQ8HP7y
	SGslPONYZt+2GN2atk50zlj3c=; b=TgTxHt/Jn2stQx5TcZAKJmpjaoxbOKBP8p
	oPqjv8bKbBhidPwwv0LJsAxSz4lqBNLHJicekRrbsLkpNbiTAG50edB4J3fcy2Rf
	EStBk1WDSXeDUIcYCH68Me4cLlcn+SIsRXlaigRhlu0SzTPmH7a6Jf8u1HdZ25yK
	gpz7NJ5paZd0rHKMfNmXeHn+tJ7mAeXPE1Ai1wVeSxo5nWesWgupImu/2wjRynjE
	rQ7jjjSsFInGBvKunPZeXctZu4Y+tIxvXg3lir2L27Ma1F7zYdSdbezIaY0SPi9+
	9Cw+CT6CY/iiNS3ydW9JcHg2MKnH97XLKNXrT7MKUyeHmXaSruHg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcmk79h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 05:30:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54F4uMQr004467;
	Thu, 15 May 2025 05:30:44 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010006.outbound.protection.outlook.com [40.93.13.6])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mshk3cuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 05:30:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uoVp8ZBjLvlvH+9uAz4wgTp+gRvZBpxedB/JwWNRFot1/W5uqR1jWF7Em6wlciGLPNv1IbZU08tVBGuGs2I0Sxg3vLjx/3IBQ02xdceIAocUi2DEjL84Jz3R5FkSMlgYiRYKZKXwyk3Qws0lKASKevFYIdImpoo63a+MPz75uhg8AjGx/e+aO9lXfZbmS+gNopQ9f11MAdRADrFyzrE7Gg28KNJYjnoNzxIBZRsL97CZ2ie1/aIWtojuKSLwxcVlL5RbY9vMpic0kQFW3weYmV1ILYh+iLOjy2Dt2xFHDByk6fYK+yQ38wMKgEbvG88aAgx5H4pcQQyxt12Jmmi9sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaEGNHHHvacOQ8HP7ySGslPONYZt+2GN2atk50zlj3c=;
 b=ed3EUlvKLTKgcktbQf7Rh2zEV3pKKUOZhJvWsYxn8JrFPhvckUhIaVQSvf0mSuG8/ud0fy40K90X4kHiZPaOoLxvoNVNrlYUdrkvq8VJlP0BNfoc9VAWnNQ4hYNO8VqOua5yf8Js/FotFH/vFVx05FcSokg3Ya+egn6MYo0/wFjgxThXR09DIgZHeu+FC9qNKZYOxeraCIvYqgiC9YaF22Ag1cI/EpVON24jW87MNre+8Bx1W2eskQ5GOOLhr8wFjfo3YZbGkGWYYekvBTiNtds4xR1itDAz17quTf21ZsCB8fOCjHTi6od/Yttz8CF4HR9ms6TMx/Gj6CIKdiYjqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VaEGNHHHvacOQ8HP7ySGslPONYZt+2GN2atk50zlj3c=;
 b=yxUD0S0dQTK5JnKiG6sDrh46eg2KQRKpF2aesXYcsorge7C8tlTyGHO2DbCVYP5DeuftBkadwHKsu4KaDrv0w5NIpBpavnaQwXaQhno+y163xLXJXXKIUVO5xSMrECjlhOM4obNZrXurrajzhfw2dVwEmpaAj2sPjidZTjzp17Q=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BN0PR10MB5144.namprd10.prod.outlook.com (2603:10b6:408:127::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 05:30:37 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 05:30:37 +0000
Date: Thu, 15 May 2025 06:30:31 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        yang@os.amperecomputing.com, willy@infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
Message-ID: <5365616a-d4a0-413b-b8d3-ed533063fe37@lucifer.local>
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
 <3ed9ff7f-d360-4bca-9805-b70cf51cb023@lucifer.local>
 <106c0d2c-7492-4a81-969c-de4f1798586c@kuka.com>
 <42872c96-e9c5-4c3c-9095-3f12202dd803@lucifer.local>
 <b12548c7-9f1c-48bc-a728-d169fcd5e16f@kuka.com>
 <20250514153648.598bb031a2e498b1ac505b60@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514153648.598bb031a2e498b1ac505b60@linux-foundation.org>
X-ClientProxiedBy: AM7PR04CA0025.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::35) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BN0PR10MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: f11e0708-93af-49af-685b-08dd93719f3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pi47pxY4Uv62pXhVTwhruG0iH3752yFvWJj+faaK2ktEFyfVox7G1MhWsWkw?=
 =?us-ascii?Q?hTwRDROobEgU0Od/YoGxU7CQmWyYA2UJJPMp20N3/lVLX5qfFt2lm4ecrDrv?=
 =?us-ascii?Q?LGuV1yNxOdn4dA5k9mAi21aQI3klIbjp85dK/fg1l7g0Wfa+vgudPlsQlL69?=
 =?us-ascii?Q?2DzUIsODdKjvP04NFbSEs16+PXmqAoNvKsupen0vnKCqbJpEs8xkZ0aN3AWJ?=
 =?us-ascii?Q?4ohhjcgOQc8Si4ymp7OrXrE4vEB+26reqfGTfaziNW1tCc4mikFUwt3Qo+wF?=
 =?us-ascii?Q?S/qbVzDSduAtWjRDjRL83Gqesjo5PfHtK2Ocrdj9o8By+evnlTvUF5DWXghs?=
 =?us-ascii?Q?H44I5dWUExBhzMOdoEYN++yzep1TNPWR/muiUDEhWk/uV5aGxEhV1H5BqzAE?=
 =?us-ascii?Q?CgPJbReUDi4AxaVJESqhigrxb1AEUPFXFVe2BGEWutTBXCWxAY3+FldzbrGu?=
 =?us-ascii?Q?tBI1RoeKhBA1wO5uboyufy+SxPsaD/C7gJFjNacMJtubOzo31UPwZ347RsJh?=
 =?us-ascii?Q?ZwX/o9MUa9XBUc2XljoSPvTD8qyDd/flK1nbYLjLGv9ABoBqioj0D/EM0P7y?=
 =?us-ascii?Q?JEG86RcYPu9P8vjHY54iAhDmQOwPvfjfLelrc+tjvDGKF9tTL34wwUZYIU4K?=
 =?us-ascii?Q?d9pFSaYD3MZFc25cMYRlqXVN9HFR1CQ4L0xtzBScrv/KIVdJwPH1KV+ZRMy/?=
 =?us-ascii?Q?QFfBw7HOF1BRXJD9Wga01GwnWWWluq4ftOJEa5zIHGR6lpt45hmM7WLIL7+g?=
 =?us-ascii?Q?wr3c+plPnESpLMBsqX+pmqh5P7E94qN8sKeiKam21np5G/1mSVwGrcJD0BAV?=
 =?us-ascii?Q?/cUq7rf/YO1LT5KHR3yCIU24l2C+QLl4M3dEgLhX4wzXfflbHXiDMhk96cnD?=
 =?us-ascii?Q?M27GLVebWwbEw89+S2yxhB6KjZCmo55+yREUP3VxL+GX44SXBKgavYUHZKZZ?=
 =?us-ascii?Q?X9a+JrRNoSfDcqS94PoQjeWDQA8671tdUcZxb8hEaT4pXiAUj5PdPW3ewNG1?=
 =?us-ascii?Q?vJ4hUGGSBb8ns8lMd/Wwx+2JNxwtMcZoyAS3uALreD9zgYcqYDs6TusO4ZNj?=
 =?us-ascii?Q?AR9YRYFuhL/NTaKtvn53tlp8xSuWBySU6crjPb4409ZeQs2USFTpBakU8QIB?=
 =?us-ascii?Q?OywLwcRo6L1vBOCf5gXhZOiHYY60AHeptpIn7tZgutvr0ChLVkNxI7y9mDlm?=
 =?us-ascii?Q?U7lgg+F0OwfhPDMc4eEtcrlv2KairIGK5lSHtGk7Yz4uCDjuhVhK3L2xsjfB?=
 =?us-ascii?Q?W6razb98uKUikkNHPaCpWvDG5mxvA/TNNteNx76SmylrX8V1w8yDYu3RNg1/?=
 =?us-ascii?Q?3KkhA9b586uXmZq4H5x/xi3nj1V+2YnnXtW/FuoiQrezDytljm3pjjk6bBuS?=
 =?us-ascii?Q?I81cCbE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?atHYHa16y+WiKBVEp0uSvOtxzGjAYj+GJqCD8EbprDV1Zyzdks5cFTFV0JPC?=
 =?us-ascii?Q?DphVLUtLyb7DiSHtQ2vqrK1DcDpS7SSHUZzJi/4kyjhm1wk9kLDz/OoSW/Nz?=
 =?us-ascii?Q?i2TxbB5I1Anp9NIvl+2WeBaKZrebb2cVJ8h+ssVyEj45NxDSYhLEvZcjdo7I?=
 =?us-ascii?Q?fYLy3O6+J09oojArsDLESlpWL8KEe+PCyZOslk6qWxhDJm5pEglbK3FPcfnH?=
 =?us-ascii?Q?eHq+E6gVlzykhrv4Y08HggSBouwCtxi7kuIX42jA3SansPmpn8z5qfuf2PXT?=
 =?us-ascii?Q?B8SeOlnY5Icy/fuC5QpcH6XO17iU1PUDNFEMc5+9OD/0YgcFjH+ReX23Qcol?=
 =?us-ascii?Q?GlYkybNNzKNTwvuepw9bn7qDBDxOwylH46RL0UVbLnWl8SswcBnQcseXzeeW?=
 =?us-ascii?Q?8cnMjnWlM12rlvx3t45fVFmaUZADHqltB7vP/FTdZeaMFYNEN3iJVDaeEAVz?=
 =?us-ascii?Q?b57vRVKMMRTG4fStZ8ULaD0fMH9ICeB/2nJIbVi85iyNO5mWK8sE/llqahwF?=
 =?us-ascii?Q?jKd2ecm+1/+9CvOpeGAEimA2W+6phkesWDtG6ZxipBpaAsYVU/siDNOxTfay?=
 =?us-ascii?Q?JR/Ulfj+dLNRFew1m0A0/plC4x+0LddhnO1o+rsvu3GGteLB0TnNLALRu7cf?=
 =?us-ascii?Q?4OgbZtEVkOS5eMLIzDa+CcOeZ8eP85CGD7w+XsGvEKnNDUUTpx9Ba9xGSAZq?=
 =?us-ascii?Q?GWGsgRN8YcfWMQ8vWqbRaT0QXdmXwRHxIg5hKp+kOpDUEsgfwvuytdhVX+ue?=
 =?us-ascii?Q?E1OdoBhXCBq3rTGK5EoxhNA0iVQo1d+PXTYe4hTgcP6yquD1LpuS4xv3LTTL?=
 =?us-ascii?Q?K/3RF5jffg9ngLnb97dzMvbIqYvV98XIHD1acwW5Rcfoduq5D1AfXAQJNAo/?=
 =?us-ascii?Q?EmREdzegrWkChPNDO9KzGMFOh7YzJPL//n+h44IHM0ViS43YCjVCJbNkRWhE?=
 =?us-ascii?Q?FxP7LvMkR1DkZf8VuwDOBxILxS2Vwy7CY4mRFi/pQ4mQO8nKwhnRmEs0jIlZ?=
 =?us-ascii?Q?W7DEx9D+WOA2YskxioSWs7Np10JSE4eUDpCWGDnQtA5DdJJRrpHFMCGDlTuC?=
 =?us-ascii?Q?e00NF26fApaqj+KE6N6KpjjgBsMP0QE91KuQhMoQ2vGegs+PvsYjg8F1cH3O?=
 =?us-ascii?Q?La4YQBiOv7HfAeEVZnr/g7mM0JuL5hlVRXcqARjUfF70bsC4KvCd5HEyy1/3?=
 =?us-ascii?Q?9S5qhqcqCbbtBMCWARDlkEZnb02rM9PuSIaVrMgEAcPI9ndotN6IBMDZQc9D?=
 =?us-ascii?Q?Kl8swpthTnShC0rykWxffuThE+RmMep9bGUFkDrfpqmHbsvD41Y6bt3V1Wzi?=
 =?us-ascii?Q?SYWWMN9FM6gILZICwe5tURUKyVUCVSMqwul+MaddSCSybhFrU1kHrsW5SLps?=
 =?us-ascii?Q?Z3AwOqlc7IcwoBxrroj7fK2Hh3RZpECs+6ajp+uxjv/dmkElH30l/Bj1NSvQ?=
 =?us-ascii?Q?cNbtLYyjuBIcPtwPV89oGpuwoSDxHROx3snb6dLybg8ovVxJ7pxZXhbxaAhN?=
 =?us-ascii?Q?aYbkoFNcUwqxeahHK7HMs0SpMqpnoI7eF99t6U6OIb4DjbWA3Qv6nGllVm79?=
 =?us-ascii?Q?Mj1j2lbhQ/A1+KLdYoYjRDs4P190uK4t0u+3HqIrdHXP1WAdEoG4Ol0Iotky?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iF6TYfuDKQUQVPjiyK2i0+2be19gX6JJjrXTY/IBamMe+iaTgOD2SLHMoWoD4xROPl1A13mIQ0ZG1cRu2acL3f3d8kmEfNBMCnPI7Pky1UJ1nixF0q9m7Ns87qPRlCIMF4GIx+5ZQ/qF+jwF/F8P8cLnB+XHRXHfATFgHoRxDK1Z4qxjemxO7XWVHzL2wRNpL5xb8VogwvYm7+bXh6ywROzlMuG5i4tXrqrWF0yf/ly/yuIDuO4APUDKrHVld+DYudB5EyIrkGmvA36h6dy+N4mGqHJoswgiaeVMi+NM6MAsCw12eXomOMuQ7bMPNp1kUyjHRYHfCruZuM6TwxPi6VvKKOADcb1o6m10+qeWgMQlIA4TJ8iNVn0rONlL9+QCgDm2Zo4dcubbqgXzh/vmkjBqq0Fiz00HH0fmIGNGpFa4bMTk4lHaoxQ0NIxZEQQBYyv6yHfwMEE1rjxom0JlQurXRDa9L8ONDDQ4H5kh9YskWgwfKc2FwHMS7w35+hO3j12ddKqmzH9MAnoj7XvU5OprCbPflzulrp266/l4fWFxknKIT8VdLvqKlyI9NBkwwnx3PBpIKU+gZwTV03OyYgmfmMknNROKhyDeOyy353U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f11e0708-93af-49af-685b-08dd93719f3c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 05:30:36.9582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wS4Z27XkKrjegFLHwBwgJdYknu0g7K3W5BXhby66VlZcwTjjESOxSmmmb+/54cWddkZfi4+y9xoSxeREbxq043lEIf2Kx/PGnbCnUh52vmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5144
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_02,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=790 mlxscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505150052
X-Proofpoint-ORIG-GUID: rAt2i_KNlHvAZ8BQXpO1WMWdt7Xn2bTk
X-Authority-Analysis: v=2.4 cv=f+RIBPyM c=1 sm=1 tr=0 ts=68257c05 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=TAZUD9gdAAAA:8 a=cBA4sYn9vZHOWQfAQVUA:9 a=CjuIK1q_8ugA:10 a=f1lSKsbWiCfrRWj5-Iac:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA1MiBTYWx0ZWRfX7ms5jNVtE5DI 6bGo7VrTaARJMb0bk+IErDmw2tDJBbw6rrs1IIQ0QqYEYEXRSBttwUX/YUOkE9P2+qqpEBcVZln gn2jLYcis9aVBdrybr5F9sBNKq895kbdjL1PM+3DvRoy1qIPR8i7epgOI/JOYipZMNX08JMC/v0
 isTHHT00DPDq4Nh9HV1g1cr0ThcEW08BWq7HIOO0WFHLqkcFZSaYBYI7E89ywIdqyOO0Y5bb5ft mv9dPfBrX5tC56lpEHyeLV7JrzxEYHulfAe4EQS8U+WOVNc3E6yPA6oheHMkn/dKHvYfJwVmCmB BOx9XJ6DO/lUs8RtKkcVTX1HnPWoM7xN3OmMLePF5A0MeUKDyriE7FZAT6kA/HaayfQECeI5IsS
 UImW8u4SJafwEls4LdqDXKq5IdUvSDi1ZHq9MJWJs1oOrsmwyS5LI/9ftbDmOWiCHIgGnGiu
X-Proofpoint-GUID: rAt2i_KNlHvAZ8BQXpO1WMWdt7Xn2bTk

On Wed, May 14, 2025 at 03:36:48PM -0700, Andrew Morton wrote:
> On Wed, 14 May 2025 17:59:23 +0200 Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com> wrote:
>
> > > Did you want to Iganacio?
> > >
> > > I would suggest chasing up with them to see if they plan to do it or you ought
> > > to do so.
> > >
> > > I can also do it if you need it quick, but I don't want to deprive you of the
> > > opportunity to patch that :)
> >
> > For me it's fine if you create the patch. That will probably be faster ;)
>
> The original patch adds the only direct inclusion of uapi/asm/mman.h
> under include/, which is a big red flag.
>
> I'll drop this version of the patch, thanks.

Yeah this is a case where it is justified, due to circular dependencies.

At any rate this whole thing is a bit of a mess now, so let me liaise with
Ignacio to resend this in a series alongside its now hard-dependency [0] to
ensure correct ordering.

Thanks, Lorenzo

[0]: https://lore.kernel.org/linux-mm/20250514163530.119582-1-lorenzo.stoakes@oracle.com/

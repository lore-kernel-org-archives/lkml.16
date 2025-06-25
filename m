Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CA229E112
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847832; cv=fail; b=gR+E0QVjGUtaIHScEXaHxvyOb/2jG6YYIrcbCKe+BaLyg5bOIQgaSwRrdjqukZ1medSU/vjT/T1VGjMuilh37IHbG9VUl4l7c+NU6/gIdCXjYqQwZma6zcMCS7vjpVP1fYvCk55+P5zurEXKxYsGGEKXlRajYJS7BIbV0hW0E/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847832; c=relaxed/simple;
	bh=Wk8sLPnmvIVa+o9OoeaCGbuYd0918jXrbCCbPwWetag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eIXR33aQ3X+0Uaj/2Pl12vCZMT5Yt4vXZP3uS90na82Kj3aftW0YMcYBporCTPxT6C+NIjxuj6BHownylGw0F/EREajVJY38KUZMPjry3RUDGrHGqeheQPlymcodX3bA81P97znUnPCsX4GC4LZSOfsWHiYGBL/onn0unk0rWX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MH0m5Mwm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BYGfeEUV; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MH0m5Mwm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BYGfeEUV"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P7frTM012733;
	Wed, 25 Jun 2025 10:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=NIwY7U/w6gvWcJrbNo
	zGym80GYcUHMULv1fE/ay7sPI=; b=MH0m5Mwm2CZagINQrLVmW5FTzv0qkH881B
	Y9BE6UFDp8BxyDeHKrveHxLobXpmgD0TI7hL/7HnlcmPA+Osk/RtZ7zoUlCUqzoR
	tUeDF/GJLBiU2BWaVNlaePhwHFyVFU4Ls/a3VJEpT1JEza+80w6ZPRDOvZBH4v+N
	qdBrA78bMUc6sSPs0y3u1LCRSaJWDfganUNKoVyW1OkZTQaf19bk4tzwu2uYs4eU
	yUu4w+zSyILVdWkQ2EFueFJ+boM2tBS8EtecSJ+TFVF8Hwh+hw+nP6eVipbGrUb1
	oTNVcVxTy4eB7TwOxM6W+JPrrgtqexpMODJC+989XsWPg3QKkuyA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt7e14d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 10:36:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P8psoP005896;
	Wed, 25 Jun 2025 10:36:41 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq4wkvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 10:36:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjoHM5S7AvXwvhCb6xhIpTKJ7Geb6EKt/7mJknf2OA7Rp8PUUOPsTOpe15ZQ9FpTSVRH23r7BR2tWC4wSJjKv2EK3HTj1VK786RzRuR6qdKWhVa6CcgaOaco/Zb6zf3EyNjY3fCCH8iiFcR8EIU03Cv4a0s38tKB5BE9JOAMwS/LibDqsCnLXqtD9zl45TzisIfF12BRi50OxqwUtuSfah5IdQY3D6J842dNy51ZBVfwp3+IfKF8z/Ae5vCEY+9hAMEv7t1F5avfjjk7Nzhd/PuwUPdBOJn1MtxzTsEtEtoLmYiIY7prYQW/bPZPXeUQfXQNqwX/Bn2gorabT++NyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIwY7U/w6gvWcJrbNozGym80GYcUHMULv1fE/ay7sPI=;
 b=jZ3r14iHSwHnyoNttrMm3ze6aNG9VT0oaIZRtiokLbmMgPda1LtfvOWPAK+XXrAMX5oi32kQUvw2kNWOWMvpu5d1TsDttxf/ErewBHXbzHZ96xLFcJtchiNmM7Q23/xagItqgMChUVrSrQfcXfjIFPMMgb7gfzwOPS+2+g4QESJSiIa6FlhoiemwA4Rb31zkYjLeWmhBCgGd8tqgfE+JAzQdNr922bXi4qHDbv2N+sjiGn1heHS7kvU4hEpaWg4E3u6XYB+2L2XWMDLxx01wO6O/2iM/3FZymyN1IOjvjZfpb8KmYMRVx6YZog9nQRjDHS9tSV9bjkRY8qk9ezFi2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIwY7U/w6gvWcJrbNozGym80GYcUHMULv1fE/ay7sPI=;
 b=BYGfeEUVdNk0ZJHv8znRs545cjpAQl7d5mdRtfYKTgAA4I+8Mqe4dc8tH7OPD/6xWBp/JKCLZRVgDfrJguYzaOepF5xA1KcZA0cU4F/5Hv/qB4RsmW2XMUymbFiqJTukYIT/q6iNH1frf1bXHaYQIYNwymVtgLw0gCEmlRuAOqU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPF8BAA3881C.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Wed, 25 Jun
 2025 10:36:38 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 10:36:38 +0000
Date: Wed, 25 Jun 2025 11:36:36 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Optimizations for khugepaged
Message-ID: <d684d89d-59ac-435a-b5c9-22f3dc3eea03@lucifer.local>
References: <20250625055806.82645-1-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625055806.82645-1-dev.jain@arm.com>
X-ClientProxiedBy: LO4P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPF8BAA3881C:EE_
X-MS-Office365-Filtering-Correlation-Id: c42d8729-f6dd-40da-0323-08ddb3d42a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q1zzvHTyenJdsAFNhFJsfnFWRifLSpZUN67nE6EVqQN0pUj7kNWK3i27vc4i?=
 =?us-ascii?Q?ZSUmNof5CBr9OVpdqBzcNHPOWQYpH7RvzAn4Z5fFHT/r7H2PAHbJ10zP8j38?=
 =?us-ascii?Q?T6CUoohOnoHnwZKkIhJoAImmvswtr0zxF3aHL1gz0gg5b2xX2z8OsUgzMVT1?=
 =?us-ascii?Q?bh5dXajtWvIpl/Ue33T4VygTpUdF53hXYjHJtVRUc2ArwJLZpLTvaiXfbDva?=
 =?us-ascii?Q?sb7qeQp9g3kLz/sP4k4yaGr9OYDpk7iXw0z1n3inp9WDIWsaOvbk3dY3wMmN?=
 =?us-ascii?Q?zIVzyCuNCgsxiL9qVHW28wb21w51gpfJuFb1eV7v2iEKgT7hsDSl9OeiS5aJ?=
 =?us-ascii?Q?aZ5Fp94l2uGsIopcfw3TUAIvhCR5NRPbi3xugkHG6LbOX8fI+BQhzXJ9hD8h?=
 =?us-ascii?Q?vZg37VOveD7fPfMM+zl5xjoCobeAapMou71l0+YzDDClriI68KKDPQctWtI9?=
 =?us-ascii?Q?mfbVkPaPE1AbHVNkFWSIjrBnZ1kWmqYtnvz0DfXOAON52YcGzXeMTirw1IC4?=
 =?us-ascii?Q?fbjBZxOFrIzSo318PZrx8NPae8MOn2yPqbJyczrheTlZuBAWUC+fTBqhFt4T?=
 =?us-ascii?Q?6JC5GS+V6PTH9+SOcUCK5eb6HU4XO7ABQHaLNl115LXzO15Zau4CZnfAg1BT?=
 =?us-ascii?Q?L0nlqW+PpT9lE9KT4+TlTLypBdfEm86xkMYR+sHP1G2mojIiNwTK5wlALD1T?=
 =?us-ascii?Q?/31zH0k27HT4NpieyjzNOdU1zOvd4QMjnZ/JaR6dkWEMkJ3ORjvl7tTGwvzd?=
 =?us-ascii?Q?yJ/hEUGZxncwFn3VNdBp3SrqJO00AcLq4jG1ElX2CEHOJPA6sgF9VrHtWQBp?=
 =?us-ascii?Q?fxty2FiPgIY5tK0qJtCeEO7s/iZpTFXzgiVmJRIqg+bJ2rdRhZIkjJ5G6JgJ?=
 =?us-ascii?Q?hjiO3N1zSVU0Ayu9aTMeDU/0gghRp/oTLZmwIMyys5tUsBGpOB97HPdha2Zt?=
 =?us-ascii?Q?8R6WkRsrEuAi5As4vGtC4lo6QWpmd95U+MNSapUY7fKSW5ik5XgYafmtLSJO?=
 =?us-ascii?Q?B5AtLqk15bVPGyOYwXTlMzXuqIvTqenwx8NGKCQF7yfGvy+H9ownjnReYHo3?=
 =?us-ascii?Q?hOMPqHaIcfZ/Q5NcYWiho71pIRMLRH3Dxgw1FG1VCya+fdrtEUhU+nDgQaOk?=
 =?us-ascii?Q?aG0OgxMSJrzAjBaSiPL8B7zf7BbhBlfnzRTcqD25GJOP9aXctKNtKwwU84F3?=
 =?us-ascii?Q?s+NvokesYoV4gOFnd6o4fxio+7KxLeFfhLL3i29+GHfViamvsWJ5DBfsTZEw?=
 =?us-ascii?Q?93c8IsUiHmyalhfV4N/2QYO7Fhfio8rpPFNfYAPStIx9PZMXgqU2W9iq7l3j?=
 =?us-ascii?Q?vVcxz2jmWZYH3r4aEN8dBKs9l0sxO99wighrucOo1oXXneYL1ymS5W97O7pf?=
 =?us-ascii?Q?VLMdQAaN6c2S1LYiEfD/kgqfOKGo8axuPOQDWmQGfDFYyN4RzywSDsMfjH7a?=
 =?us-ascii?Q?GldYp7CIrnU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FkWHZSLiIkHJuOO0yv2u8zvPCahd/R4GVq6eApfyjtz/Ui7m63slv8iE2aU5?=
 =?us-ascii?Q?jjRURZSg8HVB2HBg6Hmzj2FANabLXf6HC7MKK/osYaFv/A8V1Xn2F97R9bLY?=
 =?us-ascii?Q?Iu4RTwvgrc+ln1wxKal2xQFRPvCN5gjky13e8KuNXfuollRAaJnHLoHlvlTX?=
 =?us-ascii?Q?gkEuj42kuVZwXOaHhLKy8JlszW1ZNUhPWtiZ9kb6ULDgidx+ORsNu0jZOlc+?=
 =?us-ascii?Q?Qlzgoq5BTWkxCuoEHD3C2gJ3lOBXLe9uFA/pCt4Grax8i6L2LtDvOg4O4reX?=
 =?us-ascii?Q?ng9r3Ho57mqSJGIm0P/0FT/ieCZUpUX/c5Eqb3ONI+Nsf9UqtnhX0xhAhXr3?=
 =?us-ascii?Q?JhH4ycwnbL8q/STf8V0dW/XBAmRBhZKJ53RPWUULgl5QnjsHZD2cOStNYG9r?=
 =?us-ascii?Q?ICHXOzAdpsUxDb5Ehnz+07vPUHI4LXa44LIkGKWKDY2Riy9o7QNhTGWHcDxE?=
 =?us-ascii?Q?tUgofKKIvWn3IvORSBw53EIJUPN+fyvgczD1w+N7YmnVzbdPyL19XbV92Nfd?=
 =?us-ascii?Q?SSHFnK0YGd4jvCuKdhHRUCk4/UPj/2St+ZMGrrONenw2w0uHeRqUwxwpJIn+?=
 =?us-ascii?Q?riDD8P0uZ/BmNUeehYN14oyLoRl15D1Viv/M+IfqDUXUlN2yU0qyt812ts/6?=
 =?us-ascii?Q?dnhQLYjq8zp2DUGB2YVvWGUU1aPc6BTC7l9DvOOEZZ5FA1VI0fl4ReiEeXJ5?=
 =?us-ascii?Q?aRroioJAW7n9uXzNjQ391qxDenKraoH5f7aNfApvOih7fybi3dbAkfszUQ1Z?=
 =?us-ascii?Q?y+KYkDwaSUmflJMGBDeap8MfS+/bLLA3EYbH/NfCly9q8v0n5hCdCEMP7F6X?=
 =?us-ascii?Q?A/igyXjK0zUM4btHDNwTs7Zagq2nPgFDig8MCAmGf2dnvUQgnkS9m9GvR90z?=
 =?us-ascii?Q?E2gFZ07TpVgWBR+MuDOvClKREl1d3J+ui+KeDNqYu5BEwZt6TW5HAfe0Pwm1?=
 =?us-ascii?Q?FdqcXnPQyBEZVwqMWEVniQrtv9kokwpMHBx+jugCfYBxnkmEsthJWzckywCo?=
 =?us-ascii?Q?ai0dzmJv+odUBvsexJtRQ4lCuAKotyKsQnat5q82aj+BTAp5GGjGo7Yto80z?=
 =?us-ascii?Q?AiY7Gxq6Atxh8evi7aBM/CsIYB1cXX4cs+deEpwp9pD/F0aEa5XooN3/hRta?=
 =?us-ascii?Q?xT7NVwMIVQ6/azmmfQtNUoVf02XY4ku8D1LH1Lvg2H4C/vze6ft3QmoNHja5?=
 =?us-ascii?Q?eNDQgRrFbdM6Mvh7cE2WVb+AmAYU1o8qMJnIwxlyBgM5PXOwzYFskhYsfx7T?=
 =?us-ascii?Q?LpTO38N8hzab1rlvooagKxv0qg7fzAcfyGxbDj5X9OxVVDRkB7bgXGPZK2/O?=
 =?us-ascii?Q?M4KGqBDffJ4CMWZEcpZDg71oCtI3jxF8Khrur+nKYRpQyscG+6mP6q6jqe5l?=
 =?us-ascii?Q?55ROrdnLfH+ryEXFrcmUhhoUVc2LoLlvc7cto1iyFoIRMI4F9MzqiWlKIxnZ?=
 =?us-ascii?Q?+apzTnmB9UuedlO99+QDxWjAhFfiO17devdos5zPV97cHf2DaFB4hgtIAoPP?=
 =?us-ascii?Q?6ZMEmDznZUaLxSU/HnLe71oYE+7ExLggIulNk7opGtkpRrwkmp1mqAir+OBq?=
 =?us-ascii?Q?Eu4kTDv9VELM1S95VOjSRh7TYLCh/yIGGkhzhKX9zY1rRDf/t88X0ov2Q+UV?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2aeEjblA1quHaO7DDW3Vz35QteVK6ep7qo2/IKZARYMasPDdMHvgHysrKWTZP2iKH60RWYy6yghXZLvfbohuZ3w6NGO3uJx1PvrrjRbYh/HcE8evKccV873yA4HCkIHXjkhYK9vDjd3RIeNygvnr2MzWhHc6LCBf5QFEy+72j596xe9FiKNag+4jjBHHNma3PFM0HXATEIFK5mHSbc4qc1l69oRAqZskLk1PyCn5gKz8Om5bLCsfLEh4VMW+VSVy/g8ii5nPL6rPoIgYwjSUCPgYRkwHmwp1Z8sJg7eMCCmNO3+PGu+juWjQpxuun0rcJmacdOjPdtp+PF3Vr3V1tTdIvvsUkFhGua66x+E5ZTNztQIn7ou5BUSK1wnCIpRvpwa4l3mFjTY+uoL4rTWJCtX57Upaw4sjHugS9OkJhptyFiWgQqsiXEig0j6IXceHoNXAYAgT7UljJnQIJMRoHp1hJzKEWAFcLymPPfs7tkmYbxsJ2F7ZfEX84Ki+fAZqFaYg3oQIoe0yfAOrI1hPVAwmoeNKmQQ/dJETFkUnQhaXsi1mPOFxNsgKh97S1rPX7g8ucaU9JdGRRosFdvBTwtj53khalZQbvzlLdJ/rcT8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c42d8729-f6dd-40da-0323-08ddb3d42a92
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 10:36:38.5826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seejyNEDreg3QBv+yqLM83yw3EDazV0wlOwAdz1MRq3o3v+2k6BEOyZzt0XqWX5b3Dcp5ZLuUk0cm6vW08hTc7oWZwRox7OhXajvWjIp5QE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8BAA3881C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=737
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250079
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3OSBTYWx0ZWRfX7MCYBVFl2UHX 86ZptiGWwiQ7WnITLuvzXu7+Aq0DCDdrXguCFJOLp90t/SZ0tmsbxR8D6bTecsXxV/SpCPu2mYt 1DI66xuOzObrXZ0qZ7+vDGHbNzEHqcVz5dTUo+w3J1yERZivREOxktnmnpyZ/Z8kFb6o7KY9Q5r
 6p47F2bDEMtfI7pTsmowddpwmGst1klqBNcx3ATj2ZnyyrMQmmr3SkS6kj5Z1NXxRcDv+neZVaq kNqdqzaAuDePKQoU3wM9fALiRg/+JlHBLArurg5b6c3OX7oy3nJypdnLRHIu/rFnveDlODwuTo4 Sbae+bzeHfFgyGMMvI3GIrPEySQYhRICoQOF4nBmE0l6BelqqUsCatvfg9ybaO2UgpidSsEOZNj
 Jxmz9/6rjSDQXAb/bOr+GrIrmGh2+7rJDK7LgwvjLuh+Xc8JMPMc2GyfSvs3Oo4YCSqXw/+s
X-Proofpoint-GUID: NhGb11skreXyB1too9-_dyOi1otEU3aZ
X-Authority-Analysis: v=2.4 cv=QNpoRhLL c=1 sm=1 tr=0 ts=685bd13a cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=q7X3s6Bl9wbMjyCKAVQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: NhGb11skreXyB1too9-_dyOi1otEU3aZ

On Wed, Jun 25, 2025 at 11:28:03AM +0530, Dev Jain wrote:
> This patch series uses PTE batching to optimize two functions, and
> also addresses a race condition.

Kinda succinct, be nice to expand a little. I know it can end up being a
little duplicative, but I think more information is always better than less
(as long as not truly overwrought)

>
> ---
> @David I did not make the clear_full_ptes clean up since that will require
> some more work than I originally thought :)
>
> v1->v2:
>  - Use for loop instead of do-while loop (Lorenzo)
>  - Remove folio_test_large check since the subpage-check condition
>    will imply that (Baolin)
>  - Combine patch 1 and 2 into this series, add new patch 3

One small nit, it'd be really handy to include links to previous series to
help us find them :P

As this one combines a couple earlier (which is nice!) but handy just for
comparison's sake :>)

>
> Dev Jain (3):
>   khugepaged: Optimize __collapse_huge_page_copy_succeeded() by PTE
>     batching
>   khugepaged: Optimize collapse_pte_mapped_thp() for large folios by PTE
>     batching
>   khugepaged: Reduce race probability between migration and khugepaged
>
>  mm/khugepaged.c | 77 ++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 57 insertions(+), 20 deletions(-)
>
> --
> 2.30.2
>

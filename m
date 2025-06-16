Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EBD1CAA6C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051411; cv=fail; b=ujCdM2baRizbTlIqEuzKkGxZgCm8CBObrcMX4lAfYvBM1uiY6Kwj+Gn22OB+O1+mHKfgC6yWN6zqu6TnZvZ0gDhG4Hs2X0yFs6F0C0zwOEWuMxWaaLpPOXJvRAcMEVJoFXrIq1S1MT2C8al7uM6k2tnBHPUAY6NxsaZ5pMfgPM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051411; c=relaxed/simple;
	bh=rIB6IkN9wC6SZqW/Mf32kkhNdqI9yNCYzQi1RSqBTNc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JJvmx7Y4dRNE3/UCMxl7Jg+d74lp7CoXhbXpCgGK5RShsWQFPqPaeGc1M34SA8V7jTrAVhYkPbIWW8PNb5ZvrnIiU21DQIOBcKreW0UM4cxGpaDVY/Two3tcB0emvy/nAgISBtxXQzGiQ4fB1YgAvyANG8yBejDVb5tAxpZ+mLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FD5zkUet; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LOfAtEfG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FD5zkUet";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LOfAtEfG"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNQQUq015526;
	Mon, 16 Jun 2025 05:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=CcoRze4gD1KQ8pWom/njA92ZrFAqJrt5sVWFVOEv4Uw=; b=
	FD5zkUetc/fgm4smFuI98oZ1psGyJdFjAK0r/0rPjkmJRTawxhpTklNIGME/Q8Rq
	Ama0TRfNS9dB9RAI5JhmzUcHCTbA7E7tO/JJWe/7iCgajJKjagyYxD092R04j8Li
	oG78qR3CxmIW8l5cvcyekYEfRah4tvSG1OvTVb0hsS/V/lpgxVBVICpfLZwQRkkX
	hBTn2y2OdzSDGw8Fji3M56sTIMi8P794sRQq2KMkk1ESFwmWxeJTXrsMMF9l1+iW
	CedrPla8XJ7QhwwXdwEK5iY6SRKjDRQD9RJf2TKgsUM1+KGT4Tqqg3ccQC21WRz/
	jQc+H2K44LhEweJVLgS2Ww==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv51pnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55G45IGN034394;
	Mon, 16 Jun 2025 05:22:44 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013038.outbound.protection.outlook.com [40.107.201.38])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh777cn-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uN3Z+pSxXoDt6wM8AmuZwRUTh+g0gmofRmzXeyGcvpWja/6oQAHyhaK6LC68hQsGu4/ZHP9hEzqZrGJjvBnNA2iD8ZWLdFf8IpV927TrsDJDoi34gxpTQX7vBC9JPyVJW1UWhE8P1VKnb1/VgnLgbxV66W3JIWv3hlhYW0pE2vuo8t5KhWmetZQHZmZFhrYQtMb6/+C3ZgErSQGXIMh770RmWD8Iy8LdKt5ziQS/fnR1niVhpIF95inELfMIZa5FXu0JwIyTxPwSiDO1j4vd/09ee+nIfdCuWOUgA+zj0fvowuL8PtZnXi2z34iOv5i2FbrAZDFSCssY1HOPs6QaKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcoRze4gD1KQ8pWom/njA92ZrFAqJrt5sVWFVOEv4Uw=;
 b=wpgjbiuwMGByscns9gZBRGHlzaRogC4BJuduJ2yWjjCjim3wPtvyx9OAOzvrbWoymsK71dVn4rAoxpQA154mPEIVFBiqNmWC23UID28xn1S7Z5YG8f3YAVJTMZjIur9njGswcRNP0xAF5ZQNoIc2PrU4CFBFaAE20JxOIJqw8bBsDKIVFbR6L/4mJrs7yZqrQG1OQSdmIo4MpSB71IX0ZfnHwur+v7dT0JFh7L2bRUMaD0G51kRLeXG4KQcPumDfSPnlrkI5kGKsOBW0zZnn8pGfr2+zWqT47xtg9GoK6seBIcCrJdfHEq4/NNLVNDkcVNnwKToJUgmjja2i7o/tJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcoRze4gD1KQ8pWom/njA92ZrFAqJrt5sVWFVOEv4Uw=;
 b=LOfAtEfGfKanUGwUHvMhxYbMxR0nmw9nyryk+hhXTNT+UAWBpb2z3tSbJZhnSLPvuuLxQ4aIOL9NJNN6RqfTq6N1jHoOXu6EHxhIOc8MJs6ZoqbDHEF6z09jFtwrjXbDPFuVE4cODRNkN9JLI2RSNXJP7YnG6uf/Rh7ivaBrV/k=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SA1PR10MB6389.namprd10.prod.outlook.com (2603:10b6:806:255::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 05:22:41 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8678.028; Mon, 16 Jun 2025
 05:22:41 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, ankur.a.arora@oracle.com
Subject: [PATCH v4 08/13] perf bench mem: Refactor mem_options
Date: Sun, 15 Jun 2025 22:22:18 -0700
Message-Id: <20250616052223.723982-9-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250616052223.723982-1-ankur.a.arora@oracle.com>
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:303:2a::22) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SA1PR10MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ad9e963-5164-4f28-3b8b-08ddac95d147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Havn+APrZslkojxhJ0PQa+M1IsBnGZk5x5HkSEExTHofPibkUlK7qAGSlbBK?=
 =?us-ascii?Q?ONdrWyn7UKHzhM4ctmVsiPc1vGPQYknJqiC+LLnWeGQrchQBxyWbO2cHEX4m?=
 =?us-ascii?Q?Qe5BOpL+KEx6a+xOzqnv5jh7QCAjyxC/Q9uf9LgC1usGBWEpH1Dq1BwODse8?=
 =?us-ascii?Q?EcY8N8KHzOxVx4M9mM+yzvzKuD6y8cmg6V1M+u18tsUQaEWXEoOBpHnlFs7w?=
 =?us-ascii?Q?+M+FodPsEk1/GXF5lP/kQd5an6Fn7de9PblInTaKkPFvQHaes71B/73QoqI8?=
 =?us-ascii?Q?xyJZmilyV/nC6vjvRTmZxIg6p0NgtGA6N2OVqir1iy1Xl5hoOdpOn4zhGx/E?=
 =?us-ascii?Q?NT7msKJNbiu3uIKuarF4c1r2Dg0WIYrMBvv1mMGf2f+mdYtaPB/qnEAMf6NK?=
 =?us-ascii?Q?PLPIGJq8jWBMr9S15ZMLpLUUw1b6ykUJWfYynOipkAgPpvaDMv1vwKo+hjPu?=
 =?us-ascii?Q?sgNFquMpxX07YiB0ECoqSeD7vzpkqWdIiCnmNe0dM4tzMSmUfZQF0bxpQvF2?=
 =?us-ascii?Q?7kfglAWb25TGkQOE70noIoebYv5wxPhCuwDSwrAdb2Oudtyp5ts4Nsjo3Zi4?=
 =?us-ascii?Q?7STXsckgUyVnlLTSdnpLunMU9z3KbdjrUs7X9w4Ljj606PcW6zXYWcJUbuS5?=
 =?us-ascii?Q?7+0lzKyurN6KHOVhB++HC4/T71t17Yqwx4V0v0oeWOfbPz7VboVe7u34oSyV?=
 =?us-ascii?Q?MMTMv9kNRB5fvpRP5u1Z/2ouNAVYNY9tIzRyiHSZ4lv2ophUl3KYBKJBUUxI?=
 =?us-ascii?Q?CeyEIytUH/nRwz+3nTt9B0S2S3LBiGvVKufvs53earArN4iJa+2GKlSm/OuB?=
 =?us-ascii?Q?ACLSdUC3NZ5Kb+iPW3AwLZo7i0J0cFlXNP6AM8n3a+hM7538FNZJ4hIdI7Ns?=
 =?us-ascii?Q?PXVLuMH7Ixt40y36aJxPhCbNkMOyS8gBekJWEFpTrRMiWOhGnJDuCHLJNDhn?=
 =?us-ascii?Q?m8cyJ3alaB1FOQ51KA6H3BtqFufzR4MKxk2VsFjMv7eB8NKFX4e0HpySm3uM?=
 =?us-ascii?Q?bf7dZ5G8h3eLshQNeQvUswbpl0f7Q9JHv8SRkdJ8Zv77XM301hNLCLWSDUdS?=
 =?us-ascii?Q?mObygfOPoBGaBHcuhA5GZX2LyWySQzhLEUIX3A40t+9xzxP+QjipXDdvgJk1?=
 =?us-ascii?Q?vZOx5/XmOZ6v4FOujQgK4fvz3UafSqJ/e2xztOJEbuO48NiuJLrEj46LTeqy?=
 =?us-ascii?Q?hA+dFzFhnYlG4Z1DH180Lu+D15BslXtq3/H+qIVf1JPsHe7gpX3svsuxrDoF?=
 =?us-ascii?Q?Y1FpMxo1mp9eMHqxE+Y3IsQzX89/evoq+WZlgW3K0up5LntqRfz1DQpqnnXq?=
 =?us-ascii?Q?cPIWzO+Vxb4WLudP81+yoHpfbrszS0x4pypjRJdjVmxbxEI3dFA2PsAlNdDk?=
 =?us-ascii?Q?DD57WCajvge/YFV4loanUBE9ZdIh3NqVG8ZFS7UE3R0U6/TvCw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gt5lw0U8vy12vQVKBxTv1+mhJdH0UnWccSv352frtTOirY4gm3d6cWiZH6+J?=
 =?us-ascii?Q?XoTX41CpJyjceFtBS4ACISmJsJHp3EiNV1lYtW+tipYKdrAKB7RVYFAYNp8+?=
 =?us-ascii?Q?ObZK/gDcZrqSNZs+mn6+8UMLtOw6MpsEpfIYwYws7lAQhZDSf4CJoxjz4K5E?=
 =?us-ascii?Q?vf7y6EzVOkSx1Am2dWUXnY2cI5dxRCnJ/2lPYEJYN/jQsN8z2SSWLQYMHpQN?=
 =?us-ascii?Q?Ac7D6sVT9P7yn+LlXCLuG2OgesjYFXVkc5PVmZhCAkYEKsy/LW0POFtJLnmS?=
 =?us-ascii?Q?bS4LkyBFxx35b8DTHO21pBkab7mNF0tgbtEGjgjkHwxvGY3c6FL17QSKpyCG?=
 =?us-ascii?Q?VbsTnJpEtm+AP1tYgRaoPf7+q9cusdDpvhP78UPe5m5CIk8wzBgknjKXkjqY?=
 =?us-ascii?Q?OWqVPBFB6/iFX2Q/2swMaoI+xlUO2Lbhh7p7iGPnZNApzQo/6NigFLQulPYc?=
 =?us-ascii?Q?aMfTcZTl5pb1P9RoGyMgB6qZVXOV7cPe/NO9g7SQg1sPVRmZcXoQQULYsVlb?=
 =?us-ascii?Q?qAy9sKm7uOCwhxbaZ82AtgnxrRHGNHuAYXP/O5NBLUHMFoS6ny+vYLpi7GCC?=
 =?us-ascii?Q?/xUpT7MAw9eQ0k7jrWw0qxTH4/lOLkCH1qHRhN09CCxBJw2kHkQ1erPQxiHU?=
 =?us-ascii?Q?/JHxWkgSF1G6LjLmNkVL8XmQQUK/agvisrf1xK/u6YPYmS9xYLN2YYlBNO+w?=
 =?us-ascii?Q?eoxT75IbENVckF56NfPa9P9oyjd7HnS0nFDHvr2eMCj68IhBxF5V5KUsWaeZ?=
 =?us-ascii?Q?OHVmJCozyvRx1Y6Iq4PV95qTt1ncOJQ1BwG6AeFY2k2rA/e4nT9PDj0JXhMK?=
 =?us-ascii?Q?tWePOBEOgxGheWHQPoYc93ZpUVIKuXlw+K7HxiStGvrLsQx+cyHf5aa4UGSw?=
 =?us-ascii?Q?XJCYDt9mjeEPwI5C4YSGrEJPV6+w2WRmskp73kKIAUuxxCpjHPTORgjZ2eRv?=
 =?us-ascii?Q?S5yzLJ1RyTVlIZ/NsxPSH9dekd2OFmN04Qr0HsNs5gslQQ2WBfrxBRBxDwAp?=
 =?us-ascii?Q?ocVlfIgXVbckWRbNdyP+hqvIQd/DyRev5iS0UaJn8EYHrQ3xNMyDsn60IBdI?=
 =?us-ascii?Q?QBmGr1C8uoc+45xdSJGgQMFydDUZFihSFArfQdXF0Wouo3RlP/0I3lbgZ5fk?=
 =?us-ascii?Q?8MSIa7ioDt+lPumFVvzXLlxaDplpkjjy+K3SZgo9vSCoEogdDjoavZwWYLsg?=
 =?us-ascii?Q?0vog9hi5dCXk6beudkSdnQANRq6XACOb2auITZ/2FIamqOWhxs6D3XNd0aAM?=
 =?us-ascii?Q?QGp75O0cdRoNu56vxeFgImxpHoWv4vtbNCGE2qNHwfwGNNdxwXiF8lgZkei3?=
 =?us-ascii?Q?brTOieTUmVo65nfeAjgMwKqGPdQWIFhkQBUnimZXFRdxDaMkS6aTA64PhscZ?=
 =?us-ascii?Q?rg9dZLo+FsojlQ1YxDohQOefFuJVqpyHFDduLowEEXEua639TI14r4erW2Dx?=
 =?us-ascii?Q?P7yE7b/lF3IhMZ4FUMxGPnMnh2td7xPiIZYFCdpFfvow08dh1FmATfM4yhIK?=
 =?us-ascii?Q?9rtHGAOntiikAsocO0oqSlN8angEcgRIEcYQ3ZJXnLNFYaZUUOEoZIcXjbek?=
 =?us-ascii?Q?3EDDQKqcRmku/UmF8t0f5C+bIIbL28jkADjJ9Ek/yREgQvQDchOpZKKcnC/L?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Irtx9KRqNeKGuU1rqXJUquY3a3r2To6PXELCMMsIcNQ+Ts0IJiB1xIAGkVPfvzTWTYlaaNvCT3Sp0pbaR535ipZK7Y6vqpxinePWAmr3GbiAWRXsfcHtZnvtA4wo3ZpWe9dd1/FgcvLbTrJpg7LAHH2Xmb6CKJ3UFDq+7uZ87LHTFuUeE+MB+rMbyiw7+YcFN8vTkLYgTJI/0NEnNxmd0e6tjAeGWqXocM7ggDDlygXjCSaF9M0gQcuNZcEiJrMqps844pWelBUwIP458gJjQ15vhVUQkkRYmdU5cUdDTOOhDKTdFemMM1+rrIIRi/P3Ovws10q8rdTIOqgRhBuYYE+nI31df6WUttnIN4IPHWyY4KdK3p5DTdO3Z3ddMD4wPY0cwkI2vGTtDehlkrJpn529ImPgkuh7LMjKgxi7KDgeUOEqCyuHeOrxIxR1dqNZH/PUq4pCc3Xm9N2gpKjH4DLDedwIYT65HdCvcXGABqx0dmf9Mf1EV8Q+O+0PPX3H1mqaz8XoG+W0Zcc+9Cv/J/e6D3qPZVa0vkl4q286eDuMPcm1G7YaaG7bmvH8Af005/KLL54HDYTSbejva5M+luFf2/oyyu6wVqoRWSDZras=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad9e963-5164-4f28-3b8b-08ddac95d147
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:22:41.8617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZv/eiqVq9FEaYNcIUulykuy6U5Rx2zArwQY6APQXwm+loxMgA2YVDZ2BN+tel3csQRpny0qaEMyy4qlAac+VZrnX3+yoY4kG/NJ5W1LOos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6389
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160033
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzMyBTYWx0ZWRfX4GP6vFxfxEFg 5OW5+VEvCGNsUKn1fi1l34mpaNvc4oGB/Dh9Obx+feW/5matAiQJ7h77ISJZ1wPWLla5v6rkgTp nBkvJBrPrSR7G//Op1msDMO8OYnj58t8uRILj8RsvJv5WSpMHESAWqyZHeJimwi2Qtaiqy+epqH
 LbydieW2vCrXG1VQMPNTStyi3fQK8wVLzfe0h2FZSgfTyy26ePo7WpPk2lIRuzFdXK1jUPaz8fm ZOAEycs2cshD35Zb/cyWJUyDC8Ip3uJzohbXygRvDr3W93ZQsh3sMYEcV26AchY25rBNc9J5Clb n2IlgCm305HJSGraopvYDGve348vsooBn8CoEwfH4jaP1j07CQmiTL7DJg2cOMfAj8jYeGAl5Ex
 lbjWQQtTxTKkBiAlg5yQzd9mVjt1gZpdCvbVpw4y1QyGngZbEmQAxjIaaGf1UReGsc3J9Eqk
X-Proofpoint-GUID: jnjJ8-ktpLYh722Q3xkMWJArJpIUSj1M
X-Proofpoint-ORIG-GUID: jnjJ8-ktpLYh722Q3xkMWJArJpIUSj1M
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=684faa25 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=_oAs_-Zd7h5Ft3cs7ucA:9

Split mem benchmark options into common and memset/memcpy specific.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 tools/perf/bench/mem-functions.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tools/perf/bench/mem-functions.c b/tools/perf/bench/mem-functions.c
index 412d18f2cb2e..8a37da149327 100644
--- a/tools/perf/bench/mem-functions.c
+++ b/tools/perf/bench/mem-functions.c
@@ -41,7 +41,7 @@ static unsigned int	nr_loops	= 1;
 static bool		use_cycles;
 static int		cycles_fd;
 
-static const struct option options[] = {
+static const struct option bench_common_options[] = {
 	OPT_STRING('s', "size", &size_str, "1MB",
 		    "Specify the size of the memory buffers. "
 		    "Available units: B, KB, MB, GB and TB (case insensitive)"),
@@ -50,10 +50,6 @@ static const struct option options[] = {
 		    "Specify page-size for mapping memory buffers. "
 		    "Available sizes: 4KB, 2MB, 1GB (case insensitive)"),
 
-	OPT_STRING('k', "chunk", &chunk_size_str, "0",
-		    "Specify the chunk-size for each invocation. "
-		    "Available units: B, KB, MB, GB and TB (case insensitive)"),
-
 	OPT_STRING('f', "function", &function_str, "all",
 		    "Specify the function to run, \"all\" runs all available functions, \"help\" lists them"),
 
@@ -66,6 +62,14 @@ static const struct option options[] = {
 	OPT_END()
 };
 
+static const struct option bench_mem_options[] = {
+	OPT_STRING('k', "chunk", &chunk_size_str, "0",
+		    "Specify the chunk-size for each invocation. "
+		    "Available units: B, KB, MB, GB and TB (case insensitive)"),
+	OPT_PARENT(bench_common_options),
+	OPT_END()
+};
+
 union bench_clock {
 	u64		cycles;
 	struct timeval	tv;
@@ -84,6 +88,7 @@ struct bench_mem_info {
 	int (*do_op)(const struct function *r, struct bench_params *p,
 		     void *src, void *dst, union bench_clock *rt);
 	const char *const *usage;
+	const struct option *options;
 	bool alloc_src;
 };
 
@@ -230,7 +235,7 @@ static int bench_mem_common(int argc, const char **argv, struct bench_mem_info *
 	struct bench_params p = { 0 };
 	unsigned int page_size;
 
-	argc = parse_options(argc, argv, options, info->usage, 0);
+	argc = parse_options(argc, argv, info->options, info->usage, 0);
 
 	if (use_cycles) {
 		i = init_cycles();
@@ -396,6 +401,7 @@ int bench_mem_memcpy(int argc, const char **argv)
 		.functions		= memcpy_functions,
 		.do_op			= do_memcpy,
 		.usage			= bench_mem_memcpy_usage,
+		.options		= bench_mem_options,
 		.alloc_src              = true,
 	};
 
@@ -453,6 +459,7 @@ int bench_mem_memset(int argc, const char **argv)
 		.functions		= memset_functions,
 		.do_op			= do_memset,
 		.usage			= bench_mem_memset_usage,
+		.options		= bench_mem_options,
 	};
 
 	return bench_mem_common(argc, argv, &info);
-- 
2.31.1


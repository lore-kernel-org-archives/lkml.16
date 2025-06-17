Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758BA290BC4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150323; cv=fail; b=UjSjfDSLofv2FoQgmTu/vEiuaOWrUs8gplBDyc53TNPcIRiXiOPqAdd4H8Mao9qEuluJ6c34rB+aQPmu7O3LQHf9KDxgJkilc4u+rDV7o2rypqv6omIX95AamknjVHuXyKVtsOYFpDYxuzssD5Fp6jUsXAonKu2b8KbjhchyJAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150323; c=relaxed/simple;
	bh=T4MHtjSmYjt5ct3ZqT02qTcVIjz5LuJCwTeONX5gML4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qLNCV3rNe6F6lDikOLCsF+CnWvA12oN44xmLp3tn63AN07w20RUybtdC9/g6oH6vxt1yvcdD/g58Hp1WBDcvPj4nv7XmkyTkYCU3xiK6ep/LMcDxcKkYVn7eYFYb1dmFJCPKMSHbYKDW6wNj9I2dKQ+6C2muJMVb9htoBBKj3lI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=duon2AOl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=y+izEQKL; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="duon2AOl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="y+izEQKL"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7tX5h032459;
	Tue, 17 Jun 2025 08:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=MEyP003UnwgPjMOxlY
	zD3lSo08tP5vIpwoXGTeG4J/I=; b=duon2AOl361Yp+2NR/h7ikrX/jXcveDzWo
	5MwltQ1gjAdknFqmfuUzLu9n1gLNsMQ7BQhyQaRY7ZngAc4uzldF/jwFHMlDL2sw
	nO2RjNqyQAV1WL3yI7I/V16rRxGoAFAODRxZxCr8vGCbvmg5aYlXWNn17AVtDwNH
	ntUDOhn+zn+ohljWzlxqmY8YFypPC5lguseAL8ZZRclKl74o1Wf7y2mguJkHxg5X
	g4i6tIwflEojYTPgF2qUbabDoPbtt/FTCkkr0PymQDtoCiuH5xl9KNd2wGp7JUfx
	CYSFqSnWtsdmHD3w806H62bUmRauP8j401jzwAw2G9XgwULesslA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv54srj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 08:51:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H6tk6O032297;
	Tue, 17 Jun 2025 08:51:49 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2060.outbound.protection.outlook.com [40.107.100.60])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh8y7bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 08:51:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUuMxZoBK582UZS9npBp5TbsIcVFMLm9xd3i0q3z5wocH/lJ6JqSVATJ2ldM9QPRVkdGFHLGEugBwextKsXe4ugYx5HQ/MJQeI4xurfDCJq+2fFKUOXNotpMeNvGXVAnHpOD+3vG3+KLavjVpEEsSevCrsXuicecGmqCDR95XSPbOBwf0tlFJxkGCoQN2I+vBugaaiA0Ecoo0fdpPYwcDZ/oH6s5Lp58v/UYKYWVSgJyHfy/evM2egLQJd+hzrjRFr8rikbJlEM35WcdPuQHj9zomrNQXIKVAK7hTdkGUD6Bg+FHRuoQMtRt05h/bG25htxhmw7E8lTf4dwjeg6+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEyP003UnwgPjMOxlYzD3lSo08tP5vIpwoXGTeG4J/I=;
 b=ta6u+HH4FXTQwbTloAav0Tv0BEkXWtmgaMtaV5tsbXmBRc8S4BVUBORQ8fkZeU6HtZk4jRUELn8aYSLixLPRRs7ACbLEd/x9paTE8RNWHXJ3cY7oJE/g2DIlgIYl1CVHt6OD91SAz1elnVcLo381Cb9gonqz+oRTnFwaVS/264VQP6CRHZT3IAas9axEF+yxQnSRGwV+62jyMot3QyKREjvfYColMowO17Sb/OxPhA185eE2/9LijFoAZoWRYDT0fWK7bepzUvQ2PqOE8whX1BLXGepteYUICd5XTAtYdIakCnct+J1ETp8/vIaRBJWBsar65bQ2oiGmxfY4AE8OzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEyP003UnwgPjMOxlYzD3lSo08tP5vIpwoXGTeG4J/I=;
 b=y+izEQKLuBfrj4x6QaUP7p1pHYM7iSXa5Kg7qXKyWrqiDaoIDgI3DcRwNNAlsIrJqBP+ujewDp4uX10R/z7UZuvE78Oy0hlxPSNm1rOjuAxWUQx7pawt9SyIFBy2jzc7f6kNByaH2PyY/3rqfgJuenPbOSPFouBCApLeu7SNOyM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB7455.namprd10.prod.outlook.com (2603:10b6:8:161::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 08:51:46 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 08:51:46 +0000
Date: Tue, 17 Jun 2025 09:51:43 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org,
        21cnbao@gmail.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH 1/1] mm/madvise: initialize prev pointer in
 madvise_walk_vmas
Message-ID: <c4496c05-8482-4344-8641-083050ecb6c6@lucifer.local>
References: <20250617020544.57305-1-lance.yang@linux.dev>
 <ab78f4ee-dfa4-4c49-8944-a67546a739ca@redhat.com>
 <291a3c4a-3156-43e3-bcb9-e0299d258e12@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <291a3c4a-3156-43e3-bcb9-e0299d258e12@lucifer.local>
X-ClientProxiedBy: LO4P302CA0013.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: f8bce21b-3a97-4812-f7b6-08ddad7c3108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?joqh5yvt5wlpbpX5f1E+R057RfjkdYMcejVAoaG17dWvK8SQfBED8LqoQw3v?=
 =?us-ascii?Q?/reRagafsNZNxK3fGplNxu/pBI73L/UX95g8BW03D2IJBTgO+0V1uO2upcjg?=
 =?us-ascii?Q?7FyzOKsWsoo1+T3mVFJ5smJs4IIK5pqA8yjdSSWHQuE3i+v3SL170/ZIqz9k?=
 =?us-ascii?Q?txqwFACIpn3YHe5lbSJTJ9+Ec6nhBVUQ3neL+h6IqfMnva4LB9QROvihaMap?=
 =?us-ascii?Q?YhfJhJBRbohxN9rq6G4t0S7esAfJXwd/np66EloE9D7kJQ2IkopfAt+unu1z?=
 =?us-ascii?Q?5HltwFSq9YtEk/Z0mknjedHK+mRExhYzaUJ+edN425PDNIo0Sksb4HC0Kco4?=
 =?us-ascii?Q?opIv4QwHbYy3NHX8ely8rEG76j1GI3ojPAJAP/cyd4tWDtKsUK70xZ8bHajB?=
 =?us-ascii?Q?rlBLW2q0MXhMKiNbMAwwVWBGK8qKLCldiZWKc9dgg9MaeYLA30RHQlSHPAz4?=
 =?us-ascii?Q?t146KM5UbfPXU0Etk+GqtbaykHD2ir4r1m82lRAylkdFiW7RuQOFGjZnbYKZ?=
 =?us-ascii?Q?pFzkQCi/jdKu1sY44CyBHlfvLK86z3OzioC8ljEmPC9WTdrfqlO2++It2MFG?=
 =?us-ascii?Q?yKxVx01IcSgUqmNIuIbb66kP+klJcnO1HQHkaN5MvsIJK7s6o/P0776WpmbK?=
 =?us-ascii?Q?18EVIpnqNeWQLjnNyZYheb9yZEYravhmftVLyl1P3YOZyTxYbuRyjGsTzIi5?=
 =?us-ascii?Q?vx1lS5eLVtwTyjLwPLgcJZ8eoxrF1ru4fCFd4BUinoCg+jAhB1a8OCnKpZPO?=
 =?us-ascii?Q?Zf8k2m+mRE+7TqihcQO3SjAbT48W5P7TNQmTM5fVcrGEo+tfzPoyY28F1wVc?=
 =?us-ascii?Q?YTCkPIkilbAMbz39YrdU1FtdsJRRuGhKjNoxyX3hCbUD1qgZdFtrJAZS68OO?=
 =?us-ascii?Q?9ZiNwW6grw9cqmBJJbPKoDAFU9e1uuf/BOFQCHDX1ILtvDeF3QRpgQ90AAwf?=
 =?us-ascii?Q?TAyo4k8cp8+Hr5L2maTk1cn1ouYWev/ouWVSiBGf9kGVwhjG8cmnrMNeaxrn?=
 =?us-ascii?Q?yHv2ov8TO5eiXeFHIovVLGLj0/0IrRZdWgkNMNz1sv4tCpcXWjivy/P0faaI?=
 =?us-ascii?Q?w0W7o9Y3j6RB0QkuO1lbv8geAycpXoSLLUKkSujJ9HHkGlf+zDX6oFZAIBjx?=
 =?us-ascii?Q?TO8EAU111aMERNbNagxvqQfDBS+CzqCXCmTm9B7sE7+1KuKcf9m6nSTlxAld?=
 =?us-ascii?Q?9ItT+4Xgn+qXPSjfv+WmDvK5m0k4e/SIwIsrDQ9ZYxgisVcVPVTYzA0k6w7N?=
 =?us-ascii?Q?UfvWCUmzoB7mkLyIHhRpJHwOYJr21Ahnt9RXQyXdk/XTbRvtQWXdOvH2rdIW?=
 =?us-ascii?Q?C0TP3ByUDLeqyYDJlRJnBTZCj94Q/uOBP1Jh5pOYUir67HoLyhi8nojG1aOO?=
 =?us-ascii?Q?qujmNx73rxQ2ntdWSBXky6bztl2ZXQTd+qOdLYTJYocx5/vX6TU+6tOxUhmL?=
 =?us-ascii?Q?NisZJqBKtBA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DNTfkY6NuN9Gjnpst4E055V/d1+Hu2MAnXnrEZ5tFdiePEdI4R+wuEZa4dP0?=
 =?us-ascii?Q?XSLCxz0WhvaKFz1P1u3MIQ28lJolpjfjgP2oKYMif40/ue3805/puSMmaHb9?=
 =?us-ascii?Q?QJ96ihfzWm4ENcLo4Gk1brtIgDlV/ijcYOsw4THRGbuDbLHzN8eq7wiLJav7?=
 =?us-ascii?Q?Dr0hp8ifwGJ8euzlSVu0KFpPrn+7ovVS2Uf8Tuh8HvYxWOf49yhMpQVO0gvh?=
 =?us-ascii?Q?E/u2NFl1dFCm9moB1N8fFtipRv8XIA3C19raWhtsB3645NyPmQwzm9AwazQX?=
 =?us-ascii?Q?b0UK5Of983lqJHIw6yvbuZGVHSuw4C5SVJaXKSeXMmwz8vGwMJhaPRsO9k/I?=
 =?us-ascii?Q?Uy07cVUlPpZCh2wxfdXylupf75TgWH7GvF3RIORpXbEiv7UQq6zKmGxnEJSf?=
 =?us-ascii?Q?EaMm54pmQdPuDEaZLQGXldSV/TKAEO1Wf4xzU7IiTc+MynXRQAtdumNe6Uf8?=
 =?us-ascii?Q?6airkOjMb66ybzuECD+2Bu4fpt4CM0T+jgA/X6K/JqCpwEXCgq61qHlKsMcv?=
 =?us-ascii?Q?UtReQURaF6ibNIx4jwOe59fzp1ZRYv8CwJXyUGQUwInjkGevgtFCjqqmUicL?=
 =?us-ascii?Q?pQNhh3aq1dMihSYrhpWfhEOUvraFl9IWi/fkw2D7slQpoeTmL1dL6jvIZe2N?=
 =?us-ascii?Q?QkLnpWW8GXw2VqFhmAgc7AO6SF1t5aJWmuCxAcBZhzDdwV63SHohGS1SStes?=
 =?us-ascii?Q?cOv0Vgt/7APLaxI4XmaQj7uCEZqsKxAxBaQsLlHyu8rl5EGULinA5Jc4oFn+?=
 =?us-ascii?Q?zgOpLw500R6OtDHTTqNF4jeOadOaTJKOy7agY+tsLJQEaLHyl5n8mPlkkFp8?=
 =?us-ascii?Q?Zhvf65mg5OfzbKY4Tl+DMPAVt42+06/rfP+QTCpTNefmE2rAgS0xuUh6oaqo?=
 =?us-ascii?Q?3UOJ4rSU8kdKJOXd/hl5mSXANoKqENeupkNcx3G0xEfdV8gNE7uyFHpoUYS/?=
 =?us-ascii?Q?N8tsUzmBXlVromhFnmIOeboJtRwbf256JvjKYY1ezdrhyFz5Bxj1fjK3IwI8?=
 =?us-ascii?Q?gawpDOvz+yteTv09NnBodozXnJKagvbtfic4ZTzJRH+6ec6T0kzD6bHnj+Ak?=
 =?us-ascii?Q?LsNnXKXiO5T2vf8dhBFM6JaM+kGxX7IfU+ipSTTS6ouXTj4a8M8LTZS/l0wc?=
 =?us-ascii?Q?B9dALc95/uG1T+nGKyPpDYmQ618ZxeZ35fDL8vyYu6LjhdrKZGIpmj02RFDY?=
 =?us-ascii?Q?J9cMFzuAbY1r1cGclHTmmUa2c48+VWUkmNYS3FlSIzzh6T19UrX3E+cETZ8/?=
 =?us-ascii?Q?7vsniSpm/sbG+t9QzUKa//28uszhxbYUeg3Ae3pnN9s26bj6MB/OjoLj1Wpj?=
 =?us-ascii?Q?qJ/HCWeKZNU1Mb1m2rvBps3tlFOhzlYjlKaO+TfbiGXyTPV4bbM1E2XRIAbm?=
 =?us-ascii?Q?mdeBB7ql8l5831dfvPu7OwB2/d23pZo+sm/CjuSVRgTFne2pC1CW4tVIFrCu?=
 =?us-ascii?Q?tahomiI9Xn5KlPCyT/6QvrqXKlHT1MUrT00t0XyZ7Ve/BsW356pctJCK6MUR?=
 =?us-ascii?Q?p693oyR6Sb2fdWdt1e/5KgxZBcSyAUXppgalEX4rU9OuAOSMRMXu0tu7BYpk?=
 =?us-ascii?Q?27c+XhNi9pAgfaPb38/sgweHUF8Lf4zvdVMNdniky4C/IPvbZAUvD5u3h5Op?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KoaCZL8iGlQNnBsXnp3Efxi951CupAAjvMHPBhZqXtqAE214oJQCdiFdPmn7bfufM0Zbs0qmZOurzLVV0ShU/Pc6A+ozlMrC0qFPe+1w94RI/CRYl/1fOf7Yb83UZcOlg7OswAhl6t3MBIeBWRRIiED0bffcrZo3hLNCAHJqee8aASC1u61STYT9GDpt8/8fvOwjA1LKHtQD6LlcuUl3QhNZw2Bs/SdJYIpax3sjRVy9v8uOBJ/2WD78ESTNi6zFT83yhHirUsmdwUQxoHgZerJsd+LAEVn68DfZZqqjfsQlp5d75DtQcxYpJ6m8u0pQQPFnBQna+sQzppRJqMEhguN/wD6XWOZOxRuDJuznIW92lxRuVPwunDIYRQMaahOyTgdfpvZQx1WNPvVnLXOxVghhrs58s1uW8Bfcz0vCdIyWy+86NPaQCNL/uYgGa6PMB0mBiErlbUjX/NZIyJO6cGKedHcA5jfpuvfoBlFJcHDlF49/HzXLl3sF8e3Ir0uBvdu/OOproeUXOSq+MHzaanl5jxiu2vTUErWM0/ez1ttXrTsEXnSag/YdIbB3pap5cOJ7EKfj2qfhx8hHE1UXvl+C3kW6ScAsItEgLdQSFos=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8bce21b-3a97-4812-f7b6-08ddad7c3108
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 08:51:46.7367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dztuaW7p+cdq7pCq+6Wh4N9h+dNiE5rto+YzPmYcv3ORnqB3Gw3qmQI4FcbIsRUs9rg95+/ZZrt7Zt5OeOKf43frSW6DBA798I6bbKrbNlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7455
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=717 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170071
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3MSBTYWx0ZWRfX2V2wF4XPRLfX NY2jGVjjNJTwa4KwWvkJE3BIsRtMCqbBtHAfJDQaXxgoInlvWF7OoEm+yzLEoSd7d5HjoYQRVbc hoiDnuAZA4N87IVCcg6oReX6ts/pTTNhhe9ArpB6BvO1jfpG/JtQIrESnTD/kimB2NszzlhPwRk
 gZF94S722SgCGEp4h4j/ps0CnSmneH/DApaMfQ6jhW2+33/3LK5hGvYOjC4MQrn36nrB93H46a+ CC0RsI3oDOhhgOjtJ63wdxl9QYHPWwvg92ZSBbUd3oJevi7OFf01mwu5LPRq+lLp1jc4SYVDyDq kSPfHh1uocImOCFldCsfW/HKH7DFCgZmmSrTOjK40NnWL6cEUL/a1WNtvXsGPXB4DYNaUY5Eemi
 R0E6ts/Jd5kz1OG9dZCAK0kfIsT7Yeww9Z41JuDbdbsGqqx4N1jjXJEHVGWqxVKPE8l42bPw
X-Proofpoint-GUID: hhuvobYuEJ6FNNQUJMe_w9HTdTGqwtdY
X-Proofpoint-ORIG-GUID: hhuvobYuEJ6FNNQUJMe_w9HTdTGqwtdY
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=68512ca6 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=Mpz2cmYGW1irdWOpymEA:9 a=CjuIK1q_8ugA:10

On Tue, Jun 17, 2025 at 09:43:06AM +0100, Lorenzo Stoakes wrote:
> On Tue, Jun 17, 2025 at 09:54:29AM +0200, David Hildenbrand wrote:
> > On 17.06.25 04:05, Lance Yang wrote:
> > > From: Lance Yang <lance.yang@linux.dev>
> > >
> > > The prev pointer was uninitialized, which could lead to undefined behavior
> > > where its address is taken and passed to the visit() callback without being
> > > assigned a value.
> >
> > So, we are passing the pointer value to visit(), which is not undefined
> > behavior.
> >
> > The issue would be if anybody takes a look at the value stored at that
> > pointer. Because, already passing an uninitialized value to a (non-inlined)
> > function is undefined behavior according to C.
> >
> > In madvise_update_vma()->vma_modify_flags_name() we do exactly that,
> > correct?
> >
> > 	vma = vma_modify_flags_name(&vmi, *prev, ...
> >
> > We should use Fixes: then.
>
> A note if people were hoping to blame 94d7d9233951, well before that patch we
> had:
>
> -	*prev = vma_merge(&vmi, mm, *prev, start, end, new_flags,
> -			  vma->anon_vma, vma->vm_file, pgoff, vma_policy(vma),
> -			  vma->vm_userfaultfd_ctx, anon_name);
>
> Note the *prev...

Oops I didn't mean to send this one ;)

>
> >
> >
> > Acked-by: David Hildenbrand <david@redhat.com>
> >
> > >
> > > Initializing it to NULL makes the code safer and prevents potential bugs
> > > if a future callback function attempts to read from it.
> > >
> > > Signed-off-by: Lance Yang <lance.yang@linux.dev>
> > > ---
> > >   mm/madvise.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/mm/madvise.c b/mm/madvise.c
> > > index 267d8e4adf31..c87325000303 100644
> > > --- a/mm/madvise.c
> > > +++ b/mm/madvise.c
> > > @@ -1536,10 +1536,10 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> > >   				   struct vm_area_struct **prev, unsigned long start,
> > >   				   unsigned long end, void *arg))
> > >   {
> > > +	struct vm_area_struct *prev = NULL;
> > >   	struct vm_area_struct *vma;
> > > -	struct vm_area_struct *prev;
> > > -	unsigned long tmp;
> > >   	int unmapped_error = 0;
> > > +	unsigned long tmp;
> > >   	int error;
> > >   	/*
> >
> >
> > --
> > Cheers,
> >
> > David / dhildenb
> >

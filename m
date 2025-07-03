Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81A5225D6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 05:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751522118; cv=fail; b=Il1MQ6+rovBjBCdrsk0kJHWNr9QVw6DI1mIXWoqsaxykMbrFrK7yNWqFdPOonARWdQ+Gi1pRiu+V7doP5TeInPuob4aN0U6GXYfirzHDbmKzwm67XojvuTwCsYqoDWrosl8tiTX2cnNhv4wX9xBO80P5Z9TSlQOxEL/Oz2COFBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751522118; c=relaxed/simple;
	bh=8x+SyQbxTWDLs7yJt2SpoZ8DpqqVsSCH8uvzw6+pK8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D/HZDL1uGNqvQEea9o6QTgUeAM2DBHmohYp05YOa2RUVTv50Qr5uQj8xXppf9CVPmjpMnIxS2sSSx+TDULAPn/jnt3++xnks50PrBXquuMXT9yu+7ont7RQr/8vKj5Axn8/Mp/u/H/Cs84pkcRtnacb/SnOYqyWild8wJxirYh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Aw7cnvML; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mKDROO7v; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Aw7cnvML";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mKDROO7v"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562NfvTw018375;
	Thu, 3 Jul 2025 05:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=3m3inVmipNZMNtjYwB
	DOf/f4wQbuGLMMvzgALGQy+FE=; b=Aw7cnvMLfUIaYgSPZRQjDPeLkbAOgkMJpP
	hOjFN9LHW+nj+6OYyt0OFPZP+gLulTIFqn7t71rlmcDrfsRd7BibruFjZx7f4Tg0
	svZ/YIhF2KwXsFY5dC0rl+qx0kUffmYNAPuGxJePJX/u3l/J/zZgGPENl7kKwPLW
	gPrxuOz3bug7tUI2WtRu23XeY/UlK8TISnTPadMsgIaCQgrUKPGMg92ZDAe4VWuR
	otFLGIya3cOaEe9+M3Mk6p8mmMlIOyQJPtvSECJzbBrNDb2yS7Oae7keyUumTBP6
	7k4aKeLdCby2R23JgkPrT/RRzR71p7A4xRJjy8gGv3zC+hohpc+g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tfg9dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 05:55:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5634MWJW019568;
	Thu, 3 Jul 2025 05:55:04 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ubx2mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 05:55:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpGYhDm3uogQmaZ8agES/Trx5cT+pbBJD/YZe/4pfxiSmDWbK1OCxJPrq6SY3llILmhxYR0dHOF85ibob8ZdI8t2jrfFS5Hpq8PWr1E+eZhFENjI/l1RSpXatDixQ8izCQ5FjDLXcSZsmL9C7SHusNNs3mKS6vyaMANeIjlefw3Ckg99M51UR2EUbQd+f+zbgTcsql1goPBHwh6a9+MTaBEnNQL5TCja4eDNbzaqaeLDusgj4JBS/o2G4Ah5Mm2XUQqkyPZb5o7PMDB12XPRqjbBGWxfm/l4R6D2j/0YTjE8/9RmLG6cEHd0oqJSwsFezGXygiNB/pNFRZU/saddaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3m3inVmipNZMNtjYwBDOf/f4wQbuGLMMvzgALGQy+FE=;
 b=dT8CH8hUJxVpq9ml9ijLi0ApNCSKtpUFqfXb+bo7K129KGmrMhc/Rvq3fAfi6Pg+DEZ0UlrO/KZXTe9EhnXSa0V70upNiviZ2eU8pCsxzGDcQYp8MYfNi9Bvtahvv+JYPjNftNexRuCjoC/f1HNi3ZM+0CZQ9ZK9KMYj4ocqI9gK3rFLjNNbJ6kHHw9RtfcAeuExV8C2Ryr8DisdxYu2UZqmNCr6XVMaD9s7LALwJ4OhOFKpmV7r+szEXK6gRXeHd52MvzqmNe0lQmJJkjLtO+HawCaWdHKsvbhgtqMOYifKpZYnp1ohSfVfj2HKb1jO7VcVRCMjg/cdDeLquasrMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3m3inVmipNZMNtjYwBDOf/f4wQbuGLMMvzgALGQy+FE=;
 b=mKDROO7vqOsBZXklm8vC2F24YggVgMxXKUDkBuzmFNZuFHOIXY1SVM9LOzWX/MhZAmQnjsbysWuQpIBMau1s2xzSP2do8NSc60Q+p6K0bwn1tecX0mVVjXAdS2GS02dn5DwWAkDe8IEBD9ntBKg8VrYYWFjWl1Z31V05NI57ius=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by LV3PR10MB8180.namprd10.prod.outlook.com (2603:10b6:408:286::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 05:55:00 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 05:55:00 +0000
Date: Thu, 3 Jul 2025 01:54:57 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, richard.weiyang@gmail.com,
        maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] maple tree: Add and fix some comments
Message-ID: <5ujw5k7z7ybboxoks5idc4cwxxmafsig32spmh7wddi6334ami@qpf7dm3sacsa>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, richard.weiyang@gmail.com, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250626171918.17261-1-dev.jain@arm.com>
 <20250626171918.17261-2-dev.jain@arm.com>
 <bxhfvhmk4iyyz7l3nitsgf4xgsydraskligg56n4ww3fe5zlvr@xqzh44dk3q5b>
 <2d55c06a-f4a5-4728-b692-60d88a5fe692@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d55c06a-f4a5-4728-b692-60d88a5fe692@arm.com>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT1PR01CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::17) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|LV3PR10MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: c14aa352-748b-440e-ad60-08ddb9f625ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DLi7/oNvJeD+dhe+k5uwvEEjQ9lWaHZLPeYAVWYjsCh6bTOjHRGr73J7dC7C?=
 =?us-ascii?Q?3jLDbscqPrIKfVTdPKZ7kHkUUa1OtpTWfO/nawX+3vAMaom+YUR1VSEZqsHh?=
 =?us-ascii?Q?f/x/c54x/BpK/prmw6nvRtYQAQlRKBxZOsUPMbhluOXkRxQ+tjqS3kZCK2n8?=
 =?us-ascii?Q?KKL4onuhmCRa+BBwu2y1CqRTXoyW3ONQkPK8TOKaae6SpB94I+cUYq6R/w14?=
 =?us-ascii?Q?YPozqfWPhi0FA5IqHEv7p4Qibwm0gIRhAF7PPVBFap+1npHDXJBZdJrkx4Wm?=
 =?us-ascii?Q?yECtEPJMXHr8lwhlaw1GvaclNNHC4SYlgjli4gkrvQ//hpfVSiN6HFBGuc2P?=
 =?us-ascii?Q?CmY29e4dPHmbsS3gDr31u/H/789czvFiiz2GwXWct7dkuNxigBp7Mj5fJzAP?=
 =?us-ascii?Q?J0kNCe+1wkRRkdq8xRXxkAFqCjMHlrt7L2W3grkhy5L+IQyaDFKayy1tmg8m?=
 =?us-ascii?Q?uriYQp9t5++MJkLQTamduNWnM0bDKuVk8PMPxNTCINSKJxwq0t5lOTZVLRX6?=
 =?us-ascii?Q?6hJKtkJBzZxvxU/FGvylNpRd3/yH3rxf5yWu5Ukh8+i+IQ3LM6CWTWLVuzOP?=
 =?us-ascii?Q?c1PBynksra8rbDk+CMFjHo0sCiZIjSOC4M5K3Vg3lZv9z3PKvtgZGHrMyp/T?=
 =?us-ascii?Q?qlv+NnGCpbyxCVRvijNtfIeRpI7w8z0475EclP/aDF0fD/c5fkWeh/tp2WSj?=
 =?us-ascii?Q?fIRbBJRo3Mk7D422QfeAJf7SSBqKYNw1TBdZwZIySpK1vxYxOccfEFO7XjTs?=
 =?us-ascii?Q?1aTy56Epxt+EfvFFI/VICH5yHH0RQ6uZDprGurTum1ysMDXTbo+Ws7zO3GX9?=
 =?us-ascii?Q?q8ALntxYgul+BIov0Q6PC84H6DS+bssIZ4/Odk0IFvMFSj6Sxc0LdytlmYnj?=
 =?us-ascii?Q?2aIMCL5jrqkPYT5QJok+unfWes8dQd2A4bdTWiLsf4RSybbqx6RVczGsjeSs?=
 =?us-ascii?Q?v2CGi5HAEAuzyinkrBbE5cVbEQ0ZIwQSK01knVUipyPoph3lIWiSTp+87M4j?=
 =?us-ascii?Q?Vi06QCv777OzGfJD2dXk+fTpXBRYyqpMfMN6xKtI8Illkfvtd/4KEEauf2kD?=
 =?us-ascii?Q?niEFcGhaBkoJul48vknmBm498Dl4NQmIJC4aBp3D6QqTSTQDL/+Xqx6S3hSb?=
 =?us-ascii?Q?nB3+CDhryDXdT4+bMlXW4vZImTb4xSWi9vz4lglEuy9ZuCEpc4NaQJSGnYed?=
 =?us-ascii?Q?92xZm6HOZ+M019PDp4JJod/M3nLK5aIyNNVSbx+HbGM+itZDs+OaRO9S1G1p?=
 =?us-ascii?Q?07J//B5w6zDmjlRTd16eAeq80yld7SKr3B39Lyl7/vRB8mMeO6eHBlZjldXz?=
 =?us-ascii?Q?DmW4+VNprJaZ8/ZyuWdP96tkudREnBt3fNNniTyYAdld/GVPCW/YQaaizJvi?=
 =?us-ascii?Q?MFG2oFwwOjhYMknOj5mA98i7Wdi974gSfZeqccSTAzxuo04k5h2kgLgfaj7Y?=
 =?us-ascii?Q?8SycTZJIUYg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zNaSluk48Q7P9Q5/LxyOetwXmU5kx1SEfTTXa4VvwKUwHkLyI2yTupCKr9wX?=
 =?us-ascii?Q?WMV9s+kCX+SX9BliQIx53zsp4Pma9+IrM3R0kCe29z51VJMs/OT/IQSxxV5B?=
 =?us-ascii?Q?n3NLo1/OIrVtaEmdd7KqutgTOXX6n9n8Rg/DAYnJlOm7XV0eIQX8ASYy4YEl?=
 =?us-ascii?Q?ZqoRiCvTtwY5f/QmLIH8cx8HOtfGpFnmqQmsYuRr6BObW92d/gMho8xjq/x1?=
 =?us-ascii?Q?lpFSmGibM/vT6Mje7kSTxU3L17CGFCjMtxrnB8DtrZ0W1qyechyGGBo+JPek?=
 =?us-ascii?Q?FudsIRD9SxzDgqSzXuctmmA2G6p91eFNnV3VNMRD9kegaPOcRVvUtU3wjKDZ?=
 =?us-ascii?Q?Cud33rSrA8B5K8kH3p1pGST4PVvGHji7jAbXZ7Q/zj8ixiLh1iwK9WsRfID+?=
 =?us-ascii?Q?74tU1YqeuXq5IIM3mksC9A0aBWlvxDDBtmcdgxZbVZ0L9zv48nysepswfRml?=
 =?us-ascii?Q?z91P4rI0LIQN/eolnIJe+BelaKGxTGRC3GPeizVlN56tKO1dBPZfmdrO3QY/?=
 =?us-ascii?Q?c6g+9dtgEpD0piqOLtEcV4xOJL8nZEHCEULK0rZMfxsbHPJl/2VIp54mylmM?=
 =?us-ascii?Q?TKfZ06d9mtn90S7WDJ6AaePe+bpi6o+Bjtv46qbBHt80lpihXQNDgMyt2Jra?=
 =?us-ascii?Q?6ix8iLIyyE94C3oeL8Pu0RUS704BOvNafSfxW5si7sMEI5RR6ECf3XD6dz2E?=
 =?us-ascii?Q?q7ItEIgpR6o1KM8xMHUJnMXma32j75wryNiAlDherQ8kt+NlP8Cz3Yciu2b4?=
 =?us-ascii?Q?uoQREu9HqC+MrwUOSFBP3Du5Ir3SxPISaGw4E2Ol10JCoPvtNguBzvAk2jR7?=
 =?us-ascii?Q?HqZVhLRzv5naOUD/2ksvD2Kf0F2+2paiKWW/X41rOjJ2zMFbh+fVqtWv41j5?=
 =?us-ascii?Q?bB0VpR3g7NQGXj42zAGffVzrMHN/KIm+WKr7Hnx8S06ddgE//F2rx+C6nIxZ?=
 =?us-ascii?Q?0fd2jMa1zQXJRuAQ75Y139jc9bMZ2pFqdUbv0zi5X+jnE2BCsmejMaCbRZVx?=
 =?us-ascii?Q?JbPY0XGBIEIwPtAFYIjmBHXdutC7vw0w9V7ZB3jUr+s68CfxjdrqXNp5QfV+?=
 =?us-ascii?Q?1UB4eQY1XZdDWNG6GqUChzziGI6MZzbTZCXWs7grJVqmb78X4S5Qkuy3Jrk4?=
 =?us-ascii?Q?LFNZZijtv0ibhmgGsSFjU/CAl6+O88KvhsCYVQAM4v8z8uOV5PJPBS1hMkgW?=
 =?us-ascii?Q?sa1Ih5AWmau0udKIOTDh6o5ikFwpifytmXfZYuk4HWEbM0dPIWEJAgDj8RWg?=
 =?us-ascii?Q?osg7duah40+10DNWijLBsz/EJrGq4Y2MttAbz1PWY+4gx1VWkgPknb7awlXM?=
 =?us-ascii?Q?ZEsLKCADyqYfUqobrGMxGjqayNuXPafrTUmAkPm36sXEoomqSdrXLyrZK21C?=
 =?us-ascii?Q?7vi7DuVsMRP05EVNk6G3mEdwPqB/yH0lqZXWWSFsoTYkRTEPlHWKNObfTn7Y?=
 =?us-ascii?Q?I/BxhQNXWMFsyzgtVOWhMo2x4wcTJgvuEv3rlkePzJzaJoCtfVw13SeTsw2d?=
 =?us-ascii?Q?B4GiHT/+3tKcJpNNsq11CL+ih5Sm9PrtA8IukSLUknoh7iZ4JUIfMqQ/cy0O?=
 =?us-ascii?Q?51RXk0uCsDcp1udxeXRgu+L9xR9qOUUNNdknKI/+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Vc1jkFxAxKTXd5LwNVmlLZktdEhstMD4SAShHtvpfKZMnFrkDugQoSPW/cuYSudJ/otXaRFd5Up66RGkePp78qTM72pPqY0E17/xEVLD/lgeoDp3jSxHkkGBX7RyMBQRHWamR/FY9t5i026tKfXKyFNHmGIJDMlom7TQ2dqUtmCUaNRxBay410/s7MxsCFSG5l4CAoWJeu9/wrTYUL8rgNYydmt4gxAoKbpeIY/H8IpZfBshlG05LOezH9OMzRrodiX0PuViQwtdZRGmL6ttIhLsmgroBZxfolEw1yn/eqytCOlWMglBLOgXbRrNDRqYIVyWl8hJr4v1p+cotjhIuuq5T/K8fcJXCMyfICDJbzyB/W7rVf8C0CoiroIJ8tETOdRCiIOwfIIKTqYXyawhF38XKeN9fmS1ZbtTm6Afq3A1SKZ8PCvFm4hWGKdel7eKG/qXyDWU0joi02CTOfNrC09fN25kA8q39GqsPzicJKT16mdlz86arLFZa1AMAOkWJiu8Nfk7Jiz8CtxxSIj77xTKuvLugeMpHy7pmWTqgPqQdWpymOuon+yL9baRF6yU6TNNHQovui/bZ9p2cYssFO73yoDThIDOd9/6/CGWtpM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c14aa352-748b-440e-ad60-08ddb9f625ce
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 05:55:00.6591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mZR7bHklrx2oiLgNRYjPpFnHO4NDYOTbbbM5PGCoYcpYYS0QWo161cBxUhcqIpsyYIlVaKd28bW2/5oNa4duQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8180
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507030045
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=68661b39 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ag1SF4gXAAAA:8 a=7CQSdrXTAAAA:8 a=FpmlKOywRf3AmchgIRwA:9 a=CjuIK1q_8ugA:10 a=Yupwre4RP9_Eg_Bd0iYG:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: AQQP6G_ufL4hVRe6XEiJCXhF9_gYyScA
X-Proofpoint-ORIG-GUID: AQQP6G_ufL4hVRe6XEiJCXhF9_gYyScA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA0NSBTYWx0ZWRfXxTPjUr2o5PQ6 3/wHrigyhi5rk57muZdHRvRl39LPv8smOFQo5snK2WhygI7AGkQNJ3Ou4mf91fSx2ninQ2UiiTf nxYzJgfRoVmYu5PwOzKO0PiCAg5+4IIwTAhSK6rHDO1MWT3azx9O/d43hAXejbEfxUES8J/RAuy
 0hT6APCV5DVp8MGRdyjlpLinsKvvyf/xrmf7n9nVELD/tUGINb4TXSBWtd0w2fsZ5wMsR5569hU usAzxYhgfKb0Ekjhdr5oaWkQSZAKsAFbCZ3i6PgOABNIt/VfUMHwpn5mGVEqjXDTWDQ+WEX0vff DNQw2TXR+1H4E7XRc/FKXomaFuntw+3S5Lxl+UuNiz2JWJLVfEqTta9iOni45THTjiOUOSXlW7u
 i1INbFD13WOYZ3Bco/EeAu7dPrBBbbwTHY8yUVtMz5eeDzrF0K4XrF9ZwkhkCv5s2WQS3TPN

* Dev Jain <dev.jain@arm.com> [250628 07:57]:
> 
> On 27/06/25 1:34 am, Liam R. Howlett wrote:
> > * Dev Jain <dev.jain@arm.com> [250626 13:19]:
> > > Add comments explaining the fields for maple_metadata, since "end" is
> > > ambiguous and "gap" can be confused as the largest gap, whereas it
> > > is actually the offset of the largest gap.
> > > 
> > > MAPLE_ROOT_NODE is used for mt_mk_root() and mt_safe_root(), indicating
> > > that it is used to mark the node as root. So fix the comment.
> > That's not quite the entire story here.
> > 
> > The first pointer in the tree may not be a node at all, and may be an
> > entry.  So having that bit set tells us the root of the tree is a node,
> > so the comment is correct but maybe you have a better way of expressing
> > this information?
> 
> Hmm. Can you please correct me on my understanding - when we have an
> empty tree, then we insert a root and can store a value there. Now when
> we store the second entry, we allocate a node and make the root a node,
> the root points to that node, and we store the values at offsets 0 and 1.
> 
> I am reading more to answer my own question.

Not quite.

If we store to 0 of size 1, then we can just have a pointer without a
node at all.  There are a few scenarios which can play out when storing
the first entry to the tree:

Nothing stored, root is NULL, representing 0 - ULONG_MAX => NULL

There is a value only at zero, root is the entry, representing 0.
1 - ULONG_MAX => NULL.  To ensure that the root entry isn't detected as
a node, there are restrictions on the entry value.

There is a value only at zero which would be confused with a node.  A
node is allocated and the ranges are stored in the node. 0 => entry and
1 - ULONG_MAX => NULL.

There is a value that is not just zero (and may not include zero in the
range), then a node is stored at root.

Read mas_store_root() for details.

As the tree grows and shrinks, the type of node stored in the root may
change.  The root may return to just a pointer or NULL.

Once there is a node at root, each slot either contains an entry/NULL or
a child node.  Each pivot defines a maximum for the range while the
previous pivot (or the minimum of that node, starting at 0) defines the
minimum.  So the [minimum] = start of range 0, pivot[0] = end of range
zero, pivot[0] + 1 = start of range 1, etc.

Nodes do not store the minimum and may not store the maximum (if there
isn't enough pivots the maximum is just inherited from the parent node).

All ranges are represented and present at the child node.  This means
that ever range will walk to the leaf node and have an entry or NULL.
B-trees require everything to be at the same height.

So, the entries at offsets 0 and 1 depend on the ranges stored.

You can see a diagram of a node in ascii at the top of lib/maple_tree.c
as well as terminology used.

I have tried to keep the developer documentation in the .c and .h files,
while the user documentation is in Documentation/core-api/maple_tree.rst

If you read the start of the .c, it runs through a node layout.

I've also posted an overview of the tree on the Oracle Blog [1] and
given a talk about some of the way the tree worked for the Linux
Foundation [2].  You can also find talks at OSS 2019 by willy, and lpc
2019 by myself as well as 2022, and lsf/mm if you search for 'maple tree
linux' on youtube.

Hopefully that helps.

[1] https://blogs.oracle.com/linux/post/maple-tree-storing-ranges
[2] https://www.linuxfoundation.org/webinars/the-maple-tree-structure-and-algorithms?hsLang=en

Thanks,
Liam

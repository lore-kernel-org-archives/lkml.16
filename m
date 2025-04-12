Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2623F80B;
	Sat, 12 Apr 2025 13:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744462923; cv=fail; b=tK+6scgzb2XDyQk35m9HJGDU3JYjoUSMdu6z9xPYgs0qqN5AsmyPGe0J/pRZcQgkY1RjhfcfCsFip60TJHzX8hgxAVdXFds7u3zSaVWH7RD6xndpUNx29BhM4x+kX65YbzjZfuQQhvYTSCNHl2cZwFXmZivI6VE4jTGuIpGIoJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744462923; c=relaxed/simple;
	bh=kcs9KL+S8Ur8+zOU2WlOSb1nBomi11UnVDwyUNCcO/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nMZ5HAbTWKJjeS93kj6S1UNQqQ3xyEEo+HWPIfaIprcsL0gSoE857rxxN/OqS5NKh3RyFiAUU/xQpO6uP4kWykuUWlc92CpHIGxG8Knby4MgsZAjP5vWpDdmXpXNA7KzJqx5zI0jJEHMdeW7Aout4sXgmvr+XTWHGp8j8yqWmsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Xws0G/7p; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Mw39Dyeg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Xws0G/7p";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Mw39Dyeg"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53CCs3WL011766;
	Sat, 12 Apr 2025 13:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=MBW4P5CgReyc2hag2D
	koxSNtfMsj8sNqTlQvpe1qHzY=; b=Xws0G/7pLpmp4TtQ5CdQZXJCZhPL1oTzDK
	APWhYpfAIKVKyaw3Uxai4UeuZNJeClRxEThuukF3Edd0uSlHQv0NxBNWOeIs3sQl
	RvSnexKqX7aR4QEM03gzPdcfUQXM5SM2zvAY9mhyFAkVxXYWAZbnIeFHL/fMtR5B
	p1MR7En4+quNew/dmrvZGkUO2jR199jlXnartkBJ3k4ukcsYmGqWVz3lTsvKWxTe
	xIw5W2u5STh45Qo/qe03p1CU0aHktJLrSaX6r/00/MaISmPTIUhoqgpQGNdAd8h3
	4cU7tQAU+bEpTuecsgyOKLOAetXjB3yyvEcf4qjAAUe1pWJuFqwg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45yrj7004x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Apr 2025 13:01:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53CB4lHa019912;
	Sat, 12 Apr 2025 13:01:40 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17010000.outbound.protection.outlook.com [40.93.6.0])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45yem6bvbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Apr 2025 13:01:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZotp6rhgDTSeqMN8xCEiUpaOl2goSXMJMzeBO4MQqyzyLz54j+Bm1phS0/OSxbkmmiD2hwjiOUxkODnLje2NGfUgdorV0X69tdMYxoCiePF3RCrPPH3PUIDg6FEsm1FuqmYUIVJbM9jvd4zSBLSf22FbZEIOAhFn2CkOcE7J7h+A7tcxT38bmcmsTD9a6EVRHZqmZkAnRUGlnq2tgqkQe4I4beDsh1y1arrBiTLw+FogeSW1IKHaKtpFXzFkHqRBhcd3PfxIdt52ltJjHa8qzO6yvJPiijpxbAawHtMzYVsiyUenZqZ8NcQIVFTlC76z8MPH3Zj2Gvkf4hGRPtjQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBW4P5CgReyc2hag2DkoxSNtfMsj8sNqTlQvpe1qHzY=;
 b=lF9xfIDU+4nk25YmSdVqtySyqVfQUYqljF9D4b0+STUI7Vxl2tWTYlcmeIfHZPCdH+P8xxvHwGuy3TyjM0jxcoZnqt5qTrpCyrpWOxmcbvtEOfWMY25aiOfLKU16yY6+VFWdCp73WRcPwz36Wd/uWrO5QERWKpfOfhynqBBNnSKkigyZRQ914brZiwFR0bGFkWc1drkNZFIyuATliGvNZhi312rnsPHHkKfZ0W4SDlE4w/jpo+Rc6tsIyswvcnoHwZOfynxt7lxK2ln4SukrBzbS8zdJbT6PgTGYyPhqUBZ/6hCnozz57HZi4U7dJqNnpqWBAsKn3mCFXZA25tOPDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBW4P5CgReyc2hag2DkoxSNtfMsj8sNqTlQvpe1qHzY=;
 b=Mw39DyegW0WDwhcp2zmYmBlisqXPfbK65wC3se3B81ebKRpDwrR7UZwppvZCQpr/4Y1Apr6Ch9Z/Gh/stTurxhjrYpg//Ic5XV2Zo4cJHek/rBZrqFzNVoMgyHkliNoY42qtYYhNL+7CmPHp4txvccU8HwuKAuDHI5DZqToa7MU=
Received: from MW5PR10MB5764.namprd10.prod.outlook.com (2603:10b6:303:190::15)
 by PH7PR10MB7105.namprd10.prod.outlook.com (2603:10b6:510:27f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Sat, 12 Apr
 2025 13:01:37 +0000
Received: from MW5PR10MB5764.namprd10.prod.outlook.com
 ([fe80::8d9b:9200:a7f5:19a9]) by MW5PR10MB5764.namprd10.prod.outlook.com
 ([fe80::8d9b:9200:a7f5:19a9%6]) with mapi id 15.20.8606.033; Sat, 12 Apr 2025
 13:01:36 +0000
Date: Sat, 12 Apr 2025 09:01:18 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sascha Bischoff <sascha.bischoff@arm.com>,
        Timothy Hayes <timothy.hayes@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, ast@kernel.org
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
Message-ID: <mcyioyevok6tixna2xwk5q3d6x5b5spyucc4fiiy3h4v5jwxbj@bw6ewonqm2ks>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <Z/jgL52ZVdcxTEkP@lpieralisi>
 <87plhjrpit.ffs@tglx>
 <Z/kM/+uBsD9DAGjF@lpieralisi>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/kM/+uBsD9DAGjF@lpieralisi>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0140.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::11) To MW5PR10MB5764.namprd10.prod.outlook.com
 (2603:10b6:303:190::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR10MB5764:EE_|PH7PR10MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 6baf3773-68b8-466b-c5d9-08dd79c22868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r0Z97WhKbyM19aX/OC7LcmRyiLr9RZJL9x78kwPP6ZGvIFkeqsAFOoyJ1Eu5?=
 =?us-ascii?Q?VzQ0B5s9y7QR0Dykkg70/7m8Jp5S5ebugkfHGhJYkbjyrWCKEIxbh9oJcG0r?=
 =?us-ascii?Q?UGLEziGW8leEdjPLo7ycaEmiMGMRwiScQY/IiZSNy5+8G40DtKg3JS7Ok65W?=
 =?us-ascii?Q?tLzIjlzQxH6LMEePlNGTvpeeWpOpGDHdGAZDsr6N+8RA7MOBOhKDdbXGAL4g?=
 =?us-ascii?Q?5vh+aVUaV7O6a2h+L0D0Ph0SD/+Q0ZwB7WkLKqbACsb/NCJeiPU/TUJA2HGg?=
 =?us-ascii?Q?elLBMLmdwMQPixsc86lmQaEfcMaRHM+SEk7pjg+8w9H/3OQ9cj4198mXUhsb?=
 =?us-ascii?Q?JkGmHobZ3uuNekC2hkdSRSIWtrSwACYDq1tlOPTrmPzhHTmZaj1LFlBqw0fc?=
 =?us-ascii?Q?36KFJqxMjlDU5qiNMLCEDNkUM7tS8lIaU4ZkdbL8zUNgCD9aiYiWC6+JfVCU?=
 =?us-ascii?Q?Qbr0LefvRrEZ+hj49GOg6VRwNBTkg/bSJRpTwSLiz8knsbRrp5YBwyfRLQ3M?=
 =?us-ascii?Q?IpgKb2v11ZeXbX7AhsXOxHkGvaPejj4g3vyBr+h9hQCIYYxsUizyG97fo5x8?=
 =?us-ascii?Q?45BAqhyuy9yBmcx7rpwNC2xWij0e514rIO2b46yE7EhhqOk5lzJNQXjYbQ2O?=
 =?us-ascii?Q?SUx4Onq2kAkLu4d/c1zFM2fF6Tf549O/rjvKX43Oy3WevTcgS74Vcvh1z4nE?=
 =?us-ascii?Q?/3m8W9F60F4CNeCnx3fex2ED2oAMIy8vBxs/RdwoU3gg+sA6m3i0w330w04n?=
 =?us-ascii?Q?Jh8hlsUURpeMpBcez+LzzreVMVHNCmjAURXqUgfsh8LZOWCiEfabp5r1mL/m?=
 =?us-ascii?Q?zwKhNedKhuWukbj1Y3pIk15db8KRbZ3rgnlkBHVTX1bcYLyHLNXYtZlaunfB?=
 =?us-ascii?Q?7gv6AhwH91oRYnxUoO7mU3bWyS4iNRX7gjgeRLN289LhXSn9/BGg9Fk1tEkK?=
 =?us-ascii?Q?721XiiD/HLTbAHKLLxQ50mK8w6VRdkFY/cUo7FeN8WInEA3ta/mdOJkgvIKu?=
 =?us-ascii?Q?W6QUZ/vUbU9rpK1KensVZjJ2uV/fh3myOBXBIVFmIPKPgjcGMf9+KuvYl+3E?=
 =?us-ascii?Q?60sk9vnyUNV1p6Ppu97AOAZYB03v1d4ML859ZM1piMOwSzhMHC2MUtgKs85f?=
 =?us-ascii?Q?zISPwXPvVriA6LhRfo/dQPOECgg55cI8ZsrrHWYNE7gk6bTP14Lo/zq0IlJ7?=
 =?us-ascii?Q?xmnHhT9przgInCoGlCxmN7c46So5BlRo+45kSXmaF4SycgI01W3Xyukb9zTV?=
 =?us-ascii?Q?vXO+592MWEt76NX8uhfpEQwCAgWFRqmW4bUI6JidW3zSwJ91cT7itBCgtzNF?=
 =?us-ascii?Q?hIwoKvghP1x68szzZproQH2TDDnohePLQEY5gMi4YoARlFO8mYwi9zCbcHcD?=
 =?us-ascii?Q?K5/vwiSsgAgdYuOEqwAqfQCVjUQrC6j9OTNnIYOGswHXo1iFIxqCZJFz4mgR?=
 =?us-ascii?Q?QYkRk8IZH+0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR10MB5764.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uFZdBt3geuqHD4B3QkxeZpzNeO0efLHP3zB0fSCz4TJZS6IcPbBxwD0EgQSW?=
 =?us-ascii?Q?rrjOS0mOefSAdY77di/I6lTKCDLFNweD0x747CrXU8JTtcS1hCBBgQtAh+Dr?=
 =?us-ascii?Q?coQPm3DE4QDHMeixHs2/emW80qM4hnwVZO5Rqidhy4hE65GHYnbaKi9nDaw8?=
 =?us-ascii?Q?8Y3YK7ELTCCkRcEiTi59BNI4zMngH8j4vCtret3x5tbxbuEXpTuTwDNtVZ+O?=
 =?us-ascii?Q?zM9ZIlUOdnR6GtYwTfR9pDcAo8oG92SiPIO5hp+TbJyRNIEDzNJHS6jlOZ6q?=
 =?us-ascii?Q?JTToCcPZ63Wy4dpNEvH0XTeqw/lz2dDHEAELccHbdl4YO8xltV5d9jTR7pnq?=
 =?us-ascii?Q?xGz+y9g6DgfDRyQre0Twkpgchwc5TTSp3oYjX4TG8b+gal9hojzJzo+i7S3S?=
 =?us-ascii?Q?Wz+QIRWPoncNc0vVCYlViEfpMAUSHmNSd1mOHfJVg30k1cXc/Qmz4NicIuiB?=
 =?us-ascii?Q?j8rKkAqluJkeRTX8MW/uafeFtMezoe3GQuPrsjwCattF04+Rn1i+Tkk1d0nq?=
 =?us-ascii?Q?PL9N8SxJaSYA+zDyks25DFfKJkK6dv8OYqtHb3n7sbJeljMISEBoN+N3KMd+?=
 =?us-ascii?Q?6k4fdupO2vODGZpUXtF7IfSjojOWAbDgxgoUXnF2eyQOwYzOdON6lv5W/vaz?=
 =?us-ascii?Q?y/tpZoJh5eTJTYrzPYCkY1lKoeaHFklY56KwKqkL1Ma9DCwbVUic0xDkP75H?=
 =?us-ascii?Q?TKNJWzGSZu98a91zMwQySockJcdgSb60afnggu0I4EgcFPfKBldG/4yoQbNA?=
 =?us-ascii?Q?elESX9fFdERfAIDD5hsDQD0HghnjgjVmR8Cnu8Q92wVO00+Bpy3d0tUxqGPV?=
 =?us-ascii?Q?pnvd3yCDZgkgm9b12Ctv0Jmy+yAqE57cYmTi2BVcienvspprHWndhLniGJcq?=
 =?us-ascii?Q?80EMEuWr/36a/sarJ1T+yGicrPHmNhIYf+NkPeWoQgrGl/wq6iXaO9S4DcAg?=
 =?us-ascii?Q?hio2mTt4xKMpd9Gd5+/VFSlY2Q52ctZCJuNaW2sr13UYmXzmT7eD0Do8Xfu1?=
 =?us-ascii?Q?6UxTWkjGQEDjBTZe/DK6uY2VelRMLY9fkauvtsEABYtGvcDV2rTpa1+qHcaR?=
 =?us-ascii?Q?8cOMW+PBQFzNx6WtIYckbc3tXigI4d0UX/MvCO0S7+om5Cmxkej5YtjW0Iw1?=
 =?us-ascii?Q?QNmvbx76Bbn36ZNZxIZrCKqnuZY17bPzm8g9087pXG/XDO+YhmmeXKNQ6Zaf?=
 =?us-ascii?Q?BNSMBJaAsoCx7n0YWGof14rJIS9a7CiG//CrDPwLI6OHaRN9oYe1FZBQQk3n?=
 =?us-ascii?Q?h6cGCPx5G9Ke3cJnGW6KBy7ZEtQF9uwKwP6nXzzWPVaM/RkSEIxlW6CgnqYy?=
 =?us-ascii?Q?mWBzncEwBjWrIiMCsvNUjez/EVFa7zUeluXpDSBKZJdRZQMgY5mrEsQyJH43?=
 =?us-ascii?Q?ElqMW/tWrBk093wKQMcgHPMI2CEdoGLKNM84vrlAMx+c3DMAyvCqjRrCQuEC?=
 =?us-ascii?Q?HErPON3bfV9qdKmrbH+RkmXMA9szwORlTVHfOGYrLQFEKf4WlZz84pu+StHe?=
 =?us-ascii?Q?GnZ2yGEQUXib3zC3FFavG92o13RIjr02xdbNT0BXqGr6t5f9lbSJwJDANXoI?=
 =?us-ascii?Q?+tRlkONz9WwkVQWmlumRO3WqJW/BUQwmXr+Hg07g?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	N9aYXQED1IRHyRE2IVFo7YXaByv1wIrdJ1aepybpYR7JQYU9jcxt+1wwvxiucrpvixTPB9uW6HEWKJF3xpzA9hcE2hjLHs3jruKvJ5aXSMUAaHTRzoGgchTdDYwWI9e5BoMG6bdYDm8KhF69li/Swj4NctbgRSauYDqusdA1/4krip01KECGLNKPLG1BPmCwDgXvToBN9Xsug9Of4rcBc6jaofWWWK350cVfEJZB0M8HbmdSRD45Q65SPxRwTxGdT5V+IERGO3XPSSqTN+LVo8BGEI5thDbXYxEbKelgzoqGRvosOtJWFPeHx+52JHWr4eHbyGnequJ4vmDN6FoyWzE8gEixZS3v79sA2KIjuI8nCv0H1IE/4Bb9Frny6/nMQZhtTG13HFThj1bubwNARDlU5M892jqfU37577sSYY2ig6frvjoLEQKMOPbhN58aLdAfMW3++sYK/y357g+nClOd37ojt21RcOkw9M4KjsFyY+4uit5apMeH07NMbgD+4+vOeDqHZoKSdHo/ewVtEkyYW4j6T6DpQe4fkNvJ1YLzeorDpZW+eyvoWwalYn/75N6PxsoJVv3rVzjfQOp1VerCTUWp0xrkRLhHF5k1ecA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6baf3773-68b8-466b-c5d9-08dd79c22868
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5764.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 13:01:36.7310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNPWRpUiUTHxLo4LLPCbFs5jpRwAuWntE31+ZG8SID6NYQmVf9/rFRxBdyzo88SCKblNAAIx9hl0YCVjxHOoEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7105
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504120097
X-Proofpoint-ORIG-GUID: toG7sWtpK9rJXGxv-NW7E3dxT4w1TJCc
X-Proofpoint-GUID: toG7sWtpK9rJXGxv-NW7E3dxT4w1TJCc

* Lorenzo Pieralisi <lpieralisi@kernel.org> [250411 08:37]:

Thanks for the Cc.

> On Fri, Apr 11, 2025 at 11:55:22AM +0200, Thomas Gleixner wrote:
> > On Fri, Apr 11 2025 at 11:26, Lorenzo Pieralisi wrote:
> > > On Tue, Apr 08, 2025 at 12:50:19PM +0200, Lorenzo Pieralisi wrote:
> > >> Maple tree entries are not used by the driver, only the range tracking
> > >> is required - therefore the driver first finds an empty area large
> > >> enough to contain the required number of LPIs then checks the
> > >> adjacent (and possibly occupied) LPI ranges and try to merge them
> > >> together, reducing maple tree slots usage.
> > >
> > > The maple tree usage for this purpose is an RFC at this stage.
> > >
> > > Added Alexei because I know BPF arena used the maple tree in
> > > a similar way in the past and moved to a range tree because
> > > the BPF arena requires a special purpose mem allocator.
> > >
> > > As Thomas already pointed out a plain bitmap could do even though
> > > it requires preallocating memory up to 2MB (or we can grow it
> > > dynamically).
> > >
> > > We could allocate IDs using an IDA as well, though that's 1 by 1,
> > > we allocate LPI INTIDs 1 by 1 - mostly, upon MSI allocation, so
> > > using an IDA could do (AFAIU it works for 0..INT_MAX we need
> > > 0..2^24 worst case).
> > 
> > The point is that you really only need a 1-bit storage per entry,
> > i.e. used/unused. You won't use any of the storage functions of maple
> > tree, idr or whatever.
> 
> IDA does use the XArray entries (i.e. the pointers) to store bitmaps,
> the only drawback I see is that it allocates IDs one by one (but that's
> not really a problem).
> 
> I wonder if it is used in the kernel for IDs larger than 16 bits, it
> should work for 0..INT_MAX.
> 
> > So the obvious choice is a bitmap and as you said, it's trivial to start
> > with a reasonably sized one and reallocate during runtime if the need
> > arises.

I think the IDA or the bitmap for space saving would be better - the
xarray does do something under the hood for IDA space savings.

If you want to compare, I can suggest some changes to your maple tree
code (mas_{next/prev}_range might help).

> 
> Yes I can do that too but to avoid fiddling with alloc/free ranges crossing
> bitmap chunks we need a single bitmap, AFAICS that may require realloc+copy,
> if the need arises.

That is the advantage of the IDA or maple tree, the expansion is handled
for you. I'd be inclined to suggest using the IDA, but I'm not sure how
important storing an entire range is for your usecase?

Are there other reasons you want to use the maple tree besides the range
support?

Thanks,
Liam

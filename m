Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC5D33EC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751349243; cv=fail; b=CzWEnRkaDxgM8ktpCmjcmxM4buH/5Idpm3HtRKOetbAyjdxX23k6CTz8a9IAEI1aQyyVC5kGadD6WOlbx7ks5P/nuqy7vEzJI9rIHupdF0wqHFHCCnV6eLWAogLYbCf+Er2awXQtE5dLq54jiUz9Yiz+rcmJKTRD1JZyPS4PBmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751349243; c=relaxed/simple;
	bh=vd7aBSZECgd4mLKpGcypx4Ui+o334Z5D2mTxTGqkhaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mQxC4hppWgYffuq79q/921SjM1lrEeRhNwk9+ohO+deZJlQq92whwM+OOGind80uJqrF+D0ampBa4pFwUd7tELPYuN4SsNGjgoRUS3uYvxqhTaYOp6aho3HgH30EPY0FhkgSGZjbsSJz7mKBz1LgHGdB5KajBNPjdPU6q3G6e74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sJxhoMw+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ktr84VsM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sJxhoMw+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ktr84VsM"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5611N2aL009441;
	Tue, 1 Jul 2025 05:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ILn/TFKJeK4IY9VbCu
	F3OackF9bEyQ8XiHyT9nZIufM=; b=sJxhoMw+qZvEjAb+IxorYicfp6d+1G37si
	oxLQl8WqDLf6Q8nBFhku0t/MTYg1M7YRPQ1UlVfCFH+8awXGcqMoSM71jWW5+aBx
	Ic3QEjVlzf0wSZd0dI8QwEvtfxeUCWXlOM6w73q5I9mReU3z0dFWVTHjdOqbThJi
	3w+3xNcIMwHva1zF+P9h0F+Ib0ACF1ldGaciDixQz6Y/sR+u49UH2mgfwwOHOf7G
	3XgogMAj4Xg9ye4w6R4NCRIYoRMRlpik5yGW/4Ct94AVLw+4vOIZUzgNvnuBDdnk
	anegbCBMxYKM2bk9REcyfVQbAMh9UQumPNgEl5qLPm3oZCFg9q2A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j766by9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 05:53:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5615MmEo026051;
	Tue, 1 Jul 2025 05:53:48 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u99sff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 05:53:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIHwjYEHxW36r4b5MGXYNLPfFVqPs8dKip5jEhmqK+/os+GZ1pgmU3eM/7kzuhbwvhv6NvomjPgLtlReQVjYoy5YOq2+xg898pqcayOz0EIILyJ2OsYUI5+N6i7g1s21KZVa16+SwbjnAnqp5nARWrvtXIJD6NKU4eexqUv5ThwAJySPyCTnK4znPh4hGHOM7pKNzn/FRV/tD3aYxn9h76vrx6u59oxNpBQnD0z6tUwzhbNy/hPCtefBLUwDBFCzi459mBfaDGxmKSp80TQ5spJjQfvX9a5X7pujVIgDZVSg5y4v6/6ztqe8k12NZ4IZBfy4Kd7syyWMz+A2QI3S3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILn/TFKJeK4IY9VbCuF3OackF9bEyQ8XiHyT9nZIufM=;
 b=c36Wis3PSn3VSily1gvbDTJor2xClR5IyMVjwqbUWc3ygo2+mGByV7g1xaphR8HYL7qI68kz3OWEdCU9U+AFlPbCzc8/F5X/67m/KDIF0fJpX+Tutbjlklr6UcEQ+sH+OtOZJAaZQh4U+540e2Yc4Knj5ghy8EAnf6y1d6+0GP5Q90UYGmMF3VkdUpfJtRGdcPc/oB0Yjq9VtHR6RSKuCO7K+2LT6nUUwKqNTxcvdKSDV10JRFIioqVOV413gsI4sBqAeDugk1te0JjIvkzfZRq25jmzKSWfn26z5ACkgnGcb/hAVCxyX5BSK/Dqdko5CS+lLjF/Qmc5sL8EUvDO0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILn/TFKJeK4IY9VbCuF3OackF9bEyQ8XiHyT9nZIufM=;
 b=Ktr84VsMr5fkkNY0HOmp/OdRKJTbMBXTgdAc8+IJRv6D/kWXSprT/jgG6ZJy4EevswG59367jZwMmUSx4/qhKCG5b/8R4dWXRStzknNDARIg+cGq0hW9u6hZcRtuhIolmmg/ZkFo2qnqRDeSM88qAjgYO4fXVnvTKUeNP4Vo2eg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO1PR10MB4804.namprd10.prod.outlook.com (2603:10b6:303:90::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 05:53:46 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 05:53:46 +0000
Date: Tue, 1 Jul 2025 06:53:43 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: siddhartha@kenip.in, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        mgorman@suse.de, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] mm: limit THP alignment =?utf-8?Q?=E2=80=93_performan?=
 =?utf-8?Q?ce?= gain observed in AI inference workloads
Message-ID: <f746d3aa-17e7-4b42-9e08-97cdb2cad89b@lucifer.local>
References: <28338f055b3c9afa8b69ff6f05ea20ed@kenip.in>
 <4990838b-660d-46a2-b21c-67adcba61ff9@lucifer.local>
 <19714cae-6b73-43ec-af7a-1455196561d1@arm.com>
 <3ee2e7fea6f263aa884e3e715632b09f@kenip.in>
 <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
 <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
 <5816677a-705e-4a8f-b598-d74ff6198a02@arm.com>
 <ee92d6a9-529a-4ac5-b3d0-0ff4e9085786@lucifer.local>
 <e7152150-2f3e-4ad7-a6c5-f4b77e5c0e05@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7152150-2f3e-4ad7-a6c5-f4b77e5c0e05@arm.com>
X-ClientProxiedBy: LO4P265CA0050.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO1PR10MB4804:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b5aa48-0719-4fbd-d6ba-08ddb863a4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/yz8RwZiqGsT7WC8z/FRhVTjQ3DvulTCPXlN3ZLkgJIIZDixPo841SvIxtG3?=
 =?us-ascii?Q?G2iIg68VCwhVCWDr/wBIi1jn2meLjj82t1tD7kKHS3XcsAXlwkwDrReXZQ1E?=
 =?us-ascii?Q?456H7rbfmnVWP4IY3vfjK3DkaOO6chi5Sow4tK0lLz/5iUStRDqO00iKW4nA?=
 =?us-ascii?Q?DF2bhQvZBRIT6SxGn0nrO6Zvurj+tgedQ74V6tulD9KEpdPuiPdWbCkkquuA?=
 =?us-ascii?Q?WnlVe5xhFJGzmXIdUIy6n12ooTyafm4H+VO17MEzE3I2WBSphIeaVR8mKArP?=
 =?us-ascii?Q?4EfZquaZG/Rs0+1Zor3xgGS60UhKWEAiS/4xg4C8rAo0Exb1gV1NtBn1S7Xj?=
 =?us-ascii?Q?Mnn0LOux1u3HpA5Nr1XGF/T47QAWvPqEUyxAHcrJj85d2M6IpuaWu9VeDaMn?=
 =?us-ascii?Q?iQ0HBlRFd5j5NuVDztHzzWuHAXyL+6pjkURljWNE9/L9q45trb8mdN1SNuL7?=
 =?us-ascii?Q?dsyHT/d0gT9yDmuvzbhc7mLqKLlCbVn2xcn/v4XV5HvwAcQPae2mlnVl5j6r?=
 =?us-ascii?Q?hE+XfbqppDEuunQdyzHPXTr84AWGB80zieNqvILon6rfHuGYebZzpO9ffpbU?=
 =?us-ascii?Q?Xk/LVdcjF8Frnye3Ip04ekFzba8vJFe/5BqqHepygSAD+jOTrEpVQ3fiaU44?=
 =?us-ascii?Q?PhXdKlve9eVAQYLg03iudBAldZbRIR2+03PxjnkDix7faMKpsUGvD8/DgYZS?=
 =?us-ascii?Q?Tv2ODPasa9vArHaRf0rXJCGEAElQ6uBOo7zCdRHipM85OXLOpCY98F/QxTnq?=
 =?us-ascii?Q?ukJ8FzAUcSK6BxyPevxJiH4Vh43ZXRUXdoE1AQYu3xOXaksXhN6mFN+rrs1D?=
 =?us-ascii?Q?K72O1ouOLm1Iph6cHjjYSv/lBiJAwFk6FZ0yC1Iypp+H1CjJbjeW4kGrEnD2?=
 =?us-ascii?Q?/Txq5PTStbLoecCjEfZoxT5Os0Y1SK2i7ARl7xI4QAfjiPYysQgquqY+FLuJ?=
 =?us-ascii?Q?YQjFN/0nHWv3ZBgeyHDmxfH7TMqdaxZzWm+I2GWXKVQjdNLm3onu27fbzg1J?=
 =?us-ascii?Q?nlOA/Cey5s8lq7X5jZhZ8BK2YupZx5lp2aRdqyHLgzrUrhIFPwh2lPqikw8T?=
 =?us-ascii?Q?Vc3mRNrqjRBGRheihIZgMgUOdRgSzGHy8jyTavfX0djUEwBj8GvWytzjSdeN?=
 =?us-ascii?Q?mqyqtCB/KrdMJ5Corx/Y9MMQmqlSkd7nsSkHsTfA3caRDvB3WTo7mJD/rDG2?=
 =?us-ascii?Q?W1FqtnG5ob1Iu9xAVWNZ2CFyN4iz0t4NV+Ie39eO8Vfj99E1VESL2LS41a6/?=
 =?us-ascii?Q?m3gU8MAttcy8LQTSZZHgHM2jYqcfo7inqOgfhbUyZgtWYyhN/8p0QWowPcG3?=
 =?us-ascii?Q?BmcpPGdSFtzpMSyuB56PMk2LJRszHxk1Skih+srZN17iO6HW0uD1pB5AiuIB?=
 =?us-ascii?Q?QI1h1m6xOpPMFzxXM0TdM3plPkRAElT/ETCNwTeutbavYglZELb7JK9eudUJ?=
 =?us-ascii?Q?gxZORZIkaiY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8Yk55JfbbyoGH5nInyo/BbKqu/EkeWiVzmDWiPZ10qIsXjpm55CAstOgHF9a?=
 =?us-ascii?Q?PPbhbRBZaDtcIQ/lMd41CJf7JMvjjpP7r3pSX6ULvgDX3B+5onBEylob6bKS?=
 =?us-ascii?Q?IEpjYbThJaq0skpq0/6r1TaX/rv2sO1BvkxQXOkCVqgJT965W3csmysrnynD?=
 =?us-ascii?Q?JDmaOqyXWPUQjgeoSSzUYKmMwpSI66dS91+uHH6iSbnq16XBT0VFHaWUXkdj?=
 =?us-ascii?Q?YyLhJrQkKXFg4QJ/YMI1lITmtrYmydLTmyPc0KSKEdaJ91u9P8AAE8I/pXDq?=
 =?us-ascii?Q?12qYZ81ik6mLDOevw+gMXAi1+us0iUFWLDUy1syHnFj0hM7E1IClLra2UW/o?=
 =?us-ascii?Q?2cLD6xomxEAz1S2pvst0zmBZEZ7LisAVKcLDknSNWDE2ppx9BPrVf096XgA4?=
 =?us-ascii?Q?Jei3imq/d5YJ4/49VCFH6HGMUZpJ5t2GxrP86DKMHzbKu4sjVk5U30aCCYTI?=
 =?us-ascii?Q?OnWSLl7oW4WsfdEUS1V6DWe9/AS+1jkdHchmt+rIaX6iNpzHO1FMEwlgrKBF?=
 =?us-ascii?Q?LV141/D767OtVKiUSQldyMpwHUcm7daw7ZVwqVL/SbLTCez88MUmjOar+Unz?=
 =?us-ascii?Q?9okcSjPUjouFX0YDgMBkj9QZnwulEGo9jqJ5EyYSokb80nSEM4e3whxahQfA?=
 =?us-ascii?Q?XXdm4jRpFiO+9WUhEWy348DwbaTOqD5Z3AsTBIEy9arq8iYgUyPsNRNQS+u5?=
 =?us-ascii?Q?xyCHJFKdjl1eVAUDtNqMJAJMuZMG4V3bUISMOXLalzP8RNFsRSuCHvVWTuyV?=
 =?us-ascii?Q?sUNsKxW/26EemL9ofRamvsxkl3ZnOzbrAmniSE/qZVE8uwiM9Va0FmpZAV2/?=
 =?us-ascii?Q?Yk/qEF5w/uVHK2Gke2QnRZA+LkashR49pbBbwmD5Q0QvQK0zfbEGWJrjQB4z?=
 =?us-ascii?Q?CwwX1HUhiXQjGP2f3o09VEMFDlcft+l7iKhGgQO1m2fuswSsIvzJaSzyoXvs?=
 =?us-ascii?Q?sDu1ySe8kQtR4T/ihDgh7GMHuuMfmgKo2D5VDMzEDU1cZ51AAzwT0jDw/u8H?=
 =?us-ascii?Q?amkTX46X1EtR5Cjg2uIzEbKE61YER5JBro9QLUoURHH9hxg9LmcRKFN+Lcyb?=
 =?us-ascii?Q?1XrtPKY+2tqxDziTnGkvYMWdy3x4pbqEuqYZ59hbdYDzE6zSCR7Gms3ZxafR?=
 =?us-ascii?Q?kTGo8h5DvFY3E7pPn7EKTyIrjbsBvfV5/E7HVyCX+o6mSPQCQwrTJ9729ScL?=
 =?us-ascii?Q?svjhGTXokin7ripJHk2A9cK8WHYhf5vI0IzrrKOwJQ15VCbSQGUly192+xus?=
 =?us-ascii?Q?AIVjnkvjQd32DjuHlHzF3U1NyOjC/6glCK4QmUIoM4yPe2F2bfKpToWqoros?=
 =?us-ascii?Q?gtGp2KDNgjeltL/3lDG7+7P/LF3pXNrp9VcrsCotmxH4bMgTEtjak5J2xYKj?=
 =?us-ascii?Q?qP/2XE39BhaRg7nqBJ6C+Rl3rUuqWEeZSnKN2eSzAHkNVG6+ASjgbbM7bv48?=
 =?us-ascii?Q?mrtfbg6V6jQ2YvJLKYw75CZwVN0z33OPg24zeOqW4B/f4jpkG5n2DrhUqW//?=
 =?us-ascii?Q?N/WJ/GWfi3Qjtr6XUOC0t2E6dJQ+MKBGXCfHOVFSpW478Dfhbwx1QFpghdNQ?=
 =?us-ascii?Q?rEvCaR1sk4zYDvAxUZ3Vbz0xuUlzdPFHxMSUe/w6DT45VWdR7ocobsoMOgT8?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zpkGIUWbylbg+tZOBaraDEvd9sd8sx90VnijRPPUYhvbh82owMdnkak0ZWimZ7ZKqmXoILs+8FokFGiUguo4C9hxi8+dKFQLZm5fb2RSPGcfrK4NJP63IHaFIgshfvrT+kVvhw8CnZPOWrbcLBW0eIz8/z8Hp7Zkofz7QWhKyVHF24OZO2lyCUlP4ekb/SwD0dm1u7M9/jkBws2IYJhvEmKtePjURsfm2OFkoxsb0nvakIlF5GW2seBAfQso1Odck2FlFa/tCFlNgJFZ54/YgyARh/eNBuX9HJsf8jJ0OIIIGyxqOD4CAHaRf6OQiBOrYqkZMUmH9myvk3qv8aogHydVKSxbH+O6wojycIXedNB98+WJjgO79hW/QdlgaZxVYrZE+X/vKIpeGnB9tUckOCQ+K7wtR6fp13woHb+6ajXvwWf8Y8tkFoIKeIe3HGHg1wxZ2envEiyC5ASywmpIH6F1SKdR6x8TgjaF4iaItxEdG84XrFNuoamIBtJ95xMwM8HW8ygas2Ae7NU4iu6cu5IA+tR9sMsuuCwT4+3z5yEzm/HhT8Y9U8x2FAuhK+QfSeaScGjyd1E7jkI8glMglyv56f5vYm9Pc3jFYzmjtZ0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b5aa48-0719-4fbd-d6ba-08ddb863a4cd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 05:53:46.3285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54eHEfHkd//x5lYgREHRaLRntnRvp1eOROkmSjosbG0lz9O9c1sn+8baseyn+ScA+HVxuwrUZ73NMbEr4kdnvGktYw4LcXeeMY/2vJsspaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4804
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=847 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010030
X-Proofpoint-GUID: xIOaUdXKlZSQkzLxj2dxF3lf1liJz6SH
X-Proofpoint-ORIG-GUID: xIOaUdXKlZSQkzLxj2dxF3lf1liJz6SH
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=686377ed cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=5KLPUuaC_9wA:10 a=GoEa3M9JfhUA:10 a=Lr9ZDMifEvo8lO7h_nAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAzMCBTYWx0ZWRfX3glptYuG1IaC Dq0k7TIxuQci5dtWBdJyRG8iiO3QqUFvv4qXeoHQ4U4G9xn9gd4YuLYczOu4PTiqq0fl8Pr9w91 Th+Y4aA4QkbhpkHWpOObPQMDWDDpZl+4P9ARubX1F4UJf7oueJ/aKln0rz2/D7wRt/u7lyA3R+4
 1ZdS9vId9zbOrFmucQgUnEalftF6yrx0InNvV8jhs/51Vd5nWHWvRpdR9oZrIvtl9O1kxL1xQhF VTMC3S6o7dHrzzy4+QmJCoiqcS16FeuZ9Yzmzx3u/3SsE1VobQWV/VvAbNDUZZXiLUAAnSJ3Uxm xj4td6/6E/LF6DPVLU0DkOBLc5d92kPA0waO5jR2GalLu0ekfpIDlWHbqKfCQSgVTwVN1E8cJC0
 o1Rq69A47tHuVNDeEI1swsqVHfBkS2jI22plgqnMPSn+REHnnorjCyK4VkAkWOT26dmXtRE/

On Tue, Jul 01, 2025 at 11:15:25AM +0530, Dev Jain wrote:
> Sorry I am not following, don't know in detail about the VMA merge stuff.
> Are you saying the after the patch, the VMAs will eventually get merged?
> Is it possible in the kernel to get a merge in the "future"; as I understand
> it only happens at mmap() time?
>
> Suppose before the patch, you have two consecutive VMAs between (PMD, 2*PMD) size.
> If they are able to get merged after the patch, why won't they be merged before the patch,
> since the VMA characteristics are the same?
>
>

Rik's patch aligned each to 2 MiB boundary. So you'd get gaps:


  0            2MB                      4MB           6MB                      8MB          10MB
  |-------------.------|                 |-------------.------|                 |-------------.------|
  |             .      |		 |             .      |                 |             .      |
  |             .      |		 |             .      |                 |             .      |
  |-------------.------|		 |-------------.------|                 |-------------.------|
    huge mapped  4k m'd


If you don't force alignment then subsequent mappings will be adjacent to one
another and those non-huge page parts can be merged.

Vlasta's fix up means we only try to get the THP up-front if the length is
already aligned at which point you won't end up with these gaps.

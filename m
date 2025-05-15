Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDF518FC91;
	Thu, 15 May 2025 15:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747322199; cv=fail; b=AfnfEDAVi/thfaFWWoc4x6Y1iSDUVyPHpm5fcNm/yznkrT5jysNaDJ8Rq9u1L5poQ7a/YVR7VHM6LvlErybZy8v2tFbli7IfDjK1tXK7LSJdUdGoMsmRvSx0UU2aADCbQrXcb107k2Lag7DM/hkQHXAJJrV/4CPtdwLun/40u60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747322199; c=relaxed/simple;
	bh=vtx1l0i8ZA79gPWGz9wNe2fPmcMjdQj0SAMyFWoVak0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ttNmYIs+4jG75gPK1X3tmWZaUWH4JA+1m5aLRTtp8KH7QHx7rq1Iqrzmk9iV2xiOjUxXv4aXAf7nx4zhHVbkLh2R0vawA78S9Iz/nAtsC5y7rwvx0EqGBXX6teDgt/rhdGQt61iAoItnfzECt+mcy2VN+s+CRexaaNVgnhuiEv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gcvmcvEP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PGObumnw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gcvmcvEP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PGObumnw"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FF1otq022180;
	Thu, 15 May 2025 15:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=2DANlP2LG/1V642X+m
	uxMdvFqoV2wrwBYlFQTfLLypQ=; b=gcvmcvEPSnjqya0ScnOmPP0scJLOEEBEQt
	uNL9EsxTj8VziMUn8EU1A0GkB2xNVwUlZKFhBmMzrWbALYaGdSZhD33MIExpuza3
	kqZ60C8NBL/HSt1A9jljViBVtNWM7HJCg2FDyAn6B2/ib9U6Ubn9j7zi4hmoFM9t
	/jI7ENeSRDJQi2ocmIrkviT91NKWqWQfcMHP9NIghU1EJm4hb0KlTm3i57rb0NRm
	pdmu0FuUGTLhI3di6HiBcvxWxe9rebVx0SyYdGc1l8A7dZY3z+VtV84kUmnBL3eM
	k2IFsWdEAJplxBfuYJPOo6AVbPLheNNHBrJC7KbvSpQW0G7C5rzQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcm4cug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 15:15:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEe3Id033163;
	Thu, 15 May 2025 15:15:55 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mbsaq772-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 15:15:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjHSyLdpD/1v35RwGYQh34Jf+cd8jTKHPph21DPKKrf8OXcc7INoi7iplEBTG9bcg6OD7cEaAlvx00LMf0lDcaMkP5X+BvyPRS9D/R74IN2xVmB6Xmbdj6rW5X+lbkBzEiY5ejaVRlGLViPZnXmB+ZtHY3V8jbwbAD9lmC8J5wJxuH4/wCm1ABOw8u21TcHw2n7s6z9vO6Kxd5dE9Y2ei2CzOHd06t+yZGhoau7F3WVcmll/w2NicV+IfiXhzCljOZBVjboYcwE/mMYa6dn6agpad4MmsGqQi+s9FrctwZa/1fnf5gIKNNCPyCKa79YYhmVk93jZNeoYJx6hfcF6YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DANlP2LG/1V642X+muxMdvFqoV2wrwBYlFQTfLLypQ=;
 b=BSImPLI7F66ljjrWhN2GxhxQzEo7SvtCb0a2t3DnVx4ks7fzs7okfzLKBO/QzguAm28rx/jQOvleYjQDc8t+e0BT675R/3eyweqjC5qv2tykjMsdCiaW5EIBw6KfavcNf1Lp4Xw2exP/EJT3bv6G4tWSdDEgX7XNulzTLBjHIU3cHNqiGdzJgmjuKDQ6ei4LRa4+DSZjfDYYYsW2k82N6EO2i50RQvBAO0YwLsBnv54sjtlmnDldf8WRBbalxNmUCCEzmPdYCQOid8QLfYuMGsRUYQeiKSL8guLZhhk0r+GOH/Io7BZAJuNFu5ZzqYb/dO5QBiJO9DVZC2YT0MJhPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DANlP2LG/1V642X+muxMdvFqoV2wrwBYlFQTfLLypQ=;
 b=PGObumnwjLSQtaHHp9IcNnYA7IPHeKLsrdoG9hIJ0sySiA6GHwVg5Ee0f53wIAH+JFGdijWPWuTzzSmZatxJDAIfy3MDqCA9dBLUPC5GL3ygpag7MAfGVp85p7Wz8vXLakvqMO3yMRAGoTDaIORHVjjqZmICIggTe+U1Sso0O+c=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PPFBB10AAA58.namprd10.prod.outlook.com (2603:10b6:f:fc00::c44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 15:15:53 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 15:15:53 +0000
Date: Thu, 15 May 2025 16:15:51 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
        linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
        riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 0/6] prctl: introduce PR_SET/GET_THP_POLICY
Message-ID: <e3efdfb7-d309-43c8-be39-c02d886c5b45@lucifer.local>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <6502bbb7-e8b3-4520-9547-823207119061@lucifer.local>
 <5e4c107f-9db8-4212-99b6-a490406fec77@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e4c107f-9db8-4212-99b6-a490406fec77@gmail.com>
X-ClientProxiedBy: LO2P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PPFBB10AAA58:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cb75821-b0a3-408c-2876-08dd93c3623f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JY+V7JdYOcJfVQtvE6iddSAQM5ypMcQ+0/NjPqYLe8wmXuHm0TZHLBS8PEPX?=
 =?us-ascii?Q?QlNLY6IlboFYa06ASOmnueHsqJsIRYhMnScQFU79Bh3LHGHlIcG39gx/K45d?=
 =?us-ascii?Q?UmYkafRoST9N4/UDa4WBgzgJyh46EyQK+8MQ72v3OjwuhRBd2KABpW/bX0In?=
 =?us-ascii?Q?eeLNGP0Ik5HSlSn29r6VywIkd+d9nZlZhAMZctxHHQtCZL215MHDCFAh1hhH?=
 =?us-ascii?Q?5enfvbup/DvWuuLKIH8pKGkAPOjtWimREhZRFxsGuVqzVRBD/2ss9GY1TWBX?=
 =?us-ascii?Q?UHeO1kfzE4anrkeb91D3s81e8IklOd1oGdAglxUyeIn4MPsjb8uu+Jul37+D?=
 =?us-ascii?Q?BEuoTKFN4i/2NIOs/NU/6issU4HtxNCFD//uNBXrYDTL2bGZDW+50jQHlBnP?=
 =?us-ascii?Q?KfrVfi/uUGbJf30PuGMFA4xylYo26nyTG62ofnbkX00Gy9tMJ2/rZQc7fFwM?=
 =?us-ascii?Q?Ic6604NcHbFaBqQQrr6jPlmxIrIgTtaAwOBGPuB6tDKKSZfCZJHNIFg+TA0g?=
 =?us-ascii?Q?iQfJiq0eLTSScCl/JsKQVK6s7sqYY7mvrFhIsMJ9uEQ+ubIXOHXb2X8A/chY?=
 =?us-ascii?Q?4GOByYMVAsUwKnx1drYinYE51Rc4Cv4pJmVRXG1o9MZtYatto0+9fMOruogN?=
 =?us-ascii?Q?hj897PuRXGN16IJmay2YKUWF+X2dtSiHzD2QVpQBztGfJH8+xkd+n6DSHrCp?=
 =?us-ascii?Q?CcqHHZu8RprD5VvcLH03l8fTdMIYRd0XXdH8PbklIJkXLBujaFU1Ps+x/XLr?=
 =?us-ascii?Q?oQTINwaDkMgxhqKt545k3120wUOrIJSS/ZJ2vOXxqpJzvuncLvUTSEkZYX4A?=
 =?us-ascii?Q?zFWazHv0lJYAlhQBBgdDAPsbBUalTu+jyk1LUyoQfqV13OeIPwHmxFLw7QjE?=
 =?us-ascii?Q?zCgR3SQNJ2ef0NDBaD0s/+1qCafL0El64Xf5u8P9bMtNfJvQ2id9nwNuVavP?=
 =?us-ascii?Q?f981ziEWlvvqnNcz+aVWe0a/DZkxlxb+rdp10XaGsVxDRHOioiYeYwGNLfQ1?=
 =?us-ascii?Q?pNcTOalBGhlH8QLNk8V+s9EPqvpnxXyIMoASZiCzjVJxm/2wrKgU4UyUkie5?=
 =?us-ascii?Q?c7c/3lQDFKdrlTIuCirdKhpgCynOFp0dXpuMurDC8NL98N/T7a/+DBd3N4wy?=
 =?us-ascii?Q?9n58pfb0mnTBoc7hv9XtfkM3CL5/l93tIO42EQd9Vz7vs+Trz9I2wkF7uoYm?=
 =?us-ascii?Q?EyPSyu1kTqLwG7h2xlPehN5EB2bM/WdahaP9wYsxLmWGBWU/6Qjx0eO6Ua7U?=
 =?us-ascii?Q?saPc0t+N6UUTJGgYR5SknNjUNnmfeaM404Cu7CroCxpatoep8yDSsszbCV+p?=
 =?us-ascii?Q?iLKrX4da3PGj3KMC1aPvyEmsrrcxh7V1j/WJNtKlODNvtbDsHEDd+vfSQPaV?=
 =?us-ascii?Q?tHouw5EX5Hu78YCXXvhwlEPMQbsJkHYK/TZhK74xBhm5ea5H6d/i0OD9dMoK?=
 =?us-ascii?Q?OUCf+8y7Mx0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bqjm9jtaWPBsUy04HXlsLG0/CyiY+IKQSsAW5+4idv9U7HEmR7zPZU/kwC4T?=
 =?us-ascii?Q?EoWkdI45Pm3hfUDDaG1OgLCmjVZXmEkPFooBPC0wk3ArOlb/fGMkgWIWg15M?=
 =?us-ascii?Q?QuZirGylcMkheC3xuF7OxypNY6ug3Vglzs61yrzmyQGoopMZ85lh5sqYUBGu?=
 =?us-ascii?Q?3EMCbZ2r95fPwFthTEX1C8sjrq+FpmEk7RLRD/b/4mgu3bfxswu0ry/grUZF?=
 =?us-ascii?Q?Tm3JK5ufGGGcFtz9VEaSAt3DaR/zYVJaITJM0trKUDi1Gt8g2KowAULltIjS?=
 =?us-ascii?Q?GXgHz1obGqPYIffJbp8jzqaBhB0nPlw3+aUZiRMW2RB8Yhnz7LKD9hRAyQfQ?=
 =?us-ascii?Q?xAhOFm2yRTKH8Dh12Xf4HrTb+MO2yeQWf2sByrVrDcBCzY/ccwvGh6guvjSB?=
 =?us-ascii?Q?vveHfYLt0fKf904nTCprxRrVrGh1OCmYfytBcONXI1cC3ILI1hAnLpiKKL5G?=
 =?us-ascii?Q?kupBSB4QjCZYj2D/sFQGA4ibKCOhs7LOY7l6zSI479EqYKw2LoTRGN2O+La7?=
 =?us-ascii?Q?II6UF1ajE1nSkiOaNKMV//pGJD7Fnti96cvlEhLliRk3phgMlfXr2bVIMCIt?=
 =?us-ascii?Q?WnS5bZyzewcleTIsBV5huEeR8Bet5COIJHhBvlQxk9v7pnjyig2iT2or4z+z?=
 =?us-ascii?Q?S9x8cO8uf3QvYmAo+ZOM49afJSrg3SKl9jPhpw1fb6xPoMtpE3dlxTxvf38M?=
 =?us-ascii?Q?vyoRm2bCTVSFWEokLwQ+uyykkTTnmV1yaehCpOdsEH90OEZZd2dx5qZwQ86Y?=
 =?us-ascii?Q?RvPqoYhro1s3r3GRqQo/691uTwwnchgOqOOcEqmHBkQUfjvb4aGi55ARfKIv?=
 =?us-ascii?Q?td5pF80UP25fZTrbUMEmWTbwrMPU97nC5Tx2iwZ2y43ejFDFRQ3aON6Pr1Ve?=
 =?us-ascii?Q?TOvUYIKWcaNpHTSexvWxUjazA4oirG/ezQ7AOfOAanRkW7rUlcBB7PeQlAvh?=
 =?us-ascii?Q?q7UF5pmn82K9U9VdHb6eocxcLPP1ugK3KbRAVzp/q8hrJZXgsy30xtOPVF6p?=
 =?us-ascii?Q?h9rMX0f/sXjIM7U9XB+End9Cg+z6izBh6Q7xDcJrGp4RGfSjXlbnnCqLayBV?=
 =?us-ascii?Q?pG8r94DUwlb0pc2r28CYt2ETH5NO9e5s0NKZ3xu0B6o9dml2ihys4wfCbCJW?=
 =?us-ascii?Q?AYgNoI6NyYvODAdsqR6tXzyhr+1zMVBIkSLuB7o5ev+P8IanlR0ckh1/kKK7?=
 =?us-ascii?Q?KFkraDuYhvb3qg2uzHaEbEl3yxi2qmedDynyQt/SbmyUMuQ3hTVjXaS9wsit?=
 =?us-ascii?Q?AmSHve1RY15bOE/AWYbrs6B6KrQFmTfLEpmJWlfcKexk0vJ05a+17jq+fNrD?=
 =?us-ascii?Q?G8JyIdusnXHQmc2CsH6DAf+KjZ1d6wzX+U7qiqMPPspkuzR3s8KC1pw/rGOx?=
 =?us-ascii?Q?JJcthWqkspC9CCvyvKEEV87SdwBc9gra1eCiiRitoHDYdmkYuaCsoF9NOWbO?=
 =?us-ascii?Q?q3QNEXJJV72dFtSY4xpQLb5ILJG+nT0L0tE4z5+OJ1E8b1lFC0SMNVT981N/?=
 =?us-ascii?Q?Jrlt5cGd0DjR9FnJfe4njwdPRdF3jWKm+HULGs9AYVEf2WEHS4830q6/64vc?=
 =?us-ascii?Q?xeA63YEnVtlfNgvongIUux/FGpDi+v6nbZQTcsUh+xjSpQZBsPxJn4OteCs7?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WJSHT8+9l/dI/93KnuoiaXul4ru/jErHD05Eg4hoW9qJbR77tfUrzo/zUGj61vsmslk58EVLPRiMIvl4Xyao/7t9mMg9QOENlaUdsnFNYUzz/U5F42ebPSsYmAzq222YEij1KyMTtzfCaNlAzmW5P3d39QWWwFruGI+A+2xdeKk2jXJ8idPQ2QiZiKBn0NSiPl6aIvofYRiSbBK47YLe7s4ECCLrXw+ibQIULOHsd1mDNKoQMFq2cKdBxvSJI82qwd1Rfvfvn1TvfriVVH9Puvhp+Opa+TmDQS6rhB1bVBtd93RnM1xaDDSeJFysG2IIe4X1W3ht4Q++1Hy7+/4UcEmenQRqL2PJH0KBREdcVZdMCF16Dqvn/BliHiePzEMplb3qETRV7xov80o2bp2RT+70DHmFBg5klJ+OttZ0EIsyNFXSlailm+eglx3FmI6+q7GFPDuFvQA4bSS+epI/zNsCQvwqcxy9Gd6iQ7bTayTogLEzSKggCvr52f9PnbrDR9geSmZbu2J4OmQiTwv7cd+T2/dDR8BSIIpMLO4B91nOUILmGfnHEmAzShA0cY561f26M84IuKoqxfdsYFZ74x5hBGChtDttO8w7xmgDhFY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb75821-b0a3-408c-2876-08dd93c3623f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:15:53.3966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CO1SsVKkHwattIfhHa7TqymhAHtR4nOnP7uqdab/KoUzo6/xcwbWz0hd6C/29Ai/JBJssarQrWDs67OThQEbIh7fu65mloX1uRIOrgGhD6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFBB10AAA58
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505150151
X-Authority-Analysis: v=2.4 cv=DZAXqutW c=1 sm=1 tr=0 ts=6826052d b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=h7qZGlsjY3ONoLok9QMA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13185
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1MCBTYWx0ZWRfX5g5nT/Yv3uBN gOY1bYv/UxOZGsWFO/Vuvf38Bbf5L3conLVd2j8GEvJKjhZPvC9qyYYxhDSlpRqlUn60zpOW+Rq Ju+c5wgcxFiGPLbKn1L7ywJHCMSd5tEIFWAE+adanrgVxl8t66PGMIv8m9tmC1JQcavpO8df3to
 co9WMrVlHfEjd/savLmymdhOMf/UBlKAdUJT73UcnoMPmZo6LBUYQw4lDwQn2cNhNVPBhMdLnnE NGwpSzu5ZdnMfszR9T0bCnmSTzwiUUBq4Q1JkfslDzZ9oICQj7S5dsQJ8Ru0VoqPa9Fys36h4I+ JUCRKm+qRt8ejPbMFsLD2NKLQvtniCmBWSXTg3WjzZK3tISCZkjTAB//e7i/TwU1+oqH71GBs4K
 vzLDbmyW0nVCgvFzVimNq78j2GFlxLV7mbFQ3OtxzcnoVHF/hIP9Ko+WRM/XdHHCefwoqpQA
X-Proofpoint-GUID: 9zKJxlpUiPO8ILuvmJmzmGpbFxgA9rqW
X-Proofpoint-ORIG-GUID: 9zKJxlpUiPO8ILuvmJmzmGpbFxgA9rqW

Thanks for coming back to me so quickly, appreciated :)

I am reacting in a 'WTF' way here, but it's in proportion to the (at least
perceived) magnitude of this change. We really need to be sure this is
right.

On Thu, May 15, 2025 at 03:50:47PM +0100, Usama Arif wrote:
>
>
> On 15/05/2025 14:55, Lorenzo Stoakes wrote:
> > On Thu, May 15, 2025 at 02:33:29PM +0100, Usama Arif wrote:
> >> This allows to change the THP policy of a process, according to the value
> >> set in arg2, all of which will be inherited during fork+exec:
> >
> > This is pretty confusing.
> >
> > It should be something like 'add a new prctl() option that allows...' etc.
> >
> >> - PR_THP_POLICY_DEFAULT_HUGE: This will set the MMF2_THP_VMA_DEFAULT_HUGE
> >>   process flag which changes the default of new VMAs to be VM_HUGEPAGE. The
> >>   call also modifies all existing VMAs that are not VM_NOHUGEPAGE
> >>   to be VM_HUGEPAGE.
> >
> > This is referring to implementation detail that doesn't matter for an overview,
> > just add a summary here e.g.
> >
> > PR_THP_POLICY_DEFAULT_HUGE - set VM_HUGEPAGE flag in all VMAs by default,
> > including after fork/exec, ignoring global policy.
> >
> > PR_THP_POLICY_DEFAULT_NOHUGE - clear VM_HUGEPAGE flag in all VMAs by default,
> > including after fork/exec, ignoring global policy.
> >
> > PR_THP_POLICY_DEFAULT_SYSTEM - Eliminate any policy set above.
>
> Hi Lorenzo,
>
> Thanks for the review. I will make the cover letter clearer in the next revision.

The next version should emphatically be an RFC also, please. Your cover letter
should mention you're fundamentally changing mm_struct and VMA logic, and
explain why your use cae is so important that that is justified.

>
> >
> >>   This allows systems where the global policy is set to "madvise"
> >>   to effectively have THPs always for the process. In an environment
> >>   where different types of workloads are stacked on the same machine
> >>   whose global policy is set to "madvise", this will allow workloads
> >>   that benefit from always having hugepages to do so, without regressing
> >>   those that don't.
> >
> > So does this just ignore and override the global policy? I'm not sure I'm
> > comfortable with that.
>
> No. The decision making of when and what order THPs are allowed is not
> changed, i.e. there are no changes in __thp_vma_allowable_orders and
> thp_vma_allowable_orders. David has the same concern as you and this
> current series is implementing what David suggested in
> https://lore.kernel.org/all/3f7ba97d-04d5-4ea4-9f08-6ec3584e0d4c@redhat.com/
>
> It will change the existing VMA (NO)HUGE flags according to
> the prctl. For e.g. doing PR_THP_POLICY_DEFAULT_HUGE will not give
> a THP when global policy is never.

Umm...

+       case PR_SET_THP_POLICY:
+               if (arg3 || arg4 || arg5)
+                       return -EINVAL;
+               if (mmap_write_lock_killable(me->mm))
+                       return -EINTR;
+               switch (arg2) {
+               case PR_THP_POLICY_DEFAULT_HUGE:
+                       set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2);
+                       process_vmas_thp_default_huge(me->mm);
+                       break;
+               default:


Where's the check against never? You're unconditionally setting VM_HUGEPAGE?

You're relying on VM_HUGEPAGE being ignored in this instance? But you're still:

1. Setting VM_HUGEPAGE everywhere (and breaking VMA merging everywhere).

2. Setting MMF2_THP_VMA_DEFAULT_HUGE and making it so PR_GET_THP_POLICY says it
   has a policy of default huge even if policy is set to never?

I'm not ok with that. I'd much rather we do the never check here...

Also see hugepage_madvise(). There's arch-specific code that overrides
that, and you're now bypassing that (yes it's for one arch of course but
it's still a thing)

>
> >
> > What about if the the policy is 'never'? Does this override that? That seems
> > completely wrong.
>
> No, it won't override it. hugepage_global_always and hugepage_global_enabled
> will still evaluate to false and you wont get a hugepage no matter what prctl
> is set.

Ack ok I see as above, you're relying on VM_HUGEPAGE enforcing htis.

You really need to put stuff like this in the cover letter though!!

>
> >
> >> - PR_THP_POLICY_DEFAULT_NOHUGE: This will set the MMF2_THP_VMA_DEFAULT_NOHUGE
> >>   process flag which changes the default of new VMAs to be VM_NOHUGEPAGE.
> >>   The call also modifies all existing VMAs that are not VM_HUGEPAGE
> >>   to be VM_NOHUGEPAGE.
> >>   This allows systems where the global policy is set to "always"
> >>   to effectively have THPs on madvise only for the process. In an
> >>   environment where different types of workloads are stacked on the
> >>   same machine whose global policy is set to "always", this will allow
> >>   workloads that benefit from having hugepages on an madvise basis only
> >>   to do so, without regressing those that benefit from having hugepages
> >>   always.
> >
> > Wait, so 'no huge' means 'madvise'? What? This is confusing.
>
>
> I probably made the cover letter confusing :) or maybe need to rename the flags.
>
> This flag work as follows:
>
> a) Changes the default flag of new VMAs to be VM_NOHUGEPAGE
>
> b) Modifies all existing VMAs that are not VM_HUGEPAGE to be VM_NOHUGEPAGE
>
> c) Is inherited during fork+exec
>
> I think maybe I should add VMA to the flag names and rename the flags to
> PR_THP_POLICY_DEFAULT_VMA_(NO)HUGE ??

Please no :) 'VMA' is implicit re: mappings. If you're touching memory
mappings you're necessarily touching VMAs.

I know some prctl() (a pathway to many abilities some consider to be
unnatural) uses 'VMA' in some of the endpoints but generally when referring
to specific VMAs no?

These namesa are already kinda horrible (yes naming is hard, for everyone,
ask me about MADV_POISON/REMEDY) but I think something like:

PR_DEFAULT_MADV_HUGEPAGE
PR_DEFAULT_MADV_NOHUGEPAGE

-ish :)

>
> >
> >> - PR_THP_POLICY_DEFAULT_SYSTEM: This will clear the MMF2_THP_VMA_DEFAULT_HUGE
> >>   and MMF2_THP_VMA_DEFAULT_NOHUGE process flags.
> >>
> >> These patches are required in rolling out hugepages in hyperscaler
> >> configurations for workloads that benefit from them, where workloads are
> >> stacked anda single THP global policy is likely to be used across the entire
> >> fleet, and prctl will help override it.
> >
> > I don't understand this justification whatsoever. What does 'stacked' mean? And
> > you're not justifying why you'd override the policy?
>
> By stacked I just meant different types of workloads running on the same machine.
> Lets say we have a single server whose global policy is set to madvise.
> You can have a container on that server running some database workload that best
> works with madvise.
> You can have another container on that same server running some AI workload that would
> benefit from having VM_HUGEPAGE set on all new VMAs. We can use prctl
> PR_THP_POLICY_DEFAULT_HUGE to get VM_HUGEPAGE set by default on all new VMAs for that
> container.
>
> >
> > This series has no actual justificaiton here at all? You really need to provide one.
> >
>
> There was a discussion on the usecases in
> https://lore.kernel.org/all/13b68fa0-8755-43d8-8504-d181c2d46134@gmail.com/
>
> I tried (and I guess failed :)) to summarize the justification from that thread.

It's fine, I have most definitely not been as clear as I could be in series
too :>) just need to add a bigger summary.

Don't afraid to waffle on... (I know I am not... ;)

>
> I will try and rephrase it here.
>
> In hyperscalers, we have a single THP policy for the entire fleet.
> We have different types of workloads (e.g. AI/compute/databases/etc)
> running on a single server (this is what I meant by 'stacked').
> Some of these workloads will benefit from always getting THP at fault (or collapsed
> by khugepaged), some of them will benefit by only getting them at madvise.
>
> This series is useful for 2 usecases:
>
> 1) global system policy = madvise, while we want some workloads to get THPs
> at fault and by khugepaged :- some processes (e.g. AI workloads) benefits from getting
> THPs at fault (and collapsed by khugepaged). Other workloads like databases will incur
> regression (either a performance regression or they are completely memory bound and
> even a very slight increase in memory will cause them to OOM). So what these patches
> will do is allow setting prctl(PR_THP_POLICY_DEFAULT_HUGE) on the AI workloads,
> (This is how workloads are deployed in our (Meta's/Facebook) fleet at this moment).
>
> 2) global system policy = always, while we want some workloads to get THPs
> only on madvise basis :- Same reason as 1). What these patches
> will do is allow setting prctl(PR_THP_POLICY_DEFAULT_NOHUGE) on the database
> workloads.
> (We hope this is us (Meta) in the near future, if a majority of workloads show that they
> benefit from always, we flip the default host setting to "always" across the fleet and
> workloads that regress can opt-out and be "madvise".
> New services developed will then be tested with always by default. "always" is also the
> default defconfig option upstream, so I would imagine this is faced by others as well.)

Right, but I'm not sure you're explaining why prctl(), one of the most cursed,
neglected and frankly evil (maybe exaggerating :P) APIs in the kernel is the way
to do this?

You do need to summarise why the suggested idea re: BPF, or cgroups, or whatnot
is _totally unworkable_.

And why not process_madvise() with MADV_HUGEPAGE?

I'm also not sure fork/exec is a great situation to have, because are you sure
the workloads stay the same across all fork/execs that you're now propagating?

It feels like this should be a cgroup thing, really.

>
> Hope this makes the justification for the patches clearer :)

Sure, please add this kind of thing to the cover letter to get fewer 'wtf'
reactions :)

You're doing something really _big_ and _opinonated_ here though, that's
basically fundamentally changing core stuff, so an extended discussion of why
you feel it's so important, why other approaches are not workable, why the
Sauron-spawned Mordor dwelling prctl() API is the way to go, etc.

>
> >>
> >> v1->v2:
> >
> > Where was the v1? Is it [0]?
> >
> > This seems like a massive change compared to that series?
> >
> > You've renamed it and not referenced the old series, please make sure you link
> > it or somehow let somebody see what this is against, because it makes review
> > difficult.
> >
>
> Yes its the patch you linked below. Sorry should have linked it in this series.
> Its a big change, but it was basically incorporating all feedback from David,
> while trying to achieve a similar goal. Will link it in future series.

Yeah, again, this should have been an RFC on that basis :)

>
> > [0]: https://lore.kernel.org/linux-mm/20250507141132.2773275-1-usamaarif642@gmail.com/
> >
> >> - change from modifying the THP decision making for the process, to modifying
> >>   VMA flags only. This prevents further complicating the logic used to
> >>   determine THP order (Thanks David!)
> >> - change from using a prctl per policy change to just using PR_SET_THP_POLICY
> >>   and arg2 to set the policy. (Zi Yan)
> >> - Introduce PR_THP_POLICY_DEFAULT_NOHUGE and PR_THP_POLICY_DEFAULT_SYSTEM
> >> - Add selftests and documentation.
> >>
> >> Usama Arif (6):
> >>   prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the process
> >>   prctl: introduce PR_THP_POLICY_DEFAULT_NOHUGE for the process
> >>   prctl: introduce PR_THP_POLICY_SYSTEM for the process
> >>   selftests: prctl: introduce tests for PR_THP_POLICY_DEFAULT_NOHUGE
> >>   selftests: prctl: introduce tests for PR_THP_POLICY_DEFAULT_HUGE
> >>   docs: transhuge: document process level THP controls
> >>
> >>  Documentation/admin-guide/mm/transhuge.rst    |  40 +++
> >>  include/linux/huge_mm.h                       |   4 +
> >>  include/linux/mm_types.h                      |  14 +
> >>  include/uapi/linux/prctl.h                    |   6 +
> >>  kernel/fork.c                                 |   1 +
> >>  kernel/sys.c                                  |  35 +++
> >>  mm/huge_memory.c                              |  56 ++++
> >>  mm/vma.c                                      |   2 +
> >>  tools/include/uapi/linux/prctl.h              |   6 +
> >>  .../trace/beauty/include/uapi/linux/prctl.h   |   6 +
> >>  tools/testing/selftests/prctl/Makefile        |   2 +-
> >>  tools/testing/selftests/prctl/thp_policy.c    | 286 ++++++++++++++++++
> >>  12 files changed, 457 insertions(+), 1 deletion(-)
> >>  create mode 100644 tools/testing/selftests/prctl/thp_policy.c
> >>
> >> --
> >> 2.47.1
> >>
>

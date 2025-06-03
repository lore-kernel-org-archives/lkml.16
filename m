Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC61322F767;
	Tue,  3 Jun 2025 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748963666; cv=fail; b=TvidRw+maboH4kKmOjglmE1alRIop4gcjFnqqrcNTPMkySCBqebR2+FGZtZii701PRdXCPmv1uMiCXK/PTZ/olK+hEWlY0KRjryR1gaCPdkQJkuE9ZkZNO31HgkrgdWOfPTpyzf7QSUpkeymE6JuoA4odG9qNCliXB4nmPnn+dM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748963666; c=relaxed/simple;
	bh=ZemIhhxaRmsTNpQh6Vg+jJLpnBvgD2mE97hdZYDpVK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IS7oUtezRVMWG5a+KfFz4GByTWwG0fKhjDfuRonsIXZjZu1+Y4byp4AkGMhlYGYnnooabGshdU5506W3qsxHMzAdoFwJIbne+Z6VZ1Eg9NG5Dnu2YK+lgRvZdxhgoxd61Hwn080AtqaggYqDSg5/SIRTlTtqGTrLTzervdqON5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KkYouR9g; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ohfJWck3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KkYouR9g";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ohfJWck3"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553AEkJU028228;
	Tue, 3 Jun 2025 15:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=f9rdd4RVZSFb0ZP3hy
	0tBj5mbZdPmQysEYcr3KQ+2Pc=; b=KkYouR9gvLbvqcbeDzrY65YNrtpAYH73Z8
	i8/fTOleaOeURcAsj17qkpZXbbaIB2wro9zZt2Qi9nk/rYl+X+Iy9eJO/xjpDKzv
	1eH4dJum0z2NtAznyhs3BwLAUpDdWlsjy+QuMz4aIQ3j3YIRcaDo1jAfXFIfMMEx
	ojAlH309KDdxdAxAu3m/OR8lvGNuM3yxQRT9YAJVOZTXPO2kiKtyE4tWtDSf2HHw
	T31E2nStyatzKN2izwk6Geb2gpD/FYrqtEyFlo+5P35wLKWITusQXpy9L1WaqUZM
	tpWhyc1uZou/KEdM4hBty3gFZu6SpWkOxl+HFCI99Lqzfq9XL4Nw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8j2571-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 15:14:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553EZvYm030831;
	Tue, 3 Jun 2025 15:14:05 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012049.outbound.protection.outlook.com [40.93.195.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr79gpx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 15:14:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyU83oHJPj8/ob48EVtRgqiVN2Pf8jiRv29GSKutXaixsFz9BE+giSz0cRtwy8zkPRSAdFLYc++ABSOR55VrpJaCuu6/lUHJhLbeSQO6FmBdV8Z49VFjO+82sheg8T87E8amkZV1acLKD/uFsGTXkYRLXqSH9sgS/nepNiqWapNNaqT/TKG6D8hJGg9wd4ueYdbi+ZcF8cC7b1FSqAJKDK7VwJOewjq6SxBR7kmauXi86QVUZQC5i2PI3hfmvfK5B7r9kWu8Ppf0UeqfQAOkPkOHElXCbUM93QITpPAGJ7Gfx8zgE4jmnk7ih99mxxOnqLiAc+3DDDucN1tlsKcPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9rdd4RVZSFb0ZP3hy0tBj5mbZdPmQysEYcr3KQ+2Pc=;
 b=qsLTZtrFFDDeW9wVwNlweTOjYgdmw+kHNrNdg0E01DFxfDtJH30CoWFvoDb7gAv5fLfIIjHANETWT4MPLrCbvyOEcfrooGPNZoYQiN94xcOeQJjouav1uQ5UZtVfDC310D+zDy+srzgF6EOzr44X2AasTWxCEC59iOrW1VlHb/78K0eWWYV7QUTe4Nqb70J4Ysi4dCn4nNr/9nlnPPKPG0weS7PajVNNsZcba07ZQrVlIgjP7uHR4Y8YO9FA5kW+xvdhM40FSobsAPAY76c8uLORvrbYaYYpN73Pziyc/3tTMx3zcJDoZgrOMpu7TXZbZaNCGZiof0MlXFJeAXebxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9rdd4RVZSFb0ZP3hy0tBj5mbZdPmQysEYcr3KQ+2Pc=;
 b=ohfJWck3xtDOiqgcCweTCKKfNjZm7KB0VqcTrqaTryHgysXcn5GCtYDuxA5rvTF7nnfmo//nBGmKIHLZqTSfd3yow2h67lfflxTZX1LzEwTl0L0KVLpzOZAbteIVTHTyC+Ul8C9tuw4iq/Tcd2e55WRSACeINsBxtcu5OHU86gY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPF871418173.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 15:14:02 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Tue, 3 Jun 2025
 15:14:02 +0000
Date: Tue, 3 Jun 2025 16:14:00 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: expand vma doc to highlight pte freeing,
 non-vma traversal
Message-ID: <334c9145-0adc-4fb6-ab0e-4ef7d6e09952@lucifer.local>
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
 <87bjr59634.fsf@trenco.lwn.net>
 <9fc9ac50-abce-48bd-979f-2e00b26917b5@lucifer.local>
 <8734cg9auh.fsf@trenco.lwn.net>
 <ea8c2be9-0af0-445b-b7fe-fd9e80bd6a65@lucifer.local>
 <87tt4w7uxo.fsf@trenco.lwn.net>
 <1b340b71-6664-48ff-b783-aa89fa5b0b16@lucifer.local>
 <87ldq87tmr.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldq87tmr.fsf@trenco.lwn.net>
X-ClientProxiedBy: LNXP265CA0073.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPF871418173:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e49a844-83d0-4996-48bf-08dda2b145e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9nazGLKJBOWHyE/wf0u81qRpYlYYTnLpFktirsOBskizjFFNoFIlFMRH5x+D?=
 =?us-ascii?Q?K+6aKQk41rSE3DrSZFbQ7kq9tMYyZ3Ea4ixUbqBZGFU5Y48nyn8mYNKSbfga?=
 =?us-ascii?Q?EAyKv5tI0srYnHwmL7KGvZI58NCXGW0Ez4N8rWVwkNCWqKDpWBzo2+Wp+LVs?=
 =?us-ascii?Q?XLMpRtDGlAOaxghBZhsxPNWamZ/uUZFiKwMmLZiIvWS8tgs1wj+Uf2InnXhY?=
 =?us-ascii?Q?JX5VKFz1Nn/JDMkJ63DhtgdzWWfZsqV5buErw0Qaq3NSi38SE38asqpiuzE4?=
 =?us-ascii?Q?nySPiT+H7KiyyCi+x6zvg0T66S9nVfgTCHdvE4mWSj0r4c0VPnEN66sif19s?=
 =?us-ascii?Q?ki9bqKQ3ZYtWk6NgiXFvbgSsF1y15evymawslpU7juagRtWPHOZl+f5CHUXt?=
 =?us-ascii?Q?8BenhkTsKIbmtTZOkr6gJc7h5mFGIgE4J9iIZrdybDZP9VVuFrksST0M9Qxn?=
 =?us-ascii?Q?vSAWDeUaickbIWIg25IEMmRsCIUgbLj9DZ/ZTMDDKQIlbnlceN8+CinDfaQW?=
 =?us-ascii?Q?wkOeflrG2AI+qXAMBUp6HGZti3IagHPDqv4cuM6d3UDlDf2x21mXsZhkZy7M?=
 =?us-ascii?Q?C7sTTYqiAQTbSyz7eZV/4YbSo+K1G8gpUsBxZ1s8ZGNLftjPHcMMS8KUKh0T?=
 =?us-ascii?Q?3mLJggM68U0jY3Wa4clLlPSvO1esMgjZysEeFrT5M3o3W9RDSlacL6C4xJjZ?=
 =?us-ascii?Q?/3nJos+TlO9aV79TjT2m0nmNvR4y0NWGTjEveh4rORrNagP6xkgBJHpyThJs?=
 =?us-ascii?Q?QKh7ts/0x/5e3pK/OXecErsRsS/spkSRgD5wvbH5KlKMO55OjkJukTOD6oa+?=
 =?us-ascii?Q?CmveeszsASuUdOCxFjkLdLhslE1qETWdm9UKUKNPzEx5+llZC7sZSTdAcEks?=
 =?us-ascii?Q?TcZVShVXt93kIDXKwPsplm4fRUTPxxXgClDOHc34jb3ebgWIb0fy2yBbag9x?=
 =?us-ascii?Q?48SmxIuQ8g7vx9prelDJCSTxq4fGTbpRoN9jK5ry1ex7zW71iEPOoGOspDRJ?=
 =?us-ascii?Q?Pi7tJYOhhbg8y9JLt+W/TpAGT3q/LZkvnK8oH1DsR+yb6v8+RgZG/B0BSgXv?=
 =?us-ascii?Q?sQYAzvFF/784O7/nP8TtGM4yvUmMba3lbJurV9pCNchTn4dWv54xStx60VFP?=
 =?us-ascii?Q?oYQH6SNIWvCH9V3M/JrBPIkQ9z9P6qg4H5DptjoxuQ7VouxAOrU8bL14jAta?=
 =?us-ascii?Q?nyvbBDQgxB8b1ioZU0VAMBfNFcuMzFnGkRdgoYCQGcxzm6LyK3j8SxkhSaLE?=
 =?us-ascii?Q?a9ta3sg3vuuOmCNXQp2CBx9+IejSWdgL8be629Kqt2/gnKG3QNIetfCZJzAs?=
 =?us-ascii?Q?TYe9jLA4EL4ZzBi4tBy6rK/6dSVlspvJ27PxIgjPwUOgaYXX/K5D+JHEIuZg?=
 =?us-ascii?Q?O/jQ2s/wU/2xREKwD96Ga/PVtVQk8eG6knfj/Np86A/kACNMjVuesEabZOhB?=
 =?us-ascii?Q?BqGQKKJCWTk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VcCxC4QFDdWS8wbHoJEcc+9zitpRecd9AhydQLY08lvJePRs0bGJfpEivr5D?=
 =?us-ascii?Q?BkvO8GIK79CqA1B3d9CLc5iA7Ewtj5O08TSwb6HxnXT4P56yZip3OT08+DIY?=
 =?us-ascii?Q?PucdimVt16U1dYFleU8jgieBbY0k5aOANRKtJXe1qCivOy8SHfy4yimkk3J/?=
 =?us-ascii?Q?6tze7xobNufdVL3fOjhWYiqcuAB/6IJsuupgVrt8R0fZ1EIpzumMjbFwdSUM?=
 =?us-ascii?Q?s1zs42d/p9qLbtXG/IB+Xuh4JElH15WckU5aiMbGxEQ/pAEfRj6dL6pssXIy?=
 =?us-ascii?Q?UVdo/EfTr0XmAEeUsta3WjfwPDpw0AlZM30rrtr2bmMrPZLHu8bIkQglQA1v?=
 =?us-ascii?Q?AIsearte40ZkOP/gYzdtOejGVXxzh2sIfTEp8inY4QnnfwjKaq9BW+6pf9HM?=
 =?us-ascii?Q?4CZxoia++tIbSrmcLl2o268nJ2xd/IPPh+etYW4WIPUwwYBvYS+MAUPIVX4L?=
 =?us-ascii?Q?k2uwqVlvWHr16boty828d+KEc7BXcZz2veSyuawmO9cg4/ooUZf1iidVL+Ib?=
 =?us-ascii?Q?ycSTrFBDgPt7Kl3DAr/ST6pwCfOW+5makXTkoPW3kOB6WRTP9wrrLz9yROGe?=
 =?us-ascii?Q?Ax2M7ExtPK+XxYbcgmyhVU3R6M7j88LB6+7Sl2/VT3q8zcc+Ke6UGeMdBgyO?=
 =?us-ascii?Q?YKJbxsDBcGwj3zk73m6mxyDKyarTsdEY6N3XY8Yv0JCpM8x1cSM5P5zob+KV?=
 =?us-ascii?Q?hbuj2krJoGNz0LkkFwdsD2IHB3zcbu2+xlr3DnL+eVEqYq67J7ZiXctrzSSk?=
 =?us-ascii?Q?HXu4U0gGa/zz/QRJiZHLeAJ0D3HTH5piuGpYLuQg1bsRqmLzH2krvJby4YUs?=
 =?us-ascii?Q?OeVcbKYt30ggvJQr7lggMVnEBJwKn/bMm0wF4I9K2zY3a/Nib/tehBuCxtYY?=
 =?us-ascii?Q?KmBemwhXynHWzaPdM4vRz5LtOlqbE3aUzbX3tFdgKEun5KTrnWPsD6KfDFYI?=
 =?us-ascii?Q?H89XlKJi4LWkEf4aYkrzgg3tXc7Fdjw8Jd+MILpy41hqj0PQdi6vLcJorT4v?=
 =?us-ascii?Q?CEB8t/HRHODWcQNv8DgNetBGgZSj+B2H8AIqHHbS+U7OIOxwsufbfGBtDXOW?=
 =?us-ascii?Q?yC9Fvd1w0Li3O77eC02OJG0HQ4ETRrio2PcFpLnMrSAQK8mDI5TdJIUf+GFH?=
 =?us-ascii?Q?ZPA84ywLxQDqva8ZvAaFyGyzmUkbt0+t4HbOz7Nj7K6JKhI42tO2Js4o3F+A?=
 =?us-ascii?Q?ikPR/u9tz1QA+25t5x3Chn9lFWmRry/RAdMBV3x+f9991Vaj1AvzUpDMqOOZ?=
 =?us-ascii?Q?u5IasU9FTbLlCVTdJop4xXKmKYuZGpXOQK0NhsqOoJQxCM/oKYouERFn9YoE?=
 =?us-ascii?Q?F4Gzx5o5qp5e6cR04VqmpI1u8MVxRaxPG4WXr4ivCkh1jFQihzx15xQ4dy3D?=
 =?us-ascii?Q?F2pzdQPHUZiw0BHnAVTKfm8bU8TztXZ4log+HLxEfw/UF5EC8Xkr7YKSkLKp?=
 =?us-ascii?Q?dz69FBdCMTOnj+X9iXuWEOrmZXt8kd+IHzOJrY/6j5mbodP6BF/aPzJ44M3H?=
 =?us-ascii?Q?AWuR5NuMESfuB/K1ZXnxo91HpI0nIT361OsM11yEhT0UrnCyeUTvZmD0wEtR?=
 =?us-ascii?Q?osEWDzj8xLzVV28zJ/LcsC/P65wTOFmb1vaEWPcDHnCYjD0nPYrjhCmNQd8/?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wRij3B7CM8POJ5eaGJla3ovsVLGRzE2hCAvQJ0OD9P2hXZLqd4Y4lUHoFR6piyCcKhAzlE9EI0Y7dXIIdE8g8icFKftY031cmp1W014Bkt5wGOVifQyD+a1ZioJYA1WlL6XbkGH9y1NxCD4sXouU5Ge1YkGeaWXRpzzBhqSZTOKKQ+DYD8EVZ+fEBmE1cc0ePm4QhMSPgwR7ydG2qpHvLeK36/24cZSN8iIU/C+oGE6sVerT+p7n1F/9HqSFzMVubzkD8pmcJoSSkgu+mvFFWIMoQVsqvRsEkoyVyAkceePQjkOI5iyer6P1H71K6ooYaOw8b3QyF1+pltxRl7MzqhQwasMV4COXP32DJEyPQNZw9EE/A6vTiyGxB2KtzR0Yf9BbqApeTwlzvu/cGsO2KEhCA3Lmc6o3Az10d87hdVEaF+M8y+HuABp4Y44ZzRlBiEUlkn4OcLFCliKRCGnQSZdllD6Y3pQ3GT78M340u2SOETM4BqMG8njdQOaCj2nugKGCJ01zuq5xNQosFfIRKdbhQBzJz96cuxsFM8FOD8SdICJ5ET6lT50OQbt3i2/1DIlZcXkWd21LOWj6H8TcIC6vzPyfe1MofwEYHQaH7Ow=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e49a844-83d0-4996-48bf-08dda2b145e8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 15:14:02.3005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81suZCZfYSGuMhSZtlNgvij9ew5ZvVWZxTcHJeSCzTrAiSLCytJ5IIFIaOH2LHxyCHPkrrGjYvTMfMiy8sbe1qYDBHZIZ6snj6qVU6KedSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF871418173
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030132
X-Proofpoint-GUID: l1uCJuSnPlrS8qSxmu0IgLsKqYXycc2_
X-Proofpoint-ORIG-GUID: l1uCJuSnPlrS8qSxmu0IgLsKqYXycc2_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDEzMiBTYWx0ZWRfX1TBR5RtNZ4XH KKayLTPjXf0yymY0pv/olinhcRgPRxSIoQ8CffTdyjh9zW5O6EfrSc+HgNCDK0ovABxmBfyHI7n zHRmd6bGDbQjMd+nwB3U8nqz3Y26OI+jYNi3uAVJRh/q5Ni1cUF92acQmT85pKO8YGILfcogDft
 d9w9pg6lUPWkSax4RqU79jnYZQZEzyo40aOCVOvKuU5dWEk0t8YTh9JslfD1QM7Iwh2fHwea2zK kKWK9IIl1JmDuW/yAhPSLA4pxvfmPgL9OSX1zJGQhBqVxPCgtOkZwM99PEwS3iNS4FuosdZzeCh WgoNwtoLACMpjmWOAAWcYI6ivWOp9YpRKL39hZsxaPvBKbJsb0xSnvi1nuJSCGw74tV1YVzFs0S
 phuVS8AroameJLDZOd9I/0MNc6hMzjVLNy6MkGZUI8ZP4e6NDxmp5H6ylWm5RL7cWy0O5/pf
X-Authority-Analysis: v=2.4 cv=QI1oRhLL c=1 sm=1 tr=0 ts=683f113d b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=fzAUSFq3tkmxuekitGUA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714

On Tue, Jun 03, 2025 at 09:05:32AM -0600, Jonathan Corbet wrote:
> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
>
> > Thanks, I appreciate that. So I want to address your concerns as well as I
> > can. I think I have misunderstood you a little bit here too (text is a poor
> > medium, yada yada) so let me try to nail down what I feel is the sensible
> > way forward:
> >
> > 1. Once I am confident I have correctly addressed Jann's feedback I'll
> >    respin a v2 with the various 'sins' in place for the time being.
> >
> > 2. I will also drop the 'since v6.14' stuff you rightly raised in this
> > respin.
>
> So far so good
>
> > 3. I will create a follow-up series to address these issues in this file
> > -in general-:
> >
> > - Drop '!' from every reference so we get automated cross-referencing - I
> >   think now I understand the point (hopefully!) that Sphinx with
> >   automagically link every unique reference to a function/struct/etc. to
> >   one another.
>
> If you just drop the "!" you'll run into the "struct" problem you
> mentioned before.  You'll need to take out "struct" as well if you go
> this route...

Yeah I will do so...

>
> > - Perhaps hack in a **struct ** prefix so we get the 'best of both worlds'
> >   on this for types...?
>
> ...so yes you'd need to do that.

...with this hack as needed :)

>
> > I think my misapprehension about defining functions was not realising that
> > by doing :c:func:etc without the ! would automatically provide that
> > definition upon first reference to that function/struct/etc.?
> >
> > Is that correct/sensible?
> >
> > Would you want me to only use the :c:func: stuff in the _first_ mention of
> > a function and then to not use it from then on?
> >
> > I wonder if the _appropriate_ use of :c:func:...: is in the actual
> > definition, but since it's not really practical to do that right now* is
> > simply doing it upon first mention a sensible 'least worst' approach here?
>
> Here, I think, we've gone a bit off track again.  The goal of the
> automarkup code was to *never* need to use the :c:func: markup.  Let's
> just say that ... certain members of our community ... found that markup
> entirely intolerable - and, in truth, it is ugly.  So I wrote the
> initial automarkup extension; now, any time that the docs build sees
> function(), it looks for documentation for that function and creates a
> cross-reference if that documentation is found.
>
> The goal is that you should never need the :c:gunk: ever.
>
> Thanks,
>
> jon

OK thanks for clarifying, so let's do a take 2 of the action items:

1. Once I am confident I have correctly addressed Jann's feedback I'll
   respin a v2 with the various 'sins' in place for the time being.

2. I will also drop the 'since v6.14' stuff you rightly raised in this
respin.

3. I will create a follow-up series to address these issues in this file
   -in general-.

4. Drop '!' from every reference so we get automated cross-referencing (with the
   ** struct ** hack as needed).

5. Where possible see if we have functions documented, and if so avoid the
   :c:... noise. If we can't avoid it for now, note down the functions and add
   to todo to get documented. We can remove the gunk as we go...

A couple questions on point 5:

- When you say 'documentation', do you mean the /** kernel-doc stuff?

- Does running `make SPHINXDIRS=mm htmldocs` suffice to have this script run? As
  this is how I've been previewing my changes so far!

Thanks,

Lorenzo

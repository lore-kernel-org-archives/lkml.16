Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37EF1B0F23;
	Tue, 15 Apr 2025 15:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732431; cv=fail; b=qkQ5HWC9O9+ayX1HkNOyn3wld9O0bAKpGULV2fLQrFlqtni7S/OFGKn97Icej0dPWzwBQQNHKcvpYNZm2HUF6jpZold8/GTkW+UMV3D8ZDPsO+g6j+BA4OF2SczZe6vBuLoPfqM2gL5aJT62HYEpwpxYXfXaGGH3svUlAl/Y1Uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732431; c=relaxed/simple;
	bh=8gB2qAyeOs/7cCTJ4oOQF8jRNXTyGCD9BzAiaeSaKRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RikPOPfzWebXX4kk5UHiZDe9kwQmh9mWHxCiymUOZoh82E5XRM1r5Alyl1D+LG+mt+UdDQJKC4JOrmW5cNRTF2A/GUQFddQ9I88lgiOXbmuEcVJhmcffGCamdZNTm2hVBGC+FgoIFqxAsu3bn82pozyg0MwZQrHjrC44i4SvXno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PKjL68Et; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=A6Qazkcc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PKjL68Et";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="A6Qazkcc"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FFMgpZ023478;
	Tue, 15 Apr 2025 15:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=vxLkIWjN4xcDgkK73e
	e0i/2/hVJaTBjCuGU+CXBk7EA=; b=PKjL68EtK8RCwLxwQ+JQELZbe4MgH6GkQK
	XoLSSTtb97DW38USTeIjPWSB/iREymt7fKcpKPdX5AKyEJUd5pYIh6Yjj/7NOSml
	9lvj3NRvq/kostGlCMcqrx28zZtW09l0Frtx6geQHQ7Mc2R4eTlNZwyfyaJ5g3eg
	d8QzXpIEZaGzFk5Kq/r2bU1KPgWWMFzWuqRFDzxuG9DFXRio93vnqPIGTVH5H5Aj
	EnkEE/WnIpzkPKAiImXKhCoilGwq+0/VvrcJX59+/aFRilRcGLbNGLZLI8dpBafB
	v5Kguoav+0/4iHSVkrUVo9GggBHHmQAUzCYFgMFFOLjU0V4/WS+A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4619441v43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 15:53:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FF553h005731;
	Tue, 15 Apr 2025 15:53:35 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazlp17010007.outbound.protection.outlook.com [40.93.11.7])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d5vgky3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 15:53:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHnhA5gCk8uQK6Ryrq6+ZgFr3wc0DjeTNW58bGF0AsaJd2G/65LKamAQwcW/Fk4lqaXOJsXoDnOfbx1KrF/H6aEk0h1i6+p2MmmLA8RDrR6GaOKNY9lTPzR56xNFqDmiEp6SeIsz5n/+XS0FjhjLmIj2Y2EGyYK6/3CuIQD2rBT5MgXenAm9Lh1BKno/bRXPdCJ57hp+jyYWr/udni1nd2FfuaByA0xmvj8oGZx4itfys41ZJzH5/5dZy6D0tYDeWgBCtuLsxgMkbvOYRWpCOwc6s2ARJpSwOU9b1UBB4nZ/mlCH8hlzW/CKboI9rXkaW7/6QJdJk++ds3VHNPM3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxLkIWjN4xcDgkK73ee0i/2/hVJaTBjCuGU+CXBk7EA=;
 b=kDM9w8ZyiHMGNDgCd/2Gn0nFHiRmzhv8TN5FeLPmcnhhu+IwpN09KaalHYWsMfJpSM1NJS4XmjmYesfUZS4NL2QB9DtnDhpQy8hbuMr22BbNXvUx7FdvlXzb3oTus9KOPQrAee8pe64HrwUIabslVqTczdpWrWoQcanfbh8Fw8NT2J3ohCs4yNDzNeCwtUczgs5I/ARU7cngKMy42+eolVYRh7GDWCW5aRaE2ceaT/pkUcYNjkadIVmmjKYWyViqA/22Pf7dvrqsaEy05s1yOD2SNkL84qRJCa1hwITcICE5npxLCnsv5TF3ucdPc0FZ7tO8Uv20lGjvFFGSZwwB3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxLkIWjN4xcDgkK73ee0i/2/hVJaTBjCuGU+CXBk7EA=;
 b=A6QazkccNE+uL9a0ZQ+64WTX/o+N19je7OcU+fXSnfgQnoIJrX76dKDhEKsQVp9AFEyHSXZqEN0P9Uw9Sn92VbhcgkJLaZx3tmMujBsY/Icj0MrDZQIJF/PkZFFS1qD9XGmLSOL0Luo5eQfmK11WL2M9LJa1qtYf9zzjZbY2BjI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN7PR10MB6288.namprd10.prod.outlook.com (2603:10b6:806:26c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 15:53:30 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 15:53:30 +0000
Date: Tue, 15 Apr 2025 16:53:28 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: corbet@lwn.net, chenhuacai@kernel.org, kernel@xen0n.name,
        akpm@linux-foundation.org, jeffxu@chromium.org,
        Liam.Howlett@oracle.com, kees@kernel.org, hca@linux.ibm.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, xry111@xry111.site, tglx@linutronix.de,
        thomas.weissschuh@linutronix.de, Jason@zx2c4.com,
        zhanjun@uniontech.com, niecheng1@uniontech.com,
        guanwentao@uniontech.com
Subject: Re: [PATCH v2] mseal sysmap: enable LoongArch
Message-ID: <6954e026-94d2-4d96-a8f6-eddf0353598b@lucifer.local>
References: <648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com>
X-ClientProxiedBy: LO4P302CA0040.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN7PR10MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d74a121-2d4a-4ac8-fb1d-08dd7c35ab6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ueUjL7+Tbqeq+uu7wBf4rpyEBzUTmjNmgAv58tIv4W0UE83bAWCNN7c0zt1c?=
 =?us-ascii?Q?CAV5FMkzwWM5Sa9Al1Y0jzwGSPv5jt2L7918H3GyPHr5hMP7j+fgBGxQgg14?=
 =?us-ascii?Q?Yh9VWrL8frriXnjaU6g8UC1bch/Vc+iOc+m29FFSLTZB/uYiyg6sbyRgSdJU?=
 =?us-ascii?Q?uNBKttN8YZglSJ0dUAohCc/YcdjbE+57I7HWywPUqLT58zPrtvK5/cUTqEtI?=
 =?us-ascii?Q?fR41fAWDFNphaBOCJVFAC/dL6vjp/3sRh18fTjX1fhzPKL1eqEe70TbKpuxn?=
 =?us-ascii?Q?7FNTtZJvAzLEZU8BufamZqjW9H8pvjMlzkVzxsHbvsq+NLHPyB58HBSti/Uv?=
 =?us-ascii?Q?tPD7xqnGYAVEA257nicvbmy7yWR5lHm2KmA7uGgU4MhlByUw3XjkTEP6pdl8?=
 =?us-ascii?Q?/wd9secgoulXV1/8uBuQ4wnSJiWsb9WuHMuygTiQHgkaQDeUbeLvGYRPhP3M?=
 =?us-ascii?Q?nhEfo+GskIjJ8zDLN62vGLMrreYqZhs53utgRfDZX/DGw9Jnb68/542cryWo?=
 =?us-ascii?Q?WfBhqPDGjsCpBr1JP+mqnKEyVgZbRif1KUaXkrcRz5mLjfNjz7lwSbdOBTXE?=
 =?us-ascii?Q?ietIIt6VEv+m/gJe1Rhg6JNm5/9V08zxIctQjVnD2LZ5NIpe8i+jlOusmtuE?=
 =?us-ascii?Q?lpS6hOA73nuwbp5hbL8T8Rf7LVRenV1SGKlCNOFnf7PdxyVc+YZ/0REUQatr?=
 =?us-ascii?Q?0N9dIqZboE25sVmTeF5IXemOPyUdiAJ1UpOMq5FEXmLstBB2S17dgck6IIwP?=
 =?us-ascii?Q?/4Zu1uGjt5GkWFOfOBoD3/oSFQlm99HoJCSSmDD6VG1U+56nu2TRvw7zqfbh?=
 =?us-ascii?Q?ifX8GDh9aP6CLyOLUjl4XSB4bl9LIL1xOj3vjh4prXUYrEj4RXU1HkHzt6/l?=
 =?us-ascii?Q?15VZ/0m7vRw0UbwGeZS0myNi8kHbpBshvu+AXau9qN58D7nQuAQs+tNy3LPF?=
 =?us-ascii?Q?Y2vEI+71BU8SXOUx8To9KSGGMHaSUXWY8GszHonS4yDMN4TQ1dAacOLYthbj?=
 =?us-ascii?Q?9HzF+KNmR81dgIyNu+/XmHiRA5rGCZ5TOlL2KOpIlsoZy67n4DY0vsEYd2sB?=
 =?us-ascii?Q?ublmBuyv+7mJlnHsKN2pmqJshd65hJx4WUqganHoKtjubD2y8PZ+4lEHP1zn?=
 =?us-ascii?Q?/G12Awb4Nr8lkewk5WDaenuz9/5XEg9vMBLh395lnTMxb/LBAOM+mddLls8i?=
 =?us-ascii?Q?gaIDC1er/SQFY9b8LCNP3Jpq3AA7aktdrpEkkyWWmDF42nHVDdzJSz63vm1J?=
 =?us-ascii?Q?PqbgUuK6nTPzHXHOAsSbdNv4U6kPAy2P1oLL7ZMsaD9mocLK3IJXvPpDftG6?=
 =?us-ascii?Q?UHvDZ3q2AFS28qPVpkCfpLHZqEi3XHBYrZ7M363mKzw80PB6ILP6rNCPV14Z?=
 =?us-ascii?Q?BwthyjZf/N0kYAVenqo6+DsTqpW/de+oLtoTPhpChBN9c52xWx9BJoFAQGHx?=
 =?us-ascii?Q?2d9DsVRLo1w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KGO7AlXcqYovf30fVLYoFToYYdUFHCq1Ve2KeUP0t11URu6TYJcVC9r4sxd6?=
 =?us-ascii?Q?KoMMMGH24wgOkOmEOirqhRR+cxxse0uVLYgOq/jdnSVMTDFQ0LLMyLqJ8szB?=
 =?us-ascii?Q?tI7Y/bl5+dKyWFPyjReOWI6NQI1i4KEbj+V4k6vrfoKtn7t3i54DODBhczPd?=
 =?us-ascii?Q?8ofSJ3x/ccIiG5hrupg8MrOz8IzDNOs5nGnCHgO0uuaQwwb7fMmadr34KaJm?=
 =?us-ascii?Q?kFoss6ntM5fZFaS2Ttk9flr09mh0MmM9KNb+U/Tctn2K17wgv0KziyC0JrU6?=
 =?us-ascii?Q?YEP1KuqpSBtapaGQMP7SIAQwzUSQp5UCXr6r+qJrOPmxVmeIck29pZcDPDo1?=
 =?us-ascii?Q?NpQFgeak6kc5gygIxbMA8lTLEhlTRLe41ZA1UU9XxH99Z50hDhKU/YXO79D8?=
 =?us-ascii?Q?Yv/t8+QzHvyjAkymlzqnzqpFmjCpU/rUEEWiiOh+fYxhoAEU5CqaAQSZmYQt?=
 =?us-ascii?Q?4ClN5yiwK1+Hni0KTONC4jcc2WrGnanJvhthvgAAUV31l8i7pseRwGOmKlor?=
 =?us-ascii?Q?9k/Sn6TjBq/RN7zRYl0AOUrvHDHcEK5aD4pcYhcD2CN5Q+b3HoaIOqwdlsK8?=
 =?us-ascii?Q?I0R+WogQmOeOHS9wsFH2bZn+oMxkfcdFGNKjJhrp4RC6u4qQUCk5Mshr+nrj?=
 =?us-ascii?Q?qabNjFSkibxnwP1r5AyHgL0hC67918pc9R7ltcRZ2fgogPIL8UJMi6JYlX5p?=
 =?us-ascii?Q?uNvsINKGNF0MMlk/dskMdfSBkksS7UYRZlOUV2x3egxM9d+DZX8soDGl0MGk?=
 =?us-ascii?Q?ozgwcbSz4TFUjjCI75VNLnxaxAQ8/vUisiviPXiDPPHF+oL70hULh+TxdxUx?=
 =?us-ascii?Q?fgR7eWy947r5nyAkvj1tliOi1LHY5syzRXzSVX9avlxGpxlFYapGWTTKc0rq?=
 =?us-ascii?Q?RxvMThv5g9I58C+JGz8RXOtpyMij4ipXas7tO54PFU0gQoG2KOlGob7npYNj?=
 =?us-ascii?Q?ditB+R91ha/zeBU2K7k8bcjniP78+IBJu5reoANc+c44eDZv+kBjdEr7n8hq?=
 =?us-ascii?Q?uOO7p+mVyAwk7smfxO5RU3Hu09W3EG8sVYdWUxyTJFmMBBNRTQk1TcfHQcUq?=
 =?us-ascii?Q?ZlAHQOLnwH+f/664q4kXYjRPh90pYCjx9nLtS4DxwmQC7Pz3AuCwHDWe8aLq?=
 =?us-ascii?Q?A/gCKt2PcCLoVgkHUl6o0bV9JGFv7QuJ6mDqc5is9L13Hm/DMupKN+mmTHW8?=
 =?us-ascii?Q?/cfZaGaw91Awdwi0Mm9v4yCUHC2J0anpOTcwDJmMCcz0o+bxZPeXfW1RjEnV?=
 =?us-ascii?Q?qe/EqWNlSFTfNrsbcxGJfV+lXBUv2KmCZJHRWupG6Jp6FQEr1mlWg6qNGho8?=
 =?us-ascii?Q?gJIPf2yQSBiI1XXCW+uiM9DoXXMAweid+maZ7hiSUzLMro4d8L7SL0qnwRkk?=
 =?us-ascii?Q?61D7+H5HrxLzONxSVqCPGGFMXkF/OY/5k0NkTW6/IbmosjtKCJg0mzWomJfw?=
 =?us-ascii?Q?5Z4WEkUTBh5xYGuk2lPabrf6Q3JI6PAPbne+WtZOPtvtNIm9ftgdiP4J8FEm?=
 =?us-ascii?Q?Ioz6i2lUMsfob9KMqp9dkH85Rk0F5RmaTXcn+IlEQmAV2KThWlz5y0in2S/1?=
 =?us-ascii?Q?IANZ5Ud1j+iqbTlVoYZdczyv5pOGjwb1lyyV4ci+8TW1HbzHCHvKxyrVK+tf?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bR1XiMmHqo5PbyG9NV0NwNkFbXFQzTMKjVgI7XhXSRD/RehISb/khpXWPH7iYGQRtthhZ/AiV7whHTCrBJnLGZKhEVGVvjDBUIHB2Ig4gd/GeA+/FIIhfJ5LdIf0bmEUl90DFhvBnF1tjc71I+OxNELbUFxauBB1OmZhsg0K7jshJ2+DlPxHslzo6QmIqXRm+iGxp0qV9Gb14bz1h+uo0tLjGlBz3pv7hYO73kMH5J1K+/UAdt4PGZkM/i7v0BXvf5PLQYotSXDVo0i4HoUnGKGLWhn48y94tw6Lxo+UgPOcOoyZEI0K+EaOW3zP6gXdRLK5/IxB3qKeqwgSpbTD8Ur62zMGt16MnEIHqHQxie5XBTys+A8Of3EsLV5cTcLrfg8CMzq3wbV5rNDkFxdui3AQxLdg66qV8sqOX+drhTFN6IV7/9dkef96S4Cof8v+3jAPCn7+gNOtcSuKwqcHxE+/Hl90XzG4cqZsHFt8ffph7xgFb3YClc+5US1iztPOo+T0Kg+6C5RPGSrRh1w9FMB6+ZymYCNMGVDbfbmfBpJGhj6XsYHMZqq7KyTvjVUvMVmjPlKKnxhfwQxJiXKDpdynKhjFTqhPzGIkq7p6jnY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d74a121-2d4a-4ac8-fb1d-08dd7c35ab6d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 15:53:30.8598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hgSzXLuqf12mStR3fuqhull0n9/LCl/feI0ZDxXxqM/I6ILQG6NWxpJC/c8TDPP0/+QwfCIvXqmc5jXNmnbNdzOCxtSXrhdDMmzfgFT2mw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6288
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504150111
X-Proofpoint-GUID: g59IENipKq1wgFuGkKkohBcEFep5cVhb
X-Proofpoint-ORIG-GUID: g59IENipKq1wgFuGkKkohBcEFep5cVhb

On Tue, Apr 15, 2025 at 11:39:03PM +0800, WangYuli wrote:
> Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS on LoongArch,
> covering the vdso.

I've also checked and determined that, as far as I can tell, the loongarch
arch-specific doe don't appear at any point to rely upon remapping the VDSO
or VVAR areas so sealing these should not be problematic.

>
> Link: https://lore.kernel.org/all/25bad37f-273e-4626-999c-e1890be96182@lucifer.local/
> Tested-by: Yuli Wang <wangyuli@uniontech.com>
> Signed-off-by: Yuli Wang <wangyuli@uniontech.com>

LGTM,

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

But let's get some R-b's from the arch people please!

> ---
> Changelog:
>  *v1->v2: Modify mseal_sys_mappings/arch-support.txt.
> ---
>  .../features/core/mseal_sys_mappings/arch-support.txt         | 2 +-
>  Documentation/userspace-api/mseal.rst                         | 2 +-
>  arch/loongarch/Kconfig                                        | 1 +
>  arch/loongarch/kernel/vdso.c                                  | 4 +++-
>  4 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/features/core/mseal_sys_mappings/arch-support.txt b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> index c6cab9760d57..a3c24233eb9b 100644
> --- a/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> +++ b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> @@ -12,7 +12,7 @@
>      |       arm64: |  ok  |
>      |        csky: |  N/A |
>      |     hexagon: |  N/A |
> -    |   loongarch: | TODO |
> +    |   loongarch: |  ok  |
>      |        m68k: |  N/A |
>      |  microblaze: |  N/A |
>      |        mips: | TODO |
> diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/userspace-api/mseal.rst
> index 1dabfc29be0d..ef733f69003d 100644
> --- a/Documentation/userspace-api/mseal.rst
> +++ b/Documentation/userspace-api/mseal.rst
> @@ -144,7 +144,7 @@ Use cases
>    architecture.
>
>    The following architectures currently support this feature: x86-64, arm64,
> -  and s390.
> +  loongarch and s390.
>
>    WARNING: This feature breaks programs which rely on relocating
>    or unmapping system mappings. Known broken software at the time
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 067c0b994648..54ed5b59a690 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -69,6 +69,7 @@ config LOONGARCH
>  	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>  	select ARCH_SUPPORTS_LTO_CLANG
>  	select ARCH_SUPPORTS_LTO_CLANG_THIN
> +	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
>  	select ARCH_SUPPORTS_NUMA_BALANCING
>  	select ARCH_SUPPORTS_RT
>  	select ARCH_USE_BUILTIN_BSWAP
> diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
> index 10cf1608c7b3..7b888d9085a0 100644
> --- a/arch/loongarch/kernel/vdso.c
> +++ b/arch/loongarch/kernel/vdso.c
> @@ -105,7 +105,9 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
>
>  	vdso_addr = data_addr + VVAR_SIZE;
>  	vma = _install_special_mapping(mm, vdso_addr, info->size,
> -				       VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC,
> +				       VM_READ | VM_EXEC |
> +				       VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC |
> +				       VM_SEALED_SYSMAP,
>  				       &info->code_mapping);
>  	if (IS_ERR(vma)) {
>  		ret = PTR_ERR(vma);
> --
> 2.49.0
>

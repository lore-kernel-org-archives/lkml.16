Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1593D221FCE
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704983; cv=fail; b=l+nYVxCRMJHE9C3QdB2kpUMhjvM6anxfLTmfjXaaA80rTbQUsv2q4t1wc0Q3tZvOaBDG2VScBKa6E9sLK6xqR1nYNo/sclD4g2cNZeXpYglhmimNgyM33ZCYx1pk6wL1v2PreN3pk+ADH8uWz0Uvd/tGb+EO1OsSyR5kq4nnCfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704983; c=relaxed/simple;
	bh=rzM73ZRoT4RlagQZWN0pc5N4QIz3H17p5kvdhYN8VPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z0qRpF3jmBRJLbENnx7U9KXJlFgolAfDBsqp1KZZxMYDfCow+TOwX4pnmYZcyH1rKWcab1JB0SIhIrO/ikDwQoWounm8GXEMRCD8LB+aP1vXgqZxUaR11Zf4SK1hFgKZz3wNqH9UaOUuW0r+baginkJUFCyXhupayNa9y+Y/njI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Lfxf1KuO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WiD0Xc5a; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Lfxf1KuO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WiD0Xc5a"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548BlBxe011550;
	Thu, 8 May 2025 11:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=EqFHT6f8b+lnDy8VK1
	FvKz6PmXj74DRq1PcwB5l5NKE=; b=Lfxf1KuOdzEP98O4amGayGWiiHS2aSj3eu
	ePkMQeW423ANylBWV/qw3KCcUGdTBDJ2qXrFl9D4Nkf+WXn64TCBY7O1U4cMoJ76
	s2OKDR/Zp+EI3Eh0HOW6U2QePQKqHF+ifb2P7X0M3XNsIwxadmlZUwD5WY9tsceY
	6orwhKc6nukYlf8L3lMGMeHvXG16NuZdASqAKmtPgiVx9QkW35z+zGG2bsBNAcZw
	qh6XAWhxGzJasWsRzV2SmBDAuTaOFTXMARvsAEf4XUB8HWuI2yGT6IAQjMrcuCwo
	qXKOWiW6x8whlS8gLHgZvZaAzXT9HVtd3ELrjER60PsPZUhyNajQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46gv1qr02r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 11:49:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 548BH8tV037538;
	Thu, 8 May 2025 11:49:15 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012050.outbound.protection.outlook.com [40.93.20.50])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kbbs7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 11:49:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/6y0gF6PIcgwOXk3I8A6EDhCdgVpRcsvMGNtF9VaDtLLHC2wfTl7anCQpdjm1MoA+2EI0CWx51XkiFjO5CAisCOOgJWYltdtNah9Bvz7NZAi1FqnvQktDwxig3+gidJNsdNc9cCo9Fww2hAKW5LW0aK7iboOJQPWPDw/fkUsTUiuZAMqBLokczt03ZbobMoPiaegPJQq2AAD9qy/Ky8fRzseAw+chfbKmrxoBWSzF5x2xsta2lh0S61qO1KBNLrh/OG7BgiJ9arH0lIbIO1lybR5ikUeOuLV6EbmXKXkWR9uLRD2N/r8ubx4P57CCXuN3SYndWhRtgJQjq1iFBxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqFHT6f8b+lnDy8VK1FvKz6PmXj74DRq1PcwB5l5NKE=;
 b=s1NFz5PwkdZ4wYKDbp4wMa6lYwqX6IP0sr3YNQwapT6lw8RwzUHG/BJzQY5ToAMDhX7DELMVXceCOf2Wdw7RWWYGeAZOjtoCxq26OzJN0dJG22dfc2pDcRCJiTPjtENmeEs4rk42zGEg97mMllKr/aPlLuLh5FXX/g+tVnq+ti0dNlNCSrJjXaOyWr/zcwdkGrxHbdqb4bQKH5M5VYv/hZ9WKCicTUJCdIXg/9BUVsrMBQY5QuV+AZjtKoo70YSJDO3cLr6WY1TRztE+cSrFu5YCReTaQo/0i2pK9/pwLZkws9DZiIb8+5k/fY43hjx9QlIE3J90tsO9gttN0mwArA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqFHT6f8b+lnDy8VK1FvKz6PmXj74DRq1PcwB5l5NKE=;
 b=WiD0Xc5a9o+3Igk3a4Pdypc5r4KPsi/Ge3sMt0pKLs/ilikdTEMd7qqr8IwIU6997vxDNngYJAIOckhu3Z8/D4dgR4QG8e7TEngX88uA669XmFo+x2Vcsw8Yjw2s3iEvWLhEU/RzF0q2Q5Ro3w29R6V2rEsqc6DY05/l7zml8/8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BY5PR10MB4145.namprd10.prod.outlook.com (2603:10b6:a03:208::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Thu, 8 May
 2025 11:49:08 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 11:49:08 +0000
Date: Thu, 8 May 2025 12:49:05 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ignacio.MorenoGonzalez@kuka.com
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        yang@os.amperecomputing.com, willy@infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
Message-ID: <c4431944-3db8-4c64-b6c4-aedd1f965083@lucifer.local>
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
X-ClientProxiedBy: LO4P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BY5PR10MB4145:EE_
X-MS-Office365-Filtering-Correlation-Id: e840c2c9-4421-4819-8e04-08dd8e26579a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q6hhP7ipftzSyBqty1frta6Ypt6MWGq4S6lHTrNCu+XRsrdCIoOeO/brGj+G?=
 =?us-ascii?Q?ywpf6Q/D4GYaYJMjFrQ4UIauH372adWzXNP67f1VXK1GDCBZ+Q9mk0qZMkBA?=
 =?us-ascii?Q?wMtT5gDLrRdYKM+0UZXyysWGTdYrIovq40xiLoFJNBhAey1sUaEYdrJXnYwT?=
 =?us-ascii?Q?+ivS617Z0xpLMyBKQ9OFqafy1/ytSoaU2Ejaeet706+ZZxV81v1Dob6HFhcY?=
 =?us-ascii?Q?k7ay4dtHboPUeZCpjCC5m0aXQtKFt62xZcjQ3thMcSOTOs83qCpBrBSF/byJ?=
 =?us-ascii?Q?80/MREghG7ZZ8xPy7D7LS80UXw13HSY89VtNNF5+04mTYJhaFaQElPJq8jRB?=
 =?us-ascii?Q?1xjCL/aH75mGC6ZdvqC9jOH5Z+UAGC4GafU85iA2WqY0YrnGIPhr5DuVEg41?=
 =?us-ascii?Q?ChRhQdVlECM+yYOiQgb3pCRkMVCUVbv+PZagWjAH2tw2zqJEqyxQZPhJGruI?=
 =?us-ascii?Q?bQU5A973XBVGCYaSUkb/pYi+tunoB2sHBadx2SqQ35EdWGzPj99HJsBg5Plb?=
 =?us-ascii?Q?5SA+HorwZzP+KrsQXsJLtu/Z9JV244ZEc1ikAVpsv/GK8WrmfxPxTymUCegc?=
 =?us-ascii?Q?jIX5h0OPziHFV9Ob5Z3jLQskLYprKUmbbQTQ/tQDnZEDAHFmA64RNUFsFa2/?=
 =?us-ascii?Q?Pm2S78nUsoo/e6Svy61VCyUFFXiTrA131Jc3xe6JITZTYMXC/400i2arGIZE?=
 =?us-ascii?Q?eNfpm86V89xgyP8CwRn7jcki2UFzFh42NBFZR+2TQzKxYGpHUM3yxVGr4vkP?=
 =?us-ascii?Q?eVjsp8Bwi5wkBrzGX+nHm5pX/m22F3JpiEO/nwEuhzKosD8s3/6v1ESPx3fN?=
 =?us-ascii?Q?C7QvAGuPALhdKsB68dkJmOrWl7CICVRLXd7OvcFoGqcTVF78oiu/9NvntVTK?=
 =?us-ascii?Q?hZA4epDrPw3P+SZ3ry0ghLJ6su+rgEv+N/ogsm8LsD1Kw9pHYve+tvGq6phj?=
 =?us-ascii?Q?cLSxrF3qId7J8KXUElSS8x3OtHrWWyIjk3dqPtQVNfiVpXQPhqlA6Hz8BNnu?=
 =?us-ascii?Q?M2pupjQGs3aQN8Sfk3IP9ojyQVaY1tc9VjqW/izUvoxal+IinmVc5k8Sdq3w?=
 =?us-ascii?Q?m3smLIR4cilDD+xaEUv+qdJaXfxLPbzBXGxZqSYeKJySGyOh+F1kr+07eCQ7?=
 =?us-ascii?Q?Ypz49vjzuBS/+FpR778h1rc+o5bhfqr6PxuDinKb50l2UautJwrEgCCkdyHO?=
 =?us-ascii?Q?XDCDuVubnVcALwUj7EfBdEzy6PKKDG/fUiCKNxLtGUwjrl8w8UisYQsItE0B?=
 =?us-ascii?Q?SBDCvSASpSsADlzQ9B9XAjAsDtgfpJF1rxREGq+8c0/JNPZeCI62+bfKJtZ7?=
 =?us-ascii?Q?DXJYp8P4D5C4Fa9npYBgr9GSTmPzH0c4eqghI0hXHHtCmrYTngC4a2P6J9+x?=
 =?us-ascii?Q?nzMsLvTFXpY9s/XgrjbhfVZhCE18t8RaoscbyMd28iSZwPMa+2Bl5QGyD1+e?=
 =?us-ascii?Q?vAbiiNds7fY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cmM73C61jRIag9ehIP3aOCf/j3sMpkONIfB4tMrfagUfR1iv/uUr2Y8Sdz+Q?=
 =?us-ascii?Q?5HIo5HfO9yh4DNRhuruUTZU/N4oemzkoJybtQDcvsbXi97GOWf5tWNuzClr1?=
 =?us-ascii?Q?oEcE6xm9oVID18NqA7ogRQwnul1cbB3MzSMfcZdqLfURI7z2K4x7mLhApRsZ?=
 =?us-ascii?Q?J11o4b1dtC8Cxak2GmyTyX774kLddULccoetTZ5g9oLPQYMaTJFz+Qp71iwC?=
 =?us-ascii?Q?kUd6U6e7dI981BwW1+GiAbmtF5HnBeOqYpfS3I5nB7sLOczqt2EGNgLFNGON?=
 =?us-ascii?Q?2UEipEDPrjwz+AhCS+qDO8hwxANJ8JNnGT78R5A84tvezBUEFiUDiqtF9Hpc?=
 =?us-ascii?Q?/lPkLT0ZMZzE/GtMIsonxCmEaQAEuGWYzxR02hJ8rQDZYwMT2nXZ/0xry/uT?=
 =?us-ascii?Q?dAbKa678mIYIrBuwq68F3zkAIOaIrl6gRq5RB0tsXCxMjsc/6krKD+8GuBYh?=
 =?us-ascii?Q?lTP7SxcZKQlGV7PQGyajnshZP4FHRbfgPv7fmB2ILBxc8K04iPzZ/NiLX4SA?=
 =?us-ascii?Q?Opp0SmowlgjDI+FkFvYxONedbO36/bXhJQILSMW9VkbfTIIdHskW6WZCi4Iv?=
 =?us-ascii?Q?34XcTA4hPsWOngWK9wrxL8JaFr1tzj/MbjDAG/+GKcV9f/1gADe2+XFTOewV?=
 =?us-ascii?Q?Oq9n/cqBwbWa82ApHoU3keAHCtCFVsvoZh8/IpCiBGPDzAU6z4dOSPk4DABS?=
 =?us-ascii?Q?y4u6vIXKcYPsIbWO0lHkuhAG3Q/8JMZA8CunWlL9r/4/5wg0BJi1I2pQNRD+?=
 =?us-ascii?Q?WUXKcrrZdWc8iZtW1vr5hUiC59t9cOa/WkhDXhgjXTBcifHuDeasMiqjvq/N?=
 =?us-ascii?Q?OvGR3KArhzR8a+D0/49mxxEvB0vBixDmihv3kkhjcQND3eYkwmGWVr7Y+v98?=
 =?us-ascii?Q?SPQzoZj4zLyS9wWickqtjCVFBExpa2M0qWBFS15aRLFvAkH0YlCIudEZFYXi?=
 =?us-ascii?Q?q1BiyuJODvb+JbQG6rOT0hV2xfhSWn3A/4dT0v0IVe3f6gBktdSRBp+34Z67?=
 =?us-ascii?Q?Ytass6p4etwdwRmV2WWne7Gvt9jPb0KznPlCv0HhpxpYe4bZUAyD85LINljK?=
 =?us-ascii?Q?BwmSXMYCrACeBPTM9KBjccq2Zs6wmi22Rjcm2ii/WIuq8POQDnbKplz0SLH2?=
 =?us-ascii?Q?QjITW8Cet+E0ybt0owWom6W5lxrdnjtjo05VnTxUIuVSw2OoZlx4mHtv2cd3?=
 =?us-ascii?Q?ImG34caim4tcX8aAIYRIGDbLdRTj7OkYC2dgd4v1JCa5KqUZRtLBR6HjtQNB?=
 =?us-ascii?Q?UWXyM/8XVUg1NU+8Dw66+u4umvm+IbTt2UVZGkOSE8FHR/nKYCWfSPkU3/Ui?=
 =?us-ascii?Q?lve+M3+I/dNMXw0QjpT45X7nUg4iWATnGL8S9b0U/4HkYaTw9z2GxxQVihei?=
 =?us-ascii?Q?/6w+ZIZSdKpIla70QoK1i94yhAwd69EAK+P9Bf8ewir/0db1MriXAK8nmX1b?=
 =?us-ascii?Q?nb9dm/+LFR+fXBVmJ1Nn5NhQwEGoGxMH+W8MkJiSbHWPCQPkscyRqae/0cG5?=
 =?us-ascii?Q?z7bEkxDYb3dElyQR/ykISyeYbmsc1GhtH89gznXugmRvs/Cbv9rJITFxg+qo?=
 =?us-ascii?Q?QAInJoAbofFiopRPaxvuhZhtPkl88RXOOq0bNUEJ/hsPBXnt0nfyC2dwG3/E?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HhnmLtQxR64DTfEJFhcYlvBqKXprmCqVlH+PKDlMp5lVcUHHZtHjUDEiV+tXjWuFhxzzVtqRAkYHSaSIHlLPTPUUlNOTVb5F0XPHwi/c2gwpXSHYVfu2yXqsbf6clUd4OAlOTxSUGOF3fTLO2kj39rCJI0EJmIjPz0O92vZe8VIkHZVTh9HtbIv9GUUf4rFowJcTCRJQpMN/jvfV77nlnlmtfu140w/59vW3Gh/UCfTau10hSXr2+ZlEmPg4Z4yAx2epjMeEBJncBA7TxIH259aVwg7gGE6aeCNCgezsaqWH5YYo+HGqjWiHxgAEHoPTvWMP9urgCNIHZAw2aIeeDiJWqwyS0S7jjSuZkV2gTQjS7tXfpe9c6pR1j0YPV10BvtA3FJB1mJf+3DOwyR9a9dDyuh039ydt6gyfHXgkWh1uoCBaikObu0zNnjPVvmEyTh5XRQOJjpJcSn+N2/reLP2jWOTmwp0LZllTn4MkKDwrLeEn+oIL/5S+B7xVe7mMQVFHOFtwKpmqykA97ssgdgWfhOr4/F8A/3CcdA6foZMeT0dISWWWlHuE0AcntAn9GhOUfB2hOcgjR40djbcrqUcqUUK1PGxuGz976GGdfIs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e840c2c9-4421-4819-8e04-08dd8e26579a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 11:49:08.6826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3miqkVpgdGBwctwPrmE4KYM0AozN3zBKY1ZMFgcAyONE+4V7qf2OFeCE2G0SOOOcp8yGs6bKMkuADxhFgl/mdPa3MUbANUei47C0qFBjQnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4145
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505080097
X-Proofpoint-GUID: l4mp3Og867pa1gjaF0-HHlT4dnD6jLJx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA5NyBTYWx0ZWRfXzonjF0D1NDrq gfAC/yEduWIsVc8BQCA36H2+aMG12594rHnnJvydaNmOLoMJFvFbYTXfGoeaON2bN/46+0ZL0cz BzZi0HqAcDoTZEI2EBVSgMu0w2cKd1GeGRoR966ErjN/9og28U/fC0ikKJiQT3K8iv4WWK1aRur
 z4zW2Lqi9qST04Zs7HF3MrIxMT4TVIVokJmiMUFJjwg85P5CWqe4cCeA7hlHFizzWhjijPS2IrJ bhFapZU59VSvKfbtFNWOqqJOhjgmdWatb/pS5xi001hFLI8vtRyKCvJ0f+BGWdQIYnHaxjmveDk phl8vxuOJ9xM4g99oR0yLWv6rnoGkKMBm5I4FWV2FRZ4Hcc3KNFRFoYpWK+1SH28iV7D3ZUo5Hx
 GvdxYdfefsGmM5wRca1lZz5sUOC0y14Msa2KiEPkC0cWAEdd97YMf2xg5cMtiZ7ZRl4dYOXz
X-Authority-Analysis: v=2.4 cv=Au3u3P9P c=1 sm=1 tr=0 ts=681c9a3c cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=TAZUD9gdAAAA:8 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=wRhBkI-2iXOkaT8_QbYA:9 a=CjuIK1q_8ugA:10 a=f1lSKsbWiCfrRWj5-Iac:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: l4mp3Og867pa1gjaF0-HHlT4dnD6jLJx

On Thu, May 08, 2025 at 12:20:27PM +0200, Ignacio Moreno Gonzalez via B4 Relay wrote:
> From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
>
> VM_NOHUGEPAGE is a no-op if CONFIG_TRANSPARENT_HUGEPAGE is disabled. So
> it makes no sense to return an error when calling madvise() with
> MADV_NOHUGEPAGE in that case.
>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>

LGTM, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
> https://lore.kernel.org/linux-mm/20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com
>
> Here it is presented as a separate thread to avoid mixing stable and
> non-stable patches.
>
> This change makes calling madvise(addr, size, MADV_NOHUGEPAGE) on !THP
> kernels to return 0 instead of -EINVAL.
> ---
>  include/linux/huge_mm.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index e893d546a49f464f7586db639fe216231f03651a..5fca742dc5ba784ffccea055b07247707d16cc67 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -509,6 +509,8 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
>
>  #else /* CONFIG_TRANSPARENT_HUGEPAGE */
>
> +#include <uapi/asm/mman.h>
> +
>  static inline bool folio_test_pmd_mappable(struct folio *folio)
>  {
>  	return false;
> @@ -598,6 +600,9 @@ static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
>  static inline int hugepage_madvise(struct vm_area_struct *vma,
>  				   unsigned long *vm_flags, int advice)
>  {
> +	/* On a !THP kernel, MADV_NOHUGEPAGE is a no-op, but MADV_NOHUGEPAGE is not supported */
> +	if (advice == MADV_NOHUGEPAGE)
> +		return 0;
>  	return -EINVAL;
>  }
>
>
> ---
> base-commit: fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
> change-id: 20250508-madvise-nohugepage-noop-without-thp-e0721b973d82
>
> Best regards,
> --
> Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
>
>

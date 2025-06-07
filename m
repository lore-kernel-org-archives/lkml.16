Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A711A262D;
	Sat,  7 Jun 2025 08:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749285946; cv=fail; b=V4dVXHHelM+fTpGY0C6JFARNKUYFw/hYFUXaHK3e8eMvEhmV86l3r61zP2S9ws0ZTA5VZdc4KBeCHpafhzHNUQU1EO1fr8IfIZO/MwjYteGuPhwAso8M0RFCOBAkTW6DnPc0SVF/MzJgh4wY7rMb6h4hTMawRoJSi9yafPtFGwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749285946; c=relaxed/simple;
	bh=kVNH93s1FK/X2WgfOgNuM9iMS5a1iIRzRcu1h19EdRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sqLIRez7gkT4G49/0qA5smbeEufoJ/DiLdpsoQLmDZvDhsMgMPdoZV93ZCKBKHa/4VtYoazJ7eUoORKKmERGu6KJuszyHGj0vrGnJxByeBgz4x5Vp9diKahwqUQdcN8zCyNZtB0rs75ValUea9rt6feZR2qcuU7QojpAONirGxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qGOuFddv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mKLu90M5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qGOuFddv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mKLu90M5"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5576he4d022136;
	Sat, 7 Jun 2025 08:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=kVNH93s1FK/X2WgfOg
	NuM9iMS5a1iIRzRcu1h19EdRs=; b=qGOuFddvftO52ES3tuTsq9kb+hfBuUcrVG
	C9ZWhKx7GMz3xJYvTnt2cWBEZxCPOrBUHsDtdJCnYHp49gXNmCigpAo3ZQyRIad8
	T746KE6xkozqKQ4N5vSChA2X/w9u3IPjqc8Te2oKJv1RFzr/7fO0rIXYYImI1JMv
	GydD4Zbdj3w+t+aVDWaAsMQ727WWcd/C9b+ZJtq8Pt3qz9LvqDjSkSGiWtdkBT5i
	oThLqED2K4yFAoxK+J1x9YsitDduiTbqdsNsXKfOg2WzQ9dU0YcTmfnYhfXxS7Of
	bpTVc9GMw6L/XxET0GA+tgdj7YJfOB7eSWhdZKkMYXqW4LAB7pMw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dywr4gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 08:44:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5576bZsR021040;
	Sat, 7 Jun 2025 08:44:52 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2088.outbound.protection.outlook.com [40.107.96.88])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvc6329-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 08:44:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWIgGNEpX71UADJYyy9xqA+B0fwStdjPJuaDYwnt/NEi60Fxu/gvKzMKcFj2EX5tCAeFD5nB7Zc+DzVRJIk/psOPyaqZWK6zHGdI8w2isd6dX8nvCqwUHHCkTGPut9/Otlqxbz1Sqk7Jsgd5MmoZiB1ObFnAE5WJo9VB4Dzdmg0KE7Y+sR43iBlkS/Z1fq1fdx8ZrmZilk9q+cgeqhqvn020wAi/SMmDu5AmOWmzc5Hqatvx+cPmL+RQgBpp+CRmSCdlNts01TjGa3GgPivJ4jyZ3uinV/1iLE7Et+M8uQOatBMXW9fWmUUxxeTGMoq9OPukMQvzTXydWkTysjY2Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVNH93s1FK/X2WgfOgNuM9iMS5a1iIRzRcu1h19EdRs=;
 b=htWXlTlS1pWknIzsyFFde3TFKKyc/SYqMM/w7lj0RclleeuH+mHkL0yDjOyq/0Yg1gVMViDY0kE3tF+oCMbwwxDou9Huq5dD/ZzzHLWTg40cYvVZ89ug4ovodSBD1Qx+5D6p/fSWqxGeKOiygIkp2fMHnWPVVNIyk9bARphxh4BHQ+lP0B5Z2JazdLI9LaCsBNRohLAz9zzoOco0OH1VmC3reAeBJxqsMSTZ38Pi0th81cxpByQMjBF/33WZxciue9aBwDwQM4leA8/eSbN+UMPzOnvPDWmpLPV2xsl5EISESksfIMiziRCmg9fQuRgQeQQpCpFLLGKZRzY9Ofq+JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVNH93s1FK/X2WgfOgNuM9iMS5a1iIRzRcu1h19EdRs=;
 b=mKLu90M5Pz/3xEEeb6C5DIJj5scRC8nxGq06N32HBm7Lww3j1zQbAV4bjF+MDUxoAWsXk20lEXnMmswigQ2YbDIRiTwzTuhrPAki30+3PVomRNjfRsJc087dGojKWRtP0dNFyv5gtgMcz7ssSl8o50ct3RN5mP0YkF8XqRUz4ig=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4294.namprd10.prod.outlook.com (2603:10b6:610:a7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Sat, 7 Jun
 2025 08:44:50 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Sat, 7 Jun 2025
 08:44:49 +0000
Date: Sat, 7 Jun 2025 09:44:47 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
        linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
        riel@surriel.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        dev.jain@arm.com, hughd@google.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Message-ID: <83afc94d-707e-4da2-830c-e5fcfd93374d@lucifer.local>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <063273aa-a852-492a-93da-ba5229f544ca@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <063273aa-a852-492a-93da-ba5229f544ca@lucifer.local>
X-ClientProxiedBy: LO4P302CA0015.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::11) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4294:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a22a2e-5339-4ea1-1342-08dda59f8fd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P0fee0CPes0T/31ce8d/HsMVyx1RylOMONErzCy2aHa3vNtzQJ7+l8gJfWA8?=
 =?us-ascii?Q?PwicUlfS/nUuY/M9ewpm3o5bdrhvp7QZTGpsPW1gPOp/x3jLFE0exzWq5gkC?=
 =?us-ascii?Q?WVwqb7G81vkzwdY3QUc3tg2PrDjdVv6FZ8AUKWj7aB7P32xMbnHY0VbetqCZ?=
 =?us-ascii?Q?Az/lgY/tWvNSbBQIA9Nzkwf3pSsEtMAPzBCyD/wiZ2nfKj6Wy2OKWbgwVo/I?=
 =?us-ascii?Q?T/itc2Jw9Xw1nSOwijBvrB1BuX6Zy+A65b8njVPoGSEx8tT5mdLsORgMTwC7?=
 =?us-ascii?Q?kbtY2TSfpwQZ5fFr1d7O0GA3OtidhvTvoxSSLh80nHa5tyje0WTEhgSPrPo9?=
 =?us-ascii?Q?b2k6NOku99neBfUZV2Lv1oE7TmEn7z9+RmZC29sjx3DPJ/gzl+IAsFNfzW0z?=
 =?us-ascii?Q?2ia6OAtqVMoLGI0Pt+xuy6Xj7oVRz9TITekEtsZafBECaNGkEA3RBcBVjykU?=
 =?us-ascii?Q?La8Cx2x/36hIrk5JFVE8yJAzmfPrXmy3v95p6JSYzQLb8s/QJy+6Of6nRCbE?=
 =?us-ascii?Q?ZEPHxeB1WYUyKY/fNQ59zDclMSu6+3EFYZBBAc6SrS9nQijREpCcClg+VEp2?=
 =?us-ascii?Q?MXF9nU8f05SMTq2HjgX0AKBvyzKHtxLdKGfaoFOl6mGiRQt/VzK1Ku7aBBHc?=
 =?us-ascii?Q?Qicyym+RSpXuYJb4FDS512KyGxFyYenZxDKiCtBb3V1T5KodHccTVeYGNwY7?=
 =?us-ascii?Q?piI/5djHz0EinTRyNJwOad3OE46nQBWk8fpOZT72JergZagvgEr9FWMgCkLW?=
 =?us-ascii?Q?Mp21mNcFvN9S4hqbz5Iu9g6IctQ5HgvQLBjKYTlwlUJUwcJMcu+XvaR+bjTD?=
 =?us-ascii?Q?XjdqX3zv3w1YIeaf0Q/ZJRwgJ4HSLHqZA38lTUGkGjKszXmMajgOvcNOkJDM?=
 =?us-ascii?Q?xhZR8LnLKJjarmxeExOVhVLDVuSa+DLICOMZVvRlOZ+kTaP8UqTkJJ9gdtAg?=
 =?us-ascii?Q?TrDM8rdFGIbNIyGE2ZFEoJFXaK1uU4iF3d70TkNiB+M0sLMcrk3zGCAkhjcR?=
 =?us-ascii?Q?Q0PhxQsRkjsPifsBNflH3mkq86dinM1446861ZeSZ9j3ImHJoi5AatHRm6ym?=
 =?us-ascii?Q?hZ2zLJO4qqbk8ljhi9lwPbDhKa/rhFmQu3W6/VNTXRHxOXXSE+UIbik/hJg6?=
 =?us-ascii?Q?aWeiKobAwqUJmiUv+Zmw7uDfD+cPm7O0tlLWnAceN5Tcf+DL0J2aAiJd+hK5?=
 =?us-ascii?Q?qZfx44nf+rgKZrFxVFEXg61aBYJJWSlyXx+FQdOqS6lJon7gSP3+q7Ai4Xew?=
 =?us-ascii?Q?lFK30bzzI/QadCiOO/Y36VNfXgHsou1ypf4Yhji9MkitLMqQh9Nl82qMW2yj?=
 =?us-ascii?Q?W9qwfb0eVGimROFBrqDZK4CDVbgMZBXzcaMM+hQy/stZkZkGnGv4PWu9gJL3?=
 =?us-ascii?Q?Fb5B+aKnUSYFwuwVKJEKf2NNqh8vjlBD/7289K+GPSOTYA3I5mpZD7+L1edq?=
 =?us-ascii?Q?LkQddAe1Hwo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eLCe+N4AdM6TSSqoiiEkstWDsS3+TRaqQ9EsN5ShSVrBQWXZ+ZdlXftxrP80?=
 =?us-ascii?Q?JXhifi3JawOWEyxi6gxYCxKqXpGiHZzGZ3AWasGNNiKyu5e21f3v5ZyKEvco?=
 =?us-ascii?Q?CoDhb52yTOQDaJth3Lb+uKMg0UhHLSKE4yfPM1v0sZ8XAgVAAKRtsXVrXleV?=
 =?us-ascii?Q?gIJzmPOxv6SUUpi3Z+3JXr9Wp5rPeTUzXk+cGUvEEv5c4t8sGKvm+UvHsNoZ?=
 =?us-ascii?Q?KgOyOcXb9a6S9SildTlSa7zUhBUtFCsJ3OucvH/O1sez5ItwLmO8fu/RpuqO?=
 =?us-ascii?Q?sN95d/Lh0KXxvESmGRZtLD4uFw6Okqm+7k1ycq2putifBdtAahTuH4gHh+xf?=
 =?us-ascii?Q?MoL5jU1BNMErcDzM32VSvIjlE/UwD6BVyEtaS5euKnv0SSQAP+HCIW3cnChq?=
 =?us-ascii?Q?9sL+ygHNZlMKEQ0wLghYuk1Ol0zKcAAiu+6XPZAF1wtCHHy6nTi+O9TRVW8+?=
 =?us-ascii?Q?2P6BsGRd8rwKefYC9Lil/08mxIoB51W9xmCkxGAVN5sWbRBwIvF9EXwtgcQ0?=
 =?us-ascii?Q?3FHYKgeTEoQpltPI9euSYd9kvVL2ONuw1hDQm5pRaphdGoIEmaOMQMWOufc/?=
 =?us-ascii?Q?RDT+5rXnTcaJg3Kjr8VTI+sJ52klTijUb0CPM3Ck/s+3vsK5M9vALYn9fPzL?=
 =?us-ascii?Q?oO3i02icipUt291U8tx6hFnqvy61ZUtSUSqLFRzZaFiTzEQrTkEtN9z6f5Oe?=
 =?us-ascii?Q?6RssTfwSMiQ4okmU66mrsfZC1J1ZEJCxKFn9afkdc6lvrbk7Z1AE4q8sqGyB?=
 =?us-ascii?Q?SrdQghqoV6jsPl5bDgx8sg3BOIGFqNeevdWGziSwtEm9NYbKjDjxGJSdZTpU?=
 =?us-ascii?Q?auUkBK6htBl7u5vLMItkQcF69i8wbV4OjUC+xCh2677N26BRbArhuK0l2VUI?=
 =?us-ascii?Q?QaNygX7UdhptW6f3HNH2FJNsHHrfJzV9Sd6obnUrCsMhjUtp7pxzcDN2pEpl?=
 =?us-ascii?Q?fLNVvA4KWx8dv3ohUmbAbvbHQYqxgUhKnomaZLVgx+SczS2bGls+KmU6Jk/L?=
 =?us-ascii?Q?AlXgFeUXiXONYkcz0MNkwJ5SfIIV8gFWuWTeBtOAfEITL+BoWBA723oVQ61I?=
 =?us-ascii?Q?kgg1LQRucufivErpt9cSnMqbOCXxFuZuMmXIOrSToxbI73OdqnZTejZWeQ2J?=
 =?us-ascii?Q?+sEFlOqggat25UEvtKFSn85TWDjHw0B5USkf3orhLIwpWD3bbynqkdy/Iwi5?=
 =?us-ascii?Q?a+fKNe9EoD4FkwL9GxS7SRqxuD+nVxfr6WfMEIm2OkC6YIDuhkEga7C+04ce?=
 =?us-ascii?Q?cYsLTXIPUYfwrUpVX8v9CdB1rDVu6U9J8TIzriIIKup8rgKkS5VjFZ+zYAEb?=
 =?us-ascii?Q?dHYfjW+UIRlcslbF7ihS70SNDKLlQzgVYy467Z6gX/4XtkPeWd8/qJ+Rmy5k?=
 =?us-ascii?Q?94xaA+I20xyOrQkLy8JlucxcDsH9x7PRcD1VdqAJEa4EbI2+nDcH2AmEgLgC?=
 =?us-ascii?Q?cPyxPkTxy37MhgLtrR8dVrMUlzz5++vV1GFLCLpDk/zQX2FZVw19ZDg8sigU?=
 =?us-ascii?Q?INOMwo/JLD0d/mxIPOvJ6SknZjk1C87gS8ExiZBkvNekFOZpb7p1rKqgltLJ?=
 =?us-ascii?Q?KXT8t1kYlRxIOUrPVNxAmSSMH5db4o1JOZBgcHyLhDU1JpGEo1l7oIYDbOYc?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fry+zgl2zIIaOGXBrQrOx0Wg5mZWgVvpDyIBYg0WFKMo9gJhyY9cTVqyI/JXpoWYwgqBQIQ70ufKUD7Kc1vptAedx9N/QFgjY3pDLoPMVakIhXQMixr5sLms8CXzNb7c1VJyncd5nfKLbEAFYd++q29IJacCGaBO4j9dOwO8BsWIQWO8RyzYxdOx+StOoDgqLS5OKETlVMgWd25XJbT7WdeeyM3Gbe6+OLUnzIwlPijx8bJYZH1B5e9vzMyG6HwqlqlL7mv2LfHDpaL3f7XW0LHh2+yV7MXuhSZcEkwjBWi6ufW8Jg1bulzbIVjacAa1FfHnhhlB0Bjea2+GE3xG9p6pQHyUGvLGgxdLrnyrBdJxp3afGE23nFhaCenkcle2zGZu8G68ByxZxxyzCS6HAqMnm3SEMf1AHEZlNEUSPwMDbU5Qbi57NRhWzKfoMVrJ8oiY7r6qj4ZJgB2Wqg2iVvhkffmz4rnPrOIGu71kI/7BtQZ9ynG/B6vZAVTkVv+kjcgDKVyquBMdEo6Y3eIK2m2kl2bBopBCiUtcldqIKiI2TdCwhVjbFSCeR3IU1fOqiHcvoilBXwDn31cfuYTVIZ8DeA9OSkhWk16GQD+Dt20=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a22a2e-5339-4ea1-1342-08dda59f8fd2
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 08:44:49.8959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YK3q5Wt6yaehxQiQ4IAv57zUeyK9dKukp5boRcWcztZnpzWEAHH92UjE8Ew5v98ilK85jWy4Jy5JldntXkyWPZ0xFwK497yhZC1UgKOQkPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4294
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=899
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070062
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=6843fc06 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=bTkITl6OjxDhU__xjLEA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: iVwYLMn6ipZd19HTM8PLdYJBWGUy00Ic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA2MiBTYWx0ZWRfX3phHp8Co0S6O pmBJxMWh/DodMuBAzTHup0yJQ+ktagM2P0znMMyw4TrWJVumiq8HzrTdFRvyoVwddS93n1g7ncM xNDVdcjC111ELMeDd3dLUryP0a6paX+Nfw4KiIEcdmRMxVSkK/IooQXlLsuexbKOJn8P6AMnHxX
 KzUyHEFiW/rOFfGEn/saubi+jjgNDT7gVybwOlA5Y7y02SNBJpzZ3l/nm4wyfGmAu1GUnJPGKfH mo4u3SWw/+K94ypPq1RctFuJLWh5shv4m69lB0lEokEs0Rb9oUKPZkZ+6defO+cTvD7hYrMTe75 k94r2xdctazcsbUSWmguAgtyawtFDd5A6L+Ogiq+8zi5tk/ctvXkOSUT1NkN7BwQ84Ci2x3NZ+w
 +5guyoAhUOoXrzC2tmdWX/+9Z7LK8Z1NY3ZpQRn5BHpiafKiXtHQeraOUwCmVQ8qjVXLh4ED
X-Proofpoint-GUID: iVwYLMn6ipZd19HTM8PLdYJBWGUy00Ic

OK a 'reviewlet' :P (have to say I like this terminology...)

I see we are already ostensibly 'dynamic' in that hugepage_pmd_enabled() changes
our algorithm.

So my comments about dynamic alterting are probably not quite valid. Are we not
in a weird situation where, with mTHP-only enabled we just use
calculate_min_free_kbytes()??

That probably needs addressing (perhaps separately...)

Lord I hate how we do this (not your fault!)

Rest of review still applicable :>)

Thanks for raising these important issues, while I am raising technical
criticism of the patch, I do very much think you're identifying a real (and
really very significant for those using v. large page table sizes) problem we
need to address one way or another.

Cheers, Lorenzo

Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B111DB148
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744913841; cv=fail; b=ols6PNhli6AjXCQQezjDcCK+yR3VuJswZ/5XNYl0+F4nJQp9GgSPVtHFGvXY2sV1nk0KftR2c/2WPN3sqkSPyMppP6gHLffsY0+XkwO85NVQt0sfIsrtM8R3+Uq8kbyPwukyvxk6TRTStsfwip4Od7j/zfhcp/uiqgJlN8CB0s4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744913841; c=relaxed/simple;
	bh=GpJYDKEB7MdinHnCu6uIuDCvnUBBUXEn5YGRtMWPgIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Niu6qMO0GEe0aIqyNNb2doenFED9v3mgD04MQDNVpV+LSN67SUFBYqgbTdEq7eA329oL+haOKApey3/LybhJCssfqRmWF1h4MqCSIfDT7QG99TLltWgO0Xrj9PPqEYruHryYekKZ1DWDUKlgZwcCNoIfavQ9kuayUGqGGckCp/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kUM4Lyd6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0Vfa17Wr; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kUM4Lyd6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0Vfa17Wr"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HGMrEK004824;
	Thu, 17 Apr 2025 18:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=GpJYDKEB7MdinHnCu6
	uIuDCvnUBBUXEn5YGRtMWPgIM=; b=kUM4Lyd6o68AjJJWyt/TpcORJWkfIbv8Wj
	rvpm54VdO45g7Y6QkbKZeqONG0QWeqS/OWrExoyhMnDQd+camItQBlSbCsfW5i1x
	cRxiC0JVuEPS785R2+LSkFL4jnEo/omFgK3O3er26BdKQkWVcj7/qlHucIruOuEv
	dnLXrP/VUbNmfOdyjRDo4HJrfhklhMctkW9K/zwBx7k7mDX4li84SU8CX8TduIxE
	OTkcrsHuUnkK78X2B1AmVbw3ebRJvvbIvweTICVk8UpRIj8qz9chBbERZMCnyL/p
	FxQ3IKxEqB8nWRk7XCBqLrCmxmGZf+P7PHW6WjMbRe+etq0bkFwQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46185mxxk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 18:16:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53HIFHsC009252;
	Thu, 17 Apr 2025 18:16:48 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013076.outbound.protection.outlook.com [40.93.6.76])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d3nm4wq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 18:16:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFCVyds2U0V0XTV4d+OhULzBSwo7KSwj+1U19eQIBoST44QmEpGnJbWryMk2lkp91blxwVl4dvMGudW8YvjYLrjEv/tUfSR3sBYcRVVA4mApckWAVX2vh//J9S4EHX9D5/LQ4jFAg+g7U4jCobBb/S4dbhtpHYx9ZGY+uf6QZRnlOjGcY82Aa5dDleNfn5mvts0S94N4fuMUIWQJmJtPhhxPWyuYDVmWt0GdjnmMS0TOwIbOa3unBuu/frUVOkV2C8VvFN1dK9F0CgtwRStFOvC+PYOtzKk5TosmJ4TXQ77HMqsP2tXw1bQKmeARkxpKMyRptc6AiLgKHgH4EUtj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpJYDKEB7MdinHnCu6uIuDCvnUBBUXEn5YGRtMWPgIM=;
 b=xa9z9agzUw4H5i3+34LCi3LKYU3iO9pPodM1uMnHmzMK17LrBy/mJZWn2jgSjU67yVk4fYDpgwUuTgVp5UZVtCXTDrdK02sAJGI++T3Zlhb3RBGRFRfhUbbWFYeGKd84JiJhkAUeXiR7pZywjN0KTn05FmODOOSENDpyDuNWuRUb4s94CtTAvhnXt7NikgUeM2JwKxqTD2mpLWQE3pEY/VEegL70Zk1VhN1jrKSdoFWTNlHUzfsSnaEw8pV87BGDuY9BfVnwFn4GynINidu09lIItfPUQGEUgOhtWI4AtocJs4t4MjhhRDowqKCs9g2TofbY9gL7yXh/2cJaJL1bTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpJYDKEB7MdinHnCu6uIuDCvnUBBUXEn5YGRtMWPgIM=;
 b=0Vfa17WrePXw2vUY2+q7GMVpj/hZAcoEYWY8oiq6Geih+mlO5r/mDNTZQeOfv/kXk3/4mE+FCsyowwhSzJPnZXZHjQ0mJJIhQK2tW3uBi9u0etEjVr3mQDk2bxtud9LJGozLe3gCFjDIpEXBM/7lXQxjnKo9ssl9ISOh30h4Y48=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH3PPF0A29BA37B.namprd10.prod.outlook.com (2603:10b6:518:1::787) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 18:16:46 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.042; Thu, 17 Apr 2025
 18:16:46 +0000
Date: Thu, 17 Apr 2025 19:16:43 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Rik van Riel <riel@surriel.com>
Cc: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH] MAINTAINERS: add reverse mapping section
Message-ID: <27dadf2f-fbc8-4286-ac4e-2cc7d7185df2@lucifer.local>
References: <20250417084904.16806-1-lorenzo.stoakes@oracle.com>
 <eb71267a-80ce-49f9-a475-5260df607458@redhat.com>
 <a2c887eb489e4a7b9e52010fb5b3c7f85286e8ae.camel@surriel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2c887eb489e4a7b9e52010fb5b3c7f85286e8ae.camel@surriel.com>
X-ClientProxiedBy: LNXP265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH3PPF0A29BA37B:EE_
X-MS-Office365-Filtering-Correlation-Id: d8fee922-cc64-4d6b-a0e8-08dd7ddc0377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hI1T/FWCGJvtVFrO+To2hTkDQlBvFU/ZoqqAy71vUPL3p5RRt+soyb5e/pRi?=
 =?us-ascii?Q?0Bj9J/8qW5JrnAuwt++F2LR7WuPZBzXqZXfYKK24Ts/Vp+iwExiltEIK4BOp?=
 =?us-ascii?Q?v+6eZT6lTEx6tUW3zHq5h2D7Nh95h5Q6Xavd3anweCdGS1oRs5GNlnjR6tEx?=
 =?us-ascii?Q?REAN3rrPS6R9K8an52I4vjSCQIgskxlfpMSlI4zt7IAFLYXsZA4vw36nspc1?=
 =?us-ascii?Q?AGmG7FG0tV+BBits52HwikGom+B2gOefnn+yURAOGZyaCSw5BZvet1w6Z03O?=
 =?us-ascii?Q?Ff0YFZ3bFx5RI/pBIMEoWK90X+hDYItanEeKvIMX0COTJTj/gj7jhg2F7nHX?=
 =?us-ascii?Q?eq+vCB7veQ8MZzI4hyrz9/Wo79mnn9lFRTIPfR3y/6GQMpRs91LJGSzs2PKB?=
 =?us-ascii?Q?2TkbpgVyRQ1buuOrWroEWIVXKn0S0yWhVMtKH4ReRl9fjO9Zf8lMJztJ38Ml?=
 =?us-ascii?Q?cYrStxoEeOMej54klMcf60DrZPc9Q23Wz2YLQRoKXWyA1vmh99iTVwaloTR1?=
 =?us-ascii?Q?c2L0l0+6WXWVSSiws1ZHsQzsc4L6ica7k/e9yYwh5PHC9ZVEBVcT2UHjKv56?=
 =?us-ascii?Q?FrF9qeuCCFoJpZrc//br68ypxYF5B8bVbVog9Z9spReasxRdeEoGfZRNn45K?=
 =?us-ascii?Q?WGgKvNHzEUSBj+sPbcGNT0rYx+HH5qWj6/S91LecMY5++oOkXkwXdQu81anN?=
 =?us-ascii?Q?Z++WbkqxXK072bAH32v3bw2eWG2jJLImbMZEhNoTcHvqQi+5akNRrqkadyTi?=
 =?us-ascii?Q?uo+eLAaoadIxYFmiPNyBU2NUsoe4CgdcXLbSBf3w0bazcYtA+hvD5fJvUGIB?=
 =?us-ascii?Q?XzR6WKQU9n382WCH6A+w40ITW6X8OGpmjZrimMxv1Mc45wtvjdu7AGjpKmqW?=
 =?us-ascii?Q?ZAGpHRvNWf8Z1h7E8drPPVpuB2oIpk48LjWcb42qzLjV6FG0/uvFrWzd89Uj?=
 =?us-ascii?Q?X2N3eVKFlQ2E+4LYJ7wyoAdA/vu6gRxUSfklx2B+O66yyfZVjeSld1INZe9W?=
 =?us-ascii?Q?QgZ6R1+qedkOrDq+qqk9hUByOyyUXZ00sBNjiHHgVbGghthWjYu9V2l5Jwsv?=
 =?us-ascii?Q?HknbfMk1MXGklRF3ZoDxNGQ+HXWgEA7Ik9lO556e1QnliIkJPYDav3k3xXDh?=
 =?us-ascii?Q?moJd3jlFaC4avguWLZW9e/Kf80y3WArx/KvFfF7ROa/8l7v5E+O2RZ91Upil?=
 =?us-ascii?Q?HGaTECzg6XDI/ol+q+mTqaEmXCERHZ7oR7/VsKIB+j/4ddwnsUHfUM8oh531?=
 =?us-ascii?Q?80T+/jD7L9F4XxIIH4oXxS1Bk4GWU5YLHK7aGFQUTXariHdk3WkdLut3XK4g?=
 =?us-ascii?Q?AE+dpOt3jlnyF0Zzspmy9gUdt9HPbhzRU9ppjlEj5MWb7GZtzx3QtrYx5Nfv?=
 =?us-ascii?Q?jS42b+YA3TzfK1RsU8ElJVZeHsZAQRkaC829eRwNSW3+pHAjgyU7fNnlcGr6?=
 =?us-ascii?Q?wmRLNLxzCsA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pVJqk8n27dlwys5AHSUDxBabb+wo8UUTtFtoQeQRw7mMDAzMZPUl4WxMbmtS?=
 =?us-ascii?Q?5SlRyFkBxoIbkKDn6Aa0esTcndOIakZ8njHOnYubXKS8et3EsexrX0Y9ZTK2?=
 =?us-ascii?Q?hrZkDPYfBJ6Kx+/6ciA3GFnUGIhYuN+xOnsPZQ3YQVmxxVzEijNH/fIfkd/1?=
 =?us-ascii?Q?Oh1DPBfpy0RVhJtq2DpFkVbruQTYHuarzKcIxCTjTNfwoO+tsrn90W6gVzLK?=
 =?us-ascii?Q?p9IINJPUxnFqYTpKG7zMw7fBKBAeghVCpb143SevFDosEncPhtw9BXk2eT5n?=
 =?us-ascii?Q?zkB1B6K+ymh4b+pwiUy1nzm9X62NRFW2Q8mwBRY5GYS+aXEHdLOXR9inzlSK?=
 =?us-ascii?Q?sUjv1pkB21N7xFow0oO9NT+NmDeGTLPML52Y09qxZJwp7/x3+faJ6eLbl5nT?=
 =?us-ascii?Q?RjD9fRhjsiWHq8BtWWAkCZvSx5TRRe/3SnSCCvMtvojKR22oienVgs3F8jhg?=
 =?us-ascii?Q?eGIJH5oTKEyZQ13FTFccuzXDE3bTs7yxBF5o5zr0HxC7LNGP+faUNtB7yCij?=
 =?us-ascii?Q?RiS/BqIGL0KRqiV19/+pURcJm64Kyhgm+5J6eYiDwShhQ7Q1/oZ4VYog3ScZ?=
 =?us-ascii?Q?d2rilhXiG8iOlOT/hpeavnJsLN+Ct+seU4dI4Cn4HDPHn37FG2Llna+WPERw?=
 =?us-ascii?Q?e8S1xP9WEkfEsKvzSa8PVebj5K1WZ+7J7DBNeOr4C1uTah7RaiyFRZznctGF?=
 =?us-ascii?Q?FIkxePmOxQqo8g8WnqboVINnQDewU3UPWiZPOWrqceKvOA0NCQ3QTkl6CL1t?=
 =?us-ascii?Q?K/TV7tbhiQOsHIaiIZvTUKp7ZlwpyhVC6vA3DWZlFx0ZZX/k5YPqzF60WXjz?=
 =?us-ascii?Q?+BeOWfWe+96j6XlufA2s0Qm3seLyKwj6hKOIgAuJ7W3PG5lOo9wciD9vljCC?=
 =?us-ascii?Q?gsq6raXT2jkG9yDEGQy1B65HcV+eziiW8udOpi7Q88NRWU1sJVIQs/DQDQCm?=
 =?us-ascii?Q?VwoFgI6QSm66jLZTelweryteylTr2W+m/aIGRtRog1uomqfnODBaZy8AYk2t?=
 =?us-ascii?Q?DbdtuSRLUg+lpT0Kn9XEn+eJIMCL9NUvXTJ60zLmuMyvJOgb/Dmkt1M+TO51?=
 =?us-ascii?Q?eTUrIgBUyiB+9zTt8N4UtmbM1d1hNSmP2pU30GjK/R2A8cCZi2Q/txCZHwAO?=
 =?us-ascii?Q?cqGM41IY/5J5NyMZjQISph9NnSTqhrUHe6xMfRMiuw4IudjGrwlqqN42WPil?=
 =?us-ascii?Q?916aMrExQNu2qv9GVztLizES7LPRg1CKjZvg7axsatVJmadccwxfnOWXTPSo?=
 =?us-ascii?Q?33toWPG62a9k2blxlXrKU6bqbYeBhbPAC0S53Bsf5PXn0YXWMmanJcP2U4El?=
 =?us-ascii?Q?uN3eZZvSDg8LIGcnvyS4wtmi7xa5emdkIiyjFOI6+dFC1QYzjwdNOaTDkskz?=
 =?us-ascii?Q?zZdqmhczKPW/mUVUl6gy8fQpdECvfEGP1OjzUE5FQ33REKfQXN5lrh1K4Iyn?=
 =?us-ascii?Q?iVT2fggTF3Nz72jiFfZZLLKXIDQjCD1yp9fKicv5dqoszowJZCZjRYuG1OQb?=
 =?us-ascii?Q?C4GKsbzgUQZUih0s29b9UsLHfrkD4fe+YBe+Yegr/8p2JZXoNZhn3wczRUff?=
 =?us-ascii?Q?mtDOSwYx5embcqcWL5CLyvFn85G1rkQCrwgR56GvEIEwvLba26TcohQgSXtL?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1C3ZlG4qC9/a2RntT+7zP6aDhNRd7Jck7VNp8BrPSBqiDqTv83Xy0M11c6+FdbpmNi+SOqIlFBrfG8SSbDWDmbcnEM/wrR5PTNJte96ewIJBYXfoX/7zmQ7NHQr9ijIljLiYkIlbUIuiTa/fQBhHKz/DC7Nk3NYM+iR97NMJ1pnn3AAPZUQ4R2APW74s2olTg49JD5ac87Se+LwmvE4MhzzKo7fJp/2lHtJjAacV9KDoky2GRVK2oZp0OAJ7uacmBZDEV98Yh773wt7tkXNBJa7wjMzh+N+e+a8Nkltko6v5CNt0M1bsCsDiEEmWPGhKaSlgrQWapUE9N0Okwq1wBFJj/akcJflFcPida+P7hi4YwPGujZ3fwZp2Cb9wfqENIiUn0jbdQdmQtO9W+kGpBUxcKhJnNjA99q5uM7GXpzCVQfNxerJCySRSIubPjkwODePqPuYCw65lOJo9VF1wJrsOpalkkEwtD/CBu76+BCNl8DNZOmzxLsVYrobZ48F1wx6f7JwZAN6Qe29eQt6rPexm3lzA5UCWy0QifyvTeRvyiqQSOUu81rZtHq+niIt8Lvq1dOE3/9EBVLzX/GzcCwPkCfAPcB4vtf8qSPsybbw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8fee922-cc64-4d6b-a0e8-08dd7ddc0377
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 18:16:46.1856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3eheeluK+FHC/CXA8hd6PZNyPak9nKYh6Pb/JrEFyqSd9TAglixnXwFhcyHv8mnc/I/LJAZhEH01c8AiVAjxKEljxZlySlJJ6xJWPCGVvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF0A29BA37B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_06,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=806 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504170134
X-Proofpoint-ORIG-GUID: ahl4w0GOBRDRbGdBaiPuS6Paz7QY_VHd
X-Proofpoint-GUID: ahl4w0GOBRDRbGdBaiPuS6Paz7QY_VHd

On Thu, Apr 17, 2025 at 02:06:40PM -0400, Rik van Riel wrote:
> On Thu, 2025-04-17 at 10:53 +0200, David Hildenbrand wrote:
> > On 17.04.25 10:49, Lorenzo Stoakes wrote:
> >
> >
> > Acked-by: David Hildenbrand <david@redhat.com>
> >
> > Let me CC Rik and Hugh, if they also have interest + capacity.
> >
> Sure, sign me up.

Sounds good, did you want an M or an R? :)

Cheers, Lorenzo

>
>
> --
> All Rights Reversed.

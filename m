Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F032320E00B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839803; cv=fail; b=ksCCMW32BfsGmFnesHNFE4U/MxdvzDiwuF7nmYZ82QUQgdc9GpWxCHL7oDL10LFDeO0L7iCd2b1CF6Eq3vHX2mU5IY2VSOpASqYNOKBjc4o2f80RgKlxF4SpI7b44mms+VL7hWDeM9/+cbfkQi72W1ku9Xozo1UIxnLX3VzJrqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839803; c=relaxed/simple;
	bh=utSSSvfJY6N8Kw5R2wrNyg2867h8PFlxsy1PL2qgKjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CGG+18HMg7hV8gXPHOZ5GQQPBqpFKGCb90pD+wG8kECYANEgwnl2dPKX+VBYvCjDge+Eo8nMECwolwCjZGxxkY9ygdKhu7bgu7qNLI1G0O2XMzYu7iFZrLG8/8pCDbEmXrGhSf6jHGMgJ+f2XKyMsbQoUBt9L1rhv1vnEAJMNMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MHnsgJSm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NWkleKdU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MHnsgJSm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NWkleKdU"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P7faOj028309;
	Wed, 25 Jun 2025 08:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=utSSSvfJY6N8Kw5R2w
	rNyg2867h8PFlxsy1PL2qgKjU=; b=MHnsgJSmBgjVKTLNJaYAQD6jLwhWquX4ab
	gWnreB0MdWZ3sA3MCa2v53rFkuBS6z6hA4GOUtZ5N9RyfM2MfV+SWgqweWEE1hHV
	NsKhiPrEcCKnjAB72DGaf01zl7bYqA/goPMNRJZ8zlzqSpU+2y7UFQydmobKvkX4
	fDHv9I+4sFiFxtQhjQSXnkqI2U+QTKQPcbLzCttrxJL5kzlrGMA28Sb3ACcKgBLj
	lgrg+xXjigutiXv+DxLEGB0/CFlmzsqm3Y0HKQD84qOaKd66j1SaC7ThBK12Aw2N
	lE8l5Bwr+iKyhxsWmvbPekAy1Psb9Vm6qLNOoRVeECc6HZ1rDbBA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egumnu49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 08:23:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P8FEfJ024102;
	Wed, 25 Jun 2025 08:23:03 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehkrsbvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 08:23:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGtWAMmm1y8YX5KyH+bemEIDnm3ArnzlgQW4s8Z4rKdwpWT9hDe0M9zt+qUHbbtdWVlthac+rbJiUSR1RlInuGFkzE99pkw3oa/3mIbmds+iEE02kfQT8pNl3vBSPLYWszjklzk23tF6y3qJqLviJRUtucZPi0Q298Qa4nIdODsTsqzBAmkMcVDj+LXlB4EymJjyfto065yoV75EZ2JHLE/ZM8O1XD+4/HjzwE3jxzpe2/DXG9+iBLogf8x2iuExi0k2OUHglxeWdCidABRagnPIjwTex6Et20v0vBDlD21kj9ZwJRIxv5w37mZnUWbPe8ClXFDAF3rFfjKF7XoVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utSSSvfJY6N8Kw5R2wrNyg2867h8PFlxsy1PL2qgKjU=;
 b=gFCJE9tbbJ3qSo30bLX429NfKqWGrSO9VuuxvAMS5cDzMuP3dvob4BWoeN0JAlI63zEUBfdl6Z81wf9aZcRA4DthZtuyPl/Z3twhB5rfTm9HpTGiR2/VSOxEit6PjWhF09D9wZv74EjLBc0EYGSeeQ3D7rtbYhCN/bcFJI7F7L+g2OVeatIFOcr5ZDueuQFFhmIY1T86FD1RysEdiGLdl8ibea+zhgcNwjhg6ARIE5qMofdz28K5e56Kr2DMJ9+W0lG8TLQx6VUC0IMsyxHIoK+T/nEcJBQzQmjG2ACkpFFtYM51omKYGoPILOmmG7IAAXeDN9wDEBhr3klR3lG7Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utSSSvfJY6N8Kw5R2wrNyg2867h8PFlxsy1PL2qgKjU=;
 b=NWkleKdUWu7EKL13igVXI5t4qzU1yFpAeCyjk41Qtq0KaTrYbgsZawMd7xvQv1mk6rMwPjkl0bqC6b/07PN+L6swak14OHAmAa+t1CzrSzSd237RpeQOTO1HgDwKljpORMD/kUVfS1kDbW1i7oOPDwaSVRnrGexh5KeWd1DSJHA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4585.namprd10.prod.outlook.com (2603:10b6:806:11c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 08:23:00 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 08:23:00 +0000
Date: Wed, 25 Jun 2025 09:22:58 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
        ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
        zokeefe@google.com, shy828301@gmail.com, usamaarif642@gmail.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
Message-ID: <f36e64f2-f3d1-407e-862f-ceccc89ac9a8@lucifer.local>
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <9cb94544-f65a-4394-b1e2-bfb226ead31c@redhat.com>
 <db757c1f-8666-4a73-ab57-cce83059e95d@lucifer.local>
 <8691d74b-67ee-4e26-81ac-f6bf1725361e@redhat.com>
 <3b6db0c3-aef3-4a21-a154-6aafd639dbc7@lucifer.local>
 <6bda0de6-1ade-40c9-aa52-16bc02d98bee@redhat.com>
 <28051538-d3ea-4064-aef3-89f6dd98b119@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28051538-d3ea-4064-aef3-89f6dd98b119@redhat.com>
X-ClientProxiedBy: LO3P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f183186-ca90-4134-4a96-08ddb3c17f8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xjgCocO/LpcE4bYZjKp7sEln2CTEK4GBsCAr9oeouz65zeOjJilZ0pfjItfT?=
 =?us-ascii?Q?WBfcPhDypHQMrDDJK7LX141U6DikZpqY10NIrFXwuiquw9gM74PWDNN0+LYo?=
 =?us-ascii?Q?hcfDlU7vq9UKKgxshFu3BIr0pdX86VZLrL29DR7e78tR0h8knz6k89plvZIr?=
 =?us-ascii?Q?cfVzL4aPnMNYUXV6sBTGSWuYyDZ6T7OkNfUj/OcEHEkU5TOAWVqrC4HS3p5u?=
 =?us-ascii?Q?iKZhdPpKoK7rFWZowNTiUSguEIIGbm9/tUQwSdJ2lvbrz5JewkRZqbfZT4nj?=
 =?us-ascii?Q?BAwWf2416NMBio/F6gbP57uyjA63E9k0P4Xd+NB3Mtj7/9w9Na0qGXP9faFC?=
 =?us-ascii?Q?pft47g7ZxYuBngKR60KR+pihGml0Bv8pasypPx5sexJ/7Hs1VXQ9GxpMhC+M?=
 =?us-ascii?Q?CtlukBWX/FmwmWZW1IXHo8CjTrNFLqFfwebPAScOkOJjZmDWq/1T/p2DdTdm?=
 =?us-ascii?Q?yaw8/MGNgYfg+cC1PfmWNiZNPy5A2RMIwS0Eyo/EEzOPEC63KmYLPIymRlJL?=
 =?us-ascii?Q?I4fxo7hYCz19MRkfksncp7hiFgQSX1osfIaB9/KCFQ5t72xA9lwYKVNChHao?=
 =?us-ascii?Q?hqV6t76naZaQt+YOtc1DtAez4uzfQ4XBEtLyB6Ef5qDf2gvDMaKqu1fzMoJf?=
 =?us-ascii?Q?srIFMg7YIBT+93MwHZ2sygF218LxvaLi3UIU79cxeaie/RsxYKv5uNFsuctx?=
 =?us-ascii?Q?b81RdvyQNdj7EAcq++/YqCjSAKeN1S3rtlQvgtOTRW1RtyRmJklnvuI+m9CH?=
 =?us-ascii?Q?lD/aV0Z9XfDAZZE6ygR3HYx+JT8X9IdXNiXozx2KyV7fpcj9yIOk9sXDddN7?=
 =?us-ascii?Q?rVlYZimLJQ3MnTrUfuyH2xwThh6L6/gT9F9Mlyk/Iz2WdsB3RAkotbQpPSoW?=
 =?us-ascii?Q?wmaPqGfjzo0Lye70AlxKArHq2nZFA+/vUdSIYOBUzs0i2YIU+gVRsz41Bm9i?=
 =?us-ascii?Q?ulhOQH8HBXRIdoKSc29tE1cI5XB+FADiOuWPTs/odGoE65/U6QotXmhKx5rG?=
 =?us-ascii?Q?Dc70i7LUiGnsk0cLGl2fKYNebfx5NhPK6IfhmiJ3PyW952LW65C8o33OmE56?=
 =?us-ascii?Q?ISnkvveTlLJv/gd3HTHNLrSiqnAjUOXnPvA/ATExBUhsyKNpzfT+5zxH23v5?=
 =?us-ascii?Q?++CI3fUPqB55F3guVoI8+EULIddL2V1kTcUwFk87uuPGG2AuqkZhBR5mLX85?=
 =?us-ascii?Q?ZqaBfVhbcF5RfE6y/1DVqpPMbUmZVzgHiz3v5SWC046f1ocrPL+Gk5sMtlhv?=
 =?us-ascii?Q?G6ULyrvkPhRYchRqTPU0/CsDjXC22Yl1FR7OMbuY0m+9xK8G0pQ0yRN+EdPA?=
 =?us-ascii?Q?8sYEOPKOMaK7qUo6NXzkBKlgmewI+IKqf2diBUHSiyod8AgDiJwbB3WujDYt?=
 =?us-ascii?Q?E4IPd20TtVCylPSXKvBQtvv/FJ1KZHbcWTQmMOVYKG7+XQ0aE2Uvzmf1bNHR?=
 =?us-ascii?Q?gclRFsgtbnw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sC7B7yZuaOFfVwEYZDfQWURznZy5NERxzkBw/Sb0/RKbFlIN8r+3D/XzHAOG?=
 =?us-ascii?Q?K11Dy7+L8Ymg4Swj02oac/w8Xjo7LbOcgewJddQFWG9LNcMV55LU6ge9ZPeV?=
 =?us-ascii?Q?7i6y0F2isMpAQHXKD1B+UBSJ5yE/OYPW3dBN7SBeY/ZsjdZrDsxFXCJaeEys?=
 =?us-ascii?Q?Hhm9caGYl6zezKF8E3Y8ozZc2dHGEetnqfzFD4uCd+ALVONUmH/RVER0KcOy?=
 =?us-ascii?Q?fBWPxMz7KQM4pWY8qOwi1CA3btSALS93cDfaQ+8sIUkpHQqURquLs6cWw8Vy?=
 =?us-ascii?Q?GTV4mAqkLyA2K4qDDBCMVvGHwl3vKT7Lr2asVvwgWcy0CLXgzdieWILFcrgP?=
 =?us-ascii?Q?B+tC0uslqXCJdIJrmtJXOnSbn7L7TOweNhu7zo1ckn8WhQlYjbFik1m0oPa8?=
 =?us-ascii?Q?mTeiHQQkm9DZcnXn+P+4Z0i2lrUWKcr9HwLmOXxbIjBrS6BZmV7+2BqFD4Ce?=
 =?us-ascii?Q?Qk1kUwuJnPgeyKeB5oLmc4saq8OrNDpP40uWyJJ//rHKCmrulmvkpvunpFQG?=
 =?us-ascii?Q?k+6p8MYI/xPG8xZ0mO7PvRyX8GaSKeLT3C7goHLNwA8elW8vFVESg4U4MjOE?=
 =?us-ascii?Q?yhuEWC/zslk/qio+pXLgMyxyLkonC2awRufQ6CSXUrYuucsN8oe6b1umdxZC?=
 =?us-ascii?Q?EUvVEEk+7I4HmezFW96din2ISJm/T9Z5ZB5u4bQ5YfB2nheE/2WLEtZUKY1k?=
 =?us-ascii?Q?6srnmogPid9sO3ht15tIl2hlrHA+KuwiR8LSjPvkbCTr6hHHpMk78s8jp7j1?=
 =?us-ascii?Q?3bOqEF4Dc03vg5k9wRYy7QgxLePFXqEIO+PeVk+/V38GJdZmfYEpIpKdPSPY?=
 =?us-ascii?Q?KfUbB5tjPiwp6jgA5HmZiKUhh2FFJGohzNqVn5fcM5FOEaEhQz7KEphHqFH+?=
 =?us-ascii?Q?mOHbsEGiqv1Lok7rE9n5qEwppRDoZ/nCclsRyemj9vH1/3YZB4AbBKlMlfSy?=
 =?us-ascii?Q?O0QJN9r3EZoZxfdODV2tyNZLw8hvPvRw9w2D5WlOaeOcuWDn/Pe9DXjzUYvv?=
 =?us-ascii?Q?rusIhAfQevX8hNY8OfAXWZtviha+qaAdlEr20Uz6b2M65NN2knO2sEg/WgJ4?=
 =?us-ascii?Q?pIHDvFI17dFC5FSvkxM1hXV3mhrQUCNmhRYMuLu8LRX7ujGBtjR44AfgO56j?=
 =?us-ascii?Q?pDHyTo3ruLq74iKSXa7vWETTW8zCZ7ZqeWZI0ACMUc73fgs79jYjv9t3MCtK?=
 =?us-ascii?Q?FAJZkvQZXviapcnh9ziLZF5nMUCVF9kHdTiupz6yCvnVeXCJS3qqTD/PcpL2?=
 =?us-ascii?Q?Tz3GfjnT2tFpkxhfWvC4JXNVXw2YWrE2/v4nNXxbG/qalQj8FFVmhYXtyoS8?=
 =?us-ascii?Q?WgeFvQh8GWe6396ni11oyGlXAl0ijTcucfBC9V2go6Ss6DgMp8xMbAQmaI3+?=
 =?us-ascii?Q?Vs0lHg7Ec9xE+ogwiQM0t3A48WbwrEgySBl9QwZdc+ERXNagUvMF/RKwILVp?=
 =?us-ascii?Q?mHWAI/akST7nIxPoJc3eYQ1KJEhBDHIbfqZtS6BnBSbiKcd6xZYGFAy2eEqs?=
 =?us-ascii?Q?7dEkevyKHTLQmiWsnCu/G+SSOnJrOqeiQFYVuLD5//DQpOgm0FZe5AwJRXpU?=
 =?us-ascii?Q?ebQuXBHgfpJkf3UESDNUYgfoXz/4a1Znr4+uPK3GLBlBT6VsVpQeT8CQKk8m?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QkB7MsBBO6z45CTnLiRXHGYsbp8YyYEH+s/B7jJyVLik8Zuhda0iulTGyWp1KwC8JvSGftvZA7+J26HZG8Os5QiYSnjldI6KFSaytf7kXjfUPJ+wJhDgS/H+zoVlH5jScB86pAY0D9K8OcuIh/WZQr5zV5/pCXV5E5V9EQrfjP5X04Im8bvqTvMHg36zJ2aBq9FfY7o7lkpKhGE4JM0vz06G1qZjsnSMgbHFnoVbx2iKD46n2JZS0QVGZlkSv+jdfBB2dcOv9XFRsxkjWcn+4D3bBPi3muZ+55IQI3WldIaazPyfQtDGHQbUiPq4jTUGPW7JSx3wTLdSJss15NXMXjgU1ofl+S3c1Dgx6YqvhzELXfCC8kMv/BPf+GujdvMhaAIb0B4k2VogCyhfO2PfJUpAfM7JmwJACsRQ43fACuFCIXLH64vrYjrXnmEdWH3rpSqAI/lCIiebWn0aDLZ80FmQwgz7Cqoh7gHqHz2iQvGkyk7kAOLOx9tCLJWVXjlDsurWEIDBaQV/ldHju1OvME3hyvc0exjY/O7NyqPphLAkb9BUh+VoH5hALLwg9fuf+SABPamXpkAeKCVfhayTXqMQFmF08dI8dyAO+JLOVdk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f183186-ca90-4134-4a96-08ddb3c17f8d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 08:23:00.7154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3n49Eq5VUbgGOlCFm1d9dJWrL28kEjFPnEj43ryA2IfFlCi3bsqBHoaA+kWWqjheboFvUX/bSO6BW286evOAm+NS3uqlgR22g9Ibe+7MEYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4585
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=937 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250061
X-Proofpoint-ORIG-GUID: rGIB-S8q0c85geJoKWdndRFiAvElzSRn
X-Proofpoint-GUID: rGIB-S8q0c85geJoKWdndRFiAvElzSRn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA2MSBTYWx0ZWRfX1bEOriijRvZE 6k2+HEAFzWTVCnxF1B7YnQD88rz6dBWi8b9bZkwf8fu3lCwNaDYFyKY1puysPYTNnLoLPKrL4Ue vCsMkV/DzrkTKu/sG+6i5Srz5pBr1CYPmFgT6q/vGTRwaTFaWGiNCVEqsDOqwGjo2KJpsyZkbxt
 D3KjiBFB1QDo+vtiNjD0ag4CkSN3GGBdxk2KOixgZAdg9Ch5TVeuN7r3HvVQV+c3yiZ0fbjSbj/ UIf95+iXpb8TOQ6R86ixR7LZwo7lJ0rOIBnpNvtEtTX+xb+t+0AyU4biMiKQj1qwvs3fFFn/Jw1 +RCwNnyN6V9Xw++vAZUE2scuug0qwoR/+tXiSDS3dP/XKV4mFx7n7ZQ8zXcqUZgHj1GHJKmGoqC
 pJ56404j6l1s5uTsUr0uMRtpZ3c7p1HQnnxw5J4Ny6olOKIJkpk+dsGW2DVqJ6RkqULYWGc1
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=685bb1e7 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=nGAvZwt4nf4Jd59HFlIA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207

On Wed, Jun 25, 2025 at 10:16:46AM +0200, David Hildenbrand wrote:
> On 25.06.25 09:49, David Hildenbrand wrote:
> > I think the whole use case of using MADV_COLLAPSE to completely control
> > THP allocation in a system is otherwise pretty hard to achieve, if there
> > is no other way to tame THP allocation through page faults+khugepaged.
>
> Just want to add: for an app itself, it's doable in "madvise" mode perfectly
> fine.
>
> If your app does a MADV_HUGEPAGE, it can get a THP during page-fault +
> khugepaged.
>
> If your app does not do a MADV_HUGEPAGE, it can get a THP through
> MADV_COLLAPSE.
>
> So the "madvise" mode actually works.

Right, but for me MADV_COLLAPSE is more about 'I want THPs _now_ (if available),
not when khugepaged decides to give me some'.

So we have multiple semantics at work here, unfortunately.

>
> The problem appears as soon as we want to control other processes that might
> be setting MADV_HUGEPAGE, and we actually want to control the behavior using
> process_madvise(MADV_COLLAPSE), to say "well, the MADV_HUGEPAGE" should be
> ignored.

This is a _very_ specialist use.

I'd argue for a 'manual' mode to be added to sysfs to cover this case, with
'never' having the 'actually means never' semantics.

You might argue that could confuse things, but it'd retain the 'de facto'
understanding nearly everybody has about what thees flags mean, but give
whatever user is out there that needs this the ability to continue doing what
they want.

And we get into philosophy about not 'breaking' userland, not sure we have a
TLB/page fault/folio allocation efficiency contract with userland :)

No program will break with this patch applied. Just potentially get performance
degradation in a very, very specialist case.

>
> Then, you configure "never" system-wide and use
> process_madvise(MADV_COLLAPSE) to drive it all manually.
>
> Curious to learn if there is such a user out there.

Oh me too :)

>
> --
> Cheers,
>
> David / dhildenb
>

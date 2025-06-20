Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A44D2D3A86
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434269; cv=fail; b=Lr12Rx9loy9C71z9uo9Rmd7zfP/6BaAo+HaZB+a6uI1sE9yEx+Q1zImrRKXkrlpYsHf+YBeB8U0CwpCBe7MeFpP45SE2HNE9h5vnolerhCVEpEqQzXasLGmO+ejireTG1G1rRYgNk14C1Jwm5ERBbcXSowWmCTdqnYnGzj/ykuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434269; c=relaxed/simple;
	bh=EF2xCV8Ksnzh7SoAtQyWMHVrNYyK8/AarC/FU1h0BGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UsuV1N1bIOfK9TXw6/ryQTOoGqGAV3uCZJQSp+/wcQllvRwQYZ8Bvwt/bIT1TgEh19g1iUp3AEQ0JyPZKLCQmo1gA+eBrWDOKWsibsMOZX7T6gOBqxaEehIyShej/XzHpD/48ICManRR3l8K73Bnkyscykritrn22vofHk6Faoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WjqWxTSh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gk60DIui; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WjqWxTSh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gk60DIui"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEBkHF027604;
	Fri, 20 Jun 2025 15:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=zIFtNeniLTg+99mpBV
	eIewCtLArNpnDttdaq8G4t7+Y=; b=WjqWxTShAEx8R2ZMNMwskMvz/rmWLUbrx3
	Glxgm4nKLjAy15jp9yF1VMSe3xmS0XgSBayIrrW+IiGOP+der9zzKdvnWN1ZfgYG
	HuQL4Q8nMbdRfvAAddgMXWNvApmyr8gtNL2S0Auc+YWg9KnfnV5wSDsSbpeyqUHg
	Rj0akN4HIJz/vSpeixnla9yQrrYONTl9KjmLdBRng6I8B+sHV2xZfaIhP06a3/XK
	6H5IgQ4yVI+UvYfkduWJdCofENcREecTL2TGdSBgv1+C3Wmshd7wZ43nyfDT4tMk
	tK02b+5HnoltvhC9DiOqNbOBz/7eS1hiB8vo6O5rVZhfs+kohYkw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xyf4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:43:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEP2mX009746;
	Fri, 20 Jun 2025 15:43:49 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011065.outbound.protection.outlook.com [40.93.199.65])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhkjpnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:43:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXEJJSMbFxRqb5owg5FtrOC/7Ze3VPT0SUFyD84YO+FcxlrEMW3yRk02g3S1wcC8/fK0aW0ptm1MPZn41nLLlVbXpcPO9mT6ET9s1daGHDHzdXnkRzSMlRN69ZRxRPdk3JBRY1mZVJQpnfbIGlRmMxKMYaTKpDlltGbZxecx/JkFGTHsGl1nJ+lUeo1aT7q3tPtdMbuvisn4K8ZDr4teAgak7vyyhxsd3ztGKZSQc/8AfyizqNH3fEydTaZKOYqqIaXfl+svKESYW+LbPZ9oq/eLbbRgOlGWSN+mJDpRwg9FDmcj9yx7sZIOhTxcOGtCs9OHy5LRAKa+4ksicQn+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIFtNeniLTg+99mpBVeIewCtLArNpnDttdaq8G4t7+Y=;
 b=iniRCL/QN2Kk242+t4CpUvMHSBs8hSI2o3aVucQ2G9rE7wwCZcdLrNfWkHsyAhf3n4vjz9v+Om7I4CBye3XUz2pO7wMenstrQzTh3Ui/w98nEvgnw6v+SHO4hqaN8a5Vr4FxPD7vPVdsLYmWyB5TaS77e0QTs6YyxX4dwo6BM6I+Y28AWY43d7/lnGbhPD9mIzOXtZ7FY7X5HikMFeqLwKpKfACYMy4ZxeFW8FMcddb9dwcuzZzRPZspTDm9UxgnsXDt2uvVKfpr6V1NXN6GSUJQOrzZ2k8N7Uz2krx6IJHDELVWJDrfnyNhrVhadP8QTyop1QShXC2STJiZ+S8wYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIFtNeniLTg+99mpBVeIewCtLArNpnDttdaq8G4t7+Y=;
 b=gk60DIuiG7aPR9JG608286XWDSLWMB6AXkZDPqI25aIgbGTD99MpMdHaCUDrKATgkgDg24XaQtiajdFPRpGXGxPJj0DWsgeER9/Zc3OVb2KOkdR/nbYUpNESx0f+Mw8ni25lhLnC87UZMCNQwgwSD42duZtokdEk6QZwqFU/nm4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB4896.namprd10.prod.outlook.com (2603:10b6:5:3a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 15:43:21 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 15:43:21 +0000
Date: Fri, 20 Jun 2025 16:43:19 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@kernel.org,
        Suren Baghdasaryan <surenb@google.com>,
        Hailong Liu <hailong.liu@oppo.com>, zhangpeng.00@bytedance.com,
        Steve Kang <Steve.Kang@unisoc.com>,
        Matthew Wilcox <willy@infradead.org>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        "Liam R. Howlett" <howlett@gmail.com>
Subject: Re: [PATCH 1/3] testing/raix-tree/maple: Increase readers and reduce
 delay for faster machines
Message-ID: <6e5ad25c-3f6d-4f78-b39f-91e0ebdd5fc8@lucifer.local>
References: <20250616184521.3382795-1-Liam.Howlett@oracle.com>
 <20250616184521.3382795-2-Liam.Howlett@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616184521.3382795-2-Liam.Howlett@oracle.com>
X-ClientProxiedBy: LO4P123CA0301.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB4896:EE_
X-MS-Office365-Filtering-Correlation-Id: bc9d63d9-5b16-4e26-fe9b-08ddb0112f8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GUjwelxnNl/cU5GEWZi9wAO+6XNDilFy1MXxGZhbxHWkIxjaS4Ignb/pJmUw?=
 =?us-ascii?Q?NOpEe8O51x0hYDT9KtKuNygiyyo29x2LWWy2krxDJ9JuVDy1lOv40yQD2Wdd?=
 =?us-ascii?Q?lR2kNtlec+tSHc89xEhJ9DL3PzYIu2C6L8YIHutbAst8+oSjSwWRu/UPOBa1?=
 =?us-ascii?Q?x0r/UPjKJchmb7jdjIXxwcQOMhvlNsQvEXWn3Gjoigz1CNWtzN61EGf/+hHR?=
 =?us-ascii?Q?8FIr9dsdc9ueqLNYdPHglp7Fbcm8M7VMRbTKZHROuFri9ZGuweIWecCX8jKF?=
 =?us-ascii?Q?UAvUUg3unsVOUJ+Sts5baLldfAJeMX+wRy/cCF4vZoBKxQbYNScYLg3wQ5Qy?=
 =?us-ascii?Q?2jnzaOtIxwvMbcRYsWyK5laQeVQn/T/B7vhiS4G7KZXe4pTSJY5DwrfP50G4?=
 =?us-ascii?Q?5hpgNdSgwctWaYCqb+HEh3+H40MWrsqkHv+nfYNWWQGLPgB4xDCUvOiXkoCA?=
 =?us-ascii?Q?6WVDPkhjFvoSwS44pUvKDOlbG6qzzpYXYasKolgFoDv/1opJFYLEMyIPCedo?=
 =?us-ascii?Q?lHS/JbMVn3oeLutkRjwXoIFJVHEQGfXOr7WmDaP+0PYszMDGJKse7fz7FdJk?=
 =?us-ascii?Q?ym5CvhmQTrkkplnGphTKJUAcOAKQjhn7XyxjdOvemhazCuIqvpNgTBQRvots?=
 =?us-ascii?Q?y51aGq/stiURz8ANsFQkedhG6bKXHT3UjFQSwn7Eh7ljTjTn6m8f4bY5RjUA?=
 =?us-ascii?Q?xUrGhXjPNRGOv92D6EgD/BJrOxPGmU6V4IIiISVG8WYgS0F24VtafLT+VDaE?=
 =?us-ascii?Q?LVjgu1hBNzIsld2fzmlBgE6q3BzF338kERunfwpDDSrCpVu3i7IzbPeo+iwO?=
 =?us-ascii?Q?jSN824PhtjkvgUnLLv1CuPzbtqoq8z3La9yyC66F5cZzhtEyMNWozGVVIjwH?=
 =?us-ascii?Q?mT3dEvZz/QtmMvU0kbRxKqc9pUwuXCKMra3MEgbMVlV2GcWroAJMihoLqCfM?=
 =?us-ascii?Q?vhaWgAY2DkQGYfG6YwDfxC7UUGXrIZAWVoPmXo4xagtl1Ge7FJY9s5LWsrYo?=
 =?us-ascii?Q?5HOwJzVH8d/782YdH8erpMWgBEqMjNepyeZpVVj4lt7tJVvG8Nc5I3q15NWt?=
 =?us-ascii?Q?0W+Eq8wbBaLwYmgOGDckvbXjUfNNjASNr27ar6Nb29KADrmTAkbBgL79Qns1?=
 =?us-ascii?Q?xPvcrpfaXp8h7+q4YhvEprPl4OTF6HvUQZ4jIJ+mmXmA1cAl6vVm3hjAS4G5?=
 =?us-ascii?Q?fzrvhBw6R6ErqRs0ljnGwKhhUxvDrv4X7tlbRqsgvy1J+8ktQGLq4/GBSKIl?=
 =?us-ascii?Q?3qZgEWrqvAQFdWXFZ9uqD6wbGs35VUbfKcv+UkktF3xgmaYMg/xfTigdl+vN?=
 =?us-ascii?Q?IHoCBdNREx1o5NAFyD9xFn74mEKNSMmacNzSl0bWjjNd5mKFa/hzNC8MkHKj?=
 =?us-ascii?Q?1w6KBgbm0Cb8uFp65o+d2sbXB3mbmKSnQgsY+3Craxl3Pnk+xCBMOu9RIFqS?=
 =?us-ascii?Q?E3ay/MFZQ84=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q2Y95703k33lK+f4IYdHx3WlGLbBT1najzQOiA7I3PP5qiiy/RCy8MvB8Aq+?=
 =?us-ascii?Q?kMi6K6OrH60+gCbVrWAGkzzKhvaL+Z00oBneh9JSYe/IwDaVWX+ErA7yGlNw?=
 =?us-ascii?Q?kJTapoZejG7wMDEJlv9L3RrtrjxlMxgSQPg8nGWRF7ZJsQfM4s8OMXH34te9?=
 =?us-ascii?Q?WPF2n8dXV9rVZ66EFghZ0w8Byi1/hnyGP3dvyCLmpQawpwjsy22uM8FS08NC?=
 =?us-ascii?Q?De+6Y+OJwgcdOAd5gzO5ASpa9eGdb8mmWA8/oAIaXde1Dd3XlbUYDfk55iLt?=
 =?us-ascii?Q?N6gsDfRmo+SUD3KrUyH+lMuOSwJfK0+EdysuiFp3I/64iPM0jrXgGEayivfI?=
 =?us-ascii?Q?Hp/30iAWkmYZYesoeL7b2ZnAKz1JOqogO3vg6ZgVSi/L50tWNx1ecGjAIWY3?=
 =?us-ascii?Q?PRUmRl+9t2U8XM3xR4vW+Fh17Nk+DRIyGyQA8ZUewtWnT2MkNOfSu5VriqvD?=
 =?us-ascii?Q?jALSjKUYLa64W7Okn8Ja0JXPPzZ3Pa9tg9COSArMV2bg/Lx6DGs61BkxAjzJ?=
 =?us-ascii?Q?NvFLQLaoP6NtlID2tCXQ7h5QPSEOvg9sUMkE0bsoY+3Q88W3THHETBObAOyD?=
 =?us-ascii?Q?f0YiyxPAseaotIhYXLmK933KW3/PuegrZe8nUmqYlwd8JsqHSuNxyny2zwQk?=
 =?us-ascii?Q?PzTBURGuBXuyJtZshV7B6Kzlybg/iubbLCK7MJNJYkRKz8f9xdCX3+xrXKDd?=
 =?us-ascii?Q?BEPlgOSE/Fomc+ceMkMPrbGeTzKRcy08eVvBKw8/EGSzvOp5YOgpfnkkAQ7d?=
 =?us-ascii?Q?OuYuE89VBqut4ec0xt476KvmM9enjuHVxXoifkC/4Xwbbb0tV991WHGyIK54?=
 =?us-ascii?Q?HpghSwkuHUOEZ9p1FKIZnXrvhE4vKu6dnR+renWJ2WUgQfeTcfN+pl0AfWGk?=
 =?us-ascii?Q?O41D3VxerI4pL/l9gSWV/kA2C5q+LCBofMr0HAiIlvljLP4fuf6wK4BcOsJJ?=
 =?us-ascii?Q?43VGZ54y6+RBRgeFclO6H4spidh/IrDVXFGmpNQhhHUSNZwuf/tZ1LoL5jsV?=
 =?us-ascii?Q?ap5iRlMgjC3BlqiOzGKEC0OMAoPuoI23+/JtjGc0mk9IivOvGprw1KwKupMb?=
 =?us-ascii?Q?t8xlMWQVXlGxor5b+4V1Btr8LHHyfUYA7HmIFG27xtsPcd51LKy5rtp+0B29?=
 =?us-ascii?Q?qsyx6dEZhN7ib+fdh69XF9153TPzyjCdkJSQ19PsbuEMCxARk7mynuR66a7q?=
 =?us-ascii?Q?uv4kPFJrNi6Kzzv7F2ygpFR/unaDRAE//TGclVo+XtHFlJ8y81L8N2on1zIT?=
 =?us-ascii?Q?9SN6Rb7+wV8PK0T8raaIL908Q+crm5KipZ1twbVboTR2NyXINA3Ecelw7V8i?=
 =?us-ascii?Q?iwrYMOUii2x/m/YUjIxo7o2cAMZPTcsYWICgr02CGHPTWo5J0WbrpIGBqdp2?=
 =?us-ascii?Q?0ZLL+oCMp9QBQaBgcXdZj6Y7wgekv38+lAU/dmxb3XuBjjPrV2z6u+CHiFqE?=
 =?us-ascii?Q?kui3hig8xbEU18C0/hx/W+m0RE5nwQy1IZjj2zcIYU9IH1CaQmhq+OnWnuuh?=
 =?us-ascii?Q?FdOKoxF9Ik/PJDU+bbHpMdGiXiBpK1nxIMPI/EGitW+FzhMR54YCIP6x7m/k?=
 =?us-ascii?Q?rRPpGmc4Nh6tle0T3DYr2MK70sOExFhzF3K67IoEzb20IEiTTOOQw81QHsW0?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jD6F2cwlKh0g/m0Ztiod1zc1G/YM3q5Xz1GgToVIJsj4yru7d48YbMzDDYEUE2FBtDjhNRLExny4XwAuaC5HueUrrqpNKkJjG4vpYQgjJyfcdXBF3IOLhakyvHQAzODd5aQ7XSrF86mXKG4KlNVvQX1y1eoNzYU09BHt6X6z48HAee59qv07d5/8IxFEYZjhUF2VjY2z8WIP0w5eSqMiJ/NFs1Zeu3neBMsZMqN9XDWTLyKYWQgBHWvB6Ni3ie7zV0RMQQ1fV930SlAvgt6pHZPbaR6JkmL9I3VjwujFcEJ3rq2y4HSfXLy9/eFMAyzMd79bk4X15cTCaP163L2SdddYauq36kphqlAS14nzbVQq5DlmnVEKe6MXCU+Av3MjjIpRYr4bGGrQBRbTnPcT0na9oZkZhFXg/9ktHaeIj5MehjqHPK9hNVrBIRoERQaZ3U+l/ackswanocQjX5Zci1H+LyyOESDvGKzGqzH+Oc1G8OUmc14/DtO6xQfmMQq61hGkfKjxJDZMwUnF9yiuP5SWQ89bEBJAL1u3LtilwvXfcMYfBXrNXgaYkBia6mGVI7Magzk180fpSD0p8Nnjj49HXgbOy4V/1FIoTNB4EJg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9d63d9-5b16-4e26-fe9b-08ddb0112f8e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 15:43:21.6364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KofvnCQcFH8i5wiQkrbz5Xca2/17IGyWvam0CjCbN2KHfZkGFGQhZsW8ROQQfuOT1rM3jcvvywgJY7VwPni2v0mrE8k61CV/w0Oo0PWWH9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4896
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200112
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMiBTYWx0ZWRfXzDxJJflJxpSE zWytANuHbJ5SKkCVuYlhRXKz6+jkwb63VR6P0Nag4S4OoIdCtP4F3pubrk06OvtfUV+jCveMK+3 Bezo3GccBdnHXX+//ELtk6DQbLWCHQXPvTzhamQsWulDf7f0St4Zgq29NK3ybD03q31/bWpX5xu
 ACtOXlKKExzxvoSK/85x7U8aw300+ILlelxFpULUqaY831FuXvpdJD5ZkQrsiEVf33kCb4QdClC GZzLiFbhbiAnApnNviVC+mR/Kg080epCQmZHazKq+udATVtIVDP2/y7lEW/yLz8FDkWxHTYIvTK 3hROmRu974ZiqEZasRL88pIsDN/72uDSx/NDHfGZXMj/VahSGAObjeAXtyqTjUeF0F6avuPAxzQ
 zvOqlzVHNja3Gt92mVhBW7/hBTKVQfWy8HMtQsiT3Gz7+lOx8AQbiV3eNZpjrmR2oMMepN6Z
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=685581b7 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=yMf9JZMx1mHCN0p1MmoA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714
X-Proofpoint-GUID: COOSmfKxP8WzfNVLRf1glsGXhpOySjet
X-Proofpoint-ORIG-GUID: COOSmfKxP8WzfNVLRf1glsGXhpOySjet

On Mon, Jun 16, 2025 at 02:45:19PM -0400, Liam R. Howlett wrote:
> From: "Liam R. Howlett" <howlett@gmail.com>
>
> Faster machines may not see the initial or updated value in the race
> condition.  Reduce the delay so that faster machines are less likely to
> fail testing of the race conditions.
>
> Signed-off-by: Liam R. Howlett <howlett@gmail.com>

Seems reasonable so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  tools/testing/radix-tree/maple.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
> index 8b97aac1084e9..6a5b0342941c4 100644
> --- a/tools/testing/radix-tree/maple.c
> +++ b/tools/testing/radix-tree/maple.c
> @@ -35062,7 +35062,7 @@ void run_check_rcu_slowread(struct maple_tree *mt, struct rcu_test_struct *vals)
>
>  	int i;
>  	void *(*function)(void *);
> -	pthread_t readers[20];
> +	pthread_t readers[30];
>  	unsigned int index = vals->index;
>
>  	mt_set_in_rcu(mt);
> @@ -35080,14 +35080,14 @@ void run_check_rcu_slowread(struct maple_tree *mt, struct rcu_test_struct *vals)
>  		}
>  	}
>
> -	usleep(5); /* small yield to ensure all threads are at least started. */
> +	usleep(3); /* small yield to ensure all threads are at least started. */
>
>  	while (index <= vals->last) {
>  		mtree_store(mt, index,
>  			    (index % 2 ? vals->entry2 : vals->entry3),
>  			    GFP_KERNEL);
>  		index++;
> -		usleep(5);
> +		usleep(2);

Just one question... have you considered hibernation at all?

>  	}
>
>  	while (i--)
> @@ -35098,6 +35098,7 @@ void run_check_rcu_slowread(struct maple_tree *mt, struct rcu_test_struct *vals)
>  	MT_BUG_ON(mt, !vals->seen_entry3);
>  	MT_BUG_ON(mt, !vals->seen_both);
>  }
> +
>  static noinline void __init check_rcu_simulated(struct maple_tree *mt)
>  {
>  	unsigned long i, nr_entries = 1000;
> --
> 2.47.2
>

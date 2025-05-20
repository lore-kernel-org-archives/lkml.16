Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE618CA5A;
	Tue, 20 May 2025 15:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747755173; cv=fail; b=iSKaTAWmU+ooZbf1TmED7uSjZBplm/bVHYyosJ6u00J0B41qtzp0ECtjrgFqV8d4kMgRPbx8wSN7/399T6VaI4O91SyrFEFQQdbJRB2J8nrnhVOH2Vz2a9yv3IfYSgxnyjUaVs/aOgoUh3Yqj2sT/g00pt06oN5BwJDOv4l691Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747755173; c=relaxed/simple;
	bh=b4uS89ApiVqXM+AIAx4YZS2v3jF/OQkQ6em9Jl2ugQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PviZmGJjRgZ08ll+KRgzgov9vSpdOJM9nY23lktQEFqAMFn1qJaDXdTTKZxRgXFoPnb3WSb0SR9Kgk5gaiSV09GYPDx8ugYeXAfVlQVzEllDlhXuRc14c4/yp516p7m4O8iV9q+qQAV0C3PUedx3cemB0Fqu5Mjq3rgEaAbFaAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PRfYFl1F; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CE/xUSCB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PRfYFl1F";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CE/xUSCB"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDrWDM023486;
	Tue, 20 May 2025 15:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=xAJHQEQuDFNaN+TJXM
	/DwNSl8HI5J3LeAXKeWLBiYAA=; b=PRfYFl1F0JSEu4oQBiKFJa/ieeeuR+2Tqy
	Y4qT+k+tYXd9mMrhmIyzSHYIRwgn9/sOXgme4daGBg8tkh8PUG+xvWwGR/FNW+iM
	gLjHts/grm1JrLqUEtom3h7N+YqV5CeYnteRPJl8s41RnQ11micP5jTD/+AfGJjQ
	gMFEUe5GU+crdA/Y2gSaHwK5fqnvuHIgJgEmkpafM2js3Rh0ezqRIkLKeDrXqcdc
	Obb7+TNvyKvAe8FltBE8hLEpsIXytR0iqH2XOSRqUma2PA1y/UjmKv/4wGpsPd0Q
	ceGOkl6Qhln/yFm39fvbzEfrl8ZuVHuXD5PyxpKacJ3mtdf9+UHg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ru11r9bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 15:31:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54KEG3xW015622;
	Tue, 20 May 2025 15:31:54 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazlp17013060.outbound.protection.outlook.com [40.93.20.60])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46pgw7xbbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 15:31:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dap/KLF022NW2anmq/VFxIyRIRDntL8yUFZ07wg8umWInpSG2A/JXVtoLnX/rPxSaT+CRjv65RGJxZAtWVJqnNjaCni50eC8CIxd5366WiSlPe6x69qUmsgLLJSsNxdUgt6Z24ENJDuKh7kQpDdH02+cMi/NA5eiEzpyl7LjB1Wuhygdl/srlYY3G2TSjnlFpaCN2/8LdCBQTc8yr6NRvVqAZ9SqHubqW/hH9JOcKChsXZIiVAo37w1phxinitSkMnca1/aT0OwWgoXDzDx4cGGShK4HzKH6fl/1x6kiGGyJc82AEArzCi5XLLrP8wK3j1BuZxWxkTjWa5yj/SzKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAJHQEQuDFNaN+TJXM/DwNSl8HI5J3LeAXKeWLBiYAA=;
 b=FPcVNIzk1YP06c67ExFoi7ZPLBYUdYaF0fgs6LyfJbVEFybodfmOS//ELXawxXvCEMwoqUBlHdfqJ/h61Yuhslp+8rqnZA6d58maYL648mOtOAe9pluBx6aU7YXg9kb/UbDRBmgiDchF9RqObVI7vUXnK2lQwu3RFc75U/Xze9hM3hdDwaAiSoh/CYrlZRt5uUu18/yxBB3OcptVLAbdy5crBP5wdlHKlyP21XAc5VfV+ZPSpKH0xl+f3f7RKLi32xRflqbLh4Vrxn4IfvJ1YrpvvsoD8J82I86qmWu4HBwRfR/QKNeG5UvQUvFE35TuAWC0GOV8ly2GdUEqPPfj3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAJHQEQuDFNaN+TJXM/DwNSl8HI5J3LeAXKeWLBiYAA=;
 b=CE/xUSCB17WnDbabNcd0/yaZXt/m7z3olGLwwbB1DiQg1ssL7fjvUFX1JG0py6MNXBR5DLx0WhD4dyJuXNrjNoXIH/SJ8eOgFh31PwYEfKYGGUyamavPBTj92uvnmWuEza/cSZKsZhJAzc5e1nAw2Dv50ejrpsYNb3h+jyAwVq0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW4PR10MB6655.namprd10.prod.outlook.com (2603:10b6:303:22c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 15:31:49 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 15:31:49 +0000
Date: Tue, 20 May 2025 16:31:47 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
        linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
        riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, vbabka@suse.cz,
        jannh@google.com, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@meta.com
Subject: Re: [PATCH v3 1/7] mm: khugepaged: extract vm flag setting outside
 of hugepage_madvise
Message-ID: <0cbb1f29-61a2-40ab-8b78-f7550ef41532@lucifer.local>
References: <20250519223307.3601786-1-usamaarif642@gmail.com>
 <20250519223307.3601786-2-usamaarif642@gmail.com>
 <18be636f-d6a7-4270-b324-22750b3a358c@lucifer.local>
 <ad5b93bf-24e6-4b15-9c0d-5c501c74de86@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad5b93bf-24e6-4b15-9c0d-5c501c74de86@gmail.com>
X-ClientProxiedBy: LO4P265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW4PR10MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f2280e0-b012-4f6e-e7ca-08dd97b37023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SzeVV2/KYDaI+fiLtI+gQMhhtLvRQu09mlmv57Ze3epu89EBM8+ZjD3q8uuc?=
 =?us-ascii?Q?bEW+D2YltTnbsOkIniFaebkURCV1VkXB0kCCzem+wagnLOBfj0KoETqvRI9X?=
 =?us-ascii?Q?epCeYLZo+Xj3sWPy5MsUMt443MOSUAIW+xPH7EATUKn7wyJCESnDT0Iuyj+8?=
 =?us-ascii?Q?C87K1ywhMreG99x1FLfy3ZglpVt7Lx9fL49JnbpPTZLekkxP5tRoTKZfyH5f?=
 =?us-ascii?Q?iX90wDWNxHjprboWiYgWd4IEjwQNgo6Obr5Fmg9csDIUIqup82fzNBWm3uv9?=
 =?us-ascii?Q?ysFJNHsNtVDijjg6QkCC4epnV5rsJSihy2rvo0cvbFEPqoPC4b6mFK0MHrP7?=
 =?us-ascii?Q?iqGx3lBJazR9T5/RTfr+JjWFgpljwE1GBPYaFBB10KwmXtH2CTWhrhYJrLE3?=
 =?us-ascii?Q?DXldoKH/9RHOJI+TrcTZrY+aoDGczAHWVyY8WSWqZGxOnkSZRY3jZFnTJL4Y?=
 =?us-ascii?Q?I4b5Rlq1lNkX4oa90Cl4LVeZQIYgY4IpdQTgeNvhERy87pOW+1sOcecfDmdN?=
 =?us-ascii?Q?A0m6xcsRNgaLBiB+qB4vywO2ybEDb6tL81BPEP5Lp5hYHImEJeZzAHr8rI/V?=
 =?us-ascii?Q?oi+Eol4aHQ75UwzIdlyQXwmn8WFD3KF6G/m/XtzmxkxIojhuXzPCYVYGdop8?=
 =?us-ascii?Q?zoxtSydEr9vpnELUj6ZOpVcU34jgWISK4A6qs1bglZ+WbpTHBZAmYLSMVWDZ?=
 =?us-ascii?Q?jiXfrc1cpa1JuFTC3qJZPyjPwiWJuWFXqhW+DNHO5xOFuPXd75f0PsZLndro?=
 =?us-ascii?Q?DkwaoCk0Rl8KqCeTJPMhWPFa1V3jm4a5h0RJ3QHsZ1gFY54CDez9U0U/u+bT?=
 =?us-ascii?Q?Lo37OY1aWt0+IpHVK3LnC//dVwP8ZHKtnRFHo4y3C8QAJ3LxjdSMgwikm6Sy?=
 =?us-ascii?Q?+SbogenQr0Y8Y1k1QhO0ttXwcoVCzKgOLo6AQaMZwpVIIFhvhIjXkWx/2oU+?=
 =?us-ascii?Q?4LOXtEW4aqdSqNdljFPIE+T7sD5a/UQo6pY8HC+k6+t+giZerU65Khfa1p/g?=
 =?us-ascii?Q?ZqKlLqfqbWoYM2bqrM9xbopZLjFkZLUJDYNJc8yd2b13tOMj7kdOHBWEdEJ7?=
 =?us-ascii?Q?RvLrkD4B+dleFdpnoNFkkmCWJ71adOYu5f6vCtjSZiaRQqZFc5lnbN3NljRr?=
 =?us-ascii?Q?VFW2cyRhNd3pR16ersOLYmesnNUsIOTZWLUVs8ayvx7Ngpu2MCdKXBTYpq2w?=
 =?us-ascii?Q?nBSNhPSBQrSlzFo3eplIyIBMaJMP2kYbsNgY0AiAxkOLj4tor1ECOztjdXJV?=
 =?us-ascii?Q?T+Zxfk2lbDq+lCVOs/8f721UxajiFgaG6oQVXNWVoaB+v1P8eKfsCxRjRdvU?=
 =?us-ascii?Q?L3sTCXzKDyxIM8M/tF2is5Y0AUy2n2NH8OUNDGLV3uauMN+plhYktwcns44H?=
 =?us-ascii?Q?SnhHHLL9tMciWL1cvqrd0F/TbTjmqf4s98lYLVjzBgc7VkG9z0ERkdKkr7Dy?=
 =?us-ascii?Q?SlvqM0dQYvc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aURUFGFO2LqEP35/sv0DXMcr/4cevpmpnNbCshCVM96DWleq/CqHBb268iNI?=
 =?us-ascii?Q?ObGz4DaRBDXBgeB7SAR0Rvstj02K9UL6P7+yILJUc2GxyuQ0bNUPThu4JtGI?=
 =?us-ascii?Q?9Fms0jiY4h2XBBT5YtRpQHRJI/eXVxlY0ZI496ZHjdAIoAWEonRhBmJAhZud?=
 =?us-ascii?Q?dViG6TlZ+owOXNsT1OdQZC2YfvJ2UhfRK4cPmzo/7EvxTX5LgiQ/lQFIjWlI?=
 =?us-ascii?Q?7jnbBP5DHyA4TZkZhPdwyBtC0ABNCjDJD50QoYffCObrgQUOLwmNxs4Vjd4F?=
 =?us-ascii?Q?iCGkd9lazfAgOln8nU0OpEg/heu5Y/iBZhsWJia8EZepypuKUnw2i3rcy/bt?=
 =?us-ascii?Q?Ng7BoZRoFF09RNZZ8TPTlFyWXE1rW+2OW89HPvqNhWLfbVIHygk5uZnhh5EF?=
 =?us-ascii?Q?jSw88DXEXjjxAZBMI8zDEF4601z3aeWC9nWx0PMqfg9mv8XKxGVvm8yQyy5d?=
 =?us-ascii?Q?YlC7xpe5iWPOJbAjVs0qFJQRkyOYRusE6TJ99cg8yus+6aKtqT+biwbUuY1m?=
 =?us-ascii?Q?A3Z4uuFAAQP7jck7JBfdbwtK7gb8gis5v6ev/IuSOnZy6YldNblycmSNo3RA?=
 =?us-ascii?Q?ITFUvlcJJTHWPYzmgvyOl94Rrkou7K7hh9RxYdLLE0DYg/UpPKTcMz85kI8Y?=
 =?us-ascii?Q?dd/+79pHZdfVoUOoMB8s6vR2iaXxvs/35dG77ca3rYlVO4Lf/smcsKV1RCr8?=
 =?us-ascii?Q?ywpFkNiSYvSWa825i9je+mbYpw879N6Q/inJei5YEpnDdFZNDA+V1TfdK2oC?=
 =?us-ascii?Q?DX/NimOQ4NMSOb7HfuXMGrbmVZ5ZZxOLhn0CajmohXhMuqLj/BXElORQqiYr?=
 =?us-ascii?Q?L1tNP5MSuqffiTbsjpt+8T+mDQ6VIjMzvLGeZhB2BxTh0p7gCb5+jB87IT35?=
 =?us-ascii?Q?nbB6sMJm7u2ugpqF0ij0uFtQBkcDH7QSoEiG3i72rE0pVoR8rGVkZXji5hQZ?=
 =?us-ascii?Q?kXSn/3PJoJeGyTHW1mtD4ICcoX/e3Fq7ZhKyDc2GooejN3I18ZGugq7l37Ux?=
 =?us-ascii?Q?kfkoL7fQ4tstcsLt2ZozybidofmUqjFzx3sir9keMpHTFX+NBLWjm+CVpvWj?=
 =?us-ascii?Q?81B/bB0I9zoqc9JS/DeB7BBslvgRGRxhrLe5r2KY5p36hOJjqw9kyGSbAn5j?=
 =?us-ascii?Q?NFftY//xYDab6HfWYBtywbmv1LcGtqwOE7TcPxcnAtbJ2hBv/+yOO7Snkl35?=
 =?us-ascii?Q?Qq8mYyFN95rsw7jp1TkVZ5G/UxsozYHjmndCMmcHpRCICKphSksGks+kRgUC?=
 =?us-ascii?Q?Scrlj6boAJzH2Fa6ITku4o2VPuo8q2biCgQ6rAr+T4fcEDbpFFM42+5abUsT?=
 =?us-ascii?Q?4rKg4uPs3IluFBGBMUo0wsYYBMxCsAmt2NsocWT/xYdewA2Qx1FriOeTcieH?=
 =?us-ascii?Q?CqEX0++mGJA7RZamaTgRvmxVNmKOSAvc1gSERLJIHA3KC9MZ7108Ra5LAPNr?=
 =?us-ascii?Q?X5Yddi+PC47NSDm3dmfoGqUA13U1hF7iKGV/5R+yPZbDW4pagQAi3HXPEqan?=
 =?us-ascii?Q?2L/GZ7cMeo8eqnTrm+odG5AqyENuZYyH3tZaVZJtb0g96T0h6J53iDJTXZ5t?=
 =?us-ascii?Q?4YF0n7EZgaMFxvRD9TK23Ke7UWTYAi57gE93aXMT+DtSrJRn3XSHqL13mvzj?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6C66YNLZxFq7VbSxZBpFwkCBYbvaRWlRDf27AnTU3Lbi9CAOccU9uoLlPaPyGhv0jrd6yEIItpUg5yf2KWhbjPJw0fT+K+fsNqqFbHTbheS+2q1m6g8vU+RkvbZdBcq77Agxjuc14SrkmfQwPBXQJt39SBoVKB9eLH8Ry9gEK1rpsQjmOfGmE2yRafgr47XsM/+GBF4xWv2KElG44c4YRcMxdQJU0VpE03MCf35RwqSui0I6sSdAfGfvOVHKAkUJjWQTpRejbudBEm8qPF23dJeAM7i0NNz3hJFZ4E7NqPI88Ay6k6bzPOXQ2LLfImINJrsWtr0IDeGOkUfkCyofmxr4y5MhJrJdrCXLY+wkU1d/jgj2geYKMaYDV5+dSzVadSBhbRtyIEiMOB6oomwVSpEiyWnXPZ0eQ+Ksxdg6Dq2lJhVIRGJT6OeXCxWdJnHP7ouU69uxR5fezNq5p9KMAgWjrYfAFylj72ObsJ1ZUdPeBW6ucJDE0sSN6/sd+j/8M9ivx8NBdc/WmatJjRC4qKE3EDUwcxC6W99Yc+v2T/bt8ITSUeiZy/7MSo9EeD3P+43tv8zI42ho0W3yzUanKWrk4HXB5yXusOMCGQBcKKM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2280e0-b012-4f6e-e7ca-08dd97b37023
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 15:31:49.3698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jp4U0q/F2660HphPw9HEtUwJoKvjeLFsLIpvyNTN5LbBUFb2cfWYi/bADUd32/jg1q5wf3O5+PycZf7g0ST0vOd/1RRA6cwOSz8rSCNVTSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6655
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505200126
X-Authority-Analysis: v=2.4 cv=RbGQC0tv c=1 sm=1 tr=0 ts=682ca06b cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=y-gZJbI94Zq0sCLRHEQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: cqWSRnVfLFdJ4AxjknXEW2gu7oJbQGk7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEyNyBTYWx0ZWRfX0C7VQF4eW8z2 B9sOYrtKO4XIs3vUhLI4NKwQyNySCg0y/Y031O9GUdAcX+oX3LnoFj1oMpmfJJQvLLnzv54yuWw rQZA1ioAQ064DadWTAwqQAl2d6xYT2MPXCc/1wGxRvuhNPhmHA1E+xIPw4Q8t2rszb2Sq9kC2oc
 cYjfY6PRHNmbtgykUq9BmzDQvwmUd0KdLkNygYv1WmIs+98ylaJ13Mzb9TpFjABhyGOXSGNpkFc n8w0Wt0YeuNHn9I2sC/uw/XmqMXLprt6eRtqO8VaiOmra/N3Iock52FB+WAXz295FP9Dv3kWR0j vxr6JSC6hgT60486OLfbLHr/iGoNU8JSBtGdnNmYSkj/wPiU7VO9dNIrcFyBHunaJY4ZiJgDU4w
 xnPIwY2bfbsmFGOCrOlExpipxg5pKXboC/kiksf/n7YkwofiON5iI5HWNCcbr7uOLN4HSRB3
X-Proofpoint-GUID: cqWSRnVfLFdJ4AxjknXEW2gu7oJbQGk7

On Tue, May 20, 2025 at 03:57:35PM +0100, Usama Arif wrote:
>
>
> On 20/05/2025 15:43, Lorenzo Stoakes wrote:
> > This commit message is really poor. You're also not mentioning that you're
> > changing s390 behaviour?
> >
> > On Mon, May 19, 2025 at 11:29:53PM +0100, Usama Arif wrote:
> >> This is so that flag setting can be resused later in other functions,
> >
> > Typo.
> >
> >> to reduce code duplication (including the s390 exception).
> >>
> >> No functional change intended with this patch.
> >
> > I'm pretty sure somebody reviewed that this should just be merged with whatever
> > uses this? I'm not sure this is all that valuable as you're not really changing
> > this structurally very much.
> >
>
> Please see patch 2 where hugepage_set_vmflags is reused.
> I was just trying to follow your feedback from previous revision that the flag
> setting and s390 code part is duplicate code and should be common in the prctl
> and madvise function.

Sure, but I think it'd be better as part of that patch probably. Perhaps I
was thinking of another comment in reference to a 'no function change'
remark.

>
> I realize I messed up the arg not having vma and the order of the if statement.

I am getting the strong impression here that you're rushing :)

I strongly suggest slowing thing down here. We're in RC7, this is (or
should be) an RFC for us to explore concepts. There's no need for it.

I appreciate your input and enthusiasm, but clearly rushing is causing you
to make mistakes. I get it, we've all been there.

But right now we have what 5 maybe? THP series in-flight at the same time,
all touching similar stuff, and it'll make everybody's lives easier and
less chaotic if we take a little more time to assess.

We are ultimately going to choose what's best for the kernel, there's no
'race' as to which series is 'ready' first.

>
> >>
> >> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> >
> > Yeah I'm not a fan of this patch, it's buggy and really unclear what the
> > purpose is here.
>
> No functional change was intended (I realized the order below broke it but can be fixed).
>
> In the previous revision it was:
> +       case PR_SET_THP_POLICY:
> +               if (arg3 || arg4 || arg5)
> +                       return -EINVAL;
> +               if (mmap_write_lock_killable(me->mm))
> +                       return -EINTR;
> +               switch (arg2) {
> +               case PR_DEFAULT_MADV_HUGEPAGE:
> +                       if (!hugepage_global_enabled())
> +                               error = -EPERM;
> +#ifdef CONFIG_S390
> +                       /*
> +                       * qemu blindly sets MADV_HUGEPAGE on all allocations, but s390
> +                       * can't handle this properly after s390_enable_sie, so we simply
> +                       * ignore the madvise to prevent qemu from causing a SIGSEGV.
> +                       */
> +                       else if (mm_has_pgste(vma->vm_mm))
> +                               error = -EPERM;
> +#endif
> +                       else {
> +                               me->mm->def_flags &= ~VM_NOHUGEPAGE;
> +                               me->mm->def_flags |= VM_HUGEPAGE;
> +                               process_default_madv_hugepage(me->mm, MADV_HUGEPAGE);
> +                       }
> +                       break;
> ...
>
> Now with this hugepage_set_vmflags, it would be
>
> +       case PR_SET_THP_POLICY:
> +               if (arg3 || arg4 || arg5)
> +                       return -EINVAL;
> +               if (mmap_write_lock_killable(mm))
> +                       return -EINTR;
> +               switch (arg2) {
> +               case PR_DEFAULT_MADV_HUGEPAGE:
> +                       if (!hugepage_global_enabled())
> +                               error = -EPERM;
> +                       error = hugepage_set_vmflags(&mm->def_flags, MADV_HUGEPAGE);
> +                       if (!error)
> +                               process_default_madv_hugepage(mm, MADV_HUGEPAGE);
> +                       break;
>
>
> I am happy to go with either of the methods above, but was just trying to
> incorporate your feedback :)
>
> Would you like the method from previous version?

I'm going to go ahead and overlook what would be in the UK 100% a
deployment of the finest British sarcasm here, and assume not intended :)

Very obviously we do not want to duplicate architecture-specific code. I'm
a little concerned you're ok with both (imagine if one changed but not the
other for instance), but clearly this series is unmergeable without
de-duplicating this.

My objections here are that you submitted a totally broken patch with a
poor commit message that seems that it could well be merged with the
subsequent patch.

I also have concerns about your levels of testing here - you completely
broken MADV_NOHUGEPAGE but didn't notice? Are you running self-tests? Do we
have one that'd pick that up? If not, can we have one like that?

Thanks!

>
> >
> >> ---
> >>  include/linux/huge_mm.h |  1 +
> >>  mm/khugepaged.c         | 26 +++++++++++++++++---------
> >>  2 files changed, 18 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> >> index 2f190c90192d..23580a43787c 100644
> >> --- a/include/linux/huge_mm.h
> >> +++ b/include/linux/huge_mm.h
> >> @@ -431,6 +431,7 @@ change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >>  			__split_huge_pud(__vma, __pud, __address);	\
> >>  	}  while (0)
> >>
> >> +int hugepage_set_vmflags(unsigned long *vm_flags, int advice);
> >>  int hugepage_madvise(struct vm_area_struct *vma, unsigned long *vm_flags,
> >>  		     int advice);
> >>  int madvise_collapse(struct vm_area_struct *vma,
> >> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> >> index b04b6a770afe..ab3427c87422 100644
> >> --- a/mm/khugepaged.c
> >> +++ b/mm/khugepaged.c
> >> @@ -346,8 +346,7 @@ struct attribute_group khugepaged_attr_group = {
> >>  };
> >>  #endif /* CONFIG_SYSFS */
> >>
> >> -int hugepage_madvise(struct vm_area_struct *vma,
> >> -		     unsigned long *vm_flags, int advice)
> >> +int hugepage_set_vmflags(unsigned long *vm_flags, int advice)
> >
> >
> >>  {
> >>  	switch (advice) {
> >>  	case MADV_HUGEPAGE:
> >> @@ -358,16 +357,10 @@ int hugepage_madvise(struct vm_area_struct *vma,
> >>  		 * ignore the madvise to prevent qemu from causing a SIGSEGV.
> >>  		 */
> >>  		if (mm_has_pgste(vma->vm_mm))
> >
> > This is broken, you refer to vma which doesn't exist.
> >
> > As the kernel bots are telling you...
> >
> >> -			return 0;
> >> +			return -EPERM;
> >
> > Why are you now returning an error?
> >
> > This seems like a super broken way of making the caller return 0. Just make this
> > whole thing a bool return if you're going to treat it like a boolean function.
> >
> >>  #endif
> >>  		*vm_flags &= ~VM_NOHUGEPAGE;
> >>  		*vm_flags |= VM_HUGEPAGE;
> >> -		/*
> >> -		 * If the vma become good for khugepaged to scan,
> >> -		 * register it here without waiting a page fault that
> >> -		 * may not happen any time soon.
> >> -		 */
> >> -		khugepaged_enter_vma(vma, *vm_flags);
> >>  		break;
> >>  	case MADV_NOHUGEPAGE:
> >>  		*vm_flags &= ~VM_HUGEPAGE;
> >> @@ -383,6 +376,21 @@ int hugepage_madvise(struct vm_area_struct *vma,
> >>  	return 0;
> >>  }
> >>
> >> +int hugepage_madvise(struct vm_area_struct *vma,
> >> +		     unsigned long *vm_flags, int advice)
> >> +{
> >> +	if (advice == MADV_HUGEPAGE && !hugepage_set_vmflags(vm_flags, advice)) {
> >
> > So now you've completely broken MADV_NOHUGEPAGE haven't you?
> >
>
> Yeah order needs to be reversed.
>
> >> +		/*
> >> +		 * If the vma become good for khugepaged to scan,
> >> +		 * register it here without waiting a page fault that
> >> +		 * may not happen any time soon.
> >> +		 */
> >> +		khugepaged_enter_vma(vma, *vm_flags);
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  int __init khugepaged_init(void)
> >>  {
> >>  	mm_slot_cache = KMEM_CACHE(khugepaged_mm_slot, 0);
> >> --
> >> 2.47.1
> >>
>

Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226C51B0435
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282284; cv=fail; b=aig1E0N3FyRGkwD3ghIfsBoMHSR8MgYQc4TMfcHmZfjnjZQ2WgtEgAbBO3DEWeKbhvV4jgGIUmMpUD+47BVIdsHjTQjpMuaa4g2mhxJzelDN8DyYxiKOBrW06QhPPyRJEAi/EsdBkPQH2fYZBRrQWGowqN9wQU/UA42EoxVHDJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282284; c=relaxed/simple;
	bh=IY9UEr9y427VCF41bx06XrhoqKDnmT63XLpbPH/I4xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tslcxdKoSKfqxzHUUbBQHsl4KJPtINU/l+n96mkmXBG78ARwgequEpgw1NY+C+f13VBor+R7YDi4ZrZilDca8dTurwXxNxGIO5yQ2T2p3b73uYD9oaVwVOXnHlxjMnuFQpDIXm0Fbb08/J+xkBE26FU3z6lx2cxr5hMkKtQIqGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IOKTPlDB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fzHoDhcy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IOKTPlDB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fzHoDhcy"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U84bDr010142;
	Mon, 30 Jun 2025 11:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=SB51fBjY8XytRN0pg1
	+x/QZVqNNS2OhNkGOX/jP0puI=; b=IOKTPlDBxKdSyGJEU4OnpnmjCISFNYdQgi
	EMARtelUN4LlFbR4gd0PNONLCYBorf7zUmNy5PmZewJZOAIDQCqf1bs1E/FaUd01
	LxzG97un5xnny/UVygmN0FgpzzWet7cAcrqUMRBeZz1ouj8kcIL4gOotiTJ3V28T
	Lv+5fLZ/9nG/KXRBHiYLb+M1REAXoIjkiV6CsO7qvGURMGyKrFOywMfomEgSb0ty
	qbjc3SMvZ9S8xQpiRymsEse2pQK5qWvjUWrpk71nYJDHKIpQKPOnfVclIJ3XtmPt
	WuxHOgAT+C6s2O4iLtdoWmiCBsPZfeBDo0kK+D8O2bE2XKkpzP9A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8ef29et-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 11:17:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55U9ObNY018384;
	Mon, 30 Jun 2025 11:17:25 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ufet0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 11:17:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vl+NaLLyBWNRdD4tZXeZ6p43ZTdz1UU94VeH/ekacpXoM4xZpV7H6Kd1SbhU1SvoSc8ye3zl4aWTiJJzkW3Be742vcTMGIIasvfmM2pKgUg3mjUGtmsvFwDjoLT/E8OoChNuGwzMWpZsx3cUYAiRKr7cmMBuvL718ds25eb6BqBgOr3h/jw/OBOtIK+W+mhbk4JVI6JVJpnI7i8MBgz3UfbeijKT9WX90OmxDtz9AQIOufnB2nSU+gdg0++I3D8zUNFhfn+Ru4S1jGBOHy64+2gmRvs8ezK8q8cB8+cW8m0f8MbbuMnCUu+caEGM7YNMbNZg2bySBVCjXB95mxcLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SB51fBjY8XytRN0pg1+x/QZVqNNS2OhNkGOX/jP0puI=;
 b=ntUUyKXLwi9zTtvXqVZyoJz+20wkSHFAOJkHOD4U9x0xim7luV4UFh1HFhkY7RXwIhSDEYSbsIpAelwQOMtZdwjK5hE0aPvM8eZP1R1pctmD3Ywsj+4PfPageOiVs00i4j33oWpm3+IIow15kmIlOyz1EslSeIIhzjDQn6KLwxnV949Z1RcsmwD0xOL5drxivvtVjhpGEjAl1FVHsZvO8+qc4mjSDpuvmfExj2hOVOEwEODMENhQQiYmhm6/gddv06/qEY/3G55hZIZpL5PkWq0sJegOn41w91HKoxCWd4ReZkhDVhiQ/pxhrN7EgDDb0xAvJkAz/ufMrTBKqZ/cTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SB51fBjY8XytRN0pg1+x/QZVqNNS2OhNkGOX/jP0puI=;
 b=fzHoDhcyohlWv/ENfTfgrsxh3feja1LFy50UOrLydfD8X6LT1zZcBUWtHy9Gik7o4n2tyCVzTd2XcIGZZTnyQWVzFoNdeHQI6U5hGgkGArjEZeDGNhj1LNhRlGiDCtA7RfBfecHW6gFXdNy4QYkL8QkVpDF+tNcyG8Fu3V9MZH0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN0PR10MB6007.namprd10.prod.outlook.com (2603:10b6:208:3c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 11:17:22 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:17:22 +0000
Date: Mon, 30 Jun 2025 12:17:19 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, hughd@google.com,
        yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 0/4] Optimize mprotect() for large folios
Message-ID: <11939364-5488-4067-885b-aabd76fee46e@lucifer.local>
References: <20250628113435.46678-1-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628113435.46678-1-dev.jain@arm.com>
X-ClientProxiedBy: LO2P265CA0497.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN0PR10MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a13eaa-c9c6-457d-70bf-08ddb7c7af2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UND5Vy732LSSLGtmRQ2w5YLPVUsRdXecHFwNqORakxqChtatD7qSl7sflR5b?=
 =?us-ascii?Q?stW+A7yjYwWV98Tl6US90mGkuMDZ9gnOG5suLqpKYUOIUkdT3QrpjvGM+2HK?=
 =?us-ascii?Q?3EJ5Uk7sfcAJQs2Zl6VRmDuDw8fmenLpfvFjtord+L+wWbemMtKKcVMXk4vu?=
 =?us-ascii?Q?M2JXot5JVDv7M3IR+cpyAkBujlRj51S+hpqVHaYLN8/Noa6Ez1Mm4QKTGL8o?=
 =?us-ascii?Q?LkncXhzdltZUZowa7KIcBvasLV9TquZ1YAkxf2KsHqBSzVCLLr8KBZlXO484?=
 =?us-ascii?Q?uYDtmMQuu5+xWW2P6z4QAjG4xV3dRMJVRbPCUJcZBbqNMqs3EsMayjfz0B6Y?=
 =?us-ascii?Q?eOYD4EjtRB5zcClVqOc/y+FHZV3PZj4gp8Bqk8g1gMr7L3dE3lZdC9An/w8N?=
 =?us-ascii?Q?jC6Pm68Z7EUsbM+98SVgiTv33DRR3m+B76YtZEy53BfN2JojU6ZZjae0FGP5?=
 =?us-ascii?Q?ra7IAiQMLacuVeqNM++xRQhrvq9pbsDwSLPw0xXRIo7NU9NOaUUQStP/SJTE?=
 =?us-ascii?Q?O1/O4o1HFSTMQQ9duco9S+/xp647YXQbKXigalR5UyLpx8m0rluzwtw+TtdW?=
 =?us-ascii?Q?1759ZDZsFSC0QkT1rs2Da4Qy4DezE5L7xv2nlg+bQbS/MEptKM+57dKN7YnS?=
 =?us-ascii?Q?AHPu2DOt3W691uZJzJ1O6jIQUb0npmLPHi1e7MjLTJPjre+KSAnUnED/AJiH?=
 =?us-ascii?Q?7B7aiJctav+zuYRxQJcaZcCup2cUXpTCjmvAkmNPpIvyk+uz8fn8DTv8joYA?=
 =?us-ascii?Q?VTwWEv+bV2V8kiDGiKrf4uOgIN/DWKKnwFq0s3+qwBI5kIHOqiRBMYqf2qcx?=
 =?us-ascii?Q?Utf8lqjvL154aLsMgakW4mddyr2hRXZZJbPOs3ojK3pcRLdjYwc6um9Xepzv?=
 =?us-ascii?Q?kbhsPP3Vh8BtMC6mII+YB34ljVcwgKRvrcaidq54bhpOQJEQVnIrE7slDI/b?=
 =?us-ascii?Q?FbnDY+3S+fLAKRSDzlUC97bJ65rRrcuulBQh2DvvE1d7ZwSTDF268F1W6zpR?=
 =?us-ascii?Q?Vme91d7DPnpwZG3sRqom35gnExUgYDMaxkHaJyJraUSkZiUuA8VCqRidgiUi?=
 =?us-ascii?Q?fmU1UOmKJup1+BTwF1sKYYmMMWrcQ7HEI+OyXPf6wIcyGKsVVXj34jXr0/w2?=
 =?us-ascii?Q?OOHq8PTld75lsGpwvAzsK7Agz21izFbfR8TiocSYEJ5Nmc95KgZgrSd9kxfD?=
 =?us-ascii?Q?/Q0J4jzAbw6JTfWG7TpnX1VqUNNal75/0mh9W21KmZRiqphuVVNMQoiFpSqC?=
 =?us-ascii?Q?Gj2jsa0kAG+tJXZYgIadpvRQ5P400eO39UyE5BxnMPxSxSrXPFLoaBJZzkG7?=
 =?us-ascii?Q?yNq9EGrFrN7n28nN1lOoqTRxt1xcN2H/+6XbnitxQ8eqvVvuo35NHW5QNXsh?=
 =?us-ascii?Q?OgwPcs8JK0BfBFrND4V6IVLB4w5W2T1T49SQ0unourSqm9uxuQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y156pGEWKHU1muUdvtXpRxEh7NHjoJOyqAYB11DKq0fuXITGBRm5fS8672hM?=
 =?us-ascii?Q?2g24hKiE64Lr5+i+Xf+N7KBfFiwSQPe2LGz0tr9kbml1hpdD8y5uU1OoI2nS?=
 =?us-ascii?Q?J7/2PhhvqY8DwgdqtuQSlPQU5wl30ETgtDpjdfynnpRiH76PmAfY5Fv2R/RI?=
 =?us-ascii?Q?SQn2THELZbOUU9GZ/8O10J6pu7Rtps7v4GCjaBeTq5P6sU3zQ2i9flxemejO?=
 =?us-ascii?Q?xUCbrImglqcTUcvYTpUdIGijrDJcXRc5zCb0vnUt8OLSMDTwMBdZe2IT+LRd?=
 =?us-ascii?Q?yu9sRs+P2BYCXE+JXDbgbbWibbLA7QSUVUUhOOAM62IKSdYIUiKX/4GcFB9g?=
 =?us-ascii?Q?WXFpgPq2jRvGX0jv0cR8Wl4+CIX/JoMx+LUQ5TxzyxKEta/NUGRZCDwodCBn?=
 =?us-ascii?Q?sHq74hHirNcG6L9182Q63p+PP+eo9K3kq70S/A+nScFNSIFFoLPcID86vhPJ?=
 =?us-ascii?Q?ACJf8Qnw76TUXcJYPwmEUn8M/qCzMDO5d/u3jtaCDfKBIUUGken6T4nUCobQ?=
 =?us-ascii?Q?cq5YyPmRahmU1jtZaJP60xXTle1bsK9/nNwiKOkgLE9++aAUOF+MKwD4VrYq?=
 =?us-ascii?Q?qPkI6O+KG0Xe8hF9wQ1KeRkCOGGGt756Yu8KUHwncQAGnGXJ9+tq8fPjy9Eh?=
 =?us-ascii?Q?SGBPrd60CBmBPwgjBgtX+67P6IGroPpMruqF+X9hSSF+yq1LBFfq+iGsMYtV?=
 =?us-ascii?Q?vGOS/G6kxi1hLRpLZW1f4RkK7mAjgJISWFn2pnf6Y3tNVPU+GRy3odZbriTu?=
 =?us-ascii?Q?V/CFj0c4GMWAR/kSYMbXAPKs7fnJaKm2CDkMt2vSylkpcBhPG8+mP1zMmyxD?=
 =?us-ascii?Q?M4XNq2BmX0nnK3bG4Qq4gLxv1ef6qHjDtSGiHkh8LoiKCYoEazGCtbe1n+P6?=
 =?us-ascii?Q?H+W6A1LhfX2lL0Yql8+vf1j/Qgxz7RaBjbHKdjUl1qvj4/hcDlImVfASkFnP?=
 =?us-ascii?Q?9brwBlgdLMnURcA9vvz6VNXhx0bPKiN7tCVITH9X98X+fWDvHPalAgpOGkOh?=
 =?us-ascii?Q?CAqlVzvKjabkeUhZuXfKhpWl/mLTdzoN5F7+0pFbtsA9KBv8PCljpSKlMLCU?=
 =?us-ascii?Q?zh2YG2m7o+7r4l4M9Tk5AfUuPT3vPVbd1Z5EVyf7wx/GZ9Q44/gHTmYrfe7Y?=
 =?us-ascii?Q?6HW/ctZH9I6XDysOT6lvbmKgyZNme6znXtrAkqpebM9NXwsTxQpgjm6fW7vs?=
 =?us-ascii?Q?jz85PBm9fvTMUwpg3/xdQl0lP43CVetPGQ+VmscLxFIAAqbveuKwL39wXI5t?=
 =?us-ascii?Q?DGUC9atknYb8c+WftO4VTS7fkdT8+VKwesrMGfQEoMaI+GnssTIwiaJZcHiL?=
 =?us-ascii?Q?EgtHq1b4X2JtF9nXxBvFf+BJltSwuoFt+1YfV5Phwxg79yIL2jkHaEgiNxHf?=
 =?us-ascii?Q?nNc+aWMXaDHyYkLsuVXdOTYv9K50UlMbNIOpV5jh1yAPSz5v5UESdyb6BpCg?=
 =?us-ascii?Q?Av4ZTDv/UNheISDeCadIeX8Gdt5aivdeIjklLCJIAs0vvSCVbqREScRwERGc?=
 =?us-ascii?Q?Rlca+UXxdqdW+NUBkJYidS325HO8XRlJbJgs0RmRvUYbcXMNIspMEwMo/7qi?=
 =?us-ascii?Q?2ZCcB7kKURHNRMxVSQUfLph4RsuvCpZ74/dfZnTnFizSw0ouikQNHRTTWlAw?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E3B5zGYxR1RN0rSvq9XoFDVuFWJteJm0GwuTt40B2jq9pRtppxkBIla7x5NG9gLm7JRCH3BeQysrEAnlSkIHcSVDLMm6uXI/JQWRZD+zI1aQvIiXI5xFxfjvPrlOt+jnor9fYZEUdFzcdTrnEqiTK/kGBsKQMOZNGeKiwzxZpnqK95cEdzcb94G5tHCBjpscUMXi2ADukcr0pxWCsghwm5b15kSqzUDesfDbQXPVh21n4B0EYCLv6sbHg0KfzzZEUjvwhYaeUkcLBIeInCD2yGs1E0R+dtDsb0yFf7lbtHw5BNDDS3te4URkelKGQNg2nsO762KxEaMaJ/wMp3g/CYe9X8jc8eoQGvLQwRy7YwK78LSkiSdX0ZLbeK0lgaN5PLcgOi1Cr3nO0QKWo8EYrz+R4qwUk8LAAOjAPnagojlBzKaHzRBmox6xSjvnvn2ITzZuBmIextLjjaMqOf26feVLcOVOpWkjfmAlnw3KYjNGmZRu7RzUqPC5Fe5M87YALH0SI+EMICspbRMEtfEYLvj77/i8rvKdB/PSlB5GxBfQ3vLImIj9pEnNW4R6HYWx82W0fd3MjBICpDxRRI/7lVzMwUcgm4mJuM6k/TwP0Mk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a13eaa-c9c6-457d-70bf-08ddb7c7af2e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:17:22.2793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBZoOjagfQIZEssQIYiDA/KvpuzMz7Vlvpi0gB+ayZEKv+HA8C3sHMDNZ338DCCJ/SnEMQPTxu6bY9aibJC6fHnMwq5L5e6jC4ghFUtGwxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB6007
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=873 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506300091
X-Proofpoint-GUID: IU29of9ZfD2isNX03pQunxSCFI0FJwrI
X-Proofpoint-ORIG-GUID: IU29of9ZfD2isNX03pQunxSCFI0FJwrI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA5MSBTYWx0ZWRfX42JoP1SaCZsY sKFZbTS4vv67/MUJiKhRQtxgBXxkMlpUH3lGEMAnlCyHQYoUgPA6EdPCuHgVNbJYdFjo59z8J5s TnZv+SKRfAXrcHaOYd0VwfuhLQ6SkOLmH8hZ3WIvqKCJRNHRxXd5jJTGURtH9mX9n1WaModeiV1
 W42CDdkSIzbZUdHy2lYBuA0ii77WVAL4nz2UWQN7RSeLhOvi7Lm5HkSTzEg6soU1+bCnmTE6zUi Zyh4DuwhDFcxBp18GfeYGBwEdcAlJ6PQyrRiWn09j6FkvdFy07KCm9nZDd3yxF094OU5GKp3t7a x1qrPp6p3tUYs66w/sW1xXejO/x+YT+dI4ybA1h5zLdMIfzZTQVjfmu9YGr0peO/jIqdloZyA6v
 3FN8nqqmrzE52/Gdf2FPzF8JTK4LKTZi6Eub7Nfv/+f22l1YIVV5OZ+BV7UyTN11In+dA6uV
X-Authority-Analysis: v=2.4 cv=ONgn3TaB c=1 sm=1 tr=0 ts=68627246 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=uhpS8OHo4wEkulBruhQA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13215

On Sat, Jun 28, 2025 at 05:04:31PM +0530, Dev Jain wrote:
> This patchset optimizes the mprotect() system call for large folios
> by PTE-batching. No issues were observed with mm-selftests, build
> tested on x86_64.

Should also be tested on x86-64 not only build tested :)

You are still not really giving details here, so same comment as your mremap()
series, please explain why you're doing this, what for, what benefits you expect
to achieve, where etc.

E.g. 'this is deisgned to optimise mTHP cases on arm64, we expect to see
benefits on amd64 also and for intel there should be no impact'.

It's probably also worth actually going and checking to make sure that this is
the case re: other arches. See below on that...

>
> We use the following test cases to measure performance, mprotect()'ing
> the mapped memory to read-only then read-write 40 times:
>
> Test case 1: Mapping 1G of memory, touching it to get PMD-THPs, then
> pte-mapping those THPs
> Test case 2: Mapping 1G of memory with 64K mTHPs
> Test case 3: Mapping 1G of memory with 4K pages
>
> Average execution time on arm64, Apple M3:
> Before the patchset:
> T1: 7.9 seconds   T2: 7.9 seconds   T3: 4.2 seconds
>
> After the patchset:
> T1: 2.1 seconds   T2: 2.2 seconds   T3: 4.3 seconds
>
> Observing T1/T2 and T3 before the patchset, we also remove the regression
> introduced by ptep_get() on a contpte block. And, for large folios we get
> an almost 74% performance improvement, albeit the trade-off being a slight
> degradation in the small folio case.

This is nice, though order-0 is probably going to be your bread and butter no?

Having said that, mprotect() is not a hot path, this delta is small enough to
quite possibly just be noise, and personally I'm not all that bothered.

But let's run this same test on x86-64 too please and get some before/after
numbers just to confirm no major impact.

Thanks for including code.

>
> Here is the test program:
>
>  #define _GNU_SOURCE
>  #include <sys/mman.h>
>  #include <stdlib.h>
>  #include <string.h>
>  #include <stdio.h>
>  #include <unistd.h>
>
>  #define SIZE (1024*1024*1024)
>
> unsigned long pmdsize = (1UL << 21);
> unsigned long pagesize = (1UL << 12);
>
> static void pte_map_thps(char *mem, size_t size)
> {
> 	size_t offs;
> 	int ret = 0;
>
>
> 	/* PTE-map each THP by temporarily splitting the VMAs. */
> 	for (offs = 0; offs < size; offs += pmdsize) {
> 		ret |= madvise(mem + offs, pagesize, MADV_DONTFORK);
> 		ret |= madvise(mem + offs, pagesize, MADV_DOFORK);
> 	}
>
> 	if (ret) {
> 		fprintf(stderr, "ERROR: mprotect() failed\n");
> 		exit(1);
> 	}
> }
>
> int main(int argc, char *argv[])
> {
> 	char *p;
>         int ret = 0;
> 	p = mmap((1UL << 30), SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> 	if (p != (1UL << 30)) {
> 		perror("mmap");
> 		return 1;
> 	}
>
>
>
> 	memset(p, 0, SIZE);
> 	if (madvise(p, SIZE, MADV_NOHUGEPAGE))
> 		perror("madvise");
> 	explicit_bzero(p, SIZE);
> 	pte_map_thps(p, SIZE);
>
> 	for (int loops = 0; loops < 40; loops++) {
> 		if (mprotect(p, SIZE, PROT_READ))
> 			perror("mprotect"), exit(1);
> 		if (mprotect(p, SIZE, PROT_READ|PROT_WRITE))
> 			perror("mprotect"), exit(1);
> 		explicit_bzero(p, SIZE);
> 	}
> }
>
> ---
> The patchset is rebased onto Saturday's mm-new.
>
> v3->v4:
>  - Refactor skipping logic into a new function, edit patch 1 subject
>    to highlight it is only for MM_CP_PROT_NUMA case (David H)
>  - Refactor the optimization logic, add more documentation to the generic
>    batched functions, do not add clear_flush_ptes, squash patch 4
>    and 5 (Ryan)
>
> v2->v3:
>  - Add comments for the new APIs (Ryan, Lorenzo)
>  - Instead of refactoring, use a "skip_batch" label
>  - Move arm64 patches at the end (Ryan)
>  - In can_change_pte_writable(), check AnonExclusive page-by-page (David H)
>  - Resolve implicit declaration; tested build on x86 (Lance Yang)
>
> v1->v2:
>  - Rebase onto mm-unstable (6ebffe676fcf: util_macros.h: make the header more resilient)
>  - Abridge the anon-exclusive condition (Lance Yang)
>
> Dev Jain (4):
>   mm: Optimize mprotect() for MM_CP_PROT_NUMA by batch-skipping PTEs
>   mm: Add batched versions of ptep_modify_prot_start/commit
>   mm: Optimize mprotect() by PTE-batching
>   arm64: Add batched versions of ptep_modify_prot_start/commit
>
>  arch/arm64/include/asm/pgtable.h |  10 ++
>  arch/arm64/mm/mmu.c              |  28 +++-
>  include/linux/pgtable.h          |  83 +++++++++-
>  mm/mprotect.c                    | 269 +++++++++++++++++++++++--------
>  4 files changed, 315 insertions(+), 75 deletions(-)
>
> --
> 2.30.2
>

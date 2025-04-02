Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31FA2E3376
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598996; cv=fail; b=S7iD1ANJ/oexY6DuplTs/IeWKXFrvHrZTy6p/bmkN3FWnUJiONfoVydLbw8Af6zRgkTJhf8IaqraBbvQDR2NMYCu/ZEj452xfC26xn0AdVFv6M7tKiGt1coo/4XagzQ11dh7v4Gth6BZ2f1IVmWa/r74lnJNjEpnwm2ylS13lU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598996; c=relaxed/simple;
	bh=OuJG+8PL1lLvfG8dMkpEGW2mDxGmgdLvS+vfWpqoNeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ByLFM7MFqfMrmDfQsz8eLb/xuWmjqH4r+PwJwDZoFcj+/NhVA9NLxwEwFkQJzApasUUjY6DD0aC5mBJfHIZ9lo/DdqqawmN6J2Kbi1da9CR4IlMvcOusSnyocqHjXO2OyvfHwec3iZgeNcdAmAFg9+lCFo0FLvPpPvPIpai4HqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Tdp5Z9ko; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eLYCOr8K; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Tdp5Z9ko";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eLYCOr8K"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5326g2kJ012649;
	Wed, 2 Apr 2025 13:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=MuNrARy1zvcs/rF41O
	jXO39ZvufrJiwWJtgWDVf5Msk=; b=Tdp5Z9koLvIH7Vot1ClzjCWwh71b9Sq79E
	fj3j5MSxau9CpCWF7xkzQGqyXZFr/E/9ivuXA/VR++GovusmQUZjwC7r+6KV5sQQ
	DuOJaI6laR2A5S4grH+sv2jS0AAiRaXfFDv5Ol2Z+Xs3G18dStBgoR08OyVM49KN
	d6/YYIfWyAXCiOi2QkGU2BuynLpVxTpTtuMR4ipja5E0LEh4W1SvFzmvUOC9Hi33
	8wVevS2JjRnvQl5uDwiMDSEBmSRmXjVvDAxgb5Pt8HaD0vuHXUhILMvbQ6Gn/tKs
	UBnHJzS8GBb5CrWQXVDLYkU2t+ZC7KRss60yHVzmHL1yIfR7bHGA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7satc6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 13:03:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 532B7h7c010957;
	Wed, 2 Apr 2025 13:03:00 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7agvmwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 13:03:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMNy5eGBpM2gzdxwaU2pHn0Idc5RNaqkEtNNDpxjclVfKBG8E6HDs/7XRfMTAgHrgWmlFHnFyKsSu+urx6dx+8MPaq2yLz8Dhy+94qJAw+QkS9dRi9qx+fFpGASovDHNuiyOqEj3GX4Ko4q8IrTWgGHGeKpHwYco62JAjriRrgOgyYj3r5QTerpzpXm6xVQSuZPT/5VwsH6pVcuQvwFipGE4LReZxGuuRLc9zxFJs37EwCgdHr8yonHf3aE2eJMpNZT21rrhPYbnTZBxnO9C/FEa+rkJNyF5X+obDNVfq+AuP5yzB4r4o2yHxgf7W6ZgX9JlsVE1rXVii1SaxNZl0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuNrARy1zvcs/rF41OjXO39ZvufrJiwWJtgWDVf5Msk=;
 b=kwacRLUzwm6S6taUC6FpzqXRwl6bSDfxXNgDYgqVEnvJZIDcbHqDd658ONKrU/Q9prYEWP5ugWM1VSvCfACRLWtQ7jFzy/lv605UdAZJMPCe3H2a5wN6G3a7tfortRyEixVM6mVYgQDEmV7UJ4/k2RV3hJEzqknhYLjLhJ3Y/CCsu6KMwmzGP7Ak0L/tQZqcw3soubHFKcmkWhz6+hq1JZpdGI7lmWQTA4AbPkGw4A3ALf4H/Cc2+9fXKpqjuW9/kMh4KpRR0B9BkeH1wexInXb3GAFTFwANAftlnm8SeVsNTloyokM6eGYW1+eFpjZwxXQt/puYT5YNYq2Jupw9Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuNrARy1zvcs/rF41OjXO39ZvufrJiwWJtgWDVf5Msk=;
 b=eLYCOr8KjRkRz+wlqlj4Truqhle+t/3IoPEAXPexHniWgptcu6PZBPgusx8Iyl5feOcixEeE1KllXDpam/7tZt3TLYc2vi9pHQFkO0/PZ7QO6h4IBp/iA028aCODyQ0TrXDz2zOLnfp80zQxEC3YvKd2Tc6v9K6yJk3d+qDtkYw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH4PR10MB8123.namprd10.prod.outlook.com (2603:10b6:610:23f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 13:02:57 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 13:02:57 +0000
Date: Wed, 2 Apr 2025 14:02:54 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+e3385f43b2897a19be24@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, jannh@google.com, liam.howlett@oracle.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] general protection fault in sys_mremap
Message-ID: <bee2d5f5-db93-42f1-829e-3fd250649ca8@lucifer.local>
References: <56fcb1ba-b9c1-4ec5-b1c5-dc90e3d81552@lucifer.local>
 <67ed32b6.050a0220.297a31.001a.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67ed32b6.050a0220.297a31.001a.GAE@google.com>
X-ClientProxiedBy: LO3P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH4PR10MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e0d66a-a318-4b76-3dcb-08dd71e6b072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bKADP5W2u0crV0AD1/KXZC+NwKsocWS5m48DcoFxhDMUhwe+4cdkSvlkClem?=
 =?us-ascii?Q?BaVLj6MWmFUJa0GT9ByonzYxFWCXGV/cpZnBUzTrpqxDnWrTm3aYFJxjeShs?=
 =?us-ascii?Q?Ey18VN92HXu0O75UbsjIscfpL1ZpS6XNde9S1D+hLvJDa8rDkzZ+HOCwT6M8?=
 =?us-ascii?Q?SitbWKV1RS62wCgsIl4Rys5ZA07gFgVwDKCm3GUt+OQquicaFp4wHPbNnJGk?=
 =?us-ascii?Q?lw9iu9lu+7VHdwR43paoqcZ75lJ9Yct3QpKwgHbD9Y1HtaPR4vptQaa31N7b?=
 =?us-ascii?Q?aCR/FLk8hKXtMXWBxmqkzXxHrv5NWA0TaCR3TYxM71kUQ3DzaSelJQnFR0QO?=
 =?us-ascii?Q?VemRpHlo8XUw1UUsIsDdp4RbicgRpIv+zt5lQ8Nl0s4TpyZjUDujsE/xVjYf?=
 =?us-ascii?Q?9u7t8+pl66I6B+wi4GSo/Kj6431qTOT/EQRE7geh2Iwm8AY8CthXwy8vBjDr?=
 =?us-ascii?Q?QF6R+zH8t8SY+jPVxwKIpOppRPNeQeSYoKHztS9/YBaQrViq6UipI+I8nTZy?=
 =?us-ascii?Q?bJPPR4iRGhTIKJ4hlUWByoRfyS7Vz2NHWu8CkEzt0jjpG8qzRMw9RKvWDi+/?=
 =?us-ascii?Q?bWFGjks/ur1uyJbSorzYORf6Brtd9kspKMhgXCK3j4xHpinU6XrqxpFHqZ3E?=
 =?us-ascii?Q?CRCJoJxnJlRJIuZz8wfl2xqgC6PW6EXIFfvUaFhhBjRlTHTVZAmP/qpO5yVS?=
 =?us-ascii?Q?2MnZ7RuKEHZFcLKoCSEGJTuU7alT4OplEgD/II3pXpknf9vJzmEK5Bkv6Uko?=
 =?us-ascii?Q?uU96vkneU0VAx88t5BZ0sVn9+sUOe5hWQsyic1ClyFk7NZSTVPOXpdg+8DgP?=
 =?us-ascii?Q?C+TrgmyMkeHB7yHi5KRjGeA8q33O33ts9XNGCsLCijrKGCA2wLG/aTE7sgn8?=
 =?us-ascii?Q?3+Qg9laWdWeRh/+Asled/1PmGBz2PauBO9DAvbSDhtxYjIopdNZsIPdzKK5H?=
 =?us-ascii?Q?8DRyJBPtcdsoe/hQb2LU11A5DmBXIL/dd0EMqbtaURgh89Tj2U5aw+GsHBL2?=
 =?us-ascii?Q?WmNRqj3p6/D5GNe0Uuddc6xNlTd2eSx6DzZ/Ks9wA+UMBA2WpET8NQj4hOix?=
 =?us-ascii?Q?jBeP5EtYecKQUvxWbaLXD4Wd1ngRysbXEBq/YtOFpV/phasLcu8VDgwTtpIx?=
 =?us-ascii?Q?3CuV0qoZ7wXpwvQRqYXMlkXxiGosF2zXNzM235bR6vdunhD33MMTZLZ5Lm8C?=
 =?us-ascii?Q?zM+4+QZXCdGoz4Cjj/kc03T/sgzhVwS2zaupPbXObzut58y4GpQB5VV52Cds?=
 =?us-ascii?Q?xkk7slB2FFyMKAAtGqzz/m3AukycQqOyovG6k223iyYPLLyYXmbk+/yeHqBV?=
 =?us-ascii?Q?4T33IrNLbTLqo2dQTBHcLkw+C5MbpuKNTRauB7u46J56qg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JMpO+z82Hx3Ty2mN86g5eeM9KTtvmmLXl+pLVIlWvwNbMhCqGrIxz+1VO/9P?=
 =?us-ascii?Q?YLcde+2MIe3Yzyym4LxLt9oybPKq6Ho0nNRrfBQ5Ll+6b46c7xnojjnKoE0T?=
 =?us-ascii?Q?ANIQM2Ozhf4N3aFQx/tSSt0oSRcGGB+C8mbQiVk/H2g/BpWjFdLZV5duhUij?=
 =?us-ascii?Q?ItFQ16p3oePh+WBXWNk0Tvo7DPC5N3ZirgyuzlJIuGseEnXxBWw0eTnRWsr5?=
 =?us-ascii?Q?x4oWJlcydcXjd9hHhrt/90ppIpAe9EN0j7M+5aLo3uX7aKIa+j4gYEyJIOL1?=
 =?us-ascii?Q?N/GvyQF3lJITB2IQuM+yKdjxm+XnR9ekrNzwo1rejBlWZiQA0Rjmqq+h3V2e?=
 =?us-ascii?Q?1qQgzUf8RmiT1cZQQOWCKtQ8iFkT2BYkkXaYTv8bxExU/8BrGd3FzXSzEaI3?=
 =?us-ascii?Q?HDBy0nh4nsB0tsEJIcmExTDUVy9IQ7hoVaDeb0+UAn8xkxRh4bL3fcLqJiPP?=
 =?us-ascii?Q?5nF4kRPxqR2HOU6venMb91LSw4tMWLiM9ekEzFRvyi6PRICN0v8xXz+j85Kf?=
 =?us-ascii?Q?RWK/WFcjoCHpYWHHx1zZKROWeOVUB9rE2YiNvW//MuigycP94smg/ZJma8gd?=
 =?us-ascii?Q?IiIx211uxUJmgamW0Yl1XHx5Xv54zzpTi7QTg8W2A67jyM5OUKv/uBP8iD+m?=
 =?us-ascii?Q?IbdmXT/HB5EuYD1i1n7Bd+85Qer6KcdqtpJXLaLHrctTVY/x/vz2nmLyYF7o?=
 =?us-ascii?Q?USIjHdTLkxQmSac6OOJDJUMSIgQ9U89ySxNcG6ge2iT60u40FiOQSrqLtq2T?=
 =?us-ascii?Q?SMWmNhoEncXZdM81lmcc8mNazXEdX2K+4apxF0khgbmHOvE1uwElSczICAJo?=
 =?us-ascii?Q?BlJs9Xd89VabLtBxWk84qiRhboAgzjk7CvrBlLTXuFol6ft3YLOFdzuE5rg2?=
 =?us-ascii?Q?Dc6L1EHDnLJQcHl6MjboDfquuJSKLgGaLU7LWBn8gIf4Cgc32VEowzs2F77V?=
 =?us-ascii?Q?p7oHQY0KEyyAvqewyxhCKEuk7rzKGRrb70SYkwJDC3QjRoD8xWQTZ4qfoWf2?=
 =?us-ascii?Q?jQLknhHKgLPmNzfbFurbc+g5e6+J4RRxc/x1uaZIYGXGituMliTuuZQW9Qkq?=
 =?us-ascii?Q?ZsrGSgMZD37zwmG/f5O9lnvAS9E2fZcaicTK/mXY77A2I26kxzcQNi50RXPd?=
 =?us-ascii?Q?0mngrKqFQXtkY2OvLeJd7jtwaxDJlhorfDaA0xo5MD4JDYsiE4N431lArgAz?=
 =?us-ascii?Q?eMcB0lvGg+aR0O95lc7qqFteYwvEgIZ/46mDByRRAGLqPSBMiwKigFPtBQWp?=
 =?us-ascii?Q?yP8OcOZS6vLauHJxROAYXdEZGGYqNGOChUya8D9mLYcHn4xTX/USHhS3XYyd?=
 =?us-ascii?Q?c0EmJIkvwBWVd7kLwDbLad5RtXfxrDafRiVoT7wJU7VxVkuuip05duZJo2Su?=
 =?us-ascii?Q?lBjzJX16fzCVqj/eV9xj7eg+KCh8ijkh7oMESifb5tGEkTBbgx4fzHzC2tMC?=
 =?us-ascii?Q?9YxXyjoUN1fFo2WeFa1yKWQDjRiO10xhmOz/hR2V5whmTcShcToY6q9f3Em3?=
 =?us-ascii?Q?RN8Lk4BDalLrHnhUu99lBsgYXFwp2/LgFmssJe9EWb+t2pfmnqEhWreBwstV?=
 =?us-ascii?Q?NBf7GHySL+hC5wTS7G2kpO7ohhRhrlrHyiFrIxHxdf5dsp3pmUMlmjtOz6zA?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SER109gniPCZs0RJN2ZvwPCDqh3ScHT7/ULl2qbLJZbxqDvziqBbyCymxVjBucTWZZYhiuaA6f3ckSBiEuV8Hmp79ElKRDxu5Z0rOL34l8dRMlsR/2Vb7KJMDmxgyef71RmbE38xtA4WxHRuZMHcKV5gm7qjZYDVpufEZvnU/OWaIDHx10/JWaHIUmxB9Qn6TbagVF0HwzrKehoGbrfyc4RD8J3UMREK6kF+1WM04WkhryRlmwH+zOEtXg/lbnSahVQ/tlPrSVWMkc9gMKDrli5LtsW9dAB4+FEiWOlM4BboMjrUMF+olnE4sbskClB8+BMZYIjKRxfrOA/BZW3vkJOQIBbONAtvuK0AcCAReQM2lGSTSYALJnHFct3IqV3a57OwcxHIqayNebk4MGUKM6apo2IJt4u3/o7Y4Um3nAuca3+lrDfFwrv7T/eeYURl9lDC9xa3T9Fn4I6LNvduu+t/5KdNk3AhgrzT5jcLNUyaBe0tt8SC50R4yYuPy8xxrjdK8yXVxFWqgtBpn6OTTLsHv+8roLYBwQA6Mszecils1bmRub9ptDPsampWdES7N/t/+ghCvTfsIifABno7yi/WsAUijA5ob2nhjGbYN5k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e0d66a-a318-4b76-3dcb-08dd71e6b072
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 13:02:57.3944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+76ej4H6oSMIj7cKmMqbuRI5yWDAk1T12pAm6JpjXwVdIfaAVwKOqStKc58cOdXoPMXhwqMlbCBRyF3jA1mJ43p7lrorBTXmRtTdYCIf3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8123
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504020082
X-Proofpoint-GUID: g0icp8xVo9e4wqgUGnuVqdXl35lFmrPN
X-Proofpoint-ORIG-GUID: g0icp8xVo9e4wqgUGnuVqdXl35lFmrPN

On Wed, Apr 02, 2025 at 05:51:02AM -0700, syzbot wrote:
> Hello,
>
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> unregister_netdevice: waiting for DEV to become free
>
> unregister_netdevice: waiting for batadv0 to become free. Usage count = 3

OK so this looks like a broken test box.

For belts and suspenders purposes, I confirmed this repro, and the previously
reported one both work fine on mm-stable.

All is good, the issue is resolved :) just a matter of waiting for the merge to
mainline for this.

#syz fix: mm/mremap: do not set vrm->vma NULL immediately prior to checking it

>
>
> Tested on:
>
> commit:         e20706d5 mseal sysmap: add arch-support txt
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-stable
> console output: https://syzkaller.appspot.com/x/log.txt?x=13bf9998580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ccf540055069887f
> dashboard link: https://syzkaller.appspot.com/bug?extid=e3385f43b2897a19be24
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
>
> Note: no patches were applied.

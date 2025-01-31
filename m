Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2BB1AAC4
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738339338; cv=fail; b=BWzC/oWNWLzhdcEtGA5ZbCNnoSjpid6xKcnjFpH8m3pjj7zDuy+Ty1egX5MYW1xWoU2ZeH4LUYPFieaGHL7kcFsPvo45s6JGfwyI8/1yePzT1FeneNL0KZDKNGOFAJDOCSD8YOSeG/sLa3CSjr743DJoiU91Bs9SrSie6vWDldg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738339338; c=relaxed/simple;
	bh=oT5/uOXUVUTbbG7Opiz9MgSfPkINjdRbxoVL1HqWnxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=csqvngdMxAr4t9MtmHhrSKaw9CtusW5sikDqdQEYKfkqIgNEHUkLLCNcn5RoQvy79UCn8jvL9mUIFBlIUGrvPDhXnikGqiPLIKxwU96jjsWqYLYM2K51MMdJfFGWncsQXNVt07ZC67dWhqVMWhVBBUL31TgPQ0nRODvdjbNrOYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=h1dT2jqT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bJ/eNS8S; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="h1dT2jqT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bJ/eNS8S"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VG1tpY004043;
	Fri, 31 Jan 2025 16:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=adxuDgWuWYzrebfh+o
	R5korNU5xfNQj+A+MFdM2gXuc=; b=h1dT2jqTTG4qq4JCRhabz0KGA1apUrFSzm
	4Mh5GE9TUCbvvglk8NitFAakEvY/b3HogGZS8luQa2994EITHEK6F1kACnZl17ZM
	CrK/44clRdcWk6VMbCwEx8HJYSIavyFMO+bi0nCMlTBQld0aUmnQ7L2ECy0YmrRj
	aI8lfJ36wbibsYDRCk/LqYfNiFwaHa2YWEp9LuQxawbUgbPChSJUT0//8PcDnpR5
	SOPtysADA/FPuC/wBUciciIPlhsOadC35F3CHBQbMpIeWOO7ciATa+84j9qWO5+G
	s/hLQgC0TbP0raRiKgjO2x/2JlogpP3a1hhghBqIKKZ3qdjhkk8g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44h1p8000a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 16:02:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VG16GR004457;
	Fri, 31 Jan 2025 16:02:00 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2049.outbound.protection.outlook.com [104.47.57.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44gfe53ras-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 16:02:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9LldXC8LzuAV8jzgQGZuiv/JePGW2LqlMW4E1sDfejg6f3/7skfsbg5spND7Au58AZhGjNCQJomHtlMIyIxyyOfgquRaK+xzAieCoj09ZOEkcNhQISl/v0tH4milE+ohPWhBtCaBc5uNN0UYuKQ78XCTFgvptaFAD8dmJEmPJfutFNdXAUM9AkKXZE0VLQcUZKHAiEVIBl5KUd8iGyz3xcraA1AECzKKkGlCuakyjiA8aFs0dx4Vbn0+H8R9gEkZAN2PWYkkyy2aBcA0uh2iwtYCKXq+N9S411ZIm9vPcwmfnkJa6eo/QytVRbUrqUB/SIEDVgPtbD5LgVWpzBy8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adxuDgWuWYzrebfh+oR5korNU5xfNQj+A+MFdM2gXuc=;
 b=DgAEruU/fm7vUezh/b14YC5AAWUOT4r2713cZVfwc7YelRjuQc89RaSN/8MUw6C2Vn6qR/uXYu0ndlZncGlFJPg6sMF2mOnFqhr9qvk8nrKwFNG5pp3fvzyGY5WbIkIQNPN0a19gxZi5Mnvo5JY+li7t3hdVGBPHOiv9GHVc0ZiwqwnS9Y69qXhZ6JoY7tmEPUP9xo3upO7XI4lbVjKhfMdIYbw6LWVB7CyrTzMICT9f9IckE2fsHxBYh28KPTRYcyVGE+Vl3/gdUaLLiCfUrfAL2o3PlF4lHCv6G+yyA5BDexfvp9uyJcH3IPDYbN4gkRSOvjxUbxpXSjCOUb/ImA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adxuDgWuWYzrebfh+oR5korNU5xfNQj+A+MFdM2gXuc=;
 b=bJ/eNS8SimTAEgUSaNZo8yQV7gSQwztsnK5628KbREHFbI5DkMlTc/HIlN1jmNaCYQU6JXIkm52+FUO7+31hd+GKeRh71iNHTdwYKwmhvWbjvQvIdXKrjhnz0CE/VvGXLffLDQFDHN0PWtfx6PB8IBC5RO5dAPSu9VamlTEOiVc=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS0PR10MB6798.namprd10.prod.outlook.com (2603:10b6:8:13c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Fri, 31 Jan
 2025 16:01:57 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 16:01:57 +0000
Date: Fri, 31 Jan 2025 16:01:55 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 2/4] mm/madvise: split out madvise input validity
 check
Message-ID: <15ded8f6-bed7-4216-ad9c-3d51c84c7eb8@lucifer.local>
References: <20250117013058.1843-1-sj@kernel.org>
 <20250117013058.1843-3-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117013058.1843-3-sj@kernel.org>
X-ClientProxiedBy: LO4P265CA0286.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::13) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS0PR10MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: 2315e436-889b-48ab-9dc4-08dd42109705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LafXACRv7hziFizkYgVBzGvGZyhR5DJIeDHZsvKK+ggQ3bny9FfU4dN9yTEU?=
 =?us-ascii?Q?pns5vlEqILw+9bIIK1Sk0dLQPSa6uTfEeIUZqftWR9JdeAru0DkwV1ge9slT?=
 =?us-ascii?Q?xi03r2kClSOWp/mrcjaKVJqgRnMD1DrTv9kA+CaofiOhGZaCiUrMXJJG0sQW?=
 =?us-ascii?Q?3il1+ZYi9sptFVJ2KbUY2JnBeuw8A9rOcruwv4ldVzKuHBoF+Y6G+c4gJZsj?=
 =?us-ascii?Q?w7JJYDUtt+tW5PsKQ6O9mF56tiefo/xo1IUVV9xIbGKIjs8giPpvrAliCah5?=
 =?us-ascii?Q?BoUg9zDsCtW5H/D2X6SjxoaC0f7cEDsxl9BetsVF6H847rKaXgXYggfQ7Crc?=
 =?us-ascii?Q?DZVBMkO5cQcMwDsOqEtW3p7PCpc8WBq/DZqU5yWN93wribC83mRtDAZlqKb/?=
 =?us-ascii?Q?qDN2XFZ7z2axV4sGDBi3/x3rvr5/WPxhMLvVnPH3D+PkkWAltJe2OxF1CiYw?=
 =?us-ascii?Q?Xvi4NvcGDpFpEz0nRZfzpenOyyO4vAKllogtTusldRa3spy1uzlrCFZOv3AP?=
 =?us-ascii?Q?ommZ/O62HCFzG4zgH/ovwxu0O3L3a6KVNDx/eKHqvu1/4eMyG0J30trJeLyn?=
 =?us-ascii?Q?u8XZH4WEt9R9sb+2yj8gC24kEzfqlvMcxlgu/Thr+Hlo8vGBm+aS9H8q96of?=
 =?us-ascii?Q?WXbRsGUe1yxXrOZJLj0/h9+Yraarn0/RJ3iE7HRt8+qQV8yXmnQUBxPK8PvL?=
 =?us-ascii?Q?j566Vh2+8+jF2YiaRZDU1y9Gg2ch4Q41p8kH29BvF4RQHrfIYQSrvVJm5lsR?=
 =?us-ascii?Q?f8unSN+suKGi/qMG88ZJuZ7MbO7yvexkVwi3Q18d6rlAEpRNOknNQExrJ8UY?=
 =?us-ascii?Q?tVWzKd2xKXovv3o3QJ9NskdMrsXTehQBK/A6Lw65xFwUHyEiT2Wx33EoILXV?=
 =?us-ascii?Q?L2m8h85Tltup+WKpgthbIWD1rg6LTgMJyuh6kiwzLAHLmodTqjCTERlIqseX?=
 =?us-ascii?Q?TntySUY8XnlOPHcAH4PbkEH0AwRBg55Kcci5NATQoTOxT5BIwD7kC5hcde0h?=
 =?us-ascii?Q?dSOKNFR2tVgWbP+avQ2N21Q23/CNJ5UtQkMATSSLjRkmWfDzJFyfwfUgAbtJ?=
 =?us-ascii?Q?6S9AzxOTVkA25mpNlgNbLVV7sbl3/Y+jziBDih+lLApJoX0gghmvZa9CQczK?=
 =?us-ascii?Q?6vPbxuEqCHz8yIOva7QWEMrBfromHoMJNsNWx2ZjosZhk6VpPxeKp/5OAoww?=
 =?us-ascii?Q?zXLt0GYJlOa4MWce1M0vV4HY7U+Vo6diZdgATumMNCjUQYZfDnGw/PFRHknZ?=
 =?us-ascii?Q?wLTDjjuSL3xjdfYofVpo4tXgmB0BZJRJrsnCYgYgwgLRF1baj2PFrYWA0D7g?=
 =?us-ascii?Q?DzB9Sau6nWf5fY1p+RuPaM1edIRUAGyMGSDnZwoyh9PyY9B4xfArcm2534MH?=
 =?us-ascii?Q?GvTo+o7JP3XurZ7g55gO2bVMU03A?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zudHOmDnHtiwSZxfvDqHw1Kj/X/2714bOn32eHCaDkVvbWlEZt/e6L6NYbCm?=
 =?us-ascii?Q?FtcFqmOrItNEMbpBTz7NZs7Q7jch2hRP3M4Scr90wJ3BiA5wkwSoCrtdktfv?=
 =?us-ascii?Q?8wQ1ICGmMDfLJqSuxHUZi6Eq2hmwiY0oPHL0VbdFw9FIrSkS35wKqBwavRzZ?=
 =?us-ascii?Q?ifaiRKnvcqhTQCgmkTh7e8z7Mf6oXkFRc3WY/reS0AvWbZeRgQQAnLJUuNp3?=
 =?us-ascii?Q?pDqQqFeClLIjOqMDkG1bZw7NUMo8ROtCQkU1zx/k+kgxwSTX2O4x4CkWR5st?=
 =?us-ascii?Q?jpf8jvEDXYvBXiFqMYS0HpcJ7hKOEXNfVmo4k/MKCw1grqqP5VuNMb5HO3t/?=
 =?us-ascii?Q?z3dtZ93eON1FhxguLwv4HOErVQT/8kdw9qo+LKT66VsRY2adwnNLi8FJCKpV?=
 =?us-ascii?Q?L3xaAlw7NqfKezYPSNizIZx/dA1zoNzP+6CZzS91cvZDwtJez5FhRTM5u/PC?=
 =?us-ascii?Q?WFjrvi7qpl4VqZqiaIvgH8XXmwARan4zSyNz5br4uC+r/r6mLL3SOMrPBkgA?=
 =?us-ascii?Q?Smi8tSU6fE7Aq9Of150TmxQmxu/mwch6zIoaBBNyyhy9ouKQAY91fKlVVX8t?=
 =?us-ascii?Q?GtXcOXVsuEY/yi0lQlG/WdFeZTUZ8ad8XG4zhELcNonB55nB6PwTc9MgCERG?=
 =?us-ascii?Q?wDv9aDWFb16uYwmYaKgBpVjlpGaIjnNK5DxxrivoKg+qQ3EfGaRd+Gt8hJxi?=
 =?us-ascii?Q?C98BG7aDAeBUv4k7OV5h11UZYesINjcmkybTwbeSU8cf5sJ6UtmCmUoV40Kj?=
 =?us-ascii?Q?Raj5IUbJ3xRU1lFOIk1nVyogO+1q3vg/Aa9IEXT0mtzigLWdAGy36rS/E6bA?=
 =?us-ascii?Q?nSJbx/V3z7a+yulvtzo8NAh9b+2cMkhnukKnnOXd9rvaeaXJFAJ0vhH4y492?=
 =?us-ascii?Q?B6SR5cQJm1VudpRBns0LxIa4nxarUzTAwyoreWsjP+ICarJUEti83AcvVq/G?=
 =?us-ascii?Q?6Jx0O45uMmfN5KNHiGq2N4w4usVKpTEZuKL3oVFelowxZG4KZ1E4qIYRaBDX?=
 =?us-ascii?Q?WzNn4jztVYZNe4zlzPYq2r7P2Ld3c4VhcAmpctU04W5vNkNTTtfPiLErE/aq?=
 =?us-ascii?Q?MQE+gjzdeF60toMxg45PpO/80hWCvMGBU/Rn2CHpT7HFAGNPlTaAUJXWp4x5?=
 =?us-ascii?Q?WvgeBBjeVMYbSYcF5Ju4UWTsuw6mDwn5E7GugUPG4cJIWXYoifyavTtym/Oj?=
 =?us-ascii?Q?TW1/aAmRDjSmX8IJrf5HlDOHb844pzeOdOVDx8WGz6M7boBmnlGiZcgdiZIA?=
 =?us-ascii?Q?oHt5r5AJyJw9sFgtN9TECs2jm0q3J7He9jvAZEmATy0vKhkPSaaDbcgSOz1y?=
 =?us-ascii?Q?x/IHRPiWjaEtwTmHBs8Gp7EHM9xr7olyHIGIWTxZU/HKUcFTqD9sv8gwSy3R?=
 =?us-ascii?Q?6bnh6SMTUEqEPsaj1gA8RIB/6TDTFmSHpTDpCkxbOzryU8cRUcvHfTMj38j1?=
 =?us-ascii?Q?p4whzlms6Cpq3dSrKk4kFRF4A24/TTxaUH8Fcebq7qoA7dpW1hafUAjgFHfF?=
 =?us-ascii?Q?j8BJR7ux0u1NNlDHheNgb8WCcRGtzshJbMihI+lcyYpg8zpHQUhfNBpyL4kS?=
 =?us-ascii?Q?lS6hY+HTSaQyhE3cjiyluccfvy9A2ULD4aXJ+NaVauT+iaQcz/sD9sGK3xyU?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kLVRgDw7tz9p44zwb+jwTgql2MZw2ezlG5TCsTwIEx+lEdJOgvxfYT39vcxRVng5lNQf851nQxr28yh9SpHLGtGniFIBDUFIQmNMuKz6xxLzfdnB05HaslVTWHQy5/qn7EkKeP8n2k+p0KU/MY6gEtNIWKbbTMizOL1Zjcrn8pYlYEZqpSv7BIMzre3H31j/ZHSDnf+8kd4NzAjr+xfd/oeDHvGDZI6XkvPcWAo/3IfgygoghTTQQBn2Nm26yOoingfYCkWmSDw39FZnve+67FXsxuB1KBUlZsVAPEOFpA5VGn32lQ2HBA0lq+M7Ra2vyBalhUJCRhBSU38tjJALNiuCFAb3AJMdTR/2siOOHOxjDGaG/oncKO2AURdabOowdqIp5jYElyUfNjqnxrIzcN7Gsf5zuU8NM4zZfw2v1MvuT/onC9Gi/zJI0g/nponsSPhS66W7GQnhN+FLZ8Lqn/ef4AhNatmhOPnUPKaeqm/O1dpQ9ODpw+nxP/Wb1plKYeaO7yc4ujpVVIe/y6LdB7avWMlJVWqjZgLfbEMz3v4G6lrxpE468DGqLGSkREKTmlrENQnfJ5a5ontuBD8FiGVULhFRtu1TJb2w9gpuei8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2315e436-889b-48ab-9dc4-08dd42109705
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:01:57.8035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwu6/OU0JhyXohGZixuQa1dDYuTB3ekljZuNU9z/UarGO+9ZhBeEPq3pi2To5MV9tYP1lDofNEV6BkyqwWDNJCP0OatFZAUWP1EcbZwPL+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6798
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310123
X-Proofpoint-ORIG-GUID: Xwc0Sywi1Jea4m3vDGp85E893jiGoWXy
X-Proofpoint-GUID: Xwc0Sywi1Jea4m3vDGp85E893jiGoWXy

On Thu, Jan 16, 2025 at 05:30:56PM -0800, SeongJae Park wrote:
> Split out the madvise parameters validation logic from do_madvise(), for
> easy reuse of the logic from a future change.
>
> Signed-off-by: SeongJae Park <sj@kernel.org>

Another decent cleanup, regardless of appllication, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/madvise.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index ae0964bc4d88..9cc31efe875a 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1592,6 +1592,27 @@ static void madvise_unlock(struct mm_struct *mm, int behavior)
>  		mmap_read_unlock(mm);
>  }
>
> +static bool is_valid_madvise(unsigned long start, size_t len_in, int behavior)
> +{
> +	size_t len;
> +
> +	if (!madvise_behavior_valid(behavior))
> +		return false;
> +
> +	if (!PAGE_ALIGNED(start))
> +		return false;
> +	len = PAGE_ALIGN(len_in);

Kind of a pity to duplicate this, but not exactly a big deal.

> +
> +	/* Check to see whether len was rounded up from small -ve to zero */
> +	if (len_in && !len)
> +		return false;
> +
> +	if (start + len < start)
> +		return false;
> +
> +	return true;
> +}
> +
>  /*
>   * The madvise(2) system call.
>   *
> @@ -1671,20 +1692,11 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
>  	size_t len;
>  	struct blk_plug plug;
>
> -	if (!madvise_behavior_valid(behavior))
> +	if (!is_valid_madvise(start, len_in, behavior))
>  		return -EINVAL;
>
> -	if (!PAGE_ALIGNED(start))
> -		return -EINVAL;
>  	len = PAGE_ALIGN(len_in);
> -
> -	/* Check to see whether len was rounded up from small -ve to zero */
> -	if (len_in && !len)
> -		return -EINVAL;
> -
>  	end = start + len;
> -	if (end < start)
> -		return -EINVAL;
>
>  	if (end == start)
>  		return 0;
> --
> 2.39.5

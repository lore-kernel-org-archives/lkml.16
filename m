Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2452638DF9
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 12:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748607529; cv=fail; b=qN08gKOjKEZYbiNzmihZTGKKoWvVUlJ0VNNrCusRQ99zZwpcd/JGDd9QsyJKAd4VC/VtfttY7DE1Jjr73k/uw3FVSyi3U+awbmdC2WiRY33J+eD6wWKHQzID1DgHDewSB5aXgx+kkdiBB/rPBFyNwI9V+N5r/q28AtHVbpck7B8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748607529; c=relaxed/simple;
	bh=n1pAaOf5/IuDFSdVzLd0mhwCRPmFPBl2xozKBxmzxP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a2QA7cFANqQTllHDKuzHkbvcUKhPCZH7l4XUCtsqq1zxAuHrxh1vQ0Dlj3UIW9mIXdQ7LxuU9cUBbWaFJY5ycewrpRNSgZb+aAs8ynUgQfy1T/21Md6rm143zb+dIr6JuAJms9v45ySEV1aGDIaijglT87uPau9ZEYYtQMEW61E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NjqT8VDr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sYUfc/l3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NjqT8VDr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sYUfc/l3"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAt2VP015372;
	Fri, 30 May 2025 12:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=m+RTv7pqv3M6yo4j6l
	nlvDuRXAgSKsDbLdVdU8/gm6o=; b=NjqT8VDr4wPhmEJZODanVvf3U29m6pGbhi
	kYnX9kw+ffuGqLeuuxtiT+kqJrF+5xpAO4cuEbnhr8hvjVzmzu5itERtNwvZBROa
	gyj0dA/TIQGVg+2lp5vnU72iUs0+N2SjxLLMor0RUSOqurZwQq5bgL1YVEfK8O3G
	RsWfGkDaBIcmcV1Bpvr5iSE1tppRCdkMXe5QUrq3DyyrrOT9RhzwLlkkyg9BS+i+
	hdCvr3gMydwPXaro4P0qqCxS9YSzt1RfkD/fSuliJQxz1dG6vVaNzFhPaxCxLBLr
	qjJGzXGL89Z6x03XUA8ou8WH6zTEDlQWzTugveA7ZKCx4ZK974RA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v33n2533-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 12:18:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54UB4H3d026679;
	Fri, 30 May 2025 12:18:28 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2054.outbound.protection.outlook.com [40.107.100.54])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jd6tnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 12:18:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YogfdDM5aZWzv73o0X5bx4hz07ytCcPpfm9b42dXwA/DUSdsU4JKPfdQTl0I48r5qQWogMzxjLgQZiaQdP3fYL2Bx9j5e2QdEgKxF/iw6Xh4066h9JsXU39DSFSAv9ab3LeWwqRCV0wFFdCvSz+TFKKACEGVx9EOTZz+A0L6JczO01M+u6ky3BabAIS4H2Rxd1Oxc8BSv+Um4JDHRlDF8CXSIizFxNzz44ulQGOOtDKEIHbpYE8KU2ugvIgvnqyyM/01h5ZP+9VnmXJlcvcSMCvE9O/Z7TL9D/PxXJ0aw9U2Tr5OeJHzfX/NbCGSpFPP5JhTdsPJep6oZbOXT6ow3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+RTv7pqv3M6yo4j6lnlvDuRXAgSKsDbLdVdU8/gm6o=;
 b=r/SpmUJJOWV4/iG8KWUImN5phM17MkH/Etm/QycSDX7f4g6eG97S2L3Gj/7aOuFIiuNQrC1C5c0fyslNoc9OfpGdHIV+LShw/u4Ol3+HxWGLtD0hdzXP/CuqwAsj4zInQWSSxkfFFJtrhpky1mO4kg6w2wfmtJnwMGkcUR+8QMYuY5XFNRsvZXd/Wq96l3PZPXaYSB/7iChd5e0QnwDDCSP63u/DZgCHw4U5uD0Z/2MYEkZg4dkGDb8eeHdSZKGcKp1aeo6vGHPRJeCLjgo5uN4THcgPjqXSpCR65rdEoO3K5ryVVbFVe5LMXy4KFbn+hwUKstha3b+dVgAt2ZiiDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+RTv7pqv3M6yo4j6lnlvDuRXAgSKsDbLdVdU8/gm6o=;
 b=sYUfc/l3YfhXL8IgJ5WTixw9KwrYIhO3QNoiMwsHJqdsHMbUDF7BbsNQC/NZCyNhyYKBnbRnySsqA72QOeqozoe9W7JSl5bV3phaM7Hql0y77DHxEHk9EhJxJGQy73qjlcR8PBgSOZ+oPaVd9+7v2cp5HHyJX/ImsVDamtBxyiQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BN0PR10MB5095.namprd10.prod.outlook.com (2603:10b6:408:123::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Fri, 30 May
 2025 12:18:20 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Fri, 30 May 2025
 12:18:20 +0000
Date: Fri, 30 May 2025 13:18:18 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] mm/pagewalk: Add pre/post_pte_table callback for
 lazy MMU on arm64
Message-ID: <c5722693-1fd2-4dc6-b081-5e9b4299e486@lucifer.local>
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-4-dev.jain@arm.com>
 <7b4360a0-42ef-45ab-9e63-eace52943529@lucifer.local>
 <976b1f4a-3b5e-4978-9ea4-ff4867094f7d@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <976b1f4a-3b5e-4978-9ea4-ff4867094f7d@arm.com>
X-ClientProxiedBy: LO2P123CA0093.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BN0PR10MB5095:EE_
X-MS-Office365-Filtering-Correlation-Id: c923f244-b49e-4ead-4f9c-08dd9f741099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fVgkbFdPzrOZscfVW9QBGHXmlhlLdZbgTp8MYVmbaw3h3A4i6CPXa148A4f/?=
 =?us-ascii?Q?BTcSNvmACipHi1fYixCAC/rk3rGgGvXS5FKaY/ImuRqlxGAnw5Ow399wqgXT?=
 =?us-ascii?Q?OWZV/erdQ1oh6fxjMFDt78ftA+jXX0m4GEIyzLw0gFS39U2mXelGb0Av3v6W?=
 =?us-ascii?Q?qlGnzX6A0Y58sQdEFD9AamA8+18g7Azo24vGWOcyFxzgEgQlzWPv9wx/tvft?=
 =?us-ascii?Q?XHVY6/+BgewRhAFYHiBmdxIeMziCHfb+2y7dxbRGtX06MmbZPHN9xa6sOMqB?=
 =?us-ascii?Q?QtpT42DXNxBRSE3jeGsP/3thFyhE4W3KBR3il7n8HJQXl13Nse6+gQSClDsV?=
 =?us-ascii?Q?IJavFa1lJT0UQ1ccXW6nsUAn79GBfYdcXXPpOUJOpgvyW4qUfy1dMJxR1Ia0?=
 =?us-ascii?Q?dMhwXmF5MjSc1oGVVFqc3BWk3UX85yxFHO0AVP0n468aCWseyD/+tuCbdJ4+?=
 =?us-ascii?Q?N4+BJE0FG0FMsHZE/75H6Qq+D6g5ROfqVpbD9XSOqY5GCD3stylfiMmuO1OM?=
 =?us-ascii?Q?evNNbxYlUwL7wkVTwrYwCJkrPWAlZkt9rhO5Ebds49JCotaw8od2aym6LXTH?=
 =?us-ascii?Q?ICIIFC6MbTJiMHmvLtDRrUiA6LstyaQSPg1apm6eaqiW1WFpuPxd1LaYq3F0?=
 =?us-ascii?Q?fW5+GLeRscY4rZjm1eqUANFbnLVd81BD/gGFvaBoc/1O+pSKa9Xsk0QVnhDG?=
 =?us-ascii?Q?wLh1peFMSeJgzDtRVKl+qRpNvzyX5QHbpyTHYeea/CPpiXF8hl97wZFhEx5W?=
 =?us-ascii?Q?PGGCVPaaH5Ov48cbQDZE2dZWvO8w204gwX5v0S+OTzs+zoAhxZVENPV9C4WW?=
 =?us-ascii?Q?Yg5DGj5CZEcj6kXPxdLHnQnurAMA45QBWzeeJKxXs8t/np3Wjtl3UP4WhIjP?=
 =?us-ascii?Q?AFZsqVAhvvOq/YFZXfWWs5satKw+QNxCMrH3o0qH6aPousfUNjYs3KjxLh0h?=
 =?us-ascii?Q?DNML4GbxC3wz/of2KpCmj1NPK37apO4QWl3maflgJLLYfvPB9sD0jtcGZzC8?=
 =?us-ascii?Q?tQOZLChRGVn9pE2uOk5CRBM6+ka7YOGnd7h3ay3FFtJdl1cz95C6ReMDU+35?=
 =?us-ascii?Q?TIPlYIn2OJntKTC5iqRuCiAmTXFoT6m03lqGpmXby0uAMUT5sJS8Z6XUmx8K?=
 =?us-ascii?Q?ZbuIlloqOv2g8TIV/+ItVl3VaBXpOtJXGyexp1LMP30uOvHBr6AaVs6i7Sjj?=
 =?us-ascii?Q?gdqUpcil/sdlQAglGRd4A4dyrZkz7Z0iF0XKObjDmvt3jAgzvWlLLqdfoD2O?=
 =?us-ascii?Q?GjOSQo/OQ9t8ew6Hk3M3ZzDYHCAAWUU2hoJATOWfqqa+5Uh2IEh4kiy+WoEL?=
 =?us-ascii?Q?m6qxbLCgZ6vMic1fbVu1g0GTAScMyRBLkI6n669nxvTQdTMwitKvL84N5ZpZ?=
 =?us-ascii?Q?NejJWflIncn/mBCgL50UaNfZHmsJdHpYZ5Nk1/nJ+sDHtrHPgTr4uEjYu+zM?=
 =?us-ascii?Q?SDsYE+d8wck=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a6Hpq7bMpXkHknNI4Pp3kmZtILLpX7KmXRifcbk6XqlfLqQWKghEwexT/6u4?=
 =?us-ascii?Q?DX0fkGtPHhi+fZ2omhJVx7eDHtJIEN3abPs3Wbxd/Qji5jZcsMbgBLLNbYHF?=
 =?us-ascii?Q?Cja3Pg58/kS54v6bhVgyj4BOmupohnOUD+s+Egy6toltEtPth2+SMKN6beP6?=
 =?us-ascii?Q?LJN4W7bxJPXW5eNZIakjNF0aoyLKJWbcBpqQ6GKw++mt6xG9GRhzkjwC+oie?=
 =?us-ascii?Q?avBE2y3fj4ATgqnHe+sm9AYAPB3GXf4qNTXWZ8K/w4EF7Q0fz26bfhjFIfvj?=
 =?us-ascii?Q?dCz6sQpxfXVoSKgut6tWNK/o3x7WykMCo8+MZ8PZ881InwwDfGpLLGaU/Azs?=
 =?us-ascii?Q?JO3/N0Q/X0yXHBen3UB7RPzz+sNcK0yOsiLEUxWmPW8Lo+tZTpZxejg5LDMk?=
 =?us-ascii?Q?U4AMByuldvwuS3p/gBUUS1Dx4C1rYzCwFSxC9d8+KczNZQWFEWtPSRjKBOAy?=
 =?us-ascii?Q?L+X4Vgc7DwVeYEnT57ZzdN26C4fw5M0c4hICN5uP9ue/6EN2mDLSfqSNS+K0?=
 =?us-ascii?Q?MhimHsrQXpGFz6EEtOwQVxIPGr8opjyDEH89argOrPgH/1Ke/fvvwlUMZyVV?=
 =?us-ascii?Q?Mn9EgDoo/w/2W7UrwI7uTTYn9fmcVlNuORhiiJku4t9VlgFpwo2mnfRpk2pI?=
 =?us-ascii?Q?Xg920ElzMIn9ey3TmM96arVipQm7rsk0aT/QlWI8pa1wh+tC60Xuz+9Xc1xM?=
 =?us-ascii?Q?FPEcJP55/biljTj7pE+h3vwEAeYzZMkegLowfsXFQZQ0TsocnJ1DV2op8U2S?=
 =?us-ascii?Q?dEapgSDecmP5ioiVeWbStBHlSJJULqukogbYw+3c2+zjnB3LkoQYSdQgU/df?=
 =?us-ascii?Q?q+MeSRTM3yx3SUag0HC+kIYk5BS2fqXmJfkvbfBZshUzeiElhsYmJLXL1A6t?=
 =?us-ascii?Q?ff1drl6tOWPsJ35chwJJydcy84rcuZB22L659rC5J5WtBTSQ9D5128Opy7Oz?=
 =?us-ascii?Q?wEkbVHy3qLnyY+LtsTJ5/XTcdOaD28atvYFAjCdqaoUj+V6KNXi4lYQlPE9l?=
 =?us-ascii?Q?Ok31/wxy8+6XIO/iHahvsjGhdOlSFVfzhnR5L9sd/evt6ByhgQo2xvfUnvxK?=
 =?us-ascii?Q?Cu2POvoeUNgjwiLdj0NbtCY32Wi6h5n35LBe6zorm1T2HcPFBkIzmywi/NIa?=
 =?us-ascii?Q?MUdcf6xD4+sC6rd/xZOAWnV7IHrXrEpKAnPcEdiFo/KZBapnFUXG5rgoen4L?=
 =?us-ascii?Q?GyYqpl8nmtv7w4jvNcegNvJPuYrjsy0Jl0XU/uhq+fkuqLL1fu/nbA5fgq8x?=
 =?us-ascii?Q?SnLH/P4DgdJxX3+lRinefvst69jgZ6dJsiHRrOOd6lrjOfIt8uC0HFfRhh60?=
 =?us-ascii?Q?3/97kZGlqZgVWjRAwPphsTwzqwaYj9sNDgOzDNympyXRwJg6VB/kQF/I+HMM?=
 =?us-ascii?Q?Rqkb9DWbxhb5gz25jLTGsewhhdPSi56+JQtVWxfICftPjJ1cb8GnV+ToJkZG?=
 =?us-ascii?Q?bN3XDltfsseut/DMrnnS8lhd/VHR+J1X5QiblJJBsT17ATjnxkkvy9+Z/Yv/?=
 =?us-ascii?Q?KDiNxXJBuZn9CA34/NsK3M8CG881sky+V6w5KmVQEjwtaAWNhxSLqGtLh4BA?=
 =?us-ascii?Q?5WFF2Dnogsy2UGJR/SfhMW49DfeY8U4Z3PVeGoC3PtqLysLljphBkoZ4fq9+?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4Vt6rHS98bXzCJ4o28fWfbYsAeqCJA0aPT2l6eM1HS7CxAWXJPCiQAS3mQQefzyZjC4l4v6nRo9rMI7rQ1hioP/9pFs6TUh5BrtzSZ++TutHbj/DCj6mSDbWgrpsYqeLXiwGsPkwW3s2Zb18OqUBmp13vmuwz1R9RGCuW9jwegqhaJuosSnl+iPfO2nwwokzxt5jrJXeCKGOer75/mqwZJ9vJC6k+JZFakV1gkOI7d2VUcqFrB3yEw6MLUmXdzKZ8YlL51Srm41/h4G9pz0fpXChHmtHKFF9mLuBZHVjcKijEEmm9fsOeN1SfEl1cTu5NzfP+FfjrgfrWSEDz5w69uoaO64cCl93Ok0DS2s5o7rOfVgDUbvzaDKAUxj43JK1Dd9tmLGXju0TfTIXBhYJiTUIDMo+WZ1ym59B83j8pMwNqgtQL02sG23CTVptxSojnZBYqfpi4eG/1s9AYQISftWRN2qZQw5ra6iwAMtqRyr5gzKi0NaFLo+2HKGXhFS6wLeFNKW1H2fW/zVj+psQ+aqq4A1qmswF3hsZUFds5pkTbjVZer8VdYg2VvQa5ZIwlHcN/qbN6Zx73VQRxxbsrBSAM3aw8vRw3mdP096QRlg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c923f244-b49e-4ead-4f9c-08dd9f741099
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:18:20.0862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yy2B+yO+gHqF0hJTdILRi+I18gHV4ljTyLDEWAeAMqglmSXYgEv1TlawcMcDLWxd3EIXmnK3W8ZTRpbhizVRDii2b6K+eUNkBWJGrUnHliM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5095
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505300107
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDEwNyBTYWx0ZWRfXwEvMZQXJJRPn Q12a/2xmkkHMtJo4j/Cw+k6vUQOfvfkNbzoyqpVbGARKpXj/tgm2PSQCdbBeYnya4dSlcaML66K ip2p4cdl28hyh9Asey2AJ8pnJmH/QcsACVDt1AZdqjCxbu7j7l3hAaL+0dh9vrebX/16yjPkLNI
 G4b0/l/NN/COtFEIILuijGX4HqpDDqWGKbGI2fLD09gfc+ZJFjFMYOsaX7hkfsHuJrKyzhRsj2d 48GOgqrQmPQGR6vt/gJ3xWLWExx8R+6MAIdRfydkkbeuBUv+j7Z2fdMsz7TpLOtPL3tMFgv8PSV Sib97MRx8myJyyZ9Rw+lQn1MmerVqGjXGhUTguKlBcmP1tCztU9mtjrs/RoZp0nE5405TA46abe
 LPw+EYshV9WG7cxJNAzPpN8VhLLWW31TxvLTAq1fAyV+xOKE/cVuHSywITgDCBvjaLM0JhsF
X-Proofpoint-GUID: SAcE1Gv34htXM3b--dM8iXEv8lRAzADS
X-Authority-Analysis: v=2.4 cv=aO/wqa9m c=1 sm=1 tr=0 ts=6839a215 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=2aOoyu3_8yDnE14sklsA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: SAcE1Gv34htXM3b--dM8iXEv8lRAzADS

On Fri, May 30, 2025 at 01:12:07PM +0100, Ryan Roberts wrote:
> On 30/05/2025 12:14, Lorenzo Stoakes wrote:
> > On Fri, May 30, 2025 at 02:34:07PM +0530, Dev Jain wrote:
> >> arm64 implements lazy_mmu_mode to allow deferral and batching of barriers
> >> when updating kernel PTEs, which provides a nice performance boost. arm64
> >> currently uses apply_to_page_range() to modify kernel PTE permissions,
> >> which runs inside lazy_mmu_mode. So to prevent a performance regression,
> >> let's add hooks to walk_page_range_novma() to allow continued use of
> >> lazy_mmu_mode.
> >>
> >> Signed-off-by: Dev Jain <dev.jain@arm.com>
> >> ---
> >> Credits to Ryan for the patch description.
> >>
> >>  arch/arm64/mm/pageattr.c | 12 ++++++++++++
> >>  include/linux/pagewalk.h |  2 ++
> >>  mm/pagewalk.c            |  6 ++++++
> >>  3 files changed, 20 insertions(+)
> >>
> >> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> >> index a5c829c64969..9163324b12a0 100644
> >> --- a/arch/arm64/mm/pageattr.c
> >> +++ b/arch/arm64/mm/pageattr.c
> >> @@ -75,11 +75,23 @@ static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
> >>  	return 0;
> >>  }
> >>
> >> +static void pte_lazy_mmu_enter(void)
> >> +{
> >> +	arch_enter_lazy_mmu_mode();
> >> +}
> >
> > Hm am I missing something? I don't see this function or the leave version
> > defined in arch/arm64?
> >
> > No do I see __HAVE_ARCH_ENTER_LAZY_MMU_MODE?
>
> arm64 is starting to use lazy_mmu_mode from v6.16 - the changes are in Linus's tree.

OK I did a pull and see it. Must be very recently merged there!

Dev - I suggest, when you rely on an upstream change that's going to land during
the merge window, to hold off on sending that series until after the merge
window.

Because if this lands in mm-new it will, currently, not actually do anything :)
and presumably this is the target.

Obviously this would be more egregious if you were relying upon something that
would result in a compile failure or similar, but it makes life easier if we
really make sure your dependencies are fulfilled.

>
> >
> >> +
> >> +static void pte_lazy_mmu_leave(void)
> >> +{
> >> +	arch_leave_lazy_mmu_mode();
> >> +}
> >
> > Are you absolutely sure you will never need to hook this stuff on higher level
> > page tables?
> >
> > If this relates to vmalloc, then we do have huge page mappings in vmalloc logic?
>
> The performance advantage (for arm64's usage at least) really only (currently)
> beneficial in practice to PTE level since we can reduce barriers by 512x. And
> apply_to_page_range() was only using lazy mmu for the pte level anyway.

Right.

>
> But actually I think we can do better here...

Oh...

>
> >
> >> +
> >>  static const struct mm_walk_ops pageattr_ops = {
> >>  	.pud_entry	= pageattr_pud_entry,
> >>  	.pmd_entry	= pageattr_pmd_entry,
> >>  	.pte_entry	= pageattr_pte_entry,
> >>  	.walk_lock	= PGWALK_NOLOCK,
> >> +	.pre_pte_table	= pte_lazy_mmu_enter,
> >> +	.post_pte_table	= pte_lazy_mmu_leave,
> >
> > This is kind of horrid really, are we sure the lazy mmu mode is valid for
> > everything that occurs within the the loop? I suppose it's only simple logic for
> > the ops->pte_entry stuff.
> >
> > But it feels like hacking something in for this specific case.
> >
> > At the same time I don't want to get in the way of an optimisation. We could do
> > something in ops->pmd_entry, but then we'd not get to turn it off afterwards...
> >
> > Same for any higher level page table hm.
> >
> > Is this really the only way to get this? I guess it's not feasible having this
> > just switched on for the whole operation...
>
> ...I think you're right. The only reason we traditionally confine the lazy mmu
> mode to a single page table is because we want to enclose it within the PTL. But
> that requirement doesn't stand for kernel mappings. As long as the walker can
> guarrantee that it doesn't allocate any memory (because with certain debug
> settings that can cause lazy mmu nesting) or try to sleep then I think we can
> just bracket the whole walk_page_range_novma() call.
>
> So I think we can avoid these new callbacks and just do:
>
> arch_enter_lazy_mmu_mode()
> walk_page_range_novma()
> arch_leave_lazy_mmu_mode()
>
> That will even give us the benefit of optimizing at PMD/PUD levels.

Yeah, this would avoid the issues I am concerned about!

>
>
> >
> > I just fear that we could end up populating these mm_walk_ops with every corner
> > case thing we think of.
> >
> >>  };
> >>
> >>  bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
> >> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
> >> index 9bc8853ed3de..2157d345974c 100644
> >> --- a/include/linux/pagewalk.h
> >> +++ b/include/linux/pagewalk.h
> >> @@ -88,6 +88,8 @@ struct mm_walk_ops {
> >>  	int (*pre_vma)(unsigned long start, unsigned long end,
> >>  		       struct mm_walk *walk);
> >>  	void (*post_vma)(struct mm_walk *walk);
> >> +	void (*pre_pte_table)(void);
> >> +	void (*post_pte_table)(void);
>
> nit: If we did end up with this approach, I wonder if it's better to generalize
> and call it pre_table() and post_table(), passing in a level param? In any case,
> you'll at least want to pass the walk structure.

I thought the same thing, but wondered if we could just avoid doing this
altogether, which would be my preference.

And from what you say it does seem feasible!

>
> >>  	int (*install_pte)(unsigned long addr, unsigned long next,
> >>  			   pte_t *ptep, struct mm_walk *walk);
> >>  	enum page_walk_lock walk_lock;
> >> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> >> index 9657cf4664b2..a441f5cbbc45 100644
> >> --- a/mm/pagewalk.c
> >> +++ b/mm/pagewalk.c
> >> @@ -33,6 +33,9 @@ static int walk_pte_range_inner(pte_t *pte, unsigned long addr,
> >>  	const struct mm_walk_ops *ops = walk->ops;
> >>  	int err = 0;
> >>
> >> +	if (walk->ops->pre_pte_table)
> >> +		walk->ops->pre_pte_table();
> >
> > NIT: you have 'ops' already, no need for walk-> :)
> >
> >> +
> >>  	for (;;) {
> >>  		if (ops->install_pte && pte_none(ptep_get(pte))) {
> >>  			pte_t new_pte;
> >> @@ -56,6 +59,9 @@ static int walk_pte_range_inner(pte_t *pte, unsigned long addr,
> >>  		addr += PAGE_SIZE;
> >>  		pte++;
> >>  	}
> >> +
> >> +	if (walk->ops->post_pte_table)
> >> +		walk->ops->post_pte_table();
> >
> > NIT: same as above.
> >
> >>  	return err;
> >>  }
> >>
> >> --
> >> 2.30.2
> >>
> >
> >
>

Cheers, Lorenzo

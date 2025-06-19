Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C018C2116F5
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343096; cv=fail; b=o4osDsAHO5UgU6SvuCgHLm39A5MYdQa6f6AM6psRQn82htQDA24Twujr5+2kDnFDbkM+ys0HBj8BhYWmrlNzLWjZ/eDPGKY1MsnhqvW3cuKmffLjQvef+3uhoXdvob9Czt3RpSB8R4wbTCUTHDRLq6QN9h1N5CbcBmt25oIMHV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343096; c=relaxed/simple;
	bh=QXkUnHy3ic2nZbeZ8vGCM+zK1Ti1m5mTWktVDyIA1Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YOWnzgNyjKj8iOHSzIC8S6IXUYqxhy6KtXstVT3D4XyZoFcRyfLsYAqL0ILCOs2jCNGxvQR3egukGES3sARkJZXnoDXV4eO5CRgomC07/ev4JBqDG+FNngtD5jpgFErMUmzUofLGQ6LvNBpldNyNPPpV6BGeTQUyRtVd1RYr1d4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=non40eb+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NHsnS37p; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="non40eb+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NHsnS37p"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMZhe020801;
	Thu, 19 Jun 2025 14:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=kQprM3A9UXw7yuMcyw
	hgmerqUS+0uEunkpw2Tz9IuqA=; b=non40eb+KDOA8N0N9UfrtzK0Fv7wSTA7dh
	NNYBNRbM3qoPrLEcbc1o0iaR0zal+e30Xq/9IZ5ubFmlAD4H4xxtIQNGFFZjyLue
	sTAZwtTaQf7ta3DJ7/yztZzqXyLjW85zYy6WVv/Kq4rzdJ6QwNqRPY4RbMVDfi0H
	3QnsCJ75BBxiIn5YBrwTS7sR3c7wYwO/mnZPtvldtkdMl+lCIrpw3celIEnzR4Jk
	bDrfhFAjZVtYmuGhr2Nk+k2p3CHNa3X5oswaDmH5iUCzW7q6DO0ZedTKVBSi8p0W
	02R1RRk363ZSBJ6YsOHIJpJkMiTUaBqn8BGAgRl9ifOV5XGNjkmw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvn9e2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:24:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDLhVY037505;
	Thu, 19 Jun 2025 14:24:40 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2077.outbound.protection.outlook.com [40.107.212.77])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhbqe5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:24:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCYTwVA2HcduBl1RRvgXGBjacn1ltv9MbqMGGtt7qlqWJA7A06wdcGtUeU2tzrMqrPuIwyd57cs1xOZPuB4MJPfsMXt8xhGz8Avwy5S7UJY3DJoGkJxhpJD4gH0Ysvefn2uSjg7nqsRcX/dDca2+igGK7JPD+5G5JhnVB1e53lW7Ci5hna4rEhLy6sCNPaQ/oTK3RsLXmXn0nA0T4m/mI0a1PVXjNpo2qcpB11bgaOThpSxxULGCwGZ9Dr5SV9kh3dQFV9iYn1oLsxuG6wgpD6Yq776ZGoXVoxvDZSvbaL5QNfjSDPpdbJmoz9YmUWcppcLdf2h+rmLbRxu3UjuC1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQprM3A9UXw7yuMcywhgmerqUS+0uEunkpw2Tz9IuqA=;
 b=XneJBH362obJP3gvEtsaRZYve76/4WjqTjgTNQwPYjJqQ/Q2PoF6R29n0YhjRHwk5+SbVE1fHTPInDOWZ4eXKY8rUaj/hGAb2w4ji0BovMIpcuPQB9+TZ3xNju/Kqs9rZJyGLq1oyxcJvy5YHy4a+FzeKdSByCTq3mEBKdvSCU34Ca7edwDJxV+93cGVeVUfkYqvNfT80iOxsD42rvvOtaixzjkfDczcmvT58CAyyEbnn+0RZlAutl3HaI0zucmQGs3/xUidb8nba1PYOl0SSxvm4LwtrSWFwqef25yMSoxgff6ibuyO569hR9o1I2RS+n+sHKV+PrcSiLc9wNd3dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQprM3A9UXw7yuMcywhgmerqUS+0uEunkpw2Tz9IuqA=;
 b=NHsnS37pUN3SJWmh4Xp5Ucxz7k3CcZ5DTU3xxCSPLWGM7mmE9wYbHPfM2USeLFtbmjbhejq9zNPUxxW5Yr89itfYE/EDqDnPeOIp4KrBLl+mcFd3sdKRW3YnBzvTiSh2/Grb0uhpw2l4Kbpq1SqRxqQkCZUvCKJZgCiPgr27ibA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPF5467E3597.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Thu, 19 Jun
 2025 14:24:38 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 14:24:37 +0000
Date: Thu, 19 Jun 2025 15:24:35 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        Kees Cook <kees@kernel.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vma: use vmg->target to specify target VMA for new
 VMA merge
Message-ID: <85378739-d71e-4ccc-a46e-c6cc72915f04@lucifer.local>
References: <20250613184807.108089-1-lorenzo.stoakes@oracle.com>
 <7a1d94ca-65a1-4b60-83a7-055c69d5c882@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a1d94ca-65a1-4b60-83a7-055c69d5c882@suse.cz>
X-ClientProxiedBy: LO4P123CA0462.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPF5467E3597:EE_
X-MS-Office365-Filtering-Correlation-Id: 706dbb14-b3a8-4c63-ac4e-08ddaf3d0595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mniK4jSn4a9pujuo3ReT6sCxVJ3q0KSViF5BbpVNd5cgJLGOtxCvI99QImAS?=
 =?us-ascii?Q?3TcJ0qTy6ytRyDBcRHFr1+AApAZHtwAY1AhwFXKPgdcxnivj+QCb1semn021?=
 =?us-ascii?Q?SrP32cBLnWGDfigDNJVsC7mR48slxK1qWi3d/+UM1LZ/SHXYUkUAI2eHRRZ1?=
 =?us-ascii?Q?rvqCOfOFxzHkGJn65JOJ7Cj+Ll/EtKo4mTkT1X4fTn+a4W5USFeJsx+t0eZa?=
 =?us-ascii?Q?M9ceqjwlPFRWwF2bCFRzlkeP2D7kZjJD04NjKVv0u5OSkh/Qfbw84l+MTmyo?=
 =?us-ascii?Q?SwAn5+qsG6dqNQ+BwuN+j8uV4e3vPB+G92TluU1PbSLe7W0sGJWc+lvkWqLf?=
 =?us-ascii?Q?f5OliAe+D2eg7LyXA2IRCe4rciNYUMZv9qqNrU4g3ToCJnWPz0GPsStseQtl?=
 =?us-ascii?Q?aDfEfzWEdw3T/vOR4txZFNY0e9ynCQFbvBQLpSwsH99pCcGYbHJWKg6e6BP6?=
 =?us-ascii?Q?PZNsAtViX5sbMuIIay4SVMxtwZsPsAwtrHRMbHu5eQUUK23SXWIe5q6C4rSC?=
 =?us-ascii?Q?UXSIHspbSnL5C90AXfdhTnY6N0XRM+B2UGfde4YqpqXyJTGcuyc28N81CLLu?=
 =?us-ascii?Q?QMZoS2zD98Y75Fm+fPUtsrL9CkwDR8zfi+Tj62EXEyIfhnuPTfdYEppvCbcg?=
 =?us-ascii?Q?LRGbCx1snfaeTSAb6Qliu+IbpVaqLn6l1OmOpWicH7o+LvbNWh0ODfiaCEnP?=
 =?us-ascii?Q?5NwasrIf4tJVJ2KtftS5xIWfW/Rt8cz0k6uWqX5hVfIfcs6XBQqD0+Y+/L2W?=
 =?us-ascii?Q?HPyZ3YQgh/Thogm+6ZAqR9L80BG5A3UfKq6eDzZbn9y1EaMQRMOAZkdi+cWU?=
 =?us-ascii?Q?G+pWagWmt/2kXvPjW2C4JiEX463zUYs9GXRHpJni8Z/nxoOLOkDAv/DJUlpu?=
 =?us-ascii?Q?kYVpgHJsh9fWnKiq6xRkm6ueWrN5Uyba2ouLyqJFLUOgvf8my1ahjWbS94yo?=
 =?us-ascii?Q?eclny6rsjNypATsqFzvTpmSilhMuVBIYLGFCGZCWIcOA1LBHZDvAjvqBtCI+?=
 =?us-ascii?Q?M1eRH8/+N1qYXqokr7xp9ttDqaY6hm1MSNfK9cRW/ImwttdKbfjTdI+v7EIH?=
 =?us-ascii?Q?ZCu525IFHfuSCYGzHsr7ANpbWyJbaYZi5Illffop692vheX+Yy5MjHNPXiyC?=
 =?us-ascii?Q?HxxCfhUTBF/TUlUIpzxJl167hiGGKMWFDI3Ww5hCAmpPBq/+IyBUuzGkPoox?=
 =?us-ascii?Q?HYGJzn8pAraPpat9+h+yAPr4iTeGvIEqkR0Vke9DIWZAhKhuxmGpOgZrO/MD?=
 =?us-ascii?Q?gX7TBdUmyYB8/CH8MqEDMUQwZP9oTrXnFPwKWsWMUDOTxZh4MOQkx2yYQtE/?=
 =?us-ascii?Q?vxUHzMYTIilD6X+8MAll38xRr+ZUNIdvqx4yL8gWdVT+NaP9lVNPl2GaG2Fq?=
 =?us-ascii?Q?8MhGu2PYCEeVJSuJkbewClwI7yE5vc9UYqxOv2Dipsj86QYI+nYLfxJS8faE?=
 =?us-ascii?Q?d6sGWYWhLMY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m5p5MajTDJXhU6tK9EII07ygh37r25wd6eJ5pj3Ny1TVjehvlGB+2tIIuV5t?=
 =?us-ascii?Q?WgNejlKzAokJF9f6RTze7wzd4M+va+YaB9rshuoHSSyqNgKe6mEt3oTTXIHS?=
 =?us-ascii?Q?pc+3YvNb6Qp9rCF4UbVuV5nWwzhlVI/5iE6V10bfsHnY2IZDbXnNeRrBlEqm?=
 =?us-ascii?Q?WQt+QhqhfT6mzNzZY5iZnQu6x6NgbNRLVbO7lV/ES1jNPyxwSO0TBpSOmSjA?=
 =?us-ascii?Q?jL6bDN3NY3UpGyuLMvWrgOA7E0xGRdv2pjr2io02JbNLlyHenhLOLdSVQR2Y?=
 =?us-ascii?Q?4D0EmRJTIr0ee114l4Ti3NIS8yd9YNR9cIlP2VWoZAAhIcrXT/mV38dp/c6m?=
 =?us-ascii?Q?vaCs/T+mnNZoa8f3z1YJGgieO6yU8j1lJ4bmbPdB267whxex+qYzBSnp5d7C?=
 =?us-ascii?Q?PS6GePO1TJfHOgZ9+rp0L63IjRpZEPQ2Cy3fW11xR3T1mvaHqmq1GRPbjCwm?=
 =?us-ascii?Q?tb9hstNU2Rtc0AMILIgSXgh2E45FQjUONp45FMl9H1uEuS0EQvnD9zaLlvIu?=
 =?us-ascii?Q?v3cNRFPhMxihsSYmU5SLaoO0jFtJZdjr5haRxtZQCQXMTkX9m24VIbmB1+mD?=
 =?us-ascii?Q?GiK4Wg5azzCUevM7lLs6nsjo+x73xwgSG7tBj2wriGtAFvyrWUkQqfI6EWMG?=
 =?us-ascii?Q?K/pnWK8m6WuKDLzVWsg+n/adwFRF9rASyQ8dKFjQ/u6XXtHB7G2mCJmfakKD?=
 =?us-ascii?Q?giIWEfIM1cQB/Xm5HMDtGZDL0xXBG1sOiFDu+B/xgs490y7sCiFWp5piwX12?=
 =?us-ascii?Q?4XB6AUU4BZ8Ud09sro3ScK52h+MhkwEGWfdhEntHTtbz8U0B1Te+9n/e3rnz?=
 =?us-ascii?Q?VxuAPPv/5VQ2818TkL2ifyGKguXc5g5Xf4KXlwcgFnR1afIE8ir6ABcRxDCD?=
 =?us-ascii?Q?md2Y2pVUHqNgqpetV2v4iWB2ATk9agH86yEZ329QuH9HjkPFOy9cKa8+4a+1?=
 =?us-ascii?Q?HQ1RUOhxUkeAQdLKNZ4q92alORpSwgaM4M0O8BPYnAdRQWlOVW/+qyDlIA4l?=
 =?us-ascii?Q?b7tnLSjDDTU2+rIwCJgQBhEEJb3TyFl2LgRjnFd/o+u4z3AcGooAUTF4UHdK?=
 =?us-ascii?Q?TzSEuKw+s+591khv+4UhdUYGw7rNPQl2KLo7pT6WL7V9KREJy4fHpVDlVZr9?=
 =?us-ascii?Q?kHZcbuIMC9HxLHZC4YbxQr9wlwlE5zamFjJ/+GMAzZezn+byt8McuQIi/Eez?=
 =?us-ascii?Q?rki/1deado51mHKAO0ZPDXmTYEHLTSklQX2xGTi4C+q4y6ARc/ceZ7smN+mU?=
 =?us-ascii?Q?arv4uf0avMjDsTLHREFV2A+MdZH6gdBZ12du8DTm37mH8YgEtJ89ebwDLA8X?=
 =?us-ascii?Q?+k0Qu8bynbq4Th+8oKUOSOAwLM8womBt086lsWV/eSwoB8tyjFcb49Ow9Wax?=
 =?us-ascii?Q?4yuSLwmKc+vXuruqgg2D75z8vuhu+vs4utR2Em7ANMOXnzzqmMvj+qyqwA9k?=
 =?us-ascii?Q?z0LXR/WPYt4ksg2O4IMGg4YLPkEvNGibIX9zYBmFF03tNXz+FnaT0J8byIh8?=
 =?us-ascii?Q?Ph6Qvnq+aw2vE8SHMC9I4NNj8wQdQYt/mpZ0gKMusFxexkF8Y83+LMIscnCl?=
 =?us-ascii?Q?ZCRcovrpu1GK08SpHUPUykzjXKhisCBGdQ/TRNdfS09GmDVUcXyq2q50Yl0L?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c9c2gcnleWfQLOSe6spJTu3PCJG/T10xDjA55Ik6mXeFLCoYqgr/lXaCYKgq4lbdnGxa42xHlzcMVVnWM8oLYLz30fXTTWTYaUMWTPhet/xNqHXdkWUUMybsZmf2opzk5WHuZM9aTyvUp65MYQkubD7VpHzXMIrElQL5utfqnrdVGLOHtvN+vXx0Jlg9veTnLlyaEWhz2/9lF9EFnRf4x1Btj5Yk4H4VoNs1MQdXgrcjvIgFYUnospzEl26HJU6zDvyu/NO6PcOL8cx0rCg/rN4ahYP44TQOIWKWTTMr3AVqQB0AW4lyRWDGyJd/dRsuSxFl0uyNGVsXLt2OTof98vL6JPXMIWZ2aG7+7Aq+OOjTf/5tUSEM0/ca2lCPJAvxeR1DDrODITYnx304tN6ZACyyD/6rje+PxkRJaLh0IEYPrSzup/tOUlvwMAhOOxBH6vnEoDKGdf82Ey46UGWI6lur6NHTcLZj0rF/L7l4OgOpHMMrefHXjWw4vzO/y7Wi/v+IrVr3YgJ3OVedt3c51e3tNwa9BScd6ZO6c/sJkU3gDxyILW0EIqJoK+DmgXM2XgP24fM2Nep/GU4aIR4aMfliA7K+dnywcvDHI+62w9U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706dbb14-b3a8-4c63-ac4e-08ddaf3d0595
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 14:24:37.8861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZLmbZf+4HMrotZXaIO4UqPBzRE4yUfwTDLhCch8nHgTMWxf4K36KrycIEO0VAe3Oj33IwXM26c58Z6G/ALZeokCg7Z6mMO9wzhVrcdasRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5467E3597
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190119
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=68541da9 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=knatuOqrZCrxvZI24sQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: BnARxhW6csRvRK179D9aCXuP553Y8xOP
X-Proofpoint-GUID: BnARxhW6csRvRK179D9aCXuP553Y8xOP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDExOSBTYWx0ZWRfX8AOaZyLTqChW raZMilCs2OW3hzpNYCQm7DcyshjvcNsQPxNFGYxsd9NM3DNd1M0VI2aNEJQeaI8K+ArVY26ZPvn oGSbrgwGT3zbdJgVYLrcMMks36eGAfCsd2TlweNqxDino+zHCNJCgYbvaje1VqlP1x6+fW8p258
 zZ9grWP51tXkQcuBSDUad7Pt1GIbXGxopkEV66vb0g97w4ixi8V7+gHe+i/AP4FUTYrD4TVGNIQ b4jur4uopq2coa2ATU//k4ASLk340KhpGDsN+8Fya2W1jrJapNoNbIgxBP59aiYJAydRTTwG1xu TAMe+g1Yalq80itOZMaJ3dP/blurTXWJchjNxtlBDK2malwkg7HOOXgjrlhOiDFQftJSh1XE5ZR
 mc2XpQAPMafQXOjUMAzDNOzzXJ0CLt0adS2k2c5ZGJPxMeqm0SDhYhDcvmsO3+IU+oer/7W4

On Thu, Jun 19, 2025 at 03:44:21PM +0200, Vlastimil Babka wrote:
> On 6/13/25 20:48, Lorenzo Stoakes wrote:
> > In commit 3a75ccba047b ("mm: simplify vma merge structure and expand
> > comments") we introduced the vmg->target field to make the merging of
> > existing VMAs simpler - clarifying precisely which VMA would eventually
> > become the merged VMA once the merge operation was complete.
> >
> > New VMA merging did not get quite the same treatment, retaining the rather
> > confusing convention of storing the target VMA in vmg->middle.
> >
> > This patch corrects this state of affairs, utilising vmg->target for this
> > purpose for both vma_merge_new_range() and also for vma_expand().
> >
> > We retain the WARN_ON for vmg->middle being specified in
> > vma_merge_new_range() as doing so would make no sense, but add an
> > additional debug assert for setting vmg->target.
> >
> > This patch additionally updates VMA userland testing to account for this
> > change.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

Thanks!

>
> Nit below:
>
> > @@ -1086,27 +1087,29 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
> >   * @vmg: Describes a VMA expansion operation.
> >   *
> >   * Expand @vma to vmg->start and vmg->end.  Can expand off the start and end.
> > - * Will expand over vmg->next if it's different from vmg->middle and vmg->end ==
> > - * vmg->next->vm_end.  Checking if the vmg->middle can expand and merge with
> > + * Will expand over vmg->next if it's different from vmg->target and vmg->end ==
> > + * vmg->next->vm_end.  Checking if the vmg->target can expand and merge with
> >   * vmg->next needs to be handled by the caller.
> >   *
> >   * Returns: 0 on success.
> >   *
> >   * ASSUMPTIONS:
> > - * - The caller must hold a WRITE lock on vmg->middle->mm->mmap_lock.
> > - * - The caller must have set @vmg->middle and @vmg->next.
> > + * - The caller must hold a WRITE lock on vmg->target->mm->mmap_lock.
>
> The assert uses vmg->mm so maybe the comment should do the same? (IIRC mm
> was added only later to vmg?)

Haha you are the master of spotting stuff like this :)

Yeah you're right, this was actually updated for vma_merge_new_range() and
vma_merge_existing_range(), but missed this one.

Since we're updating it we may as well fix it, will send a fix-patch at
top-level :>)

>
> > + * - The caller must have set @vmg->target and @vmg->next.
